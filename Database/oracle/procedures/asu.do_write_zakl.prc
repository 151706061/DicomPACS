DROP PROCEDURE ASU.DO_WRITE_ZAKL
/

--
-- DO_WRITE_ZAKL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TRESAN (Table)
--   TPATALOGY (Table)
--   PKG_ANAL_WORK (Package)
--   GET_AMBVRACH (Function)
--   GET_PACID_FROM_NAZID (Function)
--   GET_PACVRACH (Function)
--   GET_PATALOGY_LEVEL (Function)
--   GET_RESULT_TEXT (Function)
--   GET_RESULT_TEXT2 (Function)
--   GET_RESULT_TEXT3 (Function)
--   GET_SMIDFROMNAZ (Function)
--   GET_VYPNAZSOSID (Function)
--   IS_AMBULANCE (Function)
--   TPODPISNAZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU.do_write_zakl (pFK_ID IN OUT NUMBER,
                           pFK_NAZID IN NUMBER,
                           pFC_RES IN VARCHAR2,
                           pFD_INS IN DATE,
                           pFK_VRACHID IN NUMBER,
                           pNAZSOSID IN NUMBER DEFAULT asu.GET_VYPNAZSOSID,
                           pFN_RES IN NUMBER := NULL,
                           pFK_LAB IN NUMBER DEFAULT 0) IS

  CURSOR c IS
    SELECT FK_ID
      FROM asu.TRESAN
     WHERE FK_ID = pFK_ID;

  CURSOR cp(pRESID NUMBER) IS
    SELECT fk_id
      FROM asu.tpatalogy
     WHERE FK_RESID = pRESID;

  CURSOR cLab IS
    SELECT FK_ID
      FROM asu.tpodpisnaz
     where fk_nazid = pFK_NAZID
       and fk_sotrid = pFK_LAB;

  i        NUMBER;
  n        NUMBER;
  n2       NUMBER;
  n3       NUMBER;
  nID      NUMBER;
  VrachID  NUMBER;
  patid    NUMBER;
  nIdPod   NUMBER; -- tpodpisnaz.fk_id

  nTalonId NUMBER;
  nTalonCount NUMBER;
BEGIN
--      raise_application_error(-20001,'Begin');
  IF c%ISOPEN THEN
    CLOSE c;
  END IF;

  OPEN c;
  FETCH c INTO n;
  nID := asu.GET_PACID_FROM_NAZID(pFK_NAZID);
  IF C%NOTFOUND THEN
    INSERT INTO asu.TRESAN(FK_PACID, FK_NAZID, FK_VRACHID, FK_SMID, FC_RES, FL_ZAKL, FC_TYPE, FD_INS, FN_RES)
    VALUES (nID, pFK_NAZID, pFK_VRACHID, asu.GET_SMIDFROMNAZ(pFK_NAZID), pFC_RES, 1, 'TEXT', pFD_INS, pFN_RES)
    RETURNING FK_ID INTO pFK_ID;
  ELSE
    UPDATE asu.TRESAN
       SET FK_VRACHID = pFK_VRACHID,
           FD_INS = pFD_INS,
           FK_NAZID = pFK_NAZID,
           FK_SMID = asu.GET_SMIDFROMNAZ(pFK_NAZID),
           FC_RES = pFC_RES,
           FL_ZAKL = 1,
           FC_TYPE = 'TEXT',
           FN_RES = pFN_RES
     WHERE FK_ID = pFK_ID;
  END IF;
  CLOSE c;

  n     := asu.GET_RESULT_TEXT(pFK_NAZID);
  n2    := GET_RESULT_TEXT2(pFK_NAZID);
  n3    := GET_RESULT_TEXT3(pFK_NAZID);
  i     := asu.PKG_ANAL_WORK.GET_PATALOGYVID(pFK_NAZID);

  UPDATE asu.TRESAN
     SET FK_BLOBID = n,
         FK_BLOBID2 = n2,
         FK_BLOBID3 = n3,
         FK_PATID = i
   WHERE FK_ID = pFK_ID;

  IF asu.get_patalogy_level(i) > 0 THEN
    IF asu.is_ambulance(nID) = 0 THEN
      vrachid := get_pacvrach(nID);
    ELSIF asu.is_ambulance(nID) = 1 THEN
      vrachid := get_ambvrach(nID);
    END IF;

    OPEN cp(pFK_ID);
    FETCH cp INTO patid;

    IF cp%NOTFOUND THEN
      INSERT INTO asu.tpatalogy(fd_data, fk_pacid, fk_smid, fk_patid, fk_vrachid, fk_resid)
      VALUES(pFD_INS, nID, GET_SMIDFROMNAZ(pFK_NAZID), i, vrachid, pFK_ID);
    ELSE
--      raise_application_error(-20001,'UPDATE PATALOGY');
      UPDATE asu.TPATALOGY
         SET FK_VRACHID = VRACHID,
             FD_DATA = pFD_INS,
             FK_SMID = asu.GET_SMIDFROMNAZ(pFK_NAZID),
             FK_PATID = i,
             FK_RESID = pFK_ID
       WHERE FK_ID = patid;
    END IF;

    CLOSE cp;
  END IF;



  UPDATE asu.TNAZAN
     SET FK_NAZSOSID = pNAZSOSID,
         FD_RUN=pFD_INS, --decode(FD_RUN, trunc(FD_RUN), pFD_INS, FD_RUN),
         FK_ISPOLID = pFK_VRACHID,
         FK_NAZCAUSEID = pFN_RES
   WHERE FK_ID = pFK_NAZID;

-- Записываем лаборанта (или врача) Prihodko N. 08.09.2011
  IF pFK_LAB <> 0 THEN
    OPEN cLab;
    FETCH cLab INTO nIdPod;
    IF cLab%NOTFOUND THEN
      INSERT INTO asu.tpodpisnaz(fk_nazid, fk_sotrid, fk_sos, fd_date, fd_ins)
      VALUES(pFK_NAZID, pFK_LAB, pNAZSOSID, sysdate, pFD_INS);
    ELSE
      UPDATE asu.tpodpisnaz
         SET fk_sotrid = pFK_LAB, fk_sos = pNAZSOSID, fd_date = sysdate
       WHERE fk_id = nIdPod;
    END IF;
    CLOSE cLab;
  END IF;

END;
-- Procedure DO_WRITE_ZAKL




-- End of DDL Script for Procedure ASU.DO_WRITE_ZAKL
/

SHOW ERRORS;


