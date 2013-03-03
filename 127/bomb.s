
bomb:     file format elf32-i386


Disassembly of section .init:

080483b8 <.init>:
 80483b8:	55                   	push   %ebp
 80483b9:	89 e5                	mov    %esp,%ebp
 80483bb:	53                   	push   %ebx
 80483bc:	83 ec 04             	sub    $0x4,%esp
 80483bf:	e8 00 00 00 00       	call   80483c4 <signal@plt-0x34>
 80483c4:	5b                   	pop    %ebx
 80483c5:	81 c3 30 1c 00 00    	add    $0x1c30,%ebx
 80483cb:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 80483d1:	85 d2                	test   %edx,%edx
 80483d3:	74 05                	je     80483da <signal@plt-0x1e>
 80483d5:	e8 2e 00 00 00       	call   8048408 <__gmon_start__@plt>
 80483da:	e8 41 01 00 00       	call   8048520 <strcmp@plt+0xa8>
 80483df:	e8 cc 02 00 00       	call   80486b0 <strcmp@plt+0x238>
 80483e4:	58                   	pop    %eax
 80483e5:	5b                   	pop    %ebx
 80483e6:	c9                   	leave  
 80483e7:	c3                   	ret    

Disassembly of section .plt:

080483e8 <signal@plt-0x10>:
 80483e8:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 80483ee:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 80483f4:	00 00                	add    %al,(%eax)
	...

080483f8 <signal@plt>:
 80483f8:	ff 25 00 a0 04 08    	jmp    *0x804a000
 80483fe:	68 00 00 00 00       	push   $0x0
 8048403:	e9 e0 ff ff ff       	jmp    80483e8 <signal@plt-0x10>

08048408 <__gmon_start__@plt>:
 8048408:	ff 25 04 a0 04 08    	jmp    *0x804a004
 804840e:	68 08 00 00 00       	push   $0x8
 8048413:	e9 d0 ff ff ff       	jmp    80483e8 <signal@plt-0x10>

08048418 <ptrace@plt>:
 8048418:	ff 25 08 a0 04 08    	jmp    *0x804a008
 804841e:	68 10 00 00 00       	push   $0x10
 8048423:	e9 c0 ff ff ff       	jmp    80483e8 <signal@plt-0x10>

08048428 <gets@plt>:
 8048428:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 804842e:	68 18 00 00 00       	push   $0x18
 8048433:	e9 b0 ff ff ff       	jmp    80483e8 <signal@plt-0x10>

08048438 <__libc_start_main@plt>:
 8048438:	ff 25 10 a0 04 08    	jmp    *0x804a010
 804843e:	68 20 00 00 00       	push   $0x20
 8048443:	e9 a0 ff ff ff       	jmp    80483e8 <signal@plt-0x10>

08048448 <printf@plt>:
 8048448:	ff 25 14 a0 04 08    	jmp    *0x804a014
 804844e:	68 28 00 00 00       	push   $0x28
 8048453:	e9 90 ff ff ff       	jmp    80483e8 <signal@plt-0x10>

08048458 <__stack_chk_fail@plt>:
 8048458:	ff 25 18 a0 04 08    	jmp    *0x804a018
 804845e:	68 30 00 00 00       	push   $0x30
 8048463:	e9 80 ff ff ff       	jmp    80483e8 <signal@plt-0x10>

08048468 <puts@plt>:
 8048468:	ff 25 1c a0 04 08    	jmp    *0x804a01c
 804846e:	68 38 00 00 00       	push   $0x38
 8048473:	e9 70 ff ff ff       	jmp    80483e8 <signal@plt-0x10>

08048478 <strcmp@plt>:
 8048478:	ff 25 20 a0 04 08    	jmp    *0x804a020
 804847e:	68 40 00 00 00       	push   $0x40
 8048483:	e9 60 ff ff ff       	jmp    80483e8 <signal@plt-0x10>

Disassembly of section .text:

08048490 <.text>:
 8048490:	31 ed                	xor    %ebp,%ebp
 8048492:	5e                   	pop    %esi
 8048493:	89 e1                	mov    %esp,%ecx
 8048495:	83 e4 f0             	and    $0xfffffff0,%esp
 8048498:	50                   	push   %eax
 8048499:	54                   	push   %esp
 804849a:	52                   	push   %edx
 804849b:	68 40 86 04 08       	push   $0x8048640
 80484a0:	68 50 86 04 08       	push   $0x8048650
 80484a5:	51                   	push   %ecx
 80484a6:	56                   	push   %esi
 80484a7:	68 44 85 04 08       	push   $0x8048544
 80484ac:	e8 87 ff ff ff       	call   8048438 <__libc_start_main@plt>
 80484b1:	f4                   	hlt    
 80484b2:	90                   	nop
 80484b3:	90                   	nop
 80484b4:	90                   	nop
 80484b5:	90                   	nop
 80484b6:	90                   	nop
 80484b7:	90                   	nop
 80484b8:	90                   	nop
 80484b9:	90                   	nop
 80484ba:	90                   	nop
 80484bb:	90                   	nop
 80484bc:	90                   	nop
 80484bd:	90                   	nop
 80484be:	90                   	nop
 80484bf:	90                   	nop
 80484c0:	55                   	push   %ebp
 80484c1:	89 e5                	mov    %esp,%ebp
 80484c3:	53                   	push   %ebx
 80484c4:	83 ec 04             	sub    $0x4,%esp
 80484c7:	80 3d 68 a1 04 08 00 	cmpb   $0x0,0x804a168
 80484ce:	75 3f                	jne    804850f <strcmp@plt+0x97>
 80484d0:	a1 6c a1 04 08       	mov    0x804a16c,%eax
 80484d5:	bb 18 9f 04 08       	mov    $0x8049f18,%ebx
 80484da:	81 eb 14 9f 04 08    	sub    $0x8049f14,%ebx
 80484e0:	c1 fb 02             	sar    $0x2,%ebx
 80484e3:	83 eb 01             	sub    $0x1,%ebx
 80484e6:	39 d8                	cmp    %ebx,%eax
 80484e8:	73 1e                	jae    8048508 <strcmp@plt+0x90>
 80484ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80484f0:	83 c0 01             	add    $0x1,%eax
 80484f3:	a3 6c a1 04 08       	mov    %eax,0x804a16c
 80484f8:	ff 14 85 14 9f 04 08 	call   *0x8049f14(,%eax,4)
 80484ff:	a1 6c a1 04 08       	mov    0x804a16c,%eax
 8048504:	39 d8                	cmp    %ebx,%eax
 8048506:	72 e8                	jb     80484f0 <strcmp@plt+0x78>
 8048508:	c6 05 68 a1 04 08 01 	movb   $0x1,0x804a168
 804850f:	83 c4 04             	add    $0x4,%esp
 8048512:	5b                   	pop    %ebx
 8048513:	5d                   	pop    %ebp
 8048514:	c3                   	ret    
 8048515:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048520:	55                   	push   %ebp
 8048521:	89 e5                	mov    %esp,%ebp
 8048523:	83 ec 18             	sub    $0x18,%esp
 8048526:	a1 1c 9f 04 08       	mov    0x8049f1c,%eax
 804852b:	85 c0                	test   %eax,%eax
 804852d:	74 12                	je     8048541 <strcmp@plt+0xc9>
 804852f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048534:	85 c0                	test   %eax,%eax
 8048536:	74 09                	je     8048541 <strcmp@plt+0xc9>
 8048538:	c7 04 24 1c 9f 04 08 	movl   $0x8049f1c,(%esp)
 804853f:	ff d0                	call   *%eax
 8048541:	c9                   	leave  
 8048542:	c3                   	ret    
 8048543:	90                   	nop
 8048544:	55                   	push   %ebp
 8048545:	89 e5                	mov    %esp,%ebp
 8048547:	83 e4 f0             	and    $0xfffffff0,%esp
 804854a:	57                   	push   %edi
 804854b:	53                   	push   %ebx
 804854c:	81 ec c8 00 00 00    	sub    $0xc8,%esp
 8048552:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 8048558:	89 84 24 bc 00 00 00 	mov    %eax,0xbc(%esp)
 804855f:	31 c0                	xor    %eax,%eax
 8048561:	8d 5c 24 1c          	lea    0x1c(%esp),%ebx
 8048565:	b8 00 00 00 00       	mov    $0x0,%eax
 804856a:	ba 20 00 00 00       	mov    $0x20,%edx
 804856f:	89 df                	mov    %ebx,%edi
 8048571:	89 d1                	mov    %edx,%ecx
 8048573:	f3 ab                	rep stos %eax,%es:(%edi)
 8048575:	8d 94 24 9c 00 00 00 	lea    0x9c(%esp),%edx
 804857c:	b9 00 00 00 00       	mov    $0x0,%ecx
 8048581:	b8 20 00 00 00       	mov    $0x20,%eax
 8048586:	89 c3                	mov    %eax,%ebx
 8048588:	83 e3 fc             	and    $0xfffffffc,%ebx
 804858b:	b8 00 00 00 00       	mov    $0x0,%eax
 8048590:	89 0c 02             	mov    %ecx,(%edx,%eax,1)
 8048593:	83 c0 04             	add    $0x4,%eax
 8048596:	39 d8                	cmp    %ebx,%eax
 8048598:	72 f6                	jb     8048590 <strcmp@plt+0x118>
 804859a:	01 c2                	add    %eax,%edx
 804859c:	c6 84 24 9c 00 00 00 	movb   $0x68,0x9c(%esp)
 80485a3:	68 
 80485a4:	c6 84 24 9d 00 00 00 	movb   $0x65,0x9d(%esp)
 80485ab:	65 
 80485ac:	c6 84 24 9e 00 00 00 	movb   $0x6c,0x9e(%esp)
 80485b3:	6c 
 80485b4:	c6 84 24 9f 00 00 00 	movb   $0x6c,0x9f(%esp)
 80485bb:	6c 
 80485bc:	c6 84 24 a0 00 00 00 	movb   $0x6f,0xa0(%esp)
 80485c3:	6f 
 80485c4:	c7 04 24 00 87 04 08 	movl   $0x8048700,(%esp)
 80485cb:	e8 98 fe ff ff       	call   8048468 <puts@plt>
 80485d0:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 80485d4:	89 04 24             	mov    %eax,(%esp)
 80485d7:	e8 4c fe ff ff       	call   8048428 <gets@plt>
 80485dc:	8d 84 24 9c 00 00 00 	lea    0x9c(%esp),%eax
 80485e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 80485e7:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 80485eb:	89 04 24             	mov    %eax,(%esp)
 80485ee:	e8 85 fe ff ff       	call   8048478 <strcmp@plt>
 80485f3:	85 c0                	test   %eax,%eax
 80485f5:	75 0e                	jne    8048605 <strcmp@plt+0x18d>
 80485f7:	c7 04 24 1e 87 04 08 	movl   $0x804871e,(%esp)
 80485fe:	e8 65 fe ff ff       	call   8048468 <puts@plt>
 8048603:	eb 0c                	jmp    8048611 <strcmp@plt+0x199>
 8048605:	c7 04 24 3c 87 04 08 	movl   $0x804873c,(%esp)
 804860c:	e8 57 fe ff ff       	call   8048468 <puts@plt>
 8048611:	b8 00 00 00 00       	mov    $0x0,%eax
 8048616:	8b 94 24 bc 00 00 00 	mov    0xbc(%esp),%edx
 804861d:	65 33 15 14 00 00 00 	xor    %gs:0x14,%edx
 8048624:	74 05                	je     804862b <strcmp@plt+0x1b3>
 8048626:	e8 2d fe ff ff       	call   8048458 <__stack_chk_fail@plt>
 804862b:	81 c4 c8 00 00 00    	add    $0xc8,%esp
 8048631:	5b                   	pop    %ebx
 8048632:	5f                   	pop    %edi
 8048633:	89 ec                	mov    %ebp,%esp
 8048635:	5d                   	pop    %ebp
 8048636:	c3                   	ret    
 8048637:	90                   	nop
 8048638:	90                   	nop
 8048639:	90                   	nop
 804863a:	90                   	nop
 804863b:	90                   	nop
 804863c:	90                   	nop
 804863d:	90                   	nop
 804863e:	90                   	nop
 804863f:	90                   	nop
 8048640:	55                   	push   %ebp
 8048641:	89 e5                	mov    %esp,%ebp
 8048643:	5d                   	pop    %ebp
 8048644:	c3                   	ret    
 8048645:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 8048650:	55                   	push   %ebp
 8048651:	89 e5                	mov    %esp,%ebp
 8048653:	57                   	push   %edi
 8048654:	56                   	push   %esi
 8048655:	53                   	push   %ebx
 8048656:	e8 4f 00 00 00       	call   80486aa <strcmp@plt+0x232>
 804865b:	81 c3 99 19 00 00    	add    $0x1999,%ebx
 8048661:	83 ec 1c             	sub    $0x1c,%esp
 8048664:	e8 4f fd ff ff       	call   80483b8 <signal@plt-0x40>
 8048669:	8d bb 18 ff ff ff    	lea    -0xe8(%ebx),%edi
 804866f:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
 8048675:	29 c7                	sub    %eax,%edi
 8048677:	c1 ff 02             	sar    $0x2,%edi
 804867a:	85 ff                	test   %edi,%edi
 804867c:	74 24                	je     80486a2 <strcmp@plt+0x22a>
 804867e:	31 f6                	xor    %esi,%esi
 8048680:	8b 45 10             	mov    0x10(%ebp),%eax
 8048683:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048687:	8b 45 0c             	mov    0xc(%ebp),%eax
 804868a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804868e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048691:	89 04 24             	mov    %eax,(%esp)
 8048694:	ff 94 b3 18 ff ff ff 	call   *-0xe8(%ebx,%esi,4)
 804869b:	83 c6 01             	add    $0x1,%esi
 804869e:	39 fe                	cmp    %edi,%esi
 80486a0:	72 de                	jb     8048680 <strcmp@plt+0x208>
 80486a2:	83 c4 1c             	add    $0x1c,%esp
 80486a5:	5b                   	pop    %ebx
 80486a6:	5e                   	pop    %esi
 80486a7:	5f                   	pop    %edi
 80486a8:	5d                   	pop    %ebp
 80486a9:	c3                   	ret    
 80486aa:	8b 1c 24             	mov    (%esp),%ebx
 80486ad:	c3                   	ret    
 80486ae:	90                   	nop
 80486af:	90                   	nop
 80486b0:	55                   	push   %ebp
 80486b1:	89 e5                	mov    %esp,%ebp
 80486b3:	53                   	push   %ebx
 80486b4:	83 ec 04             	sub    $0x4,%esp
 80486b7:	a1 0c 9f 04 08       	mov    0x8049f0c,%eax
 80486bc:	83 f8 ff             	cmp    $0xffffffff,%eax
 80486bf:	74 13                	je     80486d4 <strcmp@plt+0x25c>
 80486c1:	bb 0c 9f 04 08       	mov    $0x8049f0c,%ebx
 80486c6:	66 90                	xchg   %ax,%ax
 80486c8:	83 eb 04             	sub    $0x4,%ebx
 80486cb:	ff d0                	call   *%eax
 80486cd:	8b 03                	mov    (%ebx),%eax
 80486cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 80486d2:	75 f4                	jne    80486c8 <strcmp@plt+0x250>
 80486d4:	83 c4 04             	add    $0x4,%esp
 80486d7:	5b                   	pop    %ebx
 80486d8:	5d                   	pop    %ebp
 80486d9:	c3                   	ret    
 80486da:	90                   	nop
 80486db:	90                   	nop

Disassembly of section .fini:

080486dc <.fini>:
 80486dc:	55                   	push   %ebp
 80486dd:	89 e5                	mov    %esp,%ebp
 80486df:	53                   	push   %ebx
 80486e0:	83 ec 04             	sub    $0x4,%esp
 80486e3:	e8 00 00 00 00       	call   80486e8 <strcmp@plt+0x270>
 80486e8:	5b                   	pop    %ebx
 80486e9:	81 c3 0c 19 00 00    	add    $0x190c,%ebx
 80486ef:	e8 cc fd ff ff       	call   80484c0 <strcmp@plt+0x48>
 80486f4:	59                   	pop    %ecx
 80486f5:	5b                   	pop    %ebx
 80486f6:	c9                   	leave  
 80486f7:	c3                   	ret    
