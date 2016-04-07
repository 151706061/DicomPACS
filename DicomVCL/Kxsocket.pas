{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
{$I KXSock.def}
unit KXSocket;

interface

{$IFDEF LINUX}
uses
  Libc,
  DCM_log,
  DateUtils;
{$ELSE}
uses
  Windows,
  Winsock,
  DCM_log,
  DateUtils;
{$ENDIF}

{$WARNINGS OFF}

(*
{$IFDEF LINUX}
const
  INVALID_SOCKET = Libc.INVALID_SOCKET;
  SO_KeepAlive = Libc.SO_KEEPALIVE;
  WSAEINTR = Libc.EINTR;
  WSAEBADF = Libc.EBADF;
  WSAEACCES = Libc.EACCES;
  WSAEFAULT = Libc.EFAULT;
  WSAEINVAL = Libc.EINVAL;
  WSAEMFILE = Libc.EMFILE;
  WSAEWOULDBLOCK = Libc.EWOULDBLOCK;
  WSAEINPROGRESS = Libc.EINPROGRESS;
  WSAEALREADY = Libc.EALREADY;
  WSAENOTSOCK = Libc.ENOTSOCK;
  WSAEDESTADDRREQ = Libc.EDESTADDRREQ;
  WSAEMSGSIZE = Libc.EMSGSIZE;
  WSAEPROTOTYPE = Libc.EPROTOTYPE;
  WSAENOPROTOOPT = Libc.ENOPROTOOPT;
  WSAEPROTONOSUPPORT = Libc.EPROTONOSUPPORT;
  WSAESOCKTNOSUPPORT = Libc.ESOCKTNOSUPPORT;
  WSAEOPNOTSUPP = Libc.EOPNOTSUPP;
  WSAEPFNOSUPPORT = Libc.EPFNOSUPPORT;
  WSAEAFNOSUPPORT = Libc.EAFNOSUPPORT;
  WSAEADDRINUSE = Libc.EADDRINUSE;
  WSAEADDRNOTAVAIL = Libc.EADDRNOTAVAIL;
  WSAENETDOWN = Libc.ENETDOWN;
  WSAENETUNREACH = Libc.ENETUNREACH;
  WSAENETRESET = Libc.ENETRESET;
  WSAECONNABORTED = Libc.ECONNABORTED;
  WSAECONNRESET = Libc.ECONNRESET;
  WSAENOBUFS = Libc.ENOBUFS;
  WSAEISCONN = Libc.EISCONN;
  WSAENOTCONN = Libc.ENOTCONN;
  WSAESHUTDOWN = Libc.ESHUTDOWN;
  WSAETOOMANYREFS = Libc.ETOOMANYREFS;
  WSAETIMEDOUT = Libc.ETIMEDOUT;
  WSAECONNREFUSED = Libc.ECONNREFUSED;
  WSAELOOP = Libc.ELOOP;
  WSAENAMETOOLONG = Libc.ENAMETOOLONG;
  WSAEHOSTDOWN = Libc.EHOSTDOWN;
  WSAEHOSTUNREACH = Libc.EHOSTUNREACH;
  WSAENOTEMPTY = Libc.ENOTEMPTY;
  WSAEPROCLIM = 1000; // not applicable
  WSAEUSERS = Libc.EUSERS;
  WSAEDQUOT = Libc.EDQUOT;
  WSAESTALE = Libc.ESTALE;
  WSAEREMOTE = Libc.EREMOTE;
  WSASYSNOTREADY = 1001; // not applicable
  WSAVERNOTSUPPORTED = 1002; // not applicable
  WSANOTINITIALISED = 1003; // not applicable
  WSAHOST_NOT_FOUND = Libc.HOST_NOT_FOUND;
  WSATRY_AGAIN = Libc.TRY_AGAIN;
  WSANO_RECOVERY = Libc.NO_RECOVERY;
  WSANO_DATA = Libc.ENODATA;
  WSAUNKNOWN = Libc.UNKNOWN_REQUEST;
  Socket_Error = Libc.SOCKET_ERROR;
  {$ELSE}
const
  INVALID_SOCKET = Winsock.INVALID_SOCKET;
  SO_KeepAlive = Winsock.SO_KEEPALIVE;
  WSAENOBUFS = Winsock.WSAENOBUFS;
  WSAETIMEDOUT = Winsock.WSAETIMEDOUT;
  WSAECONNABORTED = Winsock.WSAECONNABORTED;
  Socket_Error = Winsock.SOCKET_ERROR;
  // 7-27:
  WSAEWOULDBLOCK = Winsock.WSAEWOULDBLOCK;
  // 6-27:
  WSAECONNRESET = Winsock.WSAECONNRESET;
  {$ENDIF}
*)
  {$IFDEF VER100}
type
  in_addr = TInAddr;
  {$ENDIF}

type
  {$IFDEF LINUX}
  TSockAddrIn = Libc.TSockAddrin;
  TTimeVal = Libc.TTimeVal;
  TFDSet = Libc.TFDSet;
  {$ELSE}
  TSockAddrIn = Winsock.TSockAddrIn;
  TTimeVal = Winsock.TTimeVal;
  TFDSet = Winsock.TFDSet;
  {$ENDIF}
  PNewConnect = ^TNewConnect;
  TNewConnect = record
    Port: Integer;
    UseNAGLE: Boolean;
    UseUDP: Boolean;
    UseBlocking: Boolean;
    ipAddress: AnsiString;
  end;

  PNewListen = ^TNewListen;
  TNewListen = record
    Port: Integer;
    WinsockQueue: Integer;
    UseNAGLE: Boolean;
    UseUDP: Boolean;
    UseBlocking: Boolean;
    ConnectionLess: Boolean;
  end;

  PWinsockInfo = ^TWinsockInfo; // 2.3 changed array from 0.. to 1..
  TWinsockInfo = record
    Major_Version: Byte; {current version}
    Minor_Version: Byte; {current version}
    Highest_Major_Version: Byte; {available on disk}
    Highest_Minor_Version: Byte; {available on disk}
    Description: array[1..256] of Char; // C++ Char Description[256];
    SystemStatus: array[1..128] of Char; // C++ Char Description[128];
    MaxSockets: Word; // C++ Unsigned short MaxSockets;
    MaxUDPDatagramSize: Word; // C++ Unsigned short MaxUDPDatagramSize;
    VendorInfo: PAnsiChar; // C++ Char FAR * VendorInfo;
  end;

const
  ConstSizeofTSockAddrIn = 16;
  cLogFile = '\dcm_server.log';

function CreateSocket(sin_family, socket_type, protocol: integer;
  var ErrorCode: Integer): TSocket;
function ClientConnectToServer(ServerIPAddress: AnsiString;
  ServerPort: Integer;
  UseUDP, UseNAGLE: Boolean;
  ResultSockAddr: PSockAddr;
  var ErrorCode: Integer): TSocket;
function BindAndListen(BindToIPAddress: AnsiString;
  BindToPort, WinsockQueue: Integer;
  UseUDP, UseNAGLE, ConnectionLess: Boolean;
  ResultSockAddr: PSockAddr;
  var ErrorCode: Integer): TSocket;
function IsAcceptWaiting(ListenerSock: TSocket): Boolean;
function AcceptNewConnect(ListenerSock: TSocket;
  ResultAddr: PSockAddr;
  ResultAddrlen: PInteger;
  var ErrorCode: Integer): TSocket;
procedure CloseConnection(var Sock: TSocket;
  Gracefully: Boolean);
function BasicSend(Sock: TSocket;
  var Buf;
  Len: Integer;
  Flags: Integer;
  var ErrorCode: Integer): Integer;
function BasicRecv(Sock: TSocket;
  var Buf;
  Len: Integer;
  Flags: Integer;
  var ErrorCode: Integer): Integer;
function UDPSend(Sock: TSocket;
  var Buf;
  Len: Integer;
  Flags: Integer;
  SendTo: TSockAddr;
  SendToSize: Integer;
  var ErrorCode: Integer): Integer;
function UDPRecv(Sock: TSocket;
  var Buf;
  Len: Integer;
  Flags: Integer;
  var RcvFrom: TSockAddr;
  var RcvFromSize: Integer;
  var ErrorCode: Integer): Integer;
function BasicPeek(Sock: TSocket;
  var Buf;
  Len: Integer): Integer;
function BasicSelect(Sock: TSocket;
  CheckRead: Boolean;
  Timeout: TTimeVal): Integer;
procedure SetNagle(Sock: TSocket;
  TurnOn: Boolean;
  var ErrorCode: Integer);
procedure SetBlocking(Sock: TSocket;
  UseBlocking: Boolean;
  var ErrorCode: Integer);
procedure SetReceiveTimeout(Sock: TSocket;
  TimeoutMS: Integer;
  var ErrorCode: Integer);
procedure SetSendTimeout(Sock: TSocket;
  TimeoutMS: Integer;
  var ErrorCode: Integer);
procedure SetReceiveBuffer(Sock: TSocket;
  WantedSize: Integer;
  var ErrorCode: Integer);
procedure SetSendBuffer(Sock: TSocket;
  WantedSize: Integer;
  var ErrorCode: Integer);
procedure ResetBufferAndTimeout(Sock: TSocket;
  TimeoutMS: Integer;
  WantedSize: Integer);
function GetReceiveBuffer(Sock: TSocket;
  var ErrorCode: Integer): Integer;
function GetSendBuffer(Sock: TSocket;
  var ErrorCode: Integer): Integer;
function GetSockStatusBool(Sock: TSocket;
  SO_Flag: Integer;
  var ErrorCode: Integer): Boolean;
function GetSockStatusInt(Sock: TSocket;
  SO_Flag: Integer;
  var ErrorCode: Integer): Integer;
procedure SetSockStatusBool(Sock: TSocket;
  SO_Flag: Integer;
  Setting: Boolean;
  var ErrorCode: Integer);
procedure SetSockStatusInt(Sock: TSocket;
  SO_Flag: Integer;
  Setting: Integer;
  var ErrorCode: Integer);
function CountWaiting(Sock: TSocket;
  var ErrorCode: Integer): Integer;
function GetAddressCountByIP(IPAddress: ansistring): Integer;
function GetAddressCountByHost(Host: AnsiString): Integer;
function GetIPAddressByHost(Host: Ansistring; Which: Integer): Ansistring;
function GetHostByIPAddress(IPAddress: Ansistring): Ansistring;
function GetLocalHostName: AnsiString;
function GetLocalPort(Sock: TSocket): Integer;
function GetLocalIPAddr(Sock: TSocket): AnsiString;
function GetLastError: Integer;
function GetErrorDesc(ErrorCode: Integer): AnsiString;
function ByteSwap4(along: Cardinal): Cardinal;
function ByteSwap2(ashort: smallint): smallint;
function IPIntToIPStr(IPAddr: Integer): AnsiString;
function IPStrToIPInt(IPAddr: Ansistring): Integer;
function SocketLayerLoaded: Boolean;
procedure GetSocketVersion(WinsockInfo: PWinsockInfo);
function ntohs(netshort: Word): Word;
function inet_ntoa(inaddr: in_addr): PAnsiChar;
function htonl(Hostlong: Integer): Integer;
function ntohl(Netlong: Integer): Integer;
function SetErrorCode(ResultCode: Integer): Integer;

var
  GlobalTimeout: TTimeVal; //6-9

implementation

uses
  KXString,
  SysUtils;

var
  {$IFNDEF LINUX}
  DLLData: TWSAData;
  {$ENDIF}
  StartupResult: Integer;
  vDt_IsAcceptWaiting : TDateTime;

var
  {$IFDEF LINUX}
  SizeOfInt: Cardinal = 4; // optimize compiling
  {$ELSE}
  SizeOfInt: Integer = 4; // optimize compiling
  {$ENDIF}

resourcestring

  _WSAEINTR = 'Interrupted system call'; // 10004 L:4
  _WSAEBADF = 'Bad file number'; // 10009 L:9
  _WSAEACCES = 'Permission denied'; // 10013 L:13
  _WSAEFAULT = 'Bad address'; // 10014 L:14
  _WSAEINVAL = 'Invalid argument'; // 10022 L:22
  _WSAEMFILE = 'Too many open files'; // 10024 L:24
  _WSAEWOULDBLOCK = 'Operation would block'; // 10035 L:11 (?L:35?)
  _WSAEINPROGRESS = 'Operation now in progress'; // 10036 L:115
  _WSAEALREADY = 'Operation already in progress'; // 10037 L:114
  _WSAENOTSOCK = 'Socket operation on non-socket'; // 10038 L:88
  _WSAEDESTADDRREQ = 'Destination address required'; // 10039 L:89
  _WSAEMSGSIZE = 'Message too long'; // 10040 L:90
  _WSAEPROTOTYPE = 'Protocol wrong type for socket'; // 10041 L:91
  _WSAENOPROTOOPT = 'Protocol not available'; // 10042 L:92
  _WSAEPROTONOSUPPORT = 'Protocol not supported'; // 10043 L:93
  _WSAESOCKTNOSUPPORT = 'Socket type not supported'; // 10044 L:94
  _WSAEOPNOTSUPP = 'Operation not supported on socket'; // 10045 L:95
  _WSAEPFNOSUPPORT = 'Protocol family not supported'; // 10046 L:96
  _WSAEAFNOSUPPORT = 'Address family not supported by protocol family'; // 10047 L:97
  _WSAEADDRINUSE = 'Address already in use'; // 10048 L:98
  _WSAEADDRNOTAVAIL = 'Can''t assign requested address'; // 10049 L:99
  _WSAENETDOWN = 'Network is down'; // 10050 L:100
  _WSAENETUNREACH = 'Network is unreachable'; // 10051 L:101
  _WSAENETRESET = 'Network dropped connection on reset'; // 10052 L:102
  _WSAECONNABORTED = 'Software caused connection abort'; // 10053 L:103
  _WSAECONNRESET = 'Connection reset by peer'; // 10054 L:104
  _WSAENOBUFS = 'No buffer space available'; // 10055 L:105
  _WSAEISCONN = 'Socket is already connected'; // 10056 L:106
  _WSAENOTCONN = 'Socket is not connected'; // 10057 L:107
  _WSAESHUTDOWN = 'Can''t send after socket shutdown'; // 10058 L:108
  _WSAETOOMANYREFS = 'Too many references can''t splice'; // 10059 L:109
  _WSAETIMEDOUT = 'Connection timed out'; // 10060 L:110
  _WSAECONNREFUSED = 'Connection refused'; // 10061 L:111
  _WSAELOOP = 'Too many levels of symbolic links'; // 10062 L:40
  _WSAENAMETOOLONG = 'File name too long'; // 10063 L:36
  _WSAEHOSTDOWN = 'Host is down'; // 10064 L:112
  _WSAEHOSTUNREACH = 'No route to host'; // 10065 L:113
  _WSAENOTEMPTY = 'Directory not empty'; // 10066 L:39
  _WSAEPROCLIM = 'Too many processes'; // 10067
  _WSAEUSERS = 'Too many users'; // 10068 L:87
  _WSAEDQUOT = 'Disk quota exceeded'; // 10069 L:122
  _WSAESTALE = 'Stale NFS file handle'; // 10070 L:116
  _WSAEREMOTE = 'Too many levels of remote in path'; // 10071 L:66
  _WSASYSNOTREADY = 'Network sub-system is unusable'; // 10091
  _WSAVERNOTSUPPORTED = 'WSOCK32.DLL DLL cannot support this application'; // 10092
  _WSANOTINITIALISED = 'WSOCK32.DLL not initialized'; // 10093
  _WSAHOST_NOT_FOUND = 'Host not found'; // 11001 L:1
  _WSATRY_AGAIN = 'Non-authoritative host not found'; // 11002 L:2
  _WSANO_RECOVERY = 'Non-recoverable error'; // 11003 L:3
  _WSANO_DATA = 'No Data'; // 11004 L:4
  _WSAUNKNOWN = 'Unknown Socket Error';

  {$IFDEF LINUX}

function WSAGetLastError: Integer;
begin
  Result := System.GetLastError
end;
{$ENDIF}

function CreateSocket(sin_family, socket_type, protocol: integer;
  var ErrorCode: Integer): TSocket;
begin

  MnLg_ev('KXSocket CreateSocket',DCM_log.vLogDir+cLogFile);

  ErrorCode := 0;
  Result := {$IFDEF LINUX}Libc.
  {$ELSE}Winsock.
  {$ENDIF}Socket(sin_family, socket_type, protocol);
  if Result = Invalid_Socket then
    ErrorCode := WSAGetLastError;
end;

function SetErrorCode(ResultCode: Integer): Integer;
begin
  if ResultCode = Socket_Error then
  begin
    Result := WSAGetLastError;

    MnLg_ev('KXSocket SetErrorCode : '+IntToStr(WSAGetLastError) , DCM_log.vLogDir+cLogFile);

  end else
    Result := 0;
end;

procedure SetNagle(Sock: TSocket;
  TurnOn: Boolean;
  var ErrorCode: Integer);
var
  TA: array[0..3] of Char;

begin

  MnLg_ev('KXSocket SetNagle',DCM_log.vLogDir+cLogFile);

  if not TurnOn then
    TA := '1111'
  else
    TA := '0000';
  ErrorCode := SetErrorCode(SetSockOpt(Sock, IPPROTO_TCP, TCP_NODELAY, @TA, SizeofInt));
end;

procedure SetBlocking(Sock: TSocket;
  UseBlocking: Boolean;
  var ErrorCode: Integer);
{$IFDEF LINUX}
const
  FIONBIO = $5421;
  {$ENDIF}

var
  {$IFDEF VER90}
  iBlocking: u_long;
  {$ELSE}
  iBlocking: Integer;
  {$ENDIF}

begin

  MnLg_ev('KXSocket SetBlocking',DCM_log.vLogDir+cLogFile);

  if UseBlocking then
    iBlocking := 0
  else
    iBlocking := 1;
  ErrorCode := SetErrorCode(
    {$IFDEF VER90}
    Winsock.ioctlsocket(Sock, FIONBIO, iBlocking)
    {$ELSE}
    {$IFDEF LINUX}Libc.ioctl(Sock, FIONBIO, iBlocking)
    {$ELSE}Winsock.ioctlsocket(Sock, FIONBIO, iBlocking)
    {$ENDIF}
    {$ENDIF}
    );
end;

procedure SetReceiveTimeout(Sock: TSocket;
  TimeoutMS: Integer;
  var ErrorCode: Integer);
begin
  ErrorCode := SetErrorCode(setsockopt(Sock, SOL_SOCKET, SO_RCVTIMEO, @TimeoutMS, SizeOfInt));
end;

procedure SetSendTimeout(Sock: TSocket;
  TimeoutMS: Integer;
  var ErrorCode: Integer);
begin
  ErrorCode := SetErrorCode(setsockopt(Sock, SOL_SOCKET, SO_SNDTIMEO, @TimeoutMS, SizeofInt));
end;

procedure SetReceiveBuffer(Sock: TSocket;
  WantedSize: Integer;
  var ErrorCode: Integer);
begin
  ErrorCode := SetErrorCode(setsockopt(Sock, SOL_SOCKET, SO_RCVBUF, @WantedSize, SizeofInt));
end;

procedure ResetBufferAndTimeout(Sock: TSocket;
  TimeoutMS: Integer;
  WantedSize: Integer);
var
  i:Integer;  
begin

  MnLg_ev('KXSocket ResetBufferAndTimeout',DCM_log.vLogDir+cLogFile);

  setsockopt(Sock, SOL_SOCKET, SO_SNDTIMEO, @TimeoutMS, SizeofInt);
  setsockopt(Sock, SOL_SOCKET, SO_RCVTIMEO, @TimeoutMS, SizeOfInt);
  setsockopt(Sock, SOL_SOCKET, SO_RCVBUF, @WantedSize, SizeofInt);
  setsockopt(Sock, SOL_SOCKET, SO_SNDBUF, @WantedSize, SizeofInt);

  getsockopt(Sock, SOL_SOCKET, SO_RCVBUF, @i, SizeofInt);
  if i<> WantedSize then
    Raise Exception.Create('Error Set Receive Buffer size');

  getsockopt(Sock, SOL_SOCKET, SO_SNDBUF, @i, SizeofInt);
  if i<> WantedSize then
    Raise Exception.Create('Error Set Send Buffer size');
end;

function GetSockStatusBool(Sock: TSocket;
  SO_Flag: Integer;
  var ErrorCode: Integer): Boolean;
var
  Rslt: Boolean;

begin

  MnLg_ev('KXSocket GetSockStatusBool',DCM_log.vLogDir+cLogFile);

  // 7-27
  ErrorCode := SetErrorCode(GetSockOpt(Sock, SOL_SOCKET, SO_Flag, PAnsiChar(@Rslt), SizeofInt));
  if ErrorCode = 0 then
    Result := Rslt
  else
    Result := False;
end;

function GetSockStatusInt(Sock: TSocket;
  SO_Flag: Integer;
  var ErrorCode: Integer): Integer;
var
  Rslt: Integer;

begin

  MnLg_ev('KXSocket GetSockStatusInt',DCM_log.vLogDir+cLogFile);

  // 7-27
  ErrorCode := SetErrorCode(GetSockOpt(Sock, SOL_SOCKET, SO_Flag, PAnsiChar(@Rslt), SizeofInt));
  if ErrorCode = 0 then
    Result := Rslt
  else
    Result := 0;
end;

procedure SetSockStatusBool(Sock: TSocket;
  SO_Flag: Integer;
  Setting: Boolean;
  var ErrorCode: Integer);
var
  intval: integer;

begin

  MnLg_ev('KXSocket SetSockStatusBool',DCM_log.vLogDir+cLogFile);

  if (Setting) then
    intval := 1
  else
    intval := 0;
  ErrorCode := SetErrorCode(SetSockOpt(Sock, SOL_Socket, SO_Flag, @intval, SizeofInt));
end;

procedure SetSockStatusInt(Sock: TSocket;
  SO_Flag: Integer;
  Setting: Integer;
  var ErrorCode: Integer);
begin
  ErrorCode := SetErrorCode(SetSockOpt(Sock, SOL_Socket, SO_Flag, @Setting, SizeofInt));
end;

procedure SetSendBuffer(Sock: TSocket;
  WantedSize: Integer;
  var ErrorCode: Integer);
begin
  ErrorCode := SetErrorCode(setsockopt(Sock, SOL_SOCKET, SO_SNDBUF, @WantedSize, SizeofInt));
end;

function GetReceiveBuffer(Sock: TSocket;
  var ErrorCode: Integer): Integer;
begin
  Result := GetSockStatusInt(Sock, SO_RCVBUF, ErrorCode);
end;

function GetSendBuffer(Sock: TSocket;
  var ErrorCode: Integer): Integer;
begin
  Result := GetSockStatusInt(Sock, SO_SNDBUF, ErrorCode);
end;

procedure KillSocket(var Sock: TSocket);
begin

  MnLg_ev('KXSocket KillSocket',DCM_log.vLogDir+cLogFile);

  if Sock <> Invalid_Socket then
  begin
    ShutDown(Sock, 2);
    {$IFDEF LINUX}
    Libc.__close(Sock);
    {$ELSE}
    CloseSocket(Sock);
    {$ENDIF}
    Sock := Invalid_Socket;
  end;
end;

procedure CloseConnection(var Sock: TSocket;
  Gracefully: Boolean);
var
  {$IFDEF VER100} // Delphi3 code
  Lin: TLinger;
  {$ELSE}
  Lin: Linger;
  {$ENDIF}

begin

  MnLg_ev('KXSocket CloseConnection',DCM_log.vLogDir+cLogFile);

  if Sock = Invalid_Socket then
    Exit;
  Lin.l_linger := 0;
  if Gracefully then
  begin
    Lin.l_onoff := 1; // Not(0);
    {$IFDEF LINUX}Libc.
    {$ELSE}Winsock.
    {$ENDIF}setsockopt(Sock, SOL_SOCKET, SO_LINGER, @lin, Sizeof(Lin));
  end
  else
  begin
    Lin.l_onoff := 0;
    {$IFDEF LINUX}Libc.
    {$ELSE}Winsock.
    {$ENDIF}setsockopt(Sock, SOL_SOCKET, SO_LINGER, @lin, sizeof(lin)); {DONT 2.0.f}
  end;
  KillSocket(Sock);
end;

function ClientConnectToServer(ServerIPAddress: AnsiString;
  ServerPort: Integer;
  UseUDP, UseNAGLE: Boolean;
  ResultSockAddr: PSockAddr;
  var ErrorCode: Integer): TSocket;
{$IFDEF LINUX}
const
  SOCK_dgram = 2;
  SOCK_stream = 1;
  {$ENDIF}

begin

  MnLg_ev('KXSocket ClientConnectToServer',DCM_log.vLogDir+cLogFile);

  Result := Invalid_Socket;
  if ServerIPAddress = '' then
    Exit;
  ServerIPAddress := FixDottedIp(ServerIPAddress);
  FillChar(ResultSockAddr^, Sizeof(ResultSockAddr^), #0);
  ResultSockAddr.sin_family := AF_INET;
  ResultSockAddr.sin_port := htons(ServerPort);
  if IsNumericString(ServerIPAddress) then
  begin
    ResultSockAddr.sin_addr.S_addr := Inet_Addr(PAnsichar(ServerIPAddress));
  end
  else
  begin
    ServerIPAddress := GetIPAddressByHost(ServerIPAddress, 1);
    if ServerIPAddress = '' then
    begin
      ErrorCode := WSAEFAULT; // invalid address
      Exit;
    end;
    ResultSockAddr.sin_addr.S_addr := Inet_Addr(PAnsichar(ServerIPAddress));
  end;
  case UseUDP of
    True:
      begin
        Result := CreateSocket(AF_INET, SOCK_DGRAM, IPPROTO_UDP, ErrorCode);
        Exit;
      end;
  else
    begin
      Result := CreateSocket(AF_INET, SOCK_STREAM, IPPROTO_TCP, ErrorCode);
      if (Result <> Invalid_Socket) and (not UseNAGLE) then
        SetNAGLE(Result, UseNAGLE, ErrorCode);
    end;
  end;
  if Result = Invalid_Socket then
    Exit;
  SetSendTimeout(Result, 500, ErrorCode);
  if Connect(Result, ResultSockAddr^, ConstSizeofTSockAddrIn) = SOCKET_ERROR then
  begin
    ErrorCode := WSAGetLastError;
    KillSocket(Result);
  end;
end;

function BindAndListen(BindToIPAddress: AnsiString;
  BindToPort, WinsockQueue: Integer;
  UseUDP, UseNAGLE, ConnectionLess: Boolean;
  ResultSockAddr: PSockAddr;
  var ErrorCode: Integer): TSocket;
{$IFDEF LINUX}
const
  SOCK_dgram = 2;
  SOCK_stream = 1;
  {$ENDIF}

begin

  MnLg_ev('KXSocket BindAndListen',DCM_log.vLogDir+cLogFile);

  FillChar(ResultSockAddr^, Sizeof(ResultSockAddr^), #0); // DO ! USE ZEROMEMORY
  // SPX: Result:=CreateSocket(AF_IPX,SOCK_STREAM,NSPROTO_SPX,ErrorCode);
  // IPX: Result:=CreateSocket(AF_IPX,SOCK_DGRAM,NSPROTO_IPX,ErrorCode);
  case UseUDP of
    True: Result := CreateSocket(AF_INET, SOCK_DGRAM, IPPROTO_UDP, ErrorCode);
  else
    begin
      Result := CreateSocket(AF_INET, SOCK_STREAM, IPPROTO_TCP, ErrorCode);
      if (Result <> Invalid_Socket) and (not UseNAGLE) then
        SetNAGLE(Result, UseNAGLE, ErrorCode);
    end;
  end;
  if Result = Invalid_Socket then
    Exit;
  ResultSockAddr.sin_family := AF_INET;
  ResultSockAddr.sin_port := htons(BindToPORT);
  // 7-27
  if (length(BindToIPAddress) < 7) then
    ResultSockAddr.sin_addr.S_addr := INADDR_ANY
  else
    ResultSockAddr.sin_addr.S_addr := Inet_Addr(PAnsiChar(BindToIPAddress));
  if Bind(Result, ResultSockAddr^, ConstSizeofTSockAddrIn) = Socket_Error then
  begin
    Result := Invalid_Socket;
    ErrorCode := WSAGetLastError;
    Exit;
  end;
  // 7-27
  if not ConnectionLess then
    if Listen(Result, WinsockQueue) = Socket_Error then
    begin
      Result := Invalid_Socket;
      ErrorCode := WSAGetLastError;
    end;
end;

function IsAcceptWaiting(ListenerSock: TSocket): Boolean;
{$IFNDEF LINUX}
var
  SockList: TFDSet;
  {$ENDIF}

begin
  if MinutesBetween(vDt_IsAcceptWaiting,Now)>5 then
  begin
    vDt_IsAcceptWaiting:=Now;
    MnLg_ev('KXSocket IsAcceptWaiting',DCM_log.vLogDir+cLogFile);
  end;

  {$IFDEF LINUX}
  Result := BasicSelect(ListenerSock, True, GlobalTimeout) > 0;
  {$ELSE}
  SockList.fd_count := 1;
  SockList.fd_array[0] := ListenerSock;
  Result := Select(0, @sockList, nil, nil, @GlobalTimeout) > 0;
  {$ENDIF}
end;

function AcceptNewConnect(ListenerSock: TSocket;
  ResultAddr: PSockAddr;
  ResultAddrlen: PInteger;
  var ErrorCode: Integer): TSocket;
begin

  MnLg_ev('KXSocket AcceptNewConnect',DCM_log.vLogDir+cLogFile);

  Result := {$IFDEF LINUX}Libc.
  {$ELSE}Winsock.
  {$ENDIF}Accept(ListenerSock,
    {$IFDEF VER90}
    ResultAddr^, ResultAddrLen^);
  {$ELSE}
    {$IFDEF LINUX}
    ResultAddr, PSocketLength(ResultAddrLen));
  {$ELSE}
    ResultAddr, ResultAddrLen);
  {$ENDIF}
  {$ENDIF}
  if Result = Invalid_Socket then
    ErrorCode := WSAGetLastError
  else
    if ResultAddrLen^ = 0 then
    ErrorCode := WSAEFault
  else
    ErrorCode := 0;
end;

function BasicSend(Sock: TSocket;
  var Buf;
  Len: Integer;
  Flags: Integer;
  var ErrorCode: Integer): Integer;
begin

  MnLg_ev('KXSocket BasicSend',DCM_log.vLogDir+cLogFile);

  //   Result:=Socket_Error;
  //   ErrorCode:=WSAEINTR;
  //   While (Result<0) and ((ErrorCode=WSAEINTR) or (ErrorCode=WSAETIMEDOUT)) do Begin
  Result := Send(Sock, Buf, Len, Flags);
  ErrorCode := SetErrorCode(Result);
  //   End;
end;

function UDPSend(Sock: TSocket;
  var Buf;
  Len: Integer;
  Flags: Integer;
  SendTo: TSockAddr;
  SendToSize: Integer;
  var ErrorCode: Integer): Integer;
begin

  MnLg_ev('KXSocket UDPSend',DCM_log.vLogDir+cLogFile);

  Result := {$IFDEF LINUX}Libc.
  {$ELSE}Winsock.
  {$ENDIF}SendTo(Sock, Buf, Len, Flags, SendTo, SendToSize);
  ErrorCode := SetErrorCode(Result);
end;

function BasicRecv(Sock: TSocket;
  var Buf;
  Len: Integer;
  Flags: Integer;
  var ErrorCode: Integer): Integer;
begin

  MnLg_ev('KXSocket BasicRecv',DCM_log.vLogDir+cLogFile);

  Result := Recv(Sock, Buf, Len, Flags);
  ErrorCode := SetErrorCode(Result);
end;

function UDPRecv(Sock: TSocket;
  var Buf;
  Len: Integer;
  Flags: Integer;
  var RcvFrom: TSockAddr;
  var RcvFromSize: Integer;
  var ErrorCode: Integer): Integer;
begin

  MnLg_ev('KXSocket UDPRecv',DCM_log.vLogDir+cLogFile);

  Result := {$IFDEF LINUX}Libc.recvfrom(Sock, Buf, Len, Flags, @RcvFrom, @RcvFromSize);
  {$ELSE}Winsock.recvfrom(Sock, Buf, Len, Flags, RcvFrom, RcvFromSize);
  {$ENDIF}
  ErrorCode := SetErrorCode(Result);
end;

function BasicPeek(Sock: TSocket;
  var Buf;
  Len: Integer): Integer;
begin

  MnLg_ev('KXSocket BasicPeek',DCM_log.vLogDir+cLogFile);

  Result := Recv(Sock, Buf, Len, MSG_PEEK);
end;

function BasicSelect(Sock: TSocket;
  CheckRead: Boolean;
  Timeout: TTimeVal): Integer;
var
  SockList: TFDSet;

begin

  MnLg_ev('KXSocket BasicSelect',DCM_log.vLogDir+cLogFile);

  {$IFDEF LINUX}
  FD_ZERO(SockList);
  SockList.fds_bits[0] := Sock;
  if CheckRead then
    Result := Select(1, @SockList, nil, nil, @Timeout)
  else
    Result := Select(1, nil, @SockList, nil, @Timeout);
  {$ELSE}
  SockList.fd_count := 1;
  SockList.fd_array[0] := Sock;
  if CheckRead then
    Result := Select(0, @sockList, nil, nil, @Timeout)
  else
    Result := Select(0, nil, @sockList, nil, @Timeout)
      {$ENDIF}
end;

function CountWaiting(Sock: TSocket; var ErrorCode: Integer): Integer;
{$IFDEF LINUX}
const
  FIONREAD = $541B;
  {$ENDIF}
var
  numWaiting: longint;

begin

  MnLg_ev('KXSocket CountWaiting',DCM_log.vLogDir+cLogFile);

  Result := 0;
  // in linux IOCtl is used to "set" not "get" values.
  ErrorCode := SetErrorCode({$IFDEF LINUX}Libc.IOCtl(Sock, FIONREAD, numWaiting));
  {$ELSE}Winsock.IOCtlSocket(Sock, FIONREAD, numWaiting));
  {$ENDIF}
  if ErrorCode = 0 then
    Result := numWaiting;
end;

function GetAddressCountByIP(IPAddress: Ansistring): Integer;
var
  HostEnt: PHostEnt;
  InAddr: u_long;

begin

  MnLg_ev('KXSocket GetAddressCountByIP',DCM_log.vLogDir+cLogFile);

  IPAddress := FixDottedIp(IPAddress);
  InAddr := inet_addr(PAnsiChar(IPAddress));
  HostEnt := gethostbyaddr(@InAddr, Length(IPAddress), AF_INET);
  if Assigned(HostEnt) then
    Result := HostEnt^.h_length div 4
  else
    Result := 0;
end;

function GetAddressCountByHost(Host: AnsiString): Integer;
var
  HostEnt: PHostEnt;

begin

  MnLg_ev('KXSocket GetAddressCountByHost',DCM_log.vLogDir+cLogFile);

  HostEnt := gethostbyname(PAnsiChar(Host));
  if Assigned(HostEnt) then
    Result := HostEnt^.h_length div 4
  else
    Result := 0;
end;

function GetIPAddressByHost(Host: Ansistring; Which: Integer): Ansistring;
var
  HostEnt: PHostEnt;
  iAddr: Integer;

begin

  MnLg_ev('KXSocket GetIPAddressByHost',DCM_log.vLogDir+cLogFile);

  HostEnt := gethostbyname(PAnsiChar(Host));
  if Assigned(HostEnt) then
  begin
    if Which <= (HostEnt^.h_length div 4) then
    begin
      Move(PByteArray(HostEnt^.h_addr_list^)[(Which - 1) * 4], iAddr, 4);
      Result := inet_ntoa(in_Addr(iAddr));
    end
    else
      Result := '';
  end
  else
    Result := '';
end;

function GetHostByIPAddress(IPAddress: Ansistring): Ansistring;
var
  HostEnt: PHostEnt;
  InAddr: u_long;

begin

  MnLg_ev('KXSocket GetHostByIPAddress',DCM_log.vLogDir+cLogFile);

  IPAddress := FixDottedIp(IPAddress);
  InAddr := inet_addr(PAnsiChar(IPAddress));
  HostEnt := gethostbyaddr(@InAddr, Length(IPAddress), AF_INET);
  if Assigned(HostEnt) then
    Result := StrPas(HostEnt^.h_name)
  else
    Result := '';
end;

function GetLocalHostName: AnsiString;
begin

  MnLg_ev('KXSocket GetLocalHostName',DCM_log.vLogDir+cLogFile);

  Result := GetHostByIPAddress(
    GetIPAddressByHost('localhost', 1));
  if Result = '' then
    Result := 'Localhost';
end;

function GetLocalPort(Sock: TSocket): Integer;
var
  addr: TSockAddrIn;
  {$IFDEF LINUX}
  addrlen: cardinal;
  {$ELSE}
  addrlen: integer;
  {$ENDIF}

begin

  MnLg_ev('KXSocket GetLocalPort',DCM_log.vLogDir+cLogFile);

  addrlen := ConstSizeofTSockAddrIn;
  if getsockname(Sock, addr, addrlen) = 0 then
    Result := ntohs(addr.sin_port)
  else
    Result := 0;
end;

function GetLocalIPAddr(Sock: TSocket): AnsiString;
var
  addr: TSockAddrIn;
  {$IFDEF LINUX}
  addrlen: cardinal;
  {$ELSE}
  addrlen: integer;
  {$ENDIF}

begin

  MnLg_ev('KXSocket GetLocalIPAddr',DCM_log.vLogDir+cLogFile);

  addrlen := ConstSizeofTSockAddrIn;
  FillChar(Addr, Sizeof(TSockAddrIn), #0);
  getsockname(Sock, addr, addrlen);
  Result := inet_ntoa(addr.sin_addr);
end;

procedure GetRemoteSockAddr(Sock: TSocket;
  ResultAddr: PSockAddr;
  ResultAddrlen: PInteger;
  var ErrorCode: Integer);
{$IFDEF LINUX}
var
  TmpAddrLen: Cardinal;
  {$ENDIF}

begin

  MnLg_ev('KXSocket GetRemoteSockAddr',DCM_log.vLogDir+cLogFile);

  {$IFDEF LINUX}
  ErrorCode := SetErrorCode(getpeername(Sock, ResultAddr^, TmpAddrlen));
  ResultAddrLen^ := TmpAddrLen;
  {$ELSE}
  ErrorCode := SetErrorCode(getpeername(Sock, ResultAddr^, ResultAddrlen^));
  {$ENDIF}
end;

function GetLastError: Integer;
begin
  Result := WSAGetLastError;

  MnLg_ev('KXSocket GetLastError',DCM_log.vLogDir+cLogFile);

end;

function GetErrorDesc(errorCode: Integer): AnsiString;
begin

  MnLg_ev('KXSocket GetErrorDesc',DCM_log.vLogDir+cLogFile);

  // If you compile and get "Undeclared Identified -
  // Edit DXSock.DEF - and select a language!
  case errorCode of
    WSAEINTR: Result := _WSAEINTR;
    WSAEBADF: Result := _WSAEBADF;
    WSAEACCES: Result := _WSAEACCES;
    WSAEFAULT: Result := _WSAEFAULT;
    WSAEINVAL: Result := _WSAEINVAL;
    WSAEMFILE: Result := _WSAEMFILE;
    WSAEWOULDBLOCK: Result := _WSAEWOULDBLOCK;
    WSAEINPROGRESS: Result := _WSAEINPROGRESS;
    WSAEALREADY: Result := _WSAEALREADY;
    WSAENOTSOCK: Result := _WSAENOTSOCK;
    WSAEDESTADDRREQ: Result := _WSAEDESTADDRREQ;
    WSAEMSGSIZE: Result := _WSAEMSGSIZE;
    WSAEPROTOTYPE: Result := _WSAEPROTOTYPE;
    WSAENOPROTOOPT: Result := _WSAENOPROTOOPT;
    WSAEPROTONOSUPPORT: Result := _WSAEPROTONOSUPPORT;
    WSAESOCKTNOSUPPORT: Result := _WSAESOCKTNOSUPPORT;
    WSAEOPNOTSUPP: Result := _WSAEOPNOTSUPP;
    WSAEPFNOSUPPORT: Result := _WSAEPFNOSUPPORT;
    WSAEAFNOSUPPORT: Result := _WSAEAFNOSUPPORT;
    WSAEADDRINUSE: Result := _WSAEADDRINUSE;
    WSAEADDRNOTAVAIL: Result := _WSAEADDRNOTAVAIL;
    WSAENETDOWN: Result := _WSAENETDOWN;
    WSAENETUNREACH: Result := _WSAENETUNREACH;
    WSAENETRESET: Result := _WSAENETRESET;
    WSAECONNABORTED: Result := _WSAECONNABORTED;
    WSAECONNRESET: Result := _WSAECONNRESET;
    WSAENOBUFS: Result := _WSAENOBUFS;
    WSAEISCONN: Result := _WSAEISCONN;
    WSAENOTCONN: Result := _WSAENOTCONN;
    WSAESHUTDOWN: Result := _WSAESHUTDOWN;
    WSAETOOMANYREFS: Result := _WSAETOOMANYREFS;
    WSAETIMEDOUT: Result := _WSAETIMEDOUT;
    WSAECONNREFUSED: Result := _WSAECONNREFUSED;
    WSAELOOP: Result := _WSAELOOP;
    WSAENAMETOOLONG: Result := _WSAENAMETOOLONG;
    WSAEHOSTDOWN: Result := _WSAEHOSTDOWN;
    WSAEHOSTUNREACH: Result := _WSAEHOSTUNREACH;
    WSAENOTEMPTY: Result := _WSAENOTEMPTY;
    WSAEPROCLIM: Result := _WSAEPROCLIM;
    WSAEUSERS: Result := _WSAEUSERS;
    WSAEDQUOT: Result := _WSAEDQUOT;
    WSAESTALE: Result := _WSAESTALE;
    WSAEREMOTE: Result := _WSAEREMOTE;
    WSASYSNOTREADY: Result := _WSASYSNOTREADY;
    WSAVERNOTSUPPORTED: Result := _WSAVERNOTSUPPORTED;
    WSANOTINITIALISED: Result := _WSANOTINITIALISED;
    WSAHOST_NOT_FOUND: Result := _WSAHOST_NOT_FOUND;
    WSATRY_AGAIN: Result := _WSATRY_AGAIN;
    WSANO_RECOVERY: Result := _WSANO_RECOVERY;
    WSANO_DATA: Result := _WSANO_DATA;
  else
    Result := _WSAUNKNOWN + ' (' + IntToCommaStr(ErrorCode) + ')';
  end;
end;

function ByteSwap4(along: Cardinal): Cardinal;
begin
  result := ntohl(along);
end;

function ByteSwap2(ashort: smallint): smallint;
begin
  result := ntohs(ashort);
end;

function IPIntToIPStr(IPAddr: Integer): AnsiString;
var
  Ws: AnsiString;

begin
  Setlength(Ws, 4);
  Move(IPAddr, Ws[1], 4);
  Result := IntToStr(Ord(Ws[1])) + '.' +
    IntToStr(Ord(Ws[2])) + '.' +
    IntToStr(Ord(Ws[3])) + '.' +
    IntToStr(Ord(Ws[4]));
end;

function IPStrToIPInt(IPAddr: Ansistring): Integer;
var
  Ws: AnsiString;

begin
  Setlength(Ws, 4);
  Ws[1] := AnsiChar(StrToInt(FetchByChar(IPAddr, '.', False)));
  Ws[2] := AnsiChar(StrToInt(FetchByChar(IPAddr, '.', False)));
  Ws[3] := AnsiChar(StrToInt(FetchByChar(IPAddr, '.', False)));
  Ws[4] := AnsiChar(StrToInt(FetchByChar(IPAddr, '.', False)));
  Move(Ws[1], Result, 4);
end;

function SocketLayerLoaded: Boolean;
begin
  Result := (StartupResult = 999);
end;

procedure GetSocketVersion(WinsockInfo: PWinsockInfo);
begin

  MnLg_ev('KXSocket GetSocketVersion',DCM_log.vLogDir+cLogFile);

  {$IFDEF LINUX}
  with WinsockInfo^ do
  begin
    Major_Version := 2;
    Minor_Version := 0;
    Highest_Major_Version := 2;
    Highest_Minor_Version := 0;
    Move('Linux Socket Layer 2.0', Description, 256);
    Move('Ready', SystemStatus, 128);
    MaxSockets := 65000;
    MaxUDPDatagramSize := 1500;
    VendorInfo := 'Brain Patchwork DX, LLC.';
  end;
  {$ELSE}
  with WinsockInfo^ do
  begin
    Major_Version := BYTE(DllData.wVersion);
    Minor_Version := HIBYTEOfWORD(DllData.wVersion);
    Highest_Major_Version := BYTE(DllData.wHighVersion);
    Highest_Minor_Version := HIBYTEOfWORD(DllData.wHighVersion);
    Move(DllData.szDescription, Description, 256);
    Move(DllData.szSystemStatus, SystemStatus, 128);
    MaxSockets := DllData.iMaxSockets;
    MaxUDPDatagramSize := DllData.iMaxUdpDg;
    VendorInfo := DllData.lpVendorInfo;
  end;
  {$ENDIF}
end;

function ntohs(netshort: Word): Word;
begin
  Result := {$IFDEF LINUX}Libc.
  {$ELSE}Winsock.
  {$ENDIF}ntohs(Netshort);
end;

function inet_ntoa(inaddr: in_addr): PAnsiChar;
begin
  Result := {$IFDEF LINUX}Libc.
  {$ELSE}Winsock.
  {$ENDIF}inet_ntoa(inaddr);
end;

function htonl(Hostlong: Integer): Integer;
begin
  Result := {$IFDEF LINUX}Libc.
  {$ELSE}Winsock.
  {$ENDIF}htonl(Hostlong);
end;

function ntohl(Netlong: Integer): Integer;
begin
  Result := {$IFDEF LINUX}Libc.
  {$ELSE}Winsock.
  {$ENDIF}ntohl(netlong)
end;

initialization
  vDt_IsAcceptWaiting := Now ;
  MnLg_ev('KXSocket initialization section',DCM_log.vLogDir+cLogFile);

  {$IFDEF LINUX}
  StartupResult := 0;
  {$ELSE}
  StartupResult := WSAStartup(MAKEBytesToWORD(2, 2), DLLData);
  {$ENDIF}
  if StartupResult = 0 then
  begin
    StartupResult := 999;
    // 6-9: added to load 1 time.
    GlobalTimeout.tv_Sec := 0;
    GlobalTimeout.tv_uSec := 500; //2500;
  end
  else
    StartupResult := 123;

finalization
  {$IFNDEF LINUX}
  if StartupResult = 999 then
    WSACleanup;
  {$ENDIF}

end.

