DROP PACKAGE BODY ASU.PKG_TKARTA_INFO
/

--
-- PKG_TKARTA_INFO  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_TKARTA_INFO
IS
  ---------------------------------------------------------------------------------------------------------
  Function GetTalonInfoID(pFK_ID in number) return number is
    Res number := 0;
    cursor DoesExists is
     select count(1) from ASU.TKARTA_Info where FK_PACID = pFK_ID;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;
     return Res;
  End;
  ---------------------------------------------------------------------------------------------------------
  procedure SetFL_MODERNIZACIA(pFK_PACID in number, pFL_MODERNIZACIA in number, pFC_ICD10 asu.tkarta_info.fc_icd10%type) is
  Begin
   IF  GetTalonInfoID(pFK_PACID) = 0 then
    INSERT INTO ASU.TKARTA_Info(FK_PACID, FL_MODERNIZACIA, FC_ICD10) values (pFK_PACID, pFL_MODERNIZACIA, pFC_ICD10);
   else
    UPDATE ASU.TKARTA_Info SET FL_MODERNIZACIA = pFL_MODERNIZACIA, FC_ICD10 = pFC_ICD10 where FK_PACID = pFK_PACID;
   end if;
  End;
  ---------------------------------------------------------------------------------------------------------
  function GetFL_MODERNIZACIA(pFK_PACID in number, pFC_ICD10 asu.tkarta_info.fc_icd10%type) return number is
   pFL_MODERNIZACIA  number;
   cursor C is
    Select nvl(max(FL_MODERNIZACIA), ASU.IsDiagModernizacia(pFC_ICD10)) from ASU.TKARTA_Info where FK_PACID = pFK_PACID and FC_ICD10 = pFC_ICD10;
  Begin
   pFL_MODERNIZACIA := 0;
   OPEN C;
   FETCH C INTO pFL_MODERNIZACIA;
   CLOSE C;
   return pFL_MODERNIZACIA;
  End;
  ---------------------------------------------------------------------------------------------------------
END;
/

SHOW ERRORS;


