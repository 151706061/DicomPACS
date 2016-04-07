DROP TRIGGER ASU.TPUTPLANLIST_DELETE_ALL
/

--
-- TPUTPLANLIST_DELETE_ALL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TKARTA (Table)
--   TPUTPLANDAYS (Table)
--   TPUTPLANLIST (Table)
--   TPUTSPLANS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPUTPLANLIST_DELETE_ALL" 
AFTER DELETE
ON ASU.TPUTPLANLIST REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
  CURSOR cC is
         Select tkarta.fk_id from tputsplans,tkarta
          where tputsplans.fk_listid = :OLD.FK_ID
            and tkarta.fk_id = fk_pacid;
Begin
  FOR p in cC LOOP
    delete from tkarta where fk_id = p.fk_id;
  END LOOP;
  Delete from TPUTPLANDAYS where FK_LISTID=:OLD.FK_ID;
  Delete from TPUTSPLANS where FK_LISTID=:OLD.FK_ID;
end;
/
SHOW ERRORS;


