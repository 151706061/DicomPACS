DROP PACKAGE ASU.XMLNOTATIONCOVER
/

--
-- XMLNOTATIONCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLNOTATIONCOVER" is

FUNCTION getPublicId(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLNotationCover.getPublicId(int) returns java.lang.String';

FUNCTION getSystemId(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLNotationCover.getSystemId(int) returns java.lang.String';

end;
/

SHOW ERRORS;


