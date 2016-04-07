DROP FUNCTION ASU.DO_OTDNAME
/

--
-- DO_OTDNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TOTDEL (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."DO_OTDNAME" ( fk_otdid in number) RETURN  varchar2
IS
  cursor c(pID in number) is select fc_name from totdel where fk_id=pID;
BEGIN
  for i in c(fk_otdid) loop
    return i.fc_name;
  end loop;
END; -- Function DO_OTDNAME
/

SHOW ERRORS;


