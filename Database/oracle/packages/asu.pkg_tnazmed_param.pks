DROP PACKAGE ASU.PKG_TNAZMED_PARAM
/

--
-- PKG_TNAZMED_PARAM  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_TNAZMED_PARAM" is

  -- Author  : DELPHI5
  -- Created : 09.11.2006 15:30:22
  -- Purpose : ����� ��� TNAZMED_PARAM

PROCEDURE ADD_TNAZMED_PARAM(
      pfk_tnazmedid IN NUMBER,
      pfl_lgot IN NUMBER,
      pfk_duration IN NUMBER,
      pfk_percent IN NUMBER,
      pfk_paytype IN NUMBER,
      pfk_type IN NUMBER,
      pfc_vrachfio IN VARCHAR2,
      PFK_TSOTRID IN NUMBER,
      pFK_SMDIAGID IN NUMBER);
/*���������� ������ � ������� TNAZMED_PARAM.*/

PROCEDURE EDIT_TNAZMED_PARAM(
      pfk_tnazmedid IN NUMBER,
      pfl_lgot IN NUMBER,
      pfk_duration IN NUMBER,
      pfk_percent IN NUMBER,
      pfk_paytype IN NUMBER,
      pfk_type IN NUMBER,
      pfc_vrachfio IN VARCHAR2,
      PFK_TSOTRID IN NUMBER,
      pFK_SMDIAGID IN NUMBER);
/*�������������� ������ � ������� TNAZMED_PARAM.*/

PROCEDURE DEL_TNAZMED_PARAM(pfk_tnazmedid IN NUMBER);
/*�������� ������ � ������� TNAZMED_PARAM.*/

FUNCTION GET_FK_OTDELID(pSOTRID IN INTEGER) RETURN INTEGER;
 --���������� FK_OTDELID ��� ���������� pSOTRID

FUNCTION GET_TSMID_FK_ID_FOR_KOD(pFK_PACID IN INTEGER) RETURN INTEGER;
 --���������� TSMID_FK_ID ������� ��������� �� ������ � TSMID ���������� ��� ��������� ����������
 --SELECT T.FK_LOINC_CODE AS FC_LOINC_CODE,T.FC_NAME AS FC_KOD_KATEGORII FROM TSMID t WHERE T.FK_ID=TSMID_FK_ID

end PKG_TNAZMED_PARAM;
/

SHOW ERRORS;


