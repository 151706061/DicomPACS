DROP PACKAGE BODY ASU.PKG_INFOPANEL
/

--
-- PKG_INFOPANEL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_INFOPANEL" 
is
  function get_timeint_today(pKABVRACHID NUMBER, pSCHEMAID NUMBER:=0) return varchar2
   is
     cursor c is select to_char(min(to_date(to_char(trunc(tg.fd_date),'dd.mm.yyyy')||' '||tg.ft_hour||':'||tg.ft_min,'dd.mm.yyyy hh24:mi')),'hh24:mi') pmint,
                      to_char(max(to_date(to_char(trunc(tg.fd_date),'dd.mm.yyyy')||' '||tg.ft_hour||':'||tg.ft_min,'dd.mm.yyyy hh24:mi')),'hh24:mi') pmaxt
                  from traspis_schema tr, tgraph tg
                  where tg.fk_raspid=tr.fk_graphid
                  and tr.fk_nazvrachid=pKABVRACHID
                  and trunc(tg.fd_date)=trunc(sysdate)
                  and tr.fk_schemaid=pSCHEMAID; --get_synid('REGISTRATION_SCHEMA_COMMON');
     cursor c1 is select to_char(min(to_date(to_char(trunc(tg.fd_date),'dd.mm.yyyy')||' '||tg.ft_hour||':'||tg.ft_min,'dd.mm.yyyy hh24:mi')),'hh24:mi') pmint,
                      to_char(max(to_date(to_char(trunc(tg.fd_date),'dd.mm.yyyy')||' '||tg.ft_hour||':'||tg.ft_min,'dd.mm.yyyy hh24:mi')),'hh24:mi') pmaxt
                  from traspis tr, tgraph tg
                  where tg.fk_raspid=tr.fk_graphid
                  and tr.fk_nazvrachid=pKABVRACHID
                  and trunc(tg.fd_date)=trunc(sysdate); --get_synid('REGISTRATION_SCHEMA_COMMON');
     v_min varchar2(5):='';
     v_max varchar2(5):='';
   begin
     if pSCHEMAID=0 then
       open c1;
       fetch c1 into v_min,v_max;
       close c1;
      else
       open c;
       fetch c into v_min,v_max;
       close c;
     end if;
     if length(v_min)>0 then
       return v_min||' - '||v_max;
     end if;
     return '';

   end;

end;
/

SHOW ERRORS;


