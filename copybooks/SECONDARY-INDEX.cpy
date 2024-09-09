*>================================================================
*> COPYBOOK: SECONDARY-INDEX.cpy
*> PURPOSE:  Non-Clustered Secondary Index Key-to-RowID Mapping
*> ================================================================
 01  SEC-INDEX-DIRECTORY.
     05  SEC-ENTRY-COUNT         PIC 9(04) COMP-5 VALUE 0.
     05  SEC-ENTRIES OCCURS 64 TIMES INDEXED BY SEC-IDX.
         10  SEC-SEARCH-KEY      PIC X(16) VALUE SPACES.
         10  SEC-PRIMARY-ROW-ID  PIC 9(09) COMP-5 VALUE 0.
