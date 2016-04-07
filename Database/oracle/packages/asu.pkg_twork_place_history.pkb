DROP PACKAGE BODY ASU.PKG_TWORK_PLACE_HISTORY
/

--
-- PKG_TWORK_PLACE_HISTORY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_twork_place_history IS
 -------------------------------------------------------------------------------------------

 procedure DoSetCurrentWorkPlace(pFK_ID in number) is

--  pFK_WORKPALCE_ID number := -1;

  pFK_PEPLID   NUMBER;
  pFK_COMPANY  NUMBER;
  pFK_OTDEL    NUMBER;
  pFK_DOLGNOST NUMBER;
  pFC_RABOTA   VARCHAR2(2000);
 -- pFK_PACID    NUMBER;
  pFP_MAIN     NUMBER;


 cursor c is
  select
   FK_PEPLID,
   FK_COMPANYID,
   FK_OTDELID,
   FK_DOLGNOSTID,
   FC_RABOTA,
   FP_MAIN
  from ASU.Twork_Place_History where FK_ID = pFK_ID;

 --cursor is_exists_work_place(pID in number) is
 -- select FK_ID from ASU.Tworkplace where FK_PACID = pID and FP_MAIN = 1;

 Begin



   open c;
   fetch c into  pFK_PEPLID,pFK_COMPANY,pFK_OTDEL,pFK_DOLGNOST,pFC_RABOTA, pFP_MAIN;
   close c;


   update ASU.Twork_Place_History set FP_MAIN = 0 where FK_PEPLID = pFK_PEPLID;
   update ASU.Twork_Place_History set FP_MAIN = 1 where FK_ID = pFK_ID;


   UPDATE ASU.TPEOPLES SET
     FK_COMPANYID = pFK_COMPANY,
     FK_OTDEL = pFK_OTDEL,
     FK_DOLGNOST = pFK_DOLGNOST,
     FC_RABOTA = pFC_RABOTA
    where fk_id = pFK_PEPLID;

   --open is_exists_work_place(pFK_PEPLID);
   --fetch is_exists_work_place into  pFK_WORKPALCE_ID;
   --close is_exists_work_place;

   -- Обновление на пипла на пипла
   --if pFK_WORKPALCE_ID > 0 then
   -- update ASU.Tworkplace SET
   --  FK_PACID = pFK_PEPLID,
   --  FK_COMPANY = pFK_COMPANY,
   --  FK_OTDEL = pFK_OTDEL,
   --  FK_DOLGNOST = pFK_DOLGNOST,
   --  FC_RABOTA = pFC_RABOTA
   -- where fk_id = pFK_WORKPALCE_ID;
   --else
   -- insert into ASU.Tworkplace(FK_PACID,FK_COMPANY,FK_OTDEL,FK_DOLGNOST ,FC_RABOTA,FP_MAIN  ) values
   -- (pFK_PEPLID,pFK_COMPANY,pFK_OTDEL,pFK_DOLGNOST,pFC_RABOTA,1 );
   --end if;

   /*pFK_WORKPALCE_ID := -1;

   for c in (select FK_ID from ASU.TAMBULANCE where FK_PEPLID = pFK_PEPLID) loop

     open is_exists_work_place(c.FK_ID);
     fetch is_exists_work_place into  pFK_WORKPALCE_ID;
     close is_exists_work_place;

     if pFK_WORKPALCE_ID > 0 then
       update ASU.Tworkplace SET
         FK_PACID = c.fk_id,
         FK_COMPANY = pFK_COMPANY,
         FK_OTDEL = pFK_OTDEL,
         FK_DOLGNOST = pFK_DOLGNOST,
         FC_RABOTA = pFC_RABOTA
       where fk_id = pFK_WORKPALCE_ID;
     else
       insert into ASU.Tworkplace(FK_PACID,FK_COMPANY,FK_OTDEL,FK_DOLGNOST ,FC_RABOTA,FP_MAIN  ) values
       (c.fk_id,pFK_COMPANY,pFK_OTDEL,pFK_DOLGNOST,pFC_RABOTA,1 );
     end if;
     pFK_WORKPALCE_ID := -1;
   end loop;

   --Теперь нужно обновление на амбулаторные карты
   */

 End;
 -------------------------------------------------------------------------------------------
 procedure DoDelete(pFK_ID in number) is
 Begin
  delete from  ASU.Twork_Place_History where FK_ID = pFK_ID;
 End;
 -------------------------------------------------------------------------------------------
 function DoSave( pFK_ID          in  number,
                  pFK_COMPANYID   in  NUMBER,
                  pFK_OTDELID     in  NUMBER,
                  pFK_DOLGNOSTID  in  NUMBER,
                  pFC_RABOTA      in  VARCHAR2,
                  pFK_PEPLID      in  NUMBER,
                  pFP_MAIN        in  NUMBER,
                  pFD_BEGIN       in  DATE,
                  pFD_END         in  DATE) return number is


 pFK_ID_RETURN NUMBER;
 Begin
  pFK_ID_RETURN := pFK_ID;

  if pFK_ID_RETURN > 0 then
   UPDATE ASU.Twork_Place_History SET

     FK_COMPANYID = pFK_COMPANYID,
     FK_OTDELID = pFK_OTDELID,
     FK_DOLGNOSTID = pFK_DOLGNOSTID,
     FC_RABOTA = pFC_RABOTA,
     FK_PEPLID = pFK_PEPLID,
     FP_MAIN = pFP_MAIN,
     FD_BEGIN = pFD_BEGIN,
     FD_END = pFD_END
   where
     FK_ID = pFK_ID;
  else
   insert into ASU.Twork_Place_History
                  (
                    FK_COMPANYID,
                    FK_OTDELID,
                    FK_DOLGNOSTID,
                    FC_RABOTA,
                    FK_PEPLID,
                    FP_MAIN,
                    FD_BEGIN,
                    FD_END
                  )
                  values
                  (
                   pFK_COMPANYID,
                   pFK_OTDELID,
                   pFK_DOLGNOSTID,
                   pFC_RABOTA,
                   pFK_PEPLID,
                   pFP_MAIN,
                   pFD_BEGIN,
                   pFD_END
                  ) returning FK_ID into pFK_ID_RETURN;
  end if;

  return pFK_ID_RETURN;
 End;
 -------------------------------------------------------------------------------------------
END;
/

SHOW ERRORS;


