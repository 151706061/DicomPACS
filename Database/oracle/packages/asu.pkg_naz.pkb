DROP PACKAGE BODY ASU.PKG_NAZ
/

--
-- PKG_NAZ  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_NAZ"
IS
/*
  Roman M. Mikita      26.10.2000    Create
*/
   PROCEDURE do_insert_tnazan (
      psmid        IN       NUMBER,
      pdrun        IN       DATE,
      pkabinetid   IN       NUMBER,
      pvrachid     IN       NUMBER,
      pispolid     IN       NUMBER,
      pnazsosid    IN       NUMBER,
      ppacid       IN       NUMBER,
      pplat        IN       NUMBER,
      ptype        IN       VARCHAR2,
      pfk_id       IN OUT   NUMBER,
      pfl_ins      IN       NUMBER
   )
   IS
   BEGIN
      INSERT INTO tnazan (
                     fk_smid,
                     fd_naz,
                     fd_run,
                     fk_roomid,
                     fk_vrachid,
                     fk_ispolid,
                     fk_nazsosid,
                     fk_pacid,
                     fl_plat,
                     fc_type,
                     fl_ins
                  )
           VALUES (
              psmid,
              SYSDATE,
              pdrun,
              pkabinetid,
              pvrachid,
              pispolid,
              pnazsosid,
              ppacid,
              pplat,
              ptype,
              pfl_ins
           )
        RETURNING fk_id INTO pfk_id;
   END;

   PROCEDURE do_insert_tnazis (
      psmid        IN       NUMBER,
      pdrun        IN       DATE,
      pkabinetid   IN       NUMBER,
      pvrachid     IN       NUMBER,
      pispolid     IN       NUMBER,
      pnazsosid    IN       NUMBER,
      ppacid       IN       NUMBER,
      pplat        IN       NUMBER,
      ptype        IN       VARCHAR2,
      pfk_id       IN OUT   NUMBER,
      pfl_ins      IN       NUMBER
   )
   IS
   BEGIN
      INSERT INTO tnazis (
                     fk_smid,
                     fd_naz,
                     fd_run,
                     fk_roomid,
                     fk_vrachid,
                     fk_ispolid,
                     fk_nazsosid,
                     fk_pacid,
                     fl_plat,
                     fc_type,
                     fl_ins
                  )
           VALUES (
              psmid,
              SYSDATE,
              pdrun,
              pkabinetid,
              pvrachid,
              pispolid,
              pnazsosid,
              ppacid,
              pplat,
              ptype,
              pfl_ins
           )
        RETURNING fk_id INTO pfk_id;
   END;

   PROCEDURE do_insert_tnazkons (
      psmid        IN       NUMBER,
      pdrun        IN       DATE,
      pkabinetid   IN       NUMBER,
      pvrachid     IN       NUMBER,
      pispolid     IN       NUMBER,
      pnazsosid    IN       NUMBER,
      ppacid       IN       NUMBER,
      pplat        IN       NUMBER,
      ptype        IN       VARCHAR2,
      pfk_id       IN OUT   NUMBER,
      pfl_ins      IN       NUMBER
   )
   IS
   BEGIN
      INSERT INTO tnazkons (
                     fk_smid,
                     fd_naz,
                     fd_run,
                     fk_roomid,
                     fk_vrachid,
                     fk_ispolid,
                     fk_nazsosid,
                     fk_pacid,
                     fl_plat,
                     fc_type,
                     fl_ins
                  )
           VALUES (
              psmid,
              SYSDATE,
              pdrun,
              pkabinetid,
              pvrachid,
              pispolid,
              pnazsosid,
              ppacid,
              pplat,
              ptype,
              pfl_ins
           )
        RETURNING fk_id INTO pfk_id;
   END;

   PROCEDURE do_insert_tnazlech (
      psmid        IN       NUMBER,
      pdrun        IN       DATE,
      pkabinetid   IN       NUMBER,
      pvrachid     IN       NUMBER,
      pispolid     IN       NUMBER,
      pnazsosid    IN       NUMBER,
      ppacid       IN       NUMBER,
      pplat        IN       NUMBER,
      ptype        IN       VARCHAR2,
      pfk_id       IN OUT   NUMBER,
      pfl_ins      IN       NUMBER
   )
   IS
   BEGIN
      INSERT INTO tnazlech (
                     fk_smid,
                     fd_naz,
                     fd_run,
                     fk_roomid,
                     fk_vrachid,
                     fk_ispolid,
                     fk_nazsosid,
                     fk_pacid,
                     fl_plat,
                     fc_type,
                     fl_ins
                  )
           VALUES (
              psmid,
              SYSDATE,
              pdrun,
              pkabinetid,
              pvrachid,
              pispolid,
              pnazsosid,
              ppacid,
              pplat,
              ptype,
              pfl_ins
           )
        RETURNING fk_id INTO pfk_id;
   END;

   FUNCTION do_checkdaynaz (
      npacid        IN   NUMBER,
      nsmid         IN   NUMBER,
      nfk_graphid   IN   NUMBER
      )
      RETURN NUMBER
   AS
      npeople     NUMBER := 0.0;
      ntime       NUMBER := 0.0;
      npaclstid   NUMBER := 0.0;
      ddate       DATE;
      nnazcount   NUMBER := 0.0;
      nmin        NUMBER := 0.0;
      nhour       NUMBER := 0.0;
      tmpnhour    NUMBER := 0.0;
      tmpnmin     NUMBER := 0.0;
      nlhour      NUMBER := 0.0;
      nlmin       NUMBER := 0.0;
      nltime      NUMBER := 0.0;
      nlsmid      NUMBER := 0.0;

      CURSOR cgraph (pid IN NUMBER)
      IS
         SELECT TO_NUMBER (ft_hour),
                TO_NUMBER (ft_min),
                fk_paclstid,
                fd_date,
                get_nazcount (nfk_graphid)
           FROM tgraph
          WHERE tgraph.fk_id = pid;

      CURSOR csmid (pid IN NUMBER)
      IS
         SELECT TO_NUMBER (fc_time), fn_people
           FROM tsmid
          WHERE fk_id = pid;

      CURSOR cdata (pac NUMBER, pdate DATE)
      IS
         SELECT TO_NUMBER (tgraph.ft_hour),
                TO_NUMBER (tgraph.ft_min),
                tnazvrach.fk_smid
           FROM tgraph, tpaclst, traspis, tnazvrach
          WHERE tgraph.fk_paclstid = tpaclst.fk_graphid
            AND tgraph.fk_raspid = traspis.fk_graphid
            AND traspis.fk_nazvrachid = tnazvrach.fk_id
            AND tpaclst.fk_pacid = pac
            AND tgraph.fd_date = pdate;
   BEGIN
      OPEN cgraph (nfk_graphid);
      FETCH cgraph INTO nhour, nmin, npaclstid, ddate, nnazcount;
      CLOSE cgraph;
      OPEN csmid (nsmid);
      FETCH csmid INTO ntime, npeople;
      CLOSE csmid;

      IF nnazcount = npeople
      THEN
         RETURN 1;
      END IF;

      OPEN cdata (npacid, ddate);

      LOOP
         FETCH cdata INTO tmpnhour, tmpnmin, nlsmid;
         EXIT WHEN cdata%NOTFOUND;

         IF     (tmpnhour = nhour)
            AND (tmpnmin = nmin)
         THEN
            RETURN 1;
         END IF;

         nlhour := tmpnhour;
         SELECT   /*+rule*/TO_NUMBER (fc_time)
           INTO nltime
           FROM tsmid
          WHERE fk_id = nlsmid;
         nlmin := tmpnmin + nltime;

         LOOP
            EXIT WHEN nlmin < 60;
            nlhour := nlhour + 1;
            nlmin := nlmin - 60;
         END LOOP;

         IF     (nlhour = nhour)
            AND (nlmin = nmin)
         THEN
            RETURN 1;
         ELSE
            RETURN 0;
         END IF;
      END LOOP;

      RETURN 0;
      CLOSE cdata;
   END;

   FUNCTION get_kabname (fk_kabid IN NUMBER)
      RETURN VARCHAR2
   IS
      CURSOR c1 (pid NUMBER)
      IS
         SELECT fc_name
           FROM tkabinet
          WHERE fk_id = pid;

      kab   VARCHAR2(50) := '';
   BEGIN
      OPEN c1 (fk_kabid);
      FETCH c1 INTO kab;

      IF c1%NOTFOUND
      THEN
         RETURN 'Не назначено';
      ELSE
         RETURN kab;
      END IF;
   END;

   FUNCTION get_nazcancel
      RETURN NUMBER
   IS
   BEGIN
      RETURN 23;
   END;

   FUNCTION get_nazcount (nfk_id IN NUMBER)
      RETURN NUMBER
   IS
      CURSOR graph (pid NUMBER)
      IS
         SELECT fk_paclstid
           FROM tgraph
          WHERE fk_id = pid;

      CURSOR ccount (pid NUMBER)
      IS
         SELECT COUNT (fk_pacid)
           FROM tpaclst
          WHERE fk_graphid = pid;

      ncount        NUMBER := 0.0;
      nfk_graphid   NUMBER := 0.0;
   BEGIN
      OPEN graph (nfk_id);
      FETCH graph INTO nfk_graphid;
      CLOSE graph;
      OPEN ccount (nfk_graphid);
      FETCH ccount INTO ncount;
      CLOSE ccount;
      RETURN ncount;
   END;

   FUNCTION get_nazcount_proc (nfk_id IN NUMBER)
      RETURN NUMBER
   IS
      ncount   NUMBER := 0.0;
      nid      NUMBER := 0.0;
      procid   NUMBER := 0.0;
      smid     NUMBER := 0.0;

      CURSOR cnazsmid (pid NUMBER)
      IS
         SELECT fk_smid
           FROM vnaz
          WHERE fk_id = pid;

      CURSOR c1 (pid NUMBER)
      IS
         SELECT fk_id
           FROM tsmid
          START WITH fk_id = pid
          CONNECT BY PRIOR fk_owner = fk_id
          ORDER BY ROWNUM desc;

      CURSOR c2
      IS
         SELECT get_procid
           FROM dual;

      CURSOR c3 (pid NUMBER)
      IS
         SELECT COUNT (fk_id)
           FROM treslech
          WHERE fk_nazid = pid;
   BEGIN
      OPEN cnazsmid (nfk_id);
      FETCH cnazsmid INTO smid;
      CLOSE cnazsmid;
      OPEN c1 (smid);
      FETCH c1 INTO nid;
      CLOSE c1;
      OPEN c2;
      FETCH c2 INTO procid;
      CLOSE c2;

      IF nid = procid
      THEN
         OPEN c3 (nfk_id);
         FETCH c3 INTO ncount;
         CLOSE c3;

         IF ncount = 0
         THEN
            ncount := 1;
         END IF;
      ELSE
         ncount := 1;
      END IF;

      RETURN ncount;
   END;

   FUNCTION get_nazdone (pfk_id IN NUMBER)
      RETURN NUMBER
   IS
      CURSOR ccount (pid NUMBER)
      IS
         SELECT COUNT (fk_id)
           FROM treslech
          WHERE fk_nazid = pid;

      kolvo   NUMBER := 0.0;
   BEGIN
      OPEN ccount (pfk_id);
      FETCH ccount INTO kolvo;
      CLOSE ccount;
      RETURN kolvo;
   END;

   FUNCTION get_nazprice (pfk_id IN NUMBER)
      RETURN NUMBER
   IS
      price   NUMBER;
      pacid   NUMBER := 0.0;
      smid    NUMBER := 0.0;
   BEGIN
      SELECT   /*+rule*/fk_pacid, fk_smid
        INTO pacid, smid
        FROM vnaz
       WHERE fk_id = pfk_id;
      SELECT   /*+rule*/fn_price
        INTO price
        FROM tnazprice
       WHERE fk_nazid = pfk_id
         AND fk_pacid = pacid
         AND fk_smid = smid;
      RETURN price;
   END;

   FUNCTION get_nazsos (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      CURSOR ctemp(pID NUMBER)
      IS
         SELECT fc_name
           FROM tnazsos
          WHERE fk_id = pID;

      ntemp   VARCHAR2(15);
   BEGIN
      OPEN ctemp(pfk_id);
      FETCH ctemp INTO ntemp;
      CLOSE ctemp;
      RETURN ntemp;
   END;

   FUNCTION get_pacsex (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      ntemp   NUMBER;

      CURSOR ctemp(pID NUMBER)
      IS
         SELECT fp_sex
           FROM tkarta
          WHERE fk_id = pID;
   BEGIN
      OPEN ctemp(pfk_id);
      FETCH ctemp INTO ntemp;
      CLOSE ctemp;

      IF ntemp = 0
      THEN
         RETURN 'Женский';
      ELSIF ntemp = 1
      THEN
         RETURN 'Мужской';
      END IF;
   END;

   FUNCTION get_yesno (boolval IN NUMBER)
      RETURN VARCHAR2
   IS
   BEGIN
      IF boolval <> 0
      THEN
         RETURN 'Да';
      ELSE
         RETURN 'Нет';
      END IF;
   END;

   PROCEDURE delprocformnaz (pfk_id IN NUMBER)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      DELETE tnazlech
       WHERE fk_id = pfk_id;
      COMMIT;
   END;

   FUNCTION buildresheader
      RETURN VARCHAR2
   IS
      str   VARCHAR2(2000) := '';
   BEGIN
      str := str || '<html>';
      str := str || '<head>';
      str := str ||
             '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">';
      str := str || '<title>Заключения специалиста</title>';
      str := str || '</head>';
      str := str || '<body lang=RU style=''tab-interval:35.4pt''>';
      str := str ||
             '<h2 align=center style=''text-align:center''>Окружная клиническая больница<BR>Ханты-Мансийского автономного округа<BR>хирургическое отделение №1</h2>';
      RETURN str;
   END;

   FUNCTION buildresend
      RETURN VARCHAR2
   IS
      str   VARCHAR2(2000) := '';
   BEGIN
      str := '</BODY></HTML>';
      RETURN str;
   END;

   FUNCTION get_nazresult (pfk_id IN NUMBER)
      RETURN NUMBER
   IS
      str      VARCHAR2(4000) := '';
      psmid    NUMBER         := 0.0;
      pispol   NUMBER         := 0.0;
      ppacid   NUMBER         := 0.0;
      nres     NUMBER         := 0.0;
      c        CLOB;
      sDiag    VARCHAR2(32767);--by TimurLan
      CURSOR c2 (pid NUMBER)
      IS
         SELECT   fk_smid, fk_ispolid, fk_pacid
           FROM vnaz
          WHERE fk_id = pid;
   BEGIN
      OPEN c2 (pfk_id);
      FETCH c2 INTO psmid, pispol, ppacid;

      IF c2%NOTFOUND
      THEN
         RETURN 0;
      END IF;

      sDiag   := do_diagbytype(ppacid, 4, 1, pfk_id, 1) || ' ' ||--by TimurLan
                 do_diagbytype(ppacid, 4, 0, pfk_id, 1);
      IF TRIM(sDiag) is not null THEN
        sDiag := '<p class=MsoNormal style=' ||
             '''' ||
             'font-size:10.0pt;' ||
             ' mso-bidi-font-size:10.0pt' ||
             ''''||
             '>Диагноз:<br>' || sDiag ||'</p>';
      END IF;--by TimurLan

      CLOSE c2;
      DELETE
        FROM tclobs
       WHERE fk_id = (SELECT   /*+rule*/fk_blobid
                        FROM vres
                       WHERE fk_nazid = pfk_id
                         AND fl_zakl = 1);
      INSERT INTO tclobs (fk_id, fc_clob)
           VALUES (-1, EMPTY_CLOB ())
        RETURNING fk_id INTO nres;
      SELECT   /*+rule*/fc_clob
        INTO c
        FROM tclobs
       WHERE fk_id = nres
         FOR UPDATE;
      str := pkg_naz.buildresheader;

      IF str IS NOT NULL
      THEN
         dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      END IF;

      str := pkg_naz.get_smidheader (psmid);

      IF str IS NOT NULL
      THEN
         dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      END IF;

      str := pkg_naz.get_pacinfo (ppacid);

      IF str IS NOT NULL
      THEN
         dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      END IF;

--  str:=PKG_NAZ.GET_ZAKLHEADER;
  str:=null;
  IF str IS NOT NULL THEN
    DBMS_LOB.WRITE (c, LENGTH (str), DBMS_LOB.GETLENGTH (c) + 1, str);
  END IF;
      str := pkg_naz.get_zakl (pfk_id);

      IF str IS NOT NULL
      THEN
         dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      END IF;

      IF TRIM(sDiag) IS NOT NULL--by TimurLan
      THEN
         dbms_lob.write (c, LENGTH (sDiag), dbms_lob.getlength (c) + 1, sDiag);
      END IF;--by TimurLan

      str := pkg_naz.get_podpis (pispol);

      IF str IS NOT NULL
      THEN
         dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      END IF;

      str := pkg_naz.buildresend;

      IF str IS NOT NULL
      THEN
         dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      END IF;

--  DBMS_LOB.CLOSE(c);
      COMMIT;
      RETURN nres;
   END;
-------------------------------------------------
   function get_naznametree(psmid in number, psmedit in number) return varchar2 is
     str VARCHAR2(4000) := '';     
   begin
     
     select replace(replace(asu.string_agg(replace(fc_name, ',', '|')), ',', ' '), '|', ',')
       into str
       from (select fk_id, fk_owner, fc_name, fc_synonim
               from asu.tsmid
              start with fk_id = psmid
            connect by fk_id = prior fk_owner
            )
      where ( ((level > 1) and (psmid <> psmedit)) or ((level > 0) and (psmid = psmedit)) )
      start with fk_id = psmedit
     connect by prior fk_id = fk_owner;   
     
     return str;
   end;
-------------------------------------------------
   FUNCTION get_nazparam (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      str       VARCHAR2(4000) := '';
      tmp1      VARCHAR2(4000) := '';
      tmp2      VARCHAR2(4000) := '';
      ptype     VARCHAR2(100)  := '';
      csmid     VARCHAR2(4000) := '';
      nsmedit   NUMBER         := 0.0;
      nsmid     number         := 0.0;
      ssmedit   VARCHAR2(100)  := '';
      sed       VARCHAR2(50)   := '';
      flp       NUMBER         := 0.0;

      CURSOR c1 (pid NUMBER)
      IS
         SELECT /*+RULE*/ tsmid.fl_showprint,tib.fn_num fn_num,
                tib.fc_char fc_char,
                tsmid.fc_name fc_name,
                tsmid.fc_type,
                tib.fk_smeditid,
                tsmid.fc_ed_izm,
                tib.fk_smid
           FROM tib, tsmid tsmid, tsmid ts1, tsmid ts2
          WHERE fk_pacid = pid
            AND tsmid.fk_id = tib.fk_smid
            and ts1.fk_id=tib.fk_smeditid
            and ts2.fk_id=ts1.fk_owner
            and ts2.fp_inout =1
--            and (select ts2.fp_inout from tsmid ts2 where ts2.fk_id=ts1.fk_owner)=1  -- AND TSMID.FL_SHOWPRINT=1
          ORDER BY tib.fk_id;


      CURSOR c2 (pid NUMBER)
      IS
         SELECT /*+rule*/decode(fl_showprint,1,fc_name,'')
           FROM tsmid
          WHERE fk_id = pid;


      CURSOR cnazsmid(pID NUMBER)
      IS
         SELECT fk_smid
           FROM tnazlech
          WHERE fk_id = pID;

      CURSOR c3(pID NUMBER)
      IS
         SELECT /*+RULE*/ DISTINCT fc_type
           FROM tsmid, tib
          WHERE tib.fk_pacid = pID
            AND tib.fk_smid = tsmid.fk_id;

      ntmp      NUMBER;
      ctmp      VARCHAR2(100)  := '';
      nfound    NUMBER         := 0.0;
   BEGIN
      OPEN c3(pfk_id);

      LOOP
         FETCH c3 INTO ctmp;
         EXIT WHEN c3%NOTFOUND;

         IF ctmp = 'VARCHAR2'
         THEN
            nfound := 1;
            EXIT;
         END IF;
      END LOOP;

      CLOSE c3;

      /*Melnikov 2014.12.04 вынес запрос для инициализации ntmp*/
      OPEN cnazsmid(pfk_id);
      FETCH cnazsmid INTO ntmp;
      CLOSE cnazsmid;
         
      IF nfound = 1
      THEN
         RETURN get_ibrazdeltext (pfk_id, ntmp);
      ELSE
         OPEN c1 (pfk_id);

         LOOP
            FETCH c1 INTO flp, tmp1, tmp2, csmid, ptype, nsmedit, sed, nsmid;
            EXIT WHEN c1%NOTFOUND;
            IF ptype = 'NUMBER'
            THEN
               IF NOT tmp1 IS NULL
               THEN
                  str := str ||
                         ' ' ||
                         csmid ||
                         ' ' ||
                         tmp1 ||
                         ' ' ||
                         sed ||
                         ',';
               ELSE
                  OPEN c2 (nsmedit);
                  FETCH c2 INTO ssmedit;
                  str := str || ' ' || ssmedit || ' ' || csmid || ',';
                  CLOSE c2;
               END IF;
            ELSE
               IF NOT tmp2 IS NULL
               THEN
                  IF UPPER(csmid)<>('ДОПОЛНИТЕЛЬНО') and (UPPER(csmid) <> 'ШАБЛОН РЕКОМЕНДАЦИЙ') then
                    str := str || ' ' || csmid || ' ' || tmp2 || ',';
                  ELSE
                    str := str || ' ' || tmp2 || ',';
                  END IF;
               ELSE
                  OPEN c2 (nsmedit);
                  FETCH c2 INTO ssmedit;
                     if (UPPER(asu.get_smid_type(nsmedit)) = 'VARCHAR2') then
                        str := str || ' ' || ssmedit || ' ' || get_naznametree(nsmid, nsmedit) || ',';
                     else   
                        str := str || ' ' || ssmedit || ' ' || csmid || ',';
                     end if;   
                  CLOSE c2;
               END IF;
            END IF;
         END LOOP;

         CLOSE c1;
      END IF;
     if substr(str,-1,1)=',' then str:=substr(str,1,length(str)-1);
     end if;
     /*Melnikov 2014.12.04 добавил перенос строк по просьбе Поляковой*/ 
     if stat.pkg_statutil.GET_SMIDID('RECOMENDACII') = ntmp then
       str := replace(replace(replace(str,chr(10),'<br>'),chr(13),'<br>'),'<br><br>','<br>');
     end if;
      RETURN str;
   END;


   FUNCTION GET_NAZPARAM_WITHOUT_COUNT (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      str       VARCHAR2(4000) := '';
      tmp1      VARCHAR2(4000) := '';
      tmp2      VARCHAR2(4000) := '';
      ptype     VARCHAR2(100)  := '';
      csmid     VARCHAR2(4000) := '';
      nsmedit   NUMBER         := 0.0;
      nsmid     number         := 0.0;
      ssmedit   VARCHAR2(100)  := '';
      sed       VARCHAR2(50)   := '';
      flp       NUMBER         := 0.0;

      CURSOR c1 (pid NUMBER)
      IS
         SELECT /*+RULE*/ tsmid.fl_showprint,tib.fn_num fn_num,
                tib.fc_char fc_char,
                tsmid.fc_name fc_name,
                tsmid.fc_type,
                tib.fk_smeditid,
                tsmid.fc_ed_izm,
                tib.fk_smid
           FROM tib, tsmid tsmid, tsmid ts1, tsmid ts2
          WHERE fk_pacid = pid
            AND tsmid.fk_id = tib.fk_smid
            and ts1.fk_id=tib.fk_smeditid
            and ts2.fk_id=ts1.fk_owner
            and ts2.fp_inout =1
            and (tsmid.FC_SYNONIM <> 'KOL_VO' or tsmid.FC_SYNONIM IS NULL)
--            and (select ts2.fp_inout from tsmid ts2 where ts2.fk_id=ts1.fk_owner)=1  -- AND TSMID.FL_SHOWPRINT=1
          ORDER BY tib.fk_id;

      CURSOR c2 (pid NUMBER)
      IS
         SELECT /*+rule*/decode(fl_showprint,1,fc_name,'')
           FROM tsmid
          WHERE fk_id = pid;

      CURSOR cnazsmid(pID NUMBER)
      IS
         SELECT fk_smid
           FROM tnazlech
          WHERE fk_id = pID;

      CURSOR c3(pID NUMBER)
      IS
         SELECT /*+RULE*/ DISTINCT fc_type
           FROM tsmid, tib
          WHERE tib.fk_pacid = pID
            AND tib.fk_smid = tsmid.fk_id
            and (tsmid.FC_SYNONIM <> 'KOL_VO' or tsmid.FC_SYNONIM IS NULL);

      ntmp      NUMBER;
      ctmp      VARCHAR2(100)  := '';
      nfound    NUMBER         := 0.0;
   BEGIN
      OPEN c3(pfk_id);

      LOOP
         FETCH c3 INTO ctmp;
         EXIT WHEN c3%NOTFOUND;

         IF ctmp = 'VARCHAR2'
         THEN
            nfound := 1;
            EXIT;
         END IF;
      END LOOP;

      CLOSE c3;

      IF nfound = 1
      THEN
         OPEN cnazsmid(pfk_id);
         FETCH cnazsmid INTO ntmp;
         CLOSE cnazsmid;
         RETURN get_ibrazdeltext (pfk_id, ntmp);
      ELSE
         OPEN c1 (pfk_id);

         LOOP
            FETCH c1 INTO flp, tmp1, tmp2, csmid, ptype, nsmedit, sed, nsmid;
            EXIT WHEN c1%NOTFOUND;
            IF ptype = 'NUMBER'
            THEN
               IF NOT tmp1 IS NULL
               THEN
                  str := str ||
                         ' ' ||
                         csmid ||
                         ' ' ||
                         tmp1 ||
                         ' ' ||
                         sed ||
                         ',';
               ELSE
                  OPEN c2 (nsmedit);
                  FETCH c2 INTO ssmedit;
                  str := str || ' ' || ssmedit || ' ' || csmid || ',';
                  CLOSE c2;
               END IF;
            ELSE
               IF NOT tmp2 IS NULL
               THEN
                  IF UPPER(csmid)<>('ДОПОЛНИТЕЛЬНО') and (UPPER(csmid) <> 'ШАБЛОН РЕКОМЕНДАЦИЙ') then
                    str := str || ' ' || csmid || ' ' || tmp2 || ',';
                  ELSE
                    str := str || ' ' || tmp2 || ',';
                  END IF;
               ELSE
                  OPEN c2 (nsmedit);
                  FETCH c2 INTO ssmedit;
                     if (UPPER(asu.get_smid_type(nsmedit)) = 'VARCHAR2') then
                        str := str || ' ' || ssmedit || ' ' || get_naznametree(nsmid, nsmedit) || ',';
                     else   
                        str := str || ' ' || ssmedit || ' ' || csmid || ',';
                     end if;                     
                  CLOSE c2;
               END IF;
            END IF;
         END LOOP;

         CLOSE c1;
      END IF;
     if substr(str,-1,1)=',' then str:=substr(str,1,length(str)-1);
     end if;
      RETURN str;
   END;



   FUNCTION get_nazparam1 (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      str       VARCHAR2(4000) := '';
      tmp1      VARCHAR2(4000) := '';
      tmp2      VARCHAR2(4000) := '';
      ptype     VARCHAR2(100)  := '';
      csmid     VARCHAR2(4000) := '';
      nsmedit   NUMBER         := 0.0;
      nsmid     number         := 0.0;
      ssmedit   VARCHAR2(100)  := '';
      sed       VARCHAR2(50)   := '';

      CURSOR c1 (pid NUMBER)
      IS
         SELECT /*+RULE*/ tib.fn_num fn_num,
                tib.fc_char fc_char,
                decode(tsmid.fl_showprint,1,tsmid.fc_name,'') fc_name,
                tsmid.fc_type,
                tib.fk_smeditid,
                tsmid.fc_ed_izm,
                tib.fk_smid
           FROM tib, tsmid
          WHERE fk_pacid = pid
            AND tsmid.fk_id = tib.fk_smid    AND TSMID.fp_inout=0
          ORDER BY tib.fk_id;

      CURSOR c2 (pid NUMBER)
      IS
         SELECT /*+rule*/fc_name
           FROM tsmid
          WHERE fk_id = pid;

      CURSOR cnazsmid(pID NUMBER)
      IS
         SELECT fk_smid
           FROM tnazlech
          WHERE fk_id = pID;

      CURSOR c3(pID NUMBER)
      IS
         SELECT /*+RULE*/ DISTINCT fc_type
           FROM tsmid, tib
          WHERE tib.fk_pacid = pID
            AND tib.fk_smid = tsmid.fk_id;

      ntmp      NUMBER;
      ctmp      VARCHAR2(100)  := '';
      nfound    NUMBER         := 0.0;
   BEGIN
      OPEN c3(pfk_id);

      LOOP
         FETCH c3 INTO ctmp;
         EXIT WHEN c3%NOTFOUND;

         IF ctmp = 'VARCHAR2'
         THEN
            nfound := 1;
            EXIT;
         END IF;
      END LOOP;

      CLOSE c3;

      IF nfound = 1
      THEN
         OPEN cnazsmid(pfk_id);
         FETCH cnazsmid INTO ntmp;
         CLOSE cnazsmid;
         RETURN get_ibrazdeltext (pfk_id, ntmp);
      ELSE
         OPEN c1 (pfk_id);

         LOOP
            FETCH c1 INTO tmp1, tmp2, csmid, ptype, nsmedit, sed, nsmid;
            EXIT WHEN c1%NOTFOUND;

            IF ptype = 'NUMBER'
            THEN
               IF NOT tmp1 IS NULL THEN
                  str:=str||' '||csmid||' '||tmp1||' '||sed;
          --        close c1;
          --        return str;
               ELSE
                  OPEN c2 (nsmedit);
                  FETCH c2 INTO ssmedit;
                  str:=str||' '||ssmedit||' '||csmid;
                  CLOSE c2;
          --        close c1;
          --        return str;
               END IF;
            ELSE
               IF NOT tmp2 IS NULL
               THEN
                  IF UPPER(csmid)<>('ДОПОЛНИТЕЛЬНО') and (UPPER(csmid) <> 'ШАБЛОН РЕКОМЕНДАЦИЙ') then
                    str:= str||' '||csmid||' '||tmp2;
                  ELSE
                    str:=str||' '||tmp2;
                  END IF;
             --     close c1;
             --     return str;
               ELSE
                  OPEN c2 (nsmedit);
                  FETCH c2 INTO ssmedit;
                     if (UPPER(asu.get_smid_type(nsmedit)) = 'VARCHAR2') then
                        str := str || ' ' || ssmedit || ' ' || get_naznametree(nsmid, nsmedit);
                     else   
                        str := str || ' ' || ssmedit || ' ' || csmid;
                     end if;                  
                  CLOSE c2;
             --     close c1;
             --     return str;
               END IF;
            END IF;
         END LOOP;

         CLOSE c1;
      END IF;

      RETURN str;
   END;
   

   FUNCTION get_nazparam_without_enter (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      str       VARCHAR2(4000) := '';
      tmp1      VARCHAR2(4000) := '';
      tmp2      VARCHAR2(4000) := '';
      ptype     VARCHAR2(100)  := '';
      csmid     VARCHAR2(4000) := '';
      nsmedit   NUMBER         := 0.0;
      nsmid     number         := 0.0;
      ssmedit   VARCHAR2(100)  := '';
      sed       VARCHAR2(50)   := '';
      flp       NUMBER         := 0.0;

      CURSOR c1 (pid NUMBER)
      IS
         SELECT /*+RULE*/ tsmid.fl_showprint,tib.fn_num fn_num,
                tib.fc_char fc_char,
                tsmid.fc_name fc_name,
                tsmid.fc_type,
                tib.fk_smeditid,
                tsmid.fc_ed_izm,
                tib.fk_smid
           FROM tib, tsmid tsmid, tsmid ts1, tsmid ts2
          WHERE fk_pacid = pid
            AND tsmid.fk_id = tib.fk_smid
            and ts1.fk_id=tib.fk_smeditid
            and ts2.fk_id=ts1.fk_owner
            and ts2.fp_inout =1
--            and (select ts2.fp_inout from tsmid ts2 where ts2.fk_id=ts1.fk_owner)=1  -- AND TSMID.FL_SHOWPRINT=1
          ORDER BY tib.fk_id;

      CURSOR c2 (pid NUMBER)
      IS
         SELECT /*+rule*/decode(fl_showprint,1,fc_name,'')
           FROM tsmid
          WHERE fk_id = pid;

      CURSOR cnazsmid(pID NUMBER)
      IS
         SELECT fk_smid
           FROM tnazlech
          WHERE fk_id = pID;

      CURSOR c3(pID NUMBER)
      IS
         SELECT /*+RULE*/ DISTINCT fc_type
           FROM tsmid, tib
          WHERE tib.fk_pacid = pID
            AND tib.fk_smid = tsmid.fk_id;

      ntmp      NUMBER;
      ctmp      VARCHAR2(100)  := '';
      nfound    NUMBER         := 0.0;
   BEGIN
      OPEN c3(pfk_id);

      LOOP
         FETCH c3 INTO ctmp;
         EXIT WHEN c3%NOTFOUND;

         IF ctmp = 'VARCHAR2'
         THEN
            nfound := 1;
            EXIT;
         END IF;
      END LOOP;

      CLOSE c3;

      IF nfound = 1
      THEN
         OPEN cnazsmid(pfk_id);
         FETCH cnazsmid INTO ntmp;
         CLOSE cnazsmid;
         RETURN replace(replace(replace(get_ibrazdeltext (pfk_id, ntmp), chr(10)), '..', '.'), ',.', '.');
      ELSE
         OPEN c1 (pfk_id);

         LOOP
            FETCH c1 INTO flp, tmp1, tmp2, csmid, ptype, nsmedit, sed, nsmid;
            EXIT WHEN c1%NOTFOUND;
            IF ptype = 'NUMBER'
            THEN
               IF NOT tmp1 IS NULL
               THEN
                  str := str ||
                         ' ' ||
                         '<b>' || csmid || '</b>' ||
                         ' ' ||
                         tmp1 ||
                         ' ' ||
                         sed ||
                         ''; --',';
               ELSE
                  OPEN c2 (nsmedit);
                  FETCH c2 INTO ssmedit;
                  str := str || ' ' || '<b>' || ssmedit || '</b>' || ' ' || csmid || '';--',';
                  CLOSE c2;
               END IF;
            ELSE
               IF NOT tmp2 IS NULL
               THEN
                  IF UPPER(csmid)<>('ДОПОЛНИТЕЛЬНО') and (UPPER(csmid) <> 'ШАБЛОН РЕКОМЕНДАЦИЙ') then
                    str := str || ' ' || '<b>' || csmid || '</b>' || ' ' || tmp2 || '';--',';
                  ELSE
                    str := str || ' ' || replace(tmp2, chr(10), '|') || '';--',';
                  END IF;
               ELSE
                  OPEN c2 (nsmedit);
                  FETCH c2 INTO ssmedit;
                     if (UPPER(asu.get_smid_type(nsmedit)) = 'VARCHAR2') then
                        str := str || ' ' || '<b>' || ssmedit || '</b>' || ' ' || get_naznametree(nsmid, nsmedit) || '';--',';
                     else   
                        str := str || ' ' || '<b>' || ssmedit || '</b>' || ' ' || csmid || '';--',';
                     end if;                    
                  CLOSE c2;
               END IF;
            END IF;
         END LOOP;

         CLOSE c1;
      END IF;
      
     if substr(str,-1,1)=',' then
        str:=substr(str,1,length(str)-1);
     end if;
     
     str := replace(str, chr(10));
     str := replace(str, '|', ' ');
     str := replace(str, ',.', '.');
     str := replace(str, '..', '.');
     
     RETURN str;
   END;
   
   

   FUNCTION get_smidheader (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      str   VARCHAR2(4000) := '';
      tmp   VARCHAR2(256)  := '';

      CURSOR c1 (pid NUMBER)
      IS
         SELECT UPPER (get_fullestpath (pid))
           FROM dual;
   BEGIN
      IF pfk_id = 0
      THEN
         RETURN str;
      END IF;

      OPEN c1 (pfk_id);
      FETCH c1 INTO tmp;

      IF c1%NOTFOUND
      THEN
         RETURN str;
      END IF;

      CLOSE c1;
      str := str || '<p align=center style=''text-align:center''><b>';
      str := str || tmp;
      str := str || '</b></p>';
      str := str ||
             '<hr size=2 width="100%" noshade color=gray align=center>';
      RETURN str;
   END;

   FUNCTION get_pacinfo (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      str    VARCHAR2(4000) := '';
      tmp1   VARCHAR2(256)  := '';
      tmp2   VARCHAR2(256)  := '';

      CURSOR c1 (pid NUMBER)
      IS
         SELECT get_pacfio (pid), get_pacvozr (pid)
           FROM dual;
   BEGIN
      IF pfk_id = 0
      THEN
         RETURN str;
      END IF;

      OPEN c1 (pfk_id);
      FETCH c1 INTO tmp1, tmp2;

      IF c1%NOTFOUND
      THEN
         RETURN str;
      END IF;

      CLOSE c1;
      str := str ||
             '<table border=0 cellpadding=0 width="105%" style=''width:105.12%''>';
      str := str || '<tr>';
      str := str || '<td width="73%" style=''width:73.48%''>';
      str := str || '<p><b>Ф.И.О.: ';
      str := str || tmp1;
      str := str || '</b></p></td>';
      str := str || '<td width="25%" style=''width:25.62%''>';
      str := str || '<p><b>Возраст: ';
      str := str || tmp2;
      str := str || '</b></p>';
      str := str || '</td>';
      str := str || '</tr>';
      str := str || '</table>';
      str := str ||
             '<hr size=2 width="100%" noshade color=gray align=center>';
      RETURN str;
   END;

   FUNCTION get_zakl (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      str   VARCHAR2(4000);
      tmp   VARCHAR2(4000);
      dtmp  VARCHAR2(4000);

      CURSOR c1 (pid NUMBER)
      IS
         SELECT   /*+rule*/fc_res, to_char(fd_ins, 'DD.MM.YYYY')
           FROM vres
          WHERE fk_nazid = pid;
   BEGIN
      IF pfk_id = 0
      THEN
         RETURN str;
      END IF;

      OPEN c1 (pfk_id);
      FETCH c1 INTO tmp, dtmp;
      CLOSE c1;
      str := str ||
             '<p class=MsoNormal style=' ||
             '''' ||
             'text-indent:27.0pt' ||
             '''' ||
             '><span style=' ||
             '''' ||
             'font-size:10.0pt;' ||
             ' mso-bidi-font-size:10.0pt' ||
             ''''||
             '>Результат от '||dtmp||'<br>'||
             tmp||
             '</span></p>';
                        str:=replace(str, chr(10), '<BR>');
      RETURN str;
   END;

   FUNCTION get_podpis (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      str    VARCHAR(4000) := '';
      tmp1   VARCHAR(100)  := '';
      tmp2   VARCHAR(100)  := '';

      CURSOR c1 (pid NUMBER)
      IS
         SELECT TO_CHAR (SYSDATE, 'DD.MM.YYYY'), do_vrachfio (pid)
           FROM dual;
   BEGIN
      IF pfk_id = 0
      THEN
         RETURN str;
      END IF;

      OPEN c1 (pfk_id);
      FETCH c1 INTO tmp1, tmp2;

      IF c1%NOTFOUND
      THEN
         RETURN str;
      END IF;

      CLOSE c1;
      str := str ||
             '<hr size=2 width="100%" noshade color=gray align=center>';
      str := str ||
             '<table border=0 cellpadding=0 width="105%" style=''width:105.12%''>';
      str := str || '<tr>';
      str := str || '<td width="73%" style=''width:73.48%''>';
      str := str || '<p><b>';
      str := str || tmp1 || ' год.';
      str := str || '</b></p>';
      str := str || '</td>';
      str := str || '<td width="25%" style=''width:25.62%''>';
      str := str || '<p><b> Врач:<BR>';
      str := str || tmp2;
      str := str || '</b></p>';
      str := str || '</td>';
      str := str || '</tr>';
      str := str || '</table>';
      RETURN str;
   END;

   FUNCTION get_nazvrachid (psotr IN NUMBER, pkab IN NUMBER)
      RETURN NUMBER
   IS
      kod   NUMBER := 0.0;

      CURSOR c1 (p1 NUMBER, p2 NUMBER)
      IS
           select fk_id from tvrachkab
            WHERE fk_sotrid = p1
            AND fk_kabinetid = p2;

    /*     SELECT /*+RULE fk_id
    /*       FROM tnazvrach
          WHERE fk_sotrid = p1
            AND fk_kabinetid = p2
          ORDER BY fk_id desc;*/
   BEGIN
      OPEN c1 (psotr, pkab);
      FETCH c1 INTO kod;

      IF c1%NOTFOUND
      THEN
         CLOSE c1;
         RETURN 0;
      END IF;

      CLOSE c1;
      RETURN kod;
   END;

   FUNCTION get_nazresultkek (pfk_id IN NUMBER)
      RETURN NUMBER
   IS
      sdate               VARCHAR2(100);
      nnum                NUMBER;
      sglav_fio           VARCHAR2(200);
      szav_terapevt_fio   VARCHAR2(200);
      szav_bfto_fio       VARCHAR2(200);
      slech_vrach_fio     VARCHAR2(200);
      spac_fio            VARCHAR2(400);
      sdiag               VARCHAR2(1000);
      c                   CLOB;
      nres                NUMBER;
      str                 VARCHAR2(8000);

      CURSOR cdate_number(pID NUMBER)
      IS
         SELECT TO_CHAR (fd_run, 'DD.MM.YYYY'), seq_keknum.nextval
           FROM tnazkons
          WHERE fk_id = pID;

      CURSOR cglav_fio
      IS
         SELECT   /*+RULE*/INITCAP (
                   SUBSTR (fc_name, 1, 1) ||
                   '. ' ||
                   SUBSTR (fc_otch, 1, 1) ||
                   '. ' ||
                   fc_fam
                )
           FROM tsotr
          WHERE fk_id = (SELECT fk_sotrid
                           FROM tpass
                          WHERE fk_specid = get_glav_specid);

      CURSOR czavterapevt
      IS
         SELECT    INITCAP (
                   SUBSTR (fc_name, 1, 1) ||
                   '. ' ||
                   SUBSTR (fc_otch, 1, 1) ||
                   '. ' ||
                   fc_fam
                )
           FROM tsotr
          WHERE fk_id = get_zavterapevt;

      CURSOR czavbfto
      IS
         SELECT   /*+RULE*/INITCAP (
                   SUBSTR (fc_name, 1, 1) ||
                   '. ' ||
                   SUBSTR (fc_otch, 1, 1) ||
                   '. ' ||
                   fc_fam
                )
           FROM tsotr
          WHERE fk_id = get_zavbfto;

      CURSOR clech_vrach
      IS
         SELECT   /*+RULE*/INITCAP (
                   SUBSTR (fc_name, 1, 1) ||
                   '. ' ||
                   SUBSTR (fc_otch, 1, 1) ||
                   '. ' ||
                   fc_fam
                )
           FROM tsotr
          WHERE fk_id = (SELECT get_pacvrach (fk_pacid)
                           FROM tnazkons
                          WHERE fk_id = pfk_id);

      CURSOR cpac_fio
      IS
         SELECT   /*+RULE*/INITCAP (fc_fam || ' ' || fc_im || ' ' || fc_otch)
           FROM tkarta
          WHERE fk_id = (SELECT fk_pacid
                           FROM tnazkons
                          WHERE fk_id = pfk_id);

      CURSOR cdiag(pID NUMBER)
      IS
         SELECT do_diagbytype (fk_pacid, 4, 1, pfk_id, 0) ||
                ' ' ||
                do_diagbytype (fk_pacid, 4, 0, pfk_id, 0)
           FROM tnazkons
          WHERE fk_id = pID;
   BEGIN
      OPEN cdate_number(pfk_id);
      FETCH cdate_number INTO sdate, nnum;
      CLOSE cdate_number;
      OPEN cglav_fio;
      FETCH cglav_fio INTO sglav_fio;
      CLOSE cglav_fio;
      OPEN czavterapevt;
      FETCH czavterapevt INTO szav_terapevt_fio;
      CLOSE czavterapevt;
      OPEN czavbfto;
      FETCH czavbfto INTO szav_bfto_fio;
      CLOSE czavbfto;
      OPEN clech_vrach;
      FETCH clech_vrach INTO slech_vrach_fio;
      CLOSE clech_vrach;
      OPEN cpac_fio;
      FETCH cpac_fio INTO spac_fio;
      CLOSE cpac_fio;
      OPEN cdiag(pfk_id);
      FETCH cdiag INTO sdiag;
      CLOSE cdiag;
      INSERT INTO tclobs (fk_id, fc_clob)
           VALUES (-1, EMPTY_CLOB ())
        RETURNING fk_id INTO nres;
      SELECT   /*+rule*/ fc_clob
        INTO c
        FROM tclobs
       WHERE fk_id = nres
         FOR UPDATE;
      str := '<html xmlns:o="urn:schemas-microsoft-com:office:office"' ||
             'xmlns:w="urn:schemas-microsoft-com:office:word"' ||
             'xmlns="http://www.w3.org/TR/REC-html40">';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := '<head><meta http-equiv=Content-Type content="text/html; charset=windows-1251">' ||
             '<meta name=ProgId content=Word.Document>' ||
             '<meta name=Generator content="Microsoft Word 9">' ||
             '<meta name=Originator content="Microsoft Word 9">' ||
             '<link rel=File-List href="./print_kek.files/filelist.xml">' ||
             '<link rel=Edit-Time-Data href="./print_kek.files/editdata.mso">';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := ' <style>' ||
             ' <!--' ||
             ' p.MsoNormal, li.MsoNormal, div.MsoNormal' ||
             ' {mso-style-parent:"";' ||
             ' margin:0cm;' ||
             ' margin-bottom:.0001pt;' ||
             ' mso-pagination:widow-orphan;' ||
             ' font-size:12.0pt;' ||
             ' font-family:"Times New Roman";' ||
             ' mso-fareast-font-family:"Times New Roman";}' ||
             ' @page Section1' ||
             ' {size:595.3pt 841.9pt;' ||
             ' margin:2.0cm 37.3pt 2.0cm 54.0pt;' ||
             ' mso-header-margin:35.4pt;' ||
             ' mso-footer-margin:35.4pt;' ||
             ' mso-paper-source:0;}' ||
             ' div.Section1' ||
             ' {page:Section1;}' ||
             ' -->' ||
             ' </style>';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := ' </head>' ||
             ' <body lang=RU style=' ||
             '''' ||
             'tab-interval:35.4pt' ||
             '''' ||
             '>' ||
             ' <div class=Section1>' ||
             ' <p class=MsoNormal align=center style=' ||
             '''' ||
             'text-align:center' ||
             '''' ||
             '><b><span' ||
             ' style=' ||
             '''' ||
             'font-size:12.0pt;mso-bidi-font-size:12.0pt' ||
             '''' ||
             '>Заседание<span' ||
             ' style="mso-spacerun: yes">  </span>КЭК<span style="mso-spacerun: yes">' ||
             ' </span> от </span></b><b><span lang=EN-US style=' ||
             '''' ||
             'font-size:12.0pt;mso-bidi-font-size:' ||
             ' 12.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             sdate ||
             '</span></b><b><span style=' ||
             '''' ||
             'font-size:' ||
             ' 12.0pt;mso-bidi-font-size:12.0pt' ||
             '''' ||
             '> № </span></b><b><span lang=EN-US' ||
             ' style=' ||
             '''' ||
             'font-size:12.0pt;mso-bidi-font-size:12.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             ' >' ||
             nnum ||
             '</span></b><b><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></b></p>' ||
             ' <p class=MsoNormal align=center style=' ||
             '''' ||
             'text-align:center' ||
             '''' ||
             '><b><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></b></p>' ||
             ' <BR><BR>';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := ' <p class=MsoNormal style=' ||
             '''' ||
             'text-align:justify;text-indent:27.0pt' ||
             '''' ||
             '><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Комиссия в составе: Зам. главного' ||
             ' врача </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             zamsglav_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>, заведующий' ||
             ' ' ||
             ' терапевтическим' ||
             ' отделением </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             szav_terapevt_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>, заведующий' ||
             ' физиотерапевтическим' ||
             ' ' ||
             'отделением </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:' ||
             ' 10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             szav_bfto_fio ||
             ' </span><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>,' ||
             ' лечащий врач </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             slech_vrach_fio ||
             '</span><span';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>, осмотрела пациента </span><span' ||
             ' lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:' ||
             ' EN-US' ||
             '''' ||
             '>' ||
             spac_fio ||
             ',</span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt' ||
             '''' ||
             '> </span><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>' ||
             ' установила<br> Диагноз: </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;' ||
             ' mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             sdiag ||
             ' </span><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>.<o:p></o:p></span></p><BR>';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := '<p class=MsoNormal style=' ||
             '''' ||
             'text-indent:27.0pt' ||
             '''' ||
             '><span style=' ||
             '''' ||
             'font-size:10.0pt;' ||
             ' mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Заключение комиссии: ' ||
             pkg_naz.get_zakl (pfk_id) ||
             '</span></p>';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := ' <p class=MsoNormal style=' ||
             '''' ||
             'text-indent:27.0pt' ||
             '''' ||
             '>';
      str := ' <table border=0 cellspacing=0 cellpadding=0 style=' ||
             '''' ||
             'border-collapse:collapse;' ||
             ' mso-padding-alt:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <tr>' ||
             ' <td width=307 valign=top style=' ||
             '''' ||
             'width:230.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Зам. ' ||
             ' Глав врача по мед. части</span></p>' ||
             ' </td>' ||
             ' <td width=180 valign=top style=' ||
             '''' ||
             'width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' <td width=199 valign=top style=' ||
             '''' ||
             'width:149.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             zamsglav_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' </tr>';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := ' <tr>' ||
             ' <td width=307 valign=top style=' ||
             '''' ||
             'width:230.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Заведующий' ||
             ' терапевтическим отделением</span></p></td>' ||
             ' <td width=180 valign=top style=' ||
             '''' ||
             'width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' <td width=199 valign=top style=' ||
             '''' ||
             'width:149.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             szav_terapevt_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' </tr>';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := ' <tr><td width=307 valign=top style=' ||
             '''' ||
             'width:230.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Заведующий' ||
             ' физиотерапевтическим отделением</span></p></td>' ||
             ' <td width=180 valign=top style=' ||
             '''' ||
             'width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' <td width=199 valign=top style=' ||
             '''' ||
             'width:149.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             szav_bfto_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td></tr>';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := ' <tr><td width=307 valign=top style=' ||
             '''' ||
             'width:230.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Лечащий' ||
             ' врач</span></p></td>' ||
             ' <td width=180 valign=top style=' ||
             '''' ||
             'width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td><td width=199 valign=top style=' ||
             '''' ||
             'width:149.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             slech_vrach_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td></tr></table>';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      str := '<p class=MsoNormal>;</p></div></body></html>';
      dbms_lob.write (c, LENGTH (str), dbms_lob.getlength (c) + 1, str);
      COMMIT;
      RETURN nres;
   END;

   FUNCTION get_nazresultkek_ib (pfk_id IN NUMBER)
      RETURN VARCHAR2
   IS
      sdate               VARCHAR2(100);
      nnum                NUMBER;
      sglav_fio           VARCHAR2(200);
      szav_terapevt_fio   VARCHAR2(200);
      szav_bfto_fio       VARCHAR2(200);
      slech_vrach_fio     VARCHAR2(200);
      spac_fio            VARCHAR2(400);
      sdiag               VARCHAR2(1000);
      sres                VARCHAR2(32767);
      str                 VARCHAR2(8000);

      CURSOR cdate_number
      IS
         SELECT TO_CHAR (fd_run, 'DD.MM.YYYY'), seq_keknum.nextval
           FROM tnazkons
          WHERE fk_id = pfk_id;

      CURSOR cglav_fio
      IS
         SELECT   /*+RULE*/INITCAP (
                   SUBSTR (fc_name, 1, 1) ||
                   '. ' ||
                   SUBSTR (fc_otch, 1, 1) ||
                   '. ' ||
                   fc_fam
                )
           FROM tsotr
          WHERE fk_id = (SELECT   /*+RULE*/fk_sotrid
                           FROM tpass
                          WHERE fk_specid = get_glav_specid);

      CURSOR czavterapevt
      IS
         SELECT   /*+RULE*/INITCAP (
                   SUBSTR (fc_name, 1, 1) ||
                   '. ' ||
                   SUBSTR (fc_otch, 1, 1) ||
                   '. ' ||
                   fc_fam
                )
           FROM tsotr
          WHERE fk_id = get_zavterapevt;

      CURSOR czavbfto
      IS
         SELECT   /*+RULE*/INITCAP (
                   SUBSTR (fc_name, 1, 1) ||
                   '. ' ||
                   SUBSTR (fc_otch, 1, 1) ||
                   '. ' ||
                   fc_fam
                )
           FROM tsotr
          WHERE fk_id = get_zavbfto;

      CURSOR clech_vrach
      IS
         SELECT   /*+RULE*/INITCAP (
                   SUBSTR (fc_name, 1, 1) ||
                   '. ' ||
                   SUBSTR (fc_otch, 1, 1) ||
                   '. ' ||
                   fc_fam
                )
           FROM tsotr
          WHERE fk_id = (SELECT get_pacvrach (fk_pacid)
                           FROM tnazkons
                          WHERE fk_id = pfk_id);

      CURSOR cpac_fio
      IS
         SELECT   /*+RULE*/INITCAP (fc_fam || ' ' || fc_im || ' ' || fc_otch)
           FROM tkarta
          WHERE fk_id = (SELECT fk_pacid
                           FROM tnazkons
                          WHERE fk_id = pfk_id);

      CURSOR cdiag
      IS
         SELECT do_diagbytype (fk_pacid, 4, 1, pfk_id, 0) ||
                ' ' ||
                do_diagbytype (fk_pacid, 4, 0, pfk_id, 0)
           FROM tnazkons
          WHERE fk_id = pfk_id;
   BEGIN
      OPEN cdate_number;
      FETCH cdate_number INTO sdate, nnum;
      CLOSE cdate_number;
      OPEN cglav_fio;
      FETCH cglav_fio INTO sglav_fio;
      CLOSE cglav_fio;
      OPEN czavterapevt;
      FETCH czavterapevt INTO szav_terapevt_fio;
      CLOSE czavterapevt;
      OPEN czavbfto;
      FETCH czavbfto INTO szav_bfto_fio;
      CLOSE czavbfto;
      OPEN clech_vrach;
      FETCH clech_vrach INTO slech_vrach_fio;
      CLOSE clech_vrach;
      OPEN cpac_fio;
      FETCH cpac_fio INTO spac_fio;
      CLOSE cpac_fio;
      OPEN cdiag;
      FETCH cdiag INTO sdiag;
      CLOSE cdiag;
      str := '<html xmlns:o="urn:schemas-microsoft-com:office:office"' ||
             'xmlns:w="urn:schemas-microsoft-com:office:word"' ||
             'xmlns="http://www.w3.org/TR/REC-html40">';
      sres := sres || str;
      str := '<head><meta http-equiv=Content-Type content="text/html; charset=windows-1251">' ||
             '<meta name=ProgId content=Word.Document>' ||
             '<meta name=Generator content="Microsoft Word 9">' ||
             '<meta name=Originator content="Microsoft Word 9">' ||
             '<link rel=File-List href="./print_kek.files/filelist.xml">' ||
             '<link rel=Edit-Time-Data href="./print_kek.files/editdata.mso">';
      sres := sres || str;
      str := ' <style>' ||
             ' <!--' ||
             ' p.MsoNormal, li.MsoNormal, div.MsoNormal' ||
             ' {mso-style-parent:"";' ||
             ' margin:0cm;' ||
             ' margin-bottom:.0001pt;' ||
             ' mso-pagination:widow-orphan;' ||
             ' font-size:10.0pt;' ||
             ' font-family:"Times New Roman";' ||
             ' mso-fareast-font-family:"Times New Roman";}' ||
             ' @page Section1' ||
             ' {size:595.3pt 841.9pt;' ||
             ' margin:2.0cm 37.3pt 2.0cm 54.0pt;' ||
             ' mso-header-margin:35.4pt;' ||
             ' mso-footer-margin:35.4pt;' ||
             ' mso-paper-source:0;}' ||
             ' div.Section1' ||
             ' {page:Section1;}' ||
             ' -->' ||
             ' </style>';
      sres := sres || str;
      str := ' </head>' ||
             ' <body lang=RU style=' ||
             '''' ||
             'tab-interval:35.4pt' ||
             '''' ||
             '>' ||
             ' <div class=Section1>' ||
             ' <p class=MsoNormal align=center style=' ||
             '''' ||
             'text-align:center' ||
             '''' ||
             '><b><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Заседание<span' ||
             ' style="mso-spacerun: yes">  </span>КЭК<span style="mso-spacerun: yes">' ||
             ' </span> от </span></b><b><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             sdate ||
             '</span></b><b><span style=' ||
             '''' ||
             'font-size:' ||
             ' 10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '> № </span></b><b><span lang=EN-US' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             ' >' ||
             nnum ||
             '</span></b><b><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></b></p>' ||
             ' <p class=MsoNormal align=center style=' ||
             '''' ||
             'text-align:center' ||
             '''' ||
             '><b><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></b></p>' ||
             ' <BR><BR>';
      sres := sres || str;
      str := ' <p class=MsoNormal style=' ||
             '''' ||
             'text-align:justify;text-indent:27.0pt' ||
             '''' ||
             '><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Комиссия в составе: Зам. главного' ||
             ' врача </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             zamsglav_fio ||
             /*'>Комиссия в составе: главного' || by TimurLan
             ' врача </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             sglav_fio ||*/
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>, заведующий' ||
             ' ' ||
             ' терапевтическим' ||
             ' отделением </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             szav_terapevt_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>, заведующий' ||
             ' физиотерапевтическим' ||
             ' ' ||
             'отделением </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:' ||
             ' 10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             szav_bfto_fio ||
             ' </span><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>,' ||
             ' лечащий врач </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             slech_vrach_fio ||
             '</span><span';
      sres := sres || str;
      str := ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>, осмотрела больного </span><span' ||
             ' lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:' ||
             ' EN-US' ||
             '''' ||
             '>' ||
             spac_fio ||
             ',</span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt' ||
             '''' ||
             '> </span><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>' ||
             ' установила диагноз: </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;' ||
             ' mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             sdiag ||
             ' </span><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>.<o:p></o:p></span></p><BR>';
      sres := sres || str;
      str := '<p class=MsoNormal style=' ||
             '''' ||
             'text-indent:27.0pt' ||
             '''' ||
             '><span style=' ||
             '''' ||
             'font-size:10.0pt;' ||
             ' mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Заключение комиссии: ' ||
             pkg_naz.get_zakl (pfk_id) ||
             '</span></p>';
      sres := sres || str;
      str := ' <p class=MsoNormal style=' ||
             '''' ||
             'text-indent:27.0pt' ||
             '''' ||
             '><span style=' ||
             '''' ||
             'font-size:10.0pt;' ||
             ' mso-bidi-font-size:10.0pt' ||
             '''' ||
/*             '>Пациент </span><span lang=EN-US style=' ||
             '''' ||
             'font-size:' ||
             ' 10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             spac_fio ||
             ' </span><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>' ||
             '  противопоказан (не показан) для санаторно-курортного' ||
             ' лечения.</span></p>';*/
             '></span><span lang=EN-US style=' ||
             '''' ||
             'font-size:' ||
             ' 10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
--             spac_fio ||
             ' </span><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>' ||
             '</span></p>';
      sres := sres || str;
      str := ' <p class=MsoNormal style=' ||
             '''' ||
             'text-indent:27.0pt' ||
             '''' ||
             '><span style=' ||
             '''' ||
             'font-size:10.0pt;' ||
             ' mso-bidi-font-size:10.0pt' ||
             '''' ||
--             '>Оставлен по настойчивой просьбе на' ||
--             ' климатолечение по режиму №1 под наблюдением врача и для проведения' ||
--             ' симптоматической терапии.</span></p>' ||
             ' </span></p>' ||
             ' <p class=MsoNormal><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>' ||
             ' </span></p>' ||
             ' <BR><BR>';
      sres := sres || str;
      str := ' <table border=0 cellspacing=0 cellpadding=0 style=' ||
             '''' ||
             'border-collapse:collapse;' ||
             ' mso-padding-alt:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <tr>' ||
             ' <td width=307 valign=top style=' ||
             '''' ||
             'width:230.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Зам. ' ||
             ' Глав врача по мед. части</span></p>' ||
             ' </td>' ||
             ' <td width=180 valign=top style=' ||
             '''' ||
             'width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' <td width=199 valign=top style=' ||
             '''' ||
             'width:149.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             zamsglav_fio ||
             /*'>Главный' ||
             ' врач</span></p>' ||
             ' </td>' ||
             ' <td width=180 valign=top style=' ||
             '''' ||
             'width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' <td width=199 valign=top style=' ||
             '''' ||
             'width:149.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             sglav_fio ||*/
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' </tr>';
      sres := sres || str;
      str := ' <tr>' ||
             ' <td width=307 valign=top style=' ||
             '''' ||
             'width:230.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Заведующий' ||
             ' терапевтическим отделением</span></p></td>' ||
             ' <td width=180 valign=top style=' ||
             '''' ||
             'width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' <td width=199 valign=top style=' ||
             '''' ||
             'width:149.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             szav_terapevt_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' </tr>';
      sres := sres || str;
      str := ' <tr><td width=307 valign=top style=' ||
             '''' ||
             'width:230.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Заведующий' ||
             ' физиотерапевтическим отделением</span></p></td>' ||
             ' <td width=180 valign=top style=' ||
             '''' ||
             'width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td>' ||
             ' <td width=199 valign=top style=' ||
             '''' ||
             'width:149.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             szav_bfto_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td></tr>';
      sres := sres || str;
      str := ' <tr><td width=307 valign=top style=' ||
             '''' ||
             'width:230.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '>Лечащий' ||
             ' врач</span></p></td>' ||
             ' <td width=180 valign=top style=' ||
             '''' ||
             'width:135.0pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td><td width=199 valign=top style=' ||
             '''' ||
             'width:149.4pt;padding:0cm 5.4pt 0cm 5.4pt' ||
             '''' ||
             '>' ||
             ' <p class=MsoNormal><span lang=EN-US style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:' ||
             ' 10.0pt;mso-ansi-language:EN-US' ||
             '''' ||
             '>' ||
             slech_vrach_fio ||
             '</span><span' ||
             ' style=' ||
             '''' ||
             'font-size:10.0pt;mso-bidi-font-size:10.0pt' ||
             '''' ||
             '></span></p>' ||
             ' </td></tr></table>';
      sres := sres || str;
      str := '<p class=MsoNormal>;</p></div></body></html>';
      sres := sres || str;
      return sres;
--      RETURN pkg_naz.get_zakl (pfk_id);
   END;

   FUNCTION     isItAlreadyNaz (sTabName IN VARCHAR2, nSMID IN NUMBER, nPacID IN NUMBER, nVrachID IN NUMBER)
   RETURN NUMBER
   IS
     CURSOR isNazKONS(pSMID NUMBER, pPacID NUMBER, pVrachID NUMBER)
     IS
       SELECT COUNT(FK_ID) FROM TNAZKONS WHERE fk_pacid=pPacID and fk_vrachid=pVrachID and fk_smid=pSMID and fl_ins=1;
     CURSOR isNazISSLED(pSMID NUMBER, pPacID NUMBER, pVrachID NUMBER)
     IS
       SELECT COUNT(FK_ID) FROM TNAZIS WHERE fk_pacid=pPacID and fk_vrachid=pVrachID and fk_smid=pSMID and fl_ins=1;
     CURSOR isNazLECH(pSMID NUMBER, pPacID NUMBER, pVrachID NUMBER)
     IS
       SELECT COUNT(FK_ID) FROM TNAZLECH WHERE fk_pacid=pPacID and fk_vrachid=pVrachID and fk_smid=pSMID and fl_ins=1;

     nCount NUMBER:=0.0;
   BEGIN
     IF UPPER(sTabName)='TNAZKONS' THEN
       OPEN isNazKONS(nSMID, nPacID, nVrachID);
       FETCH isNazKONS into nCount;
       CLOSE isNazKONS;
     ELSIF UPPER(sTabName)='TNAZIS' THEN
       OPEN isNazISSLED(nSMID, nPacID, nVrachID);
       FETCH isNazISSLED into nCount;
       CLOSE isNazISSLED;
     ELSIF UPPER(sTabName)='TNAZLECH' THEN
       OPEN isNazLECH(nSMID, nPacID, nVrachID);
       FETCH isNazLECH into nCount;
       CLOSE isNazLECH;
     END IF;
     RETURN nCount;
   END;

   PROCEDURE    DOUnNaz(sTabName IN VARCHAR2, nSMID IN NUMBER, nPacID IN NUMBER, nVrachID IN NUMBER)
   IS
   BEGIN
     IF UPPER(sTabName)='TNAZKONS' THEN
       UPDATE TNAZKONS SET FL_INS=0 WHERE fk_pacid=nPacID and fk_vrachid=nVrachID and fk_smid=nSMID;
     ELSIF UPPER(sTabName)='TNAZIS' THEN
       UPDATE TNAZIS SET FL_INS=0 WHERE fk_pacid=nPacID and fk_vrachid=nVrachID and fk_smid=nSMID;
     ELSIF UPPER(sTabName)='TNAZLECH' THEN
       UPDATE TNAZLECH SET FL_INS=0 WHERE fk_pacid=nPacID and fk_vrachid=nVrachID and fk_smid=nSMID;
     END IF;
   END;

   PROCEDURE    DoNazProc(nSMID IN NUMBER, dDayNaz IN DATE, dDayRun IN DATE, nROOMID IN NUMBER, IspolID IN NUMBER,
                       nVrachID IN NUMBER, nSOSID IN NUMBER, nPacID IN NUMBER, bPlat NUMBER, bIns IN NUMBER, sRemark IN VARCHAR2,
                       pID IN NUMBER)
   IS
   BEGIN
     update tnazkons set fk_smid=nSMID, fd_naz=dDayNaz, fd_run=dDayRun, fk_roomid=nROOMID, fk_vrachid=nVrachID, fk_ispolid=IspolID,
                         fk_nazsosid=nSOSID, fk_pacid=nPacID, fl_plat=bPlat, fl_ins=bIns, fc_remark=sRemark
                     where fk_id=pID;
   END;

   FUNCTION    GET_YES_NO(pCode IN NUMBER) RETURN VARCHAR2
   IS
   BEGIN
     IF pCode=0 THEN
       Return 'Нет';
     ELSE
       Return 'Да';
     END IF;
   END;

   procedure delete_naz(pFK_ID IN NUMBER) IS
   BEGIN
     delete from tnazlech where fk_id=pFK_ID;
     delete from treslech where fk_nazid=pFK_ID;
   END;

   procedure update_naz_status(pFK_ID IN NUMBER, pSTATUS IN NUMBER) IS
   begin
     update tnazan set fk_nazsosid=pSTATUS where fk_id=pFK_ID;
     update tnazis set fk_nazsosid=pSTATUS where fk_id=pFK_ID;
     update tnazkons set fk_nazsosid=pSTATUS where fk_id=pFK_ID;
     update tnazlech set fk_nazsosid=pSTATUS where fk_id=pFK_ID;
   end;

   function get_pac_main_strahcompany(pID in number) return boolean
   is
     nRes boolean;
     nCompany number;
     cursor с is select fk_companyid from tinsurance, tkarta where tkarta.fk_id=pID and tinsurance.fk_peplid=tkarta.fk_peplid;
     cursor q is select fc_value from tsmini where fc_section='CONFIG' and fc_key='STRAHCOMP';
   begin
     nRes:=false;
     open q;
     fetch q into nCompany;
     close q;
     for i in с loop
       if i.fk_companyid=nCompany then
         nRes:=true;
         exit;
       end if;
     end loop;
   end;

   function get_company(pID in number) return varchar2
   is
     cres varchar2(1000);
     cursor c is select fc_name from tcompany where fk_id=pID;
   begin
     open c;
     fetch c into cres;
     close c;
     return cres;
   end;

   function get_pac_company(pID in number) return number
   is
     nRes number;
     cursor c is select tinsurance.fk_companyid from tkarta, tinsurance where tkarta.fk_id=pID and tinsurance.fk_peplid=tkarta.fk_peplid and tinsurance.fl_old=0;
   begin
     open c;
     fetch c into nRes;
     close c;
     return nRes;
   end;

   function get_setPlat(smid in number, pacid in number) return number
   is
     nRes number;
     def number;
     coun number;
     cursor c is select fk_default, count(fk_smid) from vnaz, (select fk_default from tsmid where fk_id=smid and tsmid.fl_usluga=1) where fk_smid=smid and fk_pacid=pacid group by fk_default;
   begin
     open c;
     fetch c into def, coun;
     close c;
     if coun>=def then
       nres:=1;
     else
       nres:=0;
     end if;
     return nRes;
   end;

   function get_defCompany return number
   is
     nres number;
   begin
     select tsmini.fc_value into nres from tsmini where tsmini.fc_section='CONFIG' and tsmini.fc_key='STRAHCOMP';
     return nres;
   end;
-- Имя раздела из смида для назначения
FUNCTION GET_NAZ_FIRSTNAME(PFK_ID IN NUMBER) RETURN VARCHAR2
  is
  --by PHP
  sRes TSMID.FC_NAME%TYPE;
  cursor c1 is select fk_smid from tnazlech where fk_id=PFK_ID
                union
               select fk_smid from tnazkons where fk_id=PFK_ID
                union
               select fk_smid from tnazis where fk_id=PFK_ID
                union
               select fk_smid from tnazan where fk_id=PFK_ID;

  cursor c2(PSMID IN NUMBER) is
    SELECT FC_NAME, ROWNUM
      FROM (SELECT FK_ID, FC_NAME, FK_OWNER
              FROM TSMID
             START WITH FK_ID = (PSMID)
            CONNECT BY PRIOR FK_OWNER = FK_ID)
     WHERE FK_OWNER <> 0
     ORDER BY ROWNUM DESC;
  NSMID NUMBER;
BEGIN
  open c1;
  fetch c1 into NSMID;
  close c1;
  for p in c2(NSMID) loop
    sRes := p.FC_NAME;
    exit;
  end loop;
  return sRes;
END;

FUNCTION GET_NAZ_FULLNAME(PFK_ID IN NUMBER) RETURN VARCHAR2
IS
  sName   tsmid.fc_name%type;
  rn      NUMBER;
  rl      NUMBER;
  sRes    VARCHAR2(4000);
  NSMID   NUMBER;
  cursor c1 is select fk_smid from tnazlech where fk_id=PFK_ID
                union
               select fk_smid from tnazkons where fk_id=PFK_ID
                union
               select fk_smid from tnazis where fk_id=PFK_ID
                union
               select fk_smid from tnazan where fk_id=PFK_ID;
  CURSOR c2(id IN NUMBER)
  IS
    SELECT fc_name, ROWNUM, fl_showprint
      FROM (SELECT fk_id, fc_name, fk_owner,fl_showprint
              FROM tsmid
             START WITH fk_id = id
             CONNECT BY PRIOR fk_owner = fk_id)
     WHERE fk_owner <> 0
     ORDER BY ROWNUM desc;
BEGIN
  sRes := '';
  open c1;
  fetch c1 into NSMID;
  close c1;

  OPEN c2(NSMID);
  FETCH c2 INTO sName, rn, rl;
  IF c2%FOUND and rl=1 THEN
    sRes := sRes || sName || ':';
  END IF;
  LOOP
    FETCH c2 INTO sName, rn, rl;
    EXIT WHEN c2%NOTFOUND;
    if rl=1 then
      sRes := sRes || ' ' || sName;
    end if;
  END LOOP;
  CLOSE c2;
  IF SUBSTR (sRes, LENGTH (sRes), 1) = ':' THEN
    sRes := SUBSTR (sRes, 1, LENGTH (sRes) - 1);
  END IF;
  RETURN sRes;
END;

FUNCTION get_nazcount_all (nfk_id IN NUMBER)
      RETURN NUMBER
   IS
      ncount   NUMBER := 0.0;

      CURSOR c1 (pid NUMBER)
      IS
         SELECT b.FN_NUM
         FROM ASU.TIB b, ASU.TSMID sm 
         WHERE b.fk_pacid = pid 
               AND b.fk_smid = sm.fk_id
               AND sm.fk_loinc_code = -1;

   BEGIN
      OPEN c1 (nfk_id);
      FETCH c1 INTO ncount;
      CLOSE c1;
      
      IF ncount = 0 THEN
        ncount := 1;
      END IF;
      RETURN ncount;
   END;

END;
/

SHOW ERRORS;


