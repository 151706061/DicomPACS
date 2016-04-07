DROP PACKAGE ASU.PKG_PRIVACY
/

--
-- PKG_PRIVACY  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PRIVACY" is

  -- Author  : Shpielevoy D.I.
  -- Created : 30.09.2009 16:02:37
  -- Purpose : Персональные данные человека
  
  -- Получить личные данные человека
  -- %param  ppeople_id
  function get_personaldata(pPeopleID number) return clob;

end PKG_PRIVACY;
/

SHOW ERRORS;


