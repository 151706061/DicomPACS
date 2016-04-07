DROP PACKAGE BODY ASU.PKG_TINSURDOCS_INFO
/

--
-- PKG_TINSURDOCS_INFO  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_tinsurdocs_info
IS
  ---------------------------------------------------------------------------------------------------------
  Function GetInsurdocsInfoID(pFK_ID in number) return number is
    Res number := 0;
    cursor DoesExists is
     select count(1) from ASU.TINSURDOCS_INFO where FK_INSURDOCSID = pFK_ID;
  Begin
     OPEN  DoesExists;
     FETCH DoesExists into Res;
     CLOSE DoesExists;
     return Res;
  End;
  ---------------------------------------------------------------------------------------------------------
  procedure SetFK_SOTRID_CLOSED(pFK_INSURDOCSID in number, pFK_SOTRID in number) is
   pFK_SPRAVID  number;
   cursor cGetSpec is
    select FK_SPRAVID from ASU.TSOTR where FK_ID = pFK_SOTRID;
  Begin

   open cGetSpec;
   fetch cGetSpec into pFK_SPRAVID;
   close cGetSpec;
   if pFK_SPRAVID = GET_STATIST_SPEC_ID then
     IF  GetInsurdocsInfoID(pFK_INSURDOCSID) = 0 then
      INSERT INTO ASU.TINSURDOCS_INFO(FK_INSURDOCSID,FK_SOTRID_CLOSED,FK_SPECID_CLOSED)
        values
      (pFK_INSURDOCSID, pFK_SOTRID, pFK_SPRAVID);
     else
      UPDATE ASU.TINSURDOCS_INFO SET
       FK_SOTRID_CLOSED = pFK_SOTRID,
       FK_SPECID_CLOSED = pFK_SPRAVID
      where FK_INSURDOCSID = pFK_INSURDOCSID;
     end if;
    end if;
  End;
  ---------------------------------------------------------------------------------------------------------
  function GetFK_SOTRID_CLOSED(pFK_INSURDOCSID in number) return number is
   pFK_SOTRID_CLOSED  number;
   cursor C is
    Select FK_SOTRID_CLOSED from ASU.TINSURDOCS_INFO where FK_INSURDOCSID = pFK_INSURDOCSID;
  Begin
   pFK_SOTRID_CLOSED := 0;
   OPEN C;
   FETCH C INTO pFK_SOTRID_CLOSED;
   CLOSE C;
   return pFK_SOTRID_CLOSED;
  End;
   ---------------------------------------------------------------------------------------------------------
  function GetFK_SPECID_CLOSED(pFK_INSURDOCSID in number) return number is
   pFK_SPECID_CLOSED  number;
   cursor C is
    Select FK_SPECID_CLOSED from ASU.TINSURDOCS_INFO where FK_INSURDOCSID = pFK_INSURDOCSID;
  Begin
   pFK_SPECID_CLOSED := 0;
   OPEN C;
   FETCH C INTO pFK_SPECID_CLOSED;
   CLOSE C;
   return pFK_SPECID_CLOSED;
  End;
  ---------------------------------------------------------------------------------------------------------
END;
/

SHOW ERRORS;


