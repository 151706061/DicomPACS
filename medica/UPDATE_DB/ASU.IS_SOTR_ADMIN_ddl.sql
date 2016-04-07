-- Start of DDL Script for Function ASU.IS_SOTR_ADMIN
-- Generated 1.07.08 11:30:05 from ASU@ASU

CREATE OR REPLACE 
FUNCTION     asu.is_sotr_admin
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

quit
/

-- End of DDL Script for Function ASU.IS_SOTR_ADMIN

