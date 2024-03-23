      *================================================================*
*> COPYBOOK: WAL-RECORD.cpy                                       *
*> PURPOSE:  Write-Ahead Log (WAL) Crash Recovery Record Layout   *
*> ================================================================*
       01  WAL-FRAME-RECORD.
           05  WAL-LSN                 PIC 9(16) COMP-5.
           05  WAL-TX-ID               PIC 9(12) COMP-5.
           05  WAL-OP-TYPE             PIC X(01).
               88  WAL-OP-INSERT       VALUE 'I'.
               88  WAL-OP-DELETE       VALUE 'D'.
               88  WAL-OP-SPLIT        VALUE 'S'.
               88  WAL-OP-COMMIT       VALUE 'C'.
           05  WAL-PAGE-NUM            PIC 9(08) COMP-5.
           05  WAL-SLOT-NUM            PIC 9(04) COMP-5.
           05  WAL-KEY                 PIC X(16).
           05  WAL-PAYLOAD             PIC X(64).
           05  WAL-CHECKSUM            PIC 9(08) COMP-5.
