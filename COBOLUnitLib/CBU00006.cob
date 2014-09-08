000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-suites-run
000013*	source name: CBU00006.cob
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
000046*> Run Suites test
000047 IDENTIFICATION DIVISION.
000048 PROGRAM-ID.   CBU00006.
000049 ENVIRONMENT    DIVISION.
000050 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000071   01 i PIC 9(2).
000081   01 str PIC X(32000).
000082   01 WS-CNT PIC 99999.
000090   COPY CBUC0002.
000091   LINKAGE SECTION.
000092   COPY CBUC0001.
000093 PROCEDURE DIVISION USING CBU-ctx.      
000094   PERFORM VARYING i FROM 1 BY 1 
000095		UNTIL i >= SuiteIndex
000096		INITIALIZE log-entete-suite
000097		INITIALIZE str
000099		DISPLAY "|--- " SuiteName(i)
000100		MOVE SuiteName (i) TO str 
000110		CALL CBU-suite-run USING CBU-ctx i
000115	IF nb-test-error(i) > 0 OR nb-test-failed(i) > 0 THEN
000125		DISPLAY "|--- FAILURE"
000135	ELSE 
000145	DISPLAY "|--- SUCCESS"
000146	END-IF
000147	DISPLAY ""
000151	END-PERFORM    
000152 	EXIT PROGRAM.	
000160 END PROGRAM CBU00006.