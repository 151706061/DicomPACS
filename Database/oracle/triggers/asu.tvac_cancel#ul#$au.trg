DROP TRIGGER ASU.TVAC_CANCEL#UL#$AU
/

--
-- TVAC_CANCEL#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_LOG_MNG (Package)
--   TVACCANCEL_TYPE (Table)
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_cancel
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_cancel  CONSTANT NUMBER := 3;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_name           VARCHAR2(255);
  v_fc_permanent      VARCHAR2(16);
  v_fc_desc           VARCHAR2(4000);

BEGIN

  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- Формируем desc для log.
    IF :new.fk_type <> :old.fk_type THEN
      SELECT fc_name
        INTO v_fc_name
        FROM tvaccancel_type
       WHERE fk_id = :old.fk_type;

       v_fc_desc := '[Вид:] ' ||
           'старый - "' || v_fc_name || '" новый - "';

      SELECT fc_name,
             DECODE(fn_permanent, 1, 'Постоянный',
                                  0, 'Временный')
        INTO v_fc_name, v_fc_permanent
        FROM tvaccancel_type
       WHERE fk_id = :new.fk_type;

       v_fc_desc := v_fc_desc ||  v_fc_name ||
           '". [Тип:] "' || v_fc_permanent || '".';
    END IF;

    IF :new.fd_beg <> :old.fd_beg THEN

      v_fc_desc := v_fc_desc || '[Начальная дата:] старая - "' ||
          TO_CHAR(:old.fd_beg, 'DD.MM.YYYY') || '", новая - "' ||
          TO_CHAR(:new.fd_beg, 'DD.MM.YYYY') || '".';
    END IF;

    IF (:new.fd_end <> :old.fd_end) OR (
        (:new.fd_end is null) AND (:old.fd_end is not null)) OR (
        (:new.fd_end is not null) AND (:old.fd_end is null)) THEN

      v_fc_desc := v_fc_desc || '[Конечная дата:] старая - "' ||
          TO_CHAR(:old.fd_end, 'DD.MM.YYYY') || '", новая - "' ||
          TO_CHAR(:new.fd_end, 'DD.MM.YYYY') || '".';
    END IF;

    IF :new.fc_rem <> :old.fc_rem THEN

      v_fc_desc := v_fc_desc || '[Примечание:] старое - "' ||
          :old.fc_rem || '", новое - "' || :new.fc_rem || '".';
    END IF;

    -- Добавляем в лог.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_cancel, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


