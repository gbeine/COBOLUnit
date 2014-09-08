000100* COBOLUnit is a COBOL Unit framework testing
000101*
000102* Logic name: CBU-display-suite
000103*	source name: CBU-display-suite.cob
000113*
000119*  Copyright (C) 2009 Hervé Vaujour
000120*
000121*  This program is free software; you can redistribute it and/or modify
000122*  it under the terms of the GNU General Public License as published by
000123*  the Free Software Foundation; either version 2 of the License, or
000124*  (at your option) any later version.
000125*
000126*  This program is distributed in the hope that it will be useful,
000127*  but WITHOUT ANY WARRANTY; without even the implied warranty of
000128*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
000129*  GNU General Public License for more details.
000130*
000131*  You should have received a copy of the GNU General Public License
000132*  along with this program; see the file COPYING. If not, write to the
000133*  Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
000134
000135************* CBU_DISPLAY_SUITE ************ 
000136  IDENTIFICATION DIVISION.
000137  PROGRAM-ID.   CBU00300.
000138  DATA DIVISION.
000140    WORKING-STORAGE SECTION.
000150    COPY CBUC0002.
000210	  01 MaSuite.
000212  	10 SuiteN PIC X(20).
000213  	10 SuiteD PIC X(50).
000214  	10 suite-s PIC 9(2).
000215  	10 nb-test-siz PIC 9(3).
000216  	10 nb-test-ru PIC 9(3).  
000217  	10 nb-test-suc PIC 9(3).  		
000218  	10 nb-test-fail PIC 9(3).
000219  	10 nb-test-err PIC 9(3).  		
000220    01 MonTest.
000221  	10 TestN PIC X(20).
000222  	10 TestD PIC X(50).
000223  	10 nb-assert-ru PIC 9(3).
000224  	10 nb-assert-suc PIC 9(3).
000225  	10 nb-assert-fail PIC 9(3).
000226  	
000227    01 MonAssert.
000228  	10 AssertRunN PIC X(20).
000229  	10 has-succ PIC 9(1).
000230  	10 AssertValueExp PIC X(255).
000231  	10 AssertValueAct PIC X(255).  	
000232    01 i PIC 9(2).
000240    01 j PIC 9(2).
000250    01 k PIC 9(2).
000260    01 WS-CNT1 PIC 999.
000270    01 WS-CNT2 PIC 999.
000272
000273	  LINKAGE SECTION.
000274	    COPY CBUC0001.
000275	  
000276   PROCEDURE DIVISION USING CBU-ctx.
000281    PERFORM VARYING i FROM 1 BY 1 
000290    			UNTIL i >= SuiteIndex
000300    		MOVE ListeSuites(i) TO MaSuite
000310    		DISPLAY "i="i
000320    		DISPLAY "Suite: " SuiteN
000330    		DISPLAY "Description: " SuiteD
000340  		DISPLAY "suite-size: " suite-s
000341  		DISPLAY "nb-test-size: " nb-test-siz
000342  		DISPLAY "nb-test-run:" nb-test-ru
000343  		DISPLAY "nb-test-succeed: "nb-test-suc  		
000344  		DISPLAY "nb-test-failed: " nb-test-fail
000345  		DISPLAY "nb-test-err: " nb-test-err
000346
000347	    PERFORM VARYING j FROM 1 BY 1 
000350    			UNTIL j> nb-test-siz
000360		    MOVE ListeTests(i,j) TO MonTest
000361		    DISPLAY "test size = " nb-test-siz
000370		    DISPLAY "j="j
000380		    DISPLAY "----- TestName: " TestN
000390		    DISPLAY "----- TestDesc: " TestD
000400		    DISPLAY "----- Test assert run: " 
000401		    				nb-assert-ru
000402		    DISPLAY "----- Test assert succeed: " 
000403		    				nb-assert-suc
000404		    DISPLAY "----- Test assert failed: " 
000405		    				nb-assert-fail
000406*	   		 PERFORM VARYING k FROM 1 BY 1 
000407*    				UNTIL k> nb-assert-ru
000408*			    DISPLAY "k= " k
000409*				MOVE ListeAssertRuns(i,j,k) TO MonAssert			    
000410*			    CALL CBU-get-last-index 
000411*			        USING CBU-ctx AssertValueExp WS-CNT1
000412*			    CALL CBU-get-last-index 
000413*			    	USING CBU-ctx AssertValueAct WS-CNT2
000414*				DISPLAY "----------- AssertName: " 
000415*						AssertRunN
000416*		    	DISPLAY "----------- has succeed: " 
000417*		    			has-succ
000418*		    	DISPLAY "----------- expected: " 
000419*		    			AssertValueExp(1:WS-CNT1)
000420*		    	DISPLAY "----------- actual: " 
000421*		    			AssertValueAct(1:WS-CNT2)	
000422*			 END-PERFORM
000423		    DISPLAY "********"			
000424    	END-PERFORM
000425    END-PERFORM.
000430
000440 	 EXIT PROGRAM.
000450 	END PROGRAM CBU00300.  