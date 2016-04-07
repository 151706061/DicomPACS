DROP INDEX ASU.I_SMID_TOOTH_ID
/

--
-- I_SMID_TOOTH_ID  (Index) 
--
CREATE INDEX ASU.I_SMID_TOOTH_ID ON ASU.TSMID_TOOTH
(FK_ID)
LOGGING
TABLESPACE SYSTEM
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


