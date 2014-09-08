#!/bin/bash

	rm -rf *.so
	rm -rf lib/
	rm -rf tests/	
	mkdir lib/
	mkdir tests/
	mkdir tests/lib/

make all
exit 0;
