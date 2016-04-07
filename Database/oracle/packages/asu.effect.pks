DROP PACKAGE ASU.EFFECT
/

--
-- EFFECT  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."EFFECT" 
  IS
-- Purpose: ������ ������������� ������� ��������
-- ����: �� ������� ����� ������������ ���� �� 4-�� ����� �����,
-- ����� ���������� ������� �������������� �� ���� ������� � ����������
-- ������ ��������, ��� ������ ���� ��� ������� �������
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- Sam        04.07.2000  Create
-- ---------   ------  ------------------------------------------
  nFK_PACID number;
  nFK_VRACHID number;
  procedure SetnFK_VRACHID(nValue in number);
  procedure SetnFK_PACID(nValue in number);
  -- �������� ��� ���������� ����������� ������� �������� ���� �������
  function get_synnazid (pSyn in varchar2) Return number;
  -- �� �� �� �� ���� ��������
  function get_idsynnazid(pFK_SMID in number) return number;
  --�������� � TIB ���������� �����
  procedure get_resbysyn(sSyn in varchar2, pFK_NAZID in number);
  --���� �� �� ���� ��������
  procedure get_resbysynid (nSynID in number, pFK_NAZID in number);
  procedure proceed_all(pFK_PACID IN NUMBER,pFK_VRACHID IN NUMBER);
  procedure proceed(pFK_VID in number); -- ��������� ��� �����

  procedure test_ad_sist(pFK_VID in integer); --������������� ��������
  procedure test_ad_diast(pFK_VID in integer);  -- �������������� ��������
  procedure test_biohim(pFK_VID in integer);  -- ��������
  procedure test_vem(pFK_VID in integer);  -- ��������������
  procedure test_ekg(pFK_VID in integer);  -- �������������������
  procedure test_kard (pFK_VID in number); -- ������ ��������� ������������
  procedure test_res (pFK_VID in number); -- ������� ���������
  procedure test_weight (pFK_VID in number); -- ������������������ ������
  procedure test_kur (pFK_VID in number); -- �������
  procedure test_fis_akt (pFK_VID in number); -- ���������� ����������
END; -- Package Specification EFFEFCT
/

SHOW ERRORS;


