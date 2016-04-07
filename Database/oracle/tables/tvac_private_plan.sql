ALTER TABLE ASU.TVAC_PRIVATE_PLAN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_PRIVATE_PLAN CASCADE CONSTRAINTS
/

--
-- TVAC_PRIVATE_PLAN  (Table) 
--
--  Dependencies: 
--   TINFECTION (Table)
--   TVAC_PEOPLE (Table)
--   TVAC_PLAN_STATUS (Table)
--
CREATE TABLE ASU.TVAC_PRIVATE_PLAN
(
  FK_ID                     INTEGER             NOT NULL,
  FK_INFECTION              INTEGER             NOT NULL,
  FK_PEOPLE                 INTEGER             NOT NULL,
  FK_STATUS                 INTEGER             NOT NULL,
  FD_PLAN_DATE              DATE                NOT NULL,
  FN_KRATN                  INTEGER             NOT NULL,
  FN_NOT_VACCIN             NUMBER(1)           DEFAULT 0,
  FN_NOT_EXIST_PREV_VACCIN  NUMBER(1)           DEFAULT 0,
  FN_VACCIN_PERIOD          NUMBER              DEFAULT 0,
  FK_VAC_PEOPLE             NUMBER              DEFAULT 0,
  FK_SOTR                   NUMBER              DEFAULT 0
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
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TVAC_PRIVATE_PLAN IS 'Индивидуальный план пациента. Author: rca'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FK_ID IS 'SEQUENCE=[SEQ_VAC_PRIVATE_PLAN]'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FK_INFECTION IS 'Инфекция, против которой планируется прививка'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FK_PEOPLE IS 'Пациент'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FK_STATUS IS 'Статус'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FD_PLAN_DATE IS 'Запланированная дата вакцинации'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FN_KRATN IS 'Кратность'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FN_NOT_VACCIN IS '1-если соблюдается условие: "Ранее не прививались"'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FN_NOT_EXIST_PREV_VACCIN IS '1-если соблюдается условие: "Не прививались в предыдущий период"'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FN_VACCIN_PERIOD IS '> 0, если прививка планируется от даты последней вакцинации.'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FK_VAC_PEOPLE IS 'Ссылка на сделанную прививку'
/

COMMENT ON COLUMN ASU.TVAC_PRIVATE_PLAN.FK_SOTR IS 'Ссылка на сотрудника, кто последний менял индивидуальный план'
/


--
-- PK_TVAC_PRIVATE_PLAN  (Index) 
--
--  Dependencies: 
--   TVAC_PRIVATE_PLAN (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_PRIVATE_PLAN ON ASU.TVAC_PRIVATE_PLAN
(FK_ID)
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
-- PRIVATE_PLAN_BY_INFECTION  (Index) 
--
--  Dependencies: 
--   TVAC_PRIVATE_PLAN (Table)
--
CREATE INDEX ASU.PRIVATE_PLAN_BY_INFECTION ON ASU.TVAC_PRIVATE_PLAN
(FK_INFECTION)
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
-- PRIVATE_PLAN_BY_INF_PEOPLE_KR  (Index) 
--
--  Dependencies: 
--   TVAC_PRIVATE_PLAN (Table)
--
CREATE UNIQUE INDEX ASU.PRIVATE_PLAN_BY_INF_PEOPLE_KR ON ASU.TVAC_PRIVATE_PLAN
(FK_INFECTION, FK_PEOPLE, FN_KRATN)
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
-- TVAC_PRIVATE_PLAN$BI  (Trigger) 
--
--  Dependencies: 
--   TVAC_PRIVATE_PLAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PRIVATE_PLAN$BI" 
 BEFORE
  INSERT
 ON asu.tvac_private_plan
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
    --  Column "FK_ID" uses sequence SEQ_VAC_PRIVATE_PLAN
    SELECT SEQ_VAC_PRIVATE_PLAN.NEXTVAL INTO :new.FK_ID FROM dual;
END;
/
SHOW ERRORS;


--
-- TVAC_PRIVATE_PLAN#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   TVAC_PRIVATE_PLAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PRIVATE_PLAN#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_private_plan
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_plan    CONSTANT NUMBER := 18;
  c_fk_plan_source    CONSTANT NUMBER := 2;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    IF USER_LOG.PKG_LOG_MNG.IS_GROUP_ACTION THEN

      USER_LOG.PKG_LOG_MNG.ADD_GROUP_ACTION_LOG(
          :new.fk_people, 'tpeoples');
    ELSE

      -- Формируем desc для log.
      IF :new.fk_infection <> :old.fk_infection THEN

        v_fc_desc :=
            '[Инфекция:] новая - "' || :new.fk_infection ||
            '", старая - "' || :old.fk_infection || '". ';
      END IF;

      IF :new.fd_plan_date <> :old.fd_plan_date THEN

        v_fc_desc := v_fc_desc ||
            '[Дата:] новая - "' ||
            TO_CHAR(:new.fd_plan_date, 'DD.MM.YYYY') ||
            '", старая - "' ||
            TO_CHAR(:old.fd_plan_date, 'DD.MM.YYYY') || '". ';
      END IF;

      IF :new.fk_status <> :old.fk_status THEN

        v_fc_desc := v_fc_desc ||
            '[Статус:] новый - "' || :new.fk_status ||
            '", старый - "' || :old.fk_status || '". ';
      END IF;

      IF :new.fn_kratn <> :old.fn_kratn THEN

        v_fc_desc := v_fc_desc ||
            '[Кратность:] новая - "' || :new.fn_kratn ||
            '", старая - "' || :old.fn_kratn || '". ';
      END IF;

      IF :new.fn_vaccin_period <> :old.fn_vaccin_period THEN

        v_fc_desc := v_fc_desc ||
            '[Период:] новый - "' || :new.fn_vaccin_period ||
            '", старый - "' || :old.fn_vaccin_period || '". ';
      END IF;

      IF :new.fk_vac_people <> :old.fk_vac_people THEN

        v_fc_desc := v_fc_desc ||
            '[Ссылка на прививку:] новая - "' || :new.fk_vac_people ||
            '", старая - "' || :old.fk_vac_people || '". ';
      END IF;

      IF :new.fk_sotr <> :old.fk_sotr THEN

        v_fc_desc := v_fc_desc ||
            '[Кто внес последние изменения:] новая - "' || :new.fk_sotr ||
            '", старая - "' || :old.fk_sotr || '". ';
      END IF;

      -- Добавляем в лог.
      v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
          c_fk_update_plan, c_fk_plan_source, SYSDATE, v_fc_desc);

      USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
          v_fk_user_msg_log, :new.fk_people, 'tpeoples');
    END IF;
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_PRIVATE_PLAN#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   TVAC_PRIVATE_PLAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PRIVATE_PLAN#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_private_plan
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_plan      CONSTANT NUMBER := 17;
  c_fk_plan_source   CONSTANT NUMBER := 2;
  v_fk_user_msg_log  NUMBER;
  v_fc_desc          VARCHAR2(4000);

BEGIN

  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    IF USER_LOG.PKG_LOG_MNG.IS_GROUP_ACTION THEN

      USER_LOG.PKG_LOG_MNG.ADD_GROUP_ACTION_LOG(
          :new.fk_people, 'tpeoples');
    ELSE

      -- Формируем desc для log.
      v_fc_desc := '[Инфекция:] "' || :new.fk_infection ||
          '". [Дата:] "' ||
          TO_CHAR(:new.fd_plan_date, 'DD.MM.YYYY') ||
          '". [Статус:] "' || :new.fk_status ||
          '". [Кратность:] "' || :new.fn_kratn ||
          '". [Период:] "' || :new.fn_vaccin_period ||
          '". [Ссылка на прививку:] "' || :new.fk_vac_people ||
          '". [Кто внес последние изменения:] "' || :new.fk_sotr || '"';

      -- Добавляем в лог.
      v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
          c_fk_add_plan, c_fk_plan_source, SYSDATE, v_fc_desc);

      USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
          v_fk_user_msg_log, :new.fk_people, 'tpeoples');
    END IF;
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_PRIVATE_PLAN#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   TVAC_PRIVATE_PLAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PRIVATE_PLAN#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_private_plan
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_del_plan      CONSTANT NUMBER := 19;
  c_fk_plan_source   CONSTANT NUMBER := 2;
  v_fk_user_msg_log  NUMBER;
  v_fc_desc          VARCHAR2(4000);

BEGIN

  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    IF USER_LOG.PKG_LOG_MNG.IS_GROUP_ACTION THEN

      USER_LOG.PKG_LOG_MNG.ADD_GROUP_ACTION_LOG(
          :old.fk_people, 'tpeoples');
    ELSE

      -- Формируем desc для log.
      v_fc_desc := '[Инфекция:] "' || :old.fk_infection ||
          '". [Дата:] "' ||
          TO_CHAR(:old.fd_plan_date, 'DD.MM.YYYY') ||
          '". [Статус:] "' || :old.fk_status ||
          '". [Кратность:] "' || :old.fn_kratn ||
          '". [Период:] "' || :old.fn_vaccin_period ||
          '". [Ссылка на прививку:] "' || :old.fk_vac_people ||
          '". [Кто внес последние изменения:] "' || :old.fk_sotr || '"';

      -- Добавляем в лог.
      v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
          c_fk_del_plan, c_fk_plan_source, SYSDATE, v_fc_desc);

      USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
          v_fk_user_msg_log, :old.fk_people, 'tpeoples');
    END IF;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_PRIVATE_PLAN 
-- 
ALTER TABLE ASU.TVAC_PRIVATE_PLAN ADD (
  CONSTRAINT PK_TVAC_PRIVATE_PLAN
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

-- 
-- Foreign Key Constraints for Table TVAC_PRIVATE_PLAN 
-- 
ALTER TABLE ASU.TVAC_PRIVATE_PLAN ADD (
  CONSTRAINT FK_TVAC_PRIVATE_PLAN$INFECTION 
 FOREIGN KEY (FK_INFECTION) 
 REFERENCES ASU.TINFECTION (FK_ID)
    ON DELETE CASCADE,
  CONSTRAINT FK_TVAC_PRIVATE_PLAN$STATUS 
 FOREIGN KEY (FK_STATUS) 
 REFERENCES ASU.TVAC_PLAN_STATUS (FK_ID),
  CONSTRAINT FK_TVAC_PRIVATE_PLAN$TVAC_PEO 
 FOREIGN KEY (FK_VAC_PEOPLE) 
 REFERENCES ASU.TVAC_PEOPLE (FK_ID) DISABLE)
/

