DROP TRIGGER ASU.TVAC_MAP#UL#$AI
/

--
-- TVAC_MAP#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVAC_MAP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_MAP#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_map
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_vac_map    CONSTANT NUMBER := 4;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    v_fc_desc := '[Организация:] "' || :new.fk_organization ||
        '". [Дата изменения об организации:] "' ||
        TO_CHAR(:new.fd_organization, 'DD.MM.YYYY') ||
        '". [Участок:] "' || :new.fk_area ||
        '". [ЛПУ:] "' || :new.fk_organization_lpy ||
        '". [Класс:] "' || :new.fk_class ||
        '". [Дата постановки на учет:] "' ||
        TO_CHAR(:new.fd_beg, 'DD.MM.YYYY') ||
        '". [Дата снятия с учета:] "' ||
        TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
        '". [Буква класса:] "' || :new.fc_class_liter || '"';

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_vac_map, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


