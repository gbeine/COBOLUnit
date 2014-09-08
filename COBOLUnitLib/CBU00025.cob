000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-add-assert-run
000013* source name: CBU00025.cob
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
000046
000047*>add an assertion run
000048 IDENTIFICATION DIVISION.
000050 PROGRAM-ID.   CBU00025.
000083  DATA DIVISION.
000084    WORKING-STORAGE SECTION.
000085    COPY CBUC0002.
000086    LINKAGE SECTION.
000087       COPY CBUC0001.
000088      01 AssertN PIC X(20).
000089   PROCEDURE DIVISION USING CBU-ctx AssertN.
000090*    ADD 1 TO AssertTestCount.
000093    ADD 1 TO nb-assert-run
000094          (index-current-suite, index-current-test).
000095*    MOVE AssertN TO AssertRunName
000096*      (index-current-suite,
000097*       index-current-test,
000098*       index-current-assert).
000099   EXIT PROGRAM.
000100 END PROGRAM CBU00025.
