DROP INDEX ASU.TNAZN_BY_PEPLID
/

--
-- TNAZN_BY_PEPLID  (Index) 
--
CREATE INDEX ASU.TNAZN_BY_PEPLID ON ASU.TNAZN
(FK_PAC_ID)
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


