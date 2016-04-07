DROP FUNCTION ASU.GET_MKB10_BY_ID
/

--
-- GET_MKB10_BY_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_mkb10_by_id(pid in number) return varchar2 IS
--получаем код МКБ-10 по ид смида
PRAGMA AUTONOMOUS_TRANSACTION;
  Result varchar2(200);
CURSOR c IS
SELECT s.fk_mkb10 FROM asu.tsmid s WHERE s.fk_id = pid;
begin
  OPEN c;
  FETCH c INTO RESULT;
  IF c%NOTFOUND THEN RESULT := NULL; END IF;
  CLOSE c;
  return(Result);
end get_mkb10_by_id;
/

SHOW ERRORS;


