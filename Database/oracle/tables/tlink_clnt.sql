DROP TABLE ASU.TLINK_CLNT CASCADE CONSTRAINTS
/

--
-- TLINK_CLNT  (Table) 
--
CREATE TABLE ASU.TLINK_CLNT
(
  FK_ID       NUMBER                            NOT NULL,
  FD_CRATE    DATE,
  FD_DUMP     DATE,
  FC_SCHEMA   VARCHAR2(30 BYTE),
  FC_COMMAND  VARCHAR2(4000 BYTE),
  FN_KEYID    NUMBER,
  FN_NEW      NUMBER,
  FD_NEW      DATE,
  FH_NEW      VARCHAR2(4000 BYTE),
  FC_NEW      CLOB,
  FB_NEW      BLOB
)
TABLESPACE LOG
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1040K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
LOB (FC_NEW) STORE AS 
      ( TABLESPACE  LOG 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE LOG
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          128K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (FB_NEW) STORE AS 
      ( TABLESPACE  LOG 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE LOG
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          128K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TLINK_CLNT IS '��������� ������� by TimurLan'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FK_ID IS '���'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FD_CRATE IS '����� �������� ������'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FD_DUMP IS '����� ��������/������� ������'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FC_SCHEMA IS '�������� �����'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FC_COMMAND IS '�������, ��������� ��� ������'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FN_KEYID IS '�������� ���� (FK_ID)'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FN_NEW IS '�������� ����: NUMBER'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FD_NEW IS '�������� ����: DATE'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FH_NEW IS '�������� ����: VARCHAR'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FC_NEW IS '�������� ����: CLOB'
/

COMMENT ON COLUMN ASU.TLINK_CLNT.FB_NEW IS '�������� ����: BLOB'
/


--
-- TLINK_CLNT_BY_ID  (Index) 
--
--  Dependencies: 
--   TLINK_CLNT (Table)
--
CREATE INDEX ASU.TLINK_CLNT_BY_ID ON ASU.TLINK_CLNT
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1040K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


