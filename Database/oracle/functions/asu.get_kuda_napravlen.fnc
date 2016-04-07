DROP FUNCTION ASU.GET_KUDA_NAPRAVLEN
/

--
-- GET_KUDA_NAPRAVLEN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_SMIDNAME (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_KUDA_NAPRAVLEN" (pfk_pacid in number)
  return varchar2 is

  cRes varchar2(1000);
  cursor cTib is select asu.get_smidname(fk_smid) as kuda
                   from asu.tib
                  where fk_pacid = pfk_pacid
                    and fk_smid in (select fk_id
                                      from asu.tsmid
                                     where fk_owner in (select fk_id
                                                          from asu.tsmid
                                                         where fc_synonim = 'XRAY_KUDA_NAPRAVLEN'));
begin
  for c in cTib loop
    cRes := cRes||c.kuda||', ';
  end loop;
  cRes := substr(cRes, 1, length(cRes)-2);
  return cRes;
end GET_KUDA_NAPRAVLEN;
/

SHOW ERRORS;


