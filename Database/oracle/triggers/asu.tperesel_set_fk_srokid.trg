DROP TRIGGER ASU.TPERESEL_SET_FK_SROKID
/

--
-- TPERESEL_SET_FK_SROKID  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSROKY (Table)
--   TPERESEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL_SET_FK_SROKID" 
 BEFORE 
 INSERT OR UPDATE
 ON ASU.TPERESEL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
CURSOR cTemp IS SELECT /*+rule*/ FK_ID,FD_DATA1,FD_DATA3,FK_PRYB FROM TSROKY WHERE FK_PACID=:NEW.FK_PACID ORDER BY FK_ID;
--CURSOR cPer IS SELECT /*+rule*/  FD_DATA1 FROM TPERESEL WHERE FK_PACID=:OLD.FK_PACID;
dTemp DATE;
Data1 DATE;
Data2 DATE;
nPryb NUMBER;
nSrokID NUMBER;
nTSrokID NUMBER;
nTemp NUMBER;
Begin
  dTemp:=:NEW.FD_DATA1;
    OPEN cTemp;
    nSrokID:=0;
    LOOP
    FETCH cTemp INTO nTSrokID,Data1,Data2,nPryb;
    EXIT WHEN cTemp%NOTFOUND;
    if nPryb IN (2,4) then
--    raise_application_error(-20002,to_char(nPryb));
      nSrokID:=nTSrokID;
      if dTemp BETWEEN Data1 AND Data2 AND nSrokID>0 then
        :NEW.FK_SROKID:=nSrokID;
      --  raise_application_error(-20002,to_char(dTemp)||' pryb '||to_char(nPryb));
        EXIT;
      end if;
    end if;
  END LOOP;
  CLOSE cTemp;
End;
/
SHOW ERRORS;


