DROP PACKAGE BODY ASU.PKG_STAT_COST
/

--
-- PKG_STAT_COST  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_STAT_COST IS

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
/*
 procedure CreateTSLUCH_DBF_CALC_Table(aSCHETCODE EXCH79.SCHET.code%type, aStep Number) is
   vTabName Varchar2(250);
   vCount Number;
 begin
   vTabName := 'TSLUCH_DBF_CALC_' || to_char(aSCHETCODE) || '_'  || to_char(aStep);

   select count(*) into vCount from dba_tab_cols t where t.Owner = 'EXCH79' and t.TABLE_NAME = vTabName;
   if vCount > 0 then
     execute immediate 'drop table exch79.' || vTabName;
   end if;

   execute immediate 'create table exch79.' || vTabName || ' as select * from ASU.TSLUCH_DBF_CALC';
 end;
*/
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure FillDiagByLastDiag(aStep NUMBER,
                              auslvidid NUMBER default -1, aExceptUslvidid NUMBER default 0,
                              atype_v_mu NUMBER default -1, aExceptType_v_mu NUMBER default 0) is
  begin
   -- заполняем дополнительные поля
   for c in (SELECT nvl(t.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Добавлены данные диагноза', t.id_ill, vTarifDetailOwner)) id_ill,
                    tsd.fk_mkb10 fc_icd,
                    td.fl_first,
                    tsd.fk_id fk_smid
               from asu.tsluch_dbf_calc t
              inner join (SELECT td.fk_pacid, td.fk_id, td.fk_smdiagid, td.fl_first, LAST_VALUE(td.fk_id) OVER(PARTITION BY td.fk_pacid ORDER BY td.fd_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_diag_last
                                  FROM asu.tdiag td
                                 where td.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN') AND td.fp_type = STAT.PKG_STATUTIL.get_smidid('PRI_VYPISKE')) td on td.fk_pacid = t.fk_pacid and td.fk_id = td.fk_diag_last
              inner join asu.tsmid tsd on tsd.fk_id = td.fk_smdiagid
              where t.fl_poly = 0
                and t.fn_step = aStep
                and (auslvidid = -1
                    OR (aExceptUslvidid = 0 AND t.fk_uslvidid = auslvidid)
                    OR (aExceptUslvidid = 1 AND t.fk_uslvidid <> auslvidid))
                and (atype_v_mu = -1
                    OR (aExceptType_v_mu = 0 AND t.type_v_mu = atype_v_mu)
                    OR (aExceptType_v_mu = 1 AND t.type_v_mu <> atype_v_mu))
            )
   loop
     update asu.tsluch_dbf_calc t
        set t.fc_icd         = c.fc_icd,
            t.fl_first       = c.fl_first,
            t.fk_smid        = c.fk_smid
      where t.id_ill = c.id_ill;
   end loop;
  end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure FillDiagByPeresel(aStep NUMBER,
                             auslvidid NUMBER default -1, aExceptUslvidid NUMBER default 0,
                             atype_v_mu NUMBER default -1, aExceptType_v_mu NUMBER default 0) is
 begin
   -- заполняем дополнительные поля
   for c in (SELECT t.id_ill,
                    tpd.fc_code fc_icd,
                    tpd.fl_first,
                    tpd.fk_smid
               from asu.tsluch_dbf_calc t
              inner join asu.tperesel_diag tpd on tpd.fk_peresel = t.id_ill
              where t.fl_poly = 0
                and t.fn_step = aStep
                and t.vmp_id is null -- для ВМП диагноз никогда не определяется по переводам
                and (auslvidid = -1
                    OR (aExceptUslvidid = 0 AND t.fk_uslvidid = auslvidid)
                    OR (aExceptUslvidid = 1 AND t.fk_uslvidid <> auslvidid))
                and (atype_v_mu = -1
                    OR (aExceptType_v_mu = 0 AND t.type_v_mu = atype_v_mu)
                    OR (aExceptType_v_mu = 1 AND t.type_v_mu <> atype_v_mu))
            )
   loop
     update asu.tsluch_dbf_calc t
        set t.fc_icd         = c.fc_icd,
            t.fl_first       = c.fl_first,
            t.fk_smid        = c.fk_smid
      where t.id_ill = c.id_ill;
   end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure FillDiagForVMP(aStep NUMBER) is
 begin
   -- заполняем дополнительные поля
   for c in (SELECT nvl(t.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Добавлены данные диагноза для случая ВМП', t.id_ill, vTarifDetailOwner)) id_ill,
                    tsd.fk_mkb10 fc_icd,
                    td.fl_first,
                    tsd.fk_id fk_smid
               from asu.tsluch_dbf_calc t
              inner join (SELECT td.fk_pacid, td.fk_id, td.fk_smdiagid, td.fl_first, LAST_VALUE(td.fk_id) OVER(PARTITION BY td.fk_pacid ORDER BY td.fd_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_diag_last
                                  FROM asu.tdiag td
                                 where td.fl_main = STAT.PKG_STATUTIL.get_smidid('MAIN') AND td.fp_type = STAT.PKG_STATUTIL.get_smidid('PRI_VYPISKE')) td on td.fk_pacid = t.fk_pacid and td.fk_id = td.fk_diag_last
              inner join asu.tsmid tsd on tsd.fk_id = td.fk_smdiagid
              where t.fl_poly = 0
                and t.fn_step = aStep
                and t.vmp_id is not null -- для ВМП диагноз никогда не определяется по переводам
            )
   loop
     update asu.tsluch_dbf_calc t
        set t.fc_icd         = c.fc_icd,
            t.fl_first       = c.fl_first,
            t.fk_smid        = c.fk_smid
      where t.id_ill = c.id_ill;
   end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure SetDatesByKarta(aStep NUMBER,
                           auslvidid NUMBER default -1, aExceptUslvidid NUMBER default 0,
                           atype_v_mu NUMBER default -1, aExceptType_v_mu NUMBER default 0) is
 begin
   -- Дата начала и окончания устанавливаются равными дате начала и окончания случая
   for c in (select nvl(max(t.id_ill), asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Добавлены данные о начале и окончании случая', max(t.id_ill), vTarifDetailOwner)) id_ill,
                    t.fk_pacid,
                    ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(t.Fk_Pacid) fd_date1,
                    ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(t.Fk_Pacid) fd_date2
               from asu.tsluch_dbf_calc t
              where t.fl_poly = 0
                and t.fn_step = aStep
                and t.vmp_id is null -- для ВМП см. SetDatesForVMP
                and (auslvidid = -1
                    OR (aExceptUslvidid = 0 AND t.fk_uslvidid = auslvidid)
                    OR (aExceptUslvidid = 1 AND t.fk_uslvidid <> auslvidid))
                and (atype_v_mu = -1
                    OR (aExceptType_v_mu = 0 AND t.type_v_mu = atype_v_mu)
                    OR (aExceptType_v_mu = 1 AND t.type_v_mu <> atype_v_mu))
              group by t.fk_pacid)
   loop
     update asu.tsluch_dbf_calc s set s.fd_date1 = c.fd_date1, s.fd_date2 = c.fd_date2 where s.id_ill = c.id_ill;
     for d in (select nvl(s.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Перевод объединён с другим переводом этой карты (в результате этот перевод удаляется)', s.id_ill, vTarifDetailOwner)) id_ill
                 from asu.tsluch_dbf_calc s
                where s.fk_pacid = c.fk_pacid and s.id_ill <> c.id_ill)
     loop
       delete from asu.tsluch_dbf_calc s where s.id_ill = d.id_ill;
     end loop;
   end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure SetDatesForVMP(aStep NUMBER) is
 begin
   -- Дата начала и окончания устанавливаются равными дате начала и окончания случая
   for c in (select nvl(max(t.id_ill), asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Добавлены данные о начале и окончании случая', max(t.id_ill), vTarifDetailOwner)) id_ill,
                    t.fk_pacid,
                    ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(t.Fk_Pacid) fd_date1,
                    ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(t.Fk_Pacid) fd_date2
               from asu.tsluch_dbf_calc t
              where t.fl_poly = 0
                and t.fn_step = aStep
                and t.vmp_id is not null
              group by t.fk_pacid)
   loop
     update asu.tsluch_dbf_calc s set s.fd_date1 = c.fd_date1, s.fd_date2 = c.fd_date2 where s.id_ill = c.id_ill;
     for d in (select nvl(s.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Перевод объединён с другим переводом этой карты (в результате этот перевод удаляется) так как относится к ВМП', s.id_ill, vTarifDetailOwner)) id_ill
                 from asu.tsluch_dbf_calc s
                where s.fk_pacid = c.fk_pacid and s.id_ill <> c.id_ill)
     loop
       delete from asu.tsluch_dbf_calc s where s.id_ill = d.id_ill;
     end loop;
   end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure FillOperSK(aStep NUMBER) is
 begin
   for c in (
     SELECT nvl(t.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Добавлены данные об операции, код ' || max(t.KOD_EO_last), t.id_ill, vTarifDetailOwner)) id_ill,
            max(t.NAZ_ID_last) NAZ_ID_last, max(t.KOD_EO_last) KOD_EO_last,
            CAST(RTRIM(Sys_xmlagg(XMLELEMENT(col, t.KOD_EO || ',')).extract('/ROWSET/COL/text()').getclobval(), ',') AS VARCHAR2(4000)) KOD_EO_all
       FROM (SELECT t.id_ill,
                    LAST_VALUE(t.NAZ_ID) OVER(PARTITION BY t.id_ill ORDER BY t.DATEtime_E_U ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) NAZ_ID_last,
                    LAST_VALUE(t.KOD_EO) OVER(PARTITION BY t.id_ill ORDER BY t.DATEtime_E_U ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) KOD_EO_last,
                    t.KOD_EO
               FROM (SELECT c.id_ill,
                            n.FK_ID NAZ_ID,
                            c.fd_date1 DATE_B_U_TIME,
                            c.fd_date2 DATE_E_U_TIME,
                            (SELECT max(I.FD_DATE) -- NVL(I.FD_DATE, to_date(FC_CHAR, 'DD.MM.YYYY HH24:MI:SS'))
                               FROM ASU.TIB I
                              WHERE I.FK_SMID = STAT.PKG_STATUTIL.GET_SMIDID('PROTHOPER_OKON')
                                AND I.FK_PACID = N.FK_ID) DATETIME_E_U,
                            th.code KOD_EO
                       FROM asu.tsluch_dbf_calc c
                      INNER JOIN ASU.VNAZ N ON N.FK_PACID = c.FK_PACID
                       left join ASU.TPODPISNAZ tpn on tpn.fk_nazid = N.FK_ID
                      inner join ( Select ts.fk_id, '' fc_name from ASU.TSMID_OPER ts
                                   union all
                                   SELECT FK_ID, fc_name
                                     FROM ASU.TSMID
                                   CONNECT BY PRIOR fk_id = fk_owner
                                    START WITH FC_SYNONIM = 'RENTGENXIR_ISSLED'
                                  ) ts on ts.fk_id = n.fk_smid
                     left join ASU.TIB tI on tI.FK_PACID = N.FK_ID
                                         and tI.FK_SMEDITID IN (Select ts.fk_id from asu.tsmid ts where (fl_del <> 1 or fl_del is null) connect by prior ts.fk_id = ts.fk_owner start with ts.fc_synonim in ('PROC_OPER_NAZ_OPER', 'PROC_OPER_NAZ_OPER_2014'))
                                         and ts.fc_name is null
                     left join asu.tsmid tsi on tsi.fk_id = ti.fk_smid

                    inner join asu.theal_smid ths on ths.fk_smid = decode(ts.fc_name, null, tsi.fk_id, ts.fk_id)
                    inner join (select th.fk_id, th.code from asu.theal th where th.fk_parent = asu.get_oper_healid -- ветка операций, 41221 для кардио
                               ) th on th.fk_id = ths.fk_heal

                    WHERE N.FK_NAZSOSID = ASU.GET_VIPNAZ
                      AND c.fl_poly = 0
                      and c.vmp_id is null -- для ВМП нет необходимости заполнять данные операции
                      and c.fn_step = aStep) t
            WHERE t.DATEtime_E_U between t.date_b_u_time and t.date_e_u_time) t
            GROUP BY t.id_ill)
   LOOP
     update asu.tsluch_dbf_calc t set t.FC_OPERCODE = c.KOD_EO_last, t.FK_OPERNAZ = c.NAZ_ID_last, t.fc_opercode_all = c.KOD_EO_all where t.id_ill = c.id_ill;
   end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure FillOper(aStep NUMBER) is
 begin
   -- операции
   for c in (
     SELECT nvl(t.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Добавлены данные об операции, код ' || max(t.KOD_EO_last), t.id_ill, vTarifDetailOwner)) id_ill,
            max(t.NAZ_ID_last) NAZ_ID_last, max(t.KOD_EO_last) KOD_EO_last,
            CAST(RTRIM(Sys_xmlagg(XMLELEMENT(col, t.KOD_EO || ',')).extract('/ROWSET/COL/text()').getclobval(), ',') AS VARCHAR2(4000)) KOD_EO_all
       FROM (select t.id_ill, NAZ_ID_last, KOD_EO_last, t.KOD_EO
               from (SELECT t.id_ill,
                                  LAST_VALUE(t.NAZ_ID) OVER(PARTITION BY t.id_ill ORDER BY t.DATEtime_E_U ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) NAZ_ID_last,
                                  LAST_VALUE(t.KOD_EO) OVER(PARTITION BY t.id_ill ORDER BY t.DATEtime_E_U ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) KOD_EO_last,
                                  t.KOD_EO
                             FROM (SELECT c.id_ill,
                                          n.FK_ID NAZ_ID,
                                          c.fd_date1 DATE_B_U_TIME,
                                          c.fd_date2 DATE_E_U_TIME,
                                          (SELECT MAX(I.FD_DATE) -- DECODE(MAX(I.FD_DATE), NULL, TO_DATE(MAX(I.FC_CHAR), 'DD.MM.YYYY HH24:MI:SS'), MAX(I.FD_DATE))
                                                  FROM ASU.TIB I
                                                 WHERE I.FK_SMID = STAT.PKG_STATUTIL.GET_SMIDID('PROTHOPER_OKON')
                                                   AND I.FK_PACID = N.FK_ID) DATETIME_E_U,
                                              (SELECT REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(MAX(I.FC_CHAR), 'А', 'A'), 'С', 'C'), 'В', 'B'), 'Е', 'E'), 'Н', 'H'), '|', 'I'), 'О', 'O'), 'М', 'M'), 'К', 'K'), 'Р', 'P'), 'Т', 'T') FC_KOD
                                                 FROM ASU.TIB I
                                                WHERE I.FK_SMID = STAT.PKG_STATUTIL.GET_SMIDID('OPER_KOD')
                                                  AND I.FK_PACID = N.FK_ID
                                                  ) KOD_EO
                                     FROM asu.tsluch_dbf_calc c
              --                        INNER JOIN ASU.TPERESEL TP ON TP.FK_ID = c.id_ill
                                    INNER JOIN ASU.VNAZ N ON N.FK_PACID = c.FK_PACID
                                    INNER JOIN ASU.TSMID_OPER TSM ON TSM.FK_ID = N.FK_SMID
                                    WHERE N.FK_NAZSOSID = ASU.GET_VIPNAZ
                                      AND c.fl_poly = 0
                                      and c.fn_step = aStep
                                      and c.vmp_id is null -- для ВМП нет необходимости заполнять данные операции
                                   ) t WHERE t.DATEtime_E_U between t.date_b_u_time and t.date_e_u_time
                    ) t
              GROUP BY t.id_ill, NAZ_ID_last, KOD_EO_last, t.KOD_EO
            ) t
      GROUP BY t.id_ill)
   LOOP
     update asu.tsluch_dbf_calc t set t.FC_OPERCODE = c.KOD_EO_last, t.FK_OPERNAZ = c.NAZ_ID_last, t.fc_opercode_all = c.KOD_EO_all where t.id_ill = c.id_ill;
   end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure CalculatePaliativ is
 begin
   for c in (
    select nvl(t.ID_ILL,
               asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail,
                 'Палиативный случай. Выбран тариф: Код ' || nvl(t.fc_code, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost), 'не определена') ||
                 decode(t.pr_own, 1, ' Местный случай', ' Межтерриториальный случай') ||
                 decode(t.fl_isds, 0, ' Обычный стационар', ' Дневной стационар') ||
                 decode(t.fl_under18, 1, ' Несовершеннолетний пациент', ' Взрослый пациент (18 и больше лет)') ||
                 ' Местный тариф: Код ' || nvl(t.fc_code1, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost1), 'не определена') ||
                 ' Меж.тер. тариф: Код ' || nvl(t.fc_code2, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost2), 'не определена')
                 , t.ID_ILL, vTarifDetailOwner)) ID_ILL,
           t.pr_own, -- 1, значит пациент застрахован в ХМАО, 2 - пациент застрахован  вдругом регионе
           t.fc_code, -- код тарифа
           t.fn_cost, -- стоимость тарифа
           t.fl_under18,
           t.fk_pacid,
           trunc(t.fd_date1) fd_date1,
           trunc(t.fd_date2) fd_date2,
--           t.fl_isds,
           asu.GetStacWorkDayCount(trunc(t.fd_date1), trunc(t.fd_date2), t.fl_isds) +
           case when t.fk_peresel_paliativ is null
           then 0
           else
             case when t.fl_is_paliativ_vyp = 1 then
               0
             else
               1
             end
           end DAY_COUNT
--           decode(decode(t.fl_isds, 0, trunc(t.fd_date2) - trunc(t.fd_date1), ASU.PKG_WORKDAYS.workdays_between(trunc(t.fd_date1), trunc(t.fd_date2) + 1)),
--                  0, 1,
--                  decode(t.fl_isds, 0, trunc(t.fd_date2) - trunc(t.fd_date1), ASU.PKG_WORKDAYS.workdays_between(trunc(t.fd_date1), trunc(t.fd_date2) + 1))) DAY_COUNT
      from (SELECT t.ID_ILL,
                   t.pr_own, -- 1, значит пациент застрахован в ХМАО, 2 - пациент застрахован в другом регионе
                   CASE
                     WHEN t.pr_own = 2 AND max(t.fc_code2) IS NOT NULL THEN
                      max(t.fc_code2)
                     WHEN max(t.fc_code1) IS NOT NULL THEN
                      max(t.fc_code1)
                     ELSE
                      ''
                   END fc_code, -- код тарифа

                   CASE
                     WHEN t.pr_own = 2 AND max(t.fc_code2) IS NOT NULL THEN
                      max(t.fn_cost2)
                     WHEN max(t.fc_code1) IS NOT NULL THEN
                      max(t.fn_cost1)
                     ELSE
                      0
                   END fn_cost, -- стоимость тарифа -- max(t.fc_code1) fc_code1, max(t.fn_cost1) fn_cost1, max(t.fc_code2) fc_code2, max(t.fn_cost2) fn_cost2,

                   max(t.fl_under18) fl_under18,
                   max(t.fl_isds) fl_isds,

                   max(t.fc_code1) fc_code1,
                   max(t.fn_cost1) fn_cost1,
                   max(t.fc_code2) fc_code2,
                   max(t.fn_cost2) fn_cost2,
                   min(t.fd_date1) fd_date1,
                   max(t.fd_date2) fd_date2,
                   max(t.fk_pacid) fk_pacid,
                   max(t.fk_peresel_paliativ) fk_peresel_paliativ,
                   max(t.fl_is_paliativ_vyp) fl_is_paliativ_vyp
              FROM (SELECT t.id_ill,
--                           decode(t.fk_regionid, ASU.GET_NATIVE_REGION, 1, null, 1, 2) pr_own,
                           t.pr_own,
                           s.OWN st_own,
                           decode(s.OWN, 1, s.Fc_Code, '') fc_code1,
                           decode(s.OWN, 1, s.FN_COST, NULL) fn_cost1,
                           decode(s.OWN, 2, s.Fc_Code, '') fc_code2,
                           decode(s.OWN, 2, s.FN_COST, NULL) fn_cost2,
                           t.fl_under18,
                           t.id_ill fk_peresel,
                           t.fd_date1,
                           t.fd_date2,
                           t.fl_isds,
                           t.fk_pacid,
                           t.fk_peresel_paliativ,
                           t.fl_is_paliativ_vyp
                      from (

                            select t.id_ill,
                                   t.pr_own,
                                   t.fk_pacid,
                                   t.fk_peplid,
                                   case
                                     when TRUNC(MONTHS_BETWEEN(min(t.fd_date1), t.fd_rojd) / 12) < 18 then
                                      1
                                     else
                                      0
                                   end fl_under18,
                                   t.fk_uslvidid,
                                   ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(t.Fk_Pacid) fd_date1,
                                   ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(t.Fk_Pacid) fd_date2,
                                   decode(max(t.FK_OPERNAZ), null, '2', '1') fc_oper,
                                   nvl(trunc(t.fd_calc), trunc(max(t.fd_date2))) fd_calc,
                                   t.fk_smid,
                                   t.fl_isds,
                                   null fk_peresel_paliativ,
                                   0 fl_is_paliativ_vyp
                              from (select LAST_VALUE(t.id_ill) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_date2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) id_ill,
                                           t.pr_own,
                                           t.fk_pacid,
                                           t.fk_peplid,
                                           tk.fd_rojd,
                                           t.fk_uslvidid,
                                           t.FK_OPERNAZ,
                                           t.fd_calc,
                                           t.fd_date1,
                                           t.fd_date2,
                                           t.fk_smid,
                                           t.fl_isds
                                      from asu.tsluch_dbf_calc t
                                     -- дневной стационар. Для дневного и обычного стационара разные тарифы
                                     inner join asu.tkarta tk on tk.fk_id = t.fk_pacid
                                      left join (select p.fk_pacid from asu.vperesel_paliativ_nodel p where asu.EXCH79_PALIATIVE_LONG_KART = 1 group by p.fk_pacid) pp on pp.fk_pacid = tk.fk_id
                                     where t.fl_poly = 0
        --                               and t.fn_step = 1
                                       and t.vmp_id is null
                                       and pp.fk_pacid is null
                                       AND t.type_v_mu = vSmid_TYPE_V_MU_PALLIATIV) t
                             group by t.id_ill,
                                      t.pr_own,
                                      t.fk_pacid,
                                      t.fk_peplid,
                                      t.fd_rojd,
                                      t.fk_uslvidid,
                                      t.fd_calc,
                                      t.fk_smid,
                                      t.fl_isds

                             union all
                            select t.id_ill,
                                   t.pr_own,
--                                   t.fk_regionid,
                                   t.fk_pacid,
                                   t.fk_peplid,
                                   case
                                     when TRUNC(MONTHS_BETWEEN(t.fd_date1, tk.fd_rojd) / 12) < 18 then
                                      1
                                     else
                                      0
                                   end fl_under18,
                                   t.fk_uslvidid,
--                                   t.fk_koykavidid,
                                   t.fd_date1,
                                   t.fd_date2,
                                   decode(t.FK_OPERNAZ, null, '2', '1') fc_oper,
                                   nvl(trunc(t.fd_calc), trunc(t.fd_date2)) fd_calc,
                                   t.fk_smid,
                                   t.fl_isds,
--                                   LAST_VALUE(t.id_ill) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_date2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) ID_ILL_LAST,
                                   pp.fk_id fk_peresel_paliativ,
                                   pp.FL_VYP fl_is_paliativ_vyp
                              from asu.tsluch_dbf_calc t
                             -- дневной стационар. Для дневного и обычного стационара разные тарифы
                             inner join asu.tkarta tk on tk.fk_id = t.fk_pacid
                             inner join asu.vperesel_paliativ_nodel pp on pp.fk_id = t.id_ill
                             where t.fl_poly = 0
--                               and t.fn_step = 1
                               and t.vmp_id is null
                               AND t.type_v_mu = vSmid_TYPE_V_MU_PALLIATIV) t

                      -- определение тарифа в зависимости от диагноза, даты начала и окончания случая и дополнительных параметров, влияющих на код тарифа
                      left join (SELECT s.fc_code,
                                        ksg.fl_under18,
                                        MAX(SC.FN_COST) FN_COST,
                                        SC.FD_DATE1,
                                        SC.FD_DATE2,
                                        tsr.Code,
                                        decode(substr(tsr.Code, length(tsr.Code) - 3, length(tsr.Code)), 'OWN2', 2, 1) own
                                   FROM asu.Tstandart s
                                  INNER JOIN asu.TSTANDART_COST SC ON SC.FK_STANDARTID = S.FK_ID
                                  INNER JOIN asu.tstandart_razdel tsr ON tsr.fk_id = s.fk_razdel
                                  INNER JOIN (SELECT decode(t.fc_askid, 'PALIATIV_KSG_UNDER18', 1, 0) fl_under18,
                                                     t.fc_replyid CODE
                                                FROM asu.treplytable t
                                               WHERE t.fc_ask = 'STAC_TARIF_PALIATIV_KSG'
                                                 AND t.fc_askfield = 'CODE'
                                                 AND t.fc_reply = 'ASU.TSTANDART'
                                                 AND t.fc_replyfield = 'FC_CODE') KSG ON KSG.CODE = s.fc_code
                                  WHERE tsr.fc_synonym LIKE ('KSG%')
                                    AND SC.FN_COST > 0
--                                    AND (aCostFromDate IS NULL OR (aCostFromDate IS NOT NULL AND
--                                        (SC.FD_DATE2 > aCostFromDate OR SC.FD_DATE2 IS NULL)))
                                  GROUP BY SC.FD_DATE1, SC.FD_DATE2, tsr.Code, s.fc_code, ksg.fl_under18, tsr.fc_synonym) s
                        on t.fd_calc BETWEEN s.FD_DATE1 AND NVL(s.FD_DATE2, t.fd_calc)
                       AND s.fl_under18 = t.fl_under18
--                     WHERE t.id_ill = t.id_ill_last
                     ) t
             group by t.ID_ILL, t.pr_own) t
  ) loop
    update asu.tsluch_dbf_calc t
       set t.fn_step    = LAST_STEP,
           t.fc_code    = c.fc_code,
           t.fn_tarif   = c.fn_cost,
           t.fn_cost    = c.DAY_COUNT * c.fn_cost,
           t.FN_COUNT   = c.DAY_COUNT,
           t.fl_under18 = c.fl_under18,
           t.fd_date1 = c.fd_date1, -- даты меняются только тут так как выше необходимо выбирать последний по дате перевод
           t.fd_date2 = c.fd_date2
     where t.id_ill = c.id_ill;
    -- Все переводы палиативного случая, кроме того на основании которого была сформирована запись исключаются из расчёта
--    update asu.tsluch_dbf_calc t set t.fn_step = 0 where t.fk_pacid = c.fk_pacid and t.id_ill <> c.id_ill;
  end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure CalculateVMP(aCostFromDate DATE) is
 begin
   for c in (
    select nvl(t.ID_ILL,
               asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail,
                 'Случай ВМП. Выбран тариф: Код ' || nvl(t.fc_code, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost), 'не определена') ||
                 decode(t.pr_own, 1, ' Местный случай', ' Межтерриториальный случай') ||
                 decode(t.fl_isds, 0, ' Обычный стационар', ' Дневной стационар') ||
                 decode(t.fl_under18, 1, ' Несовершеннолетний пациент', ' Взрослый пациент (18 и больше лет)') ||
                 ' Тариф: Код ' || nvl(t.fc_code, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost), 'не определена')
                 , t.ID_ILL, vTarifDetailOwner)) ID_ILL,
           t.pr_own, -- 1, значит пациент застрахован в ХМАО, 2 - пациент застрахован  вдругом регионе
           t.fc_code, -- код тарифа
           t.fn_cost, -- стоимость тарифа
           t.fl_under18,
           t.fk_pacid,
           trunc(t.fd_date1) fd_date1,
           trunc(t.fd_date2) fd_date2,
           t.fl_isds,
           asu.GetStacWorkDayCount(trunc(t.fd_date1), trunc(t.fd_date2), t.fl_isds) DAY_COUNT
--           decode(decode(t.fl_isds, 0, trunc(t.fd_date2) - trunc(t.fd_date1), ASU.PKG_WORKDAYS.workdays_between(trunc(t.fd_date1), trunc(t.fd_date2) + 1)),
--                  0, 1,
--                  decode(t.fl_isds, 0, trunc(t.fd_date2) - trunc(t.fd_date1), ASU.PKG_WORKDAYS.workdays_between(trunc(t.fd_date1), trunc(t.fd_date2) + 1))) DAY_COUNT
      from (select t.id_ill,
                   t.fk_pacid,
                   t.fl_under18,
                   t.fd_date1,
                   t.fd_date2,
                   t.fl_isds,
                   t.pr_own,
                   CASE
                     WHEN t.pr_own = 2 AND max(t.fc_code2) IS NOT NULL THEN
                      max(t.fc_code2)
                     WHEN max(t.fc_code1) IS NOT NULL THEN
                      max(t.fc_code1)
                     ELSE
                      ''
                   END fc_code,
                   CASE
                     WHEN t.pr_own = 2 AND max(t.fc_code2) IS NOT NULL THEN
                      max(t.fn_cost2)
                     WHEN max(t.fc_code1) IS NOT NULL THEN
                      max(t.fn_cost1)
                     ELSE
                      0
                   END fn_cost
              from (select t.id_ill,
                           t.fk_pacid,
                           t.fl_under18,
                           t.fd_date1,
                           t.fd_date2,
                           t.fd_calc,
                           t.fl_isds,
                           t.pr_own,
                           t.fc_code,
                           t.fn_cost,
                           t.st_own,
                           decode(t.st_own, 1, t.Fc_Code, '') fc_code1,
                           decode(t.st_own, 1, t.FN_COST, NULL) fn_cost1,
                           decode(t.st_own, 2, t.Fc_Code, '') fc_code2,
                           decode(t.st_own, 2, t.FN_COST, NULL) fn_cost2
                      from (select distinct -- остаются только последние коды
                                   t.id_ill,
                                   t.fk_pacid,
                                   t.fl_under18,
                                   t.fd_date1,
                                   t.fd_date2,
                                   t.fd_calc,
                                   t.fl_isds,
                                   t.pr_own,
                                   LAST_VALUE(t.fc_code)
                                         OVER(PARTITION BY t.fk_pacid, t.st_own ORDER BY t.fd_date1, t.fn_costid ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fc_code,
                                   LAST_VALUE(t.fn_cost)
                                         OVER(PARTITION BY t.fk_pacid, t.st_own ORDER BY t.fd_date1, t.fn_costid ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fn_cost,
                                   LAST_VALUE(t.st_own)
                                         OVER(PARTITION BY t.fk_pacid, t.st_own ORDER BY t.fd_date1, t.fn_costid ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) st_own
                              from (select t.id_ill,
                                           t.fk_pacid,
                                           case
                                             when TRUNC(MONTHS_BETWEEN(t.fd_date1, tk.fd_rojd) / 12) < 18 then
                                              1
                                             else
                                              0
                                           end fl_under18,
                                           ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(t.Fk_Pacid) fd_date1,
                                           ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(t.Fk_Pacid) fd_date2,
                                           nvl(trunc(t.fd_calc), trunc(t.fd_date2)) fd_calc,
                                           t.fl_isds,
                                           t.pr_own,
                                           ts.fc_code,
                                           sc.fn_cost,
                                           sc.fk_id fn_costid,
                                           case when tsr.code like '%OWN2' then 2 else 1 end st_own
                                      from asu.tsluch_dbf_calc t
                                     -- дневной стационар. Для дневного и обычного стационара разные тарифы
                                     inner join asu.tkarta tk on tk.fk_id = t.fk_pacid
                                     inner join ASU.TSTATCARDVMP vm on vm.fk_id = t.vmp_id
                                      left join (select ar.FC_ASKID, ar.fc_replyid
                                                   from asu.treplytable ar
                                                  where ar.FC_ASK = 'V019_IN_V018_TREE'
                                                    and ar.FC_ASKFIELD = 'FC_CODE'
                                                    and ar.FC_REPLY = 'TSTANDART_VMP'
                                                    and ar.FC_REPLYFIELD = 'FC_CODE') d on d.FC_ASKID = vm.FC_VIDHMP
                                      left join (select ar.FC_ASKID, ar.fc_replyid
                                                   from asu.treplytable ar
                                                  where ar.FC_ASK = 'V019_IN_V018_TREE'
                                                    and ar.FC_ASKFIELD = 'FC_CODE'
                                                    and ar.FC_REPLY = 'TSTANDART_VMP'
                                                    and ar.FC_REPLYFIELD = 'FC_CODE') d2 on d2.FC_ASKID = vm.FC_VIDHMP || '_' || vm.fn_metodhmp
                                     inner join asu.tstandart ts on ts.fc_code = nvl(d2.fc_replyid, d.fc_replyid)
                                     INNER JOIN asu.tstandart_razdel tsr ON tsr.fk_id = ts.fk_razdel
                                     INNER JOIN asu.tstandart_cost sc ON sc.fk_standartid = ts.fk_id
                                     WHERE tsr.code like ('VMP%')
                                       AND ts.fc_code IS NOT NULL
                                       and t.fd_calc BETWEEN sc.FD_DATE1 AND NVL(sc.FD_DATE2, t.fd_calc)
                                       and (aCostFromDate IS NULL OR (aCostFromDate IS NOT NULL AND (SC.FD_DATE2 > aCostFromDate OR SC.FD_DATE2 IS NULL)))
                                       and t.fl_poly = 0
                                       and t.fn_step = 1
                                       and t.vmp_id is not null) t ) t ) t
                               group by t.id_ill,
                                        t.fk_pacid,
                                        t.fl_under18,
                                        t.fd_date1,
                                        t.fd_date2,
                                        t.fl_isds,
                                        t.pr_own ) t
  ) loop
    update asu.tsluch_dbf_calc t
       set t.fn_step    = LAST_STEP,
           t.fc_code    = c.fc_code,
           t.fn_tarif   = c.fn_cost,
           t.fn_cost    = c.fn_cost,
           t.FN_COUNT   = c.DAY_COUNT,
           t.fl_under18 = c.fl_under18,
           t.fd_date1 = c.fd_date1,
           t.fd_date2 = c.fd_date2,
           t.fl_isds = c.fl_isds
     where t.id_ill = c.id_ill;
    -- Все переводы палиативного случая, кроме того на основании которого была сформирована запись исключаются из расчёта
    update asu.tsluch_dbf_calc t set t.fn_step = 0 where t.fk_pacid = c.fk_pacid and t.id_ill <> c.id_ill;
  end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure CalculateByKarta(aCostFromDate DATE, aIsDializOnly Number) is
 begin
  for c in (
    select nvl(t.ID_ILL,
               asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail,
                 'Выбран тариф: Код ' || nvl(t.fc_code, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost), 'не определена') ||
                 decode(t.pr_own, 1, ' Местный случай', ' Межтерриториальный случай') ||
                 decode(t.fl_isds, 0, ' Обычный стационар', ' Дневной стационар') ||
                 decode(t.fl_under18, 1, ' Несовершеннолетний пациент', ' Взрослый пациент (18 и больше лет)') ||
                 ' Маска: ' || t.fc_code_mask ||
                 ' Местный тариф: Код ' || nvl(t.fc_code1, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost1), 'не определена') ||
                 ' Меж.тер. тариф: Код ' || nvl(t.fc_code2, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost2), 'не определена')
                 , t.ID_ILL, vTarifDetailOwner)) ID_ILL,
           t.pr_own, -- 1, значит пациент застрахован в ХМАО, 2 - пациент застрахован  вдругом регионе
           t.fc_code, -- код тарифа
           t.fn_cost, -- стоимость тарифа
           t.fl_under18
      from (SELECT t.ID_ILL,
                   t.fk_uslvidid,
                   t.pr_own, -- 1, значит пациент застрахован в ХМАО, 2 - пациент застрахован в другом регионе
                   CASE
                     WHEN t.pr_own = 2 AND max(t.fc_code2) IS NOT NULL THEN
                      max(t.fc_code2)
                     WHEN max(t.fc_code1) IS NOT NULL THEN
                      max(t.fc_code1)
                     ELSE
                      ''
                   END fc_code, -- код тарифа

                   CASE
                     WHEN t.pr_own = 2 AND max(t.fc_code2) IS NOT NULL THEN
                      max(t.fn_cost2)
                     WHEN max(t.fc_code1) IS NOT NULL THEN
                      max(t.fn_cost1)
                     ELSE
                      0
                   END fn_cost, -- стоимость тарифа -- max(t.fc_code1) fc_code1, max(t.fn_cost1) fn_cost1, max(t.fc_code2) fc_code2, max(t.fn_cost2) fn_cost2,

                   max(t.fl_under18) fl_under18,
                   max(t.fl_isds) fl_isds,

                   max(t.fc_code1) fc_code1,
                   max(t.fn_cost1) fn_cost1,
                   max(t.fc_code2) fc_code2,
                   max(t.fn_cost2) fn_cost2,
                   max(t.fc_code_mask) fc_code_mask
              FROM (SELECT t.id_ill,
                           t.fk_uslvidid,
                           t.pr_own,
--                           decode(t.fk_regionid, ASU.GET_NATIVE_REGION, 1, null, 1, 2) pr_own,
                           s.OWN st_own,
                           decode(s.OWN, 1, s.Fc_Code, '') fc_code1,
                           decode(s.OWN, 1, s.FN_COST, NULL) fn_cost1,
                           decode(s.OWN, 2, s.Fc_Code, '') fc_code2,
                           decode(s.OWN, 2, s.FN_COST, NULL) fn_cost2,
                           t.fl_under18,
                           t.fl_isds,
                           LAST_VALUE(t.id_ill) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_data1, t.id_ill ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_peresel_last,
                           t.id_ill fk_peresel,
                           t.fc_code_mask
--                           decode(tmask_replace.fc_mask_to, null, t.fc_code_mask, tmask_replace.fc_mask_to) fc_code_mask
                      from (select t.*,
                                   tsd.fk_mkb10,
                                   'G.%.' || -- Первая цифра после G определяет тип КСГ (1, 2, 3А и 3В), сейчас всегда 1
--                                   tsd.fk_mkb9 || '.' || -- Класс болезней по МКБ-10 (римские цифры)
                                   '%' || '.' || -- Класс болезней по МКБ-10 (римские цифры)
                                   '%' || -- уровень МО (1- первый, 2 – второй), считатется что может быть любым, так как на самом деле это определяется в момент заливки тарифов
                                   decode(t.fl_isds, 1, '2', '1') || '.' || -- условия оказания медицинской помощи (1- стационар, 2 - дневной стационар)
                                   decode(t.fl_under18, 1, '1', '2') || -- возрастная категория (1 –дети, 2 – взрослые);
                                   t.fc_oper || '.' || -- метод лечения (1 – оперативный, 2 – консервативный)
                                   decode(t.FN_DIALIZ_SMID,
                                          vSmid_GEMODIALIZ_PERIT, '13',
                                          decode(t.fk_koykavidid,
                                                 asu.get_tiproom_hemodial, '12',
                                                 asu.get_tiproom_hemodial_pr, '13',
                                                 '%')) fc_code_mask -- номер по порядку
                              from (select t.id_ill,
                                           t.pr_own,
--                                           t.fk_regionid,
                                           t.fk_pacid,
                                           t.fk_peplid,
                                           case
                                             when TRUNC(MONTHS_BETWEEN(t.fd_date1, tk.fd_rojd) / 12) < 18 then
                                              1
                                             else
                                              0
                                           end fl_under18,
                                           t.fk_uslvidid,
                                           t.fk_koykavidid,
                                           ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(t.Fk_Pacid) fd_data1,
                                           ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(t.Fk_Pacid) fd_data2,
                                           --                         decode(ASU.GET_IS_OPER_IN_TIME(t.fk_pacid, ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(t.Fk_Pacid), ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(t.Fk_Pacid)), 1, '1', '2') fc_oper,
                                           decode(t.FK_OPERNAZ, null, '2', '1') fc_oper,
                                           t.fd_date1,
                                           nvl(trunc(t.fd_calc), trunc(t.fd_date2)) fd_calc,
                                           t.fk_smid,
                                           t.fl_isds,
                                           t.FN_DIALIZ_SMID
                                      from asu.tsluch_dbf_calc t
                                     -- дневной стационар. Для дневного и обычного стационара разные тарифы
                                     inner join asu.tkarta tk on tk.fk_id = t.fk_pacid
                                     where t.fl_poly = 0
                                       and t.fn_step = 1
                                       and t.vmp_id is null
                                    ) t
--                              left join (SELECT tu.FK_ID FROM ASU.TUSLVID_DS tu) tu_ds on tu_ds.fk_id = t.fk_uslvidid --!
                             inner join asu.tsmid tsd on tsd.fk_id = t.fk_smid) t
/*
                       left join (select r.fc_askID fc_mask_from, r.fc_replyId fc_mask_to
                                    from asu.treplytable r
                                   where r.fc_ask = 'ASU.TSTAC_CALC_KSG_MASK'
                                     and r.fc_askfield = 'FC_MASK'
                                     and r.fc_reply = 'TSTAC_CALC_KSG_MASK_REPLACE'
                                     and r.fc_replyfield = 'FC_MASK') tmask_replace on tmask_replace.fc_mask_from = t.fc_code_mask
*/
                    -- определение тарифа в зависимости от диагноза, даты начала и окончания случая и дополнительных параметров, влияющих на код тарифа
                       left join (SELECT icd.fc_kod fc_kod, -- https://tg.samozapis.ru:15001/redmine/issues/32423 пункт 1 Теперь диагноз берётся с учётом спецсимволов типа + (раньше было http://192.168.1.9/redmine/issues/24431 20130621 Efimov V.A. По предложению Вики Нероновой код диагноза берётся без учёта дополнительных символов, например +)
                                        s.fc_code,
                                        MAX(SC.FN_COST) FN_COST,
                                        SC.FD_DATE1,
                                        SC.FD_DATE2,
                                        dt.FD_DATE1 FD_DATE1_DT,
                                        dt.FD_DATE2 FD_DATE2_DT,
                                        tsr.Code,
                                        decode(substr(tsr.Code, length(tsr.Code) - 3, length(tsr.Code)), 'OWN2', 2, 1) own
                                   FROM asu.Tstandart s
                                  inner join asu.Tstandart_icd10 i on I.FK_STANDART = S.FK_ID
                                   LEFT JOIN ASU.Tstandart_Icd10_Dt dt ON dt.fk_standart_icd10 = i.fk_id
                                  inner join asu.Ticd10 icd on icd.fk_id = i.fk_icd10
                                  inner join asu.TSTANDART_COST SC on SC.FK_STANDARTID = S.FK_ID
                                  inner join asu.tstandart_razdel tsr on tsr.fk_id = s.fk_razdel
                                  where tsr.fc_synonym like ('KSG%') and SC.FN_COST > 0
                                    and (aCostFromDate is null or (aCostFromDate is not null and (SC.FD_DATE2 > aCostFromDate or SC.FD_DATE2 IS NULL)))
                                    and (aCostFromDate is null
                                         or (aCostFromDate is not null
                                             and (dt.FD_DATE2 > aCostFromDate
                                                  or dt.FD_DATE2 IS NULL)))
                                  group by icd.fc_kod, SC.FD_DATE1, SC.FD_DATE2, dt.FD_DATE1, dt.FD_DATE2, tsr.Code, s.fc_code, tsr.fc_synonym) s
                                     on s.fc_kod = t.fk_mkb10 -- На этом этапе tu.KOD_EO это диагноз относящийся к переводу
                                    and t.fd_calc BETWEEN s.FD_DATE1 AND NVL(s.FD_DATE2, t.fd_calc)
                                    and (s.FD_DATE1_DT is null or (s.FD_DATE1_DT is not null and t.fd_calc BETWEEN s.FD_DATE1_DT AND NVL(s.FD_DATE2_DT, t.fd_calc)))
                                    and s.Fc_Code like t.fc_code_mask -- decode(tmask_replace.fc_mask_to, null, t.fc_code_mask, tmask_replace.fc_mask_to) -- номер по порядку
                    ) t
             where ((aIsDializOnly = 0 and asu.GET_EXCH79_USE_DIALIZ_LIST = 0 and t.fk_peresel_last = t.fk_peresel)
                    or (asu.GET_EXCH79_USE_DIALIZ_LIST = 1
                        and ((t.fk_uslvidid = asu.doc_dializ)
                             or (aIsDializOnly = 0 and t.fk_uslvidid <> asu.doc_dializ and t.fk_peresel_last = t.fk_peresel))))
             group by t.ID_ILL, t.pr_own, t.fk_uslvidid) t) loop
    update asu.tsluch_dbf_calc t set t.fn_step = LAST_STEP, t.fc_code = c.fc_code, t.fn_tarif = c.fn_cost, t.fn_cost = c.fn_cost, t.FN_COUNT = 1, t.fl_under18 = c.fl_under18 where t.id_ill = c.id_ill;
  end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure CalculateHMAO(aCostFromDate DATE) is
   vpacid number;
   vdate1 date;
 begin
   -- Если в рамках одной карты есть и пребывание в отделение патологии беременных и пребывание в родильном отделении,
   -- то выгружается только родильное отделение с датой начала равной дате госпитализации и окончания - выписки.
   for c in (select ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(r.Fk_Pacid) fd_date1,
                    ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(r.Fk_Pacid) fd_date2,
                    r.fk_pacid,
                    nvl(r.id_ill,
                      asu.PKG_TARIFDETAIL.AddPeresel(
                        vUSE_TarifDetail,
                        'Перевод в родильное отделение, после отделения паталогии беременных, дата начала и окончания устанавливаются равными дате госпитализации и выписки',
                        r.id_ill,
                        vTarifDetailOwner)) id_ill
               from (select c.fk_pacid, max(c.fd_date1) fd_date1
                       from asu.tsluch_dbf_calc c
                      inner join login.totdel tod on tod.fk_id = c.fk_otdelid
                      where tod.fk_id = asu.GET_PRAGN_PATHOLOGY_OTD
                        and c.fl_poly = 0
                        AND c.fn_step = 1
                        and c.VMP_ID is null
                        and (asu.GET_EXCH79_USE_DIALIZ_LIST = 0 or (asu.GET_EXCH79_USE_DIALIZ_LIST = 1 and c.fk_uslvidid <> asu.doc_dializ))
                        AND c.type_v_mu <> vSmid_TYPE_V_MU_PALLIATIV
                      group by c.fk_pacid, tod.fk_id
                      order by c.fk_pacid, tod.fk_id) p
              inner join (select c.fk_pacid, max(c.id_ill) id_ill
                            from asu.tsluch_dbf_calc c
                           inner join login.totdel tod on tod.fk_id = c.fk_otdelid
                           where tod.fk_id = asu.get_rodotdel
                           group by c.fk_pacid, tod.fk_id
                           order by c.fk_pacid, tod.fk_id) r on r.fk_pacid = p.fk_pacid)
   loop
     update asu.tsluch_dbf_calc s set s.fd_date1 = c.fd_date1, s.fd_date2 = c.fd_date2 where s.id_ill = c.id_ill;
     for d in (select nvl(s.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Перевод удалён, так, это отделение паралогии с последующим переводом в родильное, что считается одним случаем в родильном', s.id_ill, vTarifDetailOwner)) id_ill
                 from asu.tsluch_dbf_calc s
                where s.fk_pacid = c.fk_pacid and s.id_ill <> c.id_ill)
     loop
       delete from asu.tsluch_dbf_calc s where s.id_ill = d.id_ill;
     end loop;
   end loop;

   -- Все переводы сгруппированы по отделу.
   -- Для каждого пациента выбирается последний т.е. (первый с конца) отдел и соответствующий перевод добавляется в список итоговых переводов,
   -- Далее выбирается второй с конца отдел, дата перевода в который меньше даты перевода первого выбранного.
   -- Далее выбирается следующий с конца, дата перевода в который меньше даты перевода в отдел выбранный на предыдущем шаге.
   -- Таким образом исключаются переводы заключённые между двумя переводами с одинаковыми диагнозами.
   vpacid := 0;
   vdate1 := to_date('01.01.1900', 'dd.mm.yyyy');
   for c in (select t.id_ill,
                    t.fk_pacid,
                    CASE
                      WHEN nvl(lag(t.id_ill_last) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_date1), 0) = 0 OR
                           t.id_ill_last =
                           nvl(lag(t.id_ill_last) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_date1), 0) THEN
                       t.fd_date1
                      ELSE
                       lag(t.fd_date2) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_date1)
                    END fd_date1
               from (SELECT t.id_ill,
                            t.fk_pacid,
                            first_VALUE(t.fd_date1) OVER(PARTITION BY t.fk_pacid, t.fk_otdelid ORDER BY t.fd_date1 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fd_date1,
                            LAST_VALUE(t.fd_date2) OVER(PARTITION BY t.fk_pacid, t.fk_otdelid ORDER BY t.fd_date1 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fd_date2,
                            LAST_VALUE(t.id_ill) OVER(PARTITION BY t.fk_pacid, t.fk_otdelid ORDER BY t.fd_date1 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) id_ill_last
                       FROM asu.tsluch_dbf_calc t
                      WHERE t.fl_poly = 0
                        AND t.fn_step = 1
                        and t.vmp_id is null
                        and t.fk_otdelid is not null
                        AND t.type_v_mu <> vSmid_TYPE_V_MU_PALLIATIV
                        and (asu.GET_EXCH79_USE_DIALIZ_LIST = 0 or (asu.GET_EXCH79_USE_DIALIZ_LIST = 1 and t.fk_uslvidid <> asu.doc_dializ))) t
              where t.id_ill = t.id_ill_last
              order by t.fk_pacid, t.fd_date2 desc)
   loop
     if (vpacid <> c.fk_pacid) or (vpacid = c.fk_pacid and c.fd_date1 < vdate1) then
       -- Выбрали первый с конца отдел для текущего пациента,
       -- или очередной отдел, для текущего пациента, с датой начала меньше чем у предыдущего, для того же пациента
       -- Добавляем соответсвующий перевод в список итоговых переводов (т.е. он переходит для обработки на следующем шаге fn_step = 2)
       update asu.tsluch_dbf_calc set fn_step = 2, fd_date1 = c.fd_date1 where id_ill = c.id_ill;
       vUSE_TarifDetail := asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Перевод добавлен в список итоговых по отделам', c.id_ill, vTarifDetailOwner);

       vpacid := c.fk_pacid;
       vdate1 := c.fd_date1;
     else
       vUSE_TarifDetail := asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Перевод не попадает в список итоговых по отделам, т.к. есть более поздний перевод, относящийся к тому же отделу', c.id_ill, vTarifDetailOwner);
     end if;
   end loop;

-- http://192.168.1.9/redmine/issues/23712 20130508 По предложению Маши группировка по КСГ не производится вместо неё используется группировка по диагнозу с последующим перерасчётом
   vpacid := 0;
   vdate1 := to_date('01.01.1900', 'dd.mm.yyyy');
   for c in (select t.id_ill,
                    t.fk_pacid,
                    CASE
                      WHEN nvl(lag(t.id_ill_last) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_date1), 0) = 0 OR
                           t.id_ill_last =
                           nvl(lag(t.id_ill_last) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_date1), 0) THEN
                       t.fd_date1
                      ELSE
                       lag(t.fd_date2) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_date1)
                    END fd_date1
               from (SELECT t.id_ill,
                            t.fk_pacid,
                            first_VALUE(t.fd_date1) OVER(PARTITION BY t.fk_pacid, t.fc_icd ORDER BY t.fd_date1 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fd_date1,
                            LAST_VALUE(t.fd_date2) OVER(PARTITION BY t.fk_pacid, t.fc_icd ORDER BY t.fd_date1 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fd_date2,
                            LAST_VALUE(t.id_ill) OVER(PARTITION BY t.fk_pacid, t.fc_icd ORDER BY t.fd_date1 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) id_ill_last
                       from (select t.id_ill, t.fk_pacid, t.fd_date1, t.fd_date2,
                                    decode(tod.fk_ownerid, asu.GET_NOVOROGDOTD, substr(t.fc_icd, 1, 1), t.fc_icd) fc_icd -- https://tg.samozapis.ru:15001/redmine/issues/31994 для отделений относящихся к ветке "Отделение новорожденных" группировко происходит не по диагнозу, а по нозологии, т.е. по букве диагноза
                               FROM asu.tsluch_dbf_calc t
                               left join login.totdel tod on tod.fk_id = t.fk_otdelid
                              WHERE t.fl_poly = 0
                                AND t.fn_step = 2
                                AND t.type_v_mu <> vSmid_TYPE_V_MU_PALLIATIV
                                and (asu.GET_EXCH79_USE_DIALIZ_LIST = 0 or (asu.GET_EXCH79_USE_DIALIZ_LIST = 1 and t.fk_uslvidid <> asu.doc_dializ))) t) t
              where t.id_ill = t.id_ill_last
              order by t.fk_pacid, t.fd_date2 desc)
   loop
     if (vpacid <> c.fk_pacid) or (vpacid = c.fk_pacid and c.fd_date1 < vdate1) then
       -- Выбрали первый с конца диагноз для текущего пациента,
       -- или очередной диагноз, для текущего пациента, с датой начала меньше чем у предыдущего, для того же пациента
       -- Добавляем соответсвующий перевод в список итоговых переводов (т.е. он переходит для обработки на следующем шаге fn_step = 3)
       update asu.tsluch_dbf_calc set fn_step = 3, fd_date1 = c.fd_date1 where id_ill = c.id_ill;
       vUSE_TarifDetail := asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Перевод добавлен в список итоговых по диагнозу', c.id_ill, vTarifDetailOwner);

       vpacid := c.fk_pacid;
       vdate1 := c.fd_date1;
--       update asu.tsluch_dbf_calc set fn_step = 2 where id_ill = c.id_ill;
     else
       vUSE_TarifDetail := asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Перевод не попадает в список итоговых по диагнозу, т.к. есть более поздний перевод с тем же диагнозом', c.id_ill, vTarifDetailOwner);
     end if;
   end loop;

   FillOper(3);

   for c in (
     select nvl(t.ID_ILL,
                asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail,
                  'Выбран тариф: Код ' || nvl(t.fc_code, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost), 'не определена') ||
                  decode(t.pr_own, 1, ' Местный случай', ' Межтерриториальный случай') ||
                  decode(t.fl_isds, 0, ' Обычный стационар', ' Дневной стационар') ||
                  decode(t.fl_under18, 1, ' Несовершеннолетний пациент', ' Взрослый пациент (18 и больше лет)') ||
                  ' Маска: ' || t.fc_code_mask ||
                  ' Местный тариф: Код ' || nvl(t.fc_code1, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost1), 'не определена') ||
                  ' Меж.тер. тариф: Код ' || nvl(t.fc_code2, 'не определён') || ' стоимость ' || nvl(to_char(t.fn_cost2), 'не определена')
                  , t.ID_ILL, vTarifDetailOwner)) ID_ILL,
            t.pr_own, -- 1, значит пациент застрахован в ХМАО, 2 - пациент застрахован  вдругом регионе
            t.fc_code, -- код тарифа
            t.fn_cost, -- стоимость тарифа
            t.fl_under18--,
--            t.fl_isds
       from (SELECT t.id_ill,
                    t.pr_own, -- 1, значит пациент застрахован в ХМАО, 2 - пациент застрахован  вдругом регионе
                    CASE
                      WHEN t.pr_own = 2 AND max(t.fc_code2) IS NOT NULL THEN
                       max(t.fc_code2)
                      WHEN max(t.fc_code1) IS NOT NULL THEN
                       max(t.fc_code1)
                      ELSE
                       ''
                    END fc_code, -- код тарифа
                    CASE
                      WHEN t.pr_own = 2 AND max(t.fc_code2) IS NOT NULL THEN
                       max(t.fn_cost2)
                      WHEN max(t.fc_code1) IS NOT NULL THEN
                       max(t.fn_cost1)
                      ELSE
                       0
                    END fn_cost, -- стоимость тарифа -- max(t.fc_code1) fc_code1, max(t.fn_cost1) fn_cost1, max(t.fc_code2) fc_code2, max(t.fn_cost2) fn_cost2,

                    max(t.fl_under18) fl_under18,
                    max(t.fl_isds) fl_isds,
                    MAX(t.fc_code_mask) fc_code_mask,

                    max(t.fc_code1) fc_code1,
                    max(t.fn_cost1) fn_cost1,
                    max(t.fc_code2) fc_code2,
                    max(t.fn_cost2) fn_cost2
              FROM (SELECT t.id_ill,
                           t.pr_own,
                           s.OWN st_own,
                           decode(s.OWN, 1, s.Fc_Code, '') fc_code1,
                           decode(s.OWN, 1, s.FN_COST, NULL) fn_cost1,
                           decode(s.OWN, 2, s.Fc_Code, '') fc_code2,
                           decode(s.OWN, 2, s.FN_COST, NULL) fn_cost2,
                           t.fl_under18,
                           t.fl_isds,
                           t.fc_code_mask
--                           decode(tmask_replace.fc_mask_to, null, t.fc_code_mask, tmask_replace.fc_mask_to) fc_code_mask
                      from (select t.*,
                                   'G.%.' || -- Первая цифра после G определяет тип КСГ (1, 2, 3А и 3В), сейчас всегда 1
--                                   t.fc_class || '.' || -- Класс болезней по МКБ-10 (римские цифры)
                                   '%' || '.' || -- Класс болезней по МКБ-10 (римские цифры)
                                   '%' || -- уровень МО (1- первый, 2 – второй), считатется что может быть любым, так как на самом деле это определяется в момент заливки тарифов
                                   decode(t.fl_isds, 1, '2', '1') || '.' || -- условия оказания медицинской помощи (1- стационар, 2 - дневной стационар)
                                   decode(t.fl_under18, 1, '1', '2') || -- возрастная категория (1 –дети, 2 – взрослые);
                                   t.fc_oper || '.' || -- метод лечения (1 – оперативный, 2 – консервативный)
                                   decode(t.FN_DIALIZ_SMID,
                                          vSmid_GEMODIALIZ_PERIT, '13',
                                          decode(t.fk_koykavidid,
                                                 asu.get_tiproom_hemodial, '12',
                                                 asu.get_tiproom_hemodial_pr, '13',
                                                 '%')) fc_code_mask -- номер по порядку
                              from (select t.id_ill,
                                           t.pr_own,
--                                           t.fk_regionid,
                                           t.fk_pacid,
                                           t.fk_peplid,
                                           case
                                             when TRUNC(MONTHS_BETWEEN(t.fd_date1, tk.fd_rojd) / 12) < 18 then
                                              1
                                             else
                                              0
                                           end fl_under18,
                                           t.fk_uslvidid,
                                           t.fk_koykavidid,
                                           decode(t.FK_OPERNAZ, null, '2', '1') fc_oper,
                                           nvl(trunc(t.fd_calc), trunc(t.fd_date2)) fd_calc,
                                           tpd.fc_code,
                                           tpd.fc_class,
                                           t.fl_isds,
                                           t.FN_DIALIZ_SMID
                                      from asu.tsluch_dbf_calc t
                                     inner join asu.tperesel_diag tpd on tpd.fk_peresel = t.id_ill
                                     inner join asu.tkarta tk on tk.fk_id = t.fk_pacid
                                     where t.fl_poly = 0
                                       and t.fn_step = 3
                                       AND t.type_v_mu <> vSmid_TYPE_V_MU_PALLIATIV
                                       and (asu.GET_EXCH79_USE_DIALIZ_LIST = 0 or (asu.GET_EXCH79_USE_DIALIZ_LIST = 1 and t.fk_uslvidid <> asu.doc_dializ))
                                    ) t
                              -- дневной стационар. Для дневного и обычного стационара разные тарифы
--                              left join (SELECT tu.FK_ID FROM ASU.TUSLVID_DS tu) tu_ds on tu_ds.fk_id = t.fk_uslvidid
                                ) t
/*
                       left join (select r.fc_askID fc_mask_from, r.fc_replyId fc_mask_to
                                    from asu.treplytable r
                                   where r.fc_ask = 'ASU.TSTAC_CALC_KSG_MASK'
                                     and r.fc_askfield = 'FC_MASK'
                                     and r.fc_reply = 'TSTAC_CALC_KSG_MASK_REPLACE'
                                     and r.fc_replyfield = 'FC_MASK') tmask_replace on tmask_replace.fc_mask_from = t.fc_code_mask
*/
                       -- определение тарифа в зависимости от диагноза, даты начала и окончания случая и дополнительных параметров, влияющих на код тарифа
                       left join (SELECT icd.fc_kod fc_kod, -- https://tg.samozapis.ru:15001/redmine/issues/32423 пункт 1 Теперь диагноз берётся с учётом спецсимволов типа + (раньше было http://192.168.1.9/redmine/issues/24431 20130621 Efimov V.A. По предложению Вики Нероновой код диагноза берётся без учёта дополнительных символов, например +)
                                        s.fc_code,
                                        MAX(SC.FN_COST) FN_COST,
                                        SC.FD_DATE1,
                                        SC.FD_DATE2,
                                        dt.FD_DATE1 FD_DATE1_DT,
                                        dt.FD_DATE2 FD_DATE2_DT,
                                        tsr.Code,
                                        decode(substr(tsr.Code, length(tsr.Code) - 3, length(tsr.Code)), 'OWN2', 2, 1) own
                                   FROM asu.Tstandart s
                                  inner join asu.Tstandart_icd10 i on I.FK_STANDART = S.FK_ID
                                   LEFT JOIN ASU.Tstandart_Icd10_Dt dt ON dt.fk_standart_icd10 = i.fk_id
                                  inner join asu.Ticd10 icd on icd.fk_id = i.fk_icd10
                                  inner join asu.TSTANDART_COST SC on SC.FK_STANDARTID = S.FK_ID
                                  inner join asu.tstandart_razdel tsr on tsr.fk_id = s.fk_razdel
                                  where tsr.fc_synonym like ('KSG%') and SC.FN_COST > 0
                                    and (aCostFromDate is null
                                         or (aCostFromDate is not null
                                             and (SC.FD_DATE2 > aCostFromDate
                                                  or SC.FD_DATE2 IS NULL)))
                                    and (aCostFromDate is null
                                         or (aCostFromDate is not null
                                             and (dt.FD_DATE2 > aCostFromDate
                                                  or dt.FD_DATE2 IS NULL)))
                                  group by icd.fc_kod, SC.FD_DATE1, SC.FD_DATE2, dt.FD_DATE1, dt.FD_DATE2, tsr.Code, s.fc_code, tsr.fc_synonym) s
                                     on s.fc_kod = t.Fc_Code -- На этом этапе tu.KOD_EO это диагноз относящийся к переводу
                                    and t.fd_calc BETWEEN s.FD_DATE1 AND NVL(s.FD_DATE2, t.fd_calc)
                                    and (s.FD_DATE1_DT is null or (s.FD_DATE1_DT is not null and t.fd_calc BETWEEN s.FD_DATE1_DT AND NVL(s.FD_DATE2_DT, t.fd_calc)))
                                    and s.Fc_Code like t.fc_code_mask -- decode(tmask_replace.fc_mask_to, null, t.fc_code_mask, tmask_replace.fc_mask_to) -- номер по порядку
                     ) t
              group by t.id_ill, t.pr_own) t)
   loop
     update asu.tsluch_dbf_calc t set t.fn_step = LAST_STEP, t.fc_code = c.fc_code, t.fn_tarif = c.fn_cost, t.fn_cost = c.fn_cost, t.FN_COUNT = 1, t.fl_under18 = c.fl_under18 where t.id_ill = c.id_ill;
   end loop;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE FillDializCount(aStep NUMBER) IS
 begin
  if asu.GET_EXCH79_USE_DIALIZ_LIST = 1 then
    for c in (select t.id_ill, ds.fn_count
                from asu.tsluch_dbf_calc t
               inner join asu.vdializ_stat ds on ds.fk_id = t.id_ill
               where t.fk_uslvidid = asu.doc_dializ
                 and t.fl_poly = 0
                 and t.fn_step = aStep)
    loop
      update asu.tsluch_dbf_calc s set s.fn_count = c.fn_count, s.fn_cost = s.fn_cost * c.fn_count where s.id_ill = c.id_ill;
    end loop;
  else
    -- Для гемодиализа кол-во зависит от назначений
    for c in (select t.id_ill, count(*) fn_count
                from asu.tsluch_dbf_calc t
               INNER JOIN ASU.TPERESEL TP ON TP.FK_ID = t.id_ill
               INNER JOIN ASU.VNAZ N ON N.Fk_Pacid = tp.fk_pacid
               inner join (SELECT FK_ID
                             FROM asu.TSMID
                          CONNECT BY PRIOR FK_ID = FK_OWNER
                            START WITH FK_ID = ASU.GET_SMID_HEMODIAL_ROOT) sl on sl.fk_id = N.fk_smid
               where t.fl_isds = 1
                 and t.fl_poly = 0
                 and t.fn_step = aStep
                 and n.FK_NAZSOSID = ASU.GET_VYPNAZSOSID
--                 AND N.FK_SMID in (asu.get_smid_hemodial, asu.get_smid_hemodial_pr) -- на хантах get_smid_hemodial = 1004176
                 and t.fc_icd = 'N18.0'
               group by t.id_ill)
    loop
      update asu.tsluch_dbf_calc s set s.fn_count = c.fn_count, s.fn_cost = s.fn_cost * c.fn_count where s.id_ill = c.id_ill;
    end loop;
  end if;
 end;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE CalculateByKoykavidid(aCostFromDate DATE) IS
 begin
  for c in (
    SELECT t.id_ill, t.id_ill_u, t.p_id_ill, t.fc_code, t.fn_daycount, t.fn_cost, t.fn_sum
      FROM (SELECT s.id_ill,
                   s.id_ill_u,
                   s.p_id_ill,
                   s.fc_razdsyn,
                   c.fc_synonym,
                   decode(s.fc_razdsyn, c.fc_synonym, 1, 0),
                   c.fk_cost,
                   c.fc_code,
                   c.fn_cost,
                   case when s.FN_DAYCOUNT < 1 then 1 else s.FN_DAYCOUNT end FN_DAYCOUNT,
                   case when s.FN_DAYCOUNT < 1 then c.fn_cost else s.FN_DAYCOUNT * c.fn_cost end fn_sum,
                   LAST_VALUE(c.fk_cost) OVER(PARTITION BY s.id_ill ORDER BY decode(s.fc_razdsyn, c.fc_synonym, 1, 0) ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_cost_last
              FROM (select s.Id_Ill,
                           s.id_ill_u,
                           s.p_id_ill,
                           decode(tu_ds.FK_ID, null, 'ROOMTIPTARIF_ST', 'ROOMTIPTARIF_ST_DS') fc_RazdSyn1,
                           decode(tu_ds.FK_ID, null, 'TIPTARIF_ST_OWN2', 'TIPTARIF_ST_DS_OWN2') fc_RazdSyn2,
                           decode(s.pr_own,
                                  1,
                                  decode(tu_ds.FK_ID, null, 'ROOMTIPTARIF_ST', 'ROOMTIPTARIF_ST_DS'),
                                  decode(tu_ds.FK_ID, null, 'TIPTARIF_ST_OWN2', 'TIPTARIF_ST_DS_OWN2')) fc_RazdSyn,
                           decode(tu_ds.FK_ID, null, 0, 1) fl_is_ds,
                           s.fk_koykavidid,
                           CASE
                             WHEN nvl(TRUNC(MONTHS_BETWEEN(s.fd_date1, tk.fd_rojd) / 12), 0) < 18 THEN
                              '%D%'
                             ELSE
                              '%V%'
                           END fc_code_mask,

                           asu.GetStacWorkDayCount(trunc(s.fd_date1), trunc(s.fd_date2), decode(tu_ds.FK_ID, null, 0, 1)) FN_DAYCOUNT,
--                           decode(tu_ds.FK_ID, null, trunc(s.fd_date2) - trunc(s.fd_date1), -- стационар
--                                                     ASU.PKG_WORKDAYS.workdays_between(trunc(s.fd_date2), trunc(s.fd_date1)+1) -- дневной стационар
--                                 ) FN_DAYCOUNT,
                           trunc(s.fd_date2) fd_date2
                      from asu.tkarta tk
                     INNER JOIN asu.tsluch_dbf_calc s ON s.fk_pacid = tk.fk_id
                      left join ASU.TUSLVID_DS tu_ds on tu_ds.fk_id = tk.fk_uslvidid
                    ) s
              LEFT JOIN (SELECT tstr.fk_tiproom, tsr.fc_synonym, ts.fc_code, sc.FD_DATE1, sc.FD_DATE2, sc.fn_cost, sc.fk_id fk_cost
                           FROM asu.TSTANDART_TIPROOM tstr
                          INNER JOIN asu.tstandart ts ON ts.fk_id = tstr.fk_standart
                          INNER JOIN asu.tstandart_razdel tsr ON tsr.fk_id = ts.fk_razdel
                           LEFT JOIN asu.TSTANDART_COST SC ON SC.FK_STANDARTID = TS.FK_ID
                          where (aCostFromDate is null or (aCostFromDate is not null and (SC.FD_DATE2 > aCostFromDate or SC.FD_DATE2 IS NULL)))
                          GROUP BY tstr.fk_tiproom, tsr.fc_synonym, ts.fc_code, sc.FD_DATE1, sc.FD_DATE2, sc.fn_cost, tsr.fc_name, sc.fk_id) c
                             ON c.fk_tiproom = s.fk_koykavidid
                            and (c.fc_synonym = s.fc_RazdSyn1 OR c.fc_synonym = s.fc_RazdSyn2)
                            and c.fc_code like s.fc_code_mask
                            AND s.fd_date2 BETWEEN c.FD_DATE1 AND NVL(c.FD_DATE2, s.fd_date2)) t
     WHERE t.fk_cost = t.fk_cost_last)
   loop
     update asu.tsluch_dbf_calc s
        set s.fc_code_by_kv = c.fc_code, s.FN_COUNT = c.FN_DAYCOUNT, s.FN_COST_BY_KV = c.FN_COST, s.FN_SUM_BY_KV = c.FN_SUM
      where s.id_ill = c.id_ill;
   end loop;
 END;

------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
 PROCEDURE FILL_CACHE IS
  pragma autonomous_transaction;
  BEGIN
   delete from ASU.TUSLVID_DS tu;
   insert into ASU.TUSLVID_DS
   SELECT tu.FK_ID FROM ASU.TUSLVID tu CONNECT BY PRIOR tu.FK_ID = tu.FK_OWNERID START WITH tu.FK_ID = ASU.DOC_IB_DSROOT;

   delete from ASU.TSMID_OPER;
   insert into ASU.TSMID_OPER(FK_ID)
   Select ts.fk_id
     from asu.tsmid ts
    where (fl_del <> 1 or fl_del is null)
      and ts.fc_synonim in ('KONS_PROTHOPER', 'RENTGENXIR_OPER', 'ABORT', 'UROLOG_OPER');

  commit;
 END;

------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
 PROCEDURE CorrectLessDayPeresel(aStep NUMBER) IS
  vIsSluchCheck NUMBER;
 BEGIN
  -- Для каждого перевода длиной меньше суток ищем последующи перевод длиной больше суток и присоединяем тот что меньше суток к тому что больше суток
  -- (т.е. дата начала, того перевода, что больше, устанавливается равной дате начала того перевода что меньше, а тот перевод что меньше удаляется.)
  -- Если не удалось найти последующий перевод больше суток, то ищется предыдущий и перевод меньше сеток присоединяется к нему.
  -- Если в случае только один перевод меньше суток и других нет, то никакие манипуляции не производятся.
  FOR c IN (SELECT *
              FROM asu.tsluch_dbf_calc ts
             WHERE ts.fl_isds = 0
               and ts.fn_step = aStep
               AND ts.type_v_mu <> vSmid_TYPE_V_MU_PALLIATIV
               AND ts.fk_uslvidid <> asu.doc_dializ
               AND ts.fd_date2 - ts.fd_date1 < 1
             ORDER BY ts.fk_pacid)
  LOOP
    vIsSluchCheck := 0;
    FOR c2 IN (SELECT *
                 FROM (SELECT *
                         FROM asu.tsluch_dbf_calc ts
                        WHERE ts.fl_isds = 0
                          and ts.fn_step = aStep
                          AND ts.type_v_mu <> vSmid_TYPE_V_MU_PALLIATIV
                          AND ts.fk_uslvidid <> asu.doc_dializ
                          AND ts.fd_date2 - ts.fd_date1 >= 1
                          AND ts.fk_pacid = c.fk_pacid
                          AND ts.fd_date1 > c.fd_date1
                        ORDER BY ts.fd_date1)
                WHERE ROWNUM = 1)
    LOOP
      UPDATE asu.tsluch_dbf_calc ts SET ts.fd_date1 = c.fd_date1 WHERE ts.id_ill = c2.Id_Ill;
      UPDATE asu.tsluch_dbf_calc ts SET ts.fn_step = -1 WHERE ts.id_ill = c.Id_Ill;
      vIsSluchCheck := 1;
    END LOOP;

    IF vIsSluchCheck = 0 THEN
      FOR c2 IN (SELECT *
                   FROM (SELECT *
                           FROM asu.tsluch_dbf_calc ts
                          WHERE ts.fl_isds = 0
                            and ts.fn_step = aStep
                            AND ts.type_v_mu <> vSmid_TYPE_V_MU_PALLIATIV
                            AND ts.fk_uslvidid <> asu.doc_dializ
                            AND ts.fd_date2 - ts.fd_date1 >= 1
                            AND ts.fk_pacid = c.fk_pacid
                            AND ts.fd_date1 < c.fd_date1
                          ORDER BY ts.fd_date1)
                  WHERE ROWNUM = 1)
      LOOP
        UPDATE asu.tsluch_dbf_calc ts SET ts.fd_date2 = c.fd_date2 WHERE ts.id_ill = c2.Id_Ill;
        UPDATE asu.tsluch_dbf_calc ts SET ts.fn_step = -1 WHERE ts.id_ill = c.Id_Ill;
        vIsSluchCheck := 1;
      END LOOP;
    END IF;
  END LOOP;

  DELETE FROM asu.tsluch_dbf_calc ts WHERE ts.fn_step = -1;
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 PROCEDURE Calculate(pOMS_ONLY NUMBER default 1,
                     pOWN NUMBER default 0,
                     pFILL_CACHE NUMBER default 1,
                     pUseTarifDetail Number default 0,
                     pTarifDetailOwner Varchar2 default '',
                     pDelNoTarifUsl Number default 1,
                     aCostFromDate DATE default null,
                     aUseSetDatesByKarta Number default 1,
                     aFill_type_v_mu Number default 1,
                     aFillVMP Number default 1,
                     aFill_Peresel_paliativ Number default 1) IS
   vti_type_v_mu_smid NUMBER;
   vOperIsCalc NUMBER;
   vBeg Date;
   vEnd Date;
 BEGIN
   vOperIsCalc := 0;

   vUSE_TarifDetail := pUseTarifDetail;
   vTarifDetailOwner := pTarifDetailOwner;
   vDelNoTarifUsl := pDelNoTarifUsl;

   SELECT nvl(max(ts.fk_id), -1) into vSmid_TYPE_V_MU_PALLIATIV FROM asu.tsmid ts WHERE ts.fc_synonim = 'TYPE_V_MU_PALLIATIV';
   SELECT nvl(max(ts.fk_id), -1) into vSmid_GEMODIALIZ_PERIT FROM asu.tsmid ts WHERE ts.fc_synonim = 'GEMODIALIZ_PERIT';

   select min(t.fd_date1), max(t.fd_date1) into vBeg, vEnd from asu.tsluch_dbf_calc t;

   if aFill_Peresel_paliativ = 1 and asu.EXCH79_PALIATIVE_LONG_KART = 1 then
     asu.Fill_Peresel_paliativ(vBeg, vEnd);
   end if;

   if aFillVMP = 1 then
     for c in (select t.id_ill, vm.fk_id vmp_id
                 from asu.tsluch_dbf_calc t
                inner join ASU.TSTATCARDVMP vm
                   on vm.fk_pacid = t.fk_pacid)
     loop
       update asu.tsluch_dbf_calc t set t.vmp_id = c.vmp_id where t.id_ill = c.id_ill;
     end loop;
   end if;

   if aFill_type_v_mu = 1 then
     -- Заполняются данные о типе вида мед. помощи.
     for c in (SELECT c.fk_pacid FROM asu.tsluch_dbf_calc c WHERE c.fl_poly = 0 group by c.fk_pacid)
     LOOP
       select max(ti_TYPE_V_MU.fk_smid) ti_type_v_mu_smid
         INTO vti_type_v_mu_smid
         from ASU.TIB TI_TYPE_V_MU
        where TI_TYPE_V_MU.FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('TYPE_V_MU')
          AND TI_TYPE_V_MU.FK_PACID = c.fk_pacid;

       IF vti_type_v_mu_smid IS NOT NULL THEN
         UPDATE asu.tsluch_dbf_calc t SET t.type_v_mu = vti_type_v_mu_smid WHERE t.fk_pacid = c.fk_pacid;
       END IF;
     END LOOP;
   end if;

   if pFILL_CACHE = 1 then
     -- Заподняются вспомогательные таблицы
     FILL_CACHE;
   end if;

   -- заполняем дополнительные поля
   for c in (SELECT nvl(I.FK_ID, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Заполнение дополнительных параметров, таких как страховые данные', tp.fk_id, vTarifDetailOwner)) fk_insurdocid,
                    r.fk_otdelid,
                    decode(c.fk_regionid, ASU.GET_NATIVE_REGION, 1, null, 1, 2) pr_own,
                    tk.fk_uslvidid,
                    d.fc_synonim fc_typedoc_syn,
                    tp.fk_id id_ill,
                    tp.fk_pacid,
                    tp.fk_koykavidid,
                    tp.fk_palataid,
                    c.fk_regionid,
                    i.fc_ser,
                    i.fc_num,
                    i.fc_enp,
                    c.fk_id fk_companyid,
                    c.fc_ogrn,
                    tk.fk_peplid,
                    i.fk_typeoms,
                    decode(tu_ds.fk_id, null, 0, 1) fl_isds
               from asu.tsluch_dbf_calc t
              inner join asu.tperesel tp on tp.fk_id = t.id_ill
              inner join asu.troom r on r.fk_id = tp.fk_palataid
              inner join asu.tkarta tk on tk.fk_id = tp.fk_pacid --!
               left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tp.fk_pacid
               left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID --!
               left join (select * from asu.TCOMPANY where fl_del = 0) C on C.FK_ID = I.FK_COMPANYID --!
               left join asu.ttypedoc d on d.fk_id = i.fk_typedocid --!
               left join (SELECT tu.FK_ID FROM ASU.TUSLVID_DS tu) tu_ds on tu_ds.fk_id = tk.fk_uslvidid
              where t.fl_poly = 0

              union all
             SELECT nvl(I.FK_ID, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Заполнение дополнительных параметров, таких как страховые данные', tp.fk_id, vTarifDetailOwner)) fk_insurdocid,
                    r.fk_otdelid,
                    decode(c.fk_regionid, ASU.GET_NATIVE_REGION, 1, null, 1, 2) pr_own,
                    tk.fk_uslvidid,
                    d.fc_synonim fc_typedoc_syn,
                    t.id_ill,
                    t.fk_pacid,
                    tp.fk_koykavidid,
                    tp.fk_palataid,
                    c.fk_regionid,
                    i.fc_ser,
                    i.fc_num,
                    i.fc_enp,
                    c.fk_id fk_companyid,
                    c.fc_ogrn,
                    tk.fk_peplid,
                    i.fk_typeoms,
                    decode(tu_ds.fk_id, null, 0, 1) fl_isds
               from asu.tsluch_dbf_calc t
              inner join (SELECT ds.fk_id id_ill,
                                 tp.fk_pacid,
                                 MAX(tp.fk_id) fk_id--,
                            FROM asu.vdializ_stat ds
                           INNER JOIN asu.tperesel tp ON tp.fk_pacid = ds.fk_pacid
                           GROUP BY ds.fk_id, tp.fk_pacid) tpl on tpl.id_ill = t.id_ill
              inner join asu.tperesel tp on tp.fk_id = tpl.fk_id
              inner join asu.troom r on r.fk_id = tp.fk_palataid
              inner join asu.tkarta tk on tk.fk_id = tp.fk_pacid --!
               left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tp.fk_pacid
               left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID --!
               left join (select * from asu.TCOMPANY where fl_del = 0) C on C.FK_ID = I.FK_COMPANYID --!
               left join asu.ttypedoc d on d.fk_id = i.fk_typedocid --!
               left join (SELECT tu.FK_ID FROM ASU.TUSLVID_DS tu) tu_ds on tu_ds.fk_id = tk.fk_uslvidid
              where t.fl_poly = 0

              union all
             SELECT distinct
                    nvl(I.FK_ID, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Заполнение дополнительных параметров, таких как страховые данные', pp.fk_id, vTarifDetailOwner)) fk_insurdocid,
                    LAST_VALUE(r.fk_otdelid) OVER(PARTITION BY tp.fk_pacid ORDER BY tp.fd_data2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_koykavidid,
                    decode(c.fk_regionid, ASU.GET_NATIVE_REGION, 1, null, 1, 2) pr_own,
                    tk.fk_uslvidid,
                    d.fc_synonim fc_typedoc_syn,

                    t.id_ill,
                    t.fk_pacid,
                    LAST_VALUE(tp.fk_koykavidid) OVER(PARTITION BY tp.fk_pacid ORDER BY tp.fd_data2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_koykavidid,
                    LAST_VALUE(tp.fk_palataid) OVER(PARTITION BY tp.fk_pacid ORDER BY tp.fd_data2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_palataid,

                    c.fk_regionid,
                    i.fc_ser,
                    i.fc_num,
                    i.fc_enp,
                    c.fk_id fk_companyid,
                    c.fc_ogrn,
                    tk.fk_peplid,
                    i.fk_typeoms,
                    decode(tu_ds.fk_id, null, 0, 1) fl_isds
               from asu.tsluch_dbf_calc t
              inner join asu.vperesel_paliativ_nodel pp on pp.fk_id = t.id_ill
              inner join asu.tperesel tp on tp.fk_pacid = t.fk_pacid
              inner join asu.tkarta tk on tk.fk_id = tp.fk_pacid --!
              inner join asu.troom r on r.fk_id = tp.fk_palataid
               left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tp.fk_pacid
               left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID --!
               left join (select * from asu.TCOMPANY where fl_del = 0) C on C.FK_ID = I.FK_COMPANYID --!
               left join asu.ttypedoc d on d.fk_id = i.fk_typedocid --!
               left join (SELECT tu.FK_ID FROM ASU.TUSLVID_DS tu) tu_ds on tu_ds.fk_id = tk.fk_uslvidid
              where t.fl_poly = 0 )
   loop
     update asu.tsluch_dbf_calc t
        set t.fk_insurdocid  = c.fk_insurdocid,
            t.fk_otdelid     = c.fk_otdelid,
            t.pr_own         = c.pr_own,
            t.fk_uslvidid    = c.fk_uslvidid,
            t.fc_typedoc_syn = c.fc_typedoc_syn,
            t.id_ill         = c.id_ill,
            t.fk_pacid       = c.fk_pacid,
            t.fk_koykavidid  = c.fk_koykavidid,
            t.fk_palataid    = c.fk_palataid,
            t.fk_regionid    = c.fk_regionid,
            t.fc_ser         = c.fc_ser,
            t.fc_num         = c.fc_num,
            t.fc_enp         = c.fc_enp,
            t.fk_companyid   = c.fk_companyid,
            t.fc_ogrn        = c.fc_ogrn,
            t.fk_peplid      = c.fk_peplid,
            t.fk_typeoms     = c.fk_typeoms,
            t.fl_isds        = c.fl_isds
      where t.id_ill = c.id_ill;
   end loop;

   -- На первый этап проходят услуги, соотвтетсвующие входным параметрам
   for c in (select nvl(c.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Случай соответствует входным параметрам', c.id_ill, vTarifDetailOwner)) id_ill
               FROM asu.tsluch_dbf_calc C
              where c.fl_poly = 0
--                and ts.fl_state = 1
                and (pOMS_ONLY = 0 or (pOMS_ONLY = 1 and c.fc_typedoc_syn = 'OMS'))
                and (pOWN = 0 or c.pr_own = pOWN)
                and not exists (select ti.fk_pacid
                                  from asu.tib ti
                                 where ti.fk_smid in (SELECT tsi.fc_value
                                                        FROM asu.TSMINI tsi
                                                        left join asu.tsmid ts on ts.fk_id = tsi.fc_value
                                                       WHERE tsi.FC_SECTION = 'EXCHANGE'
                                                         AND tsi.FC_KEY like 'NO_EXCH_RAZDELIB_%')
                                   and ti.fk_pacid = c.fk_pacid)
                and not exists (SELECT tsi.fc_value
                                  FROM asu.TSMINI tsi
                                  left join asu.tsmid ts on ts.fk_id = tsi.fc_value
                                 WHERE tsi.FC_SECTION = 'EXCHANGE'
                                   AND tsi.FC_KEY like 'NO_EXCH_USLVID_' || to_char(c.fk_uslvidid))

             union all

             select nvl(c.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Случай соответствует входным параметрам', c.id_ill, vTarifDetailOwner)) id_ill
               FROM asu.tsluch_dbf_calc C
              where c.fl_poly = 0
                and asu.GET_EXCH79_USE_DIALIZ_LIST = 1
                and c.FK_USLVIDID = asu.doc_dializ
                and (pOMS_ONLY = 0 or (pOMS_ONLY = 1 and c.fc_typedoc_syn = 'OMS'))
                and (pOWN = 0 or c.pr_own = pOWN)
                and not exists (select ti.fk_pacid
                                  from asu.tib ti
                                 where ti.fk_smid in (SELECT tsi.fc_value
                                                        FROM asu.TSMINI tsi
                                                        left join asu.tsmid ts on ts.fk_id = tsi.fc_value
                                                       WHERE tsi.FC_SECTION = 'EXCHANGE'
                                                         AND tsi.FC_KEY like 'NO_EXCH_RAZDELIB_%')
                                   and ti.fk_pacid = c.fk_pacid)
                and not exists (SELECT tsi.fc_value
                                  FROM asu.TSMINI tsi
                                  left join asu.tsmid ts on ts.fk_id = tsi.fc_value
                                 WHERE tsi.FC_SECTION = 'EXCHANGE'
                                   AND tsi.FC_KEY like 'NO_EXCH_USLVID_' || to_char(c.fk_uslvidid)))
   loop
     update asu.tsluch_dbf_calc set fn_step = 1 where id_ill = c.id_ill;
   end loop;

--   CreateTSLUCH_DBF_CALC_Table(100, 1);

   SetDatesForVMP(1); -- Входная таблица содержит все переводы, поэтому нужно объединить те, что обрабатываются как одна карта
   FillDiagForVMP(1);

   -- заполнение данных диагнозов
   if asu.GET_EXCH79_STACDIAG_BY_KARTA = 1 then -- включено определение всех диагнозов по последниму в карте.
     FillDiagByLastDiag(1); -- Все диагнозы по последнику в карте
--     CreateTSLUCH_DBF_CALC_Table(100, 2);
     if aUseSetDatesByKarta = 1 then
       SetDatesByKarta(1, asu.doc_dializ, 1); -- Дата начала и окончания устанавливаются равными дате начала и окончания случая
     end if;
--     CreateTSLUCH_DBF_CALC_Table(100, 3);
   else -- определение всех диагнозов по последниму в карте отключено, будет использоваться определение по переводу
     if asu.GET_EXCH79_USE_DIALIZ_LIST = 0 then -- нет диализных карт
       if vSmid_TYPE_V_MU_PALLIATIV = -1 then -- нет палиативной помощи
         FillDiagByPeresel(1); -- для всех случаев диагноз по переводу
       else -- есть палиативная помощь
         FillDiagByPeresel(1, -1, 0, vSmid_TYPE_V_MU_PALLIATIV, 1); -- для всех случаев, кроме типа вида мед помощи палиативная, диагноз по переводу
         FillDiagByLastDiag(1, -1, 0, vSmid_TYPE_V_MU_PALLIATIV, 0); -- для палиативной помощи по последниму диагнозу карты
       end if;
     else -- есть даилизные карты
       if vSmid_TYPE_V_MU_PALLIATIV = -1 then -- нет палиативной помощи
         FillDiagByPeresel(1,  asu.doc_dializ, 1); -- для всех случаев, кроме диализных карт, диагноз по переводу
       else -- есть палиативная помощь
         FillDiagByPeresel(1, asu.doc_dializ, 1, vSmid_TYPE_V_MU_PALLIATIV, 1); -- для всех случаев, кроме типа вида мед помощи палиативная и диализных карт, диагноз по переводу
         FillDiagByLastDiag(1, -1, 0, vSmid_TYPE_V_MU_PALLIATIV, 0); -- для палиативной помощи по последниму диагнозу карты
       end if;
       FillDiagByLastDiag(1, asu.doc_dializ, 0); -- для диализных карт по последниму диагнозу карты
     end if;
   end if;

   CorrectLessDayPeresel(1);
--   CreateTSLUCH_DBF_CALC_Table(100, 4);

   if vSmid_TYPE_V_MU_PALLIATIV > -1 then -- для палиативного типа помощи КСГ заполняется вне зависимости от диагноза, случай сразу переводится на последнй этап LAST_STEP
     if ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') = 'SK' then
       FillOperSK(1);
     else
       FillOper(1);
     end if;
     vOperIsCalc := 1;
     CalculatePaliativ();
   end if;
--   CreateTSLUCH_DBF_CALC_Table(100, 5);

   CalculateVMP(aCostFromDate);

   if asu.get_ishmao = 0 then
     asu.PKG_STAT_COST_NOHMAO.CalculateNoHMAO(aCostFromDate, vUSE_TarifDetail, vTarifDetailOwner, LAST_STEP);
   else
     if asu.GET_EXCH79_STACDIAG_BY_KARTA = 1 then
       if vOperIsCalc = 0 then
         if ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') = 'SK' then
           FillOperSK(1);
         else
           FillOper(1);
         end if;
       end if;
       CalculateByKarta(aCostFromDate, 0);
     else
       CalculateHMAO(aCostFromDate);
       CalculateByKarta(aCostFromDate, 1);
     end if;
   end if;
--   CreateTSLUCH_DBF_CALC_Table(100, 6);

   FillDializCount(LAST_STEP);
--   CreateTSLUCH_DBF_CALC_Table(100, 7);

   if vDelNoTarifUsl = 1 then
     for c in (select nvl(t.id_ill, asu.PKG_TARIFDETAIL.AddPeresel(vUSE_TarifDetail, 'Перевод удалён из реестра выгрузки т.к. не прошёл проверки по входным параметрам либо был объединён с другим переводом', t.id_ill, vTarifDetailOwner)) id_ill
                 FROM asu.tsluch_dbf_calc t
                WHERE t.fl_poly = 0 AND t.fn_step < LAST_STEP)
     loop
       delete from asu.tsluch_dbf_calc t where t.id_ill = c.id_ill;
     end loop;
   end if;

   UPDATE asu.tsluch_dbf_calc SET id_ill_u = id_ill;

--   CreateTSLUCH_DBF_CALC_Table(100, 8);
 END;

 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure CalcByPacId(aPacId Number, pUseTarifDetail Number default 0, pTarifDetailOwner Varchar2 default '') is
    vMinFD_CALC date;
 begin
    delete from asu.tsluch_dbf_calc;

    insert into asu.tsluch_dbf_calc (id_ill, fl_fromstor, fl_poly, fk_pacid, fd_date1, fd_date2, FD_CALC, vmp_id)
      select tp.fk_id id_ill, -- nvl в данном случае используется чтобы вызвать asu.PKG_TARIFDETAIL.AddPeresel, т.к. nvl всегда обрабатывает оба аргумента, даже если первый отличен от null
             0 fl_fromstor,
             0 fl_poly,
             tp.fk_pacid,
             case when asu.GET_EXCH79_STACDIAG_BY_KARTA = 1 or vm.fk_pacid is not null then
               ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(tp.Fk_Pacid)
             else
               tp.fd_data1
             end fd_data1,
             case when asu.GET_EXCH79_STACDIAG_BY_KARTA = 1 or vm.fk_pacid is not null then
               ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(tp.Fk_Pacid)
             else
               tp.fd_data2
             end fd_data2,
             FD_VYP FD_CALC, -- 20140403 Таня уточнила на Хантах, стац. случай тарифицируется по дате окончательной выписки
             vm.fk_id vmp_id
        from (SELECT tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid, tp.fk_id_last,
                     max(tp.FD_VYP) FD_VYP, -- группировка по FD_VYP не производится, так как иногда встречаются случаи с несколькими записями о выписки в сроках
                     tp.fk_palataid
                FROM (SELECT tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid, tp.FD_VYP, tp.fk_palataid,
                             LAST_VALUE(tp.fk_id) OVER(PARTITION BY tp.fk_pacid ORDER BY tp.fd_data2 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id_last
                        from (SELECT tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid, S.FD_DATA1 FD_VYP, tp.fk_palataid
                                FROM ASU.TSROKY S
                               inner join asu.tperesel tp on tp.fk_pacid = s.fk_pacid
                               where s.fk_pacid = aPacId
                             ) tp
                     ) tp
               group by tp.fk_id, tp.fd_data1, tp.fd_data2, tp.fk_pacid, tp.fk_id_last, tp.fk_palataid) tp
       left join asu.troom r on r.fk_id = tp.fk_palataid
       left join asu.tkarta tk on tk.fk_id = tp.fk_pacid -- катра подмешивается для заполнения типа документа обслуживания, без которого ниже нельзя определить относится случай к скорой или нет
       left JOIN (select tod.fk_id from login.totdel tod left join asu.troom tr on tr.fk_otdelid = tod.fk_id where upper(tr.fc_palata) like 'ПРИ%МН%' GROUP BY tod.fk_id) tod_pr ON tod_pr.fk_id = r.fk_otdelid
       left join asu.tperesel_diag tpd on tpd.fk_peresel = tp.fk_id
       left join ASU.TSTATCARDVMP vm on vm.fk_pacid = tp.fk_pacid
       left join (select p.fk_pacid from asu.vperesel_paliativ_nodel p where asu.EXCH79_PALIATIVE_LONG_KART = 1 group by p.fk_pacid) pp on pp.fk_pacid = tp.fk_pacid
      where (((asu.GET_EXCH79_STACDIAG_BY_KARTA = 1 or vm.fk_pacid is not null) AND tp.fk_id = tp.fk_id_last) or ((not (asu.GET_EXCH79_STACDIAG_BY_KARTA = 1 or vm.fk_pacid is not null)) and tpd.fk_peresel is not null))
          and (asu.GET_EXCH79_USE_DIALIZ_LIST = 0 or (asu.GET_EXCH79_USE_DIALIZ_LIST = 1 and tk.fk_uslvidid <> asu.doc_dializ))
          and tod_pr.fk_id is null
          and pp.fk_pacid is null;

      if asu.GET_EXCH79_USE_DIALIZ_LIST = 1 then
        insert into asu.tsluch_dbf_calc (id_ill, fl_fromstor, fl_poly, fk_pacid, fd_date1, fd_date2, FN_DIALIZ_SMID, FD_CALC)
          select tp.fk_id id_ill,
                 0 fl_fromstor, 0 fl_poly, tp.fk_pacid, tp.fd_data1, tp.fd_data2,
                 FN_DIALIZ_SMID,
                 FD_VYP FD_CALC--, -- 20140403 Таня уточнила на Хантах, стац. случай тарифицируется по дате окончательной выписки
            from (SELECT tp.fk_id, min(tp.fd_data1) fd_data1, max(tp.fd_data2) fd_data2, tp.fk_pacid, max(tp.FD_VYP) FD_VYP, tp.FN_DIALIZ_SMID,
                         CAST(RTRIM(Sys_xmlagg(XMLELEMENT(col, tp.fc_comment || '. ')).extract('/ROWSET/COL/text()').getclobval(), ', ') AS VARCHAR2(4000)) fc_comment
                    from (SELECT ds.fk_id, ds.fd_data1, ds.fd_data2, ds.fk_pacid, ds.fd_data2 FD_VYP, ds.FN_DIALIZ_SMID,
                                 'Стационарный случай добавлен, т.к. относится к карте диализа' fc_comment
                            FROM asu.vdializ_stat ds
                           WHERE ds.fk_pacid = aPacId
                         ) tp
                   group by tp.fk_id, tp.fk_pacid, tp.FN_DIALIZ_SMID
                 ) tp
           left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tp.fk_pacid
           left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID
           left join (select * from asu.TCOMPANY where fl_del = 0) Cm on Cm.FK_ID = I.FK_COMPANYID
           left join asu.ttypedoc d on d.fk_id = i.fk_typedocid;
      end if;

      if asu.exch79_paliative_long_kart = 1 then
        insert into asu.tsluch_dbf_calc (id_ill, fl_fromstor, fl_poly, fk_pacid, fd_date1, fd_date2, FD_CALC, fk_paliativ_id)
          select tp.fk_id id_ill, -- nvl в данном случае используется чтобы вызвать decode(vUSE_TarifDetail, 0, 0, ASU.PKG_TARIFDETAIL.AddPeresel, т.к. nvl всегда обрабатывает оба аргумента, даже если первый отличен от null
                 0 fl_fromstor, 0 fl_poly, tp.fk_pacid, tp.fd_data1, tp.fd_data2,
                 FD_VYP FD_CALC, -- 20140403 Таня уточнила на Хантах, стац. случай тарифицируется по дате окончательной выписки
                 tp.fk_id
            from (SELECT tp.fk_id, min(tp.fd_data1) fd_data1, max(tp.fd_data2) fd_data2, tp.fk_pacid, max(tp.FD_VYP) FD_VYP
                    from (SELECT pp.fk_id, pp.fd_start fd_data1, pp.fd_end fd_data2, pp.fk_pacid, pp.fd_end FD_VYP
                            FROM asu.vperesel_paliativ_nodel pp
                           WHERE pp.fk_pacid = aPacId
                         ) tp
                   group by tp.fk_id, tp.fk_pacid
                 ) tp
           left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tp.fk_pacid
           left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID
           left join (select * from asu.TCOMPANY where fl_del = 0) Cm on Cm.FK_ID = I.FK_COMPANYID
           left join asu.ttypedoc d on d.fk_id = i.fk_typedocid;
      end if;

     select min(t.fd_calc) into vMinFD_CALC from asu.tsluch_dbf_calc t where t.fl_poly = 0;

     ASU.PKG_STAT_COST.CALCULATE(0, 0, 1, pUseTarifDetail, pTarifDetailOwner, 0, vMinFD_CALC, 0, 1, 0);
 end;

END;
/

SHOW ERRORS;


