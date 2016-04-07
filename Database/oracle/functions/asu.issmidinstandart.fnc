DROP FUNCTION ASU.ISSMIDINSTANDART
/

--
-- ISSMIDINSTANDART  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--   TSTANDART (Table)
--   TSTANDART_HEAL (Table)
--   TSTANDART_ICD10 (Table)
--   THEAL_SMID (Table)
--   TDIAG (Table)
--   TICD10 (Table)
--   TSMID (Table)
--   GET_MAINDIAG (Function)
--   GET_STANDART_GROUPLAST (Function)
--
CREATE OR REPLACE FUNCTION ASU."ISSMIDINSTANDART" (pPacID VARCHAR2, pSmid NUMBER)
  RETURN NUMBER IS
  --by A.Nakorjakov 210808
  --смид назначения пациента входит в последний (GET_CURRENT_STANDGROUP) стандарт? 0 - не входит; 1 - входит
  -- Edited by Spasskiy S.N. 10.09.2008 ускорить выполнение
  v_cnt     NUMBER;
  v_res     NUMBER;
  v_mkb10   TSMID.FK_MKB10%TYPE;
  v_db_name TSMINI.FC_VALUE%TYPE;
BEGIN

  FOR c IN (SELECT sm.fk_mkb10
              FROM tdiag d,
                   tsmid sm,
                   (SELECT fk_id FROM asu.tsmid WHERE fc_synonim = 'CLINIK') sc
             WHERE d.fk_pacid = pPacID
               AND d.fp_type = sc.fk_id
               AND d.fl_main = asu.get_maindiag
               AND sm.fk_id = d.fk_smdiagid
               AND fk_mkb10 IS NOT NULL
             ORDER BY d.fk_id DESC) LOOP
    v_mkb10 := c.fk_mkb10;
    EXIT;
  END LOOP;
  SELECT nvl(MAX(FC_VALUE), 'H')
    INTO v_db_name
    FROM TSMINI
   WHERE UPPER(FC_SECTION) = UPPER('CONFIG')
     AND UPPER(FC_KEY) = UPPER('DB_NAME');
  /*SELECT do_mkb(MAX(d.fk_id))
    into v_mkb10
           FROM tdiag d, tsmid sm
          WHERE d.fk_pacid = pPacID
            AND d.fp_type = GET_synid('CLINIK')
            AND d.fl_main = GET_MAINDIAG
            AND sm.fk_id = d.fk_smdiagid
            AND fk_mkb10 IS NOT NULL;
  SELECT ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H')
      INTO v_db_name
      FROM DUAL;
  */
  v_cnt := 0;
  IF v_db_name = 'M' THEN
    SELECT COUNT(1)
      INTO v_cnt
      FROM asu.ticd10          i,
           asu.tstandart_icd10 si,
           asu.tstandart_heal  sh,
           asu.theal_smid      hs
     WHERE i.fc_kod1 = v_mkb10
       AND i.fk_id = si.fk_icd10
       AND si.fk_standart = sh.fk_standart
       AND sh.fk_heal = hs.fk_heal
       AND hs.fk_smid = pSmid;
  ELSE
    SELECT COUNT(1)
      INTO v_cnt
      FROM asu.ticd10          i,
           asu.tstandart_icd10 si,
           asu.tstandart       s,
           asu.tstandart_heal  sh,
           asu.theal_smid      hs
     WHERE i.fc_kod1 = v_mkb10
       AND i.fk_id = si.fk_icd10
       AND si.fk_standart = s.fk_id
       AND s.fk_groupid = GET_STANDART_GROUPLAST
       AND sh.fk_standart = s.fk_id
       AND sh.fk_heal = hs.fk_heal
       AND hs.fk_smid = pSmid;
  END IF;

  IF v_cnt = 0 THEN
    v_res := 0;
  ELSE
    v_res := 1;
  END IF;
  RETURN v_res;
END;
/

SHOW ERRORS;


