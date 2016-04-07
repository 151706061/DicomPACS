DROP PACKAGE BODY ASU.PKG_GET_RODI_DATA
/

--
-- PKG_GET_RODI_DATA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_GET_RODI_DATA" 
IS

  function GetNazOsmotr(pPacID Number) RETURN NUMBER IS
    vBeremDocVid  number := 462; --амбулаторная карта
    vSmidOsmotrID number := 427598; --осмотр акушера-гинеколога
    vPeople       number := asu.pkg_regist_pacfunc.get_pepl_id(pPacID);
    vNazOsmotr NUMBER := 0;
  begin
    --назначение из которого взять данные
    select max(fk_id)
      into vNazOsmotr
      from asu.vnaz
     where fk_pacid = (select max(a.fk_id)
                         from asu.tambulance a, asu.tdocobsl o
                        where a.fk_docobsl = o.fk_id
                          and o.fk_viddocid = vBeremDocVid
                          and a.fk_peplid = vPeople)
       and fk_smid = vSmidOsmotrID
       and fk_nazsosid = get_vipnaz;

    if vNazOsmotr is null then
      return 0;
    end if;
    return vNazOsmotr;
  end;


  function GetPacBerem(pPacID Number) RETURN NUMBER IS
    vBeremDocVid  number := 462; --амбулаторная карта
    vSmidOsmotrID number := 427598; --осмотр акушера-гинеколога
    vPeople       number := asu.pkg_regist_pacfunc.get_pepl_id(pPacID);
    vNazOsmotr NUMBER := 0;
  begin
    --назначение из которого взять данные
    select max(fk_pacid)
      into vNazOsmotr
      from asu.vnaz
     where fk_pacid = (select max(a.fk_id)
                         from asu.tambulance a, asu.tdocobsl o
                        where a.fk_docobsl = o.fk_id
                          and o.fk_viddocid = vBeremDocVid
                          and a.fk_peplid = vPeople)
       and fk_smid = vSmidOsmotrID
       and fk_nazsosid = get_vipnaz;

    if vNazOsmotr is null then
      return 0;
    end if;
    return vNazOsmotr;
  end;

function GetResult(pSmidSynOsm Varchar2, pVarType Varchar2,  pNazOsmotr  Number) return varchar is
begin
  if  pSmidSynOsm = 'EXP_ANAMNEZ' then
    Return GetLsDate(pNazOsmotr);
  else if pVarType = 'COMBOBOX' then
    Return to_char(GetCombo(pSmidSynOsm, pNazOsmotr));
  else if pVarType = 'EDIT' then
    Return GetEdit(pSmidSynOsm, pNazOsmotr);
  else if pVarType = 'NUMBER' then
    Return to_char(GetNumber(pSmidSynOsm, pNazOsmotr));
  else if pVarType = 'DATA' then
    Return GetDate(pSmidSynOsm, pNazOsmotr);
  else
    Return ' ';
  end if;
  end if;
  end if;
  end if;
  end if;
end;

function GetResult(pSmidID NUMBER, pVarType Varchar2,  pNazOsmotr  Number) return varchar is
begin

  if pVarType = 'COMBOBOX' then
    Return to_char(GetCombo(pSmidID, pNazOsmotr));
  else if pVarType = 'EDIT' then
    Return GetEdit(pSmidID, pNazOsmotr);
  else if pVarType = 'NUMBER' then
    Return to_char(GetNumber(pSmidID, pNazOsmotr));
  else if pVarType = 'DATA' then
    Return  GetDate(pSmidID, pNazOsmotr);
  else
    Return ' ';
  end if;
  end if;
  end if;
  end if;
end;

function GetCombo(pSmidSynOsm Varchar2, pNazOsmotr  Number) RETURN NUMBER is
    vSmidOsm Number;
    vCombo   Number;
begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);

    select max(i.fk_smid)
      into vCombo
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid = vSmidOsm;
    RETURN vCombo;
end;

function GetEdit(pSmidSynOsm Varchar2, pNazOsmotr  Number) RETURN VARCHAR is
    vEdit Varchar2(4000);
    vSmidOsm Number;
begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);

    select max(i.FC_CHAR)
      into vEdit
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid = vSmidOsm;
    RETURN vEdit;
end;


  ----------------------------------------------------------------
function GetNumber(pSmidSynOsm Varchar2, pNazOsmotr  Number) RETURN NUMBER is
    vNumber  Number;
    vSmidOsm Number;
begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);
    select max(i.FN_NUM)
      into vNumber
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid = vSmidOsm;
    RETURN vNumber;
end;

  ----------------------------------------------------------------
function GetDate(pSmidSynOsm Varchar2, pNazOsmotr  Number) RETURN VARCHAR is
    vDate Varchar2(50);
    vSmidOsm Number;
begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);
    select to_char(max(i.FD_DATE), 'dd.mm.yyyy')
      into vDate
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid = vSmidOsm;
    RETURN vDate;
end;

function GetLsDate(pPacID NUMBER) RETURN Varchar2 is
    vRes VARCHAR2(255);
begin
    SELECT MAX('№'||F.FC_NUMBER  || ' с ' || TO_CHAR(asu.get_sl_begin(I.FK_ID),'DD.MM.YYYY') || ' по ' || TO_CHAR(asu.get_sl_end(I.FK_ID),'DD.MM.YYYY') )
           INTO vRes
    FROM asu.TSLINFO I, asu.TSLFORM F
    WHERE FK_PACID = GetPacBerem(pPacID)
    AND F.FK_ID(+) = I.FK_SLFORMID;
    RETURN vRes;
end;



function GetCombo(pSmidID Number, pNazOsmotr  Number) RETURN NUMBER is
    vSmidOsm Number;
    vCombo   Number;
begin
    vSmidOsm := pSmidID;

    select max(i.fk_smid)
      into vCombo
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid = vSmidOsm;
    RETURN vCombo;
end;

function GetEdit(pSmidID Number, pNazOsmotr  Number) RETURN VARCHAR is
    vEdit Varchar2(4000);
    vSmidOsm Number;
begin
    vSmidOsm := pSmidID;

    select max(i.FC_CHAR)
      into vEdit
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid = vSmidOsm;
    RETURN vEdit;
end;


  ----------------------------------------------------------------
function GetNumber(pSmidID Number, pNazOsmotr  Number) RETURN NUMBER is
    vNumber  Number;
    vSmidOsm Number;
begin
    vSmidOsm := pSmidID;
    select max(i.FN_NUM)
      into vNumber
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid = vSmidOsm;
    RETURN vNumber;
end;


  ----------------------------------------------------------------
function GetDate(pSmidID Number, pNazOsmotr  Number) RETURN VARCHAR is
    vDate  VARCHAR2(50);
    vSmidOsm Number;
begin
    vSmidOsm := pSmidID;
    select to_char(max(i.FD_DATE), 'dd.mm.yyyy')
      into vDate
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smeditid = vSmidOsm;
    RETURN vDate;

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
    vIbId    Number;
  begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);
    vSmidPac := stat.pkg_statutil.get_smidid(pSmidSynPac);

    select max(i.fd_date), max(i.fk_vrachid)
      into vDate, vVrachID
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smid = vSmidOsm;

    if (vDate is not null) then
      select max(fk_id)
        into vIbId
        from asu.tib
       where fk_pacid = pPacID
         and fk_smid = vSmidPac
         and fk_smeditid = vSmidPac;
      if (vIbId is null) then
        insert into asu.tib
          (fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date)
        values
          (pPacID, vSmidPac, vSmidPac, vVrachID, vDate);
      else
        update asu.tib i
           set i.fd_date = vDate, i.fk_vrachid = vVrachID
         where fk_id = vIbId;
      end if;
    end if;
  end;

  ----------------------------------------------------------------
  procedure DoNumber(pPacID      Number,
                     pSmidSynOsm Varchar2,
                     pSmidSynPac Varchar2,
                     pNazOsmotr  Number) is
    vVrachID number;
    vSmidOsm Number;
    vSmidPac Number;
    vNumber  Number;
    vIbId    Number;
  begin
    vSmidOsm := stat.pkg_statutil.get_smidid(pSmidSynOsm);
    vSmidPac := stat.pkg_statutil.get_smidid(pSmidSynPac);

    select max(i.fn_num), max(i.fk_vrachid)
      into vNumber, vVrachID
      from asu.tib i
     where fk_pacid = pNazOsmotr
       and fk_smid = vSmidOsm;

    if (vNumber is not null) then
      select max(fk_id)
        into vIbId
        from asu.tib
       where fk_pacid = pPacID
         and fk_smid = vSmidPac
         and fk_smeditid = vSmidPac;
      if (vIbId is null) then
        insert into asu.tib
          (fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fn_num)
        values
          (pPacID, vSmidPac, vSmidPac, vVrachID, vNumber);
      else
        update asu.tib i
           set i.fn_num = vNumber, i.fk_vrachid = vVrachID
         where fk_id = vIbId;
      end if;
    end if;
  end;


END;
/

SHOW ERRORS;


