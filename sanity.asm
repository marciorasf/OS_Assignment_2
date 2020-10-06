
_sanity:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

#define CONST 5

int main (int argc, char* argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
    if(argc < 2) {
  14:	83 39 01             	cmpl   $0x1,(%ecx)
int main (int argc, char* argv[]) {
  17:	8b 41 04             	mov    0x4(%ecx),%eax
    if(argc < 2) {
  1a:	0f 8e 8b 00 00 00    	jle    ab <main+0xab>
        printf(1, "Please enter first argument\n");
        exit();
    }
    uint n = atoi(argv[1]);
  20:	83 ec 0c             	sub    $0xc,%esp
  23:	ff 70 04             	pushl  0x4(%eax)
  26:	e8 45 03 00 00       	call   370 <atoi>
    int* pid = (int*)malloc(CONST*n*sizeof(int));
  2b:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
  2e:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
  35:	89 04 24             	mov    %eax,(%esp)
  38:	e8 63 07 00 00       	call   7a0 <malloc>
    int i;
    printf(1, "Creating %d processes\n", CONST*n);
  3d:	83 c4 0c             	add    $0xc,%esp
    int* pid = (int*)malloc(CONST*n*sizeof(int));
  40:	89 c6                	mov    %eax,%esi
    printf(1, "Creating %d processes\n", CONST*n);
  42:	53                   	push   %ebx
  43:	68 b5 08 00 00       	push   $0x8b5
  48:	6a 01                	push   $0x1
  4a:	e8 f1 04 00 00       	call   540 <printf>
    for(i = 0; i < CONST*n; ++i) {
  4f:	83 c4 10             	add    $0x10,%esp
  52:	85 db                	test   %ebx,%ebx
  54:	74 50                	je     a6 <main+0xa6>
  56:	31 ff                	xor    %edi,%edi
  58:	eb 0f                	jmp    69 <main+0x69>
  5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        pid[i] = fork();
        if(pid[i] < 0) {
            printf(1, "Fork error");
            exit();
        }
        else if(pid[i] == 0) {
  60:	74 26                	je     88 <main+0x88>
    for(i = 0; i < CONST*n; ++i) {
  62:	83 c7 01             	add    $0x1,%edi
  65:	39 fb                	cmp    %edi,%ebx
  67:	74 55                	je     be <main+0xbe>
        pid[i] = fork();
  69:	e8 6c 03 00 00       	call   3da <fork>
        if(pid[i] < 0) {
  6e:	85 c0                	test   %eax,%eax
        pid[i] = fork();
  70:	89 04 be             	mov    %eax,(%esi,%edi,4)
        if(pid[i] < 0) {
  73:	79 eb                	jns    60 <main+0x60>
            printf(1, "Fork error");
  75:	50                   	push   %eax
  76:	50                   	push   %eax
  77:	68 cc 08 00 00       	push   $0x8cc
  7c:	6a 01                	push   $0x1
  7e:	e8 bd 04 00 00       	call   540 <printf>
            exit();
  83:	e8 5a 03 00 00       	call   3e2 <exit>
            // CPU-BOUND
            if(getpid() % 3 == 0){
  88:	e8 ed 03 00 00       	call   47a <getpid>
  8d:	bb 03 00 00 00       	mov    $0x3,%ebx
  92:	99                   	cltd   
  93:	f7 fb                	idiv   %ebx
  95:	85 d2                	test   %edx,%edx
  97:	75 5c                	jne    f5 <main+0xf5>
                set_prio(HIGH);
  99:	83 ec 0c             	sub    $0xc,%esp
  9c:	6a 02                	push   $0x2
  9e:	e8 87 03 00 00       	call   42a <set_prio>
  a3:	83 c4 10             	add    $0x10,%esp
                uint j;
                for(j = 0; j < 100; ++j) {
                    sleep(1);
                }
            }
            exit();
  a6:	e8 37 03 00 00       	call   3e2 <exit>
        printf(1, "Please enter first argument\n");
  ab:	52                   	push   %edx
  ac:	52                   	push   %edx
  ad:	68 98 08 00 00       	push   $0x898
  b2:	6a 01                	push   $0x1
  b4:	e8 87 04 00 00       	call   540 <printf>
        exit();
  b9:	e8 24 03 00 00       	call   3e2 <exit>
  be:	8d 75 e0             	lea    -0x20(%ebp),%esi
        }
    }
    //int c_pid;
    for (i = 0; i < CONST*n; ++i) {
  c1:	31 db                	xor    %ebx,%ebx
        int retime=0, rutime=0, stime=0;
        //c_pid = 
        wait2(&retime, &rutime, &stime);
  c3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  c6:	83 ec 04             	sub    $0x4,%esp
    for (i = 0; i < CONST*n; ++i) {
  c9:	83 c3 01             	add    $0x1,%ebx
        int retime=0, rutime=0, stime=0;
  cc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  d3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
        wait2(&retime, &rutime, &stime);
  da:	50                   	push   %eax
  db:	8d 45 dc             	lea    -0x24(%ebp),%eax
  de:	56                   	push   %esi
        int retime=0, rutime=0, stime=0;
  df:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
        wait2(&retime, &rutime, &stime);
  e6:	50                   	push   %eax
  e7:	e8 06 03 00 00       	call   3f2 <wait2>
    for (i = 0; i < CONST*n; ++i) {
  ec:	83 c4 10             	add    $0x10,%esp
  ef:	39 fb                	cmp    %edi,%ebx
  f1:	75 d0                	jne    c3 <main+0xc3>
  f3:	eb b1                	jmp    a6 <main+0xa6>
            } else if(getpid() % 3 == 1) {
  f5:	e8 80 03 00 00       	call   47a <getpid>
  fa:	99                   	cltd   
  fb:	f7 fb                	idiv   %ebx
  fd:	83 ea 01             	sub    $0x1,%edx
 100:	74 2d                	je     12f <main+0x12f>
                set_prio(LOW);
 102:	83 ec 0c             	sub    $0xc,%esp
 105:	bb 64 00 00 00       	mov    $0x64,%ebx
 10a:	6a 00                	push   $0x0
 10c:	e8 19 03 00 00       	call   42a <set_prio>
 111:	83 c4 10             	add    $0x10,%esp
 114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                    sleep(1);
 118:	83 ec 0c             	sub    $0xc,%esp
 11b:	6a 01                	push   $0x1
 11d:	e8 68 03 00 00       	call   48a <sleep>
                for(j = 0; j < 100; ++j) {
 122:	83 c4 10             	add    $0x10,%esp
 125:	83 eb 01             	sub    $0x1,%ebx
 128:	75 ee                	jne    118 <main+0x118>
 12a:	e9 77 ff ff ff       	jmp    a6 <main+0xa6>
                set_prio(MEDIUM);
 12f:	83 ec 0c             	sub    $0xc,%esp
 132:	be 64 00 00 00       	mov    $0x64,%esi
                        if (k % 100 == 0){
 137:	bf 1f 85 eb 51       	mov    $0x51eb851f,%edi
                set_prio(MEDIUM);
 13c:	6a 01                	push   $0x1
 13e:	e8 e7 02 00 00       	call   42a <set_prio>
 143:	83 c4 10             	add    $0x10,%esp
 146:	8d 76 00             	lea    0x0(%esi),%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
                    for(k = 0; k < 1000000; ++k) {
 150:	31 db                	xor    %ebx,%ebx
 152:	eb 0f                	jmp    163 <main+0x163>
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 158:	83 c3 01             	add    $0x1,%ebx
 15b:	81 fb 40 42 0f 00    	cmp    $0xf4240,%ebx
 161:	74 1e                	je     181 <main+0x181>
                        if (k % 100 == 0){
 163:	89 d8                	mov    %ebx,%eax
 165:	f7 e7                	mul    %edi
 167:	c1 ea 05             	shr    $0x5,%edx
 16a:	6b d2 64             	imul   $0x64,%edx,%edx
 16d:	39 d3                	cmp    %edx,%ebx
 16f:	75 e7                	jne    158 <main+0x158>
                    for(k = 0; k < 1000000; ++k) {
 171:	83 c3 01             	add    $0x1,%ebx
                            yield();
 174:	e8 81 02 00 00       	call   3fa <yield>
                    for(k = 0; k < 1000000; ++k) {
 179:	81 fb 40 42 0f 00    	cmp    $0xf4240,%ebx
 17f:	75 e2                	jne    163 <main+0x163>
                for(j = 0; j < 100; ++j) {
 181:	83 ee 01             	sub    $0x1,%esi
 184:	75 ca                	jne    150 <main+0x150>
 186:	e9 1b ff ff ff       	jmp    a6 <main+0xa6>
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 19a:	89 c2                	mov    %eax,%edx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1a7:	83 c2 01             	add    $0x1,%edx
 1aa:	84 db                	test   %bl,%bl
 1ac:	88 5a ff             	mov    %bl,-0x1(%edx)
 1af:	75 ef                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1b1:	5b                   	pop    %ebx
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
 1c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ca:	0f b6 02             	movzbl (%edx),%eax
 1cd:	0f b6 19             	movzbl (%ecx),%ebx
 1d0:	84 c0                	test   %al,%al
 1d2:	75 1c                	jne    1f0 <strcmp+0x30>
 1d4:	eb 2a                	jmp    200 <strcmp+0x40>
 1d6:	8d 76 00             	lea    0x0(%esi),%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1e0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1e3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1e6:	83 c1 01             	add    $0x1,%ecx
 1e9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 1ec:	84 c0                	test   %al,%al
 1ee:	74 10                	je     200 <strcmp+0x40>
 1f0:	38 d8                	cmp    %bl,%al
 1f2:	74 ec                	je     1e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1f4:	29 d8                	sub    %ebx,%eax
}
 1f6:	5b                   	pop    %ebx
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 202:	29 d8                	sub    %ebx,%eax
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 39 00             	cmpb   $0x0,(%ecx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 d2                	xor    %edx,%edx
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c2 01             	add    $0x1,%edx
 223:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 227:	89 d0                	mov    %edx,%eax
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 230:	31 c0                	xor    %eax,%eax
}
 232:	5d                   	pop    %ebp
 233:	c3                   	ret    
 234:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 23a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	89 d0                	mov    %edx,%eax
 254:	5f                   	pop    %edi
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	74 1d                	je     28e <strchr+0x2e>
    if(*s == c)
 271:	38 d3                	cmp    %dl,%bl
 273:	89 d9                	mov    %ebx,%ecx
 275:	75 0d                	jne    284 <strchr+0x24>
 277:	eb 17                	jmp    290 <strchr+0x30>
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 280:	38 ca                	cmp    %cl,%dl
 282:	74 0c                	je     290 <strchr+0x30>
  for(; *s; s++)
 284:	83 c0 01             	add    $0x1,%eax
 287:	0f b6 10             	movzbl (%eax),%edx
 28a:	84 d2                	test   %dl,%dl
 28c:	75 f2                	jne    280 <strchr+0x20>
      return (char*)s;
  return 0;
 28e:	31 c0                	xor    %eax,%eax
}
 290:	5b                   	pop    %ebx
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
 2a5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a6:	31 f6                	xor    %esi,%esi
 2a8:	89 f3                	mov    %esi,%ebx
{
 2aa:	83 ec 1c             	sub    $0x1c,%esp
 2ad:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2b0:	eb 2f                	jmp    2e1 <gets+0x41>
 2b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2b8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	6a 01                	push   $0x1
 2c0:	50                   	push   %eax
 2c1:	6a 00                	push   $0x0
 2c3:	e8 42 01 00 00       	call   40a <read>
    if(cc < 1)
 2c8:	83 c4 10             	add    $0x10,%esp
 2cb:	85 c0                	test   %eax,%eax
 2cd:	7e 1c                	jle    2eb <gets+0x4b>
      break;
    buf[i++] = c;
 2cf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d3:	83 c7 01             	add    $0x1,%edi
 2d6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2d9:	3c 0a                	cmp    $0xa,%al
 2db:	74 23                	je     300 <gets+0x60>
 2dd:	3c 0d                	cmp    $0xd,%al
 2df:	74 1f                	je     300 <gets+0x60>
  for(i=0; i+1 < max; ){
 2e1:	83 c3 01             	add    $0x1,%ebx
 2e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2e7:	89 fe                	mov    %edi,%esi
 2e9:	7c cd                	jl     2b8 <gets+0x18>
 2eb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2ed:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2f0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2f6:	5b                   	pop    %ebx
 2f7:	5e                   	pop    %esi
 2f8:	5f                   	pop    %edi
 2f9:	5d                   	pop    %ebp
 2fa:	c3                   	ret    
 2fb:	90                   	nop
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 300:	8b 75 08             	mov    0x8(%ebp),%esi
 303:	8b 45 08             	mov    0x8(%ebp),%eax
 306:	01 de                	add    %ebx,%esi
 308:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 30a:	c6 03 00             	movb   $0x0,(%ebx)
}
 30d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 310:	5b                   	pop    %ebx
 311:	5e                   	pop    %esi
 312:	5f                   	pop    %edi
 313:	5d                   	pop    %ebp
 314:	c3                   	ret    
 315:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <stat>:

int
stat(const char *n, struct stat *st)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 325:	83 ec 08             	sub    $0x8,%esp
 328:	6a 00                	push   $0x0
 32a:	ff 75 08             	pushl  0x8(%ebp)
 32d:	e8 08 01 00 00       	call   43a <open>
  if(fd < 0)
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	78 27                	js     360 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	ff 75 0c             	pushl  0xc(%ebp)
 33f:	89 c3                	mov    %eax,%ebx
 341:	50                   	push   %eax
 342:	e8 0b 01 00 00       	call   452 <fstat>
  close(fd);
 347:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 34a:	89 c6                	mov    %eax,%esi
  close(fd);
 34c:	e8 c9 00 00 00       	call   41a <close>
  return r;
 351:	83 c4 10             	add    $0x10,%esp
}
 354:	8d 65 f8             	lea    -0x8(%ebp),%esp
 357:	89 f0                	mov    %esi,%eax
 359:	5b                   	pop    %ebx
 35a:	5e                   	pop    %esi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    
 35d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 360:	be ff ff ff ff       	mov    $0xffffffff,%esi
 365:	eb ed                	jmp    354 <stat+0x34>
 367:	89 f6                	mov    %esi,%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <atoi>:

int
atoi(const char *s)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 377:	0f be 11             	movsbl (%ecx),%edx
 37a:	8d 42 d0             	lea    -0x30(%edx),%eax
 37d:	3c 09                	cmp    $0x9,%al
  n = 0;
 37f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 384:	77 1f                	ja     3a5 <atoi+0x35>
 386:	8d 76 00             	lea    0x0(%esi),%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 390:	8d 04 80             	lea    (%eax,%eax,4),%eax
 393:	83 c1 01             	add    $0x1,%ecx
 396:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 39a:	0f be 11             	movsbl (%ecx),%edx
 39d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3a0:	80 fb 09             	cmp    $0x9,%bl
 3a3:	76 eb                	jbe    390 <atoi+0x20>
  return n;
}
 3a5:	5b                   	pop    %ebx
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    
 3a8:	90                   	nop
 3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	56                   	push   %esi
 3b4:	53                   	push   %ebx
 3b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3b8:	8b 45 08             	mov    0x8(%ebp),%eax
 3bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3be:	85 db                	test   %ebx,%ebx
 3c0:	7e 14                	jle    3d6 <memmove+0x26>
 3c2:	31 d2                	xor    %edx,%edx
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3cf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3d2:	39 d3                	cmp    %edx,%ebx
 3d4:	75 f2                	jne    3c8 <memmove+0x18>
  return vdst;
}
 3d6:	5b                   	pop    %ebx
 3d7:	5e                   	pop    %esi
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    

000003da <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3da:	b8 01 00 00 00       	mov    $0x1,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <exit>:
SYSCALL(exit)
 3e2:	b8 02 00 00 00       	mov    $0x2,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <wait>:
SYSCALL(wait)
 3ea:	b8 03 00 00 00       	mov    $0x3,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <wait2>:
SYSCALL(wait2)
 3f2:	b8 17 00 00 00       	mov    $0x17,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <yield>:
SYSCALL(yield)
 3fa:	b8 18 00 00 00       	mov    $0x18,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <pipe>:
SYSCALL(pipe)
 402:	b8 04 00 00 00       	mov    $0x4,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <read>:
SYSCALL(read)
 40a:	b8 05 00 00 00       	mov    $0x5,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <write>:
SYSCALL(write)
 412:	b8 10 00 00 00       	mov    $0x10,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <close>:
SYSCALL(close)
 41a:	b8 15 00 00 00       	mov    $0x15,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <kill>:
SYSCALL(kill)
 422:	b8 06 00 00 00       	mov    $0x6,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <set_prio>:
SYSCALL(set_prio)
 42a:	b8 16 00 00 00       	mov    $0x16,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <exec>:
SYSCALL(exec)
 432:	b8 07 00 00 00       	mov    $0x7,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <open>:
SYSCALL(open)
 43a:	b8 0f 00 00 00       	mov    $0xf,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <mknod>:
SYSCALL(mknod)
 442:	b8 11 00 00 00       	mov    $0x11,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <unlink>:
SYSCALL(unlink)
 44a:	b8 12 00 00 00       	mov    $0x12,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <fstat>:
SYSCALL(fstat)
 452:	b8 08 00 00 00       	mov    $0x8,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <link>:
SYSCALL(link)
 45a:	b8 13 00 00 00       	mov    $0x13,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <mkdir>:
SYSCALL(mkdir)
 462:	b8 14 00 00 00       	mov    $0x14,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <chdir>:
SYSCALL(chdir)
 46a:	b8 09 00 00 00       	mov    $0x9,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <dup>:
SYSCALL(dup)
 472:	b8 0a 00 00 00       	mov    $0xa,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <getpid>:
SYSCALL(getpid)
 47a:	b8 0b 00 00 00       	mov    $0xb,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <sbrk>:
SYSCALL(sbrk)
 482:	b8 0c 00 00 00       	mov    $0xc,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <sleep>:
SYSCALL(sleep)
 48a:	b8 0d 00 00 00       	mov    $0xd,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <uptime>:
SYSCALL(uptime)
 492:	b8 0e 00 00 00       	mov    $0xe,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    
 49a:	66 90                	xchg   %ax,%ax
 49c:	66 90                	xchg   %ax,%ax
 49e:	66 90                	xchg   %ax,%ax

000004a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4a9:	85 d2                	test   %edx,%edx
{
 4ab:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 4ae:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 4b0:	79 76                	jns    528 <printint+0x88>
 4b2:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4b6:	74 70                	je     528 <printint+0x88>
    x = -xx;
 4b8:	f7 d8                	neg    %eax
    neg = 1;
 4ba:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4c1:	31 f6                	xor    %esi,%esi
 4c3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4c6:	eb 0a                	jmp    4d2 <printint+0x32>
 4c8:	90                   	nop
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 4d0:	89 fe                	mov    %edi,%esi
 4d2:	31 d2                	xor    %edx,%edx
 4d4:	8d 7e 01             	lea    0x1(%esi),%edi
 4d7:	f7 f1                	div    %ecx
 4d9:	0f b6 92 e0 08 00 00 	movzbl 0x8e0(%edx),%edx
  }while((x /= base) != 0);
 4e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 4e2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 4e5:	75 e9                	jne    4d0 <printint+0x30>
  if(neg)
 4e7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4ea:	85 c0                	test   %eax,%eax
 4ec:	74 08                	je     4f6 <printint+0x56>
    buf[i++] = '-';
 4ee:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4f3:	8d 7e 02             	lea    0x2(%esi),%edi
 4f6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 4fa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
 500:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 503:	83 ec 04             	sub    $0x4,%esp
 506:	83 ee 01             	sub    $0x1,%esi
 509:	6a 01                	push   $0x1
 50b:	53                   	push   %ebx
 50c:	57                   	push   %edi
 50d:	88 45 d7             	mov    %al,-0x29(%ebp)
 510:	e8 fd fe ff ff       	call   412 <write>

  while(--i >= 0)
 515:	83 c4 10             	add    $0x10,%esp
 518:	39 de                	cmp    %ebx,%esi
 51a:	75 e4                	jne    500 <printint+0x60>
    putc(fd, buf[i]);
}
 51c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5f                   	pop    %edi
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 528:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 52f:	eb 90                	jmp    4c1 <printint+0x21>
 531:	eb 0d                	jmp    540 <printf>
 533:	90                   	nop
 534:	90                   	nop
 535:	90                   	nop
 536:	90                   	nop
 537:	90                   	nop
 538:	90                   	nop
 539:	90                   	nop
 53a:	90                   	nop
 53b:	90                   	nop
 53c:	90                   	nop
 53d:	90                   	nop
 53e:	90                   	nop
 53f:	90                   	nop

00000540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 549:	8b 75 0c             	mov    0xc(%ebp),%esi
 54c:	0f b6 1e             	movzbl (%esi),%ebx
 54f:	84 db                	test   %bl,%bl
 551:	0f 84 b3 00 00 00    	je     60a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 557:	8d 45 10             	lea    0x10(%ebp),%eax
 55a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 55d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 55f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 562:	eb 2f                	jmp    593 <printf+0x53>
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	0f 84 a7 00 00 00    	je     618 <printf+0xd8>
  write(fd, &c, 1);
 571:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 574:	83 ec 04             	sub    $0x4,%esp
 577:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 57a:	6a 01                	push   $0x1
 57c:	50                   	push   %eax
 57d:	ff 75 08             	pushl  0x8(%ebp)
 580:	e8 8d fe ff ff       	call   412 <write>
 585:	83 c4 10             	add    $0x10,%esp
 588:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 58b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 58f:	84 db                	test   %bl,%bl
 591:	74 77                	je     60a <printf+0xca>
    if(state == 0){
 593:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 595:	0f be cb             	movsbl %bl,%ecx
 598:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 59b:	74 cb                	je     568 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 59d:	83 ff 25             	cmp    $0x25,%edi
 5a0:	75 e6                	jne    588 <printf+0x48>
      if(c == 'd'){
 5a2:	83 f8 64             	cmp    $0x64,%eax
 5a5:	0f 84 05 01 00 00    	je     6b0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5ab:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5b1:	83 f9 70             	cmp    $0x70,%ecx
 5b4:	74 72                	je     628 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5b6:	83 f8 73             	cmp    $0x73,%eax
 5b9:	0f 84 99 00 00 00    	je     658 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5bf:	83 f8 63             	cmp    $0x63,%eax
 5c2:	0f 84 08 01 00 00    	je     6d0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5c8:	83 f8 25             	cmp    $0x25,%eax
 5cb:	0f 84 ef 00 00 00    	je     6c0 <printf+0x180>
  write(fd, &c, 1);
 5d1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5d4:	83 ec 04             	sub    $0x4,%esp
 5d7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5db:	6a 01                	push   $0x1
 5dd:	50                   	push   %eax
 5de:	ff 75 08             	pushl  0x8(%ebp)
 5e1:	e8 2c fe ff ff       	call   412 <write>
 5e6:	83 c4 0c             	add    $0xc,%esp
 5e9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5ec:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5ef:	6a 01                	push   $0x1
 5f1:	50                   	push   %eax
 5f2:	ff 75 08             	pushl  0x8(%ebp)
 5f5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5f8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5fa:	e8 13 fe ff ff       	call   412 <write>
  for(i = 0; fmt[i]; i++){
 5ff:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 603:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 606:	84 db                	test   %bl,%bl
 608:	75 89                	jne    593 <printf+0x53>
    }
  }
}
 60a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60d:	5b                   	pop    %ebx
 60e:	5e                   	pop    %esi
 60f:	5f                   	pop    %edi
 610:	5d                   	pop    %ebp
 611:	c3                   	ret    
 612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 618:	bf 25 00 00 00       	mov    $0x25,%edi
 61d:	e9 66 ff ff ff       	jmp    588 <printf+0x48>
 622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 628:	83 ec 0c             	sub    $0xc,%esp
 62b:	b9 10 00 00 00       	mov    $0x10,%ecx
 630:	6a 00                	push   $0x0
 632:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 635:	8b 45 08             	mov    0x8(%ebp),%eax
 638:	8b 17                	mov    (%edi),%edx
 63a:	e8 61 fe ff ff       	call   4a0 <printint>
        ap++;
 63f:	89 f8                	mov    %edi,%eax
 641:	83 c4 10             	add    $0x10,%esp
      state = 0;
 644:	31 ff                	xor    %edi,%edi
        ap++;
 646:	83 c0 04             	add    $0x4,%eax
 649:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 64c:	e9 37 ff ff ff       	jmp    588 <printf+0x48>
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 658:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 65b:	8b 08                	mov    (%eax),%ecx
        ap++;
 65d:	83 c0 04             	add    $0x4,%eax
 660:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 663:	85 c9                	test   %ecx,%ecx
 665:	0f 84 8e 00 00 00    	je     6f9 <printf+0x1b9>
        while(*s != 0){
 66b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 66e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 670:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 672:	84 c0                	test   %al,%al
 674:	0f 84 0e ff ff ff    	je     588 <printf+0x48>
 67a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 67d:	89 de                	mov    %ebx,%esi
 67f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 682:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 685:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 688:	83 ec 04             	sub    $0x4,%esp
          s++;
 68b:	83 c6 01             	add    $0x1,%esi
 68e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 691:	6a 01                	push   $0x1
 693:	57                   	push   %edi
 694:	53                   	push   %ebx
 695:	e8 78 fd ff ff       	call   412 <write>
        while(*s != 0){
 69a:	0f b6 06             	movzbl (%esi),%eax
 69d:	83 c4 10             	add    $0x10,%esp
 6a0:	84 c0                	test   %al,%al
 6a2:	75 e4                	jne    688 <printf+0x148>
 6a4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 6a7:	31 ff                	xor    %edi,%edi
 6a9:	e9 da fe ff ff       	jmp    588 <printf+0x48>
 6ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 6b0:	83 ec 0c             	sub    $0xc,%esp
 6b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6b8:	6a 01                	push   $0x1
 6ba:	e9 73 ff ff ff       	jmp    632 <printf+0xf2>
 6bf:	90                   	nop
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
 6c3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6c6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6c9:	6a 01                	push   $0x1
 6cb:	e9 21 ff ff ff       	jmp    5f1 <printf+0xb1>
        putc(fd, *ap);
 6d0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 6d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6d6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 6d8:	6a 01                	push   $0x1
        ap++;
 6da:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 6dd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6e0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6e3:	50                   	push   %eax
 6e4:	ff 75 08             	pushl  0x8(%ebp)
 6e7:	e8 26 fd ff ff       	call   412 <write>
        ap++;
 6ec:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6ef:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f2:	31 ff                	xor    %edi,%edi
 6f4:	e9 8f fe ff ff       	jmp    588 <printf+0x48>
          s = "(null)";
 6f9:	bb d7 08 00 00       	mov    $0x8d7,%ebx
        while(*s != 0){
 6fe:	b8 28 00 00 00       	mov    $0x28,%eax
 703:	e9 72 ff ff ff       	jmp    67a <printf+0x13a>
 708:	66 90                	xchg   %ax,%ax
 70a:	66 90                	xchg   %ax,%ax
 70c:	66 90                	xchg   %ax,%ax
 70e:	66 90                	xchg   %ax,%ax

00000710 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 710:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 711:	a1 90 0b 00 00       	mov    0xb90,%eax
{
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 71e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 728:	39 c8                	cmp    %ecx,%eax
 72a:	8b 10                	mov    (%eax),%edx
 72c:	73 32                	jae    760 <free+0x50>
 72e:	39 d1                	cmp    %edx,%ecx
 730:	72 04                	jb     736 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 732:	39 d0                	cmp    %edx,%eax
 734:	72 32                	jb     768 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 736:	8b 73 fc             	mov    -0x4(%ebx),%esi
 739:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73c:	39 fa                	cmp    %edi,%edx
 73e:	74 30                	je     770 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 740:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 743:	8b 50 04             	mov    0x4(%eax),%edx
 746:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 749:	39 f1                	cmp    %esi,%ecx
 74b:	74 3a                	je     787 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 74d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 74f:	a3 90 0b 00 00       	mov    %eax,0xb90
}
 754:	5b                   	pop    %ebx
 755:	5e                   	pop    %esi
 756:	5f                   	pop    %edi
 757:	5d                   	pop    %ebp
 758:	c3                   	ret    
 759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 760:	39 d0                	cmp    %edx,%eax
 762:	72 04                	jb     768 <free+0x58>
 764:	39 d1                	cmp    %edx,%ecx
 766:	72 ce                	jb     736 <free+0x26>
{
 768:	89 d0                	mov    %edx,%eax
 76a:	eb bc                	jmp    728 <free+0x18>
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 770:	03 72 04             	add    0x4(%edx),%esi
 773:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 776:	8b 10                	mov    (%eax),%edx
 778:	8b 12                	mov    (%edx),%edx
 77a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 77d:	8b 50 04             	mov    0x4(%eax),%edx
 780:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 783:	39 f1                	cmp    %esi,%ecx
 785:	75 c6                	jne    74d <free+0x3d>
    p->s.size += bp->s.size;
 787:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 78a:	a3 90 0b 00 00       	mov    %eax,0xb90
    p->s.size += bp->s.size;
 78f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 792:	8b 53 f8             	mov    -0x8(%ebx),%edx
 795:	89 10                	mov    %edx,(%eax)
}
 797:	5b                   	pop    %ebx
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7a0:	55                   	push   %ebp
 7a1:	89 e5                	mov    %esp,%ebp
 7a3:	57                   	push   %edi
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ac:	8b 15 90 0b 00 00    	mov    0xb90,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b2:	8d 78 07             	lea    0x7(%eax),%edi
 7b5:	c1 ef 03             	shr    $0x3,%edi
 7b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7bb:	85 d2                	test   %edx,%edx
 7bd:	0f 84 9d 00 00 00    	je     860 <malloc+0xc0>
 7c3:	8b 02                	mov    (%edx),%eax
 7c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7c8:	39 cf                	cmp    %ecx,%edi
 7ca:	76 6c                	jbe    838 <malloc+0x98>
 7cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7d7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7da:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7e1:	eb 0e                	jmp    7f1 <malloc+0x51>
 7e3:	90                   	nop
 7e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ea:	8b 48 04             	mov    0x4(%eax),%ecx
 7ed:	39 f9                	cmp    %edi,%ecx
 7ef:	73 47                	jae    838 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7f1:	39 05 90 0b 00 00    	cmp    %eax,0xb90
 7f7:	89 c2                	mov    %eax,%edx
 7f9:	75 ed                	jne    7e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7fb:	83 ec 0c             	sub    $0xc,%esp
 7fe:	56                   	push   %esi
 7ff:	e8 7e fc ff ff       	call   482 <sbrk>
  if(p == (char*)-1)
 804:	83 c4 10             	add    $0x10,%esp
 807:	83 f8 ff             	cmp    $0xffffffff,%eax
 80a:	74 1c                	je     828 <malloc+0x88>
  hp->s.size = nu;
 80c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 80f:	83 ec 0c             	sub    $0xc,%esp
 812:	83 c0 08             	add    $0x8,%eax
 815:	50                   	push   %eax
 816:	e8 f5 fe ff ff       	call   710 <free>
  return freep;
 81b:	8b 15 90 0b 00 00    	mov    0xb90,%edx
      if((p = morecore(nunits)) == 0)
 821:	83 c4 10             	add    $0x10,%esp
 824:	85 d2                	test   %edx,%edx
 826:	75 c0                	jne    7e8 <malloc+0x48>
        return 0;
  }
}
 828:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 82b:	31 c0                	xor    %eax,%eax
}
 82d:	5b                   	pop    %ebx
 82e:	5e                   	pop    %esi
 82f:	5f                   	pop    %edi
 830:	5d                   	pop    %ebp
 831:	c3                   	ret    
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 838:	39 cf                	cmp    %ecx,%edi
 83a:	74 54                	je     890 <malloc+0xf0>
        p->s.size -= nunits;
 83c:	29 f9                	sub    %edi,%ecx
 83e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 841:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 844:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 847:	89 15 90 0b 00 00    	mov    %edx,0xb90
}
 84d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 850:	83 c0 08             	add    $0x8,%eax
}
 853:	5b                   	pop    %ebx
 854:	5e                   	pop    %esi
 855:	5f                   	pop    %edi
 856:	5d                   	pop    %ebp
 857:	c3                   	ret    
 858:	90                   	nop
 859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 860:	c7 05 90 0b 00 00 94 	movl   $0xb94,0xb90
 867:	0b 00 00 
 86a:	c7 05 94 0b 00 00 94 	movl   $0xb94,0xb94
 871:	0b 00 00 
    base.s.size = 0;
 874:	b8 94 0b 00 00       	mov    $0xb94,%eax
 879:	c7 05 98 0b 00 00 00 	movl   $0x0,0xb98
 880:	00 00 00 
 883:	e9 44 ff ff ff       	jmp    7cc <malloc+0x2c>
 888:	90                   	nop
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 890:	8b 08                	mov    (%eax),%ecx
 892:	89 0a                	mov    %ecx,(%edx)
 894:	eb b1                	jmp    847 <malloc+0xa7>
