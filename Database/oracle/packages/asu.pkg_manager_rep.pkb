DROP PACKAGE BODY ASU.PKG_MANAGER_REP
/

--
-- PKG_MANAGER_REP  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_MANAGER_REP
IS

/*
   History
   29-01-2008 - Modified by A.Nakorjakov - добавил функцию get_nazlist_table с
                                           параметрами pStartDate, pIsUseStartDate.
                                           Изменил исходную функцию get_nazlist_table (с одним параметром) - вставил вызов новой функии
                                           с тремя параметрами
   18-07-2008 - Modified by A.Nakorjakov - get_priemlist - теперь и для инструментальных исследований тоже
   23-07-2008 - Modified by A.Nakorjakov - get_nazlist_table - добавил параметр по умолчанию pSotrID - сотрудник, запустивший отчет
   02-12-2010 - Modified by A.Neronov    - get_nazlist_table - изменил курсор cMainMED, добавил фильтр по синонимам
                                           добавлен параметр pProcCab в обе эти функции, который показывает, выводить или нет определенные медикаменты
*/

  FUNCTION get_nazlist_table(pPACID IN NUMBER, pStartDate IN DATE, pIsUseStartDate IN NUMBER,
  pSotrID IN NUMBER DEFAULT NULL, pProcCab IN NUMBER DEFAULT 0)
  /*Added by A.Nakorjakov 29-01-2008
    pPACID - ИД паца
    pStartDate - дата, начиная с которой нумеруются столбцы дат выполнения
    pIsUseStartDate - показывать даты в названии столбцов
  */
  RETURN NUMBER
   IS-- Used in NazList.dpr
    CURSOR cTopLine is select distinct trunc(fd_run) fd_run from asu.vnaz where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID order by fd_run; -- group by  fd_run;
    CURSOR cMinDate is select min(fd_run) fd_run from asu.vnaz where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID; -- group by  fd_run;
    CURSOR cMaxDate is select max(fd_run) fd_run from asu.vnaz where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID; -- group by  fd_run;
    CURSOR cMaxDateRes is select max(r.fd_ins) fd_ins from asu.vres r, asu.vnaz n where n.fk_pacid = pPACID AND n.fk_id = r.fk_nazid AND n.fk_nazsosid IN (2, 4, 89); -- group by  fd_run;
    CURSOR cMainREZHIM is select distinct fk_smid ,get_fullpath_sha(fk_smid)||':'||pkg_naz.get_nazparam(fk_id) pname, '' room
                            from asu.tnazlech where /*fk_nazsosid IN (2, 4) AND*/ fk_pacid=pPACID and fk_smid=asu.get_synid('PROC_REZHIM');
    CURSOR cMainDIETA is select distinct fk_smid ,get_fullpath_sha(fk_smid)||':'||pkg_naz.get_nazparam(fk_id) pname, '' room
                            from asu.tnazlech where /*fk_nazsosid IN (2, 4) AND*/ fk_pacid=pPACID and fk_smid=asu.get_synid('PROC_DIET');
    CURSOR cMainPROC is select distinct fk_smid ,get_fullpath_sha(fk_smid) pname,decode(pos('_',get_kabname(fk_roomid)),0,get_kabname(fk_roomid), substr(get_kabname(fk_roomid),1,pos('_',get_kabname(fk_roomid))-1)) room
                            from asu.tnazlech where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID and fk_smid not in (get_synid('PROC_REZHIM'),asu.get_synid('PROC_DIET'));
    CURSOR cMainKONS is select distinct fk_smid ,asu.get_fullpath_sha(fk_smid) pname,'' room
                            from asu.tnazKONS where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID
                                          and fk_smid in (select fk_id from tsmid connect by prior fk_id=fk_owner start with fk_id=get_synid('KONS_SPEC'));
    CURSOR cMainISLED is select distinct fk_smid ,asu.get_fullpath_sha(fk_smid) pname,'' room
                            from asu.tnazIS where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID;
    CURSOR cMainANAL is select distinct fk_smid ,asu.get_fullpath_sha(fk_smid) pname,'' room
                            from asu.tnazAN where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID;
    CURSOR cMainMED is SELECT fk_id,
                              --pkg_medicnazn.get_naz_fullname(tnazmed.fk_id) pname,
                              replace(replace(replace(asu.pkg_medicnazn.get_naz_fullname(tnazmed.fk_id, 0, 0, 0, 1), 'Путь введения: '), 'Длительность:'), ' , ', ', ') pname,
                              '' room
                            FROM asu.tnazmed
                           WHERE fk_state IN (2, 4, 89)
                             AND fk_pacid = pPACID
                             AND not exists (select 1 from asu.tnazmedlech l, asu.tchemotherapy_items ci where l.fk_id = ci.fk_nazmedlech and l.fk_nazmedid = tnazmed.fk_id)
                            

/*                                                  --Added by Neronov A.S.
                                           and ( (tnazmed.fk_vvodpathid in
                                                      (select fk_id from tvvodpath where fc_synonim in ('VNUTRIMISHECHNO', 'VNUTRIVENNO_KAP', 'VNUTRIVENNO_STRUINO'))
                                                  and pProcCab = 1
                                                 )
                                                or
                                                 (tnazmed.fk_vvodpathid not in
                                                      (select fk_id from tvvodpath where fc_synonim in ('VNUTRIMISHECHNO', 'VNUTRIVENNO_KAP', 'VNUTRIVENNO_STRUINO'))
                                                  and pProcCab = 0
                                                 )
                                               ); --Added by Neronov A.S.
*/                                               
-- Изменил условие отбора Slusarenko M.D.   07.08.2012    (192.168.1.9/redmine/issues/19711)
          and (
               ((pProcCab = 1) and (tnazmed.fk_vvodpathid in (select fk_id from tvvodpath where fl_proccab = 1)))
               or
               ((pProcCab = 0) and (tnazmed.fk_vvodpathid in (select fk_id from tvvodpath where fl_proccab in (0, 1))))
              );
-- Изменил условие отбора Slusarenko M.D.   07.08.2012    (192.168.1.9/redmine/issues/19711)


    CURSOR cMainMEDChemotherapy is
       SELECT fk_id,
              replace(replace(replace(asu.pkg_medicnazn.get_naz_fullname(tnazmed.fk_id, 0, 0, 0, 1), 'Путь введения: '), 'Длительность:'), ' , ', ', ') pname,
              '' room
         FROM asu.tnazmed
        WHERE fk_state IN (2, 4, 89)
          AND fk_pacid = pPACID
          AND exists (select 1 from asu.tnazmedlech l, asu.tchemotherapy_items ci where l.fk_id = ci.fk_nazmedlech and l.fk_nazmedid = tnazmed.fk_id)
          and (
               ((pProcCab = 1) and (tnazmed.fk_vvodpathid in (select fk_id from tvvodpath where fl_proccab = 1)))
               or
               ((pProcCab = 0) and (tnazmed.fk_vvodpathid in (select fk_id from tvvodpath where fl_proccab in (0, 1))))
              );



    CURSOR cMainMEDTabletki is
      SELECT fk_id,
             --pkg_medicnazn.get_naz_fullname(tnazmed.fk_id) pname,
             replace(replace(replace(asu.pkg_medicnazn.get_naz_fullname(tnazmed.fk_id, 0, 0, 0, 1), 'Путь введения: '), 'Длительность:'), ' , ', ', ') pname,
             '' room
        FROM asu.tnazmed
       WHERE fk_state IN (2, 4, 89)
         and fk_pacid = pPACID
         AND not exists (select 1 from asu.tnazmedlech l, asu.tchemotherapy_items ci where l.fk_id = ci.fk_nazmedlech and l.fk_nazmedid = tnazmed.fk_id)
         and (tnazmed.fk_vvodpathid in (select fk_id from tvvodpath where fc_synonim = 'PERORALNO'));


    CURSOR cMainMEDTabletkiChemotherapy is
      SELECT fk_id,
             --pkg_medicnazn.get_naz_fullname(tnazmed.fk_id) pname,
             replace(replace(replace(asu.pkg_medicnazn.get_naz_fullname(tnazmed.fk_id, 0, 0, 0, 1), 'Путь введения: '), 'Длительность:'), ' , ', ', ') pname,
             '' room
        FROM asu.tnazmed
       WHERE fk_state IN (2, 4, 89)
         and fk_pacid = pPACID
         AND exists (select 1 from asu.tnazmedlech l, asu.tchemotherapy_items ci where l.fk_id = ci.fk_nazmedlech and l.fk_nazmedid = tnazmed.fk_id)
         and (tnazmed.fk_vvodpathid in (select fk_id from tvvodpath where fc_synonim = 'PERORALNO'));
         
         
    CURSOR cMainIsHaveChemotherapy is
       SELECT count(fk_id) AS cnt
         FROM asu.tnazmed
        WHERE fk_state IN (2, 4, 89)
          AND fk_pacid = pPACID
          AND exists (select 1 from asu.tnazmedlech l, asu.tchemotherapy_items ci where l.fk_id = ci.fk_nazmedlech and l.fk_nazmedid = tnazmed.fk_id)
          and (
               ((pProcCab = 1) and (tnazmed.fk_vvodpathid in (select fk_id from tvvodpath where fl_proccab = 1)))
               or
               ((pProcCab = 0) and (tnazmed.fk_vvodpathid in (select fk_id from tvvodpath where fl_proccab in (0, 1))))
               or
               ((pProcCab = 2) and (tnazmed.fk_vvodpathid in (select fk_id from tvvodpath where fc_synonim = 'PERORALNO')) )
              );
    
         
         
         

    CURSOR cNazMedLabel(aNazmedID IN NUMBER, aCurDate IN DATE) IS
    SELECT COUNT(*)
    FROM (SELECT  trunc(N.FD_BEGIN + (CASE WHEN N.fn_mnog > 1 THEN (LEVEL - 1) ELSE (LEVEL - 1) * (1 / N.fn_mnog) END),'mi') as FD_NAZ_DATE
            FROM (SELECT N.*, F.FN_MNOG FROM asu.tnazmed N, ASU.TFREQUENCY  F
                   WHERE N.FK_FREQUENCYID = F.fk_id
                     AND N.FK_ID = aNazmedID
                     AND F.FN_MNOG > 0) N
          CONNECT BY LEVEL-1 < N.Fn_Duration
          UNION
          -- Продления
          SELECT  trunc(N.FD_BEGIN + (CASE WHEN N.fn_mnog > 1 THEN (LEVEL - 1) ELSE (LEVEL - 1) * (1 / N.fn_mnog) END),'mi') as FD_NAZ_DATE
            FROM (SELECT P.FD_BEGIN, P.FN_DURATION, F.FN_MNOG FROM asu.tnazmed N, asu.tnazmed_prolong P, ASU.TFREQUENCY  F
                   WHERE N.FK_FREQUENCYID = F.fk_id
                     AND p.fk_nazmedid = N.FK_ID
                     AND N.FK_ID = aNazmedID
                     AND F.FN_MNOG > 0) N
          CONNECT BY LEVEL-1 < N.Fn_Duration)
     WHERE FD_NAZ_DATE = aCurDate;
              
         
                                               
    CURSOR cRowsPROC(pSMID IN NUMBER) is select ptime,t1.fd_run from (select distinct(TRUNC(fd_run)) fd_run from asu.vnaz where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID) t1,(select TO_CHAR (fd_run,'HH24:MI') ptime,trunc(fd_run) fd_run from asu.tnazlech where fk_nazsosid IN (2, 23) AND fk_pacid=pPACID and fk_smid=pSMID) t2 where  t1.fd_run=t2.fd_run(+) order by t1.fd_run;
    CURSOR cRowsKONS(pSMID IN NUMBER) is select ptime,t1.fd_run from (select distinct(TRUNC(fd_run)) fd_run from asu.vnaz where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID) t1,(select TO_CHAR (fd_run,'HH24:MI') ptime,trunc(fd_run) fd_run from asu.tnazKONS where fk_nazsosid IN (2, 23) AND fk_pacid=pPACID and fk_smid=pSMID) t2 where  t1.fd_run=t2.fd_run(+) order by t1.fd_run;
    CURSOR cRowsISLED(pSMID IN NUMBER) is select ptime,t1.fd_run from (select distinct(TRUNC(fd_run)) fd_run from asu.vnaz where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID) t1,(select TO_CHAR (fd_run,'HH24:MI') ptime,trunc(fd_run) fd_run from asu.tnazIS where fk_nazsosid IN (2, 23) AND fk_pacid=pPACID and fk_smid=pSMID) t2 where  t1.fd_run=t2.fd_run(+) order by t1.fd_run;
    CURSOR cRowsANAL(pSMID IN NUMBER) is select ptime,t1.fd_run from (select distinct(TRUNC(fd_run)) fd_run from asu.vnaz where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID) t1,(select TO_CHAR (fd_run,'HH24:MI') ptime,trunc(fd_run) fd_run from asu.tnazAN where fk_nazsosid IN (2, 23) AND fk_pacid=pPACID and fk_smid=pSMID) t2 where  t1.fd_run=t2.fd_run(+) order by t1.fd_run;
    Cursor CRCountKONS(pFDRUN IN DATE,pSMID IN NUMBER) is select rownum num, TO_CHAR (fd_run,'HH24:MI') ptime from asu.tnazKONS where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID and fk_smid=pSMID and trunc(fd_run)=pFDRUN;
    Cursor CRCountPROC(pFDRUN IN DATE,pSMID IN NUMBER) is select rownum num, TO_CHAR (r.fd_ins,'HH24:MI') ptime from asu.treslech r, asu.tnazlech n where n.fk_id = r.fk_nazid AND n.fk_nazsosid IN (2, 4) AND n.fk_pacid=pPACID and r.fk_smid=pSMID and trunc(r.fd_ins)=pFDRUN;
    Cursor CRCountISLED(pFDRUN IN DATE,pSMID IN NUMBER) is select rownum num, TO_CHAR (fd_run,'HH24:MI') ptime from asu.tnazIS where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID and fk_smid=pSMID and trunc(fd_run)=pFDRUN;
    Cursor CRCountANAL(pFDRUN IN DATE,pSMID IN NUMBER) is select rownum num, TO_CHAR (fd_run,'HH24:MI') ptime from asu.tnazAN where fk_nazsosid IN (2, 4, 89) AND fk_pacid=pPACID and fk_smid=pSMID and trunc(fd_run)=pFDRUN;
    CURSOR CPac is select GET_PACFIO(pPACID) pname,
                          asu.PKG_REGIST_PACFUNC.get_pac_fullfio(pPACID) AS full_fio,
                          asu.PKG_REGIST_PACFUNC.GET_PAC_IB(pPACID) as IB,
                          to_char(asu.PKG_REGIST_PACFUNC.get_pac_age_now(pPACID)) AS age
                     from dual;
    CURSOR cpac_palata IS SELECT asu.get_pacfcpalata (pPACID) FROM DUAL;
    CURSOR cpac_vrach IS SELECT do_vrachfio (get_lechvrach (pPACID)) FROM DUAL;
    CURSOR cpac_otdel is select DO_OTDNAME(fk_otdelid) from troom where fk_id= GET_PACPALATAID(pPACID);
    CURSOR cpac_diag is --select substr(pkg_lists.get_diag_clinik(pPACID),1,450) pdiag from dual;
                      select fc_name from (
                       SELECT tsmid.fk_mkb10||' - '||
                           stat.pkg_ibxml.get_diagname (tdiag.fk_id)
                         --  || '('
                         --  || asu.get_sotrname (tdiag.fk_vrachid)
                         --  || ')'
                            fc_name,
                            1 fn_order,
                            FD_DATE
                           FROM tsmid, tdiag
                           WHERE tdiag.fk_pacid = ppacid
                           AND tdiag.fl_showib = 1
                           AND tdiag.fk_smdiagid = tsmid.fk_id/*
                           AND tdiag.fp_type = stat.pkg_statutil.get_smidid ('CLINIK')*/
                           AND tdiag.fl_main = stat.pkg_statutil.get_smidid ('MAIN')/*
                       union
                       SELECT tsmid.fk_mkb10||' - '||
                           stat.pkg_ibxml.get_diagname (tdiag.fk_id)
                          -- || '('
                          -- || asu.get_sotrname (tdiag.fk_vrachid)
                          -- || ')'
                           fc_name,
                           2 fn_order,
                           FD_DATE
                           FROM tsmid, tdiag
                           WHERE tdiag.fk_pacid = ppacid
                           AND tdiag.fl_showib = 1
                           AND tdiag.fk_smdiagid = tsmid.fk_id
                           AND tdiag.fp_type = stat.pkg_statutil.get_smidid ('PRI_POSTYPLENII')
                           AND tdiag.fl_main = stat.pkg_statutil.get_smidid ('MAIN')*/
                           )
                         order by fn_order,FD_DATE desc  ;
    CURSOR cpac_diag_amb is --select substr(pkg_lists.get_diag_clinik(pPACID),1,450) pdiag from dual;
                      select fc_name from (
                       SELECT tsmid.fk_mkb10||' - '||
                           stat.pkg_ibxml.get_diagname (tdiag.fk_id)
                         --  || '('
                         --  || asu.get_sotrname (tdiag.fk_vrachid)
                         --  || ')'
                            fc_name,
                            1 fn_order,
                            FD_DATE
                           FROM tsmid, tdiag
                           WHERE tdiag.fk_pacid = ppacid
                           AND tdiag.fl_showib = 1
                           AND tdiag.fk_smdiagid = tsmid.fk_id/*
                           AND tdiag.fp_type = stat.pkg_statutil.get_smidid ('PRI_VYPISKE')*/
                           AND tdiag.fl_main = stat.pkg_statutil.get_smidid ('MAIN')/*
                       union
                       SELECT tsmid.fk_mkb10||' - '||
                           stat.pkg_ibxml.get_diagname (tdiag.fk_id)
                          -- || '('
                          -- || asu.get_sotrname (tdiag.fk_vrachid)
                          -- || ')'
                           fc_name,
                           2 fn_order,
                           FD_DATE
                           FROM tsmid, tdiag
                           WHERE tdiag.fk_pacid = ppacid
                           AND tdiag.fl_showib = 1
                           AND tdiag.fk_smdiagid = tsmid.fk_id
                           AND tdiag.fp_type = stat.pkg_statutil.get_smidid ('NA_OSMOTRE')
                           AND tdiag.fl_main = stat.pkg_statutil.get_smidid ('MAIN')*/
                           )
                         order by fn_order,FD_DATE  desc;

    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
    SName VARCHAR2(200) :='';
    SFullName VARCHAR2(200) :='';    
    spac_palata VARCHAR2 (100)   := '';
    spac_vrach VARCHAR2 (100)   := '';
    spac_otdel VARCHAR2 (150)   := '';
    SIB VARCHAR2(20);
    sAge varchar2(3);
    sDiag VARCHAR(4000);
    nNum number;

    nDate DATE;
    nMinDate DATE;
    nMaxDate DATE;
    nIsAmbulcance Number; --Added by A.Nakorjakov 230708
    nNazMedLabel NUMBER; --Added by Neronov A.S. 07.02.2013
    
    nSBody NUMBER;
    nIsHaveChemotherapy NUMBER;
    

  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
   select count(1)
   into nIsAmbulcance
   from (SELECT K.FK_ID
          FROM TKARTA K
         WHERE K.FK_USLVIDID NOT IN
               (SELECT FK_ID
                  FROM TUSLVID
                CONNECT BY PRIOR FK_ID = FK_OWNERID
                 START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD))
           AND K.FK_ID = pPACID
        UNION ALL
        SELECT K.FK_ID FROM ASU.TAMBULANCE K WHERE K.FK_ID = pPACID);
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
--  new
    str := PKG_HTML.GET_HEAD('word','Лист назначений' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    open cPac;
    fetch CPac into sName, sFullName, sIB, sAge;
    close cPac;
    open cMinDate;
    fetch cMinDate into nMinDate;
    close cMinDate;
    open cMaxDate;
    fetch cMaxDate into nMaxDate;
    close cMaxDate;
    open cMaxDateRes;
    fetch cMaxDateRes into nDate;
    close cMaxDateRes;

    IF nDate>nmaxdate then nMaxDate:=nDate;
    END IF;

-- from old

    str :=pkg_manager_docs.get_doc_header (sname);
    DBMS_LOB.WRITE (cC,LENGTH (str),DBMS_LOB.getlength (cC)+ 1,str);
    str :=pkg_manager_docs.get_doc_styles2;
    DBMS_LOB.WRITE (cC,LENGTH (str),DBMS_LOB.getlength (cC)+ 1,str);
    str :=pkg_manager_docs.get_title_doc (sname);
    DBMS_LOB.WRITE (cC,LENGTH (str),DBMS_LOB.getlength (cC)+ 1,str);
   -- получаем отделение
    OPEN cpac_otdel ;
    FETCH cpac_otdel INTO spac_otdel;
    CLOSE cpac_otdel;
    -- получаем палату
    OPEN cpac_palata;
    FETCH cpac_palata INTO spac_palata;
    CLOSE cpac_palata;
    if nIsAmbulcance = 0 then
       open cpac_diag;
       fetch cpac_diag into sDiag;
       close cpac_diag;
    else
       open cpac_diag_amb;
       fetch cpac_diag_amb into sDiag;
       close cpac_diag_amb;
    end if;
    if nIsAmbulcance = 1 then
      str :=
          '<br> <p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>Пациент : '
         || sFullName
         || '</p>'

         ||'<p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>№ ИБ : '
         || sIB
         || '</p>'

         ||'<p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>Возраст : '
         || sAge
         || '</p>'
         ;
    else
      str :=
          '<br>'||'<TABLE><tr><td width="50%" style=''border:0 none;text-align:center''><b>ЛИСТ ВРАЧЕБНЫХ НАЗНАЧЕНИЙ</b></td><td width="50%" style=''border:0 none''>'

         ||'<p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>Отделение : '
         || spac_otdel
         || '</p>'

         ||'<p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>Пациент : '
         || sFullName
         || '</p>'

         ||'<p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>№ ИБ : '
         || sIB
         || '</p>'

         ||'<p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>Возраст : '
         || sAge
         || '</p>'

         || '<p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>Палата : '
         || spac_palata
         || '</p></td>'||'</tr></table>';
    end if;
        -- основной клинический диагноз пациента
         if sDiag is not null then
         str := str
         ||'<p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:left'
         || ''''
         || '>Диагноз : '
         || sDiag
         || '</p>';
         end if;
--         ||
--           '<p class=MsoNormal_1 align=center style='||''''||'text-align:right'||''''||'>Телефон : '||sPAC_TEL||'</p>'||
--            '<br>';
    DBMS_LOB.WRITE (cC,LENGTH (str),DBMS_LOB.getlength (cC)+ 1,str);
      str :=
            '<hr><br><div class=Section1><p class=MsoNormal align=center style='
         || ''''
         || 'text-align:center'
         || ''''
         || '>'
         || 'График прохождения консультаций и процедур</p></div><br>';
    DBMS_LOB.WRITE (cC,LENGTH (str),DBMS_LOB.getlength (cC)+ 1,str);




-- .....from old
/*

    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER"><B>Лист назначений </B></P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER"><B>'||sName||'</B></P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER"><B>'||'№ И.Б.'||sIB||'</B></P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
*/
    str:='<table CELLSPACING=0 CELLPADDING =0 >'||
         '<TR ><TD width="2%" rowspan=2><B>№ п/п</B></TD>'||
         '<TD width="28%" rowspan=2><B>Назначения</B></TD>'||
         '<TD width="5%" rowspan=2><B>Исполнение</B></TD>'||
         '<TD width="65%" colspan=15><B>Отметки о назначении и выполнении</B></TD></TR><TR>';
    nNum:=1;
    nDate:=nMinDate;

    IF pIsUseStartDate=0 THEN --Added by A.Nakorjakov 29-01-2008
        FOR i in 1..15 LOOP
              str:=str||'<TD style="font-size:10"><B>'||'     '||'</B></TD>';
               --       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
                --         Inc(nNum);
                nDate:=nDate+1;
         END LOOP;
    /*Added by A.Nakorjakov 29-01-2008
    started*/
    ELSE
        FOR i in 1..15 LOOP
              str:=str||'<TD style="font-size:11; padding:0mm 0.5mm 0mm 0.5mm;">'||
                        to_char(pStartDate-1+i,'dd.mm')||'</TD>';
         END LOOP;
    END IF;
    /*Added by A.Nakorjakov 29-01-2008
    finished*/
    str:=str||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

  -- основное тело отчета ---------------------------------------------------------------------------------
  -- РЕЖИМ ---------------------------------------------------------------------------------
-------------------------------------------------------------
-- Если pProcCab = 1 то это выводить не нужно
-- Добавил условие, Неронов А.С.
-------------------------------------------------------------
if ((pProcCab = 0) or (pProcCab = 2)) then

    nTemp:=1;
    FOR c in cMainREZHIM  LOOP
       Inc(nNum);
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
        ELSE
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left'' rowspan=2><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
         nDate:=nMinDate;

         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
         END LOOP;
       str:=str||'</TR>';
       
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
         nDate:=nMinDate;

         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;
       str:=str||'</TR>';       
       
       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;
  -- Диета ---------------------------------------------------------------------------------
    nTemp:=1;
    FOR c in cMainDIETA  LOOP
       Inc(nNum);
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
        ELSE
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left'' rowspan=2><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
         nDate:=nMinDate;

         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;
       str:=str||'</TR>';
       
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
         nDate:=nMinDate;

         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;
       str:=str||'</TR>';       
       
       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;
    
end if;


if (pProcCab = 0) then
  -- КОНСУЛЬТАЦИИ ---------------------------------------------------------------------------------
    nTemp:=1;
    FOR c in cMainKONS  LOOP
       Inc(nNum);
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left''><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
        ELSE
          str:='<TR><td style=''text-align:left''><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left''><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left''></TD>';
         nDate:=nMinDate;

         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;
       str:=str||'</TR>';

       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;


  -- ПРОЦЕДУРЫ ---------------------------------------------------------------------------------
    nTemp:=1;
    FOR c in cMainPROC  LOOP
       Inc(nNum);
--       str:='<TR><td style=''text-align:left''><B class=user>'|| c.room/*nTemp*/ ||'</B></TD>';
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
        ELSE
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left'' rowspan=2><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
         nDate:=nMinDate;

       FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';

       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';
       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;
-- Конец условия pProcCab = 1
end if;




if ((pProcCab = 0) or (pProcCab = 1)) then
  -- МЕДИКАМЕНТЫ ---------------------------------------------------------------------------------
    nTemp:=1;
    FOR c in cMainMED  LOOP
       Inc(nNum);
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
       ELSE
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left'' rowspan=2><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';

       nDate:=pStartDate;--nMinDate;
-----------------------------------
/*
       FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

*/
       FOR i in 1..15 LOOP
          nNazMedLabel := 0;
          OPEN cNazMedLabel(c.fk_id, trunc(nDate));
          FETCH cNazMedLabel INTO nNazMedLabel;
          CLOSE cNazMedLabel;

          IF nNazMedLabel > 0 THEN
             str:=str||'<td style="font-size:10;background-color:#c0c0c0">';
          ELSE
             str:=str||'<td style="font-size:10">';
          END IF;

          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;
-----------------------------------  
     
       str:=str||'</TR>';
       
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';
       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;
end if;




if (pProcCab = 2) then
  -- МЕДИКАМЕНТЫ ---------------------------------------------------------------------------------
    nTemp:=1;
    FOR c in cMainMEDTabletki  LOOP
       Inc(nNum);
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
        ELSE
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left'' rowspan=2><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';

       nDate:=pStartDate;--nMinDate;


-----------------------------------
/*
       FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

*/
       FOR i in 1..15 LOOP
          nNazMedLabel := 0;
          OPEN cNazMedLabel(c.fk_id, trunc(nDate));
          FETCH cNazMedLabel INTO nNazMedLabel;
          CLOSE cNazMedLabel;

          IF nNazMedLabel > 0 THEN
             str:=str||'<td style="font-size:10;background-color:#c0c0c0">';
          ELSE
             str:=str||'<td style="font-size:10">';
          END IF;

          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;
----------------------------------- 

       str:=str||'</TR>';
       
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';       
       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;
    
    
    -- 20 доп строк ----
    FOR i in 1..20 LOOP
       str:='<TR><td style=''text-align:left'' rowspan=2><B class=user>'|| ' ' ||'</B></TD>';
       str:=str||'<td style=''text-align:left; color:WHITE'' rowspan=2><P >'||'| '||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;
        
end if;

  

      -- 20 доп строк ----
if (pProcCab = 1) then

    FOR i in 1..20 LOOP
       str:='<TR><td style=''text-align:left'' rowspan=2><B class=user>'|| ' ' ||'</B></TD>';
       str:=str||'<td style=''text-align:left; color:WHITE'' rowspan=2><P >'||'| '||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;

end if;

       str:='<TR><td style=''text-align:left'' rowspan=2><B class=user>'|| ' ' ||'</B></TD>';
       str:=str||'<td style=''text-align:left;'' rowspan=2><B >'||'Подписи '||'</B></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      -- подпись врача ---------
   if (nIsAmbulcance > 0) and (pSotrID is not null) then
      select do_vrachfio(pSotrID) into spac_vrach from dual;
      str :=
            '</table><BR><HR><BR><p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>'
         || 'Врач ________________ '
         || spac_vrach
         || '</p>';
      DBMS_LOB.WRITE (cc,LENGTH (str),DBMS_LOB.getlength (cc)+ 1,str);
   else
    OPEN cpac_vrach;
    FETCH cpac_vrach INTO spac_vrach;
    CLOSE cpac_vrach;
    str :=
            '</table><BR><HR><BR><p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>'
         || 'Лечащий врач ________________ '
         || spac_vrach
         || '</p>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  end if;
--    DBMS_LOB.WRITE (cc,LENGTH (str),DBMS_LOB.getlength (cc)+ 1,str);
  --********************************************************************************************
  --********************************************************************************************
  -- РАЗГРАНИЧИТЕЛЬ ----------------------------------------------------------------------------
  --********************************************************************************************
  --********************************************************************************************

-------------------------------------------------------------
-- Если pProcCab = 1 то вторую таблицу выводить не нужно
-- Добавил условие, Неронов А.С.
-------------------------------------------------------------
if (pProcCab = 0) then
    str:= ' <br clear=''all'' style=''page-break-before:always''/>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    str :=
            '<br><div><p class=MsoNormal align=center style='
         || ''''
         || 'text-align:center'
         || ''''
         || '>'
         || 'График прохождения исследований</p></div><br>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table CELLSPACING=0 CELLPADDING =0 >'||
         '<TR ><TD width="2%" rowspan=2><B>№ п/п</B></TD>'||
         '<TD width="28%" rowspan=2><B>Назначения</B></TD>'||
         '<TD width="5%" rowspan=2><B>Исполнение</B></TD>'||
         '<TD width="65%" colspan=15><B>Отметки о назначении и выполнении</B></TD></TR><TR>';
    nNum:=1;
    nDate:=nMinDate;

    IF pIsUseStartDate=0 THEN --Added by A.Nakorjakov 29-01-2008
      FOR i in 1..15 LOOP
       str:=str||'<td style="font-size:10">';
       str:=str||'</TD>';
       nDate:=nDate+1;
      END LOOP;
    /*Added by A.Nakorjakov 29-01-2008
    started*/
    ELSE
      FOR i in 1..15 LOOP
           str:=str||'<TD style="font-size:11; padding:0mm 0.5mm 0mm 0.5mm;">'||
                     to_char(pStartDate-1+i,'dd.mm')||'</TD>';
      END LOOP;
    END IF;
    /*Added by A.Nakorjakov 29-01-2008
    finished*/

    /*FOR i in 1..15 LOOP
          str:=str||'<TD style="font-size:10"><B>'||'     '||'</B></TD>';
 --       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
 --         Inc(nNum);
          nDate:=nDate+1;
    END LOOP;
    */
    str:=str||'</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  -- АНАЛИЗЫ ---------------------------------------------------------------------------------
    nTemp:=1;
    FOR c in cMainANAL  LOOP
       Inc(nNum);
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
        ELSE
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left'' rowspan=2><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
         nDate:=nMinDate;

         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;

       END LOOP;

       str:=str||'</TR>';

       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;

       END LOOP;

       str:=str||'</TR>';
       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;
  -- ИССЛЕДОВАНИЯ  ---------------------------------------------------------------------------------
    nTemp:=1;
    FOR c in cMainISLED  LOOP
       inc(nNum);
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
        ELSE
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left'' rowspan=2><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
         nDate:=nMinDate;

         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';

       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';
       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;

      -- 5 доп строк ----
/*
    FOR i in 1..(12-nNum) LOOP
       str:='<TR><td style=''text-align:left'' rowspan=2><B class=user>'|| ' ' ||'</B></TD>';
       str:=str||'<td style=''text-align:left; color:WHITE'' rowspan=2><P >'||'| '||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';

         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';

       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
         FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;
*/    
       str:='<TR><td style=''text-align:left'' rowspan=2><B class=user>'|| ' ' ||'</B></TD>';
       str:=str||'<td style=''text-align:left;'' rowspan=2><B >'||'Подписи '||'</B></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       -- подпись врача
    str :=
            '</table></div><span style='
         || ''''
         || 'font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:'
         || '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA'
         || ''''
         || '>'
         || '</span></div>';
      DBMS_LOB.WRITE (cc,LENGTH (str),DBMS_LOB.getlength (cc)+ 1,str);

   if (nIsAmbulcance > 0) and (pSotrID is not null) then
      select do_vrachfio(pSotrID) into spac_vrach from dual;
      str :=
            '<BR><HR><BR><p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>'
         || 'Врач ________________ '
         || spac_vrach
         || '</p></div></body></html>';
      DBMS_LOB.WRITE (cc,LENGTH (str),DBMS_LOB.getlength (cc)+ 1,str);
   else
      OPEN cpac_vrach;
      FETCH cpac_vrach INTO spac_vrach;
      CLOSE cpac_vrach;
      str :=
            '<BR><HR><BR><p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>'
         || 'Лечащий врач ________________ '
         || spac_vrach
         || '</p></div></body></html>';
      DBMS_LOB.WRITE (cc,LENGTH (str),DBMS_LOB.getlength (cc)+ 1,str);
    end if;
-- Конец условия pProcCab = 0
end if;



---------------------------------------------------- < ХИМИОТЕРАПИЯ > ----------------------------------------------------
open  cMainIsHaveChemotherapy;
fetch cMainIsHaveChemotherapy into nIsHaveChemotherapy;
close cMainIsHaveChemotherapy;

if (nIsHaveChemotherapy > 0) then

  str:= ' <br clear=''all'' style=''page-break-before:always''/>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  str := '<br><div><p class=MsoNormal align=center style='
         || ''''
         || 'text-align:center'
         || ''''
         || '>'
         || 'Химиотерапия</p></div>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

  SELECT NVL(MAX(ROUND(SQRT(DECODE(asu.get_pacrost(pPACID), NULL, 0, asu.get_pacrost(pPACID)) * DECODE(asu.get_pacves(pPACID), NULL, 0, asu.get_pacves(pPACID)) / 3600 ), 2)), 0) AS PPT
    into nSBody
    from dual;

  str := '<div><p class=MsoNormal align=left style='
         || ''''
         || 'text-align:left'
         || ''''
         || '>'
         || 'Площадь поверхности тела: '
         || nSBody
         || ' м<sup>2</sup>'
         || '</p></div><br>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    
  str:='<table CELLSPACING=0 CELLPADDING =0 >'||
       '<TR ><TD width="2%" rowspan=2><B>№ п/п</B></TD>'||
       '<TD width="28%" rowspan=2><B>Назначения</B></TD>'||
       '<TD width="5%" rowspan=2><B>Исполнение</B></TD>'||
       '<TD width="65%" colspan=15><B>Отметки о назначении и выполнении</B></TD></TR><TR>';
  nNum:=1;
  nDate:=nMinDate;

  IF pIsUseStartDate=0 THEN --Added by A.Nakorjakov 29-01-2008
    FOR i in 1..15 LOOP
      str:=str||'<td style="font-size:10">';
      str:=str||'</TD>';
      nDate:=nDate+1;
    END LOOP;
  ELSE
    FOR i in 1..15 LOOP
      str := str || '<TD style="font-size:11; padding:0mm 0.5mm 0mm 0.5mm;">'||
                    to_char(pStartDate-1+i,'dd.mm')||'</TD>';
    END LOOP;
  END IF;
  str:=str||'</TR>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    
    
  if ((pProcCab = 0) or (pProcCab = 1)) then
    -- МЕДИКАМЕНТЫ --
    nTemp:=1;
    FOR c in cMainMEDChemotherapy  LOOP
       Inc(nNum);
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
       ELSE
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left'' rowspan=2><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';

       nDate:=pStartDate;--nMinDate;
-----------------------------------
       FOR i in 1..15 LOOP
          nNazMedLabel := 0;
          OPEN cNazMedLabel(c.fk_id, trunc(nDate));
          FETCH cNazMedLabel INTO nNazMedLabel;
          CLOSE cNazMedLabel;

          IF nNazMedLabel > 0 THEN
             str:=str||'<td style="font-size:10;background-color:#c0c0c0">';
          ELSE
             str:=str||'<td style="font-size:10">';
          END IF;

          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;
-----------------------------------  
       str:=str||'</TR>';
       
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';
       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;
  end if;



  if (pProcCab = 2) then
    -- МЕДИКАМЕНТЫ --
    nTemp:=1;
    FOR c in cMainMEDTabletkiChemotherapy  LOOP
       Inc(nNum);
       IF length(c.room)<6 then
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*nTemp*/ ||'</P></TD>';
        ELSE
          str:='<TR><td style=''text-align:left'' rowspan=2><P class=user>'|| ' '/*substr(c.room,1,5) nTemp*/ ||'</P></TD>';
       END IF;
       str:=str||'<td style=''text-align:left'' rowspan=2><P >'|| c.pname ||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';

       nDate:=pStartDate;--nMinDate;
-----------------------------------
       FOR i in 1..15 LOOP
          nNazMedLabel := 0;
          OPEN cNazMedLabel(c.fk_id, trunc(nDate));
          FETCH cNazMedLabel INTO nNazMedLabel;
          CLOSE cNazMedLabel;

          IF nNazMedLabel > 0 THEN
             str:=str||'<td style="font-size:10;background-color:#c0c0c0">';
          ELSE
             str:=str||'<td style="font-size:10">';
          END IF;

          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;
----------------------------------- 
       str:=str||'</TR>';
       
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
          str:=str||'<td style="font-size:10">';
          str:=str||'</TD>';
          nDate:=nDate+1;
       END LOOP;

       str:=str||'</TR>';       
       str:=REPLACE(str,'00:00','??:??');
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
       Inc(nTemp);
    END LOOP;
    
    
    -- 20 доп строк ----
    FOR i in 1..20 LOOP
       str:='<TR><td style=''text-align:left'' rowspan=2><B class=user>'|| ' ' ||'</B></TD>';
       str:=str||'<td style=''text-align:left; color:WHITE'' rowspan=2><P >'||'| '||'</P></TD>';
       str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
       FOR i in 1..15 LOOP
         str:=str||'<td><P class=user>'||' '||'</P></TD>';
       END LOOP;
       str:=str||'</TR>';
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;

  end if;    

  str:='<TR><td style=''text-align:left'' rowspan=2><B class=user>'|| ' ' ||'</B></TD>';
  str:=str||'<td style=''text-align:left;'' rowspan=2><B >'||'Подписи '||'</B></TD>';
  str:=str||'<td style=''text-align:left'' style="font-size:12">Врач</TD>';
  FOR i in 1..15 LOOP
     str:=str||'<td><P class=user>'||' '||'</P></TD>';
  END LOOP;
  str:=str||'</TR>';
  str:=str||'<TR><td style=''text-align:left'' style="font-size:12">Сестра</TD>';
  FOR i in 1..15 LOOP
     str:=str||'<td><P class=user>'||' '||'</P></TD>';
  END LOOP;
  str:=str||'</TR>';
  DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  -- подпись врача ---------
  if (nIsAmbulcance > 0) and (pSotrID is not null) then
     select do_vrachfio(pSotrID) into spac_vrach from dual;
     str := '</table><BR><HR><BR><p class=MsoNormal_1 align=center style='
            || ''''
            || 'text-align:right'
            || ''''
            || '>'
            || 'Врач ________________ '
            || spac_vrach
            || '</p>';
     DBMS_LOB.WRITE (cc,LENGTH (str),DBMS_LOB.getlength (cc)+ 1,str);
  else
    OPEN cpac_vrach;
    FETCH cpac_vrach INTO spac_vrach;
    CLOSE cpac_vrach;
    str := '</table><BR><HR><BR><p class=MsoNormal_1 align=center style='
           || ''''
           || 'text-align:right'
           || ''''
           || '>'
           || 'Лечащий врач ________________ '
           || spac_vrach
           || '</p>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  end if;
end if;
---------------------------------------------------- </ ХИМИОТЕРАПИЯ > ----------------------------------------------------



    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;


  FUNCTION get_nazlist_table(pPACID IN NUMBER, pSotrID IN NUMBER DEFAULT NULL, pProcCab IN NUMBER DEFAULT 0)
  RETURN NUMBER
   IS-- Used in NazList.dpr
  BEGIN
    RETURN get_nazlist_table(pPACID, sysdate, 0,pSotrID, pProcCab);
  END;

/*

  ======================================================================================
  =============================== график приемов =======================================
  ======================================================================================
*/

/*
 ======================================================================================
  =============================== график приемов =======================================
  ======================================================================================
*/
FUNCTION get_priemlist(pVRACHID IN NUMBER,date1 IN DATE,date2 IN DATE, pFK_KABINETID in number)
  RETURN NUMBER
   IS --
 /* CURSOR cNaz IS SELECT fd_naz, to_char(fd_run,'hh24:mi') chdate,to_char(fd_run,'dd.mm.yyyy') cddate, trunc(fd_run) cdate ,get_pacfio(fk_pacid) sname from tnazkons where fd_run between date1 and date2
                        and fk_ispolid=pVRACHID;
*/
 /* CURSOR cNaz IS SELECT to_char(tnazkons.fd_run,'hh24:mi') chdate,
                        to_char(tnazkons.fd_run,'dd.mm.yyyy') cddate,
                        trunc(tnazkons.fd_run) cdate ,
                        get_pacfio(max(tnazkons.fk_pacid)) sname,
                        tambulance.fd_rojd projd,
                        pkg_regist_pacfunc.GET_PAC_ADRSHORT(max(fk_pacid)) padr
                 from tnazkons,tambulance
                 where  tambulance.fk_id=tnazkons.fk_pacid
                        and tnazkons.fd_run between date1 and date2
                        and tnazkons.fk_ispolid=pVRACHID
                        GROUP BY TRUNC (tnazkons.fd_run),TO_CHAR (tnazkons.fd_run, 'dd.mm.yyyy'),TO_CHAR (tnazkons.fd_run, 'hh24:mi')--, get_pacfio (fk_pacid)
                        order by cdate;*/
/* CURSOR cNaz IS select chdate,cddate,cdate,max(projd) projd,get_pacfio(max(fk_pacid)) sname,
                       pkg_regist_pacfunc.GET_PAC_ADRSHORT(max(fk_pacid)) padr
                    from (SELECT to_char(tnazkons.fd_run,'hh24:mi') chdate,
                        to_char(tnazkons.fd_run,'dd.mm.yyyy') cddate,
                        trunc(tnazkons.fd_run) cdate ,
                        tnazkons.fk_pacid,
                        to_char(tambulance.fd_rojd,'dd.mm.yyyy') projd
                 from tnazkons,tambulance
                 where  tambulance.fk_id=tnazkons.fk_pacid
                        and tnazkons.fd_run between date1 and date2
                        and tnazkons.fk_ispolid=pVRACHID) tt
                        GROUP BY cdate,cddate,chdate
                        order by cdate; */
CURSOR cNaz IS
     /*commented by A.Nakorjakov 180708
     SELECT
           chdate,
           cddate,
           cdate,
           MAX (projd) projd,
           get_pacfio (MAX (fk_pacid)) sname,
           pkg_regist_pacfunc.get_pac_adrshort (MAX (fk_pacid)) padr
      FROM (SELECT --TO_CHAR (tnazkons.fd_run, 'hh24:mi') chdate,
                   --TO_CHAR (tnazkons.fd_run, 'dd.mm.yyyy') cddate,
                   --TRUNC (tnazkons.fd_run) cdate, tnazkons.fk_pacid,
                   TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazkons.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd
              FROM tnazkons, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazkons.fk_pacid
               AND tp.nazid = tnazkons.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               --AND tnazkons.fd_run BETWEEN date1 AND date2
               AND tnazkons.fk_ispolid = pvrachid) tt
      GROUP BY cdate, cddate, chdate
      ORDER BY cdate,Timedate*/

      /*Added by A.Nakorjakov 180708*/
      SELECT
           chdate,
           cddate,
           cdate,
           MAX (projd) projd,
           --get_pacfio (MAX (fk_pacid)) sname,
           pkg_regist_pacfunc.GET_PAC_FULLFIO(MAX (fk_pacid)) sname,
           --pkg_regist_pacfunc.get_pac_adrshort (MAX (fk_pacid)) padr,
           pkg_regist_pacfunc.get_pac_adrfull (MAX (fk_pacid)) padr, -- Смотрим адрес из КЛАДРа Неронов А.С. 26.04.2011
           (select p.fc_phone from asu.tpeoples p where p.fk_id = fk_peplid) fc_phone
      FROM (SELECT TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazkons.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd,
                   tambulance.fk_peplid
              FROM tnazkons, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazkons.fk_pacid
               AND tp.nazid = tnazkons.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               AND tnazkons.fk_ispolid = pvrachid
               and Tnazkons.FK_ROOMID = pFK_KABINETID
             UNION ALL
             SELECT TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazis.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd,
                   tambulance.fk_peplid
              FROM tnazis, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazis.fk_pacid
               AND tp.nazid = tnazis.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               AND tnazis.fk_ispolid = pvrachid
               and Tnazis.FK_ROOMID = pFK_KABINETID) tt
      GROUP BY cdate, cddate, chdate,Timedate,fk_peplid
      ORDER BY cdate,Timedate;


  CURSOR cVrach IS SELECT do_vrachfio(fk_sotrid) vname, get_kabname(pfk_kabinetid) sname from tnazvrach where fk_sotrid=pVRACHID;

  nC    NUMBER;
  nDate DATE;
  cC    CLOB;
  str   VARCHAR2(32767);
  nTmp  NUMBER;
  sVrach VARCHAR2(512);
  sNaz VARCHAR2(512);
  sAdr VARCHAR2(120);
begin


    nDate:=sysdate;
    nTmp:=0;
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','График приемов' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    open cVrach;
    fetch cVrach into sVrach, sNaz;
    close cVrach;
    str :=
            '<hr><br><div class=Section1><B class=MsoNormal align=center style='
         || ''''
         || 'text-align:center'
         || ''''
         || '>'
         ||sVrach||'   Прием '|| sNaz ||'</B></div><br>';

    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table CELLSPACING=0 CELLPADDING =0 >'||
         '<TR ><TD width="20"><B>№</B></TD>'||
         '<TD><B>Время</B></TD>'||
         '<TD><B>Пациент</B></TD>'||
         '<TD><B>Дата рождения</B></TD>'||
         '<TD><B>Телефон</B></TD>'||
         '<TD><B>Адрес</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  --  nDate:=0;
    FOR c in cNaz  LOOP
       if nDate<>c.cdate then
          str:='<TR><td height="30" colspan="3" style=''text-align:left''>'||
                '<B class=user> График приемов на '|| c.cddate ||'</B></TD></TR>';
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          nTmp:=0;
       end if;
       nDate:=c.cdate;
       nTmp:=nTmp+1;
       str:='<TR><td style=''text-align:left''>'||
                '<P class=user >'|| nTmp ||'</P></TD>'||
                '<TD><P class=user>'|| c.chdate ||'</P></TD>'||
                '<TD><P class=user>'|| c.sname  ||'</P></TD>'||
                '<TD><P class=user>'|| c.projd  ||'</P></TD>'||
                '<TD><P class=user>'|| c.fc_phone  ||'</P></TD>'||
                '<td><P class=user>'|| c.padr   ||'</P></TD></TR>';
       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ ХАНТЫ-МАНСИЙСК ',null);
       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ',null);
       str:=replace(str,'ХАНТЫ-МАНСИЙСКИЙ АО ХАНТЫ-МАНСИЙСК',null);

       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;
    str :=
            '</table></div><span style='
         || ''''
         || 'font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:'
         || '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA'
         || ''''
         || '>'
         || '</span></div>';
    return nC;
end;









FUNCTION get_priemlist_prev(pVRACHID IN NUMBER,date1 IN DATE,date2 IN DATE, pFK_SMID in number)
  RETURN NUMBER
   IS --
 /* CURSOR cNaz IS SELECT fd_naz, to_char(fd_run,'hh24:mi') chdate,to_char(fd_run,'dd.mm.yyyy') cddate, trunc(fd_run) cdate ,get_pacfio(fk_pacid) sname from tnazkons where fd_run between date1 and date2
                        and fk_ispolid=pVRACHID;
*/
 /* CURSOR cNaz IS SELECT to_char(tnazkons.fd_run,'hh24:mi') chdate,
                        to_char(tnazkons.fd_run,'dd.mm.yyyy') cddate,
                        trunc(tnazkons.fd_run) cdate ,
                        get_pacfio(max(tnazkons.fk_pacid)) sname,
                        tambulance.fd_rojd projd,
                        pkg_regist_pacfunc.GET_PAC_ADRSHORT(max(fk_pacid)) padr
                 from tnazkons,tambulance
                 where  tambulance.fk_id=tnazkons.fk_pacid
                        and tnazkons.fd_run between date1 and date2
                        and tnazkons.fk_ispolid=pVRACHID
                        GROUP BY TRUNC (tnazkons.fd_run),TO_CHAR (tnazkons.fd_run, 'dd.mm.yyyy'),TO_CHAR (tnazkons.fd_run, 'hh24:mi')--, get_pacfio (fk_pacid)
                        order by cdate;*/
/* CURSOR cNaz IS select chdate,cddate,cdate,max(projd) projd,get_pacfio(max(fk_pacid)) sname,
                       pkg_regist_pacfunc.GET_PAC_ADRSHORT(max(fk_pacid)) padr
                    from (SELECT to_char(tnazkons.fd_run,'hh24:mi') chdate,
                        to_char(tnazkons.fd_run,'dd.mm.yyyy') cddate,
                        trunc(tnazkons.fd_run) cdate ,
                        tnazkons.fk_pacid,
                        to_char(tambulance.fd_rojd,'dd.mm.yyyy') projd
                 from tnazkons,tambulance
                 where  tambulance.fk_id=tnazkons.fk_pacid
                        and tnazkons.fd_run between date1 and date2
                        and tnazkons.fk_ispolid=pVRACHID) tt
                        GROUP BY cdate,cddate,chdate
                        order by cdate; */
CURSOR cNaz IS
     /*commented by A.Nakorjakov 180708
     SELECT
           chdate,
           cddate,
           cdate,
           MAX (projd) projd,
           get_pacfio (MAX (fk_pacid)) sname,
           pkg_regist_pacfunc.get_pac_adrshort (MAX (fk_pacid)) padr
      FROM (SELECT --TO_CHAR (tnazkons.fd_run, 'hh24:mi') chdate,
                   --TO_CHAR (tnazkons.fd_run, 'dd.mm.yyyy') cddate,
                   --TRUNC (tnazkons.fd_run) cdate, tnazkons.fk_pacid,
                   TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazkons.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd
              FROM tnazkons, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazkons.fk_pacid
               AND tp.nazid = tnazkons.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               --AND tnazkons.fd_run BETWEEN date1 AND date2
               AND tnazkons.fk_ispolid = pvrachid) tt
      GROUP BY cdate, cddate, chdate
      ORDER BY cdate,Timedate*/

      /*Added by A.Nakorjakov 180708*/
      SELECT
           chdate,
           cddate,
           cdate,
           MAX (projd) projd,
           --get_pacfio (MAX (fk_pacid)) sname,
           pkg_regist_pacfunc.GET_PAC_FULLFIO(MAX (fk_pacid)) sname,
           --pkg_regist_pacfunc.get_pac_adrshort (MAX (fk_pacid)) padr,
           pkg_regist_pacfunc.get_pac_adrfull (MAX (fk_pacid)) padr, -- Смотрим адрес из КЛАДРа Неронов А.С. 26.04.2011
           (select p.fc_phone from asu.tpeoples p where p.fk_id = fk_peplid) fc_phone
      FROM (SELECT TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazkons.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd,
                   tambulance.fk_peplid
              FROM tnazkons, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazkons.fk_pacid
               AND tp.nazid = tnazkons.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               AND tnazkons.fk_ispolid = pvrachid
               and Tnazkons.FK_SMID = pFK_SMID
             UNION ALL
             SELECT TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazis.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd,
                   tambulance.fk_peplid
              FROM tnazis, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazis.fk_pacid
               AND tp.nazid = tnazis.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               AND tnazis.fk_ispolid = pvrachid
               and Tnazis.FK_SMID = pFK_SMID) tt
      GROUP BY cdate, cddate, chdate,Timedate,fk_peplid
      ORDER BY cdate,Timedate;


  CURSOR cVrach IS SELECT do_vrachfio(fk_sotrid) vname, get_smidname(pfk_smid) sname from tnazvrach where fk_sotrid=pVRACHID;

  nC    NUMBER;
  nDate DATE;
  cC    CLOB;
  str   VARCHAR2(32767);
  nTmp  NUMBER;
  sVrach VARCHAR2(4000);
  sNaz VARCHAR2(4000);
  sAdr VARCHAR2(1200);
begin


    nDate:=sysdate;
    nTmp:=0;
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','График приемов' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    open cVrach;
    fetch cVrach into sVrach, sNaz;
    close cVrach;
    str :=
            '<hr><br><div class=Section1><B class=MsoNormal align=center style='
         || ''''
         || 'text-align:center'
         || ''''
         || '>'
         ||sVrach||'   Прием '|| sNaz ||'</B></div><br>';

    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table CELLSPACING=0 CELLPADDING =0 >'||
         '<TR ><TD width="20"><B>№</B></TD>'||
         '<TD><B>Время</B></TD>'||
         '<TD><B>Пациент</B></TD>'||
         '<TD><B>Дата рождения</B></TD>'||
         '<TD><B>Телефон</B></TD>'||
         '<TD><B>Адрес</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  --  nDate:=0;
    FOR c in cNaz  LOOP
       if nDate<>c.cdate then
          str:='<TR><td height="30" colspan="3" style=''text-align:left''>'||
                '<B class=user> График приемов на '|| c.cddate ||'</B></TD></TR>';
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          nTmp:=0;
       end if;
       nDate:=c.cdate;
       nTmp:=nTmp+1;
       str:='<TR><td style=''text-align:left''>'||
                '<P class=user >'|| nTmp ||'</P></TD>'||
                '<TD><P class=user>'|| c.chdate ||'</P></TD>'||
                '<TD><P class=user>'|| c.sname  ||'</P></TD>'||
                '<TD><P class=user>'|| c.projd  ||'</P></TD>'||
                '<TD><P class=user>'|| c.fc_phone  ||'</P></TD>'||
                '<td><P class=user>'|| c.padr   ||'</P></TD></TR>';
       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ ХАНТЫ-МАНСИЙСК ',null);
       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ',null);
       str:=replace(str,'ХАНТЫ-МАНСИЙСКИЙ АО ХАНТЫ-МАНСИЙСК',null);

       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;
    str :=
            '</table></div><span style='
         || ''''
         || 'font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:'
         || '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA'
         || ''''
         || '>'
         || '</span></div>';
    return nC;
end;



FUNCTION get_priemlist_old(pVRACHID IN NUMBER,date1 IN DATE,date2 IN DATE)
  RETURN NUMBER
   IS --
 /* CURSOR cNaz IS SELECT fd_naz, to_char(fd_run,'hh24:mi') chdate,to_char(fd_run,'dd.mm.yyyy') cddate, trunc(fd_run) cdate ,get_pacfio(fk_pacid) sname from tnazkons where fd_run between date1 and date2
                        and fk_ispolid=pVRACHID;
*/
 /* CURSOR cNaz IS SELECT to_char(tnazkons.fd_run,'hh24:mi') chdate,
                        to_char(tnazkons.fd_run,'dd.mm.yyyy') cddate,
                        trunc(tnazkons.fd_run) cdate ,
                        get_pacfio(max(tnazkons.fk_pacid)) sname,
                        tambulance.fd_rojd projd,
                        pkg_regist_pacfunc.GET_PAC_ADRSHORT(max(fk_pacid)) padr
                 from tnazkons,tambulance
                 where  tambulance.fk_id=tnazkons.fk_pacid
                        and tnazkons.fd_run between date1 and date2
                        and tnazkons.fk_ispolid=pVRACHID
                        GROUP BY TRUNC (tnazkons.fd_run),TO_CHAR (tnazkons.fd_run, 'dd.mm.yyyy'),TO_CHAR (tnazkons.fd_run, 'hh24:mi')--, get_pacfio (fk_pacid)
                        order by cdate;*/
/* CURSOR cNaz IS select chdate,cddate,cdate,max(projd) projd,get_pacfio(max(fk_pacid)) sname,
                       pkg_regist_pacfunc.GET_PAC_ADRSHORT(max(fk_pacid)) padr
                    from (SELECT to_char(tnazkons.fd_run,'hh24:mi') chdate,
                        to_char(tnazkons.fd_run,'dd.mm.yyyy') cddate,
                        trunc(tnazkons.fd_run) cdate ,
                        tnazkons.fk_pacid,
                        to_char(tambulance.fd_rojd,'dd.mm.yyyy') projd
                 from tnazkons,tambulance
                 where  tambulance.fk_id=tnazkons.fk_pacid
                        and tnazkons.fd_run between date1 and date2
                        and tnazkons.fk_ispolid=pVRACHID) tt
                        GROUP BY cdate,cddate,chdate
                        order by cdate; */
CURSOR cNaz IS
     /*commented by A.Nakorjakov 180708
     SELECT
           chdate,
           cddate,
           cdate,
           MAX (projd) projd,
           get_pacfio (MAX (fk_pacid)) sname,
           pkg_regist_pacfunc.get_pac_adrshort (MAX (fk_pacid)) padr
      FROM (SELECT --TO_CHAR (tnazkons.fd_run, 'hh24:mi') chdate,
                   --TO_CHAR (tnazkons.fd_run, 'dd.mm.yyyy') cddate,
                   --TRUNC (tnazkons.fd_run) cdate, tnazkons.fk_pacid,
                   TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazkons.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd
              FROM tnazkons, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazkons.fk_pacid
               AND tp.nazid = tnazkons.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               --AND tnazkons.fd_run BETWEEN date1 AND date2
               AND tnazkons.fk_ispolid = pvrachid) tt
      GROUP BY cdate, cddate, chdate
      ORDER BY cdate,Timedate*/

      /*Added by A.Nakorjakov 180708*/
      SELECT
           chdate,
           cddate,
           cdate,
           MAX (projd) projd,
           --get_pacfio (MAX (fk_pacid)) sname,
           pkg_regist_pacfunc.GET_PAC_FULLFIO(MAX (fk_pacid)) sname,
           --pkg_regist_pacfunc.get_pac_adrshort (MAX (fk_pacid)) padr,
           pkg_regist_pacfunc.get_pac_adrfull (MAX (fk_pacid)) padr, -- Смотрим адрес из КЛАДРа Неронов А.С. 26.04.2011
           (select p.fc_phone from asu.tpeoples p where p.fk_id = fk_peplid) fc_phone
      FROM (SELECT TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazkons.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd,
                   tambulance.fk_peplid
              FROM tnazkons, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazkons.fk_pacid
               AND tp.nazid = tnazkons.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               AND tnazkons.fk_ispolid = pvrachid
             UNION ALL
             SELECT TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazis.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd,
                   tambulance.fk_peplid
              FROM tnazis, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazis.fk_pacid
               AND tp.nazid = tnazis.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               AND tnazis.fk_ispolid = pvrachid) tt
      GROUP BY cdate, cddate, chdate,Timedate,fk_peplid
      ORDER BY cdate,Timedate;


  CURSOR cVrach IS SELECT do_vrachfio(fk_sotrid) vname, get_smidname(fk_smid) sname from tnazvrach where fk_sotrid=pVRACHID;

  nC    NUMBER;
  nDate DATE;
  cC    CLOB;
  str   VARCHAR2(32767);
  nTmp  NUMBER;
  sVrach VARCHAR2(40);
  sNaz VARCHAR2(40);
  sAdr VARCHAR2(120);
begin
    nDate:=sysdate;
    nTmp:=0;
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','График приемов' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    open cVrach;
    fetch cVrach into sVrach, sNaz;
    close cVrach;
    str :=
            '<hr><br><div class=Section1><B class=MsoNormal align=center style='
         || ''''
         || 'text-align:center'
         || ''''
         || '>'
         ||sVrach||'   Прием '|| sNaz ||'</B></div><br>';

    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table CELLSPACING=0 CELLPADDING =0 >'||
         '<TR ><TD width="20"><B>№</B></TD>'||
         '<TD><B>Время</B></TD>'||
         '<TD><B>Пациент</B></TD>'||
         '<TD><B>Дата рождения</B></TD>'||
         '<TD><B>Телефон</B></TD>'||
         '<TD><B>Адрес</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
  --  nDate:=0;
    FOR c in cNaz  LOOP
       if nDate<>c.cdate then
          str:='<TR><td height="30" colspan="3" style=''text-align:left''>'||
                '<B class=user> График приемов на '|| c.cddate ||'</B></TD></TR>';
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          nTmp:=0;
       end if;
       nDate:=c.cdate;
       nTmp:=nTmp+1;
       str:='<TR><td style=''text-align:left''>'||
                '<P class=user >'|| nTmp ||'</P></TD>'||
                '<TD><P class=user>'|| c.chdate ||'</P></TD>'||
                '<TD><P class=user>'|| c.sname  ||'</P></TD>'||
                '<TD><P class=user>'|| c.projd  ||'</P></TD>'||
                '<TD><P class=user>'|| c.fc_phone  ||'</P></TD>'||
                '<td><P class=user>'|| c.padr   ||'</P></TD></TR>';
       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ ХАНТЫ-МАНСИЙСК ',null);
       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ',null);
       str:=replace(str,'ХАНТЫ-МАНСИЙСКИЙ АО ХАНТЫ-МАНСИЙСК',null);

       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;
    str :=
            '</table></div><span style='
         || ''''
         || 'font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:'
         || '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA'
         || ''''
         || '>'
         || '</span></div>';
    return nC;
end;
function get_pac_primary_diag(ppacid IN NUMBER) return VARCHAR2
is
CURSOR cpac_diag is
                       SELECT tsmid.fk_mkb10||' - '||
                           stat.pkg_ibxml.get_diagname (tdiag.fk_id)
                            fc_name,
                            1 fn_order
                           FROM tsmid, tdiag
                           WHERE tdiag.fk_pacid = ppacid
                           AND tdiag.fl_showib = 1
                           AND tdiag.fk_smdiagid = tsmid.fk_id
                           AND tdiag.fp_type = stat.pkg_statutil.get_smidid ('CLINIK')
                           AND tdiag.fl_main = stat.pkg_statutil.get_smidid ('MAIN')
                       union
                       SELECT tsmid.fk_mkb10||' - '||
                           stat.pkg_ibxml.get_diagname (tdiag.fk_id)
                           fc_name,
                           2 fn_order
                           FROM tsmid, tdiag
                           WHERE tdiag.fk_pacid = ppacid
                           AND tdiag.fl_showib = 1
                           AND tdiag.fk_smdiagid = tsmid.fk_id
                           AND tdiag.fp_type = stat.pkg_statutil.get_smidid ('PRI_POSTYPLENII')
                           AND tdiag.fl_main = stat.pkg_statutil.get_smidid ('MAIN')
                          order by fn_order;
  cDiag  VARCHAR2 (700);
  cOrd NUMBER;
begin
  open cpac_diag;
  fetch cpac_diag into cDiag,cOrd;
  close cpac_diag;
  return cDiag;
end;
function get_nazoper_diag(pNAZOPERID IN NUMBER) return varchar2
is
 cursor cdiags is select do_diag(fk_diagid) fc_name from tnazoper_diag where fk_nazoperid=pNAZOPERID;
 pstr varchar2(3000);
begin
  for c1 in cdiags loop
     pstr:=pstr||c1.fc_name||chr(13);
  end loop;
  return pstr;
end;




FUNCTION get_priemlist_okb(pVRACHID IN NUMBER,date1 IN DATE,date2 IN DATE, ppFK_KABINETID in number)
  RETURN NUMBER
   IS --
 
CURSOR cNaz(pFK_KABINETID in number) IS
 
      /*Added by A.Nakorjakov 180708*/
      SELECT
           chdate,
           cddate,
           cdate,
           MAX (projd) projd,
           --get_pacfio (MAX (fk_pacid)) sname,
           pkg_regist_pacfunc.GET_PAC_FULLFIO(MAX (fk_pacid)) sname,
           --pkg_regist_pacfunc.get_pac_adrshort (MAX (fk_pacid)) padr,
           pkg_regist_pacfunc.get_pac_adrfull (MAX (fk_pacid)) padr, -- Смотрим адрес из КЛАДРа Неронов А.С. 26.04.2011
           (select p.fc_phone from asu.tpeoples p where p.fk_id = fk_peplid) fc_phone
      FROM (SELECT TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazkons.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd,
                   tambulance.fk_peplid
              FROM tnazkons, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazkons.fk_pacid
               AND tp.nazid = tnazkons.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               AND tnazkons.fk_ispolid = pvrachid
               and Tnazkons.FK_ROOMID = pFK_KABINETID
             UNION ALL
             SELECT TG.Ft_Hour||':'||TG.Ft_Min as  chdate,
                   TO_DATE(TG.Ft_Hour||':'||TG.Ft_Min,'HH24:MI') as  Timedate,
                   TO_CHAR (TG.Fd_Date, 'dd.mm.yyyy') cddate,
                   TRUNC (TG.Fd_Date) cdate,
                   tnazis.fk_pacid,
                   TO_CHAR (tambulance.fd_rojd, 'dd.mm.yyyy') projd,
                   tambulance.fk_peplid
              FROM tnazis, tambulance, tpaclst tp, tgraph tg
             WHERE tambulance.fk_id = tnazis.fk_pacid
               AND tp.nazid = tnazis.fk_id
               AND tg.fk_id = tp.fk_graphid
               AND TRUNC (tg.fd_date) BETWEEN date1 AND date2
               AND tnazis.fk_ispolid = pvrachid
               and Tnazis.FK_ROOMID = pFK_KABINETID) tt
      GROUP BY cdate, cddate, chdate,Timedate,fk_peplid
      ORDER BY cdate,Timedate;


  CURSOR cVrach(pFK_KABINETID in number) IS SELECT do_vrachfio(fk_sotrid) vname, get_kabname(pfk_kabinetid) sname from tnazvrach where fk_sotrid=pVRACHID;
  
  
  Cursor cAllKabinet is 
   select Tvrachkab.Fk_Kabinetid  as N  from ASu.Tvrachkab where FK_SOTRID = pVRACHID;
   
  Cursor cKabinet is 
   select ppFK_KABINETID as N from DUAL; 
   

  nC    NUMBER;
  nDate DATE;
  cC    CLOB;
  str   VARCHAR2(32767);
  nTmp  NUMBER;
  sVrach VARCHAR2(512);
  sNaz VARCHAR2(512);
  sAdr VARCHAR2(120);
begin


    nDate:=sysdate;
    nTmp:=0;
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','График приемов' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    --str := '';
    
    if  ppFK_KABINETID > 0 then 
      for cKab in cKabinet loop
                    open cVrach(cKab.n);
                    fetch cVrach into sVrach, sNaz;
                    close cVrach;
                    str :=
                            '<hr><br><div class=Section1><B class=MsoNormal align=center style='
                         || ''''
                         || 'text-align:center'
                         || ''''
                         || '>'
                         ||sVrach||'   Прием '|| sNaz ||'</B></div><br>';

                    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

                    str:='<table CELLSPACING=0 CELLPADDING =0 >'||
                         '<TR ><TD width="20"><B>№</B></TD>'||
                         '<TD><B>Время</B></TD>'||
                         '<TD><B>Пациент</B></TD>'||
                         '<TD><B>Дата рождения</B></TD>'||
                         '<TD><B>Телефон</B></TD>'||
                         '<TD><B>Адрес</B></TD></TR>';
                    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
                  --  nDate:=0;
                    FOR c in cNaz(cKab.n)  LOOP
                       if nDate<>c.cdate then
                          str:='<TR><td height="30" colspan="3" style=''text-align:left''>'||
                                '<B class=user> График приемов на '|| c.cddate ||'</B></TD></TR>';
                          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
                          nTmp:=0;
                       end if;
                       nDate:=c.cdate;
                       nTmp:=nTmp+1;
                       str:='<TR><td style=''text-align:left''>'||
                                '<P class=user >'|| nTmp ||'</P></TD>'||
                                '<TD><P class=user>'|| c.chdate ||'</P></TD>'||
                                '<TD><P class=user>'|| c.sname  ||'</P></TD>'||
                                '<TD><P class=user>'|| c.projd  ||'</P></TD>'||
                                '<TD><P class=user>'|| c.fc_phone  ||'</P></TD>'||
                                '<td><P class=user>'|| c.padr   ||'</P></TD></TR>';
                       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ ХАНТЫ-МАНСИЙСК ',null);
                       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ',null);
                       str:=replace(str,'ХАНТЫ-МАНСИЙСКИЙ АО ХАНТЫ-МАНСИЙСК',null);

                       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
                    END LOOP;
                    str :=
                            '</table></div><span style='
                         || ''''
                         || 'font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:'
                         || '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA'
                         || ''''
                         || '>'
                         || '</span></div>';
                    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);                              
      end loop;
    else
     for cKab in cAllKabinet loop
                    open cVrach(cKAb.n);
                    fetch cVrach into sVrach, sNaz;
                    close cVrach;
                    str :=
                            '<hr><br><div class=Section1><B class=MsoNormal align=center style='
                         || ''''
                         || 'text-align:center'
                         || ''''
                         || '>'
                         ||sVrach||'   Прием '|| sNaz ||'</B></div><br>';

                    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

                    str:='<table CELLSPACING=0 CELLPADDING =0 >'||
                         '<TR ><TD width="20"><B>№</B></TD>'||
                         '<TD><B>Время</B></TD>'||
                         '<TD><B>Пациент</B></TD>'||
                         '<TD><B>Дата рождения</B></TD>'||
                         '<TD><B>Телефон</B></TD>'||
                         '<TD><B>Адрес</B></TD></TR>';
                    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
                  --  nDate:=0;
                    FOR c in cNaz(cKAb.n)  LOOP
                       if nDate<>c.cdate then
                          str:='<TR><td height="30" colspan="3" style=''text-align:left''>'||
                                '<B class=user> График приемов на '|| c.cddate ||'</B></TD></TR>';
                          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
                          nTmp:=0;
                       end if;
                       nDate:=c.cdate;
                       nTmp:=nTmp+1;
                       str:='<TR><td style=''text-align:left''>'||
                                '<P class=user >'|| nTmp ||'</P></TD>'||
                                '<TD><P class=user>'|| c.chdate ||'</P></TD>'||
                                '<TD><P class=user>'|| c.sname  ||'</P></TD>'||
                                '<TD><P class=user>'|| c.projd  ||'</P></TD>'||
                                '<TD><P class=user>'|| c.fc_phone  ||'</P></TD>'||
                                '<td><P class=user>'|| c.padr   ||'</P></TD></TR>';
                       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ ХАНТЫ-МАНСИЙСК ',null);
                       str:=replace(str,'РОССИЙСКАЯ ФЕДЕРАЦИЯ',null);
                       str:=replace(str,'ХАНТЫ-МАНСИЙСКИЙ АО ХАНТЫ-МАНСИЙСК',null);

                       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
                    END LOOP;
                    str :=
                            '</table></div><span style='
                         || ''''
                         || 'font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:'
                         || '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA'
                         || ''''
                         || '>'
                         || '</span></div>';
                   DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);      
      end loop;
    end if;                      
     str :='</html>';     
     DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);          
    return nC;
end;


END;
/

SHOW ERRORS;


