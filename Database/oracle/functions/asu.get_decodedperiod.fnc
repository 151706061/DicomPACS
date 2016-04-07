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
      sres  := '������';
    ELSIF        TO_CHAR (d1, 'dd.mm') = '01.02'
             AND (    TO_CHAR (d2, 'dd.mm') = '29.02'
                  AND is_leapyear (TO_CHAR (d1, 'yyyy')) = 1)
          OR (    TO_CHAR (d2, 'dd.mm') = '28.02'
              AND is_leapyear (TO_CHAR (d1, 'yyyy')) = 0) THEN
      sres  := '�������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.03'
          AND TO_CHAR (d2, 'dd.mm') = '31.03' THEN
      sres  := '����';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.04'
          AND TO_CHAR (d2, 'dd.mm') = '30.04' THEN
      sres  := '������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.05'
          AND TO_CHAR (d2, 'dd.mm') = '31.05' THEN
      sres  := '���';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.06'
          AND TO_CHAR (d2, 'dd.mm') = '30.06' THEN
      sres  := '����';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.07'
          AND TO_CHAR (d2, 'dd.mm') = '31.07' THEN
      sres  := '����';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.08'
          AND TO_CHAR (d2, 'dd.mm') = '31.08' THEN
      sres  := '������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.09'
          AND TO_CHAR (d2, 'dd.mm') = '30.09' THEN
      sres  := '��������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.10'
          AND TO_CHAR (d2, 'dd.mm') = '31.10' THEN
      sres  := '�������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.11'
          AND TO_CHAR (d2, 'dd.mm') = '30.11' THEN
      sres  := '������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.12'
          AND TO_CHAR (d2, 'dd.mm') = '31.12' THEN
      sres  := '�������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.01'
          AND TO_CHAR (d2, 'dd.mm') = '31.03' THEN
      sres  := 'I �������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.04'
          AND TO_CHAR (d2, 'dd.mm') = '30.06' THEN
      sres  := 'II �������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.07'
          AND TO_CHAR (d2, 'dd.mm') = '30.09' THEN
      sres  := 'III �������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.10'
          AND TO_CHAR (d2, 'dd.mm') = '31.12' THEN
      sres  := 'IV �������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.01'
          AND TO_CHAR (d2, 'dd.mm') = '30.06' THEN
      sres  := 'I ���������';
    ELSIF     TO_CHAR (d1, 'dd.mm') = '01.07'
          AND TO_CHAR (d2, 'dd.mm') = '31.12' THEN
      sres  := 'II ���������';
    END IF;
  END IF;
  IF sRes IS NOT NULL or
  (TO_CHAR (d1, 'dd.mm') = '01.01'
          AND TO_CHAR (d2, 'dd.mm') = '31.12')
  THEN
    sRes  := ' �� ' || sRes || ' ' || TO_CHAR (d1, 'yyyy') || '�.';
  ELSE
    sRes  := ' � ' || TO_CHAR (d1, 'dd.mm.yyyy') || ' �� ' || TO_CHAR (d2, 'dd.mm.yyyy');
  END IF;
  RETURN sRes;
END;
/

SHOW ERRORS;


