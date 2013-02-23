/************************************************************************
*  文件名：  ls.c
*
*  文件描述：列出一个目录的文件
*
*  创建人：  XXG  2013.1.29
*
*  目的：    APUE第一章练习
*  
*  修改记录：
*
*************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <direct.h>

int main(int argc,char *argv[])
{
	DIR	          *dp;
	struct dirent *dirp;
    
	if ( argc != 2)
		printf("参数错误！");
	    exit(0);
		
	if ( (dp = opendir(argv[1])) == NULL )
		printf("目录打开失败！");
		
	while ( dirp = readdir(dp) != NULL)
	{
		printf("%s\n",dirp->d_name);
	}

	closedir(dp);
	
	return 0;
}