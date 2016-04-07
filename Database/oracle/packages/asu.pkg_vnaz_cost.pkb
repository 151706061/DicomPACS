DROP PACKAGE BODY ASU.PKG_VNAZ_COST
/

--
-- PKG_VNAZ_COST  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_VNAZ_COST IS
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 function  GetPac_naz_tmpCount(aTarifType Number) RETURN NUMBER IS
   vResult Number;
 begin
   select count(*) into vResult from asu.tpac_naz_tmp t where t.fk_tarif_type = aTarifType;

   return vResult;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE CalculateCalcHeal(aCostFromDate DATE default null) IS
   vIsHMAO Number;
 BEGIN
  if GetPac_naz_tmpCount(0) > 0 then
    vIsHMAO := asu.GET_IsHMAO;

    ASU.DOSTAT('ASU', 'VNAZ_COST_HEAL_CUT');
    EXECUTE IMMEDIATE('truncate table asu.theal_cost_ex');
    insert into asu.theal_cost_ex (own2_id, smid_id, heal_id, heal_code, cost_id, cost_date1, cost_date2, dt_id, dt_date1, dt_date2, heal_typedoc_syn, fl_is_chld, FK_PARENT, fn_cost)
    select own2_id, smid_id, heal_id, heal_code, max(cost_id) cost_id, cost_date1, cost_date2, dt_id, dt_date1, dt_date2, heal_typedoc_syn, fl_is_chld, FK_PARENT, max(fn_cost) fn_cost
      from (SELECT own2.fk_id own2_id,
                   s.fk_smid smid_id,
                   h.fk_id heal_id,
                   h.CODE heal_code,
                   c.fk_id cost_id,
                   C.FD_DATE1 cost_date1,
                   C.FD_DATE2 cost_date2,
                   dt.fk_id dt_id,
                   dt.FD_DATE1 dt_date1,
                   dt.FD_DATE2 dt_date2,
                   tdt.fc_synonim heal_typedoc_syn,
                   nvl(decode(tisc.fl_is_chld, null, tiscp.fl_is_chld, tisc.fl_is_chld), 0) fl_is_chld, -- Если для услуги нет возрастных предпочтений, то берём по ветке, если есть, то по услуге
                   H.FK_PARENT,
                   LAST_VALUE(c.fn_cost) OVER(PARTITION BY own2.fk_id, s.fk_smid, h.code, c.fd_date1, c.fd_date2, dt.fd_date1, dt.fd_date2 ORDER BY C.FD_DATE1, C.FD_DATE2, c.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost
              FROM ASU.THEAL H
             INNER JOIN ASU.THEAL_COST C ON C.FK_HEALID = H.FK_ID
             INNER JOIN ASU.THEAL_SMID S ON S.FK_HEAL = H.FK_ID
             inner join asu.ttypedoc tdt on tdt.fk_id = h.fk_doctypeid
              left join asu.vnaz_cost_heal_cut hc on hc.typedoc_syn = tdt.fc_synonim
              LEFT JOIN asu.theal_smid_dt dt ON dt.fk_heal_smid = s.fk_id
              LEFT JOIN (SELECT tho.fk_id FROM asu.theal tho WHERE tho.code LIKE 'OWN2%') own2 ON own2.fk_id = h.fk_parent
              left join (select t.fc_askid fk_heal, t.fc_replyid fl_is_chld
                           from asu.treplytable t
                          where t.fc_ask = 'ASU.THEAL'
                            and t.fc_askfield = 'FK_ID'
                            and t.fc_reply = 'VNAZ_COST_IS_CHLD'
                            and t.fc_replyfield = 'FL_CHECK') tisc on tisc.fk_heal = H.FK_ID
              left join (select t.fc_askid fk_heal, t.fc_replyid fl_is_chld
                           from asu.treplytable t
                          where t.fc_ask = 'ASU.THEAL'
                            and t.fc_askfield = 'FK_ID'
                            and t.fc_reply = 'VNAZ_COST_IS_CHLD'
                            and t.fc_replyfield = 'FL_CHECK') tiscp on tiscp.fk_heal = H.Fk_Parent
             WHERE FN_COST IS NOT NULL
               and CODE IS NOT NULL
               and hc.typedoc_syn is null
               and (aCostFromDate is null or (aCostFromDate is not null and (C.FD_DATE2 > aCostFromDate or C.FD_DATE2 IS NULL)))
            )
     group by own2_id, smid_id, heal_id, heal_code, cost_date1, cost_date2, dt_id, dt_date1, dt_date2, heal_typedoc_syn, fl_is_chld, FK_PARENT;
    ASU.DOSTAT('ASU', 'THEAL_COST_EX');

    EXECUTE IMMEDIATE('truncate table asu.tnaz_heal_cost');
    if vIsHMAO = 0 then
      insert into asu.tnaz_heal_cost
            (fd_calc, DATE_B_U, DATE_E_U, DATE_B_U_TIME, DATE_E_U_TIME, naz_id, fk_smid, nazheal_healid, ID_ILL_U, fk_ispolid, fk_vrachid, FK_SOTRID, talon_typedoc_syn, own, FK_TALONID, is_refuse, FK_PACID, FK_PEPLID, fk_insurdocs, fk_ic_id,
             own2_id, smid_id, heal_id, heal_code, cost_id, cost_date1, cost_date2, dt_id, dt_date1, dt_date2, heal_typedoc_syn, fl_is_chld, fn_cost, fc_nazname)
      select v.fd_calc, v.DATE_B_U, v.DATE_E_U, v.DATE_B_U_TIME, v.DATE_E_U_TIME, v.naz_id, v.fk_smid, v.nazheal_healid, v.ID_ILL_U, v.fk_ispolid, v.fk_vrachid, v.FK_SOTRID, v.talon_typedoc_syn, v.own, v.FK_TALONID, v.is_refuse, v.FK_PACID, v.FK_PEPLID, v.fk_insurdocs, v.fk_ic_id,
             c.own2_id, c.smid_id, c.heal_id, c.heal_code, c.cost_id, c.cost_date1, c.cost_date2, c.dt_id, c.dt_date1, c.dt_date2, c.heal_typedoc_syn, c.fl_is_chld, c.fn_cost, v.fc_nazname
        from (-- все услуги begin
              select thb.fk_heal HEAL_BY_VID_OSMOTR,

                     case when nvl(TRUNC(MONTHS_BETWEEN(t.fd_calc, trunc(tp.fd_rojd))/12), 0) >= 18
                     then 2
                     else 1
                     end fl_is_chld,

                     t.fd_calc,

                     nvl(trunc(vrf.fd_ins), trunc(t.fd_run)) DATE_B_U,
                     nvl(trunc(vrl.fd_ins), trunc(t.fd_run)) DATE_E_U,
                     nvl(vrf.fd_ins, t.fd_run) DATE_B_U_TIME,
                     nvl(vrl.fd_ins, t.fd_run) DATE_E_U_TIME,

                     t.naz_id,
                     t.fc_nazname,
                     t.fk_smid,

                     tnh.fk_healid nazheal_healid,

                     nvl(tnh.fk_id, t.naz_id) ID_ILL_U,

                     t.fk_ispolid,
                     t.fk_vrachid,

                     nvl(vrl.fk_vrachid, nvl(decode(t.fk_ispolid, 0, null, t.fk_ispolid), t.fk_vrachid)) FK_SOTRID,

                     d.fc_synonim talon_typedoc_syn,
                     decode(d.fc_synonim, 'OMS', DECODE(cm.fk_regionid, ASU.GET_NATIVE_REGION, 1, null, 1, 2), 'BUDZHET', DECODE(cm.fk_regionid, ASU.GET_NATIVE_REGION, 5, null, 5, 6), 3) own,

                     t.FK_TALONID,

                     t.is_refuse,
                     t.FK_PACID,
                     t.FK_PEPLID,
                     t.fk_insurdocs,

                     Cm.fk_id fk_ic_id,

                     i.fk_smid fk_smid_osmotr
                from asu.tpac_naz_tmp t

                left join asu.tnazheal tnh on tnh.fk_nazid = t.naz_id

                left join (select * from asu.TCOMPANY where fl_del = 0) Cm on Cm.FK_ID = t.FK_COMPANYID
                left join asu.ttypedoc d on d.fk_id = t.fk_typedocid

               inner join asu.tpeoples tp on tp.fk_id = t.FK_PEPLID

                left join asu.TRESLECH vrl on vrl.fk_id = asu.GET_LASTRESLECH(T.NAZ_ID, ASU.GET_VYPNAZSOSID)
                left join asu.TRESLECH vrf on vrf.fk_id = asu.GET_FirstRESLECH(T.NAZ_ID, ASU.GET_VYPNAZSOSID)

                left join asu.TIB i on i.FK_PACID = T.NAZ_ID and i.FK_SMEDITID = asu.get_synid('VID_OSMOTR')

                left join (select t.fc_askid fk_smid, t.fc_replyid fk_heal
                             from asu.treplytable t
                            where t.fc_ask = 'TSMID_VID_OSMOTR'
                              and t.fc_askfield = 'FK_ID'
                              and t.fc_reply = 'THEAL_VNAZ_COST_BRANCH'
                              and t.fc_replyfield = 'FK_ID') thb on thb.fk_smid = i.fk_smid
               where t.fk_tarif_type = 0
                -- все услуги end
           ) v
        left join asu.theal_cost_ex c on c.smid_id = v.fk_smid
       WHERE c.fl_is_chld = v.fl_is_chld
         AND (v.HEAL_BY_VID_OSMOTR is null or (v.HEAL_BY_VID_OSMOTR is not null and c.fk_parent = v.HEAL_BY_VID_OSMOTR));
    else
      insert into asu.tnaz_heal_cost
            (fd_calc, DATE_B_U, DATE_E_U, DATE_B_U_TIME, DATE_E_U_TIME, naz_id, fk_smid, nazheal_healid, ID_ILL_U, fk_ispolid, fk_vrachid, FK_SOTRID, talon_typedoc_syn, own, FK_TALONID, is_refuse, FK_PACID, FK_PEPLID, fk_insurdocs, fk_ic_id,
             own2_id, smid_id, heal_id, heal_code, cost_id, cost_date1, cost_date2, dt_id, dt_date1, dt_date2, heal_typedoc_syn, fl_is_chld, fn_cost, FC_NAZNAME)
      select v.fd_calc, v.DATE_B_U, v.DATE_E_U, v.DATE_B_U_TIME, v.DATE_E_U_TIME,
             nvl(v.naz_id, asu.PKG_TARIFDETAIL.AddNaz(vUSE_TarifDetail,
                 'Назначение "' || v.fc_nazname || '" от ' || to_char(v.fd_naz, 'dd.mm.yyyy') ||
                 ' Проверяется тариф: Код ' || nvl(c.heal_code, 'не определён') || ' стоимость ' || nvl(to_char(c.fn_cost), 'не определена') ||
                 ' начало действия: ' || decode(c.cost_date1, null, 'не задано', to_char(c.cost_date1, 'dd.mm.yyyy')) ||
                 ' окончание действия: ' || decode(c.cost_date2, null, 'не задано', to_char(c.cost_date2, 'dd.mm.yyyy')) ||
                 decode (dt_id, null, '',
                   ' Начало действия соответствия: ' || decode(c.dt_date1, null, 'не задано', to_char(c.dt_date1, 'dd.mm.yyyy')) ||
                   ' Окончание действия соответствия: ' || decode(c.dt_date2, null, 'не задано', to_char(c.dt_date2, 'dd.mm.yyyy'))) ||
                 ' Дата расчёта: ' || to_char(v.fd_calc, 'dd.mm.yyyy') ||
                 decode(v.own, 1, ' Местный страховой документ типа ОМС', 5, ' Местный страховой документ типа Бюджет', 2, ' Cтраховой документ типа ОМС другой територии', 6, ' Cтраховой документ типа Бюджет другой територии', ' Местный страховой документ, отличный от ОМС и Бюджета') ||
                 decode(c.own2_id, null, ' Тариф не прявязан к территории', 'Межтерриториальный тариф') ||
                 decode(v.fl_is_chld, 1, ' Несовершеннолетний пациент', ' Взрослый пациент (18 и больше лет)') ||
                 decode(c.fl_is_chld, 0, ' Тариф без везрастных ограничений', 1, ' Тариф для несовершеннолетних', 'Тариф для взрослых (18 и больше лет)') ||
                 decode(c.heal_typedoc_syn,
                        'OMS', ' Случай относится к ОМС, ' || decode(substr(c.heal_code, 1, 1), 'T', ' маска консультации: ' || v.OSMOTR_CODE_MASK, ' не является консультацией, нет ограничений на код по маске'),
                               ' Случай не относится к ОМС, нет ограничений на код по маске') ||
                 ' Тип оплаты услуги: ' || c.heal_typedoc_syn ||
                 decode(v.nazheal_healid, null, '', ' Услуга была выбрана пользователем в модуле SetUsluga'),
                 v.naz_id, vTarifDetailOwner)) naz_id,
             v.fk_smid, v.nazheal_healid, v.ID_ILL_U, v.fk_ispolid, v.fk_vrachid, v.FK_SOTRID, v.talon_typedoc_syn, v.own, v.FK_TALONID, v.is_refuse, v.FK_PACID, v.FK_PEPLID, v.fk_insurdocs, v.fk_ic_id,
             c.own2_id, c.smid_id, c.heal_id, c.heal_code, c.cost_id, c.cost_date1, c.cost_date2, c.dt_id, c.dt_date1, c.dt_date2, c.heal_typedoc_syn, c.fl_is_chld, c.fn_cost, v.fc_nazname
        from (-- все услуги begin
              select -- 1 - 12 - AR_PROF_C
                     -- 2 - 13 - AR_PRE_C
                     -- 3 - 14 - AR_PERIOD_C
                     case when t.fk_smid = asu.GET_SMID_VACCIN_NAZ  -- Для назначения "Вакцинация" код одинковый для детей и взгослых и начинается на TP.
                          then 'TPPC%'
                          else
                          case when nvl(TRUNC(MONTHS_BETWEEN(t.fd_calc, trunc(tp.fd_rojd))/12), 0) >= 18
                               then nvl(thcm.fc_codemask, 'TP') || 'V%'
                               else nvl(thcm.fc_codemask, 'TP') || 'D%'
                           end
                      end OSMOTR_CODE_MASK,

                     case when nvl(TRUNC(MONTHS_BETWEEN(t.fd_calc, trunc(tp.fd_rojd))/12), 0) >= 18
                     then 2
                     else 1
                     end fl_is_chld,

                     t.fd_calc,

                     trunc(t.fd_run) DATE_B_U,
                     trunc(t.fd_run) DATE_E_U,
                     t.fd_run DATE_B_U_TIME,
                     t.fd_run DATE_E_U_TIME,

                     t.naz_id,
                     t.fc_nazname,
                     t.fd_naz,
                     t.fk_smid,
                     tnh.fk_healid nazheal_healid,
                     -- Kashira O.A. В поле ID_ILL_U должно передаваться назначение, привязанное к талону.
                     nvl(tnh.fk_id, t.naz_id) ID_ILL_U,
                     t.fk_ispolid,
                     t.fk_vrachid,
                     nvl(decode(t.fk_ispolid, 0, null, t.fk_ispolid), t.fk_vrachid) FK_SOTRID,

                     d.fc_synonim talon_typedoc_syn,
                     decode(d.fc_synonim, 'OMS', DECODE(cm.fk_regionid, ASU.GET_NATIVE_REGION, 1, null, 1, 2), 'BUDZHET', DECODE(cm.fk_regionid, ASU.GET_NATIVE_REGION, 5, null, 5, 6), 3) own,

                     t.FK_TALONID,

                     t.is_refuse,
                     t.FK_PACID,
                     t.FK_PEPLID,
                     t.fk_insurdocs,

                     Cm.fk_id fk_ic_id--,
                from asu.tpac_naz_tmp t

                left join (select t.fc_askid fk_smid, t.fc_replyid fc_codemask
                             from asu.treplytable t
                            where t.fc_ask = 'TSMID_REASON'
                              and t.fc_askfield = 'FK_ID'
                              and t.fc_reply = 'VNAZ_COST_CODE_MASK'
                              and t.fc_replyfield = 'FC_CODE_PREF') thcm on thcm.fk_smid = AMB_PR

                left join asu.tnazheal tnh on tnh.fk_nazid = t.naz_id

                left join (select * from asu.TCOMPANY where fl_del = 0) Cm on Cm.FK_ID = t.FK_COMPANYID
                left join asu.ttypedoc d on d.fk_id = t.fk_typedocid

               inner join asu.tpeoples tp on tp.fk_id = t.FK_PEPLID

               where t.fk_tarif_type = 0
                -- все услуги end
           ) v
        left join asu.theal_cost_ex c on c.smid_id = v.fk_smid
       WHERE (c.fl_is_chld = 0 or c.fl_is_chld = v.fl_is_chld)
         AND (c.heal_typedoc_syn <> 'OMS' or c.heal_typedoc_syn = 'OMS' and (substr(c.heal_code, 1, 1) <> 'T' OR c.heal_code LIKE v.OSMOTR_CODE_MASK));
    end if;
    ASU.DOSTAT('ASU', 'TNAZ_HEAL_COST');

    for c in (
    SELECT T.NAZ_ID,
           nvl(t.fk_vrachid_last, t.FK_SOTRID) FK_SOTRID,
           nvl(trunc(t.fd_ins_first), t.DATE_B_U) DATE_B_U,
           nvl(trunc(t.fd_ins_last), t.DATE_E_U) DATE_E_U,
           nvl(t.fd_ins_first, t.DATE_B_U_TIME) DATE_B_U_TIME,
           nvl(t.fd_ins_last, t.DATE_E_U_TIME) DATE_E_U_TIME
      FROM (select T.NAZ_ID,
                   t.DATE_B_U,
                   t.DATE_E_U,
                   t.DATE_B_U_TIME,
                   t.DATE_E_U_TIME,
                   t.FK_SOTRID,
                   max(t.fd_ins_first) fd_ins_first,
                   max(t.fd_ins_last) fd_ins_last,
                   max(t.fk_vrachid_last) fk_vrachid_last
              from (select T.NAZ_ID,
                           t.DATE_B_U,
                           t.DATE_E_U,
                           t.DATE_B_U_TIME,
                           t.DATE_E_U_TIME,
                           t.FK_SOTRID,

                           FIRST_VALUE(vr.fd_ins)
                           OVER(PARTITION BY vr.fk_nazid ORDER BY vr.fd_ins, vr.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fd_ins_first,
                           LAST_VALUE(vr.fd_ins)
                           OVER(PARTITION BY vr.fk_nazid ORDER BY vr.fd_ins, vr.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fd_ins_last,

                           LAST_VALUE(vr.fk_vrachid)
                           OVER(PARTITION BY vr.fk_nazid ORDER BY vr.fd_ins, vr.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_vrachid_last

                      from asu.tnaz_heal_cost t
                     INNER JOIN asu.TRESLECH vr ON vr.fk_nazid = T.NAZ_ID) t
             GROUP BY T.NAZ_ID,
                      t.DATE_B_U,
                      t.DATE_E_U,
                      t.DATE_B_U_TIME,
                      t.DATE_E_U_TIME,
                      t.FK_SOTRID) t)
    loop
      update asu.tnaz_heal_cost t
         set t.DATE_B_U = c.DATE_B_U,
             t.DATE_E_U = c.DATE_E_U,
             t.DATE_B_U_TIME = c.DATE_B_U_TIME,
             t.DATE_E_U_TIME = c.DATE_E_U_TIME,
             t.FK_SOTRID = c.FK_SOTRID
       where t.naz_id = c.NAZ_ID;
    end loop;
    ASU.DOSTAT('ASU', 'TNAZ_HEAL_COST');

    insert into ASU.VNAZ_COST
    select cg.heal_count,
           cg.FK_TALONID,
           cg.id_ill_u,
           nvl(cg.naz_id, asu.PKG_TARIFDETAIL.AddNaz(vUSE_TarifDetail,
               'Назначение "' || cg.fc_nazname || '" от ' || to_char(cg.DATE_B_U, 'dd.mm.yyyy') ||
               ' Доступные тарифы: ' ||
               decode(cg.heal_code_OMS, null, '', 'Тариф ОМС: ' || cg.heal_code_OMS || ', цена: ' || decode(cg.fn_cost_OMS, null, 'не задана', to_char(cg.fn_cost_OMS)) ||
                 decode(cg.cost_type_OMS, 3, ', тариф подходит по всем параметрам', 2, ' подходит по срокам, но не подходит по дополнительным параметрам (територия страхования, выбранная пользователем услуга и т.д.)', ' не подходит по срокам, указана последняя по срокам действия цена')) ||
               decode(cg.heal_code_DMS, null, '', 'Тариф ДМС: ' || cg.heal_code_DMS || ', цена: ' || decode(cg.fn_cost_DMS, null, 'не задана', to_char(cg.fn_cost_DMS)) ||
                 decode(cg.cost_type_DMS, 3, ', тариф подходит по всем параметрам', 2, ' подходит по срокам, но не подходит по дополнительным параметрам (територия страхования, выбранная пользователем услуга и т.д.)', ' не подходит по срокам, указана последняя по срокам действия цена')) ||
               decode(cg.heal_code_KOMERC, null, '', 'Тариф Комерческий: ' || cg.heal_code_KOMERC || ', цена: ' || decode(cg.fn_cost_KOMERC, null, 'не задана', to_char(cg.fn_cost_KOMERC)) ||
                 decode(cg.cost_type_KOMERC, 3, ', тариф подходит по всем параметрам', 2, ' подходит по срокам, но не подходит по дополнительным параметрам (територия страхования, выбранная пользователем услуга и т.д.)', ' не подходит по срокам, указана последняя по срокам действия цена')) ||
               decode(cg.heal_code_DOGOVOR, null, '', 'Тариф Договор: ' || cg.heal_code_DOGOVOR || ', цена: ' || decode(cg.fn_cost_DOGOVOR, null, 'не задана', to_char(cg.fn_cost_DOGOVOR)) ||
                 decode(cg.cost_type_DOGOVOR, 3, ', тариф подходит по всем параметрам', 2, ' подходит по срокам, но не подходит по дополнительным параметрам (територия страхования, выбранная пользователем услуга и т.д.)', ' не подходит по срокам, указана последняя по срокам действия цена')) ||
               decode(cg.heal_code_BUDZHET, null, '', 'Тариф Бюджет: ' || cg.heal_code_BUDZHET || ', цена: ' || decode(cg.fn_cost_BUDZHET, null, 'не задана', to_char(cg.fn_cost_BUDZHET)) ||
                 decode(cg.cost_type_BUDZHET, 3, ', тариф подходит по всем параметрам', 2, ' подходит по срокам, но не подходит по дополнительным параметрам (територия страхования, выбранная пользователем услуга и т.д.)', ' не подходит по срокам, указана последняя по срокам действия цена')) ||
               decode(cg.heal_code_UDOST, null, '', 'Тариф Удостоверение: ' || cg.heal_code_UDOST || ', цена: ' || decode(cg.fn_cost_UDOST, null, 'не задана', to_char(cg.fn_cost_UDOST)) ||
                 decode(cg.cost_type_UDOST, 3, ', тариф подходит по всем параметрам', 2, ' подходит по срокам, но не подходит по дополнительным параметрам (територия страхования, выбранная пользователем услуга и т.д.)', ' не подходит по срокам, указана последняя по срокам действия цена')) ||
               decode(cg.heal_code_OBOSNOVANIE, null, '', 'Тариф Обоснование: ' || cg.heal_code_OBOSNOVANIE || ', цена: ' || decode(cg.fn_cost_OBOSNOVANIE, null, 'не задана', to_char(cg.fn_cost_OBOSNOVANIE)) ||
                 decode(cg.cost_type_OBOSNOVANIE, 3, ', тариф подходит по всем параметрам', 2, ' подходит по срокам, но не подходит по дополнительным параметрам (територия страхования, выбранная пользователем услуга и т.д.)', ' не подходит по срокам, указана последняя по срокам действия цена')) ||
               decode(cg.heal_code_SERTIFIKAT, null, '', 'Тариф Сертификат: ' || cg.heal_code_SERTIFIKAT || ', цена: ' || decode(cg.fn_cost_SERTIFIKAT, null, 'не задана', to_char(cg.fn_cost_SERTIFIKAT)) ||
                 decode(cg.cost_type_SERTIFIKAT, 3, ', тариф подходит по всем параметрам', 2, ' подходит по срокам, но не подходит по дополнительным параметрам (територия страхования, выбранная пользователем услуга и т.д.)', ' не подходит по срокам, указана последняя по срокам действия цена')),
               cg.naz_id, vTarifDetailOwner)) naz_id,

           cg.nazheal_healid,

           cg.cost_type_OMS,
           cg.fk_healid_OMS,
           cg.heal_code_OMS,
           cg.fn_cost_OMS,
           cg.cost_type_DMS,
           cg.fk_healid_DMS,
           cg.heal_code_DMS,
           cg.fn_cost_DMS,
           cg.cost_type_KOMERC,
           cg.fk_healid_KOMERC,
           cg.heal_code_KOMERC,
           cg.fn_cost_KOMERC,
           cg.cost_type_DOGOVOR,
           cg.fk_healid_DOGOVOR,
           cg.heal_code_DOGOVOR,
           cg.fn_cost_DOGOVOR,
           cg.cost_type_BUDZHET,
           cg.fk_healid_BUDZHET,
           cg.heal_code_BUDZHET,
           cg.fn_cost_BUDZHET,
           cg.cost_type_UDOST,
           cg.fk_healid_UDOST,
           cg.heal_code_UDOST,
           cg.fn_cost_UDOST,
           cg.cost_type_OBOSNOVANIE,
           cg.fk_healid_OBOSNOVANIE,
           cg.heal_code_OBOSNOVANIE,
           cg.fn_cost_OBOSNOVANIE,
           cg.cost_type_SERTIFIKAT,
           cg.fk_healid_SERTIFIKAT,
           cg.heal_code_SERTIFIKAT,
           cg.fn_cost_SERTIFIKAT,

    --       cg.FAM,
    --       cg.im,
    --       cg.otch,
           cg.talon_typedoc_syn,

           cg.FK_PACID,
           cg.FK_PEPLID,
    --       cg.fd_rojd,

           cg.is_refuse,

           cg.DATE_E_U,
           cg.DATE_B_U,
           cg.DATE_E_U_TIME,
           cg.DATE_B_U_TIME,

           cg.fk_ispolid,
           cg.fk_vrachid,
           cg.fk_sotrid,

           cg.fk_insurdocs,
    --       cg.fk_typeoms,
    --       cg.fc_ser,
    --       cg.fc_num,
    --       cg.fc_enp,
    --       cg.POLICYNUM,
    --       cg.fk_ic_regionid,
           cg.fk_ic_id,
    --       cg.fc_ic_ogrn,

    --       cg.fd_opened,
    --       cg.fd_closed,
    --       cg.fk_result,
    --       cg.FK_REASON, -- для кардио используется i.FK_VISITVID, см. ниже
    --       cg.FN_SOS,
    --       cg.fk_dopishodid,
    --       cg.fk_dispcardid,
    --       cg.fc_naprnum,

           decode(3, cg.cost_type_OMS, cg.fk_healid_OMS,
                     cg.cost_type_DMS, cg.fk_healid_DMS,
                     cg.cost_type_KOMERC, cg.fk_healid_KOMERC,
                     cg.cost_type_DOGOVOR, cg.fk_healid_DOGOVOR,
                     cg.cost_type_BUDZHET, cg.fk_healid_BUDZHET,
                     cg.cost_type_UDOST, cg.fk_healid_UDOST,
                     cg.cost_type_OBOSNOVANIE, cg.fk_healid_OBOSNOVANIE,
                     cg.cost_type_SERTIFIKAT, cg.fk_healid_SERTIFIKAT,
                     null
                     ) fk_healid,
           decode(3, cg.cost_type_OMS, cg.heal_code_OMS,
                     cg.cost_type_DMS, cg.heal_code_DMS,
                     cg.cost_type_KOMERC, cg.heal_code_KOMERC,
                     cg.cost_type_DOGOVOR, cg.heal_code_DOGOVOR,
                     cg.cost_type_BUDZHET, cg.heal_code_BUDZHET,
                     cg.cost_type_UDOST, cg.heal_code_UDOST,
                     cg.cost_type_OBOSNOVANIE, cg.heal_code_OBOSNOVANIE,
                     cg.cost_type_SERTIFIKAT, cg.heal_code_SERTIFIKAT,
                     null
                     ) heal_code,
           decode(3, cg.cost_type_OMS, cg.fn_cost_OMS,
                     cg.cost_type_DMS, cg.fn_cost_DMS,
                     cg.cost_type_KOMERC, cg.fn_cost_KOMERC,
                     cg.cost_type_DOGOVOR, cg.fn_cost_DOGOVOR,
                     cg.cost_type_BUDZHET, cg.fn_cost_BUDZHET,
                     cg.cost_type_UDOST, cg.fn_cost_UDOST,
                     cg.cost_type_OBOSNOVANIE, cg.fn_cost_OBOSNOVANIE,
                     cg.cost_type_SERTIFIKAT, cg.fn_cost_SERTIFIKAT,
                     null) fn_cost,
           0 fk_tarif_type -- обычные услуги
    -- пример заполнения ограничивающей таблицы

    --begin
    --  EXECUTE IMMEDIATE('truncate table asu.vnaz_cost_limit');
    --  insert into asu.vnaz_cost_limit(fk_talonid)
    --  select fk_id from asu.tambtalon WHERE FN_SOS = 1 AND TRUNC(FD_CLOSED) BETWEEN TRUNC(to_date('01.01.2012', 'dd.mm.yyyy')) AND TRUNC(to_date('31.12.2012', 'dd.mm.yyyy'));
    --  EXECUTE IMMEDIATE('analyze table asu.vnaz_cost_limit compute statistics for table for all indexes for all columns size 100');
    --end;

    --select count(*) from asu.vnaz_cost

      from (
            select
                   case
                   when t_is_test.FK_SMID is not null
                   then (select nvl(max(count(*)), 1) fn_count
                           from asu.vnaz vn
                                left join asu.tresan tra on tra.fk_nazid = vn.fk_id
                          where (tra.fl_zakl = 0 and (tra.fc_res is not null or tra.fn_res is not null or tra.fk_blobid is not null))
                            and vn.fk_id = c.naz_id
                          group by vn.fk_id)
                   else
                        case when (asu.pkg_smini.READSTRING('CONFIG','DB_NAME','N\A')='SK') and (asu.GET_NAZ_KOL_VO(c.naz_id, c.fk_smid)) > 0
                             then (asu.GET_NAZ_KOL_VO(c.naz_id, c.fk_smid))
                             else decode(asu.pkg_smid.GetRootLevelID1(c.FK_SMID),asu.get_procid,--1,get_protocolid,4,get_issledid,2,get_analid,3)
                                         (select decode(count(fk_id),0,1,count(fk_id)) from asu.vres where fk_nazid = c.naz_id and (fl_zakl <> 1 or fl_zakl is NULL) and fk_sos = asu.get_vipnaz),
                                         1)
                        end
                   end heal_count,

                   c.*,

                   LAST_VALUE(decode(c.heal_typedoc_syn, 'OMS', c.cost_type, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'OMS', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cost_type_OMS,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'OMS', c.heal_id, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'OMS', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_healid_OMS,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'OMS', c.heal_code_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'OMS', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) heal_code_OMS,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'OMS', c.fn_cost_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'OMS', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost_OMS,

                   LAST_VALUE(decode(c.heal_typedoc_syn, 'DMS', c.cost_type, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'DMS', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cost_type_DMS,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'DMS', c.heal_id, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'DMS', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_healid_DMS,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'DMS', c.heal_code_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'DMS', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) heal_code_DMS,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'DMS', c.fn_cost_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'DMS', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost_DMS,

                   LAST_VALUE(decode(c.heal_typedoc_syn, 'KOMERC', c.cost_type, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'KOMERC', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cost_type_KOMERC,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'KOMERC', c.heal_id, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'KOMERC', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_healid_KOMERC,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'KOMERC', c.heal_code_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'KOMERC', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) heal_code_KOMERC,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'KOMERC', c.fn_cost_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'KOMERC', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost_KOMERC,

                   LAST_VALUE(decode(c.heal_typedoc_syn, 'DOGOVOR', c.cost_type, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'DOGOVOR', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cost_type_DOGOVOR,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'DOGOVOR', c.heal_id, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'DOGOVOR', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_healid_DOGOVOR,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'DOGOVOR', c.heal_code_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'DOGOVOR', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) heal_code_DOGOVOR,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'DOGOVOR', c.fn_cost_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'DOGOVOR', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost_DOGOVOR,

                   LAST_VALUE(decode(c.heal_typedoc_syn, 'BUDZHET', c.cost_type, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'BUDZHET', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cost_type_BUDZHET,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'BUDZHET', c.heal_id, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'BUDZHET', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_healid_BUDZHET,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'BUDZHET', c.heal_code_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'BUDZHET', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) heal_code_BUDZHET,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'BUDZHET', c.fn_cost_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'BUDZHET', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost_BUDZHET,

                   LAST_VALUE(decode(c.heal_typedoc_syn, 'UDOST', c.cost_type, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'UDOST', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cost_type_UDOST,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'UDOST', c.heal_id, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'UDOST', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_healid_UDOST,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'UDOST', c.heal_code_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'UDOST', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) heal_code_UDOST,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'UDOST', c.fn_cost_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'UDOST', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost_UDOST,

                   LAST_VALUE(decode(c.heal_typedoc_syn, 'OBOSNOVANIE', c.cost_type, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'OBOSNOVANIE', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cost_type_OBOSNOVANIE,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'OBOSNOVANIE', c.heal_id, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'OBOSNOVANIE', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_healid_OBOSNOVANIE,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'OBOSNOVANIE', c.heal_code_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'OBOSNOVANIE', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) heal_code_OBOSNOVANIE,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'OBOSNOVANIE', c.fn_cost_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'OBOSNOVANIE', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost_OBOSNOVANIE,

                   LAST_VALUE(decode(c.heal_typedoc_syn, 'SERTIFIKAT', c.cost_type, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'SERTIFIKAT', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) cost_type_SERTIFIKAT,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'SERTIFIKAT', c.heal_id, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'SERTIFIKAT', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_healid_SERTIFIKAT,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'SERTIFIKAT', c.heal_code_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'SERTIFIKAT', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) heal_code_SERTIFIKAT,
                   LAST_VALUE(decode(c.heal_typedoc_syn, 'SERTIFIKAT', c.fn_cost_r, null)) OVER(PARTITION BY c.ID_ILL_U ORDER BY decode(c.heal_typedoc_syn, 'SERTIFIKAT', c.cost_type, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost_SERTIFIKAT
              from (
                    select c.*,--  cost_type, c.FK_TALONID, c.id_ill_u, c.heal_typedoc_syn,
                           decode(cost_type, 1, c.heal_code_last, c.heal_code) heal_code_r,
                           decode(cost_type, 1, c.fn_cost_last, c.fn_cost) fn_cost_r,
                           max(cost_type) OVER(PARTITION BY c.id_ill_u, c.heal_typedoc_syn) cost_type_max
                      from (select case
                                     when c.fd_calc BETWEEN c.cost_date1 AND NVL(c.cost_date2, c.fd_calc) AND
                                          (c.dt_id is null or c.fd_calc BETWEEN dt_date1 AND NVL(dt_date2, c.fd_calc)) then
                                       case
                                         when ((c.nazheal_healid is not null and c.nazheal_healid = c.heal_id) or (c.nazheal_healid is null and c.fk_smid = c.smid_id)) and
                                              c.heal_typedoc_syn = c.talon_typedoc_syn
                                              and ((c.own in (2, 6) and c.own2_id_last is not null and c.own2_id = c.own2_id_last) -- если случай инообластной и есть цена для инообластных, то берём только цену для инообластных
                                                   or (c.own in (2, 6) and c.own2_id_last is null and c.own2_id is null) -- если случай инообластной и нет цены для инообластных, то берём местную цену
                                                   or (c.own not in (2, 6) and c.own2_id is null)) -- если случай местный, то берём только местную цену
                                         then
                                          3 -- тариф, т.е. цена подходящая по всем параметрам
                                         else
                                          2 -- актуальная цена, которая относится к услуге, связанной с назначением, но не подходит для случая по дополниельным параметрам
                                         end
                                     else
                                       case when c.cost_id = LAST_VALUE(c.cost_id) OVER(PARTITION BY c.ID_ILL_U, c.heal_typedoc_syn, decode(c.own2_id, null, null, 1) ORDER BY c.cost_date1, c.cost_date2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) then
                                         1 -- последняя по срокам действия цена для данного типа оплаты
                                       else
                                         0
                                       end
                                   end cost_type,
                                   c.*
                              from (select c.*,
                                           LAST_VALUE(c.own2_id) OVER(PARTITION BY c.ID_ILL_U, c.heal_typedoc_syn ORDER BY decode(c.own2_id, null, 0, 1), c.cost_date1, c.cost_date2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) own2_id_last,
                                           LAST_VALUE(c.heal_code) OVER(PARTITION BY c.ID_ILL_U, c.heal_typedoc_syn, decode(c.own2_id, null, null, 1) ORDER BY c.cost_date1, c.cost_date2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) heal_code_last,
                                           LAST_VALUE(c.fn_cost) OVER(PARTITION BY c.ID_ILL_U, c.heal_typedoc_syn, decode(c.own2_id, null, null, 1) ORDER BY c.cost_date1, c.cost_date2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost_last
                                        from asu.tnaz_heal_cost c) c
                           ) c
                       where c.cost_type > 0
                   ) c
              left join (SELECT s.fk_smid, DT.FK_ID dt_id, DT.FD_DATE1 DT_DATE1, DT.FD_DATE2 DT_DATE2
                           FROM ASU.THEAL H
                          inner join ASU.THEAL_SMID S on S.FK_HEAL = H.FK_ID
                           left join ASU.THEAL_SMID_DT DT on DT.FK_HEAL_SMID = S.FK_ID
                          WHERE h.CODE = 'NAZ_AS_TEST_H') t_is_test on t_is_test.FK_SMID = c.fk_smid
                                                                   and (t_is_test.dt_id is NULL or c.fd_calc BETWEEN t_is_test.DT_DATE1 AND NVL(t_is_test.DT_DATE2, c.fd_calc))
             where c.cost_type_max = c.cost_type

           ) cg
     group by  cg.heal_count,
               cg.FK_TALONID,
               cg.fc_nazname,
               cg.id_ill_u,
               cg.naz_id,
               cg.nazheal_healid,

               cg.cost_type_OMS,
               cg.fk_healid_OMS,
               cg.heal_code_OMS,
               cg.fn_cost_OMS,
               cg.cost_type_DMS,
               cg.fk_healid_DMS,
               cg.heal_code_DMS,
               cg.fn_cost_DMS,
               cg.cost_type_KOMERC,
               cg.fk_healid_KOMERC,
               cg.heal_code_KOMERC,
               cg.fn_cost_KOMERC,
               cg.cost_type_DOGOVOR,
               cg.fk_healid_DOGOVOR,
               cg.heal_code_DOGOVOR,
               cg.fn_cost_DOGOVOR,
               cg.cost_type_BUDZHET,
               cg.fk_healid_BUDZHET,
               cg.heal_code_BUDZHET,
               cg.fn_cost_BUDZHET,
               cg.cost_type_UDOST,
               cg.fk_healid_UDOST,
               cg.heal_code_UDOST,
               cg.fn_cost_UDOST,
               cg.cost_type_OBOSNOVANIE,
               cg.fk_healid_OBOSNOVANIE,
               cg.heal_code_OBOSNOVANIE,
               cg.fn_cost_OBOSNOVANIE,
               cg.cost_type_SERTIFIKAT,
               cg.fk_healid_SERTIFIKAT,
               cg.heal_code_SERTIFIKAT,
               cg.fn_cost_SERTIFIKAT,

    --           cg.FAM,
    --           cg.im,
    --           cg.otch,
               cg.talon_typedoc_syn,

               cg.FK_PACID,
               cg.FK_PEPLID,
    --           cg.fd_rojd,
               cg.is_refuse,
               cg.DATE_E_U,
               cg.DATE_B_U,
               cg.DATE_E_U_TIME,
               cg.DATE_B_U_TIME,
               cg.fk_ispolid,
               cg.fk_vrachid,
               cg.fk_sotrid,

               cg.fk_insurdocs,
    --           cg.fk_typeoms,
    --           cg.fc_ser,
    --           cg.fc_num,
    --           cg.fc_enp,
    --           cg.POLICYNUM,
    --           cg.fk_ic_regionid,
               cg.fk_ic_id--,
    --           cg.fc_ic_ogrn,

    --           cg.fd_opened,
    --           cg.fd_closed,
    --           cg.fk_result,
    --           cg.FK_REASON, -- для кардио используется i.FK_VISITVID, см. ниже
    --           cg.FN_SOS,
    --           cg.fk_dopishodid,
    --           cg.fk_dispcardid,
    --           cg.fc_naprnum
      ;
   end if;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE CalculateDisp is
 begin
  if GetPac_naz_tmpCount(1) > 0 then
    insert into ASU.VNAZ_COST
    select 1 heal_count,
           nl.id_ill FK_TALONID,
           nl.fk_id id_ill_u,
           nvl(nl.fk_id, asu.PKG_TARIFDETAIL.AddNaz(vUSE_TarifDetail,

               'Назначение "' || nl.fc_nazname || '" от ' || to_char(trunc(nl.fd_date1), 'dd.mm.yyyy') ||
               decode(tdt.fk_id, NULL, ' Тариф не выбран так как нет соответствующей услуги, относящейся к ОМС (Код: ' || decode(H.CODE, null, 'Не задан', H.CODE) || ')', ' Выбран тариф, услуга ОМС, код: ' || H.CODE || ', цена: ' || decode(C.FN_COST, null, 'не задана', to_char(C.FN_COST)) ||
                 ' Возраст пациента: ' || to_char(nvl(TRUNC(MONTHS_BETWEEN(nl.FD_DATE2, tp.fd_rojd)/12), 0)) ||
                 ' Маска кода: ' || 'TD%' || decode(nl.FC_SYNONIM,
                                                    'KONS_DISP_1_D',
                                                    decode(tp.fp_sex, 0, 'G.1', 'B.1'),
                                                    'KONS_DISP_1_DO',
                                                    decode(tp.fp_sex, 0, 'G.2', 'B.2'),
                                                    decode(tp.fp_sex, 0, 'W', 'M')) || '%') ||
                 ' начало действия: ' || decode(c.fd_date1, null, 'не задано', to_char(c.fd_date1, 'dd.mm.yyyy')) ||
                 ' окончание действия: ' || decode(c.fd_date2, null, 'не задано', to_char(c.fd_date2, 'dd.mm.yyyy')),

               nl.fk_id, vTarifDetailOwner)) naz_id,

           null nazheal_healid,

           3 cost_type_OMS,
           H.FK_ID fk_healid_OMS,
           decode(tdt.fk_id, NULL, '', H.CODE) heal_code_OMS,
           decode(tdt.fk_id, NULL, NULL, C.FN_COST) fn_cost_OMS,
           null cost_type_DMS,
           null fk_healid_DMS,
           null heal_code_DMS,
           null fn_cost_DMS,
           null cost_type_KOMERC,
           null fk_healid_KOMERC,
           null heal_code_KOMERC,
           null fn_cost_KOMERC,
           null cost_type_DOGOVOR,
           null fk_healid_DOGOVOR,
           null heal_code_DOGOVOR,
           null fn_cost_DOGOVOR,
           null cost_type_BUDZHET,
           null fk_healid_BUDZHET,
           null heal_code_BUDZHET,
           null fn_cost_BUDZHET,
           null cost_type_UDOST,
           null fk_healid_UDOST,
           null heal_code_UDOST,
           null fn_cost_UDOST,
           null cost_type_OBOSNOVANIE,
           null fk_healid_OBOSNOVANIE,
           null heal_code_OBOSNOVANIE,
           null fn_cost_OBOSNOVANIE,
           null cost_type_SERTIFIKAT,
           null fk_healid_SERTIFIKAT,
           null heal_code_SERTIFIKAT,
           null fn_cost_SERTIFIKAT,

           nl.talon_typedoc_syn,

           nl.FK_PACID,
           nl.FK_PEPLID,

           nl.is_refuse,

           trunc(nl.fd_date1) DATE_E_U,
           trunc(nl.fd_date2) DATE_B_U,
           nl.fd_date1 DATE_E_U_TIME,
           nl.fd_date2 DATE_B_U_TIME,

           nl.fk_ispolid,
           nl.fk_vrachid,
           nvl(decode(nl.fk_ispolid, 0, null, nl.fk_ispolid), nl.fk_vrachid) fk_sotrid, -- https://tg.samozapis.ru:15001/redmine/issues/31949 пункт 16 (про предложению Юли Мельниковой)

           nl.fk_insurdocs,
           nl.fk_companyid fk_ic_id,

           H.FK_ID fk_healid,
           decode(tdt.fk_id, NULL, '', H.CODE) heal_code,
           decode(tdt.fk_id, NULL, NULL, C.FN_COST) fn_cost,
           1 fk_tarif_type -- диспансеризация
      from (select n.fk_id,
                   n.fk_ispolid,
                   n.fk_vrachid,
                   l.fk_peplid,
                   tat.fd_opened fd_date1,
                   tat.fd_closed fd_date2,
                   NS.FC_SYNONIM,
                   tat.fk_id id_ill,
                   tat.fk_ambid FK_PACID,
                   tr.fc_synonim r_syn,
                   l.fk_insurdocs,
                   l.fk_companyid,
                   l.is_refuse,
                   l.fc_nazname,
                   d.fc_synonim talon_typedoc_syn,
                   LAST_VALUE(n.FK_ID) OVER(PARTITION BY TAT.FK_ID ORDER BY decode(substr(NS.FC_SYNONIM, 1, 10), 'KONS_CHILD', 1, 0), n.fd_run ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id_last
              FROM ASU.TAMBTALON TAT
             INNER JOIN ASU.TAMBTALON_NAZ AN ON AN.FK_TALONID = TAT.FK_ID
             INNER JOIN ASU.VNAZ N ON N.FK_ID = AN.FK_NAZID
             inner join asu.tpac_naz_tmp l on l.naz_id = n.fk_id
             INNER JOIN asu.tsmid_KONS_SPEC NS ON NS.FK_ID = N.FK_SMID
              left join asu.ttypedoc d on d.fk_id = l.fk_typedocid
              LEFT JOIN asu.tsmid tr ON tr.fk_id = TAT.FK_REASON
              where l.fk_tarif_type = 1 -- диспансеризация
                and N.FK_NAZSOSID = ASU.GET_VYPNAZSOSID) nl

     inner join asu.tpeoples tp on tp.fk_id = nl.FK_PEPLID

      left JOIN (SELECT r.FC_ASKID fc_code, r.fc_replyid fn_age
                   FROM asu.treplytable r
                  WHERE r.FC_ASK = 'THEAL_DISP'
                    AND r.FC_ASKFIELD = 'CODE'
                    AND r.FC_REPLY = 'NUMBERS'
                    AND r.FC_REPLYFIELD = 'RN'
                  group by r.FC_ASKID, r.fc_replyid) r ON r.fn_age = nvl(TRUNC(MONTHS_BETWEEN(nl.FD_DATE2, tp.fd_rojd)/12), 0)
                                                      AND r.fc_code LIKE 'TD%' || decode(nl.FC_SYNONIM,
                                                                                         'KONS_DISP_1_D',
                                                                                         decode(tp.fp_sex, 0, 'G.1', 'B.1'),
                                                                                         'KONS_DISP_1_DO',
                                                                                         decode(tp.fp_sex, 0, 'G.2', 'B.2'),
                                                                                         decode(tp.fp_sex, 0, 'W', 'M')) || '%'
      left JOIN ASU.THEAL H ON H.CODE = r.fc_code
      left JOIN ASU.THEAL_COST C ON C.FK_HEALID = H.FK_ID
                                AND nl.FD_DATE2 BETWEEN C.FD_DATE1 AND NVL(C.FD_DATE2, nl.FD_DATE2)
      LEFT JOIN (SELECT MAX(tdt.fk_id) fk_id FROM asu.ttypedoc tdt WHERE tdt.fc_synonim = 'OMS') tdt ON tdt.fk_id = h.fk_doctypeid

     where nl.fk_id = nl.fk_id_last;
   end if;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE CalculateChildProf is
 begin
  if GetPac_naz_tmpCount(2) > 0 then
    insert into ASU.VNAZ_COST
    select 1 heal_count,
           nl.id_ill FK_TALONID,
           nl.fk_id id_ill_u,
           nvl(nl.fk_id, asu.PKG_TARIFDETAIL.AddNaz(vUSE_TarifDetail,

               'Назначение "' || nl.fc_nazname || '" от ' || to_char(trunc(nl.fd_date1), 'dd.mm.yyyy') ||
               decode(tdt.fk_id, NULL, ' Тариф не выбран так как нет соответствующей услуги, относящейся к ОМС (Код: ' || decode(H.CODE, null, 'Не задан', H.CODE) || ')', ' Выбран тариф, услуга ОМС, код: ' || H.CODE || ', цена: ' || decode(C.FN_COST, null, 'не задана', to_char(C.FN_COST)) ||
                 ' Маска кода: ' || 'TD%' || decode(Nl.FC_SYNONIM,
                                                    'KONS_CHILD_PERIOD_DOSH',
                                                    'TPN.3.01',
                                                    'KONS_CHILD_PERIOD_NOS',
                                                    'TPN.3.02',
                                                    'KONS_CHILD_PERIOD_DS',
                                                    'TPN.3.03',
                                                    'KONS_CHILD_PROF_I',
                                                    decode(tp.fp_sex, 0, 'TPG.1', 'TPB.1') || '.' || asu.GET_HEAL_CHILD_AGE_POSTF(MONTHS_BETWEEN(nl.fd_date2, tp.fd_rojd)),
                                                    'KONS_CHILD_PREV_I',
                                                    decode(tp.fp_sex, 0, 'TPG.2', 'TPB.2') || '.' || asu.GET_HEAL_CHILD_AGE_POSTF(MONTHS_BETWEEN(nl.fd_date2, tp.fd_rojd)),
                                                    '')) ||
                 ' начало действия: ' || decode(c.fd_date1, null, 'не задано', to_char(c.fd_date1, 'dd.mm.yyyy')) ||
                 ' окончание действия: ' || decode(c.fd_date2, null, 'не задано', to_char(c.fd_date2, 'dd.mm.yyyy')),

               nl.fk_id, vTarifDetailOwner)) naz_id,

           null nazheal_healid,

           3 cost_type_OMS,
           H.FK_ID fk_healid_OMS,
           decode(tdt.fk_id, NULL, '', H.CODE) heal_code_OMS,
           decode(tdt.fk_id, NULL, NULL, C.FN_COST) fn_cost_OMS,
           null cost_type_DMS,
           null fk_healid_DMS,
           null heal_code_DMS,
           null fn_cost_DMS,
           null cost_type_KOMERC,
           null fk_healid_KOMERC,
           null heal_code_KOMERC,
           null fn_cost_KOMERC,
           null cost_type_DOGOVOR,
           null fk_healid_DOGOVOR,
           null heal_code_DOGOVOR,
           null fn_cost_DOGOVOR,
           null cost_type_BUDZHET,
           null fk_healid_BUDZHET,
           null heal_code_BUDZHET,
           null fn_cost_BUDZHET,
           null cost_type_UDOST,
           null fk_healid_UDOST,
           null heal_code_UDOST,
           null fn_cost_UDOST,
           null cost_type_OBOSNOVANIE,
           null fk_healid_OBOSNOVANIE,
           null heal_code_OBOSNOVANIE,
           null fn_cost_OBOSNOVANIE,
           null cost_type_SERTIFIKAT,
           null fk_healid_SERTIFIKAT,
           null heal_code_SERTIFIKAT,
           null fn_cost_SERTIFIKAT,

           nl.talon_typedoc_syn,

           nl.FK_PACID,
           nl.FK_PEPLID,

           nl.is_refuse,

           trunc(nl.fd_date1) DATE_E_U,
           trunc(nl.fd_date2) DATE_B_U,
           nl.fd_date1 DATE_E_U_TIME,
           nl.fd_date2 DATE_B_U_TIME,

           nl.fk_ispolid,
           nl.fk_vrachid,
           nvl(nl.fk_vrachid, nvl(decode(nl.fk_ispolid, 0, null, nl.fk_ispolid), nl.fk_vrachid)) fk_sotrid,

           nl.fk_insurdocs,
           nl.fk_companyid fk_ic_id,

           H.FK_ID fk_healid,
           decode(tdt.fk_id, NULL, '', H.CODE) heal_code,
           decode(tdt.fk_id, NULL, NULL, C.FN_COST) fn_cost,
           2 fk_tarif_type -- профосмотры детей
      from (select n.fk_id,
                   n.fk_ispolid,
                   n.fk_vrachid,
                   l.fk_peplid,
                   tat.fd_opened fd_date1,
                   tat.fd_closed fd_date2,
                   NS.FC_SYNONIM,
                   tat.fk_id id_ill,
                   tat.fk_ambid FK_PACID,
                   tr.fc_synonim r_syn,
                   l.fk_insurdocs,
                   l.fk_companyid,
                   l.fc_nazname,
                   l.is_refuse,
                   d.fc_synonim talon_typedoc_syn,
                   LAST_VALUE(n.FK_ID) OVER(PARTITION BY TAT.FK_ID ORDER BY decode(substr(NS.FC_SYNONIM, 1, 10), 'KONS_CHILD', 1, 0), n.fd_run ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id_last
              FROM ASU.TAMBTALON TAT
             INNER JOIN ASU.TAMBTALON_NAZ AN ON AN.FK_TALONID = TAT.FK_ID
             INNER JOIN ASU.VNAZ N ON N.FK_ID = AN.FK_NAZID
             inner join asu.tpac_naz_tmp l on l.naz_id = n.fk_id
             INNER JOIN asu.tsmid_KONS_SPEC NS ON NS.FK_ID = N.FK_SMID
              left join asu.ttypedoc d on d.fk_id = l.fk_typedocid
              LEFT JOIN asu.tsmid tr ON tr.fk_id = TAT.FK_REASON
              where l.fk_tarif_type = 2 -- диспансеризация
                and N.FK_NAZSOSID = ASU.GET_VYPNAZSOSID) nl

     inner join asu.tpeoples tp on tp.fk_id = nl.FK_PEPLID

      left JOIN ASU.THEAL H ON H.CODE =
                               decode(Nl.FC_SYNONIM,
                                      'KONS_CHILD_PERIOD_DOSH',
                                      'TPN.3.01',
                                      'KONS_CHILD_PERIOD_NOS',
                                      'TPN.3.02',
                                      'KONS_CHILD_PERIOD_DS',
                                      'TPN.3.03',
                                      'KONS_CHILD_PROF_I',
                                      decode(tp.fp_sex, 0, 'TPG.1', 'TPB.1') || '.' || asu.GET_HEAL_CHILD_AGE_POSTF(MONTHS_BETWEEN(nl.fd_date2, tp.fd_rojd)),
                                      'KONS_CHILD_PREV_I',
                                      decode(tp.fp_sex, 0, 'TPG.2', 'TPB.2') || '.' || asu.GET_HEAL_CHILD_AGE_POSTF(MONTHS_BETWEEN(nl.fd_date2, tp.fd_rojd)),
                                      '') -- Для TPG и TPB берётся по возрасту (т.е. из r.fc_code), для остальных по назнчению (ts.KOD_EO_MASK совпадает с кодом)
      left JOIN ASU.THEAL_COST C ON C.FK_HEALID = H.FK_ID
                                AND nl.FD_DATE2 BETWEEN C.FD_DATE1 AND NVL(C.FD_DATE2, nl.FD_DATE2)
      LEFT JOIN (SELECT MAX(tdt.fk_id) fk_id FROM asu.ttypedoc tdt WHERE tdt.fc_synonim = 'OMS') tdt ON tdt.fk_id = h.fk_doctypeid

     where nl.fk_id = nl.fk_id_last;
   end if;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE CalculateER is
 begin
  if GetPac_naz_tmpCount(3) > 0 then
    insert into ASU.VNAZ_COST
    select 1 heal_count,

           nvl(l.FK_TALONID, asu.PKG_TARIFDETAIL.AddTalon(vUSE_TarifDetail,

               'Случай скорой помощи, пациент' || decode(cm.fk_regionid, ASU.GET_NATIVE_REGION,
                 ' с местным страховым документом, поэтому выбран код SMP01, цена 0',
                 ' со страховым документов другого региона, поэтому выбран код SMP02, цена ') ||
                 decode(HC.FN_COST, null, 'не задана', to_char(HC.FN_COST)),

               l.FK_TALONID, vTarifDetailOwner)) FK_TALONID,

           l.FK_TALONID id_ill_u,
           l.naz_id,

           null nazheal_healid,

           3 cost_type_OMS,
           HC.FK_ID fk_healid_OMS,
           DECODE(cm.fk_regionid, ASU.GET_NATIVE_REGION, 'SMP01', 'SMP02') heal_code_OMS,
           DECODE(cm.fk_regionid, ASU.GET_NATIVE_REGION, 0, hc.fn_cost) fn_cost_OMS,
           null cost_type_DMS,
           null fk_healid_DMS,
           null heal_code_DMS,
           null fn_cost_DMS,
           null cost_type_KOMERC,
           null fk_healid_KOMERC,
           null heal_code_KOMERC,
           null fn_cost_KOMERC,
           null cost_type_DOGOVOR,
           null fk_healid_DOGOVOR,
           null heal_code_DOGOVOR,
           null fn_cost_DOGOVOR,
           null cost_type_BUDZHET,
           null fk_healid_BUDZHET,
           null heal_code_BUDZHET,
           null fn_cost_BUDZHET,
           null cost_type_UDOST,
           null fk_healid_UDOST,
           null heal_code_UDOST,
           null fn_cost_UDOST,
           null cost_type_OBOSNOVANIE,
           null fk_healid_OBOSNOVANIE,
           null heal_code_OBOSNOVANIE,
           null fn_cost_OBOSNOVANIE,
           null cost_type_SERTIFIKAT,
           null fk_healid_SERTIFIKAT,
           null heal_code_SERTIFIKAT,
           null fn_cost_SERTIFIKAT,

           d.fc_synonim talon_typedoc_syn,

           l.FK_PACID,
           l.FK_PEPLID,

           l.is_refuse,

           trunc(l.fd_calc) DATE_E_U,
           trunc(l.fd_calc) DATE_B_U,
           l.fd_calc DATE_E_U_TIME,
           l.fd_calc DATE_B_U_TIME,

           l.fk_ispolid,
           l.fk_vrachid,
           nvl(l.fk_vrachid, nvl(decode(l.fk_ispolid, 0, null, l.fk_ispolid), l.fk_vrachid)) fk_sotrid,

           l.fk_insurdocs,
           cm.fk_id fk_ic_id,

           HC.FK_ID fk_healid,
           DECODE(cm.fk_regionid, ASU.GET_NATIVE_REGION, 'SMP01', 'SMP02') heal_code,
           DECODE(cm.fk_regionid, ASU.GET_NATIVE_REGION, 0, hc.fn_cost) fn_cost,
           3 fk_tarif_type -- скорая помощь
      from asu.tpac_naz_tmp l
      left join (select * from asu.TCOMPANY where fl_del = 0) Cm on Cm.FK_ID = l.FK_COMPANYID
      left join asu.ttypedoc d on d.fk_id = l.fk_typedocid
      left join (SELECT h.fk_id, c.fn_cost, c.fd_date1, c.fd_date2
                   FROM ASU.THEAL H
                  INNER JOIN ASU.THEAL_COST C ON C.FK_HEALID = H.FK_ID
                  WHERE FN_COST IS NOT NULL
                    AND h.CODE = 'SMP02'
                  GROUP BY h.fk_id, c.fn_cost, c.fd_date1, c.fd_date2) hc ON l.Fd_Calc BETWEEN hc.fd_date1 AND NVL(hc.fd_date2, l.Fd_Calc)
     where l.fk_tarif_type = 3;
   end if;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FILL_CACHE IS
 pragma autonomous_transaction;
 BEGIN
  delete from ASU.TSMID_KONS_SPEC;
  insert into ASU.TSMID_KONS_SPEC(FK_ID, FC_SYNONIM, FN_DISP_STAGE)
  SELECT ns.fk_id, NS.FC_SYNONIM, decode(substr(NS.FC_SYNONIM, 1, 11), 'KONS_DISP_1', 1, 'KONS_DISP_2', 2, 0) KONS_DISP
      FROM ASU.TSMID NS
     WHERE NS.FK_OWNER = (SELECT TS.FK_ID FROM ASU.TSMID TS WHERE TS.FC_SYNONIM = 'KONS_SPEC');

  commit;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE Calculate(aCostFromDate DATE default null, aSMID_KONS_SPEC_ExtFill integer default 0, aUseHEAL integer default 1, aUseDISP integer default 1, aUsePROF integer default 1, aUseER integer default 1, pUseTarifDetail Number default 0, pTarifDetailOwner Varchar2 default '') IS
 BEGIN
  vUSE_TarifDetail := pUseTarifDetail;
  vTarifDetailOwner := pTarifDetailOwner;

  if aSMID_KONS_SPEC_ExtFill = 0 then
    FILL_CACHE;
  end if;

  ASU.DOSTAT('ASU', 'VNAZ_COST_LIMIT');
  UPDATE asu.vnaz_cost_limit l SET l.fk_nazid = -1 WHERE l.fk_nazid IS NULL;
  UPDATE asu.vnaz_cost_limit l SET l.fk_talonid = -1 WHERE l.fk_talonid IS NULL;
  ASU.DOSTAT('ASU', 'VNAZ_COST_LIMIT');

  EXECUTE IMMEDIATE('truncate table asu.VNAZ_CALC_LIMIT_ADD');
  INSERT INTO ASU.VNAZ_CALC_LIMIT_ADD
   (fd_calc,
    fd_naz,
    fd_run,
    naz_id,
    fk_smid,
    fk_ispolid,
    fk_vrachid,
    fc_name,
    fk_ambid)
  SELECT l.fd_calc,
         n.fd_naz,
         n.fd_run,
         n.fk_id naz_id,
         n.fk_smid,
         n.fk_ispolid,
         n.fk_vrachid,
         n.fc_name,
         n.fk_pacid fk_ambid
    FROM asu.vnaz_cost_limit l
   INNER JOIN asu.vnaz n ON n.fk_id = l.fk_nazid
   WHERE l.fk_nazid > -1;

  INSERT INTO ASU.VNAZ_CALC_LIMIT_ADD
   (FK_REASON,
    fd_calc,
    fd_closed,
    fd_naz,
    fd_run,
    naz_id,
    fk_smid,
    fk_ispolid,
    fk_vrachid,
    fc_name,
    FK_TALONID,
    fk_ambid,
    FK_INSURANCEID)
   SELECT tat.FK_REASON,
          l.fd_calc,
          tat.fd_closed,
          n.fd_naz,
          n.fd_run,
          n.fk_id naz_id,
          n.fk_smid,
          n.fk_ispolid,
          n.fk_vrachid,
          n.fc_name,
          tat.fk_id FK_TALONID,
          tat.fk_ambid,
          TAT.FK_INSURANCEID
     FROM asu.vnaz_cost_limit l
    INNER JOIN asu.tambtalon tat ON tat.fk_id = l.fk_talonid
    INNER JOIN asu.tambtalon_naz an ON an.fk_talonid = tat.fk_id
    INNER JOIN asu.vnaz n ON n.fk_id = an.fk_nazid
    WHERE l.fk_talonid > -1;

  ASU.DOSTAT('ASU', 'VNAZ_CALC_LIMIT_ADD');

  FOR c IN (SELECT l.naz_id,
                   tat.FK_REASON,
                   tat.fd_closed,
                   tat.fk_id FK_TALONID,
                   tat.fk_ambid,
                   TAT.FK_INSURANCEID
              FROM asu.vnaz_calc_limit_add l
             INNER JOIN asu.tambtalon_naz an ON an.fk_nazid = l.naz_id
             INNER JOIN asu.tambtalon tat ON tat.fk_id = an.fk_talonid
             WHERE l.fk_talonid = -1)
  LOOP
    UPDATE asu.vnaz_calc_limit_add t
       SET t.FK_REASON = c.FK_REASON,
           t.fd_closed = c.fd_closed,
           t.FK_TALONID = c.FK_TALONID,
           t.fk_ambid = c.fk_ambid,
           T.FK_INSURANCEID = c.FK_INSURANCEID
     WHERE t.naz_id = c.naz_id;
  END LOOP;

  ASU.DOSTAT('ASU', 'VNAZ_CALC_LIMIT_ADD');

  FOR c IN (SELECT t.fk_ambid,
                   i.fk_id fk_insurdocs,
                   i.FK_COMPANYID FK_COMPANYID,
                   i.fk_typedocid fk_typedocid
              FROM asu.vnaz_calc_limit_add t
             INNER join ASU.TINSURDOCS I on I.FK_ID = T.FK_INSURANCEID
             WHERE T.FK_INSURANCEID > -1)
  LOOP
    UPDATE asu.vnaz_calc_limit_add t
       SET t.fk_insurdocs = c.fk_insurdocs, t.FK_COMPANYID = c.FK_COMPANYID, t.fk_typedocid = c.fk_typedocid
     WHERE t.fk_ambid = c.fk_ambid;
  END LOOP;
  ASU.DOSTAT('ASU', 'VNAZ_CALC_LIMIT_ADD');
  FOR c IN (SELECT t.fk_ambid,
                   i.fk_id fk_insurdocs,
                   i.FK_COMPANYID FK_COMPANYID,
                   i.fk_typedocid fk_typedocid
              FROM (SELECT t.fk_ambid, MAX(PI.FK_INSURDOCID) FK_INSURDOCID
                      FROM asu.vnaz_calc_limit_add t
                     INNER JOIN ASU.TPAC_INSURANCE pi ON pi.fk_pacid = t.fk_ambid
                     WHERE T.FK_INSURANCEID = -1
                     GROUP BY t.fk_ambid) t
             INNER JOIN ASU.TINSURDOCS I ON I.FK_ID = t.FK_INSURDOCID)
  LOOP
    UPDATE asu.vnaz_calc_limit_add t
       SET t.fk_insurdocs = c.fk_insurdocs, t.FK_COMPANYID = c.FK_COMPANYID, t.fk_typedocid = c.fk_typedocid
     WHERE t.fk_ambid = c.fk_ambid;
  END LOOP;
  ASU.DOSTAT('ASU', 'VNAZ_CALC_LIMIT_ADD');

  FOR c IN (SELECT t.fk_ambid,
                   0 is_refuse,
                   k.FK_PEPLID FK_PEPLID,
                   d.FK_VIDDOCID fk_uslvidid
              FROM asu.vnaz_calc_limit_add t
             INNER join ASU.Tambulance k ON k.fk_id = t.fk_ambid
              left join asu.TDOCOBSL D on D.FK_ID = k.FK_DOCOBSL)
  LOOP
    UPDATE asu.vnaz_calc_limit_add t
       SET t.is_refuse = c.is_refuse, t.FK_PEPLID = c.FK_PEPLID, t.fk_uslvidid = c.fk_uslvidid
     WHERE t.fk_ambid = c.fk_ambid;
  END LOOP;
  ASU.DOSTAT('ASU', 'VNAZ_CALC_LIMIT_ADD');
  FOR c IN (SELECT t.fk_ambid,
                   2 is_refuse,
                   k.FK_PEPLID FK_PEPLID,
                   k.fk_uslvidid
              FROM asu.vnaz_calc_limit_add t
             INNER join ASU.Tkarta k ON k.fk_id = t.fk_ambid
             WHERE t.FK_PEPLID IS NULL)
  LOOP
    UPDATE asu.vnaz_calc_limit_add t
       SET t.is_refuse = c.is_refuse, t.FK_PEPLID = c.FK_PEPLID, t.fk_uslvidid = c.fk_uslvidid
     WHERE t.fk_ambid = c.fk_ambid;
  END LOOP;
  ASU.DOSTAT('ASU', 'VNAZ_CALC_LIMIT_ADD');

  EXECUTE IMMEDIATE('truncate table asu.tpac_naz_tmp');
  insert into asu.tpac_naz_tmp
   (--FN_CONNECT,
    IS_REFUSE,
    FD_CALC,
    FD_CLOSED,
    FD_NAZ,
    FD_RUN,
    NAZ_ID,
    FK_SMID,
    FK_ISPOLID,
    FK_VRACHID,
    FK_TALONID,
    FK_PACID,
    FK_PEPLID,
    FK_INSURDOCS,
    FK_COMPANYID,
    FK_TYPEDOCID,
    FK_USLVIDID,
    FK_TARIF_TYPE,
    fc_nazname)
  select 0 IS_REFUSE,
         ta.fd_opened FD_CALC,
         ta.fd_opened FD_CLOSED,
         ta.fd_opened FD_NAZ,
         ta.fd_opened FD_RUN,
         null NAZ_ID,
         null FK_SMID,
         ta.fk_sotrclosed FK_ISPOLID,
         ta.fk_sotrclosed FK_VRACHID,
         nvl(ta.fk_id, asu.PKG_TARIFDETAIL.AddTalon(vUSE_TarifDetail, 'Талон принят к обработке, как относящийся к скорой помощи', ta.fk_id, vTarifDetailOwner)) FK_TALONID,
         ta.fk_ambid FK_PACID,
         l.fk_peplid FK_PEPLID,
         l.fk_insurdocs,
         l.FK_COMPANYID,
         l.fk_typedocid,
         asu.GET_USLVID_ER FK_USLVIDID,
         3 FK_TARIF_TYPE, -- скорая помощь (!!! только по талону, соотвтетсующихназначений НЕТ)
         '' fc_nazname
      from asu.tambtalon ta
     inner join asu.vnaz_calc_limit_add l on l.fk_talonid = ta.fk_id
     where l.fk_uslvidid = asu.GET_USLVID_ER

  union all

  select IS_REFUSE,
         trunc(nvl(t.fd_calc,
                   decode(tdt.FC_VNAZ_COST_DT,
                          'CLOSE_RUN', nvl(t.fd_closed, t.fd_run), 'NAZ', t.fd_naz, 'RUN', t.fd_run, 'CLOSE', t.fd_closed,
                           nvl(t.fd_closed, t.fd_run)) )) FD_CALC,
         FD_CLOSED,
         FD_NAZ,
         FD_RUN,
         nvl(NAZ_ID,
             asu.PKG_TARIFDETAIL.AddNaz(vUSE_TarifDetail,

               'Назначение "' || t.fc_nazname || '" от ' || to_char(fd_naz, 'dd.mm.yyyy') ||
               ' Тарификация по дате ' ||
               decode(t.fd_calc, null,
                       decode(tdt.FC_VNAZ_COST_DT,
                              'CLOSE_RUN', decode(t.fd_closed, null, 'закрытия талона', 'выполнения назначения'),
                              'NAZ', 'назначения', 'RUN', 'выполнения назначения', 'CLOSE', 'закрытия талона',
                               decode(t.fd_closed, null, 'закрытия талона', 'выполнения назначения')),
               'заданной внешним пользователем подсистемы расчёта стоимости ' || to_char(t.fd_calc, 'dd.mm.yyyy') ),
               NAZ_ID, vTarifDetailOwner) ) NAZ_ID,
         FK_SMID,
         FK_ISPOLID,
         FK_VRACHID,
         FK_TALONID,
         fk_ambid FK_PACID,
         FK_PEPLID,
         FK_INSURDOCS,
         FK_COMPANYID,
         FK_TYPEDOCID,
         FK_USLVIDID,
         FK_TARIF_TYPE,
         fc_nazname
    from (select t.*,
                 case
                   when d.fk_id is not null and max(decode(ns.fn_disp_stage, 1, 1, 0)) OVER(PARTITION BY t.fk_talonid) = 1 then --  max(decode(ns.fn_disp_stage, 1, 1, 0)) OVER(PARTITION BY t.fk_talonid) - признак того, что в талоне есть диспансеризация 1го этапа, если это 1й этап, то цена рассчитывается только для одной услуги
                    nvl(1, asu.PKG_TARIFDETAIL.AddNaz(vUSE_TarifDetail, 'Назначение "' || t.fc_name || '" от ' || to_char(t.fd_naz, 'dd.mm.yyyy') || ' принято к обработке, как относящийся к диспансеризации, тип документа "' || uv.fc_name || '"', t.naz_id, vTarifDetailOwner)) -- диспансеризация
                   when t.fk_uslvidid = asu.GET_USLVID_CHILD then
                    nvl(2, asu.PKG_TARIFDETAIL.AddNaz(vUSE_TarifDetail, 'Назначение "' || t.fc_name || '" от ' || to_char(t.fd_naz, 'dd.mm.yyyy') || ' принято к обработке, как относящийся к профосмотрам детей, тип документа "' || uv.fc_name || '"', t.naz_id, vTarifDetailOwner)) -- профосмотры детей
                   else
                    nvl(0, asu.PKG_TARIFDETAIL.AddNaz(vUSE_TarifDetail, 'Назначение "' || t.fc_name || '" от ' || to_char(t.fd_naz, 'dd.mm.yyyy') || ' принято к обработке, как обычная поликлиника, тип документа "' || uv.fc_name || '"', t.naz_id, vTarifDetailOwner)) -- обычные услуги
                 end fk_tarif_type,
                 ns.fn_disp_stage,
                 max(decode(NS.fk_id, null, null, t.naz_id)) OVER(PARTITION BY t.fk_talonid) KONS_SPEC_naz_id_max,
                 t.fc_name fc_nazname
            from  asu.vnaz_calc_limit_add t
            left join (SELECT t.fk_id FROM asu.tuslvid t CONNECT BY PRIOR t.fk_id = t.fk_ownerid START WITH t.fk_id = asu.get_uslvid_disp) d on d.fk_id = t.fk_uslvidid
            left join asu.tuslvid uv on uv.fk_id = t.fk_uslvidid
            left JOIN asu.tsmid_KONS_SPEC NS ON NS.FK_ID = t.FK_SMID
           WHERE t.fk_uslvidid <> asu.GET_USLVID_ER) t
    left join asu.ttypedoc d on d.fk_id = t.fk_typedocid
    left join (select t.fc_askid FC_TYPEDOC, max(t.fc_replyid) FC_VNAZ_COST_DT
                 from asu.treplytable t
                where t.fc_ask = 'ASU.TTYPEDOC'
                  and t.fc_askfield = 'FC_SYNONIM'
                  and t.fc_reply = 'VNAZ_COST_CALC_DT'
                  and t.fc_replyfield = 'FC_SYNONIM'
                group by t.fc_askid) tdt on tdt.FC_TYPEDOC = d.FC_SYNONIM
   where fk_tarif_type = 0 -- для обычных услуг цена ицется для каждой
      or (fk_tarif_type = 1 and fn_disp_stage = 1) -- Для диспансеризации 1-го этапа, поиск цены осуществляется только для одной услуги - диспансеризации первого этапа
      or (fk_tarif_type = 2 and naz_id = KONS_SPEC_naz_id_max);

   ASU.DOSTAT('ASU', 'TPAC_NAZ_TMP');

  if ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') = 'SK' then
    update asu.tpac_naz_tmp t
       set t.amb_pr = (SELECT max(i.FK_VISITVID)
                         FROM asu.TAMBTALON TT
                        inner join asu.tambtalon_info i on i.fk_talonid = tt.fk_id
                        WHERE tt.FK_ID = t.fk_talonid);
  else
    update asu.tpac_naz_tmp t
       set t.amb_pr = (SELECT max(TT.FK_REASON)
                         FROM asu.TAMBTALON TT
                        WHERE tt.FK_ID = t.fk_talonid);
  end if;

  EXECUTE IMMEDIATE('truncate table ASU.VNAZ_COST');
  if aUseHEAL = 1 then
    CalculateCalcHeal(aCostFromDate);
  end if;
  if aUseDisp = 1 then
    CalculateDisp;
  end if;
  if aUseProf = 1 then
    CalculateChildProf;
  end if;
  if aUseER = 1 then
    CalculateER;
  end if;

  ASU.DOSTAT('ASU', 'VNAZ_COST');
end;

END;
/

SHOW ERRORS;


