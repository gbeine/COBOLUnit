000100* COBOLUnit is a COBOL Unit framework testing
000101*
000102* Logic name: CBU-display-res
000103*	source name: CBU00301.cob
000113*
000118*  Copyright (C) 2009 Hervé Vaujour
000119*
000120*  This program is free software; you can redistribute it and/or modify
000121*  it under the terms of the GNU General Public License as published by
000122*  the Free Software Foundation; either version 2 of the License, or
000123*  (at your option) any later version.
000124*
000125*  This program is distributed in the hope that it will be useful,
000126*  but WITHOUT ANY WARRANTY; without even the implied warranty of
000127*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
000128*  GNU General Public License for more details.
000129*
000130*  You should have received a copy of the GNU General Public License
000131*  along with this program; see the file COPYING. If not, write to the
000132*  Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
000133
000134
000135************* CBU_DISPLAY_RES ************ 
000136  IDENTIFICATION DIVISION.
000137  PROGRAM-ID.   CBU00301.
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
000251    01 str PIC X(255).
000260    01 WS-CNT1 PIC 999.
000270    01 WS-CNT2 PIC 999.
000271    
000272   LINKAGE SECTION.
000273     COPY CBUC0001.
000274
000275	  
000276   PROCEDURE DIVISION USING CBU-ctx.
000281    PERFORM VARYING i FROM 1 BY 1 
000290    			UNTIL i >= SuiteIndex
000300    	MOVE ListeSuites(i) TO MaSuite
000310
000311	  	 INITIALIZE str
000312	  	 MOVE SuiteN TO str
000313	  	 CALL CBU-get-last-index 
000314		    		USING CBU-ctx  str WS-CNT1
000315	  	 DISPLAY "Suite '" str(1:WS-CNT1)
000316				 " running..."
000317	  	 DISPLAY "     "nb-test-ru " tests run ["
000318	  			"("nb-test-suc") succeed,"		  			
000319	  			"("nb-test-fail") failed]"
000320
000321		  IF nb-test-fail <> 0 AND
000322		  	 nb-test-err <> 0 THEN
000323		  	 DISPLAY "..... SUCCEED!"
000324		  ELSE
000325		  	DISPLAY "..... SUCCEED!"
000326		  
000333		  END-IF	
000334		  
000335		  	  
000336*		  DISPLAY "Suite '" SuiteN "' Failed..."	
000337*    		DISPLAY "i="i
000338*    		DISPLAY "Suite: " SuiteN
000339*    		DISPLAY "Description: " SuiteD
000340*  		DISPLAY "suite-size: " suite-s
000341*  		DISPLAY "nb-test-size: " nb-test-siz
000342*  		DISPLAY "nb-test-run:" nb-test-ru
000343  		DISPLAY "nb-test-succeed: "nb-test-suc  		
000344  		DISPLAY "nb-test-failed: " nb-test-fail
000345  		DISPLAY "nb-test-err: " nb-test-err
000346
000347	    PERFORM VARYING j FROM 1 BY 1 
000350    			UNTIL j> nb-test-siz
000360		    MOVE ListeTests(i,j) TO MonTest
000361*		    DISPLAY "test size = " nb-test-siz
000370*		    DISPLAY "j="j
000380*		    DISPLAY "----- TestName: " TestN
000390*		    DISPLAY "----- TestDesc: " TestD
000400*		    DISPLAY "----- Test assert run: " nb-assert-ru
000401*		    DISPLAY "----- Test assert succeed: " nb-assert-suc
000402*		    DISPLAY "----- Test assert failed: " nb-assert-fail
000404	   		 PERFORM VARYING k FROM 1 BY 1 
000405    				UNTIL k> nb-assert-ru
000406*			    DISPLAY "k= " k
000407*				MOVE ListeAssertRuns(i,j,k) TO MonAssert			    
000408*			    CALL CBU-get-last-index 
000409*			    		USING AssertValueExp WS-CNT1
000410*			    CALL CBU-get-last-index 
000411*			    		USING AssertValueAct WS-CNT2
000413*				DISPLAY "----------- AssertName: " 
000414*						AssertRunN
000415*		    	DISPLAY "----------- has succeed: " 
000416*		    			has-succ
000417*		    	DISPLAY "----------- expected: " 
000418*		    			AssertValueExp(1:WS-CNT1)
000419*		    	DISPLAY "----------- actual: " 
000420*		    			AssertValueAct(1:WS-CNT2)	
000421			 END-PERFORM
000422		    DISPLAY "********"			
000423    	END-PERFORM
000424    END-PERFORM.
000430
000440 	 EXIT PROGRAM.
000450 	END PROGRAM CBU00301.  