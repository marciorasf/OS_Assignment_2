
_sanity:     file format elf32-i386


Disassembly of section .text:

00000000 <main.cold>:
            break;
        }
    }

    for (j = 0; j < 3; j++)
        stats[0][j] /= nCpuBound;
   0:	0f 0b                	ud2    
   2:	66 90                	xchg   %ax,%ax
   4:	66 90                	xchg   %ax,%ax
   6:	66 90                	xchg   %ax,%ax
   8:	66 90                	xchg   %ax,%ax
   a:	66 90                	xchg   %ax,%ax
   c:	66 90                	xchg   %ax,%ax
   e:	66 90                	xchg   %ax,%ax

00000010 <main>:
{
  10:	f3 0f 1e fb          	endbr32 
  14:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  18:	83 e4 f0             	and    $0xfffffff0,%esp
  1b:	ff 71 fc             	pushl  -0x4(%ecx)
  1e:	55                   	push   %ebp
  1f:	89 e5                	mov    %esp,%ebp
  21:	57                   	push   %edi
  22:	56                   	push   %esi
  23:	53                   	push   %ebx
  24:	51                   	push   %ecx
  25:	83 ec 48             	sub    $0x48,%esp
    if (argc != 2)
  28:	83 39 02             	cmpl   $0x2,(%ecx)
{
  2b:	8b 51 04             	mov    0x4(%ecx),%edx
    if (argc != 2)
  2e:	0f 85 29 01 00 00    	jne    15d <main+0x14d>
    n = atoi(argv[1]) * 5;
  34:	83 ec 0c             	sub    $0xc,%esp
  37:	ff 72 04             	pushl  0x4(%edx)
    for (i = 0; i < n; i++)
  3a:	31 db                	xor    %ebx,%ebx
    n = atoi(argv[1]) * 5;
  3c:	e8 4f 05 00 00       	call   590 <atoi>
    for (i = 0; i < n; i++)
  41:	83 c4 10             	add    $0x10,%esp
    n = atoi(argv[1]) * 5;
  44:	8d 04 80             	lea    (%eax,%eax,4),%eax
  47:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    for (i = 0; i < n; i++)
  4a:	85 c0                	test   %eax,%eax
  4c:	0f 8e a3 02 00 00    	jle    2f5 <main+0x2e5>
        pid = fork();
  52:	e8 a4 05 00 00       	call   5fb <fork>
        if (pid == 0)
  57:	85 c0                	test   %eax,%eax
  59:	75 2f                	jne    8a <main+0x7a>
            j = getProcessType(getpid());
  5b:	e8 23 06 00 00       	call   683 <getpid>

    return 0;
}

int getProcessType(int pid){
    return  (pid - 4) % 3;
  60:	b9 03 00 00 00       	mov    $0x3,%ecx
  65:	83 e8 04             	sub    $0x4,%eax
  68:	99                   	cltd   
  69:	f7 f9                	idiv   %ecx
            switch (j)
  6b:	83 fa 01             	cmp    $0x1,%edx
  6e:	0f 84 fc 00 00 00    	je     170 <main+0x160>
  74:	83 fa 02             	cmp    $0x2,%edx
  77:	0f 84 39 01 00 00    	je     1b6 <main+0x1a6>
  7d:	85 d2                	test   %edx,%edx
  7f:	0f 84 1f 01 00 00    	je     1a4 <main+0x194>
    exit();
  85:	e8 79 05 00 00       	call   603 <exit>
    for (i = 0; i < n; i++)
  8a:	83 c3 01             	add    $0x1,%ebx
  8d:	39 5d b4             	cmp    %ebx,-0x4c(%ebp)
  90:	75 c0                	jne    52 <main+0x42>
    int nCpuBound = 0;
  92:	31 db                	xor    %ebx,%ebx
            stats[i][j] = 0;
  94:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
    int nIoBound = 0;
  9b:	31 f6                	xor    %esi,%esi
    int nSCpuBound = 0; 
  9d:	31 ff                	xor    %edi,%edi
            stats[i][j] = 0;
  9f:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
  a6:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
  ad:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  b4:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
  bb:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
  c2:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
    for (i = 0; i < n; i++)
  c9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
            stats[i][j] = 0;
  d0:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
  d7:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
    return  (pid - 4) % 3;
  de:	89 5d a8             	mov    %ebx,-0x58(%ebp)
  e1:	eb 18                	jmp    fb <main+0xeb>
        switch (processType)
  e3:	85 d2                	test   %edx,%edx
  e5:	0f 84 29 01 00 00    	je     214 <main+0x204>
    for (i = 0; i < n; i++)
  eb:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
  ef:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  f2:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
  f5:	0f 84 4f 01 00 00    	je     24a <main+0x23a>
        pid = wait2(&retime, &rutime, &stime);
  fb:	50                   	push   %eax
  fc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    return  (pid - 4) % 3;
  ff:	bb 03 00 00 00       	mov    $0x3,%ebx
        pid = wait2(&retime, &rutime, &stime);
 104:	50                   	push   %eax
 105:	8d 45 e0             	lea    -0x20(%ebp),%eax
 108:	50                   	push   %eax
 109:	8d 45 dc             	lea    -0x24(%ebp),%eax
 10c:	50                   	push   %eax
 10d:	e8 99 05 00 00       	call   6ab <wait2>
        switch (processType)
 112:	83 c4 10             	add    $0x10,%esp
        pid = wait2(&retime, &rutime, &stime);
 115:	89 c1                	mov    %eax,%ecx
    return  (pid - 4) % 3;
 117:	8d 40 fc             	lea    -0x4(%eax),%eax
 11a:	99                   	cltd   
 11b:	f7 fb                	idiv   %ebx
        switch (processType)
 11d:	83 fa 01             	cmp    $0x1,%edx
 120:	0f 84 b9 00 00 00    	je     1df <main+0x1cf>
 126:	83 fa 02             	cmp    $0x2,%edx
 129:	75 b8                	jne    e3 <main+0xd3>
            printf(1, "pid: %d, type: IO-Bound, ready: %d, running: %d, sleeping: %d\n", pid, retime, rutime, stime);
 12b:	50                   	push   %eax
            nIoBound += 1;
 12c:	83 c6 01             	add    $0x1,%esi
            printf(1, "pid: %d, type: IO-Bound, ready: %d, running: %d, sleeping: %d\n", pid, retime, rutime, stime);
 12f:	50                   	push   %eax
 130:	ff 75 e4             	pushl  -0x1c(%ebp)
 133:	ff 75 e0             	pushl  -0x20(%ebp)
 136:	ff 75 dc             	pushl  -0x24(%ebp)
 139:	51                   	push   %ecx
 13a:	68 6c 0b 00 00       	push   $0xb6c
 13f:	6a 01                	push   $0x1
 141:	e8 2a 06 00 00       	call   770 <printf>
            stats[2][0] += retime;
 146:	8b 4d dc             	mov    -0x24(%ebp),%ecx
            stats[2][1] += rutime;
 149:	8b 55 e0             	mov    -0x20(%ebp),%edx
            break;
 14c:	83 c4 20             	add    $0x20,%esp
            stats[2][0] += retime;
 14f:	01 4d c4             	add    %ecx,-0x3c(%ebp)
            stats[2][2] += stime;
 152:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
            stats[2][1] += rutime;
 155:	01 55 b8             	add    %edx,-0x48(%ebp)
            stats[2][2] += stime;
 158:	01 4d c0             	add    %ecx,-0x40(%ebp)
            break;
 15b:	eb 8e                	jmp    eb <main+0xdb>
        printf(1, "Usage: SMLsanity <n>\n");
 15d:	50                   	push   %eax
 15e:	50                   	push   %eax
 15f:	68 d8 0a 00 00       	push   $0xad8
 164:	6a 01                	push   $0x1
 166:	e8 05 06 00 00       	call   770 <printf>
        exit();
 16b:	e8 93 04 00 00       	call   603 <exit>
                set_prio(2);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	be 64 00 00 00       	mov    $0x64,%esi
 178:	6a 02                	push   $0x2
 17a:	e8 24 05 00 00       	call   6a3 <set_prio>
 17f:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < n; i++)
 182:	bb e8 03 00 00       	mov    $0x3e8,%ebx
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax
            yield();
 190:	e8 1e 05 00 00       	call   6b3 <yield>
        for (int j = 0; j < 1000; j++)
 195:	83 eb 01             	sub    $0x1,%ebx
 198:	75 f6                	jne    190 <main+0x180>
    for (int i = 0; i < 100; i++)
 19a:	83 ee 01             	sub    $0x1,%esi
 19d:	75 e3                	jne    182 <main+0x172>
 19f:	e9 e1 fe ff ff       	jmp    85 <main+0x75>
                set_prio(0);
 1a4:	83 ec 0c             	sub    $0xc,%esp
 1a7:	6a 00                	push   $0x0
 1a9:	e8 f5 04 00 00       	call   6a3 <set_prio>
    return 0;
 1ae:	83 c4 10             	add    $0x10,%esp
 1b1:	e9 cf fe ff ff       	jmp    85 <main+0x75>
                set_prio(1);
 1b6:	83 ec 0c             	sub    $0xc,%esp
 1b9:	bb 64 00 00 00       	mov    $0x64,%ebx
 1be:	6a 01                	push   $0x1
 1c0:	e8 de 04 00 00       	call   6a3 <set_prio>
 1c5:	83 c4 10             	add    $0x10,%esp
        sleep(1);
 1c8:	83 ec 0c             	sub    $0xc,%esp
 1cb:	6a 01                	push   $0x1
 1cd:	e8 c1 04 00 00       	call   693 <sleep>
    for (int i = 0; i < 100; i++)
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	83 eb 01             	sub    $0x1,%ebx
 1d8:	75 ee                	jne    1c8 <main+0x1b8>
 1da:	e9 a6 fe ff ff       	jmp    85 <main+0x75>
            printf(1, "pid: %d, type: S-CPU, ready: %d, running: %d, sleeping: %d\n", pid, retime, rutime, stime);
 1df:	52                   	push   %edx
            nSCpuBound += 1;
 1e0:	83 c7 01             	add    $0x1,%edi
            printf(1, "pid: %d, type: S-CPU, ready: %d, running: %d, sleeping: %d\n", pid, retime, rutime, stime);
 1e3:	52                   	push   %edx
 1e4:	ff 75 e4             	pushl  -0x1c(%ebp)
 1e7:	ff 75 e0             	pushl  -0x20(%ebp)
 1ea:	ff 75 dc             	pushl  -0x24(%ebp)
 1ed:	51                   	push   %ecx
 1ee:	68 30 0b 00 00       	push   $0xb30
 1f3:	6a 01                	push   $0x1
 1f5:	e8 76 05 00 00       	call   770 <printf>
            stats[1][0] += retime;
 1fa:	8b 4d dc             	mov    -0x24(%ebp),%ecx
            stats[1][2] += stime;
 1fd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
            break;
 200:	83 c4 20             	add    $0x20,%esp
            stats[1][0] += retime;
 203:	01 4d d0             	add    %ecx,-0x30(%ebp)
            stats[1][1] += rutime;
 206:	8b 4d e0             	mov    -0x20(%ebp),%ecx
            stats[1][2] += stime;
 209:	01 55 cc             	add    %edx,-0x34(%ebp)
            stats[1][1] += rutime;
 20c:	01 4d c8             	add    %ecx,-0x38(%ebp)
            break;
 20f:	e9 d7 fe ff ff       	jmp    eb <main+0xdb>
            printf(1, "pid: %d, type: CPU-BOUND, ready: %d, running: %d, sleeping: %d\n", pid, retime, rutime, stime);
 214:	53                   	push   %ebx
 215:	53                   	push   %ebx
 216:	ff 75 e4             	pushl  -0x1c(%ebp)
 219:	ff 75 e0             	pushl  -0x20(%ebp)
 21c:	ff 75 dc             	pushl  -0x24(%ebp)
 21f:	51                   	push   %ecx
 220:	68 f0 0a 00 00       	push   $0xaf0
 225:	6a 01                	push   $0x1
            nCpuBound += 1;
 227:	83 45 a8 01          	addl   $0x1,-0x58(%ebp)
            printf(1, "pid: %d, type: CPU-BOUND, ready: %d, running: %d, sleeping: %d\n", pid, retime, rutime, stime);
 22b:	e8 40 05 00 00       	call   770 <printf>
            stats[0][0] += retime;
 230:	8b 4d dc             	mov    -0x24(%ebp),%ecx
            break;
 233:	83 c4 20             	add    $0x20,%esp
            stats[0][0] += retime;
 236:	01 4d bc             	add    %ecx,-0x44(%ebp)
            stats[0][1] += rutime;
 239:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 23c:	01 4d ac             	add    %ecx,-0x54(%ebp)
            stats[0][2] += stime;
 23f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 242:	01 4d b0             	add    %ecx,-0x50(%ebp)
            break;
 245:	e9 a1 fe ff ff       	jmp    eb <main+0xdb>
        stats[0][j] /= nCpuBound;
 24a:	8b 45 bc             	mov    -0x44(%ebp),%eax
 24d:	8b 5d a8             	mov    -0x58(%ebp),%ebx
    printf(1, "\n\nCPU-Bound:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround: %d\n\n\n", stats[0][2], stats[0][0], stats[0][0]+stats[0][1] + stats[0][2]);
 250:	83 ec 0c             	sub    $0xc,%esp
        stats[0][j] /= nCpuBound;
 253:	99                   	cltd   
 254:	f7 fb                	idiv   %ebx
 256:	89 c1                	mov    %eax,%ecx
 258:	8b 45 b0             	mov    -0x50(%ebp),%eax
 25b:	99                   	cltd   
 25c:	f7 fb                	idiv   %ebx
 25e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        stats[1][j] /= nSCpuBound;
 261:	8b 45 d0             	mov    -0x30(%ebp),%eax
 264:	99                   	cltd   
 265:	f7 ff                	idiv   %edi
 267:	89 45 d0             	mov    %eax,-0x30(%ebp)
 26a:	8b 45 c8             	mov    -0x38(%ebp),%eax
 26d:	99                   	cltd   
 26e:	f7 ff                	idiv   %edi
 270:	89 45 c8             	mov    %eax,-0x38(%ebp)
 273:	8b 45 cc             	mov    -0x34(%ebp),%eax
 276:	99                   	cltd   
 277:	f7 ff                	idiv   %edi
 279:	89 c7                	mov    %eax,%edi
        stats[2][j] /= nIoBound;
 27b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 27e:	99                   	cltd   
 27f:	f7 fe                	idiv   %esi
 281:	89 45 cc             	mov    %eax,-0x34(%ebp)
 284:	8b 45 b8             	mov    -0x48(%ebp),%eax
 287:	99                   	cltd   
 288:	f7 fe                	idiv   %esi
 28a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 28d:	8b 45 c0             	mov    -0x40(%ebp),%eax
 290:	99                   	cltd   
 291:	f7 fe                	idiv   %esi
 293:	89 c6                	mov    %eax,%esi
        stats[0][j] /= nCpuBound;
 295:	8b 45 ac             	mov    -0x54(%ebp),%eax
 298:	99                   	cltd   
 299:	f7 fb                	idiv   %ebx
    printf(1, "\n\nCPU-Bound:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround: %d\n\n\n", stats[0][2], stats[0][0], stats[0][0]+stats[0][1] + stats[0][2]);
 29b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 29e:	01 c8                	add    %ecx,%eax
 2a0:	01 d0                	add    %edx,%eax
 2a2:	50                   	push   %eax
 2a3:	51                   	push   %ecx
 2a4:	52                   	push   %edx
 2a5:	68 ac 0b 00 00       	push   $0xbac
 2aa:	6a 01                	push   $0x1
 2ac:	e8 bf 04 00 00       	call   770 <printf>
    printf(1, "S-CPU:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround time: %d\n\n\n", stats[1][2], stats[1][0], stats[1][0] + stats[1][1] + stats[1][2] );
 2b1:	8b 55 d0             	mov    -0x30(%ebp),%edx
 2b4:	8b 4d c8             	mov    -0x38(%ebp),%ecx
 2b7:	83 c4 14             	add    $0x14,%esp
 2ba:	01 d1                	add    %edx,%ecx
 2bc:	89 c8                	mov    %ecx,%eax
 2be:	01 f8                	add    %edi,%eax
 2c0:	50                   	push   %eax
 2c1:	52                   	push   %edx
 2c2:	57                   	push   %edi
 2c3:	68 04 0c 00 00       	push   $0xc04
 2c8:	6a 01                	push   $0x1
 2ca:	e8 a1 04 00 00       	call   770 <printf>
    printf(1, "IO-Bound:\nAverage sleeping time: %d\nAverage ready time: %d\nAverage turnaround time: %d\n\n\n", stats[2][2], stats[2][0], stats[2][0] + stats[2][1] + stats[2][2]);
 2cf:	8b 4d cc             	mov    -0x34(%ebp),%ecx
 2d2:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 2d5:	83 c4 14             	add    $0x14,%esp
 2d8:	01 cf                	add    %ecx,%edi
 2da:	89 f8                	mov    %edi,%eax
 2dc:	01 f0                	add    %esi,%eax
 2de:	50                   	push   %eax
 2df:	51                   	push   %ecx
 2e0:	56                   	push   %esi
 2e1:	68 5c 0c 00 00       	push   $0xc5c
 2e6:	6a 01                	push   $0x1
 2e8:	e8 83 04 00 00       	call   770 <printf>
    exit();
 2ed:	83 c4 20             	add    $0x20,%esp
 2f0:	e9 90 fd ff ff       	jmp    85 <main+0x75>
 2f5:	e9 06 fd ff ff       	jmp    0 <main.cold>
 2fa:	66 90                	xchg   %ax,%ax
 2fc:	66 90                	xchg   %ax,%ax
 2fe:	66 90                	xchg   %ax,%ax

00000300 <cpuBoundProcess>:
{
 300:	f3 0f 1e fb          	endbr32 
}
 304:	31 c0                	xor    %eax,%eax
 306:	c3                   	ret    
 307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30e:	66 90                	xchg   %ax,%ax

00000310 <shortCpuProcess>:
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	56                   	push   %esi
 318:	be 64 00 00 00       	mov    $0x64,%esi
 31d:	53                   	push   %ebx
 31e:	bb e8 03 00 00       	mov    $0x3e8,%ebx
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
            yield();
 328:	e8 86 03 00 00       	call   6b3 <yield>
        for (int j = 0; j < 1000; j++)
 32d:	83 eb 01             	sub    $0x1,%ebx
 330:	75 f6                	jne    328 <shortCpuProcess+0x18>
    for (int i = 0; i < 100; i++)
 332:	83 ee 01             	sub    $0x1,%esi
 335:	75 e7                	jne    31e <shortCpuProcess+0xe>
}
 337:	5b                   	pop    %ebx
 338:	31 c0                	xor    %eax,%eax
 33a:	5e                   	pop    %esi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	8d 76 00             	lea    0x0(%esi),%esi

00000340 <ioBoundProcess>:
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	53                   	push   %ebx
 348:	bb 64 00 00 00       	mov    $0x64,%ebx
 34d:	83 ec 04             	sub    $0x4,%esp
        sleep(1);
 350:	83 ec 0c             	sub    $0xc,%esp
 353:	6a 01                	push   $0x1
 355:	e8 39 03 00 00       	call   693 <sleep>
    for (int i = 0; i < 100; i++)
 35a:	83 c4 10             	add    $0x10,%esp
 35d:	83 eb 01             	sub    $0x1,%ebx
 360:	75 ee                	jne    350 <ioBoundProcess+0x10>
}
 362:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 365:	31 c0                	xor    %eax,%eax
 367:	c9                   	leave  
 368:	c3                   	ret    
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <getProcessType>:
int getProcessType(int pid){
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
    return  (pid - 4) % 3;
 375:	ba 56 55 55 55       	mov    $0x55555556,%edx
int getProcessType(int pid){
 37a:	89 e5                	mov    %esp,%ebp
    return  (pid - 4) % 3;
 37c:	8b 45 08             	mov    0x8(%ebp),%eax
 37f:	5d                   	pop    %ebp
    return  (pid - 4) % 3;
 380:	8d 48 fc             	lea    -0x4(%eax),%ecx
 383:	89 c8                	mov    %ecx,%eax
 385:	f7 ea                	imul   %edx
 387:	89 c8                	mov    %ecx,%eax
 389:	c1 f8 1f             	sar    $0x1f,%eax
 38c:	29 c2                	sub    %eax,%edx
 38e:	8d 04 52             	lea    (%edx,%edx,2),%eax
 391:	29 c1                	sub    %eax,%ecx
 393:	89 c8                	mov    %ecx,%eax
 395:	c3                   	ret    
 396:	66 90                	xchg   %ax,%ax
 398:	66 90                	xchg   %ax,%ax
 39a:	66 90                	xchg   %ax,%ax
 39c:	66 90                	xchg   %ax,%ax
 39e:	66 90                	xchg   %ax,%ax

000003a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3a5:	31 c0                	xor    %eax,%eax
{
 3a7:	89 e5                	mov    %esp,%ebp
 3a9:	53                   	push   %ebx
 3aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 3b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3b7:	83 c0 01             	add    $0x1,%eax
 3ba:	84 d2                	test   %dl,%dl
 3bc:	75 f2                	jne    3b0 <strcpy+0x10>
    ;
  return os;
}
 3be:	89 c8                	mov    %ecx,%eax
 3c0:	5b                   	pop    %ebx
 3c1:	5d                   	pop    %ebp
 3c2:	c3                   	ret    
 3c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	53                   	push   %ebx
 3d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3de:	0f b6 01             	movzbl (%ecx),%eax
 3e1:	0f b6 1a             	movzbl (%edx),%ebx
 3e4:	84 c0                	test   %al,%al
 3e6:	75 19                	jne    401 <strcmp+0x31>
 3e8:	eb 26                	jmp    410 <strcmp+0x40>
 3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 3f4:	83 c1 01             	add    $0x1,%ecx
 3f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3fa:	0f b6 1a             	movzbl (%edx),%ebx
 3fd:	84 c0                	test   %al,%al
 3ff:	74 0f                	je     410 <strcmp+0x40>
 401:	38 d8                	cmp    %bl,%al
 403:	74 eb                	je     3f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 405:	29 d8                	sub    %ebx,%eax
}
 407:	5b                   	pop    %ebx
 408:	5d                   	pop    %ebp
 409:	c3                   	ret    
 40a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 410:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 412:	29 d8                	sub    %ebx,%eax
}
 414:	5b                   	pop    %ebx
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41e:	66 90                	xchg   %ax,%ax

00000420 <strlen>:

uint
strlen(const char *s)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 42a:	80 3a 00             	cmpb   $0x0,(%edx)
 42d:	74 21                	je     450 <strlen+0x30>
 42f:	31 c0                	xor    %eax,%eax
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 438:	83 c0 01             	add    $0x1,%eax
 43b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 43f:	89 c1                	mov    %eax,%ecx
 441:	75 f5                	jne    438 <strlen+0x18>
    ;
  return n;
}
 443:	89 c8                	mov    %ecx,%eax
 445:	5d                   	pop    %ebp
 446:	c3                   	ret    
 447:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 450:	31 c9                	xor    %ecx,%ecx
}
 452:	5d                   	pop    %ebp
 453:	89 c8                	mov    %ecx,%eax
 455:	c3                   	ret    
 456:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45d:	8d 76 00             	lea    0x0(%esi),%esi

00000460 <memset>:

void*
memset(void *dst, int c, uint n)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 46b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 46e:	8b 45 0c             	mov    0xc(%ebp),%eax
 471:	89 d7                	mov    %edx,%edi
 473:	fc                   	cld    
 474:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 476:	89 d0                	mov    %edx,%eax
 478:	5f                   	pop    %edi
 479:	5d                   	pop    %ebp
 47a:	c3                   	ret    
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <strchr>:

char*
strchr(const char *s, char c)
{
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	8b 45 08             	mov    0x8(%ebp),%eax
 48a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 48e:	0f b6 10             	movzbl (%eax),%edx
 491:	84 d2                	test   %dl,%dl
 493:	75 16                	jne    4ab <strchr+0x2b>
 495:	eb 21                	jmp    4b8 <strchr+0x38>
 497:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49e:	66 90                	xchg   %ax,%ax
 4a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 4a4:	83 c0 01             	add    $0x1,%eax
 4a7:	84 d2                	test   %dl,%dl
 4a9:	74 0d                	je     4b8 <strchr+0x38>
    if(*s == c)
 4ab:	38 d1                	cmp    %dl,%cl
 4ad:	75 f1                	jne    4a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    
 4b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4b8:	31 c0                	xor    %eax,%eax
}
 4ba:	5d                   	pop    %ebp
 4bb:	c3                   	ret    
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004c0 <gets>:

char*
gets(char *buf, int max)
{
 4c0:	f3 0f 1e fb          	endbr32 
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	57                   	push   %edi
 4c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4c9:	31 f6                	xor    %esi,%esi
{
 4cb:	53                   	push   %ebx
 4cc:	89 f3                	mov    %esi,%ebx
 4ce:	83 ec 1c             	sub    $0x1c,%esp
 4d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 4d4:	eb 33                	jmp    509 <gets+0x49>
 4d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 4e0:	83 ec 04             	sub    $0x4,%esp
 4e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4e6:	6a 01                	push   $0x1
 4e8:	50                   	push   %eax
 4e9:	6a 00                	push   $0x0
 4eb:	e8 2b 01 00 00       	call   61b <read>
    if(cc < 1)
 4f0:	83 c4 10             	add    $0x10,%esp
 4f3:	85 c0                	test   %eax,%eax
 4f5:	7e 1c                	jle    513 <gets+0x53>
      break;
    buf[i++] = c;
 4f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4fb:	83 c7 01             	add    $0x1,%edi
 4fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 501:	3c 0a                	cmp    $0xa,%al
 503:	74 23                	je     528 <gets+0x68>
 505:	3c 0d                	cmp    $0xd,%al
 507:	74 1f                	je     528 <gets+0x68>
  for(i=0; i+1 < max; ){
 509:	83 c3 01             	add    $0x1,%ebx
 50c:	89 fe                	mov    %edi,%esi
 50e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 511:	7c cd                	jl     4e0 <gets+0x20>
 513:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 515:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 518:	c6 03 00             	movb   $0x0,(%ebx)
}
 51b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    
 523:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 527:	90                   	nop
 528:	8b 75 08             	mov    0x8(%ebp),%esi
 52b:	8b 45 08             	mov    0x8(%ebp),%eax
 52e:	01 de                	add    %ebx,%esi
 530:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 532:	c6 03 00             	movb   $0x0,(%ebx)
}
 535:	8d 65 f4             	lea    -0xc(%ebp),%esp
 538:	5b                   	pop    %ebx
 539:	5e                   	pop    %esi
 53a:	5f                   	pop    %edi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	8d 76 00             	lea    0x0(%esi),%esi

00000540 <stat>:

int
stat(const char *n, struct stat *st)
{
 540:	f3 0f 1e fb          	endbr32 
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	56                   	push   %esi
 548:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 549:	83 ec 08             	sub    $0x8,%esp
 54c:	6a 00                	push   $0x0
 54e:	ff 75 08             	pushl  0x8(%ebp)
 551:	e8 ed 00 00 00       	call   643 <open>
  if(fd < 0)
 556:	83 c4 10             	add    $0x10,%esp
 559:	85 c0                	test   %eax,%eax
 55b:	78 2b                	js     588 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 55d:	83 ec 08             	sub    $0x8,%esp
 560:	ff 75 0c             	pushl  0xc(%ebp)
 563:	89 c3                	mov    %eax,%ebx
 565:	50                   	push   %eax
 566:	e8 f0 00 00 00       	call   65b <fstat>
  close(fd);
 56b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 56e:	89 c6                	mov    %eax,%esi
  close(fd);
 570:	e8 b6 00 00 00       	call   62b <close>
  return r;
 575:	83 c4 10             	add    $0x10,%esp
}
 578:	8d 65 f8             	lea    -0x8(%ebp),%esp
 57b:	89 f0                	mov    %esi,%eax
 57d:	5b                   	pop    %ebx
 57e:	5e                   	pop    %esi
 57f:	5d                   	pop    %ebp
 580:	c3                   	ret    
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 588:	be ff ff ff ff       	mov    $0xffffffff,%esi
 58d:	eb e9                	jmp    578 <stat+0x38>
 58f:	90                   	nop

00000590 <atoi>:

int
atoi(const char *s)
{
 590:	f3 0f 1e fb          	endbr32 
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	53                   	push   %ebx
 598:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 59b:	0f be 02             	movsbl (%edx),%eax
 59e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 5a1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 5a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 5a9:	77 1a                	ja     5c5 <atoi+0x35>
 5ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop
    n = n*10 + *s++ - '0';
 5b0:	83 c2 01             	add    $0x1,%edx
 5b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 5ba:	0f be 02             	movsbl (%edx),%eax
 5bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5c0:	80 fb 09             	cmp    $0x9,%bl
 5c3:	76 eb                	jbe    5b0 <atoi+0x20>
  return n;
}
 5c5:	89 c8                	mov    %ecx,%eax
 5c7:	5b                   	pop    %ebx
 5c8:	5d                   	pop    %ebp
 5c9:	c3                   	ret    
 5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5d0:	f3 0f 1e fb          	endbr32 
 5d4:	55                   	push   %ebp
 5d5:	89 e5                	mov    %esp,%ebp
 5d7:	57                   	push   %edi
 5d8:	8b 45 10             	mov    0x10(%ebp),%eax
 5db:	8b 55 08             	mov    0x8(%ebp),%edx
 5de:	56                   	push   %esi
 5df:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5e2:	85 c0                	test   %eax,%eax
 5e4:	7e 0f                	jle    5f5 <memmove+0x25>
 5e6:	01 d0                	add    %edx,%eax
  dst = vdst;
 5e8:	89 d7                	mov    %edx,%edi
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 5f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 5f1:	39 f8                	cmp    %edi,%eax
 5f3:	75 fb                	jne    5f0 <memmove+0x20>
  return vdst;
}
 5f5:	5e                   	pop    %esi
 5f6:	89 d0                	mov    %edx,%eax
 5f8:	5f                   	pop    %edi
 5f9:	5d                   	pop    %ebp
 5fa:	c3                   	ret    

000005fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5fb:	b8 01 00 00 00       	mov    $0x1,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <exit>:
SYSCALL(exit)
 603:	b8 02 00 00 00       	mov    $0x2,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <wait>:
SYSCALL(wait)
 60b:	b8 03 00 00 00       	mov    $0x3,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <pipe>:
SYSCALL(pipe)
 613:	b8 04 00 00 00       	mov    $0x4,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <read>:
SYSCALL(read)
 61b:	b8 05 00 00 00       	mov    $0x5,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <write>:
SYSCALL(write)
 623:	b8 10 00 00 00       	mov    $0x10,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <close>:
SYSCALL(close)
 62b:	b8 15 00 00 00       	mov    $0x15,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <kill>:
SYSCALL(kill)
 633:	b8 06 00 00 00       	mov    $0x6,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <exec>:
SYSCALL(exec)
 63b:	b8 07 00 00 00       	mov    $0x7,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <open>:
SYSCALL(open)
 643:	b8 0f 00 00 00       	mov    $0xf,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <mknod>:
SYSCALL(mknod)
 64b:	b8 11 00 00 00       	mov    $0x11,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <unlink>:
SYSCALL(unlink)
 653:	b8 12 00 00 00       	mov    $0x12,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <fstat>:
SYSCALL(fstat)
 65b:	b8 08 00 00 00       	mov    $0x8,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <link>:
SYSCALL(link)
 663:	b8 13 00 00 00       	mov    $0x13,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <mkdir>:
SYSCALL(mkdir)
 66b:	b8 14 00 00 00       	mov    $0x14,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <chdir>:
SYSCALL(chdir)
 673:	b8 09 00 00 00       	mov    $0x9,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <dup>:
SYSCALL(dup)
 67b:	b8 0a 00 00 00       	mov    $0xa,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <getpid>:
SYSCALL(getpid)
 683:	b8 0b 00 00 00       	mov    $0xb,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <sbrk>:
SYSCALL(sbrk)
 68b:	b8 0c 00 00 00       	mov    $0xc,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <sleep>:
SYSCALL(sleep)
 693:	b8 0d 00 00 00       	mov    $0xd,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <uptime>:
SYSCALL(uptime)
 69b:	b8 0e 00 00 00       	mov    $0xe,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <set_prio>:
SYSCALL(set_prio)
 6a3:	b8 16 00 00 00       	mov    $0x16,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <wait2>:
SYSCALL(wait2)
 6ab:	b8 17 00 00 00       	mov    $0x17,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <yield>:
SYSCALL(yield)
 6b3:	b8 18 00 00 00       	mov    $0x18,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    
 6bb:	66 90                	xchg   %ax,%ax
 6bd:	66 90                	xchg   %ax,%ax
 6bf:	90                   	nop

000006c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 3c             	sub    $0x3c,%esp
 6c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6cc:	89 d1                	mov    %edx,%ecx
{
 6ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 6d1:	85 d2                	test   %edx,%edx
 6d3:	0f 89 7f 00 00 00    	jns    758 <printint+0x98>
 6d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6dd:	74 79                	je     758 <printint+0x98>
    neg = 1;
 6df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 6e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 6e8:	31 db                	xor    %ebx,%ebx
 6ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6f0:	89 c8                	mov    %ecx,%eax
 6f2:	31 d2                	xor    %edx,%edx
 6f4:	89 cf                	mov    %ecx,%edi
 6f6:	f7 75 c4             	divl   -0x3c(%ebp)
 6f9:	0f b6 92 c0 0c 00 00 	movzbl 0xcc0(%edx),%edx
 700:	89 45 c0             	mov    %eax,-0x40(%ebp)
 703:	89 d8                	mov    %ebx,%eax
 705:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 708:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 70b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 70e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 711:	76 dd                	jbe    6f0 <printint+0x30>
  if(neg)
 713:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 716:	85 c9                	test   %ecx,%ecx
 718:	74 0c                	je     726 <printint+0x66>
    buf[i++] = '-';
 71a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 71f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 721:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 726:	8b 7d b8             	mov    -0x48(%ebp),%edi
 729:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 72d:	eb 07                	jmp    736 <printint+0x76>
 72f:	90                   	nop
 730:	0f b6 13             	movzbl (%ebx),%edx
 733:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 736:	83 ec 04             	sub    $0x4,%esp
 739:	88 55 d7             	mov    %dl,-0x29(%ebp)
 73c:	6a 01                	push   $0x1
 73e:	56                   	push   %esi
 73f:	57                   	push   %edi
 740:	e8 de fe ff ff       	call   623 <write>
  while(--i >= 0)
 745:	83 c4 10             	add    $0x10,%esp
 748:	39 de                	cmp    %ebx,%esi
 74a:	75 e4                	jne    730 <printint+0x70>
    putc(fd, buf[i]);
}
 74c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 74f:	5b                   	pop    %ebx
 750:	5e                   	pop    %esi
 751:	5f                   	pop    %edi
 752:	5d                   	pop    %ebp
 753:	c3                   	ret    
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 758:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 75f:	eb 87                	jmp    6e8 <printint+0x28>
 761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 768:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop

00000770 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 770:	f3 0f 1e fb          	endbr32 
 774:	55                   	push   %ebp
 775:	89 e5                	mov    %esp,%ebp
 777:	57                   	push   %edi
 778:	56                   	push   %esi
 779:	53                   	push   %ebx
 77a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 77d:	8b 75 0c             	mov    0xc(%ebp),%esi
 780:	0f b6 1e             	movzbl (%esi),%ebx
 783:	84 db                	test   %bl,%bl
 785:	0f 84 b4 00 00 00    	je     83f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 78b:	8d 45 10             	lea    0x10(%ebp),%eax
 78e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 791:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 794:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 796:	89 45 d0             	mov    %eax,-0x30(%ebp)
 799:	eb 33                	jmp    7ce <printf+0x5e>
 79b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
 7a0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7a3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 7a8:	83 f8 25             	cmp    $0x25,%eax
 7ab:	74 17                	je     7c4 <printf+0x54>
  write(fd, &c, 1);
 7ad:	83 ec 04             	sub    $0x4,%esp
 7b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7b3:	6a 01                	push   $0x1
 7b5:	57                   	push   %edi
 7b6:	ff 75 08             	pushl  0x8(%ebp)
 7b9:	e8 65 fe ff ff       	call   623 <write>
 7be:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 7c1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7c4:	0f b6 1e             	movzbl (%esi),%ebx
 7c7:	83 c6 01             	add    $0x1,%esi
 7ca:	84 db                	test   %bl,%bl
 7cc:	74 71                	je     83f <printf+0xcf>
    c = fmt[i] & 0xff;
 7ce:	0f be cb             	movsbl %bl,%ecx
 7d1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 7d4:	85 d2                	test   %edx,%edx
 7d6:	74 c8                	je     7a0 <printf+0x30>
      }
    } else if(state == '%'){
 7d8:	83 fa 25             	cmp    $0x25,%edx
 7db:	75 e7                	jne    7c4 <printf+0x54>
      if(c == 'd'){
 7dd:	83 f8 64             	cmp    $0x64,%eax
 7e0:	0f 84 9a 00 00 00    	je     880 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7e6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7ec:	83 f9 70             	cmp    $0x70,%ecx
 7ef:	74 5f                	je     850 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7f1:	83 f8 73             	cmp    $0x73,%eax
 7f4:	0f 84 d6 00 00 00    	je     8d0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7fa:	83 f8 63             	cmp    $0x63,%eax
 7fd:	0f 84 8d 00 00 00    	je     890 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 803:	83 f8 25             	cmp    $0x25,%eax
 806:	0f 84 b4 00 00 00    	je     8c0 <printf+0x150>
  write(fd, &c, 1);
 80c:	83 ec 04             	sub    $0x4,%esp
 80f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 813:	6a 01                	push   $0x1
 815:	57                   	push   %edi
 816:	ff 75 08             	pushl  0x8(%ebp)
 819:	e8 05 fe ff ff       	call   623 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 81e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 821:	83 c4 0c             	add    $0xc,%esp
 824:	6a 01                	push   $0x1
 826:	83 c6 01             	add    $0x1,%esi
 829:	57                   	push   %edi
 82a:	ff 75 08             	pushl  0x8(%ebp)
 82d:	e8 f1 fd ff ff       	call   623 <write>
  for(i = 0; fmt[i]; i++){
 832:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 836:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 839:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 83b:	84 db                	test   %bl,%bl
 83d:	75 8f                	jne    7ce <printf+0x5e>
    }
  }
}
 83f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 842:	5b                   	pop    %ebx
 843:	5e                   	pop    %esi
 844:	5f                   	pop    %edi
 845:	5d                   	pop    %ebp
 846:	c3                   	ret    
 847:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 84e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 850:	83 ec 0c             	sub    $0xc,%esp
 853:	b9 10 00 00 00       	mov    $0x10,%ecx
 858:	6a 00                	push   $0x0
 85a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 85d:	8b 45 08             	mov    0x8(%ebp),%eax
 860:	8b 13                	mov    (%ebx),%edx
 862:	e8 59 fe ff ff       	call   6c0 <printint>
        ap++;
 867:	89 d8                	mov    %ebx,%eax
 869:	83 c4 10             	add    $0x10,%esp
      state = 0;
 86c:	31 d2                	xor    %edx,%edx
        ap++;
 86e:	83 c0 04             	add    $0x4,%eax
 871:	89 45 d0             	mov    %eax,-0x30(%ebp)
 874:	e9 4b ff ff ff       	jmp    7c4 <printf+0x54>
 879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 880:	83 ec 0c             	sub    $0xc,%esp
 883:	b9 0a 00 00 00       	mov    $0xa,%ecx
 888:	6a 01                	push   $0x1
 88a:	eb ce                	jmp    85a <printf+0xea>
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 890:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 893:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 896:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 898:	6a 01                	push   $0x1
        ap++;
 89a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 89d:	57                   	push   %edi
 89e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 8a1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8a4:	e8 7a fd ff ff       	call   623 <write>
        ap++;
 8a9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 8ac:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8af:	31 d2                	xor    %edx,%edx
 8b1:	e9 0e ff ff ff       	jmp    7c4 <printf+0x54>
 8b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 8c0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 8c3:	83 ec 04             	sub    $0x4,%esp
 8c6:	e9 59 ff ff ff       	jmp    824 <printf+0xb4>
 8cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8cf:	90                   	nop
        s = (char*)*ap;
 8d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8d3:	8b 18                	mov    (%eax),%ebx
        ap++;
 8d5:	83 c0 04             	add    $0x4,%eax
 8d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8db:	85 db                	test   %ebx,%ebx
 8dd:	74 17                	je     8f6 <printf+0x186>
        while(*s != 0){
 8df:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 8e2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 8e4:	84 c0                	test   %al,%al
 8e6:	0f 84 d8 fe ff ff    	je     7c4 <printf+0x54>
 8ec:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8ef:	89 de                	mov    %ebx,%esi
 8f1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8f4:	eb 1a                	jmp    910 <printf+0x1a0>
          s = "(null)";
 8f6:	bb b6 0c 00 00       	mov    $0xcb6,%ebx
        while(*s != 0){
 8fb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8fe:	b8 28 00 00 00       	mov    $0x28,%eax
 903:	89 de                	mov    %ebx,%esi
 905:	8b 5d 08             	mov    0x8(%ebp),%ebx
 908:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90f:	90                   	nop
  write(fd, &c, 1);
 910:	83 ec 04             	sub    $0x4,%esp
          s++;
 913:	83 c6 01             	add    $0x1,%esi
 916:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 919:	6a 01                	push   $0x1
 91b:	57                   	push   %edi
 91c:	53                   	push   %ebx
 91d:	e8 01 fd ff ff       	call   623 <write>
        while(*s != 0){
 922:	0f b6 06             	movzbl (%esi),%eax
 925:	83 c4 10             	add    $0x10,%esp
 928:	84 c0                	test   %al,%al
 92a:	75 e4                	jne    910 <printf+0x1a0>
 92c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 92f:	31 d2                	xor    %edx,%edx
 931:	e9 8e fe ff ff       	jmp    7c4 <printf+0x54>
 936:	66 90                	xchg   %ax,%ax
 938:	66 90                	xchg   %ax,%ax
 93a:	66 90                	xchg   %ax,%ax
 93c:	66 90                	xchg   %ax,%ax
 93e:	66 90                	xchg   %ax,%ax

00000940 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 940:	f3 0f 1e fb          	endbr32 
 944:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 945:	a1 20 10 00 00       	mov    0x1020,%eax
{
 94a:	89 e5                	mov    %esp,%ebp
 94c:	57                   	push   %edi
 94d:	56                   	push   %esi
 94e:	53                   	push   %ebx
 94f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 952:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 954:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 957:	39 c8                	cmp    %ecx,%eax
 959:	73 15                	jae    970 <free+0x30>
 95b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 95f:	90                   	nop
 960:	39 d1                	cmp    %edx,%ecx
 962:	72 14                	jb     978 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 964:	39 d0                	cmp    %edx,%eax
 966:	73 10                	jae    978 <free+0x38>
{
 968:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96a:	8b 10                	mov    (%eax),%edx
 96c:	39 c8                	cmp    %ecx,%eax
 96e:	72 f0                	jb     960 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 970:	39 d0                	cmp    %edx,%eax
 972:	72 f4                	jb     968 <free+0x28>
 974:	39 d1                	cmp    %edx,%ecx
 976:	73 f0                	jae    968 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 978:	8b 73 fc             	mov    -0x4(%ebx),%esi
 97b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 97e:	39 fa                	cmp    %edi,%edx
 980:	74 1e                	je     9a0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 982:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 985:	8b 50 04             	mov    0x4(%eax),%edx
 988:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 98b:	39 f1                	cmp    %esi,%ecx
 98d:	74 28                	je     9b7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 98f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 991:	5b                   	pop    %ebx
  freep = p;
 992:	a3 20 10 00 00       	mov    %eax,0x1020
}
 997:	5e                   	pop    %esi
 998:	5f                   	pop    %edi
 999:	5d                   	pop    %ebp
 99a:	c3                   	ret    
 99b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 99f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 9a0:	03 72 04             	add    0x4(%edx),%esi
 9a3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9a6:	8b 10                	mov    (%eax),%edx
 9a8:	8b 12                	mov    (%edx),%edx
 9aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ad:	8b 50 04             	mov    0x4(%eax),%edx
 9b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b3:	39 f1                	cmp    %esi,%ecx
 9b5:	75 d8                	jne    98f <free+0x4f>
    p->s.size += bp->s.size;
 9b7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 9ba:	a3 20 10 00 00       	mov    %eax,0x1020
    p->s.size += bp->s.size;
 9bf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9c2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9c5:	89 10                	mov    %edx,(%eax)
}
 9c7:	5b                   	pop    %ebx
 9c8:	5e                   	pop    %esi
 9c9:	5f                   	pop    %edi
 9ca:	5d                   	pop    %ebp
 9cb:	c3                   	ret    
 9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9d0:	f3 0f 1e fb          	endbr32 
 9d4:	55                   	push   %ebp
 9d5:	89 e5                	mov    %esp,%ebp
 9d7:	57                   	push   %edi
 9d8:	56                   	push   %esi
 9d9:	53                   	push   %ebx
 9da:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9dd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9e0:	8b 3d 20 10 00 00    	mov    0x1020,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e6:	8d 70 07             	lea    0x7(%eax),%esi
 9e9:	c1 ee 03             	shr    $0x3,%esi
 9ec:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 9ef:	85 ff                	test   %edi,%edi
 9f1:	0f 84 a9 00 00 00    	je     aa0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 9f9:	8b 48 04             	mov    0x4(%eax),%ecx
 9fc:	39 f1                	cmp    %esi,%ecx
 9fe:	73 6d                	jae    a6d <malloc+0x9d>
 a00:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a06:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a0b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a0e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 a15:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 a18:	eb 17                	jmp    a31 <malloc+0x61>
 a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a20:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 a22:	8b 4a 04             	mov    0x4(%edx),%ecx
 a25:	39 f1                	cmp    %esi,%ecx
 a27:	73 4f                	jae    a78 <malloc+0xa8>
 a29:	8b 3d 20 10 00 00    	mov    0x1020,%edi
 a2f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a31:	39 c7                	cmp    %eax,%edi
 a33:	75 eb                	jne    a20 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 a35:	83 ec 0c             	sub    $0xc,%esp
 a38:	ff 75 e4             	pushl  -0x1c(%ebp)
 a3b:	e8 4b fc ff ff       	call   68b <sbrk>
  if(p == (char*)-1)
 a40:	83 c4 10             	add    $0x10,%esp
 a43:	83 f8 ff             	cmp    $0xffffffff,%eax
 a46:	74 1b                	je     a63 <malloc+0x93>
  hp->s.size = nu;
 a48:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a4b:	83 ec 0c             	sub    $0xc,%esp
 a4e:	83 c0 08             	add    $0x8,%eax
 a51:	50                   	push   %eax
 a52:	e8 e9 fe ff ff       	call   940 <free>
  return freep;
 a57:	a1 20 10 00 00       	mov    0x1020,%eax
      if((p = morecore(nunits)) == 0)
 a5c:	83 c4 10             	add    $0x10,%esp
 a5f:	85 c0                	test   %eax,%eax
 a61:	75 bd                	jne    a20 <malloc+0x50>
        return 0;
  }
}
 a63:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a66:	31 c0                	xor    %eax,%eax
}
 a68:	5b                   	pop    %ebx
 a69:	5e                   	pop    %esi
 a6a:	5f                   	pop    %edi
 a6b:	5d                   	pop    %ebp
 a6c:	c3                   	ret    
    if(p->s.size >= nunits){
 a6d:	89 c2                	mov    %eax,%edx
 a6f:	89 f8                	mov    %edi,%eax
 a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 a78:	39 ce                	cmp    %ecx,%esi
 a7a:	74 54                	je     ad0 <malloc+0x100>
        p->s.size -= nunits;
 a7c:	29 f1                	sub    %esi,%ecx
 a7e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 a81:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 a84:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 a87:	a3 20 10 00 00       	mov    %eax,0x1020
}
 a8c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a8f:	8d 42 08             	lea    0x8(%edx),%eax
}
 a92:	5b                   	pop    %ebx
 a93:	5e                   	pop    %esi
 a94:	5f                   	pop    %edi
 a95:	5d                   	pop    %ebp
 a96:	c3                   	ret    
 a97:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a9e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 aa0:	c7 05 20 10 00 00 24 	movl   $0x1024,0x1020
 aa7:	10 00 00 
    base.s.size = 0;
 aaa:	bf 24 10 00 00       	mov    $0x1024,%edi
    base.s.ptr = freep = prevp = &base;
 aaf:	c7 05 24 10 00 00 24 	movl   $0x1024,0x1024
 ab6:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 abb:	c7 05 28 10 00 00 00 	movl   $0x0,0x1028
 ac2:	00 00 00 
    if(p->s.size >= nunits){
 ac5:	e9 36 ff ff ff       	jmp    a00 <malloc+0x30>
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 ad0:	8b 0a                	mov    (%edx),%ecx
 ad2:	89 08                	mov    %ecx,(%eax)
 ad4:	eb b1                	jmp    a87 <malloc+0xb7>
