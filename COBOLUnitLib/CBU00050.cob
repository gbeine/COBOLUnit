000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-log-assert-succeed
000013*	source name: CBU00050.cob
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
000047*>Log an assertion succeed specifying
000048* arg1: AssertName - Assertion name that succeed
000049 IDENTIFICATION DIVISION.
000050 PROGRAM-ID.   CBU00050.
000096 DATA DIVISION.
000100
000101  WORKING-STORAGE SECTION.
000102   77 WS-CNT3 PIC 9999.
000103   77 CharCount3 PIC 99.
000104   77 LogLine PIC X(255).
000105   COPY CBUC0002.
000106  LINKAGE SECTION.
000107 	 77 AssertName PIC X(20).
000108 	 COPY CBUC0001. 
000109 PROCEDURE DIVISION USING CBU-ctx AssertName.
000110	INITIALIZE LogLine.
000111  PERFORM VARYING CharCount3 FROM 19 BY -1
000112		UNTIL AssertName(CharCount3:1) <> SPACE
000113	END-PERFORM
000114*	DISPLAY    
000115*     	"   Assert '" 
000116*		AssertName(1:CharCount3)	
000117*		"' Success.".  
000124*   CALL CBU-write-log-line
000125*   	USING LogLine.  
000127
000128 	EXIT PROGRAM.
000130 END PROGRAM CBU00050.