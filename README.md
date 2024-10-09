# Pure COBOL B+ Tree Storage Engine

A zero-dependency, on-disk B+ Tree database storage engine built from scratch in pure COBOL-85 / COBOL 2002 (compatible with GnuCOBOL 3.2+).

## Architecture & Data Layout
* **4096-Byte Binary Pages**: Exact page framing using `ORGANIZATION IS RELATIVE` direct-access record files.
* **Superblock (Page 1)**: Header page with magic `BTR1`, root pointer, total page allocation count, and tree height.
* **Node Types**:
  * `Internal Nodes`: Contain ordered discriminator keys and child page pointers.
  * `Leaf Nodes`: Contain ordered keys and value payloads, linked horizontally via `NEXT-LEAF` and `PREV-LEAF` pointers.
* **Autonomous Splitting**: Nodes split 50/50 upon reaching capacity, promoting median keys up to internal parents and dynamically growing tree height.

## Building and Running
```cmd
build.bat
run.bat
```


## Extended Storage Subsystems
* **Write-Ahead Logging (WAL)**: Crash consistency and REDO playback.
* **Bidirectional Cursor**: Range scan traversals (`FETCH-NEXT`, `FETCH-PREV`).
* **Index FSCK**: Offline pointer validation.


## Extended Storage Subsystems
* **Write-Ahead Logging (WAL)**: Crash consistency and REDO playback.
* **Bidirectional Cursor**: Range scan traversals (`FETCH-NEXT`, `FETCH-PREV`).
* **Online Defragmenter**: Reclaims dead space and tracks compaction statistics.
* **Index FSCK**: Offline pointer validation.


## Extended Storage Subsystems
* **Write-Ahead Logging (WAL)**: Crash consistency and REDO playback.
* **Bidirectional Cursor**: Range scan traversals (`FETCH-NEXT`, `FETCH-PREV`).
* **Online Defragmenter**: Reclaims dead space and tracks compaction statistics.
* **Index FSCK**: Offline pointer validation.


## Extended Storage Subsystems
* **Write-Ahead Logging (WAL)**: Crash consistency and REDO playback.
* **Bidirectional Cursor**: Range scan traversals (`FETCH-NEXT`, `FETCH-PREV`).
* **Online Defragmenter**: Reclaims dead space and tracks compaction statistics.
* **Index FSCK**: Offline pointer validation.


## Extended Storage Subsystems
* **Write-Ahead Logging (WAL)**: Crash consistency and REDO playback.
* **Bidirectional Cursor**: Range scan traversals (`FETCH-NEXT`, `FETCH-PREV`).
* **Online Defragmenter**: Reclaims dead space and tracks compaction statistics.
* **Index FSCK**: Offline pointer validation.


## Extended Storage Subsystems
* **Write-Ahead Logging (WAL)**: Crash consistency and REDO playback.
* **Bidirectional Cursor**: Range scan traversals (`FETCH-NEXT`, `FETCH-PREV`).
* **Online Defragmenter**: Reclaims dead space and tracks compaction statistics.
* **Index FSCK**: Offline pointer validation.
