DROP FUNCTION ASU.IS_SOTR_ADMIN
/

--
-- IS_SOTR_ADMIN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAPP (Table)
--   TAPPSOTR (Table)
--   TSOTR (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_SOTR_ADMIN" 
  ( aSotrID IN NUMBER)
  RETURN  NUMBER IS
   Res NUMBER;
BEGIN 
SELECT
   count(1)
into Res   
FROM LOGIN.TAPP, LOGIN.TAPPSOTR, LOGIN.TSOTR
WHERE

 TAPPSOTR.FK_SOTRID = TSOTR.fk_id AND 
 TAPPSOTR.FK_APPID  = TAPP.fk_id AND
 TSOTR.fk_id= aSotrID and 
 UPPER(TAPP.fc_fname) = UPPER('aAdmin.exe');
 
  if Res > 0 then
    Res := 1;
  end if;
  return Res;
END;
/

SHOW ERRORS;


