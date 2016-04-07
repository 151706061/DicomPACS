DROP TRIGGER ASU.TVAC_PEOPLES_TEST#UL#$AU
/

--
-- TVAC_PEOPLES_TEST#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVAC_PEOPLES_TEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLES_TEST#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_peoples_test
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_test    CONSTANT NUMBER := 9;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    IF :new.fd_create <> :old.fd_create THEN

      v_fc_desc :=
          '[Дата взятия пробы:] новая - "' ||
          TO_CHAR(:new.fd_create, 'DD.MM.YYYY') ||
          '", старая - "' ||
          TO_CHAR(:old.fd_create, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fk_vac_test_res <> :old.fk_vac_test_res THEN

      v_fc_desc := v_fc_desc ||
          '[Реакция:] новая - "' || :new.fk_vac_test_res ||
          '", старая - "' || :old.fk_vac_test_res || '". ';
    END IF;

    IF :new.fc_reaction <> :old.fc_reaction THEN

      v_fc_desc := v_fc_desc ||
          '[Реакция:] новая - "' || :new.fc_reaction ||
          '", старая - "' || :old.fc_reaction || '". ';
    END IF;

    IF :new.fk_vac_test <> :old.fk_vac_test THEN

      v_fc_desc := v_fc_desc ||
          '[Проба:] новая - "' || :new.fk_vac_test ||
          '", старая - "' || :old.fk_vac_test || '". ';
    END IF;

    IF :new.fc_vrach <> :old.fc_vrach THEN

      v_fc_desc := v_fc_desc ||
          '[Врач:] новый - "' || :new.fc_vrach ||
          '", старый - "' || :old.fc_vrach || '". ';
    END IF;

    IF :new.fc_lpy <> :old.fc_lpy THEN

      v_fc_desc := v_fc_desc ||
          '[ЛПУ:] новое - "' || :new.fc_lpy ||
          '", старое - "' || :old.fc_lpy || '". ';
    END IF;

    IF :new.fc_sotr <> :old.fc_sotr THEN

      v_fc_desc := v_fc_desc ||
          '[ФИО исполнителя:] новая - "' || :new.fc_sotr ||
          '", старая - "' || :old.fc_sotr || '". ';
    END IF;

    IF :new.fd_reg <> :old.fd_reg THEN

      v_fc_desc := v_fc_desc ||
          '[Дата учета:] новая - "' || TO_CHAR(:new.fd_reg, 'DD.MM.YYYY') ||
          '", старая - "' || TO_CHAR(:old.fd_reg, 'DD.MM.YYYY') || '". ';
    END IF;

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_test, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


