ALTER TABLE ASU.TNEONATAL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNEONATAL CASCADE CONSTRAINTS
/

--
-- TNEONATAL  (Table) 
--
CREATE TABLE ASU.TNEONATAL
(
  FK_PEPLID    NUMBER                           NOT NULL,
  FС_FROM0TO3  CHAR(1 BYTE),
  FС_FROM4TO6  CHAR(1 BYTE),
  FС_FROM7TO9  CHAR(1 BYTE),
  FD_DATE      DATE                             NOT NULL,
  FK_VRACHID   NUMBER                           NOT NULL,
  FK_DIAG      NUMBER,
  FN_GRP       NUMBER                           DEFAULT 10                    NOT NULL,
  FK_DOCTORID  NUMBER,
  FK_NURSEID   NUMBER
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

COMMENT ON TABLE ASU.TNEONATAL IS 'Учёт новородженных. Created by Galtsev I.A. - 14/05/2010'
/

COMMENT ON COLUMN ASU.TNEONATAL.FK_PEPLID IS 'ID новорожденного = TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TNEONATAL.FС_FROM0TO3 IS 'От 0 до 3 мес. ''N''-Естественное, ''A''-Искуственное, ''M''-Смешаное'
/

COMMENT ON COLUMN ASU.TNEONATAL.FС_FROM4TO6 IS 'От 4 до 6 мес. ''N''-Естественное, ''A''-Искуственное, ''M''-Смешаное'
/

COMMENT ON COLUMN ASU.TNEONATAL.FС_FROM7TO9 IS 'От 7 до 9 мес. ''N''-Естественное, ''A''-Искуственное, ''M''-Смешаное'
/

COMMENT ON COLUMN ASU.TNEONATAL.FD_DATE IS 'Дата создания/обновления записи'
/

COMMENT ON COLUMN ASU.TNEONATAL.FK_VRACHID IS 'ID врача, сделавшего запись = TSOTR.FK_ID'
/

COMMENT ON COLUMN ASU.TNEONATAL.FK_DIAG IS 'ID диагноза при рождении = TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TNEONATAL.FN_GRP IS 'Группа здоровья при рождении - от 1 до 10, здоров - 10'
/

COMMENT ON COLUMN ASU.TNEONATAL.FK_DOCTORID IS 'ID наблюдающего врача = TSOTR.FK_ID'
/

COMMENT ON COLUMN ASU.TNEONATAL.FK_NURSEID IS 'ID наблюдающей медсестры = TSOTR.FK_ID'
/


--
-- TNEONATAL_PEOPL  (Index) 
--
--  Dependencies: 
--   TNEONATAL (Table)
--
CREATE UNIQUE INDEX ASU.TNEONATAL_PEOPL ON ASU.TNEONATAL
(FK_PEPLID)
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
-- Non Foreign Key Constraints for Table TNEONATAL 
-- 
ALTER TABLE ASU.TNEONATAL ADD (
  CONSTRAINT TNEONATAL_PEOPL
 PRIMARY KEY
 (FK_PEPLID)
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

