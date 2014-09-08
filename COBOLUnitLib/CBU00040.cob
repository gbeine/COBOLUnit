000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-add-error
000013*	source name: CBU00040.cob
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
000050*>add an error if a test failed in error
000110  IDENTIFICATION DIVISION.
000120  PROGRAM-ID.   CBU00040.
000130  DATA DIVISION.
000140    WORKING-STORAGE SECTION.
000150	  COPY CBUC0002.
000151	  LINKAGE SECTION.
000152	     COPY CBUC0001. 
000160   PROCEDURE DIVISION USING CBU-ctx.
000180    ADD 1 TO TestError.
000181    ADD 1 TO nb-test-error
000182    	(index-current-suite). 
000190 	 EXIT PROGRAM.
000200 	END PROGRAM CBU00040.