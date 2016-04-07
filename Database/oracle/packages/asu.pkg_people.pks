DROP PACKAGE ASU.PKG_PEOPLE
/

--
-- PKG_PEOPLE  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PEOPLE" as

  Function GetF_IO(p_FK_ID IN integer) Return Varchar2;
  PRAGMA restrict_references(GetF_IO,WNDS,WNPS);

  Function GetFIO(p_FK_ID IN integer) Return Varchar2;
  PRAGMA restrict_references(GetFIO,WNDS,WNPS);
  Function Sotr_GetF_IO(p_FK_ID IN integer) Return Varchar2;
  PRAGMA restrict_references(Sotr_GetF_IO,WNDS,WNPS);

  FUNCTION make_f_io (
  p_fam           IN   VARCHAR2,
  p_name          IN   VARCHAR2,
  p_second_name   IN   VARCHAR2
)
  RETURN VARCHAR2;

  PRAGMA restrict_references(make_f_io,WNDS,WNPS);

end PKG_PEOPLE;
/

SHOW ERRORS;


