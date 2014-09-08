CBU_PATH?=$(shell pwd)/../COBOLUnitLib
CBU_LIB_PATH=$(CBU_PATH)/lib
CBU_COPY_PATH=$(CBU_PATH)/COPY

CBU_TESTS_PATH=$(shell pwd)
CBU_TESTS_LIB_PATH=$(CBU_TESTS_PATH)/lib
CBU_TESTS_COPY_PATH=$(CBU_TESTS_PATH)/COPY
CBU_TESTS_TESTS_PATH=$(CBU_TESTS_PATH)/tests

all: clean CobolUnitTests test

CobolUnitTests:
	cobc -c -b CTU0S1T1.cob CTU0S1T2.cob CTU0S2T1.cob CTU0S3T1.cob CTU0S3T2.cob -I $(CBU_COPY_PATH) -I $(CBU_TESTS_COPY_PATH)
	clang -dynamiclib -flat_namespace -undefined suppress -fno-common -DPIC -o libCBU_Tests.dylib $(COB_LIBS) *.o
	mv *.dylib $(CBU_TESTS_LIB_PATH)
	cobc -x -o CBU-test-suite -I $(CBU_COPY_PATH) -I $(CBU_TESTS_COPY_PATH) -L $(CBU_LIB_PATH) -l CobolUnit -L $(CBU_TESTS_LIB_PATH) -l CBU_Tests CTU000S1.cob
	mv CBU-test-suite $(CBU_TESTS_TESTS_PATH)

test:
	ln -s $(CBU_LIB_PATH)/libCobolUnit.dylib $(CBU_TESTS_TESTS_PATH)
	ln -s $(CBU_TESTS_LIB_PATH)/libCBU_Tests.dylib $(CBU_TESTS_TESTS_PATH)
	(cd $(CBU_TESTS_TESTS_PATH) && ./CBU-test-suite)

clean:
	rm -f *.c *.h *.o *.s
	rm -rf *.so *.dylib
	rm -rf $(CBU_TESTS_TESTS_PATH)
	rm -rf $(CBU_TESTS_LIB_PATH)/tests
	rm -rf $(CBU_TESTS_LIB_PATH)/copy
	rm -rf $(CBU_TESTS_LIB_PATH)
	mkdir $(CBU_TESTS_LIB_PATH)
	mkdir $(CBU_TESTS_LIB_PATH)/copy
	mkdir $(CBU_TESTS_LIB_PATH)/tests
	mkdir $(CBU_TESTS_TESTS_PATH)


