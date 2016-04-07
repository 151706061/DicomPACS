DROP PROCEDURE ASU.COPY_USL
/

--
-- COPY_USL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   THEAL (Table)
--   TS_DOLJNOST (Table)
--   TS_MBP (Table)
--   TUSL_KART (Table)
--   TS_OS (Table)
--
CREATE OR REPLACE PROCEDURE ASU."COPY_USL" IS
  new_parent_heal_id NUMBER;
--  cur_heal_id NUMBER;
--  cur_NEW_heal_id NUMBER;
--  cur_NEW_vanalit_id NUMBER;
  
begin
  insert into asu.theal (code, fc_name, fk_parent, fl_tmp, fp_healtype)
  values ('ЗБМУ', 'Затраты бюджета на медицинские услуги', null, 0, 2)
  returning fk_id into new_parent_heal_id;
  
  -- вставляем услуги
  insert into asu.theal (code, fc_name, fk_parent, fl_tmp, fp_healtype, fk_id_copied)
  SELECT h.code, h.fc_name, new_parent_heal_id, h.fl_tmp, h.fp_healtype, h.fk_id from asu.theal h where h.fk_parent = 13960;

  -- ОС
  insert into BUH.TS_OS (fk_groupid, fk_namesid, fn_del, fc_inventar, fc_zavod, 
                         fd_exp, fd_vypusk, fn_cena, fk_amortid, fn_group_kart, 
                         fn_koef_pereoc, fn_amortsum, fd_amortdate, fc_remark, fk_id_copied)
  select os.fk_groupid, os.fk_namesid, os.fn_del, os.fc_inventar, os.fc_zavod, 
         os.fd_exp, os.fd_vypusk, os.fn_cena, os.fk_amortid, os.fn_group_kart, 
         os.fn_koef_pereoc, os.fn_amortsum, os.fd_amortdate, os.fc_remark, os.fk_id
  from asu.theal h, asu.tusl_kart uk, BUH.TS_OS os
  where uk.fk_healid = h.fk_id_copied 
    and h.fk_parent = new_parent_heal_id
    and os.fk_id = uk.fk_analit
  GROUP BY os.fk_groupid, os.fk_namesid, os.fn_del, os.fc_inventar, os.fc_zavod, 
         os.fd_exp, os.fd_vypusk, os.fn_cena, os.fk_amortid, os.fn_group_kart, 
         os.fn_koef_pereoc, os.fn_amortsum, os.fd_amortdate, os.fc_remark, os.fk_id;  

  -- МБП
  insert into BUH.ts_mbp (fk_namesid, fk_groupid, fn_del, fk_eiid,
                          fn_fasov, fn_kod, fc_ei, fd_date, fn_god, 
                          fn_cena, fk_apteka_doc_id, fk_id_copied)
  select c_mbp.fk_namesid, c_mbp.fk_groupid, c_mbp.fn_del, c_mbp.fk_eiid,
         c_mbp.fn_fasov, c_mbp.fn_kod, c_mbp.fc_ei, c_mbp.fd_date, 
         c_mbp.fn_god, c_mbp.fn_cena, c_mbp.fk_apteka_doc_id, c_mbp.fk_id
  from asu.theal h, asu.tusl_kart uk, BUH.ts_mbp c_mbp
  where uk.fk_healid = h.fk_id_copied 
    and h.fk_parent = new_parent_heal_id
    and c_mbp.fk_id = uk.fk_analit
  GROUP BY c_mbp.fk_namesid, c_mbp.fk_groupid, c_mbp.fn_del, c_mbp.fk_eiid,
         c_mbp.fn_fasov, c_mbp.fn_kod, c_mbp.fc_ei, c_mbp.fd_date, 
         c_mbp.fn_god, c_mbp.fn_cena, c_mbp.fk_apteka_doc_id, c_mbp.fk_id;        

  -- Должности
  insert into BUH.ts_doljnost (fk_groupid, fk_namesid, fn_del, fn_stavka,
                               fn_norm_rab_vrem, fc_razryad, fk_otdelid, fk_id_copied)
  select c_dol.fk_groupid, c_dol.fk_namesid, c_dol.fn_del, c_dol.fn_stavka,
         c_dol.fn_norm_rab_vrem, c_dol.fc_razryad, c_dol.fk_otdelid, c_dol.fk_id
  from asu.theal h, asu.tusl_kart uk, BUH.ts_doljnost c_dol
  where uk.fk_healid = h.fk_id_copied 
    and h.fk_parent = new_parent_heal_id
    and c_dol.fk_id = uk.fk_analit
  GROUP BY c_dol.fk_groupid, c_dol.fk_namesid, c_dol.fn_del, c_dol.fn_stavka,
         c_dol.fn_norm_rab_vrem, c_dol.fc_razryad, c_dol.fk_otdelid, c_dol.fk_id;        
         
  -- вставляем карточки
  insert into asu.tusl_kart (fk_healid, fk_groupid, fk_analit, fn_kol,
                             fn_dlit_min, fn_kol_min_mes, fn_del, fk_id_copied)
select h.fk_id, uk.fk_groupid, va.fk_id, uk.fn_kol,
         uk.fn_dlit_min, uk.fn_kol_min_mes, uk.fn_del, uk.fk_id 
  from asu.theal h, asu.tusl_kart uk ,
       ( select os.fk_id, os.fk_id_copied from BUH.TS_OS os where os.fk_id_copied is not null
        UNION ALL
         select c_mbp.fk_id, c_mbp.fk_id_copied from BUH.ts_mbp c_mbp where c_mbp.fk_id_copied is not null
        UNION ALL
         select c_dol.fk_id, c_dol.fk_id_copied from BUH.ts_doljnost c_dol where c_dol.fk_id_copied is not null
        ) va 
  where  h.fk_id_copied is not null
    and uk.fk_healid = h.fk_id_copied
    and uk.fk_analit = va.fk_id_copied
  GROUP BY h.fk_id, uk.fk_groupid, va.fk_id, uk.fn_kol,
           uk.fn_dlit_min, uk.fn_kol_min_mes, uk.fn_del, uk.fk_id;
           
           
  /*
  cur_heal_id := -1;
  -- идем по всем услугам и карточкам
  for c in(select h.code, h.fc_name, h.fk_parent, h.fl_tmp, h.fp_healtype, h.fn_dlit, uk.*
           from asu.theal h, asu.tusl_kart uk
           where uk.fk_healid = h.fk_id and h.fk_parent = 13960
           order by h.code, h.fk_id, uk.fk_groupid, uk.fk_analit
           ) loop
    if cur_heal_id <> c.FK_HEALID then
      cur_heal_id := c.FK_HEALID;
      insert into asu.theal (code, fc_name, fk_parent, fl_tmp, fp_healtype)
      values (c.code, c.fc_name, new_parent_heal_id, c.fl_tmp, c.fp_healtype)
      returning fk_id into cur_NEW_heal_id; 
    end if;  
    asu.pkg_smini.writestring('USL','ID', TO_CHAR(c.FK_HEALID));
    -- получаем cur_NEW_vanalit_id
    CASE 
      WHEN c.FK_GROUPID in(1123) THEN -- ОС
      begin
        for c_os in(SELECT a.fk_groupid, a.fk_namesid, a.fn_del, a.fc_inventar,
                           a.fc_zavod, a.fd_exp, a.fd_vypusk, a.fn_cena, a.fk_amortid,
                           a.fn_group_kart, a.fn_koef_pereoc, a.fn_amortsum, a.fd_amortdate,
                           a.fc_remark from BUH.TS_OS a where a.fk_id = c.FK_ANALIT) loop
          INSERT INTO BUH.TS_OS (fk_groupid, fk_namesid, fn_del, fc_inventar,
                                 fc_zavod, fd_exp, fd_vypusk, fn_cena, fk_amortid,
                                 fn_group_kart, fn_koef_pereoc, fn_amortsum, fd_amortdate,
                                 fc_remark)
          VALUES (c_os.fk_groupid, c_os.fk_namesid, c_os.fn_del, c_os.fc_inventar,
                  c_os.fc_zavod, c_os.fd_exp, c_os.fd_vypusk, c_os.fn_cena, c_os.fk_amortid,
                  c_os.fn_group_kart, c_os.fn_koef_pereoc, c_os.fn_amortsum, c_os.fd_amortdate,
                  c_os.fc_remark) returning fk_id into cur_NEW_vanalit_id;
        end loop; 
      end;  
      
      WHEN c.FK_GROUPID in(1124, 1125) THEN -- МБП
      begin
        for c_mbp in (SELECT a.fk_namesid, a.fk_groupid, a.fn_del, a.fk_eiid,
                             a.fn_fasov, a.fn_kod, a.fc_ei, a.fd_date, a.fn_god, a.fn_cena,
                             a.fk_apteka_doc_id
                      from buh.ts_mbp a where a.fk_id = c.FK_ANALIT) loop
          INSERT INTO buh.ts_mbp (fk_namesid, fk_groupid, fn_del, fk_eiid,
                                  fn_fasov, fn_kod, fc_ei, fd_date, fn_god, 
                                  fn_cena, fk_apteka_doc_id)
          VALUES (c_mbp.fk_namesid, c_mbp.fk_groupid, c_mbp.fn_del, c_mbp.fk_eiid,
                         c_mbp.fn_fasov, c_mbp.fn_kod, c_mbp.fc_ei, c_mbp.fd_date, 
                         c_mbp.fn_god, c_mbp.fn_cena, c_mbp.fk_apteka_doc_id)
          returning fk_id into cur_NEW_vanalit_id;
        end loop;  
      end;
            
      WHEN c.FK_GROUPID in(1126) THEN -- Должности
      begin
        for c_dol in (SELECT a.fk_groupid, a.fk_namesid, a.fn_del, a.fn_stavka,
                             a.fn_norm_rab_vrem, a.fc_razryad, a.fk_otdelid
                      from buh.ts_doljnost a where a.fk_id = c.FK_ANALIT) loop
          INSERT INTO buh.ts_doljnost (fk_groupid, fk_namesid, fn_del, fn_stavka,
                                       fn_norm_rab_vrem, fc_razryad, fk_otdelid)
          VALUES (c_dol.fk_groupid, c_dol.fk_namesid, c_dol.fn_del, c_dol.fn_stavka,
                  c_dol.fn_norm_rab_vrem, c_dol.fc_razryad, c_dol.fk_otdelid)
          returning fk_id into cur_NEW_vanalit_id;
        end loop;
      end;      
    END CASE;
    asu.pkg_smini.writestring('VANALIT','ID', TO_CHAR(c.FK_ANALIT));    
    
    -- вставляем только что созданную карточку в услугу
    insert into  asu.tusl_kart (fk_healid, fk_groupid, fk_analit, fn_kol,
                                fn_dlit_min, fn_kol_min_mes, fn_del)
    values (cur_NEW_heal_id, c.fk_groupid, cur_NEW_vanalit_id, c.fn_kol,
            c.fn_dlit_min, c.fn_kol_min_mes, c.fn_del);
    
  end loop;
  */
end;
/

SHOW ERRORS;


