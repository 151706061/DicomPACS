{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_Server;
{$I DicomPack.inc}

interface
{.$DEFINE DICOMDEBUGZ}
uses
  Classes, SysUtils, DB, windows,
  DCM_Connection, DCM_Attributes, DCM_UID, DCM_Dict, cnssqldata, KXString,
  {$IFNDEF LEVEL6}filectrl, {$ENDIF}DCM_ImageData_Bitmap,
  {$IFDEF DICOMDEBUGZ}DbugIntf, {$ENDIF}printers, Graphics, Forms, DCM_MemTable,
  DCM_MemBinaryStreamFormat, CnsSQLParser, cnsmsg,
  {$IFDEF DICOMINDYCLIENT}CnsTCPConnection, IndyServerCore, {$ELSE}
  {$IFDEF DICOMVCSCLIENT}OverbyteIcsWinsock, OverbyteIcsWSocket, OverbyteIcsWSockBuf, OverbyteIcsServerCore,
  {$ELSE}KxThread, KXSock, KXSockClient, KXServerCore{$ENDIF}{$ENDIF}, DICOM_charset, Uni, Variants,
  Oracle, DCM_log;

type

  TStoreThread = class(TThread)
  private
    Host : string;
    Port : integer;
    CalledTitle : string;
    CallingTitle : string;
    MaxPduSize : Integer;
    FTransferSyntaxs: array of TUIDEntry;
    FFileList : TStringList;
    FMyTransferSyntax: integer;
    protected
    procedure Execute; override;
  end;

  TDicomClientThread = class;
  TDicomRequestEvent = procedure(AClientThread: TDicomClientThread; AAddress: AnsiString; ACommand:
    TDicomAttributes; ARequestDatasets, AResponseDatasets: TList) of object;
  TDicomImageEvent = procedure(AClientThread: TDicomClientThread; AAddress: AnsiString; ADataset:
    TDicomDataset) of object;
  TDicomAssociationEvent = procedure(AClientThread: TDicomClientThread; AAddress: AnsiString; AReg:
    TRequest; var AHandleType: Integer) of object;
  TDicomLogitEvent = procedure(AClientThread: TDicomClientThread; AIP, Msg: AnsiString) of object;
  TDicomLogDBEvent = procedure(AClientThread: TDicomClientThread; AType, AIP, aDBStr, aSql: AnsiString; A1: TDicomAttributes) of object;
  TDicomLogExceptionEvent = procedure(AClientThread: TDicomClientThread; AIP, Msg: AnsiString) of object;

  TSaveDicomImageExEvent = procedure(AClientThread: TDicomClientThread; ADataset: TDicomAttributes; var AStm: TFileStream) of object;
  TDicomGetRequestExEvent = procedure(AClientThread: TDicomClientThread; rq: TDicomAttributes; ADstCommand: TDicomAttribute;
    AResponseStreams: TList; AResponseFiles: TStringList) of object;

  TThreadStringList = class
  private
    FStringList: TStringList;
    FLock: TRTLCriticalSection;
    function GetDuplicates: TDuplicates;
    procedure SetDuplicates(dup: TDuplicates);
    function GetCapacity: Integer;
    procedure SetCapacity(capa: Integer);
    function GetCommaText: AnsiString;
    procedure SetCommaText(const S: AnsiString);
    function GetCount: Integer;

    {$IFDEF LEVEL6}
    function GetDelimiter: Char;
    procedure SetDelimiter(delim: Char);
    function GetDelimitedText: AnsiString;
    procedure SetDelimitedText(const S: AnsiString);
    {$ENDIF}

    function GetNames(Index: Integer): AnsiString;
    function GetValues(const Name: AnsiString): AnsiString;
    procedure SetValues(const Name: AnsiString; S: AnsiString);
    function GetStrings(Index: Integer): AnsiString;
    procedure SetStrings(Index: Integer; S: AnsiString);
    function GetAsText: AnsiString;
    procedure SetAsText(S: AnsiString);
  public
    constructor Create;
    destructor Destroy; override;
    function LockList: TStringList;
    procedure UnlockList;
    function Add(const S: AnsiString): Integer;
    procedure AddStrings(Strings: TStrings);
    procedure Delete(Index: Integer);
    procedure Clear;
    procedure Exchange(Index1, Index2: Integer);
    function Find(const S: AnsiString; var Index: Integer): Boolean;
    procedure Insert(Index: Integer; const S: AnsiString);
    function IndexOf(const S: AnsiString): Integer;
    function IndexOfName(const Name: AnsiString): Integer;
    procedure Sort;
    function GetText: {$IFDEF LEVEL12}PWideChar{$ELSE}PAnsiChar{$ENDIF};
    procedure LoadFromFile(const FileName: AnsiString);
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToFile(const FileName: AnsiString);
    procedure SaveToStream(Stream: TStream);
    property Duplicates: TDuplicates read GetDuplicates write SetDuplicates;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property CommaText: AnsiString read GetCommaText write SetCommaText;
    property Count: Integer read GetCount;
    {$IFDEF LEVEL6}
    property Delimiter: Char read GetDelimiter write SetDelimiter;
    property DelimitedText: AnsiString read GetDelimitedText write SetDelimitedText;
    {$ENDIF}
    property Names[Index: Integer]: AnsiString read GetNames;
    property Values[const Name: AnsiString]: AnsiString read GetValues write SetValues;
    property Strings[Index: Integer]: AnsiString read GetStrings write SetStrings; default;
    property Text: AnsiString read GetAsText write SetAsText;
  end;

  TNetStreamCacheItem = class
  private
    fStream: TStream;

    FPosition: Integer;
    FHandle: Integer;
    FRequestHost: AnsiString;
    FLastOpTime: TDatetime;
    FCreateTime: TDatetime;
    procedure SetCreateTime(const Value: TDatetime);
    procedure SetHandle(const Value: Integer);
    procedure SetLastOpTime(const Value: TDatetime);
    procedure SetPosition(const Value: Integer);
    procedure SetRequestHost(const Value: AnsiString);
  public
    constructor Create(AStream: TStream);
    destructor Destroy; override;

    property LastOpTime: TDatetime read FLastOpTime write SetLastOpTime;
    property CreateTime: TDatetime read FCreateTime write SetCreateTime;
    property Handle: Integer read FHandle write SetHandle;
    property RequestHost: AnsiString read FRequestHost write SetRequestHost;
    property Position: Integer read FPosition write SetPosition;
    property Stream: TStream read fStream;
  end;
  TNetStreamCache = class
  private
   // fList: TThreadList;
    function GetStreams(index: Integer): TStream;
    procedure SetStreams(index: Integer; const Value: TStream);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    function AddStream(AStream: TStream): Integer;
    property Streams[index: Integer]: TStream read GetStreams write SetStreams;
  end;
  TDicomServerCore = class;
  TCustomDicomDatabaseOperator = class(TComponent)
  private
    FOnDicomLogit: TDicomLogitEvent;
    FOnDicomLogDB: TDicomLogDBEvent;
    FOnDicomLogException: TDicomLogExceptionEvent;

    fLogDatabaseSQL: Boolean;
    fDicomServerCore: TDicomServerCore;
    procedure LogDB(AType, AIP, aDBStr, aSql: AnsiString; A1: TDicomAttributes);
    procedure LogException(AIP, ErrorMsg: AnsiString);
  protected
    fStudiesTableName: AnsiString;
    fPatientTablename: AnsiString;
    fImagesTableName: AnsiString;
    fSeriesTableName: AnsiString;

    procedure Logit(AIP, Msg: AnsiString);
    function GetDicomServerCore: TDicomServerCore; virtual;
    procedure SetDicomServerCore(Value: TDicomServerCore); virtual;

    function SaveDatasetToStream(ADataset: TDataset; AFetchCount: Integer; AMemoFilter: TDicomAttribute): TStream;
    procedure kxmMemTable1OnFilterRecord(DataSet: TObject; var Accept: Boolean);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function SumitSQL(ADBStr, ASQL: AnsiString; AFetchCount: Integer; UseMultiDatabase: Boolean;
      Params: TDicomAttribute; AClientThread: TDicomClientThread=nil): TDataSet; virtual;

    procedure SumitSQLAndSaveTo(ADBStr, ASQL: AnsiString; AFetchCount: Integer; UseMultiDatabase: Boolean;
      Params: TDicomAttribute; AMemoFilter: TDicomAttribute; AResponseDataset: TDicomAttributes;
      AResponseList: TList; ARequestType: Integer); virtual;

    procedure ExecSQL(ADBStr, ASQL: AnsiString; Params: TDicomAttribute; AClientThread: TDicomClientThread=nil); virtual;
    procedure AddServerObject(Sender: TObject; AList: TList); virtual;
    procedure ExecProc(ADBStr, AStorageProc, AOutput: AnsiString; AParams: TDicomAttribute; var
      AResult: AnsiString); virtual;
    procedure GetGenID(ADatabaseName, ATableName,
      Fieldname: AnsiString; AutoInc: Boolean; ASetValue: Integer; var AResult: Integer); virtual;
    procedure GetTableFieldNames(ADBStr, ATableName: AnsiString; AStrs: TStrings); virtual;
    procedure GetTableNames(ADBstr: AnsiString; AStrs: TStrings); virtual;
    function GetDBType(ADatabaseName: AnsiString): Integer; virtual;
    function GetDBParam(ADatabaseName: AnsiString): AnsiString; virtual;
    function AppendImage(a1: TDicomAttributes; studyid, PName, pSex, PatientID: AnsiString;
      date1: TDatetime; studyuid, seriesuid, InstanceUID, ImageType, aid, APeerIP, aAEtitle:
      AnsiString; var AModility: AnsiString; AStudyUIDType, AGroupFilter: AnsiString): TDatetime; virtual;
    function SumitSQLToMemDataset(ADBStr, ASQL: AnsiString;
      AFetchCount: Integer; UseMultiDatabase: Boolean;
      Params: TDicomAttribute; AOrderBy: string; ATable: TKxmMemTable): TDataSet; virtual;

    property SeriesTableName: AnsiString read fSeriesTableName;
    property StudiesTableName: AnsiString read fStudiesTableName;
    property ImagesTableName: AnsiString read fImagesTableName;
    property PatientTablename: AnsiString read fPatientTablename;

    //property Params: TStringList read GetParams write SetParams;
    property OnDicomLogit: TDicomLogitEvent read FOnDicomLogit write FOnDicomLogit;
    property OnDicomLogDB: TDicomLogDBEvent read FOnDicomLogDB write FOnDicomLogDB;
    property OnDicomLogException: TDicomLogExceptionEvent read FOnDicomLogException write FOnDicomLogException;

    property LogDatabaseSQL: Boolean read fLogDatabaseSQL write fLogDatabaseSQL;
    property DicomServerCore: TDicomServerCore read GetDicomServerCore write SetDicomServerCore;
  end;

  TDicomPrintTask = class
  private
    FList: TList;
    FInstanceUID: AnsiString;
    FPrintFormat: AnsiString;
    FPrintOrientation: AnsiString;
    FFilmSize: AnsiString;
    FRows: Integer;
    FColumns: integer;
    //    FInstanceList: TStrings;
  protected
    function GetItem(AIndex: Integer): TDicomAttributes;
    procedure SpritRect(Aindex, l1, t1, w, h: Integer; var l, t, r, b: Integer);
  public
    constructor Create(AInstanceUID: AnsiString);
    destructor Destroy; override;
    procedure AddDataset(AValue: TDicomDataset);
    //    function IsInTask(AValue: AnsiString): Boolean;
    procedure Print(ACanvas: TCanvas; l1, t1, w, h: Integer);
    function GetCount: Integer;
    property InstanceUID: AnsiString read FInstanceUID;

    property Items[Index: Integer]: TDicomAttributes read GetItem;
    property PrintFormat: AnsiString read FPrintFormat write FPrintFormat;
    property PrintOrientation: AnsiString read FPrintOrientation write FPrintOrientation;
    property FilmSize: AnsiString read FFilmSize write FFilmSize;
    property Rows: Integer read FRows write FRows;
    property Columns: integer read FColumns write FColumns;

    property List: TList read FList;
  end;
  TDicomPrintQueue = class
  private
    FList: TList;
  protected
    function GetItem(AInstanceUID: AnsiString): TDicomPrintTask;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(AInstanceUID: AnsiString): TDicomPrintTask;
    procedure Delete(AInstanceUID: AnsiString);
    function GetCount: Integer;
    // function FindInstance(AValue: AnsiString): TDicomPrintTask;
    property Items[AValue: AnsiString]: TDicomPrintTask read getItem;
  end;
  TOnBasicFilmBoxEvent = procedure(AClientThread: TDicomClientThread; AAddress: AnsiString; APrintTask:
    TDicomPrintTask) of object;
  TOnGetCMoveLocalPortEvent = procedure(AClientThread: TDicomClientThread; AET: AnsiString; var AHost:
    AnsiString; var APort: Integer) of object;

  TOnGetCMoveLocalPortExEvent = procedure(AClientThread: TDicomClientThread; AET: AnsiString; var AHost:
    AnsiString; var APort: Integer; var CallingAET, CalledAET: AnsiString; var ASynchronousCMove: Boolean) of object;

  TDicomServerBackSendType = (sbs_MoveSend, sbs_NEventSend);
  TKxMoveChannelThread = class(TKxThread)
  private
    FMaxPduSize: Integer;
    FCallingTitle: AnsiString;
    FCalledTitle: AnsiString;
    FSendingIndex: Integer;

    fBackSendType: TDicomServerBackSendType;

    procedure SetCalledTitle(const Value: AnsiString);
    procedure SetCallingTitle(const Value: AnsiString);
    procedure SetMaxPduSize(const Value: Integer);
    procedure SetSendingIndex(const Value: Integer);
  protected
    FPresentationContext: TDCMIntegerArray;
    FPresentationContextCount: Integer;
    FDataChannel: TKXSockClient;
    fToSendDatasets: TList;
    FAssociation: TAssociation;
    FParent: TDicomServerCore;
    function SendCommandBySop(ASopClass: Integer; CommandAttributes, DataAttributes:
      TDicomAttributes): Boolean;
    // FOMIN 11.01.2013
    // function SendRequest: TDicomResponse;
    procedure Run; override;
  public
    // FOMIN 11.01.2013
    function SendRequest( p_TransferSyntax:integer=0 ): TDicomResponse;

    constructor Create(ACreateSuspended: Boolean = True); override;
    destructor Destroy; override;
    procedure StartThread(AList: TList);
    procedure SetupDataChannel(const AIP: AnsiString; APort: Integer);

    property SendingIndex: Integer read FSendingIndex write SetSendingIndex;
    property CalledTitle: AnsiString read FCalledTitle write SetCalledTitle;
    property CallingTitle: AnsiString read FCallingTitle write SetCallingTitle;
    property MaxPduSize: Integer read FMaxPduSize write SetMaxPduSize;

    property BackSendType: TDicomServerBackSendType read fBackSendType write fBackSendType;
  end;

  TOnClientAssociationNewDatasetEvent = procedure(Sender: TObject; AAssociation: TAssociation; ADataset: TDicomAttributes;
    APosition: Integer; AStream: TStream) of object;

  TDicomClientThread = class(TKXClientThread)
  private
    FOnDicomFind: TDicomRequestEvent;
    FOnDicomGet: TDicomRequestEvent;
    FOnDicomMove: TDicomRequestEvent;
    FOnDicomImage: TDicomImageEvent;
    FOnDicomAssociation: TDicomAssociationEvent;
    FOnDicomLogit: TDicomLogitEvent;
    FOnDicomLogDB: TDicomLogDBEvent;
    FOnDicomLogException: TDicomLogExceptionEvent;

    FOnDicomFilmPrint: TOnBasicFilmBoxEvent;
    FOnGetCMoveLocalPort: TOnGetCMoveLocalPortEvent;
    FOnSaveDicomImageEx: TSaveDicomImageExEvent;
    FOnDicomGetRequestEx: TDicomGetRequestExEvent;

    fOnClientNewCommand: TOnClientAssociationNewDatasetEvent;
    fOnClientNewData: TOnClientAssociationNewDatasetEvent;

    FDataChannelThread: TKxMoveChannelThread;
    FErrorCount: integer;
    //    FSQLQuery: TSDQuery;

    FPrintQueue: TDicomPrintQueue;
    FAssociation: TAssociation;
    FParent: TDicomServerCore;
    {$IFDEF SUPORT_SCRIPT_IN_SERVER}
    FPaxScripter: TPaxScripter;
    FPaxPascal: TPaxPascal;
    {$ENDIF}
    FUserID: AnsiString;
    FUserName: AnsiString;
    FLoginTime: TDateTime;

    fSynchronousCMove: Boolean;

    //    FDatasetToSave: TDicomDataset;
    AssociationID: Integer;
    FOnNormalisedReceived: TDicomRequestEvent;
    FOnNormalisedReceivedNGet: TDicomRequestEvent;
    FOnNormalisedReceivedNSet: TDicomRequestEvent;
    FOnNormalisedReceivedNEventReport: TDicomRequestEvent;
    FOnNormalisedReceivedNAction: TDicomRequestEvent;
    FOnNormalisedReceivedNCreate: TDicomRequestEvent;
    FOnNormalisedReceivedNDelete: TDicomRequestEvent;
    FOnGetCMoveLocalPortEx: TOnGetCMoveLocalPortExEvent;

    //    fCurrentDatabase: TCnsSDDatabase;

    //    procedure OpenSQLQuery;
    procedure CreateDataChannel;
    procedure KillDataChannel;
    procedure TerminateAndFreeDataChannel;
    procedure SetOnNormalisedReceived(const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNAction(
      const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNCreate(
      const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNDelete(
      const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNEventReport(
      const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNGet(const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNSet(const Value: TDicomRequestEvent);
    procedure SetOnGetCMoveLocalPortEx(
      const Value: TOnGetCMoveLocalPortExEvent);
  protected

    procedure Run; virtual;
    procedure ProcessData; override;

    procedure ProcessFileRequest(i1: integer);
    procedure SaveDicomImageEx(AClientThread: TDicomClientThread; ADataset: TDicomAttributes; var AStm: TFileStream);
    procedure DicomGetRequestEx(AClientThread: TDicomClientThread; rq: TDicomAttributes; ADstCommand: TDicomAttribute;
      AResponseStreams: TList; AResponseFiles: TStringList);

    procedure TriggerRequest(AAddress: AnsiString; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList; var AStatus: Integer);

    procedure DBRequestEx(AAddress: AnsiString; AClientThread: TDicomClientThread; rq: TDicomAttributes; ADstCommand: TDicomAttribute;
      AResponseStreams: TList; AResponseFiles: TStringList);

    procedure DBRequest(AAddress: AnsiString; ACommand: TDicomAttributes; ARequestDatasets,
      AResponseDatasets: TList);

    procedure Logit(AIP, Msg: AnsiString);
    procedure LogDB(AType, AIP, aDBStr, aSql: AnsiString; A1: TDicomAttributes);
    procedure LogException(AIP, ErrorMsg: AnsiString);
    function prepareResponseEx(request: TRequest; s: AnsiString; astr: TStrings;
      flag: Boolean): TDicomResponse;
    procedure SaveDicomImage;

    procedure DoNewCommand(AAssociation: TAssociation; ADataset: TDicomAttributes;
      APosition: Integer; AStream: TStream);
    procedure DoNewData(AAssociation: TAssociation; ADataset: TDicomAttributes;
      APosition: Integer; AStream: TStream);
  public
    v_patientIDs, v_studyUIDs, v_seriesUIDs,
    v_resp_DS_list : TStringList;
    v_is_move : Boolean;
    v_TransferSyntaxCMove : Integer;
    // FOMIN 26.08.2013
    isPg : Boolean;
    isORA : Boolean;
    PGconn: TUniConnection;
    PGTrans : TUniTransaction;
    OraConn: TOracleSession;
    // FOMIN 13.11.2012
    v_ClThr_trRead,
    v_ClThr_trWrite,
    v_ClThr_DB: TObject;
  //  v_ClThr_WLtrRead,
  //  v_ClThr_WLtrWrite,
  //  v_ClThr_WLDB: TObject;
    v_ClThr_LOGtrRead,
    v_ClThr_LOGtrWrite,
    v_ClThr_LOGDB: TObject;
    v_studyUID_img_sav_lst  : array of t_snimki_rec;
    v_studyUID_instance_sav : array of t_snimki1_rec;
    vAEtitle : string;
    //  CallingTitle : string;
    //  CMNAReg: TRequest;

    procedure p_add_patientID(p_patientID:string);
    procedure p_add_studyUID(p_studyUID:string);
    procedure p_add_seriesUID(p_seriesUID:string);
    function p_check_patientID(p_patientID:string) : Boolean;
    function p_check_studyUID(p_studyUID,p_PID,p_Modality:string) : Boolean;
    function p_check_seriesUID(p_seriesUID:string) : Boolean;

    constructor Create(CreateSuspended: Boolean); override;
    destructor Destroy; override;

    property UserID: AnsiString read FUserID write FUserID;
    property UserName: AnsiString read FUserName write FUserName;
    property LoginTime: TDateTime read FLoginTime write FLoginTime;

    property PrintQueue: TDicomPrintQueue read FPrintQueue;

    property Association: TAssociation read FAssociation;
    property DataChannelThread: TKxMoveChannelThread read FDataChannelThread write
      FDataChannelThread;

    property OnNormalisedReceived: TDicomRequestEvent read FOnNormalisedReceived write
      SetOnNormalisedReceived;
    property OnNormalisedReceivedNEventReport: TDicomRequestEvent read
      FOnNormalisedReceivedNEventReport write SetOnNormalisedReceivedNEventReport;
    property OnNormalisedReceivedNCreate: TDicomRequestEvent read FOnNormalisedReceivedNCreate write
      SetOnNormalisedReceivedNCreate;
    property OnNormalisedReceivedNGet: TDicomRequestEvent read FOnNormalisedReceivedNGet write
      SetOnNormalisedReceivedNGet;
    property OnNormalisedReceivedNSet: TDicomRequestEvent read FOnNormalisedReceivedNSet write
      SetOnNormalisedReceivedNSet;
    property OnNormalisedReceivedNDelete: TDicomRequestEvent read FOnNormalisedReceivedNDelete write
      SetOnNormalisedReceivedNDelete;
    property OnNormalisedReceivedNAction: TDicomRequestEvent read FOnNormalisedReceivedNAction write
      SetOnNormalisedReceivedNAction;

    property OnDicomFind: TDicomRequestEvent read FOnDicomFind write FOnDicomFind;
    property OnDicomGet: TDicomRequestEvent read FOnDicomGet write FOnDicomGet;
    property OnDicomMove: TDicomRequestEvent read FOnDicomMove write FOnDicomMove;
    property OnDicomImage: TDicomImageEvent read FOnDicomImage write FOnDicomImage;
    property OnDicomAssociation: TDicomAssociationEvent read FOnDicomAssociation write
      FOnDicomAssociation;
    property OnDicomLogit: TDicomLogitEvent read FOnDicomLogit write FOnDicomLogit;
    property OnDicomLogDB: TDicomLogDBEvent read FOnDicomLogDB write FOnDicomLogDB;
    property OnDicomLogException: TDicomLogExceptionEvent read FOnDicomLogException write FOnDicomLogException;

    property OnDicomFilmPrint: TOnBasicFilmBoxEvent read FOnDicomFilmPrint write FOnDicomFilmPrint;
    property OnGetCMoveLocalPort: TOnGetCMoveLocalPortEvent read FOnGetCMoveLocalPort write
      FOnGetCMoveLocalPort;
    property OnGetCMoveLocalPortEx: TOnGetCMoveLocalPortExEvent read FOnGetCMoveLocalPortEx write SetOnGetCMoveLocalPortEx;
    property SynchronousCMove: Boolean read fSynchronousCMove write fSynchronousCMove;

    property OnPrivateSaveDicomImage: TSaveDicomImageExEvent read FOnSaveDicomImageEx write
      FOnSaveDicomImageEx;
    property OnPrivateDicomGetRequest: TDicomGetRequestExEvent read FOnDicomGetRequestEx write
      FOnDicomGetRequestEx;

    property OnClientNewCommand: TOnClientAssociationNewDatasetEvent read FOnClientNewCommand write FOnClientNewCommand;
    property OnClientNewData: TOnClientAssociationNewDatasetEvent read FOnClientNewData write FOnClientNewData;

  end;

  TServerObject = class
  protected
    fDicomServerCore: TDicomServerCore;

    FRequestCommand: TDicomAttributes;
    FResponseDataset: TDicomAttributes;
    FRequestAddress: AnsiString;
    FFetchCount: Integer;

    fResponseStreams: TList;
    fResponseFiles: TStringList;

    fRequestType: Integer;
    fMemoFilter: TDicomAttribute;
  protected
    procedure Logit(AIP, Msg: AnsiString);
    procedure LogDB(AType, AIP, aDBStr, aSql: AnsiString; A1: TDicomAttributes);
    procedure LogException(AIP, ErrorMsg: AnsiString);

    procedure ExecSQL(ADBStr, ASQL: AnsiString; Params: TDicomAttribute);
    function ExecProc(ADBStr, AStorageProc, AOutput: AnsiString; AParams: TDicomAttribute): AnsiString;
    function SumitSQL(ADBStr, ASQL: AnsiString; AFetchCount: Integer; UseMultiDatabase: Boolean;
      Params: TDicomAttribute): TDataset;
    procedure SumitSQLAndSaveTo(ADBStr, ASQL: AnsiString; AFetchCount: Integer; UseMultiDatabase:
      Boolean; Params: TDicomAttribute; AMemoFilter: TDicomAttribute);

  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Execute(AClient: TDicomClientThread); virtual;
    property DicomServerCore: TDicomServerCore read fDicomServerCore write fDicomServerCore;
    property RequestCommand: TDicomAttributes read FRequestCommand write FRequestCommand;
    property ResponseDataset: TDicomAttributes read FResponseDataset write FResponseDataset;
    property Address: AnsiString read FRequestAddress write FRequestAddress;
    property FetchCount: Integer read FFetchCount write FFetchCount;

    property ResponseStreams: TList read fResponseStreams;
    property ResponseFiles: TStringList read fResponseFiles;
    property RequestType: Integer read fRequestType write fRequestType;
  end;

  TServerObjectClass = class of TServerObject;
  TFunctionObject = class
  private
    FServerObjectClass: TServerObjectClass;
    FFunctionCode: AnsiString;
  public
    constructor Create(AServerObjectClass: TServerObjectClass; AFunctionCode: AnsiString);

    property ServerObjectClass: TServerObjectClass read FServerObjectClass write
      FServerObjectClass;
    property FunctionCode: AnsiString read FFunctionCode write FFunctionCode;
  end;

  TClientUpdateSetting = class
  private
    FName: AnsiString;
    FFileName: AnsiString;
    FVersion: Integer;
  public
    constructor Create(AName: AnsiString; AFileName: AnsiString; AVersion: Integer);
    destructor Destroy; override;

    property Name: AnsiString read FName write FName;
    property Version: Integer read FVersion write FVersion;
    property FileName: AnsiString read FFileName write FFileName;
  end;

  TDatabaseExecSQLEvent = procedure(AClientThread: TDicomClientThread; ADBStr, ASQL: AnsiString;
    Params: TDicomAttribute) of object;
  TDatabaseExecProcEvent = procedure(AClientThread: TDicomClientThread; ADBStr, AStorageProc,
    AOutput: AnsiString; AParams: TDicomAttribute; var AResult: AnsiString) of object;
  TDatabaseSumitSQLEvent = procedure(AClientThread: TDicomClientThread; ADBStr, ASQL: AnsiString;
    AFetchCount: Integer; UseMultiDatabase: Boolean; Params: TDicomAttribute; var AResult: TDataset)
    of object;

  TDatabaseSumitSQLAndSaveToEvent = procedure(AClientThread: TDicomClientThread; ADBStr, ASQL: AnsiString;
    AFetchCount: Integer; UseMultiDatabase: Boolean; Params, AMemoFilter: TDicomAttribute;
    AResponseDataset: TDicomAttributes; AResponseList: TList; ARequestType: Integer) of object;

  TDatabaseGetGenIDEvent = procedure(ADatabaseName, ATableName, Fieldname: AnsiString; AutoInc:
    Boolean; ASetValue: Integer; var AResult: Integer) of object;

  TDatabaseAddServerObjectEvent = procedure(Sender: TObject; AList: TList) of object;
  TDatabaseGetTableNamesEvent = procedure(Sender: TObject; ADBstr: AnsiString; AStrs: Tstrings) of
    object;
  TDatabaseGetTableFieldNamesEvent = procedure(Sender: TObject; ADBStr, ATableName: AnsiString; AStrs:
    TStrings) of object;
  TDatabaseGetDatabaseParamsEvent = procedure(Sender: TObject; ADBStr: AnsiString; var ADBType:
    Integer; AParam: TStrings) of object;

  TDatabaseFindCnsTableDataEvent = procedure(Sender: TObject; var AData: TCnsTable) of object;

  TDicomServerCore = class(TKXServerCore)
  private
    fSynchronousCMove: Boolean;

    fCacheDatasets: TThreadList;
    FServerList: TThreadList;
    FAutoUpdateList: TThreadList;
    FBasicSQLData: TCnsSQLData;
    FCustomDatabaseOperator: TCustomDicomDatabaseOperator;

    FAssociationCount: Integer;
    FOnSaveDicomImageEx: TSaveDicomImageExEvent;
    FOnDicomGetRequestEx: TDicomGetRequestExEvent;

    FOnDicomFind: TDicomRequestEvent;
    FOnDicomGet: TDicomRequestEvent;
    FOnDicomMove: TDicomRequestEvent;
    FOnDicomImage: TDicomImageEvent;
    FOnDicomAssociation: TDicomAssociationEvent;
    FOnDicomLogit: TDicomLogitEvent;
    FOnDicomLogDB: TDicomLogDBEvent;
    FOnDicomLogException: TDicomLogExceptionEvent;
    FOnDicomFilmPrint: TOnBasicFilmBoxEvent;
    FOnGetCMoveLocalPort: TOnGetCMoveLocalPortEvent;

    FOnDatabaseExecSQL: TDatabaseExecSQLEvent;
    FOnDatabaseExecProc: TDatabaseExecProcEvent;
    FOnDatabaseSumitSQL: TDatabaseSumitSQLEvent;
    FOnDatabaseGetGenID: TDatabaseGetGenIDEvent;
    FOnDatabaseAddServerObject: TDatabaseAddServerObjectEvent;
    FOnDatabaseGetTableNames: TDatabaseGetTableNamesEvent;
    FOnDatabaseGetTableFieldNames: TDatabaseGetTableFieldNamesEvent;

    FOnDatabaseGetDatabaseParams: TDatabaseGetDatabaseParamsEvent;

    FOnDatabaseFindCnsTableData: TDatabaseFindCnsTableDataEvent;

    fActiveLicense: Boolean;
    fLicenseCount: Integer;
    fHospitalName: AnsiString;
    fLicenseIP: TThreadStringList;
    fLicenseAETitle: TThreadStringList;
    fActiveDate: TDatetime;
    fLicenseDate: TDatetime;
    FOnClientUpdateChange: TNotifyEvent;
    FOnNormalisedReceived: TDicomRequestEvent;
    FOnNormalisedReceivedNGet: TDicomRequestEvent;
    FOnNormalisedReceivedNSet: TDicomRequestEvent;
    FOnNormalisedReceivedNEvent: TDicomRequestEvent;
    FOnNormalisedReceivedNAction: TDicomRequestEvent;
    FOnNormalisedReceivedNCreate: TDicomRequestEvent;
    FOnNormalisedReceivedNDelete: TDicomRequestEvent;
    fOnDatabaseSumitSQLAndSaveTo: TDatabaseSumitSQLAndSaveToEvent;

    fOnClientNewCommand: TOnClientAssociationNewDatasetEvent;
    fOnClientNewData: TOnClientAssociationNewDatasetEvent;

    FForceCheckTableBeforeOpen: Boolean;
    FOnGetCMoveLocalPortEx: TOnGetCMoveLocalPortExEvent;
    procedure SetFCustomDatabaseOperator(
      const Value: TCustomDicomDatabaseOperator);
    procedure SetOnClientUpdateChange(const Value: TNotifyEvent);
    procedure SetOnNormalisedReceived(const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNAction(
      const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNCreate(
      const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNDelete(
      const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNEvent(
      const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNGet(const Value: TDicomRequestEvent);
    procedure SetOnNormalisedReceivedNSet(const Value: TDicomRequestEvent);
    procedure SetForceCheckTableBeforeOpen(const Value: Boolean);
    procedure SetOnGetCMoveLocalPortEx(
      const Value: TOnGetCMoveLocalPortExEvent);
  protected
    procedure DoSaveDicomImageEx(AClientThread: TDicomClientThread; ADataset: TDicomAttributes; var AStm: TFileStream);
    procedure DoDicomGetRequestEx(AClientThread: TDicomClientThread; rq: TDicomAttributes; ADstCommand: TDicomAttribute;
      AResponseStreams: TList; AResponseFiles: TStringList);

    procedure NormalisedReceived(AClientThread: TDicomClientThread; AAddress: AnsiString; ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);

    procedure NormalisedReceivedNEventReport(AClientThread: TDicomClientThread; AAddress: AnsiString;
      ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure NormalisedReceivedNCreate(AClientThread: TDicomClientThread; AAddress: AnsiString;
      ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure NormalisedReceivedNGet(AClientThread: TDicomClientThread; AAddress: AnsiString; ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure NormalisedReceivedNSet(AClientThread: TDicomClientThread; AAddress: AnsiString; ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure NormalisedReceivedNAction(AClientThread: TDicomClientThread; AAddress: AnsiString;
      ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure NormalisedReceivedNDelete(AClientThread: TDicomClientThread; AAddress: AnsiString;
      ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);

    procedure DicomFindRequest(AClientThread: TDicomClientThread; AAddress: AnsiString; ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure DicomMoveRequest(AClientThread: TDicomClientThread; AAddress: AnsiString; ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure DicomGetRequest(AClientThread: TDicomClientThread; AAddress: AnsiString; ACommand:
      TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
    procedure TriggerAssociation(AClientThread: TDicomClientThread; AAddress: AnsiString; AReg:
      TRequest; var AHandleType: Integer);
    procedure DoSaveImage(AClientThread: TDicomClientThread; AAddress: AnsiString; ADataset:
      TDicomDataset);
    procedure DoLogit(AClientThread: TDicomClientThread; AIP, Msg: AnsiString);
    procedure DoLogDB(AClientThread: TDicomClientThread; AType, AIP, aDBStr, aSql: AnsiString; A1: TDicomAttributes);
    procedure DoLogException(AClientThread: TDicomClientThread; AIP, Msg: AnsiString);

    procedure DoDicomPrint(AClientThread: TDicomClientThread; AAddress: AnsiString; APrintTask:
      TDicomPrintTask);
    procedure DoGetCMovePort(AClientThread: TDicomClientThread; AET: AnsiString; var AHost: AnsiString; var
      APort: Integer);
    procedure DoGetCMovePortEx(AClientThread: TDicomClientThread;
      AET: AnsiString; var AHost: AnsiString; var APort: Integer; var CallingAET, CalledAET: AnsiString; var ASynchronousCMove: Boolean);

    function GetClientApplication(Aindex: Integer): TClientUpdateSetting;
    function GetClientApplicationByName(AName: AnsiString): TClientUpdateSetting;

    procedure GetTableNames(ADBstr: AnsiString; AStrs: Tstrings);
    procedure getTableFieldNames(ADBStr, ATableName: AnsiString; AStrs: TStrings);

    procedure DoNewCommand(Sender: TObject; AAssociation: TAssociation; ADataset: TDicomAttributes;
      APosition: Integer; AStream: TStream);
    procedure DoNewData(Sender: TObject; AAssociation: TAssociation; ADataset: TDicomAttributes;
      APosition: Integer; AStream: TStream);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;
    procedure DoNewConnection(ClientThread: TKXClientThread); override;
    property AssociationCount: Integer read FAssociationCount;

    procedure AddCacheDataset(AObjectName: AnsiString; ADataset: TDataset);
    function FindCacheDataset(AObjectName: AnsiString): TKxmThreadDataSet;
    procedure ClearCache;
    procedure BuildService;

    function GetCreateTableSQL(t1: TCnsTable): AnsiString;
    procedure DoExecSQL(AClientThread: TDicomClientThread; ADBStr, ASQL: AnsiString; Params:
      TDicomAttribute);
    function DoExecProc(AClientThread: TDicomClientThread; ADBStr, AStorageProc, AOutput: AnsiString;
      AParams: TDicomAttribute): AnsiString;
    function DoSumitSQL(AClientThread: TDicomClientThread; ADBStr, ASQL: AnsiString; AFetchCount:
      Integer; UseMultiDatabase: Boolean; Params: TDicomAttribute): TDataset;
    function DoGetGenID(ADatabaseName, ATableName, Fieldname: AnsiString; AutoInc: Boolean; ASetValue:
      Integer): Integer;

    procedure DoSumitSQLAndSaveTo(AClientThread: TDicomClientThread; ADBStr, ASQL: AnsiString; AFetchCount: Integer; UseMultiDatabase:
      Boolean; Params: TDicomAttribute; AMemoFilter: TDicomAttribute; AResponseDataset: TDicomAttributes;
      AResponseList: TList; ARequestType: Integer);

    function FindServerObject(AFunctionCode: AnsiString): TServerObject;
    function FindTaskSQL(AObjectName: AnsiString): TCnsTable;
    procedure CheckIfDatasetExists(t1: TCnsTable);

    function ClearClientApplication: Integer;
    function GetClientApplicationCount: Integer;
    function AddApplication(AAppName, AFileName: AnsiString; AVersion: Integer): TClientUpdateSetting;
    property ClientApplications[Index: Integer]: TClientUpdateSetting read GetClientApplication;
    property ClientApplicationByName[Value: AnsiString]: TClientUpdateSetting read
    GetClientApplicationByName;

    function AddSQLDefine(ATaskSQL: AnsiString): Boolean;
    procedure ClearSQLDefine;

    property HospitalName: AnsiString read fHospitalName write fHospitalName;
    property LicenseDate: TDatetime read fLicenseDate write fLicenseDate;
    property LicenseCount: Integer read fLicenseCount write fLicenseCount;
    property ActiveLicense: Boolean read fActiveLicense write fActiveLicense;
    property ActiveDate: TDatetime read fActiveDate write fActiveDate;

    property LicenseIPAddress: TThreadStringList read fLicenseIP;
    property LicenseAETitle: TThreadStringList read fLicenseAETitle;
    property BasicSQLData: TCnsSQLData read FBasicSQLData;
  published
    property ServerPort;
    property DatabaseOperator: TCustomDicomDatabaseOperator read FCustomDatabaseOperator write
      SetFCustomDatabaseOperator;

    property ForceCheckTableBeforeOpen: Boolean read FForceCheckTableBeforeOpen write SetForceCheckTableBeforeOpen;
    property SynchronousCMove: Boolean read fSynchronousCMove write fSynchronousCMove;

    property OnNormalisedReceived: TDicomRequestEvent read FOnNormalisedReceived write
      SetOnNormalisedReceived;
    property OnNormalisedReceivedNEventReport: TDicomRequestEvent read FOnNormalisedReceivedNEvent
      write SetOnNormalisedReceivedNEvent;
    property OnNormalisedReceivedNCreate: TDicomRequestEvent read FOnNormalisedReceivedNCreate write
      SetOnNormalisedReceivedNCreate;
    property OnNormalisedReceivedNGet: TDicomRequestEvent read FOnNormalisedReceivedNGet write
      SetOnNormalisedReceivedNGet;
    property OnNormalisedReceivedNSet: TDicomRequestEvent read FOnNormalisedReceivedNSet write
      SetOnNormalisedReceivedNSet;
    property OnNormalisedReceivedNDelete: TDicomRequestEvent read FOnNormalisedReceivedNDelete write
      SetOnNormalisedReceivedNDelete;
    property OnNormalisedReceivedNAction: TDicomRequestEvent read FOnNormalisedReceivedNAction write
      SetOnNormalisedReceivedNAction;

    property OnDicomFind: TDicomRequestEvent read FOnDicomFind write FOnDicomFind;
    property OnDicomGet: TDicomRequestEvent read FOnDicomGet write FOnDicomGet;
    property OnDicomMove: TDicomRequestEvent read FOnDicomMove write FOnDicomMove;
    property OnDicomImage: TDicomImageEvent read FOnDicomImage write FOnDicomImage;
    property OnDicomAssociation: TDicomAssociationEvent read FOnDicomAssociation write
      FOnDicomAssociation;
    property OnDicomLogit: TDicomLogitEvent read FOnDicomLogit write FOnDicomLogit;
    property OnDicomLogDB: TDicomLogDBEvent read FOnDicomLogDB write FOnDicomLogDB;
    property OnDicomLogException: TDicomLogExceptionEvent read FOnDicomLogException write FOnDicomLogException;

    property OnDicomFilmPrint: TOnBasicFilmBoxEvent read FOnDicomFilmPrint write FOnDicomFilmPrint;

    property OnDatabaseExecSQL: TDatabaseExecSQLEvent read FOnDatabaseExecSQL write
      FOnDatabaseExecSQL;
    property OnDatabaseExecProc: TDatabaseExecProcEvent read FOnDatabaseExecProc write
      FOnDatabaseExecProc;
    property OnDatabaseSumitSQL: TDatabaseSumitSQLEvent read FOnDatabaseSumitSQL write
      FOnDatabaseSumitSQL;
    property OnDatabaseSumitSQLAndSaveTo: TDatabaseSumitSQLAndSaveToEvent read fOnDatabaseSumitSQLAndSaveTo
      write fOnDatabaseSumitSQLAndSaveTo;

    property OnDatabaseAddServerObject: TDatabaseAddServerObjectEvent read
      FOnDatabaseAddServerObject write FOnDatabaseAddServerObject;
    property OnDatabaseGetTableNames: TDatabaseGetTableNamesEvent read FOnDatabaseGetTableNames
      write FOnDatabaseGetTableNames;
    property OnDatabaseGetTableFieldNames: TDatabaseGetTableFieldNamesEvent read
      FOnDatabaseGetTableFieldNames write FOnDatabaseGetTableFieldNames;
    property OnDatabaseGetGenID: TDatabaseGetGenIDEvent read FOnDatabaseGetGenID write
      FOnDatabaseGetGenID;
    property OnDatabaseGetDatabaseParams: TDatabaseGetDatabaseParamsEvent read
      FOnDatabaseGetDatabaseParams write FOnDatabaseGetDatabaseParams;
    property OnGetCMoveLocalPort: TOnGetCMoveLocalPortEvent read FOnGetCMoveLocalPort write
      FOnGetCMoveLocalPort;
    property OnGetCMoveLocalPortEx: TOnGetCMoveLocalPortExEvent read FOnGetCMoveLocalPortEx write SetOnGetCMoveLocalPortEx;

    property OnPrivateSaveDicomImage: TSaveDicomImageExEvent read FOnSaveDicomImageEx write
      FOnSaveDicomImageEx;
    property OnPrivateDicomGetRequest: TDicomGetRequestExEvent read FOnDicomGetRequestEx write
      FOnDicomGetRequestEx;

    property OnDatabaseFindCnsTableData: TDatabaseFindCnsTableDataEvent read
      FOnDatabaseFindCnsTableData write FOnDatabaseFindCnsTableData;

    property OnClientUpdateChange: TNotifyEvent read FOnClientUpdateChange write
      SetOnClientUpdateChange;

    property OnClientNewCommand: TOnClientAssociationNewDatasetEvent read FOnClientNewCommand write FOnClientNewCommand;
    property OnClientNewData: TOnClientAssociationNewDatasetEvent read FOnClientNewData write FOnClientNewData;

  end;

  TServerObjectNOW = class(TServerObject)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;
  TServerObjectSUMIT = class(TServerObject)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;

  TServerObjectEXEC = class(TServerObject)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;

  TServerObjectGFILE = class(TServerObject)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;

  TServerObjectSFILE = class(TServerObject)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;
  TServerObjectPROC = class(TServerObject)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;
  TServerObjectGENID = class(TServerObject)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;
  TServerObjectOBJECT = class(TServerObjectSUMIT)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;

  TServerObjectUPDATE = class(TServerObject)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;
  TServerObjectVERSION = class(TServerObject)
  public
    procedure Execute(AClient: TDicomClientThread); override;
  end;

function prepareResponse(request: TRequest; s: AnsiString; astr: TStrings; flag: Boolean):
  TDicomResponse;
procedure SendImageForCMove(AAssociation: TAssociation; ACommand: TDicomAttributes;
  fToSendDatasets: TList; AClientIP: AnsiString; APort: Integer;
  CalledTitle, CallingTitle: AnsiString);

var v_crt_log : Boolean;

implementation

uses DCM_Client;

procedure Dcm_Server_wrt_log (str:string; p_is_log:boolean );
begin
  if p_is_log then
    MnLg_ev(str,vLogDir+pLogFile);
end;

function prepareResponse(request: TRequest; s: AnsiString; astr: TStrings;
  flag: Boolean): TDicomResponse;
var
  flag1: Boolean;
  j: Integer;
  acknowledge: TAcknowledge;
  k: Integer;
  uidentry: TUIDEntry;
  l: Integer;
  j1: Integer;
  uidentry1: TUIDEntry;
  flag2: Boolean;
  i1: Integer;
  str1: AnsiString;
begin
  Dcm_Server_wrt_log('unit DCM_Server function prepareResponse', v_crt_log );
  if request.isPrivateApplicationContext then
  begin
    result := TDicomReject.Create(REJECTED_PERMANENT,
      DICOM_UL_SERVICE_USER_reject, USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED);
    exit;
  end;
  if (s <> '') and (request.CalledTitle <> (s)) then
  begin
    result := TDicomReject.Create(REJECTED_PERMANENT,
      DICOM_UL_SERVICE_USER_reject, USER_CALLED_AETITLE_NOT_RECOGNIZED);
    exit;
  end;
  flag1 := TRUE;
  if assigned(astr) and (astr.Count > 0) then
  begin
    j := 0;
    while j < astr.Count do
    begin
      if request.CallingTitle = (astr[j]) then
      begin
        flag1 := FALSE;
      end;
      Inc(j);
    end;
    if flag1 then
    begin
      result := TDicomReject.Create(REJECTED_PERMANENT,
        DICOM_UL_SERVICE_USER_reject, USER_CALLING_AETITLE_NOT_RECOGNIZED);
      exit;
    end;
  end;
  acknowledge := TAcknowledge.Create;
  if request.MaxPduSize >= 16384 then
    acknowledge.MaxPduSize := request.MaxPduSize
  else
    acknowledge.MaxPduSize := 16384;
  {  if DefaultMaxPdu <= 0 then
    acknowledge.MaxPduSize := request.MaxPduSize
  else
    acknowledge.MaxPduSize := DefaultMaxPdu;}
  acknowledge.CalledTitle := trim(request.CalledTitle);
  acknowledge.CallingTitle := trim(request.CallingTitle);

  acknowledge.ApplicationContextUid := request.ApplicationContextUid;
  for k := 0 to request.getPresentationContexts - 1 do
  begin
    uidentry := request.getAbstractSyntax(k);
    //    for l := 0 to length(ai) - 1 do
    if (uidentry.UIDType = 1) or (uidentry.UIDType = 4) then
    begin
      //      if uidentry <> UIDS.ItemByIndex[ai[l]] then
      //        continue;
      l := 0;
      for j1 := 0 to request.getTransferSyntaxes(k) - 1 do
      begin
        uidentry1 := request.getTransferSyntax(k, j1);
        str1 := Uppercase(request.CalledTitle);
        if str1 = 'ANYICT' then
        begin
          if {(uidentry1.Constant = ImplicitVRLittleEndian)
          or}(uidentry1.Constant = ExplicitVRLittleEndian)
          //            or (uidentry1.Constant = JPEG_2_4)
          //            or (uidentry1.Constant = JPEGBaseline)
          //            or (uidentry1.Constant = JPEG_14)
          //            or (uidentry1.Constant = JPEGLossless)
          //            or (uidentry1.Constant = zlibFastestTransferSyntax)
          //            or (uidentry1.Constant = ppmFastestTransferSyntax)
          //            or (uidentry1.Constant = bzipFastestTransferSyntax)
          then
          begin
            acknowledge.addPresentationContext(request.getPresentationContextID(k), 0,
              uidentry1.Constant);
            inc(l);
          end;
        end
        else
          if (str1 = 'CNS') or (str1 = 'ECT') or (str1 = 'ECT1') or (str1 = 'ADVT') then
        begin
          if {(uidentry1.Constant = ImplicitVRLittleEndian)
          or}(uidentry1.Constant = ExplicitVRLittleEndian)
          //            or (uidentry1.Constant = JPEG_2_4)
          //            or (uidentry1.Constant = JPEGBaseline)
          //            or (uidentry1.Constant = JPEG_14)
          //            or (uidentry1.Constant = JPEGLossless)
          //            or (uidentry1.Constant = zlibFastestTransferSyntax)
          //            or (uidentry1.Constant = ppmFastestTransferSyntax)
          //            or (uidentry1.Constant = bzipFastestTransferSyntax)
          then
          begin
            acknowledge.addPresentationContext(request.getPresentationContextID(k), 0,
              uidentry1.Constant);
            inc(l);
          end;
        end
        else
        begin
          {if (uidentry.Constant = CTImageStorage) then
          begin
            if (uidentry1.Constant = ImplicitVRLittleEndian)
              or (uidentry1.Constant = ExplicitVRLittleEndian)
              or (uidentry1.Constant = JPEG_2_4)
              or (uidentry1.Constant = JPEGBaseline)
              or (uidentry1.Constant = JPEG_14)
              //            or (uidentry1.Constant = JPEGLossless)
            or (uidentry1.Constant = zlibFastestTransferSyntax)
              //            or (uidentry1.Constant = ppmFastestTransferSyntax)
  //            or (uidentry1.Constant = bzipFastestTransferSyntax)
            then
            begin
              acknowledge.addPresentationContext(request.getPresentationContextID(k), 0,
                uidentry1.Constant);
              inc(l);
            end;
          end
          else
            if (uidentry.Constant = MRImageStorage) then
          begin
            if (uidentry1.Constant = ImplicitVRLittleEndian)
              or (uidentry1.Constant = ExplicitVRLittleEndian)
              or (uidentry1.Constant = JPEG_2_4)
              or (uidentry1.Constant = JPEGBaseline)
              or (uidentry1.Constant = JPEG_14)
              //            or (uidentry1.Constant = JPEGLossless)
            or (uidentry1.Constant = zlibFastestTransferSyntax)
              //            or (uidentry1.Constant = ppmFastestTransferSyntax)
  //            or (uidentry1.Constant = bzipFastestTransferSyntax)
            then
            begin
              acknowledge.addPresentationContext(request.getPresentationContextID(k), 0,
                uidentry1.Constant);
              inc(l);
            end;
          end
          else}
          begin
            if (uidentry1.Constant = ImplicitVRLittleEndian)
              or (uidentry1.Constant = ExplicitVRLittleEndian)
              //or (uidentry1.Constant = ExplicitVRBigEndian)
{or (uidentry1.Constant = JPEGExtendedProcess_2_4)
or (uidentry1.Constant = JPEGBaseline)
or (uidentry1.Constant = JPEGLossless14)
or (uidentry1.Constant = JPEGLossless15)
//            or (uidentry1.Constant = RLELossless)
or (uidentry1.Constant = JPEGLossless)    //}
            {$IFDEF ECLZLIBTransferSyntax}
            or (uidentry1.Constant = zlibFastestTransferSyntax)
              or (uidentry1.Constant = ppmFastestTransferSyntax)
              or (uidentry1.Constant = bzipFastestTransferSyntax)
              {$ENDIF}
            then
            begin
              acknowledge.addPresentationContext(request.getPresentationContextID(k), 0,
                uidentry1.Constant);
              inc(l);
            end;
          end;
        end;
      end;
      if l <= 0 then
        acknowledge.addPresentationContext(request.getPresentationContextID(k), 4,
          ExplicitVRLittleEndian);
    end;
    //    acknowledge.addPresentationContext(request.getPresentationContextID(k), 3, i);
  end;

  if flag then
  begin
    flag2 := TRUE;
    for i1 := 0 to acknowledge.getPresentationContexts - 1 do
    begin
      if acknowledge.getResult(i1) = 0 then
        flag2 := FALSE;
    end;
    if flag2 then
    begin
      result := TDicomReject.Create(REJECTED_PERMANENT,
        DICOM_UL_SERVICE_USER_reject, USER_NO_REASON_GIVEN);
      exit;
    end;
  end;
  result := acknowledge;
end;

///////////////////////////////////////////////////////////////////////

function TDicomPrintTask.GetItem(AIndex: Integer): TDicomAttributes;
begin
  if (Aindex >= 0) and (Aindex < FList.Count) then
  begin
    Result := TDicomDataset(FList[Aindex]).Attributes;
  end
  else
    Result := nil;
end;

constructor TDicomPrintTask.Create(AInstanceUID: AnsiString);
begin
  FList := TList.Create;
  //  FInstanceList := TStringList.Create;
  FInstanceUID := AInstanceUID;
end;

destructor TDicomPrintTask.Destroy;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
  begin
    Items[i].Free;
  end;
  FList.Clear;
  FList.Free;
  //  FInstanceList.Free;
  inherited;
end;

procedure TDicomPrintTask.AddDataset(AValue: TDicomDataset);
begin
  FList.Add(AValue);
end;

{function TDicomPrintTask.IsInTask(AValue: AnsiString): Boolean;
begin
  Result := FInstanceList.IndexOf(AValue) >= 0;
end;}

function TDicomPrintQueue.GetItem(AInstanceUID: AnsiString): TDicomPrintTask;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to FList.Count - 1 do
  begin
    if TDicomPrintTask(FList[i]).InstanceUID = AInstanceUID then
    begin
      Result := TDicomPrintTask(FList[i]);
      exit;
    end;
  end;
end;

constructor TDicomPrintQueue.Create;
begin
  FList := TList.Create;
end;

destructor TDicomPrintQueue.Destroy;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
  begin
    TDicomPrintTask(FList[i]).Free;
  end;
  FList.Clear;
  FList.Free;
  inherited;
end;

function TDicomPrintQueue.Add(AInstanceUID: AnsiString): TDicomPrintTask;
begin
  Result := TDicomPrintTask.Create(AInstanceUID);
  FList.Add(Result);
end;

procedure TDicomPrintQueue.Delete(AInstanceUID: AnsiString);
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
  begin
    if TDicomPrintTask(FList[i]).InstanceUID = AInstanceUID then
    begin
      TDicomPrintTask(FList[i]).Free;
      FList.Delete(i);
      exit;
    end;
  end;
end;

{function TDicomPrintQueue.FindInstance(AValue: AnsiString): TDicomPrintTask;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to FList.Count - 1 do
  begin
    if TDicomPrintTask(FList[i]).IsInTask(AValue) then
    begin
      Result := TDicomPrintTask(FList[i]);
      exit;
    end;
  end;
end; }

procedure TDicomPrintTask.SpritRect(Aindex, l1, t1, w, h: Integer; var l, t, r, b: Integer);
var
  x, y: Integer;
begin
  x := Columns;
  y := Rows;
  // w := Printer.PageWidth;
  // h := Printer.PageHeight;
  l := l1 + (Aindex mod x) * (w div x);
  r := l1 + ((Aindex mod x) + 1) * (w div x);
  t := t1 + (Aindex div x) * (h div y);
  b := t1 + ((Aindex div x) + 1) * (h div y);
end;

function TDicomPrintTask.GetCount: Integer;
begin
  Result := FList.Count;
end;

procedure TDicomPrintTask.Print(ACanvas: TCanvas; l1, t1, w, h: Integer);
var
  i, l, t, r, b: Integer;
  bm: TBitmap;
  b1, b2: Double;
begin
  for i := 0 to Rows * Columns - 1 do
  begin
    if i < FList.Count then
    begin
      SpritRect(i, l1, t1, w, h, l, t, r, b);
      bm := TBitmap.Create;
      try
        if DCM_ImageData_Bitmap.AssignToBitmap(Items[i].ImageData, bm, false) then
        begin
          b1 := bm.Height / bm.Width;
          b2 := (b - t) / (r - l);
          if (b1 < b2) then
            b := Round((((r - l) * b1) + t))
          else
            if (b1 > b2) then
            r := Round((((b - t) / b1) + l));
          //            Printer.Canvas.StretchDraw(Rect(l, t, r, b), bm);
          printBitmapEx(ACanvas, Rect(l, t, r, b), bm);
        end;
      finally
        bm.Free;
      end;
    end;
  end;

end;

///////////////////////////////////////////////////////////////////////

function CompareFunctionObject(Item1, Item2: Pointer): Integer;
begin
  Result := CompareText(TFunctionObject(Item1).FunctionCode, TFunctionObject(Item2).FunctionCode);
end;

constructor TDicomServerCore.Create(AOwner: TComponent);
//var
//  list1: TList;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomServerCore.Create', v_crt_log );

  inherited Create(AOwner);
  fHospitalName := '';
  fLicenseCount := 0;
  fActiveLicense := false;
  fActiveDate := 0;
  fLicenseDate := 0;

  fLicenseIP := TThreadStringList.Create;
  fLicenseAETitle := TThreadStringList.Create;

  fSynchronousCMove := false;
  FForceCheckTableBeforeOpen := false;

  FCustomDatabaseOperator := nil;

  ServerPort := 104;
  fcClientThreadClass := TDicomClientThread;
  SocketOutputBufferSize := bsfHUGE;
  FAssociationCount := 0;

  ThreadCacheSize := DefaultThreadCacheSize;

  ListenerThreadPriority := tpHigher;
  SpawnedThreadPriority := tpHigher;
  UseThreadPool := False;

  FBasicSQLData := TCnsSQLData.Create;

  FAutoUpdateList := TThreadList.Create;

  FServerList := TThreadList.Create;

  fCacheDatasets := TThreadList.Create;
end;

destructor TDicomServerCore.Destroy;
var
  l1: TList;
  i: Integer;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomServerCore.Destroy', v_crt_log );

  fLicenseIP.Free;
  fLicenseAETitle.Free;

  FBasicSQLData.Clear;
  FBasicSQLData.Free;

  l1 := FServerList.LockList;
  try
    for i := 0 to l1.Count - 1 do
    begin
      TFunctionObject(l1[i]).Free;
    end;
    l1.Clear;
  finally
    FServerList.UnlockList;
  end;
  FServerList.Free;

  l1 := FAutoUpdateList.LockList;
  try
    for I := 0 to l1.Count - 1 do // Iterate
    begin
      TClientUpdateSetting(l1[i]).Free;
    end; // for
    l1.Clear;
  finally
    FAutoUpdateList.UnlockList;
  end;
  FAutoUpdateList.Free;

  ClearCache;
  fCacheDatasets.Free;
  inherited Destroy;
end;

procedure TDicomServerCore.DoNewConnection(ClientThread: TKXClientThread);
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomServerCore.DoNewConnection', v_crt_log );

  inherited;
  if ClientThread is TDicomClientThread then
  begin
    with TDicomClientThread(ClientThread) do
    begin
      AssociationID := FAssociationCount;
      FParent := self;
      InterlockedIncrement(FAssociationCount);
      {$IFDEF DICOMDEBUG}
      SendDebug('FAssociationCount' + IntToStr(FAssociationCount));
      {$ENDIF}
      OnDicomFind := DicomFindRequest;
      OnNormalisedReceived := NormalisedReceived;

      OnNormalisedReceivedNEventReport := NormalisedReceivedNEventReport;
      OnNormalisedReceivedNCreate := NormalisedReceivedNCreate;
      OnNormalisedReceivedNSet := NormalisedReceivedNSet;
      OnNormalisedReceivedNGet := NormalisedReceivedNGet;
      OnNormalisedReceivedNAction := NormalisedReceivedNAction;
      OnNormalisedReceivedNDelete := NormalisedReceivedNDelete;

      OnClientNewCommand := self.DoNewCommand;
      OnClientNewData := self.DoNewData;

      OnDicomGet := DicomGetRequest;
      OnDicomMove := DicomMoveRequest;
      OnDicomImage := DoSaveImage;
      OnDicomAssociation := TriggerAssociation;
      OnDicomLogit := DoLogit;
      OnDicomLogDB := DoLogDB;
      OnDicomLogException := DoLogException;

      OnDicomFilmPrint := DoDicomPrint;
      OnGetCMoveLocalPort := DoGetCMovePort;
      OnGetCMoveLocalPortEx := DoGetCMovePortEx;
      SynchronousCMove := self.SynchronousCMove;
      OnPrivateSaveDicomImage := DoSaveDicomImageEx;
      OnPrivateDicomGetRequest := DoDicomGetRequestEx;
    end;
  end;
 // else
   // raise Exception.Create('Not OK');
end;

procedure TDicomServerCore.DoSaveImage(AClientThread: TDicomClientThread; AAddress: AnsiString;
  ADataset: TDicomDataset);
begin
  if assigned(OnDicomImage) then
    OnDicomImage(AClientThread, AAddress, ADataset);
end;

procedure TDicomServerCore.DoLogit(AClientThread: TDicomClientThread; AIP, Msg: AnsiString);
begin
  if assigned(FOnDicomLogit) then
    FOnDicomLogit(AClientThread, AIP, '#1 '+Msg);
end;

procedure TDicomServerCore.DoLogDB(AClientThread: TDicomClientThread; AType, AIP, aDBStr, aSql: AnsiString; A1: TDicomAttributes);
begin
  if assigned(FOnDicomLogDB) then
    FOnDicomLogDB(AClientThread, AType, AIP, aDBStr, aSql, A1);
end;

procedure TDicomServerCore.DoLogException(AClientThread: TDicomClientThread; AIP, Msg: AnsiString);
begin
  if assigned(FOnDicomLogException) then
    FOnDicomLogException(AClientThread, AIP, Msg);
end;

procedure TDicomServerCore.DoDicomPrint(AClientThread: TDicomClientThread; AAddress: AnsiString;
  APrintTask: TDicomPrintTask);
begin
  if assigned(OnDicomFilmPrint) then
    OnDicomFilmPrint(AClientThread, AAddress, APrintTask);
end;

procedure TDicomServerCore.DoGetCMovePort(AClientThread: TDicomClientThread; AET: AnsiString; var
  AHost: AnsiString; var
  APort: Integer);
begin
  if assigned(OnGetCMoveLocalPort) then
    OnGetCMoveLocalPort(AClientThread, AET, AHost, APort);
end;

procedure TDicomServerCore.DoGetCMovePortEx(AClientThread: TDicomClientThread; AET: AnsiString; var
  AHost: AnsiString; var APort: Integer; var CallingAET, CalledAET: AnsiString; var ASynchronousCMove: Boolean);
begin
  if assigned(OnGetCMoveLocalPortEx) then
    OnGetCMoveLocalPortEx(AClientThread, AET, AHost, APort, CallingAET, CalledAET, ASynchronousCMove);
end;

procedure TDicomServerCore.TriggerAssociation(AClientThread: TDicomClientThread; AAddress: AnsiString;
  AReg: TRequest; var AHandleType: Integer);
begin
  if assigned(FOnDicomAssociation) then
    FOnDicomAssociation(AClientThread, AAddress, AReg, AHandleType);
end;

procedure TDicomServerCore.DicomFindRequest(AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnDicomFind) then
    OnDicomFind(AClientThread, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
end;

procedure TDicomServerCore.DicomGetRequest(AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnDicomGet) then
    OnDicomGet(AClientThread, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
end;

procedure TDicomServerCore.DicomMoveRequest(AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnDicomMove) then
    OnDicomMove(AClientThread, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
end;

function TDicomServerCore.FindServerObject(AFunctionCode: AnsiString): TServerObject;
var
  k, k1: AnsiString;
  l1, h1, m1: Integer;
  list1: TList;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomServerCore.FindServerObject', v_crt_log );

  k := AFunctionCode;
  l1 := 0;
  list1 := FServerList.LockList;
  try
    h1 := list1.Count - 1;
    Result := nil;
    while l1 <= h1 do
    begin
      m1 := (l1 + h1) div 2;
      k1 := TFunctionObject(list1[m1]).FunctionCode;
      if k1 > k then
        h1 := m1 - 1
      else
        if k1 < k then
        l1 := m1 + 1
      else
      begin
        Result := TFunctionObject(list1[m1]).FServerObjectClass.Create;
        exit;
      end;
    end; // while
  finally
    FServerList.UnlockList;
  end;
end;

/////////////////////////////////////////////////////////////////////////

constructor TDicomClientThread.Create(CreateSuspended: Boolean);
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.Create', v_crt_log );

  inherited Create(CreateSuspended);
  FPrintQueue := nil;
  FErrorCount := 0;
  //  FSQLQuery := nil;

  FAssociation := nil;

  FUserID := '';
  FUserName := '';
  //  FDatasetToSave := nil;
  FDataChannelThread := nil;
  //  fCurrentDatabase := nil;
  fSynchronousCMove := false;
  //  FDatasetToSave := nil;
  v_resp_DS_list := TStringList.Create;
  v_patientIDs := TStringList.Create;
  v_studyUIDs := TStringList.Create;
  v_seriesUIDs := TStringList.Create;
end;

destructor TDicomClientThread.Destroy;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.Destroy', v_crt_log );

  v_resp_DS_list.Free;
  v_patientIDs.Free;
  v_studyUIDs.Free;
  v_seriesUIDs.Free;
  //  TerminateAndFreeDataChannel;
    //  FPaxScripter := nil;
    //  FPaxPascal := nil;
  inherited;
end;

procedure TDicomClientThread.p_add_patientID(p_patientID:string);
begin
  v_patientIDs.Append(p_patientID);
end;

procedure TDicomClientThread.p_add_studyUID(p_studyUID:string);
begin
  v_studyUIDs.Append(p_studyUID);
end;

procedure TDicomClientThread.p_add_seriesUID(p_seriesUID:string);
begin
  v_seriesUIDs.Append(p_seriesUID);
end;

function TDicomClientThread.p_check_patientID(p_patientID:string) : Boolean;
begin
  Result := (v_patientIDs.IndexOf(p_patientID)<>-1);
  if not Result then p_add_patientID(p_patientID);
end;

function TDicomClientThread.p_check_studyUID(p_studyUID,p_PID,p_Modality:string) : Boolean;
var vStrTmp:string;
begin
  vStrTmp:=p_studyUID+' '+p_PID+' '+p_Modality;
  Result := (v_patientIDs.IndexOf(vStrTmp)<>-1);
  if not Result then p_add_studyUID(vStrTmp);
end;

function TDicomClientThread.p_check_seriesUID(p_seriesUID:string) : Boolean;
begin
  Result := (v_seriesUIDs.IndexOf(p_seriesUID)<>-1);
  if not Result then p_add_seriesUID(p_seriesUID);
end;

procedure TDicomClientThread.ProcessData;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.ProcessData', v_crt_log );

  if Terminated then
    exit;
  FAssociation := TAssociation.Create(Socket);
  FAssociation.ReceiveTimeout := -1;
  FAssociation.OnNewCommand := DoNewCommand;
  FAssociation.OnNewData := DoNewData;

  FPrintQueue := TDicomPrintQueue.Create;
  try
    FAssociation.Init;
    while not Terminated do
    try
      Run;
      ProcessWindowsMessageQueue;
    except
      on e: Exception do
      begin
        //Logit(Socket.PeerIPAddress, 'ProcessData:' + e.Message);
        break;
      end;
    end;
  finally
    if assigned(FAssociation) then
      FAssociation.Free;
    FAssociation := nil;

    FPrintQueue.Free;
    FPrintQueue := nil;

  end;
end;

procedure TDicomClientThread.ProcessFileRequest(i1: integer);
var
  fin1, fout1: TAssociateFilePdu;
  i: integer;
  das1, das2: TDicomAttributes;
  da1, da2: TDicomAttribute;
  stm1: TFileStream;
  memorystm1: TMemoryStream;
  //  str1:AnsiString;
  LogStrings: TStringList;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.ProcessFileRequest', v_crt_log );

  fin1 := TAssociateFilePdu.Create;
  try
    fin1.readCommand(FAssociation.Stream, i1);
    if (fin1.ReceiveCount > 0) and assigned(fin1.Command) then
    begin
      {if LowLevelLog and (KxConfig.LogIPAddress = Socket.PeerIPAddress) then
      begin
        LogStrings := TStringList.Create;
        fin1.Command.ListAttrinute('File command>:', LogStrings);
        Logit(Socket.PeerIPAddress, LogStrings.Text);
        LogStrings.Free;
      end; }

      da1 := fin1.Command.Item[$2813, $0110]; //ЅУКХІў±ЈґжНјПс
      if assigned(da1) and (da1.GetCount > 0) then
      begin
        for i := 0 to da1.GetCount - 1 do
        begin
          das1 := da1.Attributes[i];
          //ґґЅЁ±ШТЄµДДїВјј°МнјУТ»Р©КэѕЭµЅКэѕЭївЦР
          stm1 := nil;
          SaveDicomImageEx(self, das1, stm1);
          if assigned(stm1) then //das1.getInteger($2809, $1004) = 0 then
          begin
            //receive file and save
            try
              fin1.readData(FAssociation.Stream, stm1);

              FAssociation.Stream.WriteInt32(1);

              FAssociation.Stream.FreshData;
            finally
              stm1.Free;
            end;
          end
          else
          begin
            memorystm1 := TMemoryStream.Create;
            //receive file and save
            try
              fin1.readData(FAssociation.Stream, memorystm1);

              FAssociation.Stream.WriteInt32(0);

              FAssociation.Stream.FreshData;
            finally
              memorystm1.Free;
            end;
          end;
          fout1 := TAssociateFilePdu.Create;
          try
            das2 := TDicomAttributes.Create;
            das2.Add($2813, $0110);
            fout1.Command := das2;
            fout1.write(FAssociation.Stream);
          finally
            fout1.Free;
          end;
        end;
      end
      else
      begin
        da1 := fin1.Command.Item[$2813, $0111]; //ІйСЇІў·ўЛННјПс
        if assigned(da1) and (da1.GetCount > 0) then
        begin
          fout1 := TAssociateFilePdu.Create;
          try
            das2 := TDicomAttributes.Create;
            da2 := das2.Add($2813, $0111);
            fout1.Command := das2;

            for i := 0 to da1.GetCount - 1 do
            begin
              das1 := da1.Attributes[i];
              das1.AddVariant($2809, 5, Socket.PeerIPAddress);

              try
                DicomGetRequestEx(self, das1, da2, fout1.Streams, fout1.FileNameList);
              except
                on e: Exception do
                  Logit(Socket.PeerIPAddress, 'DicomGetRequestEx--' + e.Message);
              end;
            end;

            try
              fout1.write(FAssociation.Stream);
            except
              on e: Exception do
              begin
                Logit(Socket.PeerIPAddress, 'fout1.write--' + e.Message);
             //   raise;
              end;
            end;
          finally
            fout1.Free;
          end;
        end
        else
        begin
          da1 := fin1.Command.Item[$2813, $0112]; //КэѕЭївІЩЧч
          if assigned(da1) and (da1.GetCount > 0) then
          begin
            fout1 := TAssociateFilePdu.Create;
            try

              das2 := TDicomAttributes.Create;
              da2 := das2.Add($2813, $0112);

              fout1.Command := das2;

              for i := 0 to da1.GetCount - 1 do
              begin
                das1 := da1.Attributes[i];
                das1.AddVariant($2809, 5, Socket.PeerIPAddress);

                try
                  DBRequestEx(Socket.PeerIPAddress, self, das1, da2, fout1.Streams, fout1.FileNameList);
                except
                  on e: Exception do
                    Logit(Socket.PeerIPAddress, 'DicomGetRequestEx--' + e.Message);
                end;
              end;

              try
                fout1.write(FAssociation.Stream);
              except
                on e: Exception do
                begin
                  Logit(Socket.PeerIPAddress, 'fout1.write--' + e.Message);
                //  raise;
                end;
              end;
            finally
              fout1.Free;
            end;
          end
          else
          begin

            begin
              LogStrings := TStringList.Create;
              fin1.Command.ListAttrinute('File command>:', LogStrings);
              Logit(Socket.PeerIPAddress, LogStrings.Text);
              LogStrings.Free;
            end;

            fout1 := TAssociateFilePdu.Create;
            try
              das2 := TDicomAttributes.Create;
              fout1.Command := das2;
              das2.AddVariant($2809, $1003, 'Unknow command');
              das2.AddVariant($2809, $1004, 0);
              fout1.write(FAssociation.Stream);
              //Logit(Socket.PeerIPAddress, 'Unknow command');
            finally
              fout1.Free;
            end;
          end;
        end;
      end;
    end;
  finally
    fin1.Free;
  end;
end;

procedure TDicomClientThread.TriggerRequest(AAddress: AnsiString; ACommand: TDicomAttributes;
  ARequestDatasets, AResponseDatasets: TList; var AStatus: Integer);
var st1, x, y, i, k, p : Integer;
    str2, str1, s1: AnsiString;
    dd1: TDicomDataset;
    da0, da1, da2: TDicomAttributes;
    d1, d2: TDicomAttribute;
    dpt1: TDicomPrintTask;
  //  LogStrings: TStringList;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.TriggerRequest', v_crt_log );

  //  if Assigned(Connection.Server.FOnDicomRequest) then
  //    Connection.Server.FOnDicomRequest(AAddress, ACommand, ARequestDatasets, AResponseDatasets);
  st1 := ACommand.GetInteger(dStatus);
  if st1 <> 0 then
  begin
    Logit(AAddress, Format('Status=%d?Please tell ajfomin@gmail.com. Thanks', [st1]));
  end;
  i := getCommandType(ACommand);

  case i of
    C_DATABASE_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - C_DATABASE_REQUEST', v_crt_log );
        try
          DBRequest(AAddress, ACommand, ARequestDatasets, AResponseDatasets);
        except
          on E: Exception do
            Logit(AAddress, e.Message);
        end;
      end;
    N_EVENT_REPORT_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - N_EVENT_REPORT_REQUEST', v_crt_log );
        if assigned(OnNormalisedReceived) then
          OnNormalisedReceived(self, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
        if assigned(OnNormalisedReceivedNEventReport) then
          OnNormalisedReceivedNEventReport(self, AAddress, ACommand, ARequestDatasets,
            AResponseDatasets);
      end;
    N_GET_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - N_GET_REQUEST', v_crt_log );
        if assigned(OnNormalisedReceived) or assigned(OnNormalisedReceivedNGet) then
        begin
          if assigned(OnNormalisedReceived) then
            OnNormalisedReceived(self, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
          if assigned(OnNormalisedReceivedNGet) then
            OnNormalisedReceivedNGet(self, AAddress, ACommand, ARequestDatasets,
              AResponseDatasets);
        end
        else
        begin

          k := getRequestedSOPClass(ACommand);
          s1 := getRequestedSOPInstance(ACommand);
          if k = uidPrinter then
          begin
            da1 := TDicomAttributes.Create;
            AResponseDatasets.Add(da1);
            da1.AddVariant($0008, $0070, 'ChinaCnsoft'); //Manufacturer
            da1.AddVariant($0008, $1090, 'CnsoftKxPacs'); //ManufacturerModelName
            da1.AddVariant($0018, $1000, '20030901'); //DeviceSerialNumber
            da1.AddVariant($0018, $1020, '1.0001'); //SoftwareVersion
            da1.Add($0018, $1200); //DateOfLastCalibration
            da1.Add($0018, $1201); //TimeOfLastCalibration
            da1.AddVariant($2110, $0010, 'NORMAL'); //PrinterStatus
            da1.AddVariant($2110, $0020, 'NORMAL'); //PrinterStatusInfo
            da1.AddVariant($2110, $0030, 'Dicom2WindowPrinter'); //PrinterName
          end;
        end;
      end;
    N_SET_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - N_SET_REQUEST', v_crt_log );
        if assigned(OnNormalisedReceived) or assigned(OnNormalisedReceivedNSet) then
        begin
          if assigned(OnNormalisedReceived) then
            OnNormalisedReceived(self, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
          if assigned(OnNormalisedReceivedNSet) then
            OnNormalisedReceivedNSet(self, AAddress, ACommand, ARequestDatasets,
              AResponseDatasets);
        end
        else
        begin

          k := getRequestedSOPClass(ACommand);
          s1 := getRequestedSOPInstance(ACommand);
          if (k = BasicGrayscaleImageBox) or (k = BasicColorImageBox) then
          begin
            da0 := TDicomAttributes(ARequestDatasets[0]);
            dpt1 := FPrintQueue.Items[AAddress];
            if assigned(dpt1) then
            begin
              da1 := da0.Item[$2020, $110].Attributes[0];
              da0.Item[$2020, $110].ClearDataArray;
              dpt1.AddDataset(TDicomDataset.Create(da1));
            end
            else
              Logit(AAddress, 'IS' + AAddress + ',not init dicom print');
          end;
        end;
      end;
    N_ACTION_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - N_ACTION_REQUEST', v_crt_log );
        if assigned(OnNormalisedReceived) or assigned(OnNormalisedReceivedNAction) then
        begin
          if assigned(OnNormalisedReceived) then
            OnNormalisedReceived(self, AAddress, ACommand, ARequestDatasets, AResponseDatasets);

          if assigned(OnNormalisedReceivedNAction) then
            OnNormalisedReceivedNAction(self, AAddress, ACommand, ARequestDatasets,
              AResponseDatasets);
        end
        else
        begin
          k := getRequestedSOPClass(ACommand);
          s1 := getRequestedSOPInstance(ACommand);
          if k = BasicFilmBox then
          begin
            dpt1 := FPrintQueue.Items[AAddress];
            if assigned(dpt1) then
            begin
              if assigned(OnDicomFilmPrint) then
                OnDicomFilmPrint(self, AAddress, dpt1)
              else
              begin
                if (dpt1.FList.Count > 0) then
                begin
                  if printer.Printers.Count <= 0 then
                  begin
                    Logit(AAddress, 'IP=' + AAddress +
                      ',a dicom print data comein.but no printer');
                  end
                  else
                  begin
                    if dpt1.PrintOrientation[1] = 'P' then
                      Printer.Orientation := poPortrait
                    else
                      Printer.Orientation := poLandscape;

                    Printer.BeginDoc;
                    try
                      try
                        dpt1.Print(Printer.Canvas, 0, 0, Printer.PageWidth, Printer.PageHeight);
                      except
                        on e: Exception do
                          Logit(AAddress, 'IP=' + AAddress + ',print Error:' + e.Message);
                      end;
                    finally
                      Printer.EndDoc;
                    end;
                  end;
                end
                else
                  Logit(AAddress, 'IP' + AAddress + ',no print image');
              end;
            end
            else
              Logit(AAddress, 'IP' + AAddress + ',no init dicom print');
          end;
        end;
      end;
    N_DELETE_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - N_DELETE_REQUEST', v_crt_log );
        if assigned(OnNormalisedReceived) or assigned(OnNormalisedReceivedNDelete) then
        begin
          if assigned(OnNormalisedReceived) then
            OnNormalisedReceived(self, AAddress, ACommand, ARequestDatasets, AResponseDatasets);

          if assigned(OnNormalisedReceivedNDelete) then
            OnNormalisedReceivedNDelete(self, AAddress, ACommand, ARequestDatasets,
              AResponseDatasets);
        end
        else
        begin
          k := getRequestedSOPClass(ACommand);
          s1 := getRequestedSOPInstance(ACommand);
          if k = BasicFilmBox then
          begin
            FPrintQueue.Delete(AAddress);
          end;
        end;
      end;
    N_CREATE_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - N_CREATE_REQUEST', v_crt_log );

       // for p := 0 to ARequestDatasets.Count - 1 do

        if assigned(OnNormalisedReceived) or assigned(OnNormalisedReceivedNCreate) then
        begin
          if assigned(OnNormalisedReceived) then
            OnNormalisedReceived(self, AAddress, ACommand, ARequestDatasets, AResponseDatasets);

          if assigned(OnNormalisedReceivedNCreate) then
            OnNormalisedReceivedNCreate(self, AAddress, ACommand, ARequestDatasets,
              AResponseDatasets);
        end
        else
        begin
          k := getAffectedSOPClass(ACommand);
          s1 := getAffectedSOPInstance(ACommand);
          if k = BasicFilmSession then
          begin

          end
          else
            if k = BasicFilmBox then
          begin
            dpt1 := FPrintQueue.Add(AAddress);
            da0 := TDicomAttributes(ARequestDatasets[0]);
            da1 := CopyAttributes(da0);
            AResponseDatasets.Add(da1);
            d1 := da1.Add($2010, $0510);
            dpt1.PrintFormat := da1.GetString($2010, $10);
            dpt1.PrintOrientation := da1.GetString($2010, $40);
            dpt1.FilmSize := da1.GetString($2010, $50);
            d2 := da0.Item[$2010, $10];
            str1 := d2.AsString[1];
            i := Pos(',', str1);
            str2 := Trim(Copy(str1, 1, i - 1));
            if str2 <> '' then
              x := StrToInt(str2)
            else
              x := 1;
            str2 := Trim(Copy(str1, i + 1, Length(str1)));
            if str2 <> '' then
              y := StrToInt(str2)
            else
              y := 1;
            dpt1.Rows := y;
            dpt1.Columns := x;
            for i := 0 to x * y - 1 do
            begin
              da2 := TDicomAttributes.Create;
              da2.AddVariant($0008, $1150, '1.2.840.10008.5.1.1.4');
              da2.AddVariant($0008, $1155, '1.2.40.0.13.0.192.168.1.10.26613121.1060274004593.' +
                IntToStr(i));
              //            dpt1.FInstanceList.Add('1.2.40.0.13.0.192.168.1.10.26613121.1060274004593.' + IntToStr(i));
              d1.AddData(da2);
            end;
          end;
        end;
      end;
    C_STORE_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - C_STORE_REQUEST', v_crt_log );
        //write save image to db and filesystem
        for p := 0 to ARequestDatasets.Count - 1 do
        begin
          dd1 := TDicomDataset.Create(TDicomAttributes(ARequestDatasets[p]));
          if assigned(FOnDicomImage) then
            FOnDicomImage(self, AAddress, dd1);
        end;

        ARequestDatasets.Clear;

        {FDatasetToSave := dd1;
        SaveDicomImage;
        FDatasetToSave := nil; }
      end;
    C_GET_REQUEST:
      begin
        v_is_move:=False;
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - C_GET_REQUEST', v_crt_log );
        if assigned(OnDicomGet) then
          OnDicomGet(self, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
      end;
    C_FIND_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - C_FIND_REQUEST', v_crt_log );
        if assigned(OnDicomFind) then
          OnDicomFind(self, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
      end;
    C_MOVE_REQUEST:
      begin
        v_is_move:=True;
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - C_MOVE_REQUEST', v_crt_log );
        if assigned(OnDicomMove) then
          OnDicomMove(self, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
      end;
    C_ECHO_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - C_ECHO_REQUEST', v_crt_log );
      end;
    C_CANCEL_FIND_REQUEST:
      begin
        Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - C_CANCEL_FIND_REQUEST', v_crt_log );
      end;
  end;
  Dcm_Server_wrt_log('TDicomClientThread.TriggerRequest - FAssociation.ReturnStatus='+inttostr(FAssociation.ReturnStatus), v_crt_log );
  AStatus := FAssociation.ReturnStatus;
end;

procedure TDicomClientThread.Logit(AIP, Msg: AnsiString);
begin
  if assigned(FOnDicomLogit) then
    FOnDicomLogit(self, AIP, '#2 '+Msg);
  //  KXConfig.Logit(AIP, Msg);
end;

procedure TDicomClientThread.LogDB(AType, AIP, aDBStr, aSql: AnsiString; A1: TDicomAttributes);
begin
  if assigned(FOnDicomLogDB) then
    FOnDicomLogDB(self, AType, AIP, aDBStr, aSQL, A1);
  //  KXConfig.Logit(AIP, Msg);
end;

procedure TDicomClientThread.LogException(AIP, ErrorMsg: AnsiString);
begin
  if assigned(FOnDicomLogException) then
    FOnDicomLogException(self, AIP, ErrorMsg);
  //  KXConfig.LogException(AIP, ErrorMsg);
end;

procedure TDicomClientThread.DBRequestEx(AAddress: AnsiString; AClientThread: TDicomClientThread;
  rq: TDicomAttributes; ADstCommand: TDicomAttribute;
  AResponseStreams: TList; AResponseFiles: TStringList);
var
  k: Integer;
  p1: TServerObject;
  as1: TDicomAttributes;
  str1: AnsiString;

//  LogStrings: TStringList;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.DBRequestEx', v_crt_log );

  if (rq <> nil) and (rq.Count > 0) then
  begin
    str1 := Uppercase(Trim(rq.GetString($2809, 1)));
    p1 := FParent.FindServerObject(str1);
    if assigned(p1) then
    try
      p1.RequestCommand := rq;
      p1.FetchCount := p1.RequestCommand.GetInteger($2809, $0011);
      p1.ResponseDataset := TDicomAttributes.Create;
      p1.Address := AAddress;
      p1.fDicomServerCore := self.FParent;

      //is request stream
      p1.RequestType := 1;
      p1.RequestCommand.AddVariant($2813, $0120, 1);
      //p1.RequestCommand.AddVariant();

      ADstCommand.AddData(p1.ResponseDataset);

      try
        p1.Execute(self);
      except
        on e: Exception do
        begin
          Logit(AAddress, 'ServerObject:' + e.Message);
        end;
      end;

      if p1.ResponseStreams.Count > 0 then
      begin
        p1.ResponseDataset.AddVariant($2813, $0120, p1.ResponseStreams.Count);
        for k := 0 to p1.ResponseStreams.Count - 1 do
        begin
          AResponseStreams.Add(p1.ResponseStreams[k]);
        end;
      end
      else
        if p1.ResponseFiles.Count > 0 then
      begin
        p1.ResponseDataset.AddVariant($2813, $0120, p1.ResponseFiles.Count);
        for k := 0 to p1.ResponseFiles.Count - 1 do
        begin
          AResponseFiles.Add(p1.ResponseFiles[k]);
        end;
      end;
      p1.ResponseStreams.Clear;
      p1.ResponseFiles.Clear;

      //for debug
      {LogStrings := TStringList.Create;
      try
        p1.ResponseDataset.ListAttrinute('p1.ResponseDataset', LogStrings);
        Logit(AAddress, LogStrings.Text);
      finally
        LogStrings.Free;
      end;  }

    finally
      p1.Free;
    end
    else
    begin
      as1 := TDicomAttributes.Create;
      ADstCommand.AddData(as1);

      as1.AddVariant($2809, $1003, 'Unknow Service Name:' + rq.GetString($2809, 1));
      as1.AddVariant($2809, $1004, 0);
      Logit(AAddress, 'Unknow Service Name:' + rq.GetString($2809, 1));
    end;
  end;
end;

procedure TDicomClientThread.DBRequest(AAddress: AnsiString; ACommand: TDicomAttributes;
  ARequestDatasets, AResponseDatasets: TList);
var
  k: Integer;
  p1: TServerObject;
  as1: TDicomAttributes;
  str1: AnsiString;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.DBRequest', v_crt_log );

  if DataPresent(ACommand) and (ARequestDatasets.Count > 0) then
  begin
    for k := 0 to ARequestDatasets.Count - 1 do // Iterate
    begin
      str1 := Uppercase(Trim(TDicomAttributes(ARequestDatasets[k]).GetString($2809, 1)));
      p1 := FParent.FindServerObject(str1);
      if assigned(p1) then
      try
        p1.RequestCommand := TDicomAttributes(ARequestDatasets[k]);
        p1.FetchCount := p1.RequestCommand.GetInteger($2809, $0011);
        p1.ResponseDataset := TDicomAttributes.Create;
        p1.Address := AAddress;
        p1.fDicomServerCore := self.FParent;

        AResponseDatasets.Add(p1.ResponseDataset);

        try
          p1.Execute(self);
        except
          on e: Exception do
          begin
            Logit(AAddress, 'ServerObject:' + e.Message);
          end;
        end;

      finally
        p1.Free;
      end
      else
      begin
        as1 := TDicomAttributes.Create;
        AResponseDatasets.Add(as1);
        as1.AddVariant($2809, $1003, 'Unknow Service Name:' +
          TDicomAttributes(ARequestDatasets[k]).GetString($2809, 1));
        as1.AddVariant($2809, $1004, 0);
        Logit(AAddress, 'Unknow Service Name:' +
          TDicomAttributes(ARequestDatasets[k]).GetString($2809, 1));
      end;
    end;
  end;
end;

function TDicomClientThread.prepareResponseEx(request: TRequest; s: AnsiString; astr: TStrings;
  flag: Boolean): TDicomResponse;
var
  flag1: Boolean;
  j: Integer;
  acknowledge: TAcknowledge;
  k: Integer;
  uidentry: TUIDEntry;
  //  l: Integer;
  //  j1: Integer;
  //  uidentry1: TUIDEntry;
  flag2: Boolean;
  i1: Integer;
  str1, str2: AnsiString;
  function SupportTransferSyntax(AIndex, ASyntax: Integer): Boolean;
  var
    j1: integer;
    uidentry1: TUIDEntry;
  begin
    Result := false;
    for j1 := 0 to request.getTransferSyntaxes(AIndex) - 1 do
    begin
      uidentry1 := request.getTransferSyntax(AIndex, j1);
      if uidentry1.Constant = ASyntax then
      begin
        Result := true;
        acknowledge.addPresentationContext(request.getPresentationContextID(AIndex), 0, ASyntax);
        break;
      end;
    end;
  end;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.prepareResponseEx', v_crt_log );

  if request.isPrivateApplicationContext then
  begin
    result := TDicomReject.Create(REJECTED_PERMANENT,
      DICOM_UL_SERVICE_USER_reject, USER_APPLICATIONCONTEXTNAME_NOT_SUPPORTED);
    exit;
  end;
  if (s <> '') and (request.CalledTitle <> (s)) then
  begin
    result := TDicomReject.Create(REJECTED_PERMANENT,
      DICOM_UL_SERVICE_USER_reject, USER_CALLED_AETITLE_NOT_RECOGNIZED);
    exit;
  end;
  flag1 := TRUE;
  if assigned(astr) and (astr.Count > 0) then
  begin
    j := 0;
    while j < astr.Count do
    begin
      if request.CallingTitle = (astr[j]) then
      begin
        flag1 := FALSE;
      end;
      Inc(j);
    end;
    if flag1 then
    begin
      result := TDicomReject.Create(REJECTED_PERMANENT,
        DICOM_UL_SERVICE_USER_reject, USER_CALLING_AETITLE_NOT_RECOGNIZED);
      exit;
    end;
  end;
  acknowledge := TAcknowledge.Create;
  if request.MaxPduSize >= 16384 then
    acknowledge.MaxPduSize := request.MaxPduSize
  else
    acknowledge.MaxPduSize := 16384;

  acknowledge.CalledTitle := trim(request.CalledTitle);
  acknowledge.CallingTitle := trim(request.CallingTitle);

  acknowledge.ApplicationContextUid := request.ApplicationContextUid;
  str1 := Uppercase(request.CalledTitle);
  str2 := Uppercase(request.CallingTitle);
  for k := 0 to request.getPresentationContexts - 1 do
  begin
    uidentry := request.getAbstractSyntax(k);
    //    for l := 0 to length(ai) - 1 do
    if (uidentry.UIDType = 1) or (uidentry.UIDType = 4) then
    begin
      str1 := Uppercase(request.CalledTitle);
      {if (str1 = 'CNS') or (str1 = 'ECT') or (str1 = 'ECT1') or (str1 = 'ADVT') or
        (str1 = 'ANYICT') then
      begin
        if not SupportTransferSyntax(k, ExplicitVRLittleEndian) then
          acknowledge.addPresentationContext(request.getPresentationContextID(k), 4,
            ExplicitVRLittleEndian);
      end
      else }
      begin
        {$IFDEF ECLZLIBTransferSyntax}
        if not SupportTransferSyntax(k, bzipFastestTransferSyntax) then
          if not SupportTransferSyntax(k, ppmFastestTransferSyntax) then
            if not SupportTransferSyntax(k, zlibFastestTransferSyntax) then //}
              {$ENDIF}
              if not SupportTransferSyntax(k, JPEG2000Reversible) then
                if not SupportTransferSyntax(k, JPEG2000Irreversible) then
                  {  if not SupportTransferSyntax(k, JPEGLossless80) then
                      if not SupportTransferSyntax(k, JPEGNearLossless81) then }
                  if not SupportTransferSyntax(k, JPEGLossless) then
                    if not SupportTransferSyntax(k, JPEGLossless14) then
                      if not SupportTransferSyntax(k, JPEGLossless15) then
                        if not SupportTransferSyntax(k, JPEGBaseline) then
                          if not SupportTransferSyntax(k, JPEGExtendedProcess_2_4) then //}
                            if not SupportTransferSyntax(k, RLELossless) then
                              if not SupportTransferSyntax(k, ImplicitVRLittleEndian) then //}
                                if not SupportTransferSyntax(k, ExplicitVRLittleEndian) then //}
                                  if not SupportTransferSyntax(k, ExplicitVRBigEndian) then //}
                                    acknowledge.addPresentationContext(request.getPresentationContextID(k), 4,
                                      ExplicitVRLittleEndian);
        //acknowledge.addPresentationContext(request.getPresentationContextID(k), 3, i);
        //Logit(str2, 'No Accept TransferSyntax:' + uidentry.AsLongString);
      end;
    end;
  end;

  if flag then
  begin
    flag2 := TRUE;
    for i1 := 0 to acknowledge.getPresentationContexts - 1 do
    begin
      if acknowledge.getResult(i1) = 0 then
        flag2 := FALSE;
    end;
    if flag2 then
    begin
      result := TDicomReject.Create(REJECTED_PERMANENT,
        DICOM_UL_SERVICE_USER_reject, USER_NO_REASON_GIVEN);
      exit;
    end;
  end;
  result := acknowledge;
end;

procedure SendImageForCMove(AAssociation: TAssociation; ACommand: TDicomAttributes;
  fToSendDatasets: TList; AClientIP: AnsiString; APort: Integer;
  CalledTitle, CallingTitle: AnsiString);
var
  d1: TCnsDicomConnection;
  DataAttributes: TDicomAttributes;
  i1, k: Integer;
begin
  Dcm_Server_wrt_log('unit DCM_Server SendImageForCMove', v_crt_log );

  //if assigned(fToSendDatasets) then
  try
    for i1 := 0 to fToSendDatasets.Count - 1 do
    begin
      DataAttributes := TDicomAttributes(fToSendDatasets[i1]);

      d1 := TCnsDicomConnection.Create(nil);
      try
        d1.MySetTransferSyntax( DataAttributes.ImageData.ImageData[0].TransferSyntax );
        d1.Host := AClientIP;
        d1.Port := APort;
        d1.CanRetryConnected := false;
        d1.CallingTitle := CallingTitle;
        d1.CalledTitle := CalledTitle;
        d1.MaxPduSize := AAssociation.Request.MaxPduSize;
        if not d1.C_STORAGE(DataAttributes) then
        begin
          break;
          k := i1;
        end;
        d1.Disconnect;
      finally
        d1.Free;
      end;

      //send
      ACommand.AddVariant(dNumberOfRemainingSuboperations, fToSendDatasets.Count - i1 - 1);
      ACommand.AddVariant(dNumberOfCompletedSuboperations, i1 + 1);
      ACommand.AddVariant(dNumberOfFailedSuboperations, 0);
      ACommand.AddVariant(dStatus, 0);
      ACommand.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);

      AAssociation.ResponseDataPdu(ACommand, nil);

    end;
  finally
    for i1 := 0 to fToSendDatasets.Count - 1 do
    begin
      TDicomAttributes(fToSendDatasets[i1]).Free;
    end;
    fToSendDatasets.Clear;
    //FreeAndNil(fToSendDatasets);

  end;
end;

procedure TStoreThread.Execute;
var CnsDicomConnection1 : TCnsDicomConnection;
    v_CnsDMTable_tmp : TCnsDMTable;
    i, j, nn : Integer;
    DataAttributes: TDicomAttributes;
    v_DCMAttr: TDicomAttributes;
    v_echo_res : Boolean;
    v_str_tmp : string;
    MyTUIDEntry, MyCheckTS: TUIDEntry;
const
  // Timeout для приема/передачи данных
  c_Timeout = 1000*60 * 2; // 2 минуты
begin
  Dcm_Server_wrt_log('unit DCM_Server TStoreThread.Execute', v_crt_log );

  CnsDicomConnection1 := TCnsDicomConnection.Create(nil); //  v_TransferSyntax
  try
    v_str_tmp:='';
    Dcm_Server_wrt_log('--- TStoreThread.Execute: Acknowledge TransferSyntaxes:', v_crt_log);
    if FMyTransferSyntax>0 then
    begin
      CnsDicomConnection1.MySetTransferSyntax(FMyTransferSyntax);
    end else
    begin
      for I := 0 to Length(FTransferSyntaxs) - 1 do
      begin
        MyTUIDEntry := ( FTransferSyntaxs[i] as TUIDEntry );
        Dcm_Server_wrt_log(IntToStr( MyTUIDEntry.Constant )+'      '+
            MyTUIDEntry.Name + '      ' + MyTUIDEntry.AsString
            , v_crt_log);
        if ((i=0) or (MyTUIDEntry.Constant=ExplicitVRLittleEndian)) then // или первый в списке или по-умолчанию
        begin
          MyCheckTS:=MyTUIDEntry;
          if MyTUIDEntry.Constant=ExplicitVRLittleEndian then Break;
        end;
      end;
      Dcm_Server_wrt_log('--- TStoreThread.Execute: MyCheckTS : '+ IntToStr( MyCheckTS.Constant )+'      '+
            MyCheckTS.Name + '      ' + MyCheckTS.AsString , v_crt_log);

      CnsDicomConnection1.MySetTransferSyntax(MyCheckTS.Constant);  //  JPEGLossless   ImplicitVRLittleEndian       ExplicitVRLittleEndian
    end;
    CnsDicomConnection1.Host := Host;
    CnsDicomConnection1.Port := Port;                
    CnsDicomConnection1.CalledTitle := CalledTitle;
    CnsDicomConnection1.CallingTitle := CallingTitle;
    CnsDicomConnection1.ReceiveTimeout := c_Timeout;
    CnsDicomConnection1.MaxPduSize := MaxPduSize;
    DCM_Connection.PDUTempPath:=GetTempDirectory;

    for j := 0 to FFileList.Count - 1 do
    begin
      v_CnsDMTable_tmp := TCnsDMTable.Create(nil);
      try
        v_CnsDMTable_tmp.LoadFromFile( FFileList[j] );
        for i := 0 to v_CnsDMTable_tmp.Count - 1 do
        begin
          v_DCMAttr:=v_CnsDMTable_tmp[i].Attributes;

          if v_private_tags then // грузим изображение "как оно есть" в тег :)
          begin
            v_DCMAttr.Add($2006, $0001);
            v_DCMAttr.Item[$2006, $0001].LoadFromFile( FFileList[j] );
          end;


          If CnsDicomConnection1.C_STORAGE( v_DCMAttr ) then
          begin
          end else
          begin
          end;
        end;
      finally
        v_CnsDMTable_tmp.Clear;
        v_CnsDMTable_tmp.Free;
      end;
    end;
  finally
    CnsDicomConnection1.Association.Clear;
    CnsDicomConnection1.Disconnect;
    CnsDicomConnection1.Free;
  end;
end;

procedure TDicomClientThread.Run;
var req: TRequest;
  cn1, i1, QueryImageCount, CMovePort1,
  AAccept, k, ReturnStatus, l: Integer;
  r11, r: TDicomResponse;
  da1, CommandAttributes,
  DataAttributes: TDicomAttributes;
  ResponseDatasets: TList;
  nn: TDicomAbort;
  CMoveHost, v_str_tmp,
  str1, str2: AnsiString;
  r1, sync1: Boolean;

  v_MoveDestination:string;
  v_getCommandType : Integer;
  MyTUIDEntry : TUIDEntry;

  v62 : string; vconst : Integer;

 // v_TStoreThread : TStoreThread;
  v_CnsDMTable_tmp : TCnsDMTable;
  vMemoryStream : TMemoryStream;
  Dds : TDicomDataset;
begin
  Dcm_Server_wrt_log('DCM_Server TDicomClientThread.Run', v_crt_log );

  //  if Socket.ReceiveLength > 0 then
  begin
    if not Socket.Connected then       // 30.08.2012 FOMIN
      Terminate;
//      raise Exception.Create('Disconnect');

    k := FAssociation.ReadPduType;
    Dcm_Server_wrt_log('FAssociation.ReadPduType='+IntToStr(k), v_crt_log);
    if not Socket.Connected then      // 30.08.2012 FOMIN
      Terminate;
//      raise Exception.Create('Disconnect');
    Dcm_Server_wrt_log('TDicomClientThread.Run - FAssociation.ReadPduType='+inttostr(k), v_crt_log );
    case k of
      7:
        begin
          nn := FAssociation.receiveAbort(k);
          Dcm_Server_wrt_log('FAssociation.receiveAbort(k)', v_crt_log );
          Logit(Socket.PeerIPAddress, nn.Text);
          //raise Exception.Create('receiveAbort');
          Terminate;
        end;
      2:
        begin
          r11 := FAssociation.receiveAssociateResponse(k);
          Dcm_Server_wrt_log('FAssociation.receiveAssociateResponse(k)', v_crt_log );
          //r11.Free;
        end;
      1:
        begin
          FAssociation.Init;
          FLoginTime := now;
          FUsername := '';
          FUserID := '';
          req := FAssociation.receiveAssociateRequest(k);
          Dcm_Server_wrt_log('FAssociation.receiveAssociateRequest(k)', v_crt_log );
          AAccept := 1;
          if assigned(FOnDicomAssociation) then
            FOnDicomAssociation(self, Socket.PeerIPAddress, req, AAccept);
          //        KxConfig.Logit(Socket.PeerIPAddress, req.Text);
          if AAccept = 1 then
          begin
            try
              r := prepareResponseEx(req, '', nil, true);
            except
              on e: Exception do
              begin
                Logit(Socket.PeerIPAddress, 'prepareResponse:' + e.Message);
              //  raise;
              end;
            end;
            Association.sendAssociateResponse(r);
          end
          else
            if AAccept = 0 then
          begin
            r := TDicomReject.Create(1, 1, 1);
            Logit(Socket.PeerIPAddress, r.Text);
            Association.sendAssociateResponse(r);
            Dcm_Server_wrt_log('Association.sendAssociateResponse(r)', v_crt_log );
          end;
        end;
      5:
        begin //sendReleaseRequest
          FAssociation.receiveReleaseRequest(k);
          Dcm_Server_wrt_log('FAssociation.receiveReleaseRequest(k)', v_crt_log );
          FAssociation.sendReleaseResponse;
          //raise Exception.Create('receiveReleaseRequest');
          Terminate;
        end;
      6:
        begin
          FAssociation.receiveReleaseResponse(k);
          Dcm_Server_wrt_log('FAssociation.receiveReleaseResponse(k)', v_crt_log );
          //            FAssociation.Clear;
        end;
      $44:
        begin
          try
            ProcessFileRequest(k);
            Dcm_Server_wrt_log('ProcessFileRequest(k)', v_crt_log );
          except
            on e: Exception do
            begin
              LogIt(Socket.PeerIPAddress, 'ProcessFileRequest:' + E.Message);
            //  raise;
            end;
          end;
        end;
      4:
        begin
          try
            r1 := FAssociation.ReceiveDataPdu(k);
            Dcm_Server_wrt_log('FAssociation.ReceiveDataPdu(k)', v_crt_log );
          except
            on e: Exception do
            begin
              LogIt(Socket.PeerIPAddress, 'ReceiveDataPdu: ' + E.Message);
              r1 := TRUE;
            end;
          end;
          cn1 := getCommandType(FAssociation.ReceiveCommand);
        {  if cn1=N_CREATE_REQUEST then   // потом посмотреть почему так сделано
            r1 := TRUE; }
          if r1 then
          begin
            //KXImageServerMainForm.LogMemo.Lines.Add(IntToStr(FAssociation.PresentationContextId));
    //            FAssociation.ReceiveCommand.ListAttrinute('REV:',kxImsForm.Memo1.Lines);
            v_getCommandType := getCommandType(FAssociation.ReceiveCommand) ;
            if v_getCommandType < 32000 then
            begin

              Dcm_Server_wrt_log('v_getCommandType < 32000 ='+IntToStr(v_getCommandType), v_crt_log );

              ResponseDatasets := TList.Create;
              CommandAttributes := FAssociation.PrepareResponseCommand;
              FAssociation.ResponseCommand := CommandAttributes;
              if not assigned(CommandAttributes) then
              begin
                LogIt(Socket.PeerIPAddress, 'not assigned(CommandAttributes) - FAssociation.sendAbort');
                FAssociation.sendAbort(DICOM_UL_SERVICE_PROVIDER, UNEXPECTED_PDU);
                exit;
              end;
              try
                try
                  ReturnStatus := 0;
                  Dcm_Server_wrt_log('TriggerRequest', v_crt_log );
                  TriggerRequest(Socket.PeerIPAddress, FAssociation.ReceiveCommand,
                    FAssociation.ReceiveDatasets,
                    ResponseDatasets, ReturnStatus);
                except
                  on e: Exception do
                  begin
                    v_str_tmp:='';
                    if (FAssociation.ReceiveCommand=nil) then v_str_tmp:=v_str_tmp+' FAssociation.ReceiveCommand=nil ';
                    if (FAssociation.ReceiveDatasets=nil) then v_str_tmp:=v_str_tmp+' FAssociation.ReceiveDatasets=nil ';

                    LogIt(Socket.PeerIPAddress, 'TriggerRequest:' + E.Message);
                    if Trim(v_str_tmp)<>'' then
                      LogIt(Socket.PeerIPAddress, 'TriggerRequest:' + v_str_tmp);
                    LogIt(Socket.PeerIPAddress, 'TriggerRequest:' + E.Message);
                    FAssociation.Clear;
                    FAssociation.sendAbort(0, 0);
                    //FAssociation.Clear;
                  //  raise;
                  end;
                end;
                Dcm_Server_wrt_log('#2574 before cn1 := getCommandType(FAssociation.ReceiveCommand);', v_crt_log );
                cn1 := getCommandType(FAssociation.ReceiveCommand);
                Dcm_Server_wrt_log('getCommandType(FAssociation.ReceiveCommand)='+IntToStr(cn1), v_crt_log );
                if ResponseDatasets.Count > 0 then
                begin
                  Dcm_Server_wrt_log('ResponseDatasets.Count='+inttostr(ResponseDatasets.Count), v_crt_log );
                  case cn1 of
                    C_GET_REQUEST:
                      begin
                        Dcm_Server_wrt_log( 'C_GET_REQUEST: Подготовка к отправке '+IntToStr( ResponseDatasets.Count )+
                                            ' снимков' , v_crt_log);
                        for i1 := 0 to v_resp_DS_list.Count - 1 do
                        begin
                          Dcm_Server_wrt_log( 'C_GET_REQUEST: отправка '+
                                              inttostr(i1) + ' / '+IntToStr( ResponseDatasets.Count ) , v_crt_log);
                          Dds := TDicomDataset.Create;
                          try
                            try
                              if FileExists(v_resp_DS_list[i1]) then
                              begin
                                Dds.LoadFromFile(v_resp_DS_list[i1]);
                                if v_private_tags then // грузим изображение "как оно есть" в тег :)
                                begin
                                  Dds.Attributes.Add($2006, $0001); //. . := vAttr;
                                  Dds.Attributes[$2006, $0001].LoadFromFile(v_resp_DS_list[i1]);
                                end;
                                DataAttributes := Dds.Attributes;
                                try          //                          FAssociation.ResponseDataPdu(da1, DataAttributes);
                                  try
                                    v62 := DataAttributes.GetString(62) ;
                                    vconst := UIDS.Items[DataAttributes.GetString(62)].Constant ;
                                    da1 := createStoreRequest(i1,
                                      UIDS.Items[DataAttributes.GetString(62)].Constant, 0,
                                      DataAttributes.GetString(63), '', '');
                                    Dcm_Server_wrt_log( 'C_GET_REQUEST: отправка '+
                                                  IntToStr( i1 )+'/'+IntToStr( ResponseDatasets.Count )+
                                                  ' снимков' , v_crt_log);
                                    FAssociation.SendDataPduBySOP(UIDS.Items[
                                      DataAttributes.GetString(62)].Constant, da1, DataAttributes);
                                  except
                                    on e: Exception do
                                    begin
                                      FAssociation.sendAbort(ABSTRACT_SYNTAX_NOT_SUPPORTED, 3);
                                      Dcm_Server_wrt_log('DicomTransferFail ABSTRACT_SYNTAX_NOT_SUPPORTED '+DataAttributes.GetString(62) + #13#10 +
                                        e.Message, v_crt_log );
                                      Logit(Socket.PeerIPAddress, 'DicomTransferFail ABSTRACT_SYNTAX_NOT_SUPPORTED '+DataAttributes.GetString(62) + #13#10 +
                                        e.Message);
                                      break;
                                    end
                                  end;
                                finally
                                  da1.Free;
                                end;
                              end else
                                Dcm_Server_wrt_log( 'File : '+ v_resp_DS_list[i1]+' not found ...', v_crt_log);
                            except
                            on E:Exception do
                              Dcm_Server_wrt_log( '#8 ERROR : '+E.Message , v_crt_log);
                            end;
                          finally
                            Dds.Free;
                          end;
                        end;


                      {  for i1 := 0 to ResponseDatasets.Count - 1 do
                        begin
                          DataAttributes := TDicomAttributes(ResponseDatasets[i1]);
                          try          //                          FAssociation.ResponseDataPdu(da1, DataAttributes);
                            try
                              v62 := DataAttributes.GetString(62) ;
                              vconst := UIDS.Items[DataAttributes.GetString(62)].Constant ;
                              da1 := createStoreRequest(i1,
                                UIDS.Items[DataAttributes.GetString(62)].Constant, 0,
                                DataAttributes.GetString(63), '', '');
                              Dcm_Server_wrt_log( 'C_GET_REQUEST: отправка '+
                                            IntToStr( i1 )+'/'+IntToStr( ResponseDatasets.Count )+
                                            ' снимков' , v_crt_log);
                              FAssociation.SendDataPduBySOP(UIDS.Items[
                                DataAttributes.GetString(62)].Constant, da1, DataAttributes);
                            except
                              on e: Exception do
                              begin
                                FAssociation.sendAbort(ABSTRACT_SYNTAX_NOT_SUPPORTED, 3);
                                Dcm_Server_wrt_log('DicomTransferFail ABSTRACT_SYNTAX_NOT_SUPPORTED '+DataAttributes.GetString(62) + #13#10 +
                                  e.Message, v_crt_log );
                                Logit(Socket.PeerIPAddress, 'DicomTransferFail ABSTRACT_SYNTAX_NOT_SUPPORTED '+DataAttributes.GetString(62) + #13#10 +
                                  e.Message);
                                break;
                              end
                            end;
                          finally
                            da1.Free;
                          end;
                        end; }
                      end;
                    C_FIND_REQUEST:
                      begin
                        Dcm_Server_wrt_log('C_FIND_REQUEST', v_crt_log );

                        Dcm_Server_wrt_log( 'C_FIND_REQUEST: Подготовка к отправке списка из '+IntToStr( ResponseDatasets.Count )+
                                            ' записей' , v_crt_log);

                        for i1 := 0 to ResponseDatasets.Count - 1 do
                        begin
                          {if i1 = (ResponseDatasets.Count - 1) then
                          begin
                            CommandAttributes.AddVariant(dStatus, 0);
                          end; }
                          DataAttributes := TDicomAttributes(ResponseDatasets[i1]);
                          try
                            FAssociation.ResponseDataPdu(CommandAttributes, DataAttributes);
                          except
                            on e: Exception do
                            begin
                              FAssociation.sendAbort(ABSTRACT_SYNTAX_NOT_SUPPORTED, 3);
                              Dcm_Server_wrt_log('DicomTransferFail FAssociation.ResponseDataPdu  ' + #13#10 +
                                  e.Message, v_crt_log );
                              Logit(Socket.PeerIPAddress, 'DicomTransferFail FAssociation.ResponseDataPdu ' + e.Message);
                              break;
                            end
                          end;
                        end;
                        CommandAttributes.AddVariant(dStatus, 0);
                        CommandAttributes.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);
                        FAssociation.ResponseDataPdu(CommandAttributes, nil);
                      end;
                    C_MOVE_REQUEST:
                      begin
                        QueryImageCount := v_resp_DS_list.Count;
                        Dcm_Server_wrt_log('C_MOVE_REQUEST', v_crt_log );
                        Dcm_Server_wrt_log('ResponseDatasets.Count='+inttostr(QueryImageCount), v_crt_log );
                        CMovePort1 := 4006;
                        CMoveHost := Socket.PeerIPAddress;
                        // FOMIN 08_07_2012 MoveDestination
                        // вставка для передачи изображения на другой произвольный узел
                        if Trim(FAssociation.Request.MoveDestination)<>'' then begin
                          v_MoveDestination:=FAssociation.Request.MoveDestination;
                        end else begin
                          v_MoveDestination:=FAssociation.Request.CalledTitle;
                        end;
                        //
                        if assigned(OnGetCMoveLocalPort) then
                          OnGetCMoveLocalPort(self, v_MoveDestination, CMoveHost,
                            CMovePort1);

                        str1 := Trim(FAssociation.Request.CallingTitle);
                        str2 := Trim(v_MoveDestination);
                        sync1 := fSynchronousCMove;

                        if assigned(OnGetCMoveLocalPortEx) then
                          OnGetCMoveLocalPortEx(self, v_MoveDestination, CMoveHost,
                            CMovePort1, str1, str2, sync1);

                        Dcm_Server_wrt_log( 'C_MOVE_REQUEST: Подготовка к отправке '+IntToStr( v_resp_DS_list.Count )+
                                            ' снимков' , v_crt_log);

                        // -----------------------------------------------------
                        // запускаем поток для отправки снимков
                        // -----------------------------------------------------
                      //  QueryImageCount := ResponseDatasets.Count;
                      {  if v_resp_DS_list.Count>0 then
                          v_TStoreThread:= TStoreThread.Create(False) ;
                          with v_TStoreThread do
                          try
                            Host := CMoveHost;
                            Port := CMovePort1;
                            CalledTitle := str1 ;
                            CallingTitle := str2;
                            MaxPduSize := FAssociation.Request.MaxPduSize;
                            FFileList:=TStringList.Create;
                            for l := 0 to v_resp_DS_list.Count - 1 do
                              FFileList.Append(v_resp_DS_list[l]);
                            SetLength( FTransferSyntaxs, FAssociation.Acknowledge.GetTransferSyntaxCount );
                            for l := 0 to FAssociation.Acknowledge.GetTransferSyntaxCount - 1 do
                            begin
                              MyTUIDEntry := ( FAssociation.Acknowledge.MyGetTransferSyntax(l) as TUIDEntry );
                              Dcm_Server_wrt_log('### Acknowledge TransferSyntax='+IntToStr( MyTUIDEntry.Constant )+'      '+
                                MyTUIDEntry.Name + '      ' + MyTUIDEntry.AsString
                                , v_crt_log);
                              FTransferSyntaxs[l]:= ( FAssociation.Acknowledge.MyGetTransferSyntax(l) as TUIDEntry );
                            end;
                           // Execute;

                          except
                            on e: Exception do
                              begin
                                FAssociation.sendAbort(0, 0);
                                Logit(Socket.PeerIPAddress, 'DicomTransferFail SendImageForCMove ' + e.Message);
                              end;
                          end; }

                        // -----------------------------------------------------
                        // -----------------------------------------------------
                        // -----------------------------------------------------
                        {
                        if sync1 then
                        begin
                          Dcm_Server_wrt_log('#2644 c_move SYNC1', v_crt_log);
                          try
                            SendImageForCMove(FAssociation, CommandAttributes,
                              ResponseDatasets, CMoveHost, CMovePort1, str2, str1);
                            Dcm_Server_wrt_log('#2650 end c_move SYNC1', v_crt_log);
                          except
                            on e: Exception do
                            begin
                              FAssociation.sendAbort(0, 0);
                              Logit(Socket.PeerIPAddress, 'DicomTransferFail SendImageForCMove ' + e.Message);
                            end;
                          end;
                        end
                        else
                        begin
                          Dcm_Server_wrt_log('#2661 c_move not SYNC1', v_crt_log);
                          CreateDataChannel;
                          Dcm_Server_wrt_log('#2663 c_move CreateDataChannel', v_crt_log);
                          FDataChannelThread.CalledTitle := str1;
                          FDataChannelThread.CallingTitle := str2;
                          FDataChannelThread.MaxPduSize := FAssociation.Request.MaxPduSize;

                          FDataChannelThread.SetupDataChannel(CMoveHost, CMovePort1);
                          Dcm_Server_wrt_log('#2669 c_move SetupDataChannel', v_crt_log);

                          FDataChannelThread.FreeOnTerminate := true;

                          FDataChannelThread.StartThread(ResponseDatasets);
                          Dcm_Server_wrt_log('#2674 c_move StartThread', v_crt_log);
                        end; }
                      end;
                  else
                    begin
                      Dcm_Server_wrt_log('other REQUEST cn1='+IntToStr(cn1), v_crt_log );
                      for i1 := 0 to ResponseDatasets.Count - 1 do
                      begin
                        if i1 = (ResponseDatasets.Count - 1) then
                          CommandAttributes.AddVariant(dStatus, 0);
                        DataAttributes := TDicomAttributes(ResponseDatasets[i1]);
                        try
                          FAssociation.ResponseDataPdu(CommandAttributes, DataAttributes);
                        except
                          on e: Exception do
                          begin
                            FAssociation.sendAbort(0, 0);
                            Logit(Socket.PeerIPAddress, 'DicomTransferFail FAssociation.ResponseDataPdu ' + e.Message);
                            break;
                          end
                        end;
                      end;
                    end;
                  end;
                end;
                if (cn1 = C_GET_REQUEST) then
                begin
                  Dcm_Server_wrt_log('cn1 = C_GET_REQUEST', v_crt_log );
                  CommandAttributes.AddVariant(dNumberOfRemainingSuboperations, 0);
                  CommandAttributes.AddVariant(dNumberOfCompletedSuboperations,
                    ResponseDatasets.Count);
                  CommandAttributes.AddVariant(dNumberOfFailedSuboperations, 0);
                  CommandAttributes.AddVariant(dStatus, 0);
                  CommandAttributes.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);

                  FAssociation.ResponseDataPdu(CommandAttributes, nil);
                end
                else
                if (cn1 = C_MOVE_REQUEST) then
                begin
                  QueryImageCount := v_resp_DS_list.Count;
                  if v_crt_log then Dcm_Server_wrt_log('cn1 = C_MOVE_REQUEST',v_crt_log);
                  CommandAttributes.AddVariant(dNumberOfRemainingSuboperations, 0);
                  CommandAttributes.AddVariant(dNumberOfCompletedSuboperations, QueryImageCount);
                  CommandAttributes.AddVariant(dNumberOfFailedSuboperations, 0);
                  CommandAttributes.AddVariant(dStatus, 0);
                  CommandAttributes.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);

                //  FAssociation.ResponseDataPdu(CommandAttributes, nil);

                  if QueryImageCount>0 then
                    with TStoreThread.Create(False) do
                    try
                      Dcm_Server_wrt_log('DCM_Server TStoreThread.Create', v_crt_log );
                      FreeOnTerminate := True;
                      Host := CMoveHost;
                      Port := CMovePort1;
                      CalledTitle := str1 ;
                      CallingTitle := str2;
                      FMyTransferSyntax:=RLELossless; // v_TransferSyntaxCMove;
                      MaxPduSize := FAssociation.Request.MaxPduSize;
                      FFileList:=TStringList.Create;
                      for l := 0 to v_resp_DS_list.Count - 1 do
                        FFileList.Append(v_resp_DS_list[l]);
                      SetLength( FTransferSyntaxs, FAssociation.Acknowledge.GetTransferSyntaxCount );
                      for l := 0 to FAssociation.Acknowledge.GetTransferSyntaxCount - 1 do
                      begin
                        MyTUIDEntry := ( FAssociation.Acknowledge.MyGetTransferSyntax(l) as TUIDEntry );
                        Dcm_Server_wrt_log('### Acknowledge TransferSyntax='+IntToStr( MyTUIDEntry.Constant )+'      '+
                          MyTUIDEntry.Name + '      ' + MyTUIDEntry.AsString
                          , v_crt_log);
                        FTransferSyntaxs[l]:= ( FAssociation.Acknowledge.MyGetTransferSyntax(l) as TUIDEntry );
                      end;

                      // отправить разрыв соединения
                      FAssociation.ResponseDataPdu(CommandAttributes, nil);
                      Sleep(1000);

                      // запустить отправку снимков
                      Execute;

                    except
                      on e: Exception do
                        begin
                          FAssociation.sendAbort(0, 0);
                          Logit(Socket.PeerIPAddress, 'DicomTransferFail SendImageForCMove ' + e.Message);
                        end;
                    end;
                end
                else
                if (ReturnStatus >= 0) and (cn1 <> C_STORE_REQUEST) and (ResponseDatasets.Count
                    <= 0) then
                begin
                  CommandAttributes.AddVariant(dStatus, ReturnStatus);
                  CommandAttributes.AddVariant(dDataSetType, DICOM_DATA_NOT_PRESENT);

                  //CommandAttributes.AddVariant(0,$1000,'1.2.3.4.5.6.7');
                  //                        CommandAttributes.ListAttrinute('REP:', KxImsForm.Memo1.Lines);

                  FAssociation.ResponseDataPdu(CommandAttributes, nil);
                end;
              finally
                for i1 := 0 to ResponseDatasets.Count - 1 do
                begin
                  TDicomAttributes(ResponseDatasets[i1]).Free;
                end;
                ResponseDatasets.Clear;
                ResponseDatasets.Free;
                CommandAttributes.Clear;
                CommandAttributes.Free;
                FAssociation.Clear;

              //  if (cn1 = C_MOVE_REQUEST) then
              //    v_TStoreThread.Execute;

              end;
              //Close;
            end;
          end;
        end;
    else
      begin
        inc(FErrorCount);
        //Terminate;
        //      if FErrorCount>1000 then
        begin
          //          FAssociation.SendAbort(1, 1);
  //        Logit(Socket.PeerIPAddress, 'ЅУКХµЅІ»їЙФ¤јыµДКэѕЭ!,Ѕ«№Ш±ХґЛБ¬ЅУ,КэѕЭДЪИЭКЗ'+IntToStr(k));
  //        Terminate;

        // FOMIN 13.07.2012
        Logit(Socket.PeerIPAddress,'ReadPduType k='+inttostr(k));
//          raise Exception.Create('close connection');

        end;
      end;
    end;
  end;
end;

function TKxMoveChannelThread.SendCommandBySop(ASopClass: Integer; CommandAttributes,
  DataAttributes: TDicomAttributes): Boolean;
var
  k: Integer;
  abort1: TDicomAbort;
  rck1: TDicomResponse;
  str1: AnsiString;
begin
  Dcm_Server_wrt_log('unit DCM_Server TKxMoveChannelThread.SendCommandBySop', v_crt_log );

  Dcm_Server_wrt_log('#2778 TKxMoveChannelThread.SendCommandBySop', v_crt_log );
  SetLength(fPresentationContext, 1);
  fPresentationContextCount := 1;
  fPresentationContext[0] := ASopClass;

  Result := false;
  // FOMIN 11.01.2013
  rck1 := SendRequest; // (DataAttributes.ImageData.ImageData[0].TransferSyntax );  //  JPEGLossless
  //    if (rck1 is TAcknowledge) then
  if (rck1 is TDicomReject) or (rck1 is TDicomAbort) then
  begin
    str1 := rck1.Text;
    Dcm_Server_wrt_log('Error(' + FDataChannel.Host + ':' + IntToStr(FDataChannel.Port) + ')' +
                      str1, v_crt_log );
  //  raise Exception.Create('Error(' + FDataChannel.Host + ':' + IntToStr(FDataChannel.Port) + ')' +
  //    str1);
  end;

  if not FAssociation.sendDataPduBySOP(ASopClass, CommandAttributes, DataAttributes) then
  begin
    FAssociation.Init;
    FDataChannel.Disconnect;
    Dcm_Server_wrt_log('Error Connect', v_crt_log );
  //  raise Exception.Create('Error Connect');
  end;
  k := FAssociation.ReadPduType;
  Dcm_Server_wrt_log('#2778 FAssociation.ReadPduType='+inttostr(k), v_crt_log );
  if k = 4 then
  begin
    repeat
      Result := FAssociation.ReceiveDataPdu(k);
      if not Result then
      begin
        k := FAssociation.ReadPduType;
        if k = 7 then
        begin
          abort1 := FAssociation.receiveAbort(k);
          FDataChannel.Disconnect;
        //  raise Exception.Create(abort1.Text);
        end;
        if k = 5 then
        begin //sendReleaseRequest
          FAssociation.receiveReleaseRequest(k);
          FAssociation.sendReleaseResponse;
          FDataChannel.Disconnect;
          //          raise Exception.Create(V_RECEIVE_RELEASE_REQUEST_ERROR);
        end;
        //        if k <> 4 then
        //          raise Exception.Create('No DataPdu To receive!');
      end
      else
        break;

    until Result;
  end
  else
  begin
    if k = 7 then
    begin
      abort1 := FAssociation.receiveAbort(k);
      FDataChannel.Disconnect;
    //  raise Exception.Create(abort1.Text);
    end;
    if k = 5 then
    begin //sendReleaseRequest
      FAssociation.receiveReleaseRequest(k);
      //      FAssociation.sendReleaseResponse;
      FDataChannel.Disconnect;
      //      raise Exception.Create(V_RECEIVE_RELEASE_REQUEST_ERROR);
    end;
  end; //   raise Exception.Create('No DataPdu To receive!');
end;

// FOMIN 11.01.2013
function TKxMoveChannelThread.SendRequest( p_TransferSyntax:integer=0 ): TDicomResponse;
var
  k, i: Integer;
  FRequest: TRequest;
  FTransferSyntaxes: TDCMIntegerArray;
begin
  Dcm_Server_wrt_log('unit DCM_Server TKxMoveChannelThread.SendRequest', v_crt_log );

  // FOMIN 11.01.2013
  if p_TransferSyntax>0 then
  begin
    SetLength(FTransferSyntaxes, 4);
    FTransferSyntaxes[0] := ImplicitVRLittleEndian;
    FTransferSyntaxes[1] := ExplicitVRLittleEndian;
    FTransferSyntaxes[2] := ExplicitVRBigEndian;
    FTransferSyntaxes[3] := p_TransferSyntax;
  end else
  begin
    SetLength(FTransferSyntaxes, 4);
    FTransferSyntaxes[0] := ImplicitVRLittleEndian;
    FTransferSyntaxes[1] := ExplicitVRLittleEndian;
    FTransferSyntaxes[2] := ExplicitVRBigEndian;
    // FOMIN 11.01.2013
    FTransferSyntaxes[3] := JPEGLossless;
  end;

  //FTransferSyntaxes[3] := JPEGLossless;
  //  FTransferSyntaxes[3] := RLELossless;
  //  FTransferSyntaxes[3] := JPEGBaseline;
  //FTransferSyntaxes[4] := zlibFastestTransferSyntax;

  if FAssociation.IsConnected then
  begin
    Result := nil;
    exit;
  end;
  FAssociation.Init;

  FRequest := TRequest.Create;
  FRequest.CalledTitle := FCalledTitle;
  FRequest.CallingTitle := FCallingTitle;
  FRequest.MaxPduSize := FMaxPduSize;
  for i := 0 to fPresentationContextCount - 1 do
  begin
    FRequest.addPresentationContext(fPresentationContext[i], FTransferSyntaxes);
  end;
  FAssociation.Clear;
  FAssociation.sendAssociateRequest(FRequest);

  k := FAssociation.ReadPduType;
  case k of
    2, 3, 7:
      begin
        Result := FAssociation.receiveAssociateResponse(k);
      end;
 // else
 //   raise Exception.Create('No DicomResponse To receive!');
  end;
end;

procedure TKxMoveChannelThread.Run;
var
  //  i: integer;
  DataAttributes, da1: TDicomAttributes;
  i1, k1: integer;
begin
  Dcm_Server_wrt_log('unit DCM_Server TKxMoveChannelThread.Run', v_crt_log );

  if assigned(fToSendDatasets) then
  try
    FAssociation := TAssociation.Create(FDataChannel);
    try
      k1 := 0;
      if BackSendType = sbs_MoveSend then
      begin
        for i1 := 0 to fToSendDatasets.Count - 1 do
        begin
          FSendingIndex := i1;
          DataAttributes := TDicomAttributes(fToSendDatasets[i1]);
          da1 := createStoreRequest(i1, UIDS.Items[DataAttributes.GetString(62)].Constant, 0,
            DataAttributes.GetString(63), '', '');
          try
            //                          FAssociation.ResponseDataPdu(da1, DataAttributes);
            try
              if not SendCommandBySop(UIDS.Items[DataAttributes.GetString(62)].Constant, da1,
                DataAttributes) then
              begin
                Dcm_Server_wrt_log('C-MOVE fail!', v_crt_log );
                if FParent=nil then
                  Dcm_Server_wrt_log('ERROR FParent=nil', v_crt_log );
                FParent.DoLogit(nil, FDataChannel.PeerIPAddress, 'C-MOVE fail!');
                inc(k1);
              end;
            except
              on e: Exception do
              begin
                FAssociation.sendAbort(ABSTRACT_SYNTAX_NOT_SUPPORTED, 3);
                Dcm_Server_wrt_log('# error SendCommandBySop ABSTRACT_SYNTAX_NOT_SUPPORTED='+
                    DataAttributes.GetString(62)+' C-MOVE:' + e.Message, v_crt_log );
                if FParent <> nil then
                  FParent.DoLogit(nil, FDataChannel.PeerIPAddress, FDataChannel.PeerIPAddress +
                    '# error SendCommandBySop ABSTRACT_SYNTAX_NOT_SUPPORTED='+
                    DataAttributes.GetString(62)+' C-MOVE:' + e.Message);
                break;
              end
            end;
          finally
            da1.Free;
          end;
          DataAttributes.Free;
          //Application.ProcessMessages;
        end;
        FSendingIndex := fToSendDatasets.Count;
      end
      else
      begin
        {CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
        try
          //callingAET
          // ' First, find the AE to call back to
          CnsDicomConnection1.Host := '127.0.0.1';
          CnsDicomConnection1.Port := 10400;
          CnsDicomConnection1.CalledTitle := 'SC_SCU';
          CnsDicomConnection1.CallingTitle := 'SC_SCP';
          CnsDicomConnection1.ReceiveTimeout := 1000000;

          CnsDicomConnection1.ClearPresentationContext;
          CnsDicomConnection1.addPresentationContext(StorageCommitmentPushModel);
          CnsDicomConnection1.N_EVENT_REPORT(StorageCommitmentPushModel,
            UIDs.ItemByIndex[StorageCommitmentPushModelModelSOPInstance].AsString, rq);
        finally
          CnsDicomConnection1.Free;
          rq := nil;
        end;}
      end;
    finally
      //for i1 := 0 to fToSendDatasets.Count - 1 do
      begin
        //TDicomAttributes(fToSendDatasets[i1]).Free;
      end;
      fToSendDatasets.Clear;
      FreeAndNil(fToSendDatasets);

      FDataChannel.Disconnect;
      FAssociation.Free;
      FAssociation := nil;
      //FreeOnTerminate := true;
    end;
  finally
    FDataChannel.Disconnect;
    FreeAndNil(FDataChannel);
    //    Stop;
    Terminate;
  end;
end;

constructor TKxMoveChannelThread.Create(ACreateSuspended: Boolean = True);
begin
  Dcm_Server_wrt_log('unit DCM_Server TKxMoveChannelThread.Create', v_crt_log );

  inherited Create(ACreateSuspended);
  FAssociation := nil;
  FMaxPduSize := 16384 * 4;
  FCallingTitle := '';
  FCalledTitle := '';
  StopMode := smTerminate;
  FDataChannel := TKXSockClient.Create(nil);
  fToSendDatasets := nil;

  fBackSendType := sbs_MoveSend;
end;

destructor TKxMoveChannelThread.Destroy;
begin
  Dcm_Server_wrt_log('unit DCM_Server TKxMoveChannelThread.Destroy', v_crt_log );

  if assigned(FAssociation) then
  begin
    FreeAndNil(FAssociation);
  end;

  if assigned(FDataChannel) then
  begin
    FDataChannel.Disconnect;
    FreeAndNil(FDataChannel);
  end;
  inherited Destroy;
end;

procedure TKxMoveChannelThread.StartThread(AList: TList);
var
  i1: integer;
begin
  Dcm_Server_wrt_log('#3026 TKxMoveChannelThread.StartThread', v_crt_log);
  BackSendType := sbs_MoveSend;
  fToSendDatasets := TList.Create;
  try
    for i1 := 0 to AList.Count - 1 do
    begin
      fToSendDatasets.Add(TDicomAttributes(AList[i1]));
    end;
    FSendingIndex := -1;
    AList.Clear;
    FDataChannel.DoConnect;
    Dcm_Server_wrt_log('#3037 FDataChannel.DoConnect', v_crt_log);
  except
    Dcm_Server_wrt_log('#3040 ERROR TKxMoveChannelThread.StartThread', v_crt_log);
  //  raise;
  end;
  inherited Start;
end;

procedure TKxMoveChannelThread.SetupDataChannel(const AIP: AnsiString; APort: Integer);
begin
  Dcm_Server_wrt_log('unit DCM_Server TKxMoveChannelThread.SetupDataChannel', v_crt_log );

  with FDataChannel do
  begin
    Host := AIP;
    Port := APort;
  end;
end;

procedure TDicomClientThread.CreateDataChannel;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.CreateDataChannel', v_crt_log );

  TerminateAndFreeDataChannel; //let the old one terminate

  FDataChannelThread := TKxMoveChannelThread.Create;
  FDataChannelThread.FreeOnTerminate := True;
  FDataChannelThread.FParent := FParent;
end;

procedure TDicomClientThread.KillDataChannel;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.KillDataChannel', v_crt_log );

  with FDataChannelThread do
  try
    if not Stopped then
    begin
      FDataChannel.Disconnect;
      WaitFor;
    end;
  except
    { absorb }
  end;
end;

procedure TDicomClientThread.TerminateAndFreeDataChannel;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomClientThread.TerminateAndFreeDataChannel', v_crt_log );

  if Assigned(FDataChannelThread) then
  begin
    FDataChannelThread.Terminate; //set Terminated flag
    FDataChannelThread.Start; //can be stopped
    FreeAndNIL(FDataChannelThread);
  end;
end; //

constructor TFunctionObject.Create(AServerObjectClass: TServerObjectClass; AFunctionCode: AnsiString);
begin
  Dcm_Server_wrt_log('unit DCM_Server TFunctionObject.Create', v_crt_log );

  inherited Create;
  FServerObjectClass := AServerObjectClass;
  FFunctionCode := AFunctionCode;
end;

constructor TServerObject.Create;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObject.Create', v_crt_log );

  inherited Create;

  fResponseStreams := TList.Create;
  fResponseFiles := TStringList.Create;

  fRequestType := 0;
end;

destructor TServerObject.Destroy;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObject.Destroy', v_crt_log );

  //  FkxmBinaryStreamFormat.Free;
  fResponseStreams.Free;
  fResponseFiles.Free;
  inherited;
end;

procedure TServerObject.Execute(AClient: TDicomClientThread);
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObject.Execute', v_crt_log );
end;

procedure TServerObject.Logit(AIP, Msg: AnsiString);
begin
  fDicomServerCore.DoLogit(nil, Address, Msg);
end;

procedure TServerObject.LogDB(AType, AIP, aDBStr, aSql: AnsiString; A1: TDicomAttributes);
begin
  fDicomServerCore.DoLogDB(nil, AType, Address, aDBStr, aSql, A1);
end;

procedure TServerObject.LogException(AIP, ErrorMsg: AnsiString);
begin
  fDicomServerCore.DoLogException(nil, Address, ErrorMsg);
end;

procedure TServerObject.ExecSQL(ADBStr, ASQL: AnsiString; Params: TDicomAttribute);
begin
  fDicomServerCore.DoExecSQL(nil, ADBStr, ASQL, Params);
end;

function TServerObject.ExecProc(ADBStr, AStorageProc, AOutput: AnsiString; AParams: TDicomAttribute):
  AnsiString;
begin
  Result := fDicomServerCore.DoExecProc(nil, ADBStr, AStorageProc, AOutput, AParams);
end;

function TServerObject.SumitSQL(ADBStr, ASQL: AnsiString; AFetchCount: Integer; UseMultiDatabase:
  Boolean; Params: TDicomAttribute): TDataset;
begin
  Result := fDicomServerCore.DoSumitSQL(nil, ADBStr, ASQL, AFetchCount,
    UseMultiDatabase, Params);
end;

procedure TServerObject.SumitSQLAndSaveTo(ADBStr, ASQL: AnsiString; AFetchCount: Integer; UseMultiDatabase:
  Boolean; Params: TDicomAttribute; AMemoFilter: TDicomAttribute);
begin
  fDicomServerCore.DoSumitSQLAndSaveTo(nil, ADBStr, ASQL, AFetchCount,
    UseMultiDatabase, Params, AMemoFilter, FResponseDataset, fResponseStreams, RequestType);
end;

procedure TDicomServerCore.DoExecSQL(AClientThread: TDicomClientThread; ADBStr, ASQL: AnsiString;
  Params: TDicomAttribute);
begin
  if assigned(FCustomDatabaseOperator) then
    FCustomDatabaseOperator.ExecSQL(ADBStr, ASQL, Params)
  else
    if assigned(FOnDatabaseExecSQL) then
    FOnDatabaseExecSQL(AClientThread, ADBStr, ASQL, Params);
end;

function TDicomServerCore.DoExecProc(AClientThread: TDicomClientThread; ADBStr, AStorageProc,
  AOutput: AnsiString; AParams: TDicomAttribute): AnsiString;
begin
  if assigned(FCustomDatabaseOperator) then
    FCustomDatabaseOperator.ExecProc(ADBStr, AStorageProc, AOutput, AParams, Result)
  else
    if assigned(FOnDatabaseExecProc) then
    FOnDatabaseExecProc(AClientThread, ADBStr, AStorageProc, AOutput, AParams, Result)
  else
    Result := '';
end;

function TDicomServerCore.DoSumitSQL(AClientThread: TDicomClientThread; ADBStr, ASQL: AnsiString;
  AFetchCount: Integer; UseMultiDatabase: Boolean; Params: TDicomAttribute): TDataset;
begin
  if assigned(FCustomDatabaseOperator) then
    Result := FCustomDatabaseOperator.SumitSQL(ADBStr, ASQL, AFetchCount, UseMultiDatabase, Params)
      //Result := FCustomDatabaseOperator.SumitSQLToMemDataset(ADBStr, ASQL, AFetchCount, UseMultiDatabase, Params,'')
  else
    if assigned(FOnDatabaseSumitSQL) then
    FOnDatabaseSumitSQL(AClientThread, ADBStr, ASQL, AFetchCount, UseMultiDatabase, Params, Result)
  else
    Result := nil;
end;

procedure TDicomServerCore.DoSumitSQLAndSaveTo(AClientThread: TDicomClientThread; ADBStr, ASQL: AnsiString;
  AFetchCount: Integer; UseMultiDatabase: Boolean; Params: TDicomAttribute; AMemoFilter: TDicomAttribute;
  AResponseDataset: TDicomAttributes; AResponseList: TList; ARequestType: Integer);
begin
  if assigned(FCustomDatabaseOperator) then
    FCustomDatabaseOperator.SumitSQLAndSaveTo(ADBStr, ASQL, AFetchCount, UseMultiDatabase, Params, AMemoFilter, AResponseDataset, AResponseList, ARequestType)
  else
    if assigned(FOnDatabaseSumitSQLAndSaveTo) then
    FOnDatabaseSumitSQLAndSaveTo(AClientThread, ADBStr, ASQL, AFetchCount, UseMultiDatabase, Params, AMemoFilter, AResponseDataset, AResponseList, ARequestType);
end;

procedure TServerObjectSUMIT.Execute;
var
  dbstr1, sql1: AnsiString;
//  D1: TDataset;
  DatasetPos1: Integer;
  //  p: TOBStream;
  a2: TDicomAttribute;
  //  sd1: TCnsSDDatabase;
//  stm1: TStream;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObjectSUMIT.Execute', v_crt_log );

  MnLg_ev('TServerObjectSUMIT.Execute',vLogDir+'\'+'dcm_server_thread.log');
  dbstr1 := FRequestCommand.GetString($2809, 2);
  sql1 := FRequestCommand.GetString($2809, 3);
  DatasetPos1 := FRequestCommand.GetInteger($2809, $12);
  a2 := FRequestCommand.Item[$2809, $2B];
  if (dbstr1 <> '') and (sql1 <> '') then
  begin
    LogDB('SUMIT', Address, DBStr1, SQL1, FRequestCommand);
    try
      SumitSQLAndSaveTo(DBStr1, SQL1, FetchCount, false, a2, nil);
    except
      on e: Exception do
      begin
        FResponseDataset.AddVariant($2809, $1003, EDataBaseError(ExceptObject).Message);
        FResponseDataset.AddVariant($2809, $1004, 0);
        Logit(Address, e.Message + '==object sumit(' + SQL1 + ')');
        exit;
      end;
    end;
  end;
end;

procedure TServerObjectEXEC.Execute;
var
  dbstr1, sql1: AnsiString;
  a2, a1: TDicomAttribute;
  as2: TDicomAttributes;
  kas2: Integer;
  errormessage1: AnsiString;
  strs: TStringList;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObjectEXEC.Execute', v_crt_log );

  MnLg_ev('TServerObjectEXEC.Execute',vLogDir+'\'+'dcm_server_thread.log');
  dbstr1 := FRequestCommand.GetString($2809, 2);
  a2 := FRequestCommand.Item[$2809, $2B];
  if assigned(a2) then
  begin
    for kas2 := 0 to a2.GetCount - 1 do
    begin
      as2 := a2.Attributes[kas2];
      sql1 := as2.GetString($2809, 3);
      a1 := as2.Item[$2809, $2A];
      //        params.ListAttrinute('',LogMemo.Lines);
      if (dbstr1 <> '') and (sql1 <> '') then
      begin
        if FRequestCommand.GetInteger($2813, $0120) = 1 then
          LogDB('EXEC', Address, dbstr1, sql1, as2);

        try
          {                  if (dbstr1 = 'SYSTEM') then
                              SystemExecSQL(dbstr1, sql1, a1)
                            else}
          ExecSQL(dbstr1, sql1, a1);
        except
          on e: Exception do
          begin
            errormessage1 := errormessage1 + #13#10 + e.Message;
            strs := TStringList.Create;
            try
              as2.ListAttrinute('', strs);
              Logit(Address, 'ExecSQL:' + e.Message + '==(' + SQL1 + ')' + strs.Text);
            finally
              strs.Free;
            end;
          end;
        end;
      end;
    end;
    if errormessage1 <> '' then
    begin
      FResponseDataset.AddVariant($2809, $1003, errormessage1);
      FResponseDataset.AddVariant($2809, $1004, 0);
    end
    else
      FResponseDataset.AddVariant($2809, $1004, 1);
  end;
end;

procedure TServerObjectGFILE.Execute;
var
  str1, path1: AnsiString;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObjectGFILE.Execute', v_crt_log );

  MnLg_ev('TServerObjectGFILE.Execute',vLogDir+'\'+'dcm_server_thread.log');
  path1 := ExtractFilePath(Application.ExeName);
  str1 := path1 + FRequestCommand.GetString($2809, $17);
  //str1 :=  str1;
  if FileExists(str1) then
  begin
    FResponseDataset.Add($2809, $1001).LoadFromFile(str1);
    FResponseDataset.AddVariant($2809, $1004, 1);
  end
  else
  begin
    FResponseDataset.AddVariant($2809, $1003, 'File not find');
    FResponseDataset.AddVariant($2809, $1004, 0);
  end;
end;

procedure TServerObjectSFILE.Execute;
  function CheckAndCreateDir: string;
  var
    str1: string;
    i: Integer;
    da1: TDicomAttribute;
  begin
    str1 := '';
    da1 := FRequestCommand.Item[$2809, $10];
    if da1 <> nil then
    begin
      for i := 0 to da1.GetCount - 1 do
      begin
        str1 := str1 + Trim(da1.AsString[i]);
        if not DirectoryExists(str1) then
          CreateDir(str1);
        str1 := str1 + '\';
      end;
    end;
    Result := str1;
  end;
var
  str1, str2: AnsiString;
  a1: TDicomAttribute;
  //path1: AnsiString;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObjectSFILE.Execute', v_crt_log );

  MnLg_ev('TServerObjectSFILE.Execute',vLogDir+'\'+'dcm_server_thread.log');
  str2 := FRequestCommand.GetString($2809, $10);
  if str2 = '' then
  begin
    //path1 := ExtractFilePath(Application.ExeName);
    str1 := ExtractFilePath(Application.ExeName) + FRequestCommand.GetString($2809, $17);
  end
  else
  begin
    str2 := CheckAndCreateDir;
    str1 := str2 + FRequestCommand.GetString($2809, $17);
  end;
  if str1 <> '' then
  begin
    //str1 :=  str1;
    a1 := FRequestCommand.Item[$2809, $1001];
    if assigned(a1) then
    begin
      FResponseDataset.AddVariant($2809, $1004, 1);
      try
        a1.SaveToFile(str1);
      except
        on e: Exception do
        begin
          FResponseDataset.AddVariant($2809, $1003, 'File not save:' + e.Message);
          FResponseDataset.AddVariant($2809, $1004, 0);
        end;
      end;
    end;
  end;
end;

procedure TServerObjectPROC.Execute;
var
  str1, sql1: AnsiString;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObjectPROC.Execute', v_crt_log );

  MnLg_ev('TServerObjectPROC.Execute',vLogDir+'\'+'dcm_server_thread.log');
  str1 := FRequestCommand.GetString($2809, $2);
  sql1 := FRequestCommand.GetString($2809, $D);
  try
    str1 := ExecProc(str1, sql1, FRequestCommand.GetString($2809, $E), FRequestCommand.Item[$2809,
      $2B]);
  except
    on e: exception do
    begin
      Logit(Address, e.Message);
      FResponseDataset.AddVariant($2809, $1003, 'Fail:' + e.Message);
      FResponseDataset.AddVariant($2809, $1004, 1);
      exit;
    end;
  end;
  FResponseDataset.AddVariant($2809, $1003, str1);
  FResponseDataset.AddVariant($2809, $1004, 1);
end;

procedure TServerObjectGENID.Execute;
var
  TableName, str1, DatabaseName: AnsiString;
  i: integer;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObjectGENID.Execute', v_crt_log );

  MnLg_ev('TServerObjectGENID.Execute',vLogDir+'\'+'dcm_server_thread.log');
  str1 := FRequestCommand.GetString($2809, $10);
  TableName := FRequestCommand.GetString($2809, $3);
  DatabaseName := FRequestCommand.GetString($2809, $2);
  i := FRequestCommand.GetInteger($2809, $1004);
  try
    i := fDicomServerCore.DoGetGenID(DatabaseName, TableName, str1,
      FRequestCommand.GetString($2809, $7) <> 'F', i);
  except
    on e: Exception do
    begin
      Logit(Address, 'GENID:' + DatabaseName + '/' + TableName + '/' + str1 + '-' + e.Message);
      i := 1;
    end;
  end;
  FResponseDataset.AddVariant($2809, $29, i);
end;

function TDicomServerCore.DoGetGenID(ADatabaseName, ATableName, Fieldname: AnsiString; AutoInc:
  Boolean; ASetValue: Integer): Integer;
begin
  if assigned(FCustomDatabaseOperator) then
    FCustomDatabaseOperator.GetGenID(ADatabaseName, ATableName, Fieldname, AutoInc, ASetValue,
      Result)
  else
    if assigned(OnDatabaseGetGenID) then
    OnDatabaseGetGenID(ADatabaseName, ATableName, Fieldname, AutoInc, ASetValue, Result)
  else
    Result := 0;
end;

function GetWinDir: Ansistring;
var
  dwI: DWord;
begin
  SetLength(Result, MAX_PATH + 1);
  dwI := GetWindowsDirectory(PChar(Result), MAX_PATH);
  SetLength(Result, dwI);
end;

procedure TServerObjectVERSION.Execute;
var
  cliap1: TClientUpdateSetting;
  str1: AnsiString;
  a1: TDicomAttribute;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObjectVERSION.Execute', v_crt_log );

  MnLg_ev('TServerObjectVERSION.Execute',vLogDir+'\'+'dcm_server_thread.log');
  cliap1 := fDicomServerCore.ClientApplicationByName[FRequestCommand.GetString($2809, $8)];
  if not assigned(cliap1) then
  begin
    cliap1 := fDicomServerCore.AddApplication(FRequestCommand.GetString($2809, $8),
      FRequestCommand.GetString($2809, $8) + '.exe', 0);
    //    cliap1.FileName :=
  end;
  if assigned(cliap1) then
  begin
    str1 := GetWinDir + '\UPDATE\' + cliap1.FileName;
    a1 := FRequestCommand.Item[$2809, $1001];
    if assigned(a1) and (cliap1.Version < FRequestCommand.GetInteger($2809, $9)) then
    begin
      Logit(Address, 'Upgrade(' + FRequestCommand.GetString($2809, $8) + '),new version is:' +
        IntToStr(FRequestCommand.GetInteger($2809, $9)));
      if not DirectoryExists(GetWinDir + '\UPDATE') then
        CreateDir(GetWinDir + '\UPDATE');
      cliap1.Version := FRequestCommand.GetInteger($2809, $9);
      //to SaveConfig;
      if assigned(fDicomServerCore.FOnClientUpdateChange) then
        fDicomServerCore.FOnClientUpdateChange(fDicomServerCore);
      a1.SaveToFile(str1);
      FResponseDataset.AddVariant($2809, $1004, 1);
    end
    else
    begin
      FResponseDataset.AddVariant($2809, $1003, 'Not new version:' + cliap1.Name);
      Logit(Address, 'Not new version:' + cliap1.Name);
      FResponseDataset.AddVariant($2809, $1004, 0);
    end;
  end
  else
  begin
    FResponseDataset.AddVariant($2809, $1003, 'Can not find the file:' + cliap1.Name);
    FResponseDataset.AddVariant($2809, $1004, 0);
    Logit(Address, 'Can not find the file:' + cliap1.Name);
  end;
end;

procedure TServerObjectOBJECT.Execute;
var
  dbstr1, sql1: AnsiString;
  a2: TDicomAttribute;
  Tablename, usergroup, UserSetProfile, UsersetState, WhereSQL: AnsiString;
  dboname1, strx1: AnsiString;
  t1: TCnsTable;
  strs: TStrings;
//  D1: TDataset;
  k, DatasetPos1: integer;
  Params: TStringList;
  ADBType: Integer;
//  td1: TKxmThreadDataSet;
 // stm1: TStream;
  {$IFDEF DICOMDEBUGZ}
  iii: Integer;
  {$ENDIF}
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObjectOBJECT.Execute', v_crt_log );

  MnLg_ev('TServerObjectOBJECT.Execute',vLogDir+'\'+'dcm_server_thread.log');
  {$IFDEF DICOMDEBUGZ}
  iii := GetTickCount;
  {$ENDIF}
  TableName := FRequestCommand.GetString($2809, 2);
  try
    t1 := fDicomServerCore.FindTaskSQL(TableName);
  except
    on e: Exception do
    begin
      Logit(Address, 'Find Task SQL:' + e.Message);
      FResponseDataset.AddVariant($2809, $1003, 'Find Task SQL:' + e.Message);
      FResponseDataset.AddVariant($2809, $1004, -4);
      exit;
    end;
  end;
  if not assigned(t1) then
  begin
    try
      strx1 := FRequestCommand.GetString($2809, $16);
      if (strx1 <> '') and fDicomServerCore.AddSQLDefine(strx1) then
        t1 := fDicomServerCore.FindTaskSQL(TableName);
    except
      on e: Exception do
      begin
        Logit(Address, '#9 Build private Task SQL error :' + e.Message);
        FResponseDataset.AddVariant($2809, $1003, 'Build private Task SQL error :' + e.Message);
        FResponseDataset.AddVariant($2809, $1004, -4);
        exit;
      end;
    end;
  end;
  if assigned(t1) then
  begin
    if (FRequestCommand.GetInteger($2809, $1005) = 1) then
    try
      fDicomServerCore.CheckIfDatasetExists(t1);
    except
      on e: Exception do
      begin
        Logit(Address, 'Unable To Check if Table is Exists ' + e.Message);
        FResponseDataset.AddVariant($2809, $1003, 'Unable To Check Table Exists' + e.Message);
        FResponseDataset.AddVariant($2809, $1004, -4);
        exit;
      end;
    end;
    DBStr1 := t1.DatabaseName;
    FetchCount := t1.FetchCount;
    UserSetProfile := FRequestCommand.GetString($2809, $A);
    UsersetState := FRequestCommand.GetString($2809, $B);
    WhereSQL := FRequestCommand.GetString($2809, $C);
    UserGroup := FRequestCommand.GetString($2809, $19);
    k := FRequestCommand.GetInteger($2809, $11);
    DatasetPos1 := FRequestCommand.GetInteger($2809, $12);
    a2 := FRequestCommand.Item[$2809, $2B];
    if k > 0 then
    begin
      FetchCount := k;
    end;
    if (t1.ProfileFieldName <> '') and (UserSetProfile = '') then
    begin
      strs := TStringList.Create;
      try
        strs.Text := t1.FromUserGroupToProfile(UserGroup);
        if strs.Count > 0 then
          UserSetProfile := strs[0];
        if (UserSetProfile <> '') and assigned(t1.States) then
        begin
          strs.Text := t1.GetStatesForProfile(UserGroup, UserSetProfile);
          if strs.Count > 0 then
            UsersetState := strs[0];
        end;
      finally
        strs.Free;
      end;
    end;
    //          sd1 := nil;
    if FRequestCommand.GetInteger($2809, $1005) = 1 then
    begin
      try
        FResponseDataset.AddVariant($2809, $16, 'TABLEGROUP ' + t1.GroupName + '{ ' +
          t1.GetFullText('') + ' }');
      except
        on e: Exception do
        begin
          FResponseDataset.AddVariant($2809, $1003, e.Message);
          FResponseDataset.AddVariant($2809, $1004, -5);
          Logit(Address, e.Message + '=??=GetFullText ' + t1.Name);
          exit;
        end;
      end;

      { FResponseDataset.AddVariant($2809, $15, FieldByName('SCRIPTS').AsString);
       FResponseDataset.AddVariant($2809, $1A, FieldByName('ANALIZESCRIPTS').AsString);
       FResponseDataset.AddVariant($2809, $1C, FieldByName('DATAANALIZESCRIPTS').AsString);
       FResponseDataset.AddVariant($2809, $2021, FieldByName('LIST_HTML').AsString);
       FResponseDataset.AddVariant($2809, $2022, FieldByName('EDIT_HTML').AsString);
       FResponseDataset.AddVariant($2809, $2023, FieldByName('VIEW_HTML').AsString);
       FResponseDataset.AddVariant($2809, $2024, FieldByName('START_HTML').AsString);
       if KXConfig.DBLinkByName[DBStr1] <> nil then
         FResponseDataset.AddVariant($2809, $2C, KXConfig.DBLinkByName[DBStr1].DBType); }

    end;
    begin

      Params := TStringList.Create;
      try
        if assigned(fDicomServerCore.FCustomDatabaseOperator) then
        begin
          ADBType := fDicomServerCore.FCustomDatabaseOperator.GetDBType(DBStr1);
          Params.Text := fDicomServerCore.FCustomDatabaseOperator.GetDBParam(DBStr1);
        end
        else
          if assigned(fDicomServerCore.OnDatabaseGetDatabaseParams) then
          fDicomServerCore.OnDatabaseGetDatabaseParams(self, DBStr1, ADBType, Params);
        //          ADBType := ord(db1.ServerType);
        dboname1 := Params.Values['owner'];
        //tablespace := Params.Values['tablespace'];
      finally
        Params.Free;
      end;

      SQL1 := t1.SelectSQLForUser(UserSetProfile, UsersetState, WhereSQL, dboname1);

      {if (FetchCount > 0) and (Pos('SELECT', SQL1) > 0) and (Pos('DISTINCT', SQL1) <= 0) then
      begin
        case ADBType of
          //stInterbase, stFirebird:
          7,8:
            begin
              if (Pos(' FIRST ', SQL1) <= 0) then
                System.INSERT(' FIRST ' + IntToStr(FetchCount) + ' ', SQL1, Pos('SELECT', SQL1) +
                  6);
            end;
          2://stSQLServer:
            begin
              if (Pos(' TOP ', SQL1) <= 0) then
                System.INSERT(' TOP ' + IntToStr(FetchCount) + ' ', SQL1, Pos('SELECT', SQL1) +
                  6);
            end;
          1://stOracle:
            if (Pos(' ROWNUM ', SQL1) <= 0) then
            begin
              if (Pos(' WHERE ', SQL1) > 0) then
                System.INSERT(' ROWNUM<= ' + IntToStr(FetchCount) + ' and ', SQL1, Pos(' WHERE ',
                  SQL1) + 7)
              else
                if (Pos(' ORDER ', SQL1) > 0) then
                System.INSERT(' WHERE ROWNUM<= ' + IntToStr(FetchCount) + ' ', SQL1,
                  Pos(' ORDER ',
                  SQL1))

              else
                SQL1 := SQL1 + ' WHERE ROWNUM<= ' + IntToStr(FetchCount);
            end;
          4://stDB2:
            begin
              SQL1 := SQL1 + ' FETCH FIRST ' + IntToStr(FetchCount) + ' ROWS ONLY';
            end;
        end;
      end; }
      if t1.LogExec then
        LogDB('OPEN', Address, DBStr1, SQL1, FRequestCommand);

      if dboname1 <> '' then
        FResponseDataset.AddVariant($2809, 2, dboname1);

      try
        SumitSQLAndSaveTo(DBStr1, SQL1, FetchCount, t1.MultiDatabase, a2, FRequestCommand.Item[$2813, $111]);
      except
        on e: Exception do
        begin
          FResponseDataset.AddVariant($2809, $1003, e.Message);
          FResponseDataset.AddVariant($2809, $1004, -5);
          Logit(Address, e.Message + '=??=' + DBStr1 + '==SumitSQL(' + SQL1 + ')' +
            e.ClassName);
          exit;
        end;
      end;
    end;
  end
  else
  begin
    FResponseDataset.AddVariant($2809, $1003, 'task name:' + TableName + ' is not define!');
    FResponseDataset.AddVariant($2809, $1004, -1);
    Logit(Address, 'task name:' + TableName + ' is not define!');
  end;
  {$IFDEF DICOMDEBUGZ}
  SendDebug(Format('end execute:%d', [GetTickCount - iii]));
  iii := GetTickCount;
  {$ENDIF}
end;

procedure TServerObjectUPDATE.Execute;
var
  cliap1: TClientUpdateSetting;
  str1: AnsiString;
begin
  Dcm_Server_wrt_log('unit DCM_Server TServerObjectUPDATE.Execute', v_crt_log );

  MnLg_ev('TServerObjectUPDATE.Execute',vLogDir+'\'+'dcm_server_thread.log');
  cliap1 := fDicomServerCore.ClientApplicationByName[FRequestCommand.GetString($2809, $8)];
  if assigned(cliap1) then
  begin
    if cliap1.Version > FRequestCommand.getInteger($2809, $9) then
    begin
      str1 := GetWinDir + '\UPDATE\' + cliap1.FileName;
      FResponseDataset.Add($2809, $1001).LoadFromFile(str1);
      FResponseDataset.AddVariant($2809, $1004, 1);
    end
    else
    begin
      FResponseDataset.AddVariant($2809, $1004, 2);
      FResponseDataset.AddVariant($2809, $9, cliap1.Version);
    end;
  end
  else
  begin
    FResponseDataset.AddVariant($2809, $1004, 0);
    FResponseDataset.AddVariant($2809, $1003,
      format('Can not update:%s.Please contact the system administrator',
      [FRequestCommand.GetString($2809, $8)]));
  end;
end;

destructor TClientUpdateSetting.Destroy;
begin
  inherited Destroy;
end;

constructor TClientUpdateSetting.Create(AName: AnsiString; AFileName: AnsiString; AVersion: Integer);
begin
  FName := AName;
  FFileName := AFileName;
  FVersion := AVersion;
end;

function TDicomServerCore.GetClientApplicationByName(AName: AnsiString): TClientUpdateSetting;
var
  I: Integer;
  List1: TList;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomServerCore.GetClientApplicationByName', v_crt_log );

  Result := nil;
  List1 := FAutoUpdateList.LockList;
  try
    for I := 0 to list1.Count - 1 do // Iterate
    begin
      if AName = TClientUpdateSetting(list1[i]).Name then
      begin
        Result := TClientUpdateSetting(list1[i]);
        exit;
      end;
    end; // for
  finally
    FAutoUpdateList.UnlockList;
  end;
end;

function TDicomServerCore.GetClientApplication(Aindex: Integer): TClientUpdateSetting;
var
  List1: TList;
begin
  List1 := FAutoUpdateList.LockList;
  try
    Result := TClientUpdateSetting(List1[AIndex]);
  finally
    FAutoUpdateList.UnlockList;
  end;
end;

function TDicomServerCore.AddApplication(AAppName, AFileName: AnsiString; AVersion: Integer):
  TClientUpdateSetting;
begin
  Result := TClientUpdateSetting.Create(AAppName, AFileName, AVersion);
  FAutoUpdateList.Add(Result);
  //toggle save config
  if assigned(FOnClientUpdateChange) then
    FOnClientUpdateChange(self);
end;

function TDicomServerCore.GetClientApplicationCount: Integer;
var
  l1: TList;
begin
  l1 := FAutoUpdateList.LockList;
  try
    Result := l1.Count;
  finally
    FAutoUpdateList.UnlockList;
  end;
end;

function TDicomServerCore.ClearClientApplication: Integer;
var
  l1: TList;
  I: Integer;
begin
  l1 := FAutoUpdateList.LockList;
  try
    for I := 0 to l1.Count - 1 do // Iterate
    begin
      TClientUpdateSetting(l1[i]).Free;
    end; // for
    l1.Clear;
  finally
    FAutoUpdateList.UnlockList;
  end;
end;

function TDicomServerCore.FindTaskSQL(AObjectName: AnsiString): TCnsTable;
begin
  Result := BasicSQLData.TableGroup.ItemByName[AObjectname];
  if (not assigned(Result)) and (assigned(OnDatabaseFindCnsTableData)) then
    OnDatabaseFindCnsTableData(self, Result);
end;

function TDicomServerCore.GetCreateTableSQL(t1: TCnsTable): AnsiString;
var
  Params: TStrings;
  dbstr1{, sql1}: AnsiString;
  ADBType: integer;
  dboname1, tablespace: AnsiString;
//  TableName1: AnsiString;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomServerCore.GetCreateTableSQL', v_crt_log );

  DBStr1 := Uppercase(t1.DatabaseName);

  Params := TStringList.Create;
  try
    if assigned(FCustomDatabaseOperator) then
    begin
      ADBType := FCustomDatabaseOperator.GetDBType(DBStr1);
      Params.Text := FCustomDatabaseOperator.GetDBParam(DBStr1);
    end
    else
      if assigned(OnDatabaseGetDatabaseParams) then
      OnDatabaseGetDatabaseParams(self, DBStr1, ADBType, Params);
    //          ADBType := ord(db1.ServerType);
    dboname1 := Params.Values['owner'];
    tablespace := Params.Values['tablespace'];
  finally
    Params.Free;
  end;

  if (ADBType = 1) and (tablespace <> '') then
  begin
    Result := t1.CreateSQLEx(dboname1, ADBType + 1) + #13#10'tablespace ' +
      tablespace + ''#13#10;
  end
  else
    Result := t1.CreateSQLEx(dboname1, ADBType + 1);
end;

procedure TDicomServerCore.CheckIfDatasetExists(t1: TCnsTable);
  procedure ExecSQL1(ADBStr, ASQL: AnsiString);
  begin
    DoExecSQL(nil, ADBStr, ASQL, nil);
  end;
  function IsInTable(dboname, AName: AnsiString; AStrs: TStrings): Boolean;
  var
    i, k: Integer;
    str1, str2, str3: AnsiString;
  begin
    Result := false;
    if dboname = '' then
      str2 := UpperCase(AName)
    else
      str2 := UpperCase(dboname + '.' + AName);
    for I := 0 to AStrs.Count - 1 do // Iterate
    begin
      str1 := UpperCase(AStrs[i]);
      k := Pos('.', str1);
      if k > 0 then
        str3 := Copy(str1, k + 1, length(str1) - k);
      if (CompareStr(str2, str1) = 0) or (CompareStr(str2, str3) = 0) then
      begin
        Result := true;
        break;
      end;
    end; // for
  end;
  function GetPrimaryKey: AnsiString;
  var
    i: integer;
  begin
    Result := '';
    for i := 0 to t1.PrimaryKey.Count - 1 do
    begin
      if t1.PrimaryKey[i] <> '' then
      begin
        if i <> 0 then
          Result := Result + ',';
        Result := Result + t1.PrimaryKey[i];
      end;
    end;
  end;
var
  strs1, strs2, Params: TStrings;
  dbstr1, sql1: AnsiString;
  i: Integer;
  fg, fg2: TCnsFieldGroup;
  ADBType: integer;
  dboname1, tablespace: AnsiString;
  TableName1: AnsiString;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomServerCore.CheckIfDatasetExists', v_crt_log );

  if not ForceCheckTableBeforeOpen then
    exit;
  if t1.HaveBeenCheckExists then
    exit;
  t1.HaveBeenCheckExists := true;

  if t1.AutoCreate then
    if t1.FindNameField('LASTUPDATEDATE') = nil then
    begin
      fg2 := t1.ItemByName['GROUP1'];
      if fg2 <> nil then
      begin
        fg := TCnsFieldGroup.Create(fg2, 'LASTUPDATEDATE');
        fg.IsField := true;
        fg.FieldType := ord(ftDateTime);
        fg.DefaultValue := 'NOW';
        fg.WidthInGrid := 0;
        fg.WidthInDialog := 0;
        fg.IsNull := true;

        fg2.Add(fg);
      end;
      //else
      //  raise Exception.Create('Inset LASTUPDATEDATE error');
    end;

  if t1.AUTOCREATE then
  begin
    strs1 := TStringList.Create;
    try
      DBStr1 := Uppercase(t1.DatabaseName);
      SQL1 := '';
      ADBType := 0;

      Params := TStringList.Create;
      try
        if assigned(FCustomDatabaseOperator) then
        begin
          ADBType := FCustomDatabaseOperator.GetDBType(DBStr1);
          Params.Text := FCustomDatabaseOperator.GetDBParam(DBStr1);
        end
        else
          if assigned(OnDatabaseGetDatabaseParams) then
          OnDatabaseGetDatabaseParams(self, DBStr1, ADBType, Params);
        //          ADBType := ord(db1.ServerType);
        dboname1 := Params.Values['owner'];
        tablespace := Params.Values['tablespace'];
      finally
        Params.Free;
      end;

      if dboname1 = '' then
        TableName1 := t1.TableName
      else
        TableName1 := dboname1 + '.' + t1.TableName;
      GetTableNames(DBStr1, strs1);
      if not IsInTable(dboname1, t1.TableName, strs1) then
      begin
        if (ADBType = 1) and (tablespace <> '') then
        begin
          ExecSQL1(DBStr1, t1.CreateSQL(dboname1, ADBType + 1) + #13#10'tablespace ' +
            tablespace + ''#13#10);
        end
        else
          ExecSQL1(DBStr1, t1.CreateSQL(dboname1, ADBType + 1));
        {        if DBStr1 = 'SYSTEM' then
                  exit;}
        strs1.Clear;
        GetTableFieldNames(DBStr1, TableName1, strs1);
        strs2 := TStringList.Create;
        try
          strs2.Text := t1.GetAllFields;
          for I := 0 to strs2.Count - 1 do // Iterate
          begin
            if t1.AUTOCREATE then
            begin
              fg := t1.FindNameField(strs2[i]);
              if assigned(fg) and (fg.OrderString <> '') and (t1.PrimaryKey.IndexOf(strs2[i]) < 0)
                then
              begin
                ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + strs2[i] + ' ON ' +
                  TableName1 + '(' + strs2[i] + ')');
              end;
            end;
          end;
        finally
          strs2.free;
        end;
        if t1.ProfileFieldName <> '' then
        begin
          ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + t1.ProfileFieldName + ' ON ' +
            TableName1 + '(' + t1.ProfileFieldName + ')');
          ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + t1.ProfileFieldName + '_EX ON ' +
            TableName1 + '(' + GetPrimaryKey + ',' + t1.ProfileFieldName + ')');
        end;
        if assigned(t1.States) and (t1.States.Name <> '') then
        begin
          ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + t1.States.Name + ' ON ' +
            TableName1 + '(' + t1.States.Name + ')');
          ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + t1.States.Name + '_EX ON ' +
            TableName1 + '(' + GetPrimaryKey + ',' + t1.States.Name + ')');
          if t1.ProfileFieldName <> '' then
            ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + t1.States.Name + '_EX1 ON ' +
              TableName1 + '(' + GetPrimaryKey + ',' + t1.ProfileFieldName + ',' + t1.States.Name +
              ')');
        end;
      end
      else
      begin
        {        if DBStr1 = 'SYSTEM' then
                  exit;}
        strs1.Clear;
        GetTableFieldNames(DBStr1, TableName1, strs1);
        strs2 := TStringList.Create;
        try
          strs2.Text := t1.GetAllFields;
          for I := 0 to strs2.Count - 1 do // Iterate
          begin
            if not IsInTable('', strs2[i], strs1) then
            begin
              if t1.AUTOCREATE then
              begin
                fg := t1.FindNameField(strs2[i]);
                if assigned(fg) then
                begin
                  ExecSQL1(DBStr1,
                    'ALTER TABLE ' + TableName1 + ' ADD ' + strs2[i] + ' ' +
                    fg.GetFieldType(ADBType + 1));
                  if fg.DefaultValue <> '' then
                  begin
                    try
                      if TFieldType(fg.FieldType) in [ftSmallint, ftInteger, ftWord, ftAutoInc,
                        ftFloat, ftCurrency] then
                        ExecSQL1(DBStr1, 'Update ' + TableName1 + ' set ' + strs2[i] + ' = ' +
                          fg.DefaultValue)
                      else
                        if TFieldType(fg.FieldType) in [ftString] then
                        ExecSQL1(DBStr1, 'Update ' + TableName1 + ' set ' + strs2[i] + ' = ''' +
                          fg.DefaultValue + '''');
                    except
                    end;
                  end;
                  if fg.OrderString <> '' then
                  begin
                    ExecSQL1(DBStr1,
                      'CREATE INDEX ' + t1.TableName + '_' + strs2[i] + ' ON ' +
                      TableName1 + '(' + strs2[i] + ')');
                  end;
                end
                else
                  if strs2[i] = t1.ProfileFieldName then
                begin
                  ExecSQL1(DBStr1, 'ALTER TABLE ' + TableName1 + ' ADD ' + strs2[i] + ' Integer');
                  try
                    ExecSQL1(DBStr1, 'Update ' + TableName1 + ' set ' + strs2[i] + ' = ' +
                      IntToStr(t1.Profiles[0].Value));
                  except
                  end;
                  ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + strs2[i] + ' ON ' +
                    TableName1 + '(' + strs2[i] + ')');
                  ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + t1.ProfileFieldName +
                    '_EX ON ' +
                    TableName1 + '(' + GetPrimaryKey + ',' + t1.ProfileFieldName + ')');
                end
                else
                  if assigned(t1.States) and (strs2[i] = t1.States.Name) then
                begin
                  ExecSQL1(DBStr1, 'ALTER TABLE ' + TableName1 + ' ADD ' + strs2[i] + ' Integer');
                  try
                    ExecSQL1(DBStr1, 'Update ' + TableName1 + ' set ' + strs2[i] + ' = ' +
                      IntToStr(t1.States[0].Value));
                  except
                  end;
                  ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + strs2[i] + ' ON ' +
                    TableName1 + '(' + strs2[i] + ')');
                  ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + t1.States.Name + '_EX ON '
                    +
                    TableName1 + '(' + GetPrimaryKey + ',' + t1.States.Name + ')');
                  if t1.ProfileFieldName <> '' then
                    ExecSQL1(DBStr1, 'CREATE INDEX ' + t1.TableName + '_' + t1.States.Name +
                      '_EX1 ON ' +
                      TableName1 + '(' + GetPrimaryKey + ',' + t1.ProfileFieldName + ',' +
                      t1.States.Name + ')');
                end
                else
                  SQL1 := SQL1 + strs2[i] + #13#10;
              end
              else
                SQL1 := SQL1 + strs2[i] + #13#10;
            end;
          end; // for
        finally
          strs2.Free;
        end;
      end;
      if SQL1 <> '' then
      begin
        DoLogit(nil, 'CheckTable', 'Can not find"' + TableName1 + '", "' + SQL1 +
          '" is not exists');
      end;
    finally
      strs1.Free;
    end;
  end;
end;

procedure TDicomServerCore.ClearSQLDefine;
begin
  FBasicSQLData.Clear;
end;

function TDicomServerCore.AddSQLDefine(ATaskSQL: AnsiString): Boolean;
  function CheckTaskSQL: Boolean;
  var
    xpar1: TCnsSQLParser;
    SQLData1: TCnsSQLData;

  begin
    xpar1 := TCnsSQLParser.Create;
    SQLData1 := TCnsSQLData.Create;
    try
      xpar1.SetSQLData(SQLData1);
      xpar1.SourceString := ATaskSQL;
      xpar1.Parse;
      Result := xpar1.errors = 0;
    //  if not Result then
    //    raise Exception.Create(xpar1.lst.DataString);
    finally
      xpar1.Free;
      SQLData1.Free;
    end;
  end;
var
  par1: TCnsSQLParser;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomServerCore.AddSQLDefine', v_crt_log );

  Result := CheckTaskSQL;
  if Result then
  begin
    par1 := TCnsSQLParser.Create;
    try
      par1.SetSQLData(FBasicSQLData);
      par1.SourceString := ATaskSQL;
      par1.Parse;
    finally
      par1.Free;
    end; // try/finally
  end;
end;

procedure TDicomServerCore.GetTableNames(ADBstr: AnsiString; AStrs: Tstrings);
begin
  if assigned(FCustomDatabaseOperator) then
    FCustomDatabaseOperator.GetTableNames(ADBStr, AStrs)
  else
    if assigned(FOnDatabaseGetTableNames) then
    FOnDatabaseGetTableNames(self, ADBStr, AStrs);
end;

procedure TDicomServerCore.DoNewCommand(Sender: TObject; AAssociation: TAssociation; ADataset: TDicomAttributes;
  APosition: Integer; AStream: TStream);
begin
  if assigned(fOnClientNewCommand) then
  begin
    fOnClientNewCommand(Sender, AAssociation, ADataset, APosition, AStream);
  end;
end;

procedure TDicomServerCore.DoNewData(Sender: TObject; AAssociation: TAssociation; ADataset: TDicomAttributes;
  APosition: Integer; AStream: TStream);
begin
  if assigned(FOnClientNewData) then
  begin
    FOnClientNewData(sender, AAssociation, ADataset, APosition, AStream);
  end;
end;

procedure TDicomServerCore.getTableFieldNames(ADBStr, ATableName: AnsiString; AStrs: TStrings);
begin
  if assigned(FCustomDatabaseOperator) then
    FCustomDatabaseOperator.GetTableFieldNames(ADBStr, ATablename, AStrs)
  else
    if assigned(FOnDatabaseGetTableFieldNames) then
    FOnDatabaseGetTableFieldNames(self, ADBStr, ATableName, AStrs);
end;

{      for i := 1 to GetClientCount do
      begin
        p3 := ClientApplications[i - 1];
        WriteString('UPDATE' + IntToStr(i), 'Name', p3.FName);
        WriteString('UPDATE' + IntToStr(i), 'FileName', p3.FFileName);
        writeString('UPDATE' + IntToStr(i), 'Version', FloatToStr(p3.FVersion));
      end;
      EraseSection('UPDATE' + IntToStr(GetClientCount + 1));

    i := 1;
    str1 := ReadString('UPDATE' + IntToStr(i), 'Name', '');
    while str1 <> '' do
    begin
      AddApplication(str1, ReadString('UPDATE' + IntToStr(i), 'Filename', ''),
        ReadInteger('UPDATE' + IntToStr(i), 'Version', 0));
      inc(i);
      str1 := ReadString('UPDATE' + IntToStr(i), 'Name', '');
    end;}

constructor TCustomDicomDatabaseOperator.Create(AOwner: TComponent);
begin
  inherited;
  fLogDatabaseSQL := false;

  fImagesTableName := 'IMAGES';

  fPatientTablename := 'PATIENTS';

  fSeriesTableName := 'SERIES';

  fStudiesTableName := 'STUDIES';
end;

destructor TCustomDicomDatabaseOperator.Destroy;
begin
  inherited;
end;

function TCustomDicomDatabaseOperator.SumitSQL(ADBStr, ASQL: AnsiString; AFetchCount: Integer;
  UseMultiDatabase: Boolean;
  Params: TDicomAttribute; AClientThread: TDicomClientThread=nil): TDataSet;   // FOMIN 23.05.2013
begin
  Result := nil;
end;

procedure TCustomDicomDatabaseOperator.SumitSQLAndSaveTo(ADBStr, ASQL: AnsiString; AFetchCount: Integer; UseMultiDatabase: Boolean;
  Params: TDicomAttribute; AMemoFilter: TDicomAttribute; AResponseDataset: TDicomAttributes; AResponseList: TList; ARequestType: Integer);
var
  d1: TDataset;
  stm1: TStream;
begin
  Dcm_Server_wrt_log('unit DCM_Server TCustomDicomDatabaseOperator.SumitSQLAndSaveTo', v_crt_log );

  d1 := SumitSQL(ADBStr, ASQL, AFetchCount, UseMultiDatabase, Params);
  try
    if assigned(d1) and d1.Active then
    begin
      //FResponseDataset.LoadDataset(d1, DatasetPos1, FetchCount, FRequestCommand.Item[$2813,                  $111]);
      //if (FRequestCommand.GetInteger($2809, $1006) < 10) or (FRequestCommand.Item[$2813, $111] <> nil) then
      if ARequestType = 0 then
      begin
        AResponseDataset.LoadDataset(d1, 0, AFetchCount, AMemoFilter);
        AResponseDataset.AddVariant($2813, $0120, 0);
      end
      else
      begin
        AResponseDataset.AddVariant($2813, $0120, 1);
        AResponseDataset.LoadDataset(d1, 0, -1000, nil);
        //todo  save data to stream
        stm1 := SaveDatasetToStream(d1, AFetchCount, AMemoFilter);
        if stm1 <> nil then
          AResponseList.Add(stm1);
        //FResponseDataset.FillResultDataset(d1, FetchCount, true);
      end;
    end
    else
    begin
      AResponseDataset.AddVariant($2809, $1003, 'Fail To Open Query ==(' + aSQL + ')');
      AResponseDataset.AddVariant($2809, $1004, -2);
      Logit('', 'Fail To Open Query ==(' + aSQL + ')');
    end;
  except
    on e: Exception do
    begin
      AResponseDataset.AddVariant($2809, $1003, 'Fill Result Dataset:' + e.Message);
      AResponseDataset.AddVariant($2809, $1004, -2);
      Logit('', 'Fill Result Dataset:' + e.Message + '==(' + aSQL + ')');
      exit;
    end;
  end;
end;

function TCustomDicomDatabaseOperator.GetDicomServerCore: TDicomServerCore;
begin
  result := fDicomServerCore;
end;

procedure TCustomDicomDatabaseOperator.SetDicomServerCore(Value: TDicomServerCore);
begin
  fDicomServerCore := Value;
end;

function TCustomDicomDatabaseOperator.SumitSQLToMemDataset(ADBStr, ASQL: AnsiString; AFetchCount: Integer;
  UseMultiDatabase: Boolean;
  Params: TDicomAttribute; AOrderBy: string; ATable: TKxmMemTable): TDataSet;
begin
  Result := SumitSQL(ADBStr, ASQL, AFetchCount, UseMultiDatabase, Params);
end;

procedure TCustomDicomDatabaseOperator.ExecSQL(ADBStr, ASQL: AnsiString;
  Params: TDicomAttribute;  AClientThread: TDicomClientThread=nil);  // FOMIN 23.05.2013
begin

end;

procedure TCustomDicomDatabaseOperator.AddServerObject(Sender: TObject;
  AList: TList);
begin

end;

procedure TCustomDicomDatabaseOperator.ExecProc(ADBStr, AStorageProc, AOutput: AnsiString;
  AParams: TDicomAttribute; var AResult: AnsiString);
begin
  AResult := '';
end;

procedure TCustomDicomDatabaseOperator.GetGenID(ADatabaseName,
  ATableName, Fieldname: AnsiString; AutoInc: Boolean; ASetValue: Integer;
  var AResult: Integer);
begin
  AResult := 1;
end;

procedure TCustomDicomDatabaseOperator.GetTableFieldNames(ADBStr, ATableName: AnsiString; AStrs:
  TStrings);
begin

end;

procedure TCustomDicomDatabaseOperator.GetTableNames(ADBstr: AnsiString; AStrs: TStrings);
begin

end;

function TCustomDicomDatabaseOperator.GetDBType(ADatabaseName: AnsiString): Integer;
begin
  Result := 0;
end;

function TCustomDicomDatabaseOperator.AppendImage(a1: TDicomAttributes; studyid, PName, pSex,
  PatientID: AnsiString;
  date1: TDatetime; studyuid, seriesuid, InstanceUID, ImageType, aid, APeerIP, aAEtitle: AnsiString; var
  AModility: AnsiString; AStudyUIDType, AGroupFilter: AnsiString): TDatetime;
begin

end;

procedure TDicomClientThread.SaveDicomImage;
begin
  //  if assigned(FOnDicomImage) then
  //    FOnDicomImage(self, '', FDatasetToSave);
end;

procedure TDicomClientThread.DoNewCommand(AAssociation: TAssociation; ADataset: TDicomAttributes;
  APosition: Integer; AStream: TStream);
begin
  if assigned(fOnClientNewCommand) then
  begin
    fOnClientNewCommand(self, AAssociation, ADataset, APosition, AStream);
  end;
end;

procedure TDicomClientThread.DoNewData(AAssociation: TAssociation; ADataset: TDicomAttributes;
  APosition: Integer; AStream: TStream);
begin
  if assigned(FOnClientNewData) then
  begin
    FOnClientNewData(self, AAssociation, ADataset, APosition, AStream);
  end;
end;

procedure TCustomDicomDatabaseOperator.LogDB(AType, AIP, aDBStr, aSql: AnsiString; A1: TDicomAttributes);
begin
  if assigned(OnDicomLogDB) then
    OnDicomLogDB(nil, AType, AIP, aDBStr, aSql, A1);
end;

procedure TCustomDicomDatabaseOperator.LogException(AIP, ErrorMsg: AnsiString);
begin
  if assigned(OnDicomLogException) then
    OnDicomLogit(nil, AIP, '#3 '+ErrorMsg);
end;

procedure TCustomDicomDatabaseOperator.Logit(AIP, Msg: AnsiString);
begin
  if assigned(OnDicomLogit) then
    OnDicomLogit(nil, AIP, '#4 '+Msg);
end;

procedure TDicomClientThread.DicomGetRequestEx(AClientThread: TDicomClientThread; rq: TDicomAttributes;
  ADstCommand: TDicomAttribute; AResponseStreams: TList; AResponseFiles: TStringList);
begin
  if assigned(FOnDicomGetRequestEx) then
    FOnDicomGetRequestEx(AClientThread, rq, adstcommand, AResponseStreams, AResponseFiles);
end;

procedure TDicomClientThread.SaveDicomImageEx(AClientThread: TDicomClientThread; ADataset: TDicomAttributes;
  var AStm: TFileStream);
begin
  if assigned(FOnSaveDicomImageEx) then
    FOnSaveDicomImageEx(AClientThread, ADataset, AStm);
end;

procedure TDicomServerCore.DoDicomGetRequestEx(AClientThread: TDicomClientThread; rq: TDicomAttributes;
  ADstCommand: TDicomAttribute; AResponseStreams: TList; AResponseFiles: TStringList);
begin
  if assigned(FOnDicomGetRequestEx) then
    FOnDicomGetRequestEx(AClientThread, rq, adstcommand, AResponseStreams, AResponseFiles);
end;

procedure TDicomServerCore.DoSaveDicomImageEx(AClientThread: TDicomClientThread; ADataset: TDicomAttributes;
  var AStm: TFileStream);
begin
  if assigned(FOnSaveDicomImageEx) then
    FOnSaveDicomImageEx(AClientThread, ADataset, AStm);
end;

procedure TDicomServerCore.SetFCustomDatabaseOperator(
  const Value: TCustomDicomDatabaseOperator);
begin
  FCustomDatabaseOperator := Value;
  if FCustomDatabaseOperator <> nil then
  begin
    FCustomDatabaseOperator.OnDicomLogit := DoLogit;
    FCustomDatabaseOperator.OnDicomLogDB := DoLogDB;
    FCustomDatabaseOperator.OnDicomLogException := DoLogException;
  end;
end;

function TCustomDicomDatabaseOperator.GetDBParam(
  ADatabaseName: AnsiString): AnsiString;
begin
  Result := '';
end;

procedure TDicomServerCore.BuildService;
var
  List1: TList;
begin
  Dcm_Server_wrt_log('unit DCM_Server TDicomServerCore.BuildService', v_crt_log );

  MnLg_ev('BuildService',vLogDir+'\'+'dcm_server_thread.log');
  List1 := FServerList.LockList;
  try
    if List1.Count = 0 then
    begin
      List1.Add(TFunctionObject.Create(TServerObjectSUMIT, 'SUMIT'));
      MnLg_ev('Create TServerObjectSUMIT',vLogDir+'\'+'dcm_server_thread.log');
      List1.Add(TFunctionObject.Create(TServerObjectEXEC, 'EXEC'));
      MnLg_ev('Create TServerObjectEXEC',vLogDir+'\'+'dcm_server_thread.log');
      List1.Add(TFunctionObject.Create(TServerObjectGFILE, 'GFILE'));
      MnLg_ev('Create TServerObjectGFILE',vLogDir+'\'+'dcm_server_thread.log');
      List1.Add(TFunctionObject.Create(TServerObjectSFILE, 'SFILE'));
      MnLg_ev('Create TServerObjectSUMTServerObjectSFILEIT',vLogDir+'\'+'dcm_server_thread.log');
      List1.Add(TFunctionObject.Create(TServerObjectOBJECT, 'OBJECT'));
      MnLg_ev('Create TServerObjectOBJECT',vLogDir+'\'+'dcm_server_thread.log');
      List1.Add(TFunctionObject.Create(TServerObjectUPDATE, 'UPDATE'));
      MnLg_ev('Create TServerObjectUPDATE',vLogDir+'\'+'dcm_server_thread.log');
      List1.Add(TFunctionObject.Create(TServerObjectGENID, 'GENID'));
      MnLg_ev('Create TServerObjectGENID',vLogDir+'\'+'dcm_server_thread.log');
      List1.Add(TFunctionObject.Create(TServerObjectVERSION, 'VERSION'));
      MnLg_ev('Create TServerObjectVERSION',vLogDir+'\'+'dcm_server_thread.log');
      List1.Add(TFunctionObject.Create(TServerObjectPROC, 'PROC'));
      MnLg_ev('Create TServerObjectPROC',vLogDir+'\'+'dcm_server_thread.log');
      List1.Add(TFunctionObject.Create(TServerObjectNOW, 'NOW'));
      MnLg_ev('Create TServerObjectNOW',vLogDir+'\'+'dcm_server_thread.log');
      if assigned(FCustomDatabaseOperator) then
        FCustomDatabaseOperator.AddServerObject(self, List1);
      if assigned(OnDatabaseAddServerObject) then
        OnDatabaseAddServerObject(self, List1);

      List1.Sort(CompareFunctionObject);
    end;
  finally
    FServerList.UnlockList;
  end;
end;

procedure TDicomServerCore.Start;
begin
  inherited;
  BuildService;
end;

{ TServerObjectNOW }

procedure TServerObjectNOW.Execute;
begin
  MnLg_ev('TServerObjectNOW.Execute',vLogDir+'\'+'dcm_server_thread.log');
  FResponseDataset.Add($2809, $18).AsDatetime[0] := now;
end;

procedure TDicomServerCore.SetOnClientUpdateChange(
  const Value: TNotifyEvent);
begin
  FOnClientUpdateChange := Value;
end;

{ TNetStreamCacheItem }

constructor TNetStreamCacheItem.Create(AStream: TStream);
begin
  fStream := AStream;
  FCreateTime := now;
  FLastOpTime := now;
end;

destructor TNetStreamCacheItem.Destroy;
begin
  if fStream <> nil then
    fStream.Free;
  inherited;
end;

procedure TNetStreamCacheItem.SetCreateTime(const Value: TDatetime);
begin
  FCreateTime := Value;
end;

procedure TNetStreamCacheItem.SetHandle(const Value: Integer);
begin
  FHandle := Value;
end;

procedure TNetStreamCacheItem.SetLastOpTime(const Value: TDatetime);
begin
  FLastOpTime := Value;
end;

procedure TNetStreamCacheItem.SetPosition(const Value: Integer);
begin
  FPosition := Value;
end;

procedure TNetStreamCacheItem.SetRequestHost(const Value: AnsiString);
begin
  FRequestHost := Value;
end;

{ TNetStreamCache }

function TNetStreamCache.AddStream(AStream: TStream): Integer;
begin

end;

procedure TNetStreamCache.Clear;
begin

end;

constructor TNetStreamCache.Create;
begin

end;

destructor TNetStreamCache.Destroy;
begin

  inherited;
end;

function TNetStreamCache.GetStreams(index: Integer): TStream;
begin

end;

procedure TNetStreamCache.SetStreams(index: Integer; const Value: TStream);
begin

end;

function CompareCacheDataset(Item1, Item2: Pointer): Integer;
begin
  Result := CompareText(TKxmThreadDataSet(Item1).Objectname, TKxmThreadDataSet(Item2).Objectname);
end;

procedure TDicomServerCore.AddCacheDataset(AObjectName: AnsiString;
  ADataset: TDataset);
var
  d1: TKxmThreadDataSet;
  List1: TList;
begin
  d1 := TKxmThreadDataSet.Create(nil);
  d1.Objectname := AObjectName;
  d1.Dataset := ADataset;

  List1 := fCacheDatasets.LockList;
  try
    List1.add(d1);
    List1.Sort(CompareCacheDataset);
  finally
    fCacheDatasets.UnlockList;
  end;
end;

function TDicomServerCore.FindCacheDataset(
  AObjectName: AnsiString): TKxmThreadDataSet;
var
  k, k1: AnsiString;
  l1, h1, m1: Integer;
  list1: TList;
begin
  k := AObjectName;
  l1 := 0;
  list1 := fCacheDatasets.LockList;
  try
    h1 := list1.Count - 1;
    Result := nil;
    while l1 <= h1 do
    begin
      m1 := (l1 + h1) div 2;
      k1 := TKxmThreadDataSet(list1[m1]).Objectname;
      if k1 > k then
        h1 := m1 - 1
      else
        if k1 < k then
        l1 := m1 + 1
      else
      begin
        Result := TKxmThreadDataSet(list1[m1]);
        exit;
      end;
    end; // while
  finally
    fCacheDatasets.UnlockList;
  end;
end;

procedure TDicomServerCore.ClearCache;
var
  i: Integer;
  l1: TList;
begin
  l1 := fCacheDatasets.LockList;
  try
    for I := 0 to l1.Count - 1 do // Iterate
    begin
      TKxmThreadDataSet(l1[i]).Dataset.Free;
      TKxmThreadDataSet(l1[i]).Free;
    end; // for
    l1.Clear;
  finally
    fCacheDatasets.UnlockList;
  end;
end;

procedure TDicomClientThread.SetOnNormalisedReceived(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceived := Value;
end;

procedure TDicomServerCore.SetOnNormalisedReceived(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceived := Value;
end;

procedure TDicomServerCore.NormalisedReceived(
  AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnNormalisedReceived) then
    OnNormalisedReceived(AClientThread, AAddress, ACommand, ARequestDatasets, AResponseDatasets);
end;

procedure TDicomClientThread.SetOnNormalisedReceivedNAction(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNAction := Value;
end;

procedure TDicomClientThread.SetOnNormalisedReceivedNCreate(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNCreate := Value;
end;

procedure TDicomClientThread.SetOnNormalisedReceivedNDelete(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNDelete := Value;
end;

procedure TDicomClientThread.SetOnNormalisedReceivedNEventReport(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNEventReport := Value;
end;

procedure TDicomClientThread.SetOnNormalisedReceivedNGet(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNGet := Value;
end;

procedure TDicomClientThread.SetOnNormalisedReceivedNSet(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNSet := Value;
end;

procedure TDicomServerCore.SetOnNormalisedReceivedNAction(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNAction := Value;
end;

procedure TDicomServerCore.SetOnNormalisedReceivedNCreate(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNCreate := Value;
end;

procedure TDicomServerCore.SetOnNormalisedReceivedNDelete(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNDelete := Value;
end;

procedure TDicomServerCore.SetOnNormalisedReceivedNEvent(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNEvent := Value;
end;

procedure TDicomServerCore.SetOnNormalisedReceivedNGet(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNGet := Value;
end;

procedure TDicomServerCore.SetOnNormalisedReceivedNSet(
  const Value: TDicomRequestEvent);
begin
  FOnNormalisedReceivedNSet := Value;
end;

procedure TDicomServerCore.NormalisedReceivedNAction(
  AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnNormalisedReceivedNAction) then
    OnNormalisedReceivedNAction(AClientThread, AAddress, ACommand, ARequestDatasets,
      AResponseDatasets);

end;

procedure TDicomServerCore.NormalisedReceivedNCreate(
  AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnNormalisedReceivedNCreate) then
    OnNormalisedReceivedNCreate(AClientThread, AAddress, ACommand, ARequestDatasets,
      AResponseDatasets);

end;

procedure TDicomServerCore.NormalisedReceivedNDelete(
  AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnNormalisedReceivedNDelete) then
    OnNormalisedReceivedNDelete(AClientThread, AAddress, ACommand, ARequestDatasets,
      AResponseDatasets);

end;

procedure TDicomServerCore.NormalisedReceivedNEventReport(
  AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnNormalisedReceivedNEventReport) then
    OnNormalisedReceivedNEventReport(AClientThread, AAddress, ACommand, ARequestDatasets,
      AResponseDatasets);

end;

procedure TDicomServerCore.NormalisedReceivedNGet(
  AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnNormalisedReceivedNGet) then
    OnNormalisedReceivedNGet(AClientThread, AAddress, ACommand, ARequestDatasets,
      AResponseDatasets);

end;

procedure TDicomServerCore.NormalisedReceivedNSet(
  AClientThread: TDicomClientThread; AAddress: AnsiString;
  ACommand: TDicomAttributes; ARequestDatasets, AResponseDatasets: TList);
begin
  if assigned(OnNormalisedReceivedNSet) then
    OnNormalisedReceivedNSet(AClientThread, AAddress, ACommand, ARequestDatasets,
      AResponseDatasets);

end;

function TDicomPrintQueue.GetCount: Integer;
begin
  Result := FList.Count;
end;

procedure TKxMoveChannelThread.SetCalledTitle(const Value: AnsiString);
begin
  FCalledTitle := Value;
end;

procedure TKxMoveChannelThread.SetCallingTitle(const Value: AnsiString);
begin
  FCallingTitle := Value;
end;

procedure TKxMoveChannelThread.SetMaxPduSize(const Value: Integer);
begin
  FMaxPduSize := Value;
end;

procedure TDicomServerCore.SetForceCheckTableBeforeOpen(
  const Value: Boolean);
begin
  FForceCheckTableBeforeOpen := Value;
end;

{ TThreadStringList }

constructor TThreadStringList.Create;
begin
  inherited Create;
  InitializeCriticalSection(FLock);
  FStringList := TStringList.Create;
  FStringList.Duplicates := dupIgnore;
end;

destructor TThreadStringList.Destroy;
begin
  LockList;
  try
    FStringList.Free;
    inherited Destroy;
  finally
    UnlockList;
    DeleteCriticalSection(FLock);
  end;
end;

function TThreadStringList.LockList: TStringList;
begin
  EnterCriticalSection(FLock);
  Result := FStringList;
end;

procedure TThreadStringList.UnlockList;
begin
  LeaveCriticalSection(FLock);
end;

function TThreadStringList.Add(const S: AnsiString): Integer;
begin
  Result := -1;
  LockList;
  try
    Result := FStringList.Add(S);
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.AddStrings(Strings: TStrings);
begin
  LockList;
  try
    FStringList.AddStrings(Strings);
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.Delete(Index: Integer);
begin
  LockList;
  try
    FStringList.Delete(Index);
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.Clear;
begin
  LockList;
  try
    FStringList.Clear;
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.Exchange(Index1, Index2: Integer);
begin
  LockList;
  try
    FStringList.Exchange(Index1, Index2);
  finally
    UnlockList;
  end;
end;

function TThreadStringList.Find(const S: AnsiString; var Index: Integer): Boolean;
begin
  LockList;
  try
    Result := FStringList.Find(S, Index);
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.Insert(Index: Integer; const S: AnsiString);
begin
  LockList;
  try
    FStringList.Insert(Index, S);
  finally
    UnlockList;
  end;
end;

function TThreadStringList.IndexOf(const S: AnsiString): Integer;
begin
  Result := -1;
  LockList;
  try
    Result := FStringList.IndexOf(S);
  finally
    UnlockList;
  end;
end;

function TThreadStringList.IndexOfName(const Name: AnsiString): Integer;
begin
  Result := -1;
  LockList;
  try
    Result := FStringList.IndexOfName(Name);
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.Sort;
begin
  LockList;
  try
    FStringList.Sort;
  finally
    UnlockList;
  end;
end;

function TThreadStringList.GetText: {$IFDEF LEVEL12}PWideChar{$ELSE}PAnsiChar{$ENDIF};
begin
  LockList;
  try
    Result := FStringList.GetText;
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.LoadFromFile(const FileName: AnsiString);
begin
  LockList;
  try
    FStringList.LoadFromFile(FileName);
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.LoadFromStream(Stream: TStream);
begin
  LockList;
  try
    FStringList.LoadFromStream(Stream);
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SaveToFile(const FileName: AnsiString);
begin
  LockList;
  try
    FStringList.SaveToFile(FileName);
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SaveToStream(Stream: TStream);
begin
  LockList;
  try
    FStringList.SaveToStream(Stream);
  finally
    UnlockList;
  end;
end;

function TThreadStringList.GetDuplicates: TDuplicates;
begin
  LockList;
  try
    Result := FStringList.Duplicates;
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SetDuplicates(dup: TDuplicates);
begin
  LockList;
  try
    FStringList.Duplicates := dup;
  finally
    UnlockList;
  end;
end;

function TThreadStringList.GetCapacity: Integer;
begin
  LockList;
  try
    Result := FStringList.Capacity;
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SetCapacity(capa: Integer);
begin
  LockList;
  try
    FStringList.Capacity := capa;
  finally
    UnlockList;
  end;
end;

function TThreadStringList.GetCommaText: AnsiString;
begin
  LockList;
  try
    Result := FStringList.CommaText;
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SetCommaText(const S: AnsiString);
begin
  LockList;
  try
    FStringList.CommaText := S;
  finally
    UnlockList;
  end;
end;

function TThreadStringList.GetCount: Integer;
begin
  LockList;
  try
    Result := FStringList.Count;
  finally
    UnlockList;
  end;
end;
{$IFDEF LEVEL6}

function TThreadStringList.GetDelimiter: Char;
begin
  LockList;
  try
    Result := FStringList.Delimiter;
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SetDelimiter(delim: Char);
begin
  LockList;
  try
    FStringList.Delimiter := delim;
  finally
    UnlockList;
  end;
end;

function TThreadStringList.GetDelimitedText: AnsiString;
begin
  LockList;
  try
    Result := FStringList.DelimitedText;
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SetDelimitedText(const S: AnsiString);
begin
  LockList;
  try
    FStringList.DelimitedText := S;
  finally
    UnlockList;
  end;
end;
{$ENDIF}

function TThreadStringList.GetNames(Index: Integer): AnsiString;
begin
  LockList;
  try
    Result := FStringList.Names[Index];
  finally
    UnlockList;
  end;
end;

function TThreadStringList.GetValues(const Name: AnsiString): AnsiString;
begin
  LockList;
  try
    Result := FStringList.Values[Name];
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SetValues(const Name: AnsiString; S: AnsiString);
begin
  LockList;
  try
    FStringList.Values[Name] := S;
  finally
    UnlockList;
  end;
end;

function TThreadStringList.GetStrings(Index: Integer): AnsiString;
begin
  LockList;
  try
    Result := FStringList.Strings[Index];
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SetStrings(Index: Integer; S: AnsiString);
begin
  LockList;
  try
    FStringList.Strings[Index] := S;
  finally
    UnlockList;
  end;
end;

function TThreadStringList.GetAsText: AnsiString;
begin
  LockList;
  try
    Result := FStringList.Text;
  finally
    UnlockList;
  end;
end;

procedure TThreadStringList.SetAsText(S: AnsiString);
begin
  LockList;
  try
    FStringList.Text := S;
  finally
    UnlockList;
  end;
end;

procedure TDicomClientThread.SetOnGetCMoveLocalPortEx(
  const Value: TOnGetCMoveLocalPortExEvent);
begin
  FOnGetCMoveLocalPortEx := Value;
end;

procedure TDicomServerCore.SetOnGetCMoveLocalPortEx(
  const Value: TOnGetCMoveLocalPortExEvent);
begin
  FOnGetCMoveLocalPortEx := Value;
end;

procedure TKxMoveChannelThread.SetSendingIndex(const Value: Integer);
begin
  FSendingIndex := Value;
end;

function TCustomDicomDatabaseOperator.SaveDatasetToStream(ADataset: TDataset; AFetchCount: Integer; AMemoFilter: TDicomAttribute): TStream;
var
  v1: TDicomDatasetBinaryStreamFormat;
begin
  Dcm_Server_wrt_log('unit DCM_Server TCustomDicomDatabaseOperator.SaveDatasetToStream', v_crt_log );

  v1 := TDicomDatasetBinaryStreamFormat.Create(nil);
  try
    Result := TMemoryStream.Create;
    v1.WorkStream := Result;
    v1.WorkDataset := ADataset;
    if aFetchCount > 0 then
      v1.SaveLimit := aFetchCount;
    if AMemoFilter <> nil then
    begin
      v1.MemoFilter := AMemoFilter;
      v1.OnFilterRecord := kxmMemTable1OnFilterRecord;
    end;
    v1.BeforeSave(ADataset);
    v1.SaveDef(ADataset);
    v1.SaveData(ADataset);
    v1.AfterSave(ADataset);
  finally
    v1.Free;
  end;
end;

procedure TCustomDicomDatabaseOperator.kxmMemTable1OnFilterRecord(DataSet: TObject; var Accept: Boolean);
  function IsMemo(ADataset: TDataset; AMemoFilter: TDicomAttribute): Boolean;
  var
    das1: TDicomAttributes;
    i: integer;
    str1, str2, str3: AnsiString;
    f1: TField;
  begin
    if (AMemoFilter <> nil) and (AMemoFilter.GetCount > 0) then
    begin
      Result := false;
      for i := 0 to AMemoFilter.GetCount - 1 do
      begin
        das1 := AMemoFilter.Attributes[i];

        str1 := Trim(das1.GetString($2813, $0101));
        str2 := Trim(das1.GetString($2813, $0123));
        if (str1 <> '') and (str2 <> '') then
        begin
          f1 := ADataset.FindField(str1);
          if assigned(f1) then
          begin
            str3 := f1.AsString;
            Result := Pos(str2, str3) > 0;
            if not Result then
              exit;
          end
          else
          begin
            Result := true;
          end;
        end;
      end;
    end
    else
      Result := TRUE;
  end;
begin
  Dcm_Server_wrt_log('unit DCM_Server TCustomDicomDatabaseOperator.kxmMemTable1OnFilterRecord', v_crt_log );

  Accept := IsMemo(TDicomDatasetBinaryStreamFormat(DataSet).WorkDataSet, TDicomDatasetBinaryStreamFormat(DataSet).MemoFilter);
  //  Accept := DataSet.FieldByName('USER_NAME').AsString = '127.0.0.1';
end;

end.

