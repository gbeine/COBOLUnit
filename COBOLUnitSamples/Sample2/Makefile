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

all: clean dirs SAMPLE02 TS000002 SUITE002 test

SAMPLE02:
	cobc -c -I $(SAMPLE1_COPY_PATH) SAMPLE02.cob
	clang -dynamiclib -flat_namespace -undefined suppress -fno-common -DPIC -o libSample2.dylib SAMPLE02.o
	mv libSample2.dylib $(SAMPLE_LIB_PATH)

TS000002:
	cobc -c -I $(CBU_COPY_PATH) -I $(SAMPLE_COPY_PATH) TS000002.cob
	clang -dynamiclib -flat_namespace -undefined suppress -fno-common -DPIC -L $(SAMPLE_LIB_PATH) -l Sample2 -o libTS2.dylib TS000002.o
	mv libTS2.dylib $(SAMPLE_TESTS_LIB_PATH)

SUITE002:
	cobc -x -o SUITE002 -I $(CBU_COPY_PATH) -L $(CBU_LIB_PATH) -l CobolUnit -L $(SAMPLE_TESTS_LIB_PATH) -l TS2 -L $(SAMPLE1_TESTS_LIB_PATH) -l TS1 SUITE002.cob
	mv SUITE002 $(SAMPLE_TESTS_PATH)

test:
	ln -s $(CBU_LIB_PATH)/libCobolUnit.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE_LIB_PATH)/libSample2.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE_TESTS_LIB_PATH)/libTS2.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE1_LIB_PATH)/libSample1.dylib $(SAMPLE_TESTS_PATH)
	ln -s $(SAMPLE1_TESTS_LIB_PATH)/libTS1.dylib $(SAMPLE_TESTS_PATH)
	(cd $(SAMPLE_TESTS_PATH) && ./SUITE002)

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


