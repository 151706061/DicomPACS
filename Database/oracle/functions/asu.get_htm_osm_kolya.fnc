DROP FUNCTION ASU.GET_HTM_OSM_KOLYA
/

--
-- GET_HTM_OSM_KOLYA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   CLOB_REPLACE (Function)
--   TSMINI (Table)
--   TSOTR (Synonym)
--   TDIAG (Table)
--   TRICHVIEWDATA (Table)
--   PKG_COMPILE_CONDITIONS (Package)
--   TSMID (Table)
--   TCLOBS (Table)
--   VRES (Table)
--   PKG_REGIST_PACFUNC (Package)
--   GET_OTDNAME (Function)
--   GET_PAT_ANAT_ID (Function)
--   GET_SMIDNAME (Function)
--   GET_SOTRNAME (Function)
--   PKG_IBXML (Package)
--   PKG_STATUTIL (Package)
--   DO_VRACHFIO (Function)
--   TS_SPRAV (Table)
--   VNAZ (Table)
--   TPODPISNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_HTM_OSM_KOLYA(pResId NUMBER,
                           p_Base VARCHAR2 DEFAULT NULL, 
                           bUseHeadCss NUMBER DEFAULT 1,
                           sCompanyName VARCHAR2 DEFAULT '',
                           sOtdelName VARCHAR2 DEFAULT '') RETURN CLOB IS --осмотры в HTML
  clTemp CLOB;
  pBase varchar2(100);
  vFile VARCHAR2(4000);
  nTmp NUMBER;
  sTmp VARCHAR2(32767);
  sTmp2 VARCHAR2(32767);
  CR VARCHAR2(2):=CHR(13)||CHR(10);  
  sOtdel varchar2(150);
  nCntSmid NUMBER; -- считаем исследование входит в патанатомию
  HeadCSS VARCHAR2(10000):= '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||
                            '<html xmlns:o="urn:schemas-microsoft-com:office:office" '||
                            'xmlns:w="urn:schemas-microsoft-com:office:word" '||
                            'xmlns="http://www.w3.org/TR/REC-html40"> '||
                            '<head> '||
                            '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
                            '<meta name=ProgId content=Word.Document> '||
                            '<style type="text/css">'||CR||
                            '<!--'||CR||
                            '@page user '||
                            '  {size:210'||'mm '||'297'||'mm; '||
                            '  mso-page-orientation:'||'portrait'||'; '||
                            '  margin:15mm 15mm 15mm 20mm;} '||
                            'div.User '||
                            '  {page:user;} '||
                            '-->'||CR||
                            '</style>'||CR||
                            '</head>'||CR;  
  cursor cOtdel is
  select (select asu.get_otdname(fk_otdid) from asu.tsotr where fk_id = fk_ispolid ) otd from asu.vnaz  where fk_id in (select fk_nazid from asu.vres where fk_id = presid);
   /* select  DECODE(ASU.IS_AMBULANCE(ISL.FK_PACID), 
              0, 
              ASU.PKG_REGIST_PACFUNC.GET_PAC_FCOTDEL(ISL.FK_PACID), 
              1, 
              (select max(totdel.fc_name) from asu.totdel, asu.tambtalon, asu.tambtalon_naz 
                where totdel.fk_id = tambtalon.fk_otdelid
                  and tambtalon.fk_id = tambtalon_naz.fk_talonid
                  and tambtalon_naz.fk_nazid = isl.fk_id)) otd
                   from asu.vnaz isl where fk_id in (select fk_nazid from asu.vres where fk_id = presid);*/
BEGIN
  open cOtdel;
  fetch cOtdel into sOtdel;
  if cOtdel%notfound then sOtdel := null; end if;
  close cOtdel;
  if p_Base is null then
    select fc_value into pBase from asu.tsmini where fc_section = 'CONFIG' and fc_key = 'DB_NAME';
  else
    pBase := p_Base;
  end if;
  sTmp := ' ';
  DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
  FOR C IN (SELECT vres.fk_smid,
                   vres.fk_vrachid,
                   vres.fd_ins,
                   vres.fk_nazid,
                   vres.fk_id,
                   vres.fk_pacid
              FROM vres
             WHERE fk_id = pResID) LOOP
    IF bUseHeadCss = 1 THEN
    sTmp := HeadCSS || '<body><div class=user>';
    END IF;
    $IF ASU.PKG_COMPILE_CONDITIONS.bUSE_DS
         $THEN
    vFile := GET_DIGITSIGN_FILE(c.fk_id);
    IF vFile IS NOT NULL THEN
      sTmp := sTmp || '<DIV align="right"><IMG SRC="SignPics\' ||
              vFile || '.gif"></DIV><br>';
    END IF;
    $END
  
  if (pBase <> 'SO') and (pBase <> 'H') then
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);   
  else    
    if pBase = 'SO' then -- Сургут ОКБ
      if sOtdel is not null then
        sOtdel := ''||sOtdel||'<br>'||CR;
      end if;
      sTmp := sTmp || '<table width="100%"><tr><td width="15%"><IMG width="80" height="80" SRC="OKBLogo.gif"></td><td colspan="3" width="85%" align="center" valign="center">'||
                     'БУ ХАНТЫ-МАНСИЙСКОГО АВТОНОМНОГО ОКРУГА-ЮГРА<br>'||CR||
                      '"СУРГУТСКАЯ ОКРУЖНАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА"<br>'||CR||
                      sOtdel||
                      '628408, Россия, Тюменская область, ХМАО-Югры, г. Сургут, ул. Энергетиков, 14<br>'||CR||
                      '</td></tr></table>'||CR||
                      '<table width="100%"><tr><td width="15%"><b>Пациент:</b></td><td width="55%">'||asu.pkg_regist_pacfunc.get_pac_fio(c.fk_pacid)||'</td><td width="10%"><b>Дата:</b></td><td width="20%">'||to_char(c.fd_ins, 'dd.mm.yyyy hh24:mi')||'</td></tr>'||CR||
                      '<tr><td width="15%"><b>Возраст:</b></td><td colspan="3">'||asu.pkg_regist_pacfunc.get_pac_age_now(c.fk_pacid)||'</td></tr>'||CR||
                      '<tr><td colspan="4" width="100%" style="background-color:maroon"><b><p style="color:white">'||asu.get_smidname(c.fk_smid)||'</p></b></td></tr></table>';
    end if;
    if pBase = 'H' then -- Ханты
      if (length(sCompanyName) > 0) and (length(sOtdelName) > 0) then
        sTmp := sTmp || '<table width="100%"><tr><td align="center" valign="center"><b>'||sCompanyName||'</b></td></tr>'||CR||
                        '<tr><td align="center" valign="center"><b>'||sOtdelName||'</b></td></tr></table>'||CR||
                        '<table width="100%"><tr><td width="15%"><b>Пациент:</b></td><td width="55%">'||asu.pkg_regist_pacfunc.get_pac_fio(c.fk_pacid)||'</td><td width="10%"><b>Дата:</b></td><td width="20%">'||to_char(c.fd_ins, 'dd.mm.yyyy hh24:mi')||'</td></tr>'||CR||
                        '<tr><td width="15%"><b>Возраст:</b></td><td colspan="3">'||asu.pkg_regist_pacfunc.get_pac_age_now(c.fk_pacid)||'</td></tr>'||CR||
                        '<tr><td colspan="4" width="100%" style="background-color:teal"><b><p style="color:white">'||asu.get_smidname(c.fk_smid)||'</p></b></td></tr></table>';
      else
        sTmp := sTmp || '<table width="100%"><tr><td width="15%"><b>Пациент:</b></td><td width="55%">'||asu.pkg_regist_pacfunc.get_pac_fio(c.fk_pacid)||'</td><td width="10%"><b>Дата:</b></td><td width="20%">'||to_char(c.fd_ins, 'dd.mm.yyyy hh24:mi')||'</td></tr>'||CR||
                        '<tr><td width="15%"><b>Возраст:</b></td><td colspan="3">'||asu.pkg_regist_pacfunc.get_pac_age_now(c.fk_pacid)||'</td></tr>'||CR||
                        '<tr><td colspan="4" width="100%" style="background-color:teal"><b><p style="color:white">'||asu.get_smidname(c.fk_smid)||'</p></b></td></tr></table>';      
      end if;                  
    end if;                    
    DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
  end if;                 

    FOR CURLOB IN (SELECT trichviewdata.fb_html
                     FROM asu.trichviewdata
                    WHERE trichviewdata.fk_pacid = C.fk_nazid
                      AND fb_html IS NOT NULL) LOOP
      DBMS_LOB.append(clTemp, CURLOB.fb_html);
    END LOOP;
    sTmp := CR;
    -- диагноз
    FOR D IN (SELECT *
                FROM (SELECT fk_pacid, fp_type, tsmid.fn_order
                        FROM tdiag, tsmid
                       WHERE tdiag.fk_nazid = C.fk_nazid
                         AND tsmid.fk_id = tdiag.fp_type
                       GROUP BY fk_pacid, fp_type, fn_order)
               ORDER BY fn_order) LOOP

      sTmp := sTmp || '<B>Диагноз ' || LOWER(asu.get_smidname(D.fp_type)) ||
              '</B>' || CR;
      sTmp := sTmp || '<table border="0">' || CR;
      --основной/конкурирующий
      sTmp2 := ' ';
      FOR CTMP IN (SELECT rownum rn, fc_write sName, fl_main, fk_smdiagid
                     FROM tdiag
                    WHERE fp_type = D.fp_type
                      AND fl_main IN
                          (stat.PKG_STATUTIL.GET_SMIDID('MAIN'),
                           stat.PKG_STATUTIL.GET_SMIDID('KONKUR'))
                      AND fk_nazid = C.fk_nazid) LOOP
        sTmp2 := CTMP.sNAme;
        --код мкб
        FOR CMKB IN (SELECT tsmid.fk_mkb10
                       FROM tsmid
                      WHERE fk_id = CTMP.fk_smdiagid) LOOP
          sTmp2 := sTmp2 || ' (' || CMKB.fk_mkb10 || ') ';
        END LOOP;
        nTmp := CTMP.fl_main;
        IF sTmp2 <> ' ' THEN
          SELECT sTmp || '<tr><td valign="top"><b>' ||
                 DECODE(nTMp,
                        stat.PKG_STATUTIL.GET_SMIDID('MAIN'),
                        'Основной:',
                        'Конкурентный:') || '</b></td><td> ' || sTmp2 ||
                 '</td></tr>'
            INTO sTmp
            FROM DUAL;
        END IF;
      END LOOP;
      --Дифференциальный
      sTmp2 := ' ';
      FOR CTMP IN (SELECT rownum rn, fc_write sName, fk_smdiagid
                     FROM tdiag
                    WHERE fp_type = D.fp_type
                      AND fl_main = stat.PKG_STATUTIL.GET_SMIDID('DIFFER')
                      AND fk_nazid = C.fk_nazid) LOOP
        IF CTMP.rn > 1 THEN
          sTmp2 := sTmp2 || '<br>' || CTMP.sNAme;
        ELSE
          sTmp2 := CTMP.sNAme;
        END IF;
        --код мкб
        FOR CMKB IN (SELECT tsmid.fk_mkb10
                       FROM tsmid
                      WHERE fk_id = CTMP.fk_smdiagid) LOOP
          sTmp2 := sTmp2 || ' (' || CMKB.fk_mkb10 || ') ';
        END LOOP;
      END LOOP;
      IF sTmp2 <> ' ' THEN
        sTmp := sTmp ||
                '<tr><td valign="top"> <b>Дифференциальный:</b></td><td> ' ||
                sTmp2 || '</td></tr>';
      END IF;
      --Осложнение
      sTmp2 := ' ';
      FOR CTMP IN (SELECT rownum rn, fc_write sName, fk_smdiagid
                     FROM tdiag
                    WHERE fp_type = D.fp_type
                      AND fl_main = stat.PKG_STATUTIL.GET_SMIDID('OSLOG_MAIN')
                      AND fk_nazid = C.fk_nazid) LOOP
        IF CTMP.rn > 1 THEN
          sTmp2 := sTmp2 || '<br>' || CTMP.sNAme;
        ELSE
          sTmp2 := CTMP.sNAme;
        END IF;
        --код мкб
        FOR CMKB IN (SELECT tsmid.fk_mkb10
                       FROM tsmid
                      WHERE fk_id = CTMP.fk_smdiagid) LOOP
          sTmp2 := sTmp2 || ' (' || CMKB.fk_mkb10 || ') ';
        END LOOP;
      END LOOP;
      IF sTmp2 <> ' ' THEN
        sTmp := sTmp ||
                '<tr><td valign="top"> <b>Осложнение:</b></td><td> ' ||
                sTmp2 || '</td></tr>';
      END IF;
      --Сопутствующий
      sTmp2 := ' ';
      FOR CTMP IN (SELECT rownum rn, fc_write sName, fk_smdiagid
                     FROM tdiag
                    WHERE fp_type = D.fp_type
                      AND fl_main = stat.PKG_STATUTIL.GET_SMIDID('SOPUT')
                      AND fk_nazid = C.fk_nazid) LOOP
        IF CTMP.rn > 1 THEN
          sTmp2 := sTmp2 || '<br>' || CTMP.sNAme;
        ELSE
          sTmp2 := CTMP.sNAme;
        END IF;
        --код мкб
        FOR CMKB IN (SELECT tsmid.fk_mkb10
                       FROM tsmid
                      WHERE fk_id = CTMP.fk_smdiagid) LOOP
          sTmp2 := sTmp2 || ' (' || CMKB.fk_mkb10 || ') ';
        END LOOP;
      END LOOP;
      IF sTmp2 <> ' ' THEN
        sTmp := sTmp ||
                '<tr><td valign="top"><b>Сопутствующий:</b> </td><td> ' ||
                sTmp2 || '</td></tr>';
      END IF;
      sTmp := sTmp || '</table>';
      sTmp := sTmp || '<table border="0">' || CR;
      DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);

      --Клинический синдром
      FOR CLTMP IN (SELECT fc_clob
                      FROM tclobs
                     WHERE fk_id = (SELECT fk_sindromid
                                      FROM vnaz
                                     WHERE fk_id = C.fk_nazid)) LOOP
        IF CLTMP.fc_clob IS NOT NULL THEN
          sTmp := '<tr><td><B>Клинический синдром</B></td></tr><tr><td>';
          DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
          DBMS_LOB.append(clTEmp, CLTMP.fc_clob);
          sTmp := '</td></tr>';
          DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
        END IF;
      END LOOP;
      --Обоснование диагноза
      FOR CLTMP IN (SELECT clob_replace(fc_clob, '<0', '< 0') AS FC_CLOB
                      FROM tclobs
                     WHERE fk_id = (SELECT fk_obosnovid
                                      FROM vnaz
                                     WHERE fk_id = C.fk_nazid)) LOOP
        IF CLTMP.fc_clob IS NOT NULL THEN
          sTmp := '<tr><td><B>Обоснование диагноза</B></td></tr><tr><td>';
          DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
          DBMS_LOB.append(clTEmp, CLTMP.fc_clob);
          sTmp := '</td></tr>';
          DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
        END IF;
      END LOOP;

      --Дифференциальный диагноз
      FOR CTMP IN (SELECT rownum rn, fc_write sName
                     FROM tdiag
                    WHERE fp_type = D.fp_type
                      AND fl_main = stat.PKG_STATUTIL.GET_SMIDID('DIFFER')
                      AND fk_nazid = C.fk_nazid) LOOP
        FOR CLTMP IN (SELECT fc_clob
                        FROM tclobs
                       WHERE fk_id = (SELECT fk_differid
                                        FROM vnaz
                                       WHERE fk_id = C.fk_nazid)) LOOP
          IF CLTMP.fc_clob IS NOT NULL THEN
            sTmp := '<tr><td><B>Дифференциальный диагноз</B></td></tr><tr><td>';
            DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
            DBMS_LOB.append(clTEmp, CLTMP.fc_clob);
            sTmp := '</td></tr>';
            DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
          END IF;
        END LOOP;
        EXIT; --если есть диф.диагноз
      END LOOP;
      sTmp := '</table>';
      DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    END LOOP;
    --Назначения:
    sTmp := stat.pkg_ibxml.get_nazblock(C.fk_nazid);
    IF sTmp <> ' ' THEN
      sTmp := ' <b>Назначения</b>' || CR || sTmp;
      DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    END IF;

    sTmp := stat.pkg_ibxml.get_nazsl(C.fk_nazid);
    IF sTmp <> ' ' THEN
      DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
    END IF;

-- Подписи    
-- Проверяем принадлежит ли исследование к ветке Инструментальные исследования/Патанатомия      
      select count(*) into nCntSmid
        from asu.tsmid 
       where fl_showanal = 1
         and fk_id = c.fk_smid 
       start with fk_id = asu.get_pat_anat_id
       connect by prior fk_id = fk_owner; 
      if nCntSmid > 0 then 
        for e in (select asu.do_vrachfio(fk_sotrid) as vrachfio, -- формируем подписи для патанатомии, обычно 2 подписи
                         (select t1.fc_name from asu.ts_sprav t1, asu.tsotr t2
                           where t1.fk_id = t2.fk_spravid and t2.fk_id = tpodpisnaz.fk_sotrid) as spec
                    from asu.tpodpisnaz where fk_nazid = c.fk_nazid and fk_sos = 1 order by fd_date) loop
          sTmp := sTmp||'<div align="right" style="font-size:8pt; padding:8pt;">_________________<b>'||e.spec||' '||e.vrachfio||'</b></div>'||CR;
        end loop;
      else 
        sTmp:= '<div align="right" style="font-size:8pt; padding:8pt;" >_________________<b>'||stat.pkg_ibxml.GET_SOTR_RANK(c.fk_vrachid)||' '||asu.get_sotrname(c.fk_vrachid)||'</b></div></div></BODY></HTML>'||CR;
      end if;  

    IF bUseHeadCss = 1 THEN
       sTmp := sTmp || '</div></BODY></HTML>'||CR;
    END IF;
  END LOOP;
  DBMS_LOB.writeappend(clTemp, LENGTH(sTmp), sTmp);
  RETURN clTemp;

END;
/

SHOW ERRORS;


