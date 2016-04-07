DROP PACKAGE ASU.XMLNODECOVER
/

--
-- XMLNODECOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLNODECOVER" is

PROCEDURE freeDocument(id number)
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.freeDocument(int)';

FUNCTION getNodeName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getNodeName(int) returns java.lang.String';

FUNCTION getNodeValue(id number, err in out number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getNodeValue(int, int[])
returns java.lang.String';

PROCEDURE setNodeValue(id number, nodeValue varchar2, err in out number)
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.setNodeValue(int, java.lang.String,
                                int[])';

FUNCTION getNodeType(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getNodeType(int) returns short';

FUNCTION getParentNode(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getParentNode(int) returns int';

FUNCTION getChildNodes(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getChildNodes(int) returns int';

FUNCTION getFirstChild(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getFirstChild(int) returns int';

FUNCTION getLastChild(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getLastChild(int) returns int';

FUNCTION getPreviousSibling(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getPreviousSibling(int)
	returns int';

FUNCTION getNextSibling(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getNextSibling(int) returns int';

FUNCTION getAttributes(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getAttributes(int) returns int';

FUNCTION getOwnerDocument(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.getOwnerDocument(int)
returns int';

FUNCTION insertBefore(id number, newChild number, refChild number,
                      err in out number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.insertBefore(int, int,
				int, int[])
returns int';

FUNCTION replaceChild(id number, newChild number, oldChild number,
                      err in out number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.replaceChild(int, int,
				int, int[])
returns int';

FUNCTION removeChild(id number, oldChild number, err in out number)
return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.removeChild(int, int,
                            int[]) returns int';

FUNCTION appendChild(id number, newChild number, err in out number)
return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.appendChild(int, int,
                               int[]) returns int';

FUNCTION hasChildNodes(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.hasChildNodes(int) returns boolean';

FUNCTION cloneNode(id number, deep number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.cloneNode(int, boolean)
returns	int';

PROCEDURE writeToFile(id number, fileName varchar2, charset varchar2,
                      err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.writeToFile(int, java.lang.String,
                                   java.lang.String, java.lang.String[])';

PROCEDURE writeToBuffer(id number, buffer in out varchar2,
                        charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.writeToBuffer(int, oracle.sql.CHAR[],
                                     java.lang.String, java.lang.String[])';

PROCEDURE writeToClob(id number, cl in out clob,
                      charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLNodeCover.writeToClob(int, oracle.sql.CLOB[],
                                   java.lang.String, java.lang.String[])';

FUNCTION transformNode(id number, stylesheet number, err in out varchar2) return number is language java name 'oracle.xml.parser.plsql.XMLNodeCover.transformNode(int, int, java.lang.String[]) returns int';

FUNCTION selectNodes(id number, pattern varchar2, err in out varchar2) return number is language java name 'oracle.xml.parser.plsql.XMLNodeCover.selectNodes(int, java.lang.String, java.lang.String[]) returns int';

FUNCTION selectSingleNode(id number, pattern varchar2, err in out varchar2) return number is language java name 'oracle.xml.parser.plsql.XMLNodeCover.selectSingleNode(int, java.lang.String, java.lang.String[]) returns int';

FUNCTION valueOf(id number, pattern varchar2, err in out varchar2) return varchar2 is language java name 'oracle.xml.parser.plsql.XMLNodeCover.valueOf(int, java.lang.String, java.lang.String[]) returns java.lang.String';

end;
/

SHOW ERRORS;


