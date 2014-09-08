000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-suite-run
000013*	source name: CBU00007.cob
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
000046*> Run a suite
000047* arg1: suite-index - index of the suite to run 
000048
000049 IDENTIFICATION DIVISION.
000050 PROGRAM-ID.   CBU00007.
000051 ENVIRONMENT    DIVISION.
000052 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000072  01 str PIC X(20).
000075   01 lineToLog PIC X(255).
000089	COPY CBUC0002.
000090   LINKAGE SECTION.
000091   	COPY CBUC0001.
000092      01 i PIC 9(2).
000093      
000094 PROCEDURE DIVISION USING CBU-ctx i.      
000095  MOVE i TO index-current-suite.
000096	ADD 1 TO nb-suite-run . 
000111		CALL CBU-tests-run USING CBU-ctx.
000115  END PROGRAM CBU00007.