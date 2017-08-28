//level6
//compile using: gcc level.c -o level -fno-stack-protector -z execstack

#include <stdio.h>	//printf, scanf
#include <unistd.h>	//read
#include <string.h>	//strlen

int pos = 0;
char cmd = 0;
int num = 0;
		

int main()
{
	printf("Hello Stranger!\n");
	printf("Now leak the stack adress yourself :)\n");

	unsigned char buffor[] = "Hello world!";

	printf("Commands:\n");
	printf("I - increase offset by 1\n");
	printf("D - decrease offset by 1\n");
	printf("W %%d - write value to memory location at current offset\n");
	printf("Q - exit the main loop\n");

	for(;;)
	{
		printf("At offset %d the value is %d\n", pos, buffor[pos]);
		
		scanf("%c", &cmd);
		while(cmd == '\n' || cmd == '\t' || cmd == ' ')
			scanf("%c", &cmd);
		
		switch(cmd)
		{
		case 'I':
			if(pos < strlen(buffor))
			{
				pos++;
			}
			break;
		case 'D':
			if(pos > 0)
			{
				pos--;
			}
			break;
		case 'W':
			scanf("%d", &num);
			buffor[pos] = (unsigned char)num;
			break;
		case 'Q':
			goto exit;
			break;
		}
	}

exit:

	printf("Where do you want to jump to?\n");
	void* ptr;
	read(0, &ptr, 8);

	__asm__ __volatile__ (
			"push %0\n"
			"ret\n"
			::"r"(ptr));


	return 0;
}

