DROP TRIGGER ASU.TRASPIS_AUDIT
/

--
-- TRASPIS_AUDIT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$SESSION (Synonym)
--   DBMS_STANDARD (Package)
--   TLOGMAN (Table)
--   TRASPIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS_AUDIT" 
 AFTER 
 INSERT OR DELETE OR UPDATE
 ON ASU.TRASPIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  ou varchar2(100);
  mc varchar2(100);
  tr varchar2(100);
  pr varchar2(100);
  ci varchar2(100);
  lt date;
  nsotrid number;
  data1 date;
  data2 date;
  str varchar2(100);
  cursor c is select OSUSER, MACHINE, TERMINAL, PROGRAM, CLIENT_INFO, LOGON_TIME from v$session where audsid=userenv('sessionid');
/*  cursor sotr is
  select nvl(fk_sotrid,0) from tnazvrach n,traspis r
      where  fk_nazvrachid=n.fk_id and r.fk_id=:old.fk_id;*/
      
begin
    open c;
    fetch c into ou, mc, tr, pr, ci, lt;
    close c;
/*    open sotr;
    fetch sotr into nsotrid;
    close sotr;*/ 
  if inserting then
/*    select max(fd_date) into data2 from asu.tgraph
         where fk_raspid=:new.fk_id;
    select min(fd_date) into data1 from asu.tgraph
         where fk_raspid=:new.fk_id;
    str:=to_char(data1,'dd.mm.yyyy')||'-'||to_char(data2,'dd.mm.yyyy');*/ 
    insert into TLOGMAN(sotrid,change_date,osuser,machine,terminal,program,logon_time,fc_comment,
                        fk_owner,fc_period) 
    values (ci,sysdate,ou,mc,tr,pr,lt,'Добавление',
                        :new.fk_nazvrachid,'');
  elsif updating then
/*    select max(fd_date) into data2 from asu.tgraph
         where fk_raspid=:new.fk_id;
    select min(fd_date) into data1 from asu.tgraph
         where fk_raspid=:new.fk_id;
    str:=to_char(data1,'dd.mm.yyyy')||'-'||to_char(data2,'dd.mm.yyyy');*/ 
    insert into TLOGMAN(sotrid,change_date,osuser,machine,terminal,program,logon_time,fc_comment,
                        fk_owner,fc_period) 
    values (ci,sysdate,ou,mc,tr,pr,lt,'Изменение',
                        :old.fk_nazvrachid,'');
  else 
/*    select max(fd_date) into data2 from asu.tgraph
         where fk_raspid=:old.fk_id;
    select min(fd_date) into data1 from asu.tgraph
         where fk_raspid=:old.fk_id;
    str:=to_char(data1,'dd.mm.yyyy')||'-'||to_char(data2,'dd.mm.yyyy');*/ 
    insert into TLOGMAN(sotrid,change_date,osuser,machine,terminal,program,logon_time,fc_comment,
                        fk_owner,fc_period) 
    values (ci,sysdate,ou,mc,tr,pr,lt,'Удаление',
                        :old.fk_nazvrachid,'');
  end if;    
end;
/
SHOW ERRORS;


