DROP PROCEDURE ASU.REBUILD_ALL_INDEXES
/

--
-- REBUILD_ALL_INDEXES  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   USER_INDEXES (Synonym)
--
CREATE OR REPLACE PROCEDURE ASU."REBUILD_ALL_INDEXES" 
IS
  CURSOR c
  IS
    SELECT 'alter index ' || index_name || ' rebuild' AS fc_sql
      FROM user_indexes
     WHERE index_type = 'NORMAL';
BEGIN
  FOR i IN c
  LOOP
    EXECUTE IMMEDIATE i.fc_sql;
  END LOOP;
END;
/

SHOW ERRORS;


