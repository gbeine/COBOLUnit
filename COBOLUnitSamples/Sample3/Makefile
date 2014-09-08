all:  SAMPLE03 TS000003 SUITE003
	

SAMPLE03: SAMPLE03.cob
	cobc -m -o libSample3 SAMPLE03.cob -I $(SAMPLE1_COPY_PATH) -I $(SAMPLE2_COPY_PATH) 
	mv libSample3.so lib/

TS000003: TS000003.cob
	cobc -m -I $(CBU_COPY_PATH) -I $(SAMPLE3_COPY_PATH)  -L $(SAMPLE3_LIB_PATH) -l Sample3 -o libTS3 TS000003.cob 
	mv libTS3.so tests/lib/

SUITE003: SUITE003.cob 
	cobc -x -I $(CBU_COPY_PATH) SUITE003.cob  -L $(SAMPLE1_TEST_LIB_PATH) -l TS1 -L $(SAMPLE2_TEST_LIB_PATH) -l TS2 -L $(SAMPLE3_TEST_LIB_PATH) -l TS3 -L $(CBU_LIB_PATH) -l COBOLUnit
	mv ./SUITE003 tests/

clean:
	rm -rf *.so
	rm -rf lib/
	rm -rf tests/	
	mkdir lib/
	mkdir tests/
	mkdir tests/lib/


