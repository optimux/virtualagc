### FILE="Main.annotation"
## Copyright:   Public domain.
## Filename:    R30.agc
## Purpose:     A section of Luminary revision 210.
##              It is part of the source code for the Lunar Module's (LM)
##              Apollo Guidance Computer (AGC) for Apollo 15-17.
##              This file is intended to be a faithful transcription, except
##              that the code format has been changed to conform to the
##              requirements of the yaYUL assembler rather than the
##              original YUL assembler.
## Reference:   pp. XXX-XXX
## Assembler:   yaYUL
## Contact:     Ron Burkey <info@sandroid.org>.
## Website:     www.ibiblio.org/apollo/index.html
## Mod history: 2016-11-17 JL   Created from Luminary131 version.

## NOTE: Page numbers below have yet to be updated from Luminary131 to Luminary210!


## Page 719
# SUBROUTINE NAME:  V82CALL
# MOD NO: 0					DATE: 16 FEB 67
# MOD BY: R. R. BAIRNSFATHER			LOG SECTION:  R30
# MOD NO: 1	MOD BY:  R. R. BAIRNSFATHER	DATE: 11 APR 67		SR30.1 CHANGED TO ALLOW MONITOR OPERN
# MOD NO: 2	MOD BY:  ALONSO			DATE: 11 DEC 67		VB82 PROGRAM REWRITTEN
# MOD NO: 3	MOD BY:  ALONSO			DATE: 26 MAR 68		PROG MOD TO HANDLE DIF EARTH/MOON SCALE
#
# NEW FUNCTIONAL DESCRIPTION:	CALLED BY VERB 82 ENTER.  PRIORITY 10.
# USED THROUGHOUT.		CALCULATE AND DISPLAY ORBITAL PARAMETERS
#
# 1.	IF AVERAGE G IS OFF:
#		FLASH DISPLAY V04N06.  R2 INDICATES WHICH SHIP'S STATE VECTOR IS
#			TO BE UPDATED.  INITIAL CHOICE IS THIS SHIP (R2-1).  ASTRONAUT
#			CAN CHANGE TO OTHER SHIP BY V22EXE. WHERE X IS NOT EQ 1.
#		SELECTED STATE VECTOR UPDATED BY THISPREC (OTHPREC).
#		CALLS SR30.1 (WHICH CALLS TFFCONMU + TFFRP/RA) TO CALCULATE
#			RPER (PERIGEE RADIUS), RAPO (APOGEE RADIUS), HPER (PERIGEE
#			HEIGHT ABOVE LAUNCH PAD OR LAUNAR LANDING SITE), HARD (APOGEE
#			HEIGHT AS ABOVE), TPER (TIME TO PERIGEE), TFF (TIME TO
#			INTERSECT 300 KFT ABOVE PAD OR 36KFT ABOVE LANDING SITE).
#		FLASH MONITOR V16N44 (HAPO, HPER, TFF).  TFF IS -59MS59S IF IT WAS
#			NOT COMPUTABLE, OTHERWISE IT INCREMENTS ONCE PER SECOND.
#			ASTRONAUT HAS OPTION TO MONITOR TPER BY KING IN N 32 E.
#			DISPLAY IS IN HMS, IS NEGATIVE (AS WAS TFF), AND INCREMENTS
#			ONCE PER SECOND ONLY IF TFF DISPLAY WAS -59M59S.
#	2.	IF AVERAGE G IS ON:
#			CALLS SR30.1 APPROX EVERY TWO SECS.  STATE VECTOR IS ALWAYS
#				FOR THIS VEHICLE.  V82 DOES NOT DISTURB STATE VECTOR.  RESULTS
#				OF SR30.1 ARE RAPO, RPER, HAPO, HPER, TPER, TFF.
#			FLASH MONITOR V16N44 (HAPO, HPER, TFF).
#	ADDENDUM:  HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
#		ABOVE REMARKS.
#
# CALLING SEQUENCE: VERB 82 ENTER.
#
# SUBROUTINES CALLED:	SR30.1, GOXDSPF
#			MAYBE -- THISPREC, OTHPREC, LOADTIME, DELRSPL
#
# NORMAL EXIT MODES:  tc endext
#
# ALARMS:  NONE
#
# OUTPUT:	HAPOX	(-29) M
#		HPERX	(-29) M
#		RAPO	(-29) M EARTH
#			(-27) M MOON
#		RPER	(-29) M EARTH
#			(-27) M MOON
#		TFF	(-28) CS	CONTAINS NEGATIVE QUANTITY
#		-TPER	(-28) CS	CONTAINS NEGATIVE QUANTITY
#
## Page 720
# ERASABLE INITIALIZATION REQUIRED:  STATE VECTOR.
#
# DEBRIS:	QPRET, RONE, VONE, TFF/RTMU, HPERMIN, RPADTEM, V82EMFLG.
#		MAYBE:  TSTART82, V82FLAGS, TDEC1.

		EBANK=	HAPOX
		BANK	31
		SETLOC	R30LOC
		BANK
		COUNT*	$$/R30

V82CALL		TC	INTPRET
		BON	GOTO
			AVEGFLAG
			V82GON		# IF AVERAGE G ON
			V82GOFF		# IF AVERAGE G OFF

V82GOFF		EXIT			# ALLOW ASTRONAUT TO SELECT VEHICLE
		CAF	TWO		# DESIRED FOR ORBITAL PARAMETERS
		TS	OPTIONX		# CALCULATION AND DISPLAY.
		CAF	ONE
		TS	OPTIONX +1
		CAF	OPTIONVN	# V 04 N 06
		TC	BANKCALL
		CADR	GOXDSPF
		TC	ENDEXT		# TERMINATE
		TC	+2		# PROCEED
		TC	-5		# DATA IN.  OPTION1+1 = 1 FOR THIS VEHICLE
					#		UNEQ 1 FOR OTHER VEHICLE
		CAF	BIT4		# 80 MS
		TC	WAITLIST
		EBANK=	TFF
		2CADR	TICKTEST

		RELINT
V82GOFLP	CAF	TFFBANK		# MAJOR RECYCLE LOOP ENTRY
		TS	EBANK
		CAF	ZERO
		TS	V82FLAGS	# ZERO FLAGS FOR TICKTEST, INHIBITS
					# DECREMENTING OF TFF AND -TPER.
		CAF	PRIO7
		TC	FINDVAC		# V82GOFF1 WILL EXECUTE STATE VECTOR
		EBANK=	TFF		# UPDATE AND ORBIT CALCULATIONS FOR
		2CADR	V82GOFF1	# SELECTED VEHICLE ABOUT PROPER BODY.

		RELINT
V82STALL	CAF	THREE		# STALL IN THIS LOOP AND WITHOLD V 16 N 44
## Page 721
		MASK	V82FLAGS	# UNTIL STATE VECTOR UPDATE SETS ONE OF
		CCS	A		# OUR FLAG BITS.
		TC	FLAGGON		# EXIT FROM STALL LOOP.
		CAF	1SEC
		TC	BANKCALL
		CADR	DELAYJOB
		TC	V82STALL

FLAGGON		CAF	V16N44		# MONITOR HAPO,HPER,TFF.
		TC	BANKCALL
		CADR	GOXDSPF
		TC	B5OFF		# TERM. THIS TELLS TICKTEST TO KILL ITSELF
		TC	B5OFF		# PROCEED.  DITTO
		TC	V82GOFLP	# RECYCLE.  RECOMPUTE STATE VECT + DISPLAY

OPTIONVN	VN	412
V16N44		VN	1644
TFFBANK		ECADR	TFF

V82GOFF1	TC	INTPRET
		RTB
			LOADTIME
		STORE	TDEC1		# TIME FOR STATE VECTOR UPDATE.
		STORE	TSTART82	# TIME FOR INTERNAL USE.
		EXIT
		CS	OPTIONX +1	# 1 FOR THIS VEHICLE, NOT 1 FOR OTHER.
		AD	ONE
		EXTEND
		BZF	THISSHIP
OTHSHIP		TC	INTPRET
		CALL			# CALL STATE VECTOR UPDATE FOR OTHER SHIP.
			OTHPREC
BOTHSHIP	VLOAD			# MOVE RESULTS INTO TFFCONIC STORAGE AREAS
			RATT		# TO BE CALLED BY SR30.1.
		STOVL	RONE		# RATT AT (-29)M FOR EARTH OR MOON.
			VATT
		STORE	VONE		# VATT AT (-7)M/CS FOR EARTH OR MOON
		DLOAD*
			1/RTMUE,2	# X2 IS 0 FOR EARTH CENTERED STATE VEC
		STORE	TFF/RTMU	# X2 IS 2 FOR MOON
		DLOAD*			# AS LEFT BY THISPREC OR OTHPREC.
			MINPERE,2
		STORE	HPERMIN		# TFFRTMU, HPERMIN, AND RPADTEM ARE ALL
		SLOAD	BHIZ		# EARTH/MOON PARAMETERS AS SET HERE.
			X2
			EARTHPAD
		GOTO
			MOONPAD
## Page 722
THISSHIP	TC	INTPRET
		CALL			# CALL STATE VECTOR UPDATE FOR THIS SHIP.
			THISPREC
		GOTO
			BOTHSHIP

# THE FOLLOWING CONSTANTS ARE PAIRWISE INDEXED.  DO NOT SEPARATE PAIRS.

MINPERM		2DEC	10668 B-27	# 35 KFT MIN PERIGEE HEIGHT FOR MOON(-27)M
MINPERE		2DEC	91440 B-29	# 300 KFT (-29)M FOR EARTH

EARTHPAD	DLOAD	CLRGO		# PAD 37-B RADIUS.  SCALED AT (-29)M
			RPAD
			V82EMFLG	# INDICATE EARTH SCALING FOR SR30.1
			BOTHPAD

MOONPAD		VLOAD	ABVAL		# COMPUTE MOON PAD RADIUS FROM RLS VECTOR.
			RLS		# SCALED AT (-27)M
		SET
			V82EMFLG	# INDICATE MOON SCALILNG FOR SR30.1
BOTHPAD		STCALL	RPADTEM
			SR30.1		# CALCULATE ORBITAL PARAMETERS
		RTB	DSU
			LOADTIME
			TSTART82	# PRESENT TIME -- TIME V82GOFF1 BEGAN
		STORE	TSTART82	#                 SAVE IT
		DLOAD	BZE		# SR30.1 SETS -TPER=0 IF HPER L/
			-TPER		# HPERMIN (300 OR 35) KFT.
			TICKTIFF	# (-TPER = 0)
TICKTPER	DLOAD	DAD		# (-TPER NON ZERO) TFF WAS NOT COMPUTED.
			-TPER		# BUT WAS SET TO 59M59S.  DON'T DICK TFF, DO
			TSTART82	# TICK -TPER.  DISPLAY BOTH.
		STORE	-TPER		# -TPER CORRECTED FOR TIME SINCE V82GOFF1
		EXIT			# BEGAN
		CAF	BIT1
		TS	V82FLAGS	# INFORMS TICKTEST TO INCREMENT ONLY -TPER
		TC	ENDOFJOB

TICKTIFF	DLOAD	DAD		# (-TPER=0) TFF WAS COMPUTED.  TICK TFF.
			TFF		# DO NOT TICK -TPER.  DISPLAY TFF, BUT NOT
			TSTART82	# -TPER.
		STORE	TFF		# TFF CORRECTED FRO TIME SINCE V82GOFF1
		EXIT			# BEGAN.
		CAF	BIT2
		TS	V82FLAGS	# INFORMS TICKTEST TO INCREMENT ONLY TFF.
		TC	ENDOFJOB

## Page 723
TICKTEST	CAF	BIT5		# THIS WAITLIST PROGRAM PERPETUATES ITSELF
		MASK	EXTVBACT	# ONCE A SEC UNTIL BIT 5 OF EXTVBACT =0.
		CCS	A
		TC	DOTICK
		CAF	PRIO25
		TC	NOVAC		# TERMINATE V 82.  CAN'T CALL ENDEXT IN RUPT.
		EBANK=	EXTVBACT
		2CADR	ENDEXT

		TC	TASKOVER
DOTICK		CAF	1SEC		# RE-REQUEST TICKTEST.
		TC	WAITLIST
		EBANK=	TFF
		2CADR	TICKTEST

		CAF	THREE
		MASK	V82FLAGS
		INDEX	A
		TC	+1
		TC	TASKOVER	# IF NO FLAGBITS SET DONT' CHANGE TFF OR
					# -TPER, BUT CONTINUE LOOP.
		TC	TPERTICK	# ONLY BIT 1 SET.  INCR -TPER BY 1 SEC.
TFFTICK		CAF	1SEC		# ONLY BIT 2 SET.  INCR TFF BY 1 SEC.
		TS	L
		CAF	ZERO
		DAS	TFF
		TC	TASKOVER
TPERTICK	CAF	1SEC
		TS	L
		CAF	ZERO
		DAS	-TPER
		TC	TASKOVER

## Page 724
V82GON		EXIT			# AVERAGE G ON.  USE CURRENT STATE VECTOR
					# FOR ORBITAL PARAMETER CALCULATIONS.
		CAF	PRIO7		# LESS THAN LAMBERT
		TC	FINDVAC		# V82GON1 WILL PERFORM ORBIT CALCULATIONS
		EBANK=	TFF		# ABOUT PROPER BODY APPROX ONCE PER SEC.
		2CADR	V82GON1

		RELINT
		CCS	NEWJOB		# WITHOLD V16 N44 UNTIL FIRST ORBIT CALC
		TC	CHANG1		# IS DONE.  NOTE:  V82GON1 (PRIO7, FINDVAC
					# JOB) IS COMPLETED BEFORE V82GON (PRIO7,
					# NOVAC JOB).
V82REDSP	CAF	V16N44		# MONITOR HAPO, HPER, TFF
		TC	BANKCALL
		CADR	GOXDSPF
		TC	B5OFF		# TERM THIS TELLS V82GON1 TO KILL ITSELF.
		TC	B5OFF		# PROC DITTO.
		TC	V82REDSP	# RECYCLE

V82GON1		TC	INTPRET		# THIS EXEC PROGRAM PERPETUATES ITSELF
					# ONCE A SEC UNTIL BIT 5 OF EXTVBACT =0.
		VLOAD	GOTO		# HOLDS OFF CCS NEWJOB BETWEEN RN AND
			RN		# VN FETCH SO RN, VN ARE FROM SAME
			NEXTLINE	# STATE VECTOR UPDATE.
NEXTLINE	STOVL	RONE		# RN AT (-29)M FOR EARTH OR MOON
			VN
		STORE	VONE		# VN AT (-7)M/CS FOR EARTH OR MOON
		BON	GOTO
			MOONTHIS	# FLAG INDICATES BODY ABOUT WHICH ORBITAL
			MOONGON		# CALCULATIONS ARE TO BE PERFORMED.
			EARTHGON	# IF SET -- MOON, IF RESET --EARTH.

MOONGON		SET	DLOAD
			V82EMFLG	# FLAG INDICATES BODY ABOUT WHICH ORBITAL
			1/RTMUM		# LUNAR PARAMETERS LOADED HERE FOR SR30.1
		STODL	TFF/RTMU
			MINPERM
		STOVL	HPERMIN
			RLS		# SCALED AT (-27)M
		ABVAL	GOTO
			V82GON2
EARTHGON	CLEAR	DLOAD
			V82EMFLG	# INDICATE EARTH SCALING FOR SR30.1
			1/RTMUE		# EARTH PARAMETERS LOADED HERE FOR SR30.1
		STODL	TFF/RTMU
			MINPERE
		STODL	HPERMIN
			RPAD
V82GON2		STCALL	RPADTEM		# COMMON CODE FOR EARTH & MOON.
			SR30.1
## Page 725
		EXIT
V82GON3		CAF	BIT5
		MASK	EXTVBACT	# SEE IF ASTRONAUT HAS SIGNALLED TERMINATE
		EXTEND
		BZF	ENDEXT		# YES, TERMINATE VB 82 LOOP
		CAF	1SEC
		TC	BANKCALL	# WAIT ONE SECOND BEFORE REPEATING
		CADR	DELAYJOB	# ORBITAL PARAMETER COMPUTATION.
		TC	V82GON1

SPLRET		=	V82GON3

## Page 726
# SUBROUTINE NAME: SR30.1
# MOD NO: 0								DATE: 16 FEB 67
# MOD BY: R. R. BAIRNSFATHER						LOG SECTION: R32
# MOD NO: 1	MOD BY: R. R. BAIRNSFATHER	DATE: 11 APR 67		SR30.1 CHANGED TO ALLOW MONITOR OPERN
# MOD NO: 2	MOD BY: R. R. BAIRNSFATHER	DATE: 14 APR 67		ADD OVFL CK FOR RAPO
# MOD NO: 3	MOD BY ALONSO			DATE: 11 DEC 67		SUBROUTINE REWRITTEN
# MOD NO: 4	MOD BY ALONSO			DATE: 26 MAR 68		PROG MOD TO HANDLE DIF EARTH/MOON SCALE
# MOD NO: 5	MOD BY: R. R. BAIRNSFATHER	DATE: 6 AUG 68		OVFL CK FOR HAPO & HPER. VOIDS MOD #2.
#
# NEW FUNCTIONAL DESCRIPTION:  ORBITAL PARAMETERS DISPLAY FOR NOUNS 32 AND 44.
# SR30.1 CALLS TFFCONMU AND TFFRP/RA TO CALCULATE RPER (PERIGEE RADIUS),
# RAPO (APOGEE RADIUS), HPER (PERIGEE HEIGHT ABOVE LAUNCH PAD OR LUNAR
# LANDING SITE), HAPO (APOGEE HEIGHT AS ABOVE), TPER (TIME TO PERIGEE),
# TFF (TIME TO INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
# IF HPER IS GREATER THAN OR EQUAL TO HPERMIN, CALCULATES TPER AND STORES
# NEGATIVE.  IN -TPER.  OTHERWISE STORES +0 IN -TPER.  WHENEVER TPER IS
# CALCULATED, TFF IS NOT COMPUTABLE AND DEFAULTS TO -59MIN 59SEC.  IF HAPO
# WOULD EXCEED 9999.9 NM, IT IS LIMITED TO THAT VALUE FOR DISPLAY.
#
# ADDENDUM:	HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
#		ABOVE REMARKS.
#
# CALLING SEQUENCE:	CALL
#				SR30.1
#
# SUBROUTINES CALLED:	TFFCONMU, TFFRP/RA, CALCTPER, CALCTFF
#
# NORMAL EXIT MODE:	CALLING LINE +1 (STILL IN INTERPRETIVE MODE)
#
# ALARMS:	NONE
#
# OUTPUT:	RAPO	(-29) M EARTH	APOGEE RADIUS	EARTH CENTERED COORD.
#			(-27) M MOON			MOON CENTERED COORD.
#		RPER	(-29) M EARTH	PERIGEE RADIUS	EARTH CENTERED COORD.
#			(-27) M MOON			MOON CENTERED COORD.
#		HAPOX	(-29) M		APOGEE ALTITUDE ABOVE PAD OR LAND. SITE MAX VALUE LIMITED TO 9999.9 NM.
#		HPERX	(-29) M		PERIGEE ALT. ABOVE PAD OR LAND. SITE    MAX VALUE LIMITED TO 9999.9 NM.
#		TFF	(-28) CS	TIME TO 300KFT OR 35KFT ALTITUDE
#		-TPER	(-28) CS	TIME TO PERIGEE
#
# ERASABLE INITIALIZATION REQUIRED --
#	TFF/RTMU	(+17) EARTH	RECIPROCAL OF PROPER GRAV CONSTANT FOR
#			(+14) MOON	EARTH OR MOON = 1/SQRT(MU).
#	RONE		(-29) M		STATE VECTOR
#	VONE		(-7) M/CS	STATE VECTOR
#	RPADTEM		(-29) M EARTH	RADIUS OF LAUNCH PAD OR LUNAR LANDING
#			(-27) M MOON	SITE.
#	HPERMIN		(-29) M EARTH	(300 OR 35) KFT MINIMUM PERIGEE ALTITUDE
#			(-27) M MOON	ABOVE LAUNCH PAD OR LUNAR LANDING SITE.
#	V82EMFLG	(INT SW BIT)	RESET FOR EARTH, SET FOR MOON.
#
# DEBRIS:	QPREG, PDL, S2

## Page 727
		COUNT*	$$/SR30S

SR30.1		SETPD	STQ		# INITIALIZE PUSHDOWN LIST.
			0
			S2
					# SR30.1 INPUT:	RONE AT (-29)M EARTH/MOON
					#		VONE AT (-7)M/CS
					# TFFCONMU, TFFRP/RA, CALCTPER, AND CALCTFF
					# CALLS REQUIRE:
					# EARTH CENTERED (NO RESCALING REQUIRED)
					#	RONE SCALED TO B-29 M
					#	VONE SCALED TO B-7 M/CS
					# MOON CENTERED (RESCALING REQUIRED)
					#	RONE SCALED TO B-27 M
					#	VONE SCALED TO B-5 M/CS
		BOFF	VLOAD
			V82EMFLG	# OFF FOR EARTH, ON FOR MOON.
			TFFCALLS
			RONE
		VSL2
		STOVL	RONE
			VONE
		VSL2
		STORE	VONE
TFFCALLS	CALL
			TFFCONMU
		CALL			# TFFRP/RA COMPUTES RAPO,RPER.
			TFFRP/RA
					# RETURNS WITH RAPO IN D(MPAC).
		DSU
			RPADTEM
		BOFF	SR2R		# NEED HAPO AT (-29)M FOR DISPLAY.
					# IF MOON CENTERED, RESCALE FROM (-27)M.
					# IF EARTH CENTERED ALREADY AT (-29)M.
			V82EMFLG
			+1
		CALL			# IF RAPO > MAXNM, SET RAPO =9999.9 NM.
			MAXCHK		# OTHERWISE STORE (RAPO-RPADTEM) IN HAPO.
STORHAPO	STODL	HAPOX
			RPER
		DSU
			RPADTEM		# GIVES HPER AT (-29)M EARTH, (-27)M MOON.
		STORE	MPAC +4		# SAVE THIS FOR COMPARISON TO HPERMIN.
		BOFF	SR2R		# NEED HPER AT (-29)M FOR DISPLAY.
					# IF MOON CENTERED, RESCALE FROM (-27)M.
					# IF EARTH CENTERED ALREADY AT (-29)M.
			V82EMFLG	# OFF FOR EARTH, ON FOR MOON.
			+1
		CALL			# IF HPER > MAXNM, SET HPER = 9999.9 NM.
			MAXCHK
## Page 728
STORHPER	STODL	HPERX		# STORE (RPER - RPADTEM) INTO HPERX.
			MPAC +4
		DSU	BPL		# HPERMIN AT (-29)M FOR EARTH, (-27)M MOON
			HPERMIN		# IF HPER L/ HPERMIN (300 OR 35) KFT,
			DOTPER		# THEN ZERO INTO -TPER.
		DLOAD	GOTO		# OTHERWISE CALCULATE TPER.
			HI6ZEROS
			SKIPTPER
DOTPER		DLOAD	CALL
			RPER
			CALCTPER
		DCOMP			# TPER IS PUT NEG INTO -TPER.
SKIPTPER	STODL	-TPER
			HPERMIN		# HPERMIN AT (-29)M FOR EARTH, (-27)M MOON
		DAD	CALL
			RPADTEM		# RPADTEM AT (-29)M FOR EARTH, (-27)M MOON
			CALCTFF		# GIVES 59M59S FOR TFF IF HPER G/
		DCOMP			# HPERMIN + RPADTEM.  (TPER WAS NON ZERO)
		STCALL	TFF		# OTHERWISE COMPUTES TFF.	(GOTO)
			S2

MAXCHK		DSU	BPL		# IF C(MPAC) > 9999.9 NM. MPAC = 9999.9 NM.
			MAXNM
			+3		# OTHERWISE C(MPAC) - B(MPAC).
		DAD	RVQ
			MAXNM
 +3		DLOAD	RVQ		# (USED BY P30 -- P37 ALSO)
 			MAXNM

MAXNM		2OCT	0106505603

## Page 729

# *** END OF KILLING .055 ***
