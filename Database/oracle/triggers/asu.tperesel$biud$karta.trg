DROP TRIGGER ASU.TPERESEL$BIUD$KARTA
/

--
-- TPERESEL$BIUD$KARTA  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TPERESEL (Table)
--   PKG_PERESEL (Package)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL$BIUD$KARTA" 
 BEFORE
 INSERT OR DELETE OR UPDATE
 ON ASU.TPERESEL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  -- запоминаем измененные краты для обхода мутации
  --AUTHOR: ZHUKOV
  IF INSERTING
  THEN
    IF :NEW.FK_PACID IS NOT NULL
    THEN
      pkg_peresel.ADD_karta_to_list (:NEW.FK_PACID);
    END IF;
  END IF;

  IF UPDATING ('FK_PACID') OR UPDATING ('FK_PALATAID')
  THEN
    pkg_peresel.ADD_karta_to_list (:NEW.FK_PACID);
  END IF;

  IF DELETING
  THEN
    pkg_peresel.ADD_karta_to_list (:OLD.FK_PACID);
  END IF;
END;
/
SHOW ERRORS;


