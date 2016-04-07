DROP FUNCTION ASU.GET_ALLERGY
/

--
-- GET_ALLERGY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TALLERGY (Table)
--   GET_SMIDNAME (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_allergy(pPEPLID IN NUMBER, pType IN NUMBER)
  RETURN varchar2 IS

  sRes varchar2(4000);

/*  cursor cAllergy is select asu.get_smidname(t2.fk_smid) as fc_name
                       from asu.vnaz t1, asu.tib t2
                      where t1.fk_id = t2.fk_pacid
                        and t1.fk_nazsosid = asu.get_vipnaz
                        and t1.fk_pacid in (select fk_id from asu.tkarta where fk_peplid = pPEPLID
                                            union all
                                            select fk_id from asu.tambulance where fk_peplid = pPEPLID)
                        and t2.fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = 'PD_LEKALERG')
                        order by t1.fd_run; */

/*  cursor cAction is select asu.get_smidname(t2.fk_smid) as fc_name
                     from asu.vnaz t1, asu.tib t2
                    where t1.fk_id = t2.fk_pacid
                      and t1.fk_nazsosid = asu.get_vipnaz
                      and t1.fk_pacid in (select fk_id from asu.tkarta where fk_peplid = pPEPLID
                                          union all
                                          select fk_id from asu.tambulance where fk_peplid = pPEPLID)
                      and t2.fk_smeditid = (select fk_id from asu.tsmid where fc_synonim = 'PD_POBOCHD')
                      order by t1.fd_run;  */


  cursor cAllergy is select asu.get_smidname(fk_smid) as fc_name
                       from asu.tallergy
                      where fk_peplid = pPEPLID
                     order by fd_date;

  cursor cAction is select fc_char as fc_name
                      from asu.tallergy
                     where fk_peplid = pPEPLID
                       and fc_char is not null
                    order by fd_date;


BEGIN
  if pType = 1 then -- лекарственная непереносимость
    for c in cAllergy loop
      sRes := sRes ||c.fc_name||', ';
    end loop;
  end if;
  if pType = 2 then -- характер побочного действия
    for c in cAction loop
      sRes := sRes ||c.fc_name||', ';
    end loop;
  end if;
  sRes := substr(sRes, 1, length(sRes)-2);
  RETURN sRes ;
END;
/

SHOW ERRORS;


