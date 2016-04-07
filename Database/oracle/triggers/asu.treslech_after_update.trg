DROP TRIGGER ASU.TRESLECH_AFTER_UPDATE
/

--
-- TRESLECH_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZLECH (Table)
--   TRESLECH (Table)
--   VRES (Table)
--   PKG_VNAZ (Package)
--   GET_NAZ_PROCESS (Function)
--   GET_NEVIP (Function)
--   GET_VIPNAZ (Function)
--   INSNAZ (Package)
--
CREATE OR REPLACE TRIGGER ASU."TRESLECH_AFTER_UPDATE" 
 AFTER 
 UPDATE
 ON ASU.TRESLECH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  if insnaz.bins then
    return;
  end if;
  insnaz.bins:=true;
  update vres set
    fk_id=:new.fk_id,
    FK_SMID=:new.FK_SMID,
    FD_INS=:new.FD_INS,
    FC_RES=:new.FC_RES,
    FK_BLOBID=:new.FK_BLOBID,
    FN_RES=:new.FN_RES,
    FC_TYPE=:new.FC_TYPE,
    FK_VRACHID=:new.FK_VRACHID,
    FK_PACID=:new.FK_PACID,
    FK_NAZID=:new.FK_NAZID,
    FK_PATID=:new.FK_PATID,
    FC_COMENT=:new.FC_COMENT,
    FK_SOS=:new.FK_SOS,
    FL_ZAKL=null,
    FL_PATFIRST=:new.FL_PATFIRST
  where fk_id=:old.FK_ID;

  IF :new.fk_sos=get_vipnaz THEN
--    pkg_mednaz.calculation_proc_medics(:old.fk_id);
      IF pkg_vnaz.GET_PROC_FULL_COUNT(:new.fk_nazid)=pkg_vnaz.GET_PROC_VIP_COUNT(:new.fk_nazid) THEN
        update /*+rule*/ tnazlech set fk_nazsosid=get_vipnaz where fk_id=:new.fk_nazid;
      ELSE
        update /*+rule*/ tnazlech set fk_nazsosid=get_naz_process where fk_id=:new.fk_nazid;
      END IF;
  ELSIF :new.fk_sos=get_nevip THEN
--    pkg_mednaz.discard_proc_medics(:old.fk_id);
      IF pkg_vnaz.GET_PROC_VIP_COUNT(:new.fk_nazid)=0 THEN
        update /*+rule*/ asu.tnazlech set fk_nazsosid=get_nevip where fk_id=:new.fk_nazid;
      ELSE
        update /*+rule*/ asu.tnazlech set fk_nazsosid=get_naz_process where fk_id=:new.fk_nazid;
      END IF;
  END IF;
  insnaz.bins:=false;
  exception
    when others then
      insnaz.bins:=false;
      raise;

End;
/
SHOW ERRORS;


