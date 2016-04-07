DROP FUNCTION ASU.GET_ANAL_TEST
/

--
-- GET_ANAL_TEST  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   TEXPAN (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_ANAL_TEST
  ( pFK_NAZID IN NUMBER)
  RETURN  VARCHAR2 IS
--
-- Перечень тестов по анализу
-- ---------   ------  -------------------------------------------
  CURSOR c(ppFK_NAZID NUMBER) IS SELECT ts.FC_NAME
         FROM asu.texpan tea LEFT JOIN asu.tsmid ts
         ON tea.fk_smid = ts.fk_id
         WHERE tea.fk_nazid = ppFK_NAZID AND ts.fk_id IS NOT NULL
         ORDER BY ts.FC_NAME;

  str VARCHAR2(32767);
BEGIN
  FOR p IN C(pFK_NAZID) LOOP
    IF str IS NULL THEN
      str:=str||p.FC_NAME;
    ELSE
      str:=str||', '||p.FC_NAME;
    END IF;
  END LOOP;
  RETURN str;
END;
/

SHOW ERRORS;


