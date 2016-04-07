ALTER TABLE MED.TKARTCOMPOS 
 ADD (
  FK_DOC_PRIH NUMBER (14),
  FK_DOC_RASH NUMBER (14)
 )
/
COMMENT ON COLUMN MED.TKARTCOMPOS.FK_DOC_PRIH IS 'внешний ключ на документ, который является ПРИХОДНЫМ после подписания операции производства'
/
COMMENT ON COLUMN MED.TKARTCOMPOS.FK_DOC_RASH IS 'внешний ключ на документ, который является РАСХОДНЫМ после подписания операции производства'
/

CREATE OR REPLACE TRIGGER MED.TKARTCOMPOS_DEL
 BEFORE 
 DELETE
 ON MED.TKARTCOMPOS
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
BEGIN
  med.pkg_prihrash.dodel_doc_dpc_kart(:OLD.FK_DOC_PRIH); -- поскольку в приходе создавались партии - теперь их быть не должно
  med.pkg_prihrash.dodel(:OLD.FK_DOC_RASH);
  DELETE FROM MED.TKARTCO_ITEM KI WHERE KI.fk_tkartcomposid = :OLD.FK_ID;
END;
/

CREATE OR REPLACE TRIGGER MED.TDOCS_DELETE
 BEFORE 
 DELETE
 ON MED.TDOCS
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
BEGIN
   UPDATE MED.TKARTCOMPOS SET FK_DOC_PRIH = null WHERE FK_DOC_PRIH = :OLD.dpid;
   UPDATE MED.TKARTCOMPOS SET FK_DOC_RASH = null WHERE FK_DOC_RASH = :OLD.dpid;
   
   DELETE FROM tdpc
   WHERE       dpid = :OLD.dpid;
   
   UPDATE TTreb t
   SET t.fc_treb = NULL
   WHERE t.fk_dpid = :OLD.dpid;
END;
/
