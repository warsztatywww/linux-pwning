//level2
//compile using: gcc level.c -o level

#include <stdio.h>	//printf
#include <sys/mman.h>	//mmap

int main()
{
	printf("Hello Stranger!\n");
	printf("Give me code and I will execute it\n");

	//create a 4kb buffor for user input
	void* definitely_not_code = mmap((void*)0xABCDE00, 4*1024, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

	//read user input into the buffor
	scanf("%1024s", definitely_not_code);

	//grant executable permisions to the buffor
	mprotect(definitely_not_code, 4*1024, PROT_READ | PROT_EXEC);

	//call it :)
	void(*fun)() = definitely_not_code;
	fun();

	return 0;
}

