ALTER TABLE ASU.TKARTA_PALAT
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TKARTA_PALAT CASCADE CONSTRAINTS
/

--
-- TKARTA_PALAT  (Table) 
--
CREATE TABLE ASU.TKARTA_PALAT
(
  FK_ID    NUMBER                               NOT NULL,
  FN_COL   NUMBER                               DEFAULT 0,
  FN_ROW   NUMBER                               DEFAULT 0,
  FK_ROOM  NUMBER,
  FC_KORP  VARCHAR2(100 BYTE)
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

COMMENT ON TABLE ASU.TKARTA_PALAT IS 'Таблица координат Карты палат by deemaric'
/

COMMENT ON COLUMN ASU.TKARTA_PALAT.FN_COL IS 'номер колонки'
/

COMMENT ON COLUMN ASU.TKARTA_PALAT.FN_ROW IS 'номер строки'
/

COMMENT ON COLUMN ASU.TKARTA_PALAT.FK_ROOM IS 'ссылка на комнату'
/

COMMENT ON COLUMN ASU.TKARTA_PALAT.FC_KORP IS 'синоним корпуса в  tsmini where fc_section = ''KARTA_PALAT'''
/


--
-- TKARTA_PALAT_BY_ID  (Index) 
--
--  Dependencies: 
--   TKARTA_PALAT (Table)
--
CREATE UNIQUE INDEX ASU.TKARTA_PALAT_BY_ID ON ASU.TKARTA_PALAT
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
-- TKARTA_PALAT_BEF_INS  (Trigger) 
--
--  Dependencies: 
--   TKARTA_PALAT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_PALAT_BEF_INS" 
  before insert on asu.TKarta_Palat
  REFERENCING OLD AS OLD NEW AS NEW
  for each row
begin

   SELECT SEQ_TKarta_Palat.NEXTVAL INTO :NEW.FK_ID FROM DUAL;

   :new.FC_KORP := upper(:new.FC_KORP);

end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TKARTA_PALAT 
-- 
ALTER TABLE ASU.TKARTA_PALAT ADD (
  CONSTRAINT TKARTA_PALAT_BY_ID
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

