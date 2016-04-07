DROP TRIGGER ASU.TRECEPTVID_BD
/

--
-- TRECEPTVID_BD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TRECEPT (Table)
--   TRECEPTVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTVID_BD" 
BEFORE DELETE
ON ASU.TRECEPTVID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
  CURSOR c
  IS
    SELECT fk_id
      FROM trecept
     WHERE fk_receptvidid = :old.fk_id;
  bFind   BOOLEAN := FALSE;
BEGIN
  FOR i IN c LOOP
    bFind  := TRUE;
  END LOOP;
  IF bFind THEN
    raise_application_error (-20003, 'Невозможно удалить вид рецепта, ' || :old.fc_name || 'т.к. имеются рецепты принадлежащие к этому виду');
  END IF;
END;
/
SHOW ERRORS;


