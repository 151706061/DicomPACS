DROP PROCEDURE ASU.DO_WRITE_PERESEL
/

--
-- DO_WRITE_PERESEL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TPERESEL (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_WRITE_PERESEL" -- Modified by TimurLan
 ( pFK_ID IN NUMBER,pFK_PACID IN NUMBER,pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PALATAID IN NUMBER,pFK_SROKID IN NUMBER)
   IS
   CURSOR cTemp IS SELECT /*+first_row*/COUNT(FK_ID) FROM TPERESEL WHERE FK_ID=pFK_ID;
   nTemp NUMBER;
   nNomIB NUMBER;
   nYearIB NUMBER;
   nVidObslID NUMBER;
   CURSOR cTemp1 IS SELECT /*+rule*/FK_PRYB,FD_DATA1 FROM TSROKY WHERE FK_ID=nTemp;
   --CURSOR cGetPac IS SELECT fk_ibid, fk_iby, fk_uslvidid FROM TKARTA where FK_ID = pFK_PACID;
   --CURSOR cGetDoc IS SELECT fk_id FROM TDocObsl WHERE fk_viddocid = nVidObslID and fk_numib = nNomIB and fn_year = nYearIB;
   nTemp1 NUMBER;
   dTemp1 DATE;

   nDocID NUMBER;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  if nTemp=0 then
    INSERT INTO TPERESEL(FK_ID,FK_PACID,FD_DATA1,FD_DATA2,FK_PALATAID)
      VALUES(pFK_ID,pFK_PACID,pFD_DATA1,pFD_DATA2,pFK_PALATAID) returning FK_SROKID INTO nTemp;
  else
    UPDATE TPERESEL SET
      FD_DATA1=pFD_DATA1,
      FD_DATA2=pFD_DATA2,
      FK_PALATAID=pFK_PALATAID
    WHERE FK_ID=pFK_ID RETURNING FK_SROKID INTO nTemp;
  end if;
  -- Установим соответствие пересела на документ обслуживания
  /*OPEN cGetPac;
  FETCH cGetPac INTO nNomIB, nYearIB, nVidObslID;
  CLOSE cGetPac;
  OPEN cGetDoc;
  FETCH cGetDoc INTO nDocID;
  CLOSE cGetDoc;
  update TPeresel set fk_docobslid=nDocID where fk_id=pFK_ID; */
--  raise_application_error(-20001,to_char(nTemp));
  OPEN cTemp1;
  FETCH cTemp1 INTO nTemp1,dTemp1;
  if cTemp1%NOTFOUND then
    RETURN;
  end if;
  if nTemp1<>4 or pFD_DATA1>dTemp1 then
    UPDATE TPERESEL SET FD_DATA2=pFD_DATA1-1/(24*60*60)/*-1*/ WHERE FK_ID=(SELECT MAX(FK_ID) FROM TPERESEL WHERE FK_ID<(SELECT MAX(FK_ID) FROM TPERESEL WHERE FK_PACID=pFK_PACID) AND FK_PACID=pFK_PACID);
  end if;
END; -- Procedure
/

SHOW ERRORS;


