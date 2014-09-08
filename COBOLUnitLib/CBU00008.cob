000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-tests-run
000013* source name: CBU00008.cob
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
000046*> Run  tests
000047 IDENTIFICATION DIVISION.
000048 PROGRAM-ID.   CBU00008.
000049 ENVIRONMENT    DIVISION.
000050 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000071  01 j PIC 9(2).
000076  COPY CBUC0002.
000086 LINKAGE SECTION.
000087  COPY CBUC0001.
000088 PROCEDURE DIVISION USING CBU-ctx.
000090  PERFORM VARYING j FROM 1 BY 1
000091                  UNTIL j>nb-test-size(index-current-suite)
000101*                 MOVE 1 TO index-current-assert
000135          CALL CBU-test-run USING CBU-ctx j
000136  END-PERFORM
000137   EXIT PROGRAM.
000140 END PROGRAM CBU00008.
