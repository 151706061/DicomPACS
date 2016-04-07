DROP PACKAGE BODY ASU.PKG_RASPIS
/

--
-- PKG_RASPIS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_RASPIS" 
IS
-- MODIFICATION HISTORY
-- Roman M. Mikita      26.10.2000    Create

Procedure     DO_CREATERASPIS ( nFK_NAZVRACHID IN NUMBER, dFD_DATE IN DATE, nDAYCOUNT IN NUMBER)
   IS

   i  NUMBER:=1.0;  -- counter
   nFK_GRAPHID NUMBER:=0.0;  --fk_graphid
   HOUR VARCHAR2(2);  --часы
   MINIT VARCHAR2(2);  --минуты
   nSEX NUMBER:=0.0;  --fl_sex
   nCOUNT NUMBER:=0.0;  --count people in one naz
   dDate DATE;  --fd_date
   nrows NUMBER:=0.0;  --count in ttmprasp
   dDay VARCHAR2(15);  --day of week
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
  OPEN c1;
  select count(*) into nCountRec from traspis where fk_nazvrachid=nFK_NAZVRACHID;
  if nCountRec=0 then
    select SEQ_TGRAPH.nextval into nFK_GRAPHID from dual; --select new fk_id for tgraph
    insert into TRASPIS(FK_NAZVRACHID, FK_GRAPHID) values(nFK_NAZVRACHID, nFK_GRAPHID);
  else
    select FK_GRAPHID into nFK_GRAPHID from traspis where fk_nazvrachid=nFK_NAZVRACHID;
  end if;
  dDATE:=dFD_DATE;
  LOOP  --loop for count of days
    if i>nDAYCOUNT then exit;
    end if;
    LOOP  -- loop in count of records in ttmprasp
      FETCH c1 into HOUR, MINIT, nSEX, nCOUNT;
      EXIT WHEN c1%NOTFOUND;
      insert into TGRAPH(FK_RASPID, FT_HOUR, FT_MIN, FD_DATE, FL_SEX, FN_COUNT) values
             (nFK_GRAPHID, HOUR, MINIT, dDATE, nSEX, nCOUNT);
    END LOOP;
    CLOSE c1;
    OPEN c1;
    <<DAYTE>>
    select TO_CHAR(dDATE+1, 'fmDay') into dDay from dual; --select to dDay next day of week from current
    IF dDay='Суббота' or dDay='Воскресенье' THEN
      dDATE:=dDATE+1;
      goto DAYTE;
    END IF;
    dDATE:=NEXT_DAY(dDate, dDay); --get into dDate next day from current
    i:=i+1;
  END LOOP;
  CLOSE c1;
--EXCEPTION
--    WHEN exception_name THEN
--        statements ;
END; -- Procedure DO_CREATERASP

Procedure     DO_INSERT_PACLST (nFK_ID IN NUMBER, nPACID IN NUMBER)
IS
  nCount NUMBER:=0.0;
  nNazCount NUMBER:=0.0;
  nFK_PACLSTID NUMBER:=0.0;
  CURSOR c1 is select fn_count, get_NAZCOUNT(nFK_ID), FK_PACLSTID from tgraph where fk_id=nFK_ID;
BEGIN
  OPEN c1;
  fetch c1 into nCount, nNazCount, nFK_PACLSTID;
  if nNazCount<nCount then
    if nFK_PACLSTID=0 then
      select SEQ_PACLST.NEXTVAL into nFK_PACLSTID from dual;
      update tgraph set fk_paclstid=nFK_PACLSTID where fk_id=nFK_ID;
    end if;
    select count(*) into nCount from tpaclst where fk_graphid=nFK_PACLSTID and fk_pacid=nPACID;
    if nCount<1 then
      insert into TPACLST(FK_GRAPHID,FK_PACID) values (nFK_PACLSTID, nPACID);
    end if;
  else
    RAISE_APPLICATION_ERROR(-20001, 'Нет свободных мест');
    CLOSE c1;
    return;
  end if;
  CLOSE c1;
END; -- Procedure DO_INSERT_PACLST

Procedure     DO_INSERT_RASPIS ( nFK_NAZVRACHID IN NUMBER, dDATE IN DATE)
IS
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

  select count(*) into nCountRec from traspis where fk_nazvrachid=nFK_NAZVRACHID;
  if nCountRec=0 then
    select SEQ_TGRAPH.nextval into nFK_GRAPHID from dual; --select new fk_id for tgraph
    insert into TRASPIS(FK_NAZVRACHID, FK_GRAPHID) values(nFK_NAZVRACHID, nFK_GRAPHID);
  else
    select FK_GRAPHID into nFK_GRAPHID from traspis where fk_nazvrachid=nFK_NAZVRACHID;
  end if;

  OPEN c1;
  LOOP  -- loop in count of records in ttmprasp
    FETCH c1 into HOUR, MINIT, nSEX, nCOUNT;
    EXIT WHEN c1%NOTFOUND;
    insert into TGRAPH(FK_RASPID, FT_HOUR, FT_MIN, FD_DATE, FL_SEX, FN_COUNT) values
           (nFK_GRAPHID, HOUR, MINIT, dDATE, nSEX, nCOUNT);
  END LOOP;
  CLOSE c1;

--EXCEPTION
--    WHEN exception_name THEN
--        statements ;
END; -- Procedure DO_INSERT_RAPIS

END; -- Package Body PKG_RASPIS
/

SHOW ERRORS;


