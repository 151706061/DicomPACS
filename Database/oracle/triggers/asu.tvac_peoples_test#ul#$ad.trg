DROP TRIGGER ASU.TVAC_PEOPLES_TEST#UL#$AD
/

--
-- TVAC_PEOPLES_TEST#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVAC_PEOPLES_TEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLES_TEST#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_peoples_test
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_del_test       CONSTANT NUMBER := 8;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    v_fc_desc :=
        '[Дата взятия пробы:] "' || TO_CHAR(:old.fd_create, 'DD.MM.YYYY') ||
        '". [Реакция на пробу:] "' || :old.fk_vac_test_res ||
        '". [Описание:] "' || :old.fc_reaction ||
        '". [ID Пробы:] "' || :old.fk_vac_test ||
        '". [ФИО врача:] "' || :old.fc_vrach ||
        '". [ЛПУ:] "' || :old.fc_lpy ||
        '". [ФИО исполнителя:] "' || :old.fc_sotr ||
        '". [Дата учета:] "' || TO_CHAR(:old.fd_reg, 'DD.MM.YYYY') || '"';

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_del_test, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :old.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


