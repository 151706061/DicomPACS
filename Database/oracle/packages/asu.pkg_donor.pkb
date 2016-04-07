DROP PACKAGE BODY ASU.PKG_DONOR
/

--
-- PKG_DONOR  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DONOR" IS

  PROCEDURE LinkPosNaz(pAMBID IN NUMBER, pPosID IN NUMBER, pNazId IN NUMBER) IS
  BEGIN
    INSERT INTO asu.tdonorpos_naz
      (fk_ambid, fk_posid, fk_nazid)
    VALUES
      (pAMBID, pPosID, pNazId);
  END;

  FUNCTION Get_PosNum(pAmbid NUMBER) RETURN NUMBER IS
  BEGIN
    FOR c IN (SELECT fk_docid
                FROM asu.tdonorpos
               WHERE fd_begin = (SELECT MAX(fd_begin)
                                   FROM asu.tdonorpos
                                  WHERE Fk_ambid = pAmbid)
                 AND Fk_ambid = pAmbid)
    LOOP
      RETURN c.fk_docid;
    END LOOP;
    RETURN - 1;
  END;

  FUNCTION Get_PosNum1(pPosId NUMBER) RETURN NUMBER IS
  BEGIN
    FOR c IN (SELECT fk_docid FROM asu.tdonorpos WHERE fk_id = pPosId)
    LOOP
      RETURN c.fk_docid;
    END LOOP;

    RETURN -1;
  END;

  FUNCTION IS_AUTODONOR(pAmbid NUMBER) RETURN NUMBER IS

  BEGIN
    FOR c IN (SELECT fk_vid
                FROM asu.tdonorpos
               WHERE fk_id = (SELECT MAX(fk_id)
                                FROM asu.tdonorpos
                               WHERE Fk_ambid = pAmbid))
    LOOP
      IF c.fk_vid =
         stat.pkg_statutil.GET_SMIDID('VID_KROVODACHI_AUTODONOR')
      THEN
        RETURN 1;
      ELSE
        RETURN 0;
      END IF;
    END LOOP;
    RETURN 0;

  END;

PROCEDURE Get_PosResult(pNazid NUMBER) IS
  vSyn    VARCHAR2(254);
  nTmp    NUMBER;
  nPacId  NUMBER;
  nSotrId NUMBER;
  dRun    DATE;

BEGIN
  FOR c IN (SELECT fk_posid FROM tdonorpos_naz WHERE fk_nazid = pNazid)
  LOOP
    nTmp := c.fk_posid;
  END LOOP;
  IF nTmp IS NOT NULL
  THEN
    BEGIN

      FOR c IN (SELECT fc_synonim,
                       VNAZ.FK_PACID,
                       VNAZ.FK_VRACHID,
                       VNAZ.FD_RUN
                  FROM asu.tsmid, vnaz
                 WHERE vnaz.fk_id = pNazid
                   AND fk_smid = tsmid.fk_id)
      LOOP
        vSyn := c.fc_synonim;
        dRun:= C.FD_RUN;
        nSotrId := C.FK_VRACHID;
        nPacId := c.FK_PACID;
      END LOOP;
      IF vSyn = 'PERELIV_TERAP'
      THEN
        FOR c IN (SELECT COUNT(1) CNT
                    FROM asu.tib,
                         (SELECT fk_id
                            FROM asu.tsmid
                          CONNECT BY PRIOR fk_id = fk_owner
                           START WITH fc_synonim = 'MEDICIN_ZAKL_OTVOD') sm
                   WHERE fk_smid = sm.fk_id
                     AND tib.fk_pacid = pNazid)
        LOOP
       --  UPDATE tdonorpos SET fk_result = c.CNT WHERE fk_id = nTmp;
          IF C.CNT > 0
          THEN
            INSERT INTO VNAZ
              (FK_SMID, FD_NAZ, FD_RUN, FK_VRACHID, FK_PACID, FK_NAZSOSID)
            VALUES
              ((SELECT MIN(FK_ID)
                 FROM ASU.TSMID
                WHERE FC_SYNONIM = 'PERELIV_OTVOD'),
               dRun,
               dRun,
               nSotrId,
               nPacId,
               asu.get_nevip);
          END IF;
        END LOOP;
      END IF;
    END;
  END IF;
END;

  FUNCTION Get_BloodGr(pAmbid NUMBER) RETURN VARCHAR2 IS
  BEGIN
    RETURN ASU.GET_SMIDNAME(Get_BloodGr_ID(pAmbid));
  END;

  FUNCTION Get_BloodGr_ID(pAmbid NUMBER) RETURN NUMBER IS
    RESULT NUMBER;
    CURSOR c1 IS
      SELECT NVL(FK_SMID, -1)
        FROM ASU.TIB,
             (SELECT FK_ID
                FROM ASU.TSMID
               WHERE FC_SYNONIM = 'LD_BLOOD_GROUP') SM
       WHERE TIB.FK_PACID = asu.pkg_regist_pacfunc.GET_PEPL_ID(pAmbid)
         AND FK_SMEDITID = SM.FK_ID;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO RESULT;
    IF c1%NOTFOUND
    THEN
      RESULT := -1;
    END IF;
    CLOSE c1;
    RETURN RESULT;
  END;

  FUNCTION GET_LICHDANDON_REZUS RETURN NUMBER IS
  BEGIN
    RETURN 829536;
  END;

  FUNCTION Get_Rezus(pAmbid NUMBER) RETURN VARCHAR2 IS
  BEGIN
    RETURN ASU.GET_SMIDNAME(Get_Rezus_ID(pAmbid));
  END;

  FUNCTION Get_Rezus_ID(pAmbid NUMBER) RETURN NUMBER IS
    RESULT NUMBER;
    CURSOR c1 IS
      SELECT NVL(FK_SMID, -1)
        FROM ASU.TIB
       WHERE TIB.FK_PACID = asu.pkg_regist_pacfunc.GET_PEPL_ID(pAmbid)
         AND FK_SMEDITID = GET_LICHDANDON_REZUS;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO RESULT;
    IF c1%NOTFOUND
    THEN
      RESULT := -1;
    END IF;
    CLOSE c1;
    RETURN RESULT;
  END;

  FUNCTION GET_LAST_LABNAZ_RES(pPacId NUMBER, pSyn VARCHAR2) RETURN VARCHAR2
  IS
  RESULT VARCHAR2(255);
     CURSOR C1 IS
       SELECT GET_RESULT_VALUE(TRESAN.FK_NAZID,  TRESAN.FK_SMID)
       FROM TRESAN WHERE FK_ID =
                  (SELECT MAX(FK_ID) FROM TRESAN R
                   WHERE R.FK_PACID = pPacId
                          AND R.FK_SMID = STAT.PKG_STATUTIL.GET_SMIDID(pSyn)
                          AND FL_ZAKL = 0);
  BEGIN
    OPEN c1;
    FETCH c1
      INTO RESULT;
    IF c1%NOTFOUND
    THEN
      RESULT := '';
    END IF;
    CLOSE c1;
    RETURN RESULT;
  END;

  FUNCTION GET_VIDDONOR(pPosId IN NUMBER) RETURN NUMBER IS

  BEGIN
    FOR c IN (SELECT sm.fk_id
                FROM asu.tib,
                     (SELECT fk_id, 1 typ
                        FROM asu.tsmid
                      CONNECT BY PRIOR fk_id = fk_owner
                       START WITH fc_synonim =
                                  'PERELIV_OPERAC_PARAMS_DONORTYPE'
                      UNION ALL
                      SELECT fk_id, 2 typ
                        FROM asu.tsmid
                      CONNECT BY PRIOR fk_id = fk_owner
                       START WITH fc_synonim = 'VID_KROVODACHI') sm,
                     asu.tdonorpos_naz dn
               WHERE dn.fk_posid = pPosId
                 AND tib.fk_pacid = dn.fk_nazid
                 AND tib.fk_smid = sm.fk_id
               ORDER BY typ asc)
    LOOP
      RETURN C.FK_ID;
    END LOOP;
    RETURN -1;

  END;

END PKG_DONOR;
/

SHOW ERRORS;


