CREATE OR REPLACE FUNCTION asu.get_nazis_patprintform(Nazid NUMBER, Sotrid NUMBER) RETURN CLOB IS
  CL           CLOB;
  CLTMP        CLOB;
  STMP         VARCHAR2(32767);
  SCOMPANYNAME ASU.TSMINI.FC_VALUE%TYPE;
  SUSE_DIGIT   ASU.TSMINI.FC_VALUE%TYPE;
  SOTDELNAME   LOGIN.TOTDEL.FC_NAME%TYPE;
  SPHONE       ASU.TKABINET.FC_NAME%TYPE;
  NPACID       NUMBER;
  SNAZNAME     ASU.TSMID.FC_NAME%TYPE;
  DRUN         DATE;
  SVRACHFIO    VARCHAR2(255);
  SPACFIO      VARCHAR2(255);
  DBIRTH       DATE;
  SPACIB       VARCHAR2(255);
  SMTSIGN      VARCHAR2(255);
  nDigSign     NUMBER;
  cr           VARCHAR2(2) := CHR(13);--||CHR(13);

  CURSOR CNAZ IS
    SELECT I.FK_PACID,
           ASU.GET_FULLPATH_SHA(I.FK_SMID),
           I.FD_RUN,
           (SELECT FC_PHONE FROM ASU.TKABINET WHERE FK_ID = I.FK_ROOMID),
           (SELECT FB_HTML FROM ASU.TRICHVIEWDATA WHERE FK_PACID = I.FK_ID),
           asu.get_sotrname(i.fk_ispolid)
      FROM ASU.TNAZIS I
     WHERE I.FK_ID = NAZID;

  CURSOR CPAC IS
    SELECT ASU.PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(NPACID),
           ASU.PKG_REGIST_PACFUNC.GET_PAC_BITH(NPACID),
           ASU.PKG_REGIST_PACFUNC.GET_PAC_IB(NPACID)
      FROM DUAL;

  CURSOR CSOTR IS
    SELECT --S.FC_FAM || ' ' || SUBSTR(S.FC_NAME, 1, 1) || '. ' ||SUBSTR(S.FC_OTCH, 1, 1) || '.',
           (SELECT O.FC_NAME FROM ASU.TOTDEL O WHERE O.FK_ID = S.FK_OTDID)
      FROM LOGIN.TSOTR S
     WHERE S.FK_ID = SOTRID;

  CURSOR CSMINI IS
    SELECT ASU.PKG_SMINI.READSTRING('CONFIG', 'S_FULLNAME', '') AS COMPANYNAME,
           ASU.MEDOTRADE_SIGN,
           (SELECT FC_VALUE
              FROM ASU.TSMINI
             WHERE FC_SECTION = 'CONFIG'
               AND FC_KEY = 'USE_DIGITSUBSCRIBE')
      FROM DUAL;

  CURSOR CDIGSIGN IS
    SELECT COUNT(*) AS CNT
      FROM ASU.TPODPIS_RICHVIEWDATA P, ASU.TRICHVIEWDATA D
     WHERE P.FK_RICHVIEWDATA = D.FK_ID
       AND D.FK_PACID = NAZID;
BEGIN
  OPEN CSMINI;
  FETCH CSMINI
    INTO SCOMPANYNAME, SMTSIGN, SUSE_DIGIT;
  CLOSE CSMINI;

  OPEN CNAZ;
  FETCH CNAZ
    INTO NPACID, SNAZNAME, DRUN, SPHONE, CLTMP, SVRACHFIO;
  CLOSE CNAZ;

  OPEN CSOTR;
  FETCH CSOTR
    INTO SOTDELNAME;
  CLOSE CSOTR;

  OPEN CPAC;
  FETCH CPAC
    INTO SPACFIO, DBIRTH, SPACIB;
  CLOSE CPAC;

  IF SUSE_DIGIT = '1' THEN
    OPEN CDIGSIGN;
    FETCH CDIGSIGN INTO nDigSign;
    IF CDIGSIGN%NOTFOUND THEN nDigSign := 0; END IF;
    CLOSE CDIGSIGN;
    IF nDigSign > 0 THEN
     SVRACHFIO := 'ЭЦП '||SVRACHFIO;
    END IF;
  END IF;

  DBMS_LOB.CREATETEMPORARY(CL, TRUE);
  STMP := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||cr||'<html><head>'||cr||'<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'||cr||
          '<meta name=Generator content="FastReport 4.0 http://www.fast-report.com">'||cr||'<title></title>'||cr||'<style type="text/css"><!-- '||cr||
          /*'.page_break {page-break-before: always;}'||*/cr||'.s0 {'||cr||' font-family: Arial;'||cr||' font-size: 9px;'||cr||
          ' color: #000000; font-weight: bold; font-style: normal;'||cr||' background-color: #F0F0F0;'||cr||' text-align: Center; vertical-align: Top;'||cr||'}'||cr||'.s1 {'||cr||
          ' font-family: Arial;'||cr||' font-size: 13px;'||cr||' color: #000000; font-weight: bold; font-style: normal;'||cr||' background-color: transparent;'||cr||
          ' text-align: Left; vertical-align: Top;'||cr||'}'||cr||'.s2 {'||cr||' font-family: Arial;'||cr||' font-size: 13px;'||cr||
          ' color: #FFFFFF; font-weight: bold; font-style: normal;'||cr||' background-color: #008080;'||cr||' text-align: Left; vertical-align: Top;'||cr||'}'||cr||'.s3 {'||cr||
          ' font-family: Arial;'||cr||' font-size: 13px;'||cr||' color: #000000; font-style: normal;'||cr||' background-color: transparent;'||cr||
          ' text-align: Justify; vertical-align: Top;'||cr||'}'||cr||'.s4 {'||cr||' font-family: Arial;'||cr||' font-size: 13px;'||cr||' color: #000000; font-style: normal;'||cr||
          ' background-color: transparent;'||cr||' text-align: Left; vertical-align: Top;'||cr||'}'||cr||'.s5 {'||cr||' font-family: Arial;'||cr||' font-size: 9px;'||cr||
          ' color: #000000; font-style: normal;'||cr||' background-color: #F0F0F0;'||cr||' text-align: Right; vertical-align: Top;'||cr||'}'||cr||'.s6 {'||cr||
          ' font-family: Arial;'||cr||' font-size: 9px;'||cr||' color: #000000; font-style: normal;'||cr||' background-color: #F0F0F0;'||cr||
          ' text-align: Left; vertical-align: Top;'||cr||'}'||cr||'--></style>'||cr||'</head>'||cr||'<!--html header end-->'||cr;
  dbms_lob.writeappend(cl,length(stmp),stmp);
  stmp := '<body bgcolor="#FFFFFF" text="#000000">'||cr||'<a name="PageN1"></a>'||cr||'<table width="100%" border="0" cellspacing="0" cellpadding="0">'||cr||
          '<tr style="height: 1px"><td/></tr>'||cr||
          '<tr style="height:15px">'||cr||'<td colspan="6" class="s0">'||SCOMPANYNAME||'</td>'||cr||'</tr>'||cr||'<tr style="height:1px">'||cr||
          '<td/>'||cr||'</tr>'||cr||'<tr style="height:15px">'||cr||
          '<td colspan="6" class="s0">'||SOTDELNAME||'</td>'||cr||'</tr>'||cr||'<tr style="height:3px">'||cr||
          '<td/>'||cr||'</tr>'||cr||'<tr style="height:18px">'||cr||
          '<td colspan="2" class="s1">Пациент:</td><td colspan="3" class="s1">'||SPACFIO||
          '</td><td colspan="1" class="s4" style="font-size:1px">&nbsp;</td>'||cr||'</tr>'||cr||'<tr style="height:5px">'||cr||
          '<td/>'||cr||'</tr>'||cr||'<tr style="height:18px">'||cr||
          '<td colspan="2" class="s1">Дата рождения:</td><td colspan="4" class="s4">'||to_char(DBIRTH,'dd.mm.yyyy')||'</td>'||cr||
          '</tr>'||cr||'<tr style="height:5px">'||cr||'<td/>'||cr||
          '</tr>'||cr||'<tr style="height:18px">'||cr||'<td colspan="2" class="s1">№ МК:</td><td colspan="4" class="s4">'||SPACIB||
          '</td>'||cr||'</tr>'||cr||'<tr style="height:7px">'||cr||
          '<td/>'||cr||'</tr>'||cr||'<tr style="height:18px">'||cr||
          '<td colspan="6" class="s2">'||SNAZNAME||'</td>'||cr||'</tr>'||cr||
          '<tr style="height:5px">'||cr||'<td/>'||cr||'</tr>'||cr||
          /*'<tr style="height:909px">'||*/cr||'</table><!--report header end-->'||cr;
  dbms_lob.writeappend(cl,length(stmp),stmp);
  IF clTmp IS NOT NULL THEN  
    dbms_lob.writeappend(cl,length(clTmp),clTmp);
  END IF;
  stmp := cr||'<!--richview end-->'||'<table><tr width="100%" style="height:18px">'||cr||
          '<td/><td width="40%" class="s4">Дата: '||to_char(SYSDATE,'dd.mm.yyyy')||
          '</td><td width="60%" class="s4">Врач: '||SVRACHFIO||'</td><td/><td/>'||cr||
          '</tr></table>'||cr||'<!--footer end-->'||cr;
  dbms_lob.writeappend(cl,length(stmp),stmp);
  stmp := '</body></html>';
  dbms_lob.writeappend(cl,length(stmp),stmp);
  RETURN(cl);
END;
