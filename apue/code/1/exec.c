/************************************************************************
*  文件名：  exec.c
*
*  文件描述： 从标准输入读命令并执行
*
*  创建人：  XXG  2013.1.29
*
*  目的：    APUE第一章练习
*  
*  修改记录：
*
*************************************************************************/
#include "../apue.h"
#include <sys/wait.h>

int main()
{ 
   char    buf[MAXLINE];  
   pid_t   pid;
   int     status;
 
 printf("%%");  
 while(fgets(buf,MAXLINE,stdin) != NULL )
 {
  if(buf[strlen(buf)-1] == '\n')      //用null字节替换换行符，因为execlp以null结束
   buf[strlen(buf)-1] = 0;
  
  if((pid = fork() ) < 0 )
    err_sys("fork error");
  
  else if (pid == 0)                     //child process
   {
     execlp(buf,buf,(char *)0);         
     err_ret("can't execulte:%s",buf);
     exit(127);
   } 
  
   if( pid = waitpid(pid,&status,0) < 0 ) //
     err_sys("waitpid error");
     
  printf("%%");

  }
 
  exit(0);
}