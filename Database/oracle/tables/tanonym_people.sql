ALTER TABLE ASU.TANONYM_PEOPLE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TANONYM_PEOPLE CASCADE CONSTRAINTS
/

--
-- TANONYM_PEOPLE  (Table) 
--
CREATE TABLE ASU.TANONYM_PEOPLE
(
  FK_ID         NUMBER(15)                      NOT NULL,
  FC_FAM        VARCHAR2(30 BYTE),
  FC_IM         VARCHAR2(30 BYTE),
  FC_OTCH       VARCHAR2(30 BYTE),
  FP_SEX        NUMBER(1)                       DEFAULT -1,
  FD_ROJD       DATE,
  FK_DOCVID     NUMBER(15)                      DEFAULT -1,
  FC_DOCSER     VARCHAR2(10 BYTE),
  FC_DOCNUM     VARCHAR2(10 BYTE),
  FD_DOCDATE    DATE,
  FC_DOCVIDAN   VARCHAR2(100 BYTE),
  FC_RABOTA     VARCHAR2(255 BYTE),
  FC_PHONE      VARCHAR2(30 BYTE),
  FC_FAX        VARCHAR2(30 BYTE),
  FC_E_MAIL     VARCHAR2(40 BYTE),
  FC_HTTP       VARCHAR2(100 BYTE),
  FK_COMPANYID  NUMBER(15)                      DEFAULT -1,
  FK_OTDEL      NUMBER(15)                      DEFAULT -1,
  FK_DOLGNOST   NUMBER(15)                      DEFAULT -1,
  FC_ROJDPLACE  VARCHAR2(200 BYTE),
  FK_GROUPID    NUMBER(15)                      DEFAULT -1
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

COMMENT ON TABLE ASU.TANONYM_PEOPLE IS 'Хранилище персональных данных для обезличенных личностей Author: Spasskiy S.N.'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FK_ID IS 'SEQUENCE=[SEQ_ANONIM_PEOPLE]'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_FAM IS 'Фамилия'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_IM IS 'Имя'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_OTCH IS 'Отчество'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FP_SEX IS 'пол'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FD_ROJD IS 'дата рождения'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FK_DOCVID IS 'вид документа удостоверяющего личность'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_DOCSER IS 'серия документа'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_DOCNUM IS 'номер документа'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FD_DOCDATE IS 'дата выдачи документа'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_DOCVIDAN IS 'место выдачи документа'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_RABOTA IS 'место работы'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_PHONE IS 'телефон'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_FAX IS 'факс'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_E_MAIL IS 'мыло'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_HTTP IS 'пага'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FK_COMPANYID IS 'Место работы'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FK_OTDEL IS 'Отдел (цех и т.п.) предприятия'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FK_DOLGNOST IS 'Занимаемая должность'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FC_ROJDPLACE IS 'Место рождения'
/

COMMENT ON COLUMN ASU.TANONYM_PEOPLE.FK_GROUPID IS 'Группа отбора'
/


--
-- IX_TANONIM_PEOPLES_BY_FAM  (Index) 
--
--  Dependencies: 
--   TANONYM_PEOPLE (Table)
--
CREATE INDEX ASU.IX_TANONIM_PEOPLES_BY_FAM ON ASU.TANONYM_PEOPLE
(FC_FAM)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          5888K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- PK_TANONYM_PEOPLE  (Index) 
--
--  Dependencies: 
--   TANONYM_PEOPLE (Table)
--
CREATE UNIQUE INDEX ASU.PK_TANONYM_PEOPLE ON ASU.TANONYM_PEOPLE
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
-- TANONYM_PEOPLE$BI  (Trigger) 
--
--  Dependencies: 
--   TANONYM_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TANONYM_PEOPLE$BI" before insert
on ASU.TANONYM_PEOPLE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "FK_ID" uses sequence ASU.SEQ_ANONIM_PEOPLE
    select ASU.SEQ_ANONIM_PEOPLE.NEXTVAL INTO :new.FK_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TANONYM_PEOPLE 
-- 
ALTER TABLE ASU.TANONYM_PEOPLE ADD (
  CONSTRAINT PK_TANONYM_PEOPLE
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
               ))
/

