DROP FUNCTION ASU.DO_REGIST_RASSEL
/

--
-- DO_REGIST_RASSEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TSRTIPROOM (Table)
--   TVRACH (Table)
--   TROOM (Table)
--   TPERESEL (Table)
--   PKG_PACIENT (Package)
--   DO_CHECK_FREE_MESTA_FOR_REGIST (Function)
--   GET_PACPALATAID (Function)
--   DO_WRITE_PERESEL (Procedure)
--   DO_WRITE_SROK (Procedure)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_REGIST_RASSEL" -- Created by TimurLan for Regist (listpat.pas)
 (pFK_PACID IN NUMBER, pFK_TYPE IN NUMBER, pFL_AUTOVRACH IN NUMBER,pFK_DALID IN NUMBER)
 RETURN NUMBER
IS
  CURSOR cPlanSrok IS
         select *
           from tsroky
          where fk_pacid = pFK_PACID
            and fk_pryb = 1;
  CURSOR cRooms(date1 in date,date2 in date) IS
         SELECT TROOM.FK_ID,TROOM.FK_VRACHID,DO_CHECK_FREE_MESTA_FOR_REGIST(-1,TROOM.FK_ID,date1,date2) as FN_FREE
           FROM TROOM,TSRTIPROOM
          WHERE FK_PALATAID=TROOM.FK_ID
            AND date1 >= FD_DATA1
            AND (date1 <= FD_DATA2 OR FD_DATA2 IS NULL)
            AND TSRTIPROOM.FK_VIDID = pFK_TYPE
            AND FL_REMONT = 0
          ORDER BY 1;
  nTemp NUMBER;
  nMaxSrokID NUMBER;
  nMaxPereselID NUMBER;
  nResult NUMBER;
  nIBID NUMBER;
  nPalataID NUMBER;
  cPut VARCHAR2(50);
  nSrokID BINARY_INTEGER;
BEGIN
  nSrokID := -1;
  nResult:=0;
  SELECT MAX(FK_IBID)+1 INTO nIBID FROM TKARTA WHERE FK_IBY=TO_CHAR(TRUNC(SYSDATE),'YYYY');
  IF nIBID is NULL then
    nIBID:=1;
  end IF;
  nPalataId := NVL(GET_PACPALATAID(pFK_PACID),-1);
  SELECT FC_PUT INTO cPut FROM TKARTA WHERE FK_ID = pFK_PACID;
  if pFK_TYPE = 0 then /*если в резерв*/
    UPDATE TKarta SET FK_IBID = nIBID,
                      FK_IBY = TO_CHAR(TRUNC(SYSDATE),'YYYY'),
                      FP_TEK_COC = 2,
                      FL_DOR = 1
                WHERE FK_ID = pFK_PACID;
    BEGIN
      PKG_PACIENT.DO_SPLIT_PUT(pFK_PACID,cPUT);
      EXCEPTION WHEN OTHERS THEN NULL;
    END;
    FOR p in cPlanSrok loop
      do_write_srok(nSrokID/*-1*/,pfk_pacid,p.fd_data1,p.fd_data2,p.fd_data3,p.fn_kol,2,0,p.fk_oplid,p.fn_sum,p.fk_vybid);
      SELECT MAX(FK_ID) INTO nMaxSrokID FROM TSROKY WHERE FK_PACID=pFK_PACID;
      SELECT MAX(FK_ID) INTO nMaxPereselID FROM TPERESEL WHERE FK_PACID=pFK_PACID;
      DO_WRITE_PERESEL(nMaxPereselID,pFK_PACID,p.FD_Data1,p.FD_Data2,0,nMaxSrokID);
      Exit;
    end loop;
    nResult := 1;
  else
    if nPalataID = -1 then /*если авторасселение*/
      FOR p in cPlanSrok loop
        FOR r in cRooms(p.FD_DATA1,p.FD_DATA2) LOOP
          if r.fn_free > 0 then
            UPDATE TKarta SET FK_IBID = nIBID,
                              FK_IBY = TO_CHAR(TRUNC(SYSDATE),'YYYY'),
                              FP_TEK_COC = 2,
                              FL_DOR = 1
                        WHERE FK_ID = pFK_PACID;
            BEGIN
              PKG_PACIENT.DO_SPLIT_PUT(pFK_PACID,cPUT);
              EXCEPTION WHEN OTHERS THEN NULL;
            END;
            do_write_srok(nSrokID/*-1*/,pfk_pacid,p.fd_data1,p.fd_data2,p.fd_data3,p.fn_kol,2,0,p.fk_oplid,p.fn_sum,p.fk_vybid);
            SELECT MAX(FK_ID) INTO nMaxSrokID FROM TSROKY WHERE FK_PACID=pFK_PACID;
            SELECT MAX(FK_ID) INTO nMaxPereselID FROM TPERESEL WHERE FK_PACID=pFK_PACID;
            DO_WRITE_PERESEL(nMaxPereselID,pFK_PACID,p.FD_Data1,p.FD_Data2,r.FK_ID,nMaxSrokID);
            nResult := 1;
            if pFL_AUTOVRACH = 1 then
              UPDATE TVRACH
                 SET FK_VRACHID=r.FK_VRACHID,
                     FK_DALID=pFK_DALID
               WHERE FK_PACID=pFK_PACID
                 AND FL_VID='M';
            end if;

            nResult := 1;
            Exit;
          end if;
        END LOOP;
        Exit;
      END LOOP;
    else/*если была бронь*/
      FOR p in cPlanSrok loop
        if DO_CHECK_FREE_MESTA_FOR_REGIST(pFK_PACID,nPalataid,p.FD_DATA1,p.FD_DATA2) > 0 then
          UPDATE TKarta SET FK_IBID = nIBID,
                            FK_IBY = TO_CHAR(TRUNC(SYSDATE),'YYYY'),
                            FP_TEK_COC = 2,
                            FL_DOR = 1
                      WHERE FK_ID = pFK_PACID;
          BEGIN
            PKG_PACIENT.DO_SPLIT_PUT(pFK_PACID,cPUT);
            EXCEPTION WHEN OTHERS THEN NULL;
          END;
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
  end if;
  COMMIT;
  RETURN nResult;
END;
/

SHOW ERRORS;


