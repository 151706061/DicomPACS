ALTER TABLE ASU.TPEOPLES_DOPSTATUS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPEOPLES_DOPSTATUS CASCADE CONSTRAINTS
/

--
-- TPEOPLES_DOPSTATUS  (Table) 
--
CREATE TABLE ASU.TPEOPLES_DOPSTATUS
(
  FK_ID            NUMBER(15)                   NOT NULL,
  FK_PEPLID        NUMBER(15)                   NOT NULL,
  FL_STATUS        NUMBER(1),
  FD_DATE          DATE,
  FL_TFOMS_STATUS  NUMBER(1),
  FC_TFOMS_REPLY   VARCHAR2(250 BYTE),
  FL_SOGLASIE      NUMBER(1),
  FD_SOGLDATE      DATE,
  FK_DOCTOR        VARCHAR2(12 BYTE)
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

COMMENT ON TABLE ASU.TPEOPLES_DOPSTATUS IS 'Статус прикрепления пациентов к ЛПУ и получения согласия на передачу мед. информации. Created by Ищуков С.С. - 06/05/2015'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS.FK_ID IS 'Первичный ключ'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS.FK_PEPLID IS 'Ссылка на TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS.FL_STATUS IS 'Статус прикрепления к ЛПУ: 1 - прикреплен, 0 - не прикреплен (откреплен)'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS.FD_DATE IS 'Дата прикрепления/открепления к ЛПУ'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS.FL_TFOMS_STATUS IS 'Статус обработки пациента на портале ТФОМС: 0 - не обрабатывался, 1 - успешно прикреплен, -1 - человек не найден на портале'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS.FC_TFOMS_REPLY IS 'Ответ веб-портала ТФОМС на запрос о смене статуса прикрепления пациента'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS.FL_SOGLASIE IS 'Статус согласия пациента на передачу медицинской информации о нем'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS.FD_SOGLDATE IS 'Дата последнего изменения статуса согласия'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS.FK_DOCTOR IS 'ID доктора (из LOGIN.TSOTR), к которому прикреплен человек'
/


--
-- PK_TPEOPLES_DOPSTATUS  (Index) 
--
--  Dependencies: 
--   TPEOPLES_DOPSTATUS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TPEOPLES_DOPSTATUS ON ASU.TPEOPLES_DOPSTATUS
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
-- TPEOPLES_DOPSTATUS_BEF_INS  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES_DOPSTATUS (Table)
--
CREATE OR REPLACE TRIGGER ASU.TPEOPLES_DOPSTATUS_BEF_INS
 BEFORE
 INSERT
 ON ASU.TPEOPLES_DOPSTATUS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  SELECT ASU.SEQ_TPEOPLES_DOPSTATUS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPEOPLES_DOPSTATUS 
-- 
ALTER TABLE ASU.TPEOPLES_DOPSTATUS ADD (
  CONSTRAINT PK_TPEOPLES_DOPSTATUS
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

