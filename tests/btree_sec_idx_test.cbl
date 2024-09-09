*>================================================================
*> PROGRAM:  btree_sec_idx_test.cbl
*> PURPOSE:  Unit Test Suite for B+ Tree Secondary Index Engine
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-SEC-IDX-TEST.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 COPY "SECONDARY-INDEX.cpy".
 01  WS-OP                  PIC X(01) VALUE 'I'.
 01  WS-KEY                 PIC X(16) VALUE "CUSTOMER-EE-001 ".
 01  WS-ROW                 PIC 9(09) COMP-5 VALUE 44029.
 01  WS-STAT                PIC X(02) VALUE '  '.
 01  WS-TESTS-RUN           PIC 9(04) VALUE 0.
 01  WS-TESTS-PASSED        PIC 9(04) VALUE 0.

 PROCEDURE DIVISION.
 0000-MAIN.
     DISPLAY "=================================================="
     DISPLAY "  B+ TREE SECONDARY NON-CLUSTERED INDEX TEST SUITE"
     DISPLAY "=================================================="
     
     ADD 1 TO WS-TESTS-RUN
     MOVE 'I' TO WS-OP
     MOVE "CUSTOMER-EE-001 " TO WS-KEY
     MOVE 44029 TO WS-ROW
     CALL "BTREE-SECONDARY-IDX" USING SEC-INDEX-DIRECTORY, WS-OP, WS-KEY, WS-ROW, WS-STAT
     
     MOVE 'F' TO WS-OP
     MOVE 0 TO WS-ROW
     CALL "BTREE-SECONDARY-IDX" USING SEC-INDEX-DIRECTORY, WS-OP, WS-KEY, WS-ROW, WS-STAT
     IF WS-STAT = '00' AND WS-ROW = 44029
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 1: Secondary Key Lookup Resolves RowID [PASS]"
     ELSE
         DISPLAY "TEST 1: Secondary Key Lookup Resolves RowID [FAIL]"
     END-IF
     
     ADD 1 TO WS-TESTS-RUN
     MOVE "ABSENT-KEY-999  " TO WS-KEY
     CALL "BTREE-SECONDARY-IDX" USING SEC-INDEX-DIRECTORY, WS-OP, WS-KEY, WS-ROW, WS-STAT
     IF WS-STAT = 'NF'
         ADD 1 TO WS-TESTS-PASSED
         DISPLAY "TEST 2: Missing Key Returns Not Found [PASS]"
     ELSE
         DISPLAY "TEST 2: Missing Key Returns Not Found [FAIL]"
     END-IF

     DISPLAY "--------------------------------------------------"
     DISPLAY "Secondary Index Tests Run:    " WS-TESTS-RUN
     DISPLAY "Secondary Index Tests Passed: " WS-TESTS-PASSED
     IF WS-TESTS-RUN = WS-TESTS-PASSED
         DISPLAY ">> ALL SECONDARY INDEX TESTS PASSED [100% OK] <<"
     ELSE
         DISPLAY ">> SOME SECONDARY INDEX TESTS FAILED <<"
     END-IF
     STOP RUN.
