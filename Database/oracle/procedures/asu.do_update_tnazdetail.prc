DROP PROCEDURE ASU.DO_UPDATE_TNAZDETAIL
/

--
-- DO_UPDATE_TNAZDETAIL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZDETAIL (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_UPDATE_TNAZDETAIL"(pFK_NAZID in number, pFK_REASON in number, pFK_SERVPLACE in number)
   IS
  pCount number;
BEGIN
 select count(1) into pCount from ASU.Tnazdetail t where t.FK_NAZID = pFK_NAZID;
 if pCount = 0 then
  insert into ASU.Tnazdetail(FK_NAZID,FK_REASON,FK_SERVPLACE) values (pFK_NAZID,pFK_REASON,pFK_SERVPLACE);
 else
  update ASU.Tnazdetail SET FK_REASON = pFK_REASON, FK_SERVPLACE = pFK_SERVPLACE  where FK_NAZID = pFK_NAZID;
 end if;
END; -- Procedure INC
/

SHOW ERRORS;


