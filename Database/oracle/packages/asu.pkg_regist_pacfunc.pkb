DROP PACKAGE BODY ASU.PKG_REGIST_PACFUNC
/

--
-- PKG_REGIST_PACFUNC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_REGIST_PACFUNC"
 is-- Created by TimurLan
  function ADD_VALUE (pFC_TARGET IN VARCHAR2,pFC_VALUE IN VARCHAR2,pFC_KEYWORD IN VARCHAR)
  return VARCHAR2
   is
  begin
    IF pFC_TARGET IS NULL THEN
      return pFC_TARGET;
    ELSE
      IF pFC_KEYWORD='BEFORE' THEN
        return pFC_VALUE || pFC_TARGET;
      ELSIF pFC_KEYWORD='AFTER' THEN
        return pFC_TARGET || pFC_VALUE;
      ELSE
        return pFC_TARGET;
      END IF;
    END IF;
  end;
/*###############################################################################################*/
  function REPLACE_SPACES (pFC_VALUE IN VARCHAR2)
  return VARCHAR2
   is
    Result VARCHAR2(32767);
  begin
    Result := TRIM(' ' FROM pFC_VALUE);
    IF Result IS NULL THEN
      return Null;
    end if;
    LOOP
      EXIT WHEN INSTR (Result,'  ')=0;
      Result := REPLACE (Result,'  ',' ');
    END LOOP;
    return(Result);
  end;
/*###############################################################################################*/
/*###############################################################################################*/
  function GET_PEPL_ID(pFK_PACID IN BINARY_INTEGER/*,pFN_VALUE IN BINARY_INTEGER DEFAULT 0*/)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID
       UNION
      SELECT FK_PEPLID FROM TAMBULANCE WHERE FK_ID=pFK_PACID;
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,-1));
  end;
/*###############################################################################################*/
  function GET_PAC_IB(pFK_PACID IN BINARY_INTEGER/*,pFN_VALUE IN VARCHAR2 DEFAULT 'TKARTA'*/)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FK_IBID,FK_IBY FROM TKARTA WHERE FK_ID=pFK_PACID
       UNION
      SELECT FK_IBID,FK_IBY FROM TAMBULANCE WHERE FK_ID=pFK_PACID;
    id BINARY_INTEGER;
    y BINARY_INTEGER;
  begin
    open c;
    fetch c into id,y;
    close c;
    if (id is NULL) or (y is NULL) then
      return '';
    end if;
    return TO_CHAR(id)||'/'||TO_CHAR(y);
  end;
/*###############################################################################################*/
  function GET_PAC_IB(pFK_IBID IN BINARY_INTEGER,pFK_IBY IN BINARY_INTEGER)
  return VARCHAR2
   is
  begin
    if (pFK_IBID is NULL) or (pFK_IBY is NULL) then
      return '';
    end if;
    return TO_CHAR(pFK_IBID)||'/'||TO_CHAR(pFK_IBY);
  end;
/*###############################################################################################*/
  function GET_PAC_STATUS (pFK_PACID IN BINARY_INTEGER,pFC_VALUE1 IN VARCHAR2 DEFAULT 'На лечении',pFC_VALUE2 IN VARCHAR2 DEFAULT 'В архиве')
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT /*+ rule*/DECODE(FL_VYB, 0, pFC_VALUE1, 1, pFC_VALUE2) FROM TKARTA WHERE FK_ID=pFK_PACID
       UNION
      SELECT /*+ rule*/DECODE(FL_VYB, 0, pFC_VALUE1, 1, pFC_VALUE2) FROM TAMBULANCE WHERE FK_ID=pFK_PACID;
    Result VARCHAR2(32767);
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,'Нет данных'));
  end;
/*###############################################################################################*/
  function GET_PAC_REGSTATUS (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0,pFC_VALUE1 IN VARCHAR2 DEFAULT 'Планируется',pFC_VALUE2 IN VARCHAR2 DEFAULT 'Проживает',pFC_VALUE3 IN VARCHAR2 DEFAULT 'Выписан')
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT /*+ rule*/DECODE(FP_TEK_COC, 1, pFC_VALUE1, 2, pFC_VALUE2, 3, pFC_VALUE3) FROM TKARTA WHERE FK_ID=pFK_VARID;
    Result VARCHAR2(32767);
  begin
    if pFN_VALUE = 1 then
      open c;
      fetch c into result;
      close c;
    else
      SELECT DECODE(pFK_VARID, 1, pFC_VALUE1, 2, pFC_VALUE2, 3, pFC_VALUE3) INTO result FROM DUAL;
    end if;
    return(NVL(Result,'Нет данных'));
  end;
/*###############################################################################################*/
  function GET_PAC_VRACHID (pFK_PACID IN BINARY_INTEGER/*,pFN_VALUE IN BINARY_INTEGER DEFAULT 0*/)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT FK_VRACHID FROM TVRACH WHERE FK_PACID=pFK_PACID AND FL_VID='M'
       UNION
      SELECT FK_VRACHID FROM TAMBVRACH WHERE FK_PACID=pFK_PACID AND FL_VID='M'
       UNION
      SELECT FK_VRACHID FROM TDOC WHERE FK_ID=pFK_PACID;
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,-1));
  end;
/*###############################################################################################*/
  function GET_PAC_VRACHFIO (pFK_PACID IN BINARY_INTEGER/*,pFN_VALUE IN BINARY_INTEGER DEFAULT 0*/)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(FC_NAME), 1, '', SUBSTR (FC_NAME, 0, 1) || '. ' || DECODE (VarcharIsNUll(FC_OTCH), 1, '', SUBSTR (FC_OTCH, 0, 1) || '. '))
        FROM TSOTR
       WHERE FK_ID=(SELECT FK_VRACHID FROM TVRACH WHERE FK_PACID=pFK_PACID AND FL_VID='M')
       UNION
      SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(FC_NAME), 1, '', SUBSTR (FC_NAME, 0, 1) || '. ' || DECODE (VarcharIsNUll(FC_OTCH), 1, '', SUBSTR (FC_OTCH, 0, 1) || '. '))
        FROM TSOTR
       WHERE FK_ID=(SELECT FK_VRACHID FROM TAMBVRACH WHERE FK_PACID=pFK_PACID AND FL_VID='M')
       UNION
      SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(FC_NAME), 1, '', SUBSTR (FC_NAME, 0, 1) || '. ' || DECODE (VarcharIsNUll(FC_OTCH), 1, '', SUBSTR (FC_OTCH, 0, 1) || '. '))
        FROM TSOTR
       WHERE FK_ID=(SELECT FK_VRACHID FROM TDOC WHERE FK_ID=pFK_PACID);
    Result VARCHAR2(100);
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(REPLACE_SPACES(Result),'Не известен'));
  end;
/*###############################################################################################*/
  function GET_PAC_VRACHFULLFIO (pFK_PACID IN BINARY_INTEGER/*,pFN_VALUE IN BINARY_INTEGER DEFAULT 0*/)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_FAM || ' ' || FC_NAME || ' ' || FC_OTCH
        FROM TSOTR
       WHERE FK_ID=(SELECT FK_VRACHID FROM TVRACH WHERE FK_PACID=pFK_PACID AND FL_VID='M')
       UNION
      SELECT FC_FAM || ' ' || FC_NAME || ' ' || FC_OTCH
        FROM TSOTR
       WHERE FK_ID=(SELECT FK_VRACHID FROM TAMBVRACH WHERE FK_PACID=pFK_PACID AND FL_VID='M');
    Result VARCHAR2(100);
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(REPLACE_SPACES(Result),'Не известен'));
  end;
/*###############################################################################################*/
  function GET_PAC_PUTINCOME (pFK_PACID IN BINARY_INTEGER)
  return DATE
   is
    CURSOR c
     IS
      SELECT FD_DATA1 FROM TSROKY WHERE FK_PACID=pFK_PACID AND FK_PRYB=1;
    Result DATE;
  begin
    open c;
    fetch c into result;
    close c;
    return(Result);
  end;
/*###############################################################################################*/
  function GET_PAC_PUTOUTCOME (pFK_PACID IN BINARY_INTEGER)
  return DATE
   is
    CURSOR c
     IS
      SELECT FD_DATA2 FROM TSROKY WHERE FK_PACID=pFK_PACID AND FK_PRYB=1;
    Result DATE;
  begin
    open c;
    fetch c into result;
    close c;
    return(Result);
  end;
/*###############################################################################################*/
  function GET_PAC_PUTDAYS (pFK_PACID IN BINARY_INTEGER)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT FN_KOL FROM TSROKY WHERE FK_PACID=pFK_PACID AND FK_PRYB=1;
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(nvl(Result,0));
  end;
/*###############################################################################################*/
  function GET_PAC_PUTSROKY (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT 'с '|| TO_CHAR(FD_DATA1,'DD.MM.YYYY HH24:MI') ||' по '|| TO_CHAR(FD_DATA2,'DD.MM.YYYY HH24:MI')
        FROM TSROKY
       WHERE FK_PACID=pFK_PACID AND FK_PRYB=1;
    Result VARCHAR2(100);
  begin
    open c;
    fetch c into result;
    close c;
    return(Result);
  end;
/*###############################################################################################*/
  function GET_PAC_INCOME (pFK_PACID IN BINARY_INTEGER)
  return DATE
   is
    CURSOR c
     IS
      SELECT FD_DATA1 FROM TSROKY WHERE FK_PACID=pFK_PACID AND FK_PRYB=2;
    Result DATE;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,GET_PAC_PLANINCOME(pFK_PACID)));
  end;
/*###############################################################################################*/
  function GET_PAC_OUTCOME (pFK_PACID IN BINARY_INTEGER)
  return DATE
   is
    CURSOR c
     IS
      SELECT FD_DATA1
        FROM TSROKY,(SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=pFK_PACID)
       WHERE FK_ID=FK_MAXID AND FK_PRYB IN (3,7);
    Result DATE;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,GET_PAC_PLANOUTCOME(pFK_PACID)));
  end;
/*###############################################################################################*/
  function GET_PAC_OUTCOME_REAL (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FD_DATA1
        FROM TSROKY,(SELECT MAX(FK_ID) FK_MAXID FROM TSROKY WHERE FK_PACID=pFK_PACID)
       WHERE FK_ID=FK_MAXID AND FK_PRYB IN (3,7);
    Result DATE;
  begin
    open c;
    fetch c into result;
    close c;
    return(TO_CHAR(TRUNC(Result), 'dd.mm.yyyy'));
  end;  
/*###############################################################################################*/
  function GET_PAC_DAYS (pFK_PACID IN BINARY_INTEGER)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT DECODE(SUM(FN_DAYS),0,1,SUM(FN_DAYS))--TimurLan SELECT SUM(FN_DAYS)
        FROM (SELECT FK_ID,TRUNC(FD_DATA3)-TRUNC(FD_DATA1)/*TimurLan +1*/ FN_DAYS
                FROM TSROKY
               --WHERE FK_PACID=pFK_PACID AND FK_PRYB not in (1,3,7) AND FD_DATA3<=FD_DATA2
               WHERE FK_PACID=pFK_PACID AND FK_PRYB not in (1,3,7) AND FD_DATA3<=FD_DATA2 AND FD_DATA3>FD_DATA1 -- исправлено by Timurlan 27.06.2005
               UNION
              SELECT FK_ID,TRUNC(FD_DATA2)-TRUNC(FD_DATA1)/*TimurLan +1*/ FN_DAYS
                FROM TSROKY
               WHERE FK_PACID=pFK_PACID AND FK_PRYB not in (1,3,7) AND FD_DATA3>FD_DATA2);
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,GET_PAC_PUTDAYS(pFK_PACID)));
  end;
/*###############################################################################################*/
  function GET_PAC_DAYS_TODATE (pFK_PACID IN BINARY_INTEGER, pFD_DATE IN DATE DEFAULT SYSDATE)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT DECODE(SUM(FN_DAYS),0,1,SUM(FN_DAYS))
        FROM (SELECT FK_ID,TRUNC(FD_DATA3)-TRUNC(FD_DATA1) FN_DAYS
                FROM TSROKY
               WHERE FK_PACID=pFK_PACID AND FK_PRYB not in (1,3,7) AND FD_DATA3<=FD_DATA2 AND FD_DATA3>FD_DATA1
                 AND FD_DATA3 <= pFD_DATE
               UNION
              SELECT FK_ID,TRUNC(pFD_DATE)-TRUNC(FD_DATA1) FN_DAYS
                FROM TSROKY
               WHERE FK_PACID=pFK_PACID AND FK_PRYB not in (1,3,7) AND pFD_DATE < FD_DATA2);
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(Result);
  end;
/*###############################################################################################*/
  function GET_PAC_SROKY (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    Date1 DATE;
    Date2 DATE;
  begin
    Date1:=GET_PAC_INCOME(pFK_PACID);
    Date2:=GET_PAC_OUTCOME(pFK_PACID);
    if (Date1 is NULL) or (Date2 is NULL) then
      return '';
    end if;
    return('с '|| TO_CHAR(Date1,'DD.MM.YYYY HH24:MI') ||' по '|| TO_CHAR(Date2,'DD.MM.YYYY HH24:MI'));
  end;
/*###############################################################################################*/
  function GET_PAC_PLANINCOME (pFK_PACID IN BINARY_INTEGER)
  return DATE
   is
    CURSOR c
     IS
      SELECT FD_DATA1 FROM TSROKY WHERE FK_PACID=pFK_PACID AND FK_PRYB=1;
    Result DATE;
  begin
    open c;
    fetch c into result;
    close c;
    return(Result);
  end;
/*###############################################################################################*/
  function GET_PAC_PLANOUTCOME (pFK_PACID IN BINARY_INTEGER)
  return DATE
   is
    CURSOR c
     IS
      SELECT FD_DATA2
        FROM TPERESEL,(SELECT MAX(FK_ID) FK_MAXID FROM TPERESEL WHERE FK_PACID=pFK_PACID)
       WHERE FK_ID=FK_MAXID;
    Result DATE;
  begin
    open c;
    fetch c into result;
    close c;
    return(Result);
  end;
/*###############################################################################################*/
  function GET_PAC_PLANDAYS (pFK_PACID IN BINARY_INTEGER)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT FN_KOL FROM TSROKY WHERE FK_PACID=pFK_PACID AND FK_PRYB=2;
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(Result);
  end;
/*###############################################################################################*/
  function GET_PAC_PALATAID (pFK_PACID IN BINARY_INTEGER)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT FK_PALATAID
        FROM TPERESEL,(SELECT MAX(FK_ID) FK_MAXID FROM TPERESEL WHERE FK_PACID=pFK_PACID)
       WHERE FK_ID=FK_MAXID;
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,-1));
  end;
/*###############################################################################################*/
  function GET_PAC_FCPALATA (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_PALATA
        FROM TROOM
       WHERE FK_ID=(SELECT FK_PALATAID
                      FROM TPERESEL,(SELECT MAX(FK_ID) FK_MAXID FROM TPERESEL WHERE FK_PACID=pFK_PACID)
                     WHERE FK_ID=FK_MAXID);
    Result VARCHAR2(10);
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,'Не выбрана'));
  end;
/*###############################################################################################*/
  function GET_PAC_KORPID (pFK_PACID IN BINARY_INTEGER)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT FK_KORPID
        FROM TROOM
       WHERE FK_ID=(SELECT FK_PALATAID
                      FROM TPERESEL,(SELECT MAX(FK_ID) FK_MAXID FROM TPERESEL WHERE FK_PACID=pFK_PACID)
                     WHERE FK_ID=FK_MAXID);
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,-1));
  end;
/*###############################################################################################*/
  function GET_PAC_FCKORP (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TKORP,TROOM
       WHERE TKORP.FK_ID=TROOM.FK_KORPID
         AND TROOM.FK_ID=(SELECT FK_PALATAID
                            FROM TPERESEL,(SELECT MAX(FK_ID) FK_MAXID FROM TPERESEL WHERE FK_PACID=pFK_PACID)
                           WHERE FK_ID=FK_MAXID);
    Result VARCHAR2(40);
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,'Не выбран'));
  end;
/*###############################################################################################*/
  function GET_PAC_OTDELID (pFK_PACID IN BINARY_INTEGER)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT FK_OTDELID
        FROM TROOM
       WHERE FK_ID=(SELECT FK_PALATAID
                      FROM TPERESEL,(SELECT MAX(FK_ID) FK_MAXID FROM TPERESEL WHERE FK_PACID=pFK_PACID)
                     WHERE FK_ID=FK_MAXID);
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,-1));
  end;
/*###############################################################################################*/
  function GET_PAC_FCOTDEL (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TOTDEL,TROOM
       WHERE TOTDEL.FK_ID=TROOM.FK_OTDELID
         AND TROOM.FK_ID=(SELECT FK_PALATAID
                            FROM TPERESEL,(SELECT MAX(FK_ID) FK_MAXID FROM TPERESEL WHERE FK_PACID=pFK_PACID)
                           WHERE FK_ID=FK_MAXID);
    Result TOTDEL.FC_NAME%TYPE;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,'Нет данных'));
  end;
/*###############################################################################################*/
  function GET_PAC_PALATAVIDID (pFK_PACID IN BINARY_INTEGER)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT /*+ rule*/FK_VIDID
        FROM TSRTIPROOM
       WHERE FK_PALATAID=GET_PAC_PALATAID (pFK_PACID)
         AND TRUNC(SYSDATE)>=FD_DATA1
         AND (TRUNC(SYSDATE)<=FD_DATA2 OR FD_DATA2 IS NULL);
/*      SELECT TSRTIPROOM.FK_VIDID
        FROM TPERESEL,TSRTIPROOM
       WHERE TPERESEL.FK_PACID=pFK_PACID
         AND TSRTIPROOM.FK_PALATAID=TPERESEL.FK_PALATAID;*/
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,-1));
  end;
/*###############################################################################################*/
  function GET_PAC_FCPALATAVID (pFK_PACID IN BINARY_INTEGER)
  return Varchar2
   is
    CURSOR c
     IS
      SELECT /*+ rule*/FC_VID
        FROM TTIPROOM
       WHERE FK_ID=(SELECT FK_VIDID
                      FROM TSRTIPROOM
                     WHERE FK_PALATAID=GET_PAC_PALATAID (pFK_PACID)
                       AND TRUNC(SYSDATE)>=FD_DATA1
                       AND (TRUNC(SYSDATE)<=FD_DATA2 OR FD_DATA2 IS NULL));
/*      SELECT TTIPROOM.FC_VID
        FROM TPERESEL,TTIPROOM,TSRTIPROOM
       WHERE TPERESEL.FK_PACID=pFK_PACID
         AND TSRTIPROOM.FK_PALATAID=TPERESEL.FK_PALATAID
         AND TSRTIPROOM.FK_VIDID=TTIPROOM.FK_ID;*/
    Result VARCHAR2(1000);
  begin
    open c;
    fetch c into result;
    close c;
    return(NVL(Result,'Не выбран'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCVID (pFK_VARID IN BINARY_INTEGER,pFC_VALUE IN VARCHAR2,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR cFull(pFK_VARID IN BINARY_INTEGER)
     IS
      SELECT FC_VID
        FROM TVID
       WHERE FK_ID=pFK_VARID;
    CURSOR cShort(pFK_VARID IN BINARY_INTEGER)
     IS
      SELECT FC_NAME
        FROM TVID
       WHERE FK_ID=pFK_VARID;
    Result VARCHAR2(32767);
    nTemp  BINARY_INTEGER;
  begin
    if pFN_VALUE=1 then
      if pFC_VALUE='FULL' then
        open cFull(pFK_VARID);
        fetch cFull into result;
        close cFull;
      elsif pFC_VALUE='SHORT' then
        open cShort(pFK_VARID);
        fetch cShort into result;
        close cShort;
      end if;
    else
      SELECT NVL(FK_KOD2,-1) into nTemp FROM TKARTA WHERE FK_ID=pFK_VARID;
      if pFC_VALUE='FULL' then
        open cFull(nTemp);
        fetch cFull into result;
        close cFull;
      elsif pFC_VALUE='SHORT' then
        open cShort(nTemp);
        fetch cShort into result;
        close cShort;
      end if;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCSUBVID (pFK_VARID IN BINARY_INTEGER,pFC_VALUE IN VARCHAR2,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR cFull(pFK_VARID IN BINARY_INTEGER)
     IS
      SELECT TPISMA.FK_NAME_PIS||' '||TCOMPANY.FC_NAME FC_VALUE
        FROM TPISMA,TCOMPANY
       WHERE TPISMA.FK_ID=pFK_VARID
         AND TCOMPANY.FK_ID=TPISMA.FK_PREDID
       UNION
      SELECT TDOGOVOR.FK_NAME_DOG||' '||TCOMPANY.FC_NAME FC_VALUE
        FROM TDOGOVOR,TCOMPANY
       WHERE TDOGOVOR.FK_ID=pFK_VARID
         AND TCOMPANY.FK_ID=TDOGOVOR.FK_PREDID
       UNION
      SELECT TSUBVID.FC_NAME FC_VALUE
        FROM TSUBVID
       WHERE TSUBVID.FK_ID=pFK_VARID;
    CURSOR cShort(pFK_VARID IN BINARY_INTEGER)
     IS
      SELECT TPISMA.FK_NAME_PIS||' '||TCOMPANY.FC_SHORT FC_VALUE
        FROM TPISMA,TCOMPANY
       WHERE TPISMA.FK_ID=pFK_VARID
         AND TCOMPANY.FK_ID=TPISMA.FK_PREDID
       UNION
      SELECT TDOGOVOR.FK_NAME_DOG||' '||TCOMPANY.FC_SHORT FC_VALUE
        FROM TDOGOVOR,TCOMPANY
       WHERE TDOGOVOR.FK_ID=pFK_VARID
         AND TCOMPANY.FK_ID=TDOGOVOR.FK_PREDID
       UNION
      SELECT TSUBVID.FC_SHORT FC_VALUE
        FROM TSUBVID
       WHERE TSUBVID.FK_ID=pFK_VARID;
    Result VARCHAR2(32767);
    nTemp  BINARY_INTEGER;
  begin
    if pFN_VALUE=1 then
      if pFC_VALUE='FULL' then
        open cFull(pFK_VARID);
        fetch cFull into result;
        close cFull;
      elsif pFC_VALUE='SHORT' then
        open cShort(pFK_VARID);
        fetch cShort into result;
        close cShort;
      end if;
    else
      SELECT NVL(FK_KOD,-1) into nTemp FROM TKARTA WHERE FK_ID=pFK_VARID;
      if pFC_VALUE='FULL' then
        open cFull(nTemp);
        fetch cFull into result;
        close cFull;
      elsif pFC_VALUE='SHORT' then
        open cShort(nTemp);
        fetch cShort into result;
        close cShort;
      end if;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCALLVID (pFK_VARID1 IN BINARY_INTEGER,pFC_VALUE IN VARCHAR2,pFK_VARID2 IN BINARY_INTEGER DEFAULT NULL,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR cPismaFull(pFK_VARID2 IN BINARY_INTEGER)
     IS
      SELECT TPISMA.FK_NAME_PIS||' '||TCOMPANY.FC_NAME
        FROM TPISMA,TCOMPANY
       WHERE TPISMA.FK_ID=pFK_VARID2
         AND TCOMPANY.FK_ID=TPISMA.FK_PREDID;
    CURSOR cPismaShort(pFK_VARID2 IN BINARY_INTEGER)
     IS
      SELECT TPISMA.FK_NAME_PIS||' '||TCOMPANY.FC_SHORT
        FROM TPISMA,TCOMPANY
       WHERE TPISMA.FK_ID=pFK_VARID2
         AND TCOMPANY.FK_ID=TPISMA.FK_PREDID;
    CURSOR cDogFull(pFK_VARID2 IN BINARY_INTEGER)
     IS
      SELECT TDOGOVOR.FK_NAME_DOG||' '||TCOMPANY.FC_NAME
        FROM TDOGOVOR,TCOMPANY
       WHERE TDOGOVOR.FK_ID=pFK_VARID2
         AND TCOMPANY.FK_ID=TDOGOVOR.FK_PREDID;
    CURSOR cDogShort(pFK_VARID2 IN BINARY_INTEGER)
     IS
      SELECT TDOGOVOR.FK_NAME_DOG||' '||TCOMPANY.FC_SHORT
        FROM TDOGOVOR,TCOMPANY
       WHERE TDOGOVOR.FK_ID=pFK_VARID2
         AND TCOMPANY.FK_ID=TDOGOVOR.FK_PREDID;
    CURSOR cOtherFull(pFK_VARID1 IN BINARY_INTEGER,pFK_VARID2 IN BINARY_INTEGER)
     IS
      SELECT TVID.FC_VID||' '||TSUBVID.FC_NAME
        FROM TVID,TSUBVID
       WHERE TVID.FK_ID=pFK_VARID1
         AND TSUBVID.FK_VIDID = pFK_VARID1
         AND TSUBVID.FK_ID=pFK_VARID2;
    CURSOR cOtherShort(pFK_VARID1 IN BINARY_INTEGER,pFK_VARID2 IN BINARY_INTEGER)
     IS
      SELECT TVID.FC_NAME||' '||TSUBVID.FC_SHORT
        FROM TVID,TSUBVID
       WHERE TVID.FK_ID=pFK_VARID1
         AND TSUBVID.FK_VIDID = pFK_VARID1
         AND TSUBVID.FK_ID=pFK_VARID2;
    Result VARCHAR2(32767);
    nTemp1 BINARY_INTEGER;
    nTemp2 BINARY_INTEGER;
  begin
    if pFN_VALUE=1 then
      if pFK_VARID1=1 then
        if pFC_VALUE='FULL' then
          open cPismaFull(pFK_VARID2);
          fetch cPismaFull into result;
          close cPismaFull;
        elsif pFC_VALUE='SHORT' then
          open cPismaShort(pFK_VARID2);
          fetch cPismaShort into result;
          close cPismaShort;
        end if;
        result:='Письмо №'||result;
      elsif pFK_VARID1=2 then
        if pFC_VALUE='FULL' then
          open cDogFull(pFK_VARID2);
          fetch cDogFull into result;
          close cDogFull;
        elsif pFC_VALUE='SHORT' then
          open cDogShort(pFK_VARID2);
          fetch cDogShort into result;
          close cDogShort;
        end if;
        result:='Договор №'||result;
      else
        if pFC_VALUE='FULL' then
          open cOtherFull(pFK_VARID1,pFK_VARID2);
          fetch cOtherFull into result;
          close cOtherFull;
        elsif pFC_VALUE='SHORT' then
          open cOtherShort(pFK_VARID1,pFK_VARID2);
          fetch cOtherShort into result;
          close cOtherShort;
        end if;
        if result is null then
          result:=PKG_REGIST_PACFUNC.GET_PAC_FCVID (pFK_VARID1,pFC_VALUE,1);
        end if;
      end if;
    else
      SELECT NVL(FK_KOD2,-1),NVL(FK_KOD,-1) into nTemp1,nTemp2 FROM TKARTA WHERE FK_ID=pFK_VARID1;
      if nTemp1=1 then
        if pFC_VALUE='FULL' then
          open cPismaFull(nTemp2);
          fetch cPismaFull into result;
          close cPismaFull;
        elsif pFC_VALUE='SHORT' then
          open cPismaShort(nTemp2);
          fetch cPismaShort into result;
          close cPismaShort;
        end if;
        result:='Письмо №'||result;
      elsif nTemp1=2 then
        if pFC_VALUE='FULL' then
          open cDogFull(nTemp2);
          fetch cDogFull into result;
          close cDogFull;
        elsif pFC_VALUE='SHORT' then
          open cDogShort(nTemp2);
          fetch cDogShort into result;
          close cDogShort;
        end if;
        result:='Договор №'||result;
      else
        if pFC_VALUE='FULL' then
          open cOtherFull(nTemp1,nTemp2);
          fetch cOtherFull into result;
          close cOtherFull;
        elsif pFC_VALUE='SHORT' then
          open cOtherShort(nTemp1,nTemp2);
          fetch cOtherShort into result;
          close cOtherShort;
        end if;
        if result is null then
          result:=PKG_REGIST_PACFUNC.GET_PAC_FCVID (nTemp1,pFC_VALUE,1);
        end if;
      end if;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCPUTVID (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_VID
        FROM TTIPROOM
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_VID
        FROM TTIPROOM
       WHERE FK_ID=(SELECT FK_PUTTYPE
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCPRIZN (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TPRIZN
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_NAME
        FROM TPRIZN
       WHERE FK_ID=(SELECT FK_PRIZN
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCSOCPOL (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TCOC_POL
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_NAME
        FROM TCOC_POL
       WHERE FK_ID=(SELECT FK_COC_POLID
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCGROUP (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TGROUP
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_NAME
        FROM TGROUP
       WHERE FK_ID=(SELECT FK_GROUPID
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCPACVID (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TPACVID
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_NAME
        FROM TPACVID
       WHERE FK_ID=(SELECT FK_PACVID
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCSTOL (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TSTOL
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_NAME
        FROM TSTOL
       WHERE FK_ID=(SELECT FK_STOLID
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCFINVID (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TFINVID
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_NAME
        FROM TFINVID
       WHERE FK_ID=(SELECT FK_FINVIDID
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCUSLVID (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_NAME
        FROM TUSLVID
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_NAME
        FROM TUSLVID
       WHERE FK_ID=(SELECT FK_USLVIDID
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FCUSLVIDSHORT (pFK_VARID IN BINARY_INTEGER,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_SHORT
        FROM TUSLVID
       WHERE FK_ID=pFK_VARID;
    CURSOR c1
     IS
      SELECT FC_SHORT
        FROM TUSLVID
       WHERE FK_ID=(SELECT FK_USLVIDID
                      FROM TKARTA
                     WHERE FK_ID=pFK_VARID);
    Result VARCHAR2(100);
  begin
    if pFN_VALUE=1 then
      open c1;
      fetch c1 into result;
      close c1;
    else
      open c;
      fetch c into result;
      close c;
    end if;
    return(NVL(Result,'Не определено'));
  end;
/*###############################################################################################*/
  function GET_PAC_FLKUR_HRAP (pFK_PACID IN BINARY_INTEGER,pFC_VALUE IN VARCHAR2)
  return BINARY_INTEGER
   is
    CURSOR cKur
     IS
      SELECT FP_KUR
        FROM TANAMNEZ
       WHERE FK_PACID=pFK_PACID;
    CURSOR cHrap
     IS
      SELECT FL_HRAP
        FROM TANAMNEZ
       WHERE FK_PACID=pFK_PACID;
    Result BINARY_INTEGER;
  begin
    if UPPER(pFC_VALUE)='FP_KUR' then
      open cKur;
      fetch cKur into result;
      close cKur;
    elsif UPPER(pFC_VALUE)='FL_HRAP' then
      open cHrap;
      fetch cHrap into result;
      close cHrap;
    end if;
    return(NVL(Result,-1));
  end;
/*###############################################################################################*/
  function GET_PAC_FCKUR_HRAP (pFK_PACID IN BINARY_INTEGER,pFC_VALUE IN VARCHAR2)
  return VARCHAR2
   is
    CURSOR cKur
     IS
      SELECT FP_KUR
        FROM TANAMNEZ
       WHERE FK_PACID=pFK_PACID;
    CURSOR cHrap
     IS
      SELECT FL_HRAP
        FROM TANAMNEZ
       WHERE FK_PACID=pFK_PACID;
    Result BINARY_INTEGER;
  begin
    if UPPER(pFC_VALUE)='FP_KUR' then
      open cKur;
      fetch cKur into result;
      close cKur;
      if result=1 then
        return ('Курит');
      end if;
    elsif UPPER(pFC_VALUE)='FL_HRAP' then
      open cHrap;
      fetch cHrap into result;
      close cHrap;
      if result=1 then
        return ('Храпит');
      end if;
    end if;
    return('');
  end;
/*###############################################################################################*/
  function GET_PAC_FCBOOLEAN (pFK_VARID IN BINARY_INTEGER,pFC_VALUE IN VARCHAR2,pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
  return VARCHAR2
   is
    TYPE RefCurType IS REF CURSOR;
    cRef RefCurType;
    Result BINARY_INTEGER;
  begin
    if pFN_VALUE=1 then
      open cRef for 'SELECT '||UPPER(pFC_VALUE)||' FROM TKARTA WHERE FK_ID='||TO_CHAR(pFK_VARID);
      fetch cRef into Result;
      close cRef;
    else
      Result:=pFK_VARID;
    end if;

    if Result=1 then
      if UPPER(pFC_VALUE)='FL_VOV' then
        return('Участник ВОВ');
      elsif UPPER(pFC_VALUE)='FL_IVOV' then
        return('Инвалид ВОВ');
      elsif UPPER(pFC_VALUE)='FL_ULA' then
        return('Участник ЛА');
      elsif UPPER(pFC_VALUE)='FL_PMC' then
        return('Работник ПМЦ');
      elsif UPPER(pFC_VALUE)='FL_SKK' then
        return('Имеет СКК');
      elsif UPPER(pFC_VALUE)='FL_SEO' then
        return('Имеет СЭО');
      elsif UPPER(pFC_VALUE)='FL_PRIVIT' then
        return('Прививки сделаны');
      end if;
    end if;

    return('');
  end;
/*###############################################################################################*/
/*###############################################################################################*/
  function GET_PAC_FIO (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(FC_IM), 1, '', SUBSTR (FC_IM, 0, 1) || '. ' || DECODE (VarcharIsNUll(FC_OTCH), 1, '', SUBSTR (FC_OTCH, 0, 1) || '. '))
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    Result VARCHAR2(100);
  begin
    open c;
    fetch c into Result;
    close c;
    return(REPLACE_SPACES(Result));
  end;
/*###############################################################################################*/
  function GET_PAC_FULLFIO (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT FC_FAM || ' ' || FC_IM || ' ' || FC_OTCH
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    Result VARCHAR2(100);
  begin
    open c;
    fetch c into Result;
    close c;
    return(REPLACE_SPACES(Result));
  end;
/*###############################################################################################*/
  function GET_PAC_ADRID (pFK_PACID IN BINARY_INTEGER, pFK_TYPE IN BINARY_INTEGER DEFAULT -1, pFK_PEPLID in number default -1)
  return BINARY_INTEGER
  /*
   Edited by Spasskiy S.N. 06102008
   Добавлен параметр указание типа адреса tadrtype.fk_id
  */
   is
    CURSOR c
     IS
      SELECT FK_ID,FK_TYPE FROM TADRESS
       WHERE FK_PACID=GET_PEPL_ID(pFK_PACID)
    ORDER BY FK_ID DESC;
       --WHERE FK_PACID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    CURSOR cMin
     IS
      SELECT MIN(FK_ID) FROM TADRESS
       WHERE FK_PACID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_PACID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    nTemp BINARY_INTEGER;
    Result BINARY_INTEGER;
  begin
    IF pFK_TYPE = -1 THEN
     SELECT FK_ID INTO NTEMP FROM TADRTYPE WHERE FL_DEFAULT=1;
    ELSE
     nTemp := pFK_TYPE;
    END IF;
   /*
     Edited by Kashira O.A. 01032011
     Исправил логику определения адреса по типу
     Если адрес с указанным типом (или типом по-умолчанию не найден) то выбирае самый первый адрес пациента если таковой есть.
    */
    FOR p IN c LOOP
      IF p.FK_TYPE=nTemp THEN
        RETURN (p.FK_ID);
      END IF;
    END LOOP;

    IF pFK_TYPE = -1 THEN
      OPEN cMin;
      FETCH cMin INTO RESULT;
      CLOSE cMin;
    END IF;
    RETURN(RESULT);
  end;
/*###############################################################################################*/
  function GET_PAC_ADRSHORT (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c(pFK_ADRID IN NUMBER)
     IS
      SELECT /*+ rule*/GET_COUNTRY(FK_COUNTRYID)||' '||GET_REGION(FK_REGIONID)||' '||GET_TOWN(FK_TOWNID)||' '||FC_ADR
        FROM TADRESS
       WHERE FK_ID=pFK_ADRID;--GET_PAC_ADRID(pFK_PACID);
    Result VARCHAR2(255);
  begin
    open c(GET_PAC_ADRID(pFK_PACID));
    fetch c into Result;
    close c;
    return(REPLACE_SPACES(Result));
  end;
/*###############################################################################################*/
  FUNCTION GET_PAC_ADRFULL(pFK_PACID IN BINARY_INTEGER,
                           pFK_TYPE  IN BINARY_INTEGER DEFAULT -1)
    RETURN VARCHAR2 IS
    /*
    Edited by Spasskiy S.N. 06102008
    Использование КЛАДР
    */
    CURSOR c(pFK_ADRID IN NUMBER) IS
    --SELECT ASU.GET_ADDR_STR_BY_ID(pFK_ADRID) FROM DUAL;
      SELECT /*+ rule*/
       GET_COUNTRY(FK_COUNTRYID) || ' ' || GET_REGION(FK_REGIONID) || ' ' ||
       GET_RAION(FK_RAIONID) || ' ' || GET_TOWN(FK_TOWNID) || ' ' ||
       GET_INTOWN(FK_INTOWNID) || ' ' || GET_STREET(FK_STREETID) || ' ' ||
       FC_HOUSE || ' ' || ADD_VALUE(FC_KORPUS, 'КОРП.', 'BEFORE') || ' ' ||
       ADD_VALUE(FC_KVARTIRA, 'КВ.', 'BEFORE') fc_adr,
       fk_kladr,
       CASE WHEN fk_kladr > 0 THEN 'РОССИЙСКАЯ ФЕДЕРАЦИЯ, ' || ASU.GET_ADDR_STR_BY_ID(pFK_ADRID) END AS FC_KLADDR
        FROM TADRESS
       WHERE FK_ID = pFK_ADRID; --GET_PAC_ADRID(pFK_PACID);
       
       

    RESULT VARCHAR2(255);
  BEGIN
    /* open c(GET_PAC_ADRID(pFK_PACID, pFK_TYPE));
    fetch c into Result;
    close c;
    */
    FOR adr IN c(GET_PAC_ADRID(pFK_PACID, pFK_TYPE)) LOOP
      IF adr.fk_kladr > 0 THEN
        RESULT := adr.fc_kladdr;
      ELSE
        RESULT := adr.fc_adr;
      END IF;
    END LOOP;
    
    IF REPLACE_SPACES(Result) IS NULL
    THEN
      RESULT := ASU.GET_ADDR_STR_BY_ID(GET_PAC_ADRID(pFK_PACID, pFK_TYPE));     
    END IF;        

    RETURN(REPLACE_SPACES(RESULT));
  END;
/*###############################################################################################*/
  function GET_PAC_ADRFULL2 (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    AA VARCHAR2(255);
    A1 VARCHAR(255);
    A2 VARCHAR(255);
    A3 VARCHAR(255);
    A4 VARCHAR(255);
    A5 VARCHAR(255);
    A6 VARCHAR(255);
    A7 VARCHAR(255);
    A8 VARCHAR(255);
    A9 VARCHAR(255);
  begin
    A1:='';
    A2:='';
    A3:='';
    A4:='';
    A5:='';
    A6:='';
    A7:='';
    A8:='';
    A9:='';
    AA:='';

    SELECT /*+ rule*/
        GET_COUNTRY(FK_COUNTRYID),
        GET_REGION(FK_REGIONID),
        GET_RAION(FK_RAIONID),
        GET_TOWN(FK_TOWNID),
        GET_INTOWN(FK_INTOWNID),
        GET_STREET(FK_STREETID),
        FC_HOUSE,
        FC_KORPUS,
        FC_KVARTIRA
      INTO
        A1,A2,A3,A4,A5,A6,A7,A8,A9
      FROM TADRESS
      WHERE FK_ID=GET_PAC_ADRID(pFK_PACID);

--      AA:=A1||' '||A2||' '||A3||' '||A4||' '||A5||' '||A6||' '||A7||' '||A8||' '||A9;
      IF (LENGTH(A1)>0) THEN AA:=AA||A1||', ';
      END IF;
      IF (LENGTH(A2)>0) THEN AA:=AA||A2||', ';
      END IF;
      IF (LENGTH(A3)>0) THEN AA:=AA||A3||', ';
      END IF;
      IF (LENGTH(A4)>0) THEN AA:=AA||A4||', ';
      END IF;
      IF (LENGTH(A5)>0) THEN AA:=AA||A5||', ';
      END IF;
      IF (LENGTH(A6)>0) THEN AA:=AA||A6||', ';
      END IF;
      IF (LENGTH(A7)>0) THEN AA:=AA||A7||', ';
      END IF;
      IF (LENGTH(A8)>0) THEN AA:=AA||'КОРП.'||A8||', ';
      END IF;
      IF (LENGTH(A9)>0) THEN AA:=AA||'КВ.'||A9||',';
      END IF;

      AA:=TRIM(AA);
      IF (SUBSTR(AA,LENGTH(AA),1)=',') THEN AA:=SUBSTR(AA,1,LENGTH(AA)-1);
      END IF;

    return(REPLACE_SPACES(AA));
  end;
 -------------------------------------------------------------------------------
 -- Адрес без страны и региона на основе GET_PAC_ADRFULL2
 -- Author: Zhukov
FUNCTION GET_PAC_ADRFULL_NOREGION (pfk_pacid IN BINARY_INTEGER)
   RETURN VARCHAR2
IS
   aa   VARCHAR2 (255);
   a1   VARCHAR (255);
   a2   VARCHAR (255);
   a3   VARCHAR (255);
   a4   VARCHAR (255);
   a5   VARCHAR (255);
   a6   VARCHAR (255);
   a7   VARCHAR (255);
   a8   VARCHAR (255);
   a9   VARCHAR (255);
BEGIN
   a1 := '';
   a2 := '';
   a3 := '';
   a4 := '';
   a5 := '';
   a6 := '';
   a7 := '';
   a8 := '';
   a9 := '';
   aa := '';

   SELECT get_raion (fk_raionid), get_town (fk_townid), get_intown (fk_intownid),
          get_street (fk_streetid), fc_house, fc_korpus, fc_kvartira
     INTO a3, a4, a5,
          a6, a7, a8, a9
     FROM tadress
    WHERE fk_id = get_pac_adrid (pfk_pacid);

--      AA:=A1||' '||A2||' '||A3||' '||A4||' '||A5||' '||A6||' '||A7||' '||A8||' '||A9;
   IF (LENGTH (a1) > 0)
   THEN
      aa := aa || a1 || ', ';
   END IF;

   IF (LENGTH (a2) > 0)
   THEN
      aa := aa || a2 || ', ';
   END IF;

   IF (LENGTH (a3) > 0)
   THEN
      aa := aa || a3 || ', ';
   END IF;

   IF (LENGTH (a4) > 0)
   THEN
      aa := aa || a4 || ', ';
   END IF;

   IF (LENGTH (a5) > 0)
   THEN
      aa := aa || a5 || ', ';
   END IF;

   IF (LENGTH (a6) > 0)
   THEN
      aa := aa || a6 || ', ';
   END IF;

   IF (LENGTH (a7) > 0)
   THEN
      aa := aa || a7 || ', ';
   END IF;

   IF (LENGTH (a8) > 0)
   THEN
      aa := aa || 'КОРП.' || a8 || ', ';
   END IF;

   IF (LENGTH (a9) > 0)
   THEN
      aa := aa || 'КВ.' || a9 || ',';
   END IF;

   aa := TRIM (aa);

   IF (SUBSTR (aa, LENGTH (aa), 1) = ',')
   THEN
      aa := SUBSTR (aa, 1, LENGTH (aa) - 1);
   END IF;

   RETURN (replace_spaces (aa));
END get_pac_adrfull_noregion;

/*###############################################################################################*/
  function GET_PAC_WORKPLACE (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT /*+ rule*/GET_PACCOMPANY(FK_COMPANYID)||' '||GET_PACCOMPANY_OTDEL(FK_OTDEL)||' '||GET_PACCOMPANY_DOLGNOST(FK_DOLGNOST)||' '||FC_RABOTA
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    Result VARCHAR2(255);
  begin
    open c;
    fetch c into Result;
    close c;
    return(REPLACE_SPACES(Result));
  end;
/*###############################################################################################*/
  function GET_PAC_SEXID (pFK_PACID IN BINARY_INTEGER)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT /*+ rule*/FP_SEX
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into Result;
    close c;
    return(Result);
  end;
/*###############################################################################################*/
  function GET_PAC_SEX (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT /*+ rule*/FP_SEX
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    nTemp BINARY_INTEGER;
  begin
    open c;
    fetch c into nTemp;
    close c;
    if nTemp=0 then
      RETURN 'Женский';
    elsif nTemp=1 then
      RETURN 'Мужской';
    else
      RETURN 'Не известен';
    end if;
  end;
/*###############################################################################################*/
  function GET_PAC_SEXLITER (pFK_PACID IN BINARY_INTEGER)
  return CHAR
   is
    CURSOR c
     IS
      SELECT /*+ rule*/FP_SEX
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    nTemp BINARY_INTEGER;
  begin
    open c;
    fetch c into nTemp;
    close c;
    if nTemp=0 then
      RETURN 'Ж';
    elsif nTemp=1 then
      RETURN 'М';
    else
      RETURN 'Н';
    end if;
  end;
/*###############################################################################################*/
  function GET_PAC_AGE_NOW (pFK_PACID IN BINARY_INTEGER)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT /*+ rule*/TRUNC(MONTHS_BETWEEN(SYSDATE,FD_ROJD)/12)
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into Result;
    close c;
    return(NVL(Result,0));
  end;
/*###############################################################################################*/
  function GET_PAC_AGE_MONTH_ONLY(pFK_PACID IN BINARY_INTEGER, pFD_DATE IN DATE)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT /*+ rule*/MONTHS_BETWEEN(pFD_DATE,FD_ROJD)
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into Result;
    close c;
    return(NVL(Result,0));
  end;
/*###############################################################################################*/
  function GET_PAC_AGE_DATE (pFK_PACID IN BINARY_INTEGER, pFD_DATE IN DATE)
  return BINARY_INTEGER
   is
    CURSOR c
     IS
      SELECT /*+ rule*/TRUNC(MONTHS_BETWEEN(pFD_DATE,FD_ROJD)/12)
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    Result BINARY_INTEGER;
  begin
    open c;
    fetch c into Result;
    close c;
    return(NVL(Result,0));
  end;
/*###############################################################################################*/
  -- Added by Spasskiy S.N.
  FUNCTION GET_AGE_STR(PBIRTH ASU.TPEOPLES.FD_ROJD%TYPE,
                            PDATE      DATE DEFAULT SYSDATE,
                            PDETAIL    NUMBER DEFAULT 0) RETURN VARCHAR2 IS
    CURSOR C IS
      SELECT EXTRACT(YEAR FROM YEARS_MONTHS) Y,
             EXTRACT(MONTH FROM YEARS_MONTHS) M,
             EXTRACT(DAY FROM DAYS_HOURS) D /*,
                                                       EXTRACT(HOUR FROM DAYS_HOURS) H,
                                                       EXTRACT(MINUTE FROM DAYS_HOURS) MM*/

        FROM (SELECT NUMTOYMINTERVAL(TRUNC(MONTHS_BETWEEN(PDATE, pbirth)), 'MONTH') YEARS_MONTHS,
                     NUMTODSINTERVAL(PDATE -
                                     ADD_MONTHS(pbirth,
                                                TRUNC(MONTHS_BETWEEN(PDATE,
                                                                     pbirth))),
                                     'DAY') DAYS_HOURS
                FROM dual);
    nYear  NUMBER;
    nMonth NUMBER;
    nDay   NUMBER;
    sYear  VARCHAR2(15);
    sMonth VARCHAR2(15);
    sDay   VARCHAR2(15);
  BEGIN
    OPEN c;
    FETCH c
      INTO nYear, nMonth, nDay;
    CLOSE c;
    IF nYear = 0 THEN
      sYear := '';
    ELSE
      sYear := nYear;

      IF to_number(substr(sYear, -1, 1)) = 1 AND nYear <> 11 THEN
        sYear := sYear || ' год';
      ELSE
        IF to_number(substr(sYear, -1, 1)) BETWEEN 2 AND 4 AND
           NOT (nYear BETWEEN 11 AND 14) THEN

          sYear := sYear || ' года';
        ELSE
          sYear := sYear || ' лет';
        END IF;
      END IF;
    END IF;
--    IF PDETAIL = 0 AND NYEAR <> 0 THEN -- By Kulbatsky 27.07.2010
    IF (PDETAIL = 0) AND NYEAR <> 0 THEN 
      RETURN sYear;
    END IF;

    IF nMonth = 0 THEN
      sMonth := '';
    ELSE
      smonth := nMonth || ' мес.';
    END IF;
--    IF PDETAIL = 0 AND NYEAR <> 0 THEN -- By Kulbatsky 27.07.2010
      IF (PDETAIL = 2) or (PDETAIL = 0 AND NYEAR <> 0) THEN
     --   RETURN sMonth;
          RETURN sYear || ' ' || sMonth;
      END IF;
    
    IF nDay = 0 THEN
      sDay := '';
    ELSE
      sDay := nDay || ' дн.';
    END IF;
    IF (PDETAIL = 3) or (PDETAIL = 0 AND NYEAR <> 0) THEN -- By Kulbatsky 27.07.2010
--      IF PDETAIL < 3 AND nDay <> 0 THEN
        RETURN sYear || ' ' || sMonth || ' ' || sDay;
--        RETURN sDay;
      END IF;    
    RETURN sYear || ' ' || sMonth || ' ' || sDay;
  END;

  FUNCTION GET_PAC_AGE_STR(PPEOPLE_ID ASU.TPEOPLES.FK_ID%TYPE,
                           PDATE      DATE DEFAULT SYSDATE,
                           PDETAIL    NUMBER DEFAULT 0) RETURN VARCHAR2 IS
  BEGIN
    RETURN GET_AGE_STR(GET_PAC_BITH(PPEOPLE_ID), PDATE, PDETAIL);
  END;

/*###############################################################################################*/
  function GET_PAC_AGE_MONTH (pFK_PACID IN BINARY_INTEGER)
  return VARCHAR2
   is
    CURSOR c
     IS
      SELECT /*+ rule*/FD_ROJD, TRUNC(MONTHS_BETWEEN(SYSDATE,FD_ROJD)/12), TRUNC(MONTHS_BETWEEN (SYSDATE,FD_ROJD)) - TRUNC((MONTHS_BETWEEN(SYSDATE,FD_ROJD)/12)) * 12
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
       --WHERE FK_ID=(SELECT FK_PEPLID FROM TKARTA WHERE FK_ID=pFK_PACID);
    nYear NUMBER;
    nMonth NUMBER;
    dDate DATE;
  begin
    open c;
    fetch c into dDate,nYear,nMonth;
    close c;
    if TO_CHAR(nYear) = '0' then
      if TO_CHAR(nMonth) = '0' then
        return( TO_CHAR(TRUNC(SYSDATE-dDate)) || ' дн.' );
      else
        return( TO_CHAR(nMonth) || ' мес.' );
      end if;
    else
      return( TO_CHAR(nYear) || ' + ' || TO_CHAR(nMonth) || ' мес.' );
    end if;
  end;

/*###############################################################################################*/
  function GET_PAC_BITH (pFK_PACID IN BINARY_INTEGER)
  return DATE
   is
    CURSOR c
     IS
      SELECT FD_ROJD
        FROM TPEOPLES
       WHERE FK_ID=GET_PEPL_ID(pFK_PACID);
    Result DATE;
  begin
    open c;
    fetch c into Result;
    close c;
    return Result;
  end;


/*###############################################################################################*/
--Added by Spasskiy S.N. 05.11.2009
  FUNCTION GET_PAC_SNILS(pFK_PACID IN BINARY_INTEGER)
    RETURN ASU.TPEOPLES.FC_SNILS%TYPE IS
    CURSOR c IS
      SELECT FC_SNILS FROM TPEOPLES WHERE FK_ID = GET_PEPL_ID(pFK_PACID);
    RESULT ASU.TPEOPLES.FC_SNILS%TYPE;
  BEGIN
    OPEN c;
    FETCH c
      INTO RESULT;
    CLOSE c;
    RETURN RESULT;
  END;


end PKG_REGIST_PACFUNC;
/

SHOW ERRORS;


DROP SYNONYM BUH.PKG_REGIST_PACFUNC
/

--
-- PKG_REGIST_PACFUNC  (Synonym) 
--
--  Dependencies: 
--   PKG_REGIST_PACFUNC (Package Body)
--
CREATE SYNONYM BUH.PKG_REGIST_PACFUNC FOR ASU.PKG_REGIST_PACFUNC
/


GRANT EXECUTE ON ASU.PKG_REGIST_PACFUNC TO EXCHANGE
/

GRANT EXECUTE ON ASU.PKG_REGIST_PACFUNC TO EXCH43
/

GRANT EXECUTE ON ASU.PKG_REGIST_PACFUNC TO LAB
/

