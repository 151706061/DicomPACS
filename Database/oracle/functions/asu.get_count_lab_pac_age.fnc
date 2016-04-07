DROP FUNCTION ASU.GET_COUNT_LAB_PAC_AGE
/

--
-- GET_COUNT_LAB_PAC_AGE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TRESAN (Table)
--   PKG_SMINI (Package)
--   GET_PATALOGY_LEVEL (Function)
--   GET_VIPNAZ (Function)
--   GET_AGE_DATE (Function)
--   TEXPAN (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_LAB_PAC_AGE" (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_SMID IN NUMBER, pFL_GREATER IN NUMBER)
  RETURN NUMBER IS
  CURSOR cOld (pVozr NUMBER) IS
    SELECT COUNT (*)
      FROM (SELECT DISTINCT TNAZAN.FK_ID
              FROM TNAZAN
             WHERE FK_NAZSOSID = GET_VIPNAZ
               AND FD_RUN BETWEEN pFD_DATA1 AND pFD_DATA2
               AND GET_AGE_DATE (FK_PACID,FD_RUN) >= pVozr
               AND TNAZAN.FK_SMID = pFK_SMID
            UNION ALL
            SELECT DISTINCT TNAZAN.FK_ID
              FROM TNAZAN, TEXPAN
             WHERE FK_NAZSOSID = GET_VIPNAZ
               AND FD_RUN BETWEEN pFD_DATA1 AND pFD_DATA2
               AND GET_AGE_DATE (FK_PACID,FD_RUN) >= pVozr
               AND TEXPAN.FK_SMID = pFK_SMID
               AND TEXPAN.FK_NAZID = TNAZAN.FK_ID);
  CURSOR cChild (pVozr NUMBER) IS
    SELECT COUNT (*)
      FROM (SELECT DISTINCT TNAZAN.FK_ID
              FROM TNAZAN
             WHERE FK_NAZSOSID = GET_VIPNAZ
               AND FD_RUN BETWEEN pFD_DATA1 AND pFD_DATA2
               AND GET_AGE_DATE (FK_PACID,FD_RUN) < pVozr
               AND TNAZAN.FK_SMID = pFK_SMID
            UNION ALL
            SELECT DISTINCT TNAZAN.FK_ID
              FROM TNAZAN, TEXPAN
             WHERE FK_NAZSOSID = GET_VIPNAZ
               AND FD_RUN BETWEEN pFD_DATA1 AND pFD_DATA2
               AND GET_AGE_DATE (FK_PACID,FD_RUN) < pVozr
               AND TEXPAN.FK_SMID = pFK_SMID
               AND TEXPAN.FK_NAZID = TNAZAN.FK_ID);
  CURSOR cPatology IS
    SELECT COUNT (*)
      FROM (SELECT DISTINCT TNAZAN.FK_ID
              FROM TNAZAN, TRESAN
             WHERE FK_NAZSOSID = GET_VIPNAZ
               AND FD_RUN BETWEEN pFD_DATA1 AND pFD_DATA2
               AND TNAZAN.FK_SMID = pFK_SMID
               AND TRESAN.FK_NAZID = TNAZAN.FK_ID
               AND TRESAN.FL_ZAKL = 1
               AND GET_PATALOGY_LEVEL (FK_PATID) > 0
            UNION ALL
            SELECT DISTINCT TNAZAN.FK_ID
              FROM TNAZAN, TEXPAN, TRESAN
             WHERE FK_NAZSOSID = GET_VIPNAZ
               AND FD_RUN BETWEEN pFD_DATA1 AND pFD_DATA2
               AND TEXPAN.FK_SMID = pFK_SMID
               AND TEXPAN.FK_NAZID = TNAZAN.FK_ID
               AND TRESAN.FK_NAZID = TNAZAN.FK_ID
               AND TRESAN.FL_ZAKL = 1
               AND GET_PATALOGY_LEVEL (FK_PATID) > 0);
-- Purpose: Подсчет количества пациентов по возрасту прошедших через лабораторию
-- за необходимый период, по необходимому исследованию
-- By Philip A. Milovanov
  I NUMBER;
BEGIN
  IF pFL_GREATER = 1 THEN
    OPEN cOld (PKG_SMINI.READSTRING ('CONFIG', 'CHILDRENS', 16));
    FETCH cOld INTO i;
    CLOSE cOld;
  ELSIF pFL_GREATER=0 THEN
    OPEN cChild (PKG_SMINI.READSTRING ('CONFIG', 'CHILDRENS', 16));
    FETCH cChild INTO i;
    CLOSE cChild;
  ELSE
    OPEN cPatology ;
    FETCH cPatology INTO i;
    CLOSE cPatology;
  END IF;
  RETURN I;
END;                                                                                                                                                                   -- Function GET_COUNT_LAB_PAC_AGE
/

SHOW ERRORS;


