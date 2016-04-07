DROP PROCEDURE ASU.SETTOTFORM1MED
/

--
-- SETTOTFORM1MED  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TFORM1MED (Table)
--
CREATE OR REPLACE PROCEDURE ASU.SetToTFORM1MED(pADVANCE      FLOAT,
                                                pYEAR         NUMBER,
                                                pMONTH        NUMBER,
                                                pFROM_IC_NEXT FLOAT,
                                                pFROM_IC_PREV FLOAT,
                                                pFROM_FOMS    FLOAT,
                                                pSUM_IC       FLOAT,
                                                pSUM_IC_REF   FLOAT,
                                                pSUM_FOMS     FLOAT,
                                                pSUM_FOMS_REF FLOAT) IS
  -- 20120503 Efimov V.A. http://192.168.1.9/redmine/issues/17865 Добавить или обновить данные
  vFK_ID Integer;
  pragma autonomous_transaction;
BEGIN
  select max(t.fk_id) fk_id
    into vFK_ID
    from asu.tFORM1med t
   where t.YEAR = pYEAR
     and t.MONTH = pMONTH;

  if vFK_ID is null then
    insert into asu.tFORM1med
      (ADVANCE, YEAR, MONTH, FROM_IC_NEXT, FROM_IC_PREV, FROM_FOMS, SUM_IC, SUM_IC_REF, SUM_FOMS, SUM_FOMS_REF)
    values
      (pADVANCE, pYEAR, pMONTH, pFROM_IC_NEXT, pFROM_IC_PREV, pFROM_FOMS, pSUM_IC, pSUM_IC_REF, pSUM_FOMS, pSUM_FOMS_REF);
  else
    update asu.tFORM1med
       set ADVANCE       = pADVANCE,
           YEAR          = pYEAR,
           MONTH         = pMONTH,
           FROM_IC_NEXT  = pFROM_IC_NEXT,
           FROM_IC_PREV  = pFROM_IC_PREV,
           FROM_FOMS     = pFROM_FOMS,
           SUM_IC        = pSUM_IC,
           SUM_IC_REF   = pSUM_IC_REF,
           SUM_FOMS     = pSUM_FOMS,
           SUM_FOMS_REF = pSUM_FOMS_REF
     where FK_ID = vFK_ID;
  end if;

  COMMIT;
END;
/

SHOW ERRORS;


