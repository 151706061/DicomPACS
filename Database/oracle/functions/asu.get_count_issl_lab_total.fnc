DROP FUNCTION ASU.GET_COUNT_ISSL_LAB_TOTAL
/

--
-- GET_COUNT_ISSL_LAB_TOTAL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   GET_ED_FROM_SMID (Function)
--   GET_SYNID (Function)
--   GET_VIPNAZ (Function)
--   TEXPAN (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_ISSL_LAB_TOTAL" (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_SMID IN NUMBER)
  RETURN NUMBER IS
  CURSOR cOld IS
    SELECT SUM (FN_COUNT)
      FROM (SELECT SUM ( (FN_VCOUNT+1 ) * GET_ED_FROM_SMID (pFK_SMID)) FN_COUNT
              FROM (SELECT COUNT (FD_RUN) FN_VCOUNT, FD_RUN
                      FROM texpan,
                           (SELECT DISTINCT fk_id fk_vnazid, FD_RUN
                              FROM tnazan,
                                   (SELECT GET_VIPNAZ FK_NAZVIP
                                      FROM DUAL),
                                   (SELECT GET_SYNID ('RAZ_BIOHIM') FK_BIOHIMID
                                      FROM DUAL),
                                   (SELECT GET_SYNID ('ANAL_BIOHIM') FK_ANALBIOHIMID
                                      FROM DUAL)
                             WHERE fk_nazsosid = FK_NAZVIP
                               AND fk_razdid = FK_BIOHIMID
                               AND FK_SMID=FK_ANALBIOHIMID
                               AND fd_run BETWEEN pFD_DATA1 AND pFD_DATA2)
                     WHERE fk_nazid = fk_vnazid
                       AND FK_SMID = pFK_SMID
                     GROUP BY FD_RUN)
            UNION ALL
            SELECT SUM ( (FN_VCOUNT ) * GET_ED_FROM_SMID (pFK_SMID))
              FROM (SELECT COUNT (FD_RUN) FN_VCOUNT, FD_RUN
                      FROM tnazan,
                           (SELECT GET_VIPNAZ FK_NAZVIP
                              FROM DUAL),
                           (SELECT GET_SYNID ('RAZ_BIOHIM') FK_BIOHIMID
                              FROM DUAL),
                           (SELECT GET_SYNID ('ANAL_BIOHIM') FK_ANALBIOHIMID
                              FROM DUAL)
                     WHERE fk_nazsosid = FK_NAZVIP
                       AND fk_razdid = FK_BIOHIMID
                       AND FK_SMID <> FK_ANALBIOHIMID
                       AND FK_SMID = pFK_SMID
                       AND fd_run BETWEEN pFD_DATA1 AND pFD_DATA2
                     GROUP BY FD_RUN)
            UNION ALL
            SELECT SUM (FN_VCOUNT * GET_ED_FROM_SMID (pFK_SMID))
              FROM (SELECT COUNT (FK_SMID) FN_VCOUNT
                      FROM tnazan,
                           (SELECT GET_VIPNAZ FK_NAZVIP
                              FROM DUAL),
                           (SELECT GET_SYNID ('RAZ_BIOHIM') FK_BIOHIMID
                              FROM DUAL)
                     WHERE fk_nazsosid = FK_NAZVIP
                       AND fk_razdid <> FK_BIOHIMID
                       AND FK_SMID = pFK_SMID
                       AND fd_run BETWEEN pFD_DATA1 AND pFD_DATA2));

-- Purpose: Подсчет количества исследований по возрасту прошедших через лабораторию
-- за необходимый период, по необходимому исследованию
-- By Philip A. Milovanov
  I NUMBER;
BEGIN
  OPEN cOld ;
  FETCH cOld INTO i;
  CLOSE cOld;

  RETURN I;
END;-- Function GET_COUNT_LAB_PAC_AGE
/

SHOW ERRORS;


