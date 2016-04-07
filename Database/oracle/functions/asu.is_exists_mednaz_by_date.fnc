DROP FUNCTION ASU.IS_EXISTS_MEDNAZ_BY_DATE
/

--
-- IS_EXISTS_MEDNAZ_BY_DATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZMED (Table)
--   TFREQUENCY (Table)
--   TNAZMED_PROLONG (Table)
--
CREATE OR REPLACE FUNCTION ASU.IS_EXISTS_MEDNAZ_BY_DATE( pFK_ID IN NUMBER,pFD_DATE IN DATE)
  RETURN  NUMBER IS
  res   NUMBER;
  CURSOR c1
  IS
    SELECT nvl(MAX(1),0) nCnt
      FROM (
    SELECT  N.FN_DURATION,trunc(N.FD_BEGIN + (CASE WHEN N.fn_mnog > 1 THEN (LEVEL - 1) ELSE (LEVEL - 1) * (1 / N.fn_mnog) END),'mi') as FD_NAZ_DATE
      FROM (SELECT N.*, F.FN_MNOG FROM asu.tnazmed N, ASU.TFREQUENCY  F
             WHERE N.FK_FREQUENCYID = F.fk_id
               AND N.FK_ID = pFK_ID
               AND F.FN_MNOG > 0) N
    CONNECT BY LEVEL-1 < N.Fn_Duration

    UNION
    -- Продления
    SELECT  N.FN_DURATION,trunc(N.FD_BEGIN + (CASE WHEN N.fn_mnog > 1 THEN (LEVEL - 1) ELSE (LEVEL - 1) * (1 / N.fn_mnog) END),'mi') as FD_NAZ_DATE
      FROM (SELECT P.FD_BEGIN, P.FN_DURATION, F.FN_MNOG FROM asu.tnazmed N, asu.tnazmed_prolong P, ASU.TFREQUENCY  F
             WHERE N.FK_FREQUENCYID = F.fk_id
               AND p.fk_nazmedid = N.FK_ID
               AND N.FK_ID = pFK_ID
               AND F.FN_MNOG > 0) N
    CONNECT BY LEVEL-1 < N.Fn_Duration
    ) T
    WHERE TRUNC(FD_NAZ_DATE) = trunc(pFD_DATE);
BEGIN
  OPEN c1;
  FETCH c1 INTO res;
  CLOSE c1;
  RETURN res;
END;
/

SHOW ERRORS;


