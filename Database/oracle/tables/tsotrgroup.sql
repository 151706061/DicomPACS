DROP TABLE ASU.TSOTRGROUP CASCADE CONSTRAINTS
/

--
-- TSOTRGROUP  (Table) 
--
CREATE TABLE ASU.TSOTRGROUP
(
  FK_ID       NUMBER,
  FK_SOTRID   NUMBER,
  FK_GROUPID  NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TSOTRGROUP IS 'Принадлежность сотрудников группе Author:Kulbatsky D.'
/

COMMENT ON COLUMN ASU.TSOTRGROUP.FK_ID IS '[ID=SEQ_GROUPRIGHT]'
/

COMMENT ON COLUMN ASU.TSOTRGROUP.FK_SOTRID IS 'LOGIN.TSOTR.FK_ID'
/

COMMENT ON COLUMN ASU.TSOTRGROUP.FK_GROUPID IS 'ASU.TGROUPRIGHT.FK_ID'
/


--
-- TSOTRGROUP_SYNC  (Trigger) 
--
--  Dependencies: 
--   TSOTRGROUP (Table)
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


--
-- TSOTRGROUP$BI  (Trigger) 
--
--  Dependencies: 
--   TSOTRGROUP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSOTRGROUP$BI" 
 BEFORE
 INSERT
 ON ASU.TSOTRGROUP  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
    SELECT SEQ_GROUPRIGHT.NextVal INTO :NEW.FK_ID FROM DUAL;
end;
/
SHOW ERRORS;


