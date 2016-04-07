DROP TRIGGER ASU.TAMBTALON_BEFORE_DELETE
/

--
-- TAMBTALON_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBTALON_BEFORE_DELETE" 
 BEFORE 
 DELETE
 ON ASU.TAMBTALON  REFERENCING OLD AS old NEW AS new
 FOR EACH ROW
begin
  delete from tambtalon_naz where fk_talonid=:old.fk_id;
end;
/
SHOW ERRORS;


