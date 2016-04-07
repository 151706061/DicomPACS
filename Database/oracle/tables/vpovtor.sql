DROP TABLE ASU.VPOVTOR CASCADE CONSTRAINTS
/

--
-- VPOVTOR  (Table) 
--
CREATE TABLE ASU.VPOVTOR
(
  FK_SMID     NUMBER(9)                         NOT NULL,
  FD_DATE     DATE,
  FN_COUNT    NUMBER,
  FN_CONTROL  NUMBER,
  FN_SAN      NUMBER,
  FK_RAZDID   NUMBER,
  FK_OTDELID  NUMBER
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

