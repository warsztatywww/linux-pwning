//level5
//compile using: gcc level.c -o level -fno-stack-protector -z execstack

#include <stdio.h>	//printf, scanf
#include <unistd.h>	//read
#include <alloca.h>	//alloca

void safe_function()
{
	char one_to_hold_all_text[1];

	unsigned int n_bytes = 0;
	//from 16 to 24 bits to brute for starters :)
	printf("How many bytes to write somewhere around %p ?\n", (void*)(((long unsigned int)one_to_hold_all_text)&0xffffffffff000000));
	scanf("%d", &n_bytes);

	//what could possibly go wrong?
	read(0, one_to_hold_all_text, n_bytes);

	return;
}

int main()
{
	printf("Hello Stranger!\n");
	printf("Time to bruteforce a bad implementation of ASLR!!!\n");

	volatile char* i_just_leave_this_here = alloca(6*1024*1024);
	safe_function();

	return 0;
}

