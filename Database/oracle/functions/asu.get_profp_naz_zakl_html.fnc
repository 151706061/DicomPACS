DROP FUNCTION ASU.GET_PROFP_NAZ_ZAKL_HTML
/

--
-- GET_PROFP_NAZ_ZAKL_HTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPROFP_LIST_NAZ (Table)
--   TIB (Table)
--   TSMID (Table)
--   GET_SMIDNAME (Function)
--   GET_SYNID (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_profp_naz_zakl_html(pFK_NAZID IN NUMBER, PFK_SOTRID IN NUMBER DEFAULT 1) RETURN VARCHAR IS

-- СМ. ЕЩЕ asu.GET_PROFP_NAZ_ZAKL !!!!!!!!!!!!

  Res  Varchar2(4000);
  Res2 Varchar2(4000);
  Res3 Varchar2(4000);


  CURSOR c1_01 is
    SELECT nvl2(l.fc_vknumber, ('<div align=justify><B>Решение врачебной комиссии:</B></div><div align=justify>' || '№ ВК: ' || l.fc_vknumber || '</div><div align=justify>' || 'Дата ВК: ' || to_char(l.fd_vkdate, 'dd.mm.yyyy') || '</div><div align=justify>' || replace(l.fc_vkresult, chr(10), '<br>') || '</div>'), null) ||
           nvl2(fc_conclusion, '<div align=justify><B>Заключение:</B></div><div align=justify>' || replace(fc_conclusion, chr(10), '<br>') || '</div>' , null) ||
           nvl2(asu.get_smidname(fk_resid), '<div align=justify><B>Результат:</B></div><div align=justify>' || asu.get_smidname(fk_resid) || '</div>', null)

      FROM asu.tprofp_list_naz l
     WHERE fk_nazid = pFK_NAZID
       AND rownum < 2;


  CURSOR c1_02 is
    SELECT nvl2(fc_recommends, '<div align=justify><B>Рекомендации:</B>' || replace(fc_recommends, chr(10), '<br>'), null) || '</div>'

      FROM asu.tprofp_list_naz l
     WHERE fk_nazid = pFK_NAZID
       AND rownum < 2;


  CURSOR c2 is
--SELECT fc_name from(
--select   fc_name x
 /*

 (select fk_smid     from tib where fk_pacid in
 (select fk_id from tprofp_list_naz
where fk_listid IN (select fk_listid from asu.tprofp_list_naz where fk_nazid = pFK_NAZID) )
 and fk_smeditid=tsmid.fk_owner and fk_smid=tsmid.fk_id)x --INTO res2
   */

--from tsmid connect by prior fk_id=fk_owner start with fk_owner = get_synid('PAC_PROFP_NOTES')
    select asu.get_smidname(fk_smid) x
      from tib
     where fk_pacid in (select fk_id
                          from tprofp_list_naz

--      where fk_listid IN (select fk_listid from asu.tprofp_list_naz
where       fk_nazid = pFK_NAZID
  --     )
                       )
       and fk_smeditid = get_synid('PAC_PROFP_NOTES')
       and fk_smid IN (SELECT fk_id from asu.tsmid connect by prior fk_id = fk_owner start with fk_owner = get_synid('PAC_PROFP_NOTES') )
  ;


--//res=nvl2(res2,res2||'<NL>'||nvl2(res,res
--/--/res:=res;--//||nvl(res2,'1');

BEGIN
--  Return 'Заключение профпатолога';

  OPEN c1_01;
  FETCH c1_01 INTO res;
  CLOSE c1_01;

  FOR c in c2 loop
     res2:=res2 || '<div align=justify>' || c.x || '</div>';
  END LOOP;

  OPEN c1_02;
  FETCH c1_02 INTO res3;
  CLOSE c1_02;


--  if (trim(res) is null) then res := '1'; end if;
--  if (trim(res2) is null) then res2 := '2'; end if;
--  if (trim(res3) is null) then res3 := '3'; end if;

  if trim(nvl(trim(res), ' ') || nvl(trim(res2), ' ') || nvl(trim(res3), ' ')) is Null then
     Return 'Заключение профпатолога';
  END IF;

  RETURN (nvl(res, ' ') || nvl(res2, ' ') || nvl(res3, ' '));

EXCEPTION
  WHEN OTHERS
  THEN Return 'Заключение профпатолога';

END;
/

SHOW ERRORS;


