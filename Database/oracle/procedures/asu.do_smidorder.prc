DROP PROCEDURE ASU.DO_SMIDORDER
/

--
-- DO_SMIDORDER  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PLITBLM (Synonym)
--   TSMID (Table)
--   INC (Procedure)
--
CREATE OR REPLACE PROCEDURE ASU."DO_SMIDORDER" (pFK_OWNER IN NUMBER, alpha IN NUMBER DEFAULT 4)
IS
  TYPE tIDs IS TABLE OF NUMBER
    INDEX BY BINARY_INTEGER;

  CURSOR c
  IS
    SELECT fk_id
      FROM tsmid
     ORDER BY fn_order;

  i      NUMBER;
  aIDs   tIDs;
BEGIN
  i := 0;
  FOR r IN c
  LOOP
    aIDs (i) := r.fk_id;
    inc (i);
  END LOOP;
  i := alpha;
  FOR j IN 0 .. aIDs.COUNT - 1
  LOOP
    UPDATE tsmid
       SET fn_order = i
     WHERE fk_id = aIDs (j);
    i := i + alpha;
  END LOOP;
END;   -- Procedure DO_SMIDORDER
/

SHOW ERRORS;


