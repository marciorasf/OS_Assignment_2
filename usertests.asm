
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 b2 4c 00 00       	push   $0x4cb2
      16:	6a 01                	push   $0x1
      18:	e8 43 39 00 00       	call   3960 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	59                   	pop    %ecx
      1e:	58                   	pop    %eax
      1f:	6a 00                	push   $0x0
      21:	68 c6 4c 00 00       	push   $0x4cc6
      26:	e8 2f 38 00 00       	call   385a <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 13                	js     45 <main+0x45>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	52                   	push   %edx
      33:	52                   	push   %edx
      34:	68 30 54 00 00       	push   $0x5430
      39:	6a 01                	push   $0x1
      3b:	e8 20 39 00 00       	call   3960 <printf>
    exit();
      40:	e8 bd 37 00 00       	call   3802 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      45:	50                   	push   %eax
      46:	50                   	push   %eax
      47:	68 00 02 00 00       	push   $0x200
      4c:	68 c6 4c 00 00       	push   $0x4cc6
      51:	e8 04 38 00 00       	call   385a <open>
      56:	89 04 24             	mov    %eax,(%esp)
      59:	e8 dc 37 00 00       	call   383a <close>
  dirfile();
  iref();
  forktest();
  bigdir(); // slow */

  uio();
      5e:	e8 3d 34 00 00       	call   34a0 <uio>

  exectest();
      63:	e8 a8 08 00 00       	call   910 <exectest>

  exit();
      68:	e8 95 37 00 00       	call   3802 <exit>
      6d:	66 90                	xchg   %ax,%ax
      6f:	90                   	nop

00000070 <iputtest>:
{
      70:	55                   	push   %ebp
      71:	89 e5                	mov    %esp,%ebp
      73:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
      76:	68 4c 3d 00 00       	push   $0x3d4c
      7b:	ff 35 74 5d 00 00    	pushl  0x5d74
      81:	e8 da 38 00 00       	call   3960 <printf>
  if(mkdir("iputdir") < 0){
      86:	c7 04 24 df 3c 00 00 	movl   $0x3cdf,(%esp)
      8d:	e8 f0 37 00 00       	call   3882 <mkdir>
      92:	83 c4 10             	add    $0x10,%esp
      95:	85 c0                	test   %eax,%eax
      97:	78 58                	js     f1 <iputtest+0x81>
  if(chdir("iputdir") < 0){
      99:	83 ec 0c             	sub    $0xc,%esp
      9c:	68 df 3c 00 00       	push   $0x3cdf
      a1:	e8 e4 37 00 00       	call   388a <chdir>
      a6:	83 c4 10             	add    $0x10,%esp
      a9:	85 c0                	test   %eax,%eax
      ab:	0f 88 85 00 00 00    	js     136 <iputtest+0xc6>
  if(unlink("../iputdir") < 0){
      b1:	83 ec 0c             	sub    $0xc,%esp
      b4:	68 dc 3c 00 00       	push   $0x3cdc
      b9:	e8 ac 37 00 00       	call   386a <unlink>
      be:	83 c4 10             	add    $0x10,%esp
      c1:	85 c0                	test   %eax,%eax
      c3:	78 5a                	js     11f <iputtest+0xaf>
  if(chdir("/") < 0){
      c5:	83 ec 0c             	sub    $0xc,%esp
      c8:	68 01 3d 00 00       	push   $0x3d01
      cd:	e8 b8 37 00 00       	call   388a <chdir>
      d2:	83 c4 10             	add    $0x10,%esp
      d5:	85 c0                	test   %eax,%eax
      d7:	78 2f                	js     108 <iputtest+0x98>
  printf(stdout, "iput test ok\n");
      d9:	83 ec 08             	sub    $0x8,%esp
      dc:	68 84 3d 00 00       	push   $0x3d84
      e1:	ff 35 74 5d 00 00    	pushl  0x5d74
      e7:	e8 74 38 00 00       	call   3960 <printf>
}
      ec:	83 c4 10             	add    $0x10,%esp
      ef:	c9                   	leave  
      f0:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
      f1:	50                   	push   %eax
      f2:	50                   	push   %eax
      f3:	68 b8 3c 00 00       	push   $0x3cb8
      f8:	ff 35 74 5d 00 00    	pushl  0x5d74
      fe:	e8 5d 38 00 00       	call   3960 <printf>
    exit();
     103:	e8 fa 36 00 00       	call   3802 <exit>
    printf(stdout, "chdir / failed\n");
     108:	50                   	push   %eax
     109:	50                   	push   %eax
     10a:	68 03 3d 00 00       	push   $0x3d03
     10f:	ff 35 74 5d 00 00    	pushl  0x5d74
     115:	e8 46 38 00 00       	call   3960 <printf>
    exit();
     11a:	e8 e3 36 00 00       	call   3802 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     11f:	52                   	push   %edx
     120:	52                   	push   %edx
     121:	68 e7 3c 00 00       	push   $0x3ce7
     126:	ff 35 74 5d 00 00    	pushl  0x5d74
     12c:	e8 2f 38 00 00       	call   3960 <printf>
    exit();
     131:	e8 cc 36 00 00       	call   3802 <exit>
    printf(stdout, "chdir iputdir failed\n");
     136:	51                   	push   %ecx
     137:	51                   	push   %ecx
     138:	68 c6 3c 00 00       	push   $0x3cc6
     13d:	ff 35 74 5d 00 00    	pushl  0x5d74
     143:	e8 18 38 00 00       	call   3960 <printf>
    exit();
     148:	e8 b5 36 00 00       	call   3802 <exit>
     14d:	8d 76 00             	lea    0x0(%esi),%esi

00000150 <exitiputtest>:
{
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     156:	68 13 3d 00 00       	push   $0x3d13
     15b:	ff 35 74 5d 00 00    	pushl  0x5d74
     161:	e8 fa 37 00 00       	call   3960 <printf>
  pid = fork();
     166:	e8 8f 36 00 00       	call   37fa <fork>
  if(pid < 0){
     16b:	83 c4 10             	add    $0x10,%esp
     16e:	85 c0                	test   %eax,%eax
     170:	0f 88 82 00 00 00    	js     1f8 <exitiputtest+0xa8>
  if(pid == 0){
     176:	75 48                	jne    1c0 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     178:	83 ec 0c             	sub    $0xc,%esp
     17b:	68 df 3c 00 00       	push   $0x3cdf
     180:	e8 fd 36 00 00       	call   3882 <mkdir>
     185:	83 c4 10             	add    $0x10,%esp
     188:	85 c0                	test   %eax,%eax
     18a:	0f 88 96 00 00 00    	js     226 <exitiputtest+0xd6>
    if(chdir("iputdir") < 0){
     190:	83 ec 0c             	sub    $0xc,%esp
     193:	68 df 3c 00 00       	push   $0x3cdf
     198:	e8 ed 36 00 00       	call   388a <chdir>
     19d:	83 c4 10             	add    $0x10,%esp
     1a0:	85 c0                	test   %eax,%eax
     1a2:	78 6b                	js     20f <exitiputtest+0xbf>
    if(unlink("../iputdir") < 0){
     1a4:	83 ec 0c             	sub    $0xc,%esp
     1a7:	68 dc 3c 00 00       	push   $0x3cdc
     1ac:	e8 b9 36 00 00       	call   386a <unlink>
     1b1:	83 c4 10             	add    $0x10,%esp
     1b4:	85 c0                	test   %eax,%eax
     1b6:	78 28                	js     1e0 <exitiputtest+0x90>
    exit();
     1b8:	e8 45 36 00 00       	call   3802 <exit>
     1bd:	8d 76 00             	lea    0x0(%esi),%esi
  wait();
     1c0:	e8 45 36 00 00       	call   380a <wait>
  printf(stdout, "exitiput test ok\n");
     1c5:	83 ec 08             	sub    $0x8,%esp
     1c8:	68 36 3d 00 00       	push   $0x3d36
     1cd:	ff 35 74 5d 00 00    	pushl  0x5d74
     1d3:	e8 88 37 00 00       	call   3960 <printf>
}
     1d8:	83 c4 10             	add    $0x10,%esp
     1db:	c9                   	leave  
     1dc:	c3                   	ret    
     1dd:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     1e0:	83 ec 08             	sub    $0x8,%esp
     1e3:	68 e7 3c 00 00       	push   $0x3ce7
     1e8:	ff 35 74 5d 00 00    	pushl  0x5d74
     1ee:	e8 6d 37 00 00       	call   3960 <printf>
      exit();
     1f3:	e8 0a 36 00 00       	call   3802 <exit>
    printf(stdout, "fork failed\n");
     1f8:	51                   	push   %ecx
     1f9:	51                   	push   %ecx
     1fa:	68 f9 4b 00 00       	push   $0x4bf9
     1ff:	ff 35 74 5d 00 00    	pushl  0x5d74
     205:	e8 56 37 00 00       	call   3960 <printf>
    exit();
     20a:	e8 f3 35 00 00       	call   3802 <exit>
      printf(stdout, "child chdir failed\n");
     20f:	50                   	push   %eax
     210:	50                   	push   %eax
     211:	68 22 3d 00 00       	push   $0x3d22
     216:	ff 35 74 5d 00 00    	pushl  0x5d74
     21c:	e8 3f 37 00 00       	call   3960 <printf>
      exit();
     221:	e8 dc 35 00 00       	call   3802 <exit>
      printf(stdout, "mkdir failed\n");
     226:	52                   	push   %edx
     227:	52                   	push   %edx
     228:	68 b8 3c 00 00       	push   $0x3cb8
     22d:	ff 35 74 5d 00 00    	pushl  0x5d74
     233:	e8 28 37 00 00       	call   3960 <printf>
      exit();
     238:	e8 c5 35 00 00       	call   3802 <exit>
     23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <openiputtest>:
{
     240:	55                   	push   %ebp
     241:	89 e5                	mov    %esp,%ebp
     243:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     246:	68 48 3d 00 00       	push   $0x3d48
     24b:	ff 35 74 5d 00 00    	pushl  0x5d74
     251:	e8 0a 37 00 00       	call   3960 <printf>
  if(mkdir("oidir") < 0){
     256:	c7 04 24 57 3d 00 00 	movl   $0x3d57,(%esp)
     25d:	e8 20 36 00 00       	call   3882 <mkdir>
     262:	83 c4 10             	add    $0x10,%esp
     265:	85 c0                	test   %eax,%eax
     267:	0f 88 88 00 00 00    	js     2f5 <openiputtest+0xb5>
  pid = fork();
     26d:	e8 88 35 00 00       	call   37fa <fork>
  if(pid < 0){
     272:	85 c0                	test   %eax,%eax
     274:	0f 88 92 00 00 00    	js     30c <openiputtest+0xcc>
  if(pid == 0){
     27a:	75 34                	jne    2b0 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     27c:	83 ec 08             	sub    $0x8,%esp
     27f:	6a 02                	push   $0x2
     281:	68 57 3d 00 00       	push   $0x3d57
     286:	e8 cf 35 00 00       	call   385a <open>
    if(fd >= 0){
     28b:	83 c4 10             	add    $0x10,%esp
     28e:	85 c0                	test   %eax,%eax
     290:	78 5e                	js     2f0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     292:	83 ec 08             	sub    $0x8,%esp
     295:	68 e8 4c 00 00       	push   $0x4ce8
     29a:	ff 35 74 5d 00 00    	pushl  0x5d74
     2a0:	e8 bb 36 00 00       	call   3960 <printf>
      exit();
     2a5:	e8 58 35 00 00       	call   3802 <exit>
     2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  sleep(1);
     2b0:	83 ec 0c             	sub    $0xc,%esp
     2b3:	6a 01                	push   $0x1
     2b5:	e8 f0 35 00 00       	call   38aa <sleep>
  if(unlink("oidir") != 0){
     2ba:	c7 04 24 57 3d 00 00 	movl   $0x3d57,(%esp)
     2c1:	e8 a4 35 00 00       	call   386a <unlink>
     2c6:	83 c4 10             	add    $0x10,%esp
     2c9:	85 c0                	test   %eax,%eax
     2cb:	75 56                	jne    323 <openiputtest+0xe3>
  wait();
     2cd:	e8 38 35 00 00       	call   380a <wait>
  printf(stdout, "openiput test ok\n");
     2d2:	83 ec 08             	sub    $0x8,%esp
     2d5:	68 80 3d 00 00       	push   $0x3d80
     2da:	ff 35 74 5d 00 00    	pushl  0x5d74
     2e0:	e8 7b 36 00 00       	call   3960 <printf>
}
     2e5:	83 c4 10             	add    $0x10,%esp
     2e8:	c9                   	leave  
     2e9:	c3                   	ret    
     2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
     2f0:	e8 0d 35 00 00       	call   3802 <exit>
    printf(stdout, "mkdir oidir failed\n");
     2f5:	51                   	push   %ecx
     2f6:	51                   	push   %ecx
     2f7:	68 5d 3d 00 00       	push   $0x3d5d
     2fc:	ff 35 74 5d 00 00    	pushl  0x5d74
     302:	e8 59 36 00 00       	call   3960 <printf>
    exit();
     307:	e8 f6 34 00 00       	call   3802 <exit>
    printf(stdout, "fork failed\n");
     30c:	52                   	push   %edx
     30d:	52                   	push   %edx
     30e:	68 f9 4b 00 00       	push   $0x4bf9
     313:	ff 35 74 5d 00 00    	pushl  0x5d74
     319:	e8 42 36 00 00       	call   3960 <printf>
    exit();
     31e:	e8 df 34 00 00       	call   3802 <exit>
    printf(stdout, "unlink failed\n");
     323:	50                   	push   %eax
     324:	50                   	push   %eax
     325:	68 71 3d 00 00       	push   $0x3d71
     32a:	ff 35 74 5d 00 00    	pushl  0x5d74
     330:	e8 2b 36 00 00       	call   3960 <printf>
    exit();
     335:	e8 c8 34 00 00       	call   3802 <exit>
     33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <opentest>:
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     346:	68 92 3d 00 00       	push   $0x3d92
     34b:	ff 35 74 5d 00 00    	pushl  0x5d74
     351:	e8 0a 36 00 00       	call   3960 <printf>
  fd = open("echo", 0);
     356:	58                   	pop    %eax
     357:	5a                   	pop    %edx
     358:	6a 00                	push   $0x0
     35a:	68 9d 3d 00 00       	push   $0x3d9d
     35f:	e8 f6 34 00 00       	call   385a <open>
  if(fd < 0){
     364:	83 c4 10             	add    $0x10,%esp
     367:	85 c0                	test   %eax,%eax
     369:	78 36                	js     3a1 <opentest+0x61>
  close(fd);
     36b:	83 ec 0c             	sub    $0xc,%esp
     36e:	50                   	push   %eax
     36f:	e8 c6 34 00 00       	call   383a <close>
  fd = open("doesnotexist", 0);
     374:	5a                   	pop    %edx
     375:	59                   	pop    %ecx
     376:	6a 00                	push   $0x0
     378:	68 b5 3d 00 00       	push   $0x3db5
     37d:	e8 d8 34 00 00       	call   385a <open>
  if(fd >= 0){
     382:	83 c4 10             	add    $0x10,%esp
     385:	85 c0                	test   %eax,%eax
     387:	79 2f                	jns    3b8 <opentest+0x78>
  printf(stdout, "open test ok\n");
     389:	83 ec 08             	sub    $0x8,%esp
     38c:	68 e0 3d 00 00       	push   $0x3de0
     391:	ff 35 74 5d 00 00    	pushl  0x5d74
     397:	e8 c4 35 00 00       	call   3960 <printf>
}
     39c:	83 c4 10             	add    $0x10,%esp
     39f:	c9                   	leave  
     3a0:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     3a1:	50                   	push   %eax
     3a2:	50                   	push   %eax
     3a3:	68 a2 3d 00 00       	push   $0x3da2
     3a8:	ff 35 74 5d 00 00    	pushl  0x5d74
     3ae:	e8 ad 35 00 00       	call   3960 <printf>
    exit();
     3b3:	e8 4a 34 00 00       	call   3802 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     3b8:	50                   	push   %eax
     3b9:	50                   	push   %eax
     3ba:	68 c2 3d 00 00       	push   $0x3dc2
     3bf:	ff 35 74 5d 00 00    	pushl  0x5d74
     3c5:	e8 96 35 00 00       	call   3960 <printf>
    exit();
     3ca:	e8 33 34 00 00       	call   3802 <exit>
     3cf:	90                   	nop

000003d0 <writetest>:
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	56                   	push   %esi
     3d4:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     3d5:	83 ec 08             	sub    $0x8,%esp
     3d8:	68 ee 3d 00 00       	push   $0x3dee
     3dd:	ff 35 74 5d 00 00    	pushl  0x5d74
     3e3:	e8 78 35 00 00       	call   3960 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     3e8:	58                   	pop    %eax
     3e9:	5a                   	pop    %edx
     3ea:	68 02 02 00 00       	push   $0x202
     3ef:	68 ff 3d 00 00       	push   $0x3dff
     3f4:	e8 61 34 00 00       	call   385a <open>
  if(fd >= 0){
     3f9:	83 c4 10             	add    $0x10,%esp
     3fc:	85 c0                	test   %eax,%eax
     3fe:	0f 88 88 01 00 00    	js     58c <writetest+0x1bc>
    printf(stdout, "creat small succeeded; ok\n");
     404:	83 ec 08             	sub    $0x8,%esp
     407:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
     409:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
     40b:	68 05 3e 00 00       	push   $0x3e05
     410:	ff 35 74 5d 00 00    	pushl  0x5d74
     416:	e8 45 35 00 00       	call   3960 <printf>
     41b:	83 c4 10             	add    $0x10,%esp
     41e:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     420:	83 ec 04             	sub    $0x4,%esp
     423:	6a 0a                	push   $0xa
     425:	68 3c 3e 00 00       	push   $0x3e3c
     42a:	56                   	push   %esi
     42b:	e8 02 34 00 00       	call   3832 <write>
     430:	83 c4 10             	add    $0x10,%esp
     433:	83 f8 0a             	cmp    $0xa,%eax
     436:	0f 85 d9 00 00 00    	jne    515 <writetest+0x145>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     43c:	83 ec 04             	sub    $0x4,%esp
     43f:	6a 0a                	push   $0xa
     441:	68 47 3e 00 00       	push   $0x3e47
     446:	56                   	push   %esi
     447:	e8 e6 33 00 00       	call   3832 <write>
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	83 f8 0a             	cmp    $0xa,%eax
     452:	0f 85 d6 00 00 00    	jne    52e <writetest+0x15e>
  for(i = 0; i < 100; i++){
     458:	83 c3 01             	add    $0x1,%ebx
     45b:	83 fb 64             	cmp    $0x64,%ebx
     45e:	75 c0                	jne    420 <writetest+0x50>
  printf(stdout, "writes ok\n");
     460:	83 ec 08             	sub    $0x8,%esp
     463:	68 52 3e 00 00       	push   $0x3e52
     468:	ff 35 74 5d 00 00    	pushl  0x5d74
     46e:	e8 ed 34 00 00       	call   3960 <printf>
  close(fd);
     473:	89 34 24             	mov    %esi,(%esp)
     476:	e8 bf 33 00 00       	call   383a <close>
  fd = open("small", O_RDONLY);
     47b:	5b                   	pop    %ebx
     47c:	5e                   	pop    %esi
     47d:	6a 00                	push   $0x0
     47f:	68 ff 3d 00 00       	push   $0x3dff
     484:	e8 d1 33 00 00       	call   385a <open>
  if(fd >= 0){
     489:	83 c4 10             	add    $0x10,%esp
     48c:	85 c0                	test   %eax,%eax
  fd = open("small", O_RDONLY);
     48e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     490:	0f 88 b1 00 00 00    	js     547 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     496:	83 ec 08             	sub    $0x8,%esp
     499:	68 5d 3e 00 00       	push   $0x3e5d
     49e:	ff 35 74 5d 00 00    	pushl  0x5d74
     4a4:	e8 b7 34 00 00       	call   3960 <printf>
  i = read(fd, buf, 2000);
     4a9:	83 c4 0c             	add    $0xc,%esp
     4ac:	68 d0 07 00 00       	push   $0x7d0
     4b1:	68 60 85 00 00       	push   $0x8560
     4b6:	53                   	push   %ebx
     4b7:	e8 6e 33 00 00       	call   382a <read>
  if(i == 2000){
     4bc:	83 c4 10             	add    $0x10,%esp
     4bf:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     4c4:	0f 85 94 00 00 00    	jne    55e <writetest+0x18e>
    printf(stdout, "read succeeded ok\n");
     4ca:	83 ec 08             	sub    $0x8,%esp
     4cd:	68 91 3e 00 00       	push   $0x3e91
     4d2:	ff 35 74 5d 00 00    	pushl  0x5d74
     4d8:	e8 83 34 00 00       	call   3960 <printf>
  close(fd);
     4dd:	89 1c 24             	mov    %ebx,(%esp)
     4e0:	e8 55 33 00 00       	call   383a <close>
  if(unlink("small") < 0){
     4e5:	c7 04 24 ff 3d 00 00 	movl   $0x3dff,(%esp)
     4ec:	e8 79 33 00 00       	call   386a <unlink>
     4f1:	83 c4 10             	add    $0x10,%esp
     4f4:	85 c0                	test   %eax,%eax
     4f6:	78 7d                	js     575 <writetest+0x1a5>
  printf(stdout, "small file test ok\n");
     4f8:	83 ec 08             	sub    $0x8,%esp
     4fb:	68 b9 3e 00 00       	push   $0x3eb9
     500:	ff 35 74 5d 00 00    	pushl  0x5d74
     506:	e8 55 34 00 00       	call   3960 <printf>
}
     50b:	83 c4 10             	add    $0x10,%esp
     50e:	8d 65 f8             	lea    -0x8(%ebp),%esp
     511:	5b                   	pop    %ebx
     512:	5e                   	pop    %esi
     513:	5d                   	pop    %ebp
     514:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     515:	83 ec 04             	sub    $0x4,%esp
     518:	53                   	push   %ebx
     519:	68 0c 4d 00 00       	push   $0x4d0c
     51e:	ff 35 74 5d 00 00    	pushl  0x5d74
     524:	e8 37 34 00 00       	call   3960 <printf>
      exit();
     529:	e8 d4 32 00 00       	call   3802 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     52e:	83 ec 04             	sub    $0x4,%esp
     531:	53                   	push   %ebx
     532:	68 30 4d 00 00       	push   $0x4d30
     537:	ff 35 74 5d 00 00    	pushl  0x5d74
     53d:	e8 1e 34 00 00       	call   3960 <printf>
      exit();
     542:	e8 bb 32 00 00       	call   3802 <exit>
    printf(stdout, "error: open small failed!\n");
     547:	51                   	push   %ecx
     548:	51                   	push   %ecx
     549:	68 76 3e 00 00       	push   $0x3e76
     54e:	ff 35 74 5d 00 00    	pushl  0x5d74
     554:	e8 07 34 00 00       	call   3960 <printf>
    exit();
     559:	e8 a4 32 00 00       	call   3802 <exit>
    printf(stdout, "read failed\n");
     55e:	52                   	push   %edx
     55f:	52                   	push   %edx
     560:	68 bd 41 00 00       	push   $0x41bd
     565:	ff 35 74 5d 00 00    	pushl  0x5d74
     56b:	e8 f0 33 00 00       	call   3960 <printf>
    exit();
     570:	e8 8d 32 00 00       	call   3802 <exit>
    printf(stdout, "unlink small failed\n");
     575:	50                   	push   %eax
     576:	50                   	push   %eax
     577:	68 a4 3e 00 00       	push   $0x3ea4
     57c:	ff 35 74 5d 00 00    	pushl  0x5d74
     582:	e8 d9 33 00 00       	call   3960 <printf>
    exit();
     587:	e8 76 32 00 00       	call   3802 <exit>
    printf(stdout, "error: creat small failed!\n");
     58c:	50                   	push   %eax
     58d:	50                   	push   %eax
     58e:	68 20 3e 00 00       	push   $0x3e20
     593:	ff 35 74 5d 00 00    	pushl  0x5d74
     599:	e8 c2 33 00 00       	call   3960 <printf>
    exit();
     59e:	e8 5f 32 00 00       	call   3802 <exit>
     5a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     5a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005b0 <writetest1>:
{
     5b0:	55                   	push   %ebp
     5b1:	89 e5                	mov    %esp,%ebp
     5b3:	56                   	push   %esi
     5b4:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     5b5:	83 ec 08             	sub    $0x8,%esp
     5b8:	68 cd 3e 00 00       	push   $0x3ecd
     5bd:	ff 35 74 5d 00 00    	pushl  0x5d74
     5c3:	e8 98 33 00 00       	call   3960 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     5c8:	58                   	pop    %eax
     5c9:	5a                   	pop    %edx
     5ca:	68 02 02 00 00       	push   $0x202
     5cf:	68 47 3f 00 00       	push   $0x3f47
     5d4:	e8 81 32 00 00       	call   385a <open>
  if(fd < 0){
     5d9:	83 c4 10             	add    $0x10,%esp
     5dc:	85 c0                	test   %eax,%eax
     5de:	0f 88 61 01 00 00    	js     745 <writetest1+0x195>
     5e4:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
     5e6:	31 db                	xor    %ebx,%ebx
     5e8:	90                   	nop
     5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(write(fd, buf, 512) != 512){
     5f0:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     5f3:	89 1d 60 85 00 00    	mov    %ebx,0x8560
    if(write(fd, buf, 512) != 512){
     5f9:	68 00 02 00 00       	push   $0x200
     5fe:	68 60 85 00 00       	push   $0x8560
     603:	56                   	push   %esi
     604:	e8 29 32 00 00       	call   3832 <write>
     609:	83 c4 10             	add    $0x10,%esp
     60c:	3d 00 02 00 00       	cmp    $0x200,%eax
     611:	0f 85 b3 00 00 00    	jne    6ca <writetest1+0x11a>
  for(i = 0; i < MAXFILE; i++){
     617:	83 c3 01             	add    $0x1,%ebx
     61a:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     620:	75 ce                	jne    5f0 <writetest1+0x40>
  close(fd);
     622:	83 ec 0c             	sub    $0xc,%esp
     625:	56                   	push   %esi
     626:	e8 0f 32 00 00       	call   383a <close>
  fd = open("big", O_RDONLY);
     62b:	5b                   	pop    %ebx
     62c:	5e                   	pop    %esi
     62d:	6a 00                	push   $0x0
     62f:	68 47 3f 00 00       	push   $0x3f47
     634:	e8 21 32 00 00       	call   385a <open>
  if(fd < 0){
     639:	83 c4 10             	add    $0x10,%esp
     63c:	85 c0                	test   %eax,%eax
  fd = open("big", O_RDONLY);
     63e:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     640:	0f 88 e8 00 00 00    	js     72e <writetest1+0x17e>
  n = 0;
     646:	31 db                	xor    %ebx,%ebx
     648:	eb 1d                	jmp    667 <writetest1+0xb7>
     64a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     650:	3d 00 02 00 00       	cmp    $0x200,%eax
     655:	0f 85 9f 00 00 00    	jne    6fa <writetest1+0x14a>
    if(((int*)buf)[0] != n){
     65b:	a1 60 85 00 00       	mov    0x8560,%eax
     660:	39 d8                	cmp    %ebx,%eax
     662:	75 7f                	jne    6e3 <writetest1+0x133>
    n++;
     664:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     667:	83 ec 04             	sub    $0x4,%esp
     66a:	68 00 02 00 00       	push   $0x200
     66f:	68 60 85 00 00       	push   $0x8560
     674:	56                   	push   %esi
     675:	e8 b0 31 00 00       	call   382a <read>
    if(i == 0){
     67a:	83 c4 10             	add    $0x10,%esp
     67d:	85 c0                	test   %eax,%eax
     67f:	75 cf                	jne    650 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     681:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     687:	0f 84 86 00 00 00    	je     713 <writetest1+0x163>
  close(fd);
     68d:	83 ec 0c             	sub    $0xc,%esp
     690:	56                   	push   %esi
     691:	e8 a4 31 00 00       	call   383a <close>
  if(unlink("big") < 0){
     696:	c7 04 24 47 3f 00 00 	movl   $0x3f47,(%esp)
     69d:	e8 c8 31 00 00       	call   386a <unlink>
     6a2:	83 c4 10             	add    $0x10,%esp
     6a5:	85 c0                	test   %eax,%eax
     6a7:	0f 88 af 00 00 00    	js     75c <writetest1+0x1ac>
  printf(stdout, "big files ok\n");
     6ad:	83 ec 08             	sub    $0x8,%esp
     6b0:	68 6e 3f 00 00       	push   $0x3f6e
     6b5:	ff 35 74 5d 00 00    	pushl  0x5d74
     6bb:	e8 a0 32 00 00       	call   3960 <printf>
}
     6c0:	83 c4 10             	add    $0x10,%esp
     6c3:	8d 65 f8             	lea    -0x8(%ebp),%esp
     6c6:	5b                   	pop    %ebx
     6c7:	5e                   	pop    %esi
     6c8:	5d                   	pop    %ebp
     6c9:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     6ca:	83 ec 04             	sub    $0x4,%esp
     6cd:	53                   	push   %ebx
     6ce:	68 f7 3e 00 00       	push   $0x3ef7
     6d3:	ff 35 74 5d 00 00    	pushl  0x5d74
     6d9:	e8 82 32 00 00       	call   3960 <printf>
      exit();
     6de:	e8 1f 31 00 00       	call   3802 <exit>
      printf(stdout, "read content of block %d is %d\n",
     6e3:	50                   	push   %eax
     6e4:	53                   	push   %ebx
     6e5:	68 54 4d 00 00       	push   $0x4d54
     6ea:	ff 35 74 5d 00 00    	pushl  0x5d74
     6f0:	e8 6b 32 00 00       	call   3960 <printf>
      exit();
     6f5:	e8 08 31 00 00       	call   3802 <exit>
      printf(stdout, "read failed %d\n", i);
     6fa:	83 ec 04             	sub    $0x4,%esp
     6fd:	50                   	push   %eax
     6fe:	68 4b 3f 00 00       	push   $0x3f4b
     703:	ff 35 74 5d 00 00    	pushl  0x5d74
     709:	e8 52 32 00 00       	call   3960 <printf>
      exit();
     70e:	e8 ef 30 00 00       	call   3802 <exit>
        printf(stdout, "read only %d blocks from big", n);
     713:	52                   	push   %edx
     714:	68 8b 00 00 00       	push   $0x8b
     719:	68 2e 3f 00 00       	push   $0x3f2e
     71e:	ff 35 74 5d 00 00    	pushl  0x5d74
     724:	e8 37 32 00 00       	call   3960 <printf>
        exit();
     729:	e8 d4 30 00 00       	call   3802 <exit>
    printf(stdout, "error: open big failed!\n");
     72e:	51                   	push   %ecx
     72f:	51                   	push   %ecx
     730:	68 15 3f 00 00       	push   $0x3f15
     735:	ff 35 74 5d 00 00    	pushl  0x5d74
     73b:	e8 20 32 00 00       	call   3960 <printf>
    exit();
     740:	e8 bd 30 00 00       	call   3802 <exit>
    printf(stdout, "error: creat big failed!\n");
     745:	50                   	push   %eax
     746:	50                   	push   %eax
     747:	68 dd 3e 00 00       	push   $0x3edd
     74c:	ff 35 74 5d 00 00    	pushl  0x5d74
     752:	e8 09 32 00 00       	call   3960 <printf>
    exit();
     757:	e8 a6 30 00 00       	call   3802 <exit>
    printf(stdout, "unlink big failed\n");
     75c:	50                   	push   %eax
     75d:	50                   	push   %eax
     75e:	68 5b 3f 00 00       	push   $0x3f5b
     763:	ff 35 74 5d 00 00    	pushl  0x5d74
     769:	e8 f2 31 00 00       	call   3960 <printf>
    exit();
     76e:	e8 8f 30 00 00       	call   3802 <exit>
     773:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000780 <createtest>:
{
     780:	55                   	push   %ebp
     781:	89 e5                	mov    %esp,%ebp
     783:	53                   	push   %ebx
  name[2] = '\0';
     784:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     789:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     78c:	68 74 4d 00 00       	push   $0x4d74
     791:	ff 35 74 5d 00 00    	pushl  0x5d74
     797:	e8 c4 31 00 00       	call   3960 <printf>
  name[0] = 'a';
     79c:	c6 05 60 a5 00 00 61 	movb   $0x61,0xa560
  name[2] = '\0';
     7a3:	c6 05 62 a5 00 00 00 	movb   $0x0,0xa562
     7aa:	83 c4 10             	add    $0x10,%esp
     7ad:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
     7b0:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     7b3:	88 1d 61 a5 00 00    	mov    %bl,0xa561
     7b9:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     7bc:	68 02 02 00 00       	push   $0x202
     7c1:	68 60 a5 00 00       	push   $0xa560
     7c6:	e8 8f 30 00 00       	call   385a <open>
    close(fd);
     7cb:	89 04 24             	mov    %eax,(%esp)
     7ce:	e8 67 30 00 00       	call   383a <close>
  for(i = 0; i < 52; i++){
     7d3:	83 c4 10             	add    $0x10,%esp
     7d6:	80 fb 64             	cmp    $0x64,%bl
     7d9:	75 d5                	jne    7b0 <createtest+0x30>
  name[0] = 'a';
     7db:	c6 05 60 a5 00 00 61 	movb   $0x61,0xa560
  name[2] = '\0';
     7e2:	c6 05 62 a5 00 00 00 	movb   $0x0,0xa562
     7e9:	bb 30 00 00 00       	mov    $0x30,%ebx
     7ee:	66 90                	xchg   %ax,%ax
    unlink(name);
     7f0:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     7f3:	88 1d 61 a5 00 00    	mov    %bl,0xa561
     7f9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     7fc:	68 60 a5 00 00       	push   $0xa560
     801:	e8 64 30 00 00       	call   386a <unlink>
  for(i = 0; i < 52; i++){
     806:	83 c4 10             	add    $0x10,%esp
     809:	80 fb 64             	cmp    $0x64,%bl
     80c:	75 e2                	jne    7f0 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     80e:	83 ec 08             	sub    $0x8,%esp
     811:	68 9c 4d 00 00       	push   $0x4d9c
     816:	ff 35 74 5d 00 00    	pushl  0x5d74
     81c:	e8 3f 31 00 00       	call   3960 <printf>
}
     821:	83 c4 10             	add    $0x10,%esp
     824:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     827:	c9                   	leave  
     828:	c3                   	ret    
     829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000830 <dirtest>:
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     836:	68 7c 3f 00 00       	push   $0x3f7c
     83b:	ff 35 74 5d 00 00    	pushl  0x5d74
     841:	e8 1a 31 00 00       	call   3960 <printf>
  if(mkdir("dir0") < 0){
     846:	c7 04 24 88 3f 00 00 	movl   $0x3f88,(%esp)
     84d:	e8 30 30 00 00       	call   3882 <mkdir>
     852:	83 c4 10             	add    $0x10,%esp
     855:	85 c0                	test   %eax,%eax
     857:	78 58                	js     8b1 <dirtest+0x81>
  if(chdir("dir0") < 0){
     859:	83 ec 0c             	sub    $0xc,%esp
     85c:	68 88 3f 00 00       	push   $0x3f88
     861:	e8 24 30 00 00       	call   388a <chdir>
     866:	83 c4 10             	add    $0x10,%esp
     869:	85 c0                	test   %eax,%eax
     86b:	0f 88 85 00 00 00    	js     8f6 <dirtest+0xc6>
  if(chdir("..") < 0){
     871:	83 ec 0c             	sub    $0xc,%esp
     874:	68 2d 45 00 00       	push   $0x452d
     879:	e8 0c 30 00 00       	call   388a <chdir>
     87e:	83 c4 10             	add    $0x10,%esp
     881:	85 c0                	test   %eax,%eax
     883:	78 5a                	js     8df <dirtest+0xaf>
  if(unlink("dir0") < 0){
     885:	83 ec 0c             	sub    $0xc,%esp
     888:	68 88 3f 00 00       	push   $0x3f88
     88d:	e8 d8 2f 00 00       	call   386a <unlink>
     892:	83 c4 10             	add    $0x10,%esp
     895:	85 c0                	test   %eax,%eax
     897:	78 2f                	js     8c8 <dirtest+0x98>
  printf(stdout, "mkdir test ok\n");
     899:	83 ec 08             	sub    $0x8,%esp
     89c:	68 c5 3f 00 00       	push   $0x3fc5
     8a1:	ff 35 74 5d 00 00    	pushl  0x5d74
     8a7:	e8 b4 30 00 00       	call   3960 <printf>
}
     8ac:	83 c4 10             	add    $0x10,%esp
     8af:	c9                   	leave  
     8b0:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     8b1:	50                   	push   %eax
     8b2:	50                   	push   %eax
     8b3:	68 b8 3c 00 00       	push   $0x3cb8
     8b8:	ff 35 74 5d 00 00    	pushl  0x5d74
     8be:	e8 9d 30 00 00       	call   3960 <printf>
    exit();
     8c3:	e8 3a 2f 00 00       	call   3802 <exit>
    printf(stdout, "unlink dir0 failed\n");
     8c8:	50                   	push   %eax
     8c9:	50                   	push   %eax
     8ca:	68 b1 3f 00 00       	push   $0x3fb1
     8cf:	ff 35 74 5d 00 00    	pushl  0x5d74
     8d5:	e8 86 30 00 00       	call   3960 <printf>
    exit();
     8da:	e8 23 2f 00 00       	call   3802 <exit>
    printf(stdout, "chdir .. failed\n");
     8df:	52                   	push   %edx
     8e0:	52                   	push   %edx
     8e1:	68 a0 3f 00 00       	push   $0x3fa0
     8e6:	ff 35 74 5d 00 00    	pushl  0x5d74
     8ec:	e8 6f 30 00 00       	call   3960 <printf>
    exit();
     8f1:	e8 0c 2f 00 00       	call   3802 <exit>
    printf(stdout, "chdir dir0 failed\n");
     8f6:	51                   	push   %ecx
     8f7:	51                   	push   %ecx
     8f8:	68 8d 3f 00 00       	push   $0x3f8d
     8fd:	ff 35 74 5d 00 00    	pushl  0x5d74
     903:	e8 58 30 00 00       	call   3960 <printf>
    exit();
     908:	e8 f5 2e 00 00       	call   3802 <exit>
     90d:	8d 76 00             	lea    0x0(%esi),%esi

00000910 <exectest>:
{
     910:	55                   	push   %ebp
     911:	89 e5                	mov    %esp,%ebp
     913:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     916:	68 d4 3f 00 00       	push   $0x3fd4
     91b:	ff 35 74 5d 00 00    	pushl  0x5d74
     921:	e8 3a 30 00 00       	call   3960 <printf>
  if(exec("echo", echoargv) < 0){
     926:	5a                   	pop    %edx
     927:	59                   	pop    %ecx
     928:	68 78 5d 00 00       	push   $0x5d78
     92d:	68 9d 3d 00 00       	push   $0x3d9d
     932:	e8 1b 2f 00 00       	call   3852 <exec>
     937:	83 c4 10             	add    $0x10,%esp
     93a:	85 c0                	test   %eax,%eax
     93c:	78 02                	js     940 <exectest+0x30>
}
     93e:	c9                   	leave  
     93f:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     940:	50                   	push   %eax
     941:	50                   	push   %eax
     942:	68 df 3f 00 00       	push   $0x3fdf
     947:	ff 35 74 5d 00 00    	pushl  0x5d74
     94d:	e8 0e 30 00 00       	call   3960 <printf>
    exit();
     952:	e8 ab 2e 00 00       	call   3802 <exit>
     957:	89 f6                	mov    %esi,%esi
     959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000960 <pipe1>:
{
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	57                   	push   %edi
     964:	56                   	push   %esi
     965:	53                   	push   %ebx
  if(pipe(fds) != 0){
     966:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     969:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     96c:	50                   	push   %eax
     96d:	e8 b0 2e 00 00       	call   3822 <pipe>
     972:	83 c4 10             	add    $0x10,%esp
     975:	85 c0                	test   %eax,%eax
     977:	0f 85 3e 01 00 00    	jne    abb <pipe1+0x15b>
     97d:	89 c3                	mov    %eax,%ebx
  pid = fork();
     97f:	e8 76 2e 00 00       	call   37fa <fork>
  if(pid == 0){
     984:	83 f8 00             	cmp    $0x0,%eax
     987:	0f 84 84 00 00 00    	je     a11 <pipe1+0xb1>
  } else if(pid > 0){
     98d:	0f 8e 3b 01 00 00    	jle    ace <pipe1+0x16e>
    close(fds[1]);
     993:	83 ec 0c             	sub    $0xc,%esp
     996:	ff 75 e4             	pushl  -0x1c(%ebp)
    cc = 1;
     999:	bf 01 00 00 00       	mov    $0x1,%edi
    close(fds[1]);
     99e:	e8 97 2e 00 00       	call   383a <close>
    while((n = read(fds[0], buf, cc)) > 0){
     9a3:	83 c4 10             	add    $0x10,%esp
    total = 0;
     9a6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     9ad:	83 ec 04             	sub    $0x4,%esp
     9b0:	57                   	push   %edi
     9b1:	68 60 85 00 00       	push   $0x8560
     9b6:	ff 75 e0             	pushl  -0x20(%ebp)
     9b9:	e8 6c 2e 00 00       	call   382a <read>
     9be:	83 c4 10             	add    $0x10,%esp
     9c1:	85 c0                	test   %eax,%eax
     9c3:	0f 8e ab 00 00 00    	jle    a74 <pipe1+0x114>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     9c9:	89 d9                	mov    %ebx,%ecx
     9cb:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     9ce:	f7 d9                	neg    %ecx
     9d0:	38 9c 0b 60 85 00 00 	cmp    %bl,0x8560(%ebx,%ecx,1)
     9d7:	8d 53 01             	lea    0x1(%ebx),%edx
     9da:	75 1b                	jne    9f7 <pipe1+0x97>
      for(i = 0; i < n; i++){
     9dc:	39 f2                	cmp    %esi,%edx
     9de:	89 d3                	mov    %edx,%ebx
     9e0:	75 ee                	jne    9d0 <pipe1+0x70>
      cc = cc * 2;
     9e2:	01 ff                	add    %edi,%edi
      total += n;
     9e4:	01 45 d4             	add    %eax,-0x2c(%ebp)
     9e7:	b8 00 20 00 00       	mov    $0x2000,%eax
     9ec:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     9f2:	0f 4f f8             	cmovg  %eax,%edi
     9f5:	eb b6                	jmp    9ad <pipe1+0x4d>
          printf(1, "pipe1 oops 2\n");
     9f7:	83 ec 08             	sub    $0x8,%esp
     9fa:	68 0e 40 00 00       	push   $0x400e
     9ff:	6a 01                	push   $0x1
     a01:	e8 5a 2f 00 00       	call   3960 <printf>
          return;
     a06:	83 c4 10             	add    $0x10,%esp
}
     a09:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a0c:	5b                   	pop    %ebx
     a0d:	5e                   	pop    %esi
     a0e:	5f                   	pop    %edi
     a0f:	5d                   	pop    %ebp
     a10:	c3                   	ret    
    close(fds[0]);
     a11:	83 ec 0c             	sub    $0xc,%esp
     a14:	ff 75 e0             	pushl  -0x20(%ebp)
     a17:	31 db                	xor    %ebx,%ebx
     a19:	be 09 04 00 00       	mov    $0x409,%esi
     a1e:	e8 17 2e 00 00       	call   383a <close>
     a23:	83 c4 10             	add    $0x10,%esp
     a26:	89 d8                	mov    %ebx,%eax
     a28:	89 f2                	mov    %esi,%edx
     a2a:	f7 d8                	neg    %eax
     a2c:	29 da                	sub    %ebx,%edx
     a2e:	66 90                	xchg   %ax,%ax
        buf[i] = seq++;
     a30:	88 84 03 60 85 00 00 	mov    %al,0x8560(%ebx,%eax,1)
     a37:	83 c0 01             	add    $0x1,%eax
      for(i = 0; i < 1033; i++)
     a3a:	39 d0                	cmp    %edx,%eax
     a3c:	75 f2                	jne    a30 <pipe1+0xd0>
      if(write(fds[1], buf, 1033) != 1033){
     a3e:	83 ec 04             	sub    $0x4,%esp
     a41:	68 09 04 00 00       	push   $0x409
     a46:	68 60 85 00 00       	push   $0x8560
     a4b:	ff 75 e4             	pushl  -0x1c(%ebp)
     a4e:	e8 df 2d 00 00       	call   3832 <write>
     a53:	83 c4 10             	add    $0x10,%esp
     a56:	3d 09 04 00 00       	cmp    $0x409,%eax
     a5b:	0f 85 80 00 00 00    	jne    ae1 <pipe1+0x181>
     a61:	81 eb 09 04 00 00    	sub    $0x409,%ebx
    for(n = 0; n < 5; n++){
     a67:	81 fb d3 eb ff ff    	cmp    $0xffffebd3,%ebx
     a6d:	75 b7                	jne    a26 <pipe1+0xc6>
    exit();
     a6f:	e8 8e 2d 00 00       	call   3802 <exit>
    if(total != 5 * 1033){
     a74:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     a7b:	75 29                	jne    aa6 <pipe1+0x146>
    close(fds[0]);
     a7d:	83 ec 0c             	sub    $0xc,%esp
     a80:	ff 75 e0             	pushl  -0x20(%ebp)
     a83:	e8 b2 2d 00 00       	call   383a <close>
    wait();
     a88:	e8 7d 2d 00 00       	call   380a <wait>
  printf(1, "pipe1 ok\n");
     a8d:	5a                   	pop    %edx
     a8e:	59                   	pop    %ecx
     a8f:	68 33 40 00 00       	push   $0x4033
     a94:	6a 01                	push   $0x1
     a96:	e8 c5 2e 00 00       	call   3960 <printf>
     a9b:	83 c4 10             	add    $0x10,%esp
}
     a9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     aa1:	5b                   	pop    %ebx
     aa2:	5e                   	pop    %esi
     aa3:	5f                   	pop    %edi
     aa4:	5d                   	pop    %ebp
     aa5:	c3                   	ret    
      printf(1, "pipe1 oops 3 total %d\n", total);
     aa6:	53                   	push   %ebx
     aa7:	ff 75 d4             	pushl  -0x2c(%ebp)
     aaa:	68 1c 40 00 00       	push   $0x401c
     aaf:	6a 01                	push   $0x1
     ab1:	e8 aa 2e 00 00       	call   3960 <printf>
      exit();
     ab6:	e8 47 2d 00 00       	call   3802 <exit>
    printf(1, "pipe() failed\n");
     abb:	57                   	push   %edi
     abc:	57                   	push   %edi
     abd:	68 f1 3f 00 00       	push   $0x3ff1
     ac2:	6a 01                	push   $0x1
     ac4:	e8 97 2e 00 00       	call   3960 <printf>
    exit();
     ac9:	e8 34 2d 00 00       	call   3802 <exit>
    printf(1, "fork() failed\n");
     ace:	50                   	push   %eax
     acf:	50                   	push   %eax
     ad0:	68 3d 40 00 00       	push   $0x403d
     ad5:	6a 01                	push   $0x1
     ad7:	e8 84 2e 00 00       	call   3960 <printf>
    exit();
     adc:	e8 21 2d 00 00       	call   3802 <exit>
        printf(1, "pipe1 oops 1\n");
     ae1:	56                   	push   %esi
     ae2:	56                   	push   %esi
     ae3:	68 00 40 00 00       	push   $0x4000
     ae8:	6a 01                	push   $0x1
     aea:	e8 71 2e 00 00       	call   3960 <printf>
        exit();
     aef:	e8 0e 2d 00 00       	call   3802 <exit>
     af4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     afa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b00 <preempt>:
{
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	57                   	push   %edi
     b04:	56                   	push   %esi
     b05:	53                   	push   %ebx
     b06:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     b09:	68 4c 40 00 00       	push   $0x404c
     b0e:	6a 01                	push   $0x1
     b10:	e8 4b 2e 00 00       	call   3960 <printf>
  pid1 = fork();
     b15:	e8 e0 2c 00 00       	call   37fa <fork>
  if(pid1 == 0)
     b1a:	83 c4 10             	add    $0x10,%esp
     b1d:	85 c0                	test   %eax,%eax
     b1f:	75 02                	jne    b23 <preempt+0x23>
     b21:	eb fe                	jmp    b21 <preempt+0x21>
     b23:	89 c7                	mov    %eax,%edi
  pid2 = fork();
     b25:	e8 d0 2c 00 00       	call   37fa <fork>
  if(pid2 == 0)
     b2a:	85 c0                	test   %eax,%eax
  pid2 = fork();
     b2c:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     b2e:	75 02                	jne    b32 <preempt+0x32>
     b30:	eb fe                	jmp    b30 <preempt+0x30>
  pipe(pfds);
     b32:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b35:	83 ec 0c             	sub    $0xc,%esp
     b38:	50                   	push   %eax
     b39:	e8 e4 2c 00 00       	call   3822 <pipe>
  pid3 = fork();
     b3e:	e8 b7 2c 00 00       	call   37fa <fork>
  if(pid3 == 0){
     b43:	83 c4 10             	add    $0x10,%esp
     b46:	85 c0                	test   %eax,%eax
  pid3 = fork();
     b48:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     b4a:	75 46                	jne    b92 <preempt+0x92>
    close(pfds[0]);
     b4c:	83 ec 0c             	sub    $0xc,%esp
     b4f:	ff 75 e0             	pushl  -0x20(%ebp)
     b52:	e8 e3 2c 00 00       	call   383a <close>
    if(write(pfds[1], "x", 1) != 1)
     b57:	83 c4 0c             	add    $0xc,%esp
     b5a:	6a 01                	push   $0x1
     b5c:	68 11 46 00 00       	push   $0x4611
     b61:	ff 75 e4             	pushl  -0x1c(%ebp)
     b64:	e8 c9 2c 00 00       	call   3832 <write>
     b69:	83 c4 10             	add    $0x10,%esp
     b6c:	83 e8 01             	sub    $0x1,%eax
     b6f:	74 11                	je     b82 <preempt+0x82>
      printf(1, "preempt write error");
     b71:	50                   	push   %eax
     b72:	50                   	push   %eax
     b73:	68 56 40 00 00       	push   $0x4056
     b78:	6a 01                	push   $0x1
     b7a:	e8 e1 2d 00 00       	call   3960 <printf>
     b7f:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     b82:	83 ec 0c             	sub    $0xc,%esp
     b85:	ff 75 e4             	pushl  -0x1c(%ebp)
     b88:	e8 ad 2c 00 00       	call   383a <close>
     b8d:	83 c4 10             	add    $0x10,%esp
     b90:	eb fe                	jmp    b90 <preempt+0x90>
  close(pfds[1]);
     b92:	83 ec 0c             	sub    $0xc,%esp
     b95:	ff 75 e4             	pushl  -0x1c(%ebp)
     b98:	e8 9d 2c 00 00       	call   383a <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     b9d:	83 c4 0c             	add    $0xc,%esp
     ba0:	68 00 20 00 00       	push   $0x2000
     ba5:	68 60 85 00 00       	push   $0x8560
     baa:	ff 75 e0             	pushl  -0x20(%ebp)
     bad:	e8 78 2c 00 00       	call   382a <read>
     bb2:	83 c4 10             	add    $0x10,%esp
     bb5:	83 e8 01             	sub    $0x1,%eax
     bb8:	74 19                	je     bd3 <preempt+0xd3>
    printf(1, "preempt read error");
     bba:	50                   	push   %eax
     bbb:	50                   	push   %eax
     bbc:	68 6a 40 00 00       	push   $0x406a
     bc1:	6a 01                	push   $0x1
     bc3:	e8 98 2d 00 00       	call   3960 <printf>
    return;
     bc8:	83 c4 10             	add    $0x10,%esp
}
     bcb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     bce:	5b                   	pop    %ebx
     bcf:	5e                   	pop    %esi
     bd0:	5f                   	pop    %edi
     bd1:	5d                   	pop    %ebp
     bd2:	c3                   	ret    
  close(pfds[0]);
     bd3:	83 ec 0c             	sub    $0xc,%esp
     bd6:	ff 75 e0             	pushl  -0x20(%ebp)
     bd9:	e8 5c 2c 00 00       	call   383a <close>
  printf(1, "kill... ");
     bde:	58                   	pop    %eax
     bdf:	5a                   	pop    %edx
     be0:	68 7d 40 00 00       	push   $0x407d
     be5:	6a 01                	push   $0x1
     be7:	e8 74 2d 00 00       	call   3960 <printf>
  kill(pid1);
     bec:	89 3c 24             	mov    %edi,(%esp)
     bef:	e8 4e 2c 00 00       	call   3842 <kill>
  kill(pid2);
     bf4:	89 34 24             	mov    %esi,(%esp)
     bf7:	e8 46 2c 00 00       	call   3842 <kill>
  kill(pid3);
     bfc:	89 1c 24             	mov    %ebx,(%esp)
     bff:	e8 3e 2c 00 00       	call   3842 <kill>
  printf(1, "wait... ");
     c04:	59                   	pop    %ecx
     c05:	5b                   	pop    %ebx
     c06:	68 86 40 00 00       	push   $0x4086
     c0b:	6a 01                	push   $0x1
     c0d:	e8 4e 2d 00 00       	call   3960 <printf>
  wait();
     c12:	e8 f3 2b 00 00       	call   380a <wait>
  wait();
     c17:	e8 ee 2b 00 00       	call   380a <wait>
  wait();
     c1c:	e8 e9 2b 00 00       	call   380a <wait>
  printf(1, "preempt ok\n");
     c21:	5e                   	pop    %esi
     c22:	5f                   	pop    %edi
     c23:	68 8f 40 00 00       	push   $0x408f
     c28:	6a 01                	push   $0x1
     c2a:	e8 31 2d 00 00       	call   3960 <printf>
     c2f:	83 c4 10             	add    $0x10,%esp
     c32:	eb 97                	jmp    bcb <preempt+0xcb>
     c34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000c40 <exitwait>:
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	56                   	push   %esi
     c44:	be 64 00 00 00       	mov    $0x64,%esi
     c49:	53                   	push   %ebx
     c4a:	eb 14                	jmp    c60 <exitwait+0x20>
     c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     c50:	74 6f                	je     cc1 <exitwait+0x81>
      if(wait() != pid){
     c52:	e8 b3 2b 00 00       	call   380a <wait>
     c57:	39 d8                	cmp    %ebx,%eax
     c59:	75 2d                	jne    c88 <exitwait+0x48>
  for(i = 0; i < 100; i++){
     c5b:	83 ee 01             	sub    $0x1,%esi
     c5e:	74 48                	je     ca8 <exitwait+0x68>
    pid = fork();
     c60:	e8 95 2b 00 00       	call   37fa <fork>
    if(pid < 0){
     c65:	85 c0                	test   %eax,%eax
    pid = fork();
     c67:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     c69:	79 e5                	jns    c50 <exitwait+0x10>
      printf(1, "fork failed\n");
     c6b:	83 ec 08             	sub    $0x8,%esp
     c6e:	68 f9 4b 00 00       	push   $0x4bf9
     c73:	6a 01                	push   $0x1
     c75:	e8 e6 2c 00 00       	call   3960 <printf>
      return;
     c7a:	83 c4 10             	add    $0x10,%esp
}
     c7d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c80:	5b                   	pop    %ebx
     c81:	5e                   	pop    %esi
     c82:	5d                   	pop    %ebp
     c83:	c3                   	ret    
     c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
     c88:	83 ec 08             	sub    $0x8,%esp
     c8b:	68 9b 40 00 00       	push   $0x409b
     c90:	6a 01                	push   $0x1
     c92:	e8 c9 2c 00 00       	call   3960 <printf>
        return;
     c97:	83 c4 10             	add    $0x10,%esp
}
     c9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c9d:	5b                   	pop    %ebx
     c9e:	5e                   	pop    %esi
     c9f:	5d                   	pop    %ebp
     ca0:	c3                   	ret    
     ca1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "exitwait ok\n");
     ca8:	83 ec 08             	sub    $0x8,%esp
     cab:	68 ab 40 00 00       	push   $0x40ab
     cb0:	6a 01                	push   $0x1
     cb2:	e8 a9 2c 00 00       	call   3960 <printf>
     cb7:	83 c4 10             	add    $0x10,%esp
}
     cba:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cbd:	5b                   	pop    %ebx
     cbe:	5e                   	pop    %esi
     cbf:	5d                   	pop    %ebp
     cc0:	c3                   	ret    
      exit();
     cc1:	e8 3c 2b 00 00       	call   3802 <exit>
     cc6:	8d 76 00             	lea    0x0(%esi),%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <mem>:
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	57                   	push   %edi
     cd4:	56                   	push   %esi
     cd5:	53                   	push   %ebx
     cd6:	31 db                	xor    %ebx,%ebx
     cd8:	83 ec 14             	sub    $0x14,%esp
  printf(1, "mem test\n");
     cdb:	68 b8 40 00 00       	push   $0x40b8
     ce0:	6a 01                	push   $0x1
     ce2:	e8 79 2c 00 00       	call   3960 <printf>
  ppid = getpid();
     ce7:	e8 ae 2b 00 00       	call   389a <getpid>
     cec:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     cee:	e8 07 2b 00 00       	call   37fa <fork>
     cf3:	83 c4 10             	add    $0x10,%esp
     cf6:	85 c0                	test   %eax,%eax
     cf8:	74 0a                	je     d04 <mem+0x34>
     cfa:	e9 89 00 00 00       	jmp    d88 <mem+0xb8>
     cff:	90                   	nop
      *(char**)m2 = m1;
     d00:	89 18                	mov    %ebx,(%eax)
     d02:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
     d04:	83 ec 0c             	sub    $0xc,%esp
     d07:	68 11 27 00 00       	push   $0x2711
     d0c:	e8 af 2e 00 00       	call   3bc0 <malloc>
     d11:	83 c4 10             	add    $0x10,%esp
     d14:	85 c0                	test   %eax,%eax
     d16:	75 e8                	jne    d00 <mem+0x30>
    while(m1){
     d18:	85 db                	test   %ebx,%ebx
     d1a:	74 18                	je     d34 <mem+0x64>
     d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     d20:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     d22:	83 ec 0c             	sub    $0xc,%esp
     d25:	53                   	push   %ebx
     d26:	89 fb                	mov    %edi,%ebx
     d28:	e8 03 2e 00 00       	call   3b30 <free>
    while(m1){
     d2d:	83 c4 10             	add    $0x10,%esp
     d30:	85 db                	test   %ebx,%ebx
     d32:	75 ec                	jne    d20 <mem+0x50>
    m1 = malloc(1024*20);
     d34:	83 ec 0c             	sub    $0xc,%esp
     d37:	68 00 50 00 00       	push   $0x5000
     d3c:	e8 7f 2e 00 00       	call   3bc0 <malloc>
    if(m1 == 0){
     d41:	83 c4 10             	add    $0x10,%esp
     d44:	85 c0                	test   %eax,%eax
     d46:	74 20                	je     d68 <mem+0x98>
    free(m1);
     d48:	83 ec 0c             	sub    $0xc,%esp
     d4b:	50                   	push   %eax
     d4c:	e8 df 2d 00 00       	call   3b30 <free>
    printf(1, "mem ok\n");
     d51:	58                   	pop    %eax
     d52:	5a                   	pop    %edx
     d53:	68 dc 40 00 00       	push   $0x40dc
     d58:	6a 01                	push   $0x1
     d5a:	e8 01 2c 00 00       	call   3960 <printf>
    exit();
     d5f:	e8 9e 2a 00 00       	call   3802 <exit>
     d64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
     d68:	83 ec 08             	sub    $0x8,%esp
     d6b:	68 c2 40 00 00       	push   $0x40c2
     d70:	6a 01                	push   $0x1
     d72:	e8 e9 2b 00 00       	call   3960 <printf>
      kill(ppid);
     d77:	89 34 24             	mov    %esi,(%esp)
     d7a:	e8 c3 2a 00 00       	call   3842 <kill>
      exit();
     d7f:	e8 7e 2a 00 00       	call   3802 <exit>
     d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
     d88:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d8b:	5b                   	pop    %ebx
     d8c:	5e                   	pop    %esi
     d8d:	5f                   	pop    %edi
     d8e:	5d                   	pop    %ebp
    wait();
     d8f:	e9 76 2a 00 00       	jmp    380a <wait>
     d94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     d9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000da0 <sharedfd>:
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	57                   	push   %edi
     da4:	56                   	push   %esi
     da5:	53                   	push   %ebx
     da6:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
     da9:	68 e4 40 00 00       	push   $0x40e4
     dae:	6a 01                	push   $0x1
     db0:	e8 ab 2b 00 00       	call   3960 <printf>
  unlink("sharedfd");
     db5:	c7 04 24 f3 40 00 00 	movl   $0x40f3,(%esp)
     dbc:	e8 a9 2a 00 00       	call   386a <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     dc1:	59                   	pop    %ecx
     dc2:	5b                   	pop    %ebx
     dc3:	68 02 02 00 00       	push   $0x202
     dc8:	68 f3 40 00 00       	push   $0x40f3
     dcd:	e8 88 2a 00 00       	call   385a <open>
  if(fd < 0){
     dd2:	83 c4 10             	add    $0x10,%esp
     dd5:	85 c0                	test   %eax,%eax
     dd7:	0f 88 33 01 00 00    	js     f10 <sharedfd+0x170>
     ddd:	89 c6                	mov    %eax,%esi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ddf:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
     de4:	e8 11 2a 00 00       	call   37fa <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     de9:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
     dec:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     dee:	19 c0                	sbb    %eax,%eax
     df0:	83 ec 04             	sub    $0x4,%esp
     df3:	83 e0 f3             	and    $0xfffffff3,%eax
     df6:	6a 0a                	push   $0xa
     df8:	83 c0 70             	add    $0x70,%eax
     dfb:	50                   	push   %eax
     dfc:	8d 45 de             	lea    -0x22(%ebp),%eax
     dff:	50                   	push   %eax
     e00:	e8 5b 28 00 00       	call   3660 <memset>
     e05:	83 c4 10             	add    $0x10,%esp
     e08:	eb 0b                	jmp    e15 <sharedfd+0x75>
     e0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 1000; i++){
     e10:	83 eb 01             	sub    $0x1,%ebx
     e13:	74 29                	je     e3e <sharedfd+0x9e>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     e15:	8d 45 de             	lea    -0x22(%ebp),%eax
     e18:	83 ec 04             	sub    $0x4,%esp
     e1b:	6a 0a                	push   $0xa
     e1d:	50                   	push   %eax
     e1e:	56                   	push   %esi
     e1f:	e8 0e 2a 00 00       	call   3832 <write>
     e24:	83 c4 10             	add    $0x10,%esp
     e27:	83 f8 0a             	cmp    $0xa,%eax
     e2a:	74 e4                	je     e10 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     e2c:	83 ec 08             	sub    $0x8,%esp
     e2f:	68 f0 4d 00 00       	push   $0x4df0
     e34:	6a 01                	push   $0x1
     e36:	e8 25 2b 00 00       	call   3960 <printf>
      break;
     e3b:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     e3e:	85 ff                	test   %edi,%edi
     e40:	0f 84 fe 00 00 00    	je     f44 <sharedfd+0x1a4>
    wait();
     e46:	e8 bf 29 00 00       	call   380a <wait>
  close(fd);
     e4b:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
     e4e:	31 db                	xor    %ebx,%ebx
     e50:	31 ff                	xor    %edi,%edi
  close(fd);
     e52:	56                   	push   %esi
     e53:	8d 75 e8             	lea    -0x18(%ebp),%esi
     e56:	e8 df 29 00 00       	call   383a <close>
  fd = open("sharedfd", 0);
     e5b:	58                   	pop    %eax
     e5c:	5a                   	pop    %edx
     e5d:	6a 00                	push   $0x0
     e5f:	68 f3 40 00 00       	push   $0x40f3
     e64:	e8 f1 29 00 00       	call   385a <open>
  if(fd < 0){
     e69:	83 c4 10             	add    $0x10,%esp
     e6c:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", 0);
     e6e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  if(fd < 0){
     e71:	0f 88 b3 00 00 00    	js     f2a <sharedfd+0x18a>
     e77:	89 f8                	mov    %edi,%eax
     e79:	89 df                	mov    %ebx,%edi
     e7b:	89 c3                	mov    %eax,%ebx
     e7d:	8d 76 00             	lea    0x0(%esi),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
     e80:	8d 45 de             	lea    -0x22(%ebp),%eax
     e83:	83 ec 04             	sub    $0x4,%esp
     e86:	6a 0a                	push   $0xa
     e88:	50                   	push   %eax
     e89:	ff 75 d4             	pushl  -0x2c(%ebp)
     e8c:	e8 99 29 00 00       	call   382a <read>
     e91:	83 c4 10             	add    $0x10,%esp
     e94:	85 c0                	test   %eax,%eax
     e96:	7e 28                	jle    ec0 <sharedfd+0x120>
     e98:	8d 45 de             	lea    -0x22(%ebp),%eax
     e9b:	eb 15                	jmp    eb2 <sharedfd+0x112>
     e9d:	8d 76 00             	lea    0x0(%esi),%esi
        np++;
     ea0:	80 fa 70             	cmp    $0x70,%dl
     ea3:	0f 94 c2             	sete   %dl
     ea6:	0f b6 d2             	movzbl %dl,%edx
     ea9:	01 d7                	add    %edx,%edi
     eab:	83 c0 01             	add    $0x1,%eax
    for(i = 0; i < sizeof(buf); i++){
     eae:	39 f0                	cmp    %esi,%eax
     eb0:	74 ce                	je     e80 <sharedfd+0xe0>
      if(buf[i] == 'c')
     eb2:	0f b6 10             	movzbl (%eax),%edx
     eb5:	80 fa 63             	cmp    $0x63,%dl
     eb8:	75 e6                	jne    ea0 <sharedfd+0x100>
        nc++;
     eba:	83 c3 01             	add    $0x1,%ebx
     ebd:	eb ec                	jmp    eab <sharedfd+0x10b>
     ebf:	90                   	nop
  close(fd);
     ec0:	83 ec 0c             	sub    $0xc,%esp
     ec3:	89 d8                	mov    %ebx,%eax
     ec5:	ff 75 d4             	pushl  -0x2c(%ebp)
     ec8:	89 fb                	mov    %edi,%ebx
     eca:	89 c7                	mov    %eax,%edi
     ecc:	e8 69 29 00 00       	call   383a <close>
  unlink("sharedfd");
     ed1:	c7 04 24 f3 40 00 00 	movl   $0x40f3,(%esp)
     ed8:	e8 8d 29 00 00       	call   386a <unlink>
  if(nc == 10000 && np == 10000){
     edd:	83 c4 10             	add    $0x10,%esp
     ee0:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
     ee6:	75 61                	jne    f49 <sharedfd+0x1a9>
     ee8:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     eee:	75 59                	jne    f49 <sharedfd+0x1a9>
    printf(1, "sharedfd ok\n");
     ef0:	83 ec 08             	sub    $0x8,%esp
     ef3:	68 fc 40 00 00       	push   $0x40fc
     ef8:	6a 01                	push   $0x1
     efa:	e8 61 2a 00 00       	call   3960 <printf>
     eff:	83 c4 10             	add    $0x10,%esp
}
     f02:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f05:	5b                   	pop    %ebx
     f06:	5e                   	pop    %esi
     f07:	5f                   	pop    %edi
     f08:	5d                   	pop    %ebp
     f09:	c3                   	ret    
     f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "fstests: cannot open sharedfd for writing");
     f10:	83 ec 08             	sub    $0x8,%esp
     f13:	68 c4 4d 00 00       	push   $0x4dc4
     f18:	6a 01                	push   $0x1
     f1a:	e8 41 2a 00 00       	call   3960 <printf>
    return;
     f1f:	83 c4 10             	add    $0x10,%esp
}
     f22:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f25:	5b                   	pop    %ebx
     f26:	5e                   	pop    %esi
     f27:	5f                   	pop    %edi
     f28:	5d                   	pop    %ebp
     f29:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
     f2a:	83 ec 08             	sub    $0x8,%esp
     f2d:	68 10 4e 00 00       	push   $0x4e10
     f32:	6a 01                	push   $0x1
     f34:	e8 27 2a 00 00       	call   3960 <printf>
    return;
     f39:	83 c4 10             	add    $0x10,%esp
}
     f3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f3f:	5b                   	pop    %ebx
     f40:	5e                   	pop    %esi
     f41:	5f                   	pop    %edi
     f42:	5d                   	pop    %ebp
     f43:	c3                   	ret    
    exit();
     f44:	e8 b9 28 00 00       	call   3802 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
     f49:	53                   	push   %ebx
     f4a:	57                   	push   %edi
     f4b:	68 09 41 00 00       	push   $0x4109
     f50:	6a 01                	push   $0x1
     f52:	e8 09 2a 00 00       	call   3960 <printf>
    exit();
     f57:	e8 a6 28 00 00       	call   3802 <exit>
     f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f60 <fourfiles>:
{
     f60:	55                   	push   %ebp
     f61:	89 e5                	mov    %esp,%ebp
     f63:	57                   	push   %edi
     f64:	56                   	push   %esi
     f65:	53                   	push   %ebx
  printf(1, "fourfiles test\n");
     f66:	be 1e 41 00 00       	mov    $0x411e,%esi
  for(pi = 0; pi < 4; pi++){
     f6b:	31 db                	xor    %ebx,%ebx
{
     f6d:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
     f70:	c7 45 d8 1e 41 00 00 	movl   $0x411e,-0x28(%ebp)
     f77:	c7 45 dc 67 42 00 00 	movl   $0x4267,-0x24(%ebp)
  printf(1, "fourfiles test\n");
     f7e:	68 24 41 00 00       	push   $0x4124
     f83:	6a 01                	push   $0x1
  char *names[] = { "f0", "f1", "f2", "f3" };
     f85:	c7 45 e0 6b 42 00 00 	movl   $0x426b,-0x20(%ebp)
     f8c:	c7 45 e4 21 41 00 00 	movl   $0x4121,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
     f93:	e8 c8 29 00 00       	call   3960 <printf>
     f98:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
     f9b:	83 ec 0c             	sub    $0xc,%esp
     f9e:	56                   	push   %esi
     f9f:	e8 c6 28 00 00       	call   386a <unlink>
    pid = fork();
     fa4:	e8 51 28 00 00       	call   37fa <fork>
    if(pid < 0){
     fa9:	83 c4 10             	add    $0x10,%esp
     fac:	85 c0                	test   %eax,%eax
     fae:	0f 88 68 01 00 00    	js     111c <fourfiles+0x1bc>
    if(pid == 0){
     fb4:	0f 84 df 00 00 00    	je     1099 <fourfiles+0x139>
  for(pi = 0; pi < 4; pi++){
     fba:	83 c3 01             	add    $0x1,%ebx
     fbd:	83 fb 04             	cmp    $0x4,%ebx
     fc0:	74 06                	je     fc8 <fourfiles+0x68>
     fc2:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
     fc6:	eb d3                	jmp    f9b <fourfiles+0x3b>
    wait();
     fc8:	e8 3d 28 00 00       	call   380a <wait>
  for(i = 0; i < 2; i++){
     fcd:	31 ff                	xor    %edi,%edi
    wait();
     fcf:	e8 36 28 00 00       	call   380a <wait>
     fd4:	e8 31 28 00 00       	call   380a <wait>
     fd9:	e8 2c 28 00 00       	call   380a <wait>
     fde:	c7 45 d0 1e 41 00 00 	movl   $0x411e,-0x30(%ebp)
    fd = open(fname, 0);
     fe5:	83 ec 08             	sub    $0x8,%esp
    total = 0;
     fe8:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
     fea:	6a 00                	push   $0x0
     fec:	ff 75 d0             	pushl  -0x30(%ebp)
     fef:	e8 66 28 00 00       	call   385a <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
     ff4:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
     ff7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1000:	83 ec 04             	sub    $0x4,%esp
    1003:	68 00 20 00 00       	push   $0x2000
    1008:	68 60 85 00 00       	push   $0x8560
    100d:	ff 75 d4             	pushl  -0x2c(%ebp)
    1010:	e8 15 28 00 00       	call   382a <read>
    1015:	83 c4 10             	add    $0x10,%esp
    1018:	85 c0                	test   %eax,%eax
    101a:	7e 26                	jle    1042 <fourfiles+0xe2>
      for(j = 0; j < n; j++){
    101c:	31 d2                	xor    %edx,%edx
    101e:	66 90                	xchg   %ax,%ax
        if(buf[j] != '0'+i){
    1020:	0f be b2 60 85 00 00 	movsbl 0x8560(%edx),%esi
    1027:	83 ff 01             	cmp    $0x1,%edi
    102a:	19 c9                	sbb    %ecx,%ecx
    102c:	83 c1 31             	add    $0x31,%ecx
    102f:	39 ce                	cmp    %ecx,%esi
    1031:	0f 85 be 00 00 00    	jne    10f5 <fourfiles+0x195>
      for(j = 0; j < n; j++){
    1037:	83 c2 01             	add    $0x1,%edx
    103a:	39 d0                	cmp    %edx,%eax
    103c:	75 e2                	jne    1020 <fourfiles+0xc0>
      total += n;
    103e:	01 c3                	add    %eax,%ebx
    1040:	eb be                	jmp    1000 <fourfiles+0xa0>
    close(fd);
    1042:	83 ec 0c             	sub    $0xc,%esp
    1045:	ff 75 d4             	pushl  -0x2c(%ebp)
    1048:	e8 ed 27 00 00       	call   383a <close>
    if(total != 12*500){
    104d:	83 c4 10             	add    $0x10,%esp
    1050:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1056:	0f 85 d3 00 00 00    	jne    112f <fourfiles+0x1cf>
    unlink(fname);
    105c:	83 ec 0c             	sub    $0xc,%esp
    105f:	ff 75 d0             	pushl  -0x30(%ebp)
    1062:	e8 03 28 00 00       	call   386a <unlink>
  for(i = 0; i < 2; i++){
    1067:	83 c4 10             	add    $0x10,%esp
    106a:	83 ff 01             	cmp    $0x1,%edi
    106d:	75 1a                	jne    1089 <fourfiles+0x129>
  printf(1, "fourfiles ok\n");
    106f:	83 ec 08             	sub    $0x8,%esp
    1072:	68 62 41 00 00       	push   $0x4162
    1077:	6a 01                	push   $0x1
    1079:	e8 e2 28 00 00       	call   3960 <printf>
}
    107e:	83 c4 10             	add    $0x10,%esp
    1081:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1084:	5b                   	pop    %ebx
    1085:	5e                   	pop    %esi
    1086:	5f                   	pop    %edi
    1087:	5d                   	pop    %ebp
    1088:	c3                   	ret    
    1089:	8b 45 dc             	mov    -0x24(%ebp),%eax
    108c:	bf 01 00 00 00       	mov    $0x1,%edi
    1091:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1094:	e9 4c ff ff ff       	jmp    fe5 <fourfiles+0x85>
      fd = open(fname, O_CREATE | O_RDWR);
    1099:	83 ec 08             	sub    $0x8,%esp
    109c:	68 02 02 00 00       	push   $0x202
    10a1:	56                   	push   %esi
    10a2:	e8 b3 27 00 00       	call   385a <open>
      if(fd < 0){
    10a7:	83 c4 10             	add    $0x10,%esp
    10aa:	85 c0                	test   %eax,%eax
      fd = open(fname, O_CREATE | O_RDWR);
    10ac:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    10ae:	78 59                	js     1109 <fourfiles+0x1a9>
      memset(buf, '0'+pi, 512);
    10b0:	83 ec 04             	sub    $0x4,%esp
    10b3:	83 c3 30             	add    $0x30,%ebx
    10b6:	68 00 02 00 00       	push   $0x200
    10bb:	53                   	push   %ebx
    10bc:	bb 0c 00 00 00       	mov    $0xc,%ebx
    10c1:	68 60 85 00 00       	push   $0x8560
    10c6:	e8 95 25 00 00       	call   3660 <memset>
    10cb:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    10ce:	83 ec 04             	sub    $0x4,%esp
    10d1:	68 f4 01 00 00       	push   $0x1f4
    10d6:	68 60 85 00 00       	push   $0x8560
    10db:	56                   	push   %esi
    10dc:	e8 51 27 00 00       	call   3832 <write>
    10e1:	83 c4 10             	add    $0x10,%esp
    10e4:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    10e9:	75 57                	jne    1142 <fourfiles+0x1e2>
      for(i = 0; i < 12; i++){
    10eb:	83 eb 01             	sub    $0x1,%ebx
    10ee:	75 de                	jne    10ce <fourfiles+0x16e>
      exit();
    10f0:	e8 0d 27 00 00       	call   3802 <exit>
          printf(1, "wrong char\n");
    10f5:	83 ec 08             	sub    $0x8,%esp
    10f8:	68 45 41 00 00       	push   $0x4145
    10fd:	6a 01                	push   $0x1
    10ff:	e8 5c 28 00 00       	call   3960 <printf>
          exit();
    1104:	e8 f9 26 00 00       	call   3802 <exit>
        printf(1, "create failed\n");
    1109:	51                   	push   %ecx
    110a:	51                   	push   %ecx
    110b:	68 bf 43 00 00       	push   $0x43bf
    1110:	6a 01                	push   $0x1
    1112:	e8 49 28 00 00       	call   3960 <printf>
        exit();
    1117:	e8 e6 26 00 00       	call   3802 <exit>
      printf(1, "fork failed\n");
    111c:	53                   	push   %ebx
    111d:	53                   	push   %ebx
    111e:	68 f9 4b 00 00       	push   $0x4bf9
    1123:	6a 01                	push   $0x1
    1125:	e8 36 28 00 00       	call   3960 <printf>
      exit();
    112a:	e8 d3 26 00 00       	call   3802 <exit>
      printf(1, "wrong length %d\n", total);
    112f:	50                   	push   %eax
    1130:	53                   	push   %ebx
    1131:	68 51 41 00 00       	push   $0x4151
    1136:	6a 01                	push   $0x1
    1138:	e8 23 28 00 00       	call   3960 <printf>
      exit();
    113d:	e8 c0 26 00 00       	call   3802 <exit>
          printf(1, "write failed %d\n", n);
    1142:	52                   	push   %edx
    1143:	50                   	push   %eax
    1144:	68 34 41 00 00       	push   $0x4134
    1149:	6a 01                	push   $0x1
    114b:	e8 10 28 00 00       	call   3960 <printf>
          exit();
    1150:	e8 ad 26 00 00       	call   3802 <exit>
    1155:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001160 <createdelete>:
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	57                   	push   %edi
    1164:	56                   	push   %esi
    1165:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    1166:	31 db                	xor    %ebx,%ebx
{
    1168:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    116b:	68 70 41 00 00       	push   $0x4170
    1170:	6a 01                	push   $0x1
    1172:	e8 e9 27 00 00       	call   3960 <printf>
    1177:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    117a:	e8 7b 26 00 00       	call   37fa <fork>
    if(pid < 0){
    117f:	85 c0                	test   %eax,%eax
    1181:	0f 88 be 01 00 00    	js     1345 <createdelete+0x1e5>
    if(pid == 0){
    1187:	0f 84 0b 01 00 00    	je     1298 <createdelete+0x138>
  for(pi = 0; pi < 4; pi++){
    118d:	83 c3 01             	add    $0x1,%ebx
    1190:	83 fb 04             	cmp    $0x4,%ebx
    1193:	75 e5                	jne    117a <createdelete+0x1a>
    1195:	8d 7d c8             	lea    -0x38(%ebp),%edi
  name[0] = name[1] = name[2] = 0;
    1198:	be ff ff ff ff       	mov    $0xffffffff,%esi
    wait();
    119d:	e8 68 26 00 00       	call   380a <wait>
    11a2:	e8 63 26 00 00       	call   380a <wait>
    11a7:	e8 5e 26 00 00       	call   380a <wait>
    11ac:	e8 59 26 00 00       	call   380a <wait>
  name[0] = name[1] = name[2] = 0;
    11b1:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    11b5:	8d 76 00             	lea    0x0(%esi),%esi
    11b8:	8d 46 31             	lea    0x31(%esi),%eax
    11bb:	88 45 c7             	mov    %al,-0x39(%ebp)
    11be:	8d 46 01             	lea    0x1(%esi),%eax
    11c1:	83 f8 09             	cmp    $0x9,%eax
    11c4:	89 45 c0             	mov    %eax,-0x40(%ebp)
    11c7:	0f 9f c3             	setg   %bl
    11ca:	85 c0                	test   %eax,%eax
    11cc:	0f 94 c0             	sete   %al
    11cf:	09 c3                	or     %eax,%ebx
    11d1:	88 5d c6             	mov    %bl,-0x3a(%ebp)
      name[2] = '\0';
    11d4:	bb 70 00 00 00       	mov    $0x70,%ebx
      name[1] = '0' + i;
    11d9:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    11dd:	83 ec 08             	sub    $0x8,%esp
      name[0] = 'p' + pi;
    11e0:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    11e3:	6a 00                	push   $0x0
    11e5:	57                   	push   %edi
      name[1] = '0' + i;
    11e6:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    11e9:	e8 6c 26 00 00       	call   385a <open>
      if((i == 0 || i >= N/2) && fd < 0){
    11ee:	83 c4 10             	add    $0x10,%esp
    11f1:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    11f5:	0f 84 85 00 00 00    	je     1280 <createdelete+0x120>
    11fb:	85 c0                	test   %eax,%eax
    11fd:	0f 88 1a 01 00 00    	js     131d <createdelete+0x1bd>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1203:	83 fe 08             	cmp    $0x8,%esi
    1206:	0f 86 54 01 00 00    	jbe    1360 <createdelete+0x200>
        close(fd);
    120c:	83 ec 0c             	sub    $0xc,%esp
    120f:	50                   	push   %eax
    1210:	e8 25 26 00 00       	call   383a <close>
    1215:	83 c4 10             	add    $0x10,%esp
    1218:	83 c3 01             	add    $0x1,%ebx
    for(pi = 0; pi < 4; pi++){
    121b:	80 fb 74             	cmp    $0x74,%bl
    121e:	75 b9                	jne    11d9 <createdelete+0x79>
    1220:	8b 75 c0             	mov    -0x40(%ebp),%esi
  for(i = 0; i < N; i++){
    1223:	83 fe 13             	cmp    $0x13,%esi
    1226:	75 90                	jne    11b8 <createdelete+0x58>
    1228:	be 70 00 00 00       	mov    $0x70,%esi
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    1230:	8d 46 c0             	lea    -0x40(%esi),%eax
  name[0] = name[1] = name[2] = 0;
    1233:	bb 04 00 00 00       	mov    $0x4,%ebx
    1238:	88 45 c7             	mov    %al,-0x39(%ebp)
      name[0] = 'p' + i;
    123b:	89 f0                	mov    %esi,%eax
      unlink(name);
    123d:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    1240:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1243:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    1247:	57                   	push   %edi
      name[1] = '0' + i;
    1248:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    124b:	e8 1a 26 00 00       	call   386a <unlink>
    for(pi = 0; pi < 4; pi++){
    1250:	83 c4 10             	add    $0x10,%esp
    1253:	83 eb 01             	sub    $0x1,%ebx
    1256:	75 e3                	jne    123b <createdelete+0xdb>
    1258:	83 c6 01             	add    $0x1,%esi
  for(i = 0; i < N; i++){
    125b:	89 f0                	mov    %esi,%eax
    125d:	3c 84                	cmp    $0x84,%al
    125f:	75 cf                	jne    1230 <createdelete+0xd0>
  printf(1, "createdelete ok\n");
    1261:	83 ec 08             	sub    $0x8,%esp
    1264:	68 83 41 00 00       	push   $0x4183
    1269:	6a 01                	push   $0x1
    126b:	e8 f0 26 00 00       	call   3960 <printf>
}
    1270:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1273:	5b                   	pop    %ebx
    1274:	5e                   	pop    %esi
    1275:	5f                   	pop    %edi
    1276:	5d                   	pop    %ebp
    1277:	c3                   	ret    
    1278:	90                   	nop
    1279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1280:	83 fe 08             	cmp    $0x8,%esi
    1283:	0f 86 cf 00 00 00    	jbe    1358 <createdelete+0x1f8>
      if(fd >= 0)
    1289:	85 c0                	test   %eax,%eax
    128b:	78 8b                	js     1218 <createdelete+0xb8>
    128d:	e9 7a ff ff ff       	jmp    120c <createdelete+0xac>
    1292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      name[0] = 'p' + pi;
    1298:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    129b:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    129f:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[0] = 'p' + pi;
    12a2:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[2] = '\0';
    12a5:	31 db                	xor    %ebx,%ebx
    12a7:	eb 0f                	jmp    12b8 <createdelete+0x158>
    12a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    12b0:	83 fb 13             	cmp    $0x13,%ebx
    12b3:	74 63                	je     1318 <createdelete+0x1b8>
    12b5:	83 c3 01             	add    $0x1,%ebx
        fd = open(name, O_CREATE | O_RDWR);
    12b8:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    12bb:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    12be:	68 02 02 00 00       	push   $0x202
    12c3:	57                   	push   %edi
        name[1] = '0' + i;
    12c4:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    12c7:	e8 8e 25 00 00       	call   385a <open>
        if(fd < 0){
    12cc:	83 c4 10             	add    $0x10,%esp
    12cf:	85 c0                	test   %eax,%eax
    12d1:	78 5f                	js     1332 <createdelete+0x1d2>
        close(fd);
    12d3:	83 ec 0c             	sub    $0xc,%esp
    12d6:	50                   	push   %eax
    12d7:	e8 5e 25 00 00       	call   383a <close>
        if(i > 0 && (i % 2 ) == 0){
    12dc:	83 c4 10             	add    $0x10,%esp
    12df:	85 db                	test   %ebx,%ebx
    12e1:	74 d2                	je     12b5 <createdelete+0x155>
    12e3:	f6 c3 01             	test   $0x1,%bl
    12e6:	75 c8                	jne    12b0 <createdelete+0x150>
          if(unlink(name) < 0){
    12e8:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    12eb:	89 d8                	mov    %ebx,%eax
    12ed:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    12ef:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    12f0:	83 c0 30             	add    $0x30,%eax
    12f3:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    12f6:	e8 6f 25 00 00       	call   386a <unlink>
    12fb:	83 c4 10             	add    $0x10,%esp
    12fe:	85 c0                	test   %eax,%eax
    1300:	79 ae                	jns    12b0 <createdelete+0x150>
            printf(1, "unlink failed\n");
    1302:	52                   	push   %edx
    1303:	52                   	push   %edx
    1304:	68 71 3d 00 00       	push   $0x3d71
    1309:	6a 01                	push   $0x1
    130b:	e8 50 26 00 00       	call   3960 <printf>
            exit();
    1310:	e8 ed 24 00 00       	call   3802 <exit>
    1315:	8d 76 00             	lea    0x0(%esi),%esi
      exit();
    1318:	e8 e5 24 00 00       	call   3802 <exit>
        printf(1, "oops createdelete %s didn't exist\n", name);
    131d:	83 ec 04             	sub    $0x4,%esp
    1320:	57                   	push   %edi
    1321:	68 3c 4e 00 00       	push   $0x4e3c
    1326:	6a 01                	push   $0x1
    1328:	e8 33 26 00 00       	call   3960 <printf>
        exit();
    132d:	e8 d0 24 00 00       	call   3802 <exit>
          printf(1, "create failed\n");
    1332:	51                   	push   %ecx
    1333:	51                   	push   %ecx
    1334:	68 bf 43 00 00       	push   $0x43bf
    1339:	6a 01                	push   $0x1
    133b:	e8 20 26 00 00       	call   3960 <printf>
          exit();
    1340:	e8 bd 24 00 00       	call   3802 <exit>
      printf(1, "fork failed\n");
    1345:	53                   	push   %ebx
    1346:	53                   	push   %ebx
    1347:	68 f9 4b 00 00       	push   $0x4bf9
    134c:	6a 01                	push   $0x1
    134e:	e8 0d 26 00 00       	call   3960 <printf>
      exit();
    1353:	e8 aa 24 00 00       	call   3802 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1358:	85 c0                	test   %eax,%eax
    135a:	0f 88 b8 fe ff ff    	js     1218 <createdelete+0xb8>
        printf(1, "oops createdelete %s did exist\n", name);
    1360:	50                   	push   %eax
    1361:	57                   	push   %edi
    1362:	68 60 4e 00 00       	push   $0x4e60
    1367:	6a 01                	push   $0x1
    1369:	e8 f2 25 00 00       	call   3960 <printf>
        exit();
    136e:	e8 8f 24 00 00       	call   3802 <exit>
    1373:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001380 <unlinkread>:
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	56                   	push   %esi
    1384:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    1385:	83 ec 08             	sub    $0x8,%esp
    1388:	68 94 41 00 00       	push   $0x4194
    138d:	6a 01                	push   $0x1
    138f:	e8 cc 25 00 00       	call   3960 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1394:	5b                   	pop    %ebx
    1395:	5e                   	pop    %esi
    1396:	68 02 02 00 00       	push   $0x202
    139b:	68 a5 41 00 00       	push   $0x41a5
    13a0:	e8 b5 24 00 00       	call   385a <open>
  if(fd < 0){
    13a5:	83 c4 10             	add    $0x10,%esp
    13a8:	85 c0                	test   %eax,%eax
    13aa:	0f 88 e6 00 00 00    	js     1496 <unlinkread+0x116>
  write(fd, "hello", 5);
    13b0:	83 ec 04             	sub    $0x4,%esp
    13b3:	89 c3                	mov    %eax,%ebx
    13b5:	6a 05                	push   $0x5
    13b7:	68 ca 41 00 00       	push   $0x41ca
    13bc:	50                   	push   %eax
    13bd:	e8 70 24 00 00       	call   3832 <write>
  close(fd);
    13c2:	89 1c 24             	mov    %ebx,(%esp)
    13c5:	e8 70 24 00 00       	call   383a <close>
  fd = open("unlinkread", O_RDWR);
    13ca:	58                   	pop    %eax
    13cb:	5a                   	pop    %edx
    13cc:	6a 02                	push   $0x2
    13ce:	68 a5 41 00 00       	push   $0x41a5
    13d3:	e8 82 24 00 00       	call   385a <open>
  if(fd < 0){
    13d8:	83 c4 10             	add    $0x10,%esp
    13db:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_RDWR);
    13dd:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    13df:	0f 88 10 01 00 00    	js     14f5 <unlinkread+0x175>
  if(unlink("unlinkread") != 0){
    13e5:	83 ec 0c             	sub    $0xc,%esp
    13e8:	68 a5 41 00 00       	push   $0x41a5
    13ed:	e8 78 24 00 00       	call   386a <unlink>
    13f2:	83 c4 10             	add    $0x10,%esp
    13f5:	85 c0                	test   %eax,%eax
    13f7:	0f 85 e5 00 00 00    	jne    14e2 <unlinkread+0x162>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    13fd:	83 ec 08             	sub    $0x8,%esp
    1400:	68 02 02 00 00       	push   $0x202
    1405:	68 a5 41 00 00       	push   $0x41a5
    140a:	e8 4b 24 00 00       	call   385a <open>
  write(fd1, "yyy", 3);
    140f:	83 c4 0c             	add    $0xc,%esp
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1412:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1414:	6a 03                	push   $0x3
    1416:	68 02 42 00 00       	push   $0x4202
    141b:	50                   	push   %eax
    141c:	e8 11 24 00 00       	call   3832 <write>
  close(fd1);
    1421:	89 34 24             	mov    %esi,(%esp)
    1424:	e8 11 24 00 00       	call   383a <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    1429:	83 c4 0c             	add    $0xc,%esp
    142c:	68 00 20 00 00       	push   $0x2000
    1431:	68 60 85 00 00       	push   $0x8560
    1436:	53                   	push   %ebx
    1437:	e8 ee 23 00 00       	call   382a <read>
    143c:	83 c4 10             	add    $0x10,%esp
    143f:	83 f8 05             	cmp    $0x5,%eax
    1442:	0f 85 87 00 00 00    	jne    14cf <unlinkread+0x14f>
  if(buf[0] != 'h'){
    1448:	80 3d 60 85 00 00 68 	cmpb   $0x68,0x8560
    144f:	75 6b                	jne    14bc <unlinkread+0x13c>
  if(write(fd, buf, 10) != 10){
    1451:	83 ec 04             	sub    $0x4,%esp
    1454:	6a 0a                	push   $0xa
    1456:	68 60 85 00 00       	push   $0x8560
    145b:	53                   	push   %ebx
    145c:	e8 d1 23 00 00       	call   3832 <write>
    1461:	83 c4 10             	add    $0x10,%esp
    1464:	83 f8 0a             	cmp    $0xa,%eax
    1467:	75 40                	jne    14a9 <unlinkread+0x129>
  close(fd);
    1469:	83 ec 0c             	sub    $0xc,%esp
    146c:	53                   	push   %ebx
    146d:	e8 c8 23 00 00       	call   383a <close>
  unlink("unlinkread");
    1472:	c7 04 24 a5 41 00 00 	movl   $0x41a5,(%esp)
    1479:	e8 ec 23 00 00       	call   386a <unlink>
  printf(1, "unlinkread ok\n");
    147e:	58                   	pop    %eax
    147f:	5a                   	pop    %edx
    1480:	68 4d 42 00 00       	push   $0x424d
    1485:	6a 01                	push   $0x1
    1487:	e8 d4 24 00 00       	call   3960 <printf>
}
    148c:	83 c4 10             	add    $0x10,%esp
    148f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1492:	5b                   	pop    %ebx
    1493:	5e                   	pop    %esi
    1494:	5d                   	pop    %ebp
    1495:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    1496:	51                   	push   %ecx
    1497:	51                   	push   %ecx
    1498:	68 b0 41 00 00       	push   $0x41b0
    149d:	6a 01                	push   $0x1
    149f:	e8 bc 24 00 00       	call   3960 <printf>
    exit();
    14a4:	e8 59 23 00 00       	call   3802 <exit>
    printf(1, "unlinkread write failed\n");
    14a9:	51                   	push   %ecx
    14aa:	51                   	push   %ecx
    14ab:	68 34 42 00 00       	push   $0x4234
    14b0:	6a 01                	push   $0x1
    14b2:	e8 a9 24 00 00       	call   3960 <printf>
    exit();
    14b7:	e8 46 23 00 00       	call   3802 <exit>
    printf(1, "unlinkread wrong data\n");
    14bc:	53                   	push   %ebx
    14bd:	53                   	push   %ebx
    14be:	68 1d 42 00 00       	push   $0x421d
    14c3:	6a 01                	push   $0x1
    14c5:	e8 96 24 00 00       	call   3960 <printf>
    exit();
    14ca:	e8 33 23 00 00       	call   3802 <exit>
    printf(1, "unlinkread read failed");
    14cf:	56                   	push   %esi
    14d0:	56                   	push   %esi
    14d1:	68 06 42 00 00       	push   $0x4206
    14d6:	6a 01                	push   $0x1
    14d8:	e8 83 24 00 00       	call   3960 <printf>
    exit();
    14dd:	e8 20 23 00 00       	call   3802 <exit>
    printf(1, "unlink unlinkread failed\n");
    14e2:	50                   	push   %eax
    14e3:	50                   	push   %eax
    14e4:	68 e8 41 00 00       	push   $0x41e8
    14e9:	6a 01                	push   $0x1
    14eb:	e8 70 24 00 00       	call   3960 <printf>
    exit();
    14f0:	e8 0d 23 00 00       	call   3802 <exit>
    printf(1, "open unlinkread failed\n");
    14f5:	50                   	push   %eax
    14f6:	50                   	push   %eax
    14f7:	68 d0 41 00 00       	push   $0x41d0
    14fc:	6a 01                	push   $0x1
    14fe:	e8 5d 24 00 00       	call   3960 <printf>
    exit();
    1503:	e8 fa 22 00 00       	call   3802 <exit>
    1508:	90                   	nop
    1509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001510 <linktest>:
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	53                   	push   %ebx
    1514:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    1517:	68 5c 42 00 00       	push   $0x425c
    151c:	6a 01                	push   $0x1
    151e:	e8 3d 24 00 00       	call   3960 <printf>
  unlink("lf1");
    1523:	c7 04 24 66 42 00 00 	movl   $0x4266,(%esp)
    152a:	e8 3b 23 00 00       	call   386a <unlink>
  unlink("lf2");
    152f:	c7 04 24 6a 42 00 00 	movl   $0x426a,(%esp)
    1536:	e8 2f 23 00 00       	call   386a <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    153b:	58                   	pop    %eax
    153c:	5a                   	pop    %edx
    153d:	68 02 02 00 00       	push   $0x202
    1542:	68 66 42 00 00       	push   $0x4266
    1547:	e8 0e 23 00 00       	call   385a <open>
  if(fd < 0){
    154c:	83 c4 10             	add    $0x10,%esp
    154f:	85 c0                	test   %eax,%eax
    1551:	0f 88 1e 01 00 00    	js     1675 <linktest+0x165>
  if(write(fd, "hello", 5) != 5){
    1557:	83 ec 04             	sub    $0x4,%esp
    155a:	89 c3                	mov    %eax,%ebx
    155c:	6a 05                	push   $0x5
    155e:	68 ca 41 00 00       	push   $0x41ca
    1563:	50                   	push   %eax
    1564:	e8 c9 22 00 00       	call   3832 <write>
    1569:	83 c4 10             	add    $0x10,%esp
    156c:	83 f8 05             	cmp    $0x5,%eax
    156f:	0f 85 98 01 00 00    	jne    170d <linktest+0x1fd>
  close(fd);
    1575:	83 ec 0c             	sub    $0xc,%esp
    1578:	53                   	push   %ebx
    1579:	e8 bc 22 00 00       	call   383a <close>
  if(link("lf1", "lf2") < 0){
    157e:	5b                   	pop    %ebx
    157f:	58                   	pop    %eax
    1580:	68 6a 42 00 00       	push   $0x426a
    1585:	68 66 42 00 00       	push   $0x4266
    158a:	e8 eb 22 00 00       	call   387a <link>
    158f:	83 c4 10             	add    $0x10,%esp
    1592:	85 c0                	test   %eax,%eax
    1594:	0f 88 60 01 00 00    	js     16fa <linktest+0x1ea>
  unlink("lf1");
    159a:	83 ec 0c             	sub    $0xc,%esp
    159d:	68 66 42 00 00       	push   $0x4266
    15a2:	e8 c3 22 00 00       	call   386a <unlink>
  if(open("lf1", 0) >= 0){
    15a7:	58                   	pop    %eax
    15a8:	5a                   	pop    %edx
    15a9:	6a 00                	push   $0x0
    15ab:	68 66 42 00 00       	push   $0x4266
    15b0:	e8 a5 22 00 00       	call   385a <open>
    15b5:	83 c4 10             	add    $0x10,%esp
    15b8:	85 c0                	test   %eax,%eax
    15ba:	0f 89 27 01 00 00    	jns    16e7 <linktest+0x1d7>
  fd = open("lf2", 0);
    15c0:	83 ec 08             	sub    $0x8,%esp
    15c3:	6a 00                	push   $0x0
    15c5:	68 6a 42 00 00       	push   $0x426a
    15ca:	e8 8b 22 00 00       	call   385a <open>
  if(fd < 0){
    15cf:	83 c4 10             	add    $0x10,%esp
    15d2:	85 c0                	test   %eax,%eax
  fd = open("lf2", 0);
    15d4:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    15d6:	0f 88 f8 00 00 00    	js     16d4 <linktest+0x1c4>
  if(read(fd, buf, sizeof(buf)) != 5){
    15dc:	83 ec 04             	sub    $0x4,%esp
    15df:	68 00 20 00 00       	push   $0x2000
    15e4:	68 60 85 00 00       	push   $0x8560
    15e9:	50                   	push   %eax
    15ea:	e8 3b 22 00 00       	call   382a <read>
    15ef:	83 c4 10             	add    $0x10,%esp
    15f2:	83 f8 05             	cmp    $0x5,%eax
    15f5:	0f 85 c6 00 00 00    	jne    16c1 <linktest+0x1b1>
  close(fd);
    15fb:	83 ec 0c             	sub    $0xc,%esp
    15fe:	53                   	push   %ebx
    15ff:	e8 36 22 00 00       	call   383a <close>
  if(link("lf2", "lf2") >= 0){
    1604:	58                   	pop    %eax
    1605:	5a                   	pop    %edx
    1606:	68 6a 42 00 00       	push   $0x426a
    160b:	68 6a 42 00 00       	push   $0x426a
    1610:	e8 65 22 00 00       	call   387a <link>
    1615:	83 c4 10             	add    $0x10,%esp
    1618:	85 c0                	test   %eax,%eax
    161a:	0f 89 8e 00 00 00    	jns    16ae <linktest+0x19e>
  unlink("lf2");
    1620:	83 ec 0c             	sub    $0xc,%esp
    1623:	68 6a 42 00 00       	push   $0x426a
    1628:	e8 3d 22 00 00       	call   386a <unlink>
  if(link("lf2", "lf1") >= 0){
    162d:	59                   	pop    %ecx
    162e:	5b                   	pop    %ebx
    162f:	68 66 42 00 00       	push   $0x4266
    1634:	68 6a 42 00 00       	push   $0x426a
    1639:	e8 3c 22 00 00       	call   387a <link>
    163e:	83 c4 10             	add    $0x10,%esp
    1641:	85 c0                	test   %eax,%eax
    1643:	79 56                	jns    169b <linktest+0x18b>
  if(link(".", "lf1") >= 0){
    1645:	83 ec 08             	sub    $0x8,%esp
    1648:	68 66 42 00 00       	push   $0x4266
    164d:	68 2e 45 00 00       	push   $0x452e
    1652:	e8 23 22 00 00       	call   387a <link>
    1657:	83 c4 10             	add    $0x10,%esp
    165a:	85 c0                	test   %eax,%eax
    165c:	79 2a                	jns    1688 <linktest+0x178>
  printf(1, "linktest ok\n");
    165e:	83 ec 08             	sub    $0x8,%esp
    1661:	68 04 43 00 00       	push   $0x4304
    1666:	6a 01                	push   $0x1
    1668:	e8 f3 22 00 00       	call   3960 <printf>
}
    166d:	83 c4 10             	add    $0x10,%esp
    1670:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1673:	c9                   	leave  
    1674:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1675:	50                   	push   %eax
    1676:	50                   	push   %eax
    1677:	68 6e 42 00 00       	push   $0x426e
    167c:	6a 01                	push   $0x1
    167e:	e8 dd 22 00 00       	call   3960 <printf>
    exit();
    1683:	e8 7a 21 00 00       	call   3802 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    1688:	50                   	push   %eax
    1689:	50                   	push   %eax
    168a:	68 e8 42 00 00       	push   $0x42e8
    168f:	6a 01                	push   $0x1
    1691:	e8 ca 22 00 00       	call   3960 <printf>
    exit();
    1696:	e8 67 21 00 00       	call   3802 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    169b:	52                   	push   %edx
    169c:	52                   	push   %edx
    169d:	68 a8 4e 00 00       	push   $0x4ea8
    16a2:	6a 01                	push   $0x1
    16a4:	e8 b7 22 00 00       	call   3960 <printf>
    exit();
    16a9:	e8 54 21 00 00       	call   3802 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    16ae:	50                   	push   %eax
    16af:	50                   	push   %eax
    16b0:	68 ca 42 00 00       	push   $0x42ca
    16b5:	6a 01                	push   $0x1
    16b7:	e8 a4 22 00 00       	call   3960 <printf>
    exit();
    16bc:	e8 41 21 00 00       	call   3802 <exit>
    printf(1, "read lf2 failed\n");
    16c1:	51                   	push   %ecx
    16c2:	51                   	push   %ecx
    16c3:	68 b9 42 00 00       	push   $0x42b9
    16c8:	6a 01                	push   $0x1
    16ca:	e8 91 22 00 00       	call   3960 <printf>
    exit();
    16cf:	e8 2e 21 00 00       	call   3802 <exit>
    printf(1, "open lf2 failed\n");
    16d4:	53                   	push   %ebx
    16d5:	53                   	push   %ebx
    16d6:	68 a8 42 00 00       	push   $0x42a8
    16db:	6a 01                	push   $0x1
    16dd:	e8 7e 22 00 00       	call   3960 <printf>
    exit();
    16e2:	e8 1b 21 00 00       	call   3802 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    16e7:	50                   	push   %eax
    16e8:	50                   	push   %eax
    16e9:	68 80 4e 00 00       	push   $0x4e80
    16ee:	6a 01                	push   $0x1
    16f0:	e8 6b 22 00 00       	call   3960 <printf>
    exit();
    16f5:	e8 08 21 00 00       	call   3802 <exit>
    printf(1, "link lf1 lf2 failed\n");
    16fa:	51                   	push   %ecx
    16fb:	51                   	push   %ecx
    16fc:	68 93 42 00 00       	push   $0x4293
    1701:	6a 01                	push   $0x1
    1703:	e8 58 22 00 00       	call   3960 <printf>
    exit();
    1708:	e8 f5 20 00 00       	call   3802 <exit>
    printf(1, "write lf1 failed\n");
    170d:	50                   	push   %eax
    170e:	50                   	push   %eax
    170f:	68 81 42 00 00       	push   $0x4281
    1714:	6a 01                	push   $0x1
    1716:	e8 45 22 00 00       	call   3960 <printf>
    exit();
    171b:	e8 e2 20 00 00       	call   3802 <exit>

00001720 <concreate>:
{
    1720:	55                   	push   %ebp
    1721:	89 e5                	mov    %esp,%ebp
    1723:	57                   	push   %edi
    1724:	56                   	push   %esi
    1725:	53                   	push   %ebx
  for(i = 0; i < 40; i++){
    1726:	31 f6                	xor    %esi,%esi
    1728:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    if(pid && (i % 3) == 1){
    172b:	bf ab aa aa aa       	mov    $0xaaaaaaab,%edi
{
    1730:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    1733:	68 11 43 00 00       	push   $0x4311
    1738:	6a 01                	push   $0x1
    173a:	e8 21 22 00 00       	call   3960 <printf>
  file[0] = 'C';
    173f:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    1743:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    1747:	83 c4 10             	add    $0x10,%esp
    174a:	eb 4c                	jmp    1798 <concreate+0x78>
    174c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid && (i % 3) == 1){
    1750:	89 f0                	mov    %esi,%eax
    1752:	89 f1                	mov    %esi,%ecx
    1754:	f7 e7                	mul    %edi
    1756:	d1 ea                	shr    %edx
    1758:	8d 04 52             	lea    (%edx,%edx,2),%eax
    175b:	29 c1                	sub    %eax,%ecx
    175d:	83 f9 01             	cmp    $0x1,%ecx
    1760:	0f 84 ba 00 00 00    	je     1820 <concreate+0x100>
      fd = open(file, O_CREATE | O_RDWR);
    1766:	83 ec 08             	sub    $0x8,%esp
    1769:	68 02 02 00 00       	push   $0x202
    176e:	53                   	push   %ebx
    176f:	e8 e6 20 00 00       	call   385a <open>
      if(fd < 0){
    1774:	83 c4 10             	add    $0x10,%esp
    1777:	85 c0                	test   %eax,%eax
    1779:	78 67                	js     17e2 <concreate+0xc2>
      close(fd);
    177b:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    177e:	83 c6 01             	add    $0x1,%esi
      close(fd);
    1781:	50                   	push   %eax
    1782:	e8 b3 20 00 00       	call   383a <close>
    1787:	83 c4 10             	add    $0x10,%esp
      wait();
    178a:	e8 7b 20 00 00       	call   380a <wait>
  for(i = 0; i < 40; i++){
    178f:	83 fe 28             	cmp    $0x28,%esi
    1792:	0f 84 aa 00 00 00    	je     1842 <concreate+0x122>
    unlink(file);
    1798:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    179b:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    179e:	53                   	push   %ebx
    file[1] = '0' + i;
    179f:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    17a2:	e8 c3 20 00 00       	call   386a <unlink>
    pid = fork();
    17a7:	e8 4e 20 00 00       	call   37fa <fork>
    if(pid && (i % 3) == 1){
    17ac:	83 c4 10             	add    $0x10,%esp
    17af:	85 c0                	test   %eax,%eax
    17b1:	75 9d                	jne    1750 <concreate+0x30>
    } else if(pid == 0 && (i % 5) == 1){
    17b3:	89 f0                	mov    %esi,%eax
    17b5:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    17ba:	f7 e2                	mul    %edx
    17bc:	c1 ea 02             	shr    $0x2,%edx
    17bf:	8d 04 92             	lea    (%edx,%edx,4),%eax
    17c2:	29 c6                	sub    %eax,%esi
    17c4:	83 fe 01             	cmp    $0x1,%esi
    17c7:	74 37                	je     1800 <concreate+0xe0>
      fd = open(file, O_CREATE | O_RDWR);
    17c9:	83 ec 08             	sub    $0x8,%esp
    17cc:	68 02 02 00 00       	push   $0x202
    17d1:	53                   	push   %ebx
    17d2:	e8 83 20 00 00       	call   385a <open>
      if(fd < 0){
    17d7:	83 c4 10             	add    $0x10,%esp
    17da:	85 c0                	test   %eax,%eax
    17dc:	0f 89 28 02 00 00    	jns    1a0a <concreate+0x2ea>
        printf(1, "concreate create %s failed\n", file);
    17e2:	83 ec 04             	sub    $0x4,%esp
    17e5:	53                   	push   %ebx
    17e6:	68 24 43 00 00       	push   $0x4324
    17eb:	6a 01                	push   $0x1
    17ed:	e8 6e 21 00 00       	call   3960 <printf>
        exit();
    17f2:	e8 0b 20 00 00       	call   3802 <exit>
    17f7:	89 f6                	mov    %esi,%esi
    17f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      link("C0", file);
    1800:	83 ec 08             	sub    $0x8,%esp
    1803:	53                   	push   %ebx
    1804:	68 21 43 00 00       	push   $0x4321
    1809:	e8 6c 20 00 00       	call   387a <link>
    180e:	83 c4 10             	add    $0x10,%esp
      exit();
    1811:	e8 ec 1f 00 00       	call   3802 <exit>
    1816:	8d 76 00             	lea    0x0(%esi),%esi
    1819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      link("C0", file);
    1820:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    1823:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    1826:	53                   	push   %ebx
    1827:	68 21 43 00 00       	push   $0x4321
    182c:	e8 49 20 00 00       	call   387a <link>
    1831:	83 c4 10             	add    $0x10,%esp
      wait();
    1834:	e8 d1 1f 00 00       	call   380a <wait>
  for(i = 0; i < 40; i++){
    1839:	83 fe 28             	cmp    $0x28,%esi
    183c:	0f 85 56 ff ff ff    	jne    1798 <concreate+0x78>
  memset(fa, 0, sizeof(fa));
    1842:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1845:	83 ec 04             	sub    $0x4,%esp
    1848:	6a 28                	push   $0x28
    184a:	6a 00                	push   $0x0
    184c:	50                   	push   %eax
    184d:	e8 0e 1e 00 00       	call   3660 <memset>
  fd = open(".", 0);
    1852:	5f                   	pop    %edi
    1853:	58                   	pop    %eax
    1854:	6a 00                	push   $0x0
    1856:	68 2e 45 00 00       	push   $0x452e
    185b:	8d 7d b0             	lea    -0x50(%ebp),%edi
    185e:	e8 f7 1f 00 00       	call   385a <open>
  while(read(fd, &de, sizeof(de)) > 0){
    1863:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    1866:	89 c6                	mov    %eax,%esi
  n = 0;
    1868:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    186f:	90                   	nop
  while(read(fd, &de, sizeof(de)) > 0){
    1870:	83 ec 04             	sub    $0x4,%esp
    1873:	6a 10                	push   $0x10
    1875:	57                   	push   %edi
    1876:	56                   	push   %esi
    1877:	e8 ae 1f 00 00       	call   382a <read>
    187c:	83 c4 10             	add    $0x10,%esp
    187f:	85 c0                	test   %eax,%eax
    1881:	7e 3d                	jle    18c0 <concreate+0x1a0>
    if(de.inum == 0)
    1883:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1888:	74 e6                	je     1870 <concreate+0x150>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    188a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    188e:	75 e0                	jne    1870 <concreate+0x150>
    1890:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1894:	75 da                	jne    1870 <concreate+0x150>
      i = de.name[1] - '0';
    1896:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    189a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    189d:	83 f8 27             	cmp    $0x27,%eax
    18a0:	0f 87 4e 01 00 00    	ja     19f4 <concreate+0x2d4>
      if(fa[i]){
    18a6:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    18ab:	0f 85 2d 01 00 00    	jne    19de <concreate+0x2be>
      fa[i] = 1;
    18b1:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    18b6:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    18ba:	eb b4                	jmp    1870 <concreate+0x150>
    18bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    18c0:	83 ec 0c             	sub    $0xc,%esp
    18c3:	56                   	push   %esi
    18c4:	e8 71 1f 00 00       	call   383a <close>
  if(n != 40){
    18c9:	83 c4 10             	add    $0x10,%esp
    18cc:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    18d0:	0f 85 f5 00 00 00    	jne    19cb <concreate+0x2ab>
  for(i = 0; i < 40; i++){
    18d6:	31 f6                	xor    %esi,%esi
    18d8:	eb 48                	jmp    1922 <concreate+0x202>
    18da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    18e0:	85 ff                	test   %edi,%edi
    18e2:	74 05                	je     18e9 <concreate+0x1c9>
    18e4:	83 fa 01             	cmp    $0x1,%edx
    18e7:	74 64                	je     194d <concreate+0x22d>
      unlink(file);
    18e9:	83 ec 0c             	sub    $0xc,%esp
    18ec:	53                   	push   %ebx
    18ed:	e8 78 1f 00 00       	call   386a <unlink>
      unlink(file);
    18f2:	89 1c 24             	mov    %ebx,(%esp)
    18f5:	e8 70 1f 00 00       	call   386a <unlink>
      unlink(file);
    18fa:	89 1c 24             	mov    %ebx,(%esp)
    18fd:	e8 68 1f 00 00       	call   386a <unlink>
      unlink(file);
    1902:	89 1c 24             	mov    %ebx,(%esp)
    1905:	e8 60 1f 00 00       	call   386a <unlink>
    190a:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    190d:	85 ff                	test   %edi,%edi
    190f:	0f 84 fc fe ff ff    	je     1811 <concreate+0xf1>
  for(i = 0; i < 40; i++){
    1915:	83 c6 01             	add    $0x1,%esi
      wait();
    1918:	e8 ed 1e 00 00       	call   380a <wait>
  for(i = 0; i < 40; i++){
    191d:	83 fe 28             	cmp    $0x28,%esi
    1920:	74 7e                	je     19a0 <concreate+0x280>
    file[1] = '0' + i;
    1922:	8d 46 30             	lea    0x30(%esi),%eax
    1925:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    1928:	e8 cd 1e 00 00       	call   37fa <fork>
    if(pid < 0){
    192d:	85 c0                	test   %eax,%eax
    pid = fork();
    192f:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1931:	0f 88 80 00 00 00    	js     19b7 <concreate+0x297>
    if(((i % 3) == 0 && pid == 0) ||
    1937:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    193c:	f7 e6                	mul    %esi
    193e:	d1 ea                	shr    %edx
    1940:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1943:	89 f2                	mov    %esi,%edx
    1945:	29 c2                	sub    %eax,%edx
    1947:	89 d0                	mov    %edx,%eax
    1949:	09 f8                	or     %edi,%eax
    194b:	75 93                	jne    18e0 <concreate+0x1c0>
      close(open(file, 0));
    194d:	83 ec 08             	sub    $0x8,%esp
    1950:	6a 00                	push   $0x0
    1952:	53                   	push   %ebx
    1953:	e8 02 1f 00 00       	call   385a <open>
    1958:	89 04 24             	mov    %eax,(%esp)
    195b:	e8 da 1e 00 00       	call   383a <close>
      close(open(file, 0));
    1960:	58                   	pop    %eax
    1961:	5a                   	pop    %edx
    1962:	6a 00                	push   $0x0
    1964:	53                   	push   %ebx
    1965:	e8 f0 1e 00 00       	call   385a <open>
    196a:	89 04 24             	mov    %eax,(%esp)
    196d:	e8 c8 1e 00 00       	call   383a <close>
      close(open(file, 0));
    1972:	59                   	pop    %ecx
    1973:	58                   	pop    %eax
    1974:	6a 00                	push   $0x0
    1976:	53                   	push   %ebx
    1977:	e8 de 1e 00 00       	call   385a <open>
    197c:	89 04 24             	mov    %eax,(%esp)
    197f:	e8 b6 1e 00 00       	call   383a <close>
      close(open(file, 0));
    1984:	58                   	pop    %eax
    1985:	5a                   	pop    %edx
    1986:	6a 00                	push   $0x0
    1988:	53                   	push   %ebx
    1989:	e8 cc 1e 00 00       	call   385a <open>
    198e:	89 04 24             	mov    %eax,(%esp)
    1991:	e8 a4 1e 00 00       	call   383a <close>
    1996:	83 c4 10             	add    $0x10,%esp
    1999:	e9 6f ff ff ff       	jmp    190d <concreate+0x1ed>
    199e:	66 90                	xchg   %ax,%ax
  printf(1, "concreate ok\n");
    19a0:	83 ec 08             	sub    $0x8,%esp
    19a3:	68 76 43 00 00       	push   $0x4376
    19a8:	6a 01                	push   $0x1
    19aa:	e8 b1 1f 00 00       	call   3960 <printf>
}
    19af:	8d 65 f4             	lea    -0xc(%ebp),%esp
    19b2:	5b                   	pop    %ebx
    19b3:	5e                   	pop    %esi
    19b4:	5f                   	pop    %edi
    19b5:	5d                   	pop    %ebp
    19b6:	c3                   	ret    
      printf(1, "fork failed\n");
    19b7:	83 ec 08             	sub    $0x8,%esp
    19ba:	68 f9 4b 00 00       	push   $0x4bf9
    19bf:	6a 01                	push   $0x1
    19c1:	e8 9a 1f 00 00       	call   3960 <printf>
      exit();
    19c6:	e8 37 1e 00 00       	call   3802 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    19cb:	51                   	push   %ecx
    19cc:	51                   	push   %ecx
    19cd:	68 cc 4e 00 00       	push   $0x4ecc
    19d2:	6a 01                	push   $0x1
    19d4:	e8 87 1f 00 00       	call   3960 <printf>
    exit();
    19d9:	e8 24 1e 00 00       	call   3802 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    19de:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    19e1:	53                   	push   %ebx
    19e2:	50                   	push   %eax
    19e3:	68 59 43 00 00       	push   $0x4359
    19e8:	6a 01                	push   $0x1
    19ea:	e8 71 1f 00 00       	call   3960 <printf>
        exit();
    19ef:	e8 0e 1e 00 00       	call   3802 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    19f4:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    19f7:	56                   	push   %esi
    19f8:	50                   	push   %eax
    19f9:	68 40 43 00 00       	push   $0x4340
    19fe:	6a 01                	push   $0x1
    1a00:	e8 5b 1f 00 00       	call   3960 <printf>
        exit();
    1a05:	e8 f8 1d 00 00       	call   3802 <exit>
      close(fd);
    1a0a:	83 ec 0c             	sub    $0xc,%esp
    1a0d:	50                   	push   %eax
    1a0e:	e8 27 1e 00 00       	call   383a <close>
    1a13:	83 c4 10             	add    $0x10,%esp
    1a16:	e9 f6 fd ff ff       	jmp    1811 <concreate+0xf1>
    1a1b:	90                   	nop
    1a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001a20 <linkunlink>:
{
    1a20:	55                   	push   %ebp
    1a21:	89 e5                	mov    %esp,%ebp
    1a23:	57                   	push   %edi
    1a24:	56                   	push   %esi
    1a25:	53                   	push   %ebx
    1a26:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    1a29:	68 84 43 00 00       	push   $0x4384
    1a2e:	6a 01                	push   $0x1
    1a30:	e8 2b 1f 00 00       	call   3960 <printf>
  unlink("x");
    1a35:	c7 04 24 11 46 00 00 	movl   $0x4611,(%esp)
    1a3c:	e8 29 1e 00 00       	call   386a <unlink>
  pid = fork();
    1a41:	e8 b4 1d 00 00       	call   37fa <fork>
  if(pid < 0){
    1a46:	83 c4 10             	add    $0x10,%esp
    1a49:	85 c0                	test   %eax,%eax
  pid = fork();
    1a4b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1a4e:	0f 88 b6 00 00 00    	js     1b0a <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    1a54:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1a58:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1a5d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1a62:	19 ff                	sbb    %edi,%edi
    1a64:	83 e7 60             	and    $0x60,%edi
    1a67:	83 c7 01             	add    $0x1,%edi
    1a6a:	eb 1e                	jmp    1a8a <linkunlink+0x6a>
    1a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    1a70:	83 fa 01             	cmp    $0x1,%edx
    1a73:	74 7b                	je     1af0 <linkunlink+0xd0>
      unlink("x");
    1a75:	83 ec 0c             	sub    $0xc,%esp
    1a78:	68 11 46 00 00       	push   $0x4611
    1a7d:	e8 e8 1d 00 00       	call   386a <unlink>
    1a82:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1a85:	83 eb 01             	sub    $0x1,%ebx
    1a88:	74 3d                	je     1ac7 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1a8a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1a90:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1a96:	89 f8                	mov    %edi,%eax
    1a98:	f7 e6                	mul    %esi
    1a9a:	d1 ea                	shr    %edx
    1a9c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1a9f:	89 fa                	mov    %edi,%edx
    1aa1:	29 c2                	sub    %eax,%edx
    1aa3:	75 cb                	jne    1a70 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1aa5:	83 ec 08             	sub    $0x8,%esp
    1aa8:	68 02 02 00 00       	push   $0x202
    1aad:	68 11 46 00 00       	push   $0x4611
    1ab2:	e8 a3 1d 00 00       	call   385a <open>
    1ab7:	89 04 24             	mov    %eax,(%esp)
    1aba:	e8 7b 1d 00 00       	call   383a <close>
    1abf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1ac2:	83 eb 01             	sub    $0x1,%ebx
    1ac5:	75 c3                	jne    1a8a <linkunlink+0x6a>
  if(pid)
    1ac7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1aca:	85 c0                	test   %eax,%eax
    1acc:	74 4f                	je     1b1d <linkunlink+0xfd>
    wait();
    1ace:	e8 37 1d 00 00       	call   380a <wait>
  printf(1, "linkunlink ok\n");
    1ad3:	83 ec 08             	sub    $0x8,%esp
    1ad6:	68 99 43 00 00       	push   $0x4399
    1adb:	6a 01                	push   $0x1
    1add:	e8 7e 1e 00 00       	call   3960 <printf>
}
    1ae2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1ae5:	5b                   	pop    %ebx
    1ae6:	5e                   	pop    %esi
    1ae7:	5f                   	pop    %edi
    1ae8:	5d                   	pop    %ebp
    1ae9:	c3                   	ret    
    1aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("cat", "x");
    1af0:	83 ec 08             	sub    $0x8,%esp
    1af3:	68 11 46 00 00       	push   $0x4611
    1af8:	68 95 43 00 00       	push   $0x4395
    1afd:	e8 78 1d 00 00       	call   387a <link>
    1b02:	83 c4 10             	add    $0x10,%esp
    1b05:	e9 7b ff ff ff       	jmp    1a85 <linkunlink+0x65>
    printf(1, "fork failed\n");
    1b0a:	52                   	push   %edx
    1b0b:	52                   	push   %edx
    1b0c:	68 f9 4b 00 00       	push   $0x4bf9
    1b11:	6a 01                	push   $0x1
    1b13:	e8 48 1e 00 00       	call   3960 <printf>
    exit();
    1b18:	e8 e5 1c 00 00       	call   3802 <exit>
    exit();
    1b1d:	e8 e0 1c 00 00       	call   3802 <exit>
    1b22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001b30 <bigdir>:
{
    1b30:	55                   	push   %ebp
    1b31:	89 e5                	mov    %esp,%ebp
    1b33:	57                   	push   %edi
    1b34:	56                   	push   %esi
    1b35:	53                   	push   %ebx
    1b36:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1b39:	68 a8 43 00 00       	push   $0x43a8
    1b3e:	6a 01                	push   $0x1
    1b40:	e8 1b 1e 00 00       	call   3960 <printf>
  unlink("bd");
    1b45:	c7 04 24 b5 43 00 00 	movl   $0x43b5,(%esp)
    1b4c:	e8 19 1d 00 00       	call   386a <unlink>
  fd = open("bd", O_CREATE);
    1b51:	5a                   	pop    %edx
    1b52:	59                   	pop    %ecx
    1b53:	68 00 02 00 00       	push   $0x200
    1b58:	68 b5 43 00 00       	push   $0x43b5
    1b5d:	e8 f8 1c 00 00       	call   385a <open>
  if(fd < 0){
    1b62:	83 c4 10             	add    $0x10,%esp
    1b65:	85 c0                	test   %eax,%eax
    1b67:	0f 88 de 00 00 00    	js     1c4b <bigdir+0x11b>
  close(fd);
    1b6d:	83 ec 0c             	sub    $0xc,%esp
    1b70:	8d 7d de             	lea    -0x22(%ebp),%edi
  for(i = 0; i < 500; i++){
    1b73:	31 f6                	xor    %esi,%esi
  close(fd);
    1b75:	50                   	push   %eax
    1b76:	e8 bf 1c 00 00       	call   383a <close>
    1b7b:	83 c4 10             	add    $0x10,%esp
    1b7e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + (i / 64);
    1b80:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1b82:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1b85:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1b89:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    1b8c:	57                   	push   %edi
    1b8d:	68 b5 43 00 00       	push   $0x43b5
    name[1] = '0' + (i / 64);
    1b92:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    1b95:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1b99:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1b9c:	89 f0                	mov    %esi,%eax
    1b9e:	83 e0 3f             	and    $0x3f,%eax
    1ba1:	83 c0 30             	add    $0x30,%eax
    1ba4:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1ba7:	e8 ce 1c 00 00       	call   387a <link>
    1bac:	83 c4 10             	add    $0x10,%esp
    1baf:	85 c0                	test   %eax,%eax
    1bb1:	89 c3                	mov    %eax,%ebx
    1bb3:	75 6e                	jne    1c23 <bigdir+0xf3>
  for(i = 0; i < 500; i++){
    1bb5:	83 c6 01             	add    $0x1,%esi
    1bb8:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1bbe:	75 c0                	jne    1b80 <bigdir+0x50>
  unlink("bd");
    1bc0:	83 ec 0c             	sub    $0xc,%esp
    1bc3:	68 b5 43 00 00       	push   $0x43b5
    1bc8:	e8 9d 1c 00 00       	call   386a <unlink>
    1bcd:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    1bd0:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1bd2:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1bd5:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1bd9:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    1bdc:	57                   	push   %edi
    name[3] = '\0';
    1bdd:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1be1:	83 c0 30             	add    $0x30,%eax
    1be4:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1be7:	89 d8                	mov    %ebx,%eax
    1be9:	83 e0 3f             	and    $0x3f,%eax
    1bec:	83 c0 30             	add    $0x30,%eax
    1bef:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1bf2:	e8 73 1c 00 00       	call   386a <unlink>
    1bf7:	83 c4 10             	add    $0x10,%esp
    1bfa:	85 c0                	test   %eax,%eax
    1bfc:	75 39                	jne    1c37 <bigdir+0x107>
  for(i = 0; i < 500; i++){
    1bfe:	83 c3 01             	add    $0x1,%ebx
    1c01:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c07:	75 c7                	jne    1bd0 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    1c09:	83 ec 08             	sub    $0x8,%esp
    1c0c:	68 f7 43 00 00       	push   $0x43f7
    1c11:	6a 01                	push   $0x1
    1c13:	e8 48 1d 00 00       	call   3960 <printf>
}
    1c18:	83 c4 10             	add    $0x10,%esp
    1c1b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1c1e:	5b                   	pop    %ebx
    1c1f:	5e                   	pop    %esi
    1c20:	5f                   	pop    %edi
    1c21:	5d                   	pop    %ebp
    1c22:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1c23:	83 ec 08             	sub    $0x8,%esp
    1c26:	68 ce 43 00 00       	push   $0x43ce
    1c2b:	6a 01                	push   $0x1
    1c2d:	e8 2e 1d 00 00       	call   3960 <printf>
      exit();
    1c32:	e8 cb 1b 00 00       	call   3802 <exit>
      printf(1, "bigdir unlink failed");
    1c37:	83 ec 08             	sub    $0x8,%esp
    1c3a:	68 e2 43 00 00       	push   $0x43e2
    1c3f:	6a 01                	push   $0x1
    1c41:	e8 1a 1d 00 00       	call   3960 <printf>
      exit();
    1c46:	e8 b7 1b 00 00       	call   3802 <exit>
    printf(1, "bigdir create failed\n");
    1c4b:	50                   	push   %eax
    1c4c:	50                   	push   %eax
    1c4d:	68 b8 43 00 00       	push   $0x43b8
    1c52:	6a 01                	push   $0x1
    1c54:	e8 07 1d 00 00       	call   3960 <printf>
    exit();
    1c59:	e8 a4 1b 00 00       	call   3802 <exit>
    1c5e:	66 90                	xchg   %ax,%ax

00001c60 <subdir>:
{
    1c60:	55                   	push   %ebp
    1c61:	89 e5                	mov    %esp,%ebp
    1c63:	53                   	push   %ebx
    1c64:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    1c67:	68 02 44 00 00       	push   $0x4402
    1c6c:	6a 01                	push   $0x1
    1c6e:	e8 ed 1c 00 00       	call   3960 <printf>
  unlink("ff");
    1c73:	c7 04 24 8b 44 00 00 	movl   $0x448b,(%esp)
    1c7a:	e8 eb 1b 00 00       	call   386a <unlink>
  if(mkdir("dd") != 0){
    1c7f:	c7 04 24 28 45 00 00 	movl   $0x4528,(%esp)
    1c86:	e8 f7 1b 00 00       	call   3882 <mkdir>
    1c8b:	83 c4 10             	add    $0x10,%esp
    1c8e:	85 c0                	test   %eax,%eax
    1c90:	0f 85 b3 05 00 00    	jne    2249 <subdir+0x5e9>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1c96:	83 ec 08             	sub    $0x8,%esp
    1c99:	68 02 02 00 00       	push   $0x202
    1c9e:	68 61 44 00 00       	push   $0x4461
    1ca3:	e8 b2 1b 00 00       	call   385a <open>
  if(fd < 0){
    1ca8:	83 c4 10             	add    $0x10,%esp
    1cab:	85 c0                	test   %eax,%eax
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1cad:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1caf:	0f 88 81 05 00 00    	js     2236 <subdir+0x5d6>
  write(fd, "ff", 2);
    1cb5:	83 ec 04             	sub    $0x4,%esp
    1cb8:	6a 02                	push   $0x2
    1cba:	68 8b 44 00 00       	push   $0x448b
    1cbf:	50                   	push   %eax
    1cc0:	e8 6d 1b 00 00       	call   3832 <write>
  close(fd);
    1cc5:	89 1c 24             	mov    %ebx,(%esp)
    1cc8:	e8 6d 1b 00 00       	call   383a <close>
  if(unlink("dd") >= 0){
    1ccd:	c7 04 24 28 45 00 00 	movl   $0x4528,(%esp)
    1cd4:	e8 91 1b 00 00       	call   386a <unlink>
    1cd9:	83 c4 10             	add    $0x10,%esp
    1cdc:	85 c0                	test   %eax,%eax
    1cde:	0f 89 3f 05 00 00    	jns    2223 <subdir+0x5c3>
  if(mkdir("/dd/dd") != 0){
    1ce4:	83 ec 0c             	sub    $0xc,%esp
    1ce7:	68 3c 44 00 00       	push   $0x443c
    1cec:	e8 91 1b 00 00       	call   3882 <mkdir>
    1cf1:	83 c4 10             	add    $0x10,%esp
    1cf4:	85 c0                	test   %eax,%eax
    1cf6:	0f 85 14 05 00 00    	jne    2210 <subdir+0x5b0>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1cfc:	83 ec 08             	sub    $0x8,%esp
    1cff:	68 02 02 00 00       	push   $0x202
    1d04:	68 5e 44 00 00       	push   $0x445e
    1d09:	e8 4c 1b 00 00       	call   385a <open>
  if(fd < 0){
    1d0e:	83 c4 10             	add    $0x10,%esp
    1d11:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1d13:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d15:	0f 88 24 04 00 00    	js     213f <subdir+0x4df>
  write(fd, "FF", 2);
    1d1b:	83 ec 04             	sub    $0x4,%esp
    1d1e:	6a 02                	push   $0x2
    1d20:	68 7f 44 00 00       	push   $0x447f
    1d25:	50                   	push   %eax
    1d26:	e8 07 1b 00 00       	call   3832 <write>
  close(fd);
    1d2b:	89 1c 24             	mov    %ebx,(%esp)
    1d2e:	e8 07 1b 00 00       	call   383a <close>
  fd = open("dd/dd/../ff", 0);
    1d33:	58                   	pop    %eax
    1d34:	5a                   	pop    %edx
    1d35:	6a 00                	push   $0x0
    1d37:	68 82 44 00 00       	push   $0x4482
    1d3c:	e8 19 1b 00 00       	call   385a <open>
  if(fd < 0){
    1d41:	83 c4 10             	add    $0x10,%esp
    1d44:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/../ff", 0);
    1d46:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d48:	0f 88 de 03 00 00    	js     212c <subdir+0x4cc>
  cc = read(fd, buf, sizeof(buf));
    1d4e:	83 ec 04             	sub    $0x4,%esp
    1d51:	68 00 20 00 00       	push   $0x2000
    1d56:	68 60 85 00 00       	push   $0x8560
    1d5b:	50                   	push   %eax
    1d5c:	e8 c9 1a 00 00       	call   382a <read>
  if(cc != 2 || buf[0] != 'f'){
    1d61:	83 c4 10             	add    $0x10,%esp
    1d64:	83 f8 02             	cmp    $0x2,%eax
    1d67:	0f 85 3a 03 00 00    	jne    20a7 <subdir+0x447>
    1d6d:	80 3d 60 85 00 00 66 	cmpb   $0x66,0x8560
    1d74:	0f 85 2d 03 00 00    	jne    20a7 <subdir+0x447>
  close(fd);
    1d7a:	83 ec 0c             	sub    $0xc,%esp
    1d7d:	53                   	push   %ebx
    1d7e:	e8 b7 1a 00 00       	call   383a <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1d83:	5b                   	pop    %ebx
    1d84:	58                   	pop    %eax
    1d85:	68 c2 44 00 00       	push   $0x44c2
    1d8a:	68 5e 44 00 00       	push   $0x445e
    1d8f:	e8 e6 1a 00 00       	call   387a <link>
    1d94:	83 c4 10             	add    $0x10,%esp
    1d97:	85 c0                	test   %eax,%eax
    1d99:	0f 85 c6 03 00 00    	jne    2165 <subdir+0x505>
  if(unlink("dd/dd/ff") != 0){
    1d9f:	83 ec 0c             	sub    $0xc,%esp
    1da2:	68 5e 44 00 00       	push   $0x445e
    1da7:	e8 be 1a 00 00       	call   386a <unlink>
    1dac:	83 c4 10             	add    $0x10,%esp
    1daf:	85 c0                	test   %eax,%eax
    1db1:	0f 85 16 03 00 00    	jne    20cd <subdir+0x46d>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1db7:	83 ec 08             	sub    $0x8,%esp
    1dba:	6a 00                	push   $0x0
    1dbc:	68 5e 44 00 00       	push   $0x445e
    1dc1:	e8 94 1a 00 00       	call   385a <open>
    1dc6:	83 c4 10             	add    $0x10,%esp
    1dc9:	85 c0                	test   %eax,%eax
    1dcb:	0f 89 2c 04 00 00    	jns    21fd <subdir+0x59d>
  if(chdir("dd") != 0){
    1dd1:	83 ec 0c             	sub    $0xc,%esp
    1dd4:	68 28 45 00 00       	push   $0x4528
    1dd9:	e8 ac 1a 00 00       	call   388a <chdir>
    1dde:	83 c4 10             	add    $0x10,%esp
    1de1:	85 c0                	test   %eax,%eax
    1de3:	0f 85 01 04 00 00    	jne    21ea <subdir+0x58a>
  if(chdir("dd/../../dd") != 0){
    1de9:	83 ec 0c             	sub    $0xc,%esp
    1dec:	68 f6 44 00 00       	push   $0x44f6
    1df1:	e8 94 1a 00 00       	call   388a <chdir>
    1df6:	83 c4 10             	add    $0x10,%esp
    1df9:	85 c0                	test   %eax,%eax
    1dfb:	0f 85 b9 02 00 00    	jne    20ba <subdir+0x45a>
  if(chdir("dd/../../../dd") != 0){
    1e01:	83 ec 0c             	sub    $0xc,%esp
    1e04:	68 1c 45 00 00       	push   $0x451c
    1e09:	e8 7c 1a 00 00       	call   388a <chdir>
    1e0e:	83 c4 10             	add    $0x10,%esp
    1e11:	85 c0                	test   %eax,%eax
    1e13:	0f 85 a1 02 00 00    	jne    20ba <subdir+0x45a>
  if(chdir("./..") != 0){
    1e19:	83 ec 0c             	sub    $0xc,%esp
    1e1c:	68 2b 45 00 00       	push   $0x452b
    1e21:	e8 64 1a 00 00       	call   388a <chdir>
    1e26:	83 c4 10             	add    $0x10,%esp
    1e29:	85 c0                	test   %eax,%eax
    1e2b:	0f 85 21 03 00 00    	jne    2152 <subdir+0x4f2>
  fd = open("dd/dd/ffff", 0);
    1e31:	83 ec 08             	sub    $0x8,%esp
    1e34:	6a 00                	push   $0x0
    1e36:	68 c2 44 00 00       	push   $0x44c2
    1e3b:	e8 1a 1a 00 00       	call   385a <open>
  if(fd < 0){
    1e40:	83 c4 10             	add    $0x10,%esp
    1e43:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ffff", 0);
    1e45:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e47:	0f 88 e0 04 00 00    	js     232d <subdir+0x6cd>
  if(read(fd, buf, sizeof(buf)) != 2){
    1e4d:	83 ec 04             	sub    $0x4,%esp
    1e50:	68 00 20 00 00       	push   $0x2000
    1e55:	68 60 85 00 00       	push   $0x8560
    1e5a:	50                   	push   %eax
    1e5b:	e8 ca 19 00 00       	call   382a <read>
    1e60:	83 c4 10             	add    $0x10,%esp
    1e63:	83 f8 02             	cmp    $0x2,%eax
    1e66:	0f 85 ae 04 00 00    	jne    231a <subdir+0x6ba>
  close(fd);
    1e6c:	83 ec 0c             	sub    $0xc,%esp
    1e6f:	53                   	push   %ebx
    1e70:	e8 c5 19 00 00       	call   383a <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e75:	59                   	pop    %ecx
    1e76:	5b                   	pop    %ebx
    1e77:	6a 00                	push   $0x0
    1e79:	68 5e 44 00 00       	push   $0x445e
    1e7e:	e8 d7 19 00 00       	call   385a <open>
    1e83:	83 c4 10             	add    $0x10,%esp
    1e86:	85 c0                	test   %eax,%eax
    1e88:	0f 89 65 02 00 00    	jns    20f3 <subdir+0x493>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1e8e:	83 ec 08             	sub    $0x8,%esp
    1e91:	68 02 02 00 00       	push   $0x202
    1e96:	68 76 45 00 00       	push   $0x4576
    1e9b:	e8 ba 19 00 00       	call   385a <open>
    1ea0:	83 c4 10             	add    $0x10,%esp
    1ea3:	85 c0                	test   %eax,%eax
    1ea5:	0f 89 35 02 00 00    	jns    20e0 <subdir+0x480>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1eab:	83 ec 08             	sub    $0x8,%esp
    1eae:	68 02 02 00 00       	push   $0x202
    1eb3:	68 9b 45 00 00       	push   $0x459b
    1eb8:	e8 9d 19 00 00       	call   385a <open>
    1ebd:	83 c4 10             	add    $0x10,%esp
    1ec0:	85 c0                	test   %eax,%eax
    1ec2:	0f 89 0f 03 00 00    	jns    21d7 <subdir+0x577>
  if(open("dd", O_CREATE) >= 0){
    1ec8:	83 ec 08             	sub    $0x8,%esp
    1ecb:	68 00 02 00 00       	push   $0x200
    1ed0:	68 28 45 00 00       	push   $0x4528
    1ed5:	e8 80 19 00 00       	call   385a <open>
    1eda:	83 c4 10             	add    $0x10,%esp
    1edd:	85 c0                	test   %eax,%eax
    1edf:	0f 89 df 02 00 00    	jns    21c4 <subdir+0x564>
  if(open("dd", O_RDWR) >= 0){
    1ee5:	83 ec 08             	sub    $0x8,%esp
    1ee8:	6a 02                	push   $0x2
    1eea:	68 28 45 00 00       	push   $0x4528
    1eef:	e8 66 19 00 00       	call   385a <open>
    1ef4:	83 c4 10             	add    $0x10,%esp
    1ef7:	85 c0                	test   %eax,%eax
    1ef9:	0f 89 b2 02 00 00    	jns    21b1 <subdir+0x551>
  if(open("dd", O_WRONLY) >= 0){
    1eff:	83 ec 08             	sub    $0x8,%esp
    1f02:	6a 01                	push   $0x1
    1f04:	68 28 45 00 00       	push   $0x4528
    1f09:	e8 4c 19 00 00       	call   385a <open>
    1f0e:	83 c4 10             	add    $0x10,%esp
    1f11:	85 c0                	test   %eax,%eax
    1f13:	0f 89 85 02 00 00    	jns    219e <subdir+0x53e>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1f19:	83 ec 08             	sub    $0x8,%esp
    1f1c:	68 0a 46 00 00       	push   $0x460a
    1f21:	68 76 45 00 00       	push   $0x4576
    1f26:	e8 4f 19 00 00       	call   387a <link>
    1f2b:	83 c4 10             	add    $0x10,%esp
    1f2e:	85 c0                	test   %eax,%eax
    1f30:	0f 84 55 02 00 00    	je     218b <subdir+0x52b>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1f36:	83 ec 08             	sub    $0x8,%esp
    1f39:	68 0a 46 00 00       	push   $0x460a
    1f3e:	68 9b 45 00 00       	push   $0x459b
    1f43:	e8 32 19 00 00       	call   387a <link>
    1f48:	83 c4 10             	add    $0x10,%esp
    1f4b:	85 c0                	test   %eax,%eax
    1f4d:	0f 84 25 02 00 00    	je     2178 <subdir+0x518>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1f53:	83 ec 08             	sub    $0x8,%esp
    1f56:	68 c2 44 00 00       	push   $0x44c2
    1f5b:	68 61 44 00 00       	push   $0x4461
    1f60:	e8 15 19 00 00       	call   387a <link>
    1f65:	83 c4 10             	add    $0x10,%esp
    1f68:	85 c0                	test   %eax,%eax
    1f6a:	0f 84 a9 01 00 00    	je     2119 <subdir+0x4b9>
  if(mkdir("dd/ff/ff") == 0){
    1f70:	83 ec 0c             	sub    $0xc,%esp
    1f73:	68 76 45 00 00       	push   $0x4576
    1f78:	e8 05 19 00 00       	call   3882 <mkdir>
    1f7d:	83 c4 10             	add    $0x10,%esp
    1f80:	85 c0                	test   %eax,%eax
    1f82:	0f 84 7e 01 00 00    	je     2106 <subdir+0x4a6>
  if(mkdir("dd/xx/ff") == 0){
    1f88:	83 ec 0c             	sub    $0xc,%esp
    1f8b:	68 9b 45 00 00       	push   $0x459b
    1f90:	e8 ed 18 00 00       	call   3882 <mkdir>
    1f95:	83 c4 10             	add    $0x10,%esp
    1f98:	85 c0                	test   %eax,%eax
    1f9a:	0f 84 67 03 00 00    	je     2307 <subdir+0x6a7>
  if(mkdir("dd/dd/ffff") == 0){
    1fa0:	83 ec 0c             	sub    $0xc,%esp
    1fa3:	68 c2 44 00 00       	push   $0x44c2
    1fa8:	e8 d5 18 00 00       	call   3882 <mkdir>
    1fad:	83 c4 10             	add    $0x10,%esp
    1fb0:	85 c0                	test   %eax,%eax
    1fb2:	0f 84 3c 03 00 00    	je     22f4 <subdir+0x694>
  if(unlink("dd/xx/ff") == 0){
    1fb8:	83 ec 0c             	sub    $0xc,%esp
    1fbb:	68 9b 45 00 00       	push   $0x459b
    1fc0:	e8 a5 18 00 00       	call   386a <unlink>
    1fc5:	83 c4 10             	add    $0x10,%esp
    1fc8:	85 c0                	test   %eax,%eax
    1fca:	0f 84 11 03 00 00    	je     22e1 <subdir+0x681>
  if(unlink("dd/ff/ff") == 0){
    1fd0:	83 ec 0c             	sub    $0xc,%esp
    1fd3:	68 76 45 00 00       	push   $0x4576
    1fd8:	e8 8d 18 00 00       	call   386a <unlink>
    1fdd:	83 c4 10             	add    $0x10,%esp
    1fe0:	85 c0                	test   %eax,%eax
    1fe2:	0f 84 e6 02 00 00    	je     22ce <subdir+0x66e>
  if(chdir("dd/ff") == 0){
    1fe8:	83 ec 0c             	sub    $0xc,%esp
    1feb:	68 61 44 00 00       	push   $0x4461
    1ff0:	e8 95 18 00 00       	call   388a <chdir>
    1ff5:	83 c4 10             	add    $0x10,%esp
    1ff8:	85 c0                	test   %eax,%eax
    1ffa:	0f 84 bb 02 00 00    	je     22bb <subdir+0x65b>
  if(chdir("dd/xx") == 0){
    2000:	83 ec 0c             	sub    $0xc,%esp
    2003:	68 0d 46 00 00       	push   $0x460d
    2008:	e8 7d 18 00 00       	call   388a <chdir>
    200d:	83 c4 10             	add    $0x10,%esp
    2010:	85 c0                	test   %eax,%eax
    2012:	0f 84 90 02 00 00    	je     22a8 <subdir+0x648>
  if(unlink("dd/dd/ffff") != 0){
    2018:	83 ec 0c             	sub    $0xc,%esp
    201b:	68 c2 44 00 00       	push   $0x44c2
    2020:	e8 45 18 00 00       	call   386a <unlink>
    2025:	83 c4 10             	add    $0x10,%esp
    2028:	85 c0                	test   %eax,%eax
    202a:	0f 85 9d 00 00 00    	jne    20cd <subdir+0x46d>
  if(unlink("dd/ff") != 0){
    2030:	83 ec 0c             	sub    $0xc,%esp
    2033:	68 61 44 00 00       	push   $0x4461
    2038:	e8 2d 18 00 00       	call   386a <unlink>
    203d:	83 c4 10             	add    $0x10,%esp
    2040:	85 c0                	test   %eax,%eax
    2042:	0f 85 4d 02 00 00    	jne    2295 <subdir+0x635>
  if(unlink("dd") == 0){
    2048:	83 ec 0c             	sub    $0xc,%esp
    204b:	68 28 45 00 00       	push   $0x4528
    2050:	e8 15 18 00 00       	call   386a <unlink>
    2055:	83 c4 10             	add    $0x10,%esp
    2058:	85 c0                	test   %eax,%eax
    205a:	0f 84 22 02 00 00    	je     2282 <subdir+0x622>
  if(unlink("dd/dd") < 0){
    2060:	83 ec 0c             	sub    $0xc,%esp
    2063:	68 3d 44 00 00       	push   $0x443d
    2068:	e8 fd 17 00 00       	call   386a <unlink>
    206d:	83 c4 10             	add    $0x10,%esp
    2070:	85 c0                	test   %eax,%eax
    2072:	0f 88 f7 01 00 00    	js     226f <subdir+0x60f>
  if(unlink("dd") < 0){
    2078:	83 ec 0c             	sub    $0xc,%esp
    207b:	68 28 45 00 00       	push   $0x4528
    2080:	e8 e5 17 00 00       	call   386a <unlink>
    2085:	83 c4 10             	add    $0x10,%esp
    2088:	85 c0                	test   %eax,%eax
    208a:	0f 88 cc 01 00 00    	js     225c <subdir+0x5fc>
  printf(1, "subdir ok\n");
    2090:	83 ec 08             	sub    $0x8,%esp
    2093:	68 0a 47 00 00       	push   $0x470a
    2098:	6a 01                	push   $0x1
    209a:	e8 c1 18 00 00       	call   3960 <printf>
}
    209f:	83 c4 10             	add    $0x10,%esp
    20a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    20a5:	c9                   	leave  
    20a6:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    20a7:	50                   	push   %eax
    20a8:	50                   	push   %eax
    20a9:	68 a7 44 00 00       	push   $0x44a7
    20ae:	6a 01                	push   $0x1
    20b0:	e8 ab 18 00 00       	call   3960 <printf>
    exit();
    20b5:	e8 48 17 00 00       	call   3802 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    20ba:	50                   	push   %eax
    20bb:	50                   	push   %eax
    20bc:	68 02 45 00 00       	push   $0x4502
    20c1:	6a 01                	push   $0x1
    20c3:	e8 98 18 00 00       	call   3960 <printf>
    exit();
    20c8:	e8 35 17 00 00       	call   3802 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    20cd:	52                   	push   %edx
    20ce:	52                   	push   %edx
    20cf:	68 cd 44 00 00       	push   $0x44cd
    20d4:	6a 01                	push   $0x1
    20d6:	e8 85 18 00 00       	call   3960 <printf>
    exit();
    20db:	e8 22 17 00 00       	call   3802 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    20e0:	50                   	push   %eax
    20e1:	50                   	push   %eax
    20e2:	68 7f 45 00 00       	push   $0x457f
    20e7:	6a 01                	push   $0x1
    20e9:	e8 72 18 00 00       	call   3960 <printf>
    exit();
    20ee:	e8 0f 17 00 00       	call   3802 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    20f3:	52                   	push   %edx
    20f4:	52                   	push   %edx
    20f5:	68 70 4f 00 00       	push   $0x4f70
    20fa:	6a 01                	push   $0x1
    20fc:	e8 5f 18 00 00       	call   3960 <printf>
    exit();
    2101:	e8 fc 16 00 00       	call   3802 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2106:	52                   	push   %edx
    2107:	52                   	push   %edx
    2108:	68 13 46 00 00       	push   $0x4613
    210d:	6a 01                	push   $0x1
    210f:	e8 4c 18 00 00       	call   3960 <printf>
    exit();
    2114:	e8 e9 16 00 00       	call   3802 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2119:	51                   	push   %ecx
    211a:	51                   	push   %ecx
    211b:	68 e0 4f 00 00       	push   $0x4fe0
    2120:	6a 01                	push   $0x1
    2122:	e8 39 18 00 00       	call   3960 <printf>
    exit();
    2127:	e8 d6 16 00 00       	call   3802 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    212c:	50                   	push   %eax
    212d:	50                   	push   %eax
    212e:	68 8e 44 00 00       	push   $0x448e
    2133:	6a 01                	push   $0x1
    2135:	e8 26 18 00 00       	call   3960 <printf>
    exit();
    213a:	e8 c3 16 00 00       	call   3802 <exit>
    printf(1, "create dd/dd/ff failed\n");
    213f:	51                   	push   %ecx
    2140:	51                   	push   %ecx
    2141:	68 67 44 00 00       	push   $0x4467
    2146:	6a 01                	push   $0x1
    2148:	e8 13 18 00 00       	call   3960 <printf>
    exit();
    214d:	e8 b0 16 00 00       	call   3802 <exit>
    printf(1, "chdir ./.. failed\n");
    2152:	50                   	push   %eax
    2153:	50                   	push   %eax
    2154:	68 30 45 00 00       	push   $0x4530
    2159:	6a 01                	push   $0x1
    215b:	e8 00 18 00 00       	call   3960 <printf>
    exit();
    2160:	e8 9d 16 00 00       	call   3802 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2165:	51                   	push   %ecx
    2166:	51                   	push   %ecx
    2167:	68 28 4f 00 00       	push   $0x4f28
    216c:	6a 01                	push   $0x1
    216e:	e8 ed 17 00 00       	call   3960 <printf>
    exit();
    2173:	e8 8a 16 00 00       	call   3802 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2178:	53                   	push   %ebx
    2179:	53                   	push   %ebx
    217a:	68 bc 4f 00 00       	push   $0x4fbc
    217f:	6a 01                	push   $0x1
    2181:	e8 da 17 00 00       	call   3960 <printf>
    exit();
    2186:	e8 77 16 00 00       	call   3802 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    218b:	50                   	push   %eax
    218c:	50                   	push   %eax
    218d:	68 98 4f 00 00       	push   $0x4f98
    2192:	6a 01                	push   $0x1
    2194:	e8 c7 17 00 00       	call   3960 <printf>
    exit();
    2199:	e8 64 16 00 00       	call   3802 <exit>
    printf(1, "open dd wronly succeeded!\n");
    219e:	50                   	push   %eax
    219f:	50                   	push   %eax
    21a0:	68 ef 45 00 00       	push   $0x45ef
    21a5:	6a 01                	push   $0x1
    21a7:	e8 b4 17 00 00       	call   3960 <printf>
    exit();
    21ac:	e8 51 16 00 00       	call   3802 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    21b1:	50                   	push   %eax
    21b2:	50                   	push   %eax
    21b3:	68 d6 45 00 00       	push   $0x45d6
    21b8:	6a 01                	push   $0x1
    21ba:	e8 a1 17 00 00       	call   3960 <printf>
    exit();
    21bf:	e8 3e 16 00 00       	call   3802 <exit>
    printf(1, "create dd succeeded!\n");
    21c4:	50                   	push   %eax
    21c5:	50                   	push   %eax
    21c6:	68 c0 45 00 00       	push   $0x45c0
    21cb:	6a 01                	push   $0x1
    21cd:	e8 8e 17 00 00       	call   3960 <printf>
    exit();
    21d2:	e8 2b 16 00 00       	call   3802 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    21d7:	50                   	push   %eax
    21d8:	50                   	push   %eax
    21d9:	68 a4 45 00 00       	push   $0x45a4
    21de:	6a 01                	push   $0x1
    21e0:	e8 7b 17 00 00       	call   3960 <printf>
    exit();
    21e5:	e8 18 16 00 00       	call   3802 <exit>
    printf(1, "chdir dd failed\n");
    21ea:	50                   	push   %eax
    21eb:	50                   	push   %eax
    21ec:	68 e5 44 00 00       	push   $0x44e5
    21f1:	6a 01                	push   $0x1
    21f3:	e8 68 17 00 00       	call   3960 <printf>
    exit();
    21f8:	e8 05 16 00 00       	call   3802 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    21fd:	50                   	push   %eax
    21fe:	50                   	push   %eax
    21ff:	68 4c 4f 00 00       	push   $0x4f4c
    2204:	6a 01                	push   $0x1
    2206:	e8 55 17 00 00       	call   3960 <printf>
    exit();
    220b:	e8 f2 15 00 00       	call   3802 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    2210:	53                   	push   %ebx
    2211:	53                   	push   %ebx
    2212:	68 43 44 00 00       	push   $0x4443
    2217:	6a 01                	push   $0x1
    2219:	e8 42 17 00 00       	call   3960 <printf>
    exit();
    221e:	e8 df 15 00 00       	call   3802 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2223:	50                   	push   %eax
    2224:	50                   	push   %eax
    2225:	68 00 4f 00 00       	push   $0x4f00
    222a:	6a 01                	push   $0x1
    222c:	e8 2f 17 00 00       	call   3960 <printf>
    exit();
    2231:	e8 cc 15 00 00       	call   3802 <exit>
    printf(1, "create dd/ff failed\n");
    2236:	50                   	push   %eax
    2237:	50                   	push   %eax
    2238:	68 27 44 00 00       	push   $0x4427
    223d:	6a 01                	push   $0x1
    223f:	e8 1c 17 00 00       	call   3960 <printf>
    exit();
    2244:	e8 b9 15 00 00       	call   3802 <exit>
    printf(1, "subdir mkdir dd failed\n");
    2249:	50                   	push   %eax
    224a:	50                   	push   %eax
    224b:	68 0f 44 00 00       	push   $0x440f
    2250:	6a 01                	push   $0x1
    2252:	e8 09 17 00 00       	call   3960 <printf>
    exit();
    2257:	e8 a6 15 00 00       	call   3802 <exit>
    printf(1, "unlink dd failed\n");
    225c:	50                   	push   %eax
    225d:	50                   	push   %eax
    225e:	68 f8 46 00 00       	push   $0x46f8
    2263:	6a 01                	push   $0x1
    2265:	e8 f6 16 00 00       	call   3960 <printf>
    exit();
    226a:	e8 93 15 00 00       	call   3802 <exit>
    printf(1, "unlink dd/dd failed\n");
    226f:	52                   	push   %edx
    2270:	52                   	push   %edx
    2271:	68 e3 46 00 00       	push   $0x46e3
    2276:	6a 01                	push   $0x1
    2278:	e8 e3 16 00 00       	call   3960 <printf>
    exit();
    227d:	e8 80 15 00 00       	call   3802 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    2282:	51                   	push   %ecx
    2283:	51                   	push   %ecx
    2284:	68 04 50 00 00       	push   $0x5004
    2289:	6a 01                	push   $0x1
    228b:	e8 d0 16 00 00       	call   3960 <printf>
    exit();
    2290:	e8 6d 15 00 00       	call   3802 <exit>
    printf(1, "unlink dd/ff failed\n");
    2295:	53                   	push   %ebx
    2296:	53                   	push   %ebx
    2297:	68 ce 46 00 00       	push   $0x46ce
    229c:	6a 01                	push   $0x1
    229e:	e8 bd 16 00 00       	call   3960 <printf>
    exit();
    22a3:	e8 5a 15 00 00       	call   3802 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    22a8:	50                   	push   %eax
    22a9:	50                   	push   %eax
    22aa:	68 b6 46 00 00       	push   $0x46b6
    22af:	6a 01                	push   $0x1
    22b1:	e8 aa 16 00 00       	call   3960 <printf>
    exit();
    22b6:	e8 47 15 00 00       	call   3802 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    22bb:	50                   	push   %eax
    22bc:	50                   	push   %eax
    22bd:	68 9e 46 00 00       	push   $0x469e
    22c2:	6a 01                	push   $0x1
    22c4:	e8 97 16 00 00       	call   3960 <printf>
    exit();
    22c9:	e8 34 15 00 00       	call   3802 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    22ce:	50                   	push   %eax
    22cf:	50                   	push   %eax
    22d0:	68 82 46 00 00       	push   $0x4682
    22d5:	6a 01                	push   $0x1
    22d7:	e8 84 16 00 00       	call   3960 <printf>
    exit();
    22dc:	e8 21 15 00 00       	call   3802 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    22e1:	50                   	push   %eax
    22e2:	50                   	push   %eax
    22e3:	68 66 46 00 00       	push   $0x4666
    22e8:	6a 01                	push   $0x1
    22ea:	e8 71 16 00 00       	call   3960 <printf>
    exit();
    22ef:	e8 0e 15 00 00       	call   3802 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    22f4:	50                   	push   %eax
    22f5:	50                   	push   %eax
    22f6:	68 49 46 00 00       	push   $0x4649
    22fb:	6a 01                	push   $0x1
    22fd:	e8 5e 16 00 00       	call   3960 <printf>
    exit();
    2302:	e8 fb 14 00 00       	call   3802 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2307:	50                   	push   %eax
    2308:	50                   	push   %eax
    2309:	68 2e 46 00 00       	push   $0x462e
    230e:	6a 01                	push   $0x1
    2310:	e8 4b 16 00 00       	call   3960 <printf>
    exit();
    2315:	e8 e8 14 00 00       	call   3802 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    231a:	50                   	push   %eax
    231b:	50                   	push   %eax
    231c:	68 5b 45 00 00       	push   $0x455b
    2321:	6a 01                	push   $0x1
    2323:	e8 38 16 00 00       	call   3960 <printf>
    exit();
    2328:	e8 d5 14 00 00       	call   3802 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    232d:	50                   	push   %eax
    232e:	50                   	push   %eax
    232f:	68 43 45 00 00       	push   $0x4543
    2334:	6a 01                	push   $0x1
    2336:	e8 25 16 00 00       	call   3960 <printf>
    exit();
    233b:	e8 c2 14 00 00       	call   3802 <exit>

00002340 <bigwrite>:
{
    2340:	55                   	push   %ebp
    2341:	89 e5                	mov    %esp,%ebp
    2343:	56                   	push   %esi
    2344:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    2345:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf(1, "bigwrite test\n");
    234a:	83 ec 08             	sub    $0x8,%esp
    234d:	68 15 47 00 00       	push   $0x4715
    2352:	6a 01                	push   $0x1
    2354:	e8 07 16 00 00       	call   3960 <printf>
  unlink("bigwrite");
    2359:	c7 04 24 24 47 00 00 	movl   $0x4724,(%esp)
    2360:	e8 05 15 00 00       	call   386a <unlink>
    2365:	83 c4 10             	add    $0x10,%esp
    2368:	90                   	nop
    2369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2370:	83 ec 08             	sub    $0x8,%esp
    2373:	68 02 02 00 00       	push   $0x202
    2378:	68 24 47 00 00       	push   $0x4724
    237d:	e8 d8 14 00 00       	call   385a <open>
    if(fd < 0){
    2382:	83 c4 10             	add    $0x10,%esp
    2385:	85 c0                	test   %eax,%eax
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2387:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2389:	78 7e                	js     2409 <bigwrite+0xc9>
      int cc = write(fd, buf, sz);
    238b:	83 ec 04             	sub    $0x4,%esp
    238e:	53                   	push   %ebx
    238f:	68 60 85 00 00       	push   $0x8560
    2394:	50                   	push   %eax
    2395:	e8 98 14 00 00       	call   3832 <write>
      if(cc != sz){
    239a:	83 c4 10             	add    $0x10,%esp
    239d:	39 d8                	cmp    %ebx,%eax
    239f:	75 55                	jne    23f6 <bigwrite+0xb6>
      int cc = write(fd, buf, sz);
    23a1:	83 ec 04             	sub    $0x4,%esp
    23a4:	53                   	push   %ebx
    23a5:	68 60 85 00 00       	push   $0x8560
    23aa:	56                   	push   %esi
    23ab:	e8 82 14 00 00       	call   3832 <write>
      if(cc != sz){
    23b0:	83 c4 10             	add    $0x10,%esp
    23b3:	39 d8                	cmp    %ebx,%eax
    23b5:	75 3f                	jne    23f6 <bigwrite+0xb6>
    close(fd);
    23b7:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    23ba:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    23c0:	56                   	push   %esi
    23c1:	e8 74 14 00 00       	call   383a <close>
    unlink("bigwrite");
    23c6:	c7 04 24 24 47 00 00 	movl   $0x4724,(%esp)
    23cd:	e8 98 14 00 00       	call   386a <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    23d2:	83 c4 10             	add    $0x10,%esp
    23d5:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    23db:	75 93                	jne    2370 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    23dd:	83 ec 08             	sub    $0x8,%esp
    23e0:	68 57 47 00 00       	push   $0x4757
    23e5:	6a 01                	push   $0x1
    23e7:	e8 74 15 00 00       	call   3960 <printf>
}
    23ec:	83 c4 10             	add    $0x10,%esp
    23ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
    23f2:	5b                   	pop    %ebx
    23f3:	5e                   	pop    %esi
    23f4:	5d                   	pop    %ebp
    23f5:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    23f6:	50                   	push   %eax
    23f7:	53                   	push   %ebx
    23f8:	68 45 47 00 00       	push   $0x4745
    23fd:	6a 01                	push   $0x1
    23ff:	e8 5c 15 00 00       	call   3960 <printf>
        exit();
    2404:	e8 f9 13 00 00       	call   3802 <exit>
      printf(1, "cannot create bigwrite\n");
    2409:	83 ec 08             	sub    $0x8,%esp
    240c:	68 2d 47 00 00       	push   $0x472d
    2411:	6a 01                	push   $0x1
    2413:	e8 48 15 00 00       	call   3960 <printf>
      exit();
    2418:	e8 e5 13 00 00       	call   3802 <exit>
    241d:	8d 76 00             	lea    0x0(%esi),%esi

00002420 <bigfile>:
{
    2420:	55                   	push   %ebp
    2421:	89 e5                	mov    %esp,%ebp
    2423:	57                   	push   %edi
    2424:	56                   	push   %esi
    2425:	53                   	push   %ebx
    2426:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    2429:	68 64 47 00 00       	push   $0x4764
    242e:	6a 01                	push   $0x1
    2430:	e8 2b 15 00 00       	call   3960 <printf>
  unlink("bigfile");
    2435:	c7 04 24 80 47 00 00 	movl   $0x4780,(%esp)
    243c:	e8 29 14 00 00       	call   386a <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2441:	58                   	pop    %eax
    2442:	5a                   	pop    %edx
    2443:	68 02 02 00 00       	push   $0x202
    2448:	68 80 47 00 00       	push   $0x4780
    244d:	e8 08 14 00 00       	call   385a <open>
  if(fd < 0){
    2452:	83 c4 10             	add    $0x10,%esp
    2455:	85 c0                	test   %eax,%eax
    2457:	0f 88 5e 01 00 00    	js     25bb <bigfile+0x19b>
    245d:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    245f:	31 db                	xor    %ebx,%ebx
    2461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    2468:	83 ec 04             	sub    $0x4,%esp
    246b:	68 58 02 00 00       	push   $0x258
    2470:	53                   	push   %ebx
    2471:	68 60 85 00 00       	push   $0x8560
    2476:	e8 e5 11 00 00       	call   3660 <memset>
    if(write(fd, buf, 600) != 600){
    247b:	83 c4 0c             	add    $0xc,%esp
    247e:	68 58 02 00 00       	push   $0x258
    2483:	68 60 85 00 00       	push   $0x8560
    2488:	56                   	push   %esi
    2489:	e8 a4 13 00 00       	call   3832 <write>
    248e:	83 c4 10             	add    $0x10,%esp
    2491:	3d 58 02 00 00       	cmp    $0x258,%eax
    2496:	0f 85 f8 00 00 00    	jne    2594 <bigfile+0x174>
  for(i = 0; i < 20; i++){
    249c:	83 c3 01             	add    $0x1,%ebx
    249f:	83 fb 14             	cmp    $0x14,%ebx
    24a2:	75 c4                	jne    2468 <bigfile+0x48>
  close(fd);
    24a4:	83 ec 0c             	sub    $0xc,%esp
    24a7:	56                   	push   %esi
    24a8:	e8 8d 13 00 00       	call   383a <close>
  fd = open("bigfile", 0);
    24ad:	5e                   	pop    %esi
    24ae:	5f                   	pop    %edi
    24af:	6a 00                	push   $0x0
    24b1:	68 80 47 00 00       	push   $0x4780
    24b6:	e8 9f 13 00 00       	call   385a <open>
  if(fd < 0){
    24bb:	83 c4 10             	add    $0x10,%esp
    24be:	85 c0                	test   %eax,%eax
  fd = open("bigfile", 0);
    24c0:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    24c2:	0f 88 e0 00 00 00    	js     25a8 <bigfile+0x188>
  total = 0;
    24c8:	31 db                	xor    %ebx,%ebx
  for(i = 0; ; i++){
    24ca:	31 ff                	xor    %edi,%edi
    24cc:	eb 30                	jmp    24fe <bigfile+0xde>
    24ce:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    24d0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    24d5:	0f 85 91 00 00 00    	jne    256c <bigfile+0x14c>
    if(buf[0] != i/2 || buf[299] != i/2){
    24db:	0f be 05 60 85 00 00 	movsbl 0x8560,%eax
    24e2:	89 fa                	mov    %edi,%edx
    24e4:	d1 fa                	sar    %edx
    24e6:	39 d0                	cmp    %edx,%eax
    24e8:	75 6e                	jne    2558 <bigfile+0x138>
    24ea:	0f be 15 8b 86 00 00 	movsbl 0x868b,%edx
    24f1:	39 d0                	cmp    %edx,%eax
    24f3:	75 63                	jne    2558 <bigfile+0x138>
    total += cc;
    24f5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    24fb:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    24fe:	83 ec 04             	sub    $0x4,%esp
    2501:	68 2c 01 00 00       	push   $0x12c
    2506:	68 60 85 00 00       	push   $0x8560
    250b:	56                   	push   %esi
    250c:	e8 19 13 00 00       	call   382a <read>
    if(cc < 0){
    2511:	83 c4 10             	add    $0x10,%esp
    2514:	85 c0                	test   %eax,%eax
    2516:	78 68                	js     2580 <bigfile+0x160>
    if(cc == 0)
    2518:	75 b6                	jne    24d0 <bigfile+0xb0>
  close(fd);
    251a:	83 ec 0c             	sub    $0xc,%esp
    251d:	56                   	push   %esi
    251e:	e8 17 13 00 00       	call   383a <close>
  if(total != 20*600){
    2523:	83 c4 10             	add    $0x10,%esp
    2526:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    252c:	0f 85 9c 00 00 00    	jne    25ce <bigfile+0x1ae>
  unlink("bigfile");
    2532:	83 ec 0c             	sub    $0xc,%esp
    2535:	68 80 47 00 00       	push   $0x4780
    253a:	e8 2b 13 00 00       	call   386a <unlink>
  printf(1, "bigfile test ok\n");
    253f:	58                   	pop    %eax
    2540:	5a                   	pop    %edx
    2541:	68 0f 48 00 00       	push   $0x480f
    2546:	6a 01                	push   $0x1
    2548:	e8 13 14 00 00       	call   3960 <printf>
}
    254d:	83 c4 10             	add    $0x10,%esp
    2550:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2553:	5b                   	pop    %ebx
    2554:	5e                   	pop    %esi
    2555:	5f                   	pop    %edi
    2556:	5d                   	pop    %ebp
    2557:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    2558:	83 ec 08             	sub    $0x8,%esp
    255b:	68 dc 47 00 00       	push   $0x47dc
    2560:	6a 01                	push   $0x1
    2562:	e8 f9 13 00 00       	call   3960 <printf>
      exit();
    2567:	e8 96 12 00 00       	call   3802 <exit>
      printf(1, "short read bigfile\n");
    256c:	83 ec 08             	sub    $0x8,%esp
    256f:	68 c8 47 00 00       	push   $0x47c8
    2574:	6a 01                	push   $0x1
    2576:	e8 e5 13 00 00       	call   3960 <printf>
      exit();
    257b:	e8 82 12 00 00       	call   3802 <exit>
      printf(1, "read bigfile failed\n");
    2580:	83 ec 08             	sub    $0x8,%esp
    2583:	68 b3 47 00 00       	push   $0x47b3
    2588:	6a 01                	push   $0x1
    258a:	e8 d1 13 00 00       	call   3960 <printf>
      exit();
    258f:	e8 6e 12 00 00       	call   3802 <exit>
      printf(1, "write bigfile failed\n");
    2594:	83 ec 08             	sub    $0x8,%esp
    2597:	68 88 47 00 00       	push   $0x4788
    259c:	6a 01                	push   $0x1
    259e:	e8 bd 13 00 00       	call   3960 <printf>
      exit();
    25a3:	e8 5a 12 00 00       	call   3802 <exit>
    printf(1, "cannot open bigfile\n");
    25a8:	53                   	push   %ebx
    25a9:	53                   	push   %ebx
    25aa:	68 9e 47 00 00       	push   $0x479e
    25af:	6a 01                	push   $0x1
    25b1:	e8 aa 13 00 00       	call   3960 <printf>
    exit();
    25b6:	e8 47 12 00 00       	call   3802 <exit>
    printf(1, "cannot create bigfile");
    25bb:	50                   	push   %eax
    25bc:	50                   	push   %eax
    25bd:	68 72 47 00 00       	push   $0x4772
    25c2:	6a 01                	push   $0x1
    25c4:	e8 97 13 00 00       	call   3960 <printf>
    exit();
    25c9:	e8 34 12 00 00       	call   3802 <exit>
    printf(1, "read bigfile wrong total\n");
    25ce:	51                   	push   %ecx
    25cf:	51                   	push   %ecx
    25d0:	68 f5 47 00 00       	push   $0x47f5
    25d5:	6a 01                	push   $0x1
    25d7:	e8 84 13 00 00       	call   3960 <printf>
    exit();
    25dc:	e8 21 12 00 00       	call   3802 <exit>
    25e1:	eb 0d                	jmp    25f0 <fourteen>
    25e3:	90                   	nop
    25e4:	90                   	nop
    25e5:	90                   	nop
    25e6:	90                   	nop
    25e7:	90                   	nop
    25e8:	90                   	nop
    25e9:	90                   	nop
    25ea:	90                   	nop
    25eb:	90                   	nop
    25ec:	90                   	nop
    25ed:	90                   	nop
    25ee:	90                   	nop
    25ef:	90                   	nop

000025f0 <fourteen>:
{
    25f0:	55                   	push   %ebp
    25f1:	89 e5                	mov    %esp,%ebp
    25f3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    25f6:	68 20 48 00 00       	push   $0x4820
    25fb:	6a 01                	push   $0x1
    25fd:	e8 5e 13 00 00       	call   3960 <printf>
  if(mkdir("12345678901234") != 0){
    2602:	c7 04 24 5b 48 00 00 	movl   $0x485b,(%esp)
    2609:	e8 74 12 00 00       	call   3882 <mkdir>
    260e:	83 c4 10             	add    $0x10,%esp
    2611:	85 c0                	test   %eax,%eax
    2613:	0f 85 97 00 00 00    	jne    26b0 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    2619:	83 ec 0c             	sub    $0xc,%esp
    261c:	68 24 50 00 00       	push   $0x5024
    2621:	e8 5c 12 00 00       	call   3882 <mkdir>
    2626:	83 c4 10             	add    $0x10,%esp
    2629:	85 c0                	test   %eax,%eax
    262b:	0f 85 de 00 00 00    	jne    270f <fourteen+0x11f>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2631:	83 ec 08             	sub    $0x8,%esp
    2634:	68 00 02 00 00       	push   $0x200
    2639:	68 74 50 00 00       	push   $0x5074
    263e:	e8 17 12 00 00       	call   385a <open>
  if(fd < 0){
    2643:	83 c4 10             	add    $0x10,%esp
    2646:	85 c0                	test   %eax,%eax
    2648:	0f 88 ae 00 00 00    	js     26fc <fourteen+0x10c>
  close(fd);
    264e:	83 ec 0c             	sub    $0xc,%esp
    2651:	50                   	push   %eax
    2652:	e8 e3 11 00 00       	call   383a <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2657:	58                   	pop    %eax
    2658:	5a                   	pop    %edx
    2659:	6a 00                	push   $0x0
    265b:	68 e4 50 00 00       	push   $0x50e4
    2660:	e8 f5 11 00 00       	call   385a <open>
  if(fd < 0){
    2665:	83 c4 10             	add    $0x10,%esp
    2668:	85 c0                	test   %eax,%eax
    266a:	78 7d                	js     26e9 <fourteen+0xf9>
  close(fd);
    266c:	83 ec 0c             	sub    $0xc,%esp
    266f:	50                   	push   %eax
    2670:	e8 c5 11 00 00       	call   383a <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2675:	c7 04 24 4c 48 00 00 	movl   $0x484c,(%esp)
    267c:	e8 01 12 00 00       	call   3882 <mkdir>
    2681:	83 c4 10             	add    $0x10,%esp
    2684:	85 c0                	test   %eax,%eax
    2686:	74 4e                	je     26d6 <fourteen+0xe6>
  if(mkdir("123456789012345/12345678901234") == 0){
    2688:	83 ec 0c             	sub    $0xc,%esp
    268b:	68 80 51 00 00       	push   $0x5180
    2690:	e8 ed 11 00 00       	call   3882 <mkdir>
    2695:	83 c4 10             	add    $0x10,%esp
    2698:	85 c0                	test   %eax,%eax
    269a:	74 27                	je     26c3 <fourteen+0xd3>
  printf(1, "fourteen ok\n");
    269c:	83 ec 08             	sub    $0x8,%esp
    269f:	68 6a 48 00 00       	push   $0x486a
    26a4:	6a 01                	push   $0x1
    26a6:	e8 b5 12 00 00       	call   3960 <printf>
}
    26ab:	83 c4 10             	add    $0x10,%esp
    26ae:	c9                   	leave  
    26af:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    26b0:	50                   	push   %eax
    26b1:	50                   	push   %eax
    26b2:	68 2f 48 00 00       	push   $0x482f
    26b7:	6a 01                	push   $0x1
    26b9:	e8 a2 12 00 00       	call   3960 <printf>
    exit();
    26be:	e8 3f 11 00 00       	call   3802 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    26c3:	50                   	push   %eax
    26c4:	50                   	push   %eax
    26c5:	68 a0 51 00 00       	push   $0x51a0
    26ca:	6a 01                	push   $0x1
    26cc:	e8 8f 12 00 00       	call   3960 <printf>
    exit();
    26d1:	e8 2c 11 00 00       	call   3802 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    26d6:	52                   	push   %edx
    26d7:	52                   	push   %edx
    26d8:	68 50 51 00 00       	push   $0x5150
    26dd:	6a 01                	push   $0x1
    26df:	e8 7c 12 00 00       	call   3960 <printf>
    exit();
    26e4:	e8 19 11 00 00       	call   3802 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    26e9:	51                   	push   %ecx
    26ea:	51                   	push   %ecx
    26eb:	68 14 51 00 00       	push   $0x5114
    26f0:	6a 01                	push   $0x1
    26f2:	e8 69 12 00 00       	call   3960 <printf>
    exit();
    26f7:	e8 06 11 00 00       	call   3802 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    26fc:	51                   	push   %ecx
    26fd:	51                   	push   %ecx
    26fe:	68 a4 50 00 00       	push   $0x50a4
    2703:	6a 01                	push   $0x1
    2705:	e8 56 12 00 00       	call   3960 <printf>
    exit();
    270a:	e8 f3 10 00 00       	call   3802 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    270f:	50                   	push   %eax
    2710:	50                   	push   %eax
    2711:	68 44 50 00 00       	push   $0x5044
    2716:	6a 01                	push   $0x1
    2718:	e8 43 12 00 00       	call   3960 <printf>
    exit();
    271d:	e8 e0 10 00 00       	call   3802 <exit>
    2722:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    2729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002730 <rmdot>:
{
    2730:	55                   	push   %ebp
    2731:	89 e5                	mov    %esp,%ebp
    2733:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2736:	68 77 48 00 00       	push   $0x4877
    273b:	6a 01                	push   $0x1
    273d:	e8 1e 12 00 00       	call   3960 <printf>
  if(mkdir("dots") != 0){
    2742:	c7 04 24 83 48 00 00 	movl   $0x4883,(%esp)
    2749:	e8 34 11 00 00       	call   3882 <mkdir>
    274e:	83 c4 10             	add    $0x10,%esp
    2751:	85 c0                	test   %eax,%eax
    2753:	0f 85 b0 00 00 00    	jne    2809 <rmdot+0xd9>
  if(chdir("dots") != 0){
    2759:	83 ec 0c             	sub    $0xc,%esp
    275c:	68 83 48 00 00       	push   $0x4883
    2761:	e8 24 11 00 00       	call   388a <chdir>
    2766:	83 c4 10             	add    $0x10,%esp
    2769:	85 c0                	test   %eax,%eax
    276b:	0f 85 1d 01 00 00    	jne    288e <rmdot+0x15e>
  if(unlink(".") == 0){
    2771:	83 ec 0c             	sub    $0xc,%esp
    2774:	68 2e 45 00 00       	push   $0x452e
    2779:	e8 ec 10 00 00       	call   386a <unlink>
    277e:	83 c4 10             	add    $0x10,%esp
    2781:	85 c0                	test   %eax,%eax
    2783:	0f 84 f2 00 00 00    	je     287b <rmdot+0x14b>
  if(unlink("..") == 0){
    2789:	83 ec 0c             	sub    $0xc,%esp
    278c:	68 2d 45 00 00       	push   $0x452d
    2791:	e8 d4 10 00 00       	call   386a <unlink>
    2796:	83 c4 10             	add    $0x10,%esp
    2799:	85 c0                	test   %eax,%eax
    279b:	0f 84 c7 00 00 00    	je     2868 <rmdot+0x138>
  if(chdir("/") != 0){
    27a1:	83 ec 0c             	sub    $0xc,%esp
    27a4:	68 01 3d 00 00       	push   $0x3d01
    27a9:	e8 dc 10 00 00       	call   388a <chdir>
    27ae:	83 c4 10             	add    $0x10,%esp
    27b1:	85 c0                	test   %eax,%eax
    27b3:	0f 85 9c 00 00 00    	jne    2855 <rmdot+0x125>
  if(unlink("dots/.") == 0){
    27b9:	83 ec 0c             	sub    $0xc,%esp
    27bc:	68 cb 48 00 00       	push   $0x48cb
    27c1:	e8 a4 10 00 00       	call   386a <unlink>
    27c6:	83 c4 10             	add    $0x10,%esp
    27c9:	85 c0                	test   %eax,%eax
    27cb:	74 75                	je     2842 <rmdot+0x112>
  if(unlink("dots/..") == 0){
    27cd:	83 ec 0c             	sub    $0xc,%esp
    27d0:	68 e9 48 00 00       	push   $0x48e9
    27d5:	e8 90 10 00 00       	call   386a <unlink>
    27da:	83 c4 10             	add    $0x10,%esp
    27dd:	85 c0                	test   %eax,%eax
    27df:	74 4e                	je     282f <rmdot+0xff>
  if(unlink("dots") != 0){
    27e1:	83 ec 0c             	sub    $0xc,%esp
    27e4:	68 83 48 00 00       	push   $0x4883
    27e9:	e8 7c 10 00 00       	call   386a <unlink>
    27ee:	83 c4 10             	add    $0x10,%esp
    27f1:	85 c0                	test   %eax,%eax
    27f3:	75 27                	jne    281c <rmdot+0xec>
  printf(1, "rmdot ok\n");
    27f5:	83 ec 08             	sub    $0x8,%esp
    27f8:	68 1e 49 00 00       	push   $0x491e
    27fd:	6a 01                	push   $0x1
    27ff:	e8 5c 11 00 00       	call   3960 <printf>
}
    2804:	83 c4 10             	add    $0x10,%esp
    2807:	c9                   	leave  
    2808:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    2809:	50                   	push   %eax
    280a:	50                   	push   %eax
    280b:	68 88 48 00 00       	push   $0x4888
    2810:	6a 01                	push   $0x1
    2812:	e8 49 11 00 00       	call   3960 <printf>
    exit();
    2817:	e8 e6 0f 00 00       	call   3802 <exit>
    printf(1, "unlink dots failed!\n");
    281c:	50                   	push   %eax
    281d:	50                   	push   %eax
    281e:	68 09 49 00 00       	push   $0x4909
    2823:	6a 01                	push   $0x1
    2825:	e8 36 11 00 00       	call   3960 <printf>
    exit();
    282a:	e8 d3 0f 00 00       	call   3802 <exit>
    printf(1, "unlink dots/.. worked!\n");
    282f:	52                   	push   %edx
    2830:	52                   	push   %edx
    2831:	68 f1 48 00 00       	push   $0x48f1
    2836:	6a 01                	push   $0x1
    2838:	e8 23 11 00 00       	call   3960 <printf>
    exit();
    283d:	e8 c0 0f 00 00       	call   3802 <exit>
    printf(1, "unlink dots/. worked!\n");
    2842:	51                   	push   %ecx
    2843:	51                   	push   %ecx
    2844:	68 d2 48 00 00       	push   $0x48d2
    2849:	6a 01                	push   $0x1
    284b:	e8 10 11 00 00       	call   3960 <printf>
    exit();
    2850:	e8 ad 0f 00 00       	call   3802 <exit>
    printf(1, "chdir / failed\n");
    2855:	50                   	push   %eax
    2856:	50                   	push   %eax
    2857:	68 03 3d 00 00       	push   $0x3d03
    285c:	6a 01                	push   $0x1
    285e:	e8 fd 10 00 00       	call   3960 <printf>
    exit();
    2863:	e8 9a 0f 00 00       	call   3802 <exit>
    printf(1, "rm .. worked!\n");
    2868:	50                   	push   %eax
    2869:	50                   	push   %eax
    286a:	68 bc 48 00 00       	push   $0x48bc
    286f:	6a 01                	push   $0x1
    2871:	e8 ea 10 00 00       	call   3960 <printf>
    exit();
    2876:	e8 87 0f 00 00       	call   3802 <exit>
    printf(1, "rm . worked!\n");
    287b:	50                   	push   %eax
    287c:	50                   	push   %eax
    287d:	68 ae 48 00 00       	push   $0x48ae
    2882:	6a 01                	push   $0x1
    2884:	e8 d7 10 00 00       	call   3960 <printf>
    exit();
    2889:	e8 74 0f 00 00       	call   3802 <exit>
    printf(1, "chdir dots failed\n");
    288e:	50                   	push   %eax
    288f:	50                   	push   %eax
    2890:	68 9b 48 00 00       	push   $0x489b
    2895:	6a 01                	push   $0x1
    2897:	e8 c4 10 00 00       	call   3960 <printf>
    exit();
    289c:	e8 61 0f 00 00       	call   3802 <exit>
    28a1:	eb 0d                	jmp    28b0 <dirfile>
    28a3:	90                   	nop
    28a4:	90                   	nop
    28a5:	90                   	nop
    28a6:	90                   	nop
    28a7:	90                   	nop
    28a8:	90                   	nop
    28a9:	90                   	nop
    28aa:	90                   	nop
    28ab:	90                   	nop
    28ac:	90                   	nop
    28ad:	90                   	nop
    28ae:	90                   	nop
    28af:	90                   	nop

000028b0 <dirfile>:
{
    28b0:	55                   	push   %ebp
    28b1:	89 e5                	mov    %esp,%ebp
    28b3:	53                   	push   %ebx
    28b4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    28b7:	68 28 49 00 00       	push   $0x4928
    28bc:	6a 01                	push   $0x1
    28be:	e8 9d 10 00 00       	call   3960 <printf>
  fd = open("dirfile", O_CREATE);
    28c3:	59                   	pop    %ecx
    28c4:	5b                   	pop    %ebx
    28c5:	68 00 02 00 00       	push   $0x200
    28ca:	68 35 49 00 00       	push   $0x4935
    28cf:	e8 86 0f 00 00       	call   385a <open>
  if(fd < 0){
    28d4:	83 c4 10             	add    $0x10,%esp
    28d7:	85 c0                	test   %eax,%eax
    28d9:	0f 88 43 01 00 00    	js     2a22 <dirfile+0x172>
  close(fd);
    28df:	83 ec 0c             	sub    $0xc,%esp
    28e2:	50                   	push   %eax
    28e3:	e8 52 0f 00 00       	call   383a <close>
  if(chdir("dirfile") == 0){
    28e8:	c7 04 24 35 49 00 00 	movl   $0x4935,(%esp)
    28ef:	e8 96 0f 00 00       	call   388a <chdir>
    28f4:	83 c4 10             	add    $0x10,%esp
    28f7:	85 c0                	test   %eax,%eax
    28f9:	0f 84 10 01 00 00    	je     2a0f <dirfile+0x15f>
  fd = open("dirfile/xx", 0);
    28ff:	83 ec 08             	sub    $0x8,%esp
    2902:	6a 00                	push   $0x0
    2904:	68 6e 49 00 00       	push   $0x496e
    2909:	e8 4c 0f 00 00       	call   385a <open>
  if(fd >= 0){
    290e:	83 c4 10             	add    $0x10,%esp
    2911:	85 c0                	test   %eax,%eax
    2913:	0f 89 e3 00 00 00    	jns    29fc <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    2919:	83 ec 08             	sub    $0x8,%esp
    291c:	68 00 02 00 00       	push   $0x200
    2921:	68 6e 49 00 00       	push   $0x496e
    2926:	e8 2f 0f 00 00       	call   385a <open>
  if(fd >= 0){
    292b:	83 c4 10             	add    $0x10,%esp
    292e:	85 c0                	test   %eax,%eax
    2930:	0f 89 c6 00 00 00    	jns    29fc <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    2936:	83 ec 0c             	sub    $0xc,%esp
    2939:	68 6e 49 00 00       	push   $0x496e
    293e:	e8 3f 0f 00 00       	call   3882 <mkdir>
    2943:	83 c4 10             	add    $0x10,%esp
    2946:	85 c0                	test   %eax,%eax
    2948:	0f 84 46 01 00 00    	je     2a94 <dirfile+0x1e4>
  if(unlink("dirfile/xx") == 0){
    294e:	83 ec 0c             	sub    $0xc,%esp
    2951:	68 6e 49 00 00       	push   $0x496e
    2956:	e8 0f 0f 00 00       	call   386a <unlink>
    295b:	83 c4 10             	add    $0x10,%esp
    295e:	85 c0                	test   %eax,%eax
    2960:	0f 84 1b 01 00 00    	je     2a81 <dirfile+0x1d1>
  if(link("README", "dirfile/xx") == 0){
    2966:	83 ec 08             	sub    $0x8,%esp
    2969:	68 6e 49 00 00       	push   $0x496e
    296e:	68 d2 49 00 00       	push   $0x49d2
    2973:	e8 02 0f 00 00       	call   387a <link>
    2978:	83 c4 10             	add    $0x10,%esp
    297b:	85 c0                	test   %eax,%eax
    297d:	0f 84 eb 00 00 00    	je     2a6e <dirfile+0x1be>
  if(unlink("dirfile") != 0){
    2983:	83 ec 0c             	sub    $0xc,%esp
    2986:	68 35 49 00 00       	push   $0x4935
    298b:	e8 da 0e 00 00       	call   386a <unlink>
    2990:	83 c4 10             	add    $0x10,%esp
    2993:	85 c0                	test   %eax,%eax
    2995:	0f 85 c0 00 00 00    	jne    2a5b <dirfile+0x1ab>
  fd = open(".", O_RDWR);
    299b:	83 ec 08             	sub    $0x8,%esp
    299e:	6a 02                	push   $0x2
    29a0:	68 2e 45 00 00       	push   $0x452e
    29a5:	e8 b0 0e 00 00       	call   385a <open>
  if(fd >= 0){
    29aa:	83 c4 10             	add    $0x10,%esp
    29ad:	85 c0                	test   %eax,%eax
    29af:	0f 89 93 00 00 00    	jns    2a48 <dirfile+0x198>
  fd = open(".", 0);
    29b5:	83 ec 08             	sub    $0x8,%esp
    29b8:	6a 00                	push   $0x0
    29ba:	68 2e 45 00 00       	push   $0x452e
    29bf:	e8 96 0e 00 00       	call   385a <open>
  if(write(fd, "x", 1) > 0){
    29c4:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", 0);
    29c7:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    29c9:	6a 01                	push   $0x1
    29cb:	68 11 46 00 00       	push   $0x4611
    29d0:	50                   	push   %eax
    29d1:	e8 5c 0e 00 00       	call   3832 <write>
    29d6:	83 c4 10             	add    $0x10,%esp
    29d9:	85 c0                	test   %eax,%eax
    29db:	7f 58                	jg     2a35 <dirfile+0x185>
  close(fd);
    29dd:	83 ec 0c             	sub    $0xc,%esp
    29e0:	53                   	push   %ebx
    29e1:	e8 54 0e 00 00       	call   383a <close>
  printf(1, "dir vs file OK\n");
    29e6:	58                   	pop    %eax
    29e7:	5a                   	pop    %edx
    29e8:	68 05 4a 00 00       	push   $0x4a05
    29ed:	6a 01                	push   $0x1
    29ef:	e8 6c 0f 00 00       	call   3960 <printf>
}
    29f4:	83 c4 10             	add    $0x10,%esp
    29f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    29fa:	c9                   	leave  
    29fb:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    29fc:	50                   	push   %eax
    29fd:	50                   	push   %eax
    29fe:	68 79 49 00 00       	push   $0x4979
    2a03:	6a 01                	push   $0x1
    2a05:	e8 56 0f 00 00       	call   3960 <printf>
    exit();
    2a0a:	e8 f3 0d 00 00       	call   3802 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2a0f:	50                   	push   %eax
    2a10:	50                   	push   %eax
    2a11:	68 54 49 00 00       	push   $0x4954
    2a16:	6a 01                	push   $0x1
    2a18:	e8 43 0f 00 00       	call   3960 <printf>
    exit();
    2a1d:	e8 e0 0d 00 00       	call   3802 <exit>
    printf(1, "create dirfile failed\n");
    2a22:	52                   	push   %edx
    2a23:	52                   	push   %edx
    2a24:	68 3d 49 00 00       	push   $0x493d
    2a29:	6a 01                	push   $0x1
    2a2b:	e8 30 0f 00 00       	call   3960 <printf>
    exit();
    2a30:	e8 cd 0d 00 00       	call   3802 <exit>
    printf(1, "write . succeeded!\n");
    2a35:	51                   	push   %ecx
    2a36:	51                   	push   %ecx
    2a37:	68 f1 49 00 00       	push   $0x49f1
    2a3c:	6a 01                	push   $0x1
    2a3e:	e8 1d 0f 00 00       	call   3960 <printf>
    exit();
    2a43:	e8 ba 0d 00 00       	call   3802 <exit>
    printf(1, "open . for writing succeeded!\n");
    2a48:	53                   	push   %ebx
    2a49:	53                   	push   %ebx
    2a4a:	68 f4 51 00 00       	push   $0x51f4
    2a4f:	6a 01                	push   $0x1
    2a51:	e8 0a 0f 00 00       	call   3960 <printf>
    exit();
    2a56:	e8 a7 0d 00 00       	call   3802 <exit>
    printf(1, "unlink dirfile failed!\n");
    2a5b:	50                   	push   %eax
    2a5c:	50                   	push   %eax
    2a5d:	68 d9 49 00 00       	push   $0x49d9
    2a62:	6a 01                	push   $0x1
    2a64:	e8 f7 0e 00 00       	call   3960 <printf>
    exit();
    2a69:	e8 94 0d 00 00       	call   3802 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2a6e:	50                   	push   %eax
    2a6f:	50                   	push   %eax
    2a70:	68 d4 51 00 00       	push   $0x51d4
    2a75:	6a 01                	push   $0x1
    2a77:	e8 e4 0e 00 00       	call   3960 <printf>
    exit();
    2a7c:	e8 81 0d 00 00       	call   3802 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2a81:	50                   	push   %eax
    2a82:	50                   	push   %eax
    2a83:	68 b4 49 00 00       	push   $0x49b4
    2a88:	6a 01                	push   $0x1
    2a8a:	e8 d1 0e 00 00       	call   3960 <printf>
    exit();
    2a8f:	e8 6e 0d 00 00       	call   3802 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2a94:	50                   	push   %eax
    2a95:	50                   	push   %eax
    2a96:	68 97 49 00 00       	push   $0x4997
    2a9b:	6a 01                	push   $0x1
    2a9d:	e8 be 0e 00 00       	call   3960 <printf>
    exit();
    2aa2:	e8 5b 0d 00 00       	call   3802 <exit>
    2aa7:	89 f6                	mov    %esi,%esi
    2aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002ab0 <iref>:
{
    2ab0:	55                   	push   %ebp
    2ab1:	89 e5                	mov    %esp,%ebp
    2ab3:	53                   	push   %ebx
  printf(1, "empty file name\n");
    2ab4:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    2ab9:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    2abc:	68 15 4a 00 00       	push   $0x4a15
    2ac1:	6a 01                	push   $0x1
    2ac3:	e8 98 0e 00 00       	call   3960 <printf>
    2ac8:	83 c4 10             	add    $0x10,%esp
    2acb:	90                   	nop
    2acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(mkdir("irefd") != 0){
    2ad0:	83 ec 0c             	sub    $0xc,%esp
    2ad3:	68 26 4a 00 00       	push   $0x4a26
    2ad8:	e8 a5 0d 00 00       	call   3882 <mkdir>
    2add:	83 c4 10             	add    $0x10,%esp
    2ae0:	85 c0                	test   %eax,%eax
    2ae2:	0f 85 bb 00 00 00    	jne    2ba3 <iref+0xf3>
    if(chdir("irefd") != 0){
    2ae8:	83 ec 0c             	sub    $0xc,%esp
    2aeb:	68 26 4a 00 00       	push   $0x4a26
    2af0:	e8 95 0d 00 00       	call   388a <chdir>
    2af5:	83 c4 10             	add    $0x10,%esp
    2af8:	85 c0                	test   %eax,%eax
    2afa:	0f 85 b7 00 00 00    	jne    2bb7 <iref+0x107>
    mkdir("");
    2b00:	83 ec 0c             	sub    $0xc,%esp
    2b03:	68 db 40 00 00       	push   $0x40db
    2b08:	e8 75 0d 00 00       	call   3882 <mkdir>
    link("README", "");
    2b0d:	59                   	pop    %ecx
    2b0e:	58                   	pop    %eax
    2b0f:	68 db 40 00 00       	push   $0x40db
    2b14:	68 d2 49 00 00       	push   $0x49d2
    2b19:	e8 5c 0d 00 00       	call   387a <link>
    fd = open("", O_CREATE);
    2b1e:	58                   	pop    %eax
    2b1f:	5a                   	pop    %edx
    2b20:	68 00 02 00 00       	push   $0x200
    2b25:	68 db 40 00 00       	push   $0x40db
    2b2a:	e8 2b 0d 00 00       	call   385a <open>
    if(fd >= 0)
    2b2f:	83 c4 10             	add    $0x10,%esp
    2b32:	85 c0                	test   %eax,%eax
    2b34:	78 0c                	js     2b42 <iref+0x92>
      close(fd);
    2b36:	83 ec 0c             	sub    $0xc,%esp
    2b39:	50                   	push   %eax
    2b3a:	e8 fb 0c 00 00       	call   383a <close>
    2b3f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2b42:	83 ec 08             	sub    $0x8,%esp
    2b45:	68 00 02 00 00       	push   $0x200
    2b4a:	68 10 46 00 00       	push   $0x4610
    2b4f:	e8 06 0d 00 00       	call   385a <open>
    if(fd >= 0)
    2b54:	83 c4 10             	add    $0x10,%esp
    2b57:	85 c0                	test   %eax,%eax
    2b59:	78 0c                	js     2b67 <iref+0xb7>
      close(fd);
    2b5b:	83 ec 0c             	sub    $0xc,%esp
    2b5e:	50                   	push   %eax
    2b5f:	e8 d6 0c 00 00       	call   383a <close>
    2b64:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2b67:	83 ec 0c             	sub    $0xc,%esp
    2b6a:	68 10 46 00 00       	push   $0x4610
    2b6f:	e8 f6 0c 00 00       	call   386a <unlink>
  for(i = 0; i < 50 + 1; i++){
    2b74:	83 c4 10             	add    $0x10,%esp
    2b77:	83 eb 01             	sub    $0x1,%ebx
    2b7a:	0f 85 50 ff ff ff    	jne    2ad0 <iref+0x20>
  chdir("/");
    2b80:	83 ec 0c             	sub    $0xc,%esp
    2b83:	68 01 3d 00 00       	push   $0x3d01
    2b88:	e8 fd 0c 00 00       	call   388a <chdir>
  printf(1, "empty file name OK\n");
    2b8d:	58                   	pop    %eax
    2b8e:	5a                   	pop    %edx
    2b8f:	68 54 4a 00 00       	push   $0x4a54
    2b94:	6a 01                	push   $0x1
    2b96:	e8 c5 0d 00 00       	call   3960 <printf>
}
    2b9b:	83 c4 10             	add    $0x10,%esp
    2b9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ba1:	c9                   	leave  
    2ba2:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    2ba3:	83 ec 08             	sub    $0x8,%esp
    2ba6:	68 2c 4a 00 00       	push   $0x4a2c
    2bab:	6a 01                	push   $0x1
    2bad:	e8 ae 0d 00 00       	call   3960 <printf>
      exit();
    2bb2:	e8 4b 0c 00 00       	call   3802 <exit>
      printf(1, "chdir irefd failed\n");
    2bb7:	83 ec 08             	sub    $0x8,%esp
    2bba:	68 40 4a 00 00       	push   $0x4a40
    2bbf:	6a 01                	push   $0x1
    2bc1:	e8 9a 0d 00 00       	call   3960 <printf>
      exit();
    2bc6:	e8 37 0c 00 00       	call   3802 <exit>
    2bcb:	90                   	nop
    2bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002bd0 <forktest>:
{
    2bd0:	55                   	push   %ebp
    2bd1:	89 e5                	mov    %esp,%ebp
    2bd3:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    2bd4:	31 db                	xor    %ebx,%ebx
{
    2bd6:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    2bd9:	68 68 4a 00 00       	push   $0x4a68
    2bde:	6a 01                	push   $0x1
    2be0:	e8 7b 0d 00 00       	call   3960 <printf>
    2be5:	83 c4 10             	add    $0x10,%esp
    2be8:	eb 13                	jmp    2bfd <forktest+0x2d>
    2bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid == 0)
    2bf0:	74 62                	je     2c54 <forktest+0x84>
  for(n=0; n<1000; n++){
    2bf2:	83 c3 01             	add    $0x1,%ebx
    2bf5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2bfb:	74 43                	je     2c40 <forktest+0x70>
    pid = fork();
    2bfd:	e8 f8 0b 00 00       	call   37fa <fork>
    if(pid < 0)
    2c02:	85 c0                	test   %eax,%eax
    2c04:	79 ea                	jns    2bf0 <forktest+0x20>
  for(; n > 0; n--){
    2c06:	85 db                	test   %ebx,%ebx
    2c08:	74 14                	je     2c1e <forktest+0x4e>
    2c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2c10:	e8 f5 0b 00 00       	call   380a <wait>
    2c15:	85 c0                	test   %eax,%eax
    2c17:	78 40                	js     2c59 <forktest+0x89>
  for(; n > 0; n--){
    2c19:	83 eb 01             	sub    $0x1,%ebx
    2c1c:	75 f2                	jne    2c10 <forktest+0x40>
  if(wait() != -1){
    2c1e:	e8 e7 0b 00 00       	call   380a <wait>
    2c23:	83 f8 ff             	cmp    $0xffffffff,%eax
    2c26:	75 45                	jne    2c6d <forktest+0x9d>
  printf(1, "fork test OK\n");
    2c28:	83 ec 08             	sub    $0x8,%esp
    2c2b:	68 9a 4a 00 00       	push   $0x4a9a
    2c30:	6a 01                	push   $0x1
    2c32:	e8 29 0d 00 00       	call   3960 <printf>
}
    2c37:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c3a:	c9                   	leave  
    2c3b:	c3                   	ret    
    2c3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fork claimed to work 1000 times!\n");
    2c40:	83 ec 08             	sub    $0x8,%esp
    2c43:	68 14 52 00 00       	push   $0x5214
    2c48:	6a 01                	push   $0x1
    2c4a:	e8 11 0d 00 00       	call   3960 <printf>
    exit();
    2c4f:	e8 ae 0b 00 00       	call   3802 <exit>
      exit();
    2c54:	e8 a9 0b 00 00       	call   3802 <exit>
      printf(1, "wait stopped early\n");
    2c59:	83 ec 08             	sub    $0x8,%esp
    2c5c:	68 73 4a 00 00       	push   $0x4a73
    2c61:	6a 01                	push   $0x1
    2c63:	e8 f8 0c 00 00       	call   3960 <printf>
      exit();
    2c68:	e8 95 0b 00 00       	call   3802 <exit>
    printf(1, "wait got too many\n");
    2c6d:	50                   	push   %eax
    2c6e:	50                   	push   %eax
    2c6f:	68 87 4a 00 00       	push   $0x4a87
    2c74:	6a 01                	push   $0x1
    2c76:	e8 e5 0c 00 00       	call   3960 <printf>
    exit();
    2c7b:	e8 82 0b 00 00       	call   3802 <exit>

00002c80 <sbrktest>:
{
    2c80:	55                   	push   %ebp
    2c81:	89 e5                	mov    %esp,%ebp
    2c83:	57                   	push   %edi
    2c84:	56                   	push   %esi
    2c85:	53                   	push   %ebx
  for(i = 0; i < 5000; i++){
    2c86:	31 ff                	xor    %edi,%edi
{
    2c88:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    2c8b:	68 a8 4a 00 00       	push   $0x4aa8
    2c90:	ff 35 74 5d 00 00    	pushl  0x5d74
    2c96:	e8 c5 0c 00 00       	call   3960 <printf>
  oldbrk = sbrk(0);
    2c9b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ca2:	e8 fb 0b 00 00       	call   38a2 <sbrk>
  a = sbrk(0);
    2ca7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    2cae:	89 c3                	mov    %eax,%ebx
  a = sbrk(0);
    2cb0:	e8 ed 0b 00 00       	call   38a2 <sbrk>
    2cb5:	83 c4 10             	add    $0x10,%esp
    2cb8:	89 c6                	mov    %eax,%esi
    2cba:	eb 06                	jmp    2cc2 <sbrktest+0x42>
    2cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    a = b + 1;
    2cc0:	89 c6                	mov    %eax,%esi
    b = sbrk(1);
    2cc2:	83 ec 0c             	sub    $0xc,%esp
    2cc5:	6a 01                	push   $0x1
    2cc7:	e8 d6 0b 00 00       	call   38a2 <sbrk>
    if(b != a){
    2ccc:	83 c4 10             	add    $0x10,%esp
    2ccf:	39 f0                	cmp    %esi,%eax
    2cd1:	0f 85 62 02 00 00    	jne    2f39 <sbrktest+0x2b9>
  for(i = 0; i < 5000; i++){
    2cd7:	83 c7 01             	add    $0x1,%edi
    *b = 1;
    2cda:	c6 06 01             	movb   $0x1,(%esi)
    a = b + 1;
    2cdd:	8d 46 01             	lea    0x1(%esi),%eax
  for(i = 0; i < 5000; i++){
    2ce0:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2ce6:	75 d8                	jne    2cc0 <sbrktest+0x40>
  pid = fork();
    2ce8:	e8 0d 0b 00 00       	call   37fa <fork>
  if(pid < 0){
    2ced:	85 c0                	test   %eax,%eax
  pid = fork();
    2cef:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2cf1:	0f 88 82 03 00 00    	js     3079 <sbrktest+0x3f9>
  c = sbrk(1);
    2cf7:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    2cfa:	83 c6 02             	add    $0x2,%esi
  c = sbrk(1);
    2cfd:	6a 01                	push   $0x1
    2cff:	e8 9e 0b 00 00       	call   38a2 <sbrk>
  c = sbrk(1);
    2d04:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d0b:	e8 92 0b 00 00       	call   38a2 <sbrk>
  if(c != a + 1){
    2d10:	83 c4 10             	add    $0x10,%esp
    2d13:	39 f0                	cmp    %esi,%eax
    2d15:	0f 85 47 03 00 00    	jne    3062 <sbrktest+0x3e2>
  if(pid == 0)
    2d1b:	85 ff                	test   %edi,%edi
    2d1d:	0f 84 3a 03 00 00    	je     305d <sbrktest+0x3dd>
  wait();
    2d23:	e8 e2 0a 00 00       	call   380a <wait>
  a = sbrk(0);
    2d28:	83 ec 0c             	sub    $0xc,%esp
    2d2b:	6a 00                	push   $0x0
    2d2d:	e8 70 0b 00 00       	call   38a2 <sbrk>
    2d32:	89 c6                	mov    %eax,%esi
  amt = (BIG) - (uint)a;
    2d34:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2d39:	29 f0                	sub    %esi,%eax
  p = sbrk(amt);
    2d3b:	89 04 24             	mov    %eax,(%esp)
    2d3e:	e8 5f 0b 00 00       	call   38a2 <sbrk>
  if (p != a) {
    2d43:	83 c4 10             	add    $0x10,%esp
    2d46:	39 c6                	cmp    %eax,%esi
    2d48:	0f 85 f8 02 00 00    	jne    3046 <sbrktest+0x3c6>
  a = sbrk(0);
    2d4e:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    2d51:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2d58:	6a 00                	push   $0x0
    2d5a:	e8 43 0b 00 00       	call   38a2 <sbrk>
  c = sbrk(-4096);
    2d5f:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    2d66:	89 c6                	mov    %eax,%esi
  c = sbrk(-4096);
    2d68:	e8 35 0b 00 00       	call   38a2 <sbrk>
  if(c == (char*)0xffffffff){
    2d6d:	83 c4 10             	add    $0x10,%esp
    2d70:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d73:	0f 84 b6 02 00 00    	je     302f <sbrktest+0x3af>
  c = sbrk(0);
    2d79:	83 ec 0c             	sub    $0xc,%esp
    2d7c:	6a 00                	push   $0x0
    2d7e:	e8 1f 0b 00 00       	call   38a2 <sbrk>
  if(c != a - 4096){
    2d83:	8d 96 00 f0 ff ff    	lea    -0x1000(%esi),%edx
    2d89:	83 c4 10             	add    $0x10,%esp
    2d8c:	39 d0                	cmp    %edx,%eax
    2d8e:	0f 85 84 02 00 00    	jne    3018 <sbrktest+0x398>
  a = sbrk(0);
    2d94:	83 ec 0c             	sub    $0xc,%esp
    2d97:	6a 00                	push   $0x0
    2d99:	e8 04 0b 00 00       	call   38a2 <sbrk>
    2d9e:	89 c6                	mov    %eax,%esi
  c = sbrk(4096);
    2da0:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2da7:	e8 f6 0a 00 00       	call   38a2 <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2dac:	83 c4 10             	add    $0x10,%esp
    2daf:	39 c6                	cmp    %eax,%esi
  c = sbrk(4096);
    2db1:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2db3:	0f 85 48 02 00 00    	jne    3001 <sbrktest+0x381>
    2db9:	83 ec 0c             	sub    $0xc,%esp
    2dbc:	6a 00                	push   $0x0
    2dbe:	e8 df 0a 00 00       	call   38a2 <sbrk>
    2dc3:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    2dc9:	83 c4 10             	add    $0x10,%esp
    2dcc:	39 d0                	cmp    %edx,%eax
    2dce:	0f 85 2d 02 00 00    	jne    3001 <sbrktest+0x381>
  if(*lastaddr == 99){
    2dd4:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2ddb:	0f 84 09 02 00 00    	je     2fea <sbrktest+0x36a>
  a = sbrk(0);
    2de1:	83 ec 0c             	sub    $0xc,%esp
    2de4:	6a 00                	push   $0x0
    2de6:	e8 b7 0a 00 00       	call   38a2 <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2deb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    2df2:	89 c6                	mov    %eax,%esi
  c = sbrk(-(sbrk(0) - oldbrk));
    2df4:	e8 a9 0a 00 00       	call   38a2 <sbrk>
    2df9:	89 d9                	mov    %ebx,%ecx
    2dfb:	29 c1                	sub    %eax,%ecx
    2dfd:	89 0c 24             	mov    %ecx,(%esp)
    2e00:	e8 9d 0a 00 00       	call   38a2 <sbrk>
  if(c != a){
    2e05:	83 c4 10             	add    $0x10,%esp
    2e08:	39 c6                	cmp    %eax,%esi
    2e0a:	0f 85 c3 01 00 00    	jne    2fd3 <sbrktest+0x353>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2e10:	be 00 00 00 80       	mov    $0x80000000,%esi
    ppid = getpid();
    2e15:	e8 80 0a 00 00       	call   389a <getpid>
    2e1a:	89 c7                	mov    %eax,%edi
    pid = fork();
    2e1c:	e8 d9 09 00 00       	call   37fa <fork>
    if(pid < 0){
    2e21:	85 c0                	test   %eax,%eax
    2e23:	0f 88 93 01 00 00    	js     2fbc <sbrktest+0x33c>
    if(pid == 0){
    2e29:	0f 84 6b 01 00 00    	je     2f9a <sbrktest+0x31a>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2e2f:	81 c6 50 c3 00 00    	add    $0xc350,%esi
    wait();
    2e35:	e8 d0 09 00 00       	call   380a <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2e3a:	81 fe 80 84 1e 80    	cmp    $0x801e8480,%esi
    2e40:	75 d3                	jne    2e15 <sbrktest+0x195>
  if(pipe(fds) != 0){
    2e42:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2e45:	83 ec 0c             	sub    $0xc,%esp
    2e48:	50                   	push   %eax
    2e49:	e8 d4 09 00 00       	call   3822 <pipe>
    2e4e:	83 c4 10             	add    $0x10,%esp
    2e51:	85 c0                	test   %eax,%eax
    2e53:	0f 85 2e 01 00 00    	jne    2f87 <sbrktest+0x307>
    2e59:	8d 7d c0             	lea    -0x40(%ebp),%edi
    2e5c:	89 fe                	mov    %edi,%esi
    2e5e:	eb 23                	jmp    2e83 <sbrktest+0x203>
    if(pids[i] != -1)
    2e60:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e63:	74 14                	je     2e79 <sbrktest+0x1f9>
      read(fds[0], &scratch, 1);
    2e65:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2e68:	83 ec 04             	sub    $0x4,%esp
    2e6b:	6a 01                	push   $0x1
    2e6d:	50                   	push   %eax
    2e6e:	ff 75 b8             	pushl  -0x48(%ebp)
    2e71:	e8 b4 09 00 00       	call   382a <read>
    2e76:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2e79:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2e7c:	83 c6 04             	add    $0x4,%esi
    2e7f:	39 c6                	cmp    %eax,%esi
    2e81:	74 4f                	je     2ed2 <sbrktest+0x252>
    if((pids[i] = fork()) == 0){
    2e83:	e8 72 09 00 00       	call   37fa <fork>
    2e88:	85 c0                	test   %eax,%eax
    2e8a:	89 06                	mov    %eax,(%esi)
    2e8c:	75 d2                	jne    2e60 <sbrktest+0x1e0>
      sbrk(BIG - (uint)sbrk(0));
    2e8e:	83 ec 0c             	sub    $0xc,%esp
    2e91:	6a 00                	push   $0x0
    2e93:	e8 0a 0a 00 00       	call   38a2 <sbrk>
    2e98:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2e9d:	29 c2                	sub    %eax,%edx
    2e9f:	89 14 24             	mov    %edx,(%esp)
    2ea2:	e8 fb 09 00 00       	call   38a2 <sbrk>
      write(fds[1], "x", 1);
    2ea7:	83 c4 0c             	add    $0xc,%esp
    2eaa:	6a 01                	push   $0x1
    2eac:	68 11 46 00 00       	push   $0x4611
    2eb1:	ff 75 bc             	pushl  -0x44(%ebp)
    2eb4:	e8 79 09 00 00       	call   3832 <write>
    2eb9:	83 c4 10             	add    $0x10,%esp
    2ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(;;) sleep(1000);
    2ec0:	83 ec 0c             	sub    $0xc,%esp
    2ec3:	68 e8 03 00 00       	push   $0x3e8
    2ec8:	e8 dd 09 00 00       	call   38aa <sleep>
    2ecd:	83 c4 10             	add    $0x10,%esp
    2ed0:	eb ee                	jmp    2ec0 <sbrktest+0x240>
  c = sbrk(4096);
    2ed2:	83 ec 0c             	sub    $0xc,%esp
    2ed5:	68 00 10 00 00       	push   $0x1000
    2eda:	e8 c3 09 00 00       	call   38a2 <sbrk>
    2edf:	83 c4 10             	add    $0x10,%esp
    2ee2:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    if(pids[i] == -1)
    2ee5:	8b 07                	mov    (%edi),%eax
    2ee7:	83 f8 ff             	cmp    $0xffffffff,%eax
    2eea:	74 11                	je     2efd <sbrktest+0x27d>
    kill(pids[i]);
    2eec:	83 ec 0c             	sub    $0xc,%esp
    2eef:	50                   	push   %eax
    2ef0:	e8 4d 09 00 00       	call   3842 <kill>
    wait();
    2ef5:	e8 10 09 00 00       	call   380a <wait>
    2efa:	83 c4 10             	add    $0x10,%esp
    2efd:	83 c7 04             	add    $0x4,%edi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f00:	39 fe                	cmp    %edi,%esi
    2f02:	75 e1                	jne    2ee5 <sbrktest+0x265>
  if(c == (char*)0xffffffff){
    2f04:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%ebp)
    2f08:	74 66                	je     2f70 <sbrktest+0x2f0>
  if(sbrk(0) > oldbrk)
    2f0a:	83 ec 0c             	sub    $0xc,%esp
    2f0d:	6a 00                	push   $0x0
    2f0f:	e8 8e 09 00 00       	call   38a2 <sbrk>
    2f14:	83 c4 10             	add    $0x10,%esp
    2f17:	39 d8                	cmp    %ebx,%eax
    2f19:	77 3c                	ja     2f57 <sbrktest+0x2d7>
  printf(stdout, "sbrk test OK\n");
    2f1b:	83 ec 08             	sub    $0x8,%esp
    2f1e:	68 50 4b 00 00       	push   $0x4b50
    2f23:	ff 35 74 5d 00 00    	pushl  0x5d74
    2f29:	e8 32 0a 00 00       	call   3960 <printf>
}
    2f2e:	83 c4 10             	add    $0x10,%esp
    2f31:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2f34:	5b                   	pop    %ebx
    2f35:	5e                   	pop    %esi
    2f36:	5f                   	pop    %edi
    2f37:	5d                   	pop    %ebp
    2f38:	c3                   	ret    
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2f39:	83 ec 0c             	sub    $0xc,%esp
    2f3c:	50                   	push   %eax
    2f3d:	56                   	push   %esi
    2f3e:	57                   	push   %edi
    2f3f:	68 b3 4a 00 00       	push   $0x4ab3
    2f44:	ff 35 74 5d 00 00    	pushl  0x5d74
    2f4a:	e8 11 0a 00 00       	call   3960 <printf>
      exit();
    2f4f:	83 c4 20             	add    $0x20,%esp
    2f52:	e8 ab 08 00 00       	call   3802 <exit>
    sbrk(-(sbrk(0) - oldbrk));
    2f57:	83 ec 0c             	sub    $0xc,%esp
    2f5a:	6a 00                	push   $0x0
    2f5c:	e8 41 09 00 00       	call   38a2 <sbrk>
    2f61:	29 c3                	sub    %eax,%ebx
    2f63:	89 1c 24             	mov    %ebx,(%esp)
    2f66:	e8 37 09 00 00       	call   38a2 <sbrk>
    2f6b:	83 c4 10             	add    $0x10,%esp
    2f6e:	eb ab                	jmp    2f1b <sbrktest+0x29b>
    printf(stdout, "failed sbrk leaked memory\n");
    2f70:	50                   	push   %eax
    2f71:	50                   	push   %eax
    2f72:	68 35 4b 00 00       	push   $0x4b35
    2f77:	ff 35 74 5d 00 00    	pushl  0x5d74
    2f7d:	e8 de 09 00 00       	call   3960 <printf>
    exit();
    2f82:	e8 7b 08 00 00       	call   3802 <exit>
    printf(1, "pipe() failed\n");
    2f87:	52                   	push   %edx
    2f88:	52                   	push   %edx
    2f89:	68 f1 3f 00 00       	push   $0x3ff1
    2f8e:	6a 01                	push   $0x1
    2f90:	e8 cb 09 00 00       	call   3960 <printf>
    exit();
    2f95:	e8 68 08 00 00       	call   3802 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    2f9a:	0f be 06             	movsbl (%esi),%eax
    2f9d:	50                   	push   %eax
    2f9e:	56                   	push   %esi
    2f9f:	68 1c 4b 00 00       	push   $0x4b1c
    2fa4:	ff 35 74 5d 00 00    	pushl  0x5d74
    2faa:	e8 b1 09 00 00       	call   3960 <printf>
      kill(ppid);
    2faf:	89 3c 24             	mov    %edi,(%esp)
    2fb2:	e8 8b 08 00 00       	call   3842 <kill>
      exit();
    2fb7:	e8 46 08 00 00       	call   3802 <exit>
      printf(stdout, "fork failed\n");
    2fbc:	51                   	push   %ecx
    2fbd:	51                   	push   %ecx
    2fbe:	68 f9 4b 00 00       	push   $0x4bf9
    2fc3:	ff 35 74 5d 00 00    	pushl  0x5d74
    2fc9:	e8 92 09 00 00       	call   3960 <printf>
      exit();
    2fce:	e8 2f 08 00 00       	call   3802 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2fd3:	50                   	push   %eax
    2fd4:	56                   	push   %esi
    2fd5:	68 08 53 00 00       	push   $0x5308
    2fda:	ff 35 74 5d 00 00    	pushl  0x5d74
    2fe0:	e8 7b 09 00 00       	call   3960 <printf>
    exit();
    2fe5:	e8 18 08 00 00       	call   3802 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2fea:	53                   	push   %ebx
    2feb:	53                   	push   %ebx
    2fec:	68 d8 52 00 00       	push   $0x52d8
    2ff1:	ff 35 74 5d 00 00    	pushl  0x5d74
    2ff7:	e8 64 09 00 00       	call   3960 <printf>
    exit();
    2ffc:	e8 01 08 00 00       	call   3802 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3001:	57                   	push   %edi
    3002:	56                   	push   %esi
    3003:	68 b0 52 00 00       	push   $0x52b0
    3008:	ff 35 74 5d 00 00    	pushl  0x5d74
    300e:	e8 4d 09 00 00       	call   3960 <printf>
    exit();
    3013:	e8 ea 07 00 00       	call   3802 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3018:	50                   	push   %eax
    3019:	56                   	push   %esi
    301a:	68 78 52 00 00       	push   $0x5278
    301f:	ff 35 74 5d 00 00    	pushl  0x5d74
    3025:	e8 36 09 00 00       	call   3960 <printf>
    exit();
    302a:	e8 d3 07 00 00       	call   3802 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    302f:	56                   	push   %esi
    3030:	56                   	push   %esi
    3031:	68 01 4b 00 00       	push   $0x4b01
    3036:	ff 35 74 5d 00 00    	pushl  0x5d74
    303c:	e8 1f 09 00 00       	call   3960 <printf>
    exit();
    3041:	e8 bc 07 00 00       	call   3802 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3046:	57                   	push   %edi
    3047:	57                   	push   %edi
    3048:	68 38 52 00 00       	push   $0x5238
    304d:	ff 35 74 5d 00 00    	pushl  0x5d74
    3053:	e8 08 09 00 00       	call   3960 <printf>
    exit();
    3058:	e8 a5 07 00 00       	call   3802 <exit>
    exit();
    305d:	e8 a0 07 00 00       	call   3802 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    3062:	50                   	push   %eax
    3063:	50                   	push   %eax
    3064:	68 e5 4a 00 00       	push   $0x4ae5
    3069:	ff 35 74 5d 00 00    	pushl  0x5d74
    306f:	e8 ec 08 00 00       	call   3960 <printf>
    exit();
    3074:	e8 89 07 00 00       	call   3802 <exit>
    printf(stdout, "sbrk test fork failed\n");
    3079:	50                   	push   %eax
    307a:	50                   	push   %eax
    307b:	68 ce 4a 00 00       	push   $0x4ace
    3080:	ff 35 74 5d 00 00    	pushl  0x5d74
    3086:	e8 d5 08 00 00       	call   3960 <printf>
    exit();
    308b:	e8 72 07 00 00       	call   3802 <exit>

00003090 <validateint>:
{
    3090:	55                   	push   %ebp
    3091:	89 e5                	mov    %esp,%ebp
}
    3093:	5d                   	pop    %ebp
    3094:	c3                   	ret    
    3095:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000030a0 <validatetest>:
{
    30a0:	55                   	push   %ebp
    30a1:	89 e5                	mov    %esp,%ebp
    30a3:	56                   	push   %esi
    30a4:	53                   	push   %ebx
  for(p = 0; p <= (uint)hi; p += 4096){
    30a5:	31 db                	xor    %ebx,%ebx
  printf(stdout, "validate test\n");
    30a7:	83 ec 08             	sub    $0x8,%esp
    30aa:	68 5e 4b 00 00       	push   $0x4b5e
    30af:	ff 35 74 5d 00 00    	pushl  0x5d74
    30b5:	e8 a6 08 00 00       	call   3960 <printf>
    30ba:	83 c4 10             	add    $0x10,%esp
    30bd:	8d 76 00             	lea    0x0(%esi),%esi
    if((pid = fork()) == 0){
    30c0:	e8 35 07 00 00       	call   37fa <fork>
    30c5:	85 c0                	test   %eax,%eax
    30c7:	89 c6                	mov    %eax,%esi
    30c9:	74 63                	je     312e <validatetest+0x8e>
    sleep(0);
    30cb:	83 ec 0c             	sub    $0xc,%esp
    30ce:	6a 00                	push   $0x0
    30d0:	e8 d5 07 00 00       	call   38aa <sleep>
    sleep(0);
    30d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30dc:	e8 c9 07 00 00       	call   38aa <sleep>
    kill(pid);
    30e1:	89 34 24             	mov    %esi,(%esp)
    30e4:	e8 59 07 00 00       	call   3842 <kill>
    wait();
    30e9:	e8 1c 07 00 00       	call   380a <wait>
    if(link("nosuchfile", (char*)p) != -1){
    30ee:	58                   	pop    %eax
    30ef:	5a                   	pop    %edx
    30f0:	53                   	push   %ebx
    30f1:	68 6d 4b 00 00       	push   $0x4b6d
    30f6:	e8 7f 07 00 00       	call   387a <link>
    30fb:	83 c4 10             	add    $0x10,%esp
    30fe:	83 f8 ff             	cmp    $0xffffffff,%eax
    3101:	75 30                	jne    3133 <validatetest+0x93>
  for(p = 0; p <= (uint)hi; p += 4096){
    3103:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    3109:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    310f:	75 af                	jne    30c0 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    3111:	83 ec 08             	sub    $0x8,%esp
    3114:	68 91 4b 00 00       	push   $0x4b91
    3119:	ff 35 74 5d 00 00    	pushl  0x5d74
    311f:	e8 3c 08 00 00       	call   3960 <printf>
}
    3124:	83 c4 10             	add    $0x10,%esp
    3127:	8d 65 f8             	lea    -0x8(%ebp),%esp
    312a:	5b                   	pop    %ebx
    312b:	5e                   	pop    %esi
    312c:	5d                   	pop    %ebp
    312d:	c3                   	ret    
      exit();
    312e:	e8 cf 06 00 00       	call   3802 <exit>
      printf(stdout, "link should not succeed\n");
    3133:	83 ec 08             	sub    $0x8,%esp
    3136:	68 78 4b 00 00       	push   $0x4b78
    313b:	ff 35 74 5d 00 00    	pushl  0x5d74
    3141:	e8 1a 08 00 00       	call   3960 <printf>
      exit();
    3146:	e8 b7 06 00 00       	call   3802 <exit>
    314b:	90                   	nop
    314c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003150 <bsstest>:
{
    3150:	55                   	push   %ebp
    3151:	89 e5                	mov    %esp,%ebp
    3153:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    3156:	68 9e 4b 00 00       	push   $0x4b9e
    315b:	ff 35 74 5d 00 00    	pushl  0x5d74
    3161:	e8 fa 07 00 00       	call   3960 <printf>
    if(uninit[i] != '\0'){
    3166:	83 c4 10             	add    $0x10,%esp
    3169:	80 3d 40 5e 00 00 00 	cmpb   $0x0,0x5e40
    3170:	75 39                	jne    31ab <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    3172:	b8 01 00 00 00       	mov    $0x1,%eax
    3177:	89 f6                	mov    %esi,%esi
    3179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(uninit[i] != '\0'){
    3180:	80 b8 40 5e 00 00 00 	cmpb   $0x0,0x5e40(%eax)
    3187:	75 22                	jne    31ab <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    3189:	83 c0 01             	add    $0x1,%eax
    318c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    3191:	75 ed                	jne    3180 <bsstest+0x30>
  printf(stdout, "bss test ok\n");
    3193:	83 ec 08             	sub    $0x8,%esp
    3196:	68 b9 4b 00 00       	push   $0x4bb9
    319b:	ff 35 74 5d 00 00    	pushl  0x5d74
    31a1:	e8 ba 07 00 00       	call   3960 <printf>
}
    31a6:	83 c4 10             	add    $0x10,%esp
    31a9:	c9                   	leave  
    31aa:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    31ab:	83 ec 08             	sub    $0x8,%esp
    31ae:	68 a8 4b 00 00       	push   $0x4ba8
    31b3:	ff 35 74 5d 00 00    	pushl  0x5d74
    31b9:	e8 a2 07 00 00       	call   3960 <printf>
      exit();
    31be:	e8 3f 06 00 00       	call   3802 <exit>
    31c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    31c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000031d0 <bigargtest>:
{
    31d0:	55                   	push   %ebp
    31d1:	89 e5                	mov    %esp,%ebp
    31d3:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    31d6:	68 c6 4b 00 00       	push   $0x4bc6
    31db:	e8 8a 06 00 00       	call   386a <unlink>
  pid = fork();
    31e0:	e8 15 06 00 00       	call   37fa <fork>
  if(pid == 0){
    31e5:	83 c4 10             	add    $0x10,%esp
    31e8:	85 c0                	test   %eax,%eax
    31ea:	74 3f                	je     322b <bigargtest+0x5b>
  } else if(pid < 0){
    31ec:	0f 88 c2 00 00 00    	js     32b4 <bigargtest+0xe4>
  wait();
    31f2:	e8 13 06 00 00       	call   380a <wait>
  fd = open("bigarg-ok", 0);
    31f7:	83 ec 08             	sub    $0x8,%esp
    31fa:	6a 00                	push   $0x0
    31fc:	68 c6 4b 00 00       	push   $0x4bc6
    3201:	e8 54 06 00 00       	call   385a <open>
  if(fd < 0){
    3206:	83 c4 10             	add    $0x10,%esp
    3209:	85 c0                	test   %eax,%eax
    320b:	0f 88 8c 00 00 00    	js     329d <bigargtest+0xcd>
  close(fd);
    3211:	83 ec 0c             	sub    $0xc,%esp
    3214:	50                   	push   %eax
    3215:	e8 20 06 00 00       	call   383a <close>
  unlink("bigarg-ok");
    321a:	c7 04 24 c6 4b 00 00 	movl   $0x4bc6,(%esp)
    3221:	e8 44 06 00 00       	call   386a <unlink>
}
    3226:	83 c4 10             	add    $0x10,%esp
    3229:	c9                   	leave  
    322a:	c3                   	ret    
    322b:	b8 a0 5d 00 00       	mov    $0x5da0,%eax
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3230:	c7 00 2c 53 00 00    	movl   $0x532c,(%eax)
    3236:	83 c0 04             	add    $0x4,%eax
    for(i = 0; i < MAXARG-1; i++)
    3239:	3d 1c 5e 00 00       	cmp    $0x5e1c,%eax
    323e:	75 f0                	jne    3230 <bigargtest+0x60>
    printf(stdout, "bigarg test\n");
    3240:	51                   	push   %ecx
    3241:	51                   	push   %ecx
    3242:	68 d0 4b 00 00       	push   $0x4bd0
    3247:	ff 35 74 5d 00 00    	pushl  0x5d74
    args[MAXARG-1] = 0;
    324d:	c7 05 1c 5e 00 00 00 	movl   $0x0,0x5e1c
    3254:	00 00 00 
    printf(stdout, "bigarg test\n");
    3257:	e8 04 07 00 00       	call   3960 <printf>
    exec("echo", args);
    325c:	58                   	pop    %eax
    325d:	5a                   	pop    %edx
    325e:	68 a0 5d 00 00       	push   $0x5da0
    3263:	68 9d 3d 00 00       	push   $0x3d9d
    3268:	e8 e5 05 00 00       	call   3852 <exec>
    printf(stdout, "bigarg test ok\n");
    326d:	59                   	pop    %ecx
    326e:	58                   	pop    %eax
    326f:	68 dd 4b 00 00       	push   $0x4bdd
    3274:	ff 35 74 5d 00 00    	pushl  0x5d74
    327a:	e8 e1 06 00 00       	call   3960 <printf>
    fd = open("bigarg-ok", O_CREATE);
    327f:	58                   	pop    %eax
    3280:	5a                   	pop    %edx
    3281:	68 00 02 00 00       	push   $0x200
    3286:	68 c6 4b 00 00       	push   $0x4bc6
    328b:	e8 ca 05 00 00       	call   385a <open>
    close(fd);
    3290:	89 04 24             	mov    %eax,(%esp)
    3293:	e8 a2 05 00 00       	call   383a <close>
    exit();
    3298:	e8 65 05 00 00       	call   3802 <exit>
    printf(stdout, "bigarg test failed!\n");
    329d:	50                   	push   %eax
    329e:	50                   	push   %eax
    329f:	68 06 4c 00 00       	push   $0x4c06
    32a4:	ff 35 74 5d 00 00    	pushl  0x5d74
    32aa:	e8 b1 06 00 00       	call   3960 <printf>
    exit();
    32af:	e8 4e 05 00 00       	call   3802 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    32b4:	52                   	push   %edx
    32b5:	52                   	push   %edx
    32b6:	68 ed 4b 00 00       	push   $0x4bed
    32bb:	ff 35 74 5d 00 00    	pushl  0x5d74
    32c1:	e8 9a 06 00 00       	call   3960 <printf>
    exit();
    32c6:	e8 37 05 00 00       	call   3802 <exit>
    32cb:	90                   	nop
    32cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000032d0 <fsfull>:
{
    32d0:	55                   	push   %ebp
    32d1:	89 e5                	mov    %esp,%ebp
    32d3:	57                   	push   %edi
    32d4:	56                   	push   %esi
    32d5:	53                   	push   %ebx
  for(nfiles = 0; ; nfiles++){
    32d6:	31 db                	xor    %ebx,%ebx
{
    32d8:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    32db:	68 1b 4c 00 00       	push   $0x4c1b
    32e0:	6a 01                	push   $0x1
    32e2:	e8 79 06 00 00       	call   3960 <printf>
    32e7:	83 c4 10             	add    $0x10,%esp
    32ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    32f0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    32f5:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf(1, "writing %s\n", name);
    32fa:	83 ec 04             	sub    $0x4,%esp
    name[1] = '0' + nfiles / 1000;
    32fd:	f7 e3                	mul    %ebx
    name[0] = 'f';
    32ff:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    3303:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3307:	c1 ea 06             	shr    $0x6,%edx
    330a:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    330d:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    3313:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3316:	89 d8                	mov    %ebx,%eax
    3318:	29 d0                	sub    %edx,%eax
    331a:	89 c2                	mov    %eax,%edx
    331c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3321:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    3323:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3328:	c1 ea 05             	shr    $0x5,%edx
    332b:	83 c2 30             	add    $0x30,%edx
    332e:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3331:	f7 e3                	mul    %ebx
    3333:	89 d8                	mov    %ebx,%eax
    3335:	c1 ea 05             	shr    $0x5,%edx
    3338:	6b d2 64             	imul   $0x64,%edx,%edx
    333b:	29 d0                	sub    %edx,%eax
    333d:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    333f:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3341:	c1 ea 03             	shr    $0x3,%edx
    3344:	83 c2 30             	add    $0x30,%edx
    3347:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    334a:	f7 e1                	mul    %ecx
    334c:	89 d9                	mov    %ebx,%ecx
    334e:	c1 ea 03             	shr    $0x3,%edx
    3351:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3354:	01 c0                	add    %eax,%eax
    3356:	29 c1                	sub    %eax,%ecx
    3358:	89 c8                	mov    %ecx,%eax
    335a:	83 c0 30             	add    $0x30,%eax
    335d:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    3360:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3363:	50                   	push   %eax
    3364:	68 28 4c 00 00       	push   $0x4c28
    3369:	6a 01                	push   $0x1
    336b:	e8 f0 05 00 00       	call   3960 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3370:	58                   	pop    %eax
    3371:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3374:	5a                   	pop    %edx
    3375:	68 02 02 00 00       	push   $0x202
    337a:	50                   	push   %eax
    337b:	e8 da 04 00 00       	call   385a <open>
    if(fd < 0){
    3380:	83 c4 10             	add    $0x10,%esp
    3383:	85 c0                	test   %eax,%eax
    int fd = open(name, O_CREATE|O_RDWR);
    3385:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    3387:	78 57                	js     33e0 <fsfull+0x110>
    int total = 0;
    3389:	31 f6                	xor    %esi,%esi
    338b:	eb 05                	jmp    3392 <fsfull+0xc2>
    338d:	8d 76 00             	lea    0x0(%esi),%esi
      total += cc;
    3390:	01 c6                	add    %eax,%esi
      int cc = write(fd, buf, 512);
    3392:	83 ec 04             	sub    $0x4,%esp
    3395:	68 00 02 00 00       	push   $0x200
    339a:	68 60 85 00 00       	push   $0x8560
    339f:	57                   	push   %edi
    33a0:	e8 8d 04 00 00       	call   3832 <write>
      if(cc < 512)
    33a5:	83 c4 10             	add    $0x10,%esp
    33a8:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    33ad:	7f e1                	jg     3390 <fsfull+0xc0>
    printf(1, "wrote %d bytes\n", total);
    33af:	83 ec 04             	sub    $0x4,%esp
    33b2:	56                   	push   %esi
    33b3:	68 44 4c 00 00       	push   $0x4c44
    33b8:	6a 01                	push   $0x1
    33ba:	e8 a1 05 00 00       	call   3960 <printf>
    close(fd);
    33bf:	89 3c 24             	mov    %edi,(%esp)
    33c2:	e8 73 04 00 00       	call   383a <close>
    if(total == 0)
    33c7:	83 c4 10             	add    $0x10,%esp
    33ca:	85 f6                	test   %esi,%esi
    33cc:	74 28                	je     33f6 <fsfull+0x126>
  for(nfiles = 0; ; nfiles++){
    33ce:	83 c3 01             	add    $0x1,%ebx
    33d1:	e9 1a ff ff ff       	jmp    32f0 <fsfull+0x20>
    33d6:	8d 76 00             	lea    0x0(%esi),%esi
    33d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, "open %s failed\n", name);
    33e0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    33e3:	83 ec 04             	sub    $0x4,%esp
    33e6:	50                   	push   %eax
    33e7:	68 34 4c 00 00       	push   $0x4c34
    33ec:	6a 01                	push   $0x1
    33ee:	e8 6d 05 00 00       	call   3960 <printf>
      break;
    33f3:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    33f6:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    33fb:	be 1f 85 eb 51       	mov    $0x51eb851f,%esi
    name[1] = '0' + nfiles / 1000;
    3400:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3402:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    unlink(name);
    3407:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + nfiles / 1000;
    340a:	f7 e7                	mul    %edi
    name[0] = 'f';
    340c:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    3410:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    3414:	c1 ea 06             	shr    $0x6,%edx
    3417:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    341a:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    3420:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3423:	89 d8                	mov    %ebx,%eax
    3425:	29 d0                	sub    %edx,%eax
    3427:	f7 e6                	mul    %esi
    name[3] = '0' + (nfiles % 100) / 10;
    3429:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    342b:	c1 ea 05             	shr    $0x5,%edx
    342e:	83 c2 30             	add    $0x30,%edx
    3431:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3434:	f7 e6                	mul    %esi
    3436:	89 d8                	mov    %ebx,%eax
    3438:	c1 ea 05             	shr    $0x5,%edx
    343b:	6b d2 64             	imul   $0x64,%edx,%edx
    343e:	29 d0                	sub    %edx,%eax
    3440:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    3442:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3444:	c1 ea 03             	shr    $0x3,%edx
    3447:	83 c2 30             	add    $0x30,%edx
    344a:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    344d:	f7 e1                	mul    %ecx
    344f:	89 d9                	mov    %ebx,%ecx
    nfiles--;
    3451:	83 eb 01             	sub    $0x1,%ebx
    name[4] = '0' + (nfiles % 10);
    3454:	c1 ea 03             	shr    $0x3,%edx
    3457:	8d 04 92             	lea    (%edx,%edx,4),%eax
    345a:	01 c0                	add    %eax,%eax
    345c:	29 c1                	sub    %eax,%ecx
    345e:	89 c8                	mov    %ecx,%eax
    3460:	83 c0 30             	add    $0x30,%eax
    3463:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    3466:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3469:	50                   	push   %eax
    346a:	e8 fb 03 00 00       	call   386a <unlink>
  while(nfiles >= 0){
    346f:	83 c4 10             	add    $0x10,%esp
    3472:	83 fb ff             	cmp    $0xffffffff,%ebx
    3475:	75 89                	jne    3400 <fsfull+0x130>
  printf(1, "fsfull test finished\n");
    3477:	83 ec 08             	sub    $0x8,%esp
    347a:	68 54 4c 00 00       	push   $0x4c54
    347f:	6a 01                	push   $0x1
    3481:	e8 da 04 00 00       	call   3960 <printf>
}
    3486:	83 c4 10             	add    $0x10,%esp
    3489:	8d 65 f4             	lea    -0xc(%ebp),%esp
    348c:	5b                   	pop    %ebx
    348d:	5e                   	pop    %esi
    348e:	5f                   	pop    %edi
    348f:	5d                   	pop    %ebp
    3490:	c3                   	ret    
    3491:	eb 0d                	jmp    34a0 <uio>
    3493:	90                   	nop
    3494:	90                   	nop
    3495:	90                   	nop
    3496:	90                   	nop
    3497:	90                   	nop
    3498:	90                   	nop
    3499:	90                   	nop
    349a:	90                   	nop
    349b:	90                   	nop
    349c:	90                   	nop
    349d:	90                   	nop
    349e:	90                   	nop
    349f:	90                   	nop

000034a0 <uio>:
{
    34a0:	55                   	push   %ebp
    34a1:	89 e5                	mov    %esp,%ebp
    34a3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    34a6:	68 6a 4c 00 00       	push   $0x4c6a
    34ab:	6a 01                	push   $0x1
    34ad:	e8 ae 04 00 00       	call   3960 <printf>
  pid = fork();
    34b2:	e8 43 03 00 00       	call   37fa <fork>
  if(pid == 0){
    34b7:	83 c4 10             	add    $0x10,%esp
    34ba:	85 c0                	test   %eax,%eax
    34bc:	74 29                	je     34e7 <uio+0x47>
  } else if(pid < 0){
    34be:	78 4b                	js     350b <uio+0x6b>
  printf(1, "waiting uio");
    34c0:	83 ec 08             	sub    $0x8,%esp
    34c3:	68 74 4c 00 00       	push   $0x4c74
    34c8:	6a 01                	push   $0x1
    34ca:	e8 91 04 00 00       	call   3960 <printf>
  wait();
    34cf:	e8 36 03 00 00       	call   380a <wait>
  printf(1, "uio test done\n");
    34d4:	58                   	pop    %eax
    34d5:	5a                   	pop    %edx
    34d6:	68 80 4c 00 00       	push   $0x4c80
    34db:	6a 01                	push   $0x1
    34dd:	e8 7e 04 00 00       	call   3960 <printf>
}
    34e2:	83 c4 10             	add    $0x10,%esp
    34e5:	c9                   	leave  
    34e6:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    34e7:	b8 09 00 00 00       	mov    $0x9,%eax
    34ec:	ba 70 00 00 00       	mov    $0x70,%edx
    34f1:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    34f2:	ba 71 00 00 00       	mov    $0x71,%edx
    34f7:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    34f8:	50                   	push   %eax
    34f9:	50                   	push   %eax
    34fa:	68 0c 54 00 00       	push   $0x540c
    34ff:	6a 01                	push   $0x1
    3501:	e8 5a 04 00 00       	call   3960 <printf>
    exit();
    3506:	e8 f7 02 00 00       	call   3802 <exit>
    printf (1, "fork failed\n");
    350b:	51                   	push   %ecx
    350c:	51                   	push   %ecx
    350d:	68 f9 4b 00 00       	push   $0x4bf9
    3512:	6a 01                	push   $0x1
    3514:	e8 47 04 00 00       	call   3960 <printf>
    exit();
    3519:	e8 e4 02 00 00       	call   3802 <exit>
    351e:	66 90                	xchg   %ax,%ax

00003520 <argptest>:
{
    3520:	55                   	push   %ebp
    3521:	89 e5                	mov    %esp,%ebp
    3523:	53                   	push   %ebx
    3524:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    3527:	6a 00                	push   $0x0
    3529:	68 8f 4c 00 00       	push   $0x4c8f
    352e:	e8 27 03 00 00       	call   385a <open>
  if (fd < 0) {
    3533:	83 c4 10             	add    $0x10,%esp
    3536:	85 c0                	test   %eax,%eax
    3538:	78 39                	js     3573 <argptest+0x53>
  read(fd, sbrk(0) - 1, -1);
    353a:	83 ec 0c             	sub    $0xc,%esp
    353d:	89 c3                	mov    %eax,%ebx
    353f:	6a 00                	push   $0x0
    3541:	e8 5c 03 00 00       	call   38a2 <sbrk>
    3546:	83 c4 0c             	add    $0xc,%esp
    3549:	83 e8 01             	sub    $0x1,%eax
    354c:	6a ff                	push   $0xffffffff
    354e:	50                   	push   %eax
    354f:	53                   	push   %ebx
    3550:	e8 d5 02 00 00       	call   382a <read>
  close(fd);
    3555:	89 1c 24             	mov    %ebx,(%esp)
    3558:	e8 dd 02 00 00       	call   383a <close>
  printf(1, "arg test passed\n");
    355d:	58                   	pop    %eax
    355e:	5a                   	pop    %edx
    355f:	68 a1 4c 00 00       	push   $0x4ca1
    3564:	6a 01                	push   $0x1
    3566:	e8 f5 03 00 00       	call   3960 <printf>
}
    356b:	83 c4 10             	add    $0x10,%esp
    356e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3571:	c9                   	leave  
    3572:	c3                   	ret    
    printf(2, "open failed\n");
    3573:	51                   	push   %ecx
    3574:	51                   	push   %ecx
    3575:	68 94 4c 00 00       	push   $0x4c94
    357a:	6a 02                	push   $0x2
    357c:	e8 df 03 00 00       	call   3960 <printf>
    exit();
    3581:	e8 7c 02 00 00       	call   3802 <exit>
    3586:	8d 76 00             	lea    0x0(%esi),%esi
    3589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003590 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    3590:	69 05 70 5d 00 00 0d 	imul   $0x19660d,0x5d70,%eax
    3597:	66 19 00 
{
    359a:	55                   	push   %ebp
    359b:	89 e5                	mov    %esp,%ebp
}
    359d:	5d                   	pop    %ebp
  randstate = randstate * 1664525 + 1013904223;
    359e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    35a3:	a3 70 5d 00 00       	mov    %eax,0x5d70
}
    35a8:	c3                   	ret    
    35a9:	66 90                	xchg   %ax,%ax
    35ab:	66 90                	xchg   %ax,%ax
    35ad:	66 90                	xchg   %ax,%ax
    35af:	90                   	nop

000035b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    35b0:	55                   	push   %ebp
    35b1:	89 e5                	mov    %esp,%ebp
    35b3:	53                   	push   %ebx
    35b4:	8b 45 08             	mov    0x8(%ebp),%eax
    35b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    35ba:	89 c2                	mov    %eax,%edx
    35bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    35c0:	83 c1 01             	add    $0x1,%ecx
    35c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    35c7:	83 c2 01             	add    $0x1,%edx
    35ca:	84 db                	test   %bl,%bl
    35cc:	88 5a ff             	mov    %bl,-0x1(%edx)
    35cf:	75 ef                	jne    35c0 <strcpy+0x10>
    ;
  return os;
}
    35d1:	5b                   	pop    %ebx
    35d2:	5d                   	pop    %ebp
    35d3:	c3                   	ret    
    35d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    35da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000035e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    35e0:	55                   	push   %ebp
    35e1:	89 e5                	mov    %esp,%ebp
    35e3:	53                   	push   %ebx
    35e4:	8b 55 08             	mov    0x8(%ebp),%edx
    35e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    35ea:	0f b6 02             	movzbl (%edx),%eax
    35ed:	0f b6 19             	movzbl (%ecx),%ebx
    35f0:	84 c0                	test   %al,%al
    35f2:	75 1c                	jne    3610 <strcmp+0x30>
    35f4:	eb 2a                	jmp    3620 <strcmp+0x40>
    35f6:	8d 76 00             	lea    0x0(%esi),%esi
    35f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3600:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    3603:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3606:	83 c1 01             	add    $0x1,%ecx
    3609:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    360c:	84 c0                	test   %al,%al
    360e:	74 10                	je     3620 <strcmp+0x40>
    3610:	38 d8                	cmp    %bl,%al
    3612:	74 ec                	je     3600 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    3614:	29 d8                	sub    %ebx,%eax
}
    3616:	5b                   	pop    %ebx
    3617:	5d                   	pop    %ebp
    3618:	c3                   	ret    
    3619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3620:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    3622:	29 d8                	sub    %ebx,%eax
}
    3624:	5b                   	pop    %ebx
    3625:	5d                   	pop    %ebp
    3626:	c3                   	ret    
    3627:	89 f6                	mov    %esi,%esi
    3629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003630 <strlen>:

uint
strlen(const char *s)
{
    3630:	55                   	push   %ebp
    3631:	89 e5                	mov    %esp,%ebp
    3633:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3636:	80 39 00             	cmpb   $0x0,(%ecx)
    3639:	74 15                	je     3650 <strlen+0x20>
    363b:	31 d2                	xor    %edx,%edx
    363d:	8d 76 00             	lea    0x0(%esi),%esi
    3640:	83 c2 01             	add    $0x1,%edx
    3643:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3647:	89 d0                	mov    %edx,%eax
    3649:	75 f5                	jne    3640 <strlen+0x10>
    ;
  return n;
}
    364b:	5d                   	pop    %ebp
    364c:	c3                   	ret    
    364d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    3650:	31 c0                	xor    %eax,%eax
}
    3652:	5d                   	pop    %ebp
    3653:	c3                   	ret    
    3654:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    365a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003660 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3660:	55                   	push   %ebp
    3661:	89 e5                	mov    %esp,%ebp
    3663:	57                   	push   %edi
    3664:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3667:	8b 4d 10             	mov    0x10(%ebp),%ecx
    366a:	8b 45 0c             	mov    0xc(%ebp),%eax
    366d:	89 d7                	mov    %edx,%edi
    366f:	fc                   	cld    
    3670:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3672:	89 d0                	mov    %edx,%eax
    3674:	5f                   	pop    %edi
    3675:	5d                   	pop    %ebp
    3676:	c3                   	ret    
    3677:	89 f6                	mov    %esi,%esi
    3679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003680 <strchr>:

char*
strchr(const char *s, char c)
{
    3680:	55                   	push   %ebp
    3681:	89 e5                	mov    %esp,%ebp
    3683:	53                   	push   %ebx
    3684:	8b 45 08             	mov    0x8(%ebp),%eax
    3687:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    368a:	0f b6 10             	movzbl (%eax),%edx
    368d:	84 d2                	test   %dl,%dl
    368f:	74 1d                	je     36ae <strchr+0x2e>
    if(*s == c)
    3691:	38 d3                	cmp    %dl,%bl
    3693:	89 d9                	mov    %ebx,%ecx
    3695:	75 0d                	jne    36a4 <strchr+0x24>
    3697:	eb 17                	jmp    36b0 <strchr+0x30>
    3699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36a0:	38 ca                	cmp    %cl,%dl
    36a2:	74 0c                	je     36b0 <strchr+0x30>
  for(; *s; s++)
    36a4:	83 c0 01             	add    $0x1,%eax
    36a7:	0f b6 10             	movzbl (%eax),%edx
    36aa:	84 d2                	test   %dl,%dl
    36ac:	75 f2                	jne    36a0 <strchr+0x20>
      return (char*)s;
  return 0;
    36ae:	31 c0                	xor    %eax,%eax
}
    36b0:	5b                   	pop    %ebx
    36b1:	5d                   	pop    %ebp
    36b2:	c3                   	ret    
    36b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036c0 <gets>:

char*
gets(char *buf, int max)
{
    36c0:	55                   	push   %ebp
    36c1:	89 e5                	mov    %esp,%ebp
    36c3:	57                   	push   %edi
    36c4:	56                   	push   %esi
    36c5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    36c6:	31 f6                	xor    %esi,%esi
    36c8:	89 f3                	mov    %esi,%ebx
{
    36ca:	83 ec 1c             	sub    $0x1c,%esp
    36cd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    36d0:	eb 2f                	jmp    3701 <gets+0x41>
    36d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    36d8:	8d 45 e7             	lea    -0x19(%ebp),%eax
    36db:	83 ec 04             	sub    $0x4,%esp
    36de:	6a 01                	push   $0x1
    36e0:	50                   	push   %eax
    36e1:	6a 00                	push   $0x0
    36e3:	e8 42 01 00 00       	call   382a <read>
    if(cc < 1)
    36e8:	83 c4 10             	add    $0x10,%esp
    36eb:	85 c0                	test   %eax,%eax
    36ed:	7e 1c                	jle    370b <gets+0x4b>
      break;
    buf[i++] = c;
    36ef:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    36f3:	83 c7 01             	add    $0x1,%edi
    36f6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    36f9:	3c 0a                	cmp    $0xa,%al
    36fb:	74 23                	je     3720 <gets+0x60>
    36fd:	3c 0d                	cmp    $0xd,%al
    36ff:	74 1f                	je     3720 <gets+0x60>
  for(i=0; i+1 < max; ){
    3701:	83 c3 01             	add    $0x1,%ebx
    3704:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    3707:	89 fe                	mov    %edi,%esi
    3709:	7c cd                	jl     36d8 <gets+0x18>
    370b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    370d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    3710:	c6 03 00             	movb   $0x0,(%ebx)
}
    3713:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3716:	5b                   	pop    %ebx
    3717:	5e                   	pop    %esi
    3718:	5f                   	pop    %edi
    3719:	5d                   	pop    %ebp
    371a:	c3                   	ret    
    371b:	90                   	nop
    371c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3720:	8b 75 08             	mov    0x8(%ebp),%esi
    3723:	8b 45 08             	mov    0x8(%ebp),%eax
    3726:	01 de                	add    %ebx,%esi
    3728:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    372a:	c6 03 00             	movb   $0x0,(%ebx)
}
    372d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3730:	5b                   	pop    %ebx
    3731:	5e                   	pop    %esi
    3732:	5f                   	pop    %edi
    3733:	5d                   	pop    %ebp
    3734:	c3                   	ret    
    3735:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003740 <stat>:

int
stat(const char *n, struct stat *st)
{
    3740:	55                   	push   %ebp
    3741:	89 e5                	mov    %esp,%ebp
    3743:	56                   	push   %esi
    3744:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3745:	83 ec 08             	sub    $0x8,%esp
    3748:	6a 00                	push   $0x0
    374a:	ff 75 08             	pushl  0x8(%ebp)
    374d:	e8 08 01 00 00       	call   385a <open>
  if(fd < 0)
    3752:	83 c4 10             	add    $0x10,%esp
    3755:	85 c0                	test   %eax,%eax
    3757:	78 27                	js     3780 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3759:	83 ec 08             	sub    $0x8,%esp
    375c:	ff 75 0c             	pushl  0xc(%ebp)
    375f:	89 c3                	mov    %eax,%ebx
    3761:	50                   	push   %eax
    3762:	e8 0b 01 00 00       	call   3872 <fstat>
  close(fd);
    3767:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    376a:	89 c6                	mov    %eax,%esi
  close(fd);
    376c:	e8 c9 00 00 00       	call   383a <close>
  return r;
    3771:	83 c4 10             	add    $0x10,%esp
}
    3774:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3777:	89 f0                	mov    %esi,%eax
    3779:	5b                   	pop    %ebx
    377a:	5e                   	pop    %esi
    377b:	5d                   	pop    %ebp
    377c:	c3                   	ret    
    377d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    3780:	be ff ff ff ff       	mov    $0xffffffff,%esi
    3785:	eb ed                	jmp    3774 <stat+0x34>
    3787:	89 f6                	mov    %esi,%esi
    3789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003790 <atoi>:

int
atoi(const char *s)
{
    3790:	55                   	push   %ebp
    3791:	89 e5                	mov    %esp,%ebp
    3793:	53                   	push   %ebx
    3794:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3797:	0f be 11             	movsbl (%ecx),%edx
    379a:	8d 42 d0             	lea    -0x30(%edx),%eax
    379d:	3c 09                	cmp    $0x9,%al
  n = 0;
    379f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    37a4:	77 1f                	ja     37c5 <atoi+0x35>
    37a6:	8d 76 00             	lea    0x0(%esi),%esi
    37a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    37b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    37b3:	83 c1 01             	add    $0x1,%ecx
    37b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    37ba:	0f be 11             	movsbl (%ecx),%edx
    37bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    37c0:	80 fb 09             	cmp    $0x9,%bl
    37c3:	76 eb                	jbe    37b0 <atoi+0x20>
  return n;
}
    37c5:	5b                   	pop    %ebx
    37c6:	5d                   	pop    %ebp
    37c7:	c3                   	ret    
    37c8:	90                   	nop
    37c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000037d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    37d0:	55                   	push   %ebp
    37d1:	89 e5                	mov    %esp,%ebp
    37d3:	56                   	push   %esi
    37d4:	53                   	push   %ebx
    37d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    37d8:	8b 45 08             	mov    0x8(%ebp),%eax
    37db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    37de:	85 db                	test   %ebx,%ebx
    37e0:	7e 14                	jle    37f6 <memmove+0x26>
    37e2:	31 d2                	xor    %edx,%edx
    37e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    37e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    37ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    37ef:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    37f2:	39 d3                	cmp    %edx,%ebx
    37f4:	75 f2                	jne    37e8 <memmove+0x18>
  return vdst;
}
    37f6:	5b                   	pop    %ebx
    37f7:	5e                   	pop    %esi
    37f8:	5d                   	pop    %ebp
    37f9:	c3                   	ret    

000037fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    37fa:	b8 01 00 00 00       	mov    $0x1,%eax
    37ff:	cd 40                	int    $0x40
    3801:	c3                   	ret    

00003802 <exit>:
SYSCALL(exit)
    3802:	b8 02 00 00 00       	mov    $0x2,%eax
    3807:	cd 40                	int    $0x40
    3809:	c3                   	ret    

0000380a <wait>:
SYSCALL(wait)
    380a:	b8 03 00 00 00       	mov    $0x3,%eax
    380f:	cd 40                	int    $0x40
    3811:	c3                   	ret    

00003812 <wait2>:
SYSCALL(wait2)
    3812:	b8 17 00 00 00       	mov    $0x17,%eax
    3817:	cd 40                	int    $0x40
    3819:	c3                   	ret    

0000381a <yield>:
SYSCALL(yield)
    381a:	b8 18 00 00 00       	mov    $0x18,%eax
    381f:	cd 40                	int    $0x40
    3821:	c3                   	ret    

00003822 <pipe>:
SYSCALL(pipe)
    3822:	b8 04 00 00 00       	mov    $0x4,%eax
    3827:	cd 40                	int    $0x40
    3829:	c3                   	ret    

0000382a <read>:
SYSCALL(read)
    382a:	b8 05 00 00 00       	mov    $0x5,%eax
    382f:	cd 40                	int    $0x40
    3831:	c3                   	ret    

00003832 <write>:
SYSCALL(write)
    3832:	b8 10 00 00 00       	mov    $0x10,%eax
    3837:	cd 40                	int    $0x40
    3839:	c3                   	ret    

0000383a <close>:
SYSCALL(close)
    383a:	b8 15 00 00 00       	mov    $0x15,%eax
    383f:	cd 40                	int    $0x40
    3841:	c3                   	ret    

00003842 <kill>:
SYSCALL(kill)
    3842:	b8 06 00 00 00       	mov    $0x6,%eax
    3847:	cd 40                	int    $0x40
    3849:	c3                   	ret    

0000384a <set_prio>:
SYSCALL(set_prio)
    384a:	b8 16 00 00 00       	mov    $0x16,%eax
    384f:	cd 40                	int    $0x40
    3851:	c3                   	ret    

00003852 <exec>:
SYSCALL(exec)
    3852:	b8 07 00 00 00       	mov    $0x7,%eax
    3857:	cd 40                	int    $0x40
    3859:	c3                   	ret    

0000385a <open>:
SYSCALL(open)
    385a:	b8 0f 00 00 00       	mov    $0xf,%eax
    385f:	cd 40                	int    $0x40
    3861:	c3                   	ret    

00003862 <mknod>:
SYSCALL(mknod)
    3862:	b8 11 00 00 00       	mov    $0x11,%eax
    3867:	cd 40                	int    $0x40
    3869:	c3                   	ret    

0000386a <unlink>:
SYSCALL(unlink)
    386a:	b8 12 00 00 00       	mov    $0x12,%eax
    386f:	cd 40                	int    $0x40
    3871:	c3                   	ret    

00003872 <fstat>:
SYSCALL(fstat)
    3872:	b8 08 00 00 00       	mov    $0x8,%eax
    3877:	cd 40                	int    $0x40
    3879:	c3                   	ret    

0000387a <link>:
SYSCALL(link)
    387a:	b8 13 00 00 00       	mov    $0x13,%eax
    387f:	cd 40                	int    $0x40
    3881:	c3                   	ret    

00003882 <mkdir>:
SYSCALL(mkdir)
    3882:	b8 14 00 00 00       	mov    $0x14,%eax
    3887:	cd 40                	int    $0x40
    3889:	c3                   	ret    

0000388a <chdir>:
SYSCALL(chdir)
    388a:	b8 09 00 00 00       	mov    $0x9,%eax
    388f:	cd 40                	int    $0x40
    3891:	c3                   	ret    

00003892 <dup>:
SYSCALL(dup)
    3892:	b8 0a 00 00 00       	mov    $0xa,%eax
    3897:	cd 40                	int    $0x40
    3899:	c3                   	ret    

0000389a <getpid>:
SYSCALL(getpid)
    389a:	b8 0b 00 00 00       	mov    $0xb,%eax
    389f:	cd 40                	int    $0x40
    38a1:	c3                   	ret    

000038a2 <sbrk>:
SYSCALL(sbrk)
    38a2:	b8 0c 00 00 00       	mov    $0xc,%eax
    38a7:	cd 40                	int    $0x40
    38a9:	c3                   	ret    

000038aa <sleep>:
SYSCALL(sleep)
    38aa:	b8 0d 00 00 00       	mov    $0xd,%eax
    38af:	cd 40                	int    $0x40
    38b1:	c3                   	ret    

000038b2 <uptime>:
SYSCALL(uptime)
    38b2:	b8 0e 00 00 00       	mov    $0xe,%eax
    38b7:	cd 40                	int    $0x40
    38b9:	c3                   	ret    
    38ba:	66 90                	xchg   %ax,%ax
    38bc:	66 90                	xchg   %ax,%ax
    38be:	66 90                	xchg   %ax,%ax

000038c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    38c0:	55                   	push   %ebp
    38c1:	89 e5                	mov    %esp,%ebp
    38c3:	57                   	push   %edi
    38c4:	56                   	push   %esi
    38c5:	53                   	push   %ebx
    38c6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    38c9:	85 d2                	test   %edx,%edx
{
    38cb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    38ce:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    38d0:	79 76                	jns    3948 <printint+0x88>
    38d2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    38d6:	74 70                	je     3948 <printint+0x88>
    x = -xx;
    38d8:	f7 d8                	neg    %eax
    neg = 1;
    38da:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    38e1:	31 f6                	xor    %esi,%esi
    38e3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    38e6:	eb 0a                	jmp    38f2 <printint+0x32>
    38e8:	90                   	nop
    38e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    38f0:	89 fe                	mov    %edi,%esi
    38f2:	31 d2                	xor    %edx,%edx
    38f4:	8d 7e 01             	lea    0x1(%esi),%edi
    38f7:	f7 f1                	div    %ecx
    38f9:	0f b6 92 64 54 00 00 	movzbl 0x5464(%edx),%edx
  }while((x /= base) != 0);
    3900:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    3902:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    3905:	75 e9                	jne    38f0 <printint+0x30>
  if(neg)
    3907:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    390a:	85 c0                	test   %eax,%eax
    390c:	74 08                	je     3916 <printint+0x56>
    buf[i++] = '-';
    390e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    3913:	8d 7e 02             	lea    0x2(%esi),%edi
    3916:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    391a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    391d:	8d 76 00             	lea    0x0(%esi),%esi
    3920:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    3923:	83 ec 04             	sub    $0x4,%esp
    3926:	83 ee 01             	sub    $0x1,%esi
    3929:	6a 01                	push   $0x1
    392b:	53                   	push   %ebx
    392c:	57                   	push   %edi
    392d:	88 45 d7             	mov    %al,-0x29(%ebp)
    3930:	e8 fd fe ff ff       	call   3832 <write>

  while(--i >= 0)
    3935:	83 c4 10             	add    $0x10,%esp
    3938:	39 de                	cmp    %ebx,%esi
    393a:	75 e4                	jne    3920 <printint+0x60>
    putc(fd, buf[i]);
}
    393c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    393f:	5b                   	pop    %ebx
    3940:	5e                   	pop    %esi
    3941:	5f                   	pop    %edi
    3942:	5d                   	pop    %ebp
    3943:	c3                   	ret    
    3944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    3948:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    394f:	eb 90                	jmp    38e1 <printint+0x21>
    3951:	eb 0d                	jmp    3960 <printf>
    3953:	90                   	nop
    3954:	90                   	nop
    3955:	90                   	nop
    3956:	90                   	nop
    3957:	90                   	nop
    3958:	90                   	nop
    3959:	90                   	nop
    395a:	90                   	nop
    395b:	90                   	nop
    395c:	90                   	nop
    395d:	90                   	nop
    395e:	90                   	nop
    395f:	90                   	nop

00003960 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3960:	55                   	push   %ebp
    3961:	89 e5                	mov    %esp,%ebp
    3963:	57                   	push   %edi
    3964:	56                   	push   %esi
    3965:	53                   	push   %ebx
    3966:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3969:	8b 75 0c             	mov    0xc(%ebp),%esi
    396c:	0f b6 1e             	movzbl (%esi),%ebx
    396f:	84 db                	test   %bl,%bl
    3971:	0f 84 b3 00 00 00    	je     3a2a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
    3977:	8d 45 10             	lea    0x10(%ebp),%eax
    397a:	83 c6 01             	add    $0x1,%esi
  state = 0;
    397d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
    397f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3982:	eb 2f                	jmp    39b3 <printf+0x53>
    3984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3988:	83 f8 25             	cmp    $0x25,%eax
    398b:	0f 84 a7 00 00 00    	je     3a38 <printf+0xd8>
  write(fd, &c, 1);
    3991:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3994:	83 ec 04             	sub    $0x4,%esp
    3997:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    399a:	6a 01                	push   $0x1
    399c:	50                   	push   %eax
    399d:	ff 75 08             	pushl  0x8(%ebp)
    39a0:	e8 8d fe ff ff       	call   3832 <write>
    39a5:	83 c4 10             	add    $0x10,%esp
    39a8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    39ab:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    39af:	84 db                	test   %bl,%bl
    39b1:	74 77                	je     3a2a <printf+0xca>
    if(state == 0){
    39b3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    39b5:	0f be cb             	movsbl %bl,%ecx
    39b8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    39bb:	74 cb                	je     3988 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    39bd:	83 ff 25             	cmp    $0x25,%edi
    39c0:	75 e6                	jne    39a8 <printf+0x48>
      if(c == 'd'){
    39c2:	83 f8 64             	cmp    $0x64,%eax
    39c5:	0f 84 05 01 00 00    	je     3ad0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    39cb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    39d1:	83 f9 70             	cmp    $0x70,%ecx
    39d4:	74 72                	je     3a48 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    39d6:	83 f8 73             	cmp    $0x73,%eax
    39d9:	0f 84 99 00 00 00    	je     3a78 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    39df:	83 f8 63             	cmp    $0x63,%eax
    39e2:	0f 84 08 01 00 00    	je     3af0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    39e8:	83 f8 25             	cmp    $0x25,%eax
    39eb:	0f 84 ef 00 00 00    	je     3ae0 <printf+0x180>
  write(fd, &c, 1);
    39f1:	8d 45 e7             	lea    -0x19(%ebp),%eax
    39f4:	83 ec 04             	sub    $0x4,%esp
    39f7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    39fb:	6a 01                	push   $0x1
    39fd:	50                   	push   %eax
    39fe:	ff 75 08             	pushl  0x8(%ebp)
    3a01:	e8 2c fe ff ff       	call   3832 <write>
    3a06:	83 c4 0c             	add    $0xc,%esp
    3a09:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3a0c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3a0f:	6a 01                	push   $0x1
    3a11:	50                   	push   %eax
    3a12:	ff 75 08             	pushl  0x8(%ebp)
    3a15:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3a18:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    3a1a:	e8 13 fe ff ff       	call   3832 <write>
  for(i = 0; fmt[i]; i++){
    3a1f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    3a23:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    3a26:	84 db                	test   %bl,%bl
    3a28:	75 89                	jne    39b3 <printf+0x53>
    }
  }
}
    3a2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a2d:	5b                   	pop    %ebx
    3a2e:	5e                   	pop    %esi
    3a2f:	5f                   	pop    %edi
    3a30:	5d                   	pop    %ebp
    3a31:	c3                   	ret    
    3a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
    3a38:	bf 25 00 00 00       	mov    $0x25,%edi
    3a3d:	e9 66 ff ff ff       	jmp    39a8 <printf+0x48>
    3a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    3a48:	83 ec 0c             	sub    $0xc,%esp
    3a4b:	b9 10 00 00 00       	mov    $0x10,%ecx
    3a50:	6a 00                	push   $0x0
    3a52:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    3a55:	8b 45 08             	mov    0x8(%ebp),%eax
    3a58:	8b 17                	mov    (%edi),%edx
    3a5a:	e8 61 fe ff ff       	call   38c0 <printint>
        ap++;
    3a5f:	89 f8                	mov    %edi,%eax
    3a61:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3a64:	31 ff                	xor    %edi,%edi
        ap++;
    3a66:	83 c0 04             	add    $0x4,%eax
    3a69:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3a6c:	e9 37 ff ff ff       	jmp    39a8 <printf+0x48>
    3a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    3a78:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3a7b:	8b 08                	mov    (%eax),%ecx
        ap++;
    3a7d:	83 c0 04             	add    $0x4,%eax
    3a80:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    3a83:	85 c9                	test   %ecx,%ecx
    3a85:	0f 84 8e 00 00 00    	je     3b19 <printf+0x1b9>
        while(*s != 0){
    3a8b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    3a8e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    3a90:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    3a92:	84 c0                	test   %al,%al
    3a94:	0f 84 0e ff ff ff    	je     39a8 <printf+0x48>
    3a9a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    3a9d:	89 de                	mov    %ebx,%esi
    3a9f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3aa2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    3aa5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    3aa8:	83 ec 04             	sub    $0x4,%esp
          s++;
    3aab:	83 c6 01             	add    $0x1,%esi
    3aae:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    3ab1:	6a 01                	push   $0x1
    3ab3:	57                   	push   %edi
    3ab4:	53                   	push   %ebx
    3ab5:	e8 78 fd ff ff       	call   3832 <write>
        while(*s != 0){
    3aba:	0f b6 06             	movzbl (%esi),%eax
    3abd:	83 c4 10             	add    $0x10,%esp
    3ac0:	84 c0                	test   %al,%al
    3ac2:	75 e4                	jne    3aa8 <printf+0x148>
    3ac4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    3ac7:	31 ff                	xor    %edi,%edi
    3ac9:	e9 da fe ff ff       	jmp    39a8 <printf+0x48>
    3ace:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    3ad0:	83 ec 0c             	sub    $0xc,%esp
    3ad3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3ad8:	6a 01                	push   $0x1
    3ada:	e9 73 ff ff ff       	jmp    3a52 <printf+0xf2>
    3adf:	90                   	nop
  write(fd, &c, 1);
    3ae0:	83 ec 04             	sub    $0x4,%esp
    3ae3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3ae6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3ae9:	6a 01                	push   $0x1
    3aeb:	e9 21 ff ff ff       	jmp    3a11 <printf+0xb1>
        putc(fd, *ap);
    3af0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    3af3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    3af6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    3af8:	6a 01                	push   $0x1
        ap++;
    3afa:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    3afd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    3b00:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3b03:	50                   	push   %eax
    3b04:	ff 75 08             	pushl  0x8(%ebp)
    3b07:	e8 26 fd ff ff       	call   3832 <write>
        ap++;
    3b0c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    3b0f:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3b12:	31 ff                	xor    %edi,%edi
    3b14:	e9 8f fe ff ff       	jmp    39a8 <printf+0x48>
          s = "(null)";
    3b19:	bb 5c 54 00 00       	mov    $0x545c,%ebx
        while(*s != 0){
    3b1e:	b8 28 00 00 00       	mov    $0x28,%eax
    3b23:	e9 72 ff ff ff       	jmp    3a9a <printf+0x13a>
    3b28:	66 90                	xchg   %ax,%ax
    3b2a:	66 90                	xchg   %ax,%ax
    3b2c:	66 90                	xchg   %ax,%ax
    3b2e:	66 90                	xchg   %ax,%ax

00003b30 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3b30:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b31:	a1 20 5e 00 00       	mov    0x5e20,%eax
{
    3b36:	89 e5                	mov    %esp,%ebp
    3b38:	57                   	push   %edi
    3b39:	56                   	push   %esi
    3b3a:	53                   	push   %ebx
    3b3b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    3b3e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    3b41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b48:	39 c8                	cmp    %ecx,%eax
    3b4a:	8b 10                	mov    (%eax),%edx
    3b4c:	73 32                	jae    3b80 <free+0x50>
    3b4e:	39 d1                	cmp    %edx,%ecx
    3b50:	72 04                	jb     3b56 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b52:	39 d0                	cmp    %edx,%eax
    3b54:	72 32                	jb     3b88 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3b56:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3b59:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3b5c:	39 fa                	cmp    %edi,%edx
    3b5e:	74 30                	je     3b90 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3b60:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3b63:	8b 50 04             	mov    0x4(%eax),%edx
    3b66:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3b69:	39 f1                	cmp    %esi,%ecx
    3b6b:	74 3a                	je     3ba7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3b6d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3b6f:	a3 20 5e 00 00       	mov    %eax,0x5e20
}
    3b74:	5b                   	pop    %ebx
    3b75:	5e                   	pop    %esi
    3b76:	5f                   	pop    %edi
    3b77:	5d                   	pop    %ebp
    3b78:	c3                   	ret    
    3b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b80:	39 d0                	cmp    %edx,%eax
    3b82:	72 04                	jb     3b88 <free+0x58>
    3b84:	39 d1                	cmp    %edx,%ecx
    3b86:	72 ce                	jb     3b56 <free+0x26>
{
    3b88:	89 d0                	mov    %edx,%eax
    3b8a:	eb bc                	jmp    3b48 <free+0x18>
    3b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    3b90:	03 72 04             	add    0x4(%edx),%esi
    3b93:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3b96:	8b 10                	mov    (%eax),%edx
    3b98:	8b 12                	mov    (%edx),%edx
    3b9a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3b9d:	8b 50 04             	mov    0x4(%eax),%edx
    3ba0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3ba3:	39 f1                	cmp    %esi,%ecx
    3ba5:	75 c6                	jne    3b6d <free+0x3d>
    p->s.size += bp->s.size;
    3ba7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    3baa:	a3 20 5e 00 00       	mov    %eax,0x5e20
    p->s.size += bp->s.size;
    3baf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3bb2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3bb5:	89 10                	mov    %edx,(%eax)
}
    3bb7:	5b                   	pop    %ebx
    3bb8:	5e                   	pop    %esi
    3bb9:	5f                   	pop    %edi
    3bba:	5d                   	pop    %ebp
    3bbb:	c3                   	ret    
    3bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003bc0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3bc0:	55                   	push   %ebp
    3bc1:	89 e5                	mov    %esp,%ebp
    3bc3:	57                   	push   %edi
    3bc4:	56                   	push   %esi
    3bc5:	53                   	push   %ebx
    3bc6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3bc9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3bcc:	8b 15 20 5e 00 00    	mov    0x5e20,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3bd2:	8d 78 07             	lea    0x7(%eax),%edi
    3bd5:	c1 ef 03             	shr    $0x3,%edi
    3bd8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3bdb:	85 d2                	test   %edx,%edx
    3bdd:	0f 84 9d 00 00 00    	je     3c80 <malloc+0xc0>
    3be3:	8b 02                	mov    (%edx),%eax
    3be5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3be8:	39 cf                	cmp    %ecx,%edi
    3bea:	76 6c                	jbe    3c58 <malloc+0x98>
    3bec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3bf2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3bf7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    3bfa:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    3c01:	eb 0e                	jmp    3c11 <malloc+0x51>
    3c03:	90                   	nop
    3c04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3c08:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3c0a:	8b 48 04             	mov    0x4(%eax),%ecx
    3c0d:	39 f9                	cmp    %edi,%ecx
    3c0f:	73 47                	jae    3c58 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3c11:	39 05 20 5e 00 00    	cmp    %eax,0x5e20
    3c17:	89 c2                	mov    %eax,%edx
    3c19:	75 ed                	jne    3c08 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    3c1b:	83 ec 0c             	sub    $0xc,%esp
    3c1e:	56                   	push   %esi
    3c1f:	e8 7e fc ff ff       	call   38a2 <sbrk>
  if(p == (char*)-1)
    3c24:	83 c4 10             	add    $0x10,%esp
    3c27:	83 f8 ff             	cmp    $0xffffffff,%eax
    3c2a:	74 1c                	je     3c48 <malloc+0x88>
  hp->s.size = nu;
    3c2c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3c2f:	83 ec 0c             	sub    $0xc,%esp
    3c32:	83 c0 08             	add    $0x8,%eax
    3c35:	50                   	push   %eax
    3c36:	e8 f5 fe ff ff       	call   3b30 <free>
  return freep;
    3c3b:	8b 15 20 5e 00 00    	mov    0x5e20,%edx
      if((p = morecore(nunits)) == 0)
    3c41:	83 c4 10             	add    $0x10,%esp
    3c44:	85 d2                	test   %edx,%edx
    3c46:	75 c0                	jne    3c08 <malloc+0x48>
        return 0;
  }
}
    3c48:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    3c4b:	31 c0                	xor    %eax,%eax
}
    3c4d:	5b                   	pop    %ebx
    3c4e:	5e                   	pop    %esi
    3c4f:	5f                   	pop    %edi
    3c50:	5d                   	pop    %ebp
    3c51:	c3                   	ret    
    3c52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    3c58:	39 cf                	cmp    %ecx,%edi
    3c5a:	74 54                	je     3cb0 <malloc+0xf0>
        p->s.size -= nunits;
    3c5c:	29 f9                	sub    %edi,%ecx
    3c5e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3c61:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3c64:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    3c67:	89 15 20 5e 00 00    	mov    %edx,0x5e20
}
    3c6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    3c70:	83 c0 08             	add    $0x8,%eax
}
    3c73:	5b                   	pop    %ebx
    3c74:	5e                   	pop    %esi
    3c75:	5f                   	pop    %edi
    3c76:	5d                   	pop    %ebp
    3c77:	c3                   	ret    
    3c78:	90                   	nop
    3c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    3c80:	c7 05 20 5e 00 00 24 	movl   $0x5e24,0x5e20
    3c87:	5e 00 00 
    3c8a:	c7 05 24 5e 00 00 24 	movl   $0x5e24,0x5e24
    3c91:	5e 00 00 
    base.s.size = 0;
    3c94:	b8 24 5e 00 00       	mov    $0x5e24,%eax
    3c99:	c7 05 28 5e 00 00 00 	movl   $0x0,0x5e28
    3ca0:	00 00 00 
    3ca3:	e9 44 ff ff ff       	jmp    3bec <malloc+0x2c>
    3ca8:	90                   	nop
    3ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    3cb0:	8b 08                	mov    (%eax),%ecx
    3cb2:	89 0a                	mov    %ecx,(%edx)
    3cb4:	eb b1                	jmp    3c67 <malloc+0xa7>
