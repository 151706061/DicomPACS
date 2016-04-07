DROP TABLE ASU.TPUTS CASCADE CONSTRAINTS
/

--
-- TPUTS  (Table) 
--
CREATE TABLE ASU.TPUTS
(
  FK_ID     NUMBER(9)                           DEFAULT -1,
  FK_PACID  NUMBER(9)                           DEFAULT -1,
  FC_PUT    VARCHAR2(15 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          440K
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

COMMENT ON TABLE ASU.TPUTS IS '������ ������� � �������� by TimurLan'
/

COMMENT ON COLUMN ASU.TPUTS.FK_ID IS 'SEQUENCE=[SEQ_TPUTS]'
/

COMMENT ON COLUMN ASU.TPUTS.FK_PACID IS '��� ��������'
/

COMMENT ON COLUMN ASU.TPUTS.FC_PUT IS '����� �������'
/


--
-- TPUTS_BY_FK_PACID  (Index) 
--
--  Dependencies: 
--   TPUTS (Table)
--
CREATE INDEX ASU.TPUTS_BY_FK_PACID ON ASU.TPUTS
(FK_PACID, FC_PUT)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPUTS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPUTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPUTS_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TPUTS REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TPUTS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;

