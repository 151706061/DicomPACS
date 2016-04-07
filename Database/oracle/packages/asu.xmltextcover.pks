DROP PACKAGE ASU.XMLTEXTCOVER
/

--
-- XMLTEXTCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLTEXTCOVER" is

FUNCTION splitText(id number, offset number, err in out number)
return number
is language java
name 'oracle.xml.parser.plsql.XMLTextCover.splitText(int, int, int[])
returns int';

end;
/

SHOW ERRORS;


