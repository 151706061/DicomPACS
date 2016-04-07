DROP PACKAGE BODY ASU.PKG_IRT
/

--
-- PKG_IRT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_IRT" 
IS
  FUNCTION GetKard (pFK_PACID IN NUMBER)
    RETURN NUMBER
  IS
    s      VARCHAR2 (32767);
    cl     CLOB;
    sTmp   VARCHAR2 (32767);
    nRes   NUMBER (9, 0);
  BEGIN
    DBMS_LOB.CREATETEMPORARY (cl, TRUE, 2);
    s  :=
      '<html>' || '<head>' || '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">' || '<title>Дневник ИРТ</title>' || '<style><!--' ||
        ' td            {height:14.0pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt}' ||
        ' table         {border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt}' ||
        ' tr            {height:14.0pt;}' ||
        '--></style>' ||
        '</head>' ||
        '<body lang=RU style=''tab-interval:35.4pt'' bgcolor="#FFFFFF">' ||
        '<div class=Section1> ' ||
        '  <h2>FC_PACFIO</h2>' ||
        '  <table border=1 cellspacing=0 cellpadding=0 width="100%">' ||
        '    <tr><td width="100%" colspan=7 valign=top >' ||
        '        <p><b>Возраст:</b> FN_AGE</b> <b>Проживает: </b>FC_PALATA  <b>Лечащий врач:</b> FC_LECHVRACH</p>' ||
        '       </td></tr>' ||
        '    <tr><td width="100%" colspan=7 valign=top ><p><i>Диагноз лечащего врача:</i> FC_DIAG </p></td></tr>' ||
        '    <tr><td width="100%" colspan=7 valign=top > &nbsp;</td></tr>';
    s  := REPLACE (s, 'FC_PACFIO', get_pacfio (pFK_PACID));
    s  := REPLACE (s, 'FN_AGE', get_strage(get_pacageonvyb (pFK_PACID)));
    s  := REPLACE (s, 'FC_PALATA', get_pacfcpalata (pFK_PACID));
    s  := REPLACE (s, 'FC_LECHVRACH', do_vrachfio(get_pacvrach (pFK_PACID)));
    IF do_diagbytype (pFK_PACID, 2, 1, -1, 1) IS NOT NULL THEN
      sTmp  := do_diagbytype (pFK_PACID, 2, 1, -1, 1);
      IF do_diagbytype (pFK_PACID, 2, 0, -1, 1) IS NOT NULL THEN
        sTmp  := sTmp || ', ' || do_diagbytype (pFK_PACID, 2, 0, -1, 1);
      END IF;
    END IF;
    s  := REPLACE (s, 'FC_DIAG', sTmp);
    DBMS_LOB.writeappend (cl, LENGTH (s), s);
    -- жалобы
    s  := '<tr><td width="100%" colspan=7 valign=top > &nbsp;</td></tr>' || '<tr><td width="100%" colspan=7 valign=top > <i>Жалобы:</i>';
    DBMS_LOB.writeappend (cl, LENGTH (s), s);
    DBMS_LOB.append (cl, textib.getRazdelIbText (pFK_PACID, get_galobid, NULL, NULL));
    s  := '</p></td></tr>';
    DBMS_LOB.writeappend (cl, LENGTH (s), s);
    -- анамнез болезни
    s  := '<tr><td width="100%" colspan=7 valign=top >&nbsp;</td></tr><tr><td width="100%" colspan=7 valign=top ><i>Анамнез болезни: </i>';
    DBMS_LOB.writeappend (cl, LENGTH (s), s);
    DBMS_LOB.append (cl, get_anamboltext (pFK_PACID));
    s  := '</td></tr>' || '<tr><td width="100%" colspan=7 valign=top >&nbsp; </td></tr>';
--осмотр
/*    s  :=
      s || '<tr><td width="100%" colspan=7 valign=top > <i>Осмотр:</i>&nbsp</td></tr>' || '<tr><td width="100%" colspan=7 valign=top >&nbsp; </td></tr>' ||
        '<tr> <td width="100%" colspan=7 valign=top >&nbsp; </td></tr>';
    DBMS_LOB.writeappend (cl, LENGTH (s), s);*/
    s  := '<tr><td width="100%" colspan=7 valign=top > &nbsp;</td></tr>' || '<tr><td width="100%" colspan=7 valign=top > <i>Осмотр:</i>';
    DBMS_LOB.writeappend (cl, LENGTH (s), s);
    DBMS_LOB.append (cl, textib.getRazdelIbText (pFK_PACID, get_doiid, NULL, NULL));
    s  := '</p></td></tr>';
    DBMS_LOB.writeappend (cl, LENGTH (s), s);
--диагноз и график обкалывания
    s  :=
      '  <tr> ' || '    <td width="100%" colspan=7 valign=top >' || '      <i>Диагноз:</i>&nbsp' || '    </td>' || '  </tr>' || '  <tr> ' ||
        '    <td width="100%" colspan=7 valign=top >&nbsp; </td>' ||
        '  </tr>' ||
        '  <tr> ' ||
        '    <td width="8%" valign=top >Дата</td>' ||
        '    <td width="20%" valign=top >Корпор точки</td>' ||
        '    <td width="20%" valign=top > Аур. очки</td>' ||
        '    <td width="7%" valign=top > Kровопуск</td>' ||
        '    <td width="20%" valign=top > Банн. массаж </td>' ||
        '    <td width="5%" valign=top > Цзю </td>' ||
        '    <td width="30%" valign=top > Др. методы</td>' ||
        '  </tr>' ||
        '  <tr>' ||
        '    <td width="8%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td>' ||
        '    <td width="7%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="5%" valign=top >&nbsp;</td>' ||
        '    <td width="30%" valign=top >&nbsp;</td>                                             ' ||
        '  </tr>  ' ||
        '  <tr>' ||
        '    <td width="8%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td>' ||
        '    <td width="7%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="5%" valign=top >&nbsp;</td>' ||
        '    <td width="30%" valign=top >&nbsp;</td>                                             ' ||
        '  </tr>        ' ||
        '  <tr>' ||
        '    <td width="8%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td>' ||
        '    <td width="7%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="5%" valign=top >&nbsp;</td>' ||
        '    <td width="30%" valign=top >&nbsp;</td>                                             ' ||
        '  </tr>  ' ||
        '  <tr>' ||
        '    <td width="8%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td>' ||
        '    <td width="7%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="5%" valign=top >&nbsp;</td>' ||
        '    <td width="30%" valign=top >&nbsp;</td>                                             ' ||
        '  </tr>  ' ||
        '  <tr>' ||
        '    <td width="8%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td>' ||
        '    <td width="7%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="5%" valign=top >&nbsp;</td>' ||
        '    <td width="30%" valign=top >&nbsp;</td>                                             ' ||
        '  </tr>  ' ||
        '  <tr>' ||
        '    <td width="8%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td>' ||
        '    <td width="7%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="5%" valign=top >&nbsp;</td>' ||
        '    <td width="30%" valign=top >&nbsp;</td>                                             ' ||
        '  </tr>  ' ||
        '  <tr>' ||
        '    <td width="8%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td>' ||
        '    <td width="7%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="5%" valign=top >&nbsp;</td>' ||
        '    <td width="30%" valign=top >&nbsp;</td>                                             ' ||
        '  </tr>  ' ||
        '  <tr>' ||
        '    <td width="8%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td>' ||
        '    <td width="7%" valign=top >&nbsp;</td><td width="20%" valign=top >&nbsp;</td><td width="5%" valign=top >&nbsp;</td>' ||
        '    <td width="30%" valign=top >&nbsp;</td>                                             ' ||
        '  </tr>  ' ||
        '  <tr>' ||
        '    <td width="100%" colspan=7 valign=top><i>Эпикриз:</i></td>' ||
        '  </tr>    ' ||
        '  <tr>' ||
        '    <td width="100%" colspan=7 valign=top>&nbsp;</td>' ||
        '  </tr>    ' ||
        '</table>' ||
        '</div>' ||
        '</body>' ||
        '</html>';
    DBMS_LOB.writeappend (cl, LENGTH (s), s);

    INSERT INTO tclobs
                (fk_id, fc_clob)
         VALUES (-1, cl)
      RETURNING fk_id
      INTO nRes;

    RETURN nRes;
  END GetKard;
END PKG_IRT;                                                                                                                                                 -- Package Body PKG_IRT
/

SHOW ERRORS;


