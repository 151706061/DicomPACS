Set define OFF
Set serveroutput on size  1000000

-- ��������
@synonyms.sql
@PUBLIC.TMINZAPAS_ddl.sql

-- ��������� �������� ������
@MED.TTDPC_Optim.sql

@CancelSignMedProduce.sql
@MED.TKARTCOMPOS_DEL_ddl.sql

@MED.TMO_IN_GROUP_ddl.sql
@MED.TMO_GROUP_ddl.sql
@MED.SEQ_TMO_IN_GROUP_ddl.sql
@MED.SEQ_TMO_GROUP_ddl.sql

@MED.TDOCS_DROP_FN_MOGROUPID.sql
@COMMENT_MED.TDOCS.FN_PRICE.sql
@TDOCS_add_FK_MOGROUPID_TO.sql
@TDOCS_add_FK_MOGROUPID_FROM.sql

@MED.TKART_drop_FN_MOGROUPID.sql
@MED.TTREB_drop_FN_MOGROUPID.sql
@MED.TMO_drop_FN_CURMOGROUPID.sql

@tmo_add_FK_CURMOGROUPID.sql

@tdocs_add_fn_spisanievid.sql
@tdocs_add_FK_MOGROUPID.sql
@FK_POSTAV_ddl.sql

@ttreb_add_FK_MOGROUPID.sql
@ttreb_add_FK_MOGROUPID_FROM.sql
@ttreb_add_FK_MOGROUPID_TO.sql
@ADD_MED.TTREB_FL_CITO.sql

@TKART_ADD_FN_PRICE_FN_KOL.sql
@MED.TKART_INS_ddl.sql
@tkart_add_FK_MOGROUPID.sql
@tkart_add_FN_PARTY_NUM.sql
@MED.TKART_fn_party_default_0_ddl.sql

@MED.TSPISANIEVID_ddl.sql

@MED.TMEDIC.FL_PRINT_LAT_NAME.sql

-- ������� � ���������
@MED.GET_DECODEDOCVID_ddl.sql
@MED.DECODEDOC_ddl.sql
@MED.GET_DECODEDOCVIDMOVE_ddl.sql

-- ������
@MED.PKGTMEDIC_ddl.sql
@MED.PKGTMO_ddl.sql
@NEOTLOZH.PKG_NEOTLOZH_ddl.sql
@MED.PKG_MEDSES_ddl.sql
@MED.PKGMEDKART_ddl.sql
@MED.PKG_PRIHRASH_ddl.sql
@MED.PKG_TREB_ddl.sql
@MED.PKG_INVOPIS_ddl.sql

-- View
@RLS.VPREPRLS_ddl.sql
@RLS.VNOMENRLS_ddl.sql
@MED.VRASH_ddl.sql
@MED.VPRIH_ddl.sql
@MED.VMOVE_ddl.sql
@MED.VINVMO_ddl.sql
@MED.VMEDKART_VS_OST_ddl.sql
@MED.VMEDKART_KOLOST_ddl.sql

-- ������������� ������ ����� ������ ��������������
--@UpdateKartMOGroups.sql -- ��������� ���� �� ������ "������"
--@Update_fn_party_num_0.sql
--@clearTables.sql --���������� ����� ������ ���������� ������ - ��������� ��� ���������, ������, ��������, ����������

-- connect sys/sysnew@asu
-- @C:\oracle\ora81\RDBMS\ADMIN\utlrp.sql 

exit;