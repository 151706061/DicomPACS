DROP TABLE ASU.TRSF CASCADE CONSTRAINTS
/

--
-- TRSF  (Table) 
--
CREATE TABLE ASU.TRSF
(
  FK_ID                           NUMBER        NOT NULL,
  FD_START                        DATE          NOT NULL,
  FD_FINISH                       DATE          NOT NULL,
  FP_TYPE                         NUMBER        NOT NULL,
  FK_DOCTYPE                      NUMBER        NOT NULL,
  FL_USL                          NUMBER(1)     NOT NULL,
  FL_OPER                         NUMBER(1)     NOT NULL,
  FL_KDN                          NUMBER(1)     NOT NULL,
  FK_SK_COMPANYID                 NUMBER        DEFAULT -1                    NOT NULL,
  FK_PEOPLEID                     NUMBER        DEFAULT -1                    NOT NULL,
  FK_SNG_OPTION                   NUMBER        DEFAULT -1                    NOT NULL,
  FC_TITLE                        VARCHAR2(2000 BYTE) NOT NULL,
  FL_SIGNATURE                    NUMBER(1)     NOT NULL,
  FK_SOTR_CREATE                  NUMBER        NOT NULL,
  FD_CREATE                       DATE          DEFAULT sysdate               NOT NULL,
  FL_DEL                          NUMBER(1)     DEFAULT 0                     NOT NULL,
  FK_SOTR_DEL                     NUMBER,
  FD_DEL                          DATE,
  FL_SF_CODE                      NUMBER(1)     DEFAULT 0                     NOT NULL,
  FL_SF_CODE_SOGAZ                NUMBER(1)     DEFAULT 0                     NOT NULL,
  FP_GROUPBY                      NUMBER        NOT NULL,
  FD_LAST_EDIT                    DATE,
  FK_SOTR_EDIT                    NUMBER,
  FN_SUM                          NUMBER        NOT NULL,
  FC_RSF_NUM                      VARCHAR2(50 BYTE),
  FD_RSF_DATE                     DATE          DEFAULT sysdate               NOT NULL,
  FK_STATUS                       NUMBER,
  FD_STATUS_DATE                  DATE,
  FK_SOTR_CHANGE_STATUS           NUMBER,
  FK_SOTR_CANCEL_PODPIS_AMBTALON  NUMBER,
  FD_CANCEL_PODPIS_AMBTALON       DATE,
  FL_KSG                          NUMBER(1)     DEFAULT 0
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

COMMENT ON TABLE ASU.TRSF IS '������� � ����-�������. Author: Neronov A.S. 20.062011'
/

COMMENT ON COLUMN ASU.TRSF.FL_KSG IS '1 - ������� K��'
/

COMMENT ON COLUMN ASU.TRSF.FK_ID IS 'SEQUENCE=[SEQ_TRSF]'
/

COMMENT ON COLUMN ASU.TRSF.FD_START IS '������ �������'
/

COMMENT ON COLUMN ASU.TRSF.FD_FINISH IS '����� �������'
/

COMMENT ON COLUMN ASU.TRSF.FP_TYPE IS '��� ��������� (0 - ����, 1 - ���, 2 - ������� ����, 3 - ���)'
/

COMMENT ON COLUMN ASU.TRSF.FK_DOCTYPE IS '��� ������ TTYPEDOC.FK_ID'
/

COMMENT ON COLUMN ASU.TRSF.FL_USL IS '1 - ������� ���. ������'
/

COMMENT ON COLUMN ASU.TRSF.FL_OPER IS '1 - ������� ��������'
/

COMMENT ON COLUMN ASU.TRSF.FL_KDN IS '1 - ������� ���'
/

COMMENT ON COLUMN ASU.TRSF.FK_SK_COMPANYID IS 'ID ��������� �������� TCOMPANY.FK_ID'
/

COMMENT ON COLUMN ASU.TRSF.FK_PEOPLEID IS 'ID �������� TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TRSF.FK_SNG_OPTION IS '�������������� ��������� ��� ��������������'
/

COMMENT ON COLUMN ASU.TRSF.FC_TITLE IS '��������� �������'
/

COMMENT ON COLUMN ASU.TRSF.FL_SIGNATURE IS '1 - �������� �������'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_CREATE IS 'ID ����������, ������� ������'
/

COMMENT ON COLUMN ASU.TRSF.FD_CREATE IS '���� ����������'
/

COMMENT ON COLUMN ASU.TRSF.FL_DEL IS '1 - ������'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_DEL IS 'ID ����������, ������� ������'
/

COMMENT ON COLUMN ASU.TRSF.FD_DEL IS '���� ��������'
/

COMMENT ON COLUMN ASU.TRSF.FL_SF_CODE IS '1 - ���������� ��� ������ � ��'
/

COMMENT ON COLUMN ASU.TRSF.FL_SF_CODE_SOGAZ IS '1 - ���������� ��� ������ � ��'
/

COMMENT ON COLUMN ASU.TRSF.FP_GROUPBY IS '����������� �� (0 - �� ��������, 1 - �� ������)'
/

COMMENT ON COLUMN ASU.TRSF.FD_LAST_EDIT IS '���� ���������� ���������'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_EDIT IS 'ID ����������, ������� ��������� �������'
/

COMMENT ON COLUMN ASU.TRSF.FN_SUM IS '����� �� ����� �������'
/

COMMENT ON COLUMN ASU.TRSF.FC_RSF_NUM IS '����� �������'
/

COMMENT ON COLUMN ASU.TRSF.FD_RSF_DATE IS '���� �������'
/

COMMENT ON COLUMN ASU.TRSF.FK_STATUS IS 'TSMID.FK_ID - ������ ����� - ���������� ����� "RSF_WORK_STATUS"'
/

COMMENT ON COLUMN ASU.TRSF.FD_STATUS_DATE IS '���� ���������� ��������� �������'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_CHANGE_STATUS IS 'ID ����������, ������� ��������� ������� ������'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_CANCEL_PODPIS_AMBTALON IS 'ID ����������, ������� ��������� ������� ������� ������, ������ �� �������� ���� � �������'
/

COMMENT ON COLUMN ASU.TRSF.FD_CANCEL_PODPIS_AMBTALON IS '���� ��������� ������ ������� ������, ������ �� �������� ���� � �������'
/


--
-- TRSF_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRSF (Table)
--
CREATE OR REPLACE TRIGGER ASU.TRSF_BEFORE_INSERT
 BEFORE
 INSERT
 ON ASU.TRSF  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  SELECT SEQ_TRSF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


