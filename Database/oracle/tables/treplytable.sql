DROP TABLE ASU.TREPLYTABLE CASCADE CONSTRAINTS
/

--
-- TREPLYTABLE  (Table) 
--
CREATE TABLE ASU.TREPLYTABLE
(
  FK_ID          NUMBER(15)                     NOT NULL,
  FC_ASK         VARCHAR2(50 BYTE)              NOT NULL,
  FC_ASKFIELD    VARCHAR2(50 BYTE)              NOT NULL,
  FC_ASKID       VARCHAR2(50 BYTE)              NOT NULL,
  FC_REPLY       VARCHAR2(50 BYTE)              NOT NULL,
  FC_REPLYFIELD  VARCHAR2(50 BYTE)              NOT NULL,
  FC_REPLYID     VARCHAR2(50 BYTE)              NOT NULL,
  FK_MULTI       NUMBER(15)                     DEFAULT 0                     NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TREPLYTABLE IS 'Таблицы для настройки соотвтетсвий на цены Author:Efimov'
/

COMMENT ON COLUMN ASU.TREPLYTABLE.FK_ID IS 'asu.seq_CostConf'
/

COMMENT ON COLUMN ASU.TREPLYTABLE.FC_ASK IS 'таблица-вопрос (каждому вопросу соотвтетсвует только дин ответ, но один ответ может быть на несколько вопросов)'
/

COMMENT ON COLUMN ASU.TREPLYTABLE.FC_ASKFIELD IS 'название поля сопоставления в таблице-вопросе'
/

COMMENT ON COLUMN ASU.TREPLYTABLE.FC_ASKID IS 'значание поля сопоставления в таблице-вопросе'
/

COMMENT ON COLUMN ASU.TREPLYTABLE.FC_REPLY IS 'таблица-ответ'
/

COMMENT ON COLUMN ASU.TREPLYTABLE.FC_REPLYFIELD IS 'название поля сопоставления в таблице-ответе'
/

COMMENT ON COLUMN ASU.TREPLYTABLE.FC_REPLYID IS 'значание поля сопоставления в таблице-ответе'
/

COMMENT ON COLUMN ASU.TREPLYTABLE.FK_MULTI IS '0 - на один вопрос всегда должен быть только один ответ, если отношение многие ко многим сюда записывается FK_ID'
/


--
-- I_TREPLYTABLE_A_BY_R  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE (Table)
--
CREATE INDEX ASU.I_TREPLYTABLE_A_BY_R ON ASU.TREPLYTABLE
(FC_ASK, FC_ASKFIELD, FC_REPLY, FC_REPLYFIELD, FC_REPLYID)
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
-- I_TREPLYTABLE_R_BY_A  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE (Table)
--
CREATE UNIQUE INDEX ASU.I_TREPLYTABLE_R_BY_A ON ASU.TREPLYTABLE
(FC_REPLY, FC_REPLYFIELD, FC_ASK, FC_ASKFIELD, FC_ASKID, 
FK_MULTI)
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
-- I_TREPLYTABLE_TABLES  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE (Table)
--
CREATE INDEX ASU.I_TREPLYTABLE_TABLES ON ASU.TREPLYTABLE
(FC_ASK, FC_REPLY)
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
-- K_TREPLYTABLE_ID  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE (Table)
--
CREATE INDEX ASU.K_TREPLYTABLE_ID ON ASU.TREPLYTABLE
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
-- TREPLYTABLE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TREPLYTABLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TREPLYTABLE_INSERT" 
 BEFORE
  INSERT
 ON ASU.TREPLYTABLE REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT asu.SEQ_TREPLYTABLE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  if :NEW.FK_MULTI = 1 then
    SELECT :NEW.FK_ID INTO :NEW.FK_MULTI FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


