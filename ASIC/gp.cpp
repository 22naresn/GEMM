// HLS kernel - greedy potential addition reduction.
// AXI interfaces and debug output removed.

#include <ap_int.h>
#include <stdint.h>

/////////////////////
// Configuration
/////////////////////
constexpr int MAX_ORIG_ROWS = 256;
constexpr int MAX_ORIG_COLS = 256;
constexpr int MAX_TCAP = 64;
constexpr int MAX_TOTAL_ROWS = MAX_ORIG_ROWS + MAX_TCAP;
constexpr int MAX_TOTAL_COLS = MAX_ORIG_COLS + MAX_TCAP;
constexpr int MAX_ITERS = 5000;

constexpr int MAX_A_DEPTH = MAX_ORIG_ROWS * MAX_ORIG_COLS; // 65536

typedef ap_int<32> elem_t;   // matrix values
typedef ap_int<32> score_t;  // scores and potentials

struct Matrix {
    int rows;
    int cols;
    int t;
    int t_capacity;
    elem_t e[MAX_TOTAL_ROWS][MAX_TOTAL_COLS];
};

// === Internal helpers ===
static inline elem_t mat_entry(const Matrix &M, int r, int c) {
#pragma HLS INLINE
    return M.e[r][c];
}
static inline void mat_set_entry(Matrix &M, int r, int c, elem_t v) {
#pragma HLS INLINE
    M.e[r][c] = v;
}

static void load_matrix_from_dram(const int32_t *A_dram, Matrix &M, int rows, int cols, int t_capacity) {
#pragma HLS INLINE off
    M.rows = rows;
    M.cols = cols;
    M.t = 0;
    if (t_capacity > MAX_TCAP)
        M.t_capacity = MAX_TCAP;
    else
        M.t_capacity = t_capacity;
    for (int r = 0; r < MAX_TOTAL_ROWS; ++r) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=320
        for (int c = 0; c < MAX_TOTAL_COLS; ++c) {
//#pragma HLS PIPELINE II=1
            M.e[r][c] = 0;
        }
    }
    for (int r = 0; r < rows; ++r) {
        for (int c = 0; c < cols; ++c) {
//#pragma HLS PIPELINE II=1
            M.e[r][c] = (elem_t) A_dram[r * cols + c];
        }
    }
}

static void store_matrix_to_dram(int32_t *A_dram, const Matrix &M) {
#pragma HLS INLINE off
    int rows = M.rows;
    int cols = M.cols;
    for (int r = 0; r < rows; ++r) {
        for (int c = 0; c < cols; ++c) {
//#pragma HLS PIPELINE II=1
            A_dram[r * cols + c] = (int32_t) M.e[r][c];
        }
    }
}

// === Utilities ===
static inline int column_weight(const Matrix &M, int col_idx) {
#pragma HLS INLINE
    int total_rows = M.rows + M.t;
    int cnt = 0;
    for (int r = 0; r < total_rows; ++r) {
//#pragma HLS PIPELINE II=1
        if (M.e[r][col_idx] != 0) ++cnt;
    }
    return cnt;
}

static inline int num_additions(const Matrix &M) {
#pragma HLS INLINE
    int total_cols = M.cols + M.t;
    int s = 0;
    for (int c = 0; c < total_cols; ++c) {
//#pragma HLS PIPELINE II=1
        int w = column_weight(M, c);
        s += (w > 0) ? (w - 1) : 0;
    }
    return s;
}

static void compute_pp_nn(const Matrix &M, int r1, int r2, int &pp, int &nn) {
#pragma HLS INLINE off
    pp = 0; nn = 0;
    int cols_non_t = M.cols;
    for (int c = 0; c < cols_non_t; ++c) {
//#pragma HLS PIPELINE II=1
        elem_t e1 = M.e[r1][c];
        if (e1 == 0) continue;
        elem_t e2 = M.e[r2][c];
        if (e2 == 0) continue;
        if (e1 == e2) pp++;
        else if (e1 == -e2) nn++;
    }
}

// === Reduction move / undo ===
static void reduction_move(Matrix &M, int row1, int row2, int move_type) {
#pragma HLS INLINE
    if (M.t >= M.t_capacity) return;
    int new_col = M.cols + M.t;
    int new_row = M.rows + M.t;
    M.e[row1][new_col] = 1;
    M.e[row2][new_col] = (move_type == 1) ? 1 : -1;
    int existing_cols = M.cols + M.t;
    for (int c = 0; c < existing_cols; ++c) {
//#pragma HLS PIPELINE II=1
        elem_t e1 = M.e[row1][c];
        if (e1 == 0) continue;
        elem_t e2 = M.e[row2][c];
        if (e2 == 0) continue;
        if ((move_type == 1 && e1 == e2) || (move_type == -1 && e1 == -e2)) {
            M.e[row1][c] = 0;
            M.e[row2][c] = 0;
            M.e[new_row][c] = e1;
        }
    }
    M.t += 1;
}

static void reduction_move_undo(Matrix &M) {
#pragma HLS INLINE
    if (M.t <= 0) return;
    int t_old = M.t - 1;
    int rowt = M.rows + t_old;
    int colt = M.cols + t_old;
    int row1 = -1, row2 = -1; int move_type = 0;
    for (int r = 0; r < rowt; ++r) {
//#pragma HLS PIPELINE II=1
        elem_t v = M.e[r][colt];
        if (v == 0) continue;
        if (v == 1) { row1 = r; break; }
    }
    for (int r = rowt - 1; r > row1; --r) {
//#pragma HLS PIPELINE II=1
        elem_t v = M.e[r][colt];
        if (v == 0) continue;
        row2 = r;
        move_type = (int) M.e[r][colt];
        break;
    }
    if (!(row1 >= 0 && row2 > row1 && (move_type == 1 || move_type == -1))) return;
    M.e[row1][colt] = 0;
    M.e[row2][colt] = 0;
    for (int c = 0; c < colt; ++c) {
//#pragma HLS PIPELINE II=1
        elem_t v = M.e[rowt][c];
        if (v == 0) continue;
        M.e[rowt][c] = 0;
        M.e[row1][c] = v;
        elem_t v2 = (move_type == 1) ? v : (elem_t)(-v);
        M.e[row2][c] = v2;
    }
    M.t -= 1;
}

// === Potential and scoring ===
static score_t total_potential(const Matrix &M) {
#pragma HLS INLINE
    int R = M.rows + M.t;
    int s = 0;
    for (int i = 0; i < R; ++i) {
        for (int j = i+1; j < R; ++j) {
//#pragma HLS PIPELINE II=1
            int p=0,n=0;
            compute_pp_nn(M, i, j, p, n);
            if (p > 1) s += (p - 1);
            if (n > 1) s += (n - 1);
        }
    }
    return s;
}

static score_t compute_greedy_potential_score(Matrix &M, int r1, int r2, int sign, int k1, int k2) {
#pragma HLS INLINE off
    int p=0,n=0;
    compute_pp_nn(M, r1, r2, p, n);
    int overlap = (sign == 1) ? p : n;
    if (overlap < 2) return 0;
    score_t score = k1 * overlap;
    if (k2 != 0) {
        reduction_move(M, r1, r2, sign);
        int pot = total_potential(M);
        reduction_move_undo(M);
        score += k2 * pot;
    }
    return score;
}

static score_t find_best_move(Matrix &M, int &out_r1, int &out_r2, int &out_sign, int k1, int k2) {
#pragma HLS INLINE off
    score_t best_score = 0;
    int R = M.rows + M.t;
    for (int i = 0; i < R; ++i) {
        for (int j = i+1; j < R; ++j) {
//#pragma HLS PIPELINE II=1
            int p=0, n=0;
            compute_pp_nn(M, i, j, p, n);
            if (p >= 2) {
                int s = compute_greedy_potential_score(M, i, j, 1, k1, k2);
                if (s > best_score) { best_score = s; out_r1 = i; out_r2 = j; out_sign = 1; }
            }
            if (n >= 2) {
                int s = compute_greedy_potential_score(M, i, j, -1, k1, k2);
                if (s > best_score) { best_score = s; out_r1 = i; out_r2 = j; out_sign = -1; }
            }
        }
    }
    return best_score;
}

static void greedy_potential_reduce(Matrix &M, int k1, int k2) {
#pragma HLS INLINE off
for (int iter = 0; iter < MAX_ITERS; ++iter) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=MAX_ITERS
    int r1=0, r2=0, sign=0;
    int best = find_best_move(M, r1, r2, sign, k1, k2);
    if (best < 2) break;
    reduction_move(M, r1, r2, sign);
}
}

// === Top-level kernel ===
extern "C" void fmm_reduce_kernel(int32_t *A_dram,
                                  int rows,
                                  int cols,
                                  int t_capacity,
                                  int k1,
                                  int k2) {
    #pragma HLS INTERFACE m_axi     port=A_dram offset=slave bundle=gmem depth=MAX_A_DEPTH

    #pragma HLS INTERFACE s_axilite port=rows       bundle=control
    #pragma HLS INTERFACE s_axilite port=cols       bundle=control
    #pragma HLS INTERFACE s_axilite port=t_capacity bundle=control
    #pragma HLS INTERFACE s_axilite port=k1         bundle=control
    #pragma HLS INTERFACE s_axilite port=k2         bundle=control
    #pragma HLS INTERFACE s_axilite port=return     bundle=control
    #pragma HLS INTERFACE m_axi port=A_dram offset=slave bundle=gmem depth=MAX_A_DEPTH max_read_burst_length=256 max_write_burst_length=256
    #pragma HLS PIPELINE off


    static Matrix M;

    #pragma HLS RESOURCE variable=M.e core=RAM_1P_LUTRAM
    #pragma HLS ARRAY_PARTITION variable=M.e cyclic factor=4 dim=2


        load_matrix_from_dram(A_dram, M, rows, cols, t_capacity);
        greedy_potential_reduce(M, k1, k2);
        store_matrix_to_dram(A_dram, M);
}