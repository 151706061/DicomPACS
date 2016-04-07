DROP FUNCTION ASU.GET_DECODEDPERIOD
/

--
-- GET_DECODEDPERIOD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   IS_LEAPYEAR (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_DECODEDPERIOD" (pd1 IN DATE, pd2 IN DATE)
  RETURN VARCHAR2
IS
  sRes   VARCHAR2 (200);
  d1     DATE;
  d2     DATE;
BEGIN
  d1  := TRUNC (pd1);
  d2  := TRUNC (pd2);
  IF TO_CHAR (d1, 'yyyy') = TO_CHAR (d2, 'yyyy') THEN
    IF     TO_CHAR (d1, 'dd.mm') = '01.01'
       AND TO_CHAR (d2, 'dd.mm') = '31.01' THEN
      sres  := '€нварь';
    ELSIF        TO_CHAR (d1, 'dd.mm') = '01.02'
             AND (    TO_CHAR (d2, 'dd.mm') = '29.02'
                  AND is_leapyear (TO_CHAR (d1, 'yyyy')) = 1)
          OR (    TO_CHAR (d2, 'dd.mm') = '28.02'
              AND is_leapyear (TO_CHAR (d1, 'yyyy')) = 0) THEN
      sres  := 'февраль';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.03'
          AND TO_CHAR (d2, 'dd.mm') = '31.03' THEN
      sres  := 'март';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.04'
          AND TO_CHAR (d2, 'dd.mm') = '30.04' THEN
      sres  := 'апрель';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.05'
          AND TO_CHAR (d2, 'dd.mm') = '31.05' THEN
      sres  := 'май';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.06'
          AND TO_CHAR (d2, 'dd.mm') = '30.06' THEN
      sres  := 'июнь';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.07'
          AND TO_CHAR (d2, 'dd.mm') = '31.07' THEN
      sres  := 'июль';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.08'
          AND TO_CHAR (d2, 'dd.mm') = '31.08' THEN
      sres  := 'август';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.09'
          AND TO_CHAR (d2, 'dd.mm') = '30.09' THEN
      sres  := 'сент€брь';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.10'
          AND TO_CHAR (d2, 'dd.mm') = '31.10' THEN
      sres  := 'окт€брь';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.11'
          AND TO_CHAR (d2, 'dd.mm') = '30.11' THEN
      sres  := 'но€брь';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.12'
          AND TO_CHAR (d2, 'dd.mm') = '31.12' THEN
      sres  := 'декабрь';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.01'
          AND TO_CHAR (d2, 'dd.mm') = '31.03' THEN
      sres  := 'I квартал';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.04'
          AND TO_CHAR (d2, 'dd.mm') = '30.06' THEN
      sres  := 'II квартал';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.07'
          AND TO_CHAR (d2, 'dd.mm') = '30.09' THEN
      sres  := 'III квартал';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.10'
          AND TO_CHAR (d2, 'dd.mm') = '31.12' THEN
      sres  := 'IV квартал';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.01'
          AND TO_CHAR (d2, 'dd.mm') = '30.06' THEN
      sres  := 'I полугодие';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.07'
          AND TO_CHAR (d2, 'dd.mm') = '31.12' THEN
      sres  := 'II полугодие';
    END IF;
  END IF;
  IF sRes IS NOT NULL or
  (TO_CHAR (d1, 'dd.mm') = '01.01'
          AND TO_CHAR (d2, 'dd.mm') = '31.12')
  THEN
    sRes  := ' за ' || sRes || ' ' || TO_CHAR (d1, 'yyyy') || 'г.';
  ELSE
    sRes  := ' с ' || TO_CHAR (d1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (d2, 'dd.mm.yyyy');
  END IF;
  RETURN sRes;
END;
/

SHOW ERRORS;


