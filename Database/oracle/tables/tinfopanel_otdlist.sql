ALTER TABLE ASU.TINFOPANEL_OTDLIST
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TINFOPANEL_OTDLIST CASCADE CONSTRAINTS
/

--
-- TINFOPANEL_OTDLIST  (Table) 
--
CREATE TABLE ASU.TINFOPANEL_OTDLIST
(
  FK_ID        NUMBER,
  FK_OTDID     NUMBER,
  FP_TYPE      NUMBER(1),
  FC_PAGENAME  VARCHAR2(50 BYTE)
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

COMMENT ON TABLE ASU.TINFOPANEL_OTDLIST IS 'Список отделений для информационной панели поликлиники'
/

COMMENT ON COLUMN ASU.TINFOPANEL_OTDLIST.FK_OTDID IS 'totdel.fk_id'
/

COMMENT ON COLUMN ASU.TINFOPANEL_OTDLIST.FP_TYPE IS '0-участковое; 1-специалисты '
/


--
-- TINFOPANEL_OTDLIST_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TINFOPANEL_OTDLIST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINFOPANEL_OTDLIST_BEFORE_INS" 
before insert on tinfopanel_otdlist
for each row
begin
  select seq_tinfopanel_otdlist.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


--
-- TINFOPANEL_OTDLIST_BEFORE_DEL  (Trigger) 
--
--  Dependencies: 
--   TINFOPANEL_OTDLIST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINFOPANEL_OTDLIST_BEFORE_DEL" before delete 
on tinfopanel_otdlist
for each row
begin
  delete from tinfopanel_data where fk_pageid=:old.fk_id;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TINFOPANEL_OTDLIST 
-- 
ALTER TABLE ASU.TINFOPANEL_OTDLIST ADD (
  PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

