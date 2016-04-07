DROP TABLE ASU.TWORKSTATION CASCADE CONSTRAINTS
/

--
-- TWORKSTATION  (Table) 
--
CREATE TABLE ASU.TWORKSTATION
(
  FK_ID           NUMBER                        NOT NULL,
  FC_TERMINAL     VARCHAR2(255 BYTE),
  FC_IP           VARCHAR2(255 BYTE),
  FD_DATE         DATE,
  FL_NEEDEXP      NUMBER(1),
  FC_DESCRIPTION  VARCHAR2(255 BYTE),
  FC_CLOB         CLOB
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
LOB (FC_CLOB) STORE AS 
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

COMMENT ON COLUMN ASU.TWORKSTATION.FK_ID IS 'SEQUENCE=[SEQ_TWORKSTATION]'
/

COMMENT ON COLUMN ASU.TWORKSTATION.FC_TERMINAL IS 'Имя компьютера'
/

COMMENT ON COLUMN ASU.TWORKSTATION.FC_IP IS 'ИП компа'
/

COMMENT ON COLUMN ASU.TWORKSTATION.FD_DATE IS 'При NeedExp = 1 - дата запроса на экспорт, 0 -  дата выполнения экспорта'
/

COMMENT ON COLUMN ASU.TWORKSTATION.FL_NEEDEXP IS 'Есть запрос на экспорт. 1- есть запрос.'
/

COMMENT ON COLUMN ASU.TWORKSTATION.FC_DESCRIPTION IS 'Описание компа (компьютер лаборатории...)'
/

COMMENT ON COLUMN ASU.TWORKSTATION.FC_CLOB IS 'Последний полученный отчет'
/


--
-- TWORKSTATION_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TWORKSTATION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TWORKSTATION_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tworkstation
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT asu.seq_tworkstation.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


