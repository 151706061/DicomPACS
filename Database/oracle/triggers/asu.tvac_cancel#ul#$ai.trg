DROP TRIGGER ASU.TVAC_CANCEL#UL#$AI
/

--
-- TVAC_CANCEL#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVACCANCEL_TYPE (Table)
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_cancel
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_cancel     CONSTANT NUMBER := 1;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_name           VARCHAR2(255);
  v_fc_permanent      VARCHAR2(16);
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    SELECT fc_name,
           DECODE(fn_permanent, 1, 'Постоянный',
                                0, 'Временный')
      INTO v_fc_name, v_fc_permanent
      FROM tvaccancel_type
      WHERE fk_id = :new.fk_type;

    v_fc_desc := '[Вид:] "' ||  v_fc_name ||
        '". [Начальная дата:] "' || TO_CHAR(:new.fd_beg, 'DD.MM.YYYY') ||
        '". [Конечная дата:] "' || TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
        '". [Тип:] "' || v_fc_permanent || '"';

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_cancel, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


