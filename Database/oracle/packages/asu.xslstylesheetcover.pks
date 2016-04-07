DROP PACKAGE ASU.XSLSTYLESHEETCOVER
/

--
-- XSLSTYLESHEETCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XSLSTYLESHEETCOVER" is

PROCEDURE freeStylesheet(id number) is language java name 'oracle.xml.parser.plsql.XSLStylesheetCover.freeStylesheet(int)';

FUNCTION newStylesheetFromDoc(xmldoc number, url varchar2, err in out varchar2) return number is language java name 'oracle.xml.parser.plsql.XSLStylesheetCover.newStylesheetFromDoc(int, java.lang.String, java.lang.String[]) returns int';

FUNCTION newStylesheetFromURL(inp varchar2, url varchar2, err in out varchar2) return number is language java name 'oracle.xml.parser.plsql.XSLStylesheetCover.newStylesheetFromURL(java.lang.String, java.lang.String, java.lang.String[]) returns int';

PROCEDURE setParam(id number, name varchar2, value varchar2, err in out varchar2) is language java name 'oracle.xml.parser.plsql.XSLStylesheetCover.setParam(int, java.lang.String, java.lang.String, java.lang.String[])';

PROCEDURE removeParam(id number, name varchar2, err in out varchar2) is language java name 'oracle.xml.parser.plsql.XSLStylesheetCover.removeParam(int, java.lang.String, java.lang.String[])';

PROCEDURE resetParams(id number, err in out varchar2) is language java name 'oracle.xml.parser.plsql.XSLStylesheetCover.resetParams(int, java.lang.String[])';

end;
/

SHOW ERRORS;


