DROP PROCEDURE ASU.UPDISHODZABOL
/

--
-- UPDISHODZABOL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLOG_EXP_IMP (Table)
--   TAMBTALON (Table)
--   TEXCHANGE_OWN (Table)
--   TEXCHANGE_THEIR (Table)
--
CREATE OR REPLACE PROCEDURE ASU."UPDISHODZABOL" is


cursor cur is
select EXCH43.TEXCHANGE_THEIR.FN_CODE as cod_old,
       EXCH43.TEXCHANGE_THEIR.FC_VALUE,
       EXCH43.TEXCHANGE_OWN.FN_CODE as cod_new
  from EXCH43.TEXCHANGE_THEIR,EXCH43.TEXCHANGE_OWN
 where EXCH43.TEXCHANGE_OWN.FK_THEIR = EXCH43.TEXCHANGE_THEIR.FK_ID
   and EXCH43.TEXCHANGE_THEIR.fk_table = 681;


cursor cur2 is
 select fk_new_id from asu.tlog_exp_imp where fc_table in ('TAMBTALON');

begin

 for c in cur loop

     for c2 in cur2 loop

        update asu.tambtalon t set t.fk_dopishodid = c.cod_new where t.fk_id = c2.fk_new_id and t.fk_dopishodid = c.cod_old;

        commit;

     end loop;

end loop;

end;
/

SHOW ERRORS;


