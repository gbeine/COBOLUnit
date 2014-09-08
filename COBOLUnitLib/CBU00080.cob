000010* COBOLUnit is a COBOL Unit framework testing
000011*
000012* Logic name: CBU-write-log-line
000013*	source name: CBU00080.cob
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
000045* write a line in the log file
000046* arg1: LogL-line to write in the log file
000047 IDENTIFICATION DIVISION.
000048 PROGRAM-ID.   CBU00080.
000049 ENVIRONMENT DIVISION.
000050 INPUT-OUTPUT SECTION.
000051 FILE-CONTROL.
000052    SELECT LogFile ASSIGN TO currentLogFile
000054		ORGANIZATION IS LINE SEQUENTIAL.
000060 DATA DIVISION.
000061 FILE SECTION.
000062 	FD LogFile.
000063 	01 LogLine PIC X(255).
000070 WORKING-STORAGE SECTION.
000071 	COPY CBUC0002.
000072   LINKAGE SECTION.	
000073    77 LogL PIC X(255).
000074    COPY CBUC0001.     
000075
000080 PROCEDURE DIVISION USING CBU-ctx LogL.
000081 INITIALIZE LogLine.
000083 DISPLAY LogL.
000085* MOVE LogL TO LogLine.      
000090* Write Log  
000092*  OPEN EXTEND LogFile.
000093*  WRITE LogLine.
000094*  CLOSE LogFile.
000100 END PROGRAM CBU00080.