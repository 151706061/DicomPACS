ALTER TABLE ASU.TVAC_PEOPLE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_PEOPLE CASCADE CONSTRAINTS
/

--
-- TVAC_PEOPLE  (Table) 
--
--  Dependencies: 
--   TVACCIN_PREP (Table)
--   TVACCIN_PREP_STORE_LOG (Table)
--   TVACCIN_SHEM (Table)
--   TVACCIN_SHEMNAME (Table)
--
CREATE TABLE ASU.TVAC_PEOPLE
(
  FK_ID                     INTEGER             NOT NULL,
  FK_PEOPLE                 INTEGER             NOT NULL,
  FD_CREATE                 DATE                NOT NULL,
  FK_SOTR                   INTEGER,
  FN_NUM                    NUMBER(16,3)        NOT NULL,
  FC_SERIES                 VARCHAR2(50 BYTE)   NOT NULL,
  FK_UNIT                   INTEGER             NOT NULL,
  FN_STATUS                 INTEGER             NOT NULL,
  FC_ORGANIZATION           VARCHAR2(250 BYTE)  NOT NULL,
  FC_VRACH_FIO              VARCHAR2(50 BYTE)   NOT NULL,
  FN_REACTION               NUMBER(18),
  FC_REACTION               VARCHAR2(4000 BYTE),
  FK_VACCIN_PREP            INTEGER             NOT NULL,
  FK_VACCIN_SHEMNAME        INTEGER,
  FK_VACCIN_SHEM            INTEGER,
  FC_VACCIN_NAME            VARCHAR2(150 BYTE)  NOT NULL,
  FN_STATUS_SERIES          INTEGER             NOT NULL,
  FK_LPY                    INTEGER,
  FK_VACCIN_PREP_STORE_LOG  NUMBER,
  FK_INPUT_TYPE             INTEGER             DEFAULT 1                     NOT NULL,
  FK_VRACH                  NUMBER,
  FC_SOTR_FIO               VARCHAR2(50 BYTE),
  FK_OTDEL                  INTEGER,
  FN_REACTION_RUBEC         NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          5008K
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

COMMENT ON TABLE ASU.TVAC_PEOPLE IS '�������� ��������
Author: Ura'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_ID IS 'SEQUENCE=[SEQ_VAC_PEOPLE]'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_PEOPLE IS 'Tpeoples.fk_id'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FD_CREATE IS '���� ���������� ��������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_SOTR IS '��������� ��������� ��������, ������ ���� ������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FN_NUM IS '����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FC_SERIES IS '�����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_UNIT IS '������� ���������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FN_STATUS IS '���������
�����������
�������� - ������, �����?'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FC_ORGANIZATION IS '�� ������� ������� �������� (���� ��, �� ����� �� ���������)'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FC_VRACH_FIO IS '����, ������� ��������  ��������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FN_REACTION IS '��� �������. �� �����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FC_REACTION IS '�������� �������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_VACCIN_PREP IS 'TVACCIN_PREP.FK_ID '
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_VACCIN_SHEMNAME IS '����� �� ������� ����������� �������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_VACCIN_SHEM IS '�������� �� ���������� ������� � �����'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FC_VACCIN_NAME IS '�������� ��������� ��� ���������� ��������� ��������� � TVACCIN_PREP_STORE'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FN_STATUS_SERIES IS '������ �����
����� ��������� (���������)
����� ����������
����� ��������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_LPY IS 'TCompany.fk_id'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_VACCIN_PREP_STORE_LOG IS '���������� ��� ������� �����, - ������ �� ����������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_INPUT_TYPE IS '������ �������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_VRACH IS '���� ����������� ��������, ����� ���� ������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FC_SOTR_FIO IS '���, ����������, ���������� ��������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FK_OTDEL IS '��������� � ������� ������� ��������'
/

COMMENT ON COLUMN ASU.TVAC_PEOPLE.FN_REACTION_RUBEC IS '������ ����� (��) ������ ��� ���'
/


--
-- PK_TVAC_PEOPLE  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_PEOPLE ON ASU.TVAC_PEOPLE
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          768K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVAC_PEOPLE$FD_CREATE  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE INDEX ASU.TVAC_PEOPLE$FD_CREATE ON ASU.TVAC_PEOPLE
(FD_CREATE)
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
-- TVAC_PEOPLE$FK_PEOPLE  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE INDEX ASU.TVAC_PEOPLE$FK_PEOPLE ON ASU.TVAC_PEOPLE
(FK_PEOPLE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1408K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVAC_PEOPLE$FK_UNIT  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE INDEX ASU.TVAC_PEOPLE$FK_UNIT ON ASU.TVAC_PEOPLE
(FK_UNIT)
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
-- TVAC_PEOPLE$FK_VACCINPREP  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE INDEX ASU.TVAC_PEOPLE$FK_VACCINPREP ON ASU.TVAC_PEOPLE
(FK_VACCIN_PREP)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1408K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVAC_PEOPLE$FK_VAC_SHEM  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE INDEX ASU.TVAC_PEOPLE$FK_VAC_SHEM ON ASU.TVAC_PEOPLE
(FK_VACCIN_SHEM)
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
-- TVAC_PEOPLE$FK_VACSHEMNAME  (Index) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE INDEX ASU.TVAC_PEOPLE$FK_VACSHEMNAME ON ASU.TVAC_PEOPLE
(FK_VACCIN_SHEMNAME)
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
-- TVAC_PEOPLE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE_BEFORE_INSERT" BEFORE INSERT
ON ASU.TVAC_PEOPLE FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_PEOPLE
      IF :NEW.FK_ID IS NULL
      THEN
         SELECT SEQ_VAC_PEOPLE.NEXTVAL INTO :NEW.FK_ID from dual;
      END IF;
end;
/
SHOW ERRORS;


--
-- TVAC_PEOPLE_BEFORE_DELETE_ROW  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE_BEFORE_DELETE_ROW" 
 BEFORE
  DELETE
 ON asu.tvac_people
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;

BEGIN
  PKG_VACCIN.ADD_VAC_PLAN_COLLECTION(:old.fk_id);
END;
/
SHOW ERRORS;


--
-- TVAC_PEOPLE_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE_BEFORE_DELETE" 
 BEFORE
  DELETE
 ON asu.tvac_people
REFERENCING NEW AS NEW OLD AS OLD
BEGIN
  PKG_VACCIN.INIT_VAC_PLAN_COLLECTION;
END;
/
SHOW ERRORS;


--
-- TVAC_PEOPLE_AFTER_DELETE  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE_AFTER_DELETE" 
 AFTER
  DELETE
 ON asu.tvac_people
REFERENCING NEW AS NEW OLD AS OLD
BEGIN
  PKG_VACCIN.RESTORE_VAC_PLAN_COLLECTION;
END;
/
SHOW ERRORS;


--
-- TVAC_PEOPLE$BD  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE$BD" 
 BEFORE 
 DELETE
 ON ASU.TVAC_PEOPLE  FOR EACH ROW
BEGIN
   DELETE FROM tvac_kratn
         WHERE tvac_kratn.fk_vac_people = :OLD.fk_id;
END;
/
SHOW ERRORS;


--
-- TVAC_PEOPLE#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_people
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_vaccin  CONSTANT NUMBER := 15;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    IF :new.fn_num <> :old.fn_num THEN

      v_fc_desc :=
          '[����:] ����� - "' || :new.fn_num ||
          '", ������ - "' || :old.fn_num || '". ';
    END IF;

    IF :new.fd_create <> :old.fd_create THEN

      v_fc_desc := v_fc_desc ||
          '[���� ��������:] ����� - "' ||
          TO_CHAR(:new.fd_create, 'DD.MM.YYYY') ||
          '", ������ - "' || TO_CHAR(:old.fd_create, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fk_unit <> :old.fk_unit THEN

      v_fc_desc := v_fc_desc ||
          '[��.���.:] ����� - "' || :new.fk_unit ||
          '", ������ - "' || :old.fk_unit || '". ';
    END IF;

    IF :new.fn_status <> :old.fn_status THEN

      v_fc_desc := v_fc_desc ||
          '[������:] ����� - "' || :new.fn_status ||
          '", ������ - "' || :old.fn_status || '". ';
    END IF;

    IF :new.fc_organization <> :old.fc_organization THEN

      v_fc_desc := v_fc_desc ||
          '[��, ����������� ��������:] ����� - "' || :new.fc_organization ||
          '", ������ - "' || :old.fc_organization || '". ';
    END IF;

    IF :new.fc_vrach_fio <> :old.fc_vrach_fio THEN

      v_fc_desc := v_fc_desc ||
          '[����:] ����� - "' || :new.fc_vrach_fio ||
          '", ������ - "' || :old.fc_vrach_fio || '". ';
    END IF;

    IF :new.fn_reaction <> :old.fn_reaction THEN

      v_fc_desc := v_fc_desc ||
          '[��� �������:] ����� - "' || :new.fn_reaction ||
          '", ������ - "' || :old.fn_reaction || '". ';
    END IF;

    IF :new.fk_vaccin_prep <> :old.fk_vaccin_prep THEN

      v_fc_desc := v_fc_desc ||
          '[��������:] ����� - "' || :new.fk_vaccin_prep ||
          '", ������ - "' || :old.fk_vaccin_prep || '". ';
    END IF;

    IF :new.fn_status_series <> :old.fn_status_series THEN

      v_fc_desc := v_fc_desc ||
          '[������ �����:] ����� - "' || :new.fn_status_series ||
          '", ������ - "' || :old.fn_status_series || '". ';
    END IF;

    IF :new.fk_input_type <> :old.fk_input_type THEN

      v_fc_desc := v_fc_desc ||
          '[������ ��������:] ����� - "' || :new.fk_input_type ||
          '", ������ - "' || :old.fk_input_type || '". ';
    END IF;

    IF :new.fc_sotr_fio <> :old.fc_sotr_fio THEN

      v_fc_desc := v_fc_desc ||
          '[�����������:] ����� - "' || :new.fc_sotr_fio ||
          '", ������ - "' || :old.fc_sotr_fio || '". ';
    END IF;

    IF :new.fk_otdel <> :old.fk_otdel THEN

      v_fc_desc := v_fc_desc ||
          '[���������:] ����� - "' || :new.fk_otdel ||
          '", ������ - "' || :old.fk_otdel || '". ';
    END IF;

    IF :new.fn_reaction_rubec <> :old.fn_reaction_rubec THEN

      v_fc_desc := v_fc_desc ||
          '[������ �����:] ����� - "' || :new.fn_reaction_rubec ||
          '", ������ - "' || :old.fn_reaction_rubec || '". ';
    END IF;

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_vaccin, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_PEOPLE#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_people
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_vac_people CONSTANT NUMBER := 13;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc :=
        '". [���� ��������:] "' || TO_CHAR(:new.fd_create, 'DD.MM.YYYY') ||
        '". [����:] "' || :new.fn_num ||
        '". [��.���.:] "' || :new.fk_unit ||
        '". [������:] "' || :new.fn_status ||
        '". [��, ����������� ��������:] "' || :new.fc_organization ||
        '". [����:] "' || :new.fc_vrach_fio ||
        '". [��� �������:] "' || :new.fn_reaction ||
        '". [��������:] "' || :new.fk_vaccin_prep ||
        '". [������ �����:] "' || :new.fn_status_series ||
        '". [������ ��������:] "' || :new.fk_input_type ||
        '". [�����������:] "' || :new.fc_sotr_fio ||
        '". [���������:] "' || :new.fk_otdel ||
        '". [������ �����:] "' || :new.fn_reaction_rubec || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_vac_people, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_PEOPLE#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   TVAC_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PEOPLE#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_people
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_delete_vac_people CONSTANT NUMBER := 14;
  c_fk_vac_map_source    CONSTANT NUMBER := 1;
  v_fk_user_msg_log      NUMBER;
  v_fc_desc              VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc :=
        '". [���� ��������:] "' || TO_CHAR(:old.fd_create, 'DD.MM.YYYY') ||
        '". [����:] "' || :old.fn_num ||
        '". [��.���.:] "' || :old.fk_unit ||
        '". [������:] "' || :old.fn_status ||
        '". [��, ����������� ��������:] "' || :old.fc_organization ||
        '". [����:] "' || :old.fc_vrach_fio ||
        '". [��� �������:] "' || :old.fn_reaction ||
        '". [��������:] "' || :old.fk_vaccin_prep ||
        '". [������ �����:] "' || :old.fn_status_series ||
        '". [������ ��������:] "' || :old.fk_input_type ||
        '". [�����������:] "' || :old.fc_sotr_fio ||
        '". [���������:] "' || :old.fk_otdel ||
        '". [������ �����:] "' || :old.fn_reaction_rubec || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_delete_vac_people, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :old.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_PEOPLE 
-- 
ALTER TABLE ASU.TVAC_PEOPLE ADD (
  CONSTRAINT PK_TVAC_PEOPLE
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          768K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TVAC_PEOPLE 
-- 
ALTER TABLE ASU.TVAC_PEOPLE ADD (
  CONSTRAINT FK_TVAC_PEOPLE$TVACCIN_PREP 
 FOREIGN KEY (FK_VACCIN_PREP) 
 REFERENCES ASU.TVACCIN_PREP (FK_ID),
  CONSTRAINT FK_TVAC_PEOPLE$TVACCIN_SHEM 
 FOREIGN KEY (FK_VACCIN_SHEM) 
 REFERENCES ASU.TVACCIN_SHEM (FK_ID),
  CONSTRAINT FK_TVAC_PEOPLE$TVACCIN_S_NAME 
 FOREIGN KEY (FK_VACCIN_SHEMNAME) 
 REFERENCES ASU.TVACCIN_SHEMNAME (FK_ID),
  CONSTRAINT TVAC_PEOPLE$FK_PREPSTORELOG 
 FOREIGN KEY (FK_VACCIN_PREP_STORE_LOG) 
 REFERENCES ASU.TVACCIN_PREP_STORE_LOG (FK_ID))
/

