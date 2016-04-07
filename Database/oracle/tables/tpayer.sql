ALTER TABLE ASU.TPAYER
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPAYER CASCADE CONSTRAINTS
/

--
-- TPAYER  (Table) 
--
CREATE TABLE ASU.TPAYER
(
  FK_ID         NUMBER                          NOT NULL,
  FK_PEOPLEID   NUMBER,
  FK_COMPANYID  NUMBER,
  FK_CAPACITY   NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.TPAYER IS '������� ������������ ������� �����. ������������ ����� ���� ��� ���������� ���� ��� ����������� ����    A.Nakorjakov 070508
'
/

COMMENT ON COLUMN ASU.TPAYER.FK_ID IS 'SEQUENCE=[SEQ_TPAYER]'
/

COMMENT ON COLUMN ASU.TPAYER.FK_PEOPLEID IS 'TPEOPLE.FK_ID - �����������, ���� ���������� ���������� ����'
/

COMMENT ON COLUMN ASU.TPAYER.FK_COMPANYID IS 'TCOMPANY.FK_ID - �����������,���� ���������� ��.����'
/

COMMENT ON COLUMN ASU.TPAYER.FK_CAPACITY IS 'TSMID.FK_ID (������� PAYER_RENTABEL) - �������������� �����������'
/


--
-- PK_PAYER  (Index) 
--
--  Dependencies: 
--   TPAYER (Table)
--
CREATE UNIQUE INDEX ASU.PK_PAYER ON ASU.TPAYER
(FK_ID)
NOLOGGING
TABLESPACE USR
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
-- TPAYER_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPAYER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPAYER_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TPAYER  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  SELECT SEQ_TPAYER.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPAYER 
-- 
ALTER TABLE ASU.TPAYER ADD (
  CONSTRAINT PK_PAYER
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE USR
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

