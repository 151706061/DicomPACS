DROP TRIGGER ASU.DBCONNECTOR_BEFORE_INSERT
/

--
-- DBCONNECTOR_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   UTL_I18N (Synonym)
--   DBMS_LOB (Synonym)
--   "DbConnector" (Table)
--   UPDATE_RESULTID_FOR_MULTIVOX (Procedure)
--
CREATE OR REPLACE TRIGGER ASU."DBCONNECTOR_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu."DbConnector"
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  str VARCHAR2(32767);
  s varchar2(32555);
  s1 varchar2(32555);

  n number;
  n1 number;
BEGIN
  IF :NEW."Source" = 'RIS' THEN
    str := dbms_lob.substr(:new."Message",32555);
    str := utl_i18n.raw_to_char(str);
    n := instr(str, '<EI.1>');
    s := substr(str, n+6, length(str)-n);
    n1 := instr(s, '</EI.1>');
    s1 := substr(s, 0, n1-1);
    asu.UPDATE_RESULTID_FOR_MULTIVOX(TO_NUMBER(s1));
  END IF;
END;
/
SHOW ERRORS;


