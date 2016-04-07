DROP PACKAGE ASU.LOADLOBS
/

--
-- LOADLOBS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."LOADLOBS" IS
   column       BLOB;
   end_of_lob   BINARY_INTEGER;

   FUNCTION beginload(classfile VARCHAR2)
      RETURN VARCHAR2;

   PROCEDURE appendpiece(piece RAW, len BINARY_INTEGER);

   FUNCTION endload(classfile VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION beginread(classfile VARCHAR2, len OUT BINARY_INTEGER)
      RETURN VARCHAR2;

   FUNCTION getpiece(piece OUT RAW, len IN OUT BINARY_INTEGER)
      RETURN VARCHAR2;

   FUNCTION endread(classfile VARCHAR2)
      RETURN VARCHAR2;
END loadlobs;
/

SHOW ERRORS;


