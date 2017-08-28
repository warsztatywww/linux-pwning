//level4
//compile using: gcc level.c -o level -fno-stack-protector -z execstack

#include <stdio.h>	//printf, scanf
#include <unistd.h>	//read

void safe_function()
{
	char one_to_hold_all_text[1];

	unsigned int n_bytes = 0;
	printf("How many bytes to read into %p ?\n", one_to_hold_all_text);
	scanf("%d", &n_bytes);

	//what could possibly go wrong?
	read(0, one_to_hold_all_text, n_bytes);

	return;
}

int main()
{
	printf("Hello Stranger!\n");
	printf("Time to smash the stack!!!\n");

	safe_function();

	return 0;
}

