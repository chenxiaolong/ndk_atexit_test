#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char *blah = (char *) malloc(100);
    if (blah) {
        strcpy(blah, "Hello world!");
        printf("%s\n", blah);
        free(blah);
    }
    return EXIT_SUCCESS;
}
