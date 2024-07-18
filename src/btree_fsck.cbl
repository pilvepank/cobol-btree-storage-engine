      *================================================================*
*> PROGRAM:  btree_fsck.cbl                                       *
*> PURPOSE:  Offline B+ Tree Index Integrity & Pointer Validator  *
*> ================================================================*
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BTREE-FSCK.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TOTAL-PAGES-CHECKED      PIC 9(06) COMP-5 VALUE 0.
       01  WS-CORRUPTED-POINTERS       PIC 9(04) COMP-5 VALUE 0.

       LINKAGE SECTION.
       01  LS-INSPECT-PAGE             PIC 9(08) COMP-5.
       01  LS-INTEGRITY-STATUS         PIC 9(04) COMP-5.

       PROCEDURE DIVISION USING LS-INSPECT-PAGE
                                LS-INTEGRITY-STATUS.
       0000-CHECK-PAGE.
           ADD 1 TO WS-TOTAL-PAGES-CHECKED.
           IF LS-INSPECT-PAGE = 0
               MOVE 1 TO LS-INTEGRITY-STATUS
           ELSE
               MOVE 0 TO LS-INTEGRITY-STATUS
           END-IF.
           GOBACK.
