ALTER TABLE ASU.TINTERVALS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TINTERVALS CASCADE CONSTRAINTS
/

--
-- TINTERVALS  (Table) 
--
CREATE TABLE ASU.TINTERVALS
(
  FK_ID    INTEGER                              NOT NULL,
  NAME     VARCHAR2(50 BYTE),
  FN_DAYS  INTEGER                              DEFAULT 365
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

COMMENT ON TABLE ASU.TINTERVALS IS 'Интервалы для проффакторов
Author: Ura LABEL=_EXP DATE=22.09.2005 10:19:23'
/

COMMENT ON COLUMN ASU.TINTERVALS.NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TINTERVALS.FN_DAYS IS 'КОЛИЧЕСТВО ДНЕЙ'
/


--
-- PK_TINTERVALS  (Index) 
--
--  Dependencies: 
--   TINTERVALS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TINTERVALS ON ASU.TINTERVALS
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
-- TINTERVALS_EXP  (Trigger) 
--
--  Dependencies: 
--   TINTERVALS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINTERVALS_EXP" 
AFTER INSERT  OR UPDATE  OR  DELETE
ON ASU.TINTERVALS REFERENCING NEW AS NEW OLD AS OLD
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
                      'TINTERVALS DELETE KEY=FK_ID',
                      :OLD.FK_ID,
                      'DELETE');

    elsif INSERTING then

      -- FK_ID
      PKG_LINK.TO_EXP(dTimeStamp,
                      'ASU',
                      'TINTERVALS INSERT FK_ID=:FN_NEW',
                      null,
                      :NEW.FK_ID);

      -- FN_DAYS
      if :NEW.FN_DAYS is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE FN_DAYS=:FN_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.FN_DAYS);
      end if;

      -- NAME
      if :NEW.NAME is not null then
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE NAME=:FH_NEW KEY=FK_ID',
                        :NEW.FK_ID,
                        :NEW.NAME);
      end if;

    elsif UPDATING then

      -- FN_DAYS
      IF UPDATING('FN_DAYS') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE FN_DAYS=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FN_DAYS);
      end if;

      -- FK_ID
      IF UPDATING('FK_ID') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE FK_ID=:FN_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.FK_ID);
      end if;

      -- NAME
      IF UPDATING('NAME') THEN
        PKG_LINK.TO_EXP(dTimeStamp,
                        'ASU',
                        'TINTERVALS UPDATE NAME=:FH_NEW KEY=FK_ID',
                        :OLD.FK_ID,
                        :NEW.NAME);
      end if;

    end if;
  end if;
END TINTERVALS_EXP;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TINTERVALS 
-- 
ALTER TABLE ASU.TINTERVALS ADD (
  CONSTRAINT PK_TINTERVALS
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

