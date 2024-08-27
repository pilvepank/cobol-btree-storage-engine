*>================================================================
*> PROGRAM:  btree_bloom_filter.cbl
*> PURPOSE:  Bloom Filter Bitset Hash Tester to Avoid Disk Seeks
*> ================================================================
 IDENTIFICATION DIVISION.
 PROGRAM-ID. BTREE-BLOOM-FILTER.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 01  WS-SLOT                PIC 9(04) COMP-5 VALUE 1.

 LINKAGE SECTION.
 COPY "BLOOM-FILTER.cpy".
 01  LS-OP                  PIC X(01).
 01  LS-KEY                 PIC 9(08) COMP-5.
 01  LS-MATCH-FLAG          PIC X(01).

 PROCEDURE DIVISION USING BLOOM-FILTER-BLOCK, LS-OP, LS-KEY, LS-MATCH-FLAG.
 0000-MAIN.
     COMPUTE WS-SLOT = FUNCTION MOD(LS-KEY, 32) + 1
     IF LS-OP = 'A'
         MOVE 1 TO BF-WORD(WS-SLOT)
         ADD 1 TO BF-KEY-COUNT
         MOVE 'Y' TO LS-MATCH-FLAG
     ELSE
         IF BF-WORD(WS-SLOT) = 1
             MOVE 'Y' TO LS-MATCH-FLAG
         ELSE
             MOVE 'N' TO LS-MATCH-FLAG
         END-IF
     END-IF
     GOBACK.
