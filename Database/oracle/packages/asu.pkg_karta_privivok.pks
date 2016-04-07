DROP PACKAGE ASU.PKG_KARTA_PRIVIVOK
/

--
-- PKG_KARTA_PRIVIVOK  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_KARTA_PRIVIVOK" is

  -- Author  : Shpielevoy D.I.
  -- Created : 28.10.2009 
  -- Purpose : Карта прививок пациента

  -- Получить личные данные человека
  -- %param  ppeople_id
  function get_karta_privivok(pPeopleID number) return clob;

end pkg_karta_privivok;
/

SHOW ERRORS;


