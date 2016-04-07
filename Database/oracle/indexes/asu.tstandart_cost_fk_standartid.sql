DROP INDEX ASU.TSTANDART_COST_FK_STANDARTID
/

--
-- TSTANDART_COST_FK_STANDARTID  (Index) 
--
CREATE INDEX ASU.TSTANDART_COST_FK_STANDARTID ON ASU.TSTANDART_COST
(FK_STANDARTID)
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

