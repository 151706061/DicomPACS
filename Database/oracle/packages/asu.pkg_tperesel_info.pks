DROP PACKAGE ASU.PKG_TPERESEL_INFO
/

--
-- PKG_TPERESEL_INFO  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_TPERESEL_INFO IS
  function  GetINFO_BY_PERESEL(pFK_PERESEL in number, pFL_IN_INTERIM in number) return number;
  procedure SetFK_TRANSFSOTR(pFK_PERESEL in number, pFK_TRANSFSOTR in number, pFL_IN_INTERIM in number);
  function  GetFK_TRANSFSOTR(pFK_PERESEL in number) return number;

  function  GetFK_TRANSFSOTR_I(pFK_PERESEL_INTERIM in number) return number;
  function  GetINFO_BY_PERESEL_I(pFK_PERESEL_INTERIM in number) return number;
  procedure SetFK_TRANSFSOTR_I(pFK_PERESEL_INTERIM in number, pFK_TRANSFSOTR in number);

  -- pIS_INTERIM = 1, значит pFK_ID это TPERESEL_INTERIM.FK_ID, иначе TPERESEL.FK_ID
  procedure SetPrevFK_TRANSFSOTR(pFK_ID in number, pIS_INTERIM in number, pFK_TRANSFSOTR in number);
  procedure SetLastFK_TRANSFSOTR(pFK_PACID in number, pFK_TRANSFSOTR in number);
END PKG_TPERESEL_INFO;
/

SHOW ERRORS;


