DROP PROCEDURE ASU.DO_WRITE_PARAM_SOST
/

--
-- DO_WRITE_PARAM_SOST  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_WRITE_PARAM_SOST" (pFK_NAZID IN NUMBER, pFK_SMID IN NUMBER, pFD_INS IN DATE, pFK_VRACHID IN NUMBER, pFK_PACID IN NUMBER,
                              pFK_SOSID IN NUMBER, pFC_RES  IN VARCHAR := NULL, pFN_RES NUMBER := NULL) IS
BEGIN
    IF pFC_RES IS NULL AND pFN_RES IS NULL THEN
    UPDATE TRESAN
         SET FK_VRACHID = pFK_VRACHID,
             FK_PACID = pFK_PACID,
             FD_INS     = pFD_INS,
             FK_SOS = pFK_SOSID
       WHERE FK_NAZID = pFK_NAZID
             AND FK_SMID    = pFK_SMID;
    ELSIF pFC_RES IS NULL AND pFN_RES IS NOT NULL THEN
        UPDATE TRESAN
         SET FK_VRACHID = pFK_VRACHID,
             FK_PACID = pFK_PACID,
             FD_INS     = pFD_INS,
             FC_RES = pFC_RES,
             FK_SOS = pFK_SOSID
       WHERE FK_NAZID = pFK_NAZID
             AND FK_SMID    = pFK_SMID;
    ELSIF pFC_RES IS NOT NULL AND pFN_RES IS NULL THEN
    UPDATE TRESAN
         SET FK_VRACHID = pFK_VRACHID,
             FK_PACID = pFK_PACID,
             FD_INS     = pFD_INS,
             FK_SOS = pFK_SOSID,
             FN_RES = pFN_RES
       WHERE FK_NAZID = pFK_NAZID
             AND FK_SMID    = pFK_SMID;
    ELSIF pFC_RES IS NOT NULL AND pFN_RES IS NOT NULL THEN
    UPDATE TRESAN
         SET FK_VRACHID = pFK_VRACHID,
             FK_PACID = pFK_PACID,
             FD_INS     = pFD_INS,
             FC_RES = pFC_RES,
             FK_SOS = pFK_SOSID,
             FN_RES = pFN_RES
       WHERE FK_NAZID = pFK_NAZID
             AND FK_SMID    = pFK_SMID;
    END IF;
      IF SQL%ROWCOUNT = 0 THEN
        INSERT INTO TRESAN
          (FK_VRACHID,
             FK_PACID,
             FD_INS,
             FK_NAZID,
             FK_SMID,
             FC_RES,
             FK_SOS,
             FN_RES)
        VALUES
          (pFK_VRACHID,
           pFK_PACID,
           pFD_INS,
           pFK_NAZID,
           pFK_SMID,
           pFC_RES,
           pFK_SOSID,
           pFN_RES);
      END IF;
END;
/

SHOW ERRORS;


