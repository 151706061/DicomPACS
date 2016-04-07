DROP PACKAGE ASU.PKG_NAZLIST
/

--
-- PKG_NAZLIST  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_NAZLIST" IS

  function get_nazlistlpu(pSMID in varchar2) Return varchar2;
  function get_nazlistaddr(pSMID in varchar2) Return varchar2;
  function get_nazlistwhere(pSMID in varchar2) Return varchar2;
  function get_nazlistsynonim(pSMID in varchar2) Return varchar2;
  function get_PacOtdel(pFK_PACID in Number, pFK_VRACHID in Number) Return varchar2;

END;
/

SHOW ERRORS;


