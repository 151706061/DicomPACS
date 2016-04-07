ALTER TABLE ASU.TVAC_CANCEL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_CANCEL CASCADE CONSTRAINTS
/

--
-- TVAC_CANCEL  (Table) 
--
--  Dependencies: 
--   TVACCANCEL_TYPE (Table)
--
CREATE TABLE ASU.TVAC_CANCEL
(
  FK_ID      INTEGER                            NOT NULL,
  FK_TYPE    INTEGER                            NOT NULL,
  FD_BEG     DATE                               NOT NULL,
  FD_END     DATE,
  FK_PEOPLE  INTEGER                            NOT NULL,
  FK_VRACH   NUMBER                             DEFAULT -1                    NOT NULL,
  FC_REM     VARCHAR2(4000 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          40K
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

COMMENT ON TABLE ASU.TVAC_CANCEL IS 'Отводы'
/

COMMENT ON COLUMN ASU.TVAC_CANCEL.FK_ID IS 'SEQUENCE=[SEQ_VAC_CANCEL]'
/

COMMENT ON COLUMN ASU.TVAC_CANCEL.FK_TYPE IS 'ТИП отвода:ссылка на TVACCANCEL_TYPE'
/

COMMENT ON COLUMN ASU.TVAC_CANCEL.FD_BEG IS 'Дата начала действия отвода'
/

COMMENT ON COLUMN ASU.TVAC_CANCEL.FD_END IS 'Дата окончания действия отвода'
/

COMMENT ON COLUMN ASU.TVAC_CANCEL.FK_VRACH IS 'Врач'
/

COMMENT ON COLUMN ASU.TVAC_CANCEL.FC_REM IS 'Примечания'
/


--
-- IX_TVAC_CANCEL_FK_PEOPLE  (Index) 
--
--  Dependencies: 
--   TVAC_CANCEL (Table)
--
CREATE INDEX ASU.IX_TVAC_CANCEL_FK_PEOPLE ON ASU.TVAC_CANCEL
(FK_PEOPLE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- IX_TVAC_CANCEL_FK_TYPE  (Index) 
--
--  Dependencies: 
--   TVAC_CANCEL (Table)
--
CREATE INDEX ASU.IX_TVAC_CANCEL_FK_TYPE ON ASU.TVAC_CANCEL
(FK_TYPE)
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
-- PK_TVAC_CANCEL  (Index) 
--
--  Dependencies: 
--   TVAC_CANCEL (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_CANCEL ON ASU.TVAC_CANCEL
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVAC_CANCEL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL_BEFORE_INSERT" BEFORE INSERT
ON ASU.TVAC_CANCEL FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_CANCEL
      IF :NEW.FK_ID IS NULL
      THEN
         SELECT SEQ_VAC_CANCEL.NEXTVAL INTO :NEW.FK_ID from dual;
      END IF;
end;
/
SHOW ERRORS;


--
-- TVAC_CANCEL_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL_AFTER_UPDATE" 
 AFTER
  UPDATE
 ON asu.tvac_cancel
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
WHEN (
((new.fk_type != old.fk_type) OR
 (new.fd_beg != old.fd_beg) OR
 (new.fd_end != old.fd_end))
      )
BEGIN
  PKG_VACCIN.SHIFT_PRIVATE_PLAN(
      :new.fk_people, :new.fk_type, :new.fd_beg, :new.fd_end);
END;
/
SHOW ERRORS;


--
-- TVAC_CANCEL_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL_AFTER_INSERT" 
 AFTER
  INSERT
 ON asu.tvac_cancel
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  PKG_VACCIN.SHIFT_PRIVATE_PLAN(
      :new.fk_people, :new.fk_type, :new.fd_beg, :new.fd_end);
END;
/
SHOW ERRORS;


--
-- TVAC_CANCEL#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_cancel
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_cancel  CONSTANT NUMBER := 3;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_name           VARCHAR2(255);
  v_fc_permanent      VARCHAR2(16);
  v_fc_desc           VARCHAR2(4000);

BEGIN

  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    IF :new.fk_type <> :old.fk_type THEN
      SELECT fc_name
        INTO v_fc_name
        FROM tvaccancel_type
       WHERE fk_id = :old.fk_type;

       v_fc_desc := '[Вид:] ' ||
           'старый - "' || v_fc_name || '" новый - "';

      SELECT fc_name,
             DECODE(fn_permanent, 1, 'Постоянный',
                                  0, 'Временный')
        INTO v_fc_name, v_fc_permanent
        FROM tvaccancel_type
       WHERE fk_id = :new.fk_type;

       v_fc_desc := v_fc_desc ||  v_fc_name ||
           '". [Тип:] "' || v_fc_permanent || '".';
    END IF;

    IF :new.fd_beg <> :old.fd_beg THEN

      v_fc_desc := v_fc_desc || '[Начальная дата:] старая - "' ||
          TO_CHAR(:old.fd_beg, 'DD.MM.YYYY') || '", новая - "' ||
          TO_CHAR(:new.fd_beg, 'DD.MM.YYYY') || '".';
    END IF;

    IF (:new.fd_end <> :old.fd_end) OR (
        (:new.fd_end is null) AND (:old.fd_end is not null)) OR (
        (:new.fd_end is not null) AND (:old.fd_end is null)) THEN

      v_fc_desc := v_fc_desc || '[Конечная дата:] старая - "' ||
          TO_CHAR(:old.fd_end, 'DD.MM.YYYY') || '", новая - "' ||
          TO_CHAR(:new.fd_end, 'DD.MM.YYYY') || '".';
    END IF;

    IF :new.fc_rem <> :old.fc_rem THEN

      v_fc_desc := v_fc_desc || '[Примечание:] старое - "' ||
          :old.fc_rem || '", новое - "' || :new.fc_rem || '".';
    END IF;

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_cancel, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_CANCEL#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_cancel
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_cancel     CONSTANT NUMBER := 1;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_name           VARCHAR2(255);
  v_fc_permanent      VARCHAR2(16);
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    SELECT fc_name,
           DECODE(fn_permanent, 1, 'Постоянный',
                                0, 'Временный')
      INTO v_fc_name, v_fc_permanent
      FROM tvaccancel_type
      WHERE fk_id = :new.fk_type;

    v_fc_desc := '[Вид:] "' ||  v_fc_name ||
        '". [Начальная дата:] "' || TO_CHAR(:new.fd_beg, 'DD.MM.YYYY') ||
        '". [Конечная дата:] "' || TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
        '". [Тип:] "' || v_fc_permanent || '"';

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_cancel, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_CANCEL#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_cancel
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_del_cancel     CONSTANT NUMBER := 2;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_name           VARCHAR2(255);
  v_fc_permanent      VARCHAR2(16);
  v_fc_desc           VARCHAR2(255);

BEGIN

  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN
    -- Формируем desc для log.
    SELECT fc_name,
           DECODE(fn_permanent, 1, 'Постоянный',
                                0, 'Временный')
      INTO v_fc_name, v_fc_permanent
      FROM tvaccancel_type
     WHERE fk_id = :old.fk_type;

    v_fc_desc := '[Вид:] "' ||  v_fc_name ||
        '". [Начальная дата:] "' || TO_CHAR(:old.fd_beg, 'DD.MM.YYYY') ||
        '". [Конечная дата:] "' || TO_CHAR(:old.fd_end, 'DD.MM.YYYY') ||
        '". [Тип:] "' || v_fc_permanent || '"';

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_del_cancel, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :old.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_CANCEL 
-- 
ALTER TABLE ASU.TVAC_CANCEL ADD (
  CONSTRAINT PK_TVAC_CANCEL
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TVAC_CANCEL 
-- 
ALTER TABLE ASU.TVAC_CANCEL ADD (
  CONSTRAINT FK_TVAC_CANCEL$TVACCANCEL_TPE 
 FOREIGN KEY (FK_TYPE) 
 REFERENCES ASU.TVACCANCEL_TYPE (FK_ID))
/

