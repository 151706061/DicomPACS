DROP FUNCTION ASU.GET_CAN_SOTR_EDIT_COMPANY_LIST
/

--
-- GET_CAN_SOTR_EDIT_COMPANY_LIST  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_CAN_SOTR_EDIT_COMPANY_LIST(pFK_APPSOTRID in number, pFC_SYNONIM in VARCHAR2) return number is
res number := 1;
Begin
 --- pFK_APPSOTRID - на будущее, вдруг скажут давать отдельным сотрудникам по доступу
 if (pFC_SYNONIM = 'DOGOVOR') or (pFC_SYNONIM = 'ROOT_LPU') then
  res := 0;
 end if;
 return res;
End;
/

SHOW ERRORS;


