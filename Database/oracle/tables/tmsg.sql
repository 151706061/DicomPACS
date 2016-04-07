ALTER TABLE ASU.TMSG
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TMSG CASCADE CONSTRAINTS
/

--
-- TMSG  (Table) 
--
CREATE TABLE ASU.TMSG
(
  FK_ID            NUMBER                       NOT NULL,
  FK_SENDER        NUMBER,
  FK_RECIEVER      NUMBER,
  FD_SEND          DATE,
  FD_RECIEVE       DATE,
  FD_READ          DATE,
  FC_TEXT          VARCHAR2(4000 BYTE),
  FP_NEED_READ     NUMBER                       DEFAULT 0,
  FK_BLOB          NUMBER                       DEFAULT 0,
  FP_TYPE          NUMBER                       DEFAULT 0,
  FC_READ_COMMENT  VARCHAR2(250 BYTE),
  FK_OWNERID       NUMBER,
  FP_MAIL          NUMBER                       DEFAULT 0,
  FL_DEL           NUMBER                       DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          360K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
ENABLE ROW MOVEMENT
/

COMMENT ON TABLE ASU.TMSG IS '������ ��������� ���������� ������ ����������� 20070423 by Linnikov'
/

COMMENT ON COLUMN ASU.TMSG.FK_ID IS 'SEQUENCE=[SEQ_TMSG]'
/

COMMENT ON COLUMN ASU.TMSG.FK_SENDER IS '�� ���� (0 - ��������� ���������) (TSOTR.FK_ID)'
/

COMMENT ON COLUMN ASU.TMSG.FK_RECIEVER IS '���� (TSOTR.FK_ID)'
/

COMMENT ON COLUMN ASU.TMSG.FD_SEND IS '����������'
/

COMMENT ON COLUMN ASU.TMSG.FD_RECIEVE IS '����������'
/

COMMENT ON COLUMN ASU.TMSG.FD_READ IS '���������'
/

COMMENT ON COLUMN ASU.TMSG.FC_TEXT IS '���������'
/

COMMENT ON COLUMN ASU.TMSG.FP_NEED_READ IS '0 - ������� ���������� 1- ��������� �������, 2 - ������'
/

COMMENT ON COLUMN ASU.TMSG.FK_BLOB IS '����������� ���� (TBLOBS.FK_ID)'
/

COMMENT ON COLUMN ASU.TMSG.FP_TYPE IS '��� ��������� (����� TSMID � ��������� MSG_TYPE)'
/

COMMENT ON COLUMN ASU.TMSG.FC_READ_COMMENT IS '���������� ��� ��������� ���������'
/

COMMENT ON COLUMN ASU.TMSG.FK_OWNERID IS '��� ����������������� ���������'
/

COMMENT ON COLUMN ASU.TMSG.FP_MAIL IS '��������� �������� �� E-mail'
/

COMMENT ON COLUMN ASU.TMSG.FL_DEL IS '������� ��������'
/


--
-- TMSG_FK_RECIEVER  (Index) 
--
--  Dependencies: 
--   TMSG (Table)
--
CREATE INDEX ASU.TMSG_FK_RECIEVER ON ASU.TMSG
(FK_RECIEVER)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TMSG_PK  (Index) 
--
--  Dependencies: 
--   TMSG (Table)
--
CREATE UNIQUE INDEX ASU.TMSG_PK ON ASU.TMSG
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TMSG_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TMSG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMSG_BEFORE_UPDATE" 
 BEFORE 
 UPDATE
 ON ASU.TMSG  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
 nTmp NUMBER;
BEGIN
 SELECT COUNT(FK_USERID)
   INTO nTmp
   FROM TMISEXCH_TASKS_USERS, tmisexch_tasks
  WHERE tmisexch_tasks.fk_id = fk_taskid
    AND (FK_USERID = :NEW.FK_RECIEVER OR
        (FK_USERID = :NEW.FK_SENDER AND fl_bothdirections = 1));
 IF nTmp > 0 AND :NEW.FP_NEED_READ = 2 AND :NEW.FD_READ<>:OLD.FD_READ THEN
  INSERT INTO TMISEXCH_BUF
   (FC_TEXT, FK_OWNERUSER, FK_RECIPIENTUSER, FK_CLOBID, FD_DATECREATE, FL_NEED_READ)
  VALUES
   ('�������� ������ ' || TO_CHAR(:NEW.FD_READ, 'DD.MM.YYYY') || ' � ' ||
    TO_CHAR(:NEW.FD_READ, 'HH:MI') ||
    DECODE(:NEW.FC_READ_COMMENT,
           '',
           '',
           chr(13) || '�����������: ' || :NEW.FC_READ_COMMENT) || chr(13) ||
    '����� ��������: ' || :NEW.FC_TEXT,
    :NEW.FK_SENDER,
    :NEW.FK_RECIEVER,
    :NEW.FK_BLOB,
    :NEW.FD_SEND,
    :NEW.FP_NEED_READ);
 END IF;
END TMSG_BEFORE_INSERT;
/
SHOW ERRORS;


--
-- TMSG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
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


-- 
-- Non Foreign Key Constraints for Table TMSG 
-- 
ALTER TABLE ASU.TMSG ADD (
  CONSTRAINT TMSG_PK
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          80K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

GRANT INSERT ON ASU.TMSG TO LOGIN
/

