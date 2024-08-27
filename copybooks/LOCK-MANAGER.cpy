*>================================================================
*> COPYBOOK: LOCK-MANAGER.cpy
*> PURPOSE:  Strict Two-Phase Locking (2PL) Resource Table
*> ================================================================
 01  LOCK-MANAGER-TABLE.
     05  LM-LOCK-COUNT           PIC 9(04) COMP-5 VALUE 0.
     05  LM-LOCKS OCCURS 32 TIMES INDEXED BY LM-IDX.
         10  LM-PAGE-ID          PIC 9(09) COMP-5 VALUE 0.
         10  LM-TXN-ID           PIC 9(09) COMP-5 VALUE 0.
         10  LM-LOCK-MODE        PIC X(01) VALUE 'S'.
             88  LM-MODE-SHARED  VALUE 'S'.
             88  LM-MODE-EXCL    VALUE 'X'.
