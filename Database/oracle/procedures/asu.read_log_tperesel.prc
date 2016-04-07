DROP PROCEDURE ASU.READ_LOG_TPERESEL
/

--
-- READ_LOG_TPERESEL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_OUTPUT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   T_TEMP (Table)
--   TLOG (Table)
--
CREATE OR REPLACE PROCEDURE ASU."READ_LOG_TPERESEL" 
   ( pID IN NUMBER)
   IS

-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------       
-- Nefedov S.M. 17.04.2007
CURSOR cc (pPerID in NUMBER, pPerOldID in NUMBER) IS 
    select * from TLOG
            where fc_table = 'TPERESEL' 
            and fk_id >= pPerID
            and fk_id < pPerOldID
            order by fk_id;
nFlg NUMBER;
nFlg1 NUMBER;
pTableName VARCHAR2 (30);
pOldID NUMBER;
BEGIN
    pTableName:='TPERESEL';
    select max(fk_id)+15 into pOldID from TLOG where fc_table = 'TPERESEL' and fc_field = 'FK_PACID'
                    and fc_action = 'INSERT' and fc_new = pID   ;
    for c in (select * from TLOG
        where fc_table = 'TPERESEL' and fk_id >= (
        select min(fk_id)-15 from TLOG where fc_table = 'TPERESEL' and fc_field = 'FK_PACID'
                and fc_action = 'INSERT' and fc_new = pID
        ) and fk_id <= (
                
        select max(fk_id)+15 from TLOG where fc_table = 'TPERESEL' and fc_field = 'FK_PACID'
                and fc_action = 'INSERT' and fc_new = pID       
        )
        order by fk_id desc)
    loop
        if c.fc_field = 'FK_PACID' then
            if (c.fc_new = pID or c.fc_old = pID) then
                nFlg1:=1;
            else
                nFlg1:=0;
            end if;
        end if;
        if nFlg1 = 1 then
            if c.fc_field = 'FK_ID' and c.fc_action = 'INSERT' then
            for cc1 in cc (c.fk_id, pOldID)
                loop
                    if cc1.fc_field = 'FK_ID' then
                        if (cc1.fc_old = c.fc_new or cc1.fc_new = c.fc_new) then
                            nFlg:= 1;
                            if cc1.fc_action = 'INSERT' then
                                insert into BUH.T_TEMP (FN_D) values (cc1.fk_id);
                            end if;
                        else 
                            nFlg:= 0;
                        end if;
                    else
                        if nFlg = 1 then
                            dbms_output.put_line(cc1.fk_id||' '||cc1.fc_table||' '||cc1.fc_field
                            ||' '||cc1.fc_action||' '||cc1.fc_old||' '||cc1.fc_new||' '||cc1.fc_osuser
                            ||' '||cc1.fc_machine||' '||cc1.fc_terminal||' '||cc1.fc_module||' '||cc1.fc_osform
                            ||cc1.fn_userid||' '||cc1.fd_logontime||' '||cc1.fc_process); 
                            insert into BUH.T_TEMP (FN_D) values (cc1.fk_id);
                        end if;
                    end if;
                end loop;
                pOldID:=c.fk_id;
            end if;
        
        end if;
    end loop;
END; -- Procedure
/

SHOW ERRORS;


