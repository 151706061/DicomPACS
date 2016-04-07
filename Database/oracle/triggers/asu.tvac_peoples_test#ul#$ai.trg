DROP TRIGGER ASU.TVAC_PEOPLES_TEST#UL#$AI
/

--
-- TVAC_PEOPLES_TEST#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVAC_PEOPLES_TEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLES_TEST#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_peoples_test
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_test       CONSTANT NUMBER := 7;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc :=
        '[���� ������ �����:] "' || TO_CHAR(:new.fd_create, 'DD.MM.YYYY') ||
        '". [������� �� �����:] "' || :new.fk_vac_test_res ||
        '". [��������:] "' || :new.fc_reaction ||
        '". [ID �����:] "' || :new.fk_vac_test ||
        '". [��� �����:] "' || :new.fc_vrach ||
        '". [���:] "' || :new.fc_lpy ||
        '". [��� �����������:] "' || :new.fc_sotr ||
        '". [���� �����:] "' || TO_CHAR(:new.fd_reg, 'DD.MM.YYYY') || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_test, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


