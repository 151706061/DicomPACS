ALTER TABLE ASU.TNAZMED
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZMED CASCADE CONSTRAINTS
/

--
-- TNAZMED  (Table) 
--
CREATE TABLE ASU.TNAZMED
(
  FK_ID              NUMBER(10)                 NOT NULL,
  FK_PACID           NUMBER(10),
  FK_VRACHID         NUMBER(10),
  FK_VVODPATHID      NUMBER(10),
  FD_CREATE          DATE                       DEFAULT sysdate,
  FD_BEGIN           DATE                       DEFAULT sysdate,
  FN_DURATION        INTEGER,
  FD_CANCEL          DATE,
  FK_CANCELSOTRID    NUMBER(10),
  FC_CANCELREASON    VARCHAR2(1000 BYTE),
  FK_STATE           NUMBER(10),
  FK_TREB            NUMBER(10),
  FK_FREQUENCYID     NUMBER(10),
  FC_REMARK          VARCHAR2(1000 BYTE),
  FK_MOID            NUMBER(10),
  FK_OSMOTRID        NUMBER(10)                 DEFAULT -1,
  FK_NAZTYPEID       NUMBER(10),
  FK_CANCELOSMOTRID  NUMBER,
  FP_DURATION_TYPE   NUMBER                     DEFAULT 1,
  FL_IN_RASPIS       NUMBER(1)                  DEFAULT 0,
  FK_ROOMID          NUMBER,
  FK_ISPOLID         NUMBER,
  FN_VIDANO          NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1568K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TNAZMED IS 'Таблица медикаментозных назначений (Sill)'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_ID IS 'SEQUENCE=[SEQ_TNAZMED]'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_VRACHID IS 'Код назначившего врача'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_VVODPATHID IS 'Путь введения (см. табл. TVvodPath)'
/

COMMENT ON COLUMN ASU.TNAZMED.FD_CREATE IS 'Дата создания назначения'
/

COMMENT ON COLUMN ASU.TNAZMED.FD_BEGIN IS 'Дата начала назначения'
/

COMMENT ON COLUMN ASU.TNAZMED.FN_DURATION IS 'Длительность курса'
/

COMMENT ON COLUMN ASU.TNAZMED.FD_CANCEL IS 'Дата отмены назначения'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_CANCELSOTRID IS 'Код сотрудника, отменившего назначение'
/

COMMENT ON COLUMN ASU.TNAZMED.FC_CANCELREASON IS 'Причина отмены'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_STATE IS 'Состояние назначения (см. табл. TNazSos)'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_TREB IS 'Сылка на требования (см. табл Med.TTreb)'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_FREQUENCYID IS 'Кратность приема (см. табл. TFrequency)'
/

COMMENT ON COLUMN ASU.TNAZMED.FC_REMARK IS 'Примечание'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_MOID IS 'Код мат. ответственного (для связи с аптекой)'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_OSMOTRID IS 'Код осмотра врача (см. табл. VNaz)'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_NAZTYPEID IS 'Тип назначения (Код смида см. тр. TNazmed_before_insert)'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_CANCELOSMOTRID IS 'VNAZ.FK_ID -  В рамках какого осмотра отменили'
/

COMMENT ON COLUMN ASU.TNAZMED.FP_DURATION_TYPE IS 'тип длительности: 0 - пожизненно, 1 - дни, 2 - месяцы, 3 - годы (asu.GET_DURATION_TYPE_NAME)'
/

COMMENT ON COLUMN ASU.TNAZMED.FL_IN_RASPIS IS 'Признак присутствия назначения в расписании'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_ROOMID IS 'Кабинет проведения назначения'
/

COMMENT ON COLUMN ASU.TNAZMED.FK_ISPOLID IS 'Код исполнителя назначения'
/

COMMENT ON COLUMN ASU.TNAZMED.FN_VIDANO IS 'кол-во выдач по назначению'
/


--
-- TNAZMED_BY_ID  (Index) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE UNIQUE INDEX ASU.TNAZMED_BY_ID ON ASU.TNAZMED
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZMED_CANSELOSMOTR  (Index) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE INDEX ASU.TNAZMED_CANSELOSMOTR ON ASU.TNAZMED
(FK_CANCELOSMOTRID)
NOLOGGING
TABLESPACE INDX
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
-- TNAZMED_FD_BEGIN  (Index) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE INDEX ASU.TNAZMED_FD_BEGIN ON ASU.TNAZMED
("FD_BEGIN" DESC)
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
-- TNAZMED_FK_TREB  (Index) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE INDEX ASU.TNAZMED_FK_TREB ON ASU.TNAZMED
(FK_TREB)
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
-- TNAZMED_PACID_SOTRID_OSMOTRID  (Index) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE INDEX ASU.TNAZMED_PACID_SOTRID_OSMOTRID ON ASU.TNAZMED
(FK_PACID, FK_VRACHID, FK_OSMOTRID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          896K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZMED_STATE  (Index) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE INDEX ASU.TNAZMED_STATE ON ASU.TNAZMED
(FK_STATE)
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
-- TNAZMED_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZMED_AFTER_INSERT" 
 AFTER 
 INSERT
 ON ASU.TNAZMED  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  I INTEGER;
BEGIN
/*  IF NVL(:NEW.FN_DURATION,0) <= 0 THEN
    Raise_Application_Error(-20001,'Не заполнена длительность курса!');
  END IF;
  FOR I IN 1 .. :NEW.FN_DURATION LOOP
    INSERT INTO TNAZMEDLECHVID (FK_NAZMEDID,FK_STATE,FD_DATE)
    VALUES (:NEW.FK_ID,2,TRUNC(:NEW.FD_BEGIN + I - 1));
  END LOOP;*/

  INSERT INTO TPRIEMNAZ(FK_NAZID, FK_PARENTID, FK_STATE) VALUES(:NEW.FK_ID, :NEW.FK_OSMOTRID, :NEW.FK_STATE); /*ADDED BY X-SIDE 16.02.06*/
  
END TNAZMED_AFTER_INSERT;
/
SHOW ERRORS;


--
-- TNAZMED_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZMED_BEFORE_DELETE" 
 BEFORE  DELETE  ON ASU.TNAZMED  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  DELETE FROM TNAZMEDLECHVID WHERE TNAZMEDLECHVID.FK_NAZMEDLECHID IN (SELECT FK_ID FROM TNAZMEDLECH WHERE FK_NAZMEDID = :OLD.FK_ID); /*УДАЛЯЕМ ФАКТЫ ВЫДАЧИ НАЗНАЧЕНИЯ*/
  DELETE FROM TNAZMEDLECH WHERE FK_NAZMEDID = :OLD.FK_ID; /*УДАЛЯЕМ РАСШИФРОВКИ НАЗНАЧЕНИЯ*/
  DELETE FROM TNAZMED_PARAM WHERE FK_TNAZMEDID = :OLD.FK_ID; /*УДАЛЯЕМ параметры для медикаментозных назначений*/

  DELETE FROM TPRIEMNAZ WHERE FK_NAZID=:OLD.FK_ID AND FK_PARENTID=:OLD.FK_OSMOTRID; /*УДАЛЯЕМ ИЗ БУФЕРНОЙ ТАБЛИЦЫ*/ /*ADDED BY X-SIDE 16.02.06*/
END TNAZMED_BEFORE_DELETE;
/
SHOW ERRORS;


--
-- TNAZMED_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZMED_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TNAZMED  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
/*  iVrachID   INTEGER;*/
  iAccess    INTEGER;
  iSotrRight INTEGER;
BEGIN
  IF :NEW.FK_ID IS NULL THEN
/*  прояснение на отметки о выполнении */
/*    SELECT SEQ_TNAZMED.NEXTVAL INTO :NEW.FK_ID FROM DUAL;*/
    SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;

/*set status*/
  BEGIN
    IF :NEW.fk_osmotrid = -1 THEN
      :NEW.FK_STATE := GET_NEVIP;
    ELSE
      /*IsSotrRight - Php*/
      BEGIN
        select MIN(FN_ACCESS) INTO iAccess
        from tnazvrach
        where fk_smid IN (select fk_smid from vnaz where fk_id = :NEW.fk_osmotrid)
          and fk_sotrid = :NEW.fk_vrachid;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN iAccess := 0;
        WHEN OTHERS THEN RAISE;
      END;

      /*IsVrachFromOtdel - Php*/
      select COUNT(0) INTO iSotrRight
      from tsotr ts,tsotr ts1
      where ts.fk_id=:NEW.fk_vrachid
        and ts1.fk_id = (select max(fk_vrachid) from tvrach where fk_pacid=:NEW.fk_pacid)
                  and ts.fk_otdelid=ts1.fk_otdelid;

      IF (iAccess IN (1,2)) OR (iSotrRight > 0) THEN
        :NEW.FK_STATE := GET_NEVIP;
      ELSE
        :NEW.FK_STATE := GET_RECOMEND;
      END IF;
    END IF;
  END;

/*  BEGIN
    SELECT 1 INTO IVRACHID FROM TVRACH WHERE FK_PACID = :NEW.FK_PACID AND FK_VRACHID = :NEW.FK_VRACHID;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN :NEW.FK_STATE := GET_RECOMEND;
  END;*/

  SELECT FK_ID INTO :NEW.FK_NAZTYPEID FROM TSMID WHERE FC_SYNONIM = 'NAZTYPE_PLAN';

END TNAZMED_BEFORE_INSERT;
/
SHOW ERRORS;


DROP SYNONYM MED.TNAZMED
/

--
-- TNAZMED  (Synonym) 
--
--  Dependencies: 
--   TNAZMED (Table)
--
CREATE SYNONYM MED.TNAZMED FOR ASU.TNAZMED
/


-- 
-- Non Foreign Key Constraints for Table TNAZMED 
-- 
ALTER TABLE ASU.TNAZMED ADD (
  CONSTRAINT TNAZMED_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          384K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TNAZMED TO MED
/

