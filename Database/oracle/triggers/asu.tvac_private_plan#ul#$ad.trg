DROP TRIGGER ASU.TVAC_PRIVATE_PLAN#UL#$AD
/

--
-- TVAC_PRIVATE_PLAN#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
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


