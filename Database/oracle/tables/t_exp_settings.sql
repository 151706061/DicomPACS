ALTER TABLE ASU.T_EXP_SETTINGS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.T_EXP_SETTINGS CASCADE CONSTRAINTS
/

--
-- T_EXP_SETTINGS  (Table) 
--
CREATE TABLE ASU.T_EXP_SETTINGS
(
  FK_ID       NUMBER                            NOT NULL,
  FC_NAME     VARCHAR2(200 BYTE)                NOT NULL,
  FC_SYNONYM  VARCHAR2(50 BYTE)                 NOT NULL,
  FC_DATA     CLOB
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
LOB (FC_DATA) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE USR
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          64K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.T_EXP_SETTINGS IS 'Таблица хранения настроек модуля экспорта/импорта данных по пацинту(ам)'
/

COMMENT ON COLUMN ASU.T_EXP_SETTINGS.FK_ID IS 'Ключ'
/

COMMENT ON COLUMN ASU.T_EXP_SETTINGS.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.T_EXP_SETTINGS.FC_SYNONYM IS 'Синоним'
/

COMMENT ON COLUMN ASU.T_EXP_SETTINGS.FC_DATA IS 'Данные'
/


--
-- IDX_EXP_SETTINGS_SYNONYM  (Index) 
--
--  Dependencies: 
--   T_EXP_SETTINGS (Table)
--
CREATE INDEX ASU.IDX_EXP_SETTINGS_SYNONYM ON ASU.T_EXP_SETTINGS
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


--
-- PK_EXP_SETTINGS  (Index) 
--
--  Dependencies: 
--   T_EXP_SETTINGS (Table)
--
CREATE UNIQUE INDEX ASU.PK_EXP_SETTINGS ON ASU.T_EXP_SETTINGS
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
-- TRG_EXP_SETTINGS_BI  (Trigger) 
--
--  Dependencies: 
--   T_EXP_SETTINGS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRG_EXP_SETTINGS_BI" 
  before insert on asu.t_exp_settings
  for each row
declare
  -- local variables here
begin
  select seq_exp_main.nextval
    into :new.fk_id
    from dual;
end trg_exp_settings_bi;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table T_EXP_SETTINGS 
-- 
ALTER TABLE ASU.T_EXP_SETTINGS ADD (
  CONSTRAINT PK_EXP_SETTINGS
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

