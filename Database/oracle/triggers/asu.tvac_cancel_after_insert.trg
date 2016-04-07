DROP TRIGGER ASU.TVAC_CANCEL_AFTER_INSERT
/

--
-- TVAC_CANCEL_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   PKG_VACCIN (Package)
--   TVAC_CANCEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_CANCEL_AFTER_INSERT" 
 AFTER
  INSERT
 ON asu.tvac_cancel
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  PKG_VACCIN.SHIFT_PRIVATE_PLAN(
      :new.fk_people, :new.fk_type, :new.fd_beg, :new.fd_end);
END;
/
SHOW ERRORS;


