DROP FUNCTION ASU.IS_PATALOGY
/

--
-- IS_PATALOGY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSMID (Table)
--   TSUBDIAG (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PATALOGY" 
  ( pFK_DIAGID IN NUMBER)
  RETURN  NUMBER IS
  CURSOR curSubDiag is SELECT  /*+ rule */ FP_PAT FROM TSMID,
                     (SELECT FK_SMDIAGID FROM TSUBDIAG WHERE FK_DIAGID=pFK_DIAGID)
                    WHERE FK_ID=FK_SMDIAGID;
  nTemp NUMBER;
BEGIN
  SELECT /*+ rule */COUNT(FK_ID) INTO nTemp FROM TSMID,(SELECT FK_SMDIAGID FROM TDIAG WHERE FK_ID=pFK_DIAGID) WHERE FK_ID=FK_SMDIAGID AND FP_PAT=1;
  if nTemp=0 then
    OPEN curSubDiag;
    loop
      FETCH curSubDiag INTO nTemp;
      exit when (curSubDIag%NOTFOUND) or (nTemp=1);
    end loop;
    CLOSE curSubDiag;
  ELSE
    nTemp:=1;
  end if;
  RETURN nTemp;
END;
/

SHOW ERRORS;


