DROP TABLE ASU.TSMID_RIGHTS_GROUP CASCADE CONSTRAINTS
/

--
-- TSMID_RIGHTS_GROUP  (Table) 
--
CREATE TABLE ASU.TSMID_RIGHTS_GROUP
(
  FK_GROUPID  NUMBER,
  FK_SMID     NUMBER
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

COMMENT ON TABLE ASU.TSMID_RIGHTS_GROUP IS 'Права доступа групп к СМИДУ'
/


--
-- TSMID_RIGHTS_GROUP$SMID  (Index) 
--
--  Dependencies: 
--   TSMID_RIGHTS_GROUP (Table)
--
CREATE UNIQUE INDEX ASU.TSMID_RIGHTS_GROUP$SMID ON ASU.TSMID_RIGHTS_GROUP
(FK_SMID, FK_GROUPID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_RIGTHS_GROUP$GROUP  (Index) 
--
--  Dependencies: 
--   TSMID_RIGHTS_GROUP (Table)
--
CREATE UNIQUE INDEX ASU.TSMID_RIGTHS_GROUP$GROUP ON ASU.TSMID_RIGHTS_GROUP
(FK_GROUPID, FK_SMID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSMID_RIGHTG_GROUP_SYNC  (Trigger) 
--
--  Dependencies: 
--   TSMID_RIGHTS_GROUP (Table)
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


