#include <stdio.h>
#include "parser.h"

int main(int argc, char* argv[])
{
    FILE *fp;
    /*
    This file path is used on my mac machine 
    fp = fopen("/Users/micahbassett/Desktop/Nand2tetris/projects/06/add/Add.asm", "r");
    */

   fp = fopen("C:/Users/micah/OneDrive/Desktop/Nand2tetris/projects/06/add/Add.asm", "r");

    char line[100];
    fpos_t position;

    while (!feof(fp))
    {
        advance(fp, position, line);
        printf(line);
    }
}