000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-set-log-file
000013*	source name: CBU00011.cob
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
000046*> set file log
000047* arg1: file-name log file name
000048 IDENTIFICATION DIVISION.
000049 PROGRAM-ID.   CBU00011.
000050 ENVIRONMENT    DIVISION.
000051 INPUT-OUTPUT SECTION. 
000052 FILE-CONTROL.
000053    SELECT LogFile ASSIGN TO currentLogFile
000054		ORGANIZATION IS LINE SEQUENTIAL.
000055 DATA DIVISION.
000056 FILE SECTION.
000057 	FD LogFile.
000058 	01 LogLine PIC X(255).
000067 WORKING-STORAGE SECTION.
000068   77 str1 PIC X(24).
000069   77 WS-CNT1 PIC 99.
000070   COPY CBUC0002. 	
000071 LINKAGE SECTION.
000073 	77 file-name PIC X(24).
000074 	COPY CBUC0001. 
000080 PROCEDURE DIVISION USING CBU-ctx file-name.  
000081  MOVE 0 to WS-CNT1.
000082  MOVE FUNCTION Reverse(file-name) to str1.
000083  
000084  Inspect str1   Tallying WS-CNT1 For Leading space
000085  IF WS-CNT1 IS EQUAL TO 0 THEN
000086   Inspect str1   Tallying WS-CNT1 For Leading X"00"
000087  END-IF	
000088  Compute WS-CNT1 = length of str1 - WS-CNT1.
000092 		
000093 	STRING file-name(1:WS-CNT1) ".DAT" 
000095		 INTO currentLogFile   
000096  DISPLAY "Log file: " currentLogFile
000097	INITIALIZE LogLine.
000098* Create suite log file
000099	OPEN OUTPUT LogFile.
000100  WRITE LogLine.
000101  CLOSE LogFile.  
000110 END PROGRAM CBU00011.