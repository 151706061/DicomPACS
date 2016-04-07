DROP FUNCTION ASU.GET_SMIDTYPE
/

--
-- GET_SMIDTYPE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_ISSLEDID (Function)
--   GET_KONSID (Function)
--   GET_PROCID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_SMIDTYPE" (pSMID IN NUMBER) RETURN VARCHAR2 IS
  CURSOR cLvl IS SELECT MAX(LEVEL) FROM tsmid
         START WITH fk_id=pSMID
         CONNECT BY PRIOR fk_owner=fk_id;
  CURSOR cWhat(Lvl NUMBER) IS SELECT fk_id FROM tsmid
         WHERE LEVEL=Lvl
         START WITH fk_id=pSMID
         CONNECT BY PRIOR fk_owner=fk_id;
  nTmp NUMBER;
  sRes VARCHAR2(4);
BEGIN
  OPEN cLvl; FETCH cLvl INTO nTmp; CLOSE cLvl;
  OPEN cWhat(nTmp); FETCH cWhat INTO nTmp; CLOSE cWhat;
  sRes:='N/A';
  IF nTmp=get_procid THEN sRes:='proc'; ELSIF nTmp=get_konsid THEN sRes:='kons'; ELSIF nTmp=get_issledid THEN sRes:='issl'; END IF;
  RETURN sRes;
END;
/

SHOW ERRORS;


