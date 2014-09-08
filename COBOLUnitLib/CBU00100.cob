000010* COBOLUnit is a COBOL Unit framework testing
000011*
000021* Logic name: CBU-assert-str100-equals
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
000046*>Make equals assertion for PIC X(100)
000047* arg1: AssertName - Assertion naome
000048* arg2: ResExpected - Value expected
000049* arg3: ResActual - value returned
000050 IDENTIFICATION DIVISION.
000060 PROGRAM-ID.   CBU00100.
000083 DATA DIVISION.
000084  WORKING-STORAGE SECTION.
000085  77 str1 PIC X(100).
000086  77 str2 PIC X(100).
000089  77 WS-CNT1 PIC 999.
000090  77 WS-CNT2 PIC 999.
000094  COPY CBUC0002.
000095  LINKAGE SECTION.
000096  77 ResExpected PIC X(100).
000097  77 ResActual PIC X(100).
000098  77 AssertName PIC X(20).
000099   COPY CBUC0001.
000100 PROCEDURE DIVISION
000101   USING CBU-ctx AssertName ResExpected ResActual.
000102  CALL CBU-add-assert-run  USING CBU-ctx AssertName.
000103  MOVE 0 to WS-CNT1.
000104  MOVE 0 to WS-CNT2.
000107  MOVE FUNCTION Reverse(ResExpected) to str1.
000108  MOVE FUNCTION Reverse(ResExpected) to str2.
000109  Inspect str1   Tallying WS-CNT1 For Leading space
000111  IF WS-CNT1 IS EQUAL TO 0 THEN
000112   Inspect str1   Tallying WS-CNT1 For Leading X"00"
000113  END-IF
000116  Inspect str2   Tallying WS-CNT2 For Leading space
000117  IF WS-CNT2 IS EQUAL TO 0 THEN
000118   Inspect str2   Tallying WS-CNT2 For Leading X"00"
000119  END-IF
000120  Compute WS-CNT1 = length of str1 - WS-CNT1.
000123  Compute WS-CNT2 = length of str2 - WS-CNT2.
000132  IF ResExpected(1:WS-CNT1)<>ResActual(1:WS-CNT2)
000133   THEN
000134    CALL CBU-add-assert-failed
000135          USING CBU-ctx AssertName ResExpected ResActual
000137    CALL CBU-log-assert-failed
000138          USING CBU-ctx AssertName ResExpected ResActual
000139   ELSE
000140          CALL CBU-add-assert-succeed
000141                  USING CBU-ctx AssertName
000142          CALL CBU-log-assert-succeed
000143                  USING CBU-ctx AssertName
000144  END-IF.
000145  EXIT PROGRAM.
000150 END PROGRAM CBU00100.
