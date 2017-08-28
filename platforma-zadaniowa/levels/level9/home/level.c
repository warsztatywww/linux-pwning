//level6
//compile using: gcc level.c -o level -pie -O3 -s -fvisibility=hidden
//then strip the binary from symbols: strip ./level

#include <stdio.h>	//printf, scanf, fflush
#include <stdlib.h>	//system, srand, rand
#include <unistd.h>	//getuid
#include <time.h>	//time
#include <string.h>	//strcmp

char password[129];
char user_input[129];

void generate_password()
{
	srand((time(NULL)/60)*getuid());
	for(int i = 0; i<128; i++)
	{
		password[i] = ((char)(rand()%20))+'a';
	}
	password[128] = 0;
}

int main()
{
	printf("Hello Stranger!\n");
	printf("I will grant you a shell after you will enter a valid password\n");
	printf("Enter the password: ");
	
	scanf("%128s", user_input);

	printf("Validating password"); fflush(stdout);
	for(int i = 0; i<5; i++)
	{
		sleep(1);
		printf(".");
		fflush(stdout);
	}
	printf("\n");
	
	generate_password();
	if(strcmp(user_input, password) == 0)
	{
		printf("Password is correct.\n");
		system("/bin/sh");
	}
	else
	{
		printf("Invalid password\n");
	}

	return 0;
}

