DROP TRIGGER ASU.TSTATE_BEFORE_INSERT
/

--
-- TSTATE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TSTATE (Sequence)
--   TSTATE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSTATE_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TSTATE   FOR EACH ROW
-- Created 20070511 by Linnikov
-- Тригер рассылает сообщения о сменен статуса пользователя
DECLARE
 -- n NUMBER;
BEGIN
 SELECT SEQ_TSTATE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
-- Commented 20070928 by Linnikov  DBMS_ALERT.SIGNAL('STATUS', TO_CHAR(:NEW.FK_ID));
END;
/
SHOW ERRORS;


