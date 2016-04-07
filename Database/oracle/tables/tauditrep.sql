DROP TABLE ASU.TAUDITREP CASCADE CONSTRAINTS
/

--
-- TAUDITREP  (Table) 
--
CREATE TABLE ASU.TAUDITREP
(
  FD_INS       DATE                             DEFAULT sysdate               NOT NULL,
  FK_VRACHID   NUMBER                           NOT NULL,
  FK_PACID     NUMBER                           NOT NULL,
  FK_RAZDELID  NUMBER                           NOT NULL,
  FC_COMMENT   VARCHAR2(4000 BYTE),
  FC_TERMINAL  VARCHAR2(4000 BYTE),
  FK_OBJID     NUMBER(15)                       DEFAULT -1
)
TABLESPACE LOG
PCTUSED    0
PCTFREE    0
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          6560K
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

COMMENT ON TABLE ASU.TAUDITREP IS 'Список окон, открываемых врачами'
/

COMMENT ON COLUMN ASU.TAUDITREP.FD_INS IS 'Дата открытия'
/

COMMENT ON COLUMN ASU.TAUDITREP.FK_VRACHID IS 'Код открывшего врача (fk_appid)'
/

COMMENT ON COLUMN ASU.TAUDITREP.FK_PACID IS 'С каким пациентом работал'
/

COMMENT ON COLUMN ASU.TAUDITREP.FK_RAZDELID IS 'Код редактируемого разбела ИБ (тип отчёта: 1-печатные формы, 2-Учетные формы,3-отчёты, 4 - эпикризы, осомтры, 5 - просмотр ИБ)'
/

COMMENT ON COLUMN ASU.TAUDITREP.FC_COMMENT IS 'Системный комментарий'
/

COMMENT ON COLUMN ASU.TAUDITREP.FC_TERMINAL IS 'Название машины'
/

COMMENT ON COLUMN ASU.TAUDITREP.FK_OBJID IS 'Код объекта(для FK_RAZDELID = 5 - fk_appsotrid)'
/


--
-- TAUDITREP  (Index) 
--
--  Dependencies: 
--   TAUDITREP (Table)
--
CREATE INDEX ASU.TAUDITREP ON ASU.TAUDITREP
(FK_PACID)
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
-- TAUDITREP_BY_VRACHID  (Index) 
--
--  Dependencies: 
--   TAUDITREP (Table)
--
CREATE INDEX ASU.TAUDITREP_BY_VRACHID ON ASU.TAUDITREP
(FK_VRACHID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2432K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TAUDITREP$FD_INS  (Index) 
--
--  Dependencies: 
--   TAUDITREP (Table)
--
CREATE INDEX ASU.TAUDITREP$FD_INS ON ASU.TAUDITREP
(FD_INS)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3120K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TAUDITREP_LOG  (Trigger) 
--
--  Dependencies: 
--   TAUDITREP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAUDITREP_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TAUDITREP  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
/*
  created by Spasskiy S.N.
  для логирования действий просмотра ИБ Врачами
*/
  if INSERTING  and :new.FK_RAZDELID = 5 then
    PKG_LOG.Do_log('TAUDITREP', 'FC_COMMENT', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FC_COMMENT), :new.FK_PACID);
    PKG_LOG.Do_log('TAUDITREP', 'FK_VRACHID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_VRACHID), :new.FK_PACID);
    PKG_LOG.Do_log('TAUDITREP', 'FK_PACID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PACID), :new.FK_PACID);
    PKG_LOG.Do_log('TAUDITREP', 'FK_OBJID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_OBJID), :new.FK_PACID);
  end if;

END TAUDITREP_LOG;
/
SHOW ERRORS;


