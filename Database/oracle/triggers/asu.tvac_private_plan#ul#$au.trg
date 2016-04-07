DROP TRIGGER ASU.TVAC_PRIVATE_PLAN#UL#$AU
/

--
-- TVAC_PRIVATE_PLAN#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
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

      -- ��������� desc ��� log.
      IF :new.fk_infection <> :old.fk_infection THEN

        v_fc_desc :=
            '[��������:] ����� - "' || :new.fk_infection ||
            '", ������ - "' || :old.fk_infection || '". ';
      END IF;

      IF :new.fd_plan_date <> :old.fd_plan_date THEN

        v_fc_desc := v_fc_desc ||
            '[����:] ����� - "' ||
            TO_CHAR(:new.fd_plan_date, 'DD.MM.YYYY') ||
            '", ������ - "' ||
            TO_CHAR(:old.fd_plan_date, 'DD.MM.YYYY') || '". ';
      END IF;

      IF :new.fk_status <> :old.fk_status THEN

        v_fc_desc := v_fc_desc ||
            '[������:] ����� - "' || :new.fk_status ||
            '", ������ - "' || :old.fk_status || '". ';
      END IF;

      IF :new.fn_kratn <> :old.fn_kratn THEN

        v_fc_desc := v_fc_desc ||
            '[���������:] ����� - "' || :new.fn_kratn ||
            '", ������ - "' || :old.fn_kratn || '". ';
      END IF;

      IF :new.fn_vaccin_period <> :old.fn_vaccin_period THEN

        v_fc_desc := v_fc_desc ||
            '[������:] ����� - "' || :new.fn_vaccin_period ||
            '", ������ - "' || :old.fn_vaccin_period || '". ';
      END IF;

      IF :new.fk_vac_people <> :old.fk_vac_people THEN

        v_fc_desc := v_fc_desc ||
            '[������ �� ��������:] ����� - "' || :new.fk_vac_people ||
            '", ������ - "' || :old.fk_vac_people || '". ';
      END IF;

      IF :new.fk_sotr <> :old.fk_sotr THEN

        v_fc_desc := v_fc_desc ||
            '[��� ���� ��������� ���������:] ����� - "' || :new.fk_sotr ||
            '", ������ - "' || :old.fk_sotr || '". ';
      END IF;

      -- ��������� � ���.
      v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
          c_fk_update_plan, c_fk_plan_source, SYSDATE, v_fc_desc);

      USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
          v_fk_user_msg_log, :new.fk_people, 'tpeoples');
    END IF;
  END IF;
END;
/
SHOW ERRORS;


