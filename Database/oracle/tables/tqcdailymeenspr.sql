DROP TABLE ASU.TQCDAILYMEENSPR CASCADE CONSTRAINTS
/

--
-- TQCDAILYMEENSPR  (Table) 
--
CREATE TABLE ASU.TQCDAILYMEENSPR
(
  FK_ID     NUMBER(9)                           DEFAULT -1,
  FK_SMID   NUMBER(9),
  FN_ORDER  NUMBER(3),
  FC_NAME   VARCHAR2(30 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TQCDAILYMEENSPR IS '���������� ������� �������� �������� �� ���������� �������'
/

COMMENT ON COLUMN ASU.TQCDAILYMEENSPR.FK_ID IS 'SEQUENCE=[SEQ_TQCDAILYMEENSPR]'
/

COMMENT ON COLUMN ASU.TQCDAILYMEENSPR.FK_SMID IS '��� ������������ �� TSMID'
/

COMMENT ON COLUMN ASU.TQCDAILYMEENSPR.FN_ORDER IS '�������'
/

COMMENT ON COLUMN ASU.TQCDAILYMEENSPR.FC_NAME IS '������������ ������'
/


--
-- TQCDAILYMEENSPR_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TQCDAILYMEENSPR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TQCDAILYMEENSPR_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TQCDAILYMEENSPR REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  SELECT SEQ_TQCDAILYMEENSPR.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TQCDAILYMEENSPR_AFTER_DELETE  (Trigger) 
--
--  Dependencies: 
--   TQCDAILYMEENSPR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TQCDAILYMEENSPR_AFTER_DELETE" 
AFTER  DELETE  ON ASU.TQCDAILYMEENSPR FOR EACH ROW
Begin
  DELETE FROM TQCDAILYMEENFIX WHERE FK_SMID=:OLD.FK_SMID;
  DELETE FROM TQCDAILYMEEN WHERE FK_SMID=:OLD.FK_SMID;
End;
/
SHOW ERRORS;

