#include "types.h"
#include "stat.h"
#include "user.h"

int main (int argc, char* argv[]) {
    if(argc < 2) {
        printf(1, "Please enter first argument\n");
        exit();
    }
    uint n = atoi(argv[1]);
    int i;
    for(i = 0; i < 5*n; ++i) {
        if(fork() == 0) {
            if(getpid() % 3 == 0){
                set_prio(2);
                uint j, k;
                for(j = 0; j < 100; ++j) {
                    for(k = 0; k < 1000000; ++k) {
                        asm volatile("nop");
                    }
                }
            } else if(getpid() % 3 == 1) {
                set_prio(1);
                uint j, k;
                for(j = 0; j < 100; ++j) {
                    for(k = 0; k < 1000000; ++k) {
                        if (k % 100 == 0)
                            //yield();
                        asm volatile("nop");
                    }
                }
            } else {
                set_prio(0);
                uint j;
                for(j = 0; j < 100; ++j) {
                    sleep(1);
                }
            }
        }
        wait();
    }
    exit();
}