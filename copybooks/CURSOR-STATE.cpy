      *================================================================*
*> COPYBOOK: CURSOR-STATE.cpy                                     *
*> PURPOSE:  B+ Tree Range Scan Cursor State Context              *
*> ================================================================*
       01  BTREE-CURSOR-CONTEXT.
           05  CURS-ID                 PIC 9(04) COMP-5.
           05  CURS-CURRENT-PAGE       PIC 9(08) COMP-5.
           05  CURS-CURRENT-SLOT       PIC 9(04) COMP-5.
           05  CURS-DIRECTION          PIC X(01).
               88  CURS-FORWARD        VALUE 'F'.
               88  CURS-BACKWARD       VALUE 'B'.
           05  CURS-EOF-FLAG           PIC X(01) VALUE 'N'.
               88  CURS-AT-EOF         VALUE 'Y'.
               88  CURS-HAS-MORE       VALUE 'N'.
           05  CURS-FETCHED-KEY        PIC X(16).
           05  CURS-FETCHED-VAL        PIC X(64).
