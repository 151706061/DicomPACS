DROP TABLE ASU.TVRACHMS CASCADE CONSTRAINTS
/

--
-- TVRACHMS  (Table) 
--
CREATE TABLE ASU.TVRACHMS
(
  FK_VRACHID  NUMBER                            NOT NULL,
  FK_MS       NUMBER                            NOT NULL
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


