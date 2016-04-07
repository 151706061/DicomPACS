DROP PACKAGE BODY ASU.PKG_KEKREP
/

--
-- PKG_KEKREP  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_KEKREP" IS
--------------------------------------------------------------------------------
-- NEBARY (Create 15.07.2002)
-- Возвращает CLOB - жупнал КЭК
--------------------------------------------------------------------------------
  CR       VARCHAR2(2):=CHR(13)||CHR(10);
  Date1    DATE;    -- начальная дата
  Date2    DATE;    -- конечная дата
  sHeader  VARCHAR2(4000):=
    '<html><head>'||CR||
    '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||CR||
    '<style type="text/css">'||CR||
    '  p {font-size:21pt; text-align:center}'||CR||
    '  br {mso-data-placement:same-cell;}'||CR||
    '</style>'||CR||
    '<title>Журнал консультаций заведующего отделением</title></head>'||CR||
    '<body scroll="auto" style="border:none">'||CR||
    '<table align=center border=1 cellspacing=0 cellpadding=0>'||CR||
    ' <tr>'||CR||
    '  <td colspan=10 style="border:none"><p>Журнал КЭК за период с :pFD1 по :pFD2</p></td>'||CR||
    ' </tr>'||CR||
    ' <tr style="background:buttonface; font:bold">'||CR||
    '  <td align=center valign=center>Дата</td>'||CR||
    '  <td align=center valign=center>Ф.И.О. больного</td>'||CR||
    '  <td align=center valign=center>Возраст</td>'||CR||
    '  <td align=center valign=center>№ И.Б.</td>'||CR||
    '  <td align=center valign=center>Врач</td>'||CR||
    '  <td align=center valign=center>Диагноз при направлении на консультацию</td>'||CR||
    '  <td align=center valign=center>Цель консультации</td>'||CR||
    '  <td align=center valign=center>Диагноз КЭК</td>'||CR||
    '  <td align=center valign=center>Решение КЭК</td>'||CR||
    '  <td align=center valign=center>Состав КЭК</td>'||CR||
    ' </tr>'||CR||
    ' <tr>'||CR||
    '  <td width=100 align=center valign=center><b>1</b></td>'||CR||
    '  <td width=200 align=center valign=center><b>2</b></td>'||CR||
    '  <td width=70 align=center valign=center><b>3</b></td>'||CR||
    '  <td width=70 align=center valign=center><b>4</b></td>'||CR||
    '  <td width=200 align=center valign=center><b>5</b></td>'||CR||
    '  <td width=200 align=center valign=center><b>6</b></td>'||CR||
    '  <td width=100 align=center valign=center><b>7</b></td>'||CR||
    '  <td width=400 align=center valign=center><b>8</b></td>'||CR||
    '  <td width=100 align=center valign=center><b>9</b></td>'||CR||
    '  <td width=100 align=center valign=center><b>10</b></td>'||CR||
    ' </tr>'||CR;
  sSostKEK VARCHAR2(4000):=
    '<b>Зам. главного врача - :pZamGlavVrach</b><br>'||CR||
    'Зав. терапевт. отделения - :pZavTerapevt<br>'||CR||
    'Зав. БФТО - :pZavBFTO<br>'||CR||
    'Лечащий врач - ';

--------------------------------------------------------------------------------
-- Возвращает инфо по пациэнту -------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_pacage(nID IN NUMBER, DateNow IN DATE)
  RETURN VARCHAR2 IS
    sTmp VARCHAR2(4000);
  BEGIN
    FOR c IN (SELECT TRUNC(MONTHS_BETWEEN (DateNow, fd_rojd) / 12) AS fn_age
             FROM ((SELECT fk_id, fd_rojd FROM tkarta)
                    UNION
                    (SELECT fk_id, fd_rojd FROM tambulance)) T
             WHERE fk_id=nID) LOOP
      sTmp:=TO_CHAR(c.fn_age);
    END LOOP;
    SELECT NVL(sTmp,' ') INTO sTmp FROM DUAL;
    RETURN sTmp;
  END;
  FUNCTION get_pacFIO(nID IN NUMBER)
  RETURN VARCHAR2 IS
    sTmp VARCHAR2(4000);
  BEGIN
    FOR c IN (SELECT fc_fam||' '||DECODE(SUBSTR(fc_im,0,1), NULL, '', SUBSTR(fc_im,0,1)||'. ')||DECODE(SUBSTR(fc_otch,0,1), NULL, '', SUBSTR(fc_otch,0,1)||'. ') AS fc_name
             FROM ((SELECT fk_id, fc_fam, fc_im, fc_otch FROM tkarta)
                    UNION
                    (SELECT fk_id, fc_fam, fc_im, fc_otch FROM tambulance)) T
             WHERE fk_id=nID) LOOP
      sTmp:=c.fc_name;
    END LOOP;
    SELECT NVL(sTmp,' ') INTO sTmp FROM DUAL;
    RETURN sTmp;
  END;
  FUNCTION get_pacIB(nID IN NUMBER)
  RETURN VARCHAR2 IS
    sTmp VARCHAR2(4000);
  BEGIN
    FOR c IN (SELECT TO_CHAR(fk_ibid)||'/'||TO_CHAR(fk_iby) AS fn_ib
             FROM ((SELECT fk_id, fk_ibid, fk_iby FROM tkarta)
                    UNION
                    (SELECT fk_id, fk_ibid, fk_iby FROM tambulance)) T
             WHERE fk_id=nID) LOOP
      sTmp:=c.fn_ib;
    END LOOP;
    SELECT NVL(sTmp,' ') INTO sTmp FROM DUAL;
    RETURN sTmp;
  END;
  FUNCTION get_VrachFIO(nID IN NUMBER)
  RETURN VARCHAR2 IS
    sTmp     VARCHAR2(4000);
  BEGIN
    IF nID IS NULL THEN RETURN ' '; END IF;
    FOR c IN (SELECT fc_fam||' '||DECODE(SUBSTR(fc_name,0,1), NULL, '', SUBSTR(fc_name,0,1)||'. ')||DECODE(SUBSTR(fc_otch,0,1), NULL, '', SUBSTR(fc_otch,0,1)||'. ') AS fc_nm
             FROM tsotr
             WHERE fk_id=nID) LOOP
      sTmp:=c.fc_nm;
    END LOOP;
    SELECT NVL(sTmp,' ') INTO sTmp FROM DUAL;
    RETURN sTmp;
  END;
  FUNCTION get_VrachFIO_Napr(nID IN NUMBER)
  RETURN VARCHAR2 IS
    sTmp VARCHAR2(4000);
    nTmp NUMBER;
  BEGIN
    FOR c IN (SELECT fk_vrachid FROM tnazkons WHERE fk_id=nID) LOOP
      nTmp:=c.fk_vrachid;
    END LOOP;
    FOR c IN (SELECT fc_fam||' '||DECODE(SUBSTR(fc_name,0,1), NULL, '', SUBSTR(fc_name,0,1)||'. ')||DECODE(SUBSTR(fc_otch,0,1), NULL, '', SUBSTR(fc_otch,0,1)||'. ') AS fc_nm
             FROM tsotr
             WHERE fk_id=nTmp) LOOP
      sTmp:=c.fc_nm;
    END LOOP;
    SELECT NVL(sTmp,' ') INTO sTmp FROM DUAL;
    RETURN sTmp;
  END;
--------------------------------------------------------------------------------
-- Возвращает одну строку журнала ----------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_consrow(pFK_ID IN NUMBER)
  RETURN CLOB IS
    CURSOR cConsult IS SELECT fk_pacid, fd_ins, fc_res, fk_nazid, fc_coment FROM treskons
     WHERE fk_id=pFK_ID;
    sRes VARCHAR2(32767);
    cRes CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cRes, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITE(cRes, 1, 1, ' ');
    FOR C IN cConsult LOOP
      sRes:=' <tr>'||CR;
      sRes:=sRes||'  <td align=center valign=top>'||TO_CHAR(C.fd_ins,'dd.mm.yyyy')||'г.</td>'||CR;
      sRes:=sRes||'  <td align=center valign=top>'||get_pacfio(C.fk_pacid)||'</td>'||CR;
      sRes:=sRes||'  <td align=center valign=top>'||get_pacage(C.fk_pacid, C.fd_ins)||'</td>'||CR;
      sRes:=sRes||'  <td align=center valign=top>'||get_pacib(C.fk_pacid)||'</td>'||CR;
      sRes:=sRes||'  <td align=center valign=top>'||get_vrachfio_napr(C.fk_nazid)||'</td>'||CR;
      sRes:=sRes||'  <td align=left valign=top>'||NVL(do_diagbytype(C.fk_pacid,2,1),' ')||'</td>'||CR;
      sRes:=sRes||'  <td align=center valign=top>'||NVL(C.fc_coment,' ')||'</td>'||CR;
      sRes:=sRes||'  <td align=left valign=top>'||NVL(do_diagbytype(C.fk_pacid,4,1,C.fk_nazid)||do_diagbytype(C.fk_pacid,4,0,C.fk_nazid),' ')||'</td>'||CR;
      sRes:=sRes||'  <td align=left valign=top>'||REPLACE(NVL(C.fc_res,' '), CHR(13), '<br>')||'</td>'||CR;
      sRes:=sRes||'  <td align=left valign=top>'||sSostKEK||get_vrachfio(get_pacvrach(C.fk_pacid))||'</td>'||CR;
      sRes:=sRes||' </tr>'||CR;
    END LOOP;
    DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sRes), sRes);
    RETURN cRes;
  END;

--------------------------------------------------------------------------------
-- Main ------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION GET_KEKREP(pFD1 IN DATE,pFD2 IN DATE)
  RETURN CLOB
  IS
    CURSOR cKEK IS SELECT k.fk_id AS kek_id, s.fk_id
           FROM treskons k, tsmid s
           WHERE s.fk_id=get_kekkonsid
           AND k.fk_smid=s.fk_id
           AND k.fd_ins BETWEEN Date1 AND Date2
           ORDER BY k.fd_ins;
    sReport CLOB;
    sTmp    VARCHAR2(32767);
    nSMID   NUMBER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(sReport, TRUE, DBMS_LOB.SESSION);
    Date1:=TO_DATE(TO_CHAR(pFD1,'DD.MM.YYYY')||' 00.00.00','DD.MM.YYYY HH24.MI.SS'); -- на начало суток
    Date2:=TO_DATE(TO_CHAR(pFD2,'DD.MM.YYYY')||' 23.59.59','DD.MM.YYYY HH24.MI.SS'); -- на конец суток
    sSostKek:=REPLACE(sSostKek,':pZamGlavVrach',zamsglav_fio);
    sSostKek:=REPLACE(sSostKek,':pZavTerapevt',get_vrachfio(get_zavterapevt));
    sSostKek:=REPLACE(sSostKek,':pZavBFTO',get_vrachfio(get_zavbfto));
    sTmp:=sHeader;
    sTmp:=REPLACE(sTmp, ':pFD1', TO_CHAR(Date1, 'DD.MM.YYYY'));
    sTmp:=REPLACE(sTmp, ':pFD2', TO_CHAR(Date2, 'DD.MM.YYYY'));
    DBMS_LOB.WRITE(sReport, LENGTH(sTmp), 1, sTmp);
    FOR c IN cKEK LOOP
      DBMS_LOB.APPEND(sReport, get_consrow(c.kek_id));
    END LOOP;
    sTmp:='</table></body></html>';
    DBMS_LOB.WRITEAPPEND(sReport, LENGTH(sTmp), sTmp);
    RETURN sReport;
  END;
END;
/

SHOW ERRORS;


