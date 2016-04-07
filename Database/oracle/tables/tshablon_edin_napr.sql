DROP TABLE ASU.TSHABLON_EDIN_NAPR CASCADE CONSTRAINTS
/

--
-- TSHABLON_EDIN_NAPR  (Table) 
--
CREATE TABLE ASU.TSHABLON_EDIN_NAPR
(
  FK_ID      NUMBER(15)                         NOT NULL,
  FK_SOTRID  NUMBER(15),
  FC_NAME    VARCHAR2(100 BYTE),
  FC_TEXT    VARCHAR2(4000 BYTE)
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

COMMENT ON TABLE ASU.TSHABLON_EDIN_NAPR IS 'Шаблоны для поля Обоснование для Единого бланка направления. Author: SLusarenko M.D.'
/

COMMENT ON COLUMN ASU.TSHABLON_EDIN_NAPR.FK_SOTRID IS 'Сотрудник, который добавил шаблон.'
/

COMMENT ON COLUMN ASU.TSHABLON_EDIN_NAPR.FC_NAME IS 'Название шаблона.'
/

COMMENT ON COLUMN ASU.TSHABLON_EDIN_NAPR.FC_TEXT IS 'Текст шаблона.'
/


--
-- TSHABLON_EDIN_NAPR_BI  (Trigger) 
--
--  Dependencies: 
--   TSHABLON_EDIN_NAPR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSHABLON_EDIN_NAPR_BI" 
  before insert on asu.TSHABLON_EDIN_NAPR
  REFERENCING NEW AS NEW OLD AS OLD
  for each row
begin
  select SEQ_TSHABLON_EDIN_NAPR.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


