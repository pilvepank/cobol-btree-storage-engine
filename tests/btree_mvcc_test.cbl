*>================================================================
*> PROGRAM:  btree_mvcc_test.cbl
*> PURPOSE:  Test Harness for B+ Tree MVCC Snapshot Visibility
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-MVCC-TEST.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "MVCC-STATE.cpy".
 01  WS-ROW-LSN             PIC 9(12) COMP-5 VALUE 100.
 01  WS-VISIBLE             PIC X(01) VALUE 'N'.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  B+ TREE MVCC SNAPSHOT VISIBILITY TEST SUITE     "
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 150 TO TX-READ-LSN
     MOVE 100 TO WS-ROW-LSN
     CALL "BTREE-MVCC" USING MVCC-TRANSACTION-CONTEXT, WS-ROW-LSN, WS-VISIBLE
     IF WS-VISIBLE = 'Y'
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Committed Before Read-LSN Visible [PASS]"
     ELSE
         DISPLAY "TEST 1: Committed Before Read-LSN Visible [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 80 TO TX-READ-LSN
     MOVE 100 TO WS-ROW-LSN
     CALL "BTREE-MVCC" USING MVCC-TRANSACTION-CONTEXT, WS-ROW-LSN, WS-VISIBLE
     IF WS-VISIBLE = 'N'
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Future Row Version Hidden from Snapshot [PASS]"
     ELSE
         DISPLAY "TEST 2: Future Row Version Hidden from Snapshot [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "MVCC Tests Run:    " WS-TESTS-RUN
     DISPLAY "MVCC Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL MVCC TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME MVCC TESTS FAILED <<"
     END-IF
     STOP RUN.
