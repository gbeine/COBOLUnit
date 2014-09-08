all:  SAMPLE02 TS000002 SUITE002
	

SAMPLE02: SAMPLE02.cob
	cobc -m -o libSample2 SAMPLE02.cob -I $(SAMPLE1_COPY_PATH) 
	mv libSample2.so lib/

TS000002: TS000002.cob
	cobc -m -I $(CBU_COPY_PATH) -I $(SAMPLE2_COPY_PATH) -L $(SAMPLE2_LIB_PATH) -l Sample2 -o libTS2 TS000002.cob 
	mv libTS2.so tests/lib/

SUITE002: SUITE002.cob 
	cobc -x -I $(CBU_COPY_PATH) SUITE002.cob  -L $(SAMPLE1_TEST_LIB_PATH) -l TS1 -L $(SAMPLE2_TEST_LIB_PATH) -l TS2 -L $(CBU_LIB_PATH) -l COBOLUnit
	mv ./SUITE002 tests/

clean:
	rm -rf *.so
	rm -rf lib/
	rm -rf tests/	
	mkdir lib/
	mkdir tests/
	mkdir tests/lib/


