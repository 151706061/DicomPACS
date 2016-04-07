DROP PACKAGE BODY ASU.PKG_R_PACLISTS
/

--
-- PKG_R_PACLISTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PACLISTS" 
 IS-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER,pFK_TYPE IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacLists.dpr
    CURSOR c IS
     SELECT 0 FK_ID, 'ОБЩИЙ СПИСОК' FC_NAME, 0 FK_TABID, 'DUAL' FC_TABLE FROM DUAL
      UNION
     SELECT 1 FK_ID, 'Список депутатов Госдумы РФ' FC_NAME, 92 FK_TABID, 'TPACVID' FC_TABLE FROM DUAL
      UNION
     SELECT 2 FK_ID, 'Список членов Совета Федерации' FC_NAME, 91 FK_TABID, 'TPACVID' FC_TABLE FROM DUAL
      UNION
     SELECT 3 FK_ID, 'Список контингентов' FC_NAME, 1 FK_TABID, 'TGROUP' FC_TABLE FROM DUAL
      UNION
     SELECT 4 FK_ID, 'Семинар' FC_NAME, 108 FK_TABID, 'TPRIZN' FC_TABLE FROM DUAL
      UNION
     SELECT 5 FK_ID, 'Список детей (до 14 лет)' FC_NAME, 0 FK_TABID, 'DUAL' FC_TABLE FROM DUAL
      UNION
     SELECT 6 FK_ID, 'Список детей контингента' FC_NAME, 111 FK_TABID, 'TPRIZN' FC_TABLE FROM DUAL
      UNION
     SELECT 7 FK_ID, 'По путевкам реализованным в РОСКУРОРТЕ' FC_NAME, 418 FK_TABID, 'TVID' FC_TABLE FROM DUAL
      UNION
     SELECT 8 FK_ID, 'По путевкам реализованным в РАДУГЕ' FC_NAME, 420 FK_TABID, 'TVID' FC_TABLE FROM DUAL
      UNION
     SELECT 9 FK_ID, 'По путевкам реализованным в клубе "МИР"' FC_NAME, 429 FK_TABID, 'TVID' FC_TABLE FROM DUAL;
    CURSOR cAll (pFL_PAYPLACE IN NUMBER) is
     select /*+ rule*/rownum,tkarta.fk_id,fk_ibid,tkarta.FC_FAM,PKG_R_ALLFUNC.RETURN_VALUE(tkarta.FC_IM||' '||tkarta.FC_OTCH) as FC_IMOTCH,
            PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(tkarta.fk_id) as FC_RABOTA,
            TO_CHAR(GET_PACINCOME(tkarta.fk_id),'dd.mm.yyyy') as FD_DATA1,TO_CHAR(NVL ( GET_PACOUTCOME(tkarta.fk_id) , GET_PACPLANOUTCOME(tkarta.fk_id) ),'dd.mm.yyyy') as FD_DATA2,
            TO_CHAR(GET_PACDAYS(tkarta.fk_id)) as FC_DAYS,GET_FCPALATA(GET_PACPALATAID(tkarta.FK_ID)) as FC_PALATA
       from tkarta
      where tkarta.fk_id in
                         (SELECT FK_PACID
                            FROM TSROKY
                           WHERE (FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR pFD_DATA1 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3)
                              OR pFD_DATA2 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3))
                             AND FK_PRYB IN(2,4,5,6) )
        and FL_PAYPLACE = pFL_PAYPLACE
      ORDER BY FD_DATA1,FC_FAM;
    CURSOR cPacVid (pFL_PAYPLACE IN NUMBER,pFK_PACVID IN NUMBER) is
     select /*+ rule*/rownum,tkarta.fk_id,fk_ibid,tkarta.FC_FAM,PKG_R_ALLFUNC.RETURN_VALUE(tkarta.FC_IM||' '||tkarta.FC_OTCH) as FC_IMOTCH,
            PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(tkarta.fk_id) as FC_RABOTA,
            TO_CHAR(GET_PACINCOME(tkarta.fk_id),'dd.mm.yyyy') as FD_DATA1,TO_CHAR(NVL ( GET_PACOUTCOME(tkarta.fk_id) , GET_PACPLANOUTCOME(tkarta.fk_id) ),'dd.mm.yyyy') as FD_DATA2,
            TO_CHAR(GET_PACDAYS(tkarta.fk_id)) as FC_DAYS,GET_FCPALATA(GET_PACPALATAID(tkarta.FK_ID)) as FC_PALATA
       from tkarta
      where tkarta.fk_id in
                         (SELECT FK_PACID
                            FROM TSROKY
                           WHERE (FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR pFD_DATA1 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3)
                              OR pFD_DATA2 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3))
                             AND FK_PRYB IN(2,4,5,6) )
        and FL_PAYPLACE = pFL_PAYPLACE
        and FK_PACVID = pFK_PACVID
      ORDER BY FD_DATA1,FC_FAM;
    CURSOR cGroup (pFL_PAYPLACE IN NUMBER,pFK_GROUPID IN NUMBER) is
     select /*+ rule*/rownum,tkarta.fk_id,fk_ibid,tkarta.FC_FAM,PKG_R_ALLFUNC.RETURN_VALUE(tkarta.FC_IM||' '||tkarta.FC_OTCH) as FC_IMOTCH,
            PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(tkarta.fk_id) as FC_RABOTA,
            TO_CHAR(GET_PACINCOME(tkarta.fk_id),'dd.mm.yyyy') as FD_DATA1,TO_CHAR(NVL ( GET_PACOUTCOME(tkarta.fk_id) , GET_PACPLANOUTCOME(tkarta.fk_id) ),'dd.mm.yyyy') as FD_DATA2,
            TO_CHAR(GET_PACDAYS(tkarta.fk_id)) as FC_DAYS,GET_FCPALATA(GET_PACPALATAID(tkarta.FK_ID)) as FC_PALATA
       from tkarta
      where tkarta.fk_id in
                         (SELECT FK_PACID
                            FROM TSROKY
                           WHERE (FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR pFD_DATA1 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3)
                              OR pFD_DATA2 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3))
                             AND FK_PRYB IN(2,4,5,6) )
        and FL_PAYPLACE = pFL_PAYPLACE
        and FK_GROUPID = pFK_GROUPID
      ORDER BY FD_DATA1,FC_FAM;
    CURSOR cPrizn (pFL_PAYPLACE IN NUMBER,pFK_PRIZN IN NUMBER) is
     select /*+ rule*/rownum,tkarta.fk_id,fk_ibid,tkarta.FC_FAM,PKG_R_ALLFUNC.RETURN_VALUE(tkarta.FC_IM||' '||tkarta.FC_OTCH) as FC_IMOTCH,
            PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(tkarta.fk_id) as FC_RABOTA,
            TO_CHAR(GET_PACINCOME(tkarta.fk_id),'dd.mm.yyyy') as FD_DATA1,TO_CHAR(NVL ( GET_PACOUTCOME(tkarta.fk_id) , GET_PACPLANOUTCOME(tkarta.fk_id) ),'dd.mm.yyyy') as FD_DATA2,
            TO_CHAR(GET_PACDAYS(tkarta.fk_id)) as FC_DAYS,GET_FCPALATA(GET_PACPALATAID(tkarta.FK_ID)) as FC_PALATA
       from tkarta
      where tkarta.fk_id in
                         (SELECT FK_PACID
                            FROM TSROKY
                           WHERE (FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR pFD_DATA1 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3)
                              OR pFD_DATA2 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3))
                             AND FK_PRYB IN(2,4,5,6) )
        and FL_PAYPLACE = pFL_PAYPLACE
        and FK_PRIZN = pFK_PRIZN
      ORDER BY FD_DATA1,FC_FAM;
    CURSOR cVid (pFL_PAYPLACE IN NUMBER,pFK_VID IN NUMBER) is
     select /*+ rule*/rownum,tkarta.fk_id,fk_ibid,tkarta.FC_FAM,PKG_R_ALLFUNC.RETURN_VALUE(tkarta.FC_IM||' '||tkarta.FC_OTCH) as FC_IMOTCH,
            PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(tkarta.fk_id) as FC_RABOTA,FN_SUM,
            TO_CHAR(GET_PACINCOME(tkarta.fk_id),'dd.mm.yyyy') as FD_DATA1,TO_CHAR(NVL ( GET_PACOUTCOME(tkarta.fk_id) , GET_PACPLANOUTCOME(tkarta.fk_id) ),'dd.mm.yyyy') as FD_DATA2,
            TO_CHAR(GET_PACDAYS(tkarta.fk_id)) as FC_DAYS,GET_FCPALATA(GET_PACPALATAID(tkarta.FK_ID)) as FC_PALATA
       from tkarta
      where tkarta.fk_id in
                         (SELECT FK_PACID
                            FROM TSROKY
                           WHERE (FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR pFD_DATA1 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3)
                              OR pFD_DATA2 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3))
                             AND FK_PRYB IN(2,4,5,6) )
        and FL_PAYPLACE = pFL_PAYPLACE
        and FK_KOD2 = pFK_VID
      ORDER BY FD_DATA1,FC_FAM;
    CURSOR cChild (pFL_PAYPLACE IN NUMBER) is
     select /*+ rule*/rownum,tkarta.fk_id,fk_ibid,tkarta.FC_FAM,PKG_R_ALLFUNC.RETURN_VALUE(tkarta.FC_IM||' '||tkarta.FC_OTCH) as FC_IMOTCH,
            PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(tkarta.fk_id) as FC_RABOTA,
            TO_CHAR(GET_PACINCOME(tkarta.fk_id),'dd.mm.yyyy') as FD_DATA1,TO_CHAR(NVL ( GET_PACOUTCOME(tkarta.fk_id) , GET_PACPLANOUTCOME(tkarta.fk_id) ),'dd.mm.yyyy') as FD_DATA2,
            TO_CHAR(GET_PACDAYS(tkarta.fk_id)) as FC_DAYS,GET_FCPALATA(GET_PACPALATAID(tkarta.FK_ID)) as FC_PALATA
       from tkarta
      where tkarta.fk_id in
                         (SELECT FK_PACID
                            FROM TSROKY
                           WHERE (FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR pFD_DATA1 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3)
                              OR pFD_DATA2 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3))
                             AND FK_PRYB IN(2,4,5,6) )
        and FL_PAYPLACE = pFL_PAYPLACE
        and PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(tkarta.fk_id,pFD_DATA1) < 14
      ORDER BY FD_DATA1,FC_FAM;
    CURSOR cChildPrizn (pFL_PAYPLACE IN NUMBER) is
     select /*+ rule*/rownum,tkarta.fk_id,fk_ibid,tkarta.FC_FAM,PKG_R_ALLFUNC.RETURN_VALUE(tkarta.FC_IM||' '||tkarta.FC_OTCH) as FC_IMOTCH,
            PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(tkarta.fk_id) as FC_RABOTA,
            TO_CHAR(GET_PACINCOME(tkarta.fk_id),'dd.mm.yyyy') as FD_DATA1,TO_CHAR(NVL ( GET_PACOUTCOME(tkarta.fk_id) , GET_PACPLANOUTCOME(tkarta.fk_id) ),'dd.mm.yyyy') as FD_DATA2,
            TO_CHAR(GET_PACDAYS(tkarta.fk_id)) as FC_DAYS,GET_FCPALATA(GET_PACPALATAID(tkarta.FK_ID)) as FC_PALATA
       from tkarta
      where tkarta.fk_id in
                         (SELECT FK_PACID
                            FROM TSROKY
                           WHERE (FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                              OR pFD_DATA1 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3)
                              OR pFD_DATA2 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3))
                             AND FK_PRYB IN(2,4,5,6) )
        and FL_PAYPLACE = pFL_PAYPLACE
        and PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(tkarta.fk_id,pFD_DATA1) < 14
        and (FK_PRIZN = 111 OR FK_PRIZN = 107)
      ORDER BY FD_DATA1,FC_FAM;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
    nItogo NUMBER;
    nItogoSum NUMBER;
    nVsego NUMBER;
    nVsegoSum NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','Список пациентов по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             '20','10','20','20',
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR p in c LOOP
      if p.FK_ID = pFK_TYPE then
        str:='<BODY><DIV class=user>'||
             '<P ALIGN="CENTER"><B>Список пациентов проживавших в санатории "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>'||
             'в периоде c '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy')||'<BR>'||
             'по категории: "'|| p.FC_NAME ||'"</P><BR>';
        DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
        nVsego:=0;
        nVsegoSum:=0;

        if p.FK_ID not in (7,8,9) then
          str:='<table>'||
               '<TR><TD><P>№ п/п</P></TD>'||
               '<TD><P>Рег. №</P></TD>'||
               '<TD><P>Фамилия</P></TD>'||
               '<TD><P>Имя отчество</P></TD>'||
               '<TD><P>Место работы</P></TD>'||
               '<TD><P>Сроки пребывания</P></TD>'||
               '<TD><P>Кол-во дней</P></TD>'||
               '<TD><P>№ палаты</P></TD></TR>';
        else
          str:='<table>'||
               '<TR><TD><P>№ п/п</P></TD>'||
               '<TD><P>Рег. №</P></TD>'||
               '<TD><P>Фамилия</P></TD>'||
               '<TD><P>Имя отчество</P></TD>'||
               '<TD><P>Место работы</P></TD>'||
               '<TD><P>Сроки пребывания</P></TD>'||
               '<TD><P>Кол-во дней</P></TD>'||
               '<TD><P>№ палаты</P></TD>'||
               '<TD><P>Cтоимость</P></TD></TR>';
        end if;
        DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

        FOR nTemp in 0..1 LOOP
          nItogo := 0;
          nItogoSum := 0;
          if p.FK_ID not in (7,8,9) then
            if 1 - nTemp = 1 then
              str:='<TR><TD COLSPAN="8"><P><U>Путевки "СОЧИ"</U></P></TD></TR>';
            else
              str:='<TR><TD COLSPAN="8"><P><U>Путевки "МОСКВА"</U></P></TD></TR>';
            end if;
          else
            if 1 - nTemp = 0 then
              str:='<TR><TD COLSPAN="9"><P><U>Путевки "СОЧИ"</U></P></TD></TR>';
            else
              str:='<TR><TD COLSPAN="9"><P><U>Путевки "МОСКВА"</U></P></TD></TR>';
            end if;
          end if;
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

          if p.FK_ID = 0 then
            FOR c in cAll(1 - nTemp) LOOP
              str:='<TR><TD><P>'||c.rownum||'</P></TD>'||
                   '<TD><P>'||c.fk_ibid||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_fam||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_imotch||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_rabota||'</P></TD>'||
                   '<TD><P>'||c.fd_data1||' - '||c.fd_data2||'</P></TD>'||
                   '<TD><P>'||c.fc_days||'</P></TD>'||
                   '<TD style=''text-align:right''><P>'||c.fc_palata||'</P></TD></TR>';
              nItogo := nItogo + 1;
              nVsego := nVsego + 1;
              DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
            END LOOP;
          elsif p.FK_ID in (1,2) then
            FOR c in cPacVid(1 - nTemp,p.FK_TABID) LOOP
              str:='<TR><TD><P>'||c.rownum||'</P></TD>'||
                   '<TD><P>'||c.fk_ibid||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_fam||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_imotch||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_rabota||'</P></TD>'||
                   '<TD><P>'||c.fd_data1||' - '||c.fd_data2||'</P></TD>'||
                   '<TD><P>'||c.fc_days||'</P></TD>'||
                   '<TD style=''text-align:right''><P>'||c.fc_palata||'</P></TD></TR>';
              nItogo := nItogo + 1;
              nVsego := nVsego + 1;
              DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
            END LOOP;
          elsif p.FK_ID = 3 then
            FOR c in cGroup(1 - nTemp,p.FK_TABID) LOOP
              str:='<TR><TD><P>'||c.rownum||'</P></TD>'||
                   '<TD><P>'||c.fk_ibid||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_fam||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_imotch||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_rabota||'</P></TD>'||
                   '<TD><P>'||c.fd_data1||' - '||c.fd_data2||'</P></TD>'||
                   '<TD><P>'||c.fc_days||'</P></TD>'||
                   '<TD style=''text-align:right''><P>'||c.fc_palata||'</P></TD></TR>';
              nItogo := nItogo + 1;
              nVsego := nVsego + 1;
              DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
            END LOOP;
          elsif p.FK_ID = 4 then
            FOR c in cPrizn(1 - nTemp,p.FK_TABID) LOOP
              str:='<TR><TD><P>'||c.rownum||'</P></TD>'||
                   '<TD><P>'||c.fk_ibid||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_fam||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_imotch||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_rabota||'</P></TD>'||
                   '<TD><P>'||c.fd_data1||' - '||c.fd_data2||'</P></TD>'||
                   '<TD><P>'||c.fc_days||'</P></TD>'||
                   '<TD style=''text-align:right''><P>'||c.fc_palata||'</P></TD></TR>';
              nItogo := nItogo + 1;
              nVsego := nVsego + 1;
              DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
            END LOOP;
          elsif p.FK_ID = 5 then
            FOR c in cChild(1 - nTemp) LOOP
              str:='<TR><TD><P>'||c.rownum||'</P></TD>'||
                   '<TD><P>'||c.fk_ibid||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_fam||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_imotch||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_rabota||'</P></TD>'||
                   '<TD><P>'||c.fd_data1||' - '||c.fd_data2||'</P></TD>'||
                   '<TD><P>'||c.fc_days||'</P></TD>'||
                   '<TD style=''text-align:right''><P>'||c.fc_palata||'</P></TD></TR>';
              nItogo := nItogo + 1;
              nVsego := nVsego + 1;
              DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
            END LOOP;
          elsif p.FK_ID = 6 then
            FOR c in cChildPrizn (1 - nTemp/*,p.FK_TABID*/) LOOP
              str:='<TR><TD><P>'||c.rownum||'</P></TD>'||
                   '<TD><P>'||c.fk_ibid||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_fam||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_imotch||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_rabota||'</P></TD>'||
                   '<TD><P>'||c.fd_data1||' - '||c.fd_data2||'</P></TD>'||
                   '<TD><P>'||c.fc_days||'</P></TD>'||
                   '<TD style=''text-align:right''><P>'||c.fc_palata||'</P></TD></TR>';
              nItogo := nItogo + 1;
              nVsego := nVsego + 1;
              DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
            END LOOP;
          elsif p.FK_ID in (7,8,9) then
            FOR c in cVid(1 - nTemp,p.FK_TABID) LOOP
              str:='<TR><TD><P>'||c.rownum||'</P></TD>'||
                   '<TD><P>'||c.fk_ibid||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_fam||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_imotch||'</P></TD>'||
                   '<TD class=user><P>'||c.fc_rabota||'</P></TD>'||
                   '<TD><P>'||c.fd_data1||' - '||c.fd_data2||'</P></TD>'||
                   '<TD><P>'||c.fc_days||'</P></TD>'||
                   '<TD style=''text-align:right''><P>'||c.fc_palata||'</P></TD>'||
                   '<TD style=''text-align:right''><P>'||c.fn_sum||'</P></TD></TR>';
              DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
              nItogo := nItogo + 1;
              nVsego := nVsego + 1;
              nItogoSum := nItogoSum + c.fn_sum;
              nVsegoSum := nVsegoSum + c.fn_sum;
            END LOOP;
          end if;

          if p.FK_ID in (7,8,9) then
            str:='<TR><TD COLSPAN="7" style=''text-align:right''><P><B>ИТОГО:</B></P></TD>'||
                 '<TD><P><B>'||nItogo||'</B></P></TD>'||
                 '<TD><P><B>'||nItogoSum||'</B></P></TD></TR>';
          else
            str:='<TR><TD COLSPAN="7" style=''text-align:right''><P><B>ИТОГО:</B></P></TD>'||
                 '<TD><P><B>'||nItogo||'</B></P></TD></TR>';
          end if;
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
        END LOOP;
        /*FOR p in cKorp LOOP
          nSumKorp:=0;
          1 - nTemp:=1;
          LOOP
            EXIT WHEN 1 - nTemp > p.FN_FLOOR;
            nSumFloor:=0;
            str:='<TR><td colspan="6"><P class=user><U>Корпус: "'|| p.FC_NAME ||'" Этаж: '|| 1 - nTemp ||'</U></P></TD></TR>';
            DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
            FOR c in cMain (p.FK_ID,1 - nTemp) LOOP
              str:='<TR><td style=''text-align:left''><P class=user>'|| c.FC_FAM ||'</P></TD>'||
                   '<td><P class=user>'|| TO_CHAR(c.FD_DATA1,'dd.mm.yyyy') ||'</P></TD>'||
                   '<td><P class=user>'|| TO_CHAR(c.FD_DATA2,'dd.mm.yyyy') ||'</P></TD>'||
                   '<td class=user><P class=user>'|| c.FK_IBID ||'</P></TD>'||
                   '<td class=user><P class=user>'|| c.FC_DAYS ||'</P></TD>'||
                   '<td class=user><P class=user>'|| c.FC_PALATA ||'</P></TD></TR>';
              DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
              Inc(nSumFloor);
            END LOOP;
            str:='<TR><td colspan="6" style=''text-align:right''><P class=user><B>Итого по этажу: '|| nSumFloor ||'</B></P></TD></TR>';
            DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
            nSumKorp := nSumKorp + nSumFloor;
            Inc(1 - nTemp);
          END LOOP;
          str:='<TR><td colspan="6" style=''text-align:left''><P class=user><B>Итого по корпусу: '|| nSumKorp ||'</B></P></TD></TR>';
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          nSumAll := nSumAll + nSumKorp;
        END LOOP;

        str:='<TR><td colspan="6" style=''text-align:left''><P class=user><B>ВСЕГО ПО САНАТОРИЮ: '|| nSumAll ||'</B></P></TD></TR></TABLE>';
        DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str)*/

        if p.FK_ID in (7,8,9) then
          str:='<TR><TD COLSPAN="7" style=''text-align:right''><P><B>ВСЕГО:</B></P></TD>'||
               '<TD><P><B>'||nVsego||'</B></P></TD>'||
               '<TD><P><B>'||nVsegoSum||'</B></P></TD></TR>';
        else
          str:='<TR><TD COLSPAN="7" style=''text-align:right''><P><B>ВСЕГО:</B></P></TD>'||
               '<TD><P><B>'||nVsego||'</B></P></TD></TR>';
        end if;
        DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      end if;
    END LOOP;

    str:='</TABLE><BR><P><B>Отчет составил: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


