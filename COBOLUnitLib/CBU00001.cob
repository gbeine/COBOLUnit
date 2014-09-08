000020* COBOLUnit is a COBOL Unit framework testing
000021*
000022* logic name: CBU-initialize
000023*	source name: CBU00000.cob
000024*
000025*  Copyright (C) 2009 Hervé Vaujour
000026*
000027*  This program is free software; you can redistribute it and/or modify
000028*  it under the terms of the GNU General Public License as published by
000029*  the Free Software Foundation; either version 2 of the License, or
000030*  (at your option) any later version.
000031*
000032*  This program is distributed in the hope that it will be useful,
000033*  but WITHOUT ANY WARRANTY; without even the implied warranty of
000034*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
000035*  GNU General Public License for more details.
000036*
000037*  You should have received a copy of the GNU General Public License
000038*  along with this program; see the file COPYING. If not, write to the
000039*  Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
000040
000041
000042* Initialize variables for running tests suite 
000043 IDENTIFICATION DIVISION.
000044 PROGRAM-ID.   CBU00001.
000045 ENVIRONMENT    DIVISION.
000046 CONFIGURATION  SECTION.
000050 DATA DIVISION.
000060 WORKING-STORAGE SECTION.
000070    COPY CBUC0002.
000071    LINKAGE SECTION.
000072    	COPY CBUC0001.
000081 PROCEDURE DIVISION USING CBU-ctx.     
000093    MOVE 1 TO TestIndex.
000094    MOVE 1 TO SuiteIndex.
000095    MOVE 1 TO AssertIndex. 
000099 	  CALL CBU-reset-run USING CBU-ctx.    
000105 END PROGRAM CBU00001.
000106
000110 	 	
000376 	 