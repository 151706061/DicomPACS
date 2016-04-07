DROP INDEX ASU.TMSG_PK
/

--
-- TMSG_PK  (Index) 
--
CREATE UNIQUE INDEX ASU.TMSG_PK ON ASU.TMSG
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


