000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012*	Logic name: CBU-display-line
000013* source name: CBU00200
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
000047*> Display on screen a line after parsing blanks
000048* arg1: line-display - line to displau
000049 IDENTIFICATION DIVISION.
000050 PROGRAM-ID.   CBU00200.
000093 DATA DIVISION.
000094  WORKING-STORAGE SECTION.
000113   COPY CBUC0002.
000114      77 WS-CNT PIC 999.
000115      77 l PIC X(255).
000116  LINKAGE SECTION.
000117   01 line-display PIC X(255).
000118   COPY CBUC0001.
000122 PROCEDURE DIVISION USING CBU-ctx line-display.
000153  MOVE line-display TO l.
000154	CALL CBU-get-last-index USING CBU-ctx l	WS-CNT.
000208	DISPLAY line-display(1:WS-CNT).
000220 END PROGRAM CBU00200.