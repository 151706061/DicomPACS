DROP TABLE ASU.TLUCHTERAP CASCADE CONSTRAINTS
/

--
-- TLUCHTERAP  (Table) 
--
CREATE TABLE ASU.TLUCHTERAP
(
  FK_ID                      NUMBER(15)         NOT NULL,
  FK_PACID                   NUMBER(15),
  FL_STATUS                  NUMBER(1),
  FD_DATE1                   DATE,
  FD_DATE2                   DATE,
  FK_APPARATID               NUMBER(15),
  FK_VIDLECHIDS              VARCHAR2(200 BYTE),
  FK_METODIDS                VARCHAR2(200 BYTE),
  FK_PRIMENENIEID            NUMBER(15),
  FK_VIDOBLUCHID             NUMBER(15),
  FC_NUMKURS                 VARCHAR2(100 BYTE),
  FK_VRACHID                 NUMBER(15),
  FK_TYPEKARD                NUMBER(1),
  FD_INS                     DATE               DEFAULT sysdate,
  FC_BEFOREPERERIV           VARCHAR2(100 BYTE),
  FC_PERERIV                 VARCHAR2(100 BYTE),
  FC_FTUTEXT                 VARCHAR2(255 BYTE),
  FC_DOPUSL                  VARCHAR2(255 BYTE),
  FK_EKRAN                   NUMBER(15),
  FC_RIK1                    VARCHAR2(50 BYTE),
  FC_RIK2                    VARCHAR2(50 BYTE),
  FC_RIO1                    VARCHAR2(50 BYTE),
  FC_RIO2                    VARCHAR2(50 BYTE),
  FC_DISTCENTERSBYHORIZONT1  VARCHAR2(50 BYTE),
  FC_DISTCENTERSBYHORIZONT2  VARCHAR2(50 BYTE),
  FC_DISTCENTERSBYVERTICAL1  VARCHAR2(50 BYTE),
  FC_DISTCENTERSBYVERTICAL2  VARCHAR2(50 BYTE),
  FP_VELOCITYKACHTYPE1       NUMBER(1),
  FP_VELOCITYKACHTYPE2       NUMBER(1),
  FC_VELOCITYKACH1           VARCHAR2(50 BYTE),
  FC_VELOCITYKACH2           VARCHAR2(50 BYTE),
  FC_ANGLE                   VARCHAR2(50 BYTE),
  FC_AMPLITUDE               VARCHAR2(50 BYTE),
  FK_EFFECT                  NUMBER(15)         DEFAULT -1,
  FK_STANDARTID              NUMBER(15)         DEFAULT -1,
  FK_HEALIDS                 VARCHAR2(200 BYTE),
  FL_SHABLON                 NUMBER(1)          DEFAULT 0,
  FK_OWNERVRACHID            NUMBER(15),
  FC_NAME                    VARCHAR2(200 BYTE),
  FL_FORALL                  NUMBER(1)
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

COMMENT ON TABLE ASU.TLUCHTERAP IS '������� ����������� ������� �������.   Author: Slusarenko M.D.  04.06.2013'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_PACID IS 'tkarta.fk_id ��� tambulance.fk_id'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FL_STATUS IS '������. 1 - ������� ��������; 0 - ������� �� ��������.'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FD_DATE1 IS '���� ������ �������.'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FD_DATE2 IS '���� ��������� �������.'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_APPARATID IS '������� ��������� (id �� ����� tsmid � ��������� LUCHTERAPIYA_APPARAT)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_VIDLECHIDS IS '��� ������� - ����� ���� ��������� (������������� ����� ������� id �� ����� tsmid � ��������� LUCHTERAPIYA_VIDLECH)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_METODIDS IS '�������� ������� ������� - ����� ���� ��������� (������������� ����� ������� id �� ����� tsmid � ��������� LUCHTERAPIYA_METOD)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_PRIMENENIEID IS '���������� �� ������ ������� (id �� ����� tsmid � ��������� LUCHTERAPIYA_PRIMENENIE)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_VIDOBLUCHID IS '��� ��������� (id �� ����� tsmid � ��������� LUCHTERAPIYA_VIDOBLUCH)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_NUMKURS IS '����� ����� (�������� �� ����)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_VRACHID IS '����, ����������� ����'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_TYPEKARD IS '��� �����. 0 - �������������� ������� �������; 1 - ������������� ����� ������� (�����������); 2 - ������������� ����� ������� (����� �������)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FD_INS IS '���� �������� �����'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_BEFOREPERERIV IS '��������� �� �������� (����)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_PERERIV IS '������� � ��������� (����)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_FTUTEXT IS '������-����������� ������� (�����)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DOPUSL IS '������-����������� ������� (���. �������)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_EKRAN IS '������-����������� ������� (����������� ��������� ��������� - id �� ����� tsmid � ��������� LUCHTERAPIYA_EKRAN)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_RIK1 IS '������-����������� ������� (��� 1-�� �����) - ���� ���� ����� 1, �� ��� ����������� � ��� ����'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_RIK2 IS '������-����������� ������� (��� 2-�� �����)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_RIO1 IS '������-����������� ������� (��� 1-�� �����) - ���� ���� ����� 1, �� ��� ����������� � ��� ����'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_RIO2 IS '������-����������� ������� (��� 2-�� �����)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DISTCENTERSBYHORIZONT1 IS '������-����������� ������� (���������� ����� �������� ������� �� ����������� 1-�� �����) - ���� ���� ����� 1, �� ���������� �� ����������� ����������� � ��� ����'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DISTCENTERSBYHORIZONT2 IS '������-����������� ������� (���������� ����� �������� ������� �� ����������� 2-�� �����)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DISTCENTERSBYVERTICAL1 IS '������-����������� ������� (���������� ����� �������� ������� �� ��������� 1-�� �����) - ���� ���� ����� 1, �� ���������� �� ��������� ����������� � ��� ����'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_DISTCENTERSBYVERTICAL2 IS '������-����������� ������� (���������� ����� �������� ������� �� ��������� 2-�� �����)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FP_VELOCITYKACHTYPE1 IS '������-����������� ������� (��� �������� ������� ��� 1-�� �����. 0 - ����������; 1 - ����������) - ���� ���� ����� 1, �� ��� �������� ������� ����������� � ��� ����'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FP_VELOCITYKACHTYPE2 IS '������-����������� ������� (��� �������� ������� ��� 2-�� �����. 0 - ����������; 1 - ����������)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_VELOCITYKACH1 IS '������-����������� ������� (�������� ������� 1-�� �����) - ���� ���� ����� 1, �� �������� ������� ����������� � ��� ����'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_VELOCITYKACH2 IS '������-����������� ������� (�������� ������� 2-�� �����)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_ANGLE IS '������-����������� ������� (���� ������� �����. ��� ����� ���������)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_AMPLITUDE IS '������-����������� ������� (���������)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_EFFECT IS '������������� ������� (id �� ����� asu.tsmid � ��������� LUCHTERAPIYA_EFFECTLECH)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_STANDARTID IS 'TSTANDART.FK_ID   (ID ���� ���)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_HEALIDS IS '���� �����, ������������� ��� ����� - ����� ���� ��������� (������������� ����� ������� FK_ID �� THEAL)'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FL_SHABLON IS '������: 0 - �������� ���� ������� �������, 1 - ������ ����� ������� �������'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FK_OWNERVRACHID IS '������: ������������, ��������� ������'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FC_NAME IS '������: ������������ �������'
/

COMMENT ON COLUMN ASU.TLUCHTERAP.FL_FORALL IS '������: 0 - ���������������� ������ (���������� � �������������/������� ������ ��������), 1 - �������� ���� ������������� (���������� ��� ������������, �������������/������� ������ ��������)'
/


--
-- TLUCHTERAP_BI  (Trigger) 
--
--  Dependencies: 
--   TLUCHTERAP (Table)
--
CREATE OR REPLACE TRIGGER ASU.TLUCHTERAP_BI
  before insert ON ASU.TLUCHTERAP   REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  select asu.seq_tluchterap.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


