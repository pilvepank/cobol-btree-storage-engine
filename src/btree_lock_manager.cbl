*>================================================================
*> PROGRAM:  btree_lock_manager.cbl
*> PURPOSE:  Two-Phase Locking (2PL) Concurrency Control Matrix
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-LOCK-MANAGER.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 01  WS-I                   PIC 9(04) COMP-5.

 LINKAGE SECTION.
 COPY "LOCK-MANAGER.cpy".
 01  LS-TXN-ID              PIC 9(09) COMP-5.
 01  LS-PAGE-ID             PIC 9(09) COMP-5.
 01  LS-REQ-MODE            PIC X(01).
 01  LS-GRANT-STATUS        PIC X(02).
     88  LM-GRANT-OK        VALUE '00'.
     88  LM-GRANT-CONFLICT  VALUE 'CF'.

 PROCEDURE DIVISION USING LOCK-MANAGER-TABLE, LS-TXN-ID, LS-PAGE-ID, LS-REQ-MODE, LS-GRANT-STATUS.
 0000-MAIN.
     MOVE '00' TO LS-GRANT-STATUS
     PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > LM-LOCK-COUNT
         IF LM-PAGE-ID(WS-I) = LS-PAGE-ID
             IF LM-TXN-ID(WS-I) NOT = LS-TXN-ID
                 IF LM-LOCK-MODE(WS-I) = 'X' OR LS-REQ-MODE = 'X'
                     MOVE 'CF' TO LS-GRANT-STATUS
                 END-IF
             END-IF
         END-IF
     END-PERFORM
     IF LS-GRANT-STATUS = '00' AND LM-LOCK-COUNT < 32
         ADD 1 TO LM-LOCK-COUNT
         MOVE LS-PAGE-ID TO LM-PAGE-ID(LM-LOCK-COUNT)
         MOVE LS-TXN-ID TO LM-TXN-ID(LM-LOCK-COUNT)
         MOVE LS-REQ-MODE TO LM-LOCK-MODE(LM-LOCK-COUNT)
     END-IF
     GOBACK.
