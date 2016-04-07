DROP PACKAGE ASU.XMLCHARDATACOVER
/

--
-- XMLCHARDATACOVER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."XMLCHARDATACOVER" is

FUNCTION getData(id number, err in out number) return varchar2
is language java
name 'oracle.xml.parser.plsql.XMLCharDataCover.getData(int, int[])
returns java.lang.String';

PROCEDURE setData(id number, data varchar2, err in out number)
is language java
name 'oracle.xml.parser.plsql.XMLCharDataCover.setData(int, java.lang.String,
                               int[])';

FUNCTION getLength(id number) return number
is language java
name 'oracle.xml.parser.plsql.XMLCharDataCover.getLength(int) returns int';

FUNCTION substringData(id number, offset number, count number,
                       err in out number)
	return varchar2 is language java
name 'oracle.xml.parser.plsql.XMLCharDataCover.substringData(int, int, int,
                                     int[])
	returns java.lang.String';

PROCEDURE appendData(id number, arg varchar2, err in out number)
is language java
name 'oracle.xml.parser.plsql.XMLCharDataCover.appendData(int, java.lang.String,
                                  int[])';

PROCEDURE insertData(id number, offset number, arg varchar2,
                     err in out number)
is language java
name 'oracle.xml.parser.plsql.XMLCharDataCover.insertData(int, int, java.lang.String,
                                  int[])';

PROCEDURE deleteData(id number, offset number, count number,
                     err in out number)
is language java
name 'oracle.xml.parser.plsql.XMLCharDataCover.deleteData(int, int, int,
                                  int[])';

PROCEDURE replaceData(id number, offset number, count number, arg varchar2,
                      err in out number)
is language java
name 'oracle.xml.parser.plsql.XMLCharDataCover.replaceData(int, int, int,
                                   java.lang.String, int[])';

end;
/

SHOW ERRORS;


