// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// The code works as follows;
// The register R0 is used as a counter, decremented whenever R2 is updated with the value of R1

	@R2
	D=!M
	M=M&D

(LOOP)
    
    @R0
    M=M-1
    D=M
    @END
    D;JLT      // Will jump to END if R0 < 0
    
    @R1
    D=M
    @R2
    M=M+D      // Here we add the value at R1 to R2

    @R0
    D=M
    @LOOP
    D;JGT     // Here we jump to LOOP if R0 > 0

(END)
    @END
    0;JMP 
