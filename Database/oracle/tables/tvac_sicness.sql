ALTER TABLE ASU.TVAC_SICNESS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_SICNESS CASCADE CONSTRAINTS
/

--
-- TVAC_SICNESS  (Table) 
--
--  Dependencies: 
--   TINFECTION (Table)
--
CREATE TABLE ASU.TVAC_SICNESS
(
  FK_ID         INTEGER                         NOT NULL,
  FK_INFECTION  INTEGER                         NOT NULL,
  FD_END        DATE                            NOT NULL,
  FC_REM        VARCHAR2(500 BYTE),
  FK_DIAG       INTEGER,
  FK_PEOPLE     INTEGER,
  FK_LPY        NUMBER                          DEFAULT -1,
  FC_LPY        VARCHAR2(150 BYTE),
  FC_VRACH      VARCHAR2(50 BYTE),
  FK_ICD        NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          40K
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

COMMENT ON TABLE ASU.TVAC_SICNESS IS '������������ �����������, ������� �������� �� ������������ ����������
Author: Ura'
/

COMMENT ON COLUMN ASU.TVAC_SICNESS.FK_ID IS 'SEQUENCE=[SEQ_VAC_SICNESS]'
/

COMMENT ON COLUMN ASU.TVAC_SICNESS.FK_INFECTION IS 'TINFECTIOIN.FK_ID ��������'
/

COMMENT ON COLUMN ASU.TVAC_SICNESS.FD_END IS '���� �����������'
/

COMMENT ON COLUMN ASU.TVAC_SICNESS.FC_REM IS '���������� �� ���� �������'
/

COMMENT ON COLUMN ASU.TVAC_SICNESS.FK_DIAG IS '�� �������� ������ �� TDIAG'
/

COMMENT ON COLUMN ASU.TVAC_SICNESS.FK_PEOPLE IS 'TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TVAC_SICNESS.FK_LPY IS '���'
/

COMMENT ON COLUMN ASU.TVAC_SICNESS.FC_VRACH IS '����'
/

COMMENT ON COLUMN ASU.TVAC_SICNESS.FK_ICD IS 'TICD10.FK_ID ������ �� ������������� ������������� ��������'
/


--
-- PK_TVAC_SICNESS  (Index) 
--
--  Dependencies: 
--   TVAC_SICNESS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_SICNESS ON ASU.TVAC_SICNESS
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
-- TVAC_SICNESS$FK_INFECTION  (Index) 
--
--  Dependencies: 
--   TVAC_SICNESS (Table)
--
CREATE INDEX ASU.TVAC_SICNESS$FK_INFECTION ON ASU.TVAC_SICNESS
(FK_INFECTION)
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
-- TVAC_SICNESS$FK_PEOPLE  (Index) 
--
--  Dependencies: 
--   TVAC_SICNESS (Table)
--
CREATE INDEX ASU.TVAC_SICNESS$FK_PEOPLE ON ASU.TVAC_SICNESS
(FK_PEOPLE)
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
-- TVAC_SICNESS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVAC_SICNESS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_SICNESS_BEFORE_INSERT" BEFORE INSERT
ON ASU.TVAC_SICNESS FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_SICNESS
      IF :NEW.FK_ID IS NULL
      THEN
         SELECT SEQ_VAC_SICNESS.NEXTVAL INTO :NEW.FK_ID from dual;
      END IF;
end;
/
SHOW ERRORS;


--
-- TVAC_SICNESS_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVAC_SICNESS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_SICNESS_AFTER_INSERT" 
 AFTER
  INSERT
 ON asu.tvac_sicness
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  PKG_VACCIN.DELETE_VAC_PLAN(:new.fk_people, :new.fk_infection, :new.fd_end);
END;
/
SHOW ERRORS;


--
-- TVAC_SICNESS#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   TVAC_SICNESS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_SICNESS#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_sicness
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_sicness CONSTANT NUMBER := 12;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    IF :new.fk_infection <> :old.fk_infection THEN

      v_fc_desc :=
          '[��������:] ����� - "' || :new.fk_infection ||
          '", ������ - "' || :old.fk_infection || '". ';
    END IF;

    IF :new.fd_end <> :old.fd_end THEN

      v_fc_desc := v_fc_desc ||
          '[���� �����������:] ����� - "' ||
          TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
          '", ������ - "' || TO_CHAR(:old.fd_end, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fc_rem <> :old.fc_rem THEN

      v_fc_desc := v_fc_desc ||
          '[����������:] ����� - "' || :new.fc_rem ||
          '", ������ - "' || :old.fc_rem || '". ';
    END IF;

    IF :new.fc_lpy <> :old.fc_lpy THEN

      v_fc_desc := v_fc_desc ||
          '[���:] ����� - "' || :new.fc_lpy ||
          '", ������ - "' || :old.fc_lpy || '". ';
    END IF;

    IF :new.fc_vrach <> :old.fc_vrach THEN

      v_fc_desc := v_fc_desc ||
          '[����:] ����� - "' || :new.fc_vrach ||
          '", ������ - "' || :old.fc_vrach || '". ';
    END IF;

    IF :new.fk_icd <> :old.fk_icd THEN

      v_fc_desc := v_fc_desc ||
          '[ICD:] ����� - "' || :new.fk_icd ||
          '", ������ - "' || :old.fk_icd || '". ';
    END IF;

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_sicness, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_SICNESS#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   TVAC_SICNESS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_SICNESS#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_sicness
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_sicness    CONSTANT NUMBER := 10;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc := '[��������:] "' ||  :new.fk_infection ||
        '". [���� �����������:] "' || TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
        '". [����������:] "' || :new.fc_rem ||
        '". [���:] "' || :new.fc_lpy ||
        '". [����:] "' || :new.fc_vrach ||
        '". [ICD:] "' || :new.fk_icd || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_sicness, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_SICNESS#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   TVAC_SICNESS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_SICNESS#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_sicness
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_delete_sicness CONSTANT NUMBER := 11;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc := '[��������:] "' ||  :old.fk_infection ||
        '". [���� �����������:] "' || TO_CHAR(:old.fd_end, 'DD.MM.YYYY') ||
        '". [����������:] "' || :old.fc_rem ||
        '". [���:] "' || :old.fc_lpy ||
        '". [����:] "' || :old.fc_vrach ||
        '". [ICD:] "' || :old.fk_icd || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_delete_sicness, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :old.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_SICNESS 
-- 
ALTER TABLE ASU.TVAC_SICNESS ADD (
  CONSTRAINT PK_TVAC_SICNESS
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
-- Foreign Key Constraints for Table TVAC_SICNESS 
-- 
ALTER TABLE ASU.TVAC_SICNESS ADD (
  CONSTRAINT FK_TVAC_SICNESS$TINFECTION 
 FOREIGN KEY (FK_INFECTION) 
 REFERENCES ASU.TINFECTION (FK_ID))
/

