DROP TABLE ASU.TUPDATE_LOG CASCADE CONSTRAINTS
/

--
-- TUPDATE_LOG  (Table) 
--
CREATE TABLE ASU.TUPDATE_LOG
(
  FC_UPDATEID  VARCHAR2(20 BYTE)                NOT NULL,
  FD_CREATE    DATE                             DEFAULT SYSDATE,
  FC_NAME      VARCHAR2(100 BYTE),
  FC_PATH      VARCHAR2(300 BYTE),
  FC_PATH_LOG  VARCHAR2(300 BYTE)
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

COMMENT ON TABLE ASU.TUPDATE_LOG IS '����������, ���������� �� ��������� -- Created 20070828 by Linnikov'
/

COMMENT ON COLUMN ASU.TUPDATE_LOG.FC_UPDATEID IS 'ID'
/

COMMENT ON COLUMN ASU.TUPDATE_LOG.FD_CREATE IS '���� ���������� (�� ����������� �������)'
/

COMMENT ON COLUMN ASU.TUPDATE_LOG.FC_NAME IS '�������� ����������'
/

COMMENT ON COLUMN ASU.TUPDATE_LOG.FC_PATH IS '����, ����� �� ������� ���� ������ ����������'
/

COMMENT ON COLUMN ASU.TUPDATE_LOG.FC_PATH_LOG IS '����, �� �������� �������� ���� �� �����'
/


--
-- TUPDATE_LOG_PK  (Index) 
--
--  Dependencies: 
--   TUPDATE_LOG (Table)
--
CREATE INDEX ASU.TUPDATE_LOG_PK ON ASU.TUPDATE_LOG
(FC_UPDATEID)
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


