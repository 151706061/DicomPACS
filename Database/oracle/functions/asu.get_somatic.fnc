DROP FUNCTION ASU.GET_SOMATIC
/

--
-- GET_SOMATIC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TAMBULANCE (Table)
--   TSMID (Table)
--   TBODY_PARAM (Table)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SOMATIC" (pNazid IN NUMBER) RETURN VARCHAR2 IS
 -- Created 20070330 by Linnikov
 -- Результат = соматичность; гармоничность

 -- Значение TIB по синониму
 CURSOR cGET_PAR(pSmidSyn IN VARCHAR2) IS
  SELECT MAX(I.FN_NUM) FN_NUM
    FROM TIB I
   WHERE I.FK_PACID = pNazid
     AND I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = pSmidSyn);
 -- Строка в таблице коридоров
 CURSOR cGET_ROW(nMonth IN NUMBER, vSyn IN VARCHAR2) IS
  SELECT MAX(FK_ID) FK_ID
    FROM TBODY_PARAM
   WHERE FN_AGE =
         (SELECT MIN(AGE)
            FROM ((SELECT MIN(FN_AGE) AGE
                     FROM TBODY_PARAM P
                    WHERE P.FN_AGE >= nMonth
                      AND FC_DIRECTORY = vSyn) UNION ALL
                  (SELECT MAX(FN_AGE) AGE FROM TBODY_PARAM P WHERE P.FC_DIRECTORY = vSyn)))
     AND FC_DIRECTORY = vSyn;
 -- Значение коридора
 CURSOR cGET_VAL(nROW_ID IN NUMBER, nVal IN NUMBER) IS
  SELECT NVL(MAX(KOR), 7) KOR
    FROM (SELECT P.FN_3 VAL, 1 KOR
            FROM TBODY_PARAM P
           WHERE P.FK_ID = nROW_ID
          UNION ALL
          SELECT P.FN_10 VAL, 2 KOR
            FROM TBODY_PARAM P
           WHERE P.FK_ID = nROW_ID
          UNION ALL
          SELECT P.FN_25 VAL, 3 KOR
            FROM TBODY_PARAM P
           WHERE P.FK_ID = nROW_ID
          UNION ALL
          SELECT P.FN_75 VAL, 4 KOR
            FROM TBODY_PARAM P
           WHERE P.FK_ID = nROW_ID
          UNION ALL
          SELECT P.FN_90 VAL, 5 KOR
            FROM TBODY_PARAM P
           WHERE P.FK_ID = nROW_ID
          UNION ALL
          SELECT P.FN_97 VAL, 6 KOR FROM TBODY_PARAM P WHERE P.FK_ID = nROW_ID)
   WHERE VAL = (SELECT MIN(VAL) VAL
                  FROM ((SELECT MIN(VAL) VAL
                           FROM (SELECT P.FN_3 VAL
                                   FROM TBODY_PARAM P
                                  WHERE P.FK_ID = nROW_ID
                                 UNION ALL
                                 SELECT P.FN_10 VAL
                                   FROM TBODY_PARAM P
                                  WHERE P.FK_ID = nROW_ID
                                 UNION ALL
                                 SELECT P.FN_25 VAL
                                   FROM TBODY_PARAM P
                                  WHERE P.FK_ID = nROW_ID
                                 UNION ALL
                                 SELECT P.FN_75 VAL
                                   FROM TBODY_PARAM P
                                  WHERE P.FK_ID = nROW_ID
                                 UNION ALL
                                 SELECT P.FN_90 VAL
                                   FROM TBODY_PARAM P
                                  WHERE P.FK_ID = nROW_ID
                                 UNION ALL
                                 SELECT P.FN_97 VAL FROM TBODY_PARAM P WHERE P.FK_ID = nROW_ID)
                          WHERE VAL >= nVal) /*UNION ALL
                                (SELECT MAX(VAL) VAL
                                   FROM (SELECT P.FN_3 VAL
                                           FROM TBODY_PARAM P
                                          WHERE P.FK_ID = nROW_ID
                                         UNION ALL
                                         SELECT P.FN_10 VAL
                                           FROM TBODY_PARAM P
                                          WHERE P.FK_ID = nROW_ID
                                         UNION ALL
                                         SELECT P.FN_25 VAL
                                           FROM TBODY_PARAM P
                                          WHERE P.FK_ID = nROW_ID
                                         UNION ALL
                                         SELECT P.FN_75 VAL
                                           FROM TBODY_PARAM P
                                          WHERE P.FK_ID = nROW_ID
                                         UNION ALL
                                         SELECT P.FN_90 VAL
                                           FROM TBODY_PARAM P
                                          WHERE P.FK_ID = nROW_ID
                                         UNION ALL
                                         SELECT P.FN_97 VAL FROM TBODY_PARAM P WHERE P.FK_ID = nROW_ID))*/
                       ));

 nPacid  NUMBER;
 nMass   NUMBER;
 nHeight NUMBER;
 nBreast NUMBER;
 vSex    VARCHAR2(5);
 nMonth  NUMBER;
 vPref   VARCHAR2(12) := 'TBODY';

BEGIN
 -- Определяем код пациента
 SELECT MAX(N.FK_PACID) INTO nPacid FROM VNAZ N WHERE N.FK_ID = pNazid;
 -- Определяем пол и возраст
 SELECT NVL(MAX(S), 'GAY'), NVL(MAX(M), 0)
   INTO vSex, nMonth
   FROM (SELECT DECODE(K.FP_SEX, 0, 'GIRL', 'BOY') S, MONTHS_BETWEEN(SYSDATE, K.FD_ROJD) M
           FROM TKARTA K
          WHERE K.FK_ID = nPacid
         UNION ALL
         SELECT DECODE(A.FP_SEX, 0, 'GIRL', 'BOY') S, MONTHS_BETWEEN(SYSDATE, A.FD_ROJD) M
           FROM TAMBULANCE A
          WHERE A.FK_ID = nPacid);
 -- Проверка
 IF vSex = 'GAY' THEN
  RETURN('Пол неопределен');
 END IF;
 -- Масса
 FOR C1 IN cGET_PAR('ROD_VES') LOOP
  FOR C2 IN cGET_ROW(nMonth, vPref || 'WEIGHT_' || vSex) LOOP
   FOR C3 IN cGET_VAL(C2.FK_ID, C1.FN_NUM) LOOP
    nMass := C3.KOR;
   END LOOP;
  END LOOP;
 END LOOP;
 -- Рост
 FOR C1 IN cGET_PAR('ROD_ROST') LOOP
  FOR C2 IN cGET_ROW(nMonth, vPref || 'LONG_' || vSex) LOOP
   FOR C3 IN cGET_VAL(C2.FK_ID, C1.FN_NUM) LOOP
    nHeight := C3.KOR;
   END LOOP;
  END LOOP;
 END LOOP;
 -- Окружность груди
 FOR C1 IN cGET_PAR('OKR_GRUDI') LOOP
  FOR C2 IN cGET_ROW(nMonth, vPref || 'ROUND_' || vSex) LOOP
   FOR C3 IN cGET_VAL(C2.FK_ID, C1.FN_NUM) LOOP
    nBreast := C3.KOR;
   END LOOP;
  END LOOP;
 END LOOP;

 RETURN(TO_CHAR(NVL(nMass + nHeight + nBreast, 0)) || '; ' ||
        TO_CHAR(NVL(GREATEST(nMass, nHeight, nBreast) - LEAST(nMass, nHeight, nBreast), 0)));
END;
/

SHOW ERRORS;


