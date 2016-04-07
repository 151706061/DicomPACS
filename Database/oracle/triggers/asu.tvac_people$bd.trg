DROP TRIGGER ASU.TVAC_PEOPLE$BD
/

--
-- TVAC_PEOPLE$BD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TVAC_KRATN (Table)
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE$BD" 
 BEFORE 
 DELETE
 ON ASU.TVAC_PEOPLE  FOR EACH ROW
BEGIN
   DELETE FROM tvac_kratn
         WHERE tvac_kratn.fk_vac_people = :OLD.fk_id;
END;
/
SHOW ERRORS;


