-- Start of DDL Script for Trigger MED.TDPC_AFTER_DELETE
-- Generated 27-дек-2010 16:19:16 from MED@H100609

CREATE OR REPLACE TRIGGER med.tdpc_after_delete
 AFTER
  DELETE
 ON med.tdpc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  UPDATE MED.TTREB_DPC
  SET FK_DPCID = NULL
  WHERE FK_DPCID = :OLD.DPCID;

  delete from asu.tmedicgiven mg where mg.fk_dpcid = :OLD.DPCID and mg.fk_nazmark is null;

  delete from med.ttemp_ost a
  where a.fk_kartid = :OLD.kartid;
  
  delete from med.TCALC_PRIH_RASH a
  where a.dpid = :OLD.dpid and a.dpcid = :OLD.dpcid;
END TDPC_AFTER_DELETE;
/


-- End of DDL Script for Trigger MED.TDPC_AFTER_DELETE

