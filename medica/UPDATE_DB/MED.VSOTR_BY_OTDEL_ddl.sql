-- Start of DDL Script for View MED.VSOTR_BY_OTDEL
-- Generated 17-апр-2011 15:41:01 from MED@H100609

CREATE OR REPLACE VIEW med.vsotr_by_otdel (
   fk_id,
   fk_ownerid,
   fc_name,
   fn_level,
   fk_sotrid,
   fk_otdelid,
   fl_del )
AS
SELECT FK_ID, FK_OWNERID,FC_NAME, 0 FN_LEVEL, null as FK_SOTRID, FK_ID as FK_OTDELID, FL_DEL FROM LOGIN.TOTDEL
UNION ALL
SELECT -FK_ID as FK_ID, FK_OTDID as FK_OWNERID,ASU.GET_SOTRNAME(FK_ID) FC_NAME, 1 FN_LEVEL, FK_ID as FK_SOTRID, FK_OTDID as FK_OTDELID, FL_DEL FROM login.tsotr
/


-- End of DDL Script for View MED.VSOTR_BY_OTDEL

