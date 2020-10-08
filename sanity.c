#include "types.h"
#include "user.h"

int cpu_bound_process();
int short_cpu_process();
int io_bound_process();
int get_process_type(int pid);

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
    int n_cpu_bound_proc = 0;
    int n_s_cpu_proc = 0;
    int n_io_bound_proc = 0;

    n = atoi(argv[1]) * 5;

    int pid;
    for (i = 0; i < n; i++)
    {
        pid = fork();
        if (pid == 0)
        {                           //child
            j = get_process_type(getpid());
            switch (j)
            {
            case 0:
                set_prio(2);
                cpu_bound_process();
                break;
            case 1:
                set_prio(1);
                short_cpu_process();
                break;
            case 2:
                set_prio(0);
                io_bound_process();
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

    char processes_types_names[][10] = {"CPU-Bound", "S-CPU", "IO-Bound"};

    for (i = 0; i < n; i++)
    {
        int retime = 0;
        int rutime = 0;
        int stime = 0;
        
        pid = wait2(&retime, &rutime, &stime);
        int process_type = get_process_type(pid);

        printf(1, "PID: %d, Type: %s, Ready: %d, Running: %d, Sleeping: %d\n", pid, processes_types_names[process_type], retime, rutime, stime);

        if (process_type == 0) {
            n_cpu_bound_proc++;
        } else if (process_type == 1) {
            n_s_cpu_proc++;
        } else {
            n_io_bound_proc++;
        }

        if (process_type == 0) {
            cpu_b_acc_rutime += rutime;
            cpu_b_acc_retime += retime;
            cpu_b_acc_stime += stime;
        } else if (process_type == 1) {
            s_cpu_acc_rutime += rutime;
            s_cpu_acc_retime += retime;
            s_cpu_acc_stime += stime;
        } else {
            io_b_acc_rutime += rutime;
            io_b_acc_retime += retime;
            io_b_acc_stime += stime;
        }
    }

    int t_med_s_cpu_b = cpu_b_acc_stime / n_cpu_bound_proc;
    int t_med_ru_cpu_b = cpu_b_acc_rutime / n_cpu_bound_proc;
    int t_med_re_cpu_b = cpu_b_acc_retime / n_cpu_bound_proc;

    int t_med_s_s_cpu = s_cpu_acc_stime / n_s_cpu_proc;
    int t_med_ru_s_cpu = s_cpu_acc_rutime / n_s_cpu_proc;
    int t_med_re_s_cpu = s_cpu_acc_retime / n_s_cpu_proc;

    int t_med_s_io_b = io_b_acc_stime / n_io_bound_proc;
    int t_med_ru_io_b = io_b_acc_rutime / n_io_bound_proc;
    int t_med_re_io_b = io_b_acc_retime / n_io_bound_proc;

    printf(1, "\n\nCPU-Bound:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround: %d\n\n\n", t_med_s_cpu_b, t_med_re_cpu_b, t_med_ru_cpu_b + t_med_re_cpu_b + t_med_s_s_cpu);
    printf(1, "S-CPU:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround time: %d\n\n\n",    t_med_s_s_cpu, t_med_re_s_cpu, t_med_ru_s_cpu + t_med_re_s_cpu + t_med_s_s_cpu);
    printf(1, "IO-Bound:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround time: %d\n\n\n", t_med_s_io_b,  t_med_re_io_b,  t_med_ru_io_b  + t_med_re_io_b  + t_med_s_io_b);
    exit();
}

int cpu_bound_process()
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

int short_cpu_process()
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

int io_bound_process()
{
    for (int i = 0; i < 100; i++)
    {
        sleep(1);
    }
    return 0;
}

int get_process_type(int pid){
    return  (pid - 4) % 3;
}