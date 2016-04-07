DROP PACKAGE ASU.XMLENTITYCOVER
/

--
-- XMLENTITYCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLENTITYCOVER" is

FUNCTION getPublicId(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLEntityCover.getPublicId(int) returns java.lang.String';

FUNCTION getSystemId(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLEntityCover.getSystemId(int) returns java.lang.String';

FUNCTION getNotationName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLEntityCover.getNotationName(int)
	returns java.lang.String';

end;
/

SHOW ERRORS;


