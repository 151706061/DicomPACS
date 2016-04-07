DROP FUNCTION ASU.GET_COUNTPOWER_OF_PEREHOD
/

--
-- GET_COUNTPOWER_OF_PEREHOD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--   TROOM (Table)
--   TPERESEL (Table)
--   TPUTPLANDAYS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTPOWER_OF_PEREHOD" -- Created by TimurLan 4 rPutsPlan
  (pFK_LISTID IN NUMBER,pFK_KORPID IN NUMBER,pFK_TYPEID IN NUMBER)
 RETURN NUMBER IS
 nTemp NUMBER;
 CURSOR cAll IS
             SELECT SUM(NVL(FN_PEREHOD,0)) as FN_VALUE FROM
                  (select tputplandays.fd_date,COUNT(TPERESEL.fk_id) as FN_PEREHOD
                     from tputplandays,TPERESEL,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      AND TPERESEL.FD_DATA2 >= fd_date
                      AND TPERESEL.FD_DATA1 < TO_DATE('01.01.'||TO_CHAR(tputplandays.fd_date,'yyyy'),'dd.mm.yyyy')
                      AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID > 0
                      AND FK_KORPID > 0
                 GROUP BY tputplandays.fd_date) t;
/*                  SELECT COUNT(*)
                    FROM TPERESEL,TSRTIPROOM,TROOM
                   WHERE TPERESEL.FD_DATA2 >= data
                     and TPERESEL.FD_DATA1 < TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy')
                     AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                     AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                     AND data >= TSRTIPROOM.FD_DATA1
                     AND (TSRTIPROOM.FD_DATA2 >= data
                          OR TSRTIPROOM.FD_DATA2 IS NULL)
                     AND FK_VIDID > 0
                     AND FK_KORPID > 0;*/
  CURSOR cKorp IS
             SELECT SUM(NVL(FN_PEREHOD,0)) as FN_VALUE FROM
                  (select tputplandays.fd_date,COUNT(TPERESEL.fk_id) as FN_PEREHOD
                     from tputplandays,TPERESEL,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      AND TPERESEL.FD_DATA2 >= fd_date
                      AND TPERESEL.FD_DATA1 < TO_DATE('01.01.'||TO_CHAR(tputplandays.fd_date,'yyyy'),'dd.mm.yyyy')
                      AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID > 0
                      AND FK_KORPID = pFK_KORPID
                 GROUP BY tputplandays.fd_date) t;
/*                  SELECT COUNT(*)
                    FROM TPERESEL,TSRTIPROOM,TROOM
                   WHERE TPERESEL.FD_DATA2 >= data
                     and TPERESEL.FD_DATA1 < TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy')
                     AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                     AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                     AND data >= TSRTIPROOM.FD_DATA1
                     AND (TSRTIPROOM.FD_DATA2 >= data
                          OR TSRTIPROOM.FD_DATA2 IS NULL)
                     AND FK_VIDID > 0
                     AND FK_KORPID = pFK_KORPID;*/
  CURSOR cType IS
             SELECT SUM(NVL(FN_PEREHOD,0)) as FN_VALUE FROM
                  (select tputplandays.fd_date,COUNT(TPERESEL.fk_id) as FN_PEREHOD
                     from tputplandays,TPERESEL,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      AND TPERESEL.FD_DATA2 >= fd_date
                      AND TPERESEL.FD_DATA1 < TO_DATE('01.01.'||TO_CHAR(tputplandays.fd_date,'yyyy'),'dd.mm.yyyy')
                      AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID = pFK_TYPEID
                      AND FK_KORPID > 0
                 GROUP BY tputplandays.fd_date) t;
/*                  SELECT COUNT(*)
                    FROM TPERESEL,TSRTIPROOM,TROOM
                   WHERE TPERESEL.FD_DATA2 >= data
                     and TPERESEL.FD_DATA1 < TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy')
                     AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                     AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                     AND data >= TSRTIPROOM.FD_DATA1
                     AND (TSRTIPROOM.FD_DATA2 >= data
                          OR TSRTIPROOM.FD_DATA2 IS NULL)
                     AND FK_VIDID = pFK_TYPEID
                     AND FK_KORPID > 0;*/
  CURSOR cKorpType IS
             SELECT SUM(NVL(FN_PEREHOD,0)) as FN_VALUE FROM
                  (select tputplandays.fd_date,COUNT(TPERESEL.fk_id) as FN_PEREHOD
                     from tputplandays,TPERESEL,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      AND TPERESEL.FD_DATA2 >= fd_date
                      AND TPERESEL.FD_DATA1 < TO_DATE('01.01.'||TO_CHAR(tputplandays.fd_date,'yyyy'),'dd.mm.yyyy')
                      AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID = pFK_TYPEID
                      AND FK_KORPID = pFK_KORPID
                 GROUP BY tputplandays.fd_date) t;
/*                  SELECT COUNT(*)
                    FROM TPERESEL,TSRTIPROOM,TROOM
                   WHERE TPERESEL.FD_DATA2 >= data
                     and TPERESEL.FD_DATA1 < TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy')
                     AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                     AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                     AND data >= TSRTIPROOM.FD_DATA1
                     AND (TSRTIPROOM.FD_DATA2 >= data
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
  RETURN NVL(nTemp,0);
END;
/

SHOW ERRORS;


