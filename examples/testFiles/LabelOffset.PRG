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