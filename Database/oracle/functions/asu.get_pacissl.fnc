DROP FUNCTION ASU.GET_PACISSL
/

--
-- GET_PACISSL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TSMID (Table)
--   GET_ISSLEDID (Function)
--   GET_VYPNAZSOSID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACISSL" (pPacID IN NUMBER)
RETURN VARCHAR2 IS-- Проведенные исследования
  CURSOR cIssl(nPacID IN NUMBER) IS SELECT DISTINCT tsmid.fk_id FROM tnazis, tsmid
         WHERE tnazis.fk_pacid=nPacID
           AND tnazis.fk_nazsosid=get_vypnazsosid
           AND tsmid.fk_id=tnazis.fk_smid;
  sRes  VARCHAR2(32767);
  FUNCTION get_fullissl(nKonsID IN NUMBER) RETURN VARCHAR2 IS
    sName VARCHAR2(32767);
  BEGIN
    sName:='EMPTY';
    FOR C IN (SELECT fc_name FROM tsmid
              WHERE fk_id<>get_issledid
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
  FOR C IN cIssl(pPacID) LOOP
    IF sRes='EMPTY' THEN
      sRes:=/*'Проведенные исследования:'||CHR(13)||*/get_fullissl(C.fk_id);
    ELSE
      sRes:=sRes||', '||get_fullissl(C.fk_id);
    END IF;
  END LOOP;
  SELECT DECODE(sRes,'EMPTY', 'Нет исследований', sRes) INTO sRes FROM DUAL;
  RETURN sRes;
END;
/

SHOW ERRORS;


