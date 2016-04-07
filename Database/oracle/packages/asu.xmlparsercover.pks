DROP PACKAGE ASU.XMLPARSERCOVER
/

--
-- XMLPARSERCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLPARSERCOVER" is

FUNCTION newParser return number is language java
name 'oracle.xml.parser.plsql.XMLParserCover.newParser() returns int';

PROCEDURE freeParser(id number) is language java
name 'oracle.xml.parser.plsql.XMLParserCover.freeParser(int)';

PROCEDURE parse(id number, url varchar2, err in out varchar2) is language java name 'oracle.xml.parser.plsql.XMLParserCover.parse(int, java.lang.String, java.lang.String[])';

PROCEDURE parseBuffer(id number, doc VARCHAR2, err in out varchar2)
is language java name 'oracle.xml.parser.plsql.XMLParserCover.parseBuffer(int, oracle.sql.CHAR, java.lang.String[])';

PROCEDURE parseClob(id number, doc CLOB, err in out varchar2)
is language java name 'oracle.xml.parser.plsql.XMLParserCover.parseClob(int, oracle.sql.CLOB, java.lang.String[])';

PROCEDURE parseDTD(id number, url varchar2, root varchar2, err in out varchar2) is language java name 'oracle.xml.parser.plsql.XMLParserCover.parseDTD(int, java.lang.String, java.lang.String, java.lang.String[])';

PROCEDURE parseDTDBuffer(id number, dtd varchar2, root varchar2, err in out varchar2) is language java name 'oracle.xml.parser.plsql.XMLParserCover.parseDTDBuffer(int, java.lang.String, java.lang.String, java.lang.String[])';

PROCEDURE parseDTDClob(id number, dtd CLOB, root varchar2, err in out varchar2) is language java name 'oracle.xml.parser.plsql.XMLParserCover.parseDTDClob(int, oracle.sql.CLOB, java.lang.String, java.lang.String[])';

PROCEDURE setBaseURL(id number, url varchar2, err in out varchar2)
is language java name 'oracle.xml.parser.plsql.XMLParserCover.setBaseURL(int, java.lang.String, java.lang.String[])';

PROCEDURE showWarnings(id number, yes number) is language java
name 'oracle.xml.parser.plsql.XMLParserCover.showWarnings(int, boolean)';

PROCEDURE setErrorLog(id number, fileName varchar2) is language java
name 'oracle.xml.parser.plsql.XMLParserCover.setErrorLog(int, java.lang.String)';

PROCEDURE setPreserveWhitespace(id number, yes number) is language java
name 'oracle.xml.parser.plsql.XMLParserCover.setPreserveWhitespace(int, boolean)';

PROCEDURE setValidationMode(id number, yes number) is language java
name 'oracle.xml.parser.plsql.XMLParserCover.setValidationMode(int, boolean)';

FUNCTION getValidationMode(id number) return number is language java
name 'oracle.xml.parser.plsql.XMLParserCover.getValidationMode(int) returns int';

PROCEDURE setDoctype(id number, dtd number) is language java name 'oracle.xml.parser.plsql.XMLParserCover.setDoctype(int, int)';

FUNCTION getDoctype(id number) return number is language java
name 'oracle.xml.parser.plsql.XMLParserCover.getDoctype(int) returns int';

FUNCTION getDocument(id number) return number is language java
name 'oracle.xml.parser.plsql.XMLParserCover.getDocument(int) returns int';

end;
/

SHOW ERRORS;


