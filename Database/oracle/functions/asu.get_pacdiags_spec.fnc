DROP FUNCTION ASU.GET_PACDIAGS_SPEC
/

--
-- GET_PACDIAGS_SPEC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSMID (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACDIAGS_SPEC" (pPacID IN NUMBER, pVrachID IN NUMBER)
RETURN VARCHAR2 IS--Диагноз специалиста
  CURSOR cDiags(nPacid IN NUMBER, nVrachID IN NUMBER) IS
         SELECT tsmid.fc_name||' '||tdiag.fc_write, tdiag.fk_nazid FROM tdiag, tsmid
          WHERE tdiag.fp_type=4 --Диагноз специалиста
            AND tdiag.fk_pacid=nPacID
            AND tdiag.fk_vrachid=nVrachID
            AND tdiag.fl_showib=1
            AND tsmid.fk_id=tdiag.fk_smdiagid
          ORDER BY tdiag.fd_date, tdiag.fk_id;
  CURSOR cNazForDiag(nNazID IN NUMBER) IS
         SELECT tsmid.fc_name FROM tsmid, vnaz
          WHERE vnaz.fk_id=nNazID
            AND tsmid.fk_id=vnaz.fk_smid;
  sRes VARCHAR2(4000);
  sTmp VARCHAR2(4000);
  nNaz NUMBER;
BEGIN
  OPEN cDiags(pPacID, pVrachID);
    FETCH cDiags INTO sRes, nNaz;
    OPEN cNazForDiag(nNaz);
      FETCH cNazForDiag INTO sTmp;
      IF cNazForDiag%FOUND THEN
        sRes:=sTmp||', '||sRes;
      END IF;
    CLOSE cNazForDiag;
    IF cDiags%NOTFOUND THEN sRes:='Не обнаружено'; END IF;
  CLOSE cDiags;
  RETURN(sRes);
END;
/

SHOW ERRORS;


