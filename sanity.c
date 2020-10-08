#include "types.h"
#include "user.h"

int cpuBoundProcess();
int shortCpuProcess();
int ioBoundProcess();
int getProcessType(int pid);

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf(1, "Usage: SMLsanity <n>\n");
        exit();
    }
    int i;
    int n;
    int j = 0;
    int nCpuB = 0;
    int nSCpu = 0;
    int nIoB = 0;

    n = atoi(argv[1]) * 5;

    int pid;
    for (i = 0; i < n; i++)
    {
        pid = fork();
        if (pid == 0)
        {                           //child
            j = getProcessType(getpid());
            switch (j)
            {
            case 0:
                set_prio(2);
                cpuBoundProcess();
                break;
            case 1:
                set_prio(1);
                shortCpuProcess();
                break;
            case 2:
                set_prio(0);
                ioBoundProcess();
                break;
            }
            exit(); // children exit here
        }
        continue; // father continues to spawn the next child
    }
    int cpu_b_acc_rutime = 0;
    int cpu_b_acc_retime = 0;
    int cpu_b_acc_stime = 0;

    int s_cpu_acc_rutime = 0;
    int s_cpu_acc_retime = 0;
    int s_cpu_acc_stime = 0;

    int io_b_acc_rutime = 0;
    int io_b_acc_retime = 0;
    int io_b_acc_stime = 0;
    for (i = 0; i < n; i++)
    {
        int retime = 0;
        int rutime = 0;
        int stime = 0;
        pid = wait2(&retime, &rutime, &stime);
        if (getProcessType(pid) == 0) {
            nCpuB++;
        } else if (getProcessType(pid) == 1) {
            nSCpu++;
        } else {
            nIoB++;
        }
        int processType = getProcessType(pid); // correlates to j in the dispatching loop
        printf(1, "pid %d, type %d, ready %d, running %d, sleeping %d\n", processType, pid, retime, rutime, stime);
        if (processType == 0) {
            cpu_b_acc_rutime += rutime;
            cpu_b_acc_retime += retime;
            cpu_b_acc_stime += stime;
        } else if (processType == 1) {
            s_cpu_acc_rutime += rutime;
            s_cpu_acc_retime += retime;
            s_cpu_acc_stime += stime;
        } else {
            io_b_acc_rutime += rutime;
            io_b_acc_retime += retime;
            io_b_acc_stime += stime;
        }
    }
    int t_med_s_cpu_b = cpu_b_acc_stime / nCpuB;
    int t_med_ru_cpu_b = cpu_b_acc_rutime / nCpuB;
    int t_med_re_cpu_b = cpu_b_acc_retime / nCpuB;

    int t_med_s_s_cpu = s_cpu_acc_stime / nSCpu;
    int t_med_ru_s_cpu = s_cpu_acc_rutime / nSCpu;
    int t_med_re_s_cpu = s_cpu_acc_retime / nSCpu;

    int t_med_s_io_b = io_b_acc_stime / nIoB;
    int t_med_ru_io_b = io_b_acc_rutime / nIoB;
    int t_med_re_io_b = io_b_acc_retime / nIoB;

    printf(1, "\n\nCPU-Bound:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround: %d\n\n\n", t_med_s_cpu_b, t_med_re_cpu_b, t_med_ru_cpu_b + t_med_re_cpu_b + t_med_s_s_cpu);
    printf(1, "S-CPU:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround time: %d\n\n\n",    t_med_s_s_cpu, t_med_re_s_cpu, t_med_ru_s_cpu + t_med_re_s_cpu + t_med_s_s_cpu);
    printf(1, "IO-Bound:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround time: %d\n\n\n", t_med_s_io_b,  t_med_re_io_b,  t_med_ru_io_b  + t_med_re_io_b  + t_med_s_io_b);
    exit();
}

int cpuBoundProcess()
{
    for (int i = 0; i < 100; i++)
    {
        for (int j = 0; j < 1000000; j++)
        {
            asm("");
        }
    }
    return 0;
}

int shortCpuProcess()
{
    for (int i = 0; i < 100; i++)
    {
        for (int j = 0; j < 1000000; j++)
        {
            if ((j+1) % 100 == 0)
                yield();
            asm("");
        }
    }

    return 0;
}

int ioBoundProcess()
{
    for (int i = 0; i < 100; i++)
    {
        sleep(1);
    }
    return 0;
}

int getProcessType(int pid){
    return  (pid - 4) % 3;
}
