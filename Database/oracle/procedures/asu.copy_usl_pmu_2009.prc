DROP PROCEDURE ASU.COPY_USL_PMU_2009
/

--
-- COPY_USL_PMU_2009  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   THEAL (Table)
--   THEAL_COST (Table)
--
CREATE OR REPLACE PROCEDURE ASU."COPY_USL_PMU_2009" IS
  new_parent_heal_id NUMBER;
--  cur_heal_id NUMBER;
--  cur_NEW_heal_id NUMBER;
--  cur_NEW_vanalit_id NUMBER;
  
begin
  insert into asu.theal (code, fc_name, fk_parent, fl_tmp, fp_healtype)
  values ('œÃ”-2009', 'œÀ¿“Õ€≈ Ã≈ƒ»÷»Õ— »≈ ”—À”√» 2009', null, 0, 2)
  returning fk_id into new_parent_heal_id;
  
  -- ‚ÒÚ‡‚ÎˇÂÏ ÛÒÎÛ„Ë
  insert into asu.theal (code, fc_name, fk_parent, fl_tmp, fp_healtype, fk_id_copied)
  SELECT h.code, h.fc_name, new_parent_heal_id, h.fl_tmp, h.fp_healtype, h.fk_id
  from asu.theal h where h.fk_parent = 13960;
  
  for c in(select h.* from asu.theal h
           where h.FK_PARENT = new_parent_heal_id and h.fk_id_copied is not null
           order by h.fk_id) loop
           
  insert into asu.theal_cost (fk_healid, fd_date1, fd_date2, fn_cost,
       fk_companyid, fk_dogovorid, fl_kiosk)
select a.fk_id, a.fd_date1, a.fd_date2, a.fn_cost,
       a.fk_companyid, a.fk_dogovorid, a.fl_kiosk from
(select c.fk_id, fd_date1, fd_date2, fn_cost,
       fk_companyid, fk_dogovorid, fl_kiosk
from asu.theal_cost
where fk_healid = c.fk_id_copied
order by fd_date1 desc) a where ROWNUM < 2;
  end loop;  
    
end;
/

SHOW ERRORS;


