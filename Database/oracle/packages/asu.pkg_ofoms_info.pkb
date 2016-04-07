DROP PACKAGE BODY ASU.PKG_OFOMS_INFO
/

--
-- PKG_OFOMS_INFO  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_OFOMS_INFO
IS

 HTTP_SMINI_SECTION varchar2(6) := 'CONFIG';
 HTTP_SMINI_KEY_URL varchar2(18) := 'HTTP_URL_INSURANCE';
 HTTP_SMINI_KEY_PAS varchar2(18) := 'HTTP_PAS_INSURANCE';
 HTTP_SMINI_KEY_LOG varchar2(18) := 'HTTP_LOG_INSURANCE';
  ---------------------------------------------------------------------------------------------------------
  Function GetURL return varchar2 is
    res varchar2(4000);
    cursor DoesExists is
     select FC_VALUE from ASU.TSMINI where FC_SECTION = HTTP_SMINI_SECTION and FC_KEY = HTTP_SMINI_KEY_URL;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;
     return Res;
  End;
  --------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------
  Function GetLOG return varchar2 is
    res varchar2(4000);
    cursor DoesExists is
     select FC_VALUE from ASU.TSMINI where FC_SECTION = HTTP_SMINI_SECTION and FC_KEY = HTTP_SMINI_KEY_LOG;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;
     return Res;
  End;
  --------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------
  Function GetPAS return varchar2 is
    res varchar2(4000);
    cursor DoesExists is
     select FC_VALUE from ASU.TSMINI where FC_SECTION = HTTP_SMINI_SECTION and FC_KEY = HTTP_SMINI_KEY_PAS;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;
     return Res;
  End;
  --------------------------------------------------------------------------------------------------------
   ---------------------------------------------------------------------------------------------------------
  procedure SetURL(Val in varchar2) is
    res number := -1;
    cursor DoesExists is
     select FK_ID from ASU.TSMINI where FC_SECTION = HTTP_SMINI_SECTION and FC_KEY = HTTP_SMINI_KEY_URL;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;

     if Res > 0 then
      UPDATE ASU.TSMINI SET FC_VALUE = Val where FK_ID = res;
     else
      INSERT INTO ASU.TSMINI(FC_SECTION,FC_KEY,FC_VALUE) values (HTTP_SMINI_SECTION,HTTP_SMINI_KEY_URL,Val);
     end if;


  End;
  --------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------
  procedure SetLOG(Val in varchar2) is
    res number := -1;
    cursor DoesExists is
     select FK_ID from ASU.TSMINI where FC_SECTION = HTTP_SMINI_SECTION and FC_KEY = HTTP_SMINI_KEY_LOG;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;

     if Res > 0 then
      UPDATE ASU.TSMINI SET FC_VALUE = Val where FK_ID = res;
     else
      INSERT INTO ASU.TSMINI(FC_SECTION,FC_KEY,FC_VALUE) values (HTTP_SMINI_SECTION,HTTP_SMINI_KEY_LOG,Val);
     end if;


  End;
  --------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------------------------------------------
  procedure SetPAS(Val in varchar2) is
    res number := -1;
    cursor DoesExists is
     select FK_ID from ASU.TSMINI where FC_SECTION = HTTP_SMINI_SECTION and FC_KEY = HTTP_SMINI_KEY_PAS;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;

     if Res > 0 then
      UPDATE ASU.TSMINI SET FC_VALUE = Val where FK_ID = res;
     else
      INSERT INTO ASU.TSMINI(FC_SECTION,FC_KEY,FC_VALUE) values (HTTP_SMINI_SECTION,HTTP_SMINI_KEY_PAS,Val);
     end if;

  End;
  --------------------------------------------------------------------------------------------------------


END;
/

SHOW ERRORS;


