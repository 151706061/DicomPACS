DROP INDEX ASU.TUSL_RENTAB_HEALID
/

--
-- TUSL_RENTAB_HEALID  (Index) 
--
CREATE INDEX ASU.TUSL_RENTAB_HEALID ON ASU.TUSL_RENTAB
(FK_HEALID)
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

