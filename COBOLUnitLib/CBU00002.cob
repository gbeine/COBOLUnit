000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-call-test
000013*	source name: CBU00002.cob
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
000050* Run a test
000110* arg1: NomTest-Test name to run
000120  IDENTIFICATION DIVISION.
000130  PROGRAM-ID.   CBU00002.
000140  DATA DIVISION.
000150    WORKING-STORAGE SECTION.
000161    01 LineToLog PIC X(255).
000170    01 NomRunTest  PIC X(20) VALUES SPACES.
000171    COPY CBUC0002.
000180    LINKAGE SECTION.
000190    01 NomTest PIC X(20).
000191    COPY CBUC0001.
000200
000210   PROCEDURE DIVISION USING CBU-ctx NomTest.
000230          ADD 1 TO TestRunCount
000260          MOVE NomTest TO name-current-test.
000261          INITIALIZE LineToLog.
000288          INITIALIZE LineToLog.
000289          CALL NomTest USING CBU-ctx
000290                  ON EXCEPTION CALL CBU-add-error USING CBU-ctx.
000328   EXIT PROGRAM.
000330  END PROGRAM CBU00002.
