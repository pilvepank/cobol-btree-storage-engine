*>================================================================
*> COPYBOOK: MVCC-STATE.cpy
*> PURPOSE:  Multi-Version Concurrency Control Snapshot Descriptors
*> ================================================================
 01  MVCC-TRANSACTION-CONTEXT.
     05  TX-ID                   PIC 9(12) COMP-5 VALUE 0.
     05  TX-READ-LSN             PIC 9(12) COMP-5 VALUE 0.
     05  TX-COMMIT-LSN           PIC 9(12) COMP-5 VALUE 0.
     05  TX-ISOLATION-LEVEL      PIC X(01) VALUE 'S'.
         88  TX-SNAPSHOT-ISOLATION VALUE 'S'.
         88  TX-SERIALIZABLE       VALUE 'Z'.
     05  TX-STATUS               PIC X(02) VALUE '00'.
         88  TX-ACTIVE           VALUE '00'.
         88  TX-CONFLICT-ABORT   VALUE 'CF'.
