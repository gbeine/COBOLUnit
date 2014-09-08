#!/bin/bash

echo $CBU_LIB_PATH/*.so lib/

	rm -rf *.so
	rm -rf lib/
	rm -rf tests/	
	mkdir tests/
	mkdir tests/lib
	mkdir lib/


make all
exit 0;
