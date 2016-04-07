DROP PACKAGE BODY ASU.PKG_AREPORTS
/

--
-- PKG_AREPORTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_AREPORTS" 
IS
/*-------------------------------------------------------------------------------------------*\
|               get_temptable
\*-------------------------------------------------------------------------------------------*/
  FUNCTION get_temptablename
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'tempapteka' || TO_CHAR (SYSDATE, 'ddmmyyyyhh24miss');
  END;

/*-------------------------------------------------------------------------------------------*\
|               repTreb
\*-------------------------------------------------------------------------------------------*/
--обыкновенное требование, возвращает имя таблицы в которой отчет
  FUNCTION repSpecTreb (pFK_APRIHID IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR cCont (pfk_aprihid IN NUMBER)
    IS
      SELECT ROWNUM AS fn_rownum,
             med.pkgtmedic.getnamebyid (fk_medicid) AS fc_name,
             pkgTEdIzm.getNameByID (pkgmedkart.GetUchEdIzm (tmedkart.fk_id)) AS fc_edizm,
             fn_uchkol AS fn_kolotp,
             fn_num
        FROM taprihcont, tmedkart, tmedic
       WHERE fk_aprihid = pfk_aprihid
         AND taprihcont.fk_medkartid = tmedkart.fk_id
         AND tmedic.fk_id = tmedkart.fk_medicid;

    CURSOR cData (pfk_aprihid IN NUMBER)
    IS
      SELECT   --pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') AS fc_name,
             TO_CHAR (taprih.fd_date, 'dd.mm.yyyy') AS fd_date, PKGTAPOSTAVSHIK.GetNameByID (FK_AKOMUID)
        FROM taprih
       WHERE fk_id = pfk_aprihid;

    sTmp    VARCHAR2(32767);
    nRes    NUMBER;
    cl      CLOB;
    sData   VARCHAR2(100);
    sKomu   VARCHAR2(250);
  BEGIN
--    raise_application_error(-20003,'NID '||pFK_APRIHID);
    sTmp := '<html xmlns:o="urn:schemas-microsoft-com:office:office" ' ||
            'xmlns:w="urn:schemas-microsoft-com:office:word" ' ||
            'xmlns="http://www.w3.org/TR/REC-html40"> ' ||
            '<head> ' ||
            '<title>Untitled Document</title> ' ||
            '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> ' ||
            '<style> ' ||
            '<!-- ' ||
            'td{border:solid windowtext .5pt; padding:0cm 5.4pt 0cm 5.4pt} ' ||
            '--> ' ||
            '</style> ' ||
            '</head> ' ||
            '<body bgcolor="#FFFFFF" text="#000000"> ' ||
            '<p align="right">Главный врач: FC_GLAV</p> ' ||
            '<h3 align="center">Требование на отпуск спецмедикаментов и спирта <br> от DATA</h3> ' ||
            '<pre>Кому:  FC_POTREB</pre><br>' ||
            '<table border=1 cellspacing=0 cellpadding=0 width="100%" style = "border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;   mso-padding-alt:0cm 5.4pt 0cm 5.4pt"> ' ||
            '  <tr>  ' ||
            '    <td width="10%" >№ п.п.</td> ' ||
            '    <td width="50%" >Наименование</td> ' ||
            '    <td width="10%" >Номер</td> ' ||
            '    <td width="15%" >Ед.изм.</td> ' ||
            '    <td width="15%" >Отпущено</td> ' ||
            '  </tr>';
    INSERT INTO tclobs (fk_id, fc_clob)
         VALUES (-1, EMPTY_CLOB)
      RETURNING fk_id, fc_clob INTO nRes, cl;
    OPEN cData (pFK_APRIHID);
    FETCH cData INTO sData, sKomu;
    CLOSE cData;
    IF sData IS NULL THEN
      raise_application_error (-20003, 'Неверен вызов отчета, запрашиваемые документ не найден');
    END IF;
    sTmp := REPLACE (sTmp, 'DATA', sData);
    sTmp := REPLACE (sTmp, 'FC_GLAV', GET_GLAVFIO);
    sTmp := REPLACE (sTmp, 'FC_POTREB', sKomu);
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    FOR i IN cCont (pFK_APRIHID)
    LOOP
      sTmp := '    <tr><td width="10%" >FN_ROWNUM</td> ' ||
              '    <td width="50%" >FC_NAME</td> ' ||
              '    <td width="10%" >FN_NUM</td> ' ||
              '    <td width="15%" >FC_EDIZM</td> ' ||
              '    <td width="15%" >FN_KOLOTP</td></tr> ';
      sTmp := REPLACE (sTmp, 'FN_ROWNUM', i.fn_rownum);
      sTmp := REPLACE (sTmp, 'FC_NAME', NVL (i.fc_name, '&nbsp'));
      sTmp := REPLACE (sTmp, 'FC_EDIZM', NVL (i.FC_EDIZM, '&nbsp'));
      sTmp := REPLACE (sTmp, 'FN_KOLOTP', i.FN_KOLOTP);
      sTmp := REPLACE (sTmp, 'FN_NUM', i.FN_NUM);
      dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    END LOOP;
    sTmp := '</table>' ||
            '<pre>Затребовал врач:   ___________________' ||
            CHR (10) ||
            'Отпустил провизор:  ___________________' ||
            CHR (10) ||
            'Получил:           ___________________' ||
            CHR (10) ||
            '</pre></body></html>';
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    RETURN nRes;
  END;

/*-------------------------------------------------------------------------------------------*\
|               repAktSpis
\*-------------------------------------------------------------------------------------------*/
--акт на списание
  FUNCTION repAktSpis (pFK_APRIHID IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR cCont (pfk_aprihid IN NUMBER)
    IS
      SELECT ROWNUM AS fn_rownum,
             med.pkgtmedic.getnamebyid (fk_medicid) AS fc_name,
             pkgTEdIzm.getNameByID (pkgmedkart.GetUchEdIzm (tmedkart.fk_medicid)) AS fc_edizm,
             fn_uchkol AS fn_kolotp,
             fn_num
        FROM taprihcont, tmedkart, tmedic
       WHERE fk_aprihid = pfk_aprihid
         AND taprihcont.fk_medkartid = tmedkart.fk_id
         AND tmedic.fk_id = tmedkart.fk_medicid;

    CURSOR cData (pfk_aprihid IN NUMBER)
    IS
      SELECT   --pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') AS fc_name,
             TO_CHAR (taprih.fd_date, 'dd.mm.yyyy') AS fd_date
        FROM taprih
       WHERE fk_id = pfk_aprihid;

    sTmp    VARCHAR2(32767);
    nRes    NUMBER;
    cl      CLOB;
    sData   VARCHAR2(100);
  BEGIN
    sTmp := '<html> ' ||
            '<head> ' ||
            '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> ' ||
            '<title>Акт № ___ о порче товарноматериальных ценностей от ДД</title> ' ||
            '<style><!-- ' ||
            'p.MsoNormal, li.MsoNormal, div.MsoNormal ' ||
            '        {mso-style-parent:"";mso-pagination:widow-orphan;font-size:7.0pt;font-family:"Times New Roman";mso-fareast-font-family:"Times New Roman";} ' ||
            'h2 {mso-style-next:Обычный;mso-pagination:widow-orphan;page-break-after:avoid;mso-outline-level:2;font-size:14.0pt;font-family:Arial;font-style:italic;} ' ||
            'h6 {mso-style-next:Обычный;text-align:center;mso-pagination:widow-orphan;page-break-after:avoid;mso-outline-level:6;text-autospace:none;font-size:12.0pt;font-family:"Times New Roman";} ' ||
            'p.MsoHeading7, li.MsoHeading7, div.MsoHeading7 ' ||
            '        {mso-style-next:Обычный;text-align:center;line-height:150%;mso-pagination:widow-orphan;page-break-after:avoid;mso-outline-level:7;font-size:8.0pt;mso-bidi-font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:"Times New Roman";font-weight:bold;} ' ||
            'p.MsoHeading9, li.MsoHeading9, div.MsoHeading9 ' ||
            '        {mso-style-next:Обычный;text-align:center;text-indent:43.15pt;line-height:150%;mso-pagination:widow-orphan;page-break-after:avoid;mso-outline-level:9;font-size:8.0pt;mso-bidi-font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:"Times New Roman";font-weight:bold;} ' ||
            '@page Section1 {size:841.9pt 595.3pt;mso-page-orientation:landscape;mso-header-mso-footer-mso-paper-source:0;} ' ||
            'div.Section1 {page:Section1;} ' ||
            'td {padding:0cm 5.4pt 0cm 5.4pt} ' ||
            '.sm_table {border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} ' ||
            '--></style> ' ||
            '</head> ' ||
            '<body lang=RU style=''tab-interval:35.4pt'' bgcolor="#FFFFFF"> ' ||
            '<div class=Section1>  ' ||
            '<table border=0 cellspacing=0 cellpadding=0 width="100%" style=''width:100.0%;border-collapse:collapse;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> ' ||
            ' <tr><td width="63%" valign=top style=''width:63.24%;padding:0cm 5.4pt 0cm 5.4pt''> ' ||
            '  <p class=MsoNormal><span style=''font-size:14.0pt;mso-bidi-font-size:12.0pt''>ЛОК &quot;Витязь&quot; ' ||
            '  </span><span lang=EN-US style=''font-size:14.0pt; mso-bidi-font-size:12.0pt;mso-ansi-language:EN-US''><o:p></o:p></span></p> ' ||
            '  <p class=MsoNormal><span style=''font-size:14.0pt;mso-bidi-font-size:12.0pt''>Лечебный корпус<span style="mso-spacerun: yes"></td> ' ||
            '  <td width="36%" valign=top style=''width:36.76%;padding:0cm 5.4pt 0cm 5.4pt''> ' ||
            '    <h1>&quot;Утверждаю&quot;<o:p></o:p></h1> ' ||
            '    <p class=MsoNormal><span style=''font-size:14.0pt;mso-bidi-font-size:12.0pt''>Начальник ЛОК &quot;Витязь&quot;<o:p></o:p></span></p> ' ||
            '    <p class=MsoNormal><span style=''font-size:14.0pt;mso-bidi-font-size:12.0pt''>В.Д. Машуков<o:p></o:p></span></p> ' ||
            '    <p class=MsoNormal><span style=''font-size:14.0pt;mso-bidi-font-size:12.0pt''>&quot;__ __ &quot;__ __ __ __ __ __ __ __ 200__г<o:p></o:p></span></p> ' ||
            '  </td></tr> ' ||
            '</table> ' ||
            '<p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> ' ||
            '<p class=MsoNormal><span lang=EN-US style=''mso-ansi-language:EN-US''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> ' ||
            '<p class=MsoNormal><b>Комиссия в составе:</b> <span style="mso-spacerun:yes"> </span>председатель __ ____ ____ ____ ____ ____ ____ ____ ____ __, члены ' ||
            'комисси ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ___ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ __<br>На основании приказа (распоряжения) №____________ от ______________ составила настоящий ' ||
            'акт в том, что указанные ниже ценности, хранившиеся в аптке, пришли в негодность и подлежат списанию.</p> ' ||
            '  <h6>Акт № ___ о порче товарноматериальных ценностей от DATA ' ||
            '      <span lang=EN-US style=''mso-ansi-language:EN-US''></span></h6> ' ||
            '  <table class = "sm_table" border=1 cellspacing=0 cellpadding=0 width="100%" style=''width:95.0%''> ' ||
            '    <tr style=''height:21.65pt''>  ' ||
            '      <td width="2%" rowspan=3 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''>  ' ||
            '          <b>№п.п.</b> ' ||
            '        </p> ' ||
            '      </td> ' ||
            '      <td width="6%" rowspan=3 valign=top >  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Номенклатурный номер</b></p> ' ||
            '      </td> ' ||
            '      <td width="45%" rowspan=3 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Наименование</b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" rowspan=3 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Ед.изм.</b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" rowspan=3 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Кол-во</b></p> ' ||
            '      </td> ' ||
            '      <td width="14%" colspan=4 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Стоимость</b></p> ' ||
            '      </td> ' ||
            '      <td width="40%" colspan=6 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Когда и откуда поступило</b></p> ' ||
            '      </td> ' ||
            '      <td width="11%" rowspan=3 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Причина и характер порчи</b></p> ' ||
            '      </td> ' ||
            '    </tr> ' ||
            '    <tr style=''height:8.65pt''>  ' ||
            '      <td width="4%" colspan=2 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Розничная</b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" colspan=2 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Оптовая</b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" colspan=2 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Счет</b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" rowspan=2 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Поставщик</b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" rowspan=2 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Серия</b></p> ' ||
            '      </td> ' ||
            '      <td width="7%" rowspan=2 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Дата выпуска</b></p> ' ||
            '      </td> ' ||
            '      <td width="7%" rowspan=2 valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Срок годности</b></p> ' ||
            '      </td> ' ||
            '    </tr> ' ||
            '    <tr style=''height:11.3pt''>  ' ||
            '      <td width="4%" valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Цена</b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" valign=top>  ' ||
            '        <p class=MsoNormal style=''line-height:150%''> ' ||
            '        <b>Сумма</span></b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Цена</b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" valign=top>  ' ||
            '        <p class=MsoHeading7>Сумма</p> ' ||
            '      </td> ' ||
            '      <td width="4%" valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>№</b></p> ' ||
            '      </td> ' ||
            '      <td width="4%" valign=top>  ' ||
            '        <p class=MsoNormal align=center style=''text-align:center;line-height:150%''> ' ||
            '        <b>Дата</b></p> ' ||
            '      </td> ' ||
            '    </tr>';
    INSERT INTO tclobs (fk_id, fc_clob)
         VALUES (-1, EMPTY_CLOB)
      RETURNING fk_id, fc_clob INTO nRes, cl;
    OPEN cData (pFK_APRIHID);
    FETCH cData INTO sData;
    CLOSE cData;
    IF sData IS NULL THEN
      raise_application_error (-20003, 'Неверен вызов отчета, запрашиваемый документ не найден');
    END IF;
    sTmp := REPLACE (sTmp, 'DATA', sData);
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    FOR i IN cCont (pFK_APRIHID)
    LOOP
      sTmp := '    <tr> <td width="2%" valign=top>  ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>FN_ROWNUM</p></td> ' ||
              '      <td width="6%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>FN_NUM</p></td> ' ||
              '      <td width="9%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>FC_NAME</p></td> ' ||
              '      <td width="4%" valign=top style=''width:4.04%''> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>FC_EDIZM</p> ' ||
              '      </td> ' ||
              '     <td width="5%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>FN_KOLOTP</p></td> ' ||
              '      <td width="5%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="3%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="3%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="4%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="3%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="4%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="6%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="4%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="7%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="14%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '      <td width="14%" valign=top> ' ||
              '        <p class=MsoNormal style=''text-align:justify;line-height:150%''>&nbsp</p></td> ' ||
              '    </tr>';
      sTmp := REPLACE (sTmp, 'FN_ROWNUM', i.fn_rownum);
      sTmp := REPLACE (sTmp, 'FN_NUM', i.fn_num);
      sTmp := REPLACE (sTmp, 'FC_NAME', NVL (i.fc_name, '&nbsp'));
      sTmp := REPLACE (sTmp, 'FC_EDIZM', NVL (i.FC_EDIZM, '&nbsp'));
      sTmp := REPLACE (sTmp, 'FN_KOLOTP', i.FN_KOLOTP);
      dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    END LOOP;
    sTmp := '</table>' ||
            '  <p class=MsoNormal style=''text-align:justify;line-height:150%''>' ||
            '  Итого по акту  ________________' ||
            '  <span style=''mso-tab-count:3''>                         </span>' ||
            '  Наименование на сумму ________________________ руб. коп.</p>' ||
            '<span style=''font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family: ' ||
            '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA''><br clear=all style=''page-break-before:always''></span> ' ||
            '<p class=MsoNormal align=center style=''text-align:center''><b> ' ||
            '<span style=''font-size:16.0pt;mso-bidi-font-size:12.0pt''>ЗАКЛЮЧЕНИЕ КОМИССИ<o:p></o:p></span></b></p> ' ||
            '<p class=MsoNormal style=''text-align:justify''>____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____</p> ' ||
            '<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> ' ||
            '<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> ' ||
            '<p class=MsoNormal><b>Председатель комиссии </b>____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____</p> ' ||
            '<p class=MsoNormal style=''text-align:justify''><b>Члены комиссии </b> ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ </p> ' ||
            '<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> ' ||
            '<p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></p> ' ||
            '<p class=MsoNormal><b>Отметки об уничтожении списанных ценностей:</b></p> ' ||
            '<p class=MsoNormal style=''text-align:justify''><![if !supportEmptyParas]>&nbsp;<![endif]> ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ________ ____ ________ ____ ________ ____ ________ ____ ________ ____ </p> ' ||
            '<p class=MsoNormal><b>Председатель комиссии </b>____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____</p> ' ||
            '<p class=MsoNormal style=''text-align:justify''><b>Члены комиссии </b> ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ' ||
            '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ </p> ' ||
            '</div></body></html>';
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    RETURN nRes;
  END;

/*-------------------------------------------------------------------------------------------*\
|               repMedicOst
\*-------------------------------------------------------------------------------------------*/
  function repMedicOst (pFD in date, pFK_POSTAVID in number)
  return number
  is begin
    null;
  end;

END;   -- Package Body PKG_AREPORTS
/

SHOW ERRORS;


