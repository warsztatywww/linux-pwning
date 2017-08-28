//level11
//compile using: gcc level.c -o level -fno-stack-protector -no-pie

#include <stdio.h>	//printf, scanf
#include <unistd.h>	//read

//these are here only to increase the size of the binary :)
#include "example_encode.c"
#include "sha256.h"

volatile void gadgets()
{
	__asm__ __volatile__ (
			"pop %rax\n"
			"ret\n"
			);
	__asm__ __volatile__ (
			"syscall\n"
			"ret\n");
}

unsigned int n_bytes = 0;
void safe_function()
{
	char one_to_hold_all_text[1];

	printf("How many bytes to read?\n", one_to_hold_all_text);
	scanf("%d", &n_bytes);

	//what could possibly go wrong?
	read(0, one_to_hold_all_text, n_bytes);

	return;
}

int main()
{
	printf("Hello Stranger!\n");
	printf("Now you do not have anything to leak so this time you will definetely fail to exploit this binary!!!\n");

	safe_function();

	return 0;
}

