DROP TABLE ASU.TREPLYTABLE_ELSELOG CASCADE CONSTRAINTS
/

--
-- TREPLYTABLE_ELSELOG  (Table) 
--
CREATE TABLE ASU.TREPLYTABLE_ELSELOG
(
  FK_ID          NUMBER(15)                     NOT NULL,
  FC_ASK         VARCHAR2(50 BYTE)              NOT NULL,
  FC_ASKFIELD    VARCHAR2(50 BYTE)              NOT NULL,
  FC_ASKID       VARCHAR2(50 BYTE),
  FC_REPLY       VARCHAR2(50 BYTE)              NOT NULL,
  FC_REPLYFIELD  VARCHAR2(50 BYTE)              NOT NULL,
  FC_OWNER       VARCHAR2(50 BYTE),
  FC_OWNERFIELD  VARCHAR2(50 BYTE),
  FC_OWNERID     VARCHAR2(50 BYTE),
  FC_OWNERFILL   VARCHAR2(50 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TREPLYTABLE_ELSELOG IS 'Таблицы для настройки соотвтетсвий на цены Author:Efimov'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FK_ID IS 'asu.seq_CostConf'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_ASK IS 'таблица-вопрос (каждому вопросу соотвтетсвует только дин ответ, но один ответ может быть на несколько вопросов)'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_ASKFIELD IS 'название поля сопоставления в таблице-вопросе'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_ASKID IS 'значание поля сопоставления в таблице-вопросе'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_REPLY IS 'таблица-ответ'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_REPLYFIELD IS 'название поля сопоставления в таблице-ответе'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_OWNER IS 'Таблица-вледелец, т.е. таблица, ради заполнения которой происходит поиск ответа, необязательный параметр наличие которого связано с тем, что поиск ответов предназначен прежде всего для решения задачи выгрузки, где таблица-владелец есть всегда'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_OWNERFIELD IS 'Название поля в таблице-владельце, по которому можно найти заполняемую строку'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_OWNERID IS 'Значение поля в таблице-владельце, по которому можно найти заполняемую строку'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_OWNERFILL IS 'Название заполняемого поля в таблице-владельце'
/


--
-- I_TREPLYTABLE_ELSELOG_R_BY_A_O  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE_ELSELOG (Table)
--
CREATE INDEX ASU.I_TREPLYTABLE_ELSELOG_R_BY_A_O ON ASU.TREPLYTABLE_ELSELOG
(FC_REPLY, FC_REPLYFIELD, FC_ASK, FC_ASKFIELD, FC_ASKID, 
FC_OWNER, FC_OWNERFIELD)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- I_TREPLYTABLE_ELSELOG_TABLES  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE_ELSELOG (Table)
--
CREATE INDEX ASU.I_TREPLYTABLE_ELSELOG_TABLES ON ASU.TREPLYTABLE_ELSELOG
(FC_ASK, FC_REPLY)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- K_TREPLYTABLE_ELSELOG_ID  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE_ELSELOG (Table)
--
CREATE INDEX ASU.K_TREPLYTABLE_ELSELOG_ID ON ASU.TREPLYTABLE_ELSELOG
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TREPLYTABLE_ELSELOG_INSERT  (Trigger) 
--
--  Dependencies: 
--   TREPLYTABLE_ELSELOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TREPLYTABLE_ELSELOG_INSERT" 
 BEFORE
  INSERT
 ON ASU.TREPLYTABLE_ELSELOG REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT asu.SEQ_TREPLYTABLE_ELSELOG.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


