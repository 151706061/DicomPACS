DROP PACKAGE ASU.PKG_PERESEL
/

--
-- PKG_PERESEL  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PERESEL" 
IS
  --
  -- Purpose: Специальный пакет для обхода мутации в тригерах на таблице TPERESEL
  -- Author: Zhukov
  -- MODIFICATION HISTORY
  -- Person      Date    Comments
  -- ---------   ------  ------------------------------------------
  --  Zhukov 2009-11-18  Создад пакет

  PROCEDURE INIT_TABLES;

  PROCEDURE ADD_karta_to_list (p_FK_KARTA IN INTEGER);

  PROCEDURE SET_TKARTA_FK_ROOM;
END;
/

SHOW ERRORS;


