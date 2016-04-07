DROP PACKAGE BODY ASU.PKG_TAMBTALON_INFO
/

--
-- PKG_TAMBTALON_INFO  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_TAMBTALON_INFO
IS
  ---------------------------------------------------------------------------------------------------------
  Function GetTalonInfoID(pFK_ID in number) return number is
    Res number := 0;
    cursor DoesExists is
     select count(1) from ASU.Tambtalon_Info where FK_TALONID = pFK_ID;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;
     return Res;
  End;
  ---------------------------------------------------------------------------------------------------------
  procedure SetFL_MODERNIZACIA(pFK_TALONID in number, pFL_MODERNIZACIA in number) is
  Begin
   IF  GetTalonInfoID(pFK_TALONID) = 0 then
    INSERT INTO ASU.Tambtalon_Info(FK_TALONID,FL_MODERNIZACIA) values (pFK_TALONID, pFL_MODERNIZACIA);
   else
    UPDATE ASU.Tambtalon_Info SET FL_MODERNIZACIA = pFL_MODERNIZACIA where FK_TALONID = pFK_TALONID;
   end if;
  End;
  ---------------------------------------------------------------------------------------------------------
  function GetFL_MODERNIZACIA(pFK_TALONID in number) return number is
   pFL_MODERNIZACIA  number;
   cursor C is
    Select FL_MODERNIZACIA from ASU.Tambtalon_Info where FK_TALONID = pFK_TALONID;
  Begin
   pFL_MODERNIZACIA := 0;
   OPEN C;
   FETCH C INTO pFL_MODERNIZACIA;
   CLOSE C;
   return pFL_MODERNIZACIA;
  End;
   ---------------------------------------------------------------------------------------------------------
  procedure SetFC_PACCODE(pFK_TALONID in number, pFC_PACCODE in varchar2) is
  Begin
   IF  GetTalonInfoID(pFK_TALONID) = 0 then
    INSERT INTO ASU.Tambtalon_Info(FK_TALONID,FC_PACCODE) values (pFK_TALONID, pFC_PACCODE);
   else
    UPDATE ASU.Tambtalon_Info SET FC_PACCODE = pFC_PACCODE where FK_TALONID = pFK_TALONID;
   end if;
  End;
  ---------------------------------------------------------------------------------------------------------
  function GetFC_PACCODE(pFK_TALONID in number) return varchar2 is
   pFC_PACCODE  Tambtalon_Info.Fc_Paccode%TYPE;
   cursor C is
    Select FC_PACCODE from ASU.Tambtalon_Info where FK_TALONID = pFK_TALONID;
  Begin
   pFC_PACCODE := '';
   OPEN C;
   FETCH C INTO pFC_PACCODE;
   CLOSE C;
   return pFC_PACCODE;
  End;
  ---------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------
  procedure SetFK_VISITVID(pFK_TALONID in number, pFK_VISITVID in number) is
  Begin
   IF  GetTalonInfoID(pFK_TALONID) = 0 then
    INSERT INTO ASU.Tambtalon_Info(FK_TALONID,FK_VISITVID) values (pFK_TALONID, pFK_VISITVID);
   else
    UPDATE ASU.Tambtalon_Info SET FK_VISITVID = pFK_VISITVID where FK_TALONID = pFK_TALONID;
   end if;
  End;
  ---------------------------------------------------------------------------------------------------------
  function GetFK_VISITVID(pFK_TALONID in number) return number is
   pFK_VISITVID  Tambtalon_Info.FK_VISITVID%TYPE;
   cursor C is
    Select FK_VISITVID from ASU.Tambtalon_Info where FK_TALONID = pFK_TALONID;
  Begin
   pFK_VISITVID := '';
   OPEN C;
   FETCH C INTO pFK_VISITVID;
   CLOSE C;
   return pFK_VISITVID;
  End;
  ---------------------------------------------------------------------------------------------------------
  procedure SetFC_KOM_CODE(pFK_TALONID in number, pFC_KOM_CODE in varchar2) is
  Begin
   IF  GetTalonInfoID(pFK_TALONID) = 0 then
    INSERT INTO ASU.Tambtalon_Info(FK_TALONID,FC_KOM_CODE) values (pFK_TALONID, pFC_KOM_CODE);
   else
    UPDATE ASU.Tambtalon_Info SET FC_KOM_CODE = pFC_KOM_CODE where FK_TALONID = pFK_TALONID;
   end if;
  End;
  ---------------------------------------------------------------------------------------------------------
  function GetFC_KOM_CODE(pFK_TALONID in number) return varchar2 is
   pFC_KOM_CODE  varchar2(122);
   cursor C is
    Select FC_KOM_CODE from ASU.Tambtalon_Info where FK_TALONID = pFK_TALONID;
  Begin
   pFC_KOM_CODE := '';
   OPEN C;
   FETCH C INTO pFC_KOM_CODE;
   CLOSE C;
   return pFC_KOM_CODE;
  End;
  ---------------------------------------------------------------------------------------------------------
  function GetFK_CITIZEN_KAT (pFK_TALONID in number) return number is
   pFK_CITIZEN_KAT number;
   cursor C is
    Select FK_CITIZEN_KAT from ASU.Tambtalon_Info where FK_TALONID = pFK_TALONID;
  Begin
   pFK_CITIZEN_KAT := -1;
   OPEN C;
   FETCH C INTO pFK_CITIZEN_KAT;
   CLOSE C;
   return pFK_CITIZEN_KAT;
  End;
  ---------------------------------------------------------------------------------------------------------
  procedure SetFK_CITIZEN_KAT(pFK_TALONID in number, pFK_CITIZEN_KAT in number) is
  Begin
   IF  GetTalonInfoID(pFK_TALONID) = 0 then
    INSERT INTO ASU.Tambtalon_Info(FK_TALONID,FK_CITIZEN_KAT) values (pFK_TALONID, pFK_CITIZEN_KAT);
   else
    UPDATE ASU.Tambtalon_Info SET FK_CITIZEN_KAT = pFK_CITIZEN_KAT where FK_TALONID = pFK_TALONID;
   end if;
  End;
  ---------------------------------------------------------------------------------------------------------
  function GetFK_SECOND_DISP (pFK_TALONID in number) return number is
   pFK_SECOND_DISP number;
   cursor C is
    Select FK_SECOND_DISP from ASU.Tambtalon_Info where FK_TALONID = pFK_TALONID;
  Begin
   pFK_SECOND_DISP := -1;
   OPEN C;
   FETCH C INTO pFK_SECOND_DISP;
   CLOSE C;
   return pFK_SECOND_DISP;
  End;
  ---------------------------------------------------------------------------------------------------------
  procedure SetFK_SECOND_DISP(pFK_TALONID in number, pFK_SECOND_DISP in number) is
  Begin
   IF  GetTalonInfoID(pFK_TALONID) = 0 then
    INSERT INTO ASU.Tambtalon_Info(FK_TALONID,FK_SECOND_DISP) values (pFK_TALONID, pFK_SECOND_DISP);
   else
    UPDATE ASU.Tambtalon_Info SET FK_SECOND_DISP = pFK_SECOND_DISP where FK_TALONID = pFK_TALONID;
   end if;
  End;
  ---------------------------------------------------------------------------------------------------------







END;
/

SHOW ERRORS;


