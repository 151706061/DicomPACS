DROP INDEX ASU.TDIAG_ID
/

--
-- TDIAG_ID  (Index) 
--
CREATE INDEX ASU.TDIAG_ID ON ASU.TDIAG
(FK_ID)
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


