DROP TABLE ASU.TMP_NAZSPIS CASCADE CONSTRAINTS
/

--
-- TMP_NAZSPIS  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TMP_NAZSPIS
(
  LEVEL_NUM                   NUMBER,
  FK_ID                       VARCHAR2(30 BYTE),
  FK_PARENT                   VARCHAR2(30 BYTE),
  FC_MOVENAME                 VARCHAR2(50 BYTE),
  FC_MEDIC_NAME               VARCHAR2(500 BYTE),
  FN_MEDIC_KOL                NUMBER,
  FC_MEDIC_EI                 VARCHAR2(20 BYTE),
  FC_FROM                     VARCHAR2(100 BYTE),
  FC_TO                       VARCHAR2(100 BYTE),
  FD_DATE_MOVE                DATE,
  FD_GODEN                    DATE,
  FC_SERIAL                   VARCHAR2(50 BYTE),
  FK_PACID                    NUMBER,
  FK_VRACHID                  NUMBER,
  FK_NM_ID                    NUMBER,
  FK_NML_ID                   NUMBER,
  FC_PAC_FIO                  VARCHAR2(100 BYTE),
  FC_VIDANO_PAC               VARCHAR2(40 BYTE),
  DATE_PMS_GIVEN_TO_PAC       DATE,
  FC_NAZMED                   VARCHAR2(500 BYTE),
  NAZ_KOL                     NUMBER,
  NAZ_EI                      VARCHAR2(50 BYTE),
  FK_TREB_DPC                 VARCHAR2(50 BYTE),
  FC_PAC_DATE_ROJD            VARCHAR2(50 BYTE),
  FC_VRACH                    VARCHAR2(200 BYTE),
  FC_NAZ_TO_GROUP             VARCHAR2(150 BYTE),
  FD_BEGIN_NAZ                DATE,
  FK_TREB_DPC_ID1             NUMBER,
  FK_MEDICID                  NUMBER,
  FC_TREBMEDIC                VARCHAR2(300 BYTE),
  TREB_KOL                    NUMBER,
  FC_TREB_MO_FROM             VARCHAR2(100 BYTE),
  FC_TREB_MO_GR_FROM          VARCHAR2(100 BYTE),
  FC_TREB_MO_TO               VARCHAR2(100 BYTE),
  FC_TREB_MO_GR_TO            VARCHAR2(100 BYTE),
  FD_TREB                     DATE,
  FC_TREBMEDIC_EI             VARCHAR2(50 BYTE),
  FK_TREB_DPC_ID2             NUMBER,
  FK_DPC_ID                   NUMBER,
  FK_TREBDPC                  NUMBER,
  FC_MEDIC_VIDANO_SMS         VARCHAR2(300 BYTE),
  SMS_KOL                     NUMBER,
  FD_GODEN_FC_MEDIC_SMS       DATE,
  FC_SERIAL_FC_MEDIC_SMS      VARCHAR2(50 BYTE),
  FC_DOC_MO_GR_FROM           VARCHAR2(100 BYTE),
  FC_DOC_MO_GR_TO             VARCHAR2(100 BYTE),
  FD_DOC_RASH_TREB            VARCHAR2(50 BYTE),
  FC_MEDIC_VIDANO_SMS_EI      VARCHAR2(50 BYTE),
  FK_TMEDICGIVEN_ID           NUMBER,
  FK_NAZMARK                  NUMBER,
  FK_NAZMEDLECHID             NUMBER,
  FK_MEDICGIVEN               NUMBER,
  FK_SOTRFROM                 NUMBER,
  FK_SOTRTO                   NUMBER,
  FP_MODE                     NUMBER,
  KOL_SPIS                    NUMBER,
  FK_DPCID                    NUMBER,
  FC_GIVENMEDIC               VARCHAR2(300 BYTE),
  FD_GODEN_GIVENMEDIC         DATE,
  FC_SERIAL_GIVENMEDIC        VARCHAR2(50 BYTE),
  FC_MS_MAKED_PAC_MED_LIST    VARCHAR2(100 BYTE),
  FC_SMS_GIVEN_TO_PMS         VARCHAR2(100 BYTE),
  DATE_MS_MAKED_PAC_MED_LIST  VARCHAR2(50 BYTE),
  FC_PMS_GIVEN_TO_PAC         VARCHAR2(100 BYTE)
)
ON COMMIT PRESERVE ROWS
NOCACHE
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.LEVEL_NUM IS '����� ������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_ID IS '��� ���������� ������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_PARENT IS '��� ���������� ������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_MOVENAME IS '�������� ��������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_MEDIC_NAME IS '�������� �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FN_MEDIC_KOL IS '���-�� �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_MEDIC_EI IS '��. ���������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_FROM IS '�� ����'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_TO IS '����'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FD_DATE_MOVE IS '����� ���� ��������� ��������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FD_GODEN IS '���� �������� ����������� �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_SERIAL IS '����� ����������� �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_PACID IS 'ID ����'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_VRACHID IS 'ID �����'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_NM_ID IS '������ �� ASU.TNAZMED.FK_ID'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_NML_ID IS '������ �� ASU.TNAZMEDLECH.FK_ID'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_PAC_FIO IS '��� ��������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_VIDANO_PAC IS '�������, �������� ������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.DATE_PMS_GIVEN_TO_PAC IS '���� ������ ��������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_NAZMED IS '�������� ����������� �� ����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.NAZ_KOL IS '���-�� ������������ �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.NAZ_EI IS 'FK_treb_dpc_ID1'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_TREB_DPC IS 'TNAZMEDLECH.fk_treb_dpc - ������ �� med.ttreb_dpc.FK_ID'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_PAC_DATE_ROJD IS '���� �������� ��������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_VRACH IS '��� �����, ���������� ����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_NAZ_TO_GROUP IS '������ ���. ���., ������� ���������� ����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FD_BEGIN_NAZ IS '���� ����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_MEDICID IS 'med.ttreb_dpc.fk_medicid - ������ �� med.tmedic.medicid'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_TREBMEDIC IS '������������� ����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.TREB_KOL IS '������������� ���-��'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_TREB_MO_FROM IS '��� �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_TREB_MO_GR_FROM IS '��� ����������� (������)'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_TREB_MO_TO IS '� ���� �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_TREB_MO_GR_TO IS '� ���� ����������� (������)'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FD_TREB IS '���� ����������� ����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_TREBMEDIC_EI IS '��. ���. �������������� �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_TREB_DPC_ID2 IS 'med.tdpc.fk_trebdpc ������ ������ � ���������� �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_DPC_ID IS 'med.tdpc.dpcid'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_MEDIC_VIDANO_SMS IS '����������, �������� �� ����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.SMS_KOL IS '�������� ���-�� (�� ��������� ���)'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FD_GODEN_FC_MEDIC_SMS IS '���� �������� �����������, ����������� ������� �� �� ���������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_SERIAL_FC_MEDIC_SMS IS '����� �����������, ����������� ������� �� �� ���������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_DOC_MO_GR_FROM IS '�������� �� ������ ��'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_DOC_MO_GR_TO IS '�������� ������� ��'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FD_DOC_RASH_TREB IS '����� ���������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_MEDIC_VIDANO_SMS_EI IS '��. ���. ��������� �����������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_TMEDICGIVEN_ID IS 'asu.tmedicgiven.fk_id'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_NAZMARK IS 'asu.tmedicgiven.fk_nazmark'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_NAZMEDLECHID IS 'asu.tmedicgiven.fk_nazmedlechid'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_MEDICGIVEN IS 'asu.tmedicgiven.fk_medicgiven'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_SOTRFROM IS 'asu.tmedicgiven.fk_sotrfrom'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_SOTRTO IS 'asu.tmedicgiven.fk_sotrto'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FP_MODE IS 'asu.tmedicgiven.fp_mode'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.KOL_SPIS IS 'asu.tmedicgiven.fn_kol'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FK_DPCID IS 'asu.tmedicgiven.fk_dpcid'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_GIVENMEDIC IS '����������, ���������� �������� � ��������� �� �������� '
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FD_GODEN_GIVENMEDIC IS '���� �������� �����������, ����������� �������� �� � ���������� �� ��������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_SERIAL_GIVENMEDIC IS '����� �����������, ����������� �������� �� � ���������� �� �������� '
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_MS_MAKED_PAC_MED_LIST IS '��, �������������� ������ ������������ ��� �������� �� ��������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_SMS_GIVEN_TO_PMS IS '������� ��, ���������� ����������� �������� ��'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.DATE_MS_MAKED_PAC_MED_LIST IS '���� �������� ������������ �� ��������'
/

COMMENT ON COLUMN ASU.TMP_NAZSPIS.FC_PMS_GIVEN_TO_PAC IS '�������� ��, ��������� ����������� �� ��������'
/


