DROP FUNCTION ASU.CLOB_REPLACE
/

--
-- CLOB_REPLACE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."CLOB_REPLACE" (CL CLOB, Str1 IN VarChar2, Str2 IN VarChar2) RETURN CLOB
IS
--------------------------------------
-- NEBARY (Create 02.11.2001)
-- То же самое что и REPLACE для VarChar2, но для CLOB
--------------------------------------

  sRes  CLOB;
  tCL   CLOB;
  amt   BINARY_INTEGER := 4000;
  amtt  BINARY_INTEGER;
  sTemp VARCHAR2(32767);
  nLen  Number;
  nCnt  Number;
BEGIN
  DBMS_LOB.CREATETEMPORARY(tCL, TRUE, DBMS_LOB.SESSION);
  DBMS_LOB.APPEND(tCL,CL);
  DBMS_LOB.CREATETEMPORARY(sRes, TRUE, DBMS_LOB.SESSION);
  FOR J IN 1..2 LOOP
    nLen:=DBMS_LOB.GETLENGTH(tCL);
    nCnt:=TRUNC(nLen/amt);
    IF nCnt<(nLen/amt) THEN
      nCnt:=nCnt+1;
    END IF;
    FOR I IN 1..nCnt LOOP
      IF I=nCnt THEN
        amtt:=nLen-(I-1)*amt;
        DBMS_LOB.READ(tCL, amtt, (I-1)*amt+1, sTemp);
      ELSE
        DBMS_LOB.READ(tCL, amt, (I-1)*amt+1, sTemp);
      END IF;
      sTemp:=REPLACE(sTemp, Str1, Str2);
      DBMS_LOB.WRITEAPPEND(sRes, LENGTH(sTemp), sTemp);
    END LOOP;
    IF J<>2 THEN
      amt:=amt+LENGTH(Str1);
      DBMS_LOB.FREETEMPORARY(tCL);
      DBMS_LOB.CREATETEMPORARY(tCL, TRUE, DBMS_LOB.SESSION);
      DBMS_LOB.APPEND(tCL, sRes);
      DBMS_LOB.FREETEMPORARY(sRes);
      DBMS_LOB.CREATETEMPORARY(sRes, TRUE, DBMS_LOB.SESSION);
    END IF;
  END LOOP;
  DBMS_LOB.FREETEMPORARY(tCL);
  RETURN sRes;
END;
/

SHOW ERRORS;


DROP SYNONYM STAT.CLOB_REPLACE
/

--
-- CLOB_REPLACE  (Synonym) 
--
--  Dependencies: 
--   CLOB_REPLACE (Function)
--
CREATE SYNONYM STAT.CLOB_REPLACE FOR ASU.CLOB_REPLACE
/


