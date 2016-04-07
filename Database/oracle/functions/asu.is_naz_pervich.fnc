DROP FUNCTION ASU.IS_NAZ_PERVICH
/

--
-- IS_NAZ_PERVICH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBTALON_NAZ (Table)
--   GET_VIPNAZ (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_NAZ_PERVICH" (pNazID in number) return number is
  --Nebary: возвращает первичное назначение или повторное
  cursor cData is
    select v.fk_pacid,
           v.fk_smid
      from vnaz v
     where v.fk_id = pNazID;
  cursor cPervich(nPacID in number, nSMID number) is
    select decode(tperv.rn, 1, 1, 0) as fl_perv
      from (select fk_id,
                   rownum as rn
              from (select v.fk_id,
                           v.fk_smid
                      from vnaz v
                     where v.fk_pacid = nPacID
                       and v.fk_smid = nSMID
                       and v.fk_nazsosid = asu.get_vipnaz
                     order by v.fd_naz)) tperv
     where tperv.fk_id = pNazID

    union

    select decode(tperv.rn, 1, 1, 0) as fl_perv
      from (select fk_id,
                   rownum as rn
              from (select v.fk_id,
                           v.fk_smid
                      from vnaz v,
                           tambtalon_naz a
                     where v.fk_smid = nSMID
                       and a.fk_nazid = v.fk_id
                       and a.fk_talonid = nPacID
                     order by v.fd_naz)) tperv
     where tperv.fk_id = pNazID;

  nPacID number;
  nSMID  number;
  nRes   number;
begin
  open cData;
  fetch cData
    into nPacID, nSMID;
  if cData%notfound then
    return(1);
  end if;
  close cData;

  open cPervich(nPacID, nSMID);
  fetch cPervich
    into nRes;
  if cPervich%notfound then
    return(1);
  end if;
  close cPervich;

  return(nRes);
end is_naz_pervich;
/

SHOW ERRORS;


