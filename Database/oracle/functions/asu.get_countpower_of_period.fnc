DROP FUNCTION ASU.GET_COUNTPOWER_OF_PERIOD
/

--
-- GET_COUNTPOWER_OF_PERIOD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--   TROOM (Table)
--   TPERESEL (Table)
--   TPUTPLANDAYS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTPOWER_OF_PERIOD" -- Created by TimurLan 4 rPutsPlan
  (pFK_LISTID IN NUMBER,pFK_KORPID IN NUMBER,pFK_TYPEID IN NUMBER)
 RETURN NUMBER IS
 nTemp NUMBER;
 CURSOR cAll IS
             SELECT SUM(NVL(FN_COUNT,0)) as FN_VALUE FROM
                  (select tputplandays.fd_date,COUNT(TPERESEL.fk_id) FN_COUNT
                     from tputplandays,TPERESEL,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      and (((TPERESEL.FD_DATA1 between fd_date and fd_date+1-1/(24*60*60)) and fd_date < TPERESEL.FD_DATA2)
                           OR (fd_date between TPERESEL.FD_DATA1 and TPERESEL.FD_DATA2)
                           OR ((TPERESEL.FD_DATA2 between fd_date and fd_date+1-1/(24*60*60)) and fd_date > TPERESEL.FD_DATA1))
                      AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID > 0
                      AND FK_KORPID > 0
                 GROUP BY tputplandays.fd_date) t;
/*                    select \*+ rule*\COUNT(TPERESEL.fk_id)
                    from TPERESEL,TSRTIPROOM,TROOM
                    WHERE data BETWEEN TRUNC(TPERESEL.FD_DATA1) AND TRUNC(TPERESEL.FD_DATA2)
                    AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                    AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                    AND data >= TSRTIPROOM.FD_DATA1
                    AND (TSRTIPROOM.FD_DATA2 >= data
                    OR TSRTIPROOM.FD_DATA2 IS NULL)
                    AND FK_VIDID > 0
                    AND FK_KORPID > 0;*/
/*                  SELECT \*+ rule*\COUNT(TPERESEL.FK_ID)
                    FROM TPERESEL,TSRTIPROOM,TROOM
                   WHERE TPERESEL.FD_DATA2 >= data
                     and TPERESEL.FD_DATA1 >= TO_DATE('01.01.'||pFC_YEAR,'dd.mm.yyyy')
                     AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                     AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                     AND data >= TSRTIPROOM.FD_DATA1
                     AND (TSRTIPROOM.FD_DATA2 >= data
                          OR TSRTIPROOM.FD_DATA2 IS NULL)
                     AND FK_VIDID > 0
                     AND FK_KORPID > 0;*/
  CURSOR cKorp IS
             SELECT SUM(NVL(FN_COUNT,0)) as FN_VALUE FROM
                  (select tputplandays.fd_date,COUNT(TPERESEL.fk_id) FN_COUNT
                     from tputplandays,TPERESEL,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      and (((TPERESEL.FD_DATA1 between fd_date and fd_date+1-1/(24*60*60)) and fd_date < TPERESEL.FD_DATA2)
                           OR (fd_date between TPERESEL.FD_DATA1 and TPERESEL.FD_DATA2)
                           OR ((TPERESEL.FD_DATA2 between fd_date and fd_date+1-1/(24*60*60)) and fd_date > TPERESEL.FD_DATA1))
                      AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID > 0
                      AND FK_KORPID = pFK_KORPID
                 GROUP BY tputplandays.fd_date) t;
/*                    select \*+ rule*\COUNT(TPERESEL.fk_id)
                    from TPERESEL,TSRTIPROOM,TROOM
                    WHERE data BETWEEN TRUNC(TPERESEL.FD_DATA1) AND TRUNC(TPERESEL.FD_DATA2)
                    AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                    AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                    AND data >= TSRTIPROOM.FD_DATA1
                    AND (TSRTIPROOM.FD_DATA2 >= data
                    OR TSRTIPROOM.FD_DATA2 IS NULL)
                    AND FK_VIDID > 0
                    AND FK_KORPID = pFK_KORPID;*/
  CURSOR cType IS
             SELECT SUM(NVL(FN_COUNT,0)) as FN_VALUE FROM
                  (select tputplandays.fd_date,COUNT(TPERESEL.fk_id) FN_COUNT
                     from tputplandays,TPERESEL,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      and (((TPERESEL.FD_DATA1 between fd_date and fd_date+1-1/(24*60*60)) and fd_date < TPERESEL.FD_DATA2)
                           OR (fd_date between TPERESEL.FD_DATA1 and TPERESEL.FD_DATA2)
                           OR ((TPERESEL.FD_DATA2 between fd_date and fd_date+1-1/(24*60*60)) and fd_date > TPERESEL.FD_DATA1))
                      AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID = pFK_TYPEID
                      AND FK_KORPID > 0
                 GROUP BY tputplandays.fd_date) t;
/*                    select \*+ rule*\COUNT(TPERESEL.fk_id)
                    from TPERESEL,TSRTIPROOM,TROOM
                    WHERE data BETWEEN TRUNC(TPERESEL.FD_DATA1) AND TRUNC(TPERESEL.FD_DATA2)
                    AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                    AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                    AND data >= TSRTIPROOM.FD_DATA1
                    AND (TSRTIPROOM.FD_DATA2 >= data
                    OR TSRTIPROOM.FD_DATA2 IS NULL)
                    AND FK_VIDID = pFK_TYPEID
                    AND FK_KORPID > 0;*/
  CURSOR cKorpType IS
             SELECT SUM(NVL(FN_COUNT,0)) as FN_VALUE FROM
                  (select tputplandays.fd_date,COUNT(TPERESEL.fk_id) FN_COUNT
                     from tputplandays,TPERESEL,TSRTIPROOM,TROOM
                    WHERE tputplandays.fk_listid = pFK_LISTID
                      and (((TPERESEL.FD_DATA1 between fd_date and fd_date+1-1/(24*60*60)) and fd_date < TPERESEL.FD_DATA2)
                           OR (fd_date between TPERESEL.FD_DATA1 and TPERESEL.FD_DATA2)
                           OR ((TPERESEL.FD_DATA2 between fd_date and fd_date+1-1/(24*60*60)) and fd_date > TPERESEL.FD_DATA1))
                      AND TSRTIPROOM.FK_PALATAID = TPERESEL.FK_PALATAID
                      AND TROOM.FK_ID = TPERESEL.FK_PALATAID
                      AND fd_date >= TSRTIPROOM.FD_DATA1
                      AND (TSRTIPROOM.FD_DATA2 >= fd_date
                           OR TSRTIPROOM.FD_DATA2 IS NULL)
                      AND FK_VIDID = pFK_TYPEID
                      AND FK_KORPID = pFK_KORPID
                 GROUP BY tputplandays.fd_date) t;
/*                    select \*+ rule*\COUNT(TPERESEL.fk_id)
                    from TPERESEL,TSRTIPROOM,TROOM
                    WHERE data BETWEEN TRUNC(TPERESEL.FD_DATA1) AND TRUNC(TPERESEL.FD_DATA2)
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


