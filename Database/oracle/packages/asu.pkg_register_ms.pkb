DROP PACKAGE BODY ASU.PKG_REGISTER_MS
/

--
-- PKG_REGISTER_MS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_REGISTER_MS" is

  function get_pac_otdelenie(pPacID in number) return varchar2 is
    cursor cOtdel is
      select o.fc_name
      from login.totdel o, asu.tperesel p, asu.troom r
      where p.fk_id=asu.get_maxpereselid(pPacID)
      and r.fk_id=p.fk_palataid
      and o.fk_id=r.fk_otdelid;

    sRes login.totdel.fc_name%type;
  begin
    open cOtdel;
    fetch cOtdel into sRes;
    if cOtdel%notfound then sRes:='Не указано'; end if;
    close cOtdel;

    return(sRes);
  end;

  function get_pac_otdelenie_id(pPacID in number) return number is
    cursor cOtdel is
      select o.fk_id
      from login.totdel o, asu.tperesel p, asu.troom r
      where p.fk_id=asu.get_maxpereselid(pPacID)
      and r.fk_id=p.fk_palataid
      and o.fk_id=r.fk_otdelid;

    nRes login.totdel.fk_id%type;
  begin
    open cOtdel;
    fetch cOtdel into nRes;
    if cOtdel%notfound then nRes:=null; end if;
    close cOtdel;

    return(nRes);
  end;

  function get_pac_room(pPacID in number) return varchar2 is
    cursor cRoom is
      select r.fc_palata
      from asu.tperesel p, asu.troom r
      where p.fk_id=asu.get_maxpereselid(pPacID)
      and r.fk_id=p.fk_palataid;

    sRes asu.troom.fc_palata%type;
  begin
    open cRoom;
    fetch cRoom into sRes;
    if cRoom%notfound then sRes:='Не указана'; end if;
    close cRoom;

    return(sRes);
  end;

  function get_pac_room_id(pPacID in number) return number is
    cursor cRoom is
      select p.fk_palataid
      from asu.tperesel p
      where p.fk_id=asu.get_maxpereselid(pPacID);

    nRes asu.tperesel.fk_palataid%type;
  begin
    open cRoom;
    fetch cRoom into nRes;
    if cRoom%notfound then nRes:=null; end if;
    close cRoom;

    return(nRes);
  end;

  function get_pac_vrach_id(pPacID in number) return number is
    cursor cVrach is
      select v.fk_vrachid from asu.tvrach v where v.fl_vid='M' and v.fk_pacid=pPacID
      union
      select a.fk_sotrid from asu.tambtalon a where a.fk_id=pPacID;

    nRes number;
  begin
    open cVrach;
    fetch cVrach into nRes;
    if cVrach%notfound then nRes:=null; end if;
    close cVrach;

    return(nRes);
  end;

  function get_pac_inscomp_id(pPacID in number, pDate in date) return number is
    cursor cComp is
      select max(idc.fk_companyid)
        from asu.tinsurdocs idc
       where idc.fk_peplid=asu.get_peplid(pPacID)
         and pDate between idc.fd_begin and nvl(nvl(idc.fd_prolong, idc.fd_end), sysdate);

    nRes number;
  begin
    open cComp;
    fetch cComp into nRes;
    if cComp%notfound then nRes:=null; end if;
    close cComp;

    return(nRes);
  end;

  function get_pac_kdncena(pPacID in number) return varchar2 is
    -- Алгоритм в свое время позаимствован у Сергея Нефедова
    cursor cCena is
      select rtrim(sys_xmlagg(xmlelement(col, decode(trunc(fd_data2) - trunc(fd_data1), 0, 1, trunc(fd_data2) - trunc(fd_data1)) || 'x' || to_char(nvl(ds.fn_price, 0), 'FM9999999990D00', 'NLS_NUMERIC_CHARACTERS = '', '' ') || 'р.' || '+ ')).extract('/ROWSET/COL/text()')
                   .getstringval(),
                   '+ ') fc_kdncena
        from asu.tperesel p, asu.tdocobsl_standart ds, asu.troom r
       where p.fk_pacid = pPacID
         and r.fk_id = p.fk_palataid
         and asu.is_priemn_otdel(r.fk_otdelid) = 0
         and p.fk_id = ds.fk_pereselid(+);
    sRes varchar2(10);
  begin
    open cCena;
    fetch cCena into sRes;
    if cCena%notfound then sRes:=null; end if;
    close cCena;

    sRes:=nvl(sRes, ' ');

    return(sRes);
  end;

  function get_pac_kdnsum(pPacID in number) return number is
    -- Алгоритм в свое время позаимствован у Сергея Нефедова
    cursor cSum is
      select sum(decode(trunc(fd_data2) - trunc(fd_data1),
                        0,
                        1,
                        trunc(fd_data2) - trunc(fd_data1)) * nvl(ds.fn_price, 0)) fn_kdnsum
        from asu.tperesel p, asu.tdocobsl_standart ds, asu.troom r
       where p.fk_pacid = pPacID
         and r.fk_id = p.fk_palataid
         and asu.is_priemn_otdel(r.fk_otdelid) = 0
         and p.fk_id = ds.fk_pereselid(+);
    nRes number;
  begin
    open cSum;
    fetch cSum into nRes;
    if cSum%notfound then nRes:=1; end if;
    close cSum;

    nRes:=nvl(nRes, 0);

    return(nRes);
  end;

  function get_pac_main_diag(pPacID in number) return number is
    nRes number;
  begin
    nRes:=stat.pkg_frform30.get_last_diagid(pPacID, 'MAIN', sysdate);
    return(nRes);
  end;

  function get_pac_soput_diag(pPacID in number) return number is
    -- Заявление пациента на лечение по сопутствующему диагнозу
    cursor cClaim(pnDiagID in number) is
      select 1 from asu.tsopclaim cc where cc.fk_pacid=pPacID and cc.fk_diagid=pnDiagID;
    nRes number;
    nClaim number;
  begin
    nRes:=stat.pkg_frform30.get_last_diagid(pPacID, 'SOPUT', sysdate);

    open cClaim(nRes);
    fetch cClaim into nClaim;
    if cClaim%notfound then nClaim:=0; end if;
    close cClaim;

    if nClaim=1 then
      return(nRes);
    else
      return(-1);
    end if;
  end;

  function get_standard_name(pStandardID in number) return varchar2 is
    cursor cName is
      select t.fc_name from asu.tstandart t where t.fk_id=pStandardID;
    sRes asu.tstandart.fc_name%type;
  begin
    open cName;
    fetch cName into sRes;
    if cName%notfound then sRes:='Не известен'; end if;
    close cName;

    return(sRes);
  end;

  function get_standard_group_name(pGroupID in number) return varchar2 is
    cursor cName is
      select t.fc_name from asu.tstandart_group t where t.fk_id=pGroupID;
    sRes asu.tstandart_group.fc_name%type;
  begin
    open cName;
    fetch cName into sRes;
    if cName%notfound then sRes:=' '; end if;
    close cName;

    return(sRes);
  end;

  function get_pac_standard_id(pPacID in number, pStdGrpID in number) return number is
    -- Стандарт лечения для конкретного диагноза
    cursor cLinkedByDiag is
      select max(sd.fk_standartid)
        from asu.tstandartdiag sd,
             asu.tdiag d
        where sd.fk_pacid = pPacID
          and d.fk_pacid = pPacID
          and d.fk_id in (get_pac_main_diag(pPacID), get_pac_soput_diag(pPacID))
          and sd.fk_diagid = d.fk_smdiagid;
    -- Стандарт лечения для пациента в целом
    cursor cLinkedByPac is
      select max(sd.fk_standartid)
        from asu.tstandartdiag sd
        where sd.fk_pacid = pPacID;
    -- Стандарт, рассчитанный по коду МКБ-10
    cursor cICD10 is
      select max(st.fk_id)
        from asu.tdiag d,
             asu.tsmid sm,
             asu.tstandart st,
             asu.ticd10 icd,
             asu.tstandart_icd10 slnk
        where d.fk_pacid = pPacID
          and d.fk_id in (get_pac_main_diag(pPacID), get_pac_soput_diag(pPacID))
          and sm.fk_id = d.fk_smdiagid
          and sm.fk_mkb10=icd.fc_kod
          and slnk.fk_icd10=icd.fk_id
          and slnk.fk_standart=st.fk_id
          and st.fk_groupid = pStdGrpID;

    nRes number;
  begin
    nRes:=null;

    open cLinkedByDiag;
    fetch cLinkedByDiag into nRes;
    if cLinkedByDiag%notfound then nRes:=null; end if;
    close cLinkedByDiag;

    if nRes is null then
      open cLinkedByPac;
      fetch cLinkedByPac into nRes;
      if cLinkedByPac%notfound then nRes:=null; end if;
      close cLinkedByPac;
    end if;

    if nRes is null then
      open cICD10;
      fetch cICD10 into nRes;
      if cICD10%notfound then nRes:=null; end if;
      close cICD10;
    end if;

    nRes:=nvl(nRes, -1);
    return(nRes);
  end;

  function get_uslug_cost(pNazID in number, pSMID in number, pDate in date, pPacID in number, pStdGrpID in number := -1) return number is
    -- Цена услуги после оплаты (по кассовому чеку)
    cursor cCashBox is
      select round(sum(nvl(bu.fn_sum, 0)), 2)
        from asu.tbill b, asu.tbalancemove bm, asu.tbill_uslug bu, asu.tplat_uslug pu
       where b.fk_id = bm.fk_bill
         and bu.fk_bill = b.fk_id
         and pu.fk_id = bu.fk_plat_uslug
         and pu.fk_naz = pNazID
         and bm.fk_to = -1;

    -- Цена услуги по тарифу страховой компании пациента
    cursor cInsurance(pnCompID in number) is
      select max(hc.fn_cost)
        from asu.theal_smid s, asu.theal_cost hc
       where hc.fk_healid = s.fk_heal
         and hc.fk_companyid = pnCompID
         and pDate between hc.fd_date1 and nvl(hc.fd_date2, sysdate)
         and s.fk_smid = pSMID;

    -- Цена услуги в соответствии со стандартом лечения опр. группы
    cursor cStandard is
      select max(hc.fn_cost)
        from asu.theal_smid hs,
             asu.theal_cost hc,
             asu.tstandart_heal sh
       where hc.fk_healid = hs.fk_heal
         and sh.fk_heal = hs.fk_heal
         and sh.fk_standart = get_pac_standard_id(pPacID, pStdGrpID)
         and pDate between hc.fd_date1 and nvl(hc.fd_date2, sysdate)
         and hs.fk_smid = pSMID;

    -- Цена услуги по тарифу из раздела платных услуг
    cursor cPlatUslug is
      select max(pkg_uslugi.get_heal_cost(s.fk_heal, pDate))
        from asu.theal_smid s,
             (select fk_id
                from theal
              connect by prior fk_id = fk_parent
               start with fk_id = get_platuslug) theal
       where theal.fk_id = s.fk_heal
         and s.fk_smid = pSMID;

    nCompID number;
    nRes number;
  begin
    nRes:=null;

    open cCashBox;
    fetch cCashBox into nRes;
    if cCashBox%notfound then nRes:=null; end if;
    close cCashBox;

    if nRes is null then
      nCompID:=get_pac_inscomp_id(pPacID, pDate);

      open cInsurance(nCompID);
      fetch cInsurance into nRes;
      if cInsurance%notfound then nRes:=null; end if;
      close cInsurance;
    end if;

    if (nRes is null) and (pStdGrpID<>-1) then
      open cStandard;
      fetch cStandard into nRes;
      if cStandard%notfound then nRes:=null; end if;
      close cStandard;
    end if;

    if nRes is null then
      open cPlatUslug;
      fetch cPlatUslug into nRes;
      if cPlatUslug%notfound then nRes:=null; end if;
      close cPlatUslug;
    end if;

    if nRes is null then nRes:=0; end if;
    return(nRes);
  end;

  function get_uslug_cost_source(pNazID in number, pSMID in number, pDate in date, pPacID in number, pStdGrpID in number := -1) return varchar2 is
    cursor cApp is
      select wm_concat(a.fc_appnum) from asu.tappendix a where a.fk_ambtalon=pPacID;

    -- Цена услуги после оплаты (по кассовому чеку)
    cursor cCashBox is
      select round(sum(nvl(bu.fn_sum, 0)), 2),
             'Счет №'||wm_concat(b.fc_num)
        from asu.tbill b, asu.tbalancemove bm, asu.tbill_uslug bu, asu.tplat_uslug pu
       where b.fk_id = bm.fk_bill
         and bu.fk_bill = b.fk_id
         and pu.fk_id = bu.fk_plat_uslug
         and pu.fk_naz = pNazID
         and bm.fk_to = -1;

    -- Цена услуги по тарифу страховой компании пациента
    cursor cInsurance(pnCompID in number) is
      select max(hc.fn_cost),
             'Страх. тариф от '||wm_concat(to_char(hc.fd_date1, 'dd.mm.yyyy'))
        from asu.theal_smid s, asu.theal_cost hc
       where hc.fk_healid = s.fk_heal
         and hc.fk_companyid = pnCompID
         and pDate between hc.fd_date1 and nvl(hc.fd_date2, sysdate)
         and s.fk_smid = pSMID;

    -- Цена услуги в соответствии со стандартом лечения опр. группы
    cursor cStandard is
      select max(hc.fn_cost),
             'Тариф от '||wm_concat(to_char(hc.fd_date1, 'dd.mm.yyyy'))
        from asu.theal_smid hs,
             asu.theal_cost hc,
             asu.tstandart_heal sh
       where hc.fk_healid = hs.fk_heal
         and sh.fk_heal = hs.fk_heal
         and sh.fk_standart = get_pac_standard_id(pPacID, pStdGrpID)
         and pDate between hc.fd_date1 and nvl(hc.fd_date2, sysdate)
         and hs.fk_smid = pSMID;

    -- Цена услуги по тарифу из раздела платных услуг
    cursor cPlatUslug is
      select max(pkg_uslugi.get_heal_cost(s.fk_heal, pDate)),
             'Тариф "Платные услуги"'
        from asu.theal_smid s,
             (select fk_id
                from theal
              connect by prior fk_id = fk_parent
               start with fk_id = get_platuslug) theal
       where theal.fk_id = s.fk_heal
         and s.fk_smid = pSMID;

    nCompID number;
    nRes number;
    sRes varchar2(1000);
    sApp varchar2(1000);
  begin
    nRes:=null;

    open cApp;
    fetch cApp into sApp;
    if cApp%notfound then sApp:=null; end if;
    close cApp;

    open cCashBox;
    fetch cCashBox into nRes, sRes;
    if cCashBox%notfound then nRes:=null; end if;
    close cCashBox;

    if (sApp is not null) and (nRes is not null) then
      sApp:=', договор №'||sApp;
    end if;

    if nRes is null then
      nCompID:=get_pac_inscomp_id(pPacID, pDate);

      open cInsurance(nCompID);
      fetch cInsurance into nRes, sRes;
      if cInsurance%notfound then nRes:=null; end if;
      close cInsurance;
    end if;

    if (nRes is null) and (pStdGrpID<>-1) then
      open cStandard;
      fetch cStandard into nRes, sRes;
      if cStandard%notfound then
        nRes:=null;
      else
        sRes:=sRes
              ||'. Стандарт "'||get_standard_group_name(pStdGrpID)||'"'
              ||' для "'||get_standard_name(get_pac_standard_id(pPacID, pStdGrpID))||'"';
      end if;
      close cStandard;
    end if;

    if nRes is null then
      open cPlatUslug;
      fetch cPlatUslug into nRes, sRes;
      if cPlatUslug%notfound then nRes:=null; end if;
      close cPlatUslug;
    end if;

    if nRes is null then sRes:=' '; end if;
    return(sRes||sApp);
  end;

end pkg_register_ms;
/

SHOW ERRORS;


