#include <stdio.h>
#include <stdlib.h>

typedef struct
{
	char tab[100];
	char casual;
} state;

state s;

int main()
{
	int ans;
	printf("How many times to loop: ");
	scanf("%d", &ans);
	if(ans<0 || ans>100)
	{
		printf("Invalid number\n");
		return 0;
	}

	s.casual = 1;

	for(int i = 0; i<=ans; i++)
	{
		s.tab[i] = i;
	}

	if(s.casual != 1)
	{
		printf("YOU SHALL NOT CALL ME!\n");
		system("/bin/sh");
		return 0;
	}
	printf("No shell for you\n");

	return 0;
}
