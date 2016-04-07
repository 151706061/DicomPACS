ALTER TABLE ASU.TMEDICGIVEN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TMEDICGIVEN CASCADE CONSTRAINTS
/

--
-- TMEDICGIVEN  (Table) 
--
CREATE TABLE ASU.TMEDICGIVEN
(
  FK_ID            NUMBER                       NOT NULL,
  FK_NAZMARK       NUMBER,
  FK_NAZMEDLECHID  NUMBER,
  FK_MEDICGIVEN    NUMBER,
  FK_SOTRFROM      NUMBER,
  FK_SOTRTO        NUMBER,
  FP_MODE          NUMBER,
  FD_GIVEN         DATE,
  FD_DATE          DATE,
  FN_KOL           NUMBER,
  FK_DPCID         NUMBER,
  FK_NAZMEDID      NUMBER
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TMEDICGIVEN IS '“аблица св€зки препаратов, выданных постовой медсестре старшей медсестрой.
FP_MODE - –ежим, в котором происходило внесение записи в таблицу. ќпредел€етс€  select fc_value from asu.tsmini sm where sm.fc_section = ''medica.exe'' and fc_key = ''MEDSES_GIVE_MODE''. ≈сли не найден, то режим = 0
FP_MODE = 0 - ни страша€, ни младша€ медсестры не внос€т запись соотвествий
FP_MODE = 1 - старша€ медсестра при выдаче постовой медсестре делает соответствие. «десь постова€ медсестра вносит только FK_NAZMARK
FP_MODE = 2 - старша€ медсестра при выдаче постовой медсестре Ќ≈ делает соответствие. ѕостова€ медсестра делает соответствие при выдаче пациенту'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FK_ID IS 'SEQUENCE=[SEQ_TMEDICGIVEN]'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FK_NAZMARK IS 'ASU.TNAZMARK.FK_ID - ссылка на запись о выдаче пациенту. ≈сли mode = 1, заполн€етс€ только постовой сестрой при выдаче'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FK_NAZMEDLECHID IS 'ASU.TNAZMEDLECH.FK_ID - ссылка на св€зку назначени€ и препарата'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FK_MEDICGIVEN IS 'MED.TMEDIC.FK_ID - ссылка на препарат, который действительно выдали'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FK_SOTRFROM IS 'TSOTR.FK_ID - кто выдал (обычно старша€ мед.сестра)'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FK_SOTRTO IS 'TSOTR.FK_ID - кому выдал (обычно постова€ медсестра)'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FP_MODE IS '–ежим, в котором происходило внесение записи в таблицу. ќпредел€етс€  select fc_value from asu.tsmini sm where sm.fc_section = ''medica.exe'' and fc_key = ''MEDSES_GIVE_MODE'' не найден, то режим = 0'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FD_GIVEN IS 'ƒата выдачи'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FD_DATE IS 'ƒата внесени€ записи'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FN_KOL IS ' ол-во выданного препарата'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FK_DPCID IS 'MED.TDPC.DPCID заполн€етс€ только старшей медсестрой'
/

COMMENT ON COLUMN ASU.TMEDICGIVEN.FK_NAZMEDID IS 'ASU.TNAZMED.FK_ID  - ссылка на назначение'
/


--
-- PK_MEDICGIVEN  (Index) 
--
--  Dependencies: 
--   TMEDICGIVEN (Table)
--
CREATE UNIQUE INDEX ASU.PK_MEDICGIVEN ON ASU.TMEDICGIVEN
(FK_ID)
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
-- TMEDICGIVEN_FK_DPCID  (Index) 
--
--  Dependencies: 
--   TMEDICGIVEN (Table)
--
CREATE INDEX ASU.TMEDICGIVEN_FK_DPCID ON ASU.TMEDICGIVEN
(FK_DPCID)
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
-- TMEDICGIVEN_NMLECH_NMAR_MEDGIV  (Index) 
--
--  Dependencies: 
--   TMEDICGIVEN (Table)
--
CREATE INDEX ASU.TMEDICGIVEN_NMLECH_NMAR_MEDGIV ON ASU.TMEDICGIVEN
(FK_NAZMEDLECHID, FK_NAZMARK, FK_MEDICGIVEN)
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
-- TMEDICGIVEN_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TMEDICGIVEN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMEDICGIVEN_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tmedicgiven
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  -- LOCAL VARIABLES HERE
BEGIN
  IF :NEW.FK_ID IS NULL THEN
      SELECT SEQ_TMEDICGIVEN.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
  :NEW.FD_DATE := SYSDATE;
END;
/
SHOW ERRORS;


DROP PUBLIC SYNONYM TMEDICGIVEN
/

--
-- TMEDICGIVEN  (Synonym) 
--
--  Dependencies: 
--   TMEDICGIVEN (Table)
--
CREATE PUBLIC SYNONYM TMEDICGIVEN FOR ASU.TMEDICGIVEN
/


-- 
-- Non Foreign Key Constraints for Table TMEDICGIVEN 
-- 
ALTER TABLE ASU.TMEDICGIVEN ADD (
  CONSTRAINT PK_MEDICGIVEN
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

GRANT DELETE, REFERENCES ON ASU.TMEDICGIVEN TO MED
/

