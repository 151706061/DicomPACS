DROP FUNCTION ASU.DO_AUTORASPREDEL
/

--
-- DO_AUTORASPREDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PLITBLM (Synonym)
--   TSRTIPROOM (Table)
--   TROOM (Table)
--   TPERESEL (Table)
--   GET_COUNTPOWER (Function)
--   TPUTPLANDATA (Table)
--   TPUTPLANDAYS (Table)
--   TPUTPLANLIST (Table)
--   TPUTSPLANS (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_AUTORASPREDEL" -- Created by TimurLan 4 rPutsPlan
  (pFK_LISTID IN NUMBER,pFK_KORPID IN NUMBER,pFK_TYPEID IN NUMBER,pFN_KDN IN NUMBER,pFD_DATE1 IN DATE,pFD_DATE2 IN DATE,pFL_VSNEXTYEAR IN NUMBER)
 RETURN NUMBER IS
 nTemp NUMBER;
 dTemp DATE;
 nCol NUMBER;
 nID NUMBER;
 cYEAR VARCHAR2(4);
 TYPE tDays IS TABLE OF DATE INDEX BY Binary_Integer;
 TYPE tValues IS TABLE OF NUMBER(15) INDEX BY Binary_Integer;
 tD tDays;
 tV tValues;
 i Binary_Integer;
 k Binary_Integer;
 CURSOR c4MoveAll IS
        select /*+ rule*/NVL(COUNT(*),0) from tputsplans
         where fk_listid = pFK_LISTID
           and fk_korpid = pFK_KORPID
           and fk_typeid = pFK_TYPEID
           and fl_new = 1;
 CURSOR cPutsAll  IS
        select /*+ rule*/fk_id,fn_kdn from tputsplans
         where fk_listid = pFK_LISTID
           and fk_korpid = pFK_KORPID
           and fk_typeid = pFK_TYPEID
           and fl_new = 1
      order by fn_kdn desc, fk_id;
 CURSOR c4MoveKDN IS
        select /*+ rule*/NVL(COUNT(*),0) from tputsplans
         where fk_listid = pFK_LISTID
           and fk_korpid = pFK_KORPID
           and fk_typeid = pFK_TYPEID
           and fn_kdn = pFN_KDN
           and fl_new = 1;
 CURSOR cPutsKDN  IS
        select /*+ rule*/fk_id,fn_kdn from tputsplans
         where fk_listid = pFK_LISTID
           and fk_korpid = pFK_KORPID
           and fk_typeid = pFK_TYPEID
           and fn_kdn = pFN_KDN
           and fl_new = 1
      order by fk_id;
/* FUNCTION fCHECK_4_FREE(data in DATE,col IN NUMBER)
  RETURN NUMBER IS
   dTemp DATE;
   nTemp NUMBER;
   nValue NUMBER;
   BEGIN
     dTemp := data;
     nValue := 0;
     LOOP
       EXIT WHEN dTemp > data + col;
  select A - B - C into nValue from
       (SELECT GET_COUNTPOWER(dTemp,pFK_KORPID,pFK_TYPEID) as A FROM DUAL),
       (SELECT NVL(COUNT(*),0) as B
          FROM TSRTIPROOM,TROOM,TPERESEL
         WHERE TPERESEL.FD_DATA2 >= dTemp
           AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
           AND TROOM.FK_ID = TPERESEL.FK_PALATAID
           AND dTemp >= TSRTIPROOM.FD_DATA1
           AND (TSRTIPROOM.FD_DATA2 >= dTemp
                OR TSRTIPROOM.FD_DATA2 IS NULL)
           AND FK_VIDID = pFK_TYPEID
           AND FK_KORPID = pFK_KORPID),
       (SELECT NVL(COUNT(*),0) as C
          FROM TPUTPLANDATA,TPUTSPLANS,TPUTPLANDAYS
         WHERE TPUTPLANDAYS.FK_LISTID = pFK_LISTID
           AND TPUTPLANDAYS.FD_DATE = dTemp
           AND TPUTPLANDATA.FK_DAYSID = TPUTPLANDAYS.FK_ID
           AND TPUTSPLANS.FK_ID = TPUTPLANDATA.FK_PUTID
           AND TPUTSPLANS.FK_KORPID = pFK_KORPID
           AND TPUTSPLANS.FK_TYPEID = pFK_TYPEID);
       dTemp := dTemp + 1;
       EXIT WHEN nValue < 1;
     END LOOP;
     RETURN nValue;
   END;*/
 PROCEDURE pWO_NEXTYEAR(day in DATE,id IN NUMBER,kdn in NUMBER) IS
-- PRAGMA AUTONOMOUS_TRANSACTION;
  nTemp NUMBER;
  dayid NUMBER;
 BEGIN
   select fk_id into dayid from TPUTPLANDAYS where fk_listid = pFK_LISTID and fd_date = day;
   nTemp := dayid;
   LOOP
     EXIT WHEN nTemp = dayid + kdn;
     insert into tputplandata (fk_daysid,fk_putid) values (nTemp,id);
     nTemp := nTemp + 1;
   END LOOP;
   update tputsplans set
     fl_new = 0
   where fk_id = id;
--   COMMIT;
 END;
 PROCEDURE pVS_NEXTYEAR(day in DATE,id IN NUMBER,kdn in NUMBER) IS
-- PRAGMA AUTONOMOUS_TRANSACTION;
  CURSOR cMax IS
       select MAX(FD_DATE) from TPUTPLANDAYS where FK_LISTID = pFK_LISTID;
  CURSOR cMAIN(date1 IN DATE, date2 IN DATE) IS
       select FK_ID
         from TPUTPLANDAYS
        where FK_LISTID = pFK_LISTID
          and FD_DATE between date1 AND date2
     order by FK_ID;
  dDate DATE;
  date1 DATE;
  date2 DATE;
 BEGIN
   date1 := day;
   open cMax;
   fetch cMax into date2;
   close cMax;
   if date1 + kdn - 1 > date2 then
     dDate := date2 + 1;
     LOOP
       INSERT INTO TPUTPLANDAYS (FK_LISTID,FD_DATE)
            VALUES (pFK_LISTID,dDate);
       EXIT WHEN dDate = date1 + kdn - 1;
       dDate := dDate + 1;
     END LOOP;
   end if;
   FOR p in cMAIN(date1,date1+kdn-1) LOOP
     insert into tputplandata (fk_daysid,fk_putid) values (p.FK_ID,id);
   END LOOP;
   update tputsplans set
     fl_new = 0
   where fk_id = id;
--   COMMIT;
  END;
/* procedure do_log (d in date,c in varchar2) is
 pragma autonomous_transaction;
 begin
   insert into TLOGTABLE (FD_VALUE,FC_VALUE) values (d,c);
   commit;
 end;*/
BEGIN
--  do_log(sysdate,'Begin of function is reached!');
  select fc_year into cYEAR from tputplanlist where fk_id = pFK_LISTID;
  dTemp := pFD_DATE1;
  i := 1;
  LOOP
    tD(i) := dTemp;
    select A - B - C into nTemp from
        (SELECT GET_COUNTPOWER(dTemp,pFK_KORPID,pFK_TYPEID) as A FROM DUAL),
        (SELECT NVL(COUNT(*),0) as B
           FROM TSRTIPROOM,TROOM,TPERESEL
          WHERE TPERESEL.FD_DATA2 >= dTemp
            AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
            AND TROOM.FK_ID = TPERESEL.FK_PALATAID
            AND dTemp >= TSRTIPROOM.FD_DATA1
            AND (TSRTIPROOM.FD_DATA2 >= dTemp
                 OR TSRTIPROOM.FD_DATA2 IS NULL)
            AND FK_VIDID = pFK_TYPEID
            AND FK_KORPID = pFK_KORPID),
        (SELECT /*+ rule*/NVL(COUNT(*),0) as C
           FROM TPUTPLANDATA,TPUTSPLANS,TPUTPLANDAYS
          WHERE TPUTPLANDAYS.FK_LISTID = pFK_LISTID
            AND TPUTPLANDAYS.FD_DATE = dTemp
            AND TPUTPLANDATA.FK_DAYSID = TPUTPLANDAYS.FK_ID
            AND TPUTSPLANS.FK_ID = TPUTPLANDATA.FK_PUTID
            AND TPUTSPLANS.FK_KORPID = pFK_KORPID
            AND TPUTSPLANS.FK_TYPEID = pFK_TYPEID);
     tV(i):=nTemp;
   EXIT WHEN dTemp = pFD_DATE2;
   i := i + 1;
   dTemp := dTemp + 1;
  END LOOP;
  nID := 0;
  i := 1;
  IF pFN_KDN > 0 THEN
    open c4MoveKDN;
    fetch c4MoveKDN into nTemp;
    close c4MoveKDN;
    if nTemp > 0 then
      FOR p IN cPutsKDN
      LOOP
        LOOP
          EXIT WHEN i > tD.count;
          nCol:=1;

          FOR k in i..(i + p.FN_KDN - 1)
          LOOP
            if k > tV.count then
              nCol := -1;
              EXIT;
            end if;
            if tV(k) < 1 then
              nCol := 0;
              EXIT;
            end if;
          END LOOP;

          if nCol = 1 then
            pWO_NEXTYEAR(tD(i),p.FK_ID,p.FN_KDN);
            FOR k in i..(i + p.FN_KDN - 1)
            LOOP
              tV(k) := tV(k) - 1;
            END LOOP;
            i := i + p.FN_KDN;
            if i > tV.count then i := 1; end if;
            EXIT;
          elsif (nCol = -1) then
            if pFL_VSNEXTYEAR = 0 then
              pVS_NEXTYEAR(tD(i),p.FK_ID,p.FN_KDN);
              FOR k in i..(i + p.FN_KDN - 1)
              LOOP
                EXIT WHEN k > tV.count;
                tV(k) := tV(k) - 1;
              END LOOP;
              i := 1;
              EXIT;
            elsif pFL_VSNEXTYEAR = 1 then
              i := 1;
              EXIT WHEN nID = p.FK_ID;
            end if;
          else
            i := i + 1;
            if i > tV.count then i := 1; EXIT; end if;
          end if;

          nID := p.FK_ID;
        END LOOP;
      END LOOP;
    end if;
  ELSE
    open c4MoveAll;
    fetch c4MoveAll into nTemp;
    close c4MoveAll;
    if nTemp > 0 then
      FOR p IN cPutsAll
      LOOP
        LOOP
          EXIT WHEN i > tD.count;
          nCol:=1;

          FOR k in i..(i + p.FN_KDN - 1)
          LOOP
            if k > tV.count then
              nCol := -1;
              EXIT;
            end if;
            if tV(k) < 1 then
              nCol := 0;
              EXIT;
            end if;
          END LOOP;

          if nCol = 1 then
            pWO_NEXTYEAR(tD(i),p.FK_ID,p.FN_KDN);
            FOR k in i..(i + p.FN_KDN - 1)
            LOOP
              tV(k) := tV(k) - 1;
            END LOOP;
            i := i + p.FN_KDN;
            if i > tV.count then i := 1; end if;
            EXIT;
          elsif (nCol = -1) then
            if pFL_VSNEXTYEAR = 0 then
              pVS_NEXTYEAR(tD(i),p.FK_ID,p.FN_KDN);
              FOR k in i..(i + p.FN_KDN - 1)
              LOOP
                EXIT WHEN k > tV.count;
                tV(k) := tV(k) - 1;
              END LOOP;
              i := 1;
              EXIT;
            elsif pFL_VSNEXTYEAR = 1 then
              i := 1;
              EXIT WHEN nID = p.FK_ID;
            end if;
          else
            i := i + 1;
            if i > tV.count then i := 1; EXIT; end if;
          end if;

          nID := p.FK_ID;
        END LOOP;
      END LOOP;
    end if;
  END IF;
--  do_log(sysdate,'THE END of function is reached!');
  RETURN nCol;
END;
/* nTemp NUMBER;
 dTemp DATE;
 nCol NUMBER;
 nID NUMBER;
 cYEAR VARCHAR2(4);
 CURSOR c4MoveAll IS
        select NVL(COUNT(*),0) from tputsplans
         where fk_listid = pFK_LISTID
           and fk_korpid = pFK_KORPID
           and fk_typeid = pFK_TYPEID
           and fl_new = 1;
 CURSOR cPutsAll  IS
        select fk_id,fn_kdn from tputsplans
         where fk_listid = pFK_LISTID
           and fk_korpid = pFK_KORPID
           and fk_typeid = pFK_TYPEID
           and fl_new = 1
      order by fn_kdn desc, fk_id;
 CURSOR c4MoveKDN IS
        select NVL(COUNT(*),0) from tputsplans
         where fk_listid = pFK_LISTID
           and fk_korpid = pFK_KORPID
           and fk_typeid = pFK_TYPEID
           and fn_kdn = pFN_KDN
           and fl_new = 1;
 CURSOR cPutsKDN  IS
        select fk_id,fn_kdn from tputsplans
         where fk_listid = pFK_LISTID
           and fk_korpid = pFK_KORPID
           and fk_typeid = pFK_TYPEID
           and fn_kdn = pFN_KDN
           and fl_new = 1
      order by fk_id;
 FUNCTION fCHECK_4_FREE(data in DATE,col IN NUMBER)
  RETURN NUMBER IS
  dTemp DATE;
   nTemp NUMBER;
   nValue NUMBER;
   BEGIN
     dTemp := data;
     nValue := 0;
     LOOP
       EXIT WHEN dTemp > data + col;
  select A - B - C into nValue from
       (SELECT GET_COUNTPOWER(dTemp,pFK_KORPID,pFK_TYPEID) as A FROM DUAL),
       (SELECT NVL(COUNT(*),0) as B
          FROM TSRTIPROOM,TROOM,TPERESEL
         WHERE TPERESEL.FD_DATA2 >= dTemp
           AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
           AND TROOM.FK_ID = TPERESEL.FK_PALATAID
           AND dTemp >= TSRTIPROOM.FD_DATA1
           AND (TSRTIPROOM.FD_DATA2 >= dTemp
                OR TSRTIPROOM.FD_DATA2 IS NULL)
           AND FK_VIDID = pFK_TYPEID
           AND FK_KORPID = pFK_KORPID),
       (SELECT NVL(COUNT(*),0) as C
          FROM TPUTPLANDATA,TPUTSPLANS,TPUTPLANDAYS
         WHERE TPUTPLANDAYS.FK_LISTID = pFK_LISTID
           AND TPUTPLANDAYS.FD_DATE = dTemp
           AND TPUTPLANDATA.FK_DAYSID = TPUTPLANDAYS.FK_ID
           AND TPUTSPLANS.FK_ID = TPUTPLANDATA.FK_PUTID
           AND TPUTSPLANS.FK_KORPID = pFK_KORPID
           AND TPUTSPLANS.FK_TYPEID = pFK_TYPEID);
       dTemp := dTemp + 1;
       EXIT WHEN nValue < 1;
     END LOOP;
     RETURN nValue;
   END;
 PROCEDURE pWO_NEXTYEAR(day in DATE,id IN NUMBER,kdn in NUMBER) IS
-- PRAGMA AUTONOMOUS_TRANSACTION;
  nTemp NUMBER;
  dayid NUMBER;
 BEGIN
   select fk_id into dayid from TPUTPLANDAYS where fk_listid = pFK_LISTID and fd_date = day;
   nTemp := dayid;
   LOOP
     EXIT WHEN nTemp = dayid + kdn;
     insert into tputplandata (fk_daysid,fk_putid) values (nTemp,id);
     nTemp := nTemp + 1;
   END LOOP;
   update tputsplans set
     fl_new = 0
   where fk_id = id;
--   COMMIT;
 END;
 PROCEDURE pVS_NEXTYEAR(day in DATE,id IN NUMBER,kdn in NUMBER) IS
-- PRAGMA AUTONOMOUS_TRANSACTION;
  CURSOR cMax IS
       select MAX(FD_DATE) from TPUTPLANDAYS where FK_LISTID = pFK_LISTID;
  CURSOR cMAIN(date1 IN DATE, date2 IN DATE) IS
       select FK_ID
         from TPUTPLANDAYS
        where FK_LISTID = pFK_LISTID
          and FD_DATE between date1 AND date2
     order by FK_ID;
  dDate DATE;
  date1 DATE;
  date2 DATE;
 BEGIN
   date1 := day;
   open cMax;
   fetch cMax into date2;
   close cMax;
   if date1 + kdn - 1 > date2 then
     dDate := date2 + 1;
     LOOP
       INSERT INTO TPUTPLANDAYS (FK_LISTID,FD_DATE)
            VALUES (pFK_LISTID,dDate);
       EXIT WHEN dDate = date1 + kdn - 1;
       dDate := dDate + 1;
     END LOOP;
   end if;
   FOR p in cMAIN(date1,date1+kdn-1) LOOP
     insert into tputplandata (fk_daysid,fk_putid) values (p.FK_ID,id);
   END LOOP;
   update tputsplans set
     fl_new = 0
   where fk_id = id;
--   COMMIT;
  END;
 procedure do_log (d in date,c in varchar2) is
 pragma autonomous_transaction;
 begin
   insert into TLOGTABLE (FD_VALUE,FC_VALUE) values (d,c);
   commit;
 end;
BEGIN
  do_log(sysdate,'Begin of function is reached!');
  nCol := 0;
  nID := 0;
  select fc_year into cYEAR from tputplanlist where fk_id = pFK_LISTID;

  IF pFN_KDN > 0 THEN
    open c4MoveKDN;
    fetch c4MoveKDN into nTemp;
    close c4MoveKDN;

    if nTemp > 0 then
  --    do_log(sysdate,'1st point is reached! nTemp = '||TO_CHAR(nTemp));
      dTemp := pFD_DATE1;
      FOR p IN cPutsKDN LOOP

  --      do_log(sysdate,'2nd point is reached! p.fk_id = '||TO_CHAR(p.FK_ID)||' , p.FN_KDN = '||TO_CHAR(p.FN_KDN));
        LOOP
  \*        if pFL_VSNEXTYEAR = 1 then
            EXIT WHEN dTemp + p.FN_KDN > pFD_DATE2;
          else*\
          EXIT WHEN dTemp > pFD_DATE2;
  --        end if;

  --        do_log(sysdate,'3rd point is reached! dTemp = '||TO_CHAR(dTemp,'dd.mm.yyyy')||' , p.FK_ID = '||TO_CHAR(p.FK_ID));

          if fCHECK_4_FREE (dTemp,p.FN_KDN) > 0 then
            nCol := nCol + 1;

  --          do_log(sysdate,'4th point is reached! dTemp = '||TO_CHAR(dTemp,'dd.mm.yyyy'));

            if (pFL_VSNEXTYEAR = 0) AND (dTemp + p.FN_KDN > pFD_DATE2\*TO_DATE('31.12.'||cYEAR,'dd.mm.yyyy')*\) then
              pVS_NEXTYEAR(dTemp,p.FK_ID,p.FN_KDN);

  --            do_log(sysdate,'5th point is reached!');
              dTemp := dTemp + p.FN_KDN;
              if dTemp > pFD_DATE2 then dTemp := pFD_DATE1; end if;
              EXIT;
            elsif (pFL_VSNEXTYEAR = 1) AND (dTemp + p.FN_KDN > pFD_DATE2\*TO_DATE('31.12.'||cYEAR,'dd.mm.yyyy')*\) then
              nCol := nCol - 1;
              dTemp := pFD_DATE1;
              EXIT WHEN nID = p.FK_ID;
            else
              pWO_NEXTYEAR(dTemp,p.FK_ID,p.FN_KDN);

  --            do_log(sysdate,'5th point is reached!');
              dTemp := dTemp + p.FN_KDN;
              if dTemp > pFD_DATE2 then dTemp := pFD_DATE1; end if;
              EXIT;
            end if;

          else
            dTemp := dTemp + 1;
            if dTemp > pFD_DATE2 then dTemp := pFD_DATE1; EXIT; end if;
          end if;

          nID := p.FK_ID;

        END LOOP;

      END LOOP;
    end if;
  ELSE
    open c4MoveAll;
    fetch c4MoveAll into nTemp;
    close c4MoveAll;

    if nTemp > 0 then
      dTemp := pFD_DATE1;
      FOR p IN cPutsAll LOOP

        LOOP
          EXIT WHEN dTemp > pFD_DATE2;

          if fCHECK_4_FREE (dTemp,p.FN_KDN) > 0 then
            nCol := nCol + 1;

            if (pFL_VSNEXTYEAR = 0) AND (dTemp + p.FN_KDN > pFD_DATE2) then
              pVS_NEXTYEAR(dTemp,p.FK_ID,p.FN_KDN);

              dTemp := dTemp + p.FN_KDN;
              if dTemp > pFD_DATE2 then dTemp := pFD_DATE1; end if;
              EXIT;
            elsif (pFL_VSNEXTYEAR = 1) AND (dTemp + p.FN_KDN > pFD_DATE2) then
              nCol := nCol - 1;
              dTemp := pFD_DATE1;
              EXIT WHEN nID = p.FK_ID;
            else
              pWO_NEXTYEAR(dTemp,p.FK_ID,p.FN_KDN);

              dTemp := dTemp + p.FN_KDN;
              if dTemp > pFD_DATE2 then dTemp := pFD_DATE1; end if;
              EXIT;
            end if;

          else
            dTemp := dTemp + 1;
            if dTemp > pFD_DATE2 then dTemp := pFD_DATE1; EXIT; end if;
          end if;

          nID := p.FK_ID;

        END LOOP;

      END LOOP;
    end if;
  END IF;
  do_log(sysdate,'THE END of function is reached!');
  RETURN nCol;*/
/

SHOW ERRORS;


