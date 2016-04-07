Unit KxStreamEx;

{$IFDEF VER180}
{$DEFINE DELPHI6+}
{$DEFINE DELPHI7+}
{$ENDIF}
{$IFDEF VER170}
{$DEFINE DELPHI6+}
{$DEFINE DELPHI7+}
{$ENDIF}
{$IFDEF VER150}
{$DEFINE DELPHI6+}
{$DEFINE DELPHI7+}
{$ENDIF}
{$IFDEF ver140}
{$DEFINE DELPHI6+}
{$ENDIF}
{$IFDEF DELPHI6+}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}
{$IFDEF DELPHI7+}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_TYPE OFF}
{$ENDIF}
{$ENDIF}

Interface

Uses
  Classes, SysUtils, Windows, KxConst;

Type

  TStreamEx = Class(TObject)
  Private
    Function GetPosition: Int64;
    Procedure SetPosition(Pos: Int64);
    Function GetSize: Int64;
  Protected
    Procedure SetSize(NewSize: Int64); Virtual;
  Public
    Function Read(Var Buffer; Count: Longint): Longint; Virtual; Abstract;
    Function Write(Const Buffer; Count: Longint): Longint; Virtual; Abstract;
    Function Seek(Offset: Int64; Origin: Word): Int64; Virtual; Abstract;
    Procedure ReadBuffer(Var Buffer; Count: Longint);
    Procedure WriteBuffer(Const Buffer; Count: Longint);
    Function CopyFrom(Source: TStreamEx; Count: Longint): Longint;
    Procedure ReadResHeader;
    Property Position: Int64 Read GetPosition Write SetPosition;
    Property Size: Int64 Read GetSize Write SetSize;
  End;

  THandleStreamEx = Class(TStreamEx)
  Private
    FHandle: Integer;
  Protected
    Procedure SetSize(NewSize: Int64); Override;
  Public
    Constructor Create(AHandle: Integer);
    Function Read(Var Buffer; Count: Longint): Longint; Override;
    Function Write(Const Buffer; Count: Longint): Longint; Override;
    Function Seek(Offset: Int64; Origin: Word): Int64; Override;
    Property Handle: Integer Read FHandle;
  End;

  TFileStreamEx = Class(THandleStreamEx)
  Public
    Constructor Create(Const FileName: String; Mode: Word);
    Destructor Destroy; Override;
  End;

Implementation

{ TStreamEx }

Function TStreamEx.GetPosition: Int64;
Begin
  Result := Seek(0, 1);
End;

Procedure TStreamEx.SetPosition(Pos: Int64);
Begin
  Seek(Pos, 0);
End;

Function TStreamEx.GetSize: Int64;
Var
  Pos: Int64;
Begin
  Pos := Seek(0, 1);
  Result := Seek(0, 2);
  Seek(Pos, 0);
End;

Procedure TStreamEx.SetSize(NewSize: Int64);
Begin
  // default = do nothing  (read-only streams, etc)
End;

Procedure TStreamEx.ReadBuffer(Var Buffer; Count: Longint);
Begin
  //..  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
  //..    raise EReadError.Create(ERR_SReadError);
End;

Procedure TStreamEx.WriteBuffer(Const Buffer; Count: Longint);
Begin
  {  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
      raise EWriteError.Create(ERR_SWriteError);}
End;

Function TStreamEx.CopyFrom(Source: TStreamEx; Count: Longint): Longint;
Const
  MaxBufSize = $F000;
Var
  BufSize, N: Integer;
  Buffer: PChar;
Begin
  If Count = 0 Then
  Begin
    Source.Position := 0;
    Count := Source.Size;
  End;
  Result := Count;
  If Count > MaxBufSize Then BufSize := MaxBufSize Else BufSize := Count;
  GetMem(Buffer, BufSize);
  Try
    While Count <> 0 Do
    Begin
      If Count > BufSize Then N := BufSize Else N := Count;
      Source.ReadBuffer(Buffer^, N);
      WriteBuffer(Buffer^, N);
      Dec(Count, N);
    End;
  Finally
    FreeMem(Buffer, BufSize);
  End;
End;

{function TStreamEx.ReadComponent(Instance: TComponent): TComponent;
var
  Reader: TReader;
begin
  Reader := TReader.Create(Self, 4096);
  try
    Result := Reader.ReadRootComponent(Instance);
  finally
    Reader.Free;
  end;
end;}

{procedure TStreamEx.WriteComponent(Instance: TComponent);
begin
  WriteDescendent(Instance, nil);
end;}

{procedure TStreamEx.WriteDescendent(Instance, Ancestor: TComponent);
var
  Writer: TWriter;
begin
  Writer := TWriter.Create(Self, 4096);
  try
    Writer.WriteDescendent(Instance, Ancestor);
  finally
    Writer.Free;
  end;
end;}

{function TStreamEx.ReadComponentRes(Instance: TComponent): TComponent;
begin
  ReadResHeader;
  Result := ReadComponent(Instance);
end;}

{procedure TStreamEx.WriteComponentRes(const ResName: string; Instance: TComponent);
begin
  WriteDescendentRes(ResName, Instance, nil);
end;}

{procedure TStreamEx.WriteDescendentRes(const ResName: string; Instance,
  Ancestor: TComponent);
var
  HeaderSize: Integer;
  Origin, ImageSize: Longint;
  Header: array[0..79] of Char;
begin
  Byte((@Header[0])^) := $FF;
  Word((@Header[1])^) := 10;
  HeaderSize := StrLen(StrUpper(StrPLCopy(@Header[3], ResName, 63))) + 10;
  Word((@Header[HeaderSize - 6])^) := $1030;
  Longint((@Header[HeaderSize - 4])^) := 0;
  WriteBuffer(Header, HeaderSize);
  Origin := Position;
  WriteDescendent(Instance, Ancestor);
  ImageSize := Position - Origin;
  Position := Origin - 4;
  WriteBuffer(ImageSize, SizeOf(Longint));
  Position := Origin + ImageSize;
end;}

Procedure TStreamEx.ReadResHeader;
{var
  ReadCount: Cardinal;
  Header: array[0..79] of Char;}
Begin
  //..  FillChar(Header, SizeOf(Header), 0);
  (*
    ReadCount := Read(Header, SizeOf(Header) - 1);
    if (Byte((@Header[0])^) = $FF) and (Word((@Header[1])^) = 10) then
      Seek(StrLen(Header + 3) + 10 - ReadCount, 1)
    else
      raise EInvalidImage.Create(ERR_SInvalidImage);
    *)
End;

{ THandleStream }

Constructor THandleStreamEx.Create(AHandle: Integer);
Begin
  FHandle := AHandle;
End;

Function THandleStreamEx.Read(Var Buffer; Count: Longint): Longint;
Begin
  Result := FileRead(FHandle, Buffer, Count);
  If Result = -1 Then Result := 0;
End;

Function THandleStreamEx.Write(Const Buffer; Count: Longint): Longint;
Begin
  Result := FileWrite(FHandle, Buffer, Count);
  If Result = -1 Then Result := 0;
End;

Function THandleStreamEx.Seek(Offset: Int64; Origin: Word): Int64;
Begin
  Result := FileSeek(FHandle, Offset, Origin);
End;

Procedure THandleStreamEx.SetSize(NewSize: Int64);
Begin
  Seek(NewSize, soFromBeginning);
  Win32Check(SetEndOfFile(FHandle));
End;

{ TFileStream }

Constructor TFileStreamEx.Create(Const FileName: String; Mode: Word);
Begin
  If Mode = fmCreate Then
  Begin
    FHandle := FileCreate(FileName);
    If FHandle < 0 Then
      //..raise EFCreateError.CreateFmt(ERR_CREATEFILE, [FileName]);
  End
  Else
  Begin
    FHandle := FileOpen(FileName, Mode);
    If FHandle < 0 Then
      //..raise EFOpenError.CreateFmt(ERR_FILEINUSE, [FileName]);
  End;
End;

Destructor TFileStreamEx.Destroy;
Begin
  If FHandle >= 0 Then FileClose(FHandle);
End;

End.

