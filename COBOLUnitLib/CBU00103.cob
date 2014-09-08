000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-assert-equals
000013*	source name: CBU00103.cob
000023*
000028*  Copyright (C) 2009 Hervé Vaujour
000029*
000030*  This program is free software; you can redistribute it and/or modify
000031*  it under the terms of the GNU General Public License as published by
000032*  the Free Software Foundation; either version 2 of the License, or
000033*  (at your option) any later version.
000034*
000035*  This program is distributed in the hope that it will be useful,
000036*  but WITHOUT ANY WARRANTY; without even the implied warranty of
000037*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
000038*  GNU General Public License for more details.
000039*
000040*  You should have received a copy of the GNU General Public License
000041*  along with this program; see the file COPYING. If not, write to the
000042*  Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
000043
000044
000045
000046*>Make equals assertion for pointers
000047* arg1: AssertName - Assertion naome
000048* arg2: expected-p - pointer to value expected
000049* arg3: actual-p - pointer to value actual
000050 IDENTIFICATION DIVISION.
000060 PROGRAM-ID.   CBU00103.
000083 DATA DIVISION.
000084  WORKING-STORAGE SECTION.
000091
000094  COPY CBUC0002.
000095  LINKAGE SECTION.
000096 	  01 AssertName PIC X(20).
000097 	  01 expected-p USAGE IS POINTER.
000098	  01 actual-p USAGE IS POINTER.
000099    COPY CBUC0001.  
000100 PROCEDURE DIVISION 
000101   USING CBU-ctx AssertName expected-p actual-p.
000102*  CALL CBU-add-assert-run  USING AssertName.
000130	DISPLAY "expected-p :" expected-p.
000131	DISPLAY "actual-p :" actual-p.
000132	IF expected-p=actual-p THEN
000133	  DISPLAY "EQUALITY"
000134	END-IF
000136*	IF ResExpected(1:WS-CNT1)<>ResActual(1:WS-CNT2) 
000137*	 THEN 
000138*	  CALL CBU-add-assert-failed
000139*   	USING AssertName ResExpected ResActual 		 
000140*    CALL CBU-log-assert-failed
000141*   	USING AssertName ResExpected ResActual 	
000142*	 ELSE
000143*	   	CALL CBU-add-assert-succeed
000144*	  		USING AssertName
000145*	  	CALL CBU-log-assert-succeed 
000146*	  		USING AssertName	
000147*	END-IF.
000148  EXIT PROGRAM.
000150 END PROGRAM CBU00103.