000020* COBOLUnit is a COBOL Unit framework testing
000021*
000022* Logic name: CBU-initialize
000032*	source name: CBU00000.cob
000039*
000040*  Copyright (C) 2009 Hervé Vaujour
000041*
000042*  This program is free software; you can redistribute it and/or modify
000043*  it under the terms of the GNU General Public License as published by
000044*  the Free Software Foundation; either version 2 of the License, or
000045*  (at your option) any later version.
000046*
000047*  This program is distributed in the hope that it will be useful,
000048*  but WITHOUT ANY WARRANTY; without even the implied warranty of
000049*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
000050*  GNU General Public License for more details.
000051*
000052*  You should have received a copy of the GNU General Public License
000053*  along with this program; see the file COPYING. If not, write to the
000054*  Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
000055
000056
000057* reset COBOLUnit variables 
000058 IDENTIFICATION DIVISION.
000059 PROGRAM-ID.   CBU00000.
000060 ENVIRONMENT    DIVISION.
000061 CONFIGURATION  SECTION.
000062 DATA DIVISION.
000063 WORKING-STORAGE SECTION.
000064    01 i PIC 9(2).
000065    01 j PIC 9(2).
000066    01 k PIC 9(2).
000072    COPY CBUC0002.
000073    LINKAGE SECTION.
000074    	COPY CBUC0001.
000075 PROCEDURE DIVISION USING CBU-ctx. 
000076    MOVE 0 TO TestRunCount.
000077    MOVE 0 TO index-current-suite.
000078    MOVE 0 TO index-current-test.
000079    MOVE 0 TO RunSuccessCount.
000080 	  MOVE 0 TO RunFailureCount.
000081 	  MOVE 0 TO TestError.
000082 	  MOVE 0 TO nb-suite-run.
000088 	  PERFORM VARYING i FROM 1 BY 1 
000098		UNTIL i >= SuiteIndex
000099 		PERFORM VARYING j FROM 1 BY 1 
000100		  UNTIL ListeTests(i,j) = ""
000102  	 MOVE 0 TO nb-test-run (i)  
000105  	 MOVE 0 TO nb-test-succeed (i)  		
000106  	 MOVE 0 TO nb-test-failed (i)
000107  	 MOVE 0 TO nb-test-error (i)  		
000110* 		  PERFORM VARYING k FROM 1 BY 1 
000111*		    UNTIL ListeAssertRuns(i,j,k) = ""
000112*  	 	  MOVE 0 TO has-succeed (i,j,k)
000113*		      INITIALIZE AssertRunName (i,j,k)	
000115*		 	  INITIALIZE AssertValueExpected (i,j,k)
000116*		 	  INITIALIZE AssertValueActual (i,j,k)	 
000122* 		  END-PERFORM
000123 		END-PERFORM
000124 	  END-PERFORM 
000125 	  EXIT PROGRAM. 
000126 END PROGRAM CBU00000.
000127
000130 	 	
000376 	 