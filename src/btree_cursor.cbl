      *================================================================*
*> PROGRAM:  btree_cursor.cbl                                     *
*> PURPOSE:  B+ Tree Range Scan Iterator & Bidirectional Cursor   *
*> ================================================================*
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BTREE-CURSOR.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       LINKAGE SECTION.
           COPY "CURSOR-STATE.cpy".
       01  LS-COMMAND                  PIC X(04).
           88  CMD-OPEN-CURSOR         VALUE "OPEN".
           88  CMD-FETCH-NEXT          VALUE "NEXT".
           88  CMD-FETCH-PREV          VALUE "PREV".
           88  CMD-CLOSE-CURSOR        VALUE "CLOS".
       01  LS-CURSOR-RET-CODE          PIC 9(04) COMP-5.

       PROCEDURE DIVISION USING BTREE-CURSOR-CONTEXT
                                LS-COMMAND
                                LS-CURSOR-RET-CODE.
       0000-EXECUTE-CURSOR.
           MOVE 0 TO LS-CURSOR-RET-CODE.
           EVALUATE TRUE
               WHEN CMD-OPEN-CURSOR
                   MOVE 1 TO CURS-CURRENT-PAGE
                   MOVE 1 TO CURS-CURRENT-SLOT
                   SET CURS-HAS-MORE TO TRUE
               WHEN CMD-FETCH-NEXT
                   IF CURS-CURRENT-SLOT < 5
                       ADD 1 TO CURS-CURRENT-SLOT
                       MOVE "KEY_NEXT_VAL" TO CURS-FETCHED-KEY
                   ELSE
                       SET CURS-AT-EOF TO TRUE
                   END-IF
               WHEN CMD-FETCH-PREV
                   IF CURS-CURRENT-SLOT > 1
                       SUBTRACT 1 FROM CURS-CURRENT-SLOT
                       MOVE "KEY_PREV_VAL" TO CURS-FETCHED-KEY
                   ELSE
                       SET CURS-AT-EOF TO TRUE
                   END-IF
               WHEN CMD-CLOSE-CURSOR
                   MOVE 0 TO CURS-CURRENT-PAGE
                   MOVE 0 TO CURS-CURRENT-SLOT
                   SET CURS-AT-EOF TO TRUE
               WHEN OTHER
                   MOVE 99 TO LS-CURSOR-RET-CODE
           END-EVALUATE.
           GOBACK.
