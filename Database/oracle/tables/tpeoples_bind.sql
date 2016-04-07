ALTER TABLE ASU.TPEOPLES_BIND
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPEOPLES_BIND CASCADE CONSTRAINTS
/

--
-- TPEOPLES_BIND  (Table) 
--
CREATE TABLE ASU.TPEOPLES_BIND
(
  FK_ID              NUMBER(15)                 NOT NULL,
  FK_PEPLID          NUMBER(15)                 NOT NULL,
  FK_SOTRID          NUMBER(15),
  FL_STATUS          NUMBER(1)                  DEFAULT 1                     NOT NULL,
  FD_DATE            DATE                       DEFAULT sysdate               NOT NULL,
  FD_USERDATE        DATE                       DEFAULT sysdate               NOT NULL,
  FL_TFOMS_STATUS    NUMBER(1)                  DEFAULT 0                     NOT NULL,
  FC_TFOMS_REPLY     VARCHAR2(250 BYTE),
  FK_SOTRID_PRINT    NUMBER(15),
  FD_USERDATE_PRINT  DATE
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1M
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

COMMENT ON TABLE ASU.TPEOPLES_BIND IS 'История прикрепления пациентов к ЛПУ. Created by Ищуков С.С. - 13/02/2015'
/

COMMENT ON COLUMN ASU.TPEOPLES_BIND.FK_ID IS 'Первичный ключ'
/

COMMENT ON COLUMN ASU.TPEOPLES_BIND.FK_PEPLID IS 'Ссылка на ID человека'
/

COMMENT ON COLUMN ASU.TPEOPLES_BIND.FK_SOTRID IS 'Ссылка на ID регистратора ЛПУ'
/

COMMENT ON COLUMN ASU.TPEOPLES_BIND.FL_STATUS IS 'Статус прикрепления: 1 - прикреплен (по умолчанию), 0 - не прикреплен (откреплен)'
/

COMMENT ON COLUMN ASU.TPEOPLES_BIND.FD_DATE IS 'Дата прикрепления/открепления'
/

COMMENT ON COLUMN ASU.TPEOPLES_BIND.FD_USERDATE IS 'Дата нажатия регистратором на кнопку "Прикрепить/Открепить"'
/

COMMENT ON COLUMN ASU.TPEOPLES_BIND.FL_TFOMS_STATUS IS 'Статус обработки пациента на портале ТФОМС: 0 - не обрабатывался, 1 - успешно прикреплен, -1 - человек не найден на портале'
/

COMMENT ON COLUMN ASU.TPEOPLES_BIND.FK_SOTRID_PRINT IS 'Ссылка на ID сотрудника, последним распечатавшего заявление на прикрепление'
/

COMMENT ON COLUMN ASU.TPEOPLES_BIND.FD_USERDATE_PRINT IS 'Дата печати заявления на прикрепление'
/


--
-- PK_TPEOPLES_BIND  (Index) 
--
--  Dependencies: 
--   TPEOPLES_BIND (Table)
--
CREATE UNIQUE INDEX ASU.PK_TPEOPLES_BIND ON ASU.TPEOPLES_BIND
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
-- TPEOPLES_BIND_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES_BIND (Table)
--
CREATE OR REPLACE TRIGGER ASU.TPEOPLES_BIND_BEFORE_INSERT
 BEFORE
 INSERT
 ON ASU.TPEOPLES_BIND  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  SELECT ASU.SEQ_TPEOPLES_BIND.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPEOPLES_BIND 
-- 
ALTER TABLE ASU.TPEOPLES_BIND ADD (
  CONSTRAINT PK_TPEOPLES_BIND
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

