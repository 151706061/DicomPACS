DROP PACKAGE ASU.PKG_RODIDATA
/

--
-- PKG_RODIDATA  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_RODIDATA" is

  -- Author  : A.NAKORJAKOV
  -- Created : 12.08.2009 16:29:47
  -- Purpose : ����� ��� �������� ������ � ����� ��������

  --���� ���������� ������ � ����� �� ��������?
  function IsNeedInsertData(pPacID Number, pDocObsl Number) return boolean;

  -- ������� ������ � ����� ���������� �� ���������� ����
  procedure DoInsertRodiData(pPacID Number, pPeopleID Number);

  -- ��������� ������ ���� "����"
  procedure DoDate(pPacID      Number,
                   pSmidSynOsm Varchar2,
                   pSmidSynPac Varchar2,
                   pNazOsmotr  Number);
  -- ��������� ������ ���� "����"
  procedure DoDate(pPacID      Number,
                   pSmidPac    Number,
                   pDate       Date,
                   pVrachID    Number);


  -- ��������� ������ ���� "�����"
  procedure DoNumber(pPacID      Number,
                     pSmidSynOsm Varchar2,
                     pSmidSynPac Varchar2,
                     pNazOsmotr  Number);
  -- ��������� ������ ���� "�����". ������������ �������� � pNumber
  procedure DoNumber(pPacID      Number,
                     pSmidSynOsm Varchar2,
                     pSmidSynPac Varchar2,
                     pNazOsmotr  Number,
                     pNumber     OUT Number,
                     pDoUpdate   boolean);
  -- ��������/�������� ������

  procedure DoInsNumber(pPacID      Number,
                     pSmidId     Number,
                     pVrach      Number,
                     pNumber     Number);
  -- ��������� ������ ���� "������"
  procedure DoEdit(pPacID      Number,
                   pSmidSynOsm Varchar2,
                   pSmidSynPac Varchar2,
                   pNazOsmotr  Number);
  -- ��������� ������ ���� "������". ������������ �������� � pEdit
  procedure DoEdit(pPacID      Number,
                   pSmidSynOsm Varchar2,
                   pSmidSynPac Varchar2,
                   pNazOsmotr  Number,
                   pEdit       OUT Varchar2,
                   pDoUpdate   boolean);
  -- ��������� ������ ���� "������". ������������ �������� � pEdit
  procedure DoEdit(pPacID     Number,
                   pSmidIdOsm Number,
                   pSmidIdPac Number,
                   pNazOsmotr Number,
                   pEdit      OUT Varchar2,
                   pDoUpdate  boolean);

  -- ��������/�������� ������
  procedure DoInsEdit(pPacID   Number,
                      pSmid    Number,
                      pVrachID Number,
                      pChar    Varchar2);

  -- ��������� ������ ���� "Combo"
  procedure DoCombo(pPacID      Number,
                    pSmidSynOsm Varchar2,
                    pSmidSynPac Varchar2,
                    pNazOsmotr  Number);

  -- ��������� ������ ���� "Combo". ������������ �������� � pEdit
  procedure DoCombo(pPacID      Number,
                    pSmidSynOsm Varchar2,
                    pSmidSynPac Varchar2,
                    pNazOsmotr  Number,
                    pEdit       Out Varchar2,
                    pDoUpdate   Boolean);

  -- ������ ���� ����� �� ������ pFromID �� ����� pToId
  function Get_SmidPath(pFromID Number, pToId Number) return Varchar2;

  -- ������� ������ � ����������
  procedure DoInsertNazEdit(pPacID     Number,
                            pNazSmidID Number,
                            pSmidKarta Number,
                            vAmbID     Number);

  -- ������� ������ � ����������
  procedure DoInsertNazEdit2(pPacID     Number,
                            pNazSmidID Number,
                            pSmidKarta Number,
                            vAmbID     Number);
  -- ������� ������ � ����������
  procedure DoInsertNazEdit3(pPacID     Number,
                            pNazSmidID Number,
                            pSmidKartaChar Number,
                            pSmidKartaDate Number,
                            vAmbID     Number);

  --������������
  procedure DoInsertFluoro(pPacID     Number,
                            vAmbID     Number);

  -- ������ ������ 29.01.2009 ������� ������ ���� VarChar2
  -- ��� ����� pVC2Smid ���� VARCHAR2 ���������� ����� ������� �������� ����������� ��� �������� pPeopleID
  -- � ���������� � ������ pToPacID
  procedure DoInsertVarchar2(pVC2Smid Number, pPeopleID Number, pToPacID Number);

end pkg_RodiData;
/

SHOW ERRORS;


