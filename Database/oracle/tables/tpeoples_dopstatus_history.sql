DROP TABLE ASU.TPEOPLES_DOPSTATUS_HISTORY CASCADE CONSTRAINTS
/

--
-- TPEOPLES_DOPSTATUS_HISTORY  (Table) 
--
--  Dependencies: 
--   TPEOPLES_DOPSTATUS (Table)
--
CREATE TABLE ASU.TPEOPLES_DOPSTATUS_HISTORY
(
  FK_DOPSTATUS     NUMBER(15)                   NOT NULL,
  FK_SOTRID        NUMBER(15),
  FN_TYPE          NUMBER(2)                    NOT NULL,
  FL_STATUS        NUMBER(1),
  FD_DATE          DATE,
  FL_TFOMS_STATUS  NUMBER(1),
  FC_TFOMS_REPLY   VARCHAR2(250 BYTE),
  FL_SOGLASIE      NUMBER(1),
  FD_USERDATE      DATE                         DEFAULT SYSDATE               NOT NULL,
  FK_DOCTOR        NUMBER(15)
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

COMMENT ON TABLE ASU.TPEOPLES_DOPSTATUS_HISTORY IS 'Таблица истории совершенных над человеком действий в плане смены статуса прикрепления и получения согласия на передачу мед. информации. Created by Ищуков С.С. - 6/05/2015'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FK_DOPSTATUS IS 'Ссылка на TPEOPLES_DOPSTATUS.FK_ID'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FK_SOTRID IS 'Ссылка на ID регистратора ЛПУ'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FN_TYPE IS 'Тип операции: 1 - изменение статуса прикрепления человека; 11 - распечатка согласия на прикрепление; 2 - изменение статуса согласия на передачу мед. информации; 22 - распечатка этого согласия; 3 - прикрепление из XML-загрузчика; 4 - прикрепление с помощью службы портала ТФОМС.'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FL_STATUS IS 'Статус прикрепления к ЛПУ: 1 - прикреплен, 0 - не прикреплен (откреплен)'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FD_DATE IS 'Дата прикрепления/открепления'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FL_TFOMS_STATUS IS 'Статус обработки пациента на портале ТФОМС: 0 - не обрабатывался, 1 - успешно прикреплен, -1 - человек не найден на портале'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FC_TFOMS_REPLY IS 'Ответ веб-портала ТФОМС на запрос о смене статуса прикрепления пациента'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FL_SOGLASIE IS 'Статус согласия на передачу мед. информации: 1 - согласие дано; 0 - согласие не дано'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FD_USERDATE IS 'Дата совершения действия регистратором ЛПУ или службой прикрепления/программой массовой загрузки'
/

COMMENT ON COLUMN ASU.TPEOPLES_DOPSTATUS_HISTORY.FK_DOCTOR IS 'ID доктора (из LOGIN.TSOTR), к которому прикреплен человек'
/


-- 
-- Foreign Key Constraints for Table TPEOPLES_DOPSTATUS_HISTORY 
-- 
ALTER TABLE ASU.TPEOPLES_DOPSTATUS_HISTORY ADD (
  CONSTRAINT FK_DOPSTATUS_HISTORY 
 FOREIGN KEY (FK_DOPSTATUS) 
 REFERENCES ASU.TPEOPLES_DOPSTATUS (FK_ID)
    ON DELETE CASCADE)
/

