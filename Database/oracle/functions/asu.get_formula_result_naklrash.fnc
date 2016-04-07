DROP FUNCTION ASU.GET_FORMULA_RESULT_NAKLRASH
/

--
-- GET_FORMULA_RESULT_NAKLRASH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TOTDEL (Table)
--   THEAL (Table)
--   TROOM (Table)
--   TROOMPARAMS (Table)
--   TROOMTYPEPARAM (Table)
--   TKORP (Table)
--   TS_NAKLRASH (Table)
--   TS_NAMES (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_formula_result_naklrash(pFormula in varchar2, pSum in number, pHealID in number default null) return number is
  cursor cVal is
    select n.fk_id,n.fk_name,s.fc_name,n.fn_price
      from buh.ts_naklrash n, buh.ts_names s
     where n.fk_name = s.fk_id
    union all
    select rp.fk_uid,rp.fk_uid,r.fc_palata || ' - ' || rtp.fc_name ||' ('|| nvl(k.fc_name,'Ќе выбран') ||' - '|| o.fc_name ||')' fc_name,rp.fn_value
  from asu.troom r
  left join login.totdel o on r.fk_otdelid = o.fk_id
  left join asu.tkorp k on r.fk_korpid = k.fk_id
  join asu.troomparams rp on rp.fk_roomid = r.fk_id 
   and rp.fl_isroom = 1 and rp.fk_id in (select fk_id from asu.troomparams r,(select r.fk_roomtypeparamid,r.fk_roomid,r.fk_uid,
     max(nvl(r.fd_begin,sysdate)) dt from asu.troomparams r group by r.fk_roomtypeparamid,r.fk_roomid,r.fk_uid) t
     where r.fk_uid = t.fk_uid and nvl(r.fd_begin,sysdate) = t.dt)
  left join asu.troomtypeparam rtp on rtp.fk_id = rp.fk_roomtypeparamid;
  cursor c is
    select h.fn_dlit, h.fn_dlit_uet from asu.theal h where h.fk_id = pHealID;
  sFormula varchar2(32767);
  nRes number;
  nDlit number;
  nDlitUET number;
s varchar2(100);
begin
  nRes:=pSum;

  open c;
  fetch c into ndlit,ndlituet;
  if c%notfound then ndlit := 0; ndlituet:=0; end if;
  close c;

  if pFormula is not null then
    sFormula:=lower(pFormula);
    sFormula:=replace(sFormula, 'x', to_char(pSum));
    sFormula:=replace(sFormula,'[длительность (минут):-1]', to_char(ndlit));
    sFormula:=replace(sFormula,'[длительность (ует):-2]', to_char(nDlitUET));
    for C in cVal loop
      s := '['||lower(to_char(C.FC_NAME))||':'||to_char(C.FK_ID)||']';
      sFormula:=replace(sFormula, s,
       to_char(C.Fn_Price));
    end loop;
    sFormula:='select '||sFormula||' from dual';
    execute immediate sFormula into nRes;
  end if;

  return(nRes);

  exception
    when others then return(0);
end;
/

SHOW ERRORS;


