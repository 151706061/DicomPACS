DROP TRIGGER ASU.TSMID_RIGHTG_GROUP_SYNC
/

--
-- TSMID_RIGHTG_GROUP_SYNC  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TSOTRGROUP (Table)
--   TSMID_RIGHTS (Table)
--   TSMID_RIGHTS_GROUP (Table)
--   TSMID_RIGHT_SOTR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_RIGHTG_GROUP_SYNC" 
 BEFORE
 INSERT OR DELETE OR UPDATE
 ON ASU.TSMID_RIGHTS_GROUP  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  if INSERTING then

    for c in (select FK_SOTRID
              FROM ASU.TSOTRGROUP
              WHERE FK_GROUPID = :NEW.FK_GROUPID
                        AND FK_SOTRID
                        NOT IN (SELECT FK_SOTRID FROM ASU.TSMID_RIGHT_SOTR WHERE FK_SMID = :NEW.FK_SMID)) LOOP
    begin
        INSERT INTO ASU.TSMID_RIGHTS(FK_SOTRID, FK_SMID) VALUES (c.FK_SOTRID, :NEW.FK_SMID);
    exception
      when others then
        if sqlcode = -6512 then
          null;
        end if;
    end;
    END LOOP;
  elsif DELETING then
        DELETE FROM ASU.TSMID_RIGHTS WHERE FK_SMID = :OLD.FK_SMID
                                           AND FK_SOTRID IN (select FK_SOTRID
                                                             FROM ASU.TSOTRGROUP
                                                             WHERE FK_GROUPID = :OLD.FK_GROUPID
                                                                   AND FK_SOTRID
                                                                   NOT IN (SELECT FK_SOTRID FROM ASU.TSMID_RIGHT_SOTR WHERE FK_SMID = :OLD.FK_SMID));
  elsif UPDATING then
  null;
  end if;
END;
/
SHOW ERRORS;


