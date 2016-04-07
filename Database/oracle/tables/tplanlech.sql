DROP TABLE ASU.TPLANLECH CASCADE CONSTRAINTS
/

--
-- TPLANLECH  (Table) 
--
CREATE TABLE ASU.TPLANLECH
(
  FK_ID     NUMBER(15)                          DEFAULT 0                     NOT NULL,
  FK_SMID   NUMBER(15)                          DEFAULT 0                     NOT NULL,
  FP_WHAT   NUMBER(1)                           DEFAULT 0                     NOT NULL,
  FK_PACID  NUMBER(15)                          DEFAULT -1                    NOT NULL
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

COMMENT ON COLUMN ASU.TPLANLECH.FK_ID IS 'SEQUENCE=[SEQ_TPLANLECH]'
/

COMMENT ON COLUMN ASU.TPLANLECH.FK_SMID IS 'TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TPLANLECH.FP_WHAT IS 'Type 0 - lechenie, 1- obsledovanie'
/

COMMENT ON COLUMN ASU.TPLANLECH.FK_PACID IS 'Pacient ID TKARTA.FK_ID or TAMBULANCE.FK_ID'
/


--
-- TPLANLECH_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPLANLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPLANLECH_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TPLANLECH REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
cursor c1 is select fc_name from tsmid start with fk_id=:new.fk_smid connect by prior fk_owner=fk_id order by rownum desc;
sName VARCHAR(100);
Begin
  SELECT SEQ_TPLANLECH.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  OPEN c1;
  FETCH c1 INTO sName;
  CLOSE c1;
  if sName='Исследования' then
    :NEW.FP_WHAT:=1;
    return;
  end if;
  if sName='Консультации' then
    :NEW.FP_WHAT:=1;
    return;
  end if;
  if sName='Процедуры' then
    :NEW.FP_WHAT:=0;
    return;
  end if;
  if sName='Анализы' then
    :NEW.FP_WHAT:=1;
    return;
  end if;
End;
/
SHOW ERRORS;


