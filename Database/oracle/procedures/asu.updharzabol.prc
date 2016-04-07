DROP PROCEDURE ASU.UPDHARZABOL
/

--
-- UPDHARZABOL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TLOG_EXP_IMP (Table)
--   TEXCHANGE_OWN (Table)
--   TEXCHANGE_THEIR (Table)
--
CREATE OR REPLACE PROCEDURE ASU."UPDHARZABOL" is


cursor cur is
select EXCH43.TEXCHANGE_THEIR.FN_CODE as cod_old,
       EXCH43.TEXCHANGE_THEIR.FC_VALUE,
       EXCH43.TEXCHANGE_OWN.FN_CODE as cod_new
  from EXCH43.TEXCHANGE_THEIR,EXCH43.TEXCHANGE_OWN
 where EXCH43.TEXCHANGE_OWN.FK_THEIR = EXCH43.TEXCHANGE_THEIR.FK_ID
   and EXCH43.TEXCHANGE_THEIR.fk_table = 661;


cursor cur2 is
 select fk_new_id from asu.tlog_exp_imp where fc_table in ('TDIAG');

begin

 for c in cur loop

     for c2 in cur2 loop

        update asu.tdiag t set t.fl_first = c.cod_new where t.fk_id = c2.fk_new_id and t.fl_first = c.cod_old;

        commit;

     end loop;

end loop;

end;
/

SHOW ERRORS;


