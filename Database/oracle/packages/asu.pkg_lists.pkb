DROP PACKAGE BODY ASU.PKG_LISTS
/

--
-- PKG_LISTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_LISTS" is

  -- Author  : TIMURLAN
  -- Created : 14.02.2006 9:58:34
  nTmp NUMBER;
  FUNCTION GET_PAC_VRACHPO(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    Result VARCHAR2(32767);
    CURSOR c IS-- by XAN + TimurLan
      SELECT LOGIN.GET_SOTRNAME(FK_VRACHID) FC_SOTR
        FROM VRES
       WHERE FK_PACID = pFK_PACID
         AND VRES.FK_SOS = GET_VIPNAZ
         AND VRES.FK_SMID = (SELECT MIN(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'KONS_PRIEM_VRACH_OSM');
  BEGIN
    FOR p IN c LOOP
      Result:=Result||','||p.FC_SOTR;
    END LOOP;
    RETURN TRIM(',' FROM Result);
  END;

  FUNCTION GET_PAC_SOST(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    Result VARCHAR2(32767);
    CURSOR c IS-- by XAN + TimurLan
      SELECT GET_SMIDNAME(FK_SMID) FC_SOST
        FROM TIB
       WHERE FK_ID = (SELECT MAX(TIB.FK_ID)
                        FROM VRES, TIB
                       WHERE VRES.FK_PACID = pFK_PACID
                         AND FK_SOS = GET_VIPNAZ
                         AND FK_NAZID = TIB.FK_PACID
                         AND TIB.FK_SMID IN
                             (SELECT FK_ID
                                FROM TSMID
                              CONNECT BY PRIOR FK_ID = FK_OWNER
                               START WITH FC_SYNONIM = 'PAC_SOST'));
  BEGIN
    open c;
    fetch c into Result;
    close c;
    RETURN TRIM(',' FROM Result);
  END;
    FUNCTION GET_PAC_SOST_DATE(pPACID IN BINARY_INTEGER, pDate in  date) RETURN NUMBER IS
    --by Spasskiy S.N.
    Result number;
    ntmp date;
    CURSOR c IS
    (select max(id)  from (
            select max(fd_run) id  from vnaz v, asu.tib ib ,(select fk_id from asu.tsmid connect by prior fk_id=fk_owner start with fc_synonim = 'PAC_SOST') pac
                   where v.fk_pacid=ppacid and ib.fk_pacid=v.fk_id and v.fk_nazsosid=asu.get_vipnaz and v.fd_run<pdate
                  and ib.fk_smid =pac.fk_id
            union all
            select max(t.fd_changed) id from asu.ttemplist t,(select fk_id from asu.tsmid connect by prior fk_id=fk_owner start with fc_synonim = 'PAC_SOST') pac
                   where t.fk_pacid=ppacid  and t.fd_changed<pdate and t.fk_smidid = pac.fk_id )
   );
  BEGIN
    open c;
    fetch c into ntmp;
    close c;
    if ntmp is not null then
     for c in (select tib.fk_smid from asu.tib, vnaz v, (select fk_id from asu.tsmid where fc_synonim = 'PAC_SOST') sost
               where v.fd_run=ntmp and tib.fk_pacid=v.fk_id and tib.fk_smeditid =sost.fk_id
                union all
               select fk_smidid from asu.ttemplist t,(select fk_id from asu.tsmid connect by prior fk_id=fk_owner start with fc_synonim = 'PAC_SOST') sost where t.fd_changed = ntmp and fk_smidid = sost.fk_id
               )
      loop
       result:=c.fk_smid;
      end loop;
     else result:= null  ;
      end if;
    return result;

  END;

  FUNCTION GET_PAC_KONTROL(pFK_PACID IN BINARY_INTEGER) RETURN BINARY_INTEGER IS
    Result BINARY_INTEGER;
    CURSOR c IS-- by TimurLan
      SELECT FK_SMID
        FROM VNAZ
       WHERE FK_PACID = pFK_PACID
         AND FK_SMID IN (GET_KONTROLID,GET_REANIMID)
         AND FK_NAZSOSID = ASU.GET_NEVIP;
/* Changed by  Spasskiy S.N. 06.05.2009 */
--         AND FK_NAZSOSID <> ASU.GET_NAZCANCEL;
  BEGIN
    FOR p IN c LOOP
      IF p.FK_SMID = GET_KONTROLID AND Result IS NULL THEN
        Result := 0;
      ELSIF p.FK_SMID = GET_REANIMID THEN
        Result := 1;
      END IF;
    END LOOP;
    RETURN Result;
  END;

  FUNCTION GET_PAC_REANIM_OTD(pFK_PACID IN BINARY_INTEGER, pSotrID IN BINARY_INTEGER) RETURN BINARY_INTEGER IS -- Created Nefedov 09.02.07
    Result BINARY_INTEGER;
    CURSOR c IS-- by Nefedov
      SELECT FK_SMID, FK_ROOMID
        FROM VNAZ
       WHERE FK_PACID = pFK_PACID
         AND FK_SMID IN (GET_REANIMID)
         AND FK_NAZSOSID <> GET_NAZCANCEL;
  BEGIN
    -- get_reanimkab кабинет анестезиологии и реанимации
    -- get_reanimotdel отделение анестезиологии и реанимации
    --
    -- get_oarkab кабинет ОАР для кардиобольных
    -- Get_Oarotdel отделение ОАР для кардиобольных
    FOR p IN c LOOP
        IF (p.FK_ROOMID = get_reanimkab and GET_VRACHOTD(pSotrID) = get_reanimotdel)
        or (p.FK_ROOMID = get_oarkab and GET_VRACHOTD(pSotrID) = Get_Oarotdel) THEN
            Result:=1;
        ELSE
            Result:=0;
        END IF;
    END LOOP;
    RETURN Result;
  END;

  FUNCTION GET_PAC_REJIM(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    Result VARCHAR2(32767);
    CURSOR CUR IS SELECT vnaz.fk_id nazid FROM VNAZ,tsmid WHERE
        fk_pacid=pFk_pacid
        AND tsmid.fk_id=vnaz.fk_smid
        AND tsmid.fc_synonim='PROC_REZHIM' ORDER BY vnaz.fk_id DESC;
  BEGIN
    FOR C IN CUR LOOP
     Result:='Режим '||PKG_NAZ.get_nazparam(c.nazid);
     EXIT;
    END LOOP;
    RETURN Result;
  END;

  FUNCTION GET_PAC_DIETA(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    Result VARCHAR2(32767);
    CURSOR CUR IS SELECT vnaz.fk_id nazid FROM VNAZ,tsmid WHERE
        fk_pacid=pFk_pacid
        AND tsmid.fk_id=vnaz.fk_smid
        AND tsmid.fc_synonim='PROC_DIET' ORDER BY vnaz.fk_id DESC;
  BEGIN
    FOR C IN CUR LOOP
     Result:='Диета '||PKG_NAZ.get_nazparam(c.nazid);
     EXIT;
    END LOOP;
    RETURN Result;
  END;

  FUNCTION GET_PAC_SESTR(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    Result VARCHAR2(32767);
  CURSOR CUR IS SELECT vnaz.fk_id nazid FROM VNAZ WHERE
        fk_pacid=pFk_pacid
        AND vnaz.fk_smid= GET_LISTSESTRID ORDER BY vnaz.fk_id DESC;
  BEGIN
    FOR C IN CUR LOOP
     Result:='Сестринское наблюдение '||PKG_NAZ.get_nazparam(c.nazid);
     EXIT;
    END LOOP;
    RETURN Result;
  END;

  FUNCTION GET_PAC_SESTRKRATN(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    Result VARCHAR2(32767);
   CURSOR CUR IS SELECT vnaz.fk_id nazid FROM VNAZ,tsmid WHERE
        fk_pacid=pFk_pacid
        AND vnaz.fk_smid=GET_LISTSESTRID
        ORDER BY vnaz.fk_id DESC;
    CURSOR c(nazid NUMBER) IS-- by XAN (as is)
      SELECT GET_SMID_VALUES.GET_NUMBER(SM.FK_ID, nazid, 'NUMBER') FC_VALUE
        FROM (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'SESTR_NAB_KRAT') SM;
  BEGIN

  FOR L IN CUR LOOP
    FOR p IN c(l.nazid) LOOP
      Result:=p.FC_VALUE;
    END LOOP;
    EXIT;
  END LOOP;
    RETURN Result;
  END;

  FUNCTION GET_NAZ_PATH(pFK_NAZID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    Result VARCHAR2(32767);
    CURSOR c IS-- by XAN (as is)
      SELECT GET_SMIDNAME(GET_SMID_VALUES.GET_CBX(STAT.PKG_STATUTIL.GET_SMIDID_OWNER(VNAZ.FK_SMID,'MEDLECH_INPATH'),VNAZ.FK_ID,'COMBOBOX')) FC_VALUE
        FROM VNAZ
       WHERE FK_ID = pFK_NAZID;
  BEGIN
    RETURN Result;
  END;

  FUNCTION GET_DIAG_MAIN(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
  -- by XSIDE (as is)
    NAMEDIAG VARCHAR2(32000);
    CURSOR cNAME IS SELECT FC_WRITE FROM TDIAG
                     WHERE FK_PACID = pFK_PACID
                     --  AND FP_TYPE = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'CLINIK')
                       AND FL_MAIN = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'MAIN');
  BEGIN
    OPEN cNAME;
    FETCH cNAME INTO NAMEDIAG;
    CLOSE cNAME;
    RETURN NAMEDIAG ;
  END;

  FUNCTION GET_DIAG_CLINIK(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
  -- by XSIDE (as is)
    NAMEDIAG VARCHAR2(32000);
    CURSOR cNAME IS SELECT FC_WRITE FROM TDIAG
                     WHERE FK_PACID = pFK_PACID
                       AND FP_TYPE = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'CLINIK')
                       AND FL_MAIN = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'MAIN');
  BEGIN
    OPEN cNAME;
    FETCH cNAME INTO NAMEDIAG;
    CLOSE cNAME;
    RETURN NAMEDIAG ;
  END;

  FUNCTION GET_DIAG_ANATOM(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
  -- by XSIDE (as is)
    NAMEDIAG VARCHAR2(32000);
    CURSOR cNAME IS SELECT FC_WRITE FROM TDIAG
                     WHERE FK_PACID = pFK_PACID
                       AND FP_TYPE = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'CLINIK_ANATOM')
                       AND FL_MAIN = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'MAIN');
  BEGIN
    OPEN cNAME;
    FETCH cNAME INTO NAMEDIAG;
    CLOSE cNAME;
    RETURN NAMEDIAG ;
  END;

  FUNCTION GET_DIAG_NAPR(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
  -- by XSIDE (as is)
    NAMEDIAG VARCHAR2(32000);
    CURSOR cNAME IS SELECT FC_WRITE FROM TDIAG
                     WHERE FK_PACID = pFK_PACID
                       AND FP_TYPE = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'S_MESTA_OTBORA')
                       AND FL_MAIN = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'MAIN');
  BEGIN
    OPEN cNAME;
    FETCH cNAME INTO NAMEDIAG;
    CLOSE cNAME;
    RETURN NAMEDIAG ;
  END;

  FUNCTION GET_DIAG_PRIPOSTUP(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
  -- by XSIDE (as is)
    NAMEDIAG VARCHAR2(32000);
    CURSOR cNAME IS SELECT FC_WRITE FROM TDIAG
                     WHERE FK_PACID = pFK_PACID
                       AND FP_TYPE = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'PRI_POSTYPLENII')
                       AND FL_MAIN = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'MAIN');
  BEGIN
    OPEN cNAME;
    FETCH cNAME INTO NAMEDIAG;
    CLOSE cNAME;
    RETURN NAMEDIAG ;
  END;
--возврачает причину отказа в госпитализации (XAND)
FUNCTION GET_PAC_GOSPOTKAZ(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
 sTmp VARCHAR(1000);
BEGIN
 sTmp:='';
  FOR CC IN (SELECT tib.fk_smid FROM asu.tib,tsmid WHERE fk_pacid=pFk_pacid AND tib.fk_smid=tsmid.fk_id AND tsmid.fc_synonim='GOSPZAKL_OTKAZ') LOOP
      FOR CCC IN (SELECT asu.get_smidname(FK_VYBID) fc_name FROM asu.TSROKY WHERE FK_ID=asu.GET_MAXSROKID(pFk_pacid)) LOOP
       sTmp:=sTmp||CCC.fc_name;
      END LOOP;
  END LOOP;
 RETURN sTmp;
END;
--возвращает название операции, pNazid - vnaz.fk_id операции (Xcreate by XAND)
FUNCTION GET_OPER_NAME(pNazID NUMBER) RETURN VARCHAR IS
 sRes VARCHAR2(1000);
BEGIN
    FOR C IN (SELECT MAX(tib.fc_char) s from (SELECT fk_id,fc_name FROM tsmid WHERE fc_synonim='PROTHOPER_NAME') sm,asu.tib WHERE tib.fk_pacid=pNazID AND tib.fk_smid=sm.fk_id) LOOP
     sRes:=C.s;
    END LOOP;
    FOR C IN (SELECT MAX(tib.fc_char) s from (SELECT fk_id FROM tsmid connect by prior fk_id=fk_owner START With fc_synonim='PROTHOPER_DOPNAME') sm,asu.tib WHERE tib.fk_pacid=pNazID AND tib.fk_smid=sm.fk_id) LOOP
     sRes:=sRes||' '||C.s;
    END LOOP;
    FOR C IN (SELECT sm.fc_name s from (SELECT fk_id,fc_name FROM tsmid connect by prior fk_id=fk_owner START With fc_synonim='PROT_HOPERDOPNAME2') sm,asu.tib WHERE tib.fk_pacid=pNazID AND tib.fk_smid=sm.fk_id) LOOP
     sRes:=sRes||' '||C.s;
    END LOOP;
    /* Added by Spasskiy S.N. 19.03.2007*/
    if ltrim(sres,' ') IS NULL THEN
      for c in (select asu.get_smidname(fk_smid) s from vnaz where fk_id=pNazID) loop
      sRes:=sRes||' '||C.s;
      end loop;
    END IF;
 RETURN sRes;
END;
--возвращает дату предпоследнего обращения(XAND)
FUNCTION GET_LAST_OSM(pNazid NUMBER) RETURN DATE IS
BEGIN
 FOR CSM IN (SELECT fk_smid,fk_pacid FROM vnaz WHERE fk_id=pNazID) LOOP
  FOR RES IN (SELECT MAX(fd_naz) dt FROM vnaz WHERE fk_pacid=CSM.fk_pacid AND vnaz.fk_smid=CSM.fk_smid AND vnaz.fk_id<>pNazID AND fk_nazsosid=get_vipnaz) LOOP
    RETURN RES.dt;
  END LOOP;
 END LOOP;
 RETURN NULL;
END;
end PKG_LISTS;
/

SHOW ERRORS;


