DROP PACKAGE ASU.PKGKURS
/

--
-- PKGKURS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKGKURS" 
  IS

procedure doins(aname in varchar2,aid in number,nsotrid in number);
procedure doset (akurlistid in number,apacid in number,prizn in number);

END; -- Package spec
/

SHOW ERRORS;


