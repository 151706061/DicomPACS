DROP INDEX ASU.TDISTRICT_PACIENT_PK
/

--
-- TDISTRICT_PACIENT_PK  (Index) 
--
CREATE UNIQUE INDEX ASU.TDISTRICT_PACIENT_PK ON ASU.TDISTRICT_PACIENT
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/

