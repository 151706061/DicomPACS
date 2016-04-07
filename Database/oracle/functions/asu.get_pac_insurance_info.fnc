DROP FUNCTION ASU.GET_PAC_INSURANCE_INFO
/

--
-- GET_PAC_INSURANCE_INFO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPAC_INSURANCE (Table)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TAMBULANCE (Table)
--   TTYPEDOC (Table)
--   TINSURDOCS (Table)
--   GET_COMPANY_LONGNAME (Function)
--   GET_COMPANY_SHORTNAME (Function)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_PAC_INSURANCE_INFO (pFK_PACID IN BINARY_INTEGER, pFK_TALONID in binary_integer := -1, pFL_ALL IN NUMBER := 0) return varchar2 is
  -- Added by Slusarenko 31.10.2011
  -- Возвращает данные пациента о номере страхового полиса ОМС и название страховой компании:
  --   pFL_ALL = 0 - серия и номер полиса + полное название страховой компании
  --   pFL_ALL = 1 - серия полиса
  --   pFL_ALL = 2 - номер полиса
  --   pFL_ALL = 3 - серия и номер полиса
  --   pFL_ALL = 4 - короткое название страховой компании
  --   pFL_ALL = 5 - полное название страховой компании
  --   pFL_ALL = 6 - дата окончания действия полиса
  --   pFL_ALL = 7 - синоним типа полиса (OMS, DMS, DOGOVOR и т.д.)

  Result varchar2(1000) := ' ';

  cursor c is
    select distinct
           nvl(trim(ind.fc_ser), ' ') AS polis_ser,
           nvl(trim(ind.fc_num), ' ') AS polis_num,

           ind.fk_companyid AS compony_id,
           nvl(trim(asu.get_company_longname(ind.fk_companyid)), ' ') AS company_name,
           nvl(trim(asu.get_company_shortname(ind.fk_companyid)), ' ') AS company_shortname,
           'K' AS ka,
           ind.fd_begin,
           trunc(ind.fd_end) AS fd_end,
           d.fc_synonim AS fc_type_doc_synonim
      from asu.tkarta k,
           asu.tpac_insurance pins,
           asu.tinsurdocs ind,
           asu.ttypedoc d
     where pins.fk_pacid = k.fk_id
       and ind.fk_id = pins.fk_insurdocid
       and ind.fk_typedocid = d.fk_id
--       and ind.fk_typedocid = 1 -- ОМС
       and ( (sysdate between ind.fd_begin and nvl(nvl(ind.fd_prolong, ind.fd_end), sysdate)) or (d.fc_synonim in ('BUDZHET', 'OBOSNOVANIE', 'KOMERC')) )
       --and k.fk_peplid = pFK_PEPLID
       and k.fk_id = pFK_PACID

    union all

    select distinct
           nvl(trim(ind.fc_ser), ' ') AS polis_ser,
           nvl(trim(ind.fc_num), ' ') AS polis_num,

           ind.fk_companyid AS compony_id,
           nvl(trim(asu.get_company_longname(ind.fk_companyid)), ' ') AS company_name,
           nvl(trim(asu.get_company_shortname(ind.fk_companyid)), ' ') AS company_shortname,
           'A' AS ka,
           ind.fd_begin,
           trunc(ind.fd_end) AS fd_end,
           d.fc_synonim AS fc_type_doc_synonim
      from asu.tambulance a,
           asu.tambtalon t,
           asu.tambtalon_naz tn,
           asu.vnaz n,
           asu.tinsurdocs ind,
           asu.ttypedoc d
     where t.fk_ambid = a.fk_id
       and ind.fk_id = t.fk_insuranceid
       and tn.fk_talonid (+) = t.fk_id
       and tn.fk_nazid = n.fk_id (+)
       and ind.fk_typedocid = d.fk_id
--       and ind.fk_typedocid = 1 -- ОМС
       and ( (sysdate between ind.fd_begin and nvl(nvl(ind.fd_prolong, ind.fd_end), sysdate)) or (d.fc_synonim in ('BUDZHET', 'OBOSNOVANIE', 'KOMERC')) )
       --and a.fk_peplid = pFK_PEPLID
       and a.fk_id = pFK_PACID
       and t.fk_id = pFK_TALONID

     order by fd_begin desc;

    ins c%rowtype;

begin
  open  c;
  fetch c into ins;

    if (c%found) then
      if (pFL_ALL = 0) then
        Result := nvl(trim(ins.polis_ser) || ' ' || trim(ins.polis_num), ' ') || '%' || ins.company_name;
      elsif (pFL_ALL = 1) then
        Result := ins.polis_ser;
      elsif (pFL_ALL = 2) then
        Result := ins.polis_num;
      elsif (pFL_ALL = 3) then
        Result := nvl(trim(ins.polis_ser) || ' ' || trim(ins.polis_num), ' ');
      elsif (pFL_ALL = 4) then
        Result := ins.company_shortname;
      elsif (pFL_ALL = 5) then
        Result := ins.company_name;
      elsif (pFL_ALL = 6) then
        Result := to_char(ins.fd_end);
      elsif (pFL_ALL = 7) then
        Result := to_char(ins.fc_type_doc_synonim);
      end if;

    end if;

  close c;

  Result := trim(Result);

  if (substr(Result, length(Result), 1) = '%') then
    Result := substr(Result, 1, length(Result)-1);
  end if;

  Result := replace(Result, '%', ', ');

  Result := nvl(Result, ' ');

  return (Result);
end;
/

SHOW ERRORS;


