DROP TRIGGER ASU.TVAC_PEOPLE#UL#$AU
/

--
-- TVAC_PEOPLE#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_people
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_vaccin  CONSTANT NUMBER := 15;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    IF :new.fn_num <> :old.fn_num THEN

      v_fc_desc :=
          '[����:] ����� - "' || :new.fn_num ||
          '", ������ - "' || :old.fn_num || '". ';
    END IF;

    IF :new.fd_create <> :old.fd_create THEN

      v_fc_desc := v_fc_desc ||
          '[���� ��������:] ����� - "' ||
          TO_CHAR(:new.fd_create, 'DD.MM.YYYY') ||
          '", ������ - "' || TO_CHAR(:old.fd_create, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fk_unit <> :old.fk_unit THEN

      v_fc_desc := v_fc_desc ||
          '[��.���.:] ����� - "' || :new.fk_unit ||
          '", ������ - "' || :old.fk_unit || '". ';
    END IF;

    IF :new.fn_status <> :old.fn_status THEN

      v_fc_desc := v_fc_desc ||
          '[������:] ����� - "' || :new.fn_status ||
          '", ������ - "' || :old.fn_status || '". ';
    END IF;

    IF :new.fc_organization <> :old.fc_organization THEN

      v_fc_desc := v_fc_desc ||
          '[��, ����������� ��������:] ����� - "' || :new.fc_organization ||
          '", ������ - "' || :old.fc_organization || '". ';
    END IF;

    IF :new.fc_vrach_fio <> :old.fc_vrach_fio THEN

      v_fc_desc := v_fc_desc ||
          '[����:] ����� - "' || :new.fc_vrach_fio ||
          '", ������ - "' || :old.fc_vrach_fio || '". ';
    END IF;

    IF :new.fn_reaction <> :old.fn_reaction THEN

      v_fc_desc := v_fc_desc ||
          '[��� �������:] ����� - "' || :new.fn_reaction ||
          '", ������ - "' || :old.fn_reaction || '". ';
    END IF;

    IF :new.fk_vaccin_prep <> :old.fk_vaccin_prep THEN

      v_fc_desc := v_fc_desc ||
          '[��������:] ����� - "' || :new.fk_vaccin_prep ||
          '", ������ - "' || :old.fk_vaccin_prep || '". ';
    END IF;

    IF :new.fn_status_series <> :old.fn_status_series THEN

      v_fc_desc := v_fc_desc ||
          '[������ �����:] ����� - "' || :new.fn_status_series ||
          '", ������ - "' || :old.fn_status_series || '". ';
    END IF;

    IF :new.fk_input_type <> :old.fk_input_type THEN

      v_fc_desc := v_fc_desc ||
          '[������ ��������:] ����� - "' || :new.fk_input_type ||
          '", ������ - "' || :old.fk_input_type || '". ';
    END IF;

    IF :new.fc_sotr_fio <> :old.fc_sotr_fio THEN

      v_fc_desc := v_fc_desc ||
          '[�����������:] ����� - "' || :new.fc_sotr_fio ||
          '", ������ - "' || :old.fc_sotr_fio || '". ';
    END IF;

    IF :new.fk_otdel <> :old.fk_otdel THEN

      v_fc_desc := v_fc_desc ||
          '[���������:] ����� - "' || :new.fk_otdel ||
          '", ������ - "' || :old.fk_otdel || '". ';
    END IF;

    IF :new.fn_reaction_rubec <> :old.fn_reaction_rubec THEN

      v_fc_desc := v_fc_desc ||
          '[������ �����:] ����� - "' || :new.fn_reaction_rubec ||
          '", ������ - "' || :old.fn_reaction_rubec || '". ';
    END IF;

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_vaccin, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


