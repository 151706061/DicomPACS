DROP TABLE ASU.TANALTEMPLATE CASCADE CONSTRAINTS
/

--
-- TANALTEMPLATE  (Table) 
--
CREATE TABLE ASU.TANALTEMPLATE
(
  FK_ID      NUMBER,
  FC_NAME    VARCHAR2(255 BYTE),
  FB_CLOB    CLOB,
  FK_SOTRID  NUMBER
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
LOB (FB_CLOB) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
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

COMMENT ON TABLE ASU.TANALTEMPLATE IS 'ШАблоны заключений Лаборатории Author:Kulbatsky'
/

COMMENT ON COLUMN ASU.TANALTEMPLATE.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TANALTEMPLATE.FC_NAME IS 'НАименование шаблона'
/

COMMENT ON COLUMN ASU.TANALTEMPLATE.FB_CLOB IS 'Текст шаблона'
/


--
-- TANALTEMPLATE_SOTRID  (Index) 
--
--  Dependencies: 
--   TANALTEMPLATE (Table)
--
CREATE INDEX ASU.TANALTEMPLATE_SOTRID ON ASU.TANALTEMPLATE
(FK_SOTRID)
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
-- TANALTEMPLATE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TANALTEMPLATE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TANALTEMPLATE_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TANALTEMPLATE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  if :new.fk_id is null then
    select asu.seq_tanaltemplate.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


