DROP PACKAGE ASU.XMLNODELISTCOVER
/

--
-- XMLNODELISTCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLNODELISTCOVER" is

FUNCTION getLength(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeListCover.getLength(int) returns int';

FUNCTION item(id number, idx number) return number
is language java
name 'oracle.xml.parser.plsql.XMLNodeListCover.item(int, int) returns int';

end;
/

SHOW ERRORS;


