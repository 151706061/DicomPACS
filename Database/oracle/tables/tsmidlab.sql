DROP TABLE ASU.TSMIDLAB CASCADE CONSTRAINTS
/

--
-- TSMIDLAB  (Table) 
--
CREATE TABLE ASU.TSMIDLAB
(
  FK_ID    NUMBER(15)                           NOT NULL,
  FP_BOLD  NUMBER(1)                            DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON TABLE ASU.TSMIDLAB IS '������� ������������ ���������� ��� TSMID'
/

COMMENT ON COLUMN ASU.TSMIDLAB.FK_ID IS '���'
/

COMMENT ON COLUMN ASU.TSMIDLAB.FP_BOLD IS '� ����������� ������� ������ ������ �������'
/


--
-- TSMID_LAB_ID  (Index) 
--
--  Dependencies: 
--   TSMIDLAB (Table)
--
CREATE UNIQUE INDEX ASU.TSMID_LAB_ID ON ASU.TSMIDLAB
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


-- 
-- Non Foreign Key Constraints for Table TSMIDLAB 
-- 
ALTER TABLE ASU.TSMIDLAB ADD (
  CONSTRAINT TSMID_LAB_ID
 UNIQUE (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

