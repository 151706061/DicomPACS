DROP FUNCTION ASU.DO_CHECK_FORMULA
/

--
-- DO_CHECK_FORMULA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."DO_CHECK_FORMULA" ( pFC_FORMULA IN VARCHAR2)
  RETURN NUMBER IS
--
-- Purpose: –асчет значени€ типа NUMBER дл€ лаборатории по формуле.
--
  strF VARCHAR2 (254);
  strCalc VARCHAR2(4000);
  bOpen BOOLEAN:=FALSE;
  nValue NUMBER;
  pFK_NAZID NUMBER:=-1;
BEGIN
  BEGIN
    strF:=pFC_FORMULA;
    IF TRIM(strF) IS NULL THEN
      RETURN 1;
    END IF;
    strCalc:='SELECT ';
    FOR i IN 1..LENGTH(strF) LOOP
      IF SUBSTR(strF,i,1)='>' THEN
        bOpen:=FALSE;
        strCalc:=strCalc||')';

      ELSIF SUBSTR(strF,i,1)='<' THEN
        bOpen:=TRUE;
        strCalc:=strCalc||' GET_NUM_FROM_RESAN('||pFK_NAZID||',';
      ELSE
        strCalc:=strCalc||SUBSTR(strF,i,1);
      END IF;
    END LOOP;
    strCalc:=strCalc||' FROM DUAL';
    EXECUTE IMMEDIATE strCalc INTO nValue;
    RETURN 1;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 0;
  END;
END;-- Function GET_LAB_NUM_VALUE
/

SHOW ERRORS;


