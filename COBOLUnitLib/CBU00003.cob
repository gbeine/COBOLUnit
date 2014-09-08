000100* COBOLUnit is a COBOL Unit framework testing
000101*
000102* Logic name: CBU-un
000103*	source name: CBU00003.cob
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
000135
000140*> Run cbu
000273 IDENTIFICATION DIVISION.
000274 PROGRAM-ID.	 CBU00003.
000275 ENVIRONMENT DIVISION.
000276 INPUT-OUTPUT SECTION. 
000277 FILE-CONTROL.
000278    SELECT LogFile ASSIGN TO currentLogFile
000279		ORGANIZATION IS LINE SEQUENTIAL.
000281 DATA DIVISION.
000282 FILE SECTION.
000283 	FD LogFile.
000284 	01 LogLine PIC X(255).
000290 WORKING-STORAGE SECTION.
000310	01 CurrentTimeDeb PIC 9(8).
000320  01 CurrentTimeFin PIC 9(8).	  
000321  01 lineToLog PIC X(255).
000322  01 res-str PIC X(7).
000323  01 success-str PIC X(7).
000324  01 failure-str PIC X(7).
000326  COPY CBUC0002.
000327    LINKAGE SECTION.
000328    	COPY CBUC0001.
000329 PROCEDURE DIVISION USING CBU-ctx.
000330*  DISPLAY "Lancement des tests".	
000335	MOVE "SUCCESS" TO success-str.
000336	MOVE "FAILURE" TO failure-str.
000345	ACCEPT  CurrentTimeDeb FROM TIME.
000402*  DISPLAY "Lancement des suites".	
000403  CALL CBU-suites-run USING CBU-ctx.
000405  INITIALIZE LineToLog.
000406	IF RunFailureCount > 0 OR TestError > 0
000407	 THEN
000410	   MOVE failure-str TO res-str
000412*    CALL CBU-write-log-line USING lineToLog
000413	ELSE
000414	   MOVE success-str TO res-str
000417*     CALL CBU-write-log-line USING lineToLog
000418	END-IF
000420
000421  INITIALIZE LineToLog
000422  DISPLAY " "
000423	DISPLAY
000424	"**************************************************************"
000425	"******"
000426	DISPLAY 
000427	   "*                          "
000428	   res-str "                                 *" 
000429	DISPLAY "*     ("
000430	   TestRunCount
000431	   " test cases, "
000432	   RunSuccessCount " success, "
000433	   RunFailureCount " failures, "
000434     TestError "  errors)     *"
000435	DISPLAY 
000436	"**************************************************************"
000437	"******"
000438*	DISPLAY lineToLog
000439*	CALL CBU-write-log-line USING lineToLog
000440  ACCEPT  CurrentTimeFin FROM TIME.
000441*	DISPLAY "CurrenttimeDeb: " CurrenttimeDeb.
000442*	DISPLAY "CurrenttimeFin: " CurrenttimeFin.
000443  COMPUTE CurrentTimeFin = CurrentTimeFin - CurrentTimeDeb.
000444  INITIALIZE LineToLog
000445  DISPLAY "("	
000446     	   CurrentTimeFin(3:2)
000447     	   " min:"
000448     	   CurrentTimeFin(5:2)
000449     	   " sec:"
000450     	   CurrentTimeFin(7:2)
000451     	   " ms)".
000452*	 INTO lineToLog 
000453*  DISPLAY lineToLog
000454*  CALL CBU-write-log-line USING lineToLog  	
000455   	 
000456 	EXIT PROGRAM.
000464 END PROGRAM CBU00003.
000969