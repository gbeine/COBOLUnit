CBU_PATH?=$(shell pwd)/../../COBOLUnitLib
CBU_LIB_PATH=$(CBU_PATH)/lib
CBU_COPY_PATH=$(CBU_PATH)/COPY

SAMPLE_PATH=$(shell pwd)
SAMPLE_LIB_PATH=$(SAMPLE_PATH)/lib
SAMPLE_COPY_PATH=$(SAMPLE_PATH)/COPY
SAMPLE_TESTS_PATH=$(SAMPLE_PATH)/tests
SAMPLE_TESTS_LIB_PATH=$(SAMPLE_PATH)/tests/lib
SAMPLE1_PATH=$(shell pwd)/../Sample1
SAMPLE1_LIB_PATH=$(SAMPLE1_PATH)/lib
SAMPLE1_COPY_PATH=$(SAMPLE1_PATH)/COPY
SAMPLE1_TESTS_LIB_PATH=$(SAMPLE1_PATH)/tests/lib
SAMPLE2_PATH=$(shell pwd)/../Sample2
SAMPLE2_LIB_PATH=$(SAMPLE2_PATH)/lib
SAMPLE2_COPY_PATH=$(SAMPLE2_PATH)/COPY
SAMPLE2_TESTS_LIB_PATH=$(SAMPLE2_PATH)/tests/lib

all: clean dirs SAMPLE03 TS000003 SUITE003 test

SAMPLE03:
	cobc -c -I $(SAMPLE1_COPY_PATH) -I $(SAMPLE2_COPY_PATH) SAMPLE03.cob
	clang -dynamiclib -flat_namespace -undefined suppress -fno-common -DPIC -o libSample3.dylib SAMPLE03.o
	mv libSample3.dylib $(SAMPLE_LIB_PATH)

TS000003:
	cobc -c -I $(CBU_COPY_PATH) -I $(SAMPLE_COPY_PATH) TS000003.cob
	clang -dynamiclib -flat_namespace -undefined suppress -fno-common -DPIC -L $(SAMPLE_LIB_PATH) -l Sample3 -o libTS3.dylib TS000003.o
	mv libTS3.dylib $(SAMPLE_TESTS_LIB_PATH)

SUITE003:
	cobc -x -o SUITE003 -I $(CBU_COPY_PATH) -L $(CBU_LIB_PATH) -l CobolUnit -L $(SAMPLE_TESTS_LIB_PATH) -l TS3 -L $(SAMPLE1_TESTS_LIB_PATH) -l TS1 -L $(SAMPLE2_TESTS_LIB_PATH) -l TS2 SUITE003.cob
	mv SUITE003 $(SAMPLE_TESTS_PATH)

test:
	ln -s $(CBU_LIB_PATH)/libCobolUnit.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE_LIB_PATH)/libSample3.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE_TESTS_LIB_PATH)/libTS3.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE1_LIB_PATH)/libSample1.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE1_TESTS_LIB_PATH)/libTS1.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE2_LIB_PATH)/libSample2.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE2_TESTS_LIB_PATH)/libTS2.dylib $(SAMPLE_TESTS_PATH)
	(cd $(SAMPLE_TESTS_PATH) && ./SUITE003)

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


