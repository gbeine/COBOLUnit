000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-display-line
000013* source name: CBU00200.cob
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
000046*>Make equals assertion for PIC 9(3)
000047* arg1: AssertName - Assertion naome
000048* arg2: ResExpected - Value expected
000049* arg3: ResActual - value returned
000050 IDENTIFICATION DIVISION.
000060 PROGRAM-ID.   CBU00102.
000093 DATA DIVISION.
000094  WORKING-STORAGE SECTION.
000096  77 CharCount3 PIC 99.
000097  77 str-res-expected PIC X(32000) VALUE SPACE.
000098  77 str-res-actual PIC X(32000) VALUE SPACE.
000099  COPY CBUC0002.
000100  LINKAGE SECTION.
000101  77 AssertName PIC X(20).
000102  77 ResExpected PIC 999.
000103  77 ResActual PIC 999.
000104  COPY CBUC0001.
000105 PROCEDURE DIVISION
000106          USING CBU-ctx AssertName ResExpected ResActual.
000108 CALL CBU-add-assert-run USING CBU-ctx AssertName.
000110  INITIALIZE str-res-expected.
000111  INITIALIZE str-res-actual.
000113  PERFORM VARYING CharCount3 FROM 19 BY -1
000114          UNTIL AssertName(CharCount3:1) <> SPACE
000115  END-PERFORM
000116  IF ResExpected <> ResActual THEN
000117   MOVE ResExpected TO str-res-expected
000118   MOVE ResActual TO str-res-actual
000120   CALL CBU-add-assert-failed
000121       USING CBU-ctx AssertName str-res-expected str-res-actual
000122   CALL CBU-log-assert-failed
000123       USING CBU-ctx AssertName str-res-expected str-res-actual
000124  ELSE
000125          CALL CBU-add-assert-succeed USING CBU-ctx AssertName
000128          CALL CBU-log-assert-succeed USING CBU-ctx AssertName
000129  END-IF.
000130  EXIT PROGRAM.
000140 END PROGRAM CBU00102.
