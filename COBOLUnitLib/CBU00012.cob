000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-add-test-next
000013*	source name: CBU00012.cob
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
000046*> add test to the current suite
000047 IDENTIFICATION DIVISION.
000048 PROGRAM-ID.   CBU00012.
000049 ENVIRONMENT    DIVISION.
000050 DATA DIVISION.
000067 WORKING-STORAGE SECTION.
000068 	  01 nb-suite-pos PIC 9(2).
000070 COPY CBUC0002. 	  
000072 LINKAGE SECTION.
000073    01 Nom PIC X(20) VALUE SPACES.
000074    01 Desc PIC X(100) VALUE SPACES.
000076   COPY CBUC0001. 
000086 PROCEDURE DIVISION USING CBU-ctx Nom Desc.
000087	MOVE 0 TO nb-suite-pos.
000096*  DISPLAY "Suite Index (ds add test)="SuiteIndex.
000097  COMPUTE nb-suite-pos = SuiteIndex - 1.
000098*  DISPLAY "Add test to Suite("nb-suite-pos")" .
000103	CALL CBU-add-test USING CBU-ctx nb-suite-pos Nom Desc.	
000110 END PROGRAM CBU00012.