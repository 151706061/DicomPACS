DROP TRIGGER ASU.TVAC_SICNESS#UL#$AI
/

--
-- TVAC_SICNESS#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TVAC_SICNESS (Table)
--   PKG_LOG_MNG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_SICNESS#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_sicness
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_sicness    CONSTANT NUMBER := 10;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    v_fc_desc := '[Инфекция:] "' ||  :new.fk_infection ||
        '". [Дата заболевание:] "' || TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
        '". [Примечание:] "' || :new.fc_rem ||
        '". [ЛПУ:] "' || :new.fc_lpy ||
        '". [Врач:] "' || :new.fc_vrach ||
        '". [ICD:] "' || :new.fk_icd || '"';

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_sicness, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


