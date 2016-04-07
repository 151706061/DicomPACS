DROP TRIGGER ASU.TMEDIC_DEL
/

--
-- TMEDIC_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TMEDIC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMEDIC_DEL" 
 BEFORE 
 INSERT
 ON ASU.TMEDIC  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
-- Zhukov закоментарил ивалида
/*   IF pkgtmedic.isExistsChilds(:old.fk_id) = 1 THEN
      raise_application_error (-20001, 'Вы не можете удалить этот медикамент, т.к. есть записи зависящие от него');
   END IF;
*/
  null;
END;
/
SHOW ERRORS;


