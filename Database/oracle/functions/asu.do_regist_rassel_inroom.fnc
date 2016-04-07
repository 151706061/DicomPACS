DROP FUNCTION ASU.DO_REGIST_RASSEL_INROOM
/

--
-- DO_REGIST_RASSEL_INROOM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TVRACH (Table)
--   TROOM (Table)
--   TPERESEL (Table)
--   DO_CHECK_FREE_MESTA_FOR_REGIST (Function)
--   DO_WRITE_PERESEL (Procedure)
--   DO_WRITE_SROK (Procedure)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_REGIST_RASSEL_INROOM" -- Created by TimurLan for Regist (listpat.pas)
 (pFK_PACID IN NUMBER, pFK_PALATAID IN NUMBER, pFK_TYPE IN NUMBER, pFL_AUTOVRACH IN NUMBER,pFK_DALID IN NUMBER)
 RETURN NUMBER
IS
  CURSOR cPlanSrok IS
         select *
           from tsroky
          where fk_pacid = pFK_PACID
            and fk_pryb = 1;
  nTemp NUMBER;
  nMaxSrokID NUMBER;
  nMaxPereselID NUMBER;
  nResult NUMBER;
  nIBID NUMBER;
  nPalataID NUMBER;
  nSrokID BINARY_INTEGER;
BEGIN
  nSrokID := -1;
  nResult:=0;
  SELECT MAX(FK_IBID)+1 INTO nIBID FROM TKARTA WHERE FK_IBY=TO_CHAR(TRUNC(SYSDATE),'YYYY');
  IF nIBID is NULL then
    nIBID:=1;
  end IF;
  nPalataId := pFK_PALATAID;
  if pFK_TYPE = 0 then /*если в резерв*/
    UPDATE TKarta SET FK_IBID = nIBID,
                      FK_IBY = TO_CHAR(TRUNC(SYSDATE),'YYYY'),
                      FP_TEK_COC = 2,
                      FL_DOR = 1
                WHERE FK_ID = pFK_PACID;
    FOR p in cPlanSrok loop
      do_write_srok(nSrokID/*-1*/,pfk_pacid,p.fd_data1,p.fd_data2,p.fd_data3,p.fn_kol,2,0,p.fk_oplid,p.fn_sum,p.fk_vybid);
      SELECT MAX(FK_ID) INTO nMaxSrokID FROM TSROKY WHERE FK_PACID=pFK_PACID;
      SELECT MAX(FK_ID) INTO nMaxPereselID FROM TPERESEL WHERE FK_PACID=pFK_PACID;
      DO_WRITE_PERESEL(nMaxPereselID,pFK_PACID,p.FD_Data1,p.FD_Data2,0,nMaxSrokID);
      Exit;
    end loop;
    nResult := 1;
  else
    FOR p in cPlanSrok loop
      if DO_CHECK_FREE_MESTA_FOR_REGIST(pFK_PACID,nPalataid,p.FD_DATA1,p.FD_DATA2) > 0 then
        UPDATE TKarta SET FK_IBID = nIBID,
                          FK_IBY = TO_CHAR(TRUNC(SYSDATE),'YYYY'),
                          FP_TEK_COC = 2,
                          FL_DOR = 1
                    WHERE FK_ID = pFK_PACID;
        do_write_srok(nSrokID/*-1*/,pfk_pacid,p.fd_data1,p.fd_data2,p.fd_data3,p.fn_kol,2,0,p.fk_oplid,p.fn_sum,p.fk_vybid);
        SELECT MAX(FK_ID) INTO nMaxSrokID FROM TSROKY WHERE FK_PACID=pFK_PACID;
        SELECT MAX(FK_ID) INTO nMaxPereselID FROM TPERESEL WHERE FK_PACID=pFK_PACID;
        DO_WRITE_PERESEL(nMaxPereselID,pFK_PACID,p.FD_Data1,p.FD_Data2,nPalataID,nMaxSrokID);
        if pFL_AUTOVRACH = 1 then
          SELECT FK_VRACHID INTO nTemp FROM TROOM WHERE FK_ID = nPalataID;
          UPDATE TVRACH
             SET FK_VRACHID=nTemp,
                 FK_DALID=pFK_DALID
           WHERE FK_PACID=pFK_PACID
             AND FL_VID='M';
        end if;

        nResult := 1;
      end if;
      Exit;
    END LOOP;
  end if;
  COMMIT;
  RETURN nResult;
END;
/

SHOW ERRORS;


