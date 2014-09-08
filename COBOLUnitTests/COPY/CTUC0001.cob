000010    01 suite-name1 PIC X(20) EXTERNAL.
000011    01 suite-name2 PIC X(20) EXTERNAL.
000012    01 suite-name3 PIC X(20) EXTERNAL.
000013    01 suite-desc1 PIC X(100) EXTERNAL.
000014    01 suite-desc2 PIC X(100) EXTERNAL.
000015    01 suite-desc3 PIC X(100) EXTERNAL.
000016
000017    01 suite1-test1-name PIC X(20) EXTERNAL.
000018    01 suite1-test2-name PIC X(20) EXTERNAL.
000019    01 suite1-test3-name PIC X(20) EXTERNAL.
000020
000021    01 suite2-test1-name PIC X(20) EXTERNAL.
000022    01 suite2-test2-name PIC X(20) EXTERNAL.
000023    01 suite2-test3-name PIC X(20) EXTERNAL.
000024
000025    01 suite3-test1-name PIC X(20) EXTERNAL.
000026    01 suite3-test2-name PIC X(20) EXTERNAL.
000027    01 suite3-test3-name PIC X(20) EXTERNAL.
000028    01 suite3-test4-name PIC X(20) EXTERNAL.
000029
000030    01 suite1-test1-desc PIC X(100) EXTERNAL.
000031    01 suite1-test2-desc PIC X(100) EXTERNAL.
000032    01 suite1-test3-desc PIC X(100) EXTERNAL.
000033
000034    01 suite2-test1-desc PIC X(100) EXTERNAL.
000035    01 suite2-test2-desc PIC X(100) EXTERNAL.
000036    01 suite2-test3-desc PIC X(100) EXTERNAL.
000037
000038    01 suite3-test1-desc PIC X(100) EXTERNAL.
000039    01 suite3-test2-desc PIC X(100) EXTERNAL.
000040    01 suite3-test3-desc PIC X(100) EXTERNAL.
000041    01 suite3-test4-desc PIC X(100) EXTERNAL.
000042
000043    01 string-expected PIC X(32000) EXTERNAL.
000044    01 string-actual PIC X(32000) EXTERNAL.
000045    01 MaSuite.
000046          05 SuiteN PIC X(20) .
000047          05 SuiteD PIC X(100).
000048          05 SuiteS PIC 9(2).
000049          05 nb-test-r PIC 9(3).
000050          05 nb-suite-s PIC 9(3).
000051          05 nb-suite-f PIC 9(3).
000052          05 nb-suite-e PIC 9(3).
000053    01 MonTest.
000054          05 TestN PIC X(20) VALUE SPACES.
000055          05 TestD PIC X(100) VALUE SPACES.
000056                  05 assert-r PIC 9(3).
000057          05 nb-assert-s PIC 9(3).
000058          05 nb-assert-f PIC 9(3).
000062   01 assert-name PIC X(20) EXTERNAL.
