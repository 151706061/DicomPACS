DROP FUNCTION ASU.GET_DECODE_ANAL
/

--
-- GET_DECODE_ANAL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   TEXPAN (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_DECODE_ANAL" 
  ( pFK_NAZID IN NUMBER)
  RETURN  VARCHAR2 IS
--
-- Purpose: Decode labore analizis
--
-- Philip A. Milovanov 20.06.2002
-- ---------   ------  -------------------------------------------
  CURSOR c(ppFK_NAZID NUMBER) IS SELECT FC_NAME FROM TSMID,TEXPAN WHERE TEXPAN.fk_nazid=ppFK_NAZID AND TEXPAN.fk_smid=TSMID.fk_id AND FL_SHOWANAL=2;
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


