{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
Unit KxCache;
{$I DEFINES.INC}
Interface

Uses
  Windows, SysUtils, Classes, SyncObjs, KxISOLib, KxConst, KxStreamEx, DCM_log;

Type
  PPacket = ^TPacket;
  TPacket = Record
    Data: Array[0..32 * 2048] Of Ansichar;
    Size: Integer;
  End;

  TCacheThread = Class(TThread)
  Private
    Index: TList;
    PostGap: Boolean;
    BootImageSize: Integer;
    CacheSize: Integer;
    IndexCapacity: Integer;
    LastBlockWas: Integer;
    fCriticalSection: TCriticalSection;
    vPriority: TThreadPriority;
    Busy1, Busy2: Boolean;
  Protected
    Procedure Execute; Override;
    Procedure On_Terminate(Sender: TObject);
  Public
    Aborted,
      Finished: Boolean;
    ISOFileName: String;
    BytesAvailable: Int64;
    TotalImageSize: Int64;
    BufferSize: Int64;
    CanStart: Boolean;
    MaxPacketSize: Integer;
    FileName: String;
    Error: String;
    RemainingBytes: Int64;
    ISOHeader: TMemoryStream;
    BootImagePath: String;
    tmpbuf: Array[0..32 * 2048] Of Ansichar;
    Procedure Abort;
    Procedure Lock;
    Procedure unLock;
    Function GetFirst(Buf: PAnsiChar): Integer;
    Constructor Create(Size: Integer; RootDir: PDirEntry; fISOHeader: TMemoryStream; ImageSize: Int64; BISize: Integer; bi: String; WritePostGap: Boolean; MaxPacketSize: Integer; CriticalSection: TCriticalSection);
  End;

Implementation
Var
  PacketSize: Integer = 32 * 2048;

  {$WARNINGS OFF}

  {*******************************************************************************
                                       Create
  *******************************************************************************}
Constructor TCacheThread.Create(Size: Integer; RootDir: PDirEntry; fISOHeader: TMemoryStream; ImageSize: Int64; BISize: Integer; bi: String; WritePostGap: Boolean; MaxPacketSize: Integer; CriticalSection: TCriticalSection);
Begin
 // MnLg_ev('KxCache TCacheThread.Create',vLogDir+pLogFile);

  Inherited Create(True);
  Index := TList.Create;
  PacketSize := MaxPacketSize;
  IndexCapacity := Size Div (PacketSize);
  CacheSize := Size;
  ISOHeader := fISOHeader;
  LastBlockWas := -1;
  Error := ERR_NONE;
  Priority := tpLower;
  vPriority := tpLower;
  CanStart := False;
  BootImageSize := BISize;
  OnTerminate := On_Terminate;
  RemainingBytes := ImageSize;
  TotalImageSize := ImageSize;
  BootImagePath := bi;
  fCriticalSection := CriticalSection;
  If (ISOFileName = '') Then
  Begin
    If WritePostGap And (ImageSize < 614400) Then
      PostGap := True
    Else
      PostGap := False;
  End;
  Resume;
End;
{*******************************************************************************
                               On termiate thread
*******************************************************************************}
Procedure TCacheThread.On_Terminate;
Begin
  Index.Destroy;
End;
{*******************************************************************************
                                     Abort
*******************************************************************************}
Procedure TCacheThread.Abort;
Begin
  Aborted := True;
End;
{*******************************************************************************
                              Enter Critical Section
*******************************************************************************}
Var
  xcount: Integer = 0;
Procedure TCacheThread.Lock;
Begin
  Inc(xcount);
  fCriticalSection.Enter;
End;
{*******************************************************************************
                              Leave Critical Section
*******************************************************************************}
Procedure TCacheThread.unLock;
Begin
  fCriticalSection.Leave;
  Dec(xcount);
End;
{*******************************************************************************
                                 Execute thread
*******************************************************************************}
Procedure TCacheThread.Execute;
Var
  fs: TFileStreamEx;
  f: PFileEntry;
  bf: TFEntry;
  Packet: PPacket;
  Count, BytesToRead: Integer;
  BytesLeft: Int64;
  i: Integer;
  Position,
    FileSize: Int64;
  AvailableBytesInPacket: Integer;
  Src: String;
  NoOfFiles: Integer;
Label
  fillagain;
Begin

  BytesAvailable := 0;
  Aborted := False;
  Finished := False;
  Error := ERR_NONE;
  fs := Nil;
  BytesLeft := ISOHeader.Size;
  ISOHeader.Seek(0, soFromBeginning);
  Position := 0;
  AvailableBytesInPacket := 0;
  If (ISOFileName = '') Then
  Begin
    NoOfFiles := FileCounter - 1;
    While BytesLeft > 0 Do
    Begin
      If BytesLeft < PacketSize Then
        BytesToRead := BytesLeft
      Else
        BytesToRead := PacketSize;
      New(Packet);
      ISOHeader.Read(Packet.Data[0], BytesToRead);
      AvailableBytesInPacket := PacketSize - BytesToRead;
      If BytesToRead = PacketSize Then
      Begin
        Packet.Size := BytesToRead;
        Index.Add(Packet);
        Position := 0;
      End
      Else
      Begin
        Position := BytesToRead;
        Move(Packet.Data[0], tmpbuf[0], BytesToRead);
      End;
      BytesLeft := BytesLeft - BytesToRead;
      BytesAvailable := BytesAvailable + BytesToRead;
      Count := Index.Count;
      While Count >= IndexCapacity - 1 Do
      Begin
        CanStart := True;
        Sleep(1);
        Lock;
        Count := Index.Count;
        unLock;
      End;

    End;

    ISOHeader.Clear;
    While Index.Count >= IndexCapacity - 1 Do
    Begin
      CanStart := True;
      While Busy2 Do
        Sleep(10);
      Busy1 := True;

      Sleep(1);
      If Aborted Then
      Begin
        Lock;
        While Index.Count <> 0 Do
        Begin
          Packet := PPacket(Index.Items[0]);
          Dispose(Packet);
          Index.Delete(0);
        End;
        If Error = ERR_NONE Then
          Error := ERR_ABORTED;
        Finished := True;
        unLock;
        Terminate;
        Exit;
      End;
    End;
  End
  Else
    NoOfFiles := -1;

  //*****************************************************************************************************
  For i := -1 To NoOfFiles Do
  Begin
    If (i <> -1) Then
    Begin
      Try
        f := Files[i];
      Except
        Lock;
        Error := Format(ERR_5, [Src]);
        Finished := True;
        unLock;
        Terminate;
        Exit;
      End;
    End
    Else
    Begin
      f := @bf;
      If ISOFileName = '' Then
      Begin

        If (BootImagePath <> '') Then
        Begin
          bf.Path := BootImagePath;
          bf.FileSize := BootImageSize * 2048;
          bf.Attr := 0;
        End
        Else
        Begin
          bf.Attr := faDirectory;
        End;
      End
      Else
      Begin
        f.Path := ISOFileName;
        bf.FileSize := RemainingBytes;
        bf.Attr := 0;

      End;

    End;
    Begin
      If f.SameID <= 0 Then
      Begin
        Src := f.Path;
        If ((f.Attr And faDirectory) <> faDirectory) And (Src <> '') And (f.FileSize <> 0) Then
        Begin
          FileName := Src;
          If fs <> Nil Then fs.Destroy;
          Try
            fs := TFileStreamEx.Create(Src, fmOpenRead + fmShareDenyNone);
          Except
            Lock;
            Error := Format(ERR_FILEINUSE, [Src]);
            Finished := True;
            unLock;
            Terminate;
            Exit;
          End;
          FileSize := f.FileSize;
          BytesLeft := FileSize;
          Repeat
            If AvailableBytesInPacket = 0 Then
            Begin
              New(Packet);
              Packet.Size := 0;
              Position := 0;
              AvailableBytesInPacket := PacketSize;
            End;
            If BytesLeft < AvailableBytesInPacket Then
              BytesToRead := BytesLeft
            Else
              BytesToRead := AvailableBytesInPacket;
            fs.Read(tmpbuf[Position], BytesToRead);
            Inc(Position, (Sectors(BytesToRead) * DefaultSectorSize));
            AvailableBytesInPacket := AvailableBytesInPacket - (Sectors(BytesToRead) * DefaultSectorSize);
            If Aborted Then
            Begin
              While Busy2 Do
                Sleep(10);
              Busy1 := True;
              Lock;
              While Index.Count <> 0 Do
              Begin
                Packet := PPacket(Index.Items[0]);
                Dispose(Packet);
                Index.Delete(0);
              End;
              If Error = ERR_NONE Then
                Error := ERR_ABORTED;
              Finished := True;
              fs.Destroy;
              unLock;
              Terminate;
              Exit;
            End;
            Lock;
            Busy1 := False;
            If (i = FileCounter - 1) Or (AvailableBytesInPacket = 0) Then
            Begin
              Move(tmpbuf, Packet.Data[0], Position);
              Packet.Size := Position;
              Index.Add(Packet);
              Position := 0;
              //BytesAvailable := BytesAvailable + Packet.Size;
            End;
            Count := Index.Count;
            BytesAvailable := BytesAvailable + Sectors(BytesToRead) * DefaultSectorSize;
            BytesLeft := BytesLeft - BytesToRead;
            unLock;

            If (Count < IndexCapacity Div 4) And (vPriority <> tpNormal) Then
            Begin
              vPriority := tpNormal;
              Priority := tpNormal;
            End
            Else If (Count < IndexCapacity Div 2) And (vPriority <> tpLower) Then
            Begin
              vPriority := tpLower;
              Priority := tpLower;
            End
            Else If vPriority <> tpLowest Then
            Begin
              vPriority := tpLowest;
              Priority := tpLowest;
            End;

            While Count >= IndexCapacity - 1 Do
            Begin
              If vPriority <> tpIdle Then
              Begin
                vPriority := tpIdle;
                Priority := tpIdle;
              End;
              If Aborted Then
              Begin
                While Busy2 Do
                  Sleep(10);
                Busy1 := True;

                Lock;
                While Index.Count <> 0 Do
                Begin
                  Packet := PPacket(Index.Items[0]);
                  Dispose(Packet);
                  Index.Delete(0);
                End;
                If Error = ERR_NONE Then
                  Error := ERR_ABORTED;
                Finished := True;
                fs.Destroy;
                unLock;
                Busy1 := False;
                Terminate;
                Exit;
              End;
              CanStart := True;
              Sleep(1);
              Lock;
              Count := Index.Count;
              unLock;
            End;
          Until (BytesLeft = 0);
        End;
      End;
    End;
  End;
  If Position <> 0 Then
  Begin
    Move(tmpbuf, Packet.Data[0], Position);
    Packet.Size := Position;
    Index.Add(Packet);
    BytesAvailable := BytesAvailable + Position;
  End;
  If fs <> Nil Then
    fs.Destroy;

  If (PostGap) And (ISOFileName = '') Then
  Begin
    Lock;
    If TotalImageSize < 614400 Then
      TotalImageSize := 614400 - TotalImageSize;
    RemainingBytes := RemainingBytes + TotalImageSize;
    fillagain:
    If TotalImageSize > PacketSize Then
      BytesToRead := PacketSize
    Else
      BytesToRead := TotalImageSize;
    New(Packet);                        //
    FillChar(Packet.Data[0], BytesToRead, $00);
    Packet.Size := BytesToRead;
    Index.Add(Packet);
    TotalImageSize := TotalImageSize - BytesToRead;
    If TotalImageSize <> 0 Then Goto fillagain;
    unLock;
  End;
  CanStart := True;
  While (RemainingBytes > 0) Do
  Begin
    If Aborted Then
    Begin
      While Busy2 Do
        Sleep(10);
      Busy1 := True;
      Finished := True;
      Exit;
    End;
    Sleep(10);
  End;

  Finished := True;
  Sleep(1000);
End;
//******************************************************************************
Function TCacheThread.GetFirst(Buf: PAnsiChar): Integer;
Var
  p: PPacket;
  Count: Integer;
Begin
  If (RemainingBytes = 0) And Finished Then
  Begin
    Result := 0;
    Exit;
  End;
  Count := Index.Count;
  If Count > 0 Then
  Begin
    While Busy1 Do
    Begin
      Sleep(1);
      If Aborted Then
      Begin
        Result := 0;
        Exit;
      End;
    End;
    Lock;
    Busy2 := True;
    If Count <> 0 Then
    Begin
      p := PPacket(Index.Items[0]);
      Result := p.Size;
      Move(p.Data[0], Buf[0], Result);
      Dispose(p);
      Index.Delete(0);
      BytesAvailable := BytesAvailable - Result;
      RemainingBytes := RemainingBytes - Result;
    End
    Else
    Begin
      If Finished Then
        Result := 0
      Else
        Result := -1;
    End;
    Busy2 := False;
    unLock;
  End
  Else
  Begin
    If Finished Then
      Result := 0
    Else
      Result := -1;
  End;
End;
End.

