*>================================================================
*> COPYBOOK: BUFFER-POOL.cpy
*> PURPOSE:  B+ Tree LRU Buffer Pool Page Cache Descriptor
*> ================================================================
 01  BUFFER-POOL-STATE.
     05  BP-POOL-CAPACITY        PIC 9(04) COMP-5 VALUE 16.
     05  BP-ACTIVE-PAGES         PIC 9(04) COMP-5 VALUE 0.
     05  BP-HIT-COUNT            PIC 9(09) COMP-5 VALUE 0.
     05  BP-MISS-COUNT           PIC 9(09) COMP-5 VALUE 0.
     05  BP-FRAMES OCCURS 16 TIMES INDEXED BY BP-IDX.
         10  BP-PAGE-NUM         PIC 9(09) COMP-5 VALUE 0.
         10  BP-PIN-COUNT        PIC 9(04) COMP-5 VALUE 0.
         10  BP-DIRTY-FLAG       PIC X(01) VALUE 'N'.
         10  BP-LAST-ACCESSED    PIC 9(09) COMP-5 VALUE 0.
