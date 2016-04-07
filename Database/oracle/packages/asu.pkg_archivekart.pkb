DROP PACKAGE BODY ASU.PKG_ARCHIVEKART
/

--
-- PKG_ARCHIVEKART  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_ARCHIVEKART" 
is
   procedure Do_Archive_Kart(pPacId Number,pSotrId Number,pArchiveDate Date,pReason Number,pComment Varchar2) is
   begin
      update asu.tambulance a set a.fl_vyb = 1 where fk_id = pPacId;
      update asu.tkarta a set a.fl_vyb = 1 where fk_id = pPacId;
      insert into asu.tkart_archiv (fk_pacid,fk_sotr,fd_actiondate,fk_reason,fc_reason,fp_action)
       values (pPacId,pSotrId,pArchiveDate,pReason,pComment,0);
   end;

   procedure Do_Annul_Archive_Kart(pPacId Number,pSotrId Number) is
   begin
     update asu.tambulance set fl_vyb = 0 where fk_id = pPacId;
     update asu.tkarta set fl_vyb = 0, fl_vyb2 = 0 where fk_id = pPacId;
     insert into asu.tkart_archiv (fk_pacid,fk_sotr,fp_action)
       values (pPacId,pSotrId,1);
   end;

  function IsKartInArchiv(pPacID Number) return Number
  is
     v_cnt Number;
     v_res Number;
  begin
     select count(1) into v_cnt from
        (select a.fk_id from asu.tambulance a where a.fk_id = pPacID and a.fl_vyb = 1
         union all
         select a.fk_id from asu.tkarta a where a.fk_id = pPacID and a.fl_vyb = 1);
     if v_cnt > 0 then
       v_res := 1;
     else
       v_res := 0;
     end if;
     return v_res;
  end;
end;
/

SHOW ERRORS;


