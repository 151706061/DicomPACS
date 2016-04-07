{
  Защищенный связный список для работы с очередью
  в многопоточном режиме(первый вошел-первый вышел)

}
unit uPushPop;

interface

uses
  Windows,
  Classes,
  SyncObjs,
  SysUtils;

type
  PItemList = ^TItemList;

  TItemList = record
    Prev, Next: PItemList;
    Data: Pchar;
  end;

  TPushPop = class
  PRIVATE
    FCS: TCriticalSection;
    FRootItem: PItemList;
    FLastItem: PItemList;
    FItemsCount: Integer;
    procedure Lock;
    procedure Unlock;
    procedure DeleteItem0;
    function GetCount: Integer;
  PUBLIC
    constructor Create;
    destructor Destroy; OVERRIDE;
    procedure Push(const Str: String);
    procedure PopAllToFile(const FileName: String);
    procedure PushFromFile(const FileName: String);
    function Exists(const Str: String): Boolean;
    function Pop: String;
    function Peek: String;
    procedure Clear;
    property Count: Integer READ GetCount;
  end;

const
  AeDelim = '\!MakhaonDelimiter!/';

function ExtractFileFromAEStr(const s: String): String; //SI inline;

implementation

{ TPushPop }

constructor TPushPop.Create;
begin
  New(FRootItem);
  New(FLastItem);

  FRootItem.Prev := NIL;
  FRootItem.Next := FLastItem;
  FRootItem.Data := NIL;
  FLastItem.Prev := FRootItem;
  FLastItem.Data := NIL;
  FLastItem.Next := NIL;

  FItemsCount := 0;
  FCS := TCriticalSection.Create;
end;

destructor TPushPop.Destroy;
begin
  Lock;
  while FRootItem.Next <> FLastItem do
    DeleteItem0;
  Dispose(FRootItem);
  Dispose(FLastItem);
  Unlock;
  FreeAndNil(FCS);
end;

function ExtractFileFromAEStr(const s: String): String;
begin
  Result := Copy(s, 1, Pos(AeDelim, s) - 1);
end;

function TPushPop.Exists(const Str: String): Boolean;
var
  CurrItem: PItemList;
begin
  Lock;
  try
    CurrItem := FRootItem;
    Result := FALSE;
    while (CurrItem <> FLastItem) do
    begin
      if ExtractFileFromAEStr(String(CurrItem.Data)) = Str then
      begin
        //Exit(True);
        Result := TRUE;
        break;
      end;
      CurrItem := CurrItem.Next;
    end;
  finally
    Unlock;
  end;
end;

procedure TPushPop.Lock;
begin
  FCS.Enter;
end;

procedure TPushPop.Unlock;
begin
  FCS.Leave;
end;

procedure TPushPop.DeleteItem0;
var
  p: PItemList;
begin
  if FItemsCount = 0 then
    Exit;
  p := FRootItem.Next;

  p.Prev.Next := p.Next;
  p.Next.Prev := p.Prev;

  Dispose(p);
  Dec(FItemsCount);
end;

function TPushPop.Peek: String;
var
  Len: Integer;
begin
  Lock;
  try
    Len := StrLen(FRootItem.Next.Data);
    SetLength(Result, Len);
    move(FRootItem.Next.Data^, Result[1], Len * SizeOf(Char));
  finally
    Unlock;
  end;
end;

function TPushPop.Pop: String;
var
  Len: Integer;
begin
  Lock;
  try
    //SI Len := StrLen(PWideChar(FRootItem.Next.Data));
    Len := StrLen(FRootItem.Next.Data);
    SetLength(Result, Len);
    if Len > 0 then
      move(FRootItem.Next.Data^, Result[1], Len * SizeOf(Char));
    FreeMem(FRootItem.Next.Data);
    DeleteItem0;
  finally
    Unlock;
  end;
end;

procedure TPushPop.Push(const Str: String);
var
  p: PItemList;
  pi: Pchar;
begin
  pi := AllocMem((Length(Str) + 1) * SizeOf(Char));
  if Length(Str) > 0 then
    move(Str[1], pi^, Length(Str) * SizeOf(Char));
  Lock;
  try
    New(p);
    p.Data := pi;

    p.Prev := FLastItem.Prev;
    p.Next := FLastItem;
    FLastItem.Prev.Next := p;
    FLastItem.Prev := p;

    Inc(FItemsCount);
  finally
    Unlock;
  end;
end;

function TPushPop.GetCount: Integer;
begin
  Result := 0;
  if Assigned(FCS) then
  begin
    Lock;
    try
      Result := FItemsCount;
    finally
      Unlock;
    end;
  end;
end;

procedure TPushPop.Clear;
begin
  while Count <> 0 do
    Pop;
end;

procedure TPushPop.PopAllToFile(const FileName: String);
var
  F: TextFile;
begin
  if Count = 0 then
    Exit;
  AssignFile(F, FileName);
  try
    Rewrite(F);
  except
    Exit;
  end;
  try
    while Count <> 0 do
      WriteLn(F, Pop);
  finally
    CloseFile(F);
  end;
end;

procedure TPushPop.PushFromFile(const FileName: String);
var
  F: TextFile;
  s: String;
begin
  if not FileExists(FileName) then
    Exit;
  AssignFile(F, FileName);
  try
    Reset(F);
  except
    Exit;
  end;
  try
    while not EOF(F) do
    begin
      ReadLn(F, s);
      Push(s);
    end;
  finally
    CloseFile(F);
  end;
  DeleteFile(FileName);
end;

end.
