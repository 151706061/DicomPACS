DROP FUNCTION ASU.GET_DLL_TEST
/

--
-- GET_DLL_TEST  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TROOM (Table)
--   TNAZOPER (Table)
--   TSMID (Table)
--   PKG_OPER_PLAN (Package)
--   GET_SMIDNAME (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_DLL_TEST" (pFK_NAZID IN NUMBER, pFK_SOTRID IN NUMBER) RETURN VARCHAR IS
  Res Varchar2(4000);
  f NUMBER;
  v_syn_sroch Varchar2(50);
begin
  v_syn_sroch := 'PROTHOPER_SROCH';
  for c in (
      select
        decode (fk_nazowner,-1,'Незапланированная операция',
             (select max(oo.fc_name)
             from asu.tnazoper oo
             where oo.fk_nazid=fk_nazowner)) fc_ownerOperName,
        fc_name,
        (select max(r.fc_palata) from asu.troom r where r.fk_id = fk_operroom) fc_operroom,
        fn_opertable,
        (select max(fc_name) from asu.tsmid where fk_id = fk_anestid) fc_anestid,
        operlist,
        anestlist,
        tranfuslist,
        bloklist,
        fc_date,
        fc_time,
        fn_duration,
        to_char(fd_end,'dd.mm.yyyy') fc_enddate,
        to_char(fd_end,'hh24:mi') fc_endtime,
        decode(fk_sroch,null,null,get_smidname(fk_sroch)) fc_sroch,
        fc_hihjtech
     from(select o.fk_id OperID,
        decode(v.fk_nazowner,pFK_NAZID,-1,v.fk_nazowner) fk_nazowner,
        o.fc_name,
        o.fk_operroom,
        o.fn_opertable,
        o.fk_anestid,
        pkg_oper_plan.getsotrlist(o.fk_nazid, 1) operlist,
        pkg_oper_plan.getsotrlist(o.fk_nazid, 2) anestlist,
        pkg_oper_plan.getsotrlist(o.fk_nazid, 3) tranfuslist,
        pkg_oper_plan.getsotrlist(o.fk_nazid, 4) bloklist,
        o.fn_duration,
        to_char(o.fd_run,'dd.mm.yyyy') fc_date,
        to_char(o.fd_run,'hh24:mi') fc_time,
        o.fd_run + (o.fn_duration/(24*60)) fd_end,
        decode(o.fl_hightechno,1,'Да','Нет') fc_hihjtech,
        (select max(i.fk_smid)
          from asu.tib i where i.fk_pacid = v.fk_id and i.fk_smeditid = (select max(fk_id) from asu.tsmid where fc_synonim = v_syn_sroch)) fk_sroch
       from asu.vnaz v, asu.tnazoper o
       where v.fk_id = pFK_NAZID
             and o.fk_nazid = v.fk_id)) loop
      --Res := Res||'Запланированная операция '||c.fc_ownerOperName||'#';
      Res := Res||'<B>Название операции</B> '||c.fc_name||'<NL>';
      Res := Res||'<B>Срочность</B> '||c.fc_sroch||'<NL>';
      Res := Res||'<B>Дата начала операции</B> '||c.fc_date||' Время '||c.fc_time||'<NL>';
      Res := Res||'<B>Дата окончания операции</B> '||c.fc_enddate||' Время '||c.fc_endtime||' Длительность: '||c.fn_duration||' мин'||'<NL>';
      Res := Res||'<B>Группа хирургов</B> '||initcap(c.operlist)||'<NL>';
      Res := Res||'<B>Бригада трансфузилогов</B> '||initcap(c.tranfuslist)||'<NL>';
      Res := Res||'<B>Операционная мед.сестра</B> '||initcap(c.bloklist)||'<NL>';
      Res := Res||'<B>Группа анестезиологов</B> '||initcap(c.anestlist)||'<NL>';
      Res := Res||'<B>Вид анастезии</B> '||c.fc_anestid||'<NL>';
      Res := Res||'<B>Операционная</B> '||c.fc_operroom||' Стол '||TO_CHAR(c.fn_opertable)||'<NL>';
      Res := Res||'<B>Высокотехнологическая</B> '||c.fc_hihjtech;
   end loop;
   if Res is Null then
    Return 'Информация об операции';
   END IF;
   RETURN Res;
EXCEPTION
  WHEN OTHERS THEN
        Return 'Информация об операции';
END;
/

SHOW ERRORS;


