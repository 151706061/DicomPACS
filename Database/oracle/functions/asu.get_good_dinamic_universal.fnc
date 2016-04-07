DROP FUNCTION ASU.GET_GOOD_DINAMIC_UNIVERSAL
/

--
-- GET_GOOD_DINAMIC_UNIVERSAL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPATNAME (Table)
--   TSMID (Table)
--   VRESAN (Table)
--   GET_SEX (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_GOOD_DINAMIC_UNIVERSAL" (pFK_PACID IN NUMBER, pFK_SMID IN NUMBER,pFK_COLID IN NUMBER)
  RETURN NUMBER IS
  CURSOR cCVal (pPACID NUMBER,pSMID NUMBER,pCOLID NUMBER) IS
    SELECT FP_PRIOR FL_PAT, FN_RES, FN_RES2
      FROM VRESAN,(SELECT MIN(FK_ID) FK_MINID FROM VRESAN WHERE FK_PACID=pPACID AND FK_SMID = pSMID AND FK_COLID=pCOLID),TPATNAME
     WHERE VRESAN.FK_ID = FK_MINID AND TPATNAME.FK_ID=FK_PATID;
  CURSOR cCVal1 (pPACID NUMBER,pSMID NUMBER) IS
    SELECT FP_PRIOR FL_PAT, FN_RES, FN_RES2
      FROM VRESAN,(SELECT MIN(FK_ID) FK_MINID FROM VRESAN WHERE FK_PACID=pPACID AND FK_SMID = pSMID ),TPATNAME
     WHERE VRESAN.FK_ID = FK_MINID AND TPATNAME.FK_ID=FK_PATID;
  CURSOR c (pPACID NUMBER,pSMID NUMBER,pCOLID NUMBER) IS
    SELECT FP_PRIOR FL_PAT, FN_RES, FN_RES2
      FROM VRESAN,TPATNAME,(SELECT MAX(FK_ID) FK_MAXID FROM VRESAN WHERE FK_PACID=pPACID AND FK_SMID = pSMID AND FK_COLID=pCOLID)
     WHERE VRESAN.FK_ID=FK_MAXID AND FK_PATID=TPATNAME.FK_ID;
  CURSOR c1 (pPACID NUMBER,pSMID NUMBER) IS
    SELECT FP_PRIOR FL_PAT, FN_RES, FN_RES2
      FROM VRESAN,TPATNAME,(SELECT MAX(FK_ID) FK_MAXID FROM VRESAN WHERE FK_PACID=pPACID AND FK_SMID = pSMID)
     WHERE VRESAN.FK_ID = FK_MAXID AND FK_PATID=TPATNAME.FK_ID;
/*  CURSOR cCheck(pPACID NUMBER,pSMID NUMBER) IS --SELECT COUNT (FK_NAZID) FROM VRESPAT WHERE FK_PACID=pFK_PACID AND FK_SMID=pFK_SMID;Old
                   SELECT COUNT (FK_NAZID) FROM VRESAN,TPATNAME WHERE FK_PACID=pPACID AND FK_SMID=pSMID AND TPATNAME.FK_ID=FK_PATID AND FP_PRIOR>0;
  CURSOR cCheckCount(pPACID NUMBER,pSMID NUMBER,pCOLID NUMBER) IS SELECT COUNT(DISTINCT FK_ID) FROM VRESAN
                                                                    WHERE FK_PACID=pPACID AND
                                                                          FK_SMID=pSMID AND
                                                                          FK_COLID=pCOLID;
  CURSOR cCheckCount1(pPACID NUMBER,pSMID NUMBER) IS SELECT COUNT(DISTINCT FK_ID) FROM VRESAN WHERE FK_PACID=pPACID AND FK_SMID=pSMID ;
*/
  CURSOR cNorm (pSMID NUMBER) IS
    SELECT FC_TYPE, FN_HI_M, FN_LOW_M, FN_HI_W, FN_LOW_W
      FROM TSMID
     WHERE FK_ID = pSMID;
  strType VARCHAR2 (30);
  nCV1 NUMBER;
  nCV2 NUMBER;
  nMax NUMBER;
  nMin NUMBER;
  bCheck NUMBER;
  nID NUMBER;
BEGIN
/*  IF pFK_COLID IS NULL THEN
    OPEN cCheckCount1(pFK_PACID,pFK_SMID);
    FETCH cCheckCount1 INTO nID;
    CLOSE cCheckCount1;
  ELSE
    OPEN cCheckCount(pFK_PACID,pFK_SMID,pFK_COLID);
    FETCH cCheckCount INTO nID;
    CLOSE cCheckCount;
  END IF;
  IF nID<2 THEN
    RETURN 0;
  END IF;
*/
/*  OPEN cCheck(pFK_PACID,pFK_SMID);
  FETCH cCheck INTO nID;
  CLOSE cCheck;
  IF nID=0 THEN
    RETURN 0;
  END IF;
*/
  IF pFK_COLID IS NULL THEN
    OPEN cCVal1(pFK_PACID,pFK_SMID);
    FETCH cCVal1 INTO nID, nCV1, nCV2;
    CLOSE cCVal1;
  ELSE
    OPEN cCVal(pFK_PACID,pFK_SMID,pFK_COLID);
    FETCH cCVal INTO nID, nCV1, nCV2;
    CLOSE cCVal;
  END IF;
  FOR p IN cNorm (pFK_SMID) LOOP
    strType  := p.FC_TYPE;
    IF GET_SEX (pFK_PACID) = 1 THEN
      nMax  := p.FN_HI_M;
      nMin  := p.FN_LOW_M;
    ELSE
      nMax  := p.FN_HI_W;
      nMin  := p.FN_LOW_W;
    END IF;
  END LOOP;
  IF     nMax IS NOT NULL
     AND nMin IS NOT NULL THEN
    bCheck  := 1;
  ELSIF nMin IS NOT NULL THEN
    bCheck  := 2;
  ELSIF nMax IS NOT NULL THEN
    bCheck  := 3;
  ELSE
    bCheck  := 0;
  END IF;
  IF pFK_COLID IS NOT NULL THEN
    FOR p IN c (pFK_PACID,pFK_SMID,pFK_COLID) LOOP
  --      raise_application_error(-20002,p.FL_PAT);
      IF p.FL_PAT = 0 THEN
        RETURN 1;
      ELSIF strType = 'NUMBER' THEN
        IF bCheck = 2 THEN
          BEGIN
            IF ( (nMin - nCV1) / (nMin - p.FN_RES) ) >= 2 THEN
              RETURN 1;
            END IF;
          EXCEPTION
            WHEN OTHERS THEN
              NULL;
          END;
        ELSIF bCheck = 3 THEN
          BEGIN
            IF ( (nCV1 - nMax) / (p.FN_RES - nMax) ) >= 2 THEN
              RETURN 1;
            END IF;
          EXCEPTION
            WHEN OTHERS THEN
              NULL;
          END;
        ELSIF bCheck = 1 THEN
          IF nCV1 > nMax THEN
            BEGIN
              IF ( (nCV1 - nMax) / (p.FN_RES - nMax) ) >= 2 THEN
                RETURN 1;
              END IF;
            EXCEPTION
              WHEN OTHERS THEN
                NULL;
            END;
          ELSIF nCV1 < nMin THEN
            BEGIN
              IF ( (nMin - nCV1) / (nMin - p.FN_RES) ) >= 2 THEN
                RETURN 1;
              END IF;
            EXCEPTION
              WHEN OTHERS THEN
                NULL;
            END;
          END IF;
        END IF;
      END IF;
    END LOOP;
  ELSE
    FOR p IN c1 (pFK_PACID,pFK_SMID) LOOP
  --      raise_application_error(-20002,p.FL_PAT);
      IF p.FL_PAT = 0 THEN
        RETURN 1;
      ELSIF strType = 'NUMBER' THEN
        IF bCheck = 2 THEN
          BEGIN
            IF ( (nMin - nCV1) / (nMin - p.FN_RES) ) >= 2 THEN
              RETURN 1;
            END IF;
          EXCEPTION
            WHEN OTHERS THEN
              NULL;
          END;
        ELSIF bCheck = 3 THEN
          BEGIN
            IF ( (nCV1 - nMax) / (p.FN_RES - nMax) ) >= 2 THEN
              RETURN 1;
            END IF;
          EXCEPTION
            WHEN OTHERS THEN
              NULL;
          END;
        ELSIF bCheck = 1 THEN
          IF nCV1 > nMax THEN
            BEGIN
              IF ( (nCV1 - nMax) / (p.FN_RES - nMax) ) >= 2 THEN
                RETURN 1;
              END IF;
            EXCEPTION
              WHEN OTHERS THEN
                NULL;
            END;
          ELSIF nCV1 < nMin THEN
            BEGIN
              IF ( (nMin - nCV1) / (nMin - p.FN_RES) ) >= 2 THEN
                RETURN 1;
              END IF;
            EXCEPTION
              WHEN OTHERS THEN
                NULL;
            END;
          END IF;
        END IF;
      END IF;
    END LOOP;
  END IF;
  RETURN 0;
END;-- Function GET_GOOD_DYN_LAB
/

SHOW ERRORS;


