//level3
//compile using: gcc level.c -o level

#include <stdio.h>	//printf
#include <sys/mman.h>	//mmap
#include <unistd.h>	//syscalls

int main()
{
	printf("Hello Stranger!\n");
	printf("How about using syscalls to get a shell\n");

	//create a 4kb buffor for user input
	void* buffor = mmap(0, 4*1024, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	printf("You may need this: %p\n", buffor);

	for(;;)
	{
		void *rax, *rdi, *rsi, *rdx, *r10, *r8, *r9;
		read(0, &rax, 8);
		read(0, &rdi, 8);
		read(0, &rsi, 8);
		read(0, &rdx, 8);
		read(0, &r10, 8);
		read(0, &r8, 8);
		read(0, &r9, 8);

		__asm__ __volatile__ (
				"mov %0, %%rax\n"
				"mov %1, %%rdi\n"
				"mov %2, %%rsi\n"
				"mov %3, %%rdx\n"
				"mov %4, %%r10\n"
				"mov %5, %%r8\n"
				"mov %6, %%r9\n"
				"syscall\n"
				::
				"m" (rax),
				"m" (rdi),
				"m" (rsi),
				"m" (rdx),
				"m" (r10),
				"m" (r8),
				"m" (r9));
	}

	return 0;
}

