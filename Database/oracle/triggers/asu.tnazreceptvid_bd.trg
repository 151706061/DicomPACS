DROP TRIGGER ASU.TNAZRECEPTVID_BD
/

--
-- TNAZRECEPTVID_BD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TNAZRECEPT (Table)
--   TNAZRECEPTVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZRECEPTVID_BD" 
BEFORE DELETE
ON ASU.TNAZRECEPTVID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
  CURSOR c
  IS
    SELECT fk_id
      FROM tnazrecept
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


