DROP PACKAGE BODY ASU.PKG_PEOPLE
/

--
-- PKG_PEOPLE  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PEOPLE" as



-------------------------------------------------------------------------------
FUNCTION make_f_io (
  p_fam           IN   VARCHAR2,
  p_name          IN   VARCHAR2,
  p_second_name   IN   VARCHAR2
)
  RETURN VARCHAR2
IS
  v_ret   VARCHAR2 (150);
BEGIN
  v_ret :=
       p_fam
    || ' '
    || SUBSTR (LTRIM (p_name), 1, 1)
    || '.'
    || SUBSTR (LTRIM (p_second_name), 1, 1)
    || '.';
  RETURN v_ret;
END make_f_io;
-------------------------------------------------------------------------------


-- Для Человека возварщает Фамилия И.О.
-- Author: Ura
FUNCTION getf_io (p_fk_id IN INTEGER)
  RETURN VARCHAR2
IS
  RESULT   VARCHAR2 (150);
BEGIN
  SELECT    p.fc_fam
         || ' '
         || SUBSTR (LTRIM (p.fc_im), 1, 1)
         || '.'
         || SUBSTR (LTRIM (p.fc_otch), 1, 1)
         || '.'
    INTO RESULT
    FROM tpeoples p
   WHERE p.fk_id = p_fk_id;

  RETURN RESULT;
EXCEPTION
  WHEN OTHERS
  THEN
    RETURN 'Неизвестный человек';
END getf_io;
-------------------------------------------------------------------------------
-- Author: Ura
FUNCTION getfio (p_fk_id IN INTEGER)
  RETURN VARCHAR2
IS
  RESULT   VARCHAR2 (150);
BEGIN
  SELECT p.fc_fam || ' ' || p.fc_im || ' ' || p.fc_otch
    INTO RESULT
    FROM tpeoples p
   WHERE p.fk_id = p_fk_id;

  RETURN RESULT;
EXCEPTION
  WHEN OTHERS
  THEN
    RETURN 'Неизвестный человек';
END getfio;
-------------------------------------------------------------------------------
-- для сотрудника выозваращает  Фамилия И.О.
-- Author: Ura
FUNCTION sotr_getf_io (p_fk_id IN INTEGER)
  RETURN VARCHAR2
IS
  RESULT   VARCHAR2 (150);
BEGIN
  SELECT    s.fc_fam
         || ' '
         || SUBSTR (LTRIM (s.fc_name), 1, 1)
         || '.'
         || SUBSTR (LTRIM (s.fc_otch), 1, 1)
         || '.'
    INTO RESULT
    FROM tsotr s
   WHERE s.fk_id = p_fk_id;

  RETURN RESULT;
EXCEPTION
  WHEN OTHERS
  THEN
    RETURN 'Неизвестный человек';
END sotr_getf_io;
-------------------------------------------------------------------------------

end PKG_PEOPLE;
/

SHOW ERRORS;


