ALTER TABLE ASU.TPROFFACTOR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPROFFACTOR CASCADE CONSTRAINTS
/

--
-- TPROFFACTOR  (Table) 
--
--  Dependencies: 
--   TPROFFACTOR (Table)
--
CREATE TABLE ASU.TPROFFACTOR
(
  FK_ID      INTEGER                            NOT NULL,
  FK_PARENT  INTEGER,
  CODE       VARCHAR2(10 BYTE),
  NAME       VARCHAR2(255 BYTE)
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

COMMENT ON TABLE ASU.TPROFFACTOR IS 'Список названий проффакторов (подробные атрибуты в TProfactor_std)
Author: Ura LABEL=_EXP DATE=22.09.2005 10:15:02'
/

COMMENT ON COLUMN ASU.TPROFFACTOR.FK_ID IS 'SEQUENCE=[SEQ_PROFFACTOR]'
/

COMMENT ON COLUMN ASU.TPROFFACTOR.FK_PARENT IS 'ссылка на родителя'
/

COMMENT ON COLUMN ASU.TPROFFACTOR.CODE IS 'Код или шифр ветки'
/

COMMENT ON COLUMN ASU.TPROFFACTOR.NAME IS 'Название'
/


--
-- IX_TPROFFACTOR  (Index) 
--
--  Dependencies: 
--   TPROFFACTOR (Table)
--
CREATE INDEX ASU.IX_TPROFFACTOR ON ASU.TPROFFACTOR
(CODE)
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
-- PK_TPROFFACTOR  (Index) 
--
--  Dependencies: 
--   TPROFFACTOR (Table)
--
CREATE UNIQUE INDEX ASU.PK_TPROFFACTOR ON ASU.TPROFFACTOR
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
-- TPROFFACTOR_BY_FK_PARENT  (Index) 
--
--  Dependencies: 
--   TPROFFACTOR (Table)
--
CREATE INDEX ASU.TPROFFACTOR_BY_FK_PARENT ON ASU.TPROFFACTOR
(FK_PARENT)
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
-- TPROFFACTOR_EXP  (Trigger) 
--
--  Dependencies: 
--   TPROFFACTOR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFFACTOR_EXP" 
AFTER INSERT  OR UPDATE  OR  DELETE
ON ASU.TPROFFACTOR REFERENCING NEW AS NEW OLD AS OLD
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
                      'TPROFFACTOR DELETE KEY=FK_ID',
                      :OLD.FK_ID,
                      'DELETE');

    elsif INSERTING then

      -- FK_ID
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TPROFFACTOR INSERT FK_ID=:FN_NEW',
                      null,
                      :NEW.FK_ID);

      -- FK_PARENT
      if :NEW.FK_PARENT is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE FK_PARENT=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FK_PARENT);
      end if;

      -- CODE
      if :NEW.CODE is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE CODE=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.CODE);
      end if;

      -- NAME
      if :NEW.NAME is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE NAME=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.NAME);
      end if;

    elsif UPDATING then

      -- FK_ID
      IF UPDATING('FK_ID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE FK_ID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_ID);
      end if;

      -- FK_PARENT
      IF UPDATING('FK_PARENT') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE FK_PARENT=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_PARENT);
      end if;

      -- CODE
      IF UPDATING('CODE') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE CODE=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.CODE);
      end if;

      -- NAME
      IF UPDATING('NAME') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TPROFFACTOR UPDATE NAME=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.NAME);
      end if;

    end if;
  end if;
END TPROFFACTOR_EXP;
/
SHOW ERRORS;


--
-- TPROFFACTOR_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPROFFACTOR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFFACTOR_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TPROFFACTOR  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW


-- Код триггера модифицирован системой автоматической генерации триггеров репликации aTrigger.exe от:22.09.2005 10:15:02
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
    -- ORIGINAL TRIGGER BODY BEGIN FROM HERE:

BEGIN
  IF :NEW.fk_id IS NULL
  THEN
    SELECT seq_proffactor.NEXTVAL
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
-- Non Foreign Key Constraints for Table TPROFFACTOR 
-- 
ALTER TABLE ASU.TPROFFACTOR ADD (
  CONSTRAINT PK_TPROFFACTOR
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
-- Foreign Key Constraints for Table TPROFFACTOR 
-- 
ALTER TABLE ASU.TPROFFACTOR ADD (
  CONSTRAINT FK_TPROFFACTOR$TPROFFACTOR 
 FOREIGN KEY (FK_PARENT) 
 REFERENCES ASU.TPROFFACTOR (FK_ID) DISABLE)
/

