DROP FUNCTION ASU.GET_PRIORRAZ
/

--
-- GET_PRIORRAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSPEC (Table)
--   TVRACH (Table)
--   TVRACHRAZ (Table)
--   TLEVEL (Table)
--   TPASS (Table)
--   TRAZDEL (Table)
--   GET_LECHVRACHSPECID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_PRIORRAZ" (pfk_sotrid IN NUMBER, pfk_smid IN NUMBER, pfk_razdid IN NUMBER, pFK_Prior IN NUMBER, pFK_PACID IN NUMBER,pFK_SPECID IN NUMBER,pFL_ARCH IN NUMBER:=0)
  RETURN NUMBER IS
  CURSOR cSpec IS
    SELECT/*+rule*/ fk_specid
      FROM tvrachraz, trazdel
     WHERE tvrachraz.fk_razdid = trazdel.fk_id
       AND trazdel.fk_id = tvrachraz.fk_razdid
       AND fk_smid = pfk_smid;

/*  CURSOR cPriorKons (pFK_SPECID IN NUMBER) IS
    SELECT /*+rule*/
                    /*fp_type
      FROM tvrachraz, trazdel
     WHERE tvrachraz.FK_RAZDID = pFK_RAZDID
       AND trazdel.fk_id = tvrachraz.fk_razdid
       AND tvrachraz.fk_specid = pFK_SPECID
       AND (   trazdel.fk_smid IS NULL
            OR trazdel.fk_smid IN (pFK_SMID, -1, 0));
*/
  CURSOR cPriorLech IS
    SELECT/*+rule*/ fp_type
      FROM tvrachraz, tspec, tpass, tlevel
     WHERE tpass.fk_sotrid = pFK_SOTRID
       AND tspec.fk_levelid = tlevel.fk_id
       AND tlevel.FK_PRIOR = pFK_PRIOR
       AND tpass.fk_specid = tspec.fk_id
       AND tvrachraz.fk_specid = tspec.fk_id
       AND tvrachraz.fk_razdid = pFK_RAZDID;

  CURSOR cGetNaprPrior IS
    SELECT/*+rule*/ FL_VID, FK_SPECID
      FROM TVRACH
     WHERE FK_VRACHID = pFK_SOTRID
       AND FK_PACID = pFK_PACID
       AND FL_VID IN ('W', 'R');

  CURSOR cGetEnabledSpec (nSPECID NUMBER) IS
    SELECT/*+rule*/ FP_TYPE
      FROM TVRACHRAZ
     WHERE FK_SPECID = nSPECID
       AND FK_RAZDID = pFK_RAZDID;

  CURSOR cPriorKons (pSPECID NUMBER) IS
    SELECT/*+rule*/ fp_type
      FROM tvrachraz
     WHERE tvrachraz.FK_RAZDID = pFK_RAZDID
      -- AND tvrachraz.fk_specid = pSPECID; --by TimurLan
       AND tvrachraz.fk_specid = pFK_SPECID;

  CURSOR cPriorKonsSMID IS
    SELECT/*+rule*/ fp_type
      FROM tvrachraz, trazdel
     WHERE tvrachraz.FK_RAZDID = pFK_RAZDID
       AND trazdel.fk_id = tvrachraz.fk_razdid
       AND trazdel.fk_smid = pFK_SMID;

  CURSOR cISVrach IS
    SELECT FK_ID
      FROM TVRACH
     WHERE FL_VID = 'M'
       AND FK_PACID = pFK_PACID
       AND FK_VRACHID = pFK_SOTRID;

  CURSOR cDOID IS
    SELECT/*+RULE*/ FK_DOID
      FROM TRAZDEL
     WHERE FK_ID = pFK_RAZDID;

  CURSOR cSpecPrior IS
    SELECT/*+rule*/ TVRACHRAZ.FK_SPECID,FP_TYPE
      FROM tvrachraz, tspec, tpass, tlevel
     WHERE tlevel.FK_PRIOR = pFK_PRIOR
       AND tspec.fk_levelid = tlevel.fk_id
       AND tvrachraz.fk_specid = tspec.fk_id
       AND tvrachraz.fk_razdid = pFK_RAZDID
       AND tpass.fk_sotrid = pFK_SOTRID
       AND tpass.fk_specid = TVRACHRAZ.fk_specid;

  nSpec NUMBER := -1;
  nPrior NUMBER := -1;
  strVID VARCHAR2 (1);
  n NUMBER;

  nTSpec NUMBER:=NULL;
  nTPrior NUMBER:=NULL;
BEGIN
  IF pFK_PRIOR = 0 THEN--Направленные...
    OPEN cGetNaprPrior;
    FETCH cGetNaprPrior INTO strVID, nSpec;
    CLOSE cGetNaprPrior;

    IF strVID = 'R' THEN
      RETURN 0;
    ELSIF strVID = 'W' THEN
      OPEN cGetEnabledSpec (nSPEC);
      FETCH cGetEnabledSpec INTO nPrior;
      CLOSE cGetEnabledSpec;
      IF pFL_ARCH=0 THEN
        RETURN nPrior;
      ELSE
        RETURN 0;
      END IF;
    END IF;
  END IF;

  IF pFK_PRIOR = 1 THEN--узкий врач
    OPEN cISVrach;
    FETCH cISVrach INTO n;

    IF cISVrach%NOTFOUND THEN--Не его лечащий врач...
      nPrior  := -1;
      OPEN cPriorKonsSMID;
      FETCH cPriorKonsSMID INTO nPrior;

      IF cPriorKonsSMID%NOTFOUND THEN
        nSpec  := -1;
        OPEN cSpec;
        FETCH cSpec INTO nSpec;
        CLOSE cSpec;
        OPEN cPriorKons (nSpec);
        FETCH cPriorKons INTO nPrior;

        IF cPriorKons%NOTFOUND THEN
          nPrior  := -1;
        END IF;

        CLOSE cPriorKons;
        n      := -1;
        OPEN cDOID;
        FETCH cDOID INTO n;
        CLOSE cDOID;

        IF n = 13 THEN
          nPrior  := -1;
        END IF;
      END IF;

      CLOSE cPriorKonsSMID;
    ELSE--Его лечащий врач...
      nPrior  := -1;
      OPEN cPriorKonsSMID;
      FETCH cPriorKonsSMID INTO nPrior;

      IF cPriorKonsSMID%NOTFOUND THEN
        OPEN cPriorKons (get_lechvrachspecid);
        FETCH cPriorKons INTO nPrior;

        IF cPriorKons%NOTFOUND THEN
          nPrior  := -1;
        END IF;

        CLOSE cPriorKons;
      END IF;

      CLOSE cPriorKonsSMID;
    END IF;

    CLOSE cISVrach;
  END IF;

  IF pFK_PRIOR IN (2,3,4) THEN
    n      := -1;
    OPEN cDOID;
    FETCH cDOID INTO n;
    CLOSE cDOID;

    IF n = 13 THEN
      RETURN -1;
    END IF;
  END IF;
  IF pFK_PRIOR = 2 THEN--узкий врач
    OPEN cPriorKons (get_lechvrachspecid);
    FETCH cPriorKons INTO nPrior;
    CLOSE cPriorKons;
    IF pFL_ARCH=0 THEN
      RETURN nPrior;
    ELSE
      RETURN 0;
    END IF;
  END IF;

  IF pFK_PRIOR IN (3,4) THEN--Заведующий отделением
    nPrior:=NULL;
    FOR p IN cSpecPrior LOOP
      IF nTSpec IS NULL AND nTPrior IS NULL THEN
        nTSpec:=p.FK_SPECID;
        nTPrior:=p.FP_TYPE;
      END IF;
      IF p.FK_SPECID=pFK_SPECID THEN
        nPrior:=p.FP_TYPE;
        EXIT;
      END IF;
    END LOOP;

    IF nPrior IS NULL AND nTPrior IS NULL THEN
      RETURN -1;
    ELSIF nPrior IS NULL AND nTPrior IS NOT NULL THEN
      IF pFL_ARCH=0 THEN
        RETURN nTPrior;
      ELSE
        RETURN 0;
      END IF;
    END IF;
  END IF;

  IF pFL_ARCH=0 THEN
    RETURN nPrior;
  ELSE
    RETURN 0;
  END IF;
END;
/

SHOW ERRORS;


