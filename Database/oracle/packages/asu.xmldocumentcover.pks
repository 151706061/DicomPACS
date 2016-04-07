DROP PACKAGE ASU.XMLDOCUMENTCOVER
/

--
-- XMLDOCUMENTCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLDOCUMENTCOVER" is

FUNCTION newDocument return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.newDocument() returns int';

FUNCTION getDocType(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.getDoctype(int) returns int';

FUNCTION getImplementation(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.getImplementation(int)
	returns int';

FUNCTION getDocumentElement(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.getDocumentElement(int)
	returns int';

FUNCTION createElement(id number, tagName varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.createElement(int, java.lang.String)
	returns int';

FUNCTION createDocumentFragment(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.createDocumentFragment(int)
	returns int';

FUNCTION createTextNode(id number, data varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.createTextNode(int, java.lang.String)
	returns int';

FUNCTION createComment(id number, data varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.createComment(int, java.lang.String)
	returns int';

FUNCTION createCDATASection(id number, data varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.createCDATASection(int, java.lang.String)
	returns int';

FUNCTION createProcessingInstruction(id number, target varchar2,
                                     data varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.createProcessingInstruction(int, java.lang.String, java.lang.String) returns int';

FUNCTION createAttribute(id number, name varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.createAttribute(int, java.lang.String)
	returns int';

FUNCTION createEntityReference(id number, name varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.createEntityReference(int,
	java.lang.String)
	returns int';

FUNCTION getElementsByTagName(id number, name varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.getElementsByTagName(int, java.lang.String)
	 returns int';

FUNCTION getVersion(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.getVersion(int) returns java.lang.String';

PROCEDURE setVersion(id number, version varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.setVersion(int, java.lang.String)';

FUNCTION getCharset(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.getCharset(int) returns java.lang.String';

PROCEDURE setCharset(id number, charset varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.setCharset(int, java.lang.String)';

FUNCTION getStandalone(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.getStandalone(int)
      returns java.lang.String';

PROCEDURE setStandalone(id number, value varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.setStandalone(int, java.lang.String)';

PROCEDURE writeToFile(id number, fileName varchar2, charset varchar2,
                      err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.writeToFile(int, java.lang.String,
                                   java.lang.String, java.lang.String[])';

PROCEDURE writeToBuffer(id number, buffer in out varchar2,
                        charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.writeToBuffer(int, oracle.sql.CHAR[],
                                     java.lang.String, java.lang.String[])';

PROCEDURE writeToClob(id number, cl in out clob,
                      charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.writeToClob(int, oracle.sql.CLOB[],
                                   java.lang.String, java.lang.String[])';

PROCEDURE writeExternalDTDToFile(id number, fileName varchar2,
                                 charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.writeExternalDTDToFile(int, java.lang.String,
                                   java.lang.String, java.lang.String[])';

PROCEDURE writeExternalDTDToBuffer(id number, buffer in out varchar2,
                                   charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.writeExternalDTDToBuffer(int, oracle.sql.CHAR[],
                                     java.lang.String, java.lang.String[])';

PROCEDURE writeExternalDTDToClob(id number, cl in out clob,
                                 charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDocumentCover.writeExternalDTDToClob(int, oracle.sql.CLOB[],
                                   java.lang.String, java.lang.String[])';

end;
/

SHOW ERRORS;


