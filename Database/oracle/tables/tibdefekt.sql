DROP TABLE ASU.TIBDEFEKT CASCADE CONSTRAINTS
/

--
-- TIBDEFEKT  (Table) 
--
CREATE TABLE ASU.TIBDEFEKT
(
  FK_ID       NUMBER(15)                        DEFAULT -1                    NOT NULL,
  FK_VRACHID  NUMBER(15)                        DEFAULT -1                    NOT NULL,
  FK_CLOBID   NUMBER(15)                        DEFAULT -1                    NOT NULL,
  FD_DATE     DATE                              DEFAULT sysdate,
  FL_PODPIS   NUMBER(1)                         DEFAULT 0                     NOT NULL,
  FK_PACID    NUMBER(15)                        DEFAULT -1
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

COMMENT ON TABLE ASU.TIBDEFEKT IS 'Таблица с замечаниями по ведению истории болезни'
/

COMMENT ON COLUMN ASU.TIBDEFEKT.FK_ID IS 'SEQUENCE=[SEQ_TIBDEFEKT]'
/

COMMENT ON COLUMN ASU.TIBDEFEKT.FK_VRACHID IS 'код врача сделавшего замечания'
/

COMMENT ON COLUMN ASU.TIBDEFEKT.FK_CLOBID IS 'код клоба в котором храниться текст замечания'
/

COMMENT ON COLUMN ASU.TIBDEFEKT.FD_DATE IS 'дата последнего изменения замечания'
/

COMMENT ON COLUMN ASU.TIBDEFEKT.FL_PODPIS IS 'подписано ли это замечание'
/

COMMENT ON COLUMN ASU.TIBDEFEKT.FK_PACID IS 'код пациента к ИБ которой написаны замечания'
/


--
-- TIBDEFEKT_BY_VRACH_DATE_PODP  (Index) 
--
--  Dependencies: 
--   TIBDEFEKT (Table)
--
CREATE INDEX ASU.TIBDEFEKT_BY_VRACH_DATE_PODP ON ASU.TIBDEFEKT
(FK_VRACHID, FD_DATE, FL_PODPIS)
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
-- TIBDEFEKT$PACID  (Index) 
--
--  Dependencies: 
--   TIBDEFEKT (Table)
--
CREATE UNIQUE INDEX ASU.TIBDEFEKT$PACID ON ASU.TIBDEFEKT
(FK_PACID)
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
-- TIBDEFEKT_INSERT  (Trigger) 
--
--  Dependencies: 
--   TIBDEFEKT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBDEFEKT_INSERT" 
BEFORE INSERT
ON ASU.TIBDEFEKT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  select seq_TIBDEFEKT.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


--
-- TIBDEFEKT_DELETE  (Trigger) 
--
--  Dependencies: 
--   TIBDEFEKT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBDEFEKT_DELETE" 
AFTER INSERT
ON ASU.TIBDEFEKT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  delete from tclobs where fk_id = :old.fk_clobid;
End;
/
SHOW ERRORS;


