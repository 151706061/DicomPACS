DROP FUNCTION ASU.GET_NAZCOUNT_BY_TIME
/

--
-- GET_NAZCOUNT_BY_TIME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TGRAPH (Table)
--   TPACLST (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZCOUNT_BY_TIME" -- by PHILOSOPH
  ( pFD_DATE IN DATE) RETURN  NUMBER IS
  nTemp NUMBER;
  CURSOR cTemp IS select count(1) from tpaclst tp, tgraph tg where tp.fk_graphid= tg.fk_id and
     to_date(to_char(tg.fd_date,'yyyy.mm.dd')||' '||tg.ft_hour||':'||tg.ft_min,'yyyy.mm.dd hh24:mi')=pFD_DATE;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  RETURN nTemp;
END;
/

SHOW ERRORS;


