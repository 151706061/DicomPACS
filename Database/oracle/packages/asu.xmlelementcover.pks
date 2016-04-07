DROP PACKAGE ASU.XMLELEMENTCOVER
/

--
-- XMLELEMENTCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLELEMENTCOVER" is

FUNCTION getTagName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getTagName(int) returns java.lang.String';

FUNCTION getQualifiedName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getQualifiedName(int)
	returns java.lang.String';

FUNCTION getNamespace(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getNamespace(int) returns java.lang.String';

FUNCTION getLocalName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getLocalName(int) returns java.lang.String';

FUNCTION getExpandedName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getExpandedName(int)
	returns java.lang.String';

FUNCTION getAttribute(id number, name varchar2) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getAttribute(int, java.lang.String)
	returns java.lang.String';

PROCEDURE setAttribute(id number, name varchar2, value varchar2,
                       err in out number)
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.setAttribute(int, java.lang.String,
				   java.lang.String, int[])';

PROCEDURE removeAttribute(id number, name varchar2, err in out number)
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.removeAttribute(int, java.lang.String,
                                      int[])';

FUNCTION getAttributeNode(id number, name varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getAttributeNode(int, java.lang.String)
	returns int';

FUNCTION setAttributeNode(id number, newAttr number) return number
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.setAttributeNode(int, int)
	returns int';

FUNCTION removeAttributeNode(id number, oldAttr number) return number
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.removeAttributeNode(int, int)
	returns int';

FUNCTION getChildrenByTagName(id number, name varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getChildrenByTagName(int, java.lang.String)
	 returns int';

FUNCTION getElementsByTagName(id number, name varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getElementsByTagName(int, java.lang.String)
	 returns int';

FUNCTION getChildrenByTagName(id number, name varchar2, ns varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLElementCover.getChildrenByTagName(int, java.lang.String, java.lang.String) returns int';

FUNCTION getElementsByTagName(id number, name varchar2, ns varchar2) return number is language java name 'oracle.xml.parser.plsql.XMLElementCover.getElementsByTagName(int, java.lang.String, java.lang.String) returns int';

FUNCTION resolveNamespacePrefix(id number, prefix varchar2) return varchar2 is language java name 'oracle.xml.parser.plsql.XMLElementCover.resolveNamespacePrefix(int, java.lang.String) returns java.lang.String';

PROCEDURE normalize(id number) is language java
name 'oracle.xml.parser.plsql.XMLElementCover.normalize(int)';

end;
/

SHOW ERRORS;


