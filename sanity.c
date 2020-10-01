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


    int stats[3][3];

    for (i = 0; i < 3; i++)
        for (j = 0; j < 3; j++)
            stats[i][j] = 0;

    n = atoi(argv[1]) * 5;

    int nCpuBound = 0;
    int nSCpuBound = 0; 
    int nIoBound = 0;

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
                cpuBoundProcess();
                break;
            case 1:
                shortCpuProcess();
                break;
            case 2:
                ioBoundProcess();
                break;
            }
            exit(); // children exit here
        }
        continue; // father continues to spawn the next child
    }

    int retime;
    int rutime;
    int stime;
    
    for (i = 0; i < n; i++)
    {
        pid = wait2(&retime, &rutime, &stime);
        int processType = getProcessType(pid); // correlates to j in the dispatching loop
        switch (processType)
        {
        case 0: // CPU bound processes
            nCpuBound += 1;
            printf(1, "pid: %d, type: CPU-BOUND, ready: %d, running: %d, sleeping: %d\n", pid, retime, rutime, stime);
            stats[0][0] += retime;
            stats[0][1] += rutime;
            stats[0][2] += stime;
            break;
        case 1: // CPU bound processes, short tasks
            nSCpuBound += 1;
            printf(1, "pid: %d, type: S-CPU, ready: %d, running: %d, sleeping: %d\n", pid, retime, rutime, stime);
            stats[1][0] += retime;
            stats[1][1] += rutime;
            stats[1][2] += stime;
            break;
        case 2: // simulating I/O bound processes
            nIoBound += 1;
            printf(1, "pid: %d, type: IO-Bound, ready: %d, running: %d, sleeping: %d\n", pid, retime, rutime, stime);
            stats[2][0] += retime;
            stats[2][1] += rutime;
            stats[2][2] += stime;
            break;
        }
    }

    for (j = 0; j < 3; j++)
        stats[0][j] /= nCpuBound;

    for (j = 0; j < 3; j++)
        stats[1][j] /= nSCpuBound;

    for (j = 0; j < 3; j++)
        stats[2][j] /= nIoBound;

    printf(1, "\n\nCPU-Bound:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround: %d\n\n\n", stats[0][2], stats[0][1], stats[0][0]+stats[0][1] + stats[0][2]);
    printf(1, "S-CPU:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround time: %d\n\n\n", stats[1][2], stats[1][0], stats[1][0] + stats[1][1] + stats[1][2] );
    printf(1, "IO-Bound:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround time: %d\n\n\n", stats[2][2], stats[2][0], stats[2][0] + stats[2][1] + stats[2][2]);
    exit();
}

int cpuBoundProcess()
{
    for (int i = 0; i < 100; i++)
    {
        for (int j = 0; j < 1000000; j++)
        {
        }
    }

    return 0;
}

int shortCpuProcess()
{
    for (int i = 0; i < 100; i++)
    {
        for (int j = 0; j < 10000; j++)
        {
            for (int j = 0; j < 100; j++)
            {
            }

            yield();
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