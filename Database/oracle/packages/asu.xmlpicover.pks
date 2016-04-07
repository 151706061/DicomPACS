DROP PACKAGE ASU.XMLPICOVER
/

--
-- XMLPICOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLPICOVER" is

FUNCTION getTarget(id number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLPICover.getTarget(int) returns java.lang.String';

FUNCTION getData(id number, err in out number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLPICover.getData(int, int[])
returns java.lang.String';

PROCEDURE setData(id number, data varchar2, err in out number)
is language java
name 'oracle.xml.parser.plsql.XMLPICover.setData(int, java.lang.String,
                         int[])';

end;
/

SHOW ERRORS;


