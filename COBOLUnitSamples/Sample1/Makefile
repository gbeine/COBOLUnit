CBU_PATH?=$(shell pwd)/../../COBOLUnitLib
CBU_LIB_PATH=$(CBU_PATH)/lib
CBU_COPY_PATH=$(CBU_PATH)/COPY

SAMPLE_PATH=$(shell pwd)
SAMPLE_LIB_PATH=$(SAMPLE_PATH)/lib
SAMPLE_COPY_PATH=$(SAMPLE_PATH)/COPY
SAMPLE_TESTS_PATH=$(SAMPLE_PATH)/tests
SAMPLE_TESTS_LIB_PATH=$(SAMPLE_PATH)/tests/lib

all: clean dirs SAMPLE01 TS000001 SUITE001 test

SAMPLE01:
	cobc -c SAMPLE01.cob
	clang -dynamiclib -flat_namespace -undefined suppress -fno-common -DPIC -o libSample1.dylib SAMPLE01.o
	mv libSample1.dylib $(SAMPLE_LIB_PATH)

TS000001:
	cobc -c -I $(CBU_COPY_PATH) -I $(SAMPLE_COPY_PATH) TS000001.cob
	clang -dynamiclib -flat_namespace -undefined suppress -fno-common -DPIC -L $(SAMPLE_LIB_PATH) -l Sample1 -o libTS1.dylib TS000001.o
	mv libTS1.dylib $(SAMPLE_TESTS_LIB_PATH)

SUITE001:
	cobc -x -o SUITE001 -I $(CBU_COPY_PATH) -I $(SAMPLE_COPY_PATH) -L $(CBU_LIB_PATH) -l CobolUnit -L $(SAMPLE_TESTS_LIB_PATH) -l TS1 SUITE001.cob
	mv SUITE001 $(SAMPLE_TESTS_PATH)

test:
	ln -s $(CBU_LIB_PATH)/libCobolUnit.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE_LIB_PATH)/libSample1.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE_TESTS_LIB_PATH)/libTS1.dylib $(SAMPLE_TESTS_PATH)
	(cd $(SAMPLE_TESTS_PATH) && ./SUITE001)

dirs:
	mkdir $(SAMPLE_LIB_PATH)
	mkdir $(SAMPLE_TESTS_PATH)
	mkdir $(SAMPLE_TESTS_LIB_PATH)

clean:
	rm -f *.c *.h *.o *.s
	rm -rf *.so *.dylib
	rm -rf $(SAMPLE_TESTS_LIB_PATH)
	rm -rf $(SAMPLE_TESTS_PATH)
	rm -rf $(SAMPLE_LIB_PATH)


