DROP PROCEDURE ASU.DO_SAVE_COMMENT_TNAZDETAIL
/

--
-- DO_SAVE_COMMENT_TNAZDETAIL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZDETAIL (Table)
--
CREATE OR REPLACE PROCEDURE ASU.DO_SAVE_COMMENT_TNAZDETAIL(pFK_NAZID in number, pFC_NAZ_COMMENT in varchar2)
   IS
  pCount number;
BEGIN
 select count(1) into pCount from ASU.Tnazdetail t where t.FK_NAZID = pFK_NAZID;
 if pCount = 0 then
  insert into ASU.Tnazdetail(FK_NAZID,FC_NAZ_COMMENT) values (pFK_NAZID,pFC_NAZ_COMMENT);
 else
  update ASU.Tnazdetail SET FC_NAZ_COMMENT = pFC_NAZ_COMMENT  where FK_NAZID = pFK_NAZID;
 end if;
END;
/

SHOW ERRORS;


