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
# 2 "C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	dw 0x3F72 ;#
	FNCALL	_main,_command
	FNCALL	_main,_data
	FNROOT	_main
	global	main@F519
	global	main@F523
	global	main@F531
	global	main@F527
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	line	48

;initializer for main@F519
	retlw	073h
	retlw	061h
	retlw	072h
	retlw	061h
	retlw	06Eh
	retlw	0
	line	59

;initializer for main@F523
	retlw	072h
	retlw	069h
	retlw	074h
	retlw	068h
	retlw	069h
	retlw	0
	line	81

;initializer for main@F531
	retlw	073h
	retlw	061h
	retlw	06Eh
	retlw	074h
	retlw	06Fh
	retlw	0
	line	70

;initializer for main@F527
	retlw	06Dh
	retlw	075h
	retlw	072h
	retlw	075h
	retlw	0
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_RCREG
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_SPBRG
_SPBRG	set	153
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TXSTA
_TXSTA	set	152
	global	_BRGH
_BRGH	set	1218
	file	"LCD BLUETOOTH.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	line	48
main@F519:
       ds      6

psect	dataBANK0
	file	"C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	line	59
main@F523:
       ds      6

psect	dataBANK0
	file	"C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	line	81
main@F531:
       ds      6

psect	dataBANK0
	file	"C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	line	70
main@F527:
       ds      5

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
	movlw low(__pdataBANK0+23)
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
	global	?_command
?_command:	; 0 bytes @ 0x0
	global	??_command
??_command:	; 0 bytes @ 0x0
	global	?_data
?_data:	; 0 bytes @ 0x0
	global	??_data
??_data:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	1
	global	command@y
command@y:	; 1 bytes @ 0x1
	global	data@z
data@z:	; 1 bytes @ 0x1
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@a
main@a:	; 6 bytes @ 0x0
	ds	6
	global	main@a_312
main@a_312:	; 6 bytes @ 0x6
	ds	6
	global	main@a_318
main@a_318:	; 6 bytes @ 0xC
	ds	6
	global	main@a_315
main@a_315:	; 5 bytes @ 0x12
	ds	5
	global	main@i
main@i:	; 2 bytes @ 0x17
	ds	2
	global	main@j
main@j:	; 2 bytes @ 0x19
	ds	2
	global	main@k
main@k:	; 2 bytes @ 0x1B
	ds	2
	global	main@l
main@l:	; 2 bytes @ 0x1D
	ds	2
;;Data sizes: Strings 0, constant 0, data 23, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80     31      54
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_command
;;   _main->_data
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                34    34      0     412
;;                                              2 COMMON     3     3      0
;;                                              0 BANK0     31    31      0
;;                            _command
;;                               _data
;; ---------------------------------------------------------------------------------
;; (1) _data                                                 2     2      0      22
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _command                                              2     2      0      22
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _command
;;   _data
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
;;DATA                 0      0      3C      12        0.0%
;;ABS                  0      0      3B       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50     1F      36       5       67.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      5       5       1       35.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 33 in file "C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  l               2   29[BANK0 ] int 
;;  k               2   27[BANK0 ] int 
;;  j               2   25[BANK0 ] int 
;;  i               2   23[BANK0 ] int 
;;  a               6   12[BANK0 ] unsigned char [6]
;;  a               5   18[BANK0 ] unsigned char [5]
;;  a               6    6[BANK0 ] unsigned char [6]
;;  a               6    0[BANK0 ] unsigned char [6]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      31       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3      31       0       0       0
;;Total ram usage:       34 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_command
;;		_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	line	33
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
	line	34
	
l1893:	
;LCD BLUETOOTH.c: 34: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	35
;LCD BLUETOOTH.c: 35: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	36
	
l1895:	
;LCD BLUETOOTH.c: 36: TRISC=0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	37
	
l1897:	
;LCD BLUETOOTH.c: 37: PORTC=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	38
;LCD BLUETOOTH.c: 38: TXSTA=0x24;
	movlw	(024h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(152)^080h	;volatile
	line	39
;LCD BLUETOOTH.c: 39: RCSTA=0x90;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	40
	
l1899:	
;LCD BLUETOOTH.c: 40: BRGH=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1218/8)^080h,(1218)&7
	line	41
;LCD BLUETOOTH.c: 41: SPBRG=25;
	movlw	(019h)
	movwf	(153)^080h	;volatile
	line	42
	
l1901:	
;LCD BLUETOOTH.c: 42: command(0x01);
	movlw	(01h)
	fcall	_command
	line	43
;LCD BLUETOOTH.c: 43: while(1)
	
l570:	
	line	45
	
l1903:	
;LCD BLUETOOTH.c: 44: {
;LCD BLUETOOTH.c: 45: if(RCREG=='2')
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(26),w	;volatile
	xorlw	032h
	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l571
u2260:
	line	47
	
l1905:	
;LCD BLUETOOTH.c: 46: {
;LCD BLUETOOTH.c: 47: command(0x01);
	movlw	(01h)
	fcall	_command
	line	48
	
l1907:	
;LCD BLUETOOTH.c: 48: char a[]={"saran"};
	movlw	(main@a)&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@F519),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(main@F519)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F519)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F519)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F519)+4,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F519)+5,w
	movwf	indf
	line	49
	
l1909:	
;LCD BLUETOOTH.c: 49: command(0x80);
	movlw	(080h)
	fcall	_command
	line	50
	
l1911:	
;LCD BLUETOOTH.c: 50: for(int i=0;i<=4;i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l1913:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2275
	movlw	low(05h)
	subwf	(main@i),w
u2275:

	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l574
u2270:
	
l1915:	
	goto	l575
	line	51
	
l574:	
	line	52
	
l1917:	
;LCD BLUETOOTH.c: 51: {
;LCD BLUETOOTH.c: 52: data(a[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	addlw	main@a&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_data
	line	50
	
l1919:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1921:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2285
	movlw	low(05h)
	subwf	(main@i),w
u2285:

	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l574
u2280:
	
l575:	
	line	54
	
l1923:	
;LCD BLUETOOTH.c: 53: }
;LCD BLUETOOTH.c: 54: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	14
movwf	((??_main+0)+0+1),f
	movlw	176
movwf	((??_main+0)+0),f
u2387:
	decfsz	((??_main+0)+0),f
	goto	u2387
	decfsz	((??_main+0)+0+1),f
	goto	u2387
	decfsz	((??_main+0)+0+2),f
	goto	u2387
opt asmopt_on

	line	55
;LCD BLUETOOTH.c: 55: }
	goto	l576
	line	56
	
l571:	
	
l1925:	
;LCD BLUETOOTH.c: 56: else if(RCREG=='0')
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(26),w	;volatile
	xorlw	030h
	skipz
	goto	u2291
	goto	u2290
u2291:
	goto	l577
u2290:
	line	58
	
l1927:	
;LCD BLUETOOTH.c: 57: {
;LCD BLUETOOTH.c: 58: command(0x01);
	movlw	(01h)
	fcall	_command
	line	59
	
l1929:	
;LCD BLUETOOTH.c: 59: char a[]={"rithi"};
	movlw	(main@a_312)&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@F523),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(main@F523)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F523)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F523)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F523)+4,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F523)+5,w
	movwf	indf
	line	60
	
l1931:	
;LCD BLUETOOTH.c: 60: command(0x80);
	movlw	(080h)
	fcall	_command
	line	61
	
l1933:	
;LCD BLUETOOTH.c: 61: for(int j=0;j<=4;j++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@j)
	movlw	high(0)
	movwf	((main@j))+1
	
l1935:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2305
	movlw	low(05h)
	subwf	(main@j),w
u2305:

	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l580
u2300:
	
l1937:	
	goto	l581
	line	62
	
l580:	
	line	63
	
l1939:	
;LCD BLUETOOTH.c: 62: {
;LCD BLUETOOTH.c: 63: data(a[j]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@j),w
	addlw	main@a_312&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_data
	line	61
	
l1941:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1943:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2315
	movlw	low(05h)
	subwf	(main@j),w
u2315:

	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l580
u2310:
	
l581:	
	line	65
	
l1945:	
;LCD BLUETOOTH.c: 64: }
;LCD BLUETOOTH.c: 65: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	14
movwf	((??_main+0)+0+1),f
	movlw	176
movwf	((??_main+0)+0),f
u2397:
	decfsz	((??_main+0)+0),f
	goto	u2397
	decfsz	((??_main+0)+0+1),f
	goto	u2397
	decfsz	((??_main+0)+0+2),f
	goto	u2397
opt asmopt_on

	line	66
;LCD BLUETOOTH.c: 66: }
	goto	l582
	line	67
	
l577:	
	
l1947:	
;LCD BLUETOOTH.c: 67: else if(RCREG=='6')
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(26),w	;volatile
	xorlw	036h
	skipz
	goto	u2321
	goto	u2320
u2321:
	goto	l583
u2320:
	line	69
	
l1949:	
;LCD BLUETOOTH.c: 68: {
;LCD BLUETOOTH.c: 69: command(0x01);
	movlw	(01h)
	fcall	_command
	line	70
	
l1951:	
;LCD BLUETOOTH.c: 70: char a[]={"muru"};
	movlw	(main@a_315)&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@F527),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(main@F527)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F527)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F527)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F527)+4,w
	movwf	indf
	line	71
	
l1953:	
;LCD BLUETOOTH.c: 71: command(0x80);
	movlw	(080h)
	fcall	_command
	line	72
	
l1955:	
;LCD BLUETOOTH.c: 72: for(int k=0;k<=3;k++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@k)
	movlw	high(0)
	movwf	((main@k))+1
	
l1957:	
	movf	(main@k+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(04h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2335
	movlw	low(04h)
	subwf	(main@k),w
u2335:

	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l586
u2330:
	
l1959:	
	goto	l587
	line	73
	
l586:	
	line	74
	
l1961:	
;LCD BLUETOOTH.c: 73: {
;LCD BLUETOOTH.c: 74: data(a[k]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@k),w
	addlw	main@a_315&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_data
	line	72
	
l1963:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@k),f
	skipnc
	incf	(main@k+1),f
	movlw	high(01h)
	addwf	(main@k+1),f
	
l1965:	
	movf	(main@k+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(04h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2345
	movlw	low(04h)
	subwf	(main@k),w
u2345:

	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l586
u2340:
	
l587:	
	line	76
	
l1967:	
;LCD BLUETOOTH.c: 75: }
;LCD BLUETOOTH.c: 76: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	14
movwf	((??_main+0)+0+1),f
	movlw	176
movwf	((??_main+0)+0),f
u2407:
	decfsz	((??_main+0)+0),f
	goto	u2407
	decfsz	((??_main+0)+0+1),f
	goto	u2407
	decfsz	((??_main+0)+0+2),f
	goto	u2407
opt asmopt_on

	line	77
;LCD BLUETOOTH.c: 77: }
	goto	l588
	line	78
	
l583:	
	
l1969:	
;LCD BLUETOOTH.c: 78: else if(RCREG=='4')
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(26),w	;volatile
	xorlw	034h
	skipz
	goto	u2351
	goto	u2350
u2351:
	goto	l589
u2350:
	line	80
	
l1971:	
;LCD BLUETOOTH.c: 79: {
;LCD BLUETOOTH.c: 80: command(0x01);
	movlw	(01h)
	fcall	_command
	line	81
	
l1973:	
;LCD BLUETOOTH.c: 81: char a[]={"santo"};
	movlw	(main@a_318)&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@F531),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(main@F531)+1,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F531)+2,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F531)+3,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F531)+4,w
	movwf	indf
	incf	fsr0,f
	movf	(main@F531)+5,w
	movwf	indf
	line	82
	
l1975:	
;LCD BLUETOOTH.c: 82: command(0x80);
	movlw	(080h)
	fcall	_command
	line	83
	
l1977:	
;LCD BLUETOOTH.c: 83: for(int l=0;l<=4;l++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@l)
	movlw	high(0)
	movwf	((main@l))+1
	
l1979:	
	movf	(main@l+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2365
	movlw	low(05h)
	subwf	(main@l),w
u2365:

	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l592
u2360:
	
l1981:	
	goto	l593
	line	84
	
l592:	
	line	85
	
l1983:	
;LCD BLUETOOTH.c: 84: {
;LCD BLUETOOTH.c: 85: data(a[l]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@l),w
	addlw	main@a_318&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_data
	line	83
	
l1985:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@l),f
	skipnc
	incf	(main@l+1),f
	movlw	high(01h)
	addwf	(main@l+1),f
	
l1987:	
	movf	(main@l+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(05h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2375
	movlw	low(05h)
	subwf	(main@l),w
u2375:

	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l592
u2370:
	
l593:	
	line	87
	
l1989:	
;LCD BLUETOOTH.c: 86: }
;LCD BLUETOOTH.c: 87: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	14
movwf	((??_main+0)+0+1),f
	movlw	176
movwf	((??_main+0)+0),f
u2417:
	decfsz	((??_main+0)+0),f
	goto	u2417
	decfsz	((??_main+0)+0+1),f
	goto	u2417
	decfsz	((??_main+0)+0+2),f
	goto	u2417
opt asmopt_on

	line	88
	
l589:	
	line	90
	
l588:	
	
l582:	
	
l576:	
	
l594:	
	line	43
	goto	l570
	
l595:	
	line	91
	
l596:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_data
psect	text111,local,class=CODE,delta=2
global __ptext111
__ptext111:

;; *************** function _data *****************
;; Defined at:
;;		line 17 in file "C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
;; Parameters:    Size  Location     Type
;;  z               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  z               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text111
	file	"C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	line	17
	global	__size_of_data
	__size_of_data	equ	__end_of_data-_data
	
_data:	
	opt	stack 7
; Regs used in _data: [wreg]
;data@z stored from wreg
	movwf	(data@z)
	line	18
	
l1883:	
;LCD BLUETOOTH.c: 18: PORTD=z;
	movf	(data@z),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	19
	
l1885:	
;LCD BLUETOOTH.c: 19: RC0=1;
	bsf	(56/8),(56)&7
	line	20
	
l1887:	
;LCD BLUETOOTH.c: 20: RC1=0;
	bcf	(57/8),(57)&7
	line	21
	
l1889:	
;LCD BLUETOOTH.c: 21: RC2=1;
	bsf	(58/8),(58)&7
	line	22
;LCD BLUETOOTH.c: 22: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_data+0)+0,f
u2427:
	clrwdt
decfsz	(??_data+0)+0,f
	goto	u2427
	nop2	;nop
	clrwdt
opt asmopt_on

	line	23
	
l1891:	
;LCD BLUETOOTH.c: 23: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	24
	
l564:	
	return
	opt stack 0
GLOBAL	__end_of_data
	__end_of_data:
;; =============== function _data ends ============

	signat	_data,4216
	global	_command
psect	text112,local,class=CODE,delta=2
global __ptext112
__ptext112:

;; *************** function _command *****************
;; Defined at:
;;		line 8 in file "C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
;; Parameters:    Size  Location     Type
;;  y               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  y               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_initial
;; This function uses a non-reentrant model
;;
psect	text112
	file	"C:\Users\sreya\Desktop\embeded\LCD BLUETOOTH\LCD BLUETOOTH.c"
	line	8
	global	__size_of_command
	__size_of_command	equ	__end_of_command-_command
	
_command:	
	opt	stack 7
; Regs used in _command: [wreg]
;command@y stored from wreg
	movwf	(command@y)
	line	9
	
l1873:	
;LCD BLUETOOTH.c: 9: PORTD=y;
	movf	(command@y),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	10
	
l1875:	
;LCD BLUETOOTH.c: 10: RC0=0;
	bcf	(56/8),(56)&7
	line	11
	
l1877:	
;LCD BLUETOOTH.c: 11: RC1=0;
	bcf	(57/8),(57)&7
	line	12
	
l1879:	
;LCD BLUETOOTH.c: 12: RC2=1;
	bsf	(58/8),(58)&7
	line	13
;LCD BLUETOOTH.c: 13: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_command+0)+0,f
u2437:
	clrwdt
decfsz	(??_command+0)+0,f
	goto	u2437
	nop2	;nop
	clrwdt
opt asmopt_on

	line	14
	
l1881:	
;LCD BLUETOOTH.c: 14: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	15
	
l561:	
	return
	opt stack 0
GLOBAL	__end_of_command
	__end_of_command:
;; =============== function _command ends ============

	signat	_command,4216
psect	text113,local,class=CODE,delta=2
global __ptext113
__ptext113:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
