ALTER TABLE ASU.TINFECTION_MKB
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TINFECTION_MKB CASCADE CONSTRAINTS
/

--
-- TINFECTION_MKB  (Table) 
--
--  Dependencies: 
--   TINFECTION (Table)
--
CREATE TABLE ASU.TINFECTION_MKB
(
  FK_ID         INTEGER                         NOT NULL,
  FK_INFECTION  INTEGER                         NOT NULL,
  FC_MKB10      VARCHAR2(8 BYTE)                NOT NULL
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

COMMENT ON TABLE ASU.TINFECTION_MKB IS 'Связь инфекций и кодов МКБ-10
Используется в перенесенных заболеваниях
Author: Ura'
/

COMMENT ON COLUMN ASU.TINFECTION_MKB.FK_INFECTION IS 'TINFECTION.FK_ID'
/

COMMENT ON COLUMN ASU.TINFECTION_MKB.FC_MKB10 IS 'Код МКБ-10 (ПЕРВЫЕ БУКВЫ) поиск все равно по начальным производится'
/


--
-- PK_TINFECTION_MKB  (Index) 
--
--  Dependencies: 
--   TINFECTION_MKB (Table)
--
CREATE UNIQUE INDEX ASU.PK_TINFECTION_MKB ON ASU.TINFECTION_MKB
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
-- "tib_tinfection_mkb"  (Trigger) 
--
--  Dependencies: 
--   TINFECTION_MKB (Table)
--
CREATE OR REPLACE TRIGGER ASU."tib_tinfection_mkb" before insert
on TINFECTION_MKB for each row
begin
    --  Column "FK_ID" uses sequence SEQ_TINFECTION_MKB
    if :new.FK_ID is null then
      select SEQ_TINFECTION_MKB.NEXTVAL INTO :new.FK_ID from dual;
    end if;


end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TINFECTION_MKB 
-- 
ALTER TABLE ASU.TINFECTION_MKB ADD (
  CONSTRAINT PK_TINFECTION_MKB
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

-- 
-- Foreign Key Constraints for Table TINFECTION_MKB 
-- 
ALTER TABLE ASU.TINFECTION_MKB ADD (
  CONSTRAINT FK_TINFECTI_REFERENCE_TINFECTI 
 FOREIGN KEY (FK_INFECTION) 
 REFERENCES ASU.TINFECTION (FK_ID)
    ON DELETE CASCADE)
/

