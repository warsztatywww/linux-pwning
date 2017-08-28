//level6
//compile using: gcc level.c -o level -fno-stack-protector -z execstack

#include <stdio.h>	//printf, scanf
#include <stdlib.h>	//getenv
#include <unistd.h>	//read

void safe_function()
{
	char one_to_hold_all_text[1];

	unsigned int n_bytes = 0;
	printf("How many bytes to read into %p ?\n", one_to_hold_all_text);
	scanf("%d", &n_bytes);

	if(n_bytes > 1+8+8) //now it will probably be safe
	{
		return;
	}

	//what could possibly go wrong?
	read(0, one_to_hold_all_text, n_bytes);

	return;
}

int main()
{
	printf("Hello Stranger!\n");
	printf("Time to smash the stack!!!\n");

	if(getenv("A1337"))
	{
		printf("A1337 : %s\n", getenv("A1337"));
	}
	else
	{
		printf("Enviroment variable A1337 is not set\n");
	}

	safe_function();

	return 0;
}

