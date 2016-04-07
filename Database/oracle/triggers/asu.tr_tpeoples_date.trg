DROP TRIGGER ASU.TR_TPEOPLES_DATE
/

--
-- TR_TPEOPLES_DATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   CORRECTDATE_LOG (Table)
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TPEOPLES_DATE" 
     before INSERT OR UPDATE ON asu.tpeoples FOR EACH ROW
begin
   if :new.fd_rojd <= to_date('01.01.1880','dd.mm.yyyy') then
     :new.fd_rojd := null;
     insert into asu.CORRECTDATE_LOG (TAB, col, ID, DATE_INS, usr_module, usr_TERMINAL)
       values ('TPEOPLES','FD_ROJD', :new.fk_id, sysdate, SYS_CONTEXT ('USERENV','MODULE'), SYS_CONTEXT ('USERENV','TERMINAL'));
   end if;

   if :new.fd_docdate <= to_date('01.01.1880','dd.mm.yyyy') then
     :new.fd_docdate := null;
     insert into asu.CORRECTDATE_LOG (TAB, col, ID, DATE_INS, usr_module, usr_TERMINAL)
       values ('TPEOPLES','FD_DOCDATE', :new.fk_id, sysdate, SYS_CONTEXT ('USERENV','MODULE'), SYS_CONTEXT ('USERENV','TERMINAL'));
   end if;
exception when others then
     begin
       null;
     end;
end;
/
SHOW ERRORS;


