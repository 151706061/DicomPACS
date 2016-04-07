ALTER TABLE ASU.TPLAT_USLUG
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPLAT_USLUG CASCADE CONSTRAINTS
/

--
-- TPLAT_USLUG  (Table) 
--
CREATE TABLE ASU.TPLAT_USLUG
(
  FK_ID           NUMBER                        NOT NULL,
  FK_NAZ          NUMBER,
  FN_COUNT        NUMBER,
  FK_ASSUMEISPOL  NUMBER,
  FP_SOS          NUMBER                        DEFAULT 0,
  FL_PREDOPL      NUMBER                        DEFAULT 0,
  FD_RUNASSUME    DATE,
  FN_COST         NUMBER,
  FK_HEAL         NUMBER,
  FN_DURATION     NUMBER,
  FL_AGREED       NUMBER,
  FP_PRINTDOC     NUMBER,
  FL_NDS          NUMBER                        DEFAULT 0,
  FN_PAYPERCENT   NUMBER                        DEFAULT 100,
  FP_PLATSOS      NUMBER                        DEFAULT 0
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

COMMENT ON TABLE ASU.TPLAT_USLUG IS '������� ������ A.Nakorjakov 080508'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FK_ID IS 'SEQUENCE=[SEQ_TPLAT_USLUG]'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FK_NAZ IS 'VNAZ.FK_ID'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FN_COUNT IS '���-�� �������� � ������ ������'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FK_ASSUMEISPOL IS 'TOTDEL.FK_ID;TSOTR.FK_ID �������������� ����������� (����� ���� ��������� ��� ���������)'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FP_SOS IS 'tnazsos.fk_id'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FL_PREDOPL IS '������� ����������?'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FD_RUNASSUME IS '�������������� ���� ����������'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FN_COST IS '��������� ����� ������  (��� ����� FN_COUNT) � � ������ ��� � � ������ ������ �� �� ���������'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FK_HEAL IS 'THEAL.FK_ID'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FN_DURATION IS '����������������� ����� ������ � �������'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FL_AGREED IS '�������� ��������? null - ���, 1 - ��������'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FP_PRINTDOC IS 'null - ������ �� �����������;0 - ��� � ���������� ;1 -����� �� ����������'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FL_NDS IS '������ ���������� ���?'
/

COMMENT ON COLUMN ASU.TPLAT_USLUG.FN_PAYPERCENT IS '������� ������ �� �� ���������'
/


--
-- PK_PLAT_USLUG  (Index) 
--
--  Dependencies: 
--   TPLAT_USLUG (Table)
--
CREATE UNIQUE INDEX ASU.PK_PLAT_USLUG ON ASU.TPLAT_USLUG
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
-- TPLAT_USLUG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPLAT_USLUG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPLAT_USLUG_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TPLAT_USLUG  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  SELECT SEQ_TPLAT_USLUG.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPLAT_USLUG 
-- 
ALTER TABLE ASU.TPLAT_USLUG ADD (
  CONSTRAINT PK_PLAT_USLUG
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

