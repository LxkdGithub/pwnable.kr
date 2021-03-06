/*
 * =====================================================================================
 *
 *       Filename:  test.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2018/10/14 19时58分55秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <stdlib.h>

int main(){
	char * argv[101] = {"/home/input/input", [1 ... 99] = "A", NULL};
	argv['A'] = "\x00";
	argc['B'] = "\x20\x0a\x0d";
	argv['C'] = "55555";

	#######################################
	int pipe2stdin[2] = {-1, -1};
	int pipe2stderr[2] = {-1, -1};
	pid_t = childpid;

	if(pipe(pipe2stdin) < 0 || pipe(pipe2stderr) < 0)
	{
		perror("Can 't fork");
		exit(1);
	}

	FILE * fp = fopen("\x0a", "r");                                             fwrite("\x00\x00\x00\x00", 4, 1, fp);
	fclose(fp);


	if((child = fork()) < 0){
		perror("Can 't fork'");
		exit(1);
	}

	if(childpid == 0){
		close(pipe2stdin[0]);
		close(pipe2stderr[0]);
		write(pipe2stdin[1], "\x00\x0a\x00\xff", 4);
		write(pipe2stderr[1], "\x00\x0a\x02\xff", 4);
	}else{
		close(pipe2stdin[1]);
		close(pipe2stderr[1]);
		dup2(pipe2stdin[0], 0);
		dup2(pipe2stderr[0], 2);
		close(pipe2stdin[0]);
		close(pipe2stderr[1]);
		char * env[2] = {"\xde\xad\xbe\xef=\xca\xfe\xba\xbe", NULL};
		execve("/home/input/input", argv, env);
		perror("Fail to exevcute the program");
		exit(1);
	}		


#####################################################


	sleep(5);
	int sockfd;
	struct sockaddr_in server;
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if(sockfd < 0){
		perror("Can 't carete the socket'");
		exit(1);
	}
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = inet("127.0.0.1");
	server.sin_port = htons(55555);
	if(connect(sockfd, (struct sockaddr*)&server), sizeof(server))
	{
		perror("Problem connecting");
		exit(1);
	}
	printf("Connetced\n"");
	char buf[4] = "\xde\xad\xbe\xef";
	write(sockfd, buf, 4);
	close(sockfd);
	return 0;
}

