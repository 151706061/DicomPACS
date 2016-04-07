DROP PACKAGE BODY ASU.PKG_R_ACT
/

--
-- PKG_R_ACT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_ACT" 
 IS-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATAC IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rAct.dpr
    CURSOR cMain (pFK_KORPID IN NUMBER,pFN_FLOOR IN NUMBER) is
     select /*+ rule*/tkarta.fk_id,PKG_REGIST_PACFUNC.GET_PAC_FIO(tkarta.fk_id) as FC_FIO,
            GET_PACINCOME(tkarta.fk_id) as FD_DATA1,NVL ( GET_PACOUTCOME(tkarta.fk_id) , GET_PACPLANOUTCOME(tkarta.fk_id) ) as FD_DATA2,
            fk_ibid,fc_put,GET_FCPALATA(GET_PACPALATAID(tkarta.FK_ID)) as FC_PALATA
       from tkarta,troom
      where tkarta.fk_id in
           (select fk_pacid
              from tsroky
             where (((FD_DATA1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC < FD_DATA3)
                OR (pFD_DATAC between FD_DATA1 and FD_DATA3)
                OR ((FD_DATA3 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC > FD_DATA1))
               and fk_pryb not in (1,3,7)
             UNION
            select fk_pacid
              from tsroky
             where (((FD_DATA1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC < FD_DATA3)
                OR ((FD_DATA3 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC = FD_DATA1))
               and fk_pryb in (5,6) )
      and troom.fk_id = GET_PACPALATAID(tkarta.FK_ID)
      and fk_korpid = pFK_KORPID
      and fn_floor = pFN_FLOOR
      ORDER BY FD_DATA1,FC_FIO;
    CURSOR cKorp is select * from tkorp order by fk_id;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
    nSumFloor NUMBER;
    nSumKorp NUMBER;
    nSumAll NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','Акт о фактическом наличии отдыхающих по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER"><B>Акт проверки выписки путевок и фактического наличия отдыхающих<BR>по состоянию на '||TO_CHAR(pFD_DATAC,'dd.mm.yyyy')||' по регистрации в приемном отделении санатория "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table>'||
         '<TR><TD><P>Фамилия имя отчество</P></TD>'||
         '<TD><P>Прибытие</P></TD>'||
         '<TD><P>Убытие</P></TD>'||
         '<TD><P>№ И.Б.</P></TD>'||
         '<TD><P>№ путевки</P></TD>'||
         '<TD><P>№ палаты</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    nSumAll:=0;
    FOR p in cKorp LOOP
      nSumKorp:=0;
      nTemp:=1;
      LOOP
        EXIT WHEN nTemp > p.FN_FLOOR;
        nSumFloor:=0;
        str:='<TR><td colspan="6"><P class=user><U>Корпус: "'|| p.FC_NAME ||'" Этаж: '|| nTemp ||'</U></P></TD></TR>';
        DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
        FOR c in cMain (p.FK_ID,nTemp) LOOP
          str:='<TR><td style=''text-align:left''><P class=user>'|| c.FC_FIO ||'</P></TD>'||
               '<td><P class=user>'|| TO_CHAR(c.FD_DATA1,'dd.mm.yyyy') ||'</P></TD>'||
               '<td><P class=user>'|| TO_CHAR(c.FD_DATA2,'dd.mm.yyyy') ||'</P></TD>'||
               '<td class=user><P class=user>'|| c.FK_IBID ||'</P></TD>'||
               '<td class=user><P class=user>'|| c.FC_PUT ||'</P></TD>'||
               '<td class=user><P class=user>'|| c.FC_PALATA ||'</P></TD></TR>';
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          Inc(nSumFloor);
        END LOOP;
        str:='<TR><td colspan="6" style=''text-align:left''><P class=user><B>Итого по этажу: '|| nSumFloor ||'</B></P></TD></TR>';
        DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
        nSumKorp := nSumKorp + nSumFloor;
        Inc(nTemp);
      END LOOP;
      str:='<TR><td colspan="6" style=''text-align:left''><P class=user><B>Итого по корпусу: '|| nSumKorp ||'</B></P></TD></TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      nSumAll := nSumAll + nSumKorp;
    END LOOP;

    str:='<TR><td colspan="6" style=''text-align:left''><P class=user><B>ВСЕГО ПО САНАТОРИЮ: '|| nSumAll ||'</B></P></TD></TR></TABLE>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<BR><P><B>Отчет составил: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


