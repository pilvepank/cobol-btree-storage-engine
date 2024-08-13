*>================================================================
*> COPYBOOK: BLOOM-FILTER.cpy
*> PURPOSE:  In-Memory Bloom Filter Bitset & Membership Descriptor
*> ================================================================
 01  BLOOM-FILTER-BLOCK.
     05  BF-BITSET-WORDS OCCURS 32 TIMES INDEXED BY BF-IDX.
         10  BF-WORD             PIC 9(09) COMP-5 VALUE 0.
     05  BF-KEY-COUNT            PIC 9(08) COMP-5 VALUE 0.
     05  BF-FILTER-CAPACITY      PIC 9(08) COMP-5 VALUE 1000.
