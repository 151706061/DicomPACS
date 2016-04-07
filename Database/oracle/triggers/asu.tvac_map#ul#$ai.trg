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

    -- ��������� desc ��� log.
    v_fc_desc := '[�����������:] "' || :new.fk_organization ||
        '". [���� ��������� �� �����������:] "' ||
        TO_CHAR(:new.fd_organization, 'DD.MM.YYYY') ||
        '". [�������:] "' || :new.fk_area ||
        '". [���:] "' || :new.fk_organization_lpy ||
        '". [�����:] "' || :new.fk_class ||
        '". [���� ���������� �� ����:] "' ||
        TO_CHAR(:new.fd_beg, 'DD.MM.YYYY') ||
        '". [���� ������ � �����:] "' ||
        TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
        '". [����� ������:] "' || :new.fc_class_liter || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_vac_map, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


