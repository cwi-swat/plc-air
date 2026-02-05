!                       DR_INIT3
!			********
!
!********************************************************************
!	INITIALISATIE						    *
!********************************************************************
!
	LSTIO	0003
  SET1  PLCC1 !eerste PLC_cyclus hoog_signaal
	JSAT	L00008
	RET
!
!********************************************************************
! SUBROUTINES EN I/O_SLAGEN           *
!********************************************************************
!
L00004	LSTIO	0199
	END	DWS1_1	!eenheid DWS

L00006	LSTIO	1099
	END	1000
!
!********************************************************************
!	BEGIN HOOFDPROGRAMMA					    *
!********************************************************************
!
L00008	AND	000.1
	JSAT	L00004
	JSAT	L00006
	NOP
!
!********************************************************************
!	MAKEN VAN TRIGGERPULSEN T.B.V. TIMERS			    *
!********************************************************************
!
	AND	001.0	!0.1 sec. puls
	TRIG	510.0
	EQL	S_0,1SEC	!triggerpuls 0,1 sec.

	AND	KNIPPER
	TRIG	510.1
	EQL	S_1SEC	!triggerpuls 1,0 sec.

	AND	001.2	!10 sec. puls
	TRIG	510.2
	EQL	S_10SEC	!triggerpuls 10 sec.

	AND	001.3	!1 min. puls
	TRIG	510.3
	EQL	S_1MIN	!triggerpuls 1 min.
	FTCHC	00
	STRD	0320
	STRD	0321
	STRD	0322
	STRD	0323
	STRD	0324
	STRD	0325
	STRD	0326
	STRD	0327
	STRD	0328
	STRD	0329
	STRD	0330
	STRD	0331
	STRD	0332
	STRD	0333

	ANDNT	000.1
  EQL V13_1__2
	EQL	147.1
	EQL	147.2
	NOP	57
	AND	000.1
	FTCHC	00
	STRD	1500	!constante 0

	AND	000.1
	FTCHC	01
	STRD	1501	!constante 1

	AND	000.1
	FTCHC	02
	STRD	1502	!constante 2

	AND	000.1
	FTCHC	03
	STRD	1503	!constante 3

	AND	000.1
	FTCHC	04
	STRD	1504	!constante 4

	AND	000.1
	FTCHC	05
	STRD	1505	!constante 5

	AND	000.1
	FTCHC	06
	STRD	1506	!constante 6

	AND	000.1
	FTCHC	07
	STRD	1507	!constante 7

	AND	000.1
	FTCHC	08
	STRD	1508	!constante 8

	AND	000.1
	FTCHC	09
	STRD	1509	!constante 9

  AND 114.2 !ENTER_drukknop
	TRIG	003.2
	EQL	ENTER	!triggerpuls enterdrukkn.

	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00153

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP00_0	!setpoint 00 eenheden
	STRD	STP00_1	!setpoint 00 tientallen
	STRD	STP00_2	!setpoint 00 honderdtallen
	STRD	STP00_3	!setpoint 00 duizendtallen

	ANDNT	000.1
	NOP	1

L00153	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00173

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP01_0	!setpoint 01 eenheden
	STRD	STP01_1	!setpoint 01 tientallen
	STRD	STP01_2	!setpoint 01 honderdtallen
	STRD	STP01_3	!setpoint 01 duizendtallen

	ANDNT	000.1
	NOP	1

L00173	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00193

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP02_0	!setpoint 02 eenheden
	STRD	STP02_1	!setpoint 02 tientallen
	STRD	STP02_2	!setpoint 02 honderdtallen
	STRD	STP02_3	!setpoint 02 duizendtallen

	ANDNT	000.1
	NOP	1

L00193	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00213

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP03_0	!setpoint 03 eenheden
	STRD	STP03_1	!setpoint 03 tientallen
	STRD	STP03_2	!setpoint 03 honderdtallen
	STRD	STP03_3	!setpoint 03 duizendtallen

	ANDNT	000.1
	NOP	1

L00213	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00233

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP04_0	!setpoint 04 eenheden
	STRD	STP04_1	!setpoint 04 tientallen
	STRD	STP04_2	!setpoint 04 honderdtallen
	STRD	STP04_3	!setpoint 04 duizendtallen

	ANDNT	000.1
	NOP	1

L00233	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00253

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP05_0	!setpoint 05 eenheden
	STRD	STP05_1	!setpoint 05 tientallen
	STRD	STP05_2	!setpoint 05 honderdtallen
	STRD	STP05_3	!setpoint 05 duizendtallen

	ANDNT	000.1
	NOP	1

L00253	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00273

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP06_0	!setpoint 06 eenheden
	STRD	STP06_1	!setpoint 06 tientallen
	STRD	STP06_2	!setpoint 06 honderdtallen
	STRD	STP06_3	!setpoint 06 duizendtallen

	ANDNT	000.1
	NOP	1

L00273	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00293

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP07_0	!setpoint 07 eenheden
	STRD	STP07_1	!setpoint 07 tientallen
	STRD	STP07_2	!setpoint 07 honderdtallen
	STRD	STP07_3	!setpoint 07 duizendtallen

	ANDNT	000.1
	NOP	1

L00293	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00313

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP08_0	!setpoint 08 eenheden
	STRD	STP08_1	!setpoint 08 tientallen
	STRD	STP08_2	!setpoint 08 honderdtallen
	STRD	STP08_3	!setpoint 08 duizendtallen

	ANDNT	000.1
	NOP	1

L00313	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00333

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP09_0	!setpoint 09 eenheden
	STRD	STP09_1	!setpoint 09 tientallen
	STRD	STP09_2	!setpoint 09 honderdtallen
	STRD	STP09_3	!setpoint 09 duizendtallen

	ANDNT	000.1
	NOP	1

L00333	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00353

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP10_0	!setpoint 10 eenheden
	STRD	STP10_1	!setpoint 10 tientallen
	STRD	STP10_2	!setpoint 10 honderdtallen
	STRD	STP10_3	!setpoint 10 duizendtallen

	ANDNT	000.1
	NOP	1

L00353	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00373

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP11_0	!setpoint 11 eenheden
	STRD	STP11_1	!setpoint 11 tientallen
	STRD	STP11_2	!setpoint 11 honderdtallen
	STRD	STP11_3	!setpoint 11 duizendtallen

	ANDNT	000.1
	NOP	1

L00373	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00393

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP12_0	!setpoint 12 eenheden
	STRD	STP12_1	!setpoint 12 tientallen
	STRD	STP12_2	!setpoint 12 honderdtallen
	STRD	STP12_3	!setpoint 12 duizendtallen

	ANDNT	000.1
	NOP	1

L00393	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00413

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP13_0	!setpoint 13 eenheden
	STRD	STP13_1	!setpoint 13 tientallen
	STRD	STP13_2	!setpoint 13 honderdtallen
	STRD	STP13_3	!setpoint 13 duizendtallen

	ANDNT	000.1
	NOP	1

L00413	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00433

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP14_0	!setpoint 14 eenheden
	STRD	STP14_1	!setpoint 14 tientallen
	STRD	STP14_2	!setpoint 14 honderdtallen
	STRD	STP14_3	!setpoint 14 duizendtallen

	ANDNT	000.1
	NOP	1

L00433	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00453

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP15_0	!setpoint 15 eenheden
	STRD	STP15_1	!setpoint 15 tientallen
	STRD	STP15_2	!setpoint 15 honderdtallen
	STRD	STP15_3	!setpoint 15 duizendtallen

	ANDNT	000.1
	NOP	1

L00453	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00473

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP16_0	!setpoint 16 eenheden
	STRD	STP16_1	!setpoint 16 tientallen
	STRD	STP16_2	!setpoint 16 honderdtallen
	STRD	STP16_3	!setpoint 16 duizendtallen

	ANDNT	000.1
	NOP	1

L00473	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00493

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP17_0	!setpoint 17 eenheden
	STRD	STP17_1	!setpoint 17 tientallen
	STRD	STP17_2	!setpoint 17 honderdtallen
	STRD	STP17_3	!setpoint 17 duizendtallen

	ANDNT	000.1
	NOP	1

L00493	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00513

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP18_0	!setpoint 18 eenheden
	STRD	STP18_1	!setpoint 18 tientallen
	STRD	STP18_2	!setpoint 18 honderdtallen
	STRD	STP18_3	!setpoint 18 duizendtallen

	ANDNT	000.1
	NOP	1

L00513	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00533

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP19_0	!setpoint 19 eenheden
	STRD	STP19_1	!setpoint 19 tientallen
	STRD	STP19_2	!setpoint 19 honderdtallen
	STRD	STP19_3	!setpoint 19 duizendtallen

	ANDNT	000.1
	NOP	1

L00533	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00553

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP20_0	!setpoint 20 eenheden
	STRD	STP20_1	!setpoint 20 tientallen
	STRD	STP20_2	!setpoint 20 honderdtallen
	STRD	STP20_3	!setpoint 20 duizendtallen

	ANDNT	000.1
	NOP	1

L00553	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00573

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP21_0	!setpoint 21 eenheden
	STRD	STP21_1	!setpoint 21 tientallen
	STRD	STP21_2	!setpoint 21 honderdtallen
	STRD	STP21_3	!setpoint 21 duizendtallen

	ANDNT	000.1
	NOP	1

L00573	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00593

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP22_0	!setpoint 22 eenheden
	STRD	STP22_1	!setpoint 22 tientallen
	STRD	STP22_2	!setpoint 22 honderdtallen
	STRD	STP22_3	!setpoint 22 duizendtallen

	ANDNT	000.1
	NOP	1

L00593	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00613

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP23_0	!setpoint 23 eenheden
	STRD	STP23_1	!setpoint 23 tientallen
	STRD	STP23_2	!setpoint 23 honderdtallen
	STRD	STP23_3	!setpoint 23 duizendtallen

	ANDNT	000.1
	NOP	1

L00613	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00633

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP24_0	!setpoint 24 eenheden
	STRD	STP24_1	!setpoint 24 tientallen
	STRD	STP24_2	!setpoint 24 honderdtallen
	STRD	STP24_3	!setpoint 24 duizendtallen

	ANDNT	000.1
	NOP	1

L00633	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00653

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP25_0	!setpoint 25 eenheden
	STRD	STP25_1	!setpoint 25 tientallen
	STRD	STP25_2	!setpoint 25 honderdtallen
	STRD	STP25_3	!setpoint 25 duizendtallen

	ANDNT	000.1
	NOP	1

L00653	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00673

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP26_0	!setpoint 26 eenheden
	STRD	STP26_1	!setpoint 26 tientallen
	STRD	STP26_2	!setpoint 26 honderdtallen
	STRD	STP26_3	!setpoint 26 duizendtallen

	ANDNT	000.1
	NOP	1

L00673	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00693

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP27_0	!setpoint 27 eenheden
	STRD	STP27_1	!setpoint 27 tientallen
	STRD	STP27_2	!setpoint 27 honderdtallen
	STRD	STP27_3	!setpoint 27 duizendtallen

	ANDNT	000.1
	NOP	1

L00693	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00713

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP28_0	!setpoint 28 eenheden
	STRD	STP28_1	!setpoint 28 tientallen
	STRD	STP28_2	!setpoint 28 honderdtallen
	STRD	STP28_3	!setpoint 28 duizendtallen

	ANDNT	000.1
	NOP	1

L00713	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00733

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP29_0	!setpoint 29 eenheden
	STRD	STP29_1	!setpoint 29 tientallen
	STRD	STP29_2	!setpoint 29 honderdtallen
	STRD	STP29_3	!setpoint 29 duizendtallen

	ANDNT	000.1
	NOP	1

L00733	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00753

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP30_0	!setpoint 30 eenheden
	STRD	STP30_1	!setpoint 30 tientallen
	STRD	STP30_2	!setpoint 30 honderdtallen
	STRD	STP30_3	!setpoint 30 duizendtallen

	ANDNT	000.1
	NOP	1

L00753	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00773

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP31_0	!setpoint 31 eenheden
	STRD	STP31_1	!setpoint 31 tientallen
	STRD	STP31_2	!setpoint 31 honderdtallen
	STRD	STP31_3	!setpoint 31 duizendtallen

	ANDNT	000.1
	NOP	1

L00773	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00793

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP32_0	!setpoint 32 eenheden
	STRD	STP32_1	!setpoint 32 tientallen
	STRD	STP32_2	!setpoint 32 honderdtallen
	STRD	STP32_3	!setpoint 32 duizendtallen

	ANDNT	000.1
	NOP	1

L00793	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00813

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP33_0	!setpoint 33 eenheden
	STRD	STP33_1	!setpoint 33 tientallen
	STRD	STP33_2	!setpoint 33 honderdtallen
	STRD	STP33_3	!setpoint 33 duizendtallen

	ANDNT	000.1
	NOP	1

L00813	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00833

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP34_0	!setpoint 34 eenheden
	STRD	STP34_1	!setpoint 34 tientallen
	STRD	STP34_2	!setpoint 34 honderdtallen
	STRD	STP34_3	!setpoint 34 duizendtallen

	ANDNT	000.1
	NOP	1

L00833	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00853

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP35_0	!setpoint 35 eenheden
	STRD	STP35_1	!setpoint 35 tientallen
	STRD	STP35_2	!setpoint 35 honderdtallen
	STRD	STP35_3	!setpoint 35 duizendtallen

	ANDNT	000.1
	NOP	1

L00853	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00873

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP36_0	!setpoint 36 eenheden
	STRD	STP36_1	!setpoint 36 tientallen
	STRD	STP36_2	!setpoint 36 honderdtallen
	STRD	STP36_3	!setpoint 36 duizendtallen

	ANDNT	000.1
	NOP	1

L00873	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00893

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP37_0	!setpoint 37 eenheden
	STRD	STP37_1	!setpoint 37 tientallen
	STRD	STP37_2	!setpoint 37 honderdtallen
	STRD	STP37_3	!setpoint 37 duizendtallen

	ANDNT	000.1
	NOP	1

L00893	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00913

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP38_0	!setpoint 38 eenheden
	STRD	STP38_1	!setpoint 38 tientallen
	STRD	STP38_2	!setpoint 38 honderdtallen
	STRD	STP38_3	!setpoint 38 duizendtallen

	ANDNT	000.1
	NOP	1

L00913	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00933

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP39_0	!setpoint 39 eenheden
	STRD	STP39_1	!setpoint 39 tientallen
	STRD	STP39_2	!setpoint 39 honderdtallen
	STRD	STP39_3	!setpoint 39 duizendtallen

	ANDNT	000.1
	NOP	1

L00933	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00953

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP40_0	!setpoint 40 eenheden
	STRD	STP40_1	!setpoint 40 tientallen
	STRD	STP40_2	!setpoint 40 honderdtallen
	STRD	STP40_3	!setpoint 40 duizendtallen

	ANDNT	000.1
	NOP	1

L00953	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00973

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP41_0	!setpoint 41 eenheden
	STRD	STP41_1	!setpoint 41 tientallen
	STRD	STP41_2	!setpoint 41 honderdtallen
	STRD	STP41_3	!setpoint 41 duizendtallen

	ANDNT	000.1
	NOP	1

L00973	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00993

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP42_0	!setpoint 42 eenheden
	STRD	STP42_1	!setpoint 42 tientallen
	STRD	STP42_2	!setpoint 42 honderdtallen
	STRD	STP42_3	!setpoint 42 duizendtallen

	ANDNT	000.1
	NOP	1

L00993	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01013

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP43_0	!setpoint 43 eenheden
	STRD	STP43_1	!setpoint 43 tientallen
	STRD	STP43_2	!setpoint 43 honderdtallen
	STRD	STP43_3	!setpoint 43 duizendtallen

	ANDNT	000.1
	NOP	1

L01013	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01033

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP44_0	!setpoint 44 eenheden
	STRD	STP44_1	!setpoint 44 tientallen
	STRD	STP44_2	!setpoint 44 honderdtallen
	STRD	STP44_3	!setpoint 44 duizendtallen

	ANDNT	000.1
	NOP	1

L01033	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01053

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP45_0	!setpoint 45 eenheden
	STRD	STP45_1	!setpoint 45 tientallen
	STRD	STP45_2	!setpoint 45 honderdtallen
	STRD	STP45_3	!setpoint 45 duizendtallen

	ANDNT	000.1
	NOP	1

L01053	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01073

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP46_0	!setpoint 46 eenheden
	STRD	STP46_1	!setpoint 46 tientallen
	STRD	STP46_2	!setpoint 46 honderdtallen
	STRD	STP46_3	!setpoint 46 duizendtallen

	ANDNT	000.1
	NOP	1

L01073	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01093

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP47_0	!setpoint 47 eenheden
	STRD	STP47_1	!setpoint 47 tientallen
	STRD	STP47_2	!setpoint 47 honderdtallen
	STRD	STP47_3	!setpoint 47 duizendtallen

	ANDNT	000.1
	NOP	1

L01093	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01113

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP48_0	!setpoint 48 eenheden
	STRD	STP48_1	!setpoint 48 tientallen
	STRD	STP48_2	!setpoint 48 honderdtallen
	STRD	STP48_3	!setpoint 48 duizendtallen

	ANDNT	000.1
	NOP	1

L01113	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01133

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP49_0	!setpoint 49 eenheden
	STRD	STP49_1	!setpoint 49 tientallen
	STRD	STP49_2	!setpoint 49 honderdtallen
	STRD	STP49_3	!setpoint 49 duizendtallen

	ANDNT	000.1
	NOP	1

L01133	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01153

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP50_0	!setpoint 50 eenheden
	STRD	STP50_1	!setpoint 50 tientallen
	STRD	STP50_2	!setpoint 50 honderdtallen
	STRD	STP50_3	!setpoint 50 duizendtallen

	ANDNT	000.1
	NOP	1

L01153	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01173

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP51_0	!setpoint 51 eenheden
	STRD	STP51_1	!setpoint 51 tientallen
	STRD	STP51_2	!setpoint 51 honderdtallen
	STRD	STP51_3	!setpoint 51 duizendtallen

	ANDNT	000.1
	NOP	1

L01173	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01193

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP52_0	!setpoint 52 eenheden
	STRD	STP52_1	!setpoint 52 tientallen
	STRD	STP52_2	!setpoint 52 honderdtallen
	STRD	STP52_3	!setpoint 52 duizendtallen

	ANDNT	000.1
	NOP	1

L01193	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01213

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP53_0	!setpoint 53 eenheden
	STRD	STP53_1	!setpoint 53 tientallen
	STRD	STP53_2	!setpoint 53 honderdtallen
	STRD	STP53_3	!setpoint 53 duizendtallen

	ANDNT	000.1
	NOP	1

L01213	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01233

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP54_0	!setpoint 54 eenheden
	STRD	STP54_1	!setpoint 54 tientallen
	STRD	STP54_2	!setpoint 54 honderdtallen
	STRD	STP54_3	!setpoint 54 duizendtallen

	ANDNT	000.1
	NOP	1

L01233	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01253

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP55_0	!setpoint 55 eenheden
	STRD	STP55_1	!setpoint 55 tientallen
	STRD	STP55_2	!setpoint 55 honderdtallen
	STRD	STP55_3	!setpoint 55 duizendtallen

	ANDNT	000.1
	NOP	1

L01253	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01273

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP56_0	!setpoint 56 eenheden
	STRD	STP56_1	!setpoint 56 tientallen
	STRD	STP56_2	!setpoint 56 honderdtallen
	STRD	STP56_3	!setpoint 56 duizendtallen

	ANDNT	000.1
	NOP	1

L01273	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01293

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP57_0	!setpoint 57 eenheden
	STRD	STP57_1	!setpoint 57 tientallen
	STRD	STP57_2	!setpoint 57 honderdtallen
	STRD	STP57_3	!setpoint 57 duizendtallen

	ANDNT	000.1
	NOP	1

L01293	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01313

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP58_0	!setpoint 58 eenheden
	STRD	STP58_1	!setpoint 58 tientallen
	STRD	STP58_2	!setpoint 58 honderdtallen
	STRD	STP58_3	!setpoint 58 duizendtallen

	ANDNT	000.1
	NOP	1

L01313	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01333

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP59_0	!setpoint 59 eenheden
	STRD	STP59_1	!setpoint 59 tientallen
	STRD	STP59_2	!setpoint 59 honderdtallen
	STRD	STP59_3	!setpoint 59 duizendtallen

	ANDNT	000.1
	NOP	1

L01333	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01353

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP60_0	!setpoint 60 eenheden
	STRD	STP60_1	!setpoint 60 tientallen
	STRD	STP60_2	!setpoint 60 honderdtallen
	STRD	STP60_3	!setpoint 60 duizendtallen

	ANDNT	000.1
	NOP	1

L01353	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01373

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP61_0	!setpoint 61 eenheden
	STRD	STP61_1	!setpoint 61 tientallen
	STRD	STP61_2	!setpoint 61 honderdtallen
	STRD	STP61_3	!setpoint 61 duizendtallen

	ANDNT	000.1
	NOP	1

L01373	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01393

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP62_0	!setpoint 62 eenheden
	STRD	STP62_1	!setpoint 62 tientallen
	STRD	STP62_2	!setpoint 62 honderdtallen
	STRD	STP62_3	!setpoint 62 duizendtallen

	ANDNT	000.1
	NOP	1

L01393	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01413

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP63_0	!setpoint 63 eenheden
	STRD	STP63_1	!setpoint 63 tientallen
	STRD	STP63_2	!setpoint 63 honderdtallen
	STRD	STP63_3	!setpoint 63 duizendtallen

	ANDNT	000.1
	NOP	1

L01413	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01433

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP64_0	!setpoint 64 eenheden
	STRD	STP64_1	!setpoint 64 tientallen
	STRD	STP64_2	!setpoint 64 honderdtallen
	STRD	STP64_3	!setpoint 64 duizendtallen

	ANDNT	000.1
	NOP	1

L01433	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01453

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP65_0	!setpoint 65 eenheden
	STRD	STP65_1	!setpoint 65 tientallen
	STRD	STP65_2	!setpoint 65 honderdtallen
	STRD	STP65_3	!setpoint 65 duizendtallen

	ANDNT	000.1
	NOP	1

L01453	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01473

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP66_0	!setpoint 66 eenheden
	STRD	STP66_1	!setpoint 66 tientallen
	STRD	STP66_2	!setpoint 66 honderdtallen
	STRD	STP66_3	!setpoint 66 duizendtallen

	ANDNT	000.1
	NOP	1

L01473	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01493

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP67_0	!setpoint 67 eenheden
	STRD	STP67_1	!setpoint 67 tientallen
	STRD	STP67_2	!setpoint 67 honderdtallen
	STRD	STP67_3	!setpoint 67 duizendtallen

	ANDNT	000.1
	NOP	1

L01493	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01513

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP68_0	!setpoint 68 eenheden
	STRD	STP68_1	!setpoint 68 tientallen
	STRD	STP68_2	!setpoint 68 honderdtallen
	STRD	STP68_3	!setpoint 68 duizendtallen

	ANDNT	000.1
	NOP	1

L01513	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01533

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP69_0	!setpoint 69 eenheden
	STRD	STP69_1	!setpoint 69 tientallen
	STRD	STP69_2	!setpoint 69 honderdtallen
	STRD	STP69_3	!setpoint 69 duizendtallen

	ANDNT	000.1
	NOP	1

L01533	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01553

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP70_0	!setpoint 70 eenheden
	STRD	STP70_1	!setpoint 70 tientallen
	STRD	STP70_2	!setpoint 70 honderdtallen
	STRD	STP70_3	!setpoint 70 duizendtallen

	ANDNT	000.1
	NOP	1

L01553	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01573

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP71_0	!setpoint 71 eenheden
	STRD	STP71_1	!setpoint 71 tientallen
	STRD	STP71_2	!setpoint 71 honderdtallen
	STRD	STP71_3	!setpoint 71 duizendtallen

	ANDNT	000.1
	NOP	1

L01573	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01593

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP72_0	!setpoint 72 eenheden
	STRD	STP72_1	!setpoint 72 tientallen
	STRD	STP72_2	!setpoint 72 honderdtallen
	STRD	STP72_3	!setpoint 72 duizendtallen

	ANDNT	000.1
	NOP	1

L01593	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01613

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP73_0	!setpoint 73 eenheden
	STRD	STP73_1	!setpoint 73 tientallen
	STRD	STP73_2	!setpoint 73 honderdtallen
	STRD	STP73_3	!setpoint 73 duizendtallen

	ANDNT	000.1
	NOP	1

L01613	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01633

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP74_0	!setpoint 74 eenheden
	STRD	STP74_1	!setpoint 74 tientallen
	STRD	STP74_2	!setpoint 74 honderdtallen
	STRD	STP74_3	!setpoint 74 duizendtallen

	ANDNT	000.1
	NOP	1

L01633	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01653

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP75_0	!setpoint 75 eenheden
	STRD	STP75_1	!setpoint 75 tientallen
	STRD	STP75_2	!setpoint 75 honderdtallen
	STRD	STP75_3	!setpoint 75 duizendtallen

	ANDNT	000.1
	NOP	1

L01653	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01673

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP76_0	!setpoint 76 eenheden
	STRD	STP76_1	!setpoint 76 tientallen
	STRD	STP76_2	!setpoint 76 honderdtallen
	STRD	STP76_3	!setpoint 76 duizendtallen

	ANDNT	000.1
	NOP	1

L01673	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01693

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP77_0	!setpoint 77 eenheden
	STRD	STP77_1	!setpoint 77 tientallen
	STRD	STP77_2	!setpoint 77 honderdtallen
	STRD	STP77_3	!setpoint 77 duizendtallen

	ANDNT	000.1
	NOP	1

L01693	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01713

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP78_0	!setpoint 78 eenheden
	STRD	STP78_1	!setpoint 78 tientallen
	STRD	STP78_2	!setpoint 78 honderdtallen
	STRD	STP78_3	!setpoint 78 duizendtallen

	ANDNT	000.1
	NOP	1

L01713	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01733

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP79_0	!setpoint 79 eenheden
	STRD	STP79_1	!setpoint 79 tientallen
	STRD	STP79_2	!setpoint 79 honderdtallen
	STRD	STP79_3	!setpoint 79 duizendtallen

	ANDNT	000.1
	NOP	1

L01733	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01753

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP80_0	!setpoint 80 eenheden
	STRD	STP80_1	!setpoint 80 tientallen
	STRD	STP80_2	!setpoint 80 honderdtallen
	STRD	STP80_3	!setpoint 80 duizendtallen

	ANDNT	000.1
	NOP	1

L01753	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01773

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP81_0	!setpoint 81 eenheden
	STRD	STP81_1	!setpoint 81 tientallen
	STRD	STP81_2	!setpoint 81 honderdtallen
	STRD	STP81_3	!setpoint 81 duizendtallen

	ANDNT	000.1
	NOP	1

L01773	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01793

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP82_0	!setpoint 82 eenheden
	STRD	STP82_1	!setpoint 82 tientallen
	STRD	STP82_2	!setpoint 82 honderdtallen
	STRD	STP82_3	!setpoint 82 duizendtallen

	ANDNT	000.1
	NOP	1

L01793	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01813

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP83_0	!setpoint 83 eenheden
	STRD	STP83_1	!setpoint 83 tientallen
	STRD	STP83_2	!setpoint 83 honderdtallen
	STRD	STP83_3	!setpoint 83 duizendtallen

	ANDNT	000.1
	NOP	1

L01813	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01833

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP84_0	!setpoint 84 eenheden
	STRD	STP84_1	!setpoint 84 tientallen
	STRD	STP84_2	!setpoint 84 honderdtallen
	STRD	STP84_3	!setpoint 84 duizendtallen

	ANDNT	000.1
	NOP	1

L01833	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01853

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP85_0	!setpoint 85 eenheden
	STRD	STP85_1	!setpoint 85 tientallen
	STRD	STP85_2	!setpoint 85 honderdtallen
	STRD	STP85_3	!setpoint 85 duizendtallen

	ANDNT	000.1
	NOP	1

L01853	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01873

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP86_0	!setpoint 86 eenheden
	STRD	STP86_1	!setpoint 86 tientallen
	STRD	STP86_2	!setpoint 86 honderdtallen
	STRD	STP86_3	!setpoint 86 duizendtallen

	ANDNT	000.1
	NOP	1

L01873	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01893

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP87_0	!setpoint 87 eenheden
	STRD	STP87_1	!setpoint 87 tientallen
	STRD	STP87_2	!setpoint 87 honderdtallen
	STRD	STP87_3	!setpoint 87 duizendtallen

	ANDNT	000.1
	NOP	1

L01893	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01913

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP88_0	!setpoint 88 eenheden
	STRD	STP88_1	!setpoint 88 tientallen
	STRD	STP88_2	!setpoint 88 honderdtallen
	STRD	STP88_3	!setpoint 88 duizendtallen

	ANDNT	000.1
	NOP	1

L01913	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01933

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP89_0	!setpoint 89 eenheden
	STRD	STP89_1	!setpoint 89 tientallen
	STRD	STP89_2	!setpoint 89 honderdtallen
	STRD	STP89_3	!setpoint 89 duizendtallen

	ANDNT	000.1
	NOP	1

L01933	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01953

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP90_0	!setpoint 90 eenheden
	STRD	STP90_1	!setpoint 90 tientallen
	STRD	STP90_2	!setpoint 90 honderdtallen
	STRD	STP90_3	!setpoint 90 duizendtallen

	ANDNT	000.1
	NOP	1

L01953	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01973

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP91_0	!setpoint 91 eenheden
	STRD	STP91_1	!setpoint 91 tientallen
	STRD	STP91_2	!setpoint 91 honderdtallen
	STRD	STP91_3	!setpoint 91 duizendtallen

	ANDNT	000.1
	NOP	1

L01973	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01993

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP92_0	!setpoint 92 eenheden
	STRD	STP92_1	!setpoint 92 tientallen
	STRD	STP92_2	!setpoint 92 honderdtallen
	STRD	STP92_3	!setpoint 92 duizendtallen

	ANDNT	000.1
	NOP	1

L01993	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02013

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP93_0	!setpoint 93 eenheden
	STRD	STP93_1	!setpoint 93 tientallen
	STRD	STP93_2	!setpoint 93 honderdtallen
	STRD	STP93_3	!setpoint 93 duizendtallen

	ANDNT	000.1
	NOP	1

L02013	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02033

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP94_0	!setpoint 94 eenheden
	STRD	STP94_1	!setpoint 94 tientallen
	STRD	STP94_2	!setpoint 94 honderdtallen
	STRD	STP94_3	!setpoint 94 duizendtallen

	ANDNT	000.1
	NOP	1

L02033	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02053

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP95_0	!setpoint 95 eenheden
	STRD	STP95_1	!setpoint 95 tientallen
	STRD	STP95_2	!setpoint 95 honderdtallen
	STRD	STP95_3	!setpoint 95 duizendtallen

	ANDNT	000.1
	NOP	1

L02053	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02073

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP96_0	!setpoint 96 eenheden
	STRD	STP96_1	!setpoint 96 tientallen
	STRD	STP96_2	!setpoint 96 honderdtallen
	STRD	STP96_3	!setpoint 96 duizendtallen

	ANDNT	000.1
	NOP	1

L02073	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02093

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP97_0	!setpoint 97 eenheden
	STRD	STP97_1	!setpoint 97 tientallen
	STRD	STP97_2	!setpoint 97 honderdtallen
	STRD	STP97_3	!setpoint 97 duizendtallen

	ANDNT	000.1
	NOP	1

L02093	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	NOP	1

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP99_0	!setpoint 99 eenheden
	STRD	STP99_1	!setpoint 99 tientallen
	STRD	STP99_2	!setpoint 99 honderdtallen
	STRD	STP99_3	!setpoint 99 duizendtallen
	NOP	89
!                               DR_DSP
!				******
!
	AND	000.1
	FTCHC	00
	STRD	1500	!constante 0

	AND	000.1
	FTCHC	01
	STRD	1501	!constante 1

	AND	000.1
	FTCHC	02
	STRD	1502	!constante 2

	AND	000.1
	FTCHC	03
	STRD	1503	!constante 3

	AND	000.1
	FTCHC	04
	STRD	1504	!constante 4

	AND	000.1
	FTCHC	05
	STRD	1505	!constante 5

	AND	000.1
	FTCHC	06
	STRD	1506	!constante 6

	AND	000.1
	FTCHC	07
	STRD	1507	!constante 7

	AND	000.1
	FTCHC	08
	STRD	1508	!constante 8

	AND	000.1
	FTCHC	09
	STRD	1509	!constante 9

	ANDNT	LAMPTEST	!lampentest "8"
	JFRF	L04131

	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02251

	AND	RESULT1	!F=C
	FTCHD	DSP00_0	!display 00 eenheden
	FTCHD	DSP00_1	!display 00 tientallen
	FTCHD	DSP00_2	!display 00 honderdtallen
	FTCHD	DSP00_3	!display 00 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02251	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02270

	AND	RESULT1	!F=C
	FTCHD	DSP01_0	!display 01 eenheden
	FTCHD	DSP01_1	!display 01 tientallen
	FTCHD	DSP01_2	!display 01 honderdtallen
	FTCHD	DSP01_3	!display 01 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02270	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02289

	AND	RESULT1	!F=C
	FTCHD	DSP02_0	!display 02 eenheden
	FTCHD	DSP02_1	!display 02 tientallen
	FTCHD	DSP02_2	!display 02 honderdtallen
	FTCHD	DSP02_3	!display 02 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02289	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02308

	AND	RESULT1	!F=C
	FTCHD	DSP03_0	!display 03 eenheden
	FTCHD	DSP03_1	!display 03 tientallen
	FTCHD	DSP03_2	!display 03 honderdtallen
	FTCHD	DSP03_3	!display 03 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02308	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02327

	AND	RESULT1	!F=C
	FTCHD	DSP04_0	!display 04 eenheden
	FTCHD	DSP04_1	!display 04 tientallen
	FTCHD	DSP04_2	!display 04 honderdtallen
	FTCHD	DSP04_3	!display 04 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02327	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02346

	AND	RESULT1	!F=C
	FTCHD	DSP05_0	!display 05 eenheden
	FTCHD	DSP05_1	!display 05 tientallen
	FTCHD	DSP05_2	!display 05 honderdtallen
	FTCHD	DSP05_3	!display 05 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02346	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02365

	AND	RESULT1	!F=C
	FTCHD	DSP06_0	!display 06 eenheden
	FTCHD	DSP06_1	!display 06 tientallen
	FTCHD	DSP06_2	!display 06 honderdtallen
	FTCHD	DSP06_3	!display 06 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02365	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02384

	AND	RESULT1	!F=C
	FTCHD	DSP07_0	!display 07 eenheden
	FTCHD	DSP07_1	!display 07 tientallen
	FTCHD	DSP07_2	!display 07 honderdtallen
	FTCHD	DSP07_3	!display 07 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02384	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02403

	AND	RESULT1	!F=C
	FTCHD	DSP08_0	!display 08 eenheden
	FTCHD	DSP08_1	!display 08 tientallen
	FTCHD	DSP08_2	!display 08 honderdtallen
	FTCHD	DSP08_3	!display 08 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02403	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02422

	AND	RESULT1	!F=C
	FTCHD	DSP09_0	!display 09 eenheden
	FTCHD	DSP09_1	!display 09 tientallen
	FTCHD	DSP09_2	!display 09 honderdtallen
	FTCHD	DSP09_3	!display 09 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02422	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02441

	AND	RESULT1	!F=C
	FTCHD	DSP10_0	!display 10 eenheden
	FTCHD	DSP10_1	!display 10 tientallen
	FTCHD	DSP10_2	!display 10 honderdtallen
	FTCHD	DSP10_3	!display 10 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02441	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02460

	AND	RESULT1	!F=C
	FTCHD	DSP11_0	!display 11 eenheden
	FTCHD	DSP11_1	!display 11 tientallen
	FTCHD	DSP11_2	!display 11 honderdtallen
	FTCHD	DSP11_3	!display 11 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02460	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02479

	AND	RESULT1	!F=C
	FTCHD	DSP12_0	!display 12 eenheden
	FTCHD	DSP12_1	!display 12 tientallen
	FTCHD	DSP12_2	!display 12 honderdtallen
	FTCHD	DSP12_3	!display 12 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02479	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02498

	AND	RESULT1	!F=C
	FTCHD	DSP13_0	!display 13 eenheden
	FTCHD	DSP13_1	!display 13 tientallen
	FTCHD	DSP13_2	!display 13 honderdtallen
	FTCHD	DSP13_3	!display 13 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02498	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02517

	AND	RESULT1	!F=C
	FTCHD	DSP14_0	!display 14 eenheden
	FTCHD	DSP14_1	!display 14 tientallen
	FTCHD	DSP14_2	!display 14 honderdtallen
	FTCHD	DSP14_3	!display 14 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02517	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02536

	AND	RESULT1	!F=C
	FTCHD	DSP15_0	!display 15 eenheden
	FTCHD	DSP15_1	!display 15 tientallen
	FTCHD	DSP15_2	!display 15 honderdtallen
	FTCHD	DSP15_3	!display 15 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02536	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02555

	AND	RESULT1	!F=C
	FTCHD	DSP16_0	!display 16 eenheden
	FTCHD	DSP16_1	!display 16 tientallen
	FTCHD	DSP16_2	!display 16 honderdtallen
	FTCHD	DSP16_3	!display 16 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02555	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02574

	AND	RESULT1	!F=C
	FTCHD	DSP17_0	!display 17 eenheden
	FTCHD	DSP17_1	!display 17 tientallen
	FTCHD	DSP17_2	!display 17 honderdtallen
	FTCHD	DSP17_3	!display 17 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02574	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02593

	AND	RESULT1	!F=C
	FTCHD	DSP18_0	!display 18 eenheden
	FTCHD	DSP18_1	!display 18 tientallen
	FTCHD	DSP18_2	!display 18 honderdtallen
	FTCHD	DSP18_3	!display 18 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02593	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02612

	AND	RESULT1	!F=C
	FTCHD	DSP19_0	!display 19 eenheden
	FTCHD	DSP19_1	!display 19 tientallen
	FTCHD	DSP19_2	!display 19 honderdtallen
	FTCHD	DSP19_3	!display 19 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02612	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02631

	AND	RESULT1	!F=C
	FTCHD	DSP20_0	!display 20 eenheden
	FTCHD	DSP20_1	!display 20 tientallen
	FTCHD	DSP20_2	!display 20 honderdtallen
	FTCHD	DSP20_3	!display 20 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02631	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02650

	AND	RESULT1	!F=C
	FTCHD	DSP21_0	!display 21 eenheden
	FTCHD	DSP21_1	!display 21 tientallen
	FTCHD	DSP21_2	!display 21 honderdtallen
	FTCHD	DSP21_3	!display 21 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02650	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02669

	AND	RESULT1	!F=C
	FTCHD	DSP22_0	!display 22 eenheden
	FTCHD	DSP22_1	!display 22 tientallen
	FTCHD	DSP22_2	!display 22 honderdtallen
	FTCHD	DSP22_3	!display 22 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02669	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02688

	AND	RESULT1	!F=C
	FTCHD	DSP23_0	!display 23 eenheden
	FTCHD	DSP23_1	!display 23 tientallen
	FTCHD	DSP23_2	!display 23 honderdtallen
	FTCHD	DSP23_3	!display 23 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02688	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02707

	AND	RESULT1	!F=C
	FTCHD	DSP24_0	!display 24 eenheden
	FTCHD	DSP24_1	!display 24 tientallen
	FTCHD	DSP24_2	!display 24 honderdtallen
	FTCHD	DSP24_3	!display 24 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02707	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02726

	AND	RESULT1	!F=C
	FTCHD	DSP25_0	!display 25 eenheden
	FTCHD	DSP25_1	!display 25 tientallen
	FTCHD	DSP25_2	!display 25 honderdtallen
	FTCHD	DSP25_3	!display 25 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02726	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02745

	AND	RESULT1	!F=C
	FTCHD	DSP26_0	!display 26 eenheden
	FTCHD	DSP26_1	!display 26 tientallen
	FTCHD	DSP26_2	!display 26 honderdtallen
	FTCHD	DSP26_3	!display 26 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02745	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02764

	AND	RESULT1	!F=C
	FTCHD	DSP27_0	!display 27 eenheden
	FTCHD	DSP27_1	!display 27 tientallen
	FTCHD	DSP27_2	!display 27 honderdtallen
	FTCHD	DSP27_3	!display 27 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02764	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02783

	AND	RESULT1	!F=C
	FTCHD	DSP28_0	!display 28 eenheden
	FTCHD	DSP28_1	!display 28 tientallen
	FTCHD	DSP28_2	!display 28 honderdtallen
	FTCHD	DSP28_3	!display 28 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02783	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02802

	AND	RESULT1	!F=C
	FTCHD	DSP29_0	!display 29 eenheden
	FTCHD	DSP29_1	!display 29 tientallen
	FTCHD	DSP29_2	!display 29 honderdtallen
	FTCHD	DSP29_3	!display 29 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02802	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02821

	AND	RESULT1	!F=C
	FTCHD	DSP30_0	!display 30 eenheden
	FTCHD	DSP30_1	!display 30 tientallen
	FTCHD	DSP30_2	!display 30 honderdtallen
	FTCHD	DSP30_3	!display 30 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02821	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02840

	AND	RESULT1	!F=C
	FTCHD	DSP31_0	!display 31 eenheden
	FTCHD	DSP31_1	!display 31 tientallen
	FTCHD	DSP31_2	!display 31 honderdtallen
	FTCHD	DSP31_3	!display 31 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02840	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02859

	AND	RESULT1	!F=C
	FTCHD	DSP32_0	!display 32 eenheden
	FTCHD	DSP32_1	!display 32 tientallen
	FTCHD	DSP32_2	!display 32 honderdtallen
	FTCHD	DSP32_3	!display 32 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02859	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02878

	AND	RESULT1	!F=C
	FTCHD	DSP33_0	!display 33 eenheden
	FTCHD	DSP33_1	!display 33 tientallen
	FTCHD	DSP33_2	!display 33 honderdtallen
	FTCHD	DSP33_3	!display 33 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02878	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02897

	AND	RESULT1	!F=C
	FTCHD	DSP34_0	!display 34 eenheden
	FTCHD	DSP34_1	!display 34 tientallen
	FTCHD	DSP34_2	!display 34 honderdtallen
	FTCHD	DSP34_3	!display 34 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02897	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02916

	AND	RESULT1	!F=C
	FTCHD	DSP35_0	!display 35 eenheden
	FTCHD	DSP35_1	!display 35 tientallen
	FTCHD	DSP35_2	!display 35 honderdtallen
	FTCHD	DSP35_3	!display 35 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02916	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02935

	AND	RESULT1	!F=C
	FTCHD	DSP36_0	!display 36 eenheden
	FTCHD	DSP36_1	!display 36 tientallen
	FTCHD	DSP36_2	!display 36 honderdtallen
	FTCHD	DSP36_3	!display 36 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02935	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02954

	AND	RESULT1	!F=C
	FTCHD	DSP37_0	!display 37 eenheden
	FTCHD	DSP37_1	!display 37 tientallen
	FTCHD	DSP37_2	!display 37 honderdtallen
	FTCHD	DSP37_3	!display 37 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02954	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02973

	AND	RESULT1	!F=C
	FTCHD	DSP38_0	!display 38 eenheden
	FTCHD	DSP38_1	!display 38 tientallen
	FTCHD	DSP38_2	!display 38 honderdtallen
	FTCHD	DSP38_3	!display 38 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02973	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02992

	AND	RESULT1	!F=C
	FTCHD	DSP39_0	!display 39 eenheden
	FTCHD	DSP39_1	!display 39 tientallen
	FTCHD	DSP39_2	!display 39 honderdtallen
	FTCHD	DSP39_3	!display 39 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02992	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03011

	AND	RESULT1	!F=C
	FTCHD	DSP40_0	!display 40 eenheden
	FTCHD	DSP40_1	!display 40 tientallen
	FTCHD	DSP40_2	!display 40 honderdtallen
	FTCHD	DSP40_3	!display 40 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03011	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03030

	AND	RESULT1	!F=C
	FTCHD	DSP41_0	!display 41 eenheden
	FTCHD	DSP41_1	!display 41 tientallen
	FTCHD	DSP41_2	!display 41 honderdtallen
	FTCHD	DSP41_3	!display 41 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03030	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03049

	AND	RESULT1	!F=C
	FTCHD	DSP42_0	!display 42 eenheden
	FTCHD	DSP42_1	!display 42 tientallen
	FTCHD	DSP42_2	!display 42 honderdtallen
	FTCHD	DSP42_3	!display 42 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03049	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03068

	AND	RESULT1	!F=C
	FTCHD	DSP43_0	!display 43 eenheden
	FTCHD	DSP43_1	!display 43 tientallen
	FTCHD	DSP43_2	!display 43 honderdtallen
	FTCHD	DSP43_3	!display 43 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03068	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03087

	AND	RESULT1	!F=C
	FTCHD	DSP44_0	!display 44 eenheden
	FTCHD	DSP44_1	!display 44 tientallen
	FTCHD	DSP44_2	!display 44 honderdtallen
	FTCHD	DSP44_3	!display 44 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03087	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03106

	AND	RESULT1	!F=C
	FTCHD	DSP45_0	!display 45 eenheden
	FTCHD	DSP45_1	!display 45 tientallen
	FTCHD	DSP45_2	!display 45 honderdtallen
	FTCHD	DSP45_3	!display 45 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03106	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03125

	AND	RESULT1	!F=C
	FTCHD	DSP46_0	!display 46 eenheden
	FTCHD	DSP46_1	!display 46 tientallen
	FTCHD	DSP46_2	!display 46 honderdtallen
	FTCHD	DSP46_3	!display 46 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03125	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03144

	AND	RESULT1	!F=C
	FTCHD	DSP47_0	!display 47 eenheden
	FTCHD	DSP47_1	!display 47 tientallen
	FTCHD	DSP47_2	!display 47 honderdtallen
	FTCHD	DSP47_3	!display 47 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03144	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03163

	AND	RESULT1	!F=C
	FTCHD	DSP48_0	!display 48 eenheden
	FTCHD	DSP48_1	!display 48 tientallen
	FTCHD	DSP48_2	!display 48 honderdtallen
	FTCHD	DSP48_3	!display 48 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03163	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03182

	AND	RESULT1	!F=C
	FTCHD	DSP49_0	!display 49 eenheden
	FTCHD	DSP49_1	!display 49 tientallen
	FTCHD	DSP49_2	!display 49 honderdtallen
	FTCHD	DSP49_3	!display 49 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03182	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03201

	AND	RESULT1	!F=C
	FTCHD	DSP50_0	!display 50 eenheden
	FTCHD	DSP50_1	!display 50 tientallen
	FTCHD	DSP50_2	!display 50 honderdtallen
	FTCHD	DSP50_3	!display 50 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03201	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03220

	AND	RESULT1	!F=C
	FTCHD	DSP51_0	!display 51 eenheden
	FTCHD	DSP51_1	!display 51 tientallen
	FTCHD	DSP51_2	!display 51 honderdtallen
	FTCHD	DSP51_3	!display 51 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03220	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03239

	AND	RESULT1	!F=C
	FTCHD	DSP52_0	!display 52 eenheden
	FTCHD	DSP52_1	!display 52 tientallen
	FTCHD	DSP52_2	!display 52 honderdtallen
	FTCHD	DSP52_3	!display 52 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03239	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03258

	AND	RESULT1	!F=C
	FTCHD	DSP53_0	!display 53 eenheden
	FTCHD	DSP53_1	!display 53 tientallen
	FTCHD	DSP53_2	!display 53 honderdtallen
	FTCHD	DSP53_3	!display 53 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03258	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03277

	AND	RESULT1	!F=C
	FTCHD	DSP54_0	!display 54 eenheden
	FTCHD	DSP54_1	!display 54 tientallen
	FTCHD	DSP54_2	!display 54 honderdtallen
	FTCHD	DSP54_3	!display 54 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03277	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03296

	AND	RESULT1	!F=C
	FTCHD	DSP55_0	!display 55 eenheden
	FTCHD	DSP55_1	!display 55 tientallen
	FTCHD	DSP55_2	!display 55 honderdtallen
	FTCHD	DSP55_3	!display 55 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03296	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03315

	AND	RESULT1	!F=C
	FTCHD	DSP56_0	!display 56 eenheden
	FTCHD	DSP56_1	!display 56 tientallen
	FTCHD	DSP56_2	!display 56 honderdtallen
	FTCHD	DSP56_3	!display 56 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03315	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03334

	AND	RESULT1	!F=C
	FTCHD	DSP57_0	!display 57 eenheden
	FTCHD	DSP57_1	!display 57 tientallen
	FTCHD	DSP57_2	!display 57 honderdtallen
	FTCHD	DSP57_3	!display 57 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03334	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03353

	AND	RESULT1	!F=C
	FTCHD	DSP58_0	!display 58 eenheden
	FTCHD	DSP58_1	!display 58 tientallen
	FTCHD	DSP58_2	!display 58 honderdtallen
	FTCHD	DSP58_3	!display 58 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03353	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03372

	AND	RESULT1	!F=C
	FTCHD	DSP59_0	!display 59 eenheden
	FTCHD	DSP59_1	!display 59 tientallen
	FTCHD	DSP59_2	!display 59 honderdtallen
	FTCHD	DSP59_3	!display 59 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03372	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03391

	AND	RESULT1	!F=C
	FTCHD	DSP60_0	!display 60 eenheden
	FTCHD	DSP60_1	!display 60 tientallen
	FTCHD	DSP60_2	!display 60 honderdtallen
	FTCHD	DSP60_3	!display 60 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03391	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03410

	AND	RESULT1	!F=C
	FTCHD	DSP61_0	!display 61 eenheden
	FTCHD	DSP61_1	!display 61 tientallen
	FTCHD	DSP61_2	!display 61 honderdtallen
	FTCHD	DSP61_3	!display 61 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03410	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03429

	AND	RESULT1	!F=C
	FTCHD	DSP62_0	!display 62 eenheden
	FTCHD	DSP62_1	!display 62 tientallen
	FTCHD	DSP62_2	!display 62 honderdtallen
	FTCHD	DSP62_3	!display 62 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03429	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03448

	AND	RESULT1	!F=C
	FTCHD	DSP63_0	!display 63 eenheden
	FTCHD	DSP63_1	!display 63 tientallen
	FTCHD	DSP63_2	!display 63 honderdtallen
	FTCHD	DSP63_3	!display 63 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03448	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03467

	AND	RESULT1	!F=C
	FTCHD	DSP64_0	!display 64 eenheden
	FTCHD	DSP64_1	!display 64 tientallen
	FTCHD	DSP64_2	!display 64 honderdtallen
	FTCHD	DSP64_3	!display 64 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03467	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03486

	AND	RESULT1	!F=C
	FTCHD	DSP65_0	!display 65 eenheden
	FTCHD	DSP65_1	!display 65 tientallen
	FTCHD	DSP65_2	!display 65 honderdtallen
	FTCHD	DSP65_3	!display 65 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03486	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03505

	AND	RESULT1	!F=C
	FTCHD	DSP66_0	!display 66 eenheden
	FTCHD	DSP66_1	!display 66 tientallen
	FTCHD	DSP66_2	!display 66 honderdtallen
	FTCHD	DSP66_3	!display 66 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03505	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03524

	AND	RESULT1	!F=C
	FTCHD	DSP67_0	!display 67 eenheden
	FTCHD	DSP67_1	!display 67 tientallen
	FTCHD	DSP67_2	!display 67 honderdtallen
	FTCHD	DSP67_3	!display 67 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03524	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03543

	AND	RESULT1	!F=C
	FTCHD	DSP68_0	!display 68 eenheden
	FTCHD	DSP68_1	!display 68 tientallen
	FTCHD	DSP68_2	!display 68 honderdtallen
	FTCHD	DSP68_3	!display 68 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03543	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03562

	AND	RESULT1	!F=C
	FTCHD	DSP69_0	!display 69 eenheden
	FTCHD	DSP69_1	!display 69 tientallen
	FTCHD	DSP69_2	!display 69 honderdtallen
	FTCHD	DSP69_3	!display 69 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03562	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03581

	AND	RESULT1	!F=C
	FTCHD	DSP70_0	!display 70 eenheden
	FTCHD	DSP70_1	!display 70 tientallen
	FTCHD	DSP70_2	!display 70 honderdtallen
	FTCHD	DSP70_3	!display 70 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03581	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03600

	AND	RESULT1	!F=C
	FTCHD	DSP71_0	!display 71 eenheden
	FTCHD	DSP71_1	!display 71 tientallen
	FTCHD	DSP71_2	!display 71 honderdtallen
	FTCHD	DSP71_3	!display 71 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03600	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03619

	AND	RESULT1	!F=C
	FTCHD	DSP72_0	!display 72 eenheden
	FTCHD	DSP72_1	!display 72 tientallen
	FTCHD	DSP72_2	!display 72 honderdtallen
	FTCHD	DSP72_3	!display 72 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03619	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03638

	AND	RESULT1	!F=C
	FTCHD	DSP73_0	!display 73 eenheden
	FTCHD	DSP73_1	!display 73 tientallen
	FTCHD	DSP73_2	!display 73 honderdtallen
	FTCHD	DSP73_3	!display 73 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03638	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03657

	AND	RESULT1	!F=C
	FTCHD	DSP74_0	!display 74 eenheden
	FTCHD	DSP74_1	!display 74 tientallen
	FTCHD	DSP74_2	!display 74 honderdtallen
	FTCHD	DSP74_3	!display 74 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03657	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03676

	AND	RESULT1	!F=C
	FTCHD	DSP75_0	!display 75 eenheden
	FTCHD	DSP75_1	!display 75 tientallen
	FTCHD	DSP75_2	!display 75 honderdtallen
	FTCHD	DSP75_3	!display 75 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03676	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03695

	AND	RESULT1	!F=C
	FTCHD	DSP76_0	!display 76 eenheden
	FTCHD	DSP76_1	!display 76 tientallen
	FTCHD	DSP76_2	!display 76 honderdtallen
	FTCHD	DSP76_3	!display 76 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03695	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03714

	AND	RESULT1	!F=C
	FTCHD	DSP77_0	!display 77 eenheden
	FTCHD	DSP77_1	!display 77 tientallen
	FTCHD	DSP77_2	!display 77 honderdtallen
	FTCHD	DSP77_3	!display 77 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03714	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03733

	AND	RESULT1	!F=C
	FTCHD	DSP78_0	!display 78 eenheden
	FTCHD	DSP78_1	!display 78 tientallen
	FTCHD	DSP78_2	!display 78 honderdtallen
	FTCHD	DSP78_3	!display 78 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03733	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03752

	AND	RESULT1	!F=C
	FTCHD	DSP79_0	!display 79 eenheden
	FTCHD	DSP79_1	!display 79 tientallen
	FTCHD	DSP79_2	!display 79 honderdtallen
	FTCHD	DSP79_3	!display 79 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03752	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03771

	AND	RESULT1	!F=C
	FTCHD	DSP80_0	!display 80 eenheden
	FTCHD	DSP80_1	!display 80 tientallen
	FTCHD	DSP80_2	!display 80 honderdtallen
	FTCHD	DSP80_3	!display 80 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03771	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03790

	AND	RESULT1	!F=C
	FTCHD	DSP81_0	!display 81 eenheden
	FTCHD	DSP81_1	!display 81 tientallen
	FTCHD	DSP81_2	!display 81 honderdtallen
	FTCHD	DSP81_3	!display 81 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03790	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03809

	AND	RESULT1	!F=C
	FTCHD	DSP82_0	!display 82 eenheden
	FTCHD	DSP82_1	!display 82 tientallen
	FTCHD	DSP82_2	!display 82 honderdtallen
	FTCHD	DSP82_3	!display 82 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03809	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03828

	AND	RESULT1	!F=C
	FTCHD	DSP83_0	!display 83 eenheden
	FTCHD	DSP83_1	!display 83 tientallen
	FTCHD	DSP83_2	!display 83 honderdtallen
	FTCHD	DSP83_3	!display 83 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03828	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03847

	AND	RESULT1	!F=C
	FTCHD	DSP84_0	!display 84 eenheden
	FTCHD	DSP84_1	!display 84 tientallen
	FTCHD	DSP84_2	!display 84 honderdtallen
	FTCHD	DSP84_3	!display 84 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03847	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03866

	AND	RESULT1	!F=C
	FTCHD	DSP85_0	!display 85 eenheden
	FTCHD	DSP85_1	!display 85 tientallen
	FTCHD	DSP85_2	!display 85 honderdtallen
	FTCHD	DSP85_3	!display 85 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03866	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03885

	AND	RESULT1	!F=C
	FTCHD	DSP86_0	!display 86 eenheden
	FTCHD	DSP86_1	!display 86 tientallen
	FTCHD	DSP86_2	!display 86 honderdtallen
	FTCHD	DSP86_3	!display 86 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03885	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03904

	AND	RESULT1	!F=C
	FTCHD	DSP87_0	!display 87 eenheden
	FTCHD	DSP87_1	!display 87 tientallen
	FTCHD	DSP87_2	!display 87 honderdtallen
	FTCHD	DSP87_3	!display 87 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03904	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03923

	AND	RESULT1	!F=C
	FTCHD	DSP88_0	!display 88 eenheden
	FTCHD	DSP88_1	!display 88 tientallen
	FTCHD	DSP88_2	!display 88 honderdtallen
	FTCHD	DSP88_3	!display 88 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03923	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03942

	AND	RESULT1	!F=C
	FTCHD	DSP89_0	!display 89 eenheden
	FTCHD	DSP89_1	!display 89 tientallen
	FTCHD	DSP89_2	!display 89 honderdtallen
	FTCHD	DSP89_3	!display 89 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03942	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03961

	AND	RESULT1	!F=C
	FTCHD	DSP90_0	!display 90 eenheden
	FTCHD	DSP90_1	!display 90 tientallen
	FTCHD	DSP90_2	!display 90 honderdtallen
	FTCHD	DSP90_3	!display 90 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03961	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03980

	AND	RESULT1	!F=C
	FTCHD	DSP91_0	!display 91 eenheden
	FTCHD	DSP91_1	!display 91 tientallen
	FTCHD	DSP91_2	!display 91 honderdtallen
	FTCHD	DSP91_3	!display 91 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03980	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03999

	AND	RESULT1	!F=C
	FTCHD	DSP92_0	!display 92 eenheden
	FTCHD	DSP92_1	!display 92 tientallen
	FTCHD	DSP92_2	!display 92 honderdtallen
	FTCHD	DSP92_3	!display 92 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03999	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04018

	AND	RESULT1	!F=C
	FTCHD	DSP93_0	!display 93 eenheden
	FTCHD	DSP93_1	!display 93 tientallen
	FTCHD	DSP93_2	!display 93 honderdtallen
	FTCHD	DSP93_3	!display 93 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04018	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04037

	AND	RESULT1	!F=C
	FTCHD	DSP94_0	!display 94 eenheden
	FTCHD	DSP94_1	!display 94 tientallen
	FTCHD	DSP94_2	!display 94 honderdtallen
	FTCHD	DSP94_3	!display 94 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04037	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04056

	AND	RESULT1	!F=C
	FTCHD	DSP95_0	!display 95 eenheden
	FTCHD	DSP95_1	!display 95 tientallen
	FTCHD	DSP95_2	!display 95 honderdtallen
	FTCHD	DSP95_3	!display 95 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04056	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04075

	AND	RESULT1	!F=C
	FTCHD	DSP96_0	!display 96 eenheden
	FTCHD	DSP96_1	!display 96 tientallen
	FTCHD	DSP96_2	!display 96 honderdtallen
	FTCHD	DSP96_3	!display 96 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04075	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04094

	AND	RESULT1	!F=C
	FTCHD	DSP97_0	!display 97 eenheden
	FTCHD	DSP97_1	!display 97 tientallen
	FTCHD	DSP97_2	!display 97 honderdtallen
	FTCHD	DSP97_3	!display 97 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04094	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04113

	AND	RESULT1	!F=C
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04113	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04130

	AND	RESULT1	!F=C
	FTCHD	DSP99_0	!display 99 eenheden
	FTCHD	DSP99_1	!display 99 tientallen
	FTCHD	DSP99_2	!display 99 honderdtallen
	FTCHD	DSP99_3	!display 99 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.
L04130	NOP	1

L04131	AND	LAMPTEST	!lampentest "8"
	FTCHC	08
	FTCHC	08
	FTCHC	08
	FTCHC	08
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.
	NOP	60
!                               DR_KRT1
!				*******
!
!
!	aanstuurcode storing 01 in lichtkrant laden
!
	AND	VERGR01
	AND	FASE01
	FTCHC	01
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 02 in lichtkrant laden
!
	AND	VERGR02	!stuurlucht gestoord
	AND	FASE02
	FTCHC	02
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 03 in lichtkrant laden
!
	AND	VERGR03	!stuurspanning gestoord
	AND	FASE03
	FTCHC	03
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 04 in lichtkrant laden
!
	AND	VERGR04
	AND	FASE04
	FTCHC	04
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 05 in lichtkrant laden
!
	AND	VERGR05	!vuilwater tank leeg
	AND	FASE05
	FTCHC	05
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 06 in lichtkrant laden
!
	AND	VERGR06
	AND	FASE06
	FTCHC	06
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 07 in lichtkrant laden
!
	AND	VERGR07
	AND	FASE07
	FTCHC	07
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 08 in lichtkrant laden
!
	AND	VERGR08
	AND	FASE08
	FTCHC	08
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 09 in lichtkrant laden
!
	AND	VERGR09
	AND	FASE09
	FTCHC	09
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 10 in lichtkrant laden
!
	AND	VERGR10
	AND	FASE10
	FTCHC	00
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 11 in lichtkrant laden
!
	AND	VERGR11
	AND	FASE11
	FTCHC	01
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 12 in lichtkrant laden
!
	AND	VERGR12
	AND	FASE12
	FTCHC	02
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 13 in lichtkrant laden
!
	AND	VERGR13
	AND	FASE13
	FTCHC	03
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 14 in lichtkrant laden
!
	AND	VERGR14
	AND	FASE14
	FTCHC	04
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 15 in lichtkrant laden
!
	AND	VERGR15
	AND	FASE15
	FTCHC	05
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 16 in lichtkrant laden
!
	AND	VERGR16
	AND	FASE16
	FTCHC	06
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 17 in lichtkrant laden
!
	AND	VERGR17
	AND	FASE17
	FTCHC	07
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 18 in lichtkrant laden
!
	AND	VERGR18
	AND	FASE18
	FTCHC	08
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 19 in lichtkrant laden
!
	AND	VERGR19
	AND	FASE19
	FTCHC	09
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 20 in lichtkrant laden
!
	AND	VERGR20
	AND	FASE20
	FTCHC	00
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 21 in lichtkrant laden
!
	AND	VERGR21
	AND	FASE21
	FTCHC	01
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 22 in lichtkrant laden
!
	AND	VERGR22
	AND	FASE22
	FTCHC	02
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 23 in lichtkrant laden
!
	AND	VERGR23
	AND	FASE23
	FTCHC	03
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 24 in lichtkrant laden
!
	AND	VERGR24
	AND	FASE24
	FTCHC	04
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 25 in lichtkrant laden
!
	AND	VERGR25
	AND	FASE25
	FTCHC	05
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 26 in lichtkrant laden
!
	AND	VERGR26
	AND	FASE26
	FTCHC	06
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 27 in lichtkrant laden
!
	AND	VERGR27
	AND	FASE27
	FTCHC	07
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 28 in lichtkrant laden
!
	AND	VERGR28
	AND	FASE28
	FTCHC	08
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 29 in lichtkrant laden
!
	AND	VERGR29
	AND	FASE29
	FTCHC	09
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 30 in lichtkrant laden
!
	AND	VERGR30
	AND	FASE30
	FTCHC	00
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 31 in lichtkrant laden
!
	AND	VERGR31
	AND	FASE31
	FTCHC	01
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 32 in lichtkrant laden
!
	AND	VERGR32
	AND	FASE32
	FTCHC	02
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 33 in lichtkrant laden
!
	AND	VERGR33
	AND	FASE33
	FTCHC	03
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 34 in lichtkrant laden
!
	AND	VERGR34
	AND	FASE34
	FTCHC	04
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 35 in lichtkrant laden
!
	AND	VERGR35
	AND	FASE35
	FTCHC	05
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 36 in lichtkrant laden
!
	AND	VERGR36
	AND	FASE36
	FTCHC	06
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 37 in lichtkrant laden
!
	AND	VERGR37	!hoge druk alarm P10
	AND	FASE37
	FTCHC	07
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 38 in lichtkrant laden
!
	AND	VERGR38
	AND	FASE38
	FTCHC	08
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 39 in lichtkrant laden
!
	AND	VERGR39
	AND	FASE39
	FTCHC	09
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 40 in lichtkrant laden
!
	AND	VERGR40
	AND	FASE40
	FTCHC	00
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 41 in lichtkrant laden
!
	AND	VERGR41
	AND	FASE41
	FTCHC	01
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 42 in lichtkrant laden
!
	AND	VERGR42
	AND	FASE42
	FTCHC	02
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 43 in lichtkrant laden
!
	AND	VERGR43	!druk vuilproceswater
	AND	FASE43
	FTCHC	03
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 44 in lichtkrant laden
!
	AND	VERGR44	!rho proceswater
	AND	FASE44
	FTCHC	04
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 45 in lichtkrant laden
!
	AND	VERGR45	!lage flow alarm vuilproceswater
	AND	FASE45
	FTCHC	05
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 46 in lichtkrant laden
!
	AND	VERGR46	!regeneratie cmf niet op tijd gevuld
	AND	FASE46
	FTCHC	06
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 47 in lichtkrant laden
!
	AND	VERGR47	!regeneratie cmf niet op tijd geledigd
	AND	FASE47
	FTCHC	07
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 48 in lichtkrant laden
!
	AND	VERGR48
	AND	FASE48
	FTCHC	08
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 49 in lichtkrant laden
!
	AND	VERGR49
	AND	FASE49
	FTCHC	09
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 50 in lichtkrant laden
!
	AND	VERGR50
	AND	FASE50
	FTCHC	00
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 51 in lichtkrant laden
!
	AND	VERGR51
	AND	FASE51
	FTCHC	01
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 52 in lichtkrant laden
!
	AND	VERGR52
	AND	FASE52
	FTCHC	02
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 53 in lichtkrant laden
!
	AND	VERGR53
	AND	FASE53
	FTCHC	03
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 54 in lichtkrant laden
!
	AND	VERGR54
	AND	FASE54
	FTCHC	04
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 55 in lichtkrant laden
!
	AND	VERGR55
	AND	FASE55
	FTCHC	05
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 56 in lichtkrant laden
!
	AND	VERGR56
	AND	FASE56
	FTCHC	06
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 57 in lichtkrant laden
!
	AND	VERGR57
	AND	FASE57
	FTCHC	07
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 58 in lichtkrant laden
!
	AND	VERGR58
	AND	FASE58
	FTCHC	08
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 59 in lichtkrant laden
!
	AND	VERGR59
	AND	FASE59
	FTCHC	09
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 60 in lichtkrant laden
!
	AND	VERGR60
	AND	FASE60
	FTCHC	00
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 61 in lichtkrant laden
!
	AND	VERGR61
	AND	FASE61
	FTCHC	01
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 62 in lichtkrant laden
!
	AND	VERGR62
	AND	FASE62
	FTCHC	02
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 63 in lichtkrant laden
!
	AND	VERGR63
	AND	FASE63
	FTCHC	03
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 64 in lichtkrant laden
!
	AND	VERGR64
	AND	FASE64
	FTCHC	04
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 65 in lichtkrant laden
!
	AND	VERGR65
	AND	FASE65
	FTCHC	05
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 66 in lichtkrant laden
!
	AND	VERGR66
	AND	FASE66
	FTCHC	06
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 67 in lichtkrant laden
!
	AND	VERGR67
	AND	FASE67
	FTCHC	07
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 68 in lichtkrant laden
!
	AND	VERGR68
	AND	FASE68
	FTCHC	08
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 69 in lichtkrant laden
!
	AND	VERGR69
	AND	FASE69
	FTCHC	09
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 70 in lichtkrant laden
!
	AND	VERGR70
	AND	FASE70
	FTCHC	00
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 71 in lichtkrant laden
!
	AND	VERGR71
	AND	FASE71
	FTCHC	01
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 72 in lichtkrant laden
!
	AND	VERGR72
	AND	FASE72
	FTCHC	02
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 73 in lichtkrant laden
!
	AND	VERGR73
	AND	FASE73
	FTCHC	03
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 74 in lichtkrant laden
!
	AND	VERGR74
	AND	FASE74
	FTCHC	04
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 75 in lichtkrant laden
!
	AND	VERGR75
	AND	FASE75
	FTCHC	05
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 76 in lichtkrant laden
!
	AND	VERGR76
	AND	FASE76
	FTCHC	06
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 77 in lichtkrant laden
!
	AND	VERGR77
	AND	FASE77
	FTCHC	07
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 78 in lichtkrant laden
!
	AND	VERGR78
	AND	FASE78
	FTCHC	08
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	kijken of er nog een alarm aanwezig is
!
	OR	VERGR01
	OR	VERGR02	!stuurlucht gestoord
	OR	VERGR03	!stuurspanning gestoord
	OR	VERGR04
	OR	VERGR05	!vuilwater tank leeg
	OR	VERGR06
	OR	VERGR07
	OR	VERGR08
	OR	VERGR09
	OR	VERGR10
	OR	VERGR11
	OR	VERGR12
	OR	VERGR13
	OR	VERGR14
	OR	VERGR15
	OR	VERGR16
	OR	VERGR17
	OR	VERGR18
	OR	VERGR19
	OR	VERGR20
	OR	VERGR21
	OR	VERGR22
	OR	VERGR23
	OR	VERGR24
	OR	VERGR25
	OR	VERGR26
	OR	VERGR27
	OR	VERGR28
	OR	VERGR29
	OR	VERGR30
	OR	VERGR31
	OR	VERGR32
	OR	VERGR33
	OR	VERGR34
	OR	VERGR35
	OR	VERGR36
	OR	VERGR37	!hoge druk alarm P10
	OR	VERGR38
	OR	VERGR39
	OR	VERGR40
	OR	VERGR41
	OR	VERGR42
	OR	VERGR43	!druk vuilproceswater
	OR	VERGR44	!rho proceswater
	OR	VERGR45	!lage flow alarm vuilproceswater
	OR	VERGR46	!regeneratie cmf niet op tijd gevuld
	OR	VERGR47	!regeneratie cmf niet op tijd geledigd
	OR	VERGR48
	OR	VERGR49
	OR	VERGR50
	OR	VERGR51
	OR	VERGR52
	OR	VERGR53
	OR	VERGR54
	OR	VERGR55
	OR	VERGR56
	OR	VERGR57
	OR	VERGR58
	OR	VERGR59
	OR	VERGR60
	OR	VERGR61
	OR	VERGR62
	OR	VERGR63
	OR	VERGR64
	OR	VERGR65
	OR	VERGR66
	OR	VERGR67
	OR	VERGR68
	OR	VERGR69
	OR	VERGR70
	OR	VERGR71
	OR	VERGR72
	OR	VERGR73
	OR	VERGR74
	OR	VERGR75
	OR	VERGR76
	OR	VERGR77
	OR	VERGR78
  EQL ST_AANW !storing aanwezig ?
!
!	indien geen storing, clear storingsbuffer
!
  ANDNT ST_AANW !storing aanwezig ?
	FTCHC	00
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
	AND	BDR0B00	!start bedrijf fasen 1 t/m 6
	FTCHC	01
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
  AND BDR0I01 !bedrijfskeuze schak. "STAND_BY"
  ORNT  ST_AANW !storing aanwezig ?
  AND WZC0B13 !wizconcommando STAND_BY + KEUZESCHAK.=SU
	FTCHC	02
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	FTCHC	03
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	AND	REG0B42	!regeneratieaanvraag
	FTCHC	04
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	AND	REG0B42	!regeneratieaanvraag
	ANDNT	ALM0B25	!regeneratieaanvraag (claxon)
	ANDNT	CA07
	AND	REG0B46	!openen commando V10.4
  ORNT  ST_AANW !storing aanwezig ?
	AND	WZC0B15	!wizconcommando SPUIEN + KEUZESCHAK.=SUPE
	FTCHC	05
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
	NOP	41
!                               DR_KRT2
!				*******
!
  AND ST_AANW !storing aanwezig ?
	AND	STAPDRKN	!doorstappen lichtkrant
	TRIG	STAP	!triggerpuls
	EQL	DOORSTAP	!fasedoorstappuls door drukknop

	OR	FASESPRG	!fase overspringen
	OR	TIMER01
	OR	DOORSTAP	!fasedoorstappuls door drukknop
  EQL STAP_1  !fasedoorstappuls

	AND	FASE78
  AND STAP_1  !fasedoorstappuls
	SET0	FASE78

	AND	FASE77
  AND STAP_1  !fasedoorstappuls
	SET1	FASE78
	SET0	FASE77

	AND	FASE76
  AND STAP_1  !fasedoorstappuls
	SET1	FASE77
	SET0	FASE76

	AND	FASE75
  AND STAP_1  !fasedoorstappuls
	SET1	FASE76
	SET0	FASE75

	AND	FASE74
  AND STAP_1  !fasedoorstappuls
	SET1	FASE75
	SET0	FASE74

	AND	FASE73
  AND STAP_1  !fasedoorstappuls
	SET1	FASE74
	SET0	FASE73

	AND	FASE72
  AND STAP_1  !fasedoorstappuls
	SET1	FASE73
	SET0	FASE72

	AND	FASE71
  AND STAP_1  !fasedoorstappuls
	SET1	FASE72
	SET0	FASE71

	AND	FASE70
  AND STAP_1  !fasedoorstappuls
	SET1	FASE71
	SET0	FASE70

	AND	FASE69
  AND STAP_1  !fasedoorstappuls
	SET1	FASE70
	SET0	FASE69

	AND	FASE68
  AND STAP_1  !fasedoorstappuls
	SET1	FASE69
	SET0	FASE68

	AND	FASE67
  AND STAP_1  !fasedoorstappuls
	SET1	FASE68
	SET0	FASE67

	AND	FASE66
  AND STAP_1  !fasedoorstappuls
	SET1	FASE67
	SET0	FASE66

	AND	FASE65
  AND STAP_1  !fasedoorstappuls
	SET1	FASE66
	SET0	FASE65

	AND	FASE64
  AND STAP_1  !fasedoorstappuls
	SET1	FASE65
	SET0	FASE64

	AND	FASE63
  AND STAP_1  !fasedoorstappuls
	SET1	FASE64
	SET0	FASE63

	AND	FASE62
  AND STAP_1  !fasedoorstappuls
	SET1	FASE63
	SET0	FASE62

	AND	FASE61
  AND STAP_1  !fasedoorstappuls
	SET1	FASE62
	SET0	FASE61

	AND	FASE60
  AND STAP_1  !fasedoorstappuls
	SET1	FASE61
	SET0	FASE60

	AND	FASE59
  AND STAP_1  !fasedoorstappuls
	SET1	FASE60
	SET0	FASE59

	AND	FASE58
  AND STAP_1  !fasedoorstappuls
	SET1	FASE59
	SET0	FASE58

	AND	FASE57
  AND STAP_1  !fasedoorstappuls
	SET1	FASE58
	SET0	FASE57

	AND	FASE56
  AND STAP_1  !fasedoorstappuls
	SET1	FASE57
	SET0	FASE56

	AND	FASE55
  AND STAP_1  !fasedoorstappuls
	SET1	FASE56
	SET0	FASE55

	AND	FASE54
  AND STAP_1  !fasedoorstappuls
	SET1	FASE55
	SET0	FASE54

	AND	FASE53
  AND STAP_1  !fasedoorstappuls
	SET1	FASE54
	SET0	FASE53

	AND	FASE52
  AND STAP_1  !fasedoorstappuls
	SET1	FASE53
	SET0	FASE52

	AND	FASE51
  AND STAP_1  !fasedoorstappuls
	SET1	FASE52
	SET0	FASE51

	AND	FASE50
  AND STAP_1  !fasedoorstappuls
	SET1	FASE51
	SET0	FASE50

	AND	FASE49
  AND STAP_1  !fasedoorstappuls
	SET1	FASE50
	SET0	FASE49

	AND	FASE48
  AND STAP_1  !fasedoorstappuls
	SET1	FASE49
	SET0	FASE48

	AND	FASE47
  AND STAP_1  !fasedoorstappuls
	SET1	FASE48
	SET0	FASE47

	AND	FASE46
  AND STAP_1  !fasedoorstappuls
	SET1	FASE47
	SET0	FASE46

	AND	FASE45
  AND STAP_1  !fasedoorstappuls
	SET1	FASE46
	SET0	FASE45

	AND	FASE44
  AND STAP_1  !fasedoorstappuls
	SET1	FASE45
	SET0	FASE44

	AND	FASE43
  AND STAP_1  !fasedoorstappuls
	SET1	FASE44
	SET0	FASE43

	AND	FASE42
  AND STAP_1  !fasedoorstappuls
	SET1	FASE43
	SET0	FASE42

	AND	FASE41
  AND STAP_1  !fasedoorstappuls
	SET1	FASE42
	SET0	FASE41

	AND	FASE40
  AND STAP_1  !fasedoorstappuls
	SET1	FASE41
	SET0	FASE40

	AND	FASE39
  AND STAP_1  !fasedoorstappuls
	SET1	FASE40
	SET0	FASE39

	AND	FASE38
  AND STAP_1  !fasedoorstappuls
	SET1	FASE39
	SET0	FASE38

	AND	FASE37
  AND STAP_1  !fasedoorstappuls
	SET1	FASE38
	SET0	FASE37

	AND	FASE36
  AND STAP_1  !fasedoorstappuls
	SET1	FASE37
	SET0	FASE36

	AND	FASE35
  AND STAP_1  !fasedoorstappuls
	SET1	FASE36
	SET0	FASE35

	AND	FASE34
  AND STAP_1  !fasedoorstappuls
	SET1	FASE35
	SET0	FASE34

	AND	FASE33
  AND STAP_1  !fasedoorstappuls
	SET1	FASE34
	SET0	FASE33

	AND	FASE32
  AND STAP_1  !fasedoorstappuls
	SET1	FASE33
	SET0	FASE32

	AND	FASE31
  AND STAP_1  !fasedoorstappuls
	SET1	FASE32
	SET0	FASE31

	AND	FASE30
  AND STAP_1  !fasedoorstappuls
	SET1	FASE31
	SET0	FASE30

	AND	FASE29
  AND STAP_1  !fasedoorstappuls
	SET1	FASE30
	SET0	FASE29

	AND	FASE28
  AND STAP_1  !fasedoorstappuls
	SET1	FASE29
	SET0	FASE28

	AND	FASE27
  AND STAP_1  !fasedoorstappuls
	SET1	FASE28
	SET0	FASE27

	AND	FASE26
  AND STAP_1  !fasedoorstappuls
	SET1	FASE27
	SET0	FASE26

	AND	FASE25
  AND STAP_1  !fasedoorstappuls
	SET1	FASE26
	SET0	FASE25

	AND	FASE24
  AND STAP_1  !fasedoorstappuls
	SET1	FASE25
	SET0	FASE24

	AND	FASE23
  AND STAP_1  !fasedoorstappuls
	SET1	FASE24
	SET0	FASE23

	AND	FASE22
  AND STAP_1  !fasedoorstappuls
	SET1	FASE23
	SET0	FASE22

	AND	FASE21
  AND STAP_1  !fasedoorstappuls
	SET1	FASE22
	SET0	FASE21

	AND	FASE20
  AND STAP_1  !fasedoorstappuls
	SET1	FASE21
	SET0	FASE20

	AND	FASE19
  AND STAP_1  !fasedoorstappuls
	SET1	FASE20
	SET0	FASE19

	AND	FASE18
  AND STAP_1  !fasedoorstappuls
	SET1	FASE19
	SET0	FASE18

	AND	FASE17
  AND STAP_1  !fasedoorstappuls
	SET1	FASE18
	SET0	FASE17

	AND	FASE16
  AND STAP_1  !fasedoorstappuls
	SET1	FASE17
	SET0	FASE16

	AND	FASE15
  AND STAP_1  !fasedoorstappuls
	SET1	FASE16
	SET0	FASE15

	AND	FASE14
  AND STAP_1  !fasedoorstappuls
	SET1	FASE15
	SET0	FASE14

	AND	FASE13
  AND STAP_1  !fasedoorstappuls
	SET1	FASE14
	SET0	FASE13

	AND	FASE12
  AND STAP_1  !fasedoorstappuls
	SET1	FASE13
	SET0	FASE12

	AND	FASE11
  AND STAP_1  !fasedoorstappuls
	SET1	FASE12
	SET0	FASE11

	AND	FASE10
  AND STAP_1  !fasedoorstappuls
	SET1	FASE11
	SET0	FASE10

	AND	FASE09
  AND STAP_1  !fasedoorstappuls
	SET1	FASE10
	SET0	FASE09

	AND	FASE08
  AND STAP_1  !fasedoorstappuls
	SET1	FASE09
	SET0	FASE08

	AND	FASE07
  AND STAP_1  !fasedoorstappuls
	SET1	FASE08
	SET0	FASE07

	AND	FASE06
  AND STAP_1  !fasedoorstappuls
	SET1	FASE07
	SET0	FASE06

	AND	FASE05
  AND STAP_1  !fasedoorstappuls
	SET1	FASE06
	SET0	FASE05

	AND	FASE04
  AND STAP_1  !fasedoorstappuls
	SET1	FASE05
	SET0	FASE04

	AND	FASE03
  AND STAP_1  !fasedoorstappuls
	SET1	FASE04
	SET0	FASE03

	AND	FASE02
  AND STAP_1  !fasedoorstappuls
	SET1	FASE03
	SET0	FASE02

	AND	FASE01
  AND STAP_1  !fasedoorstappuls
	SET1	FASE02
	SET0	FASE01

	ANDNT	FASE78
	TRIG	PULS78	!triggerpuls einde fase 78
	EQL	STAP01	!doorstappuls fase 78 naar fase 01

  AND ST_AANW !storing aanwezig ?
  AND STAP_1  !fasedoorstappuls
	AND	STAP01	!doorstappuls fase 78 naar fase 01
	TRIG	STAPPULS	!triggerpuls rondstap
	EQL	RONDSTAP	!stap van fase 78 naar fase 01

  AND ST_AANW !storing aanwezig ?
	TRIG	STARTP	!triggerpuls start
	EQL	START	!start storingcode's naar lichtkrant

	AND	RONDSTAP	!stap van fase 78 naar fase 01
	OR	START	!start storingcode's naar lichtkrant
	SET1	FASE01

  AND STAP_1  !fasedoorstappuls
	AND	TIMER01
	OR	START	!start storingcode's naar lichtkrant
	FTCHC	02
	FTCHC	00
	FTCHC	00
	FTCHC	00
	STRD	DSP99_0	!display 99 eenheden
	STRD	DSP99_1	!display 99 tientallen
	STRD	DSP99_2	!display 99 honderdtallen
	STRD	DSP99_3	!display 99 duizendtallen
	SET0	TIMER01
  EQLNT STAP_1  !fasedoorstappuls

	AND	KNIPPER
	ANDNT	TIMER01
  AND ST_AANW !storing aanwezig ?
	TRIG	TRIGTIM	!triggerpuls timer01
	CNTD	DSP99_0	!display 99 eenheden
	CNTD	DSP99_1	!display 99 tientallen
	CNTD	DSP99_2	!display 99 honderdtallen
	CNTD	DSP99_3	!display 99 duizendtallen
	STRB	TIMER01

	AND	FASE01
	ANDNT	VERGR01
	EQL	VRIJG01	!vrijgave fase

	AND	FASE02
	ANDNT	VERGR02	!stuurlucht gestoord
	EQL	VRIJG02	!vrijgave fase

	AND	FASE03
	ANDNT	VERGR03	!stuurspanning gestoord
	EQL	VRIJG03	!vrijgave fase

	AND	FASE04
	ANDNT	VERGR04
	EQL	VRIJG04	!vrijgave fase

	AND	FASE05
	ANDNT	VERGR05	!vuilwater tank leeg
	EQL	VRIJG05	!vrijgave fase

	AND	FASE06
	ANDNT	VERGR06
	EQL	VRIJG06	!vrijgave fase

	AND	FASE07
	ANDNT	VERGR07
	EQL	VRIJG07	!vrijgave fase

	AND	FASE08
	ANDNT	VERGR08
	EQL	VRIJG08	!vrijgave fase

	AND	FASE09
	ANDNT	VERGR09
	EQL	VRIJG09	!vrijgave fase

	AND	FASE10
	ANDNT	VERGR10
	EQL	VRIJG10	!vrijgave fase

	AND	FASE11
	ANDNT	VERGR11
	EQL	VRIJG11	!vrijgave fase

	AND	FASE12
	ANDNT	VERGR12
	EQL	VRIJG12	!vrijgave fase

	AND	FASE13
	ANDNT	VERGR13
	EQL	VRIJG13	!vrijgave fase

	AND	FASE14
	ANDNT	VERGR14
	EQL	VRIJG14	!vrijgave fase

	AND	FASE15
	ANDNT	VERGR15
	EQL	VRIJG15	!vrijgave fase

	AND	FASE16
	ANDNT	VERGR16
	EQL	VRIJG16	!vrijgave fase

	AND	FASE17
	ANDNT	VERGR17
	EQL	VRIJG17	!vrijgave fase

	AND	FASE18
	ANDNT	VERGR18
	EQL	VRIJG18	!vrijgave fase

	AND	FASE19
	ANDNT	VERGR19
	EQL	VRIJG19	!vrijgave fase

	AND	FASE20
	ANDNT	VERGR20
	EQL	VRIJG20	!vrijgave fase

	AND	FASE21
	ANDNT	VERGR21
	EQL	VRIJG21	!vrijgave fase

	AND	FASE22
	ANDNT	VERGR22
	EQL	VRIJG22	!vrijgave fase

	AND	FASE23
	ANDNT	VERGR23
	EQL	VRIJG23	!vrijgave fase

	AND	FASE24
	ANDNT	VERGR24
	EQL	VRIJG24	!vrijgave fase

	AND	FASE25
	ANDNT	VERGR25
	EQL	VRIJG25	!vrijgave fase

	AND	FASE26
	ANDNT	VERGR26
	EQL	VRIJG26	!vrijgave fase

	AND	FASE27
	ANDNT	VERGR27
	EQL	VRIJG27	!vrijgave fase

	AND	FASE28
	ANDNT	VERGR28
	EQL	VRIJG28	!vrijgave fase

	AND	FASE29
	ANDNT	VERGR29
	EQL	VRIJG29	!vrijgave fase

	AND	FASE30
	ANDNT	VERGR30
	EQL	VRIJG30	!vrijgave fase

	AND	FASE31
	ANDNT	VERGR31
	EQL	VRIJG31	!vrijgave fase

	AND	FASE32
	ANDNT	VERGR32
	EQL	VRIJG32	!vrijgave fase

	AND	FASE33
	ANDNT	VERGR33
	EQL	VRIJG33	!vrijgave fase

	AND	FASE34
	ANDNT	VERGR34
	EQL	VRIJG34	!vrijgave fase

	AND	FASE35
	ANDNT	VERGR35
	EQL	VRIJG35	!vrijgave fase

	AND	FASE36
	ANDNT	VERGR36
	EQL	VRIJG36	!vrijgave fase

	AND	FASE37
	ANDNT	VERGR37	!hoge druk alarm P10
	EQL	VRIJG37	!vrijgave fase

	AND	FASE38
	ANDNT	VERGR38
	EQL	VRIJG38	!vrijgave fase

	AND	FASE39
	ANDNT	VERGR39
	EQL	VRIJG39	!vrijgave fase

	AND	FASE40
	ANDNT	VERGR40
	EQL	VRIJG40	!vrijgave fase

	AND	FASE41
	ANDNT	VERGR41
	EQL	VRIJG41	!vrijgave fase

	AND	FASE42
	ANDNT	VERGR42
	EQL	VRIJG42	!vrijgave fase

	AND	FASE43
	ANDNT	VERGR43	!druk vuilproceswater
	EQL	VRIJG43	!vrijgave fase

	AND	FASE44
	ANDNT	VERGR44	!rho proceswater
	EQL	VRIJG44	!vrijgave fase

	AND	FASE45
	ANDNT	VERGR45	!lage flow alarm vuilproceswater
	EQL	VRIJG45	!vrijgave fase

	AND	FASE46
	ANDNT	VERGR46	!regeneratie cmf niet op tijd gevuld
	EQL	VRIJG46	!vrijgave fase

	AND	FASE47
	ANDNT	VERGR47	!regeneratie cmf niet op tijd geledigd
	EQL	VRIJG47	!vrijgave fase

	AND	FASE48
	ANDNT	VERGR48
	EQL	VRIJG48	!vrijgave fase

	AND	FASE49
	ANDNT	VERGR49
	EQL	VRIJG49	!vrijgave fase

	AND	FASE50
	ANDNT	VERGR50
	EQL	VRIJG50	!vrijgave fase

	AND	FASE51
	ANDNT	VERGR51
	EQL	VRIJG51	!vrijgave fase

	AND	FASE52
	ANDNT	VERGR52
	EQL	VRIJG52	!vrijgave fase

	AND	FASE53
	ANDNT	VERGR53
	EQL	VRIJG53	!vrijgave fase

	AND	FASE54
	ANDNT	VERGR54
	EQL	VRIJG54	!vrijgave fase

	AND	FASE55
	ANDNT	VERGR55
	EQL	VRIJG55	!vrijgave fase

	AND	FASE56
	ANDNT	VERGR56
	EQL	VRIJG56	!vrijgave fase

	AND	FASE57
	ANDNT	VERGR57
	EQL	VRIJG57	!vrijgave fase

	AND	FASE58
	ANDNT	VERGR58
	EQL	VRIJG58	!vrijgave fase

	AND	FASE59
	ANDNT	VERGR59
	EQL	VRIJG59	!vrijgave fase

	AND	FASE60
	ANDNT	VERGR60
	EQL	VRIJG60	!vrijgave fase

	AND	FASE61
	ANDNT	VERGR61
	EQL	VRIJG61	!vrijgave fase

	AND	FASE62
	ANDNT	VERGR62
	EQL	VRIJG62	!vrijgave fase

	AND	FASE63
	ANDNT	VERGR63
	EQL	VRIJG63	!vrijgave fase

	AND	FASE64
	ANDNT	VERGR64
	EQL	VRIJG64	!vrijgave fase

	AND	FASE65
	ANDNT	VERGR65
	EQL	VRIJG65	!vrijgave fase

	AND	FASE66
	ANDNT	VERGR66
	EQL	VRIJG66	!vrijgave fase

	AND	FASE67
	ANDNT	VERGR67
	EQL	VRIJG67	!vrijgave fase

	AND	FASE68
	ANDNT	VERGR68
	EQL	VRIJG68	!vrijgave fase

	AND	FASE69
	ANDNT	VERGR69
	EQL	VRIJG69	!vrijgave fase

	AND	FASE70
	ANDNT	VERGR70
	EQL	VRIJG70	!vrijgave fase

	AND	FASE71
	ANDNT	VERGR71
	EQL	VRIJG71	!vrijgave fase

	AND	FASE72
	ANDNT	VERGR72
	EQL	VRIJG72	!vrijgave fase

	AND	FASE73
	ANDNT	VERGR73
	EQL	VRIJG73	!vrijgave fase

	AND	FASE74
	ANDNT	VERGR74
	EQL	VRIJG74	!vrijgave fase

	AND	FASE75
	ANDNT	VERGR75
	EQL	VRIJG75	!vrijgave fase

	AND	FASE76
	ANDNT	VERGR76
	EQL	VRIJG76	!vrijgave fase

	AND	FASE77
	ANDNT	VERGR77
	EQL	VRIJG77	!vrijgave fase

	AND	FASE78
	ANDNT	VERGR78
	EQL	VRIJG78	!vrijgave fase

	OR	VRIJG01	!vrijgave fase
	OR	VRIJG02	!vrijgave fase
	OR	VRIJG03	!vrijgave fase
	OR	VRIJG04	!vrijgave fase
	OR	VRIJG05	!vrijgave fase
	OR	VRIJG06	!vrijgave fase
	OR	VRIJG07	!vrijgave fase
	OR	VRIJG08	!vrijgave fase
	OR	VRIJG09	!vrijgave fase
	OR	VRIJG10	!vrijgave fase
	OR	VRIJG11	!vrijgave fase
	OR	VRIJG12	!vrijgave fase
	OR	VRIJG13	!vrijgave fase
	OR	VRIJG14	!vrijgave fase
	OR	VRIJG15	!vrijgave fase
	OR	VRIJG16	!vrijgave fase
	OR	VRIJG17	!vrijgave fase
	OR	VRIJG18	!vrijgave fase
	OR	VRIJG19	!vrijgave fase
	OR	VRIJG20	!vrijgave fase
	OR	VRIJG21	!vrijgave fase
	OR	VRIJG22	!vrijgave fase
	OR	VRIJG23	!vrijgave fase
	OR	VRIJG24	!vrijgave fase
	OR	VRIJG25	!vrijgave fase
	OR	VRIJG26	!vrijgave fase
	OR	VRIJG27	!vrijgave fase
	OR	VRIJG28	!vrijgave fase
	OR	VRIJG29	!vrijgave fase
	OR	VRIJG30	!vrijgave fase
	OR	VRIJG31	!vrijgave fase
	OR	VRIJG32	!vrijgave fase
	OR	VRIJG33	!vrijgave fase
	OR	VRIJG34	!vrijgave fase
	OR	VRIJG35	!vrijgave fase
	OR	VRIJG36	!vrijgave fase
	OR	VRIJG37	!vrijgave fase
	OR	VRIJG38	!vrijgave fase
	OR	VRIJG39	!vrijgave fase
	OR	VRIJG40	!vrijgave fase
	OR	VRIJG41	!vrijgave fase
	OR	VRIJG42	!vrijgave fase
	OR	VRIJG43	!vrijgave fase
	OR	VRIJG44	!vrijgave fase
	OR	VRIJG45	!vrijgave fase
	OR	VRIJG46	!vrijgave fase
	OR	VRIJG47	!vrijgave fase
	OR	VRIJG48	!vrijgave fase
	OR	VRIJG49	!vrijgave fase
	OR	VRIJG50	!vrijgave fase
	OR	VRIJG51	!vrijgave fase
	OR	VRIJG52	!vrijgave fase
	OR	VRIJG53	!vrijgave fase
	OR	VRIJG54	!vrijgave fase
	OR	VRIJG55	!vrijgave fase
	OR	VRIJG56	!vrijgave fase
	OR	VRIJG57	!vrijgave fase
	OR	VRIJG58	!vrijgave fase
	OR	VRIJG59	!vrijgave fase
	OR	VRIJG60	!vrijgave fase
	OR	VRIJG61	!vrijgave fase
	OR	VRIJG62	!vrijgave fase
	OR	VRIJG63	!vrijgave fase
	OR	VRIJG64	!vrijgave fase
	OR	VRIJG65	!vrijgave fase
	OR	VRIJG66	!vrijgave fase
	OR	VRIJG67	!vrijgave fase
	OR	VRIJG68	!vrijgave fase
	OR	VRIJG69	!vrijgave fase
	OR	VRIJG70	!vrijgave fase
	OR	VRIJG71	!vrijgave fase
	OR	VRIJG72	!vrijgave fase
	OR	VRIJG73	!vrijgave fase
	OR	VRIJG74	!vrijgave fase
	OR	VRIJG75	!vrijgave fase
	OR	VRIJG76	!vrijgave fase
	OR	VRIJG77	!vrijgave fase
	OR	VRIJG78	!vrijgave fase
	EQL	FASESPRG	!fase overspringen

  ANDNT ST_AANW !storing aanwezig ?
	FTCHC	00
	STRD	0055
	STRD	0056
	STRD	0057
	STRD	0058
	STRD	0059
	STRD	0060
	STRD	0061
	STRD	0062
	STRD	0063
	STRD	0064
	STRD	0065
	STRD	0066
	STRD	0067
	STRD	0068
	STRD	0069
	STRD	0070
	STRD	0071
	STRD	0072
	STRD	0073
	STRD	0074
	NOP	110
!                               DR_DISPL
!				********
!
	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B05	!bedrijfsfase 5
  OR  FASE_7  !fase 7
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B17	!regeneratiefase 17
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B23	!regeneratiefase 23
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B27	!regeneratiefase 27
	OR	REG0B29	!regeneratiefase 29
	OR	REG0B31	!regeneratiefase 31
	OR	REG0B33	!regeneratiefase 33
	OR	REG0B61
	OR	REG0B63
	OR	REG0B65
	EQL	DSP0L01

	OR	BDR0B02
	OR	BDR0B03
	OR	BDR0B06
  OR  FASE_7
	OR	REG0B12
	OR	REG0B13
	OR	REG0B16
	OR	REG0B17
	OR	REG0B22
	OR	REG0B23
	OR	REG0B26
	OR	REG0B27
	OR	REG0B32
	OR	REG0B33
	OR	REG0B62
	OR	REG0B63
	EQL	DSP0L02

	OR	BDR0B04
	OR	BDR0B05
	OR	BDR0B06
  OR  FASE_7
	OR	REG0B14
	OR	REG0B15
	OR	REG0B16
	OR	REG0B17
	OR	REG0B24
	OR	REG0B25
	OR	REG0B26
	OR	REG0B27
	OR	REG0B34
	OR	REG0B64
	OR	REG0B65
	EQL	DSP0L04

	OR	REG0B08
	OR	REG0B09
	OR	REG0B18
	OR	REG0B19
	OR	REG0B28
	OR	REG0B29
	OR	REG0B88
	EQL	DSP0L08

	OR	REG0B10
	OR	REG0B11
	OR	REG0B12
	OR	REG0B13
	OR	REG0B14
	OR	REG0B15
	OR	REG0B16
	OR	REG0B17
	OR	REG0B18
	OR	REG0B19
	OR	REG0B30
	OR	REG0B31
	OR	REG0B32
	OR	REG0B33
	OR	REG0B34
	EQL	DSP0L10

	OR	REG0B20
	OR	REG0B21
	OR	REG0B22
	OR	REG0B23
	OR	REG0B24
	OR	REG0B25
	OR	REG0B26
	OR	REG0B27
	OR	REG0B28
	OR	REG0B29
	OR	REG0B30
	OR	REG0B31
	OR	REG0B32
	OR	REG0B33
	OR	REG0B34
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
	EQL	DSP0L20

	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
	EQL	DSP0L40

	OR	REG0B88
	EQL	DSP0L80

	AND	DSP0L01
  ANDNT FASE_7
  OR  FASE_7
	EQL	DISPL01

	AND	DSP0L02
  ANDNT FASE_7
  OR  FASE_7
	EQL	DISPL02

	AND	DSP0L04
  ANDNT FASE_7
  OR  FASE_7
	EQL	DISPL04

	AND	DSP0L08
  ANDNT FASE_7
	EQL	DISPL08

	AND	DSP0L10
  ANDNT FASE_7
	EQL	DISPL10

	AND	DSP0L20
  ANDNT FASE_7
	EQL	DISPL20

	AND	DSP0L40
  ANDNT FASE_7
	EQL	DISPL40

	AND	DSP0L80
  ANDNT FASE_7
	EQL	DISPL80

!
!	lampentest 2 decaden display
!
	AND	LAMPTEST
	FTCHC	08
	FTCHC	08
	STRD	DSP1
	STRD	DSP2
	NOP	59
!                               DR_VEN
!				******
!
	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_1

	AND	REG0B33	!regeneratiefase 33
  AND R_VOORW !regeneratievoorw. OK
  EQL DUMP_2

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_1
  EQL DUMP_3

  OR  DUMP_2
  OR  DUMP_3
	EQL	V10_1
	EQL	V10_2
	EQL	V10_3

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B05	!bedrijfsfase 5
  EQL DUMP_4

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_4
	EQL	V9_1

	OR	REG0B08	!regeneratiefase 8
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B10	!regeneratiefase 10
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B12	!regeneratiefase 12
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B17	!regeneratiefase 17
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B26	!regeneratiefase 26
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
  EQL DUMP_5
!
! timer 40 t.b.v. afsluiters V1.3, V3.3, V5.3 tijdens fase 32
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	REG0B32	!regeneratiefase 32
  ANDNT TIMER_40
	CNTD	DSP40_0	!display 40 eenheden
	CNTD	DSP40_1	!display 40 tientallen
	CNTD	DSP40_2	!display 40 honderdtallen
	CNTD	DSP40_3	!display 40 duizendtallen
  STRB  TIMER_40

	ANDNT	REG0B32	!regeneratiefase 32
	FTCHD	STP40_0	!setpoint 40 eenheden
	FTCHD	STP40_1	!setpoint 40 tientallen
	FTCHD	STP40_2	!setpoint 40 honderdtallen
	FTCHD	STP40_3	!setpoint 40 duizendtallen
	STRD	DSP40_0	!display 40 eenheden
	STRD	DSP40_1	!display 40 tientallen
	STRD	DSP40_2	!display 40 honderdtallen
	STRD	DSP40_3	!display 40 duizendtallen
  SET0  TIMER_40

  ANDNT TIMER_40
	AND	REG0B32	!regeneratiefase 32
  EQL DUMP_6

  OR  DUMP_5
  OR  DUMP_6
  EQL DUMP_7

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_7
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V1_3
	EQL	V3_3
	EQL	V5_3

	OR	REG0B08	!regeneratiefase 8
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B20	!regeneratiefase 20
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B24	!regeneratiefase 24
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B27	!regeneratiefase 27
	OR	REG0B29	!regeneratiefase 29
	OR	REG0B31	!regeneratiefase 31
	OR	REG0B32	!regeneratiefase 32
	OR	REG0B60
	OR	REG0B63
  EQL DUMP_8
!
! timer 41 t.b.v. afsluiters V12.1, V12.2, V12.3 tijdens fase 7
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND FASE_7  !fase 7
  ANDNT TIMER_41
	CNTD	DSP41_0	!display 41 eenheden
	CNTD	DSP41_1	!display 41 tientallen
	CNTD	DSP41_2	!display 41 honderdtallen
	CNTD	DSP41_3	!display 41 duizendtallen
  STRB  TIMER_41

  ANDNT FASE_7  !fase 7
	FTCHD	STP41_0	!setpoint 41 eenheden
	FTCHD	STP41_1	!setpoint 41 tientallen
	FTCHD	STP41_2	!setpoint 41 honderdtallen
	FTCHD	STP41_3	!setpoint 41 duizendtallen
	STRD	DSP41_0	!display 41 eenheden
	STRD	DSP41_1	!display 41 tientallen
	STRD	DSP41_2	!display 41 honderdtallen
	STRD	DSP41_3	!display 41 duizendtallen
  SET0  TIMER_41

  ANDNT TIMER_41
  AND FASE_7  !fase 7
  EQL DUMP_9

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_8
  EQL DUMP_10

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_9
  EQL DUMP_11

  OR  DUMP_10
  OR  DUMP_11
	OR	REG0B54	!handmatig ledigen CMF
  OR  TIMER_61  !pauzetijd aansturing afsl. V12.1
	EQL	V12_1

  OR  DUMP_10
  OR  DUMP_11
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V12_2
	EQL	V12_3

	OR	REG0B09	!regeneratiefase 9
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B61
	OR	REG0B64
  EQL DUMP_12

  AND DUMP_12
  AND R_VOORW !regeneratievoorw. OK
	EQL	V11_1
  EQL POMP_P11

	OR	REG0B13	!regeneratiefase 13
	OR	REG0B20	!regeneratiefase 20
	OR	REG0B24	!regeneratiefase 24
	OR	REG0B27	!regeneratiefase 27
	OR	REG0B29	!regeneratiefase 29
	OR	REG0B31	!regeneratiefase 31
	OR	REG0B32	!regeneratiefase 32
  EQL DUMP_13

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_13
	EQL	V9_2

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_14

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_14
  EQL DUMP_15

  AND R_VOORW !regeneratievoorw. OK
	AND	REG0B33	!regeneratiefase 33
  EQL DUMP_16

  AND DUMP_15
  OR  DUMP_16
  EQL POMP_P10
!
! timer 42 vertraging afsluiter V1.2 tijdens fase 1
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B01	!bedrijfsfase 1
  ANDNT TIMER_42
	CNTD	DSP42_0	!display 42 eenheden
	CNTD	DSP42_1	!display 42 tientallen
	CNTD	DSP42_2	!display 42 honderdtallen
	CNTD	DSP42_3	!display 42 duizendtallen
  STRB  TIMER_42

	ANDNT	BDR0B01	!bedrijfsfase 1
	FTCHD	STP42_0	!setpoint 42 eenheden
	FTCHD	STP42_1	!setpoint 42 tientallen
	FTCHD	STP42_2	!setpoint 42 honderdtallen
	FTCHD	STP42_3	!setpoint 42 duizendtallen
	STRD	DSP42_0	!display 42 eenheden
	STRD	DSP42_1	!display 42 tientallen
	STRD	DSP42_2	!display 42 honderdtallen
	STRD	DSP42_3	!display 42 duizendtallen
  SET0  TIMER_42
!
! timer 43 vertraging afsluiter V3.2 tijdens fase 3
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B03	!bedrijfsfase 3
  ANDNT TIMER_43
	CNTD	DSP43_0	!display 43 eenheden
	CNTD	DSP43_1	!display 43 tientallen
	CNTD	DSP43_2	!display 43 honderdtallen
	CNTD	DSP43_3	!display 43 duizendtallen
  STRB  TIMER_43

	ANDNT	BDR0B03	!bedrijfsfase 3
	FTCHD	STP43_0	!setpoint 43 eenheden
	FTCHD	STP43_1	!setpoint 43 tientallen
	FTCHD	STP43_2	!setpoint 43 honderdtallen
	FTCHD	STP43_3	!setpoint 43 duizendtallen
	STRD	DSP43_0	!display 43 eenheden
	STRD	DSP43_1	!display 43 tientallen
	STRD	DSP43_2	!display 43 honderdtallen
	STRD	DSP43_3	!display 43 duizendtallen
  SET0  TIMER_43
!
! timer 44 vertraging afsluiter V5.3 tijdens fase 5
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B05	!bedrijfsfase 5
  ANDNT TIMER_44
	CNTD	DSP44_0	!display 44 eenheden
	CNTD	DSP44_1	!display 44 tientallen
	CNTD	DSP44_2	!display 44 honderdtallen
	CNTD	DSP44_3	!display 44 duizendtallen
  STRB  TIMER_44

	ANDNT	BDR0B05	!bedrijfsfase 5
	FTCHD	STP44_0	!setpoint 44 eenheden
	FTCHD	STP44_1	!setpoint 44 tientallen
	FTCHD	STP44_2	!setpoint 44 honderdtallen
	FTCHD	STP44_3	!setpoint 44 duizendtallen
	STRD	DSP44_0	!display 44 eenheden
	STRD	DSP44_1	!display 44 tientallen
	STRD	DSP44_2	!display 44 honderdtallen
	STRD	DSP44_3	!display 44 duizendtallen
  SET0  TIMER_44

  AND TIMER_42
	AND	BDR0B10	!bedrijfsmelding
  EQL DUMP_17

  AND TIMER_43
	AND	BDR0B10	!bedrijfsmelding
  EQL DUMP_18

  AND TIMER_44
	AND	BDR0B10	!bedrijfsmelding
  EQL DUMP_19

	OR	REG0B08	!regeneratiefase 8
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B10	!regeneratiefase 10
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B12	!regeneratiefase 12
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B14	!regeneratiefase 14
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B17	!regeneratiefase 17
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B20	!regeneratiefase 20
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B23	!regeneratiefase 23
	OR	REG0B24	!regeneratiefase 24
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B26	!regeneratiefase 26
	OR	REG0B27	!regeneratiefase 27
	OR	REG0B28	!regeneratiefase 28
	OR	REG0B29	!regeneratiefase 29
	OR	REG0B30	!regeneratiefase 30
	OR	REG0B31	!regeneratiefase 31
	OR	REG0B32	!regeneratiefase 32
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
  EQL DUMP_20

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_20
  EQL DUMP_21

  OR  DUMP_17
  OR  DUMP_21
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V1_2

  OR  DUMP_18
  OR  DUMP_21
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V3_2

  OR  DUMP_19
  OR  DUMP_21
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V5_2

	AND	BDR0B01	!bedrijfsfase 1
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B05	!bedrijfsfase 5
  EQL DUMP_22

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_22
	OR	BDR0B10	!bedrijfsmelding
	AND	REG0B46	!openen commando V10.4
	OR	REG0B34	!regeneratiefase 33.1
	ANDNT	ALM0I37	!rondpompdruk correct
	EQL	V10_4
!
! timer 45 vertraging afsluiter V1.1 tijdens fase 2
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B02	!bedrijfsfase 2
  ANDNT TIMER_45
	CNTD	DSP45_0	!display 45 eenheden
	CNTD	DSP45_1	!display 45 tientallen
	CNTD	DSP45_2	!display 45 honderdtallen
	CNTD	DSP45_3	!display 45 duizendtallen
  STRB  TIMER_45

	ANDNT	BDR0B02	!bedrijfsfase 2
	FTCHD	STP45_0	!setpoint 45 eenheden
	FTCHD	STP45_1	!setpoint 45 tientallen
	FTCHD	STP45_2	!setpoint 45 honderdtallen
	FTCHD	STP45_3	!setpoint 45 duizendtallen
	STRD	DSP45_0	!display 45 eenheden
	STRD	DSP45_1	!display 45 tientallen
	STRD	DSP45_2	!display 45 honderdtallen
	STRD	DSP45_3	!display 45 duizendtallen
  SET0  TIMER_45
!
! timer 46 vertraging afsluiter V3.1 tijdens fase 4
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B04	!bedrijfsfase 4
  ANDNT TIMER_46
	CNTD	DSP46_0	!display 46 eenheden
	CNTD	DSP46_1	!display 46 tientallen
	CNTD	DSP46_2	!display 46 honderdtallen
	CNTD	DSP46_3	!display 46 duizendtallen
  STRB  TIMER_46

	ANDNT	BDR0B04	!bedrijfsfase 4
	FTCHD	STP46_0	!setpoint 46 eenheden
	FTCHD	STP46_1	!setpoint 46 tientallen
	FTCHD	STP46_2	!setpoint 46 honderdtallen
	FTCHD	STP46_3	!setpoint 46 duizendtallen
	STRD	DSP46_0	!display 46 eenheden
	STRD	DSP46_1	!display 46 tientallen
	STRD	DSP46_2	!display 46 honderdtallen
	STRD	DSP46_3	!display 46 duizendtallen
  SET0  TIMER_46
!
! timer 47 vertraging afsluiter V5.1 tijdens fase 6
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B06	!bedrijfsfase 6
  ANDNT TIMER_47
	CNTD	DSP47_0	!display 47 eenheden
	CNTD	DSP47_1	!display 47 tientallen
	CNTD	DSP47_2	!display 47 honderdtallen
	CNTD	DSP47_3	!display 47 duizendtallen
  STRB  TIMER_47

	ANDNT	BDR0B06	!bedrijfsfase 6
	FTCHD	STP47_0	!setpoint 47 eenheden
	FTCHD	STP47_1	!setpoint 47 tientallen
	FTCHD	STP47_2	!setpoint 47 honderdtallen
	FTCHD	STP47_3	!setpoint 47 duizendtallen
	STRD	DSP47_0	!display 47 eenheden
	STRD	DSP47_1	!display 47 tientallen
	STRD	DSP47_2	!display 47 honderdtallen
	STRD	DSP47_3	!display 47 duizendtallen
  SET0  TIMER_47

	AND	BDR0B10	!bedrijfsmelding
  AND TIMER_45
  EQL DUMP_23

	AND	BDR0B10	!bedrijfsmelding
  AND TIMER_46
  EQL DUMP_24

	AND	BDR0B10	!bedrijfsmelding
  AND TIMER_47
  EQL DUMP_25

	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_26

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_27

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_28

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_26
  OR  DUMP_23
  OR  DUMP_2
	EQL	V1_1

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_27
  OR  DUMP_24
  OR  DUMP_2
	EQL	V3_1

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_28
  OR  DUMP_25
  OR  DUMP_2
	EQL	V5_1

	OR	REG0B12	!regeneratiefase 12
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B26	!regeneratiefase 26
  EQL DUMP_29

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_29
	OR	REG0B53	!handmatig vullen CMF
	EQL	V9_3

	OR	REG0B09
	OR	REG0B61
	OR	REG0B64
  EQL DUMP_29

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_29
	EQL	V11_2

  AND R_VOORW !regeneratievoorw. OK
	AND	REG0B16	!regeneratiefase 16
	EQL	V11_3

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
  EQL DUMP_30

	ANDNT	ALM0B04	!tijdvertr. rho alarm proceswater
	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_30
	EQL	V7_1

	AND	REG0B33	!regeneratiefase 33
  AND R_VOORW !regeneratievoorw. OK
	OR	ALM0B04	!tijdvertr. rho alarm proceswater
	AND	BDR0B10	!bedrijfsmelding
	OR	REG0B88	!aanloopfase 88
	AND	BDR0B10	!bedrijfsmelding
	EQL	V7_2
!
! inbedrijfmelding CMF_unit t.b.v. kast algemene installatie
!
  AND POMP_P10
  AND V10_3_O !eindschak.afsluiter V10.3 geopend
  EQL DUMP_1

  AND R_VOORW !regeneratievoorw. OK
	AND	V9_2
  OR  R_VOORW !regeneratievoorw. OK
	AND	REG0B12	!regeneratiefase 12
  OR  R_VOORW !regeneratievoorw. OK
	AND	REG0B19	!regeneratiefase 19
  OR  R_VOORW !regeneratievoorw. OK
	AND	REG0B22	!regeneratiefase 22
  OR  R_VOORW !regeneratievoorw. OK
	AND	REG0B26	!regeneratiefase 26
  EQL DUMP_2

  AND DUMP_1
  OR  DUMP_2
  EQL CMF_IN  !inbedrijfmelding CMF naar kast algemeen

	OR	REG0B08	!regeneratiefase 8
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B10	!regeneratiefase 10
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B12	!regeneratiefase 12
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B14	!regeneratiefase 14
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B26	!regeneratiefase 26
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
  EQL DUMP_3

  AND DUMP_3
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
  EQL V13_1__2
!
! vrijgave loogverwarming via kast algemene voorzieningen
!
	AND	REG0B08	!regeneratiefase 8
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B10	!regeneratiefase 10
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B12	!regeneratiefase 12
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B14	!regeneratiefase 14
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
	EQL	166.0
  EQL DUMP_4
!
! aansturing concentraatafvoerklep technische bedrijven fase 8 t/m 23
!
  AND DUMP_4
	OR	REG0B17	!regeneratiefase 17
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B20	!regeneratiefase 20
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B23	!regeneratiefase 23
	OR	REG0B54	!handmatig ledigen CMF
	EQL	166.2
!
! aansturing spoelwaterafvoerklep technische bedrijven
!
	ANDNT	166.2
	EQL	166.1
	NOP	3
!                               DR_AFSBW
!				********
!
!
! In dit deel wordt gekeken of de kleppen die worden aangestuurd ook
! werkelijk geopend of gesloten zijn.
!
	AND	V1_1
  ANDNT V1_1_O  !eindschak.afsluiter V 1.1 geopend
	ORNT	V1_1
  ANDNT V1_1_C  !eindschak.afsluiter V 1.1 gesloten
  EQL DUMP_31

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_31
  ANDNT TIMER_49
	CNTD	DSP49_0	!display 49 eenheden
	CNTD	DSP49_1	!display 49 tientallen
	CNTD	DSP49_2	!display 49 honderdtallen
	CNTD	DSP49_3	!display 49 duizendtallen
  STRB  TIMER_49

  ANDNT DUMP_31
	OR	ALARM29	!V 1.1 niet geopend
	FTCHD	STP49_0	!setpoint 49 eenheden
	FTCHD	STP49_1	!setpoint 49 tientallen
	FTCHD	STP49_2	!setpoint 49 honderdtallen
	FTCHD	STP49_3	!setpoint 49 duizendtallen
	STRD	DSP49_0	!display 49 eenheden
	STRD	DSP49_1	!display 49 tientallen
	STRD	DSP49_2	!display 49 honderdtallen
	STRD	DSP49_3	!display 49 duizendtallen
  SET0  TIMER_49

	AND	V3_1
  ANDNT V3_1_O  !eindschak.afsluiter V 3.1 geopend
	ORNT	V3_1
  ANDNT V3_1_C  !eindschak.afsluiter V 3.1 gesloten
  EQL DUMP_32

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_32
  ANDNT TIMER_50
	CNTD	DSP50_0	!display 50 eenheden
	CNTD	DSP50_1	!display 50 tientallen
	CNTD	DSP50_2	!display 50 honderdtallen
	CNTD	DSP50_3	!display 50 duizendtallen
  STRB  TIMER_50

  ANDNT DUMP_32
	OR	ALARM31	!V 3.1 niet geopend
	FTCHD	STP50_0	!setpoint 50 eenheden
	FTCHD	STP50_1	!setpoint 50 tientallen
	FTCHD	STP50_2	!setpoint 50 honderdtallen
	FTCHD	STP50_3	!setpoint 50 duizendtallen
	STRD	DSP50_0	!display 50 eenheden
	STRD	DSP50_1	!display 50 tientallen
	STRD	DSP50_2	!display 50 honderdtallen
	STRD	DSP50_3	!display 50 duizendtallen
  SET0  TIMER_50

	AND	V5_1
  ANDNT V5_1_O  !eindschak.afsluiter V 5.1 geopend
	ORNT	V5_1
  ANDNT V5_1_C  !eindschak.afsluiter V 5.1 gesloten
  EQL DUMP_33

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_33
  ANDNT TIMER_51
	CNTD	DSP51_0	!display 51 eenheden
	CNTD	DSP51_1	!display 51 tientallen
	CNTD	DSP51_2	!display 51 honderdtallen
	CNTD	DSP51_3	!display 51 duizendtallen
  STRB  TIMER_51

  ANDNT DUMP_33
	OR	ALARM33	!V 5.1 niet geopend
	FTCHD	STP51_0	!setpoint 51 eenheden
	FTCHD	STP51_1	!setpoint 51 tientallen
	FTCHD	STP51_2	!setpoint 51 honderdtallen
	FTCHD	STP51_3	!setpoint 51 duizendtallen
	STRD	DSP51_0	!display 51 eenheden
	STRD	DSP51_1	!display 51 tientallen
	STRD	DSP51_2	!display 51 honderdtallen
	STRD	DSP51_3	!display 51 duizendtallen
  SET0  TIMER_51

	AND	V7_1
  ANDNT V7_1_O  !eindschak.afsluiter V 7.1 geopend
	ORNT	V7_1
  ANDNT V7_1_C  !eindschak.afsluiter V 7.1 gesloten
  EQL DUMP_34

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_34
  ANDNT TIMER_52
	CNTD	DSP52_0	!display 52 eenheden
	CNTD	DSP52_1	!display 52 tientallen
	CNTD	DSP52_2	!display 52 honderdtallen
	CNTD	DSP52_3	!display 52 duizendtallen
  STRB  TIMER_52

  ANDNT DUMP_34
	OR	ALARM35	!V 7.1 niet geopend
	FTCHD	STP52_0	!setpoint 52 eenheden
	FTCHD	STP52_1	!setpoint 52 tientallen
	FTCHD	STP52_2	!setpoint 52 honderdtallen
	FTCHD	STP52_3	!setpoint 52 duizendtallen
	STRD	DSP52_0	!display 52 eenheden
	STRD	DSP52_1	!display 52 tientallen
	STRD	DSP52_2	!display 52 honderdtallen
	STRD	DSP52_3	!display 52 duizendtallen
  SET0  TIMER_52

	AND	V10_1
  ANDNT V10_1_O !eindschak.afsluiter V10.1 geopend
	ORNT	V10_1
  ANDNT V10_1_C !eindschak.afsluiter V10.1 gesloten
  EQL DUMP_35

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_35
  ANDNT TIMER_53
	CNTD	DSP53_0	!display 53 eenheden
	CNTD	DSP53_1	!display 53 tientallen
	CNTD	DSP53_2	!display 53 honderdtallen
	CNTD	DSP53_3	!display 53 duizendtallen
  STRB  TIMER_53

  ANDNT DUMP_35
	OR	ALARM13	!V10.1 niet geopend
	FTCHD	STP53_0	!setpoint 53 eenheden
	FTCHD	STP53_1	!setpoint 53 tientallen
	FTCHD	STP53_2	!setpoint 53 honderdtallen
	FTCHD	STP53_3	!setpoint 53 duizendtallen
	STRD	DSP53_0	!display 53 eenheden
	STRD	DSP53_1	!display 53 tientallen
	STRD	DSP53_2	!display 53 honderdtallen
	STRD	DSP53_3	!display 53 duizendtallen
  SET0  TIMER_53

	AND	V10_2
  ANDNT V10_2_O !eindschak.afsluiter V10.2 geopend
	ORNT	V10_2
  ANDNT V10_2_C !eindschak.afsluiter V10.2 gesloten
  EQL DUMP_36

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_36
  ANDNT TIMER_54
	CNTD	DSP54_0	!display 54 eenheden
	CNTD	DSP54_1	!display 54 tientallen
	CNTD	DSP54_2	!display 54 honderdtallen
	CNTD	DSP54_3	!display 54 duizendtallen
  STRB  TIMER_54

  ANDNT DUMP_36
	OR	ALARM15	!V10.2 niet geopend
	FTCHD	STP54_0	!setpoint 54 eenheden
	FTCHD	STP54_1	!setpoint 54 tientallen
	FTCHD	STP54_2	!setpoint 54 honderdtallen
	FTCHD	STP54_3	!setpoint 54 duizendtallen
	STRD	DSP54_0	!display 54 eenheden
	STRD	DSP54_1	!display 54 tientallen
	STRD	DSP54_2	!display 54 honderdtallen
	STRD	DSP54_3	!display 54 duizendtallen
  SET0  TIMER_54

	AND	V10_3
  ANDNT V10_3_O !eindschak.afsluiter V10.3 geopend
	ORNT	V10_3
  ANDNT V10_3_C !eindschak.afsluiter V10.3 gesloten
  EQL DUMP_37

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_37
  ANDNT TIMER_55
	CNTD	DSP55_0	!display 55 eenheden
	CNTD	DSP55_1	!display 55 tientallen
	CNTD	DSP55_2	!display 55 honderdtallen
	CNTD	DSP55_3	!display 55 duizendtallen
  STRB  TIMER_55

  ANDNT DUMP_37
	OR	ALARM17	!V10.3 niet geopend
	FTCHD	STP55_0	!setpoint 55 eenheden
	FTCHD	STP55_1	!setpoint 55 tientallen
	FTCHD	STP55_2	!setpoint 55 honderdtallen
	FTCHD	STP55_3	!setpoint 55 duizendtallen
	STRD	DSP55_0	!display 55 eenheden
	STRD	DSP55_1	!display 55 tientallen
	STRD	DSP55_2	!display 55 honderdtallen
	STRD	DSP55_3	!display 55 duizendtallen
  SET0  TIMER_55

	AND	V10_4
  ANDNT V10_4_O !eindschak.afsluiter V10.4 geopend
	ORNT	V10_4
  ANDNT V10_4_C !eindschak.afsluiter V10.4 gesloten
  EQL DUMP_38

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_38
  ANDNT TIMER_56
	CNTD	DSP56_0	!display 56 eenheden
	CNTD	DSP56_1	!display 56 tientallen
	CNTD	DSP56_2	!display 56 honderdtallen
	CNTD	DSP56_3	!display 56 duizendtallen
  STRB  TIMER_56

  ANDNT DUMP_38
	OR	ALARM19	!V10.4 niet geopend
	FTCHD	STP56_0	!setpoint 56 eenheden
	FTCHD	STP56_1	!setpoint 56 tientallen
	FTCHD	STP56_2	!setpoint 56 honderdtallen
	FTCHD	STP56_3	!setpoint 56 duizendtallen
	STRD	DSP56_0	!display 56 eenheden
	STRD	DSP56_1	!display 56 tientallen
	STRD	DSP56_2	!display 56 honderdtallen
	STRD	DSP56_3	!display 56 duizendtallen
  SET0  TIMER_56

	AND	V11_1
  ANDNT V11_1_O !eindschak.afsluiter V11.1 geopend
	ORNT	V11_1
  ANDNT V11_1_C !eindschak.afsluiter V11.1 gesloten
  EQL DUMP_39

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_39
  ANDNT TIMER_57
	CNTD	DSP57_0	!display 57 eenheden
	CNTD	DSP57_1	!display 57 tientallen
	CNTD	DSP57_2	!display 57 honderdtallen
	CNTD	DSP57_3	!display 57 duizendtallen
  STRB  TIMER_57

  ANDNT DUMP_39
	OR	ALARM21	!V11.1 niet geopend
	FTCHD	STP57_0	!setpoint 57 eenheden
	FTCHD	STP57_1	!setpoint 57 tientallen
	FTCHD	STP57_2	!setpoint 57 honderdtallen
	FTCHD	STP57_3	!setpoint 57 duizendtallen
	STRD	DSP57_0	!display 57 eenheden
	STRD	DSP57_1	!display 57 tientallen
	STRD	DSP57_2	!display 57 honderdtallen
	STRD	DSP57_3	!display 57 duizendtallen
  SET0  TIMER_57

	AND	V11_2
  ANDNT V11_2_O !eindschak.afsluiter V11.2 geopend
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	ORNT	V11_2
  ANDNT V11_2_C !eindschak.afsluiter V11.2 gesloten
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
  EQL DUMP_40

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_40
  ANDNT TIMER_58
	CNTD	DSP58_0	!display 58 eenheden
	CNTD	DSP58_1	!display 58 tientallen
	CNTD	DSP58_2	!display 58 honderdtallen
	CNTD	DSP58_3	!display 58 duizendtallen
  STRB  TIMER_58

  ANDNT DUMP_40
	OR	ALARM23	!V11.2 niet geopend
	FTCHD	STP58_0	!setpoint 58 eenheden
	FTCHD	STP58_1	!setpoint 58 tientallen
	FTCHD	STP58_2	!setpoint 58 honderdtallen
	FTCHD	STP58_3	!setpoint 58 duizendtallen
	STRD	DSP58_0	!display 58 eenheden
	STRD	DSP58_1	!display 58 tientallen
	STRD	DSP58_2	!display 58 honderdtallen
	STRD	DSP58_3	!display 58 duizendtallen
  SET0  TIMER_58

	AND	V11_3
  ANDNT V11_3_O !eindschak.afsluiter V11.3 geopend
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	ORNT	V11_3
  ANDNT V11_3_C !eindschak.afsluiter V11.3 gesloten
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
  EQL DUMP_41

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_41
  ANDNT TIMER_59
	CNTD	DSP59_0	!display 59 eenheden
	CNTD	DSP59_1	!display 59 tientallen
	CNTD	DSP59_2	!display 59 honderdtallen
	CNTD	DSP59_3	!display 59 duizendtallen
  STRB  TIMER_59

  ANDNT DUMP_41
	OR	ALARM25	!V11.3 niet geopend
	FTCHD	STP59_0	!setpoint 59 eenheden
	FTCHD	STP59_1	!setpoint 59 tientallen
	FTCHD	STP59_2	!setpoint 59 honderdtallen
	FTCHD	STP59_3	!setpoint 59 duizendtallen
	STRD	DSP59_0	!display 59 eenheden
	STRD	DSP59_1	!display 59 tientallen
	STRD	DSP59_2	!display 59 honderdtallen
	STRD	DSP59_3	!display 59 duizendtallen
  SET0  TIMER_59

	AND	V12_1
  ANDNT V12_1_O !eindschak.afsluiter V12.1 geopend
	ORNT	V12_1
  ANDNT V12_1_C !eindschak.afsluiter V12.1 gesloten
  EQL DUMP_42

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_42
  ANDNT TIMER_60
	CNTD	DSP60_0	!display 60 eenheden
	CNTD	DSP60_1	!display 60 tientallen
	CNTD	DSP60_2	!display 60 honderdtallen
	CNTD	DSP60_3	!display 60 duizendtallen
  STRB  TIMER_60

  ANDNT DUMP_42
	OR	ALARM27	!V12.1 niet geopend
	FTCHD	STP60_0	!setpoint 60 eenheden
	FTCHD	STP60_1	!setpoint 60 tientallen
	FTCHD	STP60_2	!setpoint 60 honderdtallen
	FTCHD	STP60_3	!setpoint 60 duizendtallen
	STRD	DSP60_0	!display 60 eenheden
	STRD	DSP60_1	!display 60 tientallen
	STRD	DSP60_2	!display 60 honderdtallen
	STRD	DSP60_3	!display 60 duizendtallen
  SET0  TIMER_60
!
! Maken van de alarmen indien een klepstand niet overeenkomt met de
! aansturing
!
	AND	V1_1
  AND TIMER_49
	EQL	ALARM29	!V 1.1 niet geopend

	ANDNT	V1_1
  AND TIMER_49
	EQL	ALARM30	!V 1.1 niet gesloten

	AND	V3_1
  AND TIMER_50
	EQL	ALARM31	!V 3.1 niet geopend

	ANDNT	V3_1
  AND TIMER_50
	EQL	ALARM32	!V 3.1 niet gesloten

	AND	V5_1
  AND TIMER_51
	EQL	ALARM33	!V 5.1 niet geopend

	ANDNT	V5_1
  AND TIMER_51
	EQL	ALARM34	!V 5.1 niet gesloten

	AND	V7_1
  AND TIMER_52
	EQL	ALARM35	!V 7.1 niet geopend

	ANDNT	V7_1
  AND TIMER_52
	EQL	ALARM36	!V 7.1 niet gesloten

	AND	V10_1
  AND TIMER_53
	EQL	ALARM13	!V10.1 niet geopend

	ANDNT	V10_1
  AND TIMER_53
	EQL	ALARM14	!V10.1 niet gesloten

	AND	V10_2
  AND TIMER_54
	EQL	ALARM15	!V10.2 niet geopend

	ANDNT	V10_2
  AND TIMER_54
	EQL	ALARM16	!V10.2 niet gesloten

	AND	V10_3
  AND TIMER_55
	EQL	ALARM17	!V10.3 niet geopend

	ANDNT	V10_3
  AND TIMER_55
	EQL	ALARM18	!V10.3 niet gesloten

	AND	V10_4
  AND TIMER_56
	EQL	ALARM19	!V10.4 niet geopend

	ANDNT	V10_4
  AND TIMER_56
	EQL	ALARM20	!V10.4 niet gesloten

	AND	V11_1
  AND TIMER_57
	EQL	ALARM21	!V11.1 niet geopend

	ANDNT	V11_1
  AND TIMER_57
	EQL	ALARM22	!V11.1 niet gesloten

	AND	V11_2
  AND TIMER_58
	EQL	ALARM23	!V11.2 niet geopend

	ANDNT	V11_2
  AND TIMER_58
	EQL	ALARM24	!V11.2 niet gesloten

	AND	V11_3
  AND TIMER_59
	EQL	ALARM25	!V11.3 niet geopend

	ANDNT	V11_3
  AND TIMER_59
	EQL	ALARM26	!V11.3 niet gesloten

	AND	V12_1
  AND TIMER_60
	EQL	ALARM27	!V12.1 niet geopend

	ANDNT	V12_1
  AND TIMER_60
	EQL	ALARM28	!V12.1 niet gesloten
	NOP	136
!                               DR_ALM
!				******
!
! Spoeldruk te hoog
!
	AND	V1_2
	OR	V3_2
	OR	V5_2
	EQL	ALM0B24	!aansturing V1.2,of V3.2,of V5.2

	AND	ALM0I01	!spoeldruk correct
	ORNT	ALM0B24	!aansturing V1.2,of V3.2,of V5.2
	FTCHD	STP61_0	!setpoint 61 eenheden
	FTCHD	STP61_1	!setpoint 61 tientallen
	FTCHD	STP61_2	!setpoint 61 honderdtallen
	FTCHD	STP61_3	!setpoint 61 duizendtallen
	STRD	DSP61_0	!display 61 eenheden
	STRD	DSP61_1	!display 61 tientallen
	STRD	DSP61_2	!display 61 honderdtallen
	STRD	DSP61_3	!display 61 duizendtallen
	SET0	ALM0B01	!timer spoeldrukbewaking

	AND	S_1SEC	!triggerpuls 1,0 sec.
	ANDNT	ALM0I01	!spoeldruk correct
	AND	ALM0B24	!aansturing V1.2,of V3.2,of V5.2
	ANDNT	ALM0B01	!timer spoeldrukbewaking
	CNTD	DSP61_0	!display 61 eenheden
	CNTD	DSP61_1	!display 61 tientallen
	CNTD	DSP61_2	!display 61 honderdtallen
	CNTD	DSP61_3	!display 61 duizendtallen
	STRB	ALM0B01	!timer spoeldrukbewaking

	AND	ALM0B01	!timer spoeldrukbewaking
	EQL	ALARM01	!spoeldruk te hoog
!
! stuurlucht alarm
!
	ANDNT	ALM0I02	!stuurlucht te laag
	TRIG	ALM0T03	!triggerpuls
	EQL	ALM0B16

	AND	ALM0B16
	OR	ALM0I02	!stuurlucht te laag
	FTCHD	STP64_0	!setpoint 64 eenheden
	FTCHD	STP64_1	!setpoint 64 tientallen
	FTCHD	STP64_2	!setpoint 64 honderdtallen
	FTCHD	STP64_3	!setpoint 64 duizendtallen
	STRD	DSP64_0	!display 64 eenheden
	STRD	DSP64_1	!display 64 tientallen
	STRD	DSP64_2	!display 64 honderdtallen
	STRD	DSP64_3	!display 64 duizendtallen
	SET0	ALM0B17

	AND	S_1SEC	!triggerpuls 1,0 sec.
	ANDNT	ALM0I02	!stuurlucht te laag
	ANDNT	ALM0B17
	CNTD	DSP64_0	!display 64 eenheden
	CNTD	DSP64_1	!display 64 tientallen
	CNTD	DSP64_2	!display 64 honderdtallen
	CNTD	DSP64_3	!display 64 duizendtallen
	STRB	ALM0B17

	AND	ALM0B17
	EQL	ALARM02	!stuurlucht gestoord
!
! stuurspanning alarm
!
	ANDNT	ALM0I03	!stuursp. gestoord
	EQL	ALARM03	!stuurspanning gestoord
!
! vuilwatertank bijna leeg
!
  ANDNT ALM0I04 !LN_vooralarm vuilwatertank
	EQL	ALARM04	!vuilwatertank bijna leeg
!
! vuilwatertank leeg
!
  ANDNT ALM0I05 !LN_alarm vuilwatertank
	EQL	ALARM05	!vuilwatertank leeg
!
! geleidbaarheidalarm na regeneratie of bedrijf
!
	AND	REG0B34	!regeneratiefase 33.1
	TRIG	ALM0T01	!triggerpuls
	EQL	ALM0B02	!triggerpuls fase 33.1

	AND	ALM0B02	!triggerpuls fase 33.1
	AND	ALM0I44	!slechte geleidb.h. reinwater
	OR	ALM0B06	!tijdvertr.alarm geleidb.h. bedrijf
	OR	TMRAAN88	!timer aanloopfase 88
	EQL	ALARM44	!rho proceswater
!
! tijdvertraging rioolbedrijf t.g.v. slechte geleidendheid
!
	ORNT	ALM0I44	!slechte geleidb.h. reinwater
	OR	RESET
	FTCHD	STP62_0	!setpoint 62 eenheden
	FTCHD	STP62_1	!setpoint 62 tientallen
	FTCHD	STP62_2	!setpoint 62 honderdtallen
	FTCHD	STP62_3	!setpoint 62 duizendtallen
	STRD	DSP62_0	!display 62 eenheden
	STRD	DSP62_1	!display 62 tientallen
	STRD	DSP62_2	!display 62 honderdtallen
	STRD	DSP62_3	!display 62 duizendtallen
	SET0	ALM0B04	!tijdvertr. rho alarm proceswater

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B10	!bedrijfsmelding
	AND	ALM0I44	!slechte geleidb.h. reinwater
	ANDNT	REG0B88	!aanloopfase 88
	ANDNT	ALM0B04	!tijdvertr. rho alarm proceswater
	CNTD	DSP62_0	!display 62 eenheden
	CNTD	DSP62_1	!display 62 tientallen
	CNTD	DSP62_2	!display 62 honderdtallen
	CNTD	DSP62_3	!display 62 duizendtallen
	STRB	ALM0B04	!tijdvertr. rho alarm proceswater

	ANDNT	ALM0B04	!tijdvertr. rho alarm proceswater
	FTCHD	STP63_0	!setpoint 63 eenheden
	FTCHD	STP63_1	!setpoint 63 tientallen
	FTCHD	STP63_2	!setpoint 63 honderdtallen
	FTCHD	STP63_3	!setpoint 63 duizendtallen
	STRD	DSP63_0	!display 63 eenheden
	STRD	DSP63_1	!display 63 tientallen
	STRD	DSP63_2	!display 63 honderdtallen
	STRD	DSP63_3	!display 63 duizendtallen
	SET0	ALM0B06	!tijdvertr.alarm geleidb.h. bedrijf

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	ALM0B04	!tijdvertr. rho alarm proceswater
	ANDNT	ALM0B06	!tijdvertr.alarm geleidb.h. bedrijf
	CNTD	DSP63_0	!display 63 eenheden
	CNTD	DSP63_1	!display 63 tientallen
	CNTD	DSP63_2	!display 63 honderdtallen
	CNTD	DSP63_3	!display 63 duizendtallen
	STRB	ALM0B06	!tijdvertr.alarm geleidb.h. bedrijf
!
! geleidbaarheidalarm na spoelen fase 32
!
	AND	REG0B33	!regeneratiefase 33
	TRIG	ALM0T02	!triggerpuls
	EQL	ALM0B03

	AND	ALM0B03
	AND	ALM0I06	!slechte geleidb.h. spoelfase 32
	EQL	ALARM06	!geleidbaarheid na spoelen
!
! filtercapaciteit te laag
!
	ANDNT	REG0B42	!regeneratieaanvraag
	AND	FLW0B04	!tijdvertr. flowalarm
	AND	BDR0B10	!bedrijfsmelding
	AND	V7_1
	EQL	ALARM07	!filtercapaciteit te laag
!
! concentraatafvoer te laag
!
	AND	FLW2B04	!tijdvertr. flowalarm
	AND	V10_4
	EQL	ALARM08	!concentraat afvoer gestoord
!
! nivo alarm warme loog
!
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	ANDNT	ALM0I09	!nivo warme loog
	OR	REG0B42	!regeneratieaanvraag
	ANDNT	ALM0I09	!nivo warme loog
	EQL	ALARM09	!nivo warme loog
!
! nivo alarm zoutzuur
!
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	ANDNT	ALM0I10	!nivo zoutzuur
	OR	REG0B42	!regeneratieaanvraag
	ANDNT	ALM0I10	!nivo zoutzuur
	EQL	ALARM10	!nivo zoutzuur
!
! temperatuuralarm warme loog
!
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	AND	TMP0I00	!termostaat warme loog
	SET1	ALM0B07	!temperatuur loog korrekt

	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	SET0	ALM0B07	!temperatuur loog korrekt

	AND	REG0B16	!regeneratiefase 16
	ANDNT	ALM0B07	!temperatuur loog korrekt
	EQL	ALARM11	!temperatuur loog
!
! nivo neuttank te hoog
!
	AND	BDR0I00	!bedrijfskeuze schak. "REGENERATIE"
	TRIG	ALM0T06	!triggerpuls
	EQL	ALM0B26	!trigger keuzeschak. REGENERATIE

	AND	REG0B42	!regeneratieaanvraag
	OR	ALM0B26	!trigger keuzeschak. REGENERATIE
	EQL	DUMP

	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	AND	DUMP
	ANDNT	ALM0I12	!nivo neuttank
	EQL	ALARM12	!nivo neutralisatie
!
! verzamelalarm looptijdbewaking afsluiters
!
	OR	VERGR13
	OR	VERGR14
	OR	VERGR15
	OR	VERGR16
	OR	VERGR17
	OR	VERGR18
	OR	VERGR19
	OR	VERGR20
	OR	VERGR21
	OR	VERGR22
	OR	VERGR23
	OR	VERGR24
	OR	VERGR25
	OR	VERGR26
	OR	VERGR27
	OR	VERGR28
	OR	VERGR29
	OR	VERGR30
	OR	VERGR31
	OR	VERGR32
	OR	VERGR33
	OR	VERGR34
	OR	VERGR35
	OR	VERGR36
	EQL	ALM0B08	!een of meerdere afsl.gestoord
	NOP	3
!
! rondpompdruk P10 te hoog
!
	AND	ALM0I37	!rondpompdruk correct
	FTCHD	STP65_0	!setpoint 65 eenheden
	FTCHD	STP65_1	!setpoint 65 tientallen
	FTCHD	STP65_2	!setpoint 65 honderdtallen
	FTCHD	STP65_3	!setpoint 65 duizendtallen
	STRD	DSP65_0	!display 65 eenheden
	STRD	DSP65_1	!display 65 tientallen
	STRD	DSP65_2	!display 65 honderdtallen
	STRD	DSP65_3	!display 65 duizendtallen
	SET0	ALM0B19

	AND	S_1SEC	!triggerpuls 1,0 sec.
	ANDNT	ALM0I37	!rondpompdruk correct
	ANDNT	ALM0B19
	CNTD	DSP65_0	!display 65 eenheden
	CNTD	DSP65_1	!display 65 tientallen
	CNTD	DSP65_2	!display 65 honderdtallen
	CNTD	DSP65_3	!display 65 duizendtallen
	STRB	ALM0B19

	AND	ALM0B19
  AND POMP_P10
	EQL	ALARM37	!P10 rondpompdruk te hoog
!
! P10 niet paraat
!
	ANDNT	BDR0I07	!P10 automatisch
	OR	ALM0I39	!P10 therm. gestoord
	EQL	DUMP

	AND	DUMP
	AND	BDR0I02	!bedrijfskeuze schak. "NORMAAL"
	EQL	ALM0B09	!alarmmelding P10

	AND	DUMP
	AND	BDR0I00	!bedrijfskeuze schak. "REGENERATIE"
	EQL	ALM0B10	!alarmmelding P10

	AND	ALM0B09	!alarmmelding P10
	OR	ALM0B10	!alarmmelding P10
	EQL	ALARM39	!P10 niet paraat
!
! P11 niet paraat
!
	ANDNT	REG0I07	!P11 paraat
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	OR	REG0B42	!regeneratieaanvraag
	ANDNT	REG0I07	!P11 paraat
	EQL	ALARM40	!P11 niet paraat
!
! nivo proceswater
!
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	ANDNT	REG0B42	!regeneratieaanvraag
	OR	ALM0I42	!nivo proceswater
	EQLNT	ALARM42	!nivo proceswater
	NOP	4
!
! druk vuil proceswater
!
	AND	ALM0I43	!druk vuilproceswater correct
	FTCHD	STP66_0	!setpoint 66 eenheden
	FTCHD	STP66_1	!setpoint 66 tientallen
	FTCHD	STP66_2	!setpoint 66 honderdtallen
	FTCHD	STP66_3	!setpoint 66 duizendtallen
	STRD	DSP66_0	!display 66 eenheden
	STRD	DSP66_1	!display 66 tientallen
	STRD	DSP66_2	!display 66 honderdtallen
	STRD	DSP66_3	!display 66 duizendtallen
	SET0	ALM0B21

	AND	S_1SEC	!triggerpuls 1,0 sec.
	ANDNT	ALM0I43	!druk vuilproceswater correct
	ANDNT	ALM0B21
	CNTD	DSP66_0	!display 66 eenheden
	CNTD	DSP66_1	!display 66 tientallen
	CNTD	DSP66_2	!display 66 honderdtallen
	CNTD	DSP66_3	!display 66 duizendtallen
	STRB	ALM0B21

	AND	ALM0B21
	EQL	ALARM43	!druk vuilproceswater
!
! spoeldruk te hoog
!
	ANDNT	RESET
	AND	ALM1B01
	OR	ALARM01	!spoeldruk te hoog
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B01
	EQL	ALM1B01

	OR	RESET
	OR	ALM3B01
	EQL	ALM2B01

	AND	ALM2B01
	AND	ALARM01	!spoeldruk te hoog
	EQL	ALM3B01

	AND	ALM1B01
	AND	KNIPPER
	OR	ALM3B01
	EQL	MELD01

	OR	MELD01
	OR	ALM1B01
	EQL	VERGR01

	AND	VERGR01
	ANDNT	ALM3B01
	EQL	CA01
!
! stuurlucht gestoord
!
	ANDNT	RESET
	AND	ALM1B02
	OR	ALARM02	!stuurlucht gestoord
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B02
	EQL	ALM1B02

	OR	RESET
	OR	ALM3B02
	EQL	ALM2B02

	AND	ALM2B02
	AND	ALARM02	!stuurlucht gestoord
	EQL	ALM3B02

	AND	ALM1B02
	AND	KNIPPER
	OR	ALM3B02
	EQL	MELD02

	OR	MELD02
	OR	ALM1B02
	EQL	VERGR02	!stuurlucht gestoord

	AND	VERGR02	!stuurlucht gestoord
	ANDNT	ALM3B02
	EQL	CA02
!
! stuurspanning gestoord
!
	ANDNT	RESET
	AND	ALM1B03
	OR	ALARM03	!stuurspanning gestoord
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B03
	EQL	ALM1B03

	OR	RESET
	OR	ALM3B03
	EQL	ALM2B03

	AND	ALM2B03
	AND	ALARM03	!stuurspanning gestoord
	EQL	ALM3B03

	AND	ALM1B03
	AND	KNIPPER
	OR	ALM3B03
	EQL	MELD03

	OR	MELD03
	OR	ALM1B03
	EQL	VERGR03	!stuurspanning gestoord

	AND	VERGR03	!stuurspanning gestoord
	ANDNT	ALM3B03
	EQL	CA03
!
! vuilwatertank bijna leeg
!
	ANDNT	RESET
	AND	ALM1B04
	OR	ALARM04	!vuilwatertank bijna leeg
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B04
	EQL	ALM1B04

	OR	RESET
	OR	ALM3B04
	EQL	ALM2B04

	AND	ALM2B04
	AND	ALARM04	!vuilwatertank bijna leeg
	EQL	ALM3B04

	AND	ALM1B04
	AND	KNIPPER
	OR	ALM3B04
	EQL	MELD04

	OR	MELD04
	OR	ALM1B04
	EQL	VERGR04

	AND	VERGR04
	ANDNT	ALM3B04
	EQL	CA04
!
! vuilwatertank leeg
!
	ANDNT	RESET
	AND	ALM1B05
	OR	ALARM05	!vuilwatertank leeg
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B05
	EQL	ALM1B05

	OR	RESET
	OR	ALM3B05
	EQL	ALM2B05

	AND	ALM2B05
	AND	ALARM05	!vuilwatertank leeg
	EQL	ALM3B05

	AND	ALM1B05
	AND	KNIPPER
	OR	ALM3B05
	EQL	MELD05

	OR	MELD05
	OR	ALM1B05
	EQL	VERGR05	!vuilwater tank leeg

	AND	VERGR05	!vuilwater tank leeg
	ANDNT	ALM3B05
	EQL	CA05
!
! rho na het spoelen
!
	ANDNT	RESET
	AND	ALM1B06
	OR	ALARM06	!geleidbaarheid na spoelen
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B06
	EQL	ALM1B06

	OR	RESET
	OR	ALM3B06
	EQL	ALM2B06

	AND	ALM2B06
	AND	ALARM06	!geleidbaarheid na spoelen
	EQL	ALM3B06

	AND	ALM1B06
	AND	KNIPPER
	OR	ALM3B06
	EQL	MELD06

	OR	MELD06
	OR	ALM1B06
	EQL	VERGR06

	AND	VERGR06
	ANDNT	ALM3B06
	EQL	CA06
!
! filtercapaciteit te laag
!
	ANDNT	RESET
	AND	ALM1B07
	OR	ALARM07	!filtercapaciteit te laag
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B07
	EQL	ALM1B07

	OR	RESET
	OR	ALM3B07
	EQL	ALM2B07

	AND	ALM2B07
	AND	ALARM07	!filtercapaciteit te laag
	EQL	ALM3B07

	AND	ALM1B07
	AND	KNIPPER
	OR	ALM3B07
	EQL	MELD07

	OR	MELD07
	OR	ALM1B07
	EQL	VERGR07

	AND	VERGR07
	ANDNT	ALM3B07
	EQL	CA07
!
! concentraat afvoer
!
	ANDNT	RESET
	AND	ALM1B08
	OR	ALARM08	!concentraat afvoer gestoord
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B08
	EQL	ALM1B08

	OR	RESET
	OR	ALM3B08
	EQL	ALM2B08

	AND	ALM2B08
	AND	ALARM08	!concentraat afvoer gestoord
	EQL	ALM3B08

	AND	ALM1B08
	AND	KNIPPER
	OR	ALM3B08
	EQL	MELD08

	OR	MELD08
	OR	ALM1B08
	EQL	VERGR08

	AND	VERGR08
	ANDNT	ALM3B08
	EQL	CA08
!
! nivo warme loog te laag
!
	ANDNT	RESET
	AND	ALM1B09
	OR	ALARM09	!nivo warme loog
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B09
	EQL	ALM1B09

	OR	RESET
	OR	ALM3B09
	EQL	ALM2B09

	AND	ALM2B09
	AND	ALARM09	!nivo warme loog
	EQL	ALM3B09

	AND	ALM1B09
	AND	KNIPPER
	OR	ALM3B09
	EQL	MELD09

	OR	MELD09
	OR	ALM1B09
	EQL	VERGR09

	AND	VERGR09
	ANDNT	ALM3B09
	EQL	CA09
!
! nivo zoutzuur te laag
!
	ANDNT	RESET
	AND	ALM1B10
	OR	ALARM10	!nivo zoutzuur
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B10
	EQL	ALM1B10

	OR	RESET
	OR	ALM3B10
	EQL	ALM2B10

	AND	ALM2B10
	AND	ALARM10	!nivo zoutzuur
	EQL	ALM3B10

	AND	ALM1B10
	AND	KNIPPER
	OR	ALM3B10
	EQL	MELD10

	OR	MELD10
	OR	ALM1B10
	EQL	VERGR10

	AND	VERGR10
	ANDNT	ALM3B10
	EQL	CA10
!
! temp loog te laag
!
	ANDNT	RESET
	AND	ALM1B11
	OR	ALARM11	!temperatuur loog
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B11
	EQL	ALM1B11

	OR	RESET
	OR	ALM3B11
	EQL	ALM2B11

	AND	ALM2B11
	AND	ALARM11	!temperatuur loog
	EQL	ALM3B11

	AND	ALM1B11
	AND	KNIPPER
	OR	ALM3B11
	EQL	MELD11

	OR	MELD11
	OR	ALM1B11
	EQL	VERGR11

	AND	VERGR11
	ANDNT	ALM3B11
	EQL	CA11
!
! nivo neutralisatie
!
	ANDNT	RESET
	AND	ALM1B12
	OR	ALARM12	!nivo neutralisatie
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B12
	EQL	ALM1B12

	OR	RESET
	OR	ALM3B12
	EQL	ALM2B12

	AND	ALM2B12
	AND	ALARM12	!nivo neutralisatie
	EQL	ALM3B12

	AND	ALM1B12
	AND	KNIPPER
	OR	ALM3B12
	EQL	MELD12

	OR	MELD12
	OR	ALM1B12
	EQL	VERGR12

	AND	VERGR12
	ANDNT	ALM3B12
	EQL	CA12


	ANDNT	RESET
	AND	ALM1B13
	OR	ALARM13	!V10.1 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B13
	EQL	ALM1B13

	OR	RESET
	OR	ALM3B13
	EQL	ALM2B13

	AND	ALM2B13
	AND	ALARM13	!V10.1 niet geopend
	EQL	ALM3B13

	AND	ALM1B13
	AND	KNIPPER
	OR	ALM3B13
	EQL	MELD13

	OR	MELD13
	OR	ALM1B13
	EQL	VERGR13

	AND	VERGR13
	ANDNT	ALM3B13
	EQL	CA13


	ANDNT	RESET
	AND	ALM1B14
	OR	ALARM14	!V10.1 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B14
	EQL	ALM1B14

	OR	RESET
	OR	ALM3B14
	EQL	ALM2B14

	AND	ALM2B14
	AND	ALARM14	!V10.1 niet gesloten
	EQL	ALM3B14

	AND	ALM1B14
	AND	KNIPPER
	OR	ALM3B14
	EQL	MELD14

	OR	MELD14
	OR	ALM1B14
	EQL	VERGR14

	AND	VERGR14
	ANDNT	ALM3B14
	EQL	CA14


	ANDNT	RESET
	AND	ALM1B15
	OR	ALARM15	!V10.2 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B15
	EQL	ALM1B15

	OR	RESET
	OR	ALM3B15
	EQL	ALM2B15

	AND	ALM2B15
	AND	ALARM15	!V10.2 niet geopend
	EQL	ALM3B15

	AND	ALM1B15
	AND	KNIPPER
	OR	ALM3B15
	EQL	MELD15

	OR	MELD15
	OR	ALM1B15
	EQL	VERGR15

	AND	VERGR15
	ANDNT	ALM3B15
	EQL	CA15


	ANDNT	RESET
	AND	ALM1B16
	OR	ALARM16	!V10.2 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B16
	EQL	ALM1B16

	OR	RESET
	OR	ALM3B16
	EQL	ALM2B16

	AND	ALM2B16
	AND	ALARM16	!V10.2 niet gesloten
	EQL	ALM3B16

	AND	ALM1B16
	AND	KNIPPER
	OR	ALM3B16
	EQL	MELD16

	OR	MELD16
	OR	ALM1B16
	EQL	VERGR16

	AND	VERGR16
	ANDNT	ALM3B16
	EQL	CA16


	ANDNT	RESET
	AND	ALM1B17
	OR	ALARM17	!V10.3 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B17
	EQL	ALM1B17

	OR	RESET
	OR	ALM3B17
	EQL	ALM2B17

	AND	ALM2B17
	AND	ALARM17	!V10.3 niet geopend
	EQL	ALM3B17

	AND	ALM1B17
	AND	KNIPPER
	OR	ALM3B17
	EQL	MELD17

	OR	MELD17
	OR	ALM1B17
	EQL	VERGR17

	AND	VERGR17
	ANDNT	ALM3B17
	EQL	CA17


	ANDNT	RESET
	AND	ALM1B18
	OR	ALARM18	!V10.3 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B18
	EQL	ALM1B18

	OR	RESET
	OR	ALM3B18
	EQL	ALM2B18

	AND	ALM2B18
	AND	ALARM18	!V10.3 niet gesloten
	EQL	ALM3B18

	AND	ALM1B18
	AND	KNIPPER
	OR	ALM3B18
	EQL	MELD18

	OR	MELD18
	OR	ALM1B18
	EQL	VERGR18

	AND	VERGR18
	ANDNT	ALM3B18
	EQL	CA18


	ANDNT	RESET
	AND	ALM1B19
	OR	ALARM19	!V10.4 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B19
	EQL	ALM1B19

	OR	RESET
	OR	ALM3B19
	EQL	ALM2B19

	AND	ALM2B19
	AND	ALARM19	!V10.4 niet geopend
	EQL	ALM3B19

	AND	ALM1B19
	AND	KNIPPER
	OR	ALM3B19
	EQL	MELD19

	OR	MELD19
	OR	ALM1B19
	EQL	VERGR19

	AND	VERGR19
	ANDNT	ALM3B19
	EQL	CA19


	ANDNT	RESET
	AND	ALM1B20
	OR	ALARM20	!V10.4 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B20
	EQL	ALM1B20

	OR	RESET
	OR	ALM3B20
	EQL	ALM2B20

	AND	ALM2B20
	AND	ALARM20	!V10.4 niet gesloten
	EQL	ALM3B20

	AND	ALM1B20
	AND	KNIPPER
	OR	ALM3B20
	EQL	MELD20

	OR	MELD20
	OR	ALM1B20
	EQL	VERGR20

	AND	VERGR20
	ANDNT	ALM3B20
	EQL	CA20


	ANDNT	RESET
	AND	ALM1B21
	OR	ALARM21	!V11.1 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B21
	EQL	ALM1B21

	OR	RESET
	OR	ALM3B21
	EQL	ALM2B21

	AND	ALM2B21
	AND	ALARM21	!V11.1 niet geopend
	EQL	ALM3B21

	AND	ALM1B21
	AND	KNIPPER
	OR	ALM3B21
	EQL	MELD21

	OR	MELD21
	OR	ALM1B21
	EQL	VERGR21

	AND	VERGR21
	ANDNT	ALM3B21
	EQL	CA21


	ANDNT	RESET
	AND	ALM1B22
	OR	ALARM22	!V11.1 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B22
	EQL	ALM1B22

	OR	RESET
	OR	ALM3B22
	EQL	ALM2B22

	AND	ALM2B22
	AND	ALARM22	!V11.1 niet gesloten
	EQL	ALM3B22

	AND	ALM1B22
	AND	KNIPPER
	OR	ALM3B22
	EQL	MELD22

	OR	MELD22
	OR	ALM1B22
	EQL	VERGR22

	AND	VERGR22
	ANDNT	ALM3B22
	EQL	CA22


	ANDNT	RESET
	AND	ALM1B23
	OR	ALARM23	!V11.2 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B23
	EQL	ALM1B23

	OR	RESET
	OR	ALM3B23
	EQL	ALM2B23

	AND	ALM2B23
	AND	ALARM23	!V11.2 niet geopend
	EQL	ALM3B23

	AND	ALM1B23
	AND	KNIPPER
	OR	ALM3B23
	EQL	MELD23

	OR	MELD23
	OR	ALM1B23
	EQL	VERGR23

	AND	VERGR23
	ANDNT	ALM3B23
	EQL	CA23


	ANDNT	RESET
	AND	ALM1B24
	OR	ALARM24	!V11.2 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B24
	EQL	ALM1B24

	OR	RESET
	OR	ALM3B24
	EQL	ALM2B24

	AND	ALM2B24
	AND	ALARM24	!V11.2 niet gesloten
	EQL	ALM3B24

	AND	ALM1B24
	AND	KNIPPER
	OR	ALM3B24
	EQL	MELD24

	OR	MELD24
	OR	ALM1B24
	EQL	VERGR24

	AND	VERGR24
	ANDNT	ALM3B24
	EQL	CA24


	ANDNT	RESET
	AND	ALM1B25
	OR	ALARM25	!V11.3 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B25
	EQL	ALM1B25

	OR	RESET
	OR	ALM3B25
	EQL	ALM2B25

	AND	ALM2B25
	AND	ALARM25	!V11.3 niet geopend
	EQL	ALM3B25

	AND	ALM1B25
	AND	KNIPPER
	OR	ALM3B25
	EQL	MELD25

	OR	MELD25
	OR	ALM1B25
	EQL	VERGR25

	AND	VERGR25
	ANDNT	ALM3B25
	EQL	CA25


	ANDNT	RESET
	AND	ALM1B26
	OR	ALARM26	!V11.3 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B26
	EQL	ALM1B26

	OR	RESET
	OR	ALM3B26
	EQL	ALM2B26

	AND	ALM2B26
	AND	ALARM26	!V11.3 niet gesloten
	EQL	ALM3B26

	AND	ALM1B26
	AND	KNIPPER
	OR	ALM3B26
	EQL	MELD26

	OR	MELD26
	OR	ALM1B26
	EQL	VERGR26

	AND	VERGR26
	ANDNT	ALM3B26
	EQL	CA26


	ANDNT	RESET
	AND	ALM1B27
	OR	ALARM27	!V12.1 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B27
	EQL	ALM1B27

	OR	RESET
	OR	ALM3B27
	EQL	ALM2B27

	AND	ALM2B27
	AND	ALARM27	!V12.1 niet geopend
	EQL	ALM3B27

	AND	ALM1B27
	AND	KNIPPER
	OR	ALM3B27
	EQL	MELD27

	OR	MELD27
	OR	ALM1B27
	EQL	VERGR27

	AND	VERGR27
	ANDNT	ALM3B27
	EQL	CA27


	ANDNT	RESET
	AND	ALM1B28
	OR	ALARM28	!V12.1 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B28
	EQL	ALM1B28

	OR	RESET
	OR	ALM3B28
	EQL	ALM2B28

	AND	ALM2B28
	AND	ALARM28	!V12.1 niet gesloten
	EQL	ALM3B28

	AND	ALM1B28
	AND	KNIPPER
	OR	ALM3B28
	EQL	MELD28

	OR	MELD28
	OR	ALM1B28
	EQL	VERGR28

	AND	VERGR28
	ANDNT	ALM3B28
	EQL	CA28


	ANDNT	RESET
	AND	ALM1B29
	OR	ALARM29	!V 1.1 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B29
	EQL	ALM1B29

	OR	RESET
	OR	ALM3B29
	EQL	ALM2B29

	AND	ALM2B29
	AND	ALARM29	!V 1.1 niet geopend
	EQL	ALM3B29

	AND	ALM1B29
	AND	KNIPPER
	OR	ALM3B29
	EQL	MELD29

	OR	MELD29
	OR	ALM1B29
	EQL	VERGR29

	AND	VERGR29
	ANDNT	ALM3B29
	EQL	CA29


	ANDNT	RESET
	AND	ALM1B30
	OR	ALARM30	!V 1.1 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B30
	EQL	ALM1B30

	OR	RESET
	OR	ALM3B30
	EQL	ALM2B30

	AND	ALM2B30
	AND	ALARM30	!V 1.1 niet gesloten
	EQL	ALM3B30

	AND	ALM1B30
	AND	KNIPPER
	OR	ALM3B30
	EQL	MELD30

	OR	MELD30
	OR	ALM1B30
	EQL	VERGR30

	AND	VERGR30
	ANDNT	ALM3B30
	EQL	CA30


	ANDNT	RESET
	AND	ALM1B31
	OR	ALARM31	!V 3.1 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B31
	EQL	ALM1B31

	OR	RESET
	OR	ALM3B31
	EQL	ALM2B31

	AND	ALM2B31
	AND	ALARM31	!V 3.1 niet geopend
	EQL	ALM3B31

	AND	ALM1B31
	AND	KNIPPER
	OR	ALM3B31
	EQL	MELD31

	OR	MELD31
	OR	ALM1B31
	EQL	VERGR31

	AND	VERGR31
	ANDNT	ALM3B31
	EQL	CA31


	ANDNT	RESET
	AND	ALM1B32
	OR	ALARM32	!V 3.1 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B32
	EQL	ALM1B32

	OR	RESET
	OR	ALM3B32
	EQL	ALM2B32

	AND	ALM2B32
	AND	ALARM32	!V 3.1 niet gesloten
	EQL	ALM3B32

	AND	ALM1B32
	AND	KNIPPER
	OR	ALM3B32
	EQL	MELD32

	OR	MELD32
	OR	ALM1B32
	EQL	VERGR32

	AND	VERGR32
	ANDNT	ALM3B32
	EQL	CA32


	ANDNT	RESET
	AND	ALM1B33
	OR	ALARM33	!V 5.1 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B33
	EQL	ALM1B33

	OR	RESET
	OR	ALM3B33
	EQL	ALM2B33

	AND	ALM2B33
	AND	ALARM33	!V 5.1 niet geopend
	EQL	ALM3B33

	AND	ALM1B33
	AND	KNIPPER
	OR	ALM3B33
	EQL	MELD33

	OR	MELD33
	OR	ALM1B33
	EQL	VERGR33

	AND	VERGR33
	ANDNT	ALM3B33
	EQL	CA33


	ANDNT	RESET
	AND	ALM1B34
	OR	ALARM34	!V 5.1 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B34
	EQL	ALM1B34

	OR	RESET
	OR	ALM3B34
	EQL	ALM2B34

	AND	ALM2B34
	AND	ALARM34	!V 5.1 niet gesloten
	EQL	ALM3B34

	AND	ALM1B34
	AND	KNIPPER
	OR	ALM3B34
	EQL	MELD34

	OR	MELD34
	OR	ALM1B34
	EQL	VERGR34

	AND	VERGR34
	ANDNT	ALM3B34
	EQL	CA34


	ANDNT	RESET
	AND	ALM1B35
	OR	ALARM35	!V 7.1 niet geopend
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B35
	EQL	ALM1B35

	OR	RESET
	OR	ALM3B35
	EQL	ALM2B35

	AND	ALM2B35
	AND	ALARM35	!V 7.1 niet geopend
	EQL	ALM3B35

	AND	ALM1B35
	AND	KNIPPER
	OR	ALM3B35
	EQL	MELD35

	OR	MELD35
	OR	ALM1B35
	EQL	VERGR35

	AND	VERGR35
	ANDNT	ALM3B35
	EQL	CA35


	ANDNT	RESET
	AND	ALM1B36
	OR	ALARM36	!V 7.1 niet gesloten
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B36
	EQL	ALM1B36

	OR	RESET
	OR	ALM3B36
	EQL	ALM2B36

	AND	ALM2B36
	AND	ALARM36	!V 7.1 niet gesloten
	EQL	ALM3B36

	AND	ALM1B36
	AND	KNIPPER
	OR	ALM3B36
	EQL	MELD36

	OR	MELD36
	OR	ALM1B36
	EQL	VERGR36

	AND	VERGR36
	ANDNT	ALM3B36
	EQL	CA36


	ANDNT	RESET
	AND	ALM1B37
	OR	ALARM37	!P10 rondpompdruk te hoog
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B37
	EQL	ALM1B37

	OR	RESET
	OR	ALM3B37
	EQL	ALM2B37

	AND	ALM2B37
	AND	ALARM37	!P10 rondpompdruk te hoog
	EQL	ALM3B37

	AND	ALM1B37
	AND	KNIPPER
	OR	ALM3B37
	EQL	MELD37

	OR	MELD37
	OR	ALM1B37
	EQL	VERGR37	!hoge druk alarm P10

	AND	VERGR37	!hoge druk alarm P10
	ANDNT	ALM3B37
	EQL	CA37


	ANDNT	RESET
	AND	ALM1B38
	OR	ALARM38
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B38
	EQL	ALM1B38

	OR	RESET
	OR	ALM3B38
	EQL	ALM2B38

	AND	ALM2B38
	AND	ALARM38
	EQL	ALM3B38

	AND	ALM1B38
	AND	KNIPPER
	OR	ALM3B38
	EQL	MELD38

	OR	MELD38
	OR	ALM1B38
	EQL	VERGR38

	AND	VERGR38
	ANDNT	ALM3B38
	EQL	CA38


	ANDNT	RESET
	AND	ALM1B39
	OR	ALARM39	!P10 niet paraat
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B39
	EQL	ALM1B39

	OR	RESET
	OR	ALM3B39
	EQL	ALM2B39

	AND	ALM2B39
	AND	ALARM39	!P10 niet paraat
	EQL	ALM3B39

	AND	ALM1B39
	AND	KNIPPER
	OR	ALM3B39
	EQL	MELD39

	OR	MELD39
	OR	ALM1B39
	EQL	VERGR39

	AND	VERGR39
	ANDNT	ALM3B39
	EQL	CA39


	ANDNT	RESET
	AND	ALM1B40
	OR	ALARM40	!P11 niet paraat
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B40
	EQL	ALM1B40

	OR	RESET
	OR	ALM3B40
	EQL	ALM2B40

	AND	ALM2B40
	AND	ALARM40	!P11 niet paraat
	EQL	ALM3B40

	AND	ALM1B40
	AND	KNIPPER
	OR	ALM3B40
	EQL	MELD40

	OR	MELD40
	OR	ALM1B40
	EQL	VERGR40

	AND	VERGR40
	ANDNT	ALM3B40
	EQL	CA40


	ANDNT	RESET
	AND	ALM1B41
	OR	ALARM41	!concentraatafvoer te hoog
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B41
	EQL	ALM1B41

	OR	RESET
	OR	ALM3B41
	EQL	ALM2B41

	AND	ALM2B41
	AND	ALARM41	!concentraatafvoer te hoog
	EQL	ALM3B41

	AND	ALM1B41
	AND	KNIPPER
	OR	ALM3B41
	EQL	MELD41

	OR	MELD41
	OR	ALM1B41
	EQL	VERGR41

	AND	VERGR41
	ANDNT	ALM3B41
	EQL	CA41


	ANDNT	RESET
	AND	ALM1B42
	OR	ALARM42	!nivo proceswater
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B42
	EQL	ALM1B42

	OR	RESET
	OR	ALM3B42
	EQL	ALM2B42

	AND	ALM2B42
	AND	ALARM42	!nivo proceswater
	EQL	ALM3B42

	AND	ALM1B42
	AND	KNIPPER
	OR	ALM3B42
	EQL	MELD42

	OR	MELD42
	OR	ALM1B42
	EQL	VERGR42

	AND	VERGR42
	ANDNT	ALM3B42
	EQL	CA42


	ANDNT	RESET
	AND	ALM1B43
	OR	ALARM43	!druk vuilproceswater
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B43
	EQL	ALM1B43

	OR	RESET
	OR	ALM3B43
	EQL	ALM2B43

	AND	ALM2B43
	AND	ALARM43	!druk vuilproceswater
	EQL	ALM3B43

	AND	ALM1B43
	AND	KNIPPER
	OR	ALM3B43
	EQL	MELD43

	OR	MELD43
	OR	ALM1B43
	EQL	VERGR43	!druk vuilproceswater

	AND	VERGR43	!druk vuilproceswater
	ANDNT	ALM3B43
	EQL	CA43


	ANDNT	RESET
	AND	ALM1B44
	OR	ALARM44	!rho proceswater
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B44
	EQL	ALM1B44

	OR	RESET
	OR	ALM3B44
	EQL	ALM2B44

	AND	ALM2B44
	AND	ALARM44	!rho proceswater
	EQL	ALM3B44

	AND	ALM1B44
	AND	KNIPPER
	OR	ALM3B44
	EQL	MELD44

	OR	MELD44
	OR	ALM1B44
	EQL	VERGR44	!rho proceswater

	AND	VERGR44	!rho proceswater
	ANDNT	ALM3B44
	EQL	CA44


	ANDNT	RESET
	AND	ALM1B45
	OR	ALARM45	!lage flow alarm vuilproceswater
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B45
	EQL	ALM1B45

	OR	RESET
	OR	ALM3B45
	EQL	ALM2B45

	AND	ALM2B45
	AND	ALARM45	!lage flow alarm vuilproceswater
	EQL	ALM3B45

	AND	ALM1B45
	AND	KNIPPER
	OR	ALM3B45
	EQL	MELD45	!lage flow alarm vuilproceswater

	OR	MELD45	!lage flow alarm vuilproceswater
	OR	ALM1B45
	EQL	VERGR45	!lage flow alarm vuilproceswater

	AND	VERGR45	!lage flow alarm vuilproceswater
	ANDNT	ALM3B45
	EQL	CA45	!lage flow alarm vuilproceswater


	ANDNT	RESET
	AND	ALM1B46
	OR	ALARM46	!regeneratie cmf niet op tijd gevuld
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B46
	EQL	ALM1B46

	OR	RESET
	OR	ALM3B46
	EQL	ALM2B46

	AND	ALM2B46
	AND	ALARM46	!regeneratie cmf niet op tijd gevuld
	EQL	ALM3B46

	AND	ALM1B46
	AND	KNIPPER
	OR	ALM3B46
	EQL	MELD46	!regeneratie cmf niet op tijd gevuld

	OR	MELD46	!regeneratie cmf niet op tijd gevuld
	OR	ALM1B46
	EQL	VERGR46	!regeneratie cmf niet op tijd gevuld

	AND	VERGR46	!regeneratie cmf niet op tijd gevuld
	ANDNT	ALM3B46
	EQL	CA46	!regeneratie cmf niet op tijd gevuld


	ANDNT	RESET
	AND	ALM1B47
	OR	ALARM47	!regeneratie cmf niet op tijd geledigd
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B47
	EQL	ALM1B47

	OR	RESET
	OR	ALM3B47
	EQL	ALM2B47

	AND	ALM2B47
	AND	ALARM47	!regeneratie cmf niet op tijd geledigd
	EQL	ALM3B47

	AND	ALM1B47
	AND	KNIPPER
	OR	ALM3B47
	EQL	MELD47	!regeneratie cmf niet op tijd geledigd

	OR	MELD47	!regeneratie cmf niet op tijd geledigd
	OR	ALM1B47
	EQL	VERGR47	!regeneratie cmf niet op tijd geledigd

	AND	VERGR47	!regeneratie cmf niet op tijd geledigd
	ANDNT	ALM3B47
	EQL	CA47	!regeneratie cmf niet op tijd geledigd


	ANDNT	RESET
	AND	ALM1B48
	OR	ALARM48
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B48
	EQL	ALM1B48

	OR	RESET
	OR	ALM3B48
	EQL	ALM2B48

	AND	ALM2B48
	AND	ALARM48
	EQL	ALM3B48

	AND	ALM1B48
	AND	KNIPPER
	OR	ALM3B48
	EQL	MELD48

	OR	MELD48
	OR	ALM1B48
	EQL	VERGR48

	AND	VERGR48
	ANDNT	ALM3B48
	EQL	CA48


	ANDNT	RESET
	AND	ALM1B49
	OR	ALARM49
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B49
	EQL	ALM1B49

	OR	RESET
	OR	ALM3B49
	EQL	ALM2B49

	AND	ALM2B49
	AND	ALARM49
	EQL	ALM3B49

	AND	ALM1B49
	AND	KNIPPER
	OR	ALM3B49
	EQL	MELD49

	OR	MELD49
	OR	ALM1B49
	EQL	VERGR49

	AND	VERGR49
	ANDNT	ALM3B49
	EQL	CA49


	ANDNT	RESET
	AND	ALM1B50
	OR	ALARM50
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B50
	EQL	ALM1B50

	OR	RESET
	OR	ALM3B50
	EQL	ALM2B50

	AND	ALM2B50
	AND	ALARM50
	EQL	ALM3B50

	AND	ALM1B50
	AND	KNIPPER
	OR	ALM3B50
	EQL	MELD50

	OR	MELD50
	OR	ALM1B50
	EQL	VERGR50

	AND	VERGR50
	ANDNT	ALM3B50
	EQL	CA50


	ANDNT	RESET
	AND	ALM1B51
	OR	ALARM51
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B51
	EQL	ALM1B51

	OR	RESET
	OR	ALM3B51
	EQL	ALM2B51

	AND	ALM2B51
	AND	ALARM51
	EQL	ALM3B51

	AND	ALM1B51
	AND	KNIPPER
	OR	ALM3B51
	EQL	MELD51

	OR	MELD51
	OR	ALM1B51
	EQL	VERGR51

	AND	VERGR51
	ANDNT	ALM3B51
	EQL	CA51


	ANDNT	RESET
	AND	ALM1B52
	OR	ALARM52
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B52
	EQL	ALM1B52

	OR	RESET
	OR	ALM3B52
	EQL	ALM2B52

	AND	ALM2B52
	AND	ALARM52
	EQL	ALM3B52

	AND	ALM1B52
	AND	KNIPPER
	OR	ALM3B52
	EQL	MELD52

	OR	MELD52
	OR	ALM1B52
	EQL	VERGR52

	AND	VERGR52
	ANDNT	ALM3B52
	EQL	CA52


	ANDNT	RESET
	AND	ALM1B53
	OR	ALARM53
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B53
	EQL	ALM1B53

	OR	RESET
	OR	ALM3B53
	EQL	ALM2B53

	AND	ALM2B53
	AND	ALARM53
	EQL	ALM3B53

	AND	ALM1B53
	AND	KNIPPER
	OR	ALM3B53
	EQL	MELD53

	OR	MELD53
	OR	ALM1B53
	EQL	VERGR53

	AND	VERGR53
	ANDNT	ALM3B53
	EQL	CA53


	ANDNT	RESET
	AND	ALM1B54
	OR	ALARM54
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B54
	EQL	ALM1B54

	OR	RESET
	OR	ALM3B54
	EQL	ALM2B54

	AND	ALM2B54
	AND	ALARM54
	EQL	ALM3B54

	AND	ALM1B54
	AND	KNIPPER
	OR	ALM3B54
	EQL	MELD54

	OR	MELD54
	OR	ALM1B54
	EQL	VERGR54

	AND	VERGR54
	ANDNT	ALM3B54
	EQL	CA54


	ANDNT	RESET
	AND	ALM1B55
	OR	ALARM55
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B55
	EQL	ALM1B55

	OR	RESET
	OR	ALM3B55
	EQL	ALM2B55

	AND	ALM2B55
	AND	ALARM55
	EQL	ALM3B55

	AND	ALM1B55
	AND	KNIPPER
	OR	ALM3B55
	EQL	MELD55

	OR	MELD55
	OR	ALM1B55
	EQL	VERGR55

	AND	VERGR55
	ANDNT	ALM3B55
	EQL	CA55


	ANDNT	RESET
	AND	ALM1B56
	OR	ALARM56
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B56
	EQL	ALM1B56

	OR	RESET
	OR	ALM3B56
	EQL	ALM2B56

	AND	ALM2B56
	AND	ALARM56
	EQL	ALM3B56

	AND	ALM1B56
	AND	KNIPPER
	OR	ALM3B56
	EQL	MELD56

	OR	MELD56
	OR	ALM1B56
	EQL	VERGR56

	AND	VERGR56
	ANDNT	ALM3B56
	EQL	CA56


	ANDNT	RESET
	AND	ALM1B57
	OR	ALARM57
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B57
	EQL	ALM1B57

	OR	RESET
	OR	ALM3B57
	EQL	ALM2B57

	AND	ALM2B57
	AND	ALARM57
	EQL	ALM3B57

	AND	ALM1B57
	AND	KNIPPER
	OR	ALM3B57
	EQL	MELD57

	OR	MELD57
	OR	ALM1B57
	EQL	VERGR57

	AND	VERGR57
	ANDNT	ALM3B57
	EQL	CA57


	ANDNT	RESET
	AND	ALM1B58
	OR	ALARM58
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B58
	EQL	ALM1B58

	OR	RESET
	OR	ALM3B58
	EQL	ALM2B58

	AND	ALM2B58
	AND	ALARM58
	EQL	ALM3B58

	AND	ALM1B58
	AND	KNIPPER
	OR	ALM3B58
	EQL	MELD58

	OR	MELD58
	OR	ALM1B58
	EQL	VERGR58

	AND	VERGR58
	ANDNT	ALM3B58
	EQL	CA58


	ANDNT	RESET
	AND	ALM1B59
	OR	ALARM59
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B59
	EQL	ALM1B59

	OR	RESET
	OR	ALM3B59
	EQL	ALM2B59

	AND	ALM2B59
	AND	ALARM59
	EQL	ALM3B59

	AND	ALM1B59
	AND	KNIPPER
	OR	ALM3B59
	EQL	MELD59

	OR	MELD59
	OR	ALM1B59
	EQL	VERGR59

	AND	VERGR59
	ANDNT	ALM3B59
	EQL	CA59


	ANDNT	RESET
	AND	ALM1B60
	OR	ALARM60
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B60
	EQL	ALM1B60

	OR	RESET
	OR	ALM3B60
	EQL	ALM2B60

	AND	ALM2B60
	AND	ALARM60
	EQL	ALM3B60

	AND	ALM1B60
	AND	KNIPPER
	OR	ALM3B60
	EQL	MELD60

	OR	MELD60
	OR	ALM1B60
	EQL	VERGR60

	AND	VERGR60
	ANDNT	ALM3B60
	EQL	CA60


	ANDNT	RESET
	AND	ALM1B61
	OR	ALARM61
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B61
	EQL	ALM1B61

	OR	RESET
	OR	ALM3B61
	EQL	ALM2B61

	AND	ALM2B61
	AND	ALARM61
	EQL	ALM3B61

	AND	ALM1B61
	AND	KNIPPER
	OR	ALM3B61
	EQL	MELD61

	OR	MELD61
	OR	ALM1B61
	EQL	VERGR61

	AND	VERGR61
	ANDNT	ALM3B61
	EQL	CA61


	ANDNT	RESET
	AND	ALM1B62
	OR	ALARM62
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B62
	EQL	ALM1B62

	OR	RESET
	OR	ALM3B62
	EQL	ALM2B62

	AND	ALM2B62
	AND	ALARM62
	EQL	ALM3B62

	AND	ALM1B62
	AND	KNIPPER
	OR	ALM3B62
	EQL	MELD62

	OR	MELD62
	OR	ALM1B62
	EQL	VERGR62

	AND	VERGR62
	ANDNT	ALM3B62
	EQL	CA62


	ANDNT	RESET
	AND	ALM1B63
	OR	ALARM63
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B63
	EQL	ALM1B63

	OR	RESET
	OR	ALM3B63
	EQL	ALM2B63

	AND	ALM2B63
	AND	ALARM63
	EQL	ALM3B63

	AND	ALM1B63
	AND	KNIPPER
	OR	ALM3B63
	EQL	MELD63

	OR	MELD63
	OR	ALM1B63
	EQL	VERGR63

	AND	VERGR63
	ANDNT	ALM3B63
	EQL	CA63


	ANDNT	RESET
	AND	ALM1B64
	OR	ALARM64
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B64
	EQL	ALM1B64

	OR	RESET
	OR	ALM3B64
	EQL	ALM2B64

	AND	ALM2B64
	AND	ALARM64
	EQL	ALM3B64

	AND	ALM1B64
	AND	KNIPPER
	OR	ALM3B64
	EQL	MELD64

	OR	MELD64
	OR	ALM1B64
	EQL	VERGR64

	AND	VERGR64
	ANDNT	ALM3B64
	EQL	CA64


	ANDNT	RESET
	AND	ALM1B65
	OR	ALARM65
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B65
	EQL	ALM1B65

	OR	RESET
	OR	ALM3B65
	EQL	ALM2B65

	AND	ALM2B65
	AND	ALARM65
	EQL	ALM3B65

	AND	ALM1B65
	AND	KNIPPER
	OR	ALM3B65
	EQL	MELD65

	OR	MELD65
	OR	ALM1B65
	EQL	VERGR65

	AND	VERGR65
	ANDNT	ALM3B65
	EQL	CA65


	ANDNT	RESET
	AND	ALM1B66
	OR	ALARM66
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B66
	EQL	ALM1B66

	OR	RESET
	OR	ALM3B66
	EQL	ALM2B66

	AND	ALM2B66
	AND	ALARM66
	EQL	ALM3B66

	AND	ALM1B66
	AND	KNIPPER
	OR	ALM3B66
	EQL	MELD66

	OR	MELD66
	OR	ALM1B66
	EQL	VERGR66

	AND	VERGR66
	ANDNT	ALM3B66
	EQL	CA66


	ANDNT	RESET
	AND	ALM1B67
	OR	ALARM67
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B67
	EQL	ALM1B67

	OR	RESET
	OR	ALM3B67
	EQL	ALM2B67

	AND	ALM2B67
	AND	ALARM67
	EQL	ALM3B67

	AND	ALM1B67
	AND	KNIPPER
	OR	ALM3B67
	EQL	MELD67

	OR	MELD67
	OR	ALM1B67
	EQL	VERGR67

	AND	VERGR67
	ANDNT	ALM3B67
	EQL	CA67


	ANDNT	RESET
	AND	ALM1B68
	OR	ALARM68
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B68
	EQL	ALM1B68

	OR	RESET
	OR	ALM3B68
	EQL	ALM2B68

	AND	ALM2B68
	AND	ALARM68
	EQL	ALM3B68

	AND	ALM1B68
	AND	KNIPPER
	OR	ALM3B68
	EQL	MELD68

	OR	MELD68
	OR	ALM1B68
	EQL	VERGR68

	AND	VERGR68
	ANDNT	ALM3B68
	EQL	CA68


	ANDNT	RESET
	AND	ALM1B69
	OR	ALARM69
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B69
	EQL	ALM1B69

	OR	RESET
	OR	ALM3B69
	EQL	ALM2B69

	AND	ALM2B69
	AND	ALARM69
	EQL	ALM3B69

	AND	ALM1B69
	AND	KNIPPER
	OR	ALM3B69
	EQL	MELD69

	OR	MELD69
	OR	ALM1B69
	EQL	VERGR69

	AND	VERGR69
	ANDNT	ALM3B69
	EQL	CA69


	ANDNT	RESET
	AND	ALM1B70
	OR	ALARM70
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B70
	EQL	ALM1B70

	OR	RESET
	OR	ALM3B70
	EQL	ALM2B70

	AND	ALM2B70
	AND	ALARM70
	EQL	ALM3B70

	AND	ALM1B70
	AND	KNIPPER
	OR	ALM3B70
	EQL	MELD70

	OR	MELD70
	OR	ALM1B70
	EQL	VERGR70

	AND	VERGR70
	ANDNT	ALM3B70
	EQL	CA70


	ANDNT	RESET
	AND	ALM1B71
	OR	ALARM71
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B71
	EQL	ALM1B71

	OR	RESET
	OR	ALM3B71
	EQL	ALM2B71

	AND	ALM2B71
	AND	ALARM71
	EQL	ALM3B71

	AND	ALM1B71
	AND	KNIPPER
	OR	ALM3B71
	EQL	MELD71

	OR	MELD71
	OR	ALM1B71
	EQL	VERGR71

	AND	VERGR71
	ANDNT	ALM3B71
	EQL	CA71


	ANDNT	RESET
	AND	ALM1B72
	OR	ALARM72
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B72
	EQL	ALM1B72

	OR	RESET
	OR	ALM3B72
	EQL	ALM2B72

	AND	ALM2B72
	AND	ALARM72
	EQL	ALM3B72

	AND	ALM1B72
	AND	KNIPPER
	OR	ALM3B72
	EQL	MELD72

	OR	MELD72
	OR	ALM1B72
	EQL	VERGR72

	AND	VERGR72
	ANDNT	ALM3B72
	EQL	CA72


	ANDNT	RESET
	AND	ALM1B73
	OR	ALARM73
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B73
	EQL	ALM1B73

	OR	RESET
	OR	ALM3B73
	EQL	ALM2B73

	AND	ALM2B73
	AND	ALARM73
	EQL	ALM3B73

	AND	ALM1B73
	AND	KNIPPER
	OR	ALM3B73
	EQL	MELD73

	OR	MELD73
	OR	ALM1B73
	EQL	VERGR73

	AND	VERGR73
	ANDNT	ALM3B73
	EQL	CA73


	ANDNT	RESET
	AND	ALM1B74
	OR	ALARM74
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B74
	EQL	ALM1B74

	OR	RESET
	OR	ALM3B74
	EQL	ALM2B74

	AND	ALM2B74
	AND	ALARM74
	EQL	ALM3B74

	AND	ALM1B74
	AND	KNIPPER
	OR	ALM3B74
	EQL	MELD74

	OR	MELD74
	OR	ALM1B74
	EQL	VERGR74

	AND	VERGR74
	ANDNT	ALM3B74
	EQL	CA74


	ANDNT	RESET
	AND	ALM1B75
	OR	ALARM75
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B75
	EQL	ALM1B75

	OR	RESET
	OR	ALM3B75
	EQL	ALM2B75

	AND	ALM2B75
	AND	ALARM75
	EQL	ALM3B75

	AND	ALM1B75
	AND	KNIPPER
	OR	ALM3B75
	EQL	MELD75

	OR	MELD75
	OR	ALM1B75
	EQL	VERGR75

	AND	VERGR75
	ANDNT	ALM3B75
	EQL	CA75


	ANDNT	RESET
	AND	ALM1B76
	OR	ALARM76
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B76
	EQL	ALM1B76

	OR	RESET
	OR	ALM3B76
	EQL	ALM2B76

	AND	ALM2B76
	AND	ALARM76
	EQL	ALM3B76

	AND	ALM1B76
	AND	KNIPPER
	OR	ALM3B76
	EQL	MELD76

	OR	MELD76
	OR	ALM1B76
	EQL	VERGR76

	AND	VERGR76
	ANDNT	ALM3B76
	EQL	CA76


	ANDNT	RESET
	AND	ALM1B77
	OR	ALARM77
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B77
	EQL	ALM1B77

	OR	RESET
	OR	ALM3B77
	EQL	ALM2B77

	AND	ALM2B77
	AND	ALARM77
	EQL	ALM3B77

	AND	ALM1B77
	AND	KNIPPER
	OR	ALM3B77
	EQL	MELD77

	OR	MELD77
	OR	ALM1B77
	EQL	VERGR77

	AND	VERGR77
	ANDNT	ALM3B77
	EQL	CA77


	ANDNT	RESET
	AND	ALM1B78
	OR	ALARM78
	EQL	DUMP

	AND	DUMP
	ANDNT	ALM3B78
	EQL	ALM1B78

	OR	RESET
	OR	ALM3B78
	EQL	ALM2B78

	AND	ALM2B78
	AND	ALARM78
	EQL	ALM3B78

	AND	ALM1B78
	AND	KNIPPER
	OR	ALM3B78
	EQL	MELD78

	OR	MELD78
	OR	ALM1B78
	EQL	VERGR78

	AND	VERGR78
	ANDNT	ALM3B78
	EQL	CA78


	AND	CA01
	OR	CA02
	OR	CA03
	OR	CA04
	OR	CA05
	OR	CA06
	OR	CA07
	OR	CA08
	OR	CA09
	OR	CA10
	OR	CA11
	OR	CA12
	OR	CA13
	OR	CA14
	OR	CA15
	OR	CA16
	OR	CA17
	OR	CA18
	OR	CA19
	OR	CA20
	OR	CA21
	OR	CA22
	OR	CA23
	OR	CA24
	OR	CA25
	OR	CA26
	OR	CA27
	OR	CA28
	OR	CA29
	OR	CA30
	OR	CA31
	OR	CA32
	OR	CA33
	OR	CA34
	OR	CA35
	OR	CA36
	OR	CA37
	OR	CA38
	OR	CA39
	OR	CA40
	OR	CA41
	OR	CA42
	OR	CA43
	OR	CA44
	OR	CA45	!lage flow alarm vuilproceswater
	OR	CA46	!regeneratie cmf niet op tijd gevuld
	OR	CA47	!regeneratie cmf niet op tijd geledigd
	OR	CA48
	OR	CA49
	OR	CA50
	OR	CA51
	OR	CA52
	OR	CA53
	OR	CA54
	OR	CA55
	OR	CA56
	OR	CA57
	OR	CA58
	OR	CA59
	OR	CA60
	OR	CA61
	OR	CA62
	OR	CA63
	OR	CA64
	OR	CA65
	OR	CA66
	OR	CA67
	OR	CA68
	OR	CA69
	OR	CA70
	OR	CA71
	OR	CA72
	OR	CA73
	OR	CA74
	OR	CA75
	OR	CA76
	OR	CA77
	OR	CA78
	EQL	CLAXON
	NOP	88
!                               DR_BDR
!				******
!
!
! Bedrijfsvoorwaarden
!
	ANDNT	ALM0I39	!P10 therm. gestoord
	AND	BDR0I07	!P10 automatisch
	ANDNT	ALM0B08	!een of meerdere afsl.gestoord
	ANDNT	VERGR43	!druk vuilproceswater
	ANDNT	VERGR44	!rho proceswater
	ANDNT	VERGR45	!lage flow alarm vuilproceswater
	ANDNT	VERGR37	!hoge druk alarm P10
	ANDNT	VERGR02	!stuurlucht gestoord
	ANDNT	VERGR03	!stuurspanning gestoord
	ANDNT	VERGR05	!vuilwater tank leeg
	AND	BDR0B21	!vrijgave uitgangen (aktiveren)
	EQL	BDR0B11	!bedrijfsvoorwaarden

	AND	BDR0B11	!bedrijfsvoorwaarden
	AND	BDR0B00	!start bedrijf fasen 1 t/m 6
	EQL	BDR0B10	!bedrijfsmelding

  AND BDR0I03 !bedrijfskeuze schak. "MCS_400"
	AND	AKTIEF	!aktiveren bedrijfskeuze
	SET1	WZC0B16	!bedrijfsvoering via WIZCON

  ANDNT BDR0I03 !bedrijfskeuze schak. "MCS_400"
	SET0	WZC0B16	!bedrijfsvoering via WIZCON

	AND	000.1
	FTCHC	01
	COMP	3128
	STRB	WZC0B08	!wizconcommando BEDRIJF

	AND	WZC0B08	!wizconcommando BEDRIJF
	AND	WZC0B16	!bedrijfsvoering via WIZCON
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	EQL	WZC0B12	!wizconcommando BEDRIJF + KEUZESCHAK.=SUP

	AND	000.1
	FTCHC	02
	COMP	3128
  STRB  WZC0B09 !wizconcommando STAND_BY

  AND WZC0B09 !wizconcommando STAND_BY
	AND	WZC0B16	!bedrijfsvoering via WIZCON
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
  EQL WZC0B13 !wizconcommando STAND_BY + KEUZESCHAK.=SU

	AND	000.1
	FTCHC	03
	COMP	3128
	STRB	WZC0B10	!wizconcommando REGENERATIE

	AND	WZC0B10	!wizconcommando REGENERATIE
	AND	WZC0B16	!bedrijfsvoering via WIZCON
	EQL	WZC0B14	!wizconcommando REGENRATIE + KEUZESCHAK.=

	AND	000.1
	FTCHC	04
	COMP	3128
	STRB	WZC0B11	!wizconcommando SPUIEN

	AND	WZC0B11	!wizconcommando SPUIEN
	AND	WZC0B16	!bedrijfsvoering via WIZCON
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	EQL	WZC0B15	!wizconcommando SPUIEN + KEUZESCHAK.=SUPE

	AND	WZC0B12	!wizconcommando BEDRIJF + KEUZESCHAK.=SUP
	AND	BDR0B11	!bedrijfsvoorwaarden
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	TRIG	WZC0T00	!triggerpuls wizconcommando BEDRIJF
	AND	WZC0T00	!triggerpuls wizconcommando BEDRIJF
	EQL	WZC0B04	!commando BEDRIJF vanuit wizcon

	AND	WZC0B15	!wizconcommando SPUIEN + KEUZESCHAK.=SUPE
	AND	BDR0B11	!bedrijfsvoorwaarden
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	TRIG	WZC0T03	!triggerpuls wizconcommando SPUIEN
	AND	WZC0T03	!triggerpuls wizconcommando SPUIEN
	EQL	WZC0B07	!commando SPUIEN vanuit wizcon

	AND	WZC0B14	!wizconcommando REGENRATIE + KEUZESCHAK.=
	AND	REG0B48	!regen.startvoorwaarden
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	TRIG	WZC0T02	!triggerpuls wizconcommando REGENRATIE
	AND	WZC0T02	!triggerpuls wizconcommando REGENRATIE
	EQL	WZC0B06	!commando REGENERATIE vanuit wizcon
!
! aktiveren bedrijfsfasen 1 t/m 6
!
	AND	BDR0I02	!bedrijfskeuze schak. "NORMAAL"
	AND	AKTIEF	!aktiveren bedrijfskeuze
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	OR	WZC0B04	!commando BEDRIJF vanuit wizcon
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	OR	WZC0B07	!commando SPUIEN vanuit wizcon
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	SET1	BDR0B00	!start bedrijf fasen 1 t/m 6
!
! voorwaarden voor stappen naar volgende fase
!
	ANDNT	REG0I04	!keuzeschak.regen. automatisch
	AND	REG0I05	!drukkn.doorstappen regeneratie
	TRIG	BDR0T00	!doorstap triggerpuls
	EQL	BDR0B09	!hand doorstap (triggerpuls)

	OR	BDR0B07	!einde fasetimer
	OR	BDR0B09	!hand doorstap (triggerpuls)
  EQL STAP_2  !stappen faseregister
!
! starten aanloopfase 88
!
	AND	BDR0B00	!start bedrijf fasen 1 t/m 6
	TRIG	TRGAAN88	!triggerpuls aanloopfase 88
	EQL	TRGBEG88	!triggerpuls begin fase 88
	SET1	REG0B88	!aanloopfase 88

	ANDNT	REG0B88	!aanloopfase 88
	FTCHD	STP88_0	!setpoint 88 eenheden
	FTCHD	STP88_1	!setpoint 88 tientallen
	FTCHD	STP88_2	!setpoint 88 honderdtallen
	FTCHD	STP88_3	!setpoint 88 duizendtallen
	STRD	DSP88_0	!display 88 eenheden
	STRD	DSP88_1	!display 88 tientallen
	STRD	DSP88_2	!display 88 honderdtallen
	STRD	DSP88_3	!display 88 duizendtallen
	SET0	TMRAAN88	!timer aanloopfase 88

	AND	BDR0B10	!bedrijfsmelding
	AND	REG0I04	!keuzeschak.regen. automatisch
	AND	REG0B88	!aanloopfase 88
	AND	S_1SEC	!triggerpuls 1,0 sec.
	ANDNT	TMRAAN88	!timer aanloopfase 88
	CNTD	DSP88_0	!display 88 eenheden
	CNTD	DSP88_1	!display 88 tientallen
	CNTD	DSP88_2	!display 88 honderdtallen
	CNTD	DSP88_3	!display 88 duizendtallen
	STRB	TMRAAN88	!timer aanloopfase 88

	OR	TRGBEG88	!triggerpuls begin fase 88
	OR	ALM0I44	!slechte geleidb.h. reinwater
	FTCHC	00
	FTCHC	06
	STRD	EENTIM88	!eenh. 1 min. timer in fase 88
	STRD	TIETIM88	!tient. 1 min. timer in fase 88
	SET0	TMRGEL88	!timer 1 min. geleidb. goed in fase 88

	AND	REG0B88	!aanloopfase 88
	AND	BDR0B10	!bedrijfsmelding
	AND	REG0I04	!keuzeschak.regen. automatisch
	ANDNT	ALM0I44	!slechte geleidb.h. reinwater
	AND	S_1SEC	!triggerpuls 1,0 sec.
	ANDNT	TMRGEL88	!timer 1 min. geleidb. goed in fase 88
	CNTD	EENTIM88	!eenh. 1 min. timer in fase 88
	CNTD	TIETIM88	!tient. 1 min. timer in fase 88
	STRB	TMRGEL88	!timer 1 min. geleidb. goed in fase 88

  OR  STAP_2  !stappen faseregister
	OR	TMRGEL88	!timer 1 min. geleidb. goed in fase 88
	OR	TMRAAN88	!timer aanloopfase 88
	SET0	REG0B88	!aanloopfase 88
!
!
	AND	BDR0B06	!bedrijfsfase 6
  AND STAP_2  !stappen faseregister
	SET0	BDR0B06	!bedrijfsfase 6
!
! stap naar fase 6
!
	AND	BDR0B05	!bedrijfsfase 5
  AND STAP_2  !stappen faseregister
	SET1	BDR0B06	!bedrijfsfase 6
	SET0	BDR0B05	!bedrijfsfase 5
!
! stap naar fase 5
!
	AND	BDR0B04	!bedrijfsfase 4
  AND STAP_2  !stappen faseregister
	SET1	BDR0B05	!bedrijfsfase 5
	SET0	BDR0B04	!bedrijfsfase 4
!
! stap naar fase 4
!
	AND	BDR0B03	!bedrijfsfase 3
  AND STAP_2  !stappen faseregister
	SET1	BDR0B04	!bedrijfsfase 4
	SET0	BDR0B03	!bedrijfsfase 3
!
! stap naar fase 3
!
	AND	BDR0B02	!bedrijfsfase 2
  AND STAP_2  !stappen faseregister
	SET1	BDR0B03	!bedrijfsfase 3
	SET0	BDR0B02	!bedrijfsfase 2
!
! stap naar fase 2
!
	AND	BDR0B01	!bedrijfsfase 1
  AND STAP_2  !stappen faseregister
	SET1	BDR0B02	!bedrijfsfase 2
	SET0	BDR0B01	!bedrijfsfase 1
!
! starten fase 1
!
	AND	BDR0B00	!start bedrijf fasen 1 t/m 6
	ANDNT	BDR0B06	!bedrijfsfase 6
	ANDNT	REG0B88	!aanloopfase 88
	TRIG	BDR0T01	!triggerpuls laden timer fase 1
	EQL	BDR0B08	!startpuls bedrijf fase 1 t/m 6

	AND	BDR0B08	!startpuls bedrijf fase 1 t/m 6
	SET1	BDR0B01	!bedrijfsfase 1
!
! laden fase tijden
!
	AND	BDR0B08	!startpuls bedrijf fase 1 t/m 6
	JFRF	L09363
	FTCHD	STP01_0	!setpoint 01 eenheden
	FTCHD	STP01_1	!setpoint 01 tientallen
	FTCHD	STP01_2	!setpoint 01 honderdtallen
L09363	FTCHD	STP01_3	!setpoint 01 duizendtallen

	ANDNT	BDR0B01	!bedrijfsfase 1
	TRIG	BDR0T02	!triggerpuls laden timer fase 2
	JFRF	L09370
	FTCHD	STP02_0	!setpoint 02 eenheden
	FTCHD	STP02_1	!setpoint 02 tientallen
	FTCHD	STP02_2	!setpoint 02 honderdtallen
L09370	FTCHD	STP02_3	!setpoint 02 duizendtallen

	ANDNT	BDR0B02	!bedrijfsfase 2
	TRIG	BDR0T03	!triggerpuls laden timer fase 3
	JFRF	L09377
	FTCHD	STP03_0	!setpoint 03 eenheden
	FTCHD	STP03_1	!setpoint 03 tientallen
	FTCHD	STP03_2	!setpoint 03 honderdtallen
L09377	FTCHD	STP03_3	!setpoint 03 duizendtallen

	ANDNT	BDR0B03	!bedrijfsfase 3
	TRIG	BDR0T04	!triggerpuls laden timer fase 4
	JFRF	L09384
	FTCHD	STP04_0	!setpoint 04 eenheden
	FTCHD	STP04_1	!setpoint 04 tientallen
	FTCHD	STP04_2	!setpoint 04 honderdtallen
L09384	FTCHD	STP04_3	!setpoint 04 duizendtallen

	ANDNT	BDR0B04	!bedrijfsfase 4
	TRIG	BDR0T05	!triggerpuls laden timer fase 5
	JFRF	L09391
	FTCHD	STP05_0	!setpoint 05 eenheden
	FTCHD	STP05_1	!setpoint 05 tientallen
	FTCHD	STP05_2	!setpoint 05 honderdtallen
L09391	FTCHD	STP05_3	!setpoint 05 duizendtallen

	ANDNT	BDR0B05	!bedrijfsfase 5
	TRIG	BDR0T06	!triggerpuls laden timer fase 6
	JFRF	L09398
	FTCHD	STP06_0	!setpoint 06 eenheden
	FTCHD	STP06_1	!setpoint 06 tientallen
	FTCHD	STP06_2	!setpoint 06 honderdtallen
L09398	FTCHD	STP06_3	!setpoint 06 duizendtallen
!
! opslaan tijden in fasetimer
!
  AND STAP_2  !stappen faseregister
	OR	BDR0B08	!startpuls bedrijf fase 1 t/m 6
	STRD	DSP98_0	!display 98 eenheden
	STRD	DSP98_1	!display 98 tientallen
	STRD	DSP98_2	!display 98 honderdtallen
	STRD	DSP98_3	!display 98 duizendtallen
	SET0	BDR0B07	!einde fasetimer
!
! afloop fasetimer indien bedrijfsvoorwaarden aanwezig
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B10	!bedrijfsmelding
	AND	REG0I04	!keuzeschak.regen. automatisch
	ANDNT	BDR0B07	!einde fasetimer
	CNTD	DSP98_0	!display 98 eenheden
	CNTD	DSP98_1	!display 98 tientallen
	CNTD	DSP98_2	!display 98 honderdtallen
	CNTD	DSP98_3	!display 98 duizendtallen
	STRB	BDR0B07	!einde fasetimer

	ANDNT	WZC0B12	!wizconcommando BEDRIJF + KEUZESCHAK.=SUP
	ANDNT	WZC0B15	!wizconcommando SPUIEN + KEUZESCHAK.=SUPE
	TRIG	WZC0T04	!triggerpuls einde bedrijf via WIZCON
	EQL	WZC0B17	!puls einde bedrijf via WIZCON

	ANDNT	BDR0I02	!bedrijfskeuze schak. "NORMAAL"
	TRIG	BDR0T07	!triggerpuls reset fasen
	EQL	WZC0B18	!puls einde bedrijf via schakelaar
!
! resetten bedrijfsfasen indien keuzeschakelaar niet in stand NORMAAL
! of op aanvraag van WIZCON
!
	OR	WZC0B17	!puls einde bedrijf via WIZCON
	OR	WZC0B18	!puls einde bedrijf via schakelaar
	SET0	BDR0B00	!start bedrijf fasen 1 t/m 6
	SET0	BDR0B01	!bedrijfsfase 1
	SET0	BDR0B02	!bedrijfsfase 2
	SET0	BDR0B03	!bedrijfsfase 3
	SET0	BDR0B04	!bedrijfsfase 4
	SET0	BDR0B05	!bedrijfsfase 5
	SET0	BDR0B06	!bedrijfsfase 6
	SET0	BDR0B07	!einde fasetimer
	SET0	REG0B88	!aanloopfase 88
	FTCHC	00
	FTCHC	00
	FTCHC	00
	FTCHC	00
	STRD	DSP98_0	!display 98 eenheden
	STRD	DSP98_1	!display 98 tientallen
	STRD	DSP98_2	!display 98 honderdtallen
	STRD	DSP98_3	!display 98 duizendtallen
!
! overname setpoints fase tijden door display buffer
!
	AND	BDR0B01	!bedrijfsfase 1
	JFRF	L09450
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP01_0	!display 01 eenheden
	STRD	DSP01_1	!display 01 tientallen
	STRD	DSP01_2	!display 01 honderdtallen
L09450	STRD	DSP01_3	!display 01 duizendtallen

	ANDNT	BDR0B01	!bedrijfsfase 1
	JFRF	L09460
	FTCHD	STP01_0	!setpoint 01 eenheden
	FTCHD	STP01_1	!setpoint 01 tientallen
	FTCHD	STP01_2	!setpoint 01 honderdtallen
	FTCHD	STP01_3	!setpoint 01 duizendtallen
	STRD	DSP01_0	!display 01 eenheden
	STRD	DSP01_1	!display 01 tientallen
	STRD	DSP01_2	!display 01 honderdtallen
L09460	STRD	DSP01_3	!display 01 duizendtallen

	AND	BDR0B02	!bedrijfsfase 2
	JFRF	L09470
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP02_0	!display 02 eenheden
	STRD	DSP02_1	!display 02 tientallen
	STRD	DSP02_2	!display 02 honderdtallen
L09470	STRD	DSP02_3	!display 02 duizendtallen

	ANDNT	BDR0B02	!bedrijfsfase 2
	JFRF	L09480
	FTCHD	STP02_0	!setpoint 02 eenheden
	FTCHD	STP02_1	!setpoint 02 tientallen
	FTCHD	STP02_2	!setpoint 02 honderdtallen
	FTCHD	STP02_3	!setpoint 02 duizendtallen
	STRD	DSP02_0	!display 02 eenheden
	STRD	DSP02_1	!display 02 tientallen
	STRD	DSP02_2	!display 02 honderdtallen
L09480	STRD	DSP02_3	!display 02 duizendtallen

	AND	BDR0B03	!bedrijfsfase 3
	JFRF	L09490
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP03_0	!display 03 eenheden
	STRD	DSP03_1	!display 03 tientallen
	STRD	DSP03_2	!display 03 honderdtallen
L09490	STRD	DSP03_3	!display 03 duizendtallen

	ANDNT	BDR0B03	!bedrijfsfase 3
	JFRF	L09500
	FTCHD	STP03_0	!setpoint 03 eenheden
	FTCHD	STP03_1	!setpoint 03 tientallen
	FTCHD	STP03_2	!setpoint 03 honderdtallen
	FTCHD	STP03_3	!setpoint 03 duizendtallen
	STRD	DSP03_0	!display 03 eenheden
	STRD	DSP03_1	!display 03 tientallen
	STRD	DSP03_2	!display 03 honderdtallen
L09500	STRD	DSP03_3	!display 03 duizendtallen

	AND	BDR0B04	!bedrijfsfase 4
	JFRF	L09510
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP04_0	!display 04 eenheden
	STRD	DSP04_1	!display 04 tientallen
	STRD	DSP04_2	!display 04 honderdtallen
L09510	STRD	DSP04_3	!display 04 duizendtallen

	ANDNT	BDR0B04	!bedrijfsfase 4
	JFRF	L09520
	FTCHD	STP04_0	!setpoint 04 eenheden
	FTCHD	STP04_1	!setpoint 04 tientallen
	FTCHD	STP04_2	!setpoint 04 honderdtallen
	FTCHD	STP04_3	!setpoint 04 duizendtallen
	STRD	DSP04_0	!display 04 eenheden
	STRD	DSP04_1	!display 04 tientallen
	STRD	DSP04_2	!display 04 honderdtallen
L09520	STRD	DSP04_3	!display 04 duizendtallen

	AND	BDR0B05	!bedrijfsfase 5
	JFRF	L09530
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP05_0	!display 05 eenheden
	STRD	DSP05_1	!display 05 tientallen
	STRD	DSP05_2	!display 05 honderdtallen
L09530	STRD	DSP05_3	!display 05 duizendtallen

	ANDNT	BDR0B05	!bedrijfsfase 5
	JFRF	L09540
	FTCHD	STP05_0	!setpoint 05 eenheden
	FTCHD	STP05_1	!setpoint 05 tientallen
	FTCHD	STP05_2	!setpoint 05 honderdtallen
	FTCHD	STP05_3	!setpoint 05 duizendtallen
	STRD	DSP05_0	!display 05 eenheden
	STRD	DSP05_1	!display 05 tientallen
	STRD	DSP05_2	!display 05 honderdtallen
L09540	STRD	DSP05_3	!display 05 duizendtallen

	AND	BDR0B06	!bedrijfsfase 6
	JFRF	L09550
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP06_0	!display 06 eenheden
	STRD	DSP06_1	!display 06 tientallen
	STRD	DSP06_2	!display 06 honderdtallen
L09550	STRD	DSP06_3	!display 06 duizendtallen

	ANDNT	BDR0B06	!bedrijfsfase 6
	JFRF	L09560
	FTCHD	STP06_0	!setpoint 06 eenheden
	FTCHD	STP06_1	!setpoint 06 tientallen
	FTCHD	STP06_2	!setpoint 06 honderdtallen
	FTCHD	STP06_3	!setpoint 06 duizendtallen
	STRD	DSP06_0	!display 06 eenheden
	STRD	DSP06_1	!display 06 tientallen
	STRD	DSP06_2	!display 06 honderdtallen
L09560	STRD	DSP06_3	!display 06 duizendtallen
!
! besturing t.b.v. fase 7
!
	AND	BDR0B00	!start bedrijf fasen 1 t/m 6
	TRIG	BDR0T08	!triggerpuls
	EQL	BDR0B12	!startpuls wachttijd fase 7

	AND	BDR0B12	!startpuls wachttijd fase 7
	OR	BDR0B13	!min. puls
	FTCHC	00
	FTCHC	06
	STRD	BD0T00
	STRD	BD0T01
	SET0	BDR0B13	!min. puls

	AND	S_1SEC	!triggerpuls 1,0 sec.
	ANDNT	BDR0B14	!einde 8 uur (wachttijd) fase 7
	AND	BDR0B10	!bedrijfsmelding
	ANDNT	BDR0B13	!min. puls
	CNTD	BD0T00
	CNTD	BD0T01
	STRB	BDR0B13	!min. puls

	AND	BDR0B12	!startpuls wachttijd fase 7
	OR	BDR0B19	!fasetimer fase 7 (einde fase 7)
	TRIG	BDR0T09	!tr.puls laden wachttijd fase 7
	FTCHD	STP37_0	!setpoint 37 eenheden
	FTCHD	STP37_1	!setpoint 37 tientallen
	FTCHD	STP37_2	!setpoint 37 honderdtallen
	FTCHD	STP37_3	!setpoint 37 duizendtallen
	STRD	DSP37_0	!display 37 eenheden
	STRD	DSP37_1	!display 37 tientallen
	STRD	DSP37_2	!display 37 honderdtallen
	STRD	DSP37_3	!display 37 duizendtallen
	SET0	BDR0B14	!einde 8 uur (wachttijd) fase 7

	AND	BDR0B00	!start bedrijf fasen 1 t/m 6
	AND	BDR0B13	!min. puls
	ANDNT	BDR0B14	!einde 8 uur (wachttijd) fase 7
	CNTD	DSP37_0	!display 37 eenheden
	CNTD	DSP37_1	!display 37 tientallen
	CNTD	DSP37_2	!display 37 honderdtallen
	CNTD	DSP37_3	!display 37 duizendtallen
	STRB	BDR0B14	!einde 8 uur (wachttijd) fase 7

	AND	BDR0B02	!bedrijfsfase 2
	OR	BDR0B04	!bedrijfsfase 4
	OR	BDR0B06	!bedrijfsfase 6
	EQL	BDR0B15	!fase 2,4,6

	TRIG	BDR0T10	!tr.puls begin fasen 2,4,6
	EQL	BDR0B16	!puls fasebegin fasen 2,4,6

	AND	BDR0B14	!einde 8 uur (wachttijd) fase 7
	AND	BDR0B16	!puls fasebegin fasen 2,4,6
  SET1  FASE_7  !fase 7
	EQL	BDR0B18	!puls laden fasetimer fase 7

	AND	BDR0B18	!puls laden fasetimer fase 7
	FTCHD	STP07_0	!setpoint 07 eenheden
	FTCHD	STP07_1	!setpoint 07 tientallen
	FTCHD	STP07_2	!setpoint 07 honderdtallen
	FTCHD	STP07_3	!setpoint 07 duizendtallen
	STRD	DSP07_0	!display 07 eenheden
	STRD	DSP07_1	!display 07 tientallen
	STRD	DSP07_2	!display 07 honderdtallen
	STRD	DSP07_3	!display 07 duizendtallen
	SET0	BDR0B19	!fasetimer fase 7 (einde fase 7)

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND FASE_7  !fase 7
	AND	BDR0B10	!bedrijfsmelding
	CNTD	DSP07_0	!display 07 eenheden
	CNTD	DSP07_1	!display 07 tientallen
	CNTD	DSP07_2	!display 07 honderdtallen
	CNTD	DSP07_3	!display 07 duizendtallen
	STRB	BDR0B19	!fasetimer fase 7 (einde fase 7)

	AND	BDR0B19	!fasetimer fase 7 (einde fase 7)
  SET0  FASE_7  !fase 7
!
! vrijgave uitgangen bij handbedrijf en aktiveren
!
	ANDNT	REG0I04	!keuzeschak.regen. automatisch
	AND	REG0I06	!drukkn.aktiveren gekozen fase
	TRIG	BDR0T12	!triggerpuls
	EQL	BDR0B20	!puls drukknop aktiveren

	AND	REG0I04	!keuzeschak.regen. automatisch
	OR	BDR0B20	!puls drukknop aktiveren
	SET1	BDR0B21	!vrijgave uitgangen (aktiveren)

	ANDNT	REG0I04	!keuzeschak.regen. automatisch
	TRIG	BDR0T13	!triggerpuls
	EQL	BDR0B22	!puls handbedrijf

	ANDNT	REG0I04	!keuzeschak.regen. automatisch
	AND	REG0I05	!drukkn.doorstappen regeneratie
	TRIG	BDR0T14	!triggerpuls
	EQL	BDR0B23	!triggerpuls doorstappen

	AND	BDR0B22	!puls handbedrijf
	OR	BDR0B23	!triggerpuls doorstappen
	SET0	BDR0B21	!vrijgave uitgangen (aktiveren)

  ANDNT TIMER_61  !pauzetijd aansturing afsl. V12.1
  OR  PLCC1 !eerste PLC_cyclus hoog_signaal
	ORNT	BDR0B10	!bedrijfsmelding
	FTCHD	STP68_0	!setpoint 68 eenheden
	FTCHD	STP68_1	!setpoint 68 tientallen
	FTCHD	STP68_2	!setpoint 68 honderdtallen
	FTCHD	STP68_3	!setpoint 68 duizendtallen
	STRD	DSP68_0	!display 68 eenheden
	STRD	DSP68_1	!display 68 tientallen
	STRD	DSP68_2	!display 68 honderdtallen
	STRD	DSP68_3	!display 68 duizendtallen
  SET0  TIMER_62  !pulstijd aansturing afsl. V12.1

	AND	S_1MIN	!triggerpuls 1 min.
	AND	BDR0B10	!bedrijfsmelding
  AND TIMER_61  !pauzetijd aansturing afsl. V12.1
  ANDNT TIMER_62  !pulstijd aansturing afsl. V12.1
	CNTD	DSP68_0	!display 68 eenheden
	CNTD	DSP68_1	!display 68 tientallen
	CNTD	DSP68_2	!display 68 honderdtallen
	CNTD	DSP68_3	!display 68 duizendtallen
  STRB  TIMER_62  !pulstijd aansturing afsl. V12.1

  AND TIMER_62  !pulstijd aansturing afsl. V12.1
  OR  PLCC1 !eerste PLC_cyclus hoog_signaal
	ORNT	BDR0B10	!bedrijfsmelding
	FTCHD	STP67_0	!setpoint 67 eenheden
	FTCHD	STP67_1	!setpoint 67 tientallen
	FTCHD	STP67_2	!setpoint 67 honderdtallen
	FTCHD	STP67_3	!setpoint 67 duizendtallen
	STRD	DSP67_0	!display 67 eenheden
	STRD	DSP67_1	!display 67 tientallen
	STRD	DSP67_2	!display 67 honderdtallen
	STRD	DSP67_3	!display 67 duizendtallen
  SET0  TIMER_61  !pauzetijd aansturing afsl. V12.1

	AND	S_1MIN	!triggerpuls 1 min.
  ANDNT TIMER_62  !pulstijd aansturing afsl. V12.1
  ANDNT TIMER_61  !pauzetijd aansturing afsl. V12.1
	CNTD	DSP67_0	!display 67 eenheden
	CNTD	DSP67_1	!display 67 tientallen
	CNTD	DSP67_2	!display 67 honderdtallen
	CNTD	DSP67_3	!display 67 duizendtallen
  STRB  TIMER_61  !pauzetijd aansturing afsl. V12.1
	NOP	14
  AND PLCC1 !eerste PLC_cyclus hoog_signaal
	OR	REG0B39	!uurpuls
	FTCHC	00
	FTCHC	00
	FTCHC	06
	FTCHC	03
	STRD	RE0T00	!+
	STRD	RE0T01	!| uur timer
	STRD	RE0T02	!|
	STRD	RE0T03	!+
	SET0	REG0B39	!uurpuls

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B10	!bedrijfsmelding
	ANDNT	REG0B42	!regeneratieaanvraag
	ANDNT	REG0B39	!uurpuls
	CNTD	RE0T00	!+
	CNTD	RE0T01	!| uur timer
	CNTD	RE0T02	!|
	CNTD	RE0T03	!+
	STRB	REG0B39	!uurpuls

	AND	REG0B34	!regeneratiefase 33.1
  AND STAP_3  !stappen fase register
	TRIG	REG0T36	!triggerpuls
	EQL	REG0B40	!einde regeneratie

  AND PLCC1 !eerste PLC_cyclus hoog_signaal
	OR	REG0B40	!einde regeneratie
	FTCHD	STP35_0	!setpoint 35 eenheden
	FTCHD	STP35_1	!setpoint 35 tientallen
	FTCHD	STP35_2	!setpoint 35 honderdtallen
	FTCHD	STP35_3	!setpoint 35 duizendtallen
	STRD	DSP35_0	!display 35 eenheden
	STRD	DSP35_1	!display 35 tientallen
	STRD	DSP35_2	!display 35 honderdtallen
	STRD	DSP35_3	!display 35 duizendtallen
	SET0	REG0B41	!reg.aanvr. op tijdbasis

	AND	REG0B39	!uurpuls
	ANDNT	REG0B41	!reg.aanvr. op tijdbasis
	CNTD	DSP35_0	!display 35 eenheden
	CNTD	DSP35_1	!display 35 tientallen
	CNTD	DSP35_2	!display 35 honderdtallen
	CNTD	DSP35_3	!display 35 duizendtallen
	STRB	REG0B41	!reg.aanvr. op tijdbasis

  AND BDR0I01 !bedrijfskeuze schak. "STAND_BY"
	AND	REG0I08	!keuzeschakelaar CMF handmatig vullen
	ANDNT	ALM0B08	!een of meerdere afsl.gestoord
	ANDNT	VERGR02	!stuurlucht gestoord
	EQL	REG0B53	!handmatig vullen CMF

  AND BDR0I01 !bedrijfskeuze schak. "STAND_BY"
	AND	REG0I09	!keuzeschakelaar CMF handmatig ledigen
	ANDNT	ALM0B08	!een of meerdere afsl.gestoord
	ANDNT	VERGR02	!stuurlucht gestoord
	EQL	REG0B54	!handmatig ledigen CMF

	AND	REG0B09	!regeneratiefase 9
	OR	REG0B12	!regeneratiefase 12
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B26	!regeneratiefase 26
	OR	REG0B61	!regeneratie fase 61
	OR	REG0B64	!regeneratie fase 64
	EQL	REG0B55	!regeneratiefasen CMF vullen

	AND	REG0B08	!regeneratiefase 8
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B60	!regeneratie fase 60
	OR	REG0B63	!regeneratie fase 63
	EQL	REG0B56	!regeneratiefasen CMF ledigen

	AND	REG0B41	!reg.aanvr. op tijdbasis
	SET1	REG0B42	!regeneratieaanvraag

  ANDNT BDR0I03 !bedrijfskeuze schak. "MCS_400"
	AND	REG0B42	!regeneratieaanvraag
	AND	BDR0B10	!bedrijfsmelding
	SET1	REG0B43	!start spuien

	AND	REG0B43	!start spuien
	TRIG	REG0T35	!triggerpuls
  EQL REG0B44 !laadpuls spui_timer

  AND REG0B44 !laadpuls spui_timer
	FTCHD	STP36_0	!setpoint 36 eenheden
	FTCHD	STP36_1	!setpoint 36 tientallen
	FTCHD	STP36_2	!setpoint 36 honderdtallen
	FTCHD	STP36_3	!setpoint 36 duizendtallen
	STRD	DSP36_0	!display 36 eenheden
	STRD	DSP36_1	!display 36 tientallen
	STRD	DSP36_2	!display 36 honderdtallen
	STRD	DSP36_3	!display 36 duizendtallen
	SET0	REG0B45	!einde spuitijd

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	REG0B43	!start spuien
	AND	BDR0B10	!bedrijfsmelding
	ANDNT	REG0B45	!einde spuitijd
	CNTD	DSP36_0	!display 36 eenheden
	CNTD	DSP36_1	!display 36 tientallen
	CNTD	DSP36_2	!display 36 honderdtallen
	CNTD	DSP36_3	!display 36 duizendtallen
	STRB	REG0B45	!einde spuitijd

	AND	REG0B42	!regeneratieaanvraag
	ANDNT	REG0B45	!einde spuitijd
	AND	BDR0B10	!bedrijfsmelding
	OR	WZC0B15	!wizconcommando SPUIEN + KEUZESCHAK.=SUPE
	AND	BDR0B10	!bedrijfsmelding
	EQL	REG0B46	!openen commando V10.4

	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	SET0	REG0B43	!start spuien

	AND	ALM0I09	!nivo warme loog
	AND	ALM0I10	!nivo zoutzuur
	AND	ALM0I12	!nivo neuttank
	AND	ALM0I42	!nivo proceswater
	ANDNT	ALM0I39	!P10 therm. gestoord
	AND	BDR0I07	!P10 automatisch
	AND	REG0I07	!P11 paraat
	EQL	REG0B48	!regen.startvoorwaarden

	AND	REG0B48	!regen.startvoorwaarden
	AND	REG0B42	!regeneratieaanvraag
	EQL	REG0B47	!startvoorw.regen.fout

	AND	REG0B33	!regeneratiefase 33
	AND	VERGR39
	EQL	DUMP1

	AND	REG0B09	!regeneratiefase 9
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B61	!regeneratie fase 61
	OR	REG0B64	!regeneratie fase 64
	EQL	DUMP2

	AND	DUMP2
	AND	VERGR40
	EQL	DUMP3

	ANDNT	DUMP1
	ANDNT	DUMP3
	ANDNT	VERGR01
	ANDNT	VERGR02	!stuurlucht gestoord
	ANDNT	VERGR03	!stuurspanning gestoord
	ANDNT	ALM0B08	!een of meerdere afsl.gestoord
	ANDNT	VERGR09
	ANDNT	VERGR10
	ANDNT	VERGR37	!hoge druk alarm P10
	ANDNT	VERGR45	!lage flow alarm vuilproceswater
	ANDNT	VERGR46	!regeneratie cmf niet op tijd gevuld
	ANDNT	VERGR47	!regeneratie cmf niet op tijd geledigd
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	AND	BDR0B21	!vrijgave uitgangen (aktiveren)
  EQL R_VOORW !regeneratievoorw. OK

	AND	BDR0I00	!bedrijfskeuze schak. "REGENERATIE"
	AND	AKTIEF	!aktiveren bedrijfskeuze
	AND	REG0B48	!regen.startvoorwaarden
	OR	WZC0B06	!commando REGENERATIE vanuit wizcon
	SET1	REG0B00	!start regen. fasen 8 t/m 33.1

	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	TRIG	TRGSTART	!triggerpuls start fasen 8 t/m 32
	ANDNT	WZC0B06	!commando REGENERATIE vanuit wizcon
	ANDNT	LOOGNIET	!schakelaar loog fasen (1=) overslaan
	SET1	ZUURLOOG	!regeneratie met zuur en loog

	ANDNT	REG0B32	!regeneratiefase 32
	FTCHD	STP38_0	!setpoint 38 eenheden
	FTCHD	STP38_1	!setpoint 38 tientallen
	FTCHD	STP38_2	!setpoint 38 honderdtallen
	FTCHD	STP38_3	!setpoint 38 duizendtallen
	STRD	DSP38_0	!display 38 eenheden
	STRD	DSP38_1	!display 38 tientallen
	STRD	DSP38_2	!display 38 honderdtallen
	STRD	DSP38_3	!display 38 duizendtallen
	SET0	REG0B51	!vertr. controle spoelwater fase 32

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	REG0B32	!regeneratiefase 32
  AND R_VOORW !regeneratievoorw. OK
	ANDNT	REG0B51	!vertr. controle spoelwater fase 32
	CNTD	DSP38_0	!display 38 eenheden
	CNTD	DSP38_1	!display 38 tientallen
	CNTD	DSP38_2	!display 38 honderdtallen
	CNTD	DSP38_3	!display 38 duizendtallen
	STRB	REG0B51	!vertr. controle spoelwater fase 32

	ANDNT	REG0B33	!regeneratiefase 33
	FTCHD	STP39_0	!setpoint 39 eenheden
	FTCHD	STP39_1	!setpoint 39 tientallen
	FTCHD	STP39_2	!setpoint 39 honderdtallen
	FTCHD	STP39_3	!setpoint 39 duizendtallen
	STRD	DSP39_0	!display 39 eenheden
	STRD	DSP39_1	!display 39 tientallen
	STRD	DSP39_2	!display 39 honderdtallen
	STRD	DSP39_3	!display 39 duizendtallen
	SET0	REG0B52	!vertr. controle proceswater fase 33

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	REG0B33	!regeneratiefase 33
  AND R_VOORW !regeneratievoorw. OK
	ANDNT	REG0B52	!vertr. controle proceswater fase 33
	CNTD	DSP39_0	!display 39 eenheden
	CNTD	DSP39_1	!display 39 tientallen
	CNTD	DSP39_2	!display 39 honderdtallen
	CNTD	DSP39_3	!display 39 duizendtallen
	STRB	REG0B52	!vertr. controle proceswater fase 33

	AND	REG0B52	!vertr. controle proceswater fase 33
	AND	REG0B33	!regeneratiefase 33
	ANDNT	ALM0I44	!slechte geleidb.h. reinwater
	EQL	REG0B49	!geleidb.h. QIA1 ok

	AND	REG0B51	!vertr. controle spoelwater fase 32
	AND	REG0B32	!regeneratiefase 32
	ANDNT	ALM0I06	!slechte geleidb.h. spoelfase 32
	EQL	REG0B50	!geleidb.h. QIA2 ok

	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	ANDNT	REG0I04	!keuzeschak.regen. automatisch
	AND	REG0I05	!drukkn.doorstappen regeneratie
	TRIG	REG0T00	!doorstap triggerpuls
	EQL	REG0B37	!hand doorstap (triggerpuls)

	ANDNT	REG0I10	!detectieschakelaar CMF gevuld
	FTCHC	00
	FTCHC	03
	STRD	RE1T00	!+
	STRD	RE1T01	!+ tijdvertr. detectieschakelaar CMF gevu
	SET0	REG0B58	!tijdvertr. detectieschakelaar CMF gevuld

	AND	REG0I10	!detectieschakelaar CMF gevuld
	AND	S_1SEC	!triggerpuls 1,0 sec.
	ANDNT	REG0B58	!tijdvertr. detectieschakelaar CMF gevuld
	CNTD	RE1T00	!+
	CNTD	RE1T01	!+ tijdvertr. detectieschakelaar CMF gevu
	STRB	REG0B58	!tijdvertr. detectieschakelaar CMF gevuld

	AND	REG0B55	!regeneratiefasen CMF vullen
	AND	REG0B58	!tijdvertr. detectieschakelaar CMF gevuld
	EQL	REG0B57	!doorstap reg.fase CMF gevuld

	OR	REG0B35	!einde fasetimer
	OR	REG0B37	!hand doorstap (triggerpuls)
	OR	REG0B49	!geleidb.h. QIA1 ok
	OR	REG0B50	!geleidb.h. QIA2 ok
	OR	REG0B57	!doorstap reg.fase CMF gevuld
  EQL STAP_3  !stappen fase register

	AND	REG0B34	!regeneratiefase 33.1
  AND STAP_3  !stappen fase register
	SET0	REG0B34	!regeneratiefase 33.1
	SET0	REG0B00	!start regen. fasen 8 t/m 33.1
	SET0	REG0B42	!regeneratieaanvraag
	SET0	ZUURLOOG	!regeneratie met zuur en loog

	AND	REG0B33	!regeneratiefase 33
  AND STAP_3  !stappen fase register
	SET1	REG0B34	!regeneratiefase 33.1
	SET0	REG0B33	!regeneratiefase 33

	AND	REG0B32	!regeneratiefase 32
  AND STAP_3  !stappen fase register
	SET1	REG0B33	!regeneratiefase 33
	SET0	REG0B32	!regeneratiefase 32

	AND	REG0B31	!regeneratiefase 31
  AND STAP_3  !stappen fase register
	SET1	REG0B32	!regeneratiefase 32
	SET0	REG0B31	!regeneratiefase 31

	AND	REG0B30	!regeneratiefase 30
  AND STAP_3  !stappen fase register
	SET1	REG0B31	!regeneratiefase 31
	SET0	REG0B30	!regeneratiefase 30

	AND	REG0B29	!regeneratiefase 29
  AND STAP_3  !stappen fase register
	SET1	REG0B30	!regeneratiefase 30
	SET0	REG0B29	!regeneratiefase 29

	AND	REG0B28	!regeneratiefase 28
  AND STAP_3  !stappen fase register
	SET1	REG0B29	!regeneratiefase 29
	SET0	REG0B28	!regeneratiefase 28

	AND	REG0B27	!regeneratiefase 27
  AND STAP_3  !stappen fase register
	SET1	REG0B28	!regeneratiefase 28
	SET0	REG0B27	!regeneratiefase 27

	AND	REG0B26	!regeneratiefase 26
  AND STAP_3  !stappen fase register
	SET1	REG0B27	!regeneratiefase 27
	SET0	REG0B26	!regeneratiefase 26

	AND	REG0B25	!regeneratiefase 25
  AND STAP_3  !stappen fase register
	SET1	REG0B26	!regeneratiefase 26
	SET0	REG0B25	!regeneratiefase 25

	AND	REG0B24	!regeneratiefase 24
  AND STAP_3  !stappen fase register
	SET1	REG0B25	!regeneratiefase 25
	SET0	REG0B24	!regeneratiefase 24

	AND	REG0B23	!regeneratiefase 23
  AND STAP_3  !stappen fase register
	SET1	REG0B24	!regeneratiefase 24
	SET0	REG0B23	!regeneratiefase 23

	AND	REG0B22	!regeneratiefase 22
  AND STAP_3  !stappen fase register
	SET1	REG0B23	!regeneratiefase 23
	SET0	REG0B22	!regeneratiefase 22

	AND	REG0B21	!regeneratiefase 21
  AND STAP_3  !stappen fase register
	SET1	REG0B22	!regeneratiefase 22
	SET0	REG0B21	!regeneratiefase 21

	AND	REG0B20	!regeneratiefase 20
  AND STAP_3  !stappen fase register
	SET1	REG0B21	!regeneratiefase 21
	SET0	REG0B20	!regeneratiefase 20

	AND	REG0B19	!regeneratiefase 19
  AND STAP_3  !stappen fase register
	SET1	REG0B20	!regeneratiefase 20
	SET0	REG0B19	!regeneratiefase 19

	AND	REG0B18	!regeneratiefase 18
  AND STAP_3  !stappen fase register
	SET1	REG0B19	!regeneratiefase 19
	SET0	REG0B18	!regeneratiefase 18

	AND	REG0B17	!regeneratiefase 17
  AND STAP_3  !stappen fase register
	SET1	REG0B18	!regeneratiefase 18
	SET0	REG0B17	!regeneratiefase 17

	AND	REG0B16	!regeneratiefase 16
  AND STAP_3  !stappen fase register
	SET1	REG0B17	!regeneratiefase 17
	SET0	REG0B16	!regeneratiefase 16

	AND	REG0B15	!regeneratiefase 15
  AND STAP_3  !stappen fase register
	SET1	REG0B16	!regeneratiefase 16
	SET0	REG0B15	!regeneratiefase 15

	AND	REG0B14	!regeneratiefase 14
  AND STAP_3  !stappen fase register
	SET1	REG0B15	!regeneratiefase 15
	SET0	REG0B14	!regeneratiefase 14

	AND	REG0B13	!regeneratiefase 13
  AND STAP_3  !stappen fase register
	SET1	REG0B14	!regeneratiefase 14
	SET0	REG0B13	!regeneratiefase 13

	AND	REG0B12	!regeneratiefase 12
  AND STAP_3  !stappen fase register
	SET1	REG0B13	!regeneratiefase 13
	SET0	REG0B12	!regeneratiefase 12

	AND	REG0B11	!regeneratiefase 11
  AND STAP_3  !stappen fase register
	SET1	REG0B12	!regeneratiefase 12
	SET0	REG0B11	!regeneratiefase 11

	AND	REG0B65	!regeneratie fase 65
  AND STAP_3  !stappen fase register
	ANDNT	ZUURLOOG	!regeneratie met zuur en loog
	SET1	REG0B21	!regeneratiefase 21
	SET0	REG0B65	!regeneratie fase 65

	AND	REG0B65	!regeneratie fase 65
  AND STAP_3  !stappen fase register
	AND	ZUURLOOG	!regeneratie met zuur en loog
	SET1	REG0B11	!regeneratiefase 11
	SET0	REG0B65	!regeneratie fase 65

	AND	REG0B64	!regeneratie fase 64
  AND STAP_3  !stappen fase register
	SET1	REG0B65	!regeneratie fase 65
	SET0	REG0B64	!regeneratie fase 64

	AND	REG0B63	!regeneratie fase 63
  AND STAP_3  !stappen fase register
	SET1	REG0B64	!regeneratie fase 64
	SET0	REG0B63	!regeneratie fase 63

	AND	REG0B62	!regeneratie fase 62
  AND STAP_3  !stappen fase register
	SET1	REG0B63	!regeneratie fase 63
	SET0	REG0B62	!regeneratie fase 62

	AND	REG0B61	!regeneratie fase 61
  AND STAP_3  !stappen fase register
	SET1	REG0B62	!regeneratie fase 62
	SET0	REG0B61	!regeneratie fase 61

	AND	REG0B60	!regeneratie fase 60
  AND STAP_3  !stappen fase register
	SET1	REG0B61	!regeneratie fase 61
	SET0	REG0B60	!regeneratie fase 60

	AND	REG0B10	!regeneratiefase 10
  AND STAP_3  !stappen fase register
	SET1	REG0B60	!regeneratie fase 60
	SET0	REG0B10	!regeneratiefase 10

	AND	REG0B09	!regeneratiefase 9
  AND STAP_3  !stappen fase register
	SET1	REG0B10	!regeneratiefase 10
	SET0	REG0B09	!regeneratiefase 9

	AND	REG0B08	!regeneratiefase 8
  AND STAP_3  !stappen fase register
	SET1	REG0B09	!regeneratiefase 9
	SET0	REG0B08	!regeneratiefase 8

	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	TRIG	REG0T08	!triggerpuls laden timer fase 8
	EQL	REG0B36	!startpuls regen. fasen 8 t/m 33.1

	AND	REG0B36	!startpuls regen. fasen 8 t/m 33.1
	SET1	REG0B08	!regeneratiefase 8

	AND	REG0B36	!startpuls regen. fasen 8 t/m 33.1
	JFRF	L10075
	FTCHD	STP08_0	!setpoint 08 eenheden
	FTCHD	STP08_1	!setpoint 08 tientallen
	FTCHD	STP08_2	!setpoint 08 honderdtallen
L10075	FTCHD	STP08_3	!setpoint 08 duizendtallen

	ANDNT	REG0B08	!regeneratiefase 8
	TRIG	REG0T09	!triggerpuls laden timer fase 9
	JFRF	L10082
	FTCHD	STP09_0	!setpoint 09 eenheden
	FTCHD	STP09_1	!setpoint 09 tientallen
	FTCHD	STP09_2	!setpoint 09 honderdtallen
L10082	FTCHD	STP09_3	!setpoint 09 duizendtallen

	ANDNT	REG0B09	!regeneratiefase 9
	TRIG	REG0T10	!triggerpuls laden timer fase 10
	JFRF	L10089
	FTCHD	STP10_0	!setpoint 10 eenheden
	FTCHD	STP10_1	!setpoint 10 tientallen
	FTCHD	STP10_2	!setpoint 10 honderdtallen
L10089	FTCHD	STP10_3	!setpoint 10 duizendtallen

	ANDNT	REG0B10	!regeneratiefase 10
	TRIG	REG0T11	!triggerpuls laden timer fase 11
	JFRF	L10096
	FTCHD	STP11_0	!setpoint 11 eenheden
	FTCHD	STP11_1	!setpoint 11 tientallen
	FTCHD	STP11_2	!setpoint 11 honderdtallen
L10096	FTCHD	STP11_3	!setpoint 11 duizendtallen

	ANDNT	REG0B11	!regeneratiefase 11
	TRIG	REG0T12	!triggerpuls laden timer fase 12
	JFRF	L10103
	FTCHD	STP12_0	!setpoint 12 eenheden
	FTCHD	STP12_1	!setpoint 12 tientallen
	FTCHD	STP12_2	!setpoint 12 honderdtallen
L10103	FTCHD	STP12_3	!setpoint 12 duizendtallen

	ANDNT	REG0B12	!regeneratiefase 12
	TRIG	REG0T13	!triggerpuls laden timer fase 13
	JFRF	L10110
	FTCHD	STP13_0	!setpoint 13 eenheden
	FTCHD	STP13_1	!setpoint 13 tientallen
	FTCHD	STP13_2	!setpoint 13 honderdtallen
L10110	FTCHD	STP13_3	!setpoint 13 duizendtallen

	ANDNT	REG0B13	!regeneratiefase 13
	TRIG	REG0T14	!triggerpuls laden timer fase 14
	JFRF	L10117
	FTCHD	STP14_0	!setpoint 14 eenheden
	FTCHD	STP14_1	!setpoint 14 tientallen
	FTCHD	STP14_2	!setpoint 14 honderdtallen
L10117	FTCHD	STP14_3	!setpoint 14 duizendtallen

	ANDNT	REG0B14	!regeneratiefase 14
	TRIG	REG0T15	!triggerpuls laden timer fase 15
	JFRF	L10124
	FTCHD	STP15_0	!setpoint 15 eenheden
	FTCHD	STP15_1	!setpoint 15 tientallen
	FTCHD	STP15_2	!setpoint 15 honderdtallen
L10124	FTCHD	STP15_3	!setpoint 15 duizendtallen

	ANDNT	REG0B15	!regeneratiefase 15
	TRIG	REG0T16	!triggerpuls laden timer fase 16
	JFRF	L10131
	FTCHD	STP16_0	!setpoint 16 eenheden
	FTCHD	STP16_1	!setpoint 16 tientallen
	FTCHD	STP16_2	!setpoint 16 honderdtallen
L10131	FTCHD	STP16_3	!setpoint 16 duizendtallen

	ANDNT	REG0B16	!regeneratiefase 16
	TRIG	REG0T17	!triggerpuls laden timer fase 17
	JFRF	L10138
	FTCHD	STP17_0	!setpoint 17 eenheden
	FTCHD	STP17_1	!setpoint 17 tientallen
	FTCHD	STP17_2	!setpoint 17 honderdtallen
L10138	FTCHD	STP17_3	!setpoint 17 duizendtallen

	ANDNT	REG0B17	!regeneratiefase 17
	TRIG	REG0T18	!triggerpuls laden timer fase 18
	JFRF	L10145
	FTCHD	STP18_0	!setpoint 18 eenheden
	FTCHD	STP18_1	!setpoint 18 tientallen
	FTCHD	STP18_2	!setpoint 18 honderdtallen
L10145	FTCHD	STP18_3	!setpoint 18 duizendtallen

	ANDNT	REG0B18	!regeneratiefase 18
	TRIG	REG0T19	!triggerpuls laden timer fase 19
	JFRF	L10152
	FTCHD	STP19_0	!setpoint 19 eenheden
	FTCHD	STP19_1	!setpoint 19 tientallen
	FTCHD	STP19_2	!setpoint 19 honderdtallen
L10152	FTCHD	STP19_3	!setpoint 19 duizendtallen

	ANDNT	REG0B19	!regeneratiefase 19
	TRIG	REG0T20	!triggerpuls laden timer fase 20
	JFRF	L10159
	FTCHD	STP20_0	!setpoint 20 eenheden
	FTCHD	STP20_1	!setpoint 20 tientallen
	FTCHD	STP20_2	!setpoint 20 honderdtallen
L10159	FTCHD	STP20_3	!setpoint 20 duizendtallen

	ANDNT	REG0B20	!regeneratiefase 20
	TRIG	REG0T21	!triggerpuls laden timer fase 21
	JFRF	L10166
	FTCHD	STP21_0	!setpoint 21 eenheden
	FTCHD	STP21_1	!setpoint 21 tientallen
	FTCHD	STP21_2	!setpoint 21 honderdtallen
L10166	FTCHD	STP21_3	!setpoint 21 duizendtallen

	ANDNT	REG0B21	!regeneratiefase 21
	TRIG	REG0T22	!triggerpuls laden timer fase 22
	JFRF	L10173
	FTCHD	STP22_0	!setpoint 22 eenheden
	FTCHD	STP22_1	!setpoint 22 tientallen
	FTCHD	STP22_2	!setpoint 22 honderdtallen
L10173	FTCHD	STP22_3	!setpoint 22 duizendtallen

	ANDNT	REG0B22	!regeneratiefase 22
	TRIG	REG0T23	!triggerpuls laden timer fase 23
	JFRF	L10180
	FTCHD	STP23_0	!setpoint 23 eenheden
	FTCHD	STP23_1	!setpoint 23 tientallen
	FTCHD	STP23_2	!setpoint 23 honderdtallen
L10180	FTCHD	STP23_3	!setpoint 23 duizendtallen

	ANDNT	REG0B23	!regeneratiefase 23
	TRIG	REG0T24	!triggerpuls laden timer fase 24
	JFRF	L10187
	FTCHD	STP24_0	!setpoint 24 eenheden
	FTCHD	STP24_1	!setpoint 24 tientallen
	FTCHD	STP24_2	!setpoint 24 honderdtallen
L10187	FTCHD	STP24_3	!setpoint 24 duizendtallen

	ANDNT	REG0B24	!regeneratiefase 24
	TRIG	REG0T25	!triggerpuls laden timer fase 25
	JFRF	L10194
	FTCHD	STP25_0	!setpoint 25 eenheden
	FTCHD	STP25_1	!setpoint 25 tientallen
	FTCHD	STP25_2	!setpoint 25 honderdtallen
L10194	FTCHD	STP25_3	!setpoint 25 duizendtallen

	ANDNT	REG0B25	!regeneratiefase 25
	TRIG	REG0T26	!triggerpuls laden timer fase 26
	JFRF	L10201
	FTCHD	STP26_0	!setpoint 26 eenheden
	FTCHD	STP26_1	!setpoint 26 tientallen
	FTCHD	STP26_2	!setpoint 26 honderdtallen
L10201	FTCHD	STP26_3	!setpoint 26 duizendtallen

	ANDNT	REG0B26	!regeneratiefase 26
	TRIG	REG0T27	!triggerpuls laden timer fase 27
	JFRF	L10208
	FTCHD	STP27_0	!setpoint 27 eenheden
	FTCHD	STP27_1	!setpoint 27 tientallen
	FTCHD	STP27_2	!setpoint 27 honderdtallen
L10208	FTCHD	STP27_3	!setpoint 27 duizendtallen

	ANDNT	REG0B27	!regeneratiefase 27
	TRIG	REG0T28	!triggerpuls laden timer fase 28
	JFRF	L10215
	FTCHD	STP28_0	!setpoint 28 eenheden
	FTCHD	STP28_1	!setpoint 28 tientallen
	FTCHD	STP28_2	!setpoint 28 honderdtallen
L10215	FTCHD	STP28_3	!setpoint 28 duizendtallen

	ANDNT	REG0B28	!regeneratiefase 28
	TRIG	REG0T29	!triggerpuls laden timer fase 29
	JFRF	L10222
	FTCHD	STP29_0	!setpoint 29 eenheden
	FTCHD	STP29_1	!setpoint 29 tientallen
	FTCHD	STP29_2	!setpoint 29 honderdtallen
L10222	FTCHD	STP29_3	!setpoint 29 duizendtallen

	ANDNT	REG0B29	!regeneratiefase 29
	TRIG	REG0T30	!triggerpuls laden timer fase 30
	JFRF	L10229
	FTCHD	STP30_0	!setpoint 30 eenheden
	FTCHD	STP30_1	!setpoint 30 tientallen
	FTCHD	STP30_2	!setpoint 30 honderdtallen
L10229	FTCHD	STP30_3	!setpoint 30 duizendtallen

	ANDNT	REG0B30	!regeneratiefase 30
	TRIG	REG0T31	!triggerpuls laden timer fase 31
	JFRF	L10236
	FTCHD	STP31_0	!setpoint 31 eenheden
	FTCHD	STP31_1	!setpoint 31 tientallen
	FTCHD	STP31_2	!setpoint 31 honderdtallen
L10236	FTCHD	STP31_3	!setpoint 31 duizendtallen

	ANDNT	REG0B31	!regeneratiefase 31
	TRIG	REG0T32	!triggerpuls laden timer fase 32
	JFRF	L10243
	FTCHD	STP32_0	!setpoint 32 eenheden
	FTCHD	STP32_1	!setpoint 32 tientallen
	FTCHD	STP32_2	!setpoint 32 honderdtallen
L10243	FTCHD	STP32_3	!setpoint 32 duizendtallen

	ANDNT	REG0B32	!regeneratiefase 32
	TRIG	REG0T33	!triggerpuls laden timer fase 33
	JFRF	L10250
	FTCHD	STP33_0	!setpoint 33 eenheden
	FTCHD	STP33_1	!setpoint 33 tientallen
	FTCHD	STP33_2	!setpoint 33 honderdtallen
L10250	FTCHD	STP33_3	!setpoint 33 duizendtallen

	ANDNT	REG0B33	!regeneratiefase 33
	TRIG	REG0T34	!triggerpuls laden timer fase 33.1
	JFRF	L10257
	FTCHD	STP34_0	!setpoint 34 eenheden
	FTCHD	STP34_1	!setpoint 34 tientallen
	FTCHD	STP34_2	!setpoint 34 honderdtallen
L10257	FTCHD	STP34_3	!setpoint 34 duizendtallen

	ANDNT	REG0B60	!regeneratie fase 60
	TRIG	REG0T60	!triggerpuls laden timer fase 60
	JFRF	L10264
	FTCHD	STP60_0	!setpoint 60 eenheden
	FTCHD	STP60_1	!setpoint 60 tientallen
	FTCHD	STP60_2	!setpoint 60 honderdtallen
L10264	FTCHD	STP60_3	!setpoint 60 duizendtallen

	ANDNT	REG0B61	!regeneratie fase 61
	TRIG	REG0T61	!triggerpuls laden timer fase 61
	JFRF	L10271
	FTCHD	STP61_0	!setpoint 61 eenheden
	FTCHD	STP61_1	!setpoint 61 tientallen
	FTCHD	STP61_2	!setpoint 61 honderdtallen
L10271	FTCHD	STP61_3	!setpoint 61 duizendtallen

	ANDNT	REG0B62	!regeneratie fase 62
	TRIG	REG0T62	!triggerpuls laden timer fase 62
	JFRF	L10278
	FTCHD	STP62_0	!setpoint 62 eenheden
	FTCHD	STP62_1	!setpoint 62 tientallen
	FTCHD	STP62_2	!setpoint 62 honderdtallen
L10278	FTCHD	STP62_3	!setpoint 62 duizendtallen

	ANDNT	REG0B63	!regeneratie fase 63
	TRIG	REG0T63	!triggerpuls laden timer fase 63
	JFRF	L10285
	FTCHD	STP63_0	!setpoint 63 eenheden
	FTCHD	STP63_1	!setpoint 63 tientallen
	FTCHD	STP63_2	!setpoint 63 honderdtallen
L10285	FTCHD	STP63_3	!setpoint 63 duizendtallen

	ANDNT	REG0B64	!regeneratie fase 64
	TRIG	REG0T64	!triggerpuls laden timer fase 64
	JFRF	L10292
	FTCHD	STP64_0	!setpoint 64 eenheden
	FTCHD	STP64_1	!setpoint 64 tientallen
	FTCHD	STP64_2	!setpoint 64 honderdtallen
L10292	FTCHD	STP64_3	!setpoint 64 duizendtallen

	ANDNT	REG0B65	!regeneratie fase 65
	TRIG	REG0T65	!triggerpuls laden timer fase 65
	JFRF	L10299
	FTCHD	STP65_0	!setpoint 65 eenheden
	FTCHD	STP65_1	!setpoint 65 tientallen
	FTCHD	STP65_2	!setpoint 65 honderdtallen
L10299	FTCHD	STP65_3	!setpoint 65 duizendtallen

  AND STAP_3  !stappen fase register
	OR	REG0B36	!startpuls regen. fasen 8 t/m 33.1
	STRD	DSP98_0	!display 98 eenheden
	STRD	DSP98_1	!display 98 tientallen
	STRD	DSP98_2	!display 98 honderdtallen
	STRD	DSP98_3	!display 98 duizendtallen
	SET0	REG0B35	!einde fasetimer

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	REG0I04	!keuzeschak.regen. automatisch
  AND R_VOORW !regeneratievoorw. OK
	ANDNT	REG0B35	!einde fasetimer
	CNTD	DSP98_0	!display 98 eenheden
	CNTD	DSP98_1	!display 98 tientallen
	CNTD	DSP98_2	!display 98 honderdtallen
	CNTD	DSP98_3	!display 98 duizendtallen
	STRB	REG0B35	!einde fasetimer

	AND	REG0B55	!regeneratiefasen CMF vullen
	AND	REG0B35	!einde fasetimer
	ANDNT	REG0I10	!detectieschakelaar CMF gevuld
	EQL	ALARM46	!regeneratie cmf niet op tijd gevuld
	SET0	REG0B35	!einde fasetimer

	AND	REG0B56	!regeneratiefasen CMF ledigen
	AND	REG0B35	!einde fasetimer
	AND	REG0I11	!detectieschakelaar CMF geledigd
	EQL	ALARM47	!regeneratie cmf niet op tijd geledigd
	SET0	REG0B35	!einde fasetimer

	AND	REG0B08	!regeneratiefase 8
	JFRF	L10335
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP08_0	!display 08 eenheden
	STRD	DSP08_1	!display 08 tientallen
	STRD	DSP08_2	!display 08 honderdtallen
L10335	STRD	DSP08_3	!display 08 duizendtallen

	ANDNT	REG0B08	!regeneratiefase 8
	JFRF	L10345
	FTCHD	STP08_0	!setpoint 08 eenheden
	FTCHD	STP08_1	!setpoint 08 tientallen
	FTCHD	STP08_2	!setpoint 08 honderdtallen
	FTCHD	STP08_3	!setpoint 08 duizendtallen
	STRD	DSP08_0	!display 08 eenheden
	STRD	DSP08_1	!display 08 tientallen
	STRD	DSP08_2	!display 08 honderdtallen
L10345	STRD	DSP08_3	!display 08 duizendtallen

	AND	REG0B09	!regeneratiefase 9
	JFRF	L10355
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP09_0	!display 09 eenheden
	STRD	DSP09_1	!display 09 tientallen
	STRD	DSP09_2	!display 09 honderdtallen
L10355	STRD	DSP09_3	!display 09 duizendtallen

	ANDNT	REG0B09	!regeneratiefase 9
	JFRF	L10365
	FTCHD	STP09_0	!setpoint 09 eenheden
	FTCHD	STP09_1	!setpoint 09 tientallen
	FTCHD	STP09_2	!setpoint 09 honderdtallen
	FTCHD	STP09_3	!setpoint 09 duizendtallen
	STRD	DSP09_0	!display 09 eenheden
	STRD	DSP09_1	!display 09 tientallen
	STRD	DSP09_2	!display 09 honderdtallen
L10365	STRD	DSP09_3	!display 09 duizendtallen

	AND	REG0B10	!regeneratiefase 10
	JFRF	L10375
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP10_0	!display 10 eenheden
	STRD	DSP10_1	!display 10 tientallen
	STRD	DSP10_2	!display 10 honderdtallen
L10375	STRD	DSP10_3	!display 10 duizendtallen

	ANDNT	REG0B10	!regeneratiefase 10
	JFRF	L10385
	FTCHD	STP10_0	!setpoint 10 eenheden
	FTCHD	STP10_1	!setpoint 10 tientallen
	FTCHD	STP10_2	!setpoint 10 honderdtallen
	FTCHD	STP10_3	!setpoint 10 duizendtallen
	STRD	DSP10_0	!display 10 eenheden
	STRD	DSP10_1	!display 10 tientallen
	STRD	DSP10_2	!display 10 honderdtallen
L10385	STRD	DSP10_3	!display 10 duizendtallen

	AND	REG0B11	!regeneratiefase 11
	JFRF	L10395
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP11_0	!display 11 eenheden
	STRD	DSP11_1	!display 11 tientallen
	STRD	DSP11_2	!display 11 honderdtallen
L10395	STRD	DSP11_3	!display 11 duizendtallen

	ANDNT	REG0B11	!regeneratiefase 11
	JFRF	L10405
	FTCHD	STP11_0	!setpoint 11 eenheden
	FTCHD	STP11_1	!setpoint 11 tientallen
	FTCHD	STP11_2	!setpoint 11 honderdtallen
	FTCHD	STP11_3	!setpoint 11 duizendtallen
	STRD	DSP11_0	!display 11 eenheden
	STRD	DSP11_1	!display 11 tientallen
	STRD	DSP11_2	!display 11 honderdtallen
L10405	STRD	DSP11_3	!display 11 duizendtallen

	AND	REG0B12	!regeneratiefase 12
	JFRF	L10415
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP12_0	!display 12 eenheden
	STRD	DSP12_1	!display 12 tientallen
	STRD	DSP12_2	!display 12 honderdtallen
L10415	STRD	DSP12_3	!display 12 duizendtallen

	ANDNT	REG0B12	!regeneratiefase 12
	JFRF	L10425
	FTCHD	STP12_0	!setpoint 12 eenheden
	FTCHD	STP12_1	!setpoint 12 tientallen
	FTCHD	STP12_2	!setpoint 12 honderdtallen
	FTCHD	STP12_3	!setpoint 12 duizendtallen
	STRD	DSP12_0	!display 12 eenheden
	STRD	DSP12_1	!display 12 tientallen
	STRD	DSP12_2	!display 12 honderdtallen
L10425	STRD	DSP12_3	!display 12 duizendtallen

	AND	REG0B13	!regeneratiefase 13
	JFRF	L10435
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP13_0	!display 13 eenheden
	STRD	DSP13_1	!display 13 tientallen
	STRD	DSP13_2	!display 13 honderdtallen
L10435	STRD	DSP13_3	!display 13 duizendtallen

	ANDNT	REG0B13	!regeneratiefase 13
	JFRF	L10445
	FTCHD	STP13_0	!setpoint 13 eenheden
	FTCHD	STP13_1	!setpoint 13 tientallen
	FTCHD	STP13_2	!setpoint 13 honderdtallen
	FTCHD	STP13_3	!setpoint 13 duizendtallen
	STRD	DSP13_0	!display 13 eenheden
	STRD	DSP13_1	!display 13 tientallen
	STRD	DSP13_2	!display 13 honderdtallen
L10445	STRD	DSP13_3	!display 13 duizendtallen

	AND	REG0B14	!regeneratiefase 14
	JFRF	L10455
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP14_0	!display 14 eenheden
	STRD	DSP14_1	!display 14 tientallen
	STRD	DSP14_2	!display 14 honderdtallen
L10455	STRD	DSP14_3	!display 14 duizendtallen

	ANDNT	REG0B14	!regeneratiefase 14
	JFRF	L10465
	FTCHD	STP14_0	!setpoint 14 eenheden
	FTCHD	STP14_1	!setpoint 14 tientallen
	FTCHD	STP14_2	!setpoint 14 honderdtallen
	FTCHD	STP14_3	!setpoint 14 duizendtallen
	STRD	DSP14_0	!display 14 eenheden
	STRD	DSP14_1	!display 14 tientallen
	STRD	DSP14_2	!display 14 honderdtallen
L10465	STRD	DSP14_3	!display 14 duizendtallen

	AND	REG0B15	!regeneratiefase 15
	JFRF	L10475
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP15_0	!display 15 eenheden
	STRD	DSP15_1	!display 15 tientallen
	STRD	DSP15_2	!display 15 honderdtallen
L10475	STRD	DSP15_3	!display 15 duizendtallen

	ANDNT	REG0B15	!regeneratiefase 15
	JFRF	L10485
	FTCHD	STP15_0	!setpoint 15 eenheden
	FTCHD	STP15_1	!setpoint 15 tientallen
	FTCHD	STP15_2	!setpoint 15 honderdtallen
	FTCHD	STP15_3	!setpoint 15 duizendtallen
	STRD	DSP15_0	!display 15 eenheden
	STRD	DSP15_1	!display 15 tientallen
	STRD	DSP15_2	!display 15 honderdtallen
L10485	STRD	DSP15_3	!display 15 duizendtallen

	AND	REG0B16	!regeneratiefase 16
	JFRF	L10495
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP16_0	!display 16 eenheden
	STRD	DSP16_1	!display 16 tientallen
	STRD	DSP16_2	!display 16 honderdtallen
L10495	STRD	DSP16_3	!display 16 duizendtallen

	ANDNT	REG0B16	!regeneratiefase 16
	JFRF	L10505
	FTCHD	STP16_0	!setpoint 16 eenheden
	FTCHD	STP16_1	!setpoint 16 tientallen
	FTCHD	STP16_2	!setpoint 16 honderdtallen
	FTCHD	STP16_3	!setpoint 16 duizendtallen
	STRD	DSP16_0	!display 16 eenheden
	STRD	DSP16_1	!display 16 tientallen
	STRD	DSP16_2	!display 16 honderdtallen
L10505	STRD	DSP16_3	!display 16 duizendtallen

	AND	REG0B17	!regeneratiefase 17
	JFRF	L10515
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP17_0	!display 17 eenheden
	STRD	DSP17_1	!display 17 tientallen
	STRD	DSP17_2	!display 17 honderdtallen
L10515	STRD	DSP17_3	!display 17 duizendtallen

	ANDNT	REG0B17	!regeneratiefase 17
	JFRF	L10525
	FTCHD	STP17_0	!setpoint 17 eenheden
	FTCHD	STP17_1	!setpoint 17 tientallen
	FTCHD	STP17_2	!setpoint 17 honderdtallen
	FTCHD	STP17_3	!setpoint 17 duizendtallen
	STRD	DSP17_0	!display 17 eenheden
	STRD	DSP17_1	!display 17 tientallen
	STRD	DSP17_2	!display 17 honderdtallen
L10525	STRD	DSP17_3	!display 17 duizendtallen

	AND	REG0B18	!regeneratiefase 18
	JFRF	L10535
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP18_0	!display 18 eenheden
	STRD	DSP18_1	!display 18 tientallen
	STRD	DSP18_2	!display 18 honderdtallen
L10535	STRD	DSP18_3	!display 18 duizendtallen

	ANDNT	REG0B18	!regeneratiefase 18
	JFRF	L10545
	FTCHD	STP18_0	!setpoint 18 eenheden
	FTCHD	STP18_1	!setpoint 18 tientallen
	FTCHD	STP18_2	!setpoint 18 honderdtallen
	FTCHD	STP18_3	!setpoint 18 duizendtallen
	STRD	DSP18_0	!display 18 eenheden
	STRD	DSP18_1	!display 18 tientallen
	STRD	DSP18_2	!display 18 honderdtallen
L10545	STRD	DSP18_3	!display 18 duizendtallen

	AND	REG0B19	!regeneratiefase 19
	JFRF	L10555
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP19_0	!display 19 eenheden
	STRD	DSP19_1	!display 19 tientallen
	STRD	DSP19_2	!display 19 honderdtallen
L10555	STRD	DSP19_3	!display 19 duizendtallen

	ANDNT	REG0B19	!regeneratiefase 19
	JFRF	L10565
	FTCHD	STP19_0	!setpoint 19 eenheden
	FTCHD	STP19_1	!setpoint 19 tientallen
	FTCHD	STP19_2	!setpoint 19 honderdtallen
	FTCHD	STP19_3	!setpoint 19 duizendtallen
	STRD	DSP19_0	!display 19 eenheden
	STRD	DSP19_1	!display 19 tientallen
	STRD	DSP19_2	!display 19 honderdtallen
L10565	STRD	DSP19_3	!display 19 duizendtallen

	AND	REG0B20	!regeneratiefase 20
	JFRF	L10575
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP20_0	!display 20 eenheden
	STRD	DSP20_1	!display 20 tientallen
	STRD	DSP20_2	!display 20 honderdtallen
L10575	STRD	DSP20_3	!display 20 duizendtallen

	ANDNT	REG0B20	!regeneratiefase 20
	JFRF	L10585
	FTCHD	STP20_0	!setpoint 20 eenheden
	FTCHD	STP20_1	!setpoint 20 tientallen
	FTCHD	STP20_2	!setpoint 20 honderdtallen
	FTCHD	STP20_3	!setpoint 20 duizendtallen
	STRD	DSP20_0	!display 20 eenheden
	STRD	DSP20_1	!display 20 tientallen
	STRD	DSP20_2	!display 20 honderdtallen
L10585	STRD	DSP20_3	!display 20 duizendtallen

	AND	REG0B21	!regeneratiefase 21
	JFRF	L10595
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP21_0	!display 21 eenheden
	STRD	DSP21_1	!display 21 tientallen
	STRD	DSP21_2	!display 21 honderdtallen
L10595	STRD	DSP21_3	!display 21 duizendtallen

	ANDNT	REG0B21	!regeneratiefase 21
	JFRF	L10605
	FTCHD	STP21_0	!setpoint 21 eenheden
	FTCHD	STP21_1	!setpoint 21 tientallen
	FTCHD	STP21_2	!setpoint 21 honderdtallen
	FTCHD	STP21_3	!setpoint 21 duizendtallen
	STRD	DSP21_0	!display 21 eenheden
	STRD	DSP21_1	!display 21 tientallen
	STRD	DSP21_2	!display 21 honderdtallen
L10605	STRD	DSP21_3	!display 21 duizendtallen

	AND	REG0B22	!regeneratiefase 22
	JFRF	L10615
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP22_0	!display 22 eenheden
	STRD	DSP22_1	!display 22 tientallen
	STRD	DSP22_2	!display 22 honderdtallen
L10615	STRD	DSP22_3	!display 22 duizendtallen

	ANDNT	REG0B22	!regeneratiefase 22
	JFRF	L10625
	FTCHD	STP22_0	!setpoint 22 eenheden
	FTCHD	STP22_1	!setpoint 22 tientallen
	FTCHD	STP22_2	!setpoint 22 honderdtallen
	FTCHD	STP22_3	!setpoint 22 duizendtallen
	STRD	DSP22_0	!display 22 eenheden
	STRD	DSP22_1	!display 22 tientallen
	STRD	DSP22_2	!display 22 honderdtallen
L10625	STRD	DSP22_3	!display 22 duizendtallen

	AND	REG0B23	!regeneratiefase 23
	JFRF	L10635
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP23_0	!display 23 eenheden
	STRD	DSP23_1	!display 23 tientallen
	STRD	DSP23_2	!display 23 honderdtallen
L10635	STRD	DSP23_3	!display 23 duizendtallen

	ANDNT	REG0B23	!regeneratiefase 23
	JFRF	L10645
	FTCHD	STP23_0	!setpoint 23 eenheden
	FTCHD	STP23_1	!setpoint 23 tientallen
	FTCHD	STP23_2	!setpoint 23 honderdtallen
	FTCHD	STP23_3	!setpoint 23 duizendtallen
	STRD	DSP23_0	!display 23 eenheden
	STRD	DSP23_1	!display 23 tientallen
	STRD	DSP23_2	!display 23 honderdtallen
L10645	STRD	DSP23_3	!display 23 duizendtallen

	AND	REG0B24	!regeneratiefase 24
	JFRF	L10655
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP24_0	!display 24 eenheden
	STRD	DSP24_1	!display 24 tientallen
	STRD	DSP24_2	!display 24 honderdtallen
L10655	STRD	DSP24_3	!display 24 duizendtallen

	ANDNT	REG0B24	!regeneratiefase 24
	JFRF	L10665
	FTCHD	STP24_0	!setpoint 24 eenheden
	FTCHD	STP24_1	!setpoint 24 tientallen
	FTCHD	STP24_2	!setpoint 24 honderdtallen
	FTCHD	STP24_3	!setpoint 24 duizendtallen
	STRD	DSP24_0	!display 24 eenheden
	STRD	DSP24_1	!display 24 tientallen
	STRD	DSP24_2	!display 24 honderdtallen
L10665	STRD	DSP24_3	!display 24 duizendtallen

	AND	REG0B25	!regeneratiefase 25
	JFRF	L10675
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP25_0	!display 25 eenheden
	STRD	DSP25_1	!display 25 tientallen
	STRD	DSP25_2	!display 25 honderdtallen
L10675	STRD	DSP25_3	!display 25 duizendtallen

	ANDNT	REG0B25	!regeneratiefase 25
	JFRF	L10685
	FTCHD	STP25_0	!setpoint 25 eenheden
	FTCHD	STP25_1	!setpoint 25 tientallen
	FTCHD	STP25_2	!setpoint 25 honderdtallen
	FTCHD	STP25_3	!setpoint 25 duizendtallen
	STRD	DSP25_0	!display 25 eenheden
	STRD	DSP25_1	!display 25 tientallen
	STRD	DSP25_2	!display 25 honderdtallen
L10685	STRD	DSP25_3	!display 25 duizendtallen

	AND	REG0B26	!regeneratiefase 26
	JFRF	L10695
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP26_0	!display 26 eenheden
	STRD	DSP26_1	!display 26 tientallen
	STRD	DSP26_2	!display 26 honderdtallen
L10695	STRD	DSP26_3	!display 26 duizendtallen

	ANDNT	REG0B26	!regeneratiefase 26
	JFRF	L10705
	FTCHD	STP26_0	!setpoint 26 eenheden
	FTCHD	STP26_1	!setpoint 26 tientallen
	FTCHD	STP26_2	!setpoint 26 honderdtallen
	FTCHD	STP26_3	!setpoint 26 duizendtallen
	STRD	DSP26_0	!display 26 eenheden
	STRD	DSP26_1	!display 26 tientallen
	STRD	DSP26_2	!display 26 honderdtallen
L10705	STRD	DSP26_3	!display 26 duizendtallen

	AND	REG0B27	!regeneratiefase 27
	JFRF	L10715
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP27_0	!display 27 eenheden
	STRD	DSP27_1	!display 27 tientallen
	STRD	DSP27_2	!display 27 honderdtallen
L10715	STRD	DSP27_3	!display 27 duizendtallen

	ANDNT	REG0B27	!regeneratiefase 27
	JFRF	L10725
	FTCHD	STP27_0	!setpoint 27 eenheden
	FTCHD	STP27_1	!setpoint 27 tientallen
	FTCHD	STP27_2	!setpoint 27 honderdtallen
	FTCHD	STP27_3	!setpoint 27 duizendtallen
	STRD	DSP27_0	!display 27 eenheden
	STRD	DSP27_1	!display 27 tientallen
	STRD	DSP27_2	!display 27 honderdtallen
L10725	STRD	DSP27_3	!display 27 duizendtallen

	AND	REG0B28	!regeneratiefase 28
	JFRF	L10735
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP28_0	!display 28 eenheden
	STRD	DSP28_1	!display 28 tientallen
	STRD	DSP28_2	!display 28 honderdtallen
L10735	STRD	DSP28_3	!display 28 duizendtallen

	ANDNT	REG0B28	!regeneratiefase 28
	JFRF	L10745
	FTCHD	STP28_0	!setpoint 28 eenheden
	FTCHD	STP28_1	!setpoint 28 tientallen
	FTCHD	STP28_2	!setpoint 28 honderdtallen
	FTCHD	STP28_3	!setpoint 28 duizendtallen
	STRD	DSP28_0	!display 28 eenheden
	STRD	DSP28_1	!display 28 tientallen
	STRD	DSP28_2	!display 28 honderdtallen
L10745	STRD	DSP28_3	!display 28 duizendtallen

	AND	REG0B29	!regeneratiefase 29
	JFRF	L10755
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP29_0	!display 29 eenheden
	STRD	DSP29_1	!display 29 tientallen
	STRD	DSP29_2	!display 29 honderdtallen
L10755	STRD	DSP29_3	!display 29 duizendtallen

	ANDNT	REG0B29	!regeneratiefase 29
	JFRF	L10765
	FTCHD	STP29_0	!setpoint 29 eenheden
	FTCHD	STP29_1	!setpoint 29 tientallen
	FTCHD	STP29_2	!setpoint 29 honderdtallen
	FTCHD	STP29_3	!setpoint 29 duizendtallen
	STRD	DSP29_0	!display 29 eenheden
	STRD	DSP29_1	!display 29 tientallen
	STRD	DSP29_2	!display 29 honderdtallen
L10765	STRD	DSP29_3	!display 29 duizendtallen

	AND	REG0B30	!regeneratiefase 30
	JFRF	L10775
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP30_0	!display 30 eenheden
	STRD	DSP30_1	!display 30 tientallen
	STRD	DSP30_2	!display 30 honderdtallen
L10775	STRD	DSP30_3	!display 30 duizendtallen

	ANDNT	REG0B30	!regeneratiefase 30
	JFRF	L10785
	FTCHD	STP30_0	!setpoint 30 eenheden
	FTCHD	STP30_1	!setpoint 30 tientallen
	FTCHD	STP30_2	!setpoint 30 honderdtallen
	FTCHD	STP30_3	!setpoint 30 duizendtallen
	STRD	DSP30_0	!display 30 eenheden
	STRD	DSP30_1	!display 30 tientallen
	STRD	DSP30_2	!display 30 honderdtallen
L10785	STRD	DSP30_3	!display 30 duizendtallen

	AND	REG0B31	!regeneratiefase 31
	JFRF	L10795
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP31_0	!display 31 eenheden
	STRD	DSP31_1	!display 31 tientallen
	STRD	DSP31_2	!display 31 honderdtallen
L10795	STRD	DSP31_3	!display 31 duizendtallen

	ANDNT	REG0B31	!regeneratiefase 31
	JFRF	L10805
	FTCHD	STP31_0	!setpoint 31 eenheden
	FTCHD	STP31_1	!setpoint 31 tientallen
	FTCHD	STP31_2	!setpoint 31 honderdtallen
	FTCHD	STP31_3	!setpoint 31 duizendtallen
	STRD	DSP31_0	!display 31 eenheden
	STRD	DSP31_1	!display 31 tientallen
	STRD	DSP31_2	!display 31 honderdtallen
L10805	STRD	DSP31_3	!display 31 duizendtallen

	AND	REG0B32	!regeneratiefase 32
	JFRF	L10815
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP32_0	!display 32 eenheden
	STRD	DSP32_1	!display 32 tientallen
	STRD	DSP32_2	!display 32 honderdtallen
L10815	STRD	DSP32_3	!display 32 duizendtallen

	ANDNT	REG0B32	!regeneratiefase 32
	JFRF	L10825
	FTCHD	STP32_0	!setpoint 32 eenheden
	FTCHD	STP32_1	!setpoint 32 tientallen
	FTCHD	STP32_2	!setpoint 32 honderdtallen
	FTCHD	STP32_3	!setpoint 32 duizendtallen
	STRD	DSP32_0	!display 32 eenheden
	STRD	DSP32_1	!display 32 tientallen
	STRD	DSP32_2	!display 32 honderdtallen
L10825	STRD	DSP32_3	!display 32 duizendtallen

	AND	REG0B33	!regeneratiefase 33
	JFRF	L10835
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP33_0	!display 33 eenheden
	STRD	DSP33_1	!display 33 tientallen
	STRD	DSP33_2	!display 33 honderdtallen
L10835	STRD	DSP33_3	!display 33 duizendtallen

	ANDNT	REG0B33	!regeneratiefase 33
	JFRF	L10845
	FTCHD	STP33_0	!setpoint 33 eenheden
	FTCHD	STP33_1	!setpoint 33 tientallen
	FTCHD	STP33_2	!setpoint 33 honderdtallen
	FTCHD	STP33_3	!setpoint 33 duizendtallen
	STRD	DSP33_0	!display 33 eenheden
	STRD	DSP33_1	!display 33 tientallen
	STRD	DSP33_2	!display 33 honderdtallen
L10845	STRD	DSP33_3	!display 33 duizendtallen

	AND	REG0B34	!regeneratiefase 33.1
	JFRF	L10855
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP34_0	!display 34 eenheden
	STRD	DSP34_1	!display 34 tientallen
	STRD	DSP34_2	!display 34 honderdtallen
L10855	STRD	DSP34_3	!display 34 duizendtallen

	ANDNT	REG0B34	!regeneratiefase 33.1
	JFRF	L10865
	FTCHD	STP34_0	!setpoint 34 eenheden
	FTCHD	STP34_1	!setpoint 34 tientallen
	FTCHD	STP34_2	!setpoint 34 honderdtallen
	FTCHD	STP34_3	!setpoint 34 duizendtallen
	STRD	DSP34_0	!display 34 eenheden
	STRD	DSP34_1	!display 34 tientallen
	STRD	DSP34_2	!display 34 honderdtallen
L10865	STRD	DSP34_3	!display 34 duizendtallen

	AND	REG0B60	!regeneratie fase 60
	JFRF	L10875
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP60_0	!display 60 eenheden
	STRD	DSP60_1	!display 60 tientallen
	STRD	DSP60_2	!display 60 honderdtallen
L10875	STRD	DSP60_3	!display 60 duizendtallen

	ANDNT	REG0B60	!regeneratie fase 60
	JFRF	L10885
	FTCHD	STP60_0	!setpoint 60 eenheden
	FTCHD	STP60_1	!setpoint 60 tientallen
	FTCHD	STP60_2	!setpoint 60 honderdtallen
	FTCHD	STP60_3	!setpoint 60 duizendtallen
	STRD	DSP60_0	!display 60 eenheden
	STRD	DSP60_1	!display 60 tientallen
	STRD	DSP60_2	!display 60 honderdtallen
L10885	STRD	DSP60_3	!display 60 duizendtallen

	AND	REG0B61	!regeneratie fase 61
	JFRF	L10895
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP61_0	!display 61 eenheden
	STRD	DSP61_1	!display 61 tientallen
	STRD	DSP61_2	!display 61 honderdtallen
L10895	STRD	DSP61_3	!display 61 duizendtallen

	ANDNT	REG0B61	!regeneratie fase 61
	JFRF	L10905
	FTCHD	STP61_0	!setpoint 61 eenheden
	FTCHD	STP61_1	!setpoint 61 tientallen
	FTCHD	STP61_2	!setpoint 61 honderdtallen
	FTCHD	STP61_3	!setpoint 61 duizendtallen
	STRD	DSP61_0	!display 61 eenheden
	STRD	DSP61_1	!display 61 tientallen
	STRD	DSP61_2	!display 61 honderdtallen
L10905	STRD	DSP61_3	!display 61 duizendtallen

	AND	REG0B62	!regeneratie fase 62
	JFRF	L10915
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP62_0	!display 62 eenheden
	STRD	DSP62_1	!display 62 tientallen
	STRD	DSP62_2	!display 62 honderdtallen
L10915	STRD	DSP62_3	!display 62 duizendtallen

	ANDNT	REG0B62	!regeneratie fase 62
	JFRF	L10925
	FTCHD	STP62_0	!setpoint 62 eenheden
	FTCHD	STP62_1	!setpoint 62 tientallen
	FTCHD	STP62_2	!setpoint 62 honderdtallen
	FTCHD	STP62_3	!setpoint 62 duizendtallen
	STRD	DSP62_0	!display 62 eenheden
	STRD	DSP62_1	!display 62 tientallen
	STRD	DSP62_2	!display 62 honderdtallen
L10925	STRD	DSP62_3	!display 62 duizendtallen

	AND	REG0B63	!regeneratie fase 63
	JFRF	L10935
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP63_0	!display 63 eenheden
	STRD	DSP63_1	!display 63 tientallen
	STRD	DSP63_2	!display 63 honderdtallen
L10935	STRD	DSP63_3	!display 63 duizendtallen

	ANDNT	REG0B63	!regeneratie fase 63
	JFRF	L10945
	FTCHD	STP63_0	!setpoint 63 eenheden
	FTCHD	STP63_1	!setpoint 63 tientallen
	FTCHD	STP63_2	!setpoint 63 honderdtallen
	FTCHD	STP63_3	!setpoint 63 duizendtallen
	STRD	DSP63_0	!display 63 eenheden
	STRD	DSP63_1	!display 63 tientallen
	STRD	DSP63_2	!display 63 honderdtallen
L10945	STRD	DSP63_3	!display 63 duizendtallen

	AND	REG0B64	!regeneratie fase 64
	JFRF	L10955
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP64_0	!display 64 eenheden
	STRD	DSP64_1	!display 64 tientallen
	STRD	DSP64_2	!display 64 honderdtallen
L10955	STRD	DSP64_3	!display 64 duizendtallen

	ANDNT	REG0B64	!regeneratie fase 64
	JFRF	L10965
	FTCHD	STP64_0	!setpoint 64 eenheden
	FTCHD	STP64_1	!setpoint 64 tientallen
	FTCHD	STP64_2	!setpoint 64 honderdtallen
	FTCHD	STP64_3	!setpoint 64 duizendtallen
	STRD	DSP64_0	!display 64 eenheden
	STRD	DSP64_1	!display 64 tientallen
	STRD	DSP64_2	!display 64 honderdtallen
L10965	STRD	DSP64_3	!display 64 duizendtallen

	AND	REG0B65	!regeneratie fase 65
	JFRF	L10975
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DSP65_0	!display 65 eenheden
	STRD	DSP65_1	!display 65 tientallen
	STRD	DSP65_2	!display 65 honderdtallen
L10975	STRD	DSP65_3	!display 65 duizendtallen

	ANDNT	REG0B65	!regeneratie fase 65
	JFRF	L10985
	FTCHD	STP65_0	!setpoint 65 eenheden
	FTCHD	STP65_1	!setpoint 65 tientallen
	FTCHD	STP65_2	!setpoint 65 honderdtallen
	FTCHD	STP65_3	!setpoint 65 duizendtallen
	STRD	DSP65_0	!display 65 eenheden
	STRD	DSP65_1	!display 65 tientallen
	STRD	DSP65_2	!display 65 honderdtallen
L10985	STRD	DSP65_3	!display 65 duizendtallen

	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	SET0	REG0B08	!regeneratiefase 8
	SET0	REG0B33	!regeneratiefase 33
	SET0	REG0B34	!regeneratiefase 33.1

	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	FTCHC	00
	STRD	0038
	STRD	0039
	STRD	0040
	STRD	0041
	STRD	0042
	STRD	0043
	STRD	0400

	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	SET0	REG0B64	!regeneratie fase 64
	SET0	REG0B65	!regeneratie fase 65
	NOP	48
!                               DR_FLW
!				******
!
! Flowbewaking reinwater
!
	AND	000.1
	FTCHD	FLW00_0	!LSB +
	FTCHD	FLW00_1	!| flow reinwater
	FTCHD	FLW00_2	!MSB +
	STRD	DSP70_0	!display 70 eenheden
	STRD	DSP70_1	!display 70 tientallen
	STRD	DSP70_2	!display 70 honderdtallen

	AND	000.1
	FTCHC	15
	STRD	DSP70_3	!display 70 duizendtallen

	AND	000.1
	FTCHD	FLW00_0	!LSB +
	FTCHD	FLW00_1	!| flow reinwater
	FTCHD	FLW00_2	!MSB +
	COMP	STP70_0	!setpoint 70 eenheden
	COMP	STP70_1	!setpoint 70 tientallen
	COMP	STP70_2	!setpoint 70 honderdtallen
	STRD	FLW0D00	!vergelijkingsresult.

	AND	FLW0B02	!F>C
	ORNT	BDR0B10	!bedrijfsmelding
	FTCHD	STP74_0	!setpoint 74 eenheden
	FTCHD	STP74_1	!setpoint 74 tientallen
	FTCHD	STP74_2	!setpoint 74 honderdtallen
	FTCHD	STP74_3	!setpoint 74 duizendtallen
	STRD	DSP74_0	!display 74 eenheden
	STRD	DSP74_1	!display 74 tientallen
	STRD	DSP74_2	!display 74 honderdtallen
	STRD	DSP74_3	!display 74 duizendtallen
	SET0	FLW0B04	!tijdvertr. flowalarm

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	FLW0B01	!F<C
	AND	BDR0B10	!bedrijfsmelding
	ANDNT	FLW0B04	!tijdvertr. flowalarm
	CNTD	DSP74_0	!display 74 eenheden
	CNTD	DSP74_1	!display 74 tientallen
	CNTD	DSP74_2	!display 74 honderdtallen
	CNTD	DSP74_3	!display 74 duizendtallen
	STRB	FLW0B04	!tijdvertr. flowalarm
!
! Flowbewaking ruwwater
!
	AND	000.1
	FTCHD	FLW01_0	!LSB +
	FTCHD	FLW01_1	!| flow ruwwater
	FTCHD	FLW01_2	!MSB +
	STRD	DSP71_0	!display 71 eenheden
	STRD	DSP71_1	!display 71 tientallen
	STRD	DSP71_2	!display 71 honderdtallen

	AND	000.1
	FTCHC	15
	STRD	DSP71_3	!display 71 duizendtallen

	AND	000.1
	FTCHD	FLW01_0	!LSB +
	FTCHD	FLW01_1	!| flow ruwwater
	FTCHD	FLW01_2	!MSB +
	COMP	STP71_0	!setpoint 71 eenheden
	COMP	STP71_1	!setpoint 71 tientallen
	COMP	STP71_2	!setpoint 71 honderdtallen
	STRD	FLW1D00	!vergelijkingsresult.

	AND	FLW1B02	!F>C
  ORNT  CMF_IN  !inbedrijfmelding CMF naar kast algemeen
	FTCHD	STP75_0	!setpoint 75 eenheden
	FTCHD	STP75_1	!setpoint 75 tientallen
	FTCHD	STP75_2	!setpoint 75 honderdtallen
	FTCHD	STP75_3	!setpoint 75 duizendtallen
	STRD	DSP75_0	!display 75 eenheden
	STRD	DSP75_1	!display 75 tientallen
	STRD	DSP75_2	!display 75 honderdtallen
	STRD	DSP75_3	!display 75 duizendtallen
	SET0	FLW1B04	!tijdvertr. flowalarm

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	FLW1B01	!F<C
	AND	BDR0B10	!bedrijfsmelding
	ANDNT	FLW1B04	!tijdvertr. flowalarm
	CNTD	DSP75_0	!display 75 eenheden
	CNTD	DSP75_1	!display 75 tientallen
	CNTD	DSP75_2	!display 75 honderdtallen
	CNTD	DSP75_3	!display 75 duizendtallen
	STRB	FLW1B04	!tijdvertr. flowalarm

	AND	FLW1B04	!tijdvertr. flowalarm
	EQL	ALARM45	!lage flow alarm vuilproceswater
!
! Flowbewaking concentraat
!
	AND	000.1
	FTCHD	FLW02_0	!LSB +
	FTCHD	FLW02_1	!| flow concentraat
	FTCHD	FLW02_2	!MSB +
	STRD	DSP72_0	!display 72 eenheden
	STRD	DSP72_1	!display 72 tientallen
	STRD	DSP72_2	!display 72 honderdtallen

	AND	000.1
	FTCHC	15
	STRD	DSP72_3	!display 72 duizendtallen

	AND	000.1
	FTCHD	FLW02_0	!LSB +
	FTCHD	FLW02_1	!| flow concentraat
	FTCHD	FLW02_2	!MSB +
	COMP	STP72_0	!setpoint 72 eenheden
	COMP	STP72_1	!setpoint 72 tientallen
	COMP	STP72_2	!setpoint 72 honderdtallen
	STRD	FLW2D00	!vergelijkingsresult.

	AND	FLW2B02	!F>C
	ORNT	V10_4
	FTCHD	STP76_0	!setpoint 76 eenheden
	FTCHD	STP76_1	!setpoint 76 tientallen
	FTCHD	STP76_2	!setpoint 76 honderdtallen
	FTCHD	STP76_3	!setpoint 76 duizendtallen
	STRD	DSP76_0	!display 76 eenheden
	STRD	DSP76_1	!display 76 tientallen
	STRD	DSP76_2	!display 76 honderdtallen
	STRD	DSP76_3	!display 76 duizendtallen
	SET0	FLW2B04	!tijdvertr. flowalarm

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	FLW2B01	!F<C
	AND	V10_4
	ANDNT	FLW2B04	!tijdvertr. flowalarm
	CNTD	DSP76_0	!display 76 eenheden
	CNTD	DSP76_1	!display 76 tientallen
	CNTD	DSP76_2	!display 76 honderdtallen
	CNTD	DSP76_3	!display 76 duizendtallen
	STRB	FLW2B04	!tijdvertr. flowalarm
!
! Flowbewaking reserve
!
	AND	000.1
	FTCHD	FLW03_0	!LSB +
	FTCHD	FLW03_1	!| reserve
	FTCHD	FLW03_2	!MSB +
	STRD	DSP73_0	!display 73 eenheden
	STRD	DSP73_1	!display 73 tientallen
	STRD	DSP73_2	!display 73 honderdtallen

	AND	000.1
	FTCHC	15
	STRD	DSP70_3	!display 70 duizendtallen

	AND	000.1
	FTCHD	FLW03_0	!LSB +
	FTCHD	FLW03_1	!| reserve
	FTCHD	FLW03_2	!MSB +
	COMP	STP73_0	!setpoint 73 eenheden
	COMP	STP73_1	!setpoint 73 tientallen
	COMP	STP73_2	!setpoint 73 honderdtallen
	STRD	FLW3D00	!vergelijkingsresult.

	AND	FLW3B02	!F>C
	FTCHD	STP77_0	!setpoint 77 eenheden
	FTCHD	STP77_1	!setpoint 77 tientallen
	FTCHD	STP77_2	!setpoint 77 honderdtallen
	FTCHD	STP77_3	!setpoint 77 duizendtallen
	STRD	DSP77_0	!display 77 eenheden
	STRD	DSP77_1	!display 77 tientallen
	STRD	DSP77_2	!display 77 honderdtallen
	STRD	DSP77_3	!display 77 duizendtallen
	SET0	FLW3B04	!tijdvertr. flowalarm

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	FLW3B01	!F<C
	ANDNT	FLW3B04	!tijdvertr. flowalarm
	CNTD	DSP77_0	!display 77 eenheden
	CNTD	DSP77_1	!display 77 tientallen
	CNTD	DSP77_2	!display 77 honderdtallen
	CNTD	DSP77_3	!display 77 duizendtallen
	STRB	FLW3B04	!tijdvertr. flowalarm
	NOP	48
!                               DR_GEL
!				******
!
! Geleidb. bewaking reinwater
!
	AND	000.1
	FTCHD	GEL00_0	!LSB +
	FTCHD	GEL00_1	!| geleidbaarheid reinwater
	FTCHD	GEL00_2	!MSB +
	STRD	DSP78_0	!display 78 eenheden
	STRD	DSP78_1	!display 78 tientallen
	STRD	DSP78_2	!display 78 honderdtallen

	AND	000.1
	FTCHC	15
	STRD	DSP78_3	!display 78 duizendtallen

	AND	000.1
	FTCHD	GEL00_0	!LSB +
	FTCHD	GEL00_1	!| geleidbaarheid reinwater
	FTCHD	GEL00_2	!MSB +
	COMP	STP78_0	!setpoint 78 eenheden
	COMP	STP78_1	!setpoint 78 tientallen
	COMP	STP78_2	!setpoint 78 honderdtallen
	STRD	GEL0D00	!vergelijkingsresult.

	AND	GEL0B02	!F>C
	FTCHD	STP82_0	!setpoint 82 eenheden
	FTCHD	STP82_1	!setpoint 82 tientallen
	FTCHD	STP82_2	!setpoint 82 honderdtallen
	FTCHD	STP82_3	!setpoint 82 duizendtallen
	STRD	DSP82_0	!display 82 eenheden
	STRD	DSP82_1	!display 82 tientallen
	STRD	DSP82_2	!display 82 honderdtallen
	STRD	DSP82_3	!display 82 duizendtallen
	SET0	GEL0B04	!tijdvertr. flowalarm

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	GEL0B01	!F<C
	ANDNT	GEL0B04	!tijdvertr. flowalarm
	CNTD	DSP82_0	!display 82 eenheden
	CNTD	DSP82_1	!display 82 tientallen
	CNTD	DSP82_2	!display 82 honderdtallen
	CNTD	DSP82_3	!display 82 duizendtallen
	STRB	GEL0B04	!tijdvertr. flowalarm
!
! geleidb. bewaking spoelleiding
!
	AND	000.1
	FTCHD	GEL01_0	!LSB +
	FTCHD	GEL01_1	!| geleidbaarheid spoelleiding
	FTCHD	GEL01_2	!MSB +
	STRD	DSP79_0	!display 79 eenheden
	STRD	DSP79_1	!display 79 tientallen
	STRD	DSP79_2	!display 79 honderdtallen

	AND	000.1
	FTCHC	15
	STRD	DSP79_3	!display 79 duizendtallen

	AND	000.1
	FTCHD	GEL01_0	!LSB +
	FTCHD	GEL01_1	!| geleidbaarheid spoelleiding
	FTCHD	GEL01_2	!MSB +
	COMP	STP79_0	!setpoint 79 eenheden
	COMP	STP79_1	!setpoint 79 tientallen
	COMP	STP79_2	!setpoint 79 honderdtallen
	STRD	GEL1D00	!vergelijkingsresult.

	AND	GEL1B02	!F>C
	FTCHD	STP83_0	!setpoint 83 eenheden
	FTCHD	STP83_1	!setpoint 83 tientallen
	FTCHD	STP83_2	!setpoint 83 honderdtallen
	FTCHD	STP83_3	!setpoint 83 duizendtallen
	STRD	DSP83_0	!display 83 eenheden
	STRD	DSP83_1	!display 83 tientallen
	STRD	DSP83_2	!display 83 honderdtallen
	STRD	DSP83_3	!display 83 duizendtallen
	SET0	GEL1B04	!tijdvertr. flowalarm

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	GEL1B01	!F<C
	ANDNT	GEL1B04	!tijdvertr. flowalarm
	CNTD	DSP83_0	!display 83 eenheden
	CNTD	DSP83_1	!display 83 tientallen
	CNTD	DSP83_2	!display 83 honderdtallen
	CNTD	DSP83_3	!display 83 duizendtallen
	STRB	GEL1B04	!tijdvertr. flowalarm
!
! reserve
!
	AND	000.1
	FTCHD	GEL02_0	!LSB +
	FTCHD	GEL02_1	!| reserve
	FTCHD	GEL02_2	!MSB +
	STRD	DSP80_0	!display 80 eenheden
	STRD	DSP80_1	!display 80 tientallen
	STRD	DSP80_2	!display 80 honderdtallen

	AND	000.1
	FTCHC	15
	STRD	DSP80_3	!display 80 duizendtallen

	AND	000.1
	FTCHD	GEL02_0	!LSB +
	FTCHD	GEL02_1	!| reserve
	FTCHD	GEL02_2	!MSB +
	COMP	STP80_0	!setpoint 80 eenheden
	COMP	STP80_1	!setpoint 80 tientallen
	COMP	STP80_2	!setpoint 80 honderdtallen
	STRD	GEL2D00	!vergelijkingsresult.

	AND	GEL2B02	!F>C
	FTCHD	STP84_0	!setpoint 84 eenheden
	FTCHD	STP84_1	!setpoint 84 tientallen
	FTCHD	STP84_2	!setpoint 84 honderdtallen
	FTCHD	STP84_3	!setpoint 84 duizendtallen
	STRD	DSP84_0	!display 84 eenheden
	STRD	DSP84_1	!display 84 tientallen
	STRD	DSP84_2	!display 84 honderdtallen
	STRD	DSP84_3	!display 84 duizendtallen
	SET0	GEL2B04	!tijdvertr. flowalarm

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	GEL2B01	!F<C
	ANDNT	GEL2B04	!tijdvertr. flowalarm
	CNTD	DSP84_0	!display 84 eenheden
	CNTD	DSP84_1	!display 84 tientallen
	CNTD	DSP84_2	!display 84 honderdtallen
	CNTD	DSP84_3	!display 84 duizendtallen
	STRB	GEL2B04	!tijdvertr. flowalarm
!
! reserve
!
	AND	000.1
	FTCHD	GEL03_0	!LSB +
	FTCHD	GEL03_1	!| reserve
	FTCHD	GEL03_2	!MSB +
	STRD	DSP81_0	!display 81 eenheden
	STRD	DSP81_1	!display 81 tientallen
	STRD	DSP81_2	!display 81 honderdtallen

	AND	000.1
	FTCHC	15
	STRD	DSP81_3	!display 81 duizendtallen

	AND	000.1
	FTCHD	GEL03_0	!LSB +
	FTCHD	GEL03_1	!| reserve
	FTCHD	GEL03_2	!MSB +
	COMP	STP81_0	!setpoint 81 eenheden
	COMP	STP81_1	!setpoint 81 tientallen
	COMP	STP81_2	!setpoint 81 honderdtallen
	STRD	GEL3D00	!vergelijkingsresult.

	AND	GEL3B02	!F>C
	FTCHD	STP85_0	!setpoint 85 eenheden
	FTCHD	STP85_1	!setpoint 85 tientallen
	FTCHD	STP85_2	!setpoint 85 honderdtallen
	FTCHD	STP85_3	!setpoint 85 duizendtallen
	STRD	DSP85_0	!display 85 eenheden
	STRD	DSP85_1	!display 85 tientallen
	STRD	DSP85_2	!display 85 honderdtallen
	STRD	DSP85_3	!display 85 duizendtallen
	SET0	GEL3B04	!tijdvertr. flowalarm

	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	GEL3B01	!F<C
	ANDNT	GEL3B04	!tijdvertr. flowalarm
	CNTD	DSP85_0	!display 85 eenheden
	CNTD	DSP85_1	!display 85 tientallen
	CNTD	DSP85_2	!display 85 honderdtallen
	CNTD	DSP85_3	!display 85 duizendtallen
	STRB	GEL3B04	!tijdvertr. flowalarm
	NOP	56
	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13356

	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11477

	AND	RESULT1	!F=C
	FTCHD	STP00_0	!setpoint 00 eenheden
	FTCHD	STP00_1	!setpoint 00 tientallen
	FTCHD	STP00_2	!setpoint 00 honderdtallen
	FTCHD	STP00_3	!setpoint 00 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11477	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11496

	AND	RESULT1	!F=C
	FTCHD	STP01_0	!setpoint 01 eenheden
	FTCHD	STP01_1	!setpoint 01 tientallen
	FTCHD	STP01_2	!setpoint 01 honderdtallen
	FTCHD	STP01_3	!setpoint 01 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11496	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11515

	AND	RESULT1	!F=C
	FTCHD	STP02_0	!setpoint 02 eenheden
	FTCHD	STP02_1	!setpoint 02 tientallen
	FTCHD	STP02_2	!setpoint 02 honderdtallen
	FTCHD	STP02_3	!setpoint 02 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11515	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11534

	AND	RESULT1	!F=C
	FTCHD	STP03_0	!setpoint 03 eenheden
	FTCHD	STP03_1	!setpoint 03 tientallen
	FTCHD	STP03_2	!setpoint 03 honderdtallen
	FTCHD	STP03_3	!setpoint 03 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11534	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11553

	AND	RESULT1	!F=C
	FTCHD	STP04_0	!setpoint 04 eenheden
	FTCHD	STP04_1	!setpoint 04 tientallen
	FTCHD	STP04_2	!setpoint 04 honderdtallen
	FTCHD	STP04_3	!setpoint 04 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11553	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11572

	AND	RESULT1	!F=C
	FTCHD	STP05_0	!setpoint 05 eenheden
	FTCHD	STP05_1	!setpoint 05 tientallen
	FTCHD	STP05_2	!setpoint 05 honderdtallen
	FTCHD	STP05_3	!setpoint 05 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11572	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11591

	AND	RESULT1	!F=C
	FTCHD	STP06_0	!setpoint 06 eenheden
	FTCHD	STP06_1	!setpoint 06 tientallen
	FTCHD	STP06_2	!setpoint 06 honderdtallen
	FTCHD	STP06_3	!setpoint 06 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11591	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11610

	AND	RESULT1	!F=C
	FTCHD	STP07_0	!setpoint 07 eenheden
	FTCHD	STP07_1	!setpoint 07 tientallen
	FTCHD	STP07_2	!setpoint 07 honderdtallen
	FTCHD	STP07_3	!setpoint 07 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11610	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11629

	AND	RESULT1	!F=C
	FTCHD	STP08_0	!setpoint 08 eenheden
	FTCHD	STP08_1	!setpoint 08 tientallen
	FTCHD	STP08_2	!setpoint 08 honderdtallen
	FTCHD	STP08_3	!setpoint 08 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11629	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11648

	AND	RESULT1	!F=C
	FTCHD	STP09_0	!setpoint 09 eenheden
	FTCHD	STP09_1	!setpoint 09 tientallen
	FTCHD	STP09_2	!setpoint 09 honderdtallen
	FTCHD	STP09_3	!setpoint 09 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11648	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11667

	AND	RESULT1	!F=C
	FTCHD	STP10_0	!setpoint 10 eenheden
	FTCHD	STP10_1	!setpoint 10 tientallen
	FTCHD	STP10_2	!setpoint 10 honderdtallen
	FTCHD	STP10_3	!setpoint 10 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11667	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11686

	AND	RESULT1	!F=C
	FTCHD	STP11_0	!setpoint 11 eenheden
	FTCHD	STP11_1	!setpoint 11 tientallen
	FTCHD	STP11_2	!setpoint 11 honderdtallen
	FTCHD	STP11_3	!setpoint 11 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11686	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11705

	AND	RESULT1	!F=C
	FTCHD	STP12_0	!setpoint 12 eenheden
	FTCHD	STP12_1	!setpoint 12 tientallen
	FTCHD	STP12_2	!setpoint 12 honderdtallen
	FTCHD	STP12_3	!setpoint 12 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11705	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11724

	AND	RESULT1	!F=C
	FTCHD	STP13_0	!setpoint 13 eenheden
	FTCHD	STP13_1	!setpoint 13 tientallen
	FTCHD	STP13_2	!setpoint 13 honderdtallen
	FTCHD	STP13_3	!setpoint 13 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11724	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11743

	AND	RESULT1	!F=C
	FTCHD	STP14_0	!setpoint 14 eenheden
	FTCHD	STP14_1	!setpoint 14 tientallen
	FTCHD	STP14_2	!setpoint 14 honderdtallen
	FTCHD	STP14_3	!setpoint 14 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11743	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11762

	AND	RESULT1	!F=C
	FTCHD	STP15_0	!setpoint 15 eenheden
	FTCHD	STP15_1	!setpoint 15 tientallen
	FTCHD	STP15_2	!setpoint 15 honderdtallen
	FTCHD	STP15_3	!setpoint 15 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11762	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11781

	AND	RESULT1	!F=C
	FTCHD	STP16_0	!setpoint 16 eenheden
	FTCHD	STP16_1	!setpoint 16 tientallen
	FTCHD	STP16_2	!setpoint 16 honderdtallen
	FTCHD	STP16_3	!setpoint 16 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11781	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11800

	AND	RESULT1	!F=C
	FTCHD	STP17_0	!setpoint 17 eenheden
	FTCHD	STP17_1	!setpoint 17 tientallen
	FTCHD	STP17_2	!setpoint 17 honderdtallen
	FTCHD	STP17_3	!setpoint 17 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11800	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11819

	AND	RESULT1	!F=C
	FTCHD	STP18_0	!setpoint 18 eenheden
	FTCHD	STP18_1	!setpoint 18 tientallen
	FTCHD	STP18_2	!setpoint 18 honderdtallen
	FTCHD	STP18_3	!setpoint 18 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11819	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11838

	AND	RESULT1	!F=C
	FTCHD	STP19_0	!setpoint 19 eenheden
	FTCHD	STP19_1	!setpoint 19 tientallen
	FTCHD	STP19_2	!setpoint 19 honderdtallen
	FTCHD	STP19_3	!setpoint 19 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11838	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11857

	AND	RESULT1	!F=C
	FTCHD	STP20_0	!setpoint 20 eenheden
	FTCHD	STP20_1	!setpoint 20 tientallen
	FTCHD	STP20_2	!setpoint 20 honderdtallen
	FTCHD	STP20_3	!setpoint 20 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11857	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11876

	AND	RESULT1	!F=C
	FTCHD	STP21_0	!setpoint 21 eenheden
	FTCHD	STP21_1	!setpoint 21 tientallen
	FTCHD	STP21_2	!setpoint 21 honderdtallen
	FTCHD	STP21_3	!setpoint 21 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11876	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11895

	AND	RESULT1	!F=C
	FTCHD	STP22_0	!setpoint 22 eenheden
	FTCHD	STP22_1	!setpoint 22 tientallen
	FTCHD	STP22_2	!setpoint 22 honderdtallen
	FTCHD	STP22_3	!setpoint 22 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11895	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11914

	AND	RESULT1	!F=C
	FTCHD	STP23_0	!setpoint 23 eenheden
	FTCHD	STP23_1	!setpoint 23 tientallen
	FTCHD	STP23_2	!setpoint 23 honderdtallen
	FTCHD	STP23_3	!setpoint 23 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11914	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11933

	AND	RESULT1	!F=C
	FTCHD	STP24_0	!setpoint 24 eenheden
	FTCHD	STP24_1	!setpoint 24 tientallen
	FTCHD	STP24_2	!setpoint 24 honderdtallen
	FTCHD	STP24_3	!setpoint 24 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11933	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11952

	AND	RESULT1	!F=C
	FTCHD	STP25_0	!setpoint 25 eenheden
	FTCHD	STP25_1	!setpoint 25 tientallen
	FTCHD	STP25_2	!setpoint 25 honderdtallen
	FTCHD	STP25_3	!setpoint 25 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11952	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11971

	AND	RESULT1	!F=C
	FTCHD	STP26_0	!setpoint 26 eenheden
	FTCHD	STP26_1	!setpoint 26 tientallen
	FTCHD	STP26_2	!setpoint 26 honderdtallen
	FTCHD	STP26_3	!setpoint 26 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11971	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L11990

	AND	RESULT1	!F=C
	FTCHD	STP27_0	!setpoint 27 eenheden
	FTCHD	STP27_1	!setpoint 27 tientallen
	FTCHD	STP27_2	!setpoint 27 honderdtallen
	FTCHD	STP27_3	!setpoint 27 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L11990	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12009

	AND	RESULT1	!F=C
	FTCHD	STP28_0	!setpoint 28 eenheden
	FTCHD	STP28_1	!setpoint 28 tientallen
	FTCHD	STP28_2	!setpoint 28 honderdtallen
	FTCHD	STP28_3	!setpoint 28 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12009	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12028

	AND	RESULT1	!F=C
	FTCHD	STP29_0	!setpoint 29 eenheden
	FTCHD	STP29_1	!setpoint 29 tientallen
	FTCHD	STP29_2	!setpoint 29 honderdtallen
	FTCHD	STP29_3	!setpoint 29 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12028	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12047

	AND	RESULT1	!F=C
	FTCHD	STP30_0	!setpoint 30 eenheden
	FTCHD	STP30_1	!setpoint 30 tientallen
	FTCHD	STP30_2	!setpoint 30 honderdtallen
	FTCHD	STP30_3	!setpoint 30 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12047	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12066

	AND	RESULT1	!F=C
	FTCHD	STP31_0	!setpoint 31 eenheden
	FTCHD	STP31_1	!setpoint 31 tientallen
	FTCHD	STP31_2	!setpoint 31 honderdtallen
	FTCHD	STP31_3	!setpoint 31 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12066	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12085

	AND	RESULT1	!F=C
	FTCHD	STP32_0	!setpoint 32 eenheden
	FTCHD	STP32_1	!setpoint 32 tientallen
	FTCHD	STP32_2	!setpoint 32 honderdtallen
	FTCHD	STP32_3	!setpoint 32 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12085	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12104

	AND	RESULT1	!F=C
	FTCHD	STP33_0	!setpoint 33 eenheden
	FTCHD	STP33_1	!setpoint 33 tientallen
	FTCHD	STP33_2	!setpoint 33 honderdtallen
	FTCHD	STP33_3	!setpoint 33 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12104	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12123

	AND	RESULT1	!F=C
	FTCHD	STP34_0	!setpoint 34 eenheden
	FTCHD	STP34_1	!setpoint 34 tientallen
	FTCHD	STP34_2	!setpoint 34 honderdtallen
	FTCHD	STP34_3	!setpoint 34 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12123	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12142

	AND	RESULT1	!F=C
	FTCHD	STP35_0	!setpoint 35 eenheden
	FTCHD	STP35_1	!setpoint 35 tientallen
	FTCHD	STP35_2	!setpoint 35 honderdtallen
	FTCHD	STP35_3	!setpoint 35 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12142	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12161

	AND	RESULT1	!F=C
	FTCHD	STP36_0	!setpoint 36 eenheden
	FTCHD	STP36_1	!setpoint 36 tientallen
	FTCHD	STP36_2	!setpoint 36 honderdtallen
	FTCHD	STP36_3	!setpoint 36 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12161	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12180

	AND	RESULT1	!F=C
	FTCHD	STP37_0	!setpoint 37 eenheden
	FTCHD	STP37_1	!setpoint 37 tientallen
	FTCHD	STP37_2	!setpoint 37 honderdtallen
	FTCHD	STP37_3	!setpoint 37 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12180	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12199

	AND	RESULT1	!F=C
	FTCHD	STP38_0	!setpoint 38 eenheden
	FTCHD	STP38_1	!setpoint 38 tientallen
	FTCHD	STP38_2	!setpoint 38 honderdtallen
	FTCHD	STP38_3	!setpoint 38 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12199	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12218

	AND	RESULT1	!F=C
	FTCHD	STP39_0	!setpoint 39 eenheden
	FTCHD	STP39_1	!setpoint 39 tientallen
	FTCHD	STP39_2	!setpoint 39 honderdtallen
	FTCHD	STP39_3	!setpoint 39 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12218	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12237

	AND	RESULT1	!F=C
	FTCHD	STP40_0	!setpoint 40 eenheden
	FTCHD	STP40_1	!setpoint 40 tientallen
	FTCHD	STP40_2	!setpoint 40 honderdtallen
	FTCHD	STP40_3	!setpoint 40 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12237	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12256

	AND	RESULT1	!F=C
	FTCHD	STP41_0	!setpoint 41 eenheden
	FTCHD	STP41_1	!setpoint 41 tientallen
	FTCHD	STP41_2	!setpoint 41 honderdtallen
	FTCHD	STP41_3	!setpoint 41 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12256	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12275

	AND	RESULT1	!F=C
	FTCHD	STP42_0	!setpoint 42 eenheden
	FTCHD	STP42_1	!setpoint 42 tientallen
	FTCHD	STP42_2	!setpoint 42 honderdtallen
	FTCHD	STP42_3	!setpoint 42 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12275	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12294

	AND	RESULT1	!F=C
	FTCHD	STP43_0	!setpoint 43 eenheden
	FTCHD	STP43_1	!setpoint 43 tientallen
	FTCHD	STP43_2	!setpoint 43 honderdtallen
	FTCHD	STP43_3	!setpoint 43 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12294	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12313

	AND	RESULT1	!F=C
	FTCHD	STP44_0	!setpoint 44 eenheden
	FTCHD	STP44_1	!setpoint 44 tientallen
	FTCHD	STP44_2	!setpoint 44 honderdtallen
	FTCHD	STP44_3	!setpoint 44 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12313	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12332

	AND	RESULT1	!F=C
	FTCHD	STP45_0	!setpoint 45 eenheden
	FTCHD	STP45_1	!setpoint 45 tientallen
	FTCHD	STP45_2	!setpoint 45 honderdtallen
	FTCHD	STP45_3	!setpoint 45 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12332	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12351

	AND	RESULT1	!F=C
	FTCHD	STP46_0	!setpoint 46 eenheden
	FTCHD	STP46_1	!setpoint 46 tientallen
	FTCHD	STP46_2	!setpoint 46 honderdtallen
	FTCHD	STP46_3	!setpoint 46 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12351	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12370

	AND	RESULT1	!F=C
	FTCHD	STP47_0	!setpoint 47 eenheden
	FTCHD	STP47_1	!setpoint 47 tientallen
	FTCHD	STP47_2	!setpoint 47 honderdtallen
	FTCHD	STP47_3	!setpoint 47 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12370	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12389

	AND	RESULT1	!F=C
	FTCHD	STP48_0	!setpoint 48 eenheden
	FTCHD	STP48_1	!setpoint 48 tientallen
	FTCHD	STP48_2	!setpoint 48 honderdtallen
	FTCHD	STP48_3	!setpoint 48 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12389	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12408

	AND	RESULT1	!F=C
	FTCHD	STP49_0	!setpoint 49 eenheden
	FTCHD	STP49_1	!setpoint 49 tientallen
	FTCHD	STP49_2	!setpoint 49 honderdtallen
	FTCHD	STP49_3	!setpoint 49 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12408	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12427

	AND	RESULT1	!F=C
	FTCHD	STP50_0	!setpoint 50 eenheden
	FTCHD	STP50_1	!setpoint 50 tientallen
	FTCHD	STP50_2	!setpoint 50 honderdtallen
	FTCHD	STP50_3	!setpoint 50 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12427	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12446

	AND	RESULT1	!F=C
	FTCHD	STP51_0	!setpoint 51 eenheden
	FTCHD	STP51_1	!setpoint 51 tientallen
	FTCHD	STP51_2	!setpoint 51 honderdtallen
	FTCHD	STP51_3	!setpoint 51 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12446	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12465

	AND	RESULT1	!F=C
	FTCHD	STP52_0	!setpoint 52 eenheden
	FTCHD	STP52_1	!setpoint 52 tientallen
	FTCHD	STP52_2	!setpoint 52 honderdtallen
	FTCHD	STP52_3	!setpoint 52 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12465	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12484

	AND	RESULT1	!F=C
	FTCHD	STP53_0	!setpoint 53 eenheden
	FTCHD	STP53_1	!setpoint 53 tientallen
	FTCHD	STP53_2	!setpoint 53 honderdtallen
	FTCHD	STP53_3	!setpoint 53 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12484	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12503

	AND	RESULT1	!F=C
	FTCHD	STP54_0	!setpoint 54 eenheden
	FTCHD	STP54_1	!setpoint 54 tientallen
	FTCHD	STP54_2	!setpoint 54 honderdtallen
	FTCHD	STP54_3	!setpoint 54 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12503	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12522

	AND	RESULT1	!F=C
	FTCHD	STP55_0	!setpoint 55 eenheden
	FTCHD	STP55_1	!setpoint 55 tientallen
	FTCHD	STP55_2	!setpoint 55 honderdtallen
	FTCHD	STP55_3	!setpoint 55 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12522	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12541

	AND	RESULT1	!F=C
	FTCHD	STP56_0	!setpoint 56 eenheden
	FTCHD	STP56_1	!setpoint 56 tientallen
	FTCHD	STP56_2	!setpoint 56 honderdtallen
	FTCHD	STP56_3	!setpoint 56 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12541	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12560

	AND	RESULT1	!F=C
	FTCHD	STP57_0	!setpoint 57 eenheden
	FTCHD	STP57_1	!setpoint 57 tientallen
	FTCHD	STP57_2	!setpoint 57 honderdtallen
	FTCHD	STP57_3	!setpoint 57 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12560	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12579

	AND	RESULT1	!F=C
	FTCHD	STP58_0	!setpoint 58 eenheden
	FTCHD	STP58_1	!setpoint 58 tientallen
	FTCHD	STP58_2	!setpoint 58 honderdtallen
	FTCHD	STP58_3	!setpoint 58 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12579	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12598

	AND	RESULT1	!F=C
	FTCHD	STP59_0	!setpoint 59 eenheden
	FTCHD	STP59_1	!setpoint 59 tientallen
	FTCHD	STP59_2	!setpoint 59 honderdtallen
	FTCHD	STP59_3	!setpoint 59 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12598	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12617

	AND	RESULT1	!F=C
	FTCHD	STP60_0	!setpoint 60 eenheden
	FTCHD	STP60_1	!setpoint 60 tientallen
	FTCHD	STP60_2	!setpoint 60 honderdtallen
	FTCHD	STP60_3	!setpoint 60 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12617	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12636

	AND	RESULT1	!F=C
	FTCHD	STP61_0	!setpoint 61 eenheden
	FTCHD	STP61_1	!setpoint 61 tientallen
	FTCHD	STP61_2	!setpoint 61 honderdtallen
	FTCHD	STP61_3	!setpoint 61 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12636	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12655

	AND	RESULT1	!F=C
	FTCHD	STP62_0	!setpoint 62 eenheden
	FTCHD	STP62_1	!setpoint 62 tientallen
	FTCHD	STP62_2	!setpoint 62 honderdtallen
	FTCHD	STP62_3	!setpoint 62 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12655	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12674

	AND	RESULT1	!F=C
	FTCHD	STP63_0	!setpoint 63 eenheden
	FTCHD	STP63_1	!setpoint 63 tientallen
	FTCHD	STP63_2	!setpoint 63 honderdtallen
	FTCHD	STP63_3	!setpoint 63 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12674	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12693

	AND	RESULT1	!F=C
	FTCHD	STP64_0	!setpoint 64 eenheden
	FTCHD	STP64_1	!setpoint 64 tientallen
	FTCHD	STP64_2	!setpoint 64 honderdtallen
	FTCHD	STP64_3	!setpoint 64 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12693	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12712

	AND	RESULT1	!F=C
	FTCHD	STP65_0	!setpoint 65 eenheden
	FTCHD	STP65_1	!setpoint 65 tientallen
	FTCHD	STP65_2	!setpoint 65 honderdtallen
	FTCHD	STP65_3	!setpoint 65 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12712	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12731

	AND	RESULT1	!F=C
	FTCHD	STP66_0	!setpoint 66 eenheden
	FTCHD	STP66_1	!setpoint 66 tientallen
	FTCHD	STP66_2	!setpoint 66 honderdtallen
	FTCHD	STP66_3	!setpoint 66 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12731	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12750

	AND	RESULT1	!F=C
	FTCHD	STP67_0	!setpoint 67 eenheden
	FTCHD	STP67_1	!setpoint 67 tientallen
	FTCHD	STP67_2	!setpoint 67 honderdtallen
	FTCHD	STP67_3	!setpoint 67 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12750	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12769

	AND	RESULT1	!F=C
	FTCHD	STP68_0	!setpoint 68 eenheden
	FTCHD	STP68_1	!setpoint 68 tientallen
	FTCHD	STP68_2	!setpoint 68 honderdtallen
	FTCHD	STP68_3	!setpoint 68 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12769	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12788

	AND	RESULT1	!F=C
	FTCHD	STP69_0	!setpoint 69 eenheden
	FTCHD	STP69_1	!setpoint 69 tientallen
	FTCHD	STP69_2	!setpoint 69 honderdtallen
	FTCHD	STP69_3	!setpoint 69 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12788	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12807

	AND	RESULT1	!F=C
	FTCHD	STP70_0	!setpoint 70 eenheden
	FTCHD	STP70_1	!setpoint 70 tientallen
	FTCHD	STP70_2	!setpoint 70 honderdtallen
	FTCHD	STP70_3	!setpoint 70 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12807	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12826

	AND	RESULT1	!F=C
	FTCHD	STP71_0	!setpoint 71 eenheden
	FTCHD	STP71_1	!setpoint 71 tientallen
	FTCHD	STP71_2	!setpoint 71 honderdtallen
	FTCHD	STP71_3	!setpoint 71 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12826	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12845

	AND	RESULT1	!F=C
	FTCHD	STP72_0	!setpoint 72 eenheden
	FTCHD	STP72_1	!setpoint 72 tientallen
	FTCHD	STP72_2	!setpoint 72 honderdtallen
	FTCHD	STP72_3	!setpoint 72 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12845	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12864

	AND	RESULT1	!F=C
	FTCHD	STP73_0	!setpoint 73 eenheden
	FTCHD	STP73_1	!setpoint 73 tientallen
	FTCHD	STP73_2	!setpoint 73 honderdtallen
	FTCHD	STP73_3	!setpoint 73 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12864	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12883

	AND	RESULT1	!F=C
	FTCHD	STP74_0	!setpoint 74 eenheden
	FTCHD	STP74_1	!setpoint 74 tientallen
	FTCHD	STP74_2	!setpoint 74 honderdtallen
	FTCHD	STP74_3	!setpoint 74 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12883	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12902

	AND	RESULT1	!F=C
	FTCHD	STP75_0	!setpoint 75 eenheden
	FTCHD	STP75_1	!setpoint 75 tientallen
	FTCHD	STP75_2	!setpoint 75 honderdtallen
	FTCHD	STP75_3	!setpoint 75 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12902	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12921

	AND	RESULT1	!F=C
	FTCHD	STP76_0	!setpoint 76 eenheden
	FTCHD	STP76_1	!setpoint 76 tientallen
	FTCHD	STP76_2	!setpoint 76 honderdtallen
	FTCHD	STP76_3	!setpoint 76 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12921	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12940

	AND	RESULT1	!F=C
	FTCHD	STP77_0	!setpoint 77 eenheden
	FTCHD	STP77_1	!setpoint 77 tientallen
	FTCHD	STP77_2	!setpoint 77 honderdtallen
	FTCHD	STP77_3	!setpoint 77 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12940	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12959

	AND	RESULT1	!F=C
	FTCHD	STP78_0	!setpoint 78 eenheden
	FTCHD	STP78_1	!setpoint 78 tientallen
	FTCHD	STP78_2	!setpoint 78 honderdtallen
	FTCHD	STP78_3	!setpoint 78 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12959	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12978

	AND	RESULT1	!F=C
	FTCHD	STP79_0	!setpoint 79 eenheden
	FTCHD	STP79_1	!setpoint 79 tientallen
	FTCHD	STP79_2	!setpoint 79 honderdtallen
	FTCHD	STP79_3	!setpoint 79 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12978	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L12997

	AND	RESULT1	!F=C
	FTCHD	STP80_0	!setpoint 80 eenheden
	FTCHD	STP80_1	!setpoint 80 tientallen
	FTCHD	STP80_2	!setpoint 80 honderdtallen
	FTCHD	STP80_3	!setpoint 80 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L12997	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13016

	AND	RESULT1	!F=C
	FTCHD	STP81_0	!setpoint 81 eenheden
	FTCHD	STP81_1	!setpoint 81 tientallen
	FTCHD	STP81_2	!setpoint 81 honderdtallen
	FTCHD	STP81_3	!setpoint 81 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13016	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13035

	AND	RESULT1	!F=C
	FTCHD	STP82_0	!setpoint 82 eenheden
	FTCHD	STP82_1	!setpoint 82 tientallen
	FTCHD	STP82_2	!setpoint 82 honderdtallen
	FTCHD	STP82_3	!setpoint 82 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13035	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13054

	AND	RESULT1	!F=C
	FTCHD	STP83_0	!setpoint 83 eenheden
	FTCHD	STP83_1	!setpoint 83 tientallen
	FTCHD	STP83_2	!setpoint 83 honderdtallen
	FTCHD	STP83_3	!setpoint 83 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13054	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13073

	AND	RESULT1	!F=C
	FTCHD	STP84_0	!setpoint 84 eenheden
	FTCHD	STP84_1	!setpoint 84 tientallen
	FTCHD	STP84_2	!setpoint 84 honderdtallen
	FTCHD	STP84_3	!setpoint 84 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13073	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13092

	AND	RESULT1	!F=C
	FTCHD	STP85_0	!setpoint 85 eenheden
	FTCHD	STP85_1	!setpoint 85 tientallen
	FTCHD	STP85_2	!setpoint 85 honderdtallen
	FTCHD	STP85_3	!setpoint 85 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13092	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13111

	AND	RESULT1	!F=C
	FTCHD	STP86_0	!setpoint 86 eenheden
	FTCHD	STP86_1	!setpoint 86 tientallen
	FTCHD	STP86_2	!setpoint 86 honderdtallen
	FTCHD	STP86_3	!setpoint 86 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13111	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13130

	AND	RESULT1	!F=C
	FTCHD	STP87_0	!setpoint 87 eenheden
	FTCHD	STP87_1	!setpoint 87 tientallen
	FTCHD	STP87_2	!setpoint 87 honderdtallen
	FTCHD	STP87_3	!setpoint 87 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13130	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13149

	AND	RESULT1	!F=C
	FTCHD	STP88_0	!setpoint 88 eenheden
	FTCHD	STP88_1	!setpoint 88 tientallen
	FTCHD	STP88_2	!setpoint 88 honderdtallen
	FTCHD	STP88_3	!setpoint 88 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13149	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13168

	AND	RESULT1	!F=C
	FTCHD	STP89_0	!setpoint 89 eenheden
	FTCHD	STP89_1	!setpoint 89 tientallen
	FTCHD	STP89_2	!setpoint 89 honderdtallen
	FTCHD	STP89_3	!setpoint 89 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13168	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13187

	AND	RESULT1	!F=C
	FTCHD	STP90_0	!setpoint 90 eenheden
	FTCHD	STP90_1	!setpoint 90 tientallen
	FTCHD	STP90_2	!setpoint 90 honderdtallen
	FTCHD	STP90_3	!setpoint 90 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13187	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13206

	AND	RESULT1	!F=C
	FTCHD	STP91_0	!setpoint 91 eenheden
	FTCHD	STP91_1	!setpoint 91 tientallen
	FTCHD	STP91_2	!setpoint 91 honderdtallen
	FTCHD	STP91_3	!setpoint 91 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13206	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13225

	AND	RESULT1	!F=C
	FTCHD	STP92_0	!setpoint 92 eenheden
	FTCHD	STP92_1	!setpoint 92 tientallen
	FTCHD	STP92_2	!setpoint 92 honderdtallen
	FTCHD	STP92_3	!setpoint 92 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13225	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13244

	AND	RESULT1	!F=C
	FTCHD	STP93_0	!setpoint 93 eenheden
	FTCHD	STP93_1	!setpoint 93 tientallen
	FTCHD	STP93_2	!setpoint 93 honderdtallen
	FTCHD	STP93_3	!setpoint 93 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13244	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13263

	AND	RESULT1	!F=C
	FTCHD	STP94_0	!setpoint 94 eenheden
	FTCHD	STP94_1	!setpoint 94 tientallen
	FTCHD	STP94_2	!setpoint 94 honderdtallen
	FTCHD	STP94_3	!setpoint 94 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13263	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13282

	AND	RESULT1	!F=C
	FTCHD	STP95_0	!setpoint 95 eenheden
	FTCHD	STP95_1	!setpoint 95 tientallen
	FTCHD	STP95_2	!setpoint 95 honderdtallen
	FTCHD	STP95_3	!setpoint 95 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13282	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13301

	AND	RESULT1	!F=C
	FTCHD	STP96_0	!setpoint 96 eenheden
	FTCHD	STP96_1	!setpoint 96 tientallen
	FTCHD	STP96_2	!setpoint 96 honderdtallen
	FTCHD	STP96_3	!setpoint 96 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13301	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13320

	AND	RESULT1	!F=C
	FTCHD	STP97_0	!setpoint 97 eenheden
	FTCHD	STP97_1	!setpoint 97 tientallen
	FTCHD	STP97_2	!setpoint 97 honderdtallen
	FTCHD	STP97_3	!setpoint 97 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13320	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13339

	AND	RESULT1	!F=C
	FTCHD	STP98_0	!setpoint 98 eenheden
	FTCHD	STP98_1	!setpoint 98 tientallen
	FTCHD	STP98_2	!setpoint 98 honderdtallen
	FTCHD	STP98_3	!setpoint 98 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L13356

L13339	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L13356

	AND	RESULT1	!F=C
	FTCHD	STP99_0	!setpoint 99 eenheden
	FTCHD	STP99_1	!setpoint 99 tientallen
	FTCHD	STP99_2	!setpoint 99 honderdtallen
	FTCHD	STP99_3	!setpoint 99 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.
L13356	NOP	94
!                               DR_WIZCN
!				********
!
	AND	VERGR29
	OR	VERGR30
  EQL DUMP_1

	AND	000.1
  FTCHB V1_1_O  !eindschak.afsluiter V 1.1 geopend
  FTCHB V1_1_C  !eindschak.afsluiter V 1.1 gesloten
  FTCHB DUMP_1
	FTCHB	V1_1
	STRD	3001

	AND	VERGR13
	OR	VERGR14
  EQL DUMP_1

	AND	000.1
  FTCHB V10_1_O !eindschak.afsluiter V10.1 geopend
  FTCHB V10_1_C !eindschak.afsluiter V10.1 gesloten
  FTCHB DUMP_1
	FTCHB	V10_1
	STRD	3002

	AND	VERGR15
	OR	VERGR16
  EQL DUMP_1

	AND	000.1
  FTCHB V10_2_O !eindschak.afsluiter V10.2 geopend
  FTCHB V10_2_C !eindschak.afsluiter V10.2 gesloten
  FTCHB DUMP_1
	FTCHB	V10_2
	STRD	3003

	AND	VERGR17
	OR	VERGR18
  EQL DUMP_1

	AND	000.1
  FTCHB V10_3_O !eindschak.afsluiter V10.3 geopend
  FTCHB V10_3_C !eindschak.afsluiter V10.3 gesloten
  FTCHB DUMP_1
	FTCHB	V10_3
	STRD	3004

	AND	VERGR19
	OR	VERGR20
  EQL DUMP_1

	AND	000.1
  FTCHB V10_4_O !eindschak.afsluiter V10.4 geopend
  FTCHB V10_4_C !eindschak.afsluiter V10.4 gesloten
  FTCHB DUMP_1
	FTCHB	V10_4
	STRD	3005

	AND	VERGR21
	OR	VERGR22
  EQL DUMP_1

	AND	000.1
  FTCHB V11_1_O !eindschak.afsluiter V11.1 geopend
  FTCHB V11_1_C !eindschak.afsluiter V11.1 gesloten
  FTCHB DUMP_1
	FTCHB	V11_1
	STRD	3006

	AND	VERGR27
	OR	VERGR28
  EQL DUMP_1

	AND	000.1
  FTCHB V12_1_O !eindschak.afsluiter V12.1 geopend
  FTCHB V12_1_C !eindschak.afsluiter V12.1 gesloten
  FTCHB DUMP_1
	FTCHB	V12_1
	STRD	3007

	AND	VERGR31
	OR	VERGR32
  EQL DUMP_1

	AND	000.1
  FTCHB V3_1_O  !eindschak.afsluiter V 3.1 geopend
  FTCHB V3_1_C  !eindschak.afsluiter V 3.1 gesloten
  FTCHB DUMP_1
	FTCHB	V3_1
	STRD	3008

	AND	VERGR33
	OR	VERGR34
  EQL DUMP_1

	AND	000.1
  FTCHB V5_1_O  !eindschak.afsluiter V 5.1 geopend
  FTCHB V5_1_C  !eindschak.afsluiter V 5.1 gesloten
  FTCHB DUMP_1
	FTCHB	V5_1
	STRD	3009

	AND	VERGR35
	OR	VERGR36
  EQL DUMP_1

	AND	000.1
  FTCHB V7_1_O  !eindschak.afsluiter V 7.1 geopend
  FTCHB V7_1_C  !eindschak.afsluiter V 7.1 gesloten
  FTCHB DUMP_1
	FTCHB	V7_1
	STRD	3010

	AND	000.1
	FTCHB	V1_2
	STRD	3202

	AND	000.1
	FTCHB	V1_3
	STRD	3203

	AND	000.1
	FTCHB	V10_4
	STRD	3204

	AND	000.1
	FTCHB	V12_2
	STRD	3205

	AND	000.1
	FTCHB	V12_3
	STRD	3206

	AND	000.1
  FTCHB V13_1__2
	STRD	3207

	AND	000.1
  FTCHB V13_1__2
	STRD	3208

	AND	000.1
	FTCHB	V3_2
	STRD	3209

	AND	000.1
	FTCHB	V3_3
	STRD	3210

	AND	000.1
	FTCHB	V5_2
	STRD	3211

	AND	000.1
	FTCHB	V5_3
	STRD	3212

	AND	000.1
	FTCHB	V7_2
	STRD	3213

	AND	000.1
	FTCHB	V9_1
	STRD	3214

	AND	000.1
	FTCHB	V9_2
	STRD	3215

	AND	000.1
	FTCHB	V9_3
	STRD	3216

	AND	000.1
	FTCHB	VERGR37	!hoge druk alarm P10
	STRD	3200

	AND	000.1
	FTCHB	VERGR01
	STRD	3201

	AND	000.1
  FTCHB POMP_P10
	FTCHB	VERGR39
	STRD	3000

	AND	000.1
	FTCHD	FLW00_2	!MSB +
	FTCHD	FLW00_1	!| flow reinwater
	FTCHD	FLW00_0	!LSB +
	STRD	3102
	STRD	3103
	STRD	3104

	AND	000.1
	FTCHD	FLW01_2	!MSB +
	FTCHD	FLW01_1	!| flow ruwwater
	FTCHD	FLW01_0	!LSB +
	STRD	3105
	STRD	3106
	STRD	3107

	AND	000.1
	FTCHD	FLW02_2	!MSB +
	FTCHD	FLW02_1	!| flow concentraat
	FTCHD	FLW02_0	!LSB +
	STRD	3108
	STRD	3109
	STRD	3110

	AND	000.1
	FTCHD	GEL00_2	!MSB +
	FTCHD	GEL00_1	!| geleidbaarheid reinwater
	FTCHD	GEL00_0	!LSB +
	STRD	3111
	STRD	3112
	STRD	3113

	AND	000.1
	FTCHD	GEL01_2	!MSB +
	FTCHD	GEL01_1	!| geleidbaarheid spoelleiding
	FTCHD	GEL01_0	!LSB +
	STRD	3114
	STRD	3115
	STRD	3116

	AND	000.1
	FTCHD	DSP35_2	!display 35 honderdtallen
	FTCHD	DSP35_1	!display 35 tientallen
	FTCHD	DSP35_0	!display 35 eenheden
	STRD	3120
	STRD	3121
	STRD	3122

	AND	000.1
	FTCHB	VERGR02	!stuurlucht gestoord
	STRD	3220

	AND	000.1
	FTCHB	VERGR03	!stuurspanning gestoord
	STRD	3221

	AND	000.1
	FTCHB	VERGR06
	STRD	3222

	AND	000.1
	FTCHB	VERGR07
	STRD	3223

	AND	000.1
	FTCHB	VERGR08
	STRD	3224

	AND	000.1
	FTCHB	VERGR41
	STRD	3225

	AND	000.1
	FTCHB	VERGR44	!rho proceswater
	STRD	3226

	AND	000.1
	FTCHB	VERGR45	!lage flow alarm vuilproceswater
	STRD	3227

	AND	000.1
	FTCHB	VERGR46	!regeneratie cmf niet op tijd gevuld
	STRD	3228

	AND	000.1
	FTCHB	VERGR47	!regeneratie cmf niet op tijd geledigd
	STRD	3229

	AND	BDR0B10	!bedrijfsmelding
	ANDNT	REG0B46	!openen commando V10.4
	EQL	490.1

	AND	000.1
	FTCHB	490.1
	STRD	3240

  AND BDR0I01 !bedrijfskeuze schak. "STAND_BY"
  OR  WZC0B13 !wizconcommando STAND_BY + KEUZESCHAK.=SU
	EQL	490.0

	AND	000.1
	FTCHB	490.0
	STRD	3241

	AND	000.1
	FTCHB	REG0B00	!start regen. fasen 8 t/m 33.1
	STRD	3242

	AND	000.1
	FTCHB	REG0B42	!regeneratieaanvraag
	STRD	3243

	AND	000.1
	FTCHB	REG0B46	!openen commando V10.4
	STRD	3244

	AND	000.1
	FTCHB	REG0I08	!keuzeschakelaar CMF handmatig vullen
	STRD	3245

	AND	000.1
	FTCHB	REG0I09	!keuzeschakelaar CMF handmatig ledigen
	STRD	3246

	AND	000.1
	FTCHC	00
	STRD	3123
	STRD	3124
	STRD	3126
	STRD	3127

	AND	BDR0I02	!bedrijfskeuze schak. "NORMAAL"
	FTCHC	01
	STRD	3125

  AND BDR0I01 !bedrijfskeuze schak. "STAND_BY"
	FTCHC	02
	STRD	3125

	AND	BDR0I00	!bedrijfskeuze schak. "REGENERATIE"
	FTCHC	03
	STRD	3125

  AND BDR0I03 !bedrijfskeuze schak. "MCS_400"
	FTCHC	04
	STRD	3125
	NOP	38
!                               DR_END
!				******
!
	AND	000.1
  SET0  PLCC1 !eerste PLC_cyclus hoog_signaal
	JSAT	0008