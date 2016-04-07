DROP PACKAGE BODY ASU.PKG_STAT_VRACH
/

--
-- PKG_STAT_VRACH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_STAT_VRACH" 
IS
  FUNCTION GET_STAT_VRACH (DATA1 IN DATE, DATA2 IN DATE, VRACH_ID IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR C1
    IS
      SELECT fk_id, fc_name
        FROM totdel;
    CURSOR C2 (DATA1 IN DATE, DATA2 IN DATE, ID IN NUMBER)
    IS
      SELECT tsotr.fk_id id1, do_vrachfio (tsotr.fk_id) fio, GET_vrachnagr (tsotr.FK_ID, data1, data2) kol, GET_PAC_VRACH_MEEN (tsotr.FK_ID, data1, data2) srkol
        FROM TSOTR, totdel
       WHERE FP_VRACH = 1
         AND fk_otdid = id
         AND tsotr.fk_otdid = totdel.fk_id;
    CURSOR C3 (DATA1 IN DATE, DATA2 IN DATE, ID IN NUMBER)
    IS
      SELECT TRUNC (SUM (GET_PACDAYS_FOR_PERIOD (FK_PACID, data1, data2))) ckd
        FROM TVRACH
       WHERE FK_VRACHID = id
         AND FL_VID = 'M'
         AND IS_PAC_LIVE_IN_PERIOD (FK_PACID, data1, data2) = 1;
    sumsrkol   NUMBER;
    sumkol     NUMBER;
    kol        NUMBER;
    kd         NUMBER;
    srkol      NUMBER;
    str        VARCHAR2 (32767);
    nc         NUMBER;
    sumkd      NUMBER;
    cc         CLOB;
  BEGIN
    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.session);
    str       :=
      ' <html xmlns:x="urn:schemas-microsoft-com:office:excel"> ' || ' <head> ' || ' <meta http-equiv=Content-Type content="text/html; charset=windows-1251"> ' || ' <style> ' || ' <!-- ' ||
        ' .sm_td {border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
        ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} ' ||
        ' @page  ' ||
        ' {mso-page-orientation:landscape;  }  ' ||
        ' @page Section1  ' ||
        ' { mso-page-orientation:landscape;  ' ||
        '    size:841.9pt 595.3pt ; }  ' ||
        ' div.Section1  ' ||
        ' {page:Section1;} ' ||
        ' --> ' ||
        ' </style></head> ';
    sumsrkol  := 0;
    sumkol    := 0;
    sumkd     := 0;
    str       := str||'<P ALIGN="CENTER" ><B><font size="+1"> Медучреждение "' || PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известно') || '"</font></B><BR>';
    str       := str || '<ALIGN="CENTER"><font size="+2">"Отчёт о загрузке врачей"  </font><br>';
    str       := str || 'за период с ' || TO_CHAR (data1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (data2, 'dd.mm.yyyy');
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                        Caiinei aaiiua a eiiao eeiaa
--                                 Ii?aaaeaiea oaaeeou
    str       :=
      '<table align="center"  width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
--                                 Oaiea oaaeeou
    str       :=
      str ||
        '<tr><td align="center" class="sm_td"><B>ФИО:</B></td><td align="center" class="sm_td"><b>Количетво пациентов:</b></td><td align="center" class="sm_td"><b>Среднее количетво пациентов:</b></td><td align="center" class="sm_td"><b>Количетво койко-дней:</b></td></tr>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                     Caiieiaiea oaaeeou
    FOR c_rec1 IN c1 LOOP
      --str  := '<tr align="center"><td><B>' || c_rec1.fc_name || ':</b></td><td>&nbsp</td><td>&nbsp</td><td>&nbsp</td></tr>';
      str  := '</tr><tr><td width=638 colspan=4 valign=top style="width:478.55pt;border:solid windowtext .5pt;';
      str  := str || 'border-top:none;mso-border-top-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt"><p class=MsoNormal ><b>' || c_rec1.fc_name || ':</B></p></td></tr>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
      FOR c_rec2 IN c2 (data1, data2, c_rec1.fk_id) LOOP
        OPEN c3 (data1, data2, c_rec2.id1);
        FETCH c3 INTO kd;
        CLOSE c3;
        IF c_rec2.srkol IS NULL THEN
          c_rec2.srkol  := 0;
        END IF;
        IF c_rec2.kol IS NULL THEN
          c_rec2.kol  := 0;
        END IF;
        IF kd IS NULL THEN
          kd  := 0;
        END IF;
        str       :=
          '<TR align="left"><TD class="sm_td">' || c_rec2.fio || '</TD><TD class="sm_td" align="center">' || c_rec2.kol || '</TD><TD class="sm_td" align="center">' || c_rec2.srkol ||
            '</TD><TD class="sm_td" align="center">' ||
            kd ||
            '</TD></TR>';
        DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
        sumsrkol  := sumsrkol + c_rec2.srkol;
        sumkol    := sumkol + c_rec2.kol;
        sumkd     := sumkd + kd;
      END LOOP;
    END LOOP;
    str       :=
      '<TR align="left"><TD class="sm_td"><B>Итого:</B></TD><TD class="sm_td" align="center"><B>' || sumkol || '</B></TD><TD class="sm_td" align="center"><B>' || sumsrkol ||
        '</B></TD><TD class="sm_td" align="center"><B>' ||
        sumkd ||
        '</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str       := '</TABLE><p  align="left">Отчёт составил:  _________________________' || DO_VRACHFIO (vrach_id) || '</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--             Концовка
    str       := '</HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    INSERT INTO TCLOBS
                (FC_CLOB)
         VALUES (cc)
      RETURNING FK_ID
      INTO nC;
    RETURN nc;
  END;
END;-- Package Body PKG_STAT_VRACH
/

SHOW ERRORS;


