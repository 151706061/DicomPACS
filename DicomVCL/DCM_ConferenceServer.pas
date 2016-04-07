{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_ConferenceServer;
{$I DicomPack.inc}
interface

{$DEFINE NO_DEBUG_LOG}

uses
  {$IFNDEF LINUX}
  Windows,
  {$ENDIF}
  Classes,
  KXString,
  KXServerCore, DCM_Wado,
  KXSecurity, Graphics, cnsmsg, SysUtils, ExtCtrls, forms, DIALOGS,
  KxSock, KXSockClient, DCM_Connection, DCM_Attributes, dcm_client, DCM_UID;

const
  MaxConferenceMessagesCount = 64;
  ReserveBufferCount = 128;

  DefaultProxyPort = 80;
  {$IFDEF DELPHI1}
  { Delphi 1 has a 255 characters string limitation }
  HTTP_RCV_BUF_SIZE = 255;
  HTTP_SND_BUF_SIZE = 8193;
  {$ELSE}
  HTTP_RCV_BUF_SIZE = 8193;
  HTTP_SND_BUF_SIZE = 8193;
  {$ENDIF}
  //WM_HTTP_REQUEST_DONE = WM_USER + 1;
  //WM_HTTP_SET_READY    = WM_USER + 2;
  //WM_HTTP_LOGIN        = WM_USER + 3;
  { EHttpException error code }
  httperrNoError = 0;
  httperrBusy = 1;
  httperrNoData = 2;
  httperrAborted = 3;
  httperrOverflow = 4;
  httperrVersion = 5;
  httperrInvalidAuthState = 6;
  httperrSslHandShake = 7;

type
  TDynamicArray = array of Integer;

  THttpBigInt = Int64;

  TBytes = array of Byte;

  TDataAvailable = procedure(Sender: TObject; ErrCode: Word) of object;

  THttpEncoding = (encUUEncode, encBase64, encMime);
  THttpRequest = (httpABORT, httpGET, httpPOST, httpPUT,
    httpHEAD, httpCLOSE);

  THttpState = (httpReady, httpNotConnected, httpConnected,
    httpWaitingHeader, httpWaitingBody, httpBodyReceived,
    httpWaitingProxyConnect,
    httpClosing, httpAborting);

  THttpChunkState = (httpChunkGetSize, httpChunkGetExt, httpChunkGetData,
    httpChunkSkipDataEnd, httpChunkDone);
  {$IFDEF UseNTLMAuthentication}
  THttpNTLMState = (ntlmNone, ntlmMsg1, ntlmMsg2, ntlmMsg3, ntlmDone);
  {$ENDIF}
  THttpBasicState = (basicNone, basicMsg1, basicDone);
  THttpAuthType = (httpAuthNone, httpAuthBasic, httpAuthNtlm);

  TOnCommand = procedure(Sender: TObject;
    var S: string) of object;
  TDocDataEvent = procedure(Sender: TObject;
    {$IFDEF CLR}
    var Buffer: TBytes;
    Offset: Integer;
    {$ELSE}
    Buffer: Pointer;
    {$ENDIF}
    Len: Integer) of object;
  TCookieRcvdEvent = procedure(Sender: TObject;
    const Data: string;
    var Accept: Boolean) of object;
  THttpRequestDone = procedure(Sender: TObject;
    RqType: THttpRequest;
    ErrCode: Word) of object;
  TBeforeHeaderSendEvent = procedure(Sender: TObject;
    const Method: string;
    Headers: TStrings) of object;
  THttpCliOption = (httpoNoBasicAuth, httpoNoNTLMAuth, httpoBandwidthControl
    {$IFDEF UseContentCoding}
    , httpoEnableContentCoding, httpoUseQuality
    {$ENDIF}
    );
  THttpCliOptions = set of THttpCliOption;
  TLocationChangeExceeded = procedure(Sender: TObject;
    const RelocationCount: integer;
    var AllowMoreRelocations: Boolean) of object; {  V1.90 }

  TDcmConferenceMessage = class
  private
    FLockCount: integer;
    FSemaphore: THandle;

    fType: Integer;
    fConferenceID: Integer;

    fPath: string;
    fUserID: Integer;
    fFromConnectionID: Integer;
    fToConnectionID: Integer;

    fWidth: Integer;
    fHeight: Integer;
    FBufferCount: Integer;
    FVideoBuffer: Pointer;

    FDataset: TDicomAttributes;
    procedure SetBufferCount(const Value: Integer);
    function GetIsLocked: boolean;
    procedure SetDataset(const Value: TDicomAttributes);

  protected

  public
    constructor Create;
    destructor Destroy; override;
    procedure CopyVideoBuffer(ABuffer: Pointer; ABufferCount: Integer);

    procedure Lock;
    procedure Unlock;
    procedure TryLock(TimeOut: DWORD);

    property IsLocked: boolean read GetIsLocked;
    property VideoBuffer: Pointer read FVideoBuffer;
    property BufferCount: Integer read FBufferCount write SetBufferCount;
    property Dataset: TDicomAttributes read FDataset write SetDataset;
  published

  end;
  TDCMConferenceServerServerCore = class;
  TDCMConferenceServerClientThread = class;
  TDcmConferenceUserInfo = class;

  TOnConferenceCommandEvent = procedure(ClientThread: TDCMConferenceServerClientThread;
    HeaderInfo: THeaderInfo; ARequestDataset: TDicomAttributes) of object;
  TOnConferenceMessageEvent = procedure(ClientThread: TDCMConferenceServerClientThread;
    ASendFrom, ASendTo: Integer; ARequestDataset: TDicomAttributes) of object;

  TDCMConferenceServerClientThread = class(THTTPClientThread)
  private
    //fConferenceMessages: TThreadList;
    FOnConferenceMessage: TOnConferenceMessageEvent;
    FOnConferenceMessageOffline: TOnConferenceMessageEvent;
    FOnClientLogout: TNotifyEvent;

    procedure SetOnConferenceMessage(
      const Value: TOnConferenceMessageEvent);
    procedure SetOnConferenceMessageOffline(
      const Value: TOnConferenceMessageEvent);
    procedure SetOnClientLogout(const Value: TNotifyEvent);

  protected
    procedure ProcessData; override;
  public
    constructor Create(CreateSuspended: Boolean); override;
    destructor Destroy; override;

    //procedure AddMessage_(AValue: TDcmConferenceMessage);
    //function AnswerMessage: Integer;

    function FindClient(AID: Integer): TDcmConferenceUserInfo; overload;
    function FindClient(AID: TDCMConferenceServerClientThread): TDcmConferenceUserInfo; overload;
    function FindClient(AUserCode: string): TDcmConferenceUserInfo; overload;
    function FindClientByUserID(AUserID: Integer): TDcmConferenceUserInfo;

    procedure SendMessageTo(AConferenceID, AConnectionID: Integer; ADataset: TDicomAttributes);
    procedure SendBufferTo(AType, AConferenceID, AConnectionID: Integer; ABuffer: Pointer; AStart, ACount: Integer);

    procedure SendMessageToUserID(AConferenceID, AUserID: Integer; ADataset: TDicomAttributes);
    procedure SendBufferToUserID(AType, AConferenceID, AUserID: Integer; ABuffer: Pointer; AStart, ACount: Integer);

    procedure AnswerDataset(AType, AConferenceID, AConnectionID: Integer; ADataset: TDicomAttributes);
    procedure AnswerVideoBuffer(AType, AConferenceID, AConnectionID: Integer; ABuffer: Pointer; ABufferCount: Integer);

    property OnClientLogout: TNotifyEvent read FOnClientLogout write SetOnClientLogout;
    property OnConferenceMessage: TOnConferenceMessageEvent read FOnConferenceMessage write SetOnConferenceMessage;
    property OnConferenceMessageOffline: TOnConferenceMessageEvent read FOnConferenceMessageOffline write SetOnConferenceMessageOffline;
  end;

  TDCMConferenceServerServerCore = class(TKXHTTPServerCore)
  private
    fConferences: TThreadList;
    fAllUser: TThreadList;

    FOnConferenceCommand: TOnConferenceCommandEvent;
    FOnConferenceMessage: TOnConferenceMessageEvent;
    FOnConferenceMessageOffline: TOnConferenceMessageEvent;
    FOnClientLogout: TNotifyEvent;
    procedure SetOnConferenceCommand(const Value: TOnConferenceCommandEvent);
    procedure SetOnConferenceMessage(const Value: TOnConferenceMessageEvent);
    procedure SetOnConferenceMessageOffline(const Value: TOnConferenceMessageEvent);
    function FindConference(AID: Integer): TDCMConferenceUserInfo;
    procedure SetOnClientLogout(const Value: TNotifyEvent);
  protected
    procedure DoCommandPOST(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo; var
      EnableKeepAlive: Boolean); override;
    procedure DoCommandGET(ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo; var
      EnableKeepAlive: Boolean); override;

    procedure DoClientMessageSave(ClientThread: TDCMConferenceServerClientThread;
      ASendFrom, ASendTo: Integer; ARequestDataset: TDicomAttributes);
    procedure DoClientMessageSaveOffline(ClientThread: TDCMConferenceServerClientThread;
      ASendFrom, ASendTo: Integer; ARequestDataset: TDicomAttributes);
    procedure DoNewConnection(ClientThread: TKXClientThread); override;
    procedure DoClientLogout(Sender: TObject);
    procedure Logit(AIP, Msg: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function SetConferenceSpeaker(AID: Integer; AName: string; AHandleID: Integer): Integer;

    function FindClient(AID: TDCMConferenceServerClientThread): TDcmConferenceUserInfo; overload;
    function FindClient(AID: Integer): TDcmConferenceUserInfo; overload;
    function FindClientByUserID(AUserID: Integer): TDcmConferenceUserInfo; overload;
    function FindClient(AUserCode: string): TDcmConferenceUserInfo; overload;

    procedure ClearUserData;
    property AllUser: TThreadList read fAllUser;
  published
    property ServerPort;

    property OnClientLogout: TNotifyEvent read FOnClientLogout write SetOnClientLogout;
    property OnConferenceMessage: TOnConferenceMessageEvent read FOnConferenceMessage write SetOnConferenceMessage;
    property OnConferenceMessageOffline: TOnConferenceMessageEvent read FOnConferenceMessageOffline write SetOnConferenceMessageOffline;
    property OnConferenceCommand: TOnConferenceCommandEvent read FOnConferenceCommand write SetOnConferenceCommand;
  end;
  TOnCreateVideoConferenceFormEvent = procedure(Sender: TObject; AUser: TDcmConferenceUserInfo; var AForm: TForm) of object;
  TDcmConferenceUserInfo = class
  private
    FUserID: Integer;
    FIconIndex: Integer;
    FIPAddress: string;
    FEMail: string;
    FGroupName: string;
    FUserName: string;
    FUserCode: string;
    FDialogForm: TForm;
    FConnectionID: Integer;
    FMobil: string;
    FPassword: string;
    function GetIsOnline: Boolean;
    procedure SetEMail(const Value: string);
    procedure SetGroupName(const Value: string);
    procedure SetIconIndex(const Value: Integer);
    procedure SetIPAddress(const Value: string);
    procedure SetUserID(const Value: Integer);
    procedure SetUserName(const Value: string);
    procedure SetUserCode(const Value: string);
    procedure SetDialogForm(const Value: TForm);
    procedure SetConnectionID(const Value: Integer);
    procedure SetMobil(const Value: string);
    procedure SetPassword(const Value: string);

  protected

  public
    Client: TDCMConferenceServerClientThread;

    constructor Create;
    destructor Destroy; override;

    property IsOnline: Boolean read GetIsOnline;

    property DialogForm: TForm read FDialogForm write SetDialogForm;
    property ConnectionID: Integer read FConnectionID write SetConnectionID;
    property UserID: Integer read FUserID write SetUserID;
    property UserCode: string read FUserCode write SetUserCode;
    property UserName: string read FUserName write SetUserName;
    property IconIndex: Integer read FIconIndex write SetIconIndex;
    property GroupName: string read FGroupName write SetGroupName;
    property IPAddress: string read FIPAddress write SetIPAddress;
    property EMail: string read FEMail write SetEMail;
    property Mobil: string read FMobil write SetMobil;
    property Password: string read FPassword write SetPassword;
  published

  end;
  TDCMConferenceClient = class;

  TOnConferenceDatasetAvailableEvent = procedure(ClientThread: TDCMConferenceClient;
    HeaderInfo: THeaderInfo;
    ARequestDataset: TDicomAttributes) of object;

  TOnConferenceDataAvailableEvent = procedure(ClientThread: TDCMConferenceClient;
    HeaderInfo: THeaderInfo;
    ABuffer: Pointer; ABufferCount: Integer) of object;

  TDCMConferenceClientThread = class(TThread)
  private
    fConferenceClient: TDCMConferenceClient;
    procedure SetConferenceClient(const Value: TDCMConferenceClient);
  protected
    procedure Execute; override;
    procedure QueryServer;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    property ConferenceClient: TDCMConferenceClient read FConferenceClient write SetConferenceClient;
  end;

  TDCMConferenceClient = class(TComponent)
  private
    FLockCount: integer;
    FSemaphore: THandle;

    FSocket: TKXSockClient;

    fDataThread: TDCMConferenceClientThread;

    fRefreshTimer: TTimer;
    FRefreshFriendListInterval: Integer;
    FRefreshFriendListTimeout: Integer;
    fNopCount: Integer;

    //fConferenceMessages: TThreadList;

    fFriendList: TList;
    fConferenceList: TList;
    fGroupNames: TStringList;

    FPort: Integer;
    FHost: string;
    FReceiveTimeout: Integer;

    FPath: string;
    FSender: string;
    FReference: string;
    FCurrConnection: string;
    FCookie: string;
    FContentRangeBegin: string;
    FContentRangeEnd: string;
    FAcceptRanges: string;

    FCurrProxyConnection: string;
    FProxyAuthBasicState: THttpBasicState;
    FProxyUsername: string;
    FProxyPassword: string;

    FAgent: string;
    FAccept: string;
    FAcceptLanguage: string;

    FContentPost: string; { Also used for PUT }
    FNoCache: Boolean;

    FAuthBasicState: THttpBasicState;
    FCurrUsername: string;
    FCurrPassword: string;

    fWaitForCommand: string;
    fWaitForDatasets: TDicomAttributes;

    FModifiedSince: TDateTime; { Warning ! Use GMT date/Time }

    fSendBufferCount: Integer;
    FOnVideoDataAvailable: TOnConferenceDataAvailableEvent;
    FOnMouseDataAvailable: TOnConferenceDataAvailableEvent;
    FOnCanvasDataAvailable: TOnConferenceDataAvailableEvent;
    FOnAudioDataAvailable: TOnConferenceDataAvailableEvent;
    FOnDatasetAvailable: TOnConferenceDatasetAvailableEvent;
    FOnCreateVideoConferenceForm: TOnCreateVideoConferenceFormEvent;
    FOnSocketDisconnect: TNotifyEvent;
    FOnConferenceRefreshFriends: TNotifyEvent;

    function GetConnected: Boolean;
    procedure SetConnected(const Value: Boolean);
    procedure SetHost(const Value: string);
    procedure SetPort(const Value: Integer);
    procedure SetReceiveTimeout(const Value: Integer);
    procedure SetOnAudioDataAvailable(const Value: TOnConferenceDataAvailableEvent);
    procedure SetOnCanvasDataAvailable(const Value: TOnConferenceDataAvailableEvent);
    procedure SetOnDatasetAvailable(const Value: TOnConferenceDatasetAvailableEvent);
    procedure SetOnMouseDataAvailable(const Value: TOnConferenceDataAvailableEvent);
    procedure SetOnVideoDataAvailable(const Value: TOnConferenceDataAvailableEvent);
    function GetIsLocked: boolean;
    procedure SetCnsErrorMessage(const Value: string);
    procedure SetMaxTimerInterval(const Value: Integer);
    procedure SetOnCreateVideoConferenceForm(
      const Value: TOnCreateVideoConferenceFormEvent);
    function GetFriend(index: Integer): TDcmConferenceUserInfo;
    function GetFriendCount: Integer;
    procedure SetOnSocketDisconnect(const Value: TNotifyEvent);
    procedure SetOnConferenceRefreshFriends(const Value: TNotifyEvent);
    procedure SetRefreshFriendListInterval(const Value: Integer);
    procedure NOP;
  protected
    fReceivedHeaderInfo: THeaderInfo;
    fUserID: Integer;
    fUserName: string;
    FCnsErrorMessage: string;
    FMaxTimerInterval: Integer;
    fConnectionID: integer;
    fUserCode: string;
    fPassword: string;

    //procedure AddMessage(AValue: TDcmConferenceMessage);
    //function AnswerMessage: Boolean;

    procedure DoRefreshTimer(Sender: TObject);

    procedure SendRequest(const Method, Version: string);
    procedure ProcessData;

    {procedure AddPostDataset(Apath: string; AType, AConferenceID, AConnectionID: Integer;
      ADataset: TDicomAttributes);
    //$10 dataset commucation with server
    //$60 direct transfer to  AConnectionIDs (max 15) no anwser
    procedure AddUploadVideo(AType, AConferenceID, AConnectionID: Integer;
      ABuffer: Pointer; ABufferCount: Integer; AWidth, AHeight: Integer);
    //direct transfer to  AConnectionIDs (max 15)
    //$20 video
    //$21 Audio
    //$22 Mouse
    //$23 Jpeg image
    //$24 File }

    function QueryServer: Boolean;
    procedure OnDataThreamTerminate(Sender: TObject);

    function PostDatasetEx(Apath: string; AType, AConferenceID: Integer;
      AConnectionIDs: array of Integer; ADataset: TDicomAttributes): TDicomAttributes;
    //$10 dataset commucation with server
    //$60 direct transfer to  AConnectionIDs (max 15) no anwser
    function Get(APath: string): Boolean;
    function Post(APath: string; AStm: TStream): Boolean; overload;
    function Post(APath: string; ABuffer: Pointer; ACount: Integer): Boolean; overload;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure StartListen;
    procedure StopListen;

    procedure ClearFriends;
    procedure ClearConferences;
    procedure RefreshUsers;

    procedure DoSendMessage(Sender: TObject; AConferenceID: Integer; AUserID: array of Integer;
      ADataset: TDicomAttributes);
    function SendToAllDialogUsers(ADataset: TDicomAttributes): Boolean;

    procedure PostDataset(Apath: string; AType, AConferenceID: Integer;
      AConnectionIDs: array of Integer; ADataset: TDicomAttributes);

    procedure UploadVideo(AType, AConferenceID: Integer; AConnectionIDs: array of Integer;
      ABuffer: Pointer; ABufferCount: Integer; AWidth, AHeight: Integer);
    //direct transfer to  AConnectionIDs (max 15)
    //$20 video
    //$21 Audio
    //$22 Mouse
    //$23 Jpeg image
    //$24 File
    procedure StartDialog(Value: TDcmConferenceUserInfo);

    procedure AddConference(Value: TDcmConferenceUserInfo);
    function FindConference(AConferenceID: Integer): TDcmConferenceUserInfo;
    procedure RemoveConference(Value: TDcmConferenceUserInfo);

    procedure AddDialogUser(Value: TDcmConferenceUserInfo);
    function FindDialogByUserID(AUserID: Integer): TDcmConferenceUserInfo;
    function FindDialogByConnectionID(AConnectionID: Integer): TDcmConferenceUserInfo;
    function FindDialogByUserCode(AUserCode: string): TDcmConferenceUserInfo;

    function Login(AUserCode, APassword: string): Boolean;

    function GetFriendConnectionID(AUserID: Integer; AUserCode: string): Integer; //start dialog
    function GetConferenceID: Integer;
    function RegisterConferenceSpeakerName(AConferenceID: Integer): Integer;
    function UnRegisterConferenceSpeakerName(AConferenceID, AHandleID: Integer): Integer;

    procedure Lock;
    procedure Unlock;
    procedure TryLock(TimeOut: DWORD);

    property IsLocked: boolean read GetIsLocked;

    property Connected: Boolean read GetConnected write SetConnected;

    property ReceivedHeaderInfo: THeaderInfo read fReceivedHeaderInfo;
    property UserID: Integer read fUserID;
    property UserCode: string read fUserCode;
    property UserName: string read fUserName;

    property FriendsCount: Integer read GetFriendCount;
    property Friends[index: Integer]: TDcmConferenceUserInfo read GetFriend;
    property CnsErrorMessage: string read FCnsErrorMessage write SetCnsErrorMessage;
  published
    property Host: string read FHost write SetHost;
    property Port: Integer read FPort write SetPort;
    property ReceiveTimeout: Integer read FReceiveTimeout write SetReceiveTimeout;
    property RefreshFriendListInterval: Integer read FRefreshFriendListInterval write SetRefreshFriendListInterval;
    property MaxTimerInterval: Integer read FMaxTimerInterval write SetMaxTimerInterval;

    property OnSocketDisconnect: TNotifyEvent read FOnSocketDisconnect write SetOnSocketDisconnect;
    property OnCreateVideoConferenceForm: TOnCreateVideoConferenceFormEvent read FOnCreateVideoConferenceForm write SetOnCreateVideoConferenceForm;
    property OnDatasetAvailable: TOnConferenceDatasetAvailableEvent read FOnDatasetAvailable write SetOnDatasetAvailable;
    property OnVideoDataAvailable: TOnConferenceDataAvailableEvent read FOnVideoDataAvailable write SetOnVideoDataAvailable;
    property OnAudioDataAvailable: TOnConferenceDataAvailableEvent read FOnAudioDataAvailable write SetOnAudioDataAvailable;
    property OnMouseDataAvailable: TOnConferenceDataAvailableEvent read FOnMouseDataAvailable write SetOnMouseDataAvailable;
    property OnCanvasDataAvailable: TOnConferenceDataAvailableEvent read FOnCanvasDataAvailable write SetOnCanvasDataAvailable;

    property OnConferenceRefreshFriends: TNotifyEvent read FOnConferenceRefreshFriends write SetOnConferenceRefreshFriends;
  end;

procedure ReplaceExt(var FName: string; const newExt: string);
function EncodeStr(Encoding: THttpEncoding; const Value: string): string;
function RFC1123_Date(aDate: TDateTime): string;
function RFC1123_StrToDate(aDate: string): TDateTime;
{$IFDEF WIN32}
function EncodeLine(
  Encoding: THttpEncoding;
  SrcData: PChar;
  Size: Integer): string;
{$ENDIF}

{ Syntax of an URL: protocol://[user[:password]@]server[:port]/path }
procedure ParseURL(const URL: string;
  var Proto, User, Pass, Host, Port, Path: string);
function Posn(const s, t: string; count: Integer): Integer;
function UrlEncode(S: string): string;
function UrlDecode(S: string): string;
function IsDigit(Ch: Char): Boolean;
function IsXDigit(Ch: char): Boolean;
function XDigit(Ch: char): Integer;
{$IFDEF CLR}
function htoi2(Ch1, Ch2: Char): Integer;
{$ELSE}
function htoin(value: PChar; len: Integer): Integer;
function htoi2(value: PChar): Integer;
{$ENDIF}

var
  ConferenceStringHostCanNotConnect: string;
  ConferenceStringCanNotCreateDialog: string;
  ConferenceStringClientIsNotConnect: string;

implementation

uses VideoConferenceBaseForm, KXSocket;

const
  bin2uue: string = '`!"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_';
  bin2b64: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  uue2bin: string = ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_ ';
  b642bin: string = '~~~~~~~~~~~^~~~_TUVWXYZ[\]~~~|~~~ !"#$%&''()*+,-./0123456789~~~~~~:;<=>?@ABCDEFGHIJKLMNOPQRS';
  linesize = 45;
type
  TCharSet = set of AnsiChar;
const
  UriProtocolSchemeAllowedChars: TCharSet = ['a'..'z', '0'..'9', '+', '-', '.'];

  { TDCMConferenceServerClientThread }

constructor TDCMConferenceServerClientThread.Create(
  CreateSuspended: Boolean);
begin
  inherited;
  //fConferenceMessages := TThreadList.Create;
end;

destructor TDCMConferenceServerClientThread.Destroy;
{var
  i: Integer;
  l1: TList;}
begin
  if assigned(FOnClientLogout) then
    FOnClientLogout(self);

  {l1 := fConferenceMessages.LockList;
  try
    for i := 0 to l1.Count - 1 do
      TDcmConferenceMessage(l1[i]).Free;
    l1.Clear;
  finally
    fConferenceMessages.UnlockList;
  end;
  fConferenceMessages.Free; }
  inherited;
end;

function TDCMConferenceServerClientThread.FindClient(
  AID: TDCMConferenceServerClientThread): TDcmConferenceUserInfo;
begin
  Result := TDCMConferenceServerServerCore(Server).FindClient(AID);
end;

function TDCMConferenceServerClientThread.FindClient(
  AID: Integer): TDcmConferenceUserInfo;
begin
  Result := TDCMConferenceServerServerCore(Server).FindClient(AID);
end;

function TDCMConferenceServerClientThread.FindClientByUserID(
  AUserID: Integer): TDcmConferenceUserInfo;
begin
  Result := TDCMConferenceServerServerCore(Server).FindClientByUserID(AUserID);
end;

function TDCMConferenceServerClientThread.FindClient(
  AUserCode: string): TDcmConferenceUserInfo;
begin
  Result := TDCMConferenceServerServerCore(Server).FindClient(AUserCode);
end;

procedure TDCMConferenceServerClientThread.ProcessData;
begin
  inherited;

end;

procedure TDCMConferenceServerClientThread.SendBufferTo(AType,
  AConferenceID, AConnectionID: Integer; ABuffer: Pointer; AStart, ACount: Integer);
var
  n1, n2: TDcmConferenceUserInfo;
  p1: PByte;
  das1: TDicomAttributes;
begin
  if (ABuffer <> nil) then
  begin
    n1 := FindClient(AConnectionID);
    n2 := FindClient(self);
    if (n1 <> nil) then
    begin
      p1 := ABuffer;
      if AStart > 0 then
        inc(p1, AStart);

      n1.Client.AnswerVideoBuffer($20 + AType, AConferenceID, n2.UserID, p1, ACount);

    end
    else
    begin
      das1 := TDicomAttributes.Create;
      try
        das1.AddVariant($2817, $4, 'SYSTEM');
        das1.AddVariant($2817, $1, AConnectionID);
        das1.AddVariant($2817, $6, 'OFFLINE');
        das1.AddVariant($2817, $5, -2);

        AnswerDataset($10, AConferenceID, n2.UserID, das1);
      finally
        das1.free;
      end;
    end;
  end;
end;

procedure TDCMConferenceServerClientThread.SendBufferToUserID(AType,
  AConferenceID, AUserID: Integer; ABuffer: Pointer; AStart, ACount: Integer);
var
  n1, n2: TDcmConferenceUserInfo;
  p1: PByte;
  das1: TDicomAttributes;
begin
  if (ABuffer <> nil) then
  begin
    n1 := FindClientByUserID(AUserID);
    n2 := FindClient(self);
    if (n1 <> nil) then
    begin
      p1 := ABuffer;
      if AStart > 0 then
        inc(p1, AStart);

      n1.Client.AnswerVideoBuffer($20 + AType, AConferenceID, n2.UserID, p1, ACount);

    end
    else
    begin
      das1 := TDicomAttributes.Create;
      try
        das1.AddVariant($2817, $4, 'SYSTEM');
        das1.AddVariant($2817, $2, AUserID);
        das1.AddVariant($2817, $6, 'OFFLINE');
        das1.AddVariant($2817, $5, -2);

        AnswerDataset($10, AConferenceID, AUserID, das1);
      finally
        das1.free;
      end;
    end;
  end;
end;

procedure TDCMConferenceServerClientThread.AnswerDataset(AType,
  AConferenceID, AConnectionID: Integer; ADataset: TDicomAttributes);
var
  stm1: TMemoryStream;
  SendStm1: TDicomKXSocketStream;
  str1: string;
  i: Integer;
begin
  SendStm1 := TDicomKXSocketStream.Create(Socket);

  Stm1 := TMemoryStream.Create;
  try
    ADataset.Write(stm1, 8193, 100);

    str1 := '';
    str1 := str1 + fHeaderInfo.Protocol + ' 200 OK' + #13#10;
    str1 := str1 + 'Content-Type: application/dicom' + #13#10;
    //str1 := str1 + 'Connection: Close' + #13#10;
    str1 := str1 + 'Content-Length: ' + IntToStr(stm1.Size + ReserveBufferCount) + #13#10;
    str1 := str1 + #13#10;

    SendStm1.WriteString(str1);

    SendStm1.WriteBuffer(@AType, 4); //$10
    SendStm1.WriteBuffer(@AConferenceID, 4);

    SendStm1.WriteBuffer(@AConnectionID, 4);
    for i := 0 to (ReserveBufferCount div 4) - 4 do
    begin
      SendStm1.WriteInt32(0);
    end;
    SendStm1.WriteBuffer(stm1.Memory, stm1.Size);

    SendStm1.FreshData;
  finally
    stm1.Free;
    SendStm1.Free;
  end;
end;

procedure TDCMConferenceServerClientThread.SendMessageTo(
  AConferenceID, AConnectionID: Integer; ADataset: TDicomAttributes);
var
  n1, n2: TDcmConferenceUserInfo;
  das1: TDicomAttributes;
begin
  if (ADataset <> nil) then
  begin
    n1 := FindClient(AConnectionID);
    n2 := FindClient(self);
    if (n1 <> nil) then
    begin
      if assigned(FOnConferenceMessage) then
        FOnConferenceMessage(self, ConnectionID, AConnectionID, ADataset);

      n1.Client.AnswerDataset($10, AConferenceID, n2.UserID, ADataset);

    end
    else
    begin //if the friend offline, tell him
      if assigned(FOnConferenceMessageOffline) then
        FOnConferenceMessageOffline(self, ConnectionID, AConnectionID, ADataset);

      das1 := TDicomAttributes.Create;
      try
        das1.AddVariant($2817, $4, 'SYSTEM');
        das1.AddVariant($2817, $1, AConnectionID);
        das1.AddVariant($2817, $6, 'OFFLINE');
        das1.AddVariant($2817, $5, -2);
        das1.Add($2817, $1000).AddData(CopyAttributes(ADataset));

        AnswerDataset($10, AConferenceID, n2.UserID, das1);
      finally
        das1.free;
      end;
    end;
  end;
end;

procedure TDCMConferenceServerClientThread.SendMessageToUserID(
  AConferenceID, AUserID: Integer; ADataset: TDicomAttributes);
var
  n1, n2: TDcmConferenceUserInfo;
  das1: TDicomAttributes;
begin
  if (ADataset <> nil) then
  begin
    n1 := FindClientByUserID(AUserID);
    n2 := FindClient(self);
    if (n1 <> nil) then
    begin
      if assigned(FOnConferenceMessage) then
        FOnConferenceMessage(self, ConnectionID, n1.ConnectionID, ADataset);

      n1.Client.AnswerDataset($10, AConferenceID, n2.UserID, ADataset);

    end
    else
    begin //if the friend offline, tell him
      if assigned(FOnConferenceMessageOffline) then
        FOnConferenceMessageOffline(self, AConferenceID, AUserID, ADataset);

      das1 := TDicomAttributes.Create;
      try
        das1.AddVariant($2817, $4, 'SYSTEM');
        das1.AddVariant($2817, $2, AUserID);
        das1.AddVariant($2817, $6, 'OFFLINE');
        das1.AddVariant($2817, $5, -2);
        das1.Add($2817, $1000).AddData(CopyAttributes(ADataset));

        AnswerDataset($10, AConferenceID, AUserID, das1);
      finally
        das1.free;
      end;
    end;
  end;
end;

procedure TDCMConferenceServerClientThread.AnswerVideoBuffer(AType,
  AConferenceID, AConnectionID: Integer; ABuffer: Pointer; ABufferCount: Integer);
var
  SendStm1: TDicomKXSocketStream;
  str1: string;
  i: integer;
begin
  SendStm1 := TDicomKXSocketStream.Create(Socket, false);
  try

    str1 := '';
    str1 := str1 + fHeaderInfo.Protocol + ' 200 OK' + #13#10;
    str1 := str1 + 'Content-Type: application/dicom' + #13#10;
    //str1 := str1 + 'Connection: Close' + #13#10;
    str1 := str1 + 'Content-Length: ' + IntToStr(ABufferCount + ReserveBufferCount) + #13#10;
    str1 := str1 + #13#10;

    SendStm1.WriteString(str1);

    SendStm1.WriteBuffer(@AType, 4);
    SendStm1.WriteBuffer(@AConferenceID, 4);

    SendStm1.WriteBuffer(@AConnectionID, 4);
    for i := 0 to (ReserveBufferCount div 4) - 4 do
    begin
      SendStm1.WriteInt32(0);
    end;

    SendStm1.WriteBuffer(ABuffer, ABufferCount);

    SendStm1.FreshData;
  finally
    SendStm1.Free;
  end;
end;

{procedure TDCMConferenceServerClientThread.AddMessage_(AValue: TDcmConferenceMessage);
var
  l1: TList;
begin
  l1 := fConferenceMessages.LockList;
  try
    l1.Add(AValue);

    if l1.Count > MaxConferenceMessagesCount then
    begin
      l1.Delete(0);
    end;
  finally
    fConferenceMessages.UnlockList;
  end;
end;

function TDCMConferenceServerClientThread.AnswerMessage: Integer;
var
  v1: TDcmConferenceMessage;
  das1: TDicomAttributes;
  l1: TList;
begin
  v1 := nil;
  l1 := fConferenceMessages.LockList;
  try
    Result := l1.Count;
    if l1.Count > 0 then
    begin
      v1 := TDcmConferenceMessage(l1[0]);
      l1.Delete(0);
    end;
  finally
    fConferenceMessages.UnlockList
  end;
  if v1 <> nil then
  begin
    try
      if v1.FVideoBuffer <> nil then
        AnswerVideoBuffer($20, v1.fConferenceID, v1.fUserID, v1.VideoBuffer, v1.BufferCount)
      else
        if v1.Dataset <> nil then
      begin
        AnswerDataset($10, v1.fConferenceID, v1.fUserID, v1.Dataset);
      end;
    finally
      v1.Free;
    end;
  end
  else
  begin
    das1 := TDicomAttributes.Create;
    try
      das1.AddVariant($2817, $5, 1);
      das1.AddVariant($2817, $6, 'OK');
      AnswerDataset($90, 0, 0, das1);
    finally
      das1.Free;
    end;
  end;
end;}

procedure TDCMConferenceServerClientThread.SetOnConferenceMessage(
  const Value: TOnConferenceMessageEvent);
begin
  FOnConferenceMessage := Value;
end;

procedure TDCMConferenceServerClientThread.SetOnConferenceMessageOffline(
  const Value: TOnConferenceMessageEvent);
begin
  FOnConferenceMessageOffline := Value;
end;

procedure TDCMConferenceServerClientThread.SetOnClientLogout(
  const Value: TNotifyEvent);
begin
  FOnClientLogout := Value;
end;

{ TDCMConferenceServerServerCore }

constructor TDCMConferenceServerServerCore.Create(AOwner: TComponent);
begin
  inherited;
  ServerPort := 1060;

  SocketOutputBufferSize := bsfHUGE;
  ThreadCacheSize := DefaultThreadCacheSize;
  ListenerThreadPriority := tpHigher;
  SpawnedThreadPriority := tpHigher;
  UseThreadPool := false;

  Timeout := 30000;
  TKXXferTimeout := 500;

  fConferences := TThreadList.Create;
  fAllUser := TThreadList.Create;

  fcClientThreadClass := TDCMConferenceServerClientThread;
end;

destructor TDCMConferenceServerServerCore.Destroy;
var
  i: Integer;
  l1: TList;
begin
  l1 := fConferences.LockList;
  try
    for i := 0 to l1.Count - 1 do
      TDcmConferenceUserInfo(l1[i]).Free;
    l1.Clear;
  finally
    fConferences.UnlockList;
  end;
  fConferences.Free;

  l1 := fAllUser.LockList;
  try
    for i := 0 to l1.Count - 1 do
      TDcmConferenceUserInfo(l1[i]).Free;
    l1.Clear;
  finally
    fAllUser.UnlockList;
  end;
  fAllUser.Free;
  inherited;
end;

procedure TDCMConferenceServerServerCore.ClearUserData;
var
  i: Integer;
  l1: TList;
begin
  l1 := fAllUser.LockList;
  try
    for i := 0 to l1.Count - 1 do
      TDcmConferenceUserInfo(l1[i]).Free;
    l1.Clear;
  finally
    fAllUser.UnlockList;
  end;
end;

procedure TDCMConferenceServerServerCore.DoCommandGET(
  ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo;
  var EnableKeepAlive: Boolean);
//var
//  cli1: TDCMConferenceServerClientThread;
begin
  if HeaderInfo.URI = '/CLOSE' then
  begin
    EnableKeepAlive := false;
    //if assigned(FOnClientLogout) then
    //  FOnClientLogout(ClientThread);
    //ClientThread.AnswerString('', '', '', 'OK');
  end
  else
  begin
    //cli1 := TDCMConferenceServerClientThread(ClientThread);
    //cli1.AnswerMessage;
    EnableKeepAlive := true;
  end;
  ClientThread.AnswerString('', '', '', 'OK');
  inherited;
end;

procedure TDCMConferenceServerServerCore.DoCommandPOST(
  ClientThread: THTTPClientThread; HeaderInfo: THeaderInfo;
  var EnableKeepAlive: Boolean);
var
  id1, k: Integer;
  pb1: PInteger;
  pi1: PInteger;
  pb2: PByte;
  das1: TDicomAttributes;
  cli1, n1: TDCMConferenceServerClientThread;
  //  str1: string;
  //strs1: TStringList;
  l1: TList;
  i, conID1, CmdType: Integer;
  v1: TDcmConferenceMessage;
begin
  cli1 := TDCMConferenceServerClientThread(ClientThread);
  if assigned(HeaderInfo.PostData) then
  begin
    EnableKeepAlive := true;
    HeaderInfo.PostData.Position := 0;
    pb1 := HeaderInfo.PostData.Memory;
    CmdType := pb1^;
    case CmdType of
      $10: //command: login, sql,find friend, send message to client...
        begin
          if HeaderInfo.PostData.Size > ReserveBufferCount then
          begin
            das1 := TDicomAttributes.Create;
            try
              das1.ReadData(ReserveBufferCount, HeaderInfo.PostData, 8193);
              if assigned(OnConferenceCommand) then
                OnConferenceCommand(cli1, HeaderInfo, das1);
            finally
              das1.Free;
            end;
          end
          else
          begin
            //cli1.AnswerString('', '', '', 'Unknow');
            Logit(cli1.Socket.PeerIPAddress, 'error buffer count');
          end;
        end;
      $11: //to all conference , for example: inform
        begin
          if HeaderInfo.PostData.Size > ReserveBufferCount then
          begin
            l1 := InternalSessionTracker.SessionArray.LockList;
            try
              for i := 0 to l1.Count - 1 do
              begin
                n1 := TDCMConferenceServerClientThread(l1[i]);
                if n1 = ClientThread then
                  continue;

                das1 := TDicomAttributes.Create;

                das1.ReadData(ReserveBufferCount, HeaderInfo.PostData, 8193);

                n1.AnswerDataset($10, 0, 0, das1);

                //n1.SendMessageTo(id1, das1);

              end;
            finally
              InternalSessionTracker.SessionArray.UnlockList;
            end;
            //cli1.AnswerString('', '', '', 'OK');
          end
          else
            //cli1.AnswerString('', '', '', 'Unknow');
            Logit(cli1.Socket.PeerIPAddress, 'error buffer count');
        end;
      $20, $21, $22, $23: //send video, audio, jpeg, mouse data ....
        begin
          pi1 := HeaderInfo.PostData.Memory;
          pb2 := HeaderInfo.PostData.Memory;
          inc(pb2, ReserveBufferCount);

          inc(pi1);
          conID1 := pi1^; //Conference ID

          for k := 0 to (ReserveBufferCount div 4) - 3 do
          begin
            inc(pi1);
            id1 := pi1^; //connection ID
            if id1 <> 0 then
              cli1.SendBufferTo(CmdType - $20, conID1, id1, pb2, 0, HeaderInfo.PostData.Size - ReserveBufferCount)
            else
              break;
          end;
          //          cli1.AnswerString('','','','OK');
        end;
      $60: //send message
        begin
          if HeaderInfo.PostData.Size > 64 then
          begin
            pi1 := HeaderInfo.PostData.Memory;
            inc(pi1);
            conID1 := pi1^; //Conference ID

            das1 := TDicomAttributes.Create;
            try
              das1.ReadData(ReserveBufferCount, HeaderInfo.PostData, 8193);
              das1.AddVariant($2817, $1005, ClientThread.Socket.PeerIPAddress);

              //das1.AddVariant($2817, $1008, conID1);

              for k := 0 to (ReserveBufferCount div 4) - 3 do
              begin
                inc(pi1);
                id1 := pi1^; //connection ID
                if id1 <> 0 then
                  cli1.SendMessageTo(conID1, id1, das1)
                else
                  break;
              end;
            finally
              das1.Free;
            end;
            //cli1.AnswerString('', '', '', 'OK');
          end
          else
          begin
            //cli1.AnswerString('', '', '', 'Unknow');
            Logit(cli1.Socket.PeerIPAddress, 'error buffer count');
          end;
        end;
      $30, $31, $32, $33: //send video, audio, jpeg, mouse data ....
        begin
          pi1 := HeaderInfo.PostData.Memory;
          pb2 := HeaderInfo.PostData.Memory;
          inc(pb2, ReserveBufferCount);
          inc(pi1);
          conID1 := pi1^; //Conference ID

          for k := 0 to (ReserveBufferCount div 4) - 3 do
          begin
            inc(pi1);
            id1 := pi1^; //user ID
            if id1 <> 0 then
              cli1.SendBufferToUserID(CmdType - $30, conID1, id1, pb2, 0, HeaderInfo.PostData.Size - ReserveBufferCount)
            else
              break;
          end;
          //          cli1.AnswerString('','','','OK');
        end;
      $70: //send message
        begin
          if HeaderInfo.PostData.Size > 64 then
          begin
            pi1 := HeaderInfo.PostData.Memory;
            inc(pi1);
            conID1 := pi1^; //Conference ID

            das1 := TDicomAttributes.Create;
            try
              das1.ReadData(ReserveBufferCount, HeaderInfo.PostData, 8193);

              das1.AddVariant($2817, $1005, ClientThread.Socket.PeerIPAddress);
              //das1.AddVariant($2817, $1008, conID1);

              for k := 0 to (ReserveBufferCount div 4) - 3 do
              begin
                inc(pi1);
                id1 := pi1^; //user ID
                if id1 <> 0 then
                  cli1.SendMessageToUserID(conID1, id1, das1)
                else
                  break;
              end;
            finally
              das1.Free;
            end;
            //cli1.AnswerString('', '', '', 'OK');
          end
          else
          begin
            //cli1.AnswerString('', '', '', 'Unknow');
            Logit(cli1.Socket.PeerIPAddress, 'error buffer count');
          end;
        end;
    end;
  end
  else
  begin
    //get video
    //cli1.AnswerMessage;
    //Cli1.AnswerString('', '', '', 'OK');
    EnableKeepAlive := true;
  end;
  inherited;
end;

function TDCMConferenceServerServerCore.FindClient(
  AID: TDCMConferenceServerClientThread): TDcmConferenceUserInfo;
var
  n1: TDcmConferenceUserInfo;
  l1: TList;
  i: Integer;
begin
  Result := nil;
  if AID <> nil then
  begin
    l1 := fAllUser.LockList;
    try
      for i := 0 to l1.Count - 1 do
      begin
        n1 := TDcmConferenceUserInfo(l1[i]);
        if n1.Client = AID then
        begin
          Result := n1;
          break;
        end;
      end;
    finally
      fAllUser.UnlockList;
    end;
  end;
end;

function TDCMConferenceServerServerCore.FindClient(
  AID: Integer): TDcmConferenceUserInfo;
var
  n1: TDcmConferenceUserInfo;
  l1: TList;
  i: Integer;
begin
  Result := nil;
  if AID > 0 then
  begin
    l1 := fAllUser.LockList;
    try
      for i := 0 to l1.Count - 1 do
      begin
        n1 := TDcmConferenceUserInfo(l1[i]);
        if n1.ConnectionID = AID then
        begin
          Result := n1;
          break;
        end;
      end;
    finally
      fAllUser.UnlockList;
    end;
  end;
end;

function TDCMConferenceServerServerCore.FindConference(
  AID: Integer): TDCMConferenceUserInfo;
var
  n1: TDCMConferenceUserInfo;
  l1: TList;
  i: Integer;
begin
  Result := nil;
  if AID > 0 then
  begin
    l1 := fConferences.LockList;
    try
      for i := 0 to l1.Count - 1 do
      begin
        n1 := TDCMConferenceUserInfo(l1[i]);
        if n1.ConnectionID = AID then
        begin
          Result := n1;
          break;
        end;
      end;
    finally
      fConferences.UnlockList;
    end;
  end;
end;

function TDCMConferenceServerServerCore.FindClientByUserID(
  AUserID: Integer): TDcmConferenceUserInfo;
var
  n1: TDCMConferenceUserInfo;
  l1: TList;
  i: Integer;
begin
  Result := nil;
  if AUserID > 0 then
  begin
    l1 := fAllUser.LockList;
    try
      for i := 0 to l1.Count - 1 do
      begin
        n1 := TDCMConferenceUserInfo(l1[i]);
        if n1.UserID = AUserID then
        begin
          Result := n1;
          break;
        end;
      end;
    finally
      fAllUser.UnlockList;
    end;
  end;
end;

procedure TDCMConferenceServerServerCore.DoNewConnection(
  ClientThread: TKXClientThread);
var
  v1: TDCMConferenceServerClientThread;
begin
  inherited;
  v1 := TDCMConferenceServerClientThread(ClientThread);
  v1.OnConferenceMessage := DoClientMessageSave;
  v1.OnConferenceMessageOffline := DoClientMessageSaveOffline;
  v1.OnClientLogout := DoClientLogout;
end;

function TDCMConferenceServerServerCore.FindClient(
  AUserCode: string): TDcmConferenceUserInfo;
var
  n1: TDCMConferenceUserInfo;
  l1: TList;
  i: Integer;
begin
  Result := nil;
  if AUserCode <> '' then
  begin
    l1 := fAllUser.LockList;
    try
      for i := 0 to l1.Count - 1 do
      begin
        n1 := TDCMConferenceUserInfo(l1[i]);
        if n1.UserCode = AUserCode then
        begin
          Result := n1;
          break;
        end;
      end;
    finally
      fAllUser.UnlockList;
    end;
  end;
end;

procedure TDCMConferenceServerServerCore.SetOnConferenceCommand(
  const Value: TOnConferenceCommandEvent);
begin
  FOnConferenceCommand := Value;
end;

procedure TDCMConferenceServerServerCore.SetOnConferenceMessage(
  const Value: TOnConferenceMessageEvent);
begin
  FOnConferenceMessage := Value;
end;

procedure TDCMConferenceServerServerCore.DoClientMessageSave(
  ClientThread: TDCMConferenceServerClientThread;
  ASendFrom, ASendTo: Integer; ARequestDataset: TDicomAttributes);
begin
  if assigned(FOnConferenceMessage) then
    FOnConferenceMessage(ClientThread, ASendFrom, ASendTo, ARequestDataset);
end;

procedure TDCMConferenceServerServerCore.DoClientMessageSaveOffline(
  ClientThread: TDCMConferenceServerClientThread;
  ASendFrom, ASendTo: Integer; ARequestDataset: TDicomAttributes);
begin
  if assigned(FOnConferenceMessageOffline) then
    FOnConferenceMessageOffline(ClientThread, ASendFrom, ASendTo, ARequestDataset);
end;

procedure TDCMConferenceServerServerCore.SetOnConferenceMessageOffline(
  const Value: TOnConferenceMessageEvent);
begin
  FOnConferenceMessageOffline := Value;
end;

function TDCMConferenceServerServerCore.SetConferenceSpeaker(
  AID: Integer; AName: string; AHandleID: Integer): Integer;
var
  v1: TDCMConferenceUserInfo;
begin
  v1 := FindConference(AID);
  Result := -1;
  if v1 = nil then
  begin
    v1 := TDCMConferenceUserInfo.Create;
    v1.UserName := AName;
    v1.ConnectionID := AID;
    v1.UserID := 100 + Random(100000);
    Result := v1.UserID;
    fConferences.Add(v1);
  end
  else
  begin
    if AName <> '' then
    begin
      if v1.FUserName = '' then
      begin
        v1.FUserName := AName;
        v1.UserID := 100 + Random(100000);
        Result := v1.UserID;
      end;
    end
    else
      if (AName = '') and (AHandleID = v1.FUserID) then
    begin
      v1.FUserName := '';
      v1.FUserID := 0;
    end;
  end;
end;

procedure TDCMConferenceServerServerCore.SetOnClientLogout(
  const Value: TNotifyEvent);
begin
  FOnClientLogout := Value;
end;

procedure TDCMConferenceServerServerCore.DoClientLogout(Sender: TObject);
var
  dst1: TDcmConferenceUserInfo;
  n1: TDCMConferenceServerClientThread;
begin
  n1 := TDCMConferenceServerClientThread(Sender);
  dst1 := FindClient(n1);
  if dst1 <> nil then
  begin
    dst1.Client := nil;
    dst1.IPAddress := '';
  end;
  if assigned(FOnClientLogout) then
    FOnClientLogout(Sender);
end;

procedure TDCMConferenceServerServerCore.Logit(AIP, Msg: string);
begin

end;

{ TDCMConferenceClient }

constructor TDCMConferenceClient.Create(AOwner: TComponent);
begin
  inherited;
  fDataThread := nil;
  fWaitForCommand := '';
  fWaitForDatasets := nil;

  FMaxTimerInterval := 1000;
  FRefreshFriendListInterval := 30;
  FRefreshFriendListTimeout := 30;
  fNopCount := 0;

  fFriendList := TList.Create;
  fConferenceList := TList.Create;
  fGroupNames := TStringList.Create;

  fReceivedHeaderInfo := nil;
  //fConferenceMessages := TThreadList.Create;
  FCnsErrorMessage := '';

  fConnectionID := -1;
  fUserID := -1;
  fUserCode := '';
  fPassword := '';

  fReceiveTimeout := 120000;

  fSendBufferCount := 0;

  FSocket := TKxSockClient.Create(self);
  FSocket.OutputBufferSize := bsfHUGE;
  //FSocket.EnabledBlocking := false;

  FHost := '127.0.0.1';
  FPort := 104;

  FPath := '';
  FSender := '';
  FReference := '';
  FCookie := '';
  FCurrConnection := 'Keep-Alive';

  FContentRangeBegin := '';
  FContentRangeEnd := '';
  FAcceptRanges := '';

  FCurrProxyConnection := '';
  FProxyAuthBasicState := basicNone;
  FProxyUsername := '';
  FProxyPassword := '';

  FAgent := //'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; .NET CLR 1.1.4322)';
  'Mozilla/4.0 (compatible; ICS)';
  FAccept := '*.*'; //'image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, */*';
  FAcceptLanguage := '';

  FContentPost := 'application/x-www-form-urlencoded'; { Also used for PUT }
  FNoCache := false;

  FAuthBasicState := basicNone;
  FCurrUsername := '';
  FCurrPassword := '';

  fRefreshTimer := TTimer.Create(self);
  fRefreshTimer.Interval := 1000;
  fRefreshTimer.OnTimer := DoRefreshTimer;
  fRefreshTimer.Enabled := false;
end;

destructor TDCMConferenceClient.Destroy;
var
  i: Integer;
  l1: TList;
begin
  if fDataThread <> nil then
    fDataThread.Terminate;

  fRefreshTimer.Enabled := false;

  if Connected then
  begin
    //    Get('/CLOSE');
    try
      Connected := false;
    except
    end;
  end;

  {l1 := fConferenceMessages.LockList;
  try
    for i := 0 to l1.Count - 1 do
      TDcmConferenceMessage(l1[i]).Free;
    l1.Clear;
  finally
    fConferenceMessages.UnlockList;
  end;
  fConferenceMessages.Free;}

  for i := 0 to fConferenceList.Count - 1 do
    TDcmConferenceUserInfo(fConferenceList[i]).Free;
  fConferenceList.Clear;
  fConferenceList.Free;

  for i := 0 to fFriendList.Count - 1 do
    TDcmConferenceUserInfo(fFriendList[i]).Free;
  fFriendList.Clear;
  fFriendList.Free;

  fGroupNames.Free;

  FSocket.Free;
  inherited;
end;

function TDCMConferenceClient.GetConnected: Boolean;
begin
  Result := (FSocket <> nil) and FSocket.Connected;
end;

procedure TDCMConferenceClient.SetConnected(const Value: Boolean);
begin
  if FSocket.Connected <> Value then
    if Value then
    begin
      FSocket.Host := fHost;
      FSocket.Port := fPort;
      FSocket.DoConnect;
    end
    else
    begin
      if csDestroying in ComponentState then
        Get('/CLOSE');
      FSocket.Disconnect;
      if assigned(FOnSocketDisconnect) then
      begin
        FOnSocketDisconnect(self);
      end;
    end;
end;

procedure TDCMConferenceClient.SetHost(const Value: string);
begin
  FHost := Value;
  fSocket.Host := Value;
end;

procedure TDCMConferenceClient.SetPort(const Value: Integer);
begin
  FPort := Value;
  fSocket.Port := Value;
end;

procedure TDCMConferenceClient.SetReceiveTimeout(const Value: Integer);
var
  TimeoutMS: Integer;
begin
  FReceiveTimeout := Value;
  if (fReceiveTimeout > 0) and (fReceiveTimeout <> Value) then
    KXSocket.SetReceiveTimeout(FSocket.Sock, fReceiveTimeout, TimeoutMS);
end;

procedure TDCMConferenceClient.ProcessData;
var
  S: string;
  //  WantKeepAlive: Boolean;

  Stm1: TDicomKXSocketStream;
  c1, c2: Byte;
  procedure BuildHeader(ClientHeader: Ansistring);
  var
    line, token1, token2: Ansistring;
    Error: Integer;
    Ch: AnsiChar;
    I: Integer;

    procedure AddToUnknown;
    begin
      if fReceivedHeaderInfo.Unknown = '' then
        fReceivedHeaderInfo.Unknown := token1 + ': ' + line
      else
        fReceivedHeaderInfo.Unknown := fReceivedHeaderInfo.Unknown + #13#10 + token1 + ': ' + line;
    end;

  begin
    line := ClientHeader;
    with fReceivedHeaderInfo do
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
    with fReceivedHeaderInfo do
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
  if assigned(fReceivedHeaderInfo) then
  begin
    fReceivedHeaderInfo.Free;
    fReceivedHeaderInfo := nil;
  end;
  fReceivedHeaderInfo := THeaderInfo.Create;
  Stm1 := TDicomKXSocketStream.Create(fSocket, false);
  stm1.ReceiveTimeout := self.ReceiveTimeout;
  //Stm1.BufferReadMode := true;
  try
    with fReceivedHeaderInfo do
    begin
      ClientAddr := fSocket.PeerIPAddress;
      ClientHost := fReceivedHeaderInfo.ClientAddr;
    end;

    //fbForceAbort := False;
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
      if (not fSocket.Connected) then
      begin
        Exit;
      end;
    end;

    if fReceivedHeaderInfo.ContentLength > 0 then
    begin
      fReceivedHeaderInfo.PostData := ReadToStream(fReceivedHeaderInfo.ContentLength);
    end;

    if fReceivedHeaderInfo.Host = '' then
      ManuallyGetHost;
    Delete(fReceivedHeaderInfo.ALL_HTTP, Length(fReceivedHeaderInfo.ALL_HTTP) - 1, 2);
    fReceivedHeaderInfo.ALL_HTTP := fReceivedHeaderInfo.ALL_HTTP + #0;
    //    WantKeepAlive := (lowercase(fReceivedHeaderInfo.KeepAlive) = 'true');
        //fReceivedHeaderInfo := HeaderInfo;

  finally
    stm1.Free;
  end;
end;

function TDCMConferenceClient.GetIsLocked: boolean;
begin
  Result := (FLockCount > 0);
end;

procedure TDCMConferenceClient.Lock;
begin
  TryLock(INFINITE);
  //inc(FLockCount);
end;

procedure TDCMConferenceClient.TryLock(TimeOut: DWORD);
var
  n: DWORD;
begin
  // Wait for critical section.
  inc(FLockCount);
  n := WaitForSingleObject(FSemaphore, TimeOut);
  if (n = WAIT_TIMEOUT) or (n = WAIT_FAILED) then
  begin
    dec(FLockCount);
    exit;
  end;
end;

procedure TDCMConferenceClient.Unlock;
begin
  ReleaseSemaphore(FSemaphore, 1, nil);
  dec(FLockCount);
end;

{procedure TDCMConferenceClient.AddMessage(AValue: TDcmConferenceMessage);
var
  l1: TList;
begin
  l1 := fConferenceMessages.LockList;
  try
    l1.Add(AValue);

    if l1.Count > MaxConferenceMessagesCount then
    begin
      l1.Delete(0);
    end;
  finally
    fConferenceMessages.UnlockList;
  end;
end;

function TDCMConferenceClient.AnswerMessage: Boolean;
var
  v1: TDcmConferenceMessage;
  das2: TDicomAttributes;
  l1: TList;
begin
  Result := false;
  v1 := nil;
  l1 := fConferenceMessages.LockList;
  try
    if l1.Count > 0 then
    begin
      v1 := TDcmConferenceMessage(l1[0]);
      l1.Delete(0);
      Result := l1.Count > 0;
    end;
  finally
    fConferenceMessages.UnlockList
  end;
  if v1 <> nil then
  begin
    try
      if v1.FVideoBuffer <> nil then
        UploadVideo(v1.fType, v1.fConferenceID, v1.fToConnectionID, v1.VideoBuffer, v1.BufferCount, v1.fHeight, v1.fWidth)
      else
        if v1.Dataset <> nil then
      begin
        das2 := PostDataset(v1.fPath, v1.fConferenceID, v1.fType, v1.fToConnectionID, v1.FDataset);
        if das2 <> nil then
        try
          if assigned(FOnDatasetAvailable) then
            FOnDatasetAvailable(self, fReceivedHeaderInfo, das2);
        finally
          das2.Free;
        end;
      end;
    finally
      v1.Free;
    end;
  end;
end;}

procedure TDCMConferenceClient.SendRequest(const Method, Version: string);
var
  Headers: TStrings;
  //  N: Integer;
begin
  Headers := TStringList.Create;
  try
    //FReqStream.Clear;
    //TriggerRequestHeaderBegin;
    {* OutputDebugString(method + ' ' + FPath + ' HTTP/' + Version); *}
    if Method = 'CONNECT' then
      Headers.Add(Method + ' ' + FHost + ':' + InttoStr(FPort) +
        ' HTTP/' + Version)
    else
    begin
      Headers.Add(method + ' ' + FPath + ' HTTP/' + Version);
      if FSender <> '' then
        Headers.Add('From: ' + FSender);
      if FAccept <> '' then
        Headers.Add('Accept: ' + FAccept);
      if FReference <> '' then
        Headers.Add('Referer: ' + FReference);
      if FCurrConnection <> '' then
        Headers.Add('Connection: ' + FCurrConnection);
      if FAcceptLanguage <> '' then
        Headers.Add('Accept-Language: ' + FAcceptLanguage);
      {$IFDEF UseContentCoding}
      if (FContentCodingHnd.HeaderText <> '') and (FRequestType <> httpHEAD) then
        Headers.Add('Accept-Encoding: ' + FContentCodingHnd.HeaderText);
      {$ENDIF}
      if ((Method = 'POST') or (Method = 'PUT')) and
        (FContentPost <> '') then
        Headers.Add('Content-Type: ' + FContentPost);
      {if ((method = 'PUT') or (method = 'POST')) and (FContentPost <> '') then
          Headers.Add('Content-Type: ' + FContentPost);}
    end;
    if FAgent <> '' then
      Headers.Add('User-Agent: ' + FAgent);
    if (FPort = 80) or (FPort = 0) then {Maurizio}
      Headers.Add('Host: ' + FHost)
    else
      Headers.Add('Host: ' + FHost + ':' + InttoStr(FPort));
    if FNoCache then
      Headers.Add('Pragma: no-cache');
    if FCurrProxyConnection <> '' then
      Headers.Add('Proxy-Connection: ' + FCurrProxyConnection);
    if (Method = 'CONNECT') then // <= 12/29/05 AG
      Headers.Add('Content-Length: 0') // <= 12/29/05 AG}
      {$IFDEF UseNTLMAuthentication}
    else
    begin // <= 12/29/05 AG
      if (FRequestType = httpPOST) or (FRequestType = httpPUT) then
      begin
        if (FAuthNTLMState = ntlmMsg1) or (FProxyAuthNTLMState = ntlmMsg1) then
          Headers.Add('Content-Length: 0')
        else
          //if (fSendBufferCount > 0) then
          Headers.Add('Content-Length: ' + IntToStr(fSendBufferCount))
      end;
    end; // <= 12/29/05 AG
    {$ELSE}; // <= 12/29/05 AG
    //if ((Method = 'POST') or (Method = 'PUT')) then
      //if (fSendBufferCount > 0) then
    Headers.Add('Content-Length: ' + IntToStr(fSendBufferCount));
    {$ENDIF}
    { if (method = 'PUT') or (method = 'POST') then
        Headers.Add('Content-Length: ' + IntToStr(SendStream.Size));}
    if FModifiedSince <> 0 then
      Headers.Add('If-Modified-Since: ' + RFC1123_Date(FModifiedSince) + ' GMT');
    {$IFDEF UseNTLMAuthentication}
    if (FProxyAuthNTLMState <> ntlmMsg1) then
    begin
      if (FAuthNTLMState = ntlmMsg1) then
        Headers.Add('Authorization: NTLM ' + GetNTLMMessage1)
      else
        if (FAuthNTLMState = ntlmMsg3) then
        Headers.Add('Authorization: NTLM ' + GetNTLMMessage3(False))
      else
        if (FAuthBasicState = basicMsg1) then
        Headers.Add('Authorization: Basic ' +
          EncodeStr(encBase64, FCurrUsername + ':' + FCurrPassword));
    end;
    {$ELSE}
    if (FAuthBasicState = basicMsg1) then
      Headers.Add('Authorization: Basic ' +
        EncodeStr(encBase64, FCurrUsername + ':' + FCurrPassword));
    {$ENDIF}

    {$IFDEF UseNTLMAuthentication}
    if (FProxyAuthNTLMState = ntlmMsg1) then
      Headers.Add('Proxy-Authorization: NTLM ' + GetNTLMMessage1)
    else
      if (FProxyAuthNTLMState = ntlmMsg3) then
      Headers.Add('Proxy-Authorization: NTLM ' + GetNTLMMessage3(True))
    else
      {$ENDIF}
      if (FProxyAuthBasicState = basicMsg1) then
      Headers.Add('Proxy-Authorization: Basic ' +
        EncodeStr(encBase64, FProxyUsername + ':' + FProxyPassword));
    (***
            if (FUsername <> '') and (not (httpoNoBasicAuth in FOptions))
    {$IFDEF UseNTLMAuthentication}
              and (FAuthNTLMState in [ntlmNone, ntlmDone])
    {$ENDIF}
            then
                Headers.Add('Authorization: Basic ' +
                            EncodeStr(encBase64, FUsername + ':' + FPassword));

            if (FProxy <> '') and (FProxyUsername <> '')
    {$IFDEF UseNTLMAuthentication}
              and (FProxyAuthNTLMState = ntlmNone)
    {$ENDIF}
            then
                Headers.Add('Proxy-Authorization: Basic ' +
                            EncodeStr(encBase64, FProxyUsername + ':' + FProxyPassword));
    ***)

    if FCookie <> '' then
      Headers.Add('Cookie: ' + FCookie);
    if (FContentRangeBegin <> '') or (FContentRangeEnd <> '') then
    begin
      Headers.Add('Range: bytes=' + FContentRangeBegin + '-' + FContentRangeEnd);
      FContentRangeBegin := '';
      FContentRangeEnd := '';
    end;
    FAcceptRanges := '';

    {SendCommand('UA-pixels: 1024x768'); }
    {SendCommand('UA-color: color8'); }
    {SendCommand('UA-OS: Windows 95'); }
    {SendCommand('UA-CPU: x86'); }
    {SendCommand('Proxy-Connection: Keep-Alive'); }

    //TriggerBeforeHeaderSend(Method, Headers);
    {jiawen for N := 0 to Headers.Count - 1 do
      SendCommand(Headers[N]);
    TriggerRequestHeaderEnd;
    SendCommand('');
    FCtrlSocket.PutDataInSendBuffer(FReqStream.Memory, FReqStream.Size);
    FReqStream.Clear;
    FCtrlSocket.Send(nil, 0); }

    Headers.Add('');
    fSocket.Write(Headers.Text);

  finally
    Headers.Free;
  end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFDEF WIN32}

function EncodeLine(
  Encoding: THttpEncoding;
  SrcData: PChar;
  Size: Integer): string;
var
  Offset: Integer;
  Pos1: Integer;
  Pos2: Integer;
  I: Integer;
begin
  SetLength(Result, Size * 4 div 3 + 4);
  FillChar(Result[1], Size * 4 div 3 + 2, #0);

  if Encoding = encUUEncode then
  begin
    Result[1] := Char(((Size - 1) and $3F) + $21);
    Size := ((Size + 2) div 3) * 3;
  end;
  Offset := 2;
  Pos1 := 0;
  Pos2 := 0;
  case Encoding of
    encUUEncode: Pos2 := 2;
    encBase64, encMime: Pos2 := 1;
  end;
  Result[Pos2] := #0;

  while Pos1 < Size do
  begin
    if Offset > 0 then
    begin
      Result[Pos2] := Char(ord(Result[Pos2]) or
        ((ord(SrcData[Pos1]) and
        ($3F shl Offset)) shr Offset));
      Offset := Offset - 6;
      Inc(Pos2);
      Result[Pos2] := #0;
    end
    else
      if Offset < 0 then
    begin
      Offset := Abs(Offset);
      Result[Pos2] := Char(ord(Result[Pos2]) or
        ((ord(SrcData[Pos1]) and
        ($3F shr Offset)) shl Offset));
      Offset := 8 - Offset;
      Inc(Pos1);
    end
    else
    begin
      Result[Pos2] := Char(ord(Result[Pos2]) or
        ((ord(SrcData[Pos1]) and $3F)));
      Inc(Pos2);
      Inc(Pos1);
      Result[Pos2] := #0;
      Offset := 2;
    end;
  end;

  case Encoding of
    encUUEncode:
      begin
        if Offset = 2 then
          Dec(Pos2);
        for i := 2 to Pos2 do
          Result[i] := bin2uue[ord(Result[i]) + 1];
      end;
    encBase64, encMime:
      begin
        if Offset = 2 then
          Dec(Pos2);
        for i := 1 to Pos2 do
          Result[i] := bin2b64[ord(Result[i]) + 1];
        while (Pos2 and 3) <> 0 do
        begin
          Inc(Pos2);
          Result[Pos2] := '=';
        end;
      end;
  end;
  SetLength(Result, Pos2);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function EncodeStr(Encoding: THttpEncoding; const Value: string): string;
begin
  Result := EncodeLine(Encoding, @Value[1], Length(Value));
end;
{$ENDIF}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFDEF CLR}

function EncodeStr(Encoding: THttpEncoding; const Value: string): string;
var
  Offset: Integer;
  Pos1: Integer;
  Pos2: Integer;
  I: Integer;
  Buf: StringBuilder;
  Size: Integer;
begin
  Size := Length(Value);
  Buf := StringBuilder.Create(Size * 4 div 3 + 4);

  if Encoding = encUUEncode then
  begin
    Buf[0] := Char(((Size - 1) and $3F) + $21);
    Size := ((Size + 2) div 3) * 3;
  end;
  Offset := 2;
  Pos1 := 1;
  Pos2 := 0;
  case Encoding of
    encUUEncode: Pos2 := 1;
    encBase64, encMime: Pos2 := 0;
  end;
  Buf[Pos2] := #0;

  while Pos1 < Size do
  begin
    if Offset > 0 then
    begin
      Buf[Pos2] := Char(ord(Result[Pos2]) or
        ((ord(Value[Pos1]) and
        ($3F shl Offset)) shr Offset));
      Offset := Offset - 6;
      Inc(Pos2);
      Buf[Pos2] := #0;
    end
    else
      if Offset < 0 then
    begin
      Offset := Abs(Offset);
      Buf[Pos2] := Char(ord(Result[Pos2]) or
        ((ord(Value[Pos1]) and
        ($3F shr Offset)) shl Offset));
      Offset := 8 - Offset;
      Inc(Pos1);
    end
    else
    begin
      Buf[Pos2] := Char(ord(Result[Pos2]) or
        ((ord(Value[Pos1]) and $3F)));
      Inc(Pos2);
      Inc(Pos1);
      Buf[Pos2] := #0;
      Offset := 2;
    end;
  end;

  case Encoding of
    encUUEncode:
      begin
        if Offset = 2 then
          Dec(Pos2);
        for i := 2 to Pos2 do
          Buf[i] := bin2uue[ord(Buf[i]) + 1];
      end;
    encBase64, encMime:
      begin
        if Offset = 2 then
          Dec(Pos2);
        for i := 1 to Pos2 do
          Buf[i] := bin2b64[ord(Buf[i]) + 1];
        while (Pos2 and 3) <> 0 do
        begin
          Inc(Pos2);
          Buf[Pos2] := '=';
        end;
      end;
  end;
  Buf.Length := Pos2;
  Result := Buf.ToString;
end;
{$ENDIF}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFDEF DELPHI1}

function TrimRight(Str: string): string;
var
  i: Integer;
begin
  i := Length(Str);
  while (i > 0) and (Str[i] in [' ', #9]) do
    i := i - 1;
  Result := Copy(Str, 1, i);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function TrimLeft(Str: string): string;
var
  i: Integer;
begin
  if Str[1] <> ' ' then
    Result := Str
  else
  begin
    i := 1;
    while (i <= Length(Str)) and (Str[i] = ' ') do
      i := i + 1;
    Result := Copy(Str, i, Length(Str) - i + 1);
  end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function Trim(Str: string): string;
begin
  Result := TrimLeft(TrimRight(Str));
end;
{$ENDIF}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFNDEF DELPHI5_UP}

function StrToIntDef(const S: string; const Default: Integer): Integer;
begin
  try
    Result := StrToInt(S);
  except
    Result := Default;
  end;
end;
{$ENDIF}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFDEF DELPHI1}

procedure SetLength(var S: string; NewLength: Integer);
begin
  S[0] := chr(NewLength);
end;
{$ENDIF}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
const
  RFC1123_StrWeekDay: string = 'MonTueWedThuFriSatSun';
  RFC1123_StrMonth: string = 'JanFebMarAprMayJunJulAugSepOctNovDec';
  { We cannot use Delphi own function because the date must be specified in   }
  { english and Delphi use the current language.                              }

function RFC1123_Date(aDate: TDateTime): string;
var
  Year, Month, Day: Word;
  Hour, Min, Sec, MSec: Word;
  DayOfWeek: Word;
begin
  DecodeDate(aDate, Year, Month, Day);
  DecodeTime(aDate, Hour, Min, Sec, MSec);
  DayOfWeek := ((Trunc(aDate) - 2) mod 7);
  Result := Copy(RFC1123_StrWeekDay, 1 + DayOfWeek * 3, 3) + ', ' +
    Format('%2.2d %s %4.4d %2.2d:%2.2d:%2.2d',
    [Day, Copy(RFC1123_StrMonth, 1 + 3 * (Month - 1), 3),
    Year, Hour, Min, Sec]);
end;

{ Bug: time zone is ignored !! }

function RFC1123_StrToDate(aDate: string): TDateTime;
var
  Year, Month, Day: Word;
  Hour, Min, Sec: Word;
begin
  { Fri, 30 Jul 2004 10:10:35 GMT }
  Day := StrToIntDef(Copy(aDate, 6, 2), 0);
  Month := (Pos(Copy(aDate, 9, 3), RFC1123_StrMonth) + 2) div 3;
  Year := StrToIntDef(Copy(aDate, 13, 4), 0);
  Hour := StrToIntDef(Copy(aDate, 18, 2), 0);
  Min := StrToIntDef(Copy(aDate, 21, 2), 0);
  Sec := StrToIntDef(Copy(aDate, 24, 2), 0);
  Result := EncodeDate(Year, Month, Day);
  Result := Result + EncodeTime(Hour, Min, Sec, 0);
end;

function Posn(const s, t: string; Count: Integer): Integer;
var
  i, h, Last: Integer;
  u: string;
begin
  u := t;
  if Count > 0 then
  begin
    Result := Length(t);
    for i := 1 to Count do
    begin
      h := Pos(s, u);
      if h > 0 then
        u := Copy(u, h + 1, Length(u))
      else
      begin
        u := '';
        Inc(Result);
      end;
    end;
    Result := Result - Length(u);
  end
  else
    if Count < 0 then
  begin
    Last := 0;
    for i := Length(t) downto 1 do
    begin
      u := Copy(t, i, Length(t));
      h := Pos(s, u);
      if (h <> 0) and ((h + i) <> Last) then
      begin
        Last := h + i - 1;
        Inc(count);
        if Count = 0 then
          break;
      end;
    end;
    if Count = 0 then
      Result := Last
    else
      Result := 0;
  end
  else
    Result := 0;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{ Syntax of an URL: protocol://[user[:password]@]server[:port]/path         }

procedure ParseURL(
  const url: string;
  var Proto, User, Pass, Host, Port, Path: string);
var
  p, q, i: Integer;
  s: string;
  CurPath: string;
begin
  CurPath := Path;
  proto := '';
  User := '';
  Pass := '';
  Host := '';
  Port := '';
  Path := '';

  if Length(url) < 1 then
    Exit;

  { Handle path beginning with "./" or "../".          }
  { This code handle only simple cases !               }
  { Handle path relative to current document directory }
  if (Copy(url, 1, 2) = './') then
  begin
    p := Posn('/', CurPath, -1);
    if p > Length(CurPath) then
      p := 0;
    if p = 0 then
      CurPath := '/'
    else
      CurPath := Copy(CurPath, 1, p);
    Path := CurPath + Copy(url, 3, Length(url));
    Exit;
  end
    { Handle path relative to current document parent directory }
  else
    if (Copy(url, 1, 3) = '../') then
  begin
    p := Posn('/', CurPath, -1);
    if p > Length(CurPath) then
      p := 0;
    if p = 0 then
      CurPath := '/'
    else
      CurPath := Copy(CurPath, 1, p);

    s := Copy(url, 4, Length(url));
    { We could have several levels }
    while TRUE do
    begin
      CurPath := Copy(CurPath, 1, p - 1);
      p := Posn('/', CurPath, -1);
      if p > Length(CurPath) then
        p := 0;
      if p = 0 then
        CurPath := '/'
      else
        CurPath := Copy(CurPath, 1, p);
      if (Copy(s, 1, 3) <> '../') then
        break;
      s := Copy(s, 4, Length(s));
    end;

    Path := CurPath + Copy(s, 1, Length(s));
    Exit;
  end;

  p := pos('://', url);
  q := p;
  if p <> 0 then
  begin
    S := LowerCase(Copy(url, 1, p - 1));
    for i := 1 to Length(S) do
    begin
      if not (AnsiChar(S[i]) in UriProtocolSchemeAllowedChars) then
      begin
        q := i;
        Break;
      end;
    end;
    if q < p then
    begin
      p := 0;
      proto := 'http';
    end;
  end;
  if p = 0 then
  begin
    if (url[1] = '/') then
    begin
      { Relative path without protocol specified }
      proto := 'http';
      p := 1;
      if (Length(url) > 1) and (url[2] <> '/') then
      begin
        { Relative path }
        Path := Copy(url, 1, Length(url));
        Exit;
      end;
    end
    else
      if LowerCase(Copy(url, 1, 5)) = 'http:' then
    begin
      proto := 'http';
      p := 6;
      if (Length(url) > 6) and (url[7] <> '/') then
      begin
        { Relative path }
        Path := Copy(url, 6, Length(url));
        Exit;
      end;
    end
    else
      if LowerCase(Copy(url, 1, 7)) = 'mailto:' then
    begin
      proto := 'mailto';
      p := pos(':', url);
    end;
  end
  else
  begin
    proto := LowerCase(Copy(url, 1, p - 1));
    inc(p, 2);
  end;
  s := Copy(url, p + 1, Length(url));

  p := pos('/', s);
  q := pos('?', s);
  if (q > 0) and ((q < p) or (p = 0)) then
    p := q;
  if p = 0 then
    p := Length(s) + 1;
  Path := Copy(s, p, Length(s));
  s := Copy(s, 1, p - 1);

  p := Posn(':', s, -1);
  if p > Length(s) then
    p := 0;
  q := Posn('@', s, -1);
  if q > Length(s) then
    q := 0;
  if (p = 0) and (q = 0) then
  begin { no user, password or port }
    Host := s;
    Exit;
  end
  else
    if q < p then
  begin { a port given }
    Port := Copy(s, p + 1, Length(s));
    Host := Copy(s, q + 1, p - q - 1);
    if q = 0 then
      Exit; { no user, password }
    s := Copy(s, 1, q - 1);
  end
  else
  begin
    Host := Copy(s, q + 1, Length(s));
    s := Copy(s, 1, q - 1);
  end;
  p := pos(':', s);
  if p = 0 then
    User := s
  else
  begin
    User := Copy(s, 1, p - 1);
    Pass := Copy(s, p + 1, Length(s));
  end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function UrlEncode(S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  begin
    if AnsiChar(S[I]) in ['0'..'9', 'A'..'Z', 'a'..'z'] then
      Result := Result + S[I]
    else
      Result := Result + '%' + IntToHex(Ord(S[I]), 2);
  end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function UrlDecode(S: string): string;
var
  I: Integer;
  Ch: Char;
begin
  Result := '';
  I := 1;
  while (I <= Length(S)) and (S[I] <> '&') do
  begin
    Ch := S[I];
    if Ch = '%' then
    begin
      {$IFDEF CLR}
      Ch := chr(htoi2(S[I + 1], S[I + 2]));
      {$ELSE}
      Ch := chr(htoi2(@S[I + 1]));
      {$ENDIF}
      Inc(I, 2);
    end
    else
      if Ch = '+' then
      Ch := ' ';
    Result := Result + Ch;
    Inc(I);
  end;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function IsDigit(Ch: Char): Boolean;
begin
  Result := (AnsiChar(Ch) in ['0'..'9']);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function IsXDigit(Ch: char): Boolean;
begin
  Result := (AnsiChar(Ch) in ['0'..'9']) or
    (AnsiChar(Ch) in ['a'..'f']) or
    (AnsiChar(ch) in ['A'..'F']);
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

function XDigit(Ch: char): Integer;
begin
  if AnsiChar(Ch) in ['0'..'9'] then
    Result := ord(Ch) - ord('0')
  else
    Result := (ord(Ch) and 15) + 9;
end;

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFDEF WIN32}

function htoin(value: PChar; len: Integer): Integer;
var
  i: Integer;
begin
  Result := 0;
  i := 0;
  while (i < len) and (Value[i] = ' ') do
    i := i + 1;
  while (i < len) and (isxDigit(Value[i])) do
  begin
    Result := Result * 16 + xdigit(Value[i]);
    i := i + 1;
  end;
end;
{$ENDIF}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
{$IFDEF CLR}

function htoi2(Ch1, Ch2: Char): Integer;
begin
  Result := (xdigit(Ch1) shl 4) + xdigit(ch2);
end;
{$ELSE}

function htoi2(value: PChar): Integer;
begin
  Result := htoin(value, 2);
end;
{$ENDIF}

{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}

procedure ReplaceExt(var FName: string; const newExt: string);
var
  I: Integer;
begin
  I := Posn('.', FName, -1);
  if I <= 0 then
    FName := FName + '.' + newExt
  else
    FName := Copy(FName, 1, I) + newExt;
end;

function TDCMConferenceClient.Get(APath: string): Boolean;
begin
  //  Result := false;
  if not Connected then
    Connected := true;
  fPath := APath;
  fSendBufferCount := 0;
  if Connected then
  begin
    SendRequest('GET', '1.0');

    //ProcessWindowsMessageQueue;
    //ProcessData;
    //Result := assigned(ReceivedHeaderInfo) and (ReceivedHeaderInfo.PostData <> nil);
    Result := true;
  end
  else
    raise Exception.Create('Host ' + fHost + ':' + IntToStr(fPort) + ' can not connected');
end;

function TDCMConferenceClient.Post(APath: string; AStm: TStream): Boolean;
var
  stm1: TMemoryStream;
begin
  //  Result := false;
  if not Connected then
    Connected := true;
  fPath := APath;
  if AStm <> nil then
  begin
    fSendBufferCount := AStm.Size - AStm.Position;
  end
  else
    fSendBufferCount := 0;
  if Connected then
  begin
    SendRequest('POST', '1.0');
    if AStm <> nil then
    begin
      if AStm is TMemoryStream then
      begin
        stm1 := TMemoryStream(AStm);
        fSocket.Write(stm1.Memory, stm1.Size);
      end
      else
        fSocket.SendFrom(AStm);
      AStm.Free;
    end;

    //ProcessWindowsMessageQueue;
    //ProcessData;

    //Result := assigned(ReceivedHeaderInfo) and (ReceivedHeaderInfo.PostData <> nil);
    Result := true;
  end
  else //amessage
    raise Exception.Create(Format(ConferenceStringHostCanNotConnect, [fHost, fPort]));
end;

function TDCMConferenceClient.Post(APath: string; ABuffer: Pointer;
  ACount: Integer): Boolean;
begin
  //  Result := false;
  if not Connected then
    Connected := true;
  fPath := APath;
  fSendBufferCount := ACount;
  if Connected then
  begin
    SendRequest('POST', '1.0');
    if ABuffer <> nil then
    begin
      fSocket.Write(ABuffer, ACount);
    end;

    //ProcessWindowsMessageQueue;
    //ProcessData;

    //Result := assigned(ReceivedHeaderInfo) and (ReceivedHeaderInfo.PostData <> nil);
    Result := true;
  end
  else //amessage
    raise Exception.Create(Format(ConferenceStringHostCanNotConnect, [fHost, fPort]));
end;

function TDCMConferenceClient.GetFriendConnectionID(AUserID: Integer; AUserCode: string): Integer;
var
  das1, das2: TDicomAttributes;
begin
  Result := -1;
  if not Connected then
    exit;
  das1 := TDicomAttributes.Create;
  try
    das1.AddVariant($2817, $4, 'CONNID');
    das1.AddVariant($2817, $8, AUserCode);
    das1.AddVariant($2817, $2, AUserID);

    if fDataThread <> nil then
    begin
      fWaitForCommand := das1.GetString($2817, $4);
      fWaitForDatasets := nil;

      PostDataset('ADD', $10, 0, [0], das1);
      das2 := nil;

      while fWaitForDatasets = nil do
        ProcessWindowsMessageQueue;
      das2 := fWaitForDatasets;
      fWaitForCommand := '';
      fWaitForDatasets := nil;
    end
    else
      das2 := PostDatasetEx('ADD', $10, 0, [0], das1);

    if das2 <> nil then
    begin
      if (das2.getInteger($2817, $5) <> 1) and (das2.GetString($2817, $6) <> '') then
      begin
        CnsErrorMessage := das2.GetString($2817, $6);
      end
      else
      begin
        Result := das2.GetInteger($2817, $1);
      end;
      das2.Free;
    end;
  finally
    das1.free;
  end;
end;

function TDCMConferenceClient.Login(AUserCode, APassword: string): Boolean;
var
  das1, das2, das3: TDicomAttributes;
  da1: TDicomAttribute;
  v1: TDcmConferenceUserInfo;
  i: Integer;
begin
  if (fUserCode = '') or (fUserCode <> AUserCode) then
  begin
    ClearFriends;
    ClearConferences;
  end;

  Result := false;
  das1 := TDicomAttributes.Create;
  try
    das1.AddVariant($2817, $4, 'LOGIN');
    das1.AddVariant($2817, $8, AUserCode);
    das1.AddVariant($2817, $9, APassword);

    if fDataThread <> nil then
    begin
      fWaitForCommand := das1.GetString($2817, $4);
      fWaitForDatasets := nil;

      PostDataset('ADD', $10, 0, [0], das1);
      das2 := nil;

      while fWaitForDatasets = nil do
        ProcessWindowsMessageQueue;
      das2 := fWaitForDatasets;
      fWaitForCommand := '';
      fWaitForDatasets := nil;
    end
    else
      das2 := PostDatasetEx('LOGIN', $10, 0, [0], das1);
    if das2 <> nil then
    begin
      if (das2.getInteger($2817, $5) <> 1) and (das2.GetString($2817, $6) <> '') then
      begin
        CnsErrorMessage := das2.GetString($2817, $6);
        fUserCode := '';
        fPassword := '';
        FUserName := '';
        fUserID := 0;
      end
      else
      begin
        FUserName := das2.GetString($2817, $3);
        FUserID := das2.GetInteger($2817, $2);
        fUserCode := AUserCode;
        fPassword := APassword;
        fConnectionID := das2.GetInteger($2817, $1);

        da1 := das2.Add($2817, $2000);
        for i := 0 to fFriendList.Count - 1 do
        begin
          v1 := TDcmConferenceUserInfo(fFriendList[i]);
          v1.ConnectionID := -1;
        end;
        if (da1 <> nil) and (da1.GetCount > 0) then
        begin

          for i := 0 to da1.GetCount - 1 do
          begin
            das3 := da1.Attributes[i];
            v1 := FindDialogByUserID(das3.getInteger($2817, $1002));
            if v1 = nil then
            begin
              v1 := TDcmConferenceUserInfo.Create;
              AddDialogUser(v1);
            end;

            v1.FUserID := das3.getInteger($2817, $1002);
            v1.FUserCode := das3.getString($2817, $1004);
            v1.FUserName := das3.getString($2817, $1003);
            v1.FGroupName := das3.getString($2817, $1006);
            v1.FIPAddress := das3.getString($2817, $100E);
            v1.FMobil := das3.getString($2817, $C);

            //end;
            v1.FConnectionID := das3.getInteger($2817, $1001);
          end;
        end;
        if assigned(FOnConferenceRefreshFriends) then
          FOnConferenceRefreshFriends(self);

        Result := true;
      end;
      das2.Free;
    end;
    if fDataThread = nil then
    begin
      das1 := TDicomAttributes.Create;
      das1.AddVariant($2817, $4, 'INFORM');
      das1.AddVariant($2817, $7, 'NEWFRIEND');
      PostDataset('MSG', $11, $7F000000, [10000], das1);

      StartListen;
    end;
  finally
    das1.free;
  end;
end;

procedure TDCMConferenceClient.UploadVideo(AType: Integer; AConferenceID: Integer;
  AConnectionIDs: array of Integer; ABuffer: Pointer;
  ABufferCount: Integer; AWidth, AHeight: Integer);
var
  SendStm1: TDicomKXSocketStream;
  i: integer;
begin
  fNopCount := 0;
  Lock;
  SendStm1 := TDicomKXSocketStream.Create(fSocket);
  try
    if not Connected then
      Connected := true;
    fPath := 'UPLOAD';
    fSendBufferCount := ABufferCount + ReserveBufferCount + 8;
    if Connected then
    begin
      SendRequest('POST', '1.0');

      SendStm1.WriteBuffer(@AType, 4); //$20  or $40
      SendStm1.WriteBuffer(@AConferenceID, 4);
      for i := 0 to (ReserveBufferCount div 4) - 3 do
      begin
        if i <= High(AConnectionIDs) then
          SendStm1.WriteBuffer(@AConnectionIDs[i], 4)
        else
          SendStm1.WriteInt32(0);
      end;
      SendStm1.WriteBuffer(@AWidth, 4);
      SendStm1.WriteBuffer(@AHeight, 4);
      SendStm1.WriteBuffer(ABuffer, ABufferCount);

      SendStm1.FreshData;

      {ProcessWindowsMessageQueue;
      //no answer for upload buffer
      ProcessData;

      if assigned(ReceivedHeaderInfo) and (ReceivedHeaderInfo.PostData <> nil) then
      begin
        //Result := TDicomAttributes.Create;
        //Result.ReadData(ReserveBufferCount, ReceivedHeaderInfo.PostData, 8193);
      end;}
    end
    else
      raise Exception.Create(Format('Host %s:%d can not connected', [fHost, fPort]));
  finally
    SendStm1.Free;
    UnLock;
  end;
end;

procedure TDCMConferenceClient.PostDataset(Apath: string; AType, AConferenceID: Integer;
  AConnectionIDs: array of Integer; ADataset: TDicomAttributes);
label
  postretry;
var
  stm1: TMemoryStream;
  SendStm1: TDicomKXSocketStream;
  i: Integer;
  pi1: Pinteger;
  r1: Integer;
begin
  fNopCount := 0;
  Lock;
  SendStm1 := TDicomKXSocketStream.Create(fSocket, false);
  Stm1 := TMemoryStream.Create;
  try
    ADataset.AddVariant($2817, $1001, fConnectionID);
    ADataset.AddVariant($2817, $1002, fUserID);
    ADataset.AddVariant($2817, $1003, fUserName);
    ADataset.AddVariant($2817, $1004, fUserCode);
    ADataset.AddVariant($2817, $1008, AConferenceID);
    //ADataset.AddVariant($2817, $1005, Socket.);

    ADataset.Write(stm1, 8193, 100);

    if not Connected then
      Connected := true;
    fPath := APath;
    fSendBufferCount := Stm1.Size + ReserveBufferCount;
    r1 := 1;
    if Connected then
    begin
      postretry:
      SendRequest('POST', '1.0');

      SendStm1.WriteBuffer(@AType, 4); //$10
      SendStm1.WriteBuffer(@AConferenceID, 4); //$10
      for i := 0 to (ReserveBufferCount div 4) - 3 do
      begin
        if i <= High(AConnectionIDs) then
          SendStm1.WriteBuffer(@AConnectionIDs[i], 4)
        else
          SendStm1.WriteInt32(0);
      end;

      SendStm1.WriteBuffer(stm1.Memory, stm1.Size);
      try
        SendStm1.FreshData;
      except
        on e: Exception do
        begin
          self.FSocket.Disconnect;
          //ShowMessage(e.Message);
          self.RefreshUsers;

          r1 := r1 - 1;
        end;
      end;

      if r1 = 0 then
        goto postretry;
    end
    else
      raise Exception.Create(Format('Host %s:%d can not connected', [fHost, fPort]));
  finally
    stm1.Free;
    SendStm1.Free;
    Unlock;
  end;
end;

function TDCMConferenceClient.PostDatasetEx(Apath: string; AType, AConferenceID: Integer;
  AConnectionIDs: array of Integer; ADataset: TDicomAttributes): TDicomAttributes;
label
  postretry;
var
  stm1: TMemoryStream;
  SendStm1: TDicomKXSocketStream;
  i, r1: Integer;
  pi1: Pinteger;
begin
  fNopCount := 0;
  Result := nil;
  Lock;
  SendStm1 := TDicomKXSocketStream.Create(fSocket, false);
  Stm1 := TMemoryStream.Create;
  try
    ADataset.AddVariant($2817, $1001, fConnectionID);
    ADataset.AddVariant($2817, $1002, fUserID);
    ADataset.AddVariant($2817, $1003, fUserName);
    ADataset.AddVariant($2817, $1004, fUserCode);
    ADataset.AddVariant($2817, $1008, AConferenceID);
    //ADataset.AddVariant($2817, $1005, Socket.);

    ADataset.Write(stm1, 8193, 100);

    if not Connected then
      Connected := true;
    fPath := APath;
    fSendBufferCount := Stm1.Size + ReserveBufferCount;
    if Connected then
    begin
      r1 := 1;
      postretry:
      SendRequest('POST', '1.0');

      SendStm1.WriteBuffer(@AType, 4); //$10
      SendStm1.WriteBuffer(@AConferenceID, 4); //$10
      for i := 0 to (ReserveBufferCount div 4) - 3 do
      begin
        if i <= High(AConnectionIDs) then
          SendStm1.WriteBuffer(@AConnectionIDs[i], 4)
        else
          SendStm1.WriteInt32(0);
      end;

      SendStm1.WriteBuffer(stm1.Memory, stm1.Size);

      try
        SendStm1.FreshData;
      except
        on e: Exception do
        begin
          self.FSocket.Disconnect;
          //ShowMessage(e.Message);
          self.RefreshUsers;

          r1 := r1 - 1;
        end;
      end;

      if r1 = 0 then
        goto postretry;
      //      ProcessWindowsMessageQueue;
      ProcessData;

      if assigned(ReceivedHeaderInfo) and (ReceivedHeaderInfo.PostData <> nil) and
        (ReceivedHeaderInfo.PostData.Size > 64) then
      begin
        pi1 := ReceivedHeaderInfo.PostData.Memory;
        if pi1^ = $10 then
        begin
          Result := TDicomAttributes.Create;
          Result.ReadData(ReserveBufferCount, ReceivedHeaderInfo.PostData, 8193);
        end
        else
        begin

        end;
      end;
    end
    else
      raise Exception.Create(Format('Host %s:%d can not connected', [fHost, fPort]));
  finally
    stm1.Free;
    SendStm1.Free;
    Unlock;
  end;
end;

procedure TDCMConferenceClient.SetOnAudioDataAvailable(
  const Value: TOnConferenceDataAvailableEvent);
begin
  FOnAudioDataAvailable := Value;
end;

procedure TDCMConferenceClient.SetOnCanvasDataAvailable(
  const Value: TOnConferenceDataAvailableEvent);
begin
  FOnCanvasDataAvailable := Value;
end;

procedure TDCMConferenceClient.SetOnDatasetAvailable(
  const Value: TOnConferenceDatasetAvailableEvent);
begin
  FOnDatasetAvailable := Value;
end;

procedure TDCMConferenceClient.SetOnMouseDataAvailable(
  const Value: TOnConferenceDataAvailableEvent);
begin
  FOnMouseDataAvailable := Value;
end;

procedure TDCMConferenceClient.SetOnVideoDataAvailable(
  const Value: TOnConferenceDataAvailableEvent);
begin
  FOnVideoDataAvailable := Value;
end;

function TDCMConferenceClient.QueryServer: Boolean;
var
  p1: PByte;
  l1, t1, userid1, conferenceID1: Integer;
  pi1: Pinteger;
  das1, das3: TDicomAttributes;
  u1, u2: TDcmConferenceUserInfo;
  handled: Boolean;
  f1: TVideoConferenceForm;
  str1, str2: string;
  v1: TDcmConferenceUserInfo;
  i, k1: Integer;
  da1: TDicomAttribute;
begin
  Result := true;
  handled := false;
  p1 := nil;
  l1 := 0;

  p1 := fReceivedHeaderInfo.PostData.Memory;
  l1 := fReceivedHeaderInfo.PostData.Size;
  k1 := ReserveBufferCount;
  pi1 := fReceivedHeaderInfo.PostData.Memory;
  t1 := pi1^;
  if t1 in [$20, $21, $23, $10, $60, $70] then
  begin
    inc(pi1);
    conferenceID1 := pi1^;

    inc(pi1);
    userid1 := pi1^;

    u1 := nil;
    if conferenceID1 = 0 then
    begin
      if (fFriendList.Count > 0) and (userid1 <> 0) then
        u1 := FindDialogByUserID(userid1);
      if assigned(u1) then

    end
    else
      if conferenceID1 = $7F000000 then
    begin
      u1 := nil;
    end
    else
    begin
      if (fConferenceList.Count > 0) and (conferenceID1 <> 0) then
        u1 := FindConference(conferenceID1);
    end;
    if assigned(u1) then
    begin

      case t1 of
        //$2X, $4X raw data
        $20:
          begin
            inc(p1, k1);
            Handled := u1.FDialogForm <> nil;
            if Handled then
              TVideoConferenceForm(u1.FDialogForm).DoVideoDataAvailable(self, fReceivedHeaderInfo, p1, l1 - k1);
          end;
        $21:
          begin
            inc(p1, k1);
            Handled := u1.FDialogForm <> nil;
            if Handled then
              TVideoConferenceForm(u1.FDialogForm).DoAudioDataAvailable(self, fReceivedHeaderInfo, p1, l1 - k1);
          end;
        $22:
          begin
            inc(p1, k1);
            Handled := u1.FDialogForm <> nil;
            if Handled then
              TVideoConferenceForm(u1.FDialogForm).DoMouseDataAvailable(self, fReceivedHeaderInfo, p1, l1 - k1);
          end;
        $23:
          begin
            inc(p1, k1);
            Handled := u1.FDialogForm <> nil;
            if Handled then
              TVideoConferenceForm(u1.FDialogForm).DoAudioDataAvailable(self, fReceivedHeaderInfo, p1, l1 - k1);
          end;
        //$10 dataset from server
        //$60 dataset from other user directly
        $10, $60:
          begin
            das1 := TDicomAttributes.Create;
            try
              das1.ReadData(ReserveBufferCount, fReceivedHeaderInfo.PostData, 8193);

              if not assigned(u1.FDialogForm) then
              begin
                if das1.GetString($2817, 4) <> 'CLOSE' then
                begin
                  if assigned(FOnCreateVideoConferenceForm) then
                    FOnCreateVideoConferenceForm(self, u1, u1.fDialogForm);
                  if assigned(u1.FDialogForm) then
                  begin
                    f1 := TVideoConferenceForm(u1.FDialogForm);
                    f1.OwnerInfo := u1;

                    f1.OnSendMessage := DoSendMessage;
                    u2 := TDcmConferenceUserInfo.Create;
                    u2.UserID := u1.FUserID;
                    u2.UserCode := u1.UserCode;
                    u2.UserName := u1.UserName;
                    u2.ConnectionID := u1.ConnectionID;
                    u2.IPAddress := u1.IPAddress;
                    f1.AddDialogUser(u2);
                    f1.ConferenceClient := self;
                    //f1.DstUserID := u1.UserID;
                   //f1.DstUserName := u1.UserName;
                    //f1.Caption := UserName + ' Dialog with :' + u1.UserName;
                  end;
                end;
              end;
              if assigned(u1.FDialogForm) then
              begin
                if not u1.FDialogForm.Visible then
                begin
                  u1.FDialogForm.Show;
                end;
                SetWindowPos(u1.FDialogForm.Handle, HWND_TOP, 0, 0,
                  0, 0, SWP_NOMOVE + SWP_NOSIZE);
                Handled := true;

                TVideoConferenceForm(u1.FDialogForm).DoDatasetAvailable(self, fReceivedHeaderInfo, das1);
              end;
            finally
              das1.free;
            end;
          end;
        //$90 if no message
      else
        begin
          Result := false;
        end;
      end;
    end;
    if not handled then
      case t1 of
        //$2X, $4X raw data
        $20:
          begin
            inc(p1, k1);
            if assigned(FOnVideoDataAvailable) then
              FOnVideoDataAvailable(self, fReceivedHeaderInfo, p1, l1 - k1);
          end;
        $21:
          begin
            inc(p1, k1);
            if assigned(FOnAudioDataAvailable) then
              FOnAudioDataAvailable(self, fReceivedHeaderInfo, p1, l1 - k1);
          end;
        $22:
          begin
            inc(p1, k1);
            if assigned(FOnMouseDataAvailable) then
              FOnMouseDataAvailable(self, fReceivedHeaderInfo, p1, l1 - k1);
          end;
        $23:
          begin
            inc(p1, k1);
            if assigned(FOnAudioDataAvailable) then
              FOnAudioDataAvailable(self, fReceivedHeaderInfo, p1, l1 - k1);
          end;
        //$10 dataset from server
        //$60 dataset from other user directly
        $10, $60:
          begin
            das1 := TDicomAttributes.Create;

            das1.ReadData(ReserveBufferCount, fReceivedHeaderInfo.PostData, 8193);

            if (fWaitForCommand <> '') and (fWaitForCommand = das1.GetString($2817, $4)) then
            begin
              fWaitForDatasets := das1;
            end
            else
            begin
              str1 := das1.GetString($2817, 4);
              str2 := das1.GetString($2817, 7);
              if (str1 = 'INFORM') and (str2 = 'NEWFRIEND') then
              begin
                if (fUserCode <> '') and (fPassword <> '') then
                begin
                  das1.Free;
                  das1 := TDicomAttributes.Create;
                  das1.AddVariant($2817, $4, 'LOGIN');
                  das1.AddVariant($2817, $8, fUserCode);
                  das1.AddVariant($2817, $9, fPassword);

                  PostDataset('LOGIN', $10, 0, [0], das1);
                end;
              end
              else
                if (str1 = 'DISCONNECT') then
              begin
                StopListen;
              end
              else
                if (str1 = 'LOGIN') then
              begin
                if (das1.getInteger($2817, $5) <> 1) and (das1.GetString($2817, $6) <> '') then
                begin
                  CnsErrorMessage := das1.GetString($2817, $6);
                  fUserCode := '';
                  fPassword := '';
                  FUserName := '';
                  fUserID := 0;
                end
                else
                begin
                  da1 := das1.Add($2817, $2000);
                  for i := 0 to fFriendList.Count - 1 do
                  begin
                    v1 := TDcmConferenceUserInfo(fFriendList[i]);
                    v1.ConnectionID := -1;
                  end;
                  if (da1 <> nil) and (da1.GetCount > 0) then
                  begin

                    for i := 0 to da1.GetCount - 1 do
                    begin
                      das3 := da1.Attributes[i];
                      v1 := FindDialogByUserID(das3.getInteger($2817, $1002));
                      if v1 = nil then
                      begin
                        v1 := TDcmConferenceUserInfo.Create;
                        v1.FUserID := das3.getInteger($2817, $1002);
                        v1.FUserCode := das3.getString($2817, $1004);
                        v1.FUserName := das3.getString($2817, $1003);
                        v1.FGroupName := das3.getString($2817, $1006);
                        v1.FIPAddress := das3.getString($2817, $100E);
                        //v1.FConnectionID := das3.getInteger($2817, $1001);
                        AddDialogUser(v1);
                      end;
                      v1.FConnectionID := das3.getInteger($2817, $1001);
                    end;
                  end;
                  if assigned(FOnConferenceRefreshFriends) then
                    FOnConferenceRefreshFriends(self);
                end;
              end
              else
                if assigned(FOnDatasetAvailable) then
                FOnDatasetAvailable(self, fReceivedHeaderInfo, das1);
              das1.Free;
            end;
          end;
        //$90 if no message
      else
        begin
          Result := false;
        end;
      end;
  end
  else
    Result := false;
end;

{procedure TDCMConferenceClient.AddPostDataset(Apath: string; AType, AConferenceID,
  AConnectionID: Integer; ADataset: TDicomAttributes);
var
  v1: TDcmConferenceMessage;
begin
  v1 := TDcmConferenceMessage.Create;
  v1.fPath := APath;
  v1.fType := AType;
  v1.fToConnectionID := AConnectionID;
  V1.fFromConnectionID := fCOnnectionID;
  v1.fConferenceID := AConferenceID;
  v1.Dataset := ADataset;
  AddMessage(v1);
end;

procedure TDCMConferenceClient.AddUploadVideo(AType, AConferenceID, AConnectionID: Integer;
  ABuffer: Pointer; ABufferCount: Integer; AWidth, AHeight: Integer);
var
  v1: TDcmConferenceMessage;
begin
  v1 := TDcmConferenceMessage.Create;
  v1.fType := AType;
  v1.fToConnectionID := AConnectionID;
  V1.fFromConnectionID := fConnectionID;
  v1.fConferenceID := AConferenceID;
  v1.FVideoBuffer := ABuffer;
  v1.BufferCount := ABufferCount;
  v1.fWidth := AWidth;
  v1.fHeight := AHeight;
  AddMessage(v1);
end; }

procedure TDCMConferenceClient.SetCnsErrorMessage(const Value: string);
begin
  FCnsErrorMessage := Value;
end;

procedure TDCMConferenceClient.SetMaxTimerInterval(const Value: Integer);
begin
  FMaxTimerInterval := Value;
  fRefreshFriendListInterval := (30 * 1000) div FMaxTimerInterval;
  fRefreshTimer.Interval := FMaxTimerInterval;
end;

procedure TDCMConferenceClient.AddDialogUser(Value: TDcmConferenceUserInfo);
begin
  fFriendList.Add(Value);
end;

procedure TDCMConferenceClient.AddConference(Value: TDcmConferenceUserInfo);
begin
  fConferenceList.Add(Value);
end;

function TDCMConferenceClient.FindConference(
  AConferenceID: Integer): TDcmConferenceUserInfo;
var
  i: integer;
  n1: TDcmConferenceUserInfo;
begin
  for i := 0 to fConferenceList.Count - 1 do
  begin
    n1 := TDcmConferenceUserInfo(fConferenceList[i]);
    if n1.UserID = AConferenceID then
    begin
      Result := n1;
      break;
    end;
  end;
end;

function TDCMConferenceClient.FindDialogByConnectionID(
  AConnectionID: Integer): TDcmConferenceUserInfo;
var
  i: integer;
  n1: TDcmConferenceUserInfo;
begin
  for i := 0 to fFriendList.Count - 1 do
  begin
    n1 := TDcmConferenceUserInfo(fFriendList[i]);
    if n1.ConnectionID = AConnectionID then
    begin
      Result := n1;
      break;
    end;
  end;
end;

function TDCMConferenceClient.FindDialogByUserCode(
  AUserCode: string): TDcmConferenceUserInfo;
var
  i: integer;
  n1: TDcmConferenceUserInfo;
begin
  for i := 0 to fFriendList.Count - 1 do
  begin
    n1 := TDcmConferenceUserInfo(fFriendList[i]);
    if n1.UserCode = AUserCode then
    begin
      Result := n1;
      break;
    end;
  end;
end;

function TDCMConferenceClient.FindDialogByUserID(
  AUserID: Integer): TDcmConferenceUserInfo;
var
  i: integer;
  n1: TDcmConferenceUserInfo;
begin
  for i := 0 to fFriendList.Count - 1 do
  begin
    n1 := TDcmConferenceUserInfo(fFriendList[i]);
    if n1.UserID = AUserID then
    begin
      Result := n1;
      break;
    end;
  end;
end;

procedure TDCMConferenceClient.SetOnCreateVideoConferenceForm(
  const Value: TOnCreateVideoConferenceFormEvent);
begin
  FOnCreateVideoConferenceForm := Value;
end;

procedure TDCMConferenceClient.DoSendMessage(Sender: TObject;
  AConferenceID: Integer;
  AUserID: array of Integer; ADataset: TDicomAttributes);
begin
  try
    PostDataset('MSG', $60, AConferenceID, AUserID, ADataset);
  finally
    ADataset.free;
  end;
end;

procedure TDCMConferenceClient.StartDialog(Value: TDcmConferenceUserInfo);
var
  f1: TVideoConferenceForm;
  u2: TDcmConferenceUserInfo;
begin
  if assigned(Value) then
  begin
    if not assigned(Value.FDialogForm) then
    begin
      if GetFriendConnectionID(Value.UserID, '') > 0 then
      begin
        if assigned(FOnCreateVideoConferenceForm) then
          FOnCreateVideoConferenceForm(self, Value, Value.fDialogForm);
        if assigned(Value.FDialogForm) then
        begin
          f1 := TVideoConferenceForm(Value.FDialogForm);
          f1.OwnerInfo := Value;
          f1.OnSendMessage := DoSendMessage;
          u2 := TDcmConferenceUserInfo.Create;
          u2.UserID := Value.FUserID;
          u2.UserCode := Value.UserCode;
          u2.UserName := Value.UserName;
          u2.ConnectionID := Value.ConnectionID;
          u2.IPAddress := Value.IPAddress;

          //f1.Caption := UserName + ' Dialog with :' + Value.UserName;
          f1.AddDialogUser(u2);
          f1.ConferenceClient := self;

          f1.Show;
          SetWindowPos(f1.Handle, HWND_TOP, 0, 0,
            //Screen.Width, Screen.Height,
            0, 0,
            SWP_NOMOVE + SWP_NOSIZE);
        end
        else //amessage
          raise Exception.Create(ConferenceStringCanNotCreateDialog);
      end
      else //amessage
        raise Exception.Create(Value.UserName + ConferenceStringClientIsNotConnect);
    end
    else
    begin
      //Value.FDialogForm.Close;
      Value.FDialogForm.Show;
      SetWindowPos(Value.FDialogForm.Handle, HWND_TOP, 0, 0,
        //Screen.Width, Screen.Height,
        0, 0,
        SWP_NOMOVE + SWP_NOSIZE);
    end;
  end;
end;

function TDCMConferenceClient.GetFriend(
  index: Integer): TDcmConferenceUserInfo;
begin
  if (fFriendList.Count > 0) and (index >= 0) and (index < fFriendList.Count) then
    Result := TDcmConferenceUserInfo(fFriendList[index])
  else
    Result := nil;
end;

function TDCMConferenceClient.GetFriendCount: Integer;
begin
  Result := fFriendList.Count;
end;

function TDCMConferenceClient.GetConferenceID: Integer;
var
  das1, das2: TDicomAttributes;
begin
  Result := -1;
  das1 := TDicomAttributes.Create;
  try
    das1.AddVariant($2817, $4, 'NEWCON');
    das1.AddVariant($2817, $8, UserCode);
    das1.AddVariant($2817, $2, UserID);

    if fDataThread <> nil then
    begin
      fWaitForCommand := das1.GetString($2817, $4);
      fWaitForDatasets := nil;

      PostDataset('ADD', $10, 0, [0], das1);
      das2 := nil;

      while fWaitForDatasets = nil do
        ProcessWindowsMessageQueue;
      das2 := fWaitForDatasets;
      fWaitForCommand := '';
      fWaitForDatasets := nil;
    end
    else
      das2 := PostDatasetEx('ADD', $10, 0, [0], das1);

    //das2 := PostDatasetEx('ADD', $10, 0, [0], das1);
    if das2 <> nil then
    begin
      if (das2.getInteger($2817, $5) <> 1) and (das2.GetString($2817, $6) <> '') then
      begin
        CnsErrorMessage := das2.GetString($2817, $6);
      end
      else
      begin
        Result := das2.GetInteger($2817, $A);
      end;
      das2.Free;
    end;
  finally
    das1.free;
  end;
end;

procedure TDCMConferenceClient.NOP;
var
  das1: TDicomAttributes;
begin
  das1 := TDicomAttributes.Create;
  try
    das1.AddVariant($2817, $4, 'NOP');
    PostDataset('NOP', $10, 0, [0], das1);
  finally
    das1.free;
  end;
end;

function TDCMConferenceClient.RegisterConferenceSpeakerName(AConferenceID: Integer): Integer;
var
  das1, das2: TDicomAttributes;
begin
  Result := 0;
  das1 := TDicomAttributes.Create;
  try
    das1.AddVariant($2817, $4, 'CONSPEAK');
    das1.AddVariant($2817, $3, UserName);
    das1.AddVariant($2817, $2, AConferenceID);

    if fDataThread <> nil then
    begin
      fWaitForCommand := das1.GetString($2817, $4);
      fWaitForDatasets := nil;

      PostDataset('ADD', $10, 0, [0], das1);
      das2 := nil;

      while fWaitForDatasets = nil do
        ProcessWindowsMessageQueue;
      das2 := fWaitForDatasets;
      fWaitForCommand := '';
      fWaitForDatasets := nil;
    end
    else
      das2 := PostDatasetEx('ADD', $10, 0, [0], das1);
    if das2 <> nil then
    begin
      if (das2.getInteger($2817, $5) <> 1) then
      begin
        CnsErrorMessage := das2.GetString($2817, $6);
        Result := 0;
      end
      else
      begin
        Result := das2.getInteger($2817, $1);
      end;
      das2.Free;
    end;
  finally
    das1.free;
  end;
end;

function TDCMConferenceClient.UnRegisterConferenceSpeakerName(AConferenceID, AHandleID: Integer): Integer;
var
  das1, das2: TDicomAttributes;
begin
  Result := 0;
  das1 := TDicomAttributes.Create;
  try
    das1.AddVariant($2817, $4, 'CONSPEAK');
    das1.AddVariant($2817, $3, '');
    das1.AddVariant($2817, $2, AConferenceID);
    das1.AddVariant($2817, $1, AHandleID);

    if fDataThread <> nil then
    begin
      fWaitForCommand := das1.GetString($2817, $4);
      fWaitForDatasets := nil;

      PostDataset('ADD', $10, 0, [0], das1);
      das2 := nil;

      while fWaitForDatasets = nil do
        ProcessWindowsMessageQueue;
      das2 := fWaitForDatasets;
      fWaitForCommand := '';
      fWaitForDatasets := nil;
    end
    else
      das2 := PostDatasetEx('ADD', $10, 0, [0], das1);
    if das2 <> nil then
    begin
      if (das2.getInteger($2817, $5) <> 1) then
      begin
        CnsErrorMessage := das2.GetString($2817, $6);
        Result := 0;
      end
      else
      begin
        Result := das2.getInteger($2817, $1);
      end;
      das2.Free;
    end;
  finally
    das1.free;
  end;
end;

procedure TDCMConferenceClient.RemoveConference(
  Value: TDcmConferenceUserInfo);
begin
  fConferenceList.Remove(Value);
end;

procedure TDCMConferenceClient.ClearFriends;
var
  i: Integer;
begin
  for i := 0 to fFriendList.Count - 1 do
    TDcmConferenceUserInfo(fFriendList[i]).Free;
  fFriendList.Clear;
end;

procedure TDCMConferenceClient.ClearConferences;
var
  i: Integer;
begin
  for i := 0 to fConferenceList.Count - 1 do
    TDcmConferenceUserInfo(fConferenceList[i]).Free;
  fConferenceList.Clear;
end;

procedure TDCMConferenceClient.SetOnSocketDisconnect(
  const Value: TNotifyEvent);
begin
  FOnSocketDisconnect := Value;
end;

procedure TDCMConferenceClient.SetOnConferenceRefreshFriends(
  const Value: TNotifyEvent);
begin
  FOnConferenceRefreshFriends := Value;
end;

procedure TDCMConferenceClient.SetRefreshFriendListInterval(
  const Value: Integer);
begin
  FRefreshFriendListInterval := Value;
end;

procedure TDCMConferenceClient.RefreshUsers;
begin
  if fUserCode <> '' then
  begin
    FRefreshFriendListTimeout := RefreshFriendListInterval;
    Login(fUserCode, fPassword);
  end;
end;

function TDCMConferenceClient.SendToAllDialogUsers(ADataset: TDicomAttributes): Boolean;
var
  das1: TDicomAttributes;
  da2: TDicomAttribute;
  k1, k, i: Integer;
  cn1: TDcmConferenceUserInfo;
begin
  for i := 0 to FriendsCount - 1 do
  begin
    cn1 := Friends[i];
    k := 0;
    if (cn1.DialogForm <> nil) and (TVideoConferenceForm(cn1.DialogForm).CanSendImageSynchronization) then
    begin
      inc(k);
    end;
  end;
  Result := k > 0;
  if k > 0 then
  begin
    for i := 0 to FriendsCount - 1 do
    begin
      cn1 := Friends[i];
      if (cn1.DialogForm <> nil) and (TVideoConferenceForm(cn1.DialogForm).CanSendImageSynchronization) then
      begin
        PostDataset('MSG', $70, $7F000000, [cn1.UserID], ADataset);
      end;
    end;
    //DCMConferenceClient1.PostDataset('MSG', $70, $7F000000, n1, das1);
  end;
end;

procedure TDCMConferenceClient.StartListen;
begin
  if fDataThread = nil then
  begin
    ReceiveTimeout := -1;

    fDataThread := TDCMConferenceClientThread.Create(false);
    //fDataThread.FForQueryServer := true;
    fDataThread.FreeOnTerminate := true;

    fDataThread.OnTerminate := OnDataThreamTerminate;
    fDataThread.ConferenceClient := self;

    fRefreshTimer.Enabled := true;
    
    fDataThread.Resume;
  end;
end;

procedure TDCMConferenceClient.OnDataThreamTerminate(Sender: TObject);
begin
  { fDataThread := nil;
   if fRefreshTimer <> nil then
     fRefreshTimer.Enabled := false; }
end;

procedure TDCMConferenceClient.DoRefreshTimer(Sender: TObject);
begin
  {dec(FRefreshFriendListTimeout);
  if FRefreshFriendListTimeout = 0 then
  begin
    FRefreshFriendListTimeout := RefreshFriendListInterval;
    if fUserCode <> '' then
    begin
      Login(fUserCode, fPassword);
    end;
  end
  else }
  if fSocket.Connected then
  begin
    inc(fNopCount);
    if fNopCount >= 10 then
    begin
      try
        NOP;
      except
        fRefreshTimer.Enabled := false;
      end;
      fNopCount := 0;
    end;
  end;
end;

procedure TDCMConferenceClient.StopListen;
begin
  if fDataThread <> nil then
    fDataThread.Terminate;

  fRefreshTimer.Enabled := false;
end;

{ TDcmConferenceUserInfo }

constructor TDcmConferenceUserInfo.Create;
begin
  Client := nil;
  FConnectionID := 0;
  FUserID := 0;
  FIconIndex := 0;
  FIPAddress := '';
  FEMail := '';
  FGroupName := '';
  FUserName := '';
  FUserCode := '';
  FDialogForm := nil;
  FPassword := '';
end;

destructor TDcmConferenceUserInfo.Destroy;
begin
  if FDialogForm <> nil then
  begin
    //    FDialogForm.Free;
  end;
  inherited;
end;

function TDcmConferenceUserInfo.GetIsOnline: Boolean;
begin
  Result := FConnectionID > 0;
end;

procedure TDcmConferenceUserInfo.SetConnectionID(const Value: Integer);
begin
  FConnectionID := Value;
end;

procedure TDcmConferenceUserInfo.SetDialogForm(const Value: TForm);
begin
  FDialogForm := Value;
end;

procedure TDcmConferenceUserInfo.SetEMail(const Value: string);
begin
  FEMail := Value;
end;

procedure TDcmConferenceUserInfo.SetGroupName(const Value: string);
begin
  FGroupName := Value;
end;

procedure TDcmConferenceUserInfo.SetIconIndex(const Value: Integer);
begin
  FIconIndex := Value;
end;

procedure TDcmConferenceUserInfo.SetIPAddress(const Value: string);
begin
  FIPAddress := Value;
end;

procedure TDcmConferenceUserInfo.SetMobil(const Value: string);
begin
  FMobil := Value;
end;

procedure TDcmConferenceUserInfo.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TDcmConferenceUserInfo.SetUserCode(const Value: string);
begin
  FUserCode := Value;
end;

procedure TDcmConferenceUserInfo.SetUserID(const Value: Integer);
begin
  FUserID := Value;
end;

procedure TDcmConferenceUserInfo.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

{ TDcmConferenceMessage }

procedure TDcmConferenceMessage.CopyVideoBuffer(ABuffer: Pointer;
  ABufferCount: Integer);
begin
  if assigned(FVideoBuffer) then
    FreeMem(FVideoBuffer);
  GetMem(FVideoBuffer, ABufferCount);

  BufferCount := ABufferCount;
  Move(ABuffer^, FVideoBuffer^, ABufferCount);
end;

constructor TDcmConferenceMessage.Create;
begin
  FLockCount := 0;
  FSemaphore := CreateSemaphore(nil, 1, 1, nil);
  FDataset := nil;
  fType := 0;
  fPath := '';
  fUserID := 0;

  fFromConnectionID := 0;
  fToConnectionID := 0;

  FBufferCount := 0;
  FVideoBuffer := nil;
end;

destructor TDcmConferenceMessage.Destroy;
begin
  if FDataset <> nil then
    FDataset.Free;
  if assigned(FVideoBuffer) then
    FreeMem(FVideoBuffer);
  inherited;
end;

function TDcmConferenceMessage.GetIsLocked: boolean;
begin
  Result := (FLockCount > 0);
end;

procedure TDcmConferenceMessage.Lock;
begin
  TryLock(INFINITE);
  //inc(FLockCount);
end;

procedure TDcmConferenceMessage.SetBufferCount(const Value: Integer);
begin
  FBufferCount := Value;
end;

procedure TDcmConferenceMessage.SetDataset(const Value: TDicomAttributes);
begin
  FDataset := Value;
end;

procedure TDcmConferenceMessage.TryLock(TimeOut: DWORD);
var
  n: DWORD;
begin
  // Wait for critical section.
  inc(FLockCount);
  n := WaitForSingleObject(FSemaphore, TimeOut);
  if (n = WAIT_TIMEOUT) or (n = WAIT_FAILED) then
  begin
    dec(FLockCount);
    exit;
  end;
end;

procedure TDcmConferenceMessage.Unlock;
begin
  ReleaseSemaphore(FSemaphore, 1, nil);
  dec(FLockCount);
end;

{ TDCMConferenceClientThread }

constructor TDCMConferenceClientThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  fConferenceClient := nil;
end;

destructor TDCMConferenceClientThread.Destroy;
begin

  inherited;
end;

procedure TDCMConferenceClientThread.Execute;
begin
  try
    if assigned(fConferenceClient) and fConferenceClient.Connected then
      while not Terminated do
      begin
        if assigned(fConferenceClient) then
        begin
          //while (not Terminated) and (fConferenceClient.Connected) do
          if fConferenceClient.Connected then
          begin
            try
              fConferenceClient.ProcessData;
            except
              on e: Exception do
              begin

              end;
            end;

            if Terminated then
              break;

            if assigned(fConferenceClient.ReceivedHeaderInfo) and (fConferenceClient.ReceivedHeaderInfo.PostData <> nil) then
            begin
              Synchronize(QueryServer);
            end;
          end
          else
            break;
        end;
        ProcessWindowsMessageQueue;
        //if FreeOnTerminate then
        //  Break;
        //if not Terminated then
        //  Suspend;
      end;
  finally
    Terminate;
  end;
end;

procedure TDCMConferenceClientThread.QueryServer;
begin
  if fConferenceClient <> nil then
    fConferenceClient.QueryServer;
end;

procedure TDCMConferenceClientThread.SetConferenceClient(
  const Value: TDCMConferenceClient);
begin
  FConferenceClient := Value;
end;

initialization
  ConferenceStringClientIsNotConnect := '  is not online';
  ConferenceStringCanNotCreateDialog := 'Can not Create Dialog Form';
  ConferenceStringHostCanNotConnect := 'Host %s:%d can not connected';
end.

