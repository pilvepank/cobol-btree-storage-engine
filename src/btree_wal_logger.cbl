      *================================================================*
*> PROGRAM:  btree_wal_logger.cbl                                 *
*> PURPOSE:  Write-Ahead Log Journaling & REDO Playback Engine    *
*> ================================================================*
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BTREE-WAL-LOGGER.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TOTAL-WAL-FRAMES         PIC 9(08) COMP-5 VALUE 0.
       01  WS-LAST-COMMITTED-LSN       PIC 9(16) COMP-5 VALUE 0.

       LINKAGE SECTION.
           COPY "WAL-RECORD.cpy".
       01  LS-WAL-STATUS               PIC 9(04) COMP-5.

       PROCEDURE DIVISION USING WAL-FRAME-RECORD
                                LS-WAL-STATUS.
       0000-PROCESS-WAL.
           MOVE 0 TO LS-WAL-STATUS.
           ADD 1 TO WS-TOTAL-WAL-FRAMES.
           MOVE WAL-LSN TO WS-LAST-COMMITTED-LSN.
           GOBACK.
