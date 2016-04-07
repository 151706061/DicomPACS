DROP PACKAGE ASU.XMLDTDCOVER
/

--
-- XMLDTDCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLDTDCOVER" is

FUNCTION getName(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.getName(int) returns java.lang.String';

FUNCTION getEntities(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.getEntities(int) returns int';

FUNCTION getNotations(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.getNotations(int) returns int';

FUNCTION getElementDecls(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.getElementDecls(int) returns int';

FUNCTION findEntity(id number, name varchar2, par number) return number
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.findEntity(int, java.lang.String, boolean) returns int';

FUNCTION findElementDecl(id number, name varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.findElementDecl(int, java.lang.String) returns int';

FUNCTION findNotation(id number, name varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.findNotation(int, java.lang.String) returns int';

FUNCTION getPublicId(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.getPublicId(int) returns java.lang.String';

FUNCTION getSystemId(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.getSystemId(int) returns java.lang.String';

PROCEDURE writeExternalDTDToFile(id number, fileName varchar2,
                                 charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.writeExternalDTDToFile(int, java.lang.String,
                                   java.lang.String, java.lang.String[])';

PROCEDURE writeExternalDTDToBuffer(id number, buffer in out varchar2,
                                   charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.writeExternalDTDToBuffer(int, oracle.sql.CHAR[],
                                     java.lang.String, java.lang.String[])';

PROCEDURE writeExternalDTDToClob(id number, cl in out clob,
                                 charset varchar2, err in out varchar2)
is language java
name 'oracle.xml.parser.plsql.XMLDTDCover.writeExternalDTDToClob(int, oracle.sql.CLOB[],
                                   java.lang.String, java.lang.String[])';

end;
/

SHOW ERRORS;


