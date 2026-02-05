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