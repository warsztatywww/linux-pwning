//level11
//compile using: gcc level.c -o level -fno-stack-protector -no-pie

#include <stdio.h>	//printf, scanf
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
	printf("Now you do not know where libc is located so you will fail to exploit this binary!!!\n");
	
	printf("Give me an adress to read: ");
	fflush(stdout);
	void* ptr;
	read(0, &ptr, 8);

	printf("\nHere you go: %llu \n", *((long long unsigned int*)ptr));

	safe_function();

	return 0;
}

