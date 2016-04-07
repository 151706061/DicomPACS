DROP INDEX ASU.PK_TPROFACTOR_PERIODS
/

--
-- PK_TPROFACTOR_PERIODS  (Index) 
--
CREATE UNIQUE INDEX ASU.PK_TPROFACTOR_PERIODS ON ASU.TPROFACTOR_PERIODS
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/

