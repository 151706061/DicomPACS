DROP PACKAGE ASU.PKG_DEZHUR
/

--
-- PKG_DEZHUR  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_DEZHUR" is
  -- Author  : Marriage
  -- Created : 26.08.2009
  -- Purpose : График дежурств экстренной бригады ОКБ
   function GetSotrLIstInCell(pFK_DEZHURSPECID in number, pFD_DATE in Date) return varchar2;
   function GET_GRAPHDEZH (pDate in date) return clob;
end PKG_DEZHUR;
/

SHOW ERRORS;


