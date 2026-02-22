// Stress Testbench for ASIC-sane greedy-with-potential kernel
// Heavy randomized testing against CPU reference

#include <iostream>
#include <vector>
#include <cstdint>
#include <cassert>
#include <random>

using namespace std;

constexpr int SIM_A_DEPTH = 65536; // 256*256

extern "C" {
void fmm_reduce_kernel(volatile int *A_dram,
                       int rows,
                       int cols,
                       int t_capacity,
                       int k1,
                       int k2);
}

////////////////////////////////////////////////////////////
// CPU reference model
////////////////////////////////////////////////////////////

struct MatCPU {
    int rows, cols, t, t_capacity;
    vector<vector<int32_t>> e;

    void init(int r,int c,int tc){
        rows=r; cols=c; t=0; t_capacity=tc;
        e.assign(rows+tc, vector<int32_t>(cols+tc,0));
    }

    inline int32_t entry(int r,int c) const { return e[r][c]; }
    inline void set(int r,int c,int32_t v){ e[r][c]=v; }
};

void compute_pp_nn_cpu(const MatCPU &M,int r1,int r2,int &pp,int &nn){
    pp=0; nn=0;
    for(int c=0;c<M.cols;c++){
        int32_t a=M.entry(r1,c);
        int32_t b=M.entry(r2,c);
        if(a==0||b==0) continue;
        if(a==b) pp++;
        else if(a==-b) nn++;
    }
}

void reduction_move_cpu(MatCPU &M,int r1,int r2,int sign){
    if(M.t>=M.t_capacity) return;
    int new_col=M.cols+M.t;
    int new_row=M.rows+M.t;

    M.set(r1,new_col,1);
    M.set(r2,new_col,(sign==1)?1:-1);

    int EC=M.cols+M.t;
    for(int c=0;c<EC;c++){
        int32_t a=M.entry(r1,c);
        int32_t b=M.entry(r2,c);
        if(a==0||b==0) continue;
        if((sign==1 && a==b) || (sign==-1 && a==-b)){
            M.set(r1,c,0);
            M.set(r2,c,0);
            M.set(new_row,c,a);
        }
    }
    M.t++;
}

void reduction_move_undo_cpu(MatCPU &M){
    if(M.t<=0) return;
    int t_old=M.t-1;
    int rowt=M.rows+t_old;
    int colt=M.cols+t_old;

    int r1=-1,r2=-1,sign=0;
    for(int r=0;r<rowt;r++)
        if(M.entry(r,colt)==1){ r1=r; break; }

    for(int r=rowt-1;r>r1;r--)
        if(M.entry(r,colt)!=0){
            r2=r; sign=M.entry(r,colt); break;
        }

    if(r1<0||r2<0) return;

    M.set(r1,colt,0);
    M.set(r2,colt,0);

    for(int c=0;c<colt;c++){
        int32_t v=M.entry(rowt,c);
        if(v==0) continue;
        M.set(rowt,c,0);
        M.set(r1,c,v);
        M.set(r2,c,(sign==1)?v:-v);
    }
    M.t--;
}

int total_potential_cpu(const MatCPU &M){
    int R=M.rows+M.t;
    int s=0;
    for(int i=0;i<R;i++)
        for(int j=i+1;j<R;j++){
            int p=0,n=0;
            compute_pp_nn_cpu(M,i,j,p,n);
            if(p>1) s+=p-1;
            if(n>1) s+=n-1;
        }
    return s;
}

int compute_score_cpu(MatCPU &M,int r1,int r2,int sign,int k1,int k2){
    int p=0,n=0;
    compute_pp_nn_cpu(M,r1,r2,p,n);
    int overlap=(sign==1)?p:n;
    if(overlap<2) return 0;
    int score=k1*overlap;
    if(k2!=0){
        reduction_move_cpu(M,r1,r2,sign);
        int pot=total_potential_cpu(M);
        reduction_move_undo_cpu(M);
        score+=k2*pot;
    }
    return score;
}

int find_best_move_cpu(MatCPU &M,int &r1,int &r2,int &sign,int k1,int k2){
    int best=0;
    int R=M.rows+M.t;
    for(int i=0;i<R;i++)
        for(int j=i+1;j<R;j++){
            int s;
            s=compute_score_cpu(M,i,j,1,k1,k2);
            if(s>best){best=s;r1=i;r2=j;sign=1;}
            s=compute_score_cpu(M,i,j,-1,k1,k2);
            if(s>best){best=s;r1=i;r2=j;sign=-1;}
        }
    return best;
}

void greedy_reduce_cpu(MatCPU &M,int k1,int k2){
    while(true){
        int r1=0,r2=0,sign=0;
        int best=find_best_move_cpu(M,r1,r2,sign,k1,k2);
        if(best<2) break;
        reduction_move_cpu(M,r1,r2,sign);
    }
}

////////////////////////////////////////////////////////////
// Random generator
////////////////////////////////////////////////////////////

void build_random(MatCPU &M,int rows,int cols,int seed){
    M.init(rows,cols,64);
    mt19937 rng(seed);
    uniform_real_distribution<> p(0.0,1.0);
    uniform_int_distribution<int> val(-5,5);

    for(int r=0;r<rows;r++)
        for(int c=0;c<cols;c++)
            if(p(rng)>0.75){
                int v=0;
                while(v==0) v=val(rng);
                M.set(r,c,v);
            }
}

////////////////////////////////////////////////////////////
// Main
////////////////////////////////////////////////////////////

int main(){

    const int K1=5;
    const int K2=1;
    const int T_CAP=64;

    const int ROWS=64;
    const int COLS=64;
    const int NUM_TESTS=5;

    for(int t=0;t<NUM_TESTS;t++){
        cout<<"\n--- Stress Test "<<t<<" ---\n";

        MatCPU cpu;
        build_random(cpu,ROWS,COLS,100+t);

        vector<int32_t> dram(ROWS*COLS);
        for(int r=0;r<ROWS;r++)
            for(int c=0;c<COLS;c++)
                dram[r*COLS+c]=cpu.entry(r,c);

        vector<int32_t> dram_kernel(SIM_A_DEPTH,0);
        for(size_t i=0;i<dram.size();i++)
            dram_kernel[i]=dram[i];

        fmm_reduce_kernel((volatile int*)dram_kernel.data(),
                          ROWS,COLS,T_CAP,K1,K2);

        MatCPU ref=cpu;
        greedy_reduce_cpu(ref,K1,K2);

        bool ok=true;
        for(int r=0;r<ROWS && ok;r++)
            for(int c=0;c<COLS;c++)
                if(dram_kernel[r*COLS+c]!=ref.entry(r,c)){
                    ok=false; break;
                }

        if(ok) cout<<"PASS\n";
        else{
            cout<<"FAIL\n";
            return 1;
        }
    }

    cout<<"\nAll stress tests passed.\n";
    return 0;
}
