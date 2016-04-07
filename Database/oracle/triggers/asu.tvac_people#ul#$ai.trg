DROP TRIGGER ASU.TVAC_PEOPLE#UL#$AI
/

--
-- TVAC_PEOPLE#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_people
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_vac_people CONSTANT NUMBER := 13;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc :=
        '". [���� ��������:] "' || TO_CHAR(:new.fd_create, 'DD.MM.YYYY') ||
        '". [����:] "' || :new.fn_num ||
        '". [��.���.:] "' || :new.fk_unit ||
        '". [������:] "' || :new.fn_status ||
        '". [��, ����������� ��������:] "' || :new.fc_organization ||
        '". [����:] "' || :new.fc_vrach_fio ||
        '". [��� �������:] "' || :new.fn_reaction ||
        '". [��������:] "' || :new.fk_vaccin_prep ||
        '". [������ �����:] "' || :new.fn_status_series ||
        '". [������ ��������:] "' || :new.fk_input_type ||
        '". [�����������:] "' || :new.fc_sotr_fio ||
        '". [���������:] "' || :new.fk_otdel ||
        '". [������ �����:] "' || :new.fn_reaction_rubec || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_vac_people, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


