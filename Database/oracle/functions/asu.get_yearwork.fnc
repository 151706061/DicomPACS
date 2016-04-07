DROP FUNCTION ASU.GET_YEARWORK
/

--
-- GET_YEARWORK  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_yearwork
  RETURN  NUMBER IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 22.12.2006
-- Nefedov S.M. 27.02.2007 optimization
-- Nefedov S.M. 27.12.2010 Get Bofore Days from TSMINI
    nFN_YEAR NUMBER;
    nNew_YEAR NUMBER;
    nBeforeDAYS NUMBER;
BEGIN
    select FC_VALUE into nBeforeDAYS from asu.TSMINI where FC_SECTION = 'CONFIG' and upper(FC_KEY) = 'NEWYEAR_BEFOREDAYS';
    if nBeforeDAYS is NULL then
        nBeforeDAYS:=0;
    end if;
    nFN_YEAR:=to_number(TO_CHAR(TRUNC(SYSDATE),'YYYY')) ;
    nNew_YEAR:=to_number(TO_CHAR(TRUNC(SYSDATE+nBeforeDAYS),'YYYY')) ;
    -- Возвращает номер следующего года за шесть дней до его начала
    --SELECT to_number(decode(TO_CHAR(TRUNC(SYSDATE+6),'YYYY'),TO_CHAR(TRUNC(SYSDATE),'YYYY'),TO_CHAR(TRUNC(SYSDATE),'YYYY'),TO_CHAR(TRUNC(SYSDATE+6),'YYYY'))) into nFN_YEAR from DUAL;
    if nNew_YEAR <> nFN_YEAR then
        nFN_YEAR:=nNew_YEAR;
    end if;
	RETURN nFN_YEAR;
END;
/

SHOW ERRORS;


