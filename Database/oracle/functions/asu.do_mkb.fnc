DROP FUNCTION ASU.DO_MKB
/

--
-- DO_MKB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSMID (Table)
--   TSUBDIAG (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_MKB" (pFK_ID IN NUMBER) RETURN VARCHAR2
-- Created by TimurLan 4 Ugorsk's rRegedit.smr
 IS
  CURSOR cSub IS
    SELECT FK_MKB10
      FROM TSMID, TSUBDIAG
     WHERE TSUBDIAG.FK_DIAGID = pFK_ID AND
           TSMID.FK_ID = TSUBDIAG.FK_SMDIAGID;
  CURSOR cDiag IS
    SELECT FK_MKB10
      FROM TSMID, TDIAG
     WHERE TDIAG.FK_ID = pFK_ID AND TSMID.FK_ID = TDIAG.FK_SMDIAGID;
  strTemp VARCHAR2(1000);
BEGIN
  --  begin
  FOR p in cSub LOOP
    if p.FK_MKB10 IS NOT NULL THEN
      strTemp := p.FK_MKB10;
    END IF;
  END LOOP;
  IF strTemp IS NULL THEN
    FOR p in cDiag LOOP
      if p.FK_MKB10 IS NOT NULL THEN
        strTemp := p.FK_MKB10;
      END IF;
    END LOOP;
  END IF;
  RETURN strTemp;
  /*  exception
    when no_data_found then
      raise_application_error(-20000,
                              'Запрошен отсутствующий диагноз. Обратитесь к администратору. Возможны был удален диагноз из справочника диагнозов');
  end;*/
END;
/

SHOW ERRORS;


