// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// this vairable will tell the loop to finish
@8192
D=A
@halt
M=D

// this variable will increment in the loop, pointing to the memory location to be changed
@offset
M=0

(KBD_STATUS)
	// reset offset to 0 and jumpt to empty if no key pressed otherwise jump to fill
	@offset
	M=0
	@KBD
	D=M
	@EMPTY
	D;JEQ
	@FILL
	0;JMP

(EMPTY)
	@offset
	D=M

	@SCREEN
	A=A+D
	M=0

	@offset
	M=M+1

	// this will sub the current offset from halt and jump to empty as long as its > 0
	@halt
	D=M
	@offset
	D=D-M
	@EMPTY
	D;JGT

	@KBD_STATUS
	0;JMP

(FILL)
	@offset
	D=M

	@SCREEN
	A=A+D
	M=-1

	@offset
	M=M+1

	// this will sub the current offset from halt and jump to empty as long as its > 0
	@halt
	D=M
	@offset
	D=D-M
	@FILL
	D;JGT

	@KBD_STATUS
	0;JMP
