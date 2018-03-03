# Blinky
2016 BYU CS 224 Lab 2


### Description
- Assembly program written to quickly blink an LED once every 10 seconds
- Determines the Main System Clock frequency (MCLK), the average number of clock cycles per instruction (CPI), and the raw speed of LaunchPad processor as measured in millions of instructions per second (MIPS)


### Explore
- Use assembly instructions with registers and condition codes to construct software timing loops
- Determine how instruction addressing modes affect the number of clock cycles
- Control the assembly process using assembler directives
- Calculate processor clock speeds, average clock cycles per instruction, and processor instructions per second


### Before you begin...

The algorithm for this lab (finiteness, definiteness, computability) might be:
- Initialize the stack pointer, turn off the Watchdog (explained in later labs), and set Port 1 bit 0 as an output (P1.0 is the red LED).
- Quickly "blink" the red LED on and off.
- Use instruction loops to delay for 10 seconds.
- Repeat the blink/delay loop indefinitely.
Note: Step 1 is already programmed in blinky.asm.

When you have decided what, where, and how to complete this lab, proceed with your implementation. Of course, there are many ways to implement this lab. One suggested approach is as follows:
- Create a new assembly-only project and add the blinky.asm file from Lab 1 to the project.
- Modify your program to quickly toggle the red LED on and off. (Refer to How To Turn an LED ON/OFF.)
- Add a small timing loop to your assembly program that executes in 1/10 of a second. (Use the assembler directive .equ to define all your timing constants.)
- Encapsulate the inner timing loop in an outer loop in order to lengthen the overall time between blinks of the LED. The inner timing loop should execute in 1/10 second and thus, the outer loop constant would be 100 (100 x 1/10 second = 10 seconds.)
- Put the number of cycles for each assembly instruction in the comment field and then calculate the total number of cycles for the entire 10 second timing interval. (Refer to How To Determine Cycles Per Instruction...)
- Repeat your 10 second timing interval indefinitely.
- Use a stop watch (or your watch) to measure the length of your 10 second timing interval (ie. the time between blinks of the LED). Adjust your inner timing loop constants so that the LED "blinks" exactly every 10 seconds. You will probably need to measure 6 or more intervals to verify an accurate 10 second interval time (plus or minus 1 second per minute). (Refer to How To Use Assembler Directives...)
- Calculate the processor clock frequency (MCLK) by dividing the total number of cycles per interval by the time between "blinks" of the LED. (The clock speed should be accurate to at least 4 significant digits and is measured in cycles per second.)
- Calculate the average cycles per instruction (CPI) by dividing the total number of cycles per interval by the number of instructions per interval. CPI will vary according to the instructions used in your timing loops. (CPI is measured in cycles per instruction.)
- Finally, calculate the raw speed of the processor (MIPS) by dividing the processor clock frequency (MCLK) by the average cycles per instruction (CPI), divided by 1 million. (Refer to How To Determine a Processor's Speed (MIPS)...)

Note: Since your LaunchPad processor is not crystal controlled, your timing constants will vary from processor to processor and even with ambient temperature change.
