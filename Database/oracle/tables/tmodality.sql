DROP TABLE ASU.TMODALITY CASCADE CONSTRAINTS
/

--
-- TMODALITY  (Table) 
--
CREATE TABLE ASU.TMODALITY
(
  FK_ID    NUMBER                               NOT NULL,
  FC_NAME  VARCHAR2(10 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- TMODALITY_UID  (Index) 
--
--  Dependencies: 
--   TMODALITY (Table)
--
CREATE UNIQUE INDEX ASU.TMODALITY_UID ON ASU.TMODALITY
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


--
-- TMODALITY_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TMODALITY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMODALITY_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tmodality
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tmodality.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


