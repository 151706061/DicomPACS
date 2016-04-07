-- Start of DDL Script for Trigger MED.TKARTCOMPOS_DEL
-- Generated 22-èþë-2011 14:23:58 from MED@T100922

CREATE OR REPLACE TRIGGER med.tkartcompos_del
 BEFORE
  DELETE
 ON med.tkartcompos
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
--  med.pkg_prihrash.dodel(:OLD.FK_DOC_PRIH);
--  med.pkg_prihrash.dodel(:OLD.FK_DOC_RASH);
  DELETE FROM MED.TKARTCO_ITEM KI WHERE KI.fk_tkartcomposid = :OLD.FK_ID;
END;
/


-- End of DDL Script for Trigger MED.TKARTCOMPOS_DEL

