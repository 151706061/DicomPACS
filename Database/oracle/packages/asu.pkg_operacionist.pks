DROP PACKAGE ASU.PKG_OPERACIONIST
/

--
-- PKG_OPERACIONIST  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_OPERACIONIST" 
  IS

  --���������� ID ����� �������� �� ��������
  function Get_BloodPackBoxID(pSyn Varchar2) return Number;
  --���������� ID �������� �� ��������
  function Get_BloodOper(pSyn Varchar2) return Number;
  --������� ������ - �������� ��� ���������� - ������� ��������� ������� �� ��� ������
  procedure CreateSputniks(nNazOwner Number, nPacID Number);
  --��������� ����������
  function Get_NazResult(ptype Varchar2, pFnRes Number, pFnRes2 Number, pFcRes Varchar2, pComType Varchar2) return Varchar2;
  --������� ����� � ����������
  procedure DeleteSputnikAndNaz(nNazOwner Number, pLabSyn in Varchar2,pBloodPackBoxSyn in Varchar2);
  --������ �������� ������ � ��������� pBloodOper � ������������
  procedure Cancel_Frackcionist_Pack(pFromPack number,pBloodOper Varchar2);
END; -- Package spec
/

SHOW ERRORS;


