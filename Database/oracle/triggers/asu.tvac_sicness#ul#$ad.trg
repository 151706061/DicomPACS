DROP TRIGGER ASU.TVAC_SICNESS#UL#$AD
/

--
-- TVAC_SICNESS#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TVAC_SICNESS (Table)
--   PKG_LOG_MNG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_SICNESS#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_sicness
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_delete_sicness CONSTANT NUMBER := 11;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc := '[��������:] "' ||  :old.fk_infection ||
        '". [���� �����������:] "' || TO_CHAR(:old.fd_end, 'DD.MM.YYYY') ||
        '". [����������:] "' || :old.fc_rem ||
        '". [���:] "' || :old.fc_lpy ||
        '". [����:] "' || :old.fc_vrach ||
        '". [ICD:] "' || :old.fk_icd || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_delete_sicness, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :old.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


