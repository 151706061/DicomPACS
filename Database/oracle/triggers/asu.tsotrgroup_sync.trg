DROP TRIGGER ASU.TSOTRGROUP_SYNC
/

--
-- TSOTRGROUP_SYNC  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TSOTRGROUP (Table)
--   TSMID_RIGHTS (Table)
--   TSMID_RIGHTS_GROUP (Table)
--   TSMID_RIGHT_SOTR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSOTRGROUP_SYNC" 
 BEFORE
 INSERT OR DELETE OR UPDATE
 ON ASU.TSOTRGROUP  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  if INSERTING then

    for c in (select FK_SMID
              FROM ASU.TSMID_RIGHTS_GROUP
              WHERE FK_GROUPID = :NEW.FK_GROUPID
                        AND FK_SMID
                        NOT IN (SELECT FK_SMID FROM ASU.TSMID_RIGHT_SOTR WHERE FK_SOTRID = :NEW.FK_SOTRID)) LOOP
    begin
        INSERT INTO ASU.TSMID_RIGHTS(FK_SOTRID, FK_SMID) VALUES (:NEW.FK_SOTRID, c.FK_SMID);
    exception
      when others then
        if sqlcode = -6512 then
          null;
        end if;
    end;
    END LOOP;
  elsif DELETING then
        DELETE FROM ASU.TSMID_RIGHTS WHERE FK_SOTRID = :OLD.FK_SOTRID AND FK_SMID IN (select FK_SMID
                                                       FROM ASU.TSMID_RIGHTS_GROUP
                                                       WHERE FK_GROUPID = :OLD.FK_GROUPID
                                                       AND FK_SMID
                                                       NOT IN (SELECT FK_SMID FROM ASU.TSMID_RIGHT_SOTR WHERE FK_SOTRID = :OLD.FK_SOTRID));
  elsif UPDATING then
  null;
  end if;
end;
/
SHOW ERRORS;


