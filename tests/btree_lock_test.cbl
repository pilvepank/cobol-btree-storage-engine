*>================================================================
*> PROGRAM:  btree_lock_test.cbl
*> PURPOSE:  Unit Test Suite for 2PL Storage Page Lock Manager
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-LOCK-TEST.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "LOCK-MANAGER.cpy".
 01  WS-TXN                 PIC 9(09) COMP-5 VALUE 101.
 01  WS-PAGE                PIC 9(09) COMP-5 VALUE 77.
 01  WS-MODE                PIC X(01) VALUE 'S'.
 01  WS-STAT                PIC X(02) VALUE '  '.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  B+ TREE 2PL LOCK MANAGER CONCURRENCY TEST SUITE "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 0 TO LM-LOCK-COUNT
     MOVE 101 TO WS-TXN
     MOVE 77 TO WS-PAGE
     MOVE 'S' TO WS-MODE
     CALL "BTREE-LOCK-MANAGER" USING LOCK-MANAGER-TABLE, WS-TXN, WS-PAGE, WS-MODE, WS-STAT
     
     MOVE 102 TO WS-TXN
     MOVE 'S' TO WS-MODE
     CALL "BTREE-LOCK-MANAGER" USING LOCK-MANAGER-TABLE, WS-TXN, WS-PAGE, WS-MODE, WS-STAT
     IF WS-STAT = '00' AND LM-LOCK-COUNT = 2
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Shared Read Locks Coexist on Page [PASS]"
     ELSE
         DISPLAY "TEST 1: Shared Read Locks Coexist on Page [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 103 TO WS-TXN
     MOVE 'X' TO WS-MODE
     CALL "BTREE-LOCK-MANAGER" USING LOCK-MANAGER-TABLE, WS-TXN, WS-PAGE, WS-MODE, WS-STAT
     IF WS-STAT = 'CF'
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Exclusive Lock Blocked by Active Shared [PASS]"
     ELSE
         DISPLAY "TEST 2: Exclusive Lock Blocked by Active Shared [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "Lock Tests Run:    " WS-TESTS-RUN
     DISPLAY "Lock Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL LOCK MANAGER TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME LOCK MANAGER TESTS FAILED <<"
     END-IF
     STOP RUN.
