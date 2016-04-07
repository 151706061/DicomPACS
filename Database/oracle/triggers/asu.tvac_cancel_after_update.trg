DROP TRIGGER ASU.TVAC_CANCEL_AFTER_UPDATE
/

--
-- TVAC_CANCEL_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_VACCIN (Package)
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL_AFTER_UPDATE" 
 AFTER
  UPDATE
 ON asu.tvac_cancel
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
WHEN (
((new.fk_type != old.fk_type) OR
 (new.fd_beg != old.fd_beg) OR
 (new.fd_end != old.fd_end))
      )
BEGIN
  PKG_VACCIN.SHIFT_PRIVATE_PLAN(
      :new.fk_people, :new.fk_type, :new.fd_beg, :new.fd_end);
END;
/
SHOW ERRORS;


