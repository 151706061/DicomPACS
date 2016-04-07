DROP TRIGGER ASU.TMISEXCH_BUF_BEFORE_DELETE
/

--
-- TMISEXCH_BUF_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TMISEXCH_BUF (Table)
--   TMISEXCH_BUF_OBJREAD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMISEXCH_BUF_BEFORE_DELETE" 
 BEFORE
  DELETE
 ON tmisexch_buf
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  delete from tmisexch_buf_objread where fk_bufid=:old.fk_id;
end;
/
SHOW ERRORS;


