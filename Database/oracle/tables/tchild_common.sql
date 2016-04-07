ALTER TABLE ASU.TCHILD_COMMON
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TCHILD_COMMON CASCADE CONSTRAINTS
/

--
-- TCHILD_COMMON  (Table) 
--
CREATE TABLE ASU.TCHILD_COMMON
(
  FK_PEPLID   NUMBER                            NOT NULL,
  FK_DIAGID   NUMBER,
  FD_AMBUL    DATE,
  FD_STAC     DATE,
  FD_SONAT    DATE,
  FD_DATE     DATE                              NOT NULL,
  FK_VRACHID  NUMBER                            NOT NULL,
  FK_HLIFEID  NUMBER                            DEFAULT 0                     NOT NULL,
  FN_HEALTH   NUMBER                            DEFAULT 4                     NOT NULL,
  FC_ALKO     CHAR(1 BYTE),
  FC_TABAK    CHAR(1 BYTE),
  FC_NARKO    CHAR(1 BYTE),
  FD_SPEC     DATE,
  FD_DSTAC    DATE
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

COMMENT ON TABLE ASU.TCHILD_COMMON IS '����� ������ ��� ��������������� ����� -- Created by Galtsev I.A. - 17/05/2010'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FK_PEPLID IS 'ID ������� = TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FK_DIAGID IS 'ID �������� �������� = TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FD_AMBUL IS '���� ������������� �������'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FD_STAC IS '���� ������� � ����������'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FD_SONAT IS '���� ������� � ���������'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FD_DATE IS '���� ��������/���������� ������'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FK_VRACHID IS 'ID �����, ����������/������������ ������'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FK_HLIFEID IS 'ID ������� �������� �������� = TSMID.FK_ID ��� FK_OWNER=ASU.get_synid(''CHILD_HARDLIFE_TYPE'')'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FN_HEALTH IS '������ �������� (�� 1 �� 4; 4 - ������)'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FC_ALKO IS '''Y'' - ������ ����� ��������������� ��������'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FC_TABAK IS '''Y'' - ������ ����� ��������������� ��������'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FC_NARKO IS '''Y'' - ������ ����� ��������������� �����������'
/


--
-- TCHILD_PEOPL  (Index) 
--
--  Dependencies: 
--   TCHILD_COMMON (Table)
--
CREATE UNIQUE INDEX ASU.TCHILD_PEOPL ON ASU.TCHILD_COMMON
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
-- Non Foreign Key Constraints for Table TCHILD_COMMON 
-- 
ALTER TABLE ASU.TCHILD_COMMON ADD (
  CONSTRAINT TCHILD_PEOPL
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

