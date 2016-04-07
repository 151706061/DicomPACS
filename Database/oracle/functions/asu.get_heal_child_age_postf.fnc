DROP FUNCTION ASU.GET_HEAL_CHILD_AGE_POSTF
/

--
-- GET_HEAL_CHILD_AGE_POSTF  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_HEAL_CHILD_AGE_POSTF(aAgeInMonth NUMBER) RETURN VARCHAR2 IS
  vResult VARCHAR2(2);
  vAgeInYear Number;
  vAgeInMonth Number;
begin
  vAgeInMonth := TRUNC(aAgeInMonth);
  vAgeInYear := TRUNC(aAgeInMonth / 12);

  select case when vAgeInMonth < 1 then '01'
              when vAgeInMonth = 1 then '02'
              when vAgeInMonth in (2, 4, 5, 7, 8, 10, 11, 15, 21, 30) then '03'
              when vAgeInMonth in (3, 6) then '04'
              when vAgeInMonth in (9, 18) then '05'
              when vAgeInYear = 1 then '06'
              when vAgeInYear = 2 then '07'
              when vAgeInYear = 3 then '08'
              when vAgeInYear in (4, 5) then '09'
              when vAgeInYear = 6 then '10'

              when vAgeInYear = 7 then '11'
              when vAgeInYear in (8, 9, 13) then '12'
              when vAgeInYear = 10 then '13'
              when vAgeInYear = 11 then '14'
              when vAgeInYear = 12 then '15'
              when vAgeInYear = 14 then '16'
              when vAgeInYear in (15, 16, 17) then '17'
         else
         '%'
         end FN_POSTF
        into vResult
    from dual;

  return(vResult);
end;
/

SHOW ERRORS;


