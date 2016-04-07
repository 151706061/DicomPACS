DROP FUNCTION ASU.IS_14MED_HIDEFIELD
/

--
-- IS_14MED_HIDEFIELD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TREPLYTABLE (Table)
--
CREATE OR REPLACE FUNCTION ASU.IS_14MED_HIDEFIELD(aFielNumber Number) RETURN NUMBER IS
-- Efimov V.A. 20120726 http://192.168.1.9/redmine/issues/17865
-- Функция возвращает 1, если поле отчёта 14med.fr3 с номером aFielNumber всегда должно быть пустым
  vIS_HIDE NUMBER;
BEGIN
  select decode(max(fk_id), null, 0, 1) fn_hide
    into vIS_HIDE
    from asu.treplytable
   where FC_ASK = 'NUMBERS'
     and FC_ASKFIELD = 'RN'
     and FC_ASKID = to_char(aFielNumber)
     and FC_REPLY = '14MED_HIDEFIELDS'
     and FC_REPLYFIELD = 'FL_CHECK'
     and FC_REPLYID = '1';

  return vIS_HIDE;
END;
/

SHOW ERRORS;


