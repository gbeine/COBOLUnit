000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-test-run
000013* source name: CBU00009.cob
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
000046*> Run a test
000047* arg1: test-index - index of the test to run
000048 IDENTIFICATION DIVISION.
000049 PROGRAM-ID.   CBU00009.
000050 ENVIRONMENT    DIVISION.
000051 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000071   COPY CBUC0002.
000072  01 nTest PIC X(20).
000073  77 WS-CNT1 PIC 999.
000074  01 res-str PIC X(7).
000075  01 success-str PIC X(7).
000076  01 failure-str PIC X(7).
000077  01 str PIC X(20).
000078  01 log-line PIC X(32000).
000079  01 log-line-index PIC 99999.
000080  01 index1 PIC 99999.
000081  01 index2 PIC 99999.
000082  01 taille PIC 99999.
000085
000090
000096
000097   LINKAGE SECTION.
000098      COPY CBUC0001.
000099      01 index-test PIC 9(2).
000100 PROCEDURE DIVISION USING CBU-ctx index-test.
000105*  DISPLAY "Lancement du test: " index-test.
000106    MOVE "SUCCESS" TO success-str.
000107    MOVE "FAILURE" TO failure-str.
000108    MOVE index-test TO index-current-test.
000109    MOVE TestName
000110                  (index-current-suite,
000111                  index-current-test)
000112                  TO nTest
000113    MOVE 0 TO AssertTestCount
000114    MOVE 0 TO AssertFailureCount
000115    MOVE 0 to WS-CNT1
000116    MOVE function Reverse(nTest) to str
000117    Inspect str   Tallying WS-CNT1
000118          For Leading space
000119    IF WS-CNT1 IS EQUAL TO 0 THEN
000120          Inspect str Tallying WS-CNT1
000121                  For Leading X"00"
000122    END-IF
000123    Compute WS-CNT1 = length of str - WS-CNT1
000124*   INITIALIZE LineToLog
000125    INITIALIZE log-entete-test
000126    INITIALIZE log-asserts-res
000127    INITIALIZE log-fin-test
000128    INITIALIZE log-line.
000129    STRING
000130          "| Test '"
000131          nTest(1:WS-CNT1)
000132          "' is running..."
000133          INTO log-entete-test.
000134    CALL CBU-call-test USING
000135                  CBU-ctx nTest
000136                  nb-test-run(index-current-suite)
000137    ADD 1 TO nb-test-run(index-current-suite)
000138    IF nb-assert-failed(index-current-suite,
000139           index-current-test) <> 0 OR TestError > 0 THEN
000140     MOVE failure-str TO res-str
000141    ELSE MOVE success-str TO res-str
000142    END-IF
000143
000152    STRING
000153          " * " res-str" *"
000156          " ("
000157          nb-assert-run (index-current-suite,
000158           index-current-test)
000159           " Assertions, "
000160          nb-assert-failed (index-current-suite,
000161           index-current-test)
000162           " Failures. "
000163          TestError " errors)" INTO log-fin-test
000165     STRING log-entete-test log-fin-test
000166          INTO log-line
000167     CALL CBU-get-last-index USING CBU-ctx log-line log-line-index
000171     DISPLAY log-line(1:log-line-index)
000172          MOVE 1 TO index1.
000173      MOVE 1 TO index2.
000174     CALL CBU-get-last-index USING
000175                  CBU-ctx log-asserts-res log-line-index
000176*    DISPLAY log-asserts-res (1:log-line-index)
000177          Perform varying index1 from 1 by 1
000178          until index1 > log-line-index
000179          if log-asserts-res(index1:1) = "$"
000180                  COMPUTE taille = index1 - index2 - 1
000181                  ADD 1 TO index2
000182                  DISPLAY "|   " log-asserts-res(index2:taille)
000183                  MOVE index1 TO index2
000184                  ADD 1 TO index1
000185          end-if
000186          end-perform
000187          COMPUTE taille = index1 - index2 - 1
000189          ADD 1 TO index2.
000191*   DISPLAY lineToLog
000192*   MOVE lineToLog TO Log(LogListindex)
000193*   ADD 1 TO LogListIndex
000194*   CALL CBU-write-log-line USING lineToLog
000195
000196    IF AssertFailureCount <> 0 THEN
000197                  ADD 1 TO RunFailureCount
000198    ELSE
000199                  IF TestError =0 THEN
000200                          ADD 1 TO RunSuccessCount
000201                  END-IF
000202    END-IF
000203   EXIT PROGRAM.
000210 END PROGRAM CBU00009.
