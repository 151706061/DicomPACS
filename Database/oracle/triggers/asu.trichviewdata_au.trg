DROP TRIGGER ASU.TRICHVIEWDATA_AU
/

--
-- TRICHVIEWDATA_AU  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   ORA_USERS (Table)
--   TRICHVIEWDATA (Table)
--   TRICHVIEWDATA_CHNG_LOG (Table)
--   TSOTR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRICHVIEWDATA_AU" 
  after insert or update or delete on asu.trichviewdata
  for each row
declare
  v_fkid number;
  v_act number(1);
  v_name varchar2(250);
begin
if updating then
  v_act:=1;
  v_fkid := :new.fk_id;
elsif inserting then
  v_act:=0;
  v_fkid := :new.fk_id;
elsif deleting then
  v_act:=2;
  v_fkid := :old.fk_id;
end if;

begin
  select max(s.fc_fam||' '||s.fc_name||' '||s.fc_otch) into v_name from login.ora_users u, login.tsotr s where u.fk_peplid=s.fk_peplid and u.fc_login=ltrim(SYS_CONTEXT('USERENV','SESSION_USER'),'Z');
exception when others then
  v_name:='';
end;

insert into asu.trichviewdata_chng_log values (v_fkid,
SYS_CONTEXT('USERENV','OS_USER'),
SYS_CONTEXT('USERENV','SESSION_USER'),
SYS_CONTEXT('USERENV','HOST'),
SYS_CONTEXT('USERENV','IP_ADDRESS'),
SYS_CONTEXT('USERENV','MODULE'),
SYS_CONTEXT('USERENV','ACTION'),
systimestamp,
v_act,
v_name);

end trichviewdata_au;
/
SHOW ERRORS;


