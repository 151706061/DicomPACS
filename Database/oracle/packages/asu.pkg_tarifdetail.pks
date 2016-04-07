DROP PACKAGE ASU.PKG_TARIFDETAIL
/

--
-- PKG_TARIFDETAIL  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_TARIFDETAIL IS
  function Add(aUse       in Number,
               aComment   in Varchar2,
               aPEOPLEID  in Number,
               apacid     in Number,
               atalonid   in Number,
               anazid     in Number,
               anazhealid in Number,
               apereselid in Number,
               aOwner     in Varchar2 default '') RETURN NUMBER;

  function AddPEOPLE(aUse      in Number,
                     aComment  in Varchar2,
                     aPEOPLEID in Number,
                     aOwner    in Varchar2 default '') RETURN NUMBER;

  function AddPac(aUse     in Number,
                  aComment in Varchar2,
                  apacid   in Number,
                  aOwner   in Varchar2 default '') RETURN NUMBER;

  function AddTalon(aUse     in Number,
                    aComment in Varchar2,
                    atalonid in Number,
                    aOwner   in Varchar2 default '') RETURN NUMBER;

  function AddNaz(aUse     in Number,
                  aComment in Varchar2,
                  anazid   in Number,
                  aOwner   in Varchar2 default '') RETURN NUMBER;

  function AddNazHeal(aUse       in Number,
                      aComment   in Varchar2,
                      anazhealid in Number,
                      aOwner     in Varchar2 default '') RETURN NUMBER;

  function AddPeresel(aUse       in Number,
                      aComment   in Varchar2,
                      apereselid in Number,
                      aOwner     in Varchar2 default '') RETURN NUMBER;

  procedure FillMissing(aOwner in varchar2);

  PROCEDURE ReplaceOwner(aOldOwner in varchar2, aNewOwner in varchar2);

  procedure DeleteByOwner(aOwner in Varchar2);

  PROCEDURE ReplaceOwnerByPacient(aOldOwner in varchar2, aNewOwner in varchar2, aPeopleID in Number);
END;
/

SHOW ERRORS;


