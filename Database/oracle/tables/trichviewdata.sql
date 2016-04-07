ALTER TABLE ASU.TRICHVIEWDATA
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRICHVIEWDATA CASCADE CONSTRAINTS
/

--
-- TRICHVIEWDATA  (Table) 
--
CREATE TABLE ASU.TRICHVIEWDATA
(
  FK_ID        INTEGER                          NOT NULL,
  FK_PACID     INTEGER                          NOT NULL,
  FB_BLOB      BLOB,
  FN_COMPRESS  INTEGER                          NOT NULL,
  FB_HTML      CLOB,
  FB_TEXT      CLOB
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          398688K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
LOB (FB_BLOB) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE USR
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          64K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (FB_HTML) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE USR
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          64K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (FB_TEXT) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE USR
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          64K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
NOCACHE
NOPARALLEL
MONITORING
ENABLE ROW MOVEMENT
/

COMMENT ON COLUMN ASU.TRICHVIEWDATA.FK_ID IS 'SEQUENCE=[SEQ_TRICHVIEWDATA]'
/

COMMENT ON COLUMN ASU.TRICHVIEWDATA.FN_COMPRESS IS 'ТИП компресси, 0 - нет, 1 - станрдртно DOA'
/

COMMENT ON COLUMN ASU.TRICHVIEWDATA.FB_HTML IS 'html'
/

COMMENT ON COLUMN ASU.TRICHVIEWDATA.FB_TEXT IS 'Текст'
/


--
-- PK_TRICHVIEWDATA  (Index) 
--
--  Dependencies: 
--   TRICHVIEWDATA (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRICHVIEWDATA ON ASU.TRICHVIEWDATA
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1280K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRICHVIEWDATA_PACID  (Index) 
--
--  Dependencies: 
--   TRICHVIEWDATA (Table)
--
CREATE INDEX ASU.TRICHVIEWDATA_PACID ON ASU.TRICHVIEWDATA
(FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2176K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRICHVIEWDATA_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRICHVIEWDATA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRICHVIEWDATA_BEFOR_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRICHVIEWDATA  FOR EACH ROW
BEGIN
    if :new.FK_ID is null then
      select SEQ_TRICHVIEWDATA.NEXTVAL INTO :new.FK_ID from dual;
    end if;
END;
/
SHOW ERRORS;


--
-- TRICHVIEWDATA_AU  (Trigger) 
--
--  Dependencies: 
--   TRICHVIEWDATA (Table)
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


-- 
-- Non Foreign Key Constraints for Table TRICHVIEWDATA 
-- 
ALTER TABLE ASU.TRICHVIEWDATA ADD (
  CONSTRAINT PK_TRICHVIEWDATA
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          1280K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

