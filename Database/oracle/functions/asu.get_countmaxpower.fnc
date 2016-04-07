DROP FUNCTION ASU.GET_COUNTMAXPOWER
/

--
-- GET_COUNTMAXPOWER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--   TROOM (Table)
--   TPUTPLANDAYS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTMAXPOWER" -- Created by TimurLan 4 rPutsPlan
  (pFK_LISTID IN NUMBER,pFK_KORPID IN NUMBER,pFK_TYPEID IN NUMBER)
 RETURN NUMBER IS
 nTemp NUMBER;
 CURSOR cAll IS
             SELECT SUM(NVL(FN_MESTA,0)) as FN_VALUE FROM
                  (SELECT tputplandays.fd_date,SUM(FN_MESTA) as FN_MESTA
                     FROM tputplandays,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      AND TSRTIPROOM.FK_PALATAID = TROOM.FK_ID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID > 0
                      AND FK_KORPID > 0
                 GROUP BY tputplandays.fd_date) t;
/*   SELECT SUM(FN_MESTA)
     FROM TSRTIPROOM,TROOM
    WHERE TSRTIPROOM.FK_PALATAID = TROOM.FK_ID
      AND TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy') >= TSRTIPROOM.FD_DATA1
      AND (TSRTIPROOM.FD_DATA2 >= TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy')
           OR TSRTIPROOM.FD_DATA2 IS NULL)
      AND FK_VIDID > 0
      AND FK_KORPID > 0;*/
 CURSOR cKorp IS
             SELECT SUM(NVL(FN_MESTA,0)) as FN_VALUE FROM
                  (SELECT tputplandays.fd_date,SUM(FN_MESTA) as FN_MESTA
                     FROM tputplandays,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      AND TSRTIPROOM.FK_PALATAID = TROOM.FK_ID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID > 0
                      AND FK_KORPID = pFK_KORPID
                 GROUP BY tputplandays.fd_date) t;
/*   SELECT SUM(FN_MESTA)
     FROM TSRTIPROOM,TROOM
    WHERE TSRTIPROOM.FK_PALATAID = TROOM.FK_ID
      AND TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy') >= TSRTIPROOM.FD_DATA1
      AND (TSRTIPROOM.FD_DATA2 >= TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy')
           OR TSRTIPROOM.FD_DATA2 IS NULL)
      AND FK_VIDID > 0
      AND FK_KORPID = pFK_KORPID;*/
 CURSOR cType IS
             SELECT SUM(NVL(FN_MESTA,0)) as FN_VALUE FROM
                  (SELECT tputplandays.fd_date,SUM(FN_MESTA) as FN_MESTA
                     FROM tputplandays,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      AND TSRTIPROOM.FK_PALATAID = TROOM.FK_ID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID = pFK_TYPEID
                      AND FK_KORPID > 0
                 GROUP BY tputplandays.fd_date) t;
/*   SELECT SUM(FN_MESTA)
     FROM TSRTIPROOM,TROOM
    WHERE TSRTIPROOM.FK_PALATAID = TROOM.FK_ID
      AND TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy') >= TSRTIPROOM.FD_DATA1
      AND (TSRTIPROOM.FD_DATA2 >= TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy')
           OR TSRTIPROOM.FD_DATA2 IS NULL)
      AND FK_VIDID = pFK_TYPEID
      AND FK_KORPID > 0;*/
 CURSOR cKorpType IS
             SELECT SUM(NVL(FN_MESTA,0)) as FN_VALUE FROM
                  (SELECT tputplandays.fd_date,SUM(FN_MESTA) as FN_MESTA
                     FROM tputplandays,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      AND TSRTIPROOM.FK_PALATAID = TROOM.FK_ID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID = pFK_TYPEID
                      AND FK_KORPID = pFK_KORPID
                 GROUP BY tputplandays.fd_date) t;
/*   SELECT SUM(FN_MESTA)
     FROM TSRTIPROOM,TROOM
    WHERE TSRTIPROOM.FK_PALATAID = TROOM.FK_ID
      AND TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy') >= TSRTIPROOM.FD_DATA1
      AND (TSRTIPROOM.FD_DATA2 >= TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy')
           OR TSRTIPROOM.FD_DATA2 IS NULL)
      AND FK_VIDID = pFK_TYPEID
      AND FK_KORPID = pFK_KORPID;*/
BEGIN
  if (pFK_KORPID = 0) AND (pFK_TYPEID = 0) then
    OPEN cAll;
    FETCH cAll INTO nTemp;
    CLOSE cAll;
  elsif (pFK_KORPID > 0) AND (pFK_TYPEID = 0) then
    OPEN cKorp;
    FETCH cKorp INTO nTemp;
    CLOSE cKorp;
  elsif (pFK_KORPID = 0) AND (pFK_TYPEID > 0) then
    OPEN cType;
    FETCH cType INTO nTemp;
    CLOSE cType;
  elsif (pFK_KORPID > 0) AND (pFK_TYPEID > 0) then
    OPEN cKorpType;
    FETCH cKorpType INTO nTemp;
    CLOSE cKorpType;
  end if;
/*  if IS_LEAPYEAR(TO_NUMBER(pFC_YEAR)) = 1 then
    nTemp := NVL(nTemp,0) * 366;
  elsif IS_LEAPYEAR(TO_NUMBER(pFC_YEAR)) = 0 then
    nTemp := NVL(nTemp,0) * 365;
  end if;*/
  RETURN NVL(nTemp,0);
END;
/*CREATE OR REPLACE Function GET_COUNTMAXPOWER-- Created by TimurLan 4 rPutsPlan
  (pFC_VALUE IN VARCHAR)
 RETURN NUMBER IS
 nTemp NUMBER;
 CURSOR cTemp IS
   SELECT SUM(FN_MESTA) as FN_VALUE
     FROM TSRTIPROOM,TROOM
    WHERE TSRTIPROOM.FK_PALATAID = TROOM.FK_ID
      AND TO_DATE('01.01.'||pFC_VALUE,'dd.mm.yyyy') >= TSRTIPROOM.FD_DATA1
      AND (TSRTIPROOM.FD_DATA2 >= TO_DATE('01.01.'||pFC_VALUE,'dd.mm.yyyy')
           OR TSRTIPROOM.FD_DATA2 IS NULL)
      AND FK_VIDID > 0
      AND FK_KORPID > 0;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  if IS_LEAPYEAR(TO_NUMBER(pFC_VALUE)) = 1 then
    nTemp := nTemp * 366;
  elsif IS_LEAPYEAR(TO_NUMBER(pFC_VALUE)) = 0 then
    nTemp := nTemp * 365;
  end if;
  RETURN NVL(nTemp\*-GET_COUNTPOWER_OF_PERIOD(pFC_VALUE,0,0)*\,0);
END;*/
/

SHOW ERRORS;


