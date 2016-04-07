DROP FUNCTION ASU.GET_PACNAZ
/

--
-- GET_PACNAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESLECH (Table)
--   TSMID (Table)
--   GET_PROCID (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACNAZ" (pPacID IN NUMBER)
RETURN VARCHAR2 IS-- Проведенные процедуры
  CURSOR cProc(nPacID IN NUMBER) IS SELECT DISTINCT tsmid.fk_id FROM treslech, tsmid
         WHERE treslech.fk_pacid=nPacID
           AND treslech.fk_sos=get_vipnaz
           AND tsmid.fk_id=treslech.fk_smid;
  sRes VARCHAR2(32767);
  FUNCTION get_fullnaz(nNazID IN NUMBER) RETURN VARCHAR2 IS
    sName VARCHAR2(32767);
  BEGIN
    sName:='EMPTY';
    FOR C IN (SELECT fc_name FROM tsmid
              WHERE fk_id<>get_procid
              START WITH fk_id=nNazID
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
  FOR C IN cProc(pPacID) LOOP
    IF sRes='EMPTY' THEN
      sRes:=/*'Выполненные процедуры:'||CHR(13)||*/get_fullnaz(C.fk_id);
    ELSE
      sRes:=sRes||', '||get_fullnaz(C.fk_id);
    END IF;
  END LOOP;
  SELECT DECODE(sRes,'EMPTY', 'Нет процедур', sRes) INTO sRes FROM DUAL;
  RETURN(sRes);
END;
/

SHOW ERRORS;


