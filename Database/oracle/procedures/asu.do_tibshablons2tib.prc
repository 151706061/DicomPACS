DROP PROCEDURE ASU.DO_TIBSHABLONS2TIB
/

--
-- DO_TIBSHABLONS2TIB  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   SEQ_TKARTA (Sequence)
--   TIB (Table)
--   TIBSHABLONS (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_TIBSHABLONS2TIB" 
   ( shablonnamesid IN number,
   pacid out number)
   IS
BEGIN
  select seq_tkarta.nextval into pacid from dual;
  insert into tib(FC_CHAR,FN_NUM,FK_BID,FK_PACID,FK_SMID,FK_SMEDITID,FK_VRACHID)
    select        FC_CHAR,FN_NUM,FK_BID, pacid  ,FK_SMID,FK_SMEDITID, FK_VRACHID
    from tibshablons
    where fk_shablonnamesid=shablonnamesid;
END; -- Procedure
/

SHOW ERRORS;


