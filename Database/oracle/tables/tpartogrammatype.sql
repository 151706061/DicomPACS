DROP TABLE ASU.TPARTOGRAMMATYPE CASCADE CONSTRAINTS
/

--
-- TPARTOGRAMMATYPE  (Table) 
--
CREATE TABLE ASU.TPARTOGRAMMATYPE
(
  FK_ID        NUMBER                           NOT NULL,
  FC_NAME      VARCHAR2(200 BYTE),
  FN_BEGDIAP   NUMBER,
  FN_ENDDIAP   NUMBER,
  FN_TYPE      NUMBER,
  FN_STEPORD   NUMBER,
  FN_STEPABS   NUMBER,
  FL_DEL       NUMBER                           DEFAULT 0,
  FC_SHORT     VARCHAR2(50 BYTE),
  FN_ORDER     NUMBER,
  FC_COLNAMES  VARCHAR2(200 BYTE),
  FC_SYNONIM   VARCHAR2(50 BYTE),
  FN_PERIOD    NUMBER
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

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FC_NAME IS '��������'
/

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FN_BEGDIAP IS '������ ��������� �� �������'
/

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FN_ENDDIAP IS '����� ���������  �� �������'
/

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FN_TYPE IS '��� ����������� (0-������, 1-��������, 2-��������������, 3-���������, 4-�������(��� ��) � �.�.)'
/

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FN_STEPORD IS '��� ��� ������� (��� FN_TYPE=1: ���-�� �����)'
/

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FN_STEPABS IS '��� ��� ������� � ������� (10,30,60 � �.�)'
/

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FC_SHORT IS '����������� �������� ��� ����������'
/

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FN_ORDER IS '������� ����������'
/

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FC_COLNAMES IS '�������� �������� ��� ������� �����'
/

COMMENT ON COLUMN ASU.TPARTOGRAMMATYPE.FN_PERIOD IS '������ ����� ������� ����� ������� ������ (� ����� �������)'
/


--
-- TPARTOGRAMMATYPE_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TPARTOGRAMMATYPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPARTOGRAMMATYPE_BEFORE_INS" 
  BEFORE INSERT
  ON ASU.TPARTOGRAMMATYPE   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_TPARTOGRAMMATYPE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;

