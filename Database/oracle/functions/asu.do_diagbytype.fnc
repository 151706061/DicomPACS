DROP FUNCTION ASU.DO_DIAGBYTYPE
/

--
-- DO_DIAGBYTYPE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   DO_DIAG (Function)
--
CREATE OR REPLACE FUNCTION ASU."DO_DIAGBYTYPE" (pacid IN NUMBER default null/*by TimurLan*/, ptype IN NUMBER, bMain IN NUMBER, pNazID IN NUMBER DEFAULT -1, pSHOWPRINT in number default 0)
  RETURN VARCHAR2
IS
  -- LastUpdated : 01.12.2003 by TimurLan
  CURSOR c1(pacid IN NUMBER, ptype IN NUMBER, bMain IN NUMBER, pNazID IN NUMBER DEFAULT -1, pSHOWPRINT in number default 0)
  IS
    SELECT fk_id, fl_first
      FROM tdiag
     WHERE fk_pacid = pacid
       AND fl_main = bMain
       AND fp_type = ptype
       AND FK_NAZID = pNazID
       AND FL_SHOWIB>=pSHOWPRINT;
  s        VARCHAR2(32767);
  diagid   NUMBER;
  cTemp    VARCHAR2(32767);
BEGIN
  FOR i IN c1(pacid, ptype, bMain, pNazID, pSHOWPRINT) LOOP
    cTemp := do_diag (i.fk_id);
    --s := s || ' ' || REPLACE (InitCap( SUBSTR (cTemp,1,INSTR (cTemp,' ')-1) ) || LOWER(SUBSTR (cTemp,INSTR (cTemp,' '),LENGTH(cTemp))), '..', '.'); test
    s := s || ' ' || REPLACE (cTemp, '..', '.');
    --s := s || ' ' || do_diag (i.fk_id);by TimurLan
    if i.fl_first=1 then
      s:=s||'<b> (вы€влен впервые) </b>';
    end if;
  END LOOP;
  RETURN s;
  --RETURN /*SUBSTR (*/REPLACE (s, '.', ',');/*, 1, LENGTH (s) - 1);*/--by TimurLan
END;
/

SHOW ERRORS;


DROP SYNONYM STAT.DO_DIAGBYTYPE
/

--
-- DO_DIAGBYTYPE  (Synonym) 
--
--  Dependencies: 
--   DO_DIAGBYTYPE (Function)
--
CREATE SYNONYM STAT.DO_DIAGBYTYPE FOR ASU.DO_DIAGBYTYPE
/


