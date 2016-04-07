DROP PROCEDURE ASU.DONOPARALLEL
/

--
-- DONOPARALLEL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   ALL_OBJECTS (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE PROCEDURE ASU."DONOPARALLEL" 
is
cursor c is select object_name,object_type from all_objects where OBJECT_TYPE in ('TABLE', 'INDEX') and owner = 'ASU';
begin
  for i in c loop
    execute immediate 'alter '||i.object_type||' '||i.object_name||' noparallel';
  end loop;
end;
/

SHOW ERRORS;


