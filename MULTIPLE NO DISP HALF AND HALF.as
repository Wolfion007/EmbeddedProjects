opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6446"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 2 "D:\MICROPROCESSOR WORKSHOP\Projects\SEGMENT PROJECTS\MULTIPLE NO DISP HALF AND HALF\MULTIPLE NO DISP HALF AND HALF.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "D:\MICROPROCESSOR WORKSHOP\Projects\SEGMENT PROJECTS\MULTIPLE NO DISP HALF AND HALF\MULTIPLE NO DISP HALF AND HALF.c"
	dw 0x3F72 ;#
	FNROOT	_main
	global	main@F513
	global	main@F517
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\MICROPROCESSOR WORKSHOP\Projects\SEGMENT PROJECTS\MULTIPLE NO DISP HALF AND HALF\MULTIPLE NO DISP HALF AND HALF.c"
	line	8

;initializer for main@F513
	retlw	03Fh
	retlw	0

	retlw	06h
	retlw	0

	retlw	05Bh
	retlw	0

	retlw	04Fh
	retlw	0

	retlw	066h
	retlw	0

	line	18

;initializer for main@F517
	retlw	06Dh
	retlw	0

	retlw	07Dh
	retlw	0

	retlw	07h
	retlw	0

	retlw	07Fh
	retlw	0

	retlw	067h
	retlw	0

	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	file	"MULTIPLE NO DISP HALF AND HALF.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\MICROPROCESSOR WORKSHOP\Projects\SEGMENT PROJECTS\MULTIPLE NO DISP HALF AND HALF\MULTIPLE NO DISP HALF AND HALF.c"
	line	8
main@F513:
       ds      10

psect	dataBANK0
	file	"D:\MICROPROCESSOR WORKSHOP\Projects\SEGMENT PROJECTS\MULTIPLE NO DISP HALF AND HALF\MULTIPLE NO DISP HALF AND HALF.c"
	line	18
main@F517:
       ds      10

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+20)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@A
main@A:	; 10 bytes @ 0x0
	ds	10
	global	main@B
main@B:	; 10 bytes @ 0xA
	ds	10
	global	main@i
main@i:	; 2 bytes @ 0x14
	ds	2
;;Data sizes: Strings 0, constant 0, data 20, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       4
;; BANK0           80     22      42
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                26    26      0     185
;;                                              0 COMMON     4     4      0
;;                                              0 BANK0     22    22      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      2E      12        0.0%
;;ABS                  0      0      2E       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       0       2        0.0%
;;BANK0               50     16      2A       5       52.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      4       4       1       28.6%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "D:\MICROPROCESSOR WORKSHOP\Projects\SEGMENT PROJECTS\MULTIPLE NO DISP HALF AND HALF\MULTIPLE NO DISP HALF AND HALF.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  B              10   10[BANK0 ] int [5]
;;  A              10    0[BANK0 ] int [5]
;;  i               2   20[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      22       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4      22       0       0       0
;;Total ram usage:       26 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\MICROPROCESSOR WORKSHOP\Projects\SEGMENT PROJECTS\MULTIPLE NO DISP HALF AND HALF\MULTIPLE NO DISP HALF AND HALF.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0]
	line	7
	
l1770:	
;MULTIPLE NO DISP HALF AND HALF.c: 7: int i=0;
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	line	8
	
l1772:	
;MULTIPLE NO DISP HALF AND HALF.c: 8: int A[5]={0x3F, 0x06, 0x5b,0x4F,0x66};
	movlw	(main@A)&0ffh
	movwf	fsr0
	movlw	low(main@F513)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	10
	movwf	((??_main+0)+0+2)
u2200:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2200
	line	9
	
l1774:	
;MULTIPLE NO DISP HALF AND HALF.c: 9: TRISC=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	10
	
l1776:	
;MULTIPLE NO DISP HALF AND HALF.c: 10: for(i=0; i<=4; i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l1778:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2215
	movlw	low(05h)
	subwf	(main@i),w
u2215:

	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l563
u2210:
	
l1780:	
	goto	l564
	line	11
	
l563:	
	line	12
	
l1782:	
;MULTIPLE NO DISP HALF AND HALF.c: 11: {
;MULTIPLE NO DISP HALF AND HALF.c: 12: PORTC= A[i];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	movwf	(??_main+0)+0
	addwf	(??_main+0)+0,w
	addlw	main@A&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(7)	;volatile
	line	13
	
l1784:	
;MULTIPLE NO DISP HALF AND HALF.c: 13: _delay((unsigned long)((10)*(4000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_main+0)+0+1),f
	movlw	251
movwf	((??_main+0)+0),f
u2267:
	decfsz	((??_main+0)+0),f
	goto	u2267
	decfsz	((??_main+0)+0+1),f
	goto	u2267
	nop2
opt asmopt_on

	line	15
	
l1786:	
;MULTIPLE NO DISP HALF AND HALF.c: 15: PORTC= 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	16
	
l1788:	
;MULTIPLE NO DISP HALF AND HALF.c: 16: _delay((unsigned long)((10)*(4000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_main+0)+0+1),f
	movlw	251
movwf	((??_main+0)+0),f
u2277:
	decfsz	((??_main+0)+0),f
	goto	u2277
	decfsz	((??_main+0)+0+1),f
	goto	u2277
	nop2
opt asmopt_on

	line	10
	
l1790:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1792:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2225
	movlw	low(05h)
	subwf	(main@i),w
u2225:

	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l563
u2220:
	
l564:	
	line	18
	
l1794:	
;MULTIPLE NO DISP HALF AND HALF.c: 17: }
;MULTIPLE NO DISP HALF AND HALF.c: 18: int B[5]={0x6D,0x7D,0x07,0x7F,0x67};
	movlw	(main@B)&0ffh
	movwf	fsr0
	movlw	low(main@F517)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	10
	movwf	((??_main+0)+0+2)
u2230:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2230
	line	19
	
l1796:	
;MULTIPLE NO DISP HALF AND HALF.c: 19: TRISD= 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	20
	
l1798:	
;MULTIPLE NO DISP HALF AND HALF.c: 20: for(i=0; i<=4; i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l1800:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2245
	movlw	low(05h)
	subwf	(main@i),w
u2245:

	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l567
u2240:
	
l1802:	
	goto	l568
	line	21
	
l567:	
	line	22
	
l1804:	
;MULTIPLE NO DISP HALF AND HALF.c: 21: {
;MULTIPLE NO DISP HALF AND HALF.c: 22: PORTD= B[i];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	movwf	(??_main+0)+0
	addwf	(??_main+0)+0,w
	addlw	main@B&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	line	23
	
l1806:	
;MULTIPLE NO DISP HALF AND HALF.c: 23: _delay((unsigned long)((10)*(4000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_main+0)+0+1),f
	movlw	251
movwf	((??_main+0)+0),f
u2287:
	decfsz	((??_main+0)+0),f
	goto	u2287
	decfsz	((??_main+0)+0+1),f
	goto	u2287
	nop2
opt asmopt_on

	line	24
	
l1808:	
;MULTIPLE NO DISP HALF AND HALF.c: 24: PORTD= 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	25
	
l1810:	
;MULTIPLE NO DISP HALF AND HALF.c: 25: _delay((unsigned long)((10)*(4000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_main+0)+0+1),f
	movlw	251
movwf	((??_main+0)+0),f
u2297:
	decfsz	((??_main+0)+0),f
	goto	u2297
	decfsz	((??_main+0)+0+1),f
	goto	u2297
	nop2
opt asmopt_on

	line	20
	
l1812:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1814:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2255
	movlw	low(05h)
	subwf	(main@i),w
u2255:

	skipc
	goto	u2251
	goto	u2250
u2251:
	goto	l567
u2250:
	
l568:	
	line	27
	
l569:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
