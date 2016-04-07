DROP FUNCTION ASU.INSERT_RASPIS_ROW
/

--
-- INSERT_RASPIS_ROW  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TGRAPH (Table)
--   TTMPRASP (Table)
--
CREATE OR REPLACE FUNCTION ASU.INSERT_RASPIS_ROW(pFK_TEMPID  in number,
                                                   nFK_GRAPHID IN NUMBER,
                                                   dDATE       IN DATE,
                                                   nMinutes    in number := 10,
                                                   pFK_KABINETID in number default NULL)
  return number IS
  pFK_ID number;
  HOUR   VARCHAR2(2);
  MINIT  VARCHAR2(2);
  nSEX   number;
  nCOUNT number;
  dEnd   date;

  CURSOR c1 is
    select FT_TIME, FT_MIN, FL_SEX, FN_COUNT
      from ttmprasp
     where FK_ID = pFK_TEMPID;

BEGIN
  OPEN C1;
  FETCH c1
    into HOUR, MINIT, nSEX, nCOUNT;
  dEnd := to_date(to_char(dDate, 'dd.mm.yyyy') || ' ' || HOUR || ':' ||
                  MINIT,
                  'dd.mm.yyyy hh24:mi') + (nMinutes / 60 / 24);
  insert into TGRAPH
    (FK_RASPID, FT_HOUR, FT_MIN, FD_DATE, FL_SEX, FN_COUNT, ft_end,FK_KABINETtalonID)
  values
    (nFK_GRAPHID, HOUR, MINIT, dDATE, nSEX, nCOUNT, dEnd,pFK_KABINETID)
  returning FK_ID into pFK_ID;

  CLOSE c1;
  return pFK_ID;
END;

--alter table TGRAPH_SHAB_DATA modify FL_SEX NUMBER;
/

SHOW ERRORS;


