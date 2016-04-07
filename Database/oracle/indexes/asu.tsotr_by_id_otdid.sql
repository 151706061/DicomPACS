DROP INDEX ASU.TSOTR_BY_ID_OTDID
/

--
-- TSOTR_BY_ID_OTDID  (Index) 
--
CREATE INDEX ASU.TSOTR_BY_ID_OTDID ON ASU.TSOTR1
(FK_ID, FK_OTDID)
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

