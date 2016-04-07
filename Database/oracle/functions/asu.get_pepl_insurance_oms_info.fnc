DROP FUNCTION ASU.GET_PEPL_INSURANCE_OMS_INFO
/

--
-- GET_PEPL_INSURANCE_OMS_INFO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPAC_INSURANCE (Table)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TAMBULANCE (Table)
--   TINSURDOCS (Table)
--   GET_COMPANY_LONGNAME (Function)
--   GET_COMPANY_SHORTNAME (Function)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_PEPL_INSURANCE_OMS_INFO (pFK_PEPLID IN BINARY_INTEGER, pFL_ALL IN NUMBER := 0) return varchar2 is
  -- Added by Slusarenko 31.10.2011
  -- Возвращает данные пипла о номере страхового полиса ОМС и название страховой компании:
  --   pFL_ALL = 0 - серия и номер полиса + полное название страховой компании
  --   pFL_ALL = 1 - серия полиса
  --   pFL_ALL = 2 - номер полиса
  --   pFL_ALL = 3 - серия и номер полиса
  --   pFL_ALL = 4 - короткое название страховой компании
  --   pFL_ALL = 5 - полное название страховой компании
  --   pFL_ALL = 6 - дата окончания действия полиса

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
           trunc(ind.fd_end) AS fd_end
      from tkarta k,
           tpac_insurance pins,
           tinsurdocs ind
     where pins.fk_pacid = k.fk_id
       and ind.fk_id = pins.fk_insurdocid
       and ind.fk_typedocid = 1 -- ОМС
       and sysdate between ind.fd_begin and nvl(ind.fd_end, sysdate)
       and k.fk_peplid = pFK_PEPLID

    union all

    select distinct
           nvl(trim(ind.fc_ser), ' ') AS polis_ser,
           nvl(trim(ind.fc_num), ' ') AS polis_num,

           ind.fk_companyid AS compony_id,
           nvl(trim(asu.get_company_longname(ind.fk_companyid)), ' ') AS company_name,
           nvl(trim(asu.get_company_shortname(ind.fk_companyid)), ' ') AS company_shortname,
           'A' AS ka,
           ind.fd_begin,
           trunc(ind.fd_end) AS fd_end
      from tambulance a,
           tambtalon t,
           tambtalon_naz tn,
           vnaz n,
           tinsurdocs ind
     where t.fk_ambid = a.fk_id
       and ind.fk_id = t.fk_insuranceid
       and tn.fk_talonid (+) = t.fk_id
       and tn.fk_nazid = n.fk_id (+)
       and ind.fk_typedocid = 1 -- ОМС
       and sysdate between ind.fd_begin and nvl(ind.fd_end, sysdate)
       and a.fk_peplid = pFK_PEPLID

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


