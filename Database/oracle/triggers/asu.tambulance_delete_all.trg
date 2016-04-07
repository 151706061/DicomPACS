DROP TRIGGER ASU.TAMBULANCE_DELETE_ALL
/

--
-- TAMBULANCE_DELETE_ALL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZAN (Table)
--   TNAZDEG (Table)
--   TPROFFACTOR_PEOPLES (Table)
--   TPROFP_LIST (Table)
--   TIB (Table)
--   TDATATEST (Table)
--   TDEGREMARK (Table)
--   TDIAG (Table)
--   TLABREG (Table)
--   TRESAN (Table)
--   TPACKATEGORIA (Table)
--   TAMBULANCE (Table)
--   TAMBVRACH (Table)
--   TANAMBOL (Table)
--   TANAMNEZ (Table)
--   TANTROP (Table)
--   TDOC (Table)
--   VRES (Table)
--   TTECHBOLEZNI (Table)
--   TTEMPSROKY (Table)
--   VNAZ (Table)
--   TPREDDIAG (Table)
--   TEPID (Table)
--   TEPIKRIZ (Table)
--
CREATE OR REPLACE TRIGGER ASU.TAMBULANCE_DELETE_ALL
 AFTER
 DELETE
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  Delete from TAMBVRACH where fk_pacid = :old.fk_id;
  Delete from TANAMBOL where fk_pacid = :old.fk_id;
  Delete from TANAMNEZ where fk_pacid = :old.fk_id;
  Delete from TANTROP where fk_pacid = :old.fk_id;
  Delete from TDATATEST where fk_pacid = :old.fk_id;
  Delete from TDEGREMARK where fk_pacid = :old.fk_id;
  Delete from TDIAG where fk_pacid = :old.fk_id;
  Delete from TEPID where fk_pacid = :old.fk_id;
  Delete from TEPIKRIZ where fk_pacid = :old.fk_id;
  Delete from TIB where fk_pacid = :old.fk_id;
  Delete from TNAZDEG where fk_pacid = :old.fk_id;
  Delete from TPACKATEGORIA where fk_pacid = :old.fk_id;
  Delete from TPREDDIAG where fk_pacid = :old.fk_id;
  Delete from TTECHBOLEZNI where fk_pacid = :old.fk_id;
  Delete from TTEMPSROKY where fk_pacid = :old.fk_id;
  Delete from VNAZ where fk_pacid = :old.fk_id;
  Delete from VRES where fk_pacid = :old.fk_id;
  Delete From TLABREG WHERE FK_PACID = :OLD.FK_ID;
  Delete From TNAZAN WHERE FK_PACID = :OLD.FK_ID;
  Delete From TRESAN WHERE FK_PACID = :OLD.FK_ID;
  DELETE FROM TDOC WHERE FK_KARTAID = :OLD.FK_ID; --by TimurLan 19/08/04
  DELETE FROM tprofp_list WHERE fk_ambulanceid = :OLD.FK_ID; --by vital 08/11/12
  DELETE FROM tproffactor_peoples WHERE FK_PACID = :OLD.FK_ID AND fn_type = 1; --by vital 08/11/12

End;
/
SHOW ERRORS;


