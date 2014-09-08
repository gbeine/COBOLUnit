CBU_PATH?=$(shell pwd)
CBU_LIB_PATH=$(CBU_PATH)/lib
CBU_COPY_PATH=$(CBU_PATH)/COPY

all: clean CobolUnit

CobolUnit:
	cobc -c -I $(CBU_COPY_PATH) -b CBU00000.cob CBU00001.cob CBU00002.cob CBU00003.cob CBU00004.cob CBU00005.cob CBU00006.cob CBU00007.cob CBU00008.cob CBU00009.cob CBU00011.cob CBU00012.cob  CBU00020.cob CBU00025.cob CBU00050.cob CBU00060.cob CBU00030.cob CBU00040.cob CBU00080.cob CBU00100.cob CBU00101.cob CBU00102.cob CBU00103.cob CBU00200.cob CBU00300.cob CBU00301.cob CBU0U001.cob
	clang -dynamiclib -flat_namespace -undefined suppress -fno-common -DPIC -o libCobolUnit.dylib *.o
	mv *.dylib $(CBU_LIB_PATH)

clean:
	rm -f *.c *.h *.o *.s
	rm -rf *.so *.dylib
	rm -rf $(CBU_LIB_PATH)/tests
	rm -rf $(CBU_LIB_PATH)/copy
	rm -rf $(CBU_LIB_PATH)
	mkdir $(CBU_LIB_PATH)
	mkdir $(CBU_LIB_PATH)/copy
	mkdir $(CBU_LIB_PATH)/tests

