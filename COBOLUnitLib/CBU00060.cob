000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-log-assert-failed
000013*	source name: CBU00060.cob
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
000046
000047*>Log an assertion failed specifying
000048* the expected result and the result returned
000049* arg1: AssertName - Assertion name that failed
000050* arg2: ResExpected - Expected result
000051* arg3: ResActual - result returned
000052 IDENTIFICATION DIVISION.
000060 PROGRAM-ID.   CBU00060.
000093 DATA DIVISION.
000094  WORKING-STORAGE SECTION.
000101  77 str1 PIC X(32000).
000102  77 str2 PIC X(32000).
000103  77 str3 PIC X(20).
000104  77 str4 PIC X(32000).
000106  77 WS-CNT1 PIC 99999.
000107  77 WS-CNT2 PIC 99999.
000108    
000109  77 WS-CNT4 PIC 99999.
000110  77 str-ptr PIC 99999.  
000111  77 WS-CNT3 PIC 99.
000112   77 LogLine PIC X(255).
000113   COPY CBUC0002.
000114   LINKAGE SECTION.
000115   77 AssertName PIC X(20).  	
000116   77 ResExpected PIC X(32000).  	
000117   77 ResActual PIC X(32000).
000118   COPY CBUC0001.   	
000122 PROCEDURE DIVISION 
000132		USING CBU-ctx AssertName ResExpected ResActual.
000144** parse to avoid blank on ResExpected
000145  MOVE 0 to WS-CNT1.
000146  INITIALIZE str1.
000147  MOVE FUNCTION Reverse(ResExpected) to str1.
000148  Inspect str1   Tallying WS-CNT1 For Leading space
000149  IF WS-CNT1 IS EQUAL TO 0 THEN
000150   Inspect str1   Tallying WS-CNT1 For Leading X"00"
000151  END-IF  
000152  Compute WS-CNT1 = length of str1 - WS-CNT1.    
000153**
000154** parse to avoid blank on ResActual 
000155  MOVE 0 to WS-CNT2.
000156  INITIALIZE str2.
000158  MOVE FUNCTION Reverse(ResActual) to str2.
000159  Inspect str2   Tallying WS-CNT2 For Leading space 
000160  IF WS-CNT2 IS EQUAL TO 0 THEN
000161   Inspect str2   Tallying WS-CNT2 For Leading X"00"
000162  END-IF
000163  Compute WS-CNT2 = length of str2 - WS-CNT2.  
000164
000165**
000166** parse to avoid blank on AssertName
000167  MOVE 0 to WS-CNT3.
000168  INITIALIZE str3.
000169  MOVE FUNCTION Reverse(AssertName) to str3.
000170  Inspect str3   Tallying WS-CNT3 For Leading space 
000171  IF WS-CNT3 IS EQUAL TO 0 THEN
000172   Inspect str3   Tallying WS-CNT3 For Leading X"00"
000173  END-IF
000174  Compute WS-CNT3 = length of str3 - WS-CNT3.  
000198
000199	STRING
000200    "assertion '" 
000201			AssertName(1:WS-CNT3)	
000202			"' failure (expected: '"
000203			ResExpected(1:WS-CNT1)
000204			"' but was '"	
000205			ResActual(1:WS-CNT2)  
000206	       		")'$" INTO str4.
000216
000217	CALL CBU-get-last-index USING CBU-ctx str4 WS-CNT4.
000219	CALL CBU-get-last-index
000220	 	USING CBU-ctx log-asserts-res str-ptr.
000221	IF str-ptr=0 THEN
000223	    ADD 1 TO str-ptr		
000227	END-IF.
000228	ADD 1 TO str-ptr
000229	STRING
000230		str4(1:WS-CNT4) INTO log-asserts-res 
000231		WITH POINTER str-ptr.
000232 	EXIT PROGRAM.
000240 END PROGRAM CBU00060.