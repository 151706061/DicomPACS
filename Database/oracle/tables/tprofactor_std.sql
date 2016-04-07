ALTER TABLE ASU.TPROFACTOR_STD
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPROFACTOR_STD CASCADE CONSTRAINTS
/

--
-- TPROFACTOR_STD  (Table) 
--
--  Dependencies: 
--   TINTERVALS (Table)
--   TPROFFACTOR (Table)
--
CREATE TABLE ASU.TPROFACTOR_STD
(
  FK_ID             INTEGER                     NOT NULL,
  PERIOD_NUM        INTEGER,
  PERIOD_NUM_INT    INTEGER,
  FK_INTERVAL       INTEGER,
  CONTRAINDICATION  VARCHAR2(4000 BYTE),
  INTERPRETATION    VARCHAR2(4000 BYTE),
  PERIOD_NUM_C      INTEGER,
  PERIOD_NUM_INT_C  INTEGER,
  FK_INTERVAL_C     INTEGER,
  OLDID             NUMBER,
  FB_CONTR_INFO     CLOB
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          440K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
LOB (FB_CONTR_INFO) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        RETENTION
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
/

COMMENT ON TABLE ASU.TPROFACTOR_STD IS 'Проффакторы содержание (связь 1=1 по fk_id)
Author: Ura  LABEL=_EXP DATE=22.09.2005 10:13:13'
/

COMMENT ON COLUMN ASU.TPROFACTOR_STD.FK_ID IS 'SEQUENCE=[SEQ_PROFACTOR_STD]'
/

COMMENT ON COLUMN ASU.TPROFACTOR_STD.PERIOD_NUM IS 'количество раз'
/

COMMENT ON COLUMN ASU.TPROFACTOR_STD.PERIOD_NUM_INT IS 'количество интервалов'
/

COMMENT ON COLUMN ASU.TPROFACTOR_STD.FK_INTERVAL IS 'интеравл'
/

COMMENT ON COLUMN ASU.TPROFACTOR_STD.CONTRAINDICATION IS 'противопоказания'
/

COMMENT ON COLUMN ASU.TPROFACTOR_STD.INTERPRETATION IS 'разъяснения'
/

COMMENT ON COLUMN ASU.TPROFACTOR_STD.PERIOD_NUM_C IS 'количество раз в центре'
/

COMMENT ON COLUMN ASU.TPROFACTOR_STD.PERIOD_NUM_INT_C IS 'количество интервалов в центре'
/

COMMENT ON COLUMN ASU.TPROFACTOR_STD.FK_INTERVAL_C IS 'интеравл в центре'
/


--
-- PK_TPROFACTOR_STD  (Index) 
--
--  Dependencies: 
--   TPROFACTOR_STD (Table)
--
CREATE UNIQUE INDEX ASU.PK_TPROFACTOR_STD ON ASU.TPROFACTOR_STD
(FK_ID)
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
-- TPROFACTOR_STD_EXP  (Trigger) 
--
--  Dependencies: 
--   TPROFACTOR_STD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFACTOR_STD_EXP" 
AFTER INSERT  OR UPDATE  OR  DELETE
ON ASU.TPROFACTOR_STD REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DISABLE
DECLARE
  dTimeStamp DATE;
Begin
  if (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') then
    dTimeStamp := SYSDATE;

    if DELETING then
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TPROFACTOR_STD DELETE KEY=FK_ID',
                      :OLD.FK_ID,
                      'DELETE');

    elsif INSERTING then

      -- FK_ID
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TPROFACTOR_STD INSERT FK_ID=:FN_NEW',
                      null,
                      :NEW.FK_ID);

      -- PERIOD_NUM
      if :NEW.PERIOD_NUM is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.PERIOD_NUM);
      end if;

      -- PERIOD_NUM_INT
      if :NEW.PERIOD_NUM_INT is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_INT=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.PERIOD_NUM_INT);
      end if;

      -- FK_INTERVAL
      if :NEW.FK_INTERVAL is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_INTERVAL=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_INTERVAL);
      end if;

      -- CONTRAINDICATION
      if :NEW.CONTRAINDICATION is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE CONTRAINDICATION=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.CONTRAINDICATION);
      end if;

      -- INTERPRETATION
      if :NEW.INTERPRETATION is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE INTERPRETATION=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.INTERPRETATION);
      end if;

      -- PERIOD_NUM_C
      if :NEW.PERIOD_NUM_C is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_C=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.PERIOD_NUM_C);
      end if;

      -- PERIOD_NUM_INT_C
      if :NEW.PERIOD_NUM_INT_C is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_INT_C=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.PERIOD_NUM_INT_C);
      end if;

      -- FK_INTERVAL_C
      if :NEW.FK_INTERVAL_C is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_INTERVAL_C=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_INTERVAL_C);
      end if;

    elsif UPDATING then

      -- FK_ID
      IF UPDATING('FK_ID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_ID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_ID);
      end if;

      -- PERIOD_NUM
      IF UPDATING('PERIOD_NUM') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.PERIOD_NUM);
      end if;

      -- PERIOD_NUM_INT
      IF UPDATING('PERIOD_NUM_INT') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_INT=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.PERIOD_NUM_INT);
      end if;

      -- FK_INTERVAL
      IF UPDATING('FK_INTERVAL') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_INTERVAL=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_INTERVAL);
      end if;

      -- CONTRAINDICATION
      IF UPDATING('CONTRAINDICATION') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE CONTRAINDICATION=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.CONTRAINDICATION);
      end if;

      -- INTERPRETATION
      IF UPDATING('INTERPRETATION') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE INTERPRETATION=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.INTERPRETATION);
      end if;

      -- PERIOD_NUM_C
      IF UPDATING('PERIOD_NUM_C') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_C=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.PERIOD_NUM_C);
      end if;

      -- PERIOD_NUM_INT_C
      IF UPDATING('PERIOD_NUM_INT_C') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE PERIOD_NUM_INT_C=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.PERIOD_NUM_INT_C);
      end if;

      -- FK_INTERVAL_C
      IF UPDATING('FK_INTERVAL_C') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_STD UPDATE FK_INTERVAL_C=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_INTERVAL_C);
      end if;

    end if;
  end if;
END TPROFACTOR_STD_EXP;
/
SHOW ERRORS;


--
-- TPROFACTOR_STD_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPROFACTOR_STD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFACTOR_STD_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TPROFACTOR_STD  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW

-- Код триггера модифицирован системой автоматической генерации триггеров репликации aTrigger.exe от:22.09.2005 10:13:13
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
    -- ORIGINAL TRIGGER BODY BEGIN FROM HERE:

BEGIN
  IF :NEW.fk_id IS NULL
  THEN
    SELECT seq_profactor_std.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;

    -- ORIGINAL TRIGGER BODY ENDS HERE
    END;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPROFACTOR_STD 
-- 
ALTER TABLE ASU.TPROFACTOR_STD ADD (
  CONSTRAINT PK_TPROFACTOR_STD
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

-- 
-- Foreign Key Constraints for Table TPROFACTOR_STD 
-- 
ALTER TABLE ASU.TPROFACTOR_STD ADD (
  CONSTRAINT FK_TPROFACTOR_S$TINTERVALS 
 FOREIGN KEY (FK_INTERVAL) 
 REFERENCES ASU.TINTERVALS (FK_ID) DISABLE,
  CONSTRAINT FK_TPROFACTOR_S$TINTERVALS_C 
 FOREIGN KEY (FK_INTERVAL_C) 
 REFERENCES ASU.TINTERVALS (FK_ID) DISABLE,
  CONSTRAINT FK_TPROFACTOR_S$TPROFFACTOR 
 FOREIGN KEY (FK_ID) 
 REFERENCES ASU.TPROFFACTOR (FK_ID) DISABLE)
/

