DROP TABLE ASU.TKLADR_140626 CASCADE CONSTRAINTS
/

--
-- TKLADR_140626  (Table) 
--
CREATE TABLE ASU.TKLADR_140626
(
  FK_ID      NUMBER,
  FC_NAME    VARCHAR2(40 BYTE)                  NOT NULL,
  FC_CODE    VARCHAR2(17 BYTE)                  NOT NULL,
  FC_PREFIX  VARCHAR2(10 BYTE),
  FL_DEL     NUMBER                             NOT NULL,
  FK_OWNER   NUMBER                             NOT NULL,
  FN_LEVEL   NUMBER                             NOT NULL,
  FC_OKATO   VARCHAR2(11 BYTE)
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


