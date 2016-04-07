DROP FUNCTION ASU.ZAMSGLAV_FIO
/

--
-- ZAMSGLAV_FIO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."ZAMSGLAV_FIO" RETURN varchar2 IS
  sname varchar2(100);
  sotch varchar2(100);
  sfam varchar2(100);
  sres varchar2(100);
BEGIN
  select fc_name, fc_otch, fc_fam into sname, sotch, sfam from tsotr where fk_id=1281;
  sres:=SUBSTR(sname, 1, 1)||'. '||SUBSTR(sotch, 1, 1)|| '. '||initcap(sfam);
  return sres;
END;
/

SHOW ERRORS;


DROP SYNONYM STAT.ZAMSGLAV_FIO
/

--
-- ZAMSGLAV_FIO  (Synonym) 
--
--  Dependencies: 
--   ZAMSGLAV_FIO (Function)
--
CREATE SYNONYM STAT.ZAMSGLAV_FIO FOR ASU.ZAMSGLAV_FIO
/


