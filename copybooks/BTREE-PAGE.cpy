*>================================================================*
*> BTREE-PAGE.cpy - 4096-Byte Node Page Layout (Internal & Leaf)
*>================================================================*
 01  B-TREE-NODE-RECORD.
     05  PAGE-HEADER.
         10  HDR-PAGE-ID         PIC 9(9)   COMP-5.
         10  HDR-PAGE-TYPE       PIC X.
             88  IS-LEAF         VALUE "L".
             88  IS-INTERNAL     VALUE "I".
             88  IS-SUPER        VALUE "S".
         10  HDR-KEY-COUNT       PIC 9(4)   COMP-5.
         10  HDR-NEXT-LEAF       PIC 9(9)   COMP-5.
         10  HDR-PREV-LEAF       PIC 9(9)   COMP-5.
         10  HDR-PARENT-ID       PIC 9(9)   COMP-5.
     05  PAGE-BODY-RAW           PIC X(4060).
     05  INTERNAL-NODE REDEFINES PAGE-BODY-RAW.
         10  INT-KEYS OCCURS 8 TIMES PIC X(32).
         10  INT-CHILDREN OCCURS 9 TIMES PIC 9(9) COMP-5.
     05  LEAF-NODE REDEFINES PAGE-BODY-RAW.
         10  LEAF-ENTRIES OCCURS 8 TIMES.
             15  LEAF-KEY        PIC X(32).
             15  LEAF-VAL        PIC X(64).
