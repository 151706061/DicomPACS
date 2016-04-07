DROP PROCEDURE ASU.DO_DELETE_SROK
/

--
-- DO_DELETE_SROK  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TPERESEL (Table)
--   DO_ARRANGE_SROKY (Procedure)
--   GET_MAXPERESELID (Function)
--   GET_MAXSROKID (Function)
--
CREATE OR REPLACE PROCEDURE ASU."DO_DELETE_SROK" -- Modified by TimurLan 21.02.2002
(pFK_ID IN NUMBER,pFK_PACID IN NUMBER)
AS
  /*CURSOR cPereselCount IS-- < added
  SELECT\*+first_row*\
   COUNT (FK_ID)
    FROM TPERESEL
   WHERE FK_PACID = pFK_PACID;
  CURSOR cPlanSrok IS-- < added
  select tsroky.fd_data1,tsroky.fd_data2
    from tsroky
   where fk_pacid = pFK_PACID
     and fk_pryb = 1;*/
dTemp1 DATE;
dTemp2 DATE;
nPryb NUMBER;
nTemp NUMBER;
BEGIN
  /*open cPereselcount;
  fetch cPereselcount into nTemp;
  close cPereselcount;*/

  /*if nTemp = 1 then-- < added begin
    open cPlanSrok;
    fetch cPlanSrok into dTemp1,dTemp2;
    close cPlanSrok;
    nTemp:=GET_MAXPERESELID(pFK_PACID);
    DELETE FROM TSROKY WHERE FK_ID=pFK_ID;
    DO_WRITE_PERESEL(nTemp,pFK_PACID,dTemp1,dTemp2,-1,-1);-- < added end
  else*/
    DELETE FROM TSROKY WHERE FK_ID=pFK_ID;-- < original >
  /*end if;*/
  nTemp:=GET_MAXSROKID(pFK_PACID);
  UPDATE TSROKY SET FK_VYB=0,FD_DATA3=FD_DATA2 WHERE FK_ID=nTemp;
  SELECT FD_DATA1,FD_DATA2,nPryb INTO dTemp1,dTemp2,nPryb FROM TSROKY WHERE FK_ID=nTemp;
  if nPryb IN (3,7) then
    UPDATE TPERESEL SET FD_DATA2=dTemp1 WHERE FK_ID=GET_MAXPERESELID(pFK_PACID);
  elsif nPryb IN (2,4,5,6) then
    UPDATE TPERESEL SET FD_DATA2=dTemp2 WHERE FK_ID=GET_MAXPERESELID(pFK_PACID);
  end if;
  DO_ARRANGE_SROKY(pFK_PACID);
END; -- Procedure
/

SHOW ERRORS;


