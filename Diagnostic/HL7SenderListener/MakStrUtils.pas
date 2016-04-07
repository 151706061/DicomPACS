unit MakStrUtils;
interface
uses SysUtils;
const
  DEFAULTCASE = MaxInt;

function HL7Date2RealTime(const s: String): String;
function HL7Date2RealDate(const s: String): String;
function DateTimeToHL7(const dt: TDateTime): String; //SI
function DelBSpace(const S: String): String;
function Copy2Symb(const S: String; Symb: Char): String;
function Copy2SymbDel(var S: String; Symb: Char): String;
procedure DelFirst(var S: String);
function NPos(const C: String; S: String; N: Integer; DefaultValue: Integer = 0): Integer;
function CopyLim(const s: String; StrBeg, StrEnd: Integer): String;
function GetSubParam(const s: String; SubNum: Integer): String;
function MultMatch(const s: String; const Cases: array of String; DefaultValue: Integer = DEFAULTCASE): Integer;

implementation
//SI
function DateTimeToHL7(const dt: TDateTime): String;
begin
  Result := FormatDateTime('yyyymmddhhnnss', dt);
end;
//SI end

function HL7Date2RealTime(const s: String): String;
var
  s1: String;
  i: Integer;
begin
  s1 := '';
  for i := 1 to length(s) do
    if s[i] in ['0'..'9'] then
      s1 := s1 + s[i];
  case Length(s1) of
    12:
      Result := Format('%s:%s:00', [Copy(s1, 9, 2), Copy(s1, 11, 2)]);
    14:
      Result := Format('%s:%s:%s', [Copy(s1, 9, 2), Copy(s1, 11, 2), Copy(s1, 13, 2)]);
    else
      result := s;
  end;
end;

function HL7Date2RealDate(const s: String): String;
var
  s1: String;
  i: Integer;
begin
  s1 := '';
  for i := 1 to length(s) do
    if s[i] in ['0'..'9'] then
      s1 := s1 + s[i];
  case length(s1) of
    8, 12:
      Result := Format('%s-%s-%s', [Copy(s1, 1, 4), Copy(s1, 5, 2), Copy(s1, 7, 2)]);
    else
      result := s;
  end;
end;

function DelBSpace(const S: String): String;
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] = ' ') do
    Inc(I);
  Result := Copy(S, I, MaxInt);
end;

function Copy2Symb(const S: String; Symb: Char): String;
var
  i: Integer;
begin
  i := Pos(Symb, S);
  if i = 0 then
    i := Length(S) + 1;
  Result := Copy(S, 1, i - 1);
end;

function Copy2SymbDel(var S: String; Symb: Char): String;
begin
  Result := Copy2Symb(S, Symb);
  S := DelBSpace(Copy(S, Length(Result) + 1, Length(S)));
end;

procedure DelFirst(var S: String);
begin
  Delete(S, 1, 1);
end;

function NPos(const C: String; S: String; N: Integer; DefaultValue: Integer = 0): Integer;
var
  I, P, K: Integer;
begin
  Result := DefaultValue;
  K := 0;
  for I := 1 to N do
  begin
    P := Pos(C, S);
    Inc(K, P);
    if (I = N) and (P > 0) then
    begin
      Result := K;
      Exit;
    end;
    if P = 0 then
      exit;
    Delete(S, 1, P);
  end;
end;

function CopyLim(const s: String; StrBeg, StrEnd: Integer): String;
begin
  Result := Copy(s, StrBeg, StrEnd - StrBeg + 1);
end;

function GetSubParam(const s: String; SubNum: Integer): String;
var
  LastPos: Integer;
begin
  LastPos := NPos('^', s, SubNum);
  if LastPos = 0 then
    LastPos := MaxInt
  else
    LastPos := LastPos - 1;
  Result := CopyLim(s, NPos('^', s, SubNum - 1) + 1, LastPos);
end;

function MultMatch(const s: String; const Cases: array of String; DefaultValue: Integer = DEFAULTCASE): Integer;
var
  i: Integer;
begin
  Result := DefaultValue;
  if s = '' then
    Exit;
  for i := 0 to High(Cases) do
    if Pos(Cases[i], s) <> 0 then
    begin
      Result := i;
      Break;
    end;
end;

end.