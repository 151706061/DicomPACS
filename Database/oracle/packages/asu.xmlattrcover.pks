DROP PACKAGE ASU.XMLATTRCOVER
/

--
-- XMLATTRCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLATTRCOVER" is

FUNCTION getName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLAttrCover.getName(int) returns java.lang.String';

FUNCTION getQualifiedName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLAttrCover.getQualifiedName(int)
	returns java.lang.String';

FUNCTION getNamespace(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLAttrCover.getNamespace(int) returns java.lang.String';

FUNCTION getLocalName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLAttrCover.getLocalName(int) returns java.lang.String';

FUNCTION getExpandedName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLAttrCover.getExpandedName(int)
	returns java.lang.String';

FUNCTION getValue(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLAttrCover.getValue(int) returns java.lang.String';

PROCEDURE setValue(id number, value varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLAttrCover.setValue(int, java.lang.String)';

FUNCTION getSpecified(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLAttrCover.getSpecified(int) returns boolean';

end;
/

SHOW ERRORS;


