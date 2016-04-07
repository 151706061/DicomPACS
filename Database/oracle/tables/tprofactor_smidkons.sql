ALTER TABLE ASU.TPROFACTOR_SMIDKONS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPROFACTOR_SMIDKONS CASCADE CONSTRAINTS
/

--
-- TPROFACTOR_SMIDKONS  (Table) 
--
--  Dependencies: 
--   TPROFACTOR_STD (Table)
--
CREATE TABLE ASU.TPROFACTOR_SMIDKONS
(
  FK_ID             INTEGER                     NOT NULL,
  FK_PROFACTOR      INTEGER,
  FK_SMID           INTEGER,
  OLDID             NUMBER,
  FK_PERIOD         NUMBER,
  FK_PERIOD_C       NUMBER,
  FN_DOC_TYPE_SMID  NUMBER,
  FN_SEX            NUMBER                      DEFAULT -1,
  FN_YEAR           NUMBER                      DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON TABLE ASU.TPROFACTOR_SMIDKONS IS 'Связь профактора, с консултациями и исследованиями (ветки SMID: KONS_OSMOTR, ISL_OSMOTR)
Author: Ura  LABEL=_EXP DATE=22.09.2005 10:09:51'
/

COMMENT ON COLUMN ASU.TPROFACTOR_SMIDKONS.FK_ID IS 'SEQUENCE=[SEQ_PROFACTOR_SMID]'
/

COMMENT ON COLUMN ASU.TPROFACTOR_SMIDKONS.FK_PROFACTOR IS 'ссылка на профактор'
/

COMMENT ON COLUMN ASU.TPROFACTOR_SMIDKONS.FK_SMID IS 'сылка на TSMID (из веток KONS_OSMOTR, ISL_OSMOTR)'
/


--
-- PK_TPROFACTOR_SMIDKONS  (Index) 
--
--  Dependencies: 
--   TPROFACTOR_SMIDKONS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TPROFACTOR_SMIDKONS ON ASU.TPROFACTOR_SMIDKONS
(FK_ID)
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
-- TPROFACTOR_BY_FK_PROFACTOR  (Index) 
--
--  Dependencies: 
--   TPROFACTOR_SMIDKONS (Table)
--
CREATE INDEX ASU.TPROFACTOR_BY_FK_PROFACTOR ON ASU.TPROFACTOR_SMIDKONS
(FK_PROFACTOR)
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
-- TPROFACTOR_BY_FK_SMID  (Index) 
--
--  Dependencies: 
--   TPROFACTOR_SMIDKONS (Table)
--
CREATE INDEX ASU.TPROFACTOR_BY_FK_SMID ON ASU.TPROFACTOR_SMIDKONS
(FK_SMID)
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
-- TPROFACTOR_SMIDKONS_EXP  (Trigger) 
--
--  Dependencies: 
--   TPROFACTOR_SMIDKONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFACTOR_SMIDKONS_EXP" 
AFTER INSERT  OR UPDATE  OR  DELETE
ON ASU.TPROFACTOR_SMIDKONS REFERENCING NEW AS NEW OLD AS OLD
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
                      'TPROFACTOR_SMIDKONS DELETE KEY=FK_ID',
                      :OLD.FK_ID,
                      'DELETE');

    elsif INSERTING then

      -- FK_ID
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TPROFACTOR_SMIDKONS INSERT FK_ID=:FN_NEW',
                      null,
                      :NEW.FK_ID);

      -- FK_PROFACTOR
      if :NEW.FK_PROFACTOR is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_PROFACTOR=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_PROFACTOR);
      end if;

      -- FK_SMID
      if :NEW.FK_SMID is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_SMID=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_SMID);
      end if;

    elsif UPDATING then

      -- FK_ID
      IF UPDATING('FK_ID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_ID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_ID);
      end if;

      -- FK_PROFACTOR
      IF UPDATING('FK_PROFACTOR') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_PROFACTOR=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_PROFACTOR);
      end if;

      -- FK_SMID
      IF UPDATING('FK_SMID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFACTOR_SMIDKONS UPDATE FK_SMID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_SMID);
      end if;

    end if;
  end if;
END TPROFACTOR_SMIDKONS_EXP;
/
SHOW ERRORS;


--
-- TPROFACTOR_SMIDKONS$BI  (Trigger) 
--
--  Dependencies: 
--   TPROFACTOR_SMIDKONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFACTOR_SMIDKONS$BI" 
 BEFORE
  INSERT
 ON tprofactor_smidkons
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW

-- Код триггера модифицирован системой автоматической генерации триггеров репликации aTrigger.exe от:22.09.2005 10:09:50
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
    -- ORIGINAL TRIGGER BODY BEGIN FROM HERE:

begin
  IF :NEW.fk_id IS NULL
  THEN
    SELECT seq_profactor_smid.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
end;

    -- ORIGINAL TRIGGER BODY ENDS HERE
    END;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPROFACTOR_SMIDKONS 
-- 
ALTER TABLE ASU.TPROFACTOR_SMIDKONS ADD (
  CONSTRAINT PK_TPROFACTOR_SMIDKONS
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

-- 
-- Foreign Key Constraints for Table TPROFACTOR_SMIDKONS 
-- 
ALTER TABLE ASU.TPROFACTOR_SMIDKONS ADD (
  CONSTRAINT FK_TPROSMID$TPROFACTOR_S 
 FOREIGN KEY (FK_PROFACTOR) 
 REFERENCES ASU.TPROFACTOR_STD (FK_ID) DISABLE)
/

