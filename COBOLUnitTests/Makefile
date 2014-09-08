all: clean  CobolUnitTests
	


CobolUnitTests: 
	cobc -o libCBU_Tests -b CTU0S1T1.cob CTU0S1T2.cob CTU0S2T1.cob CTU0S3T1.cob CTU0S3T2.cob -I $(CBU_COPY_PATH) -I $(CBU_TESTS_COPY_PATH) 
	mv libCBU_Tests.so $(CBU_TESTS_TESTS_LIB_PATH)/
	cobc -x -I $(CBU_COPY_PATH) -I $(CBU_TESTS_COPY_PATH)  -L $(CBU_LIB_PATH) -l COBOLUnit  -L $(CBU_TESTS_TESTS_LIB_PATH) -l CBU_Tests CTU000S1.cob
	mv ./CTU000S1 tests/

clean:
	rm -rf *.so
	rm -rf lib/*.so
	rm -rf lib/tests/*
	rm -rf ./CBU-test-suite
	rm -rf ./CTU000S1
	rm -rf lib/copy/*


