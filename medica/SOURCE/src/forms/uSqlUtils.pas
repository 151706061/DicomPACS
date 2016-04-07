unit uSqlUtils;

interface

uses Oracle;

function RunExecSQL(Os: TOracleSession; ASQL: string; AValue: array of const): Boolean;

implementation

uses Classes,Sysutils;

procedure GetVarNames(ASQL: string; aSl: TStringList);
var I,j, Index1: Integer;
    sSql : String;
//    iLng : Integer;
begin
  aSl.Clear;
  sSql := ASQL;
  I := 1;
  While I < Length(ASQL) do
//  for I := 0 to Length(ASQL) - 1 do
  begin
    if IsDelimiter(':&',ASQL,I) then
    begin
      Index1 := I; // индекс  : или &
      For j := I + 1 to Length(ASQL) do
        if IsDelimiter(' ),.',ASQL,j) then
        begin
          I := j;
          aSl.Add(Copy(aSql,Index1 + 1,j - Index1 - 1));
          Break;
        end;
    end;
    inc(I);
  end;
end;

function RunExecSQL(Os: TOracleSession; ASQL: string; AValue: array of const): Boolean;
var
  oq : TOracleQuery;
  i  : integer;
  sl : TStringList;
begin

  Result := False;

  oq := TOracleQuery.Create(nil);
  sl := TStringList.Create;
  try
    GetVarNames(ASQL,sl);
    if sl.Count = Length(AValue) then
    begin
      oq.Session := Os;
      oq.SQL.Text := ASQL;

      if High(AValue) - Low(AValue) > -1 then
        for I := Low(AValue) to High(AValue) do
        begin
          case AValue[i].VType of
            vtInteger    : oq.DeclareAndSet(sl.Strings[I],otInteger,AValue[i].VInteger);
            vtChar       : oq.DeclareAndSet(sl.Strings[I],otString,AValue[i].VChar);
            vtExtended   : oq.DeclareAndSet(sl.Strings[I],otFloat,AValue[i].VExtended^);
            vtString     : oq.DeclareAndSet(sl.Strings[I],otString,AValue[i].VString^);
            vtAnsiString : oq.DeclareAndSet(sl.Strings[I],otString,string(AValue[i].VAnsiString));
            vtVariant    : oq.DeclareAndSet(sl.Strings[I],otString,AValue[i].VVariant^);
          end;
        end;
      oq.Execute;
      Result := True;
    end
    else
      Raise Exception.Create('Sql: ' + #10#13 + ASQL + #10#13 + #10#13 +
        'Not all variables bound');
  finally
    oq.Free;
    sl.Free;
  end;
end;

end.
