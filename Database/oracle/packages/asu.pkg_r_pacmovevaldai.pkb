DROP PACKAGE BODY ASU.PKG_R_PACMOVEVALDAI
/

--
-- PKG_R_PACMOVEVALDAI  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PACMOVEVALDAI" -- Created by TimurLan
 IS
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacMoveValdai.dpr
    j NUMBER;
    t TTable;
    tv TTable;
    cC CLOB;
    nC NUMBER;
    HTMLText VARCHAR2 (32767);
   BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    HTMLText := PKG_HTML.GET_HEAD('excel','Движение пациентов за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy'),
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    HTMLText := HTMLText || '<BODY>'||
                            '<P ALIGN="CENTER">Движение отдыхающих санатория "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P><BR>'||
                            '<TABLE>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    j:=1;
    FOR p in cKont LOOP
      t(j):=p.FK_ID;
      inc(j);
    END LOOP;

    j:=1;
    FOR p in cVid LOOP
      tv(j):=p.FK_ID;
      inc(j);
    END LOOP;

    HTMLText := '<TR><TD>&nbsp;</TD>';
    FOR p in cVidShort LOOP
      HTMLText := HTMLText||'<TD>'||p.FC_NAME||':</TD>';
    END LOOP;
    HTMLText := HTMLText||'<TD><B>Всего:</B></TD>';
    FOR p in cKontShort LOOP
      HTMLText := HTMLText||'<TD>'||p.FC_SHORT||':</TD>';
    END LOOP;
    HTMLText := HTMLText||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    HTMLText := '<TR><TD class=user>Состоит на начало периода</TD>';
    FOR j IN 1..tv.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_MORNING_VID(pFD_DATA1,tv(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'<TD><B>'|| PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA1) ) ||'</B></TD>';
    FOR j IN 1..t.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_MORNING_PRIZN(pFD_DATA1,t(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    HTMLText := '<TR><TD class=user>Поступило за период</TD>';
    FOR j IN 1..tv.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_PRYB_VID(pFD_DATA1,pFD_DATA2,tv(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'<TD><B>'|| PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_PRYB(pFD_DATA1,pFD_DATA2) ) ||'</B></TD>';
    FOR j IN 1..t.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_PRYB_PRIZN(pFD_DATA1,pFD_DATA2,t(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    HTMLText := '<TR><TD class=user>Выбыло за период</TD>';
    FOR j IN 1..tv.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_VYB_VID(pFD_DATA1,pFD_DATA2,tv(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'<TD><B>'|| PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_VYB(pFD_DATA1,pFD_DATA2) ) ||'</B></TD>';
    FOR j IN 1..t.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_VYB_PRIZN(pFD_DATA1,pFD_DATA2,t(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);

    HTMLText := '<TR><TD class=user>Состоит на конец периода</TD>';
    FOR j IN 1..tv.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_MORNING_VID(pFD_DATA2+1,tv(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'<TD><B>'|| PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_MORNING(pFD_DATA2+1) ) ||'</B></TD>';
    FOR j IN 1..t.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_MORNING_PRIZN(pFD_DATA2+1,t(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    HTMLText := '<TR><TD class=user>Проведено койко-дней</TD>';
    FOR j IN 1..tv.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( GET_KDN_PERIOD_VID(pFD_DATA1,pFD_DATA2,tv(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'<TD><B>'|| PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_KDNFUNC.GET_KDN(pFD_DATA1,pFD_DATA2) ) ||'</B></TD>';
    FOR j IN 1..t.COUNT LOOP
      HTMLText := HTMLText||'<TD>'||PKG_R_ALLFUNC.RETURN_VALUE( GET_KDN_PERIOD_PRIZN(pFD_DATA1,pFD_DATA2,t(j)) ) ||'</TD>';
    END LOOP;
    HTMLText := HTMLText||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    HTMLText := '</TABLE><BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(HTMLText),HTMLText);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


