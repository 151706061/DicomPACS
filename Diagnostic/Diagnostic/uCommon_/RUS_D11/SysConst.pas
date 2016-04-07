{ *********************************************************************** }
{                                                                         }
{ Delphi / Kylix Cross-Platform Runtime Library                           }
{                                                                         }
{ Copyright (c) 1995, 2001 Borland Software Corporation                   }
{                                                                         }
{  �����������: 1999-2002 Polaris Software                                }
{               http://polesoft.da.ru                                     }
{ ��������� ��� D11 2008 Yuri Zhukov                    }
{          uura@mail.ru                                 } 
{ *********************************************************************** }

unit SysConst;

interface

resourcestring
  SUnknown = '<����������>';
  SInvalidInteger = '''%s'' - �������� ����� ��������';
  SInvalidFloat = '''%s'' - �������� ������� ��������';
  SInvalidCurrency = '''%s'' - �������� �������� ��������';
  SInvalidDate = '''%s'' - �������� ����';
  SInvalidTime = '''%s'' - �������� �����';
  SInvalidDateTime = '''%s'' - �������� ���� � �����';
  SInvalidDateTimeFloat = '''%g'' - �������� ���� � �����';
  SInvalidTimeStamp = '''%d.%d'' - �������� ���� � ����� (timestamp)';
  SInvalidGUID = '''%s'' - �������� �������� GUID';
  SInvalidBoolean = '''%s'' - �������� ���������� ��������';
  STimeEncodeError = '�������� �������� ��� ������������ �������';
  SDateEncodeError = '�������� �������� ��� ������������ ����';
  SOutOfMemory = '�� ������� ������';
  SInOutError = '������ �����/������ %d';
  SFileNotFound = '���� �� ������';
  SInvalidFilename = '�������� ��� �����';
  STooManyOpenFiles = '������� ����� �������� ������';
  SAccessDenied = '� ������� � ����� ��������';
  SEndOfFile = '������ �� ���������� �����';
  SDiskFull = '���� �����';
  SInvalidInput = '�������� ���� �����';
  SDivByZero = '������� �� ����';
  SRangeError = '������ ������ �� ������� (Range check)';
  SIntOverflow = '������������ ������';
  SInvalidOp = '�������� �������� � �������� �������';
  SZeroDivide = '��������������� ������� �� ����';
  SOverflow = '��������������� ������������';
  SUnderflow = '��������������� ������ (underflow)';
  SInvalidPointer = '�������� �������� � ����������';
  SInvalidCast = '�������� ���������� ������';
{$IFDEF MSWINDOWS}  
  SAccessViolationArg3 = '��������� ������� �� ������ %p. %s �� ������ %p';
{$ENDIF}  
{$IFDEF LINUX}
  SAccessViolationArg2 = '��������� ������� �� ������ %p, ��������� � ������ %p';
{$ENDIF}  
  SAccessViolationNoArg = '��������� �������';
  SStackOverflow = '������������ �����';
  SControlC = '������� Control-C';
  SQuit = '������� ������ �����';
  SPrivilege = '����������������� ����������';
  SOperationAborted = '�������� ��������';
  SException = '�������������� �������� %s � ������ %s �� ������ %p.' + sLineBreak + '%s%s' + sLineBreak;
  SExceptTitle = '������ ����������';
{$IFDEF LINUX}
  SSigactionFailed = 'sigaction call failed';
{$ENDIF}  
  SInvalidFormat = '������ ''%s'' ������� ��� ����������� � ����������';
  SArgumentMissing = '��� ��������� ��� ������� ''%s''';
  SDispatchError = '������ ���������� ������� �� ��������������';
  SReadAccess = '������';
  SWriteAccess = '������';
  SResultTooLong = '��������� �������������� �������, ��� 4096 ��������';
  SFormatTooLong = '������ ������� ������� �������';

  SVarArrayCreate = '������ �������� ����������� �������';
  SVarArrayBounds = '������ ����������� ������� ����� �� �������';
  SVarArrayLocked = '���������� ������ ������������';
  SVarArrayWithHResult = '����������� ������ ����������� ��� safe �������: %s%.8x';

  SInvalidVarCast = '�������� �������������� ����������� ����';
  SInvalidVarOp = '�������� �������� � ���������';
  SInvalidVarNullOp = '�������� �������� � NULL';
  SInvalidVarOpWithHResultWithPrefix = '�������� �������� � ��������� (%s%.8x)'#10'%s';
  SVarTypeRangeCheck1 = '������ ������ �� ������� (range check) ��� �������� ���� (%s)';
  SVarTypeRangeCheck2 = '������ ������ �� ������� (range check) ��� ��������������� �������� ���� (%s) � ��� (%s)';
  SVarTypeOutOfRangeWithPrefix = '������������ ���������� ��� (%s%.4x) ����� �� �������';
  SVarTypeAlreadyUsedWithPrefix = '������������ ���������� ��� (%s%.4x) ��� ������������ %s';
  SVarTypeNotUsableWithPrefix = '������������ ���������� ��� (%s%.4x) �������� �����������';
  SVarTypeTooManyCustom = '���������������� c������ ����� ������������ ���������� �����';

  // the following are not used anymore
  SVarNotArray = '������� �� �������� ��������' deprecated; // not used, use SVarInvalid
  SVarTypeUnknown = '����������� ������������ ���������� ��� (%.4x)' deprecated; // not used anymore
  SVarTypeOutOfRange = '������������ ���������� ��� (%.4x) ����� �� �������';
  SVarTypeAlreadyUsed = '������������ ���������� ��� (%.4x) ��� ������������ %s';
  SVarTypeNotUsable = '������������ ���������� ��� (%.4x) �������� �����������';
  SInvalidVarOpWithHResult = '�������� �������� � ��������� ($%.8x)' {$IFDEF VER150}deprecated{$ENDIF};
  
  SVarTypeCouldNotConvert = '�� ���� ������������� ������� ���� (%s) � ��� (%s)';
  SVarTypeConvertOverflow = '������������ ��� �������������� �������� ���� (%s) � ��� (%s)';
  SVarOverflow = '������������ ��������';
  SVarInvalid = '�������� ��������';
  SVarBadType = '�������� ��� ��������';
  SVarNotImplemented = '�������� �� ��������������';
  SVarOutOfMemory = '�������� � ��������� �� ������� ������';
  SVarUnexpected = '����������� ������ ��������';

  SVarDataClearRecursing = '�������� �� ����� ���������� VarDataClear';
  SVarDataCopyRecursing = '�������� �� ����� ���������� VarDataCopy';
  SVarDataCopyNoIndRecursing = '�������� �� ����� ���������� VarDataCopyNoInd';
  SVarDataInitRecursing = '�������� �� ����� ���������� VarDataInit';
  SVarDataCastToRecursing = '�������� �� ����� ���������� VarDataCastTo';
  SVarIsEmpty = '������� - ������';
  sUnknownFromType = '�� ���� ������������� �� ���������� ����';
  sUnknownToType = '�� ���� ������������� � ��������� ���';
  SExternalException = '������� �������������� �������� %x';
  SAssertionFailed = 'Assertion failed';
  SIntfCastError = '��������� �� ��������������';
  SSafecallException = '�������������� �������� � safecall ������';
  SAssertError = '%s (%s, ������ %d)';
  SAbstractError = '����������� ������';
  SModuleAccessViolation = '��������� ������� �� ������ %p � ������ ''%s''. %s �� ������ %p';
  SCannotReadPackageInfo = '�� ���� �������� ���������� ������ ��� ������ ''%s''';
  sErrorLoadingPackage = '�� ���� ��������� ����� %s.'#13#10'%s';
  SInvalidPackageFile = '�������� ���� ������ ''%s''';
  SInvalidPackageHandle = '�������� ���������� ������';
  SDuplicatePackageUnit = '�� ���� ��������� ����� ''%s''.  �� �������� ������ ''%s''' +
    ', ������� ����� ���������� � ������ ''%s''';
  SOSError = '��������� ������.  ���: %d.'+sLineBreak+'%s';
  SUnkOSError = '������ ��� ������ ������� ��';
  SWin32Error = '������ Win32.  ���: %d.'#10'%s';
  SUnkWin32Error = '������ ������� Win32 API';
  SNL = '���������� �� ����� �������� �� ������������� ���� �����������';

  SShortMonthNameJan = '���';
  SShortMonthNameFeb = '���';
  SShortMonthNameMar = '���';
  SShortMonthNameApr = '���';
  SShortMonthNameMay = '���';
  SShortMonthNameJun = '���';
  SShortMonthNameJul = '���';
  SShortMonthNameAug = '���';
  SShortMonthNameSep = '���';
  SShortMonthNameOct = '���';
  SShortMonthNameNov = '���';
  SShortMonthNameDec = '���';

  SLongMonthNameJan = '������';
  SLongMonthNameFeb = '�������';
  SLongMonthNameMar = '����';
  SLongMonthNameApr = '������';
  SLongMonthNameMay = '���';
  SLongMonthNameJun = '����';
  SLongMonthNameJul = '����';
  SLongMonthNameAug = '������';
  SLongMonthNameSep = '��������';
  SLongMonthNameOct = '�������';
  SLongMonthNameNov = '������';
  SLongMonthNameDec = '�������';

  SShortDayNameSun = '��';
  SShortDayNameMon = '��';
  SShortDayNameTue = '��';
  SShortDayNameWed = '��';
  SShortDayNameThu = '��';
  SShortDayNameFri = '��';
  SShortDayNameSat = '��';

  SLongDayNameSun = '�����������';
  SLongDayNameMon = '�����������';
  SLongDayNameTue = '�������';
  SLongDayNameWed = '�����';
  SLongDayNameThu = '�������';
  SLongDayNameFri = '�������';
  SLongDayNameSat = '�������';

{$IFDEF LINUX}
  SEraEntries = '';
{$ENDIF}

  SCannotCreateDir = '���������� ������� �������';
  SCodesetConversionError = '������ �������������� codeset';


implementation

end.