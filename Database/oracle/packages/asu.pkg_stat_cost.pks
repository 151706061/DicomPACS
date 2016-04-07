DROP PACKAGE ASU.PKG_STAT_COST
/

--
-- PKG_STAT_COST  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_STAT_COST IS
/*
DOC_IB_DSROOT
get_oper_healid -- ����� ��������, 41221 ��� ������
GET_VIPNAZ
GET_NATIVE_REGION
get_hmao_region
get_tiproom_hemodial
get_tiproom_hemodial_pr
GETOTDELRADIOLOG
GET_NOVOROGDOTD
*/
 -- ���������� ����������
 LAST_STEP  NUMBER := 9;
 vUSE_TarifDetail  NUMBER;
 vDelNoTarifUsl  NUMBER;
 vTarifDetailOwner varchar(100);
 vSmid_TYPE_V_MU_PALLIATIV NUMBER;
 vSmid_GEMODIALIZ_PERIT NUMBER;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------

 /*
   pOMS_ONLY - 1 - ������ �� ��������� ���������� ���� ���, 0 - ���
   pOWN NUMBER - 1 - ������ �������, 2 - ������ ������������������, 0 - ���
   pFILL_CACHE - 1 - ��������� ��������� �������, 0 - ��������� ������� ��� ���� ��������� �� ���������� �������, �������� � ������� ��������
   pUseTarifDetail - 1 - ����� ������ ����������� (��. asu.TarifDetail), 0 - �� ����� ������ �����������
   pTarifDetailOwner - ���� ������� ������ ����������� ��� �������� ����� �������� � ���� FC_OWNER
   pDelNoTarifUsl - ������� �� ��������� ������� asu.tsluch_dbf_calc ������ ��� ������� �� ������� ���������� �����
   aCostFromDate DATE - ������������� ���� � ����� ���������� �������� ������ aCostFromDate (���� ��� ���� ���������� ��������������� ������!)
   aUseSetDatesByKarta - � ����������� �� �������� � ���� ������ ������ ����� ���� ���������� ��� ����� ��� ��� ����� ���������,
                         ���� aUseSetDatesByKarta = 1, �� � ��������� ������� asu.tsluch_dbf_calc ������ ����� �������� ������ ��������, ����� ��� ����������� �� � ������
                         ���� aUseSetDatesByKarta = 0, �� � ��������� ������� asu.tsluch_dbf_calc ��� ���� � ����� � ��������, ��� �������� ��������
   aFill_type_v_mu - 1 - ��������� ������ � ���� ���� ���. ������ ������ ������, 0 - ��� ���������, ������������ � ��������
 */
 procedure Calculate(pOMS_ONLY NUMBER default 1,
                     pOWN NUMBER default 0,
                     pFILL_CACHE NUMBER default 1,
                     pUseTarifDetail Number default 0,
                     pTarifDetailOwner Varchar2 default '',
                     pDelNoTarifUsl Number default 1,
                     aCostFromDate DATE default null,
                     aUseSetDatesByKarta Number default 1,
                     aFill_type_v_mu Number default 1,
                     aFillVMP Number default 1,
                     aFill_Peresel_paliativ Number default 1);

 procedure CalcByPacId(aPacId Number, pUseTarifDetail Number default 0, pTarifDetailOwner Varchar2 default '');
-- procedure CalculateSK;
-- procedure CalculateNoHMAO;
-- procedure CalculateHMAO;
-- PROCEDURE CalculateByKoykavidid;
END;
/

SHOW ERRORS;


