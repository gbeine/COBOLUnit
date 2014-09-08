000010*>
000020 IDENTIFICATION DIVISION.
000030 PROGRAM-ID.   CTU0S1T2.
000040 ENVIRONMENT    DIVISION.
000050 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070  WORKING-STORAGE SECTION.
000080   01 str-expected PIC X(32000).
000090   01 str-actual PIC X(32000).
000091   01 assert-name PIC X(20).
000092   01 nb-expected PIC 999.
000093   01 nb-actual PIC 999.
000094   COPY CBUC0002.
000095   LINKAGE SECTION.
000096   COPY CBUC0001.
000097 PROCEDURE DIVISION USING CBU-ctx.
000099  INITIALIZE str-expected.
000100  INITIALIZE str-actual.
000101  INITIALIZE nb-expected.
000102  INITIALIZE nb-actual.
000103  MOVE "TOTO" TO str-expected.
000104  MOVE "TOTO" TO str-actual.
000105
000106  MOVE "assert1" TO assert-name.
000107  CALL CBU-assert-str-equals USING
000108          CBU-ctx
000109          assert-name
000110          str-expected
000111          str-actual.
000112
000113  MOVE "assert2" TO assert-name.
000114  CALL CBU-assert-str-equals USING
000115          CBU-ctx
000116          assert-name
000117          str-expected
000118          str-actual.
000119
000120  MOVE "nb-assert3" TO assert-name.
000121  MOVE 3 TO nb-expected.
000122  CALL CBU-assert-nb3-equals USING
000123          CBU-ctx
000124          assert-name
000125          nb-expected
000126          nb-assert-run(1,2).
000127
000128  MOVE "assert-succes1" TO assert-name.
000129  MOVE 3 TO nb-expected.
000130  CALL CBU-assert-nb3-equals USING
000131          CBU-ctx
000132          assert-name
000133          nb-expected
000134          nb-assert-succeed(1,2).
000135
000136  MOVE "assert-succes2" TO assert-name.
000137  MOVE 4 TO nb-expected.
000138  CALL CBU-assert-nb3-equals USING
000139          CBU-ctx
000140          assert-name
000141          nb-expected
000142          nb-assert-succeed(1,2).
000143
000144  MOVE "nb-assert5" TO assert-name.
000145  MOVE 6 TO nb-expected.
000146  CALL CBU-assert-nb3-equals USING
000147          CBU-ctx
000148          assert-name
000149          nb-expected
000150          nb-assert-run(1,2).
000151
000160 END PROGRAM CTU0S1T2.
