DROP PACKAGE BODY ASU.PKG_R_ALLFUNC
/

--
-- PKG_R_ALLFUNC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_ALLFUNC" 
 is-- Created by TimurLan
  FUNCTION RETURN_VALUE (nValue IN NUMBER) RETURN VARCHAR2 IS
  BEGIN
    if (nValue is NULL) or (nValue = 0) then
      RETURN '&nbsp;';
    else
      RETURN TO_CHAR(nValue);
    end if;
  END;
  FUNCTION RETURN_VALUE (cValue IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    if (cValue is NULL) or (cValue = '0')
    then
      RETURN '&nbsp;';
    else
      RETURN cValue;
    end if;
  END;
  FUNCTION COUNT_SROK(pFK_PACID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_ID)
        FROM TSROKY
       WHERE FK_PACID=pFK_PACID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count (fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=2;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      select count (fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=2;
    CURSOR cKorp IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=2
         AND GET_PACKORPID(FK_PACID,fd_data1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FK_PRYB=2
         AND FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZN IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FK_PRYB = 2
         AND FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC_VID (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FK_PRYB = 2
         AND FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC_VOZR (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFN_VOZR IN NUMBER, pFL_BIGGER IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 2
         AND GET_PACVOZR (FK_PACID) >= pFN_VOZR;
    CURSOR c1 IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 2
         AND GET_PACVOZR (FK_PACID) < pFN_VOZR;
    i NUMBER;
  BEGIN
    IF pFL_BIGGER = 1 THEN
      OPEN c;
      FETCH C INTO i;
      CLOSE c;
    ELSE
      OPEN c1;
      FETCH C1 INTO i;
      CLOSE c1;
    END IF;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC_SKK (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_SKK IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FK_PRYB = 2
         AND FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND GET_PAC_SKK (FK_PACID) = pFL_SKK;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC_VOZR_SKK (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFN_VOZR IN NUMBER, pFL_BIGGER IN NUMBER, pFL_SKK IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 2
         AND GET_PACVOZR (FK_PACID) >= pFN_VOZR
         AND GET_PAC_SKK (FK_PACID) = pFL_SKK;
    CURSOR c1 IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 2
         AND GET_PACVOZR (FK_PACID) < pFN_VOZR
         AND GET_PAC_SKK (FK_PACID) = pFL_SKK;
    i NUMBER;
  BEGIN
    IF pFL_BIGGER = 1 THEN
      OPEN c;
      FETCH C INTO i;
      CLOSE c;
    ELSE
      OPEN c1;
      FETCH C1 INTO i;
      CLOSE c1;
    END IF;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC_PUT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (DISTINCT TPUTS.FC_PUT)
        FROM TSROKY, /*TKARTA, */TPUTS
       WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 2
         AND TPUTS.FK_PACID /*= TKARTA.FK_ID
         AND TKARTA.FK_ID*/ = TSROKY.FK_PACID
         AND IS_FCPUT_MORE_ZERO(TPUTS.FC_PUT) > 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_INC_PUT (pFD_DATA IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (DISTINCT TPUTS.FC_PUT)
        FROM TSROKY, TPUTS
       WHERE fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
         AND FK_PRYB = 2
         AND TPUTS.FK_PACID = TSROKY.FK_PACID
         AND IS_FCPUT_MORE_ZERO(TPUTS.FC_PUT) > 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_PEREHOD_PUT (pFD_DATA IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (DISTINCT TPUTS.FC_PUT)
        FROM TSROKY, /*TKARTA, */TPUTS
       WHERE TRUNC(FD_DATA1) <= pFD_DATA
         AND TRUNC(FD_DATA3) > pFD_DATA
         AND FK_PRYB IN (2, 4, 5, 6)
         AND TPUTS.FK_PACID /*= TKARTA.FK_ID
         AND TKARTA.FK_ID*/ = TSROKY.FK_PACID
         AND IS_FCPUT_MORE_ZERO(TPUTS.FC_PUT) > 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=3;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=3;
    CURSOR cKorp IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=3
         AND GET_PACKORPID(FK_PACID,fd_data1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_TEMPOUT(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=7;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_TEMPOUT_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=7;
    CURSOR cKorp IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=7
         AND GET_PACKORPID(FK_PACID,fd_data1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION GET_COUNT_RECOVER(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=4;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_RECOVER_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=4;
    CURSOR cKorp IS
      select count(fk_id)
        from tsroky
       where fd_data1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)
         and fk_pryb=4
         AND GET_PACKORPID(FK_PACID,fd_data1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION GET_COUNT_PRYB(pFD_DATAC IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB2(pFD_DATAC IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_VID2(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1
         AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_PALATA2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (*)
        FROM TSROKY,TKARTA
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_PUT2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (*)
        FROM TSROKY,TKARTA
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    CURSOR c1 IS
      SELECT COUNT (*)
        FROM TSROKY,TKARTA
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_AGE(pFD_DATAC IN DATE, pFN_AGE IN NUMBER, pFL_GREATER IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACVOZR (FK_PACID) >= pFN_AGE;
    CURSOR c1 (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACVOZR (FK_PACID) < pFN_AGE;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    IF pFL_GREATER = 1 THEN
      OPEN c (2);
      FETCH c INTO i;
      CLOSE c;
      str  := i;
      OPEN c (4);
      FETCH c INTO i;
      CLOSE c;
    ELSE
      OPEN c1 (2);
      FETCH c1 INTO i;
      CLOSE c1;
      str  := i;
      OPEN c1 (4);
      FETCH c1 INTO i;
      CLOSE c1;
    END IF;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR cAll (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
    CURSOR cKorp (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp (2);
      FETCH cKorp INTO i;
      CLOSE cKorp;
      str  := i;
      OPEN cKorp (4);
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll (2);
      FETCH cAll INTO i;
      CLOSE cAll;
      str  := i;
      OPEN cAll (4);
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB2 (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZN IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', 5);
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZN IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', 5)
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_VID (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_PRYB_VID2 (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (2);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (4);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB(pFD_DATAC IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
   i NUMBER;
   str VARCHAR2(50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB2(pFD_DATAC IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA3 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1;
   i NUMBER;
   str VARCHAR2(50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_VID2(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA3 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1
         AND GET_PAC_VID_KODE(FK_PACID)=pFK_KOD2;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_PALATA2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA3 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1
         AND GET_PALATAVID(GET_PACPALATADATE(FK_PACID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (*)
        FROM TSROKY,TKARTA
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_PUT2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (*)
        FROM TSROKY,TKARTA
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    CURSOR c1 IS
      SELECT COUNT (*)
        FROM TSROKY,TKARTA
       WHERE FD_DATA3 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1
         AND TKARTA.FK_PUTTYPE=pFK_TYPEID
         AND TKARTA.FK_ID=FK_PACID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_AGE(pFD_DATAC IN DATE, pFN_AGE IN NUMBER, pFL_GREATER IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACVOZR (FK_PACID) >= pFN_AGE;
    CURSOR c1 (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACVOZR (FK_PACID) < pFN_AGE;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    IF pFL_GREATER = 1 THEN
      OPEN c (3);
      FETCH c INTO i;
      CLOSE c;
      str  := i;
      OPEN c (7);
      FETCH c INTO i;
      CLOSE c;
    ELSE
      OPEN c1 (3);
      FETCH c1 INTO i;
      CLOSE c1;
      str  := i;
      OPEN c1 (7);
      FETCH c1 INTO i;
      CLOSE c1;
    END IF;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_KORP(pFD_DATAC IN DATE, pFK_KORPID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR cAll (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
    CURSOR cKorp (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATAC AND pFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID;
    i NUMBER;
    str VARCHAR2(50);
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp (3);
      FETCH cKorp INTO i;
      CLOSE cKorp;
      str  := i;
      OPEN cKorp (7);
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll (3);
      FETCH cAll INTO i;
      CLOSE cAll;
      str  := i;
      OPEN cAll (7);
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB2 (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZN IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', 5);
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYBSHORTPRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZN IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', 5)
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZN;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_VID (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_VID2 (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2;
    CURSOR c1 IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 1
         AND COUNT_SROK(FK_PACID)=1
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c1;
    FETCH c1 INTO i;
    CLOSE c1;
    str  := TO_NUMBER(str)+i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_VID_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER, pFK_PRIZNID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_VID_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5');
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_VID_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER, pFK_PRIZNID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_ID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5')
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_SUBVID (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER, pFK_KOD IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2
         AND GET_PAC_SUB_VID_KODE (FK_PACID) = pFK_KOD;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_SVID_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER, pFK_KOD IN NUMBER, pFK_PRIZNID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2
         AND GET_PAC_SUB_VID_KODE (FK_PACID) = pFK_KOD
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_SVID_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER, pFK_KOD IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2
         AND GET_PAC_SUB_VID_KODE (FK_PACID) = pFK_KOD
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5');
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNT_VYB_SVID_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KOD2 IN NUMBER, pFK_KOD IN NUMBER, pFK_PRIZNID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c (nPryb NUMBER) IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = nPryb
         AND GET_PAC_VID_KODE (FK_PACID) = pFK_KOD2
         AND GET_PAC_SUB_VID_KODE (FK_PACID) = pFK_KOD
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5')
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID;
    i NUMBER;
    str VARCHAR2 (50);
  BEGIN
    OPEN c (3);
    FETCH c INTO i;
    CLOSE c;
    str  := i;
    OPEN c (7);
    FETCH c INTO i;
    CLOSE c;
    IF i > 0 THEN
      str  := str || ' + ' || i;
    END IF;
    RETURN str;
  END;
  FUNCTION GET_COUNTV_OPOZD (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT /*+ rule*/COUNT (DISTINCT T2.FK_PACID)
        FROM TSROKY T1, TSROKY T2
       WHERE T1.FK_PACID = T2.FK_PACID
         AND T2.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND T2.FK_PRYB = 2
         AND GET_PACOUTCOME (T2.FK_PACID) IS NOT NULL
         AND TRUNC(T1.FD_DATA1) < TRUNC(T2.FD_DATA1);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_OPOZD_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT /*+ rule*/COUNT (DISTINCT T2.FK_PACID)
        FROM TSROKY T1, TSROKY T2
       WHERE T1.FK_PACID = T2.FK_PACID
         AND T2.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND T2.FK_PRYB = 2
         AND GET_PACOUTCOME (T2.FK_PACID) IS NOT NULL
         AND TRUNC(T1.FD_DATA1) < TRUNC(T2.FD_DATA1)
         AND GET_PAC_PRIZN_KODE (T2.FK_PACID) = pFK_PRIZNID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_OPOZD_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT /*+ rule*/COUNT (DISTINCT T2.FK_PACID)
        FROM TSROKY T1, TSROKY T2
       WHERE T1.FK_PACID = T2.FK_PACID
         AND T2.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND T2.FK_PRYB = 2
         AND GET_PACOUTCOME (T2.FK_PACID) IS NOT NULL
         AND TRUNC(T1.FD_DATA1) < TRUNC(T2.FD_DATA1)
         AND GET_PACDAYSPLAN (T2.FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5');
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_OPOZD_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT /*+ rule*/COUNT (DISTINCT T2.FK_PACID)
        FROM TSROKY T1, TSROKY T2
       WHERE T1.FK_PACID = T2.FK_PACID
         AND GET_PACOUTCOME (T2.FK_PACID) IS NOT NULL
         AND T2.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND T2.FK_PRYB = 2
         AND TRUNC(T1.FD_DATA1) < TRUNC(T2.FD_DATA1)
         AND GET_PAC_PRIZN_KODE (T2.FK_PACID) = pFK_PRIZNID
         AND GET_PACDAYSPLAN (T2.FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5');
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_EARLY(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(ROWID)
        FROM TSROKY
       WHERE FK_PRYB = 3
         AND FN_KOL > 0
         AND pFD_DATAC BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_EARLY_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      SELECT COUNT(ROWID)
        FROM TSROKY
       WHERE FK_PRYB = 3
         AND FN_KOL > 0
         AND pFD_DATAC BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60);
    CURSOR cKorp IS
      SELECT COUNT(ROWID)
        FROM TSROKY
       WHERE FK_PRYB = 3
         AND FN_KOL > 0
         AND pFD_DATAC BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60)
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_EARLY (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id)
        FROM tsroky
       WHERE fk_pryb = 3
         AND fn_kol > 0
         AND fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_EARLY_TEMP(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(ROWID)
        FROM TSROKY
       WHERE FK_PRYB = 7
         AND FN_KOL > 0
         AND pFD_DATAC BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_EARLY_TEMP_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      SELECT COUNT(ROWID)
        FROM TSROKY
       WHERE FK_PRYB = 7
         AND FN_KOL > 0
         AND pFD_DATAC BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60);
    CURSOR cKorp IS
      SELECT COUNT(ROWID)
        FROM TSROKY
       WHERE FK_PRYB = 7
         AND FN_KOL > 0
         AND pFD_DATAC BETWEEN FD_DATA1 AND FD_DATA1+1-1/(24*60*60)
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_EARLY_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id)
        FROM tsroky
       WHERE fk_pryb = 3
         AND fn_kol > 0
         AND fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_EARLY_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id)
        FROM tsroky
       WHERE fk_pryb = 3
         AND fn_kol > 0
         AND fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5');
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_EARLY_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (fk_id)
        FROM tsroky
       WHERE fk_pryb = 3
         AND fn_kol > 0
         AND fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5');
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_PRODL_NAL(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(DISTINCT FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN PFD_DATAC AND PFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB=5;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_PRODL_NAL_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      SELECT COUNT(DISTINCT FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN PFD_DATAC AND PFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB=5;
    CURSOR cKorp IS
      SELECT COUNT(DISTINCT FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN PFD_DATAC AND PFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB=5
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION GET_COUNT_PRODL_OPOZD(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(DISTINCT FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN PFD_DATAC AND PFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB=6;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_PRODL_OPOZD_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      SELECT COUNT(DISTINCT FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN PFD_DATAC AND PFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB=6;
    CURSOR cKorp IS
      SELECT COUNT(DISTINCT FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN PFD_DATAC AND PFD_DATAC+1-1/(24*60*60)
         AND FK_PRYB=6
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_PRODL (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (distinct fk_pacid)
        FROM tsroky
       WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND fk_pryb IN (5,6)
         AND GET_PACOUTCOME (FK_PACID) IS NOT NULL;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_PRODL_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (distinct fk_pacid)
        FROM tsroky
       WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND fk_pryb IN (5,6)
         AND GET_PACOUTCOME (FK_PACID) IS NOT NULL
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_PRODL_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (distinct fk_pacid)
        FROM tsroky
       WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND fk_pryb IN (5,6)
         AND GET_PACOUTCOME (FK_PACID) IS NOT NULL
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5');
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_PRODL_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (distinct fk_pacid)
        FROM tsroky
       WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND fk_pryb IN (5,6)
         AND GET_PACOUTCOME (FK_PACID) IS NOT NULL
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5')
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_PRODL (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRYB IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (distinct fk_pacid)
        FROM tsroky
       WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND fk_pryb = pFK_PRYB
         AND GET_PACOUTCOME (FK_PACID) IS NOT NULL;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_PRODL_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER, pFK_PRYB IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (distinct fk_pacid)
        FROM tsroky
       WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND fk_pryb = pFK_PRYB
         AND GET_PACOUTCOME (FK_PACID) IS NOT NULL
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_PRODL_SHORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRYB IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (distinct fk_pacid)
        FROM tsroky
       WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND fk_pryb = pFK_PRYB
         AND GET_PACOUTCOME (FK_PACID) IS NOT NULL
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5');
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNTV_PRODL_SHORT_PRIZN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_PRIZNID IN NUMBER, pFK_PRYB IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (distinct fk_pacid)
        FROM tsroky
       WHERE fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND fk_pryb = pFK_PRYB
         AND GET_PACOUTCOME (FK_PACID) IS NOT NULL
         AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5')
         AND GET_PAC_PRIZN_KODE (FK_PACID) = pFK_PRIZNID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_PACID)
        FROM (SELECT FK_PACID
                FROM TSROKY
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB NOT IN (1,3,7)
               UNION
              SELECT FK_PACID
                FROM TSROKY
               WHERE TRUNC(FD_DATA1) = pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB IN (5,6));
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING2(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_PACID)
        FROM (SELECT FK_PACID
                FROM TSROKY
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB NOT IN (1,3,7)
               UNION
              SELECT FK_PACID
                FROM TSROKY
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB = 1
                 AND COUNT_SROK(FK_PACID)=1
               UNION
              SELECT FK_PACID
                FROM TSROKY
               WHERE TRUNC(FD_DATA1) = pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB IN (5,6));
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_PRIZN(pFD_DATAC IN DATE,pFK_PRIZNID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(*) as fn_count
        from (select fk_ibid, fc_fam
                from tsroky,TKARTA
               where TRUNC(fd_data1) < pFD_DATAC
                 and TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb not in (1,3,7)
                 AND TKARTA.FK_PRIZN=pFK_PRIZNID
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              select fk_ibid, fc_fam
                from tsroky,TKARTA
               where TRUNC(fd_data1) = pFD_DATAC
                 and TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb in (5,6)
                 AND TKARTA.FK_PRIZN=pFK_PRIZNID
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_SHORT(pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(*) as fn_count
        from (select fk_ibid, fc_fam
                from tsroky,TKARTA
               where TRUNC(fd_data1) < pFD_DATAC
                 and TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb not in (1,3,7)
                 AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5')
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              select fk_ibid, fc_fam
                from tsroky,TKARTA
               where TRUNC(fd_data1) = pFD_DATAC
                 and TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb in (5,6)
                 AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5')
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_SHORT_PRIZN(pFD_DATAC IN DATE,pFK_PRIZNID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      select count(*) as fn_count
        from (select fk_ibid, fc_fam
                from tsroky,TKARTA
               where TRUNC(fd_data1) < pFD_DATAC
                 and TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb not in (1,3,7)
                 AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5')
                 AND TKARTA.FK_PRIZN=pFK_PRIZNID
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              select fk_ibid, fc_fam
                from tsroky,TKARTA
               where TRUNC(fd_data1) = pFD_DATAC
                 and TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb in (5,6)
                 AND GET_PACDAYSPLAN (FK_PACID) <= PKG_SMINI.READSTRING ('CONFIG', 'SHORT_SROK', '5')
                 AND TKARTA.FK_PRIZN=pFK_PRIZNID
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_VID(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_PACID)
        FROM (SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB NOT IN (1,3,7)
                 AND TKARTA.FK_KOD2 = pFK_KOD2
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) = pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB IN (5,6)
                 AND TKARTA.FK_KOD2=pFK_KOD2
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_VID2(pFD_DATAC IN DATE,pFK_KOD2 IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_PACID)
        FROM (SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB NOT IN (1,3,7)
                 AND TKARTA.FK_KOD2 = pFK_KOD2
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB = 1
                 AND COUNT_SROK(FK_PACID)=1
                 AND TKARTA.FK_KOD2 = pFK_KOD2
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) = pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB IN (5,6)
                 AND TKARTA.FK_KOD2=pFK_KOD2
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_PALATA(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_PACID)
        FROM (SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB NOT IN (1,3,7)
                 AND GET_PALATAVID(GET_PACPALATADATE(TKARTA.FK_ID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) = pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB IN (5,6)
                 AND GET_PALATAVID(GET_PACPALATADATE(TKARTA.FK_ID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_PALATA2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_PACID)
        FROM (SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB NOT IN (1,3,7)
                 AND GET_PALATAVID(GET_PACPALATADATE(TKARTA.FK_ID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB = 1
                 AND COUNT_SROK(FK_PACID)=1
                 AND GET_PALATAVID(GET_PACPALATADATE(TKARTA.FK_ID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) = pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB IN (5,6)
                 AND GET_PALATAVID(GET_PACPALATADATE(TKARTA.FK_ID,pFD_DATAC),pFD_DATAC)=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_PUT(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_PACID)
        FROM (SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB NOT IN (1,3,7)
                 AND TKARTA.FK_PUTTYPE=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) = pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB IN (5,6)
                 AND TKARTA.FK_PUTTYPE=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_PUT2(pFD_DATAC IN DATE,pFK_TYPEID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_PACID)
        FROM (SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB NOT IN (1,3,7)
                 AND TKARTA.FK_PUTTYPE=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) < pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB = 1
                 AND COUNT_SROK(FK_PACID)=1
                 AND TKARTA.FK_PUTTYPE=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              SELECT FK_PACID
                FROM TSROKY,TKARTA
               WHERE TRUNC(FD_DATA1) = pFD_DATAC
                 AND TRUNC(FD_DATA3) >= pFD_DATAC
                 AND FK_PRYB IN (5,6)
                 AND TKARTA.FK_PUTTYPE=pFK_TYPEID
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_AGE (pFD_DATAC IN DATE, pFN_AGE IN NUMBER, pFL_GREATER IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (*) AS fn_count
        FROM (SELECT fk_ibid, fc_fam
                FROM tsroky, TKARTA
               WHERE TRUNC(fd_data1) < pFD_DATAC
                 AND TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb not in (1,3,7)
                 AND TKARTA.FK_ID = FK_PACID
                 AND GET_PACVOZR (TKARTA.FK_ID) < pFN_AGE
               UNION
              SELECT fk_ibid, fc_fam
                FROM tsroky, TKARTA
               WHERE TRUNC(fd_data1) = pFD_DATAC
                 AND TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb in (5,6)
                 AND TKARTA.FK_ID = FK_PACID
                 AND GET_PACVOZR (TKARTA.FK_ID) < pFN_AGE);
    CURSOR c1 IS
      SELECT COUNT (*) AS fn_count
        FROM (SELECT fk_ibid, fc_fam
                FROM tsroky, TKARTA
               WHERE TRUNC(fd_data1) < pFD_DATAC
                 AND TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb not in (1,3,7)
                 AND TKARTA.FK_ID = FK_PACID
                 AND GET_PACVOZR (TKARTA.FK_ID) >= pFN_AGE
               UNION
              SELECT fk_ibid, fc_fam
                FROM tsroky, TKARTA
               WHERE TRUNC(fd_data1) = pFD_DATAC
                 AND TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb in (5,6)
                 AND TKARTA.FK_ID = FK_PACID
                 AND GET_PACVOZR (TKARTA.FK_ID) >= pFN_AGE);
    i NUMBER;
  BEGIN
    IF pFL_GREATER = 1 THEN
      OPEN c1;
      FETCH c1 INTO i;
      CLOSE c1;
    ELSE
      OPEN c;
      FETCH c INTO i;
      CLOSE c;
    END IF;
    RETURN i;
  END;
  FUNCTION GET_COUNT_MORNING_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR cAll IS
      select count(*) as fn_count
        from (select fk_ibid, fc_fam
                from tsroky,TKARTA
               where fd_data1 < pFD_DATAC
                 and fd_data3 >= pFD_DATAC
                 and fk_pryb not in (1,3,7)
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              select fk_ibid, fc_fam
                from tsroky,TKARTA
               where fd_data1 = pFD_DATAC
                 and fd_data3 >= pFD_DATAC
                 and fk_pryb in (5,6)
                 AND TKARTA.FK_ID=FK_PACID);
    CURSOR cKorp IS
      select count(*) as fn_count
        from (select fk_ibid, fc_fam
                from tsroky,TKARTA
               where fd_data1 < pFD_DATAC
                 and fd_data3 >= pFD_DATAC
                 and fk_pryb not in (1,3,7)
                 AND GET_PACKORPID(FK_PACID,fd_data1) = pFK_KORPID
                 AND TKARTA.FK_ID=FK_PACID
               UNION
              select fk_ibid, fc_fam
                from tsroky,TKARTA
               where TRUNC(fd_data1) = pFD_DATAC
                 and TRUNC(fd_data3) >= pFD_DATAC
                 and fk_pryb in (5,6)
                 AND GET_PACKORPID(FK_PACID,fd_data1) = pFK_KORPID
                 AND TKARTA.FK_ID=FK_PACID);
    i NUMBER;
  BEGIN
    if pFK_KORPID > 0 then
      OPEN cKorp;
      FETCH cKorp INTO i;
      CLOSE cKorp;
    else
      OPEN cAll;
      FETCH cAll INTO i;
      CLOSE cAll;
    end if;
    RETURN i;
  END;
end PKG_R_ALLFUNC;
/

SHOW ERRORS;


