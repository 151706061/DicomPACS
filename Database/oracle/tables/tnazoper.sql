ALTER TABLE ASU.TNAZOPER
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZOPER CASCADE CONSTRAINTS
/

--
-- TNAZOPER  (Table) 
--
CREATE TABLE ASU.TNAZOPER
(
  FK_ID          NUMBER(15)                     NOT NULL,
  FK_SMID        NUMBER(15),
  FK_NAZID       NUMBER(15),
  FC_NAME        VARCHAR2(300 BYTE),
  FK_BLOODID     NUMBER(15),
  FK_ANESTID     NUMBER(15),
  FC_REMARK      VARCHAR2(4000 BYTE),
  FL_PODPIS      NUMBER(1)                      DEFAULT 0,
  FN_ORDER       NUMBER(2),
  FK_OTDELID     NUMBER(10),
  FD_RUN         DATE,
  FK_OPERROOM    NUMBER,
  FN_OPERTABLE   NUMBER,
  FP_OPERTYPE    NUMBER                         DEFAULT 0,
  FN_DURATION    NUMBER                         DEFAULT 0,
  FL_HIGHTECHNO  NUMBER(1),
  FC_OPERPLACE   VARCHAR2(4000 BYTE),
  FL_UTVERDIL    NUMBER(1)                      DEFAULT 0,
  FK_STATUS      NUMBER
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TNAZOPER IS '����������: �������� ���������� ���������� ������������ �������
�������: ���������� �.�. 15.04.2007'
/

COMMENT ON COLUMN ASU.TNAZOPER.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TNAZOPER.FK_SMID IS 'tsmid.fk_id ��� �������� �� �����������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FK_NAZID IS 'vnaz.fk_id ������ � �����������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FC_NAME IS '�������� ��������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FK_BLOODID IS '������ �����'
/

COMMENT ON COLUMN ASU.TNAZOPER.FK_ANESTID IS '����� �������������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FC_REMARK IS '����������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FL_PODPIS IS '���������� ��������� = 1'
/

COMMENT ON COLUMN ASU.TNAZOPER.FD_RUN IS '���� ����������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FK_OPERROOM IS 'TROOM.FK_ID ������������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FN_OPERTABLE IS '����� ����� � ������������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FP_OPERTYPE IS '0 - �����������; 1 - �����������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FN_DURATION IS '�����������������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FL_HIGHTECHNO IS '��������������������� �������� ��� ���'
/

COMMENT ON COLUMN ASU.TNAZOPER.FC_OPERPLACE IS '��� ���������� ��������. � ������ �������� ��� � ����� ���������'
/

COMMENT ON COLUMN ASU.TNAZOPER.FL_UTVERDIL IS '���������� ���������� = 1'
/

COMMENT ON COLUMN ASU.TNAZOPER.FK_STATUS IS '������� ���������'
/


--
-- TNAZOPER_BY_NAZID  (Index) 
--
--  Dependencies: 
--   TNAZOPER (Table)
--
CREATE UNIQUE INDEX ASU.TNAZOPER_BY_NAZID ON ASU.TNAZOPER
(FK_NAZID)
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
-- TNAZOPER$FK_ID  (Index) 
--
--  Dependencies: 
--   TNAZOPER (Table)
--
CREATE UNIQUE INDEX ASU.TNAZOPER$FK_ID ON ASU.TNAZOPER
(FK_ID)
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
-- TNAZOPER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZOPER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZOPER_INSERT" 
 BEFORE
  INSERT
 ON tnazoper
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tkarta.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TNAZOPER 
-- 
ALTER TABLE ASU.TNAZOPER ADD (
  CONSTRAINT PK_TNAZOPER
 PRIMARY KEY
 (FK_ID))
/

