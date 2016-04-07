{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_WADO;

interface

{.$DEFINE USE_DLL_MGR}
{.$DEFINE SUPPORT_COM}
{.$DEFINE DICOMDEBUGZ}
uses
  {$IFNDEF LINUX}
  Windows,
  {$ENDIF}
  {$IFDEF SUPPORT_COM}
  ActiveX,
  {$ENDIF}
  Classes,
  KXString,
  KXServerCore,
  {$IFDEF DICOMDEBUGZ}DbugIntf, {$ENDIF}
  KXSecurity, Graphics, cnsmsg, DCM_ImageData_Bitmap,
  KxSock, KXSockClient, DCM_Connection, DCM_Attributes, dcm_client, DCM_UID;

{$I KXSock.def}

type
  HCONN = Integer;
  {$IFDEF VER100}
  Longword = Cardinal;
  {$ENDIF}
  {$IFDEF LINUX}
  LPDWord = ^Longword;
  LPCSTR = PChar;
  {$ENDIF}
  {$IFDEF VER100}
type
  Longword = Cardinal;
  {$ENDIF}

const

  HA_MD5 = 0;
  HA_MD5_SESS = 1;
  HASHLEN = 16;
  HASHHEXLEN = 32;

type
  {$IFNDEF NO_AUTHENTICATION_SUPPORT}
  TAuthenticationType = (atNone, atBasic, atDigest);
  TAuthDigestMethod = (daAuth, daAuthInt, daBoth);
  THashHex = array[0..HASHHEXLEN] of AnsiChar;
  TAuthGetPasswordEvent = procedure(Sender: TObject;
    Client: TObject;
    var Password: string) of object;
  TAuthResultEvent = procedure(Sender: TObject;
    Client: TObject;
    Success: Boolean) of object;
  TAuthGetTypeEvent = procedure(Sender: TObject;
    Client: TObject) of object;
  {$ENDIF}

  SF_REQ_TYPE = LONGWORD;
  SF_STATUS_TYPE = LONGWORD;

const
  HSE_LOG_BUFFER_LEN = 80;
  HSE_MAX_EXT_DLL_NAME_LEN = 256;

type
  THeaderInfo = class
  private
    FPostData: TMemoryStream;
    procedure SetPostData(const Value: TMemoryStream);
  public
    ContentLength: Integer;
    Raw: string; // Original Header Request
    Protocol: string;
    Method: string; //GET, HEAD, etc.  All caps!!!
    URI: string;
    PhysPath: string;
    Allow: string;
    AuthType: string; // BASIC
    //    AuthName: string;
    //    AuthPass: string;
    Date: string;
    Pragma: string;
    CacheControl: string;
    Connection: string;
    TransferEncoding: string;
    Upgrade: string;
    Via: string;
    Host: string; // multiple domains on single IP!
    From: string;
    IfModSince: string;
    IfMatch: string;
    IfNoneMatch: string;
    IfRange: string;
    IfUnModSince: string;
    MaxForwards: string;
    ProxyAuthorization: string;
    KeepAlive: string;
    PublicCache: string; // 2.3 renamed field!
    Range: string;
    Referer: string;
    UserAgent: string;
    ContentType: string;
    Accept: string;
    AcceptCharset: string;
    AcceptEncoding: string;
    AcceptLanguage: string;
    ClientName: string;
    ClientAddr: string;
    ClientHost: string;
    Cookie: string;
    QueryString: string;
    Weferer: string;
    WserAgent: string;
    Forwarded: string;
    ForwardedFor: string;
    ProxyConnection: string;
    CacheInfo: string;
    HostRootPath: string; // needed for SSI+ Banner routines and ISAPI Variables
    All_RAW: string; // needed for trace, and ISAPIs!
    All_HTTP: string;
    Unknown: string;
  public
    constructor Create;
    destructor Destroy; override;
    property PostData: TMemoryStream read FPostData write SetPostData; //jiawen string; // 3.0
  end;

  TKXHTTPHeaderTools = class(TKXComponent)
  private
    fSessionHeader: THeaderInfo;
  protected
    function FindUnknownHeader(ServerVariable: string): string;
    procedure ReplaceUnknownHeader(ServerVariable, VariableValue: string);
    function UnknownHeaderExists(ServerVariable: string): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Init(HTTPHeader: THeaderInfo);
    // 2.0.12
    function HeaderGetString(ServerVariable: string): string;
    function HeaderGetInteger(ServerVariable: string): Integer;
    function HeaderDataExists(ServerVariable: string): Boolean;
    function QueryGetString(ServerVariable: string): string;
    function QueryGetInteger(ServerVariable: string): Integer;
    function QueryDataExists(ServerVariable: string): Boolean;

    function AddHeader(ServerVariable, VariableValue: string): Boolean;
    function SetHeader(ServerVariable, VariableValue: string): Boolean;
    function ToStrings: TStrings;

  published
  end;

  // RFC2068, Response Codes
const
  MaxStatusCodes = 40;
  StatusCodes: array[0..MaxStatusCodes] of record
    Code: Integer;
    Msg: string
  end =
  ((Code: 100; Msg: 'Continue'),
    (Code: 101; Msg: 'Switching Protocols'),
    (Code: 200; Msg: 'OK'),
    (Code: 201; Msg: 'Created'),
    (Code: 202; Msg: 'Accepted'),
    (Code: 203; Msg: 'Non-Authoritative Information'),
    (Code: 204; Msg: 'No Content'),
    (Code: 205; Msg: 'Reset Content'),
    (Code: 206; Msg: 'Partial Content'),
    (Code: 300; Msg: 'Multiple Choices'),
    (Code: 301; Msg: 'Moved Permanently'),
    (Code: 302; Msg: 'Moved Temporarily'),
    (Code: 303; Msg: 'See Other'),
    (Code: 304; Msg: 'Not Modified'),
    (Code: 305; Msg: 'Use Proxy'),
    (Code: 306; Msg: 'Unused'),
    (Code: 307; Msg: 'Temporary Redirect'),
    (Code: 400; Msg: 'Bad Request'),
    (Code: 401; Msg: 'Unauthorized'),
    (Code: 402; Msg: 'Payment Required'),
    (Code: 403; Msg: 'Forbidden'),
    (Code: 404; Msg: 'Not Found'),
    (Code: 405; Msg: 'Method Not Allowed'),
    (Code: 406; Msg: 'Not Acceptable'),
    (Code: 407; Msg: 'Proxy Authentication Required'),
    (Code: 408; Msg: 'Request Time-out'),
    (Code: 409; Msg: 'Conflict'),
    (Code: 410; Msg: 'Gone'),
    (Code: 411; Msg: 'Length Required'),
    (Code: 412; Msg: 'Precondition Failed'),
    (Code: 413; Msg: 'Request Entity Too Large'),
    (Code: 414; Msg: 'Request-URI Too Large'),
    (Code: 415; Msg: 'Unsupported Media Type'),
    (Code: 416; Msg: 'Requested Range Not Satisfiable'),
    (Code: 417; Msg: 'Expectation Failed'),
    (Code: 500; Msg: 'Internal Server Error'),
    (Code: 501; Msg: 'Not Implemented'),
    (Code: 502; Msg: 'Bad Gateway'),
    (Code: 503; Msg: 'Service Unavailable'),
    (Code: 504; Msg: 'Gateway Time-out'),
    (Code: 505; Msg: 'HTTP Version Not Supported'));

type
  TKXHTTPServerCore = class;
  THTTPClientThread = class(TKXClientThread)
  private
    FLastCommand: integer;
    FServer: TKXHTTPServerCore;
    {$IFNDEF NO_AUTHENTICATION_SUPPORT}
    FAuthUserName: string;
    FAuthPassword: string;
    FAuthDigestRealm: string; { Received from client }
    FAuthDigestUri: string;
    FAuthDigestNonce: string;
    FAuthDigestQop: string;
    FAuthDigestNc: string;
    FAuthDigestCnonce: string;
    FAuthDigestResponse: string;
    FAuthDigestOpaque: string;
    FAuthDigestServerNonce: string;
    FAuthDigestServerOpaque: string;
    FAuthDigestAlg: string;
    FAuthDigestStale: Boolean;
    FAuthType: TAuthenticationType;
    FAuthenticated: Boolean;
    FAuthDigestBody: string;

    FAuthRealm: string;
    procedure AuthCheckAuthenticated; virtual;
    function AuthDigestCheckPassword(const Password: string): Boolean;
    function AuthDigestGetParams: Boolean;
    function AuthBasicGetParams: Boolean;
    function AuthBasicCheckPassword(const Password: string): Boolean;
    {$ENDIF}
  protected
    fHeaderInfo: THeaderInfo;
    fDocStream: TStream;

    procedure ProcessData; override;
    {$IFNDEF NO_AUTHENTICATION_SUPPORT}
    procedure TriggerAuthGetPassword(var PasswdBuf: string); virtual;
    procedure TriggerAuthResult(Authenticated: Boolean);
    procedure TriggerAuthGetType;
    {$ENDIF}
    function HeaderText(StatusCode: Integer): string; //2.0.12

  public
    constructor Create(CreateSuspended: Boolean); override;
    destructor Destroy; override;
    procedure Answer404; virtual;
    procedure Answer403; virtual;
    procedure Answer401; virtual;
    procedure Answer501; virtual;
    procedure AnswerErrorParam(AStr: string); virtual;
    procedure AnswerStream(const Status: string; const ContType: string;
      const Header: string); virtual;
    procedure AnswerBuffer(const Status: string; const ContType: string;
      const Header: string; ABuffer: Pointer; ABufferCount: Integer); virtual;
    procedure AnswerString(const Status: string; const ContType: string;
      const Header: string; const Body: string); virtual;

    property DocStream: TStream read fDocStream write fDocStream;
    property LastCommand: integer read FLastCommand write FLastCommand;
    {$IFNDEF NO_AUTHENTICATION_SUPPORT}
    property AuthType: TAuthenticationType read FAuthType write FAuthType;
    property AuthUserName: string read FAuthUserName write FAuthUserName;
    property AuthPassword: string read FAuthPassword write FAuthPassword;
    property AuthDigetUri: string read FAuthDigestUri write FAuthDigestUri;
    property AuthRealm: string read FAuthRealm write FAuthRealm;
    {$ENDIF}

    property Server: TKXHTTPServerCore read FServer;
  end;

  HTTPTBasicEvent = procedure(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo; var
    EnableKeepAlive: Boolean) of object;
  HTTPTOtherEvent = procedure(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo; var
    Handled: Boolean) of object;

  TKXHTTPServerCore = class(TKXServerCore)
  private
    fOnCommandGET: HTTPTBasicEvent; // GET <file> HTTP/1.0
    fOnCommandPOST: HTTPTBasicEvent; // POST <file> HTTP/1.0
    fOnCommandHEAD: HTTPTBasicEvent; // HEAD <file> HTTP/1.0

    fOnCommandOther: HTTPTOtherEvent;

    fSupportKeepAlive: Boolean;
  protected
    {$IFNDEF NO_AUTHENTICATION_SUPPORT}
    FAuthType: TAuthenticationType;
    FAuthRealm: string;
    FAuthDigestMethod: TAuthDigestMethod;
    FOnAuthGetPassword: TAuthGetPasswordEvent;
    FOnAuthResult: TAuthResultEvent;
    FOnAuthGetType: TAuthGetTypeEvent;
    {$ENDIF}

    procedure SetOnCommandGET(value: HTTPTBasicEvent);
    procedure SetOnCommandPOST(value: HTTPTBasicEvent);
    procedure SetOnCommandHEAD(value: HTTPTBasicEvent);

    procedure DoCommandGET(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo; var
      EnableKeepAlive: Boolean); virtual;
    procedure DoCommandPOST(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo; var
      EnableKeepAlive: Boolean); virtual;
    procedure DoCommandHEAD(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo; var
      EnableKeepAlive: Boolean); virtual;

    //procedure ProcessSession(ClientThread: THTTPClientThread);
    procedure DoNewConnection(ClientThread: TKXClientThread); override;
  public
    constructor Create(AOwner: TComponent);
    {$IFNDEF OBJECTS_ONLY} override;
    {$ENDIF}
    destructor Destroy; override;
    procedure Start; override;
    procedure Stop; override;
  published
    property ServerPort;

    {$IFNDEF NO_AUTHENTICATION_SUPPORT}
    property OnAuthGetPassword: TAuthGetPasswordEvent read FOnAuthGetPassword write
      FOnAuthGetPassword;
    property OnAuthResult: TAuthResultEvent read FOnAuthResult write FOnAuthResult;
    property OnAuthGetType: TAuthGetTypeEvent read FOnAuthGetType write FOnAuthGetType;

    property AuthType: TAuthenticationType read FAuthType write FAuthType;
    property AuthRealm: string read FAuthRealm write FAuthRealm;
    property AuthDigestMethod: TAuthDigestMethod read FAuthDigestMethod write FAuthDigestMethod
      default daAuth;
    {$ENDIF}

    property SupportKeepAlive: Boolean read fSupportKeepAlive write fSupportKeepAlive;
    property OnCommandGET: HTTPTBasicEvent read fOnCommandGET write SetOnCommandGET;
    property OnCommandPOST: HTTPTBasicEvent read fOnCommandPOST write SetOnCommandPOST;
    property OnCommandHEAD: HTTPTBasicEvent read fOnCommandHEAD write SetOnCommandHEAD;
    property OnCommandOther: HTTPTOtherEvent read fOnCommandOther write fOnCommandOther;
  end;
  TDicomDatasetsFindEvent = procedure(studyUID, seriesUID, objectUID: string; var ADataset:
    TDicomDataset) of object;
  TDicomDatasetsFindExEvent = procedure(studyUID, seriesUID, objectUID: string; var AStream:
    TStream) of object;

  TWADOServerCore = class(TKXHTTPServerCore)
  private
    FOnFindImage: TDicomDatasetsFindEvent;
    FOnFindImageStream: TDicomDatasetsFindExEvent;

    function DoFindImageStream(studyUID, seriesUID, objectUID: string): TStream;
    procedure SetOnFindImageStream(const Value: TDicomDatasetsFindExEvent);
  protected
    procedure DoCommandGET(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo; var
      EnableKeepAlive: Boolean); override;
    procedure DoCommandPOST(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo; var
      EnableKeepAlive: Boolean); override;
    procedure SaveToBitmap(ADataset: TDicomDataset; rows, columns, windowCenter, windowWidth,
      frameNumber, imageQuality: Integer; region: string; ABitmap: TBitmap;
      vW:Integer=0; vH:Integer=0  );

    function SaveToAVI(ADataset: TDicomDataset; rows, columns, windowCenter, windowWidth,
      frameNumber, imageQuality: Integer; region: string): TMemoryStream;
    function SaveToJpeg(ADataset: TDicomDataset; rows, columns, windowCenter, windowWidth,
      frameNumber, imageQuality: Integer; region: string;
      vW:Integer=0; vH:Integer=0  ): TMemoryStream;
    function SaveToJpeg2000(ADataset: TDicomDataset; rows, columns, windowCenter, windowWidth,
      frameNumber, imageQuality: Integer; region: string): TMemoryStream;
    function SaveToGIF(ADataset: TDicomDataset; rows, columns, windowCenter, windowWidth,
      frameNumber, imageQuality: Integer; region: string): TMemoryStream;
    function SaveToPNG(ADataset: TDicomDataset; rows, columns, windowCenter, windowWidth,
      frameNumber, imageQuality: Integer; region: string): TMemoryStream;
    function SaveToPDF(ADataset: TDicomDataset; rows, columns, windowCenter, windowWidth,
      frameNumber, imageQuality: Integer; region: string): TMemoryStream;
    function GetContentType(AContentType: string): Integer;
  public
    // QUANT 06/02/2013 перенесено из секции protected
    function DoFindImage(studyUID, seriesUID, objectUID: string): TDicomDataset;
    function SaveToWADOStream(AParam, ResultHtmlDoc: TStrings;
              var AStreamMIMEType: string;
              p_icon:Boolean=False;
              p_frame:string='';
              pwidth:string='';
              pheight:string='';
              pavi:Boolean=False ):
      TStream;

  published
    property OnFindImageStream: TDicomDatasetsFindExEvent read FOnFindImageStream write
      SetOnFindImageStream;
    property OnFindImage: TDicomDatasetsFindEvent read FOnFindImage write FOnFindImage;
  end;

function MakeHeader(AContentLength: Integer): string;
function strBreakApart(s: string; delimeter: string; parts: TStrings): string;

var v_nnn : Longint;
implementation

uses
  {$IFDEF LINUX}
  Libc,
  {$ENDIF}
  SysUtils, {StrPCopy}
  DicomMD5, DicomMimeUtils, CnsJpgGr, CnsDiGrph, CnsPngGr, JPEG, ExtCtrls, DICOM_charset;

constructor TKXHTTPHeaderTools.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TKXHTTPHeaderTools.Destroy;
begin
  inherited Destroy;
end;

procedure TKXHTTPHeaderTools.Init(HTTPHeader: THeaderInfo);
begin
  fSessionHeader := HTTPHeader;
  fSessionHeader.ContentLength := 0;
end;

function TKXHTTPHeaderTools.HeaderGetString(ServerVariable: string): string;
var
  Ch: Char;
  Ws: string;
  URI2: string;

begin
  Result := '';
  Ws := Uppercase(ServerVariable);
  if Ws = '' then
    Exit; //2.0.11
  if (Copy(Ws, 1, 5) = 'HTTP_') then
  begin
    Delete(Ws, 1, 5); // 3.0
  end;
  Ch := Ws[1];
  with fSessionHeader do
    case Ch of
      'A':
        if (Ws = 'ALLOW') then
          Result := Allow
        else
          if (Ws = 'ALL_RAW') then
          Result := All_Raw // .9k & 2.3b
        else
          if (Ws = 'ALL_HTTP') then
          Result := All_HTTP // 3.0
        else
          if (Ws = 'AUTHTYPE') or (Ws = 'AUTH_TYPE') then
          Result := AuthType
        else
          //          if (Ws = 'AUTHNAME') or (Ws = 'AUTH_NAME') or (Ws = 'AUTH_USER') then
          //          Result := AuthName
          //        else
          //          if (Ws = 'AUTHPASS') or (Ws = 'AUTH_PASS') or (Ws = 'AUTH_PASSWORD') then
          //          Result := AuthPass
          //        else
          if (Ws = 'ACCEPT') then
          Result := Accept
        else
          if (Ws = 'ACCEPT_CHARSET') or (Ws = 'ACCEPTCHARSET') then
          Result := AcceptCharset
        else
          if (Ws = 'ACCEPT_ENCODING') or (Ws = 'ACCEPTENCODING') then
          Result := AcceptEncoding
        else
          if (Ws = 'ACCEPT_LANGUAGE') or (Ws = 'ACCEPTLANGUAGE') then
          Result := AcceptLanguage
        else
          Result := FindUnknownHeader(ServerVariable);
      'C':
        if (Ws = 'CONTENT_LENGTH') or (Ws = 'CONTENTLENGTH') then
          Result := IntToStr(ContentLength)
        else
          if (Ws = 'CACHECONTROL') or (Ws = 'CACHE_CONTROL') then
          Result := CacheControl
        else
          if (Ws = 'CACHE_INFO') then
          Result := CacheInfo
        else
          if (Ws = 'CONNECTION') then
          Result := Connection
        else
          if (Ws = 'CONTENT_TYPE') or (Ws = 'CONTENTTYPE') then
          Result := ContentType
        else
          if (Ws = 'CLIENTNAME') or (Ws = 'CLIENT_NAME') then
          Result := ClientName
        else
          if (Ws = 'CLIENTADDR') or (Ws = 'CLIENT_ADDR') then
          Result := ClientAddr
        else
          if (Ws = 'COOKIE') then
          Result := Cookie
        else
          Result := FindUnknownHeader(ServerVariable);
      'D':
        if (Ws = 'DATE') then
          Result := Date
        else
          Result := FindUnknownHeader(ServerVariable);
      'F':
        if (Ws = 'FROM') then
          Result := From
        else
          if (Ws = 'FORWARDED') then
          Result := Forwarded
        else
          if (Ws = 'FORWARDED_FOR') then
          Result := ForwardedFor
        else
          Result := FindUnknownHeader(ServerVariable);
      'H':
        if (Ws = 'HOST') then
        begin
          Result := Host;
          if CharPos('@', Result) > 0 then
            Delete(Result, 1, CharPos(':', Result));
          if CharPos(':', Result) > 0 then
            Delete(Result, CharPos(':', Result), Length(Result));
        end
        else
          if (Ws = 'HTTPS') then
          Result := 'off'
        else
          Result := FindUnknownHeader(ServerVariable);
      'I':
        if (Ws = 'IFMODSINCE') or (Ws = 'IF_MODSINCE') or (Ws = 'IF_MOD_SINCE') then
          Result := IfModSince
        else
          if (Ws = 'IFMATCH') or (Ws = 'IF_MATCH') then
          Result := IfMatch
        else
          if (Ws = 'IFNONEMATCH') or (Ws = 'IF_NONEMATCH') or (Ws = 'IF_NONE_MATCH') then
          Result := IfNoneMatch
        else
          if (Ws = 'IFRANGE') or (Ws = 'IF_RANGE') then
          Result := IfRange
        else
          if (Ws = 'IFUNMODSINCE') or (Ws = 'IF_UNMODSINCE') or (Ws = 'IF_UNMOD_SINCE') then
          Result := IfUnModSince
        else
          Result := FindUnknownHeader(ServerVariable);
      'K':
        if (Ws = 'KEEPALIVE') or (Ws = 'KEEP_ALIVE') then
          Result := KeepAlive
        else
          Result := FindUnknownHeader(ServerVariable);
      'M':
        if (Ws = 'METHOD') then
          Result := Method
        else
          if (Ws = 'MAXFORWARDS') or (Ws = 'MAX_FORWARDS') then
          Result := MaxForwards
        else
          Result := FindUnknownHeader(ServerVariable);
      'P':
        if (Ws = 'PROTOCOL') then
          Result := Protocol
        else
          if (Ws = 'PRAGMA') then
          Result := Pragma
        else
          if (Ws = 'PROXYAUTHORIZATION') or (Ws = 'PROXY_AUTHORIZATION') then
          Result := ProxyAuthorization
        else
          if (Ws = 'PUBLIC') then
          Result := PublicCache
        else
          if (Ws = 'PROXY_CONNECTION') then
          Result := ProxyConnection
        else
          Result := FindUnknownHeader(ServerVariable);
      'Q':
        if (Ws = 'QUERYSTRING') or (Ws = 'QUERY_STRING') then
          Result := QueryString
        else
          Result := FindUnknownHeader(ServerVariable);
      'R':
        if (Ws = 'RANGE') then
          Result := Range
        else
          if (Ws = 'REFERER') or (Ws = 'REFERRER') or (Ws = 'REFFERER') then
          Result := Referer
        else
          if (Ws = 'REQUEST_METHOD') then
          Result := Method
        else
          if (Ws = 'REMOTE_NAME') or (Ws = 'REMOTE_HOST') then
          Result := ClientName
        else
          if (Ws = 'REMOTE_ADDR') then
          Result := ClientAddr
        else
          if (Ws = 'REQUEST_URI') then
        begin
          URI2 := ToUnixSlashes(URI);
          if CharPos('/', URI2) = 0 then
            Result := '/' + URI2
          else
          begin
            if Copy(URI2, 1, 1) <> '/' then
              URI2 := '/' + URI2;
            Result := URI2; // 4/2/2002 Copy(URI2,1,PosLastChar('/',URI2));
          end;
        end
        else
          Result := FindUnknownHeader(ServerVariable);
      'S':
        if (Ws = 'SERVER_PROTOCOL') then
          Result := Protocol
        else
          if (Ws = 'SERVER_NAME') then
        begin
          Result := Host;
          if CharPos('@', Result) > 0 then
            Delete(Result, 1, CharPos(':', Result));
          if CharPos(':', Result) > 0 then
            Delete(Result, CharPos(':', Result), Length(Result));
        end
        else
          if (Ws = 'SERVER_PORT_SECURE') then
          Result := '0'
        else
          Result := FindUnknownHeader(ServerVariable);
      'T':
        if (Ws = 'TRANSFERENCODING') or (Ws = 'TRANSFER_ENCODING') then
          Result := TransferEncoding
        else
          Result := FindUnknownHeader(ServerVariable);
      'U':
        if (Ws = 'URI') then
        begin
          URI2 := ToUnixSlashes(URI);
          if CharPos('/', URI2) = 0 then
            Result := '/' + URI2
          else
          begin
            if Copy(URI2, 1, 1) <> '/' then
              URI2 := '/' + URI2;
            Result := URI2; // 4/2/2002 Copy(URI2,1,PosLastChar('/',URI2));
          end;
        end
        else
          if (Ws = 'URL') then
        begin
          URI2 := ToUnixSlashes(URI);
          if Copy(URI2, 1, 1) = '/' then
            Result := URI2
          else
            Result := '/' + URI2;
        end
        else
          if (Ws = 'UPGRADE') then
          Result := Upgrade
        else
          if (Ws = 'USERAGENT') or (Ws = 'USER_AGENT') then
          Result := UserAgent
        else
          Result := FindUnknownHeader(ServerVariable);
      'V':
        if (Ws = 'VIA') then
          Result := Via
        else
          Result := FindUnknownHeader(ServerVariable);
      'W':
        if (Ws = 'WEFERER') then
          Result := Weferer
        else
          if (Ws = 'WSER_AGENT') then
          Result := WserAgent
        else
          Result := FindUnknownHeader(ServerVariable);
    else
      Result := FindUnknownHeader(ServerVariable);
    end;
end;

function TKXHTTPHeaderTools.HeaderGetInteger(ServerVariable: string): Integer;
var
  Ch: Char;
  Ws: string;

begin
  Result := 0;
  Ws := Uppercase(ServerVariable);
  if Ws = '' then
    Exit; // 2.0.11
  Ch := Ws[1];
  with fSessionHeader do
    case Ch of
      'C':
        if (Ws = 'CONTENT_LENGTH') or (Ws = 'CONTENTLENGTH') then
          Result := ContentLength;
    end;
end;

function TKXHTTPHeaderTools.HeaderDataExists(ServerVariable: string): Boolean;
begin
  Result := HeaderGetString(ServerVariable) <> '';
end;

// 2.0.12

function TKXHTTPHeaderTools.QueryGetString(ServerVariable: string): string;
var
  Ws: string;
  Tmp: string;
  Value: string;

begin
  Result := '';
  Tmp := fSessionHeader.QueryString + '&';
  while (CharPos('&', Tmp) > 0) do
  begin
    Ws := Copy(Tmp, 1, CharPos('&', Tmp) - 1);
    Delete(Tmp, 1, CharPos('&', Tmp));
    Value := Copy(Ws, 1, CharPos('=', Ws) - 1);
    Delete(Ws, 1, CharPos('=', Ws));
    if Uppercase(Value) = Uppercase(ServerVariable) then
    begin
      if Result <> '' then
        Result := Result + #13#10 + Ws
      else
        Result := Ws;
    end;
  end;
end;

function TKXHTTPHeaderTools.QueryGetInteger(ServerVariable: string): Integer;
var
  Ws: string;

begin
  Ws := QueryGetString(ServerVariable);
  if (Ws <> '') and (IsNumericString(Ws)) then
    Result := StrToInt(Ws)
  else
    Result := -1;
end;

function TKXHTTPHeaderTools.QueryDataExists(ServerVariable: string): Boolean;
begin
  Result := QueryGetString(ServerVariable) <> '';
end;

function TKXHTTPHeaderTools.AddHeader(ServerVariable, VariableValue: string): Boolean;
var
  Ch: Char;
  Ws: string;

  procedure AddToUnknown; // 7-27
  begin
    if fSessionHeader.Unknown = '' then
      fSessionHeader.Unknown := ServerVariable + ': ' + VariableValue
    else
      fSessionHeader.Unknown := fSessionHeader.Unknown + #13#10 + ServerVariable + ': ' +
        VariableValue;
  end;

begin
  Result := False;
  Ws := Uppercase(ServerVariable);
  if Ws = '' then
    Exit;
  // 7-27
  Ws := StringReplace(Ws, '-', '_', [rfReplaceAll]);
  Ch := Ws[1];
  with fSessionHeader do
    case Ch of
      'A':
        if (Ws = 'ALLOW') then
          Allow := VariableValue
        else
          if (Ws = 'AUTHTYPE') or (Ws = 'AUTH_TYPE') then
          AuthType := VariableValue
            //        else
//          if (Ws = 'AUTHNAME') or (Ws = 'AUTH_NAME') then
//          AuthName := VariableValue
//        else
//          if (Ws = 'AUTHPASS') or (Ws = 'AUTH_PASS') then
//          AuthPass := VariableValue
        else
          if (Ws = 'ACCEPT') then
          Accept := VariableValue
        else
          if (Ws = 'ACCEPT_CHARSET') or (Ws = 'ACCEPTCHARSET') then
          AcceptCharset := VariableValue
        else
          if (Ws = 'ACCEPT_ENCODING') or (Ws = 'ACCEPTENCODING') then
          AcceptEncoding := VariableValue
        else
          if (Ws = 'ACCEPT_LANGUAGE') or (Ws = 'ACCEPTLANGUAGE') then
          AcceptLanguage := VariableValue
        else
          AddToUnknown;
      'C':
        if (Ws = 'CONTENT_LENGTH') or (Ws = 'CONTENTLENGTH') then
          ContentLength := StrToInt(VariableValue)
        else
          if (Ws = 'CACHECONTROL') or (Ws = 'CACHE_CONTROL') then
          CacheControl := VariableValue
        else
          if (Ws = 'CACHE_INFO') then
          CacheInfo := VariableValue
        else
          if (Ws = 'CONNECTION') then
          Connection := VariableValue
        else
          if (Ws = 'CONTENT_TYPE') or (Ws = 'CONTENTTYPE') then
          ContentType := VariableValue
        else
          if (Ws = 'CLIENTNAME') or (Ws = 'CLIENT_NAME') then
          ClientName := VariableValue
        else
          if (Ws = 'CLIENTADDR') or (Ws = 'CLIENT_ADDR') then
          ClientAddr := VariableValue
        else
          if (Ws = 'COOKIE') then
          Cookie := VariableValue
        else
          AddToUnknown;
      'D':
        if (Ws = 'DATE') then
          Date := VariableValue
        else
          AddToUnknown;
      'F':
        if (Ws = 'FROM') then
          From := VariableValue
        else
          if (Ws = 'FORWARDED') then
          Forwarded := VariableValue
        else
          if (Ws = 'FORWARDED_FOR') then
          ForwardedFor := VariableValue
        else
          AddToUnknown;
      'H':
        if (Ws = 'HOST') then
          Host := VariableValue
        else
          AddToUnknown;
      'I':
        if (Ws = 'IFMODSINCE') or (Ws = 'IF_MODSINCE') or (Ws = 'IF_MOD_SINCE') then
          IfModSince := VariableValue
        else
          if (Ws = 'IFMATCH') or (Ws = 'IF_MATCH') then
          IfMatch := VariableValue
        else
          if (Ws = 'IFNONEMATCH') or (Ws = 'IF_NONEMATCH') or (Ws = 'IF_NONE_MATCH') then
          IfNoneMatch := VariableValue
        else
          if (Ws = 'IFRANGE') or (Ws = 'IF_RANGE') then
          IfRange := VariableValue
        else
          if (Ws = 'IFUNMODSINCE') or (Ws = 'IF_UNMODSINCE') or (Ws = 'IF_UNMOD_SINCE') then
          IfUnModSince := VariableValue
        else
          AddToUnknown;
      'K':
        if (Ws = 'KEEPALIVE') or (Ws = 'KEEP_ALIVE') then
          KeepAlive := VariableValue
        else
          AddToUnknown;
      'M':
        if (Ws = 'METHOD') then
          Method := VariableValue
        else
          if (Ws = 'MAXFORWARDS') or (Ws = 'MAX_FORWARDS') then
          MaxForwards := VariableValue
        else
          AddToUnknown;
      'P':
        if (Ws = 'PROTOCOL') then
          Protocol := VariableValue
        else
          if (Ws = 'PRAGMA') then
          Pragma := VariableValue
        else
          if (Ws = 'PROXYAUTHORIZATION') or (Ws = 'PROXY_AUTHORIZATION') then
          ProxyAuthorization := VariableValue
        else
          if (Ws = 'PUBLIC') then
          PublicCache := VariableValue
        else
          if (Ws = 'PROXY_CONNECTION') then
          ProxyConnection := VariableValue
        else
          AddToUnknown;
      'Q':
        if (Ws = 'QUERYSTRING') or (Ws = 'QUERY_STRING') then
          QueryString := VariableValue
        else
          AddToUnknown;
      'R':
        if (Ws = 'RANGE') then
          Range := VariableValue
        else
          if (Ws = 'REFERER') or (Ws = 'REFERRER') or (Ws = 'REFFERER') then
          Referer := VariableValue
        else
          AddToUnknown;
      'U':
        if (Ws = 'URI') then
          URI := VariableValue
        else
          if (Ws = 'UPGRADE') then
          Upgrade := VariableValue
        else
          if (Ws = 'USERAGENT') or (Ws = 'USER_AGENT') then
          UserAgent := VariableValue
        else
          AddToUnknown;
      'T':
        if (Ws = 'TRANSFERENCODING') or (Ws = 'TRANSFER_ENCODING') then
          TransferEncoding := VariableValue
        else
          AddToUnknown;
      'V':
        if (Ws = 'VIA') then
          Via := VariableValue // 7-27
        else
          AddToUnknown;
      'W':
        if (Ws = 'WEFERER') then
          Weferer := VariableValue // 7-27
        else
          if (Ws = 'WSER_AGENT') then
          WserAgent := VariableValue // 7-27
        else
          AddToUnknown;
    else
      AddToUnknown;
    end; //case
  Result := True;
end;

function TKXHTTPHeaderTools.SetHeader(ServerVariable, VariableValue: string): Boolean;
begin
  Result := AddHeader(ServerVariable, VariableValue);
end;

function TKXHTTPHeaderTools.FindUnknownHeader(ServerVariable: string): string;
var
  line, buf: string;
  i: Integer;

begin
  line := fSessionHeader.Unknown;
  i := QuickPos(ServerVariable, line);
  if i <> 0 then
  begin
    buf := Copy(line, i, Length(line));
    i := QuickPos(#13#10, buf);
    buf := Copy(buf, 0, i - 1);
    i := CharPos(#32, buf);
    Result := Copy(buf, i, Length(buf));
  end; //IF
end;

procedure TKXHTTPHeaderTools.ReplaceUnknownHeader(ServerVariable, VariableValue: string);
var
  line: PString;
  str, buf: string;
  i, k, m: Integer;
begin
  if not UnknownHeaderExists(ServerVariable) then
    Exit;
  line := @fSessionHeader.Unknown;
  k := QuickPos(ServerVariable, line^);
  if k <> 0 then
  begin
    str := Copy(line^, k, Length(line^));
    m := QuickPos(#13#10, str);
    buf := Copy(str, 0, k - 1);
    i := CharPos(#32, buf);
    k := k + i;
    Delete(line^, k, m);
    Insert(VariableValue, line^, k);
  end;
end;

function TKXHTTPHeaderTools.UnknownHeaderExists(ServerVariable: string): Boolean;
begin
  if ServerVariable = '' then
    Result := False
  else
    if fSessionHeader.Unknown = '' then
    Result := False
  else
    if QuickPos(ServerVariable, fSessionHeader.Unknown) = 0 then
    Result := False
  else
    Result := True;
end;

function TKXHTTPHeaderTools.ToStrings: TStrings;
var
  res: TStrings;
  endch: string;
  split: string;
  //    CleanLoop:Integer;

begin
  split := ': ';
  endch := ''; // 7-27 #13#10;
  res := TStringList.Create;
  with fSessionHeader do
  begin
    if Allow <> '' then
      res.Add('ALLOW' + split + Allow + endch);
    if AuthType <> '' then
      res.Add('AUTHTYPE' + split + AuthType + endch);
    //    if AuthName <> '' then
     //     res.Add('AUTHNAME' + split + AuthName + endch);
    //    if AuthPass <> '' then
    //      res.Add('AUTHPASS' + split + AuthPass + endch);
    if Accept <> '' then
      res.Add('ACCEPT' + split + Accept + endch);
    if AcceptCharset <> '' then
      res.Add('ACCEPT-CHARSET' + split + AcceptCharset + endch);
    if AcceptEncoding <> '' then
      res.Add('ACCEPT-ENCODING' + split + AcceptEncoding + endch);
    if AcceptLanguage <> '' then
      res.Add('ACCEPT-LANGUAGE' + split + AcceptLanguage + endch);
    if ContentLength <> 0 then
      res.Add('CONTENT-LENGTH' + split + IntToStr(ContentLength) + endch);
    if CacheControl <> '' then // 7-27
      res.Add('CACHE-CONTROL' + split + CacheControl + endch);
    if CacheInfo <> '' then // 7-27
      res.Add('CACHE-INFO' + split + CacheInfo + endch);
    if Connection <> '' then
      res.Add('CONNECTION' + split + Connection + endch);
    if ContentType <> '' then
      res.Add('CONTENT-TYPE' + split + ContentType + endch);
    if ClientName <> '' then
      res.Add('CLIENTNAME' + split + ClientName + endch);
    if ClientAddr <> '' then
      res.Add('CLIENTADDR' + split + ClientAddr + endch);
    if Cookie <> '' then
      res.Add('COOKIE' + split + Cookie + endch);
    if Date <> '' then
      res.Add('DATE' + split + Date + endch);
    if From <> '' then
      res.Add('FROM' + split + From + endch);
    if Forwarded <> '' then
      res.Add('FORWARDED' + split + Forwarded + endch);
    if ForwardedFor <> '' then
      res.Add('FORWARDED-FOR' + split + ForwardedFor + endch);
    if Host <> '' then
      res.Add('HOST' + split + Host + endch);
    if IfModSince <> '' then
      res.Add('IFMODSINCE' + split + IfModSince + endch);
    if IfMatch <> '' then
      res.Add('IFMATCH' + split + IfMatch + endch);
    if IfNoneMatch <> '' then
      res.Add('IFNONEMATCH' + split + IfNoneMatch + endch);
    if IfRange <> '' then
      res.Add('IFRANGE' + split + IfRange + endch);
    if IfUnModSince <> '' then
      res.Add('IFUNMODSINCE' + split + IfUnModSince + endch);
    if KeepAlive <> '' then
      res.Add('KEEPALIVE' + split + KeepAlive + endch);
    if Method <> '' then
      res.Add('METHOD' + split + Method + endch);
    if MaxForwards <> '' then
      res.Add('MAXFORWARDS' + split + MaxForwards + endch);
    if Protocol <> '' then
      res.Add('PROTOCOL' + split + Protocol + endch);
    if ProxyConnection <> '' then
      res.Add('PROXY-CONNECTION' + split + ProxyConnection + endch);
    if Pragma <> '' then
      res.Add('PRAGMA' + split + Pragma + endch);
    if ProxyAuthorization <> '' then
      res.Add('PROXYAUTHORIZATION' + split + ProxyAuthorization + endch);
    if PublicCache <> '' then
      res.Add('PUBLIC' + split + PublicCache + endch);
    if QueryString <> '' then
      res.Add('QUERYSTRING' + split + QueryString + endch);
    if Range <> '' then
      res.Add('RANGE' + split + Range + endch);
    if Referer <> '' then
      res.Add('REFERER' + split + Referer + endch);
    if URI <> '' then
      res.Add('URI' + split + URI + endch);
    if Upgrade <> '' then
      res.Add('UPGRADE' + split + Upgrade + endch);
    if UserAgent <> '' then
      res.Add('USERAGENT' + split + UserAgent + endch);
    if TransferEncoding <> '' then
      res.Add('TRANSFERENCODING' + split + TransferEncoding + endch);
    if Via <> '' then
      res.Add('VIA' + split + Via + endch);
    if Weferer <> '' then
      res.Add('WEFERER' + split + Weferer + endch);
    if WserAgent <> '' then
      res.Add('WSER-AGENT' + split + WserAgent + endch);
    if Unknown <> '' then
      res.Add(Unknown + endch);
  end; //With
  {   CleanLoop:=res.Count;
     While CleanLoop>0 do Begin
        if res[CleanLoop-1]='' then res.delete(CleanLoop-1);
        Dec(CleanLoop);
     End;}
  Result := res;
end;

type
  PHTTPBasicEvent = ^THTTPBasicEvent;
  THTTPBasicEvent = record
    Tag: Integer;
    Command: string;
    EventProcedure: HTTPTBasicEvent;
  end;

  ///////////////////////////////////////////////////////////////////////////////
  //CREATE:
  //       Define the Default Port number to Listen On.
  ///////////////////////////////////////////////////////////////////////////////

constructor TKXHTTPServerCore.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  {$IFNDEF NO_AUTHENTICATION_SUPPORT}
  FAuthRealm := 'www.dicomvcl.com';
  FAuthType := atNone;
  {$ENDIF}
  ServerPort := 80;

  SocketOutputBufferSize := bsfHUGE;
  //UseNagle := true;
  ThreadCacheSize := DefaultThreadCacheSize;
  //ListenerThreadPriority := tpHigher;
  //SpawnedThreadPriority := tpHigher;
  UseThreadPool := false;

  Timeout := 30000;
  TKXXferTimeout := 500; // change timeout for socket leyer

  fcClientThreadClass := THTTPClientThread;
end;

///////////////////////////////////////////////////////////////////////////////
//DESTROY:
//        Destory this object.
///////////////////////////////////////////////////////////////////////////////

destructor TKXHTTPServerCore.Destroy;
begin

  inherited Destroy;
end;

procedure TKXHTTPServerCore.SetOnCommandGET(value: HTTPTBasicEvent);
begin
  fOnCommandGET := Value;
end;

procedure TKXHTTPServerCore.SetOnCommandPOST(value: HTTPTBasicEvent);
begin
  fOnCommandPOST := Value;
end;

procedure TKXHTTPServerCore.SetOnCommandHEAD(value: HTTPTBasicEvent);
begin
  fOnCommandHEAD := Value;
end;

(*
procedure TKXHTTPServerCore.ProcessSession(ClientThread: THTTPClientThread);
var
  S, WS: string;
  HeaderInfo: THeaderInfo;
  //  OutData: Pointer;
  WantKeepAlive: Boolean;
  //  ManualTimeout: Comp;
  Stm1: TDicomKXSocketStream;
  c1, c2: Byte;
  procedure NotHandled;
  begin
    ClientThread.Socket.Write(
      'HTTP/1.0 ' + HeaderText(400) + #13#10 + #13#10 +
      '<html><head><title>Error</title>' +
      '<body><h1>Error</h1><hr><h3>Unsupported Method <B>"' +
      HeaderInfo.Method + '"</B></h3></body></head></html>');
  end;

  procedure BuildHeader(ClientHeader: string);
  var
    line, token1, token2: string;
    Error: Integer;
    Ch: Char;
    I: Integer;

    procedure AddToUnknown;
    begin
      if HeaderInfo.Unknown = '' then
        HeaderInfo.Unknown := token1 + ': ' + line
      else
        HeaderInfo.Unknown := HeaderInfo.Unknown + #13#10 + token1 + ': ' + line;
    end;

  begin
    line := ClientHeader;
    with HeaderInfo do
    begin
      if RAW = '' then
      begin
        RAW := Line;
        Method := Uppercase(FetchByChar(line, #32, False));
        URI := EscapeDecode(FetchByChar(line, #32, False));
        if CharPos('?', URI) > 0 then
        begin
          QueryString := Copy(URI, CharPos('?', URI) + 1, Length(URI));
          Delete(URI, CharPos('?', URI), Length(URI));
        end;
        Protocol := FetchByChar(line, #32, False);
      end
      else
      begin
        ALL_RAW := ALL_RAW + Line + #13#10;
        token1 := Uppercase(FetchByChar(line, #32, False));
        // 4RC2
        I := Length(Token1);
        Setlength(Token2, I);
        while I > 0 do
        begin
          case Token1[i] of
            '-': Token2[i] := '_';
          else
            Token2[i] := Token1[i];
          end;
          Dec(I);
        end;
        //            token2:=StringReplace (token1,'-','_', [rfReplaceAll]) ;
        ALL_HTTP := ALL_HTTP + 'HTTP_' + Token2 + Line + #13#10;
        Ch := Token1[1];
        case Ch of
          'A':
            if token1 = 'ACCEPT:' then
              Accept := Accept + Line
            else
              if token1 = 'ACCEPT-CHARSET:' then
              AcceptCharset := Line
            else
              if token1 = 'ACCEPT-ENCODING:' then
              AcceptEncoding := Line
            else
              if token1 = 'ACCEPT-LANGUAGE:' then
              AcceptLanguage := Line
            else
              if token1 = 'ALLOW:' then
              Allow := Line
            else
              if token1 = 'AUTHORIZATION:' then
            begin
              AuthType := Line;
              //AuthType := FetchByChar(line, #32, False); // Usually is "Basic"
              //token2 := FetchByChar(line, #32, False);
              //token2 := Base64ToString(token2); // Decode the "Basic" encoded string
              //AuthName := FetchByChar(token2, ':', False);
              //AuthPass := FetchByChar(token2, ';', False); // should actually be leftovers
            end
            else
              AddToUnknown;
          'C':
            if token1 = 'CACHE-CONTROL:' then
              CacheControl := Line
            else
              if token1 = 'CONNECTION:' then
              Connection := Line
            else
              if token1 = 'CACHE-INFO:' then
              CacheInfo := Line
            else
              if token1 = 'CONTENT-LENGTH:' then
            begin
              Val(FetchByChar(line, #32, False), ContentLength, Error);
            end
            else
              if token1 = 'CONTENT-TYPE:' then
              ContentType := Line
            else
              if token1 = 'COOKIE:' then
              Cookie := Line
            else
              AddToUnknown;
          'D':
            if token1 = 'DATE:' then
              Date := Line
            else
              AddToUnknown;
          'F':
            if token1 = 'FROM:' then
              From := Line
            else
              if token1 = 'FORWARDED:' then
              Forwarded := Line
            else
              if token1 = 'FORWARDED-FOR:' then
              ForwardedFor := Line
            else
              AddToUnknown;
          'H':
            if token1 = 'HOST:' then
              Host := Line
            else
              AddToUnknown;
          'I':
            if token1 = 'IF-MODIFIED-SINCE:' then
              IfModSince := Line
            else
              if token1 = 'IF-MATCH:' then
              IfMatch := Line
            else
              if token1 = 'IF-NONE-MATCH:' then
              IfNoneMatch := Line
            else
              if token1 = 'IF-RANGE:' then
              IfRange := Line
            else
              if token1 = 'IF-UNMODIFIED-SINCE:' then
              IfUnModSince := Line
            else
              AddToUnknown;
          'K':
            if token1 = 'KEEP-ALIVE:' then
              KeepAlive := Line
            else
              AddToUnknown;
          'M':
            if token1 = 'MAX-FORWARDS:' then
              MaxForwards := Line
            else
              AddToUnknown;
          'P':
            if token1 = 'PUBLIC:' then
              PublicCache := Line
            else
              if token1 = 'PRAGMA:' then
              Pragma := Line
            else
              if token1 = 'PROXY-CONNECTION:' then
              ProxyConnection := Line
            else
              if token1 = 'PROXY-AUTHORIZATION:' then
              ProxyAuthorization := Line
            else
              AddToUnknown;
          'R':
            if token1 = 'REFERER:' then
              Referer := Line
            else
              if token1 = 'RANGE:' then
              Range := Line
            else
              AddToUnknown;
          'T':
            if token1 = 'TRANSFER-ENCODING:' then
              TransferEncoding := Line
            else
              AddToUnknown;
          'U':
            if token1 = 'UPGRADE:' then
              Upgrade := Line
            else
              if token1 = 'USER-AGENT:' then
              UserAgent := Trim(Line)
            else
              AddToUnknown;
          'V':
            if token1 = 'VIA:' then
              Via := Line
            else
              AddToUnknown;
          'W':
            if token1 = 'WEFERER:' then
              Weferer := Line
            else
              if token1 = 'WSER-AGENT:' then
              WserAgent := Line
            else
              AddToUnknown;
        else
          AddToUnknown;
        end;
      end;
    end;
  end;

  procedure ManuallyGetHost;
  begin
    with HeaderInfo do
    begin
      if Quickpos('//', URI) > 0 then
      begin
        Host := Copy(URI, 1, QuickPos('//', URI) + 1);
        Delete(URI, 1, Length(Host));
      end;
      if URI <> '/' then
      begin
        Host := Host + Copy(URI, 1, CharPos('/', URI));
        Delete(URI, 1, CharPos('/', URI));
      end;
    end;
  end;
  function ReadToStream(ACount: Integer): TStream;
  var
    p1: PChar;
  begin
    GetMem(p1, ACount);
    stm1.ReadBuffer(p1, ACount);
    Result := TMemoryStream.Create;
    Result.Write(p1^, ACount);
    Freemem(p1);
  end;
begin
  HeaderInfo := THeaderInfo.Create;
  Stm1 := TDicomKXSocketStream.Create(ClientThread.Socket);
  try
    repeat
      with HeaderInfo do
      begin
        ClientAddr := ClientThread.Socket.PeerIPAddress;
        ClientHost := HeaderInfo.ClientAddr;
      end;

      fbForceAbort := False;
      S := '';
      c1 := 0;
      //ClientThread.Socket.ReceiveLength
      while (Length(S) < 8192) do
      begin
        c2 := c1;
        c1 := stm1.ReadInt8;
        if (c2 = 13) and (c1 = 10) then
        begin
          Delete(S, Length(S), 1);
          if S <> '' then
          begin
            BuildHeader(S);
            S := '';
          end
          else
            break;
        end
        else
          S := S + chr(c1);
        if (not ClientThread.Socket.Connected) then
        begin
          Headerinfo.Free;
          Exit;
        end;
      end;

      if HeaderInfo.ContentLength > 0 then
      begin
        HeaderInfo.fPostData := ReadToStream(HeaderInfo.ContentLength);
      end;

      if HeaderInfo.Host = '' then
        ManuallyGetHost;
      Delete(HeaderInfo.ALL_HTTP, Length(HeaderInfo.ALL_HTTP) - 1, 2);
      HeaderInfo.ALL_HTTP := HeaderInfo.ALL_HTTP + #0;
      WantKeepAlive := fSupportKeepAlive and (lowercase(HeaderInfo.KeepAlive) = 'true');
      ClientThread.fHeaderInfo := HeaderInfo;

      {$IFNDEF NO_AUTHENTICATION_SUPPORT}
      ClientThread.AuthCheckAuthenticated;
      if not ClientThread.FAuthenticated then
      begin
        ClientThread.Answer401;
        exit;
      end;
      {$ENDIF}

      if HeaderInfo.Method = 'GET' then
        DoCommandGET(ClientThread, HeaderInfo, WantKeepAlive)
      else
        if HeaderInfo.Method = 'POST' then
        DoCommandPOST(ClientThread, HeaderInfo, WantKeepAlive)
      else
        if HeaderInfo.Method = 'HEAD' then
        DoCommandHEAD(ClientThread, HeaderInfo, WantKeepAlive)
      else
        if assigned(OnCommandOther) then
        OnCommandOther(ClientThread, HeaderInfo, WantKeepAlive);

      //if not fSupportKeepAlive then
      //  WantKeepAlive := False;
      if WantKeepAlive then
        ProcessWindowsMessageQueue; // 9/11/2002
    until (not WantKeepAlive) or (not ClientThread.Socket.Connected);
  finally
    HeaderInfo.Free; //2.4
    stm1.Free;
  end;
end; *)

procedure TKXHTTPServerCore.Start;
begin
  inherited Start;
end;

procedure TKXHTTPServerCore.Stop;
begin
  inherited Stop;
end;

procedure TKXHTTPServerCore.DoNewConnection(ClientThread: TKXClientThread);
begin
  inherited;
  THTTPClientThread(ClientThread).FServer := self;
  //ProcessSession(THTTPClientThread(ClientThread));

end;

function MakeHeader(AContentLength: Integer): string;
const
  CRLF = #13#10;
begin
  Result := 'HTTP/1.0 200 OK' + CRLF +
    'Server: CNS_Web_Server 1.0' + CRLF +
    // FOMIN 17_02_2013
    'Access-Control-Allow-Origin: *' + CRLF +
    //
    'Content-Type: text/html' + CRLF +
    'Content-Length: ' + IntToStr(AContentLength) + CRLF +
    'Last-Modified: ' + FormatDateTime('ddd, dd mmm yyyy hh:nn:ss ', now)
    + CRLF + CRLF;
end;

procedure THTTPClientThread.ProcessData;
var
  {$IFDEF DICOMDEBUGZ}
  iii, kkk: Integer;
  {$ENDIF}
  S: string;
  WantKeepAlive: Boolean;

  Stm1: TDicomKXSocketStream;
  c1, c2: Byte;
  procedure NotHandled;
  begin
    Socket.Write(
      'HTTP/1.0 ' + HeaderText(400) + #13#10 + #13#10 +
      '<html><head><title>Error</title>' +
      '<body><h1>Error</h1><hr><h3>Unsupported Method <B>"' +
      fHeaderInfo.Method + '"</B></h3></body></head></html>');
  end;

  procedure BuildHeader(ClientHeader: Ansistring);
  var
    line, token1, token2: Ansistring;
    Error: Integer;
    Ch: AnsiChar;
    I: Integer;

    procedure AddToUnknown;
    begin
      if fHeaderInfo.Unknown = '' then
        fHeaderInfo.Unknown := token1 + ': ' + line
      else
        fHeaderInfo.Unknown := fHeaderInfo.Unknown + #13#10 + token1 + ': ' + line;
    end;

  begin
    line := ClientHeader;
    with fHeaderInfo do
    begin
      if RAW = '' then
      begin
        RAW := Line;
        Method := Uppercase(FetchByChar(line, #32, False));
        URI := EscapeDecode(FetchByChar(line, #32, False));
        if CharPos('?', URI) > 0 then
        begin
          QueryString := Copy(URI, CharPos('?', URI) + 1, Length(URI));
          Delete(URI, CharPos('?', URI), Length(URI));
        end;
        Protocol := FetchByChar(line, #32, False);
      end
      else
      begin
        ALL_RAW := ALL_RAW + Line + #13#10;
        token1 := Uppercase(FetchByChar(line, #32, False));
        // 4RC2
        I := Length(Token1);
        Setlength(Token2, I);
        while I > 0 do
        begin
          case Token1[i] of
            '-': Token2[i] := '_';
          else
            Token2[i] := Token1[i];
          end;
          Dec(I);
        end;
        //            token2:=StringReplace (token1,'-','_', [rfReplaceAll]) ;
        ALL_HTTP := ALL_HTTP + 'HTTP_' + Token2 + Line + #13#10;
        Ch := Token1[1];
        case Ch of
          'A':
            if token1 = 'ACCEPT:' then
              Accept := Accept + Line
            else
              if token1 = 'ACCEPT-CHARSET:' then
              AcceptCharset := Line
            else
              if token1 = 'ACCEPT-ENCODING:' then
              AcceptEncoding := Line
            else
              if token1 = 'ACCEPT-LANGUAGE:' then
              AcceptLanguage := Line
            else
              if token1 = 'ALLOW:' then
              Allow := Line
            else
              if token1 = 'AUTHORIZATION:' then
            begin
              AuthType := Line;
              //AuthType := FetchByChar(line, #32, False); // Usually is "Basic"
              //token2 := FetchByChar(line, #32, False);
              //token2 := Base64ToString(token2); // Decode the "Basic" encoded string
              //AuthName := FetchByChar(token2, ':', False);
              //AuthPass := FetchByChar(token2, ';', False); // should actually be leftovers
            end
            else
              AddToUnknown;
          'C':
            if token1 = 'CACHE-CONTROL:' then
              CacheControl := Line
            else
              if token1 = 'CONNECTION:' then
              Connection := Line
            else
              if token1 = 'CACHE-INFO:' then
              CacheInfo := Line
            else
              if token1 = 'CONTENT-LENGTH:' then
            begin
              Val(FetchByChar(line, #32, False), ContentLength, Error);
            end
            else
              if token1 = 'CONTENT-TYPE:' then
              ContentType := Line
            else
              if token1 = 'COOKIE:' then
              Cookie := Line
            else
              AddToUnknown;
          'D':
            if token1 = 'DATE:' then
              Date := Line
            else
              AddToUnknown;
          'F':
            if token1 = 'FROM:' then
              From := Line
            else
              if token1 = 'FORWARDED:' then
              Forwarded := Line
            else
              if token1 = 'FORWARDED-FOR:' then
              ForwardedFor := Line
            else
              AddToUnknown;
          'H':
            if token1 = 'HOST:' then
              Host := Line
            else
              AddToUnknown;
          'I':
            if token1 = 'IF-MODIFIED-SINCE:' then
              IfModSince := Line
            else
              if token1 = 'IF-MATCH:' then
              IfMatch := Line
            else
              if token1 = 'IF-NONE-MATCH:' then
              IfNoneMatch := Line
            else
              if token1 = 'IF-RANGE:' then
              IfRange := Line
            else
              if token1 = 'IF-UNMODIFIED-SINCE:' then
              IfUnModSince := Line
            else
              AddToUnknown;
          'K':
            if token1 = 'KEEP-ALIVE:' then
              KeepAlive := Line
            else
              AddToUnknown;
          'M':
            if token1 = 'MAX-FORWARDS:' then
              MaxForwards := Line
            else
              AddToUnknown;
          'P':
            if token1 = 'PUBLIC:' then
              PublicCache := Line
            else
              if token1 = 'PRAGMA:' then
              Pragma := Line
            else
              if token1 = 'PROXY-CONNECTION:' then
              ProxyConnection := Line
            else
              if token1 = 'PROXY-AUTHORIZATION:' then
              ProxyAuthorization := Line
            else
              AddToUnknown;
          'R':
            if token1 = 'REFERER:' then
              Referer := Line
            else
              if token1 = 'RANGE:' then
              Range := Line
            else
              AddToUnknown;
          'T':
            if token1 = 'TRANSFER-ENCODING:' then
              TransferEncoding := Line
            else
              AddToUnknown;
          'U':
            if token1 = 'UPGRADE:' then
              Upgrade := Line
            else
              if token1 = 'USER-AGENT:' then
              UserAgent := Trim(Line)
            else
              AddToUnknown;
          'V':
            if token1 = 'VIA:' then
              Via := Line
            else
              AddToUnknown;
          'W':
            if token1 = 'WEFERER:' then
              Weferer := Line
            else
              if token1 = 'WSER-AGENT:' then
              WserAgent := Line
            else
              AddToUnknown;
        else
          AddToUnknown;
        end;
      end;
    end;
  end;

  procedure ManuallyGetHost;
  begin
    with fHeaderInfo do
    begin
      if Quickpos('//', URI) > 0 then
      begin
        Host := Copy(URI, 1, QuickPos('//', URI) + 1);
        Delete(URI, 1, Length(Host));
      end;
      if URI <> '/' then
      begin
        Host := Host + Copy(URI, 1, CharPos('/', URI));
        Delete(URI, 1, CharPos('/', URI));
      end;
    end;
  end;
  function ReadToStream(ACount: Integer): TMemoryStream;
  var
    p1: PChar;
  begin
    GetMem(p1, ACount);
    stm1.ReadBuffer(p1, ACount);
    Result := TOBStream.Create(p1, ACount);
    //Result.Write(p1^, ACount);
    //Freemem(p1);
  end;
begin
  {$IFDEF DICOMDEBUGZ}
  iii := GetTickCount;
  {$ENDIF}
  Stm1 := TDicomKXSocketStream.Create(Socket);
  //Stm1.BufferReadMode := true;
  try
    repeat
      fHeaderInfo := THeaderInfo.Create;
      try
        with fHeaderInfo do
        begin
          ClientAddr := Socket.PeerIPAddress;
          ClientHost := fHeaderInfo.ClientAddr;
        end;

        //fbForceAbort := False;
        S := '';
        c1 := 0;
        //ClientThread.Socket.ReceiveLength
        while (Length(S) < 8192) do
        begin
          c2 := c1;
          try
            c1 := stm1.ReadInt8;
          except

          end;
          if (not Socket.Connected) then
          begin
            Exit;
          end;
          if (c2 = 13) and (c1 = 10) then
          begin
            Delete(S, Length(S), 1);
            if S <> '' then
            begin
              BuildHeader(S);
              S := '';
            end
            else
              break;
          end
          else
            S := S + chr(c1);
        end;

        if fHeaderInfo.ContentLength > 0 then
        begin
          fHeaderInfo.fPostData := ReadToStream(fHeaderInfo.ContentLength);
        end;

        if fHeaderInfo.Host = '' then
          ManuallyGetHost;
        Delete(fHeaderInfo.ALL_HTTP, Length(fHeaderInfo.ALL_HTTP) - 1, 2);
        fHeaderInfo.ALL_HTTP := fHeaderInfo.ALL_HTTP + #0;
        WantKeepAlive := FServer.fSupportKeepAlive and (lowercase(fHeaderInfo.KeepAlive) = 'true');
        //fHeaderInfo := HeaderInfo;

        {$IFNDEF NO_AUTHENTICATION_SUPPORT}
        //if FAuthType <> atNone then
        begin
          AuthCheckAuthenticated;
          if not FAuthenticated then
          begin
            Answer401;
            exit;
          end;
        end;
        {$ENDIF}
        {$IFDEF DICOMDEBUGZ}
        SendDebug(Format('before:%d', [GetTickCount - iii]));
        iii := GetTickCount;
        {$ENDIF}
        try
          if fHeaderInfo.Method = 'GET' then
            FServer.DoCommandGET(self, fHeaderInfo, WantKeepAlive)
          else
            if fHeaderInfo.Method = 'POST' then
            FServer.DoCommandPOST(self, fHeaderInfo, WantKeepAlive)
          else
            if fHeaderInfo.Method = 'HEAD' then
            FServer.DoCommandHEAD(self, fHeaderInfo, WantKeepAlive)
          else
            if assigned(FServer.OnCommandOther) then
            FServer.OnCommandOther(self, fHeaderInfo, WantKeepAlive);
        except
        end;
        {$IFDEF DICOMDEBUGZ}
        SendDebug(Format('after:%d', [GetTickCount - iii]));
        iii := GetTickCount;
        {$ENDIF}
        //if not fSupportKeepAlive then
        //  WantKeepAlive := False;
        if WantKeepAlive then
          ProcessWindowsMessageQueue; // 9/11/2002
      finally
        fHeaderInfo.Free; //2.4
        fHeaderInfo := nil;
      end;
    until (not WantKeepAlive) or (not Socket.Connected);
  finally
    stm1.Free;
  end;
  {$IFDEF DICOMDEBUGZ}
  SendDebug(Format('end:%d', [GetTickCount - iii]));
  {$ENDIF}
end;

constructor THTTPClientThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  //  ReInitialize;
  fDocStream := nil;
end;

destructor THTTPClientThread.Destroy;
begin
  // TerminateAndFreeDataChannel;

  inherited;
end;

function TextToHtmlText(const Src: string): string;
const
  HtmlSpecialChars: array[160..255] of string[6] = (
    'nbsp', { #160 no-break space = non-breaking space               }
    'iexcl', { #161 inverted exclamation mark                         }
    'cent', { #162 cent sign                                         }
    'pound', { #163 pound sign                                        }
    'curren', { #164 currency sign                                     }
    'yen', { #165 yen sign = yuan sign                              }
    'brvbar', { #166 broken bar = broken vertical bar,                 }
    'sect', { #167 section sign                                      }
    'uml', { #168 diaeresis = spacing diaeresis                     }
    'copy', { #169 copyright sign                                    }
    'ordf', { #170 feminine ordinal indicator                        }
    'laquo', { #171 left-pointing double angle quotation mark         }
    'not', { #172 not sign                                          }
    'shy', { #173 soft hyphen = discretionary hyphen,               }
    'reg', { #174 registered sign = registered trade mark sign,     }
    'macr', { #175 macron = spacing macron = overline = APL overbar  }
    'deg', { #176 degree sign                                       }
    'plusmn', { #177 plus-minus sign = plus-or-minus sign,             }
    'sup2', { #178 superscript two = superscript digit two = squared }
    'sup3', { #179 superscript three = superscript digit three = cubed }
    'acute', { #180 acute accent = spacing acute,                     }
    'micro', { #181 micro sign                                        }
    'para', { #182 pilcrow sign = paragraph sign,                    }
    'middot', { #183 middle dot = Georgian comma = Greek middle dot    }
    'cedil', { #184 cedilla = spacing cedilla                         }
    'sup1', { #185 superscript one = superscript digit one           }
    'ordm', { #186 masculine ordinal indicator,                      }
    'raquo', { #187 right-pointing double angle quotation mark = right pointing guillemet }
    'frac14', { #188 vulgar fraction one quarter = fraction one quarter}
    'frac12', { #189 vulgar fraction one half = fraction one half      }
    'frac34', { #190 vulgar fraction three quarters = fraction three quarters }
    'iquest', { #191 inverted question mark = turned question mark     }
    'Agrave', { #192 latin capital letter A with grave = latin capital letter A grave, }
    'Aacute', { #193 latin capital letter A with acute,                }
    'Acirc', { #194 latin capital letter A with circumflex,           }
    'Atilde', { #195 latin capital letter A with tilde,                }
    'Auml', { #196 latin capital letter A with diaeresis,            }
    'Aring', { #197 latin capital letter A with ring above = latin capital letter A ring, }
    'AElig', { #198 latin capital letter AE = latin capital ligature AE, }
    'Ccedil', { #199 latin capital letter C with cedilla,              }
    'Egrave', { #200 latin capital letter E with grave,                }
    'Eacute', { #201 latin capital letter E with acute,                }
    'Ecirc', { #202 latin capital letter E with circumflex,           }
    'Euml', { #203 latin capital letter E with diaeresis,            }
    'Igrave', { #204 latin capital letter I with grave,                }
    'Iacute', { #205 latin capital letter I with acute,                }
    'Icirc', { #206 latin capital letter I with circumflex,           }
    'Iuml', { #207 latin capital letter I with diaeresis,            }
    'ETH', { #208 latin capital letter ETH                          }
    'Ntilde', { #209 latin capital letter N with tilde,                }
    'Ograve', { #210 latin capital letter O with grave,                }
    'Oacute', { #211 latin capital letter O with acute,                }
    'Ocirc', { #212 latin capital letter O with circumflex,           }
    'Otilde', { #213 latin capital letter O with tilde,                }
    'Ouml', { #214 latin capital letter O with diaeresis,            }
    'times', { #215 multiplication sign                               }
    'Oslash', { #216 latin capital letter O with stroke = latin capital letter O slash, }
    'Ugrave', { #217 latin capital letter U with grave,                }
    'Uacute', { #218 latin capital letter U with acute,                }
    'Ucirc', { #219 latin capital letter U with circumflex,           }
    'Uuml', { #220 latin capital letter U with diaeresis,            }
    'Yacute', { #221 latin capital letter Y with acute,                }
    'THORN', { #222 latin capital letter THORN,                       }
    'szlig', { #223 latin small letter sharp s = ess-zed,             }
    'agrave', { #224 latin small letter a with grave = latin small letter a grave, }
    'aacute', { #225 latin small letter a with acute,                  }
    'acirc', { #226 latin small letter a with circumflex,             }
    'atilde', { #227 latin small letter a with tilde,                  }
    'auml', { #228 latin small letter a with diaeresis,              }
    'aring', { #229 latin small letter a with ring above = latin small letter a ring, }
    'aelig', { #230 latin small letter ae = latin small ligature ae   }
    'ccedil', { #231 latin small letter c with cedilla,                }
    'egrave', { #232 latin small letter e with grave,                  }
    'eacute', { #233 latin small letter e with acute,                  }
    'ecirc', { #234 latin small letter e with circumflex,             }
    'euml', { #235 latin small letter e with diaeresis,              }
    'igrave', { #236 latin small letter i with grave,                  }
    'iacute', { #237 latin small letter i with acute,                  }
    'icirc', { #238 latin small letter i with circumflex,             }
    'iuml', { #239 latin small letter i with diaeresis,              }
    'eth', { #240 latin small letter eth                            }
    'ntilde', { #241 latin small letter n with tilde,                  }
    'ograve', { #242 latin small letter o with grave,                  }
    'oacute', { #243 latin small letter o with acute,                  }
    'ocirc', { #244 latin small letter o with circumflex,             }
    'otilde', { #245 latin small letter o with tilde,                  }
    'ouml', { #246 latin small letter o with diaeresis,              }
    'divide', { #247 division sign                                     }
    'oslash', { #248 latin small letter o with stroke, = latin small letter o slash, }
    'ugrave', { #249 latin small letter u with grave,                  }
    'uacute', { #250 latin small letter u with acute,                  }
    'ucirc', { #251 latin small letter u with circumflex,             }
    'uuml', { #252 latin small letter u with diaeresis,              }
    'yacute', { #253 latin small letter y with acute,                  }
    'thorn', { #254 latin small letter thorn,                         }
    'yuml'); { #255 latin small letter y with diaeresis,              }
var
  I, J: Integer;
  Sub: string;
begin
  Result := '';
  I := 1;
  while I <= Length(Src) do
  begin
    J := I;
    Sub := '';
    while (I <= Length(Src)) and (Ord(Src[I]) < Low(HtmlSpecialChars)) do
    begin
      case Src[I] of
        ' ':
          begin
            if (I > 1) and (Src[I - 1] = ' ') then
            begin
              { Replace multiple spaces by &nbsp; }
              while (I <= Length(Src)) and (Src[I] = ' ') do
              begin
                Sub := Sub + '&nbsp;';
                Inc(I);
              end;
              Dec(I);
            end
            else
              Inc(I);
          end;
        '<': Sub := '&lt;';
        '>': Sub := '&gt;';
        '''': sub := '&#39;';
        '"': Sub := '&#34;';
        '&': Sub := '&amp;';
        #9: Sub := '&nbsp;';
        #10: Sub := #10'<BR>';
      else
        Inc(I);
      end;
      if Length(Sub) > 0 then
      begin
        Result := Result + Copy(Src, J, I - J) + Sub;
        Inc(I);
        J := I;
        Sub := '';
      end;
    end;

    if I > Length(Src) then
    begin
      Result := Result + Copy(Src, J, I - J);
      Exit;
    end;
    Result := Result + Copy(Src, J, I - J) + '&' +
      HtmlSpecialChars[Ord(Src[I])] + ';';
    Inc(I);
  end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure THTTPClientThread.Answer404;
var
  Body: string;
begin
  Body := '<HTML><HEAD><TITLE>404 Not Found</TITLE></HEAD>' +
    '<BODY><H1>404 Not Found</H1>The requested URL ' +
    TextToHtmlText(fHeaderInfo.URI) +
    ' was not found on this server.<P></BODY></HTML>' + #13#10;

  Socket.Write(fHeaderInfo.Protocol + ' 404 Not Found' + #13#10 +
    'Content-Type: text/html' + #13#10 +
    'Content-Length: ' + IntToStr(Length(Body)) + #13#10 +
    #13#10 + Body);
end;

procedure THTTPClientThread.AnswerErrorParam(AStr: string);
var
  Body: string;
begin
  Body := '<HTML><HEAD><TITLE>404 Not Found</TITLE></HEAD>' +
    '<BODY> ' +
    AStr +
    ' <P></BODY></HTML>' + #13#10;

  Socket.Write(fHeaderInfo.Protocol + ' 404 Not Found' + #13#10 +
    'Content-Type: text/html' + #13#10 +
    'Content-Length: ' + IntToStr(Length(Body)) + #13#10 +
    #13#10 + Body);
end;
{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure THTTPClientThread.Answer403;
var
  Body: string;
begin
  Body := '<HTML><HEAD><TITLE>403 Forbidden</TITLE></HEAD>' +
    '<BODY><H1>403 Forbidden</H1>The requested URL ' +
    TextToHtmlText(fHeaderInfo.URI) +
    ' is Forbidden on this server.<P></BODY></HTML>' + #13#10;
  Socket.Write(fHeaderInfo.Protocol + ' 403 Forbidden' + #13#10 +
    'Content-Type: text/html' + #13#10 +
    'Content-Length: ' + IntToStr(Length(Body)) + #13#10 +
    #13#10 + Body);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure THTTPClientThread.Answer401;
var
  Body: string;
  Header: string;
  {$IFNDEF NO_AUTHENTICATION_SUPPORT}
  I: Integer;
  Tmp: array[0..2] of char;
  AuthString: string;
  {$ENDIF}
begin
  Body := '<HTML><HEAD><TITLE>401 Unauthorized</TITLE></HEAD>' +
    '<BODY><H1>401 Unauthorized</H1>The requested URL ' +
    TextToHtmlText(fHeaderInfo.URI) +
    ' is Unauthorized on this server.<P></BODY></HTML>' + #13#10;

  {$IFNDEF NO_AUTHENTICATION_SUPPORT}
  if FAuthType = atDigest then
  begin
    FAuthDigestServerNonce := '';
    FAuthDigestServerOpaque := '';
    Randomize;
    FAuthDigestServerNonce := Base64Encode(DateTimeToStr(Now));
    for I := 0 to 33 do
    begin
      while TRUE do
      begin
        tmp[0] := Char(Random(255));
        if ((tmp[0] >= 'a') and (tmp[0] <= 'z') or
          (tmp[0] >= 'A') and (tmp[0] <= 'Z') or
          (tmp[0] >= '0') and (tmp[0] <= '9')) then
          break;
      end;
      FAuthDigestServerOpaque := FAuthDigestServerOpaque + PChar(@tmp[0]);
    end;

    case FServer.FAuthDigestMethod of
      daAuth: AuthString := 'auth';
      daAuthInt: AuthString := 'auth-int';
      daBoth: AuthString := 'auth,auth-int';
    end;

    Header := fHeaderInfo.Protocol + ' 401 Unauthorized' + #13#10 +
      'WWW-Authenticate: ' +
      'Digest realm=' + FAuthRealm +
      ', qop="' + AuthString + '"' +
      ', nonce="' + FAuthDigestServerNonce + '"' +
      ', opaque="' + FAuthDigestServerOpaque + '"';
    if FAuthDigestStale then
      Header := Header + ', stale="true"';
    Header := Header + #13#10 +
      'WWW-Authenticate: ' +
      'Basic Realm=' + FAuthRealm + #13#10 +
      'Content-Type: text/html' + #13#10 +
      'Content-Length: ' + IntToStr(Length(Body)) +
      #13#10 + #13#10;
  end
  else
  begin
    {$ENDIF}
    Header := fHeaderInfo.Protocol + ' 401 Unauthorized' + #13#10 +
      'WWW-Authenticate: Basic Realm=' + FAuthRealm + #13#10 +
      'Content-Type: text/html' + #13#10 +
      'Content-Length: ' + IntToStr(Length(Body)) + #13#10 +
      #13#10 + #13#10;
    {$IFNDEF NO_AUTHENTICATION_SUPPORT}
  end;
  {$ENDIF}
  { Do not use AnswerString method because we don't want to use ranges }
  Socket.Write(Header + Body);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure THTTPClientThread.Answer501;
var
  Body: string;
begin
  Body := '501 Unimplemented';
  Socket.Write(fHeaderInfo.Protocol + ' 501 Unimplemented' + #13#10 +
    'Content-Type: text/plain' + #13#10 +
    'Content-Length: ' + IntToStr(Length(Body)) + #13#10 +
    #13#10 + Body);
end;

procedure THTTPClientThread.AnswerString(
  const Status: string; { if empty, default to '200 OK'              }
  const ContType: string; { if empty, default to 'text/html'           }
  const Header: string; { Do not use Content-Length nor Content-Type }
  const Body: string); { Could be empty. No default.                }
begin
  if fDocStream <> nil then
    fDocStream.Free;
  fDocStream := TStringStream.Create(Body);
  AnswerStream(Status, ContType, Header);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure THTTPClientThread.AnswerStream(
  const Status: string; { if empty, default to '200 OK'           }
  const ContType: string; { if emtpy, default to text/html          }
  const Header: string); { Do not use Content-Length               }
var
  str1: string;
  stm1: TMemoryStream;
begin
  str1 := '';
  if Status = '' then
    str1 := str1 + fHeaderInfo.Protocol + ' 200 OK' + #13#10
  else
    str1 := str1 + fHeaderInfo.Protocol + ' ' + Status + #13#10;
  // FOMIN 18_02_2013
  str1 := str1 + 'Access-Control-Allow-Origin: *' + #13#10;
//  str1 := str1 + 'Cache-Control max-age=0' + #13#10;
  // end fomin 18_02_2013
  if ContType = '' then
    str1 := str1 + 'Content-Type: text/html' + #13#10
  else
    str1 := str1 + 'Content-Type: ' + ContType + #13#10;
  {FP 22/05/05 begin}
{  if FKeepAlive then
    PutStringInSendBuffer('Connection: Keep-Alive' + #13#10)
  else}
  str1 := str1 + 'Connection: Close' + #13#10;
  {FP 22/05/05 end}
  if not Assigned(fDocStream) then
    str1 := str1 + 'Content-Length: 0' + #13#10
  else
  begin
    str1 := str1 + 'Content-Length: ' +
      IntToStr(fDocStream.Size) + #13#10;
  end;
  if Header <> '' then
    str1 := str1 + Header;
  str1 := str1 + #13#10;
  Socket.Write(str1);
  if fDocStream <> nil then
  begin
    if fDocStream is TMemoryStream then
    begin
      stm1 := TMemoryStream(fDocStream);
      Socket.Write(stm1.Memory, stm1.Size);
    end
    else
      Socket.SendFrom(fDocStream);
    fDocStream.Free;
    fDocStream := nil;
  end;
end;

procedure TKXHTTPServerCore.DoCommandGET(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo;
  var EnableKeepAlive: Boolean);
begin
  if assigned(fOnCommandGET) then
    fOnCommandGET(ClientThread, HeaderInfo, EnableKeepAlive);

end;

procedure TKXHTTPServerCore.DoCommandPOST(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo;
  var EnableKeepAlive: Boolean);
begin
  if assigned(fOnCommandPOST) then
    fOnCommandPOST(ClientThread, HeaderInfo, EnableKeepAlive);

end;

procedure TKXHTTPServerCore.DoCommandHEAD(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo;
  var EnableKeepAlive: Boolean);
begin
  if assigned(fOnCommandHEAD) then
    fOnCommandHEAD(ClientThread, HeaderInfo, EnableKeepAlive);

end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFNDEF NO_AUTHENTICATION_SUPPORT}

function PosEx(const SubStr, S: string; Offset: Cardinal): Integer;
var
  I, X: Integer;
  Len: Integer;
  LenSubStr: Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else
  begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do
    begin
      if S[I] = SubStr[1] then
      begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then
        begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;
    Result := 0;
  end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure AuthDigestCvtHex(_b: TMD5Digest; _h: THashHex);
var
  I: Word;
  J: AnsiChar;
begin
  for I := 0 to HASHLEN - 1 do
  begin
    J := AnsiChar((integer(_b[I]) shr 4) and $F);
    if J <= Char(9) then
      _h[I * 2] := AnsiChar(integer(J) + integer('0'))
    else
      _h[I * 2] := AnsiChar(integer(J) + integer('a') - 10);

    J := AnsiChar(integer(_b[I]) and $F);
    if J <= Char(9) then
      _h[I * 2 + 1] := AnsiChar(integer(J) + integer('0'))
    else
      _h[I * 2 + 1] := AnsiChar(integer(J) + integer('a') - 10);
  end;

  _h[HASHHEXLEN] := #0;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure AuthDigestCalcResponse(
  HA1: THashHex; { H(A1)                             }
  pszNonce: string; { nonce from server                 }
  pszNonceCount: string; { 8 hex digits                      }
  pszCNonce: string; { client nonce                      }
  pszQop: string; { qop-value: "", "auth", "auth-int" }
  pszMethod: string; { method from the request           }
  pszDigestUri: string; { requested URL                     }
  HEntity: THashHex; { H(entity body) if qop="auth-int"  }
  var Response: THashHex); { request-digest or response-digest }
var
  Md5Ctx: TMD5Context;
  HA2: TMD5Digest;
  RespHash: TMD5Digest;
  HA2Hex: THashHex;
  Tmp: string;
begin
  Tmp := ':';

  { calculate H(A2) }
  MD5Init(Md5Ctx);
  MD5Update(Md5Ctx, pszMethod[1], Length(pszMethod));
  MD5Update(Md5Ctx, Tmp[1], 1);
  MD5Update(Md5Ctx, pszDigestUri[1], Length(pszDigestUri));

  if StrIComp(PChar(pszQop), 'auth-int') = 0 then
  begin
    MD5Update(Md5Ctx, Tmp[1], 1);
    MD5Update(Md5Ctx, HEntity[0], HASHHEXLEN);
  end;
  MD5Final(HA2, Md5Ctx);
  AuthDigestCvtHex(HA2, HA2Hex);

  { calculate response }
  MD5Init(Md5Ctx);
  MD5Update(Md5Ctx, HA1[0], HASHHEXLEN);
  MD5Update(Md5Ctx, Tmp[1], 1);
  MD5Update(Md5Ctx, pszNonce[1], Length(pszNonce));
  MD5Update(Md5Ctx, Tmp[1], 1);

  MD5Update(Md5Ctx, pszNonceCount[1], Length(pszNonceCount));
  MD5Update(Md5Ctx, Tmp[1], 1);
  MD5Update(Md5Ctx, pszCNonce[1], Length(pszCNonce));
  MD5Update(Md5Ctx, Tmp[1], 1);
  MD5Update(Md5Ctx, pszQop[1], Length(pszQop));
  MD5Update(Md5Ctx, Tmp[1], 1);

  MD5Update(Md5Ctx, HA2Hex[0], HASHHEXLEN);
  MD5Final(RespHash, Md5Ctx);
  AuthDigestCvtHex(RespHash, Response);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure AuthDigestCalcHA1(
  pszAlg: string;
  _username: string;
  _realm: string;
  _password: string;
  _nonce: string;
  _cnonce: string;
  var _sess_key: THashHex);
var
  Md5Ctx: TMD5Context;
  HA1: TMD5Digest;
  Tmp: string;
begin
  Tmp := ':';
  MD5Init(Md5Ctx);
  MD5Update(Md5Ctx, PChar(_username)^, Length(_username));
  MD5Update(Md5Ctx, Tmp[1], 1);
  MD5Update(Md5Ctx, PChar(_realm)^, Length(_realm));
  MD5Update(Md5Ctx, Tmp[1], 1);
  MD5Update(Md5Ctx, PChar(_password)^, Length(_password));
  MD5Final(HA1, Md5Ctx);

  if StrComp(StrLower(PChar(pszAlg)), 'md5-sess') = 0 then
  begin
    MD5Init(Md5Ctx);
    MD5Update(Md5Ctx, HA1[1], sizeof(HA1));
    MD5Update(Md5Ctx, Tmp[1], 1);
    MD5Update(Md5Ctx, _nonce[1], Length(_nonce));
    MD5Update(Md5Ctx, Tmp[1], 1);
    MD5Update(Md5Ctx, _cnonce[1], Length(_cnonce));
    MD5Final(HA1, Md5Ctx);
  end;

  AuthDigestCvtHex(HA1, _sess_key);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure GetBodyHash(const Body: string; var BodyHash: THashHex);
var
  Md5Ctx: TMD5Context;
  HA1: TMD5Digest;
begin
  MD5Init(Md5Ctx);
  MD5Update(Md5Ctx, PChar(Body)^, Length(Body));
  MD5Final(HA1, Md5Ctx);
  AuthDigestCvtHex(HA1, BodyHash);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function THTTPClientThread.AuthDigestCheckPassword(const Password: string): Boolean;
var
  SessKey: THashHex;
  MyResponse: THashHex;
  HEntity: THashHex;
begin
  if Password = '' then
  begin
    Result := FALSE;
    Exit;
  end;
  AuthDigestCalcHA1(FAuthDigestAlg, FAuthUserName, FAuthDigestRealm, Password,
    FAuthDigestNonce, FAuthDigestCnonce, SessKey);

  GetBodyHash(FAuthDigestBody, HEntity);
  AuthDigestCalcResponse(SessKey, FAuthDigestNonce, FAuthDigestNc,
    FAuthDigestCnonce, FAuthDigestQop, fHeaderInfo.Method,
    FAuthDigestUri, HEntity, MyResponse);
  Result := (StrComp(PAnsiChar(@FAuthDigestResponse[1]), PAnsiChar(@MyResponse[0])) = 0);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function THTTPClientThread.AuthBasicCheckPassword(const Password: string): Boolean;
begin
  Result := (FAuthPassword = Password)
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function THTTPClientThread.AuthBasicGetParams: Boolean;
var
  Buf: string;
  I: Integer;
begin
  { Must begin with 'basic ' }
  Result := (LowerCase(Copy(fHeaderInfo.AuthType, 1, 6)) = 'basic ');
  if not Result then
    Exit;

  Buf := Base64Decode(Copy(fHeaderInfo.AuthType, 7, Length(fHeaderInfo.AuthType)));
  if Buf = '' then
    Result := FALSE
  else
  begin
    I := Pos(':', Buf);
    if I > 0 then
    begin
      FAuthUserName := Copy(Buf, 1, I - 1);
      FAuthPassword := Copy(Buf, I + 1, Length(Buf));
    end
    else
    begin
      FAuthUserName := Buf;
      FAuthPassword := '';
    end;
    Result := TRUE;
  end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function THTTPClientThread.AuthDigestGetParams: Boolean;
var
  { alg,UserName, Realm, qop, nonce, nc,uri,method, cnonce, opaque, response: String; }
  Pos1, Pos2: integer;
  LastTime, t1, t2: TDateTime;
begin
  Result := FALSE;
  FAuthDigestStale := FALSE;
  { Must begin with 'digest ' }
  if LowerCase(Copy(fHeaderInfo.AuthType, 1, 7)) <> 'digest ' then
    Exit;

  Pos1 := PosEx('username="', fHeaderInfo.AuthType, 1);
  if Pos1 = 0 then
    Exit;

  Pos1 := Pos1 + Length('username="');
  Pos2 := PosEx('"', fHeaderInfo.AuthType, Pos1);
  FAuthUserName := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);

  Pos1 := PosEx('realm="', fHeaderInfo.AuthType, 1);
  if Pos1 = 0 then
    Exit;
  Pos1 := Pos1 + Length('realm="');
  Pos2 := PosEx('"', fHeaderInfo.AuthType, Pos1);
  FAuthDigestRealm := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);

  Pos1 := PosEx('qop="', fHeaderInfo.AuthType, 1);
  if Pos1 = 0 then
  begin
    Pos1 := PosEx('qop=', fHeaderInfo.AuthType, 1);
    if Pos1 = 0 then
      Exit;
    Pos1 := Pos1 + Length('qop=');
    Pos2 := PosEx(',', fHeaderInfo.AuthType, Pos1);
    FAuthDigestQop := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);
  end
  else
  begin
    Pos1 := Pos1 + Length('qop="');
    Pos2 := PosEx('"', fHeaderInfo.AuthType, Pos1);
    FAuthDigestQop := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);
  end;

  case FServer.FAuthDigestMethod of
    daAuth:
      if FAuthDigestQop <> 'auth' then
        Exit;
    daAuthInt:
      if FAuthDigestQop <> 'auth-int' then
        Exit;
    daBoth:
      { whatever it is }
  end;

  FAuthDigestStale := TRUE;

  Pos1 := PosEx('algorithm="', fHeaderInfo.AuthType, 1);
  if Pos1 = 0 then
  begin
    Pos1 := PosEx('algorithm=', fHeaderInfo.AuthType, 1);
    if Pos1 = 0 then
      FAuthDigestAlg := 'MD5'
    else
    begin
      Pos1 := Pos1 + Length('algorithm=');
      Pos2 := PosEx(',', fHeaderInfo.AuthType, Pos1);
      FAuthDigestAlg := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);
    end;
  end
  else
  begin
    Pos1 := Pos1 + Length('algorithm="');
    Pos2 := PosEx('"', fHeaderInfo.AuthType, Pos1);
    FAuthDigestAlg := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);
  end;

  Pos1 := PosEx('nonce="', fHeaderInfo.AuthType, 1) + Length('nonce="');
  Pos2 := PosEx('"', fHeaderInfo.AuthType, Pos1);
  FAuthDigestNonce := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);

  Pos1 := PosEx('nc=', fHeaderInfo.AuthType, 1) + Length('nc=');
  Pos2 := PosEx(',', fHeaderInfo.AuthType, Pos1);
  FAuthDigestNc := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);

  Pos1 := PosEx('uri="', fHeaderInfo.AuthType, 1) + Length('uri="');
  Pos2 := PosEx('"', fHeaderInfo.AuthType, Pos1);
  FAuthDigestUri := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);

  Pos1 := PosEx('cnonce="', fHeaderInfo.AuthType, 1) + Length('cnonce="');
  Pos2 := PosEx('"', fHeaderInfo.AuthType, Pos1);
  FAuthDigestCnonce := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);

  Pos1 := PosEx('opaque="', fHeaderInfo.AuthType, 1) + Length('opaque="');
  Pos2 := PosEx('"', fHeaderInfo.AuthType, Pos1);
  FAuthDigestOpaque := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);

  Pos1 := PosEx('response="', fHeaderInfo.AuthType, 1) + Length('response="');
  Pos2 := PosEx('"', fHeaderInfo.AuthType, Pos1);
  FAuthDigestResponse := Copy(fHeaderInfo.AuthType, Pos1, Pos2 - Pos1);

  t1 := EncodeTime(0, 1, 0, 0);
  t2 := Now;
  try
    LastTime := StrToDateTime(Trim(Base64Decode(FAuthDigestNonce)));
  except
    Exit;
  end;

  if (LastTime + t1) > t2 then
    Result := TRUE;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ Set FAuthenticated accordingly to the authenticated state of the user.    }

procedure THTTPClientThread.AuthCheckAuthenticated;
var
  PasswdBuf: string;
begin
  FAuthType := FServer.FAuthType;
  FAuthRealm := FServer.FAuthRealm;
  TriggerAuthGetType;
  if FAuthType = atNone then
    FAuthenticated := TRUE
  else
    if FAuthType = atBasic then
  begin
    FAuthenticated := AuthBasicGetParams;
    if FAuthenticated then
    begin
      PasswdBuf := #0;
      TriggerAuthGetPassword(PasswdBuf);
      FAuthenticated := AuthBasicCheckPassword(PasswdBuf);
      TriggerAuthResult(FAuthenticated);
    end;
  end
  else
    if FAuthType = atDigest then
  begin
    FAuthDigestBody := '';
    FAuthenticated := AuthDigestGetParams;
    if FAuthenticated then
    begin
      PasswdBuf := #0;
      TriggerAuthGetPassword(PasswdBuf);
      FAuthenticated := AuthDigestCheckPassword(PasswdBuf);
      TriggerAuthResult(FAuthenticated);
    end;
  end
  else
    FAuthenticated := FALSE; { Should never occurs ! }
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure THTTPClientThread.TriggerAuthGetPassword(
  var PasswdBuf: string);
begin
  if Assigned(FServer.FOnAuthGetPassword) then
    FServer.FOnAuthGetPassword(FServer, Self, PasswdBuf);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure THTTPClientThread.TriggerAuthResult(Authenticated: Boolean);
begin
  if Assigned(FServer.FOnAuthResult) then
    FServer.FOnAuthResult(FServer, Self, Authenticated);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure THTTPClientThread.TriggerAuthGetType;
begin
  if Assigned(FServer.FOnAuthGetType) then
    FServer.FOnAuthGetType(FServer, Self);
end;
{$ENDIF}

function strBreakApart(s: string; delimeter: string; parts: TStrings): string;
var
  curpos: integer;
  curStr: string;
begin
  Result := '';
  parts.clear;
  curStr := s;
  repeat
    curPos := pos(delimeter, curStr);
    if (curPos > 0) then
    begin
      parts.add(copy(curStr, 1, curPos - 1));
      curStr := copy(curStr, curPos + 1, length(curStr) - (curPos));
    end
    else
      parts.add(curStr);
  until curPos = 0;
end;

{ TWADOServerCore }

function TWADOServerCore.SaveToAVI(ADataset: TDicomDataset; rows, columns, windowCenter,
  windowWidth, frameNumber, imageQuality: Integer; region: string): TMemoryStream;
begin

end;

function TWADOServerCore.SaveToJpeg(ADataset: TDicomDataset; rows, columns, windowCenter,
  windowWidth, frameNumber, imageQuality: Integer; region: string;
  vW:Integer=0; vH:Integer=0  ): TMemoryStream;
var
  bm1: TBitmap;
  jpeg1: TJpegGraphic;
  stm1: TMemoryStream;
{  procedure ResizeBitmap(Bitmap: TBitmap; Width, Height: Integer; Background: TColor);
  var
    R: TRect;
    B: TBitmap;
    X, Y: Integer;
  begin
    if assigned(Bitmap) then begin
      B:= TBitmap.Create;
      try
        if Bitmap.Width > Bitmap.Height then begin
          R.Right:= Width;
          R.Bottom:= ((Width * Bitmap.Height) div Bitmap.Width);
          X:= 0;
          Y:= (Height div 2) - (R.Bottom div 2);
        end else begin
          R.Right:= ((Height * Bitmap.Width) div Bitmap.Height);
          R.Bottom:= Height;
          X:= (Width div 2) - (R.Right div 2);
          Y:= 0;
        end;
        R.Left:= 0;
        R.Top:= 0;
        B.PixelFormat:= Bitmap.PixelFormat;
        B.Width:= Width;
        B.Height:= Height;
        B.Canvas.Brush.Color:= Background;
        B.Canvas.FillRect(B.Canvas.ClipRect);
        B.Canvas.StretchDraw(R, Bitmap);
        Bitmap.Width:= Width;
        Bitmap.Height:= Height;
        Bitmap.Canvas.Brush.Color:= Background;
        Bitmap.Canvas.FillRect(Bitmap.Canvas.ClipRect);
        Bitmap.Canvas.Draw(X, Y, B);
      finally
        B.Free;
      end;
    end;
  end; }
begin
  bm1 := TBitmap.Create;
  jpeg1 := TJpegGraphic.Create;
  try
    SaveToBitmap(ADataset, rows, columns, windowCenter, columns, //windowWidth,
      frameNumber, imageQuality, region, bm1, vW, vH );
   { if ((vH>0) and (vW>0)) then
    begin
      if ((vH<bm1.Height) and (vW<bm1.Width)) then
        ResizeBitmap(bm1,vW,vH,clBlack);
    end;  }

    jpeg1.Assign(bm1);
    jpeg1.SaveQuality:=imageQuality;
    stm1 := TMemoryStream.Create;

   // jpeg1.SaveToFile('c:\tmp\test_jpeg\'+inttostr(GetTickCount)+'_'+inttostr(Random(1000000))+'.jpg');

    jpeg1.SaveToStream(stm1);
    stm1.Position := 0;
    Result := stm1;
  finally
    bm1.Free;
    jpeg1.Free;
  end;
end;

function TWADOServerCore.SaveToJpeg2000(ADataset: TDicomDataset; rows, columns, windowCenter,
  windowWidth, frameNumber, imageQuality: Integer; region: string): TMemoryStream;
//var
//  d1: TDicomImageData;
begin
  //  d1 := ImageData[frameNumber];
  //  Result := TMemoryStream.Create;
  //  encodeJPEG2000(@Result, d1.Data, 0, FWidth, FHeight, FSamplePerPixel, FBits)
end;

// FOMIN добавлен параметр 
function TWADOServerCore.SaveToWADOStream( AParam, ResultHtmlDoc: TStrings;
              var AStreamMIMEType: string;
              p_icon:Boolean=False;
              p_frame:string='';
              pwidth:string='';
              pheight:string='';
              pavi:Boolean=False ): TStream;
var
  requestType: string; //=WADO

  studyUID: string;
  seriesUID: string;
  objectUID: string;

  //2 OPTIONAL parameter

  contentType: string; //a list of MIME types, separated by a ","
  charset: string;
  anonymize: string;
  //=yes  Removal of all patient identification information from within the DICOM object,

//3 parameters shall not be present  if contentType is application / dicom.

  annotation: string; // = patient, technique
  rows: Integer;
  columns: Integer;
  region: string;
  windowCenter: Integer;
  windowWidth: Integer;
  frameNumber: Integer;
  imageQuality: Integer;
  presentationUID: string;
  presentationSeriesUID: string;

  //3 parameters shall not be present if contentType is other than application/dicom.
  transferSyntax: string;

  str1: string;
  das1: TDicomDataset;
  t1: TUIDEntry;
  v_nmb_frame, v_amm_fl_chk,
  vW,vH : Integer;
  v_file_tmp, v_dir : AnsiString;
  v_is_ok1:Boolean;
  bm: TBitmap;
  DA: TDicomAttributes;
  JpegImg : TJpegImage;
  vKoeff : Extended;
label m1,m2,m3;
begin
  Result := nil;
  vH:=0; vW:=0;
  if ((trim(pheight)<>'') and (trim(pwidth)<>'')) then
  begin
    if not TryStrToInt(trim(pheight),vH) then vH:=0;
    if not TryStrToInt(trim(pwidth),vW) then vW:=0;
  end;

  requestType := AParam.Values['requestType'];
  if requestType <> 'WADO' then
    ResultHtmlDoc.Add('requestType is not WADO');
  studyUID := AParam.Values['studyUID'];
  seriesUID := AParam.Values['seriesUID'];
  objectUID := AParam.Values['objectUID'];
 { if studyUID = '' then
    ResultHtmlDoc.Add('studyUID is REQUIRED parameter');
  if seriesUID = '' then
    ResultHtmlDoc.Add('seriesUID is REQUIRED parameter');
  if objectUID = '' then
    ResultHtmlDoc.Add('objectUID is REQUIRED parameter');  }

  contentType := AParam.Values['contentType'];
  charset := AParam.Values['charset'];
  anonymize := AParam.Values['anonymize'];

  annotation := AParam.Values['annotation']; // = patient, technique
  str1 := AParam.Values['rows'];
  if str1 <> '' then
    rows := StrToInt(str1)
  else
    rows := 0;
  str1 := AParam.Values['columns'];
  if str1 <> '' then
    columns := StrToInt(str1)
  else
    columns := 0;
  region := AParam.Values['region']; //region=0.3,0.4,0.5,0.5

  str1 := AParam.Values['windowCenter'];
  if str1 <> '' then
    windowCenter := StrToInt(str1)
  else
    windowCenter := 0;
  str1 := AParam.Values['windowWidth'];
  if str1 <> '' then
    windowWidth := StrToInt(str1)
  else
    windowWidth := 0;
  str1 := AParam.Values['frameNumber'];
  if str1 <> '' then
    frameNumber := StrToInt(str1)
  else
    frameNumber := 0;
  str1 := AParam.Values['imageQuality'];
  if str1 <> '' then
    imageQuality := StrToInt(str1)
  else
    imageQuality := 100;
  presentationUID := AParam.Values['presentationUID'];
  presentationSeriesUID := AParam.Values['presentationSeriesUID'];

  transferSyntax := AParam.Values['transferSyntax'];

  if (Trim(p_frame)<>'') then
  begin // возвращаем фрейм
    try
      v_nmb_frame:=StrToInt(Trim(p_frame));
    except
      v_nmb_frame:=1;
    end;
    das1 := DoFindImage(studyUID, seriesUID, objectUID);
    AStreamMIMEType := 'image/jpeg';
    try
      v_amm_fl_chk:=0;
      try
        m2: Inc(v_nnn);
        v_dir:=ExtractFilePath(paramstr(0))+'log\tmp\';
        if not DirectoryExists(v_dir) then
          CreateDir(v_dir);
        v_file_tmp:=v_dir+'f'+inttostr(GetTickCount)+'_'+inttostr(v_nnn)+inttostr(Random(1000000))+'.jpg';
        if FileExists(v_file_tmp) then goto m2;
        v_is_ok1 := True;
        try
          // das1.Attributes.ImageData.ImageData[v_nmb_frame].SaveData(v_file_tmp);
        {  if pavi then
          begin

          end else
          begin }
            bm := TBitmap.Create;
            JpegImg := TJpegImage.Create;
            try
              DA := das1.Attributes;
              DA.ImageData.CurrentFrame := v_nmb_frame;
              DCM_ImageData_Bitmap.AssignToBitmap(DA.ImageData, bm);

              // bm.SaveToFile('c:\tmp\test_jpeg\1.bmp');

              JpegImg.Assign(bm) ;
              JpegImg.SaveToFile( v_file_tmp ) ;
            finally
              JpegImg.Free;
              bm.Free;
            end;
       {   end;  }

        except
          on e:Exception do begin
            Lg_ev('error das1.Attributes.ImageData.ImageData SaveData: '+E.ClassName+' with message : '+E.Message);
            Result:=nil;
            v_is_ok1 := False;
          end;
        end;
        if not v_is_ok1 then goto m3;
        m1:
        if MyFileStatus(v_file_tmp) then
        begin
          Result := TFileStream.Create(v_file_tmp, fmOpenRead);
        end
        else
        begin
          Sleep(10);
          goto m1;
        end;
        m3:
      except
      end;
    finally
     if Result <> nil then
         Result.Position := 0;
     das1.Free;
     try
       if FileExists(v_file_tmp) then
       begin
         DeleteFile(v_file_tmp);
         if FileExists(v_file_tmp) then
           Dicom_Charset.v_TempFileList.Append(v_file_tmp);
       end;
     except
     on e:Exception do
       Lg_ev('error DeleteFile error: '+E.ClassName+' with message : '+E.Message);
     end;
    end;

  end else
  if transferSyntax = '1.2.840.10008.1.2.5.1' then //zlib
  begin
    Result := DoFindImageStream(studyUID, seriesUID, objectUID);
  end
  else
  begin
    das1 := DoFindImage(studyUID, seriesUID, objectUID);
    if das1 <> nil then
    begin
      // FOMIN 22.02.2013
      if p_icon then
      begin
        imageQuality:=10;
        AStreamMIMEType := 'image/jpeg';
            Result := SaveToJpeg(das1, 150{rows}, 150{columns}, windowCenter, windowWidth,
              frameNumber, imageQuality, region);
      end else
      //contentType  =image%2Fjp2;level=1,image%2Fjpeg;q=0.5
      //application/dicom
      //text/xml
      //application/pdf
      //text/rtf
      //text/plain
      //application/x-hl7-cda-level-one+xml
      //image/gif
      //video/mpeg
      //image/png
      //image/jp2;level=1
      //image/jpeg;q=0.5  ===  JPEG baseline lossy 8
      Lg_ev('contentType='+inttostr(GetContentType(contentType))+'   contentType='+contentType,ExtractFilePath(paramstr(0))+'wado.log');
      if ((vH>0) and (vW>0)) then
      begin
        AStreamMIMEType := 'image/jpeg';
            Result := SaveToJpeg(das1, rows, columns, windowCenter, windowWidth,
              frameNumber, imageQuality, region, vW, vH);
      end else
      case GetContentType(contentType) of
        10: //image/jpeg;q=0.5
          begin
            AStreamMIMEType := 'image/jpeg';
            Result := SaveToJpeg(das1, rows, columns, windowCenter, windowWidth,
              frameNumber, imageQuality, region);
          end;
        9: //image/jp2;level=1
          begin
            AStreamMIMEType := 'image/jpeg'; //'image/jp2';
            Result := SaveTojpeg(das1, rows, columns, windowCenter,
              windowWidth, frameNumber, imageQuality, region);
          end;
        8: //image/png
          begin
            AStreamMIMEType := 'image/png';
            Result := SaveToPNG(das1, rows, columns, windowCenter,
              windowWidth, frameNumber, imageQuality, region);
          end;
        7: //video/mpeg
          begin
            AStreamMIMEType := 'mpeg/avi';
            Result := SaveToAVI(das1, rows, columns, windowCenter, windowWidth,
              frameNumber, imageQuality, region);
          end;
        6: //image/gif
          begin
            AStreamMIMEType := 'image/gif';
            Result := SaveToGIF(das1, rows, columns, windowCenter, windowWidth,
              frameNumber, imageQuality, region);
          end;
        0: //application/dicom
          begin
            Result := TMemoryStream.Create;
            if transferSyntax = '' then
              das1.SaveToStream(Result, true, 8193, 100)
            else
            begin
              try
                t1 := UIDS.Items[transferSyntax];
              except
                on e: Exception do
                begin
                  das1.SaveToStream(Result, true, 8193, 100);
                  //ResultHtmlDoc.Add('transferSyntax Error: ' + e.Message);
                end;
              end;
              if assigned(t1) and (t1.UIDType = 3) then
              begin
                das1.SaveToStream(Result, true, t1.Constant, 100);
              end;
            end;
          end;
        1: //text/xml
          begin

          end;
        2: //application/pdf
          begin

          end;
        3: //text/rtf
          begin

          end;
        4: //text/plain
          begin

          end;
        5: //application/x-hl7-cda-level-one+xml
          begin

          end;
      end;
      if Result <> nil then
        Result.Position := 0;
      das1.Free;
    end;
  end;
end;

function TWADOServerCore.DoFindImage(studyUID, seriesUID,
  objectUID: string): TDicomDataset;
begin
  if assigned(FOnFindImage) then
    FOnFindImage(studyUID, seriesUID, objectUID, Result)
  else
    Result := nil;
end;

function TWADOServerCore.DoFindImageStream(studyUID, seriesUID,
  objectUID: string): TStream;
begin
  if assigned(FOnFindImageStream) then
    FOnFindImageStream(studyUID, seriesUID, objectUID, Result)
  else
    Result := nil;
end;

procedure TWADOServerCore.DoCommandGET(ClientThread: THTTPClientThread;
  HeaderInfo: THeaderInfo; var EnableKeepAlive: Boolean);
begin
  inherited;

end;

function TWADOServerCore.SaveToGIF(ADataset: TDicomDataset; rows, columns,
  windowCenter, windowWidth, frameNumber, imageQuality: Integer;
  region: string): TMemoryStream;
{var
  bm1: TBitmap;
  jpeg1: TGIFImage;
  stm1: TMemoryStream;}
begin
{  bm1 := TBitmap.Create;
  jpeg1 := TGIFImage.Create;
  try
    SaveToBitmap(ADataset, rows, columns, windowCenter, windowWidth,
      frameNumber, imageQuality, region, bm1);

    //ADataset.Attributes.ImageData.AssignToBitmap(bm1);
    jpeg1.Assign(bm1);
    stm1 := TMemoryStream.Create;
    jpeg1.SaveToStream(stm1);
    stm1.Position := 0;
    Result := stm1;
  finally
    bm1.Free;
    jpeg1.Free;
  end; }
end;

function TWADOServerCore.SaveToPDF(ADataset: TDicomDataset; rows, columns,
  windowCenter, windowWidth, frameNumber, imageQuality: Integer;
  region: string): TMemoryStream;
begin

end;

function TWADOServerCore.SaveToPNG(ADataset: TDicomDataset; rows, columns,
  windowCenter, windowWidth, frameNumber, imageQuality: Integer;
  region: string): TMemoryStream;
var
  bm1: TBitmap;
  jpeg1: TPngGraphic;
  stm1: TMemoryStream;
begin
  bm1 := TBitmap.Create;
  jpeg1 := TPngGraphic.Create;
  try
    SaveToBitmap(ADataset, rows, columns, windowCenter, windowWidth,
      frameNumber, imageQuality, region, bm1);

    jpeg1.Assign(bm1);
    stm1 := TMemoryStream.Create;
    jpeg1.SaveToStream(stm1);
    stm1.Position := 0;
    Result := stm1;
  finally
    bm1.Free;
    jpeg1.Free;
  end;
end;

procedure TWADOServerCore.SaveToBitmap(ADataset: TDicomDataset; rows,
  columns, windowCenter, windowWidth, frameNumber, imageQuality: Integer;
  region: string; ABitmap: TBitmap;
  vW:Integer=0; vH:Integer=0  );
var v_koeff : Extended; v_height, vTransferSyntax : Integer;
  f1, bm1: TBitmap;
  toberesize: Boolean;
begin
  if (vH > 0) and (vW > 0) and ((vW <> ADataset.Attributes.ImageData.Width)
    or (vH <> ADataset.Attributes.ImageData.Height)) then
  begin
    f1 := TBitmap.Create;
    toberesize := true;
  end
  else
  begin
    f1 := ABitmap;
    toberesize := false;
  end;
  if windowCenter <> 0 then
    ADataset.Attributes.ImageData.WindowCenter := windowCenter;
  if windowWidth <> 0 then
    ADataset.Attributes.ImageData.windowWidth := windowWidth;

  if (frameNumber >= 0) and (frameNumber < ADataset.Attributes.ImageData.FrameCount) then
    ADataset.Attributes.ImageData.FrameIndex := frameNumber;

  DCM_ImageData_Bitmap.AssignToBitmap(ADataset.Attributes.ImageData,f1,false);

  if toberesize then
  begin

    v_koeff := vW / f1.width;
    if Trunc(vH*v_koeff)>f1.height then
    begin
      v_koeff := vH / f1.height;
      if Trunc(vW*v_koeff)>f1.width then
        v_koeff := 1;
    end;

    vW    := Trunc(f1.width*v_koeff);
    vH    := Trunc(f1.height*v_koeff);

    ABitmap.Width := vW;
    ABitmap.Height := vH;
    ABitmap.PixelFormat := f1.PixelFormat;
    ABitmap.Canvas.StretchDraw(Rect(0, 0, vW, vH), f1);
    f1.Free;
  end;   
end;

function TWADOServerCore.GetContentType(AContentType: string): Integer;
var
  strs1: TStringList;
  str1: string;
  i: integer;
begin
  strs1 := TStringList.Create;
  Result := -1;
  try
    if AContentType <> '' then
    begin
      strBreakApart(AContentType, ',', strs1);
      for i := 0 to strs1.Count - 1 do
      begin
        str1 := LowerCase(strs1[i]);

        if str1 <> '' then
        begin
          if Pos('application/dicom', str1) > 0 then
            Result := 0
          else
            if Pos('text/xml', str1) > 0 then //
            Result := 1
          else
            if Pos('application/pdf', str1) > 0 then //
            Result := 2
          else
            if Pos('text/rtf', str1) > 0 then //
            Result := 3
          else
            if Pos('text/plain', str1) > 0 then //
            Result := 4
          else
            if Pos('application/x-hl7-cda-level-one+xml', str1) > 0 then //
            Result := 5
          else
            if Pos('image/gif', str1) > 0 then //
            Result := 6
          else
            if Pos('video/mpeg', str1) > 0 then //
            Result := 7
          else
            if Pos('image/png', str1) > 0 then //
            Result := 8
          else
            if Pos('image/jp2', str1) > 0 then //;level=1
            Result := 9
          else
            if Pos('image/jpeg', str1) > 0 then //;q=0.5  ===  JPEG baseline lossy 8
            Result := 10;
          if Result >= 0 then
            exit;
        end;
      end;
    end;
  finally
    strs1.free;
  end;
  if Result < 0 then
    Result := 10;
end;

procedure TWADOServerCore.DoCommandPOST(ClientThread: THTTPClientThread;
  HeaderInfo: THeaderInfo; var EnableKeepAlive: Boolean);
begin
  inherited;

end;

procedure TWADOServerCore.SetOnFindImageStream(
  const Value: TDicomDatasetsFindExEvent);
begin
  FOnFindImageStream := Value;
end;

{ THeaderInfo }

constructor THeaderInfo.Create;
begin
  ContentLength := 0;
  Raw := '';
  Protocol := '';
  Method := '';
  URI := '';
  PhysPath := '';
  Allow := '';
  AuthType := '';
  //AuthName := '';
  //AuthPass := '';
  Date := '';
  Pragma := '';
  CacheControl := '';
  Connection := '';
  TransferEncoding := '';
  Upgrade := '';
  Via := '';
  Host := '';
  From := '';
  IfMatch := '';
  IfNoneMatch := '';
  IfRange := '';
  IfRange := '';
  IfUnModSince := '';
  MaxForwards := '';
  ProxyAuthorization := '';
  KeepAlive := '';
  PublicCache := '';
  Range := '';
  Referer := '';
  UserAgent := '';
  ContentType := '';
  Accept := '';
  AcceptCharset := '';
  AcceptEncoding := '';
  AcceptLanguage := '';
  Cookie := '';
  ClientName := '';
  QueryString := '';
  HostRootPath := '';
  Weferer := '';
  WserAgent := '';
  CacheInfo := '';
  ProxyConnection := '';
  Forwarded := '';
  ForwardedFor := '';
  All_HTTP := '';
  All_RAW := '';
  PostData := nil;
  Unknown := '';
end;

destructor THeaderInfo.Destroy;
begin
  if PostData <> nil then
    PostData.Free;
  inherited;
end;

procedure THeaderInfo.SetPostData(const Value: TMemoryStream);
begin
  FPostData := Value;
end;

function THTTPClientThread.HeaderText(StatusCode: Integer): string;
var
  Loop: Integer;

begin
  if StatusCode > 404 then
  begin // divide and conquor
    Loop := MaxStatusCodes;
    while StatusCodes[Loop].Code > StatusCode do
      Dec(Loop);
  end
  else
  begin
    Loop := 0;
    while StatusCodes[Loop].Code < StatusCode do
      Inc(Loop);
  end;
  if StatusCodes[Loop].Code = StatusCode then
    Result := IntToStr(StatusCode) + #32 + StatusCodes[Loop].Msg
  else
    Result := '500 Internal Server Error';

end;

procedure THTTPClientThread.AnswerBuffer(const Status, ContType,
  Header: string; ABuffer: Pointer; ABufferCount: Integer);
var
  str1: string;
begin
  str1 := '';
  if Status = '' then
    str1 := str1 + fHeaderInfo.Protocol + ' 200 OK' + #13#10
  else
    str1 := str1 + fHeaderInfo.Protocol + ' ' + Status + #13#10;
  if ContType = '' then
    str1 := str1 + 'Content-Type: text/html' + #13#10
  else
    str1 := str1 + 'Content-Type: ' + ContType + #13#10;
  {FP 22/05/05 begin}
{  if FKeepAlive then
    PutStringInSendBuffer('Connection: Keep-Alive' + #13#10)
  else}
  str1 := str1 + 'Connection: Close' + #13#10;
  {FP 22/05/05 end}
  if not Assigned(ABuffer) then
    str1 := str1 + 'Content-Length: 0' + #13#10
  else
  begin
    str1 := str1 + 'Content-Length: ' +
      IntToStr(ABufferCount) + #13#10;
  end;
  if Header <> '' then
    str1 := str1 + Header;
  str1 := str1 + #13#10;
  Socket.Write(str1);
  if ABuffer <> nil then
  begin
    Socket.Write(ABuffer, ABufferCount);
  end;
end;

initialization
  {$IFDEF SUPPORT_COM}
  CoInitializeEx(nil, COINIT_MULTITHREADED);
  {$ENDIF}
finalization
  {$IFDEF SUPPORT_COM}
  CoUninitialize;
  {$ENDIF}

end.

