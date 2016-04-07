ALTER TABLE ASU.TSLPERIOD
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSLPERIOD CASCADE CONSTRAINTS
/

--
-- TSLPERIOD  (Table) 
--
CREATE TABLE ASU.TSLPERIOD
(
  FK_ID            NUMBER                       NOT NULL,
  FK_SLINFOID      NUMBER,
  FK_PACID         NUMBER,
  FK_DISABILITYID  NUMBER,
  FK_REGIMENID     NUMBER,
  FK_ORGID         NUMBER,
  FK_SOTRID        NUMBER,
  FD_BEGIN         DATE,
  FD_END           DATE,
  FL_DEL           NUMBER                       DEFAULT 0,
  FC_DISABILITY    VARCHAR2(255 BYTE),
  FN_AGE           NUMBER,
  FN_SEX           NUMBER,
  FC_PEPL          VARCHAR2(255 BYTE),
  FK_VKID          NUMBER                       DEFAULT 0,
  FK_ZAVID         NUMBER                       DEFAULT 0,
  FK_RELATIVE      NUMBER,
  FK_OSMOTR        NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          240K
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

COMMENT ON TABLE ASU.TSLPERIOD IS 'Информация о периодах продления листка нетрудоспособности'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_PACID IS 'Код истории болезни'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_DISABILITYID IS 'Код вида нетрудоспособности'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_REGIMENID IS 'Код режима'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_ORGID IS 'Код организации, выдавшей листок\продлившей листок'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_SOTRID IS 'Код врача, выдавшего листок\продлившего листок'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FD_BEGIN IS 'Начало срока продления'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FD_END IS 'Окончание срока продления'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FL_DEL IS 'Признак удаления'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FC_DISABILITY IS 'Строковое значение нетрудоспособности'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FN_AGE IS 'Возраст сопровождающего'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FN_SEX IS 'Пол сопровождающего'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FC_PEPL IS 'Описание сопровождающего'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_VKID IS 'Код врача, продлившего ЛН на КЭК'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_ZAVID IS 'Зав. отделением'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_RELATIVE IS 'Степень родства'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_OSMOTR IS 'Осмотр, на котором был добавлен период ЛН (VNAZ.FK_ID) Add by Neronov A. 23082011'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_ID IS 'SEQUENCE=[SEQ_TSLPERIOD]'
/

COMMENT ON COLUMN ASU.TSLPERIOD.FK_SLINFOID IS 'Код бланка'
/


--
-- TSLPERIOD_INFO  (Index) 
--
--  Dependencies: 
--   TSLPERIOD (Table)
--
CREATE INDEX ASU.TSLPERIOD_INFO ON ASU.TSLPERIOD
(FK_SLINFOID)
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
-- TSLPERIOD_SOTR  (Index) 
--
--  Dependencies: 
--   TSLPERIOD (Table)
--
CREATE INDEX ASU.TSLPERIOD_SOTR ON ASU.TSLPERIOD
(FK_SOTRID)
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
-- TSLPERIOFD_PK  (Index) 
--
--  Dependencies: 
--   TSLPERIOD (Table)
--
CREATE UNIQUE INDEX ASU.TSLPERIOFD_PK ON ASU.TSLPERIOD
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
-- TSLPERIOD_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSLPERIOD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSLPERIOD_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TSLPERIOD   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_TSLPERIOD.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSLPERIOD 
-- 
ALTER TABLE ASU.TSLPERIOD ADD (
  CONSTRAINT TSLPERIOFD_PK
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

