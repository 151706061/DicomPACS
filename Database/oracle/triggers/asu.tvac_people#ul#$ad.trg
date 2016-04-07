DROP TRIGGER ASU.TVAC_PEOPLE#UL#$AD
/

--
-- TVAC_PEOPLE#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_people
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_delete_vac_people CONSTANT NUMBER := 14;
  c_fk_vac_map_source    CONSTANT NUMBER := 1;
  v_fk_user_msg_log      NUMBER;
  v_fc_desc              VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc :=
        '". [���� ��������:] "' || TO_CHAR(:old.fd_create, 'DD.MM.YYYY') ||
        '". [����:] "' || :old.fn_num ||
        '". [��.���.:] "' || :old.fk_unit ||
        '". [������:] "' || :old.fn_status ||
        '". [��, ����������� ��������:] "' || :old.fc_organization ||
        '". [����:] "' || :old.fc_vrach_fio ||
        '". [��� �������:] "' || :old.fn_reaction ||
        '". [��������:] "' || :old.fk_vaccin_prep ||
        '". [������ �����:] "' || :old.fn_status_series ||
        '". [������ ��������:] "' || :old.fk_input_type ||
        '". [�����������:] "' || :old.fc_sotr_fio ||
        '". [���������:] "' || :old.fk_otdel ||
        '". [������ �����:] "' || :old.fn_reaction_rubec || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_delete_vac_people, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :old.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


