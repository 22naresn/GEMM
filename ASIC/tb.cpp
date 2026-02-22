// Testbench for fmm_reduce_kernel (no debug buffer version).
// Compares kernel output matrix and final addition count against CPU reference.

#include <iostream>
#include <vector>
#include <cstdint>
#include <cassert>
#include <iomanip>
#include <random>

using namespace std;

// Must match MAX_A_DEPTH in the kernel
constexpr int SIM_A_DEPTH = 65536; // 256 * 256

// Kernel prototype
extern "C" {
void fmm_reduce_kernel(int32_t *A_dram,
                       int rows,
                       int cols,
                       int t_capacity,
                       int k1,
                       int k2);
}

// ─────────────────────────────────────────────
// CPU reference implementation
// ─────────────────────────────────────────────
struct MatCPU {
    int rows, cols, t, t_capacity;
    vector<vector<int32_t>> e;
    void init(int r, int c, int tc) {
        rows = r; cols = c; t = 0; t_capacity = tc;
        e.assign(rows + t_capacity, vector<int32_t>(cols + t_capacity, 0));
    }
    inline int32_t entry(int r, int c) const { return e[r][c]; }
    inline void set(int r, int c, int32_t v) { e[r][c] = v; }
};

int column_weight_cpu(const MatCPU &M, int col_idx) {
    int cnt = 0;
    for (int r = 0; r < M.rows + M.t; ++r)
        if (M.e[r][col_idx] != 0) ++cnt;
    return cnt;
}

int num_additions_cpu(const MatCPU &M) {
    int s = 0;
    for (int c = 0; c < M.cols + M.t; ++c) {
        int w = column_weight_cpu(M, c);
        s += (w > 0) ? (w - 1) : 0;
    }
    return s;
}

// Count additions only within the original rows x cols region.
// Used to compare the kernel output (which only stores back the original region)
// against the CPU reference on equal footing.
int num_additions_original_region(const MatCPU &M) {
    int s = 0;
    for (int c = 0; c < M.cols; ++c) {
        int cnt = 0;
        for (int r = 0; r < M.rows; ++r)
            if (M.e[r][c] != 0) ++cnt;
        s += (cnt > 0) ? (cnt - 1) : 0;
    }
    return s;
}

void compute_pp_nn_cpu(const MatCPU &M, int r1, int r2, int &pp, int &nn) {
    pp = 0; nn = 0;
    for (int c = 0; c < M.cols; ++c) {
        int32_t e1 = M.entry(r1, c);
        if (e1 == 0) continue;
        int32_t e2 = M.entry(r2, c);
        if (e2 == 0) continue;
        if (e1 == e2) ++pp;
        else if (e1 == -e2) ++nn;
    }
}

void reduction_move_cpu(MatCPU &M, int row1, int row2, int move_type) {
    if (M.t >= M.t_capacity) return;
    int new_col = M.cols + M.t;
    int new_row = M.rows + M.t;
    M.set(row1, new_col, 1);
    M.set(row2, new_col, move_type == 1 ? 1 : -1);
    int existing_cols = M.cols + M.t;
    for (int c = 0; c < existing_cols; ++c) {
        int32_t e1 = M.entry(row1, c);
        if (e1 == 0) continue;
        int32_t e2 = M.entry(row2, c);
        if (e2 == 0) continue;
        if ((move_type == 1 && e1 == e2) || (move_type == -1 && e1 == -e2)) {
            M.set(row1, c, 0);
            M.set(row2, c, 0);
            M.set(new_row, c, e1);
        }
    }
    M.t += 1;
}

void reduction_move_undo_cpu(MatCPU &M) {
    if (M.t <= 0) return;
    int t_old = M.t - 1;
    int rowt = M.rows + t_old;
    int colt = M.cols + t_old;
    int row1 = -1, row2 = -1, move_type = 0;
    for (int r = 0; r < rowt; ++r) {
        int32_t v = M.entry(r, colt);
        if (v == 0) continue;
        if (v == 1) { row1 = r; break; }
    }
    for (int r = rowt - 1; r > row1; --r) {
        int32_t v = M.entry(r, colt);
        if (v == 0) continue;
        row2 = r;
        move_type = (int) M.entry(r, colt);
        break;
    }
    if (!(row1 >= 0 && row2 > row1 && (move_type == 1 || move_type == -1))) return;
    M.set(row1, colt, 0);
    M.set(row2, colt, 0);
    for (int c = 0; c < colt; ++c) {
        int32_t v = M.entry(rowt, c);
        if (v == 0) continue;
        M.set(rowt, c, 0);
        M.set(row1, c, v);
        M.set(row2, c, move_type == 1 ? v : -v);
    }
    M.t -= 1;
}

int total_potential_cpu(const MatCPU &M) {
    int R = M.rows + M.t, s = 0;
    for (int i = 0; i < R; ++i)
        for (int j = i+1; j < R; ++j) {
            int p=0, n=0;
            compute_pp_nn_cpu(M, i, j, p, n);
            if (p > 1) s += (p - 1);
            if (n > 1) s += (n - 1);
        }
    return s;
}

int compute_greedy_potential_score_cpu(MatCPU &M, int r1, int r2, int sign, int k1, int k2) {
    int p=0, n=0;
    compute_pp_nn_cpu(M, r1, r2, p, n);
    int overlap = (sign == 1) ? p : n;
    if (overlap < 2) return 0;
    int score = k1 * overlap;
    if (k2 != 0) {
        reduction_move_cpu(M, r1, r2, sign);
        score += k2 * total_potential_cpu(M);
        reduction_move_undo_cpu(M);
    }
    return score;
}

int find_best_move_cpu(MatCPU &M, int &out_r1, int &out_r2, int &out_sign, int k1, int k2) {
    int best = 0;
    int R = M.rows + M.t;
    for (int i = 0; i < R; ++i)
        for (int j = i+1; j < R; ++j) {
            int p=0, n=0;
            compute_pp_nn_cpu(M, i, j, p, n);
            if (p >= 2) {
                int s = compute_greedy_potential_score_cpu(M, i, j, 1, k1, k2);
                if (s > best) { best = s; out_r1 = i; out_r2 = j; out_sign = 1; }
            }
            if (n >= 2) {
                int s = compute_greedy_potential_score_cpu(M, i, j, -1, k1, k2);
                if (s > best) { best = s; out_r1 = i; out_r2 = j; out_sign = -1; }
            }
        }
    return best;
}

void greedy_potential_reduce_cpu(MatCPU &M, int k1, int k2) {
    int iter = 0;
    while (true) {
        int r1=0, r2=0, sign=0;
        int best = find_best_move_cpu(M, r1, r2, sign, k1, k2);
        if (best < 2) break;
        reduction_move_cpu(M, r1, r2, sign);
        ++iter;
        if (iter > (M.rows + M.t + 5) * 10) break;
    }
}

// ─────────────────────────────────────────────
// Helpers
// ─────────────────────────────────────────────
void flatten(const MatCPU &M, vector<int32_t> &buf) {
    buf.assign(M.rows * M.cols, 0);
    for (int r = 0; r < M.rows; ++r)
        for (int c = 0; c < M.cols; ++c)
            buf[r * M.cols + c] = M.entry(r, c);
}

// Print only the original rows x cols region (what the kernel writes back).
void print_matrix(const MatCPU &M, const string &label) {
    cout << label << " (rows=" << M.rows << " cols=" << M.cols
         << " t=" << M.t << " tcap=" << M.t_capacity << ")\n";
    for (int r = 0; r < M.rows; ++r) {
        for (int c = 0; c < M.cols; ++c)
            cout << setw(5) << M.entry(r, c);
        cout << "\n";
    }
    cout << flush;
}

// ─────────────────────────────────────────────
// Test matrix builders
// ─────────────────────────────────────────────
void build_handcrafted(MatCPU &M) {
    M.init(6, 8, 64);
    M.set(0,0,1);  M.set(1,0,1);
    M.set(0,1,2);  M.set(1,1,2);
    M.set(0,2,3);  M.set(1,2,3);
    M.set(2,3,4);  M.set(3,3,-4);
    M.set(2,4,1);  M.set(3,4,-1);
    M.set(2,5,2);  M.set(3,5,-2);
    M.set(4,6,7);
    M.set(5,7,9);
}

void build_random(MatCPU &M, int rows, int cols, int seed=12345, int vmax=5, double sparsity=0.85) {
    M.init(rows, cols, 64);
    std::mt19937 rng(seed);
    std::uniform_real_distribution<> p(0.0, 1.0);
    std::uniform_int_distribution<int> val(-vmax, vmax);
    for (int r = 0; r < rows; ++r)
        for (int c = 0; c < cols; ++c)
            if (p(rng) > sparsity) {
                int32_t v = 0;
                while ((v = val(rng)) == 0) {}
                M.set(r, c, v);
            }
}

// All-zero matrix — kernel should make zero moves
void build_zero(MatCPU &M) {
    M.init(4, 4, 64);
    // all entries already 0
}

// Single-row matrix — no pairs possible, zero moves
void build_single_row(MatCPU &M) {
    M.init(1, 8, 64);
    for (int c = 0; c < 8; ++c) M.set(0, c, c + 1);
}

// ─────────────────────────────────────────────
// Run one test: returns true if kernel matches CPU
// ─────────────────────────────────────────────
bool run_test(const string &name, MatCPU &mat, int k1, int k2) {
    const int T_CAP = 64;
    cout << "\n=== " << name << " ===\n";
    print_matrix(mat, "Input");

    int adds_before = num_additions_original_region(mat);
    cout << "Additions before: " << adds_before << "\n";

    // Flatten original matrix into compact buffer
    vector<int32_t> orig;
    flatten(mat, orig);

    // Kernel DRAM buffer — padded to SIM_A_DEPTH
    vector<int32_t> kern_dram(SIM_A_DEPTH, 0);
    for (size_t i = 0; i < orig.size(); ++i) kern_dram[i] = orig[i];

    // Run kernel
    fmm_reduce_kernel(kern_dram.data(), mat.rows, mat.cols, T_CAP, k1, k2);

    // Run CPU reference on a fresh copy
    MatCPU ref;
    ref.init(mat.rows, mat.cols, T_CAP);
    for (int r = 0; r < mat.rows; ++r)
        for (int c = 0; c < mat.cols; ++c)
            ref.set(r, c, orig[r * mat.cols + c]);
    greedy_potential_reduce_cpu(ref, k1, k2);

    // Reconstruct kernel output as MatCPU (original region only)
    MatCPU kern_out;
    kern_out.init(mat.rows, mat.cols, T_CAP);
    for (int r = 0; r < mat.rows; ++r)
        for (int c = 0; c < mat.cols; ++c)
            kern_out.set(r, c, kern_dram[r * mat.cols + c]);

    print_matrix(kern_out, "Kernel output (original region)");
    print_matrix(ref,      "CPU reference (original region)");

    // Both counts measured on original region only — the kernel only writes back
    // original rows x cols, so the t-space extension is not available for comparison.
    int adds_kern = num_additions_original_region(kern_out);
    int adds_ref  = num_additions_original_region(ref);
    cout << "Additions after (original region) — kernel: " << adds_kern
         << "  CPU ref: " << adds_ref << "\n"
         << "CPU full additions (incl. t-space): " << num_additions_cpu(ref) << "\n";

    // Compare original-region entries
    bool matrix_match = true;
    for (int r = 0; r < mat.rows && matrix_match; ++r)
        for (int c = 0; c < mat.cols; ++c)
            if (kern_out.entry(r, c) != ref.entry(r, c)) { matrix_match = false; break; }

    // Final addition count must also match
    bool count_match = (adds_kern == adds_ref);

    if (matrix_match && count_match)
        cout << "PASS: kernel original-region matches CPU reference.\n";
    else {
        if (!matrix_match) cout << "FAIL: original-region matrix mismatch.\n";
        if (!count_match)  cout << "FAIL: addition count mismatch.\n";
    }

    return matrix_match && count_match;
}

// ─────────────────────────────────────────────
// main
// ─────────────────────────────────────────────
int main() {
    cout << "fmm_reduce_kernel testbench\n";

    const int K1 = 5, K2 = 1;
    int pass = 0, fail = 0;

    auto check = [&](const string &n, MatCPU &m, int k1=K1, int k2=K2) {
        if (run_test(n, m, k1, k2)) ++pass; else ++fail;
    };

    MatCPU a; build_handcrafted(a);           check("Handcrafted (k1=5,k2=1)", a);
    MatCPU b; build_random(b, 16, 32, 2023, 6, 0.90); check("Random 16x32 (k1=5,k2=1)", b);
    MatCPU c; build_random(c, 32, 64, 9999, 3, 0.80); check("Random 32x64 (k1=5,k2=1)", c);
    MatCPU d; build_zero(d);                  check("All-zero (k1=5,k2=1)", d);
    MatCPU e; build_single_row(e);            check("Single-row (k1=5,k2=1)", e);

    // Vary hyper-parameters
    MatCPU f; build_handcrafted(f);           check("Handcrafted (k1=1,k2=0)", f, 1, 0);
    MatCPU g; build_random(g, 8, 16, 42, 4, 0.70); check("Random 8x16 (k1=3,k2=2)", g, 3, 2);

    cout << "\n=== Summary: " << pass << " passed, " << fail << " failed ===\n";
    return (fail == 0) ? 0 : 1;
}