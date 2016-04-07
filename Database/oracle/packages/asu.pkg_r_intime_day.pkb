DROP PACKAGE BODY ASU.PKG_R_INTIME_DAY
/

--
-- PKG_R_INTIME_DAY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_INTIME_DAY" 
 is-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rInTimeDay.dpr
    CURSOR cVID IS SELECT fk_id, fc_name FROM tvid ORDER BY fk_id;
    CURSOR cSUBVID (pVIDID NUMBER) IS SELECT fk_id, fc_name FROM tsubvid WHERE FK_VIDID = pVIDID ORDER BY fk_id;
    CURSOR cPrizn IS SELECT FK_ID, FC_SHORT FROM TPRIZN;
    TYPE TPr IS TABLE OF cPrizn%ROWTYPE
             INDEX BY BINARY_INTEGER;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    Pr TPr;
    i NUMBER;
    j NUMBER;
/* procedure do_log (d in date,c in varchar2) is
 pragma autonomous_transaction;
 begin
   insert into TLOGTABLE (FD_VALUE,FC_VALUE) values (d,c);
   commit;
 end;*/
  BEGIN
--  do_log(sysdate,'Begin of function is reached!');
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('excel','Своевременность поступления по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за '||TO_CHAR(pFD_DATA,'dd.mm.yyyy'),
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             '.39','.39','.39','.78',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<BODY>'||
          '<P align="CENTER"><B>Своевременность поступления по санаторию "' ||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"</B><BR> за ' || TO_CHAR (pFD_DATA, 'dd.mm.yyyy') || '</P>'||
          '<table>'||
          '<TR>'||
          ' <TD><p class=user>&nbsp;</p></TD>'||
          ' <TD class=v><p class=user>Всего:</p></TD>';
    FOR p IN cPrizn LOOP
      Pr (cPrizn%ROWCOUNT)  := p;
    END LOOP;
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD class=v><p class=user> В т/ч ' || Pr (i).FC_SHORT || '</p></TD>';
    END LOOP;
    str  := str || '<TD class=v><p class=user>Кор.срок всего:</p></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str ||'<TD class=v><p class=user> В т/ч ' || Pr (i).FC_SHORT || ' (к.с.)</p></TD>';
    END LOOP;
    str := str || '</TR>'||
          '<TR>'||
          '<TD class=user><P class=user>Состояло на начало отчетного периода (чел.)</P></TD>'||
          '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_MORNING (pFD_DATA) )|| '</P></TD>';
    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества состоявших...');
    PROGRESS_BAR.STEPIT;
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_MORNING_PRIZN (pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_MORNING_SHORT (pFD_DATA)) || '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_MORNING_SHORT_PRIZN (pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<TR>'||
          '<TD class=user><P class=user>Прибыло в течение отчетного периода (чел.)</P></TD>'||
          '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_PRYB (pFD_DATA)) || '</P></TD>';
    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества прибывших...');
    PROGRESS_BAR.STEPIT;
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_PRYB_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_PRYB_SHORT (pFD_DATA, pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_PRYB_SHORT_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str ||'</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  := '<TR><TD class=user><P class=user>Выбыло в течение отчетного периода (чел.)</P></TD>'||
            '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB (pFD_DATA) )|| '</P></TD>';
    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества выбывших...');
    PROGRESS_BAR.STEPIT;
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_SHORT (pFD_DATA, pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYBSHORTPRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str  := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR z IN cVid LOOP
      PROGRESS_BAR.SETSTROUT ('Выбывшие по '||z.FC_NAME||'...');
      PROGRESS_BAR.STEPIT;
      str  := '<TR><TD class=user><P class=user>В т/ч по ' || z.FC_NAME || ' (чел.)' || '</P></TD>'||
              '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_VID (pFD_DATA, pFD_DATA, z.FK_ID)) || '</P></TD>';
      FOR i IN 1 .. Pr.COUNT LOOP
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_VID_PRIZN (pFD_DATA, pFD_DATA, z.FK_ID, Pr (i).FK_ID) )|| '</P></TD>';
      END LOOP;
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_VID_SHORT (pFD_DATA, pFD_DATA, z.FK_ID)) || '</P></TD>';
      FOR i IN 1 .. Pr.COUNT LOOP
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_VID_SHORT_PRIZN (pFD_DATA, pFD_DATA, z.FK_ID, Pr (i).FK_ID) )|| '</P></TD>';
      END LOOP;
      str  := str || '</TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      FOR n IN cSubVid (z.FK_ID) LOOP
        PROGRESS_BAR.SETSTROUT ('Выбывшие по '||z.FC_NAME||'-'||n.FC_NAME||'...');
        PROGRESS_BAR.STEPIT;
        str :='<TR><TD class=user style=''margin-left:5mm''><P class=user> - ' || n.FC_NAME || ' (чел.)' || '</P></TD>'||
              '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_SUBVID (pFD_DATA, pFD_DATA, z.FK_ID, n.FK_ID)) || '</P></TD>';
        FOR i IN 1 .. Pr.COUNT LOOP
          str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_SVID_PRIZN (pFD_DATA, pFD_DATA, z.FK_ID, n.FK_ID, Pr (i).FK_ID)) || '</P></TD>';
        END LOOP;
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_SVID_SHORT (pFD_DATA, pFD_DATA, z.FK_ID, n.FK_ID)) || '</P></TD>';
        FOR i IN 1 .. Pr.COUNT LOOP
          str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_VYB_SVID_SHORT_PRIZN (pFD_DATA, pFD_DATA, z.FK_ID, n.FK_ID, Pr (i).FK_ID) )|| '</P></TD>';
        END LOOP;
        str  := str || '</TR>';
        DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      END LOOP;
    END LOOP;
    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества состоящих на конец отчетного периода...');
    PROGRESS_BAR.STEPIT;
    str :='<TR>'||
          '<TD class=user><P class=user>Состоит на конец отчетного периода (чел.)</P></TD>'||
          '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_MORNING (pFD_DATA + 1))|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_MORNING_PRIZN (pFD_DATA + 1, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_MORNING_SHORT (pFD_DATA + 1) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNT_MORNING_SHORT_PRIZN (pFD_DATA + 1, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('Подсчет койко-дней всего за период...');
    PROGRESS_BAR.STEPIT;
    i    := Pr.COUNT * 2 + 3;
    str  := '</TR><TR><TD COLSPAN="' || i || '"><P class=user>&nbsp;</P></TD></TR>'||
            '<TR><TD class=user><P class=user>Проведено койко-дней (к/дн.)</P></TD>'||
            '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDN (pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_PRIZN (pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_SHORT (pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_PRIZN_SHORT (pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--Койко дни по типу прибытия...
    FOR p IN cVid LOOP
      PROGRESS_BAR.SETSTROUT ('Койко-дни по '||p.FC_NAME||'...');
      PROGRESS_BAR.STEPIT;
      str  := '<TR>'||
              '<TD class=user><P class=user>В т/ч по ' || p.FC_NAME || ' (кдн.)' || '</P></TD>'||
              '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_VID (pFD_DATA, p.FK_ID)) || '</P></TD>';
      FOR i IN 1 .. Pr.COUNT LOOP
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_PRIZN_VID (pFD_DATA, Pr (i).FK_ID, p.FK_ID)) || '</P></TD>';
      END LOOP;
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_VID_SHORT (pFD_DATA, p.FK_ID)) || '</P></TD>';
      FOR i IN 1 .. Pr.COUNT LOOP
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_PRIZN_VID_SHORT (pFD_DATA, Pr (i).FK_ID, p.FK_ID))|| '</P></TD>';
      END LOOP;
      str  := str || '</TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      FOR n IN cSubVid (p.FK_ID) LOOP
        PROGRESS_BAR.SETSTROUT ('Койко-дни по '||p.FC_NAME||'-'||n.FC_NAME||'...');
        PROGRESS_BAR.STEPIT;
        str  := '<TR>'||
                '<TD class=user style=''margin-left:5mm''><P class=user> - ' || n.FC_NAME || ' (кдн.)' || '</P></TD>'||
                '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_SUBVID (pFD_DATA, p.FK_ID, n.FK_ID)) || '</P></TD>';
        FOR i IN 1 .. Pr.COUNT LOOP
          str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_PRIZN_SUBVID (pFD_DATA, Pr (i).FK_ID, n.FK_ID, p.FK_ID)) || '</P></TD>';
        END LOOP;
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_SUBVID_SHORT (pFD_DATA, p.FK_ID, n.FK_ID) )|| '</P></TD>';
        FOR i IN 1 .. Pr.COUNT LOOP
          str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (GET_KDN_PRIZN_SUBVID_SHORT (pFD_DATA, Pr (i).FK_ID, n.FK_ID, p.FK_ID)) || '</P></TD>';
        END LOOP;
        str  := str || '</TR>';
        DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      END LOOP;
    END LOOP;
    i    := Pr.COUNT * 2 + 3;
    str  := '<TR><TD COLSPAN="' || i || '"><P class=user>&nbsp;</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--Опоздание
    PROGRESS_BAR.SETSTROUT ('Подсчет опоздавших...');
    PROGRESS_BAR.STEPIT;
    str  := '<TR><TD class=user><P class=user>Опоздавших (чел.)</P></TD>'||
            '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_OPOZD (pFD_DATA, pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_OPOZD_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_OPOZD_SHORT (pFD_DATA, pFD_DATA)) || '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_OPOZD_SHORT_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('Подсчет кол-ва койко дней опоздавших...');
    PROGRESS_BAR.STEPIT;
    str  := '<TR>'||
            '<TD class=user><P class=user>Число дней опоздания (к/дн.)</P></TD>'||
            '<TD><P class=user>' ||PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_OPOZD (pFD_DATA, pFD_DATA)) || '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_OPOZD_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_OPOZD_SHORT (pFD_DATA, pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_OPOZD_SHORT_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--Выбыло ранее...
    PROGRESS_BAR.SETSTROUT ('Выбыло ранее...');
    PROGRESS_BAR.STEPIT;
    str  := '<TR><TD class=user><P class=user>Выбыло ранее срока (чел.)</P></TD>'||
            '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_EARLY (pFD_DATA, pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' ||PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_EARLY_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_EARLY_SHORT (pFD_DATA, pFD_DATA)) || '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_EARLY_SHORT_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str  := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('Подсчет неиспользованных койко-дней...');
    PROGRESS_BAR.STEPIT;
    str  := '<TR><TD class=user><P class=user>Не использовано к/дн (к/дн.)</P></TD>'||
            '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_EARLY (pFD_DATA, pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_EARLY_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_EARLY_SHORT (pFD_DATA, pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_EARLY_SHORT_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str  := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--Продление
    PROGRESS_BAR.SETSTROUT ('Продлилось...');
    PROGRESS_BAR.STEPIT;
    str  := '<TR><TD class=user><P class=user>Число лиц, продливших срок лечения (чел.)</P></TD>'||
            '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_PRODL (pFD_DATA, pFD_DATA)) || '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_PRODL_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_PRODL_SHORT (pFD_DATA, pFD_DATA)) || '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_PRODL_SHORT_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('Подсчет дней продлления...');
    PROGRESS_BAR.STEPIT;
    str  := '<TR><TD class=user><P class=user>Число дней продления (к/дн.)</P></TD>'||
            '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_PRODL (pFD_DATA, pFD_DATA)) || '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_PRODL_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID)) || '</P></TD>';
    END LOOP;
    str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_PRODL_SHORT (pFD_DATA, pFD_DATA) )|| '</P></TD>';
    FOR i IN 1 .. Pr.COUNT LOOP
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_PRODL_SHORT_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID) )|| '</P></TD>';
    END LOOP;
    str  := str || '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--Продление по типам
    j    := 7;
    LOOP
      j := j - 1;
      IF j < 4 THEN EXIT;
      END IF;
      str  := '<TR><TD class=user><P class=user>';
      IF j = 6 THEN
        str  := str || 'В т/ч продление по опозданию ';
        PROGRESS_BAR.SETSTROUT ('Продление по опозданию...');
      ELSIF j = 5 THEN
        str  := str || 'В т/ч продление за наличный расчет ';
        PROGRESS_BAR.SETSTROUT ('Продление за наличный расчет...');
      ELSE
        str  := str || 'Восстановлено ';
        PROGRESS_BAR.SETSTROUT ('Восстановлено...');
      END IF;
      PROGRESS_BAR.STEPIT;
      str  := str || ' (чел.)</TD>'||
                     '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_PRODL (pFD_DATA, pFD_DATA, j) )|| '</P></TD>';
      FOR i IN 1 .. Pr.COUNT LOOP
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_PRODL_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID, j)) || '</P></TD>';
      END LOOP;
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_PRODL_SHORT (pFD_DATA, pFD_DATA, j)) || '</P></TD>';
      FOR i IN 1 .. Pr.COUNT LOOP
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_ALLFUNC.GET_COUNTV_PRODL_SHORT_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID, j)) || '</P></TD>';
      END LOOP;
      str  := str || '</TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      IF j IN (5, 6) THEN
        str  := '<TR><TD class=user style=''margin-left:3mm''><P class=user>Число дней продления (к/дн.)</P></TD>'||
                '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_PRODL (pFD_DATA, pFD_DATA, j)) || '</P></TD>';
        PROGRESS_BAR.SETSTROUT ('Число дней продления...');
      ELSE
        str  := '<TR><TD class=user style=''margin-left:3mm''><P class=user>Число дней восстановления (к/дн.)</P></TD>'||
                '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_PRODL (pFD_DATA, pFD_DATA, j)) || '</P></TD>';
        PROGRESS_BAR.SETSTROUT ('Число дней восстановления...');
      END IF;
      PROGRESS_BAR.STEPIT;
      FOR i IN 1 .. Pr.COUNT LOOP
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_PRODL_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID, j)) || '</P></TD>';
      END LOOP;
      str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_PRODL_SHORT (pFD_DATA, pFD_DATA, j)) || '</P></TD>';
      FOR i IN 1 .. Pr.COUNT LOOP
        str  := str || '<TD><P class=user>' || PKG_R_ALLFUNC.RETURN_VALUE (PKG_R_KDNFUNC.GET_KDNV_PRODL_SHORT_PRIZN (pFD_DATA, pFD_DATA, Pr (i).FK_ID, j)) || '</P></TD>';
      END LOOP;
      str  := str || '</TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    str  := '</TABLE><BR><P><B>Отчет составил_________________________' || DO_VRACHFIO (pFK_VRACHID);
    str  := str || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
--  do_log(sysdate,'END of function is reached!');
    RETURN nC;
  END;
end PKG_R_INTIME_DAY;
/

SHOW ERRORS;


