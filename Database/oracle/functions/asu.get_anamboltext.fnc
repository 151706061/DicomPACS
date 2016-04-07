DROP FUNCTION ASU.GET_ANAMBOLTEXT
/

--
-- GET_ANAMBOLTEXT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TANAMBOL (Table)
--   TCLOBS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_ANAMBOLTEXT" (pFK_PACID IN NUMBER)
  RETURN CLOB
IS
-- Собянин Александр Александрович
-- получение текста клоба анамнеза болезни, если его нет то возвращается НУЛЛ
  CURSOR c
  IS
    SELECT fc_clob
      FROM tclobs, tanambol
     WHERE tclobs.fk_id = tanambol.fk_clobid
       AND fk_pacid = pFK_PACID;

  cl   CLOB;
BEGIN
  DBMS_LOB.CREATETEMPORARY (cl, TRUE, 2);
  FOR i IN c LOOP
    cl  := i.fc_clob;
  END LOOP i;
  RETURN cl;
END;                                                                                                                                                     -- Function GET_ANAMBOLTEXT
/

SHOW ERRORS;


