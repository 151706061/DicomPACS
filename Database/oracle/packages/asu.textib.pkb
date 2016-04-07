DROP PACKAGE BODY ASU.TEXTIB
/

--
-- TEXTIB  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."TEXTIB" 
 IS
  sTmp       VARCHAR2(32767);
  sHtml      VARCHAR2(32767);
  CR         VARCHAR(2):=CHR(13)||CHR(10);
  CURSOR cGetEpikrizClob(pFK_PACID in number) IS
    SELECT fc_clob
      FROM tclobs, tepikriz
     WHERE fk_pacid = pFK_PACID AND tclobs.fk_id = tepikriz.fk_clobid;
  /*------------------------------------------------------------------------------------------------------------------*/
  TYPE TPacList IS TABLE OF BINARY_INTEGER INDEX BY BINARY_INTEGER;
  arPacList TPacList;
  arNullList TPacList;
  /*------------------------------------------------------------------------------------------------------------------*/
 --- возвращает планы лечения и обследования
  FUNCTION GET_PLANS_FOR_OSMOTR(nPriemId IN NUMBER,pFK_pacid IN NUMBER) RETURN CLOB IS
    clTemp  CLOB;
    bExist  NUMBER;
  BEGIN
    bExist:=0;
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
     --план обследования
    sHtml:='<br><b><CENTER>План обследования:</CENTER></b><br><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">'
          ||'<tr>'
          --||'<td align="center">Дата</td>'
          ||'<td align="center">Наименование</td>'
          ||'</tr>';
    FOR C IN (SELECT vnaz.fk_smid,vnaz.fd_run FROM vnaz,(SELECT fk_id FROM tsmid CONNECT BY PRIOR fk_id=fk_owner START WITH fk_id IN (GET_KONSID,GET_ISSLEDID,get_analid))ob WHERE vnaz.fk_nazowner=nPriemId AND ob.fk_id=vnaz.fk_smid ORDER BY fd_run) LOOP
        bExist:=1;
        sHtml:=sHtml||'<tr>'||CR||
                      --'<td align="center">'||TO_CHAR(C.fd_run,'dd.mm.yyyy')||'</td>'||
                      '<td align="left">&#160;'||get_fullpath(C.fk_smid)||'</td>'||
                      '</tr>';
    END LOOP;
    sHtml:=sHtml||'</table>';
    IF bExist=1 THEN
     DBMS_LOB.writeappend(clTemp, LENGTH(sHtml),sHtml);
    END IF;
    --Медикаментозные назначения
    bExist:=0;
    sHtml:='<br><b><CENTER>Медикаментозные назначения:</CENTER></b><br><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">'
          ||'<tr>'
          --||'<td align="center">Дата назначения</td>'
          ||'<td align="center">Название лекарственного препарата</td>'
          ||'<td align="center">Лекарственная форма</td>'
          ||'<td align="center">Дозировка</td>'
          ||'<td align="center">Путь введения</td>'
          ||'<td align="center">Кратность</td>'
          ||'<td align="center">Длительность</td>'
          ||'<td align="center">Дата отмены</td>'
          ||'</tr>';
    FOR C IN (SELECT vnaz.fd_naz,get_smid_values.get_fc_char(STAT.PKG_STATUTIL.GET_SMIDID_OWNER(vnaz.fk_smid,'MEDLECH_PREPARAT'),vnaz.fk_id,'MEMO') pr,
                  get_smid_values.get_fc_char(STAT.PKG_STATUTIL.GET_SMIDID_OWNER(vnaz.fk_smid,'MEDLECH_DOZA'),vnaz.fk_id,'EDIT') doz,
                  GET_SMIDNAME(get_smid_values.GET_CBX(STAT.PKG_STATUTIL.GET_SMIDID_OWNER(vnaz.fk_smid,'MEDLECH_INPATH'),vnaz.fk_id,'COMBOBOX')) path,
                  get_smid_values.get_fc_char(STAT.PKG_STATUTIL.GET_SMIDID_OWNER(vnaz.fk_smid,'MED_KRATN'),vnaz.fk_id,'EDIT') krat,
                  get_smid_values.get_fc_char(STAT.PKG_STATUTIL.GET_SMIDID_OWNER(vnaz.fk_smid,'MEDLECH_DLIT'),vnaz.fk_id,'EDIT') dl,
                  DECODE(vnaz.fk_nazsosid,29,fd_run,NULL) otmen
                  ,sm.fc_name
                  FROM vnaz,(SELECT fk_id,fc_name FROM tsmid CONNECT BY PRIOR fk_id=fk_owner START WITH fk_id=STAT.PKG_STATUTIL.get_smidid('PROC_MEDLECH'))sm
                  WHERE vnaz.fk_nazowner=nPriemId AND sm.fk_id=vnaz.fk_smid ORDER BY fd_naz) LOOP
        bExist:=1;
        sHtml:=sHtml||'<tr>'||CR||
                      --'<td align="center">&#160;'||TO_CHAR(C.fd_naz,'dd.mm.yyyy')||'</td>'||CR||
                      '<td align="left">&#160;'||C.pr||'</td>'||CR||
                      '<td align="left">&#160;'||C.fc_name||'</td>'||CR||
                      '<td align="left">&#160;'||C.doz||'</td>'||CR||
                      '<td align="left">&#160;'||C.path||'</td>'||CR||
                      '<td align="left">&#160;'||C.krat||'</td>'||CR||
                      '<td align="left">&#160;'||C.dl||'</td>'||CR||
                      '<td align="center">&#160;'||TO_CHAR(C.otmen,'dd.mm.yyyy')||'</td>'||CR||
                      '</tr>';
    END LOOP;
    sHtml:=sHtml||'</table>';
    IF bExist=1 THEN
     DBMS_LOB.writeappend(clTemp, LENGTH(sHtml),sHtml);
    END IF;
   --план лечения
    bExist:=0;
    sHtml:='<br><b><CENTER>План лечения:</CENTER></b><br><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">'
          ||'<tr>'
          --||'<td align="center">Дата</td>'
          ||'<td align="center">Наименование</td>'
          ||'</tr>';
    FOR C IN (SELECT vnaz.fk_smid,vnaz.fd_run FROM vnaz,(SELECT fk_id FROM tsmid WHERE FK_ID not IN ((SELECT fk_id FROM tsmid CONNECT BY PRIOR fk_id=fk_owner START WITH fk_id=STAT.PKG_STATUTIL.get_smidid('PROC_MEDLECH')UNION (SELECT STAT.PKG_STATUTIL.GET_SMIDID('PROC_DIET') from dual)UNION (select STAT.PKG_STATUTIL.GET_SMIDID('PROC_REZHIM')from dual))) CONNECT BY PRIOR fk_id=fk_owner START WITH fk_id =GET_procid)ob
     WHERE   vnaz.fk_nazowner=nPriemId AND ob.fk_id=vnaz.fk_smid ORDER BY fd_run) LOOP
        bExist:=1;
        sHtml:=sHtml||'<tr>'||CR||
                      --'<td align="center">'||TO_CHAR(C.fd_run,'dd.mm.yyyy')||'</td>'||CR||
                      '<td align="left">&#160;'||get_fullpath(C.fk_smid)||'</td>'||CR||
                      '</tr>';
    END LOOP;
    sHtml:=sHtml||'</table>';
    IF bExist=1 THEN
     DBMS_LOB.writeappend(clTemp, LENGTH(sHtml),sHtml);
    END IF;
    RETURN clTemp;
  END;

  FUNCTION decodeFC_PacID(cFK_PACID IN OUT VARCHAR2) RETURN NUMBER
   IS
    nPacid NUMBER;
  BEGIN
    IF INSTR (cFK_PACID,',') > 0 THEN
      nPacId := TO_NUMBER(SUBSTR (cFK_PACID,1,INSTR (cFK_PACID,',')-1));
      cFK_PACID := SUBSTR (cFK_PACID,INSTR (cFK_PACID,',')+1,LENGTH(cFK_PACID));
    ELSE
      nPacId := TO_NUMBER(cFK_PACID);
      cFK_PACID := null;
    END IF;
    RETURN nPacId;
  END;
  /*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE DoInitPacList(cFK_PACID IN VARCHAR2)--Создаем массив
   IS
    cTemp     VARCHAR2(32767);
    i         NUMBER := 0;
  BEGIN
    cTemp:=cFK_PACID;
    arPacList:=arNullList;
    LOOP
      EXIT WHEN cTemp is null;
      i:=i+1;
      arPacList(i):=decodeFC_PacID(cTemp);--заполняем массив переданными FK_PACID
    END LOOP;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               GetNazMed
  \*------------------------------------------------------------------------------------------------------------------*/
  
/*commented by sill 11.02.06*/  

  /*FUNCTION GetNazMed(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR cNM(pFK_PACID IN NUMBER) IS
      SELECT rownum, tnazmed.*
        FROM tnazmed
       WHERE fk_pacid = pFK_PACID
       order by fd_date;
    CURSOR cNMCont(pFK_NAZMEDID IN NUMBER) IS
      SELECT v$medic.fc_name,
             DECODE(tnazmedlech.colvo, 0, NULL, v$medic.fc_eiid) AS fc_eiid,
             DECODE(tnazmedlech.colvo, 0, NULL, tnazmedlech.colvo) AS colvo
        FROM tnazmedlech, v$medic
       WHERE tnazmedlech.naz_id = pFK_NAZMEDID AND
             v$medic.medicid = tnazmedlech.medic_id;
    cl      CLOB;
    sTmp    VARCHAR2(32767);
    bExists NUMBER := 0;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    if pFK_PACID IS NULL THEN
      sTmp := '<p><h3 align="center">Лист медикаментозных назначений</h3></p>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        sTmp := '<ul>';
        dbms_lob.writeappend(cl, length(sTMp), sTmp);
        FOR nm IN cNM(arPacList(n)) LOOP
          bExists := 1;
          sTmp := '<li><B>' || TO_CHAR(nm.rownum) || ')</B> - ' || to_char(nm.fd_date, 'dd.mm.yyyy');
          FOR NMCont IN cNMCont(nm.fk_id) LOOP
            sTmp := sTmp || ' ' || nmcont.fc_name;
            IF NMCont.colvo IS NOT NULL THEN
              sTmp := sTmp || ' по ' || NMCont.colvo || ' ' || LOWER(NMCont.fc_eiid);
            END IF;
            sTmp := sTmp || ', ';
          END LOOP NMCont;
          sTmp := substr(sTmp, 1, length(sTmp) - 2);
          sTmp := sTmp || ' - ' || nm.FN_PERDAY || ' раз в день, в течение ' || nm.FN_DAY || ' дней. ' || nm.FC_COMMENT;
          if nm.fp_status = get_nazcancel THEN
            sTmp := sTmp || '<br> Отменено ' || to_char(nm.fd_otmena, 'dd.mm.yyyy') || '.' || nm.fc_whyotmena;
            if (nm.fn_vidano != 0) or (nm.fn_vidano is not null) then
              sTmp := sTmp || ', отпущенно ' || nm.fn_vidano || ' приёмов.';
            end if;
          end if;
          dbms_lob.writeappend(cl, length(sTMp), sTmp);
        END LOOP nm;
        IF bExists = 0 THEN
          sTmp := '<p>Не проводились</p>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END IF;
        sTmp := '</ul>';
        dbms_lob.writeappend(cl, length(sTMp), sTmp);
      END LOOP;
    ELSE
      sTmp := '<p><h3 align="center">Лист медикаментозных назначений</h3></p><ul>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR nm IN cNM(pFK_PACID) LOOP
        bExists := 1;
        sTmp := '<li><B>' || TO_CHAR(nm.rownum) || ')</B> - ' || to_char(nm.fd_date, 'dd.mm.yyyy');
        FOR NMCont IN cNMCont(nm.fk_id) LOOP
          sTmp := sTmp || ' ' || nmcont.fc_name;
          IF NMCont.colvo IS NOT NULL THEN
            sTmp := sTmp || ' по ' || NMCont.colvo || ' ' || LOWER(NMCont.fc_eiid);
          END IF;
        sTmp := sTmp || ', ';
        END LOOP NMCont;
        sTmp := substr(sTmp, 1, length(sTmp) - 2);
        sTmp := sTmp || ' - ' || nm.FN_PERDAY || ' раз в день, в течение ' || nm.FN_DAY || ' дней. ' || nm.FC_COMMENT;
        if nm.fp_status = get_nazcancel THEN
          sTmp := sTmp || '<br> Отменено ' || to_char(nm.fd_otmena, 'dd.mm.yyyy') || '.' || nm.fc_whyotmena;
          if (nm.fn_vidano != 0) or (nm.fn_vidano is not null) then
            sTmp := sTmp || ', отпущенно ' || nm.fn_vidano || ' приёмов.';
          end if;
        end if;
        dbms_lob.writeappend(cl, length(sTMp), sTmp);
      END LOOP nm;
      sTmp := '</ul>';
      dbms_lob.writeappend(cl, length(sTMp), sTmp);
      IF bExists = 0 THEN
        sTmp := '<p>Не проводились</p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END IF;
    END IF;
\*    sTmp := '<h3 align="center">Лист медикаментозных назначений</h3><ul>';
    FOR nm IN cNM(pFK_PACID) LOOP
      bExists := 1;
      sTmp := sTmp || '<li><B>' || TO_CHAR(nm.rownum) || ')</B> - ' ||
              to_char(nm.fd_date, 'dd.mm.yyyy'); --||' '||nm.fc_sam||' '||nm.fn_perday||' р/д - '||nm.fn_day||' дн. '||nm.fc_comment||'<br>';
      FOR NMCont IN cNMCont(nm.fk_id) LOOP
        sTmp := sTmp || ' ' || nmcont.fc_name || ' ';
        --        IF NOT NMCont.colvo IS NULL THEN
        --         sTmp:=sTmp||' по '||NMCont.colvo||' '||NMCont.fc_eiid;
        --        END IF;
        sTmp := sTmp || ', ';
      END LOOP NMCont;
      --      sTmp:=substr(sTmp, 1, length(sTmp)-2);
      sTmp := substr(sTmp, 1, length(sTmp) - 2);
      sTmp := sTmp || ' - ' || nm.FN_PERDAY || ' раз в день, в течение ' ||
              nm.FN_DAY || ' дней. ' || nm.FC_COMMENT;
      --      sTmp:=sTmp||nm.FC_COMMENT;
      if nm.fp_status = get_nazcancel THEN
        sTmp := sTmp || '<br> Отменено ' ||
                to_char(nm.fd_otmena, 'dd.mm.yyyy') || '.' ||
                nm.fc_whyotmena;
        if (nm.fn_vidano != 0) or (nm.fn_vidano is not null) then
          sTmp := sTmp || ', отпущенно ' || nm.fn_vidano || ' приёмов.';
        end if;
      end if;
    END LOOP nm;
    sTmp := sTmp||'</ul>';--by TimurLan
    dbms_lob.writeappend(cl, length(sTMp), sTmp);
    IF bExists = 0 THEN
      sTmp := '<p> Не проводились </p>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    END IF;*\
    RETURN cl;
  END;*/

  /*------------------------------------------------------------------------------------------------------------------*\
  |               getFirstPatalogy
  \*------------------------------------------------------------------------------------------------------------------*/
  --Впервые выявленные патологии
  FUNCTION getFirstPatalogy(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR c(pPacID NUMBER) IS
      SELECT fc_name,
             get_yesno(fl_first) FC_FIRST,
             get_patologylech(fk_lech) FC_LECH
        FROM tpatology_first
       WHERE fk_pacid = pPacID;

    cl      CLOB;
    resID   NUMBER;
    sTmp    VARCHAR2(32767);
    bExists NUMBER := 0;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    IF pFK_PACID IS NULL THEN
      sTmp := '<p><h3 align="center">Впервые выявленные патологии</h3></p>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
              '<tr><td align="center"><b>Название патологии:</b></td>' ||
              '<td align="center"><b>Результат лечения:</b></td>' ||
              '<td align="center"><b>Выявлена впервые:</b></td></tr>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR n in 1..arPacList.COUNT LOOP
        sTmp := '<tr><td colspan=3 align="left">';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        sTmp := '</td></tr>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        FOR i IN c(arPacList(n)) LOOP
          bExists := 1;
          sTmp    := '<tr><td align="left">' || i.FC_NAME || '</td>' ||
                     '<td align="center">' || i.FC_LECH || '</td>' ||
                     '<td align="center">' || i.FC_FIRST || '</td></tr>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;
        IF bExists = 0 THEN
          sTmp := '<tr><td colspan=3 align="left">Записи отсутствуют</tr>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END IF;
      END LOOP;
      sTmp := '</table>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    ELSE
      sTmp := '<p><h3 align="center">Впервые выявленные патологии</h3></p>' ||
              '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
              '<tr><td align="center"><b>Название патологии:</b></td>' ||
              '<td align="center"><b>Результат лечения:</b></td>' ||
              '<td align="center"><b>Выявлена впервые:</b></td></tr>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR i IN c(pFK_PACID) LOOP
        bExists := 1;
        sTmp    := '<tr><td align="left">' || i.FC_NAME || '</td>' ||
                   '<td align="center">' || i.FC_LECH || '</td>' ||
                   '<td align="center">' || i.FC_FIRST || '</td></tr>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
      sTmp := '</table>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      IF bExists = 0 THEN
        DBMS_LOB.TRIM(cl, 0);
        sTmp := '<p><h3 align="center">Впервые выявленные патологии</h3></p><p>Записи отсутствуют</p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END IF;
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getEffect
  \*------------------------------------------------------------------------------------------------------------------*/
  --Впервые выявленные патологии
  FUNCTION getEffect(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR c(pPacID NUMBER) IS
      SELECT FP_VID,
             FN_AD_SIST,
             FN_AD_DIST,
             FN_BIOHIM,
             FN_VEM,
             FN_EKG,
             FN_KARD,
             FN_RESERV,
             FN_ANTROP,
             FN_KUR,
             FN_AVGRES
        FROM ASU.TEFFECT
       WHERE FK_PACID = pPacID
       ORDER BY FP_VID;

    cl           CLOB;
    resID        NUMBER;
    sTmp         VARCHAR2(32767);
    bExists      NUMBER := 0;
    pFN_AD_SIST  NUMBER;
    pFN_AD_DIST  NUMBER;
    pFN_BIOHIM   NUMBER;
    pFP_VID      NUMBER;
    pFN_VEM      NUMBER;
    pFN_EKG      NUMBER;
    pFN_KARD     NUMBER;
    pFN_RESERV   NUMBER;
    pFN_ANTROP   NUMBER;
    pFN_KUR      NUMBER;
    pVFN_AD_SIST NUMBER;
    pVFN_AD_DIST NUMBER;
    pVFN_BIOHIM  NUMBER;
    pVFN_VEM     NUMBER;
    pVFN_EKG     NUMBER;
    pVFN_KARD    NUMBER;
    pVFN_RESERV  NUMBER;
    pVFN_ANTROP  NUMBER;
    pVFN_KUR     NUMBER;
    pFN_AVGRES   NUMBER;
    pVFN_AVGRES  NUMBER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h2 align="center">Эффективность лечения</h2></p>' ||
            '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
            '<tr> ' || '  <td> ' ||
            '    <div align="center"><b>Тест:</b></div> ' || '  </td> ' ||
            '  <td> ' ||
            '    <div align="center"><b>Прибытие(гр):</b></div> ' ||
            '  </td> ' || '  <td> ' ||
            '    <div align="center"><b>Выписка(гр):</b></div> ' ||
            '  </td> ' || '</tr>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    OPEN c(pFK_PACID);
    FETCH c
      INTO pFP_VID, pFN_AD_SIST, pFN_AD_DIST, pFN_BIOHIM, pFN_VEM, pFN_EKG, pFN_KARD, pFN_RESERV, pFN_ANTROP, pFN_KUR, pFN_AVGRES;
    FETCH c
      INTO pFP_VID, pVFN_AD_SIST, pVFN_AD_DIST, pVFN_BIOHIM, pVFN_VEM, pVFN_EKG, pVFN_KARD, pVFN_RESERV, pVFN_ANTROP, pVFN_KUR, pVFN_AVGRES;
    CLOSE c;
    sTmp := ' ';
    IF pFN_AD_SIST > -1 OR pVFN_AD_SIST > -1 THEN
      sTmp := '<TR> ' || '  <TD>Сист. арт. давление: </TD>';
      IF pFN_AD_SIST > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pFN_AD_SIST || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      IF pVFN_AD_SIST > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pVFN_AD_SIST || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      sTmp    := sTmp || '</TR>';
      bExists := 1;
    END IF;
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := ' ';
    IF pFN_AD_DIST > -1 OR pVFN_AD_DIST > -1 THEN
      sTmp := '<TR> ' || '  <TD>Диаст. арт. давление: </TD>';
      IF pFN_AD_DIST > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pFN_AD_DIST || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      IF pVFN_AD_DIST > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pVFN_AD_DIST || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      sTmp    := sTmp || '</TR>';
      bExists := 1;
    END IF;
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := ' ';
    IF pFN_BIOHIM > -1 OR pVFN_BIOHIM > -1 THEN
      sTmp := '<TR> ' || '  <TD>Биохимические показатели: </TD>';
      IF pFN_BIOHIM > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pFN_BIOHIM || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      IF pVFN_BIOHIM > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pVFN_BIOHIM || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      sTmp    := sTmp || '</TR>';
      bExists := 1;
    END IF;
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := ' ';
    IF pFN_VEM > -1 OR pVFN_VEM > -1 THEN
      sTmp := '<TR> ' || '  <TD>Велоэргометрия: </TD>';
      IF pFN_VEM > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pFN_VEM || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      IF pVFN_VEM > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pVFN_VEM || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      sTmp    := sTmp || '</TR>';
      bExists := 1;
    END IF;
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := ' ';
    IF pFN_EKG > -1 OR pVFN_EKG > -1 THEN
      sTmp := '<TR> ' || '  <TD>Электрокардиограмма: </TD>';
      IF pFN_EKG > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pFN_EKG || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      IF pVFN_EKG > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pVFN_EKG || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      sTmp    := sTmp || '</TR>';
      bExists := 1;
    END IF;
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := ' ';
    IF pFN_KARD > -1 OR pVFN_KARD > -1 THEN
      sTmp := '<TR> ' || '  <TD>Кардиометрия: </TD>';
      IF pFN_KARD > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pFN_KARD || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      IF pVFN_KARD > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pVFN_KARD || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      sTmp    := sTmp || '</TR>';
      bExists := 1;
    END IF;
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := ' ';
    IF pFN_RESERV > -1 OR pVFN_RESERV > -1 THEN
      sTmp := '<TR> ' || '  <TD>Резервы организма: </TD>';
      IF pFN_RESERV > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pFN_RESERV || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      IF pVFN_RESERV > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pVFN_RESERV || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      sTmp    := sTmp || '</TR>';
      bExists := 1;
    END IF;
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := ' ';
    IF pFN_ANTROP > -1 OR pVFN_ANTROP > -1 THEN
      sTmp := '<TR> ' || '  <TD>Антропометр. данные: </TD>';
      IF pFN_ANTROP > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pFN_ANTROP || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      IF pVFN_ANTROP > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pVFN_ANTROP || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      sTmp    := sTmp || '</TR>';
      bExists := 1;
    END IF;
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := ' ';
    IF pFN_KUR > -1 OR pVFN_KUR > -1 THEN
      sTmp := '<TR> ' || '  <TD>Курение: </TD>';
      IF pFN_KUR > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pFN_KUR || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      IF pVFN_KUR > -1 THEN
        sTmp := sTmp || '<TD ALIGN="CENTER">' || pVFN_KUR || '</TD>';
      ELSE
        sTmp := sTmp || '<TD ALIGN="CENTER">&nbsp;</TD>';
      END IF;
      sTmp    := sTmp || '</TR>';
      bExists := 1;
    END IF;
    sTmp := sTmp || '</TABLE>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := '<P><B>Максимальное значение                   1</B></P>';
    sTmp := sTmp ||
            '<P><B>Максимальное значение                   4</B></P>';
    sTmp := sTmp || '<P><B>Индекс здоровья при поступлении        </B>' ||
            pFN_AVGRES || '</P>';
    sTmp := sTmp || '<P><B>Индекс здоровья при выписке            </B>' ||
            pVFN_AVGRES || '</P>';
    sTmp := sTmp || '<P><B>Показатель эффективности               </B>' ||
            TO_CHAR((pFN_AVGRES * 100) / pVFN_AVGRES, '999.99') || '%</P>';
    /*    FOR i IN c(pFK_PACID)
    LOOP
      bExists := 1;
      sTmp:='<tr> ' ||
            '  <td> ' ||
            '    <div align="left">'||i.FC_NAME||'</div> ' ||
            '  </td> ' ||
            '  <td> ' ||
            '    <div align="center">'||i.FC_LECH||'</b></div> ' ||
            '  </td> ' ||
            '  <td> ' ||
            '    <div align="center">'||i.FC_FIRST||'</b></div> ' ||
            '  </td> ' ||
            '</tr>';
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    END LOOP;*/
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    IF bExists = 0 THEN
      DBMS_LOB.TRIM(cl, 0);
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               DoZaklText
  \*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE DoZaklText(pFK_PACID IN NUMBER)
   IS -- Modified by TimurLan
    sTmp    VARCHAR2(32767);
    clTemp  CLOB;
    cl      CLOB;
    nClobID INTEGER;
    CURSOR cGetZaklClob(pFK_PACID in number) IS
      SELECT fc_clob
        FROM tclobs, tepikriz
       WHERE fk_pacid = pFK_PACID AND tclobs.fk_id = tepikriz.fk_clobid;
    CURSOR cLast IS
      SELECT get_ibrazdeltext(fk_tibid, get_smidowner(get_synid('TECHBOLEZNI')),'') AS fc_comment
        FROM ttechbolezni
       WHERE fk_pacid = pFK_PACID
         AND fp_stom = 0
       ORDER BY ROWNUM DESC;
  BEGIN
    --DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    OPEN cGetEpikrizClob(pFK_PACID);
    FETCH cGetEpikrizClob
      INTO clTemp;
    CLOSE cGetEpikrizClob;
    IF clTemp IS NULL THEN
      OPEN cLast;
      FETCH cLast
        INTO sTmp;
      CLOSE cLast;
      IF sTmp IS NOT NULL THEN
        DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
        DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
        INSERT INTO tclobs
          (fk_id, fc_clob)
        VALUES
          (-1, cl)
        RETURNING FK_ID INTO nClobID;
        INSERT INTO TEPIKRIZ
          (FK_PACID, FK_CLOBID, FP_EPIKRIZ)
        VALUES
          (pFK_PACID, nClobID, 1);
      END IF;
    ELSE
      null;
    END IF;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getIbHeader
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getIbHeader(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
    s VARCHAR2(32767);

    CURSOR cGroupAndSex IS
      --SELECT tgroup.fc_name || '.  Пол: ' ||
      SELECT 'Пол: ' ||
             get_lower(get_pacsex(tkarta.fk_id)) AS group_and_sex,
             fc_fam,
             fc_im,
             fc_otch,
             fc_put,
             PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(TKARTA.FK_ID) fc_rabota
        FROM /*tgroup, */tkarta
       WHERE /*tkarta.fk_groupid = tgroup.fk_id AND */tkarta.fk_id = pFK_PACID
      UNION
      --SELECT tgroup.fc_name || '.  Пол: ' ||
      SELECT 'Пол: ' ||
             get_lower(get_AMBsex(TAMBULANCE.fk_id)) AS group_and_sex,
             fc_fam,
             fc_im,
             fc_otch,
             fc_put,
             fc_rabota
        FROM /*tgroup, */TAMBULANCE
       WHERE /*TAMBULANCE.fk_groupid = tgroup.fk_id AND*/
             TAMBULANCE.fk_id = pFK_PACID;
    cursor cKont is
      select nvl(count(p.fk_id), 0) as kont
        from tkarta k, tprizn p
       where p.fk_id = k.fk_prizn and fc_name like 'Кон%' and
             k.fk_id = pFK_PACID;
    /*union
    select nvl(count(p.fk_id),0) as kont from tambulance k, tprizn p
    where p.fk_id=k.fk_prizn
    and fc_name like 'Кон%'
    and k.fk_id=pFK_PACID;*/

    sGroupAndSex VARCHAR2(400);
    sFam         VARCHAR2(400);
    sIM          VARCHAR2(400);
    sOtch        VARCHAR2(400);
    sPut         VARCHAR2(400);
    sFC_RABOTA   VARCHAR2(400);
    nKont        NUMBER;
    sKont        VARCHAR2(400);
    function getFlurografText(pPacID in number) return varchar2 --added by TimurLan
     is
      cursor c1 is
        SELECT FN_FLUR,
               FD_FLUR,
               DECODE(FL_FLUR,
                      0,
                      'Без патологии.',
                      1,
                      'Патология.',
                      'нет данных.') AS FL_FLUR,
               FC_FLUR
          FROM TKARTA
         WHERE FK_ID = pPACID;
      sTmp VARCHAR2(32767);
    begin
      FOR p in c1 LOOP
        if p.FN_FLUR is null then
          sTmp := 'Нет данных.';
          EXIT;
        end if;
        sTmp := PKG_REGIST_PACFUNC.REPLACE_SPACES('№' || p.FN_FLUR ||
                                                  ' от ' ||
                                                  TO_CHAR(p.FD_FLUR,
                                                          'dd.mm.yyyy') ||
                                                  '. Заключение: ' ||
                                                  p.FL_FLUR || ' ' ||
                                                  p.FC_FLUR);
      END LOOP;
      RETURN sTmp;
    end;
  BEGIN
    nKont := 0;
    OPEN cGroupAndSex;
    FETCH cGroupAndSex
      INTO sGroupAndSex, sFam, sIM, sOtch, sPut, sFC_RABOTA;
    CLOSE cGroupAndSex;
    OPEN cKont;
    fetch cKOnt
      into nKont;
    close cKont;
    if nKont > 0 then
      sKont := 'Реабилитационный курс лечения';
    end if;
    if nKont = 0 then
      sKont := 'Путевка';
    end if;
    s := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||
         '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||
         'xmlns:w="urn:schemas-microsoft-com:office:word"'||
         'xmlns="http://www.w3.org/TR/REC-html40">'||
         '<head>'||
         '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
         '<meta name=ProgId content=Word.Document>'||
         '<title>История болезни № '|| GET_IB(pFK_PACID) ||
         '</title><body>'||
         '<table width="100%" border="0" height="372">' ||
         '<tr> ' ||
         '  <td colspan="4"><div align="right"><font size="-3" face="Times New Roman, Times, serif">Учетная форма 3-кур <BR>Утв. МЗ СССР 02.06ю82г. №522</font></div><hr>' ||
         '  </td></tr>' ||
         '<tr>  ' ||
         '  <td colspan="4">  ' ||
        --        '    <div align="center"><b><font face="Times New Roman, Times, serif" size=+2>Cанаторий</font></b></div> ' ||
        --        '<div align="center"><font face="Times New Roman, Times, serif" size=+4> "' ||
        --        pkg_smini.readstring ('config', 's_name', 'Не указан') ||
        --        '"  </font><div align="center"></td> ' ||
        --        '<tr>  ' ||
        --        '  <td colspan="4">  ' ||
        --        '    <div align="center"><b><font face="Times New Roman, Times, serif" size = +2>&nbsp' ||
        --        '</font></b></div> ' ||
        --        '  </td> ' ||
        --        '</tr> ' ||
         '<!--<img src=c://asu/000.jpg></img>--><b style=''mso-bidi-font-weight:normal''><center><span style=''font-size:12.0pt;' ||
         ' color:navy''>Ханты-Мансийский автономный округ</b></p></center>' ||
         ' <p class=MsoNormal align=center style=''margin-top:0cm;margin-right:115.95pt; margin-bottom:0cm;margin-left:127.6pt;margin-bottom:.0001pt;text-align:center;' ||
         ' text-indent:-1.0cm;line-height:150%;mso-outline-level:1''><b style=''mso-bidi-font-weight: normal''><i style=''mso-bidi-font-style:normal''><span style=''font-size:12.0pt;' ||
         ' mso-bidi-font-size:10.0pt;line-height:150%;color:navy''>ООО</span></i></b><b style=''mso-bidi-font-weight:normal''><span style=''font-size:12.0pt;mso-bidi-font-size: ' ||
         ' 10.0pt;line-height:150%;color:navy''>ОКРУЖНАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА</i></span></b></p>' ||
        --        ' <p class=MsoNormal align=center style=''margin-top:0cm;margin-right:115.85pt; margin-bottom:0cm;margin-left:127.6pt;margin-bottom:.0001pt;text-align:center;'||
        --        ' text-indent:-1.0cm''><span style=''font-size:12.0pt;mso-bidi-font-size:10.0pt''><o:p>&nbsp;</o:p></span></p>'||
         ' <p class=MsoNormal align=center style=''margin-top:0cm;margin-right:115.85pt; ' ||
         ' margin-bottom:0cm;margin-left:127.6pt;margin-bottom:.0001pt;text-align:center; ' ||
         ' text-indent:-1.0cm;mso-outline-level:1''><b style=''mso-bidi-font-weight:normal''><span style=''font-size:14.0pt;mso-bidi-font-size:10.0pt;color:red''>государственное учреждение здравоохранения<a ' ||
         ' name="_Hlt483380721">П</a>Р<a name="_Hlt483380571">О</a><a name="_Hlt483380567">Ф</a>И<a name="_Hlt483380561">Л</a>АКТОРИЙ</span></b><b style=''mso-bidi-font-weight: ' ||
         ' normal''><i style=''mso-bidi-font-style:normal''><span style=''font-size:16.0pt; mso-bidi-font-size:10.0pt;color:gray''><o:p></o:p></span></i></b></p>' ||
         '</td></tr> ' || '<tr>  ' || '  <td colspan="4">  ' ||
         '    <p align="center"><b><font face="Times New Roman, Times, serif" size=+2><br>ИСТОРИЯ БОЛЕЗНИ №  ' ||
         get_ib(pFK_PACID) || '    </font></b> ' || '    </p> ' ||
         '  </td> ' || '</tr> ' ||
         '<tr>  ' ||
         '  <td width="28%"><font face="Times New Roman, Times, serif">&nbsp;</font></td> ' ||
         '  <td width="21%"><font face="Times New Roman, Times, serif">&nbsp;</font></td> ' ||
         '  <td width="4%"><font face="Times New Roman, Times, serif">&nbsp;</font></td> ' ||
         '  <td width="47%"><font face="Times New Roman, Times, serif"><b><i>' || sGroupAndSex || ' </i></b></font></td> ' ||
         '</tr> ' ||
         /*'  <td colspan="2"><font face="Times New Roman, Times, serif"><b>&nbsp</b></font></td> ' ||
         '  <td colspan="2"> ' ||
        --        '    <table width="99%" border="1" cellpadding="1" cellspacing="0" bordercolorlight="#000000" bordercolordark="#000000"> ' ||
        --        '    <table width="99%"> ' ||
        --        '     <tr> ' ||
        --        '      <td> ' ||
         '      <font face="Times New Roman, Times, serif"><b> ' ||
         '        <i> ' || sGroupAndSex || '     </i></b></font> ' ||
        --        '      </td> ' ||
        --        '     </tr> ' ||
        --        '    </table> ' ||
         '  </td>  ' || '</tr> ' ||
        --      '<tr>  ' ||
        --        '  <td width="100%" colspan="4">&nbsp;</td> ' ||
        --        '</tr> ' ||*/
         '<tr>  ' ||
         '  <td width="28%"><font face="Times New Roman, Times, serif">Фамилия:</font></td> ' ||
         '  <td width="21%"><font face="Times New Roman, Times, serif"> ' ||
         '         <B> ' || sFam || '                    </B> ' ||
         '                  </font></td> ' ||
         '  <td width="4%"><font face="Times New Roman, Times, serif"></font></td> ' ||
         '  <td width="47%"><font face="Times New Roman, Times, serif">' ||
         sKont || ' №: ' || '                    <B> ' || sPut ||
         '                    </B> ' || '                  </font></td> ' ||
         '</tr> ' || '<tr>  ' ||
         '  <td width="28%"><font face="Times New Roman, Times, serif">Имя:</font></td> ' ||
         '  <td width="21%"><font face="Times New Roman, Times, serif"> ' ||
         '                    <B> ' || sIM || '                    </B> ' ||
         '                  </font></td> ' ||
         '  <td width="4%"><font face="Times New Roman, Times, serif"></font></td> ' ||
         '  <td width="47%"><font face="Times New Roman, Times, serif">Дата поступления: ' ||
         '                    <B> ' ||
         TO_CHAR(do_prybdate(pFK_PACID), 'dd.mm.yyyy') ||
         '                     </B> ' || '                  </font></td> ' ||
         '</tr> ' || '<tr>  ' ||
         '  <td width="28%"><font face="Times New Roman, Times, serif">Отчество:</font></td> ' ||
         '  <td width="21%"><font face="Times New Roman, Times, serif"> ' ||
         '                    <B> ' || sOtch || '                    </B> ' ||
         '                  </font></td> ' ||
         '  <td width="4%"><font face="Times New Roman, Times, serif"></font></td> ' ||
         '  <td width="47%"><font face="Times New Roman, Times, serif">Выписан: ' ||
         '                     <B> ' ||
        --        TO_CHAR (do_vybdate (pFK_PACID), 'dd.mm.yyyy') ||
         TO_CHAR(get_pacplanoutcome(pFK_PACID), 'dd.mm.yyyy') ||
         '                     </B> ' || '                  </font></td> ' ||
         '</tr> ' || '<tr>  ' ||
         '  <td width="28%"><font face="Times New Roman, Times, serif">Возраст:</font></td> ' ||
         '  <td width="21%"><font face="Times New Roman, Times, serif"> ' ||
         '                     <B> ' ||
         get_strage(get_pacageonvyb(pFK_PACID)) ||
         '                     </B> ' || '                  </font></td> ' ||
         '  <td width="4%"><font face="Times New Roman, Times, serif"></font></td> ' ||
         '  <td width="47%"><font face="Times New Roman, Times, serif">Проведено на лечении: ' ||
         '                     <B> ' || get_pacdays(pFK_PACID) ||
         '                 к.дн. ' || '                     </B> ' ||
         '                  </font></td> ' || '</tr> ' || '<tr>  ' ||
         '  <td width="28%"><font face="Times New Roman, Times, serif">Место работы:</font></td> ' ||
         '  <td width="21%"><font face="Times New Roman, Times, serif"> ' ||
         '                     <B> ' || sFC_RABOTA ||
         '                     </B> ' || '                  </font></td> ' ||
         '  <td width="4%"><font face="Times New Roman, Times, serif"></font></td> ' ||
         '  <td width="47%"><font face="Times New Roman, Times, serif"><b>' ||
         get_otdname(get_vrachotd(get_pacvrach(pFK_PACID))) ||
         '.</b> Проживает в палате:  ' || get_pacfcpalata(pFK_PACID) ||
         '</font></td> ' || '</tr> ' ||
        --        '<tr>  ' ||
        --        '  <td width="28%"><font face="Times New Roman, Times, serif"></font></td> ' ||
        --        '  <td width="21%"><font face="Times New Roman, Times, serif"></font></td> ' ||
        --        '  <td width="4%"><font face="Times New Roman, Times, serif"></font></td> ' ||
        --        '  <td width="47%"><font face="Times New Roman, Times, serif">&nbsp;' ||
        --        '                    <B> &nbsp;' ||
        --        TO_CHAR (get_pacplanoutcome (pFK_PACID), 'dd.mm.yyyy') ||
        /*        '  <td width="47%"><font face="Times New Roman, Times, serif">Выписан:  ' ||
                '                    <B> &nbsp;' ||
                TO_CHAR (get_pacplanoutcome (pFK_PACID), 'dd.mm.yyyy') ||
        */
        --        '                    </B> ' ||
        --        '                  </font></td> ' ||
        --        '</tr> ' ||
         '<tr>  ' ||
         '  <td width="28%"><font face="Times New Roman, Times, serif">Домашний адрес:</font></td> ' ||
         '  <td colspan="3"><font face="Times New Roman, Times, serif"> ' ||
         '                    <B> ' ||
         PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(pFK_PACID) ||
         '                    </B>  ' || '                  </font></td> ' ||
         '</tr> ' || '<tr>  ' ||
         '  <td width="28%"><font face="Times New Roman, Times, serif">Рентгенологическое исследование:</font></td> ' ||
         '  <td colspan="3"><font face="Times New Roman, Times, serif"> ' ||
         '                    <B> ' || getFlurografText(pFK_PACID) ||
         '                    <B> ' || '                  </font></td> ' ||
         '</tr> ' || '<tr>  ' ||
         '  <td width="28%"><font face="Times New Roman, Times, serif">Лечащий врач:</font></td> ' ||
         '  <td colspan="3"><font face="Times New Roman, Times, serif"> ' ||
         '                    <B> ' || do_vrachfio(get_pacvrach(pFK_PACID)) ||
         '                    <B> ' || '                  </font></td> ' ||
         '</tr> ' || '</table> ';
    RETURN s;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getIbDiags
  \*------------------------------------------------------------------------------------------------------------------*/
    FUNCTION DO_DIAGBYTYPE (/*pacid IN NUMBER, */ptype IN NUMBER, bMain IN NUMBER, pNazID IN NUMBER DEFAULT -1, pSHOWPRINT in number default 0)
      RETURN VARCHAR2
    IS
      CURSOR c1(pacid IN NUMBER, ptype IN NUMBER, bMain IN NUMBER, pNazID IN NUMBER DEFAULT -1, pSHOWPRINT in number default 0)
      IS
        SELECT fk_id, fl_first, fd_date
          FROM tdiag
         WHERE fk_pacid = pacid
           AND fl_main = bMain
           AND fp_type = ptype
           AND FK_NAZID = pNazID
           AND FL_SHOWIB>=pSHOWPRINT;
      s        VARCHAR2(32767);
      diagid   NUMBER;
      cTemp    VARCHAR2(32767);
    BEGIN
      FOR n in 1..arPacList.COUNT LOOP
        FOR i IN c1(arPacList(n), ptype, bMain, pNazID, pSHOWPRINT)
        LOOP
          cTemp := do_diag (i.fk_id);
          s := s || '<BR><B>' || TO_CHAR(i.fd_date,'dd.mm.yyyy') || '</B> ' || REPLACE (InitCap( SUBSTR (cTemp,1,INSTR (cTemp,' ')-1) ) || LOWER(SUBSTR (cTemp,INSTR (cTemp,' '),LENGTH(cTemp))), '..', '.');
          if i.fl_first=1 then
            s:=s||'<b> (выявлен впервые) </b>';
          end if;
        END LOOP;
      END LOOP;
      RETURN s;
    END;
  FUNCTION getIbDiags(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    sTmp   VARCHAR2(32767);
    cl     CLOB;
    clTemp CLOB;
    cTemp  VARCHAR2(32767);
    dTemp  DATE;
    CURSOR c IS
      SELECT '<p>' || TO_CHAR(fd_date, 'dd.mm.yyyy') || ' специалист ' ||
             do_vrachfio(fk_vrachid) || '</p>' AS fc_vrach
        FROM tdiag
       WHERE fk_pacid = pFK_PACID AND fp_type = 2 AND fl_main = 1;
    FUNCTION DO_INTERRDIAG RETURN VARCHAR2
    IS
      sTmp     VARCHAR2(32767);
      diagid   NUMBER;
      cTemp    VARCHAR2(32767);
      CURSOR c1(PACID IN NUMBER)
       IS
        SELECT fk_id,fd_date,do_vrachfio(fk_vrachid) as fc_vrach
          FROM ttechbolezni
         WHERE fk_pacid = PACID
      ORDER BY fd_date;
    BEGIN
      --FOR n in 1..arPacList.COUNT LOOP
        FOR i IN c1 (/*arPacList(n)*/pFK_PACID) LOOP
          cTemp := asu.do_diagbytype(pFK_PACID, 3, 0, i.fk_id, 1);
          dTemp := do_diagbytypedate(/*arPacList(n)*/pFK_PACID, 3, 0, i.fk_id);
          IF cTemp IS NOT NULL THEN
            IF SUBSTR(sTmp, LENGTH(sTmp), 1) <> '>' THEN
              sTmp := sTmp || ', ';
            END IF;
            sTmp := sTmp || '<br>' || cTemp /*|| '<br>'*/ || to_char(dTemp, ' (dd.mm.yyyy') || ' - Специалист <u>' || i.fc_vrach || '</u>)';
          END IF;
        END LOOP;
      --END LOOP;
      RETURN sTmp;
    END;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);

    if pFN_MODE = 0 then
      sTmp := '<p><b>Диагноз с места отбора:</b><br><u>Основной:</u> ' || asu.do_diagbytype(pFK_PACID, 1, 1, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<br><u>Сопутствующий:</u> ' || '' || asu.do_diagbytype(pFK_PACID, 1, 0, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<p><b>Диагноз при поступлении:</b><br><u>Основной:</u> ' || asu.do_diagbytype(pFK_PACID, 6, 1, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<br><u>Сопутствующий:</u> ' || '' || asu.do_diagbytype(pFK_PACID, 6, 0, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<p><b>Клинический диагноз:</b><br>' || '<u>Основной:</u> ' || asu.do_diagbytype(pFK_PACID, 2, 1, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<br><u>Сопутствующий:</u> ' || '    ' || asu.do_diagbytype(pFK_PACID, 2, 0, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<p><b>Клинический заключительный диагноз:</b><br>' || '<u>Основной:</u> ' || asu.do_diagbytype(pFK_PACID, 5, 1, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<br><u>Сопутствующий:</u> ' || '    ' || asu.do_diagbytype(pFK_PACID, 5, 0, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      --sTmp := '<p><b>Интеркуррентные заболевания:</b>' || DO_INTERRDIAG;
      --DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    else
      sTmp := '<p><b>Диагноз с места отбора:</b><br><u>Основной:</u> ' || do_diagbytype(/*pFK_PACID, */1, 1, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<br><u>Сопутствующий:</u> ' || '' || do_diagbytype(/*pFK_PACID, */1, 0, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<p><b>Диагноз при поступлении:</b><br><u>Основной:</u> ' || do_diagbytype(/*pFK_PACID, */6, 1, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<br><u>Сопутствующий:</u> ' || '' || do_diagbytype(/*pFK_PACID, */6, 0, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<p><b>Клинический диагноз:</b><br>' || '<u>Основной:</u> ' || do_diagbytype(/*pFK_PACID, */2, 1, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<br><u>Сопутствующий:</u> ' || '    ' || do_diagbytype(/*pFK_PACID, */2, 0, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<p><b>Клинический заключительный диагноз:</b><br>' || '<u>Основной:</u> ' || do_diagbytype(/*pFK_PACID, */5, 1, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

      sTmp := '<br><u>Сопутствующий:</u> ' || '    ' || do_diagbytype(/*pFK_PACID, */5, 0, -1, 1);
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    end if;


/*    sTmp := null;
    OPEN c;
    FETCH c
      INTO sTmp;
    CLOSE c;
    IF sTmp is not null THEN
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    END IF;*/

 /* sTmp := '<br><b>Интеркуррентные заболевания:</b><br>';
    FOR i IN (SELECT do_diagbytype(pFK_PACID, 3, 0, fk_id, 1) AS fc_diag,
                     fd_date,
                     do_vrachfio(fk_vrachid) as fc_vrach,
                     do_diagbytypedate(pFK_PACID, 3, 0, fk_id) as fd_data
                FROM ttechbolezni
               WHERE fk_pacid = pFK_PACID
               ORDER BY fd_date) LOOP
      IF i.fc_diag IS NOT NULL THEN
        IF SUBSTR(sTmp, LENGTH(sTmp), 1) <> '>' THEN
          sTmp := sTmp || ', ';
        END IF;
        sTmp := sTmp || i.fc_diag || '<br>' || to_char(i.fd_data, 'dd.mm.yyyy') || ' - Врач <u>' || i.fc_vrach || '</u>';
      END IF;
    END LOOP;
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);*/
    begin
      SELECT '<p><b>Результаты лечения:</b><u>' ||
             DECODE(fp_reslech,
                    0, 'значительное улучшение',
                    1, 'улучшение',
                    2, 'без улучшения',
                    3, 'ухудшение') || '</u></p>'
        INTO sTmp
        FROM tkarta
       WHERE fk_id = pFK_PACID;
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    exception
      when no_data_found then
        null;
      when others then
        raise;
    end;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getRazdelIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getRazdelIbText(pFK_PACID IN NUMBER DEFAULT NULL,
                           nStartID  IN NUMBER,
                           sCaption  IN VARCHAR2,
                           sDefault  IN VARCHAR2) RETURN CLOB IS
    sTmp  VARCHAR2(32767);
    sTxt  VARCHAR2(32767);
    cl    CLOB;
    bNull BOOLEAN := TRUE;

    CURSOR c
     IS
      SELECT /*+INDEX_ASC(TSMID TSMID_BY_OWNER_ORDER)*/
             DECODE(fl_showprint, 1, (LPAD(' ', 2 * (LEVEL - 1)) || fc_name) || ': ', '') AS Name, fk_id
        FROM tsmid
       WHERE fc_type = 'FORM'
       START WITH fk_owner = nStartID
     CONNECT BY PRIOR fk_id = fk_owner;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h3 align = "center">' || sCaption || '</h3></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    if pFK_PACID IS NULL THEN
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        FOR i IN c LOOP
          IF i.name IS NOT NULL THEN
            sTxt := TRIM(get_ibformvalue(arPacList(n), i.fk_id, sDefault));
            IF sTxt IS NOT NULL THEN
              sTmp  := '<B>' || i.name || '</B>' || sTxt ||'<br>';
              bNull := FALSE;
              DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
            END IF;
          ELSE
            sTxt := get_ibformvalue(arPacList(n), i.fk_id, '');
            IF sTxt IS NOT NULL THEN
              sTmp  := sTxt || '<br>';
              bNull := FALSE;
              DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
            END IF;
          END IF;
        END LOOP;
      END LOOP;
    else
      FOR i IN c LOOP
        IF i.name IS NOT NULL THEN
          sTxt := TRIM(get_ibformvalue(pFK_PACID, i.fk_id, sDefault));
          IF sTxt IS NOT NULL THEN
            sTmp  := '<B>' || i.name || '</B>' || sTxt ||'<br>';
            bNull := FALSE;
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
          END IF;
        ELSE
          sTxt := get_ibformvalue(pFK_PACID, i.fk_id, '');
          IF sTxt IS NOT NULL THEN
            sTmp  := sTxt || '<br>';
            bNull := FALSE;
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
          END IF;
        END IF;
      END LOOP;
    end if;
    IF bNull THEN
      sTmp := 'Не заполнено';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               GetAntropIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION GetAntropIbText(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
    CURSOR cPryb IS
      SELECT FK_ID,
             FK_PACID,
             FN_ROST,
             FN_VES,
             FN_IDEAL,
             FN_PROC,
             FN_KLET,
             FN_DLEFT,
             FN_DRIGHT,
             FN_SPIRO,
             FN_PULS,
             FN_SISTO,
             FN_DIASTO
        FROM ASU.TANTROP
       WHERE fk_pacid = pFK_PACID AND fk_vid = 0;

    CURSOR cVyb IS
      SELECT FK_ID,
             FK_PACID,
             FN_ROST,
             FN_VES,
             FN_IDEAL,
             FN_PROC,
             FN_KLET,
             FN_DLEFT,
             FN_DRIGHT,
             FN_SPIRO,
             FN_PULS,
             FN_SISTO,
             FN_DIASTO
        FROM ASU.TANTROP
       WHERE fk_pacid = pFK_PACID AND fk_vid = 1;

    sTmp  VARCHAR2(32767);
    rPryb cPryb%ROWTYPE;
    rVyb  cVyb%ROWTYPE;
  BEGIN
    OPEN cPryb;
    FETCH cPryb
      INTO rPryb;
    CLOSE cPryb;
    OPEN cVyb;
    FETCH cVyb
      INTO rVyb;
    CLOSE cVyb;
    sTmp := '<h3 align="center"> Антропометрические данные </h3> ' ||
            '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
            '  <tr> ' || '    <td width="42%"> ' ||
            '      <div align="center"><b>Наименование</b></div></td> ' ||
            '    <td width="27%"><div align="center"><b>При поступлении</b></div></td> ' ||
            '    <td width="31%"><div align="center"><b>При выписке</b></div></td> ' ||
            '  </tr> ' || '  <tr> ' || '    <td width="42%">Рост</td> ' ||
            '    <td width="27%"> ' || '    <div align="center"> ' ||
            rPryb.fn_rost || '     &nbsp </td> ' || '    </div> ' ||
            '    <td width="31%"> ' || '    <div align="center"> ' ||
            rVyb.fn_rost || '     &nbsp </td> ' || '    </div> ' ||
            '  </tr> ' || '  <tr> ' || '    <td width="42%">Вес</td> ' ||
            '    <td width="27%"> ' || '    <div align="center"> ' ||
            rPryb.fn_ves || '     &nbsp </td> ' || '    </div> ' ||
            '    <td width="31%"> ' || '    <div align="center"> ' ||
            rVyb.fn_ves || '     &nbsp </td> ' || '    </div> ' ||
            '  </tr> ' || '  <tr> ' ||
            '    <td width="42%">% от долженствующего</td> ' ||
            '    <td width="27%"> ' || '    <div align="center"> ' ||
            rPryb.fn_proc || '     &nbsp </td> ' || '    </div> ' ||
            '    <td width="31%"> ' || '    <div align="center"> ' ||
            rVyb.fn_proc || '     &nbsp </td> ' || '    </div> ' ||
            '  </tr> ' ||
           /*            '  <tr> ' ||
                       '    <td width="42%">Окружность грудной клетки</td> ' ||
                       '    <td width="27%"> ' ||
                       '    <div align="center"> ' ||
                       rPryb.fn_klet ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '    <td width="31%"> ' ||
                       '    <div align="center"> ' ||
                       rVyb.fn_klet ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '  </tr> ' ||
                       '  <tr> ' ||
                       '    <td width="42%">Динамометрия левой руки</td> ' ||
                       '    <td width="27%"> ' ||
                       '    <div align="center"> ' ||
                       rPryb.fn_dleft ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '    <td width="31%"> ' ||
                       '    <div align="center"> ' ||
                       rVyb.fn_dleft ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '  </tr> ' ||
                       '  <tr> ' ||
                       '    <td width="42%">Динамометрия правой руки</td> ' ||
                       '    <td width="27%"> ' ||
                       '    <div align="center"> ' ||
                       rPryb.fn_dright ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '    <td width="31%"> ' ||
                       '    <div align="center"> ' ||
                       rVyb.fn_dright ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '  </tr> ' ||
                       '  <tr> ' ||
                       '    <td width="42%">Спирометрия</td> ' ||
                       '    <td width="27%"> ' ||
                       '    <div align="center"> ' ||
                       rPryb.fn_spiro ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '    <td width="31%"> ' ||
                       '    <div align="center"> ' ||
                       rVyb.fn_spiro ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '  </tr> ' ||
                       '  <tr> ' ||
                       '    <td width="42%">Пульс</td> ' ||
                       '    <td width="27%"> ' ||
                       '    <div align="center"> ' ||
                       rPryb.fn_puls ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '    <td width="31%"> ' ||
                       '    <div align="center"> ' ||
                       rVyb.fn_puls ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '  </tr> ' ||
                       '  <tr> ' ||
                       '    <td width="42%">Систолическое давление</td> ' ||
                       '    <td width="27%"> ' ||
                       '    <div align="center"> ' ||
                       rPryb.fn_sisto ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '    <td width="31%"> ' ||
                       '    <div align="center"> ' ||
                       rVyb.fn_sisto ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '  </tr> ' ||
                       '  <tr> ' ||
                       '    <td width="42%">Диастолическое давление</td> ' ||
                       '    <td width="27%"> ' ||
                       '    <div align="center"> ' ||
                       rPryb.fn_diasto ||
                       '     &nbsp </td> ' ||
                       '    </div> ' ||
                       '    <td width="31%"> ' ||
                       '     <div align="center"> ' ||
                       rVyb.fn_diasto ||
                       '     &nbsp </td> ' ||
                       '     </div> ' ||
                       '    </td> ' ||
                       '  </tr> ' ||*/
            '</table> ';
    RETURN sTmp;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getNazListIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getNazListIbText(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR c(pFK_PACID IN NUMBER) IS
      SELECT /*+rule*/
       TO_CHAR(fd_naz, 'dd.mm.yyyy') AS fd_naz,
       TO_CHAR(fd_run, 'dd.mm.yyyy') AS fd_run,
       get_fullpath(fk_smid)||DECODE(fc_remark,NULL,'',', '||fc_remark) AS naim
        FROM vnaz
       WHERE fk_pacid = pFK_PACID
         AND fk_nazsosid = 1
         AND GET_PROCID NOT IN
             (SELECT /*+rule*/ fk_id
                FROM tsmid
               START WITH fk_id = vnaz.fk_smid
             CONNECT BY PRIOR fk_owner = fk_id)
       ORDER BY fd_naz;
    sTmp    VARCHAR2(32735);
    cl      CLOB;
    BExists NUMBER := 0;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    if pFK_PACID IS NULL THEN
      sTmp := '<p><h3 align = "center">Лист диагностических назначений</h3></p>'||
              '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
              '<tr><td align="center"><b>Дата назначения</b>' ||
              '</td><td align="center"><b>Дата выполнения</b>' ||
              '</td><td align="center"><b>Наименование</b>' ||
              '</td></tr>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR n in 1..arPacList.COUNT LOOP
        sTmp := '<tr><td colspan=3 align="left">';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        sTmp := '</td></tr>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        FOR i IN c(arPacList(n)) LOOP
          bExists := 1;
          sTmp    := '<tr><td align="center">' || i.fd_naz || '</td> ' ||
                     '<td align="center">' || i.fd_run || '</td>' ||
                     '<td align="left">' || i.naim || '</td></tr> ';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;
        IF bExists = 0 THEN
          sTmp := '<tr><td colspan=3 align="left">Не проводились</td></tr>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END IF;
      END LOOP;
      sTmp := '</table>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    ELSE
      sTmp := '<p><h3 align = "center">Лист диагностических назначений</h3></p>' ||
              '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
              '<tr><td align="center"><b>Дата назначения</b>' ||
              '</td><td align="center"><b>Дата выполнения</b>' ||
              '</td><td align="center"><b>Наименование</b>' ||
              '</td></tr>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR i IN c(pFK_PACID) LOOP
        bExists := 1;
        sTmp    := '<tr><td align="center">' || i.fd_naz || '</td> ' ||
                   '<td align="center">' || i.fd_run || '</td>' ||
                   '<td align="left">' || i.naim || '</td></tr> ';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
      sTmp := '</table>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      IF bExists = 0 THEN
        sTmp := '<p> Не проводились </p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END IF;
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getProcListIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getProcListIbText(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR c(pFK_PACID IN NUMBER) IS
      SELECT /*+rule*/
       TO_CHAR(fd_naz, 'dd.mm.yyyy') AS fd_naz,
       get_fullpath(fk_smid)||DECODE(fc_remark,NULL,'',', '||fc_remark) || ' ' || PKG_NAZ.GET_NAZPARAM(FK_ID) AS naim,--byXander 18.05.05
       pkg_manager.get_nazproc_count_ib(fk_id) AS fn_count
        FROM tnazlech
       WHERE fk_pacid = pFK_PACID
         AND fk_smid not in (SELECT FK_ID FROM TSMID START WITH FK_ID = GET_SYNID('STOM_PROC') CONNECT BY PRIOR FK_ID = FK_OWNER)-- by TimurLan
      --         AND fk_nazsosid = 1
       ORDER BY fd_naz;
    sTmp    VARCHAR2(32767);
    cl      CLOB;
    BExists NUMBER := 0;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    if pFK_PACID IS NULL THEN
      sTmp := '<p><h3 align = "center">Лист лечебных назначенний</h3></p>'||
              '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
              '<tr><td align="center"><b>Дата назначения</b>' ||
              '</td><td align="center"><b>Наименование</b>' ||
              '</td><td align="center"><b>Количество</b>' ||
              '</td></tr>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR n in 1..arPacList.COUNT LOOP
        sTmp := '<tr><td colspan=3 align="left">';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        sTmp := '</td></tr>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        FOR i IN c(arPacList(n)) LOOP
          bExists := 1;
          sTmp    := '<tr><td align="center">' || i.fd_naz || '</td> ' ||
                     '<td align="left">' || i.naim || '</td>' ||
                     '<td align="center">' || get_decode(i.fn_count, 1, '&nbsp', i.fn_count) || '</td></tr> ';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;
        IF bExists = 0 THEN
          sTmp := '<tr><td colspan=3 align="left">Не проводились</td></tr>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END IF;
      END LOOP;
      sTmp := '</table>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    ELSE
      sTmp := '<p><h3 align = "center">Лист лечебных назначенний</h3></p>' ||
              '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
              '<tr><td align="center"><b>Дата назначения</b>' ||
              '</td><td align="center"><b>Наименование</b>' ||
              '</td><td align="center"><b>Количество</b>' ||
              '</td></tr>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR i IN c(pFK_PACID) LOOP
        bExists := 1;
        sTmp    := '<tr><td align="center">' || i.fd_naz || '</td> ' ||
                   '<td align="left">' || i.naim || '</td>' ||
                   '<td align="center">' || get_decode(i.fn_count, 1, '&nbsp', i.fn_count) || '</td></tr> ';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
      sTmp := '</table>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      IF bExists = 0 THEN
        sTmp := '<p> Не проводились </p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END IF;
    END IF;
/*    sTmp := '<p><h3 align = "center">Лист лечебных назначенний</h3></p>' ||
            '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
            '<tr> ' || '  <td> ' ||
            '    <div align="center"><b>Дата назначения</b></div> ' ||
            '  </td> ' || '  <td> ' ||
            '    <div align="center"><b>Наименование</b></div> ' ||
            '  </td> ' || '  <td> ' ||
            '    <div align="center"><b>Количество</b></div> ' ||
            '  </td> ' || '</tr>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    FOR i IN c LOOP
      bExists := 1;
      sTmp    := ' <tr> ' || '<td> ' || '  <div align="center">' ||
                 i.fd_naz || '  </div> ' || '</td> ' || '<td> ' ||
                 '  <div align="left">' || i.naim || ' </div> ' || '</td> ' ||
                 '<td> ' || '  <div align="left">' ||
                 get_decode(i.fn_count, 1, '&nbsp', i.fn_count) ||
                 ' </div>' || '</td> ' || '</tr>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    END LOOP;
    sTmp := '</Table>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    IF bExists = 0 THEN
      sTmp := '<p> Не проводились </p>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    END IF;*/
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getTechBolIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getTechBolIbText(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR c(pFK_PACID IN NUMBER) IS
      SELECT TO_CHAR(fd_date, 'dd.mm.yyyy') AS fd_date,
             fk_tibid,
             do_vrachfio(fk_vrachid) AS vrach_fio,
             fk_id
        FROM ttechbolezni
       WHERE fk_pacid = pFK_PACID and fp_stom = 0-- by Vlad|TimurLan
    ORDER BY ttechbolezni.fd_date;
    sTmp  VARCHAR2(32767);
    sDiag VARCHAR2(32767);
    cl    CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h3 align="center">ДИНАМИКА НАБЛЮДЕНИЙ</h3></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    if pFK_PACID IS NULL THEN
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        FOR i IN c(arPacList(n)) LOOP
          sTmp := '<p><B>Прием проведен ' || i.fd_date || '</B>' ||
                  REPLACE(REPLACE(get_ibrazdeltext(i.fk_tibid, get_smidowner(get_synid('TECHBOLEZNI')), ''), '..', '.'), CHR(10), '<BR>') || '<B>';
          sDiag := asu.do_diagbytype(arPacList(n), 3, 1, i.fk_id, 1) || ' ' || asu.do_diagbytype(arPacList(n), 3, 0, i.fk_id, 1);
          IF sDiag <> ' ' THEN
            sTmp := sTmp || '<B>Диагноз:</B>' || sDiag;
          END IF;
          sTmp := sTmp || '<br>' || i.vrach_fio || '</B>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;
      END LOOP;
    ELSE
      FOR i IN c(pFK_PACID) LOOP
        sTmp := '<p><B>Прием проведен ' || i.fd_date || '</B>' ||
                REPLACE(REPLACE(get_ibrazdeltext(i.fk_tibid, get_smidowner(get_synid('TECHBOLEZNI')), ''), '..', '.'), CHR(10), '<BR>') || '<B>';
        sDiag := asu.do_diagbytype(pFK_PACID, 3, 1, i.fk_id, 1) || ' ' || asu.do_diagbytype(pFK_PACID, 3, 0, i.fk_id, 1);
        IF sDiag <> ' ' THEN
          sTmp := sTmp || '<B>Диагноз:</B>' || sDiag;
        END IF;
        sTmp := sTmp || '<br>' || i.vrach_fio || '</B>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getStomZakl
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getStomZakl(pFK_PACID IN NUMBER) RETURN CLOB IS
    sTmp VARCHAR2(32767);
    cl   CLOB;

    CURSOR c IS
      SELECT fk_tibid
        FROM ttechbolezni
       WHERE fk_pacid = pFK_PACID and fp_stom = 1
       order by fd_date, fk_id desc;
    ibid number;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    --    sTmp := '<br><b>Заключение: </b><br>';
    --    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    open c;
    fetch c
      into ibid;
    close c;
    sTmp := replace(REPLACE(get_ibrazdeltext(ibid,
                                             get_smidowner(get_synid('ZAKLSTOM')),
                                             ' '),
                            '..',
                            '.'),
                    CHR(10),
                    '<BR>');
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    RETURN cl;

  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getStomIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getStomIbText(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR c(pFK_PACID IN NUMBER) IS
      SELECT TO_CHAR(fd_date, 'dd.mm.yyyy') AS fd_date,
             TO_DATE(fd_date, 'dd.mm.yyyy') AS orddate,
             fk_tibid,
             do_vrachfio(fk_vrachid) AS vrach_fio,
             fk_id
        FROM ttechbolezni
       WHERE fk_pacid = pFK_PACID and fp_stom = 1
       order by orddate, fk_id;
    CURSOR cPicstom(pFK_PICID IN NUMBER) IS
      SELECT b.fk_id, b.fc_coment, p.fc_ext, p.fn_height, p.fn_width, dbms_lob.getlength(b.fb_b) bSize
        FROM tblobs b, tpics p
       WHERE p.fk_id = pFK_PICID AND b.fk_id = p.fk_blobid AND
             fl_showib = 1;
    cursor cMins(pFK_PACID IN NUMBER) is
      select fk_stim
        from ttechbolezni
       where fk_pacid = pFK_PACID and fp_stom = 1
       order by fd_date, fk_id;
    cursor cMaxs(pFK_PACID IN NUMBER) is
      select fk_stim
        from ttechbolezni
       where fk_pacid = pFK_PACID and fp_stom = 1
       order by fd_date desc, fk_id desc;
    nStom    NUMBER;
    nWidth   INTEGER;
    nHeight  INTEGER;
    nRatio   NUMBER;
    sTmp     VARCHAR2(32767);
    sDiag    VARCHAR2(32767);
    cl       CLOB;
    bExists  NUMBER := 0;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h3 align="center">Курс стоматологического лечения</h3></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

    IF pFK_PACID IS NULL THEN
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));

        open cMins(arPacList(n));
        fetch cMins
          into nStom;
        close cMins;
        FOR j IN cPicstom(nStom) LOOP
          nWidth  := j.fn_width;
          nHeight := j.fn_height;
          IF nWidth > 640 THEN
            nRatio  := 640 / nWidth;
            nWidth  := 640;
            nHeight := nHeight * nRatio;
          END IF;
          IF nHeight > 488 THEN
            nRatio  := 488 / nHeight;
            nHeight := 488;
            nWidth  := nWidth * nRatio;
          END IF;
          if j.bSize > 0 then
            sTmp := '<p align=center><B>Формула зубов до лечения:</b><BR><img src='|| j.fk_id || j.fc_ext || ' width="' || nWidth || '" height="' || nHeight || '"></img>' || '</p><p>' || j.fc_coment || '</p>';
          else
            sTmp := '<p align=center><B>Формула зубов до лечения:</b><BR><img src=noimage.jpg></img>' || '</p><p>' || j.fc_coment || '</p>';
          end if;
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;

        FOR i IN c(arPacList(n)) LOOP
          bExists := 1;
          sTmp := '<p><B>Дата приема: ' || i.fd_date || '</B><br><B>Запись специалиста:</B>' || replace(REPLACE(get_ibrazdeltext(i.fk_tibid, /*get_smidowner(*/get_synid('STOM_KONS')/*)*/, ''), '..', '.'), CHR(10), '<BR>') || '<B>';--rem by TimurLan 19/01/04
          sDiag := asu.do_diagbytype(arPacList(n), 3, 1, i.fk_id, 1) || ' ' || asu.do_diagbytype(arPacList(n), 3, 0, i.fk_id, 1);
          IF sDiag <> ' ' THEN
            sTmp := sTmp || '<BR><B>Диагноз:</B>' || sDiag;
          END IF;
          sTmp := sTmp || '<br>' || i.vrach_fio || '</B></p>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;
        --DBMS_LOB.append(cl, getstomZakl(pFK_PACID));

        open cMaxs(arPacList(n));
        fetch cMaxs
          into nStom;
        close cMaxs;
        FOR j IN cPicstom(nstom) LOOP
          nWidth  := j.fn_width;
          nHeight := j.fn_height;
          IF nWidth > 640 THEN
            nRatio  := 640 / nWidth;
            nWidth  := 640;
            nHeight := nHeight * nRatio;
          END IF;
          IF nHeight > 488 THEN
            nRatio  := 488 / nHeight;
            nHeight := 488;
            nWidth  := nWidth * nRatio;
          END IF;
          if j.bSize > 0 then
            sTmp := '<p align=center><B>Формула зубов после лечения:</b><BR><img src=' ||j.fk_id || j.fc_ext || ' width="' || nWidth ||'" height="' || nHeight || '"></img>' || '</p><p>' ||j.fc_coment|| '</p>';
          else
            sTmp := '<p align=center><B>Формула зубов после лечения:</b><BR><img src=noimage.jpg></img>' || '</p><p>' || j.fc_coment || '</p>';
          end if;
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;

        IF bExists = 0 THEN
          sTmp := '<p>Записи отсутствуют</p>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END IF;
      END LOOP;
    ELSE
      open cMins(pFK_PACID);
      fetch cMins
        into nStom;
      close cMins;
      FOR j IN cPicstom(nStom) LOOP
        nWidth  := j.fn_width;
        nHeight := j.fn_height;
        IF nWidth > 640 THEN
          nRatio  := 640 / nWidth;
          nWidth  := 640;
          nHeight := nHeight * nRatio;
        END IF;
        IF nHeight > 488 THEN
          nRatio  := 488 / nHeight;
          nHeight := 488;
          nWidth  := nWidth * nRatio;
        END IF;
        if j.bSize > 0 then
          sTmp := '<p align=center><B>Формула зубов до лечения:</b><BR><img src='|| j.fk_id || j.fc_ext || ' width="' || nWidth || '" height="' || nHeight || '"></img>' || '</p><p>' || j.fc_coment || '</p>';
        else
          sTmp := '<p align=center><B>Формула зубов до лечения:</b><BR><img src=noimage.jpg></img>' || '</p><p>' || j.fc_coment || '</p>';
        end if;
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
      FOR i IN c(pFK_PACID) LOOP
        bExists := 1;
        sTmp := '<p><B>Дата приема: ' || i.fd_date || '</B><br><B>Запись специалиста:</B> ' || replace(REPLACE(get_ibrazdeltext(i.fk_tibid, /*get_smidowner(*/get_synid('STOM_KONS')/*)*/, ''), '..', '.'), CHR(10), '<BR>') || '<B>';--rem by TimurLan 19/01/04
        sDiag := asu.do_diagbytype(pFK_PACID, 3, 1, i.fk_id, 1) || ' ' || asu.do_diagbytype(pFK_PACID, 3, 0, i.fk_id, 1);
        IF sDiag <> ' ' THEN
          sTmp := sTmp || '<BR><B>Диагноз:</B>' || sDiag;
        END IF;
        sTmp := sTmp || '<br>' || i.vrach_fio || '</B></p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
      --DBMS_LOB.append(cl, getstomZakl(pFK_PACID));
      open cMaxs(pFK_PACID);
      fetch cMaxs
        into nStom;
      close cMaxs;
      FOR j IN cPicstom(nstom) LOOP
        nWidth  := j.fn_width;
        nHeight := j.fn_height;
        IF nWidth > 640 THEN
          nRatio  := 640 / nWidth;
          nWidth  := 640;
          nHeight := nHeight * nRatio;
        END IF;
        IF nHeight > 488 THEN
          nRatio  := 488 / nHeight;
          nHeight := 488;
          nWidth  := nWidth * nRatio;
        END IF;
        if j.bSize > 0 then
          sTmp := '<p align=center><B>Формула зубов после лечения:</b><BR><img src=' ||j.fk_id || j.fc_ext || ' width="' || nWidth ||'" height="' || nHeight || '"></img>' || '</p><p>' ||j.fc_coment|| '</p>';
        else
          sTmp := '<p align=center><B>Формула зубов после лечения:</b><BR><img src=noimage.jpg></img>' || '</p><p>' || j.fc_coment || '</p>';
        end if;
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
      IF bExists = 0 THEN
        sTmp := '<p>Записи отсутствуют</p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END IF;
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getResAnIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getResAnIbText(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR c(pFK_PACID IN NUMBER) IS
      SELECT fc_clob
        FROM tresan, tclobs
       WHERE fl_zakl = 1 AND tresan.fK_blobid = tclobs.fk_id AND
             fk_pacid = pFK_PACID
       ORDER BY fd_ins;
    sTmp    VARCHAR2(32767);
    cl      CLOB;
    bExists NUMBER := 0;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h3 align="center">РЕЗУЛЬТАТЫ ЛАБОРАТОРНЫХ ИССЛЕДОВАНИЙ</h3></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

    IF pFK_PACID IS NULL THEN
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        FOR i IN c(arPacList(n)) LOOP
            bExists := 1;
            DBMS_LOB.append(cl, i.fc_clob);
        END LOOP;
        IF bExists = 0 THEN
          sTmp := '<p>Не проводились</p>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END IF;
      END LOOP;
    ELSE
      FOR i IN c(pFK_PACID) LOOP
        bExists := 1;
        DBMS_LOB.append(cl, i.fc_clob);
      END LOOP;
      IF bExists = 0 THEN
        sTmp := '<p>Не проводились</p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END IF;
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getResAnIbText2
  \*------------------------------------------------------------------------------------------------------------------*/
  -- added by Kapustin A.V.
  FUNCTION getResAnIbText2(pFK_PACID IN NUMBER) RETURN CLOB IS
    sTmp    VARCHAR2(32767);
    cl      CLOB;
    bExists NUMBER := 0;

    CURSOR c IS
      SELECT fc_clob
        FROM tresan, tclobs
       WHERE fl_zakl = 1 AND tresan.fK_blobid2 = tclobs.fk_id AND
             fk_pacid = pFK_PACID
       ORDER BY fd_ins;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h3 align="center">Результаты анализов</h3></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    FOR i IN c LOOP
      bExists := 1;
      DBMS_LOB.append(cl, i.fc_clob);
    END LOOP;
    IF bExists = 0 THEN
      sTmp := '<p> Не проводились </p>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getResNazIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  --только результаты назначений
  /*  FUNCTION getResNazIbText (pFK_PACID IN NUMBER, nStartID IN NUMBER, sCaption IN VARCHAR2)
      RETURN CLOB
    IS
  --Mikrom
  --    CURSOR c
      CURSOR c(pSMID IN NUMBER)
  --Mikrom
      IS
  --      SELECT TO_CHAR (fd_ins, 'dd.mm.yyyy') AS fd_date, get_fullpath (fk_smid) AS name, get_textvsbr (fc_res) AS fc_res, fk_nazid, do_vrachfio (fk_vrachid) AS fc_vrach
        SELECT TO_CHAR (fd_ins, 'dd.mm.yyyy') AS fd_date, get_fullpath (fk_smid) AS name, fc_res AS fc_res, fk_nazid, do_vrachfio (fk_vrachid) AS fc_vrach
          FROM vres
         WHERE fk_pacid = pFK_PACID
           AND nStartID IN (SELECT/*+rule*/ /*
                             fk_id
                            FROM tsmid
                           START WITH fk_id = vres.fk_smid
                          CONNECT BY PRIOR fk_owner = fk_id
                          where fk_smid<>pSMID)
       ORDER BY fd_ins;

    CURSOR cPics (pFK_NAZID IN NUMBER)
    IS
      SELECT b.fk_id, b.fc_coment, p.fc_ext, p.fn_height, p.fn_width
        FROM tblobs b, tpics p
       WHERE p.fk_nazid = pFK_NAZID
         AND b.fk_id = p.fk_blobid
         AND fl_showib = 1;

--Mikrom
     CURSOR c1 IS SELECT GET_KEKKONSID FROM DUAL;
--Mikrom
    cl        CLOB;
    resID     NUMBER;
    sTmp      VARCHAR2 (32767);
    sDiag     VARCHAR2 (32767);
    bExists   NUMBER           := 0;
--Mikrom
    nKEK NUMBER;
--Mikrom
  BEGIN
    DBMS_LOB.CREATETEMPORARY (cl, TRUE, 2);
    sTmp  := '<p><h2 align="center">' || sCaption || '</h2></p>';
    DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
--Mikrom
    OPEN c1;
    FETCH c1 INTO nKEK;
    CLOSE c1;
--    FOR i IN c LOOP
    FOR i IN c(nKEK) LOOP
--Mikrom
      bExists  := 1;
      sTmp     :=
        '<P><B> ' || i.name || '    </B><br><I>Дата выполнения: ' || i.fd_date || '</I></P><p><p><font face="Courier New, Courier, mono"> ' ||
          replace(i.fc_res, CHR(10), '<BR>') ||
          '</font></p></p> ';
      sDiag    := do_diagbytype (pFK_PACID, 4, 1, i.fk_nazid, 1) || ' ' || do_diagbytype (pFK_PACID, 4, 0, i.fk_nazid, 1);
      IF sDiag <> ' ' THEN
        sTmp  := sTmp || '<p><B>Диагноз:</b>' || sDiag || '</p>';
      END IF;
      sTmp     :=
        sTmp || '<table width="100%" border="0" cellpadding="0" cellspacing="0">                                                            ' ||
          '  <tr>' || '    <td width="42%">Врач:</td>' || '    <td width="28%">&nbsp;</td>' ||
          '    <td width="30%">' ||
          i.fc_vrach ||
          '</td></tr></table>';
      sTmp     := sTmp || '<hr>';
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    END LOOP;

    FOR j IN cPics (i.fk_nazid) LOOP
      nWidth   := j.fn_width;
      nHeight  := j.fn_height;
      IF nWidth > 640 THEN
        nRatio   := 640 / nWidth;
        nWidth   := 640;
        nHeight  := nHeight * nRatio;
      END IF;
      IF nHeight > 488 THEN
        nRatio   := 488 / nHeight;
        nHeight  := 488;
        nWidth   := nWidth * nRatio;
      END IF;
      sTmp     := '<br>' || '<img src="' || j.fk_id || j.fc_ext || '" width="' || nWidth || '" height="' || nHeight || '">'||'<br>' || j.fc_coment ||'<br>';
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    END LOOP;

    IF bExists = 0 THEN
      sTmp  := '<p> Не проводились </p>';
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    END IF;
    RETURN cl;
  END;*/
  FUNCTION getResNazIbTextEpikriz(pFK_PACID IN NUMBER,
                                  nStartID  IN NUMBER,
                                  sCaption  IN VARCHAR2) RETURN CLOB IS
    CURSOR c IS
      SELECT TO_CHAR(fd_ins, 'dd.mm.yyyy') AS fd_date,
             get_fullpath(vres.fk_smid) AS name,
             substr(get_textvsbr(fc_res),
                    instr(UPPER(get_textvsbr(fc_res)),
                          'ЗАКЛЮЧЕНИЕ',
                          10,
                          1),
                    length(get_textvsbr(fc_res)) -
                    instr(UPPER(get_textvsbr(fc_res)),
                          'ЗАКЛЮЧЕНИЕ',
                          10,
                          1) + 1) AS fc_res,
             fk_nazid,
             vres.fk_smid,
             fl_showdiagpredzakl,
             vnaz.fk_nazsosid as sos,
             vres.fk_vrachid as ispol -- 25.12.2003 by TimurLan
        FROM vres, tsmid, vnaz
       WHERE vres.fk_pacid = pFK_PACID AND vres.fk_smid = tsmid.fk_id and
             vres.fk_nazid = vnaz.fk_id and
             vnaz.fk_nazsosid in (get_vipnaz, get_neyav) AND
             nStartID IN (SELECT /*+rule*/
                           fk_id
                            FROM tsmid
                           START WITH fk_id = vres.fk_smid
                          CONNECT BY PRIOR fk_owner = fk_id)
       ORDER BY fd_ins;

    CURSOR cPics(pFK_NAZID IN NUMBER) IS
      SELECT b.fk_id, b.fc_coment, p.fc_ext, p.fn_height, p.fn_width, dbms_lob.getlength(b.fb_b) bSize
        FROM tblobs b, tpics p
       WHERE p.fk_nazid = pFK_NAZID AND b.fk_id = p.fk_blobid AND
             fl_showib = 1;

    CURSOR cFiles(pFK_NAZID IN NUMBER) IS
      SELECT TFILES.*,TBLOBS.FC_COMENT,DBMS_LOB.GETLENGTH(TBLOBS.FB_B) BSIZE
        FROM TFILES,TBLOBS
       WHERE TFILES.FK_NAZID = pFK_NAZID AND TBLOBS.FK_ID(+) = TFILES.FK_BLOBID AND TFILES.FL_SHOWIB = 1;

    cl                  CLOB;
    resID               NUMBER;
    sTmp                VARCHAR2(32767);
    sDiag               VARCHAR2(32767);
    bExists             NUMBER := 0;
    fl_showdiagpredzakl NUMBER;
    nWidth              INTEGER;
    nHeight             INTEGER;
    nRatio              NUMBER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h3 align="center">' || sCaption || '</h3></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    FOR i IN c LOOP
      if i.sos = get_neyav then
        bExists := 1;
        sTmp    := '<b> Дата выполнения: ' || i.fd_date || '<br><B> ' ||
                   i.name || ': <font color=red><u>' ||
                   ' Пациент не явился.</u></font></b></b>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      else
        bExists := 1;
        sTmp    := '<br><B> ' || i.name || ' </B>' || ' <I> ' || ' ' ||
                   i.fd_date || ' </I>';
        sDiag   := asu.do_diagbytype(pFK_PACID, 4, 1, i.fk_nazid, 1) || ' ' ||
                   asu.do_diagbytype(pFK_PACID, 4, 0, i.fk_nazid, 1);
        IF sDiag <> ' ' AND i.fl_showdiagpredzakl = 1 THEN
          sTmp := sTmp || '<br><B>Диагноз:</b>' || sDiag;
        END IF;
        sTmp := sTmp || '<font face="Courier New, Courier, mono"><br> ' ||
                i.fc_res || '</font>';
        IF sDiag <> ' ' AND
           (i.fl_showdiagpredzakl = 0 OR i.fl_showdiagpredzakl IS NULL) THEN
          sTmp := sTmp || '<br><B>Диагноз:</b>' || sDiag;
        END IF;
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        --здесь втсавить тэги для картинки <img src="me.jpg" width="490" height="503">
        FOR j IN cPics(i.fk_nazid) LOOP
          nWidth  := j.fn_width;
          nHeight := j.fn_height;
          IF nWidth > 640 THEN
            nRatio  := 640 / nWidth;
            nWidth  := 640;
            nHeight := nHeight * nRatio;
          END IF;
          IF nHeight > 488 THEN
            nRatio  := 488 / nHeight;
            nHeight := 488;
            nWidth  := nWidth * nRatio;
          END IF;
          if j.bSize > 0 then
            sTmp := '<br><img src=' || j.fk_id || j.fc_ext ||' width="' || nWidth || '" height="' || nHeight || '"></img><br>' || j.fc_coment || '<br>';
          else
            sTmp := '<br><img src=noimage.jpg></img><br>' || j.fc_coment || '<br>';
          end if;
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;
        FOR j IN cFiles(i.fk_nazid) LOOP
          if j.bSize > 0 then
            sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || '<br>' || j.FC_COMENT || '</div>';
          else
            sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || ' - отсутствует.<br>' || j.FC_COMENT || '</div>';
          end if;
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;
        sTmp:='<br>Специалист: '||INITCAP(do_vrachfio(i.ispol))||' _____________________';
        DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      END IF;
    END LOOP;
    IF bExists = 0 THEN
      sTmp := '<p> Не проводились </p>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getResNazIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getResNazIbText(pFK_PACID IN NUMBER,
                           nStartID  IN NUMBER,
                           sCaption  IN VARCHAR2) RETURN CLOB IS
    CURSOR c(pFK_PACID IN NUMBER) IS
      SELECT TO_CHAR(fd_ins, 'dd.mm.yyyy') AS fd_date,
             get_fullpath(vres.fk_smid) AS name,
             get_textvsbr(fc_res) as fc_res,
             fk_nazid,
             vres.fk_smid,
             fl_showdiagpredzakl,
             vnaz.fk_nazsosid as sos,
             vres.fk_vrachid as ispol,-- 25.12.2003 by TimurLan
             tsmid.fc_synonim
        FROM vres, tsmid, vnaz
       WHERE vres.fk_pacid = pFK_PACID AND vres.fk_smid = tsmid.fk_id and
             vres.fk_nazid = vnaz.fk_id and
             vnaz.fk_nazsosid in (get_vipnaz, get_neyav) AND
             nStartID IN (SELECT /*+rule*/
                           fk_id
                            FROM tsmid
                           START WITH fk_id = vres.fk_smid
                          CONNECT BY PRIOR fk_owner = fk_id)
       ORDER BY tsmid.fn_order;

    CURSOR cPics(pFK_NAZID IN NUMBER) IS
      SELECT b.fk_id, b.fc_coment, p.fc_ext, p.fn_height, p.fn_width, dbms_lob.getlength(b.fb_b) bSize
        FROM tblobs b, tpics p
       WHERE p.fk_nazid = pFK_NAZID AND b.fk_id = p.fk_blobid AND
             fl_showib = 1;

    CURSOR cFiles(pFK_NAZID IN NUMBER) IS
      SELECT TFILES.*,TBLOBS.FC_COMENT,DBMS_LOB.GETLENGTH(TBLOBS.FB_B) BSIZE
        FROM TFILES,TBLOBS
       WHERE TFILES.FK_NAZID = pFK_NAZID AND TBLOBS.FK_ID(+) = TFILES.FK_BLOBID AND TFILES.FL_SHOWIB = 1;

    cl                  CLOB;
    resID               NUMBER;
    sTmp                VARCHAR2(32767);
    sDiag               VARCHAR2(32767);
    bExists             NUMBER := 0;
    fl_showdiagpredzakl NUMBER;
    nWidth              INTEGER;
    nHeight             INTEGER;
    nRatio              NUMBER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h3 align = "center">' || sCaption || '</h3></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

    IF pFK_PACID IS NULL THEN
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        FOR i IN c(arPacList(n)) LOOP
          if i.sos = get_neyav then
            bExists := 1;
            --sTmp    := '<br>Дата выполнения: ' || i.fd_date || '<B> ' || i.name || ': <font color=red><u>' ||'Пациент не явился.</u></font></b></P>';
            sTmp    := '<P><B>' || i.name || '</B> <I>' || i.fd_date || '</I><BR><b><font color=red><u>' ||'Пациент не явился.</u></font></b></P>';
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
          else
            bExists := 1;
            sTmp    := '<P><B>' || i.name || '</B> <I>' || i.fd_date || '</I>';
            sDiag   := asu.do_diagbytype(arPacList(n), 4, 1, i.fk_nazid, 1) || ' ' || asu.do_diagbytype(arPacList(n), 4, 0, i.fk_nazid, 1);
            IF sDiag <> ' ' AND i.fl_showdiagpredzakl = 1 THEN
              sTmp := sTmp || '<br><B>Диагноз:</b>' || sDiag;
            END IF;
            sTmp := sTmp || '<br>' || i.fc_res;
            IF sDiag <> ' ' AND (i.fl_showdiagpredzakl = 0 OR i.fl_showdiagpredzakl IS NULL) THEN
              sTmp := sTmp || '<br><B>Заключение:</b>' || sDiag;
            END IF;
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

            FOR j IN cPics(i.fk_nazid) LOOP
              nWidth  := j.fn_width;
              nHeight := j.fn_height;
              IF nWidth > 640 THEN
                nRatio  := 640 / nWidth;
                nWidth  := 640;
                nHeight := nHeight * nRatio;
              END IF;
              IF nHeight > 488 THEN
                nRatio  := 488 / nHeight;
                nHeight := 488;
                nWidth  := nWidth * nRatio;
              END IF;
              if j.bSize > 0 then
                sTmp := '<br><img src=' || j.fk_id || j.fc_ext || ' width="' || nWidth || '" height="' || nHeight || '"></img><br>' || j.fc_coment;
              else
                sTmp := '<br><img src=noimage.jpg></img><br>' || j.fc_coment;
              end if;
              DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
            END LOOP;

            FOR j IN cFiles(i.fk_nazid) LOOP
              if j.bSize > 0 then
                sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || '<br>' || j.FC_COMENT || '</div>';
              else
                sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || ' - отсутствует.<br>' || j.FC_COMENT || '</div>';
              end if;
              DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
            END LOOP;
            if nStartID =  get_konsid then
              sTmp:='<br>Консультация проведена: '||INITCAP(do_vrachfio(i.ispol))||' _____________________';
            elsif nStartID =  get_issledid then
              sTmp:='<br>Исследование проведено: '||INITCAP(do_vrachfio(i.ispol))||' _____________________';
            else
              sTmp:='<br>Специалист: '||INITCAP(do_vrachfio(i.ispol))||' _____________________';
            end if;
            DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
          END IF;
        END LOOP;
        IF bExists = 0 THEN
          sTmp := '<p> Не проводились </p>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END IF;
      END LOOP;
    ELSE
      FOR i IN c(pFK_PACID) LOOP
        if i.sos = get_neyav then
          bExists := 1;
          --sTmp    := '<br>Дата выполнения: ' || i.fd_date || '<B> ' || i.name || ': <font color=red><u>' ||'Пациент не явился.</u></font></b></P>';
          sTmp    := '<P><B>' || i.name || '</B> <I>' || i.fd_date || '</I><BR><b><font color=red><u>' ||'Пациент не явился.</u></font></b></P>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        else
          bExists := 1;
          sTmp    := '<P><B>' || i.name || '</B> <I>' || i.fd_date || '</I>';
          sDiag   := asu.do_diagbytype(pFK_PACID, 4, 1, i.fk_nazid, 1) || ' ' || asu.do_diagbytype(pFK_PACID, 4, 0, i.fk_nazid, 1);
          IF sDiag <> ' ' AND i.fl_showdiagpredzakl = 1 THEN
            sTmp := sTmp || '<br><B>Диагноз:</b>' || sDiag;
          END IF;
          sTmp := sTmp || '<br>' || i.fc_res;
          IF sDiag <> ' ' AND (i.fl_showdiagpredzakl = 0 OR i.fl_showdiagpredzakl IS NULL) THEN
            sTmp := sTmp || '<br><B>Заключение:</b>' || sDiag;
          END IF;
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

          FOR j IN cPics(i.fk_nazid) LOOP
            nWidth  := j.fn_width;
            nHeight := j.fn_height;
            IF nWidth > 640 THEN
              nRatio  := 640 / nWidth;
              nWidth  := 640;
              nHeight := nHeight * nRatio;
            END IF;
            IF nHeight > 488 THEN
              nRatio  := 488 / nHeight;
              nHeight := 488;
              nWidth  := nWidth * nRatio;
            END IF;
            if j.bSize > 0 then
              sTmp := '<br><img src=' || j.fk_id || j.fc_ext || ' width="' || nWidth || '" height="' || nHeight || '"></img><br>' || j.fc_coment;
            else
              sTmp := '<br><img src=noimage.jpg></img><br>' || j.fc_coment;
            end if;
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
          END LOOP;

          FOR j IN cFiles(i.fk_nazid) LOOP
            if j.bSize > 0 then
              sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || '<br>' || j.FC_COMENT || '</div>';
            else
              sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || ' - отсутствует.<br>' || j.FC_COMENT || '</div>';
            end if;
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
          END LOOP;

          if nStartID =  get_konsid then
            sTmp:='<br>Консультация проведена: '||INITCAP(do_vrachfio(i.ispol))||' _____________________';
          elsif nStartID =  get_issledid then
            sTmp:='<br>Исследование проведено: '||INITCAP(do_vrachfio(i.ispol))||' _____________________';
          else
            sTmp:='<br>Специалист: '||INITCAP(do_vrachfio(i.ispol))||' _____________________';
          end if;
          DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
        END IF;
      END LOOP;
      IF bExists = 0 THEN
        sTmp := '<p> Не проводились </p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END IF;
    END IF;

    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getPodpisiIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getPodpisiIbText(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
    sTmp VARCHAR2(20000);
    bLechVrach NUMBER;
  BEGIN
    IF do_vrachfio(get_pacvrach(pFK_PACID)) <>
       get_zavotdfio(get_pacvrach(pFK_PACID)) THEN
      sTmp := '<P><HR><table width="100%" border="0" cellspacing="0" cellpadding="0"> ' ||
              '  <tr> ' ||
              '    <td width="41%"><b>##VALUE19</b></td> ' ||
              '    <td width="59%">/' || do_vrachfio(get_pacvrach(pFK_PACID)) || '/</td>' ||
              '  </tr> ' || '  <tr> ' ||
              '    <td width="41%"><b>Зав. отделением ##VALUE20</b></td> ' ||
              '    <td width="59%">/' || get_zavotdfio(get_pacvrach(pFK_PACID)) || '/</td> ' ||
              ' </tr> ' ||
             /*            '  <tr> ' || '    <td width="41%"><b>Зам. гл. врача по мед части</b></td> ' || '    <td width="59%">/' || get_nachmedfio || '/</td> ' || '</tr> ' ||*/
              '</table> ';
      begin
        SELECT NVL(FP_VRACH,1) into bLechVrach FROM TSOTR WHERE FK_ID = PKG_REGIST_PACFUNC.GET_PAC_VRACHID(pFK_PACID);
        if bLechVrach = 1 then
          sTmp := REPLACE(sTmp,'##VALUE19','Лечащий врач');
        else
          sTmp := REPLACE(sTmp,'##VALUE19','Заполнил');
        end if;
        sTmp := REPLACE(sTmp,'##VALUE20','"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' '));
      exception when others then null;
      end;
    ELSE
      sTmp := '<P><HR><table width="100%" border="0" cellspacing="0" cellpadding="0"> ' ||
              '  <tr> ' ||
              '    <td width="41%"><b>##VALUE19,<BR>Зав. отделением ##VALUE20</b></td> ' ||
              '    <td width="59%">/' ||
              do_vrachfio(get_pacvrach(pFK_PACID)) || '/</td>' ||
              '  </tr> ' ||
             /*        '  <tr> ' || '    <td width="41%"><b>Заведующий отделением</b></td> ' || '    <td width="59%">/' || get_zavotdfio (get_pacvrach (pFK_PACID)) ||'/</td> ' ||' </tr> ' ||*/
             /*            '  <tr> ' ||'    <td width="41%"><b>Зам. гл. врача по мед части</b></td> ' ||'    <td width="59%">/' ||get_nachmedfio ||'/</td> ' ||'</tr> ' ||*/
              '</table> ';
      begin
        SELECT NVL(FP_VRACH,1) into bLechVrach FROM TSOTR WHERE FK_ID = PKG_REGIST_PACFUNC.GET_PAC_VRACHID(pFK_PACID);
        if bLechVrach = 1 then
          sTmp := REPLACE(sTmp,'##VALUE19','Лечащий врач');
        else
          sTmp := REPLACE(sTmp,'##VALUE19','Заполнил');
        end if;
        sTmp := REPLACE(sTmp,'##VALUE20','"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' '));
      exception when others then null;
      end;
    END IF;
    RETURN sTmp;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getanambolIbText
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getanambolIbText(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR cAnamBol(pFK_PACID IN NUMBER) IS
      SELECT fc_clob, tanambol.fd_date
        FROM tclobs, tanambol
       WHERE tclobs.fk_id = tanambol.fk_clobid AND
             tanambol.FK_PACID = pFK_PACID;
    sTmp  VARCHAR2(32767);
    cTemp VARCHAR2(32767);
    clTmp CLOB;
    b     BOOLEAN := FALSE;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTmp, TRUE, 2);
    sTmp := '<p><h3 align = "center">Анамнез болезни</h3></P>';
    DBMS_LOB.writeappend(clTmp, LENGTH(sTmp), sTmp);
    IF pFK_PACID IS NOT NULL THEN
      FOR i IN cAnamBol(pFK_PACID) LOOP
        DBMS_LOB.APPEND(clTmp, i.FC_CLOB);
        b := TRUE;
      END LOOP;
    ELSE
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(clTmp, SET_GET_RAZD_BREAK(arPacList(n)));
        FOR i IN cAnamBol(arPacList(n)) LOOP
          cTemp := '<B>' || TO_CHAR(i.fd_date,'dd.mm.yyyy') || '</B> ';
          DBMS_LOB.WRITEAPPEND(clTmp, LENGTH(cTemp), cTemp);
          DBMS_LOB.APPEND(clTmp, i.FC_CLOB);
          b := TRUE;
       END LOOP;
      END LOOP;
    END IF;
    IF NOT b THEN
      sTmp := 'Не заполнено';
      DBMS_LOB.writeappend(clTmp, LENGTH(sTmp), sTmp);
    END IF;
    RETURN clTmp;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getEpikrizHeaderText return VARCHAR2
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getEpikrizHeaderText(pFK_PACID IN NUMBER, bDIAG IN NUMBER, bHEADER IN NUMBER) RETURN VARCHAR2
   IS
--    sfc_fam   VARCHAR2(100);
--    sfc_im    VARCHAR2(100);
--    sfc_otch  VARCHAR2(100);
--    nfp_sex   NUMBER;
--    sAge      varchar2(100);
--    sFC_DIAG  VARCHAR2(32767);
--    dpryb     DATE;
--    dvyb      DATE;
--    sTmp      varchar2(32767);
--    nInterKur NUMBER := 0.0;
    CURSOR cMain IS
      SELECT PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID) FC_IB,
             TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH,
             TPEOPLES.FP_SEX, TPEOPLES.FD_ROJD,
             PKG_REGIST_PACFUNC.GET_PAC_INCOME(pFK_PACID) FD_IN,
             PKG_REGIST_PACFUNC.GET_PAC_PLANOUTCOME(pFK_PACID) FD_OUT,
             PKG_REGIST_PACFUNC.GET_PAC_DAYS(pFK_PACID) FN_KDN,
             PKG_REGIST_PEPLFUNC.GET_PEPL_AGE_MONTH(TPEOPLES.FK_ID) FC_AGE
        FROM TPEOPLES,
             (SELECT FK_PEPLID FROM TKARTA WHERE FK_ID = pFK_PACID
              UNION
              SELECT FK_PEPLID FROM TAMBULANCE WHERE FK_ID = pFK_PACID
              ) T
       WHERE TPEOPLES.FK_ID(+) = T.FK_PEPLID;
    s VARCHAR2(32767) := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||CHR(13)||
         '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||CHR(13)||
         'xmlns:w="urn:schemas-microsoft-com:office:word"'||CHR(13)||
         'xmlns="http://www.w3.org/TR/REC-html40">'||CHR(13)||
         '<head><meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||CHR(13)||
         '<meta name=ProgId content=Word.Document>'||CHR(13)||
         '<title>МИС ПАЦИЕНТ - Выписной эпикриз ##VALUE01</title></head>'||CHR(13)||
         '<body><table width=100% border=0>'||CHR(13)||
         '<tr>'||CHR(13)||
         ' <td colspan=4><table width=100% border=0>'||CHR(13)||
         ' <tr>'||CHR(13)||
         '  <!--<td width=90><img src=c://asu/000.jpg></img></td>-->'||CHR(13)||
         '  <td><div align=center><font style=''color:navy''><b>Ханты-Мансийский автономный округ<BR><BR><i>государственное учреждение здравоохранения</i></b></font><BR>'||CHR(13)||
         '  <font style=''font-size:14.0pt;color:red''><b>ОКРУЖНАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА</b></font></div></td>'||CHR(13)||
         ' </tr></table>'||CHR(13)||
         ' </td>'||CHR(13)||
         '</tr><tr>'||CHR(13)||
         ' <td colspan=4><p align=center><font style=''font-size:18.0pt''><BR><b>ВЫПИСНОЙ ЭПИКРИЗ ##VALUE01</b></font></p></td>'||CHR(13)||
         '</tr></table>'||CHR(13);
  BEGIN
    IF bHEADER = 1 THEN
      null;
    ELSE
      s := '&nbsp;&nbsp;';
    END IF;
    FOR p in cMain LOOP
      s := REPLACE(s,'##VALUE01',p.FC_IB);
      IF p.FP_SEX = 0 THEN
        s := s || 'Пациентка ';
      ELSE
        s := s || 'Пациент ';
      END IF;
      s := s || p.FC_FAM || ' ' || p.FC_IM || ' ' || p.FC_OTCH || ' Год рождения: ' || TO_CHAR(p.FD_ROJD, 'yyyy') || '<BR>';
      IF p.FP_SEX = 0 THEN
        s := s || 'находилась';
      ELSE
        s := s || 'находился';
      END IF;
      s := s || ' на лечении  c ' || TO_CHAR(p.FD_IN, 'dd.mm.yyyy') || ' по ' || TO_CHAR(p.FD_OUT, 'dd.mm.yyyy') || ' с диагнозом:<BR>';
      IF bDIAG = 1 THEN
        IF asu.do_diagbytype(pFK_PACID, 2, 1) IS NOT NULL THEN
          s := s || asu.do_diagbytype(pFK_PACID, 2, 1);
          IF asu.do_diagbytype(pFK_PACID, 2, 0) IS NOT NULL THEN
            s := s || ' Сопутствующий диагноз: ' || asu.do_diagbytype(pFK_PACID, 2, 0);
          END IF;
        ELSE
          s := s || ' Практически здоров. ';
        END IF;
      END IF;
      s := s || ' <BR>Проведено ' || p.FN_KDN || ' койко-дней.</p>';
    END LOOP;
    RETURN s;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               GetFullNazClobID
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION GetFullNazClobIDEpikriz(pFK_PACID IN NUMBER) RETURN NUMBER IS
    sTmp   VARCHAR2(32767);
    cl     CLOB;
    clTemp CLOB;
    resID  NUMBER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := GetIbHeader(pFK_PACID);
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    DBMS_LOB.append(cl, getIbDiags(pFK_PACID));
    sTmp := '<p><font size="1" face="Times New Roman, Times, serif" color="#FFFFFF">[:pagebreak]</font></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    DBMS_LOB.append(cl,
                    getRazdelIbText(pFK_PACID,
                                    get_galobid,
                                    'Жалобы',
                                    'Жалоб нет'));
    DBMS_LOB.append(cl, getanambolIbText(pFK_PACID));
    DBMS_LOB.append(cl,
                    getRazdelIbText(pFK_PACID,
                                    get_anamgiznid,
                                    'Анамнез жизни',
                                    'Без патологии'));
    DBMS_LOB.append(cl,
                    getRazdelIbText(pFK_PACID,
                                    get_epidid,
                                    'Эпианамнез',
                                    'Без патологии'));
    DBMS_LOB.append(cl,
                    getRazdelIbText(pFK_PACID,
                                    get_doiid,
                                    'Данные объективных исследований',
                                    'Без поталогии'));
    sTmp := '<hr>' || GetAntropIbText(pFK_PACID);
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    sTmp := '<p><h3 align="center">Проведенные исследования</h3></p>';
    DBMS_LOB.append(cl, getNazListIbText(pFK_PACID));
    DBMS_LOB.append(cl, getProcListIbText(pFK_PACID));
    DBMS_LOB.append(cl, getResAnIbText(pFK_PACID));
    DBMS_LOB.append(cl,
                    getResNazIbTextEpikriz(pFK_PACID,
                                           get_issledid,
                                           'Результаты диагностических назначений'));
    DBMS_LOB.append(cl,
                    getResNazIbTextEpikriz(pFK_PACID,
                                           get_konsid,
                                           'Консультации специалистов'));
    --    DBMS_LOB.append (cl, getVrachRek(pFK_PACID));
    sTmp := getPodpisiIbText(pFK_PACID);
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    INSERT INTO tclobs
      (fk_id, fc_clob)
    VALUES
      (-1, cl)
    RETURNING fk_id INTO resID;

    COMMIT;
    RETURN resid;
  END;

  /*------------------------------------------------------------------------------------------------------------------*\
  |               getVrachZakl
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getVrachZakl(pFK_PACID IN NUMBER) RETURN CLOB IS
    sTmp   VARCHAR2(32767);
    cl     CLOB;
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h3 align = "center">Заключение лечащего врача</h3></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    IF pFK_PACID IS NULL THEN
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        DoZaklText(arPacList(n));
        OPEN cGetEpikrizClob(arPacList(n));
        FETCH cGetEpikrizClob
          INTO clTemp;
        CLOSE cGetEpikrizClob;
        DBMS_LOB.append(cl, clTemp);
      END LOOP;
    ELSE
      DoZaklText(pFK_PACID);
      OPEN cGetEpikrizClob(pFK_PACID);
      FETCH cGetEpikrizClob
        INTO clTemp;
      CLOSE cGetEpikrizClob;
      IF clTemp IS NOT NULL THEN
        DBMS_LOB.append(cl, clTemp);
      END IF;
    END IF;
    RETURN cl;
  END getVrachZakl;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getVrachRek
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getVrachRek(pFK_PACID IN NUMBER) RETURN CLOB IS
    cursor c(pFK_PACID IN NUMBER) is
      select fc_clob
        from tclobs, tepikriz
       where fk_pacid = pFK_PACID and fk_rekclob = tclobs.fk_id;
    sTmp   VARCHAR2(1000);
    cl     CLOB;
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p><h3 align = "center">Рекомендации лечащего врача</h3></p>';
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    IF pFK_PACID IS NULL THEN
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        OPEN c(arPacList(n));
        FETCH c
          INTO clTemp;
        CLOSE c;
        DBMS_LOB.append(cl, clTemp);
      END LOOP;
    ELSE
      OPEN c(pFK_PACID);
      FETCH c
        INTO clTemp;
      CLOSE c;
      IF clTemp IS NOT NULL THEN
        DBMS_LOB.append(cl, clTemp);
      END IF;
    END IF;
    RETURN cl;
  END getVrachRek;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getResNazIbClobID
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getFullEpikrizTextClobID(pFK_PACID IN NUMBER,
                                    pfl_diagn IN NUMBER,
                                    pfl_zakl  IN NUMBER,
                                    pFL_lab   IN NUMBER,
                                    pfl_diag  IN NUMBER,
                                    pfl_lech  IN NUMBER,
                                    pfl_kons  IN NUMBER) RETURN NUMBER IS
    CURSOR cEpText IS
      SELECT fk_epclobid FROM tepikriz WHERE fk_pacid = pfk_pacid and fn_del=0;

    --  cursor c
    sTmp      VARCHAR2(32767);
    cl        CLOB;
    clTemp    CLOB;
    resID     NUMBER;
    lFL_DIAGn NUMBER;
    lFL_zakl  NUMBER;
    lFL_lab   NUMBER;
    lfl_diag  NUMBER;
    lfl_lech  NUMBER;
    lfl_kons  NUMBER;
  BEGIN
    lFL_ZAKL  := pFL_ZAKL;
    lFL_lab   := pFL_lab;
    lfl_diagn := pfl_diagn;
    lfl_diag  := pfl_diag;
    lfl_lech  := pfl_lech;
    lfl_kons  := pfl_kons;
    --если запрашивается толбко текст, без переформирования эпикриза
    IF lFL_ZAKL = -1 AND lFL_lab = -1 AND lfl_diagn = -1 AND lfl_diag = -1 AND
       lfl_lech = -1 AND lfl_kons = -1 THEN
      OPEN cEpText;
      FETCH cEpText
        INTO resid;
      IF resid IS NOT NULL THEN
        CLOSE cEpText;
        RETURN resid;
      END IF;
      CLOSE cEpText;
      lFL_ZAKL  := 1;
      lFL_lab   := 1;
      lfl_diagn := 1;
      lfl_diag  := 1;
      lfl_lech  := 1;
      lfl_kons  := 1;
    END IF;
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := getEpikrizHeaderText(pFK_PACID, lFL_DIAGN, 1);
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    IF lFL_ZAKL = 1 THEN
      /*      sTmp  := '<HR> <p><h2 align = "center">Заключение лечащего врача</h2></p>';
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      DoZaklText (pFK_PACID);
      OPEN cGetEpikrizClob(pFK_PACID);
      FETCH cGetEpikrizClob INTO clTemp;
      CLOSE cGetEpikrizClob;*/
      DBMS_LOB.append(cl, getVrachZakl(pFK_PACID));
    END IF;
    /*    sTmp := '<p><h2 align="center">Проведенные исследования</h2></p>';
    DBMS_LOB.append (cl, getNazListIbText (pFK_PACID)); KORY*/
    IF lfl_lab = 1 THEN
      -- by Kapustihn A.V.
      -- DBMS_LOB.append(cl, getResAnIbText(pFK_PACID));
      DBMS_LOB.append(cl, getResAnIbText2(pFK_PACID));
    END IF;
    IF lfl_diag = 1 THEN
      DBMS_LOB.append(cl,
                      getResNazIbTextEpikriz(pFK_PACID,
                                             get_issledid,
                                             'Результаты диагностических исследований'));
    END IF;
    IF lfl_kons = 1 THEN
      DBMS_LOB.append(cl,
                      getResNazIbTextEpikriz(pFK_PACID,
                                             get_konsid,
                                             'Консультации специалистов'));
    END IF;
    IF lfl_lech = 1 THEN
      DBMS_LOB.append(cl, getStatNazIbClob(pFK_PACID, 1));
    END IF;
--    DBMS_LOB.append(cl, GetNazMed(pFK_PACID));
    DBMS_LOB.append(cl, getVrachRek(pFK_PACID));
    sTmp := getPodpisiIbText(pFK_PACID);
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    --DBMS_LOB.writeappend(cl, LENGTH('</BODY></HTML>'), '</BODY></HTML>');
    INSERT INTO tclobs
      (fk_id, fc_clob)
    VALUES
      (-1, cl)
    RETURNING fk_id INTO resID;

    RETURN resid;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               DoSetEpikriz
  \*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE DoSetEpikriz(pFK_PACID     IN NUMBER,
                         pfk_clobid    IN NUMBER,
                         pfk_epclobid  IN NUMBER,
                         pfk_rekclobid IN NUMBER,
                         pFL_PODPIS    IN NUMBER,
                         pFK_VRACHID   IN NUMBER) IS
    nID          NUMBER;
    CURSOR cEpikriz IS
      SELECT FK_ID FROM TEPIKRIZ WHERE FK_PACID = pFK_PACID and fn_del=0;-- by TimurLan
  BEGIN
    OPEN cEpikriz;
    FETCH cEpikriz
      INTO nID;
    CLOSE cEpikriz;

    IF nID IS NULL THEN
      INSERT INTO TEPIKRIZ
        (FK_PACID,
         FK_CLOBID,
         FK_EPCLOBID,
         FK_REKCLOB,
         FP_EPIKRIZ,
         FL_PODPIS,
         FK_VRACHID)
      VALUES
        (pFK_PACID,
         pFK_CLOBID,
         pFK_EPCLOBID,
         pFK_REKCLOBID,
         1,
         pFL_PODPIS,
         pFK_VRACHID);
    ELSE
      UPDATE TEPIKRIZ
         SET FK_PACID    = pFK_PACID,
             FK_CLOBID   = pFK_CLOBID,
             FK_EPCLOBID = pFK_EPCLOBID,
             FK_REKCLOB  = pFK_REKCLOBID,
             FP_EPIKRIZ  = 1,
             FL_PODPIS   = pFL_PODPIS,
             FK_VRACHID  = pFK_VRACHID
       WHERE TEPIKRIZ.FK_ID = nID;
    END IF;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getStatNazIbClobID
  \*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getStatNazIbClob(pFK_PACID IN NUMBER, bEp IN NUMBER) RETURN CLOB IS
    CURSOR c(pFK_PACID IN NUMBER) IS
      SELECT /*+rule*/
       get_fullpath(fk_smid)||DECODE(fc_remark,NULL,'',', '||fc_remark) || ' ' || PKG_NAZ.GET_NAZPARAM1(FK_ID) AS naim,
       DECODE(pkg_manager.get_nazproc_count_ib(fk_id),0,1,pkg_manager.get_nazproc_count_ib(fk_id)) AS fn_count,
       get_nazdone(fk_id) AS fn_done
        FROM tnazlech
       WHERE fk_pacid = pFK_PACID
         AND fk_smid not in (SELECT FK_ID FROM TSMID START WITH FK_ID = GET_SYNID('STOM_PROC') CONNECT BY PRIOR FK_ID = FK_OWNER)-- by TimurLan
         AND get_nazdone(fk_id) >= 0
       ORDER BY fd_naz;
    sTmp    VARCHAR2(32767);
    cl      CLOB;
    BExists NUMBER := 0;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    IF pFK_PACID IS NULL THEN
      sTmp := '<p><h3 align = "center">ПРОВЕДЁННОЕ ЛЕЧЕНИЕ</h3></p>';
      DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
      if bep = 1 then
        sTmp := '<table style=''font-size:10.0pt''  align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
                '<tr><td align="center"><b>Наименование</b></td></tr>';
      else
        sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
                '<tr><td align="center"><b>Наименование</b></td>'||
                '<td align="center"><b>Количество</b></td></tr>';
      end if;
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR n in 1..arPacList.COUNT LOOP
        sTmp := '<tr><td colspan=2 align="left">';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        sTmp := '</td></tr>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        FOR i IN c(arPacList(n)) LOOP
          bExists := 1;
          if bep = 1 then
            sTmp := '<tr><td align="left">' || i.naim || '</td></tr>';
          else
            sTmp := '<tr><td align="left">' || i.naim || '</td>'||
                    '<td align="center">' || get_decode(i.fn_count, 1, '&nbsp', i.fn_done) || '</td></tr>';
          end if;
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END LOOP;
        IF bExists = 0 THEN
          sTmp := '<tr><td colspan=2 align="left">Не проводилось</td></tr>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END IF;
      END LOOP;
      sTmp := '</table>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    ELSE
      sTmp := '<p><h3 align = "center">ПРОВЕДЁННОЕ ЛЕЧЕНИЕ</h3></p>';
      DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
      if bep = 1 then
        sTmp := '<table style=''font-size:10.0pt''  align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
                '<tr><td align="center"><b>Наименование</b></td></tr>';
      else
        sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
                '<tr><td align="center"><b>Наименование</b></td>'||
                '<td align="center"><b>Количество</b></td></tr>';
      end if;
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR i IN c(pFK_PACID) LOOP
        bExists := 1;
        if bep = 1 then
          sTmp := '<tr><td align="left">' || i.naim || '</td></tr>';
        else
          sTmp := '<tr><td align="left">' || i.naim || '</td>'||
                  '<td align="center">' || get_decode(i.fn_count, 1, '&nbsp', i.fn_done) || '</td></tr>';
        end if;
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
      sTmp := '</table>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      IF bExists = 0 THEN
        sTmp := '<p>Не проводилось</p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END IF;
    END IF;
    RETURN cl;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getFullIbClobID
  \*------------------------------------------------------------------------------------------------------------------*/
  --полная история болезни
  FUNCTION getFullIbClobID(pFK_PACID IN NUMBER,pFK_SOTRID IN NUMBER DEFAULT -1) RETURN NUMBER IS
    CURSOR cIB is
      SELECT * FROM TS_PRINTIB_TMP ORDER BY FN_ORDER;
    cl     CLOB;
    clID   NUMBER;
    clTemp    CLOB;
  BEGIN
    INSERT INTO TS_PRINTIB_TMP
      SELECT *
        FROM TS_PRINTIB
       WHERE TS_PRINTIB.FL_PRINT = 1 AND
             GET_COUNT_TS_PRINTIB_RIGHTS(pFK_SOTRID, TS_PRINTIB.FK_ID) = 1;

    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);

    DBMS_LOB.append(cl, SET_getIbHeader(pFK_PACID));--

    FOR p in cIB LOOP
      begin
        DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
        EXECUTE IMMEDIATE 'DECLARE ' || 'BEGIN ' || ' :clTemp:=textib.' || p.FC_FUNC || '(:pFK_PACID); ' || 'END;'
          USING IN OUT clTemp, pFK_PACID;
        DBMS_LOB.APPEND(cl, clTemp);
        DBMS_LOB.FREETEMPORARY(clTemp);
      exception
        when others then
          null;
      end;
    END LOOP;

    /*DBMS_LOB.append(cl, SET_getIbDiags(pFK_PACID));--

    DBMS_LOB.append(cl, SET_GET_PAC_PROTIV(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getRazdelIbText1(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getanambolIbText(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getRazdelIbText2(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getRazdelIbText3(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getRazdelIbText4(pFK_PACID));--

    DBMS_LOB.append(cl, SET_do_diagbytype1(pFK_PACID));--

    DBMS_LOB.append(cl, SET_do_diagbytype2(pFK_PACID));--

    DBMS_LOB.append(cl, SET_GET_NAZRESULTKEK_IB(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getNazListIbText(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getProcListIbText(pFK_PACID));--

    DBMS_LOB.append(cl, SET_GetNazMed(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getTechBolIbText(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getStomIbText(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getResAnIbText(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getResNazIbText1(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getResNazIbText2(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getFirstPatalogy(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getEpikrizHeaderText(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getStatNazIbClob(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getVrachZakl(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getVrachRek(pFK_PACID));--

    DBMS_LOB.append(cl, SET_getPodpisiIbText(pFK_PACID));*/

    DBMS_LOB.writeappend(cl, LENGTH('</body></html>'), '</body></html>');

    INSERT INTO tclobs
      (fk_id, fc_clob)
    VALUES
      (-1, cl)
    RETURNING fk_id INTO clID;

    RETURN clID;
  END;
  /*------------------------------------------------------------------------------------------------------------------*\
  |               getFullIbClobID_by_SET
  \*------------------------------------------------------------------------------------------------------------------*/
  --Настраиваемая история болезни by TimurLan
  FUNCTION getFullIbClobID_by_SET(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 0) RETURN NUMBER
   IS
    --TYPE TPacList IS TABLE OF BINARY_INTEGER INDEX BY BINARY_INTEGER;
    --arPacList TPacList;
    CURSOR cIB is
      SELECT * FROM TS_PRINTIB_TMP WHERE FL_PRINT = 1 ORDER BY FN_ORDER;
    cTemp     VARCHAR2(32767);
    cl        CLOB;
    clTemp    CLOB;
    i         NUMBER := 0;
    clID      NUMBER;
  BEGIN
    if pFN_CALLTYPE = 0 then --если обыкновенная ИБ
      --RETURN getFullIbClobID(TO_NUMBER(pFC_PACID));
      /*cTemp:=pFC_PACID;
      LOOP
        EXIT WHEN cTemp is null;
        i:=i+1;
        arPacList(i):=decodeFC_PacID(cTemp);--заполняем массив переданными FK_PACID
      END LOOP;*/
      DoInitPacList(pFC_PACID);

      INSERT INTO TCLOBS
        (FC_CLOB)
      VALUES
        (EMPTY_CLOB())
      RETURNING FK_ID, FC_CLOB INTO clID, cl;
      DBMS_LOB.OPEN(cl, DBMS_LOB.LOB_READWRITE);

      if pFN_MODE = 1 and arPacList.COUNT > 1 then --параллельный режим (группируем по разделам)
        DBMS_LOB.APPEND (cl, SET_getIbHeader(pFC_PACID,pFN_MODE,pFN_TYPE));
        FOR p in cIB LOOP
          --FOR n in 1..arPacList.COUNT LOOP
            begin
              DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
              EXECUTE IMMEDIATE 'DECLARE ' || 'BEGIN ' || ' :clTemp:=textib.' ||
                                p.FC_FUNC || '(NULL,:pFN_MODE); ' || 'END;'
                USING IN OUT clTemp, /*arPacList(n), */pFN_MODE;--pFK_PACID;
              DBMS_LOB.APPEND(cl, clTemp);
              DBMS_LOB.FREETEMPORARY(clTemp);
            exception
              when others then
                null;
            end;
          --END LOOP;
        END LOOP;
      else/*if pFN_MODE = 0 then*/ --последовательный режим
        FOR n in 1..arPacList.COUNT LOOP
          DBMS_LOB.APPEND (cl, SET_getIbHeader(arPacList(n),pFN_MODE,pFN_TYPE));
          FOR p in cIB LOOP
            begin
              DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
              EXECUTE IMMEDIATE 'DECLARE ' || 'BEGIN ' || ' :clTemp:=textib.' ||
                                p.FC_FUNC || '(:pFK_PACID); ' || 'END;'
                USING IN OUT clTemp, arPacList(n);--pFK_PACID;
              DBMS_LOB.APPEND(cl, clTemp);
              DBMS_LOB.FREETEMPORARY(clTemp);
            exception
              when others then
                null;
            end;
          END LOOP;
        END LOOP;
      end if;

      DBMS_LOB.APPEND(cl, SET_getIbEnder(pFC_PACID,pFN_MODE,pFN_TYPE));
      DBMS_LOB.CLOSE(cl);
      RETURN clID;
    else -- если Амбулаторная ИБ
      RETURN PKG_TEXTIB.getFullIbClobID_by_SET(pFC_PACID,pFN_MODE,pFN_TYPE,pFN_CALLTYPE);
    end if;
  END;
  /*------------------------------------------------------------------------------------------------------------------*/
  /*------------------------------------------------------------------------------------------------------------------*/
  /*------Функции, возвращающие клобы для печати динамической ИБ -----------------------------------------------------*/
  /*------------------------------------------------------------------------------------------------------------------*/
  /*------------------------------------------------------------------------------------------------------------------*/
    function getFlurografText(pPacID in number) return varchar2
     is
      cursor c1 is
        SELECT FN_FLUR,
               FD_FLUR,
               DECODE(FL_FLUR,
                      0, 'Без патологии.',
                      1, 'Патология.',
                      'нет данных.') AS FL_FLUR,
               FC_FLUR
          FROM TKARTA
         WHERE FK_ID = pPACID;
      sTmp VARCHAR2(32767);
    begin
      FOR p in c1 LOOP
        if p.FN_FLUR is null then
          sTmp := 'Нет данных.';
          EXIT;
        end if;
        sTmp := PKG_REGIST_PACFUNC.REPLACE_SPACES('№' || p.FN_FLUR || ' от ' || TO_CHAR(p.FD_FLUR, 'dd.mm.yyyy') || '. Заключение: ' || p.FL_FLUR || ' ' || p.FC_FLUR);
      END LOOP;
      RETURN sTmp;
    end;
  /*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getIbHeaderNormal(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
    s VARCHAR2(32767) := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||
         '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||
         'xmlns:w="urn:schemas-microsoft-com:office:word"'||
         'xmlns="http://www.w3.org/TR/REC-html40">'||
         '<head><meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
         '<meta name=ProgId content=Word.Document>'||
         '<title>МИС ПАЦИЕНТ - История болезни №##VALUE01</title></head>'||CHR(13)||
         '<body><table width=100% border=0>' ||
         '<tr>' ||
         ' <td colspan=4><div align=right><font style=''font-size:8.0pt''>Учетная форма 3-кур<BR>Утв. МЗ СССР 02.06.82г. №522</font></div><hr></td>' ||
         '</tr><tr>' ||
         ' <td colspan=4><table width=100% border=0>' ||
         ' <tr>' ||
         '  <!--<td width=90><img src=c://asu/000.jpg></img></td>-->' ||
         '  <td><div align=center><font style=''color:navy''><b>Ханты-Мансийский автономный округ<BR><BR><i>государственное учреждение здравоохранения</i></b></font><BR>' ||
         '  <font style=''font-size:14.0pt;color:red''><b>ОКРУЖНАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА</b></font></div></td>' ||
         ' </tr></table>' ||
         ' </td>' ||
         '</tr><tr>' ||
         ' <td colspan=4><p align=center><font style=''font-size:18.0pt''><BR><b>ИСТОРИЯ БОЛЕЗНИ № ##VALUE02</b></font></p></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>&nbsp;</td>' ||
         ' <td width=21%>&nbsp;</td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%><b><i>##VALUE03</i></b></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Фамилия:</td>' ||
         ' <td width=21%><B>##VALUE04</B></td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%>&nbsp;<B>&nbsp;</B></td>' ||
         --' <td width=47%>##VALUE05 №: <B>##VALUE06</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Имя:</td>' ||
         ' <td width=21%><B>##VALUE07</B></td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%>Дата поступления: <B>##VALUE08</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Отчество:</td>' ||
         ' <td width=21%><B>##VALUE09</B></td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%>Выписан: <B>##VALUE10</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Возраст:</td>' ||
         ' <td width=21%><B>##VALUE11</B></td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%>Проведено на лечении: <B>##VALUE12 к.дн.</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Место работы:</td>' ||
         ' <td width=21%><B>##VALUE13</B></td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%><B>##VALUE14</B><BR>Проживает в палате: <B>##VALUE15</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Домашний адрес:</td>' ||
         ' <td colspan=3><B>##VALUE16</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Рентгенологическое исследование:</td>' ||
         ' <td colspan=3><B>##VALUE17<B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>##VALUE19:</td>' ||
         ' <td colspan=3><B>##VALUE18<B></font></td>' ||
         '</tr></table>'||CHR(13);
    CURSOR cMain IS
      SELECT PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID) FC_IB,
             GET_OTDNAME(GET_VRACHOTD(PKG_REGIST_PACFUNC.GET_PAC_VRACHID(pFK_PACID))) FC_OTDEL,
             PKG_REGIST_PACFUNC.GET_PAC_VRACHFIO(pFK_PACID) FC_VRACH,
             PKG_REGIST_PACFUNC.GET_PAC_VRACHID(pFK_PACID) FK_VRACHID,
             PKG_REGIST_PACFUNC.GET_PAC_FCPALATA(pFK_PACID) FC_PALATA,
             TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH, T.FC_PUT,
             PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(TPEOPLES.FK_ID) FC_ADR,
             PKG_REGIST_PEPLFUNC.GET_PEPL_WORKPLACE(TPEOPLES.FK_ID) FC_RABOTA,
             PKG_REGIST_PACFUNC.GET_PAC_INCOME(pFK_PACID) FD_IN,
             PKG_REGIST_PACFUNC.GET_PAC_PLANOUTCOME(pFK_PACID) FD_OUT,
             PKG_REGIST_PACFUNC.GET_PAC_DAYS(pFK_PACID) FN_KDN,
             PKG_REGIST_PEPLFUNC.GET_PEPL_AGE_MONTH(TPEOPLES.FK_ID) FC_AGE,
             TPRIZN.FC_NAME FC_PRIZN,
             'Пол: '||LOWER(PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID)) FC_GROUP_SEX
             --TGROUP.FC_NAME||'. Пол: '||LOWER(PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID)) FC_GROUP_SEX
        FROM TPEOPLES, /*TGROUP, */TPRIZN,
             (SELECT /*FK_GROUPID, */FK_PRIZN, FC_PUT, FK_PEPLID FROM TKARTA WHERE FK_ID = pFK_PACID
              UNION
              SELECT /*FK_GROUPID, */FK_PRIZN, FC_PUT, FK_PEPLID FROM TAMBULANCE WHERE FK_ID = pFK_PACID
              ) T
       WHERE TPEOPLES.FK_ID(+) = T.FK_PEPLID
         --AND TGROUP.FK_ID(+) = T.FK_GROUPID
         AND TPRIZN.FK_ID(+) = T.FK_PRIZN;
    bLechVrach NUMBER;
  BEGIN
    FOR p in cMain LOOP
      s := REPLACE(s,'##VALUE01',p.FC_IB);
      s := REPLACE(s,'##VALUE02',p.FC_IB);
      s := REPLACE(s,'##VALUE03',p.FC_GROUP_SEX);
      s := REPLACE(s,'##VALUE04',p.FC_FAM);
      if p.FC_PRIZN like 'Кон%' then
        s := REPLACE(s,'##VALUE05','Реабилитационный курс лечения');
      else
        s := REPLACE(s,'##VALUE05','Путевка');
      end if;
      s := REPLACE(s,'##VALUE06',P.FC_PUT);
      s := REPLACE(s,'##VALUE07',p.FC_IM);
      s := REPLACE(s,'##VALUE08',TO_CHAR(p.FD_IN,'dd.mm.yyyy'));
      s := REPLACE(s,'##VALUE09',p.FC_OTCH);
      s := REPLACE(s,'##VALUE10',TO_CHAR(p.FD_OUT,'dd.mm.yyyy'));
      s := REPLACE(s,'##VALUE11',p.FC_AGE);
      s := REPLACE(s,'##VALUE12',p.FN_KDN);
      s := REPLACE(s,'##VALUE13',p.FC_RABOTA);
      s := REPLACE(s,'##VALUE14',p.FC_OTDEL);
      s := REPLACE(s,'##VALUE15',p.FC_PALATA);
      s := REPLACE(s,'##VALUE16',p.FC_ADR);
      s := REPLACE(s,'##VALUE17',getFlurografText(pFK_PACID));
      s := REPLACE(s,'##VALUE18',p.FC_VRACH);
      begin
        SELECT NVL(FP_VRACH,1) into bLechVrach FROM TSOTR WHERE FK_ID = p.FK_VRACHID;
        if bLechVrach = 1 then
          s := REPLACE(s,'##VALUE19','Лечащий врач');
        else
          s := REPLACE(s,'##VALUE19','Заполнил');
        end if;
      exception when others then null;
      end;
    END LOOP;
    RETURN s;
  END;
  /*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getIbHeaderMulti(pFC_PACID IN VARCHAR2) RETURN VARCHAR2 IS
    s VARCHAR2(32767) := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||
         '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||
         'xmlns:w="urn:schemas-microsoft-com:office:word"'||
         'xmlns="http://www.w3.org/TR/REC-html40">'||
         '<head><meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
         '<meta name=ProgId content=Word.Document>'||
         '<title>МИС ПАЦИЕНТ - История болезни (##VALUE04 ##VALUE07 ##VALUE09)</title></head>'||CHR(13)||
         '<body><table width=100% border=0>' ||
         '<tr>' ||
         ' <td colspan=4><div align=right><font style=''font-size:8.0pt''>Учетная форма 3-кур<BR>Утв. МЗ СССР 02.06.82г. №522</font></div><hr></td>' ||
         '</tr><tr>' ||
         ' <td colspan=4><table width=100% border=0>' ||
         ' <tr>' ||
         '  <!--<td width=90><img src=c://asu/000.jpg></img></td>-->' ||
         '  <td><div align=center><font style=''color:navy''><b>Ханты-Мансийский автономный округ<BR><BR><i>государственное учреждение здравоохранения</i></b></font><BR>' ||
         '  <font style=''font-size:14.0pt;color:red''><b>ОКРУЖНАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА</b></font></div></td>' ||
         ' </tr></table>' ||
         ' </td>' ||
         '</tr><tr>' ||
         ' <td colspan=4><p align=center><font style=''font-size:18.0pt''><BR><b>ПОЛНАЯ ИСТОРИЯ БОЛЕЗНИ</b></font></p></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Фамилия:</td>' ||
         ' <td width=21%><B>##VALUE04</B></td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%><B>##VALUE03</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Имя:</td>' ||
         ' <td width=21%><B>##VALUE07</B></td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%>Всего обращений: <B>##VALUE08</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Отчество:</td>' ||
         ' <td width=21%><B>##VALUE09</B></td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%>из них амбулаторно: <B>##VALUE10</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Возраст:</td>' ||
         ' <td width=21%><B>##VALUE11</B></td>' ||
         ' <td width=4%>&nbsp;</td>' ||
         ' <td width=47%>Проведено на лечении всего: <B>##VALUE12 к.дн.</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Место работы:</td>' ||
         ' <td colspan=3><B>##VALUE13</B></td>' ||
         '</tr><tr>' ||
         ' <td width=28%>Домашний адрес:</td>' ||
         ' <td colspan=3><B>##VALUE16</B></td>' ||
         '</tr></table>'||CHR(13);
    CURSOR cMain(pFK_PEPLID IN NUMBER) IS
      SELECT TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH,
             PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(TPEOPLES.FK_ID) FC_ADR,
             PKG_REGIST_PEPLFUNC.GET_PEPL_WORKPLACE(TPEOPLES.FK_ID) FC_RABOTA,
             PKG_REGIST_PEPLFUNC.GET_PEPL_AGE_MONTH(TPEOPLES.FK_ID) FC_AGE,
             'Пол: '||LOWER(PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID)) FC_GROUP_SEX
             --TGROUP.FC_NAME||'. Пол: '||LOWER(PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID)) FC_GROUP_SEX
        FROM TPEOPLES/*, TGROUP*/
       WHERE TPEOPLES.FK_ID = pFK_PEPLID/*
         AND TGROUP.FK_ID(+) = TPEOPLES.FK_GROUPID*/;
    CURSOR cCount(pFK_PEPLID IN NUMBER) IS
      SELECT FN_SKOL+FN_AKOL KOL_SUM, FN_SKDN+FN_AKDN KDN_SUM, T1.*,T2.* FROM
      (SELECT COUNT(FK_ID) FN_SKOL, NVL(SUM(PKG_REGIST_PACFUNC.GET_PAC_DAYS(FK_ID)),0) FN_SKDN
        FROM TKARTA
       WHERE FK_PEPLID = pFK_PEPLID) T1,
      (SELECT COUNT(FK_ID) FN_AKOL, 0 FN_AKDN
        FROM TAMBULANCE
       WHERE FK_PEPLID = pFK_PEPLID) T2;
    CURSOR cIb(pFK_PACID IN NUMBER) IS
      SELECT PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID) FC_IB,
             PKG_REGIST_PACFUNC.GET_PAC_VRACHFIO(pFK_PACID) FC_VRACH,
             PKG_REGIST_PACFUNC.GET_PAC_INCOME(pFK_PACID) FD_IN
        FROM DUAL;
    --TYPE TPacList IS TABLE OF BINARY_INTEGER INDEX BY BINARY_INTEGER;
    --arPacList TPacList;
    clTemp   CLOB;
    cTemp    VARCHAR2(32767);
    nPeplID  NUMBER;
    i        NUMBER := 0;
  BEGIN
    /*cTemp:=pFC_PACID;
    LOOP
      EXIT WHEN cTemp is null;
      i:=i+1;
      arPacList(i):=decodeFC_PacID(cTemp);--заполняем массив переданными FK_PACID
    END LOOP;*/
    DoInitPacList(pFC_PACID);

    BEGIN
      SELECT * INTO nPeplID FROM
       (SELECT FK_PEPLID FROM TKARTA WHERE FK_ID = arPacList(1)
        UNION
        SELECT FK_PEPLID FROM TAMBULANCE WHERE FK_ID = arPacList(1));
    EXCEPTION WHEN NO_DATA_FOUND THEN
      RETURN 'Ошибка функции getIbHeaderMulti. Параметр pFC_PACID='||pFC_PACID;
    END;
    FOR p in cCount(nPeplID) LOOP
      s := REPLACE(s,'##VALUE08',p.KOL_SUM);
      s := REPLACE(s,'##VALUE10',p.FN_AKOL);
      s := REPLACE(s,'##VALUE12',p.KDN_SUM);
    END LOOP;
    FOR p in cMain(nPeplID) LOOP
      s := REPLACE(s,'##VALUE03',p.FC_GROUP_SEX);
      s := REPLACE(s,'##VALUE04',p.FC_FAM);
      s := REPLACE(s,'##VALUE07',p.FC_IM);
      s := REPLACE(s,'##VALUE09',p.FC_OTCH);
      s := REPLACE(s,'##VALUE11',p.FC_AGE);
      s := REPLACE(s,'##VALUE13',p.FC_RABOTA);
      s := REPLACE(s,'##VALUE16',p.FC_ADR);
    END LOOP;
    cTemp := --'<div align=right><U>Обращения в медучреждения:</U></div>'||
             '<TABLE style=''width:99.9%;border:none;mso-border-alt:none''>'||
             ' <tr>'||
             '  <td style=''text-align:center;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt''>№ п/п</td>'||
             '  <td style=''text-align:center;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt''>№ И.Б.</td>'||
             '  <td style=''text-align:center;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt''>Дата обращения:</td>'||
             '  <td style=''text-align:center;border-bottom:solid windowtext .5pt''>Заполнил:</td>'||
             ' </tr>';
    FOR i in 1..arPacList.COUNT LOOP
      FOR p in cIB(arPacList(i)) LOOP
      cTemp := cTemp||'<tr>'||
             '  <td style=''text-align:center;border-right:solid windowtext .5pt''>'||i||'</td>'||
             '  <td style=''text-align:right;border-right:solid windowtext .5pt''>'||p.FC_IB||'</td>'||
             '  <td style=''text-align:right;border-right:solid windowtext .5pt''>'||NVL(TO_CHAR(p.FD_IN,'dd.mm.yyyy'),'Амбулаторно')||'</td>'||
             '  <td style=''text-align:right''>'||p.FC_VRACH||'</td>'||
             ' </tr>';
      END LOOP;
    END LOOP;
    s := s ||cTemp||'</TABLE>';
    RETURN s;
  END;
  /*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getIbHeader(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1) RETURN CLOB IS
    --TYPE TPacList IS TABLE OF BINARY_INTEGER INDEX BY BINARY_INTEGER;
    --arPacList TPacList;
    clTemp CLOB;
    cTemp  VARCHAR2(32767);
    i      NUMBER := 0;
  BEGIN
    /*cTemp:=pFC_PACID;
    LOOP
      EXIT WHEN cTemp is null;
      i:=i+1;
      arPacList(i):=decodeFC_PacID(cTemp);--заполняем массив переданными FK_PACID
    END LOOP;*/
    if INSTR (pFC_PACID,',') = 0 then
      null;
    else
      DoInitPacList(pFC_PACID);
    end if;

    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    /*cTemp := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||
         '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||
         'xmlns:w="urn:schemas-microsoft-com:office:word"'||
         'xmlns="http://www.w3.org/TR/REC-html40">'||
         '<head>'||
         '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
         '<meta name=ProgId content=Word.Document>'||
         '<title>МИС ПАЦИЕНТ - История болезни</title><body>';
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);

    cTemp:='';*/
    if pFN_TYPE = 1 then
      if INSTR (pFC_PACID,',') = 0 /*arPacList.COUNT = 1 */then
        --cTemp := getIbHeaderNormal(pFC_PACID/*arPacList(1)*/);
        RETURN  stat.pkg_hant.get_report_003(pFC_PACID,TRUE);--by XANDER 11.04.05
      else
        cTemp := getIbHeaderMulti(pFC_PACID);
        /*FOR i in 1..arPacList.COUNT LOOP
          cTemp := cTemp||'<P>'||TO_CHAR(i)||' История болезни '||GET_IB(arPacList(i))||'</P>';
        END LOOP;*/
      end if;
    elsif pFN_TYPE = 2 then
      if INSTR (pFC_PACID,',') = 0 then
        cTemp := '<P>Амбулаторная карта '||GET_IB(pFC_PACID)||'</P>';
      else
        FOR i in 1..arPacList.COUNT LOOP
          cTemp := cTemp||'<P>'||TO_CHAR(i)||' Амбулаторная карта '||GET_IB(arPacList(i))||'</P>';
        END LOOP;
        --cTemp := cTemp||'<P>'||TO_CHAR(i)||' Амбулаторная карта '||GET_IB(arPacList(i))||'</P>';
      end if;
      /*if arPacList.COUNT = 1 then
          cTemp := '<P>Амбулаторная карта '||GET_IB(arPacList(i))||'</P>';
      else
        FOR i in 1..arPacList.COUNT LOOP
          cTemp := cTemp||'<P>'||TO_CHAR(i)||' Амбулаторная карта '||GET_IB(arPacList(i))||'</P>';
        END LOOP;
      end if;*/
    elsif pFN_TYPE = 3 then
      if INSTR (pFC_PACID,',') = 0 then
        cTemp := '<P>Выписка из ИБ '||GET_IB(pFC_PACID)||'</P>';
      else
        FOR i in 1..arPacList.COUNT LOOP
          cTemp := cTemp||'<P>'||TO_CHAR(i)||' Выписка из ИБ '||GET_IB(arPacList(i))||'</P>';
        END LOOP;
        --cTemp := cTemp||'<P>'||TO_CHAR(i)||' Выписка из ИБ '||GET_IB(arPacList(i))||'</P>';
      end if;
      /*if arPacList.COUNT = 1 then
          cTemp := '<P>Выписка из ИБ '||GET_IB(arPacList(i))||'</P>';
      else
        FOR i in 1..arPacList.COUNT LOOP
          cTemp := cTemp||'<P>'||TO_CHAR(i)||' Выписка из ИБ '||GET_IB(arPacList(i))||'</P>';
        END LOOP;
      end if;*/
    end if;

    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getIbEnder(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1) RETURN CLOB IS
    clTemp CLOB;
    cTemp  VARCHAR2(32767):= '</BODY></HTML>';
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getIbDiags(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getIbDiags(NULL,pFN_MODE));
    ELSE
      DBMS_LOB.APPEND(clTemp, getIbDiags(pFK_PACID,pFN_MODE));
      DBMS_LOB.APPEND(clTemp, SET_GET_PAGE_BREAK(pFK_PACID));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_GET_PAC_PROTIV(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF GET_PAC_PROTIV(pFK_PACID) = 1 THEN
      /*IF pFN_MODE = 1 THEN
        DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      END IF;*/
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('<p><B>Лечение в данном медучреждении противопоказано.</B></P>'),'<p><B>Лечение в данном медучреждении противопоказано.</B></P>');
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getAnambolIbText(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getAnambolIbText(NULL));
    ELSE
      DBMS_LOB.APPEND(clTemp, getAnambolIbText(pFK_PACID));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getRazdelIbText1(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getRazdelIbText(NULL, get_galobid, 'Жалобы', 'Жалоб нет'));
    ELSE
      DBMS_LOB.APPEND(clTemp, getRazdelIbText(pFK_PACID, get_galobid, 'Жалобы', 'Жалоб нет'));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getRazdelIbText2(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getRazdelIbText(NULL, get_anamgiznid, 'Анамнез жизни', 'Без особенностей'));
    ELSE
      DBMS_LOB.APPEND(clTemp, getRazdelIbText(pFK_PACID, get_anamgiznid, 'Анамнез жизни', 'Без особенностей'));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getRazdelIbText3(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getRazdelIbText(NULL, get_epidid, 'Эпиданамнез', 'Без патологии'));
    ELSE
      DBMS_LOB.APPEND(clTemp, getRazdelIbText(pFK_PACID, get_epidid, 'Эпиданамнез', 'Без патологии'));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getRazdelIbText4(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getRazdelIbText(NULL, get_doiid, 'Данные объективных исследований', ''));
    ELSE
      DBMS_LOB.APPEND(clTemp, getRazdelIbText(pFK_PACID, get_doiid, 'Данные объективных исследований', ''));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_GET_PAGE_BREAK(pFK_PACID IN NUMBER) RETURN CLOB IS
    clTemp CLOB;
    sTemp VARCHAR2(32767) :='<span><br clear=all style=''page-break-before:always''></span>';
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sTemp), sTemp);
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_GET_HR(pFK_PACID IN NUMBER) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH('<p><font size=-12><hr></p>'), '<p><font size=-12><hr></p>');
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_GET_RAZD_BREAK(pFK_PACID IN NUMBER) RETURN CLOB IS
    clTemp CLOB;
    sTemp VARCHAR2(32767):= '<p><font style=''font-size:8.0pt;font-family:"Courier New"''><u>Раздел ИБ '||PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID)||' ('||PKG_REGIST_PACFUNC.GET_PAC_VRACHFIO(pFK_PACID)||'):</u></font><BR>';
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sTemp), sTemp);
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_do_diagbytype1(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
    cTemp  VARCHAR2(32767);
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      cTemp := '<p><b>Предварительный диагноз:</b><br><u>Основной:</u> ' || do_diagbytype(/*pFK_PACID, */6, 1, -1, 1);
    ELSE
      cTemp := '<p><b>Предварительный диагноз:</b><br><u>Основной:</u> ' || asu.do_diagbytype(pFK_PACID, 6, 1, -1, 1);
    END IF;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_do_diagbytype2(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
    cTemp  VARCHAR2(32767);
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      cTemp := '<br><u>Сопутствующий:</u> ' || do_diagbytype(/*pFK_PACID, */6, 0, -1, 1) || '' || '</p>';
    ELSE
      cTemp := '<br><u>Сопутствующий:</u> ' || asu.do_diagbytype(pFK_PACID, 6, 0, -1, 1) || '' || '</p>';
    END IF;
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_GET_NAZRESULTKEK_IB(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    CURSOR cIS_HAVE_KEK(pFK_PACID IN NUMBER)
     IS
      SELECT FK_ID
        FROM TNAZKONS
       WHERE FK_PACID = pFK_PACID
         AND FK_NAZSOSID = GET_VIPNAZ
         AND FK_SMID = GET_KEKKONSID;
    clTemp  CLOB;
    cTemp   VARCHAR2(32767);
    nKEK_ID NUMBER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFK_PACID IS NOT NULL THEN
      FOR p in cIS_HAVE_KEK(pFK_PACID) LOOP
        cTemp := PKG_NAZ.GET_NAZRESULTKEK_IB(p.FK_ID)||'<BIG>';
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
      END LOOP;
    ELSE
      FOR n in 1..arPacList.COUNT LOOP
        FOR p in cIS_HAVE_KEK(arPacList(n)) LOOP
          DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(arPacList(n)));
          cTemp := PKG_NAZ.GET_NAZRESULTKEK_IB(p.FK_ID)||'<BIG>';
          DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
        END LOOP;
      END LOOP;
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getNazListIbText(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getNazListIbText(pFK_PACID));
    ELSE
      DBMS_LOB.APPEND(clTemp, getNazListIbText(pFK_PACID));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getProcListIbText(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getProcListIbText(pFK_PACID));
    ELSE
      DBMS_LOB.APPEND(clTemp, getProcListIbText(pFK_PACID));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_GetNazMed(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
--      DBMS_LOB.APPEND(clTemp, GetNazMed(pFK_PACID));
      NULL;
    ELSE
--      DBMS_LOB.APPEND(clTemp, GetNazMed(pFK_PACID));
      NULL;
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION GET_KONSHTML(iname VARCHAR,isos NUMBER,ifd_date VARCHAR2,ifk_nazid NUMBER,pFk_pacid NUMBER,ifc_res VARCHAR,iispol NUMBER) RETURN CLOB IS
CURSOR cPics(pFK_NAZID IN NUMBER) IS
      SELECT b.fk_id, b.fc_coment, p.fc_ext, p.fn_height, p.fn_width, dbms_lob.getlength(b.fb_b) bSize
        FROM tblobs b, tpics p
       WHERE p.fk_nazid = pFK_NAZID AND b.fk_id = p.fk_blobid AND
             fl_showib = 1;

    CURSOR cFiles(pFK_NAZID IN NUMBER) IS
      SELECT TFILES.*,TBLOBS.FC_COMENT,DBMS_LOB.GETLENGTH(TBLOBS.FB_B) BSIZE
        FROM TFILES,TBLOBS
       WHERE TFILES.FK_NAZID = pFK_NAZID AND TBLOBS.FK_ID(+) = TFILES.FK_BLOBID AND TFILES.FL_SHOWIB = 1;

    cl                  CLOB;
    resID               NUMBER;
    sTmp                VARCHAR2(32767);
    sDiag               VARCHAR2(32767);
    bExists             NUMBER := 0;
    fl_showdiagpredzakl NUMBER;
    nWidth              INTEGER;
    nHeight             INTEGER;
    nRatio              NUMBER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    if isos = get_neyav then
          bExists := 1;
          --sTmp    := '<br>Дата выполнения: ' || i.fd_date || '<B> ' || i.name || ': <font color=red><u>' ||'Пациент не явился.</u></font></b></P>';
          sTmp    := '<P><B>' || iname || '</B> <I>' || ifd_date || '</I><BR><b><font color=red><u>' ||'Пациент не явился.</u></font></b></P>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        else
          bExists := 1;
          sTmp    := '<P><B>' || iname || '</B> <I>' || ifd_date || '</I>';
          sDiag   := asu.do_diagbytype(pFK_PACID, 4, 1, ifk_nazid, 1) || ' ' || asu.do_diagbytype(pFK_PACID, 4, 0, ifk_nazid, 1);
          IF sDiag <> ' ' THEN
            sTmp := sTmp || '<br><B>Диагноз:</b>' || sDiag;
          END IF;
          sTmp := sTmp || '<br>' || ifc_res;
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

          FOR j IN cPics(ifk_nazid) LOOP
            nWidth  := j.fn_width;
            nHeight := j.fn_height;
            IF nWidth > 640 THEN
              nRatio  := 640 / nWidth;
              nWidth  := 640;
              nHeight := nHeight * nRatio;
            END IF;
            IF nHeight > 488 THEN
              nRatio  := 488 / nHeight;
              nHeight := 488;
              nWidth  := nWidth * nRatio;
            END IF;
            if j.bSize > 0 then
              sTmp := '<br><img src=' || j.fk_id || j.fc_ext || ' width="' || nWidth || '" height="' || nHeight || '"></img><br>' || j.fc_coment;
            else
              sTmp := '<br><img src=noimage.jpg></img><br>' || j.fc_coment;
            end if;
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
          END LOOP;

          FOR j IN cFiles(ifk_nazid) LOOP
            if j.bSize > 0 then
              sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || '<br>' || j.FC_COMENT || '</div>';
            else
              sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || ' - отсутствует.<br>' || j.FC_COMENT || '</div>';
            end if;
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
          END LOOP;
          sTmp:='<br>Специалист: '||INITCAP(do_vrachfio(iispol))||' _____________________';
          DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
        END IF;
   RETURN cl;
  END;
  FUNCTION SET_getTechBolIbText(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp   CLOB;
    ep       CLOB;
    bExist   NUMBER;
    CURSOR CUR IS SELECT * FROM
       ((SELECT vnaz.fd_run,vnaz.fk_id,vres.fc_res,vnaz.fk_smid,vnaz.fk_ispolid,vnaz.fk_nazsosid, 1 t FROM vnaz,vres WHERE vnaz.fk_id=vres.fk_nazid AND vnaz.fk_pacid=pFk_pacid AND vnaz.fk_smid IN (STAT.PKG_STATUTIL.get_smidid('TECHBOLEZNI'),STAT.PKG_STATUTIL.get_smidid('KONS_DEZHOSM'),STAT.PKG_STATUTIL.get_smidid('KONS_OBHODZAVOTD'),STAT.PKG_STATUTIL.get_smidid('KONS_OBHODZAVKAF'),STAT.PKG_STATUTIL.get_smidid('KONS_OBHODZAMGLAV'),STAT.PKG_STATUTIL.get_smidid('KONS_KONSILIUM')))
        UNION
       (SELECT fd_date fd_run,fk_id,null fc_res,-1 fk_smid,-1 fk_ispolid,fp_reslech fk_nazsosid, 2 t FROM tepikriz WHERE fk_pacid=pFK_PACID AND fp_type=5 and fn_del=0)) ORDER BY fd_run;
  BEGIN
    /* by XANDER 29.06.2005
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getTechBolIbText(pFK_PACID));
    ELSE
      DBMS_LOB.APPEND(clTemp, getTechBolIbText(pFK_PACID));
    END IF;*/
    bExist:=0;
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    DBMS_LOB.CREATETEMPORARY(ep, TRUE, DBMS_LOB.call);
    sHtml := '<p><h3 align="center">ДИНАМИКА НАБЛЮДЕНИЙ</h3></p>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sHtml), sHtml);
    FOR C IN CUR LOOP
     IF C.t=1 THEN
     bExist:=1;
        /*sHtml:='<br><b>'||GET_SMIDNAME(c.fk_smid)||'</b><br> Дата: '||
                TO_CHAR(C.fd_run,'DD.MM.YYYY HH.MI')||'<br>'||REPLACE(c.fc_res,CHR(10),'<br>')||
                '<br>Исполнитель: '||GET_SOTRNAME(c.fk_vrachid);*/

        DBMS_LOB.append(clTemp,Get_KonsHtml(GET_SMIDNAME(C.fk_smid),C.fk_nazsosid,TO_CHAR(C.fd_run,'DD.MM.YYYY HH:MI'),C.fk_id,pFk_pacid,REPLACE(c.fc_res,CHR(10),'<br>'),C.fk_ispolid));
        DBMS_LOB.append(clTemp,GET_PLANS_FOR_OSMOTR(C.fk_id,pFk_pacid));
     ELSIF C.t=2 THEN-- эпикризы
      FOR cEP IN (SELECT * FROM tepikriz WHERE fk_id=C.fk_id) LOOP
       SELECT fc_clob INTO ep FROM tclobs WHERE fk_id=cEP.fk_epclobid;
       DBMS_LOB.writeappend(clTEmp, LENGTH('<br>'), '<br>');
       ep:=CLOB_REPLACE (ep,'<HTML>',' ');
       ep:=CLOB_REPLACE (ep,'</HTML>',' ');
       ep:=CLOB_REPLACE (ep,'<BODY>',' ');
       ep:=CLOB_REPLACE (ep,'</BODY>',' ');
       DBMS_LOB.append(clTemp,ep);
      END LOOP;
     END IF;
    END LOOP;
    IF bExist = 0 THEN
      sTmp := '<p>Не проводились</p>';
      DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getResAnIbText(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getResAnIbText(pFK_PACID));
    ELSE
      DBMS_LOB.APPEND(clTemp, getResAnIbText(pFK_PACID));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getResNazIbText1(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getResNazIbText(pFK_PACID, get_issledid, 'РЕЗУЛЬТАТЫ ДИАГНОСТИЧЕСКИХ ИССЛЕДОВАНИЙ'));
    ELSE
      DBMS_LOB.APPEND(clTemp, getResNazIbText(pFK_PACID, get_issledid, 'РЕЗУЛЬТАТЫ ДИАГНОСТИЧЕСКИХ ИССЛЕДОВАНИЙ'));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getResNazIbText2(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getResNazIbText(pFK_PACID, get_konsid, 'Консультации специалистов'));
    ELSE
      DBMS_LOB.APPEND(clTemp, getResNazIbText(pFK_PACID, get_konsid, 'Консультации специалистов'));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getFirstPatalogy(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getFirstPatalogy(pFK_PACID));
    ELSE
      DBMS_LOB.APPEND(clTemp, getFirstPatalogy(pFK_PACID));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getEpikrizHeaderText(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
    ep     CLOB;
  BEGIN
   /* by XANDER
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
--    IF pFN_MODE = 1 THEN
    IF pFK_PACID IS NULL THEN
      cTemp := '<p><h3 align = "center">Выписной эпикриз</h3></p>';
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(arPacList(n)));
        cTemp := getEpikrizHeaderText(arPacList(n), 1, 0);
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
      END LOOP;
    ELSE
      cTemp := '<p><h3 align = "center">Выписной эпикриз</h3></p>' || getEpikrizHeaderText(pFK_PACID, 1, 0);
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
    END IF;*/
   DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
   DBMS_LOB.CREATETEMPORARY(ep, TRUE, DBMS_LOB.call);
      FOR cEP IN (SELECT * FROM tepikriz WHERE fp_type IN (1,2,3) AND fk_pacid=pfk_pacid and fn_del=0) LOOP
       SELECT fc_clob INTO ep FROM tclobs WHERE fk_id=cEP.fk_epclobid;
       DBMS_LOB.writeappend(clTEmp, LENGTH('<br>'), '<br>');
       ep:=CLOB_REPLACE (ep,'<HTML>',' ');
       ep:=CLOB_REPLACE (ep,'</HTML>',' ');
       ep:=CLOB_REPLACE (ep,'<BODY>',' ');
       ep:=CLOB_REPLACE (ep,'</BODY>',' ');
       DBMS_LOB.append(clTemp,ep);
      END LOOP;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getStatNazIbClob(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getStatNazIbClob(pFK_PACID, 0));
    ELSE
      DBMS_LOB.APPEND(clTemp, getStatNazIbClob(pFK_PACID, 0));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getVrachZakl(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getVrachZakl(pFK_PACID));
    ELSE
      DBMS_LOB.APPEND(clTemp, getVrachZakl(pFK_PACID));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getVrachRek(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getVrachRek(pFK_PACID));
    ELSE
      DBMS_LOB.APPEND(clTemp, getVrachRek(pFK_PACID));
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getPodpisiIbText(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
    cTemp  VARCHAR2(32767);
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    --IF pFN_MODE = 1 THEN
    IF pFK_PACID IS NULL THEN
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(arPacList(n)));
        cTemp := getPodpisiIbText(arPacList(n));
        DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
      END LOOP;
    ELSE
      cTemp := getPodpisiIbText(pFK_PACID);
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
    END IF;
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION SET_getStomIbText(pFK_PACID IN NUMBER,pFN_MODE IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    IF pFN_MODE = 1 THEN
      --DBMS_LOB.APPEND(clTemp, SET_GET_RAZD_BREAK(pFK_PACID));
      DBMS_LOB.APPEND(clTemp, getStomIbText(pFK_PACID));
    ELSE
      DBMS_LOB.APPEND(clTemp, getStomIbText(pFK_PACID));
    END IF;
    RETURN clTemp;
  END;


  --первичный осмотр by XANDER
  FUNCTION SET_FIRSTOSM(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
    nPriemId NUMBER:=-1;
    CURSOR cSmidParam(nNazid NUMBER, pFk_smid NUMBER) IS SELECT   tsmid.fc_name, tsmid.fk_id, tsmid.fc_type,DECODE (tsmid.fc_type,
                         'EDIT', get_smid_values.get_fc_char (tsmid.fk_id,nNazid,tsmid.fc_type),
                         'MEMO', get_smid_values.get_fc_char (tsmid.fk_id,nNazid,tsmid.fc_type),
                         'BIGMEMO', get_smid_values.get_fc_char (tsmid.fk_id,nNazid,tsmid.fc_type),
                         'COMBOBOX', get_smidname(get_smid_values.get_cbx (tsmid.fk_id,nNazid,tsmid.fc_type)),
                         'NUMBER', TO_CHAR(get_smid_values.get_number (tsmid.fk_id,nNazid,tsmid.fc_type)),
                         'VARCHAR2', get_smid_values.get_edit (tsmid.fk_id,nNazid,tsmid.fc_type)) sname
                    FROM (SELECT * FROM tsmid WHERE fk_id<>pFk_smid CONNECT BY PRIOR fk_id=fk_owner START WITH fk_id=pFk_smid) tsmid
                    ORDER BY tsmid.fn_order;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    sHtml := '<p><h3 align="center">ПЕРВИЧНЫЙ ОСМОТР ВРАЧА</h3></p>';
    FOR C IN (SELECT * FROM vres WHERE fk_pacid=pFK_PACID AND fk_smid=STAT.PKG_STATUTIL.get_smidid('PERV_OSMOTR'))LOOP
     nPriemID:=C.fk_nazid;
     sHtml:=sHtml||'<P><B>' ||get_smidname(c.fk_smid)|| '</B> <I>' || TO_CHAR(c.fd_ins,'dd.mm.yy hh:MI') || '</I>'||'<br>'||REPLACE(C.fc_res,CHR(10),'<br>');
    END LOOP;
    DBMS_LOB.writeappend(clTemp, LENGTH(sHtml), sHtml);
    IF nPriemId=-1 THEN
     sHtml:='<p>Не проводился</p>';
     DBMS_LOB.writeappend(clTemp, LENGTH(sHtml), sHtml);
     RETURN clTemp;
    END IF;
    sTmp:=' ';
    FOR C IN(SELECT STAT.PKG_HANT.get_diagname(tdiag.fk_id) nm,tsmid.fk_mkb10 FROM tsmid,tdiag WHERE tdiag.fp_type=7 AND tdiag.fk_pacid=pFK_PACID AND tsmid.fk_id=tdiag.fk_smdiagid) LOOP
      sTmp:=sTmp||'<br>&#160;&#160; <b>'||C.fk_mkb10||'</b> '||C.nm;
    END LOOP;
    IF sTmp<>' ' THEN
      sHtml:='<br><b>Диагноз при поступлении:</b>'||sTmp;
      DBMS_LOB.writeappend(clTemp, LENGTH(sHtml),sHtml);
    END IF;
    --режим диета
      sHtml:=' ';
    FOR C IN (SELECT vres.* FROM vres,vnaz WHERE fk_nazid=vnaz.fk_id AND vnaz.fk_nazowner=nPriemId AND vres.fk_smid=STAT.PKG_STATUTIL.GET_SMIDID('PROC_REZHIM') AND vres.fk_pacid=pfk_pacid) LOOP
    sHtml:='<br><b>'||GET_SMIDNAME(c.fk_smid)||':</b>';
        FOR S IN cSmidParam(c.fk_nazid,C.fk_smid) LOOP
         IF S.sNAme<>' ' THEN
          sHtml:=sHtml||'<br>&#160;&#160;'||get_smidname(S.fk_id)||' '||s.sName;
         END IF;
        END LOOP;
    END LOOP;
    IF sHtml<>' ' THEN
        DBMS_LOB.writeappend(clTemp, LENGTH(sHtml),sHtml);
    END IF;
    sHtml:=' ';
    FOR C IN (SELECT vres.* FROM vres,vnaz WHERE fk_nazid=vnaz.fk_id AND vnaz.fk_nazowner=nPriemId AND vres.fk_smid=STAT.PKG_STATUTIL.GET_SMIDID('PROC_DIET') AND vres.fk_pacid=pfk_pacid) LOOP
    sHtml:='<br><b>'||GET_SMIDNAME(c.fk_smid)||':</b>';
        FOR S IN cSmidParam(c.fk_nazid,C.fk_smid) LOOP
         IF S.sNAme<>' ' THEN
          sHtml:=sHtml||'<br>&#160;&#160;'||get_smidname(S.fk_id)||' '||s.sName;
         END IF;
        END LOOP;
    END LOOP;
    IF sHtml<>' ' THEN
        DBMS_LOB.writeappend(clTemp, LENGTH(sHtml),sHtml);
    END IF;
    DBMS_LOB.append(clTemp,GET_PLANS_FOR_OSMOTR(nPriemid,pFK_PACID));
    RETURN clTemp;
  END;
--Предоперационный эпикриз by XANDER
  FUNCTION SET_EPIKRIZ1(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp   CLOB;
    ep       CLOB;
  BEGIN
   DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
   DBMS_LOB.CREATETEMPORARY(ep, TRUE, DBMS_LOB.call);
      FOR cEP IN (SELECT * FROM tepikriz WHERE fp_type=4 AND fk_pacid=pfk_pacid and fn_del=0) LOOP
       SELECT fc_clob INTO ep FROM tclobs WHERE fk_id=cEP.fk_epclobid;
       DBMS_LOB.writeappend(clTEmp, LENGTH('<br>'), '<br>');
       ep:=CLOB_REPLACE (ep,'<HTML>',' ');
       ep:=CLOB_REPLACE (ep,'</HTML>',' ');
       ep:=CLOB_REPLACE (ep,'<BODY>',' ');
       ep:=CLOB_REPLACE (ep,'</BODY>',' ');
       DBMS_LOB.append(clTemp,ep);
      END LOOP;
    RETURN clTemp;
  END;
 --Предоперационный эпикриз анастезиолога by XANDER
  FUNCTION SET_EPIKRIZ2(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    sHtml := '<p><h3 align="center">ПРЕДОПЕРАЦИОННЫЙ ЭПИКРИЗ АНЕСТЕЗИОЛОГА</h3></p>';
    FOR C IN (SELECT vnaz.fd_run,vnaz.fk_id,vres.fc_res,vnaz.fk_smid,vnaz.fk_ispolid,vnaz.fk_nazsosid, 1 t FROM vnaz,vres WHERE vnaz.fk_id=vres.fk_nazid AND vnaz.fk_pacid=pFk_pacid AND vnaz.fk_smid=STAT.PKG_STATUTIL.get_smidid('KONS_ANAST_PREDOP')) LOOP
      DBMS_LOB.writeappend(clTemp, LENGTH(sHtml), sHtml);
      sHtml:=' ';
      DBMS_LOB.append(clTemp,Get_KonsHtml(GET_SMIDNAME(C.fk_smid),C.fk_nazsosid,TO_CHAR(C.fd_run,'DD.MM.YYYY HH:MI'),C.fk_id,pFk_pacid,REPLACE(c.fc_res,CHR(10),'<br>'),C.fk_ispolid));
    END LOOP;
    RETURN clTemp;
  END;
 --Протокол операции   by XANDER
  FUNCTION SET_OPERPROT(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
    CURSOR c  IS
      SELECT TO_CHAR(fd_ins, 'dd.mm.yyyy') AS fd_date,
             get_fullpath(vres.fk_smid) AS name,
             get_textvsbr(fc_res) as fc_res,
             vnaz.fk_id fk_nazid,
             vres.fk_smid,
             fl_showdiagpredzakl,
             vnaz.fk_nazsosid as sos,
             vres.fk_vrachid as ispol,-- 25.12.2003 by TimurLan
             tsmid.fc_synonim,
             vnaz.fd_run,
             vnaz.fd_naz
        FROM vres, tsmid, vnaz
       WHERE vres.fk_pacid = pFK_PACID AND vres.fk_smid = tsmid.fk_id and
             vres.fk_nazid = vnaz.fk_id and
             vnaz.fk_nazsosid in (get_vipnaz, get_neyav) AND
             get_konsid IN (SELECT /*+rule*/
                           fk_id
                            FROM tsmid
                           START WITH fk_id = vres.fk_smid
                          CONNECT BY PRIOR fk_owner = fk_id)
        AND vnaz.fk_smid =STAT.PKG_STATUTIL.get_smidid('KONS_PROTHOPER')
      ORDER BY vnaz.fd_run;
      CURSOR cSmidParam(nNazid NUMBER) IS SELECT   tsmid.fc_name, tsmid.fk_id, tsmid.fc_type,DECODE (tsmid.fc_type,
                         'EDIT', get_smid_values.get_fc_char (tsmid.fk_id,nNazid,tsmid.fc_type),
                         'MEMO', get_smid_values.get_fc_char (tsmid.fk_id,nNazid,tsmid.fc_type),
                         'BIGMEMO', get_smid_values.get_fc_char (tsmid.fk_id,nNazid,tsmid.fc_type),
                         'COMBOBOX', get_smidname(get_smid_values.get_cbx (tsmid.fk_id,nNazid,tsmid.fc_type)),
                         'NUMBER', TO_CHAR(get_smid_values.get_number (tsmid.fk_id,nNazid,tsmid.fc_type)),
                         'VARCHAR2', get_smid_values.get_edit (tsmid.fk_id,nNazid,tsmid.fc_type)) sname
                     FROM tsmid, (SELECT DISTINCT tib.fk_smeditid
                            FROM tib
                           WHERE tib.fk_pacid = nNazid) tibsmid
                 WHERE tsmid.fk_id = tibsmid.fk_smeditid
                    ORDER BY tsmid.fn_order;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    FOR I IN C  LOOP
          SELECT  '<p><h3 align="center">ПРОТОКОЛ ОПЕРАЦИИ</h3></p><b>№ истории болезни: </b>'||tkarta.fk_ibid || '/' || tkarta.fk_iby INTO sTmp FROM tkarta where fk_id=pFK_PACID;
          sTmp:=sTmp||'<br><b>ФИО: </b>'||PKG_REGIST_PACFUNC.GET_PAC_FIO(pFK_PACID);
          sTmp:=sTmp||'<br><b>Возраст: </b>'||PKG_REGIST_PACFUNC.get_pac_age_date(pFK_PACID,I.FD_RUN);
          sTmp:=sTmp||'<br><b>Дата постановления: </b>'||to_char(I.FD_NAZ,'DD.MM.YYYY');
          sTmp:=sTmp||'<br><b>Дата операции: </b>'||to_char(I.FD_RUN,'DD.MM.YYYY');
          sTmp:=sTmp||'<br><b>Диагноз основной </b>';
          FOR D IN (SELECT REPLACE (do_diag (tdiag.fk_id), '..', '.') AS diagname, tdiag.fl_main FROM tdiag WHERE  tdiag.fk_nazid =I.fk_nazid AND tdiag.fl_showib >= 1 and tdiag.fl_main=1) LOOP
            sTmp:=sTmp||'<br> &#160;'||D.diagname;
          END LOOP;
          sTmp:=sTmp||'<br><b>Диагноз сопутствующий:</b>';
          FOR S IN cSmidParam (I.fk_nazid) LOOP
            sTmp:=sTmp||'<br> <b>'||S.fc_name||':</b> '||s.sname;
          END LOOP;
          DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    END LOOP;
    RETURN clTemp;
  END;
  --Карта анастезии   by XANDER
  FUNCTION SET_ANASTKARTA(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    sHtml := '<p><h3 align="center">КАРТА АНЕСТЕЗИИ</h3></p>';
    FOR C IN (SELECT vnaz.fd_run,vnaz.fk_id,vres.fc_res,vnaz.fk_smid,vnaz.fk_ispolid,vnaz.fk_nazsosid, 1 t FROM vnaz,vres WHERE vnaz.fk_id=vres.fk_nazid AND vnaz.fk_pacid=pFk_pacid AND vnaz.fk_smid=STAT.PKG_STATUTIL.get_smidid('KONS_ANASTKARTA')) LOOP
      DBMS_LOB.writeappend(clTemp, LENGTH(sHtml), sHtml);
      sHtml:=' ';
      DBMS_LOB.append(clTemp,Get_KonsHtml(GET_SMIDNAME(C.fk_smid),C.fk_nazsosid,TO_CHAR(C.fd_run,'DD.MM.YYYY HH:MI'),C.fk_id,pFk_pacid,REPLACE(c.fc_res,CHR(10),'<br>'),C.fk_ispolid));
    END LOOP;
    RETURN clTemp;
  END;
 --Клинико-патологоанатомический эпикриз   by XANDER
  FUNCTION SET_EPIKRIZ3(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp   CLOB;
    ep       CLOB;
  BEGIN
   DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
   DBMS_LOB.CREATETEMPORARY(ep, TRUE, DBMS_LOB.call);
      FOR cEP IN (SELECT * FROM tepikriz WHERE fp_type=6 AND fk_pacid=pfk_pacid and fn_del=0 ) LOOP
       SELECT fc_clob INTO ep FROM tclobs WHERE fk_id=cEP.fk_epclobid;
       DBMS_LOB.writeappend(clTEmp, LENGTH('<br>'), '<br>');
       ep:=CLOB_REPLACE (ep,'<HTML>',' ');
       ep:=CLOB_REPLACE (ep,'</HTML>',' ');
       ep:=CLOB_REPLACE (ep,'<BODY>',' ');
       ep:=CLOB_REPLACE (ep,'</BODY>',' ');
       DBMS_LOB.append(clTemp,ep);
      END LOOP;
    RETURN clTemp;
  END;
 --Запись результатов измерений температуры, других исследований и процедур  by XANDER
  FUNCTION SET_TEMPLIST(pFK_PACID IN NUMBER DEFAULT NULL,pFN_MODE  IN NUMBER DEFAULT 0) RETURN CLOB IS
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    sHtml := '<p><h3 align="center">ЗАПИСЬ РЕЗУЛЬТАТОВ ИЗМЕРЕНИЙ ТЕМПЕРАТУРЫ, ДРУГИХ ИССЛЕДОВАНИЙ И ПРОЦЕДУР</h3></p>';
    DBMS_LOB.writeappend(clTemp, LENGTH(sHtml), sHtml);
    RETURN clTemp;
  END;
/*------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------   T H E   E N D ---------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------*/
END;
/

SHOW ERRORS;


DROP SYNONYM STAT.TEXTIB
/

--
-- TEXTIB  (Synonym) 
--
--  Dependencies: 
--   TEXTIB (Package Body)
--
CREATE SYNONYM STAT.TEXTIB FOR ASU.TEXTIB
/


