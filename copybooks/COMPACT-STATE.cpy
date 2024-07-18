*>================================================================
*> COPYBOOK: COMPACT-STATE.cpy
*> PURPOSE:  B+ Tree Defragmentation & Page Reclaim Descriptor
*> ================================================================
 01  COMPACT-STATISTICS.
     05  CS-PAGES-SCANNED        PIC 9(06) COMP-5 VALUE 0.
     05  CS-DEAD-KEYS-REMOVED    PIC 9(06) COMP-5 VALUE 0.
     05  CS-PAGES-RECLAIMED      PIC 9(06) COMP-5 VALUE 0.
     05  CS-FRAGMENTATION-PCT    PIC 9(03) VALUE 0.
