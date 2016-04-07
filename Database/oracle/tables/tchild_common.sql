ALTER TABLE ASU.TCHILD_COMMON
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TCHILD_COMMON CASCADE CONSTRAINTS
/

--
-- TCHILD_COMMON  (Table) 
--
CREATE TABLE ASU.TCHILD_COMMON
(
  FK_PEPLID   NUMBER                            NOT NULL,
  FK_DIAGID   NUMBER,
  FD_AMBUL    DATE,
  FD_STAC     DATE,
  FD_SONAT    DATE,
  FD_DATE     DATE                              NOT NULL,
  FK_VRACHID  NUMBER                            NOT NULL,
  FK_HLIFEID  NUMBER                            DEFAULT 0                     NOT NULL,
  FN_HEALTH   NUMBER                            DEFAULT 4                     NOT NULL,
  FC_ALKO     CHAR(1 BYTE),
  FC_TABAK    CHAR(1 BYTE),
  FC_NARKO    CHAR(1 BYTE),
  FD_SPEC     DATE,
  FD_DSTAC    DATE
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

COMMENT ON TABLE ASU.TCHILD_COMMON IS 'Общие данные для педиатрического учёта -- Created by Galtsev I.A. - 17/05/2010'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FK_PEPLID IS 'ID ребенка = TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FK_DIAGID IS 'ID текущего диагноза = TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FD_AMBUL IS 'Дата амбулаторного лечения'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FD_STAC IS 'Дата лечения в стационаре'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FD_SONAT IS 'Дата лечения в санатории'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FD_DATE IS 'Дата создания/обновления записи'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FK_VRACHID IS 'ID врача, сделавшего/исправившего запись'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FK_HLIFEID IS 'ID трудной жизненой ситуации = TSMID.FK_ID для FK_OWNER=ASU.get_synid(''CHILD_HARDLIFE_TYPE'')'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FN_HEALTH IS 'Группа здоровья (от 1 до 4; 4 - здоров)'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FC_ALKO IS '''Y'' - Группа риска злоупотребления алкоголя'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FC_TABAK IS '''Y'' - Группа риска злоупотребления курением'
/

COMMENT ON COLUMN ASU.TCHILD_COMMON.FC_NARKO IS '''Y'' - Группа риска злоупотребления наркотиками'
/


--
-- TCHILD_PEOPL  (Index) 
--
--  Dependencies: 
--   TCHILD_COMMON (Table)
--
CREATE UNIQUE INDEX ASU.TCHILD_PEOPL ON ASU.TCHILD_COMMON
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
-- Non Foreign Key Constraints for Table TCHILD_COMMON 
-- 
ALTER TABLE ASU.TCHILD_COMMON ADD (
  CONSTRAINT TCHILD_PEOPL
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

