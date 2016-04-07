// ************************************************************************** \\
// ���� ��������� �������� � �������� TSMINI ��������� ������, ������,        \\
// ���� � �������� (������)                                                   \\
// ����� ���������� ������� ������ ���������� � �������� ��������� ��������   \\
// ��� ����� �������                                                          \\
// �����: ������� �.�. 13.11.2007                                             \\
// ************************************************************************** \\
unit uReportParams;

interface
uses
  Oracle;
//==============================================================================
// �������� ������� �� TSMINI
function GetTSMINIValue( inSession : TOracleSession; const infc_section, infc_key : string) : String;

// ��������� ������� � TSMINI
function SetTSMINIValue( inSession : TOracleSession; const infc_section, infc_key, infc_value : string) : Boolean;

// �������� �������� ��� ��������� ���� inFRObjectName, �������������� �� ����� inFormName � ������ inReportName
// ��������� - ���-�� ���������� ����� � � ������ ����� ������ - �������� outValue
// ������� �.�. 13.11.2007
function GetReportValue( inSession : TOracleSession; const inFormName, inReportName, inFRObjectName : string) : String;

// ��������� �������� inValue ��� ��������� ���� inFRObjectName, �������������� �� ����� inFormName � ������ inReportName
// ������� �.�. 13.11.2007
function SetReportValue( inSession : TOracleSession; const inFormName, inReportName, inFRObjectName, inValue : string ) : Boolean;
//==============================================================================
implementation
uses
  OracleData, Forms, SysUtils;
var
  orSQL : TOracleDataSet;
  orQuery: TOracleQuery;
//==============================================================================
function GetTSMINIValue( inSession : TOracleSession; const infc_section, infc_key : string) : String;
begin
  orSQL.Session := inSession;
  orSQL.SetVariable('fc_section', infc_section);
  orSQL.SetVariable('fc_key',     infc_key);
  try
    orSQL.Close;
    orSQL.Open;
    Result := orSQL.FieldByName('fc_value').AsString;
  except
    Result := '';
  end;
end;
//------------------------------------------------------------------------------
function SetTSMINIValue( inSession : TOracleSession; const infc_section, infc_key, infc_value : string) : Boolean;
begin
  orQuery.SetVariable('fc_section', infc_section);
  orQuery.SetVariable('fc_key', infc_key);
  orQuery.SetVariable('fc_value', infc_value);
  try
    orQuery.Execute;
    result := True;
  except
    result := False;
  end;
end;
//------------------------------------------------------------------------------
function GetReportValue( inSession : TOracleSession; const inFormName, inReportName, inFRObjectName : string) : String;
begin
  Result := GetTSMINIValue( inSession, 'REPORTS|'+ExtractFileName(Application.ExeName) , inFormName+'|'+inReportName+'|'+inFRObjectName);
end;
//------------------------------------------------------------------------------
function SetReportValue( inSession : TOracleSession; const inFormName, inReportName, inFRObjectName, inValue : string ) : Boolean;
begin
  Result := SetTSMINIValue( inSession, 'REPORTS|'+ExtractFileName(Application.ExeName), inFormName+'|'+inReportName+'|'+inFRObjectName, inValue);
end;
//==============================================================================


initialization
  orSQL := TOracleDataSet.Create(nil);
  orSQL.DeclareVariable('fc_section', otString);
  orSQL.DeclareVariable('fc_key', otString);
  orSQL.SQL.Text := 'SELECT PKG_SMINI.READSTRING(:fc_section, :fc_key, '#39#39') as fc_value FROM DUAL';

  orQuery := TOracleQuery.Create(nil);
  orQuery.DeclareVariable('fc_section', otString);
  orQuery.DeclareVariable('fc_key', otString);
  orQuery.DeclareVariable('fc_value', otString);
  orQuery.SQL.Text := 'BEGIN PKG_SMINI.WRITESTRING(:fc_section, :fc_key, :fc_value); END;'

finalization
  orSQL.Free;
  orQuery.Free;

end.
 