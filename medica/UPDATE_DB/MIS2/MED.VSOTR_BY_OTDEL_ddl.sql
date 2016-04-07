-- Start of DDL Script for View MED.VSOTR_BY_OTDEL
-- Generated 17-апр-2011 13:12:20 from MED@H100609

CREATE OR REPLACE VIEW med.vsotr_by_otdel (
   fk_id,
   fk_ownerid,
   fc_name,
   fn_level,
   fk_sotrid,
   fk_otdelid,
   fl_del )
AS
select ID as FK_ID, parent_id as FK_OWNERID, name as FC_NAME, 0 FN_LEVEL, null as FK_SOTRID, ID as FK_OTDELID, 0 as FL_DEL from mis.dept
UNION ALL
SELECT -ID as FK_ID, dept_id as FK_OWNERID, mis.pkg_emp.get_empfio_shot(id) as FC_NAME, 1 FN_LEVEL, ID as FK_SOTRID, dept_id as FK_OTDELID, 
       CASE WHEN (sysdate>=nvl(DATEBEG,sysdate))and(trunc(sysdate)<=nvl(DATEEND,sysdate)) THEN 0 else 1 END as FL_DEL 
       FROM mis.emp
/


-- End of DDL Script for View MED.VSOTR_BY_OTDEL

