ALTER TABLE ASU.TVAC_PEOPLES_TEST
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_PEOPLES_TEST CASCADE CONSTRAINTS
/

--
-- TVAC_PEOPLES_TEST  (Table) 
--
--  Dependencies: 
--   TVAC_TEST (Table)
--   TVAC_TEST_RESULT (Table)
--
CREATE TABLE ASU.TVAC_PEOPLES_TEST
(
  FK_ID            INTEGER                      NOT NULL,
  FD_CREATE        DATE                         NOT NULL,
  FK_VAC_TEST_RES  INTEGER                      NOT NULL,
  FC_REACTION      VARCHAR2(500 BYTE),
  FK_PEOPLE        INTEGER                      NOT NULL,
  FK_VAC_TEST      INTEGER                      NOT NULL,
  FK_VRACH         INTEGER                      DEFAULT -1                    NOT NULL,
  FC_VRACH         VARCHAR2(50 BYTE),
  FK_LPY           INTEGER                      DEFAULT -1                    NOT NULL,
  FC_LPY           VARCHAR2(150 BYTE),
  FD_REG           DATE,
  FK_SOTR          INTEGER                      NOT NULL,
  FC_SOTR          VARCHAR2(50 BYTE),
  FN_DOSE          NUMBER,
  FK_MEASURE_DOSE  NUMBER,
  FC_SERIES        VARCHAR2(20 CHAR)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          240K
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

COMMENT ON TABLE ASU.TVAC_PEOPLES_TEST IS '���������� ���� ��� ������� ����
Autthor: ura'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FK_ID IS 'SEQUENCE=[SEQ_VAC_PEOPLES_TEST]'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FD_CREATE IS '���� ������ �����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FK_VAC_TEST_RES IS '������� �� �����
TVAC_TEST_RESULT.FK_ID'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FC_REACTION IS '�������� ������� �� �����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FK_VAC_TEST IS '��� �� ����� TVAC_TEST.FK_ID'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FK_VRACH IS '���� �����������  �����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FC_VRACH IS '������� �� �����  �������������  �����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FK_LPY IS '��� � ������ ���� ������� �����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FC_LPY IS '�������� ��� � ������ ���� �������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FD_REG IS '���� �����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FK_SOTR IS 'TSOTR.FK_ID ���������, ������� ��������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FC_SOTR IS '��� ���������� ������������ �����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FN_DOSE IS '������ ����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FK_MEASURE_DOSE IS '������� ��������� ����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLES_TEST.FC_SERIES IS '�����'
/


--
-- IX_TVAC_PEOPLES_TEST$FK_LPY  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLES_TEST (Table)
--
CREATE INDEX ASU.IX_TVAC_PEOPLES_TEST$FK_LPY ON ASU.TVAC_PEOPLES_TEST
(FK_LPY)
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
-- PK_TVAC_PEOPLES_TEST  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLES_TEST (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_PEOPLES_TEST ON ASU.TVAC_PEOPLES_TEST
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
-- TVAC_PEOPLES_TEST$FK_PEOPLE  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLES_TEST (Table)
--
CREATE INDEX ASU.TVAC_PEOPLES_TEST$FK_PEOPLE ON ASU.TVAC_PEOPLES_TEST
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
-- TVAC_PEOPLES_TEST$FK_VAC_TEST  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLES_TEST (Table)
--
CREATE INDEX ASU.TVAC_PEOPLES_TEST$FK_VAC_TEST ON ASU.TVAC_PEOPLES_TEST
(FK_VAC_TEST)
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
-- TVAC_PEOPLES_TEST$FK_VAC_TESTR  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLES_TEST (Table)
--
CREATE INDEX ASU.TVAC_PEOPLES_TEST$FK_VAC_TESTR ON ASU.TVAC_PEOPLES_TEST
(FK_VAC_TEST_RES)
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
-- TVAC_PEOPLES_TEST_BEFORE_INSER  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLES_TEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLES_TEST_BEFORE_INSER" BEFORE INSERT
ON ASU.TVAC_PEOPLES_TEST FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_PEOPLES_TEST
      IF :NEW.FK_ID IS NULL
      THEN
         SELECT SEQ_VAC_PEOPLES_TEST.NEXTVAL INTO :NEW.FK_ID from dual;
      END IF;
end;
/
SHOW ERRORS;


--
-- TVAC_PEOPLES_TEST#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLES_TEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLES_TEST#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_peoples_test
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_test    CONSTANT NUMBER := 9;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    IF :new.fd_create <> :old.fd_create THEN

      v_fc_desc :=
          '[���� ������ �����:] ����� - "' ||
          TO_CHAR(:new.fd_create, 'DD.MM.YYYY') ||
          '", ������ - "' ||
          TO_CHAR(:old.fd_create, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fk_vac_test_res <> :old.fk_vac_test_res THEN

      v_fc_desc := v_fc_desc ||
          '[�������:] ����� - "' || :new.fk_vac_test_res ||
          '", ������ - "' || :old.fk_vac_test_res || '". ';
    END IF;

    IF :new.fc_reaction <> :old.fc_reaction THEN

      v_fc_desc := v_fc_desc ||
          '[�������:] ����� - "' || :new.fc_reaction ||
          '", ������ - "' || :old.fc_reaction || '". ';
    END IF;

    IF :new.fk_vac_test <> :old.fk_vac_test THEN

      v_fc_desc := v_fc_desc ||
          '[�����:] ����� - "' || :new.fk_vac_test ||
          '", ������ - "' || :old.fk_vac_test || '". ';
    END IF;

    IF :new.fc_vrach <> :old.fc_vrach THEN

      v_fc_desc := v_fc_desc ||
          '[����:] ����� - "' || :new.fc_vrach ||
          '", ������ - "' || :old.fc_vrach || '". ';
    END IF;

    IF :new.fc_lpy <> :old.fc_lpy THEN

      v_fc_desc := v_fc_desc ||
          '[���:] ����� - "' || :new.fc_lpy ||
          '", ������ - "' || :old.fc_lpy || '". ';
    END IF;

    IF :new.fc_sotr <> :old.fc_sotr THEN

      v_fc_desc := v_fc_desc ||
          '[��� �����������:] ����� - "' || :new.fc_sotr ||
          '", ������ - "' || :old.fc_sotr || '". ';
    END IF;

    IF :new.fd_reg <> :old.fd_reg THEN

      v_fc_desc := v_fc_desc ||
          '[���� �����:] ����� - "' || TO_CHAR(:new.fd_reg, 'DD.MM.YYYY') ||
          '", ������ - "' || TO_CHAR(:old.fd_reg, 'DD.MM.YYYY') || '". ';
    END IF;

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_test, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_PEOPLES_TEST#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLES_TEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLES_TEST#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_peoples_test
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_test       CONSTANT NUMBER := 7;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc :=
        '[���� ������ �����:] "' || TO_CHAR(:new.fd_create, 'DD.MM.YYYY') ||
        '". [������� �� �����:] "' || :new.fk_vac_test_res ||
        '". [��������:] "' || :new.fc_reaction ||
        '". [ID �����:] "' || :new.fk_vac_test ||
        '". [��� �����:] "' || :new.fc_vrach ||
        '". [���:] "' || :new.fc_lpy ||
        '". [��� �����������:] "' || :new.fc_sotr ||
        '". [���� �����:] "' || TO_CHAR(:new.fd_reg, 'DD.MM.YYYY') || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_test, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_PEOPLES_TEST#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLES_TEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLES_TEST#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_peoples_test
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_del_test       CONSTANT NUMBER := 8;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc :=
        '[���� ������ �����:] "' || TO_CHAR(:old.fd_create, 'DD.MM.YYYY') ||
        '". [������� �� �����:] "' || :old.fk_vac_test_res ||
        '". [��������:] "' || :old.fc_reaction ||
        '". [ID �����:] "' || :old.fk_vac_test ||
        '". [��� �����:] "' || :old.fc_vrach ||
        '". [���:] "' || :old.fc_lpy ||
        '". [��� �����������:] "' || :old.fc_sotr ||
        '". [���� �����:] "' || TO_CHAR(:old.fd_reg, 'DD.MM.YYYY') || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_del_test, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :old.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_PEOPLES_TEST 
-- 
ALTER TABLE ASU.TVAC_PEOPLES_TEST ADD (
  CONSTRAINT PK_TVAC_PEOPLES_TEST
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
-- Foreign Key Constraints for Table TVAC_PEOPLES_TEST 
-- 
ALTER TABLE ASU.TVAC_PEOPLES_TEST ADD (
  CONSTRAINT FK_TVAC_PEOPLES$TVAC_TEST 
 FOREIGN KEY (FK_VAC_TEST) 
 REFERENCES ASU.TVAC_TEST (FK_ID),
  CONSTRAINT FK_TVAC_PEOPLES$TVAC_TEST_RE 
 FOREIGN KEY (FK_VAC_TEST_RES) 
 REFERENCES ASU.TVAC_TEST_RESULT (FK_ID))
/

