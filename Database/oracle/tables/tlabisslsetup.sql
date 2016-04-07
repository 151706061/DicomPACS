DROP TABLE ASU.TLABISSLSETUP CASCADE CONSTRAINTS
/

--
-- TLABISSLSETUP  (Table) 
--
CREATE TABLE ASU.TLABISSLSETUP
(
  FK_ID       NUMBER(9)                         DEFAULT -1,
  FK_SMID     NUMBER(9)                         DEFAULT -1,
  FC_NAME     VARCHAR2(60 BYTE),
  FC_FORMULA  VARCHAR2(100 BYTE),
  FN_ROW      NUMBER(4),
  FN_COL      NUMBER(4),
  FC_TYPE     VARCHAR2(20 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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
/

COMMENT ON TABLE ASU.TLABISSLSETUP IS '������� �������� ������� �� ����������� �� �������������'
/

COMMENT ON COLUMN ASU.TLABISSLSETUP.FK_ID IS 'SEQUENCE=[SEQ_TLABISSLSETUP]'
/

COMMENT ON COLUMN ASU.TLABISSLSETUP.FK_SMID IS '��� �� TSMID ��� ������� �������'
/

COMMENT ON COLUMN ASU.TLABISSLSETUP.FC_NAME IS '����� � �������'
/

COMMENT ON COLUMN ASU.TLABISSLSETUP.FC_FORMULA IS '������� ��������'
/

COMMENT ON COLUMN ASU.TLABISSLSETUP.FN_ROW IS '����� ����'
/

COMMENT ON COLUMN ASU.TLABISSLSETUP.FN_COL IS '����� �������'
/

COMMENT ON COLUMN ASU.TLABISSLSETUP.FC_TYPE IS '���'
/


--
-- TLABISSLSETUP_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TLABISSLSETUP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLABISSLSETUP_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TLABISSLSETUP REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TLABISSLSETUP.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;

