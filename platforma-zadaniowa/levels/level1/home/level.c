//level1
//compile using: gcc level.c -no-pie -o level

#include <stdio.h>	//printf
#include <unistd.h>	//read
#include <stdlib.h>	//system

//I wonder why the developers left this here
//but this will not be called anyways so I do not care :P
volatile void nothing_important()
{
	system("/bin/sh"); 
}

int main()
{
	printf("Hello Stranger!");
	printf("Give me an adress and I will jump to it");

	//read an adress supplied by the user
	void* addr;
	read(0, &addr, 8); 
	
	//jump to it :)
	__asm__ __volatile__ (
			"push %0\n"
	     		"ret\n"
		       	:: "r" (addr));
	
	return 0;
}

