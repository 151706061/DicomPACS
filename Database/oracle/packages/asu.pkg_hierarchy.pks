DROP PACKAGE ASU.PKG_HIERARCHY
/

--
-- PKG_HIERARCHY  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_HIERARCHY" 
IS
  -- Пакет реализующий функцию sys_connect_by_path из Oracle 9
  -- взята у Кайта
  -- http://asktom.oracle.com/pls/ask/f?p=4950:8:::::F4950_P8_DISPLAYID:11452690446345
  TYPE branchtabletype IS TABLE OF VARCHAR2 (4000)
    INDEX BY BINARY_INTEGER;

  branchtable   branchtabletype;

  FUNCTION branch (
    vlevel       IN   NUMBER,
    vvalue       IN   VARCHAR2,
    vdelimiter   IN   VARCHAR2 DEFAULT CHR (0)
  )
    RETURN VARCHAR2;

  PRAGMA RESTRICT_REFERENCES (branch, WNDS);
  procedure ClearBranch;
END;
/

SHOW ERRORS;


