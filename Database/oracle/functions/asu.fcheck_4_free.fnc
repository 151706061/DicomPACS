DROP FUNCTION ASU.FCHECK_4_FREE
/

--
-- FCHECK_4_FREE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--   TROOM (Table)
--   TPERESEL (Table)
--   GET_COUNTPOWER (Function)
--   TPUTPLANDATA (Table)
--   TPUTPLANDAYS (Table)
--   TPUTSPLANS (Table)
--
CREATE OR REPLACE FUNCTION ASU."FCHECK_4_FREE" (data in DATE,col IN NUMBER,pFK_KORPID in NUMBER, pFK_TYPEID in NUMBER, pFK_LISTID IN NUMBER) -- just 4 test maybe deleted 4free
  RETURN NUMBER IS
  CURSOR cCOL (d IN DATE) IS
        SELECT GET_COUNTPOWER(d,pFK_KORPID,pFK_TYPEID) FROM DUAL;
  CURSOR cUSE1(d IN DATE) IS
        SELECT NVL(COUNT(*),0)
          FROM TPERESEL,TSRTIPROOM,TROOM
         WHERE TPERESEL.FD_DATA2 >= d
           AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
           AND TROOM.FK_ID = TPERESEL.FK_PALATAID
           AND d >= TSRTIPROOM.FD_DATA1
           AND (TSRTIPROOM.FD_DATA2 >= d
                OR TSRTIPROOM.FD_DATA2 IS NULL)
           AND FK_VIDID = pFK_TYPEID
           AND FK_KORPID = pFK_KORPID;
  CURSOR cUSE2(d IN DATE) IS
        SELECT NVL(COUNT(*),0)
          FROM TPUTPLANDATA,TPUTSPLANS,TPUTPLANDAYS
         WHERE TPUTPLANDAYS.FK_LISTID = pFK_LISTID
           AND TPUTPLANDAYS.FD_DATE = d
           AND TPUTPLANDATA.FK_DAYSID = TPUTPLANDAYS.FK_ID
           AND TPUTSPLANS.FK_ID = TPUTPLANDATA.FK_PUTID
           AND TPUTSPLANS.FK_KORPID = pFK_KORPID
           AND TPUTSPLANS.FK_TYPEID = pFK_TYPEID;
   dTemp DATE;
   nTemp NUMBER;
   nValue NUMBER;
   BEGIN
     dTemp := data;
     nValue := 0;
     LOOP
       EXIT WHEN dTemp > data + col;
       select A - B - C into nValue FROM
       (SELECT GET_COUNTPOWER(dTemp,pFK_KORPID,pFK_TYPEID) as A FROM DUAL),
       (SELECT NVL(COUNT(*),0) as B
          FROM TPERESEL,TSRTIPROOM,TROOM
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
/*       open cCOL(dTemp);
       fetch cCOL into nTemp;
       close cCol;
       nValue := nTemp;
       open cUSE1(dTemp);
       fetch cUSE1 into nTemp;
       close cUSE1;
       nValue := nValue - nTemp;
       open cUSE2(dTemp);
       fetch cUSE2 into nTemp;
       close cUSE2;
       nValue := nValue - nTemp;*/
       dTemp := dTemp + 1;
       EXIT WHEN nValue < 1;
     END LOOP;
     RETURN nValue;
   END;
/

SHOW ERRORS;


