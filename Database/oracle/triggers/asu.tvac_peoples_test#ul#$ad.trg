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

    -- ��������� desc ��� log.
    v_fc_desc :=
        '[���� ������ �����:] "' || TO_CHAR(:old.fd_create, 'DD.MM.YYYY') ||
        '". [������� �� �����:] "' || :old.fk_vac_test_res ||
        '". [��������:] "' || :old.fc_reaction ||
        '". [ID �����:] "' || :old.fk_vac_test ||
        '". [��� �����:] "' || :old.fc_vrach ||
        '". [���:] "' || :old.fc_lpy ||
        '". [��� �����������:] "' || :old.fc_sotr ||
        '". [���� �����:] "' || TO_CHAR(:old.fd_reg, 'DD.MM.YYYY') || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_del_test, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :old.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


