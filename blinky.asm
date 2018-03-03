;*******************************************************************************
;   CS 224 Lab 3 - blinky.asm: Software Toggle P1.0 (02/08/2016)
;
;	Aya Dijkwel
;	I declare that the completed assignment is my own work.
;
;   Description: Quickly blink P1.0 every 10 seconds.  Calculate MCLK, CPI, MIPS
;        Author:
;
;             MSP430G5223
;             -----------
;            |       P1.0|-->LED1-RED LED
;            |       P1.3|<--S2
;            |       P1.6|-->LED2-GREEN LED
;
; Show all calculations:
;
;   MCLK = ___11,077,140____ cycles / ____10s___ interval = ___1.108___ Mhz
;    CPI = ___11,077,140____ cycles / ___7,240,534____ instructions = ___1.47____ Cycles/Instruction
;   MIPS = MCLK / CPI / 1000000 = ___.754____ MIPS
;
;
;*******************************************************************************
           	.cdecls  C,"msp430.h"           ; MSP430
          	.def     RESET


COUNT 		.equ    100						; timing constant for delay count
SUBCOUNT	.equ  35000						; subroutine timing constant
;------------------------------------------------------------------------------
            .text                           ; beginning of executable code
;------------------------------------------------------------------------------

RESET:      mov.w   #0x0280,SP              ;1		init stack pointer
            mov.w   #WDTPW|WDTHOLD,&WDTCTL  ;5		stop WDT
            bis.b   #0x01,&P1DIR            ;4		set P1.0 as output
			bic.b	#0x02,&P1OUT			;4		turns LED off

mainloop:   bis.b   #0x01,&P1OUT            ;4    	LED on P1.0
			mov.w	#SUBCOUNT,R5			;2

undelay:	call	#subroutine				;5  (65535x2=131070)
			bic.b   #0x01,&P1OUT            ;3 	(65535x3=196605)   		LED off P1.0

            mov.w	#COUNT,R4				;2	(65535x2=131070)
														;262140
outerdelay: mov.w	#SUBCOUNT,R5			;2  (2x35000=70000)
			call	#subroutine				;5  (2x35000=70000)			extra credit
			sub.w 	#1,R4					;1  (1x35000x100=3500000)
			jne 	outerdelay				;2	(2x35000=70000)

            jmp     mainloop                ;2  (2x35000=70000) 		y, toggle led

subroutine:	sub.w	#1,R5					;2	(2x35000x100=3500000)	continues through the delay loop
            jne 	subroutine 				;2	(2x35000x100=3500000)		until SUBCOUNT = 0
			ret								;3	(1x35000=35000)			return

;------------------------------------------------------------------------------
;           Interrupt Vectors
;------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .word   RESET                   ; start address
            .end


