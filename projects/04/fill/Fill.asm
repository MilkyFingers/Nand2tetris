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

// Screen offset will increment, pointing to the current word on the screen. The loop variable will decrement to control the loop termination
	@screen_offset
	M=0

(NO_KEY_PRESSED)
	
	// get the current offset and save it in the D register
	@screen_offset
	D=M
	
	// set the value of A to the base adress plus the offset
	@SCREEN
	A=A+D
	M=0
	
	// increment the offset
	@screen_offset
	M=M+1

	@KBD
	D=M
	@NO_KEY_PRESSED
	D;JEQ

	// break out of loop and reset value of offset
	@screen_offset
	M=0
		
(KEY_PRESSED)
	
	// get the current offset and save it in the D register
	@screen_offset
	D=M
	
	// set the value of A to the base adress plus the offset
	@SCREEN
	A=A+D
	M=-1
	
	// increment the offset
	@screen_offset
	M=M+1

	@KBD
	D=M
	@KEY_PRESSED
	D;JGT

	// break out of loop and reset value of offset
	@screen_offset
	M=0

	// jump back to NO_KEY_PRESSED
	@NO_KEY_PRESSED
	0;JMP
		
