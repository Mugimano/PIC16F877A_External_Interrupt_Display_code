opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

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
	FNCALL	_main,_lcd_init
	FNCALL	_lcd_init,_command
	FNROOT	_main
	FNCALL	_isr,_lcd_show
	FNCALL	_isr,i1_command
	FNCALL	_lcd_show,i1_command
	FNCALL	_lcd_show,_lcd_send
	FNCALL	_lcd_send,_lcd_data
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_i
	global	_num
	global	_INTCON
psect	text194,local,class=CODE,delta=2
global __ptext194
__ptext194:
_INTCON	set	11
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_INTEDG
_INTEDG	set	1038
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	73	;'I'
	retlw	78	;'N'
	retlw	84	;'T'
	retlw	69	;'E'
	retlw	82	;'R'
	retlw	82	;'R'
	retlw	85	;'U'
	retlw	80	;'P'
	retlw	84	;'T'
	retlw	32	;' '
	retlw	79	;'O'
	retlw	67	;'C'
	retlw	67	;'C'
	retlw	85	;'U'
	retlw	82	;'R'
	retlw	0
psect	strings
	
STR_1:	
	retlw	87	;'W'
	retlw	65	;'A'
	retlw	82	;'R'
	retlw	78	;'N'
	retlw	73	;'I'
	retlw	78	;'N'
	retlw	71	;'G'
	retlw	0
psect	strings
	file	"Test_code.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_i:
       ds      2

_num:
       ds      2

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_show
?_lcd_show:	; 0 bytes @ 0x0
	global	?_command
?_command:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_send
?_lcd_send:	; 0 bytes @ 0x0
	global	?i1_command
?i1_command:	; 0 bytes @ 0x0
	global	??i1_command
??i1_command:	; 0 bytes @ 0x0
	ds	2
	global	lcd_data@rec
lcd_data@rec:	; 1 bytes @ 0x2
	global	i1command@com
i1command@com:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_send
??_lcd_send:	; 0 bytes @ 0x3
	ds	2
	global	lcd_send@word
lcd_send@word:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_show
??_lcd_show:	; 0 bytes @ 0x6
	global	??_isr
??_isr:	; 0 bytes @ 0x6
	ds	7
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_command
??_command:	; 0 bytes @ 0x0
	ds	2
	global	command@com
command@com:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_main
??_main:	; 0 bytes @ 0x3
	ds	3
;;Data sizes: Strings 24, constant 0, data 0, bss 4, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      13
;; BANK0           80      6      10
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_send@word	PTR const unsigned char  size(1) Largest target is 16
;;		 -> STR_2(CODE[16]), STR_1(CODE[8]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   _lcd_show->_lcd_send
;;   _lcd_send->_lcd_data
;;
;; Critical Paths under _main in BANK0
;;
;;   _lcd_init->_command
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
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
;; (0) _main                                                 5     5      0      22
;;                                              3 BANK0      3     3      0
;;                           _lcd_init
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      22
;;                            _command
;; ---------------------------------------------------------------------------------
;; (2) _command                                              3     3      0      22
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _isr                                                  7     7      0     213
;;                                              6 COMMON     7     7      0
;;                           _lcd_show
;;                          i1_command
;; ---------------------------------------------------------------------------------
;; (4) _lcd_show                                             0     0      0     140
;;                          i1_command
;;                           _lcd_send
;; ---------------------------------------------------------------------------------
;; (5) _lcd_send                                             3     3      0      67
;;                                              3 COMMON     3     3      0
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (4) i1_command                                            3     3      0      73
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (6) _lcd_data                                             3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _command
;;
;; _isr (ROOT)
;;   _lcd_show
;;     i1_command
;;     _lcd_send
;;       _lcd_data
;;   i1_command
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      D       D       1       92.9%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       A       2        0.0%
;;ABS                  0      0      17       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      6       A       5       12.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      21      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 29 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0        int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_lcd_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
	line	29
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	31
	
l1915:	
;main.c: 30: int i;
;main.c: 31: TRISB = 0xF9;
	movlw	(0F9h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	32
	
l1917:	
;main.c: 32: PORTB = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	33
	
l1919:	
;main.c: 33: TRISC = 0xC0;
	movlw	(0C0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	34
;main.c: 34: PORTC = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	35
;main.c: 35: TRISD = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	36
;main.c: 36: PORTD = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	37
	
l1921:	
;main.c: 37: INTCON = 0b11010000;
	movlw	(0D0h)
	movwf	(11)	;volatile
	line	39
	
l1923:	
;main.c: 39: INTF = 0;
	bcf	(89/8),(89)&7
	line	40
	
l1925:	
;main.c: 40: INTEDG = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1038/8)^080h,(1038)&7
	line	41
	
l1927:	
;main.c: 41: INTE = 1;
	bsf	(92/8),(92)&7
	line	42
	
l1929:	
;main.c: 42: GIE = 1;
	bsf	(95/8),(95)&7
	line	43
	
l1931:	
;main.c: 43: lcd_init();
	fcall	_lcd_init
	line	45
;main.c: 45: while(2)
	goto	l1933
	
l577:	
	line	48
	
l1933:	
;main.c: 46: {
;main.c: 47: interrupt _isr();
;main.c: 48: PORTC = 0x01;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	49
;main.c: 49: _delay((unsigned long)((1000)*(2000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	136
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2227:
	decfsz	((??_main+0)+0),f
	goto	u2227
	decfsz	((??_main+0)+0+1),f
	goto	u2227
	decfsz	((??_main+0)+0+2),f
	goto	u2227
opt asmopt_on

	goto	l1933
	line	50
	
l576:	
	line	45
	goto	l1933
	
l580:	
	line	51
	
l581:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text195,local,class=CODE,delta=2
global __ptext195
__ptext195:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 55 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text195
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
	line	55
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 2
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l1913:	
;main.c: 56: command(0x01);
	movlw	(01h)
	fcall	_command
	line	57
;main.c: 57: command(0x06);
	movlw	(06h)
	fcall	_command
	line	58
;main.c: 58: command(0x0C);
	movlw	(0Ch)
	fcall	_command
	line	59
;main.c: 59: command(0x38);
	movlw	(038h)
	fcall	_command
	line	60
	
l584:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_command
psect	text196,local,class=CODE,delta=2
global __ptext196
__ptext196:

;; *************** function _command *****************
;; Defined at:
;;		line 63 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
;; Parameters:    Size  Location     Type
;;  com             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  com             1    2[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text196
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
	line	63
	global	__size_of_command
	__size_of_command	equ	__end_of_command-_command
	
_command:	
	opt	stack 2
; Regs used in _command: [wreg]
;command@com stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(command@com)
	line	64
	
l1905:	
;main.c: 64: PORTD = com;
	movf	(command@com),w
	movwf	(8)	;volatile
	line	65
	
l1907:	
;main.c: 65: RB1 = 0;
	bcf	(49/8),(49)&7
	line	66
	
l1909:	
;main.c: 66: RB2 = 1;
	bsf	(50/8),(50)&7
	line	67
;main.c: 67: _delay((unsigned long)((10)*(2000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_command+0)+0+1),f
	movlw	125
movwf	((??_command+0)+0),f
u2237:
	decfsz	((??_command+0)+0),f
	goto	u2237
	decfsz	((??_command+0)+0+1),f
	goto	u2237
opt asmopt_on

	line	68
	
l1911:	
;main.c: 68: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	69
	
l587:	
	return
	opt stack 0
GLOBAL	__end_of_command
	__end_of_command:
;; =============== function _command ends ============

	signat	_command,4216
	global	_isr
psect	text197,local,class=CODE,delta=2
global __ptext197
__ptext197:

;; *************** function _isr *****************
;; Defined at:
;;		line 16 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          7       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_show
;;		i1_command
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text197
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
	line	16
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 2
; Regs used in _isr: [allreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+3)
	movf	fsr0,w
	movwf	(??_isr+4)
	movf	pclath,w
	movwf	(??_isr+5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr+6)
	ljmp	_isr
psect	text197
	line	17
	
i1l1851:	
;main.c: 17: for(i=0; i<7;i++)
	movlw	low(0)
	movwf	(_i)
	movlw	high(0)
	movwf	((_i))+1
	
i1l1853:	
	movf	(_i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u218_25
	movlw	low(07h)
	subwf	(_i),w
u218_25:

	skipc
	goto	u218_21
	goto	u218_20
u218_21:
	goto	i1l1857
u218_20:
	goto	i1l1869
	
i1l1855:	
	goto	i1l1869
	line	18
	
i1l571:	
	line	19
	
i1l1857:	
;main.c: 18: {
;main.c: 19: lcd_show();
	fcall	_lcd_show
	line	20
	
i1l1859:	
;main.c: 20: PORTC = PORTC << 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(7),w	;volatile
	movwf	(??_isr+0)+0
	addwf	(??_isr+0)+0,w
	movwf	(7)	;volatile
	line	21
	
i1l1861:	
;main.c: 21: _delay((unsigned long)((1000)*(2000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_isr+0)+0+2),f
movlw	136
movwf	((??_isr+0)+0+1),f
	movlw	86
movwf	((??_isr+0)+0),f
u224_27:
	decfsz	((??_isr+0)+0),f
	goto	u224_27
	decfsz	((??_isr+0)+0+1),f
	goto	u224_27
	decfsz	((??_isr+0)+0+2),f
	goto	u224_27
opt asmopt_on

	line	22
	
i1l1863:	
;main.c: 22: INTF = 0;
	bcf	(89/8),(89)&7
	line	17
	
i1l1865:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_i),f
	skipnc
	incf	(_i+1),f
	movlw	high(01h)
	addwf	(_i+1),f
	
i1l1867:	
	movf	(_i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u219_25
	movlw	low(07h)
	subwf	(_i),w
u219_25:

	skipc
	goto	u219_21
	goto	u219_20
u219_21:
	goto	i1l1857
u219_20:
	goto	i1l1869
	
i1l572:	
	line	25
	
i1l1869:	
;main.c: 23: }
;main.c: 25: command(0x01);
	movlw	(01h)
	fcall	i1_command
	line	26
	
i1l573:	
	movf	(??_isr+6),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_isr+5),w
	movwf	pclath
	movf	(??_isr+4),w
	movwf	fsr0
	movf	(??_isr+3),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	_lcd_show
psect	text198,local,class=CODE,delta=2
global __ptext198
__ptext198:

;; *************** function _lcd_show *****************
;; Defined at:
;;		line 90 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1_command
;;		_lcd_send
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text198
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
	line	90
	global	__size_of_lcd_show
	__size_of_lcd_show	equ	__end_of_lcd_show-_lcd_show
	
_lcd_show:	
	opt	stack 2
; Regs used in _lcd_show: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	91
	
i1l1871:	
;main.c: 91: if (INTF == 1){
	btfss	(89/8),(89)&7
	goto	u220_21
	goto	u220_20
u220_21:
	goto	i1l600
u220_20:
	line	93
	
i1l1873:	
;main.c: 93: command(0x85);
	movlw	(085h)
	fcall	i1_command
	line	94
	
i1l1875:	
;main.c: 94: lcd_send("WARNING");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_send
	line	96
	
i1l1877:	
;main.c: 96: command(0xC1);
	movlw	(0C1h)
	fcall	i1_command
	line	97
;main.c: 97: lcd_send("INTERRUPT OCCUR");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_send
	goto	i1l600
	line	98
	
i1l599:	
	line	99
	
i1l600:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_show
	__end_of_lcd_show:
;; =============== function _lcd_show ends ============

	signat	_lcd_show,88
	global	_lcd_send
psect	text199,local,class=CODE,delta=2
global __ptext199
__ptext199:

;; *************** function _lcd_send *****************
;; Defined at:
;;		line 81 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_2(16), STR_1(8), 
;; Auto vars:     Size  Location     Type
;;  word            1    5[COMMON] PTR const unsigned char 
;;		 -> STR_2(16), STR_1(8), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_lcd_show
;; This function uses a non-reentrant model
;;
psect	text199
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
	line	81
	global	__size_of_lcd_send
	__size_of_lcd_send	equ	__end_of_lcd_send-_lcd_send
	
_lcd_send:	
	opt	stack 2
; Regs used in _lcd_send: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_send@word stored from wreg
	movwf	(lcd_send@word)
	line	82
	
i1l1887:	
;main.c: 82: while(*word)
	goto	i1l1895
	
i1l594:	
	line	84
	
i1l1889:	
;main.c: 83: {
;main.c: 84: lcd_data(*word++);
	movf	(lcd_send@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	
i1l1891:	
	movlw	(01h)
	movwf	(??_lcd_send+0)+0
	movf	(??_lcd_send+0)+0,w
	addwf	(lcd_send@word),f
	line	85
	
i1l1893:	
;main.c: 85: _delay((unsigned long)((10)*(2000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_send+0)+0+1),f
	movlw	125
movwf	((??_lcd_send+0)+0),f
u225_27:
	decfsz	((??_lcd_send+0)+0),f
	goto	u225_27
	decfsz	((??_lcd_send+0)+0+1),f
	goto	u225_27
opt asmopt_on

	goto	i1l1895
	line	86
	
i1l593:	
	line	82
	
i1l1895:	
	movf	(lcd_send@word),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u221_21
	goto	u221_20
u221_21:
	goto	i1l1889
u221_20:
	goto	i1l596
	
i1l595:	
	line	87
	
i1l596:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_send
	__end_of_lcd_send:
;; =============== function _lcd_send ends ============

	signat	_lcd_send,4216
	global	i1_command
psect	text200,local,class=CODE,delta=2
global __ptext200
__ptext200:

;; *************** function i1_command *****************
;; Defined at:
;;		line 63 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
;; Parameters:    Size  Location     Type
;;  command         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  command         1    2[COMMON] unsigned char 
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
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;;		_lcd_show
;; This function uses a non-reentrant model
;;
psect	text200
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
	line	63
	global	__size_ofi1_command
	__size_ofi1_command	equ	__end_ofi1_command-i1_command
	
i1_command:	
	opt	stack 4
; Regs used in i1_command: [wreg]
;i1command@com stored from wreg
	movwf	(i1command@com)
	line	64
	
i1l1897:	
;main.c: 64: PORTD = com;
	movf	(i1command@com),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	65
	
i1l1899:	
;main.c: 65: RB1 = 0;
	bcf	(49/8),(49)&7
	line	66
	
i1l1901:	
;main.c: 66: RB2 = 1;
	bsf	(50/8),(50)&7
	line	67
;main.c: 67: _delay((unsigned long)((10)*(2000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??i1_command+0)+0+1),f
	movlw	125
movwf	((??i1_command+0)+0),f
u226_27:
	decfsz	((??i1_command+0)+0),f
	goto	u226_27
	decfsz	((??i1_command+0)+0+1),f
	goto	u226_27
opt asmopt_on

	line	68
	
i1l1903:	
;main.c: 68: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	69
	
i1l587:	
	return
	opt stack 0
GLOBAL	__end_ofi1_command
	__end_ofi1_command:
;; =============== function i1_command ends ============

	signat	i1_command,88
	global	_lcd_data
psect	text201,local,class=CODE,delta=2
global __ptext201
__ptext201:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 72 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
;; Parameters:    Size  Location     Type
;;  rec             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  rec             1    2[COMMON] unsigned char 
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
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_send
;; This function uses a non-reentrant model
;;
psect	text201
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\Interrupt_test_code\main.c"
	line	72
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 2
; Regs used in _lcd_data: [wreg]
;lcd_data@rec stored from wreg
	movwf	(lcd_data@rec)
	line	73
	
i1l1879:	
;main.c: 73: PORTD = rec;
	movf	(lcd_data@rec),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	74
	
i1l1881:	
;main.c: 74: RB1 = 1;
	bsf	(49/8),(49)&7
	line	75
	
i1l1883:	
;main.c: 75: RB2 = 1;
	bsf	(50/8),(50)&7
	line	76
;main.c: 76: _delay((unsigned long)((10)*(2000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_data+0)+0),f
u227_27:
	decfsz	((??_lcd_data+0)+0),f
	goto	u227_27
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u227_27
opt asmopt_on

	line	77
	
i1l1885:	
;main.c: 77: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	78
	
i1l590:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
psect	text202,local,class=CODE,delta=2
global __ptext202
__ptext202:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
