DROP PROCEDURE ASU.DO_SAVE_FK_SOTRNAZ_TNAZDETAIL
/

--
-- DO_SAVE_FK_SOTRNAZ_TNAZDETAIL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZDETAIL (Table)
--
CREATE OR REPLACE PROCEDURE ASU.DO_SAVE_FK_SOTRNAZ_TNAZDETAIL(pFK_NAZID in number, pFK_SOTRNAZ in number)
   IS
  pCount number;
BEGIN
 select count(1) into pCount from ASU.Tnazdetail t where t.FK_NAZID = pFK_NAZID;
 if pCount = 0 then
  insert into ASU.Tnazdetail(FK_NAZID,FK_SOTRNAZ) values (pFK_NAZID,pFK_SOTRNAZ);
 else
  update ASU.Tnazdetail SET FK_SOTRNAZ = pFK_SOTRNAZ  where FK_NAZID = pFK_NAZID;
 end if;
END;
/

SHOW ERRORS;


