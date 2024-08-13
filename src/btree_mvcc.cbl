*>================================================================
*> PROGRAM:  btree_mvcc.cbl
*> PURPOSE:  B+ Tree Multi-Version Snapshot Validator
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-MVCC.

 DATA DIVISION.
 WORKING-STORAGE SECTION.

 LINKAGE SECTION.
 COPY "MVCC-STATE.cpy".
 01  LS-ROW-VERSION-LSN     PIC 9(12) COMP-5.
 01  LS-VISIBLE-FLAG        PIC X(01).

 PROCEDURE DIVISION USING MVCC-TRANSACTION-CONTEXT, LS-ROW-VERSION-LSN, LS-VISIBLE-FLAG.
 0000-MAIN.
     IF LS-ROW-VERSION-LSN <= TX-READ-LSN
         MOVE 'Y' TO LS-VISIBLE-FLAG
     ELSE
         MOVE 'N' TO LS-VISIBLE-FLAG
     END-IF
     GOBACK.
