ALTER TABLE ASU.TSTANDART
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSTANDART CASCADE CONSTRAINTS
/

--
-- TSTANDART  (Table) 
--
CREATE TABLE ASU.TSTANDART
(
  FK_ID       NUMBER(6)                         NOT NULL,
  FC_RESULT   VARCHAR2(1024 BYTE),
  FK_RAZDEL   INTEGER                           NOT NULL,
  FC_NAME     VARCHAR2(500 BYTE)                NOT NULL,
  FC_REM      VARCHAR2(150 BYTE),
  FC_CODE     VARCHAR2(20 BYTE),
  FK_GROUPID  NUMBER,
  FL_DEL      NUMBER(1)                         DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          864K
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

COMMENT ON TABLE ASU.TSTANDART IS 'Стандарты лечения
Author: Ura'
/

COMMENT ON COLUMN ASU.TSTANDART.FK_ID IS 'SEQUENCE=[SEQ_STANDART]'
/

COMMENT ON COLUMN ASU.TSTANDART.FC_RESULT IS 'Требования к результатам лечения'
/

COMMENT ON COLUMN ASU.TSTANDART.FK_RAZDEL IS 'ссылка на раздел'
/

COMMENT ON COLUMN ASU.TSTANDART.FC_NAME IS 'Название, по умолчанию брать из МКБ'
/

COMMENT ON COLUMN ASU.TSTANDART.FC_REM IS 'Примечания'
/

COMMENT ON COLUMN ASU.TSTANDART.FC_CODE IS 'Шифр стандарта'
/

COMMENT ON COLUMN ASU.TSTANDART.FK_GROUPID IS 'TSTANDART_GROUP.FK_ID код группы'
/

COMMENT ON COLUMN ASU.TSTANDART.FL_DEL IS 'Признак "Удалено"=1'
/


--
-- I_TSTANDART_CODE_LAST  (Index) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE INDEX ASU.I_TSTANDART_CODE_LAST ON ASU.TSTANDART
(SUBSTR("FC_CODE",INSTR("FC_CODE",'.',1,5)+1,LENGTH("FC_CODE")))
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
-- I_TSTANDART_RAZDEL_CODE  (Index) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE INDEX ASU.I_TSTANDART_RAZDEL_CODE ON ASU.TSTANDART
(FK_RAZDEL, FC_CODE)
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
-- IX_TSTANDART$FC_NAME  (Index) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE INDEX ASU.IX_TSTANDART$FC_NAME ON ASU.TSTANDART
(FC_NAME)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          704K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- IX_TSTANDART$FK_RAZDEL  (Index) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE INDEX ASU.IX_TSTANDART$FK_RAZDEL ON ASU.TSTANDART
(FK_RAZDEL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- PK_TSTANDART  (Index) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE UNIQUE INDEX ASU.PK_TSTANDART ON ASU.TSTANDART
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSTANDART_CODE  (Index) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE INDEX ASU.TSTANDART_CODE ON ASU.TSTANDART
(UPPER("FC_CODE"))
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSTANDART_FK_GROUPID  (Index) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE INDEX ASU.TSTANDART_FK_GROUPID ON ASU.TSTANDART
(FK_GROUPID)
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
-- TSTANDART_NAME  (Index) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE INDEX ASU.TSTANDART_NAME ON ASU.TSTANDART
(UPPER("FC_NAME"))
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
-- TSTANDART$BI  (Trigger) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSTANDART$BI" before insert
on ASU.TSTANDART for each row
begin
    --  Column "FK_ID" uses sequence SEQ_STANDART
    if :new.FK_ID is null then
      select SEQ_STANDART.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSTANDART 
-- 
ALTER TABLE ASU.TSTANDART ADD (
  CONSTRAINT PK_TSTANDART
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          160K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSTANDART TO EXCHANGE
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSTANDART TO EXCH43
/

