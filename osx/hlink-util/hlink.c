#include <unistd.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
	if (argc < 3) return 1;
	int ret = -1;

	if (strncmp(argv[1], "-u", 2) == 0)
	{
		ret = unlink(argv[2]);
		if (ret != 0) perror("unlink");
	}
	else
	{
		ret = link(argv[1], argv[2]);
		if (ret != 0) perror("link");
	}

	return ret;
}