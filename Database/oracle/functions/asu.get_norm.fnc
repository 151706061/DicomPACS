DROP FUNCTION ASU.GET_NORM
/

--
-- GET_NORM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TAMBULANCE (Table)
--   TSMID (Table)
--   TSMIDNORMS (Table)
--   PKG_REGIST_PACFUNC (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NORM"(pFK_SMID IN NUMBER, pFK_PACID NUMBER, pFD_DATE IN DATE := SYSDATE, pNazID IN NUMBER := -1)
  RETURN   VARCHAR2 IS
  str Varchar2(100);
    cursor cdate is
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

  CURSOR cW IS SELECT FN_LOW_W,FN_HI_W FROM TSMID WHERE FK_ID=pFK_SMID;
  CURSOR cM IS SELECT FN_LOW_M,FN_HI_M FROM TSMID WHERE FK_ID=pFK_SMID;

  CURSOR cIsSubNorm (pFK_SMID NUMBER) IS
    SELECT FK_ID FROM TSMIDNORMS WHERE FK_SMID=pFK_SMID;

  CURSOR cSubNormW (pFK_SMID NUMBER,pFN_Y NUMBER,pFN_M NUMBER, pFN_D NUMBER, pPhase NUMBER, pTrimestr NUMBER) IS
    SELECT FN_LOW_W, FN_HI_W, FN_ONE_RES_W, FN_LOW_EQ, FN_HI_EQ
      FROM asu.TSMIDNORMS
     WHERE FK_SMID = pFK_SMID AND pFN_Y * 365 + pFN_M * 31 + pFN_D  BETWEEN FN_YEAR1 * 365 + FN_MOUNTH_1 * 31 + FN_DAY_1 AND FN_YEAR2 * 365 + FN_MOUNTH_2 * 31 + FN_DAY_2
          /* and (case when ((pPhase = -1) or (pPhase = 0)) and (PHASE_ENTIRE + PHASE_FOLLICULAR + PHASE_MIDLCYCLE + PHASE_LUTEAL) = 0 then 1
                     when pPhase = 1 and PHASE_ENTIRE = 1 then 1
                     when pPhase = 2 and PHASE_FOLLICULAR = 1 then 1
                     when pPhase = 3 and PHASE_MIDLCYCLE = 1 then 1
                     when pPhase = 4 and PHASE_LUTEAL = 1 then 1
                     else 0 END) = 1
           and (case when ((pTrimestr = -1) or (pTrimestr = 0)) and  (TRIMESRT1 + TRIMESRT2 + TRIMESRT3) = 0 then 1
                     when pTrimestr = 1 and TRIMESRT1 = 1 then 1
                     when pTrimestr = 2 and TRIMESRT2 = 1 then 1
                     when pTrimestr = 3 and TRIMESRT3 = 1 then 1
                     else 0 END) = 1*/;


  CURSOR cSubNormM (pFK_SMID NUMBER,pFN_Y NUMBER,pFN_M NUMBER, pFN_D NUMBER) IS
    SELECT FN_LOW_M, FN_HI_M, FN_ONE_RES_M, FL_LOW_M_EQ, FN_HI_M_EQ
      FROM TSMIDNORMS
     WHERE FK_SMID = pFK_SMID AND pFN_Y * 365 + pFN_M * 31 + pFN_D  BETWEEN FN_YEAR1 * 365 + FN_MOUNTH_1 * 31 + FN_DAY_1 AND FN_YEAR2 * 365 + FN_MOUNTH_2 * 31 + FN_DAY_2;
  CURSOR cPhase IS SELECT NVL(max(FN_NUM), -1) FN_NUM, NVL(TO_NUMBER(max(FC_CHAR)), -1) FN_CHAR FROM ASU.TIB WHERE FK_PACID = pNazID AND FK_SMID = pFK_SMID;

  nL NUMBER;
  nH NUMBER;

  nEq NUMBER;
  nLE NUMBER;
  nHE NUMBER;

  i  NUMBER;
  nY NUMBER;
  nM NUMBER;
  nD NUMBER;
  pFK_SEX NUMBER;
  strTmp VARCHAR2(100);
  strTmp2 VARCHAR2(100);
  nPhase NUMBER;
  nTrimestr NUMBER;
BEGIN
  pFK_SEX :=  PKG_REGIST_PACFUNC.GET_PAC_SEXID(pFK_PACID);
  OPEN cdate;
  Fetch cdate INTO  nY, nM, nD;
   Close cdate;

  OPEN cPhase;
  Fetch cPhase INTO  nPhase, nTrimestr;
  Close cPhase;

  OPEN cIsSubNorm(pFK_SMID);
  FETCH cIsSubNorm INTO i;
  IF cIsSubNorm%NOTFOUND THEN
    IF pFK_SEX = 1 THEN
      OPEN cM;
      FETCH cM INTO nL,nH;
      CLOSE cM;
    ELSIF pFK_SEX=0 THEN
      OPEN cW;
      FETCH cW INTO nL,nH;
      CLOSE cW;
    ELSE
      RETURN '';
    END IF;
  ELSE
    IF pFK_SEX=1 THEN
      OPEN cSubNormM (pFK_SMID,nY, nM, nD);
      FETCH cSubNormM INTO nL,nH, nEQ, nLE, nHE;
      IF cSubNormM%NOTFOUND THEN
        OPEN cM;
        FETCH cM INTO nL,nH;
        CLOSE cM;
      END IF;
      CLOSE cSubNormM;
    ELSIF pFK_SEX=0 THEN
 --     raise_application_error(-20000, '!!!');
      OPEN cSubNormW (pFK_SMID,nY, nM, nD, nPhase,nTrimestr);
      FETCH cSubNormW INTO nL,nH, nEQ, nLE, nHE;
      IF cSubNormW%NOTFOUND THEN
        OPEN cW;
        FETCH cW INTO nL,nH;
        CLOSE cW;
      END IF;
      CLOSE cSubNormW;
    ELSE
      RETURN '';
    END IF;
  END IF;
  CLOSE cIsSubNorm;
  IF nL IS NULL AND nH IS NULL AND nEQ IS NULL THEN
    str:='';
  ELSIF nEQ IS NOT NULL THEN
    SELECT ' = '||to_char(nEQ,'FM99999999990.0999999') INTO str FROM DUAL;
  ELSIF nL IS NULL AND nH IS NOT NULL THEN
    IF nHE = 1 then
        SELECT ' <= '||to_char(nH,'FM99999999990.0999999') INTO str FROM DUAL;
     else
        SELECT ' < '||to_char(nH,'FM99999999990.0999999') INTO str FROM DUAL;
    END IF;
  ELSIF nH IS NULL AND nL IS NOT NULL THEN
    IF nLE = 1 then
       SELECT to_char(nL,'FM99999999990.0999999')||' >= ' INTO str FROM DUAL;
     else
       SELECT to_char(nL,'FM99999999990.0999999')||' > ' INTO str FROM DUAL;
    END IF;
  ELSIF nH IS NOT NULL AND nL IS NOT NULL THEN
    SELECT to_char(nL,'FM99999999990.0999999')|| ' - 'INTO strTmp FROM DUAL;
    SELECT to_char(nH,'FM99999999990.0999999') INTO strTmp2 FROM DUAL;
   /* IF nLE = 1 then--Melnikov 2013.12.06 #29261 by Kovaleva
        SELECT to_char(nL,'FM99999999990.0999999')|| ' <= n 'INTO strTmp FROM DUAL;
     ELSE
        SELECT to_char(nL,'FM99999999990.0999999')||' < n ' INTO strTmp FROM DUAL;
    END IF;

    IF nHE = 1 then
        SELECT '<= ' || to_char(nH,'FM99999999990.0999999') INTO strTmp2 FROM DUAL;
     ELSE
        SELECT '< ' || to_char(nH,'FM99999999990.0999999') INTO strTmp2 FROM DUAL;
    END IF;*/

   str := strTmp || strTmp2;
  END IF;

  if str='-' then
    str:='';
  end if;
  RETURN  str;
END;
/

SHOW ERRORS;


