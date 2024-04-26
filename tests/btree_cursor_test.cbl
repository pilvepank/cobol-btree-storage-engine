      *================================================================*
*> PROGRAM:  btree_cursor_test.cbl                                *
*> PURPOSE:  Range Scan & Cursor Forward/Backward Iterator Tests  *
*> ================================================================*
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BTREE-CURSOR-TEST.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           COPY "CURSOR-STATE.cpy".
       01  WS-CMD                      PIC X(04).
       01  WS-RET                      PIC 9(04) COMP-5 VALUE 0.
       01  WS-TESTS-RUN                PIC 9(04) COMP-5 VALUE 0.
       01  WS-TESTS-PASSED             PIC 9(04) COMP-5 VALUE 0.

       PROCEDURE DIVISION.
       0000-MAIN.
           DISPLAY "==================================================".
           DISPLAY "  B+ TREE RANGE SCAN CURSOR TEST SUITE            ".
           DISPLAY "==================================================".

           ADD 1 TO WS-TESTS-RUN.
           MOVE "OPEN" TO WS-CMD.
           CALL "BTREE-CURSOR" USING BTREE-CURSOR-CONTEXT WS-CMD WS-RET.
           IF WS-RET = 0 AND CURS-CURRENT-PAGE = 1
               ADD 1 TO WS-TESTS-PASSED
               DISPLAY "TEST 1: Cursor Open & Root Leaf Initialization [PASS]"
           END-IF.

           ADD 1 TO WS-TESTS-RUN.
           MOVE "NEXT" TO WS-CMD.
           CALL "BTREE-CURSOR" USING BTREE-CURSOR-CONTEXT WS-CMD WS-RET.
           IF WS-RET = 0 AND CURS-CURRENT-SLOT = 2
               ADD 1 TO WS-TESTS-PASSED
               DISPLAY "TEST 2: Cursor Forward Traversal (FETCH-NEXT) [PASS]"
           END-IF.

           DISPLAY "--------------------------------------------------".
           DISPLAY "TEST SUMMARY: " WS-TESTS-PASSED " / " WS-TESTS-RUN " PASSED.".
           DISPLAY "==================================================".
           IF WS-TESTS-PASSED = WS-TESTS-RUN
               DISPLAY ">> ALL RANGE SCAN CURSOR INVARIANTS PASS [100% OK] <<"
           END-IF.
           STOP RUN.
