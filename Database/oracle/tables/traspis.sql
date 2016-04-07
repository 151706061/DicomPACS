DROP TABLE ASU.TRASPIS CASCADE CONSTRAINTS
/

--
-- TRASPIS  (Table) 
--
CREATE TABLE ASU.TRASPIS
(
  FK_ID                 NUMBER(15),
  FK_NAZVRACHID         NUMBER(15),
  FD_DATE               DATE,
  FK_GRAPHID            NUMBER(15),
  FL_SHOW               NUMBER(1)               DEFAULT 0,
  FD_SHOW_RASPIS        DATE                    DEFAULT trunc(SYSDATE),
  FL_SHOW_ON_SAMOZAPIS  NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TRASPIS IS 'Расписание кабинетов'
/

COMMENT ON COLUMN ASU.TRASPIS.FK_ID IS 'SEQUENCE=[SEQ_TRASPIS]'
/

COMMENT ON COLUMN ASU.TRASPIS.FK_NAZVRACHID IS 'Код кабинета TNAZVRACH.FK_ID'
/

COMMENT ON COLUMN ASU.TRASPIS.FD_DATE IS 'Дата'
/

COMMENT ON COLUMN ASU.TRASPIS.FK_GRAPHID IS 'TGRAPH.FK_ID'
/

COMMENT ON COLUMN ASU.TRASPIS.FL_SHOW IS '1- показывать в киоске; 0 - скрывать'
/

COMMENT ON COLUMN ASU.TRASPIS.FD_SHOW_RASPIS IS 'С какой даты отображать расписание( хотел взять FD_DATE, но не зная что или кто его может юзать сделал еще 1 поле)'
/


--
-- TRASPIS_GRAPHID  (Index) 
--
--  Dependencies: 
--   TRASPIS (Table)
--
CREATE INDEX ASU.TRASPIS_GRAPHID ON ASU.TRASPIS
(FK_GRAPHID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRASPIS_NAZVRACHID  (Index) 
--
--  Dependencies: 
--   TRASPIS (Table)
--
CREATE INDEX ASU.TRASPIS_NAZVRACHID ON ASU.TRASPIS
(FK_NAZVRACHID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRASPIS_LOG  (Trigger) 
--
--  Dependencies: 
--   TRASPIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TRASPIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if DELETING then
    PKG_LOG.Do_log('TRASPIS', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TRASPIS', 'FK_NAZVRACHID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_nazvrachid), null, :old.fk_id);
    PKG_LOG.Do_log('TRASPIS', 'FD_DATE', 'DELETE', PKG_LOG.GET_VALUE(:old.fd_date), null, :old.fk_id);
    PKG_LOG.Do_log('TRASPIS', 'FK_GRAPHID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_graphid), null, :old.fk_id);
  end if;
  null;
END TRASPIS_LOG;
/
SHOW ERRORS;


--
-- TRASPIS_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRASPIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS_BEFOR_INSERT" 
BEFORE INSERT
ON ASU.TRASPIS REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  select SEQ_TRASPIS.nextval, SYSDATE into :new.FK_ID, :new.FD_DATE from dual;
End;
/
SHOW ERRORS;


--
-- TRASPIS_BEFOR_DELETE  (Trigger) 
--
--  Dependencies: 
--   TRASPIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS_BEFOR_DELETE" 
 BEFORE 
 DELETE
 ON ASU.TRASPIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  sotr number;
  nTemp NUMBER;  
BEGIN
  SELECT fk_sotrid into sotr FROM tnazvrach WHERE fk_id=:old.fk_nazvrachid;
  UPDATE treslech SET fl_patfirst=0 WHERE fk_vrachid=sotr and fl_patfirst<>0;
END;
/
SHOW ERRORS;


--
-- TRASPIS_AUDIT  (Trigger) 
--
--  Dependencies: 
--   TRASPIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS_AUDIT" 
 AFTER 
 INSERT OR DELETE OR UPDATE
 ON ASU.TRASPIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  ou varchar2(100);
  mc varchar2(100);
  tr varchar2(100);
  pr varchar2(100);
  ci varchar2(100);
  lt date;
  nsotrid number;
  data1 date;
  data2 date;
  str varchar2(100);
  cursor c is select OSUSER, MACHINE, TERMINAL, PROGRAM, CLIENT_INFO, LOGON_TIME from v$session where audsid=userenv('sessionid');
/*  cursor sotr is
  select nvl(fk_sotrid,0) from tnazvrach n,traspis r
      where  fk_nazvrachid=n.fk_id and r.fk_id=:old.fk_id;*/
      
begin
    open c;
    fetch c into ou, mc, tr, pr, ci, lt;
    close c;
/*    open sotr;
    fetch sotr into nsotrid;
    close sotr;*/ 
  if inserting then
/*    select max(fd_date) into data2 from asu.tgraph
         where fk_raspid=:new.fk_id;
    select min(fd_date) into data1 from asu.tgraph
         where fk_raspid=:new.fk_id;
    str:=to_char(data1,'dd.mm.yyyy')||'-'||to_char(data2,'dd.mm.yyyy');*/ 
    insert into TLOGMAN(sotrid,change_date,osuser,machine,terminal,program,logon_time,fc_comment,
                        fk_owner,fc_period) 
    values (ci,sysdate,ou,mc,tr,pr,lt,'Добавление',
                        :new.fk_nazvrachid,'');
  elsif updating then
/*    select max(fd_date) into data2 from asu.tgraph
         where fk_raspid=:new.fk_id;
    select min(fd_date) into data1 from asu.tgraph
         where fk_raspid=:new.fk_id;
    str:=to_char(data1,'dd.mm.yyyy')||'-'||to_char(data2,'dd.mm.yyyy');*/ 
    insert into TLOGMAN(sotrid,change_date,osuser,machine,terminal,program,logon_time,fc_comment,
                        fk_owner,fc_period) 
    values (ci,sysdate,ou,mc,tr,pr,lt,'Изменение',
                        :old.fk_nazvrachid,'');
  else 
/*    select max(fd_date) into data2 from asu.tgraph
         where fk_raspid=:old.fk_id;
    select min(fd_date) into data1 from asu.tgraph
         where fk_raspid=:old.fk_id;
    str:=to_char(data1,'dd.mm.yyyy')||'-'||to_char(data2,'dd.mm.yyyy');*/ 
    insert into TLOGMAN(sotrid,change_date,osuser,machine,terminal,program,logon_time,fc_comment,
                        fk_owner,fc_period) 
    values (ci,sysdate,ou,mc,tr,pr,lt,'Удаление',
                        :old.fk_nazvrachid,'');
  end if;    
end;
/
SHOW ERRORS;


--
-- TRASPIS$WEB_REPLICATION  (Trigger) 
--
--  Dependencies: 
--   TRASPIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS$WEB_REPLICATION" 
 BEFORE
 INSERT OR DELETE OR UPDATE
 ON ASU.TRASPIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
    IF (:NEW.FL_SHOW <> :OLD.FL_SHOW)
        OR (:NEW.FL_SHOW IS NOT NULL AND :OLD.FL_SHOW IS NULL)
        OR (:OLD.FL_SHOW IS NOT NULL AND :NEW.FL_SHOW IS NULL)
        OR (:NEW.FL_SHOW_ON_SAMOZAPIS <> :OLD.FL_SHOW_ON_SAMOZAPIS)
        OR (:NEW.FL_SHOW_ON_SAMOZAPIS IS NOT NULL AND :OLD.FL_SHOW_ON_SAMOZAPIS IS NULL)
        OR (:OLD.FL_SHOW_ON_SAMOZAPIS IS NOT NULL AND :NEW.FL_SHOW_ON_SAMOZAPIS IS NULL) THEN

      if INSERTING then
         for c in (SELECT FK_SOTRID FROM ASU.TVRACHKAB WHERE FK_ID = :NEW.fk_nazvrachid) loop
              ASU.PKG_EXCH_SAMOZAPIS.DO_LOG('TSOTR', c.fk_sotrid, 'INSERT', 'TGRAPH$WEB_REPLICATION', SYSDATE);
         end loop;
      else
         for c in (SELECT FK_SOTRID FROM ASU.TVRACHKAB WHERE FK_ID = :OLD.fk_nazvrachid) loop
            ASU.PKG_EXCH_SAMOZAPIS.DO_LOG('TSOTR', c.fk_sotrid, 'INSERT', 'TGRAPH$WEB_REPLICATION', SYSDATE);
         end loop;
      end if;

    END IF;
END;
/
SHOW ERRORS;


