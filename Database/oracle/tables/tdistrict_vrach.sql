ALTER TABLE ASU.TDISTRICT_VRACH
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TDISTRICT_VRACH CASCADE CONSTRAINTS
/

--
-- TDISTRICT_VRACH  (Table) 
--
CREATE TABLE ASU.TDISTRICT_VRACH
(
  FK_ID            NUMBER                       NOT NULL,
  FK_DIST_NAME_ID  NUMBER                       NOT NULL,
  FK_SOTR          NUMBER                       NOT NULL,
  FK_VRACHKAB      NUMBER
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

COMMENT ON TABLE ASU.TDISTRICT_VRACH IS 'Связка врачей и участков'
/

COMMENT ON COLUMN ASU.TDISTRICT_VRACH.FK_DIST_NAME_ID IS 'Ссылка на FK_ID из TDISTRICT_NAME'
/

COMMENT ON COLUMN ASU.TDISTRICT_VRACH.FK_SOTR IS 'Терапевт (TSOTR.FK_ID)'
/

COMMENT ON COLUMN ASU.TDISTRICT_VRACH.FK_VRACHKAB IS 'TVRACHKAB.FK_ID (При добавлении участка добавляется осмотр участкового педиатраи кабинет FC_NAME)'
/


--
-- TDISTRICT_VRACH  (Index) 
--
--  Dependencies: 
--   TDISTRICT_VRACH (Table)
--
CREATE UNIQUE INDEX ASU.TDISTRICT_VRACH ON ASU.TDISTRICT_VRACH
(FK_DIST_NAME_ID, FK_SOTR)
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
-- TDISTRICT_VRACH_PK  (Index) 
--
--  Dependencies: 
--   TDISTRICT_VRACH (Table)
--
CREATE UNIQUE INDEX ASU.TDISTRICT_VRACH_PK ON ASU.TDISTRICT_VRACH
(FK_ID)
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
-- TDISTRICT_VRACH_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TDISTRICT_VRACH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDISTRICT_VRACH_BEFORE_INSERT" 
 BEFORE INSERT ON ASU.TDISTRICT_VRACH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 IF :NEW.FK_ID IS NULL THEN
  SELECT SEQ_TDISTRICT_VRACH.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
 END IF;
END;
/
SHOW ERRORS;


--
-- TDISTRICT_VRACH_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TDISTRICT_VRACH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDISTRICT_VRACH_AFTER_UPDATE"
  AFTER UPDATE OF FK_SOTR ON ASU.TDISTRICT_VRACH   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF :NEW.FK_DIST_NAME_ID IS NOT NULL THEN
    update ASU.TPEOPLES_DOPSTATUS
       set FL_TFOMS_STATUS = 0
     where FK_PEPLID in (
                  select p.FK_ID
                    from ASU.TDISTRICT_PACIENT tdp
                         inner join ASU.TPEOPLES p on tdp.FK_PEPLID = p.FK_ID
                         inner join ASU.TDISTRICT_NAME tdn on tdp.fk_arealid = tdn.fk_id
                         inner join ASU.TDISTRICT_VRACH DV on tdn.fk_id = dv.fk_dist_name_id
                         inner join ASU.TSOTR s on dv.fk_sotr = s.fk_id
                         inner join ASU.TPEOPLES_DOPSTATUS pd on pd.FK_PEPLID = p.FK_ID
                   where s.fl_del = 0
                     and ((tdn.fk_typeid = ASU.GET_SYNID('THERAPIST_AREA') and trunc(months_between(sysdate, p.FD_ROJD) / 12) > 17)
                      or  (tdn.fk_typeid = ASU.GET_SYNID('PEDIATR_AREA') and trunc(months_between(sysdate, p.FD_ROJD) / 12) <= 17))
                     and tdn.fk_id = :NEW.FK_DIST_NAME_ID
                     and pd.fl_status = 1
           );
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TDISTRICT_VRACH 
-- 
ALTER TABLE ASU.TDISTRICT_VRACH ADD (
  CONSTRAINT TDISTRICT_VRACH_PK
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ),
  CONSTRAINT TDISTRICT_VRACH
 UNIQUE (FK_DIST_NAME_ID, FK_SOTR)
    USING INDEX 
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
               ))
/

