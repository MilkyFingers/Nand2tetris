#include <stdio.h>

int main(int argc, char* argv[])
{
    FILE *fp;
    fp = fopen("/Users/micahbassett/Desktop/Nand2tetris/projects/06/add/Add.asm", "r");

    char line[100];
    fpos_t position;

    fgetpos(fp, &position);

    for (int i=0; i<50; i++) {
        fsetpos(fp, &position);
        fgets(line, 60, fp);
        fgetpos(fp, &position);
        printf(line);
    }
}