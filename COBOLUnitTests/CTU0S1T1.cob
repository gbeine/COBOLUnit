000010*>
000020 IDENTIFICATION DIVISION.
000030 PROGRAM-ID.   CTU0S1T1.
000040 ENVIRONMENT    DIVISION.
000050 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000071   01 str-expected PIC X(32000).
000072   01 str-actual PIC X(32000).
000073   01 assert-name PIC X(20).
000074   01 nb-expected PIC 999.
000075   01 nb-actual PIC 999.
000077   COPY CBUC0002.
000078   LINKAGE SECTION.
000079   COPY CBUC0001.
000080 PROCEDURE DIVISION USING CBU-ctx.   
000082  INITIALIZE str-expected.
000083  INITIALIZE str-actual.
000084  INITIALIZE nb-expected.
000085  INITIALIZE nb-actual.
000086  MOVE "TOTO" TO str-expected.
000087  MOVE "TOTO" TO str-actual. 
000090
000101
000102  MOVE "ass1-TRUE" TO assert-name. 
000103 	CALL CBU-assert-str-equals USING 
000104 		CBU-ctx
000105 		assert-name
000106 		str-expected
000107 		str-actual.
000108 		 
000109  MOVE "ass2--TRUE" TO assert-name. 
000110 	CALL CBU-assert-str-equals USING 
000111 		CBU-ctx
000112 		assert-name
000113 		str-expected
000114 		str-actual.
000115 		   
000116  MOVE "nb-assert-run" TO assert-name.
000117  MOVE 3 TO nb-expected.
000118  CALL CBU-assert-nb3-equals USING
000119 		CBU-ctx
000120  	assert-name
000121  	nb-expected
000122  	nb-assert-run(1,1).
000123
000124  MOVE "nb-assert-true1" TO assert-name.
000125  MOVE 3 TO nb-expected.
000126  CALL CBU-assert-nb3-equals USING
000127 		CBU-ctx
000128  	assert-name
000129  	nb-expected
000130  	nb-assert-succeed(1,1).  	
000131
000132  MOVE "nb-assert-true2" TO assert-name.
000133  MOVE 4 TO nb-expected.
000134  CALL CBU-assert-nb3-equals USING
000135 		CBU-ctx
000136  	assert-name
000137  	nb-expected
000138  	nb-assert-succeed(1,1).  	
000139
000140  MOVE "nb-assert-run2" TO assert-name.
000141  MOVE 6 TO nb-expected.
000142  CALL CBU-assert-nb3-equals USING
000143 		CBU-ctx
000144  	assert-name
000145  	nb-expected
000146  	nb-assert-run(1,1).
000147
000148		
000150 END PROGRAM CTU0S1T1.