DROP FUNCTION ASU.DOES_EXISTS_DOUBLE_COMPANY
/

--
-- DOES_EXISTS_DOUBLE_COMPANY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCOMPANY (Table)
--
CREATE OR REPLACE FUNCTION ASU.DOES_EXISTS_DOUBLE_COMPANY( pFC_SYNONIM in VARCHAR2,
                                                            pFC_FULL    in VARCHAR2,
                                                            pFC_SHORT   in VARCHAR2,
                                                            pFC_INN     in VARCHAR2,
                                                            pFC_OKPO    in VARCHAR2)
  return VARCHAR2 is
  OK_RESULT VARCHAR2(30) := 'NOT_EXISTS_DOUBLE_COMPANY';
  Res VARCHAR2(4000) := OK_RESULT;

  cursor cCheckFullName is
    select TCOMPANY.FC_NAME
      from ASU.TCOMPANY
     where TCOMPANY.FC_SYNONIM = pFC_SYNONIM
    connect by prior TCOMPANY.FK_OWNER = TCOMPANY.FK_ID
     START WITH TCOMPANY.FC_NAME = pFC_FULL;

Begin
  --- pFK_APPSOTRID - на будущее, вдруг скажут давать отдельным сотрудникам по доступу

  OPen cCheckFullName;
  FETCH cCheckFullName into Res;
  close cCheckFullName;

  IF RES <> OK_RESULT THEN
   RES := 'Организация "'||pFC_FULL||'" уже зарегистрирована.';
  END IF;

  return RES;
End;
/

SHOW ERRORS;


