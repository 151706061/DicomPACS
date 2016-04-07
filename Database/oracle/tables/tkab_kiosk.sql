ALTER TABLE ASU.TKAB_KIOSK
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TKAB_KIOSK CASCADE CONSTRAINTS
/

--
-- TKAB_KIOSK  (Table) 
--
CREATE TABLE ASU.TKAB_KIOSK
(
  FK_ID       NUMBER                            NOT NULL,
  FC_NAME     VARCHAR2(30 BYTE),
  FN_FLOOR    NUMBER(3),
  FK_VRACHID  NUMBER(15)
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TKAB_KIOSK IS 'Список кабинетов для Терминала by deemaric'
/

COMMENT ON COLUMN ASU.TKAB_KIOSK.FC_NAME IS 'название (номер)'
/

COMMENT ON COLUMN ASU.TKAB_KIOSK.FN_FLOOR IS 'этаж'
/

COMMENT ON COLUMN ASU.TKAB_KIOSK.FK_VRACHID IS 'закрепленный врач'
/


--
-- TKAB_KIOSK_BY_ID  (Index) 
--
--  Dependencies: 
--   TKAB_KIOSK (Table)
--
CREATE UNIQUE INDEX ASU.TKAB_KIOSK_BY_ID ON ASU.TKAB_KIOSK
(FK_ID)
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


--
-- TKAB_KIOSK_BEF_INS  (Trigger) 
--
--  Dependencies: 
--   TKAB_KIOSK (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKAB_KIOSK_BEF_INS" 
  before insert on tkab_kiosk
  REFERENCING OLD AS OLD NEW AS NEW
  for each row
begin

 if :NEW.FK_ID is null then
  SELECT SEQ_tkab_kiosk.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
 end if;

end tkab_kiosk_bef_ins;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TKAB_KIOSK 
-- 
ALTER TABLE ASU.TKAB_KIOSK ADD (
  CONSTRAINT TKAB_KIOSK_BY_ID
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

