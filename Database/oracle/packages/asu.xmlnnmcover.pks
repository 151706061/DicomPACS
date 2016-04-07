DROP PACKAGE ASU.XMLNNMCOVER
/

--
-- XMLNNMCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLNNMCOVER" is

FUNCTION getNamedItem(id number, name varchar2) return number
is language java
name 'oracle.xml.parser.plsql.XMLNNMCover.getNamedItem(int, java.lang.String)
	returns int';

FUNCTION setNamedItem(id number, arg number, err in out number)
return number
is language java
name 'oracle.xml.parser.plsql.XMLNNMCover.setNamedItem(int, int,
                               int[])
returns int';

FUNCTION removeNamedItem(id number, name varchar2, err in out number)
return number
is language java
name 'oracle.xml.parser.plsql.XMLNNMCover.removeNamedItem(int,
        java.lang.String, int[]) returns int';

FUNCTION item(id number, idx number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNNMCover.item(int, int) returns int';

FUNCTION getLength(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNNMCover.getLength(int) returns int';

end;
/

SHOW ERRORS;


