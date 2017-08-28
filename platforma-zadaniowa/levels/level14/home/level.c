//level14 - 32 BIT
//compile using: gcc -m32 level.c -o level -no-pie

#include <stdio.h>	//printf, scanf, fflush
#include <string.h>	//memset

int main()
{
	printf("Hello Stranger!\n");
	printf("What's the proper way to use printf?\n");

	char buf[1024];

	for(;;)
	{
		memset(buf, 0, 1024);
		fgets(buf, 1024, stdin);
		printf(buf);
		fflush(stdout);
	}

	return 0;
}

