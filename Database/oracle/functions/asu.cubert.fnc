DROP FUNCTION ASU.CUBERT
/

--
-- CUBERT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."CUBERT" (x NUMBER) RETURN NUMBER IS
--
-- Purpose: Вычисление кубического корня
-- Philip A. Milovanov 14.07.2002
-- mod by TimurLan 20/07/06
  pr NUMBER;
  bNegative BOOLEAN:=FALSE;
BEGIN
  if x = 0 then
    return 0;
  end if;
  if x is null then
    raise_application_error(-20001,'Нулевой аргумент функции. Вычисление кубического корня невозможно!');
    return null;
  end if;
  if x < 0 then
    bNegative := TRUE;
  end if;

  pr:=SQRT(ABS(x));
  LOOP
    EXIT WHEN abs(pr-x/(pr*pr))<=0.000000000000001;
    pr:=(2*pr+x/(pr*pr))/3;
  END LOOP;

  if bNegative then
    pr := -pr;
  end if;
  RETURN pr;
END;
/

SHOW ERRORS;


