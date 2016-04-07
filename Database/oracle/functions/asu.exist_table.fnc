DROP FUNCTION ASU.EXIST_TABLE
/

--
-- EXIST_TABLE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   ALL_TABLES (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."EXIST_TABLE" (owne_tabl varchar2,nam_tabl varchar2) return integer is
    num integer;
begin
    select count(*) into num from all_tables where (owner=owne_tabl and table_name=nam_tabl);
    return num;
end exist_table;
/

SHOW ERRORS;


