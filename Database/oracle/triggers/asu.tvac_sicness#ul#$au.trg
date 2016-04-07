DROP TRIGGER ASU.TVAC_SICNESS#UL#$AU
/

--
-- TVAC_SICNESS#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TVAC_SICNESS (Table)
--   PKG_LOG_MNG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_SICNESS#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_sicness
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_sicness CONSTANT NUMBER := 12;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    IF :new.fk_infection <> :old.fk_infection THEN

      v_fc_desc :=
          '[Инфекция:] новая - "' || :new.fk_infection ||
          '", старая - "' || :old.fk_infection || '". ';
    END IF;

    IF :new.fd_end <> :old.fd_end THEN

      v_fc_desc := v_fc_desc ||
          '[Дата заболевания:] новая - "' ||
          TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
          '", старая - "' || TO_CHAR(:old.fd_end, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fc_rem <> :old.fc_rem THEN

      v_fc_desc := v_fc_desc ||
          '[Примечание:] новое - "' || :new.fc_rem ||
          '", старое - "' || :old.fc_rem || '". ';
    END IF;

    IF :new.fc_lpy <> :old.fc_lpy THEN

      v_fc_desc := v_fc_desc ||
          '[ЛПУ:] новое - "' || :new.fc_lpy ||
          '", старое - "' || :old.fc_lpy || '". ';
    END IF;

    IF :new.fc_vrach <> :old.fc_vrach THEN

      v_fc_desc := v_fc_desc ||
          '[Врач:] новый - "' || :new.fc_vrach ||
          '", старый - "' || :old.fc_vrach || '". ';
    END IF;

    IF :new.fk_icd <> :old.fk_icd THEN

      v_fc_desc := v_fc_desc ||
          '[ICD:] новый - "' || :new.fk_icd ||
          '", старый - "' || :old.fk_icd || '". ';
    END IF;

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_sicness, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


