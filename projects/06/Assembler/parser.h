#include <stdio.h>

/*
The parser will be responsible for reading in a file line by line and segmenting the assembly code by breaking it into fields to be translated into machine code.
As this is the first version of the parser, we will omit dealing with symbols and variables to make things a bit simpler
*/

// This function will return 1 if the filestream has more lines to read. 
int hasMoreCommands(FILE *fp);
// Will advance the parser to the next line
void advance(FILE *fp, fpos_t position, char *line);
// This will return a char describes the current command as "A_COMMAND", "C_COMMAND" or "L_COMMAND" and takes a pointer to the current instruction.
char commandType(char *current_instruction);
// This will return the symbol or the decimal value of the the "A_COMMAND" type
char* symbol(char *current_instruction);
char* dest(char *current_instruction);
char* comp(char *current_instruction);
char* jump(char *current_instruction);
