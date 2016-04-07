DROP FUNCTION ASU.GET_WORK_AGE
/

--
-- GET_WORK_AGE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPEOPLES (Table)
--   GET_PEPLID (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_work_age(pacid in number)
  RETURN number IS

cRes number;
nSex number;
nAge number;

cursor cSex is select fp_sex from asu.tpeoples where fk_id = asu.get_peplid(pacid);
cursor cAge is select trunc(months_between(sysdate,fd_rojd)/12) from asu.tpeoples where fk_id = asu.get_peplid(pacid);
BEGIN
  cRes := 0;
  open cSex;
  fetch cSex into nSex;
  close cSex;

  if nSex = 0 then
    open cAge;
    fetch cAge into nAge;
    close cAge;
    if nAge >= 55 then
      cRes := 1;
    end if;
  end if;

  if nSex = 1 then
    open cAge;
    fetch cAge into nAge;
    close cAge;
    if nAge >= 60 then
      cRes := 1;
    end if;
  end if;

  RETURN cRes;
END;
/

SHOW ERRORS;


