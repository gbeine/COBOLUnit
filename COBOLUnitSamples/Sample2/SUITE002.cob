000010*>
000020 IDENTIFICATION DIVISION.
000030 PROGRAM-ID.   SUITE002.
000040 ENVIRONMENT    DIVISION.
000050 CONFIGURATION  SECTION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000091          COPY CBUC0002.
000092      COPY CBUC0001.
000093          01 str1 PIC X(20).
000094          01 str2 PIC X(100).
000095          01 RES PIC 99.
000097 PROCEDURE DIVISION .
000098   INITIALIZE str1 str2.
000099   MOVE "SUITE2" TO str1.
000100   MOVE "DESC SUITE2" TO str2.
000101   CALL CBU-initialize USING CBU-ctx.
000102   CALL CBU-add-suite USING CBU-ctx str1 str2.
000108
000109
000110   INITIALIZE str1 str2.
000111   MOVE "TS000002" TO str1.
000112   MOVE "TEST2 desc" TO str2.
000114   CALL CBU-add-test-next USING CBU-ctx str1 str2.
000120
000121  CALL CBU-run USING CBU-ctx.
000130 END PROGRAM SUITE002.
