-- Start of DDL Script for View MED.VINVMO
-- Generated 02.07.2007 16:01:55 from MED@asu

CREATE OR REPLACE VIEW med.vinvmo (
   groupid,
   fc_group,
   fl_del )
AS
SELECT groupid, fc_group, fl_del
FROM med.tmo_group
where fl_del = 0
/


-- End of DDL Script for View MED.VINVMO

