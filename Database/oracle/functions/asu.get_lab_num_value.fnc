DROP FUNCTION ASU.GET_LAB_NUM_VALUE
/

--
-- GET_LAB_NUM_VALUE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAB_NUM_VALUE" (pFK_NAZID IN NUMBER, pFK_SMID IN NUMBER)
  RETURN NUMBER IS
--
-- Purpose: –асчет значени€ типа NUMBER дл€ лаборатории по формуле.
--
  CURSOR c (pSMID NUMBER) IS
    SELECT FC_ANSWER
      FROM TSMID
     WHERE FK_ID = pSMID;

  strF VARCHAR2 (254);
  strCalc VARCHAR2(4000);
  strCalcTemp VARCHAR2(4000);
  bOpen BOOLEAN:=FALSE;
  nValue NUMBER;
BEGIN
  BEGIN
    OPEN c (pFK_SMID);
    FETCH c INTO strF;
    CLOSE c;
    IF TRIM(strF) IS NULL THEN
      RETURN 0;
    END IF;
    strCalc:='SELECT ';
    FOR i IN 1..LENGTH(strF) LOOP
      IF SUBSTR(strF,i,1)='>' THEN
        bOpen:=FALSE;
        strCalc:=strCalc||')';
        strCalcTemp:=strCalcTemp||')';
        nValue:=NULL;
        EXECUTE IMMEDIATE 'SELECT '||strCalcTemp||' FROM DUAL' INTO nValue;
        IF nValue IS NULL THEN
          RETURN 0;
        END IF;

      ELSIF SUBSTR(strF,i,1)='<' THEN
        bOpen:=TRUE;
        strCalc:=strCalc||' GET_NUM_FROM_RESAN('||pFK_NAZID||',';
        strCalcTemp:='GET_NUM_FROM_RESAN('||pFK_NAZID||',';
      ELSE
        strCalc:=strCalc||SUBSTR(strF,i,1);
        IF bOpen THEN
          strCalcTemp:=strCalcTemp||SUBSTR(strF,i,1);
        END IF;
      END IF;
    END LOOP;
    strCalc:=strCalc||' FROM DUAL';
    EXECUTE IMMEDIATE strCalc INTO nValue;
    RETURN nValue;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 0;
  END;
END;-- Function GET_LAB_NUM_VALUE
/

SHOW ERRORS;


