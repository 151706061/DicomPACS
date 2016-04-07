{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit KXSock;

interface

{$I KXSock.def}
{.$DEFINE SUPPORT_DESIGNTIME_CLIENTS}

uses
  KXString,
  {$IFDEF LINUX}
  Libc,
  {$ENDIF}
  KXSocket, Winsock,
  Classes,
  DICOM_charset,
  DCM_log;

{$WARNINGS OFF}
{$J+} // 4.0
const
  TKXHugeSize = 32 * 1024; // 16kb CHUNKS
  TKXXferTimeout: Word = 50000; // if data loss then set to 50000

  TKXMaxChunksBuffer = 1024 * 1024;

  TKXMaxSocketBuffer: integer = 1024 * 1024; // Winsock Buffer Size

  PeekBufferSize: Byte = 250; // do not go over 250!

  cLogFile = '\dcm_server.log';

  {$J-}

type
  //  Str1 = String[1];

    //     *   <B>ddAboutToWrite</B> denotes that your Socket Layer
    //         filter should encode, or compress the data.
    //     *   <B>ddAfterRead</B> denotes that your Socket Layer
    //         filter should decode, or decompres the data
    //     *   <B>dFreePointer</B> denotes that your Socket Layer
    //         filter should free the work pointer
  TKXDataDirection = (ddAboutToWrite, ddAfterRead, ddCleanRead, ddFreePointer);

  TKXFilterCallBack = procedure(DataDirection: TKXDataDirection; const InData: Pointer; var
    OutData: Pointer; const
    InSize: Integer; var OutSize: Integer; var Handled: Boolean; xClientThread: TThread) of object;

  // This controls outbound data only. It was implemented to
  // assist people who wanted to be able to just say send this big
  // chunk of data, without undertsanding the socket layer itself.
  //
  //
  //     *   <B>bsfRealSmall</B> uses 128 byte block of data.
  //         Obviously smaller than a TCP packet. And with Nagle
  //         enabled it would actually slow down your output.
  //         However, if you are designing a UDP based
  //         application, and know the average package size will
  //         be under 128 bytes, then you should set your output
  //         buffer to this setting. Used: <B>Very Rare</B>
  //     *   <B>bsfSmall</B> uses 256 byte block of data. Which is
  //         a standard TCP packet. Used: <B>Occasionally</B>
  //     *   <B>bsfNormal</B> uses 512 byte block of data. Which
  //         is bigger than a standard TCP packet, but is optimial
  //         when you know your data is usually bigger than 256
  //         bytes, and smaller than 512. Our testing has shown
  //         this to be very optimal when using that rule. Used: <B>Very
  //         Frequently</B>
  //     *   <B>bsfBigger</B> uses a 2048 byte block of data.
  //         Again, bigger than a standard TCP packet. Used <B>Very
  //         Rare</B>
  //     *   <B>bsgBiggest</B> uses a 4096 byte block of data.
  //         Bigger than a standard TCP packet, but is used very
  //         often by people who are porting from DOS based
  //         applications to windows. They are used to the old
  //         Borland examples which used 4kb buffers for file copy
  //         etc. Used: <B>Often</B>
  //     *   <B>bsfHUGE</B> uses a 8192 byte block of data. Bigger
  //         than a standard TCP packet, but produces the best
  //         performance. Especially is you plan to just say "Send
  //         this data, who cares how big it is". Used: <B>Most
  //         Often</B>
  // <B>Note</B> when we point out that the block of data is
  // bigger then a standard TCP packet, that is just a mental note
  // for you. The socket layer will always build the packet to the
  // appropriate network packet size. These buffers are strictly
  // used internally for how to break the data apart and shove it
  // down to the socket layer.
  //
  //
  //
  // Summary
  // Define the packet size between DXSock and the Socket Layer.
  TKXBlockSizeFlags = (
    bsfZero, // special meaning for TLS!
    bsfRealSmall,
    bsfSmall, bsfNormal,
    bsfBigger,
    bsfBiggest,
    bsfHUGE);

type
  TKXBSArray = array[0..65500] of Char;
  TKXBSArray2 = array[0..250] of Char;
  {$IFDEF VER100}
  Longword = Cardinal;
  {$ENDIF}

  TKXSock = class(TKXComponent) // RC2
  private
    FClientThread: TThread;
    FTLS: Boolean;
    fChunkBuf: Pointer;
    fbClientMode: Boolean;
    fbIsUDP: Boolean;
    fbIsKeepAlive: Boolean;
    FsBindTo: AnsiString;
    FPeekBuffer: ^TKXBSArray2;
    FReadTimeout: Boolean;
    FUseBlocking: Boolean;
    FBlockSizeFlags: TKXBlockSizeFlags;
    FActualBlockSize: Integer;
    fTooManyCharacters: Integer;
    feOnFilter: TKXFilterCallBack;
    GlobalPeerPort: Integer;
    GlobalPeerIPAddress: AnsiString;
    //      GlobalTimeout:TTimeVal;
    // new 4.0 features
    fTotalWBytes: Cardinal;
    fTotalRBytes: Cardinal;
    fCPSStart: TDateTime;
  protected
    FErrStatus: Integer;
    VarConstSizeofTSockAddrIn: Integer;
    function GetReleaseDate: AnsiString;
    procedure SetReleaseDate(value: AnsiString);
    function GetLocalPort: Integer;
    function GetLocalIPAddr: AnsiString;
    function IsConnected: Boolean;
    function IsValidSocket: Boolean;
    function IsReadable: Boolean;
    function IsWritable: Boolean;
    function DidReadTimeout: Boolean;
    procedure SetfBlockSizeFlags(Value: TKXBlockSizeFlags);
  public
    SockAddr: TSockAddrIn;
    {$IFDEF LINUX}
    Sock: TFileDescriptor;
    {$ELSE}
    Sock: TSocket;
    {$ENDIF}
    constructor Create(AOwner: TComponent); // RC2
    {$IFNDEF OBJECTS_ONLY} override;
    {$ENDIF}
    destructor Destroy; override;
    function CountWaiting: Integer;
    function Connect(Parameters: PNewConnect): Boolean;
    function Listen(Parameters: PNewListen): Boolean;
    function Accept(var NewSock: TKXSock): Boolean;
    procedure CloseGracefully;
    procedure Disconnect; // Borland Friendly
    procedure CloseNow;
    function SendBuf(const Buf; Count: Integer): Integer; // Borland friendly
    function ReceiveBuf(var Buf; Count: Integer): Integer; // Borland friendly
    {$IFDEF VER100}
    function BlockWrite(buf: Pointer; len: Integer): Integer;
    function WriteCh(c: Char): Integer;
    function Write(const s: AnsiString): Integer;
    {$ELSE}
    function Write(c: Char): Integer; overload;
    function Write(const s: AnsiString): Integer; overload;
    function Write(buf: Pointer; len: Integer): Integer; overload;
    {$ENDIF}
    function WriteLn(const s: AnsiString): Integer;
    function WriteResultCode(const Code: Integer; const Rslt: AnsiString): Integer;
    function WriteWithSize(S: AnsiString): Boolean;
    function WriteInteger(const n: integer): integer;

    {$IFDEF VER100}
    function SendFromStreamRange(Stream: TStream; Range: Integer): Boolean;
    function SendFromStream(Stream: TStream): Boolean;
    function SendFromWindowsFile(var Handle: Integer): boolean;
    function SendFromBorlandFile(var Handle: file): boolean;
    {$ELSE}
    function SendFrom(Stream: TStream; Range: Integer): Boolean; overload;
    function SendFrom(Stream: TStream): Boolean; overload;
    function SendFrom(var Handle: Integer): boolean; overload;
    function SendFrom(var Handle: file): boolean; overload;
    {$ENDIF}
    function SendFromStreamWithSize(Stream: TStream): Boolean;
    {$IFDEF VER100}
    function BlockRead(buf: Pointer; len: Integer): Integer;
    function Read: Char;
    {$ELSE}
    function Read(buf: Pointer; len: Integer): Integer; overload;
    function Read: Char; overload;
    {$ENDIF}
    function ReadInteger: integer;
    function ReadStr(MaxLength: Integer): AnsiString;
    function ReadString(MaxLength: Integer; Timeout: Longword): AnsiString;
    function ReadLn(Timeout: Longword): AnsiString;
    function ReadCRLF(Timeout: Longword): AnsiString;
    function ReadToAnyDelimiter(Timeout: Longword; Delimiter: AnsiString): AnsiString;
    function ReadNull(Timeout: Longword): AnsiString;
    function ReadSpace(Timeout: Longword): AnsiString;
    function ReadWithSize: AnsiString;
    {$IFDEF VER100}
    function SaveToStream(Stream: TStream; Timeout: Longword): Boolean;
    function SaveToWindowsFile(var Handle: Integer; Timeout: Longword): boolean;
    function SaveToBorlandFile(var Handle: file; Timeout: Longword): boolean;
    {$ELSE}
    function SaveTo(Stream: TStream; Timeout: Longword): Boolean; overload;
    function SaveTo(var Handle: Integer; Timeout: Longword): boolean; overload;
    function SaveTo(var Handle: file; Timeout: Longword): boolean; overload;
    {$ENDIF}

    function TransmitFileWithSize(AFilename: AnsiString): Boolean;
    function SaveToStreamWithSize(Stream: TStream; Timeout: Longword): Boolean;
    function GetChar: AnsiChar;
    function GetByte: Byte;
    function FilterRead(const InBuf: Pointer; var OutBuf: Pointer; InSize: Integer; xClientThread:
      TThread): Integer;
    function PeekString: AnsiString;
    function PeekChar: Char;
    function GetErrorStr: AnsiString;
    function GetErrorDesc(errorCode: Integer): AnsiString;
    procedure SetNagle(TurnOn: Boolean);
    procedure SetBlocking(TurnOn: Boolean);
    procedure WinsockVersion(var WinsockInfo: PWinsockInfo);
    // made public for new TKXSockClient:
    procedure SockClientSetGlobal(I: AnsiString; P: Integer);
    procedure SetTimeoutAndBuffer(SocketHandle: Integer);
    // new 3.0 features:
    function DroppedConnection: Boolean;
    function WaitForData(timeout: Longint): Boolean;
    // new 4.0 features:
    procedure RestartCharactersPerSecondTimer;
    function CharactersPerSecondWritten: Integer;
    function CharactersPerSecondReceived: Integer;
    property ActualBlockSize: Integer read FActualBlockSize;

  published
    property TLSActive: Boolean read FTLS write FTLS;
    property TLSClientThread: TThread read FClientThread write FClientThread;
    property BindTo: AnsiString read fsBindTo
      write fsBindTo;
    property Connected: Boolean read IsConnected;
    property CharactersToRead: Integer read CountWaiting;
    property ReceiveLength: Integer read CountWaiting; // Borland Friendly
    property ValidSocket: Boolean read IsValidSocket;
    property LastReadTimeout: Boolean read DidReadTimeout;
    property LastCommandStatus: Integer read FErrStatus write FErrStatus;
    property OutputBufferSize: TKXBlockSizeFlags read fBlockSizeFlags
      write SetfBlockSizeFlags;
    property TooManyCharacters: Integer read fTooManyCharacters
      write fTooManyCharacters;
    property IsUDPMode: Boolean read fbIsUDP
      write fbIsUDP;
    property IsKeepAliveMode: Boolean read fbIsKeepAlive write fbIsKeepAlive;
    property PeerIPAddress: AnsiString read GlobalPeerIPAddress
      write GlobalPeerIPAddress;
    property PeerPort: Integer read GlobalPeerPort
      write GlobalPeerPort;
    property LocalIPAddress: AnsiString read GetLocalIPAddr;
    property LocalPort: Integer read GetLocalPort;
    property Readable: Boolean read IsReadable;
    property Writable: Boolean read IsWritable;
    property ReleaseDate: AnsiString read GetReleaseDate
      write SetReleaseDate;
    property OnFilter: TKXFilterCallBack read feOnFilter
      write feOnFilter;
  end;

implementation

uses
  {$IFNDEF LINUX}
  Windows,
  {$ENDIF}
  SysUtils;

function TKXSock.GetReleaseDate: AnsiString;
begin
  Result := DICOM_RELEASE_DATE;
end;

procedure TKXSock.SetReleaseDate(value: AnsiString);
begin
  // Absorb!
end;

constructor TKXSock.Create(AOwner: TComponent);
begin

  MnLg_ev('KXSock TKXSock.Create',DCM_log.vLogDir+cLogFile);

  inherited Create(AOwner); // RC2
  FReadTimeout := False;
  //   GetMem (FPeekBuffer,PeekBufferSize) ;
  FPeekBuffer := System.GetMemory(PeekBufferSize);
  fChunkBuf := nil;
  SetFBlockSizeFlags(bsfNormal);
  if not SocketLayerLoaded then
    ShowMessageWindow('Fatal Socket Error', '(WSAStartup) ' + GetErrorStr);
  fTooManyCharacters := 2048;
  Sock := INVALID_SOCKET;
  fbIsUDP := False;
  fbIsKeepAlive := False;
  fbClientMode := False;
  FUseBlocking := True;
  GlobalPeerPort := 0;
  GlobalPeerIPAddress := '';
  //   GlobalTimeout.tv_Sec:=0;
  //   GlobalTimeout.tv_uSec:=1000; // was 10000 4RC2
  VarConstSizeofTSockAddrIn := ConstSizeofTSockAddrIn;
end;

destructor TKXSock.Destroy;
begin

  MnLg_ev('KXSock TKXSock.Destroy',DCM_log.vLogDir+cLogFile);

  if Assigned(fChunkBuf) then
    //      FreeMem (fChunkBuf,fActualBlockSize);
    System.FreeMemory(fChunkBuf);
  fChunkBuf := nil;
  //   FreeMem (FPeekBuffer,PeekBufferSize);
  System.FreeMemory(FPeekBuffer);
  if Sock <> INVALID_SOCKET then
    CloseNow;
  inherited Destroy;
end;

procedure TKXSock.SetTimeoutAndBuffer(SocketHandle: Integer);
begin
  //ResetBufferAndTimeout(SocketHandle, TKXXferTimeout, 0);

  MnLg_ev('KXSock TKXSock.SetTimeoutAndBuffer',DCM_log.vLogDir+cLogFile);

  ResetBufferAndTimeout(SocketHandle, TKXXferTimeout, TKXMaxSocketBuffer);

  FErrStatus := 0;
end;

function TKXSock.Connect(Parameters: PNewConnect): Boolean;
begin

  MnLg_ev('KXSock TKXSock.Connect',DCM_log.vLogDir+cLogFile);

  fTotalWBytes := 0;
  fTotalRBytes := 0;
  Result := False;
  with Parameters^ do
  begin
    FUseBlocking := UseBlocking;
    fbIsUDP := UseUDP;
    Sock := ClientConnectToServer(ipAddress, Port, UseUDP, UseNAGLE, @SockAddr, FErrStatus);
    if (FErrStatus <> 0) then
      Exit;
    GlobalPeerPort := ntohs(SockAddr.sin_port);
    GlobalPeerIPAddress := inet_ntoa(SockAddr.sin_addr);
    KXSocket.SetBlocking(Sock, UseBlocking, FErrStatus);
    fbIsKeepAlive := False;
    if not FbIsUDP then
    begin
      SetSockStatusBool(Sock, SO_KeepAlive, True, FErrStatus);
      fbIsKeepAlive := FErrStatus = 0;
    end;
    SetTimeoutAndBuffer(Sock);
    //      if FbIsUDP then begin

  end;
  fbClientMode := True;
  Result := True;
  fCPSStart := Now;
end;

function TKXSock.Listen(Parameters: PNewListen): Boolean;
begin

  MnLg_ev('KXSock TKXSock.Listen',DCM_log.vLogDir+cLogFile);

  Result := False;
  with Parameters^ do
  begin
    FUseBlocking := UseBlocking;
    Sock := BindAndListen(fsBindTo, Port, WinsockQueue, UseUDP, UseNAGLE,
      Connectionless, @SockAddr, FErrStatus);
    fbIsUDP := UseUDP;
    if Sock = Invalid_Socket then
      Exit; // linux does not set FErrStatus!
    if FErrStatus = 0 then
      KXSocket.SetBlocking(Sock, UseBlocking, FErrStatus)
    else
      Exit;
    if not fbIsUDP then
    begin
      SetSockStatusBool(Sock, SO_KeepAlive, True, FErrStatus);
      fbIsKeepAlive := fErrStatus = 0;
    end;
    SetTimeoutAndBuffer(Sock);

  end;
  fErrStatus := 0;
  fbClientMode := False;
  Result := True;
  GlobalPeerPort := 0;
  GlobalPeerIPAddress := '';
end;

function TKXSock.Accept(var NewSock: TKXSock): Boolean;
var
  ICreatedIt: Boolean;

begin
  Result := False;
  if Sock = INVALID_SOCKET then
    exit;
  Result := IsAcceptWaiting(Sock);
  if (not Result) or fbIsUDP then
    Exit;
  ICreatedIt := not Assigned(NewSock);
  if ICreatedIt then
    NewSock := TKXSock.Create(nil); // RC2

  MnLg_ev('KXSock TKXSock.Accept',DCM_log.vLogDir+cLogFile);

  NewSock.Sock := AcceptNewConnect(Sock, @NewSock.SockAddr, @VarConstSizeofTSockAddrIn,
    FErrStatus);
  if FErrStatus <> 0 then
  begin
    NewSock.Sock := Invalid_Socket;
    if ICreatedIt then
    begin
      NewSock.Free;
      NewSock := nil;
    end;
    Result := False;
    Exit;
  end;
  NewSock.GlobalPeerPort := ntohs(NewSock.SockAddr.sin_port);
  NewSock.GlobalPeerIPAddress := inet_ntoa(NewSock.SockAddr.sin_addr);
  NewSock.fbClientMode := False;
  NewSock.fCPSStart := Now;

  SetTimeoutAndBuffer(NewSock.Sock);
end;

procedure ProcessMessages;
var
  MsgRec: TMsg;

begin
  if not IsConsole then
    if PeekMessage(MsgRec, 0, 0, 0, PM_REMOVE) then
    begin
      TranslateMessage(MsgRec);
      DispatchMessage(MsgRec)
    end;
end;

{$IFDEF VER100}

function TKXSock.BlockWrite(buf: Pointer; len: Integer): Integer;
{$ELSE}

function TKXSock.Write(buf: Pointer; len: Integer): Integer;
{$ENDIF}
var
  BytesLeft: Integer;
  BytesSent: Integer;
  XferSize: Integer;
  TmpP: Pointer;
  Filtered: Pointer;
  NewLen: Integer;
  Handled: Boolean;

begin

  MnLg_ev('KXSock TKXSock.Write',DCM_log.vLogDir+cLogFile);

  Result := 0;
  if Sock = INVALID_SOCKET then
    Exit;
  if (Len < 1) then
  begin
    if fbIsUDP then
    begin
      UDPSend(Sock, Buf^, 0, 0, SockAddr, ConstSizeofTSockAddrIn, FErrStatus);
      // 2.3 - empty udp packet
      GlobalPeerPort := ntohs(SockAddr.sin_port);
      GlobalPeerIPAddress := inet_ntoa(SockAddr.sin_addr);
    end;
    Exit;
  end;
  NewLen := 0;
  if Assigned(feOnFilter) then
  begin
    Handled := False;
    Filtered := nil;
    feOnFilter(ddAboutToWrite, Buf, Filtered, Len, NewLen, Handled, FClientThread);
    if not Handled then
    begin
      fErrStatus := 9999; {onFilter failed!}
      Exit;
    end;
  end;
  if fbIsUDP then
  begin
    if NewLen = 0 then
      Result := UDPSend(Sock, Buf^, Len, 0, SockAddr, ConstSizeofTSockAddrIn, FErrStatus)
    else
    begin
      Result := UDPSend(Sock, Filtered^, NewLen, 0, SockAddr, ConstSizeofTSockAddrIn, FErrStatus);
      if Assigned(feOnFilter) then
        feOnFilter(ddFreePointer, Filtered, Filtered, NewLen, NewLen, Handled, FClientThread);
    end;
    GlobalPeerPort := ntohs(SockAddr.sin_port);
    GlobalPeerIPAddress := inet_ntoa(SockAddr.sin_addr);
    Exit;
  end;
  if NewLen = 0 then
  begin
    BytesLeft := Len;
    TmpP := Buf;
  end
  else
  begin
    BytesLeft := NewLen;
    Len := NewLen;
    TmpP := Filtered;
  end;
  fErrStatus := 0;
  repeat
    {.$IFDEF SUPPORT_DESIGNTIME_CLIENTS}
    ProcessMessages;
    {.$ENDIF}
    XferSize := BytesLeft;
    if IsWritAble then
    begin
      // DXS4 do not remove this line: it is manditory!
      if XFerSize > FActualBlockSize then
        XFerSize := FActualBlockSize;
      BytesSent := BasicSend(Sock, TmpP^, XferSize, 0, FErrStatus);
      case BytesSent of
        -1:
          begin
            case fErrStatus of
              WSAETIMEDOUT,
                WSAENOBUFS,
                WSAEWOULDBLOCK: fErrStatus := 0;
              WSAECONNABORTED, WSAECONNRESET:
                begin
                  CloseNow;
                end;
              //                  else ShowMessageWindow('','unknown fErrStatus='+IntToStr(fErrStatus));
            end;
          end;
        0:
          begin
            //               ShowMessageWindow('','ReadError(0) '+IntToStr(fErrStatus));
            CloseNow;
          end;
      else
        begin
          if BytesSent > 0 then
            Dec(BytesLeft, BytesSent);
          if (BytesLeft > 0) and (fErrStatus = 0) then
          begin // 3.0 [major bug fix!!]
            Inc(LongInt(TmpP), BytesSent);
          end;
        end;
      end;
    end; // Is Write able.
    //else //add 2009-8-20
    //  ProcessWindowsMessageQueue;
  until (BytesLeft = 0) or (FErrStatus <> 0) or (sock = Invalid_Socket);
  
  Result := Len - BytesLeft;
  if Result > 0 then
    fTotalWBytes := fTotalWBytes + Result;
    
  if Assigned(feOnFilter) then
    feOnFilter(ddFreePointer, nil, Filtered, NewLen, NewLen, Handled, FClientThread);
end;

function TKXSock.WriteInteger(const n: integer): integer;
var
  x: integer;
begin
  x := htonl(n);
  {$IFDEF VER100}
  result := BlockWrite(@x, sizeof(x));
  {$ELSE}
  result := Write(@x, sizeof(x));
  {$ENDIF}
end;

{$IFDEF VER100}

function TKXSock.WriteCh(c: Char): Integer;
{$ELSE}

function TKXSock.Write(c: Char): Integer;
{$ENDIF}
begin
  {$IFDEF VER100}
  Result := BlockWrite(@C, 1);
  {$ELSE}
  Result := Write(@C, 1);
  {$ENDIF}
end;

function TKXSock.Write(const s: AnsiString): Integer;
begin
  {$IFDEF VER100}
  Result := BlockWrite(@S[1], Length(S));
  {$ELSE}
  Result := Write(@S[1], Length(S));
  {$ENDIF}
end;

function TKXSock.WriteLn(const s: AnsiString): Integer;
var
  Len: Integer;
  Ws: AnsiString;

begin
  if Assigned(feOnFilter) then
  begin
    Len := 2;
    Result := Write(S) + Len; // send via filter
    Ws := #13#10;
    if fbIsUDP then
    begin // append CRLF unfiltered!
      UDPSend(Sock, Ws[1], Len, 0, SockAddr, ConstSizeofTSockAddrIn, FErrStatus);
    end
    else
    begin
      BasicSend(Sock, Ws[1], Len, 0, FErrStatus);
    end;
  end
  else
    Result := Write(S + #13#10);
end;

function TKXSock.WriteResultCode(const Code: Integer; const Rslt: AnsiString): Integer;
begin
  Result := Writeln(IntToStr(Code) + #32 + Rslt);
end;

function TKXSock.ReadInteger: integer;
var
  n: integer;
  cnt: integer;

begin
  {$IFDEF VER100}
  cnt := BlockRead(@n, sizeof(n));
  {$ELSE}
  cnt := Read(@n, sizeof(n));
  {$ENDIF}
  if cnt = sizeof(n) then
  begin
    n := ntohl(n);
    result := n;
  end
  else
    result := -1;
end;

{$IFDEF VER100}

function TKXSock.BlockRead(buf: Pointer; len: Integer): Integer;
{$ELSE}

function TKXSock.Read(buf: Pointer; len: Integer): Integer;
{$ENDIF}
var
  UDPAddrSize: Integer;
  //   Tries:Integer;

begin

  MnLg_ev('KXSock TKXSock.Read',DCM_log.vLogDir+cLogFile);

  fReadTimeout := False;
  Result := 0;
  if (Sock = INVALID_SOCKET) or (Len < 1) then
    exit;
  //   Tries:=0;
  if fbIsUDP then
  begin
    UDPAddrSize := ConstSizeofTSockAddrIn;
    Result := UDPRecv(Sock, Buf^, Len, 0, SockAddr, UDPAddrSize, FErrStatus);
    GlobalPeerPort := ntohs(SockAddr.sin_port);
    GlobalPeerIPAddress := inet_ntoa(SockAddr.sin_addr);
  end
  else
  begin
    //      if (CountWaiting>0) or (Tries>=3) then begin
    Result := BasicRecv(Sock, Buf^, Len, 0, FErrStatus);
    if False then    
      MnLg_ev('FSocket.Read: BasicRecv Result='+inttostr(Result)+' FErrStatus='+inttostr(FErrStatus),
                        ExtractFilePath(paramstr(0))+'FSocket.log');

    //     end;
  end;
  fReadTimeout := Result < 1;
  if Result = 0 then
    CloseGracefully
  else
    if Result > 0 then
    fTotalRBytes := fTotalRBytes + Result;
end;

function TKXSock.Read: Char;
var
  Size: Integer;

begin
  {$IFDEF VER100}
  Size := BlockRead(@Result, 1);
  {$ELSE}
  Size := Read(@Result, 1);
  {$ENDIF}
  if Size < 1 then
    Result := #0;
end;

function TKXSock.ReadStr(MaxLength: Integer): AnsiString;
var
  Size: Integer;
  Ctr: Integer;
  Done: Boolean;
  ReadSize: Integer;

begin

  MnLg_ev('KXSock TKXSock.ReadStr',DCM_log.vLogDir+cLogFile);

  fReadTimeout := False;
  if Sock = INVALID_SOCKET then
    Exit;
  Result := '';
  if MaxLength = 0 then
    Exit;
  Size := MaxLength;
  if MaxLength < 0 then
    Size := TKXHugeSize;
  Setlength(Result, Size);
  fErrStatus := 0;
  Ctr := 0;
  Done := False;
  while (not Done) and (IsConnected) do
  begin
    {$IFDEF VER100}
    ReadSize := BlockRead(@Result[Ctr + 1], Size - Ctr);
    {$ELSE}
    ReadSize := Read(@Result[Ctr + 1], Size - Ctr);
    {$ENDIF}
    Done := (Ctr + ReadSize = Size) or
      ((ReadSize = -1) and (MaxLength = -1));
    if not Done then
    begin
      if ReadSize > 0 then
        Inc(Ctr, ReadSize);
      if (ReadSize > 0) and
        (MaxLength = -1) and
        (CountWaiting = 0) then
      begin
        Done := True;
      end
      else
      begin
        DoSleepEx(1); // allow sockets to digest tcpip.sys packets...
        ProcessWindowsMessageQueue;
      end;
    end
    else
      fErrStatus := 0;
  end;
  if (((fErrStatus <> 0) and (fErrStatus <> WSAETIMEDOUT) and (fErrStatus <> WSAEWOULDBLOCK))) or
    (Size = 0) then
    Result := ''
  else
    if (Size = Socket_Error) then
    Result := ''
  else
  begin
    Setlength(Result, Ctr);
    fReadTimeout := False;
  end;
end;

function TKXSock.ReadString(MaxLength: Integer; Timeout: Longword): AnsiString;
var
  Size: Integer;
  StartTime: Comp;

begin

  MnLg_ev('KXSock TKXSock.ReadString',DCM_log.vLogDir+cLogFile);

  if (MaxLength < 1) or (MaxLength > 250) then
  begin // 4RC2
    Result := ReadStr(MaxLength);
    Exit;
  end;
  Result := '';
  fReadTimeout := False;
  if Sock = INVALID_SOCKET then
    Exit;
  fReadTimeout := False;
  StartTime := TimeCounter + Timeout;
  fErrStatus := 0;
  while (CountWaiting < MaxLength) and
    (not KXString.Timeout(StartTime)) and
    (IsConnected) do
  begin
    DoSleepEx(1);
  end;
  if (CountWaiting < MaxLength) then
  begin
    fReadTimeout := True;
    Exit;
  end;
  Setlength(Result, MaxLength);
  FillChar(Result[1], MaxLength, 0);
  {$IFDEF VER100}
  Size := BlockRead(@Result[1], MaxLength);
  {$ELSE}
  Size := Read(@Result[1], MaxLength);
  {$ENDIF}
  if (((fErrStatus <> 0) and (fErrStatus <> WSAETIMEDOUT) and (fErrStatus <> WSAEWOULDBLOCK))) or
    (Size = 0) then
    Result := ''
      // 3.0
  else
    if (Size = Socket_Error) then
    Result := ''
  else
    Setlength(Result, Size);
end;

function TKXSock.GetChar: AnsiChar;
var
  Size: Integer;

begin
  // 7-27   SetLength(Result, 1);
  Result := #32;
  {$IFDEF VER100}
  Size := BlockRead(@Result, 1);
  {$ELSE}
  Size := Read(@Result, 1);
  {$ENDIF}
  case Size of
    0:
      begin
        CloseNow;
        Result := #0;
      end;
    1:
      begin
      end;
  else
    begin
      if (fErrStatus = WSAETIMEDOUT) or (fErrStatus = WSAEWOULDBLOCK) then
        fReadTimeout := False;
      Result := #0;
    end;
  end;
end;

function TKXSock.GetByte: Byte;
var
  L: AnsiChar;

begin
  L := GetChar;
  if L = '' then
    Result := 0
  else
    Result := Ord(L);
end;

function TKXSock.ReadLn(Timeout: Longword): AnsiString;
var
  markerCR, markerLF: Integer;
  s: AnsiString;
  startTime: Comp;
  LastChar: AnsiChar;
  pstring: AnsiString;
begin

  MnLg_ev('KXSock TKXSock.ReadLn',DCM_log.vLogDir+cLogFile);

  Result := '';
  fReadTimeout := False;
  if Sock = INVALID_SOCKET then
    exit;
  //S := GetChar;
  LastChar := GetChar;
  if (Sock = INVALID_SOCKET) {or (fReadTimeout) removed 7-27} then
    exit;
  MarkerLF := 0;
  MarkerCR := 0;
  fErrStatus := 0;
  StartTime := TimeCounter + Timeout;
  while (Sock <> Invalid_Socket) and
    (MarkerLF + MarkerCR = 0) and
    (not KXString.Timeout(StartTime)) and
    (Length(S) < fTooManyCharacters) and
    ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT)
    // 7-27:
    or (fErrStatus = WSAEWOULDBLOCK)) do
  begin
    if fErrStatus = WSAEWOULDBLOCK then
      ProcessWindowsMessageQueue;
    if (LastChar = '') or (not (LastChar in [#10, #13])) then
    begin {handles getchar from above!}
      pString := PeekString;
      if KXString.Timeout(StartTime) then
        Break;
      if (pString = '') then
      begin
        LastChar := GetChar;
      end
      else
      begin
        MarkerLF := CharPos(#10, pString);
        MarkerCR := CharPos(#13, pString);
        if MarkerLF + MarkerCR > 0 then
        begin
          if MarkerLF = 0 then
            MarkerLF := MarkerCR
          else
            if MarkerCR = 0 then
            MarkerCR := MarkerLF;
          if Min(MarkerLF, MarkerCR) > 1 then // 2.4
            S := S + Copy(pString, 1, Min(MarkerLF, MarkerCR) - 1);
          ReadStr(Min(MarkerLF, MarkerCR));
          LastChar := #13;
        end
        else
        begin
          S := S + pString;
          ReadStr(Length(pString));
          LastChar := #0;
        end;
      end;
      if KXString.Timeout(StartTime) then
        Break;
      if LastChar > '' then
      begin
        S := S + LastChar;
      end;
    end;
    if (Length(LastChar) > 0) and (LastChar in [#10, #13]) then
    begin
      MarkerLF := CharPos(#10, S);
      MarkerCR := CharPos(#13, S);
      if MarkerLF + MarkerCR > 0 then
      begin
        if MarkerLF = Length(S) then
        begin {unix or DOS}
          if MarkerCR = 0 then
          begin {unix or Mac}
            if CountWaiting > 0 then
              if PeekChar = #13 then
              begin {Mac}
                LastChar := GetChar;
                S := S + LastChar;
              end;
          end
          else
            if MarkerCR < MarkerLF then
            MarkerLF := MarkerCR;
          MarkerCR := MarkerLF;
        end;
        if MarkerCR = Length(S) then
        begin {Mac or DOS}
          if MarkerLF = 0 then
          begin {Mac or DOS}
            if CountWaiting > 0 then
              if PeekChar = #10 then
              begin {DOS}
                LastChar := GetChar;
                S := S + LastChar;
              end;
          end
          else
            if MarkerLF < MarkerCR then
            MarkerCR := MarkerLF;
          MarkerLF := MarkerCR;
        end;
      end;
    end;
  end;
  if Sock = INVALID_SOCKET then
    exit;
  FReadTimeout := (MarkerCR < 1) and (KXString.Timeout(StartTime));
  Result := Copy(S, 1, MarkerCR - 1);
end;

function TKXSock.ReadCRLF(Timeout: Longword): AnsiString;
begin
  Result := ReadToAnyDelimiter(Timeout, #13#10);
end;
{var
  marker: Integer;
  s: AnsiString;
  startTime: Longword;

begin
  Result := '';
  fReadTimeout := False;
  if Sock = INVALID_SOCKET then exit;
  Marker := 0;
  StartTime := TimeCounter + Timeout;
  fErrStatus := 0;
  while (sock <> Invalid_Socket) and
    (Marker = 0) and
    (not KXString.Timeout(StartTime)) and
    (Length(S) < fTooManyCharacters) and
    ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT)) do begin
    S := S + GetChar;
    Marker := QuickPos(#13#10, S);
  end;
  if Sock = INVALID_SOCKET then exit;
  Result := Copy(S, 1, Marker - 1);
end;}

function TKXSock.ReadToAnyDelimiter(Timeout: Longword; Delimiter: AnsiString): AnsiString;
var
  slen: Integer;
  marker: Integer;
  s: AnsiString;
  startTime: Comp;
  pString: AnsiString;
  iDel: Integer;

begin

  MnLg_ev('KXSock TKXSock.ReadToAnyDelimiter',DCM_log.vLogDir+cLogFile);

  Result := '';
  fReadTimeout := False;
  if Sock = INVALID_SOCKET then
    exit;
  S := '';
  sLen := 0;
  StartTime := TimeCounter + Timeout;
  Marker := 0;
  while (sock <> Invalid_Socket) and
    (Marker = 0) and
    (not KXString.Timeout(StartTime)) and
    (sLen < fTooManyCharacters) and
    ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT) or (fErrStatus = WSAEWOULDBLOCK)) do
  begin
    pString := PeekString;
    if pString <> '' then
    begin
      sLen := Length(S);
      S := S + pString;
      Marker := QuickPos(Delimiter, S);
      if Marker = 0 then
      begin
        ReadStr(Length(pString)); // clear socket
      end
      else
      begin
        S := Copy(S, 1, Marker - 1 + Length(Delimiter));
        if Marker < sLen then
          iDel := Length(Delimiter) - (sLen - Marker)
        else
          iDel := (Marker - sLen) - 1 + Length(Delimiter);
        //          If Marker<sLen then iDel:=Length(Delimiter)-(sLen-Marker+1)
        //          Else iDel:=Marker-sLen+(Length(Delimiter)-1);
        ReadStr(iDel);
      end;
    end
    else
    begin
      pString := GetChar;
      if pString = '' then
        DoSleepEx(1)
      else
      begin
        Inc(sLen);
        S := S + pString;
      end;
    end;
  end;
  if Sock = INVALID_SOCKET then
    exit;
  fReadTimeout := KXString.Timeout(StartTime);
  Result := S; // return what ever is collected, even if not done!
end;

function TKXSock.ReadNull(Timeout: Longword): AnsiString;
begin
  Result := ReadToAnyDelimiter(Timeout, #0);
end;

function TKXSock.ReadSpace(Timeout: Longword): AnsiString;
begin
  Result := ReadToAnyDelimiter(Timeout, #32);
end;

function TKXSock.SendBuf(const Buf; Count: Integer): Integer; // Borland friendly
begin
  {$IFDEF VER100}
  Result := BlockWrite(@Buf, Count);
  {$ELSE}
  Result := Write(@Buf, Count);
  {$ENDIF}
end;

function TKXSock.ReceiveBuf(var Buf; Count: Integer): Integer; // Borland friendly
begin
  {$IFDEF VER100}
  Result := BlockRead(@Buf, Count);
  {$ELSE}
  Result := Read(@Buf, Count);
  {$ENDIF}
end;

{$IFDEF VER100}

function TKXSock.SendFromStream(Stream: TStream): Boolean;
{$ELSE}

function TKXSock.SendFrom(Stream: TStream): Boolean;
{$ENDIF}
var
  Len: Integer;
  SSize, SPosition: Integer;
  Tries: Integer;

begin

  MnLg_ev('KXSock TKXSock.SendFrom',DCM_log.vLogDir+cLogFile);

  if fChunkBuf = nil then
    raise Exception.Create('SOCKET Buffer is NULL,Please add more memory');
  fErrStatus := 0;
  SSize := Stream.Size;
  SPosition := Stream.Position;
  Tries := 0;
  while (sock <> Invalid_Socket) and
    (Stream.Position < Stream.Size) and
    (fErrStatus = 0) and
    (Tries < 3) do
  begin
    if (SSize - SPosition) < FActualBlockSize then
      Len := SSize - SPosition
    else
      Len := FActualBlockSize;
    if Len > 0 then
    begin
      Stream.Seek(SPosition, 0);
      Stream.Read(fChunkBuf^, Len);
      {$IFDEF VER100}
      Len := BlockWrite(fChunkBuf, Len);
      {$ELSE}
      Len := Write(fChunkBuf, Len);
      {$ENDIF}
      SPosition := SPosition + Len;
      if fErrStatus > 0 then
      begin
        Tries := 3;
      end
      else
        if Len < 1 then
        Inc(Tries)
      else
        Tries := 0;
    end;
    ProcessWindowsMessageQueue;
  end;
  Result := (Sock <> INVALID_SOCKET) and (fErrStatus = 0);
end;

{$IFDEF VER100}

function TKXSock.SendFromStreamRange(Stream: TStream; Range: Integer): Boolean;
{$ELSE}

function TKXSock.SendFrom(Stream: TStream; Range: Integer): Boolean;
{$ENDIF}
var
  Len: Integer;
  SSize, SPosition: Integer;
  Tries: Integer;

begin

  MnLg_ev('KXSock TKXSock.SendFrom',DCM_log.vLogDir+cLogFile);

  fErrStatus := 0;
  SSize := Range;
  SPosition := Stream.Position;
  Tries := 0;
  while (sock <> Invalid_Socket) and
    (Stream.Position < Stream.Size) and
    (fErrStatus = 0) and
    (Tries < 3) do
  begin
    if (SSize - SPosition) < FActualBlockSize then
      Len := SSize - SPosition
    else
      Len := FActualBlockSize;
    if Len > 0 then
    begin
      Stream.Seek(SPosition, 0);
      Stream.Read(fChunkBuf^, Len);
      {$IFDEF VER100}
      Len := BlockWrite(fChunkBuf, Len);
      {$ELSE}
      Len := Write(fChunkBuf, Len);
      {$ENDIF}
      SPosition := SPosition + Len;
      if fErrStatus > 0 then
      begin
        Tries := 3;
      end
      else
        if Len < 1 then
        Inc(Tries)
      else
        Tries := 0;
    end;
  end;
  Result := (Sock <> INVALID_SOCKET) and (fErrStatus = 0);
end;

{$IFDEF VER100}

function TKXSock.SendFromWindowsFile(var Handle: Integer): boolean;
{$ELSE}

function TKXSock.SendFrom(var Handle: Integer): boolean;
{$ENDIF}
var
  Len: Integer;
  SLen: Integer;
  Offset: Integer;
  FSize: Integer;
  Tries: Integer;

begin

  MnLg_ev('KXSock TKXSock.SendFrom',DCM_log.vLogDir+cLogFile);

  Result := False;
  fReadTimeout := False;
  if Sock = INVALID_SOCKET then
    Exit;
  if Handle <> 0 then
  begin
    Offset := FileSeek(Handle, 0, 1);
    FSize := FileSeek(Handle, 0, 2);
    FileSeek(Handle, Offset, 0);
    fErrStatus := 0;
    Tries := 0;
    while (sock <> Invalid_Socket) and
      (Offset < FSize) and
      (fErrStatus = 0) and
      (Tries < 3) do
    begin
      if Sock <> INVALID_SOCKET then
      begin
        Len := FileRead(Handle, fChunkBuf^, FActualBlockSize - 1);
        if Len > 0 then
        begin
          {$IFDEF VER100}
          SLen := BlockWrite(fChunkBuf, Len);
          {$ELSE}
          SLen := Write(fChunkBuf, Len);
          {$ENDIF}
          if SLen <> Len then
          begin
            Offset := SLen + Offset;
            FileSeek(Handle, Offset, 0);
            Inc(Tries);
          end
          else
            Tries := 0;
          if fErrStatus > 0 then
            Tries := 3;
        end;
      end;
      Offset := FileSeek(Handle, 0, 1);
    end;
  end;
  Result := (Sock <> INVALID_SOCKET) and (fErrStatus = 0);
end;

{$IFDEF VER100}

function TKXSock.SendFromBorlandFile(var Handle: file): boolean;
{$ELSE}

function TKXSock.SendFrom(var Handle: file): boolean;
{$ENDIF}
var
  Len: Integer;
  SLen: Integer;
  OffSet: Integer;
  Tries: Integer;

begin

  MnLg_ev('KXSock TKXSock.SendFrom',DCM_log.vLogDir+cLogFile);

  Result := False;
  fReadTimeout := False;
  if Sock = INVALID_SOCKET then
    Exit;
  fErrStatus := 0;
  Tries := 0;
  while not Eof(Handle) and (fErrStatus = 0) and (Tries < 3) and (sock <> Invalid_Socket) do
  begin
    Offset := System.FilePos(Handle);
    if (Sock <> INVALID_SOCKET) then
    begin
      System.BlockRead(Handle, fChunkBuf^, FActualBlockSize - 1, Len);
      {$IFDEF VER100}
      SLen := BlockWrite(fChunkBuf, Len);
      {$ELSE}
      SLen := Write(fChunkBuf, Len);
      {$ENDIF}
      if SLen = Len then
      begin
        Tries := 0;
      end
      else
      begin
        Offset := SLen + Offset;
        System.Seek(Handle, Offset);
        Inc(Tries);
      end;
      if fErrStatus > 0 then
        Tries := 3;
    end;
  end;
  Result := (Sock <> INVALID_SOCKET) and (fErrStatus = 0);
end;

{$IFDEF VER100}

function TKXSock.SaveToStream(Stream: TStream; Timeout: Longword): Boolean;
{$ELSE}

function TKXSock.SaveTo(Stream: TStream; Timeout: Longword): Boolean;
{$ENDIF}
var
  SLen: Integer;
  StartTime: Comp;
  OldSize: Integer;

begin

  MnLg_ev('KXSock TKXSock.SaveTo',DCM_log.vLogDir+cLogFile);

  OldSize := Stream.Size;
  fErrStatus := 0;
  fReadTimeout := False;
  StartTime := TimeCounter + Timeout;
  while ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT) or (fErrStatus = WSAEWOULDBLOCK)) and
    (not KXString.Timeout(StartTime)) do
  begin
    {$IFDEF VER100}
    SLen := BlockRead(fChunkBuf, FActualBlockSize);
    {$ELSE}
    SLen := Read(fChunkBuf, FActualBlockSize);
    {$ENDIF}
    if SLen < 1 then
    begin
      if SLen = 0 then
        Break;
    end
    else
      Stream.Write(fChunkBuf^, SLen);
    ProcessWindowsMessageQueue;
    //    if SLen < FActualBlockSize then
    //      Break; //GT for TLS Stops looping until timeout
  end;
  Result := (Sock <> INVALID_SOCKET) and ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT) or
    (fErrStatus = WSAEWOULDBLOCK));
  if Result then
    Result := Stream.Size <> OldSize;
end;

{$IFDEF VER100}

function TKXSock.SaveToWindowsFile(var Handle: Integer; Timeout: Longword): boolean;
{$ELSE}

function TKXSock.SaveTo(var Handle: Integer; Timeout: Longword): boolean;
{$ENDIF}
var
  SLen: Integer;
  {$IFDEF VER100}
  STmp: Integer;
  {$ELSE}
  STmp: Cardinal;
  {$ENDIF}
  StartTime: Comp;

begin

  MnLg_ev('KXSock TKXSock.SaveTo',DCM_log.vLogDir+cLogFile);

  fErrStatus := 0;
  fReadTimeout := False;
  StartTime := TimeCounter + Timeout;
  while ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT) or (fErrStatus = WSAEWOULDBLOCK)) and
    (not KXString.Timeout(StartTime)) do
  begin
    {$IFDEF VER100}
    SLen := BlockRead(fChunkBuf, FActualBlockSize);
    {$ELSE}
    SLen := Read(fChunkBuf, FActualBlockSize);
    {$ENDIF}
    STmp := 0;
    if SLen < 1 then
    begin
      if SLen = 0 then
        Break;
    end
    else
      WindowsWriteFile(Handle, fChunkBuf^, SLen, STmp);
  end;
  Result := (Sock <> INVALID_SOCKET) and ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT) or
    (fErrStatus = WSAEWOULDBLOCK));
end;

{$IFDEF VER100}

function TKXSock.SaveToBorlandFile(var Handle: file; Timeout: Longword): boolean;
{$ELSE}

function TKXSock.SaveTo(var Handle: file; Timeout: Longword): boolean;
{$ENDIF}
var
  SLen: Integer;
  StartTime: Comp;

begin

  MnLg_ev('KXSock TKXSock.SaveTo',DCM_log.vLogDir+cLogFile);

  fErrStatus := 0;
  fReadTimeout := False;
  StartTime := TimeCounter + Timeout;
  while ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT) or (fErrStatus = WSAEWOULDBLOCK)) and
    (not KXString.Timeout(StartTime)) do
  begin
    {$IFDEF VER100}
    SLen := BlockRead(fChunkBuf, FActualBlockSize);
    {$ELSE}
    SLen := Read(fChunkBuf, FActualBlockSize);
    {$ENDIF}
    if SLen < 1 then
    begin
      if SLen = 0 then
        Break;
    end
    else
      System.BlockWrite(Handle, fChunkBuf^, SLen);
  end;
  Result := (Sock <> INVALID_SOCKET) and ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT) or
    (fErrStatus = WSAEWOULDBLOCK));
end;

function TKXSock.WriteWithSize(S: AnsiString): Boolean;
var
  Size, OriginalSize: Integer;
  Ws: AnsiString;

begin
  Result := False;
  if S = '' then
    Exit;
  OriginalSize := Length(S);
  SetLength(Ws, OriginalSize + 4);
  Move(S[1], Ws[5], OriginalSize);
  size := htonl(OriginalSize);
  Move(Size, Ws[1], 4);
  {$IFDEF VER100}
  Result := BlockWrite(@Ws[1], OriginalSize + 4) = OriginalSize + 4;
  {$ELSE}
  Result := Write(@Ws[1], OriginalSize + 4) = OriginalSize + 4;
  {$ENDIF}
end;

function TKXSock.ReadWithSize: AnsiString;
var
  Done: Boolean;
  Size: Integer;

begin
  Result := '';
  FErrStatus := 0;
  // redesigned for non-blocking mode and blocking mode and nagle on/off
  Done := False;
  while ((fErrStatus = 0) or (fErrStatus = WSAEWOULDBLOCK)) and not Done do
  begin
    Result := Result + GetChar; // ReadStr(4-Length(Result));
    Done := Length(Result) = 4;
  end;
  if not Done then
    Exit;
  Move(Result[1], Size, 4);
  size := ntohl(size);
  if (Size > fTooManyCharacters) or (Size < 1) then
  begin
    //      ShowMessageWindow ('',HexDump (Result) +#13+
    //         CleanStr (ReadStr (100) ) ) ;
    exit;
  end;
  Result := ReadStr(Size);
end;

function TKXSock.SendFromStreamWithSize(Stream: TStream): Boolean;
var
  Size: Integer;

begin
  Result := False;
  Size := Stream.Size;
  if size < 1 then
    Exit;
  size := htonl(size);
  Stream.Seek(0, 0);
  {$IFDEF VER100}
  if BlockWrite(@Size, 4) = 4 then
    Result := SendFromStream(Stream);
  {$ELSE}
  if Write(@Size, 4) = 4 then
    Result := SendFrom(Stream);
  {$ENDIF}
end;

function TKXSock.TransmitFileWithSize(AFilename: AnsiString): Boolean;
var
  LFileHandle: THandle;
  Size: Integer;
begin
  result := false;
  LFileHandle := CreateFile(PChar(AFileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING
    , FILE_ATTRIBUTE_NORMAL or FILE_FLAG_SEQUENTIAL_SCAN, 0);
  try
    Size := getFileSize(LFileHandle, nil);
    if size < 1 then
      Exit;
    size := htonl(size);
    if Write(@Size, 4) = 4 then
      Result := TransmitFile(Sock, LFileHandle, 0, 0, nil, nil, 0);
  finally
    CloseHandle(LFileHandle);
  end;
end;

function TKXSock.SaveToStreamWithSize(Stream: TStream; Timeout: Longword): Boolean;
var
  Size: Integer;
  //  StartTime: Comp;
  SLen: Integer;

begin
  Stream.Size := 0;
  fReadTimeout := False;
  {$IFDEF VER100}
  if BlockRead(@Size, 4) = 4 then
  begin
    {$ELSE}
  if Read(@Size, 4) = 4 then
  begin
    {$ENDIF}
    size := ntohl(size);
    //    StartTime := TimeCounter + Timeout;
    fErrStatus := 0;
    while IsConnected and (Size > 0) do
      //((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT) or (fErrStatus = WSAEWOULDBLOCK))
      //and (not KXString.Timeout(StartTime))
    begin
      {$IFDEF VER100}
      SLen := BlockRead(fChunkBuf, Min(Size, FActualBlockSize));
      {$ELSE}
      SLen := Read(fChunkBuf, Min(Size, FActualBlockSize));
      {$ENDIF}
      case SLen of
        -1:
          begin // non-fatal
          end;
        0:
          begin
            //Break;
          end; // fatal
      else
        begin
          Stream.Write(fChunkBuf^, SLen);
          Dec(Size, SLen);
        end;
      end;
    end;
  end;
  Result := (Sock <> INVALID_SOCKET) and ((fErrStatus = 0) or (fErrStatus = WSAETIMEDOUT) or
    (fErrStatus = WSAEWOULDBLOCK)) and
    ((Size = 0) and (Stream.Size > 0)); // 2.3c
end;

function TKXSock.PeekString: AnsiString;
var
  Size: Integer;
begin
  Result := '';
  fReadTimeout := False;
  if Sock = INVALID_SOCKET then
    exit;
  FErrStatus := BasicPeek(Sock, FPeekBuffer^, PeekBufferSize);
  if FErrStatus = Socket_Error then
  begin
    FErrStatus := 0;
    Exit;
  end
  else
    Size := FErrStatus;
  Setlength(Result, Size);
  if Size > 0 then
    Move(FPeekBuffer^, Result[1], Size); // 3.0
end;

function TKXSock.PeekChar: Char;
begin
  Result := #0;
  fReadTimeout := False;
  if Sock = INVALID_SOCKET then
    exit;
  FErrStatus := BasicPeek(Sock, FPeekBuffer^, 1);
  case fErrStatus of
    0:
      begin
        //         ShowMessageWindow('','PeekChar '+IntToStr(fErrStatus));
        CloseNow;
      end;
    Socket_Error: FErrStatus := 0;
  else
    Result := FPeekBuffer^[0];
  end;
end;

procedure TKXSock.CloseGracefully;
begin

  MnLg_ev('KXSock TKXSock.CloseGracefully',DCM_log.vLogDir+cLogFile);

  CloseConnection(Sock, True);
end;

procedure TKXSock.Disconnect;
begin

  MnLg_ev('KXSock TKXSock.Disconnect',DCM_log.vLogDir+cLogFile);

  CloseConnection(Sock, True);
end;

procedure TKXSock.CloseNow;
begin

  MnLg_ev('KXSock TKXSock.CloseNow',DCM_log.vLogDir+cLogFile);

  CloseConnection(Sock, False);
end;

function TKXSock.IsValidSocket: Boolean;
begin
  Result := Sock <> INVALID_SOCKET;
end;

function TKXSock.IsConnected: Boolean;
begin
  Result := (Sock <> INVALID_SOCKET)
    and ((FErrStatus = 0) or (FErrStatus = WSAETIMEDOUT) or
    (FErrStatus = WSAEWOULDBLOCK) or (fErrStatus = 10038));
  if not Result and (CountWaiting > 0) then
    Result := True;
  {   If (fErrStatus<>0) and
        (fErrStatus<>WSAEWOULDBLOCK) and
        (fErrStatus<>WSAETIMEDOUT) and
        (fErrStatus<>10038) then ShowMessageWindow('IsConnected',IntToStr(fErrStatus));
     If not Result then Begin
        If Sock=INVALID_SOCKET then ShowMessageWindow('IsConnected','Invalid_Socket');
     End;}
end;

function TKXSock.IsReadable: Boolean;
var
  Timeout1: TTimeVal;
begin
  Timeout1.tv_Sec := 0;
  Timeout1.tv_uSec := 1;

  fReadTimeout := False;
  Result := False;
  if Sock = INVALID_SOCKET then
    exit;
  Result := BasicSelect(Sock, True, Timeout1) > 0;
  //   SetTimeoutAndBuffer(Sock);
  fErrStatus := 0;
end;

function TKXSock.IsWritable: Boolean;
var
  Timeout1: TTimeVal;
begin
  Timeout1.tv_Sec := 0;
  Timeout1.tv_uSec := 1;
  fReadTimeout := False;
  Result := False;
  if Sock = INVALID_SOCKET then
    exit;
  Result := BasicSelect(Sock, False, Timeout1) > 0;
  //   SetTimeoutAndBuffer(Sock);
  fErrStatus := 0;
end;

function TKXSock.DidReadTimeout: Boolean;
begin
  Result := fReadTimeout;
end;

function TKXSock.GetLocalPort: Integer;
begin
  Result := 0;
  if Sock = INVALID_SOCKET then
    exit;
  Result := KXSocket.GetLocalPort(Sock);
end;

function TKXSock.GetLocalIPAddr: AnsiString;
begin
  Result := '';
  if Sock = INVALID_SOCKET then
    exit;
  Result := KXSocket.GetLocalIPAddr(Sock);
end;

function TKXSock.GetErrorStr: AnsiString;
begin
  result := GetErrorDesc(GetLastError);
end;

procedure TKXSock.WinsockVersion(var WinsockInfo: PWinsockInfo);
begin
  if not Assigned(WinsockInfo) then
    Exit;
  if not SocketLayerLoaded then
    Exit;
  GetSocketVersion(WinsockInfo);
end;

procedure TKXSock.SetNagle(TurnOn: Boolean);
begin
  KXSocket.SetNagle(Sock, TurnOn, FErrStatus);
end;

procedure TKXSock.SetBlocking(TurnOn: Boolean);
begin
  fUseBlocking := TurnOn;
  KXSocket.SetBlocking(Sock, TurnOn, FErrStatus);
end;

function TKXSock.GetErrorDesc(errorCode: Integer): AnsiString;
begin
  Result := KXSocket.GetErrorDesc(ErrorCode);
end;

procedure TKXSock.SetfBlockSizeFlags(Value: TKXBlockSizeFlags);
begin

  MnLg_ev('KXSock TKXSock.SetfBlockSizeFlags',DCM_log.vLogDir+cLogFile);

  if Assigned(fChunkBuf) then
    //      FreeMem (fChunkBuf,FActualBlockSize);
    System.FreeMemory(fChunkBuf);
  fChunkBuf := nil;
  fBlockSizeFlags := Value;
  case FBlockSizeFlags of
    bsfZero: fActualBlockSize := 0;
    bsfRealSmall: fActualBlockSize := 128;
    bsfSmall: fActualBlockSize := 256;
    bsfNormal: fActualBlockSize := 512;
    bsfBigger: fActualBlockSize := 2048;
    bsfBiggest: fActualBlockSize := 4096;
  else
    fActualBlockSize := TKXMaxChunksBuffer;
  end;
  if FBlockSizeFlags <> bsfZero then
  begin
    //      GetMem (fChunkBuf,FActualBlockSize) ;
    fChunkBuf := System.GetMemory(FActualBlockSize);
    if fChunkBuf = nil then
    begin
      FActualBlockSize := FActualBlockSize div 2;
      fChunkBuf := System.GetMemory(FActualBlockSize);
      if fChunkBuf = nil then
      begin
        FActualBlockSize := FActualBlockSize div 2;
        fChunkBuf := System.GetMemory(FActualBlockSize);
        if fChunkBuf = nil then
        begin
          FActualBlockSize := FActualBlockSize div 2;
          fChunkBuf := System.GetMemory(FActualBlockSize);
          if fChunkBuf = nil then
          begin
            FActualBlockSize := FActualBlockSize div 2;
            fChunkBuf := System.GetMemory(FActualBlockSize);
            if fChunkBuf = nil then
            begin
              FActualBlockSize := FActualBlockSize div 2;
              fChunkBuf := System.GetMemory(FActualBlockSize);
              if fChunkBuf = nil then
              begin
                FActualBlockSize := FActualBlockSize div 2;
                fChunkBuf := System.GetMemory(FActualBlockSize);
                if fChunkBuf = nil then
                begin
                  FActualBlockSize := FActualBlockSize div 2;
                  fChunkBuf := System.GetMemory(FActualBlockSize);
                  if fChunkBuf = nil then
                  begin
                    raise Exception.Create('Block Out of Memory!');
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TKXSOCK.CountWaiting: Integer;
begin
  Result := KXSocket.CountWaiting(Sock, FErrStatus);
  if FErrStatus <> 0 then
  begin
    Result := 0;
    Exit;
  end;
end;

function TKXSOCK.FilterRead(const InBuf: Pointer; var OutBuf: Pointer; InSize: Integer;
  xClientThread: TThread): Integer;
var
  Handled: Boolean;

begin
  if InSize > 0 then
    if Assigned(feOnFilter) then
    begin
      Handled := False;
      Result := 0;
      feOnFilter(ddAfterRead, InBuf, OutBuf, InSize, Result, Handled, xClientThread);
      if not Handled then
      begin
        fErrStatus := 9999; {onFilter failed!}
        Exit;
      end;
    end;
end;

// used by TKXSockClient only!

procedure TKXSock.SockClientSetGlobal(I: AnsiString; P: Integer);
begin
  GlobalPeerPort := P;
  GlobalPeerIPAddress := I;
end;

// new 3.0 features:

function TKXSock.DroppedConnection: Boolean;
begin
  Result := False;
  if IsReadable then
    if CharactersToRead = 0 then
    begin
      CloseNow; // invalidates the handle
      Result := True;
    end;
end;

function TKXSock.WaitForData(timeout: Longint): Boolean;
var
  StartTime: Comp;

begin
  Result := False;
  StartTime := TimeCounter + Cardinal(timeout);
  while not KXString.TimeOut(StartTime) do
  begin
    if DroppedConnection then
    begin
      CloseNow;
      Exit;
    end
    else
    begin
      if CharactersToRead > 0 then
      begin
        Result := True;
        Exit;
      end
      else
      begin
        ProcessWindowsMessageQueue;
        DoSleepEx(0);
      end;
    end;
  end;
end;

procedure TKXSock.RestartCharactersPerSecondTimer;
begin
  fCPSStart := Now;
  fTotalWBytes := 0;
  fTotalRBytes := 0;
end;

function TKXSock.CharactersPerSecondWritten: Integer;
var
  H1, M1, S1, MS1: Word;

begin
  try
    DecodeTime(Now - fCPSStart, H1, M1, S1, MS1);
    Result := fTotalWBytes div Max(((MS1 + (S1 * 1000) + (M1 * 3600000) + (H1 * 216000000)) div
      1000), 1);
  except
    Result := 0;
  end;
end;

function TKXSock.CharactersPerSecondReceived: Integer;
var
  H1, M1, S1, MS1: Word;

begin
  try
    DecodeTime(Now - fCPSStart, H1, M1, S1, MS1);
    Result := fTotalRBytes div Max(((MS1 + (S1 * 1000) + (M1 * 3600000) + (H1 * 216000000)) div
      1000), 1);
  except
    Result := 0;
  end;
end;

end.

