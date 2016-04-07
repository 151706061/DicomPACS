DROP FUNCTION ASU.GET_OPEROSLOG
/

--
-- GET_OPEROSLOG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_SMIDNAME (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_OPEROSLOG" (pPacid IN NUMBER) RETURN VARCHAR2 IS
 -- Created 20070503 by Linnikov
 -- ¬озвращает осложнени€ операции в одну строку
 sTmp VARCHAR2(4000);
BEGIN
 FOR C IN (SELECT decode(FC_NAME, '', '', FC_NAME || ';') FC_NAME
             FROM (SELECT ASU.GET_SMIDNAME(FK_SMID) FC_NAME
                     FROM TIB
                    WHERE FK_SMEDITID =
                          (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'OSLOG_OPER')
                      AND FK_PACID = pPacid)) LOOP
  sTmp := TRIM(sTmp) || ' ' || C.FC_NAME;
 END LOOP;
 sTmp := SUBSTR(sTmp, 1, LENGTH(sTmp) - 1);
 RETURN sTmp;
END;
/

SHOW ERRORS;


