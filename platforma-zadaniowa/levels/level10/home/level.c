//level10
//compile using: gcc level.c -o level -fno-stack-protector -pie

#include <stdio.h>	//printf, scanf
#include <stdlib.h>	//system
#include <unistd.h>	//read

void safe_function()
{
	char one_to_hold_all_text[1];

	unsigned int n_bytes = 0;
	printf("How many bytes to read?\n", one_to_hold_all_text);
	scanf("%d", &n_bytes);

	//what could possibly go wrong?
	read(0, one_to_hold_all_text, n_bytes);

	return;
}

int main()
{
	printf("Hello Stranger!\n");
	printf("Now the stack is not executable so you will fail to exploit this binary!!!\n");
	printf("And by the way the getc() function is located at: %p\n", getc);

	safe_function();

	return 0;
}

