DROP PACKAGE BODY ASU.PKG_R_VSTRECHA
/

--
-- PKG_R_VSTRECHA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_VSTRECHA" 
 is-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rVstrecha.dpr
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    CURSOR cKarta IS
      SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, TKARTA.FK_ID, TKARTA.FC_FAM
        FROM TKARTA
       WHERE FP_TEK_COC = 1
         AND pFD_DATA between TRUNC(GET_PACPLANINCOME(FK_ID)) and GET_PACPLANOUTCOME(FK_ID)
--         AND pFD_DATA = (select TRUNC(FD_DATA1) from tsroky where fk_pacid = TKARTA.FK_ID)
         AND FL_DOR <> 1
    ORDER BY FC_FIO;
    CURSOR cTepid (pFK_PACID NUMBER) IS
      SELECT fk_id,fd_prib,fk_pacid,fp_tran,fc_from,fk_reis,fc_vagon
        FROM TEPID
       WHERE FK_PACID = pFK_PACID;
  BEGIN
    PROGRESS_BAR.SETSTROUT ('Формирование отчета...');
    PROGRESS_BAR.STEPIT;
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Данные по запланированным заездам для встречающего по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" на '||TO_CHAR(pFD_DATA,'hh24:mi dd.mm.yyyy'),
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str := '<BODY><DIV class=user><P ALIGN="CENTER"><B>Данные по запланированным заездам для встречающего<BR>по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" на ' || TO_CHAR (pFD_DATA, 'dd.mm.yyyy') || '</B></P><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str := '<table>'||
           '<TR>'||
           '<TD><B>Ф.И.О.:</B></TD>'||
           '<TD><B>Прибытие:</B></TD>'||
           '<TD><B>Вид транспорта:</B></TD>'||
           '<TD><B>№ рейса:</B></TD>'||
           '<TD><B>№ вагона:</B></TD>'||
           '<TD><B>Дополнительно:</B></TD>'||
           '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR p IN cKARTA LOOP
      PROGRESS_BAR.SETSTROUT ('Работаем с '||p.FC_FIO);
      PROGRESS_BAR.STEPIT;
      str := '<TR><TD class=user>'||p.FC_FIO||'</TD>';
      FOR p1 IN cTEPID(p.FK_ID) LOOP
        str := str || '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( TO_CHAR (p1.fd_prib, 'dd.mm.yyyy hh24:mi')) || '</TD>'||
                      '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( GET_TRANSPORT(p1.fp_tran)) || '</TD>'||
                      '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( p1.fk_reis) || '</TD>'||
                      '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( p1.fc_vagon) || '</TD>'||
                      '<TD>' || p1.fc_from || '</TD>';
      END LOOP;
      str := str || '</TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    PROGRESS_BAR.SETSTROUT ('Почти все готово...');
    PROGRESS_BAR.STEPIT;
    str  := '</TABLE><BR><P><B>Отчет составил_________________________' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_VSTRECHA;
/

SHOW ERRORS;


