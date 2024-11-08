*>================================================================
*> PROGRAM:  btree_buffer_pool.cbl
*> PURPOSE:  LRU Page Frame Buffer Pool & Eviction Manager
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-BUFFER-POOL.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 01  WS-I                   PIC 9(04) COMP-5.
 01  WS-FOUND               PIC X(01) VALUE 'N'.

 LINKAGE SECTION.
 COPY "BUFFER-POOL.cpy".
 01  LS-PAGE-ID             PIC 9(09) COMP-5.
 01  LS-HIT-STATUS          PIC X(02).
     88  BP-STATUS-HIT      VALUE 'HI'.
     88  BP-STATUS-MISS     VALUE 'MS'.

 PROCEDURE DIVISION USING BUFFER-POOL-STATE, LS-PAGE-ID, LS-HIT-STATUS.
 0000-MAIN.
     MOVE 'N' TO WS-FOUND
     PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > BP-ACTIVE-PAGES
         IF BP-PAGE-NUM(WS-I) = LS-PAGE-ID
             MOVE 'Y' TO WS-FOUND
             ADD 1 TO BP-HIT-COUNT
             MOVE 'HI' TO LS-HIT-STATUS
         END-IF
     END-PERFORM
     IF WS-FOUND = 'N'
         ADD 1 TO BP-MISS-COUNT
         MOVE 'MS' TO LS-HIT-STATUS
         IF BP-ACTIVE-PAGES < BP-POOL-CAPACITY
             ADD 1 TO BP-ACTIVE-PAGES
             MOVE LS-PAGE-ID TO BP-PAGE-NUM(BP-ACTIVE-PAGES)
         END-IF
     END-IF
     GOBACK.
