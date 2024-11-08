*>================================================================
*> PROGRAM:  btree_buffer_test.cbl
*> PURPOSE:  Unit Test Suite for B+ Tree LRU Buffer Pool Manager
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-BUFFER-TEST.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "BUFFER-POOL.cpy".
 01  WS-PAGE-ID             PIC 9(09) COMP-5 VALUE 100.
 01  WS-STAT                PIC X(02) VALUE '  '.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  B+ TREE LRU BUFFER POOL CACHE TEST SUITE        "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 0 TO BP-ACTIVE-PAGES
     MOVE 0 TO BP-HIT-COUNT
     MOVE 0 TO BP-MISS-COUNT
     MOVE 100 TO WS-PAGE-ID
     CALL "BTREE-BUFFER-POOL" USING BUFFER-POOL-STATE, WS-PAGE-ID, WS-STAT
     IF WS-STAT = 'MS' AND BP-ACTIVE-PAGES = 1 AND BP-MISS-COUNT = 1
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Cold Cache Miss Allocates Frame [PASS]"
     ELSE
         DISPLAY "TEST 1: Cold Cache Miss Allocates Frame [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     CALL "BTREE-BUFFER-POOL" USING BUFFER-POOL-STATE, WS-PAGE-ID, WS-STAT
     IF WS-STAT = 'HI' AND BP-HIT-COUNT = 1
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Warm Cache Hit Increments Hit Counter [PASS]"
     ELSE
         DISPLAY "TEST 2: Warm Cache Hit Increments Hit Counter [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "Buffer Tests Run:    " WS-TESTS-RUN
     DISPLAY "Buffer Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL BUFFER POOL TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME BUFFER POOL TESTS FAILED <<"
     END-IF
     STOP RUN.
