000010*>
000020 IDENTIFICATION DIVISION.
000030 PROGRAM-ID.   CTU000S1.
000040 ENVIRONMENT    DIVISION.
000060 DATA DIVISION.
000070 WORKING-STORAGE SECTION.
000071  COPY CBUC0002.
000072  COPY CBUC0001.
000073  COPY CTUC0001.
000080 PROCEDURE DIVISION.
000090          INITIALIZE string-expected.
000091          INITIALIZE string-actual.
000092      MOVE "Suite1" TO suite-name1.
000093      MOVE "Suite2" TO suite-name2.
000094      MOVE "Suite3" TO suite-name3.
000095      MOVE "Suite1 description blablabla" TO
000096                                                  suite-desc1.
000097      MOVE "Suite2 description descriop" TO
000098                                                  suite-desc2.
000099      MOVE "Suite3 more Suite3" TO suite-desc3.
000100      CALL CBU-initialize USING CBU-ctx.
000101      MOVE "test-nb-suite-1" TO assert-name.
000102
000103          MOVE "CTU0S1T1" TO suite1-test1-name.
000104      MOVE "CTU0S1T2" TO suite1-test2-name.
000105      MOVE "CTU0S2T1" TO suite2-test1-name.
000106      MOVE "CTU0S3T1" TO suite3-test1-name.
000107      MOVE "CTU0S3T2" TO suite3-test2-name.
000108      MOVE "CTU0S3T3" TO suite3-test3-name.
000109
000110          MOVE "suite1-test1-desc" TO suite1-test1-desc.
000111      MOVE "suite1-test2-desc" TO suite1-test2-desc.
000112      MOVE "suite2-test1-desc" TO suite2-test1-desc.
000113      MOVE "suite3-test1-desc" TO suite3-test1-desc.
000114      MOVE "suite3-test2-desc" TO suite3-test2-desc.
000115      MOVE "suite3-test3-desc" TO suite3-test3-desc.
000116
000119* Add suite1
000120      CALL CBU-add-suite
000121          USING CBU-ctx suite-name1 suite-desc1.
000122** Add test to suite1
000123      CALL CBU-add-test-next USING
000124          CBU-ctx suite1-test1-name suite1-test1-desc.
000125      CALL CBU-add-test-next USING
000126          CBU-ctx suite1-test2-name suite1-test2-desc.
000127
000128* Add suite2
000129      CALL CBU-add-suite
000130          USING CBU-ctx suite-name2 suite-desc2.
000131** Add tests to suite2
000132          CALL CBU-add-test-next USING
000133          CBU-ctx suite2-test1-name suite2-test1-desc.
000137* Add Suite3
000140*     CALL CBU-add-suite USING CBU-ctx suite-name3 suite-desc3.
000141** Add test to suite3
000143*     CALL CBU-add-test-next USING
000144*         CBU-ctx suite3-test1-name suite3-test1-desc.
000145*     CALL CBU-add-test-next USING
000147*         CBU-ctx suite3-test2-name suite3-test2-desc.
000149*     CALL CBU-add-test-next USING
000151*         CBU-ctx suite3-test3-name suite3-test3-desc.
000153
000154
000155      CALL CBU-run USING CBU-ctx.
000156*     CALL CBU-display-res.
000157*         CALL CBU-display-suite.
000158
000160 END PROGRAM CTU000S1.
