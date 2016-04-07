DROP PACKAGE BODY ASU.PKG_NAZ_REPL
/

--
-- PKG_NAZ_REPL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_NAZ_REPL" IS

 naz_smid_spk            VARCHAR2(20) := 'NAZ_SMID_SPK'; --перечень назначений, которые назначают в ОКБ для проведения в СПК
 naz_smid_okb            VARCHAR2(20) := 'NAZ_SMID_OKB'; --перечень назначений, которые назначают в СПК для проведения в ОКБ
 treb_naz_to_spk_section VARCHAR2(20) := 'TREB_NAZ';
 treb_naz_to_spk_key     VARCHAR2(20) := 'MAX_IB';

 FUNCTION get_our_code(ptheir NUMBER, pfc_name VARCHAR2) RETURN NUMBER IS
  v_res NUMBER;
 BEGIN
  SELECT MAX(eo.fn_code)
    INTO v_res
    FROM exch43.texchange_their et, exch43.ttables t, exch43.texchange_own eo
   WHERE t.fk_id = et.fk_table
     AND t.fc_name = pfc_name
     AND eo.fk_their = et.fk_id
     AND et.fn_code = ptheir
     AND et.fl_del = 0
     AND t.fl_del = 0
     AND eo.fl_del = 0;
  RETURN v_res;
 END;

 FUNCTION get_their_code(pour NUMBER, pfc_name VARCHAR2) RETURN NUMBER IS
  v_res NUMBER;
 BEGIN
  SELECT MAX(et.fn_code)
    INTO v_res
    FROM exch43.texchange_their et, exch43.ttables t, exch43.texchange_own eo
   WHERE t.fk_id = et.fk_table
     AND t.fc_name = pfc_name
     AND eo.fk_their = et.fk_id
     AND eo.fn_code = pour
     AND et.fl_del = 0
     AND t.fl_del = 0
     AND eo.fl_del = 0;
  RETURN v_res;
 END;

 PROCEDURE do_exchange_naz IS
  --скопировать назначенные лабораторные исследования
  maxsmid           NUMBER;
  ppepl             NUMBER;
  pac_id            tambulance.fk_id%TYPE;
  rpeople           asu.tpeoples%ROWTYPE;
  ramb              asu.tambulance@so100906%ROWTYPE;
  vtviddocfk_docvid VARCHAR(32);
  docobsl_id        NUMBER;
  snumib            VARCHAR2(10);
  v_nazid           NUMBER;
  cnt               NUMBER;
  lab_syn           asu.tsmid.fc_synonim%TYPE;
  v_naz_vrach_id    NUMBER;
 BEGIN
  SELECT fc_value
    INTO maxsmid
    FROM tsmini
   WHERE fc_section = treb_naz_to_spk_section
     AND fc_key = treb_naz_to_spk_key;
 
  UPDATE tsmini
     SET fc_value = (SELECT to_char(MAX(fk_id)) FROM asu.tnazan@sh090113)
   WHERE fc_section = treb_naz_to_spk_section
     AND fc_key = treb_naz_to_spk_key;
  -- назначения, которые могут быть выполнены
  FOR c1 IN (SELECT DISTINCT eo.fn_code fk_our, et.fn_code fk_their
               FROM exch43.texchange_their et, exch43.ttables t, exch43.texchange_own eo
              WHERE t.fk_id = et.fk_table
                AND t.fc_name = naz_smid_okb
                AND eo.fk_their = et.fk_id
                AND et.fl_del = 0
                AND t.fl_del = 0
                AND eo.fl_del = 0) LOOP
  
   BEGIN
    -- новые назначения
    FOR c2 IN (SELECT *
                 FROM asu.tnazan@sh090113 t
                WHERE t.fk_id > maxsmid
                  AND t.fk_smid = c1.fk_their --!!!
                  AND t.fk_nazsosid <> asu.get_vipnaz
                  AND NOT EXISTS
                (SELECT 1 FROM asu.tnazan n WHERE n.fk_guid = t.fk_guid)) LOOP
    
     --tnazan.fk_vrachid обязательно для заполнения
     --если назначение в биохимию записать угорелову
     --если в клинику - солодовникову
     v_naz_vrach_id := NULL;
     SELECT MAX(fc_synonim)
       INTO lab_syn
       FROM asu.tsmid
      WHERE fk_owner = 1321
     CONNECT BY PRIOR fk_owner = fk_id
      START WITH fk_id = c1.fk_our;
     IF lab_syn = 'ANAL_CLINIC' THEN
      v_naz_vrach_id := 27318; --солодовникова
     END IF;
     IF lab_syn = 'RAZ_BIOHIM' THEN
      v_naz_vrach_id := 282; --угорелова
     END IF;
    
     IF (v_naz_vrach_id IS NOT NULL) THEN
     
      ppepl := asu.pkg_regist_pacfunc.get_pepl_id@sh090113(c2.fk_pacid);
     
      --добавить пипла (если его ещё нет)
      SELECT * INTO rpeople FROM tpeoples@sh090113 p WHERE p.fk_id = ppepl;
      BEGIN
       SELECT t.fk_guid
         INTO vtviddocfk_docvid
         FROM asu.tviddoc@sh090113 t
        WHERE t.fk_id = rpeople.fk_docvid;
      
       SELECT MAX(fk_id)
         INTO rpeople.fk_docvid
         FROM asu.tviddoc v
        WHERE v.fk_guid = vtviddocfk_docvid;
      EXCEPTION
       WHEN OTHERS THEN
        rpeople.fk_docvid := NULL;
      END;
      SELECT * INTO ramb FROM tambulance@sh090113 p WHERE p.fk_id = c2.fk_pacid;
     
      --проверка, есть ли пипл у нас на базе
      SELECT MAX(fk_id) INTO ppepl FROM asu.tpeoples WHERE fk_guid = rpeople.fk_guid;
     
      IF (ppepl IS NULL) THEN
       INSERT INTO tpeoples
        (fc_fam,
         fc_im,
         fc_otch,
         fp_sex,
         fd_rojd,
         fc_docser,
         fc_docnum,
         fd_docdate,
         fc_docvidan,
         fc_rabota,
         fc_phone,
         fc_fax,
         fc_e_mail,
         fc_http,
         fc_rojdplace,
         fk_guid)
       VALUES
        (rpeople.fc_fam,
         rpeople.fc_im,
         rpeople.fc_otch,
         rpeople.fp_sex,
         rpeople.fd_rojd,
         rpeople.fc_docser,
         rpeople.fc_docnum,
         rpeople.fd_docdate,
         rpeople.fc_docvidan,
         rpeople.fc_rabota,
         rpeople.fc_phone,
         rpeople.fc_fax,
         rpeople.fc_e_mail,
         rpeople.fc_http,
         rpeople.fc_rojdplace,
         rpeople.fk_guid)
       RETURNING fk_id INTO ppepl;
      END IF;
     
      --проверка, есть ли амбуланс
      SELECT MAX(a.fk_id)
        INTO pac_id
        FROM asu.tambulance a, asu.tdocobsl o
       WHERE a.fk_peplid = ppepl
         AND a.fk_docobsl = o.fk_id
         AND o.fk_viddocid = asu.lab_kart --482 - карта донора
         AND a.fk_ibid = ramb.fk_ibid
         AND a.fk_iby = ramb.fk_iby;
     
      IF pac_id IS NULL THEN
       docobsl_id := asu.set_newibnum(asu.lab_kart, snumib);
       INSERT INTO asu.tambulance
        (fk_ibid,
         fk_iby,
         fc_fam,
         fc_im,
         fc_otch,
         fd_rojd,
         fp_sex,
         fk_peplid,
         fk_docobsl,
         fk_guid)
       VALUES
        (ramb.fk_ibid,
         ramb.fk_iby,
         rpeople.fc_fam,
         rpeople.fc_im,
         rpeople.fc_otch,
         rpeople.fd_rojd,
         rpeople.fp_sex,
         ppepl,
         docobsl_id,
         ramb.fk_guid)
       RETURNING fk_id INTO pac_id;
       UPDATE asu.tdocobsl o
          SET o.fk_numib = ramb.fk_ibid, o.fn_year = ramb.fk_iby
        WHERE o.fk_id = docobsl_id;
      END IF;
     
      INSERT INTO asu.tnazan
       (fk_smid,
        fc_remark,
        fd_naz,
        fd_run,
        fk_nazsosid,
        fk_pacid,
        fc_type,
        fk_guid,
        fk_naztypeid,
        fk_vrachid)
      VALUES
       (c1.fk_our, --!!!!
        c2.fc_remark,
        c2.fd_naz,
        c2.fd_run,
        c2.fk_nazsosid,
        pac_id,
        c2.fc_type,
        c2.fk_guid,
        c2.fk_naztypeid,
        v_naz_vrach_id) --!!!
      RETURNING fk_id INTO v_nazid;
     
      /* asu.tnazgroup вставляется в тригере на tnazan
       for cgroup in (select *
                       from asu.tnazgroup@sh090113 n
                      where n.fk_nazid = c2.fk_id) loop
        v_group   := get_our_code(cgroup.fk_groupid, naz_smid_okb);
        v_smid_gr := get_our_code(cgroup.fk_smid, naz_smid_okb);
        insert into asu.tnazgroup
          (fk_nazid,
           fk_groupid,
           fd_run,
           fk_smid,
           fk_pacid,
           fk_naztypeid,
           fk_vrachid)
        values
          (v_nazid,
           v_group,
           cgroup.fd_run,
           v_smid_gr,
           pac_id,
           cgroup.fk_naztypeid,
           45073);
      end loop;*/
     
      FOR cexp IN (SELECT e.*, get_their_code(e.fk_smid, naz_smid_okb) their --!!!get_their_code   their
                     FROM asu.texpan e
                    WHERE e.fk_nazid = v_nazid) LOOP
      
       SELECT COUNT(1)
         INTO cnt
         FROM asu.texpan@sh090113 e
        WHERE e.fk_nazid = c2.fk_id
          AND e.fk_smid = cexp.their; --!!!
       IF cnt = 0 THEN
        DELETE FROM asu.texpan WHERE fk_id = cexp.fk_id;
       END IF;
      END LOOP;
     
      INSERT INTO asu.tnaz_spk_repl (fk_naz_guid, fd_insert) VALUES (c2.fk_guid, SYSDATE);
     END IF;
    END LOOP;
   EXCEPTION
    WHEN no_data_found THEN
     NULL;
    
   END;
  
  END LOOP;
  COMMIT;
 END;

 PROCEDURE do_exchange_res IS
  pac_id       tambulance.fk_id%TYPE;
  v_smid       NUMBER;
  v_blobid     NUMBER;
  v_nazid      NUMBER;
  v_colid      NUMBER;
  v_nazguid    VARCHAR2(32);
  s_naz_to_del VARCHAR2(32000);
 BEGIN
 
  s_naz_to_del := '''0''';
  -- назначения, которые могут быть выполнены
  FOR c1 IN (SELECT DISTINCT eo.fn_code fk_our, et.fn_code fk_their
               FROM exch43.texchange_their et, exch43.ttables t, exch43.texchange_own eo
              WHERE t.fk_id = et.fk_table
                AND t.fc_name = naz_smid_spk
                AND eo.fk_their = et.fk_id
                AND et.fl_del = 0
                AND t.fl_del = 0
                AND eo.fl_del = 0) LOOP
   v_nazguid := NULL;
  
   -- новые результаты
   FOR c2 IN (SELECT t.*, r.fk_naz_guid
                FROM asu.tresan@sh090113        t,
                     asu.tnazan@sh090113        n,
                     asu.tnaz_spk_repl@sh090113 r
               WHERE t.fk_smid = c1.fk_their
                 AND n.fk_nazsosid = asu.get_vipnaz
                 AND n.fk_id = t.fk_nazid
                 AND r.fk_naz_guid = n.fk_guid
                 AND NOT EXISTS
               (SELECT 1 FROM asu.tresan v WHERE v.fk_guid = t.fk_guid)) LOOP
   
    v_nazguid := c2.fk_naz_guid;
    --нащ смид назначения
    v_smid := get_our_code(c2.fk_smid, naz_smid_spk);
   
    --наш смид варчара
    IF c2.fl_zakl = 1 THEN
     v_blobid := NULL;
     FOR cclob IN (SELECT 1 FROM asu.tclobs@sh090113 s WHERE s.fk_id = c2.fk_blobid) LOOP
      INSERT INTO asu.tclobs (fc_clob) VALUES (empty_clob()) RETURNING fk_id INTO v_blobid;
      UPDATE asu.tclobs
         SET fc_clob = (SELECT fc_clob FROM asu.tclobs@sh090113 s WHERE s.fk_id = c2.fk_blobid)
       WHERE fk_id = v_blobid;
     END LOOP;
    ELSE
     v_blobid := get_our_code(c2.fk_blobid, naz_smid_spk);
    END IF;
   
    --нащ смид колонки для mtable
    v_colid := get_our_code(c2.fk_colid, naz_smid_spk);
   
    --наш ИД назначения, ИД паца
    SELECT MAX(fk_id), MAX(fk_pacid)
      INTO v_nazid, pac_id
      FROM asu.tnazan v
     WHERE v.fk_guid = c2.fk_naz_guid;
   
    --вставить результат назначения
    INSERT INTO asu.tresan
     (fk_smid,
      fd_ins,
      fc_res,
      fk_blobid,
      fn_res,
      fc_type,
      fk_pacid,
      fk_nazid,
      fk_patname,
      fc_coment,
      fk_sos,
      fk_colid,
      fl_zakl,
      fk_patid,
      fk_guid)
    VALUES
     (v_smid,
      c2.fd_ins,
      c2.fc_res,
      v_blobid,
      c2.fn_res,
      c2.fc_type,
      pac_id,
      v_nazid,
      c2.fk_patname,
      c2.fc_coment,
      c2.fk_sos,
      v_colid,
      c2.fl_zakl,
      c2.fk_patid,
      c2.fk_guid);
    UPDATE asu.tnazan n SET n.fk_nazsosid = asu.get_vipnaz WHERE n.fk_id = v_nazid;
   
   END LOOP;
  
   s_naz_to_del := s_naz_to_del || ',''' || v_nazguid || '''';
  END LOOP;
 
  --if s_naz_to_del <> '''0''' then
  --  execute immediate 'delete from asu.tnaz_spk_repl@sh090113 r where r.fk_naz_guid in ('||s_naz_to_del||')';
  --end if;
 
  COMMIT;
 END;

END pkg_naz_repl;
/

SHOW ERRORS;


