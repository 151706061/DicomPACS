DROP FUNCTION ASU.GET_DIAG
/

--
-- GET_DIAG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   DO_DIAG (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_DIAG" (pFK_PACID IN NUMBER, pFP_TYPE IN NUMBER, pFN_CALLTYPE IN NUMBER, pFK_NAZID IN NUMBER DEFAULT -1)
RETURN VARCHAR2 IS

DiagName VARCHAR2(32000);

CURSOR cDiag IS SELECT DO_DIAG(tdiag.fk_id) AS namediag,
                       fk_smdiagid
                  FROM tdiag
                 WHERE fk_pacid = pFK_PACID
                   AND fp_type = pFP_TYPE;

CURSOR cDiagOrder IS SELECT DO_DIAG(tdiag.fk_id) AS namediag,
                       fk_smdiagid
                  FROM tdiag
                 WHERE fk_pacid = pFK_PACID
                   AND fp_type = pFP_TYPE
                   AND fk_nazid = pFK_NAZID
                   AND fl_main = 1
                   ORDER BY FK_ID DESC;

NameDiag VARCHAR2(32767);
IdDiag NUMBER;
BEGIN
IdDiag:=null;
OPEN cDiag;
FETCH cDiag INTO NameDiag, IdDiag;
CLOSE cDiag;

  IF pFN_CALLTYPE = 0 THEN
     RETURN NVL(NameDiag, '');
  ELSE
    IF pFN_CALLTYPE = 1 THEN
     RETURN NVL(IdDiag, '');
    ELSE
        IdDiag:=null;
        OPEN cDiagOrder;
        FETCH cDiagOrder INTO DiagName, IdDiag;
        CLOSE cDiagOrder;
        IF pFN_CALLTYPE = 2 THEN
            RETURN NVL(DiagName, '');
        ELSE
            RETURN NVL(IdDiag, '');
        END IF;
    END IF;
  END IF;
END;
/

SHOW ERRORS;


