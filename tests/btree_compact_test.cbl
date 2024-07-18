*>================================================================
*> PROGRAM:  btree_compact_test.cbl
*> PURPOSE:  Test Harness for B+ Tree Defragmenter
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-COMPACT-TEST.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "COMPACT-STATE.cpy".
 01  WS-TOTAL               PIC 9(06) COMP-5 VALUE 100.
 01  WS-ACTIVE              PIC 9(06) COMP-5 VALUE 75.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  B+ TREE DEFRAGMENTATION TEST SUITE              "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     CALL "BTREE-COMPACT" USING COMPACT-STATISTICS, WS-TOTAL, WS-ACTIVE
     IF CS-PAGES-RECLAIMED = 25 AND CS-FRAGMENTATION-PCT = 25
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Page Space Reclaim Invariant [PASS]"
     ELSE
         DISPLAY "TEST 1: Page Space Reclaim Invariant [FAIL]"
     END-IF
     
     DISPLAY "--------------------------------------------------"
     DISPLAY "Compact Tests Run:    " WS-TESTS-RUN
     DISPLAY "Compact Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL COMPACTION TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME COMPACTION TESTS FAILED <<"
     END-IF
     STOP RUN.
