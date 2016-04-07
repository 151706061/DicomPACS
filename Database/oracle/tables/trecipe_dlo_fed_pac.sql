ALTER TABLE ASU.TRECIPE_DLO_FED_PAC
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_DLO_FED_PAC CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_FED_PAC  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_FED_PAC
(
  FK_ID         NUMBER,
  REGISTR_TYPE  NUMBER,
  SNILS         VARCHAR2(14 BYTE),
  UNRZ          VARCHAR2(20 BYTE),
  FAM           VARCHAR2(40 BYTE),
  IM            VARCHAR2(40 BYTE),
  OT            VARCHAR2(40 BYTE),
  W             CHAR(1 BYTE),
  DR            DATE,
  SN_DOC        VARCHAR2(19 BYTE),
  C_DOC         NUMBER,
  C_REG         VARCHAR2(3 BYTE),
  ADRES         VARCHAR2(200 BYTE),
  DOM           VARCHAR2(7 BYTE),
  KOR           VARCHAR2(5 BYTE),
  KV            VARCHAR2(5 BYTE),
  OKATO_REG     NUMBER,
  S_EDV         NUMBER,
  DB_EDV        DATE,
  DE_EDV        DATE,
  C_KAT1        VARCHAR2(3 BYTE),
  C_KAT2        VARCHAR2(3 BYTE),
  DATE_RSB      DATE,
  DATE_RSE      DATE,
  U_TYPE        NUMBER,
  D_TYPE        VARCHAR2(3 BYTE)
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

COMMENT ON TABLE ASU.TRECIPE_DLO_FED_PAC IS '���.  ������� ���������� ����������� � 7 ���������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.FK_ID IS '����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.REGISTR_TYPE IS '��� �������� (1-�����������,  3 - 7 ���������)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.SNILS IS '����� ��������� (���������� � ����������� ��������)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.UNRZ IS '���������� ��� ��������� 7 ��������� (���������� � �������� 7 ���������)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.FAM IS '�������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.IM IS '���'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.OT IS '��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.W IS '��� (�/�)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.DR IS '���� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.SN_DOC IS '����� � ����� ���������, ��������������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.C_DOC IS '��� ���������, ��������������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.C_REG IS '��� �������������� �����������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.ADRES IS '����� �� ����� ����������� (������� �� � ����� - ����� � ��������� - ���������� ����� � �����)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.DOM IS '����� ���� (��������)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.KOR IS '������/��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.KV IS '��������/�������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.OKATO_REG IS '��� ���������� ���������� ����������� ����������  (�� �����)'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.S_EDV IS '������� ��������� ������ ���������� �����'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.DB_EDV IS '���� ������ �������� ����� �� ��������� ���'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.DE_EDV IS '���� ��������� �������� ����� �� ��������� ���'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.C_KAT1 IS '��� ���������, �� ������� ���������� ����������� ��� (�� ����������� �������, ��������� � ������ 6.7 ������������ ������ �� 17.07.1999 �178-�� (���, ����� ������������)). ���� (000) � ����� ��������� ���.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.C_KAT2 IS '��� ���������, �� ������� ���������� ����������� ��� (��� �������, ��������� � ������ 6.7 ������������ ������ �� 17.07.1999 �178-�� (����������� � ������������ � ���)). ���� (000) � ����� ��������� ���.'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.DATE_RSB IS '���� ��������� � ������������ ������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.DATE_RSE IS '���� ���������� �� ������������� �������� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.U_TYPE IS '��� ���������'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_FED_PAC.D_TYPE IS '������� "������ ������"'
/


--
-- TRECIPE_DLO_FED_PAC_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_FED_PAC (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_FED_PAC_PK ON ASU.TRECIPE_DLO_FED_PAC
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
-- TRECIPE_DLO_FED_PAC_DEL  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_FED_PAC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_FED_PAC_DEL"
 BEFORE
  DELETE
 ON ASU.TRECIPE_DLO_FED_PAC REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  delete from asu.TRECIPE_DLO_FED_PAC_CATEG t
   where t.FK_FEDPACID = :OLD.FK_ID;
end;
/
SHOW ERRORS;


--
-- TRECIPE_DLO_FED_PAC_INS  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_FED_PAC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_FED_PAC_INS"
 BEFORE
  INSERT
 ON ASU.TRECIPE_DLO_FED_PAC REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_FED_PAC.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECIPE_DLO_FED_PAC 
-- 
ALTER TABLE ASU.TRECIPE_DLO_FED_PAC ADD (
  CONSTRAINT TRECIPE_DLO_FED_PAC_PK
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

