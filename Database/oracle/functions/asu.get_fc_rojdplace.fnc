DROP FUNCTION ASU.GET_FC_ROJDPLACE
/

--
-- GET_FC_ROJDPLACE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBULANCE (Table)
--   TPEOPLES (Table)
--   GET_PEPLID (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_FC_ROJDPLACE(pFK_PACID in number, pFK_PEPLID in number)
  RETURN varchar2 IS
  RES varchar2(4000) := NULL;
  pLOCAL_FK_PEPLID number;
  cursor c(pp in number) is
    select MAX(FC_ROJDPLACE)
      from (
            Select FC_ROJDPLACE from ASU.TKARTA where FK_PEPLID = pp
             union all
            select FC_ROJDPLACE from ASU.TAMBULANCE where FK_PEPLID = pp
             union all
            select FC_ROJDPLACE from ASU.TPEOPLES where FK_ID = pp
           ) V;
BEGIN

 if pFK_PEPLID > 0 then
     OPEN C(pFK_PEPLID);
     FETCH C INTO RES;
     CLOSE C;
 end if;

 if RES is NULL then
  pLOCAL_FK_PEPLID := ASU.get_peplid(pFK_PACID);
   if pLOCAL_FK_PEPLID > 0 then
    OPEN C(pLOCAL_FK_PEPLID);
    FETCH C INTO RES;
    CLOSE C;
   end if;
 end if;


 RETURN RES;
END;
/

SHOW ERRORS;


