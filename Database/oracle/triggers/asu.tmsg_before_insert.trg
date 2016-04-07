DROP TRIGGER ASU.TMSG_BEFORE_INSERT
/

--
-- TMSG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TMSG (Sequence)
--   TMISEXCH_BUF (Table)
--   TMISEXCH_TASKS (Table)
--   TMISEXCH_TASKS_USERS (Table)
--   TMSG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMSG_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TMSG  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
 nTmp NUMBER;
BEGIN
 SELECT SEQ_TMSG.NEXTVAL INTO :NEW.FK_ID FROM DUAL;

 -- ���� ��������� ��� ������������ ������ ��������� - ��������
 -- ��������� � �������� ������� ��� ����������� �������� �� �����

 SELECT COUNT(FK_USERID)
   INTO nTmp
   FROM TMISEXCH_TASKS_USERS, tmisexch_tasks
  WHERE tmisexch_tasks.fk_id=fk_taskid
    AND (FK_USERID = :NEW.FK_RECIEVER
     OR  FK_USERID = :NEW.FK_SENDER);
 IF nTmp > 0 AND :NEW.FP_MAIL = 0 THEN
  INSERT INTO TMISEXCH_BUF
   (FC_TEXT, FK_OWNERUSER, FK_RECIPIENTUSER, FK_CLOBID, FD_DATECREATE, FL_NEED_READ)
  VALUES
   (:NEW.FC_TEXT, :NEW.FK_SENDER, :NEW.FK_RECIEVER, :NEW.FK_BLOB, :NEW.FD_SEND, :NEW.FP_NEED_READ);
   
/*Added by A.Nakorjakov 06052008
begin
�� ������� �.��������� ��������� � ���, ��� ����������� ������ ���������� �������� ��*/
  IF (INSTR(:NEW.FC_TEXT,'��������� � ���������������� ��������� (')>0) AND
     (INSTR(:NEW.FC_TEXT,'):����������� ������ �� ���������')>0) THEN
    INSERT INTO TMISEXCH_BUF
    (FC_TEXT, FK_OWNERUSER, FK_RECIPIENTUSER, FK_CLOBID, FD_DATECREATE, FL_NEED_READ)
    VALUES
    (:NEW.FC_TEXT, :NEW.FK_SENDER, 34788, :NEW.FK_BLOB, :NEW.FD_SEND, :NEW.FP_NEED_READ); --34788 - tsotr.fk_id - �� ��������
  END IF;
/*Added by A.Nakorjakov 06052008
end*/
 END IF;

-- Commented 20070928 by Linnikov DBMS_PIPE.PACK_MESSAGE(:NEW.FK_ID);
-- Commented 20070928 by Linnikov nTmp := DBMS_PIPE.SEND_MESSAGE(:NEW.FK_RECIEVER);

END TMSG_BEFORE_INSERT;
/
SHOW ERRORS;


