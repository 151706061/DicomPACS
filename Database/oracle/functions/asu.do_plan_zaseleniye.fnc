DROP FUNCTION ASU.DO_PLAN_ZASELENIYE
/

--
-- DO_PLAN_ZASELENIYE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--   TPEOPLES (Table)
--   DO_ADD_PLANS (Procedure)
--   DO_CHECK_FREE_MESTA_FOR_PLAN (Function)
--   GET_PACSUBVID (Function)
--   DO_WRITE_PERESEL (Procedure)
--   TKARTA (Table)
--   TEPID (Table)
--   NEXT_NUMBER (Function)
--
CREATE OR REPLACE FUNCTION ASU."DO_PLAN_ZASELENIYE" -- Created by TimurLan
 (pFD_DATE IN DATE,pFN_COL IN NUMBER,pFN_KDN IN NUMBER,pFK_TYPEPUT IN NUMBER,pFK_PUTTYPE IN NUMBER,pFK_KOD IN NUMBER,pFK_KOD2 IN NUMBER,
  pFK_USLVIDID IN NUMBER,pFN_SUM IN NUMBER,
  pFC_MASK IN VARCHAR2,pFC_NUM IN OUT VARCHAR2,pFD_PRIB IN DATE,pFP_TRAN IN NUMBER,pFK_REIS IN VARCHAR2,pFC_FROM IN VARCHAR2,pFC_VAGON IN VARCHAR2)
 RETURN NUMBER
IS
 CURSOR cMain IS
  SELECT FK_PALATAID,FN_MESTA
    FROM TSRTIPROOM,(select MAX(fk_id) as id from TSRTIPROOM where FK_VIDID=pFK_TYPEPUT group by fk_palataid)
   WHERE FK_ID=ID
     AND FL_REMONT = 0
   ORDER BY FK_PALATAID;
  nCount NUMBER;
  nResult NUMBER;
  nFree NUMBER;
  dDate1 DATE;
  dDate2 DATE;
  pFK_PACID NUMBER;
  pFK_PEPLID NUMBER;
  strFam VARCHAR(30);
BEGIN
  nResult:=pFN_COL;
  nCount:=0;
  dDate1:=TRUNC(pFD_DATE,'MI');
  dDate2:=dDate1+pFN_KDN-1/(24*60);
  strFam:=UPPER(SUBSTR(GET_PACSUBVID(pFK_KOD2,pFK_KOD),1,30));
-- PRAGMA AUTONOMOUS_TRANSACTION;
  if pFK_TYPEPUT = -1 then /*если без брони*/
    WHILE nResult > 0 LOOP
      INSERT INTO TKARTA (FK_IBID,FC_FAM,FK_KOD2,FK_KOD,FP_TEK_COC,FK_PUTTYPE,FC_PUT,FK_USLVIDID,FN_SUM)
                  values (0,strFam,pFK_KOD2,pFK_KOD,1,pFK_PUTTYPE,pFC_NUM,pFK_USLVIDID,pFN_SUM)
        RETURNING FK_ID INTO pFK_PACID;
      INSERT INTO TPEOPLES (FC_FAM)
                  values (strFam)
        RETURNING FK_ID INTO pFK_PEPLID;
      UPDATE TKarta SET FK_PEPLID = pFK_PEPLID,
                        FL_DOR = 0,
                        FL_PLANNED = 1
                  WHERE FK_ID = pFK_PACID;
      UPDATE TEPID SET FD_PRIB=pFD_PRIB,
                       FP_TRAN=pFP_TRAN,
                       FK_REIS=pFK_REIS,
                       FC_FROM=pFC_FROM,
                       FC_VAGON=pFC_VAGON
                 WHERE FK_PACID=pFK_PACID;
      DO_ADD_PLANS(pFK_PACID,dDate1,dDate2,dDate2,pFN_KDN,0,0);
      DO_WRITE_PERESEL(-1,pFK_PACID,dDate1,dDate2,-1,0);
      COMMIT;
      nResult:=nResult-1;
      if pFC_NUM is not NULL then
        pFC_NUM := NEXT_NUMBER(pFC_NUM,pFC_MASK);
      end if;
    END LOOP;
  elsif pFK_TYPEPUT = 0 then /*если в резерв*/
    WHILE nResult > 0 LOOP
      INSERT INTO TKARTA (FK_IBID,FC_FAM,FK_KOD2,FK_KOD,FP_TEK_COC,FK_PUTTYPE,FC_PUT,FK_USLVIDID,FN_SUM)
                  values (0,strFam,pFK_KOD2,pFK_KOD,1,pFK_PUTTYPE,pFC_NUM,pFK_USLVIDID,pFN_SUM)
        RETURNING FK_ID INTO pFK_PACID;
      INSERT INTO TPEOPLES (FC_FAM)
                  values (strFam)
        RETURNING FK_ID INTO pFK_PEPLID;
      UPDATE TKarta SET FK_PEPLID = pFK_PEPLID,
                        FL_DOR = 0,
                        FL_PLANNED = 1
                  WHERE FK_ID = pFK_PACID;
      UPDATE TEPID SET FD_PRIB=pFD_PRIB,
                       FP_TRAN=pFP_TRAN,
                       FK_REIS=pFK_REIS,
                       FC_FROM=pFC_FROM,
                       FC_VAGON=pFC_VAGON
                 WHERE FK_PACID=pFK_PACID;
      DO_ADD_PLANS(pFK_PACID,dDate1,dDate2,dDate2,pFN_KDN,0,0);
      DO_WRITE_PERESEL(-1,pFK_PACID,dDate1,dDate2,pFK_TYPEPUT,0);
      COMMIT;
      nResult:=nResult-1;
      if pFC_NUM is not NULL then
        pFC_NUM := NEXT_NUMBER(pFC_NUM,pFC_MASK);
      end if;
    END LOOP;
  else
    FOR p IN cMain LOOP
      nFree := DO_CHECK_FREE_MESTA_FOR_PLAN(-1,p.FK_PALATAID,dDate1,dDate2);
      if nFree > 0 then
        WHILE nFree > 0 LOOP
          INSERT INTO TKARTA (FK_IBID,FC_FAM,FK_KOD2,FK_KOD,FP_TEK_COC,FK_PUTTYPE,FC_PUT,FK_USLVIDID,FN_SUM)
                      values (0,strFam,pFK_KOD2,pFK_KOD,1,pFK_PUTTYPE,pFC_NUM,pFK_USLVIDID,pFN_SUM)
            RETURNING FK_ID INTO pFK_PACID;
          INSERT INTO TPEOPLES (FC_FAM)
                      values (strFam)
            RETURNING FK_ID INTO pFK_PEPLID;
          UPDATE TKarta SET FK_PEPLID = pFK_PEPLID,
                            FL_DOR = 0,
                            FL_PLANNED = 1
                      WHERE FK_ID = pFK_PACID;
          UPDATE TEPID SET FD_PRIB=pFD_PRIB,
                           FP_TRAN=pFP_TRAN,
                           FK_REIS=pFK_REIS,
                           FC_FROM=pFC_FROM,
                           FC_VAGON=pFC_VAGON
                     WHERE FK_PACID=pFK_PACID;
          DO_ADD_PLANS(pFK_PACID,dDate1,dDate2,dDate2,pFN_KDN,0,0);
          DO_WRITE_PERESEL(-1,pFK_PACID,dDate1,dDate2,p.FK_PALATAID/*-1*/,0);
          COMMIT;
          nResult:=nResult-1;
          nFree:=nFree-1;
          nCount:=nCount+1;
          if pFC_NUM is not NULL then
            pFC_NUM := NEXT_NUMBER(pFC_NUM,pFC_MASK);
          end if;
          EXIT WHEN nCount = pFN_COL;
        END LOOP;
      end if;
      EXIT WHEN nCount = pFN_COL;
    END LOOP;
  end if;
  RETURN nResult;
END;
/

SHOW ERRORS;


