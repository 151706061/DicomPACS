DROP INDEX ASU.TPERESEL_LOG_BY_PACID
/

--
-- TPERESEL_LOG_BY_PACID  (Index) 
--
CREATE INDEX ASU.TPERESEL_LOG_BY_PACID ON ASU.TPERESEL_LOG
(FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/

