DROP PACKAGE ASU.XMLDOMIMPLCOVER
/

--
-- XMLDOMIMPLCOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLDOMIMPLCOVER" is

FUNCTION hasFeature(id number, feature varchar2, version varchar2)
	return number
is language java
name 'oracle.xml.parser.plsql.XMLDOMImplCover.hasFeature(int, java.lang.String,
	java.lang.String) returns boolean';

end;
/

SHOW ERRORS;


