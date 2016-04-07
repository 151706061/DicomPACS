DROP FUNCTION ASU.GET_VRACHFCOTDEL
/

--
-- GET_VRACHFCOTDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--   TOTDEL (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."GET_VRACHFCOTDEL" -- Created by TimurLan for PKG_REGIST_REPORTS
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  dTemp VARCHAR2(1000);
  CURSOR cTemp IS SELECT fc_name
                    FROM totdel
                   WHERE totdel.fk_id = (select tsotr.fk_otdid from tsotr where tsotr.fk_id = pFK_ID);
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO dTemp;
  CLOSE cTemp;
  RETURN NVL(dTemp,'Не указан');
END;
/

SHOW ERRORS;


DROP SYNONYM BUH.GET_VRACHFCOTDEL
/

--
-- GET_VRACHFCOTDEL  (Synonym) 
--
--  Dependencies: 
--   GET_VRACHFCOTDEL (Function)
--
CREATE SYNONYM BUH.GET_VRACHFCOTDEL FOR ASU.GET_VRACHFCOTDEL
/


