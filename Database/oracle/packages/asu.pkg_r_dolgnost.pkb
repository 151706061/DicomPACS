DROP PACKAGE BODY ASU.PKG_R_DOLGNOST
/

--
-- PKG_R_DOLGNOST  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_DOLGNOST" 
 IS-- Created by TimurLan
  FUNCTION GET_DOLGNAME (pFK_DOLGID IN NUMBER)
  RETURN VARCHAR2
   IS
    CURSOR c IS
      select FC_NAME
        from TCOMPANY_DOLGNOST
       where FK_ID = pFK_DOLGID;
    cTemp VARCHAR2(30);
  BEGIN
    open c;
    fetch c into cTemp;
    close c;
    RETURN cTemp;
  END;
  FUNCTION DO_CALC_REPORT (pFD_DATA IN DATE, pFK_VRACHID IN NUMBER, pFK_DOLGID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rDolgnost.dpr
    CURSOR cMain IS
     SELECT /*+ rule*/ROWNUM,TKARTA.FK_ID,FK_IBID,PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(TKARTA.FK_ID) as FC_FIO,FC_PUT,
            TO_CHAR(GET_PACPLANINCOME(TKARTA.FK_ID),'DD.MM.YYYY HH24:MI') as FD_DATA1,
            TO_CHAR(GET_PACPLANOUTCOME(TKARTA.FK_ID),'DD.MM.YYYY HH24:MI') as FD_DATA2,
            GET_PACFCPALATA(TKARTA.FK_ID) FC_PALATA
      FROM TKARTA,TPEOPLES
     WHERE TKARTA.FK_ID IN
                       (SELECT TKARTA.FK_ID
                          FROM TKARTA,TSROKY
                         WHERE
                               (TKARTA.FP_TEK_COC = 2 AND TKARTA.FL_DOR<>1 AND TSROKY.FK_PRYB = 2 AND TSROKY.FK_PACID=TKARTA.FK_ID)
                            OR
                               (TSROKY.FK_PRYB = 3 AND TSROKY.FD_DATA1 >= pFD_DATA AND TSROKY.FK_PACID=TKARTA.FK_ID AND TKARTA.FL_DOR<>1))
       AND TPEOPLES.FK_ID = TKARTA.FK_PEPLID
       AND TPEOPLES.FK_DOLGNOST = pFK_DOLGID;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    nSum NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Список проживающих по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '10','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<body><div class=user>'||
         '<p align=center>Список пациентов проживающих в санатории «'|| PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'» на '|| TO_CHAR(pFD_DATA,'dd.mm.yyyy') ||' г.<BR>'||
         'по должности "'|| PKG_R_ALLFUNC.Return_Value ( GET_DOLGNAME(pFK_DOLGID) )||'"</p><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<table><tr>'||
         '<td><p class=user>№ п.п.</p></td>'||
         '<td><p class=user>№ И.Б.</p></td>'||
         '<td><p class=user>Ф.И.О.</p></td>'||
         '<td><p class=user>Путевка</p></td>'||
         '<td><p class=user>с:</p></td>'||
         '<td><p class=user>по:</p></td>'||
         '<td><p class=user>Палата</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    nSum:=0;
    FOR k in cMain LOOP
      str:='<td class=user><p class=user>'|| k.rownum ||'</p></td>'||
           '<td class=user><p class=user>'|| k.fk_ibid ||'</p></td>'||
           '<td style=''text-align:left''><p class=user>'|| k.fc_fio ||'</p></td>'||
           '<td class=user><p class=user>'|| k.fc_put ||'</p></td>'||
           '<td class=user><p class=user>'|| k.fd_data1 ||'</p></td>'||
           '<td class=user><p class=user>'|| k.fd_data2 ||'</p></td>'||
           '<td class=user><p class=user>'|| k.fc_palata ||'</p></td></tr>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      nSum := cMain%ROWCOUNT;
    END LOOP;

    str:='<td colspan=6 class=user><p class=user>ВСЕГО:</p></td>'||
         '<td><p class=user>'|| nSum ||'</p></td></tr></table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<BR><p><B>Медрегистратор___________________ '|| DO_VRACHFIO (pFK_VRACHID)||'</b></p></div></body></html>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


