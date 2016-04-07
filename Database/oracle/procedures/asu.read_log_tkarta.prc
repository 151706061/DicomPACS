DROP PROCEDURE ASU.READ_LOG_TKARTA
/

--
-- READ_LOG_TKARTA  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_OUTPUT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   T_TEMP (Table)
--   TLOG (Table)
--
CREATE OR REPLACE PROCEDURE ASU."READ_LOG_TKARTA" 
   ( pID IN NUMBER)
   IS

-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------       
-- Nefedov S.M. 17.04.2007
nFlg NUMBER;
pTableName VARCHAR2 (30);
BEGIN
    pTableName:='TKARTA';

    for c in (select * from TLOG
        where fc_table = pTableName and fk_id >= (
        select fk_id from TLOG where fc_table = pTableName and fc_field = 'FK_ID'
                and fc_action = 'INSERT' and fc_new = pID
        ) and (fk_id - 15) <= (
                
        select max(fk_id) from TLOG where fc_table = pTableName and fc_field = 'FK_ID'
                and (fc_new = pID or fc_old = pID)       
        ) order by fk_id)
    loop
        if c.fc_field = 'FK_ID' then
            if (c.fc_old = pID or c.fc_new = pID) then
                nFlg:= 1;
                if c.fc_action = 'INSERT' then
                    insert into BUH.T_TEMP (FN_D) values (c.fk_id);
                end if;
            else 
                nFlg:= 0;
            end if;
        else
            if nFlg = 1 then
                dbms_output.put_line(c.fk_id||' '||c.fc_table||' '||c.fc_field
                ||' '||c.fc_action||' '||c.fc_old||' '||c.fc_new||' '||c.fc_osuser
                ||' '||c.fc_machine||' '||c.fc_terminal||' '||c.fc_module||' '||c.fc_osform
                ||c.fn_userid||' '||c.fd_logontime||' '||c.fc_process); 
                insert into BUH.T_TEMP (FN_D) values (c.fk_id);
            end if;
        end if;
    end loop;
END; -- Procedure
/

SHOW ERRORS;


