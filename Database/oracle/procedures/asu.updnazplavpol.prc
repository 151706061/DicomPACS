DROP PROCEDURE ASU.UPDNAZPLAVPOL
/

--
-- UPDNAZPLAVPOL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLOG_EXP_IMP (Table)
--   TAMBTALON (Table)
--   VRES (Table)
--   TEXCHANGE_OWN (Table)
--   TEXCHANGE_THEIR (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU."UPDNAZPLAVPOL" is


cursor cur is
select EXCH43.TEXCHANGE_THEIR.FN_CODE as cod_old,
       EXCH43.TEXCHANGE_THEIR.FC_VALUE,
       EXCH43.TEXCHANGE_OWN.FN_CODE as cod_new
  from EXCH43.TEXCHANGE_THEIR,EXCH43.TEXCHANGE_OWN
 where EXCH43.TEXCHANGE_OWN.FK_THEIR = EXCH43.TEXCHANGE_THEIR.FK_ID
   and EXCH43.TEXCHANGE_THEIR.fk_table = 641;


cursor cur2 is
 select fk_new_id from asu.tlog_exp_imp where fc_table in ('VNAZ');
 
cursor cur3 is
 select fk_new_id from asu.tlog_exp_imp where fc_table in ('VRES');
 
cursor cur4 is
 select fk_new_id from asu.tlog_exp_imp where fc_table in ('TAMBTALON');


begin


 for c in cur loop

     for c2 in cur2 loop

        --update asu.tib t set t.fk_smid = c.cod_new where t.fk_id = c2.fk_new_id and t.fk_smid = c.cod_old;
        update asu.vnaz t set t.fk_ispolid = c.cod_new where t.fk_id = c2.fk_new_id and t.fk_ispolid = c.cod_old;
        update asu.vnaz t set t.fk_vrachid = c.cod_new where t.fk_id = c2.fk_new_id and t.fk_vrachid = c.cod_old;  
       
        commit;

     end loop;
     
      for c3 in cur3 loop
       
        update asu.vres t set t.fk_vrachid = c.cod_new where t.fk_id = c3.fk_new_id and t.fk_vrachid = c.cod_old;
       
        commit;

     end loop;
     
      for c4 in cur4 loop
        
        update asu.tambtalon t set t.fk_sotrid = c.cod_new where t.fk_id = c4.fk_new_id and t.fk_sotrid = c.cod_old;
        update asu.tambtalon t set t.fk_sotrclosed = c.cod_new where t.fk_id = c4.fk_new_id and t.fk_sotrclosed = c.cod_old;
      
        commit;

     end loop;
end loop;

end;
/

SHOW ERRORS;


