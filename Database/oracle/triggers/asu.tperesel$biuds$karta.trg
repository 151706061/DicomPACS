DROP TRIGGER ASU.TPERESEL$BIUDS$KARTA
/

--
-- TPERESEL$BIUDS$KARTA  (Trigger) 
--
--  Dependencies: 
--   TPERESEL (Table)
--   PKG_PERESEL (Package)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL$BIUDS$KARTA" 
 BEFORE
 INSERT OR DELETE OR UPDATE
 ON ASU.TPERESEL  REFERENCING OLD AS OLD NEW AS NEW
BEGIN
  -- инициализирует коллекцию измененных карт для переселов
  -- Author: Zhukov
  ASU.pkg_peresel.INIT_TABLES;
END;
/
SHOW ERRORS;


