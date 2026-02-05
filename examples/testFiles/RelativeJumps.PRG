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