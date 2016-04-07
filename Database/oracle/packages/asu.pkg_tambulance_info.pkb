DROP PACKAGE BODY ASU.PKG_TAMBULANCE_INFO
/

--
-- PKG_TAMBULANCE_INFO  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_TAMBULANCE_INFO
IS
  ---------------------------------------------------------------------------------------------------------
  Function GetInfoID(pFK_ID in number) return number is
    Res number := 0;
    cursor DoesExists is
     select count(1) from ASU.TAMBULANCE_INFO where FK_AMBID = pFK_ID;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;
     return Res;
  End;

 ----------------------------------------------------------------------------------------------------------
 procedure SetFK_CARD_STATUSID(pFK_AMBID in number, pFK_CARD_STATUSID in number) is
  Begin
   IF  GetInfoID(pFK_AMBID) = 0 then
    INSERT INTO ASU.TAMBULANCE_INFO(FK_AMBID, FK_CARD_STATUSID) values (pFK_AMBID, pFK_CARD_STATUSID);
   else
    UPDATE ASU.TAMBULANCE_INFO SET FK_CARD_STATUSID = pFK_CARD_STATUSID where FK_AMBID = pFK_AMBID;
   end if;
  End;
 ----------------------------------------------------------------------------------------------------------
 function GetFK_CARD_STATUSID(pFK_AMBID in number) return number is
   pFK_CARD_STATUSID  number;
   cursor C is
    Select FK_CARD_STATUSID from ASU.TAMBULANCE_INFO where FK_AMBID = pFK_AMBID;
  Begin
   pFK_CARD_STATUSID := 0;
   OPEN C;
   FETCH C INTO pFK_CARD_STATUSID;
   CLOSE C;
   return pFK_CARD_STATUSID;
  End;
 ----------------------------------------------------------------------------------------------------------


 ----------------------------------------------------------------------------------------------------------
 procedure SetFK_PRICREP(pFK_AMBID in number, pFK_PRICREP_UCH in number) is
  Begin
   IF  GetInfoID(pFK_AMBID) = 0 then
    INSERT INTO ASU.TAMBULANCE_INFO(FK_AMBID, FK_PRICREP_UCH) values (pFK_AMBID, pFK_PRICREP_UCH);
   else
    UPDATE ASU.TAMBULANCE_INFO SET FK_PRICREP_UCH = pFK_PRICREP_UCH where FK_AMBID = pFK_AMBID;
   end if;
  End;
 ----------------------------------------------------------------------------------------------------------
 function GetFK_PRICREP(pFK_AMBID in number) return number is
   pFK_PRICREP_UCH  number;
   cursor C is
    Select FK_PRICREP_UCH from ASU.TAMBULANCE_INFO where FK_AMBID = pFK_AMBID;
  Begin
   pFK_PRICREP_UCH := 0;
   OPEN C;
   FETCH C INTO pFK_PRICREP_UCH;
   CLOSE C;
   return pFK_PRICREP_UCH;
  End;
 ----------------------------------------------------------------------------------------------------------



  ----------------------------------------------------------------------------------------------------------
 procedure SetFK_LAST_APPSOTR(pFK_AMBID in number, pFK_LAST_APPSOTR in number) is
  Begin
   IF  GetInfoID(pFK_AMBID) = 0 then
    INSERT INTO ASU.TAMBULANCE_INFO(FK_AMBID, FK_LAST_APPSOTR) values (pFK_AMBID, pFK_LAST_APPSOTR);
   else
    UPDATE ASU.TAMBULANCE_INFO SET FK_LAST_APPSOTR = pFK_LAST_APPSOTR where FK_AMBID = pFK_AMBID;
   end if;
  End;
 ----------------------------------------------------------------------------------------------------------
 function GetFK_LAST_APPSOTR(pFK_AMBID in number) return number is
   pFK_LAST_APPSOTR  number;
   cursor C is
    Select FK_LAST_APPSOTR from ASU.TAMBULANCE_INFO where FK_AMBID = pFK_AMBID;
  Begin
   pFK_LAST_APPSOTR := 0;
   OPEN C;
   FETCH C INTO pFK_LAST_APPSOTR;
   CLOSE C;
   return pFK_LAST_APPSOTR;
  End;
 ----------------------------------------------------------------------------------------------------------




----------------------------------------------------------------------------------------------------------
 procedure SetFD_LAST_APPSOTR(pFK_AMBID in number, pFD_LAST_APPSOTR in date) is
  Begin
   IF  GetInfoID(pFK_AMBID) = 0 then
    INSERT INTO ASU.TAMBULANCE_INFO(FK_AMBID, FD_LAST_APPSOTR) values (pFK_AMBID, pFD_LAST_APPSOTR);
   else
    UPDATE ASU.TAMBULANCE_INFO SET FD_LAST_APPSOTR = pFD_LAST_APPSOTR where FK_AMBID = pFK_AMBID;
   end if;
  End;
 ----------------------------------------------------------------------------------------------------------
 function GetFD_LAST_APPSOTR(pFK_AMBID in number) return date is
   pFD_LAST_APPSOTR  date;
   cursor C is
    Select FD_LAST_APPSOTR from ASU.TAMBULANCE_INFO where FK_AMBID = pFK_AMBID;
  Begin
   pFD_LAST_APPSOTR := NULL;
   OPEN C;
   FETCH C INTO pFD_LAST_APPSOTR;
   CLOSE C;
   return pFD_LAST_APPSOTR;
  End;
 ----------------------------------------------------------------------------------------------------------



END;
/

SHOW ERRORS;


