CREATE OR REPLACE PACKAGE MED.pkgtmedic
IS
FUNCTION GETKOLNEOTLOZH
  ( amedic in number,amoid in number)
  RETURN  number;

/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
CURSOR cGetByID (ppMEDICID IN NUMBER)
IS
  SELECT
    FC_NAME,
    FC_COMMENT,
    NVL(UCHGRID, -1),
    NVL(EIID, -1),
    NVL(FARMGRID, -1),
    NVL(levelid, -1),
    fl_pku,
    fl_lgota,
    fc_name_lat,
    fl_print_lat_name
  FROM   tmedic
  WHERE  MEDICID = ppMEDICID;


/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/

   PROCEDURE DoDelCascade (pMEDICID IN NUMBER);

   PROCEDURE DoDel (pMEDICID IN NUMBER);

   PROCEDURE DoInvisible (pMEDICID IN NUMBER);

   PROCEDURE DoVisible (pMEDICID IN NUMBER);

   PROCEDURE DoSetUchGroup (PUCHGRIP IN NUMBER, pMEDICID IN NUMBER);

   FUNCTION getedizmname (pmedicid IN NUMBER)
      RETURN varchar2;
   FUNCTION getedizmnameokei (pmedicid IN NUMBER)
      RETURN varchar2;
   FUNCTION DOSET (
      pfc_name      IN   VARCHAR2,
      pfc_comment   IN   VARCHAR2,
      puchgrid      IN   NUMBER,
      peiid         IN   NUMBER,
      pfarmgrid     IN   NUMBER,
      plevelid      IN   NUMBER,
      pFK_TYPE      IN   NUMBER,
      pFK_PAYTYPE   IN   NUMBER,
      pmedicid      IN   NUMBER DEFAULT -1,
      pFK_NOMEN_RLS IN   NUMBER DEFAULT 0,
      pFC_EanCone   IN   VARCHAR2 DEFAULT NULL,
      pKolFinU      IN   NUMBER DEFAULT NULL,
      pFEdizmId     IN   NUMBER DEFAULT NULL,
      pFN_Dozka     IN   NUMBER DEFAULT NULL,
      pFK_DozkaUnit IN   NUMBER DEFAULT NULL,
      PFK_NARCO     IN   NUMBER DEFAULT NULL,
    pFL_LGOTA     in   number default 0,
    pFC_NAME_LAT in varchar2 default null,
    pfl_print_lat_name in number DEFAULT 0
   ) RETURN NUMBER;

   FUNCTION DO_SET_AUTONOMUS (
      pfc_name      IN   VARCHAR2,
      pfc_comment   IN   VARCHAR2,
      puchgrid      IN   NUMBER,
      peiid         IN   NUMBER,
      pfarmgrid     IN   NUMBER,
      plevelid      IN   NUMBER,
      pFK_TYPE      IN   NUMBER,
      pFK_PAYTYPE   IN   NUMBER,
      pFC_NAME_LAT  IN   VARCHAR2 DEFAULT NULL,
      pmedicid      IN   NUMBER DEFAULT -1,
      pFK_NOMEN_RLS IN   NUMBER DEFAULT 0,
      pFC_EanCone   IN   VARCHAR2 DEFAULT NULL,
      pKolFinU      IN   NUMBER DEFAULT NULL,
      pFEdizmId     IN   NUMBER DEFAULT NULL,
      pFN_Dozka     IN   NUMBER DEFAULT NULL,
      pFK_DozkaUnit IN   NUMBER DEFAULT NULL,
      PFK_NARCO     IN   NUMBER DEFAULT NULL,
      bRls          IN   NUMBER DEFAULT 1,
      pfl_print_lat_name in NUMBER DEFAULT 0
   ) RETURN NUMBER;

   PROCEDURE GetByID (
      pMEDICID      IN       NUMBER,
      pFC_NAME      OUT      VARCHAR2,
      pFC_COMMENT   OUT      VARCHAR2,
      pUCHGRID      OUT      NUMBER,
      pEIID         OUT      NUMBER,
      pLevelID      OUT      NUMBER,
      pFARMGRID     OUT      NUMBER,
      ppku          OUT   number,
    pfl_lgota     out integer,
    pfc_name_lat  out varchar2,
    pfl_print_lat_name OUT integer
   );

   FUNCTION GetNameByID (pMEDICID IN NUMBER)
      RETURN VARCHAR2;

   FUNCTION GetEdizm (pMEDICID IN NUMBER)
      RETURN NUMBER;
  FUNCTION getuchgrid (pmedicid IN NUMBER)
      RETURN NUMBER;
  FUNCTION getfarmgrid (pmedicid IN NUMBER)
      RETURN NUMBER;

  procedure medic_complex_add(p_medic_parent integer, p_medic_item integer);
  procedure medic_complex_set_amount(p_medic_item integer, p_amount number);
  procedure medic_complex_del(p_medic_parent integer, p_medic_item integer);
  function medic_complex_can_del(p_medic_item integer) return integer;

  procedure DoSetUchgrHistory
  (
    p_medicid in number,
    p_uchgrid in number,
    p_newuchgrid in number,
    p_moid in number
  );

  procedure DoSetUchgridForTKart
  (
    p_medicid in number,
    p_newuchgrid in number,
    p_date date
  );

  function gt_uch_group
  (
    p_medicid in med.tmedic.medicid%type,
                          p_main_uch_grp in med.tmedic.uchgrid%type,
                          p_date    in date := sysdate
                        )
  return number;
  
  function GetUchgrFullPathName ( pUCHGRID in number) 
    return varchar2;
  
  function ISMEDICSEQUAL ( pMEDICID1 in number, pMEDICID2 in number, pUseComplexCompare in number default 0 ) 
    return smallint ;-- boolean;
  
end;
/
CREATE OR REPLACE PACKAGE BODY MED.pkgtmedic
IS
FUNCTION GETKOLNEOTLOZH
  ( amedic in number,amoid in number)
  RETURN  number IS
  cursor c1
  is
  select nvl(colvo,0) from med.tminzapas
  where mogroupid=amoid
  and medicid=amedic;

res number;
BEGIN
open c1;
fetch c1 into res;
close c1;
return res;
END;

/*------------------------------------------------------------------------------------------------------------------*\
|               doset
\*------------------------------------------------------------------------------------------------------------------*/
function doset (
  pfc_name      in varchar2,
  pfc_comment   in varchar2,
  puchgrid      in number,
  peiid         in number,
  pfarmgrid     in number,
  plevelid      in number,
  pfk_type      in number,
  pfk_paytype   in number,
  pmedicid      in number default -1,
  pfk_nomen_rls in number default 0,
  pfc_eancone   in varchar2 default null,
  pkolfinu      in number default null,
  pfedizmid     in number default null,
  pfn_dozka     in number default null,
  pfk_dozkaunit in number default null,
  pfk_narco     in number default null,
  pfl_lgota     in number default 0,
  pfc_name_lat  in varchar2 default null,
  pfl_print_lat_name in number default 0
) return number
is
  res number;
begin
  /*
   * pKolFinU  - кол-во фасовочных единиц в 1-ой упаковочной
   * pFEdizmId - единицы измерения фасовочных единиц
   * pFN_Dozka     - Дозировка TMassUnits
   * pFK_DozkaUnit - Ед. изм. Дозировки
   * PFK_NARCO     - Наркотики, сильнодейств и ядовитые вещества
   */
  if pmedicid = -1 then
    insert into tmedic(
      fc_name,
      fc_comment,
      uchgrid,
      eiid,
      farmgrid,
      levelid,
      fk_nomen_rls,
      fc_eancode,
      fk_type,
      fk_paytype,
      fn_fpackinupack,
      fk_fpackid,
      fn_mass,
      fk_massunits,
      fl_lgota,
      fc_name_lat,
      fl_print_lat_name
    )
        values (
      trim(pfc_name),
      trim(pfc_comment),
      puchgrid,
      peiid,
      pfarmgrid,
      plevelid,
      pfk_nomen_rls,
      trim(pfc_eancone),
      pfk_type,
      pfk_paytype,
      pkolfinu,
      pfedizmid,
      pfn_dozka,
      pfk_dozkaunit,
      pfl_lgota,
      trim(pfc_name_lat),
      pfl_print_lat_name
    ) returning medicid into res;

    if pfk_narco > 0 then
      insert into tmedic_tspecialmedic (medicid, fk_specialmedic)
      values (res,pfk_narco);
    end if;
  else
    update tmedic
    set
      fc_name         = trim(pfc_name),
      fc_comment      = trim(pfc_comment),
      uchgrid         = puchgrid,
      eiid            = peiid,
      farmgrid        = pfarmgrid,
      levelid         = plevelid,
      fk_nomen_rls    = pfk_nomen_rls,
      fc_eancode      = trim(pfc_eancone),
      fk_type         = pfk_type,
      fk_paytype      = pfk_paytype,
      fn_fpackinupack = pkolfinu,
      fk_fpackid      = pfedizmid,
      fn_mass         = pfn_dozka,
      fk_massunits    = pfk_dozkaunit,
      fl_lgota        = pfl_lgota,
      fc_name_lat     = trim(pfc_name_lat),
      fl_print_lat_name = pfl_print_lat_name
    where medicid = pmedicid;
    res := pmedicid;

    if pfk_narco > 0 then
      update tmedic_tspecialmedic
      set fk_specialmedic = pfk_narco
      where medicid = pmedicid;

      if sql%notfound then
        insert into tmedic_tspecialmedic (medicid, fk_specialmedic)
        values (pmedicid,pfk_narco);
      end if;
    else
      delete from tmedic_tspecialmedic
      where medicid = pmedicid;
    end if;
  end if;
  return res;
end;

FUNCTION DO_SET_AUTONOMUS (
      pfc_name      IN   VARCHAR2,
      pfc_comment   IN   VARCHAR2,
      puchgrid      IN   NUMBER,
      peiid         IN   NUMBER,
      pfarmgrid     IN   NUMBER,
      plevelid      IN   NUMBER,
--      ppku          in   number,
      pFK_TYPE      IN   NUMBER,
      pFK_PAYTYPE   IN   NUMBER,
      pFC_NAME_LAT  IN   VARCHAR2 DEFAULT NULL,
      pmedicid      IN   NUMBER DEFAULT -1,
      pFK_NOMEN_RLS IN   NUMBER DEFAULT 0,
      pFC_EanCone   IN   VARCHAR2 DEFAULT NULL,
      pKolFinU      IN   NUMBER DEFAULT NULL,
      pFEdizmId     IN   NUMBER DEFAULT NULL,
      pFN_Dozka     IN   NUMBER DEFAULT NULL,
      pFK_DozkaUnit IN   NUMBER DEFAULT NULL,
      PFK_NARCO     IN   NUMBER DEFAULT NULL,
      bRls          IN   NUMBER DEFAULT 1,
      pfl_print_lat_name In NUMBER DEFAULT 0
   )
     return number
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
  res number;
  EiCode NUMBER;
  RlsDrugForm VARCHAR2(1000);

  FEiCode NUMBER;
  RlsDrugPack Varchar2(1000);

  CURSOR cExistTei (aRlsCode IN NUMBER, aSign IN NUMBER) IS
    SELECT E.EIID FROM TEI E
    WHERE E.FK_RLSDRUGFORM = aRlsCode
      AND e.fl_xxx = aSign;
  CURSOR cRlsDrugForm(afk_id IN NUMBER) IS
    SELECT name as fc_name FROM Rls.CLSDRUGFORMS
    WHERE id = afk_id;
  CURSOR cRlsDrugPack(aFk_id IN NUMBER) IS
    SELECT p.name as fc_name FROM Rls.DRUGPACK p
    WHERE p.id = aFk_id;

   BEGIN
/*
      pKolFinU  - кол-во фасовочных единиц в 1-ой упаковочной
      pFEdizmId - единицы измерения фасовочных единиц
      pFN_Dozka     - Дозировка TMassUnits
      pFK_DozkaUnit - Ед. изм. Дозировки
      PFK_NARCO     - Наркотики, сильнодейств и ядовитые вещества
*/
      IF pmedicid = -1 THEN
----------ЫРШЕ------------------------
        IF bRls = 1 THEN
          OPEN cExistTei(peiid, 1); --peiid -- Rls Code (TDrugPack)
          FETCH cExistTei INTO EiCode; --Tei.eiid
          CLOSE cExistTei;

          IF eiCode IS NULL THEN
            OPEN cRlsDrugPack(peiid);
            FETCH cRlsDrugPack INTO RlsDrugPack;
            CLOSE cRlsDrugPack;
            /*вставляем нужную форму*/
            INSERT INTO Tei (Fc_Name,Fk_Rlsdrugform,Fl_Xxx)
            VALUES (RlsDrugPack,peiid,1) RETURNING Eiid INTO eiCode;
          END IF;
  ---------
          OPEN cExistTei(pFEdizmId, 0); -- pFEdizmId - Rls Code (TDrugForms)
          FETCH cExistTei INTO FEiCode; --Tei.eiid
          CLOSE cExistTei;

          IF FEiCode IS NULL THEN
            OPEN cRlsDrugForm(pFEdizmId);
            FETCH cRlsDrugForm INTO RlsDrugForm;
            CLOSE cRlsDrugForm;

            INSERT INTO Tei (Fc_Name,Fk_Rlsdrugform,Fl_Xxx)
            VALUES (RlsDrugForm,pFEdizmId,0) RETURNING Eiid INTO FEiCode;
          END IF;
        ELSE
          EiCode := peiid;
          FEiCode := pFEdizmId;
        END IF;
-----------------------------------
         INSERT INTO tmedic
                     (fc_name, fc_comment, uchgrid, eiid, farmgrid,
                      levelid, FK_NOMEN_RLS,FC_EANCODE, FK_TYPE,FK_PAYTYPE,
                      fn_fpackinupack,fk_fpackid,fn_mass,fk_massunits,FC_NAME_LAT, fl_print_lat_name)
         VALUES      (pfc_name, pfc_comment, puchgrid, EiCode, pfarmgrid,
                      plevelid, pFK_NOMEN_RLS,pFC_EanCone, pFK_TYPE,pFK_PAYTYPE,
                      pKolFinU,FEiCode,pFN_Dozka,pFK_DozkaUnit,pFC_NAME_LAT, pfl_print_lat_name) returning medicid into res;
        IF NVL(PFK_NARCO,-1) > 0 THEN
--        IF PFK_NARCO IS NOT NULL THEN
          INSERT INTO Tmedic_Tspecialmedic (Medicid, Fk_Specialmedic)
          VALUES (Res,PFK_NARCO);
        END IF;
      ELSE
         UPDATE tmedic
         SET    fc_name         = pfc_name,
                FC_NAME_LAT     = pFC_NAME_LAT,
                fc_comment      = pfc_comment,
                uchgrid         = puchgrid,
                eiid            = peiid,
                farmgrid        = pfarmgrid,
                levelid         = plevelid,
                FK_NOMEN_RLS    = pFK_NOMEN_RLS,
                FC_EANCODE      = pFC_EanCone,
                FK_TYPE         = pFK_TYPE,
                FK_PAYTYPE      = pFK_PAYTYPE,
                fn_fpackinupack = pKolFinU,
                fk_fpackid      = pFEdizmId,
                fn_mass         = pFN_Dozka,
                fk_massunits    = pFK_DozkaUnit,
                fl_print_lat_name = pfl_print_lat_name
         WHERE  medicid = pmedicid;
         res := pmedicid;

--         IF PFK_NARCO IS NOT NULL THEN
        IF NVL(PFK_NARCO,-1) > 0 THEN
           UPDATE Tmedic_Tspecialmedic
           SET fk_specialmedic = PFK_NARCO
           WHERE medicid = pmedicid;
           IF SQL%NOTFOUND THEN
             INSERT INTO Tmedic_Tspecialmedic (Medicid, Fk_Specialmedic)
             VALUES (pmedicid,PFK_NARCO);
           END IF;
         ELSE
           DELETE FROM Tmedic_Tspecialmedic
           WHERE medicid = pmedicid;
         END IF;

      END IF;
     COMMIT;
     RETURN RES;
   END DO_SET_AUTONOMUS;


/*------------------------------------------------------------------------------------------------------------------*\
|               dodel
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE dodel (pmedicid IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      DELETE FROM tmedic
      WHERE       medicid = pmedicid;

      COMMIT;
   END;

/*------------------------------------------------------------------------------------------------------------------*\
|               doInvisible
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE DoInvisible (pmedicid IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      UPDATE tmedic SET FL_VISIBLE = 0
      WHERE       medicid = pmedicid;

      COMMIT;
   END;

/*------------------------------------------------------------------------------------------------------------------*\
|               doVisible
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE DoVisible (pmedicid IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      UPDATE tmedic SET FL_VISIBLE = 1
      WHERE       medicid = pmedicid;

      COMMIT;
   END;

/*------------------------------------------------------------------------------------------------------------------*\
|               DoSetUchGroup
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE DoSetUchGroup (puchgrip IN NUMBER, pmedicid IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      UPDATE tmedic SET UCHGRID = puchgrip
      WHERE       medicid = pmedicid;

      COMMIT;
   END;


/*------------------------------------------------------------------------------------------------------------------*\
|               dodelcascade
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE dodelcascade (pmedicid IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      DELETE FROM tmedic
      WHERE       medicid = pmedicid;

      COMMIT;
   END;


/*------------------------------------------------------------------------------------------------------------------*\
|               getbyid
\*------------------------------------------------------------------------------------------------------------------*/
  procedure getbyid (
    pmedicid     in  number,
    pfc_name     out varchar2,
    pfc_comment  out varchar2,
    puchgrid     out number,
    peiid        out number,
    plevelid     out number,
    pfarmgrid    out number,
    ppku         out number,
    pfl_lgota    out integer,
    pfc_name_lat out varchar2,
    pfl_print_lat_name out integer
  ) is
  begin
    open cgetbyid (pmedicid);
    fetch cgetbyid into
      pfc_name,
      pfc_comment,
      puchgrid,
      peiid,
      pfarmgrid,
      plevelid,
      ppku,
      pfl_lgota,
      pfc_name_lat,
            pfl_print_lat_name;
    close cgetbyid;
  exception
    when others then
      close cgetbyid;
  end;

  function getnamebyid (pmedicid in number) return varchar2
  is
    l_name tmedic.fc_name%type;
  begin
    select fc_name into l_name
    from tmedic
    where medicid = pmedicid;

    return l_name;
  exception
    when no_data_found then
      return '';
  end;


/*------------------------------------------------------------------------------------------------------------------*\
|               getuchedizm
\*------------------------------------------------------------------------------------------------------------------*/
   FUNCTION getedizm (pmedicid IN NUMBER)
      RETURN NUMBER
   IS
      CURSOR c (lpmedicid IN NUMBER)
      IS
         SELECT eiid
         FROM   tmedic
         WHERE  medicid = lpmedicid;

      result   NUMBER;
   BEGIN
      OPEN c (pmedicid);
      FETCH c INTO result;
      CLOSE c;
      RETURN result;
   END getedizm;


/*------------------------------------------------------------------------------------------------------------------*\
|               getuchgrid
\*------------------------------------------------------------------------------------------------------------------*/
   FUNCTION getuchgrid (pmedicid IN NUMBER)
      RETURN NUMBER
   IS
      CURSOR c (lpmedicid IN NUMBER)
      IS
         SELECT tmedic.uchgrid
         FROM   tmedic
         WHERE  medicid = lpmedicid;

      result   NUMBER;
   BEGIN
      OPEN c (pmedicid);
      FETCH c INTO result;
      CLOSE c;
      RETURN result;
   END getuchgrid;


/*------------------------------------------------------------------------------------------------------------------*\
|               getfarmgrid
\*------------------------------------------------------------------------------------------------------------------*/
   FUNCTION getedizmname (pmedicid IN NUMBER)
      RETURN varchar2
   IS
      CURSOR c (lpmedicid IN NUMBER)
      IS
         SELECT tei.fc_name
         FROM   tmedic,tei
         WHERE  medicid = lpmedicid
          and tei.eiid=tmedic.eiid;

      result  varchar2(255);
   BEGIN
      OPEN c (pmedicid);
      FETCH c INTO result;
      CLOSE c;
      RETURN result;
   END;
   FUNCTION getedizmnameokei (pmedicid IN NUMBER)
      RETURN varchar2
   IS
      CURSOR c (lpmedicid IN NUMBER)
      IS
         SELECT tei.fc_name
         FROM   tmedic,tei
         WHERE  medicid = lpmedicid
          and tei.eiid=tmedic.eiid;

      result  varchar2(255);
   BEGIN
      OPEN c (pmedicid);
      FETCH c INTO result;
      CLOSE c;
      RETURN result;
   END;
   FUNCTION getfarmgrid (pmedicid IN NUMBER)
      RETURN NUMBER
   IS
      CURSOR c (lpmedicid IN NUMBER)
      IS
         SELECT tmedic.farmgrid
         FROM   tmedic
         WHERE  medicid = lpmedicid;

      result   NUMBER;
   BEGIN
      OPEN c (pmedicid);
      FETCH c INTO result;
      CLOSE c;
      RETURN result;
   END getfarmgrid;

  procedure medic_complex_add(p_medic_parent integer, p_medic_item integer)
  is
  begin
    insert into tmedicomplex(fk_medic, fk_medicitem, fn_amount)
    values(p_medic_parent, p_medic_item, 0);
  end;

  procedure medic_complex_set_amount(p_medic_item integer, p_amount number)
  is
  begin
    update tmedicomplex
    set fn_amount = p_amount
    where fk_medic = p_medic_item;
  end;

  procedure medic_complex_del(p_medic_parent integer, p_medic_item integer)
  is
  begin
    delete from tmedicomplex
    where fk_medic = p_medic_parent
      and fk_medicitem = p_medic_item;
  end;

  function medic_complex_can_del(p_medic_item integer) return integer
  is
    n integer;
  begin
    select count(1) into n
    from
      tdpc d,
      tkart k,
      tmedicomplex mc
    where k.medicid = mc.fk_medic
      and mc.fk_medicitem = p_medic_item
      and d.kartid = k.kartid;
    return n;
  end;

/*------------------------------------------------------------------------------------------------------------------*\
|               DoSetUchgrHistory
\*------------------------------------------------------------------------------------------------------------------*/

  procedure DoSetUchgrHistory
  ( p_medicid in number ,
    p_uchgrid in number,
    p_newuchgrid in number,
    p_moid in number
  ) is
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_CurrDate date ;
    v_TmpUchGrId med.tmedic.uchgrid%type;
  begin
    v_CurrDate := trunc ( sysdate );

    -- добавление новой записи в хронологию
    delete from MED.TMEDIC_CHRONO T
     where T.MEDICID = p_medicid
       and trunc ( t.date_end ) = v_CurrDate
    returning max( t.UCHGRID ) into v_TmpUchGrId;

    if ( p_newuchgrid <> nvl ( v_TmpUchGrId, P_UCHGRID ) ) then
    insert into med.tmedic_chrono t
          (MEDICID, DATE_END, UCHGRID, MOID )
      values(P_MEDICID, v_CurrDate, nvl ( v_TmpUchGrId, P_UCHGRID ), P_MOID);
    end if;
    commit;
  end;
  
/*------------------------------------------------------------------------------------------------------------------*\
|               gt_uch_group
\*------------------------------------------------------------------------------------------------------------------*/
  function gt_uch_group
  (
    p_medicid in med.tmedic.medicid%type,
                          p_main_uch_grp in med.tmedic.uchgrid%type,
                          p_date    in date := sysdate
                        )
  return number
  is
    cursor c is
    select tch.uchgrid
          from med.tmedic_chrono tch
         where tch.medicid = p_medicid
       and trunc ( tch.date_end ) > trunc ( p_date )
       and rownum = 1
     order by tch.Date_end asc;

    v_res number;
  begin
     OPEN c;
     FETCH c INTO v_res;
     IF c%NOTFOUND THEN
       v_res:=p_main_uch_grp;
    end if;
     CLOSE c;

     RETURN v_res;
  end;                      

/*------------------------------------------------------------------------------------------------------------------*\
|               DoSetUchgridForTKart
\*------------------------------------------------------------------------------------------------------------------*/
  procedure DoSetUchgridForTKart
  (
    p_medicid in number,
    p_newuchgrid in number,
    p_date date
  ) is
    PRAGMA AUTONOMOUS_TRANSACTION;
  begin
    -- доделать
    update med.tkart k
       set k.uchgrid = p_newuchgrid
     where k.medicid = p_medicid
       and nvl ( k.uchgrid, -1 ) <> p_newuchgrid
       and exists ( select 1
                      from med.tdocs d
                     inner join ( select min(d.dpid) as dpid,
                                         dp.kartid
                                    from med.tdocs d
                                   inner join med.tdpc dp
                                      on d.dpid = dp.dpid
                                   where d.dpid = dp.dpid
                                     and d.fp_vid = 1
                                   group by dp.kartid ) p
                        on p.dpid = d.dpid
                       and trunc ( d.fd_data ) >= trunc ( p_date )
                     where k.kartid = p.kartid ) ;

    commit;
  end;
  
  function GetUchgrFullPathName ( pUCHGRID in number) return varchar2
  is
    vUCHGR_NAME med.TUCHGR.FC_UCHGR%type;
    vRes varchar2(300);
    cursor cur ( p_UCHGRID in number)
    is
      select u.FC_UCHGR
        from med.TUCHGR u
       connect by prior u.PARENTID = u.UCHGRID
      start with u.UCHGRID = p_UCHGRID
      order by level desc;
  begin
    vRes := '';
    open cur (pUCHGRID);
    loop  
      fetch cur into vUCHGR_NAME ;
      exit when cur%NOTFOUND; 
               
      if vRes is not null then      
        vRes:= vRes||'->';
      end if;            
      vRes := vRes || vUCHGR_NAME ; 
    end loop;
    
    close cur; 
    
    return vRes;
  end;    
  
  function ISMEDICSEQUAL ( pMEDICID1 in number, pMEDICID2 in number, pUseComplexCompare in number default 0 ) 
    return smallint /* boolean */ is   
    vMatches pls_integer;  
    --Res boolean;
    Res smallint;
  begin  
    select COUNT(1)
      into vMatches
      from ( select m.MEDICID, 
                    trim(upper(m.FC_INTERNATIONAL_NAME)) as FC_INTERNATIONAL_NAME,
                    m.FK_FPACKID,
                    trim(upper(ei.FC_NAME)) FC_FPACK,
                    m.FN_MASS,
                    m.FK_MASSUNITS,
                    trim(upper(mu.FC_SHORTNAME)) FC_MASSUNITS
               from med.tmedic m                 
               left join med.TEI ei
                 on m.FK_FPACKID = ei.EIID
               left join med.TMASSUNITS mu
                 on m.FK_MASSUNITS = mu.FK_ID
              where m.MEDICID = pMEDICID1 ) m
     inner join ( select m.MEDICID, 
                        trim(upper(m.FC_INTERNATIONAL_NAME)) as FC_INTERNATIONAL_NAME,
                        m.FK_FPACKID,
                        trim(upper(ei.FC_NAME)) FC_FPACK,
                        m.FN_MASS,
                        m.FK_MASSUNITS,
                        trim(upper(mu.FC_SHORTNAME)) FC_MASSUNITS
                   from med.tmedic m                 
                   left join med.TEI ei
                     on m.FK_FPACKID = ei.EIID
                   left join med.TMASSUNITS mu
                     on m.FK_MASSUNITS = mu.FK_ID
                  where m.MEDICID = pMEDICID2 ) s
        on ( m.MEDICID = s.MEDICID ) -- это один и тот же медикамент
        or ( pUseComplexCompare = 1 and  -- комплексный подбор
             -- по МНН
             m.FC_INTERNATIONAL_NAME = s.FC_INTERNATIONAL_NAME  
             -- по фас.ед. изм.
             and ( m.FK_FPACKID = s.FK_FPACKID or  -- по коду
                   m.FC_FPACK = s.FC_FPACK ) -- по наименованию /* костыль, т.к. в справочнике несколько ед. изм с одним названием, но с разными кодами */
             -- по массе ЛФ
             and m.FN_MASS = s.FN_MASS
             -- по ед. изм ЛФ
             and ( m.FK_MASSUNITS = s.FK_MASSUNITS or  -- по коду
                   m.FC_MASSUNITS = s.FC_MASSUNITS ) -- по наименованию /* костыль, т.к. в справочнике несколько ед. изм с одним названием, но с разными кодами */
           ) ;
    
    if (vMatches > 0 ) then
      Res := 1;
    else
      Res := 0;
    end if;     
      
    return Res;
  end;                              
  
end;
/
