000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-add-assert-failed
000013*	source name: CBU00030.cob
000023*
000028*  Copyright (C) 2009 Hervé Vaujour
000029*
000030*  This program is free software; you can redistribute it and/or modify
000031*  it under the terms of the GNU General Public License as published by
000032*  the Free Software Foundation; either version 2 of the License, or
000033*  (at your option) any later version.
000034*
000035*  This program is distributed in the hope that it will be useful,
000036*  but WITHOUT ANY WARRANTY; without even the implied warranty of
000037*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
000038*  GNU General Public License for more details.
000039*
000040*  You should have received a copy of the GNU General Public License
000041*  along with this program; see the file COPYING. If not, write to the
000042*  Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
000043
000044
000045
000046*>add an assert failed
000047 IDENTIFICATION DIVISION.
000050 PROGRAM-ID.   CBU00030.
000083  DATA DIVISION.
000084    WORKING-STORAGE SECTION.
000085	  COPY CBUC0002.
000086	  LINKAGE SECTION.
000087	     77 AssertName PIC X(20).  	
000088   	 77 ResExpected PIC X(32000).  	
000089   	 77 ResActual PIC X(32000).
000090   	 COPY CBUC0001.  
000091   PROCEDURE DIVISION USING 
000092   		CBU-ctx AssertName ResExpected ResActual.
000093    ADD 1 TO AssertFailureCount.
000094    ADD 1 TO nb-assert-failed
000095    	(index-current-suite, index-current-test).
000096*	  MOVE AssertName 
000097*	  		TO AssertRunName
000098*				(index-current-suite, 
000099*				 index-current-test,
000100*				 index-current-assert).
000101*	  MOVE 0 TO has-succeed
000102*	  			(index-current-suite, 
000103*				 index-current-test,
000104*				 index-current-assert).  
000105*	  MOVE ResExpected TO AssertValueExpected
000106*	  			(index-current-suite, 
000107*				 index-current-test,
000108*				 index-current-assert).	  
000109*	  MOVE ResActual TO AssertValueActual
000110*	  			(index-current-suite, 
000111*				 index-current-test,
000112*				 index-current-assert).
000113*	  ADD 1 TO index-current-assert.  	
000114 	 EXIT PROGRAM.
000120 END PROGRAM CBU00030.