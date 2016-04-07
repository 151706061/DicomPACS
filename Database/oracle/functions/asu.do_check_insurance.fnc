DROP FUNCTION ASU.DO_CHECK_INSURANCE
/

--
-- DO_CHECK_INSURANCE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TINSURDOCS (Table)
--   PKG_REGIST_PEPLFUNC (Package)
--
CREATE OR REPLACE FUNCTION ASU."DO_CHECK_INSURANCE" (pFC_SER IN VARCHAR2,pFC_NUM IN VARCHAR2,pFK_COMPANYID IN NUMBER,pFK_PEPLID IN NUMBER)
-- Modyfied by Nefedov S.M. 28.04.2006 for new Insurance
  return varchar2 is -- Created by TimurLan
  CURSOR cCount1 is
    SELECT FK_PEPLID
      FROM TINSURDOCS
     WHERE TRIM(FC_SER||FC_NUM)=TRIM(pFC_SER||pFC_NUM)
       AND FK_COMPANYID=pFK_COMPANYID
       AND FK_PEPLID<>pFK_PEPLID;
/*  CURSOR cCount2 is
    SELECT FK_PEPLID
      FROM TINSURANCE
     WHERE FC_SER is NULL
       AND FC_NUM=pFC_NUM
       AND FK_COMPANYID=pFK_COMPANYID
       AND FK_PEPLID<>pFK_PEPLID;*/
  Result varchar2(32767);
  nTemp NUMBER;
begin
/*  if pFC_SER is null then
    open cCount2;
    fetch cCount2 into nTemp;
    close cCount2;
  else*/
    open cCount1;
    fetch cCount1 into nTemp;
    close cCount1;
--  end if;

  if nTemp > 0 then
    Result := '('||PKG_REGIST_PEPLFUNC.GET_PEPL_FULLFIO(nTemp)||')';
  end if;

  return(Result);
end DO_CHECK_INSURANCE;
/

SHOW ERRORS;


