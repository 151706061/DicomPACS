DROP PROCEDURE ASU.DO_VYPISKA
/

--
-- DO_VYPISKA  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TVYBTYPE (Table)
--   TPERESEL (Table)
--   DO_ARRANGE_SROKY (Procedure)
--   GET_PAC_OSTATOK (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_VYPISKA" -- Modified by TimurLan
   ( pFK_PACID IN NUMBER,pFD_DATA3 IN DATE,pFK_TYPE IN NUMBER,pFK_VYBID IN NUMBER)
   IS
   nTemp NUMBER;
BEGIN
  if (pFK_VYBID = -1) OR (pFK_VYBID IS NULL) then--если причина выписки не указана
    select tvybtype.fk_id into nTemp from tvybtype where fl_default = 1;--то пишем по умолчанию
  else
    nTemp := pFK_VYBID;
  end if;
  update TSROKY
  set FK_VYB=pFK_TYPE,
      FD_DATA3=pFD_DATA3/*,
      FK_VYBID=nTemp*/
  where FK_ID=(SELECT MAX(FK_ID) FROM TSROKY WHERE FK_PACID=pFK_PACID);
  UPDATE TPERESEL SET FD_DATA2=pFD_DATA3 WHERE FK_ID=(SELECT MAX(FK_ID) FROM TPERESEL WHERE FK_PACID=pFK_PACID);
  insert into TSROKY(FK_ID,FK_PRYB,FK_PACID,FD_DATA1,FK_VYB,FN_KOL,FK_VYBID)
  values(-1,pFK_TYPE,pFK_PACID,pFD_DATA3,0,GET_PAC_OSTATOK(pFK_PACID,pFD_DATA3),nTemp);-- RETURNING FK_ID INTO nTemp;
  update TKARTA
  set FP_TEK_COC=3
  where FK_ID=pFK_PACID;
  DO_ARRANGE_SROKY(pFK_PACID);
END; -- Procedure
/

SHOW ERRORS;


