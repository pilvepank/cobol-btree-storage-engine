*>================================================================
*> PROGRAM:  btree_bloom_test.cbl
*> PURPOSE:  Test Harness for B+ Tree In-Memory Bloom Filter
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-BLOOM-TEST.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "BLOOM-FILTER.cpy".
 01  WS-OP                  PIC X(01) VALUE 'A'.
 01  WS-KEY                 PIC 9(08) COMP-5 VALUE 1024.
 01  WS-MATCH               PIC X(01) VALUE 'N'.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  B+ TREE BLOOM FILTER DISK-SEEK GUARD TEST SUITE "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 'A' TO WS-OP
     MOVE 42 TO WS-KEY
     CALL "BTREE-BLOOM-FILTER" USING BLOOM-FILTER-BLOCK, WS-OP, WS-KEY, WS-MATCH
     
     MOVE 'T' TO WS-OP
     MOVE 42 TO WS-KEY
     CALL "BTREE-BLOOM-FILTER" USING BLOOM-FILTER-BLOCK, WS-OP, WS-KEY, WS-MATCH
     IF WS-MATCH = 'Y'
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Bloom Filter Positive Membership [PASS]"
     ELSE
         DISPLAY "TEST 1: Bloom Filter Positive Membership [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 'T' TO WS-OP
     MOVE 43 TO WS-KEY
     CALL "BTREE-BLOOM-FILTER" USING BLOOM-FILTER-BLOCK, WS-OP, WS-KEY, WS-MATCH
     IF WS-MATCH = 'N'
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Negative Key Absenteeism Check [PASS]"
     ELSE
         DISPLAY "TEST 2: Negative Key Absenteeism Check [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "Bloom Tests Run:    " WS-TESTS-RUN
     DISPLAY "Bloom Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL BLOOM FILTER TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME BLOOM FILTER TESTS FAILED <<"
     END-IF
     STOP RUN.
