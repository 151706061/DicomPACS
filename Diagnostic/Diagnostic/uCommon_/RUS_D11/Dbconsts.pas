{ *************************************************************************** }
{                                                                             }
{ Kylix and Delphi Cross-Platform Visual Component Library                    }
{                                                                             }
{ Copyright (c) 1997, 2001 Borland Software Corporation                       }
{                                                                             }
{  �����������: 1998-2001 Polaris Software                                    }
{               http://polesoft.da.ru                                         }
{ ��������� ��� D11 2008 Yuri Zhukov                    }
{          uura@mail.ru                                 } 
{ *************************************************************************** }

unit DbConsts;

interface

resourcestring
  SInvalidFieldSize = '�������� ������ ����';
  SInvalidFieldKind = '�������� FieldKind';
  SInvalidFieldRegistration = '�������� ����������� ����';
  SUnknownFieldType = '��� ���� ''%s'' ����������';
  SFieldNameMissing = '����������� ��� ����';
  SDuplicateFieldName = '�������� ����� ���� ''%s''';
  SFieldNotFound = '���� ''%s'' �� �������';
  SFieldAccessError = '�� ���� �������� ������ � ���� ''%s'' ��� ���� %s';
  SFieldValueError = '�������� �������� ��� ���� ''%s''';
  SFieldRangeError = '%g - �������� �������� ��� ���� ''%s''. ����������� �������� - �� %g �� %g';
  SBcdFieldRangeError = '%s - �������� �������� ��� ���� ''%s''. ����������� �������� - �� %s �� %s';
  SInvalidIntegerValue = '''%s'' - �������� ����� �������� ��� ���� ''%s''';
  SInvalidBoolValue = '''%s'' - �������� ���������� �������� ��� ���� ''%s''';
  SInvalidFloatValue = '''%s'' - �������� ������� �������� ��� ���� ''%s''';
  SFieldTypeMismatch = '�������� ��� ���� ''%s'', ���������: %s, �����������: %s';
  SFieldSizeMismatch = '�������� ������ ��� ���� ''%s'', ���������: %d, �����������: %d';
  SInvalidVarByteArray = '�������� ���������� ��� ��� ������';
  SFieldOutOfRange = '�������� ���� ''%s'' ����� �� �������';
//  SBCDOverflow = '(������������)';
  SCantAdjustPrecision = 'Error adjusting BCD precision';
  SFieldRequired = '���� ''%s'' ������ ����� ��������';
  SDataSetMissing = '���� ''%s'' �� ����� ������ ������ (dataset)';
  SInvalidCalcType = '���� ''%s'' �� ����� ���� ����������� ��� ��������� �����';
  SFieldReadOnly = '���� ''%s'' �� ����� ���� ��������';
  SFieldIndexError = '������ ���� ����� �� �������';
  SNoFieldIndexes = '��� ��������� �������';
  SNotIndexField = '���� ''%s'' �� ������������� � �� ����� ���� ��������';
  SIndexFieldMissing = '�� ���� �������� ������ � ���������� ���� ''%s''';
  SDuplicateIndexName = '�������� ����� ������� ''%s''';
  SNoIndexForFields = '��� ������� ��� ����� ''%s''';
  SIndexNotFound = '������ ''%s'' �� ������';
  SDuplicateName = '�������� ����� ''%s'' � %s';
  SCircularDataLink = '����������� ����� ������ �� ���������';
  SLookupInfoError = '���������� ������ (lookup) ��� ���� ''%s'' - ��������';
  SNewLookupFieldCaption = '����� ��������� (lookup) ����';
  SDataSourceChange = 'DataSource �� ����� ���� �������';
  SNoNestedMasterSource = '��������� ������� �� ����� ����� MasterSource';
  SDataSetOpen = '�� ���� ��������� ��� �������� ��� ��������� ������ ������ (dataset)';
  SNotEditing = '����� ������ (Dataset) �� � ������ �������������� ��� �������';
  SDataSetClosed = '�� ���� ��������� ��� �������� ��� ��������� ������ ������ (dataset)';
  SDataSetEmpty = '�� ���� ��������� ��� �������� ��� ������� ������ ������ (dataset)';
  SDataSetReadOnly = '�� ���� �������� ����� ������ "������ ��� ������" (read-only dataset)';
  SNestedDataSetClass = '��������� ����� ������ ������ ������������� �� %s';
  SExprTermination = '��������� ������� ����������� ���������';
  SExprNameError = '������������� ��� ����';
  SExprStringError = '������������� ��������� ���������';
  SExprInvalidChar = '�������� ������ � ��������� �������: ''%s''';
  SExprNoRParen = ''')'' ���������, �� ���������� %s';
  SExprNoRParenOrComma = ''')'' ��� '','' ���������, �� ���������� %s';
  SExprNoLParen = '''('' ���������, �� ���������� %s';
  SExprExpected = '��������� ���������, �� ���������� %s';
  SExprBadField = '���� ''%s'' �� ����� �������������� � ��������� �������';
  SExprBadNullTest = 'NULL ��������� ������ � ''='' � ''<>''';
  SExprRangeError = '��������� ����� �� �������';
  SExprNotBoolean = '���� ''%s'' - �� ����������� ����';
  SExprIncorrect = '����������� �������������� ��������� �������';
  SExprNothing = '�����';
  SExprTypeMis = '������������ ����� � ���������';
  SExprBadScope = '� �������� ������ ��������� ���������� �������� �� ���������� �����';
  SExprNoArith = '���������� � ��������� ������� �� ��������������';
  SExprNotAgg = '��������� �� �������� ����������';
  SExprBadConst = '��������� ��������� ���� %s';
  SExprNoAggFilter = '���������� ��������� �� �������������� � ��������';
  SExprEmptyInList = '������ IN ������� �� ����� ���� ������';
  SInvalidKeywordUse = '�������� ������������� ��������� �����';
  STextFalse = '0';
  STextTrue = '1';
  SParameterNotFound = '�������� ''%s'' �� ������';
  SInvalidVersion = '���������� ��������� ��������� ��������';
  SParamTooBig = '�������� ''%s'', �� ���� ��������� ������ ������� %d ����';
  SBadFieldType = '��� ���� ''%s'' �� ��������������';
  SAggActive = '�������� �� ����� ���� ��������, ���� aggregate �������';
  SProviderSQLNotSupported = 'SQL �� ��������������: %s';
  SProviderExecuteNotSupported = '���������� �� ��������������: %s';
  SExprNoAggOnCalcs = '������������ ���� ''%s'' ��������� ���� ������������ ���� � aggregate, ����������� internalcalc';
  SRecordChanged = '������ �� ������� ��� �������� ������ �������������';
  SDataSetUnidirectional = '�������� �� ����������� �� ���������������� ������ ������ (dataset)';
  SUnassignedVar = 'Unassigned �������� ��������';
  SRecordNotFound = '������ �� �������';
  SFileNameBlank = '�������� FileName �� ����� ���� ������';
  SFieldNameTooLarge = '��� ���� %s ��������� %d ��������';
  
  { For FMTBcd }

  SBcdOverflow = '������������ BCD';
  SInvalidBcdValue = '%s - �������� BCD ��������';
  SInvalidFormatType = '�������� ��� ������� ��� BCD';

  { For SqlTimSt }

  SCouldNotParseTimeStamp = '�� ���� ��������� ������ SQL TimeStamp';
  SInvalidSqlTimeStamp = '�������� �������� SQL ����/�������';

  SDeleteRecordQuestion = '������� ������?';
  SDeleteMultipleRecordsQuestion = '������� ��� ��������� ������?';
  STooManyColumns = '������� (Grid) �� ����� ��������� ����� 256 �������';

  { For reconcile error }
  SSkip = '����������';
  SAbort = '��������';
  SMerge = '����������';
  SCorrect = 'Correct';
  SCancel  = '������';
  SRefresh = '��������';
  SModified = '��������';
  SInserted = '���������';
  SDeleted  = '�������';
  SCaption = '������ ��������� - %s';
  SUnchanged = '<�� ��������>';  
  SBinary = '(��������)';                              
  SAdt = '(ADT)';   
  SArray = '(������)'; 
  SFieldName = '��� ����'; 
  SOriginal = '�������� ��������'; 
  SConflict = '������������� ��������';  
  SValue = ' ��������';   
  SNoData = '<��� �������>';
  SNew = '���.';    

implementation

end.
