DROP FUNCTION ASU.DO_MKBBYTYPE
/

--
-- DO_MKBBYTYPE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   DO_MKB (Function)
--
CREATE OR REPLACE FUNCTION ASU."DO_MKBBYTYPE" (pacid IN NUMBER, ptype IN NUMBER, bMain IN NUMBER, pNazID IN NUMBER DEFAULT -1, pSHOWPRINT in number default 0)
  RETURN VARCHAR2-- Created by TimurLan 4 Ugorsk's rRegedit.smr
IS
  CURSOR c1(pacid IN NUMBER, ptype IN NUMBER, bMain IN NUMBER, pNazID IN NUMBER DEFAULT -1, pSHOWPRINT in number default 0)
  IS
    SELECT /*+ rule*/fk_id
      FROM tdiag
     WHERE fk_pacid = pacid
       AND fl_main = bMain
       AND fp_type = ptype/*
       AND FK_NAZID = pNazID
       AND FL_SHOWIB>=pSHOWPRINT*/;
  s        VARCHAR2(4000);
  diagid   NUMBER;
BEGIN
  s := '';
  FOR i IN c1(pacid, ptype, bMain, pNazID, pSHOWPRINT)
  LOOP
    s := do_mkb (i.fk_id);
  END LOOP;
  RETURN s;
END;
/

SHOW ERRORS;


