-- Start of DDL Script for Trigger MED.TDOCS_DELETE
-- Generated 13-янв-2011 11:29:04 from MED@H100609

CREATE OR REPLACE TRIGGER med.tdocs_delete
 BEFORE
  DELETE
 ON med.tdocs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   UPDATE MED.TKARTCOMPOS SET FK_DOC_PRIH = null WHERE FK_DOC_PRIH = :OLD.dpid;
   UPDATE MED.TKARTCOMPOS SET FK_DOC_RASH = null WHERE FK_DOC_RASH = :OLD.dpid;

   if :OLD.fp_vid = 1 then -- если удалили приходный документ, надо удалить везде используемые в нем партии
     delete from med.tdpc  dp where dp.kartid in(select dp2.kartid from med.tdpc dp2 where dp2.dpid = :OLD.dpid);
   end if;

   DELETE FROM MED.tdpc
   WHERE       dpid = :OLD.dpid;

   UPDATE MED.TTreb t
   SET t.fc_treb = NULL
   WHERE t.fk_dpid = :OLD.dpid;
   
   delete from med.tcalc_prih_rash where dpid = :OLD.dpid;
END;
/


-- End of DDL Script for Trigger MED.TDOCS_DELETE

