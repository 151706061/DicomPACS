--begin
--  asu.pkg_smini.WRITESTRING('medica.exe','FUNC_USE_MEDUCHGRP_CH','1');
--end;
/

-- Add comments to the columns 
comment on column MED.TMEDIC.UCHGRID
  is 'код учетной группы';
/  
-- Create table
create table MED.TMEDIC_CHRONO
(
  MEDICID  NUMBER(9) not null,
  DATE_BEG DATE not null,
  DATE_END DATE not null,
  UCHGRID  NUMBER(9)
)
tablespace USR
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
/  
-- Add comments to the columns 
comment on column MED.TMEDIC_CHRONO.MEDICID
  is 'код tmedic.medicid ';
/  
comment on column MED.TMEDIC_CHRONO.DATE_BEG
  is 'дата начала действия';
/  
comment on column MED.TMEDIC_CHRONO.DATE_END
  is 'дата окончания действия';
/  
comment on column MED.TMEDIC_CHRONO.UCHGRID
  is 'код группы учета';
/  
-- Create/Recreate primary, unique and foreign key constraints 
alter table MED.TMEDIC_CHRONO
  add constraint TMEDIC_CHRONO_PK primary key (MEDICID, DATE_BEG, DATE_END)
  using index 
  tablespace USR
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

/  
alter table MED.TMEDIC_CHRONO
  add constraint TMEDIC_CHRONO_FK foreign key (MEDICID)
  references MED.TMEDIC (MEDICID) on delete cascade;

/  
CREATE OR REPLACE TRIGGER "MED"."TMEDIC_BEFORE_DELETE" 
 BEFORE 
 DELETE
 ON MED.TMEDIC
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
begin
  DELETE FROM TKARTCOMPOS
  WHERE FK_MEDICID = :OLD.MEDICID;

  DELETE FROM TMEDICOMPLEX
  WHERE FK_MEDIC = :OLD.MEDICID;

  DELETE FROM TMEDIC_TSPECIALMEDIC
  WHERE MEDICID = :OLD.MEDICID;
  
  DELETE FROM MED.TMEDIC_CHRONO 
  WHERE MEDICID = :OLD.MEDICID;

--  if (:OLD.FL_EQUIPMENT = 1) then
--    UPDATE ASU_ITEMS.TITEMS set FN_DELETED = 1 where FK_ID = :OLD.FK_TITEMS;
--  end if;
end;

/  
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
  
  procedure change_medic_uchgroup( p_medicid  med.tmedic.medicid%type, p_uchgrid med.tmedic.uchgrid%type );
  
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
  
  procedure change_medic_uchgroup( p_medicid  med.tmedic.medicid%type, p_uchgrid med.tmedic.uchgrid%type ) is
    v_max_date        date;
    v_null_date date := to_date('01.01.1900','dd.mm.yyyy');
  begin
    select max(t2.date_end)
      into v_max_date
      from med.tmedic_chrono t2
     where t2.medicid = p_medicid;
    -- добавление новой записи в хронологию
    delete from med.tmedic_chrono t where t.medicid=p_medicid
    and date_beg=nvl(v_max_date,v_null_date)
    and date_end=trunc(sysdate, 'dd');
    insert into med.tmedic_chrono t
      (medicid, date_beg, date_end, uchgrid) values
      (p_medicid, nvl(v_max_date,v_null_date), trunc(sysdate, 'dd'), p_uchgrid);
    commit;
  end;
  
end;

/  





  
