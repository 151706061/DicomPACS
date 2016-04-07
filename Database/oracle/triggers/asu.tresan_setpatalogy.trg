DROP TRIGGER ASU.TRESAN_SETPATALOGY
/

--
-- TRESAN_SETPATALOGY  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESAN (Table)
--   TPATNAME (Table)
--   TAMBULANCE (Table)
--   TSMID (Table)
--   TSMIDNORMS (Table)
--   GET_MINPAT (Function)
--   GET_SEX (Function)
--   GET_TYPE_FROM_SMID (Function)
--   INSNAZ (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESAN_SETPATALOGY" 
 BEFORE 
 INSERT OR UPDATE
 ON ASU.TRESAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  CURSOR cGetPacAge(pFK_PACID IN NUMBER) IS
     SELECT EXTRACT(YEAR FROM YEARS_MONTHS) Y,
            EXTRACT(MONTH FROM YEARS_MONTHS) M,
            EXTRACT(DAY FROM DAYS_HOURS) D
      FROM (SELECT NUMTOYMINTERVAL(MONTHS_BETWEEN(sysdate, fd_rojd), 'MONTH') YEARS_MONTHS,
                   NUMTODSINTERVAL(sysdate - ADD_MONTHS(fd_rojd, TRUNC(MONTHS_BETWEEN(sysdate, fd_rojd))), 'DAY') DAYS_HOURS
            FROM asu.tkarta
            WHERE tkarta.fk_id = pFK_PACID
            UNION ALL
            SELECT NUMTOYMINTERVAL(MONTHS_BETWEEN(sysdate, fd_rojd), 'MONTH') YEARS_MONTHS,
                   NUMTODSINTERVAL(sysdate - ADD_MONTHS(fd_rojd, TRUNC(MONTHS_BETWEEN(sysdate, fd_rojd))), 'DAY') DAYS_HOURS
            FROM asu.tambulance
            WHERE tambulance.fk_id = pFK_PACID);

     
  CURSOR cLM (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FN_LOW_M, FN_HI_M, FN_LOW_W, FN_HI_W, FC_TYPE, FP_PAT
      FROM TSMID
     WHERE FK_ID = pFK_SMID;
  CURSOR cIsSubNorm (pFK_SMID NUMBER) IS
    SELECT /*+rule*/FK_ID FROM TSMIDNORMS WHERE FK_SMID=pFK_SMID;
  CURSOR cSubNorm (pFK_SMID NUMBER, pFN_Y NUMBER, pFN_M NUMBER, pFN_D NUMBER) IS
    SELECT/*+rule*/ FN_LOW_M, FN_HI_M, FN_LOW_W, FN_HI_W, GET_TYPE_FROM_SMID(FK_SMID),
                    FL_LOW_M_EQ, FN_HI_M_EQ, FN_LOW_EQ, FN_HI_EQ, FN_ONE_RES_M, FN_ONE_RES_W
      FROM TSMIDNORMS
     WHERE FK_SMID = pFK_SMID AND pFN_Y * 365 + pFN_M * 31 + pFN_D  BETWEEN FN_YEAR1 * 365 + FN_MOUNTH_1 * 31 + FN_DAY_1 AND FN_YEAR2 * 365 + FN_MOUNTH_2 * 31 + FN_DAY_2;
  CURSOR cPatW (pVal NUMBER) IS
    SELECT/*+rule*/ FK_ID
      FROM TPATNAME
     WHERE FN_LOWW < pVal
       AND (   FN_HIGHW > pVal
            OR FN_HIGHW IS NULL);
  CURSOR cPatM (pVal NUMBER) IS
    SELECT/*+rule*/ FK_ID
      FROM TPATNAME
     WHERE FN_LOWM < pVal
       AND (   FN_HIGHM > pVal
            OR FN_HIGHM IS NULL);
  nMHigh NUMBER;
  nMLow NUMBER;
  nWHigh NUMBER;
  nWLow NUMBER;
  cType VARCHAR2 (30);
  nPat NUMBER;
  nSex NUMBER;
  nRazn NUMBER;
  nMHigh1 NUMBER;
  nMLow1 NUMBER;
  nWHigh1 NUMBER;
  nWLow1 NUMBER;
  cType1 VARCHAR2 (30);
  nPat1 NUMBER;
  i NUMBER;
  
  nY NUMBER;
  nM NUMBER;
  nD NUMBER;
  
  nFL_LOW_M_EQ NUMBER;
  nFN_HI_M_EQ NUMBER;
  nFN_LOW_EQ NUMBER;
  nFN_HI_EQ NUMBER;
  nFN_ONE_RES_M NUMBER;
  nFN_ONE_RES_W NUMBER;
  nLeft NUMBER;
  nRight NUMBER;
BEGIN
  /*sam*/
  IF insnaz.bins THEN
    RETURN;
  END IF;
  /*sam*/
/*  if :NEW.FN_RES=:OLD.FN_RES AND :NEW.FK_BLOBID=:OLD.FK_BLOBID then
    RETURN;
  end if;
*/
  IF :NEW.FK_PATID <> :OLD.FK_PATID THEN
    RETURN;
/*  ELSIF :NEW.FN_RES = :OLD.FN_RES THEN
    RETURN;
  ELSIF :NEW.FK_BLOBID = :OLD.FK_BLOBID THEN
    RETURN; --Внимание!!!!!!!!!! Было раскомметнированно!!!!!!!!!!!
*/END IF;
  nSex  := GET_SEX (:NEW.FK_PACID);
  OPEN cIsSubNorm(:NEW.FK_SMID);
  FETCH cIsSubNorm INTO i;
  IF cIsSubNorm%NOTFOUND THEN
    Open cLM(:NEW.FK_SMID);
    FETCH cLM INTO nMLow, nMHigh, nWLow, nWHigh, cType, nPat;
    CLOSE cLM;
  ELSE
    nPat:=NULL;
    
    OPEN cGetPacAge(:NEW.FK_PACID);
    Fetch cGetPacAge INTO  nY, nM, nD;
    Close cGetPacAge;
    OPEN cSubNorm (:NEW.FK_SMID,nY, nM, nD);
    FETCH cSubNorm INTO nMLow, nMHigh, nWLow, nWHigh, cType, nFL_LOW_M_EQ, nFN_HI_M_EQ, nFN_LOW_EQ, nFN_HI_EQ, nFN_ONE_RES_M, nFN_ONE_RES_W;
    IF cSubNorm%NOTFOUND THEN
      OPEN cLM (:NEW.FK_SMID);
      FETCH cLM INTO nMLow, nMHigh, nWLow, nWHigh, cType, nPat;
      CLOSE cLM;
    END IF;
    CLOSE cSubNorm;
  END IF;
  CLOSE cIsSubNorm;
  OPEN cPatW (0);
  FETCH cPatW INTO :NEW.fk_patid;
  CLOSE cPatW;
  IF nSex = 0 THEN
--    if nWHigh is not null and nWLow is not null then
    IF cType = 'NUMBER' THEN
      -- если установлен признак принадлежнсти конкретному значению
      if nFN_ONE_RES_W is not null and nFN_ONE_RES_W = :NEW.FN_RES then
        OPEN cPatW (0);
        FETCH cPatW INTO :NEW.fk_patid;
        CLOSE cPatW;
        Return;
      else
        if ((:NEW.FN_RES > nWLow) OR (:NEW.FN_RES = nWLow and nFN_LOW_EQ = 1) or (nWLow = 0)) then
            nLeft := 0;
         else
            BEGIN
              OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
              Return;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
               :NEW.FK_PATID := GET_MINPAT;
            END;
        end if;
        if ((:NEW.FN_RES < nWHigh) OR (:NEW.FN_RES = nWHigh and nFN_HI_EQ = 1) or (nWHigh = 0)) then
            nRight := 0;
         else
           BEGIN
             OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
             FETCH cPatW INTO :NEW.fk_patid;
             CLOSE cPatW;
             RETURN;
           EXCEPTION
             WHEN ZERO_DIVIDE THEN
               :NEW.FK_PATID := GET_MINPAT;
           END;
        end if;
        
        OPEN cPatW (0);
        FETCH cPatW INTO :NEW.fk_patid;
        CLOSE cPatW;
        RETURN;
     end if;
/*
      IF  (:NEW.FN_RES BETWEEN nWLow AND nWHigh) and ()
      THEN
        OPEN cPatW (0);
        FETCH cPatW INTO :NEW.fk_patid;
        CLOSE cPatW;
        RETURN;
      ELSIF :NEW.FN_RES < nWLow THEN
        BEGIN
          OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES > nWHigh THEN
        BEGIN
          OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      END IF;
*/
------------------ DUALNUM
    ELSIF cType = 'DUALNUM' THEN
      IF    (    :NEW.FN_RES BETWEEN nWLow AND nWHigh
             AND :NEW.FN_RES2 BETWEEN nWLow AND nWHigh)
/*         OR (    nWLow = 0
             AND nWHigh = 0)*/
      THEN
        OPEN cPatW (0);
        FETCH cPatW INTO :NEW.fk_patid;
        CLOSE cPatW;
        RETURN;
      ELSIF :NEW.FN_RES < nWLow THEN
        BEGIN
          OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES2 < nWLow THEN
        BEGIN
          OPEN cPatW ( ( (nWLow - :NEW.FN_RES2) / nWLow) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES > nWHigh THEN
        BEGIN
          OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES2 > nWHigh THEN
        BEGIN
          OPEN cPatW ( ( (:NEW.FN_RES2 - nWHigh) / nWHigh) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      END IF;
------------------
    ELSIF cType = 'COMBOBOX' THEN
      OPEN cLM (:NEW.FK_BLOBID);
      FETCH cLM INTO nMLow1, nMHigh1, nWLow1, nWHigh1, cType1, nPat1;
      CLOSE cLM;
      IF nPat1 = 1 THEN
        :NEW.FK_PATID := GET_MINPAT;
        RETURN;
      ELSIF    nPat1 = 0
            OR nPat1 IS NULL THEN
        IF cType1 = 'NUMBER' THEN
          IF    (:NEW.FN_RES BETWEEN nWLow AND nWHigh)
/*             OR (    nWLow = 0
                 AND nWHigh = 0)
*/           OR (    nWLow IS NULL
                 AND nWHigh IS NULL)
             OR (    :NEW.FN_RES < nWHigh
                 AND nWLow IS NULL)
             OR (    :NEW.FN_RES > nWLow
                 AND nWHigh IS NULL) THEN
            OPEN cPatW (0);
            FETCH cPatW INTO :NEW.fk_patid;
            CLOSE cPatW;
            RETURN;
          ELSIF :NEW.FN_RES < nWLow THEN
            BEGIN
              OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES > nWHigh THEN
            BEGIN
              OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          END IF;
        ELSIF cType1 = 'DUALNUM' THEN
          IF    (    :NEW.FN_RES BETWEEN nWLow AND nWHigh
                 AND :NEW.FN_RES2 BETWEEN nWLow AND nWHigh)
/*             OR (    nWLow = 0
                 AND nWHigh = 0)*/ THEN
            OPEN cPatW (0);
            FETCH cPatW INTO :NEW.fk_patid;
            CLOSE cPatW;
            RETURN;
          ELSIF :NEW.FN_RES < nWLow THEN
            BEGIN
              OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES2 < nWLow THEN
            BEGIN
              OPEN cPatW ( ( (nWLow - :NEW.FN_RES2) / nWLow) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES > nWHigh THEN
            BEGIN
              OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES2 > nWHigh THEN
            BEGIN
              OPEN cPatW ( ( (:NEW.FN_RES2 - nWHigh) / nWHigh) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          END IF;
        END IF;
      END IF;
    END IF;
--    end if;
  ELSIF nSex = 1 THEN
    IF cType = 'NUMBER' THEN
      -- если установлен признак принадлежнсти конкретному значению
      if nFN_ONE_RES_M is not null and nFN_ONE_RES_M = :NEW.FN_RES then
        OPEN cPatM (0);
        FETCH cPatM INTO :NEW.fk_patid;
        CLOSE cPatM;
        Return;
      else
        if ((:NEW.FN_RES > nMLow) OR (:NEW.FN_RES = nMLow and nFL_LOW_M_EQ = 1) or (nMLow = 0)) then
            nLeft := 0;
         else
            BEGIN
              OPEN cPatM ( ( (nMLow - :NEW.FN_RES) / nMLow) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
              Return;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
               :NEW.FK_PATID := GET_MINPAT;
            END;
        end if;
        if ((:NEW.FN_RES < nMHigh) OR (:NEW.FN_RES = nMHigh and nFN_HI_M_EQ = 1) or (nMHigh = 0)) then
            nRight := 0;
         else
           BEGIN
             OPEN cPatM ( ( (:NEW.FN_RES - nMHigh) / nMHigh) * 100);
             FETCH cPatM INTO :NEW.fk_patid;
             CLOSE cPatM;
             RETURN;
           EXCEPTION
             WHEN ZERO_DIVIDE THEN
               :NEW.FK_PATID := GET_MINPAT;
           END;
        end if;

        OPEN cPatM (0);
        FETCH cPatM INTO :NEW.fk_patid;
        CLOSE cPatM;
        RETURN;
     end if;
-------------------------------
    ELSIF cType = 'DUALNUM' THEN
      IF    (    :NEW.FN_RES BETWEEN nMLow AND nMHigh
             AND :NEW.FN_RES2 BETWEEN nMLow AND nMHigh)
/*         OR (    nMLow = 0
             AND nMHigh = 0)*/ THEN
        OPEN cPatM (0);
        FETCH cPatM INTO :NEW.fk_patid;
        CLOSE cPatM;
        RETURN;
      ELSIF :NEW.FN_RES < nMLow THEN
        BEGIN
          OPEN cPatM ( ( (nMLow - :NEW.FN_RES) / nMLow) * 100);
          FETCH cPatM INTO :NEW.fk_patid;
          CLOSE cPatM;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES2 < nMLow THEN
        BEGIN
          OPEN cPatM ( ( (nMLow - :NEW.FN_RES2) / nMLow) * 100);
          FETCH cPatM INTO :NEW.fk_patid;
          CLOSE cPatM;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES > nMHigh THEN
        BEGIN
          OPEN cPatM ( ( (:NEW.FN_RES - nMHigh) / nMHigh) * 100);
          FETCH cPatM INTO :NEW.fk_patid;
          CLOSE cPatM;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES2 > nMHigh THEN
        BEGIN
          OPEN cPatM ( ( (:NEW.FN_RES2 - nMHigh) / nMHigh) * 100);
          FETCH cPatM INTO :NEW.fk_patid;
          CLOSE cPatM;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      END IF;
-------------------------------
    ELSIF cType = 'COMBOBOX' THEN
      OPEN cLM (:NEW.FK_BLOBID);
      FETCH cLM INTO nMLow1, nMHigh1, nWLow1, nWHigh1, cType1, nPat1;
      CLOSE cLM;
      IF nPat1 = 1 THEN
        :NEW.FK_PATID := GET_MINPAT;
        RETURN;
      ELSIF    nPat1 = 0
            OR nPat1 IS NULL THEN
        IF cType1 = 'NUMBER' THEN
          IF    (:NEW.FN_RES BETWEEN nMLow AND nMHigh)
/*             OR (    nMLow = 0
                 AND nMHigh = 0)
*/           OR (    nMLow IS NULL
                 AND nMHigh IS NULL)
             OR (    :NEW.FN_RES < nMHigh
                 AND nMLow IS NULL)
             OR (    :NEW.FN_RES > nMLow
                 AND nMHigh IS NULL) THEN
            OPEN cPatM (0);
            FETCH cPatM INTO :NEW.fk_patid;
            CLOSE cPatM;
            RETURN;
          ELSIF :NEW.FN_RES < nMLow THEN
            BEGIN
              OPEN cPatM ( ( (nMLow - :NEW.FN_RES) / nMLow) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES > nMHigh THEN
            BEGIN
              OPEN cPatM ( ( (:NEW.FN_RES - nMHigh) / nMHigh) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          END IF;
-------------------------------
        ELSIF cType1 = 'DUALNUM' THEN
          IF    (    :NEW.FN_RES BETWEEN nMLow AND nMHigh
                 AND :NEW.FN_RES2 BETWEEN nMLow AND nMHigh)
  /*           OR (    nMLow = 0
                 AND nMHigh = 0)*/ THEN
            OPEN cPatM (0);
            FETCH cPatM INTO :NEW.fk_patid;
            CLOSE cPatM;
            RETURN;
          ELSIF :NEW.FN_RES < nMLow THEN
            BEGIN
              OPEN cPatM ( ( (nMLow - :NEW.FN_RES) / nMLow) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES2 < nMLow THEN
            BEGIN
              OPEN cPatM ( ( (nMLow - :NEW.FN_RES2) / nMLow) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES > nMHigh THEN
            BEGIN
              OPEN cPatM ( ( (:NEW.FN_RES - nMHigh) / nMHigh) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES2 > nMHigh THEN
            BEGIN
              OPEN cPatM ( ( (:NEW.FN_RES2 - nMHigh) / nMHigh) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          END IF;
-------------------------------
        END IF;
      END IF;
    END IF;
  END IF;
END;
/
SHOW ERRORS;


