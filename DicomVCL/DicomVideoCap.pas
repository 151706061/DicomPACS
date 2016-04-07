unit DicomVideoCap;

interface

{$I DicomPack.inc}

// -----------------------------------------------------------------------------
// BCB support
{$NOINCLUDE ActiveX}
{$NOINCLUDE DicomDirectShow}
{$HPPEMIT '/* don''t use DirectShow.pas in C++ sources - use native C++ headers!!! */' }
{$HPPEMIT '#define Directshow ' }
{$HPPEMIT '#include <strmif.h>' }
{$HPPEMIT '#include <control.h>' }
{$HPPEMIT 'typedef System::DelphiInterface<IGraphBuilder> _di_IGraphBuilder;'}
{$HPPEMIT 'typedef System::DelphiInterface<ICaptureGraphBuilder2> _di_ICaptureGraphBuilder2;' }
{$HPPEMIT 'typedef System::DelphiInterface<IVideoWindow> _di_IVideoWindow;' }
{$HPPEMIT 'typedef System::DelphiInterface<IMediaEventEx> _di_IMediaEventEx;' }
{$HPPEMIT 'typedef System::DelphiInterface<IAMDroppedFrames> _di_IAMDroppedFrames;' }
{$HPPEMIT 'typedef System::DelphiInterface<IAMVfwCaptureDialogs> _di_IAMVfwCaptureDialogs;' }
{$HPPEMIT 'typedef System::DelphiInterface<IAMVfwCompressDialogs> _di_IAMVfwCompressDialogs;' }
{$HPPEMIT 'typedef System::DelphiInterface<IAMStreamConfig> _di_IAMStreamConfig;' }
{$HPPEMIT 'typedef System::DelphiInterface<IBaseFilter> _di_IBaseFilter;' }
{$HPPEMIT 'typedef System::DelphiInterface<IFileSinkFilter> _di_IFileSinkFilter;' }
{$HPPEMIT 'typedef System::DelphiInterface<IConfigAviMux> _di_IConfigAviMux;' }
{$HPPEMIT 'typedef System::DelphiInterface<IUnknown> _di_ISampleGrabber; // to use ISampleGrabber include <qedit.h>' }

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, extctrls,
  ActiveX, DicomDirectShow;

// -----------------------------------------------------------------------------
// Windows messages
const
  WM_FGNOTIFY = WM_USER + 1;
  WM_SAMPLECAPTURED = WM_USER + 2;
  WM_SAMPLEPASSED = WM_USER + 3;
  WM_SAMPLEH263COMPRESS = WM_USER + 4;

  // message WM_SAMPLECAPTURED
type
  TWMSampleCaptured = packed record
    Msg: Cardinal;
    GrabberCB: TObject;
    LParam: Longint;
    Result: Longint;
  end;

  // -----------------------------------------------------------------------------
type
  EVideoCaptureError = class(Exception);

type
  TCapturedBitmap = class(TBitmap); // to eliminate some problems with BCB

type
  TBitmapCapturedEvent = procedure(CapturedImage: TCapturedBitmap) of object;
  TBitmapCompressEvent = procedure(AVideoData: PBYTE; ADataSize, AVideoWidth, AVideoHeight: integer)
    of object;

type
  TDVResolution = (dvrDontWorry, dvrFull, dvrHalf, dvrQuater, dvrDC);

  // -----------------------------------------------------------------------------
  // Working with capture modes
type
  TVCapMode = record
    MediaType: TGUID;
    MediaSubType: TGUID;
    Width: integer;
    Height: integer;
    BitCount: integer;
    FrameRate,
      MinFrameRate,
      MaxFrameRate: double;
  end;

type
  TACapMode = record
    MediaType: TGUID;
    MediaSubType: TGUID;
    SampleRate: integer;
    SampleSize: integer;
    Channels: integer;
    AvgSampleRate: integer;
  end;

function IsEqualModes(const mode1, mode2: TVCapMode): boolean; overload;
function IsEqualModes(const mode1, mode2: TACapMode): boolean; overload;

function GetModeString(const mode: TVCapMode): string; overload;
function GetModeString(const mode: TACapMode): string; overload;

// -----------------------------------------------------------------------------
// Various Capture Dialog Types
type
  TCaptureDialog = (
    cdVFORMAT,
    cdVSOURCE,
    cdVDISPLAY,
    cdVCAPTURE,
    cdVCROSSBAR,
    cdTVTUNER,
    cdACAPTURE,
    cdACROSSBAR,
    cdTVAUDIO,
    cdVCAPTURE_PIN,
    cdVPREVIEW_PIN,
    cdACAPTURE_PIN,
    cdVCOMPRESSION,
    cdACOMPRESSION
    );
  TCaptureDialogs = set of TCaptureDialog;

  // -----------------------------------------------------------------------------
  // TVideoCapture component
type

  TGraphConfig = class;

  TDicomVideoCapture = class(TCustomControl)
  private
    Graph: IGraphBuilder;
    Builder: ICaptureGraphBuilder2;
    VideoWindow: IVideoWindow;
    MediaEvent: IMediaEventEx;
    DroppedFrames: IAMDroppedFrames;
    CaptureDialogs: IAMVfwCaptureDialogs;
    CompressDialogs: IAMVfwCompressDialogs;
    AStreamConf: IAMStreamConfig; // for audio capture
    VStreamConf: IAMStreamConfig; // for video capture

    Render: IBaseFilter; // file writer
    VCap, ACap, // capture filters
    VComp, AComp, // compressor filters
    DVSplitter, DVDec: IBaseFilter; // filters to use with DV devices
    Sink: IFileSinkFilter;
    NullRenderer: IBaseFilter;
    ConfigAviMux: IConfigAviMux;
    Grabber: ISampleGrabber;

    GrabberCB: TObject;

    FCCAvail: boolean;
    FCapCC: boolean;
    FGraphBuilt: boolean;

    FACapFriendlyName,
      FVCapFriendlyName: string;

    FCapturing: boolean;
    FPreviewing: boolean;
    FUseFrameRate: boolean;
    FUseTimeLimit: boolean;
    FFrameRate: double;
    FCapStartTime: DWORD;
    FCapStopTime: DWORD;
    FMasterStream: integer;

    FNotDropped: integer;
    FDroppedFrames: integer;
    FNotDroppedBase: integer;
    FDroppedBase: integer;
    FCapTime: DWORD;

    mVideo, mAudio,
      mVComp, mAComp: IMoniker;
    FCaptureTimer: TTimer;

    FDialogs: TCaptureDialogs;
    FDoPreallocFile: boolean;

    FTempCaptureFileName: string;
    FCaptureFileName: string;
    FTimeLimit: integer;
    FUseTempFile: boolean;
    FPreallocFileSize: Cardinal;
    FCaptureFile: WideString;
    FDVResolution: TDVResolution;

    FOnStopPreview: TNotifyEvent;
    FOnStartPreview: TNotifyEvent;
    FOnStopCapture: TNotifyEvent;
    FOnStartCapture: TNotifyEvent;
    FOnChangeDevice: TNotifyEvent;
    FOnCaptureProgress: TNotifyEvent;
    FOnBitmapGrabbed: TBitmapCapturedEvent;

    FOnChangeACapMode: TNotifyEvent;
    FOnChangeVCapMode: TNotifyEvent;
    FOnChangeCompressor: TNotifyEvent;
    FOnFrameRendered: TNotifyEvent;
    FOnDeviceLost: TNotifyEvent;
    FOnAborted: TNotifyEvent;

    FPixelFormat: TPixelFormat;
    FWantPreview: boolean;
    FWantCapture: boolean;
    FWantAudio: boolean;
    FWantDVAudio: boolean;
    FWantBitmaps: boolean;
    FWantAudioPreview: boolean;
    FOnBitmapCompress: TBitmapCompressEvent;

    procedure SetMasterStream(const Value: integer);
    property MasterStream: integer read FMasterStream write SetMasterStream;
    procedure SetFrameRate(const Value: double);
    procedure SetTempCaptureFileName(const Value: string);
    procedure SetCaptureFileName(const Value: string);
    function GetACapMode: TACapMode;
    function GetACapModeCount: integer;
    function GetACapModes(i: integer): TACapMode;
    function GetVCapMode: TVCapMode;
    function GetVCapModeCount: integer;
    function GetVCapModes(i: integer): TVCapMode;
    function GetIsDVSource: boolean;
    procedure SetDVResolution(const Value: TDVResolution);
    function GetACapSource: string;
    function GetVCapSource: string;
    function GetACompDevice: string;
    function GetVCompDevice: string;
    function GetACapSourceIdx: integer;
    function GetACompDeviceIdx: integer;
    function GetVCapSourceIdx: integer;
    function GetVCompDeviceIdx: integer;
    function GetACapModeIdx: integer;
    function GetVCapModeIdx: integer;
    procedure SetOnBitmapCompress(const Value: TBitmapCompressEvent);
  private
    procedure SetSize(var msg: TMessage); message WM_SIZE; // Changing size of cap window
    procedure GraphEvent(var msg: TMessage); message WM_FGNOTIFY;
    procedure BitmapGrabbed(var msg: TWMSampleCaptured); message WM_SAMPLECAPTURED;
    procedure FramePassed(var msg: TMessage); message WM_SAMPLEPASSED;
    procedure BitmapCompressed(var msg: TWMSampleCaptured); message WM_SAMPLEH263COMPRESS;
    // sample passed through SampleGrabber
    procedure CaptureProgress(Sender: TObject);
    procedure ResizeWindow;
    procedure UpdateStatus;
    procedure ChooseDevices(nmVideo, nmAudio: IMoniker; ForceGraphRebuild: boolean = false);
      overload;
    procedure ChooseCompressors(nmVComp, nmAComp: IMoniker; ForceGraphRebuild: boolean = false);
      overload;
    procedure DoAborted(hr: HRESULT);
    procedure DoDeviceLost;

    procedure CleanUp;
    procedure FreeCapFilters;
    function InitCapFilters: boolean;
    function MakeBuilder: boolean;
    function MakeGraph: boolean;
    procedure NukeDownstream(pf: IBaseFilter);
    procedure TearDownGraph;
    function FindVideoWindow: boolean;
    function RenderVideoPreview(const VSource: IBaseFilter): boolean;
    function BuildGraph: boolean;
    function ControlCaptureStream(start: boolean): boolean;

    function AllocCaptureFile(const SizeMb: integer): boolean;
    function SaveCaptureFile(const FileName: string): boolean;
    procedure GetAvailableDialogs;
    function GetActiveCompress: boolean;
    procedure SetActiveCompress(Value: boolean);
  public
    // if someone wants to work with DShow objects
    property CaptureGraph: IGraphBuilder read Graph;
    property VCapFilter: IBaseFilter read VCap;
    property ACapFilter: IBaseFilter read ACap;
    property VCompFilter: IBaseFilter read VComp;
    property ACompFilter: IBaseFilter read AComp;

    property ActiveCompress:Boolean read GetActiveCompress write SetActiveCompress;
    // graph state properties
    property Capturing: boolean read FCapturing; // is capturing now
    property Previewing: boolean read FPreviewing; // is previewing now

    // video capture properties
    property VCapFriendlyName: string read FVCapFriendlyName;
    property VCapName: string read GetVCapSource; // used video capture device name
    property VCapIndex: integer read GetVCapSourceIdx;

    property VCapMode: TVCapMode read GetVCapMode; // current video capture mode
    property VCapModeIdx: integer read GetVCapModeIdx; // current video capture mode index
    property VCapModeCount: integer read GetVCapModeCount; // available video capture mode count
    property VCapModes[i: integer]: TVCapMode read GetVCapModes;
    function SetVCapMode(i: integer): boolean; overload;
    function SetVCapMode(const mode: TVCapMode): boolean; overload;

    // audio capture properties
    property ACapFriendlyName: string read FACapFriendlyName;
    property ACapName: string read GetACapSource; // used audio capture device name
    property ACapIndex: integer read GetACapSourceIdx;

    property ACapMode: TACapMode read GetACapMode; // current audio capture mode
    property ACapModeIdx: integer read GetACapModeIdx; // current audio capture mode index
    property ACapModeCount: integer read GetACapModeCount; // available audio capture mode count
    property ACapModes[i: integer]: TACapMode read GetACapModes;
    function SetACapMode(i: integer): boolean; overload;
    function SetACapMode(const mode: TACapMode): boolean; overload;

    // compressors properties
    property VCompName: string read GetVCompDevice; // used video compressor name
    property VCompIndex: integer read GetVCompDeviceIdx; // used video compressor index
    property ACompName: string read GetACompDevice; // used audio compressor name
    property ACompIndex: integer read GetACompDeviceIdx; // used audio compressor index

    // other properties
    property IsDVSource: boolean read GetIsDVSource; // indicates DV capture source is used
    property Dialogs: TCaptureDialogs read FDialogs; // available graph dialogs
    property FramesDropped: integer read FDroppedFrames;
    property NotDropped: integer read FNotDropped;
    property CapStartTime: DWORD read FCapStartTime;
    property CapStopTime: DWORD read FCapStopTime;
    property CapTime: DWORD read FCapTime;

    procedure ChooseDevices(const szVideo, szAudio: string; ForceGraphRebuild: boolean = false);
      overload;
    procedure ChooseDevices(const numVideo, numAudio: integer; ForceGraphRebuild: boolean = false);
      overload;

    procedure ChooseCompressors(const szVComp, szAComp: string; ForceGraphRebuild: boolean =
      false);
      overload;
    procedure ChooseCompressors(const numVComp, numAComp: integer; ForceGraphRebuild: boolean =
      false); overload;

    function Init: boolean; // you have to call this routine first!!!
    function StartPreview: boolean;
    function StopPreview: boolean;
    function StartCapture(const Dialog: boolean = false): boolean;
    function StopCapture: boolean;
    function CaptureFrame: boolean;

    function ShowDialog(const DialogType: TCaptureDialog): boolean;

    procedure SaveGraph(config: TGraphConfig);
    procedure RestoreGraph(config: TGraphConfig);

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DVResolution: TDVResolution read FDVResolution write SetDVResolution;

    // set to true if you want to capture single frames during preview
    property WantBitmaps: boolean read FWantBitmaps write FWantBitmaps;
    property BitmapPixelFormat: TPixelFormat read FPixelFormat write FPixelFormat;

    property WantAudio: boolean read FWantAudio write FWantAudio;
    // set true if you want audio in captured file
    property WantDVAudio: boolean read FWantDVAudio write FWantDVAudio;
    // set true if you want DV audio in captured file
    property WantAudioPreview: boolean read FWantAudioPreview write FWantAudioPreview;
    // set true if you want render audio preview
    property WantPreview: boolean read FWantPreview write FWantPreview;
    property WantCapture: boolean read FWantCapture write FWantCapture;
    // set to false if dont want capture file is being created
    property UseFrameRate: boolean read FUseFrameRate write FUseFrameRate;
    property FrameRate: double read FFrameRate write SetFrameRate;
    property CaptureFileName: string read FCaptureFileName write SetCaptureFileName;
    property UseTempFile: boolean read FUseTempFile write FUseTempFile;
    property TempCaptureFileName: string read FTempCaptureFileName write SetTempCaptureFileName;
    property UseTimeLimit: boolean read FUseTimeLimit write FUseTimeLimit;
    property TimeLimit: integer read FTimeLimit write FTimeLimit;
    property DoPreallocFile: boolean read FDoPreallocFile write FDoPreallocFile;
    property PreallocFileSize: Cardinal read FPreallocFileSize write FPreallocFileSize default 10;

    property OnAborted: TNotifyEvent read FOnAborted write FOnAborted;
    // if normal graph run has been aborted
    property OnDeviceLost: TNotifyEvent read FOnDeviceLost write FOnDeviceLost; //
    property OnChangeDevice: TNotifyEvent read FOnChangeDevice write FOnChangeDevice;
    property OnChangeCompressor: TNotifyEvent read FOnChangeCompressor write FOnChangeCompressor;
    property OnChangeVCapMode: TNotifyEvent read FOnChangeVCapMode write FOnChangeVCapMode;
    property OnChangeACapMode: TNotifyEvent read FOnChangeACapMode write FOnChangeACapMode;
    property OnCaptureProgress: TNotifyEvent read FOnCaptureProgress write FOnCaptureProgress;
    property OnStopCapture: TNotifyEvent read FOnStopCapture write FOnStopCapture;
    property OnStopPreview: TNotifyEvent read FOnStopPreview write FOnStopPreview;
    property OnStartCapture: TNotifyEvent read FOnStartCapture write FOnStartCapture;
    property OnStartPreview: TNotifyEvent read FOnStartPreview write FOnStartPreview;
    property OnBitmapGrabbed: TBitmapCapturedEvent read FOnBitmapGrabbed write FOnBitmapGrabbed;
    property OnBitmapCompress: TBitmapCompressEvent read FOnBitmapCompress write
      SetOnBitmapCompress;
    property OnFrameRendered: TNotifyEvent read FOnFrameRendered write FOnFrameRendered;
  published
    property Align;
    property Color;
    property Visible;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseDown;
    property OnClick;
    property OnDblClick;
  end;

  TGraphConfig = class
  public
    VCapSource: string;
    ACapSource: string;
    VComp: string;
    AComp: string;
    ACapMode: TACapMode;
    VCapMode: TVCapMode;
    VCompState: string;

    WantCapture: boolean;
    WantPreview: boolean;
    WantBitmaps: boolean;
    WantAudio: boolean;
    WantDVAudio: boolean;
    WantAudioPreview: boolean;

    PixelFormat: TPixelFormat;
    DVResolution: TDVResolution;

    CaptureFileName: string;
    UseTempFile: boolean;
    TempCaptureFileName: string;
    DoPreallocFile: boolean;
    PreallocFileSize: Cardinal;

    procedure Clear;
    procedure RestoreGraph(layout: string);
    function RestoreGraphFromStream(Stream: TStream): boolean;
    function SaveGraph: string;
    function SaveGraphToStream(Stream: TStream): boolean;

    constructor Create;
    destructor Destroy; override;
  end;

  // device enum functions
  // callers have to free aquired lists!!!
function GetVideoDevicesList(const Refresh: boolean = false): TStringList;
function GetAudioDevicesList(const Refresh: boolean = false): TStringList;
function GetVideoCompressorsList(const Refresh: boolean = false): TStringList;
function GetAudioCompressorsList(const Refresh: boolean = false): TStringList;

var
  VIDEO_WIDTH: integer = 160;
  VIDEO_HEIGHT: integer = 120;
  VIDEO_SIZE: integer;
  current_compression: integer = 5;
  keyFrameInterval: integer = 5;
  keyFrameCounter: integer = 0;
  encoderInitialized: Boolean = false;
  initialKeyFrameCounter: integer = 2;

implementation

uses DicomVideoCapStrings, DicomVideoUtils, Dialogs, MMSystem, contnrs, syncobjs
  {$IFDEF CANUSEH263COMPRESS},H263Unit{$ENDIF};

//-----------------------------------------------------------------
//const
//  MAX_TIME: TReference_Time = $7FFFFFFFFFFFFFFF;

// my filter names to find these filters in the graph
const
  VCompFilterName = 'MyVideoCompressor';
  ACompFilterName = 'MyAudioCompressor';
  DVSplitterFilterName = 'MyDVSplitter';
  DVDecoderFilterName = 'MyDVDecoder';
  SmartTeeFilterName = 'MySmartTee';
  InfTeeFilterName = 'MyInfTee';
  SampleGrabberFilterName = 'MyBitmapGrabber';
  NullRendererFilterName = 'MyNullRenderer';

const
  IID_IPropertyBag: TGUID = '{55272A00-42CB-11CE-8135-00AA004BB851}';
  IID_ISpecifyPropertyPages: TGUID = '{B196B28B-BAB4-101A-B69C-00AA00341D07}';

const
  VfwCompressDialog_Config = 1;
  VfwCompressDialog_About = 2;
  // returns S_OK if the dialog exists and can be shown, else S_FALSE
  VfwCompressDialog_QueryConfig = 4;
  VfwCompressDialog_QueryAbout = 8;

const
  AM_FILE_OVERWRITE = 1;

  // DV Modes
const
  DVResolutions: array[TDVResolution] of integer = (
    0,
    DVRESOLUTION_FULL,
    DVRESOLUTION_HALF,
    DVRESOLUTION_QUARTER,
    DVRESOLUTION_DC
    );

type
  TDVRes = record
    DVWidth,
      DVHeight,
      DVBits: integer;
  end;

const
  DVRes: array[DVRESOLUTION_FULL..DVRESOLUTION_DC] of TDVRes = (
    (DVWidth: 720; DVHeight: 576; DVBits: 24), // Full
    (DVWidth: 360; DVHeight: 288; DVBits: 24), // Half
    (DVWidth: 180; DVHeight: 144; DVBits: 24), // quater
    (DVWidth: 88; DVHeight: 72; DVBits: 24) // DC
    );

const
  DVRes1: array[DVRESOLUTION_FULL..DVRESOLUTION_DC] of TDVResolution = (
    dvrFull,
    dvrHalf,
    dvrQuater,
    dvrDC
    );

const
  DVCapModesCount = High(DVRes) - Low(DVRes) + 1;

  // used to install SampleGrabber
const
  PixelFormatGUIDs: array[TPixelFormat] of PGUID = (
    @MEDIASUBTYPE_RGB24,
    @MEDIASUBTYPE_RGB1,
    @MEDIASUBTYPE_RGB4,
    @MEDIASUBTYPE_RGB8,
    @MEDIASUBTYPE_RGB555,
    @MEDIASUBTYPE_RGB565,
    @MEDIASUBTYPE_RGB24,
    @MEDIASUBTYPE_RGB32,
    @MEDIASUBTYPE_RGB24
    );

  //-----------------------------------------------------------------

function MyMsg(szMsg: string; hr: HRESULT): string;
begin
  Result := Format(szMsg, [hr]);
  MessageBox(GetForegroundWindow, PChar(Result), PChar(rsDShowCapture), MB_OK or MB_ICONSTOP);
end;

procedure ErrMsg(szMsg: string; hr: HRESULT = 0);
begin
  MyMsg(szMsg, hr);
end;

procedure ErrMsgException(szMsg: string; hr: HRESULT = 0);
begin
  raise EVideoCaptureError.Create(MyMsg(szMsg, hr));
end;

//-----------------------------------------------------------------

function CheckGUID(const p1, p2: TGUID): boolean;
var
  i: byte;
begin
  Result := false;
  for i := 0 to 7 do
    if p1.D4[i] <> p2.D4[i] then
      Exit;
  Result := (p1.D1 = p2.D1) and (p1.D2 = p2.D2) and (p1.D3 = p2.D3);
end;

// Free an existing media type (ie free resources it holds)

procedure FreeMediaType(mt: TAM_MEDIA_TYPE);
begin
  if mt.cbFormat <> 0 then
  begin
    CoTaskMemFree(mt.pbFormat);
    // Strictly unnecessary but tidier
    mt.cbFormat := 0;
    mt.pbFormat := nil;
  end;
  mt.pUnk := nil;
end;

procedure DeleteMediaType(pmt: PAM_MEDIA_TYPE);
begin
  // allow NULL pointers for coding simplicity
  if pmt <> nil then
  begin
    FreeMediaType(pmt^);
    CoTaskMemFree(pmt);
  end;
end;

//-----------------------------------------------------------------

function IsEqualModes(const mode1, mode2: TVCapMode): boolean;
begin
  Result := CheckGUID(mode1.MediaSubType, mode2.MediaSubType) and
    (mode1.Height = mode2.Height) and
    (mode1.Width = mode2.Width) and
    (mode1.BitCount = mode2.BitCount);
end;

function IsEqualModes(const mode1, mode2: TACapMode): boolean;
begin
  Result := CheckGUID(mode1.MediaSubType, mode2.MediaSubType);
  if Result then
  begin
    if CheckGUID(mode1.MediaSubType, MEDIASUBTYPE_PCM) then
      Result := (mode1.SampleRate = mode2.SampleRate) and
        (mode1.SampleSize = mode2.SampleSize) and
        (mode1.Channels = mode2.Channels)
    else
      Result := (mode1.AvgSampleRate = mode2.AvgSampleRate) and
        (mode1.SampleRate = mode2.SampleRate) and
        (mode1.Channels = mode2.Channels);
  end;
end;

function GetModeString(const mode: TVCapMode): string; overload;
type
  TSubTypeName = record
    SubType: PGUID;
    Name: string;
  end;
const
  MediaSubTypeNames: array[1..13] of TSubTypeName =
  ((SubType: @MEDIASUBTYPE_YVU9; Name: '(YVU9)'),
    (SubType: @MEDIASUBTYPE_Y411; Name: '(Y411)'),
    (SubType: @MEDIASUBTYPE_Y41P; Name: '(Y41P)'),
    (SubType: @MEDIASUBTYPE_YUY2; Name: '(YUY2)'),
    (SubType: @MEDIASUBTYPE_YVYU; Name: '(YVYU)'),
    (SubType: @MEDIASUBTYPE_UYVY; Name: '(UYVY)'),
    (SubType: @MEDIASUBTYPE_Y211; Name: '(Y211)'),
    (SubType: @MEDIASUBTYPE_RGB24; Name: '(RGB24)'),
    (SubType: @MEDIASUBTYPE_RGB32; Name: '(RGB32)'),
    (SubType: @MEDIASUBTYPE_RGB565; Name: '(RGB565)'),
    (SubType: @MEDIASUBTYPE_RGB555; Name: '(RGB555)'),
    (SubType: @MEDIASUBTYPE_ARGB32; Name: '(ARGB32)'),
    (SubType: @MEDIASUBTYPE_RGB565; Name: '(RGB565)'));
var
  i: integer;
begin
  Result := Format('%dx%dx%db', [mode.Width, mode.Height, mode.BitCount]);
  for i := low(MediaSubTypeNames) to high(MediaSubTypeNames) do
    if CheckGUID(mode.MediaSubType, MediaSubTypeNames[i].SubType^) then
    begin
      Result := Result + ' ' + MediaSubTypeNames[i].Name;
      break;
    end;
end;

function GetModeString(const mode: TACapMode): string; overload;
begin
  if CheckGUID(mode.MediaSubType, MEDIASUBTYPE_PCM) then
  begin
    Result := Format('%dHzx%dbx%d', [mode.SampleRate, mode.SampleSize, mode.Channels]);
  end
  else
  begin
    Result := Format('%dkBits/s, %dHz, %d', [mode.AvgSampleRate * 8 div 1000, mode.SampleRate,
      mode.Channels]);
  end;
end;

//-----------------------------------------------------------------
{ TCapDeviceInfo }
type
  TCapDeviceInfo = class
  public
    DeviceName: string;
    DeviceNameInList: string;
    Moniker: IMoniker;
    constructor Create(const aDeviceName, aDeviceNameInList: string; const aMoniker: IMoniker);
    destructor Destroy; override;
  end;

constructor TCapDeviceInfo.Create(const aDeviceName, aDeviceNameInList: string; const aMoniker:
  IMoniker);
begin
  DeviceName := aDeviceName;
  DeviceNameInList := aDeviceNameInList;
  Moniker := aMoniker;
end;

destructor TCapDeviceInfo.Destroy;
begin
  Moniker := nil; // I guess we have to release moniker - tnx to Gabriel Corneanu
  inherited;
end;

//-----------------------------------------------------------------

function GetIntByMoniker(list: TObjectList; aMoniker: IMoniker): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to list.Count - 1 do
    with list[i] as TCapDeviceInfo do
      if aMoniker = Moniker then
      begin
        Result := i;
        break;
      end;
end;

function GetStringByMoniker(list: TObjectList; aMoniker: IMoniker): string;
var
  i: integer;
begin
  Result := '';
  i := GetIntByMoniker(list, aMoniker);
  if (i >= 0) then
    with list[i] as TCapDeviceInfo do
      Result := DeviceNameInList;
end;

function GetMonikerByString(list: TObjectList; aString: string): IMoniker;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to list.Count - 1 do
    with list[i] as TCapDeviceInfo do
      if aString = DeviceNameInList then
      begin
        Result := Moniker;
        break;
      end;
end;

//-----------------------------------------------------------------

function FindDeviceNum(const DeviceName: string; Devices: TObjectList): integer;
var
  i: integer;
  d: TObject;
begin
  Result := 1;
  for i := 0 to Devices.Count - 1 do
  begin
    d := Devices[i];
    if (d is TCapDeviceInfo) and (TCapDeviceInfo(d).DeviceName = DeviceName) then
      Result := Result + 1;
  end;
end;

procedure EnumFilters(const clsidDeviceClass: TGUID; const FiltersList: TObjectList);
var
  SysDevEnum: ICreateDevEnum;
  EnumCat: IEnumMoniker;
  Moniker: IMoniker;
  PropBag: IPropertyBag;
  varName: OleVariant;
  n: integer;
  s: string;
begin
  FiltersList.Clear;
  if (CoCreateInstance(CLSID_SystemDeviceEnum, nil, CLSCTX_INPROC, IID_ICreateDevEnum, SysDevEnum)
    = S_OK) then
  begin
    // enum available video capture devices
    if (SysDevEnum.CreateClassEnumerator(clsidDeviceClass, EnumCat, 0) = S_OK) then
      while EnumCat.Next(1, Moniker, nil) = S_OK do
      begin
        if (Moniker.BindToStorage(nil, nil, IID_IPropertyBag, PropBag) = S_OK) and (PropBag <> nil)
          then
        begin
          PropBag.Read('FriendlyName', varName, nil);
          s := varName;
          if Trim(s) <> '' then
          begin
            n := FindDeviceNum(s, FiltersList);
            if n > 1 then
              s := s + Format(' (%d)', [n]);
            FiltersList.Add(TCapDeviceInfo.Create(varName, s, Moniker));
          end;
        end;
      end;
  end;
end;

//-----------------------------------------------------------------
var
  VideoDevicesList,
    AudioDevicesList,
    VideoCompressorsList,
    AudioCompressorsList: TObjectList;

procedure BuildVideoDevicesList;
begin
  EnumFilters(CLSID_VideoInputDeviceCategory, VideoDevicesList);
end;

procedure BuildAudioDevicesList;
begin
  EnumFilters(CLSID_AudioInputDeviceCategory, AudioDevicesList);
end;

procedure BuildVideoCompressorsList;
begin
  EnumFilters(CLSID_VideoCompressorCategory, VideoCompressorsList);
end;

procedure BuildAudioCompressorsList;
begin
  EnumFilters(CLSID_AudioCompressorCategory, AudioCompressorsList);
end;

procedure BuildDevicesList;
begin
  BuildVideoDevicesList;
  BuildAudioDevicesList;
  BuildVideoCompressorsList;
  BuildAudioCompressorsList;
end;

procedure ClearDevicesList;
begin
  VideoDevicesList.Clear;
  AudioDevicesList.Clear;
  VideoCompressorsList.Clear;
  AudioCompressorsList.Clear;
end;

//-----------------------------------------------------------------
// devices Enum functions

function GetVideoDevicesList(const Refresh: boolean): TStringList;
var
  i: integer;
begin
  if Refresh or (VideoDevicesList.Count = 0) then
    BuildVideoDevicesList;
  Result := TStringList.Create;
  try
    for i := 0 to VideoDevicesList.Count - 1 do
      Result.Add(TCapDeviceInfo(VideoDevicesList[i]).DeviceNameInList);
  except
    Result.Free;
    raise;
  end;
end;

function GetAudioDevicesList(const Refresh: boolean): TStringList;
var
  i: integer;
begin
  if Refresh or (AudioDevicesList.Count = 0) then
    BuildAudioDevicesList;
  Result := TStringList.Create;
  try
    for i := 0 to AudioDevicesList.Count - 1 do
      Result.Add(TCapDeviceInfo(AudioDevicesList[i]).DeviceNameInList);
  except
    Result.Free;
    raise;
  end;
end;

function GetVideoCompressorsList(const Refresh: boolean = false): TStringList;
var
  i: integer;
begin
  if Refresh or (VideoCompressorsList.Count = 0) then
    BuildVideoCompressorsList;
  Result := TStringList.Create;
  try
    for i := 0 to VideoCompressorsList.Count - 1 do
      Result.Add(TCapDeviceInfo(VideoCompressorsList[i]).DeviceNameInList);
  except
    Result.Free;
    raise;
  end;
end;

function GetAudioCompressorsList(const Refresh: boolean = false): TStringList;
var
  i: integer;
begin
  if Refresh or (AudioCompressorsList.Count = 0) then
    BuildAudioCompressorsList;
  Result := TStringList.Create;
  try
    for i := 0 to AudioCompressorsList.Count - 1 do
      Result.Add(TCapDeviceInfo(AudioCompressorsList[i]).DeviceNameInList);
  except
    Result.Free;
    raise;
  end;
end;

//-----------------------------------------------------------------
{ TSampleGrabberCB - ISampleGrabberCB realization}
type
  TSampleGrabberCB = class(TObject, ISampleGrabberCB)
  private
    FBuffer: PByte;
    FBuffLen: Cardinal;
    FOwner: HWND;
    FEnable: boolean;
    FLock: TCriticalSection;

    gcapdib: PByte;
    sendbuf: PByte;
    fsize: Integer;
    FEnableCompress: boolean;
    procedure initializeEncoding(ACompression, AWidth, AHeight: Integer);
    function Get263_InterFrame(Frame: PBYTE): integer;
    function Get263_IntraFrame(Frame: PBYTE): integer;
    function Encoding: bool;
    procedure SetEnableCompress(const Value: boolean);
  public
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    { ISampleGrabberCB }
    function SampleCB(SampleTime: Double; pSample: IMediaSample): HResult; stdcall;
    function BufferCB(SampleTime: Double; pBuffer: PByte; BufferLen: longint): HResult; stdcall;
  public
    property Owner: HWND read FOwner write FOwner;
    property Buffer: PByte read FBuffer;
    property BufferLength: Cardinal read FBuffLen;
    property GrabbingEnabled: boolean read FEnable write FEnable;
    property EnableCompress: boolean read FEnableCompress write SetEnableCompress;

    procedure ClearBuffer;
    // to avoid access to buffer from other thread
    // before accessing to buffer need to disable access to it
    // don't forget to enable access after using buffer data!
    procedure DisableBufferAccess;
    procedure EnableBufferAccess;

    constructor Create;
    destructor Destroy; override;
  end;

  { TSampleGrabberCB }

constructor TSampleGrabberCB.Create;
begin
  sendbuf := nil;
  fSize := 0;

  FEnableCompress := false;
  FBuffer := nil;
  FBuffLen := 0;
  FLock := TCriticalSection.Create;
end;

destructor TSampleGrabberCB.Destroy;
begin
  ClearBuffer;
  FLock.Free;
  inherited;
end;

//Compression level needs to be between 5 and 100

procedure TSampleGrabberCB.initializeEncoding(ACompression, AWidth, AHeight: Integer);
begin
{$IFDEF CANUSEH263COMPRESS}
  encoderInitialized := False;
  //FillChar(sendbuf, SizeOf(sendbuf), #0);
  keyFrameCounter := 0;
  EndEncoder;
  if sendbuf <> nil then
    FreeMem(sendbuf);

  //InitializeVideoArea(compression);
  VIDEO_WIDTH := AWidth;
  VIDEO_HEIGHT := AHeight;
  VIDEO_SIZE := VIDEO_WIDTH * VIDEO_HEIGHT * 3;

  if StartEncoder(ACompression, VIDEO_WIDTH, VIDEO_HEIGHT) = 0 then
  begin
    Exception.Create('Init Decder Error!');
  end;

  GetMem(sendbuf, VIDEO_SIZE);

  encoderInitialized := True;
{$ENDIF}  
end;

function TSampleGrabberCB.Get263_IntraFrame(Frame: PBYTE): integer;
begin
{$IFDEF CANUSEH263COMPRESS}
  Result := Encode(1, gCapDIB, Frame, VIDEO_SIZE);
{$ENDIF}
end;

function TSampleGrabberCB.Get263_InterFrame(Frame: PBYTE): integer;
begin
{$IFDEF CANUSEH263COMPRESS}
  Result := Encode(0, gCapDIB, Frame, VIDEO_SIZE);
{$ENDIF}
end;

function TSampleGrabberCB.Encoding(): bool;
begin
{$IFDEF CANUSEH263COMPRESS}
  Result := true;
  fsize := 0;
  fsize := Get263_IntraFrame(sendbuf);
  exit;
  if ((keyFrameCounter = keyFrameInterval) or (keyFrameCounter <
    initialKeyFrameCounter)) then
  begin
    if keyFrameCounter = keyFrameInterval then
      keyFrameCounter := 0
    else
      keyFrameCounter := keyFrameCounter + 1;
  end
  else
  begin
    fsize := Get263_InterFrame(sendbuf);
    keyFrameCounter := keyFrameCounter + 1;
  end;
{$ENDIF}  
end;

procedure TSampleGrabberCB.DisableBufferAccess;
begin
  FLock.Enter;
end;

procedure TSampleGrabberCB.EnableBufferAccess;
begin
  FLock.Leave;
end;

procedure TSampleGrabberCB.ClearBuffer;
begin
  DisableBufferAccess;
  try
    FBuffLen := 0;
    ReallocMem(FBuffer, FBuffLen);
  finally
    EnableBufferAccess;
  end;
end;

{ TSampleGrabberCB - IUnknown }

function TSampleGrabberCB._AddRef: Integer;
begin
  Result := 2;
end;

function TSampleGrabberCB._Release: Integer;
begin
  Result := 1;
end;

function TSampleGrabberCB.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  // We need to return the two event interfaces when they're asked for
  Result := E_NOINTERFACE;
  if CheckGUID(IID, ISampleGrabberCB) or CheckGUID(IID, IUnknown) then
  begin
    if GetInterface(IID, Obj) then
      Result := S_OK;
  end;
end;

{ TSampleGrabberCB - ISampleGrabberCB }

function TSampleGrabberCB.SampleCB(SampleTime: Double; pSample: IMediaSample): HResult;
begin // not implemented
  Result := S_OK;
end;

function TSampleGrabberCB.BufferCB(SampleTime: Double; pBuffer: PByte; BufferLen: Integer):
  HResult;
begin
  if GrabbingEnabled then
  begin
    // Comment from microsoft programmer below
        // The sample grabber is calling us back on its deliver thread.
        // This is NOT the main app thread!
        //
        //           !!!!! WARNING WARNING WARNING !!!!!
        //
        // On Windows 9x systems, you are not allowed to call most of the
        // Windows API functions in this callback.  Why not?  Because the
        // video renderer might hold the global Win16 lock so that the video
        // surface can be locked while you copy its data.  This is not an
        // issue on Windows 2000, but is a limitation on Win95,98,98SE and ME.
        // Calling a 16-bit legacy function could lock the system, because
        // it would wait forever for the Win16 lock, which would be forever
        // held by the video renderer.
        // As a workaround, we will copy the bitmap data during the callback,
        // post a message to our app, and write the data later.
    GrabbingEnabled := false;
    DisableBufferAccess;
    try
      ReallocMem(FBuffer, BufferLen);
      FBuffLen := BufferLen;
      CopyMemory(FBuffer, pBuffer, BufferLen);
    finally
      EnableBufferAccess;
    end;
    // notify application frame buffer filled
    PostMessage(FOwner, WM_SAMPLECAPTURED, integer(Self), 0);
  end;
{$IFDEF CANUSEH263COMPRESS}
  if FEnableCompress then
  begin
    DisableBufferAccess;
    try
      ReallocMem(sendbuf, BufferLen);
      gcapdib := pBuffer;
      if Encoding() then
      begin

      end;
    finally
      EnableBufferAccess;
    end;
    // notify application frame buffer filled
    PostMessage(FOwner, WM_SAMPLEH263COMPRESS, integer(Self), 0);
  end;
{$ENDIF}
  // notify application that next frame arrived
  PostMessage(FOwner, WM_SAMPLEPASSED, integer(Self), 0);
  Result := S_OK;
end;

//-----------------------------------------------------------------

procedure TSampleGrabberCB.SetEnableCompress(const Value: boolean);
begin
  FEnableCompress := Value;
end;

{ TDicomVideoCapture }

constructor TDicomVideoCapture.Create(AOwner: TComponent);
begin
  inherited;
  CleanUp;
  FUseFrameRate := false;
  FWantAudio := true;
  FWantAudioPreview := true;
  FWantDVAudio := true;
  FWantPreview := true;
  FWantCapture := true;
  FWantBitmaps := true;
  Color := clBlue;
  Width := 100;
  Height := 100;
  FPreallocFileSize := 1;
  FPixelFormat := pf24bit;

  GrabberCB := TSampleGrabberCB.Create;

  FCaptureTimer := TTimer.Create(Self);
  FCaptureTimer.Interval := 100;
  FCaptureTimer.OnTimer := CaptureProgress;
end;

destructor TDicomVideoCapture.Destroy;
begin
  StopPreview;
  StopCapture;
  TearDownGraph;
  CleanUp;

  FCaptureTimer.Enabled := false;
  FCaptureTimer.Free;
  GrabberCB.Free;

  // free resources occupied by lists
  ClearDevicesList;
  inherited;
end;

//-----------------------------------------------------------------

procedure TDicomVideoCapture.ChooseDevices(nmVideo, nmAudio: IMoniker; ForceGraphRebuild: boolean =
  false);
begin
  if (ForceGraphRebuild) or ((mVideo <> nmVideo) or (mAudio <> nmAudio)) then
  begin
    mVideo := nmVideo;
    mAudio := nmAudio;
    TearDownGraph;
    asm //this was added due to corrupted registers after func call (D5 compiler error?)
      push ebx; push edi; push esi
    end;
    InitCapFilters;
    asm
      pop esi; pop edi; pop ebx
    end;

    if BuildGraph and WantPreview then
      StartPreview;
    try
      if Assigned(FOnChangeDevice) then
        FOnChangeDevice(Self);
    except
    end;
  end;
end;

procedure TDicomVideoCapture.ChooseCompressors(nmVComp, nmAComp: IMoniker; ForceGraphRebuild:
  boolean);
begin
  if (ForceGraphRebuild) or ((mVComp <> nmVComp) or (mAComp <> nmAComp)) then
  begin
    mVComp := nil;
    mAComp := nil;
    mVComp := nmVComp;
    mAComp := nmAComp;
    TearDownGraph;
    asm //this was added due to corrupted registers after func call (D5 compiler error?)
      push ebx; push edi; push esi
    end;
    InitCapFilters;
    asm
      pop esi; pop edi; pop ebx
    end;

    if BuildGraph and WantPreview then
      StartPreview;
    try
      if Assigned(FOnChangeCompressor) then
        FOnChangeCompressor(Self);
    except
    end;
  end;
end;

//-----------------------------------------------------------------

procedure TDicomVideoCapture.ChooseDevices(const szVideo, szAudio: string; ForceGraphRebuild:
  boolean = false);
var
  nmVideo, nmAudio: IMoniker;
begin
  nmVideo := nil;
  nmAudio := nil;

  if (VideoDevicesList.Count = 0) then
    BuildVideoDevicesList;
  if (AudioDevicesList.Count = 0) then
    BuildAudioDevicesList;
  nmVideo := GetMonikerByString(VideoDevicesList, szVideo);
  nmAudio := GetMonikerByString(AudioDevicesList, szAudio);

  ChooseDevices(nmVideo, nmAudio, ForceGraphRebuild);
  nmVideo := nil;
  nmAudio := nil;
end;

procedure TDicomVideoCapture.ChooseDevices(const numVideo, numAudio: integer; ForceGraphRebuild:
  boolean = false);
var
  nmVideo, nmAudio: IMoniker;
begin
  nmVideo := nil;
  nmAudio := nil;

  if (numVideo >= 0) and (numVideo < VideoDevicesList.Count) then
    nmVideo := TCapDeviceInfo(VideoDevicesList[numVideo]).Moniker;
  if (numAudio >= 0) and (numAudio < AudioDevicesList.Count) then
    nmAudio := TCapDeviceInfo(AudioDevicesList[numAudio]).Moniker;

  ChooseDevices(nmVideo, nmAudio, ForceGraphRebuild);
  nmVideo := nil;
  nmAudio := nil;
end;

procedure TDicomVideoCapture.ChooseCompressors(const szVComp, szAComp: string; ForceGraphRebuild:
  boolean);
var
  nmVComp, nmAComp: IMoniker;
begin
  nmVComp := nil;
  nmAComp := nil;

  if (VideoCompressorsList.Count = 0) then
    BuildVideoCompressorsList;
  if (AudioCompressorsList.Count = 0) then
    BuildAudioCompressorsList;
  nmVComp := GetMonikerByString(VideoCompressorsList, szVComp);
  nmAComp := GetMonikerByString(AudioCompressorsList, szAComp);

  ChooseCompressors(nmVComp, nmAComp, ForceGraphRebuild);
  nmVComp := nil;
  nmAComp := nil;
end;

procedure TDicomVideoCapture.ChooseCompressors(const numVComp, numAComp: integer;
  ForceGraphRebuild: boolean);
var
  nmVComp, nmAComp: IMoniker;
begin
  nmVComp := nil;
  nmAComp := nil;

  if (numVComp >= 0) and (numVComp < VideoCompressorsList.Count) then
    nmVComp := TCapDeviceInfo(VideoCompressorsList[numVComp]).Moniker;
  if (numAComp >= 0) and (numAComp < AudioCompressorsList.Count) then
    nmAComp := TCapDeviceInfo(AudioCompressorsList[numAComp]).Moniker;

  ChooseCompressors(nmVComp, nmAComp, ForceGraphRebuild);
  nmVComp := nil;
  nmAComp := nil;
end;

//-----------------------------------------------------------------

procedure TDicomVideoCapture.CleanUp;
begin
  FreeCapFilters;

  VideoWindow := nil;
  MediaEvent := nil;
  DroppedFrames := nil;

  Render := nil;
  Sink := nil;
  ConfigAviMux := nil;
  NullRenderer := nil;

  FCCAvail := false;
  FCapCC := false;
  FGraphBuilt := false;
  FCapturing := false;
  FPreviewing := false;
  FMasterStream := -1;
end;

procedure TDicomVideoCapture.FreeCapFilters;
begin
  Graph := nil;
  Builder := nil;
  VCap := nil;
  ACap := nil;
  DVSplitter := nil;
  DVDec := nil;
  VComp := nil;
  AComp := nil;
  AStreamConf := nil;
  VStreamConf := nil;
  CaptureDialogs := nil;
  CompressDialogs := nil;
  Grabber := nil;
  FDialogs := [];
end;

function TDicomVideoCapture.MakeBuilder: boolean;
begin
  Result := (Builder <> nil) or
    (CoCreateInstance(CLSID_CaptureGraphBuilder2, nil, CLSCTX_INPROC,
    IID_ICaptureGraphBuilder2, Builder) = NOERROR);
end;

function TDicomVideoCapture.MakeGraph: boolean;
begin
  Result := (Graph <> nil) or
    (CoCreateInstance(CLSID_FilterGraph, nil, CLSCTX_INPROC,
    IID_IGraphBuilder, Graph) = NOERROR);
end;

function TDicomVideoCapture.Init: boolean;
begin
  // Create the filter graph and create the capture graph builder.
  Result := MakeGraph and MakeBuilder;
  if not Result then
    Exit;

  Builder.SetFiltergraph(Graph);
  BuildDevicesList;
  Result := (VideoDevicesList.Count > 0); // or (AudioDevicesList.Count>0);
end;

function TDicomVideoCapture.InitCapFilters: boolean;
var
  PropBag: IPropertyBag;
  hr: HRESULT;
  varOle: OleVariant;
  Pin: IPin;
  AStream: IBaseFilter;
begin
  FreeCapFilters;

  Result := MakeBuilder;
  if not Result then
  begin
    ErrMsg(rsCantMakeGraphBuilder);
    Exit;
  end;

  DVSplitter := nil;
  DVDec := nil;

  try
    VCap := nil;
    hr := 0;
    if mVideo <> nil then
    begin
      hr := mVideo.BindToStorage(nil, nil, IID_IPropertyBag, PropBag);
      if Succeeded(hr) then
      begin
        if PropBag.Read('FriendlyName', varOle, nil) = NOERROR then
          FVCapFriendlyName := varOle;
        PropBag := nil;
      end;
      hr := mVideo.BindToObject(nil, nil, IID_IBaseFilter, VCap);
    end;
    if VCap = nil then
      ErrMsgException(rsCantCreateVCaptureFilter, hr);

    // make a filtergraph, give it to the graph builder and put the video
    // capture filter in the graph
    if not MakeGraph then
      ErrMsgException(rsCantMakeGraph);

    if Builder.SetFiltergraph(Graph) <> NOERROR then
      ErrMsgException(rsCantSetFilterGraph);

    if Graph.AddFilter(VCap, nil) <> NOERROR then
      ErrMsgException(rsCantAddVFilterToGraph, hr);

    // !!! What if this interface isn't supported?
    // we use this interface to set the frame rate and get the capture size
    hr := Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Interleaved,
      VCap, IID_IAMStreamConfig, VStreamConf);
    if hr <> NOERROR then
    begin
      hr := Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video,
        VCap, IID_IAMStreamConfig, VStreamConf);
      if hr <> NOERROR then // this means we can't set frame rate (non-DV only)
        ErrMsg(rsCantFindVStreamConfig, hr);
    end;

    if IsDVSource then
    begin
      // insert DVSplitter & DVDecoder if they are not exist
      if Failed(Graph.FindFilterByName(DVDecoderFilterName, DVDec)) then
      begin
        if Failed(CoCreateInstance(CLSID_DVVideoCodec, nil, CLSCTX_INPROC, IID_IBaseFilter, DVDec))
          then
        begin
          ErrMsgException(rsCantAddDVDecoder);
        end;
      end;
      if WantAudio and WantDVAudio then
      begin
        if Failed(Graph.FindFilterByName(DVSplitterFilterName, DVSplitter)) then
        begin
          if Failed(CoCreateInstance(CLSID_DVSplitter, nil, CLSCTX_INPROC, IID_IBaseFilter,
            DVSplitter)) then
          begin
            ErrMsgException(rsCantAddDVSplitter);
          end;
        end;
      end;
    end;
    // we use this interface to bring up the 3 dialogs
    // NOTE:  Only the VfW capture filter supports this.  This app only brings
    // up dialogs for legacy VfW capture drivers, since only those have dialogs
    Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video,
      VCap, IID_IAMVfwCaptureDialogs, CaptureDialogs);

    // add video compression filter
    if WantCapture and (VCap <> nil) and (mVComp <> nil) then
    begin
      hr := mVComp.BindToObject(nil, nil, IID_IBaseFilter, VComp);
      if (hr = S_OK) then
      begin
        Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video,
          VComp, IID_IAMVfwCompressDialogs, CompressDialogs)
      end;
    end;

    // there's no point making an audio capture filter
    if WantAudio then
    begin
      // create the audio capture filter, even if we are not capturing audio right
      // now, so we have all the filters around all the time.
      // We want an audio capture filter and some interfaces
      if (DVSplitter = nil) then
      begin // is not DV source
        if (mAudio <> nil) then
        begin
          hr := mAudio.BindToStorage(nil, nil, IID_IPropertyBag, PropBag);
          if Succeeded(hr) then
          begin
            if PropBag.Read('FriendlyName', varOle, nil) = NOERROR then
              FACapFriendlyName := varOle;
            PropBag := nil;
          end;

          ACap := nil;
          mAudio.BindToObject(nil, nil, IID_IBaseFilter, ACap);
          if ACap = nil then
            // there are no audio capture devices. We'll only allow video capture
            ErrMsg(rsCantMakeACapFilter)
          else
          begin
            // put the audio capture filter in the graph
            // We'll need this in the graph to get audio property pages
            if Graph.AddFilter(ACap, nil) <> NOERROR then
              ErrMsgException(rsCantAddAFilterToGraph, hr);
          end;
        end;
        AStream := ACap;
      end
      else
      begin
        AStream := DVSplitter;
      end;

      if (ACap <> nil) or (WantAudio and WantDVAudio) then
      begin
        // add audio compression filter
        if WantCapture and (mAComp <> nil) and Succeeded(mAComp.BindToObject(nil, nil,
          IID_IBaseFilter, AComp)) then
        begin
          AStream := AComp // to control audio stream of AudioCompressor filter
        end;

        // !!! What if this interface isn't supported?
        // we use this interface to set the captured wave format
        hr := Builder.FindInterface(nil, @MEDIATYPE_Audio,
          AStream, IID_IAMStreamConfig, AStreamConf);
        if (hr <> NOERROR) and not (IsDVSource and (AStream = DVSplitter)) then
          ErrMsg(rsCantFindAStreamConfig);
      end;
    end;

    // Can this filter do closed captioning?
    hr := Builder.FindPin(VCap, PINDIR_OUTPUT, PIN_CATEGORY_VBI, TGUID(nil^),
      false, 0, Pin);
    if hr <> S_OK then
      hr := Builder.FindPin(VCap, PINDIR_OUTPUT, PIN_CATEGORY_CC, TGUID(nil^),
        false, 0, Pin);
    FCCAvail := (hr = S_OK); // can't capture it, then
    if FCapCC then
      Pin := nil;

    Result := true;
  except
    FreeCapFilters;
    Result := false;
  end;
end;

procedure TDicomVideoCapture.ResizeWindow;
begin
  if Assigned(VideoWindow) then
    VideoWindow.SetWindowPosition(0, 0, ClientWidth, ClientHeight);
end;

procedure TDicomVideoCapture.SetSize(var msg: TMessage);
begin
  inherited;
  ResizeWindow;
end;

function TDicomVideoCapture.FindVideoWindow: boolean;
begin
  // Get the preview window to be a child of our app's window
  // This will find the IVideoWindow interface on the renderer.  It is
  // important to ask the filtergraph for this interface... do NOT use
  // ICaptureGraphBuilder2::FindInterface, because the filtergraph needs to
  // know we own the window so it can give us display changed messages, etc.
  Result := (Graph.QueryInterface(IID_IVideoWindow, VideoWindow) = S_OK);
  if Result then
  begin
    VideoWindow.put_Owner(Handle); // We own the window now
    VideoWindow.put_WindowStyle(WS_CHILD or WS_CLIPSIBLINGS); // you are now a child
    // give the preview window all our space
    ResizeWindow;
    VideoWindow.put_Visible(true);
  end;
end;

procedure TDicomVideoCapture.DoAborted(hr: HRESULT);
begin
  StopCapture;
  if Assigned(FOnAborted) then
    FOnAborted(Self);
end;

procedure TDicomVideoCapture.DoDeviceLost;
begin
  if Assigned(FOnDeviceLost) then
    FOnDeviceLost(Self);
  StopCapture;
  StopPreview;
end;

// graph event occured - get & process events

procedure TDicomVideoCapture.GraphEvent(var msg: TMessage);
var
  Event, param1, param2: integer;
  wasCapturing, wasPreviewing: boolean;
begin
  wasCapturing := Capturing;
  wasPreviewing := Previewing;
  if (MediaEvent <> nil) then
  begin
    while MediaEvent.GetEvent(Event, param1, param2, 0) = S_OK do
    begin
      try
        //  if you need parameters supplied by GetEvent function - process it here
        //        case Event of
        //        end;
      finally
        MediaEvent.FreeEventParams(Event, param1, param2);
      end;
      case Event of
        EC_ERRORABORT: DoAborted(param1);
        EC_DEVICE_LOST: DoDeviceLost;
      end;
    end;
    // we have stopped capture now need to restore preview
    if ((Capturing <> wasCapturing) or (wasPreviewing <> Previewing)) and (WantPreview) then
    begin
      StartPreview; // it will rebuild graph
    end;
  end;
end;

// we have to build video preview part of graph
// if we want to capture bitmaps need to render stream through grabber filter

function TDicomVideoCapture.RenderVideoPreview(const VSource: IBaseFilter): boolean;
var
  FGrabber: IBaseFilter;
  mt: TAM_Media_Type;
  flt: IBaseFilter;
begin
  flt := VSource;
  if WantBitmaps then
  begin
    Result := Succeeded(Graph.FindFilterByName(SampleGrabberFilterName, FGrabber)) or
      // already exists
    (// have to make new one
      (CoCreateInstance(CLSID_SampleGrabber, nil, CLSCTX_INPROC, IID_IBaseFilter, FGrabber) =
      NOERROR) and
      (Graph.AddFilter(FGrabber, SampleGrabberFilterName) = S_OK)
      );

    Result := Result and (FGrabber.QueryInterface(IID_ISampleGrabber, Grabber) = S_OK);

    if Result then
    begin
      if (FPixelFormat <> pfDevice) then
      begin
        // set prefered bitmap pixel depth
        ZeroMemory(@mt, sizeof(mt));
        mt.formattype := FORMAT_VideoInfo;
        mt.majortype := MEDIATYPE_Video;
        mt.subtype := PixelFormatGUIDs[FPixelFormat]^;
        Grabber.SetMediaType(mt);
      end;

      if Succeeded(Builder.RenderStream(nil, @MEDIATYPE_Video, flt, nil, FGrabber)) then
      begin
        Grabber.SetBufferSamples(false);
        Grabber.SetOneShot(false);
        TSampleGrabberCB(GrabberCB).Owner := Handle;
        Grabber.SetCallback(TSampleGrabberCB(GrabberCB), 1);
        flt := FGrabber;
      end
      else
      begin
        // we cant connect grabber - probably wrong mediatype?
        // TO DO: try to request DecoderOut available mediatypes and
        //        set one of them
        ErrMsg(rsCantInstallSampleGrabber);
      end;

    end;
  end;
  Result := Succeeded(Builder.RenderStream(nil, @MEDIATYPE_Video, flt, nil, nil));
end;

// Tear down everything downstream of a given filter

procedure TDicomVideoCapture.NukeDownstream(pf: IBaseFilter);
var
  pP, pTo: IPin;
  pins: IEnumPins;
  pininfo: TPIN_INFO;
  hr: HRESULT;
begin
  pins := nil;
  hr := pf.EnumPins(pins);
  pins.Reset;
  while hr = NOERROR do
  begin
    hr := pins.Next(1, pP, nil);
    if (hr = S_OK) and (pP <> nil) then
    begin
      pP.ConnectedTo(pTo);
      if pTo <> nil then
      begin
        hr := pTo.QueryPinInfo(pininfo);
        if hr = NOERROR then
        begin
          if pininfo.dir = PINDIR_INPUT then
          begin
            NukeDownstream(pininfo.pFilter);
            Graph.Disconnect(pTo);
            Graph.Disconnect(pP);
            Graph.RemoveFilter(pininfo.pFilter);
          end;
          pininfo.pFilter := nil;
        end;
        pTo := nil;
      end;
      pP := nil;
    end;
  end;
  pins := nil;
end;

// Tear down everything downstream of the capture filters, so we can build
// a different capture graph.  Notice that we never destroy the capture filters
// and WDM filters upstream of them, because then all the capture settings
// we've set would be lost.

procedure TDicomVideoCapture.TearDownGraph;
begin
  if not FGraphBuilt then
    Exit;
  if Capturing then
    StopCapture;
  if Previewing then
    StopPreview;

  if VideoWindow <> nil then
  begin
    // stop drawing in our window, or we may get wierd repaint effects
    VideoWindow.put_Visible(false);
    VideoWindow.put_Owner(0);
  end;
  // free compressors and other filters we used
  VideoWindow := nil;
  Sink := nil;
  NullRenderer := nil;
  ConfigAviMux := nil;
  Render := nil;
  Grabber := nil;
  MediaEvent := nil;
  DroppedFrames := nil;

  // destroy the graph downstream of our capture filters
  if VCap <> nil then
    NukeDownstream(VCap);
  if ACap <> nil then
    NukeDownstream(ACap);

  FGraphBuilt := false;
  if (WantCapture) then
    DeleteFile(TempCaptureFileName);
end;

// build the preview graph!
// !!! PLEASE NOTE !!!  Some new WDM devices have totally separate capture
// and preview settings.  An application that wishes to preview and then
// capture may have to set the preview pin format using IAMStreamConfig on the
// preview pin, and then again on the capture pin to capture with that format.
// In this sample app, there is a separate page to set the settings on the
// capture pin and one for the preview pin.  To avoid the user
// having to enter the same settings in 2 dialog boxes, an app can have its own
// UI for choosing a format (the possible formats can be enumerated using
// IAMStreamConfig) and then the app can programmatically call IAMStreamConfig
// to set the format on both pins.

// build the capture graph!

function TDicomVideoCapture.BuildGraph: boolean;
var
  hr: HRESULT;
  pmt: PAM_MEDIA_TYPE;
  SmartTee: IBaseFilter;
  InfiniteTee: IBaseFilter;
  VSource, ASource: IBaseFilter; // aliases to video/audio sources
  Sink2: IFileSinkFilter2;
begin
  // we have no GraphBuilder((
  Result := Assigned(Graph);
  if not Result then
    Exit;
  // we have one already
  Result := FGraphBuilt;
  if Result then
    Exit;
  // Result = false

  // We don't have necessary capture filters
  if (VCap = nil) then
    Exit;
  if (WantAudio) and ((ACap = nil) and (not (IsDVSource and WantDVAudio))) then
    Exit;

  if (WantCapture) then
  begin
    // no capture file name yet... we need one first
    if UseTempFile then
      FCaptureFile := TempCaptureFileName
    else
      FCaptureFile := CaptureFileName;

    if (FCaptureFile = '') then
    begin
      ErrMsg(rsEmptyFileName);
      Exit;
    end;

    DeleteFile(FCaptureFile);

    if FDoPreallocFile and not AllocCaptureFile(PreallocFileSize) then
    begin
      ErrMsg(rsFailedToAllocFileSize);
      Exit;
    end;
  end;

  try
    VSource := VCap;
    ASource := ACap;

    if IsDVSource then
    begin
      if (DVDec <> nil) then
        Graph.AddFilter(DVDec, DVDecoderFilterName);
      if (DVSplitter <> nil) then
        Graph.AddFilter(DVSplitter, DVSplitterFilterName);
      if (DVDec <> nil) and (Builder.RenderStream(nil, @MEDIATYPE_Interleaved, VCap, DVSplitter,
        DVDec) = S_OK) then
      begin
        SetDVResolution(FDVResolution);
        VSource := DVDec;
        if WantAudio and WantDVAudio then
          ASource := DVSplitter;
      end
      else
        ErrMsgException(rsCantRenderVCaptureStream);
    end;

    // insert Smart Tee Filter
    if Failed(CoCreateInstance(CLSID_SmartTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee)) or
      Failed(Graph.AddFilter(SmartTee, SmartTeeFilterName)) or
      Failed(Builder.RenderStream(nil, @MEDIATYPE_Video, VSource, nil, SmartTee)) then
    begin
      ErrMsgException(rsCantAddSmartTee);
    end;
    VSource := SmartTee;

    // Infinite Tee Filter
    if (ASource <> nil) and (WantAudioPreview) then
    begin
      if Failed(CoCreateInstance(CLSID_InfTee, nil, CLSCTX_INPROC, IID_IBaseFilter, InfiniteTee))
        or
        Failed(Graph.AddFilter(InfiniteTee, InfTeeFilterName)) or
        Failed(Builder.RenderStream(nil, @MEDIATYPE_Audio, ASource, nil, InfiniteTee)) then
      begin
        ErrMsgException(rsCantAddInfTee);
      end;
      ASource := InfiniteTee;
    end;

    // Rendering audio preview stream
    if WantPreview and WantAudioPreview and (ASource <> nil) then
    begin
      if Failed(Builder.RenderStream(nil, @MEDIATYPE_Audio, ASource, nil, nil)) then
        ErrMsgException(rsCantRenderAPreviewStream);
    end;

    if WantCapture then
    begin
      //      if Succeeded(CoCreateInstance(CLSID_NullRenderer, nil, CLSCTX_INPROC, IID_IBaseFilter, NullRenderer)) then begin
      //        Graph.AddFilter(NullRenderer, NullRendererFilterName);
      //      end;
            // We need a rendering section that will write the capture file out in AVI file format
      hr := Builder.SetOutputFileName(MEDIASUBTYPE_Avi, PWCHAR(FCaptureFile), Render, Sink);
      if (hr <> NOERROR) then
        ErrMsgException(rsCantSetCaptureFile);
      if Succeeded(Sink.QueryInterface(IID_IFileSinkFilter2, Sink2)) then
      begin
        // set overwrite mode for file sinker
        Sink2.SetMode(AM_FILE_OVERWRITE);
        Sink2 := nil;
      end;
      // Now tell the AVIMUX to write out AVI files that old apps can read properly.
      // If we don't, most apps won't be able to tell where the keyframes are, slowing down editing considerably
      // Doing this will cause one seek (over the area the index will go) when
      // you capture past 1 Gig, but that's no big deal.
      // NOTE: This is on by default, so it's not necessary to turn it on
      hr := Render.QueryInterface(IID_IConfigAviMux, ConfigAviMux);
      if (hr = NOERROR) and (ConfigAviMux <> nil) then
      begin
        ConfigAviMux.SetOutputCompatibilityIndex(true);
        if (ASource <> nil) then // Also, set the proper MASTER STREAM
          MasterStream := FMasterStream;
      end;

      if (VComp <> nil) then
        Graph.AddFilter(VComp, VCompFilterName);
      hr := Builder.RenderStream(nil, @MEDIATYPE_Video, VSource, VComp, Render);
      if (hr <> NOERROR) then
        ErrMsgException(rsCantRenderVCaptureStream);

      if ASource <> nil then
      begin
        // render audio capture stream
        if (AComp <> nil) then
          Graph.AddFilter(AComp, ACompFilterName);
        hr := Builder.RenderStream(nil, @MEDIATYPE_Audio, ASource, AComp, Render);
        if Failed(hr) then
          ErrMsgException(rsCantRenderACaptureStream);
      end;
    end;

    // Rendering video preview stream
    if WantPreview and not RenderVideoPreview(VSource) then
      ErrMsgException(rsCantRenderPreviewStream);

    // NOTE: We do this even if we didn't ask for a preview, because rendering
    // the capture pin may have rendered the preview pin too (WDM overlay
    // devices) because they must have a preview going.  So we better always
    // put the preview window in our app, or we may get a top level window
    // appearing out of nowhere!
    if not FindVideoWindow and (FWantPreview) then
      ErrMsg(rsThisGraphCantPreview);

    // Render the closed captioning pin? It could be a CC or a VBI category pin,
    // depending on the capture driver
    if (FCCAvail and FCapCC) then
    begin
      hr := Builder.RenderStream(@PIN_CATEGORY_CC, nil, VCap, nil, Render);
      if (hr <> NOERROR) then
      begin
        hr := Builder.RenderStream(@PIN_CATEGORY_VBI, nil, VCap, nil, Render);
        if (hr <> NOERROR) then
          ErrMsg(rsCantRenderCC);
      end;
      // To preview and capture VBI at the same time, we can call this twice
      if (WantPreview) then
        Builder.RenderStream(@PIN_CATEGORY_VBI, nil, VCap, nil, nil);
    end;

    // now tell it what frame rate to capture at.  Just find the format it
    // is capturing with, and leave everything alone but change the frame rate
    if UseFrameRate then
      hr := E_FAIL
    else
      hr := NOERROR;

    if (VStreamConf <> nil) and UseFrameRate then
    begin
      // DV capture does not use a VIDEOINFOHEADER
      if VStreamConf.GetFormat(pmt) = NOERROR then
      begin
        try
          if CheckGuid(pmt^.formattype, FORMAT_VideoInfo) then
          begin
            PVIDEOINFOHEADER(pmt^.pbFormat)^.AvgTimePerFrame := round(10000000 / FrameRate);
            hr := VStreamConf.SetFormat(pmt^);
            if hr <> NOERROR then
              ErrMsg(rsCantSetPreviewFrameRate, hr);
          end;
        finally
          DeleteMediaType(pmt);
        end;
      end;
    end;
    if (hr <> NOERROR) then
      ErrMsg(rsCantSetCaptureFrameRate);

    // now ask the filtergraph to tell us when something is completed or aborted
    // (EC_COMPLETE, EC_USERABORT, EC_ERRORABORT).  This is how we will find out
    // if the disk gets full while capturing
    if (Graph.QueryInterface(IID_IMediaEventEx, MediaEvent) = NOERROR) then
      MediaEvent.SetNotifyWindow(Handle, WM_FGNOTIFY, 0);

    // All done.
    GetAvailableDialogs;
    FGraphBuilt := true;
    Result := true;
  except
    TearDownGraph;
    Result := false;
  end;

end;

function TDicomVideoCapture.GetIsDVSource: boolean;
var
  pmt: PAM_Media_Type;
begin
  Result := false;
  if (VStreamConf <> nil) and (VStreamConf.GetFormat(pmt) = S_OK) then
  try
    Result := CheckGUID(pmt^.majortype, MEDIATYPE_Interleaved);
  finally
    DeleteMediaType(pmt);
  end;
end;

//--------------------------------------------------------------------
// current capture and compressors devices

function TDicomVideoCapture.GetACapSourceIdx: integer;
begin
  Result := GetIntByMoniker(AudioDevicesList, mAudio);
  if Result < 0 then
  begin
    BuildAudioDevicesList;
    Result := GetIntByMoniker(AudioDevicesList, mAudio);
  end;
end;

function TDicomVideoCapture.GetACompDeviceIdx: integer;
begin
  Result := GetIntByMoniker(AudioCompressorsList, mAComp);
  if Result < 0 then
  begin
    BuildAudioCompressorsList;
    Result := GetIntByMoniker(AudioCompressorsList, mAComp);
  end;
end;

function TDicomVideoCapture.GetVCapSourceIdx: integer;
begin
  Result := GetIntByMoniker(VideoDevicesList, mVideo);
  if Result < 0 then
  begin
    BuildVideoDevicesList;
    Result := GetIntByMoniker(VideoDevicesList, mAComp);
  end;
end;

function TDicomVideoCapture.GetVCompDeviceIdx: integer;
begin
  Result := GetIntByMoniker(VideoCompressorsList, mVComp);
  if Result < 0 then
  begin
    BuildVideoCompressorsList;
    Result := GetIntByMoniker(VideoCompressorsList, mAComp);
  end;
end;

function TDicomVideoCapture.GetACapSource: string;
begin
  Result := GetStringByMoniker(AudioDevicesList, mAudio);
  if Result = '' then
  begin
    BuildAudioDevicesList;
    Result := GetStringByMoniker(AudioDevicesList, mAudio);
  end;
end;

function TDicomVideoCapture.GetACompDevice: string;
begin
  Result := GetStringByMoniker(AudioCompressorsList, mAComp);
  if Result = '' then
  begin
    BuildAudioCompressorsList;
    Result := GetStringByMoniker(AudioCompressorsList, mAudio);
  end;
end;

function TDicomVideoCapture.GetVCapSource: string;
begin
  Result := GetStringByMoniker(VideoDevicesList, mVideo);
  if Result = '' then
  begin
    BuildVideoDevicesList;
    Result := GetStringByMoniker(VideoDevicesList, mAudio);
  end;
end;

function TDicomVideoCapture.GetVCompDevice: string;
begin
  Result := GetStringByMoniker(VideoCompressorsList, mVComp);
  if Result = '' then
  begin
    BuildVideoCompressorsList;
    Result := GetStringByMoniker(VideoCompressorsList, mAudio);
  end;
end;

//--------------------------------------------------------------------
// working with avaiable modes of current capture filters

function TDicomVideoCapture.GetACapModeCount: integer;
var
  capCount, capSize: integer;
begin
  Result := 0;
  if (AStreamConf <> nil) and (AStreamConf.GetNumberOfCapabilities(capCount, capSize) = S_OK) then
  begin
    Result := capCount;
  end;
end;

function TDicomVideoCapture.GetACapMode: TACapMode;
var
  pmt: PAM_MEDIA_TYPE;
begin
  ZeroMemory(@Result, SizeOf(Result));
  if (AStreamConf <> nil) and (AStreamConf.GetFormat(pmt) = S_OK) then
  try
    if CheckGUID(pmt^.formattype, FORMAT_WaveFormatEx) then
    begin
      Result.MediaType := pmt^.majortype;
      Result.MediaSubType := pmt^.subtype;
      Result.SampleRate := PWAVEFORMATEX(pmt^.pbFormat)^.nSamplesPerSec;
      Result.SampleSize := PWAVEFORMATEX(pmt^.pbFormat)^.wBitsPerSample;
      Result.Channels := PWAVEFORMATEX(pmt^.pbFormat)^.nChannels;
      Result.AvgSampleRate := PWAVEFORMATEX(pmt^.pbFormat)^.nAvgBytesPerSec;
    end;
  finally
    DeleteMediaType(pmt);
  end;
end;

function TDicomVideoCapture.GetACapModes(i: integer): TACapMode;
var
  pmt: PAM_MEDIA_TYPE;
  aConfig: TAudio_Stream_Config_Caps;
begin
  ZeroMemory(@Result, SizeOf(Result));
  if (i >= 0) and (i < ACapModeCount) and
    (AStreamConf <> nil) and (AStreamConf.GetStreamCaps(i, pmt, aConfig) = S_OK) then
  try
    if CheckGUID(pmt^.formattype, FORMAT_WaveFormatEx) then
    begin
      Result.MediaType := pmt^.majortype;
      Result.MediaSubType := pmt^.subtype;
      Result.SampleRate := PWAVEFORMATEX(pmt^.pbFormat)^.nSamplesPerSec;
      Result.SampleSize := PWAVEFORMATEX(pmt^.pbFormat)^.wBitsPerSample;
      Result.Channels := PWAVEFORMATEX(pmt^.pbFormat)^.nChannels;
      Result.AvgSampleRate := PWAVEFORMATEX(pmt^.pbFormat)^.nAvgBytesPerSec;
    end;
  finally
    DeleteMediaType(pmt);
  end;
end;

function TDicomVideoCapture.SetACapMode(i: integer): boolean;
var
  pmt: PAM_MEDIA_TYPE;
  aConfig: TAudio_Stream_Config_Caps;
  wasPreviewing: boolean;
begin
  Result := false;
  if Capturing then
    Exit;
  wasPreviewing := Previewing;
  if (i >= 0) and (i < ACapModeCount) and
    (AStreamConf <> nil) and (AStreamConf.GetStreamCaps(i, pmt, aConfig) = S_OK) then
  begin
    try
      // we need to stop streaming first and then rerender stream
      StopPreview();
      Result := AStreamConf.SetFormat(pmt^) = S_OK;
    finally
      DeleteMediaType(pmt);
    end;
  end;
  if wasPreviewing then
    StartPreview();
  if Result and Assigned(FOnChangeACapMode) then
    FOnChangeACapMode(Self);
end;

function TDicomVideoCapture.SetACapMode(const mode: TACapMode): boolean;
var
  i, capCount: integer;
begin
  Result := IsEqualModes(mode, ACapMode);
  if not Result then
  begin
    capCount := ACapModeCount;
    for i := 0 to capCount - 1 do
      if IsEqualModes(mode, ACapModes[i]) then
      begin
        Result := SetACapMode(i);
        break;
      end;
  end;
end;

function TDicomVideoCapture.GetVCapModeCount: integer;
var
  capCount, capSize: integer;
begin
  Result := 0;
  if not IsDVSource then
  begin
    if (VStreamConf <> nil) and (VStreamConf.GetNumberOfCapabilities(capCount, capSize) = S_OK)
      then
    begin
      Result := capCount;
    end;
  end
  else
  begin
    Result := DVCapModesCount;
  end;
end;

function TDicomVideoCapture.GetVCapMode: TVCapMode;
var
  pmt: PAM_MEDIA_TYPE;
  DVDecProp: IIPDVDec;
  _DVRes: integer;
begin
  ZeroMemory(@Result, SizeOf(Result));
  if not IsDVSource then
  begin
    if (VStreamConf <> nil) and (VStreamConf.GetFormat(pmt) = S_OK) then
    try
      Result.MediaType := pmt^.majortype;
      Result.MediaSubType := pmt^.subtype;
      if CheckGUID(pmt^.formattype, FORMAT_VideoInfo) then
      begin
        Result.Width := ABS(PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biWidth);
        Result.Height := ABS(PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biHeight);
        Result.BitCount := PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biBitCount;
      end
      else
        if CheckGUID(pmt^.formattype, FORMAT_VideoInfo2) then
      begin
        Result.Width := ABS(PVIDEOINFOHEADER2(pmt^.pbFormat)^.bmiHeader.biWidth);
        Result.Height := ABS(PVIDEOINFOHEADER2(pmt^.pbFormat)^.bmiHeader.biHeight);
        Result.BitCount := PVIDEOINFOHEADER2(pmt^.pbFormat)^.bmiHeader.biBitCount;
      end
    finally
      DeleteMediaType(pmt);
    end;
  end
  else
  begin
    if Graph = nil then
      Exit;
    // get DV window size
    if (DVDec <> nil) and
      (DVDec.QueryInterface(IIPDVDec, DVDecProp) = S_OK) and
      (DVDecProp.get_IPDisplay(_DVRes) = S_OK) and
      (_DVRes >= Low(DVRes)) and (_DVRes <= High(DVRes)) then
      with DVRes[_DVRes] do
      begin
        Result.Width := DVWidth;
        Result.Height := DVHeight;
        Result.BitCount := DVBits;
      end;
  end;
end;

function TDicomVideoCapture.GetVCapModes(i: integer): TVCapMode;
var
  pmt: PAM_MEDIA_TYPE;
  vConfig: TVideo_Stream_Config_Caps;
begin
  ZeroMemory(@Result, SizeOf(Result));
  if not IsDVSource then
  begin
    if (i >= 0) and (i < VCapModeCount) and
      (VStreamConf <> nil) and (VStreamConf.GetStreamCaps(i, pmt, vConfig) = S_OK) then
    begin
      try
        Result.MediaType := pmt^.majortype;
        Result.MediaSubType := pmt^.subtype;
        if CheckGUID(pmt^.formattype, FORMAT_VideoInfo) then
        begin
          Result.Width := ABS(PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biWidth);
          Result.Height := ABS(PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biHeight);
          Result.BitCount := PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biBitCount;
        end
        else
          if CheckGUID(pmt^.formattype, FORMAT_VideoInfo2) then
        begin
          Result.Width := ABS(PVIDEOINFOHEADER2(pmt^.pbFormat)^.bmiHeader.biWidth);
          Result.Height := ABS(PVIDEOINFOHEADER2(pmt^.pbFormat)^.bmiHeader.biHeight);
          Result.BitCount := PVIDEOINFOHEADER2(pmt^.pbFormat)^.bmiHeader.biBitCount;
        end;
        if (PVIDEOINFOHEADER(pmt^.pbFormat)^.AvgTimePerFrame > 0) then
          Result.FrameRate := 10000000 / PVIDEOINFOHEADER(pmt^.pbFormat)^.AvgTimePerFrame; //??
      finally
        DeleteMediaType(pmt);
      end;
      if (vConfig.MaxFrameInterval > 0) then
        Result.MinFrameRate := 10000000 / vConfig.MaxFrameInterval; //??
      if (vConfig.MinFrameInterval > 0) then
        Result.MaxFrameRate := 10000000 / vConfig.MinFrameInterval; //??
    end;
  end
  else
  begin
    with DVRes[i + Low(DVRes)] do
    begin
      Result.Width := DVWidth;
      Result.Height := DVHeight;
      Result.BitCount := DVBits;
    end;
  end;
end;

function TDicomVideoCapture.SetVCapMode(i: integer): boolean;
var
  pmt: PAM_MEDIA_TYPE;
  vConfig: TVideo_Stream_Config_Caps;
  //  wasPreviewing: boolean;
  //  GraphWasBuilt: boolean;
begin
  Result := false;
  if Capturing then
    Exit; // dont let change format during capture
  //  wasPreviewing:= Previewing;
  //  GraphWasBuilt:= FGraphBuilt;
  TearDownGraph;
  if not IsDVSource then
  begin
    if (i >= 0) and (i < VCapModeCount) and
      (VStreamConf <> nil) and (VStreamConf.GetStreamCaps(i, pmt, vConfig) = S_OK) then
    begin
      try
        // we need to stop streaming first and then rerender stream
        Result := VStreamConf.SetFormat(pmt^) = S_OK;
      finally
        DeleteMediaType(pmt);
      end;
    end;
  end
  else
  begin
    // set DV window size
    FDVResolution := DVRes1[i + DVRESOLUTION_FULL];
  end;
  if Result and Assigned(FOnChangeVCapMode) then
    FOnChangeVCapMode(Self);
  //  if GraphWasBuilt and BuildGraph then begin
  //    if wasPreviewing then StartPreview;
  //  end;
end;

function TDicomVideoCapture.SetVCapMode(const mode: TVCapMode): boolean;
var
  i, capCount: integer;
begin
  Result := IsEqualModes(mode, VCapMode);
  if not Result then
  begin
    capCount := VCapModeCount;
    for i := 0 to capCount - 1 do
      if IsEqualModes(mode, VCapModes[i]) then
      begin
        Result := SetVCapMode(i);
        break;
      end;
  end;
end;

function TDicomVideoCapture.GetACapModeIdx: integer;
var
  curMode: TACapMode;
  i, capCount: integer;
begin
  Result := -1;
  curMode := ACapMode;
  capCount := ACapModeCount;
  for i := 0 to capCount - 1 do
    if IsEqualModes(curMode, ACapModes[i]) then
    begin
      Result := i;
      break;
    end;
end;

function TDicomVideoCapture.GetVCapModeIdx: integer;
var
  curMode: TVCapMode;
  i, capCount: integer;
begin
  Result := -1;
  curMode := VCapMode;
  capCount := VCapModeCount;
  for i := 0 to capCount - 1 do
    if IsEqualModes(curMode, VCapModes[i]) then
    begin
      Result := i;
      break;
    end;
end;

procedure TDicomVideoCapture.SetDVResolution(const Value: TDVResolution);
var
  DVDecProp: IIPDVDec;
  //  wasPreviewing: boolean;
  //  wasGraphBuilt: boolean;
begin
  if Capturing then
    Exit;
  FDVResolution := Value;
  if Graph = nil then
    Exit;
  if IsDVSource and (Value <> dvrDontWorry) then
  begin
    //    wasGraphBuilt:= FGraphBuilt;
    //    wasPreviewing:= Previewing;
    TearDownGraph;
    // set DV window size
    if (DVDec <> nil) and (DVDec.QueryInterface(IIPDVDec, DVDecProp) = S_OK) then
    begin
      DVDecProp.put_IPDisplay(DVResolutions[Value]);
    end;
    //    if wasGraphBuilt then begin
    //      if BuildGraph and wasPreviewing then StartPreview;
    //   end;
  end;
end;

//--------------------------------------------------------------------

procedure TDicomVideoCapture.SetMasterStream(const Value: integer);
begin
  if (ConfigAviMux <> nil) and (ConfigAviMux.SetMasterStream(Value) = NOERROR) then
    FMasterStream := Value
  else
    ErrMsg(rsSetMasterStreamFailed);
end;

// Single frame captured. Called in main application thread.

procedure TDicomVideoCapture.BitmapGrabbed(var msg: TWMSampleCaptured);
var
  MediaType: TAM_Media_Type;
  bih: TBitmapInfoHeader;
  BitmapInfo: TBITMAPINFO;
  w, h: integer;
  usage: cardinal;
  CapturedImage: TCapturedBitmap;
  SampleGrabberCB: TSampleGrabberCB;
  BitmapMade: boolean;
begin
  try
    // process only own grabber messages
    if (not (msg.GrabberCB is TSampleGrabberCB)) or (msg.GrabberCB <> GrabberCB) then
      Exit;
    SampleGrabberCB := TSampleGrabberCB(msg.GrabberCB);
    if (Grabber.GetConnectedMediaType(MediaType) = S_OK) then
    begin
      try
        // Get a pointer to the video header.
        if CheckGUID(MediaType.FormatType, FORMAT_VideoInfo) then
          bih := PVideoInfoHeader(mediatype.pbFormat)^.bmiHeader
        else
          if CheckGUID(MediaType.FormatType, FORMAT_VideoInfo2) then
          bih := PVideoInfoHeader2(mediatype.pbFormat)^.bmiHeader
        else
          Abort;
        // The video header contains the bitmap information.
        // Copy it into a BITMAPINFO structure.
        ZeroMemory(@BitmapInfo, sizeof(BitmapInfo));
        Move(bih, BitmapInfo.bmiHeader, sizeof(bih));
      finally
        FreeMediaType(MediaType);
      end;
      // Copy the image into the buffer.
      w := BitmapInfo.bmiHeader.biWidth;
      h := BitmapInfo.bmiHeader.biHeight;
      CapturedImage := TCapturedBitmap.Create;
      try
        case BitmapInfo.bmiHeader.biBitCount of
          1: CapturedImage.PixelFormat := pf1bit;
          4: CapturedImage.PixelFormat := pf4bit;
          8: CapturedImage.PixelFormat := pf8bit;
          15: CapturedImage.PixelFormat := pf15bit;
          16: CapturedImage.PixelFormat := pf16bit;
          24: CapturedImage.PixelFormat := pf24bit;
          32: CapturedImage.PixelFormat := pf32bit;
        else
          // strange color depth - let bitmap be unchanged
        end;
        CapturedImage.Width := w; // enlarge image to ensure the whole DIB gets copied
        CapturedImage.Height := h;

        if (BitmapInfo.bmiHeader.biClrUsed = 0) then
          usage := DIB_RGB_COLORS // BITMAP contains real color values
        else
          usage := DIB_PAL_COLORS; // BITMAP uses pallete

        if (SampleGrabberCB.BufferLength > 0) then
        begin
          SampleGrabberCB.DisableBufferAccess; // to avoid simultaneous access to buffer
          try
            BitmapMade := StretchDIBits(CapturedImage.Canvas.Handle, // handle of device context
              0, 0, w, h, // destination rectangle
              0, 0, w, h, // source rectangle
              SampleGrabberCB.Buffer, // address of bitmap bits
              BitmapInfo, // address of bitmap data
              usage, SRCCOPY) <> 0;
          finally
            SampleGrabberCB.EnableBufferAccess;
          end;
          if BitmapMade and Assigned(FOnBitmapGrabbed) then
            FOnBitmapGrabbed(CapturedImage);
        end;
      finally
        CapturedImage.Free;
      end;
      // SampleGrabberCB.ClearBuffer; // don't do it to avoid reallocating buffer next time
    end;
  except
  end;
end;

function TDicomVideoCapture.CaptureFrame: boolean;
begin
  Result := (Grabber <> nil) and FWantBitmaps and (Previewing or Capturing);
  TSampleGrabberCB(GrabberCB).GrabbingEnabled := Result;
end;

procedure TDicomVideoCapture.FramePassed(var msg: TMessage);
begin
  if Assigned(FOnFrameRendered) then
    FOnFrameRendered(Self);
end;

//--------------------------------------------------------------------

function ControlPin(pin: IPin; start: bool; const SendExtraFrame: bool = false): boolean;
var
  CapCtrl: IAMStreamControl;
begin
  Result := false;
  if Succeeded(pin.QueryInterface(IID_IAMStreamControl, CapCtrl)) then
  begin
    if start then
      Result := Succeeded(CapCtrl.StartAt(nil, 0))
    else
      Result := Succeeded(CapCtrl.StopAt(nil, SendExtraFrame, 0));
  end;
  //  Graph.Reconnect(pin);
end;

function ControlFilter(Filter: IBaseFilter; start: bool): boolean;
var
  pins: IEnumPins;
  pin: IPin;
  pd: TPin_Direction;
begin
  Result := false;
  if (Filter = nil) or Failed(Filter.EnumPins(pins)) then
    Exit;
  if pins = nil then
    Exit;
  pins.Reset;
  while true do
  begin
    if (pins.Next(1, pin, nil) <> S_OK) then
      break;
    // stopping every pin having IAMStreamControl interface
    if Succeeded(pin.QueryDirection(pd)) and (pd = PINDIR_INPUT) then
    begin
      Result := ControlPin(pin, start);
    end;
  end;
end;

function TDicomVideoCapture.ControlCaptureStream(start: boolean): boolean;
var
  pin: IPin;
  flt: IBaseFilter;
begin
  Result := false;
  {
    flt:= nil;
    if start then
      Sink.QueryInterface(IID_IBaseFilter, flt)
    else
      flt:= NullRenderer;

    if flt=nil then Exit;
    if Succeeded(Builder.FindPin(Render, PINDIR_OUTPUT, TGUID(nil^), TGUID(nil^), false, 0, pin)) then begin
      if Succeeded(pin.QueryInterface(IID_IPinFlowControl, pfc)) then begin
        if Succeeded(Graph.QueryInterface(IID_IGraphConfig, Config)) then begin
          pfc.Block(AM_PIN_FLOW_CONTROL_BLOCK, 0); // Block the data flow.
          // Reconfigure the graph.
          Result:= Succeeded( Config.Reconnect( pin, nil, nil, flt, 0, 0));
          pfc.Block(0, 0);   // Unblock the data flow.
        end;
      end;
    end;
  }
  if Graph = nil then
    Exit;
  // control multiplexer
  Result := ControlFilter(Render, start);
  // have to control smart tee capture pin
  // cause some compressors dont let to run stream after stopping MUX input(((((
  if Succeeded(Graph.FindFilterByName(SmartTeeFilterName, flt)) then
  begin
    // microsoft: capture is always output pin 0, and preview is output pin 1.
    if Succeeded(Builder.FindPin(flt, PINDIR_OUTPUT, TGUID(nil^), TGUID(nil^), false, 0, pin)) then
    begin
      // DX SDK: In addition, you should specify TRUE for the bSendExtra parameter
      //         on the capture pin, and specify FALSE to the multiplexer pin.
      ControlPin(pin, start, true);
    end;
  end;
end;

function TDicomVideoCapture.StartPreview: boolean;
var
  MC: IMediaControl;
  hr: HRESULT;
begin
  TSampleGrabberCB(GrabberCB).initializeEncoding(5, VCapMode.Width, VCapMode.Height);

  // way ahead of you
  Result := Assigned(Graph) and Previewing;
  if Result or (not BuildGraph) then
    Exit;
  // Result = false
  // stop capture streams
  if WantCapture then
    ControlCaptureStream(false); // stop capture part of graph

  // run the graph
  hr := Graph.QueryInterface(IID_IMediaControl, MC);
  if Succeeded(hr) then
  begin
    hr := MC.Run;
    if Failed(hr) then
      MC.Stop; // stop parts that ran
  end;
  if Failed(hr) then
  begin
    ErrMsg(rsCantRunPreviewGraph, hr);
    Exit;
  end;
  FPreviewing := true;
  Result := true;
  if Assigned(FOnStartPreview) then
    FOnStartPreview(Self);
end;

function TDicomVideoCapture.StopPreview: boolean;
var
  MC: IMediaControl;
  hr: HRESULT;
begin
  Result := false; // way ahead of you
  if not Previewing then
    Exit;
  // stop the graph
  if Graph <> nil then
  begin
    hr := Graph.QueryInterface(IID_IMediaControl, MC);
    if Succeeded(hr) then
      hr := MC.Stop;
    if Failed(hr) then
    begin
      ErrMsg(rsCantStopPreviewGraph, hr);
      Exit;
    end;
  end;
  Invalidate; // !!! get rid of garbage
  if Assigned(FOnStopPreview) then
    FOnStopPreview(Self);
  FPreviewing := false;
  Result := true;
end;

// capture AVI

function TDicomVideoCapture.StartCapture(const Dialog: boolean): boolean;
var
  FHasStreamControl: boolean;
  hr: HRESULT;
  MC: IMediaControl;
begin
  // way ahead of you
  Result := false;
  if not WantCapture then
    Exit;

  Result := Capturing;
  if Result then
    Exit;
  FCaptureTimer.Enabled := false;

  // or we'll crash
  Result := false;
  if not BuildGraph then
    Exit;

  // This amount will be subtracted from the number of dropped and not
  // dropped frames reported by the filter.  Since we might be having the
  // filter running while the pin is turned off, we don't want any of the
  // frame statistics from the time the pin is off interfering with the
  // statistics we gather while the pin is on
  FDroppedFrames := 0;
  FNotDropped := 0;

  FHasStreamControl := ControlCaptureStream(false); // stop capture part of graph

  // prepare to run the graph
  MC := nil;
  hr := Graph.QueryInterface(IID_IMediaControl, MC);
  if (Failed(hr)) then
  begin
    ErrMsg(rsCantGetMediaControl, hr);
    Result := false;
    Exit;
  end;

  try
    // If we were able to keep capture off, then we can
    // run the graph now for frame accurate start later yet still showing a
    // preview. Otherwise, we can't run the graph yet without capture
    // starting too, so we'll pause it so the latency between when they
    // press a key and when capture begins is still small (but they won't have
    // a preview while they wait to press a key)
    if (FHasStreamControl) then
      hr := MC.Run()
    else
      hr := MC.Pause();

    if (Failed(hr)) then // stop parts that started
      ErrMsgException(rsCantRunGraph, hr);

    FPreviewing := false;
    // press a key to start capture
    // 06.11.2012 FOMIN
  {  if (Dialog and (MessageDlg(rsStartCapture, mtConfirmation, [mbYes, mbCancel], 0) <> mrYes))
      then
    begin
      MC.Stop(); // !!! tnx to Gabriel Corneanu
      if WantPreview then
        StartPreview;
    end
    else }
    // 06.11.2012 FOMIN
    if True then
    // END 06.11.2012 FOMIN
    begin
      // Start capture NOW!
      if (FHasStreamControl) then
      begin
        // we may not have this yet
        if (DroppedFrames = nil) then
        begin
          hr := Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Interleaved,
            VCap, IID_IAMDroppedFrames, DroppedFrames);
          if (hr <> NOERROR) then
            Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video,
              VCap, IID_IAMDroppedFrames, DroppedFrames);
        end;
        // turn the capture pins on now!
        ControlCaptureStream(true); // run capture part of graph
        // make note of the current dropped frame counts
        if (DroppedFrames <> nil) then
        begin
          DroppedFrames.GetNumDropped(FDroppedBase);
          DroppedFrames.GetNumNotDropped(FNotDroppedBase);
        end;
      end
      else
      begin
        hr := MC.Run();
        if (Failed(hr)) then // stop parts that started
          ErrMsgException(rsCantRunGraph, hr);
      end;

      // when did we start capture?
      FCapStartTime := timeGetTime();
      FCaptureTimer.Enabled := true;
      FCapturing := true;
      Result := true;
      try
        if Assigned(FOnStartCapture) then
          FOnStartCapture(Self);
      except
      end;
    end;
  except
    MC.Stop();
    Result := false;
  end
end;

function TDicomVideoCapture.StopCapture: boolean;
var
  MC: IMediaControl;
  hr: HRESULT;
begin
  // way ahead of you
  Result := false;
  if (not Capturing) then
    Exit;

  FCaptureTimer.Enabled := false;

  if Graph = nil then
    Exit;
  // stop the graph
  hr := Graph.QueryInterface(IID_IMediaControl, MC);
  if (Succeeded(hr)) then
  begin
    hr := MC.Stop();
    MC := nil;
  end;
  if (Failed(hr)) then
  begin
    ErrMsg(rsCantStopGraph, hr);
    Exit;
  end;

  // when the graph was stopped
  FCapStopTime := timeGetTime();
  FCapturing := false;
  FPreviewing := false;

  // FOMIN 15.11.2012
    MoveFile(PChar(TempCaptureFileName),PChar('capture.avi'));
 { if UseTempFile and SaveCaptureFile(CaptureFileName) then
    DeleteFile(TempCaptureFileName);
  }
  // one last time for the final count and all the stats
  try
    if Assigned(FOnCaptureProgress) then
      FOnCaptureProgress(Self);
  except
  end;
  // !!! get rid of garbage
  Invalidate;

  if Assigned(FOnStopCapture) then
    FOnStopCapture(Self);

  if WantPreview then
    StartPreview;

  Result := true;
end;

//--------------------------------------------------------------------

procedure TDicomVideoCapture.CaptureProgress(Sender: TObject);
begin
  FCapTime := timeGetTime() - FCapStartTime;
  UpdateStatus;
  if Capturing then
    if (UseTimeLimit) and (FCapTime div 1000 >= DWORD(TimeLimit)) then
    begin
      // time is up!!!
      StopCapture;
      if WantPreview then
        StartPreview;
    end
    else
      if Assigned(FOnCaptureProgress) then
      FOnCaptureProgress(Self);
end;

procedure TDicomVideoCapture.UpdateStatus;
begin
  // this filter can't tell us dropped frame info.
  if (DroppedFrames <> nil) and FCapturing then
  begin
    if (DroppedFrames.GetNumDropped(FDroppedFrames) = S_OK) and
      (DroppedFrames.GetNumNotDropped(FNotDropped) = S_OK) then
    begin
      FDroppedFrames := FDroppedFrames - FDroppedBase;
      FNotDropped := FNotDropped - FNotDroppedBase;
    end;
    {
        // we want all possible stats, including capture time and actual acheived
        // frame rate and data rate (as opposed to what we tried to get).  These
        // numbers are an indication that though we dropped frames just now, if we
        // chose a data rate and frame rate equal to the numbers I'm about to
        // print, we probably wouldn't drop any frames.
        // average size of frame captured
        if (DroppedFrames.GetAverageFrameSize(&lAvgFrameSize) = S_OK) then begin
        end;
    }
  end;
end;

procedure TDicomVideoCapture.SetFrameRate(const Value: double);
const
  DefaultFrameRate = 25;
begin
  if (Value < 1) or (Value > 50) then
    FFrameRate := DefaultFrameRate
  else
    FFrameRate := Value;
end;

procedure TDicomVideoCapture.SetTempCaptureFileName(const Value: string);
begin
  FTempCaptureFileName := Value;
  if (Sink <> nil) then
  begin
    Sink.SetFileName(PWCHAR(WideString(FTempCaptureFileName)), nil);
  end;
end;

function TDicomVideoCapture.AllocCaptureFile(const SizeMb: integer): boolean;
begin
  Result := MakeBuilder and (Builder.AllocCapFile(PWCHAR(FCaptureFile),
    SizeMb * 1024 * 1024) = NOERROR);
end;

function TDicomVideoCapture.SaveCaptureFile(const FileName: string): boolean;
var
  tempBuilder: ICaptureGraphBuilder2;
begin
  Result := FCaptureFile <> '';
  if Result then
  try
    // we need our own graph builder because the main one might not exist
    Result := (CoCreateInstance(CLSID_CaptureGraphBuilder2, nil, CLSCTX_INPROC,
      IID_ICaptureGraphBuilder2, tempBuilder) = NOERROR);
    if (Result) then
    try
      // allow the user to press ESC to abort... don't ask for progress
      Result := tempBuilder.CopyCaptureFile(PWCHAR(FCaptureFile),
        PWCHAR(WideString(FileName)),
        -1, nil) = S_OK;
    finally
      tempBuilder := nil;
    end;
  except
    Result := false;
  end;
end;

procedure TDicomVideoCapture.SetCaptureFileName(const Value: string);
begin
  FCaptureFileName := Value;
end;

procedure TDicomVideoCapture.GetAvailableDialogs;
type
  chars = array[0..32767] of Char;
var
  Spec: ISpecifyPropertyPages;
  StreamConf: IAMStreamConfig;
  auuid: CAUUID;
  hr: HRESULT;
  TVTuner: IAMTVTuner;
  TVAudio: IAMTVAudio;
  i: integer;
  p: ^chars;
begin
  FDialogs := [];
  if CaptureDialogs <> nil then
  begin
    // If this device supports the old legacy UI dialogs, offer them
    if CaptureDialogs.HasDialog(VfwCaptureDialog_Format) = S_OK then
    begin
      FDialogs := FDialogs + [cdVFORMAT];
    end;
    if CaptureDialogs.HasDialog(VfwCaptureDialog_Source) = S_OK then
    begin
      FDialogs := FDialogs + [cdVSOURCE];
    end;
    if CaptureDialogs.HasDialog(VfwCaptureDialog_Display) = S_OK then
    begin
      FDialogs := FDialogs + [cdVDISPLAY];
    end;
  end;

  // Also check the audio capture filter at this point, since even non wdm devices
  // may support an IAMAudioInputMixer property page (we'll also get any wdm filter
  // properties here as well). We'll get any audio capture pin property pages just
  // a bit later.
  if (ACap <> nil) and (ACap.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK) then
  begin
    if (Spec.GetPages(auuid) = S_OK) and (auuid.cElems > 0) then
    begin
      FDialogs := FDialogs + [cdACAPTURE];
      CoTaskMemFree(auuid.pElems);
    end;
    Spec := nil;
  end;

  if (VComp <> nil) and (VComp.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK) then
  begin
    if (Spec.GetPages(auuid) = S_OK) and (auuid.cElems > 0) then
    begin
      FDialogs := FDialogs + [cdVCOMPRESSION];
      CoTaskMemFree(auuid.pElems);
    end;
    Spec := nil;
  end
  else
  begin
    if (CompressDialogs <> nil) and
      (CompressDialogs.ShowDialog(VfwCompressDialog_QueryConfig, Handle) = S_OK) then
    begin
      FDialogs := FDialogs + [cdVCOMPRESSION];
      i := 0;
      if Succeeded(CompressDialogs.GetState(nil^, i)) then
      begin
        GetMem(p, i);
        CompressDialogs.GetState(p^, i);
        FreeMem(p);
      end;
    end;
  end;

  // don't bother looking for new property pages if the old ones are supported
  // or if we don't have a capture filter
  if (VCap = nil) or (cdVFORMAT in FDialogs) then
    Exit;

  // New WDM devices support new UI and new interfaces.
  // Your app can use some default property
  // pages for UI if you'd like (like we do here) or if you don't like our
  // dialog boxes, feel free to make your own and programmatically set
  // the capture options through interfaces like IAMCrossbar, IAMCameraControl
  // etc.
  // There are 9 objects that might support property pages.  Let's go through
  // them.
  // 1. the video capture filter itself

  if (VCap.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK) then
  begin
    if (Spec.GetPages(auuid) = S_OK) and (auuid.cElems > 0) then
    begin
      FDialogs := FDialogs + [cdVCAPTURE];
      CoTaskMemFree(auuid.pElems);
    end;
    Spec := nil;
  end;

  // 2.  The video capture capture pin
  hr := Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Interleaved, VCap,
    IID_IAMStreamConfig, StreamConf);
  if hr <> S_OK then
    hr := Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video, VCap, IID_IAMStreamConfig,
      StreamConf);
  if hr = S_OK then
  begin
    if StreamConf.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
    begin
      if (Spec.GetPages(auuid) = S_OK) and (auuid.cElems > 0) then
      begin
        FDialogs := FDialogs + [cdVCAPTURE_PIN];
        CoTaskMemFree(auuid.pElems);
      end;
      Spec := nil;
    end;
    StreamConf := nil;
  end;

  // 3.  The video capture preview pin.

  // This basically sets the format being previewed.  Typically, you
  // want to capture and preview using the SAME format, instead of having to
  // enter the same value in 2 dialog boxes.  For a discussion on this, see
  // the comment above the MakePreviewGraph function.
  hr := Builder.FindInterface(@PIN_CATEGORY_PREVIEW, @MEDIATYPE_Interleaved, VCap,
    IID_IAMStreamConfig, StreamConf);
  if hr <> S_OK then
    hr := Builder.FindInterface(@PIN_CATEGORY_PREVIEW, @MEDIATYPE_Video, VCap, IID_IAMStreamConfig,
      StreamConf);
  if hr = S_OK then
  begin
    if StreamConf.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
    begin
      if (Spec.GetPages(auuid) = S_OK) and (auuid.cElems > 0) then
      begin
        FDialogs := FDialogs + [cdVPREVIEW_PIN];
        CoTaskMemFree(auuid.pElems);
      end;
      Spec := nil;
    end;
    StreamConf := nil;
  end;

  // 4 & 5.  The video crossbar, and a possible second crossbar

  // 6.  The TVTuner
  hr := Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Interleaved, VCap, IID_IAMTVTuner,
    TVTuner);
  if hr <> S_OK then
    hr := Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video, VCap, IID_IAMTVTuner,
      TVTuner);
  if hr = S_OK then
  begin
    if TVTuner.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
    begin
      if (Spec.GetPages(auuid) = S_OK) and (auuid.cElems > 0) then
      begin
        FDialogs := FDialogs + [cdTVTUNER];
        CoTaskMemFree(auuid.pElems);
      end;
      Spec := nil;
    end;
    TVTuner := nil;
  end;

  // no audio capture, we're done
  if ACap = nil then
    Exit;

  if (AComp <> nil) and (AComp.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK) then
  begin
    if (Spec.GetPages(auuid) = S_OK) and (auuid.cElems > 0) then
    begin
      FDialogs := FDialogs + [cdACOMPRESSION];
      CoTaskMemFree(auuid.pElems);
    end;
    Spec := nil;
  end;

  // 7.  The Audio capture filter itself... Thanks anyway, but we got these already

  // 8.  The Audio capture pin
  if Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Audio, ACap, IID_IAMStreamConfig,
    StreamConf) = S_OK then
  begin
    if StreamConf.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
    begin
      if (Spec.GetPages(auuid) = S_OK) and (auuid.cElems > 0) then
      begin
        FDialogs := FDialogs + [cdACAPTURE_PIN];
        CoTaskMemFree(auuid.pElems);
      end;
      Spec := nil;
    end;
    StreamConf := nil;
  end;

  // 9.  The TV Audio filter
  if Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Audio, ACap, IID_IAMTVAudio, TVAudio)
    = S_OK then
  begin
    if TVAudio.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
    begin
      if (Spec.GetPages(auuid) = S_OK) and (auuid.cElems > 0) then
      begin
        FDialogs := FDialogs + [cdTVAUDIO];
        CoTaskMemFree(auuid.pElems);
      end;
      Spec := nil;
    end;
    TVAudio := nil;
  end;
end;

function TDicomVideoCapture.ShowDialog(const DialogType: TCaptureDialog): boolean;
var
  Spec: ISpecifyPropertyPages;
  auuid: CAUUID;
  hr: HRESULT;
  StreamConf: IAMStreamConfig;
  TVTuner: IAMTVTuner;
begin
  Result := false;
  if not (DialogType in FDialogs) or FCapturing then
    Exit;
  // they want the VfW format dialog
  case DialogType of
    cdVFORMAT:
      begin
        // this dialog will not work while previewing
        // Oh uh!  Sometimes bringing up the FORMAT dialog can result
        // in changing to a capture format that the current graph
        // can't handle.  It looks like that has happened and we'll
        // have to rebuild the graph.
        if CaptureDialogs.ShowDialog(VfwCaptureDialog_Format, Handle) = VFW_E_CANNOT_CONNECT then
          TearDownGraph; // now we need to rebuild
        if WantPreview then
          StartPreview;
      end;
    cdVSOURCE:
      begin
        // this dialog will not work while previewing
        StopPreview;
        CaptureDialogs.ShowDialog(VfwCaptureDialog_Source, Handle);
        if WantPreview then
          StartPreview;
      end;
    cdVDISPLAY:
      begin
        // this dialog will not work while previewing
        StopPreview;
        CaptureDialogs.ShowDialog(VfwCaptureDialog_Display, Handle);
        if WantPreview then
          StartPreview;
      end;
    // now the code for the new dialogs
    cdVCAPTURE:
      begin
        if VCap.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
        begin
          Spec.GetPages(auuid);
          OleCreatePropertyFrame(Handle, 30, 30, nil, 1, @VCap, auuid.cElems, auuid.pElems, 0, 0,
            nil);
          CoTaskMemFree(auuid.pElems);
          Spec := nil;
        end;
      end;
    cdVCAPTURE_PIN:
      begin
        // You can change this pin's output format in these dialogs.
        // If the capture pin is already connected to somebody who's
        // fussy about the connection type, that may prevent using
        // this dialog(!) because the filter it's connected to might not
        // allow reconnecting to a new format. (EG: you switch from RGB
        // to some compressed type, and need to pull in a decoder)
        // I need to tear down the graph downstream of the
        // capture filter before bringing up these dialogs.
        // In any case, the graph must be STOPPED when calling them.
        // The capture pin that we are trying to set the format on is connected if
        // one of these variable is set to TRUE. The pin should be disconnected for
        // the dialog to work properly.
        TearDownGraph; // graph could prevent dialog working
        //        hr:= Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Interleaved, VCap, IID_IAMStreamConfig, StreamConf);
        //        if hr<>S_OK then
        Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video, VCap, IID_IAMStreamConfig,
          StreamConf);
        if StreamConf.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
        begin
          Spec.GetPages(auuid);
          OleCreatePropertyFrame(Handle, 30, 30, nil, 1, @StreamConf, auuid.cElems, auuid.pElems,
            0, 0, nil);
          CoTaskMemFree(auuid.pElems);
          Spec := nil;
        end;
        StreamConf := nil;
        if WantPreview then
          StartPreview;
      end;
    cdVPREVIEW_PIN:
      begin
        // this dialog may not work if the preview pin is connected
        // already, because the downstream filter may reject a format
        // change, so we better kill the graph. (EG: We switch from
        // capturing RGB to some compressed fmt, and need to pull in
        // a decompressor)
        TearDownGraph;
        // This dialog changes the preview format, so it might affect
        // the format being drawn.  Our app's window size is taken
        // from the size of the capture pin's video, not the preview
        // pin, so changing that here won't have any effect. All in all,
        // this probably won't be a terribly useful dialog in this app.
//        hr:= Builder.FindInterface(@PIN_CATEGORY_PREVIEW, @MEDIATYPE_Interleaved, VCap, IID_IAMStreamConfig, StreamConf);
//        if hr<>S_OK then
        Builder.FindInterface(@PIN_CATEGORY_PREVIEW, @MEDIATYPE_Video, VCap, IID_IAMStreamConfig,
          StreamConf);
        if StreamConf.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
        begin
          Spec.GetPages(auuid);
          OleCreatePropertyFrame(Handle, 30, 30, nil, 1, @StreamConf, auuid.cElems, auuid.pElems,
            0, 0, nil);
          CoTaskMemFree(auuid.pElems);
          Spec := nil;
        end;
        StreamConf := nil;
        if WantPreview then
          StartPreview;
      end;
    cdTVTUNER:
      begin
        hr := Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Interleaved, VCap,
          IID_IAMTVTuner, TVTuner);
        if hr <> S_OK then
          Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video, VCap, IID_IAMTVTuner,
            TVTuner);
        if TVTuner.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
        begin
          Spec.GetPages(auuid);
          OleCreatePropertyFrame(Handle, 30, 30, nil, 1, @TVTuner, auuid.cElems, auuid.pElems, 0,
            0, nil);
          CoTaskMemFree(auuid.pElems);
          Spec := nil;
        end;
        TVTuner := nil;
      end;
    cdACAPTURE:
      begin
        if ACap.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
        begin
          Spec.GetPages(auuid);
          OleCreatePropertyFrame(Handle, 30, 30, nil, 1, @ACap, auuid.cElems, auuid.pElems, 0, 0,
            nil);
          CoTaskMemFree(auuid.pElems);
          Spec := nil;
        end;
      end;
    cdACAPTURE_PIN:
      begin
        // this dialog will not work while previewing - it might change
        // the output format!
        StopPreview;
        Builder.FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Audio, ACap, IID_IAMStreamConfig,
          StreamConf);
        if StreamConf.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
        begin
          Spec.GetPages(auuid);
          OleCreatePropertyFrame(Handle, 30, 30, nil, 1, @StreamConf, auuid.cElems, auuid.pElems,
            0, 0, nil);
          CoTaskMemFree(auuid.pElems);
          Spec := nil;
        end;
        StreamConf := nil;
        if WantPreview then
          StartPreview;
      end;
    cdVCOMPRESSION:
      begin
        StopPreview;
        if (CompressDialogs <> nil) then
          CompressDialogs.ShowDialog(VfwCompressDialog_Config, Handle)
        else
          if VComp.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
        begin
          Spec.GetPages(auuid);
          OleCreatePropertyFrame(Handle, 30, 30, nil, 1, @VComp, auuid.cElems, auuid.pElems, 0, 0,
            nil);
          CoTaskMemFree(auuid.pElems);
          Spec := nil;
        end;
        if WantPreview then
          StartPreview;
      end;
    cdACOMPRESSION:
      begin
        StopPreview;
        if AComp.QueryInterface(IID_ISpecifyPropertyPages, Spec) = S_OK then
        begin
          Spec.GetPages(auuid);
          OleCreatePropertyFrame(Handle, 30, 30, nil, 1, @AComp, auuid.cElems, auuid.pElems, 0, 0,
            nil);
          CoTaskMemFree(auuid.pElems);
          Spec := nil;
        end;
        if WantPreview then
          StartPreview;
      end;
  end;
  Result := true;
end;

// saving/restoring graph functions

procedure TDicomVideoCapture.RestoreGraph(config: TGraphConfig);
begin
  if (config = nil) then
    Exit;
  TearDownGraph;
  FreeCapFilters;

  UseTempFile := config.UseTempFile;
  WantBitmaps := config.WantBitmaps;
  DoPreallocFile := config.DoPreallocFile;
  WantCapture := config.WantCapture;
  WantPreview := config.WantPreview;
  WantDVAudio := config.WantDVAudio;
  WantAudio := config.WantAudio;
  WantAudioPreview := config.WantAudioPreview;
  PreallocFileSize := config.PreallocFileSize;
  DVResolution := config.DVResolution;
  BitmapPixelFormat := config.PixelFormat;
  if config.TempCaptureFileName <> '' then
    TempCaptureFileName := config.TempCaptureFileName;
  if config.CaptureFileName <> '' then
    CaptureFileName := config.CaptureFileName;

  BuildDevicesList;
  mVideo := GetMonikerByString(VideoDevicesList, config.VCapSource);
  mAudio := GetMonikerByString(AudioDevicesList, config.ACapSource);
  mAComp := GetMonikerByString(AudioCompressorsList, config.AComp);
  mVComp := GetMonikerByString(VideoCompressorsList, config.VComp);

  asm //this was added due to corrupted registers after func call (D5 compiler error?)
    push ebx; push edi; push esi
  end;
  InitCapFilters;
  asm
    pop esi; pop edi; pop ebx
  end;

  // Get VComp State
  if (config.VCompState <> '') and (CompressDialogs <> nil) then
  begin
    CompressDialogs.SetState(PChar(config.VCompState)^, Length(config.VCompState));
  end;

  SetACapMode(config.ACapMode);
  SetVCapMode(config.VCapMode);

  if BuildGraph and WantPreview then
    StartPreview;

  if Assigned(FOnChangeDevice) then
    FOnChangeDevice(Self);
  if Assigned(FOnChangeCompressor) then
    FOnChangeCompressor(Self);
end;

procedure TDicomVideoCapture.SaveGraph(config: TGraphConfig);
var
  i: integer;
begin
  if (config = nil) then
    Exit;
  config.Clear;
  config.UseTempFile := UseTempFile;
  config.WantBitmaps := WantBitmaps;
  config.DoPreallocFile := DoPreallocFile;
  config.WantCapture := WantCapture;
  config.WantPreview := WantPreview;
  config.WantDVAudio := WantDVAudio;
  config.WantAudio := WantAudio;
  config.WantAudioPreview := WantAudioPreview;
  config.PreallocFileSize := PreallocFileSize;
  config.TempCaptureFileName := TempCaptureFileName;
  config.CaptureFileName := CaptureFileName;
  config.DVResolution := DVResolution;
  config.PixelFormat := BitmapPixelFormat;
  config.ACapMode := ACapMode;
  config.VCapMode := VCapMode;
  config.VCompState := '';

  // Set VComp State
  if (CompressDialogs <> nil) then
  begin
    if Succeeded(CompressDialogs.GetState(nil^, i)) then
    begin
      SetLength(config.VCompState, i);
      CompressDialogs.GetState(PChar(config.VCompState)^, i);
    end;
  end;

  config.VCapSource := VCapName;
  config.ACapSource := ACapName;
  config.VComp := VCompName;
  config.AComp := ACompName;
end;

//------------------------------------------------------------------------------
// TGraphConfig - helper class to save/restore TDicomVideoCapture settings

constructor TGraphConfig.Create;
begin
  Clear;
end;

procedure TGraphConfig.Clear;
begin
  WantBitmaps := false;
  WantCapture := false;
  WantPreview := false;
  WantDVAudio := false;
  WantAudio := false;
  WantAudioPreview := true;
  DoPreallocFile := false;
  PreallocFileSize := 0;
  UseTempFile := false;
  TempCaptureFileName := 'captemp.avi';
  CaptureFileName := 'capture.avi';
  ZeroMemory(@ACapMode, sizeof(ACapMode));
  ZeroMemory(@VCapMode, sizeof(VCapMode));
  DVResolution := dvrFull;
  PixelFormat := pf24bit;
  VCapSource := '';
  ACapSource := '';
  AComp := '';
  VComp := '';
end;

const
  cWantBitmaps = 'WantBitmaps';
  cWantCapture = 'WantCapture';
  cWantPreview = 'WantPreview';
  cWantDVAudio = 'WantDVAudio';
  cWantAudio = 'WantAudio';
  cWantAudioPreview = 'WantAudioPreview';
  cDoPreallocFile = 'DoPreallocFile';
  cPreallocFileSize = 'PreallocFileSize';
  cUseTempFile = 'UseTempFile';
  cTempCaptureFileName = 'TempCaptureFileName';
  cCaptureFileName = 'CaptureFileName';
  cACapModeMediaSubType = 'ACapModeMediaSubType';
  cACapModeSampleRate = 'ACapModeSampleRate';
  cACapModeAvgSampleRate = 'ACapModeAvgSampleRate';
  cACapModeSampleSize = 'ACapModeSampleSize';
  cACapModeChannels = 'ACapModeChannels';
  cVCapModeMediaSubType = 'VCapModeMediaSubType';
  cVCapModeWidth = 'VCapModeWidth';
  cVCapModeHeight = 'VCapModeHeight';
  cVCapModeBits = 'VCapModeBits';
  cDVResolution = 'DVResolution';
  cPixelFormat = 'PixelFormat';
  cVCapSource = 'VCapSource';
  cACapSource = 'ACapSource';
  cAComp = 'AComp';
  cVComp = 'VComp';
  cVCompState = 'VCompState';

procedure TGraphConfig.RestoreGraph(layout: string);
var
  sl: TStringList;
begin
  Clear;
  sl := TStringList.Create;
  try
    sl.CommaText := layout;
    WantBitmaps := StrToIntDef(sl.Values[cWantBitmaps], 1) > 0;
    WantCapture := StrToIntDef(sl.Values[cWantCapture], 1) > 0;
    WantPreview := StrToIntDef(sl.Values[cWantPreview], 1) > 0;
    WantAudio := StrToIntDef(sl.Values[cWantAudio], 1) > 0;
    WantAudioPreview := StrToIntDef(sl.Values[cWantAudioPreview], 1) > 0;
    WantDVAudio := StrToIntDef(sl.Values[cWantDVAudio], 1) > 0;
    DoPreallocFile := StrToIntDef(sl.Values[cDoPreallocFile], 1) > 0;
    UseTempFile := StrToIntDef(sl.Values[cUseTempFile], 1) > 0;
    PreallocFileSize := StrToIntDef(sl.Values[cPreallocFileSize], 0);
    TempCaptureFileName := sl.Values[cTempCaptureFileName];
    if TempCaptureFileName = '' then
      TempCaptureFileName := 'captemp.avi';
    CaptureFileName := sl.Values[cCaptureFileName];
    if CaptureFileName = '' then
      CaptureFileName := 'capture.avi';
    DVResolution := TDVResolution(StrToIntDef(sl.Values[cDVResolution], integer(dvrFull)));
    if not (DVResolution in [low(TDVResolution)..high(TDVResolution)]) then
      DVResolution := dvrFull;
    //PixelFormat := TPixelFormat(StrToIntDef(sl.Values[cPixelFormat], integer(pf24bit)));
    //if not (PixelFormat in [low(TPixelFormat)..high(TPixelFormat)]) then
    //  PixelFormat := pf24bit;
    VCapSource := sl.Values[cVCapSource];
    ACapSource := sl.Values[cACapSource];
    AComp := sl.Values[cAComp];
    VComp := sl.Values[cVComp];
    ACapMode.MediaSubType := StrToGUID(sl.Values[cACapModeMediaSubType]);
    ACapMode.SampleRate := StrToIntDef(sl.Values[cACapModeSampleRate], 0);
    ACapMode.AvgSampleRate := StrToIntDef(sl.Values[cACapModeAvgSampleRate], 0);
    ACapMode.SampleSize := StrToIntDef(sl.Values[cACapModeSampleSize], 0);
    ACapMode.Channels := StrToIntDef(sl.Values[cACapModeChannels], 0);
    VCapMode.MediaSubType := StrToGUID(sl.Values[cVCapModeMediaSubType]);
    VCapMode.Width := StrToIntDef(sl.Values[cVCapModeWidth], 0);
    VCapMode.Height := StrToIntDef(sl.Values[cVCapModeHeight], 0);
    VCapMode.BitCount := StrToIntDef(sl.Values[cVCapModeBits], 0);
    VCompState := StrToBytes(sl.Values[cVCompState]);
  finally
    sl.Free;
  end;
end;

function TGraphConfig.SaveGraph: string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    if not WantBitmaps then
      sl.Add(cWantBitmaps + '=0');
    if not WantCapture then
      sl.Add(cWantCapture + '=0');
    if not WantPreview then
      sl.Add(cWantPreview + '=0');
    if not WantDVAudio then
      sl.Add(cWantDVAudio + '=0');
    if not WantAudio then
      sl.Add(cWantAudio + '=0');
    if not WantAudioPreview then
      sl.Add(cWantAudioPreview + '=0');
    if not DoPreallocFile then
      sl.Add(cDoPreallocFile + '=0');
    if not UseTempFile then
      sl.Add(cUseTempFile + '=0');
    sl.Add(cPreallocFileSize + '=' + IntToStr(PreallocFileSize));
    sl.Add(cTempCaptureFileName + '=' + TempCaptureFileName);
    sl.Add(cCaptureFileName + '=' + CaptureFileName);
    sl.Add(cDVResolution + '=' + IntToStr(integer(DVResolution)));
    sl.Add(cPixelFormat + '=' + IntToStr(integer(PixelFormat)));
    sl.Add(cVCapSource + '=' + VCapSource);
    sl.Add(cACapSource + '=' + ACapSource);
    sl.Add(cAComp + '=' + AComp);
    sl.Add(cVComp + '=' + VComp);
    sl.Add(cACapModeMediaSubType + '=' + GUIDToStr(ACapMode.MediaSubType));
    sl.Add(cACapModeSampleRate + '=' + IntToStr(ACapMode.SampleRate));
    sl.Add(cACapModeAvgSampleRate + '=' + IntToStr(ACapMode.AvgSampleRate));
    sl.Add(cACapModeSampleSize + '=' + IntToStr(ACapMode.SampleSize));
    sl.Add(cACapModeChannels + '=' + IntToStr(ACapMode.Channels));
    sl.Add(cVCapModeMediaSubType + '=' + GUIDToStr(VCapMode.MediaSubType));
    sl.Add(cVCapModeWidth + '=' + IntToStr(VCapMode.Width));
    sl.Add(cVCapModeHeight + '=' + IntToStr(VCapMode.Height));
    sl.Add(cVCapModeBits + '=' + IntToStr(VCapMode.BitCount));
    sl.Add(cVCompState + '=' + BytesToStr(VCompState));
    Result := sl.CommaText;
  finally
    sl.Free;
  end;
end;

function TGraphConfig.RestoreGraphFromStream(Stream: TStream): boolean;
var
  i: integer;
  s: string;
begin
  Result := false;
  if not Assigned(Stream) then
    Exit;
  Result := (Stream.Read(i, sizeof(i)) = sizeof(i));
  if Result then
  begin
    SetLength(s, i);
    Result := (Stream.Read(PCHAR(s)^, i) = i);
    RestoreGraph(s);
  end;
end;

function TGraphConfig.SaveGraphToStream(Stream: TStream): boolean;
var
  i: integer;
  s: string;
begin
  Result := false;
  if not Assigned(Stream) then
    Exit;
  s := SaveGraph;
  i := Length(s);
  Result := (Stream.Write(i, sizeof(i)) = sizeof(i));
  Result := Result and (Stream.Write(PCHAR(s)^, i) = i);
end;

procedure TDicomVideoCapture.BitmapCompressed(var msg: TWMSampleCaptured);
var
  MediaType: TAM_Media_Type;
  bih: TBitmapInfoHeader;
  BitmapInfo: TBITMAPINFO;
  w, h: integer;
  //  usage: cardinal;
  SampleGrabberCB: TSampleGrabberCB;
begin
  try
    // process only own grabber messages
    if (not (msg.GrabberCB is TSampleGrabberCB)) or (msg.GrabberCB <> GrabberCB) then
      Exit;
    SampleGrabberCB := TSampleGrabberCB(msg.GrabberCB);
    if (Grabber.GetConnectedMediaType(MediaType) = S_OK) then
    begin
      try
        // Get a pointer to the video header.
        if CheckGUID(MediaType.FormatType, FORMAT_VideoInfo) then
          bih := PVideoInfoHeader(mediatype.pbFormat)^.bmiHeader
        else
          if CheckGUID(MediaType.FormatType, FORMAT_VideoInfo2) then
          bih := PVideoInfoHeader2(mediatype.pbFormat)^.bmiHeader
        else
          Abort;
        // The video header contains the bitmap information.
        // Copy it into a BITMAPINFO structure.
        ZeroMemory(@BitmapInfo, sizeof(BitmapInfo));
        Move(bih, BitmapInfo.bmiHeader, sizeof(bih));
      finally
        FreeMediaType(MediaType);
      end;
      // Copy the image into the buffer.
      w := BitmapInfo.bmiHeader.biWidth;
      h := BitmapInfo.bmiHeader.biHeight;

      if (SampleGrabberCB.fsize > 0) then
      begin
        SampleGrabberCB.DisableBufferAccess; // to avoid simultaneous access to buffer
        try
          if Assigned(FOnBitmapCompress) then
            FOnBitmapCompress(SampleGrabberCB.sendbuf, SampleGrabberCB.fsize,
              w, h);
          //VCapMode.Width, VCapMode.Height);
        finally
          SampleGrabberCB.EnableBufferAccess;
        end;
      end;
    end;
  except
  end;

end;

procedure TDicomVideoCapture.SetOnBitmapCompress(
  const Value: TBitmapCompressEvent);
begin
  FOnBitmapCompress := Value;
end;

function TDicomVideoCapture.GetActiveCompress: boolean;
begin
  if (Grabber <> nil) and (Previewing or Capturing) then
    Result :=  TSampleGrabberCB(GrabberCB).EnableCompress
  else
    Result := false;
end;

procedure TDicomVideoCapture.SetActiveCompress(Value: boolean);
begin
  if (Grabber <> nil) and (Previewing or Capturing) then
    TSampleGrabberCB(GrabberCB).EnableCompress := Value;
end;

destructor TGraphConfig.Destroy;
begin
//  Clear;
  inherited;
end;

initialization
  VideoDevicesList := TObjectList.Create;
  AudioDevicesList := TObjectList.Create;
  VideoCompressorsList := TObjectList.Create;
  AudioCompressorsList := TObjectList.Create;

finalization
  VideoDevicesList.Free;
  AudioDevicesList.Free;
  VideoCompressorsList.Free;
  AudioCompressorsList.Free;
end.

