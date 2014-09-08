all:  SAMPLE01 TS000001 SUITE001
	
SAMPLE01: SAMPLE01.cob
	cobc -m -o libSample1 SAMPLE01.cob
	mv libSample1.so lib/

TS000001: TS000001.cob
	cobc -m -I $(CBU_COPY_PATH) -I $(SAMPLE1_COPY_PATH) -L $(SAMPLE1_LIB_PATH) -l Sample1 -o libTS1 TS000001.cob 
	mv libTS1.so tests/lib/


SUITE001: SUITE001.cob 
	cobc -x -I $(CBU_COPY_PATH) -I $(SAMPLE1_COPY_PATH) SUITE001.cob  -L $(SAMPLE1_TEST_LIB_PATH) -l TS1 -L $(CBU_LIB_PATH) -l COBOLUnit
	mv ./SUITE001 tests/

clean:
	rm -rf *.so
	rm -rf lib/
	rm -rf tests/	
	mkdir lib/
	mkdir tests/
	mkdir tests/lib/


