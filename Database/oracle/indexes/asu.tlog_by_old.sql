DROP INDEX ASU.TLOG_BY_OLD
/

--
-- TLOG_BY_OLD  (Index) 
--
CREATE INDEX ASU.TLOG_BY_OLD ON ASU.TLOG
(FC_OLD)
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


