DROP FUNCTION ASU.IS_PROTIV
/

--
-- IS_PROTIV  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSMID (Table)
--   TSUBDIAG (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PROTIV" 
  ( pFK_DIAGID IN NUMBER)
  RETURN  NUMBER IS
  CURSOR curSubDiag is SELECT  /*+ rule */ FL_SHOWANAL FROM TSMID,
                     (SELECT FK_SMDIAGID FROM TSUBDIAG WHERE FK_DIAGID=pFK_DIAGID)
                    WHERE FK_ID=FK_SMDIAGID;
  nTemp NUMBER;
BEGIN
  SELECT /*+ rule */COUNT(FK_ID) INTO nTemp FROM TSMID,(SELECT FK_SMDIAGID FROM TDIAG WHERE FK_ID=pFK_DIAGID) WHERE FK_ID=FK_SMDIAGID AND FL_SHOWANAL=1;
  if nTemp=0 then
    OPEN curSubDiag;
    loop
      FETCH curSubDiag INTO nTemp;
      exit when (curSubDIag%NOTFOUND) or (nTemp=1);
    end loop;
    CLOSE curSubDiag;
  end if;
  RETURN nTemp;
END;
/

SHOW ERRORS;


