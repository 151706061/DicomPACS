DROP PACKAGE BODY ASU.PKG_USLUGI
/

--
-- PKG_USLUGI  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_USLUGI" IS
  -----------------------------------
  --Create    by XANDER 07.04.2006 --
  --Modified  by XANDER 07.04.2006 --
  -----------------------------------


  --цена услуги на определённое число
  FUNCTION GET_USLUGA_COST(PDATE DATE, PHEALID NUMBER) RETURN NUMBER IS
    NRES NUMBER;
  BEGIN
    FOR C IN (SELECT MAX(FN_COST) CNT
                FROM ASU.THEAL_COST
               WHERE THEAL_COST.FK_HEALID = PHEALID
                 AND ((PDATE BETWEEN THEAL_COST.FD_DATE1 AND
                     THEAL_COST.FD_DATE2) OR (THEAL_COST.FD_DATE1 < PDATE AND
                     THEAL_COST.FD_DATE2 IS NULL))) LOOP
      NRES := C.CNT;
    END LOOP;
    RETURN NVL(NRES, 0);
  END;

  ----------------------------------------------------------------------------------

  FUNCTION GET_HEAL_COST(pHealid NUMBER, pDate DATE DEFAULT SYSDATE, pCompanyid NUMBER default -1) RETURN NUMBER IS
  -- Created 20070329 by Linnikov
  -- Возвращает стоимость тарифа по коду на дату
    nRes NUMBER;
  BEGIN
    FOR C IN (SELECT MAX(FN_COST) CNT
                FROM ASU.THEAL_COST
               WHERE THEAL_COST.FK_HEALID = pHealid
                 AND pDate BETWEEN trunc(THEAL_COST.FD_DATE1) AND trunc(NVL(THEAL_COST.FD_DATE2, SYSDATE)) + 1 - 1/60/60/24
                 AND NVL(THEAL_COST.FK_COMPANYID,-1) = decode(pCompanyid, -1, NVL(THEAL_COST.FK_COMPANYID,-1), pCompanyid))
    LOOP
      nRes := C.CNT;
    END LOOP;
    RETURN NVL(nRes, 0);
  END;
  ----------------------------------------------------------------------------------

  FUNCTION GET_HEAL_COST_STRAH(pHealid  NUMBER,
                               pCompanyID number,
                               pDate    DATE DEFAULT SYSDATE) RETURN NUMBER IS
    nRes NUMBER;
  BEGIN
    FOR C IN (SELECT MAX(FN_COST) CNT
                FROM ASU.THEAL_COST
               WHERE THEAL_COST.FK_HEALID = pHealid
                 AND THEAL_COST.FK_COMPANYID = pCompanyID
                 AND pDate BETWEEN THEAL_COST.FD_DATE1 AND
                     NVL(THEAL_COST.FD_DATE2, SYSDATE)) LOOP
      nRes := C.CNT;
    END LOOP;
    RETURN NVL(nRes, 0);
  END;

  ----------------------------------------------------------------------------------

  FUNCTION GET_SMID_COST(pSmidID IN NUMBER,
                         pDate   IN DATE DEFAULT SYSDATE) RETURN NUMBER IS
    -- Created 20100702 by Kashira
    -- Возвращает стоимость тарифа по коду назначения (из TSMID) на выбранную дату
    nRes NUMBER;
    v_HealID NUMBER;
  BEGIN
    SELECT MAX(FK_HEAL) INTO v_HealID
    FROM ASU.THEAL_SMID HS, ASU.THEAL H
    WHERE HS.FK_SMID = pSmidID
          AND HS.FK_HEAL = H.FK_ID
          AND H.FK_PARENT = ASU.GET_PLATUSLUG;

    FOR C IN (SELECT MAX(FN_COST) CNT
                FROM ASU.THEAL_COST
               WHERE THEAL_COST.FK_HEALID = v_HealID
                 AND pDate BETWEEN THEAL_COST.FD_DATE1 AND
                     NVL(THEAL_COST.FD_DATE2, SYSDATE)) LOOP
      nRes := C.CNT;
    END LOOP;
    RETURN NVL(nRes, 0);
  END;

  FUNCTION GET_HEAL_CODE_BY_HEALID(pHealID IN NUMBER) RETURN VARCHAR2 IS
    -- Created 20100702 by Kashira
    -- Возвращает код тарифа по коду (из THEAL)
  BEGIN
    FOR C IN (SELECT CODE FROM ASU.THEAL H WHERE H.FK_ID = pHealID) LOOP
      RETURN C.CODE;
    END LOOP;
    RETURN '';
  END;

  ----------------------------------------------------------------------------------

  FUNCTION GET_HEAL_CODE(pSmidID IN NUMBER) RETURN VARCHAR2 IS
    -- Created 20100702 by Kashira
    -- Возвращает название тарифа по коду назначения (из TSMID)
  BEGIN
    FOR C IN (SELECT CODE FROM ASU.THEAL_SMID HS, ASU.THEAL H
              WHERE HS.FK_SMID = pSmidID
                    AND HS.FK_HEAL = H.FK_ID
                    AND H.FK_PARENT = ASU.GET_PLATUSLUG) LOOP
      RETURN C.CODE;
    END LOOP;
    RETURN '';
  END;

  ----------------------------------------------------------------------------------

  FUNCTION GET_HEAL_ID(pSmidID IN NUMBER) RETURN NUMBER IS
    -- Created 20100706 by Kashira
    -- Возвращает ID тарифа по коду назначения (из TSMID)
  BEGIN
    FOR C IN (SELECT H.FK_ID FROM ASU.THEAL_SMID HS, ASU.THEAL H
              WHERE HS.FK_SMID = pSmidID
                    AND HS.FK_HEAL = H.FK_ID
                    AND H.FK_PARENT = ASU.GET_PLATUSLUG) LOOP
      RETURN C.FK_ID;
    END LOOP;
    RETURN -1;
  END;

  ----------------------------------------------------------------------------------


  ----------------------------------------------------------------------------------

  function get_pac_paytype(ppacid number, pnazid number) return number is
    -- created 180310 by a.nakorjakov
    -- возвращает вид оплаты, по которому проходит пациент
    v_res asu.ttypedoc.fk_id%type;
  begin
    for c in (select max(td.fk_id) fk_id
                from asu.tambtalon     a,
                     asu.tambtalon_naz an,
                     asu.tinsurdocs    ii,
                     asu.ttypedoc      td
               where an.fk_nazid = pnazid
                 and an.fk_talonid = a.fk_id
                 and a.fk_insuranceid = ii.fk_id
                 and td.fk_id = ii.fk_typedocid) loop
      v_res := c.fk_id;
    end loop;

    if (v_res is null) then
      for c in (select max(td.fk_id) fk_id
                  from asu.tinsurdocs     ii,
                       asu.tpac_insurance pi,
                       asu.ttypedoc       td,
                       asu.tkarta kk
                 where ii.fk_id = pi.fk_insurdocid
                   and pi.fk_pacid = kk.fk_id
                   and td.fk_id = ii.fk_typedocid
                   and kk.fk_id = ppacid ) loop
        v_res := c.fk_id;
      end loop;
    end if;

    if (v_res is null) then
      for c in (select max(td.fk_id) fk_id
                  from asu.tinsurdocs     ii,
                       asu.tpac_insurance pi,
                       asu.ttypedoc       td,
                       asu.tambulance kk
                 where ii.fk_id = pi.fk_insurdocid
                   and pi.fk_pacid = kk.fk_id
                   and td.fk_id = ii.fk_typedocid
                   and kk.fk_id = ppacid ) loop
        v_res := c.fk_id;
      end loop;
    end if;


   return v_res;
  end;

  ----------------------------------------------------------------------------------
  function get_paytype_syn(ppaytypeid  asu.ttypedoc.fk_id %type) return asu.ttypedoc.fc_synonim %type is
  begin
    for c in (select * from asu.ttypedoc d where d.fk_id = ppaytypeid) loop
      return c.fc_synonim;
    end loop;
    return '';
  end;

  ----------------------------------------------------------------------------------
  function get_pac_paytype_syn(ppacid number, pnazid number) return asu.ttypedoc.fc_synonim %type is
  begin
    return get_paytype_syn(get_pac_paytype(ppacid,pnazid));
  end;

  ----------------------------------------------------------------------------------
  function get_rootheal(psynonim asu.ttypedoc.fc_synonim %type) return number is
  begin
    if (psynonim = 'OMS') then
       return asu.get_omsheal;
    elsif (psynonim = 'KOMERC') then
       return asu.get_nalheal;
    elsif (psynonim = 'DMS') then
       return asu.get_dmsheal;
    elsif (psynonim = 'BUDZHET') then
       return asu.get_budzhetheal;
    elsif (psynonim = 'DOGOVOR') then
       return asu.get_dogovorheal;
    end if;
    -- added by Igor Galtsev
    return 0;
    --
  end;

  ----------------------------------------------------------------------------------
  function get_pac_paytype_root(ppacid number, pnazid number) return number is
  begin
    return get_rootheal(get_paytype_syn(get_pac_paytype(ppacid,pnazid)));
  end;

  ----------------------------------------------------------------------------------
  function get_cost_sr(psmidid asu.tsmid.fk_id %type,
                        proothealid asu.theal.fk_id %type,
                        pDate    date default sysdate) return number
  is
  begin
     for c in (select min(sm.fk_heal) fk_id from asu.theal_smid sm,
                 (select h.fk_id from asu.theal h connect by prior h.fk_id = h.fk_parent start with h.fk_parent = proothealid) q
               where sm.fk_smid = psmidid
                       and sm.fk_heal = q.fk_id) loop
        return GET_HEAL_COST(c.fk_id,pDate);
     end loop;
     return 0;
  end;

  ----------------------------------------------------------------------------------
  function get_cost_snp(psmidid asu.tsmid.fk_id %type,
                        pnazid asu.vnaz.fk_id%type,
                        ppacid asu.vnaz.fk_id%type,
                        pDate    date default sysdate) return number
  is
  begin
     return get_cost_sr(psmidid,get_pac_paytype_root(ppacid,pnazid),pDate);
  end;

  ----------------------------------------------------------------------------------
  function get_naz_cost(pnazid asu.vnaz.fk_id%type) return number
  is
  begin
     for c in (select * from asu.vnaz where fk_id = pnazid) loop
       return get_cost_snp(c.fk_smid,c.fk_id,c.fk_pacid,c.fd_run);
     end loop;
     return 0;
  end;

  ----------------------------------------------------------------------------------
  function get_heal_cost_paytype(pnazid asu.vnaz.fk_id%type,proothealid asu.theal.fk_id %type) return number
  is
  begin
     for c in (select * from asu.vnaz where fk_id = pnazid) loop
         return get_cost_sr(c.fk_smid,proothealid,c.fd_run);
     end loop;
     return 0;
  end;


--------------------------------------------------------------------------------
-- Added By Kulechek
--------------------------------------------------------------------------------
--TYPE THealRoot IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

function get_heal_type(psynonim asu.ttypedoc.fk_id %type) return NUMBER is
begin
  if psynonim = 2 or psynonim = 21 or psynonim = 41 then
    for c in (SELECT FK_ID FROM ASU.ttypedoc where fc_synonim = 'KOMERC') loop
        return c.fK_id;
    end loop;
   end if;

  if psynonim = 1 or psynonim = 4  then
    for c in (SELECT FK_ID FROM ASU.ttypedoc where fc_synonim = 'OMS') loop
        return c.fK_id;
    end loop;
   end if;
  return psynonim;
end;

----------------------------------------------------------------------------------
function get_heal_type_oms_bud_plat(psynonim asu.ttypedoc.fk_id %type) return NUMBER is
begin
  if psynonim = 2 or psynonim = 21 or psynonim = 41 then
    for c in (SELECT FK_ID FROM ASU.ttypedoc where fc_synonim = 'KOMERC') loop
        return c.fK_id;
    end loop;
   end if;

  if psynonim = 1 then
    for c in (SELECT FK_ID FROM ASU.ttypedoc where fc_synonim = 'OMS') loop
        return c.fK_id;
    end loop;
   end if;

  if psynonim = 4 then
    for c in (SELECT FK_ID FROM ASU.ttypedoc where fc_synonim = 'BUDZHET') loop
        return c.fK_id;
    end loop;
   end if;
  return psynonim;
end;
----------------------------------------------------------------------------------
-------------------Функция для SK чтобы считать стоимость услуг по сертификатам created by Marriage at 05.03.2011
----------------------------------------------------------------------------------
FUNCTION GET_PLAT_SMID_COST(pSmid IN NUMBER,pDate in date) RETURN NUMBER is
    nHealCost NUMBER := 0;

    Cursor GetPacPlatUsl IS

     select FN_COST from (
        SELECT --ROW_NUM() PARTITION (ORDER BY theal.FK_ID DESC)
               ROW_NUMBER() over ( order by theal.FK_ID DESC) as RN,theal_cost.FN_COST
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
           --  ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = 21
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null) T where T.RN = 1;
begin
   Open GetPacPlatUsl;
   Fetch GetPacPlatUsl into nHealCost;
   Close GetPacPlatUsl;


   Return nHealCost;
end;
----------------------------------------------------------------------------------

FUNCTION GET_PLAT_TALON_COST(pTalonid IN NUMBER, pFK_ID in number) RETURN NUMBER is
  nHealCost NUMBER := 0;

  --НАходим стоимость всех услуг по текущему талону и другими, которые оказаны по данному полису
  cursor GetPacPlatUsl is
    select SUM(pkg_uslugi.GET_PLAT_SMID_COST(TNAzkons.fk_smid, TNAzkons.fd_run)) as FN
      from ASU.TNAzkons , asu.Tambtalon_naz, (select FK_INSURANCEID from ASU.TAMBTALON where TAMBTALON.FK_ID = pTalonid) Talon,
           asu.TAMBTALON
     where Tambtalon.FK_INSURANCEID = Talon.FK_INSURANCEID
       and tambtalon_naz.FK_TALONID = Tambtalon.FK_ID
       and TNAzkons.FK_ID = tambtalon_naz.FK_NAZID
       and TNAzkons.FK_NAZSOSID = asu.get_vipnaz
       and TNAzkons.FK_ID <> pFK_ID;
begin
  Open GetPacPlatUsl;
  Fetch GetPacPlatUsl into nHealCost;
  Close GetPacPlatUsl;

  Return nHealCost;
end;


----------------------------------------------------------------------------------

FUNCTION GET_HEAL_ID_BY_SMID(pSmid IN NUMBER, ppacid IN NUMBER,pDate in date, pUseDefUslug IN NUMBER default 1) RETURN NUMBER is
    Cursor GetPacOMSDety(pDocType IN NUMBER) IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST
             --ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null
              and theal.CODE like 'TPD%';

    Cursor GetPacOMSVzrosl(pDocType IN NUMBER)  IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
            -- ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
             -- and
             pSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null
              and theal.CODE like 'TPV%';

    Cursor GetPacDMS(pDocType IN NUMBER) IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
            -- ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null;


    Cursor GetPacPlatUsl IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
           --  ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = 21
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null;

   -- Cursor GetNazDate is
   --    Select FD_Run from ASU.Vnaz where FK_ID = pnazid;

    nHealType NUMBER;
    nPacTypeDoc Number;
    nPacAge Number;
    nNazDate Date;
    nHealID NUMBER;
begin
    --nPacTypeDoc := get_pac_paytype(ppacid, pnazid);
    nHealType := get_heal_type(get_pac_paytype(ppacid, -152));
    nNazDate := pDate;
    if (nHealType = 1) then
       --  Open GetNazDate;
       --  Fetch GetNazDate INTO nNazDate;
       --  Close GetNazDate;

        nPacAge := asu.pkg_regist_pacfunc.get_pac_age_date(ppacid, nNazDate);
        if  (nPacAge < 18) then
            open GetPacOMSDety(nHealType);
            Fetch GetPacOMSDety into nHealID;
            Close GetPacOMSDety;
        else
            open GetPacOMSVzrosl(nHealType);
            Fetch GetPacOMSVzrosl into nHealID;
            Close GetPacOMSVzrosl;
        end if;
    end if;


    if (nHealType = 21) then
        Open GetPacDMS(nHealType);
        Fetch GetPacDMS into nHealID;
        Close GetPacDMS;
    end if;

    If pUseDefUslug = 1 then
      if (nHealID is null) then
        Open GetPacPlatUsl;
        Fetch GetPacPlatUsl into nHealID;
        Close GetPacPlatUsl;
      end if;
    end if;

    Return nHealID;
end;
----------------------------------------------------------------------------------
FUNCTION GET_HEAL_ID_BY_NAZ(pnazid IN NUMBER, ppacid IN NUMBER, pUseDefUslug IN NUMBER default 1) RETURN NUMBER is
    Cursor GetPacOMSDety(pDocType IN NUMBER) IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.vnaz,
              ASU.THEAL_COST
        WHERE vnaz.fk_id = pnazid
              and vnaz.fk_smid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and vnaz.FD_RUN BETWEEN FD_DATE1 AND NVL(FD_DATE2, vnaz.FD_RUN)
              and FN_COST is not null
              and CODE is not null
              and theal.CODE like 'TPD%';

    Cursor GetPacOMSVzrosl(pDocType IN NUMBER)  IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.vnaz,
             ASU.THEAL_COST
        WHERE vnaz.fk_id = pnazid
              and vnaz.fk_smid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and vnaz.FD_RUN BETWEEN FD_DATE1 AND NVL(FD_DATE2, vnaz.FD_RUN)
              and FN_COST is not null
              and CODE is not null
              and theal.CODE like 'TPV%';
    
    Cursor GetPacOMSNotKons(pDocType IN NUMBER)  IS -------------
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.vnaz,
             ASU.THEAL_COST
        WHERE vnaz.fk_id = pnazid
              and vnaz.fk_smid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and vnaz.FD_RUN BETWEEN FD_DATE1 AND NVL(FD_DATE2, vnaz.FD_RUN)
              and FN_COST is not null;

    Cursor GetPacDMS(pDocType IN NUMBER) IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.vnaz,
             ASU.THEAL_COST
        WHERE vnaz.fk_id = pnazid
              and vnaz.fk_smid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and vnaz.FD_RUN BETWEEN FD_DATE1 AND NVL(FD_DATE2, vnaz.FD_RUN)
              and FN_COST is not null
              and CODE is not null;


    Cursor GetPacPlatUsl IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.vnaz,
             ASU.THEAL_COST
        WHERE vnaz.fk_id = pnazid
              and vnaz.fk_smid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = 21
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and vnaz.FD_RUN BETWEEN FD_DATE1 AND NVL(FD_DATE2, vnaz.FD_RUN)
              and FN_COST is not null
              and CODE is not null;

    Cursor GetNazDate is
       Select FD_Run from ASU.Vnaz where FK_ID = pnazid;
       
    Cursor GetNazRootSMID(pNazSMID IN NUMBER) is
       SELECT FK_ID FROM TSMID
        START WITH FK_ID = pNazSMID
        CONNECT BY FK_ID = PRIOR FK_OWNER
        ORDER BY LEVEL DESC;

    nHealType NUMBER;
    nPacTypeDoc Number;
    nPacAge Number;
    nNazDate Date;
    nHealID NUMBER;
    
    nRootSMID number;--------------
    nNazSMID number;
begin
    --nPacTypeDoc := get_pac_paytype(ppacid, pnazid);
    nHealType := get_heal_type(get_pac_paytype(ppacid, pnazid));

    if (nHealType = 1) then
        Open GetNazDate;
        Fetch GetNazDate INTO nNazDate;
        Close GetNazDate;
        
        SELECT FK_SMID INTO nNazSMID FROM VNAZ WHERE FK_ID = pnazid;
        open GetNazRootSMID(nNazSMID);
        Fetch GetNazRootSMID into nRootSMID;
        Close GetNazRootSMID;
        
        if nRootSMID = GET_KONSID then --Консультации смотрим по кодам услуг для ОМС
           nPacAge := asu.pkg_regist_pacfunc.get_pac_age_date(ppacid, nNazDate);
           if  (nPacAge < 18) then
              open GetPacOMSDety(nHealType);
              Fetch GetPacOMSDety into nHealID;
              Close GetPacOMSDety;
           else
              open GetPacOMSVzrosl(nHealType);
              Fetch GetPacOMSVzrosl into nHealID;
              Close GetPacOMSVzrosl;
           end if;
        else -- Для остальных назначений по полису ОМС код не важен
           open GetPacOMSNotKons(nHealType);
           Fetch GetPacOMSNotKons into nHealID;
           Close GetPacOMSNotKons;        
        end if;
    end if;


    if (nHealType = 21) then
        Open GetPacDMS(nHealType);
        Fetch GetPacDMS into nHealID;
        Close GetPacDMS;
    end if;

    If pUseDefUslug = 1 then
      if (nHealID is null) then
        Open GetPacPlatUsl;
        Fetch GetPacPlatUsl into nHealID;
        Close GetPacPlatUsl;
      end if;
    end if;

    Return nHealID;
end;


FUNCTION GET_HEAL_ID_BY_OPER(pnazid IN NUMBER, ppacid IN NUMBER, pOperSmid IN NUMBER, pDate in date, pUseDefUslug IN NUMBER default 1) RETURN NUMBER
  IS
    Cursor GetPacOMSDety(pDocType IN NUMBER) IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST
             --ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pOperSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null
              and theal.CODE like 'TPD%';

    Cursor GetPacOMSVzrosl(pDocType IN NUMBER)  IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
            -- ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
             -- and
             pOperSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null
              and theal.CODE like 'TPV%';

    Cursor GetPacDMS(pDocType IN NUMBER) IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
            -- ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pOperSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null;


    Cursor GetPacPlatUsl IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
           --  ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pOperSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = 21
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null;

    Cursor GetDSOperHOKO IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST
        WHERE theal_smid.fk_smid = pOperSmid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = -1     
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate);

    Cursor GetNazDate is
       Select FD_Run from ASU.Vnaz where FK_ID = pnazid;

    nHealType NUMBER;
    nPacTypeDoc Number;
    nPacAge Number;
    nNazDate Date;
    nHealID NUMBER;
begin
    --nPacTypeDoc := get_pac_paytype(ppacid, pnazid);
    nHealType := get_heal_type(get_pac_paytype(ppacid, pnazid));

    if (nHealType = 1) then
        Open GetNazDate;
        Fetch GetNazDate INTO nNazDate;
        Close GetNazDate;

        nPacAge := asu.pkg_regist_pacfunc.get_pac_age_date(ppacid, nNazDate);
        if (nPacAge < 18) then
            open GetPacOMSDety(nHealType);
            Fetch GetPacOMSDety into nHealID;
            Close GetPacOMSDety;
        else
            open GetPacOMSVzrosl(nHealType);
            Fetch GetPacOMSVzrosl into nHealID;
            Close GetPacOMSVzrosl;
        end if;
    end if;


    if (nHealType = 21) then
        Open GetPacDMS(nHealType);
        Fetch GetPacDMS into nHealID;
        Close GetPacDMS;
    end if;

    If pUseDefUslug = 1 then
      if (nHealID is null) then
        Open GetPacPlatUsl;
        Fetch GetPacPlatUsl into nHealID;
        Close GetPacPlatUsl;
      end if;
    end if;
    
    if (nHealID is null) then
      Open GetDSOperHOKO;
      Fetch GetDSOperHOKO into nHealID;
      Close GetDSOperHOKO;
    end if;

    Return nHealID;
end;

----------------------------------------------------------------------------------
function GetDiagByNazWithStac(pNazID in NUMBER, pPacID IN NUMBER) RETURN NUMBER is
    cursor cGetAmbDiag IS
     --   select NVL(MAX(fk_id), -1) fk_id
     --   FROM (
        SELECT NVL(MAX(dd.fk_id), -1) fk_id --,
                    -- dd.FK_NAZID
              from asu.tambtalon     tt,
                   asu.tdiag         dd,
                   asu.tambtalon_naz an
              where an.fk_nazid = pNazID
                    and dd.fk_id = tt.fk_diagmain
                    and tt.fk_id = an.fk_talonid;
     --               )
     --   WHERE FK_NAZID = pNazID;

    cursor cGetStacDiag IS
        SELECT NVL(MAX(tdiag.fk_id), -1)  fk_id
        FROM tdiag,
             tsmid,
             tkarta,
             TPERESEL,
             ASU.TEDIT_STATKART
       --      vnaz v
        WHERE (tsmid.fl_del <> 1 or tsmid.fl_del is null)
              and tkarta.fk_id = pPacID
              and tdiag.fk_mkb_10 = tsmid.fk_id
              and tdiag.fk_pacid =tkarta.fk_id
              and tsmid.fk_id=tdiag.fk_smdiagid
              AND tdiag.fl_main=STAT.PKG_STATUTIL.get_smidid('MAIN')
              AND tdiag.fp_type=STAT.PKG_STATUTIL.get_smidid('PRI_VYPISKE')
              AND TEDIT_STATKART.fk_pacid = pPacID
              and TEDIT_STATKART.FK_ID = (SELECT MAX(T.FK_ID) FROM ASU.TEDIT_STATKART T WHERE T.FK_PACID = tkarta.fk_id)
              AND TPERESEL.FK_PACID = TKARTA.FK_ID
         order by tdiag.fd_date;
    nRes NUMBER;
begin
    nRes := -1;
    for c in cGetAmbDiag loop
        nRes := c.fk_id;
    end loop;

    if not (nRes > 0) then
        for c in cGetStacDiag loop
            nREs := c.FK_ID;
        end loop;
    end if;
    Return nREs;
end;

----------------------------------------------------------------------------------
function GetDiagByNaz(pNazID in NUMBER, pPacID IN NUMBER) RETURN NUMBER is
    cursor cGetAmbDiag IS
--        select NVL(MAX(fk_id), -1) fk_id
--        FROM (
              SELECT NVL(MAX(dd.fk_id), -1) fk_id--,
                 --    dd.FK_NAZID
              from asu.tambtalon     tt,
                   asu.tdiag         dd,
                   asu.tambtalon_naz an
              where an.fk_nazid = pNazID
                    and dd.fk_id = tt.fk_diagmain
                    and tt.fk_id = an.fk_talonid;
  --                  )
  --      WHERE FK_NAZID = pNazID;

    cursor cGetStacDiag IS
        SELECT NVL(MAX(tdiag.fk_id), -1)  fk_id
        FROM tdiag,
             tsmid,
             tkarta,
             TPERESEL,
             TDOCOBSL,
             ASU.TEDIT_STATKART
       --      vnaz v
        WHERE (tsmid.fl_del <> 1 or tsmid.fl_del is null)
              and tkarta.fk_id = pPacID
              and tdiag.fk_mkb_10 = tsmid.fk_id
              and tdiag.fk_pacid =tkarta.fk_id
              and tsmid.fk_id=tdiag.fk_smdiagid
              AND tdiag.fl_main=STAT.PKG_STATUTIL.get_smidid('MAIN')
              AND tdiag.fp_type=STAT.PKG_STATUTIL.get_smidid('PRI_VYPISKE')
              AND TEDIT_STATKART.fk_pacid = pPacID
              and TEDIT_STATKART.FK_ID = (SELECT MAX(T.FK_ID) FROM ASU.TEDIT_STATKART T WHERE T.FK_PACID = tkarta.fk_id)
              AND TPERESEL.FK_PACID = TKARTA.FK_ID
              AND TPERESEL.FK_DOCOBSLID = TDOCOBSL.FK_ID
              AND TDOCOBSL.FK_VIDDOCID  IN (SELECT FK_ID
                                            FROM TUSLVID
                                            START WITH FK_ID IN (SELECT FN_CONST
                                                                 FROM TCONST
                                                                 WHERE FC_FUNC = 'DOC_IBDS_STAC' OR FC_FUNC = 'DOC_IB_DS')
                                                                 CONNECT BY PRIOR FK_ID = FK_OWNERID
                                                                 );



    nRes NUMBER;
begin
    nRes := -1;
    for c in cGetAmbDiag loop
        nRes := c.fk_id;
    end loop;

    if not (nRes > 0) then
        for c in cGetStacDiag loop
            nREs := c.FK_ID;
        end loop;
    end if;
    Return nREs;
end;

----------------------------------------------------------------------------------
function GetNaprUch(pNAzid IN NUMBER, pPacID IN NUMBER, pSMID IN NUMBER DEFAULT 0) RETURN NUMBER IS

    CURSOR cGetVal IS
        SELECT COUNT(1) cnt
        FROM ASU.TIB
        WHERE FK_SMID = pSMID
              AND tib.FK_PACID IN  (select an.fk_talonid
                                    from asu.tambtalon_naz an
                                    where an.fk_nazid = pNAzid
                                    union all
                                    select kk.fk_id
                                    from asu.tkarta kk
                                    where kk.fk_id = pPacID);

    nRes NUMBER;
begin
    nREs := 0;
    FOR C IN cGetVal loop
        nREs := c.cnt;
    end loop;
    Return nRes;
END;

----------------------------------------------------------------------------------
function GetNaprUchID(pNAzid IN NUMBER, pPacID IN NUMBER) RETURN NUMBER IS

    CURSOR cGetVal IS
        SELECT MAX(FK_SMID) FK_SMID
        FROM ASU.TIB
        WHERE fk_smeditid = (select max(fk_id)
                                  from tsmid t
                                  where t.fc_synonim = 'PD_NAPRAVIV_YCH')
              AND tib.FK_PACID IN  (select an.fk_talonid
                                    from asu.tambtalon_naz an
                                    where an.fk_nazid = pNAzid
                                    union all
                                    select kk.fk_id
                                    from asu.tkarta kk
                                    where kk.fk_id = pPacID
                                    union all
                                    select pNAzid from dual);

    nRes NUMBER;
begin
    nREs := -1;
    FOR C IN cGetVal loop
        nREs := c.FK_SMID;
    end loop;
    Return nvl(nRes, 0);
END;

----------------------------------------------------------------------------------
function GetMestGit(pPacID IN NUMBER, pAdrType in number default 62) RETURN NUMBER IS -- Добавил параметр pAdrType
    CURSOR cGetKladr IS
       SELECT FK_KLADR
       FROM ASU.tadress
       WHERE FK_ID = PKG_REGIST_PACFUNC.GET_PAC_ADRID(pPacID, pAdrType); -- ТЕПЕРЬ БЕРУ ПО Место жительства

    CURSOR cGetVal(pKladr IN NUMBER) IS
       SELECT Max(FK_ID) FK_ID
       FROM ASU.TKLADR
       WHERE FK_ID IN (75, 2735, 1736)
       START WITH FK_ID = pKladr
       connect by prior fK_owner = fK_id;
/*2735  - Г.Сурут
75 - ХМАО
1736 Сургутский р-н
*/
    nKladr NUMBER;
    nRes NUMBER;
begin
    nKladr := -1;
    nRes := -1;
    FOR C IN cGetKladr loop
        nKladr := c.FK_KLADR;
    end loop;
  -- Return nKladr;
    -- Если нет записи, возвращаем 0
    if nKladr = -1 then
        Return 4;
    end if;

    for c in cGetVal(nKladr) loop
        if c.FK_ID = 2735 then
            RETURN 1;
        end if;
        if c.FK_ID = 1736 then
            RETURN 2;
        end if;
        if c.FK_ID = 75 then
            nRes := 3;
        else
            nRes := 4;
        end if;
    end loop;

    Return nRes;

end;

----------------------------------------------------------------------------------
function GetKLADRNAME(pID IN NUMBER) RETURN VARCHAR2 IS
cRes Varchar2(100);
begin

    if pID = 1 then
        cRes := 'г.Сургут';
    elsif pID = 2 then
        cRes := 'Сургутский район';
    elsif pID = 3 then
        cRes := 'ХМАО';
    elsif pID = 4 then
        cRes := 'Вне ХМАО';
    else
        cRes := '';
    end if;
    Return cRes;

/*2735  - Г.Сурут
75 - ХМАО
1736 Сургутский р-н
*/
end;

----------------------------------------------------------------------------------
function GetMestGitForRegion(pPacID IN NUMBER, pAdrType IN NUMBER default 62) RETURN number is
    CURSOR cGetKladr IS
       SELECT FK_KLADR
       FROM ASU.tadress
       WHERE FK_ID = PKG_REGIST_PACFUNC.GET_PAC_ADRID(pPacID, pAdrType);

    CURSOR cGetVal(pKladr IN NUMBER) IS
       SELECT Max(FK_ID) FK_ID
       FROM ASU.TKLADR
       WHERE FK_ID IN (2735,1736,1729,2721,2722,2723,2730,2731,2724,2725,2726,2732,2727,2728,2734,1734,1730,1731,1732,1733,1728, 1735)
       START WITH FK_ID = pKladr
       connect by prior fK_owner = fK_id;

    nKladr NUMBER;
    nRes NUMBER;
begin
    nKladr := -1;
    nRes := -1;
    FOR C IN cGetKladr loop
        nKladr := c.FK_KLADR;
    end loop;

/*
2735    Сургут
1736    Сургутский район
1729    Белоярский район
2721    Когалым
2722    Лангепас
2723    Мегион
2730    Нефтеюганск
2731    Нижневартовск
2724    Нягань
2725    Покачи
2726    Пыть-Ях
2732    Радужный
2727    Урай
2728    Ханты-Мансийск
2734    Югорск
1734    Октябрьский район
1730    Березовский район
1731    Кондинский район
1732    Нефтеюганский район
1733    Нижневартовский район
1728    Ханты-Мансийский район
1735    Советский район
22       Вне ХМАО
*/
    if nKladr = -1 then
        Return 22;
    end if;

    for c in cGetVal(nKladr) loop
        if c.FK_ID = 2735 then
            RETURN 1;
        end if;
        if c.FK_ID = 1736 then
            RETURN 2;
        end if;
        if c.FK_ID = 1729 then
            RETURN 3;
        end if;
        if c.FK_ID = 2721 then
            RETURN 4;
        end if;
        if c.FK_ID = 2722 then
            RETURN 5;
        end if;
        if c.FK_ID = 2723 then
            RETURN 6;
        end if;
        if c.FK_ID = 2730 then
            RETURN 7;
        end if;
        if c.FK_ID = 2731 then
            RETURN 8;
        end if;
        if c.FK_ID = 2724 then
            RETURN 9;
        end if;
        if c.FK_ID = 2725 then
            RETURN 10;
        end if;
        if c.FK_ID = 2726 then
            RETURN 11;
        end if;
        if c.FK_ID = 2732 then
            RETURN 12;
        end if;
        if c.FK_ID = 2727 then
            RETURN 13;
        end if;
        if c.FK_ID = 2728 then
            RETURN 14;
        end if;
        if c.FK_ID = 2734 then
            RETURN 15;
        end if;
        if c.FK_ID = 1734 then
            RETURN 16;
        end if;
        if c.FK_ID = 1730 then
            RETURN 17;
        end if;
        if c.FK_ID = 1731 then
            RETURN 18;
        end if;
        if c.FK_ID = 1732 then
            RETURN 19;
        end if;
        if c.FK_ID = 1733 then
            RETURN 20;
        end if;
        if c.FK_ID = 1728 then
            RETURN 21;
        end if;
        if c.FK_ID = 1735 then
            RETURN 23;
        else
            nRes := 22;
        end if;
    end loop;

    Return nRes;
end;

----------------------------------------------------------------------------------
function GetNaprName(pFK_SMID IN NUMBER) RETURN VARCHAR2 IS
    Cursor cRes IS SELECT FC_NAME
                   FROM ASU.TNAPRAV,
                        ASU.TNAPR_SMID
                   WHERE ASU.TNAPR_SMID.FK_NAPR = ASU.TNAPRAV.FK_ID
                         AND ASU.TNAPR_SMID.FK_SMID = pFK_SMID;
    strRes VARCHAR2(255);
begin
    strRes := '';
    for c in cRes loop
        strRes := c.FC_NAME;
    end loop;
   RETURN strRes;
end;

----------------------------------------------------------------------------------
function GetMetodName(pFK_SMID IN NUMBER) RETURN VARCHAR2 IS
    Cursor cRes IS SELECT FC_NAME
                   FROM ASU.TMETODIC,
                        ASU.TMETODIC_SMID
                   WHERE ASU.TMETODIC_SMID.FK_METOD = ASU.TMETODIC.FK_ID
                         AND ASU.TMETODIC_SMID.FK_SMID = pFK_SMID;
    strRes VARCHAR2(255);
begin
    strRes := '';
    for c in cRes loop
        strRes := c.FC_NAME;
    end loop;
   RETURN strRes;
end;

----------------------------------------------------------------------------------
function GetMetodID(pFK_SMID IN NUMBER) RETURN NUMBER IS
    Cursor cRes IS SELECT FK_ID
                   FROM ASU.TMETODIC,
                        ASU.TMETODIC_SMID
                   WHERE ASU.TMETODIC_SMID.FK_METOD = ASU.TMETODIC.FK_ID
                         AND ASU.TMETODIC_SMID.FK_SMID = pFK_SMID;
    strRes NUMBER;
begin
    strRes := '';
    for c in cRes loop
        strRes := c.FK_ID;
    end loop;
   RETURN strRes;
end;

----------------------------------------------------------------------------------
function GetVozrastNumber(pPacID IN NUMBER) RETURN NUMBER IS
    nRes BINARY_INTEGER;
begin
    nRes := asu.pkg_regist_pacfunc.GET_PAC_AGE_NOW(pPacID);
    if (nRes < 1) then
        Return 1;

    elsif (nRes >= 1) and (nRes < 3) then
        return 2;
    elsif (nRes >= 3) and (nRes < 7) then
        return 3;
    elsif (nRes >= 7) and (nRes < 14) then
        return 4;
    elsif (nRes >= 14) and (nRes < 17) then
        return 5;
    elsif (nRes >= 17) then
        return 6;
    else
        return 0;
    end if;
end;


----------------------------------------------------------------------------------
function GetOperID(pNazID IN NUMBER) RETURN NUMBER IS
    Cursor cGetVal IS
        SELECT FK_SMID
        FROM TIB
        WHERE FK_SMID IN (SELECT FK_ID
                          FROM ASU.TSMID
                          start with FK_ID in STAT.PKG_STATUTIL.GET_SMIDID('PROC_OPER_NAZ_OPER')
                          connect by prior fk_id = fk_owner)
               AND FK_PACID = pNazID;
    nRes NUMBER;
begin
    nRes := 0;
    for c in cGetVal loop
      nRes := c.FK_SMID;
    end loop;
    Return nRes;
end;

----------------------------------------------------------------------------------
function GetExpr(pPacID IN NUMBER) RETURN NUMBER is
    Cursor cGetVal IS SELECT FN_NUM FROM TIB WHERE FK_SMID IN (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'PD_DOST') AND FK_PACID = pPacID;
    nRes NUMBER;
begin
    nRes := 0;
    for c in cGetVal loop
      nRes := c.FN_NUM;
    end loop;
    Return nRes;
end;

----------------------------------------------------------------------------------
function GetLgotType(pPacID IN NUMBER) RETURN NUMBER is
    cursor cGetVal is
       select fK_smid
       from asu.tib
       where fk_pacid = asu.PKG_REGIST_PEPLFUNC.GET_PEPL_ID(ppacid)
             and FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('LD_KATEGOR_LGOT');
 nRes NUMBER;
begin
    nRes := -1;
    for c in cGetVal loop
        nRes := c.FK_SMID;
    end loop;
    RETURN nRes;
end;

----------------------------------------------------------------------------------
function GetLgotUsl(pPacID IN NUMBER, pNazID IN NUMBER, pLgot IN NUMBER) return number is
nVozrast NUMBER;
sPol Varchar2(5);
nLpu NUMBER;
begin
    if pLgot = 1 then
      nVozrast := asu.pkg_regist_pacfunc.GET_PAC_AGE_NOW(pPacID);
      sPol := asu.pkg_regist_pacfunc.GET_PAC_SEXLITER(pPacID);
      if sPol = 'М' and nVozrast >= 14 and nVozrast <=18 then
        Return 1;
       else
        Return 0;
      end if;
    elsif pLgot = 2 then

        nLpu := GetNaprUchID(pNazID, pPacID);
        if nLpu = STAT.PKG_STATUTIL.GET_SMIDID('LPU_VOENKOMAT') then
            Return 1;
           else
            Return 0;
        end if;
    elsif pLgot = 3 then
      nVozrast := asu.pkg_regist_pacfunc.GET_PAC_AGE_NOW(pPacID);
      if nVozrast <=18 then
        Return 1;
       else
        Return 0;
      end if;
    else
      Return 0;
    end if;
end;

function GetWithMather(pPacID IN NUMBER) RETURN number is
    cursor cGetVal is
        select count(*) cnt
        from asu.tib
        where fk_pacid = asu.PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pPacID)
             and fk_smid = STAT.PKG_STATUTIL.GET_SMIDID('SP_SOPROVOZHD');
    nRes NUMBER;
begin
    nRes := 0;
    for c in cGetVal loop
        nRes := c.cnt;
    end loop;
    Return  nRes;
end;

----------------------------------------------------------------------------------
function GetOperISHOD(pNazID IN NUMBER) RETURN VARCHAR2 IS
    Cursor cGetVal IS
        SELECT FC_CHAR
        FROM TIB
        WHERE FK_SMID = STAT.PKG_STATUTIL.GET_SMIDID('PROTHOPER_ISHOD')
              AND FK_PACID = pNazID;
    cRes VARCHAR2 (255);
begin
    cRes := '';
    for c in cGetVal loop
      cRes := c.FC_CHAR;
    end loop;
    Return cRes;
end;

function GetDostavlen(pPacID IN NUMBER) RETURN NUMBER IS
    Cursor cGetVal IS
        SELECT FK_SMID
        FROM TIB
        WHERE FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('PD_NACHTRAVM')
              AND FK_PACID = pPacID;
    cRes NUMBER;
begin
    cRes := '';
    for c in cGetVal loop
      cRes := c.FK_SMID;
    end loop;
    Return cRes;
end;

function GetSoputDiagForAmbul(pFK_NazID IN NUMBER) RETURN NUMBER IS
begin
    for c in (select MAX(FK_ID) FK_ID from
                                             (select dd.fk_id
                                              from asu.tdiag dd,
                                                   asu.tambtalon_naz an1,
                                                   asu.tambtalon_naz an2
                                              where dd.fk_nazid = an1.fk_nazid
                                              and an2.fk_talonid = an1.fk_talonid
                                              and an2.fk_nazid = pFK_NazID
                                              and dd.fl_main = stat.PKG_STATUTIL.get_smidid('SOPUT')
                                              union
                                              select td.fk_id
                                              from tambtalon_diags ta, tdiag td, asu.tambtalon_naz an
                                              where ta.fk_diagid=td.fk_id
                                                    and an.fk_nazid = pFK_NazID
                                                    and ta.fk_talonid=an.fk_talonid
                                                    and td.FL_MAIN=stat.PKG_STATUTIL.get_smidid('SOPUT')
                                                    and NVL(ta.fl_del,0) = 0) t) LOOP
             RETURN c.FK_ID;
    END LOOP;
end;

function GetPredDiag(pPacID IN NUMBER, pNazID IN NUMBER) RETURN NUMBER is
 cRes NUMBER;
begin
    for c in (       (SELECT MAX(fk_mkb10) fk_mkb10  FROM     ((select max(sn.FK_ID) fk_mkb10
                       from asu.tdiag d,
                            asu.tsmid sn
                       where d.fk_mkb_10 = sn.fk_id
                             and d.fk_id = (select max(dd.fk_id)
                                            from asu.tdiag dd,
                                                 asu.tkarta
                                            where dd.fk_pacid = pPacID
                                                  and tkarta.FK_ID = dd.fk_pacid
                                                  and dd.fp_type = stat.pkg_statutil.get_smidid('NA_OSMOTRE')))
                 union all
                      (select max(sn.fk_ID) fk_mkb10
                       from asu.tdiag d,
                            asu.tsmid sn
                       where d.fk_mkb_10 = sn.fk_id
                             and d.fk_id = (select max(dd.fk_id)
                                            from asu.tdiag dd,
                                                 asu.tambtalon_naz an1,
                                                 asu.tambtalon_naz an2
                                            where dd.fk_nazid = an1.fk_nazid
                                                  and an2.fk_talonid = an1.fk_talonid
                                                  and an2.fk_nazid = pNazID
                                                  and dd.fp_type = stat.pkg_statutil.get_smidid('NA_OSMOTRE')))) t)
            ) loop
    cRes := c.fk_mkb10;
   end loop;
   Return cRes;
end;

function GetKdnBefore(pPacid IN NUMBER, pdate IN DATE, pFK_OTDEL IN NUMBER) RETURN NUMBER IS
 cursor cKDN IS SELECT trunc(tperesel.FD_DATA2) FD_DATE2, trunc(tperesel.FD_DATA1) FD_DATE1
                 FROM asu.tsroky, asu.tperesel, asu.TROOM
                 where FK_PRYB=2
                       and FK_VYB = 3
                       and asu.tsroky.FK_ID = asu.tperesel.FK_SROKID
                       and asu.tperesel.FK_PACID = pPacid
                       AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                       and TROOM.FK_OTDELID = pFK_OTDEL
                 order by fd_date1;

  nTmp  NUMBER;
  Date1 DATE;
  Date2 DATE;
BEGIN
   nTmp := 0;
   for c in cKDN loop
     if c.fd_date1 < trunc(pdate) and c.fd_date2 < trunc(pdate) then
        nTmp := nTmp + (c.fd_date2 - c.fd_date1);
      elsIF c.fd_date1 < trunc(pdate) and c.fd_date2 >= trunc(pdate) then
       nTmp := nTmp + (trunc(pdate) - c.fd_date1);
     end if;
   end loop;
   Return nTmp;
end;


function GetKdnAfter(pPacid IN NUMBER, pdate IN DATE, pFK_OTDEL IN NUMBER) RETURN NUMBER IS
 cursor cKDN IS SELECT trunc(tperesel.FD_DATA2) FD_DATA2, trunc(tperesel.FD_DATA1) FD_DATA1
                 FROM asu.tsroky, asu.tperesel, asu.TROOM
                 where FK_PRYB=2
                       and FK_VYB = 3
                       and asu.tsroky.FK_ID = asu.tperesel.FK_SROKID
                       and asu.tperesel.FK_PACID = pPacid
                       AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                       and TROOM.FK_OTDELID = pFK_OTDEL
                 order by fd_data1;

  nTmp  NUMBER;
  Date1 DATE;
  Date2 DATE;
BEGIN
   nTmp := 0;
   for c in cKDN loop
     if c.fd_data1 > trunc(pdate) and c.fd_data2 > trunc(pdate) then
        nTmp := nTmp + (c.fd_data2 - c.fd_data1);
      elsIF c.fd_data1 <= trunc(pdate) and c.fd_data2 > trunc(pdate) then
       nTmp := nTmp + (c.fd_data2 - trunc(pdate));
     end if;
   end loop;
   Return nTmp;
end;


function GetKdn(pPacid IN NUMBER, pdate IN DATE, pFK_OTDEL IN NUMBER) RETURN NUMBER IS
 cursor cKDN IS SELECT sum(trunc(tperesel.FD_DATA2) - trunc(tperesel.FD_DATA1)) kdn
                 FROM asu.tsroky, asu.tperesel, asu.TROOM
                 where FK_PRYB=2
                       and FK_VYB = 3
                       and asu.tsroky.FK_ID = asu.tperesel.FK_SROKID
                       and asu.tperesel.FK_PACID = pPacid
                       AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                       and TROOM.FK_OTDELID = pFK_OTDEL;

  nTmp  NUMBER;
  Date1 DATE;
  Date2 DATE;
BEGIN
   nTmp := 0;
   for c in cKDN loop
           nTmp := nTmp + c.kdn;
       end loop;
   Return nTmp;
end;

----------------------------------------------------------------------------------
FUNCTION GET_HEAL_ID_BY_SMID_TYPE_VOZR(
                              pSmid IN NUMBER, 
                              ppacid IN NUMBER,
                              pDate in date, 
                              pHealType in number, 
                              pPacAge in number,
                              pUseDefUslug IN NUMBER default 1) RETURN NUMBER is
    Cursor GetPacOMSDety(pDocType IN NUMBER) IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST
             --ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null
              and theal.CODE like 'TPD%';

    Cursor GetPacOMSVzrosl(pDocType IN NUMBER)  IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
            -- ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
             -- and
             pSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null
              and theal.CODE like 'TPV%';

    Cursor GetPacDMS(pDocType IN NUMBER) IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
            -- ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = pDocType
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null;


    Cursor GetPacPlatUsl IS
        SELECT max(theal.FK_ID)
        FROM ASU.theal,
             ASU.theal_smid,
             ASU.THEAL_COST--,
           --  ASU.vnaz
        WHERE --vnaz.fk_id = pnazid
              --and
              pSmid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
              and theal.FK_DOCTYPEID = 21
              and ASU.THEAL_COST.fk_healid = theal.FK_ID
              and pDate BETWEEN FD_DATE1 AND NVL(FD_DATE2, pDate)
              and FN_COST is not null
              and CODE is not null;

   -- Cursor GetNazDate is
   --    Select FD_Run from ASU.Vnaz where FK_ID = pnazid;

    nHealType NUMBER;
    nPacTypeDoc Number;
    nPacAge Number;
    nNazDate Date;
    nHealID NUMBER;
begin

    nHealType := pHealType;--get_heal_type(get_pac_paytype(ppacid, -152));
    nNazDate := pDate;
    if (nHealType = 1) then

        nPacAge := pPacAge;--asu.pkg_regist_pacfunc.get_pac_age_date(ppacid, nNazDate);
        if  (nPacAge < 18) then
            open GetPacOMSDety(nHealType);
            Fetch GetPacOMSDety into nHealID;
            Close GetPacOMSDety;
        else
            open GetPacOMSVzrosl(nHealType);
            Fetch GetPacOMSVzrosl into nHealID;
            Close GetPacOMSVzrosl;
        end if;
    end if;


    if (nHealType = 21) then
        Open GetPacDMS(nHealType);
        Fetch GetPacDMS into nHealID;
        Close GetPacDMS;
    end if;

    If pUseDefUslug = 1 then
      if (nHealID is null) then
        Open GetPacPlatUsl;
        Fetch GetPacPlatUsl into nHealID;
        Close GetPacPlatUsl;
      end if;
    end if;

    Return nHealID;
end;
----------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function GetUslCostByInsurance(pInsid IN NUMBER) RETURN NUMBER IS
  res number;
  cursor C IS
    select SUM(ASU.PKG_USLUGI.GET_SMID_COST(v.fk_smid, TRUNC(r.FD_INS))) as FN_COST

      from asu.tambtalon     a,
           asu.tambtalon_naz an,
           asu.tinsurdocs    ii,
           asu.vnaz          v,
           ASU.vres          r
     where an.fk_talonid = a.fk_id
       and a.fk_insuranceid = ii.fk_id
       and v.fk_id = an.fk_nazid
       and r.Fk_Nazid = v.fk_id
       and r.fk_smid = v.fk_smid
       and ii.fk_id = pInsid
       and v.FK_NAZSOSID = asu.GET_VIPNAZ;
Begin

  OPEN C;
  FETCH C INTO res;
  Close C;
  
  return res;
End;

--------------------------------------------------------------------------------
function GetUslCostBySertificat(pSertid IN NUMBER) RETURN NUMBER IS
  res number;
  cursor C IS
  
  
 
  select SUM(FN_COST) from (
    select NVL(SUM(GET_HEAL_COST(
                                 DECODE( GetOperID(v.FK_ID),
                                                          0, 
                                         GET_HEAL_ID_BY_NAZ(V.FK_ID, v.FK_PACID, 1),
                                         GET_HEAL_ID_BY_OPER(V.FK_ID, v.FK_PACID, GetOperID(v.FK_ID), r.FD_INS, 1)
                                        ), 
                                 r.FD_INS)),0) as FN_COST

      from asu.tambtalon     a,
           asu.tambtalon_naz an,
           asu.tinsurdocs    ii,
           asu.vnaz          v,
           ASU.Tinsur_Certificat ins_sert,
           ASU.vres          r
     where an.fk_talonid = a.fk_id
       and r.Fk_Nazid = v.fk_id
       and r.fk_smid = v.fk_smid
       and a.fk_insuranceid = ii.fk_id
       and v.fk_id = an.fk_nazid
       and ii.fk_id = ins_sert.fk_insur
       and  pSertid = ins_sert.fk_certificat
       and r.FK_SOS = asu.GET_VIPNAZ
     union all
    select NVL(SUM(GET_HEAL_COST(
                                 DECODE( GetOperID(v.FK_ID),
                                                          0, 
                                         GET_HEAL_ID_BY_NAZ(V.FK_ID, v.FK_PACID, 1),
                                         GET_HEAL_ID_BY_OPER(V.FK_ID, v.FK_PACID, GetOperID(v.FK_ID), r.FD_INS, 1)
                                        ), 
                                 r.FD_INS)),0) as FN_COST

      from asu.tkarta     k,
           asu.tinsurdocs    ii,
           ASU.TPAC_INSURANCE pi,
           asu.vnaz          v,
           ASU.Tinsur_Certificat ins_sert,
           ASU.vres          r
     where r.Fk_Nazid = v.fk_id
       and r.fk_smid = v.fk_smid
       and pi.FK_INSURDOCID = ii.fk_id
       and pi.fk_pacid = k.fk_id
       and v.fk_PACID = K.FK_ID
       and ii.fk_id = ins_sert.fk_insur
       and  pSertid = ins_sert.fk_certificat
       and r.FK_SOS = asu.GET_VIPNAZ);
Begin

  OPEN C;
  FETCH C INTO res;
  Close C;
  
  return res;
End;

------------------------------------------------------------------------------------

function GetCertificatBalance(pCertificatid IN NUMBER) RETURN NUMBER IS
 res number;
  cursor C IS
    select fn_sum -  GetUslCostBySertificat(s.FK_ID) as FN_COST
      from  ASU.Tcertificate S
     where FK_ID = pCertificatid;
Begin
  RES := 1;
  
  OPEN C;
  FETCH C INTO res;
  Close C;
  
  return res;
End;
------------------------------------------------------------------------------------
function GetInsuranceBalance(pInsid IN NUMBER) RETURN NUMBER IS
  res number;
  cursor C IS
    select MAX(ii.fc_inssum) - SUM(ASU.PKG_USLUGI.GET_SMID_COST(v.fk_smid, TRUNC(v.FD_NAZ))) as FN_COST
      from asu.tambtalon     a,
           asu.tambtalon_naz an,
           asu.tinsurdocs    ii,
           asu.vnaz          v,
           asu.TTypedoc      t
     where an.fk_talonid = a.fk_id
       and a.fk_insuranceid = ii.fk_id
       and v.fk_id = an.fk_nazid       
       and v.FK_NAZSOSID = asu.GET_VIPNAZ
       and t.fk_id = ii.fk_typedocid
       and t.fc_synonim = 'SERTIFIKAT'
       and ii.fk_id = pInsid;
Begin
  RES := 1;
  
  OPEN C;
  FETCH C INTO res;
  Close C;
  
  return res;
End;
--------------------------------------------------------------------------------
----------------------------------------------------------------------------------
function GetDogovorBalance(pInsid in number) return number is
res number;
pFC_INSSUM number := NULL;


cursor GetIsurance is 
   Select id.fn_limit_dogovor from ASU.TINSURDOCS i, ASU.Tinsur_Dogovor id
    where     
   id.fk_id = i.fk_dogovorid 
   and  
   i.fk_id = pInsid;
   
   
cursor C IS
    select MAX(fn_limit_dogovor) - SUM(
                                           ASU.PKG_USLUGI.GET_SMID_COST(fk_smid, TRUNC(FD_NAZ)) 
                                           * 
                                           NVL(COUNT_NAZ,1)
                                         ) as FN_COST
     from (                                         
                                         
     select  id.fn_limit_dogovor, v.fk_smid, TRUNC(v.FD_NAZ) as FD_NAZ,
             (Select NVL(FN_NUM,1) from ASU.TIB, ASU.TSMID where TIB.FK_PACID = v.FK_ID and TIB.FK_SMID = TSMID.FK_ID and  TSMID.FC_SYNONIM = 'KOL_VO') as COUNT_NAZ
                                   
      from asu.tambtalon     a,
           asu.tambtalon_naz an,
           asu.tinsurdocs    ii,
           ASU.Tinsur_Dogovor id,
           asu.vnaz          v,
           asu.TTypedoc      t
     where an.fk_talonid = a.fk_id
       and id.fk_id = ii.fk_dogovorid 
       and a.fk_insuranceid = ii.fk_id
       and v.fk_id = an.fk_nazid
       and t.fk_id = ii.fk_typedocid
       and ii.fk_id = pInsid);
Begin
   RES := 1;  
   
   ---Получаем сколько на договоре
   OPEN GetIsurance;
   FETCH GetIsurance INTO pFC_INSSUM;
   Close GetIsurance;
   
   --Если договор, и есть бабло 
   if pFC_INSSUM is not null then
           -- Пытаемся найти остаток по выполненым назначениям   
           OPEN C;
           FETCH C INTO res;
           Close C;
           --Если res до сих пор 0, то тогда запрос вернул NULL, то есть вып. назначений нет, следовательно 
           if Res = 0 then
            Res := 1;
           end if;
   end if;
   
   return res;
           
End;
--------------------------------------------------------------------------------
function CanNazSKNaz(pFK_NAZID IN NUMBER) RETURN NUMBER IS
  res number;
  
  CurrentCost number;
  pFK_SMID NUMBER; 
  pFD_NAZ DATE;
  pInsid number;
  pFC_SYNONIM varchar2(400);
  pFC_INSSUM number;
  
  cursor GetIsurance is 
   Select i.fk_id, t.fc_synonim, TRUNC(v.fd_run), v.fk_smid, id.fn_limit_dogovor from ASU.TINSURDOCS i, ASU.Tinsur_Dogovor id,
          ASU.TAmbtalon a ,ASU.TAMBTALON_NAZ an, ASU.TTYPEDOC t, ASU.VNAZ v
    where     
   id.fk_id = i.fk_dogovorid 
   and  
   v.fk_id = an.fk_nazid 
   and 
   i.fk_typedocid = t.fk_id 
   and 
   a.fk_insuranceid = i.fk_id 
   and 
   an.fk_talonid = a.fk_id 
   and 
   an.fk_nazid = pFK_NAZID;
   
--                                           

   
   
  cursor C IS
    select MAX(fn_limit_dogovor) - SUM(
                                           ASU.PKG_USLUGI.GET_SMID_COST(fk_smid, TRUNC(FD_NAZ)) 
                                           * 
                                           NVL(COUNT_NAZ,1)
                                         ) as FN_COST
     from (                                         
                                         
     select  id.fn_limit_dogovor, v.fk_smid, TRUNC(v.FD_NAZ) as FD_NAZ,
             (Select NVL(FN_NUM,1) from ASU.TIB, ASU.TSMID where TIB.FK_PACID = v.FK_ID and TIB.FK_SMID = TSMID.FK_ID and  TSMID.FC_SYNONIM = 'KOL_VO') as COUNT_NAZ
                                   
      from asu.tambtalon     a,
           asu.tambtalon_naz an,
           asu.tinsurdocs    ii,
           ASU.Tinsur_Dogovor id,
           asu.vnaz          v,
           asu.TTypedoc      t
     where an.fk_talonid = a.fk_id
       and id.fk_id = ii.fk_dogovorid 
       and a.fk_insuranceid = ii.fk_id
       and v.fk_id = an.fk_nazid
       --and v.FK_NAZSOSID = asu.GET_VIPNAZ
       and t.fk_id = ii.fk_typedocid
      -- and t.fc_synonim = 'SERTIFIKAT'
       and v.FK_ID <> pFK_NAZID
       and ii.fk_id = pInsid)
       
       
       ;
Begin
   RES := 1;  
   OPEN GetIsurance;
   FETCH GetIsurance INTO pInsid, pFC_SYNONIM,pFD_NAZ,pFK_SMID,pFC_INSSUM;
   Close GetIsurance;
 
  --if pFC_SYNONIM = 'SERTIFIKAT' then
   --Текущая стоимость
   CurrentCost := ASU.PKG_USLUGI.GET_SMID_COST(pFK_SMID,pFD_NAZ);
   if CurrentCost > 0 then
   
          

           -- Пытаемся найти остаток по выполненым назначениям   
           OPEN C;
           FETCH C INTO res;
           Close C;
           --Если res до сих пор 0, то тогда запрос вернул NULL, то есть вып. назначений нет, следовательно 
           if res is NULL then
             if pFC_INSSUM is null then
              res := 1;
             else      
              res := pFC_INSSUM - CurrentCost;
             end if; 
            
           else
            res := res - CurrentCost;
           end if;
           -- added at 30.08.2011 ( если тютелька в тютельку то тоже подписать можно)
           if Res = 0 then
            Res := 1;
           end if;
           
          --end if;
  end if;        
  
  return res;
End;
---------------------------------------------------------------------------------

  FUNCTION GET_HEAL_NAME(pHealid  NUMBER,
                         pDate    DATE DEFAULT SYSDATE) RETURN VARCHAR2 IS
    -- Created 20120530 by Neronov
    -- Возвращает название тарифа по коду на дату
    nRes VARCHAR2(500);
  BEGIN
    FOR C IN (SELECT MAX(FC_NAME) CNT
                FROM ASU.THEAL_COST
               WHERE THEAL_COST.FK_HEALID = pHealid
                 AND trunc(pDate) BETWEEN THEAL_COST.FD_DATE1 AND
                     NVL(THEAL_COST.FD_DATE2, trunc(PDATE))) LOOP
      nRes := C.CNT;
    END LOOP;
    if nRes is NULL then
      FOR C IN (SELECT MAX(FC_NAME) CNT FROM ASU.THEAL WHERE FK_ID = pHealid) LOOP
        nRes := C.CNT;
      END LOOP;
    end if;

    RETURN NVL(nRes, '');
  END;
---------------------------------------------------------------------------------

FUNCTION GET_HEALS_BY_NAZ(pnazid IN NUMBER, pUseDefUslug IN NUMBER default 0) RETURN SYS_REFCURSOR IS
 Res SYS_REFCURSOR;


    Cursor GetNazDate is
       Select FD_Run,FK_PACID,case
                                when (asu.is_ambulance(fk_pacid) = 0) and (get_pac_paytype(fk_pacid, fk_id) in (select fk_id from ttypedoc where fc_synonim in ('KOMERC','DMS','DOGOVOR')))
                                then asu.pkg_regist_pacfunc.get_pac_income(fk_pacid)
                                when (asu.is_ambulance(fk_pacid) = 1) and (get_pac_paytype(fk_pacid, fk_id) in (select fk_id from ttypedoc where fc_synonim in ('KOMERC')))
                                then NVL((SELECT MAX(b.fd_pay) FROM asu.tappendix_naz an, asu.tbill b WHERE an.fk_nazid = vnaz.fk_id AND an.fk_appendixid = b.fk_appendix),fd_run)
                                else fd_run
                              END fd_date_heal
         from ASU.Vnaz where FK_ID = pnazid;

    Cursor GetNazRootSMID(pNazSMID IN NUMBER) is
       SELECT FK_ID FROM TSMID
        START WITH FK_ID = pNazSMID
        CONNECT BY FK_ID = PRIOR FK_OWNER
        ORDER BY LEVEL DESC;

    ppacid NUMBER;
    nHealType NUMBER;
    nPacTypeDoc Number;
    nPacAge Number;
    nNazDate Date;
    nHealDate Date;

    nRootSMID number;--------------
    nNazSMID number;
    
    nOperID number;
begin
    Open GetNazDate;
    Fetch GetNazDate INTO nNazDate, ppacid, nHealDate;
    Close GetNazDate;

    nPacTypeDoc := get_pac_paytype(ppacid, pnazid);
    nHealType := get_heal_type(get_pac_paytype(ppacid, pnazid));
 
    nOperID := GetOperID(pnazid);
    
    if (nHealType = 21) then
      if (nOperID > 0) then
        OPEN res FOR
         SELECT theal.FK_ID,
                theal.CODE,
                theal.FC_NAME,
                hc.FN_COST as FN_COST,
                /*decode(nvl(thc.FN_COUNT, 0), 0, 0, 1) as FL_CHECK,
                decode(nvl(thc.FN_COUNT, 0), 0, 0, thc.FN_COUNT) as FN_COUNT,
                decode(nvl(thc.FN_COUNT, 0), 0, 0, thc.FN_COUNT) * hc.FN_COST as FN_TOTAL_COST,
                */
                decode(nvl(thc.FN_COUNT, 0), 0, 1, 1) as FL_CHECK,
                decode(nvl(thc.FN_COUNT, 0), 0, 1, thc.FN_COUNT) as FN_COUNT,
                decode(nvl(thc.FN_COUNT, 0), 0, 1, thc.FN_COUNT) * hc.FN_COST as FN_TOTAL_COST,
                    
                0 as FL_CONNECT,
                DECODE((select count(1)
                         from ASU.TNAZAN
                        where TNAZAN.FK_ID = v.fk_id),
                       0,
                       0,
                       1) FL_RAZ_ANAL


        FROM (SELECT tnh.fk_healid fk_id, NVL(tnh.FN_HEAL_COUNT,1) FN_COUNT
                FROM asu.TNAZHEAL tnh
               WHERE tnh.fk_nazid = pnazid
             ) thc,

             (select * from ASU.theal
               start with FK_PARENT IS NULL
                      AND ((FP_HEALTYPE = 1 AND FL_TMP = 1) OR (FP_HEALTYPE = 2))
                      AND FK_DOCTYPEID = nPacTypeDoc
               connect by prior fk_id = fk_parent) theal ,
             ASU.theal_smid,
             asu.theal_smid_dt dt,
             ASU.vnaz v,
             asu.tib i,
             ASU.THEAL_COST hc
        WHERE v.fk_id = pnazid
          and v.fk_id = i.fk_pacid
          and v.FK_SMID in (select fk_id from asu.tsmid where fl_del = 0 and fc_synonim in ('KONS_PROTHOPER','RENTGENXIR_OPER'))
          and i.FK_SMID IN (SELECT FK_ID
                              FROM ASU.TSMID
                              start with FC_SYNONIM in ('PROC_OPER_NAZ_OPER','PROTHOPER_OBEZBOL')
                              connect by prior fk_id = fk_owner)                          
          and i.fk_smid = theal_smid.fk_smid              
          and theal_smid.fk_heal = theal.fk_id
          and theal_smid.fk_id = dt.fk_heal_smid(+)
          and (dt.fk_id is null or nHealDate BETWEEN dt.FD_DATE1 AND NVL(dt.FD_DATE2,nHealDate))
          --and theal.FK_DOCTYPEID = pHealType
          and hc.fk_healid = theal.FK_ID
          and nHealDate BETWEEN HC.FD_DATE1 AND NVL(HC.FD_DATE2,nHealDate)
          and hc.FN_COST is not null
          and theal.CODE is not null
          and thc.FK_ID(+) = theal.FK_ID;
      else
        OPEN res FOR
        SELECT

        theal.FK_ID,
                    theal.CODE,
                    theal.FC_NAME,
                    hc.FN_COST as FN_COST,
                    /*decode(nvl(thc.FN_COUNT, 0), 0, 0, 1) as FL_CHECK,
                    decode(nvl(thc.FN_COUNT, 0), 0, 0, thc.FN_COUNT) as FN_COUNT,
                    decode(nvl(thc.FN_COUNT, 0), 0, 0, thc.FN_COUNT) * hc.FN_COST as FN_TOTAL_COST,
                    */
                    decode(nvl(thc.FN_COUNT, 0), 0, 1, 1) as FL_CHECK,
                    decode(nvl(thc.FN_COUNT, 0), 0, 1, thc.FN_COUNT) as FN_COUNT,
                    decode(nvl(thc.FN_COUNT, 0), 0, 1, thc.FN_COUNT) * hc.FN_COST as FN_TOTAL_COST,
                    
                    0 as FL_CONNECT,
                    DECODE((select count(1)
                             from ASU.TNAZAN
                            where TNAZAN.FK_ID = v.fk_id),
                           0,
                           0,
                           1) FL_RAZ_ANAL


        FROM (SELECT tnh.fk_healid fk_id, NVL(tnh.FN_HEAL_COUNT,1) FN_COUNT
                       FROM asu.TNAZHEAL tnh
                      WHERE tnh.fk_nazid = pnazid
                      ) thc,

             (select * from ASU.theal
               start with FK_PARENT IS NULL
                      AND ((FP_HEALTYPE = 1 AND FL_TMP = 1) OR (FP_HEALTYPE = 2))
                      AND FK_DOCTYPEID = nPacTypeDoc
               connect by prior fk_id = fk_parent) theal ,
             ASU.theal_smid,
             asu.theal_smid_dt dt,
             ASU.vnaz v,
             ASU.THEAL_COST hc
        WHERE v.fk_id = pnazid
              and v.fk_smid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id

              and theal_smid.fk_id = dt.fk_heal_smid(+)
              and (dt.fk_id is null or nHealDate BETWEEN dt.FD_DATE1 AND NVL(dt.FD_DATE2,nHealDate))
              --and theal.FK_DOCTYPEID = pHealType
              and hc.fk_healid = theal.FK_ID
              and nHealDate BETWEEN HC.FD_DATE1 AND NVL(HC.FD_DATE2,nHealDate)
              and hc.FN_COST is not null
              and theal.CODE is not null
              and thc.FK_ID(+) = theal.FK_ID;
      end if;
    else
     OPEN res FOR SELECT -1 as FK_ID,
                    null as  CODE,
                    null as  FC_NAME,
                    null as FN_COST,
                   null as FL_CHECK,
                    null as FN_COUNT,
                    null as FN_TOTAL_COST,
                    0 as FL_CONNECT,
                    0 FL_RAZ_ANAL
                     from DUAL where 2=1;



    end if;

   
    RETURN(Res);
end;

----------------------------------------------------------------------------------
FUNCTION GET_HEALS_BY_NAZ_PRIEM(pnazid IN NUMBER, pUseDefUslug IN NUMBER default 0) RETURN SYS_REFCURSOR IS
 Res SYS_REFCURSOR;

    
    Cursor GetNazDate is
       Select FD_Run,FK_PACID,case
                                when (asu.is_ambulance(fk_pacid) = 0) and (get_pac_paytype(fk_pacid, fk_id) in (select fk_id from ttypedoc where fc_synonim in ('KOMERC','DMS','DOGOVOR')))
                                then asu.pkg_regist_pacfunc.get_pac_income(fk_pacid)
                                when (asu.is_ambulance(fk_pacid) = 1) and (get_pac_paytype(fk_pacid, fk_id) in (select fk_id from ttypedoc where fc_synonim in ('KOMERC')))
                                then NVL((SELECT MAX(b.fd_pay) FROM asu.tappendix_naz an, asu.tbill b WHERE an.fk_nazid = vnaz.fk_id AND an.fk_appendixid = b.fk_appendix),fd_run)
                                else fd_run
                              END fd_date_heal
         from ASU.Vnaz where FK_ID = pnazid;
       
    Cursor GetNazRootSMID(pNazSMID IN NUMBER) is
       SELECT FK_ID FROM TSMID
        START WITH FK_ID = pNazSMID
        CONNECT BY FK_ID = PRIOR FK_OWNER
        ORDER BY LEVEL DESC;
        
    ppacid NUMBER;
    nHealType NUMBER;
    nPacTypeDoc Number;
    nPacAge Number;
    nNazDate Date;
    nHealDate Date;
    
    nRootSMID number;
    nNazSMID number;
    nOperID number;
begin

    Open GetNazDate;
    Fetch GetNazDate INTO nNazDate, ppacid, nHealDate ;
    Close GetNazDate;
    
    nPacTypeDoc := get_pac_paytype(ppacid, pnazid);
    nHealType := get_heal_type(get_pac_paytype(ppacid, pnazid));
    
    nOperID := GetOperID(pnazid);
    
    if (nHealType = 21) then
      if (nOperId > 0) then        
        OPEN res FOR 
        SELECT  theal.FK_ID,
                theal.CODE,
                theal.FC_NAME,
                hc.FN_COST as FN_COST,
                decode(nvl(thc.FN_COUNT, 0), 0, 0, 1) as FL_CHECK,
                decode(nvl(thc.FN_COUNT, 0), 0, 0, thc.FN_COUNT) as FN_COUNT,
                decode(nvl(thc.FN_COUNT, 0), 0, 0, thc.FN_COUNT) * hc.FN_COST as FN_TOTAL_COST,
                0 as FL_CONNECT,
                DECODE((select count(1)
                         from ASU.TNAZAN
                        where TNAZAN.FK_ID = v.fk_id),
                       0,
                       0,
                       1) FL_RAZ_ANAL
        FROM (SELECT tnh.fk_healid fk_id, NVL(tnh.FN_HEAL_COUNT,1) FN_COUNT
                FROM asu.TNAZHEAL tnh
               WHERE tnh.fk_nazid = pnazid
             ) thc,
        
             (select * from ASU.theal
               start with FK_PARENT IS NULL
                      AND ((FP_HEALTYPE = 1 AND FL_TMP = 1) OR (FP_HEALTYPE = 2))
                      AND FK_DOCTYPEID = nPacTypeDoc
               connect by prior fk_id = fk_parent) theal ,
             ASU.theal_smid,             
             asu.theal_smid_dt dt,
             asu.tib i,
             ASU.vnaz v,
             ASU.THEAL_COST hc
        WHERE v.fk_id = pnazid
          and v.fk_id = i.fk_pacid
          and v.FK_SMID in (select fk_id from asu.tsmid where fl_del = 0 and fc_synonim in ('KONS_PROTHOPER','RENTGENXIR_OPER'))
          and i.FK_SMID IN (SELECT FK_ID
                              FROM ASU.TSMID
                              start with FC_SYNONIM in ('PROC_OPER_NAZ_OPER','PROTHOPER_OBEZBOL')
                              connect by prior fk_id = fk_owner)                          
          and i.fk_smid = theal_smid.fk_smid
          and theal_smid.fk_heal = theal.fk_id
                      
          and theal_smid.fk_id = dt.fk_heal_smid(+)
          and (dt.fk_id is null or nHealDate BETWEEN dt.FD_DATE1 AND NVL(dt.FD_DATE2,nHealDate))
          --and theal.FK_DOCTYPEID = pHealType
          and hc.fk_healid = theal.FK_ID
          and nHealDate BETWEEN HC.FD_DATE1 AND NVL(HC.FD_DATE2,nHealDate)
          and hc.FN_COST is not null
          and theal.CODE is not null
          and thc.FK_ID(+) = theal.FK_ID;
      else
        OPEN res FOR 
        SELECT 
        
        theal.FK_ID,
                    theal.CODE,
                    theal.FC_NAME,
                    hc.FN_COST as FN_COST,
                    decode(nvl(thc.FN_COUNT, 0), 0, 0, 1) as FL_CHECK,
                    decode(nvl(thc.FN_COUNT, 0), 0, 0, thc.FN_COUNT) as FN_COUNT,
                    decode(nvl(thc.FN_COUNT, 0), 0, 0, thc.FN_COUNT) * hc.FN_COST as FN_TOTAL_COST,
                    0 as FL_CONNECT,
                    DECODE((select count(1)
                             from ASU.TNAZAN
                            where TNAZAN.FK_ID = v.fk_id),
                           0,
                           0,
                           1) FL_RAZ_ANAL
        
        
        FROM (SELECT tnh.fk_healid fk_id, NVL(tnh.FN_HEAL_COUNT,1) FN_COUNT
                       FROM asu.TNAZHEAL tnh
                      WHERE tnh.fk_nazid = pnazid
                      ) thc,
        
             (select * from ASU.theal
               start with FK_PARENT IS NULL
                      AND ((FP_HEALTYPE = 1 AND FL_TMP = 1) OR (FP_HEALTYPE = 2))
                      AND FK_DOCTYPEID = nPacTypeDoc
               connect by prior fk_id = fk_parent) theal ,
             ASU.theal_smid,             
             asu.theal_smid_dt dt,
             ASU.vnaz v,
             ASU.THEAL_COST hc
        WHERE v.fk_id = pnazid
              and v.fk_smid = theal_smid.fk_smid
              and theal_smid.fk_heal = theal.fk_id
                    
              and theal_smid.fk_id = dt.fk_heal_smid(+)
              and (dt.fk_id is null or nHealDate BETWEEN dt.FD_DATE1 AND NVL(dt.FD_DATE2,nHealDate))
              --and theal.FK_DOCTYPEID = pHealType
              and hc.fk_healid = theal.FK_ID
              and nHealDate BETWEEN HC.FD_DATE1 AND NVL(HC.FD_DATE2,nHealDate)
              and hc.FN_COST is not null
              and theal.CODE is not null
              and thc.FK_ID(+) = theal.FK_ID;
      end if;
    else
     OPEN res FOR SELECT -1 as FK_ID,
                    null as  CODE,
                    null as  FC_NAME,
                    null as FN_COST,
                   null as FL_CHECK,
                    null as FN_COUNT,
                    null as FN_TOTAL_COST,
                    0 as FL_CONNECT,
                    0 FL_RAZ_ANAL 
                     from DUAL where 2=1;
     
     
               
    end if;
    RETURN(Res);
end;

END;
/

SHOW ERRORS;


