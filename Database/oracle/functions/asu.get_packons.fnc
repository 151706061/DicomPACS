DROP FUNCTION ASU.GET_PACKONS
/

--
-- GET_PACKONS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZKONS (Table)
--   TSMID (Table)
--   GET_KONSID (Function)
--   GET_VYPNAZSOSID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACKONS" (pPacID IN NUMBER)
RETURN VARCHAR2 IS-- Проведенные консультации
  CURSOR cKons(nPacID IN NUMBER) IS SELECT DISTINCT tsmid.fk_id FROM tnazkons, tsmid
         WHERE tnazkons.fk_pacid=nPacID
           AND tnazkons.fk_nazsosid=get_vypnazsosid
           AND tsmid.fk_id=tnazkons.fk_smid;
  sRes  VARCHAR2(32767);
  FUNCTION get_fullkons(nKonsID IN NUMBER) RETURN VARCHAR2 IS
    sName VARCHAR2(32767);
  BEGIN
    sName:='EMPTY';
    FOR C IN (SELECT fc_name FROM tsmid
              WHERE fk_id<>get_konsid
              START WITH fk_id=nKonsID
              CONNECT BY fk_id=PRIOR fk_owner) LOOP
      IF sName='EMPTY' THEN
        sName:=C.fc_name;
      ELSE
        sName:=C.fc_name||': '||sName;
      END IF;
    END LOOP;
    RETURN sName;
  END;
BEGIN
  sRes:='EMPTY';
  FOR C IN cKons(pPacID) LOOP
    IF sRes='EMPTY' THEN
      sRes:=/*'Проведенные консультации:'||CHR(13)||*/get_fullkons(C.fk_id);
    ELSE
      sRes:=sRes||', '||get_fullkons(C.fk_id);
    END IF;
  END LOOP;
  SELECT DECODE(sRes,'EMPTY', 'Нет консультаций', sRes) INTO sRes FROM DUAL;
  RETURN sRes;
END;
/

SHOW ERRORS;


