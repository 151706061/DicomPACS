{ *********************************************************************** }
{                                                                         }
{ Delphi Runtime Library                                                  }
{                                                                         }
{ Copyright (c) 1999-2001 Borland Software Corporation                    }
{                                                                         }
{  �����������: 1998-2002 Polaris Software                                }
{               http://polesoft.da.ru                                     }
{ ��������� ��� D11 2008 Yuri Zhukov                                      }
{          uura@mail.ru                                                   } 
{ *********************************************************************** }

unit ComConst;

interface

resourcestring
  SCreateRegKeyError = '������ �������� ����� (entry) ���������� �������';
  SOleError = '������ OLE %.8x';
  SObjectFactoryMissing = 'Object factory ��� ������ %s ��������';
  STypeInfoMissing = '���������� � ���� �������� ��� ������ %s';
  SBadTypeInfo = '�������� ���������� � ���� ��� ������ %s';
  SDispIntfMissing = 'Dispatch interface ������� ��� ������ %s';
  SNoMethod = '����� ''%s'' �� �������������� automation ��������';
  SVarNotObject = '������� �� ��������� �� automation ������';
  STooManyParams = 'Dispatch ������ �� ������������ ����� 64 ����������';
  SDCOMNotInstalled = 'DCOM �� ����������';
  SDAXError = '������ DAX';
  SAutomationWarning = '�������������� COM �������';
  SNoCloseActiveServer1 = '� ���������� ������� �������� COM �������. ' +
    '���� ��� ����� �������� ����� ��������� �� ��� �������, ' +
    '����� �������, �������� ';
  SNoCloseActiveServer2 = '���������� ����� ������� ���� ���������� ' +
    '����������.'#13#10#13#10'�� �������, ��� ������ ������� ��� ' +
    '����������?';

implementation

end.
