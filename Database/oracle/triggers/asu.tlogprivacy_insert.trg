DROP TRIGGER ASU.TLOGPRIVACY_INSERT
/

--
-- TLOGPRIVACY_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$MYSTAT (Synonym)
--   V$SESSION (Synonym)
--   DUAL (Synonym)
--   SEQ_TLOGPRIVACY (Sequence)
--   TLOGPRIVACY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLOGPRIVACY_INSERT" 
 BEFORE
  INSERT
 ON asu.TLOGPRIVACY
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare

 cursor cSession is
  select username, machine, module
  from v$session
 where sid =(select sid from v$mystat where rownum = 1);
 
Begin
  SELECT SEQ_TLOGPRIVACY.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  
  open  cSession;
  fetch cSession into :NEW.FC_USERNAME, :NEW.FC_MACHINE, :NEW.FC_MODULE;  
  close cSession;
    
End;
/
SHOW ERRORS;


