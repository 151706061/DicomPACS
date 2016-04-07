DROP TRIGGER ASU.TVAC_PRIVATE_PLAN#UL#$AD
/

--
-- TVAC_PRIVATE_PLAN#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVAC_PRIVATE_PLAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PRIVATE_PLAN#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_private_plan
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_del_plan      CONSTANT NUMBER := 19;
  c_fk_plan_source   CONSTANT NUMBER := 2;
  v_fk_user_msg_log  NUMBER;
  v_fc_desc          VARCHAR2(4000);

BEGIN

  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    IF USER_LOG.PKG_LOG_MNG.IS_GROUP_ACTION THEN

      USER_LOG.PKG_LOG_MNG.ADD_GROUP_ACTION_LOG(
          :old.fk_people, 'tpeoples');
    ELSE

      -- ��������� desc ��� log.
      v_fc_desc := '[��������:] "' || :old.fk_infection ||
          '". [����:] "' ||
          TO_CHAR(:old.fd_plan_date, 'DD.MM.YYYY') ||
          '". [������:] "' || :old.fk_status ||
          '". [���������:] "' || :old.fn_kratn ||
          '". [������:] "' || :old.fn_vaccin_period ||
          '". [������ �� ��������:] "' || :old.fk_vac_people ||
          '". [��� ���� ��������� ���������:] "' || :old.fk_sotr || '"';

      -- ��������� � ���.
      v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
          c_fk_del_plan, c_fk_plan_source, SYSDATE, v_fc_desc);

      USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
          v_fk_user_msg_log, :old.fk_people, 'tpeoples');
    END IF;
  END IF;
END;
/
SHOW ERRORS;


