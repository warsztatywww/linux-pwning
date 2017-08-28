//level6
//compile using: gcc level.c -o level -fstack-protector-all -pie

#include <stdio.h>	//printf, scanf
#include <stdlib.h>	//system
#include <unistd.h>	//read

//This time the stack cookie will protect us from calling this function
volatile void nothing_important()
{
	system("/bin/sh");
}

void safe_function()
{
	char one_to_hold_all_text[1];

	unsigned int n_bytes = 0;
	printf("How many bytes to read?\n", one_to_hold_all_text);
	scanf("%d", &n_bytes);

	if(n_bytes > 1+8+8+8) //now it will probably be safe
	{
		return;
	}

	//what could possibly go wrong?
	read(0, one_to_hold_all_text, n_bytes);

	return;
}

void bypass_cookie_and_PIE()
{
	unsigned long long int i = 0;
	printf("Hi my boss wanted to give you this:\n");
	for(; i<8; i++)
	{
		printf("%llu\n", (&i)[i]);
	}
}

int main()
{
	printf("Hello Stranger!\n");
	printf("Now it's time to eat some cookies!!!\n");

	bypass_cookie_and_PIE();
	safe_function();

	return 0;
}

