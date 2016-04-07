DROP TABLE ASU.TNAZTYPE CASCADE CONSTRAINTS
/

--
-- TNAZTYPE  (Table) 
--
CREATE TABLE ASU.TNAZTYPE
(
  FK_ID    NUMBER(3)                            NOT NULL,
  FC_NAME  VARCHAR2(20 BYTE)
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


--
-- TNAZTYPE_ID  (Index) 
--
--  Dependencies: 
--   TNAZTYPE (Table)
--
CREATE UNIQUE INDEX ASU.TNAZTYPE_ID ON ASU.TNAZTYPE
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


