{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_Connection;
{.$DEFINE DICOMDEBUG}
{$I DicomPack.inc}
{$DEFINE MSWINDOWS_}

interface

uses
  SysUtils, Classes, DCM_UID, DCM_Attributes, DCM_dict, math, dialogs,
  {$IFDEF DICOMINDYCLIENT}CnsTCPConnection, {$ELSE}
  {$IFDEF DICOMVCSCLIENT}OverbyteIcsWinsock, OverbyteIcsWSocket, OverbyteIcsWSockBuf, {$ELSE}
  KXSock, KxString, KxSockClient, kxsocket, {$ENDIF}{$ENDIF}windows, WinSock,
  {$IFDEF DICOMDEBUG}DbugIntf, {$ENDIF}cnsmsg, DateUtils;
const
  INFLATE_ALWAYS = 0;
  INFLATE_IF_NONLINEAR = 1;
  INFLATE_NEVER = 2;
  MAX_PDU_SIZE = 1 * 1024 * 1024;
  SOP_CLASSES: array[0..7] of Integer = (Verification,
    BasicGrayscalePrintManagementMetaSOPClass,
    BasicColorPrintManagementMetaSOPClass,
    BasicPrintImageOverlayBox,
    BasicAnnotationBox,
    PresentationLUT,
    PrintJob,
    PrinterConfigurationRetrieval);
  ONLY_DEF_TS: array[0..0] of Integer = (8193);
  PLUTMODULE_DNAMES: array[0..1] of Integer = (1239, 1240);
  PIXELMODULE_DNAMES: array[0..9] of Integer = (461, 462, 466, 467, 473, 475, 476, 477, 478, 1184
    );

  UNKNOWN = 0;
  SUCCESS = 1;
  PENDING = 2;
  CANCEL = 3;
  WARNING = 4;
  FAILURE = 5;

  DICOM_DATA_PRESENT = $102; //0 ?? jiawen-2004-10-8
  DICOM_DATA_NOT_PRESENT = $101;

  C_DATABASE_REQUEST = 101;
  C_DATABASE_RESPONSE = 31800;

  N_EVENT_REPORT_REQUEST = 256;
  N_EVENT_REPORT_RESPONSE = 33024;
  N_GET_REQUEST = 272;
  N_GET_RESPONSE = 33040;
  N_SET_REQUEST = 288;
  N_SET_RESPONSE = 33056;
  N_ACTION_REQUEST = 304;
  N_ACTION_RESPONSE = 33072;
  N_CREATE_REQUEST = 320;
  N_CREATE_RESPONSE = 33088;
  N_DELETE_REQUEST = 336;
  N_DELETE_RESPONSE = $8150;
  C_STORE_REQUEST = 1;
  C_STORE_RESPONSE = 32769;
  C_GET_REQUEST = 16;
  C_GET_RESPONSE = 32784;
  C_FIND_REQUEST = 32;
  C_FIND_RESPONSE = 32800;
  C_MOVE_REQUEST = 33;
  C_MOVE_RESPONSE = 32801; //$8021
  C_ECHO_REQUEST = 48; //$30
  C_ECHO_RESPONSE = 32816; //$8030
  C_CANCEL_FIND_REQUEST = 4095;

  MEDIUM_PRIORITY = 0;
  HIGH_PRIORITY = 1;
  LOW_PRIORITY = 2;

  //Request
  NO_SUPPORT_SCU_ROLE = 0;
  SUPPORT_SCU_ROLE = 1;
  NO_SUPPORT_SCP_ROLE = 0;
  SUPPORT_SCP_ROLE = 1;
  DEFAULT = -1;

  //Association
  PDATA_PDU = 10;
  RELEASE_REQUEST = 11;
  ABORT = 12;
  RELEASE_RESPONSE = 13;
  ASSOCIATE_REQUEST = 14;
  ASSOCIATE_ACKNOWLEDGE = 15;
  ASSOCIATE_REJECT = 16;

  //Acknowledge
//  NO_SUPPORT_SCU_ROLE = 0;
//  SUPPORT_SCU_ROLE = 1;
//  NO_SUPPORT_SCP_ROLE = 0;
//  SUPPORT_SCP_ROLE = 1;
//  DEFAULT = -1;
  ACCEPTANCE = 0;
  USER_REJECTION = 1;
  NO_REASON = 2;
  ABSTRACT_SYNTAX_NOT_SUPPORTED = 3;
  TRANSFER_SYNTAXES_NOT_SUPPORTED = 4;

  //reject
  REJECTED_PERMANENT = 1;
  REJECTED_TRANSIENT = 2;
  DICOM_UL_SERVICE_USER_reject = 1;
  DICOM_UL_SERVICE_PROVIDER_ACSE = 2;
  DICOM_UL_SERVICE_PROVIDER_PRESENTATION = 3;

  USER_NO_REASON_GIVEN = 1;
  USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED = 2;
  USER_CALLING_AETITLE_NOT_RECOGNIZED = 3;

  FReason_ACSE_PROTOCOL_NOT_SUPPORTED = 4;
  FReason_PRESENTATION_TEMPORARY_CONGESTION = 5;
  FReason_PRESENTATION_LOCAL_LIMIT_EXCEEDED = 6;
  USER_CALLED_AETITLE_NOT_RECOGNIZED = 7;

  ACSE_NO_REASON_GIVEN = 1;
  ACSE_PROTOCOL_NOT_SUPPORTED = 2;
  PRESENTATION_TEMPORARY_CONGESTION = 1;
  PRESENTATION_LOCAL_LIMIT_EXCEEDED = 2;

  //abort
  DICOM_UL_SERVICE_USER_abort = 0;
  DICOM_UL_SERVICE_PROVIDER = 2;
  REASON_NOT_SPECIFIED = 0;
  UNRECOGNIZED_PDU = 1;
  UNEXPECTED_PDU = 2;
  UNRECOGNIZED_PDU_PARAMETER = 4;
  UNEXPECTED_PDU_PARAMETER = 5;
  INVALID_PDU_PARAMETER_VALUE = 6;

type
  {$IFNDEF LEVEL6}
  PInteger = ^Integer;
  PByte = ^Byte;
  PShortInt = ^ShortInt;
  {$ENDIF}
  TRequest = class;
  TDicomRequestEvent = procedure(Address: AnsiString; ACommand: TDicomAttributes; ARequestDatasets,
    AResponseDatasets: TList) of object;
  TDicomAssociationEvent = procedure(Address: AnsiString; AReg: TRequest; var AAccept: Boolean) of
    object;

  TDisplayEvent = procedure(Sender: TObject; Msg: AnsiString) of object;
  TTimeoutEvent = procedure(Sender: TObject; var CanClose: Boolean) of object;
  TAssociationRequest = procedure(Sender: TObject;
    const CallingAE, CalledAE, CallingIPAddress: WideString;
    Association: Integer; var isOK: WordBool) of object;
  TImageReceived = procedure(Sender: TObject;
    const ReceivedImage: TDicomAttributes; Association: Integer;
    var isAdded: WordBool; var Status: Integer) of object;
  TVerifyReceived = procedure(Sender: TObject; var Status: Integer) of object;
  TQueryRequest = procedure(Sender: TObject; AReceivedImage, ResponseImage:
    TDicomAttributes) of object;
  TIEListChanges = set of (ielItems, ielRange, ielCurrentValue);

  TKXList = class
  private
    fCount: integer;
  protected
    fItemSize: integer; // sizeof(...)
    fData: pointer;
    fChanged: TIEListChanges;
    procedure SetCount(v: integer); virtual;
    function AddItem(v: pointer): integer;
    procedure InsertItem(idx: integer; v: pointer);
    function IndexOfItem(v: pointer): integer;
    function BaseGetItem(idx: integer): pointer;
    procedure BaseSetItem(idx: integer; v: pointer);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Delete(idx: integer); virtual;
    property Count: integer read fCount write SetCount;
    procedure Clear; virtual;
    procedure Assign(Source: TKXList); virtual;
    property Changed: TIEListChanges read fChanged write fChanged;
  end;
  TKXIntegerList = class(TKXList)
  private
    fRangeMin: integer;
    fRangeMax: integer;
    fRangeStep: integer;
    fCurrentValue: integer;
    function GetItem(idx: integer): integer;
    procedure SetItem(idx: integer; v: integer);
    procedure SetRangeMax(v: integer);
    procedure SetRangeMin(v: integer);
    procedure SetRangeStep(v: integer);
    procedure SetCurrentValue(v: integer);
  public
    function Add(v: integer): integer;
    procedure Insert(idx: integer; v: integer);
    procedure Clear; override;
    function IndexOf(v: integer): integer;
    property RangeMin: integer read fRangeMin write SetRangeMin;
    property RangeMax: integer read fRangeMax write SetRangeMax;
    property RangeStep: integer read fRangeStep write SetRangeStep;
    property Items[idx: integer]: integer read GetItem write SetItem; default;
    procedure Assign(Source: TKXList); override;
    property CurrentValue: integer read fCurrentValue write SetCurrentValue;
  end;
  {$IFDEF USER_FILE_PDUSTREAM}

  TPDUStream = class(TFileStream) //(TMemoryStream)
  private
    fReallocCount: Integer;
    fTempFileName: AnsiString;
  protected
    //    function Realloc(var NewCapacity: Longint): Pointer; override;
  public
    constructor Create(const FileName: AnsiString);
    destructor Destroy; override;
    //    procedure Remove(const AByteCount: integer); virtual;
    //    procedure AppendBuffer(AData: Pointer; ALen: Integer);
  end;
  {$ELSE}
  {$IFDEF USERMEMORYPDUSTREAM}
  TPDUStream = class(TMemoryStream)
  private
    fReallocCount: Integer;
  protected
    function Realloc(var NewCapacity: Longint): Pointer; override;

  public
    constructor Create;
    procedure Remove(const AByteCount: integer); virtual;
    procedure AppendBuffer(AData: Pointer; ALen: Integer);
  end;
  {$ENDIF}
  {$ENDIF}
  TDicomIOStream = class
  private
    c: array[0..7] of Byte;
    fReceiveTimeout: Integer;
  protected
    fPDUSize: Integer;

    procedure SetReceiveTimeout(Value: Integer); virtual;
    procedure SetPDUSize(Value: Integer); virtual;
  public
    constructor Create;
    destructor Destroy; override;

    procedure FreshData; virtual;

    function ReadBuffer(Buffer: Pointer; ACount: Integer): integer; virtual;
    procedure WriteBuffer(Buffer: Pointer; ACount: Integer); virtual;

    function ReadChar: Char;
    function ReadInt8: ShortInt;
    function ReadInt16: SmallInt;
    function ReadInt32: Integer;
    function ReadString(ACount: Integer): AnsiString;
    procedure ReadSkipBytes(ABytes: Integer);

    procedure WriteInt8(AInteger: ShortInt);
    procedure WriteInt16(i: SmallInt);
    procedure WriteInt32(i: Integer);
    procedure WriteString(AStr: AnsiString);
    procedure WriteSkipBytes(ABytes: Integer);

    procedure WriteStream(AStream: TStream); virtual;
    function ReadStream(AStream: TStream): Boolean; virtual;
    procedure WriteFile(AFileName: AnsiString); virtual;
    property ReceiveTimeout: Integer read fReceiveTimeout write SetReceiveTimeout;

    property PDUSize: Integer read fPDUSize write SetPDUSize;
  end;
  {$IFDEF DICOMINDYCLIENT}
  TDicomTCPSocketStream = class(TDicomIOStream)
  private
    FSocket: TCnsTCPConnection;
  protected
    procedure FreshData; override;
    procedure SetPDUSize(Value: Integer); override;
  public
    constructor Create(ASocket: TCnsTCPConnection);
    destructor Destroy; override;
    function ReadBuffer(Buffer: Pointer; ACount: Integer): integer; override;
    procedure WriteBuffer(Buffer: Pointer; ACount: Integer); override;
    procedure WriteStream(AStream: TStream); override;
    function ReadStream(AStream: TStream): Boolean; override;
  end;
  {$ENDIF}
  {$IFDEF DICOMVCSCLIENT}
  TDicomVCSSocketStream = class(TDicomIOStream)
  private
    FSocket: TCustomWSocket;
  protected
    procedure FreshData; override;
    procedure SetPDUSize(Value: Integer); override;
  public
    constructor Create(ASocket: TCustomWSocket);
    destructor Destroy; override;
    function ReadBuffer(Buffer: Pointer; ACount: Integer): integer; override;
    procedure WriteBuffer(Buffer: Pointer; ACount: Integer); override;
    procedure WriteStream(AStream: TStream); override;
    function ReadStream(AStream: TStream): Boolean; override;

  end;
  {$ENDIF}
  {$IFDEF DICOMWSOCKCLIENT}
  TDicomKXSocketStream = class(TDicomIOStream)
  private
    FSocket: TKXSock;

    fReadBuffer: PAnsiChar;
    fReadBufferCount: Integer;
    fReadBufferSize: integer;
    fReadBufferPosition: Integer;

    fBuffer: PAnsiChar;
    fCurBuffer: PAnsiChar;
    fPosition: Integer;

    FBufferReadMode: Boolean;
    FBufferWriteMode: Boolean;
    procedure SetBufferReadMode(const Value: Boolean);
    procedure SetBufferWriteMode(const Value: Boolean);
  protected
    procedure SetReceiveTimeout(Value: Integer); override;
    procedure SetPDUSize(Value: Integer); override;

  public
    constructor Create(ASocket: TKXSock; ABufferWriteMode: Boolean = True);
    destructor Destroy; override;
    procedure FreshData; override;

    function ReadBuffer(Buffer: Pointer; ACount: Integer): integer; override;
    function ReadBufferEx(Buffer: Pointer; ACount: Integer): Integer;

    procedure WriteBuffer(Buffer: Pointer; ACount: Integer); override;
    procedure WriteStream(AStream: TStream); override;
    function ReadStream(AStream: TStream): Boolean; override;
    procedure WriteFile(AFileName: AnsiString); override;

    property BufferReadMode: Boolean read FBufferReadMode write SetBufferReadMode;
    property BufferWriteMode: Boolean read FBufferWriteMode write SetBufferWriteMode;
  end;
  {$ENDIF}
  TDicomMemoryStream = class(TDicomIOStream)
  private
    FStm: TStream;
    FSelfCreateStream: Boolean;
  protected
  public
    constructor Create(AData: AnsiString); overload;
    constructor Create(AStm: TStream); overload;
    destructor Destroy; override;
    function ReadBuffer(Buffer: Pointer; ACount: Integer): integer; override;
    procedure WriteBuffer(Buffer: Pointer; ACount: Integer); override;
    procedure AddString(AData: AnsiString);
    procedure ResetPosition;
    property Stm: TStream read FStm;
    procedure WriteStream(AStream: TStream); override;
    function ReadStream(AStream: TStream): Boolean; override;
  end;
  TDicomResponse = class
  private
    FSource: Integer;
    FReason: Integer;
    FResult: Integer;
  protected
    function GetText: AnsiString; virtual;
    function fstr(AStr: AnsiString; ALen: Integer): AnsiString; overload;
    function fstr(i: Integer; ALen: Integer): AnsiString; overload;
  public
    destructor Destroy; override;
    property Source: Integer read FSource;
    property Reason: Integer read FReason;
    property ResponseResult: Integer read FResult;
    property Text: AnsiString read GetText;
  end;

  TDicomAbort = class(TDicomResponse)
  private
  protected
    function GetText: AnsiString; override;
  public
    constructor Create(ASource, AReason: Integer);
  end;

  TDicomReject = class(TDicomResponse)
  private
  protected
    function GetText: AnsiString; override;
  public
    constructor Create(ASource, AReason, AResult: Integer);
  end;

  TApplicationContextItem = class
  private
    { Private declarations }
    FItemType: ShortInt;
    FUID: AnsiString;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
    function read(datainputstream: TDicomIOStream): Integer;
  public
    { Public declarations }
    { public function declarations }
    constructor Create;
    function DataLength: Integer;
    procedure Write(dataoutputstream: TDicomIOStream);

    property GetUID: AnsiString read FUID;
  end;

  TAbstractSyntaxItem = class
  private
    { Private declarations }
    FItemType: ShortInt;
    FAbstractSyntax: TUIDEntry;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create(uidentry: TUIDEntry); overload;
    constructor Create; overload;
    function getLength: Integer;

    procedure write(dataoutputstream: TDicomIOStream);
    function read(datainputstream: TDicomIOStream): Integer;

    property AbstractSyntax: TUIDEntry read FAbstractSyntax;
  end;

  TTransferSyntaxItem = class
  private
    { Private declarations }
    FItemType: ShortInt;
    FTransferSyntax: TUIDEntry;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(uidentry: TUIDEntry); overload;
    function getTransferSyntax: TUIDEntry;
    function getLength: Integer;
    procedure Write(dataoutputstream: TDicomIOStream);
    function Read(datainputstream: TDicomIOStream): Integer;
  end;

  TPresentationContextItem = class
  private
    { Private declarations }
    FItemType: ShortInt;
    FID: Integer; //ID
    FTransferSyntaxes: TList;
    FAbstractSyntaxItem: TAbstractSyntaxItem;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(AID: Integer; abstractsyntaxitem: TAbstractSyntaxItem;
      vector: TList); overload;
    destructor Destroy; override;
    function GetLength: Integer;
    function getID: Integer;
    function getAbstractSyntaxItem: TAbstractSyntaxItem;
    function getTransferSyntaxes: TList;
    procedure addTransferSyntaxItem(transfersyntaxitem: TTransferSyntaxItem);
    procedure write(dataoutputstream: TDicomIOStream);
    function Read(datainputstream: TDicomIOStream; AItemType: Integer):
      Integer;
  end;

  TSubItem = class
  private
  protected
  public
    constructor Create;
    function getLength: Integer; virtual;
    procedure write(dataoutputstream: TDicomIOStream); virtual;
    function read(datainputstream: TDicomIOStream; AItemType: Integer):
      Integer; virtual;
  end;

  TMaximumLengthSubItem = class(TSubItem)
  private
    { Private declarations }
    FItemType: Integer;
    FMaxPduSize: Integer;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(i: Integer); overload;
    function getLength: Integer; override;
    procedure write(dataoutputstream: TDicomIOStream); override;
    function read(datainputstream: TDicomIOStream; AItemType: Integer):
      Integer; override;
    property MaxPduSize: Integer read FMaxPduSize;
  end;

  TImplementationClassUIDSubItem = class(TSubItem)
  private
    { Private declarations }
    FItemType: Integer;
    FImplementationClassUID: AnsiString;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(s: AnsiString); overload;
    function getLength: Integer; override;
    procedure write(dataoutputstream: TDicomIOStream); override;
    function read(datainputstream: TDicomIOStream; AItemType: Integer):
      Integer; override;
    property ImplementationClassUID: AnsiString read FImplementationClassUID;
  end;

  TImplementationVersionNameSubItem = class(TSubItem)
  private
    { Private declarations }
    FItemType: Integer;
    FImplementationVersionName: AnsiString;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(s: AnsiString); overload;
    function getLength: Integer; override;
    procedure write(dataoutputstream: TDicomIOStream); override;
    function read(datainputstream: TDicomIOStream; AItemType: Integer):
      Integer; override;
    property ImplementationVersionName: AnsiString read FImplementationVersionName;
  end;

  TAsynchronousOperationsWindowSubItem = class(TSubItem)
  private
    { Private declarations }
    FItemType: Integer;
    FMaxOperationsInvoked: Integer;
    FMaxOperationsPerformed: Integer;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(i: Integer; j: Integer); overload;
    function getLength: Integer; override;
    function read(datainputstream: TDicomIOStream; AItemType: Integer):
      Integer; override;
    procedure write(dataoutputstream: TDicomIOStream); override;

    property MaxOperationsInvoked: Integer read FMaxOperationsInvoked write
      FMaxOperationsInvoked;
    property MaxOperationsPerformed: Integer read FMaxOperationsPerformed write
      FMaxOperationsPerformed;
  end;

  TExtendedNegotiationSubItem = class(TSubItem)
  private
    { Private declarations }
    FItemType: Integer;
    FUIDEntry: TUIDEntry;
    FApplicationInfo: AnsiString;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(uidentry: TUIDEntry; abyte0: AnsiString); overload;
    function getUIDEntry: TUIDEntry;
    function getLength: Integer; override;
    procedure write(dataoutputstream: TDicomIOStream); override;
    function read(datainputstream: TDicomIOStream; AItemType: Integer):
      Integer; override;
    property ApplicationInfo: AnsiString read FApplicationInfo;
  end;

  TScuScpRoleSubItem = class(TSubItem)
  private
    { Private declarations }
    FItemType: Integer;
    FScuRole: Integer;
    FScpRole: Integer;
    FAbstractSyntax: TUIDEntry;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(uidentry: TUIDEntry; i: Integer; j: Integer); overload;
    function getLength: Integer; override;

    procedure write(dataoutputstream: TDicomIOStream); override;
    function read(datainputstream: TDicomIOStream; AItemType: Integer):
      Integer; override;

    property ScuRole: Integer read FScuRole;
    property ScpRole: Integer read FScpRole;
    property AbstractSyntax: TUIDEntry read FAbstractSyntax;
  end;

  TUserInfoItem = class
  private
    { Private declarations }
    FItemType: Integer;
    FList: TList;
    c: Integer;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create;
    destructor Destroy; override;
    procedure addSubItem(subitem: TSubItem);
    function getSubItems: TList;
    function getLength: Integer;
    procedure write(dataoutputstream: TDicomIOStream);
    function read(datainputstream: TDicomIOStream; AItemType: Integer):
      Integer;
  end;

  TPresentationContextResponseItem = class
  private
    { Private declarations }
    FItemType: ShortInt;
    FID: Integer;
    FLength: Integer;
    FResult: Integer;
    e: TTransferSyntaxItem;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(i: Integer; j: Integer; transfersyntaxitem:
      TTransferSyntaxItem); overload;
    destructor Destroy; override;
    function getID: Integer;
    function getResult: Integer;
    function getTransferSyntax: TUIDEntry;
    function getLength: Integer;
    procedure write(dataoutputstream: TDicomIOStream);
    procedure read(datainputstream: TDicomIOStream; AItemType: Integer);
  end;

  TAbortPdu = class
  private
    { Private declarations }
    FItemType: Integer;
    FSource: Integer;
    FReason: Integer;
    //    FAbort: TDicomAbort;
        { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(i: Integer; j: Integer); overload;
    destructor Destroy; override;
    function getAbort: TDicomAbort;
    procedure read(inputstream: TDicomIOStream; AItemType: Integer);
    procedure write(outputstream: TDicomIOStream);
  end;

  TAssociateRejectPdu = class
  private
    { Private declarations }
    FItemType: Integer;
    FSource: Integer;
    FReason: Integer;
    FResult: Integer;
    FReject: TDicomReject;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(i: Integer; j: Integer; k: Integer); overload;
    destructor Destroy; override;
    function getReject: TDicomReject;
    procedure read(inputstream: TDicomIOStream; AItemType: Integer);
    procedure write(outputstream: TDicomIOStream);
  end;

  TAssociateFilePdu = class
  private
    FItemType: Byte;
    FList: TList;
    FFileNameList: TStringList;
    FCommand: TDicomAttributes;
    FReceiveCount: Integer;
  protected
    function GetStream(Index: Integer): TStream;
    function GetCount: Integer;
    procedure SetCommand(ACommand: TDicomAttributes);
  public
    constructor Create; overload;
    destructor Destroy; override;
    procedure Add(AStream: TStream); overload;
    procedure Clear;
    procedure ClearArray;
    procedure write(dataoutputstream: TDicomIOStream);
    procedure readData(inputstream: TDicomIOStream; AStream: TStream);
    procedure readCommand(inputstream: TDicomIOStream; AItemType: Integer);
    property Streams: TList read FList;
    property FileNameList: TStringList read FFileNameList;
    property Items[index: Integer]: TStream read GetStream;
    property Count: Integer read getCount;
    property ReceiveCount: Integer read FReceiveCount;
    property Command: TDicomAttributes read FCommand write SetCommand;
  end;

  TAcknowledge = class(TDicomResponse)
  private
    { Private declarations }
    FCalledTitle: AnsiString;
    FCallingTitle: AnsiString;
    FApplicationContextUid: AnsiString;
    FImplementationClassUID: AnsiString;
    FImplementationVersionName: AnsiString;
    FMaxPduSize: Integer;
    FMaxOperationsInvoked: Integer;
    FMaxOperationsPerformed: Integer;

    FTransferSyntaxs: TList;
    FResultList: TList;
    FPresentationContexts: TList;

    ix: TList;
    FScuScpRoleSelections: TList;
    FScuRoleList: TList;
    FScpRoleList: TList;
    { Private function declarations }
  protected
    { protect declarations }
    function GetText: AnsiString; override;
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create;
    destructor Destroy; override;

    function isPrivateApplicationContext: Boolean;
    function GetTransferSyntaxCount:Integer;
    function MyGetTransferSyntax( p_n:integer ) : TUIDEntry;

    procedure setScuScpRoleSelection(i1: Integer; j1: Integer; k1: Integer);
    function getScuRole(i1: Integer): Integer; overload;
    function getScuRole(uidentry: TUIDEntry): Integer; overload;
    function getScpRole(i1: Integer): Integer; overload;
    function getScpRole(uidentry: TUIDEntry): Integer; overload;
    function ScuScpRoleSelection(i1: Integer): TUIDEntry; overload;
    function ScuScpRoleSelectionCount: Integer; overload;
    function getPresentationContextID(i1: Integer): ShortInt;
    function getResult(i1: Integer): Integer;
    function getPresentationContexts: Integer;
    function getTransferSyntax(i1: Integer): TUIDEntry;
    procedure addPresentationContext(byte0: ShortInt; i1: Integer; j1: Integer);
    function indexOf(byte0: ShortInt): Integer;

    property CalledTitle: AnsiString read FCalledTitle write FCalledTitle;
    property CallingTitle: AnsiString read FCallingTitle write FCallingTitle;
    property ApplicationContextUid: AnsiString read FApplicationContextUid write
      FApplicationContextUid;
    property ImplementationClassUID: AnsiString read FImplementationClassUID write
      FImplementationClassUID;
    property ImplementationVersionName: AnsiString read FImplementationVersionName
      write FImplementationVersionName;
    property MaxPduSize: Integer read FMaxPduSize write FMaxPduSize;
    property MaxOperationsInvoked: Integer read FMaxOperationsInvoked write
      FMaxOperationsInvoked;
    property MaxOperationsPerformed: Integer read FMaxOperationsPerformed write
      FMaxOperationsPerformed;
  end;

  TRequest = class(TDicomResponse)
  private
    { Private declarations }
    FApplicationContextUid: AnsiString;
    FCalledTitle: AnsiString;
    FCallingTitle: AnsiString;
    // FOMIN 08_07_2012 MoveDestination
    // добавили свойство для C_MOVE
    FMoveDestination: AnsiString;
    //
    FImplementationClassUID: AnsiString;
    FImplementationVersionName: AnsiString;
    FMaxPduSize: Integer;
    FMaxOperationsInvoked: Integer;
    FMaxOperationsPerformed: Integer;

    FExtendedNegotiationDataList: TList;

    FPresentationContexts: TList;
    FAbstractSyntaxs: TList;
    FTransferSyntaxes: TList;

    FScuScpRoleSelections: TList;
    FScuRoleList: TList;
    FScpRoleList: TList;
    { Private function declarations }
  protected
    { protect declarations }
    function GetText: AnsiString; override;
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    destructor Destroy; override;
    function isPrivateApplicationContext: Boolean;

    function getScuRole(i1: Integer): Integer; overload;
    function getScuRole(uidentry: TUIDEntry): Integer; overload;
    function getAbstractSyntaxForRole(i1: Integer): TUIDEntry;
    function getRoles: Integer;
    function getScpRole(i1: Integer): Integer; overload;
    function getScpRole(uidentry: TUIDEntry): Integer; overload;

    function getPresentationContextID(i1: Integer): ShortInt;
    function getPresentationContexts: Integer;
    function getAbstractSyntax(i1: Integer): TUIDEntry;
    function getTransferSyntaxes(i1: Integer): Integer;
    function getTransferSyntax(i1: Integer; j1: Integer): TUIDEntry;
    function getExtendedNegotiationData(i1: Integer): Ansistring;
    function addPresentationContext(i1: Integer; ai: TDCMIntegerArray): ShortInt;
    procedure F_a(byte0: ShortInt; i1: Integer; ai: TDCMIntegerArray); overload;
    procedure F_a(byte0: ShortInt; uidentry: TUIDEntry; auidentry:
      TUIDEntryArray); overload;
    procedure F_a(uidentry: TUIDEntry; i1: Integer; j1: Integer); overload;
    procedure setExtendedNegotiationData(i1: Integer; abyte0: AnsiString);
    procedure setScuScpRoleSelection(i1: Integer; j1: Integer; k1: Integer);
    //    function indexOf(byte0: ShortInt): Integer;

    property ApplicationContextUid: AnsiString read FApplicationContextUid write
      FApplicationContextUid;
    property CalledTitle: AnsiString read FCalledTitle write FCalledTitle;
    property CallingTitle: AnsiString read FCallingTitle write FCallingTitle;
    // FOMIN 08_07_2012 MoveDestination
    // добавлено свойство для хранения пути передачи изображения
    property MoveDestination: AnsiString read FMoveDestination write FMoveDestination;
    //
    property ImplementationClassUID: AnsiString read FImplementationClassUID write
      FImplementationClassUID;
    property ImplementationVersionName: AnsiString read FImplementationVersionName
      write FImplementationVersionName;
    property MaxPduSize: Integer read FMaxPduSize write FMaxPduSize;
    property MaxOperationsInvoked: Integer read FMaxOperationsInvoked write
      FMaxOperationsInvoked;
    property MaxOperationsPerformed: Integer read FMaxOperationsPerformed write
      FMaxOperationsPerformed;
  end;

  TAssociateAcknowledgePdu = class
  private
    { Private declarations }
    FItemType: Integer;
    FLength: Integer;
    FCalledTitle: AnsiString;
    FCallingTitle: AnsiString;
    FApplicationContextItem: TApplicationContextItem;
    FUserInfoItem: TUserInfoItem;
    FPresentationContextResponseItem: TPresentationContextResponseItem;
    FPresentationContextResponseItems: TList;
    FAcknowledge: TAcknowledge;
    { Private function declarations }
    procedure CreateAcknowledge;
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(acknowledge: TAcknowledge); overload;
    destructor Destroy; override;
    function getAcknowledge: TAcknowledge;
    function getLength: Integer;
    function getPresentationContextResponseItems: TList;
    procedure write(outputstream: TDicomIOStream {OutputStream});
    procedure read(inputstream: TDicomIOStream; AItemType: Integer);
  end;
  TAssociateRequestPdu = class
  private
    { Private declarations }
    FItemType: Integer;
    FProtocalVersion: Integer;
    FCalledTitle: AnsiString;
    FCallingTitle: AnsiString;
    FApplicationContextItem: TApplicationContextItem;
    FPresentationContextItems: TList;
    FUserInfoItem: TUserInfoItem;
    FRequest: TRequest;
    { Private function declarations }
    procedure AssignToRequest;
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create; overload;
    constructor Create(request: TRequest); overload;
    destructor Destroy; override;
    function getRequest: TRequest;
    function getApplicationContextItem: TApplicationContextItem;
    function getPresentationContextItems: TList;
    function getUserInfoItem: TUserInfoItem;
    procedure setApplicationContextItem(applicationcontextitem:
      TApplicationContextItem);
    procedure setUserInfoItem(userinfoitem: TUserInfoItem);
    procedure addPresentationContextItem(presentationcontextitem:
      TPresentationContextItem);
    function getLength: Integer;
    procedure write(dataoutputstream: TDicomIOStream);
    procedure read(inputstream: TDicomIOStream; AItemType: Integer);
    property CalledTitle: AnsiString read FCalledTitle;
    property CallingTitle: AnsiString read FCallingTitle;
  end;
  TAssociateDataPdu = class
  private
    FItemType: Byte;

    FStream: TPDUStream;
    FMessageType: Integer;
    FMessageFinish: Boolean;

    FMaxPduSize: Integer;
    FPresentationContextId: Byte;
    FHeaderValue: Byte;
  public
    constructor Create; overload;
    constructor Create(AMaxPduSize: Integer; APresentationContextId,
      AHeaderValue: Byte); overload;
    destructor Destroy; override;
    procedure write(dataoutputstream: TDicomIOStream);
    procedure read(inputstream: TDicomIOStream; AItemType: Integer);

    property MessageType: Integer read FMessageType;
    property MessageFinish: Boolean read FMessageFinish;
    property PresentationContextId: Byte read FPresentationContextId write
      FPresentationContextId;
    property HeaderValue: Byte read FHeaderValue write FHeaderValue;
    property MaxPduSize: Integer read FMaxPduSize write FMaxPduSize;
    property Stream: TPDUStream read FStream;
  end;
  TAssociation = class;
  TOnAssociationNewDatasetEvent = procedure(AAssociation: TAssociation; ADataset: TDicomAttributes;
    APosition: Integer; AStream: TStream) of object;
  TAssociation = class
  private
    FDataPdu: TAssociateDataPdu;
    FDataAttributesList: TList;
    FReceiveCommand: TDicomAttributes;
    FPresentationContextId: Byte;

    FStream: TDicomIOStream;

    FRequest: TRequest;
    FAcknowledge: TAcknowledge;
    FResponse: TDicomResponse;

    FErrorMsg: AnsiString;
    fReceiveTimeout: Integer;

    FOnNewCommand: TOnAssociationNewDatasetEvent;
    FOnNewData: TOnAssociationNewDatasetEvent;
    FReturnStatus: Integer;
    FResponseCommand: TDicomAttributes;
    fReceiveStreams: TList;
    procedure SetReturnStatus(const Value: Integer);
    procedure SetResponseCommand(const Value: TDicomAttributes);
  protected
    procedure SetReceiveTimeout(Value: Integer);
    function SendAttriutes(APresentationContextId, AHeaderValue: Byte;
      dicomobject: TDicomAttributes; ATransferSyntax: Integer): Boolean;

    function SendAttriutesEx(APresentationContextId, AHeaderValue: Byte;
      dicomobject1, dicomobject2: TDicomAttributes; ATransferSyntax: Integer): Boolean;
    function getTransferSyntax(byte0: ShortInt): TUIDEntry;
  public
    // 25.01.2013 FOMIN
    v_quality : Integer;
    {$IFDEF DICOMDEBUG}
    k1: TDatetime;
    {$ENDIF}
    // настройки ведения протокола
    v_is_log : Boolean;
    v_log_filename : string;
    procedure Conn_wrt_log (str:string);
    function MyBoolToStr(const p_par:boolean):string;
    {$IFDEF DICOMCLIENT}
    constructor Create(ASocket: TCnsTCPConnection); overload;
    {$ENDIF}
    {$IFDEF DICOMVCSCLIENT}
    constructor Create(ASocket: TCustomWSocket); overload;
    {$ENDIF}
    {$IFDEF DICOMWSOCKCLIENT}
    constructor Create(ASocket: TKXSock); overload;
    {$ENDIF}
    //constructor Create(ASocket: TKXSock); overload;

    constructor Create(AStream: TStream); overload;
    destructor Destroy; override;
    procedure Clear;
    procedure Init;
    function getPresentationContext(i1: Integer): ShortInt;

    function IsConnected: Boolean;

    function ReadPduType: Integer;

    function PrepareResponseCommand: TDicomAttributes;

    procedure sendReleaseRequest;
    procedure receiveReleaseRequest(i1: Integer);
    procedure receiveReleaseResponse(i1: Integer);
    procedure sendReleaseResponse;

    procedure ProcessFileRequest(i1: integer);

    procedure sendAssociateResponse(AResponse: TDicomResponse);
    function receiveAssociateResponse(i1: Integer): TDicomResponse;
    procedure sendAssociateRequest(request: TRequest);
    function receiveAssociateRequest(k: Integer): TRequest;
    procedure sendAbort(i1: Integer; j1: Integer);
    function receiveAbort(k: Integer): TDicomAbort;

    procedure SendStatus(AStatus: Integer);

    function ReceiveDataPdu(k: Integer): Boolean;
    function ResponseDataPduSamePDU(dicomobject, dicomobject1: TDicomAttributes): Boolean;
    function ResponseDataPdu(dicomobject, dicomobject1: TDicomAttributes): Boolean;

    function SendDataPdu(apcid: ShortInt; dicomobject, dicomobject1: TDicomAttributes): Boolean;
    function SendDataPduBySOP(ASOP: Integer; dicomobject, dicomobject1: TDicomAttributes): Boolean;

    function GetReceiveDataset(index: Integer): TDicomAttributes;
    function GetReceiveCount: integer;

    function SendFilePduRequestEx(AFIN: TAssociateFilePdu): Boolean;

    property ResponseCommand: TDicomAttributes read FResponseCommand write SetResponseCommand;
    property ReceiveCommand: TDicomAttributes read FReceiveCommand; // write FReceiveCommand;
    property ReceiveDatasets: TList read FDataAttributesList write FDataAttributesList;
    property ReceiveStreams: TList read fReceiveStreams write fReceiveStreams;

    function getResult(i1: Integer): Integer;

    property ErrorMsg: AnsiString read FErrorMsg;
    property PresentationContextId: Byte read FPresentationContextId write FPresentationContextId;
    property Acknowledge: TAcknowledge read FAcknowledge write FAcknowledge;

    property Stream: TDicomIOStream read FStream;
    property Request: TRequest read FRequest;
    property ReturnStatus: Integer read FReturnStatus write SetReturnStatus;

    property ReceiveTimeout: Integer read fReceiveTimeout write SetReceiveTimeout;

    property OnNewCommand: TOnAssociationNewDatasetEvent read FOnNewCommand write FOnNewCommand;
    property OnNewData: TOnAssociationNewDatasetEvent read FOnNewData write FOnNewData;
  end;

  TStatusEntry = class
  private
    { Private declarations }
    fcode: Integer;
    Ftype: Integer;
    Fmessage: AnsiString;
    { Private function declarations }
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create(i: Integer; j: Integer; s: AnsiString);
    function getType: Integer;
    function getMessage: AnsiString;
    function hashCode(obj: TObject): Integer;
    function equals(obj: TObject): Boolean;
    function toString: AnsiString;
    property Code: Integer read FCode;
  end;

  TStatus = class
  private
    { Private declarations }
    defaultTab: TList;
    List4132: TList;
    List4150: TList;
    List4160: TList;
    UnknowStatus: TStatusEntry;
    { Private function declarations }
    function maskBits(i: Integer): Integer;
    function getStatusEntry(hashtable: TList; i: Integer): TStatusEntry; overload;
  protected
    { protect declarations }
    { protect function declarations }
  public
    { Public declarations }
    { public function declarations }
    constructor Create;
    destructor Destroy; override;
    function isPending(i: Integer): Boolean;
    function getStatusEntry(i: Integer): TStatusEntry; overload;
    function getStatusEntry(i: Integer; j: Integer): TStatusEntry; overload;
    function toString(i: Integer): AnsiString;
  end;
  (*  TProperties = class
    end;
    TDimseExchange = class
    end;
    TPrintManagementUtils = class
    private
      { Private declarations }
      { Private function declarations }
      function setImageBox(i: Integer; dicomobject, dicomobject1: TDicomAttributes; j: Integer; k: Integer): TDicomAttributes; overload;
      procedure setvariant(dicomobject: TDicomAttributes; i: Integer; s: AnsiString); overload;
      function fromPixelToPlane(dicomobject: TDicomAttributes): TDicomAttributes; overload;
      //  procedure  fillPaneFromPalette(pixelmatrix:TPixelMatrix;abyte0 : TShortIntArray;abyte1 : TShortIntArray;i:Integer);overload;
    protected
      { protect declarations }
      { protect function declarations }
    public
      { Public declarations }
      grouplens: Boolean;
      _requestor: TRequest;
      connection: TDimseExchange;
      _metaSOPid: Integer;
      _metaPCid: ShortInt;
      _sessionUID: AnsiString;
      _refSessionSqItem: TDicomAttributes;
      _curFilmBoxUID: AnsiString;
      _curFilmBoxAttribs: TDicomAttributes;
      //    _statusListener: TVector;
      //    _jobListener: TVector;
      maxPduSize: Integer;
      artim: Integer;
      { public function declarations }
      constructor Create; overload;
      procedure setGrouplens(flag: Boolean);
      procedure setMaxPduSize(i: Integer);
      procedure setARTIM(i: Integer);
      function connect(s: AnsiString; i: Integer; s1: AnsiString; s2: AnsiString; ai: TDCMIntegerArray): TDicomResponse;
      function isConnected: Boolean;
      function isEnabled(i: Integer): Boolean;
      function getFilmSessionUID: AnsiString;
      function getFilmBoxUID: AnsiString;
      function isFilmSession: Boolean; overload;
      function isGrayscaleFilmSession: Boolean;
      function isColorFilmSession: Boolean;
      function isFilmSession(i: Integer): Boolean; overload;
      function isFilmBox: Boolean;
      //  procedure  addPrinterStatusListener(idimselistener:TIDimseListener);overload;
      //  procedure  removePrinterStatusListener(idimselistener:TIDimseListener);overload;
      //  procedure  addPrinterJobListener(idimselistener:TIDimseListener);overload;
      //  procedure  removePrinterJobListener(idimselistener:TIDimseListener);overload;
      function echo: TDicomAttributes;
      function getColorPrinterStatus: TDicomAttributes;
      function getGrayscalePrinterStatus: TDicomAttributes;
      function getPrinterStatus(i: Integer): TDicomAttributes;
      function getPrintJobStatus(s: AnsiString): TDicomAttributes;
      function getPrinterConfiguration: TDicomAttributes;
      function createGrayscaleFilmSession(dicomobject: TDicomAttributes): TDicomAttributes;
      function createColorFilmSession(dicomobject: TDicomAttributes): TDicomAttributes;
      function createFilmSession(i: Integer; dicomobject: TDicomAttributes): TDicomAttributes;
      function setFilmSession(dicomobject: TDicomAttributes): TDicomAttributes; overload;
      function printFilmSession: TDicomAttributes;
      function deleteFilmSession: TDicomAttributes;
      function createFilmBox(dicomobject: TDicomAttributes): TDicomAttributes;
      function setFilmBox(dicomobject: TDicomAttributes): TDicomAttributes; overload;
      function printFilmBox: TDicomAttributes;
      function deleteFilmBox: TDicomAttributes;
      function createPresentationLUT(s: AnsiString; i: Integer; j: Integer; ai: TDCMIntegerArray; s1: AnsiString): TDicomAttributes; overload;
      function createShapePresentationLUT(s: AnsiString; s1: AnsiString): TDicomAttributes;
      function createPresentationLUT(s: AnsiString; dicomobject: TDicomAttributes): TDicomAttributes; overload;
      function deletePresentationLUT(s: AnsiString): TDicomAttributes;
      function createOverlayBox(s: AnsiString; dicomobject, dicomobject1: TDicomAttributes): TDicomAttributes;
      function setOverlayBox(s: AnsiString; dicomobject, dicomobject1: TDicomAttributes): TDicomAttributes;
      function deleteOverlayBox(s: AnsiString): TDicomAttributes;
      function countImageBoxes: Integer;
      function countAnnotationBoxes: Integer;
      function setGrayscaleImageBox(i: Integer; dicomobject, dicomobject1: TDicomAttributes): TDicomAttributes;
      function setColorImageBox(i: Integer; dicomobject, dicomobject1: TDicomAttributes): TDicomAttributes;
      function setAnnotationBox(i: Integer; s: AnsiString): TDicomAttributes;
      procedure release;
      function createGammaPresentationLUT(i: Integer; j: Integer; d: double): TDicomAttributes;
      function createGammaLUTSequenceItem(i: Integer; j: Integer; d: double): TDicomAttributes;
      function preformatGrayscale(dicomobject, dicomobject1: TDicomAttributes; i: Integer; j: Integer; flag: Boolean): TDicomAttributes; overload;
      function preformatGrayscale(dicomobject, dicomobject1: TDicomAttributes; i: Integer; j: Integer): TDicomAttributes; overload;
      function setPixelAspectRatio(dicomobject: TDicomAttributes; flag: Boolean): Boolean; overload;
      function setPixelAspectRatio(dicomobject: TDicomAttributes): Boolean; overload;
      function getPixelModule(dicomobject: TDicomAttributes): TDicomAttributes;
      function getPresentationLUTModule(dicomobject: TDicomAttributes): TDicomAttributes;
      procedure copyAttributs(dicomobject, dicomobject1: TDicomAttributes; ai: TDCMIntegerArray);
      function getRequestedImageSize(dicomobject: TDicomAttributes; f: real): AnsiString;
      procedure setFilmSession(dicomobject: TDicomAttributes; properties: TProperties); overload;
      procedure setFilmSessionCreateAttribs(dicomobject: TDicomAttributes; properties: TProperties);
      procedure setFilmSessionSetAttribs(dicomobject: TDicomAttributes; properties: TProperties);
      procedure setFilmBox(dicomobject: TDicomAttributes; properties: TProperties); overload;
      procedure setFilmBoxCreateAttribs(dicomobject: TDicomAttributes; properties: TProperties);
      procedure setFilmBoxSetAttribs(dicomobject: TDicomAttributes; properties: TProperties);
      procedure setImageBox(dicomobject: TDicomAttributes; properties: TProperties); overload;
      procedure setImageBoxSetAttribs(dicomobject: TDicomAttributes; properties: TProperties);
      procedure addReferencedPresentationLUT(dicomobject: TDicomAttributes; s: AnsiString);
      procedure addReferencedImageOverlayBox(dicomobject: TDicomAttributes; s: AnsiString);
      function rescaleLUTtoFitBitDepth(dicomobject: TDicomAttributes; i: Integer): TDicomAttributes;
      function preformatColor(dicomobject: TDicomAttributes): TDicomAttributes;
      function colorToGrayscale(dicomobject: TDicomAttributes): TDicomAttributes;
      function grayscaleToColor(dicomobject: TDicomAttributes): TDicomAttributes;
    end;
    TDicomMessage = class(TDicomAttributes)
    private
      { Private declarations }
      _pcid: ShortInt;
      _asuid: TUIDEntry;
      _dataset: TDicomAttributes;
      { Private function declarations }
    protected
      { protect declarations }
      { protect function declarations }
    public
      { Public declarations }
      { public function declarations }
      constructor Create(byte0: ShortInt; uidentry: TUIDEntry; dicomobject: TDicomAttributes; dicomobject1: TDicomAttributes); overload;
      constructor Create(byte0: ShortInt; uidentry: TUIDEntry; ACommandID, AMessageID: Integer; dicomobject: TDicomAttributes); overload;
      constructor Create(byte0: ShortInt; ACommandID, AMessageID: Integer; dicomobject: TDicomAttributes); overload;
      constructor Create(ACommandID, AMessageID: Integer; dicomobject: TDicomAttributes); overload;
      procedure setDataset(dicomobject: TDicomAttributes);
      function getPresentationContext: ShortInt;
      function getAbstractSyntax: TUIDEntry;
      function getDataset: TDicomAttributes;
      procedure affectedSOPclassUID(s: AnsiString);
      procedure affectedSOP(s: AnsiString; s1: AnsiString);
      procedure requestedSOP(s: AnsiString; s1: AnsiString);
      procedure priority(i: Integer);
      procedure eventTypeID(i: Integer);
      procedure actionTypeID(i: Integer);
      procedure status(i: Integer);
      procedure moveDestination(s: AnsiString);
      procedure attributeIdList(ai: TDCMIntegerArray);
      procedure moveOriginator(s: AnsiString; i: Integer);
    end;
  *)
function isPrivate(s: AnsiString): Boolean;
function CompareStatus(l, r: Pointer): Integer;

function getResultForAbstractSyntax(request: TRequest; acknowledge:
  TAcknowledge; i: Integer): Integer;
function getCommandType(dicomobject: TDicomAttributes): Integer;
function getMessageID(dicomobject: TDicomAttributes): Integer;
function getPriority(dicomobject: TDicomAttributes): Integer;
function getAffectedSOPClass(dicomobject: TDicomAttributes): Integer;
function getAffectedSOPInstance(dicomobject: TDicomAttributes): AnsiString;
function getRequestedSOPClass(dicomobject: TDicomAttributes): Integer;
function getRequestedSOPInstance(dicomobject: TDicomAttributes): AnsiString;
function dataPresent(dicomobject: TDicomAttributes): Boolean;

function createEventReportRequest(AMessageID, ASOPClassUID: integer; AInstanceUid:
  AnsiString; ADatasetType: Boolean; AEventTypeID: integer): TDicomAttributes;
function createEventReportResponse(AMessageID, ASOPClassUID: integer; AInstanceUid:
  AnsiString; ADatasetType: Boolean; AStatus: integer; AEventTypeID: integer):
  TDicomAttributes;
function createNGetRequest(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString):
  TDicomAttributes;
function createNGetResponse(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AStatus: integer): TDicomAttributes;
function createSetRequest(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString):
  TDicomAttributes;
function createSetResponse(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AStatus: integer): TDicomAttributes;
function createActionRequest(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AActionTypeID: integer): TDicomAttributes;
function createActionResponse(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AStatus: integer; AActionTypeID: integer):
  TDicomAttributes;
function createCreateRequest(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean): TDicomAttributes;
function createCreateResponse(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AStatus: integer): TDicomAttributes;
function createDeleteRequest(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString):
  TDicomAttributes;
function createDeleteResponse(AMessageID, ASOPClassUID: integer; AInstanceUid: AnsiString;
  AStatus: integer): TDicomAttributes;
function createEchoRequest(AMessageID, ASOPClassUID: integer): TDicomAttributes;
function createEchoResponse(AMessageID, ASOPClassUID, AStatus: integer): TDicomAttributes;
function createMoveRequest(AMessageID, ASOPClassUID, APriority: integer; s: AnsiString):
  TDicomAttributes;
function createMoveResponse(AMessageID, ASOPClassUID: integer; ADatasetType:
  Boolean; AStatus, i3, i4, i5, i6: integer): TDicomAttributes;
function createCGetRequest(AMessageID, ASOPClassUID, APriority: integer; s: AnsiString):
  TDicomAttributes;
function createCGetResponse(AMessageID, ASOPClassUID: Integer; ADatasetType:
  Boolean; AStatus, i3, i4, i5, i6: Integer): TDicomAttributes;
function createStoreRequest(AMessageID, ASOPClassUID: integer; APriority:
  integer; s, s1, s2: AnsiString): TDicomAttributes;
function createStoreResponse(AMessageID, ASOPClassUID: integer; s: AnsiString;
  AStatus: integer): TDicomAttributes;
function createFindRequest(AMessageID, ASOPClassUID, APriority: integer): TDicomAttributes;
function createFindResponse(AMessageID, ASOPClassUID: integer; ADatasetType:
  Boolean; AStatus: integer): TDicomAttributes;
function createDatabaseRequest(AMessageID, ASOPClassUID, APriority: integer): TDicomAttributes;
function createDatabaseResponse(AMessageID, ASOPClassUID: integer; ADatasetType:
  Boolean; AStatus: integer): TDicomAttributes;
function createCancelRequest(AMessageID: integer): TDicomAttributes;

const c_tm = 120000; // 2 мин

var
  DicomStatus: TStatus;
  DefaultMaxPdu: Integer;
  PDUTempPath: AnsiString;

  v_private_tags : Boolean;

  PDUTempFileIndex: integer;

  SendDataCount: Int64;
  ReceiveDataCount: Int64;
  v_mn_timeout : Integer;
  v_is_raise_exceptions : Boolean;
  //  ImageCachePath:AnsiString;
  v_is_conn_log : Boolean;

implementation

function fFrmMsgMemStatus : string;
var Status: TMemoryStatus;
const CEOL = #13#10; cmb = ' MB';
begin
  Result :=
    'Количество используемой памяти в процентах (%)   : ' + IntToStr(Status.dwMemoryLoad    div 1024417) + cmb    + CEOL +
    'Общее количество физической памяти в байтах      : ' + IntToStr(Status.dwTotalPhys     div 1024417) + cmb     + CEOL +
    'Количество оставшейся физической памяти в байтах : ' + IntToStr(Status.dwAvailPhys     div 1024417) + cmb     + CEOL +
    'Объём страничного файла в байтах                 : ' + IntToStr(Status.dwTotalPageFile div 1024417) + cmb + CEOL +
    'Свободного места в страничном файле              : ' + IntToStr(Status.dwAvailPageFile div 1024417) + cmb + CEOL +
    'Общий объём виртуальной памяти в байтах          : ' + IntToStr(Status.dwTotalVirtual  div 1024417) + cmb  + CEOL +
    'Количество свободной виртуальной памяти в байтах : ' + IntToStr(Status.dwAvailVirtual  div 1024417) + cmb ;

end;

function CompareStatus(l, r: Pointer): Integer;
var
  u1, u2: TStatusEntry;
begin
  u1 := TStatusEntry(l);
  u2 := TStatusEntry(r);
  if u1.Code > u2.Code then
    Result := 1
  else
    if u1.Code < u2.Code then
    Result := -1
  else
    Result := 0;
end;

function TAssociation.MyBoolToStr(const p_par:boolean):string;
begin
  if p_par then begin
    MyBoolToStr := '1';
  end else begin
    MyBoolToStr := '0';
  end;
end;

// процедура записи в лог-файл
procedure MnLg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );
var F : TextFile; v_is_ex : Boolean;
const c_delim = '-------------------------------------------------------------------------------';
 { function GetFreeDiskSize: Int64;
  var free_size, total_size: Int64;
   RootPath: array[0..4] of Char;
   RootPtr: PChar;
   current_dir: string;
   drive: string;
  begin
   drive:=Copy(Trim(GetCurrentDir),1,1);
   RootPath[0] := Drive;
   RootPath[1] := ':';
   RootPath[2] := '\';
   RootPath[3] := #0;
   RootPtr := RootPath;
   current_dir := GetCurrentDir;
   if SetCurrentDir(drive + ':\') then
   begin
     GetDiskFreeSpaceEx(RootPtr, Free_size, Total_size, nil);
     // this to turn back to original dir
    SetCurrentDir(current_dir);
     Result := Free_size;
   end
   else
   begin
     Result := 0;
     Free_size  := -1;
     Total_size := -1;
   end;
  end;  }
  procedure wrt_err(p_str:ansistring);
  begin
  {  try
        AssignFile(F, p_filename+IntToStr(GetTickCount)+'_err');
        rewrite(F);
        writeln(F,DateTimeToStr(Now)+' '+p_str);
        Flush(F);
        CloseFile(F);
      except
      end; }
  end;
begin
  if not v_is_conn_log then Exit;  
  try
  {  try
      if Trunc( GetFreeDiskSize/(1024 * 1024 * 1024) )<10 then Exit; // если места меньше 10 Gigabytes
    except
    end; }
    if Trim(p_filename)<>'' then begin
      v_is_ex:=FileExists(p_filename);
      AssignFile(F, p_filename);
      try
        try
          if v_is_ex then begin
            Append(F);
          end else begin
            rewrite(F);
          end;
          if p_is_delim then writeln(F,c_delim);
          if p_is_DT then
            writeln(F,DateTimeToStr(Now)+' '+p_strs)
          else
            writeln(F,p_strs);
          Flush(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (append/rewrite): '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      finally
        try
          CloseFile(F);
        except
          on E:Exception do
            wrt_err(DateTimeToStr(Now)+' ERROR (CloseFile) : '+E.Message+#13+
                 ' original message : '+p_strs);
        end;
      end;
    end;
  except
    on E:Exception do
      wrt_err(DateTimeToStr(Now)+' ERROR (summary): '+E.Message+#13+
                 ' original message : '+p_strs);
  end;
end;

procedure TAssociation.Conn_wrt_log (str:string);
begin
  if v_is_log then
    MnLg_ev(str,v_log_filename);
end;

function TAssociation.IsConnected: Boolean;
begin
  Result := assigned(FRequest) and assigned(FAcknowledge);
end;

procedure TAssociation.Init;
begin
  Clear;
  if assigned(FRequest) then
    FRequest.Free;
  FRequest := nil;
  if assigned(FAcknowledge) then
    FAcknowledge.Free;
  FAcknowledge := nil;
end;

function TAssociation.GetReceiveDataset(index: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes(FDataAttributesList[Index]);
end;

function TAssociation.GetReceiveCount: integer;
begin
  Result := FDataAttributesList.Count;
end;

function TAssociation.SendFilePduRequestEx(AFIN: TAssociateFilePdu): Boolean;
begin
  Result := false;
  try
    AFIN.Write(stream);
  except
    on e: Exception do
    begin
      fErrorMsg := e.Message;
      exit;
    end;
  end;
  Result := TRUE;
end;

function TAssociation.PrepareResponseCommand: TDicomAttributes;
var
  i, i1: Integer;
  msgid: Integer;
  sopClass: integer;
  InstanceUid, s: AnsiString;
  p0: TDicomAttributes;
begin
  Result := nil;
  i := getCommandType(ReceiveCommand);
  msgid := getMessageID(ReceiveCommand);
  case i of
    N_EVENT_REPORT_REQUEST:
      begin
        sopclass := getRequestedSOPClass(ReceiveCommand);
        InstanceUid := getRequestedSOPInstance(ReceiveCommand);
        i1 := ReceiveCommand.GetInteger(dEventTypeID); //event type
        Result := createEventReportResponse(msgid, sopclass, InstanceUid, true, $FF00, i1);
      end;
    N_GET_REQUEST:
      begin
        sopclass := getRequestedSOPClass(ReceiveCommand);
        InstanceUid := getRequestedSOPInstance(ReceiveCommand);
        Result := createNGetResponse(msgid, sopclass, InstanceUid, true, $FF00);
      end;
    N_SET_REQUEST:
      begin
        sopclass := getRequestedSOPClass(ReceiveCommand);
        InstanceUid := getRequestedSOPInstance(ReceiveCommand);
        //        sopclass := getAffectedSOPClass(ReceiveCommand);
        //        InstanceUid := getAffectedSOPInstance(ReceiveCommand);
        Result := createSetResponse(msgid, sopclass, InstanceUid, true, $FF00);
      end;
    N_ACTION_REQUEST:
      begin
        sopclass := getRequestedSOPClass(ReceiveCommand);
        InstanceUid := getRequestedSOPInstance(ReceiveCommand);
        i1 := ReceiveCommand.GetInteger(dActionTypeID);
        Result := createActionResponse(msgid, sopclass, InstanceUid, true, $FF00, i1);
      end;
    N_CREATE_REQUEST:
      begin
        sopclass := getAffectedSOPClass(ReceiveCommand);
        InstanceUid := getAffectedSOPInstance(ReceiveCommand);
        Result := createCreateResponse(msgid, sopclass, InstanceUid, true, $FF00);
      end;
    N_DELETE_REQUEST:
      begin
        sopclass := getRequestedSOPClass(ReceiveCommand);
        InstanceUid := getRequestedSOPInstance(ReceiveCommand);
        Result := createDeleteResponse(msgid, sopclass, InstanceUid, $FF00);
      end;
    C_STORE_REQUEST:
      begin
        if FDataAttributesList.Count > 0 then
        begin
          p0 := TDicomAttributes(FDataAttributesList[0]);
          s := p0.getstring(62);
          if s <> '' then
            sopclass := UIDS.Items[s].Constant
          else
            sopclass := getAffectedSOPClass(ReceiveCommand);
          InstanceUid := p0.getstring(63);
          if InstanceUid = '' then
            InstanceUid := getAffectedSOPInstance(ReceiveCommand);

          Result := createStoreResponse(msgid, sopclass, InstanceUid, 0);
        end
        else
        begin
          sopclass := getAffectedSOPClass(ReceiveCommand);
          InstanceUid := getAffectedSOPInstance(ReceiveCommand);
          Result := createStoreResponse(msgid, sopclass, InstanceUid, 0);
        end;
      end;
    C_GET_REQUEST:
      begin
        sopclass := getAffectedSOPClass(ReceiveCommand);
        Result := createCGetResponse(msgid, sopclass, true, $FF00, 0, 0, 0, 0);
      end;
    C_FIND_REQUEST:
      begin
        sopclass := getAffectedSOPClass(ReceiveCommand);
        Result := createFindResponse(msgid, sopclass, true, $FF00)
      end;
    C_MOVE_REQUEST:
      begin
        sopclass := getAffectedSOPClass(ReceiveCommand);
        Result := createMoveResponse(msgid, sopclass, true, $FF00, 0, 0, 0, 0);
      end;
    C_ECHO_REQUEST:
      begin
        sopclass := getAffectedSOPClass(ReceiveCommand);
        Result := createEchoResponse(msgid, sopclass, 0);
      end;
    C_CANCEL_FIND_REQUEST:
      begin

      end;
    C_DATABASE_REQUEST:
      begin
        sopclass := getAffectedSOPClass(ReceiveCommand);
        Result := createDatabaseResponse(msgid, sopclass, true, $FF00)
      end;
  end;
end;

function TAssociation.ReadPduType: Integer;
begin
  Result := FStream.readint8;
end;

procedure TAssociation.sendReleaseResponse;
begin
  FStream.writeInt8(6);
  FStream.writeInt8(0);
  FStream.writeInt32(4);
  FStream.writeInt32(0);
  FStream.FreshData;
end;

procedure TAssociation.receiveReleaseResponse(i1: Integer);
begin
  //  i1:=FStream.readInt8;
  if i1 <> 6 then
  begin
    raise Exception.Create('wrong first byte for expected Release Response: ' +
      IntToStr(i1)) {IllegalValueException};
  end
  else
  begin
    FStream.readInt8;
    FStream.readInt32;
    FStream.readInt32;
  end;
end;

function TAssociation.ResponseDataPduSamePDU(dicomobject, dicomobject1: TDicomAttributes): Boolean;
//var
//  uidentry: TUIDEntry;
//  zzz: Integer;
begin
  //zzz := dicomobject.GetDatalen(ImplicitVRLittleEndian);
  //dicomobject.AddVariant(0, 0, zzz);
  Result := SendAttriutesEx(FPresentationContextId, 0, dicomobject, dicomobject1, ImplicitVRLittleEndian);
  {if Result and (dicomobject1 <> nil) then
  begin
    uidentry := getTransferSyntax(FPresentationContextId);
    if uidentry = nil then
    begin
      FErrorMsg := '';
      Result := false;
      exit;
    end;
    //    dicomobject1.AddAllGrouplength(uidentry.Constant);

    Result := SendAttriutes(FPresentationContextId, 0, dicomobject1, uidentry.Constant);
  end;
  //  Result := SendDataPdu(FPresentationContextId, dicomobject, dicomobject1);  }
end;

// процедура для протоколирования DICOM datasets - пишет данные в файлы
procedure ds_sav ( const ADataset: TDicomAttributes;
                   const ARequestDatasets:  TList = nil;
                   const AResponseDatasets: TList = nil;
                   const p_suff : string ='dcm'
                 );
var v_tm_str, v_dir : AnsiString; rq, rq1 : TDicomAttributes;
    v_TStr : TStringList; v_I:integer;
  function gt_filename (const p_str_in : ansistring) : AnsiString;
  begin
    gt_filename := v_dir +
                //   inttostr(v_ds_i)+
                   '_'+
                   v_tm_str+'_'+
                   p_str_in+'_'+
                   inttostr(v_I)+
                   '.'+p_suff;
  end;
begin
  if ADataset<>nil then
  try
 //   inc(v_ds_i);
//    MnLg_ev('ds_i='+inttostr(v_ds_i), ExtractFilePath(paramstr(0))+'dcm_ds.log', False);
    v_tm_str:=inttostr(HourOf(Now))+inttostr(MinuteOf(Now))+inttostr(SecondOf(Now))+inttostr(MilliSecondOf(Now));
    v_dir:=ExtractFilePath(paramstr(0))+'query_log\';
    if not DirectoryExists(v_dir) then begin
      if not CreateDir(v_dir) then
      begin
        if not ForceDirectories(v_dir) then
        begin
          MessageDlg('Ошибка создания каталога', mtError, [], 0);
          exit;
        end;
      end;
    end;
    for v_I := 0 to ADataset.Count - 1 do begin
      ADataset.ItemByIndex[v_i].SaveToFile(gt_filename('ds'));
    end;
    v_I := 0;
    //
    try
      v_TStr := TStringList.Create;
      v_TStr.Clear;
      ADataset.ListAttrinute('receive Command: ', v_TStr);
      v_TStr.SaveToFile(gt_filename('cmd'));
      //
      v_TStr.Clear;
      if ARequestDatasets<>nil then begin
        if ARequestDatasets.Count>0 then begin
          rq := TDicomAttributes(ARequestDatasets[0]);
          rq.ListAttrinute('Receive Data: ', v_TStr);
          v_TStr.SaveToFile(gt_filename('Rcv'));
        end;
      end;
      //
      v_TStr.Clear;
      if AResponseDatasets<>nil then begin
        if AResponseDatasets.Count>0 then begin
          rq1 := TDicomAttributes(AResponseDatasets[0]);
          rq1.ListAttrinute('Response Data: ', v_TStr);
          v_TStr.SaveToFile(gt_filename('rsp'));
        end;
      end;
      //
    finally
      FreeAndNil(v_TStr);
    end;
    //
  except
    on E : Exception do
     { MnLg_ev( 'error save dataset : '+E.ClassName+' error raised, with message : '+E.Message,
             ExtractFilePath(paramstr(0))+'dicom.err',
             False
           );   }
  end;
end;

function TAssociation.ResponseDataPdu(dicomobject, dicomobject1: TDicomAttributes): Boolean;
var
  uidentry: TUIDEntry;
  zzz: Integer;
begin
  zzz := dicomobject.GetDatalen(ImplicitVRLittleEndian);
  dicomobject.AddVariant(0, 0, zzz);
  Result := SendAttriutes(FPresentationContextId, 1, dicomobject, ImplicitVRLittleEndian);

  // ds_sav (dicomobject,nil,nil,'.records_0' );

  if Result and (dicomobject1 <> nil) then
  begin
    uidentry := getTransferSyntax(FPresentationContextId);
    if uidentry = nil then
    begin
      FErrorMsg := '';
      Result := false;
      exit;
    end;
    //    dicomobject1.AddAllGrouplength(uidentry.Constant);


  //  ds_sav (dicomobject1,nil,nil,'.records_1' );

    Result := SendAttriutes(FPresentationContextId, 0, dicomobject1, uidentry.Constant);
  end;
  //  Result := SendDataPdu(FPresentationContextId, dicomobject, dicomobject1);
end;

function TAssociation.SendDataPduBySOP(ASOP: Integer; dicomobject, dicomobject1: TDicomAttributes):
  Boolean;
var
  b1: Byte;
  //  uidentry: TUIDEntry;
  //  zzz: Integer;
begin
  Conn_wrt_log('before getPresentationContext');
  b1 := getPresentationContext(ASOP);
  Conn_wrt_log('getPresentationContext');
  Result := SendDataPdu(b1, dicomobject, dicomobject1);
  Conn_wrt_log('SendDataPdu');
end;

function TAssociation.SendDataPdu(apcid: ShortInt; dicomobject, dicomobject1: TDicomAttributes):
  Boolean;
var
  uidentry: TUIDEntry;
  zzz: Integer;
begin
  Conn_wrt_log ('SendDataPdu - start');
  zzz := dicomobject.GetDatalen(ImplicitVRLittleEndian);
  Conn_wrt_log ('SendDataPdu - GetDatalen');
  dicomobject.AddVariant(0, 0, zzz);
  Conn_wrt_log ('dicomobject.AddVariant GetDatalen(ImplicitVRLittleEndian)='+inttostr(zzz));
  Result := SendAttriutes(apcid, 1, dicomobject, ImplicitVRLittleEndian );  //     ExplicitVRLittleEndian
  Conn_wrt_log('SendDataPdu - SendAttriutes');
  if Result and (dicomobject1 <> nil) then               
  begin
    uidentry := getTransferSyntax(apcid);
    if uidentry = nil then
    begin
      FErrorMsg := '';
      Result := false;
      exit;
    end;
    //    dicomobject1.AddAllGrouplength(uidentry.Constant);
    Conn_wrt_log('SendDataPdu - before SendAttriutes');
    try
      Result := SendAttriutes(apcid, 0, dicomobject1, uidentry.Constant ); //   JPEGLossless dicomobject1.ImageData.ImageData[0].TransferSyntax
    except
      on E:Exception do
      Conn_wrt_log('ERROR SendDataPdu - SendAttriutes '+E.Message);
    end;
    Conn_wrt_log('SendDataPdu - SendAttriutes');
  end;
end;

procedure TAssociation.ProcessFileRequest(i1: integer);
begin

end;

procedure TAssociation.Clear;
var
  I: Integer;
begin
  if assigned(FDataAttributesList) then
  begin
    for I := 0 to FDataAttributesList.Count - 1 do // Iterate
    begin
      TDicomAttributes(FDataAttributesList[i]).Free;
    end; // for
    FDataAttributesList.Clear;
  end
  else
    FDataAttributesList := TList.Create;

  if (fReceiveStreams<>nil) then
  begin
    for I := 0 to fReceiveStreams.Count - 1 do // Iterate
    begin
      TStream(fReceiveStreams[i]).Free;
    end; // for
    fReceiveStreams.Clear;
  end;

  if assigned(FReceiveCommand) then
    FReceiveCommand.Free;
  FReceiveCommand := nil;
  {if assigned(FResponse) then
    FResponse.Free;
  FResponse := nil;}
  if assigned(FDataPdu) then
    FDataPdu.Free;
  FDataPdu := nil;
end;

function TAssociation.receiveAssociateRequest(k: Integer): TRequest;
var
  q: TAssociateRequestPdu;
begin
  q := TAssociateRequestPdu.Create;
  try
    q.read(FStream, k);
    //  i:=q.getRequest.getMaxPduSize;
    FRequest := q.getRequest;
    result := FRequest;
  finally
    q.Free
  end;
end;

function TAssociation.receiveAssociateResponse(i1: Integer): TDicomResponse;
var
  associaterejectpdu: TAssociateRejectPdu;
  abortpdu: TAbortPdu;
  q: TAssociateAcknowledgePdu;
begin
  Conn_wrt_log('receiveAssociateResponse case of '+IntToStr(i1));
  case i1 of //
    2:
      begin
        Conn_wrt_log('try to TAssociateAcknowledgePdu.Create');
        q := TAssociateAcknowledgePdu.Create;
        Conn_wrt_log('TAssociateAcknowledgePdu.Created');
        try
          FStream.fReceiveTimeout:=500;

          q.Read(FStream, i1);

          Conn_wrt_log('q.Read '+inttostr(i1));

          self.FAcknowledge := q.getAcknowledge;

          Conn_wrt_log('getAcknowledge success ...');

          FResponse := FAcknowledge;

          Conn_wrt_log('FResponse='+FResponse.GetText);

          FStream.PDUSize := FAcknowledge.FMaxPduSize;

        finally
          q.Free;
        end;
      end;
    3:
      begin
        associaterejectpdu := TAssociateRejectPdu.Create;

        Conn_wrt_log('TAssociateRejectPdu.Create');

        associaterejectpdu.read(FStream, i1);

        Conn_wrt_log('associaterejectpdu.read i1='+inttostr(i1));

        FResponse := associaterejectpdu.getReject;

        Conn_wrt_log('FResponse='+FResponse.GetText);

        associaterejectpdu.Free;
      end;
    7:
      begin
        abortpdu := TAbortPdu.Create;

        Conn_wrt_log('TAbortPdu.Create');

        abortpdu.read(FStream, i1);

        Conn_wrt_log('abortpdu.read i1='+inttostr(i1));

        FResponse := abortpdu.getAbort;

        Conn_wrt_log('FResponse='+FResponse.GetText);

        abortpdu.Free;
      end;
  end; // case
  Result := FResponse;
end;

function TAssociation.getPresentationContext(i1: Integer): ShortInt;
var
  uidentry: TUIDEntry;
  j1: Integer;
  k1: Integer;
  uidentry1: TUIDEntry;
  byte0: ShortInt;
  l1: Integer;
  byte1: ShortInt;
begin
  uidentry := UIDS.ItemByConstant[i1];
  if (uidentry.UIDType <> 4) and (uidentry.UIDType <> 1) then
  begin
    raise
      Exception.Create('first argument should be Meta SOP Class or SOP Class')
      {IllegalValueException};
  end;
  j1 := FRequest.getPresentationContexts;
  k1 := 0;
  while k1 < j1 do
  begin
    uidentry1 := FRequest.getAbstractSyntax(k1);
    if uidentry1.Constant = i1 then
    begin
      byte0 := FRequest.getPresentationContextID(k1);
      //      l1 := FAcknowledge.getPresentationContexts-1;
      //      while l1 >=0  do
      l1 := 0;
      while l1 < FAcknowledge.getPresentationContexts do
      begin
        byte1 := FAcknowledge.getPresentationContextID(l1);
        if (byte1 = byte0) and (FAcknowledge.getResult(l1) = 0) then
        begin
          result := byte0;
          exit;
        end;
        //        dec(l1);
        inc(l1);
      end;
    end;
    Inc(k1);
  end;

  // FOMIN 13.08.2012 - перенесено в конец процедуры - 05.01.2013
  result := FRequest.getPresentationContextID(0); // берем просто первый в списке произвольно
  exit;

  raise
    Exception.Create('no accepted presentation context with specified abstract syntax:' +
    uidentry.Value)
    {IllegalValueException};
end;

function TAssociation.getTransferSyntax(byte0: ShortInt): TUIDEntry;
var
  i1: Integer;
  j1: Integer;
begin
  i1 := -1;
  j1 := 0;
  while j1 < FAcknowledge.getPresentationContexts do
  begin
    if byte0 = FAcknowledge.getPresentationContextID(j1) then
    begin
      //      if FAcknowledge.getResult(j1) <> 0  then
      begin

        i1 := j1;
      end;
    end;
    inc(j1);
  end;
  if i1 = -1 then
  begin
    // 14.08.2012 FOMIN
    result := FAcknowledge.getTransferSyntax(0);
    exit;

//    raise
//      Exception.Create('presentation context with specified id not present in Acknowledge')
      {IllegalValueException};
  end;
  if FAcknowledge.getResult(i1) <> 0 then
  begin
    raise Exception.Create('not an accepted presentation context')
      {IllegalValueException};
  end
  else
  begin
    result := FAcknowledge.getTransferSyntax(i1);
    exit;
  end;
end;

function TAssociation.ReceiveDataPdu(k: Integer): Boolean;
var
  uidentry: TUIDEntry;
  da1: TDicomAttributes;
  r1: TDicomAttributes;
begin
  Result := false;
  if not assigned(FDataPdu) then
  begin
    try
      FDataPdu := TAssociateDataPdu.Create;
    except
      on e: Exception do
      begin
        E.Message := '>>TAssociateDataPdu.Create:' + E.Message;
        raise;
      end;
    end;
  end;
  try
    FDataPdu.Read(FStream, k);
  except
    on e: Exception do
    begin
      E.Message := '>>FDataPdu.Read:' + E.Message;
      raise;
    end;
  end;
  if FDataPdu.MessageFinish then
  begin
    try

      FDataPdu.Stream.Position := 0;

      FPresentationContextId := FDataPdu.FPresentationContextId;
      if FDataPdu.MessageType = 0 then
      begin
        if FAcknowledge = nil then
          raise Exception.Create(V_CONNECT_AOTO_RESTORE);

        uidentry := getTransferSyntax(ShortInt(FPresentationContextId));

        if not assigned(FReceiveCommand) then
        begin
          FReceiveCommand := TDicomAttributes.Create;
          try
            FReceiveCommand.ReadDataPDUCommand(0, FDataPdu.Stream, uidentry.Constant);
          except
            on e: Exception do
            begin
              E.Message := 'ReadDataPDUData 0:' + E.Message;
              raise;
            end;
          end;

          if assigned(FOnNewCommand) then
          begin
            FOnNewCommand(self, FReceiveCommand, FDataPdu.Stream.Position, FDataPdu.Stream);
          end;
        end
        else
        begin
          r1 := TDicomAttributes.Create;
          try
            r1.ReadDataPDUCommand(0, FDataPdu.Stream, uidentry.Constant);

          except
            on e: Exception do
            begin
              E.Message := 'ReadDataPDUData 3:' + E.Message;
              raise;
            end;
          end;


          if r1.Count > 0 then
          begin
            FReceiveCommand.Free;
            FReceiveCommand := r1;
          end
          else
            r1.Free;
        end;
        da1 := TDicomAttributes.Create;
        try
          da1.ReadDataPDUData(0, FDataPdu.Stream, uidentry.Constant);
        except
          on e: Exception do
          begin
            da1.Free;
            da1 := nil;
            E.Message := 'ReadDataPDUData 2:' + E.Message;
            raise;
          end;
        end;
        if assigned(FOnNewData) then
        begin
          FOnNewData(self, da1, FDataPdu.Stream.Position,FDataPdu.Stream);
        end;

        //      da1.ListAttrinute('', KxImsForm.Memo1.Lines);
        FDataAttributesList.Add(da1);
        //Result := true;
        if FReceiveCommand <> nil then
        begin
          Result := (getCommandType(FReceiveCommand) <= 4096) or
            (FReceiveCommand.GetInteger(dStatus) = 0);
        end
        else
        begin
          Result := (getCommandType(da1) <= 4096) or
            (da1.GetInteger(dStatus) = 0);
        end;
      end
      else
      begin
        if assigned(FReceiveCommand) then
          FReceiveCommand.Free;
        FReceiveCommand := TDicomAttributes.Create;
        try
          FReceiveCommand.ReadData(0, FDataPdu.Stream, ImplicitVRLittleEndian);
        except
          on e: Exception do
          begin
            E.Message := 'ReadDataPDUData 3:' + E.Message;
            raise;
          end;
        end;
        if assigned(FOnNewCommand) then
          begin
            FOnNewCommand(self, FReceiveCommand, FDataPdu.Stream.Position, FDataPdu.Stream);
          end;
        Result := not DataPresent(FReceiveCommand);
      end;
    finally
      FDataPdu.Free;
      FDataPdu := nil;
    end;
  end;
end;
(*
function TAssociation.ReceiveDataPdu(k: Integer): Boolean;
var
  uidentry: TUIDEntry;
  da1: TDicomAttributes;
  r1: TDicomAttributes;
begin
  Result := false;
  if not assigned(FDataPdu) then
  begin
    try
      FDataPdu := TAssociateDataPdu.Create;
    except
      on e: Exception do
      begin
        E.Message := '>>TAssociateDataPdu.Create:' + E.Message;
        raise;
      end;
    end;
  end;
  try
    FDataPdu.Read(FStream, k);
  except
    on e: Exception do
    begin
      E.Message := '>>FDataPdu.Read:' + E.Message;
      raise;
    end;
  end;
  if FDataPdu.MessageFinish then
  begin
    try

      FDataPdu.Stream.Position := 0;

      FPresentationContextId := FDataPdu.FPresentationContextId;
      if FDataPdu.MessageType = 0 then
      begin
        if FAcknowledge = nil then
          raise Exception.Create(V_CONNECT_AOTO_RESTORE);

        uidentry := getTransferSyntax(ShortInt(FPresentationContextId));

        if not assigned(FReceiveCommand) then
        begin
          if assigned(FOnNewCommand) then
          begin
            FOnNewCommand(self, nil, FDataPdu.Stream.Position, FDataPdu.Stream);
          end;

          FReceiveCommand := TDicomAttributes.Create;
          try
            //for some CR 2012-6-1 jiawen
            //FReceiveCommand.ReadDataPDUCommand(0, FDataPdu.Stream, ImplicitVRLittleEndian);

            //normal
            FReceiveCommand.ReadDataPDUCommand(0, FDataPdu.Stream, uidentry.Constant);
          except
            on e: Exception do
            begin
              E.Message := 'ReadDataPDUData 0:' + E.Message;
              raise;
            end;
          end;

          {if assigned(FOnNewCommand) then
          begin
            FOnNewCommand(self, FReceiveCommand, FDataPdu.Stream.Position, FDataPdu.Stream);
          end;}
        end
        else
        begin
          r1 := TDicomAttributes.Create;
          try
            r1.ReadDataPDUCommand(0, FDataPdu.Stream, uidentry.Constant);

          except
            on e: Exception do
            begin
              E.Message := 'ReadDataPDUData 3:' + E.Message;
              raise;
            end;
          end;

          if r1.Count > 0 then
          begin
            FReceiveCommand.Free;
            FReceiveCommand := r1;
          end
          else
            r1.Free;
        end;

        if assigned(FOnNewData) then
        begin
          FOnNewData(self, nil, FDataPdu.Stream.Position, FDataPdu.Stream);
        end;

        da1 := TDicomAttributes.Create;
        try
          da1.ReadDataPDUData(FDataPdu.Stream.Position, FDataPdu.Stream, uidentry.Constant);
        except
          on e: Exception do
          begin
            da1.Free;
            da1 := nil;
            E.Message := 'ReadDataPDUData 2:' + E.Message;
            raise;
          end;
        end;

        {if assigned(FOnNewData) then
        begin
          FOnNewData(self, da1, FDataPdu.Stream.Position, FDataPdu.Stream);
        end;}

        //      da1.ListAttrinute('', KxImsForm.Memo1.Lines);
        FDataAttributesList.Add(da1);
        //Result := true;
        if FReceiveCommand <> nil then
        begin
          Result := (getCommandType(FReceiveCommand) <= 4096) or
            (FReceiveCommand.GetInteger(dStatus) = 0);
        end
        else
        begin
          Result := (getCommandType(da1) <= 4096) or
            (da1.GetInteger(dStatus) = 0);
        end;
      end
      else
      begin
        if assigned(FReceiveCommand) then
          FReceiveCommand.Free;

        if assigned(FOnNewCommand) then
        begin
          FOnNewCommand(self, nil, FDataPdu.Stream.Position, FDataPdu.Stream);
        end;

        FReceiveCommand := TDicomAttributes.Create;
        try
          //for some CR 2012-6-1 jiawen
          //FReceiveCommand.ReadData(0, FDataPdu.Stream, ImplicitVRLittleEndian);

          //normal
          FReceiveCommand.ReadData(0, FDataPdu.Stream, uidentry.Constant);
        except
          on e: Exception do
          begin
            E.Message := 'ReadDataPDUData 4:' + E.Message;
            raise;
          end;
        end;
        {if assigned(FOnNewCommand) then
        begin
          FOnNewCommand(self, FReceiveCommand, FDataPdu.Stream.Position, FDataPdu.Stream);
        end;}
        Result := not DataPresent(FReceiveCommand);
      end;
    finally
      FDataPdu.Free;
      FDataPdu := nil;
    end;
  end;
end;  *)

function TAssociation.SendAttriutes(APresentationContextId, AHeaderValue: Byte;
  dicomobject: TDicomAttributes; ATransferSyntax: Integer): Boolean;
var
  DataPdu1: TAssociateDataPdu;
begin
  Conn_wrt_log('begin - SendAttriutes');
  Result := false;
  if assigned(dicomobject) then
  begin
    Conn_wrt_log('before TAssociateDataPdu.Create');
    DataPdu1 := TAssociateDataPdu.Create(FAcknowledge.MaxPduSize, APresentationContextId,
      AHeaderValue);
    try
      Conn_wrt_log('DataPdu1.Stream.Seek');
      {$IFDEF USER_FILE_PDUSTREAM}
      DataPdu1.Stream.Seek(soFromBeginning, 0);
      {$ELSE}
      {$IFDEF USERMEMORYPDUSTREAM}
      DataPdu1.Stream.Clear;
      {$ENDIF}
      {$ENDIF}
      dicomobject.AddAllGrouplength(ATransferSyntax);
      Conn_wrt_log('dicomobject.AddAllGrouplength');
      // FOMIN 26.12.2012 compression
//      dicomobject.Write(DataPdu1.Stream, ATransferSyntax, 90);
      if v_quality=0 then v_quality:=100; // для вызовов из других мест - чтобы работало как раньше
      dicomobject.Write(DataPdu1.Stream, ATransferSyntax, v_quality); // 100  ImplicitVRLittleEndian
      Conn_wrt_log('Write ATransferSyntax v_quality');
      // DataPdu1.Stream.FileName; // .SaveToFile('C:\t1.dcm');
      try
        DataPdu1.Write(FStream);
      except
        on e: Exception do
        begin
          Conn_wrt_log('DataPdu1.Write Exception '+e.Message);
        //  raise; // FOMIN 06 12 2013
        end;                  
      end;
      Result := true;
    finally
      DataPdu1.Free;
      Conn_wrt_log('DataPdu1.Free');
    end;
  end;
end;

function TAssociation.SendAttriutesEx(APresentationContextId, AHeaderValue: Byte;
  dicomobject1, dicomobject2: TDicomAttributes; ATransferSyntax: Integer): Boolean;
var
  DataPdu1: TAssociateDataPdu;
begin
  Result := false;
  if assigned(dicomobject1) then
  begin
    DataPdu1 := TAssociateDataPdu.Create(FAcknowledge.MaxPduSize, APresentationContextId,
      AHeaderValue);
    try
      {$IFDEF USER_FILE_PDUSTREAM}
      DataPdu1.Stream.Seek(soFromBeginning, 0);
      {$ELSE}
      {$IFDEF USERMEMORYPDUSTREAM}
      DataPdu1.Stream.Clear;
      {$ENDIF}
      {$ENDIF}
      dicomobject1.AddAllGrouplength(ATransferSyntax);

      dicomobject1.Write(DataPdu1.Stream, ATransferSyntax, 90);

      dicomobject2.AddAllGrouplength(ATransferSyntax);

      dicomobject2.Write(DataPdu1.Stream, ATransferSyntax, 90);

      //DataPdu1.Stream.SaveToFile('C:\t1.dcm');
      //ImplicitVRLittleEndian);
      try
        DataPdu1.Write(FStream);
      except
        on e: Exception do
        begin
          raise;
        end;
      end;
      Result := true;
    finally
      DataPdu1.Free;
    end;
  end;
end;

function TAssociation.getResult(i1: Integer): Integer;
begin
  result := getResultForAbstractSyntax(FRequest, FAcknowledge, i1);
end;

function TAssociation.receiveAbort(k: Integer): TDicomAbort;
var
  abortpdu: TAbortPdu;
begin
  abortpdu := TAbortPdu.Create;
  try
    abortpdu.read(FStream, k);
    result := abortpdu.getAbort;
  finally
    abortpdu.Free;
  end;
end;

procedure TAssociation.SendStatus(AStatus: Integer);
var
  CommandAttributes: TDicomAttributes;
begin
  CommandAttributes := PrepareResponseCommand;
  try
    CommandAttributes.AddVariant(dStatus, AStatus);
    CommandAttributes.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);

    //                        CommandAttributes.ListAttrinute('REP:', KxImsForm.Memo1.Lines);

    ResponseDataPdu(CommandAttributes, nil);
  finally
    CommandAttributes.Free;
  end;
end;

procedure TAssociation.sendAbort(i1: Integer; j1: Integer);
begin
  with TAbortPdu.Create(i1, j1) do
  try
    Write(FStream);
  finally
    Free;
  end; // try/finally
end;

procedure TAssociation.sendAssociateRequest(request: TRequest);
var
  q: TAssociateRequestPdu;
begin
  FRequest := request;
  request.ImplementationClassUID := '1.2.826.0.1.3680043.1.1.4.1.26.0'; //'1.2.276.0.54.20050101.5.0.0.0';
  request.ImplementationVersionName := 'CNS_Soft_1_000';
  request.setScuScpRoleSelection(ComputedRadiographyImageStorage ,1,1);

{  FAcknowledge.setScuScpRoleSelection(scuscprolesubitem.AbstractSyntax.Constant,
                scuscprolesubitem.ScuRole, scuscprolesubitem.ScpRole); }

  {Conn_wrt_log('ImplementationClassUID='+request.ImplementationClassUID+
               'ImplementationVersionName='+request.ImplementationVersionName
              );}

  q := TAssociateRequestPdu.Create(request);
  try
    q.write(FStream);
  finally
    q.Free;
  end;
end;

procedure TAssociation.sendAssociateResponse(AResponse: TDicomResponse);
var
  abort: TDicomAbort;
  abortpdu: TAbortPdu;
  reject: TDicomReject;
  associaterejectpdu: TAssociateRejectPdu;
  //  n: TAcknowledge;
  r: TAssociateAcknowledgePdu;
begin
  FResponse := AResponse;
  if AResponse is TDicomAbort then
  begin
    abort := TDicomAbort(AResponse);
    abortpdu := TAbortPdu.Create(abort.Source, abort.Reason);
    try
      abortpdu.write(FStream);
    finally
      abortpdu.Free;
    end;
  end
  else
    if AResponse is TDicomReject then
  begin
    reject := TDicomReject(AResponse);
    associaterejectpdu := TAssociateRejectPdu.Create(reject.ResponseResult,
      reject.Source, reject.Reason);
    try
      associaterejectpdu.write(FStream);
    finally
      associaterejectpdu.Free;
    end;
  end
  else
  begin
    if AResponse is TAcknowledge then
    begin
      FAcknowledge := TAcknowledge(AResponse);

      FStream.PDUSize := FAcknowledge.FMaxPduSize;

      r := TAssociateAcknowledgePdu.Create(FAcknowledge);
      try
        r.write(FStream);
        //        s:=r.getPresentationContextResponseItems;
      finally
        r.Free;
      end;
    end;
  end;
end;

procedure TAssociation.receiveReleaseRequest(i1: Integer);
begin
  //  i1 := FStream.readInt8;
  if i1 <> 5 then
  begin
    raise Exception.Create('wrong first byte for expected Release Request: ' +
      IntToStr(i1)) {IllegalValueException};
  end
  else
  begin
    FStream.readInt8;
    FStream.readInt32;
    FStream.readInt32;
  end; //end of if(i1 <> 5)
end;

destructor TAssociation.Destroy;
begin
  Clear;

  //  if assigned(FResponse) then
  //    FResponse.Free;

  if fReceiveStreams <> nil then
  begin
    fReceiveStreams.Free;
  end;

  if assigned(FDataAttributesList) then
    FDataAttributesList.Free;

  if assigned(FRequest) then
    FRequest.Free;

  if assigned(FAcknowledge) then
    FAcknowledge.Free;

  FStream.Free;
  inherited Destroy;
end;
{$IFDEF DICOMINDYCLIENT}

constructor TAssociation.Create(ASocket: TCnsTCPConnection);
begin
  FStream := TDicomTCPSocketStream.Create(ASocket);
  FDataAttributesList := TList.Create;
  fReceiveStreams := TList.Create;

  FReceiveCommand := nil;

  FDataPdu := nil;
  FRequest := nil;
  FAcknowledge := nil;
  FErrorMsg := '';
end;
{$ENDIF}
{$IFDEF DICOMVCSCLIENT}

constructor TAssociation.Create(ASocket: TCustomWSocket);
begin
  FStream := TDicomVCSSocketStream.Create(ASocket);
  FDataAttributesList := TList.Create;
  fReceiveStreams := TList.Create;
  FReceiveCommand := nil;

  FDataPdu := nil;
  FRequest := nil;
  FAcknowledge := nil;
  FErrorMsg := '';
end;
{$ENDIF}
{$IFDEF DICOMWSOCKCLIENT}

constructor TAssociation.Create(ASocket: TKXSock);
begin
  FReturnStatus := 0;
  FDataAttributesList := TList.Create;
  fReceiveStreams := TList.Create;
  FReceiveCommand := nil;
  FResponse := nil;
  FDataPdu := nil;
  FRequest := nil;
  FAcknowledge := nil;
  FErrorMsg := '';
  fReceiveTimeout := v_mn_timeout;

  FStream := TDicomKXSocketStream.Create(ASocket);
  //  FStream.ReceiveTimeout := ReceiveTimeout;
end;
{$ENDIF}

constructor TAssociation.Create(AStream: TStream);
begin
  FReturnStatus := 0;
  FStream := TDicomMemoryStream.Create(AStream);
  FResponse := nil;
  FDataAttributesList := TList.Create;
  fReceiveStreams := TList.Create;
  FReceiveCommand := nil;

  FDataPdu := nil;
  FRequest := nil;
  FAcknowledge := nil;
  FErrorMsg := '';

  fReceiveTimeout := v_mn_timeout;

end;

procedure TAssociation.sendReleaseRequest;
begin
  FStream.writeInt8(5);
  FStream.writeInt8(0);
  FStream.writeInt32(4);
  FStream.writeInt32(0);
  FStream.FreshData;
end;
{$IFDEF USER_FILE_PDUSTREAM}

constructor TPDUStream.Create(const FileName: AnsiString);
begin
  inherited Create(FileName, fmCreate);
  fTempFileName := FileName;
  fReallocCount := 0;
end;

destructor TPDUStream.Destroy;
begin
  inherited;
end;
{$ELSE}
{$IFDEF USERMEMORYPDUSTREAM}

procedure TPDUStream.AppendBuffer(AData: Pointer; ALen: Integer);
var
  i: Integer;
begin
  if Position > 0 then
  begin
    Remove(Position);
  end;
  i := Position;
  Position := Size;
  Write(AData^, ALen);
  Position := i;
end;

constructor TPDUStream.Create;
begin
  inherited;
  fReallocCount := 0;
end;

procedure TPDUStream.Remove(const AByteCount: integer);
begin
  if AByteCount >= Size then
  begin
    Clear;
  end
  else
  begin
    Move(PAnsiChar(Memory)[AByteCount], PAnsiChar(Memory)[0], Size - AByteCount);
    SetSize(Size - AByteCount);
  end;
end;

function TPDUStream.Realloc(var NewCapacity: Longint): Pointer;
const
  MemoryDelta = $2000; { Must be a power of 2 }
begin

  if (NewCapacity > 0) and (NewCapacity <> Size) then
    NewCapacity := (NewCapacity + (MemoryDelta - 1)) and not (MemoryDelta - 1);
  Result := Memory;
  if NewCapacity <> Capacity then
  begin
    if NewCapacity = 0 then
    begin
      {$IFDEF MSWINDOWS_}
      GlobalFreePtr(Memory);
      {$ELSE}
      FreeMem(Memory);
      {$ENDIF}
      Result := nil;
    end
    else
    begin
      inc(fReallocCount);
      {$IFDEF MSWINDOWS_}
      if Capacity = 0 then
        Result := GlobalAllocPtr(HeapAllocFlags, NewCapacity)
      else
        Result := GlobalReallocPtr(Memory, NewCapacity, HeapAllocFlags);
      {$ELSE}
      if Capacity = 0 then
        GetMem(Result, NewCapacity)
      else
        ReallocMem(Result, NewCapacity);
      {$ENDIF}
      if Result = nil then
        raise Exception.Create(Format('TPDUStream--New Size=%d,Old Size=%d.', [NewCapacity,
          Size]));
    end;
  end;
end;
{$ENDIF}
{$ENDIF}

destructor TAssociateDataPdu.Destroy;
{$IFDEF USER_FILE_PDUSTREAM}
var
  f1: AnsiString;
  {$ENDIF}
begin
  {$IFDEF USER_FILE_PDUSTREAM}
  f1 := FStream.fTempFileName;
  {$ENDIF}
  FStream.Free;
  {$IFDEF USER_FILE_PDUSTREAM}
  DeleteFile(PChar(f1));
  {$ENDIF}
  inherited Destroy;
end;

procedure TAssociateDataPdu.read(inputstream: TDicomIOStream; AItemType:
  Integer);
var
  j1: Integer;
  i1: Integer;
  k: Integer;
  p1: PAnsiChar;
  vExit:Boolean;
  vErrMsg : string;
begin
  if AItemType <> FItemType then
  begin
    raise Exception.Create('first byte of PDATA-PDU not 0x04 but ' +
      IntToStr(AItemType)) {IllegalValueException};
  end;
  inputstream.ReadSkipBytes(1);
  j1 := inputstream.readInt32; //pdu length
  while j1 > 0 do
  begin
    i1 := inputstream.readInt32; //item length
    j1 := j1 - i1 - 4;
    FPresentationContextId := inputstream.readInt8;
    FHeaderValue := inputstream.readInt8;
    try
      getMem(p1, i1 - 2);
      k := inputstream.readBuffer(p1, i1 - 2);
      vExit:=False;
    except
    on E:Exception do
      begin
        vErrMsg := 'Не хватает памяти '+E.Message+ #13#10+fFrmMsgMemStatus ;
        MessageDlg( vErrMsg , mtError, [mbOK], 0);
        MnLg_ev( vErrMsg,
             ExtractFilePath(paramstr(0))+'dicom.err',
             False
           );
        vExit:=True;
      end;
    end;
    if not vExit then
    begin
      try
        FStream.write(p1^, k);
      except
        on e: Exception do
        begin
          raise Exception.Create(Format('write to PDU Stream error(%d,%d,%d):%s', [Stream.Size, k,
            Stream.fReallocCount, e.Message]));
        end;
      end;
      FreeMem(p1);
      FMessageType := FHeaderValue and 1;
      FMessageFinish := (FHeaderValue and 2) <> 0;
    end;
  end;
end;

procedure TAssociateDataPdu.write(dataoutputstream: TDicomIOStream);
var
  l1: Integer;
  i2: Integer;
  {$IFDEF DICOMDEBUG}
  k1: TDatetime;
  {$ENDIF}
  {$IFDEF USER_FILE_PDUSTREAM}
  p1: PAnsiChar;
  {$ENDIF}
begin
  l1 := FStream.Size;
  i2 := FMaxPduSize - 6;
  {$IFDEF USER_FILE_PDUSTREAM}
  if l1 > i2 then
    GetMem(p1, i2)
  else
    GetMem(p1, l1);
  try
    Stream.Position := 0;
    {$ENDIF}
    //  i2 := $FFFF - 6;
    {$IFDEF DICOMDEBUG}
    k1 := now;
    {$ENDIF}
    while l1 > i2 do
    begin
      dataoutputstream.writeInt8(4);
      dataoutputstream.writeInt8(0);
      dataoutputstream.writeInt32(FMaxPduSize);
      dataoutputstream.writeInt32(FMaxPduSize - 4);
      dataoutputstream.writeInt8(FPresentationContextId);
      dataoutputstream.writeInt8(FHeaderValue);
      {$IFDEF USER_FILE_PDUSTREAM}
      FStream.Read(p1^, i2);
      dataoutputstream.writebuffer(p1, i2);
      {$ELSE}
      {$IFDEF USERMEMORYPDUSTREAM}

      dataoutputstream.writebuffer(FStream.Memory, i2);
      FStream.Remove(i2);
      {$ENDIF}
      {$ENDIF}
      l1 := l1 - i2;
      dataoutputstream.FreshData;
    end;
    dataoutputstream.writeInt8(4);
    dataoutputstream.writeInt8(0);
    dataoutputstream.writeInt32(l1 + 6);
    dataoutputstream.writeInt32(l1 + 2);
    dataoutputstream.writeInt8(FPresentationContextId);
    dataoutputstream.writeInt8(FHeaderValue + 2);
    {$IFDEF USER_FILE_PDUSTREAM}
    FStream.Read(p1^, l1);
    dataoutputstream.writebuffer(p1, l1);
    {$ELSE}
    {$IFDEF USERMEMORYPDUSTREAM}

    dataoutputstream.writebuffer(FStream.Memory, l1);
    FStream.Remove(l1);
    {$ENDIF}
    {$ENDIF}
    dataoutputstream.FreshData;
    {$IFDEF DICOMDEBUG}
    //  SendDebug('write:' + FormatDatetime('ss:zzz', now - k1));
    {$ENDIF}
    {$IFDEF USER_FILE_PDUSTREAM}
  finally
    Freemem(p1);
  end;
  {$ENDIF}
end;

constructor TAssociateDataPdu.Create(AMaxPduSize: Integer;
  APresentationContextId, AHeaderValue: Byte);
var v_FileName, v_FileName1:AnsiString;
    vPDUTempPath : string;
//const c_logAssDataPdu = False;
begin
  FItemType := 4;
  v_FileName1:='logAssDataPdu.err';
  {$IFDEF USER_FILE_PDUSTREAM}
  //if v_is_conn_log then
 //   MnLg_ev('USE USER_FILE_PDUSTREAM',v_FileName1);
  InterlockedIncrement(PDUTempFileIndex);
 // if v_is_conn_log then
 //   MnLg_ev('InterlockedIncrement',v_FileName1);
  //k := GetTickCount;
 { if PDUTempPath='' then
  begin
    PDUTempPath:=Trim(GetTempDirectory);
    if Copy(PDUTempPath,Length(PDUTempPath),1)='\' then
      PDUTempPath:=Copy(PDUTempPath,1,Length(PDUTempPath)-1);
  end;  }
  vPDUTempPath := Trim(GetTempDirectory);
  v_FileName:=Format('%s$%d_%d.TMP', [vPDUTempPath, PDUTempFileIndex, GetTickCount]);
 // if v_is_conn_log then
 //   MnLg_ev('try TPDUStream.Create FileName='+v_FileName,v_FileName1);
  try
    FStream := TPDUStream.Create(v_FileName);
  except
    on e:Exception do
      MnLg_ev('ERROR TPDUStream.Create FileName='+#13+v_FileName+' : '+#13+E.Message,v_FileName1);
  end;
  {$ELSE}
  {$IFDEF USERMEMORYPDUSTREAM}
  if c_logAssDataPdu then
    MnLg_ev('USE USERMEMORYPDUSTREAM');

  FStream := TPDUStream.Create;
  {$ENDIF}
  {$ENDIF}

  FMessageType := 0;
  FMessageFinish := False;
  FPresentationContextId := APresentationContextId;
  FHeaderValue := AHeaderValue;
  if AMaxPduSize = 0 then
    FMaxPduSize := 16384
  else
    FMaxPduSize := AMaxPduSize;
end;

constructor TAssociateDataPdu.Create;
begin
  FItemType := 4;
  {$IFDEF USER_FILE_PDUSTREAM}
    InterlockedIncrement(PDUTempFileIndex);
    FStream := TPDUStream.Create(Format('%s\$%d.TMP', [PDUTempPath, PDUTempFileIndex]));
  {$ELSE}
    {$IFDEF USERMEMORYPDUSTREAM}
    FStream := TPDUStream.Create;
    {$ENDIF}
  {$ENDIF}
  FMessageType := 0;
  FMessageFinish := False;
  FMaxPduSize := 16384 * 4;
  FPresentationContextId := 0;
  FHeaderValue := 0;
end;

{procedure TDicomIOStream.LoadData;
var
  p1: pAnsiChar;
  alen: Integer;
begin
  GetMem(p1, FSocket.RcvdCount + 1);
  aLen := FSocket.ReadBuffer(p1, FSocket.RcvdCount);
  if alen > 0 then
    FInputStream.AppendBuffer(p1, alen);
  FreeMem(p1);
end;
}

procedure TDicomIOStream.FreshData;
begin

end;
{$IFDEF DICOMWSOCKCLIENT}

procedure TDicomKXSocketStream.FreshData;
begin
  if FBufferWriteMode then
    if fPosition > 0 then
    begin
      if FSocket.Write(fBuffer, fPosition) = 0 then
      begin
        MnLg_ev(Format('Send Data to (%s:%d) Error! No Dataset sended',
                        [TKXSockClient(FSocket).Host, TKXSockClient(FSocket).Port]),
                        ExtractFilePath(paramstr(0))+'DicomKXSocketStream.log');
      //  raise Exception.Create(Format('Send Data to (%s:%d) Error! No Dataset sended',
      //    [TKXSockClient(FSocket).Host, TKXSockClient(FSocket).Port]));
      end;
      fPosition := 0;
      fCurBuffer := fBuffer;
    end;
end;

destructor TDicomKXSocketStream.Destroy;
begin
  if FBufferWriteMode then
    FreeMem(fBuffer);
  FreeMem(fReadBuffer);
  inherited Destroy;
end;

constructor TDicomKXSocketStream.Create(ASocket: TKXSock; ABufferWriteMode: Boolean = True);
begin
  inherited Create;
  FBufferReadMode := false;
  FBufferWriteMode := ABufferWriteMode;

  fReadBufferCount := 64 * 1024;
  GetMem(fReadBuffer, fReadBufferCount);
  fReadBufferPosition := 0;
  fReadBufferSize := 0;

  FSocket := ASocket;
  if FBufferWriteMode then
  begin
    fPDUSize := $FFFF;
    Getmem(fBuffer, fPDUSize);
    fPosition := 0;
    fCurBuffer := fBuffer;
  end
  else
    fBuffer := nil;
end;

function TDicomKXSocketStream.ReadBufferEx(Buffer: Pointer; ACount: Integer): Integer;
  function ReadToBuffer(Buffer: Pointer; ACount: Integer): Integer;
  var
    Ctr: Integer;
    ReadSize: Integer;
    p1: pAnsiChar;
    Done: Boolean;

    StartTime: Comp;
  begin
    if (fReceiveTimeout > 0) then
      StartTime := TimeCounter + fReceiveTimeout
    else
      StartTime := TimeCounter + $FFFFFFF;

    Ctr := 0;
    p1 := Buffer;
    Done := false;
    while (not Done) and (FSocket.Connected) and (not KXString.Timeout(StartTime)) do
    begin
      if FSocket.Readable then
      begin
        ReadSize := FSocket.Read(p1, FSocket.ReceiveLength);
        Done := Ctr + ReadSize >= ACount;
        if not Done then
        begin
          if ReadSize > 0 then
          begin
            Inc(Ctr, ReadSize);
            inc(p1, ReadSize);
          end;
          //DoSleepEx(1); // allow sockets to digest tcpip.sys packets...
          //ProcessWindowsMessageQueue;
        end;
      end
        //else
        //  ProcessWindowsMessageQueue;
    end;
    if not done then
    begin
      if KXString.Timeout(StartTime) then
      begin
        raise Exception.Create(Format('Receive data time out: %d ( server %s : %d ) !',
          [FSocket.LastCommandStatus, FSocket.PeerIPAddress, FSocket.PeerPort]));
      end;
      if not FSocket.Connected then
      begin
        raise Exception.Create(Format(dcmAssociationConnectError, [FSocket.LastCommandStatus,
          FSocket.PeerIPAddress, FSocket.PeerPort]));
      end;
    end;
    Result := Ctr + ReadSize;
  end;
var
  i1: Integer;
  p1, p2: pAnsiChar;
begin

  if ACount <= fReadBufferSize then
  begin
    p1 := fReadBuffer;
    inc(p1, fReadBufferPosition);
    Move(p1^, Buffer^, ACount);
    //fReadBufferSize := fReadBufferSize - ACount;
    fReadBufferPosition := fReadBufferPosition + ACount;
    if fReadBufferPosition >= fReadBufferSize then
      fReadBufferPosition := 0;
  end
  else
  begin
    if fReadBufferSize > 0 then
    begin
      p1 := fReadBuffer;
      inc(p1, fReadBufferPosition);
      Move(p1^, Buffer^, fReadBufferSize);
      i1 := ACount - fReadBufferSize;
      fReadBufferSize := 0;
      fReadBufferPosition := 0;
    end
    else
      i1 := ACount;
    if i1 > 0 then
    begin
      fReadBufferSize := ReadToBuffer(fReadBuffer, i1);

      p2 := Buffer;
      inc(p2, ACount - i1);
      Move(fReadBuffer^, p2^, i1);
      //fReadBufferSize := fReadBufferSize - i1;
      fReadBufferPosition := fReadBufferPosition + i1;
      if fReadBufferPosition >= fReadBufferSize then
        fReadBufferPosition := 0;
    end;
  end;
end;

function TDicomKXSocketStream.ReadBuffer(Buffer: Pointer; ACount: Integer): Integer;
var
  Ctr: Integer;
  ReadSize: Integer;
  p1: pAnsiChar;
  StartTime: Comp;
const c_log = False;
begin
  if FBufferReadMode then
    Result := ReadBufferEx(Buffer, ACount)
  else
  begin
    inc(SendDataCount, ACount);
    if ((fReceiveTimeout>0) and (fReceiveTimeout<v_mn_timeout))
    then fReceiveTimeout:=v_mn_timeout;
    if (fReceiveTimeout > 0) then
      StartTime := TimeCounter + fReceiveTimeout
    else
      StartTime := TimeCounter + $FFFFFFF;

    Ctr := 0;
    p1 := Buffer;

    FSocket.LastCommandStatus := 0;
    //while (not Done) and (FSocket.Connected) and (not KXString.Timeout(StartTime)) do
    //begin
    repeat
      if FSocket.Readable then
      begin
        ReadSize := FSocket.Read(p1, ACount - Ctr);
        case ReadSize of
          -1:
            begin
              if c_log then
              MnLg_ev('FSocket.Read: ReadSize=-1 FSocket.LastCommandStatus='+inttostr(FSocket.LastCommandStatus),
                        ExtractFilePath(paramstr(0))+'FSocket.log');

              case FSocket.LastCommandStatus of
                WSAETIMEDOUT,
                  WSAENOBUFS,
                  WSAEWOULDBLOCK:
                  begin
                    FSocket.LastCommandStatus := 0;
                  end;
                WSAECONNABORTED, WSAECONNRESET:
                  begin
                    FSocket.CloseNow;
                  end;
                //                  else ShowMessageWindow('','unknown fErrStatus='+IntToStr(fErrStatus));
              end;
            end;
          0:
            begin
              if c_log then
              MnLg_ev('FSocket.Read: ReadSize=0 FSocket.CloseNow',
                        ExtractFilePath(paramstr(0))+'FSocket.log');
              //               ShowMessageWindow('','ReadError(0) '+IntToStr(fErrStatus));
              FSocket.CloseNow;
              //ProcessWindowsMessageQueue;
            end;
        else
          begin
            if c_log then
            MnLg_ev('FSocket.Read: ReadSize='+inttostr(ReadSize),
                        ExtractFilePath(paramstr(0))+'FSocket.log');
            if ReadSize > 0 then
            begin
              Inc(Ctr, ReadSize);
              inc(p1, ReadSize);
            end;
          end;
        end;
      end
      else
      begin
        //if (FSocket.Connected) and (not KXString.Timeout(StartTime)) then
        //ProcessWindowsMessageQueue; //}
      end; //(FSocket.LastCommandStatus <> 0)
    until (Ctr = ACount) or (not FSocket.Connected) or (KXString.Timeout(StartTime));
    //end;
    if (Ctr <> ACount) then
    begin
      if KXString.Timeout(StartTime) then
      begin
        if v_is_raise_exceptions and c_log then
          MnLg_ev(Format('Receive data time out: %d ( server %s : %d ) !',
                [TKXSockClient(FSocket).LastCommandStatus, TKXSockClient(FSocket).PeerIPAddress, TKXSockClient(FSocket).PeerPort]),
                        ExtractFilePath(paramstr(0))+'FSocket.log');
       //   raise Exception.Create(Format('Receive data time out: %d ( server %s : %d ) !',
       //     [TKXSockClient(FSocket).LastCommandStatus, TKXSockClient(FSocket).PeerIPAddress, TKXSockClient(FSocket).PeerPort]));
      end;
      // FOMIN 11.07.2012 - если сокет отвалился то в конце операции это д.б. нормально
      {if not FSocket.Connected then
      begin
        raise Exception.Create(Format(dcmAssociationConnectError, [TKXSockClient(FSocket).LastCommandStatus,
          TKXSockClient(FSocket).PeerIPAddress, TKXSockClient(FSocket).PeerPort]));
      end;}
    end;
    Result := ACount;
  end;
end;

procedure TDicomKXSocketStream.WriteBuffer(Buffer: Pointer; ACount: Integer);
begin
  inc(ReceiveDataCount, ACount);
  if FBufferWriteMode then
  begin
    if fPosition + ACount >= fPDUSize then
      FreshData;
    Move(Buffer^, fCurBuffer^, ACount);
    inc(fCurBuffer, ACount);
    inc(fPosition, ACount);
  end
  else
  begin
    FSocket.Write(Buffer, ACount);

    if not FSocket.Connected then
    begin
      raise Exception.Create(Format(dcmAssociationConnectError, [FSocket.LastCommandStatus,
        FSocket.PeerIPAddress, FSocket.PeerPort]));
    end;
  end;
end;

procedure TDicomKXSocketStream.WriteStream(AStream: TStream);
begin
  if FBufferWriteMode then
    FreshData;

  inc(ReceiveDataCount, AStream.Size);

  FSocket.SendFromStreamWithSize(AStream);
  if not FSocket.Connected then
  begin
    raise Exception.Create('SendFromStreamWithSize - Socket disconnected!');
  end;

end;

procedure TDicomKXSocketStream.WriteFile(AFileName: AnsiString);
//var
//  Size: Integer;
begin
  if FBufferWriteMode then
    FreshData;

  FSocket.TransmitFileWithSize(AFileName);

  if not FSocket.Connected then
  begin
    raise Exception.Create('TransmitFileWithSize - Socket disconnected!');
  end;
end;

function TDicomKXSocketStream.ReadStream(AStream: TStream): Boolean;
var
  Size: Integer;
  SLen: Integer;
  p1: Pointer;
  FActualBlockSize: Integer;
begin
  //  Result := FSocket.SaveToStreamWithSize(AStream, $FFFFFFFF);
  AStream.Size := 0;
  //if Read(@Size, 4) = 4 then
  FActualBlockSize := FSocket.ActualBlockSize;
  Size := ReadInt32;
  getMem(p1, Min(Size, FActualBlockSize));
  try
    //    size := ntohl(size);
    while FSocket.Connected and (Size > 0) do
    begin
      //      SLen := Read(fChunkBuf, Min(Size, FActualBlockSize));
      SLen := ReadBuffer(p1, Min(Size, FActualBlockSize));
      if SLen > 0 then
      begin
        AStream.Write(p1^, SLen);
        Dec(Size, SLen);
      end;
      ProcessWindowsMessageQueue;
    end;
  finally
    Freemem(p1);
  end;
  inc(SendDataCount, AStream.Size);
  if not FSocket.Connected then
  begin
    raise Exception.Create(Format('Socket disconnected:%d(Peer Host:%s:%d))',
      [FSocket.LastCommandStatus,
      FSocket.PeerIPAddress, FSocket.PeerPort]));
  end;
  {  begin
    Result := FSocket.SaveToStreamWithSize(AStream, $FFFFFFFF);
    inc(SendDataCount, AStream.Size);
    if not FSocket.Connected then
    begin
      raise Exception.Create(Format(dcmAssociationConnectError, [FSocket.LastCommandStatus, FSocket.PeerIPAddress, FSocket.PeerPort]));
    end;}
end;

procedure TDicomKXSocketStream.SetReceiveTimeout(Value: Integer);
var
  TimeoutMS: Integer;
begin
  inherited;
  if (fReceiveTimeout > 0) and (fReceiveTimeout <> Value) then
    KXSocket.SetReceiveTimeout(FSocket.Sock, fReceiveTimeout, TimeoutMS);
end;

procedure TDicomKXSocketStream.SetPDUSize(Value: Integer);
begin
  if fPDUSize <> Value then
  begin
    FreshData;
    FreeMem(fBuffer);
    fPDUSize := Value;
    Getmem(fBuffer, fPDUSize);
    fPosition := 0;
    fCurBuffer := fBuffer;
  end;
end;

procedure TDicomKXSocketStream.SetBufferReadMode(const Value: Boolean);
begin
  FBufferReadMode := Value;
end;

procedure TDicomKXSocketStream.SetBufferWriteMode(const Value: Boolean);
begin
  FBufferWriteMode := Value;
end;
{$ENDIF}

destructor TDicomIOStream.Destroy;
begin
  inherited Destroy;
end;

procedure TDicomIOStream.WriteStream(AStream: TStream);
begin

end;

function TDicomIOStream.ReadStream(AStream: TStream): Boolean;
begin
  Result := false;
end;

procedure TDicomIOStream.WriteFile(AFileName: AnsiString);
begin

end;

procedure TDicomIOStream.WriteSkipBytes(ABytes: Integer);
var
  p1: PAnsiChar;
begin
  GetMem(p1, ABytes);
  FillChar(p1^, ABytes, 0);
  WriteBuffer(p1, ABytes);
  FreeMem(p1);
end;

function TDicomIOStream.ReadBuffer(Buffer: Pointer; ACount: Integer): Integer;
begin
  raise Exception.Create('no stream');
end;

procedure TDicomIOStream.WriteBuffer(Buffer: Pointer; ACount: Integer);
begin
  raise Exception.Create('no stream');
end;

constructor TDicomIOStream.Create;
begin
  fReceiveTimeout := v_mn_timeout;
end;

function TDicomIOStream.ReadString(ACount: Integer): AnsiString;
{var
  P1:pAnsiChar;
  i:integer;
begin
  getMem(p1,ACount+1);
  FillChar(p1^,ACount+1,0);

  i:=0;
  repeat
    i := ReadBuffer(P1, ACount-i);
    inc(p1,i);
  until i>=ACount;

  Result := StrPas(p1);
  FreeMem(p1);}
{var
  i,l:integer;
begin
  SetLength(Result, ACount);
  i:=0;
  l:=1;
  repeat
    i:=ReadBuffer(@Result[l], ACount-i);
    inc(l,i);
  until l>=ACount;
}
begin
  SetLength(Result, ACount);
  ReadBuffer(@Result[1], ACount);
  //    raise Exception.Create(IntToStr(i)+'?'+IntToStr(ACount));}
end;

procedure TDicomIOStream.WriteString(AStr: AnsiString);
begin
  WriteBuffer(@astr[1], Length(astr));
end;

procedure TDicomIOStream.ReadSkipBytes(ABytes: Integer);
var
  p1: PAnsiChar;
begin
  GetMem(p1, ABytes);
  ReadBuffer(p1, ABytes);
  FreeMem(p1);
end;

procedure TDicomIOStream.WriteInt32(i: Integer);
begin
  c[3] := ShortInt(i);
  c[2] := ShortInt((i shr {0} 8));
  c[1] := ShortInt((i shr {0} 16));
  c[0] := ShortInt((i shr {0} 24));
  WriteBuffer(@c[0], 4);
end;

procedure TDicomIOStream.WriteInt16(i: SmallInt);
begin
  c[1] := ShortInt(i);
  c[0] := ShortInt((i shr {0} 8));
  WriteBuffer(@c[0], 2);
end;

procedure TDicomIOStream.WriteInt8(AInteger: ShortInt);
begin
  c[0] := AInteger;
  WriteBuffer(@c[0], 1);
end;

function TDicomIOStream.ReadInt32: Integer;
begin
  ReadBuffer(@c[0], 4);
  result := ((c[0]) shl 24) + ((c[1]) shl 16) + ((c[2]) shl 8) + (c[3]);
end;

function TDicomIOStream.ReadInt16: SmallInt;
begin
  ReadBuffer(@c[0], 2);
  result := ((c[0]) shl 8) + (c[1]);
end;

function TDicomIOStream.ReadInt8: ShortInt;
begin
  ReadBuffer(@Result, SizeOf(ShortInt));
end;

function TDicomReject.GetText: AnsiString;
begin
  Result := '[reject, result: ';
  case FReason of //FResult
    REJECTED_PERMANENT:
      Result := Result + 'REJECTED_PERMANENT';
    REJECTED_TRANSIENT:
      Result := Result + 'REJECTED_TRANSIENT'
  else
    begin
      Result := Result + 'UNKNOWN';
    end;
  end;
  Result := Result + ', source: ';
  case FSource of
    DICOM_UL_SERVICE_USER_reject:
      Result := Result + 'DICOM_UL_SERVICE_USER';
    DICOM_UL_SERVICE_PROVIDER_ACSE:
      Result := Result + 'DICOM_UL_SERVICE_PROVIDER_ACSE';
    DICOM_UL_SERVICE_PROVIDER_PRESENTATION:
      Result := Result + 'DICOM_UL_SERVICE_PROVIDER_PRESENTATION'
  else
    begin
      Result := Result + 'UNKNOWN';
    end;
  end;
  Result := Result + ', reason: ';
  case FResult of //FReason
    USER_NO_REASON_GIVEN:
      Result := Result + 'NO_REASON_GIVEN';
    USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED:
      Result := Result + 'APPLICATIONCONTEXTNAME_NOT_SUPPORTED';
    USER_CALLING_AETITLE_NOT_RECOGNIZED:
      Result := Result + 'CALLING_AETITILE_NOT_RECOGNIZED';
    USER_CALLED_AETITLE_NOT_RECOGNIZED:
      Result := Result + 'CALLED_AETITILE_NOT_RECOGNIZED';
    FReason_ACSE_PROTOCOL_NOT_SUPPORTED:
      Result := Result + 'PROTOCOL_NOT_SUPPORTED';
    FReason_PRESENTATION_TEMPORARY_CONGESTION:
      Result := Result + 'TEMPORARY_CONGESTION';
    FReason_PRESENTATION_LOCAL_LIMIT_EXCEEDED:
      Result := Result + 'LOCAL_LIMIT_EXCEEDED';
  else
    begin
      Result := Result + 'UNKNOWN';
    end;
  end;
  Result := Result + ']';
end;

function TDicomAbort.GetText: AnsiString;
begin
  Result := '[abort, source: ';
  case FSource of
    DICOM_UL_SERVICE_USER_abort:
      Result := Result + 'DICOM_UL_SERVICE_USER';
    DICOM_UL_SERVICE_PROVIDER:
      Result := Result + 'DICOM_UL_SERVICE_PROVIDER'
  else
    begin
      Result := Result + 'UNKNOWN';
    end;
  end;
  Result := Result + ', reason: ';
  case FReason of
    REASON_NOT_SPECIFIED:
      Result := Result + 'REASON_NOT_SPECIFIED';
    UNRECOGNIZED_PDU:
      Result := Result + 'UNRECOGNIZED_PDU';
    UNEXPECTED_PDU:
      Result := Result + 'UNEXPECTED_PDU';
    UNRECOGNIZED_PDU_PARAMETER:
      Result := Result + 'UNRECOGNIZED_PDU_PARAMETER';
    UNEXPECTED_PDU_PARAMETER:
      Result := Result + 'UNEXPECTED_PDU_PARAMETER';
    INVALID_PDU_PARAMETER_VALUE:
      Result := Result + 'INVALID_PDU_PARAMETER_VALUE'
  else
    Result := Result + 'UNKNOWN';
  end;
  Result := Result + ']';
end;

function TDicomResponse.fstr(AStr: AnsiString; ALen: Integer): AnsiString;
begin
  Result := Format('%' + IntToStr(ALen) + 's', [astr]);
end;

function TDicomResponse.fstr(i: Integer; ALen: Integer): AnsiString;
begin
  Result := Format('%' + IntToStr(ALen) + 'd', [i]);
end;

destructor TDicomResponse.Destroy;
begin
  inherited Destroy;
end;

constructor TDicomAbort.Create(ASource, AReason: Integer);
begin
  FSource := ASource;
  FReason := AReason;
  FResult := 0;
end;

constructor TDicomReject.Create(ASource, AReason, AResult: Integer);
begin
  FSource := ASource;
  FReason := AReason;
  FResult := AResult;
end;

function TDicomResponse.GetText: AnsiString;
begin
  Result := '';
end;

constructor TApplicationContextItem.Create;
begin
  FItemType := 16;
  FUID := '1.2.840.10008.3.1.1.1';
end;

function TApplicationContextItem.DataLength: Integer;
begin
  result := Length(FUID) + 4;
end;

function isPrivate(s: AnsiString): Boolean;
begin
  result := '1.2.840.10008.3.1.1.1' = s;
end;

procedure TApplicationContextItem.Write(dataoutputstream: TDicomIOStream);
begin
  dataoutputstream.WriteInt8(FItemType);
  dataoutputstream.WriteInt8(0);
  dataoutputstream.writeInt16(Length(FUID));
  dataoutputstream.WriteString(FUID);
end;

function TApplicationContextItem.read(datainputstream: TDicomIOStream):
  Integer;
var
  i: Integer;
  c1: Integer;
begin
  i := datainputstream.ReadInt8;
  if i <> FItemType then
  begin
    raise
      Exception.Create('itemtype field of received Application Context Item  not '
      + IntToStr(FItemType));
  end;
  datainputstream.ReadInt8;
  c1 := datainputstream.readInt16;
  fuid := datainputstream.ReadString(c1);
  result := 4 + c1;
end;

constructor TAbstractSyntaxItem.Create(uidentry: TUIDEntry);
begin
  FItemType := 48;
  FAbstractSyntax := uidentry;
end;

constructor TAbstractSyntaxItem.Create;
begin
  FItemType := 48;
end;

function TAbstractSyntaxItem.getLength: Integer;
begin
  result := Length(FAbstractSyntax.Value) + 4;
end;

procedure TAbstractSyntaxItem.write(dataoutputstream: TDicomIOStream);
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(Length(FAbstractSyntax.Value));
  dataoutputstream.writeString(FAbstractSyntax.Value);
end;

function TAbstractSyntaxItem.read(datainputstream: TDicomIOStream): Integer;
var
  i: Integer;
  s: AnsiString;
begin
  i := datainputstream.readInt8;
  if i <> FItemType then
  begin
    raise Exception.Create('wrong itemtype of abstract syntax')
      {IllegalValueException};
  end;
  datainputstream.readInt8;
  s := datainputstream.readString(datainputstream.readInt16);

  try
    FAbstractSyntax := UIDS.Items[s];
  except
    on unknownuidexception: Exception do
    begin
      FAbstractSyntax := TUIDEntry.Create(0, s, 'unknown uid', '??', 1);
    end
  end;
  result := 4 + Length(s);
end;

constructor TTransferSyntaxItem.Create;
begin
  FItemType := 64;
end;

constructor TTransferSyntaxItem.Create(uidentry: TUIDEntry);
begin
  FItemType := 64;
  FTransferSyntax := uidentry;
end;

function TTransferSyntaxItem.getTransferSyntax: TUIDEntry;
begin
  result := FTransferSyntax;
end;

function TTransferSyntaxItem.getLength: Integer;
begin
  result := Length(FTransferSyntax.Value) + 4;
end;

procedure TTransferSyntaxItem.Write(dataoutputstream: TDicomIOStream);
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(Length(FTransferSyntax.Value));
  dataoutputstream.writeString(FTransferSyntax.Value);
end;

function TTransferSyntaxItem.Read(datainputstream: TDicomIOStream): Integer;
var
  i: Integer;
  c: Integer;
  s: AnsiString;
begin
  i := datainputstream.readInt8;
  if i <> 64 then
  begin
    raise Exception.Create('itemtype field of received Transfer Syntax Item not '
      + IntToStr(FItemType)) {IllegalValueException};
  end;
  datainputstream.ReadInt8;
  c := datainputstream.readInt16;
  if c > 0 then
  begin
    s := datainputstream.readString(c);
    try
      FTransferSyntax := UIDS.Items[s];
    except
      on unknownuidexception: Exception do
      begin
        FTransferSyntax := TUIDEntry.Create(0, s, 'unknown uid', '??', 1);
      end
    end;
  end
  else
    FTransferSyntax := UIDS.ItemByConstant[ImplicitVRLittleEndian];
  //    FTransferSyntax := UIDS.ItemByConstant[JPEGExtendedProcess_2_4];
  result := 4 + c;
end;

destructor TPresentationContextItem.Destroy;
var
  i: integer;
begin
  if assigned(FTransferSyntaxes) then
  begin
    for i := 0 to FTransferSyntaxes.Count - 1 do
      TTransferSyntaxItem(FTransferSyntaxes[i]).Free;

    FTransferSyntaxes.Clear;
    FTransferSyntaxes.Free;
  end;
  if assigned(FAbstractSyntaxItem) then
    FAbstractSyntaxItem.Free;
  inherited Destroy;
end;

constructor TPresentationContextItem.Create;
begin
  FItemType := 32;
end;

constructor TPresentationContextItem.Create(AID: Integer; abstractsyntaxitem:
  TAbstractSyntaxItem; vector: TList);
begin
  FItemType := 32;
  FID := AID;
  FAbstractSyntaxItem := abstractsyntaxitem;
  FTransferSyntaxes := vector;
end;

function TPresentationContextItem.getID: Integer;
begin
  result := FID;
end;

function TPresentationContextItem.getAbstractSyntaxItem: TAbstractSyntaxItem;
begin
  result := FAbstractSyntaxItem;
end;

function TPresentationContextItem.getTransferSyntaxes: TList;
begin
  result := FTransferSyntaxes;
end;

procedure TPresentationContextItem.addTransferSyntaxItem(transfersyntaxitem:
  TTransferSyntaxItem);
begin
  FTransferSyntaxes.add(transfersyntaxitem);
end;

function TPresentationContextItem.GetLength: Integer;
var
  i: Integer;
  j: Integer;
  transfersyntaxitem: TTransferSyntaxItem;
begin
  i := 4;
  i := i + FAbstractSyntaxItem.getLength;
  j := 0;
  while j < FTransferSyntaxes.Count do
  begin
    transfersyntaxitem := TTransferSyntaxItem(FTransferSyntaxes[j]);
    i := i + transfersyntaxitem.getLength;
    Inc(j);
  end;
  result := i;
end;

procedure TPresentationContextItem.write(dataoutputstream: TDicomIOStream);
var
  i: Integer;
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(getLength);
  dataoutputstream.writeInt8(FID); //pres context ID
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt8(0);
  FAbstractSyntaxItem.write(dataoutputstream);
  i := 0;
  while i < FTransferSyntaxes.Count do
  begin
    (TTransferSyntaxItem(FTransferSyntaxes[i])).Write(dataoutputstream);
    Inc(i);
  end;
end;

function TPresentationContextItem.Read(datainputstream: TDicomIOStream;
  AItemType: Integer): Integer;
var
  i: Integer;
  j: Integer;
  k: Integer;
  l: Integer;
  i1: Integer;
  transfersyntaxitem: TTransferSyntaxItem;
begin
  //i := datainputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise Exception.Create('wrong item type of presentation context item')
      {IllegalValueException};
  end;
  datainputstream.readInt8;
  j := datainputstream.readInt16;
  k := j;
  FID := datainputstream.readInt8;
  datainputstream.readInt8;
  datainputstream.readInt8;
  datainputstream.readInt8;
  j := j - 4;
  FAbstractSyntaxItem := TAbstractSyntaxItem.Create;
  l := FAbstractSyntaxItem.read(datainputstream);
  j := j - l;
  FTransferSyntaxes := TList.Create;
  while j > 0 do
  begin
    transfersyntaxitem := TTransferSyntaxItem.Create;
    i1 := transfersyntaxitem.Read(datainputstream);
    FTransferSyntaxes.add(transfersyntaxitem);
    j := j - i1;
  end;
  result := k + 4;
end;

constructor TSubItem.Create;
begin

end;

function TSubItem.getLength: Integer;
begin
  result := 0;
end;

procedure TSubItem.write(dataoutputstream: TDicomIOStream);
begin

end;

function TSubItem.read(datainputstream: TDicomIOStream; AItemType: Integer):
  Integer;
begin
  result := 0;
end;

constructor TMaximumLengthSubItem.Create;
begin
  FItemType := 81;
end;

constructor TMaximumLengthSubItem.Create(i: Integer);
begin
  FItemType := 81;
  FMaxPduSize := i;
end;

function TMaximumLengthSubItem.getLength: Integer;
begin
  result := 8;
end;

procedure TMaximumLengthSubItem.write(dataoutputstream: TDicomIOStream);
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(4);
  dataoutputstream.writeInt32(FMaxPduSize);
end;

function TMaximumLengthSubItem.read(datainputstream: TDicomIOStream;
  AItemType: Integer): Integer;
var
  i: Integer;
  c: Integer;
begin
  //  i := datainputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise
      Exception.Create('itemtype field of received Implementation Class UID Item  not ' +
      IntToStr(FItemType)) {IllegalValueException};
  end
  else
  begin
    datainputstream.readInt8;
    c := datainputstream.readInt16;
    FMaxPduSize := datainputstream.readInt32;
    result := c + 4;
  end;
end;

constructor TImplementationClassUIDSubItem.Create;
begin
  FItemType := 82;
end;

constructor TImplementationClassUIDSubItem.Create(s: AnsiString);
begin
  FItemType := 82;
  FImplementationClassUID := s;
end;

function TImplementationClassUIDSubItem.getLength: Integer;
begin
  result := 4 + Length(FImplementationClassUID);
end;

procedure TImplementationClassUIDSubItem.write(dataoutputstream:
  TDicomIOStream);
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(Length(FImplementationClassUID));
  dataoutputstream.writeString(FImplementationClassUID);
end;

function TImplementationClassUIDSubItem.read(datainputstream:
  TDicomIOStream; AItemType: Integer): Integer;
var
  i: Integer;
  c: Integer;
begin
  //  i := datainputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise
      Exception.Create('itemtype field of received Implementation Class UID Item  not ' +
      IntToStr(FItemType)) {IllegalValueException};
  end
  else
  begin
    datainputstream.readInt8;
    c := datainputstream.readint16;
    FImplementationClassUID := datainputstream.readString(c);
    result := 4 + c;
  end;
end;

constructor TAsynchronousOperationsWindowSubItem.Create;
begin
  FItemType := 83;
end;

constructor TAsynchronousOperationsWindowSubItem.Create(i: Integer; j: Integer);
begin
  FItemType := 83;
  FMaxOperationsInvoked := i;
  FMaxOperationsPerformed := j;
end;

function TAsynchronousOperationsWindowSubItem.getLength: Integer;
begin
  result := 8;
end;

function TAsynchronousOperationsWindowSubItem.read(datainputstream:
  TDicomIOStream; AItemType: Integer): Integer;
var
  i: Integer;
  c1: Integer;
begin
  //i := datainputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise Exception.Create('wrong itemtype of abstract syntax')
      {IllegalValueException};
  end;
  datainputstream.readInt8;
  c1 := datainputstream.readInt16;
  if c1 <> 4 then
  begin
    raise
      Exception.Create('length of AsynchronousOperationsWindowSubItem should be 4')
      {IllegalValueException};
  end
  else
  begin
    FMaxOperationsInvoked := datainputstream.readInt16;
    FMaxOperationsPerformed := datainputstream.readInt16;
    result := 8;
  end;
end;

procedure TAsynchronousOperationsWindowSubItem.write(dataoutputstream:
  TDicomIOStream);
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(4);
  dataoutputstream.writeInt16(FMaxOperationsInvoked);
  dataoutputstream.writeInt16(FMaxOperationsPerformed);
end;

constructor TImplementationVersionNameSubItem.Create;
begin
  FItemType := 85;
end;

constructor TImplementationVersionNameSubItem.Create(s: AnsiString);
begin
  FItemType := 85;
  FImplementationVersionName := s;
end;

function TImplementationVersionNameSubItem.getLength: Integer;
begin
  result := 4 + Length(FImplementationVersionName);
end;

procedure TImplementationVersionNameSubItem.write(dataoutputstream:
  TDicomIOStream);
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(Length(ImplementationVersionName));
  dataoutputstream.writeString(ImplementationVersionName);
end;

function TImplementationVersionNameSubItem.read(datainputstream:
  TDicomIOStream; AItemType: Integer): Integer;
var
  i: Integer;
  c: Integer;
begin
  //i := datainputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise
      Exception.Create('itemtype field of received Implementation Version Name Item  not ' +
      IntToStr(FItemType)) {IllegalValueException};
  end
  else
  begin
    datainputstream.readInt8;
    c := datainputstream.readInt16;
    FImplementationVersionName := datainputstream.readstring(c);
    result := 4 + c;
  end;
end;

constructor TExtendedNegotiationSubItem.Create;
begin
  FItemType := 86;
  FApplicationInfo := '';
end;

constructor TExtendedNegotiationSubItem.Create(uidentry: TUIDEntry; abyte0:
  AnsiString);
begin
  FItemType := 86;
  FUIDEntry := uidentry;
  FApplicationInfo := abyte0;
end;

function TExtendedNegotiationSubItem.getUIDEntry: TUIDEntry;
begin
  result := FUIDEntry;
end;

function TExtendedNegotiationSubItem.getLength: Integer;
begin
  result := 6 + Length(FUIDEntry.Value) + length(FApplicationInfo);
end;

procedure TExtendedNegotiationSubItem.write(dataoutputstream:
  TDicomIOStream);
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(2 + Length(FUIDEntry.Value) +
    length(FApplicationInfo));
  dataoutputstream.writeInt16(Length(FUIDEntry.Value));
  dataoutputstream.writeString(FUIDEntry.Value);
  dataoutputstream.writeString(FApplicationInfo);
end;

function TExtendedNegotiationSubItem.read(datainputstream: TDicomIOStream;
  AItemType: Integer): Integer;
var
  i: Integer;
  c1: Integer;
  c2: Integer;
  s: AnsiString;
begin
  //  i := datainputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise
      Exception.Create('itemtype field of received Implementation Version Name Item  not ' +
      IntToStr(FItemType)) {IllegalValueException};
  end;
  datainputstream.readInt8;
  c1 := datainputstream.readInt16;
  c2 := datainputstream.readInt16;
  s := datainputstream.readString(c2);
  try
    FUIDEntry := UIDS.Items[s];
  except
    on unknownuidexception: Exception do
    begin
      FUIDEntry := TUIDEntry.Create(0, s, 'unknown uid', '??', 1);
    end
  end;
  FApplicationInfo := datainputstream.readString(c1 - c2 - 2);
  result := 4 + c1;
end;

constructor TScuScpRoleSubItem.Create;
begin
  FItemType := 84;
end;

constructor TScuScpRoleSubItem.Create(uidentry: TUIDEntry; i: Integer; j:
  Integer);
begin
  FItemType := 84;
  FAbstractSyntax := uidentry;
  FScuRole := i;
  FScpRole := j;
end;

function TScuScpRoleSubItem.getLength: Integer;
var
  i: Integer;
begin
  i := 8;
  if FAbstractSyntax <> nil then
  begin
    i := i + Length(FAbstractSyntax.Value);
  end;
  result := i;
end;

procedure TScuScpRoleSubItem.write(dataoutputstream: TDicomIOStream);
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(Length(FAbstractSyntax.Value) + 4);
  dataoutputstream.writeInt16(Length(FAbstractSyntax.Value));
  dataoutputstream.writeString(FAbstractSyntax.Value);
  dataoutputstream.writeInt8(FScuRole);
  dataoutputstream.writeInt8(FScpRole);
end;

function TScuScpRoleSubItem.read(datainputstream: TDicomIOStream; AItemType:
  Integer): Integer;
var
  i: Integer;
  //c1: Integer;
  c2: Integer;
  s: AnsiString;
begin
  //i := datainputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise Exception.Create('itemtype field of received ScuScpRoleSubItem  not '
      + IntToStr(FItemType)) {IllegalValueException};
  end;
  datainputstream.readInt8;
  datainputstream.readInt16;
  c2 := datainputstream.readInt16;
  s := datainputstream.readString(c2);
  try
    FAbstractSyntax := UIDS.Items[s];
  except
    on unknownuidexception: Exception do
    begin
      FAbstractSyntax := TUIDEntry.Create(0, s, 'unknown uid', '??', 1);
    end
  end;
  FScuRole := datainputstream.readInt8;
  FScpRole := datainputstream.readInt8;
  result := 6 + c2 + 2;
  exit;
end;

destructor TUserInfoItem.Destroy;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do // Iterate
  begin
    TSubItem(FList[i]).Free;
  end; // for
  FList.Free;
  inherited Destroy;
end;

constructor TUserInfoItem.Create;
begin
  FItemType := 80;
  c := 0;
  FList := TList.Create;
end;

procedure TUserInfoItem.addSubItem(subitem: TSubItem);
begin
  FList.add(subitem);
end;

function TUserInfoItem.getSubItems: TList;
begin
  result := FList;
end;

function TUserInfoItem.getLength: Integer;
var
  i: Integer;
  j: Integer;
begin
  i := 4;
  j := 0;
  while j < FList.Count do
  begin
    i := i + (TSubItem(FList[j])).getLength;
    Inc(j);
  end;
  i := i + c;
  result := i;
end;

procedure TUserInfoItem.write(dataoutputstream: TDicomIOStream);
var
  i: Integer;
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt16(getLength - 4);
  i := 0;
  while i < FList.Count do
  begin
    (TSubItem(FList[i])).write(dataoutputstream);
    Inc(i);
  end;
end;

function TUserInfoItem.read(datainputstream: TDicomIOStream; AItemType:
  Integer): Integer;
var
  l1: Integer;
  j2: Integer;
  i: Integer;
  i2: Integer;
  j: Integer;
  maximumlengthsubitem: TMaximumLengthSubItem;
  implementationclassuidsubitem: TImplementationClassUIDSubItem;
  asynchronousoperationswindowsubitem: TAsynchronousOperationsWindowSubItem;
  scuscprolesubitem: TScuScpRoleSubItem;
  implementationversionnamesubitem: TImplementationVersionNameSubItem;
  extendednegotiationsubitem: TExtendedNegotiationSubItem;
begin
  //  l1 := datainputstream.readInt8;
  l1 := AItemType;
  if l1 <> FItemType then
  begin
    raise Exception.Create('itemtype field of received User Info Item  not ' +
      IntToStr(FItemType)) {IllegalValueException};
  end;
  datainputstream.readInt8;
  j2 := datainputstream.readInt16;
  i := j2;
  while j2 > 0 do
  begin
    i2 := datainputstream.readInt8;
    //    datainputstream.UnreadBytes(1);
    case i2 of
      81:
        begin
          maximumlengthsubitem := TMaximumLengthSubItem.Create;
          j := maximumlengthsubitem.read(datainputstream, i2);
          addSubItem(maximumlengthsubitem);
          j2 := j2 - j;
        end;
      82:
        begin
          implementationclassuidsubitem :=
            TImplementationClassUIDSubItem.Create;
          j := implementationclassuidsubitem.read(datainputstream, i2);
          addSubItem(implementationclassuidsubitem);
          j2 := j2 - j;
        end;
      83:
        begin
          asynchronousoperationswindowsubitem :=
            TAsynchronousOperationsWindowSubItem.Create;
          j := asynchronousoperationswindowsubitem.read(datainputstream, i2);
          addSubItem(asynchronousoperationswindowsubitem);
          j2 := j2 - j;
        end;
      84:
        begin
          scuscprolesubitem := TScuScpRoleSubItem.Create;
          j := scuscprolesubitem.read(datainputstream, i2);
          addSubItem(scuscprolesubitem);
          j2 := j2 - j;
        end;
      85:
        begin
          implementationversionnamesubitem :=
            TImplementationVersionNameSubItem.Create;
          j := implementationversionnamesubitem.read(datainputstream, i2);
          addSubItem(implementationversionnamesubitem);
          j2 := j2 - j;
        end;
      86:
        begin
          extendednegotiationsubitem := TExtendedNegotiationSubItem.Create;
          j := extendednegotiationsubitem.read(datainputstream, i2);
          addSubItem(extendednegotiationsubitem);
          j2 := j2 - j;
        end
    else
      begin
        //        datainputstream.readInt8;
        datainputstream.readInt8;
        j := datainputstream.readInt16;
        datainputstream.ReadSkipbytes(j);
        j2 := j2 - j - 4;
        c := c + j + 4;
      end;
    end;
  end;
  result := 4 + i;
end;

destructor TAbortPdu.Destroy;
begin
  //  if assigned(FAbort) then
  //    FAbort.Free;
  inherited Destroy;
end;

constructor TAbortPdu.Create;
begin
  FItemType := 7;
  //  FAbort := nil;
end;

constructor TAbortPdu.Create(i: Integer; j: Integer);
begin
  FItemType := 7;
  FSource := i;
  FReason := j;
  //  FAbort := nil;
end;

function TAbortPdu.getAbort: TDicomAbort;
begin
  //  if assigned(FAbort) then
  //    FAbort.Free;
  //  FAbort := TDicomAbort.Create(FSource, FReason);
  Result := TDicomAbort.Create(FSource, FReason);
end;

procedure TAbortPdu.read(inputstream: TDicomIOStream; AItemType: Integer);
var
  i: Integer;
begin
  //  i := inputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise Exception.Create('PDU-type field of Abort PDU not ' +
      IntToStr(FItemType));
  end
  else
  begin
    inputstream.readInt8;
    inputstream.ReadInt32;
    inputstream.readInt8;
    FSource := inputstream.readInt8;
    FReason := inputstream.readInt8;
  end;
end;

procedure TAbortPdu.write(outputstream: TDicomIOStream);
begin
  outputstream.writeInt8(FItemType);
  outputstream.writeInt8(0);
  outputstream.writeInt32(4);
  outputstream.writeInt8(0);
  outputstream.writeInt8(0);
  outputstream.writeInt8(FSource);
  outputstream.writeInt8(FReason);
  outputstream.FreshData;
end;

destructor TAssociateRejectPdu.Destroy;
begin
  if assigned(FReject) then
    FReject.Free;
  inherited Destroy;
end;

constructor TAssociateRejectPdu.Create;
begin
  FItemType := 3;
  FReject := nil;
end;

constructor TAssociateRejectPdu.Create(i: Integer; j: Integer; k: Integer);
begin
  FReject := nil;
  FItemType := 3;
  FSource := i;
  FReason := j;
  FResult := k;
end;

function TAssociateRejectPdu.getReject: TDicomReject;
begin
  if assigned(FReject) then
    FReject.Free;
  //  FReject := TDicomReject.Create(FSource, FReason, FResult);
  Result := TDicomReject.Create(FSource, FReason, FResult);
end;

procedure TAssociateRejectPdu.read(inputstream: TDicomIOStream; AItemType:
  Integer);
var
  i: Integer;
begin
  //  i := inputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise Exception.Create('PDU-type field of Associate Reject PDU not ' +
      IntToStr(FItemType)) {IllegalValueException};
  end
  else
  begin
    inputstream.readint8;
    inputstream.readInt32;
    inputstream.readInt8;
    FSource := inputstream.readInt8;
    FReason := inputstream.readInt8;
    FResult := inputstream.readInt8;
  end;
end;

procedure TAssociateRejectPdu.write(outputstream: TDicomIOStream
  {OutputStream});
begin
  outputstream.writeInt8(FItemType);
  outputstream.writeInt8(0);
  outputstream.writeInt32(4);
  outputstream.writeInt8(0);
  outputstream.writeInt8(FSource);
  outputstream.writeInt8(FReason);
  outputstream.writeInt8(FResult);
  outputstream.FreshData;
end;

function TPresentationContextResponseItem.getResult: Integer;
begin
  Result := Fresult;
end;

function TPresentationContextResponseItem.getID: Integer;
begin
  Result := FID;
end;

destructor TPresentationContextResponseItem.Destroy;
begin
  if assigned(e) then
    e.Free;
  inherited Destroy;
end;

constructor TPresentationContextResponseItem.Create;
begin
  FItemType := 33;
  e := TTransferSyntaxItem.Create;
end;

constructor TPresentationContextResponseItem.Create(i: Integer; j: Integer;
  transfersyntaxitem: TTransferSyntaxItem);
begin
  FItemType := 33;
  FID := i;
  FResult := j;
  e := transfersyntaxitem;
  FLength := 4;
  if transfersyntaxitem <> nil then
  begin
    FLength := FLength + transfersyntaxitem.getLength;
  end;
end;

function TPresentationContextResponseItem.getTransferSyntax: TUIDEntry;
begin
  result := e.getTransferSyntax;
end;

function TPresentationContextResponseItem.getLength: Integer;
begin
  result := FLength + 4;
end;

procedure TPresentationContextResponseItem.write(dataoutputstream:
  TDicomIOStream);
begin
  dataoutputstream.writeint8(FItemType);
  dataoutputstream.writeint8(0);
  dataoutputstream.writeInt16(FLength);
  dataoutputstream.writeint8(FID);
  dataoutputstream.writeint8(0);
  dataoutputstream.writeint8(FResult);
  dataoutputstream.writeint8(0);
  if e <> nil then
  begin
    e.Write(dataoutputstream);
  end;
end;

procedure TPresentationContextResponseItem.read(datainputstream:
  TDicomIOStream; AItemType: Integer);
var
  i: Integer;
begin
  //i := datainputstream.readInt8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise
      Exception.Create('itemtype field of received Presentation Context Item  not '
      + IntToStr(FItemType)) {IllegalValueException};
  end;
  datainputstream.readskipbytes(1);
  FLength := datainputstream.readInt16;
  FID := datainputstream.readInt8;
  datainputstream.readskipbytes(1);
  FResult := datainputstream.readint8;
  datainputstream.readskipbytes(1);
  if FResult = 0 then
  begin
    e.Read(datainputstream);
  end
  else
  begin
    datainputstream.readskipbytes(FLength - 4);
  end;
end;

destructor TAcknowledge.Destroy;
var
  i: integer;
begin

  FScuScpRoleSelections.Free;
  FTransferSyntaxs.Free;
  for i := 0 to FResultList.Count - 1 do
    Dispose(FResultList[i]);
  FResultList.Clear;
  FResultList.Free;
  for i := 0 to FPresentationContexts.Count - 1 do
    Dispose(FPresentationContexts[i]);
  FPresentationContexts.Clear;
  FPresentationContexts.Free;
  ix.Free;
  FScuRoleList.Free;
  FScpRoleList.Free;
  inherited Destroy;
end;

constructor TAcknowledge.Create;
begin
  FMaxPduSize := 16384;
  FMaxOperationsInvoked := 1;
  FMaxOperationsPerformed := 1;
  FScuScpRoleSelections := TList.Create;
  FTransferSyntaxs := TList.Create;
  FResultList := TList.Create;
  FPresentationContexts := TList.Create;

  ix := TList.Create;
  FScuRoleList := TList.Create;
  FScpRoleList := TList.Create;
  FImplementationClassUID := '1.2.826.0.1.3680043.1.1.4.1.26.0';
  FImplementationVersionName := 'CNS_Soft_1_000';
end;

function TAcknowledge.MyGetTransferSyntax( p_n:integer ) : TUIDEntry;
begin
  Result := FTransferSyntaxs[ p_n ];
end;

function TAcknowledge.GetTransferSyntaxCount:Integer;
begin
  Result := FTransferSyntaxs.Count;
end;

function TAcknowledge.isPrivateApplicationContext: Boolean;
begin
  result := not isPrivate(FApplicationContextUid);
end;

procedure TAcknowledge.setScuScpRoleSelection(i1: Integer; j1: Integer; k1:
  Integer);
var
  uidentry: TUIDEntry;
  l1: Integer;
  p1: Pinteger;
begin
  uidentry := UIDS.ItemByConstant[i1];
  l1 := FScuScpRoleSelections.IndexOf(uidentry);
  if l1 <> -1 then
  begin
    PInteger(FScuRoleList[l1])^ := j1;
    PInteger(FScpRoleList[l1])^ := k1;
  end
  else
  begin
    FScuScpRoleSelections.add(uidentry);
    new(p1);
    p1^ := j1;
    FScuRoleList.add(p1);
    new(p1);
    p1^ := k1;
    FScpRoleList.add(p1);
  end;
end;

function TAcknowledge.getScuRole(i1: Integer): Integer;
begin
  result := getScuRole(UIDS.ItemByConstant[i1]);
end;

function TAcknowledge.getScuRole(uidentry: TUIDEntry): Integer;
var
  i1: Integer;
begin
  i1 := FScuScpRoleSelections.IndexOf(uidentry);
  if i1 = -1 then
  begin
    result := -1;
  end
  else
  begin
    result := PInteger(FScuRoleList[i1])^;
  end;
end;

function TAcknowledge.getScpRole(i1: Integer): Integer;
begin
  result := getScpRole(UIDS.ItemByConstant[i1]);
end;

function TAcknowledge.getScpRole(uidentry: TUIDEntry): Integer;
var
  i1: Integer;
begin
  i1 := FScuScpRoleSelections.IndexOf(uidentry);
  if i1 = -1 then
  begin
    result := -1;
  end
  else
  begin
    result := PInteger(FScpRoleList[i1])^;
  end;
end;

function TAcknowledge.ScuScpRoleSelection(i1: Integer): TUIDEntry;
begin
  result := TUIDEntry(FScuScpRoleSelections[i1]);
end;

function TAcknowledge.ScuScpRoleSelectionCount: Integer;
begin
  result := FScuScpRoleSelections.Count;
end;

function TAcknowledge.getPresentationContextID(i1: Integer): ShortInt;
begin
  result := PByte(FPresentationContexts[i1])^;
end;

function TAcknowledge.getResult(i1: Integer): Integer;
begin
  result := PInteger(FResultList[i1])^;
end;

function TAcknowledge.getPresentationContexts: Integer;
begin
  result := FPresentationContexts.Count;
end;

function TAcknowledge.getTransferSyntax(i1: Integer): TUIDEntry;
begin
  result := TUIDEntry(FTransferSyntaxs[i1]);
end;

procedure TAcknowledge.addPresentationContext(byte0: ShortInt; i1: Integer; j1:
  Integer);
var
  uidentry: TUIDEntry;
  pb1: PByte;
  p1: PInteger;
begin
  uidentry := UIDS.ItemByConstant[j1];
  New(pb1);
  pb1^ := Byte0;
  FPresentationContexts.add(pb1);
  new(p1);
  p1^ := i1;
  FResultList.add(p1);
  FTransferSyntaxs.add(uidentry);
end;

function TAcknowledge.getText: AnsiString;
var
  s: AnsiString;
  i1: Integer;
  uidentry: TUIDEntry;
  j1: Integer;
begin
  s := '*** acknowledge ***'#13#10;
  s := s + 'max pdu size: ' + IntToStr(FMaxPduSize) + #13#10;
  s := s + 'max operation invoked: ' + IntToStr(FMaxOperationsInvoked) + #13#10;
  s := s + 'max operation performed: ' + IntToStr(FMaxOperationsPerformed) + #13#10;
  s := s + 'implementation class UID: ' + FImplementationClassUID + #13#10;
  s := s + 'implementation version name: ' + FImplementationVersionName + #13#10;

  s := s + 'ApplicationContextUid: ' + FApplicationContextUid + #13#10;
  s := s + 'CalledTitle: ' + FCalledTitle + #13#10;
  s := s + 'CallingTitle: ' + FCallingTitle + #13#10;

  s := s + fstr('abstract syntax', 32) + fstr('scu', 4) + fstr('scp', 4) + #13#10;
  //  s := s + 'abstract syntax'#9'scu'#9'scp' + #13#10;
  i1 := 0;
  while i1 < ScuScpRoleSelectionCount do
  begin
    uidentry := ScuScpRoleSelection(i1);
    s := s + fstr(uidentry.Value, 32) + fstr(getScuRole(uidentry), 4) +
      fstr(getScpRole(uidentry), 4) + #13#10;
    Inc(i1);
  end;
  s := s + fstr('nr', 5) + fstr('pcid', 6) + fstr('result', 32) +
    fstr('transfer syntax', 20) + #13#10;
  j1 := 0;
  while j1 < getPresentationContexts do
  begin
    case getResult(j1) of
      0:
        begin
          s := s + fstr(j1, 5) + fstr(getPresentationContextID(j1), 6) +
            fstr('accepted', 32) + fstr(getTransferSyntax(j1).Value, 20) +
            #13#10;
        end;
      3:
        begin
          s := s + fstr(j1, 5) + fstr(getPresentationContextID(j1), 6) +
            fstr('unsupported abstract syntax', 32) + #13#10;
        end;
      4:
        begin
          s := s + fstr(j1, 5) + fstr(getPresentationContextID(j1), 6) +
            fstr('unsupported transfer syntaxes', 32) + #13#10;
        end;
      1:
        begin
          s := s + fstr(j1, 5) + fstr(getPresentationContextID(j1), 6) +
            fstr('user rejection', 32) + #13#10;
        end;
      2:
        begin
          s := s + fstr(j1, 5) + fstr(getPresentationContextID(j1), 6) +
            fstr('no reason', 32) + #13#10;
        end;
    end;
    Inc(j1);
  end;
  s := s + '*******************';
  result := s;
end;

function TAcknowledge.indexOf(byte0: ShortInt): Integer;
var
  I: Integer;
begin
  for I := 0 to FPresentationContexts.Count - 1 do // Iterate
  begin
    if PShortInt(FPresentationContexts[i])^ = byte0 then
    begin
      Result := i;
      exit;
    end;
  end;
  result := -1;
end;

destructor TRequest.Destroy;
var
  i: Integer;
begin
  FAbstractSyntaxs.Free;

  for i := 0 to FTransferSyntaxes.Count - 1 do
    TList(FTransferSyntaxes[i]).Free;
  FTransferSyntaxes.Clear;
  FTransferSyntaxes.Free;

  for i := 0 to FPresentationContexts.Count - 1 do
    Dispose(FPresentationContexts[i]);
  FPresentationContexts.Clear;
  FPresentationContexts.Free;

  FScuScpRoleSelections.Free;

  for i := 0 to FScpRoleList.Count - 1 do
    Dispose(FScpRoleList[i]);
  FScpRoleList.Clear;
  FScpRoleList.Free;

  for i := 0 to FScuRoleList.Count - 1 do
    Dispose(FScuRoleList[i]);
  FScuRoleList.Clear;
  FScuRoleList.Free;
  FExtendedNegotiationDataList.Free;
  inherited Destroy;
end;

constructor TRequest.Create;
begin
  inherited Create;
  FMaxPDUSize := 16384;
  FMaxOperationsInvoked := 1;
  FMaxOperationsPerformed := 1;
  FAbstractSyntaxs := TList.Create;
  FTransferSyntaxes := TList.Create;
  FPresentationContexts := TList.Create;
  FScuScpRoleSelections := TList.Create;
  FScpRoleList := TList.Create;
  FScuRoleList := TList.Create;
  FExtendedNegotiationDataList := TList.Create;
  FImplementationClassUID := '1.2.826.0.1.3680043.1.1.4.1.26.0';
  FImplementationVersionName := 'CNS_Soft_1_000';
end;

function TRequest.isPrivateApplicationContext: Boolean;
begin
  result := not isPrivate(ApplicationContextUid);
end;

function TRequest.getScuRole(i1: Integer): Integer;
begin
  result := getScuRole(UIDS.ItemByConstant[i1]);
end;

function TRequest.getScuRole(uidentry: TUIDEntry): Integer;
var
  i1: Integer;
begin
  i1 := FScuScpRoleSelections.IndexOf(uidentry);
  if i1 = -1 then
  begin
    result := -1;
  end
  else
  begin
    result := PInteger(FScuRoleList[i1])^;
  end;
end;

function TRequest.getAbstractSyntaxForRole(i1: Integer): TUIDEntry;
begin
  result := TUIDEntry(FScuScpRoleSelections[i1]);
end;

function TRequest.getRoles: Integer;
begin
  result := FScuScpRoleSelections.Count;
end;

function TRequest.getScpRole(i1: Integer): Integer;
begin
  result := getScpRole(UIDS.ItemByConstant[i1]);
end;

function TRequest.getScpRole(uidentry: TUIDEntry): Integer;
var
  i1: Integer;
begin
  i1 := FScuScpRoleSelections.IndexOf(uidentry);
  if i1 = -1 then
  begin
    result := -1;
  end
  else
  begin
    result := PInteger(FScuRoleList[i1])^;
  end;
end;

function TRequest.getPresentationContextID(i1: Integer): ShortInt;
begin
  result := PByte(FPresentationContexts[i1])^;
end;

function TRequest.getPresentationContexts: Integer;
begin
  result := FPresentationContexts.Count;
end;

function TRequest.getAbstractSyntax(i1: Integer): TUIDEntry;
begin
  result := TUIDEntry(FAbstractSyntaxs[i1]);
end;

function TRequest.getTransferSyntaxes(i1: Integer): Integer;
begin
  result := TList(FTransferSyntaxes[i1]).Count;
end;

function TRequest.getTransferSyntax(i1: Integer; j1: Integer): TUIDEntry;
begin
  result := TUIDEntry(TList(FTransferSyntaxes[i1])[j1]);
end;

function TRequest.getExtendedNegotiationData(i1: Integer): Ansistring;
begin //ToDo
  if i1 < FExtendedNegotiationDataList.Count then
    result := StrPas(PAnsiChar(FExtendedNegotiationDataList[i1]))
  else
    Result := '';
end;

function TRequest.addPresentationContext(i1: Integer; ai: TDCMIntegerArray):
  ShortInt;
var
  byte0: ShortInt;
begin
  byte0 := ShortInt((2 * FAbstractSyntaxs.Count + 1));
  F_a(byte0, i1, ai);
  result := byte0;
end;

procedure TRequest.F_a(byte0: ShortInt; i1: Integer; ai: TDCMIntegerArray);
var
  uidentry: TUIDEntry;
  auidentry: TUIDEntryArray;
  j1: Integer;
begin
  uidentry := UIDS.ItemByConstant[i1];
  SetLength(auidentry, length(ai)) {UIDEntry[ai.length]};
  j1 := 0;
  while j1 < length(ai) do
  begin
    auidentry[j1] := UIDS.ItemByConstant[ai[j1]];
    Inc(j1);
  end;
  F_a(byte0, uidentry, auidentry);
end;

procedure TRequest.F_a(byte0: ShortInt; uidentry: TUIDEntry; auidentry:
  TUIDEntryArray);
var
  vector: TList;
  i1: Integer;
  p1: PInteger;
  b1: PByte;
begin
  FAbstractSyntaxs.add(uidentry);
  FScuScpRoleSelections.add(uidentry);
  new(p1);
  p1^ := -1;
  FScpRoleList.add(p1);
  new(p1);
  p1^ := -1;
  FScuRoleList.add(p1);
  //  i.add(nil);
  new(b1);
  b1^ := byte0;
  FPresentationContexts.add(b1);
  vector := TList.Create;
  i1 := 0;
  while i1 < length(auidentry) do
  begin
    vector.add(auidentry[i1]);
    Inc(i1);
  end;
  FTransferSyntaxes.add(vector);
end;

procedure TRequest.F_a(uidentry: TUIDEntry; i1: Integer; j1: Integer);
var
  k1: Integer;
begin
  k1 := FAbstractSyntaxs.IndexOf(uidentry);
  if k1 <> -1 then
  begin
    PInteger(FScpRoleList[k1])^ := i1;
    PInteger(FScuRoleList[k1])^ := j1;
  end;
end;

procedure TRequest.setExtendedNegotiationData(i1: Integer; abyte0: AnsiString);
begin //ToDo
  FExtendedNegotiationDataList[i1] := pAnsiChar(abyte0);
end;

procedure TRequest.setScuScpRoleSelection(i1: Integer; j1: Integer; k1:
  Integer);
var
  uidentry: TUIDEntry;
  l1: Integer;
  p1: PInteger;
begin
  uidentry := UIDS.ItemByConstant[i1];
  l1 := FScuScpRoleSelections.IndexOf(uidentry);
  if l1 <> -1 then
  begin
    PInteger(FScpRoleList[l1])^ := j1;
    PInteger(FScuRoleList[l1])^ := k1;
  end
  else
  begin
    FScuScpRoleSelections.add(uidentry);
    new(p1);
    p1^ := j1;
    FScuRoleList.add(p1);
    new(p1);
    p1^ := k1;
    FScpRoleList.add(p1);
  end;
end;

function TRequest.GetText: AnsiString;
var
  s: AnsiString;
  i1: Integer;
  uidentry: TUIDEntry;
  j1: Integer;
  uidentry1: TUIDEntry;
  k1: Integer;
  l1: Integer;
  uidentry2: TUIDEntry;
begin
  s := '*** request ***'#13#10'';
  s := s + 'application context UID: ' + FApplicationContextUid + #13#10;
  s := s + 'called title: ' + calledtitle + #13#10;
  s := s + 'calling title: ' + callingtitle + #13#10;
  s := s + 'max pdu size: ' + IntToStr(MaxPDUSize) + #13#10;
  s := s + 'max operation invoked: ' + IntToStr(maxoperationsinvoked) + #13#10;
  s := s + 'max operation performed: ' + IntToStr(maxoperationsperformed) +
    #13#10;
  s := s + 'implementation class UID: ' + implementationclassUID + #13#10;
  s := s + 'implementation version Name: ' + implementationversionName + #13#10;
  s := s + fstr('abstract syntax', 32) + fstr('scu', 4) + fstr('scp', 4) +
    #13#10;
  i1 := 0;
  while i1 < getRoles do
  begin
    uidentry := getAbstractSyntaxForRole(i1);
    s := s + fstr(uidentry.Value, 32) + fstr(getScuRole(uidentry), 4) +
      fstr(getScpRole(uidentry), 4) + #13#10;
    Inc(i1);
  end;
  s := s + fstr('nr', 5) + fstr('abstract syntax', 32) + fstr('pcid', 6) +
    fstr('description', 55) + #13#10;
  j1 := 0;
  while j1 < getPresentationContexts do
  begin
    uidentry1 := getAbstractSyntax(j1);
    s := s + fstr(j1, 5) + fstr(uidentry1.Value, 32) +
      fstr(getPresentationContextID(j1), 6) + fstr(uidentry1.Name, 55) + #13#10;
    k1 := getTransferSyntaxes(j1);
    l1 := 0;
    while l1 < k1 do
    begin
      uidentry2 := getTransferSyntax(j1, l1);
      s := s + 'ts-' + fstr(l1, 2) + fstr(uidentry2.Value, 32) +
        fstr(uidentry2.Name, 55) + #13#10;
      Inc(l1);
    end;
    Inc(j1);
  end;
  s := s + '***************';
  result := s;
end;
//ToDo
{function TRequest.indexOf(byte0: ShortInt): Integer;
begin
//  result := Pos(d, Byte.Create(byte0));
end; //end of indexOf(byte0:ShortInt)
}

destructor TAssociateAcknowledgePdu.Destroy;
var
  i: integer;
begin
  for i := 0 to FPresentationContextResponseItems.Count - 1 do
    TPresentationContextResponseItem(FPresentationContextResponseItems[i]).Free;
  FPresentationContextResponseItems.Clear;
  FPresentationContextResponseItems.Free;
  if assigned(FApplicationContextItem) then
    FApplicationContextItem.Free;
  if assigned(FUserInfoItem) then
    FUserInfoItem.Free;
  //  if assigned(FPresentationContextResponseItem) then
  //    FPresentationContextResponseItem.Free;
    //  if assigned(FAcknowledge) then
    //    FAcknowledge.Free;
  inherited Destroy;
end;

constructor TAssociateAcknowledgePdu.Create;
begin
  FItemType := 2;
  FPresentationContextResponseItems := TList.Create;
end;

constructor TAssociateAcknowledgePdu.Create(acknowledge: TAcknowledge);
var
  k: Integer;
  uidentry: TUIDEntry;
  implementationclassuidsubitem: TImplementationClassUIDSubItem;
  implementationversionnamesubitem: TImplementationVersionNameSubItem;
  maximumlengthsubitem: TMaximumLengthSubItem;
  j1: Integer;
  uidentry1: TUIDEntry;
  l: Integer;
  i1: Integer;
  scuscprolesubitem: TScuScpRoleSubItem;
  asynchronousoperationswindowsubitem: TAsynchronousOperationsWindowSubItem;
  k1: Integer;
begin
  FItemType := 2;
  FCalledTitle := acknowledge.CalledTitle;
  FCallingTitle := acknowledge.CallingTitle;
  FApplicationContextItem := TApplicationContextItem.Create;
  FPresentationContextResponseItems := TList.Create;
  k := 0;
  while k < acknowledge.getPresentationContexts do
  begin
    uidentry := acknowledge.getTransferSyntax(k);
    if uidentry = nil then
    begin
      FPresentationContextResponseItem :=
        TPresentationContextResponseItem.Create(acknowledge.getPresentationContextID(k),
        acknowledge.getResult(k), nil);
    end
    else
    begin
      FPresentationContextResponseItem :=
        TPresentationContextResponseItem.Create(acknowledge.getPresentationContextID(k),
        acknowledge.getResult(k), TTransferSyntaxItem.Create(uidentry));
    end;
    FPresentationContextResponseItems.add(FPresentationContextResponseItem);
    Inc(k);
  end;
  FUserInfoItem := TUserInfoItem.Create;
  implementationclassuidsubitem :=
    TImplementationClassUIDSubItem.Create(acknowledge.ImplementationClassUID);
  implementationversionnamesubitem :=
    TImplementationVersionNameSubItem.Create(acknowledge.ImplementationVersionName);
  maximumlengthsubitem := TMaximumLengthSubItem.Create(acknowledge.MaxPduSize);
  FUserInfoItem.addSubItem(maximumlengthsubitem);
  FUserInfoItem.addSubItem(implementationclassuidsubitem);
  FUserInfoItem.addSubItem(implementationversionnamesubitem);
  j1 := 0;
  while j1 < acknowledge.ScuScpRoleSelectionCount do
  begin
    uidentry1 := acknowledge.ScuScpRoleSelection(j1);
    l := acknowledge.getScuRole(uidentry1.Constant);
    i1 := acknowledge.getScpRole(uidentry1.Constant);
    if (l <> -1) and (i1 <> -1) then
    begin
      scuscprolesubitem := TScuScpRoleSubItem.Create(uidentry1, l, i1);
      FUserInfoItem.addSubItem(scuscprolesubitem);
    end;
    Inc(j1);
  end;
  if (acknowledge.MaxOperationsInvoked <> 1) or
    (acknowledge.MaxOperationsPerformed <> 1) then
  begin
    asynchronousoperationswindowsubitem :=
      TAsynchronousOperationsWindowSubItem.Create;
    asynchronousoperationswindowsubitem.MaxOperationsInvoked :=
      acknowledge.MaxOperationsInvoked;
    asynchronousoperationswindowsubitem.MaxOperationsPerformed :=
      acknowledge.MaxOperationsPerformed;
    FUserInfoItem.addSubItem(asynchronousoperationswindowsubitem);
  end;
  FLength := 68;
  FLength := FLength + FApplicationContextItem.DataLength;
  k1 := 0;
  while k1 < FPresentationContextResponseItems.Count do
  begin
    FLength := FLength +
      (TPresentationContextResponseItem(FPresentationContextResponseItems[k1])).getLength;
    Inc(k1);
  end;
  FLength := FLength + FUserInfoItem.getLength;
end;

function TAssociateAcknowledgePdu.getAcknowledge: TAcknowledge;
begin
  result := FAcknowledge;
end;

procedure TAssociateAcknowledgePdu.CreateAcknowledge;
var
  vector: TList;
  k: Integer;
  presentationcontextresponseitem: TPresentationContextResponseItem;
  l: Integer;
  subitem: TSubItem;
  scuscprolesubitem: TScuScpRoleSubItem;
  asynchronousoperationswindowsubitem: TAsynchronousOperationsWindowSubItem;
begin
  FAcknowledge := TAcknowledge.Create;
  FAcknowledge.CalledTitle := FCalledTitle;
  FAcknowledge.CallingTitle := FCallingTitle;
  FAcknowledge.ApplicationContextUid := FApplicationContextItem.getUid;
  k := 0;
  while k < FPresentationContextResponseItems.Count do
  begin
    presentationcontextresponseitem :=
      TPresentationContextResponseItem(FPresentationContextResponseItems[k]);
    if presentationcontextresponseitem.getResult = 0 then
    begin
      FAcknowledge.addPresentationContext(ShortInt(presentationcontextresponseitem.getID),
        presentationcontextresponseitem.getResult,
        presentationcontextresponseitem.getTransferSyntax.Constant);
    end
    else
    begin
      FAcknowledge.addPresentationContext(ShortInt(presentationcontextresponseitem.getID),
        presentationcontextresponseitem.getResult, 8193);
    end;
    Inc(k);
  end;
  l := 0;
  if FUserInfoItem<>nil then
  begin
    vector := FUserInfoItem.getSubItems;
    while l < vector.Count do
    begin
      subitem := TSubItem(vector[l]);
      if subitem is TImplementationClassUIDSubItem then
      begin
        FAcknowledge.ImplementationClassUID :=
          (TImplementationClassUIDSubItem(subitem)).ImplementationClassUID;
      end
      else
      begin
        if subitem is TImplementationVersionNameSubItem then
        begin
          FAcknowledge.ImplementationVersionName :=
            (TImplementationVersionNameSubItem(subitem)).ImplementationVersionName;
        end
        else
        begin
          if subitem is TMaximumLengthSubItem then
          begin
            FAcknowledge.MaxPduSize :=
              (TMaximumLengthSubItem(subitem)).MaxPduSize;
          end
          else
          begin
            if subitem is TScuScpRoleSubItem then
            begin
              scuscprolesubitem := TScuScpRoleSubItem(subitem);
              FAcknowledge.setScuScpRoleSelection(scuscprolesubitem.AbstractSyntax.Constant,
                scuscprolesubitem.ScuRole, scuscprolesubitem.ScpRole);
            end
            else
            begin
              if subitem is TAsynchronousOperationsWindowSubItem then
              begin
                asynchronousoperationswindowsubitem :=
                  TAsynchronousOperationsWindowSubItem(subitem);
                FAcknowledge.MaxOperationsInvoked :=
                  asynchronousoperationswindowsubitem.MaxOperationsInvoked;
                FAcknowledge.MaxOperationsPerformed :=
                  asynchronousoperationswindowsubitem.MaxOperationsPerformed;
              end;
            end;
          end;
        end;
      end;
      Inc(l);
    end;
  end;
end;

function TAssociateAcknowledgePdu.getLength: Integer;
begin
  result := FLength + 6;
end;

function TAssociateAcknowledgePdu.getPresentationContextResponseItems: TList;
begin
  result := FPresentationContextResponseItems;
end;

procedure TAssociateAcknowledgePdu.write(outputstream: TDicomIOStream);
var
  k: Integer;
  l: Integer;
  i1: Integer;
  presentationcontextresponseitem: TPresentationContextResponseItem;
begin
  outputstream.writeInt8(FItemType);
  outputstream.writeInt8(0);
  outputstream.writeInt32(getLength - 6);
  outputstream.writeInt16(1);
  outputstream.writeInt16(0);
  outputstream.writeString(FCalledTitle);
  k := 0;
  while k < 16 - Length(FCalledTitle) do
  begin
    outputstream.writeint8(32);
    Inc(k);
  end;
  outputstream.writestring(FCallingTitle);
  l := 0;
  while l < 16 - Length(FCallingTitle) do
  begin
    outputstream.writeint8(32);
    Inc(l);
  end;
  outputstream.WriteSkipBytes(32);
  FApplicationContextItem.Write(outputstream);
  i1 := 0;
  while i1 < FPresentationContextResponseItems.Count do
  begin
    presentationcontextresponseitem :=
      TPresentationContextResponseItem(FPresentationContextResponseItems[i1]);
    presentationcontextresponseitem.write(outputstream);
    Inc(i1);
  end;
  FUserInfoItem.write(outputstream);
  outputstream.FreshData;
end;

procedure TAssociateAcknowledgePdu.read(inputstream: TDicomIOStream;
  AItemType: Integer);
var
  k: Integer;
  l: Integer;
  i1: Integer;
begin
  //  k := inputstream.readInt8;
  k := AItemType;
  if k <> FItemType then
  begin
    raise Exception.Create('PDU-type field of Associate Acknowledge PDU not ' +
      IntToStr(FItemType)) {IllegalValueException};
  end;
  inputstream.readInt8;
  FLength := inputstream.readInt32;
  inputstream.readInt16;
  FLength := FLength - 2;

  inputstream.readInt16;
  FCalledTitle := inputstream.readString(16);
  FCalledTitle := Trim(FCalledTitle);
  FCallingTitle := inputstream.readString(16);
  FCallingTitle := Trim(FCallingTitle);
  inputstream.readskipBytes(32);

  FLength := FLength - 66;
  FApplicationContextItem := TApplicationContextItem.Create;
  FLength := FLength - FApplicationContextItem.read(inputstream);
  while FLength > 0 do
  begin
    l := inputstream.readint8;
    if l = 33 then
    begin
      FPresentationContextResponseItem :=
        TPresentationContextResponseItem.Create;
      FPresentationContextResponseItem.read(inputstream, l);
      FPresentationContextResponseItems.add(FPresentationContextResponseItem);
      FLength := FLength - FPresentationContextResponseItem.getLength;
    end
    else
    if l = 80 then
    begin
      FUserInfoItem := TUserInfoItem.Create;
      i1 := FUserInfoItem.read(inputstream, l);
      FLength := FLength - i1;
    end else
      Break;
  end;
  CreateAcknowledge;
end;

destructor TAssociateRequestPdu.Destroy;
var
  i: integer;
begin
  if assigned(FApplicationContextItem) then
    FApplicationContextItem.Free;
  if assigned(FUserInfoItem) then
    FUserInfoItem.Free;
  for i := 0 to FPresentationContextItems.Count - 1 do
    TPresentationContextItem(FPresentationContextItems[i]).Free;
  FPresentationContextItems.Free;
  inherited Destroy;
end;

constructor TAssociateRequestPdu.Create;
begin
  FItemType := 1;
  FProtocalVersion := 1;
  FPresentationContextItems := TList.Create;
end;

constructor TAssociateRequestPdu.Create(request: TRequest);
var
  i: Integer;
  uidentry: TUIDEntry;
  abstractsyntaxitem: TAbstractSyntaxItem;
  vector: TList;
  j: Integer;
  presentationcontextitem: TPresentationContextItem;
  implementationclassuidsubitem: TImplementationClassUIDSubItem;
  implementationversionnamesubitem: TImplementationVersionNameSubItem;
  maximumlengthsubitem: TMaximumLengthSubItem;
  i1: Integer;
  uidentry1: TUIDEntry;
  k: Integer;
  l: Integer;
  scuscprolesubitem: TScuScpRoleSubItem;
  j1: Integer;
  abyte0: AnsiString;
  uidentry2: TUIDEntry;
  extendednegotiationsubitem: TExtendedNegotiationSubItem;
  asynchronousoperationswindowsubitem: TAsynchronousOperationsWindowSubItem;
begin
  FItemType := 1;
  FProtocalVersion := 1;
  FRequest := request;
  FCalledTitle := request.CalledTitle;
  FCallingTitle := request.CallingTitle;
  FPresentationContextItems := TList.Create;
  FApplicationContextItem := TApplicationContextItem.Create;
  i := 0;
  while i < request.getPresentationContexts do
  begin
    uidentry := request.getAbstractSyntax(i);
    abstractsyntaxitem := TAbstractSyntaxItem.Create(uidentry);
    vector := TList.Create;
    j := 0;
    while j < request.getTransferSyntaxes(i) do
    begin
      vector.add(TTransferSyntaxItem.Create(request.getTransferSyntax(i, j)));
      Inc(j);
    end;
    presentationcontextitem :=
      TPresentationContextItem.Create(request.getPresentationContextID(i),
      abstractsyntaxitem, vector);
    FPresentationContextItems.add(presentationcontextitem);
    Inc(i);
  end;
  FUserInfoItem := TUserInfoItem.Create;
  implementationclassuidsubitem :=
    TImplementationClassUIDSubItem.Create(request.ImplementationClassUID);
  implementationversionnamesubitem :=
    TImplementationVersionNameSubItem.Create(request.ImplementationVersionName);
  maximumlengthsubitem := TMaximumLengthSubItem.Create(request.MaxPduSize);
  FUserInfoItem.addSubItem(maximumlengthsubitem);
  FUserInfoItem.addSubItem(implementationclassuidsubitem);
  FUserInfoItem.addSubItem(implementationversionnamesubitem);
  i1 := 0;
  while i1 < request.getRoles do
  begin
    uidentry1 := request.getAbstractSyntaxForRole(i1);
    if uidentry1<>nil then
    begin
      k := request.getScuRole(uidentry1.Constant);
      l := request.getScpRole(uidentry1.Constant);
      if (k <> -1) and (l <> -1) then
      begin
        scuscprolesubitem := TScuScpRoleSubItem.Create(uidentry1, k, l);
        FUserInfoItem.addSubItem(scuscprolesubitem);
      end;
    end;
    Inc(i1);
  end;
  j1 := 0;
  while j1 < request.getPresentationContexts do
  begin
    abyte0 := request.getExtendedNegotiationData(j1);
    if abyte0 <> '' then
    begin
      uidentry2 := request.getAbstractSyntax(j1);
      extendednegotiationsubitem :=
        TExtendedNegotiationSubItem.Create(uidentry2, abyte0);
      FUserInfoItem.addSubItem(extendednegotiationsubitem);
    end;
    Inc(j1);
  end;
  if (request.MaxOperationsInvoked <> 1) or (request.MaxOperationsPerformed <> 1) then
  begin
    asynchronousoperationswindowsubitem :=
      TAsynchronousOperationsWindowSubItem.Create;
    asynchronousoperationswindowsubitem.MaxOperationsInvoked :=
      request.MaxOperationsInvoked;
    asynchronousoperationswindowsubitem.MaxOperationsPerformed :=
      request.MaxOperationsPerformed;
    FUserInfoItem.addSubItem(asynchronousoperationswindowsubitem);
  end;
end;

function TAssociateRequestPdu.getRequest: TRequest;
begin
  result := FRequest;
end;

procedure TAssociateRequestPdu.AssignToRequest;
var
  vector: TList;
  i: Integer;
  presentationcontextitem: TPresentationContextItem;
  vector1: TList;
  uidentry: TUIDEntry;
  auidentry: TUIDEntryArray;
  j: Integer;
  k: Integer;
  subitem: TSubItem;
  scuscprolesubitem: TScuScpRoleSubItem;
  asynchronousoperationswindowsubitem: TAsynchronousOperationsWindowSubItem;
  extendednegotiationsubitem: TExtendedNegotiationSubItem;
  uidentry1: TUIDEntry;
  l: Integer;
begin
  FRequest := TRequest.Create;
  FRequest.CalledTitle := FCalledTitle;
  FRequest.CallingTitle := FCallingTitle;
  FRequest.ApplicationContextUid := FApplicationContextItem.getUid;
  i := 0;
  while i < FPresentationContextItems.Count do
  begin
    presentationcontextitem :=
      TPresentationContextItem(FPresentationContextItems[i]);
    vector1 := presentationcontextitem.getTransferSyntaxes;
    uidentry := presentationcontextitem.getAbstractSyntaxItem.AbstractSyntax;
    SetLength(auidentry, vector1.Count) {UIDEntry[vector1.size]};
    j := 0;
    while j < vector1.Count do
    begin
      auidentry[j] := (TTransferSyntaxItem(vector1[j])).getTransferSyntax;
      Inc(j);
    end;
    FRequest.f_a(ShortInt(presentationcontextitem.getID), uidentry, auidentry);
    Inc(i);
  end;
  if assigned(FUserInfoItem) then
  begin
    vector := FUserInfoItem.getSubItems;
    k := 0;
    while k < vector.Count do
    begin
      subitem := TSubItem(vector[k]);
      if subitem is TImplementationClassUIDSubItem then
      begin
        FRequest.ImplementationClassUID :=
          TImplementationClassUIDSubItem(subitem).ImplementationClassUID;
      end
      else
        if subitem is TImplementationVersionNameSubItem then
      begin
        FRequest.ImplementationVersionName :=
          TImplementationVersionNameSubItem(subitem).ImplementationVersionName;
      end
      else
        if subitem is TMaximumLengthSubItem then
      begin
        FRequest.MaxPduSize := (TMaximumLengthSubItem(subitem)).MaxPduSize;
      end
      else
        if subitem is TScuScpRoleSubItem then
      begin
        scuscprolesubitem := TScuScpRoleSubItem(subitem);
        FRequest.f_a(scuscprolesubitem.AbstractSyntax,
          scuscprolesubitem.ScuRole, scuscprolesubitem.ScpRole);
      end
      else
        if subitem is TAsynchronousOperationsWindowSubItem then
      begin
        asynchronousoperationswindowsubitem :=
          TAsynchronousOperationsWindowSubItem(subitem);
        FRequest.MaxOperationsInvoked :=
          asynchronousoperationswindowsubitem.MaxOperationsInvoked;
        FRequest.MaxOperationsPerformed :=
          asynchronousoperationswindowsubitem.MaxOperationsPerformed;
      end
      else
        if subitem is TExtendedNegotiationSubItem then
      begin
        extendednegotiationsubitem := TExtendedNegotiationSubItem(subitem);
        uidentry1 := extendednegotiationsubitem.getUIDEntry;
        l := 0;
        while l < FRequest.getPresentationContexts do
        begin
          if FRequest.getAbstractSyntax(l).Value = uidentry1.Value then
          begin
            //ToDo
            FRequest.setExtendedNegotiationData(l, extendednegotiationsubitem.ApplicationInfo);
          end;
          Inc(l);
        end;
      end;
      Inc(k);
    end;
  end;
end;

function TAssociateRequestPdu.getApplicationContextItem:
  TApplicationContextItem;
begin
  result := FApplicationContextItem;
end;

function TAssociateRequestPdu.getPresentationContextItems: TList;
begin
  result := FPresentationContextItems;
end;

function TAssociateRequestPdu.getUserInfoItem: TUserInfoItem;
begin
  result := FUserInfoItem;
end;

procedure TAssociateRequestPdu.setApplicationContextItem(applicationcontextitem:
  TApplicationContextItem);
begin
  FApplicationContextItem := applicationcontextitem;
end;

procedure TAssociateRequestPdu.setUserInfoItem(userinfoitem: TUserInfoItem);
begin
  FUserInfoItem := userinfoitem;
end;

procedure TAssociateRequestPdu.addPresentationContextItem(presentationcontextitem:
  TPresentationContextItem);
begin
  FPresentationContextItems.add(presentationcontextitem);
end;

function TAssociateRequestPdu.getLength: Integer;
var
  i: Integer;
  j: Integer;
begin
  i := 0;
  i := i + 74; //Add from the after centance
  i := (i) + FApplicationContextItem.DataLength;
  j := 0;
  while j < FPresentationContextItems.Count do
  begin
    i := i + (TPresentationContextItem(FPresentationContextItems[j])).getLength
      + 4;
    Inc(j);
  end;
  i := i + FUserInfoItem.getLength;
  result := i;
end;

procedure TAssociateRequestPdu.write(dataoutputstream: TDicomIOStream);
var
  i: Integer;
  j: Integer;
  k: Integer;
begin
  dataoutputstream.writeInt8(FItemType);
  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt32(getLength - 6);
  dataoutputstream.writeInt16(FProtocalVersion); //protocal version
  dataoutputstream.writeInt16(0);
  dataoutputstream.writestring(FCalledTitle);
  i := 0;
  while i < 16 - Length(FCalledTitle) do
  begin
    dataoutputstream.writeInt8(32);
    Inc(i);
  end;
  dataoutputstream.writestring(FCallingTitle);
  j := 0;
  while j < 16 - Length(FCallingTitle) do
  begin
    dataoutputstream.writeint8(32);
    Inc(j);
  end;
  dataoutputstream.WriteSkipBytes(32);
  FApplicationContextItem.Write(dataoutputstream);
  k := 0;
  while k < FPresentationContextItems.Count do
  begin
    (TPresentationContextItem(FPresentationContextItems[k])).write(dataoutputstream);
    Inc(k);
  end;
  FUserInfoItem.write(dataoutputstream);
  dataoutputstream.FreshData;
end;

procedure TAssociateRequestPdu.read(inputstream: TDicomIOStream; AItemType:
  Integer);
var
  i: Integer;
  k: Integer;
  l: Integer;
  j: Integer;
  presentationcontextitem: TPresentationContextItem;
  i1: Integer;
  j1: Integer;
begin
  //  i := inputstream.readint8;
  i := AItemType;
  if i <> FItemType then
  begin
    raise Exception.Create('PDU-type field of Associate Request PDU not ' +
      IntToStr(FItemType)) {IllegalValueException};
  end;
  inputstream.readint8;
  k := inputstream.readInt32; //pdu length
  FProtocalVersion := inputstream.readint16; //protocal version
  k := k - 2;
  inputstream.readint16;
  FCalledTitle := inputstream.readstring(16); //called title
  FCalledTitle := Trim(FCalledTitle);
  FCallingTitle := inputstream.readstring(16); //calling title
  FCallingTitle := Trim(FCallingTitle);

  inputstream.ReadSkipBytes(32);

  k := k - 66;
  FApplicationContextItem := TApplicationContextItem.Create;
  l := FApplicationContextItem.read(inputstream);
  k := k - l;
  while k > 0 do
  begin
    j := inputstream.readint8;
    if j = 32 then
    begin
      //      inputstream.UnreadBytes(1);
      presentationcontextitem := TPresentationContextItem.Create;
      i1 := presentationcontextitem.Read(inputstream, j);
      FPresentationContextItems.add(presentationcontextitem);
      k := k - i1;
    end
    else
      if j = 80 then
    begin
      //        inputstream.UnreadBytes(1);
      FUserInfoItem := TUserInfoItem.Create;
      j1 := FUserInfoItem.read(inputstream, j);
      k := k - j1;
    end;
  end;
  AssignToRequest;
end;

function getCommandType(dicomobject: TDicomAttributes): Integer;
var
  da1: TDicomAttribute;
begin
  da1 := dicomobject.ItemByContant[dCommandField];
  if not assigned(da1) then
  begin
    Result := 0;
    //    raise Exception.Create('dicomset is not a DIMSE command')
          {IllegalValueException};
  end
  else
  begin
    result := da1.AsInteger[0];
  end;
end;

function getMessageID(dicomobject: TDicomAttributes): Integer;
var
  da1: TDicomAttribute;
begin
  da1 := dicomobject.ItemByContant[dMessageID];
  if not assigned(da1) then
  begin
    raise Exception.Create('dicomset does not contain MessageID tag')
      {IllegalValueException};
  end
  else
  begin
    result := da1.AsInteger[0];
  end;
end;

function getPriority(dicomobject: TDicomAttributes): Integer;
var
  da1: TDicomAttribute;
begin
  da1 := dicomobject.ItemByContant[dPriority];
  if not assigned(da1) then
  begin
    raise Exception.Create('dicomset does not contain Priority tag')
      {IllegalValueException};
  end
  else
  begin
    result := da1.AsInteger[0];
  end;
end;

function getAffectedSOPClass(dicomobject: TDicomAttributes): Integer;
var
  s: AnsiString;
begin
  s := dicomobject.getstring(dAffectedSOPClassUID);
  if s <> '' then
    result := UIDS.Items[s].Constant
  else
    Result := 0;
end;

function getAffectedSOPInstance(dicomobject: TDicomAttributes): AnsiString;
var
  s: AnsiString;
begin
  s := dicomobject.getstring(dAffectedSOPInstanceUID);
  result := s;
end;

function getRequestedSOPClass(dicomobject: TDicomAttributes): Integer;
var
  s: AnsiString;
begin
  s := dicomobject.getstring(dRequestedSOPClassUID);
  if s <> '' then
    result := UIDS.items[s].Constant
  else
    Result := 0;
end;

function getRequestedSOPInstance(dicomobject: TDicomAttributes): AnsiString;
var
  s: AnsiString;
begin
  s := dicomobject.getstring(dRequestedSOPInstanceUID);
  result := s;
end;

function dataPresent(dicomobject: TDicomAttributes): Boolean;
var
  da1: TDicomAttribute;
begin
  da1 := dicomobject.ItemByContant[dDataSetType]; //DataSetType (0,8)
  if not assigned(da1) then
  begin
    raise Exception.Create('no DataSetType tag in dicomobject')
      {IllegalValueException};
  end;
  result := da1.AsInteger[0] <> DICOM_DATA_NOT_PRESENT;
end;
//*************************************************************************

function createEventReportRequest(AMessageID, ASOPClassUID: Integer; AInstanceUid:
  AnsiString; ADatasetType: Boolean; AEventTypeID: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dCommandField, N_EVENT_REPORT_REQUEST);
  Result.AddVariant(dAffectedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dMessageID, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  Result.AddVariant(dAffectedSOPInstanceUID, AInstanceUid);
  Result.AddVariant(dEventTypeID, AEventTypeID);
  Result.Sort;
end;

function createEventReportResponse(AMessageID, ASOPClassUID: Integer; AInstanceUid:
  AnsiString; ADatasetType: Boolean; AStatus: Integer; AEventTypeID: Integer):
  TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, N_EVENT_REPORT_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  if AInstanceUid <> '' then
  begin
    Result.AddVariant(dAffectedSOPInstanceUID, AInstanceUid);
  end;
  if AEventTypeID <> 0 then
  begin
    Result.AddVariant(dEventTypeID, AEventTypeID);
  end;
  Result.AddVariant(dStatus, AStatus); //9
  Result.Sort;
end;

function createNGetRequest(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString):
  TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dRequestedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, N_GET_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  Result.AddVariant(dRequestedSOPInstanceUID, AInstanceUid);
  Result.Sort;
end;

function createNGetResponse(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AStatus: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, N_GET_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  if AInstanceUid <> '' then
  begin
    Result.AddVariant(dAffectedSOPInstanceUID, AInstanceUid);
  end;
  Result.AddVariant(dStatus, AStatus); //9
  Result.Sort;
end;

function createSetRequest(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString):
  TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dRequestedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, N_SET_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  Result.AddVariant(dRequestedSOPInstanceUID, AInstanceUid);
  Result.Sort;
end;

function createSetResponse(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AStatus: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, N_SET_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end;
  if AInstanceUid <> '' then
  begin
    Result.AddVariant(dAffectedSOPInstanceUID, AInstanceUid);
  end;
  Result.AddVariant(dStatus, AStatus); //9
  Result.Sort;
end;

function createActionRequest(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AActionTypeID: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dRequestedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, N_ACTION_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  Result.AddVariant(dRequestedSOPInstanceUID, AInstanceUid);
  Result.AddVariant(dActionTypeID, AActionTypeID);
  Result.Sort;
end;

function createActionResponse(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AStatus: Integer; AActionTypeID: Integer):
  TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, N_ACTION_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  if AInstanceUid <> '' then
  begin
    Result.AddVariant(dAffectedSOPInstanceUID, AInstanceUid);
  end;
  if AActionTypeID <> 0 then
  begin
    Result.AddVariant(dActionTypeID, AActionTypeID);
  end;
  Result.AddVariant(dStatus, AStatus); //9
  Result.Sort;
end;

function createCreateRequest(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dAffectedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, N_CREATE_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  if AInstanceUid <> '' then
  begin
    Result.AddVariant(dAffectedSOPInstanceUID, AInstanceUid);
  end;
  Result.Sort;
end;

function createCreateResponse(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString;
  ADatasetType: Boolean; AStatus: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID, UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, N_CREATE_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  if AInstanceUid <> '' then
  begin
    Result.AddVariant(dAffectedSOPInstanceUID, AInstanceUid);
  end;
  Result.AddVariant(dStatus, AStatus); //
  Result.Sort;
end;

function createDeleteRequest(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString):
  TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dRequestedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, N_DELETE_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  Result.AddVariant(dRequestedSOPInstanceUID, AInstanceUid);
  Result.Sort;
end;

function createDeleteResponse(AMessageID, ASOPClassUID: Integer; AInstanceUid: AnsiString;
  AStatus: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, N_DELETE_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  if AInstanceUid <> '' then
  begin
    Result.AddVariant(dAffectedSOPInstanceUID, AInstanceUid);
  end;
  Result.AddVariant(dStatus, AStatus); //9
  Result.Sort;
end;

function createEchoRequest(AMessageID, ASOPClassUID: Integer):
  TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dAffectedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, C_ECHO_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  Result.Sort;
end;

function createEchoResponse(AMessageID, ASOPClassUID: Integer; AStatus:
  Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, C_ECHO_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  //  Result.AddVariant(dStatus, AStatus); //9
  Result.Sort;
end;

function createMoveRequest(AMessageID, ASOPClassUID: Integer; APriority:
  Integer; s: AnsiString): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dAffectedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, C_MOVE_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  Result.AddVariant(dPriority, APriority);
  Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  Result.AddVariant(dMoveDestination, s);
  Result.Sort;
end;

function createMoveResponse(AMessageID, ASOPClassUID: Integer; ADatasetType:
  Boolean; AStatus, i3, i4, i5, i6: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, C_MOVE_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  Result.AddVariant(dStatus, AStatus); //9
  if i3 <> 0 then
  begin
    Result.AddVariant(dNumberOfRemainingSuboperations, i3);
  end;
  if i4 <> 0 then
  begin
    Result.AddVariant(dNumberOfCompletedSuboperations, i4);
  end;
  if i5 <> 0 then
  begin
    Result.AddVariant(dNumberOfFailedSuboperations, i5);
  end;
  if i6 <> 0 then
  begin
    Result.AddVariant(dNumberOfWarningSuboperations, i6);
  end;
  Result.Sort;
end;

function createCGetRequest(AMessageID, ASOPClassUID: Integer; APriority:
  Integer; s: AnsiString): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dAffectedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, C_GET_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  Result.AddVariant(dPriority, APriority);
  Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  Result.AddVariant(dMoveDestination, s);
  Result.Sort;
end;

function createCGetResponse(AMessageID, ASOPClassUID: Integer; ADatasetType:
  Boolean; AStatus, i3, i4, i5, i6: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, C_GET_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  Result.AddVariant(dStatus, AStatus); //9
  if i3 <> 0 then
  begin
    Result.AddVariant(dNumberOfRemainingSuboperations, i3);
  end;
  if i4 <> 0 then
  begin
    Result.AddVariant(dNumberOfCompletedSuboperations, i4);
  end;
  if i5 <> 0 then
  begin
    Result.AddVariant(dNumberOfFailedSuboperations, i5);
  end;
  if i6 <> 0 then
  begin
    Result.AddVariant(dNumberOfWarningSuboperations, i6);
  end;
  Result.Sort;
end;

function createStoreRequest(AMessageID, ASOPClassUID: Integer; APriority:
  Integer; s: AnsiString; s1: AnsiString; s2: AnsiString): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID>0 then // 4097
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, C_STORE_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  Result.AddVariant(dPriority, APriority);
  Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  Result.AddVariant(dAffectedSOPInstanceUID, s); //13
  if s1 <> '' then
  begin
    Result.AddVariant(dMoveOriginatorApplicationEntityTitle, s1); //23
  end;
  if s2 <> '' then
  begin
    Result.AddVariant(dMoveOriginatorMessageID, s2); //24
  end;
  Result.Sort;
end;

function createStoreResponse(AMessageID, ASOPClassUID: Integer; s: AnsiString;
  AStatus: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, C_STORE_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  Result.AddVariant(dStatus, AStatus); //9
  if s <> '' then
  begin
    Result.AddVariant(dAffectedSOPInstanceUID, s);
  end;
  Result.Sort;
end;

function createFindRequest(AMessageID, ASOPClassUID: Integer; APriority:
  Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dAffectedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, C_FIND_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  Result.AddVariant(dPriority, APriority);
  Result.Sort;
end;

function createFindResponse(AMessageID, ASOPClassUID: Integer; ADatasetType:
  Boolean; AStatus: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, C_FIND_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID); //message id
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  Result.AddVariant(dStatus, AStatus); //status 9
  Result.Sort;
end;

function createDatabaseRequest(AMessageID, ASOPClassUID: Integer; APriority:
  Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dAffectedSOPClassUID,
    UIDS.ItemByConstant[ASOPClassUID].Value);
  Result.AddVariant(dCommandField, C_DATABASE_REQUEST);
  Result.AddVariant(dMessageID, AMessageID);
  Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  Result.AddVariant(dPriority, APriority);
  Result.Sort;
end;

function createDatabaseResponse(AMessageID, ASOPClassUID: Integer; ADatasetType:
  Boolean; AStatus: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  if ASOPClassUID <> 0 then
  begin
    Result.AddVariant(dAffectedSOPClassUID,
      UIDS.ItemByConstant[ASOPClassUID].Value);
  end;
  Result.AddVariant(dCommandField, C_DATABASE_RESPONSE);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID); //message id
  if ADatasetType then
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_PRESENT);
  end
  else
  begin
    Result.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
  end;
  Result.AddVariant(dStatus, AStatus); //status 9
  Result.Sort;
end;

function createCancelRequest(AMessageID: Integer): TDicomAttributes;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(dCommandField, C_CANCEL_FIND_REQUEST);
  Result.AddVariant(dMessageIDBeingRespondedTo, AMessageID);
  Result.Sort;
end;

function getResultForAbstractSyntax(request: TRequest; acknowledge:
  TAcknowledge; i: Integer): Integer;
var
  j: Integer;
  k: Integer;
  uidentry: TUIDEntry;
  byte0: ShortInt;
  l: Integer;
  byte1: ShortInt;
begin
  j := request.getPresentationContexts;
  k := 0;
  while k < j do
  begin
    uidentry := request.getAbstractSyntax(k);
    if uidentry.Constant = i then
    begin
      byte0 := request.getPresentationContextID(k);
      l := 0;
      while l < acknowledge.getPresentationContexts do
      begin
        byte1 := acknowledge.getPresentationContextID(l);
        if byte0 = byte1 then
        begin
          result := acknowledge.getResult(l);
          exit;
        end;
        Inc(l);
      end;
      raise
        Exception.Create('no matching presentation context id in request and acknowledge for specified abstract syntax');
    end;
    Inc(k);
  end;
  raise Exception.Create('abstract syntax not in request');
end;

constructor TStatusEntry.Create(i: Integer; j: Integer; s: AnsiString);
begin
  fcode := i;
  ftype := j;
  fmessage := s;
end;

function TStatusEntry.getType: Integer;
begin
  result := ftype;
end;

function TStatusEntry.getMessage: AnsiString;
begin
  result := fmessage;
end;

function TStatusEntry.hashCode(obj: TObject): Integer;
begin
  result := fcode;
end;

function TStatusEntry.equals(obj: TObject): Boolean;
begin
  if not (obj is TStatusEntry) then
  begin
    result := FALSE;
  end
  else
  begin
    result := fcode = (TStatusEntry(obj)).fcode;
  end;
end;

function TStatusEntry.toString: AnsiString;
begin
  result := IntToHex(fcode, 4) + ' [' + Fmessage + ']';
end;

constructor TStatus.Create;
begin
  defaultTab := TList.Create;
  defaultTab.Add(TStatusEntry.Create(0, 1, 'Success'));
  defaultTab.Add(TStatusEntry.Create(1, 1,
    'Success: Partial Study Content exists on system supporting SCP'));
  defaultTab.Add(TStatusEntry.Create(2, 1,
    'Success: None of the Study Content exists on system supporting SCP'));
  defaultTab.Add(TStatusEntry.Create(3, 1,
    'Success: It is StatusEntry.UNKNOWN whether or not study content exists on system supporting SCP'));
  defaultTab.Add(TStatusEntry.Create(261, 5, 'Failure: No such attribute'));
  defaultTab.Add(TStatusEntry.Create(262, 5, 'Failure: Invalid attribute value'));
  defaultTab.Add(TStatusEntry.Create(263, 4, 'Warning: Attribute list error'));
  defaultTab.Add(TStatusEntry.Create(272, 5, 'Failure: Processing StatusEntry.FAILURE'));
  defaultTab.Add(TStatusEntry.Create(273, 5, 'Failure: Duplicate SOP instance'));
  defaultTab.Add(TStatusEntry.Create(274, 5, 'Failure: No such object instance'));
  defaultTab.Add(TStatusEntry.Create(275, 5, 'Failure: No such event type'));
  defaultTab.Add(TStatusEntry.Create(276, 5, 'Failure: No such argument'));
  defaultTab.Add(TStatusEntry.Create(277, 5, 'Failure: Invalid argument value'));
  defaultTab.Add(TStatusEntry.Create(278, 4, 'Warning: Attribute Value Out of Range'));
  defaultTab.Add(TStatusEntry.Create(279, 5, 'Failure: Invalid object instance'));
  defaultTab.Add(TStatusEntry.Create(280, 5, 'Failure: No such SOP class'));
  defaultTab.Add(TStatusEntry.Create(281, 5, 'Failure: Class-instance conflict'));
  defaultTab.Add(TStatusEntry.Create(288, 5, 'Failure: Missing attribute'));
  defaultTab.Add(TStatusEntry.Create(289, 5, 'Failure: Missing attribute value'));
  defaultTab.Add(TStatusEntry.Create(290, 5, 'Refused: SOP class not supported'));
  defaultTab.Add(TStatusEntry.Create(528, 5, 'Failure: Duplicate invocation'));
  defaultTab.Add(TStatusEntry.Create(529, 5, 'Failure: Unrecognized operation'));
  defaultTab.Add(TStatusEntry.Create(530, 5, 'Failure: Mistyped argument'));
  defaultTab.Add(TStatusEntry.Create(531, 5, 'Failure: Resource limitation'));
  defaultTab.Add(TStatusEntry.Create(42752, 5, 'Refused: Out of Resources'));
  defaultTab.Add(TStatusEntry.Create(43264, 5, 'Failure: Data Set does not match SOP Class'));
  defaultTab.Add(TStatusEntry.Create(45056, 4, 'Warning: Coercion of Data Elements'));
  defaultTab.Add(TStatusEntry.Create(45062, 4, 'Warning: Elements Discarded'));
  defaultTab.Add(TStatusEntry.Create(45063, 4, 'Warning: Data Set does not match SOP Class'));
  defaultTab.Add(TStatusEntry.Create(46592, 4, 'Warning: Memory allocation not supported'));
  defaultTab.Add(TStatusEntry.Create(46593, 4,
    'Warning: Film session printing (collation) is not supported'));
  defaultTab.Add(TStatusEntry.Create(46594, 4,
    'Warning: Film Session SOP Instance hierarchy does not contain Image Box SOP Instances (empty page)'));
  defaultTab.Add(TStatusEntry.Create(46595, 4,
    'Warning: Film Box SOP Instance hierarchy does not contain Image Box SOP Instances (empty page)'));
  defaultTab.Add(TStatusEntry.Create(46596, 4,
    'Warning: Image size is larger than image box size, the image has been demagnified'));
  defaultTab.Add(TStatusEntry.Create(46597, 4,
    'Warning: Requested Min Density or Max Density outside of printers operating range'));
  defaultTab.Add(TStatusEntry.Create(46601, 4,
    'Warning: Image size is larger than the Image Box size. The Image has been cropped to fit'));
  defaultTab.Add(TStatusEntry.Create(46602, 4,
    'Warning: Image size is larger than the Image Box size. Image or Combined Print Image has been decimated to fit'));
  defaultTab.Add(TStatusEntry.Create(50688, 5,
    'Failure: Film Session SOP Instance hierarchy does not contain Film Box SOP Instances'));
  defaultTab.Add(TStatusEntry.Create(50689, 5,
    'Failure: Unable to create Print Job SOP Instance; print queue is full'));
  defaultTab.Add(TStatusEntry.Create(50690, 5,
    'Failure: Unable to create Print Job SOP Instance; print queue is full'));
  defaultTab.Add(TStatusEntry.Create(50691, 5,
    'Failure: Image size is larger than image box size'));
  defaultTab.Add(TStatusEntry.Create(49152, 5, 'Failure: Cannot understand'));
  defaultTab.Add(TStatusEntry.Create(50693, 5,
    'Failure: Insufficient memory in printer to store the image'));
  defaultTab.Add(TStatusEntry.Create(50707, 5,
    'Failure: Combined Print Image size is larger than the Image Box size'));
  defaultTab.Add(TStatusEntry.Create(50710, 5,
    'Failure: There is an existing Film Box that has not been printed and N-ACTION at the Film Session level is not supported'));
  defaultTab.Add(TStatusEntry.Create(65024, 3, 'StatusEntry.CANCEL'));
  defaultTab.Add(TStatusEntry.Create(65280, 2, 'StatusEntry.PENDING'));
  defaultTab.Add(TStatusEntry.Create(65281, 2,
    'StatusEntry.PENDING - one or more Optional Keys were not supported'));
  DefaultTab.Sort(CompareStatus);

  List4132 := TList.Create;
  List4132.Add(TStatusEntry.Create(42753, 5,
    'Refused: Out of Resources - Unable to calculate number of matches'));
  List4132.Add(TStatusEntry.Create(42754, 5,
    'Refused: Out of Resources - Unable to perform sub-operations'));
  List4132.Add(TStatusEntry.Create(43009, 5, 'Refused: Move Destination StatusEntry.UNKNOWN'));
  List4132.Add(TStatusEntry.Create(43264, 5, 'Failure: Identifier does not match SOP Class'));
  List4132.Add(TStatusEntry.Create(45056, 4,
    'Warning: Sub-operations Complete - One or more Failures'));
  List4132.Add(TStatusEntry.Create(49152, 5, 'Failure: Unable to process'));
  List4132.Sort(CompareStatus);

  //        specificTabs.put(new Integer(4132), hashtable);
//        specificTabs.put(new Integer(4133), hashtable);
//        specificTabs.put(new Integer(4134), hashtable);
//        specificTabs.put(new Integer(4135), hashtable);
//        specificTabs.put(new Integer(4136), hashtable);
//        specificTabs.put(new Integer(4137), hashtable);
//        specificTabs.put(new Integer(4138), hashtable);
//        specificTabs.put(new Integer(4139), hashtable);
//        specificTabs.put(new Integer(4140), hashtable);
  List4150 := TList.Create;
  List4150.Add(TStatusEntry.Create(46596, 4,
    'Warning: Annotation Box not supported, image printed without annotation'));
  List4150.Add(TStatusEntry.Create(46597, 4,
    'Warning: Image Overlay Box not supported, image printed without overlay'));
  List4150.Add(TStatusEntry.Create(46598, 4,
    'Warning: Presentation LUT not supported, image printed without applying any Presentation LUT'));
  List4150.Add(TStatusEntry.Create(46600, 4,
    'Warning: Presentation LUT not supported at Image Box level, image printed with Film Box Presentation LUT'));
  List4150.Add(TStatusEntry.Create(50688, 5,
    'Failure: Stored Print Storage SOP Instance does not contain Film Boxes'));
  List4150.Add(TStatusEntry.Create(50695, 5,
    'Failure: Stored Print Storage SOP Instance not available from Retrieve AE'));
  List4150.Add(TStatusEntry.Create(50696, 5,
    'Failure: Image SOP Instance not available from Retrieve AE'));
  List4150.Add(TStatusEntry.Create(50697, 5,
    'Failure: StatusEntry.FAILURE in retrieving Stored Print Storage SOP Instance'));
  List4150.Add(TStatusEntry.Create(50698, 5,
    'Failure: StatusEntry.FAILURE in retrieving Image SOP Instance'));
  List4150.Add(TStatusEntry.Create(50699, 5, 'Failure: StatusEntry.UNKNOWN Retrieve AE title'));
  List4150.Add(TStatusEntry.Create(50700, 5,
    'Failure: Print request rejected because printer cannot handle color image'));
  List4150.Add(TStatusEntry.Create(50701, 5,
    'Failure: Stored Print Storage SOP Instance does not contain Image Boxes (empty page)'));
  List4150.Add(TStatusEntry.Create(50702, 5, 'Failure: Annotation Box not supported'));
  List4150.Add(TStatusEntry.Create(50703, 5, 'Failure: Image Overlay Box not supported'));
  List4150.Add(TStatusEntry.Create(50704, 5, 'Failure: Presentation LUT not supported'));
  List4150.Add(TStatusEntry.Create(50707, 5,
    'Failure: Combined Print Image size is larger than the Image Box size'));
  List4150.Add(TStatusEntry.Create(50708, 5,
    'Failure: Presentation LUT not supported at Image Box level'));
  List4150.Add(TStatusEntry.Create(50709, 5,
    'Failure: Unable to establish an Association with the Retrieve AE'));
  List4150.Sort(CompareStatus);

  List4160 := TList.Create;
  List4160.Add(TStatusEntry.Create(50710, 5,
    'Failure: Combined Print Image requires cropping to fit Image Box. This is not supported in this SOP Class'));

  UnknowStatus := TStatusEntry.Create(0, 0, '?');
end;

destructor TStatus.Destroy;
var
  i: Integer;
begin
  for i := 0 to defaultTab.Count - 1 do
    TUIDEntry(defaultTab[i]).Free;
  defaultTab.Clear;
  defaultTab.Free;
  for i := 0 to List4132.Count - 1 do
    TUIDEntry(List4132[i]).Free;
  List4132.Clear;
  List4132.Free;
  for i := 0 to List4150.Count - 1 do
    TUIDEntry(List4150[i]).Free;
  List4150.Clear;
  List4150.Free;
  for i := 0 to List4160.Count - 1 do
    TUIDEntry(List4160[i]).Free;
  List4160.Clear;
  List4160.Free;
  UnknowStatus.Free;
  inherited Destroy;
end;

function TStatus.maskBits(i: Integer): Integer;
var
  j: Integer;
begin
  j := (i) and ($FF00);
  case j of
    42752:
      begin
      end;
    43264:
      begin
        result := j;
        exit;
      end;
  end; //end of case
  j := (i) and ($F000);
  case j of
    49152:
      begin
        result := j;
        exit;
      end;
  end; //end of case
  result := 0;
end;

function TStatus.isPending(i: Integer): Boolean;
begin
  result := (i = 65280) or (i = 65281);
end;

function TStatus.getStatusEntry(i: Integer): TStatusEntry;
var
  statusentry: TStatusEntry;
begin
  statusentry := getStatusEntry(defaultTab, i);
  if statusentry = nil then
  begin
    statusentry := UnknowStatus;
  end;
  result := statusentry;
end;

function TStatus.getStatusEntry(hashtable: TList; i: Integer): TStatusEntry;

  function FindItem(Atable: TList; k: Integer): TStatusEntry;
  var
    k1, l1, h1, m1: Integer;
  begin
    l1 := 0;
    h1 := Atable.Count - 1;
    Result := nil;
    while l1 <= h1 do
    begin
      m1 := (l1 + h1) div 2;
      k1 := TStatusEntry(Atable[m1]).Code;
      if k1 > k then
        h1 := m1 - 1
      else
        if k1 < k then
        l1 := m1 + 1
      else
      begin
        Result := TStatusEntry(Atable[m1]);
        exit;
      end;
    end; // while
  end;
var
  statusentry: TStatusEntry;
begin
  statusentry := FindItem(hashtable, i);
  i := maskBits(i);
  if (statusentry = nil) and ((i) <> 0) then
  begin
    statusentry := FindItem(hashtable, i);
  end;
  result := statusentry;
end;

function TStatus.getStatusEntry(i: Integer; j: Integer): TStatusEntry;
var
  hashtable: TList;
begin
  Result := nil;
  case i of //
    4132, 4133, 4134, 4135, 4136,
      4137, 4138, 4139, 4140: hashtable := List4132;
    4150: hashtable := List4150;
    4160: hashtable := List4160;
  else
    hashtable := nil;
  end; // case
  if hashtable <> nil then
  begin
    result := getStatusEntry(hashtable, j);
  end;
  if result = nil then
  begin
    result := getStatusEntry(j);
  end;
end;

function TStatus.toString(i: Integer): AnsiString;
begin
  result := 'status #' + IntToHex(i, 4);
end;
//*********************TPrintManagementUtils**************************
(*
constructor TPrintManagementUtils.Create;
begin
  grouplens := TRUE;
  _requestor := nil;
  //  connection:=NIL;
  _metaSOPid := -1;
  _metaPCid := 0;
  _sessionUID := '';
  _refSessionSqItem := TDicomAttributes.Create;
  _curFilmBoxUID := '';
  _curFilmBoxAttribs := nil;
  //  _statusListener:=Vector.Create();
  //  _jobListener:=Vector.Create();
  maxPduSize := 32768;
  artim := 1000;
end;

procedure TPrintManagementUtils.setGrouplens(flag: Boolean);
begin
  grouplens := flag;
end;

procedure TPrintManagementUtils.setMaxPduSize(i: Integer);
begin
  maxPduSize := i;
end;

procedure TPrintManagementUtils.setARTIM(i: Integer);
begin
  artim := i;
  if connection <> nil then
  begin
    //    connection.setARTIM(i);
  end;
end;

function TPrintManagementUtils.connect(s: AnsiString; i: Integer; s1: AnsiString; s2: AnsiString; ai: TDCMIntegerArray): TDicomResponse;
var
  //  request : TRequest;
  j: Integer;
begin
  {  if connection <> NIL then
    begin
      raise Exception.Create('existing connection'){IllegalStateException};
    end;//end of if(connection <> NIL)
    request:=TRequest.Create();
    request.setCalledTitle(s1);
    request.setCallingTitle(s2);
    request.setMaxPduSize(maxPduSize);
    j:=0;
    while j<ai.length do
    begin
      request.addPresentationContext(ai[j],ONLY_DEF_TS);
      Inc(j);
    end;//end of while(j<ai.length):
    _requestor:=Requestor.Create(socket,request);
    _requestor.addAssociationListener(_assocListener);
    verboseassociation:=_requestor.openAssoc();
    if verboseassociation <> NIL then
    begin
      verboseassociation.setGrouplens(grouplens);
      dimserqmanager:=DimseRqManager.Create();
      dimserqmanager.regNEventReportScu(UID.toString(4115),MyNEventReportSCU.Create(_statusListener));
      dimserqmanager.regNEventReportScu(UID.toString(4113),MyNEventReportSCU.Create(_jobListener));
      connection:=DimseExchange.Create(verboseassociation,dimserqmanager,FALSE,FALSE,1);
      connection.setARTIM(artim);
      (Thread.Create(connection)).start();
    end;//end of if(verboseassociation <> NIL)
    result := _requestor.response();
  }
end;

function TPrintManagementUtils.isConnected: Boolean;
begin
  result := connection <> nil;
end;

function TPrintManagementUtils.isEnabled(i: Integer): Boolean;
begin
  try
    result := (isConnected()); // and (connection.listAcceptedPresentationContexts(i).length>0);
  except
    on illegalvalueexception: Exception do
    begin
      result := FALSE;
    end
  end;
end;

function TPrintManagementUtils.getFilmSessionUID: AnsiString;
begin
  result := _sessionUID;
end;

function TPrintManagementUtils.getFilmBoxUID: AnsiString;
begin
  result := _curFilmBoxUID;
end;

function TPrintManagementUtils.isFilmSession: Boolean;
begin
  result := _sessionUID <> '';
end;

function TPrintManagementUtils.isGrayscaleFilmSession: Boolean;
begin
  result := isFilmSession(12292);
end;

function TPrintManagementUtils.isColorFilmSession: Boolean;
begin
  result := isFilmSession(12294);
end;

function TPrintManagementUtils.isFilmSession(i: Integer): Boolean;
begin
  result := (isFilmSession()) and (_metaSOPid = i);
end;

function TPrintManagementUtils.isFilmBox: Boolean;
begin
  result := _curFilmBoxUID <> '';
end;

function TPrintManagementUtils.echo: TDicomAttributes;
begin
  //  result := connection.cecho();
end;

function TPrintManagementUtils.getColorPrinterStatus: TDicomAttributes;
begin
  result := getPrinterStatus(12294);
end;

function TPrintManagementUtils.getGrayscalePrinterStatus: TDicomAttributes;
begin
  result := getPrinterStatus(12292);
end;

function TPrintManagementUtils.getPrinterStatus(i: Integer): TDicomAttributes;
var
  byte0: ShortInt;
begin
  //  byte0:=connection.getPresentationContext(i);
  //  result := connection.nget(byte0,UID.toString(4115),UID.toString(16387),NIL);
end;

function TPrintManagementUtils.getPrintJobStatus(s: AnsiString): TDicomAttributes;
var
  byte0: ShortInt;
begin
  //  byte0:=connection.getPresentationContext(4113);
  //  result := connection.nget(byte0,UID.toString(4113),s,NIL);
end;

function TPrintManagementUtils.getPrinterConfiguration: TDicomAttributes;
var
  byte0: ShortInt;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection') {IllegalStateException};
  end
  else
  begin
    //    byte0:=connection.getPresentationContext(4175);
    //    result := connection.nget(byte0,UID.toString(4175),UID.toString(16389),NIL);
  end;
end;

function TPrintManagementUtils.createGrayscaleFilmSession(dicomobject: TDicomAttributes): TDicomAttributes;
begin
  result := createFilmSession(12292, dicomobject);
end;

function TPrintManagementUtils.createColorFilmSession(dicomobject: TDicomAttributes): TDicomAttributes;
begin
  result := createFilmSession(12294, dicomobject);
end;

function TPrintManagementUtils.createFilmSession(i: Integer; dicomobject: TDicomAttributes): TDicomAttributes;
var
  s: AnsiString;
  dicommessage: TDicomAttributes;
  statusentry: TStatusEntry;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection') {IllegalStateException};
  end;
  if _sessionUID <> '' then
  begin
    raise Exception.Create('Existing FilmSession') {IllegalStateException};
  end;
  _metaSOPid := i;
  //  _metaPCid:=connection.getPresentationContext(_metaSOPid);
  //  s:=UIDUtils.createUID();
  //  dicommessage:=connection.ncreate(_metaPCid,UID.toString(4108),s,dicomobject);
  statusentry := DicomStatus.getStatusEntry(4108, dicommessage.getInteger(9));
  if (statusentry <> nil) and (statusentry.getType() <> 5) then
  begin
    _sessionUID := s;
    _refSessionSqItem.AddVariant(115, UIDS.AsString(4108));
    _refSessionSqItem.AddVariant(116, _sessionUID);
  end;
  result := dicommessage;
end;

function TPrintManagementUtils.setFilmSession(dicomobject: TDicomAttributes): TDicomAttributes;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _sessionUID = '' then
  begin
    raise Exception.Create('Missing FilmSession');
  end
  else
  begin
    //    result := connection.nset(_metaPCid,UID.toString(4108),_sessionUID,dicomobject);
  end;
end;

function TPrintManagementUtils.printFilmSession: TDicomAttributes;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _sessionUID = '' then
  begin
    raise Exception.Create('Missing FilmSession');
  end
  else
  begin
    //    result := connection.naction(_metaPCid,UID.toString(4108),_sessionUID,1,NIL);
  end;
end;

function TPrintManagementUtils.deleteFilmSession: TDicomAttributes;
var
  dicommessage: TDicomAttributes;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _sessionUID = '' then
  begin
    raise Exception.Create('Missing FilmSession');
  end
  else
  begin
    //    dicommessage:=connection.ndelete(_metaPCid,UIDS.AsString(4108),_sessionUID);
    _sessionUID := '';
    _curFilmBoxUID := '';
    _curFilmBoxAttribs := nil;
    result := dicommessage;
  end;
end;

function TPrintManagementUtils.createFilmBox(dicomobject: TDicomAttributes): TDicomAttributes;
var
  s: AnsiString;
  dicommessage: TDicomAttributes;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _sessionUID = '' then
  begin
    raise Exception.Create('Missing FilmSession');
  end;
  //  s:=UIDUtils.createUID();
  //  dicomobject.AddVariant(725,_refSessionSqItem);
  //  dicommessage:=connection.ncreate(_metaPCid,UIDS.AsString(4109),s,dicomobject);
  //  if DicomStatus.getStatusEntry(4109,dicommessage.getInteger(9)).getType() <> 5 then
  begin
    _curFilmBoxUID := s;
    //    _curFilmBoxAttribs:=dicommessage.getDataset();
  end;
  result := dicommessage;
end;

function TPrintManagementUtils.setFilmBox(dicomobject: TDicomAttributes): TDicomAttributes;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _curFilmBoxUID = '' then
  begin
    raise Exception.Create('Missing FilmBox');
  end
  else
  begin
    //    result := connection.nset(_metaPCid,UIDS.AsString(4109),_curFilmBoxUID,dicomobject);
  end;
end;

function TPrintManagementUtils.printFilmBox: TDicomAttributes;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _curFilmBoxUID = '' then
  begin
    raise Exception.Create('Missing FilmBox');
  end
  else
  begin
    //    result := connection.naction(_metaPCid,UIDS.AsString(4109),_curFilmBoxUID,1,NIL);
  end;
end;

function TPrintManagementUtils.deleteFilmBox: TDicomAttributes;
var
  dicommessage: TDicomAttributes;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _curFilmBoxUID = '' then
  begin
    raise Exception.Create('Missing FilmBox');
  end
  else
  begin
    //    dicommessage:=connection.ndelete(_metaPCid,UIDS.AsString(4109),_curFilmBoxUID);
    _curFilmBoxUID := '';
    _curFilmBoxAttribs := nil;
    result := dicommessage;
  end;
end;

function TPrintManagementUtils.createPresentationLUT(s: AnsiString; i: Integer; j: Integer; ai: TDCMIntegerArray; s1: AnsiString): TDicomAttributes;
var
  dicomobject: TDicomAttributes;
  k: Integer;
  dicomobject1: TDicomAttributes;
begin
  dicomobject := TDicomAttributes.Create;
  //  dicomobject.AddVariant(506,ai.length,0);
  //  dicomobject.AddVariant(506,i,1);
  //  dicomobject.AddVariant(506,j,2);
  if s1 <> '' then
  begin
    dicomobject.AddVariant(507, s1);
  end;
  k := 0;
  while k < length(ai) do
  begin
    //    dicomobject.AddVariant(509,ai[k],k);
    Inc(k);
  end;
  dicomobject1 := TDicomAttributes.Create;
  //  dicomobject1.AddVariant(1239,dicomobject);
  result := createPresentationLUT(s, dicomobject1);
end;

function TPrintManagementUtils.createShapePresentationLUT(s: AnsiString; s1: AnsiString): TDicomAttributes;
var
  dicomobject: TDicomAttributes;
begin
  dicomobject := TDicomAttributes.Create();
  dicomobject.AddVariant(1240, s1);
  result := createPresentationLUT(s, dicomobject);
end;

function TPrintManagementUtils.createPresentationLUT(s: AnsiString; dicomobject: TDicomAttributes): TDicomAttributes;
var
  byte0: ShortInt;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end
  else
  begin
    //    byte0:=connection.getPresentationContext(4145);
    //    result := connection.ncreate(byte0,UIDS.AsString(4145),s,PrintManagementUtils.getPresentationLUTModule(dicomobject));
  end;
end;

function TPrintManagementUtils.deletePresentationLUT(s: AnsiString): TDicomAttributes;
var
  byte0: ShortInt;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _sessionUID = '' then
  begin
    raise Exception.Create('Missing FilmSession');
  end
  else
  begin
    //    byte0:=connection.getPresentationContext(4145);
    //    result := connection.ndelete(byte0,UIDS.AsString(4145),s);
  end;
end;

function TPrintManagementUtils.createOverlayBox(s: AnsiString; dicomobject: TDicomAttributes; dicomobject1: TDicomAttributes): TDicomAttributes;
var
  byte0: ShortInt;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _sessionUID = '' then
  begin
    raise Exception.Create('Missing FilmSession');
  end
  else
  begin
    //    dicomobject1.AddVariant(1366,dicomobject);
    //    byte0:=connection.getPresentationContext(4160);
    //    result := connection.ncreate(byte0,UIDS.AsString(4160),s,dicomobject1);
  end;
end;

function TPrintManagementUtils.setOverlayBox(s: AnsiString; dicomobject: TDicomAttributes; dicomobject1: TDicomAttributes): TDicomAttributes;
var
  byte0: ShortInt;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _sessionUID = '' then
  begin
    raise Exception.Create('Missing FilmSession');
  end;
  if dicomobject <> nil then
  begin
    //    dicomobject1.AddVariant(1366,dicomobject);
  end;
  //  byte0:=connection.getPresentationContext(4160);
  //  result := connection.nset(byte0,UIDS.AsString(4160),s,dicomobject1);
end;

function TPrintManagementUtils.deleteOverlayBox(s: AnsiString): TDicomAttributes;
var
  byte0: ShortInt;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if _sessionUID = '' then
  begin
    raise Exception.Create('Missing FilmSession');
  end
  else
  begin
    //    byte0:=connection.getPresentationContext(4160);
    //    result := connection.ndelete(byte0,UIDS.AsString(4160),s);
  end;
end;

function TPrintManagementUtils.countImageBoxes: Integer;
begin
  if _curFilmBoxAttribs = nil then
  begin
    raise Exception.Create('Missing FilmBox');
  end
  else
  begin
    //    result := _curFilmBoxAttribs.getSize(726);
  end;
end;

function TPrintManagementUtils.countAnnotationBoxes: Integer;
begin
  if _curFilmBoxAttribs = nil then
  begin
    raise Exception.Create('Missing FilmBox');
  end
  else
  begin
    //    result := Math.max(0,_curFilmBoxAttribs.getSize(727));
  end;
end;

function TPrintManagementUtils.setImageBox(i: Integer; dicomobject: TDicomAttributes; dicomobject1: TDicomAttributes; j: Integer; k: Integer): TDicomAttributes;
var
  dicomobject2: TDicomAttributes;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if (i <= 0) or (i > countImageBoxes()) then
  begin
    raise Exception.Create('Invalid ImagePosition - ' + IntToStr(i));
  end
  else
  begin
    //    dicomobject2:=TDicomAttributes(_curFilmBoxAttribs.get(726,i-1));
    dicomobject1.AddVariant(729, i);
    //    dicomobject1.AddVariant(j,getPixelModule(dicomobject));
    //    result := connection.nset(_metaPCid,UID.getUIDEntry(k).getValue(),dicomobject2.getS(116),dicomobject1);
  end;
end;

function TPrintManagementUtils.setGrayscaleImageBox(i: Integer; dicomobject: TDicomAttributes; dicomobject1: TDicomAttributes): TDicomAttributes;
begin
  result := setImageBox(i, dicomobject, dicomobject1, 732, 4110);
end;

function TPrintManagementUtils.setColorImageBox(i: Integer; dicomobject: TDicomAttributes; dicomobject1: TDicomAttributes): TDicomAttributes;
begin
  result := setImageBox(i, dicomobject, dicomobject1, 733, 4111);
end;

function TPrintManagementUtils.setAnnotationBox(i: Integer; s: AnsiString): TDicomAttributes;
var
  dicomobject: TDicomAttributes;
  dicomobject1: TDicomAttributes;
  byte0: ShortInt;
begin
  if connection = nil then
  begin
    raise Exception.Create('no connection');
  end;
  if (i <= 0) or (i > countAnnotationBoxes()) then
  begin
    raise Exception.Create('Invalid AnnotationPosition - ' + IntToStr(i));
  end
  else
  begin
    //    dicomobject:=TDicomAttributes(_curFilmBoxAttribs.get(727,i-1));
    dicomobject1 := TDicomAttributes.Create;
    dicomobject1.AddVariant(737, i);
    dicomobject1.AddVariant(738, s);
    //    byte0:=connection.getPresentationContext(4114);
    //    result := connection.nset(byte0,dicomobject.getS(115),dicomobject.getS(116),dicomobject1);
  end;
end;

procedure TPrintManagementUtils.release;
begin
  if _sessionUID <> '' then
  begin
    deleteFilmSession();
  end;
  if connection <> nil then
  begin
    //    connection.releaseAssoc();
    connection := nil;
  end;
end;

procedure TPrintManagementUtils.setvariant(dicomobject: TDicomAttributes; i: Integer; s: AnsiString);
begin
  if (s <> '') then
  begin
    dicomobject.AddVariant(i, s);
  end;
end;

function TPrintManagementUtils.createGammaPresentationLUT(i: Integer; j: Integer; d: double): TDicomAttributes;
var
  dicomobject: TDicomAttributes;
begin
  try
    dicomobject := TDicomAttributes.Create;
    //    dicomobject.AddVariant(1239,createGammaLUTSequenceItem(i,j,d));
    result := dicomobject;
    exit;
  except
    on dicomexception: Exception do
    begin
      raise Exception.Create(dicomexception.Message);
    end
  end;
end;

function TPrintManagementUtils.createGammaLUTSequenceItem(i: Integer; j: Integer; d: double): TDicomAttributes;
var
  k: Integer;
  d1: double;
  d2: double;
  dicomobject: TDicomAttributes;
  abyte0: TShortIntArray;
  l: Integer;
  j1: Integer;
  i1: Integer;
begin
  if (i <= 0) or (i > 65535) then
  begin
    raise Exception.Create('Illegal value for LUT len ' + IntToStr(i));
  end;
  if (j < 8) or (j > 16) then
  begin
    raise Exception.Create('Illegal value for LUT bitDepth ' + IntToStr(j));
  end;
  if (d < 0.1) or (d > 10) then
  begin
    raise Exception.Create('Illegal value for LUT gamma ' + FloatToStr(d));
  end;
  k := (1 shl j) - 1;
  d1 := 1.0 * d;
  //  d2:=(1 shl j)*pow(i-1,d1);

  try
    dicomobject := TDicomAttributes.Create;
    SetLength(abyte0, i shl 1) {ShortInt[i shl 1]};
    l := 0;
    j1 := 0;
    while j1 < i do
    begin
      //      i1:=min(k,Integer((d2*pow(j1,d1))));
      inc(l);
      abyte0[(l)] := ShortInt(i1);
      inc(l);
      abyte0[(l)] := ShortInt((i1 shr {1} 8));
      Inc(j1);
    end; //end of while(j1<i):
    //    dicomobject.AddVariant(509,abyte0);
    //    dicomobject.AddVariant(506,(i),0);
    //    dicomobject.AddVariant(506,(0),1);
    //    dicomobject.AddVariant(506,(j),2);
    dicomobject.AddVariant(507, 'Gamma [' + FloatToStr(d) + '] correction LUT');
    result := dicomobject;
  except
    on dicomexception: Exception do
    begin
      raise Exception.Create(dicomexception.Message);
    end
  end;
end;

function TPrintManagementUtils.preformatGrayscale(dicomobject: TDicomAttributes; dicomobject1: TDicomAttributes; i: Integer; j: Integer; flag: Boolean): TDicomAttributes;
var
  s: AnsiString;
  k: Integer;
  flag1: Boolean;
  l: Integer;
  i1: Integer;
  j1: Integer;
  //  pixelmatrix : TPixelMatrix;
  flag2: Boolean;
  dicomobject2: TDicomAttributes;
  float1: Double;
  float2: Double;
  ai: TDCMIntegerArray;
  f: Double;
  f1: Double;
  k1: Integer;
  l1: Integer;
  abyte0: TShortIntArray;
  short1: Shortint;
  i2: Integer;
  //  unsignedshort1 : TUnsignedShort;
  k3: Integer;
  word0: Smallint;
  //  signedshort1 : TSignedShort;
  l3: Integer;
  word1: Smallint;
  byte1: Byte;
  //  unsignedshort : TUnsignedShort;
  j2: Integer;
  //  signedshort : TSignedShort;
  k2: Integer;
  short2: Shortint;
  l2: Integer;
  //  unsignedbyte1 : TUnsignedByte;
  i4: Integer;
  word2: Smallint;
  //  signedbyte1 : TSignedByte;
  j4: Integer;
  word3: Smallint;
  byte1_1: Byte;
  //  unsignedbyte : TUnsignedByte;
  i3: Integer;
  //  signedbyte : TSignedByte;
  j3: Integer;
begin
  {  if (i<8) or (i>16) then
    begin
      raise Exception.Create('Illegal bitDepth - '+i);
    end;
    s:=dicomobject.get(462);
    k:=EnumPMI.getConstant(s);
    if  not EnumPMI.isGrayscale(k) then
    begin
      raise Exception.Create('Cannot preformat images with Photometric Interpretation - '+s);
    end;
    flag1:=k = 0;
    l:=dicomobject.getI(461);
    if l <> 1 then
    begin
      raise Exception.Create('Illegal Samples Per Pixel - '+l){DicomException};
    end;
    i1:=dicomobject.getI(475);
    if (i1 <> 8) and (i1 <> 16) then
    begin
      raise Exception.Create('Cannot preformat images with '+i1+' bits allocated');
    end;
    j1:=Math.min(i,i1);
    if (j = 0) or ((j = 1) and ((((dicomobject.getSize(505)>0) or (dicomobject.getSize(510)>0)) or ((dicomobject1 <> NIL) and (dicomobject1.getSize(1239)>0))))) then
    begin
      j1:=i;
    end;
    pixelmatrix:=PixelMatrix.create(dicomobject);
    flag2:=LUTFactory.isXRaySOPClass(dicomobject);
    if (((dicomobject1 = NIL) and (flag)) and (dicomobject.getSize(510)<=0)) and (((dicomobject.getSize(487)<=0) or (dicomobject.getSize(488)<=0))) then
    begin
      dicomobject2:=NIL;
      float1:=0;
      float2:=0;
      if  not flag2 then
      begin
        dicomobject2:=TDicomAttributes(dicomobject.get(505));
        float1:=(dicomobject.get(490));
        float2:=(dicomobject.get(489));
      end;
      ai:=TestAndReturn(dicomobject2 = NIL,pixelmatrix.calcMinMax(),LUTFactory.calcMinMax(dicomobject2));
      f:=real((ai[1]+ai[0]))*2.0F;
      f1:=ai[1]-ai[0];
      if (float1 <> 0) and (float2 <> 0) then
      begin
        f:=f*float1.floatValue()+float2.floatValue();
        f1:=f1*float1.floatValue();
      end;//end of if((float1 <> NIL) and (float2 <> NIL))
      dicomobject.AddVariant(487,f);
      dicomobject.AddVariant(488,f1);
    end;//end of if((((dicomobject1 = NIL) and (flag)) and (dicomobject.getSize(510)<=0)) and (((dicomobject.getSize(487)<=0) or (dicomobject.getSize(488)<=0))))
    k1:=(1 shl j1)-1;
    l1:=pixelmatrix.getNumberOfSamples();
    if i1>8 then
    begin
      if j1>8 then
      begin
        short1:=LUTFactory.createShortLUT(pixelmatrix.getMinVal(),pixelmatrix.getMaxVal(),k1,flag1,dicomobject,dicomobject,dicomobject1);
        SetLength(abyte0 , 2*l1){ShortInt[2*l1]};
        i2:=0;
        if pixelmatrix is TUnsignedShort then
        begin
          unsignedshort1:=TUnsignedShort(pixelmatrix);
          k3:=0;
          while k3<l1 do
          begin
            word0:=short1.lookupShort(unsignedshort1.getSample(k3));
            abyte0[PostInc(i2)]:=ShortInt(word0);
            abyte0[PostInc(i2)]:=ShortInt((word0 shr{1} 8));
            Inc(k3);
          end;//end of while(k3<l1):
        end else begin
          signedshort1:=TSignedShort(pixelmatrix);
          l3:=0;
          while l3<l1 do
          begin
            word1:=short1.lookupShort(signedshort1.getSample(l3));
            abyte0[PostInc(i2)]:=ShortInt(word1);
            abyte0[PostInc(i2)]:=ShortInt((word1 shr{1} 8));
            Inc(l3);
          end;//end of while(l3<l1):
        end;//end of if(pixelmatrix is TUnsignedShort)
        dicomobject.set(475,(16));
      end else begin
        byte1:=LUTFactory.createByteLUT(pixelmatrix.getMinVal(),pixelmatrix.getMaxVal(),k1,flag1,TestAndReturn(flag2,NIL,dicomobject),dicomobject,dicomobject1);
        SetLength(abyte0 , l1){ShortInt[l1]};
        if pixelmatrix is TUnsignedShort then
        begin
          unsignedshort:=TUnsignedShort(pixelmatrix);
          j2:=0;
          while j2<l1 do
          begin
            abyte0[j2]:=byte1.lookupByte(unsignedshort.getSample(j2));
            Inc(j2);
          end;//end of while(j2<l1):
        end else begin
          signedshort:=TSignedShort(pixelmatrix);
          k2:=0;
          while k2<l1 do
          begin
            abyte0[k2]:=byte1.lookupByte(signedshort.getSample(k2));
            Inc(k2);
          end;//end of while(k2<l1):
        end;//end of if(pixelmatrix is TUnsignedShort)
        dicomobject.AddVariant(475,(8));
      end;//end of if(j1>8)
    end else begin
      if j1>8 then
      begin
        short2:=LUTFactory.createShortLUT(pixelmatrix.getMinVal(),pixelmatrix.getMaxVal(),k1,flag1,dicomobject,dicomobject,dicomobject1);
        SetLength(abyte0 , 2*l1){ShortInt[2*l1]};
        l2:=0;
        if pixelmatrix is TUnsignedByte then
        begin
          unsignedbyte1:=TUnsignedByte(pixelmatrix);
          i4:=0;
          while i4<l1 do
          begin
            word2:=short2.lookupShort(unsignedbyte1.getSample(i4));
            abyte0[PostInc(l2)]:=ShortInt(word2);
            abyte0[PostInc(l2)]:=ShortInt((word2 shr{1} 8));
            Inc(i4);
          end;//end of while(i4<l1):
        end else begin
          signedbyte1:=TSignedByte(pixelmatrix);
          j4:=0;
          while j4<l1 do
          begin
            word3:=short2.lookupShort(signedbyte1.getSample(j4));
            abyte0[PostInc(l2)]:=ShortInt(word3);
            abyte0[PostInc(l2)]:=ShortInt((word3 shr{1} 8));
            Inc(j4);
          end;//end of while(j4<l1):
        end;//end of if(pixelmatrix is TUnsignedByte)
        dicomobject.AddVariant(475,16);
      end else begin
        byte1_1:=LUTFactory.createByteLUT(pixelmatrix.getMinVal(),pixelmatrix.getMaxVal(),k1,flag1,dicomobject,dicomobject,dicomobject1);
        SetLength(abyte0 , l1){ShortInt[l1]};
        if pixelmatrix is TUnsignedByte then
        begin
          unsignedbyte:=TUnsignedByte(pixelmatrix);
          i3:=0;
          while i3<l1 do
          begin
            abyte0[i3]:=byte1_1.lookupByte(unsignedbyte.getSample(i3));
            PostInc(i3);
          end;//end of while(i3<l1):
        end else begin
          signedbyte:=TSignedByte(pixelmatrix);
          j3:=0;
          while j3<l1 do
          begin
            abyte0[j3]:=byte1_1.lookupByte(signedbyte.getSample(j3));
            PostInc(j3);
          end;
        end;
        dicomobject.set(475,(8));
      end;
    end;
    dicomobject.set(462,'MONOCHROME2');
    dicomobject.set(476,(j1));
    dicomobject.set(477,(j1-1));
    dicomobject.set(478,(0));
    dicomobject.set(1184,abyte0);
    result := dicomobject;}
end;

function TPrintManagementUtils.preformatGrayscale(dicomobject: TDicomAttributes; dicomobject1: TDicomAttributes; i: Integer; j: Integer): TDicomAttributes;
begin
  result := preformatGrayscale(dicomobject, dicomobject1, i, j, TRUE);
end;

function TPrintManagementUtils.setPixelAspectRatio(dicomobject: TDicomAttributes; flag: Boolean): Boolean;
var
  float1: Double;
  float2: Double;
  i: Integer;
  j: Integer;
begin
  {  if dicomobject.getSize(473) = 2 then
    begin
      result := FALSE;
      exit;
    end;
    if dicomobject.getSize(470) = 2 then
    begin
      float1:=TFloat(dicomobject.get(470,0));
      float2:=(dicomobject.get(470,1));
    end else begin
      if dicomobject.getSize(308) = 2 then
      begin
        float1:=(dicomobject.get(308,0));
        float2:=(dicomobject.get(308,1));
      end else begin
        result := FALSE;
        exit;
      end;
    end;
    i:=Integer((float1.floatValue()*1000F));
    j:=Integer((float2.floatValue()*1000F));
    if i = j then
    begin
      if  not flag then
      begin
        result := FALSE;
        exit;
      end;
      j:=1;
      i:=j;
    end;
    dicomobject.set(473,(i),0);
    dicomobject.set(473,(j),1);
    result := TRUE;}
end;

function TPrintManagementUtils.setPixelAspectRatio(dicomobject: TDicomAttributes): Boolean;
begin
  result := setPixelAspectRatio(dicomobject, TRUE);
end;

function TPrintManagementUtils.getPixelModule(dicomobject: TDicomAttributes): TDicomAttributes;
var
  dicomobject1: TDicomAttributes;
begin
  dicomobject1 := TDicomAttributes.Create;
  //  copyAttributs(dicomobject,dicomobject1,PIXELMODULE_DNAMES);
  if dicomobject.getInteger(461) > 1 then
  begin
    //    dicomobject1.AddVariant(463,dicomobject.get(463));
  end;
  result := dicomobject1;
end;

function TPrintManagementUtils.getPresentationLUTModule(dicomobject: TDicomAttributes): TDicomAttributes;
var
  dicomobject1: TDicomAttributes;
begin
  dicomobject1 := TDicomAttributes.Create;
  //  copyAttributs(dicomobject,dicomobject1,PLUTMODULE_DNAMES);
  result := dicomobject1;
end;

procedure TPrintManagementUtils.copyAttributs(dicomobject: TDicomAttributes; dicomobject1: TDicomAttributes; ai: TDCMIntegerArray);
var
  k: Integer;
  i: Integer;
  j: Integer;
  l: Integer;
begin
  k := 0;
  while k < length(ai) do
  begin
    i := ai[k]; //Add from the after centance
    //    j:=dicomobject.getSize(i);
    //    dicomobject1.deleteItem(i);
    l := 0;
    while l < j do
    begin
      //      dicomobject1.append(i,dicomobject.get(i,l));
      Inc(l);
    end;
    Inc(k);
  end;
end;

function TPrintManagementUtils.getRequestedImageSize(dicomobject: TDicomAttributes; f: real): AnsiString;
var
  float1: Double;
begin
  //  float1:=dicomobject.get(470,1);
  if float1 = 0 then
  begin
    //    float1:=dicomobject.get(308,1);
  end;
  if float1 <> 0 then
  begin
    //    result := ''+real(dicomobject.getI(467))*float1.floatValue()*f;
  end
  else
  begin
    result := '';
  end;
end;

procedure TPrintManagementUtils.setFilmSession(dicomobject: TDicomAttributes; properties: TProperties);
begin
  setFilmSessionCreateAttribs(dicomobject, properties);
end;

procedure TPrintManagementUtils.setFilmSessionCreateAttribs(dicomobject: TDicomAttributes; properties: TProperties);
begin
  //  set(dicomobject,705,properties.getProperty('Session.NumberOfCopies'));
  //  set(dicomobject,706,properties.getProperty('Session.PrintPriority'));
  //  set(dicomobject,707,properties.getProperty('Session.MediumType'));
  //  set(dicomobject,708,properties.getProperty('Session.FilmDestination'));
  //  set(dicomobject,709,properties.getProperty('Session.FilmSessionLabel'));
  //  set(dicomobject,710,properties.getProperty('Session.MemoryAllocation'));
  //  set(dicomobject,756,properties.getProperty('Session.OwnerID'));
end;

procedure TPrintManagementUtils.setFilmSessionSetAttribs(dicomobject: TDicomAttributes; properties: TProperties);
begin
  setFilmSessionCreateAttribs(dicomobject, properties);
end;

procedure TPrintManagementUtils.setFilmBox(dicomobject: TDicomAttributes; properties: TProperties);
begin
  setFilmBoxCreateAttribs(dicomobject, properties);
end;

procedure TPrintManagementUtils.setFilmBoxCreateAttribs(dicomobject: TDicomAttributes; properties: TProperties);
begin
  //  set(dicomobject,713,properties.getProperty('FilmBox.ImageDisplayFormat'));
  //  set(dicomobject,715,properties.getProperty('FilmBox.FilmOrientation'));
  //  set(dicomobject,716,properties.getProperty('FilmBox.FilmSizeID'));
  //  set(dicomobject,1363,properties.getProperty('FilmBox.RequestedResolutionID'));
  //  set(dicomobject,714,properties.getProperty('FilmBox.AnnotationDisplayFormatID'));
  setFilmBoxSetAttribs(dicomobject, properties);
end;

procedure TPrintManagementUtils.setFilmBoxSetAttribs(dicomobject: TDicomAttributes; properties: TProperties);
begin
  //  set(dicomobject,717,properties.getProperty('FilmBox.MagnificationType'));
  //  set(dicomobject,718,properties.getProperty('FilmBox.SmoothingType'));
  //  set(dicomobject,719,properties.getProperty('FilmBox.BorderDensity'));
  //  set(dicomobject,720,properties.getProperty('FilmBox.EmptyImageDensity'));
  //  set(dicomobject,721,properties.getProperty('FilmBox.MinDensity'));
  //  set(dicomobject,722,properties.getProperty('FilmBox.MaxDensity'));
  //  set(dicomobject,723,properties.getProperty('FilmBox.Trim'));
  //  set(dicomobject,724,properties.getProperty('FilmBox.ConfigurationInformation'));
  //  set(dicomobject,1236,properties.getProperty('FilmBox.Illumination'));
  //  set(dicomobject,1237,properties.getProperty('FilmBox.ReflectedAmbientLight'));
end;

procedure TPrintManagementUtils.setImageBox(dicomobject: TDicomAttributes; properties: TProperties);
begin
  setImageBoxSetAttribs(dicomobject, properties);
end;

procedure TPrintManagementUtils.setImageBoxSetAttribs(dicomobject: TDicomAttributes; properties: TProperties);
begin
  //  set(dicomobject,730,properties.getProperty('ImageBox.Polarity'));
  //  set(dicomobject,717,properties.getProperty('ImageBox.MagnificationType'));
  //  set(dicomobject,718,properties.getProperty('ImageBox.SmoothingType'));
  //  set(dicomobject,721,properties.getProperty('ImageBox.MinDensity'));
  //  set(dicomobject,722,properties.getProperty('ImageBox.MaxDensity'));
  //  set(dicomobject,724,properties.getProperty('ImageBox.ConfigurationInformation'));
  //  set(dicomobject,1362,properties.getProperty('ImageBox.RequestedDecimateCropBehavior'));
  //  set(dicomobject,731,properties.getProperty('ImageBox.RequestedImageSize'));
end;

procedure TPrintManagementUtils.addReferencedPresentationLUT(dicomobject: TDicomAttributes; s: AnsiString);
var
  dicomobject1: TDicomAttributes;
begin
  dicomobject1 := TDicomAttributes.Create;
  dicomobject1.AddVariant(115, UIDS.AsString(4145));
  dicomobject1.AddVariant(116, s);
  //  dicomobject.AddVariant(1241,dicomobject1);
end;

procedure TPrintManagementUtils.addReferencedImageOverlayBox(dicomobject: TDicomAttributes; s: AnsiString);
var
  dicomobject1: TDicomAttributes;
begin
  dicomobject1 := TDicomAttributes.Create();
  dicomobject1.AddVariant(62, UIDS.AsString(4160));
  dicomobject1.AddVariant(63, s);
  //  dicomobject.append(734,dicomobject1);
end;

function TPrintManagementUtils.rescaleLUTtoFitBitDepth(dicomobject: TDicomAttributes; i: Integer): TDicomAttributes;
var
  j: Integer;
  k: Integer;
  short1: Shortint;
  short2: Shortint;
  abyte0: TShortIntArray;
  l: Integer;
  i1: Integer;
  word0: Smallint;
begin
  { if dicomobject.getSize(506) <> 3 then
    begin
      raise Exception.Create('Missing or Invalid LUT Descriptor'){DicomException};
    end;
    j:=1 shl i;
    k:=dicomobject.getI(506,0);
    if j = k then
    begin
      result := dicomobject;
      exit;
    end;
    short1:=(LUTFactory.createLUT(dicomobject));
    short2:=(short1.rescaleLength(j));
    dicomobject.AddVariant(506,(j),0);
    dicomobject.deleteItem(509);
    SetLength(abyte0 , j shl 1){ShortInt[j shl 1]};
    l:=0;
    i1:=0;
    while i1<j do
    begin
      word0:=short2.lookupShort(i1);
      inc(l);
      abyte0[(l)]:=ShortInt(word0);
      inc(l);
      abyte0[(l)]:=ShortInt((word0 shr{1} 8));
      Inc(i1);
    end;
    dicomobject.AddVariant(509,abyte0);
    result := dicomobject;}
end;

function TPrintManagementUtils.preformatColor(dicomobject: TDicomAttributes): TDicomAttributes;
var
  //  pixelmatrix : TPixelMatrix;
  abyte0: TShortIntArray;
begin
  {  pixelmatrix:=TPixelMatrix.create(dicomobject);
    if pixelmatrix.isRGB() then
    begin
      if  not (pixelmatrix is TUnsignedByte) then
      begin
        raise Exception.Create('RGB with '+pixelmatrix){UnsupportedOperationException};
      end else begin
  //      result := TestAndReturn(pixelmatrix.isColorByPlane(),dicomobject,fromPixelToPlane(dicomobject));
        exit;
      end;
    end;
    if  not pixelmatrix.isPaletteColor() then
    begin
      raise Exception.Create('Photometric Interpretation '+pixelmatrix.getPhotometricInterpretation());
    end;
    SetLength(abyte0 , pixelmatrix.getPixelsPerFrame()*3){ShortInt[pixelmatrix.getPixelsPerFrame()*3]};
    fillPaneFromPalette(pixelmatrix,pixelmatrix.getRedPalette(),abyte0,0);
    fillPaneFromPalette(pixelmatrix,pixelmatrix.getGreenPalette(),abyte0,1);
    fillPaneFromPalette(pixelmatrix,pixelmatrix.getBluePalette(),abyte0,2);
    dicomobject.AddVariant(461,(3));
    dicomobject.AddVariant(462,'RGB');
    dicomobject.AddVariant(463,(1));
    dicomobject.AddVariant(475,(8));
    dicomobject.AddVariant(476,(8));
    dicomobject.AddVariant(477,(7));
    dicomobject.AddVariant(1184,abyte0);
    result := dicomobject;}
end;

function TPrintManagementUtils.fromPixelToPlane(dicomobject: TDicomAttributes): TDicomAttributes;
var
  abyte0: TShortIntArray;
  abyte1: TShortIntArray;
  i: Integer;
  j: Integer;
  k: Integer;
  l: Integer;
  i1: Integer;
  j1: Integer;
begin
  {  abyte0:=ShortInt(dicomobject.get(1184));
    SetLength(abyte1 , abyte0.length){ShortInt[abyte0.length]};
    i:=abyte0.length*3;
    j:=0;
    k:=0;
    l:=i;
    i1:=i shl 1;
    j1:=0;
    while j1<i do
    begin
      abyte1[Inc(k)]:=abyte0[Inc(j)];
      abyte1[Inc(l)]:=abyte0[Inc(j)];
      abyte1[Inc(i1)]:=abyte0[Inc(j)];
      Inc(j1);
    end;
    dicomobject.AddVariant(463,(1));
    dicomobject.AddVariant(1184,abyte1);}
  result := dicomobject;
end;

{procedure TPrintManagementUtils.fillPaneFromPalette(pixelmatrix:TPixelMatrix;abyte0 : TShortIntArray;abyte1 : TShortIntArray;i:Integer);
var
  j : Integer;
  k : Integer;
  l : Integer;
begin
  j:=0;
  k:=pixelmatrix.getPixelsPerFrame();
  l:=k*i;
  while j<k do
  begin
    abyte1[l]:=abyte0[pixelmatrix.getSample(j)];
    Inc(j);
    Inc(l);
  end;
end;}

function TPrintManagementUtils.colorToGrayscale(dicomobject: TDicomAttributes): TDicomAttributes;
var
  i: Integer;
  j: Integer;
  byte0: ShortInt;
  abyte0: TShortIntArray;
  abyte1: TShortIntArray;
  k: Integer;
  l: Integer;
  i1: Integer;
  j1: Integer;
begin
  if dicomobject.getInteger(461) <> 3 then
  begin
    raise Exception.Create('SamplesPerPixel != 3');
  end;
  if 'RGB' <> dicomobject.getString(462) then
  begin
    raise Exception.Create('dPhotometricInterpretation != "RGB"');
  end;
  if dicomobject.getInteger(475) <> 8 then
  begin
    raise Exception.Create('dBitsAllocated != 8');
  end;
  if dicomobject.getInteger(476) <> 8 then
  begin
    raise Exception.Create('dBitsStored != 8');
  end;
  if dicomobject.getInteger(477) <> 7 then
  begin
    raise Exception.Create('dHighBit != 7');
  end;
  if dicomobject.getInteger(478) <> 0 then
  begin
    raise Exception.Create('dPixelRepresentation != 0');
  end;
  i := dicomobject.getInteger(466) * dicomobject.getInteger(467);
  j := 1;
  byte0 := 3;
  if dicomobject.getInteger(463) <> 0 then
  begin
    j := i;
    byte0 := 1;
  end;
  //  abyte0:=dicomobject.getInteger(1184);
  SetLength(abyte1, i) {ShortInt[i]};
  k := 0;
  l := k + j;
  i1 := l + j;
  j1 := 0;
  while j1 < i do
  begin
    abyte1[j1] := ShortInt(((((abyte0[k]) and ($FF)) + ((abyte0[l]) and ($FF)) + ((abyte0[i1]) and ($FF))) * 3));
    Inc(j1);
    k := k + byte0;
    l := l + byte0;
    i1 := i1 + byte0;
  end;
  dicomobject.AddVariant(461, 1);
  dicomobject.AddVariant(462, 'MONOCHROME2');
  //  dicomobject.deleteItem(463);
  //  dicomobject.deleteItem(490);
  //  dicomobject.deleteItem(489);
  //  dicomobject.deleteItem(487);
  //  dicomobject.deleteItem(488);
  //  dicomobject.AddVariant(1184,abyte1);
  result := dicomobject;
end;

function TPrintManagementUtils.grayscaleToColor(dicomobject: TDicomAttributes): TDicomAttributes;
var
  abyte0: TShortIntArray;
  i: Integer;
  abyte1: TShortIntArray;
begin
  if dicomobject.getInteger(461) <> 1 then
  begin
    raise Exception.Create('SamplesPerPixel != 1');
  end;
  if 'MONOCHROME2' <> dicomobject.getString(462) then
  begin
    raise Exception.Create('dPhotometricInterpretation != "MONOCHROME2"');
  end;
  if dicomobject.getInteger(475) <> 8 then
  begin
    raise Exception.Create('dBitsAllocated != 8');
  end;
  if dicomobject.getInteger(476) <> 8 then
  begin
    raise Exception.Create('dBitsStored != 8');
  end;
  if dicomobject.getInteger(477) <> 7 then
  begin
    raise Exception.Create('dHighBit != 7');
  end;
  if dicomobject.getInteger(478) <> 0 then
  begin
    raise Exception.Create('dPixelRepresentation != 0');
  end
  else
  begin
    //    abyte0:=ShortInt(dicomobject.get(1184));
    i := Length(abyte0);
    SetLength(abyte1, i * 3) {ShortInt[i*3]};
    //    System.arraycopy(abyte0,0,abyte1,0,i);
    //    System.arraycopy(abyte0,0,abyte1,i,i);
    //    System.arraycopy(abyte0,0,abyte1,i*2,i);
    dicomobject.AddVariant(461, 3);
    dicomobject.AddVariant(462, 'RGB');
    dicomobject.AddVariant(463, 1);
    //    dicomobject.AddVariant(1184,abyte1);
    result := dicomobject;
  end;
end;

constructor TDicomMessage.Create(byte0: ShortInt; uidentry: TUIDEntry; dicomobject, dicomobject1: TDicomAttributes);
var
  i: Integer;
begin
  _pcid := byte0;
  _asuid := uidentry;
  for i := 0 to dicomobject.Count - 1 do
  begin
    Add(dicomobject.ItemByIndex[i]);
  end;
  setDataset(dicomobject1);
end;

constructor TDicomMessage.Create(byte0: ShortInt; uidentry: TUIDEntry; ACommandID, AMessageID: Integer; dicomobject: TDicomAttributes);
begin
  _pcid := byte0;
  _asuid := uidentry;
  AddVariant(dCommandField, ACommandID);
  if ((ACommandID) and ($8E00)) <> 0 then
    AddVariant(dMessageIDBeingRespondedTo, AMessageID)
  else
    AddVariant(dMessageID, AMessageID);
  setDataset(dicomobject);
end;

constructor TDicomMessage.Create(byte0: ShortInt; ACommandID, AMessageID: Integer; dicomobject: TDicomAttributes);
begin
  _pcid := byte0;
  AddVariant(dCommandField, ACommandID); //commandID
  if ((ACommandID) and ($8E00)) <> 0 then
    AddVariant(dMessageIDBeingRespondedTo, AMessageID)
  else
    AddVariant(dMessageID, AMessageID);
  setDataset(dicomobject);
end;

constructor TDicomMessage.Create(ACommandID, AMessageID: Integer; dicomobject: TDicomAttributes);
begin
  AddVariant(dCommandField, ACommandID);
  if ((ACommandID) and ($8E00)) <> 0 then
    AddVariant(dMessageIDBeingRespondedTo, AMessageID)
  else
    AddVariant(dMessageID, AMessageID);
  setDataset(dicomobject);
end;

procedure TDicomMessage.setDataset(dicomobject: TDicomAttributes);
begin
  try
    _dataset := dicomobject;
    if _dataset <> nil then
      AddVariant(dDataSetType, 65278)
    else
      AddVariant(dDataSetType, 257);
  except
    on dicomexception: Exception do
    begin
      raise Exception.Create(dicomexception.Message);
    end
  end;
end;

function TDicomMessage.getPresentationContext: ShortInt;
begin
  result := _pcid;
end;

function TDicomMessage.getAbstractSyntax: TUIDEntry;
begin
  result := _asuid;
end;

function TDicomMessage.getDataset: TDicomAttributes;
begin
  result := _dataset;
end;

procedure TDicomMessage.affectedSOPclassUID(s: AnsiString);
begin
  AddVariant(1, s);
end;

procedure TDicomMessage.affectedSOP(s: AnsiString; s1: AnsiString);
begin
  AddVariant(1, s);
  AddVariant(13, s1);
end;

procedure TDicomMessage.requestedSOP(s: AnsiString; s1: AnsiString);
begin
  AddVariant(2, s);
  AddVariant(14, s1);
end;

procedure TDicomMessage.priority(i: Integer);
begin
  AddVariant(7, i);
end;

procedure TDicomMessage.eventTypeID(i: Integer);
begin
  AddVariant(15, i);
end;

procedure TDicomMessage.actionTypeID(i: Integer);
begin
  AddVariant(18, i);
end;

procedure TDicomMessage.status(i: Integer);
begin
  AddVariant(9, i);
end;

procedure TDicomMessage.moveDestination(s: AnsiString);
begin
  AddVariant(6, s);
end;

procedure TDicomMessage.attributeIdList(ai: TDCMIntegerArray);
var
  i: Integer;
begin
  i := 0;
  while i < length(ai) do
  begin
    AddVariant(16, ai[i]);
    Inc(i);
  end;
end;

procedure TDicomMessage.moveOriginator(s: AnsiString; i: Integer);
begin
  AddVariant(23, s);
  AddVariant(24, i);
end;
*)
/////////////////////////////////////////////////////////////////////////////////////////
// TKXList

function IMax(v1, v2: Integer): Integer;
asm
	cmp	edx,eax
	jng	@1
	mov	eax,edx
@1:
end;

function IMin(v1, v2: Integer): Integer;
asm
	cmp	eax,edx
	jng	@1
	mov	eax,edx
@1:
end;

constructor TKXList.Create;
begin
  inherited;
  fData := nil;
  Clear;
end;

destructor TKXList.Destroy;
begin
  freemem(fData);
end;

procedure TKXList.Clear;
begin
  fCount := 0;
  if assigned(fData) then
    freemem(fData);
  fData := nil;
  fChanged := [];
end;

procedure TKXList.SetCount(v: integer);
var
  xData: pointer;
begin
  getmem(xData, v * fItemSize);
  if assigned(fData) then
  begin
    move(pbyte(fData)^, pbyte(xData)^, imin(fCount, v) * fItemSize);
    freemem(fData);
  end;
  fData := xData;
  fCount := v;
  fChanged := fChanged + [ielItems];
end;

procedure TKXList.Delete(idx: integer);
var
  xData: pointer;
  q: integer;
  psrc, pdst: pbyte;
begin
  if (idx >= 0) and (idx < fCount) then
  begin
    getmem(xData, (fCount - 1) * fItemSize);
    psrc := fData;
    pdst := xData;
    for q := 0 to fCount - 1 do
    begin
      if q <> idx then
      begin
        // copy
        move(psrc^, pdst^, fItemSize);
        inc(pdst, fItemSize);
      end;
      inc(psrc, fItemSize);
    end;
    freemem(fData);
    fData := xData;
    dec(fCount);
    fChanged := fChanged + [ielItems];
  end;
end;

procedure TKXList.InsertItem(idx: integer; v: pointer);
var
  xData: pointer;
  q: integer;
  psrc, pdst: pbyte;
begin
  if idx < fCount then
  begin
    inc(fCount);
    getmem(xData, fCount * fItemSize);
    psrc := fData;
    pdst := xData;
    for q := 0 to fCount - 1 do
    begin
      if q <> idx then
      begin
        // copy
        move(psrc^, pdst^, fItemSize);
        inc(psrc, fItemSize);
      end
      else
        // insert
        move(pbyte(v)^, pdst^, fItemSize);
      inc(pdst, fItemSize);
    end;
    freemem(fData);
    fData := xData;
    fChanged := fChanged + [ielItems];
  end
  else
    AddItem(v);
end;

function TKXList.IndexOfItem(v: pointer): integer;
var
  pp: pbyte;
begin
  pp := fData;
  for result := 0 to fCount - 1 do
  begin
    if CompareMem(pp, v, fItemSize) then
      exit;
    inc(pp, fItemSize);
  end;
  result := -1;
end;

function TKXList.AddItem(v: pointer): integer;
begin
  result := fCount;
  SetCount(fCount + 1);
  move(pbyte(v)^, pbyte(integer(fData) + result * fItemSize)^, fItemSize);
  fChanged := fChanged + [ielItems];
end;

function TKXList.BaseGetItem(idx: integer): pointer;
begin
  result := pointer(integer(fData) + idx * fItemSize)
end;

procedure TKXList.BaseSetItem(idx: integer; v: pointer);
begin
  if idx < fCount then
  begin
    move(pbyte(v)^, pbyte(integer(fData) + idx * fItemSize)^, fItemSize);
    fChanged := fChanged + [ielItems];
  end;
end;

procedure TKXList.Assign(Source: TKXList);
begin
  fCount := Source.fCount;
  fItemSize := Source.fItemSize;
  fChanged := Source.fChanged;
  if assigned(fData) then
    freemem(fData);
  getmem(fData, fItemSize * fCount);
  move(pbyte(Source.fData)^, pbyte(fData)^, fItemSize * fCount);
end;

/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
// TKXIntegerList

procedure TKXIntegerList.Assign(Source: TKXList);
begin
  inherited;
  fRangeMin := (Source as TKXIntegerList).fRangeMin;
  fRangeMax := (Source as TKXIntegerList).fRangeMax;
  fRangeStep := (Source as TKXIntegerList).RangeStep;
  fCurrentValue := (Source as TKXIntegerList).fCurrentValue;
end;

function TKXIntegerList.Add(v: Integer): integer;
begin
  result := AddItem(@v);
end;

procedure TKXIntegerList.Clear;
begin
  inherited;
  fRangeMin := 0;
  fRangeMax := 0;
  fRangeStep := 0;
  fCurrentValue := 0;
  fItemSize := sizeof(Integer);
end;

function TKXIntegerList.GetItem(idx: integer): Integer;
begin
  result := PInteger(BaseGetItem(idx))^;
end;

procedure TKXIntegerList.SetItem(idx: integer; v: Integer);
begin
  BaseSetItem(idx, @v);
end;

procedure TKXIntegerList.Insert(idx: integer; v: Integer);
begin
  InsertItem(idx, @v);
end;

function TKXIntegerList.IndexOf(v: Integer): integer;
begin
  result := IndexOfItem(@v);
end;

procedure TKXIntegerList.SetRangeMin(v: integer);
begin
  fRangeMin := v;
  fChanged := fChanged + [ielRange];
end;

procedure TKXIntegerList.SetRangeMax(v: integer);
begin
  fRangeMax := v;
  fChanged := fChanged + [ielRange];
end;

procedure TKXIntegerList.SetRangeStep(v: integer);
begin
  fRangeStep := v;
  fChanged := fChanged + [ielRange];
end;

procedure TKXIntegerList.SetCurrentValue(v: integer);
begin
  fCurrentValue := v;
  fChanged := fChanged + [ielCurrentValue];
end;

constructor TDicomMemoryStream.Create(AData: AnsiString);
begin
  FStm := TMemoryStream.Create;
  if Length(AData) > 0 then
  begin
    FStm.Write(AData[1], Length(AData));
    FStm.Position := 0;
  end;
  FSelfCreateStream := true;
end;

constructor TDicomMemoryStream.Create(AStm: TStream);
begin
  FStm := AStm;
  FSelfCreateStream := false;
end;

destructor TDicomMemoryStream.Destroy;
begin
  if FSelfCreateStream then
    FStm.Free;
  inherited;
end;

function TDicomMemoryStream.ReadBuffer(Buffer: Pointer; ACount: Integer): integer;
begin
  inc(SendDataCount, ACount);

  Result := FStm.Read(Buffer^, ACount)
end;

procedure TDicomMemoryStream.WriteBuffer(Buffer: Pointer; ACount: Integer);
begin
  inc(ReceiveDataCount, ACount);

end;

procedure TDicomMemoryStream.WriteStream(AStream: TStream);
begin
  //  FSocket.
end;

function TDicomMemoryStream.ReadStream(AStream: TStream): Boolean;
begin
  Result := false;
end;

procedure TDicomMemoryStream.AddString(AData: AnsiString);
begin
  FStm.Write(AData[1], Length(AData));
end;

procedure TDicomMemoryStream.ResetPosition;
begin
  FStm.Position := 0;
end;

constructor TAssociateFilePdu.Create;
begin
  FItemType := $44;
  FList := TList.Create;
  FCommand := nil;
  FFileNameList := TStringList.Create;
end;

procedure TAssociateFilePdu.Add(AStream: TStream);
begin
  FList.Add(AStream);
end;

procedure TAssociateFilePdu.Clear;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
  begin
    TStream(FList[i]).Free;
  end;
  FList.Clear;
end;

procedure TAssociateFilePdu.ClearArray;
begin
  FList.Clear;
end;

procedure TAssociateFilePdu.SetCommand(ACommand: TDicomAttributes);
begin
  FCommand := ACommand;
end;

function TAssociateFilePdu.GetStream(Index: Integer): TStream;
begin
  if (Index >= 0) and (Index < FList.Count) then
    Result := TStream(FList[Index])
  else
    Result := nil;
end;

function TAssociateFilePdu.GetCount: Integer;
begin
  Result := FList.Count;
end;

destructor TAssociateFilePdu.Destroy;
var i:Integer;
begin
  Clear;

  // 25.07.2012 FOMIN
  for I := 0 to FList.Count - 1 do // Iterate
  begin
    TSubItem(FList[i]).Free;
  end;
  FList.Free;
  FFileNameList.Free;

  if assigned(FCommand) then
    FCommand.Free;
  inherited;
end;

procedure TAssociateFilePdu.write(dataoutputstream: TDicomIOStream);
var
  i: integer;
  stm1: TStream;
  stm2: TMemoryStream;
begin
  dataoutputstream.writeInt8(FItemType);

  dataoutputstream.writeInt8(0);
  dataoutputstream.writeInt32(FList.Count + 1);

  {  dataoutputstream.writeString(FCalledTitle);
    k := 0;
    while k < 16 - Length(FCalledTitle) do
    begin
      outputstream.writeint8(32);
      Inc(k);
    end;}
  if assigned(FCommand) then
  begin
    stm2 := TMemoryStream.Create;
    FCommand.Write(stm2, ExplicitVRLittleEndian, 100);
    stm2.Position := 0;
    dataoutputstream.WriteStream(Stm2);
    stm2.Free;

  end;

  for i := 0 to FList.Count - 1 do
  begin
    stm1 := TStream(FList[i]);
    dataoutputstream.WriteStream(Stm1);
    if dataoutputstream.ReadInt32 = 0 then
      exit;
  end;

  for i := 0 to FFileNameList.Count - 1 do
  begin
    {stm1 := TFileStream.Create(FFileNameList[i], fmOpenRead + fmShareDenyWrite);
    try
      dataoutputstream.WriteStream(Stm1);
    finally
      stm1.Free;
    end; }
    dataoutputstream.WriteFile(FFileNameList[i]);

    if dataoutputstream.ReadInt32 = 0 then
      exit;
  end;
end;

procedure TAssociateFilePdu.readData(inputstream: TDicomIOStream; AStream: TStream);
begin
  inputstream.ReadStream(AStream);
end;

procedure TAssociateFilePdu.readCommand(inputstream: TDicomIOStream; AItemType: Integer);
var
  i: Integer;
  //  ftm1: TFileStream;
  fCmd1: TMemoryStream;
begin
  i := AItemType;
  if i <> FItemType then
  begin
    raise Exception.Create('PDU-type field of Associate Reject PDU not ' +
      IntToStr(FItemType)) {IllegalValueException};
  end
  else
  begin
    inputstream.readint8;
    FReceiveCount := inputstream.readInt32;
    if FReceiveCount > 0 then
    begin
      fCmd1 := TMemoryStream.Create;
      inputstream.ReadStream(fCmd1);
      FCommand := TDicomAttributes.Create;
      fCmd1.Position := 0;
      FCommand.ReadDataPDUData(0, fCmd1, ExplicitVRLittleEndian);
      fCmd1.Free;
    end;
  end;
end;

/////////////////////////////////////////////////////////////////////////////////////////

procedure TAssociation.SetReceiveTimeout(Value: Integer);
begin
  fReceiveTimeout := Value;
  FStream.ReceiveTimeout := Value;
end;

procedure TDicomIOStream.SetReceiveTimeout(Value: Integer);
begin
  fReceiveTimeout := Value;

end;

procedure TDicomIOStream.SetPDUSize(Value: Integer);
begin
  fPDUSize := Value;
end;

procedure TAssociation.SetReturnStatus(const Value: Integer);
begin
  FReturnStatus := Value;
end;

procedure TAssociation.SetResponseCommand(const Value: TDicomAttributes);
begin
  FResponseCommand := Value;
end;

function TDicomIOStream.ReadChar: Char;
begin
  ReadBuffer(@Result, SizeOf(char));
end;

{$IFDEF DICOMINDYCLIENT}

constructor TDicomTCPSocketStream.Create(ASocket: TCnsTCPConnection);
begin
  inherited Create;
  FSocket := ASocket;

end;

procedure TDicomTCPSocketStream.FreshData;
begin
  if FSocket.Connected then
    FSocket.FlushWriteBuffer;
end;

destructor TDicomTCPSocketStream.Destroy;
begin
  inherited Destroy;
end;

function TDicomTCPSocketStream.ReadBuffer(Buffer: Pointer; ACount: Integer): Integer;
begin
  inc(SendDataCount, ACount);

  FSocket.ReadBuffer(Buffer^, ACount);
  Result := ACount;
end;

procedure TDicomTCPSocketStream.WriteBuffer(Buffer: Pointer; ACount: Integer);
begin
  inc(ReceiveDataCount, ACount);
  FSocket.WriteBuffer(Buffer^, ACount, false);
end;

procedure TDicomTCPSocketStream.WriteStream(AStream: TStream);
begin
  AStream.Position := 0;
  self.WriteInt32(AStream.Size);
  FSocket.WriteStream(AStream);
end;

function TDicomTCPSocketStream.ReadStream(AStream: TStream): Boolean;
var
  i: integer;
begin
  i := self.ReadInt32;
  FSocket.ReadStream(AStream, i);
end;
{$ENDIF}

{$IFDEF DICOMVCSCLIENT}

procedure TDicomVCSSocketStream.FreshData;
begin

end;

constructor TDicomVCSSocketStream.Create(ASocket: TCustomWSocket);
begin
  inherited Create;
  FSocket := ASocket;

end;

destructor TDicomVCSSocketStream.Destroy;
begin
  inherited Destroy;

end;

function TDicomVCSSocketStream.ReadBuffer(Buffer: Pointer; ACount: Integer): integer;
begin
  inc(SendDataCount, ACount);

  Result := FSocket.Receive(Buffer, ACount);
end;

procedure TDicomVCSSocketStream.WriteBuffer(Buffer: Pointer; ACount: Integer);
begin
  inc(ReceiveDataCount, ACount);
  FSocket.Send(Buffer, ACount);
end;

procedure TDicomVCSSocketStream.WriteStream(AStream: TStream);
begin

end;

function TDicomVCSSocketStream.ReadStream(AStream: TStream): Boolean;
begin

end;

procedure TDicomVCSSocketStream.SetPDUSize(Value: Integer);
begin
  inherited;

end;

{$ENDIF}

initialization
  DicomStatus := TStatus.Create;
  DefaultMaxPdu := 0;
  SendDataCount := 0;
  ReceiveDataCount := 0;
  PDUTempFileIndex := 0;
  v_mn_timeout:=120000;
  v_is_raise_exceptions:=True;
  v_is_conn_log := False;
  //
  if PDUTempPath='' then
  begin
    PDUTempPath:=Trim(GetTempDirectory);
    if Copy(PDUTempPath,Length(PDUTempPath),1)='\' then
      PDUTempPath:=Copy(PDUTempPath,1,Length(PDUTempPath)-1);
  end;
  //
finalization
  DicomStatus.Free;
end.

