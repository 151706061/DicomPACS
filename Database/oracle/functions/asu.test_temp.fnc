DROP FUNCTION ASU.TEST_TEMP
/

--
-- TEST_TEMP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TWORKPLACE (Table)
--   TLASTFLUORO (Table)
--   TADRESS (Table)
--   TDISTRICT_HISTORY (Table)
--   TDISTRICT_PACIENT (Table)
--   TINSURANCE (Table)
--   TINSURDOCS (Table)
--   TPEOPLES (Table)
--   TSMID (Table)
--   TSOTR (Table)
--   GET_PERSON (Function)
--
CREATE OR REPLACE FUNCTION ASU.test_temp(cnt in number) return clob is
  res clob;
  s varchar2(4000);
  cursor cPepl is select * from asu.tpeoples where fk_id not in (select nvl(fk_peplid,0) from login.tsotr) AND rownum <3;
  cursor cAdr(peplid number) is select * from asu.tadress a where a.fk_pacid = peplid;
  cursor cIns(peplid number) is select * from asu.tinsurance i where i.fk_peplid = peplid;
  cursor cIB(peplid number) is select * from asu.tib i where FK_SMID IN (SELECT FK_ID FROM TSMID CONNECT BY FK_OWNER = PRIOR FK_ID START WITH FK_ID = GET_PERSON) and fk_pacid = peplid;
  cursor cInsDoc(peplid number) is select * from asu.tinsurdocs d where d.fk_peplid = peplid;
  cursor cDistr(peplid number) is select * from asu.tdistrict_pacient d where d.fk_peplid = peplid;
  cursor cDistrH(peplid number) is select * from asu.tdistrict_history d where d.fk_peplid = peplid;
  cursor cFlur(peplid number) is select * from asu.tlastfluoro f where f.fd_date is not null and f.fk_peplid = peplid;
  cursor cWorkPlace(peplid number) is select * from asu.tworkplace w where w.fk_pacid = peplid;
  function DateToStr(ADate date) return varchar2 is
  begin
    return 'to_date('''||to_char(adate,'dd.mm.yyyy')||''',''dd.mm.yyyy'')';
  end;
  function NumToStr(ANum NUMBER) RETURN VARCHAR2 IS 
  BEGIN
    RETURN nvl(NumToStr(ANum),'NULL');
  END;
begin
  dbms_lob.createtemporary(res,true);
  s := 'declare'||chr(13)||'pid number;'||chr(13)||'begin'||chr(13);
  dbms_lob.writeappend(res,length(s),s);
  for i in cPepl loop
    s := 'insert into tpeoples (fc_fam, fc_im, fc_otch, fp_sex, fd_rojd, fk_docvid, fc_docser, fc_docnum, fd_docdate, fc_docvidan, fc_rabota, fc_phone, fc_fax, fc_e_mail, fc_http, fk_companyid, fk_otdel, fk_dolgnost, fc_rojdplace, fk_groupid, fc_snils, fc_unrz)'||chr(13)||
    'values ('''||i.fc_fam||''','''||i.fc_im||''','''||i.fc_otch||''','||NumToStr(i.fp_sex)||','||DateToStr(i.fd_rojd)||','||NumToStr(i.fk_docvid)||','''||i.fc_docser||''','''||
    i.fc_docnum||''','||DateToStr(i.fd_docdate)||','''||i.fc_docvidan||''','''||i.fc_rabota||''','''||i.fc_phone||''','''||i.fc_fax||''','''||i.fc_e_mail||''','''||i.fc_http||''','||
    NumToStr(i.fk_companyid)||','||NumToStr(i.fk_otdel)||','||NumToStr(i.fk_dolgnost)||','''||i.fc_rojdplace||''','||NumToStr(i.fk_groupid)||','''||i.fc_snils||''','''||i.fc_unrz||''')'||chr(13)||
    'returning fk_id into pid;'||chr(13);
    dbms_lob.writeappend(res,length(s),s);
    FOR j IN cAdr(i.fk_id) LOOP
      s := 'INSERT INTO tadress (fk_countryid, fk_regionid, fk_townid, fk_streetid, fk_pacid, fk_type, fl_as_another, fk_raionid, fc_adr, fk_intownid, fc_house, fc_korpus, fc_kvartira, fk_kladr, fd_date, fk_appsotrid)'||chr(13)||
      'VALUES ('||NumToStr(j.fk_countryid)||','||NumToStr(j.fk_regionid)||','||NumToStr(j.fk_townid)||','||NumToStr(j.fk_streetid)||',pid,'||NumToStr(j.fk_type)||','||
      NumToStr(j.fl_as_another)||','||NumToStr(j.fk_raionid)||','''||j.fc_adr||''','||NumToStr(j.fk_intownid)||','''||j.fc_house||''','''||j.fc_korpus||''','''||j.fc_kvartira||''','||
      NumToStr(j.fk_kladr)||','||DateToStr(j.fd_date)||','||NumToStr(j.fk_appsotrid)||');'||chr(13);
      dbms_lob.writeappend(res,length(s),s);
    END LOOP;
    FOR j IN cIns(i.fk_id) LOOP
      s := 'INSERT INTO tinsurance (fk_peplid, fc_ser, fc_num, fc_dogovor, fk_companyid, fl_old, fd_date)'||chr(13)||
      'VALUES (pid,'''||j.fc_ser||''','''||j.fc_num||''','''||j.fc_dogovor||''','||NumToStr(j.fk_companyid)||','||NumToStr(j.fl_old)||','||DateToStr(j.fd_date)||');'||chr(13);
      dbms_lob.writeappend(res,length(s),s);
    END LOOP;
    FOR j IN cib(i.fk_id) LOOP
      s := 'INSERT INTO tib (fc_char, fn_num, fk_bid, fk_pacid, fk_smid, fk_smeditid, fk_vrachid, fd_date)'||chr(13)||
      'VALUES ('''||j.fc_char||''','||NumToStr(j.fn_num)||','||NumToStr(j.fk_bid)||',pid,'||NumToStr(j.fk_smid)||','||NumToStr(j.fk_smeditid)||','||
      NumToStr(j.fk_vrachid)||','||DateToStr(j.fd_date)||');';
      dbms_lob.writeappend(res,length(s),s);
    END LOOP;
    FOR j IN cInsDoc(i.fk_id) LOOP
      s := 'INSERT INTO tinsurdocs (fk_peplid, fk_groupid, fk_dogovorid, fk_typedocid, fc_ser, fd_begin, fd_end, fc_num, fk_companyid, fd_prolong, fk_typeoms, fd_null, fc_enp, fk_strahid, fc_inssum, fd_last_change)'||chr(13)||
      'VALUES (pid,'||NumToStr(j.fk_groupid)||','||NumToStr(j.fk_dogovorid)||','||NumToStr(j.fk_typedocid)||','''||j.fc_ser||''','||DateToStr(j.fd_begin)||','||
      DateToStr(j.fd_end)||','''||j.fc_num||''','||NumToStr(j.fk_companyid)||','||DateToStr(j.fd_prolong)||','||NumToStr(j.fk_typeoms)||','||DateToStr(j.fd_null)||','''||
      j.fc_enp||''','||NumToStr(j.fk_strahid)||','''||j.fc_inssum||''','||DateToStr(j.fd_last_change)||');';
      dbms_lob.writeappend(res,length(s),s);
    END LOOP;
    FOR j IN cDistr(i.fk_id) LOOP
      s := 'INSERT INTO tdistrict_pacient (fk_arealid, fk_peplid, fd_date_in, fk_sotrid, fd_cheked, fk_sotchek)'||chr(13)||
      'VALUES ('||NumToStr(j.fk_arealid)||',pid,'||DateToStr(j.fd_date_in)||','||NumToStr(j.fk_sotrid)||','||DateToStr(j.fd_cheked)||','||NumToStr(j.fk_sotchek)||');';
      dbms_lob.writeappend(res,length(s),s);
    END LOOP;
    FOR j IN cDistrH(i.fk_id) LOOP
      s := 'INSERT INTO tdistrict_history (fk_areaid, fk_peplid, fd_date_move, fk_sotrid, fk_reason, fc_type)'||chr(13)||
      'VALUES ('||NumToStr(j.fk_areaid)||',pid,'||DateToStr(j.fd_date_move)||','||NumToStr(j.fk_sotrid)||','||NumToStr(j.fk_reason)||','''||j.fc_type||''');';
      dbms_lob.writeappend(res,length(s),s);
    END LOOP;
    FOR j IN cFlur(i.fk_id) LOOP
      s := 'INSERT INTO tlastfluoro (fk_peplid, fd_date, fc_num)'||chr(13)||
      'VALUES (pid,'||DateToStr(j.fd_date)||','''||j.fc_num||''');';
      dbms_lob.writeappend(res,length(s),s);
    END LOOP;
    FOR j IN cWorkPlace(i.fk_id) LOOP
      s := 'INSERT INTO tworkplace (fk_company, fk_otdel, fk_dolgnost, fc_rabota, fk_pacid, fp_main)'||chr(13)||
      'VALUES ('||NumToStr(j.fk_company)||','||NumToStr(j.fk_otdel)||','||NumToStr(j.fk_dolgnost)||','''||j.fc_rabota||''',pid,'||NumToStr(j.fp_main)||');';
      dbms_lob.writeappend(res,length(s),s);
    END LOOP;
  end loop;
  s := 'end;';
  dbms_lob.writeappend(res,length(s),s);
  return(Res);
end test_temp;
/

SHOW ERRORS;


