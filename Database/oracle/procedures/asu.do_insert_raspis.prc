DROP PROCEDURE ASU.DO_INSERT_RASPIS
/

--
-- DO_INSERT_RASPIS  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   SEQ_TGRAPH (Sequence)
--   TGRAPH (Table)
--   TRASPIS (Table)
--   TRASPIS_SCHEMA (Table)
--   TTMPRASP (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_RASPIS" ( nFK_NAZVRACHID IN NUMBER, dDATE IN DATE, nFK_SCHEMAID IN NUMBER:=0, nMinutes in number := 10)
   IS
-- Purpose: «аполнение расписани€ на один день

-- MODIFICATION HISTORY
-- Mikrom      1.06.2000  Create
  HOUR VARCHAR2(2);  --часы
  MINIT VARCHAR2(2);  --минуты
  nSEX NUMBER:=0.0;  --fl_sex
  nCOUNT NUMBER:=0.0;  --count people in one naz
  dEnd date;

  nFK_GRAPHID NUMBER:=0.0;
  nrows NUMBER:=0.0;
  nCountRec NUMBER:=0.0;

  CURSOR c1 is select FT_TIME, FT_MIN, FL_SEX, FN_COUNT from ttmprasp;
  CURSOR c2 is select rownum from ttmprasp;
BEGIN
  OPEN c2;
  LOOP
    FETCH c2 into nrows;
    EXIT WHEN c2%NOTFOUND;
  END LOOP;
  if nrows=0 then return; -- if ttmprasp count of rows=0 then exit
  end if;
  CLOSE c2;
  if nFK_SCHEMAID=0 then
    select  count(*) into nCountRec from traspis where fk_nazvrachid=nFK_NAZVRACHID;
   else
    select  count(*) into nCountRec from traspis_schema where fk_nazvrachid=nFK_NAZVRACHID
       and fk_schemaid=nFK_SCHEMAID;
  end if;
  if nCountRec=0 then
    select SEQ_TGRAPH.nextval into nFK_GRAPHID from dual; --select new fk_id for tgraph
    if nFK_SCHEMAID=0 then
      insert into TRASPIS(FK_NAZVRACHID, FK_GRAPHID) values(nFK_NAZVRACHID, nFK_GRAPHID);
     else
      insert into TRASPIS_SCHEMA(FK_NAZVRACHID, FK_GRAPHID, FK_SCHEMAID)
         values(nFK_NAZVRACHID, nFK_GRAPHID, nFK_SCHEMAID);
    end if;
  else
    if nFK_SCHEMAID=0 then
      select FK_GRAPHID into nFK_GRAPHID from traspis where fk_nazvrachid=nFK_NAZVRACHID;
     else
      select FK_GRAPHID into nFK_GRAPHID from traspis_schema where fk_nazvrachid=nFK_NAZVRACHID
        and fk_schemaid=nFK_SCHEMAID;
    end if;
  end if;

  OPEN c1;
  LOOP  -- loop in count of records in ttmprasp
    FETCH c1 into HOUR, MINIT, nSEX, nCOUNT;
    EXIT WHEN c1%NOTFOUND;
    dEnd:=to_date(to_char(dDate, 'dd.mm.yyyy')||' '||HOUR||':'||MINIT, 'dd.mm.yyyy hh24:mi')+(nMinutes/60/24);
    insert into TGRAPH(FK_RASPID, FT_HOUR, FT_MIN, FD_DATE, FL_SEX, FN_COUNT, ft_end) values
           (nFK_GRAPHID, HOUR, MINIT, dDATE, nSEX, nCOUNT, dEnd);
  END LOOP;
  CLOSE c1;
END;




 /*CREATE OR REPLACE PROCEDURE "DO_INSERT_RASPIS" ( nFK_NAZVRACHID IN NUMBER, dDATE IN DATE, nFK_SCHEMAID IN NUMBER:=0)
   IS
-- Purpose: «аполнение расписани€ на один день

-- MODIFICATION HISTORY
-- Mikrom      1.06.2000  Create
  HOUR VARCHAR2(2);  --часы
  MINIT VARCHAR2(2);  --минуты
  nSEX NUMBER:=0.0;  --fl_sex
  nCOUNT NUMBER:=0.0;  --count people in one naz

  nFK_GRAPHID NUMBER:=0.0;
  nrows NUMBER:=0.0;
  nCountRec NUMBER:=0.0;

  CURSOR c1 is select FT_TIME, FT_MIN, FL_SEX, FN_COUNT from ttmprasp;
  CURSOR c2 is select rownum from ttmprasp;
BEGIN
  OPEN c2;
  LOOP
    FETCH c2 into nrows;
    EXIT WHEN c2%NOTFOUND;
  END LOOP;
  if nrows=0 then return; -- if ttmprasp count of rows=0 then exit
  end if;
  CLOSE c2;
  if nFK_SCHEMAID=0 then
    select  count(*) into nCountRec from traspis where fk_nazvrachid=nFK_NAZVRACHID;
   else
    select  count(*) into nCountRec from traspis_schema where fk_nazvrachid=nFK_NAZVRACHID
       and fk_schemaid=nFK_SCHEMAID;
  end if;
  if nCountRec=0 then
    select SEQ_TGRAPH.nextval into nFK_GRAPHID from dual; --select new fk_id for tgraph
    if nFK_SCHEMAID=0 then
      insert into TRASPIS(FK_NAZVRACHID, FK_GRAPHID) values(nFK_NAZVRACHID, nFK_GRAPHID);
     else
      insert into TRASPIS_SCHEMA(FK_NAZVRACHID, FK_GRAPHID, FK_SCHEMAID)
         values(nFK_NAZVRACHID, nFK_GRAPHID, nFK_SCHEMAID);
    end if;
  else
    if nFK_SCHEMAID=0 then
      select FK_GRAPHID into nFK_GRAPHID from traspis where fk_nazvrachid=nFK_NAZVRACHID;
     else
      select FK_GRAPHID into nFK_GRAPHID from traspis_schema where fk_nazvrachid=nFK_NAZVRACHID
        and fk_schemaid=nFK_SCHEMAID;
    end if;
  end if;

  OPEN c1;
  LOOP  -- loop in count of records in ttmprasp
    FETCH c1 into HOUR, MINIT, nSEX, nCOUNT;
    EXIT WHEN c1%NOTFOUND;
    insert into TGRAPH(FK_RASPID, FT_HOUR, FT_MIN, FD_DATE, FL_SEX, FN_COUNT) values
           (nFK_GRAPHID, HOUR, MINIT, dDATE, nSEX, nCOUNT);
  END LOOP;
  CLOSE c1;
END;



 */
/

SHOW ERRORS;


