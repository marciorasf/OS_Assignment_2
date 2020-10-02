#include "types.h"
#include "stat.h"
#include "user.h"

#define CONST 2

int main (int argc, char* argv[]) {
    if(argc < 2) {
        printf(1, "Please enter first argument\n");
        exit();
    }
    uint n = atoi(argv[1]);
    int* pid = (int*)malloc(CONST*n*sizeof(int));
    int i;
    printf(1, "Creating %d processes\n", CONST*n);
    for(i = 0; i < CONST*n; ++i) {
        pid[i] = fork();
        if(pid[i] < 0) {
            printf(1, "Fork error");
            exit();
        }
        else if(pid[i] == 0) {
            if(getpid() % 3 == 0){
                set_prio(HIGH);
                uint j, k;
                for(j = 0; j < 100; ++j) {
                    for(k = 0; k < 100; ++k) {
                        asm volatile("nop");
                    }
                }
            } else if(getpid() % 3 == 1) {
                set_prio(MEDIUM);
                uint j, k;
                for(j = 0; j < 100; ++j) {
                    for(k = 0; k < 1000; ++k) {
                        if (k % 100 == 0){
                            yield();
                        }
                        asm volatile("nop");
                    }
                }
            } else {
                set_prio(LOW);
                uint j;
                for(j = 0; j < 1; ++j) {
                    sleep(1);
                }
            }
            exit();
        }
    }
    int c_pid;
    for (i = 0; i < CONST*n; ++i) {
        int retime, rutime, stime;
        c_pid = wait2(&retime, &rutime, &stime);
        printf(1, "pid: %d, ready: %d, run: %d, sleep: %d\n", c_pid, retime, rutime, stime);
    }
    exit();
}