// Greedy-with-potential HLS kernel (functionality preserved, ASIC-safer)

#include <ap_int.h>
#include <stdint.h>

/////////////////////
// Configuration
/////////////////////

constexpr int MAX_ORIG_ROWS = 256;
constexpr int MAX_ORIG_COLS = 256;
constexpr int MAX_TCAP      = 64;
constexpr int MAX_TOTAL_ROWS = MAX_ORIG_ROWS + MAX_TCAP;
constexpr int MAX_TOTAL_COLS = MAX_ORIG_COLS + MAX_TCAP;

constexpr int MAX_A_DEPTH = MAX_ORIG_ROWS * MAX_ORIG_COLS;

// shrink datatype (values in {-1,0,1})
typedef ap_int<8> elem_t;

struct Matrix {
    int rows;
    int cols;
    int t;
    int t_capacity;
    elem_t e[MAX_TOTAL_ROWS][MAX_TOTAL_COLS];
};

////////////////////////////////////////////////////////////
// Load / Store
////////////////////////////////////////////////////////////

static void load_matrix_from_dram(
    const int32_t *A,
    Matrix &M,
    int rows,
    int cols,
    int tcap
) {
#pragma HLS INLINE off

    M.rows = rows;
    M.cols = cols;
    M.t = 0;
    M.t_capacity = tcap;

    int R = rows + tcap;
    int C = cols + tcap;

    // clear only active region
    for (int r = 0; r < R; r++)
        for (int c = 0; c < C; c++) {
#pragma HLS PIPELINE II=1
            M.e[r][c] = 0;
        }

    for (int r = 0; r < rows; r++)
        for (int c = 0; c < cols; c++) {
#pragma HLS PIPELINE II=1
            M.e[r][c] = (elem_t)A[r*cols + c];
        }
}

static void store_matrix_to_dram(
    int32_t *A,
    const Matrix &M
) {
#pragma HLS INLINE off

    for (int r = 0; r < M.rows; r++)
        for (int c = 0; c < M.cols; c++) {
#pragma HLS PIPELINE II=1
            A[r*M.cols + c] = (int32_t)M.e[r][c];
        }
}

////////////////////////////////////////////////////////////
// Core Computations
////////////////////////////////////////////////////////////

static void compute_pp_nn(
    const Matrix &M,
    int r1,
    int r2,
    int &pp,
    int &nn
) {
#pragma HLS INLINE
    pp = 0; nn = 0;

    for (int c = 0; c < M.cols; c++) {
#pragma HLS PIPELINE II=1
        elem_t a = M.e[r1][c];
        elem_t b = M.e[r2][c];
        if (a == 0 || b == 0) continue;
        if (a == b)       pp++;
        else if (a == -b) nn++;
    }
}

////////////////////////////////////////////////////////////
// Reduction move / undo
////////////////////////////////////////////////////////////

static void reduction_move(Matrix &M, int r1, int r2, int sign) {
#pragma HLS INLINE

    if (M.t >= M.t_capacity) return;

    int new_col = M.cols + M.t;
    int new_row = M.rows + M.t;

    M.e[r1][new_col] = 1;
    M.e[r2][new_col] = (sign == 1) ? 1 : -1;

    int EC = M.cols + M.t;

    for (int c = 0; c < EC; c++) {
#pragma HLS PIPELINE II=1
        elem_t a = M.e[r1][c];
        elem_t b = M.e[r2][c];
        if (a == 0 || b == 0) continue;

        if ((sign==1  && a==b) ||
            (sign==-1 && a==-b)) {
            M.e[r1][c] = 0;
            M.e[r2][c] = 0;
            M.e[new_row][c] = a;
        }
    }
    M.t++;
}

static void reduction_move_undo(Matrix &M) {
#pragma HLS INLINE

    if (M.t <= 0) return;

    int t_old = M.t - 1;
    int rowt = M.rows + t_old;
    int colt = M.cols + t_old;

    int r1=-1, r2=-1, sign=0;

    for (int r=0;r<rowt;r++)
        if (M.e[r][colt]==1){ r1=r; break; }

    for (int r=rowt-1;r>r1;r--)
        if (M.e[r][colt]!=0){
            r2=r; sign=M.e[r][colt]; break;
        }

    if (r1<0 || r2<0) return;

    M.e[r1][colt]=0;
    M.e[r2][colt]=0;

    for (int c=0;c<colt;c++) {
#pragma HLS PIPELINE II=1
        elem_t v=M.e[rowt][c];
        if(v==0) continue;
        M.e[rowt][c]=0;
        M.e[r1][c]=v;
        M.e[r2][c] = (sign == 1) ? v : (elem_t)(-v);
    }
    M.t--;
}

////////////////////////////////////////////////////////////
// Potential
////////////////////////////////////////////////////////////

static int total_potential(const Matrix &M) {
#pragma HLS INLINE

    int R=M.rows+M.t;
    int s=0;

    for(int i=0;i<R;i++)
        for(int j=i+1;j<R;j++){
#pragma HLS PIPELINE II=1
            int p=0,n=0;
            compute_pp_nn(M,i,j,p,n);
            if(p>1) s+=p-1;
            if(n>1) s+=n-1;
        }
    return s;
}

static int compute_score(
    Matrix &M,
    int r1,int r2,int sign,
    int k1,int k2
){
#pragma HLS INLINE

    int p=0,n=0;
    compute_pp_nn(M,r1,r2,p,n);
    int overlap=(sign==1)?p:n;
    if(overlap<2) return 0;

    int score=k1*overlap;

    if(k2!=0){
        reduction_move(M,r1,r2,sign);
        int pot=total_potential(M);
        reduction_move_undo(M);
        score+=k2*pot;
    }
    return score;
}

////////////////////////////////////////////////////////////
// Search
////////////////////////////////////////////////////////////

static int find_best_move(
    Matrix &M,
    int &r1,int &r2,int &sign,
    int k1,int k2
){
#pragma HLS INLINE

    int best=0;
    int R=M.rows+M.t;

    for(int i=0;i<R;i++)
        for(int j=i+1;j<R;j++){
#pragma HLS PIPELINE II=1
            int s;

            s=compute_score(M,i,j,1,k1,k2);
            if(s>best){best=s;r1=i;r2=j;sign=1;}

            s=compute_score(M,i,j,-1,k1,k2);
            if(s>best){best=s;r1=i;r2=j;sign=-1;}
        }
    return best;
}

////////////////////////////////////////////////////////////
// Main greedy loop
////////////////////////////////////////////////////////////

static void greedy_reduce(Matrix &M,int k1,int k2){
#pragma HLS INLINE off

    while(true){
        int r1=0,r2=0,sign=0;
        int best=find_best_move(M,r1,r2,sign,k1,k2);
        if(best<2) break;
        reduction_move(M,r1,r2,sign);
    }
}

////////////////////////////////////////////////////////////
// Top-level kernel
////////////////////////////////////////////////////////////

extern "C" void fmm_reduce_kernel(
    volatile int *A_dram,
    int rows,
    int cols,
    int t_capacity,
    int k1,
    int k2
){
#pragma HLS INTERFACE m_axi port=A_dram offset=slave bundle=gmem depth=MAX_A_DEPTH
#pragma HLS INTERFACE s_axilite port=rows bundle=control
#pragma HLS INTERFACE s_axilite port=cols bundle=control
#pragma HLS INTERFACE s_axilite port=t_capacity bundle=control
#pragma HLS INTERFACE s_axilite port=k1 bundle=control
#pragma HLS INTERFACE s_axilite port=k2 bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    static Matrix M;

    int words=rows*cols;
    if(words<=0||words>MAX_A_DEPTH) return;

    load_matrix_from_dram((const int32_t*)A_dram,M,rows,cols,t_capacity);
    greedy_reduce(M,k1,k2);
    store_matrix_to_dram((int32_t*)A_dram,M);
}
