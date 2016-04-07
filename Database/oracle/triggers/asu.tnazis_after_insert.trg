DROP TRIGGER ASU.TNAZIS_AFTER_INSERT
/

--
-- TNAZIS_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZIS (Table)
--   PKG_NEUROSOFT_LINK (Package)
--   PKG_SMINI (Package)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_AFTER_INSERT" 
  AFTER INSERT ON asu.tnazis
  REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
DISABLE
BEGIN
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  -- (с) 25.01.2004 Капустин А.В.
  -- Создать выходной XML файл с назначением
  IF pkg_smini.readstring('NEUROSOFT', 'OUTPUT', 'NO') = 'YES' THEN
    pkg_neurosoft_link.prc_create_ip_xml_file(:new.fk_id,:new.fk_smid,:new.fk_pacid);
  END IF;
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
END;
/
SHOW ERRORS;


