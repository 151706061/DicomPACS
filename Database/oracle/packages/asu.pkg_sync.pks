DROP PACKAGE ASU.PKG_SYNC
/

--
-- PKG_SYNC  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_SYNC" is

  v_is_repl integer(1) := 0;

  procedure sync1(pTable in varchar2,
                  pKey   in varchar2,
                  pDir   in varchar2,
                  pDup   in number := 0,
                  pFK    in varchar2 := null);

  procedure sync2(pTable in varchar2,
                  pKey   in varchar2,
                  pSeq   in varchar2,
                  pDir   in varchar2,
                  pDup   in number := 0,
                  pFK    in varchar2 := null);

  procedure sync3(pTable in varchar2,
                  pKey   in varchar2,
                  pSeq   in varchar2,
                  pDir   in varchar2,
                  pDup   in number := 0,
                  pFK    in varchar2 := null);

  procedure crtr(pTable in varchar2, pFK in varchar2, pSeq in varchar);

  function get_smid(fk_id in number) return boolean;
  function get_company(pfk_id in number) return boolean;
  function get_smid_owner(pfk_ownerg in varchar) return number;
  function get_smid_ownerg(pfk_ownerg in number) return varchar;
  function GetGuidByID(ID in number, tab_name in varchar2) return varchar2;
  function GetIDByGuid(GUID in varchar2, tab_name in varchar2) return number;

end pkg_sync;
/

SHOW ERRORS;


