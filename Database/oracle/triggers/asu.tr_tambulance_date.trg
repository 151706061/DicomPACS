DROP TRIGGER ASU.TR_TAMBULANCE_DATE
/

--
-- TR_TAMBULANCE_DATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   CORRECTDATE_LOG (Table)
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TAMBULANCE_DATE" 
     before INSERT OR UPDATE ON asu.tambulance FOR EACH ROW
begin
   if :new.fd_rojd <= to_date('01.01.1880','dd.mm.yyyy') then
     :new.fd_rojd := null;
     insert into asu.CORRECTDATE_LOG (TAB, col, ID, DATE_INS, usr_module, usr_TERMINAL)
       values ('TAMBULANCE','FD_ROJD', :new.fk_id, sysdate, SYS_CONTEXT ('USERENV','MODULE'), SYS_CONTEXT ('USERENV','TERMINAL'));
   end if;
exception when others then
     begin
       null;
     end;
end;
/
SHOW ERRORS;


