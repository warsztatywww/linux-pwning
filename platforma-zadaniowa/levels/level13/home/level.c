//level13
//compile using: gcc level.c -o level -no-pie

#include <stdio.h>	//printf
#include <unistd.h>	//read

int main()
{
	printf("Hello Stranger!\n");
	printf("RIP RIP control :(\n");

	void* ptr;
	printf("Give me an adress to read: ");
	fflush(stdout);
	read(0, &ptr, 8);
	printf("This adress contains: %llu \n", *((long long unsigned int*)ptr));

	printf("Give me an adress to write to: ");
	fflush(stdout);
	read(0, &ptr, 8);
	read(0, ptr, 8);

	puts("/bin/sh;# is now a far away dream :(\n");

	return 0;
}

