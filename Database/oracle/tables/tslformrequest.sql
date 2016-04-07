DROP TABLE ASU.TSLFORMREQUEST CASCADE CONSTRAINTS
/

--
-- TSLFORMREQUEST  (Table) 
--
CREATE TABLE ASU.TSLFORMREQUEST
(
  FK_ID      NUMBER                             NOT NULL,
  FK_SOTRID  NUMBER,
  FN_COUNT   NUMBER,
  FD_DATE    DATE,
  FC_REMARK  VARCHAR2(255 BYTE),
  FL_DEL     NUMBER                             DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TSLFORMREQUEST IS '���������� �� ������ ������� ������������������'
/

COMMENT ON COLUMN ASU.TSLFORMREQUEST.FK_ID IS 'SEQUENCE=[SEQ_TSLFORMREQUEST]'
/

COMMENT ON COLUMN ASU.TSLFORMREQUEST.FK_SOTRID IS '��� �����, ������������ �����'
/

COMMENT ON COLUMN ASU.TSLFORMREQUEST.FN_COUNT IS '���������� ������������� �������'
/

COMMENT ON COLUMN ASU.TSLFORMREQUEST.FD_DATE IS '���� ����������'
/

COMMENT ON COLUMN ASU.TSLFORMREQUEST.FC_REMARK IS '������� (����������)'
/

COMMENT ON COLUMN ASU.TSLFORMREQUEST.FL_DEL IS '������� ��������'
/


--
-- TSLFORMREQUEST_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSLFORMREQUEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSLFORMREQUEST_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TSLFORMREQUEST   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_TSLFORMREQUEST.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;

