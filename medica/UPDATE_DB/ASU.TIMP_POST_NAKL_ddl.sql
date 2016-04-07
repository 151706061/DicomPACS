-- Start of DDL Script for Table ASU.TIMP_POST_NAKL
-- Generated 20.08.08 12:20:29 from ASU@ASU
set define off

drop TABLE asu.timp_post_nakl
/

CREATE SEQUENCE asu.seq_timp_post_nakl
  INCREMENT BY 1
  START WITH 21
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

CREATE SEQUENCE asu.seq_timp_post_nakl_group
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  NOCYCLE
  NOORDER
  CACHE 20
/

CREATE TABLE asu.timp_post_nakl
    (fk_id                          NUMBER NOT NULL,
    fk_tspis_prod_id               NUMBER,
    fd_ins_record                  DATE,
    fc_post                        VARCHAR2(500),
    fc_name                        VARCHAR2(500),
    fc_ei                          VARCHAR2(20),
    fc_kol                         VARCHAR2(20),
    fc_kol_zak                     VARCHAR2(20),
    fc_price                       VARCHAR2(20),
    fc_goden_do                    VARCHAR2(20),
    fk_post_id                     NUMBER,
    fk_name_id                     NUMBER,
    fk_ei_id                       NUMBER,
    fn_kol                         NUMBER,
    fn_kol_zak                     NUMBER,
    fn_price                       NUMBER,
    fd_goden_do                    DATE,
    fd_import_date                 DATE,
    fl_is_imported                 NUMBER(1,0),
    fn_imp_group_num               NUMBER,
    fn_imp_type                    NUMBER(1,0),
    fn_status                      NUMBER)
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
  NOCACHE
  MONITORING
/

ALTER TABLE ASU.TIMP_POST_NAKL ADD (FC_SERIAL VARCHAR2(50))
/
COMMENT ON COLUMN ASU.TIMP_POST_NAKL.FC_SERIAL IS '�� ������ (����� ������)'
/
ALTER TABLE ASU.TIMP_POST_NAKL ADD (FK_TIMP_DOCS NUMBER)
/
COMMENT ON COLUMN ASU.TIMP_POST_NAKL.FK_TIMP_DOCS IS '������ �� ASU.TIMP_DOCS'
/
ALTER TABLE ASU.TIMP_POST_NAKL ADD (FL_IS_FROM_EXCEL NUMBER (1) DEFAULT 0)
/
COMMENT ON COLUMN ASU.TIMP_POST_NAKL.FL_IS_FROM_EXCEL IS '1 - ������ �� ������, 0 - ��������� �������'
/
-- Triggers for ASU.TIMP_POST_NAKL

CREATE OR REPLACE TRIGGER timp_post_nakl_UPD_FL_IMP
 BEFORE 
 UPDATE OF FL_IS_IMPORTED
 ON timp_post_nakl
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  IF :NEW.fl_is_imported = 1 then
    :NEW.fd_import_date := sysdate;
  else
    :NEW.fd_import_date := null;
  END IF;
end;
/

CREATE OR REPLACE TRIGGER ASU.TIMP_POST_NAKL_INS
 BEFORE 
 INSERT
 ON ASU.TIMP_POST_NAKL
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
begin
  if NVL(:NEW.FK_ID,-1) < 0 then
    select ASU.SEQ_timp_post_nakl.NEXTVAL INTO :NEW.FK_ID from dual;
  end if;
  :NEW.FD_INS_RECORD := sysdate;
  :NEW.FL_IS_IMPORTED := 0;
end;
/

-- Comments for ASU.TIMP_POST_NAKL

COMMENT ON TABLE asu.timp_post_nakl IS '������������� ������� ��� �������� ������ ������������� ��������� �� ��������� ����������� (������� �.�. 16.08.2008)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_ei IS '�� ������ (��. ���.)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_goden_do IS '�� ������ (���� ��������)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_kol IS '�� ������ (���������� ��������)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_kol_zak IS '�� ������ (���������� ������)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_name IS '�� ������  (�������� ��������)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_post IS '�� ������ (���������)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fc_price IS '�� ������ (����, �)'
/
COMMENT ON COLUMN asu.timp_post_nakl.fd_goden_do IS '���� ��������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fd_import_date IS '����/����� �������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fd_ins_record IS '����/����� ������� ������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_ei_id IS '������ �� BUH.TS_EI - ���� ������� ����� � �����������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_id IS '����'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_name_id IS '������ ��  BUH.ts_names.FK_ID - ���� ������� ����� � �����������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_post_id IS 'ID ����������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fk_tspis_prod_id IS '������ �� BUH.TSPIS_PROD.FK_ID'
/
COMMENT ON COLUMN asu.timp_post_nakl.fl_is_imported IS '0 - ��� �� ���� ������������� � �������� �������, 1 - ��� ����������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_imp_group_num IS '�����, ������� ���������� ������ ������ �������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_imp_type IS '��� ��������: 0 - ��������; 1 - �����������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_kol IS '���������� ��������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_kol_zak IS '���������� ������'
/
COMMENT ON COLUMN asu.timp_post_nakl.fn_price IS '����, �'
/
COMMENT ON COLUMN TIMP_POST_NAKL.FN_STATUS IS '������ ������: ��� � ������� �� ���. null - �� ���������������, 0 - ��� �� (��. ASU.PKG_IMP_POST_NAKL.DECODE_FN_STATUS)'
/

-- End of DDL Script for Table ASU.TIMP_POST_NAKL

quit
/
