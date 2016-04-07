DROP PROCEDURE ASU.DO_PERESEL
/

--
-- DO_PERESEL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPERESEL (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_PERESEL" -- Modified by TimurLan
   ( pFK_PACID IN NUMBER,pFK_PALATAID IN NUMBER,pFD_DATA IN OUT DATE)
   IS
  CURSOR cTemp IS select TPERESEL.FD_DATA1,TPERESEL.FD_DATA2,FK_MAXID from TPERESEL,
                     (select max(FK_ID) FK_MAXID from TPERESEL where FK_PACID=pFK_PACID)
                    where TPERESEL.FK_ID=FK_MAXID;
  dTemp1 DATE;
  dTemp2 DATE;
  nTemp NUMBER;
Begin
  OPEN cTemp;
  FETCH cTemp INTO dTemp1,dTemp2,nTemp;
  CLOSE cTemp;
  if pFD_DATA <=dTemp1 then
    pFD_DATA:=dTemp1;
    Raise_Application_error(-20003,'???? ????????? ?????? ????> ???? ??????????? ?????????!'||'Smaller!');
  end if;
  if pFD_DATA >=dTemp2 then
    pFD_DATA:=dTemp2;
    Raise_Application_error(-20004,'???? ????????? ?????? ????< ???? ??????????? ?????????!'||'Larger!');
  end if;
  update TPERESEL set FD_DATA2=pFD_DATA/*-1*/ where FK_ID=nTemp;
  insert into TPERESEL (FK_PACID,FK_PALATAID,FD_DATA1,FD_DATA2) values
                      (pFK_PACID,pFK_PALATAID,pFD_DATA,dTemp2);
end;
/

SHOW ERRORS;


