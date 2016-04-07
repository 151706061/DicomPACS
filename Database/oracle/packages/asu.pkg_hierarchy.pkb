DROP PACKAGE BODY ASU.PKG_HIERARCHY
/

--
-- PKG_HIERARCHY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_HIERARCHY" 
IS
  -- Пакет реализующий функцию sys_connect_by_path из Oracle 9
  -- взята у Кайта
  -- http://asktom.oracle.com/pls/ask/f?p=4950:8:::::F4950_P8_DISPLAYID:11452690446345
-- пример использования
/*
SELECT     RPAD ('*', 1 * LEVEL, '*') || fc_name fc_name,
           pkg_hierarchy.branch (LEVEL, fc_name, '/')
      FROM tsmid
START WITH fk_id = get_konsid
CONNECT BY PRIOR fk_id = fk_owner
*/
/*
Внимание! не работает если сразу накладывается фильтр

*/


  returnvalue   VARCHAR2 (4000);

--------------------------------------------------------------------------------
  FUNCTION branch (vlevel IN NUMBER, vvalue IN VARCHAR2, vdelimiter IN VARCHAR2 DEFAULT CHR (0))
    RETURN VARCHAR2
  IS
  BEGIN
    branchtable (vlevel) := vvalue;
    returnvalue := vvalue;

    FOR i IN REVERSE 1 .. vlevel - 1
    LOOP
      returnvalue := branchtable (i) || vdelimiter || returnvalue;
    END LOOP;

    RETURN returnvalue;
  END branch;

--------------------------------------------------------------------------------
  PROCEDURE clearbranch
  AS
  BEGIN
    branchtable.DELETE;
  END;
  
  
END;
/

SHOW ERRORS;


