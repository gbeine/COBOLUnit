000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-get-last-index
000013*	source name: CBU-U001
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
000046
000047*> Return last index in a string to parse it
000048* arg1: line-to-parse - line to parse
000049* arg2: index - index of 
000050 IDENTIFICATION DIVISION.
000060 PROGRAM-ID.   CBU-U001.
000093 DATA DIVISION.
000094  WORKING-STORAGE SECTION.
000104   77 str1 PIC X(32000).
000105   COPY CBUC0002.
000113
000114  LINKAGE SECTION.
000115	 77 line-to-parse PIC X(32000).
000116   77 WS-CNT1 PIC 99999.
000117   COPY CBUC0001.  	
000122 PROCEDURE DIVISION USING CBU-ctx line-to-parse WS-CNT1.
000147   MOVE 0 TO WS-CNT1.
000150   INITIALIZE str1.
000151   MOVE FUNCTION Reverse(line-to-parse) to str1.
000152   Inspect str1   Tallying WS-CNT1 For Leading space.
000153   IF WS-CNT1 IS EQUAL TO 0 THEN
000154   	Inspect str1   Tallying WS-CNT1 For Leading X"00"
000155   END-IF.  
000162 	 Compute WS-CNT1 = length of str1 - WS-CNT1.    
000230 END PROGRAM CBU-U001.