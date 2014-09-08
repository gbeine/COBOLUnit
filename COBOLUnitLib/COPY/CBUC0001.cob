000320* COBOLUnit is a COBOL Unit framework testing
000321*
000322*	source name: CBUC0001.cob
000323*
000338*  Copyright (C) 2009 Hervé Vaujour
000339*
000340*  This program is free software; you can redistribute it and/or modify
000341*  it under the terms of the GNU General Public License as published by
000342*  the Free Software Foundation; either version 2 of the License, or
000343*  (at your option) any later version.
000344*
000345*  This program is distributed in the hope that it will be useful,
000346*  but WITHOUT ANY WARRANTY; without even the implied warranty of
000347*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
000348*  GNU General Public License for more details.
000349*
000350*  You should have received a copy of the GNU General Public License
000351*  along with this program; see the file COPYING. If not, write to the
000352*  Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
000353
000354 
000359
000360	01 CBU-ctx.
000366	  02 TestError PIC 9(3) .
000367	  02 TestIsRunning PIC 9(1) .
000368	  02 TestLog PIC X(100) .
000369	  02 RunFailureCount PIC 9(3) .
000370	  02 RunSuccessCount PIC 9(3) .  	
000371	  02 TestRunCount PIC 9(3) .
000372	  02 TestSetupCount PIC 9(3) .  	
000380	  02 AssertFailureCount PIC 9(3) .
000388	  02 AssertTestCount PIC 9(3) .
000390	  02 use-log-file PIC 9 .	
000392	  02 nb-suite-run PIC 9(3).
000393	  02 CarRetourChariot PIC X(1).
000394	  02 LogLineLength PIC 9(5) .
000395	  02 index-current-suite PIC 99 .
000396	  02 index-current-test PIC 99 .
000397*	  02 index-current-assert PIC 99 .
000398	  02 name-current-suite PIC X(20) .
000399	  02 name-current-test PIC X(20) .
000400	  02 currentLogFile PIC X(24) .		
000401	  02 SuiteIndex PIC 9(2) .
000402	  02 TestIndex PIC 9(2) .
000403	  02 AssertIndex PIC 9(2).		
000404	  
000405	  02 log-entete-test PIC X(16).
000406	  02 log-asserts-res PIC X(32000).
000407	  02 log-fin-test PIC X(55).
000408	  02 log-entete-suite PIC X(30).
000410	  02 log-fin-suite PIC X(55).
000411	  
000412	  02 SuiteTests.
000413	    05 ListeSuites  OCCURS 50 .
000414	  	10 SuiteName PIC X(20).
000415	  	10 SuiteDesc PIC X(50).
000416	  	10 suite-size PIC 9(2).
000417	  	10 nb-test-size PIC 9(3).
000418	  	10 nb-test-run PIC 9(3).  
000419	  	10 nb-test-succeed PIC 9(3).  		
000420	  	10 nb-test-failed PIC 9(3).
000421	  	10 nb-test-error PIC 9(3).  		
000422	  	10 ListeTests OCCURS 100 TIMES.
000423	  		30 TestName PIC X(20).
000424	  		30 TestDesc PIC X(50).
000425	  		30 nb-assert-run PIC 9(3).
000426	  		30 nb-assert-succeed PIC 9(3).
000427	  		30 nb-assert-failed PIC 9(3).
000428*	  		30 ListeAssertRuns OCCURS 20 TIMES.
000429*	  			40 AssertRunName PIC X(20).
000430*	  			40 has-succeed PIC 9(1).
000431*	  			40 AssertValueExpected PIC X(255).
000432*	  			40 AssertValueActual PIC X(255).
000433
000442
000452		
000462* routines name
000463* 0-100: core routine
000464* 
000562
000572