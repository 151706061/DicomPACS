ALTER TABLE ASU.TVAC_MAP
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_MAP CASCADE CONSTRAINTS
/

--
-- TVAC_MAP  (Table) 
--
CREATE TABLE ASU.TVAC_MAP
(
  FK_ID                INTEGER                  NOT NULL,
  FK_PEOPLE            INTEGER                  NOT NULL,
  FK_ORGANIZATION      INTEGER,
  FD_ORGANIZATION      DATE,
  FK_AREA              INTEGER,
  FK_ORGANIZATION_LPY  INTEGER,
  FK_CLASS             INTEGER                  DEFAULT -100                  NOT NULL,
  FL_DEL               INTEGER                  DEFAULT 0                     NOT NULL,
  FD_BEG               DATE,
  FD_END               DATE,
  FC_CLASS_LITER       CHAR(1 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1424K
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

COMMENT ON TABLE ASU.TVAC_MAP IS '����������� �����
Author: Ura'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FK_ID IS 'SEQUENCE=[SEQ_VAC_MAP]'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FK_PEOPLE IS 'TPEOLES.FK_ID'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FK_ORGANIZATION IS '����������� � �������� ���������'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FD_ORGANIZATION IS '���� ��������� ��������� �� ������������ ����� ��� ����� � ����� ����� ����� ���� ����������'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FK_AREA IS '�������'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FK_ORGANIZATION_LPY IS '��� � �������� ���������'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FK_CLASS IS '����� ��� ����������; (-100) ��� �� ����������'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FL_DEL IS '0'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FD_BEG IS '���� ���������� �� ����'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FD_END IS '���� ������ � �����'
/

COMMENT ON COLUMN ASU.TVAC_MAP.FC_CLASS_LITER IS '����� �����'
/


--
-- IX_TVAC_MAP  (Index) 
--
--  Dependencies: 
--   TVAC_MAP (Table)
--
CREATE INDEX ASU.IX_TVAC_MAP ON ASU.TVAC_MAP
(FK_ORGANIZATION)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- IX_TVAC_MAP$FK_PEOPLE  (Index) 
--
--  Dependencies: 
--   TVAC_MAP (Table)
--
CREATE UNIQUE INDEX ASU.IX_TVAC_MAP$FK_PEOPLE ON ASU.TVAC_MAP
(FK_PEOPLE)
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
-- PK_TVAC_MAP  (Index) 
--
--  Dependencies: 
--   TVAC_MAP (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_MAP ON ASU.TVAC_MAP
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVAC_MAP$FK_ORGANIZATION_LPY  (Index) 
--
--  Dependencies: 
--   TVAC_MAP (Table)
--
CREATE INDEX ASU.TVAC_MAP$FK_ORGANIZATION_LPY ON ASU.TVAC_MAP
(FK_ORGANIZATION_LPY)
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
-- TBAC_MAP_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVAC_MAP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBAC_MAP_BEFORE_INSERT" BEFORE INSERT
ON ASU.TVAC_MAP FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_MAP
      IF :NEW.FK_ID IS NULL
      THEN
         SELECT SEQ_VAC_MAP.NEXTVAL INTO :NEW.FK_ID from dual;
      END IF;
end;
/
SHOW ERRORS;


--
-- TVAC_MAP#UL#$AU  (Trigger) 
--
--  Dependencies: 
--   TVAC_MAP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_MAP#UL#$AU" 
 AFTER
  UPDATE
 ON asu.tvac_map
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_update_vac_map CONSTANT NUMBER := 6;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    IF :new.fk_organization <> :old.fk_organization THEN

      v_fc_desc :=
          '[�����������:] ����� - "' || :new.fk_organization ||
          '", ������ - "' || :old.fk_organization || '". ';
    END IF;

    IF :new.fd_organization <> :old.fd_organization THEN

      v_fc_desc := v_fc_desc ||
          '[���� ��������� �� �����������:] ����� - "' ||
          TO_CHAR(:new.fk_organization, 'DD.MM.YYYY') ||
          '", ������ - "' ||
          TO_CHAR(:old.fk_organization, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fk_area <> :old.fk_area THEN

      v_fc_desc := v_fc_desc ||
          '[�������:] ����� - "' || :new.fk_area ||
          '", ������ - "' || :old.fk_area || '". ';
    END IF;

    IF :new.fk_organization_lpy <> :old.fk_organization_lpy THEN

      v_fc_desc := v_fc_desc ||
          '[���:] ����� - "' || :new.fk_organization_lpy ||
          '", ������ - "' || :old.fk_organization_lpy || '". ';
    END IF;

    IF :new.fk_class <> :old.fk_class THEN

      v_fc_desc := v_fc_desc ||
          '[�����:] ����� - "' || :new.fk_class ||
          '", ������ - "' || :old.fk_class || '". ';
    END IF;

    IF :new.fd_beg <> :old.fd_beg THEN

      v_fc_desc := v_fc_desc ||
          '[���� ���������� �� ����:] ����� - "' ||
          TO_CHAR(:new.fd_beg, 'DD.MM.YYYY') ||
          '", ������ - "' ||
          TO_CHAR(:old.fd_beg, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fd_end <> :old.fd_end THEN

      v_fc_desc := v_fc_desc ||
          '[���� ������ � �����:] ����� - "' ||
          TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
          '", ������ - "' ||
          TO_CHAR(:old.fd_end, 'DD.MM.YYYY') || '". ';
    END IF;

    IF :new.fc_class_liter <> :old.fc_class_liter THEN

      v_fc_desc := v_fc_desc ||
          '[����� ������:] ����� - "' || :new.fc_class_liter ||
          '", ������ - "' || :old.fc_class_liter || '". ';
    END IF;

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_update_vac_map, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_MAP#UL#$AI  (Trigger) 
--
--  Dependencies: 
--   TVAC_MAP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_MAP#UL#$AI" 
 AFTER
  INSERT
 ON asu.tvac_map
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_add_vac_map    CONSTANT NUMBER := 4;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(4000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc := '[�����������:] "' || :new.fk_organization ||
        '". [���� ��������� �� �����������:] "' ||
        TO_CHAR(:new.fd_organization, 'DD.MM.YYYY') ||
        '". [�������:] "' || :new.fk_area ||
        '". [���:] "' || :new.fk_organization_lpy ||
        '". [�����:] "' || :new.fk_class ||
        '". [���� ���������� �� ����:] "' ||
        TO_CHAR(:new.fd_beg, 'DD.MM.YYYY') ||
        '". [���� ������ � �����:] "' ||
        TO_CHAR(:new.fd_end, 'DD.MM.YYYY') ||
        '". [����� ������:] "' || :new.fc_class_liter || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_add_vac_map, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :new.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


--
-- TVAC_MAP#UL#$AD  (Trigger) 
--
--  Dependencies: 
--   TVAC_MAP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_MAP#UL#$AD" 
 AFTER
  DELETE
 ON asu.tvac_map
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  c_fk_del_vac_map     CONSTANT NUMBER := 5;
  c_fk_vac_map_source CONSTANT NUMBER := 1;
  v_fk_user_msg_log   NUMBER;
  v_fc_desc           VARCHAR2(1000);

BEGIN
  IF USER_LOG.PKG_LOG_MNG.V_KEEP_LOG THEN

    -- ��������� desc ��� log.
    v_fc_desc := '[�����������:] "' ||  :old.fk_organization ||
        '". [���� ��������� �� �����������:] "' ||
        TO_CHAR(:old.fd_organization, 'DD.MM.YYYY') ||
        '". [�������:] "' || :old.fk_area ||
        '". [���:] "' || :old.fk_organization_lpy ||
        '". [�����:] "' || :old.fk_class ||
        '". [���� ���������� �� ����:] "' ||
        TO_CHAR(:old.fd_beg, 'DD.MM.YYYY') ||
        '". [���� ������ � �����:] "' ||
        TO_CHAR(:old.fd_end, 'DD.MM.YYYY') ||
        '". [����� ������:] "' || :old.fc_class_liter || '"';

    -- ��������� � ���.
    v_fk_user_msg_log := USER_LOG.PKG_LOG_MNG.ADD_USER_MSG_LOG(
        c_fk_del_vac_map, c_fk_vac_map_source, SYSDATE, v_fc_desc);

    USER_LOG.PKG_LOG_MNG.ADD_USER_INFO_LOG(
        v_fk_user_msg_log, :old.fk_people, 'tpeoples');
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_MAP 
-- 
ALTER TABLE ASU.TVAC_MAP ADD (
  CONSTRAINT PK_TVAC_MAP
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          512K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

