ALTER TABLE ASU.TPATRONAT
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPATRONAT CASCADE CONSTRAINTS
/

--
-- TPATRONAT  (Table) 
--
CREATE TABLE ASU.TPATRONAT
(
  FK_PEPLID   NUMBER                            NOT NULL,
  FD_LASTM    DATE,
  FC_TOTAL    CHAR(1 BYTE)                      DEFAULT 'Y'                   NOT NULL,
  FC_REASON   VARCHAR2(256 BYTE),
  FK_GROUPID  NUMBER,
  FD_DATE     DATE                              NOT NULL,
  FK_VRACHID  NUMBER                            NOT NULL
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

COMMENT ON TABLE ASU.TPATRONAT IS '���������� � ��������� ��������� ���������� -- Created by Galtsev I.A. 11/05/2010'
/

COMMENT ON COLUMN ASU.TPATRONAT.FK_PEPLID IS 'ID ���������� = TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TPATRONAT.FD_LASTM IS '���� ��������� ����������� (��� ������� ����� ������������)'
/

COMMENT ON COLUMN ASU.TPATRONAT.FC_TOTAL IS '������ �������� = ''Y'', �� ������ = ''N'', ��� ��������� = ''A'''
/

COMMENT ON COLUMN ASU.TPATRONAT.FC_REASON IS '�������� �������, ���� �������� �� ������ ��� �����������'
/

COMMENT ON COLUMN ASU.TPATRONAT.FK_GROUPID IS 'ID ������ ����� = TSMID.FK_ID (TSMID.FK_OWNER=asu.get_synid(''PREGNANT_RISK_GRP''))'
/

COMMENT ON COLUMN ASU.TPATRONAT.FD_DATE IS '���� ��������/���������� ������'
/

COMMENT ON COLUMN ASU.TPATRONAT.FK_VRACHID IS 'ID ����� = TSOTR.FK_ID ����������/����������� ������'
/


--
-- TPATRONAT_FD_DATE  (Index) 
--
--  Dependencies: 
--   TPATRONAT (Table)
--
CREATE INDEX ASU.TPATRONAT_FD_DATE ON ASU.TPATRONAT
(FD_DATE)
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
-- TPATRONAT_PEOPLE  (Index) 
--
--  Dependencies: 
--   TPATRONAT (Table)
--
CREATE UNIQUE INDEX ASU.TPATRONAT_PEOPLE ON ASU.TPATRONAT
(FK_PEPLID)
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
-- Non Foreign Key Constraints for Table TPATRONAT 
-- 
ALTER TABLE ASU.TPATRONAT ADD (
  CONSTRAINT TPATRONAT_PEOPLE
 PRIMARY KEY
 (FK_PEPLID)
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

