ALTER TABLE ASU.TSTATE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSTATE CASCADE CONSTRAINTS
/

--
-- TSTATE  (Table) 
--
CREATE TABLE ASU.TSTATE
(
  FK_ID       NUMBER                            NOT NULL,
  FK_USERID   NUMBER,
  FK_CARID    NUMBER,
  FD_DATE     DATE,
  FN_STATE    NUMBER,
  FC_COMMENT  VARCHAR2(100 BYTE),
  FC_USER     VARCHAR2(100 BYTE),
  FC_CAR      VARCHAR2(100 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          2320K
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

COMMENT ON TABLE ASU.TSTATE IS '�������� ������������� 20070523 by Linnikov'
/

COMMENT ON COLUMN ASU.TSTATE.FK_ID IS 'SEQUENCE=[SEQ_TSTATE]'
/

COMMENT ON COLUMN ASU.TSTATE.FK_USERID IS '������������ (TSOTR.FK_ID)'
/

COMMENT ON COLUMN ASU.TSTATE.FK_CARID IS '������'
/

COMMENT ON COLUMN ASU.TSTATE.FD_DATE IS '���� ��������� �������'
/

COMMENT ON COLUMN ASU.TSTATE.FN_STATE IS '��������� (0-�������, 1 - ������, 2 - �������� �����)'
/

COMMENT ON COLUMN ASU.TSTATE.FC_COMMENT IS '�����������'
/

COMMENT ON COLUMN ASU.TSTATE.FC_USER IS '������������'
/

COMMENT ON COLUMN ASU.TSTATE.FC_CAR IS '������ ������������'
/


--
-- TSTATE$FK_USERID  (Index) 
--
--  Dependencies: 
--   TSTATE (Table)
--
CREATE INDEX ASU.TSTATE$FK_USERID ON ASU.TSTATE
(FK_USERID)
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
-- TSTATE_PK  (Index) 
--
--  Dependencies: 
--   TSTATE (Table)
--
CREATE UNIQUE INDEX ASU.TSTATE_PK ON ASU.TSTATE
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          680K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSTATE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSTATE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSTATE_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TSTATE   FOR EACH ROW
-- Created 20070511 by Linnikov
-- ������ ��������� ��������� � ������ ������� ������������
DECLARE
 -- n NUMBER;
BEGIN
 SELECT SEQ_TSTATE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
-- Commented 20070928 by Linnikov  DBMS_ALERT.SIGNAL('STATUS', TO_CHAR(:NEW.FK_ID));
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSTATE 
-- 
ALTER TABLE ASU.TSTATE ADD (
  CONSTRAINT TSTATE_PK
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          680K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

