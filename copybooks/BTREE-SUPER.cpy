*>================================================================*
*> BTREE-SUPER.cpy - B+ Tree Database Superblock (Page 1)
*>================================================================*
 01  SUPERBLOCK-RECORD.
     05  SB-MAGIC                PIC X(4) VALUE "BTR1".
     05  SB-ROOT-PAGE            PIC 9(9) COMP-5.
     05  SB-TOTAL-PAGES          PIC 9(9) COMP-5.
     05  SB-TOTAL-KEYS           PIC 9(9) COMP-5.
     05  SB-TREE-HEIGHT          PIC 9(4) COMP-5.
     05  SB-PADDING              PIC X(4070).
