000010*>
000020 IDENTIFICATION DIVISION.
000030 PROGRAM-ID.   CTU0S2T1.
000040 ENVIRONMENT    DIVISION.
000050 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000080   01 str-expected PIC X(32000).
000081   01 str-actual PIC X(32000).
000082   01 assert-name PIC X(20).
000083   01 nb-expected PIC 999.
000084   01 nb-actual PIC 999.
000085   01 p1 USAGE IS POINTER.
000086   01 p2 USAGE IS POINTER.   
000088   COPY CBUC0002.
000089   01 MaSuite  .
000090	  	10 SuiteN PIC X(20).
000091	  	10 SuiteD PIC X(50).
000092	  	10 suite-siz PIC 9(2).
000093	  	10 nb-test-siz PIC 9(3).
000094	  	10 nb-test-r PIC 9(3).  
000095	  	10 nb-test-succ PIC 9(3).  		
000096	  	10 nb-test-fail PIC 9(3).
000097	  	10 nb-test-err PIC 9(3).  	
000099   
000100   LINKAGE SECTION.
000101   COPY CBUC0001.
000102   
000108 PROCEDURE DIVISION USING CBU-ctx.     
000137	MOVE 3 TO nb-expected.
000138	MOVE "nb-suite" TO assert-name.
000139	MOVE SuiteIndex TO nb-actual.
000140	    CALL CBU-assert-nb3-equals 
000141	    	USING CBU-ctx assert-name nb-expected nb-actual.
000150
000160	MOVE 2 TO nb-expected.
000161	MOVE "nb-tests-S1" TO assert-name.
000163	MOVE nb-test-size(1) TO nb-actual.
000164	    CALL CBU-assert-nb3-equals 
000165	    	USING CBU-ctx assert-name nb-expected nb-actual.
000166
000167	MOVE 1 TO nb-expected.
000168	MOVE "nb-tests-S2" TO assert-name.
000169	MOVE nb-test-size(2) TO nb-actual.
000170	    CALL CBU-assert-nb3-equals 
000171	    	USING CBU-ctx assert-name nb-expected nb-actual.
000172
000173	INITIALIZE str-expected.
000174	INITIALIZE str-actual.
000175	MOVE "CTU0S2T1" TO str-expected.
000176	MOVE TestName(2,1) TO str-actual.
000178	MOVE "name-S2T1" TO assert-name.
000189 	CALL CBU-assert-str-equals USING 
000190 		CBU-ctx
000191 		assert-name
000192 		str-expected
000193 		str-actual.
000194
000195	INITIALIZE str-expected.
000196	INITIALIZE str-actual.
000197	MOVE "CTU0S1T1" TO str-expected.
000198	MOVE TestName(1,1) TO str-actual.
000199	MOVE "name-S1T1" TO assert-name.
000200 	CALL CBU-assert-str-equals USING 
000201 		CBU-ctx
000202 		assert-name
000203 		str-expected
000204 		str-actual.
000205
000206	INITIALIZE str-expected.
000207	INITIALIZE str-actual.
000208	MOVE "Suite1" TO str-expected.
000209	MOVE SuiteName(1) TO str-actual.
000210	MOVE "suite-name" TO assert-name.
000211 	CALL CBU-assert-str-equals USING 
000212 		CBU-ctx
000213 		assert-name
000214 		str-expected
000215 		str-actual.
000216
000217	INITIALIZE str-expected.
000218	INITIALIZE str-actual.
000219	MOVE "Suite2 description descriop" TO str-expected.
000220	MOVE SuiteDesc(2) TO str-actual.
000221	MOVE "suite-desc" TO assert-name.
000222 	CALL CBU-assert-str-equals USING 
000223 		CBU-ctx
000224 		assert-name
000225 		str-expected
000226 		str-actual.
000227
000228
000229	MOVE 3 TO nb-expected.
000230	MOVE "nb-tests-S3" TO assert-name.
000231	MOVE nb-test-size(3) TO nb-actual.
000232 	CALL CBU-assert-str-equals USING 
000233 		CBU-ctx
000234 		assert-name
000235 		str-expected
000236 		str-actual.
000237
000238
000240 END PROGRAM CTU0S2T1.