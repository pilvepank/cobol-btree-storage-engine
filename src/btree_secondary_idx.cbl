*>================================================================
*> PROGRAM:  btree_secondary_idx.cbl
*> PURPOSE:  Secondary Non-Clustered Index Key Mapper & Lookup
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-SECONDARY-IDX.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 01  WS-I                   PIC 9(04) COMP-5.

 LINKAGE SECTION.
 COPY "SECONDARY-INDEX.cpy".
 01  LS-OP                  PIC X(01).
 01  LS-KEY                 PIC X(16).
 01  LS-ROW-ID              PIC 9(09) COMP-5.
 01  LS-STATUS              PIC X(02).
     88  SEC-OK             VALUE '00'.
     88  SEC-NOT-FOUND      VALUE 'NF'.

 PROCEDURE DIVISION USING SEC-INDEX-DIRECTORY, LS-OP, LS-KEY, LS-ROW-ID, LS-STATUS.
 0000-MAIN.
     IF LS-OP = 'I'
         IF SEC-ENTRY-COUNT < 64
             ADD 1 TO SEC-ENTRY-COUNT
             MOVE LS-KEY TO SEC-SEARCH-KEY(SEC-ENTRY-COUNT)
             MOVE LS-ROW-ID TO SEC-PRIMARY-ROW-ID(SEC-ENTRY-COUNT)
             MOVE '00' TO LS-STATUS
         END-IF
     ELSE
         MOVE 'NF' TO LS-STATUS
         PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > SEC-ENTRY-COUNT
             IF SEC-SEARCH-KEY(WS-I) = LS-KEY
                 MOVE SEC-PRIMARY-ROW-ID(WS-I) TO LS-ROW-ID
                 MOVE '00' TO LS-STATUS
             END-IF
         END-PERFORM
     END-IF
     GOBACK.
