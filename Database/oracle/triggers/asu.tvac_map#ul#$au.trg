DROP TRIGGER ASU.TVAC_MAP#UL#$AU
/

--
-- TVAC_MAP#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVAC_MAP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_MAP#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_map
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_vac_map CONSTANT NUMBER := 6;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    IF :new.fk_organization <> :old.fk_organization THEN

      v_fc_desc :=
          '[Организация:] новая - "' || :new.fk_organization ||
          '", старая - "' || :old.fk_organization || '". ';
    END IF;

    IF :new.fd_organization <> :old.fd_organization THEN

      v_fc_desc := v_fc_desc ||
          '[Дата изменения об организации:] новая - "' ||
          TO_CHAR(:new.fk_organization, 'DD.MM.YYYY') ||
          '", старая - "' ||
          TO_CHAR(:old.fk_organization, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fk_area <> :old.fk_area THEN

      v_fc_desc := v_fc_desc ||
          '[Участок:] новый - "' || :new.fk_area ||
          '", старый - "' || :old.fk_area || '". ';
    END IF;

    IF :new.fk_organization_lpy <> :old.fk_organization_lpy THEN

      v_fc_desc := v_fc_desc ||
          '[ЛПУ:] новое - "' || :new.fk_organization_lpy ||
          '", старое - "' || :old.fk_organization_lpy || '". ';
    END IF;

    IF :new.fk_class <> :old.fk_class THEN

      v_fc_desc := v_fc_desc ||
          '[Класс:] новый - "' || :new.fk_class ||
          '", старый - "' || :old.fk_class || '". ';
    END IF;

    IF :new.fd_beg <> :old.fd_beg THEN

      v_fc_desc := v_fc_desc ||
          '[Дата постановки на учет:] новая - "' ||
          TO_CHAR(:new.fd_beg, 'DD.MM.YYYY') ||
          '", старая - "' ||
          TO_CHAR(:old.fd_beg, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fd_end <> :old.fd_end THEN

      v_fc_desc := v_fc_desc ||
          '[Дата снятия с учета:] новая - "' ||
          TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
          '", старая - "' ||
          TO_CHAR(:old.fd_end, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fc_class_liter <> :old.fc_class_liter THEN

      v_fc_desc := v_fc_desc ||
          '[Буква класса:] новая - "' || :new.fc_class_liter ||
          '", старая - "' || :old.fc_class_liter || '". ';
    END IF;

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_vac_map, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


