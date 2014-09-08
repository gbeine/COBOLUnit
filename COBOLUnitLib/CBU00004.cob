000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-add-suite
000013*	source name: CBU00004.cob
000023*
000029*  Copyright (C) 2009 Hervé Vaujour
000030*
000031*  This program is free software; you can redistribute it and/or modify
000032*  it under the terms of the GNU General Public License as published by
000033*  the Free Software Foundation; either version 2 of the License, or
000034*  (at your option) any later version.
000035*
000036*  This program is distributed in the hope that it will be useful,
000037*  but WITHOUT ANY WARRANTY; without even the implied warranty of
000038*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
000039*  GNU General Public License for more details.
000040*
000041*  You should have received a copy of the GNU General Public License
000042*  along with this program; see the file COPYING. If not, write to the
000043*  Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
000044
000045
000046*>
000047* Add a suite to the cobol unit framework
000048* arg1: Nom-Suite name
000049* arg2: Desc-Suite description 
000050  IDENTIFICATION DIVISION.
000051  PROGRAM-ID.   CBU00004.
000052  DATA DIVISION.
000060    WORKING-STORAGE SECTION.
000070    COPY CBUC0002.
000117
000120    LINKAGE SECTION.
000130      	01 Nom PIC X(20) VALUE SPACES.
000140      	01 Desc PIC X(100) VALUE SPACES.
000150	  		COPY CBUC0001.
000160   PROCEDURE DIVISION USING CBU-ctx Nom Desc.
000172     IF TestIndex > 1
000180     	THEN MOVE 1 TO TestIndex
000190     END-IF.
000191      INITIALIZE SuiteName(SuiteIndex).
000192      INITIALIZE SuiteDesc(SuiteIndex).
000200      MOVE Nom TO SuiteName(SuiteIndex).
000210      Move Desc TO SuiteDesc(SuiteIndex).
000211      MOVE 0 TO suite-size(SuiteIndex).
000212      MOVE 0 TO nb-test-size(SuiteIndex).
000213      MOVE 0 TO nb-test-run(SuiteIndex).
000214      MOVE 0 TO nb-test-succeed(SuiteIndex).
000215      MOVE 0 TO nb-test-failed(SuiteIndex).
000225      MOVE 0 TO nb-test-error(SuiteIndex).
000241  	ADD 1 TO SuiteIndex.
000250 	 EXIT PROGRAM.
000260 	END PROGRAM CBU00004.  