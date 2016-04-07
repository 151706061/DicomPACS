DROP PROCEDURE ASU.DO_RESTORE_DIAG_FROM_TEMPLATE
/

--
-- DO_RESTORE_DIAG_FROM_TEMPLATE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSUBDIAG (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_RESTORE_DIAG_FROM_TEMPLATE" (pFK_TEMPLATEID   IN NUMBER,
                                         pFK_PACID        IN OUT NUMBER,
                                         pFP_TYPE         IN NUMBER,
                                         pFL_FIRST        IN NUMBER,
                                         pFD_DATE         IN DATE,
                                         pFK_VRACHID      IN NUMBER,
                                         pFL_MAIN         IN NUMBER,
                                         pFK_MKB10        IN NUMBER DEFAULT -1) IS

--¬осстанавливает из шаблона диагноз.
  nMaxID NUMBER;
  pFK_SMDIAGID NUMBER;
  pFC_WRITE VARCHAR2(32000);
BEGIN
   SELECT FK_SMDIAGID,FC_WRITE INTO pFK_SMDIAGID,pFC_WRITE
     FROM TDIAG
    WHERE FK_ID=pFK_TEMPLATEID;

   INSERT INTO TDIAG(FK_PACID,FK_SMDIAGID,FP_TYPE,FL_FIRST,FC_WRITE,FD_DATE,FK_VRACHID,FL_MAIN, FK_MKB_10)
             VALUES (pFK_PACID,pFK_SMDIAGID,pFP_TYPE,pFL_FIRST,pFC_WRITE,pFD_DATE,pFK_VRACHID,pFL_MAIN, pFK_MKB10)
             RETURNING FK_ID INTO pFK_PACID;

   INSERT INTO TSUBDIAG(FK_DIAGID,FK_SMDIAGID) SELECT pFK_PACID,FK_SMDIAGID FROM TSUBDIAG WHERE FK_DIAGID=pFK_TEMPLATEID;
END;
/

SHOW ERRORS;


