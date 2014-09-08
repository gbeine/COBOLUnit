000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* source name: CBU00005.cob
000013*
000014*  Copyright (C) 2009 Hervé Vaujour
000015*
000025*  Logic name: CBU-add-test
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
000050*>
000100* Add a test
000101* arg1: Nom - Test name
000102* arg2: Desc - Test description
000103* TODO: Specify the suite where to add the test
000110  IDENTIFICATION DIVISION.
000120  PROGRAM-ID.   CBU00005.
000130  DATA DIVISION.
000140    WORKING-STORAGE SECTION.
000150    COPY CBUC0002.
000200    LINKAGE SECTION.
000201          COPY CBUC0001.
000202      01 id-suite PIC 9(2).
000210      01 Nom PIC X(20) VALUE SPACES.
000220      01 Desc PIC X(100) VALUE SPACES.
000230
000240   PROCEDURE DIVISION USING CBU-ctx id-suite Nom Desc.
000251          MOVE Nom TO TestName(id-suite,TestIndex).
000260          MOVE Desc TO TestDesc(id-suite,TestIndex).
000271          MOVE 0 TO nb-assert-run(id-suite,TestIndex).
000273          MOVE 0 TO nb-assert-succeed(id-suite,TestIndex).
000274          MOVE 0 TO nb-assert-failed(id-suite,TestIndex).
000280
000290          MOVE "ø" TO CarRetourChariot.
000331          ADD 1 TO testIndex.
000332          ADD 1 TO nb-test-size(id-suite).
000333*         DISPLAY "Suite: " id-suite ", size: "
000334*                 nb-test-size(id-suite).
000335
000340   EXIT PROGRAM.
000350  END PROGRAM CBU00005.
