@echo off
call build.bat
btree_engine.exe
btree_test.exe
btree_wal_test.exe
btree_cursor_test.exe
btree_compact_test.exe
btree_mvcc_test.exe
btree_bloom_test.exe
btree_lock_test.exe
btree_sec_idx_test.exe
btree_buffer_test.exe
