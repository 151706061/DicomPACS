DROP TRIGGER ASU.TR_TSMID_S
/

--
-- TR_TSMID_S  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TSMID (Sequence)
--   SEQ_SYNC_LOG (Sequence)
--   TSMID (Table)
--   TSMID_S (Table)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TSMID_S" 
    AFTER INSERT ON tsmid_s FOR EACH ROW
DISABLE
declare
    vID  number;
    vStr varchar(2000);
     vtsmidfk_owner number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from tsmid t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.fk_id into vtsmidfk_owner from asu.tsmid t where t.fk_guid = :new.fk_ownerg;
         exception when others then null;
         end;
        
      update tsmid set FK_GUID = :new.FK_GUID,FC_NAME = :new.FC_NAME,FK_CLASS = :new.FK_CLASS,FK_CHANGE = :new.FK_CHANGE,FC_ED_IZM = :new.FC_ED_IZM,FN_LOW_M = :new.FN_LOW_M,FN_HI_M = :new.FN_HI_M,FN_LOW_W = :new.FN_LOW_W,FN_HI_W = :new.FN_HI_W,FP_PAT = :new.FP_PAT,FC_TIME = :new.FC_TIME,FN_ED = :new.FN_ED,FC_REMARK = :new.FC_REMARK,FK_LOINC_CODE = :new.FK_LOINC_CODE,FC_SYNONIM = :new.FC_SYNONIM,FC_ANSWER = :new.FC_ANSWER,FC_ANSWER_W = :new.FC_ANSWER_W,FC_ANSWER_M = :new.FC_ANSWER_M,FK_MKB9 = :new.FK_MKB9,FK_MKB10 = :new.FK_MKB10,FP_ISFOLDER = :new.FP_ISFOLDER,FC_TYPE = :new.FC_TYPE,FN_ORDER = :new.FN_ORDER,FK_DEFAULT = :new.FK_DEFAULT,FN_COUNT = :new.FN_COUNT,FN_PEOPLE = :new.FN_PEOPLE,FN_PRICE = :new.FN_PRICE,FN_NORM0 = :new.FN_NORM0,FN_NORM0M = :new.FN_NORM0M,FN_NORM1 = :new.FN_NORM1,FN_NORM1M = :new.FN_NORM1M,FN_COST1 = :new.FN_COST1,FN_COST2 = :new.FN_COST2,FN_COST3 = :new.FN_COST3,FP_INOUT = :new.FP_INOUT,FL_SHOWANAL = :new.FL_SHOWANAL,FL_STAT = :new.FL_STAT,FL_SHOWPRINT = :new.FL_SHOWPRINT,FL_SHOWDIAGPREDZAKL = :new.FL_SHOWDIAGPREDZAKL,FN_EDCHILD = :new.FN_EDCHILD,FL_PLATDEFAULT = :new.FL_PLATDEFAULT,FL_USLUGA = :new.FL_USLUGA,FL_DEL = :new.FL_DEL,FK_MZKOD = :new.FK_MZKOD,FL_REQUIRED = :new.FL_REQUIRED,fk_owner = vtsmidfk_owner
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.fk_id into vtsmidfk_owner from asu.tsmid t where t.fk_guid = :new.fk_ownerg;
         exception when others then null;
         end;
        
        insert into tsmid(FK_ID,FK_GUID,FC_NAME,FK_CLASS,FK_CHANGE,FC_ED_IZM,FN_LOW_M,FN_HI_M,FN_LOW_W,FN_HI_W,FP_PAT,FC_TIME,FN_ED,FC_REMARK,FK_LOINC_CODE,FC_SYNONIM,FC_ANSWER,FC_ANSWER_W,FC_ANSWER_M,FK_MKB9,FK_MKB10,FP_ISFOLDER,FC_TYPE,FN_ORDER,FK_DEFAULT,FN_COUNT,FN_PEOPLE,FN_PRICE,FN_NORM0,FN_NORM0M,FN_NORM1,FN_NORM1M,FN_COST1,FN_COST2,FN_COST3,FP_INOUT,FL_SHOWANAL,FL_STAT,FL_SHOWPRINT,FL_SHOWDIAGPREDZAKL,FN_EDCHILD,FL_PLATDEFAULT,FL_USLUGA,FL_DEL,FK_MZKOD,FL_REQUIRED,fk_owner)
             values (SEQ_TSMID.nextval,:new.FK_GUID,:new.FC_NAME,:new.FK_CLASS,:new.FK_CHANGE,:new.FC_ED_IZM,:new.FN_LOW_M,:new.FN_HI_M,:new.FN_LOW_W,:new.FN_HI_W,:new.FP_PAT,:new.FC_TIME,:new.FN_ED,:new.FC_REMARK,:new.FK_LOINC_CODE,:new.FC_SYNONIM,:new.FC_ANSWER,:new.FC_ANSWER_W,:new.FC_ANSWER_M,:new.FK_MKB9,:new.FK_MKB10,:new.FP_ISFOLDER,:new.FC_TYPE,:new.FN_ORDER,:new.FK_DEFAULT,:new.FN_COUNT,:new.FN_PEOPLE,:new.FN_PRICE,:new.FN_NORM0,:new.FN_NORM0M,:new.FN_NORM1,:new.FN_NORM1M,:new.FN_COST1,:new.FN_COST2,:new.FN_COST3,:new.FP_INOUT,:new.FL_SHOWANAL,:new.FL_STAT,:new.FL_SHOWPRINT,:new.FL_SHOWDIAGPREDZAKL,:new.FN_EDCHILD,:new.FL_PLATDEFAULT,:new.FL_USLUGA,:new.FL_DEL,:new.FK_MZKOD,:new.FL_REQUIRED,vtsmidfk_owner);
    end if;
    
    PKG_sync.v_is_repl := 0;
   end if;
exception when others then
     begin
      PKG_sync.v_is_repl := 0;
      select seq_sync_log.nextval into vID from dual;
      vStr := SQLERRM;
      insert into tsync_log values (vID, systimestamp(3), vStr);
     end;
END;
/
SHOW ERRORS;


