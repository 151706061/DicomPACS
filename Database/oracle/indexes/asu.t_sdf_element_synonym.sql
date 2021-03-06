DROP INDEX ASU.T_SDF_ELEMENT_SYNONYM
/

--
-- T_SDF_ELEMENT_SYNONYM  (Index) 
--
CREATE UNIQUE INDEX ASU.T_SDF_ELEMENT_SYNONYM ON ASU.T_SDF_ELEMENT
(FC_SYNONYM)
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


