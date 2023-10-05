#include "parser.h"

int hasMoreCommands(FILE *fp)
{
    if (!feof(fp))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void advance(FILE *fp, fpos_t position, char *line)
{
    if (hasMoreCommands(fp))
    {
        fgetpos(fp, &position);
        fgets(line, 100, fp);
    }

    else
    {
        printf("The end of the file has been reached!");
    }
}