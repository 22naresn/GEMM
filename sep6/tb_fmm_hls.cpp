// Testbench for fmm_hls_greedy_potential kernel with debug buffer.
// prints full matrices, prints per-iteration traces and compares kernel vs CPU.

#include <iostream>
#include <vector>
#include <cstdlib>
#include <cstdint>
#include <cassert>
#include <iomanip>
#include <random>

using namespace std;

// Simulator/AXI depths — MUST match the pragma 'depth=' values in the kernel
constexpr int SIM_A_DEPTH = 65536;    // 256 * 256)
constexpr int SIM_DEBUG_DEPTH = 4096; // debug buffer

// Kernel prototype 
extern "C" {
void fmm_reduce_kernel(volatile int *A_dram,
                       int rows,
                       int cols,
                       int t_capacity,
                       int k1,
                       int k2,
                       int verbose,
                       volatile int *debug_dram,
                       int debug_capacity);
}

// ---------- CPU reference implementation ----------
struct MatCPU {
    int rows;
    int cols;
    int t;
    int t_capacity;
    vector<vector<int32_t>> e; // storage size rows + t_capacity by cols + t_capacity
    void init(int r, int c, int tc) {
        rows = r; cols = c; t = 0; t_capacity = tc;
        e.assign(rows + t_capacity, vector<int32_t>(cols + t_capacity, 0));
    }
    inline int32_t entry(int r, int c) const { return e[r][c]; }
    inline void set(int r, int c, int32_t v) { e[r][c] = v; }
};

int column_weight_cpu(const MatCPU &M, int col_idx) {
    int total_rows = M.rows + M.t;
    int cnt = 0;
    for (int r = 0; r < total_rows; ++r) if (M.e[r][col_idx] != 0) ++cnt;
    return cnt;
}
int num_additions_cpu(const MatCPU &M) {
    int total_cols = M.cols + M.t;
    int s = 0;
    for (int c = 0; c < total_cols; ++c) {
        int w = column_weight_cpu(M, c);
        s += (w > 0) ? (w - 1) : 0;
    }
    return s;
}

void compute_pp_nn_cpu(const MatCPU &M, int r1, int r2, int &pp, int &nn) {
    pp = 0; nn = 0;
    int cols_non_t = M.cols;
    for (int c = 0; c < cols_non_t; ++c) {
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
    int R = M.rows + M.t;
    int s = 0;
    for (int i = 0; i < R; ++i) {
        for (int j = i+1; j < R; ++j) {
            int p=0,n=0;
            compute_pp_nn_cpu(M, i, j, p, n);
            if (p > 1) s += (p - 1);
            if (n > 1) s += (n - 1);
        }
    }
    return s;
}

int compute_greedy_potential_score_cpu(MatCPU &M, int r1, int r2, int sign, int k1, int k2) {
    int p=0,n=0;
    compute_pp_nn_cpu(M, r1, r2, p, n);
    int overlap = (sign == 1) ? p : n;
    if (overlap < 2) return 0;
    int score = k1 * overlap;
    if (k2 != 0) {
        reduction_move_cpu(M, r1, r2, sign);
        int pot = total_potential_cpu(M);
        reduction_move_undo_cpu(M);
        score += k2 * pot;
    }
    return score;
}

int find_best_move_cpu(MatCPU &M, int &out_r1, int &out_r2, int &out_sign, int k1, int k2) {
    int best_score = 0;
    int R = M.rows + M.t;
    for (int i = 0; i < R; ++i) {
        for (int j = i+1; j < R; ++j) {
            int p=0,n=0;
            compute_pp_nn_cpu(M, i, j, p, n);
            if (p >= 2) {
                int s = compute_greedy_potential_score_cpu(M, i, j, 1, k1, k2);
                if (s > best_score) { best_score = s; out_r1 = i; out_r2 = j; out_sign = 1; }
            }
            if (n >= 2) {
                int s = compute_greedy_potential_score_cpu(M, i, j, -1, k1, k2);
                if (s > best_score) { best_score = s; out_r1 = i; out_r2 = j; out_sign = -1; }
            }
        }
    }
    return best_score;
}

void greedy_potential_reduce_cpu_with_trace(MatCPU &M, int k1, int k2, vector<int> &trace_out) {
    // initial record
    trace_out.push_back(0);
    trace_out.push_back(-1);
    trace_out.push_back(-1);
    trace_out.push_back(0);
    trace_out.push_back(num_additions_cpu(M));
    int iter = 0;
    while (true) {
        int r1=0,r2=0,sign=0;
        int best = find_best_move_cpu(M, r1, r2, sign, k1, k2);
        if (best < 2) break;
        reduction_move_cpu(M, r1, r2, sign);
        ++iter;
        trace_out.push_back(iter);
        trace_out.push_back(r1);
        trace_out.push_back(r2);
        trace_out.push_back(sign);
        trace_out.push_back(num_additions_cpu(M));
        if (iter > (M.rows + M.t + 5) * 10) break;
    }
}

// ---------- Flatten/unflatten ----------
void flatten_from_matcpu(const MatCPU &M, vector<int32_t> &buf) {
    buf.assign(M.rows * M.cols, 0);
    for (int r = 0; r < M.rows; ++r)
        for (int c = 0; c < M.cols; ++c)
            buf[r * M.cols + c] = M.entry(r, c);
}
void unflatten_to_matcpu(const vector<int32_t> &buf, MatCPU &M) {
    assert((int)buf.size() == M.rows * M.cols);
    for (int r = 0; r < M.rows; ++r)
        for (int c = 0; c < M.cols; ++c)
            M.set(r, c, buf[r * M.cols + c]);
}

void print_full_matrix(const MatCPU &M, const string &label) {
    cout << label << " (rows=" << M.rows << " cols=" << M.cols << " t=" << M.t << " tcap=" << M.t_capacity << ")\n";
    for (int r = 0; r < M.rows; ++r) {
        for (int c = 0; c < M.cols; ++c) {
            cout << setw(5) << M.entry(r,c);
        }
        cout << "\n";
    }
    cout << flush;
}

// ---------- Tests ----------
void build_handcrafted(MatCPU &M) {
    M.init(6, 8, 64);
    M.set(0,0,1); M.set(1,0,1);
    M.set(0,1,2); M.set(1,1,2);
    M.set(0,2,3); M.set(1,2,3);
    M.set(2,3,4); M.set(3,3,-4);
    M.set(2,4,1); M.set(3,4,-1);
    M.set(2,5,2); M.set(3,5,-2);
    M.set(4,6,7);
    M.set(5,7,9);
}
void build_random(MatCPU &M, int rows, int cols, int seed=12345, int vmax=5, double sparsity=0.85) {
    M.init(rows, cols, 64);
    std::mt19937 rng(seed);
    std::uniform_real_distribution<> p(0.0,1.0);
    std::uniform_int_distribution<int> val(-vmax, vmax);
    for (int r=0;r<rows;r++){
        for (int c=0;c<cols;c++){
            if (p(rng) > sparsity) {
                int32_t v=0;
                while ((v = val(rng)) == 0) {}
                M.set(r,c,v);
            }
        }
    }
}

// ---------- TB main ----------
int main() {
    cout << "TB debug: full-matrix + per-iteration trace comparison\n";

    const int T_CAP = 64;
    const int K1 = 5;
    const int K2 = 1;
    // make runtime debug capacity match simulator depth
    const int DEBUG_CAPACITY = SIM_DEBUG_DEPTH; 

    vector<MatCPU> tests;
    MatCPU a; build_handcrafted(a); tests.push_back(a);
    MatCPU b; build_random(b, 16, 32, 2023, 6, 0.9); tests.push_back(b);

    int tid = 0;
    for (auto &mat : tests) {
        cout << "\n=== Test " << tid << " ===\n";

        print_full_matrix(mat, "Original");

        int before = num_additions_cpu(mat);
        cout << "CPU initial additions = " << before << "\n";

        // flatten original small matrix into a compact buffer
        vector<int32_t> dram(mat.rows * mat.cols);
        flatten_from_matcpu(mat, dram);

        // Create kernel DRAM buffer sized to the compile-time AXI depth
        // Fill first rows*cols words with the flattened matrix, zero the rest.
        vector<int32_t> dram_for_kernel(SIM_A_DEPTH, 0);
        for (size_t i = 0; i < dram.size(); ++i) dram_for_kernel[i] = dram[i];

        // Debug buffer sized to the AXI debug depth
        vector<int> debug_kern(SIM_DEBUG_DEPTH, -1);

        // Run kernel
        fmm_reduce_kernel((volatile int*)dram_for_kernel.data(),
                          mat.rows, mat.cols, T_CAP, K1, K2, 0,
                          (volatile int*)debug_kern.data(), DEBUG_CAPACITY);

        // Run CPU ref and capture the trace
        MatCPU ref; ref.init(mat.rows, mat.cols, T_CAP); unflatten_to_matcpu(dram, ref);
        vector<int> debug_cpu;
        greedy_potential_reduce_cpu_with_trace(ref, K1, K2, debug_cpu);

        // Unpack kernel debug buffer into vector<int>
        vector<int> kern_trace;
        // kernel wrote records: rec_size=5
        int rec_size = 5;
        int rec_capacity = DEBUG_CAPACITY / rec_size;
        for (int r=0;r<rec_capacity;r++){
            int base = r*rec_size;
            if (debug_kern[base] == -1) break; // no more records
            for (int k=0;k<rec_size;k++) kern_trace.push_back(debug_kern[base + k]);
        }

        // Print full kernel output matrix 
        MatCPU kern; kern.init(mat.rows, mat.cols, T_CAP);
        for (int r = 0; r < mat.rows; ++r) {
            for (int c = 0; c < mat.cols; ++c) {
                kern.set(r, c, dram_for_kernel[r * mat.cols + c]);
            }
        }

        print_full_matrix(kern, "Kernel output (original region)");
        print_full_matrix(ref, "CPU reference (original region + t-space might be present in ref)");

        int after_cpu = num_additions_cpu(ref);
        cout << "CPU final additions = " << after_cpu << "\n";

        // Print traces
        cout << "\nKernel trace (iter,r1,r2,sign,adds):\n";
        for (size_t i=0;i<kern_trace.size(); i+=5) {
            cout << "(" << kern_trace[i] << "," << kern_trace[i+1] << "," << kern_trace[i+2] << "," << kern_trace[i+3] << "," << kern_trace[i+4] << ")\n";
        }
        cout << "\nCPU trace (iter,r1,r2,sign,adds):\n";
        for (size_t i=0;i<debug_cpu.size(); i+=5) {
            cout << "(" << debug_cpu[i] << "," << debug_cpu[i+1] << "," << debug_cpu[i+2] << "," << debug_cpu[i+3] << "," << debug_cpu[i+4] << ")\n";
        }

        // Compare traces and final original-region matrices
        bool trace_eq = (kern_trace.size() == debug_cpu.size());
        if (trace_eq) {
            for (size_t i=0;i<kern_trace.size(); ++i) {
                if (kern_trace[i] != debug_cpu[i]) { trace_eq = false; break; }
            }
        }
        if (trace_eq) cout << "\nTRACE MATCH: kernel and CPU have identical per-iteration sequences.\n";
        else cout << "\nTRACE MISMATCH: kernel vs CPU sequences differ.\n";

        bool matrix_eq = true;
        for (int r=0;r<mat.rows && matrix_eq;r++){
            for (int c=0;c<mat.cols;c++){
                if (kern.entry(r,c) != ref.entry(r,c)) { matrix_eq = false; break; }
            }
        }
        if (matrix_eq) cout << "MATRIX MATCH: kernel original-region equals CPU original-region.\n";
        else cout << "MATRIX MISMATCH: kernel original-region differs from CPU original-region.\n";

        ++tid;
    }

    cout << "\nAll tests completed.\n";
    return 0;
}
