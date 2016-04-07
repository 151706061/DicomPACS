DROP FUNCTION ASU.GET_MEDNAZ_IS_PROLONG
/

--
-- GET_MEDNAZ_IS_PROLONG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZMED (Table)
--   TFREQUENCY (Table)
--   TNAZMED_PROLONG (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_mednaz_is_prolong
-- Melnikov 27.02.2015
-- Функция возвращает результат, является ли назначение продлением
-- Возвращает -1 в случае когда для назначения не удается распознать статус
  ( aCurDate DATE,
    aNazmedID NUMBER
     )
  RETURN NUMBER DETERMINISTIC IS
res NUMBER;
  CURSOR c IS
  SELECT prolong
  FROM (SELECT  trunc(N.FD_BEGIN + (CASE WHEN N.fn_mnog > 1 THEN (LEVEL - 1) ELSE (LEVEL - 1) * (1 / N.fn_mnog) END),'mi') as FD_NAZ_DATE,0 prolong
          FROM (SELECT N.*, F.FN_MNOG FROM asu.tnazmed N, ASU.TFREQUENCY  F
                 WHERE N.FK_FREQUENCYID = F.fk_id
                   AND N.FK_ID = aNazmedID
                   AND F.FN_MNOG > 0) N
        CONNECT BY LEVEL-1 < N.Fn_Duration
        UNION ALL
        -- Продления
        SELECT  trunc(N.FD_BEGIN + (CASE WHEN N.fn_mnog > 1 THEN (LEVEL - 1) ELSE (LEVEL - 1) * (1 / N.fn_mnog) END),'mi') as FD_NAZ_DATE,fk_id prolong
          FROM (SELECT P.FD_BEGIN, P.FN_DURATION, F.FN_MNOG,p.fk_id FROM asu.tnazmed N, asu.tnazmed_prolong P, ASU.TFREQUENCY  F
                 WHERE N.FK_FREQUENCYID = F.fk_id
                   AND p.fk_nazmedid = N.FK_ID
                   AND N.FK_ID = aNazmedID
                   AND F.FN_MNOG > 0) N
        CONNECT BY LEVEL-1 < N.Fn_Duration)
   WHERE FD_NAZ_DATE = aCurDate;


BEGIN

  OPEN c;
  FETCH c INTO res;
  IF c%NOTFOUND THEN res := -1; END IF;
  CLOSE c;
  RETURN res;

END;
/

SHOW ERRORS;


