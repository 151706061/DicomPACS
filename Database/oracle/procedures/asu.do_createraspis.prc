DROP PROCEDURE ASU.DO_CREATERASPIS
/

--
-- DO_CREATERASPIS  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   SEQ_TGRAPH (Sequence)
--   TGRAPH (Table)
--   TRASPIS (Table)
--   TTMPRASP (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_CREATERASPIS" ( nFK_NAZVRACHID IN NUMBER, dFD_DATE IN DATE, nDAYCOUNT IN NUMBER)
   IS
-- Purpose: Формирование расписания
-- Mikrom      30.05.2000  Modify
   i  NUMBER:=1.0;  -- counter
   nFK_GRAPHID NUMBER:=0.0;  --fk_graphid
   HOUR VARCHAR2(2);  --hours
   MINIT VARCHAR2(2);  --minits
   nSEX NUMBER:=0.0;  --fl_sex
   nCOUNT NUMBER:=0.0;  --count people in one naz
   dDate DATE;  --fd_date
   dDay VARCHAR2(15);  --day of week
   nCountRec NUMBER:=0.0;
   CURSOR c1 is select /*+RULE*/ FT_TIME, FT_MIN, FL_SEX, FN_COUNT from ttmprasp;
BEGIN
  OPEN c1;
  select count(*) into nCountRec from traspis where fk_nazvrachid=nFK_NAZVRACHID;
  if nCountRec=0 then
    select SEQ_TGRAPH.nextval into nFK_GRAPHID from dual; --select new fk_id for tgraph
    insert into TRASPIS(FK_NAZVRACHID, FK_GRAPHID) values(nFK_NAZVRACHID, nFK_GRAPHID);
  else
    select FK_GRAPHID into nFK_GRAPHID from traspis where fk_nazvrachid=nFK_NAZVRACHID;
  end if;
  dDATE:=TRUNC(dFD_DATE);
  LOOP  --loop for count of days in nDayCount
    if i>nDAYCOUNT then EXIT;
    end if;
    LOOP  -- loop in count of records in ttmprasp
      FETCH c1 into HOUR, MINIT, nSEX, nCOUNT;
      EXIT WHEN c1%NOTFOUND;
      insert into TGRAPH(FK_RASPID, FT_HOUR, FT_MIN, FD_DATE, FL_SEX, FN_COUNT) values (nFK_GRAPHID, HOUR, MINIT, dDATE, nSEX, nCOUNT);
    END LOOP;
    CLOSE c1;
    OPEN c1;
    <<DAYTE>>
    select TO_CHAR(dDATE+1, 'fmDay') into dDay from dual; --select to dDay next day of week from dDate
    IF /*UPPER(dDay)=UPPER('Saturday') or */ UPPER(dDay)=UPPER('Sunday') THEN
      dDATE:=dDATE+1;
      goto DAYTE;
    END IF;
    dDATE:=NEXT_DAY(dDate, dDay); --get into dDate next day from dDate
    i:=i+1;
  END LOOP;
  CLOSE c1;
END; -- Procedure DO_CREATERASP
/

SHOW ERRORS;


