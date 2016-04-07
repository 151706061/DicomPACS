DROP PACKAGE BODY ASU.PKG_RODIDATA
/

--
-- PKG_RODIDATA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_RODIDATA" is

  -- Изменить в протоколе ветку "Здоровье мужа!!!!!!!!!!!!!!!!!"
  --добавить синонимы на акушерский таз CRISTARUM !!!!!!!!
  --добавить синоним на ВИЧ LAB_VICH, гонококки - мазок на гонорею GONOKOKKI_MAZOK!!!!!!!!!
  -- анализ на яйца глистов GLIST_ANAL !!!!!!
  -- флюорография в первой проекии FLUOROGRAPH_1PROEKCIA

  BEREMDOCVID  number := 361; --обращение в РО
  VARCHAR_EDIT Varchar2(3) := '...';

  ----------------------------------------------------------------
  function IsFirstBeremPeresel(pPacID Number) return boolean is
    PRAGMA AUTONOMOUS_TRANSACTION;
    vDocID number;
  begin
    select max(o.fk_viddocid)
      into vDocID
      from asu.tperesel p, asu.tdocobsl o
     where p.fk_pacid = pPacID
       and o.fk_id = p.fk_docobslid
       and o.fk_viddocid = BEREMDOCVID;
    return(vDocID is null);
  end;

  ----------------------------------------------------------------
  function IsNeedInsertData(pPacID Number, pDocObsl Number) return boolean is
    vVidDocID number;
  begin
    select max(o.fk_viddocid)
      into vVidDocID
      from asu.tdocobsl o
     where o.fk_id = pDocObsl;

    if vVidDocID = BEREMDOCVID then
      return IsFirstBeremPeresel(pPacID);
    else
      return false;
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoInsertRodiData(pPacID Number, pPeopleID Number) is
    vNazOsmotr    number;
    vPeople       number; -- := asu.pkg_regist_pacfunc.get_pepl_id(pPacID);
    vAmbDocVid    number := 462; --амбулаторная карта
    vSmidOsmotrID number := 427598; --осмотр акушера-гинеколога
    vTmp          Varchar2(4000);
    vTmp1         Varchar2(4000);
    vNum          Number;

    vDnoMatkiOsm Varchar2(100) := 'VYSOTA_DNA_MATKI_SM';
    vDnoMatkiPac Varchar2(100) := 'VYSOTA_DNA';
    vDnoMatkiPacNum Number := stat.pkg_statutil.GET_SMIDID(vDnoMatkiPac);

    vRostOsm Varchar2(100) := 'PD_ROST';
    vRostPac Varchar2(100) := 'PD_ROST';

    vLastMenstOsm Varchar2(100) := 'POSLED_MENSTR';
    vLastMenstPac Varchar2(100) := 'POSLED_MENSTR';

    vShevPlodaOsm Varchar2(100) := 'PERV_SHEVEL';
    vShevPlodaPac Varchar2(100) := 'PERV_SHEVEL';

    vSrokRodiOsm Varchar2(100) := 'DATA_ROD';
    vSrokRodiPac Varchar2(100) := 'DATA_ROD';

    vPolovayaOsm Varchar2(100) := 'POL_ZHISN';
    vPolovayaPac Varchar2(100) := 'POL_ZHISN';

--    vGinekologOsm Varchar2(100) := 'GIN_ZABOL';
--    vGinekologPac Varchar2(100) := 'GIN_ZABOL';

    vMujZdorovOsm Varchar2(100) := 'ZDOROVIE_MUZH';
    vMujZdorovPac Varchar2(100) := 'ZDOROVIE_MUZH';

    vTazSpinarumOsm      Varchar2(100) := 'SPINARUM';
    vTazCristarumOsm     Varchar2(100) := 'CRISTARUM';
    vTazTrochantericaOsm Varchar2(100) := 'TROCHANTERICA';
    vTazDiagonalisOsm    Varchar2(100) := 'DIAGONALIS';
    vTazPacID            Number := stat.pkg_statutil.get_smidid('TAZ');

    vMujFioOsm Varchar2(100) := 'MUZH';
    vMujAgeOsm Varchar2(100) := 'MUZH_VOZR';
    vMujRabOsm Varchar2(100) := 'MUZH_RAB';
    vMujPacID  Number := stat.pkg_statutil.get_smidid('MUZH');

    vBotkinOsm Varchar2(100) := 'B_BOTKINA';
    vBotkinPac Varchar2(100) := 'B_BOTKINA';

    vTubikOsm Varchar2(100) := 'TUBERKULES';
    vTubikPac Varchar2(100) := 'TUBERKULES';

    vAllergOsm Varchar2(100) := 'ALLERGOANAMNES1';
    vAllergPac Varchar2(100) := 'ALLERGOANAMNES1';

    vVenerOsm Varchar2(100) := 'VENER_ZABOL';
    vVenerPac Varchar2(100) := 'VENER_ZABOL';

    vObshieOsm Varchar2(100) := 'OBSHIE_ZABOLEVANIA';
    vObshiePac Varchar2(100) := 'OBSHIE_ZABOLEVANIA';

    vFirstMenstrOsm Varchar2(100) := 'PERV_MENSTR';
    vFirstMenstrPac Varchar2(100) := 'MENSTR';

    RW_Naz Number := stat.pkg_statutil.get_smidid('CLINIC_RW');
    RW_Pac Number := stat.pkg_statutil.get_smidid('DP_VASERMAN');
    RW_PacDate Number   := stat.pkg_statutil.get_smidid('DAT_VAS');

    Vich_Naz Number := stat.pkg_statutil.get_smidid('LAB_VICH');
    Vich_Pac Number := stat.pkg_statutil.get_smidid('VICH');

    Mazok_Naz Number := stat.pkg_statutil.get_smidid('GONOKOKKI_MAZOK');
    Mazok_Pac Number := stat.pkg_statutil.get_smidid('GANAREYA');

--    RGraph_Naz Number := stat.pkg_statutil.get_smidid('FLUOROGRAPH_1PROEKCIA');
--    RGraph_Pac Number := stat.pkg_statutil.get_smidid('FLUOROGRAFIYA');
--    RGraph_PacData Number := stat.pkg_statutil.get_smidid('DAT_FLUOROGRAF');

    Glist_Naz Number := stat.pkg_statutil.get_smidid('GLIST_ANAL');
    Glist_Pac Number := stat.pkg_statutil.get_smidid('GLIST');

    ALLERGOANAMNES_SmidID Number := stat.pkg_statutil.get_smidid('ALLERGOANAMNES');
    GIN_ZABOL_SmidID Number := stat.pkg_statutil.get_smidid('GIN_ZABOL');

    vAmbID   Number;
  begin
    /*    select max(*)
    from asu.tdocobsl o, asu.tkarta k
    where k*/
    --назначение из которого взять данные
    vPeople := pPeopleID;
    select max(a.fk_id)
    into vAmbID
    from asu.tambulance a, asu.tdocobsl o
    where a.fk_docobsl = o.fk_id
          and o.fk_viddocid = vAmbDocVid
          and a.fk_peplid = vPeople;

    select max(fk_id)
      into vNazOsmotr
      from asu.vnaz
     where fk_pacid = vAmbID
       and fk_smid = vSmidOsmotrID
       and fk_nazsosid = get_vipnaz;

    if vNazOsmotr is null then
      return;
    end if;

    --рост
    DoNumber(pPacid, vRostOsm, vRostPac, vNazOsmotr);
    --высота дна матки
    begin
      DoEdit(pPacid, vDnoMatkiOsm, vDnoMatkiPac, vNazOsmotr,vTmp,false);
      vNum := trim(vTmp);
      DoInsNumber(pPacID, vDnoMatkiPacNum, null, vNum);
    exception
      when others then
       dbms_output.put_line(SQLERRM);
    end;
    --последние месячные начались
    DoDate(pPacid, vLastMenstOsm, vLastMenstPac, vNazOsmotr);
    --первое движение плода
    DoDate(pPacid, vShevPlodaOsm, vShevPlodaPac, vNazOsmotr);

    --Размеры акушерского таза
    DoEdit(pPacid,
           vTazSpinarumOsm,
           vTazSpinarumOsm,
           vNazOsmotr,
           vTmp,
           false);
    vTmp1 := vTmp;
    DoEdit(pPacid,
           vTazCristarumOsm,
           vTazCristarumOsm,
           vNazOsmotr,
           vTmp,
           false);
    vTmp1 := vTmp1 || '-' || vTmp;
    DoEdit(pPacid,
           vTazTrochantericaOsm,
           vTazTrochantericaOsm,
           vNazOsmotr,
           vTmp,
           false);
    vTmp1 := vTmp1 || '-' || vTmp;
    DoEdit(pPacid,
           vTazDiagonalisOsm,
           vTazDiagonalisOsm,
           vNazOsmotr,
           vTmp,
           false);
    vTmp1 := vTmp1 || '-' || vTmp;
    DoInsEdit(pPacID, vTazPacID, null, vTmp1);

    --срок родов
    DoDate(pPacid, vSrokRodiOsm, vSrokRodiPac, vNazOsmotr);
    --с какого возраста началась половая жизнь
    DoCombo(pPacid, vPolovayaOsm, vPolovayaPac, vNazOsmotr);
--  Ефимов В.А. 26.10.2008 Заменил на DoInsertVarchar2(GIN_ZABOL_SmidID, pPeopleID, pPacID), см. ниже
    --перенесенные женские болезни
--    DoCombo(pPacid, vGinekologOsm, vGinekologPac, vNazOsmotr);
    --здоровье мужа
    DoCombo(pPacid, vMujZdorovOsm, vMujZdorovPac, vNazOsmotr);

    --- Ф. И. О. мужа,возраст,место работы мужа
    vTmp1 := '';
    DoEdit(pPacid, vMujFioOsm, vMujFioOsm, vNazOsmotr, vTmp, false);
    vTmp1 := vTmp1 || ' ' || vTmp;
    DoNumber(pPacid, vMujAgeOsm, vMujAgeOsm, vNazOsmotr, vNum, false);
    vTmp1 := vTmp1 || ' ' || To_Char(vNum);
    DoEdit(pPacid, vMujRabOsm, vMujRabOsm, vNazOsmotr, vTmp, false);
    vTmp1 := vTmp1 || ' ' || vTmp;
    DoInsEdit(pPacID, vMujPacID, null, vTmp1);

    -- Б. Боткина
    DoCombo(pPacid, vBotkinOsm, vBotkinPac, vNazOsmotr);

    --туберкулёз
    DoCombo(pPacid, vTubikOsm, vTubikPac, vNazOsmotr);

    --аллергологический анамнез
    DoCombo(pPacid, vAllergOsm, vAllergPac, vNazOsmotr);

    --венерические заболевания
    DoCombo(pPacid, vVenerOsm, vVenerPac, vNazOsmotr);

    --перенесенные болезни
    DoEdit(pPacid, vObshieOsm, vObshiePac, vNazOsmotr);

    --первые менструации
    --берутся из varchar в осмотре из записываются в Edit в регистратуре
    DoCombo(pPacID,
            vFirstMenstrOsm,
            vFirstMenstrPac,
            vNazOsmotr,
            vTmp,
            false);
    DoInsEdit(pPacID,
              stat.pkg_statutil.get_smidid(vFirstMenstrPac),
              null,
              vTmp);

    --реакция вассермана
    DoInsertNazEdit3(pPacID, RW_Naz, RW_Pac,RW_PacDate,vAmbID);
    --ВИЧ
    DoInsertNazEdit(pPacID, Vich_Naz, Vich_Pac,vAmbID);
    --Мазок на гонорею
    DoInsertNazEdit2(pPacID, Mazok_Naz, Mazok_Pac,vAmbID);
    --рентгенография в первой проекции
    DoInsertFluoro(pPacID, vAmbID);
    --DoInsertNazEdit3(pPacID, RGraph_Naz, RGraph_Pac,RGraph_PacData);
    --я/глист
    DoInsertNazEdit(pPacID, Glist_Naz, Glist_Pac,vAmbID);

    -- Add Ефимов В.А. 22.10.2009
    -- Перенос алегроанамнеза
    DoInsertVarchar2(ALLERGOANAMNES_SmidID, pPeopleID, pPacID);
    -- Add Ефимов В.А. 26.10.2009
    -- Перенос гинекологических заболеваний
    -- Используется вместо DoCombo, так как DoCombo не переносит полей связанных с '...'
    DoInsertVarchar2(GIN_ZABOL_SmidID, pPeopleID, pPacID);
  end;

  ----------------------------------------------------------------
  procedure DoDate(pPacID      Number,
                   pSmidSynOsm Varchar2,
                   pSmidSynPac Varchar2,
                   pNazOsmotr  Number) is
    vVrachID number;
    vSmidOsm Number;
    vSmidPac Number;
    vDate    Date;
  begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);
    vSmidPac := stat.pkg_statutil.get_smidid(pSmidSynPac);

    select max(i.fd_date), max(i.fk_vrachid)
      into vDate, vVrachID
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smid = vSmidOsm;

    if (vDate is not null) then
      DoDate(pPacID,vSmidPac,vDate,vVrachID);
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoDate(pPacID      Number,
                   pSmidPac    Number,
                   pDate       Date,
                   pVrachID    Number) is
    vIbId    Number;
  begin
    select max(fk_id)
      into vIbId
      from asu.tib
     where fk_pacid = pPacID
       and fk_smid = pSmidPac
       and fk_smeditid = pSmidPac;
    if (vIbId is null) then
      insert into asu.tib
        (fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date)
      values
        (pPacID, pSmidPac, pSmidPac, pVrachID, pDate);
    else
      update asu.tib i
         set i.fd_date = pDate, i.fk_vrachid = pVrachID
       where fk_id = vIbId;
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoNumber(pPacID      Number,
                     pSmidSynOsm Varchar2,
                     pSmidSynPac Varchar2,
                     pNazOsmotr  Number) is
    vNumber Number;
  begin
    DoNumber(pPacID, pSmidSynOsm, pSmidSynPac, pNazOsmotr, vNumber, true);
  end;

  ----------------------------------------------------------------
  procedure DoNumber(pPacID      Number,
                     pSmidSynOsm Varchar2,
                     pSmidSynPac Varchar2,
                     pNazOsmotr  Number,
                     pNumber     OUT Number,
                     pDoUpdate   boolean) is
    vVrachID number;
    vSmidOsm Number;
    vSmidPac Number;
    vNumber  Number;
  begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);
    vSmidPac := stat.pkg_statutil.get_smidid(pSmidSynPac);

    select max(i.fn_num), max(i.fk_vrachid)
      into vNumber, vVrachID
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smid = vSmidOsm;

    pNumber := vNumber;

    if (vNumber is not null) and (pDoUpdate) then
      DoInsNumber(pPacID,vSmidPac,vVrachID,vNumber);
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoInsNumber(pPacID      Number,
                     pSmidId     Number,
                     pVrach      Number,
                     pNumber     Number) is
    vIbId    Number;
  begin
    select max(fk_id)
      into vIbId
      from asu.tib
     where fk_pacid = pPacID
       and fk_smid = pSmidId
       and fk_smeditid = pSmidId;
    if (vIbId is null) then
      insert into asu.tib
        (fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fn_num)
      values
        (pPacID, pSmidID, pSmidID, pVrach, pNumber);
    else
      update asu.tib i
         set i.fn_num = pNumber, i.fk_vrachid = pVrach
       where fk_id = vIbId;
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoEdit(pPacID      Number,
                   pSmidSynOsm Varchar2,
                   pSmidSynPac Varchar2,
                   pNazOsmotr  Number) is
    vEdit Varchar2(4000);
  begin
    DoEdit(pPacID, pSmidSynOsm, pSmidSynPac, pNazOsmotr, vEdit, true);
  end;

  ----------------------------------------------------------------
  procedure DoEdit(pPacID      Number,
                   pSmidSynOsm Varchar2,
                   pSmidSynPac Varchar2,
                   pNazOsmotr  Number,
                   pEdit       OUT Varchar2,
                   pDoUpdate   boolean) is
    vSmidOsm Number;
    vSmidPac Number;
  begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);
    vSmidPac := stat.pkg_statutil.get_smidid(pSmidSynPac);

    DoEdit(pPacID, vSmidOsm, vSmidPac, pNazOsmotr, pEdit, pDoUpdate);
  end;

  ----------------------------------------------------------------
  procedure DoEdit(pPacID     Number,
                   pSmidIdOsm Number,
                   pSmidIdPac Number,
                   pNazOsmotr Number,
                   pEdit      OUT Varchar2,
                   pDoUpdate  boolean) is
    vVrachID number;
    vEdit    Varchar2(4000);
  begin
    select max(i.fc_char), max(i.fk_vrachid)
      into vEdit, vVrachID
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smid = pSmidIdOsm;
    pEdit := vEdit;

    if (vEdit is not null) and (pDoUpdate) then
      DoInsEdit(pPacID, pSmidIdPac, vVrachID, vEdit);
    end if;
  end;

  ----------------------------------------------------------------------------
  procedure DoInsEdit(pPacID   Number,
                      pSmid    Number,
                      pVrachID Number,
                      pChar    Varchar2) is
    vIbId Number;
  begin
    select max(fk_id)
      into vIbId
      from asu.tib
     where fk_pacid = pPacID
       and fk_smid = pSmid
       and fk_smeditid = pSmid;
    if (vIbId is null) then
      insert into asu.tib
        (fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fc_char)
      values
        (pPacID, pSmid, pSmid, pVrachID, pChar);
    else
      update asu.tib i set i.fc_char = pChar where fk_id = vIbId;
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoCombo(pPacID      Number,
                    pSmidSynOsm Varchar2,
                    pSmidSynPac Varchar2,
                    pNazOsmotr  Number) is
    vEdit varchar2(4000);
  begin
    DoCombo(pPacID, pSmidSynOsm, pSmidSynPac, pNazOsmotr, vEdit, true);
  end;

  ----------------------------------------------------------------
  procedure DoCombo(pPacID      Number,
                    pSmidSynOsm Varchar2,
                    pSmidSynPac Varchar2,
                    pNazOsmotr  Number,
                    pEdit       Out Varchar2,
                    pDoUpdate   Boolean) is
    vVrachID  number;
    vSmidOsm  Number;
    vSmidPac  Number;
   -- vCombo    Number;
    vIbId     Number;
    vEdit     Varchar2(4000);
   -- vIbId     Number;
  begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);
    vSmidPac := stat.pkg_statutil.get_smidid(pSmidSynPac);

    for c in (select i.fk_smid,
           i.fk_vrachid,
           asu.get_smidname(fk_smid) SmidName,
           fk_smeditid
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid in
       (select fk_id from asu.tsmid connect by prior fk_id = fk_owner start with fk_id = vSmidOsm)) loop

      delete from asu.tib s where s.fk_pacid = pPacID and fk_smeditid = vSmidPac and fk_smid = c.fk_smid;

      if (pDoUpdate) then
          insert into asu.tib
            (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
          values
            (pPacID, c.fk_smid, vSmidPac, vVrachID) returning fk_id into vIbId;
      end if;

      --pEdit := Get_SmidPath(c.fk_smid, vSmidOsm);
      pEdit := asu.get_smidname(c.fk_smid);
      if InStr(pEdit, VARCHAR_EDIT) > 0 then
        -- если есть ... то вместо ... подставляется строка.
        -- в tib записывается две строки: одна для varchar, другая для Edit
        DoEdit(pPacID, c.fk_smid, vSmidPac, pNazOsmotr, vEdit, false);
        if pDoUpdate then
          begin
            update asu.tib i set fn_num = trim(vEdit) where fk_id = vIbId;
          exception
            when others then
                 null;
          end;
        end if;
        pEdit := Replace(pEdit, VARCHAR_EDIT, vEdit);
      end if;

    end loop;
 /*
  select max(i.fk_smid),
           max(i.fk_vrachid),
           max(asu.get_smidname(fk_smid))
      into vCombo, vVrachID, vSmidName
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid = vSmidOsm

    if (vCombo is not null) then
      select max(fk_id)
        into vIbId
        from asu.tib
       where fk_pacid = pPacID
         and fk_smeditid = vSmidPac;

      if (pDoUpdate) then
        if (vIbId is null) then
          insert into asu.tib
            (fk_pacid, fk_smid, fk_smeditid, fk_vrachid)
          values
            (pPacID, vCombo, vSmidPac, vVrachID);
        else
          update asu.tib i
             set i.fk_smid = vCombo, i.fk_vrachid = vVrachID
           where fk_id = vIbId;
        end if;
      end if;

      pEdit := Get_SmidPath(vCombo, vSmidOsm);
      if InStr(vSmidName, VARCHAR_EDIT) > 0 then
        -- если есть ... то вместо ... подставляется строка.
        -- в tib записывается две строки: одна для varchar, другая для Edit
        DoEdit(pPacID, vCombo, vSmidPac, pNazOsmotr, vEdit, pDoUpdate);
        pEdit := Replace(pEdit, VARCHAR_EDIT, vEdit);
      end if;
    end if;*/
  end;

  ----------------------------------------------------------------
  procedure DoInsertNazEdit(pPacID     Number,
                            pNazSmidID Number,
                            pSmidKarta Number,
                            vAmbID     Number) is
    vNazText Varchar2(4000);
  begin
    select max(Replace(GET_RESULT_VALUE (tresan.fk_nazid,tresan.fk_smid),asu.get_smidname(tresan.fk_smid),''))
    into vNazText
    from asu.tresan
    where fk_id = (select max(r.fk_id) from asu.tresan r, asu.tnazan n
    where r.fk_pacid = vAmbID and n.fk_smid = pNazSmidID and r.fl_zakl <> 1
          and n.fk_id = r.fk_nazid and asu.get_vipnaz = n.fk_nazsosid);

    if vNazText is not null then
      DoInsEdit(pPacID,pSmidKarta,null,vNazText);
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoInsertNazEdit2(pPacID     Number,
                            pNazSmidID Number,
                            pSmidKarta Number,
                            vAmbID     Number) is
    vNazText Varchar2(4000);
  begin
    select max(rr.fc_res)
    into vNazText
    from asu.tresan rr
    where fk_id = (select max(r.fk_id)
    from asu.tresan r,asu.tnazan n where r.fk_smid = pNazSmidID
    and r.fk_pacid = vAmbID and n.fk_id = r.fk_nazid and asu.get_vipnaz = n.fk_nazsosid);

    if vNazText is not null then
      DoInsEdit(pPacID,pSmidKarta,null,vNazText);
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoInsertNazEdit3(pPacID     Number,
                            pNazSmidID Number,
                            pSmidKartaChar Number,
                            pSmidKartaDate Number,
                            vAmbID     Number) is
    vNazText Varchar2(4000);
    vDate    Date;
  begin
    -- 14.10.2009 Ефимов В.А.
/*  Изменено по аналогии с DoInsertNazEdit (её менял Дима Кульбацкий)
    select max(Replace(get_anal_result_by_naz (rr.fk_nazid),asu.get_smidname(rr.fk_smid),''))
    into vNazText
    from asu.tresan rr
    where fk_id = (select max(r.fk_id)
    from asu.tresan r,asu.tnazan n where r.fk_smid = pNazSmidID
    and r.fk_pacid = vAmbID and n.fk_id = r.fk_nazid and asu.get_vipnaz = n.fk_nazsosid);
*/
    select max(Replace(GET_RESULT_VALUE(tresan.fk_nazid, tresan.fk_smid),
                       asu.get_smidname(tresan.fk_smid),
                       '')), Max(tresan.fd_ins)
      into vNazText, vDate
      from asu.tresan
     where fk_id = (select max(r.fk_id)
                      from asu.tresan r, asu.tnazan n
                     where r.fk_pacid = vAmbID
                       and n.fk_smid = pNazSmidID
                       and r.fl_zakl <> 1
                       and n.fk_id = r.fk_nazid
                       and asu.get_vipnaz = n.fk_nazsosid);

    if vNazText is not null then
       DoInsEdit(pPacID,pSmidKartaChar,null,vNazText);
       DoDate(pPacID,pSmidKartaDate,vDate,null);
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoInsertFluoro(pPacID     Number,
                            vAmbID     Number) is
    vNazText Varchar2(4000);
    vDate    Date;
--    FLUORU_NUM number := stat.pkg_statutil.GET_SMIDID('XRAY_FLU_NUMBER');
    FLUOROGRAPH_1PROEKCIA number := stat.pkg_statutil.GET_SMIDID('FLUOROGRAPH_1PROEKCIA');

    RGraph_Pac Number := stat.pkg_statutil.get_smidid('FLUOROGRAFIYA');
    RGraph_PacData Number := stat.pkg_statutil.get_smidid('DAT_FLUOROGRAF');

    vOldPacID Number;
  begin
    -- 14.10.2009 Ефимов В.А. Заменил процедуру поиска на ту что используется
    --   в окне "Протокол" (вызывается из "Журнал врача")
  /*
    select max(i.fc_char), max(rr.fd_run)
    into vNazText, vDate
    from asu.tnazis rr,asu.tib i
    where rr.fk_id = (select max(r.fk_id)
    from asu.tnazis r where r.fk_smid = FLUOROGRAPH_1PROEKCIA
    and r.fk_pacid = vAmbID and asu.get_vipnaz = r.fk_nazsosid)
    and i.fk_pacid = rr.fk_id
    and i.fk_smid = FLUORU_NUM;
  */
    select max(r.fk_id)
      into vOldPacID
      from asu.tnazis r
     where r.fk_smid = FLUOROGRAPH_1PROEKCIA
       and r.fk_pacid = vAmbID
       and asu.get_vipnaz = r.fk_nazsosid;

    SELECT MAX(FC_CHAR) into vNazText
              FROM TIB
             WHERE FK_PACID = vOldPacID
               AND FK_SMID IN (SELECT FK_ID
                                 FROM TSMID
                                WHERE FC_SYNONIM = 'NUMBER_ISSL'
                                   OR FC_SYNONIM = 'XRAY_FLU_NUMBER');

    SELECT Max(FD_RUN) into vDate
      FROM TNAZIS
     WHERE FK_ID = vOldPacID;

    if vNazText is not null then
       DoInsEdit(pPacID,RGraph_Pac,null,vNazText);
       DoDate(pPacID,RGraph_PacData,vDate,null);
    end if;
  end;

  ----------------------------------------------------------------
  function Get_SmidPath(pFromID Number, pToId Number) return Varchar2 is
    v_res varchar2(4000);
  begin
    for c in (select fk_id, fc_name
                from asu.tsmid
              connect by prior fk_owner = fk_id
               start with fk_id = pFromID
               order by level desc) loop
      if c.fk_id = pToId then
        return v_res;
      end if;
      v_res := v_res || ' '||c.fc_name;
    end loop;
  end;

  ----------------------------------------------------------------
  procedure DoInsertVarchar2(pVC2Smid Number, pPeopleID Number, pToPacID Number) is
  begin
    insert into tib(fc_char, fn_num, fk_bid, fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date)
    (
      select
        t_tib.fc_char, t_tib.fn_num, t_tib.fk_bid, pToPacID fk_pacid, t_tib.fk_smid, pVC2Smid fk_smeditid, null fk_vrachid, t_tib.fd_date
      from asu.tib t_tib
      left join asu.tsmid ts on ts.fk_id = t_tib.fk_smid
      where t_tib.fk_pacid = pkg_inspectioncopy.GET_OLDES_VARCHAR2_PACID(pVC2Smid, pPeopleID)
        and t_tib.fk_smeditid in
            (-- Выбор всех полей связанных с полем типа varchar2
              SELECT T.FK_ID FROM ASU.TSMID T where t.fl_del = 0
              connect by prior t.fk_id = t.fk_owner start with t.fk_id  = pVC2Smid
            )
    );
  end;

end pkg_RodiData;
/

SHOW ERRORS;


