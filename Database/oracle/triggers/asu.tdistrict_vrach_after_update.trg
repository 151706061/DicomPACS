DROP TRIGGER ASU.TDISTRICT_VRACH_AFTER_UPDATE
/

--
-- TDISTRICT_VRACH_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSOTR (Synonym)
--   TDISTRICT_NAME (Table)
--   TDISTRICT_PACIENT (Table)
--   TDISTRICT_VRACH (Table)
--   TPEOPLES (Table)
--   TPEOPLES_DOPSTATUS (Table)
--   GET_SYNID (Function)
--
CREATE OR REPLACE TRIGGER ASU."TDISTRICT_VRACH_AFTER_UPDATE"
  AFTER UPDATE OF FK_SOTR ON ASU.TDISTRICT_VRACH   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF :NEW.FK_DIST_NAME_ID IS NOT NULL THEN
    update ASU.TPEOPLES_DOPSTATUS
       set FL_TFOMS_STATUS = 0
     where FK_PEPLID in (
                  select p.FK_ID
                    from ASU.TDISTRICT_PACIENT tdp
                         inner join ASU.TPEOPLES p on tdp.FK_PEPLID = p.FK_ID
                         inner join ASU.TDISTRICT_NAME tdn on tdp.fk_arealid = tdn.fk_id
                         inner join ASU.TDISTRICT_VRACH DV on tdn.fk_id = dv.fk_dist_name_id
                         inner join ASU.TSOTR s on dv.fk_sotr = s.fk_id
                         inner join ASU.TPEOPLES_DOPSTATUS pd on pd.FK_PEPLID = p.FK_ID
                   where s.fl_del = 0
                     and ((tdn.fk_typeid = ASU.GET_SYNID('THERAPIST_AREA') and trunc(months_between(sysdate, p.FD_ROJD) / 12) > 17)
                      or  (tdn.fk_typeid = ASU.GET_SYNID('PEDIATR_AREA') and trunc(months_between(sysdate, p.FD_ROJD) / 12) <= 17))
                     and tdn.fk_id = :NEW.FK_DIST_NAME_ID
                     and pd.fl_status = 1
           );
  END IF;
END;
/
SHOW ERRORS;


