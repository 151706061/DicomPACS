{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}

unit DCM_Attributes;
{$I DicomPack.inc}
{.$DEFINE SQ_UNDEFINELENGTH}
{$DEFINE TIME_LENGTH_HAVE_MS}

{$DEFINE USEECLMEMORYSTREAM}

{.$DEFINE DICOMDEBUX1}

{$DEFINE NEW_WL_COMPUTE}

interface
uses
  {$IFDEF LINUX}Types, Libc, QControls, Qgraphics, Types, {$ELSE}
  Windows, Messages, Forms, Controls, graphics, {$ENDIF}
  SysUtils, Classes, dialogs, {$IFDEF DICOMDEBUX1}DbugIntf, {$ENDIF} FileCtrl,
  CnsMsg, DCM_Dict, DCM_UID, DCM_MemTable, DB, CnsCRtl, KXString, DCM_Templates,
  CnsVfw, DcmImageConvert{$IFDEF FOR_TRIAL_VERSION}, shellapi{$ENDIF};

const
  A90 = PI / 2;

  XVECTOR = 1;
  YVECTOR = 2;
  ZVECTOR = 3;

  dcmcr_ZOOMMENO = 1778;
  dcmcr_ZOOMPIU = 1779;
  dcmcr_WINDOW = 1780;
  dcmcr_PENNA = 1781;
  dcmcr_ROI = 1782;
  dcmcr_HAND = 1783;
  dcmcr_HWRITE = 1784;
  dcmcr_MOVE2 = 1785; //   \
  dcmcr_MOVEY = 1786; //   |
  dcmcr_MOVE1 = 1787; //   /
  dcmcr_MOVEX = 1788; //   -
  dcmcr_MOVE = 1789;
  dcmcr_RESIZE = 1790;

  EPS = 0.000001; // smallest positive value: less than that to be considered zero
  EPSEPS = EPS * EPS; // and its square

  c_eol = #13;

type
  TDragFromSource = (dfsNone, dfsFromImageList, dfsFromSameSeries, dfsFromSameStudy);
  TDragDropMode = (ddmFreeView, ddmForPrint);

  TKxFormType = (kftImageForm, kftImageFormEx, kftCaptureForm, kftECGForm, kftQueryForm,
    kftOtherForm, kftVFWCaptureForm, kft3DrenderingForm, kfDicomPrintForm, kftCaptureFormWorklist,
    kftRegisterForm, kftMPRForm, kftOtherQueryForm, kftEditReportForm);

  TOnShowFormEvent = procedure(Sender: TObject; AFormType: TKxFormType; const AForm: TForm; AIndex:
    Integer) of object;
  //TOnShowFormPanelEvent = procedure(Sender: TObject; AFormType: TKxFormType; const AForm: TForm; var
  //  Handled: Boolean) of object;

  TMouseWheelInteract = (
    mwiNone,
    mwiScrollWheel,
    mwiScaleWheel,
    mwiMPRLineHoz,
    mwiMPRLineVert
    );
  TMouseInteract = (
    miNone,
    miDragdown,
    miZoom,
    miScroll, // Hand navigation
    miWindow,
    miStack,
    miProbe,
    miMagnifier,
    miPerpendicularityLine,
    miPerpendicularityGrid,
    miSelectZoom, // Zoom in rectangle
    miSelectROI,
    //    miSelectMagicWand, // Magic Wand selection
    miSelect, // Rectangular selection

    miRuler3D,
    //    miDragArrow,

    miLineProfile,
    miSelectPlot,
    mi3DCursor,
    miPixelValue

    //    miPutText
    //    miPutAngle,
    //    miPutRuler,
    //    miPutArrow,
    //    miPolygon,
    );

  TMultiViewMode = (mvmSTANDARDView, mvmROWView, mvmCOLUMNView, mvmSLIDEView, mvmSUPERSLIDEView);

  TViewGridMode = (vgmStandardGrid, vgmSeriesGrid, vgmMixColGrid, vgmPrintGrid);

  TRulerUnitType = (ruCentimeter, ruMillimeter);

  TStructMatrix3D = record
    x: Double;
    y: Double;
    z: Double;
  end;

  TStructPlane3D = record
    Position: TStructMatrix3D;
    NormalVector: TStructMatrix3D;
    XNormalVector: TStructMatrix3D;
    YNormalVector: TStructMatrix3D;
  end;

  TStructLine3D = record
    position: TStructMatrix3D;
    lineVector: TStructMatrix3D;
  end;

  TRGBS = packed record
    b: byte;
    g: byte;
    r: byte;
    s: byte;
  end;
  pRGBS = ^TRGBS;

  {$IFNDEF LEVEL6}
  PSmallInt = ^SmallInt;
  //  PByte = ^Byte;
  {$ENDIF}

  {  ShortRA0 = array[0..0] of ShortInt;
    Shortp0 = ^ShortRA;
    SingleRA0 = array[0..0] of Single;
    Singlep0 = ^SingleRA0;
    ByteRA0 = array[0..0] of byte;
    Bytep0 = ^ByteRA0;
    WordRA0 = array[0..0] of Word;
    Wordp0 = ^WordRA0;
    SmallIntRA0 = array[0..0] of SmallInt;
    SmallIntp0 = ^SmallIntRA0;
    LongIntRA0 = array[0..0] of LongInt;
    LongIntp0 = ^LongIntRA0; }

  TYCBCR = packed record
    y: byte;
    Cb: byte;
    Cr: byte;
  end;
  pYCBCR = ^TYCBCR;

  TYCBCR422 = packed record
    y: byte;
    y1: byte;
    Cb: byte;
    Cr: byte;
  end;
  pYCBCR422 = ^TYCBCR422;

  TDCMFilter = (DF_FIND_EDGES, DF_BLUR_MORE);
  TImageProcessOp = (OP_INVERT, OP_FILL, OP_ADD, OP_MULT, OP_and, OP_or, OP_xor, OP_GAMMA, OP_LOG,
    OP_SQR,
    OP_SQRT, OP_MINIMUM, OP_MAXIMUM);

  TDCMIntegerArray = array of Integer;
  TByteArray = array of Byte;
  TShortIntArray = array of ShortInt;
  TMagnificationType = (mftNONE, mftBILINEAR, mftCUBIC, mftREPLICATE);

  {  TRGB = packed record
      b: byte;
      g: byte;
      r: byte;
    end;
    pRGB = ^TRGB; }
  RGBROW = array[0..Maxint div 16] of TRGB;
  pRGBROW = ^RGBROW;

  TDicomFilterPresets = (fpNone, fpBlur, fpEdge, fpEmboss, fpHighPass1, fpHighPass2,
    fpHighPass3, LowPass1, LowPass2);

  THistogramItem = record
    R: DWord;
    G: DWord;
    B: DWord;
    Gray: DWord;
  end;
  THistogram = array[0..255] of THistogramItem;
  PHistogram = ^THistogram;

  // атрибуты ЭКГ
  MyType = SmallInt;
  r_chnlImgBorder = record
          r_x_top : Integer;
          r_y_top : Integer;
          r_x_bottom : Integer;
          r_y_bottom : Integer;
  end;
  r_maxPnt = record
          i1 : Integer;    // индекс в массиве
          value : integer; // значение
          x1    : integer;
          y1    : integer;
          x2    : integer;
          y2    : integer;
          vCentral : Integer;
          vYTop : Integer;
          vYBottom : Integer;
          vkx   : Extended;
          r_SamplingFrequency : Integer;
          r_Q : integer;  // индекс в массиве точки Q
          r_S : integer;  // индекс в массиве точки S
          r_qx,
          r_qy,
          r_qRPosY,
          r_qQPosY,
          r_qSPosY,
          r_sx,
          r_sy,
          r_sPosY : integer;
  end;
  r_channel = record
          r_chann_cmn  : Integer; // номер канала
          r_name       : string;  // наименование канала
          r_channel    : Integer; // номер канала в группе
          r_edizm_shrt : string;  // ед.изм - короткое наименование
          r_edizm_lrg  : string;  // ед.изм - длинное наименование
          r_SamplingFrequency : Integer; // частота измерений в секунду
          r_MaxPoints  : array of r_maxPnt; // массив максимумов для расчетов
  end;
  r_points = record
          r_x,
          r_y,
          r_SamplingFrequency,
          r_Value,
          v_x_top ,
          v_x_bottom ,
          v_y_top ,
          v_y_bottom     :  Integer;
  end;
  r_cmn = record            // v_n_channel, v_n_group
          r_amm        : Integer; // кол-во измерений
          r_channel : array of r_channel;
          r_data : array of array of Integer;  // массив измерений
          r_pnt_data : array of array of r_points;  // массив координат
  end;


  TDicomMemoryStream = class(TMemoryStream)
  public
    constructor Create(AData: Pointer; Alen: Integer);
  end;
  TCoodZoomEx = class
    fOffX: Integer;
    fOffY: Integer; //VIEWµДїЄКј
    fZoom: Double;
    fDZoom: Double;
    RescaleSlopeX: Double;
    RescaleSlopeY: Double;

    ViewX: Double;
    ViewY: Double;
  public
    constructor Create;
    function YScr2Bmp(y: integer): integer;
    function XScr2Bmp(x: integer): integer;
    function YBmp2Scr(y: integer): integer;
    function XBmp2Scr(x: integer): integer;

    function YScr2Bmpf(y: Double): Double;
    function XScr2Bmpf(x: Double): Double;
    function YBmp2Scrf(y: Double): Double;
    function XBmp2Scrf(x: Double): Double;
  end;
  PCoodZoom = ^TCoodZoomEx;

  TLeaderMouserInspect = (ldmiNone, ldmiRulerCalc, ldmiRuler, ldmiRulerVer, ldmiRulerHiz,
    ldmiRulerVerHiz, ldmiPoly, ldmiPolyonA, ldmiPolyonV, ldmiAngle, ldmiCross, ldmiCross1, ldmiArrow,
    ldmiROI_Cycle, ldmiROI_Rect, ldmiText, ldmiRect, ldmiCycle, ldmiPerpendicularityLine,
    ldmiReferenceLine, ldmiSelectRect, ldmiVitexObject, ldmiBitmap, ldmiRotateLine,
    ldmiSelectMagicWand, ldmiSolidRect, ldmiCAPoly, ldmiVentricularPolyon,
    ldmiQuantitativeCoronaryAnaliysis);

  TCineDragState = (cdsNone, cdsMove, cdsSizePoint, cdsSizePoint1, cdsSizeLine, cdsSizeText,
    cdsRotate);

  TDicomDrawObjectLabelPosition = (dlmStartPoint, dlmEndPoint, dlmBottomOfImage, dlmTopOfImage,
    dlmFreeMove, dlmLeftOfImage, dlmRightOfImage);

  PFloatPoint = ^TFloatPoint;
  TFloatPoint = record
    X, Y: Single;
  end;

  TDicomFilterRecordEvent = procedure(DataSet: TObject;
    var Accept: Boolean) of object;

  TDicomAttribute = class;
  TDicomDatasetBinaryStreamFormat = class
  private
    Writer: TWriter;
 //   Reader: TReader;
    FWorkStream: TStream;
    FBuffSize: Integer;
    FsfSaveDataTypeHeader: Boolean;
    FSaveLimit: Integer;
    FOnFilterRecord: TDicomFilterRecordEvent;
    FWorkDataset: TDataset;
    FMemoFilter: TDicomAttribute;
    procedure SetWorkStream(const Value: TStream);
    procedure SetBuffSize(const Value: Integer);
    procedure SetsfSaveDataTypeHeader(const Value: Boolean);
    procedure SetSaveLimit(const Value: Integer);
    procedure SetOnFilterRecord(const Value: TDicomFilterRecordEvent);
    procedure SetMemoFilter(const Value: TDicomAttribute);
    procedure SetWorkDataset(const Value: TDataset);

  protected

  public
    constructor Create(AOwner: TComponent);

    procedure BeforeSave(ADataset: TDataset);
    procedure SaveDef(ADataset: TDataset);
    procedure SaveData(ADataset: TDataset);
    procedure AfterSave(ADataset: TDataset);

    procedure BeforeLoad(ADataset: TDataset);
    procedure LoadDef(ADataset: TDataset);
    procedure LoadData(ADataset: TDataset);
    procedure AfterLoad(ADataset: TDataset);

    property WorkStream: TStream read FWorkStream write SetWorkStream;
    property BuffSize: Integer read FBuffSize write SetBuffSize;

    property SaveLimit: Integer read FSaveLimit write SetSaveLimit;
    property MemoFilter: TDicomAttribute read FMemoFilter write SetMemoFilter;
    property WorkDataset: TDataset read FWorkDataset write SetWorkDataset;

    property sfSaveDataTypeHeader: Boolean read FsfSaveDataTypeHeader write SetsfSaveDataTypeHeader;

    property OnFilterRecord: TDicomFilterRecordEvent read FOnFilterRecord write SetOnFilterRecord;
  end;

  TDicomDrawObjects = class;
  TDicomDrawObject = class
  private
    fParent: TDicomDrawObjects;
    FList: TList;
    FRect: TRect;
    FKind: TLeaderMouserInspect;
    FTextIndex: Integer;
    FCalText: AnsiString;
    fTextPoint: TFloatPoint;

    FUserText: AnsiString;
    fCalLength: Double;
    fName: AnsiString;
    ftag: Integer;
    fRelateFrameIndex: Integer;
    //    FTextRect: TRect;
    fRulerUnit: TRulerUnitType;
    fFont: TFont;
    fRulerUnitString: AnsiString;
    fDragState: TCineDragState;
    fDragPointIndex: Integer;
    fDragLineIndex: Integer;

    fPenColor: TColor;
    fFontColor: TColor;

    fCanNotMove: Boolean;
    fInMoving: Boolean;
    fCanNotResize: Boolean;
    FFixScale: Boolean;
    FFixScaleValue: Double;
    FPloyID: Integer;
    FLabelPosition: TDicomDrawObjectLabelPosition;
    FImageIndex: integer;
    FAngle: Double;
    FVitexObject: TVitexObject;
    FObjectName: AnsiString;
    procedure SetRulerUnit(const Value: TRulerUnitType);
    procedure SetFont(const Value: TFont);
    procedure SetFixScale(const Value: Boolean);
    procedure SetFixScaleValue(const Value: Double);
    procedure SetPloyID(const Value: Integer);
    procedure SetLabelPosition(const Value: TDicomDrawObjectLabelPosition);
    function IsNearLine(x1, y1: Integer): Boolean;
    procedure SetImageIndex(const Value: integer);
    procedure SetAngle(const Value: Double);
    procedure SetVitexObject(const Value: TVitexObject);
    procedure RotatePoint(const ax, ay: Double; const xAngle: double);
    procedure RotatePointEx(const xAngle: double);
    procedure SetObjectName(const Value: AnsiString);

  protected
    function GetPointSCRX(AIndex: Integer): Integer;
    function GetPointSCRY(AIndex: Integer): Integer;

    function GetPointX(AIndex: Integer): Single;
    procedure SetPointX(AIndex: Integer; Value: Single);
    function GetPointY(AIndex: Integer): Single;
    procedure SetPointY(AIndex: Integer; Value: Single);

    function GetDragState(aX, aY: Integer): TCineDragState; virtual;
    function GetNeedDrawinserting(var X2, y2: Single): Boolean;
    procedure RefreshBoundRect;
    function CheckPointType(AIndex: Integer): Boolean;
    function CheckPointType1(AIndex: Integer): Boolean;
  public
    fViewCood: PCoodZoom;

    constructor Create(AParent: TDicomDrawObjects; AViewCood: PCoodZoom);
    destructor Destroy; override;

    function CalcLength: Double;
    function CalcArea: Double;
    function CalcVolume: Double;
    function CalcCalLength: Double;
    function CalcAngle: Double;
    function Calc2Text: AnsiString;
    procedure CalAverage(var av, sd, ar: double);

    procedure AddPoint(X, Y: Single);
    procedure SetPoint(AIndex: Integer; X, Y: Single);
    function GetCount: Integer;
    function GetMaxPoint: integer;
    procedure ClearPoints;
    function GetTextPointSCRX: Integer;
    function GetTextPointSCRY: Integer;

    //property TextPoint: TFloatPoint read fTextPoint write fTextPoint;

    property Kind: TLeaderMouserInspect read FKind write FKind;
    property CalText: AnsiString read FCalText write FCalText;
    property UserText: AnsiString read FUserText write FUserText;
    property CalLength: Double read fCalLength write fCalLength;
    property PloyID: Integer read FPloyID write SetPloyID;
    property Name: AnsiString read FName write FName;
    property ObjectName: AnsiString read FObjectName write SetObjectName;
    property Tag: Integer read FTag write FTag;
    property RelateFrameIndex: Integer read fRelateFrameIndex write fRelateFrameIndex;
    property DragState: TCineDragState read fDragState write fDragState;

    property ImageIndex: integer read FImageIndex write SetImageIndex;
    property LabelPosition: TDicomDrawObjectLabelPosition read FLabelPosition write
      SetLabelPosition;
    property RulerUnit: TRulerUnitType read fRulerUnit write SetRulerUnit;
    property RulerUnitString: AnsiString read fRulerUnitString; // write fRulerUnitString;
    property TextIndex: Integer read FTextIndex write FTextIndex;
    property Font: TFont read fFont write SetFont;
    property X[index: Integer]: Single read GetPointX write SetPointX;
    property Y[index: Integer]: Single read GetPointY write SetPointY;
    property SCRX[index: Integer]: Integer read GetPointSCRX;
    property SCRY[index: Integer]: Integer read GetPointSCRY;

    property PenColor: TColor read fPenColor write fPenColor;
    property Angle: Double read FAngle write SetAngle;

    property CanNotMove: Boolean read fCanNotMove write fCanNotMove;
    property CanNotResize: Boolean read fCanNotResize write fCanNotResize;

    property InMoving: Boolean read fInMoving write fInMoving;

    property FixScale: Boolean read FFixScale write SetFixScale;
    property FixScaleValue: Double read FFixScaleValue write SetFixScaleValue;

    property VitexObject: TVitexObject read FVitexObject write SetVitexObject;

    property ObjectRect: TRect read FRect;
    property Parent: TDicomDrawObjects read fParent;
  end;

  TDicomAttributes = class;
  TDicomImage = class;
  TDicomDrawObjects = class
  private
    fOwnImageData: TDicomImage;
    FList: TList;
    fLeaderMouserInspect: TLeaderMouserInspect;
    FNewDrawObject: TDicomDrawObject;
    FObjectInserting: Boolean;
    FMouseMovePoint: TPoint;

    FAfterNewDrawObject: TNotifyEvent;
    FAfterObjectSize: TNotifyEvent;
    FAfterObjectMove: TNotifyEvent;
    fLabelPosition: TDicomDrawObjectLabelPosition;
    FModify: Boolean;
    procedure SetLabelPosition(const Value: TDicomDrawObjectLabelPosition);
    procedure SetModify(const Value: Boolean);
  protected
    function GetDrawObject(AIndex: Integer): TDicomDrawObject;
    procedure SetLeaderMouserInspect(Value: TLeaderMouserInspect);

  public
    fViewCood: PCoodZoom;

    constructor Create(AOwnImageData: TDicomImage; AViewCood: PCoodZoom);
    destructor Destroy; override;

    procedure SaveAll(ADataset: TDicomAttributes);
    procedure LoadAll(ADataset: TDicomAttributes);
    function Add(AValue: TLeaderMouserInspect): TDicomDrawObject;

    function AddRect(AValue: TLeaderMouserInspect; x1, y1, x2, y2: Double): TDicomDrawObject;

    function FindByObjectName(AName: AnsiString): TDicomDrawObject;
    procedure CopyFrom(AObjs: TDicomDrawObjects; AFramIndex: Integer);
    function GetCount: Integer;
    procedure RemoveAll;
    procedure RemoveSelectedDrawObject;

    function MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer; ACurrentFrameIndex: Integer): Boolean;
    function MouseMove(Shift: TShiftState; X, Y: Integer): Boolean; overload;
    function MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;

    property Items[Index: integer]: TDicomDrawObject read GetDrawObject; default;
    property NewDrawObject: TDicomDrawObject read FNewDrawObject write FNewDrawObject;

    property OnAfterNewDrawObject: TNotifyEvent read FAfterNewDrawObject write FAfterNewDrawObject;
    property OnAfterObjectSize: TNotifyEvent read FAfterObjectSize write FAfterObjectSize;
    property OnAfterObjectMove: TNotifyEvent read FAfterObjectMove write FAfterObjectMove;

    property LabelPosition: TDicomDrawObjectLabelPosition read fLabelPosition write
      SetLabelPosition;

    property LeaderMouserInspect: TLeaderMouserInspect read fLeaderMouserInspect write
      SetLeaderMouserInspect;
    property MouseMovePoint: TPoint read fMouseMovePoint;
    property ObjectInserting: Boolean read FObjectInserting;

    property Modify: Boolean read FModify write SetModify;

    property OwnImageData: TDicomImage read fOwnImageData;
    property List: TList read FList;
  end;

  TOBStream = class(TMemoryStream)
  private
    FExtData: Pointer;
  protected
    function Realloc(var NewCapacity: Longint): Pointer; override;
  public
    constructor Create(ALen: Integer); overload;
    constructor Create(AData: Pointer; ALen: Integer); overload;
    destructor Destroy; override;
    property ExtData: Pointer read FExtData;
  end;
  TDicomStream = class
  private
    FStream: TStream;
    cc: array[0..1] of Byte;
    dd: array[0..3] of Byte;
    ee: array[0..7] of Byte;

    FTransferSyntax: Integer;

    FKeepImageDataInStream: Boolean;
    fJpegQuality: Integer;
    FUseUndefineLength: Boolean;
    FOnlyCurrentFrame: Integer;
    FLoadFrameInThread: Boolean;
    procedure SetUseUndefineLength(const Value: Boolean);
    procedure SetOnlyCurrentFrame(const Value: Integer);
    procedure SetLoadFrameInThread(const Value: Boolean);
  protected
    function GetPosition: integer;
    procedure SetPosition(AValue: Integer); virtual;
    function GetSize: integer;
  public
    { Public declarations }
    constructor Create(Astream: TStream);
    destructor Destroy; override;

    function ReadInt8: Integer;
    function ReadInt16: Integer;
    function ReadInt32: Integer;
    function ReadInt64: Int64;
    function ReadString(i: Integer): AnsiString;

    function WriteInt8(i: Integer): Integer;
    function WriteInt16(i: Integer): Integer;
    function WriteInt32(i: Integer): Integer;
    function WriteInt64(l: Int64): Integer;
    function WriteString(astr: AnsiString): Integer;
    function Write(const Buffer; Count: Integer): Integer;
    function Read(var Buffer; Count: integer): Integer;

    //    function LoadFromStream(AStream: TStream): Integer;
    //    function SavetoStream(AStream: TStream): integer;

    procedure skipBytes(ALen: Integer);
    //    function ReadInteger: Integer;

    property Stream: TStream read FStream;
    property TransferSyntax: Integer read FTransferSyntax write FTransferSyntax;
    property Position: Integer read getPosition write SetPosition;
    property Size: Integer read GetSize;
    property KeepImageDataInStream: Boolean read FKeepImageDataInStream write
      FKeepImageDataInStream;
    property JpegQuality: Integer read fJpegQuality write fJpegQuality;
    property UseUndefineLength: Boolean read FUseUndefineLength write SetUseUndefineLength;
    property OnlyCurrentFrame: Integer read FOnlyCurrentFrame write SetOnlyCurrentFrame;
    property LoadFrameInThread: Boolean read FLoadFrameInThread write SetLoadFrameInThread;
  end;

  TDicomDatasets = class;
  TImageDataStorageMode = (idsmMemoryData, idsmStreamData);
  TDicomImageData = class
  private
    FCanNotFreeBuffer: Boolean;
    procedure SetData(const Value: Pointer);
    procedure SetCanNotFreeBuffer(const Value: Boolean);
  protected
    FSelected: Boolean;

    FImageData: Pointer;
    FLen: Integer;

    FMin: Integer;
    FMax: Integer;
    FTransferSyntax: Integer;
    FHasDecompress: Boolean;
    fColorSpaceIsConverted: Boolean;

    FImageStream: TStream;
    FImagePositionInStream: Integer;
    FImageLenInStream: Integer;
    //    FSrcSyntax:Integer;
    FImageDataMode: TImageDataStorageMode;
    //FPhotometricInterpretation1: AnsiString;
  protected
    function GetData: Pointer;
  public
    constructor Create(ATransferSyntax: Integer; AData: Pointer; ALen: Integer); overload;
    constructor Create(ATransferSyntax: Integer; AData: TStream; ALen: Integer); overload;
    constructor Create(AData: TDicomImageData); overload;
    constructor Create(ALen: Integer); overload;
    destructor Destroy; override;
    procedure SaveData(AFileName: AnsiString);
    // FOMIN 03.04.2012 
    function GetMemStream:TMemoryStream;
    procedure LoadData(AFileName: AnsiString);
    procedure FreeData1;
    procedure ResetToStream;

    property MaxValue: Integer read FMax;
    property MinValue: Integer read FMin;
    property Data: Pointer read GetData write SetData;
    property Len: Integer read FLen;
    property TransferSyntax: Integer read FTransferSyntax;
    property Selected: Boolean read FSelected write FSelected;

    property HasDecompress: Boolean read FHasDecompress;

    property CanNotFreeBuffer: Boolean read FCanNotFreeBuffer write SetCanNotFreeBuffer;
    property ColorSpaceIsConverted: Boolean read fColorSpaceIsConverted;
  end;

  TDicomImageCustomWindowsLevelingItem = record
    fMin: Integer;
    fMax: Integer;
    fSlope: Double;
  end;

  TDicomImageCustomWindowsLeveling = class
  private
    fList: TList;
  protected

  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;

  published

  end;

  TDicomInformationLabel = class
  private
    FPosition: Integer;
    FOrderID: Integer;
    FFormatString: AnsiString;
    FUID: Integer;
    procedure SetFormatString(const Value: AnsiString);
    procedure SetOrderID(const Value: Integer);
    procedure SetPosition(const Value: Integer);
    procedure SetUID(const Value: Integer);

  protected

  public
    constructor Create;
    destructor Destroy; override;

    function GetText(AAttributes: TDicomAttributes): AnsiString;

    property UID: Integer read FUID write SetUID;
    property Position: Integer read FPosition write SetPosition;
    property OrderID: Integer read FOrderID write SetOrderID;
    property FormatString: AnsiString read FFormatString write SetFormatString;
  published

  end;

  TDicomImageUndoInfo = class
  protected
    fOffsetX: Double;
    fOffsetY: Double;
    FPostFilter: Integer;
    fViewerZoom: Double;
    FNegative: Boolean;

    FVerFlip1: Boolean;
    FHozFlip1: Boolean;
    FRotate1: Integer;
    fDSAMode: Boolean;
    FFrameIndex: Integer;
    FWindowCenter: Integer;
    FWindowWidth: Integer;
  public
    constructor Create(AAttributes: TDicomAttributes);
    destructor Destroy; override;
  end;
  TDicomDataset = class;

  TCnsAVIReader = class
  private
  //  FrameIndex: INTEGER;
    pavi: IAVIFile;
    pavis: IAVIStream;
  //  pavisound: IAVIStream;
    ob: IGetFrame;
//    pbmi: Windows.PBitmapInfoHeader;
 //   Punter: PByte;
//    han, i: integer;
  //  microsperframe: integer;

//    info: PAVISTREAMINFOA;
//    hexcode: AnsiString;
//    EMsg: AnsiString;
//    lasterr: integer;
    FileName: AnsiString;
    //Buffer: Pointer;
    fStart: Integer;
    fEnding: integer;
  public

    constructor Create;
    destructor Destroy; override;

    function Open(AFileName: Ansistring): integer;
    function GetFrame(Frame: integer): TBitmap;
    procedure AssignedToBitmap(Frame: integer; Bitmap: TBitmap);
    procedure Close;

    property Start: Integer read fStart;
    property Ending: integer read fEnding;
  end;

  TDicomImageBufferLength = (dibl16Bit, diblFloat);
  TOverlayFontSizeMode = (olmCalFromWidth, olmCalFromHeight, olmCalFromMax, olmCalFromMin);
  TDicomImage = class
  private
    fAVIStream: TCnsAVIReader;
    fAVIStreamFileName: string;

    fOnlyViewMultiSelected1: Boolean;
    fOnlyViewMultiSelected2: Boolean;
    fOnlyViewMultiSelected3: Boolean;
    fOnlyViewMultiSelected4: Boolean;

    fPresentationSate: TDicomDataset;
    fMagnificationType: TMagnificationType;

    fDSAMode: Boolean;
    fAspectRatio: Double;
    fMPRMode: Boolean;

    lFontSpacing: Integer;

    fOverlayFontSizeMode: TOverlayFontSizeMode;
    fOverlayFontSizePrecent: Double;

    FCalObjIndex: integer;
    FCurrentDicomPrintDPI: Integer;

    FWidth: Integer;
    FHeight: Integer;
    FBits: Integer;
    FUseBits: Integer;
    FSamplePerPixel: Integer;
    FPhotometricInterpretation: AnsiString;

    FRescaleIntercept: Double;
    FRescaleSlope: Double;
    FPixelPaddingValue: integer;
    FPlanarConfiguration: Integer;
    fPixelRepresentation: Boolean;

    FDrawObjects: TDicomDrawObjects;
    fOffsetX: Double;
    fOffsetY: Double;
    //    fZoom1: Double;
    fViewerZoom: Double;

    fCood: TCoodZoomEx;
    //    fMeasureValues: TStrings;
    fMeasureReport: TStrings;

    //    fHaveBeenCacheCineFrame: Boolean;
    fCanNotCacheData: Boolean;

    FAfterNewDrawObject: TNotifyEvent;
    FAfterObjectSize: TNotifyEvent;
    FAfterObjectMove: TNotifyEvent;

    FInformationLabels: TList;

    fRulerUnit: TRulerUnitType;
    fFont: TFont;

    fPenColor: TColor;
    fLabelFontColor: TColor;

    fMergeDataset: TDicomAttributes;
    fMergeFactor: Integer;
    fMergeMode: Boolean;
    FPostFilter: Integer;

    //FRedTable: ByteP;
    //FGreenTable: ByteP;
    //FBlueTable: ByteP;
    fCustomPalette: TList;

    fUndoBufferList: TList;
    FUndoBufferCount: Integer;
    FImageAngle: Double;
    FModify: Boolean;
    FViewModify: Boolean;
    FBufferLength: TDicomImageBufferLength;
    FMouseCtrlWwWlFactor: Double;
    FMouseWwWlFactor: Double;
    FDSADefaultFrame: Integer;
    FPostProcessed: Boolean;
    fCurrentViewSize: TSize;
    function GetIsCustomPalette: Boolean;

    procedure DoFinishNewDrawObject(Sender: TObject);
    procedure DoDrawObjectSize(Sender: TObject);
    procedure DoDrawObjectMove(Sender: TObject);
    procedure SetMergeMode(const Value: Boolean);
    procedure SetMergeFactor(const Value: Integer);
    function GetCurrentFrame: Integer;
    function GetFrameCount: Integer;
    procedure SetCurrentFrame(const Value: Integer);
    procedure SetFrameCount(const Value: Integer);
    procedure SetRulerUnit(const Value: TRulerUnitType);
    procedure SetFont(const Value: TFont);
    procedure SetPostFilter(const Value: Integer);
    procedure RefreshMaxMin(d1: TDicomImageData);
    procedure RefreshMaxMinWord(d1: TDicomImageData);
    procedure RefreshMaxMinFloat(d1: TDicomImageData);
    function GetInfoLabels(index: Integer): TDicomInformationLabel;
    procedure SetUndoBufferCount(const Value: Integer);
    procedure SetViewerZoom(const Value: Double);
    procedure SetImageAngle(const Value: Double);
    procedure SetOffsetX(const Value: Double);
    procedure SetOffsetY(const Value: Double);
    procedure SetModify(const Value: Boolean);
    procedure SetViewModify(const Value: Boolean);
    procedure SetHozFlip1(const Value: Boolean);
    procedure SetRotate1(const Value: Integer);
    procedure SetVerFlip1(const Value: Boolean);
    procedure SetFrameIndex(const Value: Integer);
    procedure SetBufferLength(const Value: TDicomImageBufferLength);
    procedure SetMouseCtrlWwWlFactor(const Value: Double);
    procedure SetMouseWwWlFactor(const Value: Double);
    procedure SetDSADefaultFrame(const Value: Integer);
    function GetImageArrayCount: Integer;
    procedure SetPostProcessed(const Value: Boolean);
  protected

    //    fTopoList: TList;

    FImageArray: TList;

    FImageArrayBuffer: TList;
    fUseImageBuffer: Boolean;

    FFrameIndex: Integer;
    FWindowCenter: Integer;
    FWindowWidth: Integer;
    FFrameCount: Integer;

    FBaseFrameIndex: Integer;
    FCurrentFrame: Integer;
    FAttributes: TDicomAttributes;

    FInstanceNumber: Integer; //dInstanceNumber
    FPixelSpacingX: Double; //dPixelSpacing
    FPixelSpacingY: Double;

    FNegative: Boolean;

    FVerFlip1: Boolean;
    FHozFlip1: Boolean;
    FRotate1: Integer;

    fImageVector: array[0..2] of TStructMatrix3D;
    fImageOrigin: TStructMatrix3D;
    fSliceLocation: Double;
    fSliceAxel: Integer;

    //    FVerFlip2: Boolean;
    //    FHozFlip2: Boolean;
    //    FRotate2: Integer;

    procedure SetUseImageBuffer(Value: Boolean);

    function GetMaxValue: Integer;
    function GetMinValue: Integer;
    function GetImagedata(AIndex: Integer): TDicomImageData;

    procedure GetPaletteTable;
    procedure SetWidth(Value: Integer);
    procedure SetHeight(Value: Integer);
    function orientationCorrectedToView: TStructPlane3D;

    procedure SetDSAMode(Value: Boolean);

    procedure DofilterW(Atype: TDCMFilter);
    procedure DoConvolve3x3W(kernel: array of Integer);

    procedure DofilterB(Atype: TDCMFilter);
    procedure DoConvolve3x3B(kernel: array of Integer);

    procedure SetWindowCenter(Value: integer);
    procedure SetWindowWidth(Value: integer);
    procedure SetNegative(Value: Boolean);

    procedure ResetDataToStream;
    procedure ReloadDataFromStream;

    function PrepareOverlayData: Boolean;
  public
    fOverlayBuffer: PWord;
    fOverlayBufferBits: Integer;
    CurrentViewSize: TSize;

    constructor Create(AAttributes: TDicomAttributes); overload;
    constructor Create(AAttributes, AView: TDicomAttributes); overload;
    destructor Destroy; override;

    procedure ConvertToRGB(d1: TDicomImageData);
    function ConvertFromRGB(d1: TDicomImageData; var aconvertLength: Integer): Pointer;
    function CalFontSpacing(AWidth, AHeight: integer): Integer;
    procedure smooth;
    procedure sharpen;
    procedure findEdges;
    procedure DoProcess(op: TImageProcessOp; value: Integer);
    function planeForImage: TStructPlane3D;
    procedure CopyInformationLabels(Src: TDicomImage);
    function getOrientationText(vector: TStructMatrix3D; inv: Boolean): AnsiString;

    function AddInformationLabel(APosition, AOrderID: Integer; AFormatString: AnsiString):
      TDicomInformationLabel;
    function GetInformationLabelCount: Integer;
    procedure DeleteInformationLabel(AIndex: Integer);
    procedure ClearInformationLabels;

    procedure AddPredefineInformationLabelsGEMR;
    procedure AddPredefineInformationLabelsSIMR;
    procedure AddPredefineInformationLabelsGE;
    procedure AddPredefineInformationLabelsSI;
    procedure AddPredefineInformationLabelsCommon;
    procedure AddDefaultInformationLabels;

    procedure SwapBigEndian(AIndex: Integer);

    function GetPalette(x, y: Integer): TDicomImagePalette;
    procedure ClearPalette;

    function CreatePresentationStateEx: TDicomAttributes;
    function CreatePresentationState: TDicomDataset;
    procedure SetPresentationSate(ADataset: TDicomDataset);

    procedure SavePresentationSate;
    procedure ApplyPresentationSate;

    function getLine(x1, y1, x2, y2: Double; var LineData: TDCMIntegerArray): Integer;
    function getPixelValue(d1: TDicomImageData; x, y: Integer): Integer;

    function getLine1(x1, y1, x2, y2: Double; var LineData: TDCMIntegerArray): Integer;
    function getPixelValue1(d1: TDicomImageData; x, y: Integer): Integer;

    function GetTopoLine(x, y: Integer): Integer;
    procedure ClearTopoLine;

    procedure GetBitmapFromCine(AIndex: Integer; ABitmap: TBitmap);

    property CalObjIndex: integer read FCalObjIndex write FCalObjIndex;

    procedure Reset;
    procedure ResetZoom;

    procedure SaveUndo;
    procedure Undo(AIndex: Integer);
    procedure ClearUndo;
    function GetUndoCount: Integer;

    procedure UpdateCood(AViewX, AViewY: Double; AXOff, AYOff: Integer; AZoom, APixelSpaceX, APixelSpaceY: Double); overload;
    //AZoom = ViewerZoom * BasicScale
    //AXOff = fOffsetX + ( ViewWidth - BasicScale * BitmapWidth *  ViewerZoom)/2
    //AYOff = fOffsetY + ( ViewHeight - BasicScale * Bitmapheight *  ViewerZoom)/2

    procedure UpdateCood(APixelSpaceX, APixelSpaceY: Double); overload;
    function DecompressData(AIndex: Integer): Boolean;

    function IsMONOCHROME: Boolean;
    procedure ReCalMaxMin(x1, y1, x2, y2: Integer);
    procedure LoadLutFromStream(AStream: TStream);
    function GetSourceTransferSyntax: Integer;
    // 29.11.2012 FOMIN
//    procedure SetSourceTransferSyntax( ATransferSyntax: Integer);
    // END 29.11.2012 FOMIN
    procedure CalAverage(x1, y1, x2, y2: Integer; var av, sd, ar: double);

    property ImageCood: TCoodZoomEx read fCood;
    property InfoLabels[index: Integer]: TDicomInformationLabel read GetInfoLabels;

    property UndoBufferCount: Integer read FUndoBufferCount write SetUndoBufferCount;
    property CanNotCacheData: Boolean read fCanNotCacheData write fCanNotCacheData;
    property FrameIndex: Integer read FFrameIndex write SetFrameIndex;
    property WindowCenter: Integer read FWindowCenter write SetWindowCenter;
    property WindowWidth: Integer read FWindowWidth write SetWindowWidth;

    property FrameCount: Integer read GetFrameCount write SetFrameCount;
    property ImageArrayCount: Integer read GetImageArrayCount;
    property CurrentFrame: Integer read GetCurrentFrame write SetCurrentFrame;

    property DSAMode: Boolean read fDSAMode write SetDSAMode;
    property AspectRatio: Double read fAspectRatio;
    property MPRMode: Boolean read fMPRMode;
    property DSADefaultFrame: Integer read FDSADefaultFrame write SetDSADefaultFrame;

    property CurrentDicomPrintDPI: Integer read FCurrentDicomPrintDPI write FCurrentDicomPrintDPI;
    property MagnificationType: TMagnificationType read fMagnificationType write
      fMagnificationType;

    property SliceLocation: Double read fSliceLocation;
    property SliceAxel: Integer read fSliceAxel;

    property MaxValue: integer read GetMaxValue;
    property MinValue: Integer read GetMinValue;

    property ImageData[index: Integer]: TDicomImageData read GetImageData;

    function GetPointValue(x1, y1: Integer): AnsiString;

    property Width: Integer read FWidth write SetWidth;
    property Height: integer read FHeight write SetHeight;
    property RescaleIntercept: Double read FRescaleIntercept write FRescaleIntercept;
    property RescaleSlope: Double read FRescaleSlope write FRescaleSlope;
    property PixelPaddingValue: integer read FPixelPaddingValue;
    property PlanarConfiguration: Integer read FPlanarConfiguration;
    property PixelRepresentation: Boolean read fPixelRepresentation write fPixelRepresentation;

    property Bits: Integer read FBits;
    property UseBits: Integer read FUseBits;
    property SamplePerPixel: Integer read FSamplePerPixel;
    property PhotometricInterpretation: AnsiString read FPhotometricInterpretation;
    property InstanceNumber: Integer read FInstanceNumber write FInstanceNumber;

    property PixelSpacingX: Double read FPixelSpacingX write FPixelSpacingX; //dPixelSpacing
    property PixelSpacingY: Double read FPixelSpacingY write FPixelSpacingY;
    property Attributes: TDicomAttributes read FAttributes;

    property Negative: Boolean read FNegative write SetNegative;
    property HozFlip: Boolean read FHozFlip1 write SetHozFlip1;
    property VerFlip: Boolean read FVerFlip1 write SetVerFlip1;
    property Rotate: Integer read FRotate1 write SetRotate1;

    property IsCustomPalette: Boolean read GetIsCustomPalette;

    property UseImageBuffer: Boolean read fUseImageBuffer write SetUseImageBuffer;
    property DrawObjects: TDicomDrawObjects read FDrawObjects;

    property OffsetX: Double read fOffsetX write SetOffsetX;
    property OffsetY: Double read fOffsetY write SetOffsetY;
    property ViewerZoom: Double read fViewerZoom write SetViewerZoom;

    //property CurrentViewSize: TSize read fCurrentViewSize write fCurrentViewSize;
    property ImageAngle: Double read FImageAngle write SetImageAngle;

    property Modify: Boolean read FModify write SetModify;
    property PostProcessed: Boolean read FPostProcessed write SetPostProcessed;
    property ViewModify: Boolean read FViewModify write SetViewModify;

    property OverlayFontSizeMode: TOverlayFontSizeMode read fOverlayFontSizeMode write fOverlayFontSizeMode;
    property OverlayFontSizePrecent: Double read fOverlayFontSizePrecent write fOverlayFontSizePrecent;

    property LabelFontColor: TColor read fLabelFontColor write fLabelFontColor;
    property PenColor: TColor read fPenColor write fPenColor;

    property MouseWwWlFactor: Double read FMouseWwWlFactor write SetMouseWwWlFactor;
    property MouseCtrlWwWlFactor: Double read FMouseCtrlWwWlFactor write SetMouseCtrlWwWlFactor;

    property RulerUnit: TRulerUnitType read fRulerUnit write SetRulerUnit;
    property Font: TFont read fFont write SetFont;

    //    property MeasureValues: TStrings read fMeasureValues;
    property MeasureReport: TStrings read fMeasureReport;

    property PresentationSate: TDicomDataset read fPresentationSate write fPresentationSate;

    property OnAfterNewDrawObject: TNotifyEvent read FAfterNewDrawObject write FAfterNewDrawObject;
    property OnAfterObjectSize: TNotifyEvent read FAfterObjectSize write FAfterObjectSize;
    property OnAfterObjectMove: TNotifyEvent read FAfterObjectMove write FAfterObjectMove;

    property MergeDataset: TDicomAttributes read fMergeDataset write fMergeDataset;
    property MergeFactor: Integer read fMergeFactor write SetMergeFactor;
    property MergeMode: Boolean read fMergeMode write SetMergeMode;

    property PostFilter: Integer read FPostFilter write SetPostFilter;

    property BufferLength: TDicomImageBufferLength read FBufferLength write SetBufferLength;

    property InformationLabels: TList read FInformationLabels;
    property FontSpacing: Integer read lFontSpacing;
    property BaseFrameIndex: Integer read FBaseFrameIndex;
    property CustomPalette: TList read fCustomPalette;
  end;

  TDicomWaveformChannel = class
  private
    FChannelBaseline: Double;
    FChannelSensitivityCorrectionFactor: Double;
    FChannelTimeSkew: Double;
    FChannelSensitivityUnits: AnsiString;
    FChannelSource: AnsiString;
    procedure SetChannelBaseline(const Value: Double);
    procedure SetChannelSensitivityCorrectionFactor(const Value: Double);
    procedure SetChannelSensitivityUnits(const Value: AnsiString);
    procedure SetChannelSource(const Value: AnsiString);
    procedure SetChannelTimeSkew(const Value: Double);

  protected

  public
    constructor Create;
    destructor Destroy; override;

    property ChannelSensitivityUnits: AnsiString read FChannelSensitivityUnits write
      SetChannelSensitivityUnits;
    property ChannelSource: AnsiString read FChannelSource write SetChannelSource;
    property ChannelSensitivityCorrectionFactor: Double read FChannelSensitivityCorrectionFactor
      write SetChannelSensitivityCorrectionFactor;
    property ChannelBaseline: Double read FChannelBaseline write SetChannelBaseline;
    property ChannelTimeSkew: Double read FChannelTimeSkew write SetChannelTimeSkew;

  published

  end;

  TDicomWaveForm = class
  private
    fList: TList;
    fBuffer: Pointer;
    fBufferSize: Integer;

    FNumberofWaveformSamples: Integer;
    FNumberofWaveformChannels: Integer;
    FSamplingFrequency: Double;

    FWaveformSampleInterpretation: AnsiString;
    fWaveformBitsStored: Integer;

    procedure SetNumberofWaveformChannels(const Value: Integer);
    procedure SetNumberofWaveformSamples(const Value: Integer);
    procedure SetSamplingFrequency(const Value: Double);
    procedure SetWaveformSampleInterpretation(const Value: AnsiString);
    function GetItems(index: Integer): TDicomWaveformChannel;
    function GetChannelCount: Integer;
  protected
    function AddChannel: TDicomWaveformChannel;
    procedure ClearChannels;
  public
    // границы для обрезки изображения по-каналам
    v_ArrChnlImgBorder: array of r_chnlImgBorder;
    // атрибуты ЭКГ
    v_data : array of r_cmn;
    v_min_val, v_max_val, v_cmn_amm, v_amm_pnt, v_max_pnt_in_group,
    v_SamplingFrequency : Integer;
    v_kx, v_ky :Extended;

    constructor Create(AAttributes: TDicomAttributes);
    destructor Destroy; override;

    property Buffer: Pointer read fBuffer;
    property BufferSize: Integer read fBufferSize;
    property Items[index: Integer]: TDicomWaveformChannel read GetItems;
    property ChannelCount: Integer read GetChannelCount;

    property NumberofWaveformChannels: Integer read FNumberofWaveformChannels write
      SetNumberofWaveformChannels;
    property NumberofWaveformSamples: Integer read FNumberofWaveformSamples write
      SetNumberofWaveformSamples;
    property SamplingFrequency: Double read FSamplingFrequency write SetSamplingFrequency;
    property WaveformSampleInterpretation: AnsiString read FWaveformSampleInterpretation write
      SetWaveformSampleInterpretation;
  end;

  TDicomLoadFrameThread = class(TThread)
  private
    FAttributes: TDicomAttribute;
    FStream: TDicomStream;
    procedure SetAttributes(const Value: tDicomAttribute);
    procedure SetStream(const Value: TDicomStream);
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean); virtual;
    destructor Destroy; override;
    procedure LoadFrames(AAttributes: TDicomAttribute; AStream: TDicomStream);
    property Attributes: tDicomAttribute read FAttributes write SetAttributes;
    property Stream: TDicomStream read FStream write SetStream;
  end;
  // FOMIN 30.10.2012
  TOnWriteFrame = procedure(Sender: TObject; AIndex: Integer; Ammount: Integer) of object;
  // END FOMIN 30.10.2012
  TDicomAttribute = class
  private
    FParent: TDicomAttributes;

    FGroup: Word;
    FElement: Word;
    // FOMIN 20.12.2012
//    FDict: TDDictEntry;

    dcm_type: Integer;

    FDataArray: TList;
    FDataType: TDicomDataType;

    //  FOMIN 30.10.2012
    FOnWriteFrame : TOnWriteFrame;
    //   END FOMIN 30.10.2012
    procedure AddNewData(AIndex: Integer);
    function writeVRHeaderWithLength(k1: TDicomStream;
      ALen: integer): Integer;
    function WriteDICOMDIRSQ(f1: TDicomStream): Integer;
    procedure ReadSQofOB_OWForThread(f1: TDicomStream);
    procedure ReadOB_OWForThread(f1: TDicomStream; Alen: Integer);
  protected
    procedure SeprateString(p1: PAnsiChar; ALen: Integer);
    procedure SeprateStringDA(p1: PAnsiChar; ALen: Integer);

    function ReadDatasets(f1: TDicomStream): TDicomAttributes;
    procedure ReadSQofOB_OW(f1: TDicomStream);
    procedure ReadSQ(f1: TDicomStream; datalen: Integer);
    procedure ReadOB_OW(f1: TDicomStream; Alen: Integer);
    procedure ReadData(f1: TDicomStream; ALen: Integer);
    procedure AddElements(f1: TDicomStream; ACount: Integer);
    procedure AddElement(f1: TDicomStream; AIndex, ACount: Integer);
    procedure _ReadAS(f1: TDicomStream; AIndex, ACount: Integer);
    procedure _ReadAT(f1: TDicomStream);
    procedure _ReadFloat(f1: TDicomStream);
    procedure _ReadDouble(f1: TDicomStream);
    procedure _ReadLong(f1: TDicomStream); //32
    procedure _ReadShort(f1: TDicomStream); //16 sign
    procedure _ReadInteger(f1: TDicomStream); //16 unsin
    procedure ReadDicomString(f1: TDicomStream; ALen: Integer);

    procedure ConvertValue(AIndex, i1: Integer);

    function GetAsImage(Aindex: Integer): TDicomImageData;
    function GetAsString(AIndex: Integer): AnsiString;
    procedure SetAsString(AIndex: Integer; AValue: AnsiString);

    function GetAsChineseString(AIndex: Integer): AnsiString;
    procedure SetAsChineseString(AIndex: Integer; AValue: AnsiString);

    function GetAsInteger(AIndex: Integer): Integer;
    procedure SetAsInteger(AIndex: Integer; AValue: Integer);
    function GetAsDatetime(AIndex: Integer): TDatetime;
    procedure SetAsDatetime(AIndex: Integer; AValue: TDatetime);
    function GetAsFloat(AIndex: Integer): Double;
    procedure SetAsFloat(AIndex: Integer; AValue: Double);
    function GetAttributes(AIndex: Integer): TDicomAttributes;
    function GetOBData(AIndex: Integer): TOBStream;

    function GetDescription: AnsiString;
    function getID: Integer;
    function GetVM: AnsiString;
    function GetVR: AnsiString;

    function GetText: AnsiString;

    function _WriteData(f1: TDicomStream): Integer;
    function _WriteElements(f1: TDicomStream): Integer;
    function _WriteSQ(f1: TDicomStream): Integer;
    function _WriteSQofOB_OW(f1: TDicomStream): Integer;
    function _WriteOB_OW(f1: TDicomStream; AIndex: Integer; ANeedLen: Boolean): Integer;
    function _WriteStringArray(f1: TDicomStream): Integer;

    function GetDataArrayAsString(AIndex: Integer): Ansistring;
    function _WriteElement(f1: TDicomStream; Aindex: Integer): Integer;
    function _WriteAS(f1: TDicomStream; Aindex: Integer): Integer;
    function _WriteAT(f1: TDicomStream; Aindex: Integer): Integer;
    function _WriteFloat(f1: TDicomStream; Aindex: Integer): Integer;
    function _WriteDouble(f1: TDicomStream; Aindex: Integer): Integer;
    function _WriteLong(f1: TDicomStream; Aindex: Integer): Integer; //32
    function _WriteShort(f1: TDicomStream; Aindex: Integer): Integer; //16 sign
    function _WriteInteger(f1: TDicomStream; Aindex: Integer): Integer; //16 sign
    function _WriteString(f1: TDicomStream; Aindex: Integer): Integer;

    function GetDataLen(ASyntax: Integer): Integer;
    function GetDataLenUndefineLength(ASyntax: Integer): Integer;
    function GetHeaderLen(ASyntax: Integer): Integer;

    procedure CombinImageData;
    procedure LoadFrameThreadTerminate(Sender: TObject);
  public
    // FOMIN 20.12.2012
    FDict: TDDictEntry;

    constructor Create(AOwner: TDicomAttributes); overload;
    constructor Create(AOwner: TDicomAttributes; AGroup, AElement: Word); overload;
    destructor Destroy; override;
    property Parent: TDicomAttributes read FParent write FParent;

    //  FOMIN 30.10.2012
    // if Assigned(FOnWriteFrame) then FOnWriteFrame(Self, AIndex, Ammount);
    property OnWriteFrame : TOnWriteFrame read FOnWriteFrame write FOnWriteFrame;
    //   END FOMIN 30.10.2012

    function writeVRHeader(k1: TDicomStream): Integer;
    procedure writeVRData(j: TDicomStream);
    function readVRHeader(h1: TDicomStream; var datalen: Integer): Boolean;
    function readVRData(f1: TDicomStream; const datalen: integer): Boolean;

    function GetCount: integer;
    procedure ClearDataArray;
    procedure Clear;

    procedure Assign(AValue: TDicomAttribute);
    function GetAsStrings: AnsiString;

    property DataArray: TList read FDataArray;
    property Group: Word read FGroup;
    property Element: Word read FElement;
    property Description: AnsiString read GetDescription;
    property VM: AnsiString read GetVM;
    property VR: AnsiString read GetVR;
    property ID: Integer read GetID;
    property Text: AnsiString read GetText;
    property DataType: TDicomDataType read FDataType;

    function AddData(AValue: Pointer): Integer;
    function InsertData(AIndex: Integer; AValue: Pointer): Integer;
    procedure LoadFromFile(AFileName: AnsiString);
    procedure SaveToFile(AFileName: AnsiString);
    procedure LoadFromStream(AStream: TStream);
    procedure SaveToStream(AStream: TStream);

    property AsString[Index: Integer]: AnsiString read getAsString write SetAsString;
    property AsFloat[Index: Integer]: Double read getAsFloat write SetAsFloat;
    property AsDatetime[Index: Integer]: TDatetime read getAsDatetime write SetAsDatetime;
    property AsInteger[Index: Integer]: Integer read getAsInteger write SetAsInteger;
    property Attributes[Index: Integer]: TDicomAttributes read GetAttributes;
    //    property AsImages[Index: Integer]: TDicomImageData read GetAsImage;
    property AsOBData[Index: Integer]: TOBStream read GetOBData;
  end;
  TOnSelectChangeEvent = procedure(Sender: TObject; ASelectedIndex: Integer) of object;
  TOnReadAttributeEvent = procedure(Sender: TObject; AAttribute: TDicomAttribute; APosition:
    Integer) of object;
  TDicomAttributes = class
  private
    FSelected: Boolean;
    FMultiSelected1: Boolean;
    FMultiSelected2: Boolean;
    FMultiSelected3: Boolean;
    FMultiSelected4: Boolean;

    FList: TList;
    FChanged: Boolean;
    FImageData: TDicomImage;
//    fWaveformData: TDicomWaveForm;

    fOnSelectChange: TOnSelectChangeEvent;
    fOnReadAttribute: TOnReadAttributeEvent;
    FOnLoadFrame: TNotifyEvent;
    FOnLoadFrameFinish: TNotifyEvent;
    FBufferLength: TDicomImageBufferLength;

    function GetWaveformData: TDicomWaveForm;

    function GetMultiSelected1: Boolean;
    function GetMultiSelected2: Boolean;
    function GetMultiSelected3: Boolean;
    function GetMultiSelected4: Boolean;
    procedure SetOnLoadFrame(const Value: TNotifyEvent);
    procedure SetOnLoadFrameFinish(const Value: TNotifyEvent);
    procedure SetBufferLength(const Value: TDicomImageBufferLength);
  protected
    function GetCount: Integer;
//    function GetItem(AGroup: Integer; AElement: Integer): TDicomAttribute;
    function GetItemByIndex(Index: Smallint): TDicomAttribute;
    function GetItemByContant(Index: Smallint): TDicomAttribute;
    function FindItem(AGroup: Word; AElement: Word; var AIndex: Integer): Boolean;
    function FindByContant(AID: Integer; var AIndex: Integer): Boolean;
    function GetImageData: TDicomImage;
    function GetImageDataEx: TDicomImage;

    procedure SetMultiSelected1(Value: Boolean);
    procedure SetMultiSelected2(Value: Boolean);
    procedure SetMultiSelected3(Value: Boolean);
    procedure SetMultiSelected4(Value: Boolean);

    procedure DoNewAttribute(Sender: TObject; AAttribute: TDicomAttribute; APosition: Integer);
  public
    fWaveformData: TDicomWaveForm;

    procedure Sort;
    constructor Create; virtual;
    destructor Destroy; override;

    function GetItem(AGroup: Integer; AElement: Integer): TDicomAttribute;

    procedure RemoveImageData;
    function IsImageChange: Boolean;

    procedure ListAttrinute(APreString: AnsiString; AStrs: tstrings);
    function Add(AGroup: Integer; AElement: Integer): TDicomAttribute; overload;
    function Add(AValue: TDicomAttribute): TDicomAttribute; overload;
    procedure Remove(AGroup: Integer; AElement: Integer);
    procedure Clear;
    procedure DoAfterLoad; overload;
    procedure DoAfterLoad(AValue: TDicomAttributes); overload;

    function GetDatalen(ASyntax: Integer): Integer; overload;
    function GetDatalen(AGroup, ASyntax: Integer): Integer; overload;
    procedure AddAllGrouplength(ASyntax: Integer);

    procedure Assign(AValue: TDicomAttributes);
    procedure AssignImage(AValue: TDicomAttributes; ASelX1, ASelY1, ASelX2, ASelY2: Integer);

    procedure AddVariant(AContant: Integer; Value: Integer); overload;
    procedure AddVariant(AContant: Integer; Value: AnsiString); overload;
    procedure AddVariant(AGroup: Integer; AElement: Integer; Value: Integer); overload;
    procedure AddVariant(AGroup: Integer; AElement: Integer; Value: AnsiString); overload;
    function getInteger(AContant: Integer): Integer; overload;
    function GetString(AContant: Integer): AnsiString; overload;
    function getInteger(AGroup: Integer; AElement: Integer): Integer; overload;
    function GetString(AGroup: Integer; AElement: Integer): AnsiString; overload;

    function ReadHeader(AStream: TStream): Integer;
    procedure ReadData(AFrom: integer; AStream: TStream; ASyntax: Integer; AKeepStream: Boolean =
      false; ALoadFrameInThread: Boolean = false);
    procedure ReadDataPDUCommand(AFrom: integer; AStream: TStream; ASyntax: Integer);
    procedure ReadDataPDUData(AFrom: integer; AStream: TStream; ASyntax: Integer);
    procedure Write(AStream: TStream; ASyntax, AJpegQuality: Integer; AKeepStream: Boolean =
      false; AOnlyCurrentFrame: Integer = -1);
    procedure LoadDataset(ADataset: TDataset; AFrom, AFecthCount: integer; AMemoFilter:
      TDicomAttribute = nil);
    procedure FillResultDataset(ADataset: TDataset; FetchCount: Integer; ANeedStruct: Boolean);
    //procedure LoadDataset(ADataset: TDataset; AFrom, AFecthCount: integer);overload;

    property Count: Integer read GetCount;
    property Item[AGroup: Integer; AElement: Integer]: TDicomAttribute read GetItem; default;
    property ItemByIndex[Index: Smallint]: TDicomAttribute read GetItemByIndex;
    property ItemByContant[Index: Smallint]: TDicomAttribute read GetItemByContant;
    property ImageData: TDicomImage read GetImageData;
    property ImageDataEx: TDicomImage read GetImageDataEx;

    property WaveFormData: TDicomWaveForm read GetWaveformData;

    property Selected: Boolean read FSelected write FSelected;
    property MultiSelected1: Boolean read GetMultiSelected1 write SetMultiSelected1;
    property MultiSelected2: Boolean read GetMultiSelected2 write SetMultiSelected2;
    property MultiSelected3: Boolean read GetMultiSelected3 write SetMultiSelected3;
    property MultiSelected4: Boolean read GetMultiSelected4 write SetMultiSelected4;
    property BufferLength: TDicomImageBufferLength read FBufferLength write SetBufferLength;

    property OnSelectChange: TOnSelectChangeEvent read fOnSelectChange write fOnSelectChange;
    property OnReadAttribute: TOnReadAttributeEvent read fOnReadAttribute write fOnReadAttribute;

    property OnLoadFrame: TNotifyEvent read FOnLoadFrame write SetOnLoadFrame;
    property OnLoadFrameFinish: TNotifyEvent read FOnLoadFrameFinish write SetOnLoadFrameFinish;
  end;
  TDicomDataset = class
  private
    FUserModify: Boolean;
    FAttributes: TDicomAttributes;
    FInfoAttributes: TDicomAttributes;

    FImageStream: TStream;
    FImageFilename: AnsiString;
    FDeleteImageFile: Boolean;

    FImageIndex: Integer;
    FSeriesNumber: Integer;
    FSeriesUID: AnsiString;
    FStudyUID: AnsiString;
    FInstanceUID: AnsiString;
    fLabelPosition: TDicomDrawObjectLabelPosition;

    fOnReadAttribute: TOnReadAttributeEvent;
    FOnLoadFrame: TNotifyEvent;
    FOnLoadFrameFinish: TNotifyEvent;
    FOnAfterLoad: TNotifyEvent;

    //    FCustomImageIndex: Integer;
    FBufferLength: TDicomImageBufferLength;

    procedure SetImageIndex(const Value: Integer);
    procedure SetInstanceUID(const Value: AnsiString);
    procedure SetSeriesNumber(const Value: Integer);
    procedure SetSeriesUID(const Value: AnsiString);
    procedure SetStudyUID(const Value: AnsiString);
    procedure SetLabelPosition(const Value: TDicomDrawObjectLabelPosition);
    procedure SetOnLoadFrame(const Value: TNotifyEvent);
    procedure SetOnLoadFrameFinish(const Value: TNotifyEvent);
    procedure SetCustomImageIndex(const Value: Integer);
    function GetImageIndex: Integer;
    function GetInstanceUID: AnsiString;
    function GetSeriesNumber: Integer;
    function GetSeriesUID: AnsiString;
    function GetStudyUID: AnsiString;
    procedure SetBufferLength(const Value: TDicomImageBufferLength);
    procedure SetOnAfterLoad(const Value: TNotifyEvent);
  protected
    // FOMIN 25.12.2012
//    function PrepareInfoAttributes(ATransferSyntax: Integer): Integer;
    function ReadFlag(AStream: TStream): Boolean;
    procedure DoNewAttribute(Sender: TObject; AAttribute: TDicomAttribute; APosition: Integer);
    procedure DoLoadFrame(Sender: TObject);
    procedure DoLoadFrameFinish(Sender: TObject);
  public
    vErrorSaveText : AnsiString;
    constructor Create; overload;
    constructor Create(AData: TDicomAttributes); overload;
    destructor Destroy; override;
    procedure ResetDataToStream;
    procedure ResaveToStream;
    procedure DeleteStream;

    // FOMIN 25.12.2012
    function PrepareInfoAttributes(ATransferSyntax: Integer): Integer;

    procedure SaveDICOMDIRToStream(const Stream: TStream);
    procedure SaveDICOMDIRToFile(const AFileName: AnsiString);
    // процедура записи в лог-файл
    procedure MnLg_ev ( const p_strs : ansistring;
                        const p_filename : ansistring = '';
                        const p_is_delim : Boolean = False;
                        const p_is_DT : boolean = True );

    procedure SaveToStream(const Stream: TStream; isPart10: Boolean; ATransferSyntax: Integer;
      Quality: integer; AKeepStream: Boolean = false; AOnlyCurrentFrame: Integer = -1);
    procedure SaveToFile(const AFileName: AnsiString; isPart10: Boolean; ATransferSyntax: Integer;
      Quality: integer; AKeepStream: Boolean = false; AMustDelete: Boolean = false);
    function LoadFromStream(const AStream: TStream; AKeepStream: Boolean = false;
      ALoadFrameInThread: Boolean = false): Boolean;
    function LoadFromFile(AFileName: AnsiString; AKeepStream: Boolean = false; ALoadFrameInThread:
      Boolean = false): Boolean;
    procedure SaveAsRawFile(AFileName: AnsiString);
    procedure SaveFramesAsRawFile(AFileNamePerfix: AnsiString);

    procedure RecreateAttributes;
    procedure SetStreamAndFileName(AStream: TStream; AFileName: AnsiString; CanBeDelete: Boolean);

    property StudyUID: AnsiString read GetStudyUID write SetStudyUID;
    property SeriesUID: AnsiString read GetSeriesUID write SetSeriesUID;
    property SeriesNumber: Integer read GetSeriesNumber write SetSeriesNumber;
    property InstanceUID: AnsiString read GetInstanceUID write SetInstanceUID;
    property ImageIndex: Integer read GetImageIndex write SetImageIndex;

    //    property CustomImageIndex: Integer read FCustomImageIndex write SetCustomImageIndex;

    property LabelPosition: TDicomDrawObjectLabelPosition read fLabelPosition write
      SetLabelPosition;
    property Attributes: TDicomAttributes read FAttributes write FAttributes;
    property InfoAttributes: TDicomAttributes read FInfoAttributes;
    property UserModify: Boolean read FUserModify write FUserModify;

    property ImageStream: TStream read FImageStream;
    property ImageFilename: AnsiString read FImageFilename write FImageFilename;
    property DeleteImageFile: Boolean read FDeleteImageFile write FDeleteImageFile;
    property BufferLength: TDicomImageBufferLength read FBufferLength write SetBufferLength;

    property OnReadAttribute: TOnReadAttributeEvent read fOnReadAttribute write fOnReadAttribute;

    property OnLoadFrame: TNotifyEvent read FOnLoadFrame write SetOnLoadFrame;
    property OnLoadFrameFinish: TNotifyEvent read FOnLoadFrameFinish write SetOnLoadFrameFinish;

    property OnAfterLoad: TNotifyEvent read FOnAfterLoad write SetOnAfterLoad;
  end;
  TModilityChangeEvent = procedure(Sender: TObject; AModility: AnsiString) of object;
  TAddDatasetEvent = procedure(Sender: TObject; ADataset: TDicomDataset) of object;

  TDicomDatasetSortBy = (dsbImageNumber, dsbSliceLocation, dsbReverseSliceLocation,
    dsbAcquisitionTime, dsbImageTime);

  TSeriesList = class
  private
    FDatasetList: TList;
    fStudyUID: AnsiString;
    fSeriesUID: AnsiString;
    fSeriesNumber: Integer;

    function GetSeriesNumber: Integer;
    function GetSeriesUID: AnsiString;
    function GetStudyUID: AnsiString;
    procedure SetSeriesNumber(const Value: Integer);
    procedure SetSeriesUID(const Value: AnsiString);
    procedure SetStudyUID(const Value: AnsiString);
    function GetItems(index: Integer): TDicomDataset;
    procedure SetItems(index: Integer; const Value: TDicomDataset);

  protected
    procedure Sort;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(ADataset: TDicomDataset);
    procedure Remove(ADataset: TDicomDataset);

    property Items[index: Integer]: TDicomDataset read GetItems write SetItems;
    property DatasetList: TList read FDatasetList;
    property StudyUID: AnsiString read GetStudyUID write SetStudyUID;
    property SeriesUID: AnsiString read GetSeriesUID write SetSeriesUID;
    property SeriesNumber: Integer read GetSeriesNumber write SetSeriesNumber;
  published

  end;

  TStudyList = class
  private
    FSeriesLists: TList;
    fStudyUID: string;

    function GetStudyUID: AnsiString;

    procedure SetStudyUID(const Value: AnsiString);
    function GetItems(index: Integer): TSeriesList;
    function GetSeriesByUID(index: string): TSeriesList;
  protected
    function Add: TSeriesList;
    function FindSeries(ASeriesUID: string): TSeriesList;
    procedure Sort;
  public
    constructor Create;
    destructor Destroy; override;

    procedure clear;
    function AddDataset(ADataset: TDicomDataset): Boolean;
    function RemoveDataset(ADataset: TDicomDataset): Boolean;

    property Series[index: Integer]: TSeriesList read GetItems;
    property SeriesByUID[index: string]: TSeriesList read GetSeriesByUID;

    property SeriesLists: TList read FSeriesLists;
    //property StudyUID: AnsiString read GetStudyUID write SetStudyUID;

  published

  end;

  TDicomDatasets = class(TComponent)
  private
    fOnlyViewMultiSelected1: Boolean;
    fOnlyViewMultiSelected2: Boolean;
    fOnlyViewMultiSelected3: Boolean;
    fOnlyViewMultiSelected4: Boolean;

    FLockCount: Integer;
    FDatasetList: TList;
    //    FStudySet: TStudyList;

    FModility: AnsiString;
    FTopoDicomDatasets: TList;
    FSeriesList: TList;

    //    FOnModilityChange: TModilityChangeEvent;
    //    FOnDatasetChange: TNotifyEvent;
    FOnAddDataset: TAddDatasetEvent;

    fOnReadAttribute: TOnReadAttributeEvent;
    FOnLoadFrameFinish: TNotifyEvent;
    FOnLoadFrame: TNotifyEvent;
    fOnAfterLoad: TNotifyEvent;

    fLabelPosition: TDicomDrawObjectLabelPosition;

    FAutoShowReffrenceLine: Boolean;
    FBufferLength: TDicomImageBufferLength;
    fOnRemoveDataset: TAddDatasetEvent;
    FImageOrder: TDicomDatasetSortBy;
    procedure SetOnlyViewMultiSelected1(const Value: Boolean);
    procedure SetOnlyViewMultiSelected2(const Value: Boolean);
    procedure SetOnlyViewMultiSelected3(const Value: Boolean);
    procedure SetOnlyViewMultiSelected4(const Value: Boolean);
    function GetItemByInstanceUID(Value: AnsiString): TDicomDataset;
    procedure SetLabelPosition(const Value: TDicomDrawObjectLabelPosition);

    procedure SetAutoShowReffrenceLine(const Value: Boolean);
    procedure SetBufferLength(const Value: TDicomImageBufferLength);
    procedure SetOnAfterLoad(const Value: TNotifyEvent);
    procedure SetOnLoadFrame(const Value: TNotifyEvent);
    procedure SetOnLoadFrameFinish(const Value: TNotifyEvent);
    procedure SetImageOrder(const Value: TDicomDatasetSortBy);
  protected
    function GetCount: Integer; virtual;
    function GetItemByIndex(Index: Smallint): TDicomDataset; virtual;
    function GetSelected(AIndex: Integer): TDicomAttributes; virtual;
    function GetSelectedForPrint(AIndex: Integer): TDicomAttributes; virtual;
    //    procedure VerifityDataset;
    function GerSeries(index: Integer): TDicomDataset;

    procedure DoNewAttribute(Sender: TObject; AAttribute: TDicomAttribute; APosition: Integer);
    procedure DoLoadFrame(Sender: TObject);
    procedure DoLoadFrameFinish(Sender: TObject);

    procedure DoAfterLoadDicomDataset(Sender: TObject);
    procedure DoBeforeRemoveDicomDataset(Sender: TObject);

    function FindIndexOf(ADataset: TDicomDataset): integer;
    function FindIndexOfSeries(ADataset: TDicomDataset): integer;

    procedure BuildSeriesList;
    procedure BuildSelectList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ResaveToStream;
    function GetSelectedCount: integer;
    function GetSelectedCountForPrint: integer; virtual;
    procedure SortDatasets(AMode: TDicomDatasetSortBy);

    function IndexOf(ADataset: TDicomDataset): Integer;
    function GetCurrentSeriesIndex(ADataset: TDicomDataset): Integer;
    function GetCurrentSeriesStart(ADataset: TDicomDataset): Integer;
    function GetSeriesEnd(ASeriesUID: AnsiString): Integer;
    function GetSeriesStart(ASeriesUID: AnsiString): Integer;

    procedure SetPresentationSates(ADatasets: TDicomDatasets);
    procedure SwapDataDataset(AIndex1, AIndex2: Integer);

    function FindSliceLocationOnSeries(ASeriesUID: string; ADataset: TDicomDataset): Integer; overload;
    function FindSeriesIndexOnSeries(ASeriesUID: string; ADataset: TDicomDataset): Integer; overload;
    function FindSeriesImageTimeOnSeries(ASeriesUID: string; ADataset: TDicomDataset): Integer; overload;
    function FindSeriesAcquisitionTimeOnSeries(ASeriesUID: string; ADataset: TDicomDataset): Integer; overload;

    function FindSliceLocationOnSeries(ASeriesUID: string; ADataset: TDicomAttributes): Integer; overload;
    function FindSeriesIndexOnSeries(ASeriesUID: string; ADataset: TDicomAttributes): Integer; overload;
    function FindSeriesImageTimeOnSeries(ASeriesUID: string; ADataset: TDicomAttributes): Integer; overload;
    function FindSeriesAcquisitionTimeOnSeries(ASeriesUID: string; ADataset: TDicomAttributes): Integer; overload;

    procedure SetTopoDataset(AAttributes: TDicomAttributes);
    function AddTopoDataset(AValue: TDicomDataset; AIndex: Integer; AutoDefineTopo: Boolean):
      TDicomDrawObject;
    procedure ClearTopo;
    procedure AddTopoAndClearLine;
    procedure ClearTopoLine(AImage: TDicomAttributes);
    procedure ScanTopoDataset(AutoDefineTopo: Boolean = TRUE);
    procedure ScanFLTopoDataset(AutoDefineTopo: Boolean = TRUE);
    procedure ScanSeriesTopoDataset(AAttributes: TDicomAttributes; AutoDefineTopo: Boolean =
      false);
    procedure ScanSeriesFLTopoDataset(AAttributes: TDicomAttributes; AutoDefineTopo: Boolean);

    procedure ResetDataToStream;

    procedure PrintImage(ACanvas: TCanvas; rc: TRect; AIndex: Integer; AIsSelected: Boolean);
      virtual;
    procedure PrintImages(ACanvas: TCanvas; rc: TRect; var AIndex: Integer; ax, ay: Integer;
      AIsSelected: Boolean);

    function LoadFromStream(const AStream: TStream; AKeepStream: Boolean = false): TDicomDataSet; virtual;
    function LoadFromFile(AFileName: AnsiString; AKeepStream: Boolean = false; ALoadFrameInThread:
      Boolean = false): TDicomDataSet; virtual;

    procedure SaveAsRawFile(ASeriesUID, AFileNamePerfix: AnsiString);

    function NewDicomDataset(AStudyUID, ASeriesUID, AInstanceUID: AnsiString; ASeriesNo, AImageNo: Integer): TDicomDataset; overload;
    function NewDicomDataset(ADicomAttributes: TDicomAttributes): TDicomDataset; overload;

    procedure AddDicomDataset(ADicomDataset: TDicomDataset);
    procedure InsertDicomDataset(AIndex: integer; ADicomDataset: TDicomDataset);

    procedure Add(ADicomDataset: TDicomDataset);
    procedure Insert(AIndex: integer; ADicomDataset: TDicomDataset);
    procedure Clear; virtual;

    procedure ClearList;
    procedure ResetModify;
    procedure ResetUnModify;
    procedure RemoveSelected;
    procedure RemoveDataset(AIndex: Integer);
    function DeleteSelectedImages: AnsiString;

    function GetSeriesCount: Integer;

    function GetSeriesImageCount(ASeriesUID: string): Integer; overload;
    function GetSeriesImageCount(AIndex: Integer): Integer; overload;
    function GetSeriesImageCount(ADataset: TDicomDataset): Integer; overload;

    property SeriesDataset[Index: Integer]: TDicomDataset read GerSeries;
    property Count: Integer read GetCount;
    property LockCount: Integer read FLockCount write FLockCount;
    procedure Remove(ADicomDataset: TDicomDataset); overload;
    procedure Delete(AIndex: Integer);
    procedure Remove(ADicomDataset: TDicomAttributes); overload;

    //    property StudySet: TStudyList read FStudySet;
    property Item[Index: Smallint]: TDicomDataset read GetItemByIndex; default;
    property ItemByInstanceUID[Value: AnsiString]: TDicomDataset read GetItemByInstanceUID;
    property Selected[Index: Integer]: TDicomAttributes read GetSelected;
    property SelectedForPrint[Index: Integer]: TDicomAttributes read GetSelectedForPrint;

    property LabelPosition: TDicomDrawObjectLabelPosition read fLabelPosition write
      SetLabelPosition;
    property BufferLength: TDicomImageBufferLength read FBufferLength write SetBufferLength;

    property OnlyViewMultiSelected1: Boolean read fOnlyViewMultiSelected1 write
      SetOnlyViewMultiSelected1;
    property OnlyViewMultiSelected2: Boolean read fOnlyViewMultiSelected2 write
      SetOnlyViewMultiSelected2;
    property OnlyViewMultiSelected3: Boolean read fOnlyViewMultiSelected3 write
      SetOnlyViewMultiSelected3;
    property OnlyViewMultiSelected4: Boolean read fOnlyViewMultiSelected4 write
      SetOnlyViewMultiSelected4;

    property ImageOrder: TDicomDatasetSortBy read FImageOrder write SetImageOrder;
  published
    property AutoShowReffrenceLine: Boolean read FAutoShowReffrenceLine write
      SetAutoShowReffrenceLine;

    //    property OnModilityChange: TModilityChangeEvent read FOnModilityChange write FOnModilityChange;
    //    property OnDatasetChange: TNotifyEvent read FOnDatasetChange write FOnDatasetChange;
    property OnAddDataset: TAddDatasetEvent read FOnAddDataset write FOnAddDataset;
    property OnRemoveDataset: TAddDatasetEvent read fOnRemoveDataset write fOnRemoveDataset;

    property OnReadAttribute: TOnReadAttributeEvent read fOnReadAttribute write fOnReadAttribute;
    property OnLoadFrame: TNotifyEvent read FOnLoadFrame write SetOnLoadFrame;
    property OnLoadFrameFinish: TNotifyEvent read FOnLoadFrameFinish write SetOnLoadFrameFinish;
    property OnAfterLoad: TNotifyEvent read FOnAfterLoad write SetOnAfterLoad;
  end;

  { TDicomImageLookupTable = class
   private
     fLookupTableData: PByteArray;
     fLookupTableLength: Integer;
     fLookupTableLength_1: Integer;
     FUseBits: Integer;

     fLastWindow: integer;
     fLastCenter: Integer;
     fLastNegative: Boolean;

   public
     constructor Create(ABits: Integer);
     destructor Destroy; override;

     function GetData(ACurve: array of integer; ANegative: Boolean): Pointer; overload;
     function GetData(AWidth, ALevel: Integer; ANegative: Boolean): Pointer; overload;

     property UseBits: Integer read FUseBits;
   end;

   {  TDicomImageLookupTables = class
     private
       fList: TList;
     public
       constructor Create;
       destructor Destroy; override;

       function GetData(AUseBits, AWidth, ALevel: Integer; ACurve: array of integer; ANegative:
         Boolean): Pointer; overload;
       function GetData(AUseBits, AWidth, ALevel: Integer; ANegative: Boolean): Pointer; overload;
     end;  }

  TDicomCustomMemTable = class(TDataset)
  private
    FDataArray: TList;
  protected
    function GetActive: Boolean;
  public
    constructor Create(AOwner: TComponent; AData: TDicomAttribute); overload;
    destructor Destroy; override;

    property Active: Boolean read getActive;
  end;

  TTimerExt = class(TComponent)
  private
    FInterval: Cardinal;
    FCounter: Integer;
    FWindowHandle: HWND;
    FEnabled: Boolean;
    procedure UpdateTimer;
    procedure SetEnabled(Value: Boolean);
    procedure SetInterval(Value: Cardinal);
    procedure WndProc(var Msg: TMessage);
  protected
    procedure Timer; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled;
    property Interval: Cardinal read FInterval write SetInterval;
  end;

  TOnAddImageEvent = procedure(Sender: TObject; ADataset: TDicomDataset; AImageIndex: Integer) of
    object;
  TDicomAttributesNeedSaveEvent = procedure(Sender: TObject; ADatasets: TDicomDatasets;
    IsSaveImage: Boolean) of object;
  TOnPopupMenuClickEvent = procedure(Sender: TObject; ATag: Integer) of object;
  TOnDicomPrintClickEvent = procedure(Sender: TObject; Attribute: TDicomAttributes) of object;

  TWinLevelChangeEvent = procedure(Sender: TObject; W, L: integer) of object;
  TImageScrollChangeEvent = procedure(Sender: TObject; X, Y: Double) of object;
  TImageZoomChangeEvent = procedure(Sender: TObject; Z: Double) of object;
  TDicomImageCineToEvent = procedure(Sender: TObject; AIndex: Integer) of object;
  TDicomImageStackToEvent = procedure(Sender: TObject; AOldIndex, ANewIndex: Integer) of object;
  //  TOnGetZoomFilterEvent = procedure(Sender: TObject; ADas: TDicomAttributes;
  //    var AFilter: TResampleFilter; var ADisplayInfo: Boolean; var AMinZoom, AMaxZoom: integer) of object;
  TDicomImageLockEvent = procedure(Sender: TObject; ALock: Boolean) of object;
  TDicomLockChangeEvent = procedure(Sender: TObject; ALockCount: Integer) of object;

  TDicomImageTopoLineClickEvent = procedure(Sender: TObject; AImageIndex: Integer) of object;

  TDicomImageCanLockEvent = procedure(Sender: TObject; var ACanLock: Boolean) of object;
  TDrawObjectNotifyEvent = procedure(Sender: TObject; AObject: TDicomDrawObject) of object;

  TDicomImageToolbarShowEvent = procedure(Sender: TObject; AConerIndex: Integer) of object;

  TDicomImagePresetWidthLevelEvent = procedure(Sender: TObject; AKey: Integer; Shift: TShiftState; var AWindowWidth, AWindowLevel) of object;

  TOn3DCursorEvent = procedure(Sender: TObject; X, Y: Single) of object;

  TOnDragDropToPrintEvent = procedure(Sender, Source: TObject; ADatasets: TDicomDatasets; AIndex: Integer) of object;
  TOnOverlayLabelEvent = procedure(AView: TObject; Dest: TObject; var AUserWrite: Boolean) of object;

type
  { Built-in sampling filters.}
  TSamplingFilter = (sfNearest, sfLinear, sfCosine, sfHermite, sfQuadratic,
    sfGaussian, sfSpline, sfLanczos, sfMitchell, sfCatmullRom);
  { Type of custom sampling function}
  TFilterFunction = function(Value: Single): Single;
  { Stretches rectangle in source image to rectangle in destination image
    with resampling. One of built-in resampling filters defined by
    Filter is used. Set WrapEdges to True for seamlessly tileable images.
    SrcImage and DstImage must be in the same data format.
    Works for all data formats except special and indexed formats.}
procedure StretchResample(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TSamplingFilter; WrapEdges: Boolean = False); overload;
{ Stretches rectangle in source image to rectangle in destination image
  with resampling. You can use custom sampling function and filter radius.
  Set WrapEdges to True for seamlessly tileable images. SrcImage and DstImage
  must be in the same data format.
  Works for all data formats except special and indexed formats.}
procedure StretchResample(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TFilterFunction; Radius: Single;
  WrapEdges: Boolean = False); overload;

procedure StretchResampleFloat(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TSamplingFilter; WrapEdges: Boolean = False); overload;
{ Stretches rectangle in source image to rectangle in destination image
  with resampling. You can use custom sampling function and filter radius.
  Set WrapEdges to True for seamlessly tileable images. SrcImage and DstImage
  must be in the same data format.
  Works for all data formats except special and indexed formats.}
procedure StretchResampleFloat(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TFilterFunction; Radius: Single;
  WrapEdges: Boolean = False); overload;

procedure StretchResampleWord(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TSamplingFilter; WrapEdges: Boolean = False); overload;
{ Stretches rectangle in source image to rectangle in destination image
  with resampling. You can use custom sampling function and filter radius.
  Set WrapEdges to True for seamlessly tileable images. SrcImage and DstImage
  must be in the same data format.
  Works for all data formats except special and indexed formats.}
procedure StretchResampleWord(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TFilterFunction; Radius: Single;
  WrapEdges: Boolean = False); overload;

function CopyAttributes(ADataset: TDicomAttributes): TDicomAttributes;
function TimeToDicomStr(ATime: TDatetime): AnsiString;
function DateToDicomStr(ADate: TDatetime): AnsiString;
function DateTimeToDicomStr(ADateTime: TDatetime): AnsiString;
function FloatToDicomStr(AValue: Double): AnsiString;
function IntToDicomStr(AValue: Integer): AnsiString;
function GetImageGrid(pImageCount: Integer): TPoint;
procedure printBitmap(ACanvas: TCanvas; DestRect: TRect; Bitmap: TBitmap);
procedure printBitmapEx(ACanvas: TCanvas; Dest: TRect; Bitmap: TBitmap);
procedure DeleteFiles(const Path, Mask: AnsiString; recursive: boolean);
function Getphotometric(AStr: AnsiString): Integer;

function DicomStrToTime(AStr: AnsiString): TDatetime;
function DicomStrToDate(AStr: AnsiString): TDatetime;
function DicomStrToDateTime(AStr: AnsiString): TDatetime;

procedure RLEdecodeBytes(AData: Pointer; ALen: Integer; AOutputData: Pointer; AOutputLen: Integer);
procedure DecodeSegmentedPaletteColorLookupTableDataBytes(AData: Pointer; ALen: Integer;
  AOutputData: Pointer; AOutputLen: Integer);
procedure FastRLEdecodeBytes(AData: Pointer; ALen, AWidth, AHeight, ABits, ASamplePerPixel:
  Integer; AOutputData: Pointer; APlanarConfiguration: Integer);
procedure FastRLEencodeBytes(AData: Pointer; ALen, AWidth, AHeight, ABits, ASamplePerPixel,
  APlanarConfiguration:
  Integer; AStm: TStream);
procedure SaveDicomDatasetsToDicomDir(ADatasets: TDicomDatasets; BaseDir: AnsiString;
  AOnlySaveKeyImage: Boolean);
procedure AddPatientToDICOMDIR(ADataset: TDicomAttribute; as1: TDicomAttributes; AFileName,
  AStudyReport:
  AnsiString);
procedure SaveDicomDatasetsAsHtml(AHosName: AnsiString; ADatasets: TDicomDatasets; BaseDir: AnsiString;
  AOnlySaveKeyImage, AWithLabel: Boolean);
procedure SaveDicomImage(LocaleImagePath: AnsiString; ADataset: TDicomDataset);

function NewImage(ADataset: TDicomAttributes; ABitmap: TBitmap; AIsMONOCHROME: Boolean):
  TDicomAttributes; overload;
function NewImage(ABitmap: TBitmap; AIsMONOCHROME: Boolean): TDicomAttributes; overload;
function NewImage(ADa: TDicomAttributes): TDicomAttributes; overload;
function NewImage(ABitmap: PBITMAPINFO; AIsMONOCHROME: Boolean): TDicomAttributes; overload;

function NewImageForPrint(ADa: TDicomAttributes; ACutRect: TRect): TDicomAttributes; overload;
function NewImageForPrint(ADa: TDicomAttributes): TDicomAttributes; overload;

function AssignedImage(ASource: TDicomAttributes; ABitmap: TBitmap; AIsMONOCHROME: Boolean):
  Boolean;
function ComputeIntersectLine(ADataset1, ADataset2: TDicomAttributes): TStructLine2D;
function ComputeAxPosition(ADataset1, ADataset2: TDicomAttributes; X, Y: Double): TStructMatrix2D;

function DicomStrToFloat(AStr: AnsiString): Double;
function SpritRect(ARect: TRect; x, y, l: Integer): TRect;
function imin(v1, v2: integer): integer;
function imax(v1, v2: integer): integer;
function ilimit(vv, min, max: integer): integer;
function blimit(vv: integer): integer;

function ClipLine(var X1, Y1, X2, Y2: Integer; MinX, MinY, MaxX, MaxY: Integer): Boolean;
function CalAngle(x1, y1, x2, y2, x3, y3: Double): Double;
function _PasteFromClipboard(fBitmap: TBitmap): Boolean;
procedure _KxCopyBitmapPoly(Source: TBitmap; Dest: TBitmap; sx1, sy1, sx2, sy2: integer);
function _Angle(x1, y1, x2, y2, x3, y3: integer): double;

function FilterISO1022(AStr: AnsiString): AnsiString;
function ConvertISO1022(AStr: AnsiString): AnsiString;

function pointMultiply(aVector: TStructMatrix2D; value: Single): TStructMatrix2D;
function pointDistance(aVector, bVector: TStructMatrix2D): Single;
function pointNormal(aVector: TStructMatrix2D): Single;
function pointDot(aVector, bVector: TStructMatrix2D): Double;
function pointAdd(aVector, bVector: TStructMatrix2D): TStructMatrix2D;
function pointSub(aVector, bVector: TStructMatrix2D): TStructMatrix2D;
function dist_Point_to_Segment(P: TStructMatrix2D; S: TStructLine2D; var CrossP: TStructMatrix2D;
  var radio: Double):
  Double;
function convertPixX(das: TDicomAttributes; x, y: Double; pixelCenter: Boolean): TStructMatrix3D;
function ArbitraryRotate(p: TStructMatrix3D; theta: double; r1: TStructMatrix3D): TStructMatrix3D;

//procedure glGenTextures(n: GLsizei; var textures: GLuint); stdcall; external opengl32;
//procedure glBindTexture(target: GLenum; texture: GLuint); stdcall; external opengl32;
procedure SaveImageToJpeg2000(ADataset: TDicomDataset; AFileName: AnsiString);
function DicomDatasetIsTopo(FDicomDataset: TDicomDataset): Boolean;

// dist_Point_to_Segment(): get the distance of a point to a segment.
//    Input:  a Point P and a Segment S (in any dimension)
//    Return: the shortest distance from P to S

function SqLineMagnitude(const x1, y1, x2, y2: extended): extended;
//function DistancePointLine(const px, py, x1, y1, x2, y2: extended): extended;

function CompareSeriesDicomDataset(Item1, Item2: Pointer): Integer;
function CompareDicomDataset(Item1, Item2: Pointer): Integer;
function CompareDicomDataset1(Item1, Item2: Pointer): Integer;
function CompareDicomDataset2(Item1, Item2: Pointer): Integer;
function CompareDicomDataset3(Item1, Item2: Pointer): Integer;
function CompareDicomDataset4(Item1, Item2: Pointer): Integer;

function LookupTableResource(Index: Integer; var LutName: string): TStream; overload;
function LookupTableResource(Index: string): TStream; overload;

function GetAge(AD1, AD2: TDatetime): string;

var
  ECLTempFileIndex: Integer;
  ECLTempPath: AnsiString;
  DicomTempPath: AnsiString;
  //  ImageOverlayDataset: TDataset;
  OverlayTextLevel: integer;
  //  TextOverlayMode: Boolean;
  QuickWindowMode: Boolean;
  DefaultWindowMouseMode: Boolean;
  RuntimeTextInBitmapMode: Boolean;
  //  WLLut: TDicomImageLookupTables;

  CnsExpireTimer: TTimerExt;

  DicomImplementationClassUID: AnsiString;
  DicomImplementationVersionName: AnsiString;
  {  g_CoordVertex: array of array of Word;
    g_EdgeTable: array[0..255] of word;
    g_CoordTable: array of array of word;
    g_TriTable: array of array of word;  }

const c_partition = 3;
      c_kletka = 15;   // шаг клетки в пикселях
//      c_height = 2*3*2*c_kletka ; // 3 вверх и 3 вниз от центральной линии
var
  // настройки ЭКГ
  v_color_fon_ECG ,             // Цвет фона ЭКГ
  v_color_rzd_ECG ,             // Цвет разделителей
  v_color_text_ECG,             // Цвет текста
  v_otmetka_ECG,                // отметка
  v_color_line_ECG : TColor;    // Цвет кривой ЭКГ
  v_font_ECG       : TFont;     // Шрифт
  v_size_font_ECG  : integer;   // Размер шрифта
  v_bold_font_ECG  ,            // Жирный шрифт
  v_italic_font_ECG  : Boolean; // Под наклоном
  v_color_rzd_grp_ECG  : TColor; // Цвет разделителей групп
  v_size_line_rzd_ECG  : integer;   // толщина линии разделителя
  v_size_line_ECG  : integer;   // толщина кривой ЭКГ
  v_height_channel_ECG : integer; // высота полосы отведения на графике ЭКГ

implementation

{$R Dcm_ViewCursor.res}
{$R lut.RES}

uses math, DCM_MpegWrite, dcmjpeg8, dcmjpeg12, dcmjpeg16, CnsJpgGr
  , DicomInputQuery, ImportAVIProcessing, DCM_ImageData_Bitmap
  {$IFDEF NEEDJPEG2000}, Dcmjpeg2000Ex, DCM_Jpegls8081{$ENDIF}
  {$IFDEF NEEDPERJPEG2000}, Dcmjpeg2000{$ENDIF}
  {$IFDEF ECLZLIBTransferSyntax}, EasyCompression{$ENDIF};

const
  cnsFiltPres: array[0..8] of TGraphFilter = (
    (Values: ((0, 0, 0), // None
    (0, 1, 0),
    (0, 0, 0)); Divisor: 0),
    (Values: ((1, 1, 1), // blur 1
    (1, 1, 1),
    (1, 1, 1)); Divisor: 9),
    (Values: ((1, 1, 1), // edge
    (1, -8, 1),
    (1, 1, 1)); Divisor: 1),
    (Values: ((-1, 0, 1), // emboss
    (-1, 1, 1),
    (-1, 0, 1)); Divisor: 1),
    (Values: ((0, -1, 0), // high pass 1
    (-1, 5, -1),
    (0, -1, 0)); Divisor: 1),
    (Values: ((-1, -1, -1), // high pass 2
    (-1, 9, -1),
    (-1, -1, -1)); Divisor: 1),
    (Values: ((1, -2, 1), // high pass 3
    (-2, 5, -2),
    (1, -2, 1)); Divisor: 1),
    (Values: ((1, 1, 1), // Low pass 1
    (1, 1, 1),
    (1, 1, 1)); Divisor: 10),
    (Values: ((1, 2, 1), // Low pass 2
    (2, 4, 2),
    (1, 2, 1)); Divisor: 16)
    );




function GetAge(AD1, AD2: TDatetime): string;
var
  y, m, d, y1, m1, d1: word;
begin
  DecodeDate(ad1, y, m, d);
  DecodeDate(ad2, y1, m1, d1);
  if (y1 - y) < 100 then
  begin
    Result := Format('%3dY', [(y1 - y)]);
    for d := 1 to 3 do
      if Result[d] = ' ' then
        Result[d] := '0'
  end
  else
    Result := '';
end;

procedure InitCursors;
const
  imcur = 1777;
  curnum = 13;
  curname: array[1..curnum] of string = ('DCM_ZOOMMENO',
    'DCM_ZOOMPIU',
    'DCM_WINDOW',
    'DCM_PENNA',
    'DCM_ROI',
    'DCM_HAND',
    'DCM_HWRITE',
    'DCM_MOVE2', //   \
    'DCM_MOVEY', //   |
    'DCM_MOVE1', //   /
    'DCM_MOVEX', //   -
    'DCM_MOVE',
    'DCM_RESIZE'
    );
var
  q: integer;
begin
  for q := 1 to curnum do
    Screen.Cursors[imcur + q] := LoadCursor(HINSTANCE, pchar(curname[q]));
end;

function LookupTableResource(Index: Integer; var LutName: string): TStream;
const
  LutArray: array[0..16] of AnsiString = ('BLACKBDY',
    'bone',
    'CARDIAC',
    'FLOW',
    'GE_color',
    'Gold',
    'HOTIRON',
    'NIH',
    'NIH_fire',
    'NIH_ice',
    'Rainramp',
    'SPECTRUM',
    'X_hot',
    'X_rain',
    'VR Bones',
    'VR Muscles - Bones',
    'VR Red Vessels');
begin
  LutName := LutArray[Index - 1];
  Result := TResourceStream.Create(HInstance, 'LookupTable' + IntToStr(Index), RT_RCDATA);
end;

function LookupTableResource(Index: string): TStream;
const
  LutArray: array[0..16] of AnsiString = ('BLACKBDY',
    'bone',
    'CARDIAC',
    'FLOW',
    'GE_color',
    'Gold',
    'HOTIRON',
    'NIH',
    'NIH_fire',
    'NIH_ice',
    'Rainramp',
    'SPECTRUM',
    'X_hot',
    'X_rain',
    'VR Bones',
    'VR Muscles - Bones',
    'VR Red Vessels');
var
  i, k: Integer;
begin
  k := -1;
  for i := 0 to 16 do
  begin
    if LutArray[i] = index then
    begin
      k := i;
      break;
    end;
  end;
  if k >= 0 then
    Result := TResourceStream.Create(HInstance, 'LookupTable' + IntToStr(k), RT_RCDATA)
  else
    Result := nil;
end;

function ClipLine(var X1, Y1, X2, Y2: Integer; MinX, MinY, MaxX, MaxY: Integer): Boolean;
var
  C1, C2: Integer;
  V: Integer;
begin
  { Get edge codes }
  C1 := Ord(X1 < MinX) + Ord(X1 > MaxX) shl 1 + Ord(Y1 < MinY) shl 2 + Ord(Y1 > MaxY) shl 3;
  C2 := Ord(X2 < MinX) + Ord(X2 > MaxX) shl 1 + Ord(Y2 < MinY) shl 2 + Ord(Y2 > MaxY) shl 3;

  if ((C1 and C2) = 0) and ((C1 or C2) <> 0) then
  begin
    if (C1 and 12) <> 0 then
    begin
      if C1 < 8 then
        V := MinY
      else
        V := MaxY;
      X1 := X1 + MulDiv(V - Y1, X2 - X1, Y2 - Y1);
      Y1 := V;
      C1 := Ord(X1 < MinX) + Ord(X1 > MaxX) shl 1;
    end;

    if (C2 and 12) <> 0 then
    begin
      if C2 < 8 then
        V := MinY
      else
        V := MaxY;
      X2 := X2 + MulDiv(V - Y2, X2 - X1, Y2 - Y1);
      Y2 := V;
      C2 := Ord(X2 < MinX) + Ord(X2 > MaxX) shl 1;
    end;

    if ((C1 and C2) = 0) and ((C1 or C2) <> 0) then
    begin
      if C1 <> 0 then
      begin
        if C1 = 1 then
          V := MinX
        else
          V := MaxX;
        Y1 := Y1 + MulDiv(V - X1, Y2 - Y1, X2 - X1);
        X1 := V;
        C1 := 0;
      end;

      if C2 <> 0 then
      begin
        if C2 = 1 then
          V := MinX
        else
          V := MaxX;
        Y2 := Y2 + MulDiv(V - X2, Y2 - Y1, X2 - X1);
        X2 := V;
        C2 := 0;
      end;
    end;
  end;

  Result := (C1 or C2) = 0;
end;

function _ArcTan2(Y, X: Extended): Extended;
asm
  FLD     Y
  FLD     X
  FPATAN
  FWAIT
end;

function _ArcCos(X: Extended): Extended;
begin
  Result := _ArcTan2(Sqrt(1 - X * X), X);
end;

function _Angle(x1, y1, x2, y2, x3, y3: integer): double;
var
  vx1, vy1, vx2, vy2: integer;
  d1, d2: double;
begin
  vx1 := x2 - x1;
  vy1 := y2 - y1;
  vx2 := x3 - x2;
  vy2 := y3 - y2;
  d1 := sqrt(vx1 * vx1 + vy1 * vy1);
  d2 := sqrt(vx2 * vx2 + vy2 * vy2);
  if (d1 = 0) or (d2 = 0) then
    result := 0
  else
  begin
    d1 := (vx1 * vx2 + vy1 * vy2) / (d1 * d2);
    if abs(d1) <= 1 then
      result := _ArcCos(d1)
    else
      result := 0;
  end;
end;

function _Angle2(x1, y1, x2, y2: integer): double;
begin
  if (x1 < x2) and (y2 < y1) then // 1
    result := pi - _angle(x2, y2, x1, y1, x2, y1)
  else
    if (x1 < x2) and (y1 < y2) then // 4
    result := pi + _angle(x2, y1, x1, y1, x2, y2)
  else
    if (x2 < x1) and (y1 < y2) then // 3
    result := 2 * pi - _angle(x2, y1, x1, y1, x2, y2)
  else
    if (x2 < x1) and (y2 < y1) then // 2
    result := _angle(x2, y1, x1, y1, x2, y2)
  else
    if (x2 = x1) and (y1 > y2) then
    result := pi / 2
  else
    if (x2 = x1) and (y1 < y2) then
    result := 1.5 * pi
  else
    if (y1 = y2) and (x1 > x2) then
    result := pi
  else
    result := 0;
end;

function _GetBitCount(b: Integer): Integer;
var
  i: Integer;
begin
  i := 0;
  while (i < 31) and (((1 shl i) and b) = 0) do
    Inc(i);
  Result := 0;
  while ((1 shl i) and b) <> 0 do
  begin
    Inc(i);
    Inc(Result);
  end;
end;

function _CopyDIB2Bitmap(hbi: THandle; fBitmap: TBitmap; xbits: pbyte; unlck: boolean): integer;
type
  TRGB = packed record
    b: byte;
    g: byte;
    r: byte;
  end;
  pRGB = ^TRGB;
  TRGBQUADARRAY = array[0..Maxint div 16] of TRGBQUAD;
  PRGBQUADARRAY = ^TRGBQUADARRAY;
var
  pbi: PBITMAPINFO;
  lw: integer; // row length in bytes
  Compression: DWORD; // compressino type
  Width, Height: integer; // image width and height
  BitCount: integer; // Bitcount
  y, x, z, zz, c: integer;
  bits, bits2: pbyte;
  wbits: pword;
  px: PRGB;
  bfdw: array[0..2] of dword;
  gbitcount, rbitcount, bbitcount: integer;
  rshift, gshift, bshift: integer;
  ColorMap: PRGBQUADARRAY;
begin
  if unlck then
    pbi := pointer(hbi)
  else
    pbi := GlobalLock(hbi);
  Width := pbi^.bmiHeader.biWidth;
  Height := pbi^.bmiHeader.biHeight;
  BitCount := pbi^.bmiHeader.biBitCount;
  result := BitCount;
  Compression := pbi^.bmiHeader.biCompression;
  lw := (((Width * BitCount) + 31) div 32) * 4;
  fBitmap.Width := 1;
  fBitmap.Height := 1;
  if BitCount = 1 then
    fBitmap.PixelFormat := pf1bit
  else
    fBitmap.PixelFormat := pf24bit;
  fBitmap.Width := Width;
  fBitmap.Height := Height;
  case Compression of
    BI_RGB, BI_RLE8, BI_RLE4, BI_BITFIELDS:
      case BitCount of
        1:
          begin
            // 1 bit per pixel
            bits := pbyte(pbi);
            inc(bits, sizeof(TBITMAPINFOHEADER));
            y := pbi^.bmiHeader.biClrUsed;
            if y = 0 then
              y := 2;
            inc(bits, sizeof(TRGBQUAD) * y); // salta colormap
            if xbits <> nil then
              bits := xbits;
            CopyMemory(fBitmap.Scanline[height - 1], bits, lw * fbitmap.height);
          end;
        4:
          begin
            // 4 bit per pixel
            bits := pbyte(pbi);
            inc(bits, sizeof(TBITMAPINFOHEADER));
            Colormap := PRGBQUADARRAY(bits);
            y := pbi^.bmiHeader.biClrUsed;
            if y = 0 then
              y := 16;
            inc(bits, sizeof(TRGBQUAD) * y); // salta colormap
            if xbits <> nil then
              bits := xbits;
            zz := Width div 2;
            z := zz + (Width and 1); // if odd inc of 1
            dec(zz);
            for y := Height - 1 downto 0 do
            begin
              px := fbitmap.Scanline[y];
              bits2 := bits;
              for x := 0 to z - 1 do
              begin
                c := bits2^ shr 4;
                px^.b := ColorMap^[c].rgbBlue;
                px^.g := ColorMap^[c].rgbGreen;
                px^.r := ColorMap^[c].rgbRed;
                inc(px);
                if x = zz then
                  break;
                c := bits2^ and $0F;
                px^.b := ColorMap^[c].rgbBlue;
                px^.g := ColorMap^[c].rgbGreen;
                px^.r := ColorMap^[c].rgbRed;
                inc(px);
                inc(bits2);
              end;
              inc(bits, lw);
            end;
          end;
        8:
          begin
            // 8 bit per pixel
            bits := pbyte(pbi);
            inc(bits, sizeof(TBITMAPINFOHEADER));
            Colormap := PRGBQUADARRAY(bits);
            y := pbi^.bmiHeader.biClrUsed;
            if y = 0 then
              y := 256;
            inc(bits, sizeof(TRGBQUAD) * y); // salta colormap
            if xbits <> nil then
              bits := xbits;
            for y := Height - 1 downto 0 do
            begin
              px := fbitmap.Scanline[y];
              bits2 := bits;
              for x := 0 to Width - 1 do
              begin
                px^.b := ColorMap^[bits2^].rgbBlue;
                px^.g := ColorMap^[bits2^].rgbGreen;
                px^.r := ColorMap^[bits2^].rgbRed;
                inc(bits2);
                inc(px);
              end;
              inc(bits, lw);
            end;
          end;
        16: // 16 bit per pixel
          begin
            bits := pbyte(pbi);
            inc(bits, sizeof(TBITMAPINFOHEADER));
            if xbits <> nil then
              bits := xbits;
            if Compression = BI_RGB then
            begin
              // configurazione 5-5-5
              bfdw[0] := $7C00;
              bfdw[1] := $03E0;
              bfdw[2] := $001F;
            end
            else
              if Compression = BI_BITFIELDS then
            begin
              CopyMemory(@bfdw, bits, 3 * sizeof(dword));
              inc(bits, 3 * sizeof(dword)); // bypass bitfield
            end;
            rbitcount := _GetBitCount(bfdw[0]);
            gbitcount := _GetBitCount(bfdw[1]);
            bbitcount := _GetBitCount(bfdw[2]);
            rshift := (gbitCount + bbitCount) - (8 - rbitCount);
            gshift := bbitCount - (8 - gbitCount);
            bshift := 8 - bbitCount;
            for y := Height - 1 downto 0 do
            begin
              px := fbitmap.Scanline[y];
              wbits := pword(bits);
              for x := 0 to Width - 1 do
              begin
                px^.r := (wbits^ and bfdw[0]) shr rshift;
                px^.g := (wbits^ and bfdw[1]) shr gshift;
                px^.b := (wbits^ and bfdw[2]) shl bshift;
                inc(px);
                inc(wbits);
              end;
              inc(bits, lw);
            end;
          end;
        24: // 24 bit per pixel
          begin
            if Compression = BI_RGB then
            begin
              bits := pbyte(pbi);
              inc(bits, sizeof(TBITMAPINFOHEADER));
              if xbits <> nil then
                bits := xbits;
              for y := Height - 1 downto 0 do
              begin
                CopyMemory(fbitmap.Scanline[y], bits, lw);
                inc(bits, lw);
              end;
            end;
          end;
        32: // 32 bit per pixel
          begin
            if Compression = BI_BITFIELDS then
            begin
              // BITFIELDS, bitfield must be FF,00FF and 0000FF
              bits := pbyte(pbi);
              inc(bits, sizeof(TBITMAPINFOHEADER));
              inc(bits, 3 * sizeof(dword)); // bypass bitfield
            end
            else
              if Compression = BI_RGB then
            begin
              bits := pbyte(pbi);
              inc(bits, sizeof(TBITMAPINFOHEADER));
            end
            else
            begin
              if not unlck then
                GlobalUnLock(hbi);
              exit; // EXIT POINT!!
            end;
            if xbits <> nil then
              bits := xbits;
            for y := Height - 1 downto 0 do
            begin
              px := fbitmap.Scanline[y];
              bits2 := bits;
              for x := 0 to Width - 1 do
              begin
                px^.b := bits2^;
                inc(bits2);
                px^.g := bits2^;
                inc(bits2);
                px^.r := bits2^;
                inc(bits2, 2);
                inc(px);
              end;
              inc(bits, lw);
            end;
          end;
      end; // Case of Bitcount
    //    IEBI_IYU1: _CopyIYU1ToBitmap(xbits, fBitmap, Height > 0);
    //    IEBI_IYU2: _CopyIYU2ToBitmap(xbits, fBitmap, Height > 0);
    //    IEBI_UYVY, IEBI_UYNV: _CopyUYVYToBitmap(xbits, fBitmap, Height > 0);
    //    IEBI_cyuv: _CopyUYVYToBitmap(xbits, fBitmap, Height < 0);
    //    IEBI_YUY2, IEBI_YUNV: _CopyYUY2ToBitmap(xbits, fBitmap, Height > 0);
    //    IEBI_YVYU: _CopyYVYUToBitmap(xbits, fBitmap, Height > 0);
    //    IEBI_Y41P: _CopyY41PToBitmap(xbits, fBitmap, Height < 0);
    //    IEBI_Y211: _CopyY211ToBitmap(xbits, fBitmap, Height > 0);
    //    IEBI_CLJR: _CopyCLJRToBitmap(xbits, fBitmap, Height > 0);
    //    IEBI_YVU9: _CopyYVU9ToBitmap(xbits, fBitmap, Height > 0);
    //    IEBI_YV12: _CopyYV12ToBitmap(xbits, fBitmap, Height > 0);
    //    IEBI_I420, IEBI_IYUV: _CopyI420ToBitmap(xbits, fBitmap, Height > 0);
          // not supported...
    //    IEBI_Y41T: ;
    //    IEBI_Y42T: ;
    //    IEBI_CLPL: ;
    //    IEBI_IF09: ;
  end;
  if not unlck then
    GlobalUnLock(hbi);
end;

function _PasteFromClipboard(fBitmap: TBitmap): Boolean;
var
  hbi: THandle;
begin
  Result := false;
  if OpenClipboard(0) then
  begin
    if IsClipboardFormatAvailable(CF_DIB) then
    begin
      hbi := GetClipboardData(CF_DIB);
      if hbi <> 0 then
      begin
        _CopyDIB2Bitmap(hbi, fBitmap, nil, false);
        Result := true;
      end;
    end;
    CloseClipboard;
  end;
end;

procedure _KxCopyBitmapPoly(Source: TBitmap; Dest: TBitmap; sx1, sy1, sx2, sy2: integer);
begin
  Dest.PixelFormat := Source.PixelFormat;
  Dest.Width := sx2 - sx1;
  Dest.Height := sy2 - sy1;
  Dest.Canvas.CopyRect(rect(0, 0, Dest.width, Dest.height), Source.Canvas, rect(sx1, sy1, sx2,
    sy2));
end;

function CalAngle(x1, y1, x2, y2, x3, y3: Double): Double;
var
  a, b, c: double;
begin
  Result := 0;
  a := sqrt((x1 - x3) * (x1 - x3) + (y1 - y3) * (y1 - y3));
  b := sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
  c := sqrt((x2 - x3) * (x2 - x3) + (y2 - y3) * (y2 - y3));
  if (b = 0) or (c = 0) or (a = 0) then
    exit;
  Result := (arccos((b * b + c * c - a * a) / (2 * b * c)) / pi) * 180;
end;

function DicomStrToFloat(AStr: AnsiString): Double;
  function DeleteNoneNumber: string;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to length(AStr) do
    begin
      if AStr[i] <> ',' then
      begin
        Result := Result + AStr[i];
      end;
    end;
    Result := Trim(Result);
    //    Result := AStr;
  end;
  {$IFDEF LEVEL7}
var
  n1: TFormatSettings;
begin
  n1.ThousandSeparator := ',';
  n1.DecimalSeparator := '.';
  TryStrToFloat(DeleteNoneNumber, Result, n1);
  {$ELSE}
var
  c1, c2: Char;
begin
  c1 := ThousandSeparator;
  c2 := DecimalSeparator;

  ThousandSeparator := ',';
  DecimalSeparator := '.';
  try
    Result := StrToFloat(DeleteNoneNumber);

  finally
    ThousandSeparator := c1;
    DecimalSeparator := c2;
  end;
  {$ENDIF}
end;

constructor TOBStream.Create(ALen: Integer);
begin
  inherited Create;
  SetSize(ALen);
  FExtData := nil;
end;

function TOBStream.Realloc(var NewCapacity: Longint): Pointer;
const
  MemoryDelta = $20; //$2000; { Must be a power of 2 }
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
        raise Exception.Create(Format('TOBStream--New Size=%d,Old Size=%d.', [NewCapacity, Size]));
    end;
  end;
end;

constructor TOBStream.Create(AData: Pointer; ALen: Integer);
begin
  inherited Create;
  SetPointer(AData, ALen);
  FExtData := AData;
end;

destructor TOBStream.Destroy;
begin
  Freemem(FExtData);
  inherited;
end;

function FloatToDicomStr(AValue: Double): AnsiString;
var
  c1, c2: Char;
begin
  c1 := ThousandSeparator;
  c2 := DecimalSeparator;

  ThousandSeparator := ',';
  DecimalSeparator := '.';
  try
    //Result := FloatToStrf(AValue, ffFixed, 14, 6);

    Result := FloatToStrf(AValue, ffgeneral, 14, 14);

  finally
    ThousandSeparator := c1;
    DecimalSeparator := c2;
  end;
end;

function IntToDicomStr(AValue: Integer): AnsiString;
var
  I: Integer;
begin
  Result := Format('%6d', [AValue]);
  for I := 1 to Length(Result) do // Iterate
  begin
    if Result[i] = ' ' then
      Result[i] := '0';
  end; // for
end;

function TimeToDicomStr(ATime: TDatetime): AnsiString;
begin
  {$IFDEF TIME_LENGTH_HAVE_MS}
  Result := FormatDatetime('hhnnss.zzz', ATime) + '000';
  {$ELSE}
  Result := FormatDatetime('hhnnss', ATime);
  {$ENDIF}
  //  Result := FormatDatetime('hhnnss', ATime);
end;

function DateToDicomStr(ADate: TDatetime): AnsiString;
begin
  Result := FormatDatetime('yyyymmdd', adate);
end;

function DateTimeToDicomStr(ADateTime: TDatetime): AnsiString;
begin
  {$IFDEF TIME_LENGTH_HAVE_MS}
  Result := FormatDatetime('yyyymmddhhnnss.zzz', ADateTime) + '000';
  {$ELSE}
  Result := FormatDatetime('yyyymmddhhnnss', ADateTime);
  {$ENDIF}
  //  Result := FormatDatetime('yyyymmddhhnnss', ADateTime);
end;

function DicomStrToDate(AStr: AnsiString): TDatetime;
var I: Integer;
    y, m, d: Word;
  // 29.11.2012 FOMIN
  function MyStrToDate ( p_Str: String ) : TDateTime;
  var v_pos : Integer; 
  begin
    v_pos := Pos('-',p_Str);
    if v_pos=5 then
    begin
      y := StrToInt(Trim(Copy(astr, 1, 4)));
      m := StrToInt(Trim(Copy(astr, 6, 2)));
      d := StrToInt(Trim(Copy(astr, 9, 2)));
      Result := EncodeDate(y, m, d);
    end else
      Result := StrToDate(p_Str);
  end;
begin
  if Pos('.', astr) > 0 then
  begin
    for I := 1 to length(astr) do // Iterate
    begin
      if astr[i] = '.' then
        astr[i] := '-';
    end; // for
    Result := MyStrToDate(astr);
  end
  else
    if Pos('-', astr) > 0 then
    begin
      Result := MyStrToDate(astr);
    end
    else
    begin
      y := StrToInt(Trim(Copy(astr, 1, 4)));
      m := StrToInt(Trim(Copy(astr, 5, 2)));
      d := StrToInt(Trim(Copy(astr, 7, 2)));
      if (y = 0) or (m = 0) or (d = 0) then
        Result := now
      else
        Result := EncodeDate(y, m, d);
    end;
end;

function DicomStrToDateTime(AStr: AnsiString): TDatetime;
var
  y, m, d, h, n, s, z: Word;
begin
  y := StrToInt(Copy(astr, 1, 4));
  m := StrToInt(Copy(astr, 5, 2));
  d := StrToInt(Copy(astr, 7, 2));
  h := StrToInt(Copy(astr, 9, 2));
  n := StrToInt(Copy(astr, 11, 2));
  s := StrToInt(Copy(astr, 13, 2));
  if Length(astr) > 16 then
    z := StrToInt(Copy(astr, 16, 3))
  else
    z := 0;
  Result := EncodeDate(y, m, d) + EncodeTime(h, n, s, z);
end;

function DicomStrToTime(AStr: AnsiString): TDatetime;
var
  h, m, s, z, k: Word;
begin
  k := Length(AStr);
  if Pos(':', astr) <= 0 then
  begin
    h := StrToInt(Copy(astr, 1, 2));
    m := StrToInt(Copy(astr, 3, 2));
    if k > 4 then
      s := StrToInt(Copy(astr, 5, 2))
    else
      s := 0;
    if k > 8 then
      z := StrToInt(Trim(Copy(astr, 8, 3)))
    else
      z := 0;
    Result := EncodeTime(h, m, s, z);
  end
  else
  begin
    h := StrToInt(Copy(astr, 1, 2));
    m := StrToInt(Copy(astr, 4, 2));
    if k > 8 then
      s := StrToInt(Copy(astr, 7, 2))
    else
      s := 0;
    if k > 11 then
      z := StrToInt(Trim(Copy(astr, 11, k - 11)))
    else
      z := 0;
    // FOMIN 29.11.2012
    if s>60 then s:=0;   // seconds
    if z>1000 then z:=0; // miliseconds
    Result := EncodeTime(h, m, s, z);
  end;
end;

// 29.11.2012 FOMIN
{ procedure TDicomImage.SetSourceTransferSyntax( ATransferSyntax: Integer);
begin
  TDicomImageData( FImageArray[FBaseFrameIndex] ).FTransferSyntax:=ATransferSyntax;
end; }

function TDicomImage.GetSourceTransferSyntax: Integer;
begin
  Result := TDicomImageData(FImageArray[FBaseFrameIndex]).FTransferSyntax;
end;

procedure TDicomImage.LoadLutFromStream(AStream: TStream);
var
  n1: TDicomImagePalette;
begin
  if assigned(FImageArray) then
  begin
    FModify := true;
    if assigned(AStream) then
    begin
      if fCustomPalette.Count > 0 then
      begin
        n1 := TDicomImagePalette(fCustomPalette[0]);
        if n1.fRect.Left = n1.fRect.Right then
        begin
          ClearPalette;
        end;
      end;

      n1 := TDicomImagePalette.Create;
      fCustomPalette.Add(n1);

      AStream.Position := 0;

      AStream.Read(n1.FRedTable^, 256);
      AStream.Read(n1.FGreenTable^, 256);
      AStream.Read(n1.FBlueTable^, 256); //}

      if (FDrawObjects.NewDrawObject <> nil) and (FDrawObjects.NewDrawObject.Kind = ldmiSelectRect)
        then
      begin
        n1.fRect := FDrawObjects.NewDrawObject.FRect;
      end;
    end
    else
      ClearPalette;
  end;
end;

procedure TDicomImage.ReCalMaxMin(x1, y1, x2, y2: Integer);
var
  d1: TDicomImageData;
  xx1, xx2, yy1, yy2: integer;

  k1, k2: integer;

  pw1: WordP;
  ps1: SmallP;
  pf1: SingleP;

  px1: ByteP;
  i1: Integer;
  v, max16, min16: Single;
  //  v: Word;
begin
  if assigned(FImageArray) then
  begin
    d1 := GetImagedata(FCurrentFrame);
    xx1 := x1;
    xx2 := x2;
    yy1 := y1;
    yy2 := y2;
    if VerFlip then
    begin
      yy2 := FHeight - y1 + 1;
      yy1 := FHeight - y2 + 1;
    end;
    if HozFlip then
    begin
      xx2 := FWidth - x1 + 1;
      xx1 := FWidth - x2 + 1;
    end;
    //    d1.ReCalMaxMin(xx1, yy1, xx2, yy2, m1, m2);
    if (Copy(FPhotometricInterpretation, 1, 4) = 'MONO') then
    begin
      if FBits <= 8 then
      begin
        px1 := d1.Data;
        max16 := px1[(yy1 - 1) * FWidth + xx1];
        min16 := max16;
        for k1 := yy1 - 1 to yy2 - 1 do
        begin
          i1 := k1 * FWidth;
          for k2 := xx1 to xx2 do
          begin
            v := px1[i1 + k2];
            if v < min16 then
              min16 := v;
            if v > max16 then
              max16 := v;
          end;
        end;
      end
      else
      begin //>8 bits
        {.$IFDEF USE_16_TO_FLOAT_BUFFER}
        if FBufferLength = diblFloat then
        begin
          pf1 := d1.Data;
          max16 := pf1[(y1 - 1) * FWidth + xx1];
          min16 := max16;
          for k1 := yy1 - 1 to yy2 - 1 do
          begin
            i1 := k1 * FWidth;
            for k2 := xx1 to xx2 do
            begin
              v := pf1[i1 + k2];
              if v < min16 then
                min16 := v;
              if v > max16 then
                max16 := v;
            end;
          end;
          {.$ELSE}
        end
        else
        begin
          if PixelRepresentation then
          begin
            pw1 := d1.Data;
            max16 := pw1[(y1 - 1) * FWidth + xx1];
            min16 := max16;
            for k1 := yy1 - 1 to yy2 - 1 do
            begin
              i1 := k1 * FWidth;
              for k2 := xx1 to xx2 do
              begin
                v := pw1[i1 + k2];
                if v < min16 then
                  min16 := v;
                if v > max16 then
                  max16 := v;
              end;
            end;
          end
          else
          begin
            ps1 := d1.Data;
            max16 := ps1[(y1 - 1) * FWidth + xx1];
            min16 := max16;
            for k1 := yy1 - 1 to yy2 - 1 do
            begin
              i1 := k1 * FWidth;
              for k2 := xx1 to xx2 do
              begin
                v := ps1[i1 + k2];
                if v < min16 then
                  min16 := v;
                if v > max16 then
                  max16 := v;
              end;
            end;
          end;
        end; {.$ENDIF}
      end;

      //2010-7-19
      Min16 := min16 * FRescaleSlope + FRescaleIntercept;
      Max16 := Max16 * FRescaleSlope + FRescaleIntercept;

      FWindowWidth := trunc(max16 - min16);
      FWindowCenter := trunc(min16 + FWindowWidth shr 1);
      {.$IFNDEF USE_16_TO_FLOAT_BUFFER}
      if FBufferLength = diblFloat then
      begin
        FWindowCenter := Trunc(FWindowCenter / FRescaleSlope + FRescaleIntercept);
      end; {.$ENDIF}
    end
    else
    begin
      max16 := 255;
      Min16 := 0;
      FWindowWidth := 255;
      FWindowCenter := 128;
    end;
    fModify := true;
  end
end;

procedure TDicomImage.CalAverage(x1, y1, x2, y2: Integer; var av, sd, ar: double);
var
  d1: TDicomImageData;
  xx1, xx2, yy1, yy2: integer;

  k1, k2: integer;
  ps1: Smallp;
  pw1: Wordp;
  pf1: SingleP;
  px1: ByteP;
  i1: Integer;
  v: Integer;
  zz, zz1: Int64;
  c: Integer;
begin
  if assigned(FImageArray) then
  begin
    d1 := GetImagedata(FCurrentFrame);
    xx1 := x1;
    xx2 := x2;
    yy1 := y1;
    yy2 := y2;
    {if VerFlip then
    begin
      yy2 := FHeight - y1 + 1;
      yy1 := FHeight - y2 + 1;
    end;
    if HozFlip then
    begin
      xx2 := FWidth - x1 + 1;
      xx1 := FWidth - x2 + 1;
    end; }

    //    d1.CalAverage(xx1, yy1, xx2, yy2, av, sd, ar);
    if (Copy(FPhotometricInterpretation, 1, 4) = 'MONO') then
    begin
      k1 := Min(yy2, yy1);
      k2 := max(yy2, yy1);
      yy1 := k1;
      yy2 := k2;
      k1 := Min(xx2, xx1);
      k2 := max(xx2, xx1);
      xx1 := k1;
      xx2 := k2;
      c := (yy2 - yy1 + 1) * (xx2 - xx1 + 1);
      if c = 0 then
        exit;
      ar := c;
      zz := 0;
      zz1 := 0;
      if FBits <= 8 then
      begin
        px1 := d1.Data;
        for k1 := yy1 - 1 to yy2 - 1 do
        begin
          i1 := k1 * FWidth;
          for k2 := xx1 to xx2 do
          begin
            v := Trunc(px1[i1 + k2] * FRescaleSlope + FRescaleIntercept);
            zz := zz + v;
            zz1 := zz1 + v * v;
          end;
        end;
      end
      else
      begin //>8 bits
        {.$IFDEF USE_16_TO_FLOAT_BUFFER}
        if FBufferLength = diblFloat then
        begin
          pf1 := d1.Data;
          for k1 := yy1 - 1 to yy2 - 1 do
          begin
            i1 := k1 * FWidth;
            for k2 := xx1 to xx2 do
            begin
              v := Trunc(pf1[i1 + k2]);
              zz := zz + v;
              zz1 := zz1 + v * v;
            end;
          end;
          {.$ELSE}
        end
        else
        begin
          if PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          begin
            pw1 := d1.Data;
            for k1 := yy1 - 1 to yy2 - 1 do
            begin
              i1 := k1 * FWidth;
              for k2 := xx1 to xx2 do
              begin
                if (FPixelPaddingValue <> 0) and (pw1[i1 + k2] >= FPixelPaddingValue) then
                  v := Trunc((FPixelPaddingValue - pw1[i1 + k2]) * FRescaleSlope + FRescaleIntercept)
                else
                  v := Trunc(pw1[i1 + k2] * FRescaleSlope + FRescaleIntercept);
                zz := zz + v;
                zz1 := zz1 + v * v;
              end;
            end;
          end
          else
          begin
            ps1 := d1.Data;
            for k1 := yy1 - 1 to yy2 - 1 do
            begin
              i1 := k1 * FWidth;
              for k2 := xx1 to xx2 do
              begin
                if (FPixelPaddingValue <> 0) and (ps1[i1 + k2] >= FPixelPaddingValue) then
                  v := Trunc((FPixelPaddingValue - ps1[i1 + k2]) * FRescaleSlope + FRescaleIntercept)
                else
                  v := Trunc(ps1[i1 + k2] * FRescaleSlope + FRescaleIntercept);
                zz := zz + v;
                zz1 := zz1 + v * v;
              end;
            end;
          end;
        end; {.$ENDIF}
      end;
      av := (zz / c);
      sd := sqrt(abs((av * av * c - zz1) / c));
    end;

    ar := ar * FPixelSpacingX * FPixelSpacingY;
  end
end;

function TDicomImage.GetPointValue(x1, y1: Integer): AnsiString;
var
  d1: TDicomImageData;
  //  m1, m2: integer;
  ps1: SmallP;
  pw1: WordP;
  pf1: SingleP;

  px1: ByteP;
  prgb1: PRGB;
begin
  if assigned(FImageArray) then
  begin
    d1 := GetImagedata(FCurrentFrame);
    if (Copy(FPhotometricInterpretation, 1, 4) = 'MONO') then
    begin
      if FBits <= 8 then
      begin
        px1 := d1.Data;
        Result := IntToStr(Trunc(px1[y1 * FWidth + x1] * FRescaleSlope + FRescaleIntercept));
      end
      else
      begin
        {.$IFDEF USE_16_TO_FLOAT_BUFFER}
        if FBufferLength = diblFloat then
        begin
          pf1 := d1.Data;
          Result := Format('%f', [pf1[y1 * FWidth + x1]]);
          {.$ELSE}
        end
        else
        begin

          if PixelRepresentation then
          begin

            pw1 := d1.Data;
            if (FPixelPaddingValue <> 0) and (pw1[y1 * FWidth + x1] >= FPixelPaddingValue) then
              Result := IntToStr(Trunc((FPixelPaddingValue - pw1[y1 * FWidth + x1]) * FRescaleSlope +
                FRescaleIntercept))
            else

              Result := IntToStr(Trunc(pw1[y1 * FWidth + x1] * FRescaleSlope + FRescaleIntercept));
          end
          else
          begin

            ps1 := d1.Data;
            if (FPixelPaddingValue <> 0) and (ps1[y1 * FWidth + x1] >= FPixelPaddingValue) then
              Result := IntToStr(Trunc((FPixelPaddingValue - ps1[y1 * FWidth + x1]) * FRescaleSlope +
                FRescaleIntercept))
            else

              Result := IntToStr(Trunc(ps1[y1 * FWidth + x1] * FRescaleSlope + FRescaleIntercept));
          end;
        end; {.$ENDIF}
      end;
    end
    else
      //if FPhotometricInterpretation = 'RGB' then
    begin
      prgb1 := d1.Data;
      inc(prgb1, y1 * FWidth + x1);
      Result := Format('R=%d,G=%d,B=%d', [prgb1.r, prgb1.g, prgb1.b]);
      //   Result := 'R:' + IntToStr(px1[y1 * FWidth * 3 + x1]) +
     //       'G:' + IntToStr(px1[y1 * FWidth * 3 + x1 + 1]) +
     //       'B:' + IntToStr(px1[y1 * FWidth * 3 + x1 + 2]);
    end;
  end;
end;

function TDicomImage.IsMONOCHROME: Boolean;
begin
  if assigned(FImageArray) then
  begin
    Result := (Copy(FPhotometricInterpretation, 1, 4) = 'MONO');
  end
  else
    Result := false;
end;

function TDicomImage.GetMaxValue: Integer;
var
  d1: TDicomImageData;
begin
  d1 := GetImagedata(FCurrentFrame);
  if assigned(d1) then
    Result := d1.MaxValue
  else
    Result := 0;
end;

////////////////////2d vector/////////////////////////////////////

function pointAdd(aVector, bVector: TStructMatrix2D): TStructMatrix2D;
begin
  Result.x := aVector.x + bVector.x;
  Result.y := aVector.y + bVector.y;
end;

function pointSub(aVector, bVector: TStructMatrix2D): TStructMatrix2D;
begin
  Result.x := aVector.x - bVector.x;
  Result.y := aVector.y - bVector.y;
end;

function pointDot(aVector, bVector: TStructMatrix2D): Double;
begin
  Result := aVector.x * bVector.x + aVector.y * bVector.y // + aVector.z * bVector.z;
end;

function pointNormal(aVector: TStructMatrix2D): Single;
begin
  Result := Sqrt(pointDot(aVector, aVector));
end;

function pointDistance(aVector, bVector: TStructMatrix2D): Single;
begin
  Result := pointNormal(pointSub(aVector, bVector));
end;

function pointMultiply(aVector: TStructMatrix2D; value: Single): TStructMatrix2D;
begin
  Result.x := value * aVector.x;
  Result.y := value * aVector.y;
end;

function SqLineMagnitude(const x1, y1, x2, y2: extended): extended;
//
//  Returns the square of the magnitude of the line
//    to cut down on unnecessary Sqrt when in many cases
//    DistancePointLine() squares the result
//
begin
  result := (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1);
end;

function dist_Point_to_Segment(P: TStructMatrix2D; S: TStructLine2D; var CrossP: TStructMatrix2D;
  var radio: Double): Double;
//function DistancePointLine(const px, py, x1, y1, x2, y2: extended): extended;
//  px, py is the point to test.
//  x1, y1, x2, y2 is the line to check distance.
//
//  Returns distance from the line, or if the intersecting point on the line nearest
//    the point tested is outside the endpoints of the line, the distance to the
//    nearest endpoint.
//
//  Returns -1 on zero-valued denominator conditions to return an illegal distance. (
//    modification of Brandon Crosby's VBA code)

var
  SqLineMag, // square of line's magnitude (see note in function LineMagnitude)
  u, // see Paul Bourke's original article(s)
  ix, // intersecting point X
  iy: extended; // intersecting point Y
  px, py, x1, y1, x2, y2: extended;
begin
  px := p.x;
  py := p.y;
  x1 := s.p0.x;
  y1 := s.p0.y;
  x2 := s.P1.x;
  y2 := s.P1.y;

  SqLineMag := SqLineMagnitude(x1, y1, x2, y2);
  if SqLineMag < EPSEPS then
  begin
    result := -1.0;
    exit;
  end;

  u := ((px - x1) * (x2 - x1) + (py - y1) * (y2 - y1)) / SqLineMag;

  if (u < EPS) or (u > 1) then
  begin
    //  Closest point does not fall within the line segment,
    //    take the shorter distance to an endpoint
    ix := SqLineMagnitude(px, py, x1, y1);
    iy := SqLineMagnitude(px, py, x2, y2);
    result := min(ix, iy);
    if ix < iy then
    begin
      CrossP := s.p0;
      radio := 0;
    end
    else
    begin
      CrossP := s.p1;
      radio := 1;
    end;
  end //  if (u < EPS) or (u > 1)
  else
  begin
    //  Intersecting point is on the line, use the formula
    ix := x1 + u * (x2 - x1);
    iy := y1 + u * (y2 - y1);

    CrossP.x := ix;
    CrossP.y := iy;

    radio := u;

    result := SqlineMagnitude(px, py, ix, iy);
  end; //  else NOT (u < EPS) or (u > 1)

  // finally convert to actual distance not its square

  result := sqrt(result);
end;

function dist_Point_to_Segment1(P: TStructMatrix2D; S: TStructLine2D; var CrossP: TStructMatrix2D;
  var radio: Double): Double;
var
  v, w: TStructMatrix2D;
  c1, c2, b: Double;
begin
  v := pointSub(S.P1, S.P0);
  w := pointSub(P, S.P0);

  c1 := pointDot(w, v);
  if (c1 <= 0) then
  begin
    Result := pointDistance(P, S.P0);
    CrossP := S.P0;
  end
  else
  begin
    c2 := pointDot(v, v);
    if (c2 <= c1) then
    begin
      Result := pointDistance(P, S.P1);
      CrossP := S.P1;
    end
    else
    begin
      b := c1 / c2;
      CrossP := pointAdd(S.P0, pointMultiply(v, b));
      //      radio := b;
      Result := pointDistance(P, CrossP);

      radio := pointDistance(CrossP, S.P0) / pointDistance(CrossP, S.P1);
    end;
  end;
end;

////////////////////3d vector////////////////////////////////////

function crossProduct(aVector, bVector: TStructMatrix3D): TStructMatrix3D;
begin
  Result.x := aVector.y * bVector.z - aVector.z * bVector.y;
  Result.y := aVector.z * bVector.x - aVector.x * bVector.z;
  Result.z := aVector.x * bVector.y - aVector.y * bVector.x;
end;

function dotProduct(aVector, bVector: TStructMatrix3D): Single;
begin
  Result := aVector.x * bVector.x + aVector.y * bVector.y + aVector.z * bVector.z;
end;

function VectorScalar(aVector: TStructMatrix3D; AValue: Double): TStructMatrix3D;
begin
  Result.x := aVector.x * AValue;
  Result.y := aVector.y * AValue;
  Result.z := aVector.z * AValue;
end;

function VectorAdd(aVector, bVector: TStructMatrix3D): TStructMatrix3D;
begin
  Result.x := aVector.x + bVector.x;
  Result.y := aVector.y + bVector.y;
  Result.z := aVector.z + bVector.z;
end;

function VectorSub(aVector, bVector: TStructMatrix3D): TStructMatrix3D;
begin
  Result.x := aVector.x - bVector.x;
  Result.y := aVector.y - bVector.y;
  Result.z := aVector.z - bVector.z;
end;

function VectorNormal(aVector: TStructMatrix3D): Single;
begin
  Result := Sqrt(dotProduct(aVector, aVector));
end;

function VectorDistance(aVector, bVector: TStructMatrix3D): Single;
begin
  Result := VectorNormal(VectorSub(aVector, bVector));
end;

function vectorLength(aVector: TStructMatrix3D): Single;
begin
  Result := sqrt(dotProduct(aVector, aVector));
end;

function normalVectorForVector(vector1, vector2: TStructMatrix3D): TStructMatrix3D;
begin
  // formula for cross products = (V 2W3- V 3W2, V 3W1- V 1W3, V 1W2- V 2W1)
  Result.x := (vector1.y * vector2.z) - (vector1.z * vector2.y);
  Result.y := (vector1.z * vector2.x) - (vector1.x * vector2.z);
  Result.z := (vector1.x * vector2.y) - (vector1.y * vector2.x);
end;

//START of multiply a vector

function vectorMultiply(aVector: TStructMatrix3D; value: Single): TStructMatrix3D;
begin
  Result.x := value * aVector.x;
  Result.y := value * aVector.y;
  Result.z := value * aVector.z;
end;

//START of sumation of two vectors

function vectorSum(aVector, bVector: TStructMatrix3D; sign: Integer): TStructMatrix3D;
begin
  Result.x := aVector.x + sign * bVector.x;
  Result.y := aVector.y + sign * bVector.y;
  Result.z := aVector.z + sign * bVector.z;
end;

function pointOfIntersectionOfLine(aLine, bLine: TStructLine3D): tstructmatrix3D;
var
  s: Single;
  intersection: tstructmatrix3D;
  numerator, denominator: Single;
begin
  s := 0;
  //check for parallel
  s := vectorLength(crossProduct(aLine.lineVector, bLine.lineVector));
  if (s <> 0) then
  begin
    if ((bLine.lineVector.x = 0) and (aLine.lineVector.x = 0)) then
    begin
      denominator := (bLine.lineVector.y * aLine.lineVector.z) - (bLine.lineVector.z *
        aLine.lineVector.y);
      numerator := (bLine.lineVector.z * aLine.position.y) - (bLine.lineVector.z * bLine.position.y)
        - (bLine.lineVector.y * aLine.position.z) + (bLine.lineVector.y * bLine.position.z);
      s := numerator / denominator;

      intersection.x := aLine.position.x + aLine.lineVector.x * s;
      intersection.y := aLine.position.y + aLine.lineVector.y * s;
      intersection.z := aLine.position.z + aLine.lineVector.z * s;
    end
    else
      if ((bLine.lineVector.y = 0) and (aLine.lineVector.y = 0)) then
    begin
      denominator := (bLine.lineVector.x * aLine.lineVector.z) - (bLine.lineVector.z *
        aLine.lineVector.x);
      numerator := (bLine.lineVector.z * aLine.position.x) - (bLine.lineVector.z * bLine.position.x)
        - (bLine.lineVector.x * aLine.position.z) + (bLine.lineVector.x * bLine.position.z);
      s := numerator / denominator;
      intersection.x := aLine.position.x + aLine.lineVector.x * s;
      intersection.y := aLine.position.y + aLine.lineVector.y * s;
      intersection.z := aLine.position.z + aLine.lineVector.z * s;
    end
    else
      if ((bLine.lineVector.z = 0) and (aLine.lineVector.z = 0)) then
    begin
      denominator := (bLine.lineVector.x * aLine.lineVector.y) - (bLine.lineVector.y *
        aLine.lineVector.x);
      numerator := (bLine.lineVector.y * aLine.position.x) - (bLine.lineVector.y * bLine.position.x)
        - (bLine.lineVector.x * aLine.position.y) + (bLine.lineVector.x * bLine.position.y);
      s := numerator / denominator;

      intersection.x := aLine.position.x + aLine.lineVector.x * s;
      intersection.y := aLine.position.y + aLine.lineVector.y * s;
      intersection.z := aLine.position.z + aLine.lineVector.z * s;
    end
      {else
        if ((bLine.lineVector.x = 0) or (bLine.lineVector.y = 0) or (bLine.lineVector.z = 0)) then
      begin

        //NSLog(@"4");
        if (bLine.lineVector.x = 0) then
          s := (bLine.position.x - aLine.position.x) / aLine.lineVector.x
        else
          if (bLine.lineVector.y = 0) then
          s := (bLine.position.y - aLine.position.y) / aLine.lineVector.y
        else
          if (bLine.lineVector.z = 0) then
          s := (bLine.position.z - aLine.position.z) / aLine.lineVector.z;

        intersection.x := aLine.position.x + aLine.lineVector.x * s;
        intersection.y := aLine.position.y + aLine.lineVector.y * s;
        intersection.z := aLine.position.z + aLine.lineVector.z * s;

      end
      else
        if ((aLine.lineVector.x = 0) or (aLine.lineVector.y = 0) or (aLine.lineVector.z = 0)) then
      begin
        //NSLog(@"5");
        if (aLine.lineVector.x = 0) then
          s := (aLine.position.x - bLine.position.x) / bLine.lineVector.x
        else
          if (aLine.lineVector.y = 0) then
          s := (aLine.position.y - bLine.position.y) / bLine.lineVector.y
        else
          if (aLine.lineVector.z = 0) then
          s := (aLine.position.z - aLine.position.z) / bLine.lineVector.z;

        intersection.x := bLine.position.x + bLine.lineVector.x * s;
        intersection.y := bLine.position.y + bLine.lineVector.y * s;
        intersection.z := bLine.position.z + bLine.lineVector.z * s;
      end}
    else
    begin
      denominator := (bLine.lineVector.x * aLine.lineVector.y) - (bLine.lineVector.y *
        aLine.lineVector.x);
      numerator := (bLine.lineVector.y * aLine.position.x) - (bLine.lineVector.y * bLine.position.x)
        - (bLine.lineVector.x * aLine.position.y) + (bLine.lineVector.x * bLine.position.y);
      s := numerator / denominator;

      intersection.x := aLine.position.x + aLine.lineVector.x * s;
      intersection.y := aLine.position.y + aLine.lineVector.y * s;
      intersection.z := aLine.position.z + aLine.lineVector.z * s;
    end;

  end;

  Result := intersection;
end;

function intersectionLineFromPlane(planeA, planeB: TStructPlane3D): TStructLine3D;
var
  normalLine: TStructMatrix3D;
  crossVector: TStructMatrix3D;
  point, newPoint: TStructMatrix3D;
  distance: Single;
  what_to_do: Integer;
  intersectionLine: TStructLine3D;
  plane1_D: Single;
  plane2_D: Single;
begin
  what_to_do := 0;

  plane1_D := -(dotProduct(planeA.normalVector, planeA.position));
  plane2_D := -(dotProduct(planeB.normalVector, planeB.position));

  crossVector := crossProduct(planeA.normalVector, planeB.normalVector); //vectors
  if (vectorLength(crossVector) <> 0) then
  begin
    intersectionLine.lineVector := crossVector;
    normalLine := vectorMultiply(crossVector, 1 / vectorLength(crossVector));

    //we need a point on the intersection line

    if (normalLine.x = 0) then //vector perpendicular on x axis
      what_to_do := YVECTOR;

    if (normalLine.y = 0) then //vector perpendicular on y axi
      what_to_do := ZVECTOR;

    if (normalLine.z = 0) then //vector perpendicular on z axis
      what_to_do := XVECTOR;

    if (normalLine.y = 0) and (normalLine.z = 0) then //vector is colinear with the x axis
      what_to_do := XVECTOR;

    if (normalLine.x = 0) and (normalLine.z = 0) then //vector is colinear with the y axis
      what_to_do := YVECTOR;

    if (normalLine.x = 0) and (normalLine.y = 0) then //vector is colinear with the z axi
      what_to_do := ZVECTOR;

    case (what_to_do) of
      XVECTOR:
        begin
          point.x := 0;
          point.y := (plane2_D * planeA.normalVector.z - plane1_D * planeB.normalVector.z) /
            (planeA.normalVector.y * planeB.normalVector.z - planeB.normalVector.y *
            planeA.normalVector.z);
          point.z := (plane2_D * planeA.normalVector.y - plane1_D * planeB.normalVector.y) /
            (planeA.normalVector.z * planeB.normalVector.y - planeB.normalVector.z *
            planeA.normalVector.y);
        end;
      YVECTOR:
        begin
          point.y := 0;
          point.x := (plane2_D * planeA.normalVector.z - plane1_D * planeB.normalVector.z) /
            (planeA.normalVector.x * planeB.normalVector.z - planeB.normalVector.x *
            planeA.normalVector.z);
          point.z := (plane2_D * planeA.normalVector.x - plane1_D * planeB.normalVector.x) /
            (planeA.normalVector.z * planeB.normalVector.x - planeB.normalVector.z *
            planeA.normalVector.x);
        end;
      ZVECTOR:
        begin
          point.z := 0;
          point.x := (plane2_D * planeA.normalVector.y - plane1_D * planeB.normalVector.y) /
            (planeA.normalVector.x * planeB.normalVector.y - planeB.normalVector.x *
            planeA.normalVector.y);
          point.y := (plane2_D * planeA.normalVector.x - plane1_D * planeB.normalVector.x) /
            (planeA.normalVector.y * planeB.normalVector.x - planeB.normalVector.y *
            planeA.normalVector.x);
        end;
    else
      begin
        point.z := 0;
        point.x := (plane2_D * planeA.normalVector.y - plane1_D * planeB.normalVector.y) /
          (planeA.normalVector.x * planeB.normalVector.y - planeB.normalVector.x *
          planeA.normalVector.y);
        point.y := (plane2_D * planeA.normalVector.x - plane1_D * planeB.normalVector.x) /
          (planeA.normalVector.y * planeB.normalVector.x - planeB.normalVector.y *
          planeA.normalVector.x);
      end;
    end;

    distance := dotProduct(normalLine, point);

    //the closest point to origin lying on the intersection plane

    newPoint := vectorSum(point, vectorMultiply(normalLine, distance), -1);
    intersectionLine.position := newPoint;
    //END of finding the closest point (to the origin) on the intersection line

    Result := intersectionLine;
  end
  else
    Result := intersectionLine;
end;

// intersect3D_2Planes(): the 3D intersect of two planes
//    Input:  two planes Pn1 and Pn2
//    Output: *L = the intersection line (when it exists)
//    Return: 0 = disjoint (no intersection)
//            1 = the two planes coincide
//            2 = intersection in the unique line *L

function intersect3D_2Planes(Pn1, Pn2: TStructPlane3D; var L: TStructLine3D): Integer;
var
  u, v: TStructMatrix3D;
  ax, ay, az: Double;
  maxc: Integer; // max coordinate
  iP: TStructMatrix3D; // intersect point
  d1, d2: Double; // the constants in the 2 plane equations
begin
  u := crossProduct(Pn1.normalVector, Pn2.normalVector); // cross product
  if (u.x >= 0) then
    ax := u.x
  else
    ax := -u.x;
  if u.y >= 0 then
    ay := u.y
  else
    ay := -u.y;
  if u.z >= 0 then
    az := u.z
  else
    az := -u.z;

  // test if the two planes are parallel
  if ((ax + ay + az) < 0.00000001) then // Pn1 and Pn2 are near parallel
  begin
    // test if disjoint or coincide
    v := VectorSub(Pn2.position, Pn1.position);
    if (dotProduct(Pn1.normalVector, v) = 0) then // Pn2.V0 lies in Pn1
    begin
      Result := 1; // Pn1 and Pn2 coincide
      exit;
    end
    else
    begin
      Result := 0; // Pn1 and Pn2 are disjoint
    end;

  end;

  // Pn1 and Pn2 intersect in a line
  // first determine max abs coordinate of cross product

  if (ax > ay) then
  begin
    if (ax > az) then
      maxc := 1
    else
      maxc := 3;
  end
  else
  begin
    if (ay > az) then
      maxc := 2
    else
      maxc := 3;
  end;

  // next, to get a point on the intersect line
  // zero the max coord, and solve for the other two
  d1 := -dotProduct(Pn1.normalVector, Pn1.position); // note: could be pre-stored with plane
  d2 := -dotProduct(Pn2.normalVector, Pn2.position); // ditto

  case (maxc) of // select max coordinate
    1:
      begin // intersect with x=0
        iP.x := 0;
        iP.y := (d2 * Pn1.normalVector.z - d1 * Pn2.normalVector.z) / u.x;
        iP.z := (d1 * Pn2.normalVector.y - d2 * Pn1.normalVector.y) / u.x;
      end;
    2:
      begin // intersect with y=0
        iP.x := (d1 * Pn2.normalVector.z - d2 * Pn1.normalVector.z) / u.y;
        iP.y := 0;
        iP.z := (d2 * Pn1.normalVector.x - d1 * Pn2.normalVector.x) / u.y;
      end;
    3:
      begin // intersect with z=0
        iP.x := (d2 * Pn1.normalVector.y - d1 * Pn2.normalVector.y) / u.z;
        iP.y := (d1 * Pn2.normalVector.x - d2 * Pn1.normalVector.x) / u.z;
        iP.z := 0;
      end;
  end;
  l.position := ip;
  l.lineVector := u;
  //  L = iP;
  //  L - > P1 = iP + u;
  Result := 2;
end;
//===================================================================

// intersect3D_SegmentPlane(): intersect a segment and a plane
//    Input:  S = a segment, and Pn = a plane = {Point V0; Vector n;}
//    Output: *I0 = the intersect point (when it exists)
//    Return: 0 = disjoint (no intersection)
//            1 = intersection in the unique point *I0
//            2 = the segment lies in the plane
                                 //P0, P1

function intersect3D_SegmentPlane(c1, c2: TStructMatrix3D; Pn: TStructPlane3D; var I:
  TStructMatrix3D): Integer;
var
  u, w: TStructMatrix3D;
  D, N, si: Double;
begin
  u := VectorSub(c2, c1);
  w := VectorSub(c1, Pn.position);

  D := dotProduct(Pn.normalVector, u);
  N := -dotProduct(Pn.normalVector, w);

  if (abs(D) < 0.00000001) then
  begin // segment is parallel to plane
    if (N = 0) then // segment lies in plane
    begin
      Result := 2;
      exit;
    end
    else
    begin
      Result := 0; // no intersection
      exit;
    end;
  end;
  // they are not parallel
  // compute intersect param
  sI := N / D;
  if (sI < 0) or (sI > 1) then
  begin
    Result := 0; // no intersection
    exit;
  end;
  i.x := c1.x + u.x * si;
  i.y := c1.y + u.y * si;
  i.z := c1.z + u.z * si;
  Result := 1;
end;

(*
function intersect3D_SegmentPlane(S: TStructLine3D; AHeight: Double; Pn: TStructPlane3D; var I:
  TStructMatrix3D): Integer;
var
  u, w, v: TStructMatrix3D;
  D, N, si, l1: Double;
begin
  v.x := s.position.x + s.lineVector.x * AHeight;
  v.y := s.position.y + s.lineVector.y * AHeight;
  v.z := s.position.z + s.lineVector.z * AHeight;

  u := VectorSub(v, S.position);
  w := VectorSub(S.position, Pn.position);

  D := dotProduct(Pn.normalVector, u);
  N := -dotProduct(Pn.normalVector, w);

  if (abs(D) < 0.00000001) then
  begin // segment is parallel to plane
    if (N = 0) then // segment lies in plane
    begin
      Result := 2;
      exit;
    end
    else
    begin
      Result := 0; // no intersection
      exit;
    end;
  end;
  // they are not parallel
  // compute intersect param
  sI := N / D;
  if (sI < 0) or (sI > 1) then
  begin
    Result := 0; // no intersection
    exit;
  end;
  i.x := s.position.x + u.x * si;
  i.y := s.position.y + u.y * si;
  i.z := s.position.z + u.z * si;

  {  i.x := v.x ;//- Pn.position.x;
    i.y := v.y ;//- Pn.position.y;
    i.z := v.z ;//- Pn.position.z;

  {  l1 := VectorDistance(pn.position, v);
    v1.x := abs(i.x / l1);
    v1.y := abs(i.y / l1);
    v1.z := abs(i.z / l1);

    if (v1.x < v1.y) and (v1.x < v1.z) then
      direct := 1
    else
      if (v1.y < v1.z) and (v1.y < v1.x) then
      direct := 2
    else
      if (v1.z < v1.x) and (v1.z < v1.y) then
      direct := 3;  }

  {$IFDEF DICOMDEBUGZ}
  //SendDebug(Format('%8.2f,%8.2f,%8.2f--%8.2f,%8.2f,%8.2f',
  //  [v1.x, v1.y, v1.z, i.x, i.y, i.z]));
  // SendDebug('read(' +      IntToHex(FGroup, 4) + ',' + IntToHex(FElement, 4) + ')');
  {$ENDIF}

  //  I := VectorAdd(S.position, VectorScalar(u, si));
    //* I = S.P0 + sI * u; // compute segment intersect point
  Result := 1;
end;   *)
//===================================================================

function pointOnLine(aLine: TStructLine3D; distance: Single): TStructMatrix3D;
var
  offsetX, offsetY, offsetZ: Double;
begin
  Result := aLine.position;
  if ((aLine.lineVector.y = 0) and (aLine.lineVector.z = 0)) then
    Result.x := aLine.position.x + distance
  else
    if ((aLine.lineVector.x = 0) and (aLine.lineVector.y = 0)) then
    Result.z := aLine.position.z + distance
  else
    if ((aLine.lineVector.x = 0) and (aLine.lineVector.z = 0)) then
    Result.y := aLine.position.y + distance
  else
  begin
    offsetX := (distance * aLine.lineVector.x);
    offsetY := (distance * aLine.lineVector.y);
    offsetZ := (distance * aLine.lineVector.z);

    Result.x := aLine.position.x + offsetX;
    Result.y := aLine.position.y + offsetY;
    Result.z := aLine.position.z + offsetZ;
  end;
end;

function distanceOfPoint(aPoint, bPoint: TStructMatrix3D): Single;
begin
  Result := sqrt(power(aPoint.x - bPoint.x, 2) +
    power(aPoint.y - bPoint.y, 2) +
    power(aPoint.z - bPoint.z, 2));
end;
// dist_Point_to_Segment(): get the distance of a point to a segment.
//    Input:  a Point P and a Segment S (in any dimension)
//    Return: the shortest distance from P to S

function dist_Point_to_Segment3D(aPoint, bPoint, cPoint: TStructMatrix3D): Double;
var
  b, c1, c2: Double;
  v, w, pb: TStructMatrix3D;
begin
  v := VectorSub(bPoint, aPoint);
  w := VectorSub(cPoint, aPoint);

  c1 := dotproduct(w, v);
  if (c1 <= 0) then
  begin
    Result := distanceOfPoint(cPoint, aPoint);
    exit;
  end;

  c2 := dotproduct(v, v);
  if (c2 <= c1) then
  begin
    Result := distanceOfPoint(cPoint, bPoint);
    exit;
  end;
  b := c1 / c2;
  Pb := VectorAdd(aPoint, VectorScalar(v, b));
  Result := distanceOfPoint(cPoint, Pb);
end;

function distanceOnLine(aLine: TStructLine3D; aPoint: TStructMatrix3D): Single;
var
  distance: Single;
begin
  distance := sqrt(power(aPoint.x - aLine.position.x, 2) +
    power(aPoint.y - aLine.position.y, 2) +
    power(aPoint.z - aLine.position.z, 2));
  if ((aLine.lineVector.x > 0) and (aPoint.x - aLine.position.x < 0)) then
    distance := -distance
  else
    if ((aLine.lineVector.x < 0) and (aPoint.x - aLine.position.x > 0)) then
    distance := -distance
  else
    if ((aLine.lineVector.y > 0) and (aPoint.y - aLine.position.y < 0)) then
    distance := -distance
  else
    if ((aLine.lineVector.y < 0) and (aPoint.y - aLine.position.y > 0)) then
    distance := -distance
  else
    if ((aLine.lineVector.z > 0) and (aPoint.z - aLine.position.z < 0)) then
    distance := -distance
  else
    if ((aLine.lineVector.z < 0) and (aPoint.z - aLine.position.z > 0)) then
    distance := -distance;

  Result := distance;
end;

function TDicomImage.planeForImage: TStructPlane3D;
var
  vectors, originArray: TDicomAttribute;
  vectorA, vectorB: TStructMatrix3D;
  APlane: TStructPlane3D;
begin
  vectors := Attributes.GetItem($20, $37); // ImageOrientationPatient"
  originArray := Attributes.GetItem($20, $32); //ImagePositionPatient
  //40[0020:0032](ImagePositionPatient)DS=<3>-89.824210\-469.332100\-820.860700
  //441[0020:0037](ImageOrientationPatient)DS=<6>1.000000\0.000000\0.000000\0.000000\0.994522\-0.104528
  if assigned(vectors) and (vectors.GetCount = 6) then
  begin
    vectorA.x := vectors.AsFloat[0];
    vectorA.y := vectors.AsFloat[1];
    vectorA.z := vectors.AsFloat[2];
    aPlane.XNormalVector := vectorA;

    vectorB.x := vectors.AsFloat[3];
    vectorB.y := vectors.AsFloat[4];
    vectorB.z := vectors.AsFloat[5];
    aPlane.YNormalVector := vectorB;

    aPlane.normalVector := crossProduct(vectorA, vectorB);
  end;
  if assigned(originArray) and (originArray.GetCount = 3) then
  begin
    aPlane.position.x := originArray.AsFloat[0];
    aPlane.position.y := originArray.AsFloat[1];
    aPlane.position.z := originArray.AsFloat[2];
  end;
  Result := aPlane
end;

procedure TDicomImage.DoFinishNewDrawObject(Sender: TObject);
var
  n1: TDicomDrawObject;
begin
  n1 := TDicomDrawObject(Sender);
  n1.RulerUnit := RulerUnit;
  n1.PenColor := PenColor;
  n1.fFontColor := LabelFontColor;
  n1.Font := Font;

  if assigned(fAfterNewDrawObject) then
    fAfterNewDrawObject(Sender);
end;

procedure TDicomImage.DoDrawObjectSize(Sender: TObject);
var
  //  f1, f2: Double;
  das: TDicomAttributes;
  //  da1: TDicomAttribute;
  av, sd, ar: double;
  AObject: TDicomDrawObject;
begin
  if assigned(fAfterObjectSize) then
    fAfterObjectSize(Sender)
  else
  begin
    das := fAttributes;
    AObject := TDicomDrawObject(Sender);
    case AObject.Kind of

      ldmiROI_Cycle, ldmiROI_Rect:
        begin
          CalAverage(Round(AObject.X[0]), Round(AObject.Y[0]), Round(AObject.X[1]),
            Round(AObject.Y[1]), av, sd, ar);
          AObject.CalText := Format('AV:%4.2f' + #13#10 + 'SD:%4.2f' + #13#10 + 'AR:%4.2f', [av,
            sd, ar]);
          if AObject.Name <> '' then
          begin
            //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AV, sd, ar, AObject.RelateFrameIndex]);
          end;
        end;
      ldmiPolyonA:
        begin
          if AObject.Name <> '' then
          begin
            //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AObject.CalcArea, AObject.CalcLength, 0, AObject.RelateFrameIndex]);
          end;
          AObject.CalText := AObject.Calc2Text;
        end;
      ldmiPolyonV:
        begin
          if AObject.Name <> '' then
          begin
            //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AObject.CalcVolume, AObject.CalcLength, 0, AObject.RelateFrameIndex]);
          end;
          AObject.CalText := AObject.Calc2Text;
        end;
      ldmiAngle:
        begin
          if AObject.Name <> '' then
          begin
            //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AObject.CalcAngle, 0, 0, AObject.RelateFrameIndex]);
          end;
          AObject.CalText := AObject.Calc2Text;
        end;
    else
      begin
        if AObject.Name <> '' then
        begin
          //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AObject.CalcLength, 0, 0, AObject.RelateFrameIndex]);
        end;
        AObject.CalText := AObject.Calc2Text;
      end;
    end;
  end;
end;

procedure TDicomImage.DoDrawObjectMove(Sender: TObject);
var
  //  f1, f2: Double;
//  das: TDicomAttributes;
  av, sd, ar: double;
  AObject: TDicomDrawObject;
begin
  if assigned(fAfterObjectMove) then
    fAfterObjectMove(Sender)
  else
  begin
    AObject := TDicomDrawObject(Sender);
    case AObject.Kind of

      ldmiROI_Cycle, ldmiROI_Rect:
        begin
          CalAverage(Round(AObject.X[0]), Round(AObject.Y[0]), Round(AObject.X[1]),
            Round(AObject.Y[1]), av, sd, ar);
          AObject.CalText := Format('AV:%4.2f' + #13#10 + 'SD:%4.2f' + #13#10 + 'AR:%4.2f', [av,
            sd, ar]);
          if AObject.Name <> '' then
          begin
            //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AV, sd, ar, AObject.RelateFrameIndex]);
          end;
        end;
    end;
  end;
end;

function TDicomImage.GetImagedata(AIndex: Integer): TDicomImageData;
var
  i, k: Integer;
  procedure cmn1;
  var i, k: Integer;
  begin
    if (FImageArray<>nil) and (FImageArray.Count > 1) and fOnlyViewMultiSelected2 then
    begin
      i := 0;
      Result := TDicomImageData(FImageArray[FBaseFrameIndex + 0]);
      for k := 0 to FImageArray.Count - 1 do
      begin
        if TDicomImageData(FImageArray[FBaseFrameIndex + k]).Selected then
        begin
          if i = AIndex then
          begin
            Result := TDicomImageData(FImageArray[FBaseFrameIndex + k]);
          end;
          inc(i);
        end;
      end
    end
    else
    begin
      //    if AIndex > 0 then
      //      CheckChineFrameCache;
      if (FImageArray<>nil) and (FImageArray.Count > FBaseFrameIndex + AIndex) then
        try
          result := TDicomImageData(FImageArray[FBaseFrameIndex + AIndex]);
        except
          result := nil;
        end
      else
        result := nil;
    end;
  end;
begin
  Result := nil;
  // FOMIN 08.01.2013 
  try
    if (Self=nil) then
      Exit;
    if ((FImageArrayBuffer<>nil) and
       fUseImageBuffer and
       assigned(FImageArrayBuffer))
    then
    begin
      if FImageArrayBuffer.Count > FBaseFrameIndex + AIndex then
        result := TDicomImageData(FImageArrayBuffer[FBaseFrameIndex + AIndex]);
    end
    else
      cmn1;
  except
    Result := nil;
  end;
end;

function TDicomImage.GetMinValue: Integer;
var
  d1: TDicomImageData;
begin
  d1 := GetImagedata(FCurrentFrame);
  if assigned(d1) then
    Result := d1.MinValue
  else
    Result := 0;
end;

destructor TDicomImage.Destroy;
var
  i: Integer;
begin
  for I := 0 to FInformationLabels.Count - 1 do // Iterate
  begin
    TDicomInformationLabel(FInformationLabels[i]).Free;
  end;
  FInformationLabels.Clear;
  FInformationLabels.Free;

  for I := 0 to fUndoBufferList.Count - 1 do // Iterate
  begin
    TDicomImageUndoInfo(fUndoBufferList[i]).Free;
  end;
  fUndoBufferList.Clear;
  fUndoBufferList.Free;

  for I := 0 to fCustomPalette.Count - 1 do // Iterate
  begin
    TDicomImagePalette(fCustomPalette[i]).Free;
  end;
  fCustomPalette.Clear;
  fCustomPalette.Free;

  {  for I := 0 to fTopoList.Count - 1 do // Iterate
    begin
      TTopoLine(fTopoList[i]).Free;
    end; // for
    fTopoList.Clear;
    fTopoList.Free;}
  if (fUseImageBuffer and assigned(FImageArrayBuffer)) then
  begin
    for I := 0 to FImageArrayBuffer.Count - 1 do // Iterate
    begin
      TDicomImageData(FImageArrayBuffer[i]).Free;
    end; // for
    FImageArrayBuffer.Clear;
    FImageArrayBuffer.Free;
  end;

  FCood.Free;
  FDrawObjects.Free;
  //  fMeasureValues.Free;
  fMeasureReport.Free;

  if assigned(fFont) then
    fFont.free;
  //jw - fix significant memory leak in fOverlaybuffer
  if fOverlayBuffer <> nil then
    FreeMem(FOverLayBuffer, Width * Height * SizeOf(Word));

  if fAVIStream <> nil then
  begin
    fAVIStream.Free;
    if (fAVIStreamFileName <> '') and FileExists(fAVIStreamFileName) then
      DeleteFile(fAVIStreamFileName);
  end;
  inherited Destroy;
end;

constructor TDicomImage.Create(AAttributes: TDicomAttributes);
var
  da1, da2, da3: TDicomAttribute;
  das1: TDicomAttributes;
  ob1: TOBStream;
  //  avifilename1: string;
begin
  fCurrentViewSize.cX := 0;
  fCurrentViewSize.cY := 0;

  FPostProcessed := false;

  fAVIStream := nil;
  fAVIStreamFileName := '';

  FBufferLength := AAttributes.FBufferLength;
  FDSADefaultFrame := 0;
  FModify := true;
  FViewModify := true;

  FImageAngle := 0;

  FUndoBufferCount := 10;

  fUndoBufferList := TList.Create;

  FInformationLabels := TList.Create;

  fCustomPalette := TList.Create;

  FPostFilter := -1;
  fLabelFontColor := clBlack;

  fFont := TFont.Create;
  fFont.Color := clRed;

  fPenColor := clRed;

  fOnlyViewMultiSelected1 := false;
  fOnlyViewMultiSelected2 := false;
  fOnlyViewMultiSelected3 := false;
  fOnlyViewMultiSelected4 := false;

  fMergeDataset := nil;
  fMergeFactor := 50;
  fMergeMode := false;

  fOverlayBuffer := nil;
  fOverlayBufferBits := 0;
  fRulerUnit := ruCentimeter;

  fMagnificationType := mftCUBIC; //mftNONE; //mftBILINEAR;

  fOverlayFontSizeMode := olmCalFromMin;
  fOverlayFontSizePrecent := 2.5;
  FMouseCtrlWwWlFactor := 3;
  FMouseWwWlFactor := 1;

  fDSAMode := false;

  fAspectRatio := 1;
  fMPRMode := false;

  fCanNotCacheData := false;

  fUseImageBuffer := false;
  FImageArrayBuffer := nil;

  FCalObjIndex := 0;
  FCurrentDicomPrintDPI := 1;

  FRescaleIntercept := 0;
  FRescaleSlope := 1;

  FRotate1 := 0;
  FVerFlip1 := false;
  FHozFlip1 := false;

  //  FRotate2 := 0;
  //  FVerFlip2 := false;
  //  FHozFlip2 := false;

    //  fTopoList := TList.Create;

  FImageArray := nil;
  FImageArray := nil;
  FAttributes := AAttributes;
  FCurrentFrame := 0;
  if assigned(FAttributes) then
  begin
    da1 := FAttributes.Item[$28, $2];
    if assigned(da1) then
      FSamplePerPixel := da1.AsInteger[0]
    else
      FSamplePerPixel := 1;
    //      raise Exception.Create('sample per pixel Attribute not found');
    da1 := FAttributes.Item[$28, $4];
    if assigned(da1) then
      FPhotometricInterpretation := Trim(da1.AsString[0])
    else
      FPhotometricInterpretation := 'MONOCHROME2';
    //      raise Exception.Create('Photometric Interpretation Attribute not found');
    da1 := FAttributes.Item[$28, $10];
    if assigned(da1) then
      FHeight := da1.AsInteger[0]
    else
      raise Exception.Create('Rows Attribute not found');
    da1 := FAttributes.Item[$28, $11];
    if assigned(da1) then
      FWidth := da1.AsInteger[0]
    else
      raise Exception.Create('Columns Attribute not found');

    da1 := FAttributes.Item[$28, $34];
    if assigned(da1) and (da1.GetCount >= 2) and (da1.AsInteger[1] <> 0) then
    begin
      fAspectRatio := da1.AsInteger[0] / da1.AsInteger[1];
      if da1.GetCount > 2 then
        fMPRMode := da1.AsInteger[2] <> 0;
    end
    else
      fAspectRatio := 1;

    da1 := FAttributes.Item[$28, $100];
    if assigned(da1) then
      fbits := da1.AsInteger[0]
    else
      raise Exception.Create('Bits Allocated Attribute not found');

    FUseBits := FAttributes.getInteger($28, $101);

    da1 := FAttributes.Item[$28, $1052];
    if assigned(da1) then
      FRescaleIntercept := da1.AsInteger[0];

    da1 := FAttributes.Item[$28, $1053];
    if assigned(da1) and (da1.AsFloat[0] <> 0) then
      FRescaleSlope := da1.AsFloat[0];

    FWindowCenter := 0;
    da1 := FAttributes.Item[$2809, $2000];
    if assigned(da1) then
      FWindowCenter := (da1.AsInteger[0]);
    if FWindowCenter = 0 then
    begin
      da1 := FAttributes.Item[$28, $1050];
      if assigned(da1) then
      begin
        FWindowCenter := (da1.AsInteger[0]);
      end;
    end;

    if FAttributes.Item[$28, $121] <> nil then
      FPixelPaddingValue := FAttributes.getInteger($28, $120)
    else
      FPixelPaddingValue := 0;

    fPixelRepresentation := FAttributes.getInteger($28, $103) = 0;

    //for self custom use
    da1 := FAttributes.Item[$28, $6]; // PlanarConfiguration
    if da1 = nil then
    begin
      if (FAttributes.GetString($8, $70) = 'CNSSoft') or
         (FAttributes.GetString($8, $70) = 'CNSoft') or
         (FAttributes.GetString($8, $70) = 'DicomVCL')
      then
        FPlanarConfiguration := 2
      else
        FPlanarConfiguration := 0;  
    end
    else
    begin
      FPlanarConfiguration := FAttributes.getInteger($28, $6);
      if (FAttributes.GetString($8, $70) = 'CNSSoft') or
         (FAttributes.GetString($8, $70) = 'CNSoft')
         {$IFDEF DICOMVCL_COLOR_PORLOR} or
           (FAttributes.GetString($8, $70) = 'DicomVCL')
         {$ENDIF}
      then
        FPlanarConfiguration := 2
          //if (FAttributes.GetString($8, $70) = 'CNSoft')and(FAttributes.Item[$10, $30]=nil) then//and (FPlanarConfiguration = 2) then
//   FPlanarConfiguration := 0
//else
//if (FAttributes.GetString($8, $70) = '') and (FPlanarConfiguration = 0) then
//  FPlanarConfiguration := 2
    end;
    //end;

  //    485[0028:0120](PixelPaddingValue)US_SS=<1>64036
    FWindowWidth := 0;
    da1 := FAttributes.Item[$2809, $2001];
    if assigned(da1) then
      FWindowWidth := (da1.AsInteger[0]);
    if FWindowWidth = 0 then
    begin
      da1 := FAttributes.Item[$28, $1051];
      if assigned(da1) then
        FWindowWidth := (da1.AsInteger[0]);
    end;

    da1 := FAttributes.Item[$28, $8];
    if assigned(da1) then
      FFrameCount := da1.AsInteger[0]
    else
      FFrameCount := 1;
    da1 := FAttributes.Item[32736, 16];
    if assigned(da1) and (da1.FDataArray.Count > 0) then
    begin
      FImageArray := da1.FDataArray;
      if ImageData[0].FLen <= FFrameCount * 4 then
        FBaseFrameIndex := 1
      else
        FBaseFrameIndex := 0;
      {if FImageArray.Count > FFrameCount then
        FBaseFrameIndex := FImageArray.Count - FFrameCount
      else
        FBaseFrameIndex := 0; }
      if FFrameCount > (FImageArray.Count - FBaseFrameIndex) then
        FFrameCount := FImageArray.Count - FBaseFrameIndex;

      da3 := FAttributes.Item[$2809, $0024];
      if assigned(da3) and (da3.GetCount > 0) then
      begin
        ob1 := da3.GetOBData(0);
        fAVIStreamFileName := DicomTempPath + FAttributes.getString($8, $18) + '.avi';
        ob1.SaveToFile(fAVIStreamFileName);

        //fAVIStreamFileName :=
        fAVIStream := TCnsAVIReader.Create;
        if fAVIStream.Open(fAVIStreamFileName) < 0 then
        begin
          fAVIStream.Free;
          fAVIStream := nil;
          DeleteFile(fAVIStreamFileName);
          fAVIStreamFileName := '';
        end
        else
          FFrameCount := fAVIStream.Ending - fAVIStream.Start + 1;
      end;
    end;
  //  else
  //    raise Exception.Create('none pixel data');
    {    FName := FAttributes.GetString(dPatientName);
        FSex := FAttributes.GetString(dPatientSex);
        FDOB := FAttributes.GetString(dPatientBirthDate);
        FPatientID := FAttributes.GetString(dPatientID);
        FInstitutionName := FAttributes.GetString(dInstitutionName);
        FManufacturerModelName := FAttributes.GetString(dManufacturerModelName);
        FStudyDate := FAttributes.GetString(dContentDate);
        FStudyTime := FAttributes.GetString(dContentTime);
        FSeriesDescription := FAttributes.GetString(dSeriesDescription);
        FSliceThickness := FAttributes.GetInteger(dSliceThickness); //  TP
        FKVP := FAttributes.GetInteger(dKVP); //             KVP
        FXRayTubeCurrent := FAttributes.GetInteger(dXRayTubeCurrent); //  ma
        //    if FSeriesDescription='' then
        //      FSeriesDescription  := FAttributes.GetString(dSeriesDescription);  }

    //    FInstanceNumber := FAttributes.GetInteger($2813, $6);
    //    if FInstanceNumber= 0 then
  //  begin
      FInstanceNumber := FAttributes.GetInteger(dInstanceNumber);
      {$IFNDEF FOR_TENFENG_MR}
      if FInstanceNumber = 0 then
        FInstanceNumber := FAttributes.GetInteger(dAcquisitionNumber);
      {$ENDIF}
  //  end;
    da1 := FAttributes.Item[$0028, $0030]; //ByContant[dPixelSpacing];
    if assigned(da1) and (da1.GetCount >= 2) then
    begin
      FPixelSpacingY := da1.AsFloat[0] / 10;
      FPixelSpacingX := da1.AsFloat[1] / 10;
    end
    else
    begin
      da1 := FAttributes.Item[$18, $1164];
      if assigned(da1) and (da1.GetCount >= 2) then
      begin
        FPixelSpacingY := da1.AsFloat[0] / 10;
        FPixelSpacingX := da1.AsFloat[1] / 10;
      end
      else
      begin
        da1 := FAttributes.Item[$5200, $9229];
        if assigned(da1) and (da1.GetCount > 0) and (da1.DataType = ddtAttributes) then
        begin
          das1 := da1.Attributes[0];

          da1 := das1.Item[$28, $9110];
          if assigned(da1) and (da1.GetCount > 0) then
          begin
            das1 := da1.Attributes[0];
            da1 := das1.Item[$28, $30];
            if assigned(da1) and (da1.GetCount >= 2) then
            begin
              FPixelSpacingY := da1.AsFloat[0] / 10;
              FPixelSpacingX := da1.AsFloat[1] / 10;
            end;
          end
        end
        else
        begin
          FPixelSpacingX := 0;
          FPixelSpacingY := 0;
        end;
      end;
    end;

    ApplyPresentationSate;

    da1 := FAttributes.GetItem($20, $32); //ImagePositionPatient
    if assigned(da1) then
    begin
      fImageOrigin.x := da1.AsFloat[0];
      fImageOrigin.y := da1.AsFloat[1];
      fImageOrigin.z := da1.AsFloat[2];
    end;
    da2 := FAttributes.Item[$20, $37]; //  ImageOrientationPatient
    if assigned(da2) then
    begin
      fImageVector[0].x := da2.AsFloat[0];
      fImageVector[0].y := da2.AsFloat[1];
      fImageVector[0].z := da2.AsFloat[2];
      fImageVector[1].x := da2.AsFloat[3];
      fImageVector[1].y := da2.AsFloat[4];
      fImageVector[1].z := da2.AsFloat[5];
      fImageVector[2] := crossProduct(fImageVector[0], fImageVector[1]);
      //fImageVector[2].x := da2.AsFloat[1] * da2.AsFloat[5] - da2.AsFloat[2] * da2.AsFloat[4];
      //fImageVector[2].y := da2.AsFloat[2] * da2.AsFloat[3] - da2.AsFloat[0] * da2.AsFloat[5];
      //fImageVector[2].z := da2.AsFloat[0] * da2.AsFloat[4] - da2.AsFloat[1] * da2.AsFloat[3];

      if (abs(fImageVector[2].x) > abs(fImageVector[2].y)) and
        (abs(fImageVector[2].x) > abs(fImageVector[2].z)) then
      begin
        //	NSLog(@"Saggital");
        fsliceLocation := fImageOrigin.x;
        fSliceAxel := 0;
      end;

      if (abs(fImageVector[2].y) > abs(fImageVector[2].x)) and
        (abs(fImageVector[2].y) > abs(fImageVector[2].z))
        then
      begin
        //	NSLog(@"Coronal");
        fsliceLocation := fImageOrigin.y;
        fSliceAxel := 1;
      end;

      if (abs(fImageVector[2].z) > abs(fImageVector[2].x)) and
        (abs(fImageVector[2].z) > abs(fImageVector[2].y))
        then
      begin
        //	NSLog(@"Axial");
        fsliceLocation := fImageOrigin.z;
        fSliceAxel := 2;
      end;
    end;

  end;
  FCood := TCoodZoomEx.Create;
  //  fMeasureValues := TStringList.Create;
  fMeasureReport := TStringList.Create;
  FDrawObjects := TDicomDrawObjects.Create(self, @self.fCood);
  FDrawObjects.OnAfterNewDrawObject := DoFinishNewDrawObject;
  FDrawObjects.OnAfterObjectSize := DoDrawObjectSize;
  FDrawObjects.OnAfterObjectMove := DoDrawObjectMove;

  fOffsetX := 0;
  fOffsetY := 0;
  //  fZoom1 := 1;
  fViewerZoom := 1;
end;

constructor TDicomImage.Create(AAttributes, AView: TDicomAttributes);
var
  da1, da2, da3: TDicomAttribute;
  ob1: TOBStream;
  //avifilename1: string;
begin
  FPostProcessed := false;

  fAVIStream := nil;
  fAVIStreamFileName := '';

  FBufferLength := AAttributes.FBufferLength;
  FDSADefaultFrame := 0;
  FModify := true;
  FViewModify := true;

  FImageAngle := 0;

  FUndoBufferCount := 10;

  FInformationLabels := TList.Create;
  fCustomPalette := TList.Create;

  FPostFilter := -1;
  fLabelFontColor := clBlack;

  fFont := TFont.Create;
  fOnlyViewMultiSelected1 := false;
  fOnlyViewMultiSelected2 := false;
  fOnlyViewMultiSelected3 := false;
  fOnlyViewMultiSelected4 := false;

  fMergeDataset := nil;
  fMergeFactor := 50;
  fMergeMode := false;

  fOverlayBuffer := nil;
  fOverlayBufferBits := 0;
  fRulerUnit := ruCentimeter;

  fMagnificationType := mftNONE; //mftBILINEAR;

  fCanNotCacheData := false;

  fUseImageBuffer := false;
  FImageArrayBuffer := nil;

  FCalObjIndex := 0;
  FCurrentDicomPrintDPI := 1;

  FRescaleIntercept := 0;
  FRescaleSlope := 1;

  FRotate1 := 0;
  FVerFlip1 := false;
  FHozFlip1 := false;

  //  FRotate2 := 0;
  //  FVerFlip2 := false;
  //  FHozFlip2 := false;

    //  fTopoList := TList.Create;

  FImageArray := nil;
  FImageArray := nil;
  FAttributes := AAttributes;
  FCurrentFrame := 0;
  if assigned(FAttributes) then
  begin
    da1 := FAttributes.Item[$28, $2];
    if assigned(da1) then
      FSamplePerPixel := da1.AsInteger[0]
    else
      FSamplePerPixel := 1;
    //      raise Exception.Create('sample per pixel Attribute not found');
    da1 := FAttributes.Item[$28, $4];
    if assigned(da1) then
      FPhotometricInterpretation := Trim(da1.AsString[0])
    else
      FPhotometricInterpretation := 'MONOCHROME2';
    //      raise Exception.Create('Photometric Interpretation Attribute not found');
    da1 := FAttributes.Item[$28, $10];
    if assigned(da1) then
      FHeight := da1.AsInteger[0]
    else
      raise Exception.Create('Rows Attribute not found');
    da1 := FAttributes.Item[$28, $11];
    if assigned(da1) then
      FWidth := da1.AsInteger[0]
    else
      raise Exception.Create('Columns Attribute not found');
    da1 := FAttributes.Item[$28, $100];
    if assigned(da1) then
      fbits := da1.AsInteger[0]
    else
      raise Exception.Create('Bits Allocated Attribute not found');

    FUseBits := FAttributes.getInteger($28, $101);

    da1 := FAttributes.Item[$28, $1052];
    if assigned(da1) then
      FRescaleIntercept := da1.AsInteger[0];

    da1 := FAttributes.Item[$28, $1053];
    if assigned(da1) and (da1.AsFloat[0] <> 0) then
      FRescaleSlope := da1.AsFloat[0];

    FWindowCenter := 0;
    da1 := FAttributes.Item[$2809, $2000];
    if assigned(da1) then
      FWindowCenter := (da1.AsInteger[0]);
    if FWindowCenter = 0 then
    begin
      da1 := FAttributes.Item[$28, $1050];
      if assigned(da1) then
        FWindowCenter := (da1.AsInteger[0]);
    end;

    if FAttributes.Item[$28, $121] <> nil then
      FPixelPaddingValue := FAttributes.getInteger($28, $120)
    else
      FPixelPaddingValue := 0;

    fPixelRepresentation := FAttributes.getInteger($28, $103) = 0;

    //for self custom use
    da1 := FAttributes.Item[$28, $6];
    if da1 = nil then
    begin
      if (FAttributes.GetString($8, $70) = 'CNSSoft') or (FAttributes.GetString($8, $70) = 'CNSoft') or (FAttributes.GetString($8, $70) = 'DicomVCL') then
        FPlanarConfiguration := 2
      else
        FPlanarConfiguration := 0;
    end
    else
    begin
      FPlanarConfiguration := FAttributes.getInteger($28, $6);
      if (FAttributes.GetString($8, $70) = 'CNSSoft') or (FAttributes.GetString($8, $70) = 'CNSoft'){$IFDEF DICOMVCL_COLOR_PORLOR} or (FAttributes.GetString($8, $70) = 'DicomVCL'){$ENDIF} then
        FPlanarConfiguration := 2
          //if (FAttributes.GetString($8, $70) = 'CNSoft') and (FAttributes.Item[$10, $30] = nil) then // and (FPlanarConfiguration = 2) then
//  FPlanarConfiguration := 0
//else
//  if (FAttributes.GetString($8, $70) = '') and (FPlanarConfiguration = 0) then
//  FPlanarConfiguration := 2
    end;
    //end;

    //    485[0028:0120](PixelPaddingValue)US_SS=<1>64036
    FWindowWidth := 0;
    da1 := FAttributes.Item[$2809, $2001];
    if assigned(da1) then
      FWindowWidth := (da1.AsInteger[0]);
    if FWindowWidth = 0 then
    begin
      da1 := FAttributes.Item[$28, $1051];
      if assigned(da1) then
        FWindowWidth := (da1.AsInteger[0]);
    end;

    da1 := FAttributes.Item[$28, $8];
    if assigned(da1) then
      FFrameCount := da1.AsInteger[0]
    else
      FFrameCount := 1;

    da1 := AView.Item[32736, 16];
    if assigned(da1) then
    begin
      FImageArray := da1.FDataArray;
      if ImageData[0].FLen <= FFrameCount * 4 then
        FBaseFrameIndex := 1
      else
        FBaseFrameIndex := 0;
      {if FImageArray.Count > FFrameCount then
        FBaseFrameIndex := FImageArray.Count - FFrameCount
      else
        FBaseFrameIndex := 0; }
      if FFrameCount > (FImageArray.Count - FBaseFrameIndex) then
        FFrameCount := FImageArray.Count - FBaseFrameIndex;

      da3 := FAttributes.Item[$2809, $0024];
      if assigned(da3) and (da3.GetCount > 0) then
      begin
        ob1 := da3.GetOBData(0);
        fAVIStreamFileName := DicomTempPath + FAttributes.getString($8, $18) + '.avi';
        ob1.SaveToFile(fAVIStreamFileName);

        //fAVIStreamFileName :=
        fAVIStream := TCnsAVIReader.Create;
        if fAVIStream.Open(fAVIStreamFileName) < 0 then
        begin
          fAVIStream.Free;
          fAVIStream := nil;
          DeleteFile(fAVIStreamFileName);
          fAVIStreamFileName := '';
        end
        else
          FFrameCount := fAVIStream.Ending - fAVIStream.Start + 1;
      end;
    end
    else
    begin
      raise Exception.Create('none pixel data');
    end;
    {if assigned(da1) then
    begin
      FImageArray := da1.FDataArray;
      if FImageArray.Count > FFrameCount then
        FBaseFrameIndex := FImageArray.Count - FFrameCount
      else
        FBaseFrameIndex := 0;
    end
    else
      raise Exception.Create('none pixel data');}

    {    FName := FAttributes.GetString(dPatientName);
        FSex := FAttributes.GetString(dPatientSex);
        FDOB := FAttributes.GetString(dPatientBirthDate);
        FPatientID := FAttributes.GetString(dPatientID);
        FInstitutionName := FAttributes.GetString(dInstitutionName);
        FManufacturerModelName := FAttributes.GetString(dManufacturerModelName);
        FStudyDate := FAttributes.GetString(dContentDate);
        FStudyTime := FAttributes.GetString(dContentTime);
        FSeriesDescription := FAttributes.GetString(dSeriesDescription);
        FSliceThickness := FAttributes.GetInteger(dSliceThickness); //  TP
        FKVP := FAttributes.GetInteger(dKVP); //             KVP
        FXRayTubeCurrent := FAttributes.GetInteger(dXRayTubeCurrent); //  ma
        //    if FSeriesDescription='' then
        //      FSeriesDescription  := FAttributes.GetString(dSeriesDescription);  }

    //    FInstanceNumber := FAttributes.GetInteger($2813, $6);
    //    if FInstanceNumber= 0 then
    begin
      FInstanceNumber := FAttributes.GetInteger(dInstanceNumber);
      {$IFNDEF FOR_TENFENG_MR}
      if FInstanceNumber = 0 then
        FInstanceNumber := FAttributes.GetInteger(dAcquisitionNumber);
      {$ENDIF}
    end;
    da1 := FAttributes.Item[$0028, $0030]; //ByContant[dPixelSpacing];
    if assigned(da1) and (da1.GetCount >= 2) then
    begin
      FPixelSpacingY := da1.AsFloat[0] / 10;
      FPixelSpacingX := da1.AsFloat[1] / 10;
    end
    else
    begin
      da1 := FAttributes.Item[$18, $1164];
      if assigned(da1) and (da1.GetCount >= 2) then
      begin
        FPixelSpacingY := da1.AsFloat[0] / 10;
        FPixelSpacingX := da1.AsFloat[1] / 10;
      end
      else
      begin
        FPixelSpacingX := 0;
        FPixelSpacingY := 0;
      end;
    end;

    da1 := FAttributes.GetItem($20, $32); //ImagePositionPatient
    if assigned(da1) then
    begin
      fImageOrigin.x := da1.AsFloat[0];
      fImageOrigin.y := da1.AsFloat[1];
      fImageOrigin.z := da1.AsFloat[2];
    end;
    da2 := FAttributes.Item[$20, $37]; //  ImageOrientationPatient
    if assigned(da2) then
    begin
      fImageVector[0].x := da2.AsFloat[0];
      fImageVector[0].y := da2.AsFloat[1];
      fImageVector[0].z := da2.AsFloat[2];
      fImageVector[1].x := da2.AsFloat[3];
      fImageVector[1].y := da2.AsFloat[4];
      fImageVector[1].z := da2.AsFloat[5];
      fImageVector[2] := crossProduct(fImageVector[0], fImageVector[1]);
      //fImageVector[2].x := da2.AsFloat[1] * da2.AsFloat[5] - da2.AsFloat[2] * da2.AsFloat[4];
      //fImageVector[2].y := da2.AsFloat[2] * da2.AsFloat[3] - da2.AsFloat[0] * da2.AsFloat[5];
      //fImageVector[2].z := da2.AsFloat[0] * da2.AsFloat[4] - da2.AsFloat[1] * da2.AsFloat[3];

      if (abs(fImageVector[2].x) > abs(fImageVector[2].y)) and
        (abs(fImageVector[2].x) > abs(fImageVector[2].z)) then
      begin
        //	NSLog(@"Saggital");
        fsliceLocation := fImageOrigin.x;
        fSliceAxel := 0;
      end;

      if (abs(fImageVector[2].y) > abs(fImageVector[2].x)) and
        (abs(fImageVector[2].y) > abs(fImageVector[2].z))
        then
      begin
        //	NSLog(@"Coronal");
        fsliceLocation := fImageOrigin.y;
        fSliceAxel := 1;
      end;

      if (abs(fImageVector[2].z) > abs(fImageVector[2].x)) and
        (abs(fImageVector[2].z) > abs(fImageVector[2].y))
        then
      begin
        //	NSLog(@"Axial");
        fsliceLocation := fImageOrigin.z;
        fSliceAxel := 2;
      end;
    end;
  end;

  FCood := TCoodZoomEx.Create;
  //  fMeasureValues := TStringList.Create;
  fMeasureReport := TStringList.Create;
  FDrawObjects := TDicomDrawObjects.Create(self, @self.fCood);
  FDrawObjects.OnAfterNewDrawObject := DoFinishNewDrawObject;
  FDrawObjects.OnAfterObjectSize := DoDrawObjectSize;
  FDrawObjects.OnAfterObjectMove := DoDrawObjectMove;

  fOffsetX := 0;
  fOffsetY := 0;
  //  fZoom1 := 1;
  fViewerZoom := 1;
end;

procedure TDicomImage.SetWidth(Value: Integer);
var
  da1: TDicomAttribute;
  n1: TDicomImageData;
  new_data, old_data: Pointer;
  new_datab, old_datab: ^Byte;
  new_dataw, old_dataw: ^Word;
  new_Len, x, y, k, zzz: Integer;
begin
  if FWidth <> Value then
  begin
    UseImageBuffer := False;
    for zzz := 0 to FImageArray.Count - 1 do
    begin
      n1 := GetImagedata(zzz);
      if not assigned(n1) then
        break;
      new_len := Value * FHeight * ((FBits + 8) div 8) * FSamplePerPixel;
      GetMem(new_data, new_len);
      old_Data := n1.Data;
      if FBits <= 8 then
      begin
        new_datab := new_data;
        old_datab := old_data;
        for y := 0 to FHeight - 1 do
        begin
          for x := 0 to FWidth - 1 do
          begin
            if x >= Value then
            begin
              inc(old_datab, (FWidth - Value) * FSamplePerPixel);
              break;
            end;
            for k := 0 to FSamplePerPixel - 1 do
            begin
              new_Datab^ := old_datab^;
              inc(old_Datab);
              inc(new_datab);
            end;
          end;
          if Value > FWidth then
            for x := FWidth to Value - 1 do
            begin
              for k := 0 to FSamplePerPixel - 1 do
              begin
                new_Datab^ := $FF;
                inc(new_datab);
              end;
            end;
        end;
      end
      else
      begin
        new_dataw := new_data;
        old_dataw := old_data;
        for y := 0 to FHeight - 1 do
        begin
          for x := 0 to FWidth - 1 do
          begin
            if x >= Value then
            begin
              inc(old_dataw, FWidth - Value);
              break;
            end;
            new_Dataw^ := old_dataw^;
            inc(old_Dataw);
            inc(new_dataw);
          end;
          if Value > FWidth then
          begin
            for x := FWidth to Value - 1 do
            begin
              new_Dataw^ := $FFF;
              inc(new_dataw);
            end;
            //inc(new_dataw, Value - FWidth);
          end;
        end;
      end;
      n1.FImageData := new_data;
      n1.FLen := new_len;
      FreeMem(old_data);
    end;
    FWidth := Value;
    da1 := FAttributes.Item[$28, $11];
    da1.AsInteger[0] := FWidth;
  end;
end;

procedure TDicomImage.SetDSAMode(Value: Boolean);
begin
  if Value <> fDSAMode then
  begin
    FModify := true;
    if Value then
    begin
      if CurrentFrame = 0 then
        CurrentFrame := 1;

      if FImageArray.Count > 1 then
      begin
        fDSAMode := Value;

      end;
    end
    else
    begin
      fDSAMode := Value;
      //self.ReCalMaxMin();
    end;
    if Attributes.getInteger($28, $103) = 0 then
      RefreshMaxMinWord(ImageData[CurrentFrame])
    else
      RefreshMaxMin(ImageData[CurrentFrame]);
  end;
end;

procedure TDicomImage.SetHeight(Value: Integer);
var
  da1: TDicomAttribute;
  n1: TDicomImageData;
  new_data, old_data: Pointer;
  new_datab: ^Byte;
  //  new_dataw, old_dataw: ^Word;
  new_Len, zzz: Integer;
begin
  if FHeight <> Value then
  begin
    UseImageBuffer := False;
    for zzz := 0 to FImageArray.Count - 1 do
    begin
      n1 := GetImagedata(zzz);

      if not assigned(n1) then
        break;
      new_len := Value * FWidth * ((FBits + 8) div 8) * FSamplePerPixel;
      GetMem(new_data, new_len);
      old_Data := n1.Data;
      if Value > FHeight then
      begin
        Move(old_Data^, new_data^, n1.FLen);
        new_datab := new_data;
        inc(new_datab, n1.FLen);

        FillChar(new_datab^, new_len - n1.FLen, $FF);
      end
      else
      begin
        Move(old_Data^, new_data^, new_len);
      end;
      n1.FImageData := new_data;
      n1.FLen := new_len;
      FreeMem(old_data);
    end;
    FHeight := Value;
    da1 := FAttributes.Item[$28, $10];
    da1.AsInteger[0] := FHeight;
  end;
end;

procedure TDicomImage.GetPaletteTable;
var
  da1, da2: TDicomAttribute;
  k1, k2, k3: Integer;
  w1: WordP;
  b1: Bytep;
  p1: TOBStream;
  i: Integer;
  n1: TDicomImagePalette;
  IsSegmentedPalette: Boolean;

  procedure CreatePalette;
  begin
    if fCustomPalette.Count <= 0 then
    begin
      n1 := TDicomImagePalette.Create;
      fCustomPalette.Add(n1);
    end
    else
      n1 := TDicomImagePalette(fCustomPalette[0]);
  end;
begin
  IsSegmentedPalette := false;
  da1 := FAttributes.Item[$28, $1201];
  if not assigned(da1) then
  begin
    IsSegmentedPalette := true;
    da1 := FAttributes.Item[$28, $1221];
  end;

  if assigned(da1) then
  begin
    da2 := FAttributes.Item[$28, $1101];
    k1 := da2.AsInteger[0];
    k2 := da2.AsInteger[1];
    k3 := da2.AsInteger[2];

    p1 := da1.AsOBData[0];
    if p1 <> nil then
    begin
      CreatePalette;
      FreeMem(n1.FRedTable);
      if IsSegmentedPalette then
      begin
        k1 := 1 shl k3;
        Getmem(n1.FRedTable, k1);
        DecodeSegmentedPaletteColorLookupTableDataBytes(p1.Memory, p1.Size, n1.FRedTable, k1);

      end
      else
      begin
        Getmem(n1.FRedTable, k1); //(p1.Size div 2));
        if k3 > FBits then
        begin
          w1 := p1.Memory;
          for i := 0 to k1 - 1 do //(p1.Size div 2) - 1 do
          begin
            n1.FRedTable[i] := w1[i] shr 8;
          end;
        end
        else
        begin
          b1 := p1.Memory;
          for i := 0 to k1 - 1 do //(p1.Size div 2) - 1 do
          begin
            n1.FRedTable[i] := b1[i];
          end;
        end;
      end;
    end
    else
      exit;
  end
  else
    exit;
  da1 := FAttributes.Item[$28, $1202];
  if not assigned(da1) then
    da1 := FAttributes.Item[$28, $1222];

  if assigned(da1) then
  begin
    da2 := FAttributes.Item[$28, $1102];
    k1 := da2.AsInteger[0];
    k2 := da2.AsInteger[1];
    k3 := da2.AsInteger[2];

    p1 := da1.AsOBData[0];
    if p1 <> nil then
    begin
      CreatePalette;
      FreeMem(n1.FGreenTable);

      if IsSegmentedPalette then
      begin
        k1 := 1 shl k3;
        Getmem(n1.FGreenTable, k1);
        DecodeSegmentedPaletteColorLookupTableDataBytes(p1.Memory, p1.Size, n1.FGreenTable, k1);

      end
      else
      begin
        Getmem(n1.FGreenTable, k1); //(p1.Size div 2));

        if k3 > FBits then
        begin
          w1 := p1.Memory;
          for i := 0 to k1 - 1 do //(p1.Size div 2) - 1 do
          begin
            n1.FGreenTable[i] := w1[i] shr 8;
          end;
        end
        else
        begin
          b1 := p1.Memory;
          for i := 0 to k1 - 1 do //(p1.Size div 2) - 1 do
          begin
            n1.FGreenTable[i] := b1[i];
          end;
        end;
      end;
    end
    else
      exit;
  end
  else
    exit;

  da1 := FAttributes.Item[$28, $1203];
  if not assigned(da1) then
    da1 := FAttributes.Item[$28, $1223];
  if assigned(da1) then
  begin
    da2 := FAttributes.Item[$28, $1103];
    k1 := da2.AsInteger[0];
    k2 := da2.AsInteger[1];
    k3 := da2.AsInteger[2];

    p1 := da1.AsOBData[0];
    if p1 <> nil then
    begin
      CreatePalette;
      FreeMem(n1.FBlueTable);

      if IsSegmentedPalette then
      begin
        k1 := 1 shl k3;
        Getmem(n1.FBlueTable, k1);
        DecodeSegmentedPaletteColorLookupTableDataBytes(p1.Memory, p1.Size, n1.FBlueTable, k1);

      end
      else
      begin
        Getmem(n1.FBlueTable, k1); //(p1.Size div 2));

        if k3 > FBits then
        begin
          w1 := p1.Memory;
          for i := 0 to k1 - 1 do //(p1.Size div 2) - 1 do
          begin
            n1.FBlueTable[i] := w1[i] shr 8;
          end;
        end
        else
        begin
          b1 := p1.Memory;
          for i := 0 to k1 - 1 do //(p1.Size div 2) - 1 do
          begin
            n1.FBlueTable[i] := b1[i];
          end;
        end;
      end;
    end
    else
      exit;
  end
  else
    exit;
end;

// FOMIN 03.04.2012 
function TDicomImageData.GetMemStream:TMemoryStream;
var
  stm1: TDicomMemoryStream;
begin
  stm1 := TDicomMemoryStream.Create(Data, Flen);
  try
    stm1.SaveToStream(Result);
  finally // wrap up
    stm1.Free;
  end; // try/finally
end;

procedure TDicomImageData.SaveData(AFileName: AnsiString);
var vs:string;
  stm1: TDicomMemoryStream;
begin
  try
  if ((Data=nil) or (Flen=0)) then Exit;
  stm1 := TDicomMemoryStream.Create(Data, Flen);
  try
    stm1.SaveToFile(AFileName);
  finally // wrap up
    stm1.Free;
  end; // try/finally
  except
    on E:Exception do
      vs:=e.Message;
  end;
end;

function TDicomImageData.GetData: Pointer;
var v_ass : Boolean; vStr:string;
begin
  try
    v_ass:=Assigned(FImageData);
    if FImageDataMode = idsmMemoryData then
      Result := FImageData
    else if assigned(FImageStream) then
    begin
      GetMem(FImageData, FLen);
      FImageStream.Position := FImagePositionInStream;
      FImageStream.Read(FImageData^, FImageLenInStream);
      FImageDataMode := idsmMemoryData;
      Result := FImageData;
    end else
      Result := nil;
  except
    on E:Exception do begin
      vStr:=E.Message;
      Result := nil;
    end;
  end
end;

procedure TDicomImageData.LoadData(AFileName: AnsiString);
var
  stm1: TFileStream;
begin
  if FileExists(afilename) then
  begin
    stm1 := TFileStream.Create(AFilename, fmOpenRead);
    try
      GetMem(FImageData, FLen);
      stm1.Read(Data^, FLen);
    finally // wrap up
      stm1.Free;
    end; // try/finally
  end;
end;

procedure TDicomImageData.FreeData1;
begin
  FreeMem(FImageData, FLen);
  FImageData := nil;
end;

procedure TDicomImageData.ResetToStream;
begin
  if assigned(FImageStream) and assigned(FImageData) then
  begin
    FreeMem(FImageData);
    FImageData := nil;
    FImageDataMode := idsmStreamData;
    FHasDecompress := false;
  end;
end;

procedure TDicomImage.UpdateCood(AViewX, AViewY: Double; AXOff, AYOff: Integer; AZoom, APixelSpaceX, APixelSpaceY: Double);
begin
  fCood.fZoom := AZoom;
  if AZoom <> 0 then
    fCood.fDZoom := 1 / AZoom;
  fCood.RescaleSlopeX := APixelSpaceX;
  fCood.RescaleSlopeY := APixelSpaceY;

  fCood.fOffX := AXOff;
  fCood.fOffY := AYOff;

  fCood.ViewX := AViewX;
  fCood.ViewY := AViewY;
end;

procedure TDicomImage.UpdateCood(APixelSpaceX, APixelSpaceY: Double);
var
  i: integer;
  o1: TDicomDrawObject;
begin
  fCood.RescaleSlopeX := APixelSpaceX;
  fCood.RescaleSlopeY := APixelSpaceY;
  if assigned(FAfterObjectSize) then
    for i := 0 to FDrawObjects.FList.Count - 1 do
    begin
      o1 := TDicomDrawObject(FDrawObjects.FList[i]);
      if o1.Kind <> ldmiRulerCalc then
        FAfterObjectSize(o1);
    end;
end;

function readUint16(const adata: Pointer; AOffset: integer): Word;
var
  w1: Integer;
  Data: ByteP;
begin
  Data := AData;
  w1 := data[AOffset];
  Result := (w1 shl 8) or data[AOffset + 1];
end;

function scanJpegDataForBitDepth(Adata: Pointer;
  fragmentLength: Integer): Integer;
var
  offset: Integer;
  Data: ByteP;
begin
  offset := 0;
  Result := 0;
  Data := AData;
  while (offset + 4 < fragmentLength) do
  begin
    case (readUint16(adata, offset)) of
      $FFC0: // SOF_0: JPEG baseline
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFC1: // SOF_1: JPEG extended sequential DCT
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFC2: // SOF_2: JPEG progressive DCT
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFC3: // SOF_3: JPEG lossless sequential
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFC5: // SOF_5: differential (hierarchical) extended sequential, Huffman
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFC6: // SOF_6: differential (hierarchical) progressive, Huffman
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFC7: // SOF_7: differential (hierarchical) lossless, Huffman
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFC8: // Reserved for JPEG extentions
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFC9: // SOF_9: extended sequential, arithmetic
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFCA: // SOF_10: progressive, arithmetic
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFCB: // SOF_11: lossless, arithmetic
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFCD: // SOF_13: differential (hierarchical) extended sequential, arithmetic
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFCE: // SOF_14: differential (hierarchical) progressive, arithmetic
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFCF: // SOF_15: differential (hierarchical) lossless, arithmetic
        begin
          Result := data[offset + 4];
          exit;
        end;
      $FFC4: // DHT
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFCC: // DAC
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFD0, // RST m
      $FFD1,
        $FFD2,
        $FFD3,
        $FFD4,
        $FFD5,
        $FFD6,
        $FFD7:
        begin
          offset := offset + 2;
        end;
      $FFD8: // SOI
        begin
          offset := offset + 2;
        end;
      $FFD9: // EOI
        begin
          offset := offset + 2;
        end;
      $FFDA: // SOS
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFDB: // DQT
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFDC: // DNL
        begin
          offset := readUint16(adata, offset + 2) + 2;
        end;
      $FFDD: // DRI
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFDE: // DHP
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFDF: // EXP
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFE0, // APPn
      $FFE1,
        $FFE2,
        $FFE3,
        $FFE4,
        $FFE5,
        $FFE6,
        $FFE7,
        $FFE8,
        $FFE9,
        $FFEA,
        $FFEB,
        $FFEC,
        $FFED,
        $FFEE,
        $FFEF:
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFF0, // JPGn
      $FFF1,
        $FFF2,
        $FFF3,
        $FFF4,
        $FFF5,
        $FFF6,
        $FFF7,
        $FFF8,
        $FFF9,
        $FFFA,
        $FFFB,
        $FFFC,
        $FFFD:
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FFFE: // COM
        begin
          offset := offset + readUint16(adata, offset + 2) + 2;
        end;
      $FF01: // TEM
        begin
        end;
    else
      begin
        if ((data[offset] = $FF) and (data[offset + 1] > 2) and (data[offset + 1] <= $BF)) then
          // RES reserved markers
        begin
          offset := offset + 2;
        end
        else
          exit; // syntax error, stop parsing
      end;
    end;
  end; // while
  // no SOF marker found
end;

procedure TDicomImage.RefreshMaxMin(d1: TDicomImageData);
var
  ps1: PSmallInt;
  px1: PByte;
  i1, max16, min16: Integer;

begin
  if d1.Data = nil then
  begin
    d1.FMin := 0;
    d1.FMax := 0;
    exit;
  end;
  if (Copy(FPhotometricInterpretation, 1, 4) = 'MONO') then
  begin
    if FBits <= 8 then
    begin
      i1 := 0;
      if d1.Data = nil then
        exit;
      px1 := d1.Data;
      max16 := px1^;
      min16 := px1^;
      while I1 < (FHeight - 1) * (FWidth - 1) do
      begin
        //          value := px1^;
        if px1^ < min16 then
          min16 := px1^;
        if px1^ > max16 then
          max16 := px1^;
        inc(i1);
        inc(px1);
      end;
      d1.FMin := min16;
      d1.FMax := max16;
    end
    else
    begin //>8 bits
      ps1 := d1.Data;
      //pw1 := d1.Data;
      max16 := ps1^;
      min16 := ps1^;
      for i1 := 0 to (FHeight - 1) * (FWidth - 1) do
      begin

        //          pw1^ := pw1^ and $7FF;
        //          inc(pw1);

        if ps1^ < min16 then
          min16 := ps1^;
        if ps1^ > max16 then
          max16 := ps1^;
        inc(ps1);
      end;
      d1.FMin := min16;
      d1.FMax := max16;
      //d1.FMin := Trunc(d1.FMin * FRescaleSlope + FRescaleIntercept);
      //d1.FMax := Trunc(d1.FMax * FRescaleSlope + FRescaleIntercept);
    end;
  end
  else
  begin
    d1.FMin := 0;
    d1.FMax := 256;
  end
end;

procedure TDicomImage.RefreshMaxMinWord(d1: TDicomImageData);
var
  ps1: PWord;
  px1: PByte;
  i1, max16, min16: Integer;

begin
  if d1.Data = nil then
  begin
    d1.FMin := 0;
    d1.FMax := 0;
    exit;
  end;
  if (Copy(FPhotometricInterpretation, 1, 4) = 'MONO') then
  begin
    if FBits <= 8 then
    begin
      i1 := 0;
      if d1.Data = nil then
        exit;
      px1 := d1.Data;
      max16 := px1^;
      min16 := px1^;
      //while I1 < (FHeight - 1) * (FWidth - 1) do
      for i1 := 0 to (FHeight - 1) * (FWidth - 1) do
      begin
        //          value := px1^;
        if px1^ < min16 then
          min16 := px1^;
        if px1^ > max16 then
          max16 := px1^;
        //inc(i1);
        inc(px1);
      end;
      d1.FMin := min16;
      d1.FMax := max16;
    end
    else
    begin //>8 bits
      ps1 := d1.Data;
      //pw1 := d1.Data;
      max16 := ps1^;
      min16 := ps1^;
      for i1 := 0 to (FHeight - 1) * (FWidth - 1) do
      begin

        //          pw1^ := pw1^ and $7FF;
        //          inc(pw1);

        if ps1^ < min16 then
          min16 := ps1^;
        if ps1^ > max16 then
          max16 := ps1^;
        inc(ps1);
      end;
      d1.FMin := min16;
      d1.FMax := max16;
      d1.FMin := Trunc(d1.FMin * FRescaleSlope); //+ FRescaleIntercept);
      d1.FMax := Trunc(d1.FMax * FRescaleSlope); //+ FRescaleIntercept);
    end;
  end
  else
  begin
    d1.FMin := 0;
    d1.FMax := 256;
  end;
end;

procedure TDicomImage.RefreshMaxMinFloat(d1: TDicomImageData);
var
  ps1: PSingle;
  px1: PByte;
  i1: Integer;
  max16, min16: Single;

begin
  if d1.Data = nil then
  begin
    d1.FMin := 0;
    d1.FMax := 0;
    exit;
  end;
  if (Copy(FPhotometricInterpretation, 1, 4) = 'MONO') then
  begin
    if FBits <= 8 then
    begin
      i1 := 0;
      if d1.Data = nil then
        exit;
      px1 := d1.Data;
      max16 := px1^;
      min16 := px1^;
      //while I1 < (FHeight - 1) * (FWidth - 1) do
      for i1 := 0 to (FHeight - 1) * (FWidth - 1) do
      begin
        //          value := px1^;
        if px1^ < min16 then
          min16 := px1^;
        if px1^ > max16 then
          max16 := px1^;
        //inc(i1);
        inc(px1);
      end;
      d1.FMin := trunc(min16);
      d1.FMax := trunc(max16);
    end
    else
    begin //>8 bits
      ps1 := d1.Data;
      //pw1 := d1.Data;
      max16 := ps1^;
      min16 := ps1^;
      for i1 := 0 to (FHeight - 1) * (FWidth - 1) do
      begin

        //          pw1^ := pw1^ and $7FF;
        //          inc(pw1);

        if ps1^ < min16 then
          min16 := ps1^;
        if ps1^ > max16 then
          max16 := ps1^;
        inc(ps1);
      end;
      d1.FMin := trunc(min16);
      d1.FMax := trunc(max16);
    end;
  end
  else
  begin
    d1.FMin := 0;
    d1.FMax := 256;
  end;
end;

function TDicomImage.DecompressData(AIndex: Integer): Boolean;
var
  pb1: PByte;
  pw1: PWord;
  //  n: TDicomFastRLE;
  d1: TDicomImageData;
  {$IFDEF ECLZLIBTransferSyntax}
  e1: TECLMemoryStream;
  {$ENDIF}
  m1: TOBStream;
  pm1: PStream;
  pk1: Integer;
  depth: Integer;
  {.$IFDEF USE_16_TO_FLOAT_BUFFER}
  pFloatBuffer: Pointer;
  pFloatLen: Integer;
  {.$ENDIF}
begin
  Result := true;
  d1 := ImageData[AIndex];
  if d1 = nil then
    exit;

  Result := d1.FHasDecompress;
  if not Result then
  begin
    //decompress image if need
    case d1.FTransferSyntax of
      ImplicitVRLittleEndian,
        ExplicitVRLittleEndian,
        ExplicitVRBigEndian:
        begin
          if d1.FTransferSyntax = ExplicitVRBigEndian then
          begin
            SwapBigEndian(AIndex);
          end;
          Result := true;
        end;
      {$IFDEF ECLZLIBTransferSyntax}
      zlibFastestTransferSyntax,
        ppmFastestTransferSyntax,
        bzipFastestTransferSyntax,
        zlibMaxTransferSyntax,
        ppmMaxTransferSyntax,
        bzipMaxTransferSyntax,
        zlibNormalTransferSyntax,
        ppmNormalTransferSyntax,
        bzipNormalTransferSyntax:
        begin
          d1.fColorSpaceIsConverted := true;
          m1 := TOBStream.Create(d1.Data, d1.FLen);
          e1 := TECLMemoryStream.Create('');

          try
            //            e1.CompressedDataStream.LoadFromStream(m1);
            m1.SaveToStream(e1.CompressedDataStream);

            GetMem(pb1, e1.Size);
            {if e1.Size <> FWidth * FHeight * FSamplePerPixel * ((FBits + 7) div 8) then
            begin
              FPhotometricInterpretation := 'YBR_FULL_422';
              d1.fColorSpaceIsConverted := false;
            end;}
            e1.Read(pb1^, e1.Size); //FWidth * FHeight * FSamplePerPixel * ((FBits + 7) div 8));
            //            GetMem(pb1, e1.Size);
            //            e1.Read(pb1^, e1.Size);
            //m1.LoadFromStream(e1);
            d1.FImageData := pb1;
            d1.FLen := e1.Size; //FWidth * FHeight * FSamplePerPixel * ((FBits + 7) div 8);
            //FWidth * FHeight * FSamplePerPixel * ((FBits + 7) div 8);
          finally
            m1.Free;
            e1.Free;
          end;
          Result := true;
        end;
      {$ENDIF}
      RLELossless: //8198
        begin
          pw1 := d1.Data;
          //if pw1^ <> 0 then
          begin
            GetMem(pb1, FWidth * FHeight * FSamplePerPixel * ((FBits + 7) div 8));
            FastRLEdecodeBytes(d1.Data, d1.FLen, FWidth, FHeight, FBits, FSamplePerPixel, pb1,
              self.PlanarConfiguration);

            FreeMem(d1.FImageData);
            d1.FImageData := pb1;
            d1.FLen := FWidth * FHeight * FSamplePerPixel * ((FBits + 7) div 8);
            //d1.fColorSpaceIsConverted := true;
            Result := true;
          end;
        end;
      {$IFDEF NEEDJPEG2000}
      JPEGLossless80, JPEGNearLossless81: //for JPEG-LS, the dicom3tools rawnjl2 codec
        begin
          Result := true;
          d1.FImageData := nil;
          Result := true;
          d1.FLen := FWidth * FHeight * FSamplePerPixel * ((FBits + 7) div 8);
        end;
      JPEG2000Irreversible, JPEG2000Reversible: //for JPEG 2000, the Kakadu codec
        begin
          //d1.SaveData('C:\b2000.dat');
          pb1 := convertJPEG2000ToHost_openjpeg(d1.Data, d1.FLen, 0);
          d1.FImageData := pb1;
          Result := true;
          d1.FLen := FWidth * FHeight * FSamplePerPixel * ((FBits + 7) div 8);
          FPlanarConfiguration := 0;
          d1.fColorSpaceIsConverted := true;
        end;
      {$ENDIF}
      JPEGLossless14, JPEGLossless15,
        JPEGLossless, //8197
      JPEGExtendedProcess_2_4, ////8199
      JPEGBaseline: //8196
        begin
          pw1 := d1.Data;
          if (pw1^ = $D8FF) then
          begin
            depth := scanJpegDataForBitDepth(d1.Data, d1.FLen);
            if depth = 0 then
              depth := FUseBits;
            m1 := TOBStream.Create(d1.Data, d1.FLen);
            //m1.SaveToFile('c:\111.jpg');
            try
              pm1 := @m1;
              //convertJPEG12ToHost
              //convertJPEG16ToHost
              //convertJPEG8LosslessToHost
              try
                if depth <= 8 then
                begin
                  if FPlanarConfiguration = 1 then
                    FPlanarConfiguration := 0;
                  d1.fColorSpaceIsConverted := true;
                  pk1 := Getphotometric(PhotometricInterpretation);
                  if (d1.FTransferSyntax = JPEGBaseline) and (pk1 = 2) then
                  begin
                    {if FSamplePerPixel = 3 then
                    begin
                      pb1 := DecompressJPEG8(pm1, FSamplePerPixel, FHeight, FWidth, pk1);
                      FPlanarConfiguration := 2;
                    end
                    else}
                  //  begin
                      pk1 := -1;
                      pb1 := convertJPEG8ToHost(pm1, FSamplePerPixel, FHeight, FWidth, pk1);
                  //  end;
                  end
                  else
                    pb1 := convertJPEG8ToHost(pm1, FSamplePerPixel, FHeight, FWidth, pk1);
                end
                else
                  if depth <= 12 then
                  pb1 := convertJPEG12ToHost(pm1, FSamplePerPixel, FHeight, FWidth)
                else
                  pb1 := convertJPEG16ToHost(pm1, FSamplePerPixel, FHeight, FWidth);
              except
                on e: Exception do
                begin
                  ShowMessage(e.Message);
                  pb1 := nil;
                end;
              end;
            finally
              m1.Free;
            end;

            d1.FImageData := pb1;
            Result := true;
            d1.FLen := FWidth * FHeight * FSamplePerPixel * ((FBits + 7) div 8);

//            d1.FImageData
//            d1.TransferSyntax
          //  d1.SaveData('d:\__to_delete\1.dcm');

          end
          else
            raise Exception.Create('Decompress error for jpeg');
        end
    else
      begin
        if d1.FTransferSyntax>0 then        
          if assigned(UIDS.ItemByConstant[d1.FTransferSyntax]) then
            raise Exception.Create(V_NOT_SUPPORT_DICOM_FORMAT +
              UIDS.ItemByConstant[d1.FTransferSyntax].Name)
          else
            raise Exception.Create(V_NOT_SUPPORT_DICOM_FORMAT);
        exit;
      end;
    end;
    d1.FHasDecompress := Result;
    if Result then
      GetPaletteTable;

    //    if d1.FPhotometricInterpretation1 = '' then
    //      d1.FPhotometricInterpretation1 := FPhotometricInterpretation;
    if not d1.fColorSpaceIsConverted then
    begin
      ConvertToRGB(d1);
      ClearPalette;
    end;
    PrepareOverlayData;

    {.$IFDEF USE_16_TO_FLOAT_BUFFER}
    if FBufferLength = diblFloat then
    begin
      if (fBits > 8) and (FSamplePerPixel = 1) then
      begin
        pFloatLen := fWidth * fHeight * SizeOf(Single);
        GetMem(pFloatBuffer, pFloatLen);
        if fPixelRepresentation then
          vImageConvert_16UtoF(d1.Data, fwidth, fHeight,
            pFloatBuffer, fWidth, fHeight, FRescaleSlope, FRescaleIntercept)
        else
          vImageConvert_16StoF(d1.Data, fwidth, fHeight,
            pFloatBuffer, fWidth, fHeight, FRescaleSlope, FRescaleIntercept);
        FreeMem(d1.FImageData);
        d1.FImageData := pFloatBuffer;
        d1.FLen := pFloatLen;

        RefreshMaxMinFloat(d1);
      end
      else
      begin
        if PixelRepresentation then //(Attributes.getInteger($28, $103) = 0) then
          RefreshMaxMinWord(d1)
        else
          RefreshMaxMin(d1);
      end;
      {.$ELSE}
    end
    else
    begin

      if PixelRepresentation then //(Attributes.getInteger($28, $103) = 0) then
        RefreshMaxMinWord(d1)
      else
        RefreshMaxMin(d1);
    end; {.$ENDIF}
  end;
end;

destructor TDicomImageData.Destroy;
begin
  if not FCanNotFreeBuffer then
    FreeMem(FImageData, FLen);
  inherited Destroy;
end;

constructor TDicomImageData.Create(AData: TDicomImageData);
begin
  FCanNotFreeBuffer := false;

  FHasDecompress := AData.FHasDecompress;
  GetMem(FImageData, AData.FLen);
  Move(AData.Data^, FImageData^, AData.FLen);
  //AData.FData;
  FLen := AData.FLen;
  FTransferSyntax := AData.FTransferSyntax;
  fColorSpaceIsConverted := AData.fColorSpaceIsConverted;
  FImageDataMode := AData.FImageDataMode;
  //    FPhotometricInterpretation1 := AData.FPhotometricInterpretation1;

  FImageStream := nil;
  FImageLenInStream := 0;
  FImagePositionInStream := 0;
  FImageDataMode := idsmMemoryData;
end;

constructor TDicomImageData.Create(ATransferSyntax: Integer; AData: Pointer; ALen: Integer);
begin
  FCanNotFreeBuffer := false;

  FHasDecompress := false;
  FImageData := AData;
  FLen := ALen;
  FTransferSyntax := ATransferSyntax;
  fColorSpaceIsConverted := false;

  FImageStream := nil;
  FImageLenInStream := 0;
  FImagePositionInStream := 0;
  FImageDataMode := idsmMemoryData;

  //    FPhotometricInterpretation1 := '';
end;

constructor TDicomImageData.Create(ALen: Integer);
begin
  FCanNotFreeBuffer := false;

  FHasDecompress := false;
  GetMem(FImageData, ALen);

  FillChar(FImageData^, ALen, 0);

  FLen := ALen;
  FTransferSyntax := 8194;
  fColorSpaceIsConverted := false;

  FImageStream := nil;
  FImageLenInStream := 0;
  FImagePositionInStream := 0;
  FImageDataMode := idsmMemoryData;
  //    FPhotometricInterpretation1:='';
end;

constructor TDicomImageData.Create(ATransferSyntax: Integer; AData: TStream; ALen: Integer);
begin
  FCanNotFreeBuffer := false;

  FHasDecompress := false;
  FImageData := nil;
  FLen := ALen;
  FTransferSyntax := ATransferSyntax;
  fColorSpaceIsConverted := false;

  FImageStream := AData;
  FImagePositionInStream := AData.Position;
  FImageDataMode := idsmStreamData;
  FImageLenInStream := ALen;
  AData.Position := AData.Position + ALen;
  //  FPhotometricInterpretation:='';
end;

destructor TDicomStream.Destroy;
begin
  inherited Destroy;
end;

function TDicomStream.Read(var Buffer; Count: integer): Integer;
begin
  Result := FStream.Read(Buffer, Count);
end;

function TDicomStream.Write(const Buffer; Count: Integer): Integer;
begin
  Result := FStream.Write(Buffer, Count);
end;

{function TDicomStream.LoadFromStream(AStream: TStream): Integer;
begin

end;

function TDicomStream.SavetoStream(AStream: TStream): integer;
begin

end; }

procedure TDicomStream.SetPosition(AValue: Integer);
begin
  FStream.Position := AValue;
end;

function TDicomStream.GetSize: integer;
begin
  Result := FStream.Size;
end;

function TDicomStream.GetPosition: integer;
begin
  Result := FStream.Position;
end;

function TDicomStream.ReadInt8: Integer;
var
  b1: ShortInt;
begin
  FStream.Read(b1, 1);
  Result := b1;
end;

function TDicomStream.WriteInt8(i: Integer): Integer;
var
  b1: Byte;
begin
  Result := FStream.write(b1, 1);
end;

function TDicomStream.WriteInt16(i: Integer): Integer;
begin
  if TransferSyntax = ExplicitVRBigEndian then
  begin
    cc[1] := Byte(i);
    cc[0] := Byte((i shr {0} 8));
  end
  else
  begin
    cc[0] := Byte(i);
    cc[1] := Byte((i shr {0} 8));
  end; //end of if(a = 8195)
  Result := FStream.write(cc[0], 2);
end;

function TDicomStream.WriteInt32(i: Integer): Integer;
begin
  if TransferSyntax = ExplicitVRBigEndian then
  begin
    dd[3] := Byte(i);
    dd[2] := Byte((i shr {0} 8));
    dd[1] := Byte((i shr {0} 16));
    dd[0] := Byte((i shr {0} 24));
  end
  else
  begin
    dd[0] := Byte(i);
    dd[1] := Byte((i shr {0} 8));
    dd[2] := Byte((i shr {0} 16));
    dd[3] := Byte((i shr {0} 24));
  end; //end of if(a = 8195)
  Result := FStream.write(dd[0], 4);
end;

function TDicomStream.WriteInt64(l: Int64): Integer;
begin
  if TransferSyntax = ExplicitVRBigEndian then
  begin
    ee[7] := Byte(Integer(l));
    ee[6] := Byte(Integer((l shr {0} 8)));
    ee[5] := Byte(Integer((l shr {0} 16)));
    ee[4] := Byte(Integer((l shr {0} 24)));
    ee[3] := Byte(Integer((l shr {0} 32)));
    ee[2] := Byte(Integer((l shr {0} 40)));
    ee[1] := Byte(Integer((l shr {0} 48)));
    ee[0] := Byte(Integer((l shr {0} 56)));
  end
  else
  begin
    ee[0] := Byte(Integer(l));
    ee[1] := Byte(Integer((l shr {0} 8)));
    ee[2] := Byte(Integer((l shr {0} 16)));
    ee[3] := Byte(Integer((l shr {0} 24)));
    ee[4] := Byte(Integer((l shr {0} 32)));
    ee[5] := Byte(Integer((l shr {0} 40)));
    ee[6] := Byte(Integer((l shr {0} 48)));
    ee[7] := Byte(Integer((l shr {0} 56)));
  end; //end of if(a = 8195)
  Result := FStream.write(ee[0], 8);
end;

function TDicomStream.WriteString(astr: AnsiString): Integer;
begin
  Result := FStream.write(astr[1], Length(astr));
end;

procedure TDicomStream.skipBytes(ALen: Integer);
var
  p1: PByte;
begin
  GetMem(p1, ALen);
  FStream.Read(p1^, ALen);
  Freemem(p1);
end;

constructor TDicomStream.Create(Astream: TStream);
begin
  //  FFlag := TRUE;
  FStream := AStream;
  TransferSyntax := ImplicitVRLittleEndian;
  FKeepImageDataInStream := false;
  fJpegQuality := 100;
  FUseUndefineLength := false;
  FOnlyCurrentFrame := -1;
  FLoadFrameInThread := false;
end;

function TDicomStream.ReadInt16: Integer;
begin
  FStream.Read(cc[0], Length(cc));
  if TransferSyntax = ExplicitVRBigEndian then
  begin
    result := ((cc[0]) shl 8) + (cc[1]);
  end
  else
  begin
    result := ((cc[1]) shl 8) + (cc[0]);
  end; //end of if(TransferSyntax = 8195)
end; //end of F_k

function TDicomStream.ReadInt32: Integer;
begin
  FStream.Read(dd[0], Length(dd));
  if TransferSyntax = ExplicitVRBigEndian then
  begin
    result := (dd[3]);
    result := Result + (dd[2]) shl 8;
    Result := Result + (dd[1]) shl 16;
    Result := Result + (dd[0]) shl 24;
  end
  else
  begin
    Result := (dd[0]);
    Result := Result + (dd[1]) shl 8;
    Result := Result + (dd[2]) shl 16;
    Result := Result + (dd[3]) shl 24;
  end; //end of if(TransferSyntax = 8195)
end; //end of F_m

{function TDicomStream.ReadInteger: Integer;
begin
  FStream.Read(d[0], Length(d));
  Result := (d[0]);
  Result := Result + (d[1]) shl 8;
  Result := Result + (d[2]) shl 16;
  Result := Result + (d[3]) shl 24;
end; //end of F_m
}

function TDicomStream.ReadInt64: Int64;
begin
  FStream.Read(ee[0], Length(ee));
  if TransferSyntax = ExplicitVRBigEndian then
  begin
    Result := (ee[7]);
    Result := Result + (ee[6]) shl 8;
    Result := Result + (ee[5]) shl 16;
    Result := Result + (ee[4]) shl 24;
    Result := Result + Int64(ee[3]) shl 32;
    Result := Result + Int64(ee[2]) shl 40;
    Result := Result + Int64(ee[1]) shl 48;
    Result := Result + Int64(ee[0]) shl 56;
  end
  else
  begin
    Result := (ee[0]);
    Result := Result + (ee[1]) shl 8;
    Result := Result + (ee[2]) shl 16;
    Result := Result + (ee[3]) shl 24;
    Result := Result + Int64(ee[4]) shl 32;
    Result := Result + Int64(ee[5]) shl 40;
    Result := Result + Int64(ee[6]) shl 48;
    Result := Result + Int64(ee[7]) shl 56;
  end; //end of if(TransferSyntax = 8195)
end; //end of F_o

function TDicomStream.ReadString(i: Integer): AnsiString;
begin
  if i <= 16 then
    SetLength(Result, (((i - 1) div 2) + 1) * 2)
  else
    SetLength(Result, i);
  FStream.Read(Result[1], Length(Result));
end; //end of F_d(i:Integer)

function SortAttribute(Item1, Item2: Pointer): Integer;
var
  d1, d2: TDicomAttribute;
  k1, k2: LongWord;
begin
  d1 := TDicomAttribute(Item1);
  d2 := TDicomAttribute(Item2);
  k1 := d1.Group shl 16 + d1.Element;
  k2 := d2.Group shl 16 + d2.Element;
  if k1 > k2 then
    Result := 1
  else
    if k1 < k2 then
    Result := -1
  else
    Result := 0;
end;

procedure TDicomDataset.RecreateAttributes;
begin
  FAttributes := TDicomAttributes.Create;
end;

procedure TDicomDataset.SetStreamAndFileName(AStream: TStream; AFileName: AnsiString; CanBeDelete:
  Boolean);
begin
  if assigned(FImageStream) and (FImageStream <> AStream) then
  begin
    FImageStream.Free;
    FImageStream := nil;
  end;

  FImageStream := AStream;
  FImageFilename := AFileName;
  FDeleteImageFile := CanBeDelete and (AFileName <> '');
end;

// функция возврата свободной виртуальной памяти
function GetMemorySizeStr : string;
var Status: TMemoryStatus;
const cMb = 1024417;
const CEOL = #13#10;
      cmb1 = ' MB';
begin
  Status.dwLength := sizeof(TMemoryStatus);
  GlobalMemoryStatus(Status);
  Result := 'Количество используемой памяти в процентах (%) : '+
                floattostr(RoundTo(Status.dwMemoryLoad div cMb,-2))+CEOL+
            'Общее количество физической памяти в '+cmb1+' : '+
                floattostr(RoundTo(Status.dwTotalPhys div cMb,-2))+CEOL+
            'Количество оставшейся физической памяти в '+cmb1+' : '+
                floattostr(RoundTo(Status.dwAvailPhys div cMb,-2))+CEOL+
            'Объём страничного файла в '+cmb1+' : '+
                floattostr(RoundTo(Status.dwTotalPageFile div cMb,-2))+CEOL+
            'Свободного места в страничном файле : '+
                inttostr(Status.dwAvailPageFile)+CEOL+
            'Общий объём виртуальной памяти в '+cmb1+' : '+
                floattostr(RoundTo(Status.dwTotalVirtual div cMb,-2))+CEOL+
            'Количество свободной виртуальной памяти в '+cmb1+' : '+
                floattostr(RoundTo(Status.dwAvailVirtual div cMb,-2));
end;

function GetFreeVirtualMemoty : Extended;
var Status: TMemoryStatus;
const cMb = 1024417;
begin
  Status.dwLength := sizeof(TMemoryStatus);
  GlobalMemoryStatus(Status);
  Result := RoundTo(Status.dwAvailVirtual div cMb,-2);
end;

// процедура записи в лог-файл
procedure TDicomDataset.MnLg_ev ( const p_strs : ansistring;
                  const p_filename : ansistring = '';
                  const p_is_delim : Boolean = False;
                  const p_is_DT : boolean = True );
var F : TextFile; v_is_ex : Boolean;
const c_delim = '-------------------------------------------------------------------------------';
const c_free_space = 5; // свободное место на диске - если меньше - не пишем логи
begin
  try
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
        end;
      finally
        try
          CloseFile(F);
        except
        end;
      end;
    end;
  except
  end;
end;

function TDicomDataset.LoadFromStream(const AStream: TStream; AKeepStream: Boolean = false;
  ALoadFrameInThread: Boolean = false):
  Boolean;
var
  I, k, v_GetCount, v28_8 : Integer;
  w1: Word;
  da1: TDicomAttribute;
  str1, vErrStr, vStrTmpErr : string;
  v1: TUIDEntry;
begin
  Result := true;
  FAttributes.clear;
  FInfoAttributes.Clear;
  if ReadFlag(AStream) then
  begin
    AStream.Position := 0;
    k := FInfoAttributes.ReadHeader(AStream);
    v1 := nil;

    if FInfoAttributes.Item[2, 16] <> nil then
    begin
      str1 := FInfoAttributes.Item[2, 16].AsString[0];
      v1 := UIDS.Items[str1];
    end
    else
    begin
      raise Exception.Create('no SOP constant');
    end;
    if v1 = nil then
    begin
      raise Exception.Create(str1 + ' is undefine constant');
    end;
    i := v1.Constant;
    try
      vErrStr:='#1';
      Attributes.ReadData(k, AStream, i, AKeepStream, ALoadFrameInThread);
      vErrStr:=vErrStr+'#2';
      try
        da1 := Attributes.Item[32736, 16];
        vErrStr:=vErrStr+'#3';
        try
          if da1<>nil then
            v_GetCount:=da1.GetCount
          else
            v_GetCount:=0;
        except
          v_GetCount:=0;
        end;
        vErrStr:=vErrStr+'#4';
      except
        v_GetCount:=0;
      end;
      vErrStr:=vErrStr+'#5';
      try
        v28_8 := Attributes.GetInteger($28, $8);
      except
        v28_8 := 0;
      end;
      vErrStr:=vErrStr+'#6';
      if assigned(da1) and (v_GetCount > 1) and ( v28_8 <= 1) then
      begin //combin to 1 item
        da1.CombinImageData;
      end;
      vErrStr:=vErrStr+'#7';
    except
      on e: Exception do
      begin
        Attributes.Clear;
        raise Exception.Create('#6603 DicomDataset LoadFromStream ('+vErrStr+') :' + e.Message + #13+GetMemorySizeStr);
      end;
    end;
    if Attributes.Item[2, 0] <> nil then
    begin
      {i := UIDS.Items[Attributes.Item[2, 16].AsString[0]].Constant;

      for I1 := 0 to Attributes.ImageData.FImageArray.Count - 1 do
        Attributes.ImageData.ImageData[i1].fTransferSyntax := i;
      {FInfoAttributes.Clear;
      for I := 0 to Attributes.Count - 1 do    // Iterate
      begin
        da1 := Attributes.GetItemByIndex(i);
        if da1.Group=2 then
          FInfoAttributes.Add(da1);
      end;    // for
      {for I := Attributes.Count - 1 downto 0 do    // Iterate
      begin
        da1 := Attributes.GetItemByIndex(i);
        if da1.Group=2 then
          Attributes.FList.Remove(da1);
      end;    // for }
    end;
  end
  else
  begin
    AStream.Position := 0;
    AStream.Read(w1, SizeOf(word));
    {if (w1 <> 8) and (w1 <> 4) then
    begin
      raise Exception.Create('The file may not be a DICOM file!');
      Result := false;
    end
    else  }
    begin
     { try
        if EncodeDate(2016,3,16)>Now then
          MnLg_ev ( '------------------------------------------------------------------'+c_eol+
                    DateTimeToStr(Now)+c_eol+
                    GetMemorySizeStr,
                    ExtractFilePath(paramstr(0))+'MemoryUse.log');
      except
      end;  }

      AStream.Position := 0;
      vErrStr:='#a1';
      try
        try
          Attributes.ReadData(0, AStream, ImplicitVRLittleEndian, AKeepStream, ALoadFrameInThread);
        except
          on e: Exception do
            MnLg_ev ( '------------------------------------------------------------------'+c_eol+
                    '!!!ERROR!!! #6719 DicomDataset LoadFromStream ('+vErrStr+') :' + e.Message + #13+GetMemorySizeStr+c_eol+
                    DateTimeToStr(Now)+c_eol+
                    GetMemorySizeStr,
                    ExtractFilePath(paramstr(0))+'MemoryUse.log');
        end;
        vErrStr:=vErrStr+'#a2';
        try
          da1 := Attributes.Item[32736, 16];
        except
          on e: Exception do
            MnLg_ev ( '------------------------------------------------------------------'+c_eol+
                    '!!!ERROR!!! #6721 DicomDataset LoadFromStream ('+vErrStr+') :' + e.Message + #13+GetMemorySizeStr+c_eol+
                    DateTimeToStr(Now)+c_eol+
                    GetMemorySizeStr,
                    ExtractFilePath(paramstr(0))+'MemoryUse.log');
        end;
        vErrStr:=vErrStr+'#a3';
        try
          if assigned(da1) and (da1<>nil) and (da1.GetCount > 1) and (Attributes.GetInteger($28, $8) <= 1) then
          begin //combin to 1 item
            da1.CombinImageData;
          end;
        except
          on e: Exception do
            MnLg_ev ( '------------------------------------------------------------------'+c_eol+
                    '!!!ERROR!!! #6733 DicomDataset LoadFromStream ('+vErrStr+') :' + e.Message + #13+GetMemorySizeStr+c_eol+
                    DateTimeToStr(Now)+c_eol+
                    GetMemorySizeStr,
                    ExtractFilePath(paramstr(0))+'MemoryUse.log');
        end;
        vErrStr:=vErrStr+'#a4';
      except
        on e: Exception do
          MnLg_ev ( '------------------------------------------------------------------'+c_eol+
                    '!!!ERROR!!! #6652 DicomDataset LoadFromStream ('+vErrStr+') :' + e.Message + #13+GetMemorySizeStr+c_eol+
                    DateTimeToStr(Now)+c_eol+
                    GetMemorySizeStr,
                    ExtractFilePath(paramstr(0))+'MemoryUse.log');
          // raise Exception.Create('#6652 DicomDataset LoadFromStream ('+vErrStr+') :' + e.Message + #13+GetMemorySizeStr);
      end;
    end;
  end;

  if (FInstanceUID = '') and (Attributes.Count > 0) then
  begin
    FImageIndex := Attributes.getInteger($20, $13);
    FSeriesNumber := Attributes.getInteger($20, $11);
    FSeriesUID := Attributes.getString($20, $E);
    FStudyUID := Attributes.getString($20, $D);
    FInstanceUID := Attributes.getString($8, $18);
  end;

  if assigned(FOnAfterLoad) then
    FOnAfterLoad(self);
end;

function TDicomDataset.LoadFromFile(AFileName: AnsiString; AKeepStream: Boolean = false;
  ALoadFrameInThread: Boolean = false): Boolean;
var
  f1: TFileStream;
begin
  if ALoadFrameInThread then
    AKeepStream := true;

  if AKeepStream and assigned(FImageStream) then
  begin
    FImageStream.Free;
    FImageStream := nil;
  end;

  f1 := TFileStream.Create(AFileName, fmOpenRead + fmShareDenyNone);
  try
    Result := LoadFromStream(f1, AKeepStream, ALoadFrameInThread);
    if AKeepStream then
      FImageStream := f1;
  finally
    if not AKeepStream then
      f1.Free;
  end;
end;

function TDicomDataset.PrepareInfoAttributes(ATransferSyntax: Integer): Integer;
var
  da: TDicomAttribute;
  p1: PWord;
  m1: TOBStream;
begin
  try
    Result := UIDS.ItemByConstant[ATransferSyntax].Constant;
  except
    on e: Exception do
    begin
      Result := PrivateTransferSyntax;
    end
  end;
  FInfoAttributes.Clear;
  da := FInfoAttributes.Add($0002, $0001); //FileMetaInformationVersion
  GetMem(p1, 2);
  m1 := TOBStream.Create(p1, 2);

  p1^ := $100;
  da.AddData(m1);
  if FAttributes.GetString(dSOPClassUID) <> '' then
  begin
    FInfoAttributes.AddVariant(dMediaStorageSOPClassUID, FAttributes.GetString(dSOPClassUID)); //MediaStorageSOPClassUID
    FInfoAttributes.AddVariant(dMediaStorageSOPInstanceUID, FAttributes.GetString(dSOPInstanceUID));
  end
  else
  begin
    FInfoAttributes.AddVariant(dMediaStorageSOPClassUID, '1.2.840.10008.1.3.10'); //MediaStorageSOPClassUID
    FInfoAttributes.AddVariant(dMediaStorageSOPInstanceUID, '2.16.840.1.999999.1.1.2007818.23449.0');
  end;
  // FOMIN 08.01.2013
  FInfoAttributes.AddVariant(dTransferSyntaxUID, UIDS.ItemByConstant[Result].Value);  // 31

  FInfoAttributes.AddVariant(dImplementationClassUID, DicomImplementationClassUID);
  FInfoAttributes.AddVariant(dImplementationVersionName, DicomImplementationVersionName);
  FInfoAttributes.AddVariant(dSourceApplicationEntityTitle, DicomImplementationVersionName); //  $0002, $0016

  FInfoAttributes.AddVariant(dMetaElementGroupLength, FInfoAttributes.getDatalen(ATransferSyntax) - 12); // 27

  FInfoAttributes.AddAllGrouplength(ATransferSyntax);
  FInfoAttributes.Sort;
end;

procedure TDicomDataset.SaveDICOMDIRToFile(const AFileName: AnsiString);
var
  stm1: TFileStream;
begin
  stm1 := TFileStream.Create(AFileName, fmCreate);
  try
    SaveDICOMDIRToStream(stm1);
  finally
    stm1.Free;
  end;
end;

procedure TDicomDataset.SaveToFile(const AFileName: AnsiString; isPart10: Boolean; ATransferSyntax:
  Integer; Quality: integer; AKeepStream: Boolean = false; AMustDelete: Boolean = false);
var
  stm1: TFileStream;
begin
  if AKeepStream and assigned(FImageStream) then
  begin
    FImageStream.Free;
    FImageStream := nil;
  end;

  {  if ATransferSyntax = zlibFastestTransferSyntax then
    begin
      raise Exception.Create('ІвКФґнОу');
    end;}
  vErrorSaveText:='';
  try
    stm1 := TFileStream.Create(AFileName, fmCreate);
  except
    on E:Exception do
    begin
      vErrorSaveText:=E.Message;
      raise;
    end;
  end;
  try
    SaveToStream(stm1, isPart10, ATransferSyntax, Quality, AKeepStream);
    if AKeepStream then
    begin
      FImageStream := stm1;
      if AMustDelete then
      begin
        FImageFilename := AFileName;
        FDeleteImageFile := true;
      end;
    end;
  finally
    if not AKeepStream then
      stm1.Free;
  end;
end;

procedure TDicomDataset.SaveToStream(const Stream: TStream; isPart10: Boolean; ATransferSyntax:
  Integer; Quality: integer; AKeepStream: Boolean = false; AOnlyCurrentFrame: Integer = -1);
  procedure RemoveMotaInfo;
  var
    i: Integer;
    da1: TDicomAttribute;
  begin
    for i := FAttributes.GetCount - 1 downto 0 do
    begin
      da1 := FAttributes.ItemByIndex[i];
      if da1.Group = 2 then
      begin
        FAttributes.FList.Remove(da1);
        da1.Free;
      end;
    end;
  end;
var
  str1: AnsiString;
  //  i: Integer;
begin
  {$IFDEF FOR_TRIAL_VERSION}
 // FAttributes.AddVariant(8, $80, 'Unregistered copy of dicomvcl(from http://www.dicomvcl.com)');
 // FAttributes.AddVariant($10, $10, FAttributes.GetString($10, $10) +
 //   'Unregistered copy of dicomvcl(from http://www.dicomvcl.com)');
  {$ENDIF}
  //  FAttributes.ImageData
  if AOnlyCurrentFrame >= 0 then
  begin
    FAttributes.AddVariant($28, $8, 1);
  end;

  RemoveMotaInfo;
  FAttributes.Sort;
  if (ATransferSyntax <> ImplicitVRLittleEndian) then
  begin
    PrepareInfoAttributes(ATransferSyntax);
    if IsPart10 then
    begin
      SetLength(str1, 128);
      FillChar(str1[1], 128, 0);
      Stream.Write(str1[1], 128);
      str1 := 'DICM';
      Stream.Write(str1[1], 4);
      //    FInfoAttributes.Sort;
      try
        FInfoAttributes.Write(Stream, ExplicitVRLittleEndian, Quality);
      except
        on E:Exception do
        begin
          vErrorSaveText:=vErrorSaveText+' | '+E.Message;
          raise;
        end;
      end;
    end;
    //  FAttributes.Sort;
    //FAttributes.Remove(8, $2111);
    //FAttributes.Remove(8, $2112);

    if assigned(FAttributes.ImageData) and (FAttributes.ImageData.ImageData[0].TransferSyntax <>
      ATransferSyntax) then
    begin
      str1 := Copy(FAttributes.ImageData.PhotometricInterpretation, 1, 3);
      if (str1 <> 'RGB') and (str1 <> 'MON') then
      begin
        FAttributes.AddVariant($28, $4, 'RGB');
      end;
    end;

    FAttributes.AddAllGrouplength(ATransferSyntax);
    FAttributes.Sort;
    try
      FAttributes.Write(Stream, ATransferSyntax, Quality, AKeepStream, AOnlyCurrentFrame);
    except
      on E:Exception do
        begin
          vErrorSaveText:=vErrorSaveText+' | '+E.Message;
          raise;
        end;
    end;
  end else
  begin
    try
      FAttributes.Write(Stream, ATransferSyntax, Quality, AKeepStream, AOnlyCurrentFrame);
    except
      on E:Exception do
        begin
          vErrorSaveText:=vErrorSaveText+' | '+E.Message;
          raise;
        end;
    end;
  end;
end;

procedure TDicomDataset.SaveDICOMDIRToStream(const Stream: TStream);
var
  str1: AnsiString;
  i, l1, l2, l3: Integer;
  da1: TDicomAttribute;
  //  das1: TDicomAttributes;
  AStm: TDicomStream;
begin
  {$IFDEF FOR_TRIAL_VERSION}
  FAttributes.AddVariant(8, $80, 'Unregistered copy of dicomvcl (from http://www.dicomvcl.com)');
  FAttributes.AddVariant($10, $10, FAttributes.GetString($10, $10) +
    'Unregistered copy of dicomvcl (from http://www.dicomvcl.com)');
  {$ENDIF}
  //  FAttributes.ImageData
  FAttributes.Sort;

  PrepareInfoAttributes(8194);
  SetLength(str1, 128);
  FillChar(str1[1], 128, 0);
  Stream.Write(str1[1], 128);
  str1 := 'DICM';
  Stream.Write(str1[1], 4);
  //    FInfoAttributes.Sort;
  FInfoAttributes.Write(Stream, ExplicitVRLittleEndian, 100);

  AStm := TDicomStream.Create(Stream);
  astm.KeepImageDataInStream := false;
  AStm.TransferSyntax := 8194;
  AStm.JpegQuality := 100;

  for i := 0 to FAttributes.Count - 1 do
  begin
    da1 := FAttributes.ItemByIndex[i];

    if da1.Element <> $1220 then
    begin
      da1.writeVRHeader(AStm);
      if da1.Element = $1200 then
        l1 := AStm.Position
      else
        if da1.Element = $1202 then
        l2 := AStm.Position;
      da1.writeVRData(AStm);
    end
    else
    begin
      da1.writeVRHeader(AStm);
      l3 := AStm.Position;

      AStm.Position := l1;
      AStm.WriteInt32(l3);
      AStm.Position := l2;
      AStm.WriteInt32(l3);

      AStm.Position := l3;
      da1.WriteDICOMDIRSQ(AStm);
    end;
  end;
  AStm.Free;
end;

function TDicomDatasets.FindIndexOf(ADataset: TDicomDataset): integer;
var
  i, k: integer;
begin
  Result := -1;
  //todo
  for i := 0 to FDatasetList.Count - 1 do
  begin

    case FImageOrder of
      //dsbImageNumber: ;
      dsbSliceLocation:
        k := CompareDicomDataset1(ADataset, FDatasetList[i]);
      dsbReverseSliceLocation:
        k := CompareDicomDataset2(ADataset, FDatasetList[i]);
      dsbAcquisitionTime:
        k := CompareDicomDataset3(ADataset, FDatasetList[i]);
      dsbImageTime:
        k := CompareDicomDataset4(ADataset, FDatasetList[i]);
    else
      k := CompareDicomDataset(ADataset, FDatasetList[i]);
    end;
    //k := CompareDicomDataset(ADataset, FDatasetList[i]);
    if k < 0 then
    begin
      Result := i;
      break;
    end;
  end;
end;

function TDicomDatasets.FindIndexOfSeries(ADataset: TDicomDataset): integer;
var
  i, k: integer;
begin
  Result := -1;
  //todo
  for i := 0 to FSeriesList.Count - 1 do
  begin
    k := CompareSeriesDicomDataset(ADataset, FSeriesList[i]);
    if k < 0 then
    begin
      Result := i;
      break;
    end;
  end;
end;

procedure TDicomDatasets.AddDicomDataset(ADicomDataset: TDicomDataset);
var
  i: integer;
begin
  ADicomDataset.LabelPosition := LabelPosition;
  ADicomDataset.FBufferLength := FBufferLength;

  ADicomDataset.OnReadAttribute := DoNewAttribute;
  ADicomDataset.OnLoadFrame := DoLoadFrame;
  ADicomDataset.OnLoadFrameFinish := DoLoadFrameFinish;
  ADicomDataset.OnAfterLoad := DoAfterLoadDicomDataset;

  if ADicomDataset.InstanceUID <> '' then
  begin
    i := FindIndexOf(ADicomDataset);
  end
  else
    i := -1;

  if i < 0 then
    FDatasetList.Add(ADicomDataset)
  else
    FDatasetList.Insert(i + 1, ADicomDataset);

  //StudySet.AddDataset(ADicomDataset);

  DoAfterLoadDicomDataset(ADicomDataset);

  if assigned(FOnAddDataset) then
    FOnAddDataset(self, ADicomDataset);
end;

procedure TDicomDatasets.InsertDicomDataset(AIndex: integer; ADicomDataset: TDicomDataset);
begin
  ADicomDataset.LabelPosition := LabelPosition;
  ADicomDataset.FBufferLength := FBufferLength;

  ADicomDataset.OnReadAttribute := DoNewAttribute;
  ADicomDataset.OnLoadFrame := DoLoadFrame;
  ADicomDataset.OnLoadFrameFinish := DoLoadFrameFinish;
  ADicomDataset.OnAfterLoad := DoAfterLoadDicomDataset;

  FDatasetList.Insert(AIndex, ADicomDataset);
  //StudySet.AddDataset(ADicomDataset);

  DoAfterLoadDicomDataset(ADicomDataset);

  if assigned(FOnAddDataset) then
    FOnAddDataset(self, ADicomDataset);
end;

function TDicomDatasets.NewDicomDataset(ADicomAttributes: TDicomAttributes): TDicomDataset;
//var
//  i: Integer;
begin
  Result := TDicomDataset.Create(ADicomAttributes);

  AddDicomDataset(Result);
end;

function TDicomDatasets.NewDicomDataset(AStudyUID, ASeriesUID,
  AInstanceUID: AnsiString; ASeriesNo, AImageNo: Integer): TDicomDataset;
//var
//  i: Integer;
begin
  Result := TDicomDataset.Create;

  Result.StudyUID := AStudyUID;
  Result.SeriesUID := ASeriesUID;
  Result.SeriesNumber := ASeriesNo;
  Result.InstanceUID := AInstanceUID;
  Result.ImageIndex := AImageNo;

  Result.LabelPosition := LabelPosition;
  Result.FBufferLength := FBufferLength;

  Result.OnReadAttribute := DoNewAttribute;
  Result.OnLoadFrame := DoLoadFrame;
  Result.OnLoadFrameFinish := DoLoadFrameFinish;
  Result.OnAfterLoad := DoAfterLoadDicomDataset;

  AddDicomDataset(Result);

end;

procedure TDicomDatasets.Remove(ADicomDataset: TDicomDataset);
begin

  DoBeforeRemoveDicomDataset(ADicomDataset);

  FDatasetList.Remove(ADicomDataset);
  //  ADicomDataset.Free;
//  VerifityDataset;
  BuildSeriesList;
end;

procedure TDicomDatasets.Delete(AIndex: Integer);
var
  das: TDicomDataset;
begin
  das := TDicomDataset(FDatasetList[AIndex]);

  DoBeforeRemoveDicomDataset(das);

  FDatasetList.Delete(AIndex);

  das.Free;

  //BuildSeriesList;
  //  VerifityDataset;
end;

procedure TDicomDatasets.Remove(ADicomDataset: TDicomAttributes);
var
  i: Integer;
begin
  for i := 0 to GetCount - 1 do
  begin
    if Item[i].Attributes = ADicomDataset then
    begin
      DoBeforeRemoveDicomDataset(Item[i]);

      FDatasetList.Remove(Item[i]);
      Item[i].Free;
      //      VerifityDataset;
      exit;
    end;
  end;
  BuildSeriesList;
end;

procedure TDicomDatasets.ResetModify;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Item[i].FUserModify := true;
  end;
end;

procedure TDicomDatasets.ResetUnModify;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Item[i].FUserModify := true;
  end;
end;

function TDicomDatasets.LoadFromFile(AFileName: AnsiString; AKeepStream: Boolean = false;
  ALoadFrameInThread: Boolean = false):
  TDicomDataSet;
begin
  Result := TDicomDataSet.Create;
  Result.LabelPosition := LabelPosition;
  Result.FBufferLength := FBufferLength;

  Result.OnReadAttribute := DoNewAttribute;
  Result.OnLoadFrame := DoLoadFrame;
  Result.OnLoadFrameFinish := DoLoadFrameFinish;
  Result.OnAfterLoad := DoAfterLoadDicomDataset;

  if Result.LoadFromFile(AFileName, AKeepStream, ALoadFrameInThread) then
    AddDicomDataset(Result);

//  Result.SaveToFile('d:\1\assa.dcm',True,8193,100);

end;

function TDicomDataset.ReadFlag(AStream: TStream): Boolean;
var
  abyte1, abyte2: AnsiString;
begin
  AStream.Position := 0;
  SetLength(abyte1, 128);
  SetLength(abyte2, 4);
  AStream.read(abyte1[1], 128);
  AStream.read(abyte2[1], 4);
  result := abyte2 = 'DICM';
end;

destructor TDicomDataset.Destroy;
begin
  FAttributes.Clear;
  if assigned(FAttributes) then
    if FAttributes<>nil then
      try
        FAttributes.Free;
      except
      end;
  FInfoAttributes.Clear;
  if assigned(FInfoAttributes) then
    if FInfoAttributes<>nil then
      try
        FInfoAttributes.Free;
      except
      end;

  if assigned(FImageStream) then
  begin
    FImageStream.Free;
    if (FImageFilename <> '') and (FDeleteImageFile) then
      if FileExists(FImageFilename) then
        DeleteFile(FImageFilename);
  end;
  try
    inherited Destroy;
  except
  end;
end;

constructor TDicomDataset.Create;
{$IFDEF FOR_TRIAL_VERSION}
  function IsIDERuning: Boolean;
  begin
    Result := (FindWindow('TAppBuilder', nil) <> 0) or
      (FindWindow('TPropertyInspector', nil) <> 0) or
      (FindWindow('TAlignPalette', nil) <> 0);
  end;
  {$ENDIF}
begin
  {$IFDEF FOR_TRIAL_VERSION}
  if not IsIDERuning then
  begin
    ShowMessage('You are use trial dicomvcl. Please open http://www.dicomvcl.com.');

    //Application.Terminate;
  end;
  //ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
  {$ENDIF}
  FBufferLength := dibl16Bit;

  FImageIndex := 0;
  FSeriesNumber := 0;
  FSeriesUID := '';
  FStudyUID := '';
  FInstanceUID := '';

  //  FIcon := nil;
  FImageStream := nil;
  FImageFilename := '';
  FDeleteImageFile := false;
  {$IFDEF FOR_TRIAL_VERSION}
  if (not assigned(CnsExpireTimer)) then
  begin
    CnsExpireTimer := TTimerExt.Create(nil);
    CnsExpireTimer.Enabled := true;
  end;
  //ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
  {$ENDIF}

  FUserModify := false;
  FAttributes := TDicomAttributes.Create;
  FAttributes.OnReadAttribute := DoNewAttribute;
  FAttributes.OnLoadFrame := DoLoadFrame;
  FAttributes.OnLoadFrameFinish := DoLoadFrameFinish;

  FInfoAttributes := TDicomAttributes.Create;
  FInfoAttributes.OnReadAttribute := DoNewAttribute;
end;

constructor TDicomDataset.Create(AData: TDicomAttributes);
{$IFDEF FOR_TRIAL_VERSION}
  function IsIDERuning: Boolean;
  begin
    Result := (FindWindow('TAppBuilder', nil) <> 0) or
      (FindWindow('TPropertyInspector', nil) <> 0) or
      (FindWindow('TAlignPalette', nil) <> 0);
  end;
  {$ENDIF}

begin
  FBufferLength := dibl16Bit;

  //  FCustomImageIndex := 0;

  FImageIndex := 0;
  FSeriesNumber := 0;
  FSeriesUID := '';
  FStudyUID := '';
  FInstanceUID := '';

  {$IFDEF FOR_TRIAL_VERSION}
  if not IsIDERuning then
  begin
    ShowMessage('You are use trial dicomvcl. Please open http://www.dicomvcl.com.');
    //Application.Terminate;
  end;
  //ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
  {$ENDIF}

  FImageStream := nil;
  FImageFilename := '';
  FDeleteImageFile := false;
  {$IFDEF FOR_TRIAL_VERSION}
  if (not assigned(CnsExpireTimer)) then
  begin
    CnsExpireTimer := TTimerExt.Create(nil);
    CnsExpireTimer.Enabled := true;
  end;
  {$ENDIF}

  FUserModify := false;
  FAttributes := AData;

  FAttributes.OnReadAttribute := DoNewAttribute;
  FAttributes.OnLoadFrame := DoLoadFrame;
  FAttributes.OnLoadFrameFinish := DoLoadFrameFinish;

  FInfoAttributes := TDicomAttributes.Create;

  ImageIndex := Attributes.getInteger($20, $13);
  SeriesNumber := Attributes.getInteger($20, $11);
  SeriesUID := Attributes.getString($20, $E);
  StudyUID := Attributes.getString($20, $D);
  InstanceUID := Attributes.getString($8, $18);
end;

procedure TDicomDatasets.Clear;
var
  I: Integer; vDSTmp : TDicomDataset;
begin
  if FDatasetList.Count > 0 then
  begin
    FTopoDicomDatasets.Clear;
    FSeriesList.Clear;
    //FStudySet.clear;

    for I := FDatasetList.Count - 1 downto 0 do // Iterate
    begin
      try
        vDSTmp := TDicomDataset(FDatasetList[i]) ;
        if assigned(vDSTmp) then
          if vDSTmp<>nil then          
            vDSTmp.Free;
      except
      {  on e: Exception do
        begin
          raise Exception('Image:' + IntToStr(i) + ':' + e.Message);
        end; }
      end;
    end; // for
    FDatasetList.Clear;
    FModility := '';
    //if not (csDestroying in ComponentState) then
    //  VerifityDataset;
  end;
end;

procedure TDicomDatasets.ClearList;
begin
  if FDatasetList.Count > 0 then
  begin
    FTopoDicomDatasets.Clear;
    FDatasetList.Clear;
    FSeriesList.Clear;
    FModility := '';
    //VerifityDataset;

    //FStudySet.clear;
  end;
end;

function TDicomDatasets.LoadFromStream(const AStream: TStream; AKeepStream: Boolean = false):
  TDicomDataSet;
begin
  Result := TDicomDataSet.Create;
  Result.LabelPosition := LabelPosition;
  Result.FBufferLength := FBufferLength;

  Result.OnReadAttribute := DoNewAttribute;
  Result.OnLoadFrame := DoLoadFrame;
  Result.OnLoadFrameFinish := DoLoadFrameFinish;
  Result.OnAfterLoad := DoAfterLoadDicomDataset;

  if Result.LoadFromStream(AStream, AKeepStream) then
  begin
    AddDicomDataset(Result);
  end
end;

function SpritRect(ARect: TRect; x, y, l: Integer): TRect;
var
  w, h: Integer;
begin
  w := ARect.Right - ARect.Left;
  h := ARect.Bottom - ARect.Top;
  Result.Left := ARect.Left + (l mod x) * (w div x);
  Result.Right := ARect.Left + ((l mod x) + 1) * (w div x);
  Result.Top := ARect.Top + (l div x) * (h div y);
  Result.Bottom := ARect.Top + ((l div x) + 1) * (h div y);
end;

procedure TDicomDatasets.PrintImages(ACanvas: TCanvas; rc: TRect; var AIndex: Integer; ax, ay:
  Integer; AIsSelected: Boolean);
var
  z, k, i: Integer;
  rc1: TRect;
begin
  if AIsSelected then
    z := GetSelectedCountForPrint
  else
    z := Count;
  if z <= 0 then
    exit;
  i := AIndex;
  for k := 0 to z - 1 do
  begin
    rc1 := SpritRect(rc, ax, ay, i);
    PrintImage(ACanvas, rc1, k, AIsSelected);
    inc(i);
    if i >= ax * ay then
      break;
  end;
  AIndex := i;
end;

function TDicomDatasets.GetSelectedCount: integer;
var
  I, k: Integer;
begin
  k := 0;
  for i := 0 to Count - 1 do
  begin
    if Item[i].Attributes.MultiSelected1 then
      inc(k);
  end;
  Result := k;
end;

function TDicomDatasets.GetSelectedCountForPrint: integer;
var
  I, k: Integer;
begin
  k := 0;
  for i := 0 to Count - 1 do
  begin
    if Item[i].Attributes.MultiSelected2 then
      inc(k);
  end;
  Result := k;
end;

procedure TDicomDatasets.PrintImage(ACanvas: TCanvas; rc: TRect; AIndex: Integer; AIsSelected:
  Boolean);
var
  bm, bm1: TBitmap;
  b1, b2: Double;
  d1: TDicomImage;
  i, h, r, kkk: Integer;
  das1: TDicomAttributes;
begin
  if AIsSelected then
    das1 := SelectedForPrint[AIndex]
  else
    das1 := Item[AIndex].Attributes;
  if assigned(das1.Item[$7FE0, $0010]) then
    i := 1
  else
    if assigned(das1.Item[$5400, $0100]) then
    i := 2
  else
    if assigned(das1.Item[$2811, $0100]) then
    i := 3
  else
    if assigned(das1.Item[$2811, $0010]) then
    i := 4
  else
    if assigned(das1.Item[$2811, $0014]) then
    i := 5
  else
    if assigned(das1.Item[$2811, $0020]) then
    i := 6
  else
    exit;
  if i = 1 then
  begin
    bm := TBitmap.Create;
    try
      d1 := das1.ImageData;

      DCM_ImageData_Bitmap.AssignToBitmap(d1, bm, false);
      //      OverlayLabels(bm.Canvas, d1, bm.Height, bm.Width, 100, 9);
      //      DrawObjectAllToBitmap(nil, bm.Canvas, das1);
      if (bm.Width > 1024) or (bm.Height > 1024) then
      begin
        bm1 := TBitmap.Create;

        bm1.Width := 1024;
        bm1.Height := trunc(bm1.Width * (bm.Height / bm.Width));

        bm1.Canvas.StretchDraw(Rect(0, 0, bm1.Width, bm1.Height), bm);
        bm.Free;
        bm := bm1;
      end;

      b1 := bm.Height / bm.Width;

      rc.Right := rc.Right - 2;
      rc.Bottom := rc.Bottom - 2;
      b2 := (rc.Bottom - rc.Top) / (rc.Right - rc.Left);

      if (b1 < b2) then
      begin
        h := trunc((((rc.Right - rc.Left) * b1)));
        kkk := rc.Top + ((rc.Bottom - rc.Top) - h) div 2;
        //        ACanvas.StretchDraw(Rect(rc.Left, rc.Top, rc.Right, h), bm);
        printBitmapEx(ACanvas, Rect(rc.Left, kkk, rc.Right, kkk + h), bm);
      end
      else
        if (b1 > b2) then
      begin
        r := trunc((((rc.Bottom - rc.Top) / b1)));
        kkk := rc.Left + ((rc.Right - rc.Left) - r) div 2;
        //        ACanvas.StretchDraw(Rect(rc.Left, rc.Top, r, rc.Bottom), bm);
        printBitmapEx(ACanvas, Rect(kkk, rc.Top, kkk + r, rc.Bottom), bm);
      end
      else
        //        ACanvas.StretchDraw(Rect(rc.Left, rc.Top, rc.Right, rc.Bottom), bm);
        printBitmapEx(ACanvas, Rect(rc.Left, rc.Top, rc.Right, rc.Bottom), bm);
    finally
      bm.Free;
    end;
  end;
end;

constructor TDicomDatasets.Create(AOwner: TComponent);
begin
  inherited;
  FBufferLength := dibl16Bit;

  FAutoShowReffrenceLine := false;

  fOnlyViewMultiSelected1 := false;
  fOnlyViewMultiSelected2 := false;
  fOnlyViewMultiSelected3 := false;
  fOnlyViewMultiSelected4 := false;

  FDatasetList := TList.Create;
  FModility := '';
  FTopoDicomDatasets := TList.Create;
  FLockCount := 0;

  FSeriesList := TList.Create;

  FImageOrder := dsbImageNumber;
  //  FStudySet := TStudyList.Create;
end;

destructor TDicomDatasets.Destroy;
begin
  // 03.09.2012 FOMIN
  Application.ProcessMessages;
  Sleep(1);
  try
    if Assigned(FDatasetList) then
      FDatasetList.Free;
  except
  end;
  try
    if Assigned(FTopoDicomDatasets) then
      FTopoDicomDatasets.Free;
  except
  end;
  try
    if Assigned(FSeriesList) then
      FSeriesList.Free;
  except
  end;
  try
    Clear;
  except
  end;
  // END FOMIN 03.09.2012

  //FStudySet.Free;
  inherited Destroy;
end;

function TDicomDatasets.GetItemByIndex(Index: Smallint): TDicomDataset;
var
  i, k: Integer;
begin
  if OnlyViewMultiSelected2 then
  begin
    i := 0;
    Result := TDicomDataset(FDatasetList[0]);
    for k := 0 to FDatasetList.Count - 1 do
    begin
      if (TDicomDataset(FDatasetList[k]).Attributes.MultiSelected2)
        //or(TDicomDataset(FDatasetList[k]).Attributes.ImageData.FrameCount > 1)
      then
      begin
        if i = Index then
        begin
          Result := TDicomDataset(FDatasetList[k]);
        end;
        inc(i);
      end;
    end
  end
  else //}
    Result := TDicomDataset(FDatasetList[Index]);
end;

procedure TDicomDatasets.BuildSelectList;
begin

end;

function TDicomDatasets.GetSelected(AIndex: Integer): TDicomAttributes;
var
  I, k: Integer;
begin
  k := 0;
  Result := nil;
  for i := 0 to FDatasetList.Count - 1 do
  begin
    if Item[i].Attributes.MultiSelected1 then
    begin
      if k = AIndex then
      begin
        Result := Item[i].Attributes;
        exit;
      end;
      inc(k);
    end;
  end;
end;

function TDicomDatasets.GetSelectedForPrint(AIndex: Integer): TDicomAttributes;
var
  I, k: Integer;
begin
  k := 0;
  Result := nil;
  for i := 0 to FDatasetList.Count - 1 do
  begin
    if Item[i].Attributes.MultiSelected2 then
    begin
      if k = AIndex then
      begin
        Result := Item[i].Attributes;
        exit;
      end;
      inc(k);
    end;
  end;
end;

{procedure TDicomDatasets.VerifityDataset;
var
  str1: AnsiString;
begin
  if Count = 1 then
  begin
    str1 := Item[0].Attributes.GetString(8, $60);
    if str1 <> FModility then
    begin
      if assigned(FOnModilityChange) then
      begin
        FOnModilityChange(self, str1);
      end;
      FModility := str1;
    end;
  end;
  if assigned(FOnDatasetChange) then
  begin
    FOnDatasetChange(self);
  end;
end;}

procedure TDicomDatasets.RemoveSelected;
var
  i: Integer;
  das: TDicomDataset;
begin
  for i := FDatasetList.Count - 1 downto 0 do
    if Item[i].Attributes.MultiSelected1 then
    begin
      das := Item[i];

      DoBeforeRemoveDicomDataset(das);
      FDatasetList.Remove(das);

      das.Free;
    end;
  //  VerifityDataset;
  BuildSeriesList;
end;

procedure TDicomDatasets.RemoveDataset(AIndex: Integer);
begin
  if AIndex < Count then
  begin
    DoBeforeRemoveDicomDataset(TDicomDataset(FDatasetList[AIndex]));

    Delete(AIndex);
  end;
  //  VerifityDataset;
  BuildSeriesList;
end;

function TDicomDatasets.DeleteSelectedImages: AnsiString;
var
  i: Integer;
  das: TDicomDataset;
begin
  Result := '';
  for i := FDatasetList.Count - 1 downto 0 do
    if Item[i].Attributes.MultiSelected1 then
    begin
      Result := Result + Item[i].Attributes.GetString($0008, $0018) + #13#10;

      //      FDicomDatasets.Remove(FDicomDatasets[i]);
      das := Item[i];

      DoBeforeRemoveDicomDataset(das);

      FDatasetList.Remove(das);
      das.Free;

    end;
  //  VerifityDataset;
  BuildSeriesList;
end;

function TDicomDatasets.GerSeries(index: Integer): TDicomDataset;
begin
  if (index >= 0) and (index < FSeriesList.count) then
  begin
    Result := TDicomDataset(FSeriesList[index]);
  end
  else
    Result := nil;
end;

procedure TDicomDatasets.BuildSeriesList;
var
  i: Integer;
  str1, str2: AnsiString;
  k1, k2: Integer;
  das1: TDicomDataset;
begin
  FSeriesList.Clear;
  if Count > 0 then
  begin
    str2 := '';
    k2 := 0;
    for i := 0 to Count - 1 do
    begin
      das1 := Item[i];
      str1 := das1.SeriesUID; // .Attributes.GetString($20, $E); //$20,$11
      if str1 = '' then
        str1 := das1.Attributes.GetString($20, $E);
      if str1 = '' then
      begin
        k1 := das1.SeriesNumber;
        if k1 = 0 then
          k1 := das1.Attributes.GetInteger($20, $11);
        if k1 <> k2 then
        begin
          k2 := k1;
          FSeriesList.Add(das1);
        end;
      end
      else
      begin
        if str1 <> str2 then
        begin
          str2 := str1;
          FSeriesList.Add(das1);
        end;
      end;
    end;
    //sort series
    FSeriesList.Sort(CompareSeriesDicomDataset);
  end;
end;

(*procedure TDicomDatasets.BuildSeriesList;
  function IsSeriesExists(Adas: TDicomDataset): Boolean;
  var
    i: integer;
  begin
    Result := false;
    for i := 0 to FSeriesList.Count - 1 do
    begin
      if (adas.Attributes.GetString($20, $E) = TDicomDataset(FSeriesList[i]).Attributes.GetString($20, $E))
        and (adas.Attributes.GetString($20, $11) = TDicomDataset(FSeriesList[i]).Attributes.GetString($20, $11)) then
      begin
        Result := true;
        break;
      end;
    end;
  end;
var
  i: Integer;
  str1, str2: AnsiString;
  k1, k2: Integer;
  das1: TDicomDataset;
begin
  //  FSeriesList.Clear;
  if Count > 0 then
  begin
    str2 := '';
    k2 := 0;
    for i := 0 to Count - 1 do
    begin
      das1 := Item[i];
      if not IsSeriesExists(das1) then
      begin
        k1 := FindIndexOfSeries(das1);
        if k1 < 0 then
          FSeriesList.Add(das1)
        else
          FSeriesList.Insert(k1, das1);
      end;
    end;
    //sort series
    //FSeriesList.Sort(CompareSeriesDicomDataset);
  end;
end; *)

function TDicomDatasets.GetSeriesCount: Integer;
begin
  Result := FSeriesList.Count;
end;

function TDicomDatasets.GetSeriesImageCount(AIndex: Integer): Integer;
var
  i: integer;
  str1, str2: AnsiString;
  das1: TDicomDataset;
begin
  result := 0;
  if FDatasetList.Count <= 0 then
    exit;
  if (AIndex >= 0) and (AIndex < FDatasetList.Count) then
  begin
    str2 := TDicomDataset(FDatasetList[AIndex]).Attributes.GetString($20, $E);
    for i := 0 to FDatasetList.Count - 1 do
    begin
      das1 := TDicomDataset(FDatasetList[i]);
      str1 := das1.Attributes.GetString($20, $E);
      if str1 = str2 then
        Result := Result + 1;
    end;
  end;
end;

function TDicomDatasets.GetSeriesImageCount(ASeriesUID: string): Integer;
var
  i: integer;
  str1, str2: AnsiString;
  das1: TDicomDataset;
begin
  result := 0;
  if FDatasetList.Count <= 0 then
    exit;
  str2 := ASeriesUID;
  for i := 0 to FDatasetList.Count - 1 do
  begin
    das1 := TDicomDataset(FDatasetList[i]);
    str1 := das1.Attributes.GetString($20, $E);
    if str1 = str2 then
      Result := Result + 1;
  end;
end;

function TDicomDatasets.GetCount: Integer;
var
  k: Integer;
begin
  if OnlyViewMultiSelected2 then
  begin
    Result := 0;
    for k := 0 to FDatasetList.Count - 1 do
    begin
      if (TDicomDataset(FDatasetList[k]).Attributes.MultiSelected2)
        //or (TDicomDataset(FDatasetList[k]).Attributes.ImageData.FrameCount > 1)
      then
      begin
        inc(Result);
      end;
    end
  end
  else //}
    Result := FDatasetList.Count;
end;

procedure TDicomAttribute.CombinImageData;
var
  d1, d2: TDicomImageData;
  i, k, zz: Integer;
  p1, p2: PByte;
begin
  if (FDataArray.Count > 1) then
//  if (FDataArray.Count > 0) then
  begin
    if FDataType = ddtImage then
    begin
      if TDicomImageData(FDataArray[0]).Len = (FDataArray.Count - 1) * 4 then
      begin
        TDicomImageData(FDataArray[0]).free;
        FDataArray.Delete(0);
      end;
//      if (FDataArray.Count = 1) then
//        exit;
      k := 0;
      zz := TDicomImageData(FDataArray[0]).FTransferSyntax;
      for i := 0 to FDataArray.Count - 1 do
      begin
        if TDicomImageData(FDataArray[i]).Len > (FDataArray.Count - 1) * 4 then
          k := k + TDicomImageData(FDataArray[i]).Len;

      end;
      GetMem(p1, k);
      p2 := p1;
      for i := 0 to FDataArray.Count - 1 do
      begin
        if TDicomImageData(FDataArray[i]).Len > (FDataArray.Count - 1) * 4 then
        begin
          d1 := TDicomImageData(FDataArray[i]);
          Move(d1.GetData^, p1^, d1.FLen);
          inc(p1, d1.FLen);
          d1.Free;
        end;
      end;
      FDataArray.Clear;

      d2 := TDicomImageData.Create(zz, p2, k);
      AddData(d2);
    end;
  end;
end;

function TDicomAttributes.GetImageDataEx: TDicomImage;
//var
  //  das1: TDicomAttributes;
//  da1: TDicomAttribute;
begin
  if assigned(FImageData) then
    Result := FImageData
  else
    Result := nil;
end;

function TDicomAttributes.GetImageData: TDicomImage;
var
  //  das1: TDicomAttributes;
  da1: TDicomAttribute;
begin
  if assigned(FImageData) then
    Result := FImageData
  else
  begin
    da1 := Item[32736, 16];
    if assigned(da1) then
    begin
      if not assigned(FImageData) then
      begin
        FImageData := TDicomImage.Create(self);
        //FImageData.FBufferLength := FBufferLength;
      end;
      Result := FImageData;
    end
    else
    begin
      {da1 := Item[$54, $220];
      if da1.GetCount > 0 then
      begin
        das1 := da1.Attributes[0];
        if not assigned(FImageData) then
          FImageData := TDicomImage.Create(self, das1);
        Result := FImageData;
      end
      else}
      Result := nil;
    end;
  end;
end;

procedure TDicomAttributes.SetMultiSelected1(Value: Boolean);
begin
  fMultiSelected1 := Value;
  if assigned(fOnSelectChange) then
    fOnSelectChange(self, 1);
end;

procedure TDicomAttributes.SetMultiSelected2(Value: Boolean);
begin
  fMultiSelected2 := Value;
  if assigned(fOnSelectChange) then
    fOnSelectChange(self, 2);
end;

procedure TDicomAttributes.SetMultiSelected3(Value: Boolean);
begin
  fMultiSelected3 := Value;
  if assigned(fOnSelectChange) then
    fOnSelectChange(self, 3);
end;

procedure TDicomAttributes.SetMultiSelected4(Value: Boolean);
begin
  fMultiSelected4 := Value;
  if assigned(fOnSelectChange) then
    fOnSelectChange(self, 4);
end;

procedure TDicomAttributes.Write(AStream: TStream; ASyntax, AJpegQuality: Integer; AKeepStream:
  Boolean = false; AOnlyCurrentFrame: Integer = -1);
var
  i, z1, z2, z3, z4, l1: Integer;
  curGroup, g1, g2, g3, g4: Integer;
  AStm: TDicomStream;
begin
  Sort;
  AStm := TDicomStream.Create(AStream);
  astm.KeepImageDataInStream := AKeepStream;
  AStm.TransferSyntax := ASyntax;
  AStm.JpegQuality := AJpegQuality;
  AStm.FOnlyCurrentFrame := AOnlyCurrentFrame;

  try
    g1 := -1;
    for i := 0 to Count - 1 do
    begin
      with ItemByIndex[i] do
      begin
        if Element = 0 then
        begin
          if g1 > 0 then
          begin
            g3 := AStm.Position;
            g4 := g3 - g1;
            if g4 <> g2 then
            begin
              AStm.Position := g1 - 4;
              AStm.WriteInt32(g4);
              AStm.Position := g3;
            end;
          end;

          g2 := AsInteger[0];
        end;
        z1 := AStm.Position;
        l1 := WriteVRHeader(AStm);

        z2 := AStm.Position;
        WriteVRData(AStm);

        z3 := AStm.Position;
        if (l1 > 0) and ((Z3 - z2) <> l1) then
        begin
          AStm.Position := z2 - 4;
          z4 := AStm.ReadInt32;
          if z4 <> -1 then
          begin
            AStm.Position := z1;
            WriteVRHeaderWithLength(AStm, (Z3 - z2));
          end;
          AStm.Position := z3;
        end;

        if Element = 0 then
        begin
          g1 := AStm.Position;
          curGroup := Group;
        end;
      end;
    end;
    if Count>0 then
      with ItemByIndex[Count - 1] do
      begin
        if (g1 > 0) and (g2 > 0) then
        begin
          g3 := AStm.Position;
          g4 := g3 - g1;
          if g4 <> g2 then
          begin
            AStm.Position := g1 - 4;
            AStm.WriteInt32(g4);
            AStm.Position := g3;
          end;
        end;
      end;
  finally
    AStm.Free;
  end;
end;

procedure TDicomAttributes.ReadData(AFrom: integer; AStream: TStream; ASyntax: Integer;
  AKeepStream: Boolean = false; ALoadFrameInThread: Boolean = false);
var
  Stm1: TDicomStream;
  da1: TDicomAttribute;
  k: Integer;
begin
  stm1 := TDicomStream.Create(AStream);
  if ALoadFrameInThread then
    stm1.KeepImageDataInStream := true
  else
    stm1.KeepImageDataInStream := AKeepStream;

  stm1.LoadFrameInThread := ALoadFrameInThread;
  try
    stm1.TransferSyntax := ASyntax;
    //    if AFrom > 0 then
    AStream.Position := AFrom;
    repeat
      da1 := TDicomAttribute.Create(self);
      try
        if (AStream.Position < AStream.Size) and da1.readVRHeader(stm1, k)
          and da1.readVRData(stm1, k) then
        begin
          if assigned(fOnReadAttribute) then
            fOnReadAttribute(self, da1, AStream.Position);
          if (da1.Element <> 0) then
          begin
            Add(da1);
            if (da1.Group = 32736) and (da1.Element = $10) then
              break;
          end
          else
            da1.Free;

        end
        else
        begin
          da1.Free;
          exit;
        end;
      except
        on e: Exception do
        begin
          raise Exception.Create(Format('ReadData:%s,%d,%d', [e.Message, da1.FGroup,
            da1.Element]));
          da1.Free;
        end
      end;
    until false;
  finally
    stm1.Free;
  end;
end;

procedure TDicomAttributes.ReadDataPDUCommand(AFrom: integer; AStream: TStream; ASyntax: Integer);
var
  Stm1: TDicomStream;
  da1: TDicomAttribute;
  k: Integer;
begin
  stm1 := TDicomStream.Create(AStream);
  try
    stm1.TransferSyntax := ASyntax;
    //    if AFrom > 0 then
    AStream.Position := AFrom;
    repeat
      da1 := TDicomAttribute.Create(self);
      try
        if (AStream.Position < AStream.Size) and da1.readVRHeader(stm1, k)
          and da1.readVRData(stm1, k) then
        begin
          if assigned(fOnReadAttribute) then
            fOnReadAttribute(self, da1, AStream.Position);
          if da1.Group <> 0 then
          begin
            da1.Free;
            exit;
          end
          else
            if (da1.Element <> 0) then
            Add(da1)
          else
            da1.Free;
        end
        else
        begin
          da1.Free;
          exit;
        end;
      except
        on e: Exception do
        begin
          da1.Free;
          raise Exception.Create('ReadDataPDUCommand:' + e.Message + ', when read(' +
            IntToHex(da1.Group, 4) + ',' + IntToHex(da1.Element, 4) + ')');
        end
      end;
    until false;
  finally
    stm1.Free;
  end;
end;

procedure TDicomAttributes.ReadDataPDUData(AFrom: integer; AStream: TStream; ASyntax: Integer);
var
  Stm1: TDicomStream;
  da1: TDicomAttribute;
  k: Integer;
  str1: AnsiString;
begin
  stm1 := TDicomStream.Create(AStream);
  try
    stm1.TransferSyntax := ASyntax;
    //    if AFrom > 0 then
    AStream.Position := AFrom;
    repeat
      da1 := TDicomAttribute.Create(self);
      try
        if (AStream.Position < AStream.Size) and da1.readVRHeader(stm1, k)
          and da1.readVRData(stm1, k) then
        begin
          if assigned(fOnReadAttribute) then
            fOnReadAttribute(self, da1, AStream.Position);
          if (da1.Element <> 0) then
            Add(da1)
          else
            da1.Free;
        end
        else
        begin
          da1.Free;
          exit;
        end;
      except
        on e: Exception do
        begin
          str1 := 'ReadDataPDUData ' + e.Message + ', when read(' +
            IntToHex(da1.Group, 4) + ',' + IntToHex(da1.Element, 4) + ')';
          da1.Free;
          raise Exception.Create(str1);
        end
      end;
    until false;
  finally
    stm1.Free;
  end;
end;

function TDicomAttributes.ReadHeader(AStream: TStream): Integer;
var
  da1: TDicomAttribute;
  l, kkk, lastpos: Integer;
  k: Integer;
  Stm1: TDicomStream;
begin
  stm1 := TDicomStream.Create(AStream);
  try
    stm1.TransferSyntax := ExplicitVRLittleEndian;
    stm1.SkipBytes(128);
    if stm1.ReadString(4) <> 'DICM' then
      raise Exception.Create('Not a valid Dicom-file');
    da1 := TDicomAttribute.Create(self);
    da1.ReadVRHeader(stm1, k);
    da1.ReadVRData(stm1, k);
    Add(da1);
    if assigned(fOnReadAttribute) then
      fOnReadAttribute(self, da1, AStream.Position);
    if (da1.FGroup = 2) and (da1.Element = 0) then
      l := da1.AsInteger[0] + AStream.Position
    else
      l := $FFFFFF;
    //lastpos := AStream.Position;
    while AStream.Position < l do
    begin
      lastpos := AStream.Position;

      da1 := TDicomAttribute.Create(self);
      da1.ReadVRHeader(stm1, k);
      if (da1.FGroup <> 2) then
      begin
        AStream.Position := lastpos;
        break;
      end;

      da1.ReadVRData(stm1, k);
      if assigned(fOnReadAttribute) then
        fOnReadAttribute(self, da1, AStream.Position);
      sort;
      if not FindItem(da1.Group, da1.Element, kkk) then
        Add(da1);

    end; // while
    {    r1 := AStream.Position;
        r2 := stm1.ReadInt16;
        AStream.Position := r1;
        if r2 = 2 then
        begin
          Clear;
          da1 := TDicomAttribute.Create(self);
          da1.ReadVRHeader(stm1, k);
          da1.ReadVRData(stm1, k);
          Add(da1);
          if assigned(fOnReadAttribute) then
            fOnReadAttribute(self, da1, AStream.Position);
          l := da1.AsInteger[0] + AStream.Position;
          while AStream.Position < l do
          begin
            da1 := TDicomAttribute.Create(self);
            da1.ReadVRHeader(stm1, k);
            da1.ReadVRData(stm1, k);
            if assigned(fOnReadAttribute) then
              fOnReadAttribute(self, da1, AStream.Position);
            Add(da1);
          end; // while
          exit;
        end; }
  finally
    stm1.Free;
  end;
  Result := AStream.Position;
end;

function TDicomAttributes.GetItemByContant(Index: Smallint): TDicomAttribute;
var
  i: Integer;
begin
  Sort;
  if FindByContant(Index, i) then
    Result := TDicomAttribute(FList[i])
  else
    Result := nil;
end;

function TDicomAttributes.FindByContant(AID: Integer; var AIndex: Integer): Boolean;
var
  d1: TDDictEntry;
begin
  d1 := DDict.ItemByContant[AID];
  Result := FindItem(d1.getGroup, d1.getElement, AIndex);
end;

procedure TDicomAttributes.AddVariant(AGroup: Integer; AElement: Integer; Value: Integer);
var
  da1: TDicomAttribute;
begin
  da1 := GetItem(AGroup, AElement);
  if assigned(da1) then
    da1.AsInteger[0] := Value
  else
  begin
    da1 := Add(AGroup, AElement);
    da1.AsInteger[0] := Value;
  end;
end;

procedure TDicomAttributes.AddVariant(AGroup: Integer; AElement: Integer; Value: AnsiString);
var
  da1: TDicomAttribute;
begin
  da1 := GetItem(AGroup, AElement);
  if assigned(da1) then
    da1.AsString[0] := Value
  else
  begin
    da1 := Add(AGroup, AElement);
    da1.AsString[0] := Value;
  end;
end;

procedure TDicomAttributes.AddVariant(AContant: Integer; Value: AnsiString);
var
  da1: TDicomAttribute;
  d1: TDDictEntry;
begin
  da1 := GetItemByContant(AContant);
  if assigned(da1) then
    da1.AsString[0] := Value
  else
  begin
    d1 := DDict.ItemByContant[AContant];
    da1 := Add(d1.getGroup, d1.getElement);
    da1.AsString[0] := Value;
  end;
end;

procedure TDicomAttributes.AddVariant(AContant: Integer; Value: Integer);
var
  da1: TDicomAttribute;
  d1: TDDictEntry;
begin
  da1 := GetItemByContant(AContant);
  if assigned(da1) then
    da1.AsInteger[0] := Value
  else
  begin
    d1 := DDict.ItemByContant[AContant];
    da1 := Add(d1.getGroup, d1.getElement);
    da1.AsInteger[0] := Value;
  end;
end;

procedure TDicomAttributes.AssignImage(AValue: TDicomAttributes; ASelX1, ASelY1, ASelX2, ASelY2:
  Integer);
var
  l, i, y: integer;
  da: TDicomAttribute;
  d1: TDicomImageData;
  pb1, pb2, pb3: PByte;
  pw1, pw2: PWord;
begin
  for i := 0 to AValue.FList.Count - 1 do
  begin
    da := TDicomAttribute.Create(self);
    da.assign(AValue.ItemByIndex[i]);
    Add(da);
  end;
  da := GetItem($28, $11);
  da.AsInteger[0] := abs(ASelX2 - ASelX1);
  da := GetItem($28, $10);
  da.AsInteger[0] := abs(ASelY2 - ASelY1);

  //  da := GetItem($20, $E);
  //  da.AsString[0] := da.AsString[0]+'.Copy';

  AddVariant($20, $E, GetString($20, $E) + '.Copy');
  AddVariant($8, $18, GetString($8, $18) + '.' + FormatDateTime('yyyymmddhhnnsszzz', now));

  if AValue.ImageData.DecompressData(0) then
  begin
    i := abs(ASelX2 - ASelX1) * abs(ASelY2 - ASelY1) * AValue.ImageData.FSamplePerPixel *
      ((AValue.ImageData.FBits + 7) div 8);
    GetMem(pb1, i);
    l := abs(ASelX2 - ASelX1) * AValue.ImageData.FSamplePerPixel * ((AValue.ImageData.FBits + 7)
      div
      8);
    if AValue.ImageData.FBits > 8 then
    begin
      pw1 := PWord(pb1);
      for y := ASelY1 to ASelY2 - 1 do
      begin
        pw2 := AValue.ImageData.ImageData[0].Data;
        inc(pw2, y * AValue.ImageData.FWidth + ASelX1);
        Move(pw2^, pw1^, l);
        inc(pw1, abs(ASelX2 - ASelX1));
      end;
    end
    else
    begin
      pb3 := pb1;
      for y := ASelY1 to ASelY2 - 1 do
      begin
        pb2 := AValue.ImageData.ImageData[0].Data;
        inc(pb2, (y * AValue.ImageData.FWidth + ASelX1) * AValue.ImageData.FSamplePerPixel);
        Move(pb2^, pb3^, l);
        inc(pb3, l);
      end;
    end;
    d1 := TDicomImageData.Create(ImplicitVRLittleEndian, pb1, i);
    da := Item[32736, 16];
    da.AddData(d1);
  end;
end;

procedure TDicomAttributes.Assign(AValue: TDicomAttributes);
var
  i: integer;
  da: TDicomAttribute;
begin
  for i := 0 to AValue.FList.Count - 1 do
  begin
    da := TDicomAttribute.Create(self);
    da.assign(AValue.ItemByIndex[i]);
    Add(da);
  end;
end;

function TDicomAttributes.getInteger(AGroup: Integer; AElement: Integer): Integer;
var
  da1: TDicomAttribute;
begin
  da1 := GetItem(AGroup, AElement);
  if assigned(da1) then
    Result := da1.AsInteger[0]
  else
    Result := 0;
end;

function TDicomAttributes.GetString(AGroup: Integer; AElement: Integer): AnsiString;
var
  da1: TDicomAttribute;
  i: Integer;
begin
  da1 := GetItem(AGroup, AElement);
  if assigned(da1) then
  begin
    Result := '';
    for i := 0 to da1.GetCount - 1 do
    begin
      if i <> 0 then
        Result := Result + '\';
      Result := Result + da1.AsString[i];
    end;
    Result := TrimRight(Result);
  end
  else
    Result := '';
end;

function TDicomAttributes.getInteger(AContant: Integer): Integer;
var
  da1: TDicomAttribute;
begin
  da1 := GetItemByContant(AContant);
  if assigned(da1) then
    Result := da1.AsInteger[0]
  else
    Result := 0;
end;

function TDicomAttributes.GetString(AContant: Integer): AnsiString;
var
  da1: TDicomAttribute;
  i: Integer;
begin
  da1 := GetItemByContant(AContant);
  if assigned(da1) then
  begin
    Result := '';
    for i := 0 to da1.GetCount - 1 do
    begin
      if i <> 0 then
        Result := Result + '\';
      Result := Result + da1.AsString[i];
    end;
    Result := TrimRight(Result);
  end
  else
    Result := '';
end;

function TDicomAttributes.GetDatalen(ASyntax: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do // Iterate
  begin
    Result := Result + ItemByIndex[i].GetHeaderlen(ASyntax);
    Result := Result + ItemByIndex[i].GetDatalen(ASyntax);
  end; // for
end;

function TDicomAttributes.GetDatalen(AGroup, ASyntax: Integer): Integer;
var
  I: Integer;
  da1: TDicomAttribute;
begin
  Result := 0;
  for I := 0 to Count - 1 do // Iterate
  begin
    da1 := ItemByIndex[i];
    if (da1.Group = AGroup) and (da1.Element <> 0) then
    begin
      Result := Result + da1.GetHeaderlen(ASyntax);
      Result := Result + da1.GetDatalen(ASyntax);
    end;
  end; // for
end;

procedure TDicomAttributes.AddAllGrouplength(ASyntax: Integer);
var
  strs: TStringList;
  i, k: Integer;
  str1: AnsiString;
  da1: TDicomAttribute;
begin
  strs := TStringList.Create;
  try
    for I := 0 to Count - 1 do // Iterate
    begin
      da1 := ItemByIndex[i];
      str1 := IntToStr(da1.Group);
      if strs.IndexOf(str1) < 0 then
        strs.Add(str1);
      {if da1.DataType = ddtAttributes then
      begin
        for k := 0 to da1.GetCount - 1 do
        begin
          da1.Attributes[k].AddAllGrouplength(ASyntax);
          da1.Attributes[k].Sort;
        end;
      end;}
    end;
    for i := 0 to strs.Count - 1 do
    begin
      k := StrToInt(strs[i]);
      AddVariant(k, 0, GetDatalen(k, ASyntax));
    end;
  finally
    strs.Free;
  end;
end;

procedure TDicomAttributes.DoAfterLoad;
begin
  FMultiSelected1 := getInteger($2809, $001B) <> 0;
  FMultiSelected2 := getInteger($2809, $001D) <> 0;
  FMultiSelected3 := getInteger($2809, $001E) <> 0;
  FMultiSelected4 := getInteger($2809, $001F) <> 0;

end;

procedure TDicomAttributes.DoAfterLoad(AValue: TDicomAttributes);
begin
  AddVariant($2809, $001B, AValue.getInteger($2809, $001B));
  AddVariant($2809, $001D, AValue.getInteger($2809, $001D));
  AddVariant($2809, $001E, AValue.getInteger($2809, $001E));
  AddVariant($2809, $001F, AValue.getInteger($2809, $001F));

  DoAfterLoad;
end;

procedure TDicomAttributes.ListAttrinute(APreString: AnsiString; AStrs: tstrings);

  procedure ListAttrinute(apre: AnsiString; das: TDicomAttributes; AStrs: tstrings);
  var
    i, k: Integer;
  begin
    if not assigned(das) then
      exit;

    for I := 0 to das.Count - 1 do // Iterate
    begin
      if das.ItemByIndex[i].FDataType <> ddtAttributes then
        AStrs.Add(apre + das.ItemByIndex[i].Text)
      else
      begin
        AStrs.Add(apre + das.ItemByIndex[i].Text);
        for k := 0 to das.ItemByIndex[i].GetCount - 1 do
        begin
          AStrs.Add(apre + '-----------' + IntToStr(k) + '------------');
          ListAttrinute(apre + '>>', das.ItemByIndex[i].Attributes[k], astrs);
        end;
      end;
    end; // for
  end;
begin
  //  astrs.Clear;
  ListAttrinute(APreString, self, astrs);
end;

function TDicomAttributes.IsImageChange: Boolean;
var
  d1, d2: TDicomAttribute;
begin
  d1 := Item[$28, $1050];
  d2 := Item[$28, $1051];
  Result := true;
  if assigned(d1) and assigned(d2) then
    Result := (ImageData.WindowWidth = d2.AsInteger[0]) and (ImageData.WindowCenter =
      d1.AsInteger[0]);
end;

function TDicomAttributes.FindItem(AGroup: Word; AElement: Word; var AIndex: Integer): Boolean;
var
  k, k1: LongWord;
  l1, h1, m1: Integer;
  p1: TDicomAttribute;
begin
  try
    k := AGroup shl 16 + AElement;
    l1 := 0;
    h1 := Flist.Count - 1;
    Result := False;
    AIndex := -1;
    while l1 <= h1 do
    begin
      m1 := (l1 + h1) div 2;
      p1 := TDicomAttribute(FList[m1]);
      k1 := p1.Group shl 16 + p1.Element;
      if k1 > k then
        h1 := m1 - 1
      else
        if k1 < k then
        l1 := m1 + 1
      else
      begin
        AIndex := m1;
        Result := true;
        exit;
      end;
    end; // while
  except
  end;
end;

procedure TDicomAttributes.Clear;
var vTmp : TDicomAttribute;
  I: Integer;
begin
  try
    if Assigned(FList) then
      if FList<>nil then
        if (FList.Count > 0) then
        begin                    
          for I := 0 to FList.Count - 1 do // Iterate
          begin
            vTmp := TDicomAttribute(FList[i]) ;
            if Assigned(vTmp) then
              if vTmp<>nil then
                vTmp.Free;
          end; // for
          FList.Clear;
        end;
  except
  //  on E:Exception do
  //    MessageDlg('qeweqw '+E.Message, mtWarning, [mbOK], 0);
  end;
end;

procedure TDicomAttributes.Remove(AGroup: Integer; AElement: Integer);
var
  i: Integer;
begin
  if FChanged then
    FList.Sort(SortAttribute);
  if FindItem(AGroup, AElement, i) then
  begin
    TDicomAttribute(FList[i]).Free;
    FList.Delete(i);
  end;
end;

function TDicomAttributes.Add(AValue: TDicomAttribute): TDicomAttribute;
begin
  FList.Add(AValue);
  Result := AValue;
  FChanged := true;
end;

function TDicomAttributes.Add(AGroup: Integer; AElement: Integer): TDicomAttribute;
begin
  Result := GetItem(AGroup, AElement);
  if Result = nil then
  begin
    Result := TDicomAttribute.Create(self, AGroup, AELement);
    FList.Add(Result);
    FChanged := true;
  end;
end;

procedure TDicomAttributes.Sort;
begin
  try     
    if FChanged then
      FList.Sort(SortAttribute);
  except
  end;
end;

function TDicomAttributes.GetItem(AGroup: Integer; AElement: Integer): TDicomAttribute;
var
  i: Integer;
begin
  Sort;
  if FindItem(AGroup, AElement, i) then
    Result := TDicomAttribute(FList[i])
  else
    Result := nil;
end;

function TDicomAttributes.GetItemByIndex(Index: Smallint): TDicomAttribute;
begin
  Result := TDicomAttribute(FList[Index]);
end;

function TDicomAttributes.GetCount: Integer;
begin
  Result := FList.Count;
end;

destructor TDicomAttributes.Destroy;
begin
  Clear;
  if assigned(FList) then
    if FList<>nil then
      FreeAndNil( FList );
  if assigned(FImageData) then
    if FImageData<>nil then
      FImageData.Free;
  inherited Destroy;
end;

constructor TDicomAttributes.Create;
begin
  {$IFDEF FOR_TRIAL_VERSION}
  if (not assigned(CnsExpireTimer)) then
  begin
    CnsExpireTimer := TTimerExt.Create(nil);
    CnsExpireTimer.Enabled := true;
  end;
  //ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
  {$ENDIF}

  FBufferLength := dibl16Bit;

  FSelected := False;
  FMultiSelected1 := false;
  FMultiSelected2 := false;
  FMultiSelected3 := false;
  FMultiSelected4 := false;

  FList := TList.Create;
  FChanged := false;
  FImageData := nil;
  fWaveformData := nil;
end;

procedure TDicomAttribute.Assign(AValue: TDicomAttribute);
var
  i: Integer;
  o1, o2: TOBStream;
  da1, da2: TDicomAttributes;
begin
  FGroup := AValue.FGroup;
  FElement := AValue.FElement;

  //  FDataArray := TList.Create;
  FDict := AValue.FDict;
  Dcm_Type := AValue.dcm_type;
  case dcm_type of
    tSQ:
      begin
        FDataType := ddtAttributes;
        for i := 0 to AValue.FDataArray.Count - 1 do
        begin
          da2 := AValue.GetAttributes(i);
          da1 := TDicomAttributes.Create;
          da1.Assign(da2);
          AddData(da1);
        end;
      end;
    tOW, tOB, tOW_OB, tUNKNOWN:
      begin
        if (fgroup = 32736) and (felement = 16) then
        begin
          FDataType := ddtImage;
        end
        else
        begin
          FDataType := ddtOBStream;
          for i := 0 to AValue.FDataArray.Count - 1 do
          begin
            o2 := AValue.GetOBData(i);
            o1 := TOBStream.Create;
            o1.LoadFromStream(o2);
            AddData(o1);
          end;
        end;
      end;
    tAT, tSL, tUL, tUS, tUS_SS, tIS:
      begin
        FDataType := ddtInteger;
        for i := 0 to AValue.FDataArray.Count - 1 do
        begin
          SetAsInteger(i, AValue.GetAsInteger(i));
        end;
      end;
    tFL:
      begin
        FDataType := ddtSingle;
        for i := 0 to AValue.FDataArray.Count - 1 do
        begin
          SetAsFloat(i, AValue.GetAsFloat(i));
        end;
      end;
    tFD, tDS:
      begin
        FDataType := ddtDouble;
        for i := 0 to AValue.FDataArray.Count - 1 do
        begin
          SetAsFloat(i, AValue.GetAsFloat(i));
        end;
      end;
    tSS:
      begin
        FDataType := ddtShortInt;
        for i := 0 to AValue.FDataArray.Count - 1 do
        begin
          SetAsInteger(i, AValue.GetAsInteger(i));
        end;
      end;
    tDA, tDT:
      begin
        FDataType := ddtDatetime;
        for i := 0 to AValue.FDataArray.Count - 1 do
        begin
          SetAsDatetime(i, AValue.GetAsDatetime(i));
        end;
      end;
    tTM:
      begin
        FDataType := ddtTime;
        for i := 0 to AValue.FDataArray.Count - 1 do
        begin
          SetAsDatetime(i, AValue.GetAsDatetime(i));
        end;
      end
      //tAS,tPN:
  else
    begin
      FDataType := ddtString;
      for i := 0 to AValue.FDataArray.Count - 1 do
      begin
        SetAsString(i, AValue.GetAsString(i));
      end;
    end;
  end;
end;

procedure TDicomAttribute.ClearDataArray;
//var
//  i: Integer;
begin
  if FDataArray.Count > 0 then
  begin
    {    for I := 0 to FDataArray.Count - 1 do // Iterate
        begin
          if FDataArray[i] <> nil then
          begin
            try
              case FDataType of
                ddtAttributes:
                  begin
                    TDicomAttributes(FDataArray[i]).Free;
                  end;
                ddtImage:
                  begin
                    TDicomImageData(FDataArray[i]).Free;
                  end;
                ddtOBStream:
                  begin
                    TOBStream(FDataArray[i]).Free;
                  end
              else
                FreeMem(FDataArray[i])
              end;
            except
            end;
          end;
        end; // for  }
    FDataArray.Clear;
  end;
end;

procedure TDicomAttribute.Clear;
var
  i: Integer;
begin
  if FDataArray.Count > 0 then
  begin
    for I := 0 to FDataArray.Count - 1 do // Iterate
    begin
      if FDataArray[i] <> nil then
      begin
        try
          case FDataType of
            ddtAttributes:
              begin
                TDicomAttributes(FDataArray[i]).Free;
              end;
            ddtImage:
              begin
                TDicomImageData(FDataArray[i]).Free;
              end;
            ddtOBStream:
              begin
                TOBStream(FDataArray[i]).Free;
              end
          else
            FreeMem(FDataArray[i])
          end;
        except
        end;
      end;
    end; // for  }
    FDataArray.Clear;
  end;
end;

procedure TDicomAttribute.LoadFromStream(AStream: TStream);
var
  p: TOBStream;
begin
  if FDataType = ddtOBStream then
  begin
    if assigned(AStream) then
    begin
      p := TOBStream.Create;
      p.LoadFromStream(AStream);
      FDataArray.Add(p);
    end;
  end
  else
  begin
    raise Exception.Create('Element is not OB type');
  end;
end;

procedure TDicomAttribute.SaveToStream(AStream: TStream);
var
  p: TOBStream;
begin
  p := GetOBData(0);
  if assigned(p) then
  begin
    p.SaveToStream(AStream);
  end;
end;

procedure TDicomAttribute.LoadFromFile(AFileName: AnsiString);
var
  p: TOBStream;
begin
  if FDataType = ddtOBStream then
  begin
    if FileExists(AFileName) then
    begin
      p := TOBStream.Create;
      p.LoadFromFile(AFileName);
      FDataArray.Add(p);
    end;
  end
  else
  begin
    raise Exception.Create('Element is not ob type');
  end;
end;

procedure TDicomAttribute.SaveToFile(AFileName: AnsiString);
var
  p: TOBStream;
begin
  p := GetOBData(0);
  if assigned(p) then
  begin
    p.SaveToFile(AFileName);
  end;
end;

function TDicomAttribute.getID: Integer;
begin
  Result := FDict.ID;
end;

procedure TDicomAttribute.AddNewData(AIndex: Integer);
var
  p1: PAnsiChar;
  p2: PInteger;
  p3: PSingle;
  p4: PDouble;
  p5: PShortInt;
  p6: PDatetime;
  i: Integer;
begin
  if AIndex >= FDataArray.Count then
  begin
    for i := FDataArray.Count to Aindex do
      case FDataType of //
        ddtString:
          begin
            GetMem(p1, 1);
            FDataArray.Add(p1);
          end;
        ddtInteger:
          begin
            getMem(p2, Sizeof(Integer));
            FDataArray.Add(p2);
          end;
        ddtSingle:
          begin
            getMem(p3, Sizeof(Single));
            FDataArray.Add(p3);
          end;
        ddtDouble:
          begin
            getMem(p4, Sizeof(Double));
            FDataArray.Add(p4);
          end;
        ddtShortInt:
          begin
            getMem(p5, Sizeof(ShortInt));
            FDataArray.Add(p5);
          end;
        ddtDatetime, ddtTime:
          begin
            getMem(p6, Sizeof(TDatetime));
            FDataArray.Add(p6);
          end;
      else
        raise Exception.Create('AnsiString can not assign to the tag');
      end; // case
  end;
end;

function TDicomAttribute.GetOBData(AIndex: Integer): TOBStream;
begin
  if FDataArray.Count > 0 then
  begin
    case FDataType of //
      ddtOBStream: Result := TOBStream(FDataArray[AIndex]);
    else
      Result := nil;
    end; // case
  end
  else
    Result := nil;
end;

function TDicomAttribute.AddData(AValue: Pointer): Integer;
begin
  Result := FDataArray.Add(AValue);
end;

function TDicomAttribute.InsertData(AIndex: Integer; AValue: Pointer): Integer;
begin
  FDataArray.Insert(AIndex, AValue);
  Result := AIndex;
end;

function TDicomAttribute.GetHeaderLen(ASyntax: Integer): Integer;
begin
  Result := 4;
  if ASyntax = ImplicitVRLittleEndian then
  begin
    Result := Result + 4;
  end
  else
  begin
    Result := Result + 2;
    case dcm_type of
      0, 8, 10, 22, 24, 27:
        {tUNKNOWN,
          tOB, tOW_OB, tOW,
          tUT,
          tSQ:}
        begin
          Result := Result + 6;
        end;
    else
      begin
        Result := Result + 2;
      end;
    end; //end of case
  end; //end of if(j = 8193)
end;

function TDicomAttribute.GetDataLen(ASyntax: Integer): Integer;
var
  l, i: Integer;
begin
  if (FDataArray.Count <= 0) then
  begin
    Result := 0;
  end
  else
  begin
    l := GetDicomTypeLength(dcm_type);
    if l <> 0 then
      Result := l * FDataArray.Count
    else
    begin
      Result := 0;
      for i := 0 to FDataArray.Count - 1 do
      begin
        case FDataType of //
          ddtString, ddtInteger, ddtSingle, ddtDouble,
            ddtShortInt:
            begin
              //              if Dcm_Type=tIS then
              //                l := 6
              //              else
              if Dcm_Type = tDS then
                l := Length(FloatToDicomStr(PDouble(FDataArray[i])^))
              else
                l := Length(AsString[i]);
              Result := Result + l;
              if i <> 0 then
                Result := Result + 1;
            end;
          ddtDatetime:
            begin
              if Dcm_Type = tDT then //28
              begin
                {$IFDEF TIME_LENGTH_HAVE_MS}
                Result := Result + 21;
                {$ELSE}
                Result := Result + 14;
                {$ENDIF}
              end
              else
              begin
                Result := Result + 8;
                if i <> 0 then
                  Result := Result + 1;
              end;
              //                Result := 8;
            end;
          ddtTime:
            begin
              {$IFDEF TIME_LENGTH_HAVE_MS}
              Result := 6 + 7;
              {$ELSE}
              Result := 6;
              {$ENDIF}
            end;
          ddtAttributes: //SQ
            begin
              {$IFDEF SQ_UNDEFINELENGTH}
              Result := Result + TDicomAttributes(FDataArray[i]).GetDatalen(ASyntax) + 16;
              {$ELSE}
              Result := Result + TDicomAttributes(FDataArray[i]).GetDatalen(ASyntax) + 8;
              {$ENDIF}
            end;
          ddtOBStream: //OB
            begin
              l := TOBStream(FDataArray[i]).Size;
              Result := Result + l;
              if (l mod 2) <> 0 then
                Result := Result + 1;
              if FDataArray.Count > 1 then
                Result := Result + 8;
            end;
          ddtImage: //OB
            begin
              l := TDicomImageData(FDataArray[i]).Len;
              Result := Result + l;
              if (l mod 2) <> 0 then
                Result := Result + 1;
              if FDataArray.Count > 1 then
                Result := Result + 8;
            end;
        end; // case
      end;
      //if dcm_type <> tCS then
      case FDataType of //
        ddtString, ddtInteger, ddtSingle, ddtDouble,
          ddtShortInt, ddtDatetime, ddtTime:
          begin
            if (Result mod 2) <> 0 then
              Result := Result + 1;
          end;
        ddtAttributes: //SQ
          begin
            {$IFDEF SQ_UNDEFINELENGTH}
            Result := Result + 8;
            {$ENDIF}
          end;
        ddtOBStream, ddtImage: //OB
          begin
            if FDataArray.Count > 1 then
              Result := Result + 8;
          end;
      end; // case
    end;
  end;
end;

function TDicomAttribute.GetDataLenUndefineLength(ASyntax: Integer): Integer;
var
  l, i: Integer;
begin
  if (FDataArray.Count <= 0) then
  begin
    Result := 0;
  end
  else
  begin
    l := GetDicomTypeLength(dcm_type);
    if l <> 0 then
      Result := l * FDataArray.Count
    else
    begin
      Result := 0;
      for i := 0 to FDataArray.Count - 1 do
      begin
        case FDataType of //
          ddtString, ddtInteger, ddtSingle, ddtDouble,
            ddtShortInt:
            begin
              //              if Dcm_Type=tIS then
              //                l := 6
              //              else
              if Dcm_Type = tDS then
                l := Length(FloatToDicomStr(PDouble(FDataArray[i])^))
              else
                l := Length(AsString[i]);
              Result := Result + l;
              if i <> 0 then
                Result := Result + 1;
            end;
          ddtDatetime:
            begin
              if Dcm_Type = tDT then //28
              begin
                {$IFDEF TIME_LENGTH_HAVE_MS}
                Result := Result + 21;
                {$ELSE}
                Result := Result + 14;
                {$ENDIF}
              end
              else
              begin
                Result := Result + 8;
                if i <> 0 then
                  Result := Result + 1;
              end;
              //                Result := 8;
            end;
          ddtTime:
            begin
              {$IFDEF TIME_LENGTH_HAVE_MS}
              Result := Result + 6 + 7;
              {$ELSE}
              Result := Result + 6;
              {$ENDIF}
            end;
          ddtAttributes: //SQ
            begin
              {$IFDEF SQ_UNDEFINELENGTH}
              Result := Result + TDicomAttributes(FDataArray[i]).GetDatalen(ASyntax) + 16;
              {$ELSE}
              Result := Result + TDicomAttributes(FDataArray[i]).GetDatalen(ASyntax) + 8;
              {$ENDIF}
            end;
          ddtOBStream: //OB
            begin
              l := TOBStream(FDataArray[i]).Size;
              Result := Result + l;
              if (l mod 2) <> 0 then
                Result := Result + 1;
              if FDataArray.Count > 1 then
                Result := Result + 8;
            end;
          ddtImage: //OB
            begin
              l := TDicomImageData(FDataArray[i]).Len;
              Result := Result + l;
              if (l mod 2) <> 0 then
                Result := Result + 1;
              if FDataArray.Count > 1 then
                Result := Result + 8;
            end;
        end; // case
      end;
      //if dcm_type <> tCS then
      case FDataType of //
        ddtString, ddtInteger, ddtSingle, ddtDouble,
          ddtShortInt, ddtDatetime, ddtTime:
          begin
            if (Result mod 2) <> 0 then
              Result := Result + 1;
          end;
        ddtAttributes: //SQ
          begin
            {$IFDEF SQ_UNDEFINELENGTH}
            Result := Result + 8;
            {$ENDIF}
          end;
        ddtOBStream, ddtImage: //OB
          begin
            if FDataArray.Count > 1 then
              Result := Result + 8;
          end;
      end; // case
    end;
  end;
end;

function TDicomAttribute._WriteSQofOB_OW(f1: TDicomStream): Integer;
var
  i: Integer;
  k, k1, k2, k3: Integer;
  d1: TDicomImage;
  dimage: TDicomImageData;
  a1: array of Integer;
begin
  k := 0;
  if (fgroup = 32736) and (felement = 16) then
  begin
    if ((f1.TransferSyntax = ImplicitVRLittleEndian) or
      (f1.TransferSyntax = ExplicitVRLittleEndian) or
      (f1.TransferSyntax = ExplicitVRBigEndian)) then
    begin
      f1.Position := f1.Position - 4;
      if FDataArray.Count = 1 then
      begin
        k := k + _WriteOB_OW(f1, 0, true);
      end
      else
      begin
        d1 := Parent.ImageData;
        if d1.DecompressData(0) then
        begin
          if (f1.FOnlyCurrentFrame >= 0) and (FDataArray.Count > 1) then
          begin

            // FOMIN 30.10.2012
            if Assigned(FOnWriteFrame) then FOnWriteFrame(Self, i, FDataArray.Count-1 );
            // END FOMIN 30.10.2012

            k := k + _WriteOB_OW(f1, f1.FOnlyCurrentFrame, true);
          end
          else
          begin
            f1.WriteInt32(d1.Width * d1.Height * d1.SamplePerPixel * ((d1.Bits + 7) div 8) *
              FDataArray.Count);
            for i := 0 to FDataArray.Count - 1 do
            begin

              // FOMIN 30.10.2012
              if Assigned(FOnWriteFrame) then FOnWriteFrame(Self, i, FDataArray.Count-1 );
              // END FOMIN 30.10.2012

              if d1.DecompressData(i) then
              begin
                dimage := FDataArray[i];
                if f1.KeepImageDataInStream then
                begin
                  dimage.FImageStream := f1.FStream;
                  dimage.FImagePositionInStream := f1.Position;
                  dimage.FImageLenInStream := dimage.Len;
                end;
                k := k + f1.write(PByte(dimage.Data)^, dimage.Len);
              end;
            end;
          end;
        end;
      end;
    end
    else
    begin
      f1.Position := f1.Position - 4;
      f1.WriteInt32(-1);

      k := k + f1.WriteInt16(65534);
      k := k + f1.WriteInt16(57344);
      k := k + f1.WriteInt32(FDataArray.Count * 4);
      SetLength(a1, FDataArray.Count);
      k1 := f1.Position;

      for i := 0 to FDataArray.Count - 1 do
        k := k + f1.WriteInt32(0);
      k3 := f1.Position;
      for i := 0 to FDataArray.Count - 1 do
      begin

        // FOMIN 30.10.2012
        if Assigned(FOnWriteFrame) then FOnWriteFrame(Self, i, FDataArray.Count-1 );
        // END FOMIN 30.10.2012

        a1[i] := f1.Position - k3;
        k := k + f1.WriteInt16(65534);
        k := k + f1.WriteInt16(57344);
        k := k + _WriteOB_OW(f1, i, true);
      end;
      k := k + f1.WriteInt16(65534);
      k := k + f1.WriteInt16(57565);
      k := k + f1.WriteInt32(0);
      k2 := f1.Position;
      f1.Position := k1;
      for i := 0 to FDataArray.Count - 1 do
        k := k + f1.WriteInt32(a1[i]);
      f1.Position := k2;
    end
  end
  else
  begin
    for i := 0 to FDataArray.Count - 1 do
    begin

      // FOMIN 30.10.2012
      if Assigned(FOnWriteFrame) then FOnWriteFrame(Self, i, FDataArray.Count-1 );
      // END FOMIN 30.10.2012

      k := k + f1.WriteInt16(65534);
      k := k + f1.WriteInt16(57344);
      k := k + _WriteOB_OW(f1, i, true);
    end;
    k := k + f1.WriteInt16(65534);
    k := k + f1.WriteInt16(57565);
    k := k + f1.WriteInt32(0);
  end;
  Result := k;
end;

function TDicomAttribute._WriteAS(f1: TDicomStream; Aindex: Integer): Integer;
var
  s: Ansistring;
begin
  s := StrPas(PAnsiChar(FDataArray[Aindex]));
  while Length(s) < 4 do
    s := s + ' ';
  Result := f1.Write(s[1], Length(s));
end;

function TDicomAttribute._WriteAT(f1: TDicomStream; Aindex: Integer): Integer;
var
  i: Integer;
  k1, k2: Word;
begin
  i := PInteger(FDataArray[Aindex])^;
  k2 := i and $FFFF;
  k1 := (i shr 16) and $FFFF;
  Result := f1.Write(k1, sizeOf(Word))
    + f1.Write(k2, sizeOf(Word));
  //  Result := f1.Write(FDataArray[Aindex]^, sizeOf(Integer));
end;

function TDicomAttribute._WriteFloat(f1: TDicomStream; Aindex: Integer): Integer;
begin
  Result := f1.Write(FDataArray[Aindex]^, sizeOf(Single));
end;

function TDicomAttribute._WriteDouble(f1: TDicomStream; Aindex: Integer): Integer;
begin
  Result := f1.Write(FDataArray[Aindex]^, sizeOf(Double));
end;

function TDicomAttribute._WriteLong(f1: TDicomStream; Aindex: Integer): Integer;
var
  n1: Integer;
begin
  n1 := PInteger(FDataArray[Aindex])^;
  Result := f1.WriteInt32(n1);
  //  Result := f1.Write(FDataArray[Aindex]^, 4);
end;

function TDicomAttribute._WriteShort(f1: TDicomStream; Aindex: Integer): Integer;
var
  n1: Integer;
begin
  n1 := PInteger(FDataArray[Aindex])^;
  Result := f1.WriteInt16(n1);
  //Result := f1.Write(FDataArray[Aindex]^, 2);
end;

function TDicomAttribute._WriteInteger(f1: TDicomStream; Aindex: Integer): Integer;
var
  w1: Word;
begin
  w1 := PInteger(FDataArray[Aindex])^;
  Result := f1.WriteInt16(w1);
end;

function TDicomAttribute._WriteString(f1: TDicomStream; Aindex: Integer): Integer;
var
  s: Ansistring;
  //  i: Integer;
begin
  s := StrPas(PAnsiChar(FDataArray[Aindex]));
  //  if (Length(s) mod 2) = 1 then
  //    s := s + ' ';
  while Length(s) < 4 do
    s := s + ' ';
  Result := f1.Write(s[1], Length(s));
end;

function TDicomAttribute.WriteDICOMDIRSQ(f1: TDicomStream): Integer;
var
  l, k, l1, z1, z2, l2: Integer;
  dicomobject: TDicomAttributes;
begin
  Result := 0;
  l := 0;
  while l < FDataArray.Count do
  begin
    dicomobject := TDicomAttributes(FDataArray[l]);
    if l + 1 < FDataArray.Count then
    begin
      l2 := dicomobject.GetDatalen(f1.FTransferSyntax) + f1.Position + 8;
    end
    else
      l2 := 0;
    dicomobject.AddVariant($4, $1420, l2);
    dicomobject.Sort;

    Result := Result + f1.WriteInt16(65534);
    Result := Result + f1.WriteInt16(57344);

    if f1.UseUndefineLength then
      Result := Result + f1.WriteInt32(-1)
    else
    begin
      l1 := dicomobject.GetDatalen(f1.FTransferSyntax);
      z1 := f1.Position;
      Result := Result + f1.WriteInt32(l1);
    end;
    for k := 0 to dicomobject.Count - 1 do
    begin
      dicomobject.ItemByIndex[k].WriteVRHeader(f1);
      dicomobject.ItemByIndex[k].WriteVRData(f1);
    end;

    if f1.UseUndefineLength then
    begin
      Result := Result + f1.WriteInt16(65534);
      Result := Result + f1.WriteInt16(57357);
      Result := Result + f1.WriteInt32(0);
    end
    else
    begin
      z2 := f1.Position;
      if l1 <> (z2 - z1 - 4) then
      begin
        f1.Position := z1;
        f1.WriteInt32(z2 - z1 - 4);
        f1.Position := z2;
      end;
    end;
    Inc(l);
  end; //end of while(l<val.size()):
  if f1.UseUndefineLength then
  begin
    Result := Result + f1.WriteInt16(65534);
    Result := Result + f1.WriteInt16(57565);
    Result := Result + f1.WriteInt32(0);
  end;
end;

function TDicomAttribute._WriteSQ(f1: TDicomStream): Integer;
var
  l, k, l1, z1, z2: Integer;
  dicomobject: TDicomAttributes;
begin
  Result := 0;
  l := 0;
  while l < FDataArray.Count do
  begin
    dicomobject := TDicomAttributes(FDataArray[l]);
    dicomobject.Sort;

    Result := Result + f1.WriteInt16(65534);
    Result := Result + f1.WriteInt16(57344);

    if f1.UseUndefineLength then
      Result := Result + f1.WriteInt32(-1)
    else
    begin
      l1 := dicomobject.GetDatalen(f1.FTransferSyntax);
      z1 := f1.Position;
      Result := Result + f1.WriteInt32(l1);
    end;
    for k := 0 to dicomobject.Count - 1 do
    begin
      dicomobject.ItemByIndex[k].WriteVRHeader(f1);
      dicomobject.ItemByIndex[k].WriteVRData(f1);
    end;

    if f1.UseUndefineLength then
    begin
      Result := Result + f1.WriteInt16(65534);
      Result := Result + f1.WriteInt16(57357);
      Result := Result + f1.WriteInt32(0);
    end
    else
    begin
      z2 := f1.Position;
      if l1 <> (z2 - z1 - 4) then
      begin
        f1.Position := z1;
        f1.WriteInt32(z2 - z1 - 4);
        f1.Position := z2;
      end;
    end;
    Inc(l);
  end; //end of while(l<val.size()):
  if f1.UseUndefineLength then
  begin
    Result := Result + f1.WriteInt16(65534);
    Result := Result + f1.WriteInt16(57565);
    Result := Result + f1.WriteInt32(0);
  end;
end;

function Getphotometric(AStr: AnsiString): Integer;
begin
  if astr = 'MONOCHROME1' then
    result := photometricInterpretationMONOCHROME1
  else
    if astr = 'MONOCHROME2' then
    result := photometricInterpretationMONOCHROME2
  else
    if astr = 'RGB' then
    result := photometricInterpretationRGB
  else
    if astr = 'ARGB' then
    result := photometricInterpretationARGB
  else
    if astr = 'YBR_FULL_422' then
    result := photometricInterpretationYBR_FULL_422
  else
    if astr = 'YBR_PARTIAL_422' then
    result := photometricInterpretationYBR_PARTIAL_422
  else
    if astr = 'YBR_FULL' then
    result := photometricInterpretationYBR_FULL
  else
    if astr = 'CMYK' then
    result := photometricInterpretationCMYK;
end;

function TDicomAttribute._WriteOB_OW(f1: TDicomStream; AIndex: Integer; ANeedLen: Boolean):
  Integer;
var
  Stm1: TmemoryStream;
  o1: TOBStream;
  dimage: TDicomImageData;
  d1: TDicomImage;
  {$IFDEF ECLZLIBTransferSyntax}
  {$IFDEF USEECLMEMORYSTREAM}
  e1: TECLMemoryStream;
  {$ELSE}
  e1: TECLFileStream;
  eclfilename: AnsiString;
  {$ENDIF}
  {$ENDIF}
  //  i1, i2: Integer;
  photometric: Integer;
  compressionSyntax: Integer;
  l1: Integer;

  compressImageLength: Integer;
  NeedToFree: Boolean;
  PointerNeedToFree: Pointer;
  procedure GetSourceData;
  begin
    if (d1.PhotometricInterpretation = 'YBR_PARTIAL_422') or
      (d1.PhotometricInterpretation = 'YBR_FULL') or
      (d1.PhotometricInterpretation = 'YBR_FULL_422') then
    begin
      PointerNeedToFree := d1.ConvertFromRGB(dimage, compressImageLength);
      NeedToFree := true;
    end
    else
      {.$IFDEF USE_16_TO_FLOAT_BUFFER}
      if (d1.FBufferLength = diblFloat) and (d1.FBits > 8) then
    begin
      compressImageLength := d1.fWidth * d1.fHeight * SizeOf(Word);
      GetMem(PointerNeedToFree, compressImageLength);
      if d1.PixelRepresentation then
        vImageConvert_Fto16U(dimage.FImageData, d1.fwidth, d1.fHeight,
          PointerNeedToFree, d1.fWidth, d1.fHeight, 1 / d1.FRescaleSlope, -d1.FRescaleIntercept)
      else
        vImageConvert_Fto16S(dimage.FImageData, d1.fwidth, d1.fHeight,
          PointerNeedToFree, d1.fWidth, d1.fHeight, 1 / d1.FRescaleSlope, -d1.FRescaleIntercept);
      NeedToFree := true;
    end
    else {.$ENDIF}
    begin
      PointerNeedToFree := dimage.Data;
      compressImageLength := dimage.Len;
      NeedToFree := false;
    end;
  end;
  procedure FreeConvertData;
  begin
    if (PointerNeedToFree <> nil) and NeedToFree then
    begin
      Freemem(PointerNeedToFree);
    end;
  end;
begin
  Result := 0;
  NeedToFree := false;
  PointerNeedToFree := nil;
  if (fgroup = 32736) and (felement = 16) then
  begin
    dimage := FDataArray[AIndex];
    if f1.KeepImageDataInStream then
    begin
      dimage.FImageStream := f1.FStream;
      if ANeedLen then
        dimage.FImagePositionInStream := f1.Position + 4
      else
        dimage.FImagePositionInStream := f1.Position;
      dimage.FImageLenInStream := dimage.Len;
      //      dimage.FTransferSyntax := f1.TransferSyntax;
    end;
    d1 := Parent.ImageData;
    if (dimage.Len <= 0) then
      exit;
    if dimage.Len <= ((FDataArray.Count - 1) * 4) then
    begin
      {      if ANeedLen then
              f1.WriteInt32(dimage.Len);
            result := f1.write(PByte(dimage.Data)^, dimage.Len); }
      exit;
    end;
    if (not dimage.FHasDecompress) and ((dimage.FTransferSyntax = f1.TransferSyntax)
      or (((dimage.FTransferSyntax = JPEGBaseline) or (dimage.FTransferSyntax =
      JPEGExtendedProcess_2_4)) and
      ((f1.FTransferSyntax = JPEGBaseline) or (f1.FTransferSyntax = JPEGExtendedProcess_2_4))))
    then
    begin
      if ANeedLen then
      begin
        l1 := dimage.Len;
        if (l1 mod 2) <> 0 then
          inc(l1);
        f1.WriteInt32(l1);
      end;
      result := f1.write(PByte(dimage.Data)^, dimage.Len);
      if (dimage.Len mod 2) <> 0 then
        f1.WriteInt8(0);
    end
    else
    begin
      if d1.DecompressData(AIndex) then
      begin
        case f1.TransferSyntax of
          ImplicitVRLittleEndian, ExplicitVRLittleEndian, ExplicitVRBigEndian:
            begin
              GetSourceData;

              if f1.FTransferSyntax = ExplicitVRBigEndian then
              begin
                d1.SwapBigEndian(AIndex);
              end;

              if ANeedLen then
              begin
                l1 := compressImageLength;
                if (l1 mod 2) <> 0 then
                  inc(l1);
                f1.WriteInt32(l1);
              end;
              result := f1.write(PByte(PointerNeedToFree)^, compressImageLength);

              if (compressImageLength mod 2) <> 0 then
              begin
                f1.WriteInt8(0);
                Result := Result + 1;
              end;

              FreeConvertData;
            end;
          {$IFDEF ECLZLIBTransferSyntax}
          zlibFastestTransferSyntax,
            ppmFastestTransferSyntax,
            bzipFastestTransferSyntax,
            zlibMaxTransferSyntax,
            ppmMaxTransferSyntax,
            bzipMaxTransferSyntax,
            zlibNormalTransferSyntax,
            ppmNormalTransferSyntax,
            bzipNormalTransferSyntax:
            begin
              {$IFDEF USEECLMEMORYSTREAM}
              case f1.TransferSyntax of
                zlibFastestTransferSyntax: e1 := TECLMemoryStream.Create('', zlibFastest);
                ppmFastestTransferSyntax: e1 := TECLMemoryStream.Create('', ppmFastest);
                bzipFastestTransferSyntax: e1 := TECLMemoryStream.Create('', bzipFastest);
                zlibMaxTransferSyntax: e1 := TECLMemoryStream.Create('', zlibMax);
                ppmMaxTransferSyntax: e1 := TECLMemoryStream.Create('', ppmMax);
                bzipMaxTransferSyntax: e1 := TECLMemoryStream.Create('', bzipMax);
                zlibNormalTransferSyntax: e1 := TECLMemoryStream.Create('', zlibNormal);
                ppmNormalTransferSyntax: e1 := TECLMemoryStream.Create('', ppmNormal);
                bzipNormalTransferSyntax: e1 := TECLMemoryStream.Create('', bzipNormal);
              end;
              {$ELSE}
              eclfilename := Format('%s\$ECL%d.TMP', [ECLTempPath, ECLTempFileIndex]);
              inc(ECLTempFileIndex);
              case f1.TransferSyntax of
                zlibFastestTransferSyntax: e1 := TECLFileStream.Create(eclfilename, fmCreate, '',
                    zlibFastest);
                ppmFastestTransferSyntax: e1 := TECLFileStream.Create(eclfilename, fmCreate, '',
                    ppmFastest);
                bzipFastestTransferSyntax: e1 := TECLFileStream.Create(eclfilename, fmCreate, '',
                    bzipFastest);
                zlibMaxTransferSyntax: e1 := TECLFileStream.Create(eclfilename, fmCreate, '',
                    zlibMax);
                ppmMaxTransferSyntax: e1 := TECLFileStream.Create(eclfilename, fmCreate, '',
                    ppmMax);
                bzipMaxTransferSyntax: e1 := TECLFileStream.Create(eclfilename, fmCreate, '',
                    bzipMax);
                zlibNormalTransferSyntax: e1 := TECLFileStream.Create(eclfilename, fmCreate, '',
                    zlibNormal);
                ppmNormalTransferSyntax: e1 := TECLFileStream.Create(eclfilename, fmCreate, '',
                    ppmNormal);
                bzipNormalTransferSyntax: e1 := TECLFileStream.Create(eclfilename, fmCreate, '',
                    bzipNormal);
              end;
              {$ENDIF}
              GetSourceData;
              //Stm1 := TMemoryStream.Create;
              try
                try
                  e1.Write(PByte(PointerNeedToFree)^, compressImageLength);

                  if ANeedLen then
                    f1.WriteInt32(e1.CompressedDataStream.Size);
                  //e1.CompressedDataStream.SaveToStream(stm1);
                  //result := f1.write(stm1.Memory^, stm1.Size);
                  e1.CompressedDataStream.SaveToStream(f1.Stream);
                  Result := e1.CompressedDataStream.Size;
                  if f1.KeepImageDataInStream then
                  begin
                    dimage.FImageLenInStream := e1.CompressedDataStream.Size;
                    dimage.FTransferSyntax := f1.TransferSyntax;
                  end;

                except
                  on e: Exception do
                  begin
                    raise Exception.Create('Save To ZIP Stream error:' + e.Message);
                  end;
                end;
              finally
                e1.Free;
                FreeConvertData;
                //stm1.Free;
              end;
              {$IFNDEF USEECLMEMORYSTREAM}
              DeleteFile(PAnsiChar(eclfilename));
              {$ENDIF}
              {Stm1 := TMemoryStream.Create;
              try
                try
                  e1.Write(PByte(dimage.Data)^, dimage.Len);
                  e1.CompressedDataStream.SaveToStream(stm1);

                  if ANeedLen then
                  begin
                    l1 := stm1.Size;
                    if (l1 mod 2) <> 0 then
                      inc(l1);
                    f1.WriteInt32(l1);
                  end;
                  //  f1.WriteInt32(e1.CompressedDataStream.Size);

                  result := f1.write(stm1.Memory^, stm1.Size);
                  if (stm1.Size mod 2) <> 0 then
                  begin
                    f1.WriteInt8(0);
                    Result := Result + 1;
                  end;
                  if f1.KeepImageDataInStream then
                  begin
                    dimage.FImageLenInStream := stm1.Size;
                    dimage.FTransferSyntax := f1.TransferSyntax;
                  end;

                except
                  on e: Exception do
                  begin
                    raise Exception.Create('Save To ZIP Stream error:' + e.Message);
                  end;
                end;
              finally
                e1.Free;
                stm1.Free;
              end; }
            end;
          {$ENDIF}
          RLELossless:
            begin
              GetSourceData;
              Stm1 := TMemoryStream.Create;
              try
                FastRLEEncodeBytes(PointerNeedToFree, compressImageLength, d1.FWidth, d1.FHeight,
                  d1.FBits,
                  d1.FSamplePerPixel, d1.PlanarConfiguration, stm1);

                if ANeedLen then
                begin
                  l1 := stm1.Size;
                  if (l1 mod 2) <> 0 then
                    inc(l1);
                  f1.WriteInt32(l1);
                end;
                //f1.WriteInt32(stm1.Size);
                result := f1.write(stm1.Memory^, stm1.Size);

                if (stm1.Size mod 2) <> 0 then
                begin
                  f1.WriteInt8(0);
                  Result := Result + 1;
                end;

                if f1.KeepImageDataInStream then
                begin
                  dimage.FImageLenInStream := stm1.Size;
                  dimage.FTransferSyntax := f1.TransferSyntax;
                end;

              finally
                stm1.Free;
                FreeConvertData;
              end;
            end;
          {$IFDEF NEEDJPEG2000}
          JPEGLossless80, JPEGNearLossless81:
            begin
              raise Exception.Create('it Not Finish JPEGLossless80/81');
            end;
          JPEG2000Irreversible, JPEG2000Reversible:
            begin
              Stm1 := TMemoryStream.Create;
              GetSourceData;
              try
                photometric := Getphotometric(FParent.GetString($28, $4));
                {$IFNDEF NEEDPERJPEG2000}
                if f1.TransferSyntax = JPEG2000Irreversible then //.90 lossless
                  encodeJPEG2000_openjpeg(@stm1, PointerNeedToFree, 100,
                    d1.FWidth, d1.FHeight, d1.FSamplePerPixel, d1.FUseBits, photometric,
                    FParent.getInteger($28, $103))
                else
                  encodeJPEG2000_openjpeg(@stm1, PointerNeedToFree, 90,
                    d1.FWidth, d1.FHeight, d1.FSamplePerPixel, d1.FUseBits, photometric,
                    FParent.getInteger($28, $103));
                {$ELSE}
                if f1.TransferSyntax = JPEG2000Irreversible then //.90 lossless
                  encodeJPEG2000(@stm1, PointerNeedToFree, 100,
                    d1.FWidth, d1.FHeight, d1.FSamplePerPixel, d1.FUseBits, photometric,
                    FParent.getInteger($28, $103))
                else
                  encodeJPEG2000(@stm1, PointerNeedToFree, 90,
                    d1.FWidth, d1.FHeight, d1.FSamplePerPixel, d1.FUseBits, photometric,
                    FParent.getInteger($28, $103));
                {$ENDIF}
                if ANeedLen then
                begin
                  l1 := stm1.Size;
                  if (l1 mod 2) <> 0 then
                    inc(l1);
                  f1.WriteInt32(l1);
                end;
                //f1.WriteInt32(stm1.Size);
                result := f1.write(stm1.Memory^, stm1.Size);

                if (stm1.Size mod 2) <> 0 then
                begin
                  f1.WriteInt8(0);
                  Result := Result + 1;
                end;

                if f1.KeepImageDataInStream then
                begin
                  dimage.FImageLenInStream := stm1.Size;
                  dimage.FTransferSyntax := f1.TransferSyntax;
                end;

              finally
                stm1.Free;
                FreeConvertData;
              end;
            end;
          {$ENDIF}
          JPEGLossless14, JPEGLossless15,
            JPEGBaseline, // = 8196;
          JPEGExtendedProcess_2_4, // = 8199;
          JPEGLossless: // = 8197;
            begin
              //dimage.
              photometric := Getphotometric(FParent.GetString($28, $4));
              if F1.TransferSyntax = JPEGBaseline then
                compressionSyntax := compressionSyntaxJPEGBaselineTransferSyntax
              else
                if F1.TransferSyntax = JPEGExtendedProcess_2_4 then
                compressionSyntax := compressionSyntaxJPEGExtendedTransferSyntax
              else
                if (F1.TransferSyntax = JPEGLossless14) or
                (F1.TransferSyntax = JPEGLossless15) or
                (F1.TransferSyntax = JPEGLossless) then
                compressionSyntax := compressionSyntaxJPEGLosslessTransferSyntax;
              GetSourceData;
              Stm1 := TMemoryStream.Create;
              try
                //compressJPEG12
                //compressJPEG8
                if d1.FBits > 8 then
                  compressJPEG12(@stm1, PointerNeedToFree,
                    photometric,
                    compressionSyntax,
                    f1.JpegQuality, d1.FWidth, d1.FHeight, d1.FSamplePerPixel)
                else
                begin
                  compressJPEG8(@stm1, PointerNeedToFree,
                    photometric,
                    compressionSyntax,
                    f1.JpegQuality, d1.FWidth, d1.FHeight, d1.FSamplePerPixel); // }
                end;
                if ANeedLen then
                begin
                  l1 := stm1.Size;
                  if (l1 mod 2) <> 0 then
                    inc(l1);
                  f1.WriteInt32(l1);
                end;
                //f1.WriteInt32(stm1.Size);
                result := f1.write(stm1.Memory^, stm1.Size);

                if (stm1.Size mod 2) <> 0 then
                begin
                  f1.WriteInt8(0);
                  Result := Result + 1;
                end;

                if f1.KeepImageDataInStream then
                begin
                  dimage.FImageLenInStream := stm1.Size;
                  dimage.FTransferSyntax := f1.TransferSyntax;
                end;

              finally
                stm1.Free;
                FreeConvertData;
              end;
            end
        else
          begin

          end;
        end;
      end; //decompress and write
    end;
    if f1.KeepImageDataInStream then
      dimage.FTransferSyntax := f1.TransferSyntax;

  end
  else
    if (fgroup = $2809) and (felement = $1001) then
  begin
    o1 := TOBStream(FDataArray[AIndex]);
    if o1.Size > 0 then
    begin
      {      e1 := TECLMemoryStream.Create('', zlibFastest);

            Stm1 := TMemoryStream.Create;
            try
              e1.Write(o1.Memory^, o1.Size);

              if ANeedLen then
                f1.WriteInt32(e1.CompressedDataStream.Size);
              e1.CompressedDataStream.SaveToStream(stm1);
              result := f1.write(stm1.Memory^, stm1.Size);
            finally
              e1.Free;
              stm1.Free;
            end; }
      if ANeedLen then
      begin
        l1 := o1.Size;
        if (l1 mod 2) <> 0 then
          inc(l1);
        f1.WriteInt32(l1);
      end;
      //f1.WriteInt32(o1.Size);
      result := f1.write(o1.Memory^, o1.Size);

      if (o1.Size mod 2) <> 0 then
      begin
        f1.WriteInt8(0);
        Result := Result + 1;
      end;
    end;
  end
  else
  begin
    o1 := TOBStream(FDataArray[AIndex]);
    if o1.Size > 0 then
    begin
      if (Dcm_Type = tOW) and (f1.TransferSyntax = ExplicitVRBigEndian) then
      begin
        {  DicomUtils.a(abyte1);}
        if ANeedLen then
        begin
          l1 := o1.Size;
          if (l1 mod 2) <> 0 then
            inc(l1);
          f1.WriteInt32(l1);
        end;
        //f1.WriteInt32(o1.Size);
        result := f1.write(o1.Memory^, o1.Size);

        if (o1.Size mod 2) <> 0 then
        begin
          f1.WriteInt8(0);
          Result := Result + 1;
        end;
      end
      else
      begin
        if ANeedLen then
        begin
          l1 := o1.Size;
          if (l1 mod 2) <> 0 then
            inc(l1);
          f1.WriteInt32(l1);
        end;
        //  f1.WriteInt32(o1.Size);
        result := f1.write(o1.Memory^, o1.Size);

        if (o1.Size mod 2) <> 0 then
        begin
          f1.WriteInt8(0);
          Result := Result + 1;
        end;
      end; //end of if((l = 24) and (F_a() = 8195))
    end;
  end;
end;

function TDicomAttribute._WriteStringArray(f1: TDicomStream): Integer;
var
  i1: Integer;
  j1: Integer;
  s: AnsiString;
  b1: Byte;
begin
  i1 := 0;
  j1 := 0;
  while j1 < FDataArray.Count do
  begin
    s := GetDataArrayAsString(j1);
    if Length(s) > 0 then
      i1 := i1 + f1.WriteString(s);
    if j1 <> FDataArray.Count - 1 then
    begin
      if dcm_type = tDA then
        b1 := ord('-')
      else
        b1 := 92;
      f1.write(b1, 1);
      Inc(i1);
    end; //end of if(j1 <> vector.size()-1)
    Inc(j1);
  end; //end of while(j1<vector.size()):
  result := i1;
end;

function TDicomAttribute.GetDataArrayAsString(AIndex: Integer): Ansistring;
begin
  case Dcm_Type of
    2, 4, 6, 7, 9, 13, 18, 27, 17:
      begin
        result := StrPas(PAnsiChar(FDataArray[AIndex]));
      end;
    tDS:
      begin
        result := FloatToDicomStr(PDouble(FDataArray[AIndex])^); //(TFloat(obj)).toString();
      end;
    tIS:
      begin
        result := IntToStr(PInteger(FDataArray[AIndex])^); //(TInteger(obj)).toString();
      end;
    14:
      begin
        //      result := (TPerson(obj)).a('^');
        result := StrPas(PAnsiChar(FDataArray[AIndex]));
      end;
    tDA:
      begin
        result := DateToDicomStr(PDatetime(FDataArray[AIndex])^); //(TDDate(obj)).toDICOMString();
      end;
    tDT:
      begin
        result := DatetimeToDicomStr(PDatetime(FDataArray[AIndex])^);
        //(TDDateTime(obj)).toDICOMString();
      end;
    tTM:
      begin
        result := TimeToDicomStr(PDatetime(FDataArray[AIndex])^); //(TDTime(obj)).toDICOMString();
      end;
    //    tUNKNOWN:
    //      begin
    //        result := IntToStr(PShortInt(FDataArray[AIndex])^); //AnsiString.Create(ShortInt(obj));
    //      end
    //  1,3,5,8,10,17,19,20,21,22,23,24,25,26
  else
    begin
      result := StrPas(PAnsiChar(FDataArray[AIndex]));
    end;
  end; //end of case
end;

function TDicomAttribute._WriteData(f1: TDicomStream): Integer;
var
  i1: Integer;
  j1: Integer;
  b1: Byte;
begin
  i1 := GetDicomTypeLength(Dcm_Type);
  j1 := 0;
  if i1 <> 0 then
  begin
    result := _WriteElements(f1);
  end
  else
  begin
    case Dcm_Type of
      tOB, tOW, tOW_OB, tUNKNOWN:
        begin
          if (fgroup = 32736) and (felement = 16) then
          begin
            f1.Position := f1.Position - 4;
            j1 := j1 + _WriteOB_OW(f1, 0, true); //jiawen ?
          end
          else
            j1 := j1 + _WriteOB_OW(f1, 0, false);
        end;
    else
      begin
        j1 := j1 + _WriteStringArray(f1);
      end;
    end; //end of case
    if j1 mod 2 = 1 then
    begin
      case Dcm_Type of
        2, 8, 22, 24, tUNKNOWN:
          begin
            b1 := 0;
          end
      else
        b1 := 32;
      end; //end of case
      f1.write(b1, 1);
      Inc(j1);
    end; //end of if(j1*2 = 1)
    result := j1;
  end;
end;

function TDicomAttribute._WriteElements(f1: TDicomStream): Integer;
var
  i1: Integer;
  j1: Integer;
begin
  i1 := 0;
  j1 := 0;
  while j1 < FDataArray.Count do
  begin
    i1 := i1 + _WriteElement(f1, j1);
    Inc(j1);
  end; //end of while(j1<vector.size()):
  result := i1;
end;

function TDicomAttribute._WriteElement(f1: TDicomStream; Aindex: Integer): Integer;
begin
  case Dcm_Type of
    tAS:
      result := _WriteString(f1, Aindex);
    tAT:
      result := _WriteAT(f1, Aindex);
    tFL:
      result := _WriteFloat(f1, Aindex);
    tFD:
      result := _WriteDouble(f1, Aindex);
    tSL, tUL:
      result := _WriteLong(f1, Aindex);
    tSS:
      result := _WriteShort(f1, Aindex);
    tUS, tUS_SS:
      result := _WriteInteger(f1, Aindex)
        //  2, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 22, 24, 25,
  else
    begin
      result := 0;
    end;
  end; //end of case
end;

procedure TDicomAttribute.writeVRData(j: TDicomStream);
begin
  if FDataArray.Count <= 0 then
  begin
    //update 2009-11-29
    //if (dcm_type = tSQ) and (not j.UndefineSQLength) then
    if (dcm_type = tSQ) then  // tSH
    begin
      j.WriteInt16(65534);
      j.WriteInt16(57344);

      j.WriteInt32(0);
    end;
    //end of update
    //do notthing
  end
  else
    if dcm_type = tSQ then
  begin
    _WriteSQ(j);
  end
  else {//end of if(dcm_type = 10)}
    if ((dcm_type = tOW) or (dcm_type = tOB) or (dcm_type = tOW_OB))
    and ((FDataArray.Count > 1) or (((fgroup = 32736) and (felement = 16)) and (j.TransferSyntax <>
    ImplicitVRLittleEndian) and
    (j.TransferSyntax <> ExplicitVRLittleEndian) and
    (j.TransferSyntax <> ExplicitVRBigEndian)))
    then
    begin
      _WriteSQofOB_OW(j);
    end
    else //end of if(((((dcm_type = 24) or (dcm_type = 8)) or (dcm_type = 22))) and (val.size()>1))
      _WriteData(j);
end;

function TDicomAttribute.writeVRHeaderWithLength(k1: TDicomStream; ALen: integer): Integer;
var
  j: Integer;
  l: Integer;
  s: AnsiString;
begin
  j := k1.TransferSyntax;
  k1.WriteInt16(group);
  k1.WriteInt16(element);
  if group = 2 then
  begin
    j := ExplicitVRLittleEndian;
  end; //end of if(group = 2)

  if FDataArray.Count <= 0 then
  begin
    //update 2009-11-29
    if (dcm_type = tSQ) then
      l := 8
    else
      //end of update
      l := 0;
  end
  else
  begin
    if k1.UseUndefineLength then
    begin
      if (dcm_type = tSQ) then
      begin
        l := -1;
      end
      else
        l := ALen;
    end
    else
      l := ALen;
  end;

  if ((dcm_type = tOW) or (dcm_type = tOB) or (dcm_type = tOW_OB))
    and (FDataArray.Count > 1) then
  begin
    dcm_type := tOB;
    l := -1;
  end;

  Result := l;

  if j = ImplicitVRLittleEndian then
  begin
    k1.WriteInt32(l);
  end
  else
  begin
    s := DicomTypeArray[dcm_type];
    k1.WriteString(copy(s, 1, 2));
    case dcm_type of
      0, 8, 10, 22, 24, 27:
        begin
          k1.WriteInt16(0);
          k1.WriteInt32(l);
        end;
    else
      begin
        k1.WriteInt16(l);
      end;
    end; //end of case
  end; //end of if(j = 8193)
end;

function TDicomAttribute.writeVRHeader(k1: TDicomStream): Integer;
var
  j: Integer;
  l: Integer;
  s: AnsiString;
begin
  j := k1.TransferSyntax;
  k1.WriteInt16(group);
  k1.WriteInt16(element);
  if group = 2 then
  begin
    j := ExplicitVRLittleEndian;
  end; //end of if(group = 2)

  if FDataArray.Count <= 0 then
  begin
    //update 2009-11-29
    //if (dcm_type = tSQ) and (not k1.UndefineSQLength) then
    if (dcm_type = tSQ) then
    begin
      l := 8;
    end
    else
      //end of update
      l := 0;
  end
  else
  begin
    if k1.UseUndefineLength then
    begin
      if (dcm_type = tSQ) then
      begin
        l := -1;
      end
      else
        l := GetDataLen(k1.TransferSyntax);
    end
    else
      l := GetDataLen(k1.TransferSyntax);
  end;

  if ((dcm_type = tOW) or (dcm_type = tOB) or (dcm_type = tOW_OB))
    and (FDataArray.Count > 1) then
  begin
    dcm_type := tOB;
    l := -1;
  end;

  Result := l;

  if j = ImplicitVRLittleEndian then
  begin
    k1.WriteInt32(l);
  end
  else
  begin
    s := DicomTypeArray[dcm_type];
    {if element = 0 then
    begin
      s := 'UL';
    end;}
    k1.WriteString(copy(s, 1, 2));
    case dcm_type of
      0, 8, 10, 22, 24, 27:
        begin
          k1.WriteInt16(0);
          k1.WriteInt32(l);
        end;
    else
      begin
        k1.WriteInt16(l);
      end;
    end; //end of case
  end; //end of if(j = 8193)
end;

function TDicomAttribute.GetAsImage(Aindex: Integer): TDicomImageData;
begin
  if (FDataType = ddtImage) and (AIndex < FDataArray.Count) then
    Result := TDicomImageData(FDataArray[AIndex])
  else
    Result := nil;
end;

function TDicomAttribute.GetAttributes(AIndex: Integer): TDicomAttributes;
begin
  if (FDataType = ddtAttributes) and (AIndex < FDataArray.Count) then
    Result := TDicomAttributes(FDataArray[AIndex])
  else
    Result := nil;
end;

function TDicomAttribute.GetCount: integer;
begin
  try
    if ((Self=nil) or (not Assigned(FDataArray))) then  //
    begin
      Result := 0;
    end else
    begin
      Result := FDataArray.Count;
    end;
  except
    Result := 0;
  end;
end;

function TDicomAttribute.GetAsFloat(AIndex: Integer): Double;
begin
  if (FDataArray.Count > 0) and (AIndex < FDataArray.Count) then
  begin
    case FDataType of //
      ddtInteger: Result := PInteger(FDataArray[AIndex])^;
      ddtSingle: Result := PSingle(FDataArray[AIndex])^;
      ddtDouble: Result := PDouble(FDataArray[AIndex])^;
      ddtShortInt: Result := PShortInt(FDataArray[AIndex])^;
      ddtString:
        begin
          try
            Result := DicomStrToFloat(StrPas(PAnsiChar(FDataArray[AIndex])));
          except
            Result := 0;
          end;
        end;
    else
      Result := 0;
    end; // case
  end
  else
    Result := 0;
end;

procedure TDicomAttribute.SetAsFloat(AIndex: Integer; AValue: Double);
var
  str1: AnsiString;
  p1: PAnsiChar;
begin
  AddNewData(AIndex);
  if (FDataArray.Count > 0) and (AIndex < FDataArray.Count) then
  begin
    case FDataType of //
      ddtInteger: PInteger(FDataArray[AIndex])^ := trunc(AValue);
      ddtSingle: PSingle(FDataArray[AIndex])^ := AValue;
      ddtDouble: PDouble(FDataArray[AIndex])^ := AValue;
      ddtShortInt: PShortInt(FDataArray[AIndex])^ := trunc(AValue);
      ddtString:
        begin
          str1 := FloatToDicomStr(AValue);
          GetMem(p1, Length(str1) + 1);
          StrCopy(p1, PAnsiChar(str1));
          FDataArray[AIndex] := p1;
        end
    else
      raise Exception.Create('Float can not assign to the tag');
    end; // case
  end;
end;

function TDicomAttribute.GetAsInteger(AIndex: Integer): Integer;
begin
  if (FDataArray.Count > 0) and (AIndex < FDataArray.Count) then
  begin
    case FDataType of //
      ddtInteger: Result := (PInteger(FDataArray[AIndex])^);
      ddtSingle: Result := trunc(PSingle(FDataArray[AIndex])^);
      ddtDouble: Result := trunc(PDouble(FDataArray[AIndex])^);
      ddtShortInt: Result := (PShortInt(FDataArray[AIndex])^);
      ddtString:
        begin
          try
            Result := StrToInt(Trim(StrPas(PAnsiChar(FDataArray[AIndex]))));
          except
            Result := 0;
          end;
        end;
    else
      Result := 0;
    end; // case
  end
  else
    Result := 0;
end;

procedure TDicomAttribute.SetAsInteger(AIndex: Integer; AValue: Integer);
var
  str1: AnsiString;
  p1: PAnsiChar;
begin
  AddNewData(AIndex);
  if (FDataArray.Count > 0) and (AIndex < FDataArray.Count) then
  begin
    case FDataType of //
      ddtInteger: PInteger(FDataArray[AIndex])^ := AValue;
      ddtSingle: PSingle(FDataArray[AIndex])^ := AValue;
      ddtDouble: PDouble(FDataArray[AIndex])^ := AValue;
      ddtShortInt: PShortInt(FDataArray[AIndex])^ := AValue;
      ddtString:
        begin
          p1 := FDataArray[AIndex];
          Freemem(p1);
          str1 := IntToStr(AValue);
          GetMem(p1, Length(str1) + 1);
          StrCopy(p1, PAnsiChar(str1));
          FDataArray[AIndex] := p1;
        end
    else
      raise Exception.Create('Integer can not assign to the tag==>' + IntToHex(FGroup, 4) + ':' +
        IntToHex(FElement, 4));
    end; // case
  end;
end;

function TDicomAttribute.GetAsDatetime(AIndex: Integer): TDatetime;
begin
  if (FDataArray.Count > 0) and (AIndex < FDataArray.Count) then
  begin
    case FDataType of //
      ddtDatetime: Result := PDatetime(FDataArray[AIndex])^;
      ddtTime: Result := PDatetime(FDataArray[AIndex])^;
    else
      Result := 0;
    end; // case
  end
  else
    Result := 0;
end;

procedure TDicomAttribute.SetAsDatetime(AIndex: Integer; AValue: TDatetime);
begin
  AddNewData(AIndex);
  if (FDataArray.Count > 0) and (AIndex < FDataArray.Count) then
  begin
    case FDataType of //
      ddtDatetime,
        ddtTime: PDatetime(FDataArray[AIndex])^ := AValue;
    else
      raise Exception.Create('Datetime can not assign to the tag');
    end; // case
  end
end;

function TDicomAttribute.GetAsChineseString(AIndex: Integer): AnsiString;
  procedure ProcessChineseChar;
  var
    i: Integer;
    str1: AnsiString;
  begin
    if (Length(Result) > 0) and (Pos(chr($1B), Result) > 0) then
    begin
      Str1 := '';
      i := 1;
      while i <= Length(Result) do
      begin
        if Result[i] = chr($1B) then
        begin
          if (Result[i] = '$') {and (Result[i] = chr($29)) and (Result[i] = chr($49))} then
          begin
            inc(i, 4);
            while i <= Length(Result) do
            begin
              if Result[i] = chr($1B) then
                break
              else
              begin
                Str1 := Str1 + Chr(Ord(Result[i]) and $80);
                inc(i);
              end;
            end;
          end
          else
          begin
            inc(i, 4);
          end;
        end
        else
        begin
          Str1 := Str1 + Result[i];
          inc(i);
        end;
      end;
      if Str1 <> '' then
        Result := str1;
    end;
  end;
begin
  Result := GetAsString(AIndex);
  ProcessChineseChar;
end;

procedure TDicomAttribute.SetAsChineseString(AIndex: Integer; AValue: AnsiString);
  function DoprocessChineseChar: AnsiString;
  var
    i: integer;
  begin
    if (Length(AValue) <= 0) then
      Result := AValue
    else
    begin
      Result := '';
      i := 1;
      while i <= Length(AValue) do
      begin
        if (ord(AValue[i]) and $80) <> 0 then
        begin
          Result := Result + chr($1B) + chr($24) + chr($29) + chr($49);
          while i <= Length(AValue) do
          begin
            if (ord(AValue[i]) and $80) <> 0 then
            begin
              Result := Result + chr(ord(AValue[i]) and $7F);
              inc(i);
            end
            else
              break;
          end;
        end
        else
        begin
          Result := Result + AValue[i];
          inc(i);
        end;
      end;
    end;
  end;
begin
  SetAsString(AIndex, DoprocessChineseChar);
end;

procedure TDicomAttribute.SetAsString(AIndex: Integer; AValue: AnsiString);
var
  p1: PAnsiChar;
begin
  AddNewData(AIndex);
  if (FDataArray.Count > 0) and (AIndex < FDataArray.Count) then
  begin
    case FDataType of //
      ddtString:
        begin
          p1 := FDataArray[AIndex];
          FreeMem(p1);
          if Length(AValue) > 0 then
          begin
            GetMem(p1, Length(AValue) + 1);
            StrCopy(p1, PAnsiChar(AValue));
            FDataArray[AIndex] := p1;
          end
          else
          begin
            FDataArray.Delete(AIndex);
          end;
        end;
      ddtInteger:
        if (AValue <> '') then
          PInteger(FDataArray[AIndex])^ := StrToInt(AValue);
      ddtSingle:
        if (AValue <> '') then
          PSingle(FDataArray[AIndex])^ := DicomStrToFloat(AValue);
      ddtDouble:
        if (AValue <> '') then
          PDouble(FDataArray[AIndex])^ := DicomStrToFloat(AValue);
      ddtShortInt:
        if (AValue <> '') then
          PShortInt(FDataArray[AIndex])^ := StrToInt(AValue);
      ddtDatetime:
        if (AValue <> '') then
          PDatetime(FDataArray[AIndex])^ := StrToDatetime(AValue);
      ddtTime:
        if (AValue <> '') then
          PDatetime(FDataArray[AIndex])^ := StrToTime(AValue);
    else
      raise Exception.Create('AnsiString can not assign to the tag');
    end; // case
  end
end;

function TDicomAttribute.GetText: AnsiString;
begin
  Result := IntToStr(ID) + '[' + IntToHex(FGroup, 4) + ':' + IntToHex(FElement, 4) + ']' +
    '(' + Description + ')' + VR + '=<' + IntToStr(FDataArray.Count) + '>' + GetAsStrings;
end;

function TDicomAttribute.readVRHeader(h1: TDicomStream; var datalen: Integer): Boolean;
var
  j: Integer;
  s: AnsiString;
  l: Integer;
begin
  result := FALSE;
  j := h1.TransferSyntax;
  Fgroup := h1.ReadInt16;
  Felement := h1.ReadInt16;
  //  if (felement = 0) and (Fgroup = 0) then
  //    exit;

  FDict := DDict.ItemByGroupElement[FGroup shl 16 + FElement];

  {  if group = 2 then
    begin
      j := ExplicitVRLittleEndian;
    end; //end of if(group = 2)
  }
  if element = 0 then
  begin
    dcm_type := 1;
  end
  else
  begin
    if assigned(FDict) then
      dcm_type := FDict.DicomType
    else
      dcm_type := 0;
  end; //end of if(element = 0)

  if j = ImplicitVRLittleEndian then
  begin
    dataLen := h1.ReadInt32;
  end
  else
  begin
    s := h1.ReadString(2);
    //    if not assigned(FDict) then
    if (group <> 65534) and (element <> 57357) then
    begin
      //      if dcm_type <> tDS then
//      if dcm_type = 0 then
        //      IF S<>'' then
      // FOMIN 09.01.2013 - добавлены параметры группа и элемент
      dcm_type := FindDicomType(s);

      //      else
//        dcm_type1 := dcm_type;
      //      else
      //        dcm_type1 := dcm_type;
    end
    else
      dcm_type := dcm_type;

    if (FDict = UnknowEntry) and (Felement <> 0) then
      // FOMIN 09.01.2013 - добавлены параметры группа и элемент
      dcm_type := FindDicomType(s);

    Setlength(s, 0);
    case dcm_type of
      0, 8, 10, 24, 27:
        begin
          h1.skipBytes(2);
          dataLen := h1.ReadInt32;
        end;
    else
      begin
        dataLen := h1.ReadInt16;
      end;
    end; //end of case

    //for compi with old
    if assigned(FDict) and (dcm_type = tUNKNOWN) then
      dcm_type := FDict.DicomType;

  end; //end of if(j = 8193)
  l := GetDicomTypeLength(dcm_type);
  if (l <> 0) and ((dataLen mod l) <> 0) then
  begin
    h1.skipBytes(dataLen);
    {    ShowMessage('Data element: (' + IntToHex(fgroup, 4) + ',' + IntToHex(felement, 4) +
          '): ' + FDict.Description +
          ' has an invalid length (' + IntToStr(dataLen) + ')'#10'    Skipping...');}
  end
  else
  begin
    result := TRUE;
  end; //end of if((l <> 0) and (dataLen*l <> 0))
end;

function TDicomAttribute.readVRData(f1: TDicomStream; const datalen: integer): Boolean;
var
  t1: TDicomLoadFrameThread;
begin
  {$IFDEF DICOMDEBUG}
  // SendDebug('read(' +      IntToHex(FGroup, 4) + ',' + IntToHex(FElement, 4) + ')');
  {$ENDIF}
  //  f1 := f1;
  if dataLen = 0 then
  begin
    result := true;
    exit;
  end; //end of if(dataLen = 0)
  if dataLen = -1 then
  begin
    if ((dcm_type = tOW) or (dcm_type = tOB)) or (dcm_type = tOW_OB) then
    begin
      if (f1.LoadFrameInThread) and (fgroup = 32736) and (felement = 16) and (f1.Stream is
        TFileStream) then
      begin
        t1 := TDicomLoadFrameThread.Create(false);
        t1.FreeOnTerminate := True;
        t1.LoadFrames(self, f1);
        //while FDataArray.Count <= 1 do
        //  ProcessWindowsMessageQueue;
      end
      else
      begin
        try
          ReadSQofOB_OW(f1);
        except
          on e: Exception do
            raise Exception.Create('ReadSQofOB_OW:' + e.Message + ', when read(' +
              IntToHex(FGroup, 4) + ',' + IntToHex(FElement, 4) + ')');
        end;
      end;
      result := FDataArray.Count > 0;
      exit;
    end;
    dcm_type := tSQ;
  end;
  if dcm_type = tSQ then
  begin
    if (datalen + f1.Position) >= f1.Size then
      ReadSQ(f1, -1)
    else
      ReadSQ(f1, datalen);
    Result := true;
    exit;
  end; //end of if(dcm_type = 10)

  try
    ReadData(f1, datalen);
  except
    on e: Exception do
    begin
      raise Exception.Create('Read Data Error:' + e.Message + ', when read(' +
        IntToHex(FGroup, 4) + ',' + IntToHex(FElement, 4) + ')');
    end
  end;
  result := TRUE;
end; //end of readVRData(f1:Tf)

procedure TDicomAttribute.ReadSQ(f1: TDicomStream; datalen: Integer);
var
  l1: Int64;
  j: Integer;
  i1: Integer;
  dicomobject: TDicomAttributes;
  flag: Boolean;
  l: Integer;
  j1: Integer;
begin
  if dataLen <> -1 then
  begin
    l1 := f1.Position + Int64(dataLen);

    while f1.Position < l1 do
    begin
      j := f1.ReadInt16;
      i1 := f1.ReadInt16;
      if (j = 65534) and (i1 = 57344) then
      begin
        dicomobject := ReadDatasets(f1);
        if dicomobject.Count > 0 then
          FDataArray.Add(dicomobject)
        else
        begin
          dicomobject.Free;
        end;
        FDataType := ddtAttributes;
      end; //end of if((j = 65534) and (i1 = 57344))
    end; //end of while(f1.getOffset() <> l1)
  end
  else
  begin
    flag := FALSE;

    while not flag do
    begin
      l := f1.ReadInt16;
      j1 := f1.ReadInt16;
      if (l = $FFFE) and (j1 = 57344) then
      begin
        dicomobject := ReadDatasets(f1);
        if dicomobject.Count > 0 then
          FDataArray.Add(dicomobject)
        else
        begin
          dicomobject.Free;
        end;
        FDataType := ddtAttributes;
      end
      else
      begin
        if (l = $FFFE) and (j1 = 57565) then
        begin
          f1.skipBytes(4);
          flag := TRUE;
        end
        else
        begin
          flag := TRUE;
          //          raise Exception.Create('Unexpected tag read: (' + IntToHex(l, 4) +
          //            ',' + IntToHex(j1, 4) + ') at offset ' + IntToStr(f1.Position));
        end; //end of if((l = 65534) and (j1 = 57565))
      end; //end of if((l = 65534) and (j1 = 57344))
    end; //end of while( not flag)
  end; //end of if(dataLen <> -1)
end;

function TDicomAttribute.ReadDatasets(f1: TDicomStream): TDicomAttributes;
var
  l: Int64;
  l1: Int64;
  k: Integer;
  vr: TDicomAttribute;
  flag: Boolean;
  vr1: TDicomAttribute;
begin
  Result := TDicomAttributes.Create;
  //  Result.OnReadAttribute := DoNewAttribute;
  l := f1.ReadInt32;
  if (l <> -1) then
  begin
    l1 := f1.Position + l;
    while f1.Position < (l1) do
    begin
      vr := TDicomAttribute.Create(Result);
      if (vr.readVRHeader(f1, k)) then
      begin
        if f1.Position > l1 then
        begin
          vr.Free;
          break;
        end
        else
          if (vr.group = $FFFE) and (vr.element = $E00D) then
        begin
          vr.Free;
          break;
        end
        else
          if (vr.readVRData(f1, k)) then
        begin
          //if assigned(fOnReadAttribute) then
          //  fOnReadAttribute(self,da1,f1.Position);
          Result.Add(vr);
        end
        else
          vr.Free;
      end //end of if((vr.readVRHeader(f1)) and (vr.readVRData(f1)))
      else
        vr.Free;
    end; //end of while(f1.getOffset() <> l1):
  end
  else
  begin
    flag := FALSE;
    while not flag do
    begin
      vr1 := TDicomAttribute.Create(Result);
      if vr1.readVRHeader(f1, k) then
      begin
        if (vr1.group = $FFFE) and (vr1.element = $E00D) then
        begin
          flag := TRUE;
          vr1.Free;
        end
        else
        begin
          if vr1.readVRData(f1, k) then
          begin
            //if assigned(fOnReadAttribute) then
            //  fOnReadAttribute(self,da1,f1.Position);
            Result.Add(vr1);
          end
          else
            vr1.Free;
        end;
      end
      else
        vr1.Free;
    end;
  end;
end;

procedure TDicomAttribute.ReadSQofOB_OW(f1: TDicomStream);
var
  j: Integer;
  l: Integer;
  i1: Integer;
begin
  //  dataLen := 0;
  repeat
    if (f1.Position >= f1.Size) then
      exit;
    j := f1.ReadInt16;
    l := f1.ReadInt16;
    //    dataLen := dataLen + 4;
    if (j = $FFFE) and (l = $E0DD) then
    begin
      f1.skipBytes(4);
      //      dataLen := dataLen + 4;
      exit;
    end; //end of if((j = 65534) and (l = 57565))
    if (j = $FFFE) and (l = $E000) then
    begin
      i1 := f1.ReadInt32;
      //      dataLen := dataLen + 4;

      ReadOB_OW(f1, i1);
      //      dataLen := dataLen + i1;
    end
    else
    begin
      exit;
      //      raise Exception.Create('Unexpected tag encountered: (' +
      //        IntToHex(j, 4) + ',' + IntToHex(l, 4) + ').');
    end; //end of if((j = 65534) and (l = 57344))
  until false;
end;

procedure TDicomAttribute.ReadSQofOB_OWForThread(f1: TDicomStream);
var
  j: Integer;
  l: Integer;
  i1: Integer;
begin
  //  dataLen := 0;
  repeat
    if (f1.Position >= f1.Size) then
      exit;
    j := f1.ReadInt16;
    l := f1.ReadInt16;
    //    dataLen := dataLen + 4;
    if (j = $FFFE) and (l = $E0DD) then
    begin
      f1.skipBytes(4);
      //      dataLen := dataLen + 4;
      exit;
    end; //end of if((j = 65534) and (l = 57565))
    if (j = $FFFE) and (l = $E000) then
    begin
      i1 := f1.ReadInt32;
      //      dataLen := dataLen + 4;

      ReadOB_OWForThread(f1, i1);
      //      dataLen := dataLen + i1;
    end
    else
    begin
      exit;
      //      raise Exception.Create('Unexpected tag encountered: (' +
      //        IntToHex(j, 4) + ',' + IntToHex(l, 4) + ').');
    end; //end of if((j = 65534) and (l = 57344))
  until false;
end;

function TDicomAttribute.GetVM: AnsiString;
begin
  Result := FDict.VM;
end;

function TDicomAttribute.GetVR: AnsiString;
begin
  Result := DicomTypeArray[dcm_type]; //FDict.getVR;
end;

function TDicomAttribute.GetAsString(AIndex: Integer): AnsiString;
  function GetDataItemAsString(p1: PAnsiChar): AnsiString;
  var
    f1: Double;
  begin
    if assigned(p1) then
    begin
      case FDataType of //
        ddtString:
          begin
            Result := StrPas(p1);
            if (self.dcm_type = tDS) then
            begin
              f1 := StrToFloat(Result);
              Result := Trim(FormatFloat('###,###.00', f1));
            end;
            //            ProcessChineseChar;
                        //           Result := '('+IntToStr(Length(Result))+')'+Result;
          end;
        ddtInteger: Result := IntToStr(PInteger(p1)^);
        ddtSingle:
          begin
            //Result := FloatToDicomStr(PSingle(p1)^);
            Result := Trim(FormatFloat('###,###.00', PSingle(p1)^));
          end;
        ddtDouble:
          begin
            //Result := FloatToDicomStr(PDouble(p1)^);
            Result := Trim(FormatFloat('###,###.00', PDouble(p1)^));
          end;
        ddtShortInt: Result := IntToStr(PShortInt(p1)^);
        ddtDatetime: Result := DateToStr(PDatetime(p1)^);
        ddtTime: Result := timeToStr(PDatetime(p1)^);
        //        7: Result := 'TDicomAttributes';
      end; // case
    end
    else
      Result := '';
  end;
begin
  if (FDataArray.Count > 0) and (AIndex < FDataArray.Count) then
  begin
    if FDataType = ddtImage then //(FGroup = 32736) and (FElement = 16) then
    begin
      Result := 'Pixel Data ' + IntToStr(TDicomImageData(FDataArray[AIndex]).Len) + 'Byte';
    end
    else
      if FDataType = ddtOBStream then //(FGroup = 32736) and (FElement = 16) then
    begin
      Result := 'OB/OW Data ' + IntToStr(TOBStream(FDataArray[AIndex]).Size) + 'Byte';
    end
    else
      if FDataType = ddtAttributes then
    begin
      Result := 'Sequence Data';
    end
    else
    begin
      Result := GetDataItemAsString(FDataArray[AIndex]);
    end;
  end
  else
    Result := '';
end;

function TDicomAttribute.GetAsStrings: AnsiString;
{
  function GetDataItemAsString(p1: PAnsiChar): AnsiString;
  var
    k: Integer;
    pb1: pByte;
  begin
    if assigned(p1) then
    begin
      case FDataType of //
        ddtString:
          begin
            Result := StrPas(p1);
            //           Result := '('+IntToStr(Length(Result))+')'+Result;
          end;
        ddtInteger: Result := IntToStr(PInteger(p1)^);
        ddtSingle: Result := FloatToDicomStr(PSingle(p1)^);
        ddtDouble: Result := FloatToDicomStr(PDouble(p1)^);
        ddtShortInt: Result := IntToStr(PShortInt(p1)^);
        ddtDatetime:
          begin
            if (dcm_type = tDA) then
              Result := DateToStr(PDatetime(p1)^)
            else
              Result := DatetimeToStr(PDatetime(p1)^);
          end;
        ddtTime: Result := timeToStr(PDatetime(p1)^);
        ddtOBStream:
          begin
            Result := 'Byte Array[' + IntToStr(TOBStream(p1).SIze) + ']';
            Result := Result + '(';
            pb1 := TOBStream(p1).memory;
            for k := 1 to Min(TOBStream(p1).Size, 16) do
            begin
              Result := Result + IntToHex(pb1^, 2) + ' ';
              inc(pb1);
            end;
            pb1 := TOBStream(p1).memory;
            Result := Result + '):' + StrPas(PAnsiChar(pb1));
          end;
      end; // case
    end
    else
      Result := 'NULL';
  end;}
var
  I: Integer;
  //  pb1: pByte;
begin
  if FDataType = ddtImage then //(FGroup = 32736) and (FElement = 16) then
  begin
    Result := 'Pixel Data ' + IntToStr(FDataArray.Count) + ' frame' + #13#10;
    for I := 0 to FDataArray.Count - 1 do // Iterate
    begin
      Result := Result + IntToStr(i + 1) + ':' + IntToStr(TDicomImageData(FDataArray[i]).FLen) +
        'Byte'#13#10;
    end; // for}
  end
  else
    if FDataType = ddtAttributes then
  begin
    Result := 'Sequence Data';
  end
  else
  begin
    if (FDataArray.Count > 0) then
    begin
      Result := '';
      for I := 0 to FDataArray.Count - 1 do // Iterate
      begin
        if i <> 0 then
          Result := Result + '\';
        Result := Result + GetAsString(i);
        //        Result := Result + GetDataItemAsString(FDataArray[i]);
      end; // for
    end
    else
      Result := 'NULL';
  end
end;

destructor TDicomAttribute.Destroy;
var
  I: Integer;
  //  o1: TOBStream;
  //  da: TDicomAttributes;
  //  di: TDicomImageData;
begin
  if FDataArray.Count > 0 then
  begin
    for I := 0 to FDataArray.Count - 1 do // Iterate
    begin
      if FDataArray[i] <> nil then
      begin
        try
          case FDataType of
            ddtAttributes:
              begin
                TDicomAttributes(FDataArray[i]).Free;
              end;
            ddtImage:
              begin
                TDicomImageData(FDataArray[i]).Free;
              end;
            ddtOBStream:
              begin
                TOBStream(FDataArray[i]).Free;
              end
          else
            FreeMem(FDataArray[i])
          end;
        except
        end;
      end;
    end; // for
    FDataArray.Clear;
  end;
  FDataArray.Free;
  inherited Destroy;
end;

function TDicomAttribute.GetDescription: AnsiString;
begin
  Result := FDict.Description;
end;

constructor TDicomAttribute.Create(AOwner: TDicomAttributes);
begin
  FParent := AOwner;
  FGroup := 0;
  FElement := 0;
  FDataArray := TList.Create;
end;

constructor TDicomAttribute.Create(AOwner: TDicomAttributes; AGroup, AElement: Word);
begin
  FParent := AOwner;
  FGroup := AGroup;
  FElement := AElement;
  FDataArray := TList.Create;
  FDict := DDict.ItemByGroupElement[FGroup shl 16 + FElement];
  Dcm_Type := FDict.DicomType;
  if FElement = 0 then
    Dcm_Type := tUL;
  case dcm_type of
    tSQ:
      FDataType := ddtAttributes;
    tOW, tOB, tOW_OB, tUNKNOWN:
      begin
        if (fgroup = 32736) and (felement = 16) then
          FDataType := ddtImage
        else
          FDataType := ddtOBStream;
      end;
    tAT, tSL, tUL, tUS, tUS_SS, tIS:
      FDataType := ddtInteger;
    tFL:
      FDataType := ddtSingle;
    tFD, tDS:
      FDataType := ddtDouble;
    tSS:
      FDataType := ddtShortInt;
    tDA, tDT:
      FDataType := ddtDatetime;
    tTM:
      FDataType := ddtTime;
    //tAS,tPN:
  else
    FDataType := ddtString;
  end;
end;

procedure TDicomAttribute._ReadAS(f1: TDicomStream; AIndex, ACount: Integer);
var
  p1: PAnsiChar;
begin
  GetMem(p1, ACount + 1);
  FillChar(p1^, ACount + 1, 0);
  f1.Read(p1^, ACount);
  FDataArray.Add(p1);
  FDataType := ddtString;
end;

procedure TDicomAttribute._ReadAT;
var
  p1: PInteger;
begin
  GetMem(p1, SizeOf(Integer));
  p1^ := f1.ReadInt16 shl 16 + f1.ReadInt16;
  FDataArray.Add(p1);
  FDataType := ddtInteger;
end;

procedure TDicomAttribute._ReadFloat;
var
  p1: PSingle;
begin
  GetMem(p1, sizeof(Single));
  f1.Read(p1^, 4);
  FDataArray.Add(p1);
  FDataType := ddtSingle;
end;

procedure TDicomAttribute._ReadDouble;
var
  p1: PDouble;
begin
  GetMem(p1, SizeOf(Double));
  f1.Read(p1^, 8);
  FDataArray.Add(p1);
  FDataType := ddtDouble;
end;

procedure TDicomAttribute._ReadLong;
var
  p1: PInteger;
begin
  getMem(p1, SizeOf(Integer));
  p1^ := f1.ReadInt32;
  FDataArray.Add(p1);
  FDataType := ddtInteger;
end;

procedure TDicomAttribute._ReadShort;
var
  p1: PShortInt;
begin
  GetMem(p1, SizeOf(ShortInt));
  p1^ := f1.ReadInt16;
  FDataArray.Add(p1);
  FDataType := ddtShortInt;
end;

procedure TDicomAttribute._ReadInteger;
var
  p1: PInteger;
begin
  getMem(p1, SizeOf(Integer));
  p1^ := f1.ReadInt16;
  FDataArray.Add(p1);
  FDataType := ddtInteger;
end;

procedure TDicomAttribute.ReadData(f1: TDicomStream; ALen: Integer);
var
  k1: Integer;
begin
  k1 := GetDicomTypeLength(dcm_type);
  if k1 <> 0 then
  begin
    AddElements(f1, ALen div k1);
  end
  else
  begin
    case dcm_type of
      tUNKNOWN, tOB, tOW_OB, tOW:
        begin
          ReadOB_OW(f1, ALen);
          exit;
        end;
    end;
    ReadDicomString(f1, ALen);
  end;
end;

procedure TDicomAttribute.AddElements(f1: TDicomStream; ACount: Integer);
var
  I: Integer;
begin
  for I := 1 to ACount do // Iterate
  begin
    AddElement(f1, i, ACount);
  end; // for
end;

procedure TDicomAttribute.AddElement(f1: TDicomStream; AIndex, ACount: Integer);
begin
  case dcm_type of
    tAS:
      begin
        _ReadAS(f1, AIndex, ACount);
      end;
    tAT:
      begin
        _ReadAT(f1);
      end;
    tFL:
      begin
        _ReadFloat(f1);
      end;
    tFD:
      begin
        _ReadDouble(f1);
      end;
    tSL, tUL:
      begin
        _ReadLong(f1);
      end;
    tSS:
      begin
        _ReadShort(f1);
      end;
    tUS, tUS_SS:
      begin
        _ReadInteger(f1);
      end;
    //  2,4,6,7,8,9,10,11,12,13,14,15,16,18,22,24,25
    //  else
    //    result := NIL;
  end; //end of case
end;

procedure TDicomAttribute.ReadDicomString(f1: TDicomStream; Alen: Integer);
var
  s, s1: AnsiString;
  p1: PAnsiChar;
  l1, k1: Integer;
  pd1: PDatetime;
begin
  if (dcm_type = tDA) and (Alen mod 8 = 0) then
  begin
    s := f1.ReadString(Alen);
    s := Trim(s);
    if Length(s) <> ALen then
    begin
      //      GetMem(pd1, SizeOf(TDatetime));
      //      pd1^ := now;
      //      FDataArray.Add(pd1);
      FDataType := ddtDatetime;
      exit;
      //      raise Exception.Create('IllegalArgumentException') {IllegalArgumentException};
    end;
    l1 := 0;
    while l1 < (ALen div 8) do
    begin
      s1 := copy(s, l1 * 8, 8);
      GetMem(pd1, SizeOf(TDatetime));
      try
        pd1^ := DicomStrToDate(s1);
      except
        on e: Exception do
          pd1^ := now;
      end;
      FDataArray.Add(pd1);
      FDataType := ddtDatetime;
      //      vector.addElement(copy(s,l1*8,(l1+1)*8));
      inc(l1);
    end;
  end
  else
  begin
    GetMem(p1, ALen + 1);
    FillChar(p1^, ALen + 1, 0);
    f1.Read(p1^, ALen);

    if (dcm_type = tDA) then
      SeprateStringDA(p1, alen)
    else
      SeprateString(p1, alen);

    k1 := 0;
    while k1 < FDataArray.Count do
    begin
      // 28.08.2012 FOMIN совмещение
      try
        ConvertValue(k1, dcm_type);
        inc(k1);
      except
        k1 := 0;
      end;
    end;
  end;
end;

procedure TDicomAttribute.SeprateString(p1: PAnsiChar; ALen: Integer);
var
  k1, k2, k3: Integer;
  pk1, pk2, pk3: PAnsiChar;
begin
  pk1 := p1;
  pk2 := p1;
  k2 := 0;
  k3 := 0;
  for k1 := 0 to ALen - 1 do
  begin
    if pk1^ = '\' then
    begin
      k2 := 1;
      if k3 > 0 then
      begin
        GetMem(pk3, k3 + 1);
        FillChar(pk3^, k3 + 1, 0);
        strlcopy(pk3, pk2, k3);
        FDataArray.Add(pk3);
        FDataType := ddtString;
        pk2 := pk1;
        k3 := -1;
        inc(pk2);
      end
      else
      begin
        //        FDataArray.Add(nil);
        //        FDataType := 0;
      end;
    end;
    inc(k3);
    inc(pk1);
  end;
  if k2 = 0 then
  begin
    FDataArray.Add(p1);
    FDataType := ddtString;
  end
  else
  begin
    GetMem(pk3, k3 + 1);
    FillChar(pk3^, k3 + 1, 0);
    strlcopy(pk3, pk2, k3);
    FDataArray.Add(pk3);
    FDataType := ddtString;
    FreeMem(p1);
  end;
end;

procedure TDicomAttribute.SeprateStringDA(p1: PAnsiChar; ALen: Integer);
var
  k1, k2, k3: Integer;
  pk1, pk2, pk3: PAnsiChar;
begin
  pk1 := p1;
  pk2 := p1;
  k2 := 0;
  k3 := 0;
  for k1 := 0 to ALen - 1 do
  begin
    if pk1^ = '-' then
    begin
      k2 := 1;
      if k3 > 0 then
      begin
        GetMem(pk3, k3 + 1);
        FillChar(pk3^, k3 + 1, 0);
        strlcopy(pk3, pk2, k3);
        FDataArray.Add(pk3);
        FDataType := ddtString;
        pk2 := pk1;
        k3 := -1;
        inc(pk2);
      end
      else
      begin
        //        FDataArray.Add(nil);
        //        FDataType := 0;
      end;
    end;
    inc(k3);
    inc(pk1);
  end;
  if k2 = 0 then
  begin
    FDataArray.Add(p1);
    FDataType := ddtString;
  end
  else
  begin
    GetMem(pk3, k3 + 1);
    FillChar(pk3^, k3 + 1, 0);
    strlcopy(pk3, pk2, k3);
    FDataArray.Add(pk3);
    FDataType := ddtString;
    FreeMem(p1);
  end;
end;

procedure TDicomAttribute.ReadOB_OW(f1: TDicomStream; Alen: Integer);
var
  p1: PAnsiChar;
  o1: TOBStream;
  dimage: TDicomImageData;
  l, k, i: Integer;
  ts1: Integer;
  {  e1: TECLMemoryStream;
    m1: TOBStream;}
//  da1: TDicomAttribute;
begin
  if (fgroup = 32736) and (felement = 16) then
  begin
    //    ShowMessage('Now read pixel data : ' + UIDS.ItemByIndex[f1.TransferSyntax].Name);
    i := Parent.getInteger($28, $8);
    if i <= 0 then
      i := 1;
    if (ALen <= (i * 4 + 4)) then
    begin
      GetMem(p1, ALen);
      f1.Read(p1^, ALen);
      Freemem(p1);
      exit;
    end;
    if (f1.FStream is TFileStream) and ((f1.FStream.Size - f1.FStream.Position) < Alen) then
    begin
      exit;
      //raise Exception.Create(Format('File Error Left:%d,len:%d,igore now!', [f1.FStream.Size-f1.FStream.Position,Alen]));
    end;

    {da1 := Parent.Item[2, 16];
    if da1 <> nil then
      ts1 := UIDS.Items[da1.AsString[0]].Constant
    else}
    ts1 := f1.TransferSyntax;

    if ((ts1 = ImplicitVRLittleEndian) or
      (ts1 = ExplicitVRLittleEndian) or
      (ts1 = ExplicitVRBigEndian)) then
    begin
      i := Parent.getInteger($28, $8);
      if i > 1 then
      begin
        k := Parent.getInteger($28, $2) * Parent.getInteger($28, $10) * Parent.getInteger($28, $11)
          * ((Parent.getInteger($28, $100) + 7) div 8);
        for l := 0 to i - 1 do
        begin
          if f1.FKeepImageDataInStream then
          begin
            dimage := TDicomImageData.Create(ts1, f1.FStream, k);
          end
          else
          begin
            GetMem(p1, k);
            f1.Read(p1^, k);
            dimage := TDicomImageData.Create(ts1, p1, k);
          end;
          //          dimage := TDicomImageData.Create(ts1, p1, k);
          FDataArray.Add(dimage);
          if assigned(FParent.FOnLoadFrame) then
            FParent.FOnLoadFrame(FDataArray);
        end;
        FDataType := ddtImage;
      end
      else
      begin
        if f1.FKeepImageDataInStream then
        begin
          dimage := TDicomImageData.Create(ts1, f1.FStream, ALen);
        end
        else
        begin
          GetMem(p1, ALen);
          f1.Read(p1^, ALen);
          dimage := TDicomImageData.Create(ts1, p1, ALen);
        end;
        //        dimage := TDicomImageData.Create(ts1, p1, ALen);
        FDataArray.Add(dimage);
        FDataType := ddtImage;
        if assigned(FParent.FOnLoadFrame) then
          FParent.FOnLoadFrame(FDataArray);
      end;
    end
    else
    begin
      if f1.FKeepImageDataInStream then
      begin
        dimage := TDicomImageData.Create(ts1, f1.FStream, ALen);
      end
      else
      begin
        GetMem(p1, ALen);
        f1.Read(p1^, ALen);
        dimage := TDicomImageData.Create(ts1, p1, ALen);
      end;
      //      dimage := TDicomImageData.Create(ts1, p1, ALen);
      FDataArray.Add(dimage);
      FDataType := ddtImage;
      if assigned(FParent.FOnLoadFrame) then
        FParent.FOnLoadFrame(FDataArray);
    end;
    if assigned(FParent.FOnLoadFrameFinish) then
      FParent.FOnLoadFrameFinish(self);
  end
  else
    if (fgroup = $2809) and (felement = $1001) then
  begin
    GetMem(p1, ALen);
    f1.Read(p1^, ALen);

    {    m1 := TOBStream.Create(p1, ALen);
        e1 := TECLMemoryStream.Create('');
        try
          //            e1.CompressedDataStream.LoadFromStream(m1);
          m1.SaveToStream(e1.CompressedDataStream);
          GetMem(p1, e1.Size);
          e1.Read(p1^, e1.Size);
          m1.LoadFromStream(e1);
          ALen := e1.Size;
        finally
          m1.Free;
          e1.Free;
        end; }

    o1 := TOBStream.Create(p1, ALen);
    FDataArray.Add(o1);
    FDataType := ddtOBStream;
  end
  else
  begin
    GetMem(p1, ALen);
    f1.Read(p1^, ALen);
    o1 := TOBStream.Create(p1, ALen);
    FDataArray.Add(o1);
    FDataType := ddtOBStream;
    if (Dcm_Type = tOW) and (f1.TransferSyntax = ExplicitVRBigEndian) then
    begin
      //    DicomUtils.a(abyte0);
    end;
  end;
end;

procedure TDicomAttribute.ReadOB_OWForThread(f1: TDicomStream; Alen: Integer);
var
  p1: PAnsiChar;
  o1: TOBStream;
  dimage: TDicomImageData;
  l, k, i: Integer;
  ts1: Integer;
  {  e1: TECLMemoryStream;
    m1: TOBStream;}
//  da1: TDicomAttribute;
begin
  if (f1.Position >= f1.Size) then
    exit;
  if (fgroup = 32736) and (felement = 16) then
  begin
    //    ShowMessage('Now read pixel data : ' + UIDS.ItemByIndex[f1.TransferSyntax].Name);
    i := Parent.getInteger($28, $8);
    if i <= 0 then
      i := 1;
    if (ALen <= (i * 4)) then
    begin
      GetMem(p1, ALen);
      f1.Read(p1^, ALen);
      Freemem(p1);
      exit;
    end;
    if (f1.FStream is TFileStream) and ((f1.FStream.Size - f1.FStream.Position) < Alen) then
    begin
      exit;
      //raise Exception.Create(Format('File Error Left:%d,len:%d,igore now!', [f1.FStream.Size-f1.FStream.Position,Alen]));
    end;

    {da1 := Parent.Item[2, 16];
    if da1 <> nil then
      ts1 := UIDS.Items[da1.AsString[0]].Constant
    else}
    ts1 := f1.TransferSyntax;

    if ((ts1 = ImplicitVRLittleEndian) or
      (ts1 = ExplicitVRLittleEndian) or
      (ts1 = ExplicitVRBigEndian)) then
    begin
      i := Parent.getInteger($28, $8);
      if i > 1 then
      begin
        k := Parent.getInteger($28, $2) * Parent.getInteger($28, $10) * Parent.getInteger($28, $11)
          * ((Parent.getInteger($28, $100) + 7) div 8);
        for l := 0 to i - 1 do
        begin

          begin
            GetMem(p1, k);
            f1.Read(p1^, k);
            dimage := TDicomImageData.Create(ts1, p1, k);
          end;
          //          dimage := TDicomImageData.Create(ts1, p1, k);
          FDataArray.Add(dimage);
          if assigned(FParent.FOnLoadFrame) then
            FParent.FOnLoadFrame(FDataArray);
        end;
        FDataType := ddtImage;
      end
      else
      begin

        begin
          GetMem(p1, ALen);
          f1.Read(p1^, ALen);
          dimage := TDicomImageData.Create(ts1, p1, ALen);
        end;
        //        dimage := TDicomImageData.Create(ts1, p1, ALen);
        FDataArray.Add(dimage);
        FDataType := ddtImage;
        if assigned(FParent.FOnLoadFrame) then
          FParent.FOnLoadFrame(FDataArray);
      end;
    end
    else
    begin

      begin
        GetMem(p1, ALen);
        f1.Read(p1^, ALen);
        dimage := TDicomImageData.Create(ts1, p1, ALen);
      end;
      //      dimage := TDicomImageData.Create(ts1, p1, ALen);
      FDataArray.Add(dimage);
      FDataType := ddtImage;
      if assigned(FParent.FOnLoadFrame) then
        FParent.FOnLoadFrame(FDataArray);
    end;
  end
  else
    if (fgroup = $2809) and (felement = $1001) then
  begin
    GetMem(p1, ALen);
    f1.Read(p1^, ALen);

    {    m1 := TOBStream.Create(p1, ALen);
        e1 := TECLMemoryStream.Create('');
        try
          //            e1.CompressedDataStream.LoadFromStream(m1);
          m1.SaveToStream(e1.CompressedDataStream);
          GetMem(p1, e1.Size);
          e1.Read(p1^, e1.Size);
          m1.LoadFromStream(e1);
          ALen := e1.Size;
        finally
          m1.Free;
          e1.Free;
        end; }

    o1 := TOBStream.Create(p1, ALen);
    FDataArray.Add(o1);
    FDataType := ddtOBStream;
  end
  else
  begin
    GetMem(p1, ALen);
    f1.Read(p1^, ALen);
    o1 := TOBStream.Create(p1, ALen);
    FDataArray.Add(o1);
    FDataType := ddtOBStream;
    if (Dcm_Type = tOW) and (f1.TransferSyntax = ExplicitVRBigEndian) then
    begin
      //    DicomUtils.a(abyte0);
    end;
  end;
end;

procedure TDicomAttribute.ConvertValue(AIndex, i1: Integer);
var
  p1: PAnsiChar;
  pf1: PDouble;
  pi1: PInteger;
  pdate1: PDatetime;
  vint : Integer;
begin
  case i1 of
    tDS:
      begin
        p1 := FDataArray[Aindex];
        GetMem(pf1, SizeOf(Double));
        try
          if Trim(StrPas(p1))='' then
            pi1^ := 0
          else
            pf1^ := DicomStrToFloat(Trim(StrPas(p1)));
        except
          on e: Exception do
            pf1^ := 0;
        end;
        FDataArray[Aindex] := pf1;
        FDataType := ddtDouble;
        FreeMem(p1);
      end;
    tIS:
      begin
        p1 := FDataArray[Aindex];
        getMem(pi1, SizeOf(Integer));
        try
          if TryStrToInt(Trim(StrPas(p1)), vint ) then
            pi1^ := vint
          else
            pi1^ := 0; // StrToInt(Trim(StrPas(p1)));
        except
          on e: Exception do
            pi1^ := 0;
        end;
        FDataArray[Aindex] := pi1;
        FDataType := ddtInteger;
        FreeMem(p1);
      end;
    tDA:
      begin
        p1 := FDataArray[Aindex];
        GetMem(pdate1, SizeOf(TDatetime));
        try
          pdate1^ := DicomStrToDate((StrPas(p1)));
        except
          on e: Exception do
            pdate1^ := now;
        end;
        FDataArray[Aindex] := pdate1;
        FDataType := ddtDatetime;
        FreeMem(p1);
      end;
    tDT:
      begin
        p1 := FDataArray[Aindex];
        GetMem(pdate1, SizeOf(TDatetime));
        try
          pdate1^ := DicomStrToDateTime((StrPas(p1)));
        except
          on e: Exception do
            pdate1^ := now;
        end;
        FDataArray[Aindex] := pdate1;
        FDataType := ddtDatetime;
        FreeMem(p1);
      end;
    tTM:
      begin
        p1 := FDataArray[Aindex];
        GetMem(pdate1, SizeOf(TDatetime));
        if p1<>'' then        
          try
            pdate1^ := DicomStrToTime((StrPas(p1)));
          except
            on e: Exception do
              pdate1^ := now;
          end
        else
            pdate1^ := now;
        FDataArray[Aindex] := pdate1;
        FDataType := ddtTime;
        FreeMem(p1);
      end;
    tPN:
      begin
        //        result := F_i(s);
      end;
  end; //end of case
end; //end of F_a(s:AnsiString;i1:Integer)

procedure RLEdecodeBytes(AData: Pointer; ALen: Integer; AOutputData: Pointer; AOutputLen: Integer);

var
  i: Integer;
  abyte0, abyte1: PShortInt;
  byte0: ShortInt;
  j: Integer;
  byte1: ShortInt;
  b: array[0..14] of Integer;
  procedure processHeader;
  var
    i: Integer;
    p1: PInteger;
  begin
    p1 := PInteger(AData);
    //c := p1^;
    for i := 0 to 15 do
    begin
      inc(p1);
      b[i] := p1^;
    end;
  end;
begin
  //processHeader;

  i := 0;
  AByte1 := AData;
  abyte0 := AOutputData;
  //    inc(abyte0, FWidth * FHeight );

  //inc(abyte1, b[0]);
  while i < AOutputLen do
  begin
    byte0 := AByte1^;
    inc(abyte1);
    if (byte0 >= 0) then
    begin
      for j := 0 to byte0 do
      begin
        if i < AOutputLen then
        begin
          abyte0^ := abyte1^;
          inc(abyte1);
          inc(abyte0);
          inc(i);
        end;
      end;
    end
    else
    begin
      if (byte0 <= -1) and (byte0 >= -127) then
      begin
        byte1 := abyte1^;
        inc(abyte1);
        for j := 0 to -byte0 do
        begin
          if i < AOutputLen then
          begin
            abyte0^ := byte1;
            inc(abyte0);
            inc(i);
          end;
        end;
      end; // else
    end;
  end;
end;

procedure FastRLEdecodeBytes(AData: Pointer; ALen, AWidth, AHeight, ABits, ASamplePerPixel:
  Integer; AOutputData: Pointer; APlanarConfiguration: Integer);
var
  FData: Pointer;
  FLen: Integer;
  b: array[0..14] of Integer;
  c: Integer;
  FWidth: Integer;
  FHeight: Integer;
  FSamplePerPixel: Integer;
  FBits: Integer;
  FDestSize: Integer;

  procedure processHeader;
  var
    i: Integer;
    p1: PInteger;
  begin
    p1 := PInteger(FData);
    c := p1^;
    for i := 0 to 15 do
    begin
      inc(p1);
      b[i] := p1^;
    end;
  end;

  procedure decode16;
  var
    lShort: ShortInt;
    lImageVoxels, J, i, lCptPos, lCptVal, lRunVal: integer;
    lCptBuff: PByte;
    lOutputBuff: PSmallInt;
  begin
    lImageVoxels := FWidth * FHeight;
    lCptBuff := PByte(FData);
    lOutputBuff := AOutputData;
    J := 0;
    lCptPos := b[1];
    inc(lCptBuff, lCptPos);
    repeat
      lCptVal := lCptBuff^;
      inc(lCptBuff);
      inc(lCptPos);
      lShort := shortint(lCptVal);
      case lShort of
        -128: ;
        0..127:
          begin
            for i := 0 to lShort do
            begin //0->n+1 bytes
              if J < lImageVoxels then
                lOutputBuff^ := lCptBuff^;
              inc(lCptBuff);
              inc(lOutputBuff);
              inc(J);
              inc(lCptPos);
            end;
          end;
      else
        begin
          lCptVal := (-lShort);
          lRunVal := lCptBuff^;
          inc(lCptBuff);
          inc(lCptPos);
          for i := 0 to lCptVal do
          begin //0->n+1 bytes
            if J < lImageVoxels then
              lOutputBuff^ := lRunVal;
            inc(lOutputBuff);
            inc(J);
          end;
        end;
      end;
    until (lCptPos >= FLen) or (J >= lImageVoxels);

    lCptBuff := PByte(FData);
    lOutputBuff := AOutputData;
    lCptPos := b[0];
    inc(lCptBuff, lCptPos);
    J := 0;
    repeat
      lCptVal := lCptBuff^;
      inc(lCptBuff);
      inc(lCptPos);
      lShort := shortint(lCptVal);
      case lShort of
        -128: ;
        0..127:
          begin
            for i := 0 to lShort do
            begin
              if J < lImageVoxels then
              begin
                lOutputBuff^ := (lCptBuff^ shl 8) + lOutputBuff^;
              end;
              inc(J);
              inc(lOutputBuff);
              inc(lCptPos);
              inc(lCptBuff);
            end;
          end;
      else
        begin
          lCptVal := (-lShort);
          lRunVal := lCptBuff^;
          inc(lCptPos);
          inc(lCptBuff);
          for i := 0 to lCptVal do
          begin
            if J < lImageVoxels then
              lOutputBuff^ := (lRunVal shl 8) + lOutputBuff^;
            inc(J);
            inc(lOutputBuff);
          end;
        end;
      end;
    until (lCptPos >= FLen) or (J >= lImageVoxels);
  end;

  procedure decode8;
  var
    i: Integer;
    abyte0, abyte1: PShortInt;
    byte0: ShortInt;
    j: Integer;
    byte1: ShortInt;

  begin

    i := 0;
    AByte1 := FData;
    abyte0 := AOutputData;
    //    inc(abyte0, FWidth * FHeight );

    inc(abyte1, b[0]);
    while i < FDestSize do
    begin
      byte0 := AByte1^;
      inc(abyte1);
      if (byte0 >= 0) then
      begin
        for j := 0 to byte0 do
        begin
          if i < FDestSize then
          begin
            abyte0^ := abyte1^;
            inc(abyte1);
            inc(abyte0);
            inc(i);
          end;
        end;
      end
      else
      begin
        if (byte0 <= -1) and (byte0 >= -127) then
        begin
          byte1 := abyte1^;
          inc(abyte1);
          for j := 0 to -byte0 do
          begin
            if i < FDestSize then
            begin
              abyte0^ := byte1;
              inc(abyte0);
              inc(i);
            end;
          end;
        end; // else
      end;
    end;

  end;

  procedure decodergb(AMode: Integer);
  type
    BytePA0 = array[0..0] of Byte;
    ByteP0 = ^BytePA0;
  var
    lShort: ShortInt;
    lImageVoxels, J, i, lCptPos, lCptVal, lRunVal: integer;
    lCptBuff: PByte;
    lOutputBuff: PRGB;
    zz: Integer;
    tp1: Pointer;
    a1, b1: ByteP0;
  begin
    if AMode = 1 then
    begin
      GetMem(tp1, FWidth * FHeight * 3);
    end
    else //}
      tp1 := AOutputData;

    lImageVoxels := FWidth * FHeight;

    lCptBuff := PByte(FData);
    lOutputBuff := tp1;
    J := 0;
    lCptPos := b[0];
    inc(lCptBuff, lCptPos);
    repeat
      lCptVal := lCptBuff^;
      inc(lCptBuff);
      inc(lCptPos);
      lShort := shortint(lCptVal);
      case lShort of
        -128: ;
        0..127:
          begin
            for i := 0 to lShort do
            begin //0->n+1 bytes
              if J < lImageVoxels then
                lOutputBuff^.b := lCptBuff^;
              inc(lCptBuff);
              inc(lOutputBuff);
              inc(J);
              inc(lCptPos);
            end;
          end;
      else
        begin
          lCptVal := (-lShort);
          lRunVal := lCptBuff^;
          inc(lCptBuff);
          inc(lCptPos);
          for i := 0 to lCptVal do
          begin //0->n+1 bytes
            if J < lImageVoxels then
              lOutputBuff^.b := lRunVal;
            inc(lOutputBuff);
            inc(J);
          end;
        end;
      end;
    until (lCptPos >= FLen) or (J >= lImageVoxels);
    //end;

    lCptBuff := PByte(FData);
    lOutputBuff := tp1;
    lCptPos := b[1];
    inc(lCptBuff, lCptPos);
    J := 0;
    repeat
      lCptVal := lCptBuff^;
      inc(lCptBuff);
      inc(lCptPos);
      lShort := shortint(lCptVal);
      case lShort of
        -128: ;
        0..127:
          begin
            for i := 0 to lShort do
            begin
              if J < lImageVoxels then
              begin
                lOutputBuff^.g := lCptBuff^;
              end;
              inc(J);
              inc(lOutputBuff);
              inc(lCptPos);
              inc(lCptBuff);
            end;
          end;
      else
        begin
          lCptVal := (-lShort);
          lRunVal := lCptBuff^;
          inc(lCptPos);
          inc(lCptBuff);
          for i := 0 to lCptVal do
          begin
            if J < lImageVoxels then
              lOutputBuff^.g := lRunVal;
            inc(J);
            inc(lOutputBuff);
          end;
        end;
      end;
    until (lCptPos >= FLen) or (J >= lImageVoxels);

    lCptBuff := PByte(FData);
    lOutputBuff := tp1;
    lCptPos := b[2];
    inc(lCptBuff, lCptPos);
    J := 0;
    repeat
      lCptVal := lCptBuff^;
      inc(lCptBuff);
      inc(lCptPos);
      lShort := shortint(lCptVal);
      case lShort of
        -128: ;
        0..127:
          begin
            for i := 0 to lShort do
            begin
              if J < lImageVoxels then
              begin
                lOutputBuff^.r := lCptBuff^;
              end;
              inc(J);
              inc(lOutputBuff);
              inc(lCptPos);
              inc(lCptBuff);
            end;
          end;
      else
        begin
          lCptVal := (-lShort);
          lRunVal := lCptBuff^;
          inc(lCptPos);
          inc(lCptBuff);
          for i := 0 to lCptVal do
          begin
            if J < lImageVoxels then
              lOutputBuff^.r := lRunVal;
            inc(J);
            inc(lOutputBuff);
          end;
        end;
      end;
    until (lCptPos >= FLen) or (J >= lImageVoxels);

    if AMode = 1 then
    begin //Samples=3, swizzle RRRGGGBBB to triplets RGBRGBRGB
      j := 0;
      zz := FWidth * FHeight;
      a1 := AOutputData;
      b1 := tp1;
      for i := 0 to zz - 1 do
      begin
        a1[i] := b1[j]; //red
        a1[i + zz] := b1[j + 1];
        a1[i + zz + zz] := b1[j + 2]; //blue
        j := j + 3;
      end; //for loop
      FreeMem(tp1);
    end;
  end;
begin
  FData := AData;
  FLen := ALen;
  //  xa := 128;
  FWidth := AWidth;
  FHeight := AHeight;
  FBits := ABits;
  FSamplePerPixel := ASamplePerPixel;
  FDestSize := AWidth * AHeight * ((Abits + 7) div 8);

  processHeader;

  //decode8;

  case FSamplePerPixel * ((FBits + 7) div 8) of
    1: decode8;
    2: decode16;
    3:
      begin
        decodergb(APlanarConfiguration);
      end;
  else
    raise Exception.Create('the RLE Segment #' + IntToStr(c) + ' is not support now');
  end; //}
end;

procedure FastRLEencodeBytesEx(const AData: Pointer; ALen, AOffset: Integer; AStm: TStream);
var
  lastch, ch: AnsiChar;

  BufferCount, DupCount: Integer;

  PData1: PAnsiChar;
  abyte0, abyte1: PAnsiChar;

  i1: Integer;
  count1: Integer;
  procedure WriteDup;
  var
    b1: Integer;
  begin
    if DupCount > 0 then
    begin
      b1 := 257 - DupCount;
      AStm.write(b1, 1);
      AStm.write(lastch, 1);
      DupCount := 0;
    end;
  end;
  procedure WriteBuffer;
  var
    b1: Integer;
  begin
    if BufferCount > 0 then
    begin
      b1 := BufferCount - 1;
      AStm.write(b1, 1);
      AStm.write(abyte0^, BufferCount);
      BufferCount := 0;
      abyte1 := abyte0;
    end;
  end;
  procedure AddToBuffer(ach: AnsiChar);
  begin
    abyte1^ := (ach);
    inc(abyte1);

    Inc(BufferCount);
    if BufferCount = 128 then
    begin
      WriteBuffer;
    end;
  end;
begin
  PData1 := AData;

  //  lastch := 0;
  BufferCount := 0;
  DupCount := 0;
  GetMem(abyte0, 128);
  abyte1 := abyte0;
  try
    count1 := 0;
    while count1 < ALen do
    begin
      ch := PData1^;
      inc(PData1, AOffset);
      inc(count1);

      if BufferCount = 0 then
      begin
        if DupCount = 0 then
        begin
          lastch := ch;
          DupCount := 1;
        end
        else
          if lastch = ch then
        begin
          Inc(DupCount);
          if DupCount = 128 then
          begin
            WriteDup;
          end;
        end
        else
          if DupCount > 2 then
        begin
          WriteDup;
          DupCount := 1;
          lastch := ch;
        end
        else
        begin
          for i1 := 0 to DupCount - 1 do
          begin
            AddToBuffer(lastch);
          end;
          DupCount := 0;

          AddToBuffer(ch);
          lastch := ch;
        end;
      end
      else
        if DupCount <> 0 then
      begin
        if ch = lastch then
        begin
          Inc(DupCount);
          if DupCount = 128 then
          begin
            WriteBuffer;

            WriteDup;
          end; //end of if(PreInc(l) = 128)
        end
        else
        begin
          WriteBuffer;

          WriteDup;
          DupCount := 1;
          lastch := ch;
        end;
      end
      else
        if lastch = ch then
      begin
        lastch := ch;
        DupCount := 2;
        Dec(BufferCount);
        dec(abyte1);

        //WriteBuffer;
      end
      else
      begin
        AddToBuffer(ch);
        lastch := ch;
      end;
    end;
  finally
    FreeMem(abyte0);
  end;
end;

procedure FastRLEencodeBytes(AData: Pointer; ALen, AWidth, AHeight, ABits, ASamplePerPixel,
  APlanarConfiguration:
  Integer; AStm: TStream);
var
  offsetarray, offsetarray1: PInteger;
  position1, k1: Integer;
  procedure encode8;
  begin
    offsetarray1^ := AStm.Position - Position1;
    FastRLEencodeBytesEx(AData, ALen - 1, 1, AStm);
  end;
  procedure encode16;
  var
    p1: PByte;
  begin
    p1 := AData;
    inc(p1);
    offsetarray1^ := AStm.Position - Position1;
    FastRLEencodeBytesEx(p1, AWidth * AHeight, 2, AStm);

    inc(offsetarray1);
    offsetarray1^ := AStm.Position - Position1;
    p1 := AData;
    //inc(p1);
    FastRLEencodeBytesEx(p1, AWidth * AHeight, 2, AStm);
  end;
  procedure encodergb(APlanarConfiguration: Integer);
  var
    p1: PByte;
  begin
    if APlanarConfiguration = 1 then
    begin
      p1 := AData;

      offsetarray1^ := AStm.Position - Position1;
      FastRLEencodeBytesEx(p1, AWidth * AHeight - 1, 1, AStm);

      inc(offsetarray1);
      offsetarray1^ := AStm.Position - Position1;
      inc(p1, AWidth * AHeight);
      FastRLEencodeBytesEx(p1, AWidth * AHeight - 1, 1, AStm);

      inc(offsetarray1);
      offsetarray1^ := AStm.Position - Position1;
      inc(p1, AWidth * AHeight);
      FastRLEencodeBytesEx(p1, AWidth * AHeight - 1, 1, AStm);
    end
    else
    begin
      p1 := AData;
      offsetarray1^ := AStm.Position - Position1;
      FastRLEencodeBytesEx(p1, AWidth * AHeight - 1, 3, AStm);

      inc(offsetarray1);
      offsetarray1^ := AStm.Position - Position1;
      inc(p1);
      FastRLEencodeBytesEx(p1, AWidth * AHeight - 1, 3, AStm);

      inc(offsetarray1);
      offsetarray1^ := AStm.Position - Position1;
      inc(p1);
      FastRLEencodeBytesEx(p1, AWidth * AHeight - 1, 3, AStm);
    end;
  end;
begin

  GetMem(offsetarray, 16 * sizeof(Integer));

  offsetarray1 := offsetarray;
  for k1 := 0 to 15 do
  begin
    offsetarray1^ := 0;
    inc(offsetarray1);
  end;

  offsetarray1 := offsetarray;
  k1 := ASamplePerPixel * ((ABits + 7) div 8);

  position1 := AStm.Position;

  offsetarray1^ := k1;
  inc(offsetarray1);

  AStm.Write(offsetarray^, 64);

  case k1 of
    1: encode8;
    2: encode16;
    3:
      begin
        encodergb(APlanarConfiguration);
      end;
  else
    raise Exception.Create('the RLE Segment is not support now');
  end; //}

  k1 := AStm.Position;
  AStm.Position := Position1;
  AStm.Write(offsetarray^, 64);
  AStm.Position := k1;
  FreeMem(offsetarray);
end;

procedure AddImageToDICOMDIR(ADataset: TDicomAttribute; as1: TDicomAttributes; AFileName: AnsiString;
  AIndex: Integer);
  function NeedAddData: Integer;
  var
    i: Integer;
    das1: TDicomAttributes;
  begin
    Result := -1;
    for i := 0 to ADataset.GetCount - 1 do
    begin
      das1 := ADataset.GetAttributes(i);
      if (das1.GetString($4, $1430) = 'IMAGE')
        and (das1.GetString($20, $13) = as1.GetString($20, $13)) then
      begin
        Result := i;
        exit;
      end;
    end;
  end;

var
  da1, da2: TDicomAttributes;
  Bm1, dst: TBitmap;
 // f1: Double;
begin
  da1 := TDicomAttributes.Create;
  da1.AddVariant($4, $1400, 0);
  da1.AddVariant($4, $1410, 65535);
  da1.AddVariant($4, $1420, 0);
  da1.AddVariant($4, $1430, 'IMAGE');
  da1.AddVariant($4, $1500, AFileName);

  //da1.AddVariant($4, $1510, '');
  //da1.AddVariant($4, $1511, '');
  //da1.AddVariant($4, $1512, '');

  da1.AddVariant($20, $13, as1.GetString($20, $13));

  da1.AddVariant($8, $8, as1.GetString($8, $8));
  if assigned(as1.Item[8, $23]) then
    da1.Add($8, $23).AsDatetime[0] := as1.Item[8, $23].AsDatetime[0];
  if assigned(as1.Item[8, $33]) then
    da1.Add($8, $33).AsDatetime[0] := as1.Item[8, $33].AsDatetime[0];

  Bm1 := TBitmap.Create;
  DCM_ImageData_Bitmap.AssignToBitmap(as1.ImageData, bm1);

  dst := TBitmap.Create;
  dst.Width := 128;
  dst.Height := 128;
  dst.PixelFormat := bm1.PixelFormat;
  Dst.Canvas.StretchDraw(Rect(0, 0, 128, 128), bm1);

  da2 := NewImage(dst, false);
  da1.Add($88, $200).AddData(da2);

  bm1.free;
  dst.free;

  ADataset.InsertData(AIndex + 1, da1);
end;

procedure AddSeriesToDICOMDIR(ADataset: TDicomAttribute; as1: TDicomAttributes; AFileName: AnsiString;
  AIndex: Integer);
  function NeedAddData: Integer;
  var
    i: Integer;
    das1: TDicomAttributes;
  begin
    Result := -1;
    for i := 0 to ADataset.GetCount - 1 do
    begin
      das1 := ADataset.GetAttributes(i);
      if (das1.GetString($4, $1430) = 'SERIES')
        and (das1.GetString($20, $11) = as1.GetString($20, $11))
        and (das1.GetString($20, $E) = as1.GetString($20, $E))
        and (das1.GetString($20, $10) = as1.GetString($20, $10))
        and (das1.GetString($20, $D) = as1.GetString($20, $D)) then
      begin
        Result := i;
        exit;
      end;
    end;
  end;
var
  da1: TDicomAttributes;
  i: Integer;
begin
  i := NeedAddData;
  if i < 0 then
  begin
    da1 := TDicomAttributes.Create;
    da1.AddVariant($4, $1400, 0);
    da1.AddVariant($4, $1410, 65535);
    da1.AddVariant($4, $1420, 0);
    da1.AddVariant($4, $1430, 'SERIES');
    if assigned(as1.Item[8, $21]) then
      da1.Add($8, $21).AsDatetime[0] := as1.Item[8, $21].AsDatetime[0];
    if assigned(as1.Item[8, $31]) then
      da1.Add($8, $31).AsDatetime[0] := as1.Item[8, $31].AsDatetime[0];
    da1.AddVariant($8, $60, as1.GetString(8, $60));
    da1.AddVariant($20, $E, as1.GetString($20, $E));
    da1.AddVariant($20, $11, as1.GetString($20, $11));
    da1.AddVariant($20, $D, as1.GetString($20, $D));
    da1.AddVariant($20, $10, as1.GetString($20, $10));
    da1.AddVariant($8, $103E, as1.GetString($8, $103E));

    i := ADataset.InsertData(AIndex + 1, da1);
  end;
  AddImageToDICOMDIR(ADataset, as1, AFileName, i);
end;

procedure AddStudyToDICOMDIR(ADataset: TDicomAttribute; as1: TDicomAttributes; AFileName,
  AStudyReport: AnsiString;
  AIndex: Integer);
  function NeedAddData: Integer;
  var
    i: Integer;
    das1: TDicomAttributes;
  begin
    Result := -1;
    for i := 0 to ADataset.GetCount - 1 do
    begin
      das1 := ADataset.GetAttributes(i);
      if (das1.GetString($4, $1430) = 'STUDY')
        and (das1.GetString($20, $10) = as1.GetString($20, $10))
        and (das1.GetString($20, $D) = as1.GetString($20, $D)) then
      begin
        Result := i;
        exit;
      end;
    end;
  end;
var
  da1: TDicomAttributes;
  i: Integer;
begin
  i := NeedAddData;
  if i < 0 then
  begin
    da1 := TDicomAttributes.Create;
    da1.AddVariant($4, $1400, 0);
    da1.AddVariant($4, $1410, 65535);
    da1.AddVariant($4, $1420, 0);
    da1.AddVariant($4, $1430, 'STUDY');
    if assigned(as1.Item[8, $20]) then
      da1.Add($8, $20).AsDatetime[0] := as1.Item[8, $20].AsDatetime[0]
    else
      if assigned(as1.Item[8, $21]) then
      da1.Add($8, $20).AsDatetime[0] := as1.Item[8, $21].AsDatetime[0];
    if assigned(as1.Item[8, $30]) then
      da1.Add($8, $30).AsDatetime[0] := as1.Item[8, $30].AsDatetime[0]
    else
      if assigned(as1.Item[8, $31]) then
      da1.Add($8, $30).AsDatetime[0] := as1.Item[8, $31].AsDatetime[0];
    da1.Add($8, $50);
    da1.AddVariant($8, $1030, as1.GetString($8, $1030));
    da1.AddVariant($20, $D, as1.GetString($20, $D));
    da1.AddVariant($20, $10, Trim(as1.GetString($20, $10)));
    i := ADataset.InsertData(AIndex + 1, da1);

    if AStudyReport <> '' then
      da1.AddVariant($2813, $0123, AStudyReport);

  end;
  AddSeriesToDICOMDIR(ADataset, as1, AFileName, i);
end;

procedure AddPatientToDICOMDIR(ADataset: TDicomAttribute; as1: TDicomAttributes; AFileName,
  AStudyReport:
  AnsiString);
  function NeedAddData: Integer;
  var
    i: Integer;
    das1: TDicomAttributes;
  begin
    Result := -1;
    for i := 0 to ADataset.GetCount - 1 do
    begin
      das1 := ADataset.GetAttributes(i);
      if (das1.GetString($4, $1430) = 'PATIENT') and (das1.GetString($10, $10) = as1.GetString($10,
        $10)) then
      begin
        Result := i;
        exit;
      end;
    end;
  end;
var
  da1: TDicomAttributes;
  i: Integer;
begin
  i := NeedAddData;
  if i < 0 then
  begin
    da1 := TDicomAttributes.Create;
    da1.AddVariant($4, $1400, 0);
    da1.AddVariant($4, $1410, 65535);
    da1.AddVariant($4, $1420, 0);
    da1.AddVariant($4, $1430, 'PATIENT');
    da1.AddVariant($10, $10, as1.GetString($10, $10));
    da1.AddVariant($10, $20, as1.GetString($10, $20));
    da1.AddVariant($10, $30, as1.GetString($10, $30));
    da1.AddVariant($10, $40, as1.GetString($10, $40));
    da1.AddVariant($10, $4000, as1.GetString($10, $4000));
    i := ADataset.AddData(da1);
  end;
  AddStudyToDICOMDIR(ADataset, as1, AFileName, AStudyReport, i);
end;

procedure SaveDicomDatasetsToDicomDir(ADatasets: TDicomDatasets; BaseDir: AnsiString;
  AOnlySaveKeyImage: Boolean);
var
  i: Integer;
  dd1: TDicomDataset;
  dicomdir: TDicomDataset;
  filename1, str1: AnsiString;
  da1: TDicomAttribute;
begin
  if not DirectoryExists(BaseDir) then
    CreateDir(BaseDir);
  dicomdir := TDicomDataset.Create;
  try
    //38[0004:1130](FileSetID)CS=<1>DICOMDIR_PAK_LT
    //41[0004:1200](RootDirectoryFirstRecord)UL=<1>394
    //42[0004:1202](RootDirectoryLastRecord)UL=<1>394
    //43[0004:1212](FileSetConsistencyFlag)US=<1>0
    dicomdir.Attributes.AddVariant($0004, $1130, 'DicomVCL');
    dicomdir.Attributes.AddVariant($0004, $1200, $180);
    dicomdir.Attributes.AddVariant($0004, $1202, $180);
    dicomdir.Attributes.AddVariant($0004, $1212, 0);
    //    dicomdir.FAttributes.Add()
    da1 := dicomdir.Attributes.Add(4, $1220);

    dicomdir.Attributes.Add($FFFC, $FFFC);
    if BaseDir[Length(BaseDir)] <> '\' then
      BaseDir := BaseDir + '\';
    for i := ADatasets.GetCount - 1 downto 0 do
    begin
      filename1 := BaseDir + 'FILE' + IntToStr(i);
      dd1 := ADatasets.Item[i];
      if AOnlySaveKeyImage then
        if not dd1.Attributes.MultiSelected2 then
          continue;
      if assigned(dd1.Attributes.ImageData) and (dd1.Attributes.ImageData.Bits <= 8) then
        dd1.SaveToFile(filename1, true, JPEGBaseline, 100)
      else
        dd1.SaveToFile(filename1, true, 8194, 100);
      str1 := Copy(filename1, Length(BaseDir) + 1, Length(filename1) - Length(BaseDir));
      AddPatientToDICOMDIR(da1, dd1.Attributes, str1, '');
    end;
  finally
    dicomdir.SaveDicomDirToFile(BaseDir + 'DICOMDIR');
    dicomdir.Free;
  end;
end;

procedure SaveDicomDatasetsAsHtml(AHosName: AnsiString; ADatasets: TDicomDatasets; BaseDir: AnsiString;
  AOnlySaveKeyImage, AWithLabel: Boolean);
  procedure SaveToMpeg(da1: TDicomAttributes; Afilename: AnsiString);
  var
    i, k: integer;
    fs: TFileStream;
    mpg: TMpeg;
    bm, bm1: TBitmap;
  begin
    k := 16;
    mpg := TMpeg.Create;
    bm := TBitmap.Create;
    bm1 := TBitmap.Create;
    if (da1.ImageData.Width mod k) <> 0 then
      bm1.Width := (da1.ImageData.Width div k + 1) * k
    else
      bm1.Width := da1.ImageData.Width;
    if (da1.ImageData.Height mod k) <> 0 then
      bm1.Height := (da1.ImageData.Height div k + 1) * k
    else
      bm1.Height := da1.ImageData.Height;
    bm1.PixelFormat := pf24bit;
    // Initalization - Create a MPEG stream 400x96 pixels, base frequency
    // is 24 hz but it will be divided by 48 to provide 0.5 hz (one image
    // every 2 seconds). [The demo version has Height fixed to 96];

    fs := TFileStream.Create(Afilename, fmcreate);
    try
      //      mpg.Open(da1.ImageData.Width, da1.ImageData.Height, QUANTCODE[0], 100, bf24hz, fs);
      mpg.Open(bm1.Width, bm1.Height, QUANTCODE[0], 1000 div 25, bf25hz, fs);
      for i := 0 to da1.ImageData.FrameCount - 1 do
      begin
        da1.ImageData.CurrentFrame := i;

        DCM_ImageData_Bitmap.AssignToBitmap(da1.ImageData, bm);

        bm1.Canvas.Draw((bm1.Width - bm.Width) div 2, (bm1.height - bm.height) div 2, bm);
        mpg.AddIImage(bm1);
        //mpg.Keep(24 * 2 - 1); // Keep the frame for 2 seconds.
      end;
    finally
      mpg.Close; // Closes the stream and flush the buffers
      fs.Free;
      mpg.Free;
      bm.Free;
      bm1.Free;
    end;
    //    ShowMessage('іЙ№¦');
  end;
var
  strs: TStrings;
  i: Integer;
  dd1: TDicomDataset;
  //  dicomdir: TDicomDataset;
  filename1, str1: AnsiString;
  //  da1: TDicomAttribute;
  bm: TBitmap;

  ProcessBarForm: TImportAVIProcessBarForm;
begin
  str1 := BaseDir;
  if str1[Length(str1)] <> '\' then
    str1 := str1 + '\';
  strs := TStringList.Create;
  try
    strs.Add('<html>');
    strs.Add('<head>');
    strs.Add('<title>' + AHosName + '-PACS</title>');
    strs.Add('</head>');
    strs.Add('<body>');

    ProcessBarForm := TImportAVIProcessBarForm.Create(nil);
    try
      ProcessBarForm.ProgressBar1.Position := 1;
      ProcessBarForm.ProgressBar1.Max := ADatasets.GetCount;
      ProcessBarForm.Show;
      ProcessBarForm.Update;

      for i := ADatasets.GetCount - 1 downto 0 do
      begin
        filename1 := BaseDir + 'FILE' + IntToStr(i);
        dd1 := ADatasets.Item[i];
        if AOnlySaveKeyImage then
          if (dd1.Attributes.MultiSelected2 or dd1.Attributes.MultiSelected1) then
          begin

          end
          else
            continue;
        if dd1.Attributes.ImageData = nil then
          continue;
        if dd1.Attributes.ImageData.FrameCount > 1 then
        begin
          SaveToMpeg(dd1.Attributes, str1 + IntToStr(i) + '.mpg');

          //        mcdb.InsertFile('\', str1 + IntToStr(i) + '.mpg', false);
          {        strs.Add('<h1><img src="' + IntToStr(i) + '.mpg" width="' +
                    IntToStr(dd1.Attributes.ImageData.Width) + '" height="' +
                    IntToStr(dd1.Attributes.ImageData.Height) +
                    '" border="0" alt=""></h1>');}
        end;
        //      else
        begin
          bm := TBitmap.Create;

          DCM_ImageData_Bitmap.AssignToBitmap(dd1.Attributes.ImageData, bm, AWithLabel);

          //bm.SaveToFile(str1 + IntToStr(i) + '.bmp');

          //        mcdb.InsertFile('\', str1 + IntToStr(i) + '.bmp', false);
          strs.Add('<h1><img src="' + IntToStr(i) + '.jpg" width="' +
            IntToStr(dd1.Attributes.ImageData.Width) + '" height="' +
            IntToStr(dd1.Attributes.ImageData.Height) +
            '" border="0" alt=""></h1>');

          with TJpegGraphic.Create do
          try
            SaveQuality := 100;
            assign(bm);
            SaveToFile(str1 + IntToStr(i) + '.jpg');
          finally
            Free;
          end; //JPEG try..finally}

          bm.Free;
        end;
        ProcessBarForm.ProgressBar1.Position := ADatasets.GetCount - i;
        Application.ProcessMessages;
        if ProcessBarForm.fAbort then
        begin
          if (MessageDlg('Are you want to abort Import', mtConfirmation, [mbYes, mbNo], 0) =
            mrYes) then
            break;
        end;

      end;
      strs.Add('</body>');
      strs.Add('</html>');
      strs.SaveToFile(str1 + 'index.htm');

    finally
      ProcessBarForm.Free;
    end;
  finally
    strs.Free;
  end;
end;

procedure SaveDicomImage(LocaleImagePath: AnsiString; ADataset: TDicomDataset);
  procedure SetDir(ADir: AnsiString);
  begin
    if ADir <> '' then
    begin
      if not DirectoryExists(ADir) then
        if not CreateDir(ADir) then
          raise Exception.Create('Cannot create ' + ADir);
      SetCurrentDir(ADir);
    end;
  end;
var
  InstanceUID, aid, seriesuid, studyuid, studyid: AnsiString;
  //  date1: TDatetime;
    //  a1: TDicomAttribute;
begin
  studyid := ADataset.Attributes.GetString($20, $10);

  studyuid := ADataset.Attributes.GetString($20, $D);
  if studyuid = '' then
    studyuid := '1.826.' + FormatDatetime('yyyymmdd', date) + '.' + studyid;

  seriesuid := ADataset.Attributes.GetString($20, $E);
  if SeriesuID = '' then
    seriesuid := ADataset.Attributes.GetString($20, $11);

  aid := ADataset.Attributes.GetString($20, $13);
  if aid = '' then
    aid := ADataset.Attributes.GetString($20, $12);
  InstanceUID := ADataset.Attributes.GetString($8, $18);

  SetDir(LocaleImagePath);
  //
  SetDir(studyuid);
  SetDir(seriesuid);
  (*    if (ImageType = 'CT') or (ImageType = 'MR') {or (ImageType = 'DR')} then
        ADataset.SaveToFile(AID + '.dcm', true, ExplicitVRLittleEndian, 100)
      else
        ADataset.SaveToFile(AID + '.dcm', true, JPEGBaseline, 100);*)
  ADataset.SaveToFile(AID + '.dcm', true, ExplicitVRLittleEndian, 100);
end;

function CopyAttributes(ADataset: TDicomAttributes): TDicomAttributes;
var
  Stm1: TMemoryStream;
begin
  Result := TDicomAttributes.Create;
  Stm1 := TMemoryStream.Create;
  try
    ADataset.Write(stm1, ImplicitVRLittleEndian, 100);
    stm1.Position := 0;
    Result.ReadData(0, stm1, ImplicitVRLittleEndian);
  finally
    Stm1.Free;
  end;
end;

procedure printBitmap(ACanvas: TCanvas; DestRect: TRect; Bitmap: TBitmap);
var
  BitmapHeader: pBitmapInfo;
  BitmapImage: Pointer;
  HeaderSize: DWORD; // D3/D4 compatibility
  ImageSize: DWORD;
  //  w, h: Integer;
  hImage: THandle;
begin
  ACanvas.Lock;
  try

    GetDIBSizes(Bitmap.Handle, HeaderSize, ImageSize);
    GetMem(BitmapHeader, HeaderSize);
    //GetMem(BitmapImage, ImageSize);
    //BitmapHeader := MemAlloc(HeaderSize);
    try
      hImage := GlobalAlloc(GMEM_FIXED, ImageSize);
      BitmapImage := GlobalLock(hImage);

      try
        SetStretchBltMode(ACanvas.Handle, STRETCH_DELETESCANS);
        GetDIB(Bitmap.Handle, Bitmap.Palette, BitmapHeader^, BitmapImage^);
        StretchDIBits(ACanvas.Handle,
          DestRect.Left, DestRect.Top, {Destination Origin}
          DestRect.Right - DestRect.Left, {Destination Width}
          DestRect.Bottom - DestRect.Top, {Destination Height}
          0, 0, {Source Origin}
          Bitmap.Width, Bitmap.Height, {Source Width & Height}
          BitmapImage,
          TBitmapInfo(BitmapHeader^),
          DIB_RGB_COLORS,
          SRCCOPY)
      finally
        //FreeMem(BitmapHeader);
        //FreeMem(BitmapImage);
        GlobalUnLock(hImage);
        GlobalFree(hImage);

      end;
    finally
      FreeMem(BitmapHeader, HeaderSize);
    end;
  finally
    ACanvas.Unlock;
  end;
end;

procedure PrintBitmapEx(aCanvas: TCanvas; Dest: TRect; Bitmap: TBitmap);
var
  Info: PBitmapInfo;
  InfoSize: DWORD;
  Image: Pointer;
  //
  //    PATCH: MEMORY ALLOCATION PROBLEM
  //    --------------------------------
  //
  HInfo: HGLOBAL; //Declare this new var
  HImage: HGLOBAL; //Declare this new var
  //
  //    PATCH: END
  //    ----------
  //
  {$IFDEF ver80}
  ImageSize: Longint;
  {$ELSE}
  ImageSize: DWord;
  {$ENDIF}
begin
  with Bitmap do
  begin
    GetDIBSizes(Handle, InfoSize, ImageSize);
    //
    //    PATCH: MEMORY ALLOCATION PROBLEM
    //    --------------------------------
    //
    // This is the source of the problem. AllocMem allocates a memory block on    the
    // heap but windows sometimes (expecially during slow down) needs to move to
    // another area. The pointer is not updated so quick report prints a black    box.
    //
    //      Info := AllocMem(InfoSize);
    //
    // The GlobalAlloc function allocates memory on the heap(This Win32 API
    // doesn't make difference between local and global heap)
    // The second line is the most important. We lock the memory allocated so    that
    // windows will never move it and our bitmap pointer will always point to    the
    // right memory address.
    //
    HInfo := GlobalAlloc(GMEM_MOVEABLE or GMEM_SHARE, InfoSize);
    Info := PBitmapInfo(GlobalLock(HInfo));
    //
    //    PATCH: END
    //    ----------
    //
    try
      //
      //    PATCH: MEMORY ALLOCATION PROBLEM
      //    --------------------------------
      //
      //        Image := AllocMem(ImageSize);
      //
      HImage := GlobalAlloc(GMEM_MOVEABLE or GMEM_SHARE, ImageSize);
      Image := Pointer(GlobalLock(HImage));
      //
      //    PATCH: END
      //    ----------
      //
      try
        GetDIB(Handle, Palette, Info^, Image^);
        if not Monochrome then
          SetStretchBltMode(ACanvas.Handle, STRETCH_DELETESCANS);
        with Info^.bmiHeader do
          StretchDIBits(aCanvas.Handle, Dest.Left, Dest.Top,
            Dest.RIght - Dest.Left, Dest.Bottom - Dest.Top,
            0, 0, biWidth, biHeight, Image, Info^, DIB_RGB_COLORS,
            SRCCOPY);
      finally
        //
        //    PATCH: MEMORY ALLOCATION PROBLEM
        //    --------------------------------
        //
        //          FreeMem(Image, ImageSize);
        GlobalUnlock(HImage); // We first unlock the previously        locked memory
        GlobalFree(HImage); // and then we free it
        //
        //    PATCH: END
        //    ----------
        //
      end;
    finally
      //
      //    PATCH: MEMORY ALLOCATION PROBLEM
      //    --------------------------------
      //
      //          FreeMem(Info, InfoSize);
      GlobalUnlock(HInfo); // We first unlock the previously locked memory
      GlobalFree(HInfo); // and then we free it
      //
      //    PATCH: END
      //    ----------
      //
    end;
  end;
end;

(*
procedure printBitmap(ACanvas: TCanvas; DestRect: TRect; Bitmap: TBitmap);
var
  BitmapHeader: pBitmapInfo;
  BitmapImage: Pointer;
  HeaderSize: DWORD; // D3/D4 compatibility
  ImageSize: DWORD;
  //  w, h: Integer;
begin
  ACanvas.Lock;
  try
    GetDIBSizes(Bitmap.Handle, HeaderSize, ImageSize);
    GetMem(BitmapHeader, HeaderSize);
    GetMem(BitmapImage, ImageSize);
    ACanvas.Lock;
    Bitmap.Canvas.Lock;
    try
      SetStretchBltMode(ACanvas.Handle, STRETCH_DELETESCANS);
      GetDIB(Bitmap.Handle, Bitmap.Palette, BitmapHeader^, BitmapImage^);
      StretchDIBits(ACanvas.Handle,
        DestRect.Left, DestRect.Top, {Destination Origin}
        DestRect.Right - DestRect.Left, {Destination Width}
        DestRect.Bottom - DestRect.Top, {Destination Height}
        0, 0, {Source Origin}
        Bitmap.Width, Bitmap.Height, {Source Width & Height}
        BitmapImage,
        TBitmapInfo(BitmapHeader^),
        DIB_RGB_COLORS,
        SRCCOPY)
    finally
      FreeMem(BitmapHeader);
      FreeMem(BitmapImage);
      Bitmap.Canvas.UnLock;
      ACanvas.UnLock;
    end;
  finally
    ACanvas.Unlock;
  end;
end;*)

function NewImage(ADataset: TDicomAttributes; ABitmap: TBitmap; AIsMONOCHROME: Boolean):
  TDicomAttributes;
var
  dimage: TDicomImageData;
  p1: Pointer;
  pb2, pb1: PByte;
  ALen, x, y: Integer;
  DestScanLine: pRGB;
  prgb1: pRGB;
  pw1: pRGBS;
begin
  Result := ADataset;
  Result.Clear;
  //  Result.AddVariant(dPatientName, Patientname);
  //  Result.AddVariant(dPatientID, PatientID);

  //  Result.AddVariant(dStudyInstanceUID, StudyUID);
  //  Result.AddVariant(dSeriesInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex));
//    Result.AddVariant(dSOPInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex) + '.' + IntToStr(AImageIndex + 1));

  Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
  //SOP CLASS
  //1.2.840.10008.5.1.4.1.1.2  CT
  //1.2.840.10008.5.1.4.1.1.7  secondary capture

  Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
  //  Result.AddVariant(8, $60, AModility);
  Result.AddVariant(8, $70, 'DicomVCL');

  Result.Add(8, $20).AsDatetime[0] := now;
  Result.Add(8, $21).AsDatetime[0] := now;
  Result.Add(8, $23).AsDatetime[0] := now;
  Result.Add(8, $30).AsDatetime[0] := now;
  Result.Add(8, $33).AsDatetime[0] := now;
  //  Result.AddVariant($20, $13, AImageIndex);
  Result.AddVariant($28, $11, ABitmap.Width);
  Result.AddVariant($28, $10, ABitmap.Height);
  //    if not AIsMONOCHROME then
  if (not AIsMONOCHROME) and ((ABitmap.PixelFormat = pf24bit) or (ABitmap.PixelFormat = pf32bit))
    then
  begin
    Result.AddVariant($28, $2, 3);
    Result.AddVariant($28, $4, 'RGB');
    ALen := ABitmap.Width * ABitmap.Height * 3;
  end
  else
    if (AIsMONOCHROME) or (ABitmap.PixelFormat = pf8bit) then
  begin
    Result.AddVariant($28, $2, 1);
    Result.AddVariant($28, $4, 'MONOCHROME2');
    ALen := ABitmap.Width * ABitmap.Height;
  end
  else
    raise Exception.Create(V_NOT_SUPPORT_BITMAP_FORMAT);
  Result.AddVariant($28, $100, 8);
  Result.AddVariant($28, $101, 8);
  Result.AddVariant($28, $102, 7);
  Result.AddVariant($28, $103, 0);
  Result.AddVariant($28, $6, 0);
  Getmem(p1, Alen);
  if (ABitmap.PixelFormat = pf32bit) then
  begin
    if not AIsMONOCHROME then
    begin
      prgb1 := p1;
      for y := 0 to ABitmap.Height - 1 do // Iterate
      begin
        pw1 := ABitmap.ScanLine[y];
        for x := 0 to ABitmap.Width - 1 do
        begin
          prgb1^.b := pw1^.r;
          prgb1^.g := pw1^.g;
          prgb1^.r := pw1^.b;

          inc(prgb1);
          inc(pw1);
        end;
      end; // for
    end
    else
    begin
      pb1 := p1;
      for y := 0 to ABitmap.Height - 1 do // Iterate
      begin
        pw1 := ABitmap.ScanLine[y];
        for x := 0 to ABitmap.Width - 1 do
        begin
          //pb1^ := pw1^.g;
          pb1^ := Trunc(0.3 * pw1^.R + 0.59 * pw1^.G + 0.11 * pw1^.B);

          inc(pb1);
          inc(pw1);
        end;
      end; // for
    end;
  end
  else
    if (ABitmap.PixelFormat = pf24bit) then
  begin
    if not AIsMONOCHROME then
    begin
      prgb1 := p1;
      for y := 0 to ABitmap.Height - 1 do // Iterate
      begin
        DestScanline := ABitmap.ScanLine[y];
        for x := 0 to ABitmap.Width - 1 do
        begin
          prgb1^.b := DestScanLine^.r;
          prgb1^.g := DestScanLine^.g;
          prgb1^.r := DestScanLine^.b;

          inc(prgb1);
          inc(DestScanline);
        end;
      end; // for
    end
    else
    begin
      pb1 := p1;
      for y := 0 to ABitmap.Height - 1 do // Iterate
      begin
        DestScanline := ABitmap.ScanLine[y];
        for x := 0 to ABitmap.Width - 1 do
        begin
          pb1^ := DestScanLine^.g;
          pb1^ := Trunc(0.3 * DestScanLine^.R + 0.59 * DestScanLine^.G + 0.11 * DestScanLine^.B);

          inc(pb1);
          inc(DestScanline);
        end;
      end; // for
    end;
  end
  else
  begin
    pb1 := p1;
    for y := 0 to ABitmap.Height - 1 do // Iterate
    begin
      pb2 := ABitmap.ScanLine[y];
      for x := 0 to ABitmap.Width - 1 do
      begin
        pb1^ := pb2^;
        inc(pb1);
        inc(pb2);
      end;
    end; // for
  end;
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  Result.Add(32736, 16).AddData(dimage);
end;

function NewImage(ABitmap: TBitmap; AIsMONOCHROME: Boolean): TDicomAttributes;
var
  dimage: TDicomImageData;
  p1: Pointer;
  pb2, pb1: PByte;
  ALen, x, y: Integer;
  DestScanLine: pRGB;
  prgb1: pRGB;
begin
  Result := TDicomAttributes.Create;
  //  Result.AddVariant(dPatientName, Patientname);
  //  Result.AddVariant(dPatientID, PatientID);

  //  Result.AddVariant(dStudyInstanceUID, StudyUID);
  //  Result.AddVariant(dSeriesInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex));
//    Result.AddVariant(dSOPInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex) + '.' + IntToStr(AImageIndex + 1));

  Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
  //SOP CLASS
  //1.2.840.10008.5.1.4.1.1.2  CT
  //1.2.840.10008.5.1.4.1.1.7  secondary capture

  Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
  //  Result.AddVariant(8, $60, AModility);
  Result.AddVariant(8, $70, 'DicomVCL');

  Result.Add(8, $20).AsDatetime[0] := now;
  Result.Add(8, $21).AsDatetime[0] := now;
  Result.Add(8, $23).AsDatetime[0] := now;
  Result.Add(8, $30).AsDatetime[0] := now;
  Result.Add(8, $33).AsDatetime[0] := now;
  //  Result.AddVariant($20, $13, AImageIndex);
  Result.AddVariant($28, $11, ABitmap.Width);
  Result.AddVariant($28, $10, ABitmap.Height);
  //    if not AIsMONOCHROME then
  if (not AIsMONOCHROME) and (ABitmap.PixelFormat = pf24bit) then
  begin
    Result.AddVariant($28, $2, 3);
    Result.AddVariant($28, $4, 'RGB');
    ALen := ABitmap.Width * ABitmap.Height * 3;
  end
  else
    if (ABitmap.PixelFormat = pf8bit) or AIsMONOCHROME then
  begin
    Result.AddVariant($28, $2, 1);
    Result.AddVariant($28, $4, 'MONOCHROME2');
    ALen := ABitmap.Width * ABitmap.Height;
  end
  else
    if (ABitmap.PixelFormat = pfDevice) then  // ECG Format - without image
  begin
    exit;
  end  
  else
    raise Exception.Create(V_NOT_SUPPORT_BITMAP_FORMAT);
  Result.AddVariant($28, $100, 8);
  Result.AddVariant($28, $101, 8);
  Result.AddVariant($28, $102, 7);
  Result.AddVariant($28, $103, 0);
  Result.AddVariant($28, $6, 0);
  Getmem(p1, Alen);
  if (ABitmap.PixelFormat = pf24bit) then
  begin
    if not AIsMONOCHROME then
    begin
      prgb1 := p1;
      for y := 0 to ABitmap.Height - 1 do // Iterate
      begin
        DestScanline := ABitmap.ScanLine[y];
        for x := 0 to ABitmap.Width - 1 do
        begin
          prgb1^.b := DestScanLine^.r;
          prgb1^.g := DestScanLine^.g;
          prgb1^.r := DestScanLine^.b;

          inc(prgb1);
          inc(DestScanline);
        end;
      end; // for
    end
    else
    begin
      pb1 := p1;
      for y := 0 to ABitmap.Height - 1 do // Iterate
      begin
        DestScanline := ABitmap.ScanLine[y];
        for x := 0 to ABitmap.Width - 1 do
        begin
          pb1^ := DestScanLine^.g;
          inc(pb1);
          inc(DestScanline);
        end;
      end; // for
    end;
  end
  else
  begin
    pb1 := p1;
    for y := 0 to ABitmap.Height - 1 do // Iterate
    begin
      pb2 := ABitmap.ScanLine[y];
      for x := 0 to ABitmap.Width - 1 do
      begin
        pb1^ := pb2^;
        inc(pb1);
        inc(pb2);
      end;
    end; // for
  end;
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  Result.Add(32736, 16).AddData(dimage);
end;

function NewImage(ADa: TDicomAttributes): TDicomAttributes;
var
  dimage: TDicomImageData;
  p1: Pointer;
  ALen: Integer;
begin
  Result := TDicomAttributes.Create;
  Result.AddVariant(8, $16, ada.GetString(8, $16)); //sc
  Result.AddVariant(8, 8, ada.GetString(8, 8));
  //  Result.AddVariant(8, $60, AModility);
  Result.AddVariant(8, $70, 'DicomVCL');

  Result.Add(8, $20).AsDatetime[0] := now;
  Result.Add(8, $21).AsDatetime[0] := now;
  Result.Add(8, $23).AsDatetime[0] := now;
  Result.Add(8, $30).AsDatetime[0] := now;
  Result.Add(8, $33).AsDatetime[0] := now;
  //  Result.AddVariant($20, $13, AImageIndex);
  Result.AddVariant($28, $11, ada.ImageData.Width);
  Result.AddVariant($28, $10, ada.ImageData.Height);
  //    if not AIsMONOCHROME then
  Result.AddVariant($28, $2, 1);
  Result.AddVariant($28, $4, 'MONOCHROME2');
  ALen := ada.ImageData.ImageData[0].Len;
  Result.AddVariant($28, $100, ada.GetString($28, $100));
  Result.AddVariant($28, $101, ada.GetString($28, $101));
  Result.AddVariant($28, $102, ada.GetString($28, $102));

  Result.AddVariant($28, $1050, ada.ImageData.WindowCenter);
  Result.AddVariant($28, $1051, ada.ImageData.WindowWidth);

  Getmem(p1, Alen);
  Move((ada.ImageData.ImageData[0].Data)^, p1^, alen);
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  Result.Add(32736, 16).AddData(dimage);
end;

function NewImage(ABitmap: PBITMAPINFO; AIsMONOCHROME: Boolean): TDicomAttributes;
type
  TRGBQUADARRAY = array[0..Maxint div 16] of TRGBQUAD;
  PRGBQUADARRAY = ^TRGBQUADARRAY;
var
  dimage: TDicomImageData;
  p1: Pointer;
  pb2, pb1: PByte;
  ALen, x, y: Integer;
  prgb1: pRGB;
  bits, bits2: pbyte;
begin
  Result := TDicomAttributes.Create;

  Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
  //SOP CLASS
  //1.2.840.10008.5.1.4.1.1.2  CT
  //1.2.840.10008.5.1.4.1.1.7  secondary capture

  Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
  //  Result.AddVariant(8, $60, AModility);
  Result.AddVariant(8, $70, 'DicomVCL');

  Result.Add(8, $20).AsDatetime[0] := now;
  Result.Add(8, $21).AsDatetime[0] := now;
  Result.Add(8, $23).AsDatetime[0] := now;
  Result.Add(8, $30).AsDatetime[0] := now;
  Result.Add(8, $33).AsDatetime[0] := now;
  //  Result.AddVariant($20, $13, AImageIndex);
  Result.AddVariant($28, $11, ABitmap^.bmiHeader.biWidth);
  Result.AddVariant($28, $10, ABitmap^.bmiHeader.biHeight);
  //    if not AIsMONOCHROME then
  if (not AIsMONOCHROME) and (ABitmap^.bmiHeader.biBitCount = 24) then
  begin
    Result.AddVariant($28, $2, 3);
    Result.AddVariant($28, $4, 'RGB');
    ALen := ABitmap^.bmiHeader.biWidth * ABitmap^.bmiHeader.biHeight * 3;
  end
  else
    if (ABitmap.bmiHeader.biBitCount = 8) or AIsMONOCHROME then
  begin
    Result.AddVariant($28, $2, 1);
    Result.AddVariant($28, $4, 'MONOCHROME2');
    ALen := ABitmap.bmiHeader.biWidth * ABitmap.bmiHeader.biHeight;
  end
  else
    raise Exception.Create(V_NOT_SUPPORT_BITMAP_FORMAT);
  Result.AddVariant($28, $100, 8);
  Result.AddVariant($28, $101, 8);
  Result.AddVariant($28, $102, 7);
  Result.AddVariant($28, $103, 0);
  Result.AddVariant($28, $6, 0);
  Getmem(p1, Alen);
  bits := pbyte(ABitmap);
  inc(bits, sizeof(TBITMAPINFOHEADER));
  if (ABitmap^.bmiHeader.biBitCount = 24) then
  begin
    if not AIsMONOCHROME then
    begin
      prgb1 := p1;
      for y := 0 to ABitmap^.bmiHeader.biHeight - 1 do // Iterate
      begin
        bits2 := bits;
        inc(bits2, (ABitmap^.bmiHeader.biHeight - y - 1) * ABitmap^.bmiHeader.biWidth * 3);
        CopyMemory(prgb1, bits2, ABitmap^.bmiHeader.biWidth * 3);
        inc(prgb1, ABitmap^.bmiHeader.biWidth);
      end; // for   }
    end
    else
    begin
      pb1 := p1;
      for y := 0 to ABitmap^.bmiHeader.biHeight - 1 do // Iterate
      begin
        bits2 := bits;
        inc(bits2, (ABitmap^.bmiHeader.biHeight - y - 1) * ABitmap^.bmiHeader.biWidth * 3);
        for x := 0 to ABitmap^.bmiHeader.biWidth - 1 do
        begin
          pb1^ := bits2^;
          inc(bits2, 3);
          inc(pb1);
        end;
      end; // for
    end;
  end
  else
  begin
    pb1 := p1;
    for y := 0 to ABitmap^.bmiHeader.biHeight - 1 do // Iterate
    begin
      for x := 0 to ABitmap^.bmiHeader.biWidth - 1 do
      begin
        pb1^ := pb2^;
        inc(pb1);
        inc(pb2);
      end;
    end; // for
  end;
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  Result.Add(32736, 16).AddData(dimage);
end;

function AssignedImage(ASource: TDicomAttributes; ABitmap: TBitmap; AIsMONOCHROME: Boolean):
  Boolean;
var
  dimage: TDicomImageData;
  p1: Pointer;
  pb2, pb1: PByte;
  ALen, x, y: Integer;
  DestScanLine: pRGB;
  prgb1: pRGB;
  da1: TDicomAttribute;
begin
  ASource.AddVariant($28, $11, ABitmap.Width);
  ASource.AddVariant($28, $10, ABitmap.Height);
  if (not AIsMONOCHROME) and (ABitmap.PixelFormat = pf24bit) then
  begin
    ASource.AddVariant($28, $2, 3);
    ASource.AddVariant($28, $4, 'RGB');
    ALen := ABitmap.Width * ABitmap.Height * 3;
  end
  else
    if (ABitmap.PixelFormat = pf8bit) or AIsMONOCHROME then
  begin
    ASource.AddVariant($28, $2, 1);
    ASource.AddVariant($28, $4, 'MONOCHROME2');
    ALen := ABitmap.Width * ABitmap.Height;
  end
  else
    raise Exception.Create(V_NOT_SUPPORT_BITMAP_FORMAT);
  ASource.AddVariant($28, $100, 8);
  ASource.AddVariant($28, $101, 8);
  ASource.AddVariant($28, $102, 7);
  ASource.AddVariant($28, $103, 0);
  ASource.AddVariant($28, $6, 0);
  Getmem(p1, Alen);
  if (ABitmap.PixelFormat = pf24bit) then
  begin
    if not AIsMONOCHROME then
    begin
      prgb1 := p1;
      for y := 0 to ABitmap.Height - 1 do // Iterate
      begin

        DestScanline := ABitmap.ScanLine[y];
        for x := 0 to ABitmap.Width - 1 do
        begin
          prgb1^.r := DestScanLine^.r;
          prgb1^.g := DestScanLine^.g;
          prgb1^.b := DestScanLine^.b;

          inc(prgb1);
          inc(DestScanline);
        end;
      end; // for
    end
    else
    begin
      pb1 := p1;
      for y := 0 to ABitmap.Height - 1 do // Iterate
      begin
        DestScanline := ABitmap.ScanLine[y];
        for x := 0 to ABitmap.Width - 1 do
        begin
          pb1^ := DestScanLine^.g;
          inc(pb1);
          inc(DestScanline);
        end;
      end; // for
    end;
  end
  else
  begin
    pb1 := p1;
    for y := 0 to ABitmap.Height - 1 do // Iterate
    begin
      pb2 := ABitmap.ScanLine[y];
      for x := 0 to ABitmap.Width - 1 do
      begin
        pb1^ := pb2^;
        inc(pb1);
        inc(pb2);
      end;
    end; // for
  end;
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  ASource.Remove(32736, 16);
  da1 := ASource.Add(32736, 16);
  da1.AddData(dimage);

  Result := true;
end;

function ConvertISO1022(AStr: AnsiString): AnsiString;
var
  i, k1, k2: integer;
  //  b1: Byte;
begin
  Result := '';
  i := 1;
  k1 := 0;
  k2 := 0;
  while i <= Length(AStr) do
  begin
    if ord(AStr[i]) >= $80 then
    begin
      if k1 = 0 then
      begin
        Result := Result + #$1B + #$24 + #$29 + #$41 + AStr[i];
        k1 := 1;
        k2 := 0;
      end
      else
        Result := Result + AStr[i];
    end
    else
    begin
      if k2 = 0 then
      begin
        Result := Result + #$1B + #$28 + #$42 + AStr[i];
        k2 := 1;
        k1 := 0;
      end
      else
        Result := Result + AStr[i];
    end;
    inc(i);
  end;
end;

function FilterISO1022(AStr: AnsiString): AnsiString;
{A. ФЪЅшИлєєЧЦµДESC sequence(1B 24 29 41)
B. ФЪЅшИлASCIIµДESC sequence(1B 28 42)
2.єєЧЦК№УГµДКЗ»ъЖчДЪВл(ГїёцЧЦЅЪµДЧоёЯО»ОЄ1)}
var
  i: integer;
begin
  Result := '';
  i := 1;
  while i <= Length(AStr) do
  begin
    if AStr[i] = #$1B then
    begin
      if AStr[i] = #$24 then
        inc(i, 4)
      else //#$28
        inc(i, 3);
    end
    else
      if AStr[i] = '^' then
    begin
      inc(i, 1);
    end
    else
      if AStr[i] = '=' then
    begin
      Result := Result + ' ';
      inc(i, 1);
    end
    else
    begin
      Result := Result + AStr[i];
      inc(i);
    end;
  end;
  //Result := AStr;
end;

{$IFNDEF LEVEL6}

function CompareValue(k1, k2: Integer): Integer; overload;
begin
  if k1 > k2 then
    Result := 1
  else
    if k1 < k2 then
    Result := -1
  else
    Result := 0;
end;

function CompareValue(k1, k2: TDatetime): Integer; overload;
begin
  if k1 > k2 then
    Result := 1
  else
    if k1 < k2 then
    Result := -1
  else
    Result := 0;
end;

function CompareValue(k1, k2, f1: Double): Integer; overload;
begin
  if (k1 - k2) > f1 then
    Result := 1
  else
    if (k1 - k2) < -f1 then
    Result := -1
  else
    Result := 0;
end;
{$ENDIF}

function CompareString(Str1, Str2: string): Integer;
begin
  if Str1 > Str2 then
    Result := 1
  else
    if Str1 < Str2 then
    Result := -1
  else
    Result := 0;
end;

function CompareDatetimeEx(das1, das2: TDicomDataset): Integer;
var
  da1, da2: TDicomAttribute;
  d1, d2: TDatetime;
  f1: Double;
begin
  {$IFDEF DICOMDEBUX1}
  SendDebug('Compare enter');
  {$ENDIF}
  d1 := 0;
  d2 := 0;
  f1 := 0.000001;
  Result := 0;

  da1 := das1.Attributes.Item[$8, $21];
  da2 := das2.Attributes.Item[$8, $21];
  if assigned(da1) and assigned(da2) and (da1.GetCount > 0) and (da2.GetCount > 0) then
  begin
    d1 := da1.AsDatetime[0];
    d2 := da2.AsDatetime[0];
    if (d1 - d2) > f1 then
      Result := 1
    else
      if (d1 - d2) < -f1 then
      Result := -1
    else
      Result := 0;
  end;

  if Result = 0 then
  begin
    da1 := das1.Attributes.Item[$8, $31];
    da2 := das2.Attributes.Item[$8, $31];
    if assigned(da1) and assigned(da2) and (da1.GetCount > 0) and (da2.GetCount > 0) then
    begin
      d1 := da1.AsDatetime[0];
      d2 := da2.AsDatetime[0];
      if (d1 - d2) > f1 then
        Result := 1
      else
        if (d1 - d2) < -f1 then
        Result := -1
      else
        Result := 0;
    end;
  end;
  {$IFDEF DICOMDEBUX1}
  SendDebug('Compare :' + IntToStr(Result));
  {$ENDIF}
end;

function CompareSeriesDicomDataset(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  k1, k2: Integer;
//  s1, s2: string;
//  str1, str2: AnsiString;
//  da1, da2: TDicomAttribute;
//  f1, f2: Double;
begin
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  if Assigned(das1) and Assigned(das2) then
  begin
    k1 := das1.Attributes.GetInteger($20, $11);
    k2 := das2.Attributes.GetInteger($20, $11);
    Result := CompareValue(k1, k2);
  end else
  begin
    Result:= -1 ;
  end;
  if (Result = 0) then
  begin
    //s1 := das1.Attributes.GetString($20, $E);
    //s2 := das2.Attributes.GetString($20, $E);
    //Result := CompareString(s1, s2);
    Result := CompareDatetimeEx(das1, das2);
  end;
end;

function CompareDicomDataset(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  k1, k2: Integer;
  s1, s2: string;
//  str1, str2: AnsiString;
  da1, da2: TDicomAttribute;
  f1, f2: Double;
begin
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  s1 := das1.Attributes.GetString($20, $D);
  s2 := das2.Attributes.GetString($20, $D);
  Result := CompareString(s1, s2);
  if (Result = 0) then
  begin

    k1 := das1.Attributes.GetInteger($20, $11);
    k2 := das2.Attributes.GetInteger($20, $11);
    Result := CompareValue(k1, k2);
    if (Result = 0) then
    begin
      Result := CompareDatetimeEx(das1, das2);
      if (Result = 0) then
      begin
        s1 := das1.Attributes.GetString($20, $E);
        s2 := das2.Attributes.GetString($20, $E);
        Result := CompareString(s1, s2);
        if (Result = 0) then
        begin
          k1 := das1.Attributes.GetInteger($20, $13);
          k2 := das2.Attributes.GetInteger($20, $13);
          Result := CompareValue(k1, k2);
          if (Result = 0) then
          begin
            k1 := das1.Attributes.GetInteger($20, $12);
            k2 := das2.Attributes.GetInteger($20, $12);
            Result := CompareValue(k1, k2);
            if (Result = 0) then
            begin
              da1 := das1.Attributes.Item[$8, $32];
              da2 := das2.Attributes.Item[$8, $32];
              if assigned(da1) and assigned(da2) then
              begin
                f1 := da1.AsDatetime[0];
                f2 := da2.AsDatetime[0];
                Result := CompareValue(f1, f2, 0.001);
              end
              else
              begin
                da1 := das1.Attributes.Item[$8, $33];
                da2 := das2.Attributes.Item[$8, $33];
                if assigned(da1) and assigned(da2) then
                begin
                  f1 := da1.AsDatetime[0];
                  f2 := da2.AsDatetime[0];
                  Result := CompareValue(f1, f2, 0.001);
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function CompareDicomDatasetTF(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  k1, k2: AnsiString;
begin
  //for Мм·еMR
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  k1 := das1.Attributes.GetString($8, $18);
  k2 := das2.Attributes.GetString($8, $18);
  Result := CompareStr(k1, k2);
end;

function CompareDicomDataset1(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  k1, k2: Integer;
  f1, f2: Double;
  s1, s2: string;
  da1, da2: TDicomAttribute;
  d1, d2: TDateTime;
begin
  //dsbSliceLocation
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  s1 := das1.Attributes.GetString($20, $D);
  s2 := das2.Attributes.GetString($20, $D);
  Result := CompareString(s1, s2);
  if (Result = 0) then
  begin
    k1 := das1.Attributes.GetInteger($20, $11);
    k2 := das2.Attributes.GetInteger($20, $11);
    Result := CompareValue(k1, k2);
    if (Result = 0) then
    begin
      //s1 := das1.Attributes.GetString($20, $E);
      //s2 := das2.Attributes.GetString($20, $E);
      //Result := CompareString(s1, s2);
      Result := CompareDatetimeEx(das1, das2);
      if (Result = 0) then
      begin
        s1 := das1.Attributes.GetString($20, $E);
        s2 := das2.Attributes.GetString($20, $E);
        Result := CompareString(s1, s2);
        if (Result = 0) then
        begin
          da1 := das1.Attributes.Item[$0020, $1041];
          da2 := das2.Attributes.Item[$0020, $1041];
          if assigned(da1) and assigned(da2) then
          begin
            f1 := da1.AsFloat[0];
            f2 := da2.AsFloat[0];
            Result := CompareValue(f1, f2, 0.001);
            if (Result = 0) then
            begin
              da1 := das1.Attributes.Item[$20, $13];
              da2 := das2.Attributes.Item[$20, $13];
              if assigned(da1) and assigned(da2) then
              begin
                d1 := da1.AsDatetime[0];
                d2 := da2.AsDatetime[0];
                Result := CompareValue(d1, d2);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function CompareDicomDataset2(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  s1, s2: string;
  k1, k2: Integer;
  f1, f2: Double;
  da1, da2: TDicomAttribute;
  d1, d2: TDateTime;
begin
  //dsbReverseSliceLocation
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  s1 := das1.Attributes.GetString($20, $D);
  s2 := das2.Attributes.GetString($20, $D);
  Result := CompareString(s1, s2);
  if (Result = 0) then
  begin

    k1 := das1.Attributes.GetInteger($20, $11);
    k2 := das2.Attributes.GetInteger($20, $11);
    Result := CompareValue(k1, k2);
    if (Result = 0) then
    begin
      //s1 := das1.Attributes.GetString($20, $E);
      //s2 := das2.Attributes.GetString($20, $E);
      //Result := CompareString(s1, s2);
      Result := CompareDatetimeEx(das1, das2);
      if (Result = 0) then
      begin
        s1 := das1.Attributes.GetString($20, $E);
        s2 := das2.Attributes.GetString($20, $E);
        Result := CompareString(s1, s2);
        if (Result = 0) then
        begin
          da1 := das1.Attributes.Item[$0020, $1041];
          da2 := das2.Attributes.Item[$0020, $1041];
          if assigned(da1) and assigned(da2) then
          begin
            f1 := da1.AsFloat[0];
            f2 := da2.AsFloat[0];
            Result := CompareValue(f2, f1);
            if (Result = 0) then
            begin
              da1 := das1.Attributes.Item[$20, $13];
              da2 := das2.Attributes.Item[$20, $13];
              if assigned(da1) and assigned(da2) then
              begin
                d1 := da1.AsDatetime[0];
                d2 := da2.AsDatetime[0];
                Result := CompareValue(d1, d2);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function CompareDicomDataset3(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  s1, s2: string;
  k1, k2: Integer;
  da1, da2: TDicomAttribute;
  d1, d2: TDateTime;
begin
  //dsbAcquisitionTime(0008:0022),(0008:0032);
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  s1 := das1.Attributes.GetString($20, $D);
  s2 := das2.Attributes.GetString($20, $D);
  Result := CompareString(s1, s2);
  if (Result = 0) then
  begin
    k1 := das1.Attributes.GetInteger($20, $11);
    k2 := das2.Attributes.GetInteger($20, $11);
    Result := CompareValue(k1, k2);
    if (Result = 0) then
    begin
      //s1 := das1.Attributes.GetString($20, $E);
      //s2 := das2.Attributes.GetString($20, $E);
      //Result := CompareString(s1, s2);
      Result := CompareDatetimeEx(das1, das2);
      if (Result = 0) then
      begin
        s1 := das1.Attributes.GetString($20, $E);
        s2 := das2.Attributes.GetString($20, $E);
        Result := CompareString(s1, s2);
        if (Result = 0) then
        begin
          da1 := das1.Attributes.Item[$0008, $0022];
          da2 := das2.Attributes.Item[$0008, $0022];
          if assigned(da1) and assigned(da2) then
          begin
            d1 := da1.AsDatetime[0];
            d2 := da2.AsDatetime[0];
            Result := CompareValue(d1, d2);
            if (Result = 0) then
            begin
              da1 := das1.Attributes.Item[$0008, $0032];
              da2 := das2.Attributes.Item[$0008, $0032];
              if assigned(da1) and assigned(da2) then
              begin
                d1 := da1.AsDatetime[0];
                d2 := da2.AsDatetime[0];
                Result := CompareValue(d1, d2);
                if (Result = 0) then
                begin
                  da1 := das1.Attributes.Item[$0008, $0033];
                  da2 := das2.Attributes.Item[$0008, $0033];
                  if assigned(da1) and assigned(da2) then
                  begin
                    d1 := da1.AsDatetime[0];
                    d2 := da2.AsDatetime[0];
                    Result := CompareValue(d1, d2);
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

function CompareDicomDataset4(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  s1, s2: string;
  k1, k2: Integer;
  da1, da2: TDicomAttribute;
  d1, d2: TDateTime;
begin
  //dsbImageTime(0008:0023),(0008:0033)
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  s1 := das1.Attributes.GetString($20, $D);
  s2 := das2.Attributes.GetString($20, $D);
  Result := CompareString(s1, s2);
  if (Result = 0) then
  begin

    k1 := das1.Attributes.GetInteger($20, $11);
    k2 := das2.Attributes.GetInteger($20, $11);
    Result := CompareValue(k1, k2);
    if (Result = 0) then
    begin
      //s1 := das1.Attributes.GetString($20, $E);
      //s2 := das2.Attributes.GetString($20, $E);
      //Result := CompareString(s1, s2);
      Result := CompareDatetimeEx(das1, das2);
      if (Result = 0) then
      begin
        s1 := das1.Attributes.GetString($20, $E);
        s2 := das2.Attributes.GetString($20, $E);
        Result := CompareString(s1, s2);
        if (Result = 0) then
        begin
          da1 := das1.Attributes.Item[$0008, $0022];
          da2 := das2.Attributes.Item[$0008, $0022];
          if assigned(da1) and assigned(da2) then
          begin
            d1 := da1.AsDatetime[0];
            d2 := da2.AsDatetime[0];
            Result := CompareValue(d1, d2);
            if (Result = 0) then
            begin
              da1 := das1.Attributes.Item[$0008, $0032];
              da2 := das2.Attributes.Item[$0008, $0032];
              if assigned(da1) and assigned(da2) then
              begin
                d1 := da1.AsDatetime[0];
                d2 := da2.AsDatetime[0];
                Result := CompareValue(d1, d2);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TDicomDatasets.IndexOf(ADataset: TDicomDataset): Integer;
var
  i: integer;
begin
  if OnlyViewMultiSelected2 then
  begin
    Result := -1;
    for i := 0 to Count - 1 do
      if ADataset = Item[i] then
      begin
        Result := i;
        exit;
      end;
  end
  else
    Result := FDatasetList.IndexOf(ADataset);
end;

function TDicomDatasets.GetCurrentSeriesIndex(ADataset: TDicomDataset): Integer;
var
  str1: AnsiString;
  i: Integer;
  das1: TDicomDataset;
begin
  Result := -1;
  if ADataset <> nil then
  begin
    str1 := ADataset.Attributes.GetString($20, $E);
    for i := 0 to GetSeriesCount - 1 do
    begin
      das1 := SeriesDataset[i];
      if das1.Attributes.GetString($20, $E) = str1 then
      begin
        Result := i;
        exit;
      end;
    end;
  end;
end;

function TDicomDatasets.GetCurrentSeriesStart(ADataset: TDicomDataset): Integer;
var
  str1: AnsiString;
//  i: Integer;
//  das1: TDicomDataset;
begin
  Result := -1;
  if ADataset <> nil then
  begin
    str1 := ADataset.Attributes.GetString($20, $E);
    Result := GetSeriesStart(str1);
    {for i := 0 to GetSeriesCount - 1 do
    begin
      das1 := SeriesDataset[i];
      if das1.Attributes.GetString($20, $E) = str1 then
      begin
        Result := IndexOf(das1);
        exit;
      end;
    end;}
  end;
end;

function TDicomDatasets.GetSeriesStart(ASeriesUID: AnsiString): Integer;
var
  i: Integer;
  das1: TDicomDataset;
begin
  Result := 0;
  if ASeriesUID <> '' then
    for i := 0 to FDatasetList.Count - 1 do
    begin
      das1 := TDicomDataset(FDatasetList[i]);
      if das1.Attributes.GetString($20, $E) = ASeriesUID then
      begin
        Result := IndexOf(das1);
        exit;
      end;
    end;
end;

function TDicomDatasets.GetSeriesEnd(ASeriesUID: AnsiString): Integer;
var
  i: Integer;
  das1: TDicomDataset;
begin
  Result := FDatasetList.Count;
  if ASeriesUID <> '' then
    for i := FDatasetList.Count - 1 downto 0 do
    begin
      das1 := TDicomDataset(FDatasetList[i]);
      if das1.Attributes.GetString($20, $E) = ASeriesUID then
      begin
        Result := IndexOf(das1);
        exit;
      end;
    end;
end;

procedure TDicomDatasets.SetPresentationSates(ADatasets: TDicomDatasets);
  function FindPRData(AInstUID: AnsiString): TDicomDataset;
  var
    das0, das1, das2: TDicomAttributes;
    da1, da2: TDicomAttribute;
    ADataset: TDicomDataset;
    i: Integer;
  begin
    Result := nil;
    for i := 0 to ADatasets.Count - 1 do
    begin
      ADataset := ADatasets[i];
      das0 := ADataset.Attributes;
      da1 := das0.Item[$0028, $3110];
      if assigned(da1) and (da1.GetCount > 0) then
      begin
        das1 := da1.Attributes[0];

        //is for this image?
        da2 := das1.Item[$0008, $1140];
        das2 := da2.Attributes[0];
        if das2.GetString($0008, $1155) = AInstUID then
        begin
          Result := ADataset;
          exit;
        end;
      end;
    end;
  end;
var
  das1, das2: TDicomDataset;
  i: integer;
  str1: AnsiString;
begin
  for i := 0 to self.Count - 1 do
  begin
    das1 := Item[i];
    str1 := das1.Attributes.GetString($8, $18);
    das2 := FindPRData(str1);
    if das2 <> nil then
      das1.Attributes.ImageData.SetPresentationSate(das2);
  end;
end;

procedure TDicomDatasets.SortDatasets(AMode: TDicomDatasetSortBy);
begin

  case AMode of
    //dsbImageNumber: ;
    dsbSliceLocation:
      FDatasetList.Sort(CompareDicomDataset1);
    dsbReverseSliceLocation:
      FDatasetList.Sort(CompareDicomDataset2);
    dsbAcquisitionTime:
      FDatasetList.Sort(CompareDicomDataset3);
    dsbImageTime:
      FDatasetList.Sort(CompareDicomDataset4);
  else
    FDatasetList.Sort(CompareDicomDataset);
  end;

end;

procedure TDicomDatasets.SetTopoDataset(AAttributes: TDicomAttributes);
var
  k, i: Integer;
  das2: TDicomAttributes;
  fNewObj1: TDicomDrawObject;
begin
  if AAttributes <> nil then
    FTopoDicomDatasets.Add(AAttributes);

  for k := FTopoDicomDatasets.Count - 1 to FTopoDicomDatasets.Count - 1 do
  begin

    das2 := TDicomAttributes(FTopoDicomDatasets[k]);

    for i := 0 to das2.ImageData.DrawObjects.GetCount - 1 do
    begin
      fNewObj1 := das2.ImageData.DrawObjects.items[i];
      if fNewObj1.Kind = ldmiReferenceLine then
      begin
        fNewObj1.PenColor := clWhite;
      end;
    end;
  end;
end;

procedure TDicomDatasets.ClearTopo;
//var
//  i: integer;
begin
  { for i := 0 to FTopoDicomDatasets.Count - 1 do
   begin
     if assigned(TDicomAttributes(FTopoDicomDatasets[i]).ImageData) then
       TDicomAttributes(FTopoDicomDatasets[i]).ImageData.ClearTopoLine;
   end;  }
  FTopoDicomDatasets.Clear;
end;

procedure TDicomDatasets.ClearTopoLine(AImage: TDicomAttributes);
var
  i: integer;
begin
  for i := 0 to FTopoDicomDatasets.Count - 1 do
  begin
    if (AImage <> nil) and (TDicomAttributes(FTopoDicomDatasets[i]) = AImage) then
      continue;

    if assigned(TDicomAttributes(FTopoDicomDatasets[i]).ImageData) then
      TDicomAttributes(FTopoDicomDatasets[i]).ImageData.ClearTopoLine;
  end;
end;

procedure TDicomDatasets.AddTopoAndClearLine;
  function DicomDatasetIsTopo(FDicomDataset: TDicomDataset): Boolean;
  var
    da: TDicomAttribute;
    //    str1: AnsiString;
    //    i: integer;
  begin
    Result := false;
    da := FDicomDataset.Attributes.Item[$8, $8];
    //    showmessage(FDicomDataset.Attributes.GetString($8, $8));
    if assigned(da) then
    begin
      Result := Trim(da.AsString[2]) = 'LOCALIZER';
    end;
    {    if not Result then
        begin
          Result := FDicomDataset.Attributes.getInteger($18, $1314) = 0;
        end;}
        {  if not Result then
          begin
            str1 := FDicomDataset.Attributes.GetString($8, $70);//NDM CT-C3000
            i := FDicomDataset.Attributes.getinteger($18,$0050);
            Result := (str1 = 'NDM CT-C3000') and (i=2);
          end; }
  end;
var
  i: integer;
begin
  FTopoDicomDatasets.Clear;

  for i := 0 to Count - 1 do
    if DicomDatasetIsTopo(Item[i]) then
      SetTopoDataset(Item[i].Attributes);

  for i := 0 to FTopoDicomDatasets.Count - 1 do
  begin
    TDicomAttributes(FTopoDicomDatasets[i]).ImageData.ClearTopoLine;
  end;
end;
//////////////////////////////////////////////////////////////////////////////////

{
#define CROSS(dest,v1,v2) \
          dest[0]=v1[1]*v2[2]-v1[2]*v2[1]; \
          dest[1]=v1[2]*v2[0]-v1[0]*v2[2]; \
          dest[2]=v1[0]*v2[1]-v1[1]*v2[0];

#define DOT(v1,v2) (v1[0]*v2[0]+v1[1]*v2[1]+v1[2]*v2[2])

#define SUB(dest,v1,v2) dest[0]=v1[0]-v2[0]; \
      dest[1]=v1[1]-v2[1]; \
      dest[2]=v1[2]-v2[2];
}

function intersect3D_2Planes_ex(Pn1, Pv1, Pn2, Pv2: TStructMatrix3D; var u, iP: TStructMatrix3D):
  Integer;
var
  ax, ay, az: Double;
  d1, d2: Double; // the constants in the 2 plane equations
  maxc: Integer; // max coordinate
begin
  u := crossProduct(Pn1, Pn2); // cross product -> perpendicular vector

  if u.x >= 0 then
    ax := u.x
  else
    ax := -u.x;
  if u.y >= 0 then
    ay := u.y
  else
    ay := -u.y;

  if u.z >= 0 then
    az := u.z
  else
    az := -u.z;

  // test if the two planes are parallel
  if ((ax + ay + az) < 0.01) then
  begin
    // Pn1 and Pn2 are near parallel
       // test if disjoint or coincide
       //Vector   v = Pn2.V0 - Pn1.V0;

       //if (dot(Pn1.n, v) == 0)         // Pn2.V0 lies in Pn1
       //    return -2;                   // Pn1 and Pn2 coincide
       //else
    result := -1; // Pn1 and Pn2 are disjoint
    exit;
  end;

  // Pn1 and Pn2 intersect in a line
  // first determine max abs coordinate of cross product
  if (ax > ay) then
  begin
    if (ax > az) then
      maxc := 1
    else
      maxc := 3;
  end
  else
  begin
    if (ay > az) then
      maxc := 2
    else
      maxc := 3;
  end;

  // next, to get a point on the intersect line
  // zero the max coord, and solve for the other two

  d1 := -dotProduct(Pn1, Pv1); // note: could be pre-stored with plane
  d2 := -dotProduct(Pn2, Pv2); // ditto

  case (maxc) of // select max coordinate
    1:
      begin // intersect with x=0
        iP.x := 0;
        iP.y := (d2 * Pn1.z - d1 * Pn2.z) / u.x;
        iP.z := (d1 * Pn2.y - d2 * Pn1.y) / u.x;
      end;
    2:
      begin // intersect with y=0
        iP.x := (d1 * Pn2.z - d2 * Pn1.z) / u.y;
        iP.y := 0;
        iP.z := (d2 * Pn1.x - d1 * Pn2.x) / u.y;
      end;
    3:
      begin // intersect with z=0
        iP.x := (d2 * Pn1.y - d1 * Pn2.y) / u.z;
        iP.y := (d1 * Pn2.x - d2 * Pn1.x) / u.z;
        iP.z := 0;
      end;
  end;
  Result := 0;
end;

function intersect3D_SegmentPlane_ex(P0, P1: TStructMatrix3D;
  Pnormal, Ppoint: TStructMatrix3D; var resultPt: TStructMatrix3D): Boolean;
var
  d, n, sI: Double;
  u, w: TStructMatrix3D;
begin
  u.x := P1.x - P0.x;
  u.y := P1.y - P0.y;
  u.z := P1.z - P0.z;

  w.x := P0.x - Ppoint.x;
  w.y := P0.y - Ppoint.y;
  w.z := P0.z - Ppoint.z;

  D := dotProduct(Pnormal, u);
  N := -dotProduct(Pnormal, w);

  if (abs(D) < 0.00000001) then
  begin // segment is parallel to plane
    if (N = 0) then // segment lies in plane
      Result := false
    else
      Result := false; // no intersection
    exit;
  end;

  // they are not parallel
  // compute intersect param

  sI := N / D;
  if (sI < 0) or (sI > 1) then
  begin
    Result := false; // no intersection
    exit;
  end;

  resultPt.x := P0.x + sI * u.x; // compute segment intersect point
  resultPt.y := P0.y + sI * u.y;
  resultPt.z := P0.z + sI * u.z;

  Result := true;
end;

function convertPixX(das: TDicomAttributes; x, y: Double; pixelCenter: Boolean): TStructMatrix3D;
begin
  if (pixelCenter) then
  begin
    x := x - 0.5;
    y := y - 0.5;
  end;
  with das.ImageData do
  begin
    Result.x := fImageOrigin.x + y * fImageVector[1].x * pixelSpacingY * 10 + x * fImageVector[0].x
      * pixelSpacingX * 10;
    Result.y := fImageOrigin.y + y * fImageVector[1].y * pixelSpacingY * 10 + x * fImageVector[0].y
      * pixelSpacingX * 10;
    Result.z := fImageOrigin.z + y * fImageVector[1].z * pixelSpacingY * 10 + x * fImageVector[0].z
      * pixelSpacingX * 10;
  end;
end;

function convertDICOMCoords(das: TDicomAttributes; dc: TStructMatrix3D; pixelCenter: Boolean):
  TStructMatrix3D;
var
  temp: TStructMatrix3D;
begin
  with das.ImageData do
  begin
    temp.x := dc.x - fImageOrigin.x;
    temp.y := dc.y - fImageOrigin.y;
    temp.z := dc.z - fImageOrigin.z;

    Result.x := temp.x * fImageVector[0].x + temp.y * fImageVector[0].y + temp.z *
      fImageVector[0].z;
    Result.y := temp.x * fImageVector[1].x + temp.y * fImageVector[1].y + temp.z *
      fImageVector[1].z;
    Result.z := temp.x * fImageVector[2].x + temp.y * fImageVector[2].y + temp.z *
      fImageVector[2].z;

  end;
  if (pixelCenter) then
  begin
    Result.x := Result.x + das.ImageData.pixelSpacingX * 10 / 2.0; // The center of the pixel
    Result.y := Result.y + das.ImageData.pixelSpacingY * 10 / 2.0; // The center of the pixel
  end;
end;

procedure computeSliceIntersection(das: TDicomAttributes;
  vectorB, originB: TStructMatrix3D; var aPoint, bPoint: TStructMatrix3D);
var
  c1, c2, r: TStructMatrix3D;
  x: Integer;
  pwidth, pheight: Integer;
  sft: array[0..1] of TStructMatrix3D;
begin
  pwidth := das.ImageData.Width;
  pheight := das.ImageData.Height;
  // Compute Slice From To Points

  sft[0].x := 0;
  sft[0].y := 0;
  sft[0].z := 0;
  sft[1].x := 0;
  sft[1].y := 0;
  sft[1].z := 0;

  c1 := convertPixX(das, 0, 0, true);
  c2 := convertPixX(das, pwidth, 0, true);

  x := 0;
  if (x < 2) and (intersect3D_SegmentPlane_ex(c1, c2, vectorB, originB, r)) then
  begin
    {$IFDEF DICOMDEBUGZ}
    SendDebug(Format('n1 =%5.2f,%5.2f,%5.2f', [r.x, r.y, r.z]));
    {$ENDIF}
    sft[x] := convertDICOMCoords(das, r, true);

    inc(x);
  end;

  c1 := convertPixX(das, pwidth, 0, true);
  c2 := convertPixX(das, pwidth, pheight, true);

  if (x < 2) and (intersect3D_SegmentPlane_ex(c1, c2, vectorB, originB, r)) then
  begin
    {$IFDEF DICOMDEBUGZ}
    SendDebug(Format('n1 =%5.2f,%5.2f,%5.2f', [r.x, r.y, r.z]));
    {$ENDIF}
    sft[x] := convertDICOMCoords(das, r, true);
    inc(x);
  end;

  c1 := convertPixX(das, pwidth, pheight, true);
  c2 := convertPixX(das, 0, pheight, true);

  if (x < 2) and (intersect3D_SegmentPlane_ex(c1, c2, vectorB, originB, r)) then
  begin
    {$IFDEF DICOMDEBUGZ}
    SendDebug(Format('n1 =%5.2f,%5.2f,%5.2f', [r.x, r.y, r.z]));
    {$ENDIF}
    sft[x] := convertDICOMCoords(das, r, true);
    inc(x);
  end;

  c1 := convertPixX(das, 0, pheight, true);
  c2 := convertPixX(das, 0, 0, true);

  if (x < 2) and (intersect3D_SegmentPlane_ex(c1, c2, vectorB, originB, r)) then
  begin
    {$IFDEF DICOMDEBUGZ}
    SendDebug(Format('n1 =%5.2f,%5.2f,%5.2f', [r.x, r.y, r.z]));
    {$ENDIF}
    sft[x] := convertDICOMCoords(das, r, true);
    inc(x);
  end;

  if (x <> 2) then
  begin
    sft[0].x := 0;
    sft[0].y := 0;
    sft[0].z := 0;
    sft[1].x := 0;
    sft[1].y := 0;
    sft[1].z := 0;
  end;
  {$IFDEF DICOMDEBUGZ}
  SendDebug(Format('Axel =%d', [das.ImageData.fSliceAxel]));
  {$ENDIF}
  aPoint := sft[0];
  bPoint := sft[1];
end;

function DicomDatasetIsTopo(FDicomDataset: TDicomDataset): Boolean;
var
  da: TDicomAttribute;
begin
  Result := false;
  da := FDicomDataset.Attributes.Item[$8, $8];
  if assigned(da) then
  begin
    Result := Trim(da.AsString[2]) = 'LOCALIZER';
  end;
end;
{.$DEFINE NEWDRAWREFLINE}
{$IFDEF NEWDRAWREFLINE}

function TDicomDatasets.AddTopoDataset(AValue: TDicomDataset; AIndex: Integer; AutoDefineTopo:
  Boolean): TDicomDrawObject;

var
  da1, da: TDicomAttribute;
  das: TDicomAttributes;
  fNewObj1: TDicomDrawObject;
  k, ii: Integer;

  VectorA, VectorB, OriginA, OriginB: TStructMatrix3D;
  u, iP: TStructMatrix3D;

  aPoint, bPoint: TStructMatrix3D;
  str1: AnsiString;
begin
  Result := nil;

  if not assigned(AValue.Attributes.ImageData) then
    exit;
  if (AutoDefineTopo) and DicomDatasetIsTopo(AValue) then
    SetTopoDataset(AValue.Attributes)
  else
  begin
    if (FTopoDicomDatasets.Count > 0) and (FTopoDicomDatasets.IndexOf(AValue.Attributes) < 0) then
    begin
      das := AValue.Attributes;

      OriginA := das.ImageData.fImageOrigin;
      VectorA := das.ImageData.fImageVector[2];

      for k := FTopoDicomDatasets.Count - 1 to FTopoDicomDatasets.Count - 1 do
      begin

        das := TDicomAttributes(FTopoDicomDatasets[k]);
        OriginB := das.ImageData.fImageOrigin;
        VectorB := das.ImageData.fImageVector[2];

        if intersect3D_2Planes_ex(VectorA, OriginA, VectorB, OriginB, u, ip) = 0 then
        begin
          {$IFDEF DICOMDEBUGZ}
          SendDebug(Format('Image %s', [AValue.Attributes.GetString(dInstanceNumber)]));
          {$ENDIF}
          //computeSliceIntersection(AValue.Attributes, VectorB, OriginB, aPoint, bPoint);
          computeSliceIntersection(das, VectorA, OriginA, aPoint, bPoint);
        end;
        {$IFDEF DICOMDEBUGZ}
        SendDebug(Format('image Axel =%d', [AValue.Attributes.ImageData.fSliceAxel]));
        SendDebug(Format('(A,B) =%5.2f,%5.2f,%5.2f,  n2 =%5.2f,%5.2f,%5.2f',
          [aPoint.x, aPoint.y, aPoint.z, bPoint.x, bPoint.y, bPoint.z]));
        {$ENDIF}
        if (aPoint.x = bPoint.X) and (aPoint.y = bPoint.y) then
        begin
          Result := nil;
        end
        else
        begin
          fNewObj1 :=
            TDicomAttributes(FTopoDicomDatasets[k]).ImageData.DrawObjects.Add(ldmiReferenceLine);
          fNewObj1.CanNotMove := true;
          fNewObj1.CanNotResize := true;
          fNewObj1.FImageIndex := IndexOf(AValue);

          fNewObj1.AddPoint(aPoint.x, aPoint.y);
          fNewObj1.AddPoint(bPoint.x, bPoint.y);
          fNewObj1.UserText := AValue.Attributes.GetString(dInstanceNumber);
          fNewObj1.PenColor32 := clWhite32;
          Result := fNewObj1;
        end;
      end;
    end;
  end;
end;

{$ELSE}

function TDicomDatasets.AddTopoDataset(AValue: TDicomDataset; AIndex: Integer; AutoDefineTopo:
  Boolean): TDicomDrawObject;
  function DicomDatasetIsTopo(FDicomDataset: TDicomDataset): Boolean;
  var
    da: TDicomAttribute;
  begin
    Result := false;
    da := FDicomDataset.Attributes.Item[$8, $8];
    if assigned(da) then
    begin
      Result := Trim(da.AsString[2]) = 'LOCALIZER';
    end;
  end;
var
  k: Integer;
  das1, das2: TDicomAttributes;
  fNewObj1: TDicomDrawObject;
  line1: TStructLine2D;
begin
  Result := nil;

  if not assigned(AValue.Attributes.ImageData) then
    exit;
  if (AutoDefineTopo) and DicomDatasetIsTopo(AValue) then
    SetTopoDataset(AValue.Attributes)
  else
  begin
    if (FTopoDicomDatasets.Count > 0) and (FTopoDicomDatasets.IndexOf(AValue.Attributes) < 0) then
    begin
      das1 := AValue.Attributes;

      for k := FTopoDicomDatasets.Count - 1 to FTopoDicomDatasets.Count - 1 do
      begin

        das2 := TDicomAttributes(FTopoDicomDatasets[k]);

        line1 := ComputeIntersectLine(das1, das2);

        if (line1.P0.x = line1.P1.X) and (line1.P0.y = line1.P1.y) then
        begin
          Result := nil;
        end
        else
        begin
          fNewObj1 :=
            TDicomAttributes(FTopoDicomDatasets[k]).ImageData.DrawObjects.Add(ldmiReferenceLine);
          fNewObj1.CanNotMove := true;
          fNewObj1.CanNotResize := true;
          fNewObj1.FImageIndex := IndexOf(AValue);

          fNewObj1.AddPoint(line1.P0.x, line1.P0.y);
          fNewObj1.AddPoint(line1.P1.x, line1.P1.y);
          fNewObj1.UserText := AValue.Attributes.GetString(dInstanceNumber);
          fNewObj1.PenColor := clWhite;

          Result := fNewObj1;
        end;
      end;
    end;
  end;
end;
(*
function TDicomDatasets.AddTopoDataset(AValue: TDicomDataset; AIndex: Integer; AutoDefineTopo:
  Boolean): TDicomDrawObject;
  function DicomDatasetIsTopo(FDicomDataset: TDicomDataset): Boolean;
  var
    da: TDicomAttribute;
  begin
    Result := false;
    da := FDicomDataset.Attributes.Item[$8, $8];
    if assigned(da) then
    begin
      Result := Trim(da.AsString[2]) = 'LOCALIZER';
    end;
  end;
var
  imageWidth: Integer;
  imageHeight: Integer;

  pixelWidth: Single;
  pixelHeight: Single;

  imageWidth1: Integer;
  imageHeight1: Integer;

  //  pixelWidth1: Single;
  //  pixelHeight1: Single;

  //  distance, distance1, distance2, distance3: Single;
  b, c, d: Double;
  bottomEdgeOffset: Single;

  da1, da: TDicomAttribute;
  das: TDicomAttributes;
  fNewObj1: TDicomDrawObject;
  k, ii: Integer;
  currentPlane, referencePlane: TStructPlane3D;

  aPoint, bPoint: TPoint;
  intersectionLine: TStructLine3D;

  c1, c2, c3, c4: tstructmatrix3D;
  k1, k2, k3, k4: Double;
  n1, n2: tstructmatrix3D;
  ii1: Integer;

  kk1: Integer;
  nk1: array[0..1] of TStructMatrix3D;
begin
  Result := nil;

  if not assigned(AValue.Attributes.ImageData) then
    exit;
  if (AutoDefineTopo) and DicomDatasetIsTopo(AValue) then
    SetTopoDataset(AValue.Attributes)
  else
  begin
    if (FTopoDicomDatasets.Count > 0) and (FTopoDicomDatasets.IndexOf(AValue.Attributes) < 0) then
    begin
      das := AValue.Attributes;
      referencePlane := das.ImageData.planeForImage;
      Imagewidth1 := das.ImageData.width;
      Imageheight1 := das.ImageData.height;

      for k := FTopoDicomDatasets.Count - 1 to FTopoDicomDatasets.Count - 1 do
      begin

        das := TDicomAttributes(FTopoDicomDatasets[k]);
        currentPlane := das.ImageData.planeForImage;

        Imagewidth := das.ImageData.width;
        Imageheight := das.ImageData.height;

        pixelWidth := das.ImageData.PixelSpacingX * 10;
        pixelHeight := das.ImageData.PixelSpacingY * 10;

        //create intersection with edges. Find edges first
        ii := intersect3D_2Planes(currentPlane, referencePlane, intersectionLine);

        if ii = 2 then
        begin
          kk1 := 0;
          c1 := convertPixX(AValue.Attributes, 0, 0, true);
          c2 := convertPixX(AValue.Attributes, 0, Imageheight1, true);
          ii1 := intersect3D_SegmentPlane(c1, c2, currentPlane, n1);
          if (ii1 = 1) and (kk1 < 2) then
          begin
            nk1[kk1] := n1;
            inc(kk1);
          end;

          c1 := convertPixX(AValue.Attributes, Imagewidth1, 0, true);
          c2 := convertPixX(AValue.Attributes, Imagewidth1, Imageheight1, true);
          ii1 := intersect3D_SegmentPlane(c1, c2, currentPlane, n1);
          if (ii1 = 1) and (kk1 < 2) then
          begin
            nk1[kk1] := n1;
            inc(kk1);
          end;

          c1 := convertPixX(AValue.Attributes, 0, 0, true);
          c2 := convertPixX(AValue.Attributes, Imagewidth1, 0, true);
          ii1 := intersect3D_SegmentPlane(c1, c2, currentPlane, n1);
          if (ii1 = 1) and (kk1 < 2) then
          begin
            nk1[kk1] := n1;
            inc(kk1);
          end;

          c1 := convertPixX(AValue.Attributes, 0, Imageheight1, true);
          c2 := convertPixX(AValue.Attributes, Imagewidth1, Imageheight1, true);
          ii1 := intersect3D_SegmentPlane(c1, c2, currentPlane, n1);
          if (ii1 = 1) and (kk1 < 2) then
          begin
            nk1[kk1] := n1;
            inc(kk1);
          end;

          {$IFDEF DICOMDEBUGZ}
          SendDebug(Format('Image %s=%d,%d,%d,%d', [AValue.Attributes.GetString(dInstanceNumber),
            ii1, ii2, ii3, ii4]));
          SendDebug(Format('n1 =%5.2f,%5.2f,%5.2f,  n2 =%5.2f,%5.2f,%5.2f', [n1.x, n1.y, n1.z, n2.x, n2.y, n2.z]));
          SendDebug(Format('n3 =%5.2f,%5.2f,%5.2f,  n4 =%5.2f,%5.2f,%5.2f', [n3.x, n3.y, n3.z, n3.x, n3.y, n3.z]));
          {$ENDIF}
          if kk1 = 2 then
          begin
            n1 := nk1[0];
            n2 := nk1[1];

            c1 := convertPixX(das, 0, -Imageheight * 100, true);
            c2 := convertPixX(das, 0, Imageheight * 200, true);

            c3 := convertPixX(das, Imagewidth, -Imageheight * 100, true);
            c4 := convertPixX(das, Imagewidth, Imageheight * 200, true);

            //aPoint.x := trunc(dist_Point_to_Segment3D(c1, c2, n1) / pixelWidth);
            //bPoint.x := trunc(dist_Point_to_Segment3D(c1, c2, n2) / pixelWidth);

            k1 := dist_Point_to_Segment3D(c1, c2, n1);
            k2 := dist_Point_to_Segment3D(c1, c2, n2);

            k3 := dist_Point_to_Segment3D(c3, c4, n1);
            k4 := dist_Point_to_Segment3D(c3, c4, n2);
            if k1 > Imagewidth * pixelWidth then
              aPoint.x := Round(k1 / pixelWidth)
            else
              if Round(k1 + k3) <= (Imagewidth * pixelWidth + 1) then
              aPoint.x := Round(k1 / pixelWidth)
            else
            begin

              aPoint.x := -Round(k1 / pixelWidth);
            end;
            if k2 > Imagewidth * pixelWidth then
              bPoint.x := Round(k2 / pixelWidth)
            else
              if Round(k2 + k4) <= (Imagewidth * pixelWidth + 1) then
              bPoint.x := Round(k2 / pixelWidth)
            else
            begin

              bPoint.x := -Round(k2 / pixelWidth);
            end;
            c1 := convertPixX(das, -Imagewidth * 100, 0, true);
            c2 := convertPixX(das, Imagewidth * 200, 0, true);
            c3 := convertPixX(das, -Imagewidth * 100, Imageheight, true);
            c4 := convertPixX(das, Imagewidth * 200, Imageheight, true);

            //aPoint.y := trunc(dist_Point_to_Segment3D(c1, c2, n1) / pixelHeight);
            //bPoint.y := trunc(dist_Point_to_Segment3D(c1, c2, n2) / pixelHeight);

            k1 := dist_Point_to_Segment3D(c1, c2, n1);
            k2 := dist_Point_to_Segment3D(c1, c2, n2);
            k3 := dist_Point_to_Segment3D(c3, c4, n1);
            k4 := dist_Point_to_Segment3D(c3, c4, n2);
            if k1 > Imageheight * pixelHeight then
              aPoint.y := Round(k1 / pixelHeight)
            else
              if Round(k1 + k3) <= (Imageheight * pixelHeight + 1) then
              aPoint.y := Round(k1 / pixelHeight)
            else
              aPoint.y := -Round(k1 / pixelHeight);

            if k2 > Imageheight * pixelHeight then
              bPoint.y := Round(k2 / pixelHeight)
            else
              if Round(k2 + k4) <= (Imageheight * pixelHeight + 1) then
              bPoint.y := Round(k2 / pixelHeight)
            else
              bPoint.y := -Round(k2 / pixelHeight);

          end else
            break;

          aPoint.x := (aPoint.x);
          aPoint.y := (aPoint.y);
          bPoint.x := (bPoint.x);
          bPoint.y := (bPoint.y);

          kk1 := 2;
          ClipLine(aPoint.x, aPoint.y, bPoint.x, bPoint.y, kk1, kk1, ImageWidth - kk1, ImageHeight - kk1);

          if (aPoint.x = bPoint.X) and (aPoint.y = bPoint.y) then
          begin
            Result := nil;
          end
          else
          begin
            fNewObj1 :=
              TDicomAttributes(FTopoDicomDatasets[k]).ImageData.DrawObjects.Add(ldmiReferenceLine);
            fNewObj1.CanNotMove := true;
            fNewObj1.CanNotResize := true;
            fNewObj1.FImageIndex := IndexOf(AValue);

            fNewObj1.AddPoint(aPoint.x, aPoint.y);
            fNewObj1.AddPoint(bPoint.x, bPoint.y);
            fNewObj1.UserText := AValue.Attributes.GetString(dInstanceNumber);

            Result := fNewObj1;
          end;
        end;
      end;
    end;
  end;
end;     *)
{$ENDIF}

function ComputeAxPosition(ADataset1, ADataset2: TDicomAttributes; X, Y: Double): TStructMatrix2D;
var
  imageWidth: Integer;
  imageHeight: Integer;

  pixelWidth: Double;
  pixelHeight: Double;

  imageWidth1: Integer;
  imageHeight1: Integer;

  pixelWidth1: Double;
  pixelHeight1: Double;
  //  b, c, d: Double;
  //  bottomEdgeOffset: Single;

  //  da1, da: TDicomAttribute;
    //das: TDicomAttributes;
  //  fNewObj1: TDicomDrawObject;
//  ii: Integer;
  currentPlane, referencePlane: TStructPlane3D;

//  aPoint, bPoint: TStructMatrix2D;
//  intersectionLine: TStructLine3D;

//  c1, c2, c3, c4: tstructmatrix3D;
//  k1, k2, k3, k4: Double;
//  n1, n2: tstructmatrix3D;
//  ii1: Integer;

//  kk1: Integer;
//  nk1: array[0..1] of TStructMatrix3D;
begin
  Result.x := 0;
  Result.y := 0;

  if not (assigned(ADataset1) and assigned(ADataset1.ImageData)) then
    exit;

  if not (assigned(ADataset2) and assigned(ADataset2.ImageData)) then
    exit;

  //das := ADataset1;
  referencePlane := ADataset1.ImageData.planeForImage;
  Imagewidth1 := ADataset1.ImageData.width;
  Imageheight1 := ADataset1.ImageData.height;

  pixelWidth1 := ADataset1.ImageData.PixelSpacingX * 10;
  pixelHeight1 := ADataset1.ImageData.PixelSpacingY * 10;

  //das := ADataset2; //to draw , reffence plane
  currentPlane := ADataset2.ImageData.planeForImage;

  Imagewidth := ADataset2.ImageData.width;
  Imageheight := ADataset2.ImageData.height;

  pixelWidth := ADataset2.ImageData.PixelSpacingX * 10;
  pixelHeight := ADataset2.ImageData.PixelSpacingY * 10;

  Result.x := X * pixelWidth1 / pixelWidth;
  Result.y := Y * pixelHeight1 / pixelHeight;
end;

function ComputeIntersectLine(ADataset1, ADataset2: TDicomAttributes): TStructLine2D;
var
  imageWidth: Integer;
  imageHeight: Integer;

  pixelWidth: Double;
  pixelHeight: Double;

  imageWidth1: Integer;
  imageHeight1: Integer;

  pixelWidth1: Double;
  pixelHeight1: Double;
  //  b, c, d: Double;
  //  bottomEdgeOffset: Single;

  //  da1, da: TDicomAttribute;
    //das: TDicomAttributes;
  //  fNewObj1: TDicomDrawObject;
  ii: Integer;
  currentPlane, referencePlane: TStructPlane3D;

  aPoint, bPoint: TStructMatrix2D;
  intersectionLine: TStructLine3D;

  c1, c2, c3, c4: tstructmatrix3D;
  k1, k2, k3, k4: Double;
  n1, n2: tstructmatrix3D;
  ii1: Integer;

  kk1: Integer;
  nk1: array[0..1] of TStructMatrix3D;
begin
  Result.P0.x := 0;
  Result.P0.y := 0;
  Result.P1.x := 0;
  Result.P1.y := 0;

  if not (assigned(ADataset1) and assigned(ADataset1.ImageData)) then
    exit;

  if not (assigned(ADataset2) and assigned(ADataset2.ImageData)) then
    exit;

  //das := ADataset1;
  referencePlane := ADataset1.ImageData.planeForImage;
  Imagewidth1 := ADataset1.ImageData.width;
  Imageheight1 := ADataset1.ImageData.height;

  pixelWidth1 := ADataset1.ImageData.PixelSpacingX * 10;
  pixelHeight1 := ADataset1.ImageData.PixelSpacingY * 10;

  //das := ADataset2; //to draw , reffence plane
  currentPlane := ADataset2.ImageData.planeForImage;

  Imagewidth := ADataset2.ImageData.width;
  Imageheight := ADataset2.ImageData.height;

  pixelWidth := ADataset2.ImageData.PixelSpacingX * 10;
  pixelHeight := ADataset2.ImageData.PixelSpacingY * 10;

  //create intersection with edges. Find edges first
  ii := intersect3D_2Planes(currentPlane, referencePlane, intersectionLine);

  if ii = 2 then
  begin
    if (Imageheight1 * pixelHeight1) < (Imagewidth * pixelWidth) then
    begin
      kk1 := 0;
      c1 := convertPixX(ADataset1, 0, 0, true);
      c2 := convertPixX(ADataset1, 0, Imageheight1, true);
      ii1 := intersect3D_SegmentPlane(c1, c2, currentPlane, n1);
      if (ii1 = 1) and (kk1 < 2) then
      begin
        nk1[kk1] := n1;
        inc(kk1);
      end;

      c1 := convertPixX(ADataset1, Imagewidth1, 0, true);
      c2 := convertPixX(ADataset1, Imagewidth1, Imageheight1, true);
      ii1 := intersect3D_SegmentPlane(c1, c2, currentPlane, n1);
      if (ii1 = 1) and (kk1 < 2) then
      begin
        nk1[kk1] := n1;
        inc(kk1);
      end;

      c1 := convertPixX(ADataset1, 0, 0, true);
      c2 := convertPixX(ADataset1, Imagewidth1, 0, true);
      ii1 := intersect3D_SegmentPlane(c1, c2, currentPlane, n1);
      if (ii1 = 1) and (kk1 < 2) then
      begin
        nk1[kk1] := n1;
        inc(kk1);
      end;

      c1 := convertPixX(ADataset1, 0, Imageheight1, true);
      c2 := convertPixX(ADataset1, Imagewidth1, Imageheight1, true);
      ii1 := intersect3D_SegmentPlane(c1, c2, currentPlane, n1);
      if (ii1 = 1) and (kk1 < 2) then
      begin
        nk1[kk1] := n1;
        inc(kk1);
      end;
    end
    else
    begin
      kk1 := 0;
      c1 := convertPixX(ADataset2, 0, 0, true);
      c2 := convertPixX(ADataset2, 0, Imageheight, true);
      ii1 := intersect3D_SegmentPlane(c1, c2, referencePlane, n1);
      if (ii1 = 1) and (kk1 < 2) then
      begin
        nk1[kk1] := n1;
        inc(kk1);
      end;

      c1 := convertPixX(ADataset2, Imagewidth, 0, true);
      c2 := convertPixX(ADataset2, Imagewidth, Imageheight, true);
      ii1 := intersect3D_SegmentPlane(c1, c2, referencePlane, n1);
      if (ii1 = 1) and (kk1 < 2) then
      begin
        nk1[kk1] := n1;
        inc(kk1);
      end;

      c1 := convertPixX(ADataset2, 0, 0, true);
      c2 := convertPixX(ADataset2, Imagewidth, 0, true);
      ii1 := intersect3D_SegmentPlane(c1, c2, referencePlane, n1);
      if (ii1 = 1) and (kk1 < 2) then
      begin
        nk1[kk1] := n1;
        inc(kk1);
      end;

      c1 := convertPixX(ADataset2, 0, Imageheight, true);
      c2 := convertPixX(ADataset2, Imagewidth, Imageheight, true);
      ii1 := intersect3D_SegmentPlane(c1, c2, referencePlane, n1);
      if (ii1 = 1) and (kk1 < 2) then
      begin
        nk1[kk1] := n1;
        inc(kk1);
      end;
    end;
    if kk1 = 2 then
    begin
      n1 := nk1[0];
      n2 := nk1[1];

      c1 := convertPixX(ADataset2, 0, -Imageheight * 200, true);
      c2 := convertPixX(ADataset2, 0, Imageheight * 200, true);

      c3 := convertPixX(ADataset2, Imagewidth, -Imageheight * 200, true);
      c4 := convertPixX(ADataset2, Imagewidth, Imageheight * 200, true);

      //aPoint.x := trunc(dist_Point_to_Segment3D(c1, c2, n1) / pixelWidth);
      //bPoint.x := trunc(dist_Point_to_Segment3D(c1, c2, n2) / pixelWidth);

      k1 := dist_Point_to_Segment3D(c1, c2, n1);
      k2 := dist_Point_to_Segment3D(c1, c2, n2);

      k3 := dist_Point_to_Segment3D(c3, c4, n1);
      k4 := dist_Point_to_Segment3D(c3, c4, n2);
      if k1 > Imagewidth * pixelWidth then
        aPoint.x := (k1 / pixelWidth)
      else
        if Round(k1 + k3) <= (Imagewidth * pixelWidth + 10) then
        aPoint.x := (k1 / pixelWidth)
      else
      begin

        aPoint.x := -(k1 / pixelWidth);
      end;
      if k2 > Imagewidth * pixelWidth then
        bPoint.x := (k2 / pixelWidth)
      else
        if Round(k2 + k4) <= (Imagewidth * pixelWidth + 10) then
        bPoint.x := (k2 / pixelWidth)
      else
      begin

        bPoint.x := -(k2 / pixelWidth);
      end;
      c1 := convertPixX(ADataset2, -Imagewidth * 200, 0, true);
      c2 := convertPixX(ADataset2, Imagewidth * 200, 0, true);
      c3 := convertPixX(ADataset2, -Imagewidth * 200, Imageheight, true);
      c4 := convertPixX(ADataset2, Imagewidth * 200, Imageheight, true);

      //aPoint.y := trunc(dist_Point_to_Segment3D(c1, c2, n1) / pixelHeight);
      //bPoint.y := trunc(dist_Point_to_Segment3D(c1, c2, n2) / pixelHeight);

      k1 := dist_Point_to_Segment3D(c1, c2, n1);
      k2 := dist_Point_to_Segment3D(c1, c2, n2);
      k3 := dist_Point_to_Segment3D(c3, c4, n1);
      k4 := dist_Point_to_Segment3D(c3, c4, n2);
      if k1 > Imageheight * pixelHeight then
        aPoint.y := (k1 / pixelHeight)
      else
        if Round(k1 + k3) <= (Imageheight * pixelHeight + 10) then
        aPoint.y := (k1 / pixelHeight)
      else
        aPoint.y := -(k1 / pixelHeight);

      if k2 > Imageheight * pixelHeight then
        bPoint.y := (k2 / pixelHeight)
      else
        if Round(k2 + k4) <= (Imageheight * pixelHeight + 10) then
        bPoint.y := (k2 / pixelHeight)
      else
        bPoint.y := -(k2 / pixelHeight);

    end
    else
      exit;

    aPoint.x := (aPoint.x);
    aPoint.y := (aPoint.y);
    bPoint.x := (bPoint.x);
    bPoint.y := (bPoint.y);

    kk1 := 2;
    //    ClipLine(aPoint.x, aPoint.y, bPoint.x, bPoint.y, kk1, kk1, ImageWidth - kk1, ImageHeight -      kk1);

    if (aPoint.x = bPoint.X) and (aPoint.y = bPoint.y) then
    begin

    end
    else
    begin
      Result.P0.x := aPoint.x;
      Result.P0.y := aPoint.y;
      Result.P1.x := bPoint.x;
      Result.P1.y := bPoint.y;
    end;
  end;
end;

procedure TDicomImage.ClearTopoLine;
var
  i: Integer;
  n1: TDicomDrawObject;
begin
  if FDrawObjects.FList.Count > 0 then
  begin
    FDrawObjects.Modify := true;
    for I := FDrawObjects.FList.Count - 1 downto 0 do // Iterate
    begin
      n1 := fDrawObjects.Items[i];
      if n1.FKind = ldmiReferenceLine then
      begin
        fDrawObjects.FList.Remove(n1);
        n1.Free;
      end;
    end; // for
  end;
end;

function TDicomImage.GetTopoLine(x, y: Integer): Integer;
var
  i: Integer;
  n1: TDicomDrawObject;
begin
  Result := -1;
  for I := FDrawObjects.FList.Count - 1 downto 0 do // Iterate
  begin
    n1 := fDrawObjects.Items[i];
    if n1.FKind = ldmiReferenceLine then
    begin
      if n1.IsNearLine(x, y) then
      begin
        Result := n1.FImageIndex;
        break;
      end;
    end;
  end; // for }
end;

procedure TDicomDataset.ResetDataToStream;
begin
  if assigned(Attributes.ImageData) then
    Attributes.ImageData.ResetDataToStream;
end;

procedure TDicomDatasets.ResetDataToStream;
var
  i: integer;
begin
  for i := 0 to GetCount - 1 do
  begin
    Item[i].ResetDataToStream;
  end;
end;

procedure TDicomDatasets.ScanTopoDataset(AutoDefineTopo: Boolean = TRUE);
var
  i: integer;
begin
  if AutoDefineTopo then
  begin
    ClearTopo;
    for i := 0 to Count - 1 do
      if DicomDatasetIsTopo(Item[i]) then
        SetTopoDataset(Item[i].Attributes);

  end;

  for i := 0 to GetCount - 1 do
  begin
    AddTopoDataset(Item[i], i, false);
  end;

end;

procedure TDicomDatasets.ScanSeriesTopoDataset(AAttributes: TDicomAttributes; AutoDefineTopo:
  Boolean = false);
var
  i: integer;
  str1: AnsiString;
begin
  str1 := AAttributes.GetString($20, $E);
  if AutoDefineTopo then
  begin
    ClearTopo;
    for i := 0 to Count - 1 do
      //if Item[i].Attributes.GetString($20, $E) = str1 then
      if DicomDatasetIsTopo(Item[i]) then
        SetTopoDataset(Item[i].Attributes);
  end;
  //str1 := AAttributes.GetString($20, $E);
  for i := 0 to GetCount - 1 do
  begin
    if Item[i].Attributes.GetString($20, $E) = str1 then
      AddTopoDataset(Item[i], i, false);
  end;
end;

procedure TDicomDatasets.ScanFLTopoDataset(AutoDefineTopo: Boolean = TRUE);
var
  i: integer;
  str1, str2: AnsiString;
begin
  if AutoDefineTopo then
  begin
    ClearTopo;

    for i := 0 to Count - 1 do
      //if Item[i].Attributes.GetString($20, $E) = str1 then
      if DicomDatasetIsTopo(Item[i]) then
        SetTopoDataset(Item[i].Attributes);
  end;
  str1 := Item[0].Attributes.GetString($20, $E);
  //AddTopoDataset(Item[0], 0, AutoDefineTopo);
  for i := 0 to GetCount - 1 do
  begin
    str2 := Item[i].Attributes.GetString($20, $E);
    if str1 <> str2 then
    begin
      AddTopoDataset(Item[i], i, AutoDefineTopo);
      if i >= 1 then
        AddTopoDataset(Item[i - 1], i, AutoDefineTopo);
    end;
    str1 := str2;
  end;
  AddTopoDataset(Item[GetCount - 1], GetCount - 1, AutoDefineTopo);
end;

procedure TDicomDatasets.ScanSeriesFLTopoDataset(AAttributes: TDicomAttributes; AutoDefineTopo:
  Boolean);
var
  i, k: integer;
  str1, str2, str3: AnsiString;
begin
  if AutoDefineTopo then
  begin
    ClearTopo;
  end;
  str3 := AAttributes.GetString($20, $E);
  k := 0;

  str1 := ''; //Item[0].Attributes.GetString($20, $E);
  for i := 0 to GetCount - 1 do
  begin
    str2 := Item[i].Attributes.GetString($20, $E);
    if str1 <> str2 then
    begin
      if (str2 = str3) then
        AddTopoDataset(Item[i], i, AutoDefineTopo);
      if (str1 = str3) then
        AddTopoDataset(Item[i - 1], i - 1, AutoDefineTopo);
    end;
    str1 := str2;
  end;
end;

(*procedure TDicomAttributes.LoadDataset(ADataset: TDataset; AFrom, AFecthCount: integer);
var
  fd1: TFieldDef;
  f1: TField;
  da1, da2, da3: TDicomAttribute;
  das1, das2: TDicomAttributes;
  k, i: integer;
  ob1: TOBStream;
  stream1: TStream;
begin
  da1 := Add(TDicomAttribute.Create(self, $2813, $0100));
  for i := 0 to ADataset.FieldDefs.Count - 1 do
  begin
    fd1 := ADataset.FieldDefs.Items[i];
    das1 := TDicomAttributes.Create;
    das1.AddVariant($2813, $0101, fd1.Name);
    case fd1.DataType of
      ftString, ftFixedChar, ftWideString:
        das1.AddVariant($2813, $0102, 1);
      ftMemo, ftFmtMemo:
        das1.AddVariant($2813, $0102, 9);
      ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint:
        das1.AddVariant($2813, $0102, 2);
      ftBoolean:
        das1.AddVariant($2813, $0102, 3);
      ftFloat, ftCurrency, ftBCD:
        das1.AddVariant($2813, $0102, 4);
      ftDate:
        das1.AddVariant($2813, $0102, 5);
      ftTime:
        das1.AddVariant($2813, $0102, 6);
      ftDateTime{$IFDEF LEVEL6}, ftTimeStamp{$ENDIF}:
        das1.AddVariant($2813, $0102, 7);
      //        ftBlob, ftGraphic, ftOraBlob, ftOraClob,
      //          ftBytes, ftVarBytes,ftTypedBinary:
    else
      begin
        das1.AddVariant($2813, $0102, 8);
      end;
      {    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
          , ftADT, ftArray, ftReference, ftDataSet,
          ftVariant, ftInterface, ftIDispatch, ftGuidp, ftFMTBcd}
    end;
    //das1.AddVariant($2813, $0102, ord(fd1.DataType));
    das1.AddVariant($2813, $0103, fd1.Size);
    das1.AddVariant($2813, $0104, i);
    if fd1.Required then
      das1.AddVariant($2813, $0105, 1);
    da1.AddData(das1);
  end;

  ADataset.First;
  if AFrom <> 0 then
    ADataset.MoveBy(AFrom);
  if (AFecthCount <= 0) or (AFecthCount > 5000) then
    AFecthCount := 5000; //ADataset.RecordCount;
  da1 := Add(TDicomAttribute.Create(self, $2813, $0110));
  for k := 0 to AFecthCount - 1 do
  begin
    if ADataset.Eof then
      break;
    das1 := TDicomAttributes.Create;
    da1.AddData(das1);
    da2 := das1.Add(TDicomAttribute.Create(das1, $2813, $0111));
    for i := 0 to ADataset.Fields.Count - 1 do
    begin
      f1 := ADataset.Fields[i];
      das2 := TDicomAttributes.Create;
      das2.AddVariant($2813, $0101, f1.FullName);
      case f1.DataType of
        ftString, ftMemo, ftFmtMemo, ftFixedChar, ftWideString:
          das2.AddVariant($2813, $0123, f1.AsString);
        ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint:
          das2.AddVariant($2813, $0120, f1.AsInteger);
        ftBoolean:
          begin
            if f1.AsBoolean then
              das2.AddVariant($2813, $0120, 1)
            else
              das2.AddVariant($2813, $0120, 0);
          end;
        ftFloat, ftCurrency, ftBCD:
          das2.Add($2813, $0121).AsFloat[0] := f1.AsFloat;
        ftDate:
          das2.Add($2813, $0126).AsDatetime[0] := f1.AsDatetime;
        ftTime:
          das2.Add($2813, $0127).AsDatetime[0] := f1.AsDatetime;
        ftDateTime{$IFDEF LEVEL6}, ftTimeStamp{$ENDIF}:
          das2.Add($2813, $0125).AsDatetime[0] := f1.AsDatetime;
        //        ftBlob, ftGraphic, ftOraBlob, ftOraClob,
        //          ftBytes, ftVarBytes,ftTypedBinary:
      else
        begin
          da3 := das2.Add($2813, $0124);
          ob1 := TOBStream.Create;
          Stream1 := ADataset.CreateBlobStream(f1, bmRead);
          Stream1.Position := 0;
          try
            ob1.CopyFrom(Stream1, Stream1.Size);
            ob1.Position := 0;
            da3.AddData(ob1);
          finally
            Stream1.Free;
          end;
        end;
        {    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
            , ftADT, ftArray, ftReference, ftDataSet,
            ftVariant, ftInterface, ftIDispatch, ftGuidp, ftFMTBcd}
      end;

      //      das2.AddVariant($2813, $0104, i);
      da2.AddData(das2);
    end;
    ADataset.Next;
  end;
end;*)

procedure TDicomAttributes.FillResultDataset(ADataset: TDataset; FetchCount: Integer; ANeedStruct: Boolean);
var
  d1, da1: TDicomAttribute;
  das1: TDicomAttributes;
  kxmMemTable1: TkxmMemTable;
  p: TOBStream;
  i: Integer;
  fd1: TFieldDef;
//  f1: TField;
  //  FkxmBinaryStreamFormat1: TkbmBinaryStreamFormat;
begin
  da1 := Add(TDicomAttribute.Create(self, $2813, $0100));
  for i := 0 to ADataset.FieldDefs.Count - 1 do
  begin
    fd1 := ADataset.FieldDefs.Items[i];
    das1 := TDicomAttributes.Create;
    das1.AddVariant($2813, $0101, fd1.Name);
    case fd1.DataType of
      ftString, ftFixedChar, ftWideString:
        das1.AddVariant($2813, $0102, 1);
      ftMemo, ftFmtMemo:
        das1.AddVariant($2813, $0102, 9);
      ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint:
        das1.AddVariant($2813, $0102, 2);
      ftBoolean:
        das1.AddVariant($2813, $0102, 3);
      ftFloat, ftCurrency, ftBCD:
        das1.AddVariant($2813, $0102, 4);
      ftDate:
        das1.AddVariant($2813, $0102, 5);
      ftTime:
        das1.AddVariant($2813, $0102, 6);
      ftDateTime{$IFDEF LEVEL6}, ftTimeStamp{$ENDIF}:
        das1.AddVariant($2813, $0102, 7);
      //        ftBlob, ftGraphic, ftOraBlob, ftOraClob,
      //          ftBytes, ftVarBytes,ftTypedBinary:
    else
      begin
        das1.AddVariant($2813, $0102, 8);
      end;
      {    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
          , ftADT, ftArray, ftReference, ftDataSet,
          ftVariant, ftInterface, ftIDispatch, ftGuidp, ftFMTBcd}
    end;
    //das1.AddVariant($2813, $0102, ord(fd1.DataType));
    das1.AddVariant($2813, $0103, fd1.Size);
    das1.AddVariant($2813, $0104, i);
    if fd1.Required then
      das1.AddVariant($2813, $0105, 1);
    da1.AddData(das1);
  end;

  if FetchCount <= 0 then
    FetchCount := 5000;

  kxmMemTable1 := TkxmMemTable.Create(nil);
  try
    with kxmMemTable1 do
    begin
      DesignActivation := True;
      AttachedAutoRefresh := True;
      AttachMaxCount := 1;
      //SortOptions := [];
      PersistentBackup := False;
      ProgressFlags := [mtpcLoad, mtpcSave, mtpcCopy];
      //FilterOptions := [];
      LanguageID := 0;
      SortID := 0;
      SubLanguageID := 1;
      LocaleID := 1024;
      //DefaultFormat := TkbmBinaryStreamFormat.Create(nil);
    end;
    if FetchCount > 0 then
      kxmMemTable1.LoadLimit := FetchCount;
    d1 := Add(TDicomAttribute.Create(self, $2809, $1002));
    p := TOBStream.Create;
    d1.AddData(p);

    //if ANeedStruct then
    kxmMemTable1.LoadFromDataSet(ADataset, [mtcpoStructure, mtcpoOnlyActiveFields, mtcpoProperties, mtcpoLookup, mtcpoCalculated]);
    //else
    //kxmMemTable1.LoadFromDataSet(ADataset, [mtcpoOnlyActiveFields, mtcpoProperties, mtcpoLookup, mtcpoCalculated]);

    kxmMemTable1.Open;
    kxmMemTable1.SaveToStream(p);
  finally
    kxmMemTable1.Close;
    kxmMemTable1.Free;
  end;
end;

procedure TDicomAttributes.LoadDataset(ADataset: TDataset; AFrom, AFecthCount: integer;
  AMemoFilter: TDicomAttribute = nil);
  function IsMemo: Boolean;
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
var
  fd1: TFieldDef;
  f1: TField;
  da1, da2, da3: TDicomAttribute;
  das1, das2: TDicomAttributes;
  k, i: integer;
  ob1: TOBStream;
  stream1: TStream;
begin
  da1 := Add(TDicomAttribute.Create(self, $2813, $0100));
  for i := 0 to ADataset.FieldDefs.Count - 1 do
  begin
    fd1 := ADataset.FieldDefs.Items[i];
    das1 := TDicomAttributes.Create;
    das1.AddVariant($2813, $0101, fd1.Name);
    case fd1.DataType of
      ftString, ftFixedChar, ftWideString:
        das1.AddVariant($2813, $0102, 1);
      ftMemo, ftFmtMemo:
        das1.AddVariant($2813, $0102, 9);
      ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint:
        das1.AddVariant($2813, $0102, 2);
      ftBoolean:
        das1.AddVariant($2813, $0102, 3);
      ftFloat, ftCurrency, ftBCD:
        das1.AddVariant($2813, $0102, 4);
      ftDate:
        das1.AddVariant($2813, $0102, 5);
      ftTime:
        das1.AddVariant($2813, $0102, 6);
      ftDateTime{$IFDEF LEVEL6}, ftTimeStamp{$ENDIF}:
        das1.AddVariant($2813, $0102, 7);
      //        ftBlob, ftGraphic, ftOraBlob, ftOraClob,
      //          ftBytes, ftVarBytes,ftTypedBinary:
    else
      begin
        das1.AddVariant($2813, $0102, 8);
      end;
      {    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
          , ftADT, ftArray, ftReference, ftDataSet,
          ftVariant, ftInterface, ftIDispatch, ftGuidp, ftFMTBcd}
    end;
    //das1.AddVariant($2813, $0102, ord(fd1.DataType));
    das1.AddVariant($2813, $0103, fd1.Size);
    das1.AddVariant($2813, $0104, i);
    if fd1.Required then
      das1.AddVariant($2813, $0105, 1);
    da1.AddData(das1);
  end;

  if AFecthCount > -100 then
  begin

    ADataset.First;
    if AFrom >= 0 then
    begin
      if AFrom > 0 then
        ADataset.MoveBy(AFrom);
    end;
    if (AFecthCount <= 0) or (AFecthCount > 10000) then
      AFecthCount := 10000; //ADataset.RecordCount;
    da1 := Add(TDicomAttribute.Create(self, $2813, $0110));
    k := 0;
    while not ADataset.Eof do
    begin
      if IsMemo then
      begin
        das1 := TDicomAttributes.Create;
        da1.AddData(das1);
        da2 := das1.Add(TDicomAttribute.Create(das1, $2813, $0111));
        for i := 0 to ADataset.Fields.Count - 1 do
        begin
          f1 := ADataset.Fields[i];
          das2 := TDicomAttributes.Create;
          das2.AddVariant($2813, $0101, f1.FullName);
          case f1.DataType of
            ftString, ftMemo, ftFmtMemo, ftFixedChar, ftWideString:
              das2.AddVariant($2813, $0123, f1.AsString);
            ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint:
              das2.AddVariant($2813, $0120, f1.AsInteger);
            ftBoolean:
              begin
                if f1.AsBoolean then
                  das2.AddVariant($2813, $0120, 1)
                else
                  das2.AddVariant($2813, $0120, 0);
              end;
            ftFloat, ftCurrency, ftBCD:
              das2.Add($2813, $0121).AsFloat[0] := f1.AsFloat;
            ftDate:
              das2.Add($2813, $0126).AsDatetime[0] := f1.AsDatetime;
            ftTime:
              das2.Add($2813, $0127).AsDatetime[0] := f1.AsDatetime;
            ftDateTime{$IFDEF LEVEL6}, ftTimeStamp{$ENDIF}:
              das2.Add($2813, $0125).AsDatetime[0] := f1.AsDatetime;
            //        ftBlob, ftGraphic, ftOraBlob, ftOraClob,
            //          ftBytes, ftVarBytes,ftTypedBinary:
          else
            begin
              da3 := das2.Add($2813, $0124);
              ob1 := TOBStream.Create;
              Stream1 := ADataset.CreateBlobStream(f1, bmRead);
              Stream1.Position := 0;
              try
                ob1.CopyFrom(Stream1, Stream1.Size);
                ob1.Position := 0;
                da3.AddData(ob1);
              finally
                Stream1.Free;
              end;
            end;
            {    ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
                , ftADT, ftArray, ftReference, ftDataSet,
                ftVariant, ftInterface, ftIDispatch, ftGuidp, ftFMTBcd}
          end;

          //      das2.AddVariant($2813, $0104, i);
          da2.AddData(das2);
        end;
        //inc(k);
        //if k > (AFecthCount - 1) then
        //  break;

        if da1.GetCount > (AFecthCount - 1) then
          break;
      end;
      ADataset.Next;
    end;
  end;
end;

procedure TDicomImage.SetPresentationSate(ADataset: TDicomDataset);
var
  das0, das1, das2: TDicomAttributes;
  da1, da2: TDicomAttribute;
begin
  if not assigned(Attributes) then
    raise Exception.Create('No Image display now');
  PresentationSate := ADataset;
  das0 := ADataset.Attributes;
  if das0.GetString($0008, $0060) <> 'PR' then
    raise Exception.Create('The dataset assigned PresentationSate is not Presentation Sate data');

  da1 := Attributes.Add($28, $30);
  da2 := das0.Item[$28, $30];
  if assigned(da1) and assigned(da2) and (da2.GetCount >= 2) then
  begin
    da1.AsFloat[0] := da2.AsFloat[0];
    da1.AsFloat[1] := da2.AsFloat[1];
    self.FPixelSpacingY := da2.AsFloat[0];
    self.FPixelSpacingX := da2.AsFloat[1];
    UpdateCood(FPixelSpacingX, fPixelSpacingY);
  end;

  da1 := das0.Item[$0028, $3110];
  if assigned(da1) and (da1.GetCount > 0) then
  begin
    das1 := da1.Attributes[0];

    //is for this image?
    da2 := das1.Item[$0008, $1140];
    das2 := da2.Attributes[0];
    if das2.GetString($0008, $1155) <> Attributes.GetString($0008, $0018) then
      if not (MessageDlg('The PresentationSate is not for this image.Apply it anyway?', mtWarning,
        [mbYes, mbNo], 0) = mrYes) then
        exit;

    WindowCenter := das1.getInteger($0028, $1050);
    WindowWidth := das1.getInteger($0028, $1051);
  end;

  da1 := das0.Item[$0070, $005A];
  if assigned(da1) and (da1.GetCount > 0) then
  begin

    das1 := da1.Attributes[0];

    da2 := das1.Item[$0070, $0103];
    if (da2 <> nil) and (da2.AsFloat[0] <> 0) then
      ViewerZoom := da2.AsFloat[0];

    da2 := das1.Item[$0070, $0052];
    OffsetY := da2.AsInteger[0];
    OffsetX := da2.AsInteger[1];
    da2 := das1.Item[$0070, $0053];
    //  da2.AsInteger[0] := Bitmap.Width;
    //  da2.AsInteger[1] := Bitmap.Height;

    //  das1.AddVariant($0070, $0100, 'MAGNIFY');

    da2 := das1.Item[$0070, $0101];
    //  da2.AsFloat[0] := Attributes.ImageData.PixelSpacingY;
    //  da2.AsFloat[1] := Attributes.ImageData.PixelSpacingX;

  end;

  DrawObjects.LoadAll(ADataset.Attributes);
end;

function TDicomImage.CreatePresentationState: TDicomDataset;
begin
  Result := TDicomDataset.Create(CreatePresentationStateEx);
end;

function TDicomImage.CreatePresentationStateEx: TDicomAttributes;
var
  das0, das1, das2: TDicomAttributes;
  da1, da2: TDicomAttribute;
begin

  if not assigned(Attributes) then
    raise Exception.Create('No Image display now');
  Result := TDicomAttributes.Create;
  das0 := Result;

  das0.AddVariant($0008, $0016, '1.2.840.10008.5.1.4.1.1.11.1');
  das0.AddVariant($0008, $0018, Attributes.GetString($0008, $0018) + '.8888');
  {62[0008:0016](SOPClassUID)UI=<1>1.2.840.10008.5.1.4.1.1.11.1
  63[0008:0018](SOPInstanceUID)UI=<1>1.2.826.0.1.3680043.6.8494.24091.20060706221625.40.2}
  //das0.AddVariant($0008, $0020, Attributes.GetString($0008, $0020));
  //das0.AddVariant($0008, $0030, Attributes.GetString($0008, $0030));
  das0.AddVariant($0008, $0050, Attributes.GetString($0008, $0050));
  das0.AddVariant($0008, $0060, 'PR');
  {64[0008:0020](StudyDate)DA=<1>2006-2-21
  70[0008:0030](StudyTime)TM=<1>23:40:02
  77[0008:0050](AccessionNumber)SH=<0>NULL
  81[0008:0060](Modality)CS=<1>PR}
  da1 := das0.Add($0028, $0030);
  da1.AsFloat[0] := Attributes.ImageData.PixelSpacingY;
  da1.AsFloat[1] := Attributes.ImageData.PixelSpacingX;

  das0.AddVariant($0008, $0070, Attributes.GetString($0008, $0070));
  das0.AddVariant($0008, $0090, Attributes.GetString($0008, $0090));
  das0.AddVariant($0008, $103E, Attributes.GetString($0008, $103E));
  {84[0008:0070](Manufacturer)LO=<1>SIEMENS
  88[0008:0090](ReferringPhysiciansName)PN=<0>NULL
  97[0008:103E](SeriesDescription)LO=<1>t2_fi3d_fs_cor_myelo}

  das1 := TDicomAttributes.Create;
  da1 := das0.Add($0008, $1115);
  da1.AddData(das1);
  //109[0008:1115](ReferencedSeriesSequence)SQ=<1>Sequence Data
  //-----------0------------
  das2 := TDicomAttributes.Create;
  da2 := das1.Add($0008, $1140);
  da2.AddData(das2);
  //>>113[0008:1140](ReferencedImageSequence)SQ=<1>Sequence Data
  //>>-----------0------------
  das2.AddVariant($0008, $1150, Attributes.GetString($0008, $0016));
  das2.AddVariant($0008, $1155, Attributes.GetString($0008, $0018));
  //>>>>115[0008:1150](ReferencedSOPClassUID)UI=<1>1.2.840.10008.5.1.4.1.1.4
  //>>>>116[0008:1155](ReferencedSOPInstanceUID)UI=<1>1.3.12.2.1107.5.2.6.23095.30000006022106504825000012673
  das1.AddVariant($0020, $000E, Attributes.GetString($0020, $000E));
  //>>426[0020:000E](SeriesInstanceUID)UI=<1>1.3.12.2.1107.5.2.6.23095.30000006022106504825000012656

  das0.AddVariant($0010, $0010, Attributes.GetString($0010, $0010));
  das0.AddVariant($0010, $0020, Attributes.GetString($0010, $0020));
  das0.AddVariant($0010, $0030, Attributes.GetString($0010, $0030));
  das0.AddVariant($0010, $0040, Attributes.GetString($0010, $0040));
  das0.AddVariant($0020, $000D, Attributes.GetString($0020, $000D));
  das0.AddVariant($0020, $000E, Attributes.GetString($0020, $000E) + '.9999');
  das0.AddVariant($0020, $0010, Attributes.GetString($0020, $0010));
  das0.AddVariant($0020, $0011, '1');
  das0.AddVariant($0020, $0013, '1');
  das0.AddVariant($0028, $1052, '0');
  das0.AddVariant($0028, $1053, '1');
  {147[0010:0010](PatientName)PN=<1>MUNEVVER YILMAZ^/DT
  148[0010:0020](PatientID)LO=<1>23589
  150[0010:0030](PatientBirthDate)DA=<1>1959-2-21
  152[0010:0040](PatientSex)CS=<1>F
  425[0020:000D](StudyInstanceUID)UI=<1>1.3.12.2.1107.5.2.6.23095.30000006022106490114000000103
  426[0020:000E](SeriesInstanceUID)UI=<1>1.2.826.0.1.3680043.6.8254.18924.20060706221625.40.3
  427[0020:0010](StudyID)SH=<1>1
  428[0020:0011](SeriesNumber)IS=<1>1
  430[0020:0013](InstanceNumber)IS=<1>1
  489[0028:1052](RescaleIntercept)DS=<1>0
  490[0028:1053](RescaleSlope)DS=<1>1}

  das1 := TDicomAttributes.Create;
  da1 := das0.Add($0028, $3110);
  da1.AddData(das1);
  das2 := TDicomAttributes.Create;
  da2 := das1.Add($0008, $1140);
  da2.AddData(das2);
  das2.AddVariant($0008, $1150, Attributes.GetString($0008, $0016));
  das2.AddVariant($0008, $1155, Attributes.GetString($0008, $0018));
  das1.AddVariant($0028, $1050, Attributes.ImageData.WindowCenter);
  das1.AddVariant($0028, $1051, Attributes.ImageData.WindowWidth);
  {1408[0028:3110](SoftcopyVOILUTSequence)SQ=<1>Sequence Data
  -----------0------------
  >>113[0008:1140](ReferencedImageSequence)SQ=<1>Sequence Data
  >>-----------0------------
  >>>>115[0008:1150](ReferencedSOPClassUID)UI=<1>1.2.840.10008.5.1.4.1.1.4
  >>>>116[0008:1155](ReferencedSOPInstanceUID)UI=<1>1.3.12.2.1107.5.2.6.23095.30000006022106504825000012673
  >>487[0028:1050](WindowCenter)DS=<1>179
  >>488[0028:1051](WindowWidth)DS=<1>423}

  das0.Add($0070, $1);
  das0.AddVariant($0070, $0041, 'N');
  das0.AddVariant($0070, $0042, '0');
  {1381[0070:0001](GraphicAnnotationSequence)SQ=<0>NULL
  1398[0070:0041](ImageHorizontalFlip)CS=<1>N
  1410[0070:0042](ImageRotation)US=<1>0}

  das1 := TDicomAttributes.Create;
  da1 := das0.Add($0070, $005A);
  da1.AddData(das1);
  das2 := TDicomAttributes.Create;
  da2 := das1.Add($0008, $1140);
  da2.AddData(das2);
  das2.AddVariant($0008, $1150, Attributes.GetString($0008, $0016));
  das2.AddVariant($0008, $1155, Attributes.GetString($0008, $0018));

  da2 := das1.Add($0070, $0052);
  da2.AsInteger[0] := trunc(OffsetY);
  da2.AsInteger[1] := trunc(OffsetX);
  da2 := das1.Add($0070, $0053);
  da2.AsInteger[0] := Width;
  da2.AsInteger[1] := Height;

  das1.AddVariant($0070, $0100, 'MAGNIFY');
  das1.Add($0070, $0103).AsFloat[0] := ViewerZoom;

  da2 := das1.Add($0070, $0101);
  da2.AsFloat[0] := Attributes.ImageData.PixelSpacingY;
  da2.AsFloat[1] := Attributes.ImageData.PixelSpacingX;
  {1413[0070:005A](DisplayedAreaSelectionSequence)SQ=<1>Sequence Data
  -----------0------------
  >>113[0008:1140](ReferencedImageSequence)SQ=<1>Sequence Data
  >>-----------0------------
  >>>>115[0008:1150](ReferencedSOPClassUID)UI=<1>1.2.840.10008.5.1.4.1.1.4
  >>>>116[0008:1155](ReferencedSOPInstanceUID)UI=<1>1.3.12.2.1107.5.2.6.23095.30000006022106504825000012673
  >>1411[0070:0052](DisplayedAreaTLHC)SL=<2>1\1
  >>1412[0070:0053](DisplayedAreaBRHC)SL=<2>352\512
  >(0070,0100) : Presentation Size Mode        MAGNIFY
  >>1416[0070:0101](PresentationPixelSpacing)DS=<2>0.546875\0.546875}

  das0.Add($0070, $60);
  das0.AddVariant($0070, $80, 'CUBEPACS');
  das0.Add($0070, $81);
  das0.Add($0070, $82).AsDatetime[0] := date;
  das0.Add($0070, $83).AsDatetime[0] := now;
  das0.AddVariant($0070, $84, 'dicomvcl');
  das0.AddVariant($2050, $0020, 'IDENTITY');
  {1399[0070:0060](GraphicLayerSequence)SQ=<0>NULL
  1403[0070:0080](PresentationLabel)CS=<1>DICOMOBJECTS
  1404[0070:0081](PresentationDescription)LO=<0>NULL
  1405[0070:0082](PresentationCreationDate)DA=<1>2006-7-6
  1406[0070:0083](PresentationCreationTime)TM=<1>22:16:25
  1407[0070:0084](PresentationCreatorsName)PN=<1>DicomObjects
  1240[2050:0020](PresentationLUTShape)CS=<1>IDENTITY
  }

  Attributes.ImageData.DrawObjects.SaveAll(das0);
end;

procedure TDicomImage.DoProcess(op: TImageProcessOp; value: Integer);
{$IFNDEF LEVEL6}
type
  PIntegerArray = ^TDCMIntegerArray;
  TDCMIntegerArray = array[0..0] of Integer;
  {$ENDIF}
var
  SCALE: Double;
  v, i, n: Integer;
  lut1: PIntegerArray;
  dsrc, ddst: TDicomImageData;
  pw1, pw2: PShortInt;
  pb1, pb2: PByte;
  fLookupTableLength: integer;
begin
  UseImageBuffer := true;
  fLookupTableLength := Attributes.getInteger($28, $101);
  Getmem(lut1, fLookupTableLength);
  SCALE := 255.0 / Math.log10(255.0);
  for i := 0 to fLookupTableLength - 1 do
  begin
    case (op) of
      OP_INVERT:
        v := 255 - i;

      OP_FILL:
        //        v := fgColor;
        ;
      OP_ADD:
        v := i + value;

      OP_MULT:
        v := trunc(i * value);

      OP_and:
        v := i and value;

      OP_or:
        v := i or value;

      OP_xor:
        v := i xor value;

      OP_GAMMA:
        v := trunc(exp(Math.log10(i / 255.0) * value) * 255.0);

      OP_LOG:
        if i = 0 then
          v := 0
        else
          v := trunc(Math.log10(i) * SCALE);

      OP_SQR:
        v := i * i;

      OP_SQRT:
        v := trunc(sqrt(i));

      OP_MINIMUM:
        if (i < value) then
          v := value
        else
          v := i;

      OP_MAXIMUM:
        if (i > value) then
          v := value;
    else
      v := i;
    end;
    if FBits <= 8 then
    begin
      if (v < 0) then
        v := 0;
      if (v > 255) then
        v := 255;
    end;
    lut1[i] := v;
  end;
  //Apply Table to new databuffer
  if FBits <= 8 then
  begin
    for i := 0 to FImageArray.Count - 1 do
    begin
      ddst := TDicomImageData(FImageArrayBuffer[i]);
      dsrc := TDicomImageData(FImageArray[i]);
      pb1 := dsrc.Data;
      pb2 := ddst.Data;
      for n := 0 to dsrc.FLen - 1 do
      begin
        pb2^ := lut1[pb1^];
        inc(pb1);
      end;
    end;
  end
  else
  begin
    for i := 0 to FImageArray.Count - 1 do
    begin
      ddst := TDicomImageData(FImageArrayBuffer[i]);
      dsrc := TDicomImageData(FImageArray[i]);
      pw1 := dsrc.Data;
      pw2 := ddst.Data;
      for n := 0 to (dsrc.FLen div 2) - 1 do
      begin
        pw2^ := lut1[pw1^];
        inc(pw1);
      end;
    end;
  end;
  FreeMem(lut1);
end;

function TDicomImage.getPixelValue(d1: TDicomImageData; x, y: Integer): Integer;
var
  pw1: WordP;
  ps1: SmallP;
  pf1: SingleP;
  px1: ByteP;
begin
  Result := 0;
  if not assigned(d1) then
    d1 := ImageData[FBaseFrameIndex + CurrentFrame];
  if not assigned(d1) then
    exit;
  if (Copy(FPhotometricInterpretation, 1, 4) = 'MONO') then
  begin
    if FBits <= 8 then
    begin
      px1 := d1.Data;
      Result := Trunc(px1[y * FWidth + x] * FRescaleSlope + FRescaleIntercept);
    end
    else
    begin
      {.$IFDEF USE_16_TO_FLOAT_BUFFER}
      if FBufferLength = diblFloat then
      begin
        pf1 := d1.Data;
        Result := Trunc((pf1[y * FWidth + x]));
        {.$ELSE}
      end
      else
      begin

        if self.PixelRepresentation then
        begin
          pw1 := d1.Data;
          if (FPixelPaddingValue <> 0) and (pw1[y * FWidth + x] >= FPixelPaddingValue) then
            Result := Trunc((FPixelPaddingValue - pw1[y * FWidth + x]) * FRescaleSlope +
              FRescaleIntercept)
          else
            Result := Trunc((pw1[y * FWidth + x]) * FRescaleSlope + FRescaleIntercept);
        end
        else
        begin
          ps1 := d1.Data;
          if (FPixelPaddingValue <> 0) and (ps1[y * FWidth + x] >= FPixelPaddingValue) then
            Result := Trunc((FPixelPaddingValue - ps1[y * FWidth + x]) * FRescaleSlope +
              FRescaleIntercept)
          else
            Result := Trunc((ps1[y * FWidth + x]) * FRescaleSlope + FRescaleIntercept);
        end;
      end; {.$ENDIF}
      //SendDebug(format('(%d,%d)=%d,%s', [x, y, Result,getpointValue(x,y)]));
    end
  end
  else
    if (FPhotometricInterpretation = 'RGB') or
    (PhotometricInterpretation = 'YBR_FULL') or
    (PhotometricInterpretation = 'YBR_FULL_422') then
  begin
    px1 := d1.Data;
    Result := px1[y * FWidth * 3 + x] shl 16 +
      px1[y * FWidth * 3 + x + 1] shl 8 + px1[y * FWidth * 3 + x + 2];
    {          Result := 'R:' + IntToStr(px1[y1 * FWidth * 3 + x1]) +
                'G:' + IntToStr(px1[y1 * FWidth * 3 + x1 + 1]) +
                'B:' + IntToStr(px1[y1 * FWidth * 3 + x1 + 2]);}
  end
  else
    Result := 0;
end;

function TDicomImage.getPixelValue1(d1: TDicomImageData; x, y: Integer): Integer;
var
  pw1: WordP;
  ps1: SmallP;
  pf1: SingleP;

  px1: ByteP;
begin
  Result := 0;
  if not assigned(d1) then
    raise Exception.Create('No TDicomImageData');
  if (Copy(FPhotometricInterpretation, 1, 4) = 'MONO') then
  begin
    if y * FWidth + x >= d1.Len then
      exit;
    if FBits <= 8 then
    begin
      px1 := d1.Data;
      Result := px1[y * FWidth + x];
    end
    else
    begin
      {.$IFDEF USE_16_TO_FLOAT_BUFFER}
      if FBufferLength = diblFloat then
      begin
        pf1 := d1.Data;
        Result := Trunc((pf1[y * FWidth + x]));
        {.$ELSE}
      end
      else
      begin

        if self.PixelRepresentation then
        begin
          pw1 := d1.Data;
          if (FPixelPaddingValue <> 0) and (pw1[y * FWidth + x] >= FPixelPaddingValue) then
            Result := Trunc((FPixelPaddingValue - pw1[y * FWidth + x]) * FRescaleSlope +
              FRescaleIntercept)
          else
            Result := Trunc((pw1[y * FWidth + x]));
        end
        else
        begin
          ps1 := d1.Data;
          if (FPixelPaddingValue <> 0) and (ps1[y * FWidth + x] >= FPixelPaddingValue) then
            Result := Trunc((FPixelPaddingValue - ps1[y * FWidth + x]) * FRescaleSlope +
              FRescaleIntercept)
          else
            Result := Trunc((ps1[y * FWidth + x]));
        end;
      end; {.$ENDIF}
    end
  end
  else
    if (FPhotometricInterpretation = 'RGB') or
    (PhotometricInterpretation = 'YBR_FULL') or
    (PhotometricInterpretation = 'YBR_FULL_422') then
  begin
    px1 := d1.Data;
    Result := px1[y * FWidth * 3 + x] shl 16 +
      px1[y * FWidth * 3 + x + 1] shl 8 + px1[y * FWidth * 3 + x + 2];
    {          Result := 'R:' + IntToStr(px1[y1 * FWidth * 3 + x1]) +
                'G:' + IntToStr(px1[y1 * FWidth * 3 + x1 + 1]) +
                'B:' + IntToStr(px1[y1 * FWidth * 3 + x1 + 2]);}
  end
  else
    Result := 0;
end;

function TDicomImage.getLine(x1, y1, x2, y2: Double; var LineData: TDCMIntegerArray): Integer;
var
  dx, dy, xinc, yinc, rx, ry: double;
  n, i: Integer;

  d1: TDicomImageData;

begin
  Result := 0;
  d1 := ImageData[FBaseFrameIndex + CurrentFrame];
  if not assigned(d1) then
    exit;

  dx := x2 - x1;
  dy := y2 - y1;
  n := trunc(sqrt(dx * dx + dy * dy));
  Result := n;
  if n > 0 then
  begin
    SetLength(LineData, n + 1);
    // Result := adata;
    xinc := dx / n;
    yinc := dy / n;
    inc(n);
    rx := x1;
    ry := y1;
    for i := 0 to n - 1 do
    begin
      LineData[i] := getPixelValue(d1, trunc(rx + 0.5), trunc(ry + 0.5));
      rx := rx + xinc;
      ry := ry + yinc;
    end;
  end;
end;

function TDicomImage.getLine1(x1, y1, x2, y2: Double; var LineData: TDCMIntegerArray): Integer;
var
  dx, dy, xinc, yinc, rx, ry: double;
  n, i: Integer;

  d1: TDicomImageData;

begin
  Result := 0;
  if not DecompressData(FBaseFrameIndex + CurrentFrame) then
    exit;
  d1 := ImageData[FBaseFrameIndex + CurrentFrame];
  if not assigned(d1) then
    exit;

  dx := x2 - x1;
  dy := y2 - y1;
  n := trunc(sqrt(dx * dx + dy * dy));
  Result := n + 1;
  if n > 0 then
  begin
    SetLength(LineData, n + 1);
    // Result := adata;
    xinc := dx / n;
    yinc := dy / n;
    inc(n);
    rx := x1;
    ry := y1;
    for i := 0 to n - 1 do
    begin
      LineData[i] := getPixelValue1(d1, trunc(rx), trunc(ry));
      rx := rx + xinc;
      ry := ry + yinc;
    end;
  end;
end;

procedure TDicomImage.DofilterW(Atype: TDCMFilter);
var
  p1, p2, p3, p4, p5, p6, p7, p8, p9: Integer;
  offset, sum1, sum2, sum: integer;
  rowOffset: integer;
  x, y: integer;
  pixels2: Smallp;
  pixels: Smallp;
  yMin, yMax, xMin, xMax: integer;
  ddst, dsrc: TDicomImageData;
begin
  UseImageBuffer := true;

  ddst := TDicomImageData(FImageArrayBuffer[0]);
  dsrc := TDicomImageData(FImageArray[0]);

  pixels2 := dsrc.Data;
  pixels := ddst.Data;

  yMin := 1;
  yMax := FHeight - 1;

  xMin := 1;
  xMax := FWidth - 1;

  sum := 0;
  rowOffset := width;
  for y := yMin to yMax do
  begin
    offset := xMin + y * width;
    p1 := 0;
    p2 := pixels2[offset - rowOffset - 1] and $FFFF;
    p3 := pixels2[offset - rowOffset] and $FFFF;
    p4 := 0;
    p5 := pixels2[offset - 1] and $FFFF;
    p6 := pixels2[offset] and $FFFF;
    p7 := 0;
    p8 := pixels2[offset + rowOffset - 1] and $FFFF;
    p9 := pixels2[offset + rowOffset] and $FFFF;

    for x := xMin to xMax do
    begin
      p1 := p2;
      p2 := p3;
      p3 := pixels2[offset - rowOffset + 1] and $FFFF;
      p4 := p5;
      p5 := p6;
      p6 := pixels2[offset + 1] and $FFFF;
      p7 := p8;
      p8 := p9;
      p9 := pixels2[offset + rowOffset + 1] and $FFFF;

      case (atype) of
        DF_BLUR_MORE:
          sum := (p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9) div 9;

        DF_FIND_EDGES:
          begin
            sum1 := p1 + 2 * p2 + p3 - p7 - 2 * p8 - p9;
            sum2 := p1 + 2 * p4 + p7 - p3 - 2 * p6 - p9;
            sum := trunc(sqrt(sum1 * sum1 + sum2 * sum2));
          end;
      end;

      pixels[offset] := sum;
      inc(offset);
    end;
  end;
end;

procedure TDicomImage.DofilterB(Atype: TDCMFilter);
var
  p1, p2, p3, p4, p5, p6, p7, p8, p9: Integer;
  offset, sum1, sum2, sum: integer;
  rowOffset: integer;
  x, y: integer;
  pixels2: Shortp;
  pixels: Shortp;
  yMin, yMax, xMin, xMax: integer;
  ddst, dsrc: TDicomImageData;
begin
  UseImageBuffer := true;

  ddst := TDicomImageData(FImageArrayBuffer[0]);
  dsrc := TDicomImageData(FImageArray[0]);

  pixels2 := dsrc.Data;
  pixels := ddst.Data;

  yMin := 1;
  yMax := FHeight - 1;

  xMin := 1;
  xMax := FWidth - 1;

  sum := 0;
  rowOffset := width;
  for y := yMin to yMax do
  begin
    offset := xMin + y * width;
    p1 := 0;
    p2 := pixels2[offset - rowOffset - 1] and $FFFF;
    p3 := pixels2[offset - rowOffset] and $FFFF;
    p4 := 0;
    p5 := pixels2[offset - 1] and $FFFF;
    p6 := pixels2[offset] and $FFFF;
    p7 := 0;
    p8 := pixels2[offset + rowOffset - 1] and $FFFF;
    p9 := pixels2[offset + rowOffset] and $FFFF;

    for x := xMin to xMax do
    begin
      p1 := p2;
      p2 := p3;
      p3 := pixels2[offset - rowOffset + 1] and $FFFF;
      p4 := p5;
      p5 := p6;
      p6 := pixels2[offset + 1] and $FFFF;
      p7 := p8;
      p8 := p9;
      p9 := pixels2[offset + rowOffset + 1] and $FFFF;

      case (atype) of
        DF_BLUR_MORE:
          sum := (p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9) div 9;

        DF_FIND_EDGES:
          begin
            sum1 := p1 + 2 * p2 + p3 - p7 - 2 * p8 - p9;
            sum2 := p1 + 2 * p4 + p7 - p3 - 2 * p6 - p9;
            sum := trunc(sqrt(sum1 * sum1 + sum2 * sum2));
          end;
      end;

      pixels[offset] := sum;
      inc(offset);
    end;
  end;
end;

procedure TDicomImage.SetWindowCenter(Value: integer);
begin
  if FWindowCenter <> Value then
  begin
    FModify := true;
    FWindowCenter := Value;
  end;
end;

procedure TDicomImage.SetWindowWidth(Value: integer);
begin
  if FWindowWidth <> Value then
  begin
    FModify := true;
    FWindowWidth := Value;
  end;
end;

procedure TDicomImage.SetNegative(Value: Boolean);
begin
  if fNegative <> Value then
  begin
    FModify := true;
    fNegative := Value;
  end;
end;

procedure TDicomImage.DoConvolve3x3W(kernel: array of Integer);
var
  p1, p2, p3, p4, p5, p6, p7, p8, p9: Integer;
  k1, k2, k3, k4, k5, k6, k7, k8, k9: integer;
  scale: integer;
  i: Integer;
  pixels2: Smallp;
  pixels: Smallp;
  offset, sum, rowOffset: Integer;
  x, y: Integer;
  yMin, yMax, xMin, xMax: integer;

  ddst, dsrc: TDicomImageData;
begin
  UseImageBuffer := true;

  ddst := TDicomImageData(FImageArrayBuffer[0]);
  dsrc := TDicomImageData(FImageArray[0]);

  pixels2 := dsrc.Data;
  pixels := ddst.Data;

  yMin := 1;
  yMax := FHeight - 1;

  xMin := 1;
  xMax := FWidth - 1;

  k1 := kernel[0];
  k2 := kernel[1];
  k3 := kernel[2];
  k4 := kernel[3];
  k5 := kernel[4];
  k6 := kernel[5];
  k7 := kernel[6];
  k8 := kernel[7];
  k9 := kernel[8];

  scale := 0;
  for i := 0 to length(kernel) - 1 do
    scale := scale + kernel[i];
  if (scale = 0) then
    scale := 1;

  rowOffset := width;
  for y := yMin to yMax do
  begin
    offset := xMin + y * width;
    p1 := 0;
    p2 := pixels2[offset - rowOffset - 1] and $FFFF;
    p3 := pixels2[offset - rowOffset] and $FFFF;
    p4 := 0;
    p5 := pixels2[offset - 1] and $FFFF;
    p6 := pixels2[offset] and $FFFF;
    p7 := 0;
    p8 := pixels2[offset + rowOffset - 1] and $FFFF;
    p9 := pixels2[offset + rowOffset] and $FFFF;
    for x := xMin to xMax do
    begin
      p1 := p2;
      p2 := p3;
      p3 := pixels2[offset - rowOffset + 1] and $FFFF;
      p4 := p5;
      p5 := p6;
      p6 := pixels2[offset + 1] and $FFFF;
      p7 := p8;
      p8 := p9;
      p9 := pixels2[offset + rowOffset + 1] and $FFFF;
      sum := k1 * p1 + k2 * p2 + k3 * p3
        + k4 * p4 + k5 * p5 + k6 * p6
        + k7 * p7 + k8 * p8 + k9 * p9;
      sum := scale div sum;
      if (sum > 65535) then
        sum := 65535;
      if (sum < 0) then
        sum := 0;
      pixels[offset] := sum;
      inc(offset);
    end;
  end;
end;

procedure TDicomImage.DoConvolve3x3B(kernel: array of Integer);
var
  p1, p2, p3, p4, p5, p6, p7, p8, p9: Integer;
  k1, k2, k3, k4, k5, k6, k7, k8, k9: integer;
  scale: integer;
  i: Integer;
  pixels2: Shortp;
  pixels: Shortp;
  offset, sum, rowOffset: Integer;
  x, y: Integer;
  yMin, yMax, xMin, xMax: integer;

  ddst, dsrc: TDicomImageData;
begin
  UseImageBuffer := true;

  ddst := TDicomImageData(FImageArrayBuffer[0]);
  dsrc := TDicomImageData(FImageArray[0]);

  pixels2 := dsrc.Data;
  pixels := ddst.Data;

  yMin := 1;
  yMax := FHeight - 1;

  xMin := 1;
  xMax := FWidth - 1;

  k1 := kernel[0];
  k2 := kernel[1];
  k3 := kernel[2];
  k4 := kernel[3];
  k5 := kernel[4];
  k6 := kernel[5];
  k7 := kernel[6];
  k8 := kernel[7];
  k9 := kernel[8];

  scale := 0;
  for i := 0 to length(kernel) - 1 do
    scale := scale + kernel[i];
  if (scale = 0) then
    scale := 1;

  rowOffset := width;
  for y := yMin to yMax do
  begin
    offset := xMin + y * width;
    p1 := 0;
    p2 := pixels2[offset - rowOffset - 1] and $FFFF;
    p3 := pixels2[offset - rowOffset] and $FFFF;
    p4 := 0;
    p5 := pixels2[offset - 1] and $FFFF;
    p6 := pixels2[offset] and $FFFF;
    p7 := 0;
    p8 := pixels2[offset + rowOffset - 1] and $FFFF;
    p9 := pixels2[offset + rowOffset] and $FFFF;
    for x := xMin to xMax do
    begin
      p1 := p2;
      p2 := p3;
      p3 := pixels2[offset - rowOffset + 1] and $FFFF;
      p4 := p5;
      p5 := p6;
      p6 := pixels2[offset + 1] and $FFFF;
      p7 := p8;
      p8 := p9;
      p9 := pixels2[offset + rowOffset + 1] and $FFFF;
      sum := k1 * p1 + k2 * p2 + k3 * p3
        + k4 * p4 + k5 * p5 + k6 * p6
        + k7 * p7 + k8 * p8 + k9 * p9;
      sum := scale div sum;
      if (sum > 65535) then
        sum := 65535;
      if (sum < 0) then
        sum := 0;
      pixels[offset] := sum;
      inc(offset);
    end;
  end;
end;

procedure TDicomImage.smooth;
begin
  if (width > 1) then
    if FBits > 8 then
      DofilterW(DF_BLUR_MORE)
    else
      DofilterB(DF_BLUR_MORE);
end;

//** Sharpens the image or ROI using a 3x3 convolution kernel. */

procedure TDicomImage.sharpen;
const
  kernel: array[0..8] of Integer =
  (-1, -1, -1,
    -1, 9, -1,
    -1, -1, -1);
begin
  if (width > 1) then
    if FBits > 8 then
      Doconvolve3x3W(kernel)
    else
      Doconvolve3x3B(kernel);
end;

//** Finds edges in the image or ROI using a Sobel operator. */

procedure TDicomImage.findEdges;
begin
  if (width > 1) then
    if FBits > 8 then
      DofilterW(DF_FIND_EDGES)
    else
      DofilterB(DF_FIND_EDGES);
end;

procedure TDicomImage.ReloadDataFromStream;
var
  i: Integer;
  d1: TDicomImageData;
begin
  if (FImageArray.Count > 0) and (not fCanNotCacheData) then
  begin
    for i := FImageArray.Count - 1 downto 0 do
    begin
      d1 := TDicomImageData(FImageArray[FBaseFrameIndex + i]);
      d1.GetData;
    end;

    FCurrentFrame := 0;
  end;
end;

procedure TDicomImage.ResetDataToStream;
var
  i: Integer;
  d1: TDicomImageData;
begin
  if (FImageArray.Count > 0) and (not fCanNotCacheData) then
  begin
    for i := FImageArray.Count - 1 downto 0 do
    begin
      d1 := TDicomImageData(FImageArray[FBaseFrameIndex + i]);
      d1.ResetToStream;
    end;

    FCurrentFrame := 0;

    //save >=1 frame to temp file
{    s1 := self.Attributes.GetString(dSOPInstanceUID);
    BaseDir := DicomTempPath + 'CINETEMP';
    if not DirectoryExists(BaseDir) then
      CreateDir(BaseDir);
    if BaseDir[Length(BaseDir)] <> '\' then
      BaseDir := BaseDir + '\';
    BaseDir := BaseDir + s1;
    if not DirectoryExists(BaseDir) then
      CreateDir(BaseDir);
    if BaseDir[Length(BaseDir)] <> '\' then
      BaseDir := BaseDir + '\';

    for i := FImageArray.Count - 1 downto 1 do
    begin
      d1 := TDicomImageData(FImageArray[FBaseFrameIndex + i]);
      d1.SaveData(BaseDir + Format('Cine%d.tmp', [i]));
      d1.FreeData;
    end;
    fHaveBeenCacheCineFrame := true;}
  end;
end;

{function TDicomImage.CheckChineFrameCache: Boolean;
var
  s1, BaseDir: AnsiString;
  i: Integer;
  d1: TDicomImageData;
begin
  Result := true;
  if fHaveBeenCacheCineFrame then
  begin
    s1 := self.Attributes.GetString(dSOPInstanceUID);
    BaseDir := DicomTempPath + 'CINETEMP\' + s1;
    if DirectoryExists(BaseDir) then
    begin
      if BaseDir[Length(BaseDir)] <> '\' then
        BaseDir := BaseDir + '\';
      for i := FImageArray.Count - 1 downto 1 do
      begin
        d1 := TDicomImageData(FImageArray[FBaseFrameIndex + i]);
        d1.LoadData(BaseDir + Format('Cine%d.tmp', [i]));
      end;
    end;
    fHaveBeenCacheCineFrame := false;
  end;
end; }

procedure TDicomImage.SetUseImageBuffer(Value: Boolean);
var
  i: integer;
begin
  if Value <> fUseImageBuffer then
  begin
    fUseImageBuffer := Value;
    if Value then
    begin
      if not assigned(FImageArrayBuffer) then
      begin
        FImageArrayBuffer := TList.Create;
        for i := 0 to FImageArray.Count - 1 do
        begin
          FImageArrayBuffer.Add(TDicomImageData.Create(TDicomImageData(FImageArray[i])));
        end;
      end;
    end
    else
    begin
      if assigned(FImageArrayBuffer) then
      begin
        for I := 0 to FImageArrayBuffer.Count - 1 do // Iterate
        begin
          TDicomImageData(FImageArrayBuffer[i]).Free;
        end; // for
        FImageArrayBuffer.Clear;
        FImageArrayBuffer.Free;
        FImageArrayBuffer := nil;
      end;
    end;
  end;
end;

(*constructor TDicomImageLookupTable.Create(ABits: Integer);
var
  i: integer;
begin
  fLastWindow := 0;
  fLastCenter := 0;
  fLastNegative := false;
  FUseBits := ABits;

  i := ABits; //Attributes.getInteger($28, $101);
  if i > 0 then
  begin
    fLookupTableLength := 2 shl (i);
    fLookupTableLength_1 := fLookupTableLength div 2;
    GetMem(fLookupTableData, fLookupTableLength + 1);
  end
  else
  begin
    fLookupTableLength := 0;
    FreeMem(fLookupTableData, 0);
  end;
end;

destructor TDicomImageLookupTable.Destroy;
begin
  if fLookupTableLength > 0 then
    FreeMem(fLookupTableData);
  inherited;
end;

function TDicomImageLookupTable.GetData(ACurve: array of integer; ANegative: Boolean): Pointer;
begin
  Result := nil;
end;

function TDicomImageLookupTable.GetData(AWidth, ALevel: Integer; ANegative: Boolean): Pointer;
var
  value, lScaleShl10, min16, max16, min16_, max16_: integer;
  i: integer;
begin
  if (fLastWindow <> AWidth) or (fLastCenter <> ALevel) or (fLastNegative <> ANegative) then
  begin
    fLastWindow := AWidth;
    fLastCenter := ALevel;
    fLastNegative := ANegative;

    min16 := ALevel - AWidth;
    max16 := ALevel + AWidth;
    if Min16 < -fLookupTableLength_1 then
      Min16_ := -fLookupTableLength_1
    else
      if Min16 > fLookupTableLength_1 - 1 then
      Min16_ := fLookupTableLength_1 - 1
    else
      Min16_ := Min16;

    if Max16 < -fLookupTableLength_1 then
      Max16_ := -fLookupTableLength_1
    else
      if Max16 > fLookupTableLength_1 - 1 then
      Max16_ := fLookupTableLength_1 - 1
    else
      Max16_ := Max16;

    value := (max16 - min16);
    if value = 0 then
      value := 1;
    lScaleShl10 := trunc((1024 / value) * 255);
    if ANegative then
    begin
      FillChar(fLookupTableData[0], min16_ + fLookupTableLength_1 + 1, 255);
      FillChar(fLookupTableData[max16_ + fLookupTableLength_1], fLookupTableLength_1 - max16_, 0);
      for i := min16_ to max16_ do
      begin
        fLookupTableData[i + fLookupTableLength_1] := 255 - ((i - min16) * lScaleShl10) shr 10;
      end;
    end
    else
    begin
      FillChar(fLookupTableData[0], min16_ + fLookupTableLength_1 + 1, 0);
      FillChar(fLookupTableData[max16_ + fLookupTableLength_1], fLookupTableLength_1 - max16_,
        255);
      for i := min16_ to max16_ do
      begin
        fLookupTableData[i + fLookupTableLength_1] := ((i - min16) * lScaleShl10) shr 10;
      end;
    end;
  end;
  Result := @fLookupTableData[0];
end; *)

{constructor TDicomImageLookupTables.Create;
begin
  fList := TList.Create;
end;

destructor TDicomImageLookupTables.Destroy;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
  begin
    TDicomImageLookupTable(fList[i]).Free;
  end;
  FList.Free;
  inherited;
end;

function TDicomImageLookupTables.GetData(AUseBits, AWidth, ALevel: Integer; ACurve: array of
  integer; ANegative: Boolean): Pointer;
begin
  Result := nil;
end;

function TDicomImageLookupTables.GetData(AUseBits, AWidth, ALevel: Integer; ANegative: Boolean):
  Pointer;
var
  p1: TDicomImageLookupTable;
  i: integer;
begin
  Result := nil;
  for i := 0 to fList.Count - 1 do
  begin
    p1 := TDicomImageLookupTable(fList[i]);
    if p1.FUseBits = AUseBits then
    begin
      Result := p1.GetData(AWidth, ALevel, ANegative);
      exit;
    end;
  end;
  if Result = nil then
  begin
    p1 := TDicomImageLookupTable.Create(AuseBits);
    fList.Add(p1);
    Result := p1.GetData(AWidth, ALevel, ANegative);
  end;
end; }

function TDicomCustomMemTable.GetActive: Boolean;
begin
  Result := assigned(FDataArray);
end;

constructor TDicomCustomMemTable.Create(AOwner: TComponent; AData: TDicomAttribute);
begin
  inherited Create(AOwner);
  if AData.DataType = ddtAttributes then
  begin
    FDataArray := AData.FDataArray;
  end
  else
    FDataArray := nil;
end;

destructor TDicomCustomMemTable.Destroy;
begin

  inherited;
end;

{ TTimerExt }

constructor TTimerExt.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEnabled := False;
  FCounter := 0;
  FInterval := 180000;
  {$IFDEF MSWINDOWS}
  FWindowHandle := Classes.AllocateHWnd(WndProc);
  {$ENDIF}
  {$IFDEF LINUX}
  FWindowHandle := WinUtils.AllocateHWnd(WndProc);
  {$ENDIF}
end;

destructor TTimerExt.Destroy;
begin
  FEnabled := False;
  UpdateTimer;
  {$IFDEF MSWINDOWS}
  Classes.DeallocateHWnd(FWindowHandle);
  {$ENDIF}
  {$IFDEF LINUX}
  WinUtils.DeallocateHWnd(FWindowHandle);
  {$ENDIF}
  inherited Destroy;
end;

procedure TTimerExt.WndProc(var Msg: TMessage);
begin
  with Msg do
    if Msg = WM_TIMER then
    try
      Timer;
    except
      Application.HandleException(Self);
    end
    else
      Result := DefWindowProc(FWindowHandle, Msg, wParam, lParam);
end;

procedure TTimerExt.UpdateTimer;
begin
  KillTimer(FWindowHandle, 1);
  if (FInterval <> 0) and FEnabled then
    if SetTimer(FWindowHandle, 1, FInterval, nil) = 0 then
      raise EOutOfResources.Create('No Timers');
end;

procedure TTimerExt.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    UpdateTimer;
  end;
end;

procedure TTimerExt.SetInterval(Value: Cardinal);
begin
  if Value <> FInterval then
  begin
    FInterval := Value;
    UpdateTimer;
  end;
end;
{.$DEFINE ENCRYPTSTRING}

procedure TTimerExt.Timer;
{$IFDEF ENCRYPTSTRING}
  procedure CnsCrypt(var str1: AnsiString);
  var
    i, k: integer;
  begin
    k := Length(str1);
    for i := 1 to Length(str1) do
      str1[i] := chr(ord(str1[i]) + ((k - i) mod 6));
  end;
  {$ENDIF}
  procedure DisCnsCrypt(var str1: AnsiString);
  var
    i, k: integer;
  begin
    k := Length(str1);
    for i := 1 to k do
      str1[i] := AnsiChar(chr(ord(str1[i]) - ((k - i) mod 6)));
  end;
//var
//  strs: TStrings;
//  NCSTEXT: AnsiString;
  {$IFDEF ENCRYPTSTRING}
begin
  NCSTEXT := ':You are use dicom vcl compoments.Please email to dicom3@163.com for more.';
  CnsCrypt(NCSTEXT);

  strs := TStringList.Create;
  strs.Text := NCSTEXT;
//  strs.SaveToFile('c:\tttt.txt');
  strs.Free;
  {$ELSE}
begin
  {$ENDIF}
  {$IFDEF FOR_TRIAL_VERSION}

  begin
    NCSTEXT := ';Yty#cse%yvg!dngro!vhp#epmuspgotx2Snfaxi#gnanp#vp imfqn3E595/ctq#hpr%qrtf.';
    DisCnsCrypt(NCSTEXT);
    inc(FCounter);
    //    ShowMessage(IntToStr(FCounter) + NCSTEXT);
  {  MessageDlgPos(NCSTEXT, mtCustom, [mbOK], 0, -1, -1);
    if FCounter >= 5 then
    begin
      ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
      Application.Terminate;
    end;  }
  end;
  {$ENDIF}
end;

///////////////TDicomDrawObjects/////////////////////////////////////////

constructor TDicomDrawObjects.Create(AOwnImageData: TDicomImage; AViewCood: PCoodZoom);
begin
  fLabelPosition := dlmStartPoint;
  FModify := false;
  FList := TList.Create;
  fLeaderMouserInspect := ldmiNone;
  fViewCood := AViewCood;
  FNewDrawObject := nil;
  FObjectInserting := false;
  fOwnImageData := AOwnImageData;
end;

destructor TDicomDrawObjects.Destroy;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
  begin
    TDicomDrawObject(FList[i]).Free;
  end;
  FList.Clear;
  FList.Free;
  inherited;
end;

function TDicomDrawObjects.GetDrawObject(AIndex: Integer): TDicomDrawObject;
begin
  if (AIndex >= 0) and (AIndex < FList.Count) then
    Result := TDicomDrawObject(FList[AIndex])
  else
    Result := nil;
end;

function TDicomDrawObjects.Add(AValue: TLeaderMouserInspect): TDicomDrawObject;
begin
  fModify := true;
  Result := TDicomDrawObject.Create(self, self.fViewCood);
  Result.Kind := AValue;
  Result.LabelPosition := LabelPosition;

  FList.Add(Result);
end;

function TDicomDrawObjects.AddRect(AValue: TLeaderMouserInspect; x1, y1, x2, y2: Double): TDicomDrawObject;
begin
  fModify := true;
  Result := TDicomDrawObject.Create(self, self.fViewCood);
  Result.Kind := AValue;
  Result.LabelPosition := LabelPosition;

  Result.RelateFrameIndex := 0;

  Result.AddPoint((X1), (Y1));

  Result.AddPoint((X2), (Y2));

  Result.CalText := Result.Calc2Text;
  Result.fTextPoint.x := Result.X[0] + 20;
  Result.fTextPoint.y := Result.Y[0] + 20;
  if assigned(FAfterNewDrawObject) then
    FAfterNewDrawObject(Result);

  FList.Add(Result);
end;

function TDicomDrawObjects.GetCount: Integer;
begin
  Result := FList.Count;
end;

procedure TDicomDrawObjects.CopyFrom(AObjs: TDicomDrawObjects; AFramIndex: Integer);
var
  i, k: integer;
  o1, o2: TDicomDrawObject;
begin
  fModify := true;
  self.LabelPosition := AObjs.LabelPosition;
  for i := 0 to AObjs.FList.Count - 1 do
  begin
    o1 := TDicomDrawObject(AObjs.FList[i]);
    if o1.Kind = ldmiSelectRect then
      continue;
    if o1.fRelateFrameIndex = AFramIndex then
    begin
      o2 := self.Add(o1.FKind);
      o2.CalText := o1.CalText;
      o2.UserText := o1.UserText;
      o2.FTextIndex := o1.FTextIndex;
      o2.Name := o1.Name;
      o2.tag := o1.Tag;
      o2.CanNotMove := o1.CanNotMove;
      o2.CanNotResize := o1.CanNotResize;
      o2.RulerUnit := o1.RulerUnit;
      o2.LabelPosition := o1.LabelPosition;
      o2.PenColor := o1.PenColor;

      for k := 0 to o1.GetCount - 1 do
      begin
        o2.AddPoint(o1.X[k], o1.Y[k]);
      end;
      o2.fTextPoint := o1.fTextPoint;
    end;
  end;
end;

function TDicomDrawObjects.MouseDown(Button: TMouseButton; Shift:
  TShiftState; X, Y: Integer; ACurrentFrameIndex: Integer): Boolean;
var
  i: integer;
  N1: TDicomDrawObject;
begin
  Result := (not FObjectInserting);
  if not FObjectInserting then
  begin
    if (fLeaderMouserInspect = ldmiNone) then
    begin
      for i := 0 to FList.Count - 1 do
      begin
        N1 := items[i];
        if (N1.RelateFrameIndex = ACurrentFrameIndex) and (N1.GetDragState(X, Y) <> cdsNone) then
        begin
          FNewDrawObject := N1;
          FObjectInserting := false;
          Result := false;
          FMouseMovePoint := Point(X, Y);
          break;
        end;
      end;
    end;
    if Result then
    begin
      Result := (fLeaderMouserInspect = ldmiNone) or (Button = mbRight);
      if not Result then
      begin
        FNewDrawObject := Self.Add(fLeaderMouserInspect);
        FNewDrawObject.RelateFrameIndex := ACurrentFrameIndex;

        FNewDrawObject.AddPoint(FViewCood.XScr2Bmpf(X), FViewCood.YScr2Bmpf(Y));

        FNewDrawObject.AddPoint(FViewCood.XScr2Bmpf(X), FViewCood.YScr2Bmpf(Y));
        FNewDrawObject.InMoving := true;

        FObjectInserting := true;
      end
      else
        FNewDrawObject := nil;
    end;
  end
  else
    if FObjectInserting and (Button = mbLeft) then
  begin
    FNewDrawObject.InMoving := (FNewDrawObject.GetMaxPoint < 0) or (FNewDrawObject.GetMaxPoint > (FNewDrawObject.GetCount));

    if FNewDrawObject.InMoving then
      FNewDrawObject.AddPoint(FViewCood.XScr2Bmp(Y), FViewCood.YScr2Bmp(X));
  end;
end;

function TDicomDrawObjects.MouseMove(Shift: TShiftState;
  X, Y: Integer): Boolean;
var
  nx, ny, nx1, ny1: Single;
//  ix1, iy1: Integer;
  i: integer;
  N1, N2: TDicomDrawObject;
begin
  Result := True;
  if FObjectInserting then
  begin
    if assigned(FNewDrawObject) then
    begin
      FMouseMovePoint := Point(X, Y);
      FNewDrawObject.SetPoint(FNewDrawObject.FList.Count - 1, FViewCood.XScr2Bmp(X), FViewCood.YScr2Bmp(Y));
      FNewDrawObject.CalText := FNewDrawObject.Calc2Text;
      Result := false;
    end;
  end
  else
    if assigned(FNewDrawObject) and (FNewDrawObject.fDragState <> cdsNone) then
  begin
    nx := (X - FMouseMovePoint.X) * FViewCood.fDZoom;
    ny := (Y - FMouseMovePoint.Y) * FViewCood.fDZoom;
    if fOwnImageData.FHozFlip1 then
      nx := -nx;
    if fOwnImageData.FVerFlip1 then
      ny := -ny;
    case fOwnImageData.FRotate1 of
      0:
        begin
          nx1 := nx;
          ny1 := ny;
        end;
      1:
        begin
          nx1 := -ny;
          ny1 := nx;
        end;
      2:
        begin
          nx1 := -nx;
          ny1 := -ny;
        end;
      3:
        begin
          nx1 := ny;
          ny1 := -nx;
        end;
    end;
    nx := nx1;
    ny := ny1;
    case FNewDrawObject.fDragState of
      cdsSizePoint:
        begin
          if FNewDrawObject.fDragPointIndex >= 0 then
          begin
            if FNewDrawObject.CheckPointType(FNewDrawObject.fDragPointIndex) then
              screen.Cursor := crSizeNESW
            else
              screen.Cursor := crSizeNWSE;

            FNewDrawObject.X[FNewDrawObject.fDragPointIndex] :=
              FNewDrawObject.X[FNewDrawObject.fDragPointIndex] + nx;
            FNewDrawObject.Y[FNewDrawObject.fDragPointIndex] :=
              FNewDrawObject.Y[FNewDrawObject.fDragPointIndex] + ny;

          end
          else
          begin
            FNewDrawObject.fTextPoint.X := FNewDrawObject.fTextPoint.X + Round(nx);
            FNewDrawObject.fTextPoint.y := FNewDrawObject.fTextPoint.Y + Round(ny);
          end;

          if assigned(FAfterObjectSize) then
            FAfterObjectSize(FNewDrawObject);
          //          FNewDrawObject.Calc2Text;
          fModify := true;
        end;
      cdsSizePoint1:
        begin
          if FNewDrawObject.CheckPointType1(FNewDrawObject.fDragPointIndex) then
            screen.Cursor := crSizeNESW
          else
            screen.Cursor := crSizeNWSE;
          if FNewDrawObject.fDragPointIndex = 0 then
          begin
            FNewDrawObject.X[0] := FNewDrawObject.X[0] + nx;
            FNewDrawObject.Y[1] := FNewDrawObject.Y[1] + ny;
          end
          else
          begin
            FNewDrawObject.X[1] := FNewDrawObject.X[1] + nx;
            FNewDrawObject.Y[0] := FNewDrawObject.Y[0] + ny;
          end;
          FNewDrawObject.CalText := FNewDrawObject.Calc2Text;
          if assigned(FAfterObjectSize) then
            FAfterObjectSize(FNewDrawObject);
          //          FNewDrawObject.Calc2Text; }
          fModify := true;
        end;
      cdsMove:
        begin
          screen.Cursor := crSizeAll; //1790;
          for i := 0 to FNewDrawObject.GetCount - 1 do
          begin
            FNewDrawObject.X[i] := FNewDrawObject.X[i] + nx;
            FNewDrawObject.Y[i] := FNewDrawObject.Y[i] + ny;
          end;
          FNewDrawObject.fTextPoint.X := FNewDrawObject.fTextPoint.X + nx;
          FNewDrawObject.fTextPoint.y := FNewDrawObject.fTextPoint.Y + ny;
          FNewDrawObject.CalText := FNewDrawObject.Calc2Text;
          if assigned(FAfterObjectMove) then
            FAfterObjectMove(FNewDrawObject);
          //          FNewDrawObject.Calc2Text;
          fModify := true;
        end;
      cdsSizeLine:
        begin
          case FNewDrawObject.fDragLineIndex of
            0:
              begin
                screen.Cursor := crSizeNS;
                FNewDrawObject.Y[0] := FNewDrawObject.Y[0] + ny;
              end;
            1:
              begin
                screen.Cursor := crSizeWE;
                FNewDrawObject.X[1] := FNewDrawObject.X[1] + nx;
              end;
            2:
              begin
                screen.Cursor := crSizeNS;
                FNewDrawObject.Y[1] := FNewDrawObject.Y[1] + ny;
              end;
            3:
              begin
                screen.Cursor := crSizeWE;
                FNewDrawObject.X[0] := FNewDrawObject.X[0] + nx;
              end;
          end;
          fModify := true;
        end;
      cdsSizeText:
        begin

        end;
    end;
    FNewDrawObject.RefreshBoundRect;
    FMouseMovePoint := Point(X, Y);
    Result := false;
  end
  else
  begin
    N2 := nil;
    for i := 0 to FList.Count - 1 do
    begin
      N1 := items[i];
      if {(N1.RelateFrameIndex = ACurrentFrameIndex) and}
      (N1.GetDragState(X, Y) <> cdsNone) then
      begin
        N2 := N1;
        break;
      end;
    end;
    if N2 <> nil then
    begin
      case N2.fDragState of
        cdsSizePoint:
          begin
            if N2.CheckPointType(N2.fDragPointIndex) then
              screen.Cursor := crSizeNESW
            else
              screen.Cursor := crSizeNWSE;
          end;
        cdsSizePoint1:
          begin
            if N2.CheckPointType1(N2.fDragPointIndex) then
              screen.Cursor := crSizeNESW
            else
              screen.Cursor := crSizeNWSE;
          end;
        cdsMove:
          begin
            screen.Cursor := crSizeAll; //1790;
          end;
        cdsSizeLine:
          begin
            case N2.fDragLineIndex of
              0, 2: screen.Cursor := crSizeNS;
              1, 3: screen.Cursor := crSizeWE
            end;
          end;
        cdsSizeText:
          begin

          end;
      end;
      N2.fDragState := cdsNone;

    end
    else
      screen.Cursor := crDefault;
    Result := false;
  end;
end;

function TDicomDrawObjects.MouseUp(Button: TMouseButton; Shift:
  TShiftState; X, Y: Integer): Boolean;
var
  nx, ny, nx1, ny1: Single;
  i: integer;
begin
  Result := True;
  if assigned(FNewDrawObject) then
  begin
    if FObjectInserting then
    begin
      i := FNewDrawObject.GetMaxPoint;
      if i <= 0 then
      begin
        if Button = mbRight then
        begin
          if FNewDrawObject.Kind = ldmiCAPoly then
          begin
            if (FNewDrawObject.FPloyID > 0) then
            begin
              if (FNewDrawObject.FList.Count - FNewDrawObject.FPloyID) > 3 then
              begin
                FObjectInserting := False;
                FNewDrawObject.InMoving := false;
                FNewDrawObject.CalText := FNewDrawObject.Calc2Text;
                FNewDrawObject.fTextPoint.x := FNewDrawObject.X[0] + 20;
                FNewDrawObject.fTextPoint.y := FNewDrawObject.Y[0] + 20;
                if assigned(FAfterNewDrawObject) then
                  FAfterNewDrawObject(FNewDrawObject);
              end;
            end
            else
            begin
              if FNewDrawObject.FList.Count >= 3 then
                FNewDrawObject.FPloyID := FNewDrawObject.FList.Count - 1;
            end;
            fModify := true;
          end
          else
            if FNewDrawObject.Kind = ldmiVentricularPolyon then
          begin

          end
          else
            if FNewDrawObject.Kind = ldmiPolyonA then
          begin
            if FNewDrawObject.FList.Count <= 2 then
            begin
              FNewDrawObject.AddPoint(FViewCood.XScr2Bmp(X), FViewCood.YScr2Bmp(Y));
              //          FNewDrawObject.AddPoint(X, Y);
              FMouseMovePoint := Point(X, Y);
              fModify := true;
            end
            else
            begin
              //FNewDrawObject.AddPoint(FViewCood.XScr2Bmp(X, Y), FViewCood.YScr2Bmp(X, Y));

              FObjectInserting := False;
              FNewDrawObject.InMoving := false;
              FNewDrawObject.CalText := FNewDrawObject.Calc2Text;
              FNewDrawObject.fTextPoint.x := FNewDrawObject.X[0] + 20;
              FNewDrawObject.fTextPoint.y := FNewDrawObject.Y[0] + 20;
              if assigned(FAfterNewDrawObject) then
                FAfterNewDrawObject(FNewDrawObject);
              //          FNewDrawObject := nil;
              //          fLeaderMouserInspect := ldmiNone;
              fModify := true;
            end;
          end
          else
          begin
            FObjectInserting := False;
            FNewDrawObject.InMoving := false;
            FNewDrawObject.CalText := FNewDrawObject.Calc2Text;
            FNewDrawObject.fTextPoint.x := FNewDrawObject.X[0] + 20;
            FNewDrawObject.fTextPoint.y := FNewDrawObject.Y[0] + 20;
            if assigned(FAfterNewDrawObject) then
              FAfterNewDrawObject(FNewDrawObject);
            //          FNewDrawObject := nil;
            //          fLeaderMouserInspect := ldmiNone;
            fModify := true;
          end;
        end
        else
        begin
          //if FViewCood.fRotate in [1, 3] then
          //  FNewDrawObject.AddPoint(FViewCood.XScr2Bmp(X,Y), FViewCood.YScr2Bmp(X,Y))
          //else
          //FNewDrawObject.AddPoint(FViewCood.XScr2Bmp(X, Y), FViewCood.YScr2Bmp(X, Y));
          //          FNewDrawObject.AddPoint(X, Y);
          FMouseMovePoint := Point(X, Y);
          fModify := true;
        end;
        Result := false;
      end
      else
      begin
        fModify := true;
        //FNewDrawObject.AddPoint(FViewCood.XScr2Bmp(X, Y), FViewCood.YScr2Bmp(X, Y));
        {if FNewDrawObject.FKind in [ldmiROI_Rect, ldmiROI_Cycle, ldmiSolidRect] then
        begin
          FNewDrawObject.AddPoint(FViewCood.XScr2Bmp(X, Y) + 8, FViewCood.YScr2Bmp(X, Y) + 8);
        end;}

        FMouseMovePoint := Point(X, Y);
        Result := false;
        if (not FNewDrawObject.InMoving) and (i <= FNewDrawObject.GetCount) then
        begin
          if FNewDrawObject.Kind in [ldmiAngle] then
          begin
            FNewDrawObject.fTextPoint.X := FNewDrawObject.X[1] + 20;
            FNewDrawObject.fTextPoint.y := FNewDrawObject.Y[1] + 20;
          end
          else
          begin
            FNewDrawObject.fTextPoint.x := FNewDrawObject.X[0] + 20;
            FNewDrawObject.fTextPoint.y := FNewDrawObject.Y[0] + 20;
          end;

          FObjectInserting := False;
          if assigned(FAfterNewDrawObject) then
            FAfterNewDrawObject(FNewDrawObject);
          //          FNewDrawObject.Calc2Text;
          //          FNewDrawObject := nil;
          //          fLeaderMouserInspect := ldmiNone;
          // 24.10.2012 FOMIN
          if assigned(FNewDrawObject) then
          begin
            if FNewDrawObject.FUserText = '' then
            begin
              if FNewDrawObject.FKind = ldmiText then
              begin
                FNewDrawObject.FUserText := InputBox1('Input', 'Text', '');
              end
              else
                if FNewDrawObject.FKind = ldmiArrow then
              begin
                FNewDrawObject.FUserText := InputBox1('Input', 'Text', '');
              end;
            end;
          end;
        end;
      end;
    end
    else
      if assigned(FNewDrawObject) and (FNewDrawObject.fDragState <> cdsNone) then
    begin
      nx := (X - FMouseMovePoint.X) * FViewCood.fDZoom;
      ny := (Y - FMouseMovePoint.Y) * FViewCood.fDZoom;
      if fOwnImageData.FHozFlip1 then
        nx := -nx;
      if fOwnImageData.FVerFlip1 then
        ny := -ny;
      case fOwnImageData.FRotate1 of
        0:
          begin
            nx1 := nx;
            ny1 := ny;
          end;
        1:
          begin
            nx1 := -ny;
            ny1 := nx;
          end;
        2:
          begin
            nx1 := -nx;
            ny1 := -ny;
          end;
        3:
          begin
            nx1 := ny;
            ny1 := -nx;
          end;
      end;
      nx := nx1;
      ny := ny1;
      case FNewDrawObject.fDragState of
        cdsSizePoint:
          begin
            if FNewDrawObject.fDragPointIndex >= 0 then
            begin
              if FNewDrawObject.CheckPointType(FNewDrawObject.fDragPointIndex) then
                screen.Cursor := crSizeNESW
              else
                screen.Cursor := crSizeNWSE;

              FNewDrawObject.X[FNewDrawObject.fDragPointIndex] :=
                FNewDrawObject.X[FNewDrawObject.fDragPointIndex] + nx;
              FNewDrawObject.Y[FNewDrawObject.fDragPointIndex] :=
                FNewDrawObject.Y[FNewDrawObject.fDragPointIndex] + ny;
            end
            else
            begin
              FNewDrawObject.fTextPoint.X := FNewDrawObject.fTextPoint.X + nx;
              FNewDrawObject.fTextPoint.y := FNewDrawObject.fTextPoint.Y + ny;
            end;

            FNewDrawObject.fDragState := cdsNone;
            if assigned(FAfterObjectSize) then
              FAfterObjectSize(FNewDrawObject);
            //          FNewDrawObject.Calc2Text;
          end;
        cdsSizePoint1:
          begin
            if FNewDrawObject.CheckPointType1(FNewDrawObject.fDragPointIndex) then
              screen.Cursor := crSizeNESW
            else
              screen.Cursor := crSizeNWSE;
            if FNewDrawObject.fDragPointIndex = 0 then
            begin
              FNewDrawObject.X[0] := FNewDrawObject.X[0] + nx;
              FNewDrawObject.Y[1] := FNewDrawObject.Y[1] + ny;
            end
            else
            begin
              FNewDrawObject.X[1] := FNewDrawObject.X[1] + nx;
              FNewDrawObject.Y[0] := FNewDrawObject.Y[0] + ny;
            end;
            FNewDrawObject.CalText := FNewDrawObject.Calc2Text;
            FNewDrawObject.fDragState := cdsNone;
            if assigned(FAfterObjectSize) then
              FAfterObjectSize(FNewDrawObject);
            //          FNewDrawObject.Calc2Text; }
          end;
        cdsMove:
          begin
            screen.Cursor := crSizeAll; //1790;
            for i := 0 to FNewDrawObject.GetCount - 1 do
            begin
              FNewDrawObject.X[i] := FNewDrawObject.X[i] + nx;
              FNewDrawObject.Y[i] := FNewDrawObject.Y[i] + ny;
            end;
            FNewDrawObject.fTextPoint.X := FNewDrawObject.fTextPoint.X + nx;
            FNewDrawObject.fTextPoint.y := FNewDrawObject.fTextPoint.Y + ny;
            FNewDrawObject.CalText := FNewDrawObject.Calc2Text;
            FNewDrawObject.fDragState := cdsNone;
            if assigned(FAfterObjectMove) then
              FAfterObjectMove(FNewDrawObject);
            //          FNewDrawObject.Calc2Text;
          end;
        cdsSizeLine:
          begin
            case FNewDrawObject.fDragLineIndex of
              0:
                begin
                  screen.Cursor := crSizeNS;
                  FNewDrawObject.Y[0] := FNewDrawObject.Y[0] + ny;
                end;
              1:
                begin
                  screen.Cursor := crSizeWE;
                  FNewDrawObject.X[1] := FNewDrawObject.X[1] + nx;
                end;
              2:
                begin
                  screen.Cursor := crSizeNS;
                  FNewDrawObject.Y[1] := FNewDrawObject.Y[1] + ny;
                end;
              3:
                begin
                  screen.Cursor := crSizeWE;
                  FNewDrawObject.X[0] := FNewDrawObject.X[0] + nx;
                end;
            end;

          end;
        cdsSizeText:
          begin

          end;
      end;
      FNewDrawObject.RefreshBoundRect;
      FNewDrawObject.fDragState := cdsNone;
      //      FNewDrawObject := nil;
      fModify := true;
    end;
  end;
end;

procedure TDicomDrawObjects.RemoveAll;
var
  i: Integer;
begin
  if FList.Count > 0 then
  begin
    fModify := true;
    for i := 0 to FList.Count - 1 do
    begin
      TDicomDrawObject(FList[i]).Free;
    end;
    FList.Clear;
  end;
  FNewDrawObject := nil;
  FObjectInserting := false;
end;

procedure TDicomDrawObjects.SaveAll(ADataset: TDicomAttributes);
var
  das1, das2, das3: TDicomAttributes;
  da1, da2, da3, da4: TDicomAttribute;
  SOPClassUID, SOPInstanceUID: AnsiString;
  i, k, zz: Integer;
  n1: TDicomDrawObject;
begin
  SOPClassUID := ADataset.GetString($8, $16);
  SOPInstanceUID := ADataset.GetString($8, $18);
  da1 := ADataset.Add($0070, $0001);
  zz := 1;
  for i := 0 to FList.Count - 1 do
  begin
    n1 := TDicomDrawObject(FList[i]);
    if n1.Kind in [ldmiReferenceLine, ldmiSelectRect, ldmiPerpendicularityLine, ldmiSelectMagicWand]
      then
      continue;
    das1 := TDicomAttributes.Create;
    da1.AddData(das1);

    da2 := das1.Add($0008, $1140);

    das2 := TDicomAttributes.Create;
    da2.AddData(das2);
    das2.AddVariant($0008, $1150, SOPClassUID);
    das2.AddVariant($0008, $1155, SOPInstanceUID);

    das1.AddVariant($0070, $0002, 'LAYER' + IntToStr(zz));
    inc(zz);
    if n1.FKind = ldmiText then
    begin
      // text
      da3 := das1.Add($0070, $0008);
      {>>>>1383[0070:0003](BoundingBoxAnnotationUnits)CS=<1>PIXEL
      >>>>1386[0070:0006](UnformattedTextValue)ST=<1>jiawen
      >>>>1389[0070:0010](BoundingBoxTLHC)FL=<2>30.000000\90.000000
      >>>>1390[0070:0011](BoundingBoxBRHC)FL=<2>330.000000\290.000000
      >>>>1409[0070:0012](BoundingBoxTHJ)CS=<1>LEFT }
      das3 := TDicomAttributes.Create;
      da3.AddData(das3);
      das3.AddVariant($0070, $0003, 'PIXEL');
      das3.AddVariant($0070, $0006, n1.UserText);
      da4 := das3.Add($0070, $0010);
      da4.AsFloat[0] := n1.X[0];
      da4.AsFloat[1] := n1.Y[0];
      da4 := das3.Add($0070, $0011);
      da4.AsFloat[0] := n1.X[1];
      da4.AsFloat[1] := n1.Y[1];

      das3.AddVariant($0070, $0012, 'LEFT');
    end
    else
    begin
      //line other
      {>>>>1385[0070:0005](GraphicAnnotationUnits)CS=<1>PIXEL
      >>>>1393[0070:0020](GraphicDimensions)US=<1>2
      >>>>1394[0070:0021](NumberOfGraphicPoints)US=<1>2
      >>>>1395[0070:0022](GraphicData)FL=<4>30.000000\90.000000\330.000000\290.000000
      >>>>1396[0070:0023](GraphicType)CS=<1>POLYLINE
      >>>>1397[0070:0024](GraphicFilled)CS=<1>N}
      da3 := das1.Add($0070, $0009);
      das3 := TDicomAttributes.Create;
      da3.AddData(das3);
      das3.AddVariant($0070, $0005, 'PIXEL');
      das3.AddVariant($0070, $0020, 2);

      das3.AddVariant($0070, $0021, n1.GetCount);

      da4 := das3.Add($0070, $0014);
      da4.AsFloat[0] := n1.fTextPoint.X;
      da4.AsFloat[1] := n1.fTextPoint.Y;

      da4 := das3.Add($0070, $0022);
      for k := 0 to n1.GetCount - 1 do
      begin
        da4.AsFloat[k * 2] := n1.X[k];
        da4.AsFloat[1 + k * 2] := n1.Y[k];
      end;

      case n1.FKind of
        ldmiRuler: das3.AddVariant($0070, $0023, 'Ruler');
        ldmiCAPoly: das3.AddVariant($0070, $0023, 'CA');
        ldmiQuantitativeCoronaryAnaliysis:
          das3.AddVariant($0070, $0023, 'QCA');
        ldmiVentricularPolyon: das3.AddVariant($0070, $0023, 'Ventricular');
        ldmiRulerVer: das3.AddVariant($0070, $0023, 'RulerVer');
        ldmiRulerHiz: das3.AddVariant($0070, $0023, 'RulerHiz');
        ldmiRulerVerHiz: das3.AddVariant($0070, $0023, 'RulerVerHiz');
        ldmiAngle: das3.AddVariant($0070, $0023, 'Angle');
        ldmiArrow:
          begin
            das3.AddVariant($0070, $0023, 'Arrow');
            das3.AddVariant($0070, $0006, n1.UserText);
          end;
        ldmiROI_Cycle: das3.AddVariant($0070, $0023, 'ROI_Cycle');
        ldmiSolidRect: das3.AddVariant($0070, $0023, 'Solid_Rect');
        ldmiROI_Rect: das3.AddVariant($0070, $0023, 'ROI_Rect');
        ldmiCross: das3.AddVariant($0070, $0023, 'Cross');
        ldmiRect: das3.AddVariant($0070, $0023, 'Rect');
        ldmiCycle: das3.AddVariant($0070, $0023, 'Cycle');
        ldmiVitexObject: das3.AddVariant($0070, $0023, 'VitexObject');
        // ldmiPoly, ldmiPolyonA, ldmiPolyonV,

      else
        das3.AddVariant($0070, $0023, 'POLYLINE');
      end;
      das3.AddVariant($0070, $0024, 'N');
    end;
    //Text
    {>>113[0008:1140](ReferencedImageSequence)SQ=<1>Sequence Data
    >>-----------0------------
    >>>>115[0008:1150](ReferencedSOPClassUID)UI=<1>1.2.840.10008.5.1.4.1.1.3.1
    >>>>116[0008:1155](ReferencedSOPInstanceUID)UI=<1>1.2.840.113680.1.103.65540.1125006402.954803.1.2
    >>1382[0070:0002](GraphicLayer)CS=<1>LAYER1
    >>1387[0070:0008](TextObjectSequence)SQ=<1>Sequence Data
    >>-----------0------------
    >>>>1383[0070:0003](BoundingBoxAnnotationUnits)CS=<1>PIXEL
    >>>>1386[0070:0006](UnformattedTextValue)ST=<1>jiawen
    >>>>1389[0070:0010](BoundingBoxTLHC)FL=<2>30.000000\90.000000
    >>>>1390[0070:0011](BoundingBoxBRHC)FL=<2>330.000000\290.000000
    >>>>1409[0070:0012](BoundingBoxTHJ)CS=<1>LEFT}

    {>>113[0008:1140](ReferencedImageSequence)SQ=<1>Sequence Data
    >>-----------0------------
    >>>>115[0008:1150](ReferencedSOPClassUID)UI=<1>1.2.840.10008.5.1.4.1.1.3.1
    >>>>116[0008:1155](ReferencedSOPInstanceUID)UI=<1>1.2.840.113680.1.103.65540.1125006402.954803.1.2
    >>1382[0070:0002](GraphicLayer)CS=<1>LAYER2
    >>1388[0070:0009](GraphicObjectSequence)SQ=<1>Sequence Data
    >>-----------0------------
    >>>>1385[0070:0005](GraphicAnnotationUnits)CS=<1>PIXEL
    >>>>1393[0070:0020](GraphicDimensions)US=<1>2
    >>>>1394[0070:0021](NumberOfGraphicPoints)US=<1>2
    >>>>1395[0070:0022](GraphicData)FL=<4>30.000000\90.000000\330.000000\290.000000
    >>>>1396[0070:0023](GraphicType)CS=<1>POLYLINE
    >>>>1397[0070:0024](GraphicFilled)CS=<1>N }

  end;
end;

procedure TDicomDrawObjects.LoadAll(ADataset: TDicomAttributes);
var
  das1, das2: TDicomAttributes;
  da1, da2, da3: TDicomAttribute;
  //  SOPClassUID, SOPInstanceUID: AnsiString;
  i, k, PointCount: Integer;
  n1: TDicomDrawObject;
  GraphicType: AnsiString;
begin
  self.RemoveAll;
  da1 := ADataset.Item[$0070, $0001];
  if assigned(da1) then
  begin
    for i := 0 to da1.GetCount - 1 do
    begin
      das1 := da1.Attributes[i];
      da2 := das1.Item[$0070, $0008];
      if assigned(da2) and (da2.GetCount > 0) then
      begin
        das2 := da2.Attributes[0];
        n1 := Add(ldmiText);
        da3 := das2.Item[$0070, $0010];
        n1.AddPoint(da3.AsFloat[0], da3.AsFloat[1]);
        da3 := das2.Item[$0070, $0011];
        n1.AddPoint(da3.AsFloat[0], da3.AsFloat[1]);
        n1.UserText := das2.GetString($70, $6);
      end
      else
      begin
        da2 := das1.Item[$0070, $0009];
        if assigned(da2) and (da2.GetCount > 0) then
        begin
          das2 := da2.Attributes[0];
          PointCount := das2.getInteger($0070, $0021);
          da3 := das2.Item[$0070, $0022];
          GraphicType := das2.GetString($0070, $0023);

          if GraphicType = 'POLYLINE' then
            n1 := Add(ldmiPoly)
          else
            if GraphicType = 'ELLIPSE' then
            n1 := Add(ldmiCycle)
          else
            if GraphicType = 'Ruler' then
            n1 := Add(ldmiRuler)
          else
            if GraphicType = 'RulerVer' then
            n1 := Add(ldmiRulerVer)
          else
            if GraphicType = 'RulerHiz' then
            n1 := Add(ldmiRulerHiz)
          else
            if GraphicType = 'RulerVerHiz' then
            n1 := Add(ldmiRulerVerHiz)
          else
            if GraphicType = 'Angle' then
            n1 := Add(ldmiAngle)
          else
            if GraphicType = 'Arrow' then
            n1 := Add(ldmiArrow)
          else
            if GraphicType = 'Cross' then
            n1 := Add(ldmiCross)
          else
            if GraphicType = 'ROI_Cycle' then
            n1 := Add(ldmiROI_Cycle)
          else
            if GraphicType = 'Solid_Rect' then
            n1 := Add(ldmiSolidRect)
          else
            if GraphicType = 'Rect' then
            n1 := Add(ldmiRect)
          else
            if GraphicType = 'Cycle' then
            n1 := Add(ldmiCycle)
          else
            if GraphicType = 'VitexObject' then
            n1 := Add(ldmiVitexObject)
          else
            if GraphicType = 'ROI_Rect' then
            n1 := Add(ldmiROI_Rect)
          else
            if GraphicType = 'CA' then
            n1 := Add(ldmiCAPoly)

          else
            if GraphicType = 'QCA' then
            n1 := Add(ldmiQuantitativeCoronaryAnaliysis)

          else
            if GraphicType = 'Ventricular' then
            n1 := Add(ldmiVentricularPolyon);

          n1.UserText := das2.GetString($70, $6);
          for k := 0 to PointCount - 1 do
          begin
            n1.AddPoint(da3.AsFloat[k * 2], da3.AsFloat[k * 2 + 1]);
          end;

          da3 := das2.Item[$0070, $0014];
          if assigned(da3) and (da3.GetCount > 0) then
          begin
            n1.fTextPoint.X := da3.AsFloat[0];
            n1.fTextPoint.Y := da3.AsFloat[1];
          end
          else
          begin
            if n1.Kind in [ldmiAngle] then
            begin
              n1.fTextPoint.X := n1.X[1] + 20;
              n1.fTextPoint.y := n1.Y[1] + 20;
            end
            else
            begin
              n1.fTextPoint.x := n1.X[0] + 20;
              n1.fTextPoint.y := n1.Y[0] + 20;
            end;
          end;
          if assigned(FAfterNewDrawObject) then
            FAfterNewDrawObject(n1);

        end
      end;
      if assigned(FAfterObjectSize) and (n1 <> nil) then
        FAfterObjectSize(n1);
    end;
  end;
end;

procedure TDicomDrawObjects.RemoveSelectedDrawObject;
begin
  if assigned(FNewDrawObject) then
  begin
    fModify := true;
    FList.Remove(FNewDrawObject);
    FNewDrawObject.Free;
    FNewDrawObject := nil;
  end;
end;

procedure TDicomDrawObjects.SetLeaderMouserInspect(Value: TLeaderMouserInspect);
begin
  if fLeaderMouserInspect <> Value then
  begin
    fLeaderMouserInspect := Value;
    if FObjectInserting and (Value = ldmiNone) then
    begin
      if assigned(FNewDrawObject) then
      begin
        if FNewDrawObject.FList.Count >= 2 then
        begin
          if assigned(FAfterNewDrawObject) then
            FAfterNewDrawObject(FNewDrawObject);
        end
        else
        begin
          FList.Remove(FNewDrawObject);
          FNewDrawObject.Free;
          FNewDrawObject := nil;
        end;
      end;
      FObjectInserting := false;
    end;
  end;
end;

function TCoodZoomEx.XBmp2Scrf(x: Double): Double;
begin
  result := trunc(fOffX + ViewX + x * fZoom);
end;

function TCoodZoomEx.YBmp2Scrf(y: Double): Double;
begin
  result := trunc(fOffY + ViewY + y * fZoom);
end;

function TCoodZoomEx.XScr2Bmpf(x: Double): Double;
begin
  //ny := ((Y - fOffY) * fDZoom );
  result := ((X - fOffX - ViewX) * fDZoom);
end;

function TCoodZoomEx.YScr2Bmpf(y: Double): Double;
begin
  // nx := ((X - fOffX) * fDZoom );
  result := ((Y - fOffY - ViewY) * fDZoom);
end;

function TCoodZoomEx.XBmp2Scr(x: integer): integer;
begin
  result := trunc(fOffX + ViewX + x * fZoom);
end;

function TCoodZoomEx.YBmp2Scr(y: integer): integer;
begin
  result := trunc(fOffY + ViewY + y * fZoom);
end;

function TCoodZoomEx.XScr2Bmp(x: integer): integer;
begin
  //ny := ((Y - fOffY) * fDZoom );
  result := trunc((X - fOffX - ViewX) * fDZoom);
end;

function TCoodZoomEx.YScr2Bmp(y: integer): integer;
begin
  // nx := ((X - fOffX) * fDZoom );
  result := trunc((Y - fOffY - ViewY) * fDZoom);
end;

constructor TCoodZoomEx.Create;
begin
  fOffX := 0;
  fOffY := 0;

  ViewX := 0;
  ViewY := 0;

  fZoom := 1;
  fDZoom := 1;
  RescaleSlopeX := 1;
  RescaleSlopeY := 1;
end;

function TDicomDrawObject.GetTextPointSCRX: Integer;
var
  d1: TDicomImage;
  x, y, x1, y1: Double;
begin
  d1 := fParent.fOwnImageData;
  if assigned(d1) then
  begin
    x := fTextPoint.x;
    y := fTextPoint.y;
    if d1.HozFlip then
    begin
      x := d1.Width - x;
    end;
    if d1.VerFlip then
    begin
      y := d1.Height - y;
    end;
    case d1.Rotate of
      0:
        begin
          x1 := x;
          y1 := y;
        end;
      1:
        begin
          if d1.VerFlip xor d1.HozFlip then
          begin
            x := fTextPoint.x;
            y := fTextPoint.y;
            if d1.VerFlip then
              x := d1.Width - x;
            if d1.HozFlip then
              y := d1.Height - y;

            x1 := y;
            y1 := d1.Width - x;

          end
          else
          begin
            x1 := y;
            y1 := d1.Width - x;
          end;
        end;
      2:
        begin
          x1 := d1.Width - x;
          y1 := d1.Height - y;
        end;
      3:
        begin
          if d1.VerFlip xor d1.HozFlip then
          begin
            x := fTextPoint.x;
            y := fTextPoint.y;
            if d1.VerFlip then
              x := d1.Width - x;
            if d1.HozFlip then
              y := d1.Height - y;

            x1 := d1.Height - y;
            y1 := x;

          end
          else
          begin
            x1 := d1.Height - y;
            y1 := x;
          end;
        end;
    end;
    x := x1;
    y := y1;
  end
  else
    raise Exception.Create('No Image Data');
  Result := fViewCood.XBmp2Scr(Round(x));

end;

function TDicomDrawObject.GetTextPointSCRY: Integer;
var
  d1: TDicomImage;
  x, y, x1, y1: Double;
begin

  d1 := fParent.fOwnImageData;
  if assigned(d1) then
  begin
    x := fTextPoint.x;
    y := fTextPoint.y;
    if d1.VerFlip then
    begin
      y := d1.Height - Y;
    end;
    if d1.HozFlip then
    begin
      x := d1.Width - x;
    end;
    case d1.Rotate of
      0:
        begin
          x1 := x;
          y1 := y;
        end;
      1:
        begin
          if d1.VerFlip xor d1.HozFlip then
          begin
            x := fTextPoint.x;
            y := fTextPoint.y;

            if d1.VerFlip then
              x := d1.Width - x;
            if d1.HozFlip then
              y := d1.Height - y;

            x1 := y;
            y1 := d1.Width - x;
          end
          else
          begin
            x1 := y;
            y1 := d1.Width - x;
          end;
        end;
      2:
        begin
          x1 := d1.Width - x;
          y1 := d1.Height - y;
        end;
      3:
        begin
          if d1.VerFlip xor d1.HozFlip then
          begin
            x := fTextPoint.x;
            y := fTextPoint.y;

            if d1.VerFlip then
              x := d1.Width - x;
            if d1.HozFlip then
              y := d1.Height - y;

            x1 := d1.Height - y;
            y1 := x;
          end
          else
          begin
            x1 := d1.Height - y;
            y1 := x;
          end;
        end;
    end;
    x := x1;
    y := y1;
  end
  else
    raise Exception.Create('No Image Data');
  Result := fViewCood.YBmp2Scr(Round(y));

end;

function TDicomDrawObject.GetPointSCRX(AIndex: Integer): Integer;
var
  d1: TDicomImage;
  x, y, x1, y1: Double;
begin
  if (AIndex >= 0) and (AIndex < FList.Count) then
  begin
    d1 := fParent.fOwnImageData;
    if assigned(d1) then
    begin
      x := PFloatPoint(FList[AIndex]).x;
      y := PFloatPoint(FList[AIndex]).y;
      if d1.HozFlip then
      begin
        x := d1.Width - x;
      end;
      if d1.VerFlip then
      begin
        y := d1.Height - y;
      end;
      case d1.Rotate of
        0:
          begin
            x1 := x;
            y1 := y;
          end;
        1:
          begin
            if d1.VerFlip xor d1.HozFlip then
            begin
              x := PFloatPoint(FList[AIndex]).x;
              y := PFloatPoint(FList[AIndex]).y;
              if d1.VerFlip then
                x := d1.Width - x;
              if d1.HozFlip then
                y := d1.Height - y;

              x1 := y;
              y1 := d1.Width - x;

            end
            else
            begin
              x1 := y;
              y1 := d1.Width - x;
            end;
          end;
        2:
          begin
            x1 := d1.Width - x;
            y1 := d1.Height - y;
          end;
        3:
          begin
            if d1.VerFlip xor d1.HozFlip then
            begin
              x := PFloatPoint(FList[AIndex]).x;
              y := PFloatPoint(FList[AIndex]).y;
              if d1.VerFlip then
                x := d1.Width - x;
              if d1.HozFlip then
                y := d1.Height - y;

              x1 := d1.Height - y;
              y1 := x;

            end
            else
            begin
              x1 := d1.Height - y;
              y1 := x;
            end;
          end;
      end;
      x := x1;
      y := y1;
    end
    else
      raise Exception.Create('No Image Data');
    Result := fViewCood.XBmp2Scr(Round(x));
  end
  else
    Result := 0;
end;

function TDicomDrawObject.IsNearLine(x1, y1: Integer): Boolean;
var
  P: TStructMatrix2D;
  S: TStructLine2D;
  CrossP: TStructMatrix2D;
  d, d1: Double;
begin
  s.P0.x := X[0];
  s.P0.y := Y[0];
  s.P1.x := X[1];
  s.P1.y := Y[1];
  p.x := x1;
  p.y := y1;

  d := dist_Point_to_Segment(p, s, crossp, d1);

  if (d < 3) then
    Result := TRUE
  else
    Result := FALSE;
end;

function TDicomDrawObject.GetPointSCRY(AIndex: Integer): Integer;
var
  d1: TDicomImage;
  x, y, x1, y1: Double;
begin
  if (AIndex >= 0) and (AIndex < FList.Count) then
  begin
    d1 := fParent.fOwnImageData;
    if assigned(d1) then
    begin
      x := PFloatPoint(FList[AIndex]).x;
      y := PFloatPoint(FList[AIndex]).y;
      if d1.VerFlip then
      begin
        y := d1.Height - Y;
      end;
      if d1.HozFlip then
      begin
        x := d1.Width - x;
      end;
      case d1.Rotate of
        0:
          begin
            x1 := x;
            y1 := y;
          end;
        1:
          begin
            if d1.VerFlip xor d1.HozFlip then
            begin
              x := PFloatPoint(FList[AIndex]).x;
              y := PFloatPoint(FList[AIndex]).y;

              if d1.VerFlip then
                x := d1.Width - x;
              if d1.HozFlip then
                y := d1.Height - y;

              x1 := y;
              y1 := d1.Width - x;
            end
            else
            begin
              x1 := y;
              y1 := d1.Width - x;
            end;
          end;
        2:
          begin
            x1 := d1.Width - x;
            y1 := d1.Height - y;
          end;
        3:
          begin
            if d1.VerFlip xor d1.HozFlip then
            begin
              x := PFloatPoint(FList[AIndex]).x;
              y := PFloatPoint(FList[AIndex]).y;

              if d1.VerFlip then
                x := d1.Width - x;
              if d1.HozFlip then
                y := d1.Height - y;

              x1 := d1.Height - y;
              y1 := x;
            end
            else
            begin
              x1 := d1.Height - y;
              y1 := x;
            end;
          end;
      end;
      x := x1;
      y := y1;
    end
    else
      raise Exception.Create('No Image Data');
    Result := fViewCood.YBmp2Scr(Round(y));
  end
  else
    Result := 0;
end;

function TDicomDrawObject.GetPointX(AIndex: Integer): Single;
begin
  if (AIndex >= 0) and (AIndex < FList.Count) then
    Result := PFloatPoint(FList[AIndex]).X
  else
    Result := 0;
end;

function TDicomDrawObject.CheckPointType(AIndex: Integer): Boolean;
var
  x1, x2, y1, y2: Single;
begin
  Result := true;
  if FList.Count <= 1 then
    exit;
  if AIndex < 0 then
    exit;
  x1 := X[AIndex];
  y1 := Y[AIndex];
  if (AIndex + 1) < FList.Count then
  begin
    x2 := X[AIndex + 1];
    y2 := Y[AIndex + 1];
  end
  else
  begin
    x2 := X[AIndex - 1];
    y2 := Y[AIndex - 1];
  end;
  Result := (x1 < x2) xor (y1 < y2);
end;

procedure TDicomDrawObject.RotatePointEx(const xAngle: double);
//var
//  x1, x2: Integer;
begin
  //  x1 :=
end;

procedure TDicomDrawObject.RotatePoint(const ax, ay: Double; const xAngle: double);
var
  vSin, vCos: extended;
  x1, y1: Double;
  i: integer;
begin
  SinCos(xAngle, vSin, vCos);
  for i := 0 to FList.Count - 1 do
  begin
    x1 := (x[i] - ax);
    y1 := (y[i] - ay);
    x[i] := round(x1 * vCos + y1 * vSin + ax);
    y[i] := round(y1 * vCos - x1 * vSin + ay);
  end;
end;

function TDicomDrawObject.CheckPointType1(AIndex: Integer): Boolean;
var
  x1, x2, y1, y2: Single;
begin
  Result := true;
  if FList.Count <= 1 then
    exit;
  if AIndex < 0 then
    exit;
  x1 := X[AIndex];
  y2 := Y[AIndex];
  if (AIndex + 1) < FList.Count then
  begin
    x2 := X[AIndex + 1];
    y1 := Y[AIndex + 1];
  end
  else
  begin
    x2 := X[AIndex - 1];
    y1 := Y[AIndex - 1];
  end;
  Result := (x1 < x2) xor (y1 < y2);
end;

procedure TDicomDrawObject.SetPointX(AIndex: Integer; Value: Single);
begin
  if (AIndex >= 0) and (AIndex < FList.Count) then
    PFloatPoint(FList[AIndex]).X := Value;
end;

function TDicomDrawObject.GetPointY(AIndex: Integer): Single;
begin
  if (AIndex >= 0) and (AIndex < FList.Count) then
    Result := PFloatPoint(FList[AIndex]).Y
  else
    Result := 0;
end;

procedure TDicomDrawObject.SetPointY(AIndex: Integer; Value: Single);
begin
  if (AIndex >= 0) and (AIndex < FList.Count) then
    PFloatPoint(FList[AIndex]).Y := Value;
end;

constructor TDicomDrawObject.Create(AParent: TDicomDrawObjects; AViewCood: PCoodZoom);
begin
  FAngle := 0;
  FVitexObject := nil;

  FImageIndex := -1;
  fPenColor := clRed;
  FPloyID := -1;

  fParent := AParent;
  fCalLength := 1;
  FList := TList.Create;
  FKind := ldmiNone;
  FTextIndex := 0;
  FCalText := '';
  FUserText := '';
  FName := '';
  FObjectName := '';
  fRulerUnit := ruCentimeter;
  fRulerUnitString := 'CM';
  fFont := TFont.Create;
  fFont.Color := clRed;
  fDragState := cdsNone;
  fDragPointIndex := -1;
  fDragLineIndex := -1;
  fViewCood := AViewCood;
  FRect := Rect($FFFF, $FFFF, 0, 0);
  fRelateFrameIndex := 0;
  ftag := 0;
  fCanNotMove := false;
  fInMoving := false;
  fCanNotResize := false;

  FFixScale := false;
  FFixScaleValue := 0;
end;

destructor TDicomDrawObject.Destroy;
var
  i: Integer;
  p: PPoint;
begin
  fFont.Free;
  for i := 0 to FList.Count - 1 do
  begin
    p := PPoint(FList[i]);
    Freemem(p);
  end;
  FList.Clear;
  FList.Free;
  inherited;
end;

procedure TDicomDrawObject.AddPoint(X, Y: Single);
var
  p: PFloatPoint;
begin
  fParent.FModify := true;

  GetMem(p, SizeOf(TFloatPoint));
  p.X := X;
  p.Y := Y;
  FList.Add(p);
  FRect.Left := Min(FRect.Left, trunc(X));
  FRect.Top := Min(FRect.Top, trunc(Y));
  FRect.Right := Max(FRect.Right, trunc(X));
  FRect.Bottom := Max(FRect.Bottom, trunc(Y));
  if FList.Count = 1 then
  begin
    fTextPoint.x := x + 20;
    fTextPoint.y := y + 20;
  end;
end;

procedure TDicomDrawObject.SetPoint(AIndex: Integer; X, Y: Single);
var
  p: PFloatPoint;
begin
  fParent.FModify := true;

  //GetMem(p, SizeOf(TFloatPoint));
  p := FList.Items[AIndex];

  p.X := X;
  p.Y := Y;
  //  FList.Add(p);

  FRect.Left := Min(FRect.Left, trunc(X));
  FRect.Top := Min(FRect.Top, trunc(Y));
  FRect.Right := Max(FRect.Right, trunc(X));
  FRect.Bottom := Max(FRect.Bottom, trunc(Y));

  {if FList.Count = 1 then
  begin
    fTextPoint.x := x + 20;
    fTextPoint.y := y + 20;
  end;}
end;

function TDicomDrawObject.GetCount: Integer;
begin
  Result := FList.Count;
  // if fInMoving then
  //   Result := Result - 1;
end;

function TDicomDrawObject.GetMaxPoint: integer;
begin
  case FKind of
    ldmiRulerCalc, ldmiRuler, ldmiRulerVer, ldmiRulerHiz,
      ldmiRulerVerHiz, ldmiArrow, ldmiText, ldmiRect,
      ldmiReferenceLine, ldmiSelectRect, ldmiCycle:
      Result := 2;
    ldmiQuantitativeCoronaryAnaliysis:
      Result := 10;
    ldmiROI_Rect, ldmiROI_Cycle, ldmiSolidRect, ldmiPerpendicularityLine:
      begin
        Result := 1;
      end;
    ldmiPoly, ldmiPolyonA, ldmiPolyonV,
      ldmiCAPoly, ldmiVentricularPolyon:
      Result := -1;
    ldmiAngle:
      Result := 3;
    ldmiCross:
      Result := 4;
    ldmiCross1:
      Result := 8;
  else
    Result := 0;
  end;
end;

function TDicomDrawObject.CalcCalLength: Double;
var
  lx, ly: Double;
begin
  lx := abs(x[0] - x[1]);
  ly := abs(y[0] - y[1]);
  Result := sqrt(lx * lx + ly * ly);
end;

function TDicomDrawObject.CalcArea: Double;
var
  k, i: Integer;
begin
  {
  int i;
  float s;
  if (vcount<3) return 0;
  s=y[0]*(x[vcount-1]-x[1]);
  for (i=1;i<vcount;i++)
     s+=y[i]*(x[(i-1)]-x[(i+1)%vcount]);
  return s/2;
  }
  k := GetCount;

  Result := 0;
  for i := 0 to k - 2 do
  begin
    Result := Result + (x[i] - x[i + 1]) * (Y[i] + y[i + 1]);
  end;
  Result := Result + (x[k - 1] - x[0]) * (Y[0] + y[k - 1]);
  {
  Result := y[0] * (x[k - 1] - x[1]);
  for i := 1 to k - 1 do
    Result := Result + y[i] * (x[(i - 1)] - x[(i + 1) div k]);
  }
  Result := abs(Result * FViewCood^.RescaleSlopeX * FViewCood^.RescaleSlopeY) / 2;
end;

function TDicomDrawObject.CalcVolume: Double;
  function TwoLineAngle(px0, py0, px1, py1, px2, py2, px3, py3: Double): Boolean;
  var
    x1, x2, y1, y2, xx, yy: Double;
  begin
    x1 := px1 - px0;
    y1 := py1 - py0;
    x2 := px3 - px2;
    y2 := py3 - py2;
    xx := x1 * x2 + y1 * y2;
    yy := x1 * y2 - x2 * y1;
    Result := xx > 0;
    //if( x>0 )   //ЅЗ¶И<90
    //else   //ЅЗ¶И>=90
//    Result := arccos(xx / sqrt(xx * xx + yy * yy));
  end;

var
  i, k, s1, i1: integer;
  d1, d2: Double;
  r1, r2: Double;
  x1, y1, x2, y2: Double;
  rx1, ry1, rx2, ry2, rx3, ry3: Double;
  b1, b2: Boolean;
begin
  k := GetCount;

  x1 := (x[0] + x[k - 1]) / 2;
  y1 := (y[0] + y[k - 1]) / 2;
  d2 := 0;
  for i := 1 to k - 2 do
  begin
    x2 := x[i];
    y2 := y[i];
    d1 := sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    if d1 > d2 then
    begin
      s1 := i;
      d2 := d1;
    end;
  end;

  d2 := d2 * FViewCood^.RescaleSlopeX;

  x2 := x[s1];
  y2 := y[s1];

  r2 := 0;
  for i := 1 to k - 2 do
  begin
    rx1 := x[i];
    ry1 := y[i];
    for i1 := 2 to k - 2 do
    begin
      rx2 := x[(i1 + i) mod k];
      ry2 := y[(i1 + i) mod k];
      b1 := TwoLineAngle(x1, y1, x2, y2, rx1, ry1, rx2, ry2);
      rx3 := x[(i1 + i + 1) mod k];
      ry3 := y[(i1 + i + 1) mod k];
      b2 := TwoLineAngle(x1, y1, x2, y2, rx1, ry1, rx3, ry3);
      if (b1 <> b2) then
      begin
        rx2 := (rx2 + rx3) / 2;
        ry2 := (ry2 + ry3) / 2;
        r1 := sqrt((rx1 - rx2) * (rx1 - rx2) + (ry1 - ry2) * (ry1 - ry2));
        if r1 > r2 then
        begin
          r2 := r1;
        end
      end;
    end;
  end;

  r2 := r2 * FViewCood^.RescaleSlopeX;

  Result := (PI / 3) * d2 * r2 * r2;
end;

function TDicomDrawObject.CalcLength: Double;
var
  f1, lx, ly: Double;
  i, k: Integer;
begin
  k := GetCount;
  f1 := 0;
  if k > 2 then
  begin
    for i := 0 to k - 2 do
    begin
      lx := abs(x[i] - x[i + 1]) * FViewCood^.RescaleSlopeX;
      ly := abs(y[i] - y[i + 1]) * FViewCood^.RescaleSlopeY;
      f1 := f1 + sqrt(lx * lx + ly * ly);
    end;
  end;
  Result := f1;

  if (k = 2) or (FKind = ldmiPolyonA) then
  begin
    lx := abs(x[0] - x[k - 1]) * FViewCood^.RescaleSlopeX;
    ly := abs(y[0] - y[k - 1]) * FViewCood^.RescaleSlopeY;
    Result := f1 + sqrt(lx * lx + ly * ly);
  end;
  if fRulerUnit <> ruCentimeter then
  begin
    Result := Result * 10;
  end;
end;

function TDicomDrawObject.CalcAngle: Double;
begin
  Result := CalAngle(x[0], y[0], x[1], y[1], X[2], Y[2]);
end;

//#define PI 3.14159265

function LineAngle(p1, p2: TPoint): Double;
var
  dx, dy, ang: Double;
begin
  //·µ»Ш0-2PI
  dx := p1.X - p2.x;
  dy := p1.Y - p2.y;
  if (dx = 0) then
    ang := PI / 2 //ґ№Ц±
  else
    if (dy = 0) then
    ang := 0 //Л®ЖЅ
  else
    ang := arctan(dy / dx);

  if (dx < 0) and (dy >= 0) then
    ang := ang + PI //IIПаПЮ
  else
    if (dx <= 0) and (dy < 0) then
    ang := ang + PI; //IIIПаПЮ
  if (ang < 0) then
    ang := ang + 2 * PI;
  Result := ang;
end;

function TDicomDrawObject.GetDragState(AX, AY: Integer): TCineDragState;
  function IsNearLine(aindex, x1, y1: Integer): Boolean;
  var
    d, sq: Double;
    xx1, yy1, xx2, yy2: Single;
  begin
    xx1 := self.ScrX[aindex];
    yy1 := self.ScrY[aindex];
    xx2 := self.ScrX[aindex + 1];
    yy2 := self.ScrY[aindex + 1];
    Result := FALSE;
    //    if (X1 >= Min(xx1, xx2)) and (X1 <= Max(xx1, xx2))
    //    and (Y1 >= Min(yy1, yy2)) and (Y1 <= Max(yy1, yy2)) then
    if (X1 >= (Min(xx1, xx2) - 4)) and (X1 <= (Max(xx1, xx2) + 4))
      and (Y1 >= (Min(yy1, yy2) - 4)) and (Y1 <= (Max(yy1, yy2) + 4)) then
    begin
      //јЖЛгѕаАл
      sq := sqrt(yy1 * yy1 + xx1 * xx1);
      if (sq = 0) then
      begin
        d := sqrt(x1 * x1 + y1 * y1);
      end
      else
        d := abs((yy1 - yy2) * x1 + (xx2 - xx1) * y1 + xx1 * yy2 - xx2 * yy1) / sq;

      if (d < 8) then
        Result := TRUE;
    end;
  end;

  function IsNearLine1(xx1, yy1, xx2, yy2: Single; x1, y1: Single): Boolean;
  var
    d, sq: Double;
  begin
    Result := FALSE;
    if (X1 >= (Min(xx1, xx2) - 4)) and (X1 <= (Max(xx1, xx2) + 4))
      and (Y1 >= (Min(yy1, yy2) - 4)) and (Y1 <= (Max(yy1, yy2) + 4)) then
    begin
      //јЖЛгѕаАл
      sq := sqrt(yy1 * yy1 + xx1 * xx1);
      if (sq = 0) then
      begin
        d := sqrt(x1 * x1 + y1 * y1);
      end
      else
        d := abs((yy1 - yy2) * x1 + (xx2 - xx1) * y1 + xx1 * yy2 - xx2 * yy1) / sq;

      if (d < 4) then
        Result := TRUE;
    end;
  end;

  function InTextBox(x1, y1: Double; aText: AnsiString): Boolean;
//  var
//    h1, w1: Integer;
  begin
    Result := (abs(Ax - getTextPointSCRX) < 40) and (abs(Ay - getTextPointSCRY) < 20);
    //(-(fTextPoint.X - AX) > -10) and (-(fTextPoint.X - AX) < 40) and
    //  (-(fTextPoint.Y - AY) > -10) and (-(fTextPoint.Y - AY) < 16)
  end;
var
  bx, by: Boolean;
  Sz, i: Integer;
  x1, y1: single;
begin
  Result := cdsNone;
  Sz := 4;
  if (not fCanNotResize) then
  begin
    if InTextBox(fTextPoint.X, fTextPoint.Y, CalText) then
    begin
      fDragPointIndex := -1;
      Result := cdsSizePoint;
    end
    else
      for i := 0 to FList.Count - 1 do
      begin
        bx := Abs(self.ScrX[i] - aX) <= Sz;
        by := Abs(self.ScrY[i] - aY) <= Sz;
        if bx and by then
        begin
          fDragPointIndex := i;
          Result := cdsSizePoint;

          break;
        end;
      end;
  end;
  if (not fCanNotResize) and (Result = cdsNone) and (GetCount > 1) then
  begin //ЕР¶ПКЗ·сТЖПЯ
    if self.Kind in [ldmiCycle, ldmiRect, ldmiReferenceLine, ldmiSelectRect, ldmiText,
      ldmiROI_Cycle, ldmiSolidRect, ldmiROI_Rect] then
    begin
      bx := Abs(ScrX[0] - aX) <= Sz;
      by := Abs(ScrY[1] - aY) <= Sz;
      if bx and by then
      begin
        fDragPointIndex := 0;
        Result := cdsSizePoint1;
      end;
      if (Result = cdsNone) then
      begin
        bx := Abs(ScrX[1] - aX) <= Sz;
        by := Abs(ScrY[0] - aY) <= Sz;
        if bx and by then
        begin
          fDragPointIndex := 1;
          Result := cdsSizePoint1;
        end;
        if (Result = cdsNone) then
        begin
          x1 := (ax);
          y1 := (ay);
          if IsNearLine1(ScrX[0], ScrY[0], ScrX[1], ScrY[0], (x1), (y1)) then
          begin
            Result := cdsSizeLine;
            fDragLineIndex := 0;
          end;
          if (Result = cdsNone) then
          begin
            if IsNearLine1(ScrX[1], ScrY[0], ScrX[1], ScrY[1], (x1), (y1)) then
            begin
              Result := cdsSizeLine;
              fDragLineIndex := 1;
            end;
            if (Result = cdsNone) then
            begin
              if IsNearLine1(ScrX[0], ScrY[1], ScrX[1], ScrY[1], (x1), (y1)) then
              begin
                Result := cdsSizeLine;
                fDragLineIndex := 2;
              end;
              if (Result = cdsNone) then
              begin
                if IsNearLine1(ScrX[0], ScrY[0], ScrX[0], ScrY[1], (x1), (y1)) then
                begin
                  Result := cdsSizeLine;
                  fDragLineIndex := 3;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if (not fCanNotMove) and (Result = cdsNone) and (GetCount > 1) then
  begin //ЕР¶ПХыМеТЖ¶Ї
    x1 := fViewCood.XScr2Bmp(ax);
    y1 := fViewCood.YScr2Bmp(ay);
    if Kind in [ldmiROI_Cycle, ldmiSolidRect, ldmiROI_Rect] then
    begin
      if (X1 >= FRect.Left - Sz) and (X1 <= FRect.Right + 40) and (Y1 >= FRect.Top - Sz) and (Y1 <=
        FRect.Bottom + 80) then
      begin
        Result := cdsMove;
      end;
    end
    else
      if Kind in [ldmiCycle, ldmiRect, ldmiReferenceLine, ldmiSelectRect, ldmiText] then
    begin
      if (X1 >= FRect.Left) and (X1 <= FRect.Right)
        and (Y1 >= FRect.Top) and (Y1 <= FRect.Bottom) then
      begin
        Result := cdsMove;
      end;
    end
    else
    begin
      if (X1 >= FRect.Left - Sz) and (X1 <= FRect.Right + Sz) and (Y1 >= FRect.Top - Sz) and (Y1 <=
        FRect.Bottom + Sz) then
      begin
        for i := 0 to FList.Count - 2 do
        begin
          if IsNearLine(i, trunc(ax), trunc(ay)) then
            Result := cdsMove;
        end;
      end;
    end;
  end;
  fDragState := Result;
end;

function TDicomDrawObject.GetNeedDrawinserting(var X2, y2: Single): Boolean;
var
  i: integer;
begin
  Result := false;
  if (FKind = ldmiNone) or (FList.Count <= 0) then
    Exit;
  if FKind <> ldmiAngle then
  begin
    Result := FList.Count <> 2;

  end
  else
  begin
    Result := TRUE;
  end;
  i := FList.Count - 1;
  X2 := SCRX[i];
  Y2 := SCRY[i];

end;

procedure TDicomDrawObject.RefreshBoundRect;
var
  i: integer;
begin
  FRect := Rect($FFFF, $FFFF, 0, 0);
  for i := 0 to GetCount - 1 do
  begin
    FRect.Left := Min(FRect.Left, trunc(X[i]));
    FRect.Top := Min(FRect.Top, trunc(Y[i]));
    FRect.Right := Max(FRect.Right, trunc(X[i]));
    FRect.Bottom := Max(FRect.Bottom, trunc(Y[i]));
  end;
end;

function TDicomDrawObject.Calc2Text: AnsiString;
  function TwoLineAngle: Double;
  var
    x1, x2, y1, y2, xx, yy: Double;
  begin
    x1 := x[1] - x[0];
    y1 := y[1] - y[0];
    x2 := x[3] - x[2];
    y2 := y[3] - y[2];
    xx := x1 * x2 + y1 * y2;
    yy := x1 * y2 - x2 * y1;
    //if( x>0 )   //ЅЗ¶И<90
    //else   //ЅЗ¶И>=90
    Result := arccos(xx / sqrt(xx * xx + yy * yy));
  end;

var
  cx, f1, f2, lx, ly: Double;
  k: Integer;
  //str1: AnsiString;
begin
  if GetCount >= 2 then
  begin
    k := getCount;
    case FKind of
      ldmiRulerCalc:
        begin
          lx := abs(x[0] - x[1]);
          ly := abs(y[0] - y[1]);
          cx := sqrt(lx * lx + ly * ly);
          Result := FormatFloat('###,###.00' + fRulerUnitString, CalLength); // + 'Pixel'
        end;
      ldmiRulerVer:
        begin
          cx := CalcLength;
          ly := abs(y[0] - y[1]) * FViewCood^.RescaleSlopeY;
          Result := FormatFloat('###,##0.00', cx) + fRulerUnitString +
            #13#10',H:' + FormatFloat('###,##0.00', ly);

        end;
      ldmiRulerHiz:
        begin
          cx := CalcLength;
          lx := abs(x[0] - x[1]) * FViewCood^.RescaleSlopeX;
          Result := FormatFloat('###,##0.00', cx) + fRulerUnitString +
            #13#10',W:' + FormatFloat('###,##0.00', lx);

        end;
      ldmiRulerVerHiz:
        begin
          cx := CalcLength;
          lx := abs(x[0] - x[1]) * FViewCood^.RescaleSlopeX;
          ly := abs(y[0] - y[1]) * FViewCood^.RescaleSlopeY;
          Result := FormatFloat('###,##0.00', cx) + fRulerUnitString +
            #13#10',W:' + FormatFloat('###,##0.00', lx) +
            #13#10',H:' + FormatFloat('###,##0.00', ly);
          if ly <> 0 then
            fCalText := fCalText + ',W/H:' + FormatFloat('###,##0.00', lx / ly);
        end;
      ldmiRuler:
        begin
          cx := CalcLength;
          Result := FormatFloat('###,##0.00', cx) + fRulerUnitString;

        end;
      ldmiPoly:
        begin
          cx := CalcLength;
          Result := FormatFloat('###,##0.00', cx) + fRulerUnitString;

        end;
      ldmiPolyonA:
        begin
          cx := CalcLength;

          f2 := CalcArea;

          Result := 'L:' + FormatFloat('###,##0.00', cx) + fRulerUnitString +
            #13#10';AREA:' + FormatFloat('###,##0.00', f2);
        end;
      ldmiPolyonV:
        begin
          cx := CalcVolume;

          Result := 'V:' + FormatFloat('###,##0.00', cx);
        end;
      ldmiAngle:
        begin
          if GetCount = 3 then
          begin
            cx := CalcAngle; //(x[0], y[0], x[1], y[1], X[2], Y[2]);

            Result := 'a=' + FormatFloat('###,##0.00', cx) + 'D';
          end;
        end;
      ldmiCross:
        begin
          lx := abs(x[0] - x[1]) * FViewCood^.RescaleSlopeX;
          ly := abs(y[0] - y[1]) * FViewCood^.RescaleSlopeY;
          cx := sqrt(lx * lx + ly * ly);

          lx := abs(x[2] - x[3]) * FViewCood^.RescaleSlopeX;
          ly := abs(y[2] - y[3]) * FViewCood^.RescaleSlopeY;
          f2 := sqrt(lx * lx + ly * ly);

          if f2 <> 0 then
          begin
            f1 := TwoLineAngle;
            Result := 'L1:' + FormatFloat('###,##0.00', cx) + fRulerUnitString +
              #13#10',L2:' + FormatFloat('###,##0.00', f2) + fRulerUnitString +
              #13#10',L1/L2:' + FormatFloat('###,##0.0000', cx / f2) +
              #13#10',Angle:' + FormatFloat('###,##0.00', (f1 / PI) * 180)
          end
          else
            Result := 'L1:' + FormatFloat('###,##0.00', cx) + fRulerUnitString;
        end;
      ldmiCross1:
        begin
          lx := abs(x[0] - x[1]) * FViewCood^.RescaleSlopeX;
          ly := abs(y[0] - y[1]) * FViewCood^.RescaleSlopeY;
          cx := sqrt(lx * lx + ly * ly);

          lx := abs(x[2] - x[3]) * FViewCood^.RescaleSlopeX;
          ly := abs(y[2] - y[3]) * FViewCood^.RescaleSlopeY;
          f2 := sqrt(lx * lx + ly * ly);

          if f2 <> 0 then
          begin
            f1 := TwoLineAngle;
            Result := 'L1-L2:' + FormatFloat('###,##0.00', cx) + fRulerUnitString +
              #13#10',L3-L4:' + FormatFloat('###,##0.00', f2) + fRulerUnitString +
              #13#10',:' + FormatFloat('###,##0.00', cx / f2);
          end
          else
            Result := 'L1:' + FormatFloat('###,##0.00', cx) + fRulerUnitString;
        end;
      ldmiROI_Cycle:
        begin
          //          fText := 'OK';
        end;
      ldmiSelectRect: ;
      ldmiReferenceLine: ;
      ldmiRect:
        begin

        end;
      ldmiCycle:
        begin

        end;
      ldmiText:
        begin

        end;
      ldmiROI_Rect:
        begin
          //          fText := 'OK';
        end;
      ldmiArrow:
        begin

        end;
    end;
  end;
end;

procedure DeleteFiles(const Path, Mask: AnsiString; recursive: boolean);
var
  Result: integer;
  SearchRec: TSearchRec;
begin
  Result := FindFirst(Path + Mask, faAnyFile - faDirectory, SearchRec);
  while Result = 0 do
  begin
    if not DeleteFile(Path + SearchRec.name) then
    begin
      FileSetAttr(Path + SearchRec.name, 0); { reset all flags }
      DeleteFile(Path + SearchRec.name);
    end;
    Result := FindNext(SearchRec);
  end;
  FindClose(SearchRec);

  if not recursive then
    exit;

  Result := FindFirst(Path + '*.*', faDirectory, SearchRec);
  while Result = 0 do
  begin
    if (SearchRec.name <> '.') and (SearchRec.name <> '..') then
    begin
      FileSetAttr(Path + SearchRec.name, faDirectory);
      DeleteFiles(Path + SearchRec.name + '\', Mask, TRUE);
      RmDir(Path + SearchRec.name);
    end;
    Result := FindNext(SearchRec);
  end;
  FindClose(SearchRec);
end;

procedure AddDictGroup(Aindex: Integer);
  procedure AddGroup(AGroup, AElement: Integer);
  begin

  end;
begin
  //CT
  //Patient
  AddGroup($0008, $1120);
  AddGroup($0010, $0010);
  AddGroup($0010, $0020);
  AddGroup($0010, $0030);
  AddGroup($0010, $0032);
  AddGroup($0010, $0040);
  AddGroup($0010, $1000);
  AddGroup($0010, $1001);
  AddGroup($0010, $2160);
  AddGroup($0010, $4000);

  //General Study
  AddGroup($0008, $0020);
  AddGroup($0008, $0030);
  AddGroup($0008, $0050);
  AddGroup($0008, $0090);
  AddGroup($0008, $1030);
  AddGroup($0008, $1032);
  AddGroup($0008, $1048);
  AddGroup($0008, $1060);
  AddGroup($0008, $1110);
  AddGroup($0020, $000D);
  AddGroup($0020, $0010);

  //Patient Study
  AddGroup($0008, $1080);
  AddGroup($0010, $1010);
  AddGroup($0010, $1020);
  AddGroup($0010, $1030);
  AddGroup($0010, $2180);
  AddGroup($0010, $21B0);

  //Frame of Reference
  AddGroup($0020, $0050);
  AddGroup($0020, $1040);

  //General Series
  AddGroup($0008, $0060);
  AddGroup($0008, $0021);
  AddGroup($0008, $0031);
  AddGroup($0008, $103E);
  AddGroup($0008, $1050);
  AddGroup($0008, $1070);
  AddGroup($0008, $1111);
  AddGroup($0018, $0015);
  AddGroup($0018, $1030);
  AddGroup($0018, $5100);
  AddGroup($0020, $000E);
  AddGroup($0020, $0011);
  AddGroup($0020, $0060);
  AddGroup($0028, $0108);
  AddGroup($0028, $0109);
  AddGroup($0040, $0244);
  AddGroup($0040, $0245);
  AddGroup($0040, $0254);
  AddGroup($0040, $0260);
  AddGroup($0040, $0275);

  //General Equipment
  AddGroup($0008, $0070);
  AddGroup($0008, $0080);
  AddGroup($0008, $0081);
  AddGroup($0008, $1010);
  AddGroup($0008, $1040);
  AddGroup($0008, $1090);
  AddGroup($0018, $1000);
  AddGroup($0018, $1020);
  AddGroup($0018, $1050);
  AddGroup($0018, $1200);
  AddGroup($0018, $1201);
  AddGroup($0028, $0120);

  //General Image
  AddGroup($0008, $0008);
  AddGroup($0008, $0022);
  AddGroup($0008, $0023);
  AddGroup($0008, $0032);
  AddGroup($0008, $0033);
  AddGroup($0008, $1140);
  AddGroup($0008, $2111);
  AddGroup($0008, $2112);
  AddGroup($0020, $0012);
  AddGroup($0020, $0013);
  AddGroup($0020, $0020);
  AddGroup($0020, $1002);
  AddGroup($0020, $4000);
  AddGroup($0028, $0300);
  AddGroup($0028, $0301);
  AddGroup($0028, $2110);
  AddGroup($0028, $2112);
  AddGroup($0088, $0200);

  //Image Plane
  AddGroup($0018, $0050);
  AddGroup($0020, $0032);
  AddGroup($0020, $0037);
  AddGroup($0020, $1041);
  AddGroup($0028, $0030);

  //Image Pixel
  AddGroup($0028, $0002);
  AddGroup($0028, $0004);
  AddGroup($0028, $0006);
  AddGroup($0028, $0010);
  AddGroup($0028, $0011);
  AddGroup($0028, $0034);
  AddGroup($0028, $0100);
  AddGroup($0028, $0102);
  AddGroup($0028, $0101);
  AddGroup($0028, $0103);
  AddGroup($0028, $0106);
  AddGroup($0028, $0107);
  AddGroup($0028, $1101);
  AddGroup($0028, $1102);
  AddGroup($0028, $1103);
  AddGroup($0028, $1201);
  AddGroup($0028, $1202);
  AddGroup($0028, $1203);
  AddGroup($7FE0, $0010);

  //Contrast/Bolus
  AddGroup($0018, $0010);
  AddGroup($0018, $0012);
  AddGroup($0018, $0014);
  AddGroup($0018, $1040);
  AddGroup($0018, $1041);
  AddGroup($0018, $1042);
  AddGroup($0018, $1043);
  AddGroup($0018, $1044);

  //CT Image
  AddGroup($0018, $0022);
  AddGroup($0018, $0060);
  AddGroup($0018, $0090);
  AddGroup($0018, $1100);
  AddGroup($0018, $1110);
  AddGroup($0018, $1111);
  AddGroup($0018, $1120);
  AddGroup($0018, $1130);
  AddGroup($0018, $1140);
  AddGroup($0018, $1150);
  AddGroup($0018, $1151);
  AddGroup($0018, $1152);
  AddGroup($0018, $1160);
  AddGroup($0018, $1170);
  AddGroup($0018, $1190);
  AddGroup($0018, $1210);
  AddGroup($0020, $0012);
  AddGroup($0028, $1052);
  AddGroup($0028, $1053);

  //Overlay Plane
  AddGroup($6000, $0010);
  AddGroup($6000, $0011);
  AddGroup($6000, $0022);
  AddGroup($6000, $0040);
  AddGroup($6000, $0045);
  AddGroup($6000, $0050);
  AddGroup($6000, $0100);
  AddGroup($6000, $0102);
  AddGroup($6000, $1301);
  AddGroup($6000, $1302);
  AddGroup($6000, $1303);
  AddGroup($6000, $1500);
  AddGroup($6000, $3000);

  //VOI LUT
  AddGroup($0028, $1050);
  AddGroup($0028, $1051);
  AddGroup($0028, $1055);
  AddGroup($0028, $3010);

  //SOP Common
  AddGroup($0008, $0005);
  AddGroup($0008, $0012);
  AddGroup($0008, $0013);
  AddGroup($0008, $0014);
  AddGroup($0008, $0016);
  AddGroup($0008, $0018);
  AddGroup($0020, $0013);

  //MR
  //MR Image
  AddGroup($0018, $0020);
  AddGroup($0018, $0021);
  AddGroup($0018, $0022);
  AddGroup($0018, $0023);
  AddGroup($0018, $0024);
  AddGroup($0018, $0025);
  AddGroup($0018, $0080);
  AddGroup($0018, $0081);
  AddGroup($0018, $0083);
  AddGroup($0018, $0084);
  AddGroup($0018, $0085);
  AddGroup($0018, $0086);
  AddGroup($0018, $0087);
  AddGroup($0018, $0088);
  AddGroup($0018, $0089);
  AddGroup($0018, $0091);
  AddGroup($0018, $0092);
  AddGroup($0018, $0093);
  AddGroup($0018, $0094);
  AddGroup($0018, $0095);
  AddGroup($0018, $1060);
  AddGroup($0018, $1062);
  AddGroup($0018, $1080);
  AddGroup($0018, $1081);
  AddGroup($0018, $1082);
  AddGroup($0018, $1083);
  AddGroup($0018, $1084);
  AddGroup($0018, $1085);
  AddGroup($0018, $1086);
  AddGroup($0018, $1088);
  AddGroup($0018, $1090);
  AddGroup($0018, $1094);
  AddGroup($0018, $1100);
  AddGroup($0018, $1250);
  AddGroup($0018, $1251);
  AddGroup($0018, $1310);
  AddGroup($0018, $1312);
  AddGroup($0018, $1314);
  AddGroup($0018, $1315);
  AddGroup($0018, $1316);
  AddGroup($0018, $1318);
  AddGroup($0020, $0100);
  AddGroup($0020, $0105);
  AddGroup($0020, $0110);

  //Overlay Plane
  AddGroup($6000, $0010);
  AddGroup($6000, $0011);
  AddGroup($6000, $0022);
  AddGroup($6000, $0040);
  AddGroup($6000, $0045);
  AddGroup($6000, $0050);
  AddGroup($6000, $0100);
  AddGroup($6000, $0102);
  AddGroup($6000, $1301);
  AddGroup($6000, $1302);
  AddGroup($6000, $1303);
  AddGroup($6000, $1500);
  AddGroup($6000, $3000);

  //NM
  //NM/PET Patient Orientation
  AddGroup($0054, $0410);
  AddGroup($0054, $0414);

  //NM Image Pixel
  AddGroup($0028, $0002);
  AddGroup($0028, $0004);
  AddGroup($0028, $0030);
  AddGroup($0028, $0100);
  AddGroup($0028, $0101);
  AddGroup($0028, $0102);

  //Multi-frame
  AddGroup($0028, $0008);
  AddGroup($0028, $0009);

  //NM Multi-frame
  AddGroup($0028, $0009);
  AddGroup($0054, $0010);
  AddGroup($0054, $0011);
  AddGroup($0054, $0020);
  AddGroup($0054, $0021);
  AddGroup($0054, $0030);
  AddGroup($0054, $0031);
  AddGroup($0054, $0050);
  AddGroup($0054, $0051);
  AddGroup($0054, $0060);
  AddGroup($0054, $0061);
  AddGroup($0054, $0070);
  AddGroup($0054, $0071);
  AddGroup($0054, $0080);
  AddGroup($0054, $0081);
  AddGroup($0054, $0090);
  AddGroup($0054, $0100);

  //NM Image
  AddGroup($0008, $0008);
  AddGroup($0008, $1130);
  AddGroup($0008, $1145);
  AddGroup($0008, $2218);
  AddGroup($0008, $2228);
  AddGroup($0018, $0070);
  AddGroup($0018, $0071);
  AddGroup($0018, $1061);
  AddGroup($0018, $1130);
  AddGroup($0018, $1131);
  AddGroup($0018, $1242);
  AddGroup($0018, $1243);
  AddGroup($0018, $1300);
  AddGroup($0018, $1301);
  AddGroup($0018, $1302);
  AddGroup($0018, $5020);
  AddGroup($0028, $0051);
  AddGroup($0028, $2110);
  AddGroup($0054, $0400);

  //NM Isotope
  AddGroup($0018, $0026);
  AddGroup($0054, $0012);
  AddGroup($0054, $0016);

  //NM Detector
  AddGroup($0054, $0022);

  //NM TOMO Acquisition
  AddGroup($0054, $0052);
  AddGroup($0054, $0202);

  //NM Multi-gated Acquisition
  AddGroup($0018, $1080);
  AddGroup($0018, $1085);
  AddGroup($0018, $1086);
  AddGroup($0018, $1088);
  AddGroup($0054, $0062);

  //NM Phase
  AddGroup($0054, $0032);

  //NM Reconstruction
  AddGroup($0018, $0050);
  AddGroup($0018, $0088);
  AddGroup($0018, $1100);
  AddGroup($0018, $1210);
  AddGroup($0020, $1041);

  //Multi-frame Overlay
  AddGroup($6000, $0015);
  AddGroup($6000, $0051);

  //Curve
  AddGroup($5000, $0005);
  AddGroup($5000, $0010);
  AddGroup($5000, $0020);
  AddGroup($5000, $0022);
  AddGroup($5000, $0030);
  AddGroup($5000, $0040);
  AddGroup($5000, $0103);
  AddGroup($5000, $0104);
  AddGroup($5000, $0105);
  AddGroup($5000, $0106);
  AddGroup($5000, $0110);
  AddGroup($5000, $0112);
  AddGroup($5000, $0114);
  AddGroup($5000, $2500);
  AddGroup($5000, $2600);
  AddGroup($5000, $3000);

  //VOI LUT
  AddGroup($0028, $1050);
  AddGroup($0028, $1051);
  AddGroup($0028, $1055);
  AddGroup($0028, $3010);

  //Basic Study Descriptor
  //Patient Summary
  AddGroup($0010, $0010);
  AddGroup($0010, $0020);

  //Study Content
  AddGroup($0008, $1115);
  AddGroup($0020, $000D);
  AddGroup($0020, $0010);

  //Modality Worklist Item
  //Specific Character Set
  AddGroup($0008, $0005);

  //Patient Relationship
  AddGroup($0008, $1110);
  AddGroup($0008, $1125);
  AddGroup($0038, $0004);

  //Patient Identification
  AddGroup($0010, $0010);
  AddGroup($0010, $0020);
  AddGroup($0010, $0021);
  AddGroup($0010, $1000);
  AddGroup($0010, $1001);
  AddGroup($0010, $1005);
  AddGroup($0010, $1060);
  AddGroup($0010, $1090);

  //Patient Demographic
  AddGroup($0010, $1010);
  AddGroup($0010, $0030);
  AddGroup($0010, $0032);
  AddGroup($0010, $0040);
  AddGroup($0010, $0050);
  AddGroup($0010, $1020);
  AddGroup($0010, $1030);
  AddGroup($0010, $1040);
  AddGroup($0010, $1080);
  AddGroup($0010, $1081);
  AddGroup($0010, $2150);
  AddGroup($0010, $2152);
  AddGroup($0010, $2154);
  AddGroup($0010, $2160);
  AddGroup($0010, $2180);
  AddGroup($0010, $21F0);
  AddGroup($0010, $4000);
  AddGroup($0040, $3001);

  //Patient Medical
  AddGroup($0010, $2000);
  AddGroup($0010, $2110);
  AddGroup($0010, $21A0);
  AddGroup($0010, $21B0);
  AddGroup($0010, $21C0);
  AddGroup($0010, $21D0);
  AddGroup($0038, $0050);
  AddGroup($0038, $0500);

  //Visit Relationship
  AddGroup($0008, $1110);
  AddGroup($0008, $1120);

  //Visit Identification
  AddGroup($0008, $0080);
  AddGroup($0008, $0081);
  AddGroup($0008, $0082);
  AddGroup($0038, $0010);
  AddGroup($0038, $0011);

  //Visit Status
  AddGroup($0038, $0008);
  AddGroup($0038, $0300);
  AddGroup($0038, $0400);
  AddGroup($0038, $4000);

  //Visit Admission
  AddGroup($0008, $0090);
  AddGroup($0008, $0092);
  AddGroup($0008, $0094);
  AddGroup($0008, $1080);
  AddGroup($0008, $1084);
  AddGroup($0038, $0016);
  AddGroup($0038, $0020);
  AddGroup($0038, $0021);

  //Scheduled Procedure Step
  AddGroup($0040, $0100);

  //Requested Procedure
  AddGroup($0008, $1110);
  AddGroup($0020, $000D);
  AddGroup($0020, $000D);
  AddGroup($0032, $000A);
  AddGroup($0032, $1060);
  AddGroup($0032, $1064);
  AddGroup($0040, $1001);
  AddGroup($0040, $1002);
  AddGroup($0040, $1003);
  AddGroup($0040, $1004);
  AddGroup($0040, $1005);
  AddGroup($0040, $1008);
  AddGroup($0040, $1009);
  AddGroup($0040, $1010);
  AddGroup($0040, $1400);

  //Imaging Service Request
  AddGroup($0008, $0050);
  AddGroup($0008, $0090);
  AddGroup($0032, $1032);
  AddGroup($0032, $1033);
  AddGroup($0040, $2001);
  AddGroup($0040, $2004);
  AddGroup($0040, $2005);
  AddGroup($0040, $2008);
  AddGroup($0040, $2009);
  AddGroup($0040, $2010);
  AddGroup($0040, $2016);
  AddGroup($0040, $2017);
  AddGroup($0040, $2400);

  //Modality PPS
  //PPS Relationship
  AddGroup($0008, $1120);
  AddGroup($0010, $0010);
  AddGroup($0010, $0020);
  AddGroup($0010, $0030);
  AddGroup($0010, $0040);
  AddGroup($0040, $0270);

  //PPS Information
  AddGroup($0008, $1032);
  AddGroup($0040, $0241);
  AddGroup($0040, $0242);
  AddGroup($0040, $0243);
  AddGroup($0040, $0244);
  AddGroup($0040, $0245);
  AddGroup($0040, $0250);
  AddGroup($0040, $0251);
  AddGroup($0040, $0252);
  AddGroup($0040, $0253);
  AddGroup($0040, $0254);
  AddGroup($0040, $0255);
  AddGroup($0040, $0280);

  //Image Acquisition Results
  AddGroup($0008, $0060);
  AddGroup($0020, $0010);
  AddGroup($0040, $0260);
  AddGroup($0040, $0340);

  //Radiation Dose
  AddGroup($0008, $2229);
  AddGroup($0018, $1110);
  AddGroup($0018, $115E);
  AddGroup($0040, $0300);
  AddGroup($0040, $0301);
  AddGroup($0040, $0302);
  AddGroup($0040, $0303);
  AddGroup($0040, $0306);
  AddGroup($0040, $0310);

  //Billing and Material
  AddGroup($0040, $0320);
  AddGroup($0040, $0321);
  AddGroup($0040, $0324);

  //Presentation State
  //Mask
  AddGroup($0028, $1090);
  AddGroup($0028, $6100);

  //Display Shutter
  AddGroup($0018, $1600);
  AddGroup($0018, $1602);
  AddGroup($0018, $1604);
  AddGroup($0018, $1606);
  AddGroup($0018, $1608);
  AddGroup($0018, $1610);
  AddGroup($0018, $1612);
  AddGroup($0018, $1620);
  AddGroup($0018, $1622);

  //Bitmap Display Shutter
  AddGroup($0018, $1600);
  AddGroup($0018, $1622);
  AddGroup($0018, $1623);

  //Displayed Area
  AddGroup($0070, $005A);

  //Overlay/Curve Activation
  AddGroup($5000, $1001);
  AddGroup($6000, $1001);

  //Graphic Annotation
  AddGroup($0070, $0001);

  //Spatial Transformation
  AddGroup($0070, $0041);
  AddGroup($0070, $0042);

  //Graphic Layer
  AddGroup($0070, $0060);

  //Modality LUT
  AddGroup($0028, $1052);
  AddGroup($0028, $1053);
  AddGroup($0028, $1054);
  AddGroup($0028, $3000);

  //Softcopy VOI LUT
  AddGroup($0028, $3110);

  //Softcopy Presentation LUT
  AddGroup($2050, $0010);
  AddGroup($2050, $0020);

  //Presentation State
  AddGroup($0008, $1115);
  AddGroup($0018, $1622);
  AddGroup($0020, $0013);
  AddGroup($0028, $1090);
  AddGroup($0028, $6100);
  AddGroup($0070, $0080);
  AddGroup($0070, $0081);
  AddGroup($0070, $0082);
  AddGroup($0070, $0083);
  AddGroup($0070, $0084);

  //Basic Text SR
  //Specimen Identification
  AddGroup($0040, $050A);
  AddGroup($0040, $0550);

  //SR Document Series
  AddGroup($0008, $0060);
  AddGroup($0008, $1111);
  AddGroup($0020, $000E);
  AddGroup($0020, $0011);

  //SR Document General
  AddGroup($0008, $0023);
  AddGroup($0008, $0033);
  AddGroup($0020, $0013);
  AddGroup($0040, $A073);
  AddGroup($0040, $A360);
  AddGroup($0040, $A370);
  AddGroup($0040, $A372);
  AddGroup($0040, $A375);
  AddGroup($0040, $A385);
  AddGroup($0040, $A491);
  AddGroup($0040, $A492);
  AddGroup($0040, $A493);
  AddGroup($0040, $A525);

  //SR Document Content
  AddGroup($0040, $A032);
  AddGroup($0040, $A040);
  AddGroup($0040, $A043);
  AddGroup($0040, $A050);
  AddGroup($0040, $A504);
  AddGroup($0040, $A730);

  //SPS
  AddGroup($0008, $0005);
  AddGroup($0040, $0100);
  AddGroup($0008, $0060);
  AddGroup($0032, $1070);
  AddGroup($0040, $0001);
  AddGroup($0040, $0002);
  AddGroup($0040, $0003);
  AddGroup($0040, $0004);
  AddGroup($0040, $0005);
  AddGroup($0040, $0006);
  AddGroup($0040, $0007);
  AddGroup($0040, $0008);
  AddGroup($0040, $0009);
  AddGroup($0040, $0010);
  AddGroup($0040, $0011);
  AddGroup($0040, $0012);
  AddGroup($0040, $0020);
  AddGroup($0040, $0400);

  //PROCEDURE
  AddGroup($0008, $1110);
  AddGroup($0020, $000D);
  AddGroup($0020, $000D);
  AddGroup($0032, $000A);
  AddGroup($0032, $1060);
  AddGroup($0032, $1064);
  AddGroup($0040, $1001);
  AddGroup($0040, $1002);
  AddGroup($0040, $1003);
  AddGroup($0040, $1004);
  AddGroup($0040, $1005);
  AddGroup($0040, $1008);
  AddGroup($0040, $1009);
  AddGroup($0040, $1010);
  AddGroup($0040, $1400);

  //SERVICE REQUEST
  AddGroup($0008, $0050);
  AddGroup($0008, $0090);
  AddGroup($0032, $1032);
  AddGroup($0032, $1033);
  AddGroup($0040, $2001);
  AddGroup($0040, $2004);
  AddGroup($0040, $2005);
  AddGroup($0040, $2008);
  AddGroup($0040, $2009);
  AddGroup($0040, $2010);
  AddGroup($0040, $2016);
  AddGroup($0040, $2017);
  AddGroup($0040, $2400);

  //PATIENT
  AddGroup($0008, $1110);
  AddGroup($0008, $1125);
  AddGroup($0010, $0010);
  AddGroup($0010, $0020);
  AddGroup($0010, $0021);
  AddGroup($0010, $0030);
  AddGroup($0010, $0032);
  AddGroup($0010, $0040);
  AddGroup($0010, $0050);
  AddGroup($0010, $1000);
  AddGroup($0010, $1001);
  AddGroup($0010, $1005);
  AddGroup($0010, $1010);
  AddGroup($0010, $1020);
  AddGroup($0010, $1030);
  AddGroup($0010, $1040);
  AddGroup($0010, $1060);
  AddGroup($0010, $1080);
  AddGroup($0010, $1081);
  AddGroup($0010, $1090);
  AddGroup($0010, $2000);
  AddGroup($0010, $2110);
  AddGroup($0010, $2150);
  AddGroup($0010, $2152);
  AddGroup($0010, $2154);
  AddGroup($0010, $2160);
  AddGroup($0010, $2180);
  AddGroup($0010, $21A0);
  AddGroup($0010, $21B0);
  AddGroup($0010, $21C0);
  AddGroup($0010, $21D0);
  AddGroup($0010, $21F0);
  AddGroup($0010, $4000);
  AddGroup($0038, $0004);
  AddGroup($0038, $0050);
  AddGroup($0038, $0500);
  AddGroup($0040, $3001);

  //VISIT
  AddGroup($0008, $0080);
  AddGroup($0008, $0081);
  AddGroup($0008, $0082);
  AddGroup($0008, $0090);
  AddGroup($0008, $0092);
  AddGroup($0008, $0094);
  AddGroup($0008, $1080);
  AddGroup($0008, $1084);
  AddGroup($0008, $1110);
  AddGroup($0008, $1120);
  AddGroup($0038, $0008);
  AddGroup($0038, $0010);
  AddGroup($0038, $0011);
  AddGroup($0038, $0016);
  AddGroup($0038, $0020);
  AddGroup($0038, $0021);
  AddGroup($0038, $0300);
  AddGroup($0038, $0400);
  AddGroup($0038, $4000);

  //PATIENT
  AddGroup($0008, $1120);
  AddGroup($0010, $0010);
  AddGroup($0010, $0020);
  AddGroup($0010, $0030);
  AddGroup($0010, $0032);
  AddGroup($0010, $0040);
  AddGroup($0010, $1000);
  AddGroup($0010, $1001);
  AddGroup($0010, $2160);
  AddGroup($0010, $4000);
  AddGroup($0020, $1200);
  AddGroup($0020, $1202);
  AddGroup($0020, $1204);

  //STUDY
  AddGroup($0008, $0020);
  AddGroup($0008, $0030);
  AddGroup($0008, $0050);
  AddGroup($0008, $0061);
  AddGroup($0008, $0090);
  AddGroup($0008, $1030);
  AddGroup($0008, $1032);
  AddGroup($0008, $1048);
  AddGroup($0008, $1060);
  AddGroup($0008, $1080);
  AddGroup($0008, $1110);
  AddGroup($0010, $1010);
  AddGroup($0010, $1020);
  AddGroup($0010, $1030);
  AddGroup($0010, $2180);
  AddGroup($0010, $21B0);
  AddGroup($0020, $000D);
  AddGroup($0020, $0010);
  AddGroup($0020, $1206);
  AddGroup($0020, $1208);

  //SERIES
  AddGroup($0008, $0021);
  AddGroup($0008, $0031);
  AddGroup($0008, $0060);
  AddGroup($0008, $103E);
  AddGroup($0008, $1050);
  AddGroup($0008, $1070);
  AddGroup($0008, $1111);
  AddGroup($0018, $0015);
  AddGroup($0018, $1030);
  AddGroup($0018, $5100);
  AddGroup($0020, $000E);
  AddGroup($0020, $0011);
  AddGroup($0020, $0060);
  AddGroup($0020, $1209);
  AddGroup($0028, $0108);
  AddGroup($0028, $0109);
  AddGroup($0040, $0244);
  AddGroup($0040, $0245);
  AddGroup($0040, $0254);
  AddGroup($0040, $0260);
  AddGroup($0040, $0275);

  //IMAGE
  AddGroup($0008, $0008);
  AddGroup($0008, $0018);
  AddGroup($0008, $0022);
  AddGroup($0008, $0023);
  AddGroup($0008, $0032);
  AddGroup($0008, $0033);
  AddGroup($0008, $1115);
  AddGroup($0008, $1140);
  AddGroup($0008, $2111);
  AddGroup($0008, $2112);
  AddGroup($0018, $1622);
  AddGroup($0020, $0012);
  AddGroup($0020, $0013);
  AddGroup($0020, $0020);
  AddGroup($0020, $1002);
  AddGroup($0020, $4000);
  AddGroup($0028, $0002);
  AddGroup($0028, $0004);
  AddGroup($0028, $0006);
  AddGroup($0028, $0008);
  AddGroup($0028, $0009);
  AddGroup($0028, $0010);
  AddGroup($0028, $0011);
  AddGroup($0028, $0034);
  AddGroup($0028, $0100);
  AddGroup($0028, $0101);
  AddGroup($0028, $0102);
  AddGroup($0028, $0103);
  AddGroup($0028, $0106);
  AddGroup($0028, $0107);
  AddGroup($0028, $0300);
  AddGroup($0028, $0301);
  AddGroup($0028, $1090);
  AddGroup($0028, $1101);
  AddGroup($0028, $1102);
  AddGroup($0028, $1103);
  AddGroup($0028, $1201);
  AddGroup($0028, $1202);
  AddGroup($0028, $1203);
  AddGroup($0028, $2110);
  AddGroup($0028, $2112);
  AddGroup($0028, $6100);
  AddGroup($0040, $A032);
  AddGroup($0040, $A040);
  AddGroup($0040, $A043);
  AddGroup($0040, $A050);
  AddGroup($0040, $A073);
  AddGroup($0040, $A360);
  AddGroup($0040, $A370);
  AddGroup($0040, $A372);
  AddGroup($0040, $A375);
  AddGroup($0040, $A385);
  AddGroup($0040, $A491);
  AddGroup($0040, $A492);
  AddGroup($0040, $A493);
  AddGroup($0040, $A504);
  AddGroup($0040, $A525);
  AddGroup($0040, $A730);
  AddGroup($0070, $0080);
  AddGroup($0070, $0081);
  AddGroup($0070, $0082);
  AddGroup($0070, $0083);
  AddGroup($0070, $0084);
  AddGroup($0088, $0200);
  AddGroup($7FE0, $0010);

end;

constructor TDicomMemoryStream.Create(AData: Pointer; Alen: Integer);
begin
  SetPointer(AData, Alen);
  inherited Create;
end;

/////////////////////////////////////////////////////////////////////////////////////

function dmin(v1, v2: double): double;
begin
  if v1 < v2 then
    dmin := v1
  else
    dmin := v2;
end;

function dmax(v1, v2: double): double;
begin
  if v1 > v2 then
    dmax := v1
  else
    dmax := v2;
end;

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

function ilimit(vv, min, max: integer): integer;
begin
  result := IMin(IMax(vv, min), max);
end;
// limita da 0 a 255

function blimit(vv: integer): integer;
begin
  if vv < 0 then
    blimit := 0
  else
    if vv > 255 then
    blimit := 255
  else
    blimit := vv;
end;

procedure _GetHistogram(Bitmap: TBitmap; var Hist: THistogram; fSelx1, fSely1, fSelx2, fSely2:
  integer);
var
  x, y: integer;
  e: pRGB;
begin
  if Bitmap.Pixelformat <> pf24bit then
    exit;
  fSelX2 := imin(fSelX2, bitmap.Width);
  dec(fSelX2);
  fSelY2 := imin(fSelY2, bitmap.Height);
  dec(fSelY2);
  fillmemory(@Hist, sizeof(THistogram), 0); // zero fill
  for y := fSely1 to fSely2 do
  begin
    e := Bitmap.ScanLine[y];
    inc(e, fSelx1);
    for x := fSelx1 to fSelx2 do
    begin
      inc(Hist[e^.r].r);
      inc(Hist[e^.g].g);
      inc(Hist[e^.b].b);
      inc(Hist[(e^.r * 21 + e^.g * 71 + e^.b * 7) div 100].Gray);
      inc(e);
    end;
  end;
end;

function GetImageGrid(pImageCount: Integer): TPoint;
begin
  with Result do
  begin
    X := 1;
    Y := 1;
    while X * Y < pImageCount do
    begin
      if X <= Y then
        Inc(X)
      else
        Inc(Y);
    end;
  end;
end;

function TDicomImage.CalFontSpacing(AWidth, AHeight: integer): Integer;
var
  k: integer;
begin
  case fOverlayFontSizeMode of
    olmCalFromWidth: k := AWidth;
    olmCalFromHeight: k := AHeight;
    olmCalFromMax: k := Max(AWidth, AHeight);
    olmCalFromMin: k := Min(AWidth, AHeight);
  end;

  lFontSpacing := Round(k * fOverlayFontSizePrecent / 100);
  Result := lFontSpacing;
end;

procedure TDicomImage.ResetZoom;
begin
  FViewModify := true;
  ViewerZoom := 1;
  OffsetX := 0;
  OffsetY := 0;
  CurrentViewSize.cx := 0;
  CurrentViewSize.cy := 0;
  //self.UpdateCood(Rect(0, 0, 0, 0), Rect(0, 0, 0, 0), Scale, Attributes.ImageData.PixelSpacingX);
end;

procedure TDicomImage.Reset;
var
  da1: TDicomAttribute;
  das1: TDicomAttributes;
begin
  if FPostProcessed then
  begin
    ImageData[0].ResetToStream;
    FPostProcessed := false;
    fPixelRepresentation := FAttributes.getInteger($28, $103) = 0;
  end;

  FModify := true;

  FImageAngle := 0;

  FPostFilter := -1;
  UseImageBuffer := false;
  Negative := false;
  Rotate := 0;
  VerFlip := false;
  HozFlip := False;
  WindowCenter := Attributes.getInteger($28, $1050);
  WindowWidth := Attributes.getInteger($28, $1051);
  LoadLutFromStream(nil);

  da1 := Attributes.Item[$0028, $0030]; //ByContant[dPixelSpacing];
  if assigned(da1) and (da1.GetCount >= 2) then
  begin
    PixelSpacingY := da1.AsFloat[0] / 10;
    PixelSpacingX := da1.AsFloat[1] / 10;
  end
  else
  begin
    da1 := Attributes.Item[$18, $1164];
    if assigned(da1) and (da1.GetCount >= 2) then
    begin
      PixelSpacingY := da1.AsFloat[0] / 10;
      PixelSpacingX := da1.AsFloat[1] / 10;
    end
    else
    begin
      da1 := Attributes.Item[$5200, $9229];
      if assigned(da1) and (da1.GetCount > 0) then
      begin
        das1 := da1.Attributes[0];

        da1 := das1.Item[$28, $9110];
        if assigned(da1) and (da1.GetCount > 0) then
        begin
          das1 := da1.Attributes[0];
          da1 := das1.Item[$28, $30];
          if assigned(da1) and (da1.GetCount >= 2) then
          begin
            PixelSpacingY := da1.AsFloat[0] / 10;
            PixelSpacingX := da1.AsFloat[1] / 10;
          end;
        end
      end
      else
      begin
        //PixelSpacingX := 0;
        //PixelSpacingY := 0;
      end;
    end;
  end;

  //  imagedata.Zoom := 1;
  ViewerZoom := 1;
  OffsetX := 0;
  OffsetY := 0;
end;

function TDicomDatasets.GetSeriesImageCount(ADataset: TDicomDataset): Integer;
var
  i: integer;
  str1, str2: AnsiString;
  das1: TDicomDataset;
begin
  result := 0;
  if FDatasetList.Count <= 0 then
    exit;
  str2 := ADataset.Attributes.GetString($20, $E);
  for i := 0 to FDatasetList.Count - 1 do
  begin
    das1 := TDicomDataset(FDatasetList[i]);
    str1 := das1.Attributes.GetString($20, $E);
    if str1 = str2 then
      Result := Result + 1;
  end;
end;

function TDicomImage.PrepareOverlayData: Boolean;
var
  da1, da2: TDicomAttribute;
  w, h, i, i1: Integer;
  str1: AnsiString;
  o1: TOBStream;
  //  b1: PColor32Array;
  //  p1: PByte;
  n1: Byte;

  z1: integer;
  pw1: PByte;
  pd1: PWord;
begin
  {1509[6002:0010](1)US=<1>938
1510[6002:0011](1)US=<1>1022
1514[6002:0040](1)CS=<1>G
1516[6002:0050](2)SS=<2>0\0
1519[6002:0100](1)US=<1>1
1520[6002:0102](1)US=<1>0
1534[6002:3000](1)OW=<1>OB/OW Data 119830Byte}
  if fOverlayBuffer <> nil then
    exit;

  i := 0;
  da1 := Attributes.Item[$6000 + i * 2, $10];
  if assigned(da1) then
  begin
    GetMem(fOverlayBuffer, Width * Height * SizeOf(Word));
    FillChar(fOverlayBuffer^, Width * Height * SizeOf(Word), 0);
    fOverlayBufferBits := 0;

    while assigned(da1) do
    begin
      w := da1.AsInteger[0];
      h := Attributes.getInteger($6000 + i * 2, $11);
      str1 := Attributes.GetString($6000 + i * 2, $40);
      if str1 = 'G' then
      begin
        da2 := Attributes.Item[$6000 + i * 2, $3000];

        if assigned(da2) and (da2.GetCount > 0) then
        begin
          o1 := da2.AsOBData[0];

          pw1 := o1.Memory;
          z1 := 0;
          pd1 := fOverlayBuffer;
          for i1 := 0 to w * h - 1 do // Iterate
          begin
            n1 := pw1^;
            if (n1 and (1 shl z1)) <> 0 then
            begin
              pd1^ := pd1^ or (1 shl fOverlayBufferBits);
            end;
            inc(pd1);
            z1 := (z1 + 1) mod 8;
            if z1 = 0 then
              inc(pw1);
          end; // for}
        end;

        inc(fOverlayBufferBits);
      end;
      inc(i);
      da1 := Attributes.Item[$6000 + i * 2, $10];
    end;
  end;
end;

function TDicomImage.ConvertFromRGB(d1: TDicomImageData; var aconvertLength: Integer): Pointer;
var
  pycbcr1: pYCBCR;
  pycbcr4221: pYCBCR422;
  pby, pbcr, pbcb, pbr, pbg, pbb: PByte;
  p1: Pointer;
  //  pw1: PWord;
  //  rw1: Word;
//  cb, cr: Byte;
  b, g, r: Integer;
  DestScanLine: pRGB;
  //DestScanLine1: pRGB;
  I1, i2: Integer;
begin
  if not d1.fColorSpaceIsConverted then
    exit;
  if (PhotometricInterpretation = 'YBR_FULL') then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    aconvertLength := Width * height * 3;

    if self.PlanarConfiguration = 1 then
    begin
      pbr := d1.Data;
      pbg := pbr;
      inc(pbg, Height * Width);
      pbb := pbg;
      inc(pbb, Height * Width);

      pby := p1;
      pbcb := pby;
      inc(pbcb, Height * Width);
      pbcr := pbcb;
      inc(pbcr, Height * Width);
    end
    else
    begin
      DestScanLine := d1.Data;
      pycbcr1 := p1;
    end;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if self.PlanarConfiguration = 1 then
        begin
          r := pbr^;
          g := pbg^;
          b := pbb^;

          {Y = + .2990R + .5870G + .1140B
          CB = - .1687R - .3313G + .5000B + 128
          CR = + .5000R - .4187G - .0813B + 128}

          pby^ := trunc(0.2990 * R + 0.5870 * G + 0.1140 * B);
          pbcb^ := trunc(-0.1687 * R - 0.3313 * G + 0.5000 * B) + 128;
          pbcr^ := trunc(+0.5000 * R - 0.4187 * G - 0.0813 * B) + 128;
          //pbr^ := Trunc(Y + (1.402 * CR) - 179.448);
          //pbg^ := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          //pbb^ := Trunc(Y + (1.772 * CB) - 226.8);

          inc(pbr);
          inc(pbg);
          inc(pbb);
          inc(pby);
          inc(pbcb);
          inc(pbcr);
        end
        else
        begin
          r := DestScanLine.r;
          g := DestScanLine.g;
          b := DestScanLine.b;

          pycbcr1^.y := trunc(0.2990 * R + 0.5870 * G + 0.1140 * B);
          pycbcr1^.cb := trunc(-0.1687 * R - 0.3313 * G + 0.5000 * B) + 128;
          pycbcr1^.cr := trunc(+0.5000 * R - 0.4187 * G - 0.0813 * B) + 128;

          //DestScanLine.r := Trunc(Y + (1.402 * CR) - 179.448);
          //DestScanLine.g := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          //DestScanLine.b := Trunc(Y + (1.772 * CB) - 226.8);
          inc(DestScanLine);
          inc(pycbcr1);
        end;
      end;
    end;

    Result := p1;
  end
  else
    if PhotometricInterpretation = 'YBR_FULL_422' then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 2);
    aconvertLength := Width * height * 2;

    DestScanLine := d1.Data;
    pycbcr4221 := p1;

    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if FPlanarConfiguration = 1 then
        begin
          b := DestScanLine.r;
          g := DestScanLine.g;
          r := DestScanLine.b;
        end
        else
        begin
          r := DestScanLine.r;
          g := DestScanLine.g;
          b := DestScanLine.b;
        end;

        if (i2 mod 2) = 0 then
        begin
          pycbcr4221^.y := trunc(0.2990 * R + 0.5870 * G + 0.1140 * B);
          pycbcr4221^.cb := trunc(-0.1687 * R - 0.3313 * G + 0.5000 * B) + 128;
          pycbcr4221^.cr := trunc(+0.5000 * R - 0.4187 * G - 0.0813 * B) + 128;

        end
        else
        begin
          pycbcr4221^.y1 := trunc(0.2990 * R + 0.5870 * G + 0.1140 * B);
          pycbcr4221^.cb := trunc(-0.1687 * R - 0.3313 * G + 0.5000 * B) + 128;
          pycbcr4221^.cr := trunc(+0.5000 * R - 0.4187 * G - 0.0813 * B) + 128;
          inc(pycbcr4221);
        end;
        inc(DestScanLine);
      end;
    end;
    Result := p1;
  end
  else
    if PhotometricInterpretation = 'YBR_PARTIAL_422' then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    DestScanLine := p1;
    {Y = + .2568R + .5041G + .0979B + 16
    CB = - .1482R - .2910G + .4392B + 128
    CR = + .4392R - .3678G - .0714B + 128}

    {Y = 0.257RЎд + 0.504GЎд + 0.098BЎд + 16
    Cb = -0.148RЎд - 0.291GЎд + 0.439BЎд + 128
    Cr = 0.439RЎд - 0.368GЎд - 0.071BЎд + 128

    RЎд = 1.164(Y - 16) + 1.596(Cr - 128)
    GЎд = 1.164(Y - 16) - 0.813(Cr - 128) - 0.392(Cb - 128)
    BЎд = 1.164(Y - 16) + 2.017(Cb - 128) }
    {R :=trunc( 1.164*(Y - 16) + 1.596*(Cr - 128));
    G := trunc(1.164*(Y - 16) - 0.813*(Cr - 128) - 0.392*(Cb - 128));
    B :=trunc(1.164*(Y - 16) + 2.017*(Cb - 128));
    }
    if self.PlanarConfiguration = 1 then
    begin
      pbr := d1.Data;
      pbg := pbr;
      inc(pbg, Height * Width);
      pbb := pbg;
      inc(pbb, Height * Width);

      pby := p1;
      pbcb := pby;
      inc(pbcb, Height * Width);
      pbcr := pbcb;
      inc(pbcr, Height * Width);
    end
    else
    begin
      DestScanLine := d1.Data;
      pycbcr1 := p1;
    end;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if self.PlanarConfiguration = 1 then
        begin
          r := pbr^;
          g := pbg^;
          b := pbb^;

          pby^ := r;
          pbcb^ := g;
          pbcr^ := b;
          //pbr^ := Trunc(Y + (1.402 * CR) - 179.448);
          //pbg^ := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          //pbb^ := Trunc(Y + (1.772 * CB) - 226.8);

          inc(pbr);
          inc(pbg);
          inc(pbb);
          inc(pby);
          inc(pbcb);
          inc(pbcr);
        end
        else
        begin
          r := DestScanLine.r;
          g := DestScanLine.g;
          b := DestScanLine.b;

          pycbcr1^.y := r;
          pycbcr1^.cb := g;
          pycbcr1^.cr := b;

          //DestScanLine.r := Trunc(Y + (1.402 * CR) - 179.448);
          //DestScanLine.g := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          //DestScanLine.b := Trunc(Y + (1.772 * CB) - 226.8);
          inc(DestScanLine);
          inc(pycbcr1);
        end;
      end;
    end;
    Result := p1;
  end
  else
    if PhotometricInterpretation = 'YBR_ICT' then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    DestScanLine := p1;
    {Y = + .29900R + .58700G + .11400B
    CB = - .16875R - .33126G + .50000B
    CR = + .50000R - .41869G - .08131B}
    if self.PlanarConfiguration = 1 then
    begin
      pbr := d1.Data;
      pbg := pbr;
      inc(pbg, Height * Width);
      pbb := pbg;
      inc(pbb, Height * Width);

      pby := p1;
      pbcb := pby;
      inc(pbcb, Height * Width);
      pbcr := pbcb;
      inc(pbcr, Height * Width);
    end
    else
    begin
      DestScanLine := d1.Data;
      pycbcr1 := p1;
    end;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if self.PlanarConfiguration = 1 then
        begin
          r := pbr^;
          g := pbg^;
          b := pbb^;

          pby^ := r;
          pbcb^ := g;
          pbcr^ := b;
          //pbr^ := Trunc(Y + (1.402 * CR) - 179.448);
          //pbg^ := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          //pbb^ := Trunc(Y + (1.772 * CB) - 226.8);

          inc(pbr);
          inc(pbg);
          inc(pbb);
          inc(pby);
          inc(pbcb);
          inc(pbcr);
        end
        else
        begin
          r := DestScanLine.r;
          g := DestScanLine.g;
          b := DestScanLine.b;

          pycbcr1^.y := r;
          pycbcr1^.cb := g;
          pycbcr1^.cr := b;

          //DestScanLine.r := Trunc(Y + (1.402 * CR) - 179.448);
          //DestScanLine.g := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          //DestScanLine.b := Trunc(Y + (1.772 * CB) - 226.8);
          inc(DestScanLine);
          inc(pycbcr1);
        end;
      end;
    end;
    Result := p1;
  end
  else
    if PhotometricInterpretation = 'YBR_RCT' then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    DestScanLine := p1;
    {Y = (R + 2G +B) / 4 (Note: ?.. mean floor)
    CB = B - G
    CR = R - G

    G = Y -(CR + CB) / 4
    R = CR + G
    B = CB + G}
    if self.PlanarConfiguration = 1 then
    begin
      pbr := d1.Data;
      pbg := pbr;
      inc(pbg, Height * Width);
      pbb := pbg;
      inc(pbb, Height * Width);

      pby := p1;
      pbcb := pby;
      inc(pbcb, Height * Width);
      pbcr := pbcb;
      inc(pbcr, Height * Width);
    end
    else
    begin
      DestScanLine := d1.Data;
      pycbcr1 := p1;
    end;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if self.PlanarConfiguration = 1 then
        begin
          r := pbr^;
          g := pbg^;
          b := pbb^;

          pby^ := r;
          pbcb^ := g;
          pbcr^ := b;
          //pbr^ := Trunc(Y + (1.402 * CR) - 179.448);
          //pbg^ := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          //pbb^ := Trunc(Y + (1.772 * CB) - 226.8);

          inc(pbr);
          inc(pbg);
          inc(pbb);
          inc(pby);
          inc(pbcb);
          inc(pbcr);
        end
        else
        begin
          r := DestScanLine.r;
          g := DestScanLine.g;
          b := DestScanLine.b;

          pycbcr1^.y := r;
          pycbcr1^.cb := g;
          pycbcr1^.cr := b;

          //DestScanLine.r := Trunc(Y + (1.402 * CR) - 179.448);
          //DestScanLine.g := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          //DestScanLine.b := Trunc(Y + (1.772 * CB) - 226.8);
          inc(DestScanLine);
          inc(pycbcr1);
        end;
      end;
    end;
    Result := p1;
  end;
end;

procedure TDicomImage.ConvertToRGB(d1: TDicomImageData);
var
  pycbcr1: pYCBCR;
  pycbcr4221: pYCBCR422;
  pby, pbcr, pbcb, pbr, pbg, pbb, pb1: PByte;
  p1: Pointer;
  pw1: PWord;
  rw1: Word;
  r1, y, cb, cr: Byte;
  b, g, r: Integer;
  DestScanLine: pRGB;
  //DestScanLine1: pRGB;
  I1, i2: Integer;
  n1: TDicomImagePalette;
begin
 try
  if PhotometricInterpretation = 'PALETTE COLOR' then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    DestScanLine := p1;
    if (Bits > 8) then
    begin
      pw1 := d1.Data;
      for I1 := 0 to Height - 1 do // Iterate
      begin
        for I2 := 0 to Width - 1 do
        begin
          rw1 := pw1^;
          if IsCustomPalette then
          begin
            n1 := GetPalette(i2, i1);
            if not assigned(n1) then
            begin
              DestScanLine.b := rw1;
              DestScanLine.g := rw1;
              DestScanLine.r := rw1;
            end
            else
            begin
              if ((n1.FRedTable=nil) and
                  (n1.FGreenTable=nil) and
                  (n1.FBlueTable=nil) )
              then
              begin
                DestScanLine.b := rw1;
                DestScanLine.g := rw1;
                DestScanLine.r := rw1;
              end else
              begin
                if n1.FRedTable<>nil then
                  DestScanLine.r := n1.FRedTable[rw1];
                if n1.FGreenTable<>nil then
                  DestScanLine.g := n1.FGreenTable[rw1];
                if n1.FBlueTable<>nil then
                  DestScanLine.b := n1.FBlueTable[rw1];
              end;
            end;
          end
          else
          begin
            DestScanLine.r := rw1;
            DestScanLine.g := rw1;
            DestScanLine.b := rw1;
          end;
          inc(pw1);
          inc(DestScanLine);
        end;
      end; // for
    end
    else
    begin //8bit
      pb1 := d1.Data;
      for I1 := 0 to Height - 1 do // Iterate
      begin
        for I2 := 0 to Width - 1 do
        begin
          r1 := pb1^;
          if IsCustomPalette then
          begin
            n1 := GetPalette(i2, i1);
            if not assigned(n1) then
            begin
              DestScanLine.b := r1;
              DestScanLine.g := r1;
              DestScanLine.r := r1;
            end
            else
            begin
              if ((n1.FRedTable=nil) and
                  (n1.FGreenTable=nil) and
                  (n1.FBlueTable=nil) )
              then
              begin
                DestScanLine.b := r1;
                DestScanLine.g := r1;
                DestScanLine.r := r1;
              end else
              begin
                DestScanLine.r := n1.FRedTable[r1];
                DestScanLine.g := n1.FGreenTable[r1];
                DestScanLine.b := n1.FBlueTable[r1];
              end;
            end;
          end
          else
          begin
            DestScanLine.r := r1;
            DestScanLine.g := r1;
            DestScanLine.b := r1;
          end;
          inc(pb1);
          inc(DestScanLine);
        end;
      end; // for
    end;
    //    d1.FPhotometricInterpretation1 := 'RGB';
    FreeMem(d1.FImageData);
    d1.FImageData := p1;
    d1.FLen := FWidth * FHeight * 3;
  end
  else
    if (PhotometricInterpretation = 'YBR_FULL') then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    DestScanLine := p1;
    if self.PlanarConfiguration = 1 then
    begin
      pbr := p1;
      pbg := pbr;
      inc(pbg, Height * Width);
      pbb := pbg;
      inc(pbb, Height * Width);

      pby := d1.Data;
      pbcb := pby;
      inc(pbcb, Height * Width);
      pbcr := pbcb;
      inc(pbcr, Height * Width);
    end
    else
      pycbcr1 := d1.Data;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if self.PlanarConfiguration = 1 then
        begin
          y := pby^;
          cb := pbcb^;
          cr := pbcr^;
          pbr^ := Trunc(Y + (1.402 * CR) - 179.448);
          pbg^ := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          pbb^ := Trunc(Y + (1.772 * CB) - 226.8);
          inc(pbr);
          inc(pbg);
          inc(pbb);
          inc(pby);
          inc(pbcb);
          inc(pbcr);
        end
        else
        begin
          y := pycbcr1^.y;
          cb := pycbcr1^.cb;
          cr := pycbcr1^.cr;
          DestScanLine.r := Trunc(Y + (1.402 * CR) - 179.448);
          DestScanLine.g := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          DestScanLine.b := Trunc(Y + (1.772 * CB) - 226.8);
          inc(DestScanLine);
        end;
        inc(pycbcr1);
      end;
    end;

    //d1.FPhotometricInterpretation1 := 'RGB';
    FreeMem(d1.FImageData);
    d1.FImageData := p1;
    d1.FLen := FWidth * FHeight * 3;
  end
  else
    if PhotometricInterpretation = 'YBR_FULL_422' then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    DestScanLine := p1;
    {

    // get the Y, B and R channels from the original image
    y  = (int) pYBR [0];
    y1 = (int) pYBR [1];
    // the Cb and Cr values are sampled horizontally at half the Y rate
    b = (int) pYBR [2];
    r = (int) pYBR [3];

    // ***** first pixel *****
    // red 1
    *pRGB = (unsigned char) ((1.1685 * y) + (0.0389 * b) + (1.596 * r));
    pRGB++;	// move the ptr to the Green

    // green 1
    *pRGB = (unsigned char) ((1.1685 * y) - (0.401 * b) - (0.813 * r));
    pRGB++;	// move the ptr to the Blue

    // blue 1
    *pRGB = (unsigned char) ((1.1685 * y) + (2.024 * b));
    pRGB++;	// move the ptr to the next Red

    // ***** second pixel *****
    // red 2
    *pRGB = (unsigned char) ((1.1685 * y1) + (0.0389 * b) + (1.596 * r));
    pRGB++;	// move the ptr to the Green

    // green 2
    *pRGB = (unsigned char) ((1.1685 * y1) - (0.401 * b) - (0.813 * r));
    pRGB++;	// move the ptr to the Blue

    // blue 2
    *pRGB = (unsigned char) ((1.1685 * y1) + (2.024 * b));
    pRGB++;	// move the ptr to the next Red

    // the Cb and Cr values are sampled horizontally at half the Y rate
    pYBR += 4;

  }
    pycbcr4221 := d1.Data;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if (i2 mod 2) = 0 then
        begin
          y := pycbcr4221^.y;
          cb := pycbcr4221^.cb;
          cr := pycbcr4221^.cr;
          b := trunc((1.1685 * y) + (2.024 * cb)); //r
          r := trunc((1.1685 * y) + (0.0389 * cb) + (1.596 * cr)); //g
          g := trunc((1.1685 * y) - (0.401 * cb) - (0.813 * cr)); //b
        end
        else
        begin
          y := pycbcr4221^.y1;
          cb := pycbcr4221^.cb;
          cr := pycbcr4221^.cr;
          b := trunc((1.1685 * y) + (2.024 * (cb)));
          r := trunc((1.1685 * y) + (0.0389 * (cb)) + (1.596 * (cr)));
          g := trunc((1.1685 * y) - (0.401 * (cb)) - (0.813 * (cr)));
          inc(pycbcr4221);
        end;
        if FPlanarConfiguration = 1 then
        begin
          DestScanLine.r := b;
          DestScanLine.g := g;
          DestScanLine.b := r;
        end
        else
        begin
          DestScanLine.r := r;
          DestScanLine.g := g;
          DestScanLine.b := b;
        end;
        inc(DestScanLine);
      end;
    end;
    //d1.FPhotometricInterpretation1 := 'RGB';
    FreeMem(d1.FImageData);
    d1.FImageData := p1;
    d1.FLen := FWidth * FHeight * 3;
  end
  else
    if PhotometricInterpretation = 'YBR_PARTIAL_422' then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    DestScanLine := p1;
    {Y = + .2568R + .5041G + .0979B + 16
    CB = - .1482R - .2910G + .4392B + 128
    CR = + .4392R - .3678G - .0714B + 128}

    {Y = 0.257RЎд + 0.504GЎд + 0.098BЎд + 16
    Cb = -0.148RЎд - 0.291GЎд + 0.439BЎд + 128
    Cr = 0.439RЎд - 0.368GЎд - 0.071BЎд + 128

    RЎд = 1.164(Y - 16) + 1.596(Cr - 128)
    GЎд = 1.164(Y - 16) - 0.813(Cr - 128) - 0.392(Cb - 128)
    BЎд = 1.164(Y - 16) + 2.017(Cb - 128) }
    {R :=trunc( 1.164*(Y - 16) + 1.596*(Cr - 128));
    G := trunc(1.164*(Y - 16) - 0.813*(Cr - 128) - 0.392*(Cb - 128));
    B :=trunc(1.164*(Y - 16) + 2.017*(Cb - 128));
    }

    if self.PlanarConfiguration = 1 then
    begin
      pbr := p1;
      pbg := pbr;
      inc(pbg, Height * Width);
      pbb := pbg;
      inc(pbb, Height * Width);

      pby := d1.Data;
      pbcb := pby;
      inc(pbcb, Height * Width);
      pbcr := pbcb;
      inc(pbcr, Height * Width);
    end
    else
      pycbcr1 := d1.Data;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if self.PlanarConfiguration = 1 then
        begin
          y := pby^;
          cb := pbcb^;
          cr := pbcr^;
          pbr^ := Trunc(Y + (1.402 * CR) - 179.448);
          pbg^ := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          pbb^ := Trunc(Y + (1.772 * CB) - 226.8);
          inc(pbr);
          inc(pbg);
          inc(pbb);
          inc(pby);
          inc(pbcb);
          inc(pbcr);
        end
        else
        begin
          y := pycbcr1^.y;
          cb := pycbcr1^.cb;
          cr := pycbcr1^.cr;
          DestScanLine.r := Trunc(Y + (1.402 * CR) - 179.448);
          DestScanLine.g := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          DestScanLine.b := Trunc(Y + (1.772 * CB) - 226.8);
          inc(DestScanLine);
        end;
        inc(pycbcr1);
      end;
    end;

    //d1.FPhotometricInterpretation1 := 'RGB';
    FreeMem(d1.FImageData);
    d1.FImageData := p1;
    d1.FLen := FWidth * FHeight * 3;
  end
  else
    if PhotometricInterpretation = 'YBR_ICT' then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    DestScanLine := p1;
    {Y = + .29900R + .58700G + .11400B
    CB = - .16875R - .33126G + .50000B
    CR = + .50000R - .41869G - .08131B}

    if self.PlanarConfiguration = 1 then
    begin
      pbr := p1;
      pbg := pbr;
      inc(pbg, Height * Width);
      pbb := pbg;
      inc(pbb, Height * Width);

      pby := d1.Data;
      pbcb := pby;
      inc(pbcb, Height * Width);
      pbcr := pbcb;
      inc(pbcr, Height * Width);
    end
    else
      pycbcr1 := d1.Data;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if self.PlanarConfiguration = 1 then
        begin
          y := pby^;
          cb := pbcb^;
          cr := pbcr^;
          pbr^ := Trunc(Y + (1.402 * CR) - 179.448);
          pbg^ := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          pbb^ := Trunc(Y + (1.772 * CB) - 226.8);
          inc(pbr);
          inc(pbg);
          inc(pbb);
          inc(pby);
          inc(pbcb);
          inc(pbcr);
        end
        else
        begin
          y := pycbcr1^.y;
          cb := pycbcr1^.cb;
          cr := pycbcr1^.cr;
          DestScanLine.r := Trunc(Y + (1.402 * CR) - 179.448);
          DestScanLine.g := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          DestScanLine.b := Trunc(Y + (1.772 * CB) - 226.8);
          inc(DestScanLine);
        end;
        inc(pycbcr1);
      end;
    end;

    //d1.FPhotometricInterpretation1 := 'RGB';
    FreeMem(d1.FImageData);
    d1.FImageData := p1;
    d1.FLen := FWidth * FHeight * 3;
  end
  else
    if PhotometricInterpretation = 'YBR_RCT' then
  begin
    d1.fColorSpaceIsConverted := true;
    GetMem(p1, Width * height * 3);
    DestScanLine := p1;
    {Y = (R + 2G +B) / 4 (Note: ?.. mean floor)
    CB = B - G
    CR = R - G
    G = Y -(CR + CB) / 4
    R = CR + G
    B = CB + G}

    if self.PlanarConfiguration = 1 then
    begin
      pbr := p1;
      pbg := pbr;
      inc(pbg, Height * Width);
      pbb := pbg;
      inc(pbb, Height * Width);

      pby := d1.Data;
      pbcb := pby;
      inc(pbcb, Height * Width);
      pbcr := pbcb;
      inc(pbcr, Height * Width);
    end
    else
      pycbcr1 := d1.Data;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      for I2 := 0 to Width - 1 do
      begin
        if self.PlanarConfiguration = 1 then
        begin
          y := pby^;
          cb := pbcb^;
          cr := pbcr^;
          pbr^ := Trunc(Y + (1.402 * CR) - 179.448);
          pbg^ := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          pbb^ := Trunc(Y + (1.772 * CB) - 226.8);
          inc(pbr);
          inc(pbg);
          inc(pbb);
          inc(pby);
          inc(pbcb);
          inc(pbcr);
        end
        else
        begin
          y := pycbcr1^.y;
          cb := pycbcr1^.cb;
          cr := pycbcr1^.cr;
          DestScanLine.r := Trunc(Y + (1.402 * CR) - 179.448);
          DestScanLine.g := Trunc(Y - (0.344 * CB) - (0.714 * CR) + 135.45);
          DestScanLine.b := Trunc(Y + (1.772 * CB) - 226.8);
          inc(DestScanLine);
        end;
        inc(pycbcr1);
      end;
    end;

    //d1.FPhotometricInterpretation1 := 'RGB';
    FreeMem(d1.FImageData);
    d1.FImageData := p1;
    d1.FLen := FWidth * FHeight * 3;
  end;
 except
 end;
end;

procedure TDicomImage.SetMergeMode(const Value: Boolean);
begin
  fModify := true;
  if Value then
  begin
    if assigned(fMergeDataset) and (fMergeFactor > 0) then
      fMergeMode := true;
  end
  else
    fMergeMode := false;
end;

procedure TDicomImage.SetMergeFactor(const Value: Integer);
begin
  if (Value > 0) and (Value <= 100) then
  begin
    fModify := true;
    fMergeFactor := Value;
  end;
end;

procedure TDicomAttributes.DoNewAttribute(Sender: TObject;
  AAttribute: TDicomAttribute; APosition: Integer);
begin
  if assigned(fOnReadAttribute) then
    fOnReadAttribute(self, AAttribute, APosition);
end;

procedure TDicomDataset.DoNewAttribute(Sender: TObject;
  AAttribute: TDicomAttribute; APosition: Integer);
begin
  if assigned(fOnReadAttribute) then
    fOnReadAttribute(self, AAttribute, APosition);
end;

procedure TDicomStream.SetUseUndefineLength(const Value: Boolean);
begin
  FUseUndefineLength := Value;
end;

procedure TDicomDataset.ResaveToStream;
begin
  if (FImageStream <> nil) and (FImageFilename <> '') then
  begin
    FImageStream.Free;
    FImageStream := TFileStream.Create(FImageFilename, fmCreate);
    if Attributes.ImageData.Bits <= 8 then
      SaveToStream(FImageStream, true, JPEGBaseline, 100, TRUE)
        {$IFDEF ECLZLIBTransferSyntax}
    else
      SaveToStream(FImageStream, true, zlibFastestTransferSyntax, 100, TRUE);
    {$ENDIF}
    //SetStreamAndFileName(FImageStream, str1, DeleteImageFile1);
  end;
end;

procedure TDicomDatasets.ResaveToStream;
var
  i: integer;
begin
  for i := 0 to FDatasetList.Count - 1 do
  begin
    TDicomDataset(FDatasetList[i]).ResaveToStream;
  end;
end;

procedure TDicomDataset.DeleteStream;
begin
  if (FImageStream <> nil) and (FImageFilename <> '') then
  begin
    Attributes.ImageData.ReloadDataFromStream;

    FImageStream.Free;
    FImageStream := nil;
    DeleteFile(FImageFilename);
    FImageFilename := '';
  end;
end;

procedure TDicomDatasets.SetOnlyViewMultiSelected1(const Value: Boolean);
var
  i: integer;
begin
  for i := 0 to FDatasetList.Count - 1 do
    TDicomDataset(FDatasetList[i]).Attributes.ImageData.fOnlyViewMultiSelected1 := Value;
  fOnlyViewMultiSelected1 := Value;
end;

procedure TDicomDatasets.SetOnlyViewMultiSelected2(const Value: Boolean);
var
  i: integer;
begin
  for i := 0 to FDatasetList.Count - 1 do
    TDicomDataset(FDatasetList[i]).Attributes.ImageData.fOnlyViewMultiSelected2 := Value;
  fOnlyViewMultiSelected2 := Value;
end;

procedure TDicomDatasets.SetOnlyViewMultiSelected3(const Value: Boolean);
var
  i: integer;
begin
  for i := 0 to FDatasetList.Count - 1 do
    TDicomDataset(FDatasetList[i]).Attributes.ImageData.fOnlyViewMultiSelected3 := Value;
  fOnlyViewMultiSelected3 := Value;
end;

procedure TDicomDatasets.SetOnlyViewMultiSelected4(const Value: Boolean);
var
  i: integer;
begin
  for i := 0 to FDatasetList.Count - 1 do
    TDicomDataset(FDatasetList[i]).Attributes.ImageData.fOnlyViewMultiSelected4 := Value;
  fOnlyViewMultiSelected4 := Value;
end;

function TDicomImage.GetCurrentFrame: Integer;
begin
  try
    Result := fCurrentFrame;
  except
    Result := 0;
  end;
end;

function TDicomImage.GetFrameCount: Integer;
var
  k: Integer;
begin
  Result := 0;
  try            
    if Assigned(FImageArray) then
    begin
      if (FImageArray.Count > 1) and fOnlyViewMultiSelected2 then
      begin
        Result := 0;
        for k := 0 to FImageArray.Count - 1 do
        begin
          if TDicomImageData(FImageArray[FBaseFrameIndex + k]).Selected then
          begin
            inc(Result);
          end;
        end
      end
      else
        Result := fFrameCount;
    end else
      Result := 0;
  except
    on E:Exception do
    begin
    //  ShowMessage(E.Message);
      Result := 0;
    end;
  end;

end;

procedure TDicomImage.SetCurrentFrame(const Value: Integer);
begin
  if fCurrentFrame <> Value then
  begin
    FModify := true;
    fCurrentFrame := Value;
  end;
end;

procedure TDicomImage.SetFrameCount(const Value: Integer);
begin
  fFrameCount := Value;
end;

function TDicomAttributes.GetMultiSelected1: Boolean;
begin
  Result := fMultiSelected1; // or (ImageData.FrameCount > 1);
end;

function TDicomAttributes.GetMultiSelected2: Boolean;
begin
  Result := (assigned(ImageData)) and (fMultiSelected2 or (ImageData.FrameCount > 1));
end;

function TDicomAttributes.GetMultiSelected3: Boolean;
begin
  Result := fMultiSelected3; // or (ImageData.FrameCount > 1);
end;

function TDicomAttributes.GetMultiSelected4: Boolean;
begin
  Result := fMultiSelected4; // or (ImageData.FrameCount > 1);
end;

procedure TDicomDrawObject.SetRulerUnit(const Value: TRulerUnitType);
begin
  fRulerUnit := Value;
  if fRulerUnit = ruCentimeter then
  begin
    fRulerUnitString := 'CM';
  end
  else
  begin
    fRulerUnitString := 'MM';
  end;
end;

procedure TDicomImage.SetRulerUnit(const Value: TRulerUnitType);
var
  i: Integer;
begin
  fRulerUnit := Value;
  for i := 0 to FDrawObjects.GetCount - 1 do
  begin
    FDrawObjects.Items[i].RulerUnit := Value;
  end;
end;

procedure TDicomDrawObject.SetFont(const Value: TFont);
begin
  fFont.Assign(Value);
end;

procedure TDicomImage.SetFont(const Value: TFont);
begin
  fFont.Assign(Value);
end;

procedure TDicomImage.SetPostFilter(const Value: Integer);
begin
  if FPostFilter <> Value then
  begin
    fModify := true;
    FPostFilter := Value;
  end;
end;

procedure TDicomDrawObject.SetFixScale(const Value: Boolean);
begin
  FFixScale := Value;
end;

procedure TDicomDrawObject.SetFixScaleValue(const Value: Double);
begin
  FFixScaleValue := Value;
end;

procedure TDicomImage.SavePresentationSate;
var
  das1: TDicomAttributes;
  da1: TDicomAttribute;
begin
  da1 := Attributes.Add($2813, $2000);
  das1 := CreatePresentationStateEx;
  da1.AddData(das1);
end;

procedure TDicomImage.ApplyPresentationSate;
var
  das1: TDicomAttributes;
  da1: TDicomAttribute;
begin
  da1 := Attributes.Item[$2813, $2000];
  if assigned(da1) and (da1.GetCount > 0) then
  begin
    das1 := da1.GetAttributes(0);
    SetPresentationSate(TDicomDataset.Create(das1));
  end;
end;

procedure TDicomImage.ClearPalette;
var
  i: Integer;
begin
  for I := 0 to fCustomPalette.Count - 1 do // Iterate
  begin
    TDicomImagePalette(fCustomPalette[i]).Free;
  end;
  fCustomPalette.Clear;
end;

function TDicomImage.GetPalette(x, y: Integer): TDicomImagePalette;
  function IsInRect(ARect: TRect): Boolean;
  begin
    Result := (ARect.Right = ARect.Left) or (ARect.Top = ARect.Bottom) or
      (((x >= ARect.Left) and (x <= ARect.Right)) and ((y >= ARect.Top) and (y <= ARect.Bottom)));
  end;
var
  n1: TDicomImagePalette;
  i: Integer;
begin
  Result := nil;
  if fCustomPalette.Count > 0 then
  begin
    for i := fCustomPalette.Count - 1 downto 0 do
    begin
      n1 := TDicomImagePalette(fCustomPalette[i]);
      if IsInRect(n1.fRect) then
      begin
        Result := n1;
        exit;
      end;
    end;
  end;
end;

function TDicomImage.GetIsCustomPalette: Boolean;
begin
  Result := fCustomPalette.Count > 0;
end;

function SortStructLine2D(Item1, Item2: Pointer): Integer;
var
  p0, p1: PStructLine2D;
  k1, k2: Double;
begin
  p0 := PStructLine2D(Item1);
  p1 := PStructLine2D(Item2);
  k1 := p0.P0.x;
  k2 := p1.P0.x;
  if k1 > k2 then
  begin
    k1 := p0.P0.y;
    k2 := p1.P0.y;
    if k1 > k2 then
      Result := 1
    else
      if k1 < k2 then
      Result := -1
    else
      Result := 0;
  end
  else
    if k1 < k2 then
    Result := -1
  else
    Result := 0;
end;

procedure TDicomDrawObject.SetPloyID(const Value: Integer);
begin
  FPloyID := Value;
end;

{ Filter function for nearest filtering. Also known as box filter.}

function FilterNearest(Value: Single): Single;
begin
  if (Value > -0.5) and (Value <= 0.5) then
    Result := 1
  else
    Result := 0;
end;

{ Filter function for linear filtering. Also known as triangle or Bartlett filter.}

function FilterLinear(Value: Single): Single;
begin
  if Value < 0.0 then
    Value := -Value;
  if Value < 1.0 then
    Result := 1.0 - Value
  else
    Result := 0.0;
end;

{ Cosine filter.}

function FilterCosine(Value: Single): Single;
begin
  Result := 0;
  if Abs(Value) < 1 then
    Result := (Cos(Value * Pi) + 1) / 2;
end;

{ f(t) = 2|t|^3 - 3|t|^2 + 1, -1 <= t <= 1 }

function FilterHermite(Value: Single): Single;
begin
  if Value < 0.0 then
    Value := -Value;
  if Value < 1 then
    Result := (2 * Value - 3) * Sqr(Value) + 1
  else
    Result := 0;
end;

{ Quadratic filter. Also known as Bell.}

function FilterQuadratic(Value: Single): Single;
begin
  if Value < 0.0 then
    Value := -Value;
  if Value < 0.5 then
    Result := 0.75 - Sqr(Value)
  else
    if Value < 1.5 then
  begin
    Value := Value - 1.5;
    Result := 0.5 * Sqr(Value);
  end
  else
    Result := 0.0;
end;

{ Gaussian filter.}

function FilterGaussian(Value: Single): Single;
begin
  Result := Exp(-2.0 * Sqr(Value)) * Sqrt(2.0 / Pi);
end;

{ 4th order (cubic) b-spline filter.}

function FilterSpline(Value: Single): Single;
var
  Temp: Single;
begin
  if Value < 0.0 then
    Value := -Value;
  if Value < 1.0 then
  begin
    Temp := Sqr(Value);
    Result := 0.5 * Temp * Value - Temp + 2.0 / 3.0;
  end
  else
    if Value < 2.0 then
  begin
    Value := 2.0 - Value;
    Result := Sqr(Value) * Value / 6.0;
  end
  else
    Result := 0.0;
end;

{ Lanczos-windowed sinc filter.}

function FilterLanczos(Value: Single): Single;

  function SinC(Value: Single): Single;
  begin
    if Value <> 0.0 then
    begin
      Value := Value * Pi;
      Result := Sin(Value) / Value;
    end
    else
      Result := 1.0;
  end;

begin
  if Value < 0.0 then
    Value := -Value;
  if Value < 3.0 then
    Result := SinC(Value) * SinC(Value / 3.0)
  else
    Result := 0.0;
end;

{ Micthell cubic filter.}

function FilterMitchell(Value: Single): Single;
const
  B = 1.0 / 3.0;
  C = 1.0 / 3.0;
var
  Temp: Single;
begin
  if Value < 0.0 then
    Value := -Value;
  Temp := Sqr(Value);
  if Value < 1.0 then
  begin
    Value := (((12.0 - 9.0 * B - 6.0 * C) * (Value * Temp)) +
      ((-18.0 + 12.0 * B + 6.0 * C) * Temp) +
      (6.0 - 2.0 * B));
    Result := Value / 6.0;
  end
  else
    if Value < 2.0 then
  begin
    Value := (((-B - 6.0 * C) * (Value * Temp)) +
      ((6.0 * B + 30.0 * C) * Temp) +
      ((-12.0 * B - 48.0 * C) * Value) +
      (8.0 * B + 24.0 * C));
    Result := Value / 6.0;
  end
  else
    Result := 0.0;
end;

{ CatmullRom spline filter.}

function FilterCatmullRom(Value: Single): Single;
begin
  if Value < 0.0 then
    Value := -Value;
  if Value < 1.0 then
    Result := 0.5 * (2.0 + Sqr(Value) * (-5.0 + 3.0 * Value))
  else
    if Value < 2.0 then
    Result := 0.5 * (4.0 + Value * (-8.0 + Value * (5.0 - Value)))
  else
    Result := 0.0;
end;

const
  // Some built-in filter functions adn their default radii
  FilterFunctions: array[TSamplingFilter] of TFilterFunction = (
    FilterNearest, FilterLinear, FilterCosine, FilterHermite, FilterQuadratic,
    FilterGaussian, FilterSpline, FilterLanczos, FilterMitchell, FilterCatmullRom);
  FilterRadii: array[TSamplingFilter] of Single = (
    1.0, 1.0, 1.0, 1.0, 1.5,
    1.25, 2.0, 3.0, 2.0, 2.0);

procedure StretchResample(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TSamplingFilter; WrapEdges: Boolean);
begin
  // Calls the other function with filter function and radius defined by Filter
  StretchResample(SrcImage, SrcX, SrcY, SrcWidth, SrcHeight, DstImage, DstX, DstY,
    DstWidth, DstHeight, FilterFunctions[Filter], FilterRadii[Filter]);
end;

procedure StretchResampleFloat(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TSamplingFilter; WrapEdges: Boolean);
begin
  // Calls the other function with filter function and radius defined by Filter
  StretchResampleFloat(SrcImage, SrcX, SrcY, SrcWidth, SrcHeight, DstImage, DstX, DstY,
    DstWidth, DstHeight, FilterFunctions[Filter], FilterRadii[Filter]);
end;

procedure StretchResampleWord(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TSamplingFilter; WrapEdges: Boolean);
begin
  // Calls the other function with filter function and radius defined by Filter
  StretchResampleWord(SrcImage, SrcX, SrcY, SrcWidth, SrcHeight, DstImage, DstX, DstY,
    DstWidth, DstHeight, FilterFunctions[Filter], FilterRadii[Filter]);
end;

{ The following resampling code is modified and extended code from Graphics32
  library by Alex A. Denisov.}
type
  TPointRec = record
    Pos: LongInt;
    Weight: Single;
  end;
  TCluster = array of TPointRec;
  TMappingTable = array of TCluster;

var
  FullEdge: Boolean = True;

function ClampInt(Number: LongInt; Min, Max: LongInt): LongInt;
begin
  Result := Number;
  if Result < Min then
    Result := Min
  else
    if Result > Max then
    Result := Max;
end;

function BuildMappingTable(DstLow, DstHigh, SrcLow, SrcHigh, SrcImageWidth: LongInt;
  Filter: TFilterFunction; Radius: Single; WrapEdges: Boolean): TMappingTable;
var
  I, J, K, N: LongInt;
  Left, Right, SrcWidth, DstWidth: LongInt;
  Weight, Scale, Center, Count: Single;
begin
  Result := nil;
  K := 0;
  SrcWidth := SrcHigh - SrcLow;
  DstWidth := DstHigh - DstLow;

  // Check some special cases
  if SrcWidth = 1 then
  begin
    SetLength(Result, DstWidth);
    for I := 0 to DstWidth - 1 do
    begin
      SetLength(Result[I], 1);
      Result[I][0].Pos := 0;
      Result[I][0].Weight := 1.0;
    end;
    Exit;
  end
  else
    if (SrcWidth = 0) or (DstWidth = 0) then
    Exit;

  if FullEdge then
    Scale := DstWidth / SrcWidth
  else
    Scale := (DstWidth - 1) / (SrcWidth - 1);

  SetLength(Result, DstWidth);

  // Pre-calculate filter contributions for a row or column
  if Scale = 0.0 then
  begin
    Assert(Length(Result) = 1);
    SetLength(Result[0], 1);
    Result[0][0].Pos := (SrcLow + SrcHigh) div 2;
    Result[0][0].Weight := 1.0;
  end
  else
    if Scale < 1.0 then
  begin
    // Sub-sampling - scales from bigger to smaller
    Radius := Radius / Scale;
    for I := 0 to DstWidth - 1 do
    begin
      if FullEdge then
        Center := SrcLow - 0.5 + (I + 0.5) / Scale
      else
        Center := SrcLow + I / Scale;
      Left := Floor(Center - Radius);
      Right := Ceil(Center + Radius);
      Count := -1.0;
      for J := Left to Right do
      begin
        Weight := Filter((Center - J) * Scale) * Scale;
        if Weight <> 0.0 then
        begin
          Count := Count + Weight;
          K := Length(Result[I]);
          SetLength(Result[I], K + 1);
          Result[I][K].Pos := ClampInt(J, SrcLow, SrcHigh - 1);
          Result[I][K].Weight := Weight;
        end;
      end;
      if Length(Result[I]) = 0 then
      begin
        SetLength(Result[I], 1);
        Result[I][0].Pos := Floor(Center);
        Result[I][0].Weight := 1.0;
      end
      else
        if Count <> 0.0 then
        Result[I][K div 2].Weight := Result[I][K div 2].Weight - Count;
    end;
  end
  else // if Scale > 1.0 then
  begin
    // Super-sampling - scales from smaller to bigger
    Scale := 1.0 / Scale;
    for I := 0 to DstWidth - 1 do
    begin
      if FullEdge then
        Center := SrcLow - 0.5 + (I + 0.5) * Scale
      else
        Center := SrcLow + I * Scale;
      Left := Floor(Center - Radius);
      Right := Ceil(Center + Radius);
      Count := -1.0;
      for J := Left to Right do
      begin
        Weight := Filter(Center - J);
        if Weight <> 0.0 then
        begin
          Count := Count + Weight;
          K := Length(Result[I]);
          SetLength(Result[I], K + 1);

          if WrapEdges then
          begin
            if J < 0 then
              N := SrcImageWidth + J
            else
              if J >= SrcImageWidth then
              N := J - SrcImageWidth
            else
              N := ClampInt(J, SrcLow, SrcHigh - 1);
          end
          else
            N := ClampInt(J, SrcLow, SrcHigh - 1);

          Result[I][K].Pos := N;
          Result[I][K].Weight := Weight;
        end;
      end;
      if Count <> 0.0 then
        Result[I][K div 2].Weight := Result[I][K div 2].Weight - Count;
    end;
  end;
end;

procedure StretchResample(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TFilterFunction; Radius: Single; WrapEdges: Boolean);
const
  Channel8BitMax: Single = 255.0;
var
  MapX, MapY: TMappingTable;
  I, J, X, Y: LongInt;
  XMinimum, XMaximum: LongInt;
  LineBuffer: array of Double;
  ClusterX, ClusterY: TCluster;
  Weight, AccumA: Double;
  SrcFloat: Single;
 { ChannelValueMax,}// InvChannelValueMax: Single;

  DstLine: SmallP;
  SrcLine: SmallP;

  procedure FindExtremes(const Map: TMappingTable; var MinPos, MaxPos: LongInt);
  var
    I, J: LongInt;
  begin
    if Length(Map) > 0 then
    begin
      MinPos := Map[0][0].Pos;
      MaxPos := MinPos;
      for I := 0 to Length(Map) - 1 do
        for J := 0 to Length(Map[I]) - 1 do
        begin
          if MinPos > Map[I][J].Pos then
            MinPos := Map[I][J].Pos;
          if MaxPos < Map[I][J].Pos then
            MaxPos := Map[I][J].Pos;
        end;
    end;
  end;

begin
  DstLine := DstImage;
  SrcLine := SrcImage;

  // Create horizontal and vertical mapping tables
  MapX := BuildMappingTable(DstX, DstX + DstWidth, SrcX, SrcX + SrcWidth,
    SrcWidth, Filter, Radius, WrapEdges);
  MapY := BuildMappingTable(DstY, DstY + DstHeight, SrcY, SrcY + SrcHeight,
    SrcHeight, Filter, Radius, WrapEdges);

  if (MapX = nil) or (MapY = nil) then
    Exit;

  ClusterX := nil;
  ClusterY := nil;

  try
    // Find min and max X coords of pixels that will contribute to target image
    FindExtremes(MapX, XMinimum, XMaximum);
    SetLength(LineBuffer, XMaximum - XMinimum + 1);

    // Following code works for the rest of data formats
    for J := 0 to DstHeight - 1 do
    begin
      // First for each pixel in the current line sample vertically
      // and store results in LineBuffer. Then sample horizontally
      // using values in LineBuffer.
      ClusterY := MapY[J];
      for X := XMinimum to XMaximum do
      begin
        // Clear accumulators
        AccumA := 0.0;
        // For each pixel in line compute weighted sum of pixels
        // in source column that will contribute to this pixel
        for Y := 0 to Length(ClusterY) - 1 do
        begin
          // Accumulate this pixel's weighted value
          Weight := ClusterY[Y].Weight;
          SrcFloat := SrcLine[(ClusterY[Y].Pos * SrcWidth + X)];
          AccumA := AccumA + SrcFloat * Weight;
        end;
        // Store accumulated value for this pixel in buffer
        LineBuffer[X - XMinimum] := AccumA;
      end;

      // Now compute final colors for targte pixels in the current row
      // by sampling horizontally
      for I := 0 to DstWidth - 1 do
      begin
        ClusterX := MapX[I];
        // Clear accumulator
        AccumA := 0.0;
        // Compute weighted sum of values (which are already
        // computed weighted sums of pixels in source columns stored in LineBuffer)
        // that will contribute to the current target pixel
        for X := 0 to Length(ClusterX) - 1 do
        begin
          Weight := ClusterX[X].Weight;
          AccumA := AccumA + LineBuffer[ClusterX[X].Pos - XMinimum] * Weight;
        end;

        // Now compute final color to be written to dest image

        DstLine[((J + DstY) * DstWidth + DstX + I)] := Round(AccumA);
      end;
    end;

  finally
    MapX := nil;
    MapY := nil;
  end;
end;

procedure StretchResampleWord(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TFilterFunction; Radius: Single; WrapEdges: Boolean);
const
  Channel8BitMax: Single = 255.0;
var
  MapX, MapY: TMappingTable;
  I, J, X, Y: LongInt;
  XMinimum, XMaximum: LongInt;
  LineBuffer: array of Double;
  ClusterX, ClusterY: TCluster;
  Weight, AccumA: Double;
  SrcFloat: Single;
  {ChannelValueMax,} InvChannelValueMax: Single;

  DstLine: WordP;
  SrcLine: WordP;

  procedure FindExtremes(const Map: TMappingTable; var MinPos, MaxPos: LongInt);
  var
    I, J: LongInt;
  begin
    if Length(Map) > 0 then
    begin
      MinPos := Map[0][0].Pos;
      MaxPos := MinPos;
      for I := 0 to Length(Map) - 1 do
        for J := 0 to Length(Map[I]) - 1 do
        begin
          if MinPos > Map[I][J].Pos then
            MinPos := Map[I][J].Pos;
          if MaxPos < Map[I][J].Pos then
            MaxPos := Map[I][J].Pos;
        end;
    end;
  end;

begin
  DstLine := DstImage;
  SrcLine := SrcImage;

  // Create horizontal and vertical mapping tables
  MapX := BuildMappingTable(DstX, DstX + DstWidth, SrcX, SrcX + SrcWidth,
    SrcWidth, Filter, Radius, WrapEdges);
  MapY := BuildMappingTable(DstY, DstY + DstHeight, SrcY, SrcY + SrcHeight,
    SrcHeight, Filter, Radius, WrapEdges);

  if (MapX = nil) or (MapY = nil) then
    Exit;

  ClusterX := nil;
  ClusterY := nil;

  try
    // Find min and max X coords of pixels that will contribute to target image
    FindExtremes(MapX, XMinimum, XMaximum);
    SetLength(LineBuffer, XMaximum - XMinimum + 1);

    // Following code works for the rest of data formats
    for J := 0 to DstHeight - 1 do
    begin
      // First for each pixel in the current line sample vertically
      // and store results in LineBuffer. Then sample horizontally
      // using values in LineBuffer.
      ClusterY := MapY[J];
      for X := XMinimum to XMaximum do
      begin
        // Clear accumulators
        AccumA := 0.0;
        // For each pixel in line compute weighted sum of pixels
        // in source column that will contribute to this pixel
        for Y := 0 to Length(ClusterY) - 1 do
        begin
          // Accumulate this pixel's weighted value
          Weight := ClusterY[Y].Weight;
          SrcFloat := SrcLine[(ClusterY[Y].Pos * SrcWidth + X)];
          AccumA := AccumA + SrcFloat * Weight;
        end;
        // Store accumulated value for this pixel in buffer
        LineBuffer[X - XMinimum] := AccumA;
      end;

      // Now compute final colors for targte pixels in the current row
      // by sampling horizontally
      for I := 0 to DstWidth - 1 do
      begin
        ClusterX := MapX[I];
        // Clear accumulator
        AccumA := 0.0;
        // Compute weighted sum of values (which are already
        // computed weighted sums of pixels in source columns stored in LineBuffer)
        // that will contribute to the current target pixel
        for X := 0 to Length(ClusterX) - 1 do
        begin
          Weight := ClusterX[X].Weight;
          AccumA := AccumA + LineBuffer[ClusterX[X].Pos - XMinimum] * Weight;
        end;

        // Now compute final color to be written to dest image

        DstLine[((J + DstY) * DstWidth + DstX + I)] := Round(AccumA);
      end;
    end;

  finally
    MapX := nil;
    MapY := nil;
  end;
end;

procedure StretchResampleFloat(const SrcImage: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt; Filter: TFilterFunction; Radius: Single; WrapEdges: Boolean);
const
  Channel8BitMax: Single = 255.0;
var
  MapX, MapY: TMappingTable;
  I, J, X, Y: LongInt;
  XMinimum, XMaximum: LongInt;
  LineBuffer: array of Double;
  ClusterX, ClusterY: TCluster;
  Weight, AccumA: Double;
  SrcFloat: Single;
  {ChannelValueMax,} InvChannelValueMax: Single;

  DstLine: SingleP;
  SrcLine: SingleP;

  procedure FindExtremes(const Map: TMappingTable; var MinPos, MaxPos: LongInt);
  var
    I, J: LongInt;
  begin
    if Length(Map) > 0 then
    begin
      MinPos := Map[0][0].Pos;
      MaxPos := MinPos;
      for I := 0 to Length(Map) - 1 do
        for J := 0 to Length(Map[I]) - 1 do
        begin
          if MinPos > Map[I][J].Pos then
            MinPos := Map[I][J].Pos;
          if MaxPos < Map[I][J].Pos then
            MaxPos := Map[I][J].Pos;
        end;
    end;
  end;

begin
  DstLine := DstImage;
  SrcLine := SrcImage;

  // Create horizontal and vertical mapping tables
  MapX := BuildMappingTable(DstX, DstX + DstWidth, SrcX, SrcX + SrcWidth,
    SrcWidth, Filter, Radius, WrapEdges);
  MapY := BuildMappingTable(DstY, DstY + DstHeight, SrcY, SrcY + SrcHeight,
    SrcHeight, Filter, Radius, WrapEdges);

  if (MapX = nil) or (MapY = nil) then
    Exit;

  ClusterX := nil;
  ClusterY := nil;

  try
    // Find min and max X coords of pixels that will contribute to target image
    FindExtremes(MapX, XMinimum, XMaximum);
    SetLength(LineBuffer, XMaximum - XMinimum + 1);

    // Following code works for the rest of data formats
    for J := 0 to DstHeight - 1 do
    begin
      // First for each pixel in the current line sample vertically
      // and store results in LineBuffer. Then sample horizontally
      // using values in LineBuffer.
      ClusterY := MapY[J];
      for X := XMinimum to XMaximum do
      begin
        // Clear accumulators
        AccumA := 0.0;
        // For each pixel in line compute weighted sum of pixels
        // in source column that will contribute to this pixel
        for Y := 0 to Length(ClusterY) - 1 do
        begin
          // Accumulate this pixel's weighted value
          Weight := ClusterY[Y].Weight;
          SrcFloat := SrcLine[(ClusterY[Y].Pos * SrcWidth + X)];
          AccumA := AccumA + SrcFloat * Weight;
        end;
        // Store accumulated value for this pixel in buffer
        LineBuffer[X - XMinimum] := AccumA;
      end;

      // Now compute final colors for targte pixels in the current row
      // by sampling horizontally
      for I := 0 to DstWidth - 1 do
      begin
        ClusterX := MapX[I];
        // Clear accumulator
        AccumA := 0.0;
        // Compute weighted sum of values (which are already
        // computed weighted sums of pixels in source columns stored in LineBuffer)
        // that will contribute to the current target pixel
        for X := 0 to Length(ClusterX) - 1 do
        begin
          Weight := ClusterX[X].Weight;
          AccumA := AccumA + LineBuffer[ClusterX[X].Pos - XMinimum] * Weight;
        end;

        // Now compute final color to be written to dest image

        DstLine[((J + DstY) * DstWidth + DstX + I)] := Round(AccumA);
      end;
    end;

  finally
    MapX := nil;
    MapY := nil;
  end;
end;

procedure Stretch3DResample(const SrcImage0, SrcImage1: Pointer; SrcX, SrcY, SrcWidth,
  SrcHeight: LongInt; DstImage: Pointer; DstX, DstY, DstWidth,
  DstHeight: LongInt);
var
  i, j: Integer;
  DstLine: SmallP;
  SrcLine0, SrcLine1: SmallP;
  rh, rw, kh, kw, a, b, g: Single;
  x, y: Integer;
  x1, x2, x3, x4, x5, x6, x7, x8: Integer;
  xx, k1: Single;
begin
  DstLine := DstImage;
  SrcLine0 := SrcImage0;
  SrcLine1 := SrcImage1;
  rh := SrcHeight / DstHeight;
  rw := SrcWidth / DstWidth;
  for y := 0 to DstHeight - 1 do
  begin
    k1 := y * rh;
    i := Trunc(k1);
    b := k1 - i;
    for x := 0 to DstWidth - 1 do
    begin
      k1 := x * rw;
      j := Trunc(k1);
      a := 0.5;
      g := 0.5;

      x1 := SrcLine0[i * SrcWidth + j];
      x2 := SrcLine0[(i + 1) * SrcWidth + j];
      x3 := SrcLine0[i * SrcWidth + j + 1];
      x4 := SrcLine0[(i + 1) * SrcWidth + j + 1];

      x5 := SrcLine1[i * SrcWidth + j];
      x6 := SrcLine1[(i + 1) * SrcWidth + j];
      x7 := SrcLine1[i * SrcWidth + j + 1];
      x8 := SrcLine1[(i + 1) * SrcWidth + j + 1];

      xx := (x8 + x7 + x6 + x5 + x4 + x3 + x2 + x1) / 8 +
        a * (x8 - x7 + x6 - x5 + x4 - x3 + x2 - x1) / 8 +
        b * (x8 + x7 - x6 - x5 + x4 + x3 - x2 - x1) / 8 +
        g * (x8 + x7 + x6 + x5 - x4 - x3 - x2 - x1) / 8 +
        a * b * (x8 - x7 - x6 + x5 + x4 - x3 - x2 + x1) / 8 +
        a * g * (x8 - x7 + x6 - x5 - x4 + x3 - x2 + x1) / 8 +
        b * g * (x8 + x7 - x6 - x5 - x4 - x3 + x2 + x1) / 8 +
        a * b * g * (x8 - x7 - x6 + x5 - x4 + x3 + x2 - x1) / 8;

      DstLine[((Y + DstY) * DstWidth + DstX + X)] := Round(xx);
    end;
  end;
end;

procedure TDicomImage.SwapBigEndian;
var
  pw1: PWord;
  i: Integer;
  w1: Word;
begin
  if Bits > 8 then
  begin
    pw1 := ImageData[AIndex].Data;
    for i := 0 to Width * Height - 1 do
    begin
      w1 := pw1^;
      pw1^ := lo(w1) shl 8 + hi(w1);
      inc(pw1);
    end;
  end;
end;

procedure TDicomDrawObject.CalAverage(var av, sd, ar: double);
  function InCycle(rx1, ry1, rr: Double; x1, y1: Integer): Boolean;
  begin
    Result := sqrt((rx1 - x1) * (rx1 - x1) + (ry1 - y1) * (ry1 - y1)) <= rr;
  end;
var
  d1: TDicomImageData;
  xx1, xx2, yy1, yy2: integer;

  k1, k2: integer;
  n1, n2, w, h: Double;
  ps1: Smallp;
  pw1: Wordp;
  pf1: SingleP;
  px1: ByteP;
  i1: Integer;
  v: Integer;
  zz, zz1: Int64;
  c: Integer;
begin
  av := 0;
  sd := 0;
  ar := 0;
  if assigned(fParent.fOwnImageData.FImageArray) then
  begin
    d1 := fParent.fOwnImageData.GetImagedata(fParent.fOwnImageData.FCurrentFrame);

    case FKind of
      ldmiROI_Cycle:
        begin
          w := abs(X[1] - X[0]) / 2;
          h := abs(Y[1] - Y[0]) / 2;
          n1 := (X[1] + X[0]) / 2;
          n2 := (Y[1] + Y[0]) / 2;
          w := Max(w, h);
          xx1 := round(n1 - w);
          xx2 := round(n1 + w);
          yy1 := round(n2 - w);
          yy2 := round(n2 + w);
          if fParent.fOwnImageData.VerFlip then
          begin
            yy2 := fParent.fOwnImageData.FHeight - round(n2 - w) + 1;
            yy1 := fParent.fOwnImageData.FHeight - round(n2 + w) + 1;
          end;
          if fParent.fOwnImageData.HozFlip then
          begin
            xx2 := fParent.fOwnImageData.FWidth - round(n1 - w) + 1;
            xx1 := fParent.fOwnImageData.FWidth - round(n1 + w) + 1;
          end;
          if (Copy(fParent.fOwnImageData.FPhotometricInterpretation, 1, 4) = 'MONO') then
          begin
            k1 := Min(yy2, yy1);
            k2 := max(yy2, yy1);
            yy1 := k1;
            yy2 := k2;
            k1 := Min(xx2, xx1);
            k2 := max(xx2, xx1);
            xx1 := k1;
            xx2 := k2;
            c := (yy2 - yy1 + 1) * (xx2 - xx1 + 1);
            if c = 0 then
              exit;
            ar := c;
            zz := 0;
            zz1 := 0;
            c := 0;
            if fParent.fOwnImageData.FBits <= 8 then
            begin
              px1 := d1.Data;
              for k1 := yy1 - 1 to yy2 - 1 do
              begin
                i1 := k1 * fParent.fOwnImageData.FWidth;
                for k2 := xx1 to xx2 do
                begin
                  if InCycle(n1, n2, w, k2, k1) then
                  begin
                    v := Trunc(px1[i1 + k2] * fParent.fOwnImageData.FRescaleSlope +
                      fParent.fOwnImageData.FRescaleIntercept);
                    zz := zz + v;
                    zz1 := zz1 + v * v;
                    inc(c);
                  end;
                end;
              end;
            end
            else
            begin //>8 bits
              {.$IFDEF USE_16_TO_FLOAT_BUFFER}
              if fParent.fOwnImageData.FBufferLength = diblFloat then
              begin
                pf1 := d1.Data;
                for k1 := yy1 - 1 to yy2 - 1 do
                begin
                  i1 := k1 * fParent.fOwnImageData.FWidth;
                  for k2 := xx1 to xx2 do
                  begin
                    if InCycle(n1, n2, w, k2, k1) then
                    begin

                      v := Trunc(pf1[i1 + k2]);
                      zz := zz + v;
                      zz1 := zz1 + v * v;
                      inc(c);
                    end;
                  end;
                end;
                {.$ELSE}
              end
              else
              begin

                if fParent.fOwnImageData.PixelRepresentation then
                  //Attributes.getInteger($28, $103) = 0 then
                begin
                  pw1 := d1.Data;
                  for k1 := yy1 - 1 to yy2 - 1 do
                  begin
                    i1 := k1 * fParent.fOwnImageData.FWidth;
                    for k2 := xx1 to xx2 do
                    begin
                      if InCycle(n1, n2, w, k2, k1) then
                      begin
                        if (fParent.fOwnImageData.FPixelPaddingValue <> 0) and (pw1[i1 + k2] >=
                          fParent.fOwnImageData.FPixelPaddingValue) then
                          v := Trunc((fParent.fOwnImageData.FPixelPaddingValue - pw1[i1 + k2]) *
                            fParent.fOwnImageData.FRescaleSlope +
                            fParent.fOwnImageData.FRescaleIntercept)
                        else
                          v := Trunc(pw1[i1 + k2] * fParent.fOwnImageData.FRescaleSlope +
                            fParent.fOwnImageData.FRescaleIntercept);
                        zz := zz + v;
                        zz1 := zz1 + v * v;
                        inc(c);
                      end;
                    end;
                  end;
                end
                else
                begin
                  ps1 := d1.Data;
                  for k1 := yy1 - 1 to yy2 - 1 do
                  begin
                    i1 := k1 * fParent.fOwnImageData.FWidth;
                    for k2 := xx1 to xx2 do
                    begin
                      if InCycle(n1, n2, w, k2, k1) then
                      begin
                        if (fParent.fOwnImageData.FPixelPaddingValue <> 0) and (ps1[i1 + k2] >=
                          fParent.fOwnImageData.FPixelPaddingValue) then
                          v := Trunc((fParent.fOwnImageData.FPixelPaddingValue - ps1[i1 + k2]) *
                            fParent.fOwnImageData.FRescaleSlope +
                            fParent.fOwnImageData.FRescaleIntercept)
                        else
                          v := Trunc(ps1[i1 + k2] * fParent.fOwnImageData.FRescaleSlope +
                            fParent.fOwnImageData.FRescaleIntercept);
                        zz := zz + v;
                        zz1 := zz1 + v * v;
                        inc(c);
                      end;
                    end;
                  end;
                end;
              end; {.$ENDIF}
            end;
            av := (zz / c);
            sd := sqrt(abs((av * av * c - zz1) / c));
          end;

          ar := ar * fParent.fOwnImageData.FPixelSpacingX * fParent.fOwnImageData.FPixelSpacingY;

        end;
      ldmiPolyonV:
        begin

        end;
      ldmiROI_Rect:
        begin
          xx1 := Round(X[0]);
          xx2 := Round(X[1]);
          yy1 := Round(Y[0]);
          yy2 := Round(Y[1]);
          if fParent.fOwnImageData.VerFlip then
          begin
            yy2 := fParent.fOwnImageData.FHeight - Round(Y[0]) + 1;
            yy1 := fParent.fOwnImageData.FHeight - Round(Y[1]) + 1;
          end;
          if fParent.fOwnImageData.HozFlip then
          begin
            xx2 := fParent.fOwnImageData.FWidth - Round(X[0]) + 1;
            xx1 := fParent.fOwnImageData.FWidth - Round(X[1]) + 1;
          end;

          if (Copy(fParent.fOwnImageData.FPhotometricInterpretation, 1, 4) = 'MONO') then
          begin
            k1 := Min(yy2, yy1);
            k2 := max(yy2, yy1);
            yy1 := k1;
            yy2 := k2;
            k1 := Min(xx2, xx1);
            k2 := max(xx2, xx1);
            xx1 := k1;
            xx2 := k2;
            c := (yy2 - yy1 + 1) * (xx2 - xx1 + 1);
            if c = 0 then
              exit;
            ar := c;
            zz := 0;
            zz1 := 0;
            if fParent.fOwnImageData.FBits <= 8 then
            begin
              px1 := d1.Data;
              for k1 := yy1 - 1 to yy2 - 1 do
              begin
                i1 := k1 * fParent.fOwnImageData.FWidth;
                for k2 := xx1 to xx2 do
                begin
                  v := Trunc(px1[i1 + k2] * fParent.fOwnImageData.FRescaleSlope +
                    fParent.fOwnImageData.FRescaleIntercept);
                  zz := zz + v;
                  zz1 := zz1 + v * v;
                end;
              end;
            end
            else
            begin //>8 bits
              {.$IFDEF USE_16_TO_FLOAT_BUFFER}
              if fParent.fOwnImageData.FBufferLength = diblFloat then
              begin
                pf1 := d1.Data;
                for k1 := yy1 - 1 to yy2 - 1 do
                begin
                  i1 := k1 * fParent.fOwnImageData.FWidth;
                  for k2 := xx1 to xx2 do
                  begin
                    if InCycle(n1, n2, w, k2, k1) then
                    begin

                      v := Trunc(pf1[i1 + k2]);
                      zz := zz + v;
                      zz1 := zz1 + v * v;
                      inc(c);
                    end;
                  end;
                end;
                {.$ELSE}
              end
              else
              begin

                if fParent.fOwnImageData.PixelRepresentation then
                  //Attributes.getInteger($28, $103) = 0 then
                begin
                  pw1 := d1.Data;
                  for k1 := yy1 - 1 to yy2 - 1 do
                  begin
                    i1 := k1 * fParent.fOwnImageData.FWidth;
                    for k2 := xx1 to xx2 do
                    begin
                      if (fParent.fOwnImageData.FPixelPaddingValue <> 0) and (pw1[i1 + k2] >=
                        fParent.fOwnImageData.FPixelPaddingValue) then
                        v := Trunc((fParent.fOwnImageData.FPixelPaddingValue - pw1[i1 + k2]) *
                          fParent.fOwnImageData.FRescaleSlope +
                          fParent.fOwnImageData.FRescaleIntercept)
                      else
                        v := Trunc(pw1[i1 + k2] * fParent.fOwnImageData.FRescaleSlope +
                          fParent.fOwnImageData.FRescaleIntercept);
                      zz := zz + v;
                      zz1 := zz1 + v * v;
                    end;
                  end;
                end
                else
                begin
                  ps1 := d1.Data;
                  for k1 := yy1 - 1 to yy2 - 1 do
                  begin
                    i1 := k1 * fParent.fOwnImageData.FWidth;
                    for k2 := xx1 to xx2 do
                    begin
                      if (fParent.fOwnImageData.FPixelPaddingValue <> 0) and (ps1[i1 + k2] >=
                        fParent.fOwnImageData.FPixelPaddingValue) then
                        v := Trunc((fParent.fOwnImageData.FPixelPaddingValue - ps1[i1 + k2]) *
                          fParent.fOwnImageData.FRescaleSlope +
                          fParent.fOwnImageData.FRescaleIntercept)
                      else
                        v := Trunc(ps1[i1 + k2] * fParent.fOwnImageData.FRescaleSlope +
                          fParent.fOwnImageData.FRescaleIntercept);
                      zz := zz + v;
                      zz1 := zz1 + v * v;
                    end;
                  end;
                end;
              end; {.$ENDIF}
            end;
            av := (zz / c);
            sd := sqrt(abs((av * av * c - zz1) / c));
          end;

          ar := ar * fParent.fOwnImageData.FPixelSpacingX * fParent.fOwnImageData.FPixelSpacingY;
        end;
    end; //end of case
  end;
end;

procedure TDicomDataset.SetImageIndex(const Value: Integer);
begin
  FImageIndex := Value;
end;

procedure TDicomDataset.SetInstanceUID(const Value: AnsiString);
begin
  FInstanceUID := Value;
end;

procedure TDicomDataset.SetSeriesNumber(const Value: Integer);
begin
  FSeriesNumber := Value;
end;

procedure TDicomDataset.SetSeriesUID(const Value: AnsiString);
begin
  FSeriesUID := Value;
end;

procedure TDicomDataset.SetStudyUID(const Value: AnsiString);
begin
  FStudyUID := Value;
end;

function TDicomDatasets.GetItemByInstanceUID(Value: AnsiString): TDicomDataset;
begin

end;

procedure TDicomDrawObjects.SetLabelPosition(
  const Value: TDicomDrawObjectLabelPosition);
var
  i: Integer;
  o1: TDicomDrawObject;
begin
  fLabelPosition := Value;
  for i := 0 to FList.Count - 1 do
  begin
    o1 := TDicomDrawObject(FList[i]);
    o1.LabelPosition := Value;
  end;
end;

procedure TDicomDatasets.SetLabelPosition(
  const Value: TDicomDrawObjectLabelPosition);
var
  i: Integer;
begin
  fLabelPosition := Value;
  for i := 0 to GetCount - 1 do
    Item[i].LabelPosition := Value;
end;

procedure TDicomDataset.SetLabelPosition(
  const Value: TDicomDrawObjectLabelPosition);
begin
  fLabelPosition := Value;
  if assigned(Attributes.ImageData) then
    Attributes.ImageData.DrawObjects.LabelPosition := Value;
end;

procedure TDicomDrawObject.SetLabelPosition(
  const Value: TDicomDrawObjectLabelPosition);
begin
  FLabelPosition := Value;
end;

{ TDicomInformationLabel }

constructor TDicomInformationLabel.Create;
begin
  FUID := -1;
  FPosition := 0;
  FOrderID := 0;
  FFormatString := '';
end;

destructor TDicomInformationLabel.Destroy;
begin

  inherited;
end;

function TDicomInformationLabel.GetText(
  AAttributes: TDicomAttributes): AnsiString;
var
  str1, str3: AnsiString;
  i, g1, e1, i1, status: Integer;
  c1: AnsiChar;
  da1: TDicomAttribute;
begin
  Result := '';
  g1 := -1;
  e1 := -1;
  i1 := -1;
  if (assigned(AAttributes)) and (Length(FFormatString) > 0) then
  begin
    status := 0;
    for i := 1 to Length(FFormatString) do
    begin
      c1 := FFormatString[i];
      if c1 = '[' then
      begin
        status := 1;
        str1 := '';
        continue;
      end
      else
        if c1 = ',' then
      begin
        if status = 1 then
        begin
          g1 := StrToInt(Trim(str1));
          str1 := '';
          status := 2;
        end
        else
          if status = 2 then
        begin
          e1 := StrToInt(Trim(str1));
          str1 := '';
          status := 3;
        end;
        continue;
      end
      else
        if c1 = ']' then
      begin
        if status = 2 then
        begin
          e1 := StrToInt(Trim(str1));
        end
        else
          if status = 3 then
        begin
          i1 := StrToInt(Trim(str1));
        end;
        str1 := '';

        str3 := '';
        if (g1 <> -1) and (e1 <> -1) then
        begin
          if i1 = -1 then
          begin
            str3 := AAttributes.GetString(g1, e1);
          end
          else
          begin
            da1 := AAttributes.Item[g1, e1];
            if da1 <> nil then
            begin
              da1.GetAsString(i1)
            end;
          end;

          if str3 = 'ROW' then
            str3 := 'ЎыЎъ'
          else
            if str3 = 'COL' then
            str3 := 'ЎьЎэ';
        end;
        Result := Result + str3;

        status := 0;
        continue;
      end;
      case status of
        0: Result := Result + c1;
        1, 2, 3: str1 := str1 + c1;
      end;
    end;
  end;
end;

procedure TDicomInformationLabel.SetFormatString(const Value: AnsiString);
begin
  FFormatString := Value;
end;

procedure TDicomInformationLabel.SetOrderID(const Value: Integer);
begin
  FOrderID := Value;
end;

procedure TDicomInformationLabel.SetPosition(const Value: Integer);
begin
  FPosition := Value;
end;

function TDicomImage.AddInformationLabel(APosition, AOrderID: Integer;
  AFormatString: AnsiString): TDicomInformationLabel;
var
  v1: TDicomInformationLabel;
begin
  v1 := TDicomInformationLabel.Create;
  v1.Position := APosition;
  v1.OrderID := AOrderID;
  v1.FormatString := AFormatString;
  FInformationLabels.Add(v1);
  fViewModify := true;
  Result := v1;
end;

procedure TDicomImage.ClearInformationLabels;
var
  i: Integer;
begin
  fViewModify := true;
  for I := 0 to FInformationLabels.Count - 1 do // Iterate
  begin
    TDicomInformationLabel(FInformationLabels[i]).Free;
  end;
  FInformationLabels.Clear;
end;

function TDicomImage.GetInfoLabels(index: Integer): TDicomInformationLabel;
begin
  Result := nil;
  if (index < FInformationLabels.Count) and (index >= 0) then
  begin
    Result := TDicomInformationLabel(FInformationLabels[index]);
  end;
end;

function TDicomImage.GetInformationLabelCount: Integer;
begin
  Result := FInformationLabels.Count;
end;

procedure TDicomImage.CopyInformationLabels(Src: TDicomImage);
var
  i: Integer;
  v1, v2: TDicomInformationLabel;
  //  str1: AnsiString;
begin
  for I := 0 to Src.FInformationLabels.Count - 1 do // Iterate
  begin
    v1 := TDicomInformationLabel(Src.FInformationLabels[i]);
    v2 := TDicomInformationLabel.Create;

    v2.FPosition := v1.FPosition;
    v2.FOrderID := v1.FOrderID;
    v2.FFormatString := v1.FFormatString;
    v2.FUID := v1.FUID;
    FInformationLabels.Add(v2);
  end;
end;

procedure TDicomImage.AddDefaultInformationLabels;
var
  str1, str2: AnsiString;
begin
  if FrameCount > 1 then
    AddPredefineInformationLabelsCommon
  else
  begin
    str1 := Attributes.GetString(8, $60);
    str2 := Attributes.GetString(8, $70);
    if str1 = 'MR' then
    begin
      if Copy(Str2, 1, 2) = 'GE' then
        AddPredefineInformationLabelsGEMR
      else
        AddPredefineInformationLabelsSIMR;
    end
    else
      if str1 = 'CT' then
      AddPredefineInformationLabelsSI
    else
      AddPredefineInformationLabelsCommon;
  end;
end;

procedure TDicomImage.AddPredefineInformationLabelsCommon;
begin
  ClearInformationLabels;

  AddInformationLabel(1, 1, '[$10, $10] [$10, $40] [$10, $1010]');

  AddInformationLabel(1, 2, '[$10, $20]');
  AddInformationLabel(1, 3, '[$20, $10]');

  AddInformationLabel(1, 4, '[$8, $20]');
  AddInformationLabel(1, 5, '[$8, $30]');
  AddInformationLabel(1, 6, 'IMA [$20, $13]');
  if Attributes.ImageData.FrameCount > 1 then
    AddInformationLabel(1, 7, 'FRAME ' + IntToStr(Attributes.ImageData.CurrentFrame));

  if Attributes.getInteger($2811, $20D) = 1 then
  begin
    AddInformationLabel(3, 2, '[$18, $15]');
    AddInformationLabel(3, 3, '[$8, $103E]');
  end
  else
  begin
    AddInformationLabel(3, 2, '[$8, $1090]');
    AddInformationLabel(3, 3, '[$18, $1020]');
  end;
end;

procedure TDicomImage.AddPredefineInformationLabelsGE;
begin
  ClearInformationLabels;

  AddInformationLabel(1, 1, '[8, $1090]');
  AddInformationLabel(1, 2, 'Ex: [$20, $10]');
  AddInformationLabel(1, 3, 'Se: [$20, $11]');
  AddInformationLabel(1, 5, 'Im: [$20, $13]');
  AddInformationLabel(1, 6, FormatFloat('DFOV:#.00cm', PixelSpacingX * Width));
  AddInformationLabel(1, 7, '[$18, $1210]');

  AddInformationLabel(3, 2, '[$10, $10]');
  AddInformationLabel(3, 3, '[$10, $40] [$10, $1010] [$10, $20]');
  AddInformationLabel(3, 4, '[8, $20]');

  AddInformationLabel(2, 6, 'kV: [$18, $60]');
  AddInformationLabel(2, 5, 'mA: [$18, $1151]');
  AddInformationLabel(2, 4, '[$18, $50]mm');
  AddInformationLabel(2, 3, 'Tilt:[$18, $1120]');
  AddInformationLabel(2, 2, '[$8, $30]');
end;

procedure TDicomImage.AddPredefineInformationLabelsGEMR;
var
  da1: TDicomAttribute;
begin
  ClearInformationLabels;

  AddInformationLabel(1, 1, '[$8, $1090] [$18, $87] T[$8, $1010]');
  AddInformationLabel(1, 2, 'Ex: [$20, $10]');
  AddInformationLabel(1, 3, 'Se: [$20, $11]');
  AddInformationLabel(1, 4, 'Im: [$20, $13]');
  AddInformationLabel(1, 5, '[$8, $103E]');
  AddInformationLabel(1, 10, 'ET: [$18, $91]');

  AddInformationLabel(3, 2, '[$10, $10]');
  AddInformationLabel(3, 3, '[$10, $40] [$10, $1010] [$10, $20]');
  AddInformationLabel(3, 5, '[$8, $21]');
  AddInformationLabel(3, 6, '[$8, $31]');
  AddInformationLabel(3, 7, 'Mag=[$18, $21]');

  AddInformationLabel(2, 11, '[$19, $109C]'); //$18, $20));
  AddInformationLabel(2, 10, 'TR:[$18, $80]');
  AddInformationLabel(2, 9, 'TE:[$18, $81]/Ef');
  AddInformationLabel(2, 8, 'EC:[$18, $86]/1 11kHz');

  AddInformationLabel(2, 6, '[$18, $1250]');
  AddInformationLabel(2, 5, Format('FOV:%dx%d', [
    trunc(FWidth * Attributes.ImageData.PixelSpacingX), trunc(Fheight *
      Attributes.ImageData.PixelSpacingY)]));
  AddInformationLabel(2, 4, '[$18, $50] thk/ 1.0sp');
  AddInformationLabel(2, 3, '15/4:[$18, $95]');

  da1 := Attributes.Item[$18, $1310];
  if assigned(da1) and (da1.GetCount > 0) then
  begin
    if da1.AsInteger[0] = 0 then
      AddInformationLabel(2, 2, Format('%d*%d/4 NEX', [da1.AsInteger[1], da1.AsInteger[2]]))
    else
      AddInformationLabel(2, 2, Format('%d*%d/4 NEX', [da1.AsInteger[0], da1.AsInteger[3]]))
  end;
  AddInformationLabel(2, 1, '[$18, $22]');
end;

procedure TDicomImage.AddPredefineInformationLabelsSI;
var
  da1, da2: TDicomAttribute;
begin
  ClearInformationLabels;

  AddInformationLabel(1, 1, '[$10, $10] [$10, $40] [$10, $1010]');

  AddInformationLabel(1, 2, '[$10, $20]');
  AddInformationLabel(1, 3, '[$10, $30]');
  AddInformationLabel(1, 4, '[$8, $23]');
  AddInformationLabel(1, 5, '[$8, $33]');

  AddInformationLabel(1, 6, 'TP [$20, $1041]');
  AddInformationLabel(1, 7, 'IMA [$20, $13]');
  AddInformationLabel(1, 8, 'SEQ [$20, $11]');
  AddInformationLabel(1, 9, '[$8, $103E]');

  AddInformationLabel(3, 2, '[$8, $1090]');
  AddInformationLabel(3, 3, '[$18, $1020]');

  AddInformationLabel(2, 8, 'kV [$18, $60]');
  AddInformationLabel(2, 7, 'mA [$18, $1151]');

  AddInformationLabel(2, 6, 'Ti [$18, $50]');
  AddInformationLabel(2, 5, 'GT [$18, $1120]');
  AddInformationLabel(2, 4, 'SL [$18, $50]');

  da1 := Attributes.GetItem($21, $1011);
  da2 := Attributes.GetItem($21, $1120);
  if assigned(da1) and assigned(da2) then
  begin
    AddInformationLabel(2, 3, Format('%d  %d/%d', [da2.AsInteger[0], da1.AsInteger[0],
      da1.AsInteger[1]]));
  end;
  AddInformationLabel(2, 2, '[$18, $1210]');
  AddInformationLabel(2, 1, '001 940');
end;

procedure TDicomImage.AddPredefineInformationLabelsSIMR;
begin
  ClearInformationLabels;

  AddInformationLabel(1, 1, '[$10, $10] [$10, $40] [$10, $1010]');

  AddInformationLabel(1, 2, '[$10, $20]');
  AddInformationLabel(1, 3, '[$10, $30]');

  AddInformationLabel(1, 4, '[$8, $22]');
  AddInformationLabel(1, 5, '[$8, $32]');
  AddInformationLabel(1, 6, 'IMAGE [$20, $13]');
  AddInformationLabel(1, 7, 'SPI [$20, $11]');
  if Attributes.GetString($18, $1250) <> '' then
    AddInformationLabel(1, 8, '[$18, $1250]')
  else
    AddInformationLabel(1, 8, '[$8, $103E]');

  AddInformationLabel(3, 2, '[$8, $1090]');
  AddInformationLabel(3, 3, '[$18, $1020]');

  AddInformationLabel(2, 8, '[$18, $24]');
  AddInformationLabel(2, 7, '  *');

  AddInformationLabel(2, 6, '[$18, $20]');
  AddInformationLabel(2, 5, 'TR [$18, $80]');
  AddInformationLabel(2, 4, 'TE [$18, $81]/1');
  //AddInformationLabel(2, 3, 'TA    01:46');
  //AddInformationLabel(2, 2, 'AC          1');
  AddInformationLabel(2, 3, 'FA: [$18, $1314], TI: [$18, $82]');
  AddInformationLabel(2, 2, 'PE: [$18, $1312]');

  AddInformationLabel(2, 1, '[$20, $4000]');

  if Attributes.GetString($20, $1041) <> '' then
    AddInformationLabel(4, 7, 'SP [$20,$1041]');
  if Attributes.GetString($18, $50) <> '' then
    AddInformationLabel(4, 6, 'SL [$18,$50]');
  AddInformationLabel(4, 5, Format('FoV%5d*%5d', [
    trunc(FWidth * Attributes.ImageData.PixelSpacingX * 10), trunc(Fheight *
      Attributes.ImageData.PixelSpacingY * 10)]));
  AddInformationLabel(4, 3, 'Tra>Cor    -10');
end;

procedure TDicomInformationLabel.SetUID(const Value: Integer);
begin
  FUID := Value;
end;

procedure TDicomImage.DeleteInformationLabel(AIndex: Integer);
begin
  FInformationLabels.Delete(AIndex);
  fViewModify := true;
end;

procedure TDicomDrawObject.SetImageIndex(const Value: integer);
begin
  FImageIndex := Value;
end;

{ TDicomWaveForm }

function TDicomWaveForm.AddChannel: TDicomWaveformChannel;
begin
  Result := TDicomWaveformChannel.Create;
  fList.Add(Result);
end;

procedure TDicomWaveForm.ClearChannels;
var
  i: Integer;
begin
  for i := 0 to fList.Count - 1 do
  begin
    TDicomWaveformChannel(fList[i]).Free;
  end;
end;

constructor TDicomWaveForm.Create(AAttributes: TDicomAttributes);
var
  das1, das2, das3: TDicomAttributes;
  da1, da2, da3, da4: TDicomAttribute;
  ch1: TDicomWaveformChannel;
  i: Integer;
  b1: TOBStream;
  //
  v_cur : TCursor;
  v_str_tmp : string;
  daDATA : TDicomAttribute;
  v_n_group, v_n_channel,
  m,n, v_AmmChannels, v_amms,
  v_cmn_ln, v_Datalen, v_amm,
  x1,y1,y : Integer;
  v_var_tmp : MyType;
begin
  // определение пишем в AAttributes
  // ---------------------------------------------------------------------------
  v_cur := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    v_n_group:=0;
    v_n_channel:=0;
    v_cmn_amm := 0;
    v_amm_pnt:=0;
    v_max_pnt_in_group:=0;
    v_SamplingFrequency:=0;
    // SEQ Waveform Sequence
    da1 := AAttributes.Item[ $5400,$100 ];
    if assigned(da1) then
    for I := 0 to da1.GetCount - 1 do
    begin
      v_AmmChannels := da1.Attributes[I].GetInteger( $3A,$5 );
      if v_AmmChannels=0 then v_AmmChannels:=1;
      //
      v_amms:=0;
      if trim(da1.Attributes[I].GetString( $3A,$10 ))<>'' then v_amms:= strtoint(trim(da1.Attributes[I].GetString( $3A,$10 )));
      //
      v_str_tmp:=da1.Attributes[I].GetString( $3A,$1A );
      if Trim(v_str_tmp)<>'' then
      begin
        v_str_tmp := StringReplace( v_str_tmp, Chr($A0), '',                   [rfReplaceAll, rfIgnoreCase] );
        v_str_tmp := StringReplace( v_str_tmp, ' ', '',                        [rfReplaceAll, rfIgnoreCase] );
        v_str_tmp := StringReplace( v_str_tmp, ' ', '',                        [rfReplaceAll, rfIgnoreCase] );
        v_str_tmp := StringReplace( v_str_tmp, '.', SysUtils.decimalSeparator, [rfReplaceAll, rfIgnoreCase] );
        v_str_tmp := StringReplace( v_str_tmp, ',', SysUtils.decimalSeparator, [rfReplaceAll, rfIgnoreCase] );
        v_SamplingFrequency := Trunc(StrToFloat( v_str_tmp ));
      end;
      // Каналы --------------------------------------------------------------
      Inc(v_n_channel);
      SetLength( v_data, v_n_channel );
      // ---------------------------------------------------------------------
      //
      da3 := da1.Attributes[I].Item[ $3A, $200 ];  // ChannelDefinitionSequence
      if assigned(da3) then
      for m := 0 to da3.GetCount - 1 do
      begin
        SetLength( v_data[v_n_channel-1].r_channel, da3.GetCount );
        v_data[v_n_channel-1].r_amm := da3.GetCount ;
        //
        da4 := da3.Attributes[m].Item[ $3A, $208 ];  // ChannelSourceSequence
        if assigned(da4) then
        for n := 0 to da4.GetCount - 1 do
        begin
          if da4.Attributes[n].GetString( $8,$0102 ) = 'SCPECG' then  // --------------------------------------------------------
          begin
            v_data[v_n_channel-1].r_channel[m].r_channel := m+1 ;
            v_data[v_n_channel-1].r_channel[m].r_chann_cmn := v_n_channel ;
            v_data[v_n_channel-1].r_channel[m].r_name := da4.Attributes[n].GetString( $8,$0104 ) ;
            if v_SamplingFrequency=0 then v_SamplingFrequency:=500;
            v_data[v_n_channel-1].r_channel[m].r_SamplingFrequency:=v_SamplingFrequency;
            Inc(v_cmn_amm);
          end;
        end;
      end;
      //
      v_Datalen := da1.Attributes[I].GetDatalen( $5400,$1010 );
      if v_Datalen > 0 then
      begin
        daDATA := da1.Attributes[I].Item[$5400, $1010];
        if (daDATA <> nil) then
        begin
          b1 := daDATA.AsOBData[0];
          if b1 <> nil then
          begin
            fBuffer := b1.Memory;
            fBufferSize := b1.Size;
            //
            b1.Position := 0;
            v_cmn_ln := Trunc(v_Datalen/2) ; // 16 - длина в байтах одного значения
            v_amms:=v_amms*v_AmmChannels;
            if v_amms=0 then v_amms:=v_cmn_ln;
            v_min_val := 0;
            v_max_val := 0;
            v_amm := 0;
            SetLength( v_data[v_n_channel-1].r_data, 0 );
            SetLength( v_data[v_n_channel-1].r_data, trunc(v_amms/v_AmmChannels) );
            //
            if v_amm_pnt<v_amms then v_amm_pnt := v_amms;
            //            
            if v_AmmChannels>0 then
            for y := 0 to v_amms - 1 do
            begin
              //
              y1 := y mod v_data[v_n_channel-1].r_amm ;
              x1 := Trunc(y/v_data[v_n_channel-1].r_amm) ;
              SetLength( v_data[v_n_channel-1].r_data[x1], v_data[v_n_channel-1].r_amm );
              //
              b1.Read( v_var_tmp, 2 );
              //
              if v_max_val<Abs(v_var_tmp) then v_max_val:=Abs(v_var_tmp);
              if v_min_val=0 then v_min_val:=v_var_tmp;
              if ((v_var_tmp<>0) and (v_min_val>v_var_tmp)) then v_min_val:=v_var_tmp;
              //
              v_data[v_n_channel-1].r_data[ x1, y1 ] := v_var_tmp ;
              //
              if (Trunc((y+1)/v_AmmChannels)=(y+1)/v_AmmChannels)  then
              begin
                Inc(v_amm);
              end;
            end;
          end;
        end;
      end;
      // END DATA
    end;
  finally
    Screen.Cursor := v_cur;
  end;
  // ---------------------------------------------------------------------------
  fList := TList.Create;
  if AAttributes <> nil then
  begin
    da1 := AAttributes.Item[$5400, $100];
    if (da1 <> nil) and (da1.getcount > 0) then
    begin
      das1 := da1.Attributes[0];

      FNumberofWaveformSamples := das1.GetInteger($3A, $10);
      FNumberofWaveformChannels := das1.GetInteger($3A, $5);
      FSamplingFrequency := das1.Item[$3A, $1A].AsFloat[0];
      da2 := das1.Item[$3A, $200];
      if (da2 <> nil) and (da2.getcount > 0) then
      begin //build channel data
        for i := 0 to da2.getCount - 1 do
        begin
          das2 := da2.Attributes[i];
          ch1 := AddChannel;
          if das2.Item[$3A, $213]<>nil then
            ch1.FChannelBaseline := das2.Item[$3A, $213].AsFloat[0];
          if das2.Item[$3A, $212]<>nil then
            ch1.FChannelSensitivityCorrectionFactor := das2.Item[$3A, $212].AsFloat[0];
          if das2.Item[$3A, $214]<>nil then
            ch1.FChannelTimeSkew := das2.Item[$3A, $214].AsFloat[0];
          da3 := das2.Item[$3A, $211];
          if (da3 <> nil) and (da3.getcount > 0) then
          begin
            das3 := da3.Attributes[0];
            ch1.FChannelSensitivityUnits := das3.GetString(8, $100);
          end;
          da3 := das2.Item[$3A, $208];
          if (da3 <> nil) and (da3.getcount > 0) then
          begin
            das3 := da3.Attributes[0];
            ch1.FChannelSource := das3.GetString(8, $104);
          end;
        end;
      end;

      FWaveformSampleInterpretation := das1.GetString($5400, $1004);
      fWaveformBitsStored := das1.GetInteger($5400, $1004);

      da4 := das1.Item[$5400, $1010];
      if (da4 <> nil) and (da3.GetCount > 0) then
      begin
        //fData := da4.AsOBData[0];
        b1 := da4.AsOBData[0];
        if b1 <> nil then
        begin
          fBuffer := b1.Memory;
          fBufferSize := b1.Size;
        end;
      end
      else
      begin
        fBuffer := nil;
        fBufferSize := 0;
      end;
    end;
  end;
end;

destructor TDicomWaveForm.Destroy;
begin
  ClearChannels;
  inherited;
end;

procedure TDicomStream.SetOnlyCurrentFrame(const Value: Integer);
begin
  FOnlyCurrentFrame := Value;
end;

function TDicomWaveForm.GetChannelCount: Integer;
begin
  Result := fList.Count;
end;

function TDicomWaveForm.GetItems(index: Integer): TDicomWaveformChannel;
begin
  if (index < fList.Count) and (index >= 0) then
    Result := TDicomWaveformChannel(fList[index])
  else
    Result := nil;
end;

procedure TDicomWaveForm.SetNumberofWaveformChannels(const Value: Integer);
begin
  FNumberofWaveformChannels := Value;
end;

procedure TDicomWaveForm.SetNumberofWaveformSamples(const Value: Integer);
begin
  FNumberofWaveformSamples := Value;
end;

procedure TDicomWaveForm.SetSamplingFrequency(const Value: Double);
begin
  FSamplingFrequency := Value;
end;

procedure TDicomWaveForm.SetWaveformSampleInterpretation(
  const Value: AnsiString);
begin
  FWaveformSampleInterpretation := Value;
end;

{ TDicomLoadFrameThread }

constructor TDicomLoadFrameThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(false);
  FAttributes := nil;
  FStream := nil;
end;

destructor TDicomLoadFrameThread.Destroy;
begin

  inherited;
end;

procedure TDicomLoadFrameThread.Execute;
begin
  try
    while not Terminated do
    begin
      if (FAttributes <> nil) and (FStream <> nil) then
      begin
        FAttributes.ReadSQofOB_OWForThread(FStream);
        if assigned(OnTerminate) then
          OnTerminate(self);
        Terminate;
      end;

      if FreeOnTerminate then
        Break;
      if not Terminated then
        Suspend;
      ProcessWindowsMessageQueue;
    end;
  finally
    Terminate;
  end;
end;

procedure TDicomLoadFrameThread.LoadFrames(AAttributes: TDicomAttribute;
  AStream: TDicomStream);
begin
  fAttributes := AAttributes;
  FStream := AStream;
  OnTerminate := AAttributes.LoadFrameThreadTerminate;
  FreeOnTerminate := true;

  execute;
end;

procedure TDicomLoadFrameThread.SetAttributes(
  const Value: tDicomAttribute);
begin
  FAttributes := Value;
end;

procedure TDicomLoadFrameThread.SetStream(const Value: TDicomStream);
begin
  FStream := Value;
end;

procedure TDicomAttributes.SetOnLoadFrame(const Value: TNotifyEvent);
begin
  FOnLoadFrame := Value;
end;

procedure TDicomAttribute.LoadFrameThreadTerminate(Sender: TObject);
begin
  if assigned(FParent.FOnLoadFrameFinish) then
    FParent.FOnLoadFrameFinish(FParent);
end;

procedure TDicomStream.SetLoadFrameInThread(const Value: Boolean);
begin
  FLoadFrameInThread := Value;
end;

procedure TDicomAttributes.SetOnLoadFrameFinish(const Value: TNotifyEvent);
begin
  FOnLoadFrameFinish := Value;
end;

procedure TDicomDataset.SetOnLoadFrame(const Value: TNotifyEvent);
begin
  FOnLoadFrame := Value;
end;

procedure TDicomDataset.SetOnLoadFrameFinish(const Value: TNotifyEvent);
begin
  FOnLoadFrameFinish := Value;
end;

procedure TDicomDataset.DoLoadFrame(Sender: TObject);
begin
  if assigned(OnLoadFrame) then
    OnLoadFrame(self);
end;

procedure TDicomDataset.DoLoadFrameFinish(Sender: TObject);
begin
  if assigned(OnLoadFrameFinish) then
    OnLoadFrameFinish(self);
end;

{ TDicomWaveformChannel }

constructor TDicomWaveformChannel.Create;
begin
  FChannelBaseline := 0;
  FChannelSensitivityCorrectionFactor := 1;
  FChannelTimeSkew := 0;
  FChannelSensitivityUnits := '';
  FChannelSource := '';
end;

destructor TDicomWaveformChannel.Destroy;
begin

  inherited;
end;

procedure TDicomWaveformChannel.SetChannelBaseline(const Value: Double);
begin
  FChannelBaseline := Value;
end;

procedure TDicomWaveformChannel.SetChannelSensitivityCorrectionFactor(
  const Value: Double);
begin
  FChannelSensitivityCorrectionFactor := Value;
end;

procedure TDicomWaveformChannel.SetChannelSensitivityUnits(
  const Value: AnsiString);
begin
  FChannelSensitivityUnits := Value;
end;

procedure TDicomWaveformChannel.SetChannelSource(const Value: AnsiString);
begin
  FChannelSource := Value;
end;

procedure TDicomWaveformChannel.SetChannelTimeSkew(const Value: Double);
begin
  FChannelTimeSkew := Value;
end;

function TDicomAttributes.GetWaveformData: TDicomWaveForm;
var
  da1: TDicomAttribute;
begin
  if assigned(fWaveformData) then
    Result := fWaveformData
  else
  begin
    da1 := Item[$5400, $100];
    if assigned(da1) then
    begin
      if not assigned(fWaveformData) then
        fWaveformData := TDicomWaveForm.Create(self);
      Result := fWaveformData;
    end
    else
    begin
      {da1 := Item[$54, $220];
      if da1.GetCount > 0 then
      begin
        das1 := da1.Attributes[0];
        if not assigned(FImageData) then
          FImageData := TDicomImage.Create(self, das1);
        Result := FImageData;
      end
      else}
      Result := nil;
    end;
  end;
end;

procedure TDicomAttributes.RemoveImageData;
begin
  FImageData.Free;
  FImageData := nil;
end;

procedure TDicomDatasets.SetAutoShowReffrenceLine(const Value: Boolean);
begin
  FAutoShowReffrenceLine := Value;
  if not Value then
  begin
    ClearTopoLine(nil);
    ClearTopo;
  end;
end;

procedure SaveImageToJpeg2000(ADataset: TDicomDataset; AFileName: AnsiString);
var
  stm1: TFileStream;
  PointerNeedToFree: Pointer;
  d1: TDicomImage;
  photometric: Integer;
begin
  stm1 := TFileStream.Create(AFileName, fmCreate);
  try
    photometric := Getphotometric(ADataset.Attributes.GetString($28, $4));
    d1 := ADataset.Attributes.ImageData;
    if ADataset.Attributes.ImageData.DecompressData(0) then
    begin
      PointerNeedToFree := ADataset.Attributes.ImageData.ImageData[0].Data;

      {$IFNDEF NEEDPERJPEG2000}
      encodeJPEG2000_openjpeg(@stm1, PointerNeedToFree, 100,
        d1.FWidth, d1.FHeight, d1.FSamplePerPixel, d1.FBits, photometric,
        ADataset.Attributes.getInteger($28, $103))
        {$ELSE}
      encodeJPEG2000(@stm1, PointerNeedToFree, 1,
        d1.FWidth, d1.FHeight, d1.FSamplePerPixel, d1.FBits, photometric,
        ADataset.Attributes.getInteger($28, $103))
        {$ENDIF}
    end;
  finally
    stm1.free;
  end;
end;

procedure Normalise(var p: TStructMatrix3D);
var
  length: Double;
begin
  length := sqrt(p.x * p.x + p.y * p.y + p.z * p.z);
  if (length <> 0) then
  begin
    p.x := p.x / length;
    p.y := p.y / length;
    p.z := p.z / length;
  end
  else
  begin
    p.x := 0;
    p.y := 0;
    p.z := 0;
  end;
end;

function ArbitraryRotate(p: TStructMatrix3D; theta: double; r1: TStructMatrix3D): TStructMatrix3D;
var
  q, r: TStructMatrix3D;
  costheta, sintheta: Double;
begin
  q.x := 0;
  q.y := 0;
  q.z := 0;

  r := r1;
  Normalise(r);

  costheta := cos(theta);
  sintheta := sin(theta);

  q.x := q.x + (costheta + (1.0 - costheta) * r.x * r.x) * p.x;
  q.x := q.x + ((1.0 - costheta) * r.x * r.y - r.z * sintheta) * p.y;
  q.x := q.x + ((1.0 - costheta) * r.x * r.z + r.y * sintheta) * p.z;

  q.y := q.y + ((1.0 - costheta) * r.x * r.y + r.z * sintheta) * p.x;
  q.y := q.y + (costheta + (1.0 - costheta) * r.y * r.y) * p.y;
  q.y := q.y + ((1.0 - costheta) * r.y * r.z - r.x * sintheta) * p.z;

  q.z := q.z + ((1.0 - costheta) * r.x * r.z - r.y * sintheta) * p.x;
  q.z := q.z + ((1.0 - costheta) * r.y * r.z + r.x * sintheta) * p.y;
  q.z := q.z + (costheta + (1.0 - costheta) * r.z * r.z) * p.z;

  Result := q;
end;

function TDicomImage.orientationCorrectedToView: TStructPlane3D;
const
  deg2rad = 3.14159265358979 / 180.0;
var
  o: TStructPlane3D;
  yRot, xRot, rot: Double;
  vector, rotationVector: TStructMatrix3D;
begin
  yRot := -1;
  xRot := -1;
  rot := FRotate1 * 90;
  o := planeForImage;

  if (FVerFlip1 and FHozFlip1) then
  begin
    rot := rot + 180;
  end
  else
  begin
    if (FVerFlip1) then
    begin
      xRot := xRot * -1;
      yRot := yRot * -1;

      o.YNormalVector.x := o.YNormalVector.x * -1;
      o.YNormalVector.y := o.YNormalVector.y * -1;
      o.YNormalVector.z := o.YNormalVector.z * -1;
    end;

    if (FHozFlip1) then
    begin
      xRot := xRot * -1;
      yRot := yRot * -1;

      o.XNormalVector.x := o.XNormalVector.x * -1;
      o.XNormalVector.x := o.XNormalVector.x * -1;
      o.XNormalVector.x := o.XNormalVector.x * -1;
    end;
  end;

  o.NormalVector := crossProduct(o.XNormalVector, o.YNormalVector);
  // Compute normal vector
  //o[6] = o[1] * o[5] - o[2] * o[4];
  //o[7] = o[2] * o[3] - o[0] * o[5];
  //o[8] = o[0] * o[4] - o[1] * o[3];

  rotationVector := o.NormalVector;

  vector := o.XNormalVector;
  o.XNormalVector := ArbitraryRotate(vector, xRot * rot * deg2rad, rotationVector);
  o.XNormalVector := vector;

  vector := o.YNormalVector;
  o.YNormalVector := ArbitraryRotate(vector, yRot * rot * deg2rad, rotationVector);

  // Compute normal vector
  o.NormalVector := crossProduct(o.XNormalVector, o.YNormalVector);
  //o[6] = o[1] * o[5] - o[2] * o[4];
  //o[7] = o[2] * o[3] - o[0] * o[5];
  //o[8] = o[0] * o[4] - o[1] * o[3];
  Result := o;
end;

function TDicomImage.getOrientationText(vector: TStructMatrix3D; inv: Boolean): AnsiString;
var
  orientationX, orientationY, orientationZ: AnsiString;
  absX, absY, absZ: Double;
  i: Integer;
begin

  if (inv) then
  begin
    if - vector.x < 0 then
      orientationX := 'R' //, @"R: Right"
    else
      orientationX := 'L'; // "L: Left";
    if - vector.y < 0 then
      orientationY := 'A' //, @"A: Anterior"
    else
      orientationY := 'P'; // @"P: Posterior"

    if - vector.z < 0 then
      orientationZ := 'I' //"I: Inferior"
    else
      orientationZ := 'S'; //"S: Superior";
  end
  else
  begin
    if vector.x < 0 then
      orientationX := 'R' //"R: Right"
    else
      orientationX := 'L'; //"L: Left");

    if vector.y < 0 then
      orientationY := 'A' //"A: Anterior")
    else
      orientationY := 'P'; //"P: Posterior");

    if vector.z < 0 then
      orientationZ := 'I' //"I: Inferior"
    else
      orientationZ := 'S'; //"S: Superior";
  end;

  absX := abs(vector.x);
  absY := abs(vector.y);
  absZ := abs(vector.z);

  Result := '';
  // get first 3 AXIS
  for i := 0 to 2 do
  begin
    if (absX > 0.2) and (absX >= absY) and (absX >= absZ) then
    begin
      Result := Result + orientationX + ' ';
      absX := 0;
    end
    else
      if (absY > 0.2) and (absY >= absX) and (absY >= absZ) then
    begin
      Result := Result + orientationY + ' ';
      absY := 0;
    end
    else
      if (absZ > 0.2) and (absZ >= absX) and (absZ >= absY) then
    begin
      Result := Result + orientationZ + ' ';
      absZ := 0;
    end
    else
      break;
  end;
  Result := Trim(Result);
end;

procedure TDicomImage.SaveUndo;
begin

end;

procedure TDicomImage.Undo(AIndex: Integer);
begin

end;

{ TDicomImageUndoInfo }

constructor TDicomImageUndoInfo.Create(AAttributes: TDicomAttributes);
begin

end;

destructor TDicomImageUndoInfo.Destroy;
begin

  inherited;
end;

procedure TDicomImage.ClearUndo;
begin

end;

function TDicomImage.GetUndoCount: Integer;
begin

end;

procedure TDicomImage.SetUndoBufferCount(const Value: Integer);
begin
  FUndoBufferCount := Value;
end;

procedure TDicomDatasets.SaveAsRawFile(ASeriesUID,
  AFileNamePerfix: AnsiString);
var
  i, k: Integer;
  das1: TDicomDataset;
begin
  k := 1;
  for i := 0 to FDatasetList.Count - 1 do
  begin
    das1 := TDicomDataset(FDatasetList[i]);
    if das1.Attributes.GetString($20, $E) = ASeriesUID then
    begin
      das1.SaveAsRawFile(AFileNamePerfix + '.' + IntToStr(k));
      inc(k);
    end;
  end;
end;

procedure TDicomDataset.SaveAsRawFile(AFileName: AnsiString);
var
  d1: TDicomImage;
begin
  d1 := Attributes.ImageData;
  if assigned(d1) and (d1.FrameCount > 0) and d1.DecompressData(0) then
  begin
    d1.ImageData[0].SaveData(AFileName);
  end;
end;

procedure TDicomDataset.SaveFramesAsRawFile(AFileNamePerfix: AnsiString);
var
  i: Integer;
  d1: TDicomImage;
begin
  d1 := Attributes.ImageData;
  if assigned(d1) and (d1.FrameCount > 0) then
    for i := 0 to d1.FrameCount - 1 do
    begin
      if d1.DecompressData(i) then
        d1.ImageData[i].SaveData(AFileNamePerfix + '.' + IntToStr(i + 1));
    end;
end;

procedure TDicomDrawObject.SetAngle(const Value: Double);
begin
  FAngle := Value;
end;

procedure TDicomDrawObject.SetVitexObject(const Value: TVitexObject);
begin
  FVitexObject := Value;
end;

procedure TDicomDataset.SetCustomImageIndex(const Value: Integer);
begin
  //  FCustomImageIndex := Value;
end;

procedure TDicomImage.SetViewerZoom(const Value: Double);
begin
  if (Value > 0.01) and (Value < 100) then
    if fViewerZoom <> Value then
    begin
      FViewModify := true;
      fViewerZoom := Value;
    end;
end;

procedure DecodeSegmentedPaletteColorLookupTableDataBytes(AData: Pointer; ALen: Integer;
  AOutputData: Pointer; AOutputLen: Integer);
var
  ptrs: Wordp;
  shortRed: Bytep;
  nbVal: Integer;
  xxindex: Integer;
  xx, jj, length: Integer;
begin
  ptrs := AData;
  nbVal := ALen div 2;

  shortRed := AOutputData;

  xxindex := 0;
  jj := 0;
  while jj < nbVal do
  begin
    case (ptrs[jj]) of
      0: // Discrete
        begin
          inc(jj);
          length := ptrs[jj];
          inc(jj);
          xx := xxindex;
          while xxindex < xx + length do
          begin
            shortRed[xxindex] := ptrs[jj];
            inc(jj);
            //if( xxindex < 256)
                      //  NSLog(@"%d", shortRed[ xxindex]);
            inc(xxindex);
          end;
          dec(jj);
        end;

      1: // Linear
        begin
          inc(jj);
          length := ptrs[jj];
          xx := xxindex;
          while xxindex < xx + length do
          begin
            shortRed[xxindex] := shortRed[xx - 1] + ((ptrs[jj + 1] - shortRed[xx - 1]) * (1 +
              xxindex - xx)) div (length);
            //		if( xxindex < 256) NSLog(@"%d", shortRed[ xxindex]);
            inc(xxindex);
          end;
          inc(jj);
        end;

      2: // Indirect
        begin
          //NSLog(@"indirect not supported");
          inc(jj);
          length := ptrs[jj];

          jj := jj + 2;
        end;

    else
      //NSLog(@"Error, Error, OsiriX will soon crash...");
    end;
    inc(jj);
  end;
end;

procedure TDicomImage.SetImageAngle(const Value: Double);
begin
  if FImageAngle <> Value then
  begin
    FViewModify := true;
    FImageAngle := Value;
  end;
end;

procedure TDicomImageData.SetData(const Value: Pointer);
begin
  FImageData := Value;
end;

procedure TDicomImageData.SetCanNotFreeBuffer(const Value: Boolean);
begin
  FCanNotFreeBuffer := Value;
end;

procedure TDicomImage.SetOffsetX(const Value: Double);
begin
  if fOffsetX <> Value then
  begin
    FViewModify := true;
    fOffsetX := Value;
  end;
end;

procedure TDicomImage.SetOffsetY(const Value: Double);
begin
  if fOffsetY <> Value then
  begin
    FViewModify := true;
    fOffsetY := Value;
  end;
end;

procedure TDicomDrawObject.SetObjectName(const Value: AnsiString);
begin
  FObjectName := Value;
end;

procedure TDicomDrawObject.ClearPoints;
var
  i: Integer;
  p: PPoint;
begin
  if FList.Count > 0 then
  begin
    fParent.FModify := true;
    for i := 0 to FList.Count - 1 do
    begin
      p := PPoint(FList[i]);
      Freemem(p);
    end;
    FList.Clear;
  end;
end;

function TDicomDrawObjects.FindByObjectName(
  AName: AnsiString): TDicomDrawObject;
var
  i: Integer;
  n1: TDicomDrawObject;
begin
  Result := nil;
  for i := 0 to FList.Count - 1 do
  begin
    n1 := TDicomDrawObject(FList[i]);
    if n1.ObjectName = AName then
    begin
      Result := n1;
      exit;
    end;
  end;
end;

procedure TDicomDrawObjects.SetModify(const Value: Boolean);
begin
  FModify := Value;
end;

procedure TDicomImage.SetModify(const Value: Boolean);
begin
  FModify := Value;
end;

procedure TDicomImage.SetViewModify(const Value: Boolean);
begin
  FViewModify := Value;
end;

procedure TDicomImage.SetHozFlip1(const Value: Boolean);
var
  d1: TDicomImageData;
  p1: Pointer;
begin
  if FHozFlip1 <> Value then
  begin
    FModify := true;
    FHozFlip1 := Value;

    if DecompressData(FBaseFrameIndex + CurrentFrame) then
    begin
      d1 := ImageData[FBaseFrameIndex + CurrentFrame];
      GetMem(p1, d1.Len);
      if FSamplePerPixel = 1 then
      begin
        if FBits <= 8 then
        begin

          vImageConvert_Planar8FlipHiz(d1.Data, width, height, p1, width, height);
        end
        else
          if FBits <= 16 then
        begin
          vImageConvert_Planar16FlipHiz(d1.Data, width, height, p1, width, height);
        end
        else
        begin //32
          vImageConvert_Planar32FlipHiz(d1.Data, width, height, p1, width, height);
        end;
      end
      else //FSamplePerPixel=3
      begin
        vImageConvert_PlanarRGBFlipHiz(d1.Data, width, height, p1, width, height);
      end;
      Freemem(d1.FImageData);
      d1.FImageData := p1;
    end;
  end;
end;

procedure TDicomImage.SetRotate1(const Value: Integer);
var
  d1: TDicomImageData;
  p1: Pointer;
  k, k1, w1{, h1}: Integer;
begin
  if not DecompressData(FBaseFrameIndex + CurrentFrame) then
    exit;

  k1 := Value mod 4;
  if FRotate1 <> k1 then
  begin
    FModify := true;

    k := (k1 - FRotate1 + 4) mod 4;

    FRotate1 := k1;

    d1 := ImageData[FBaseFrameIndex + CurrentFrame];
    GetMem(p1, d1.Len);
    case k of
      3: //90
        begin
          if FSamplePerPixel = 1 then
          begin
            if FBits <= 8 then
            begin
              vImageConvert_Planar8Rotate90(d1.Data, width, height, p1);
            end
            else
              if FBits <= 16 then
            begin
              vImageConvert_Planar16Rotate90(d1.Data, width, height, p1);
            end
            else
            begin //32
              vImageConvert_Planar32Rotate90(d1.Data, width, height, p1);
            end;
          end
          else //FSamplePerPixel=3
          begin
            vImageConvert_PlanarRGBRotate90(d1.Data, width, height, p1);
          end;
          w1 := Width;
          Width := height;
          Height := w1;
        end;
      2: //180
        begin
          if FSamplePerPixel = 1 then
          begin
            if FBits <= 8 then
            begin
              vImageConvert_Planar8Rotate180(d1.Data, width, height, p1);
            end
            else
              if FBits <= 16 then
            begin
              vImageConvert_Planar16Rotate180(d1.Data, width, height, p1);
            end
            else
            begin //32
              vImageConvert_Planar32Rotate180(d1.Data, width, height, p1);
            end;
          end
          else //FSamplePerPixel=3
          begin
            vImageConvert_PlanarRGBRotate180(d1.Data, width, height, p1);
          end;
        end;
      1: //270
        begin
          if FSamplePerPixel = 1 then
          begin
            if FBits <= 8 then
            begin
              vImageConvert_Planar8Rotate270(d1.Data, width, height, p1);
            end
            else
              if FBits <= 16 then
            begin
              vImageConvert_Planar16Rotate270(d1.Data, width, height, p1);
            end
            else
            begin //32
              vImageConvert_Planar32Rotate270(d1.Data, width, height, p1);
            end;
          end
          else //FSamplePerPixel=3
          begin
            vImageConvert_PlanarRGBRotate270(d1.Data, width, height, p1);
          end;
          w1 := Width;
          Width := height;
          Height := w1;
        end;
    end;
    Freemem(d1.FImageData);
    d1.FImageData := p1;
  end;
end;

procedure TDicomImage.SetVerFlip1(const Value: Boolean);
var
  d1: TDicomImageData;
  p1: Pointer;
begin
  if FVerFlip1 <> Value then
  begin
    FModify := true;
    FVerFlip1 := Value;

    if DecompressData(FBaseFrameIndex + CurrentFrame) then
    begin
      d1 := ImageData[FBaseFrameIndex + CurrentFrame];
      GetMem(p1, d1.Len);
      if FSamplePerPixel = 1 then
      begin
        if FBits <= 8 then
        begin

          vImageConvert_Planar8FlipVer(d1.Data, width, height, p1, width, height);
        end
        else
          if FBits <= 16 then
        begin
          vImageConvert_Planar16FlipVer(d1.Data, width, height, p1, width, height);
        end
        else
        begin //32
          vImageConvert_Planar32FlipVer(d1.Data, width, height, p1, width, height);
        end;
      end
      else //FSamplePerPixel=3
      begin
        vImageConvert_PlanarRGBFlipVer(d1.Data, width, height, p1, width, height);
      end;
      Freemem(d1.FImageData);
      d1.FImageData := p1;
    end;
  end;
end;

procedure TDicomImage.SetFrameIndex(const Value: Integer);
begin
  if FFrameIndex <> Value then
  begin
    FModify := true;
    FFrameIndex := Value;
  end;
end;

function TDicomDataset.GetImageIndex: Integer;
begin
  Result := fImageIndex;
end;

function TDicomDataset.GetInstanceUID: AnsiString;
begin
  Result := fInstanceUID;
end;

function TDicomDataset.GetSeriesNumber: Integer;
begin
  Result := fSeriesNumber;
end;

function TDicomDataset.GetSeriesUID: AnsiString;
begin
  Result := fSeriesUID;
end;

function TDicomDataset.GetStudyUID: AnsiString;
begin
  Result := fStudyUID;
end;

procedure TDicomImage.SetBufferLength(
  const Value: TDicomImageBufferLength);
begin
  FBufferLength := Value;
end;

procedure TDicomAttributes.SetBufferLength(
  const Value: TDicomImageBufferLength);
begin
  if assigned(FImageData) then
  begin
    FImageData.Free;
    FImageData := nil;
  end;
  FBufferLength := Value;
  //  FImageData.FBufferLength := FBufferLength;
end;

procedure TDicomDataset.SetBufferLength(
  const Value: TDicomImageBufferLength);
begin
  FBufferLength := Value;
  FAttributes.FBufferLength := Value;
end;

procedure TDicomDatasets.SetBufferLength(
  const Value: TDicomImageBufferLength);
begin
  FBufferLength := Value;
end;

procedure TDicomImage.SetMouseCtrlWwWlFactor(const Value: Double);
begin
  FMouseCtrlWwWlFactor := Value;
end;

procedure TDicomImage.SetMouseWwWlFactor(const Value: Double);
begin
  FMouseWwWlFactor := Value;
end;

procedure TDicomImage.SetDSADefaultFrame(const Value: Integer);
begin
  FDSADefaultFrame := Value;
end;

procedure TDicomDatasets.SwapDataDataset(AIndex1, AIndex2: Integer);
var
  d1: Pointer;
begin
  if (AIndex1 >= 0) and (AIndex2 >= 0) then
  begin
    if (AIndex1 < FDatasetList.count) and (AIndex2 < FDatasetList.count) then
    begin
      d1 := FDatasetList[AIndex1];

      //d2 := FDatasetList[AIndex2];

      FDatasetList.Remove(d1);
      //FDatasetList.Remove(d2);

      FDatasetList.Insert(AIndex2, d1);
      //FDatasetList.Insert(AIndex1, d2);
    end
    else
      if (AIndex1 < FDatasetList.count) then
    begin
      d1 := FDatasetList[AIndex1];
      FDatasetList.Delete(AIndex1);
      FDatasetList.Add(d1);
    end
    else
      if (AIndex2 < FDatasetList.count) then
    begin
      d1 := FDatasetList[AIndex2];
      FDatasetList.Delete(AIndex2);
      FDatasetList.Add(d1);
    end;
  end;
end;

{ TDicomImageCustomWindowsLeveling }

procedure TDicomImageCustomWindowsLeveling.Clear;
begin

end;

constructor TDicomImageCustomWindowsLeveling.Create;
begin
  fList := TList.Create;
end;

destructor TDicomImageCustomWindowsLeveling.Destroy;
begin
  fList.Free;
  inherited;
end;

{ TCnsAVIReader }

procedure TCnsAVIReader.Close;
begin
  AVIStreamGetFrameClose(ob);
  AVIStreamRelease(pavis);
end;

constructor TCnsAVIReader.Create;
begin
  inherited Create;
end;

destructor TCnsAVIReader.Destroy;
begin

  inherited;
end;

procedure TCnsAVIReader.AssignedToBitmap(Frame: integer; Bitmap: TBitmap);
  procedure FrameToBitmap(Bitmap: TBitmap; FrameBuffer: pointer; BitmapInfo:
    Windows.TBitmapInfo);
  begin
    with Bitmap do
    begin
      Width := BitmapInfo.bmiHeader.biWidth; //   New   size   of   Bitmap
      Height := Bitmapinfo.bmiHeader.biHeight;
      setDiBits(canvas.handle, handle, 0, BitmapInfo.bmiHeader.biheight,
        FrameBuffer, BitmapInfo, DIB_RGB_COLORS);
    end;
  end;
var
  Image: Pointer;
  ImageStart: Integer;
  p: Pointer;
  //  Buff: Pointer;
begin
  try
    image := AVIStreamGetFrame(ob, Frame);
    if image <> nil then
    begin
      imagestart := TBitmapInfoHeader(image^).biSize + TBitmapInfoHeader(image^).biClrUsed * 4;
      P := pAnsiChar(Image) + ImageStart;
      FrameToBitmap(Bitmap, P, Windows.TBitmapInfo(Image^));
      //BitmapToFrame(Bmp, Buff);
      //AddListItem(Buff, List);
      //if Index = 100 then
      //  SaveBuffToFile(Buff, 'c:\b.bmp');
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

function TCnsAVIReader.GetFrame(Frame: integer): tbitmap;
  procedure FrameToBitmap(Bitmap: TBitmap; FrameBuffer: pointer; BitmapInfo:
    Windows.TBitmapInfo);
  begin
    with Bitmap do
    begin
      Width := BitmapInfo.bmiHeader.biWidth; //   New   size   of   Bitmap
      Height := Bitmapinfo.bmiHeader.biHeight;
      setDiBits(canvas.handle, handle, 0, BitmapInfo.bmiHeader.biheight,
        FrameBuffer, BitmapInfo, DIB_RGB_COLORS);
    end;
  end;
var
  Image: Pointer;
  ImageStart: Integer;
  p: Pointer;
  //  Buff: Pointer;
begin
  Result := nil;
  try
    image := AVIStreamGetFrame(ob, Frame);
    if image <> nil then
    begin
      Result := TBitmap.Create;
      imagestart := TBitmapInfoHeader(image^).biSize + TBitmapInfoHeader(image^).biClrUsed * 4;
      P := pAnsiChar(Image) + ImageStart;
      FrameToBitmap(Result, P, Windows.TBitmapInfo(Image^));
      //BitmapToFrame(Bmp, Buff);
      //AddListItem(Buff, List);
      //if Index = 100 then
      //  SaveBuffToFile(Buff, 'c:\b.bmp');
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

function TCnsAVIReader.Open(AFileName: Ansistring): integer;
begin
  FileName := AFileName;
  result := AVIFileOpen(pavi, PAnsichar(Filename), OF_READ, nil);
  AVIFILEGetStream(pavi, pavis, streamtypeVIDEO, 0);
  fStart := AVIStreamStart(pavis);
  fEnding := AVIStreamENd(pavis);
  ob := AVIStreamGetFrameOpen(pavis, nil);
  if ob = nil then
  begin
    Result := -1;
    ShowMessage('open AVI stream error. Please install ffdshow or other');
  end;
  AVIStreamBeginStreaming(pavis, Start, Ending, 1000);
  //  DrawDIBStart(han,microsperframe);
end;

function TDicomImage.GetImageArrayCount: Integer;
begin
  Result := FImageArray.Count;
end;

procedure TDicomImage.GetBitmapFromCine(AIndex: Integer; ABitmap: TBitmap);
begin
  if fAVIStream <> nil then
    fAVIStream.AssignedToBitmap(AIndex + fAVIStream.Start, ABitmap);
end;

procedure TDicomImage.SetPostProcessed(const Value: Boolean);
begin
  FPostProcessed := Value;
  FModify := true;
end;

function TDicomDatasets.FindSliceLocationOnSeries(ASeriesUID: string; ADataset: TDicomDataset): Integer;
begin
  Result := FindSliceLocationOnSeries(ASeriesUID, ADataset.Attributes);
end;

function TDicomDatasets.FindSeriesIndexOnSeries(ASeriesUID: string; ADataset: TDicomDataset): Integer;
begin
  Result := FindSeriesIndexOnSeries(ASeriesUID, ADataset.Attributes);
end;

function TDicomDatasets.FindSeriesImageTimeOnSeries(ASeriesUID: string; ADataset: TDicomDataset): Integer;
begin
  Result := FindSeriesImageTimeOnSeries(ASeriesUID, ADataset.Attributes);
end;

function TDicomDatasets.FindSeriesAcquisitionTimeOnSeries(ASeriesUID: string; ADataset: TDicomDataset): Integer;
begin
  Result := FindSeriesAcquisitionTimeOnSeries(ASeriesUID, ADataset.Attributes);
end;

function TDicomDatasets.FindSliceLocationOnSeries(ASeriesUID: string;
  ADataset: TDicomAttributes): Integer;
var
  i, k1: integer;
  das1: TDicomDataset;
  da1: TDicomAttribute;
  f1, f2: Double;
  ASliceLocation: Double;
  lines1: TStructLine2D;
begin
  k1 := -1;
  f1 := 99999999;
  da1 := ADataset.Item[$0020, $1041];
  if assigned(da1) and (da1.GetCount > 0) then
  begin
    ASliceLocation := da1.AsFloat[0];

    for i := 0 to GetCount - 1 do
    begin
      das1 := Item[i];
      if das1.Attributes.GetString($20, $E) = ASeriesUID then
      begin
        da1 := das1.Attributes.Item[$0020, $1041];
        if assigned(da1) then
        begin
          lines1 := ComputeIntersectLine(das1.Attributes, ADataset);
          if (abs(lines1.P0.x - lines1.P1.x) > 0.01) or (abs(lines1.P0.y - lines1.P1.y) > 0.01) then
          begin
            //ПаЅ»
          end
          else
          begin
            f2 := abs(da1.AsFloat[0] - ASliceLocation);
            if f2 < f1 then
            begin
              f1 := f2;
              k1 := i;
            end;
          end;
        end;
      end;
    end;
  end;
  Result := k1;
end;

function TDicomDatasets.FindSeriesIndexOnSeries(ASeriesUID: string;
  ADataset: TDicomAttributes): Integer;
var
  i, k1: integer;
  das1: TDicomDataset;
  da1: TDicomAttribute;
begin
  k1 := -1;
  da1 := ADataset.Item[$0020, $13];
  if assigned(da1) then
  begin
    for i := 0 to GetCount - 1 do
    begin
      das1 := Item[i];
      if das1.Attributes.GetString($20, $E) = ASeriesUID then
      begin

      end;
    end;
  end;
  Result := k1;
end;

function TDicomDatasets.FindSeriesImageTimeOnSeries(ASeriesUID: string;
  ADataset: TDicomAttributes): Integer;
var
  i, k1: integer;
  das1: TDicomDataset;
  da1: TDicomAttribute;
begin
  k1 := -1;
  da1 := ADataset.Item[$0020, $1041];
  if assigned(da1) then
  begin
    for i := 0 to GetCount - 1 do
    begin
      das1 := Item[i];
      if das1.Attributes.GetString($20, $E) = ASeriesUID then
      begin

      end;
    end;
  end;
  Result := k1;
end;

function TDicomDatasets.FindSeriesAcquisitionTimeOnSeries(ASeriesUID: string;
  ADataset: TDicomAttributes): Integer;
var
  i, k1: integer;
  das1: TDicomDataset;
  da1: TDicomAttribute;
begin
  k1 := -1;
  da1 := ADataset.Item[$0020, $1041];
  if assigned(da1) then
  begin
    for i := 0 to GetCount - 1 do
    begin
      das1 := Item[i];
      if das1.Attributes.GetString($20, $E) = ASeriesUID then
      begin

      end;
    end;
  end;
  Result := k1;
end;

function NewImageForPrint(ADa: TDicomAttributes; ACutRect: TRect): TDicomAttributes;
var
  src1: TDicomImage;
  dimage: TDicomImageData;
  p1: Pointer;
  pb1, pb2: PByte;
  pw1, pw2: PWord;
  ALen, y, x: Integer;
  DestScanline: pRGB;
  prgb1: pRGB;
  da1, da2: TDicomAttribute;
  w1, h1, l1, t1: Integer;
begin
  src1 := Ada.ImageData;

  l1 := Max(0, ACutRect.Left);
  t1 := Max(0, ACutRect.Top);

  w1 := Min(src1.Width, ACutRect.Right) - l1;
  h1 := Min(src1.Height, ACutRect.Bottom) - t1;
  {$IFDEF DICOMDEBUX1}
  SendDebug(Format('rect:%d,%d,%d,%d', [ACutRect.Left, ACutRect.Top, ACutRect.Right, ACutRect.Bottom]));
  SendDebug(Format('%d,%d,%d,%d', [l1, t1, w1, h1]));
  {$ENDIF}
  Result := TDicomAttributes.Create;

  Result.AddVariant($10, $10, ada.getString($10, $10));
  Result.AddVariant($10, $20, ada.getString($10, $20));

  Result.AddVariant($10, $30, ada.getString($10, $30));
  Result.AddVariant($10, $40, ada.getString($10, $40));
  Result.AddVariant($10, $1010, ada.getString($10, $1010));

  Result.AddVariant($20, $13, ada.getString($20, $13));
  Result.AddVariant($20, $10, ada.getString($20, $10));
  Result.AddVariant($20, $D, ada.getString($20, $D));
  Result.AddVariant($20, $E, ada.getString($20, $E));
  Result.AddVariant($8, $18, ada.getString($8, $18));

  da2 := ada.Item[8, $20];
  if (da2 <> nil) and (da2.GetCount > 0) then
    Result.Add($8, $20).AsDatetime[0] := da2.AsDatetime[0];
  da2 := ada.Item[8, $21];
  if (da2 <> nil) and (da2.GetCount > 0) then
    Result.Add($8, $21).AsDatetime[0] := da2.AsDatetime[0];
  da2 := ada.Item[8, $22];
  if (da2 <> nil) and (da2.GetCount > 0) then
    Result.Add($8, $22).AsDatetime[0] := da2.AsDatetime[0];
  da2 := ada.Item[8, $23];
  if (da2 <> nil) and (da2.GetCount > 0) then
    Result.Add($8, $23).AsDatetime[0] := da2.AsDatetime[0];
  da2 := ada.Item[8, $30];
  if (da2 <> nil) and (da2.GetCount > 0) then
    Result.Add($8, $30).AsDatetime[0] := da2.AsDatetime[0];
  da2 := ada.Item[8, $31];
  if (da2 <> nil) and (da2.GetCount > 0) then
    Result.Add($8, $31).AsDatetime[0] := da2.AsDatetime[0];
  da2 := ada.Item[8, $32];
  if (da2 <> nil) and (da2.GetCount > 0) then
    Result.Add($8, $32).AsDatetime[0] := da2.AsDatetime[0];
  da2 := ada.Item[8, $33];
  if (da2 <> nil) and (da2.GetCount > 0) then
    Result.Add($8, $33).AsDatetime[0] := da2.AsDatetime[0];

  Result.AddVariant($28, $11, w1);
  Result.AddVariant($28, $10, h1);

  Result.AddVariant($28, $2, ada.getInteger($28, $2));
  Result.AddVariant($28, $4, ada.GetString($28, $4));

  if ada.getInteger($28, $100) > 8 then
    ALen := w1 * h1 * ada.getInteger($28, $2) * 2
  else
    ALen := w1 * h1 * ada.getInteger($28, $2);

  da1 := Result.Add($28, $34);
  da1.AsInteger[0] := 1;
  da1.AsInteger[1] := 1;

  Result.AddVariant($28, $100, ada.getInteger($28, $100));
  Result.AddVariant($28, $101, ada.getInteger($28, $101));
  Result.AddVariant($28, $102, ada.getInteger($28, $102));

  Result.AddVariant($28, $103, ada.getInteger($28, $103));

  Result.AddVariant($28, $6, ada.getInteger($28, $6));

  Result.AddVariant($28, $1050, ada.ImageData.WindowCenter);
  Result.AddVariant($28, $1051, ada.ImageData.WindowWidth);

  Result.AddVariant($28, $1052, ada.getInteger($28, $1052));
  Result.AddVariant($28, $1053, ada.getInteger($28, $1053));

  Getmem(p1, Alen);
  if ada.getInteger($28, $2) = 3 then
  begin
    prgb1 := p1;
    DestScanline := Src1.ImageData[0].Data;

    inc(DestScanLine, t1 * src1.Width);
    for y := 0 to h1 - 1 do
    begin
      inc(DestScanLine, l1);
      for x := 0 to w1 - 1 do
      begin
        prgb1^.b := DestScanLine^.b;
        prgb1^.g := DestScanLine^.g;
        prgb1^.r := DestScanLine^.r;

        inc(prgb1);
        inc(DestScanLine);
      end;
      inc(DestScanLine, src1.Width - l1 - w1);
    end; // for
  end
  else
    if ada.getInteger($28, $101) <= 8 then
  begin
    pb1 := p1;
    pb2 := Src1.ImageData[0].Data;

    inc(pb2, t1 * src1.Width);
    for y := 0 to h1 - 1 do
    begin
      inc(pb2, l1);
      for x := 0 to w1 - 1 do
      begin
        pb1^ := pb2^;

        inc(pb1);
        inc(pb2);
      end;
      inc(pb2, src1.Width - l1 - w1);
    end; // for
  end
  else
  begin
    pw1 := p1;
    pw2 := Src1.ImageData[0].Data;

    inc(pw2, t1 * src1.Width);
    for y := 0 to h1 - 1 do
    begin
      inc(pw2, l1);
      for x := 0 to w1 - 1 do
      begin
        pw1^ := pw2^;

        inc(pw1);
        inc(pw2);
      end;
      inc(pw2, src1.Width - l1 - w1);
    end; // for
  end;
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  Result.Add(32736, 16).AddData(dimage);
end;

function NewImageForPrint(ADa: TDicomAttributes): TDicomAttributes;
var
  src1: TDicomImage;
  dimage: TDicomImageData;
  p1: Pointer;
  pb1, pb2: PByte;
  pw1, pw2: PWord;
  ALen, y, x: Integer;
  DestScanline: pRGB;
  prgb1: pRGB;
  da1: TDicomAttribute;
  w1, h1, l1, t1: Integer;
begin
  src1 := Ada.ImageData;

  l1 := 0;
  t1 := 0;

  w1 := src1.Width - l1;
  h1 := src1.Height - t1;

  Result := TDicomAttributes.Create;

  Result.AddVariant($28, $11, w1);
  Result.AddVariant($28, $10, h1);

  Result.AddVariant($10, $10, ada.getString($10, $10));
  Result.AddVariant($20, $10, ada.getString($20, $10));
  Result.AddVariant($20, $D, ada.getString($20, $D));
  Result.AddVariant($20, $E, ada.getString($20, $E));
  Result.AddVariant($8, $18, ada.getString($8, $18));

  Result.AddVariant($28, $2, ada.getInteger($28, $2));
  Result.AddVariant($28, $4, ada.GetString($28, $4));

  ALen := w1 * h1 * ada.getInteger($28, $2);

  Result.AddVariant($28, $100, ada.getInteger($28, $100));

  da1 := Result.Add($28, $34);
  da1.AsInteger[0] := 1;
  da1.AsInteger[1] := 1;

  Result.AddVariant($28, $101, ada.getInteger($28, $101));
  Result.AddVariant($28, $102, ada.getInteger($28, $102));

  Result.AddVariant($28, $103, ada.getInteger($28, $103));

  //Result.AddVariant($28, $6, 0);

  Getmem(p1, Alen);
  if ada.getInteger($28, $2) = 3 then
  begin
    prgb1 := p1;
    DestScanline := Src1.ImageData[0].Data;

    for y := 0 to h1 - 1 do
    begin
      for x := 0 to w1 - 1 do
      begin
        prgb1^.b := DestScanLine^.b;
        prgb1^.g := DestScanLine^.g;
        prgb1^.r := DestScanLine^.r;

        inc(prgb1);
        inc(DestScanLine);
      end;
    end; // for
  end
  else
    if ada.getInteger($28, $101) <= 8 then
  begin
    pb1 := p1;
    pb2 := Src1.ImageData[0].Data;

    for y := 0 to h1 - 1 do
    begin
      for x := 0 to w1 - 1 do
      begin
        pb1^ := pb2^;

        inc(pb1);
        inc(pb2);
      end;
    end; // for
  end
  else
  begin
    pw1 := p1;
    pw2 := Src1.ImageData[0].Data;

    for y := 0 to h1 - 1 do
    begin
      for x := 0 to w1 - 1 do
      begin
        pw1^ := pw2^;

        inc(pw1);
        inc(pw2);
      end;
    end; // for
  end;
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  Result.Add(32736, 16).AddData(dimage);
end;

procedure TDicomDataset.SetOnAfterLoad(const Value: TNotifyEvent);
begin
  FOnAfterLoad := Value;
end;

{ TSeriesList }

procedure TSeriesList.Add(ADataset: TDicomDataset);
begin
  fDatasetList.Add(ADataset);
  Sort;
end;

constructor TSeriesList.Create;
begin
  fDatasetList := TList.Create;
end;

destructor TSeriesList.Destroy;
begin
  fDatasetList.Free;
  inherited;
end;

function TSeriesList.GetItems(index: Integer): TDicomDataset;
begin
  Result := TDicomDataset(fDatasetList[index]);
end;

function TSeriesList.GetSeriesNumber: Integer;
begin
  Result := fSeriesNumber;
end;

function TSeriesList.GetSeriesUID: AnsiString;
begin
  Result := fSeriesUID;
end;

function TSeriesList.GetStudyUID: AnsiString;
begin
  Result := fStudyUID;
end;

procedure TSeriesList.Remove(ADataset: TDicomDataset);
begin
  fDatasetList.Remove(ADataset);
end;

procedure TSeriesList.SetItems(index: Integer; const Value: TDicomDataset);
begin
  fDatasetList[index] := Value;
end;

procedure TSeriesList.SetSeriesNumber(const Value: Integer);
begin
  fSeriesNumber := Value;
end;

procedure TSeriesList.SetSeriesUID(const Value: AnsiString);
begin
  fSeriesUID := Value;
end;

procedure TSeriesList.SetStudyUID(const Value: AnsiString);
begin
  fStudyUID := Value;
end;

procedure TSeriesList.Sort;
begin
  //  FDatasetList.Sort();
end;

{ TStudyList }

function TStudyList.Add: TSeriesList;
begin
  Result := TSeriesList.Create;

  FSeriesLists.Add(Result);
end;

function TStudyList.FindSeries(ASeriesUID: string): TSeriesList;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to FSeriesLists.Count - 1 do
  begin
    if TSeriesList(FSeriesLists[i]).SeriesUID = ASeriesUID then
    begin
      Result := TSeriesList(FSeriesLists[i]);
      break;
    end;
  end;
end;

procedure TStudyList.clear;
var
  i: integer;
begin
  for i := 0 to FSeriesLists.Count - 1 do
  begin
    TSeriesList(FSeriesLists[i]).Free;
  end;
  FSeriesLists.Clear;
end;

constructor TStudyList.Create;
begin
  FSeriesLists := TList.Create;
end;

destructor TStudyList.Destroy;
var
  i: integer;
begin
  for i := 0 to FSeriesLists.Count - 1 do
  begin
    TSeriesList(FSeriesLists[i]).Free;
  end;
  FSeriesLists.Free;
  inherited;
end;

function TStudyList.GetItems(index: Integer): TSeriesList;
begin
  Result := TSeriesList(FSeriesLists[index]);
end;

function TStudyList.GetStudyUID: AnsiString;
begin
  Result := fStudyUID;
end;

function TStudyList.AddDataset(ADataset: TDicomDataset): Boolean;
var
  s1: TSeriesList;
  seriesuid1: string;
begin
  Result := false;
  seriesuid1 := ADataset.Attributes.GetString($20, $E);
  if seriesuid1 <> '' then
  begin
    s1 := FindSeries(seriesuid1);
    if s1 = nil then
    begin
      s1 := Add;
      s1.SeriesUID := seriesuid1;
      s1.SeriesNumber := ADataset.Attributes.GetInteger($20, $11);
    end;
    s1.Add(ADataset);
    Result := true;
  end;
end;

function TStudyList.RemoveDataset(ADataset: TDicomDataset): Boolean;
var
  s1: TSeriesList;
  seriesuid1: string;
begin
  Result := false;
  seriesuid1 := ADataset.Attributes.GetString($20, $E);
  if seriesuid1 <> '' then
  begin
    s1 := FindSeries(seriesuid1);
    if s1 <> nil then
    begin
      s1.Remove(ADataset);
      Result := true;
    end;
  end;
end;

procedure TStudyList.SetStudyUID(const Value: AnsiString);
begin
  fStudyUID := Value;
end;

procedure TDicomDatasets.DoBeforeRemoveDicomDataset(Sender: TObject);
var
  das: TDicomDataset;
begin
  das := TDicomDataset(Sender);
  das.OnReadAttribute := nil;
  das.OnLoadFrame := nil;
  das.OnLoadFrameFinish := nil;
  das.OnAfterLoad := nil;
  //FStudySet.RemoveDataset(das);

  if assigned(fOnRemoveDataset) then
    fOnRemoveDataset(self, das);

  //FDatasetList.Remove(das);
  //  das.Free;
//  VerifityDataset;
//  BuildSeriesList;
end;

procedure TDicomDatasets.DoAfterLoadDicomDataset(Sender: TObject);
begin
  //StudySet.AddDataset(TDicomDataset(Sender));

  //  VerifityDataset;
  BuildSeriesList;
  //if FAutoShowReffrenceLine then
  //  AddTopoDataset(ADicomDataset, FDatasetList.Count, true);

  if assigned(OnAfterLoad) then
    OnAfterLoad(sender);
end;

procedure TDicomDatasets.DoLoadFrame(Sender: TObject);
begin
  if assigned(OnLoadFrame) then
    OnLoadFrame(sender);
end;

procedure TDicomDatasets.DoLoadFrameFinish(Sender: TObject);
begin
  if assigned(OnLoadFrameFinish) then
    OnLoadFrameFinish(sender);
end;

procedure TDicomDatasets.DoNewAttribute(Sender: TObject;
  AAttribute: TDicomAttribute; APosition: Integer);
begin
  if assigned(fOnReadAttribute) then
    fOnReadAttribute(Sender, AAttribute, APosition);
end;

procedure TDicomDatasets.SetOnAfterLoad(const Value: TNotifyEvent);
begin
  FOnAfterLoad := Value;
end;

procedure TDicomDatasets.SetOnLoadFrame(const Value: TNotifyEvent);
begin
  FOnLoadFrame := Value;
end;

procedure TDicomDatasets.SetOnLoadFrameFinish(const Value: TNotifyEvent);
begin
  FOnLoadFrameFinish := Value;
end;

procedure TDicomDatasets.Add(ADicomDataset: TDicomDataset);
begin
  AddDicomDataset(ADicomDataset);
end;

procedure TDicomDatasets.Insert(AIndex: integer;
  ADicomDataset: TDicomDataset);
begin
  InsertDicomDataset(AIndex, ADicomDataset);
end;

function TStudyList.GetSeriesByUID(index: string): TSeriesList;
begin
  Result := FindSeries(index);
end;

procedure TStudyList.Sort;
begin
  //  FSeriesLists.Sort();
end;

procedure TDicomDatasets.SetImageOrder(const Value: TDicomDatasetSortBy);
begin
  FImageOrder := Value;
  SortDatasets(FImageOrder);
end;

{ TDicomDatasetBinaryStreamFormat }

procedure TDicomDatasetBinaryStreamFormat.AfterLoad(
  ADataset: TDataset);
begin

end;

procedure TDicomDatasetBinaryStreamFormat.BeforeLoad(
  ADataset: TDataset);
begin

end;

procedure TDicomDatasetBinaryStreamFormat.LoadData(
  ADataset: TDataset);
begin

end;

procedure TDicomDatasetBinaryStreamFormat.LoadDef(
  ADataset: TDataset);
begin

end;

procedure TDicomDatasetBinaryStreamFormat.AfterSave(
  ADataset: TDataset);
begin
  {$IFNDEF FPC}
  Writer.FlushBuffer;
  {$ENDIF}
  Writer.Free;
  Writer := nil;
end;

procedure TDicomDatasetBinaryStreamFormat.BeforeSave(
  ADataset: TDataset);
begin
  Writer := TWriter.Create(WorkStream, FBuffSize);

  Writer.WriteSignature;

  {$IFNDEF BINARY_FILE_1XX_COMPATIBILITY}
  Writer.WriteInteger(251);
  {$ENDIF}
end;

constructor TDicomDatasetBinaryStreamFormat.Create(AOwner: TComponent);
begin
  FBuffSize := 16384;
  fsfSaveDataTypeHeader := true;

  FWorkStream := nil;
  FWorkDataset := nil;
  FMemoFilter := nil;
end;

procedure TDicomDatasetBinaryStreamFormat.SaveData(
  ADataset: TDataset);
var
  i, j{, cnt}: integer;
  nf: integer;
  Accept: boolean;
  NewestVersion: boolean;

  blob1: TBlobField;
//  p1: pByte;
  C1: Integer;
  stm1: TMemoryStream;
  v1: TValueType;

  SaveCount: Integer;
begin
  // Write fielddefinitions.
  nf := ADataSet.FieldCount;

  // Write datatypes as a kind of header.
  if sfSaveDataTypeHeader then
  begin
    // Count number of fields actually saved.
    j := 0;
    for i := 0 to nf - 1 do
      //if SaveFields[i] >= 0 then
      inc(j);

    // Start writing header.
    Writer.WriteListBegin;
    Writer.WriteInteger(j);
    for i := 0 to nf - 1 do
    begin
      //if SaveFields[i] >= 0 then
      Writer.WriteInteger(ord(ADataSet.Fields[i].DataType));
    end;
    Writer.WriteListEnd;
  end;

  // Write all records
  SaveCount := 0;

  Writer.WriteListBegin;

  ADataset.First;
  while not ADataset.Eof do
  begin
    // Check if to save more.
    if (SaveLimit > 0) and (SaveCount >= SaveLimit) then
    begin
      break;
    end;

    // Check filter of record.
    Accept := true;
    if assigned(FOnFilterRecord) then
      FOnFilterRecord(self, Accept);
    if not Accept then
    begin
      ADataset.Next;
      continue;
    end;
    // Write current record.
    NewestVersion := true;
    {$IFNDEF BINARY_FILE_1XX_COMPATIBILITY}
    {$IFNDEF BINARY_FILE_200_COMPATIBILITY}

    // Write record versions in a list starting with Updatestatus.
    Writer.WriteListBegin;
    //while ADataSet.OverrideActiveRecordBuffer <> nil do
    begin
      Writer.WriteInteger(ord(usUnmodified));
      {$ENDIF}
      {$ENDIF}
      for i := 0 to nf - 1 do
      begin
        //if SaveFields[i] >= 0 then
        begin

          {$IFNDEF BINARY_FILE_1XX_COMPATIBILITY}
          {$IFNDEF BINARY_FILE_200_COMPATIBILITY}
          {$IFNDEF BINARY_FILE_230_COMPATIBILITY}
          Writer.WriteBoolean(ADataSet.Fields[i].IsNull);
          if not ADataSet.Fields[i].IsNull then
          begin
            {$ENDIF}
            {$ENDIF}
            {$ENDIF}
            case ADataSet.Fields[i].DataType of
              ftBoolean: Writer.WriteBoolean(ADataSet.Fields[i].AsBoolean);

              {$IFNDEF LEVEL3}
              ftLargeInt: Writer.WriteFloat(ADataSet.Fields[i].AsFloat);

              ftWideString: Writer.WriteString(
                  {$IFDEF LEVEL6}
                  {$IFDEF LEVEL13}
                  string(UTF8Encode(ADataSet.Fields[i].Value))
                  {$ELSE}
                  UTF8Encode(ADataSet.Fields[i].Value)
                  {$ENDIF}
                  {$ELSE}
                  ADataSet.Fields[i].AsString
                  {$ENDIF}
                  );
              {$ENDIF}

              ftSmallInt,
                ftInteger,
                ftWord,
                ftAutoInc: Writer.WriteInteger(ADataSet.Fields[i].AsInteger);

              ftFloat: Writer.WriteFloat(ADataSet.Fields[i].AsFloat);

              ftBCD,
                ftCurrency: Writer.WriteFloat(ADataSet.Fields[i].AsCurrency);

              ftDate,
                ftTime, ftDateTime: Writer.WriteFloat(ADataSet.Fields[i].AsFloat);
              //add by jiawen
              ftBlob:
                begin
                  stm1 := TMemoryStream.Create;
                  try
                    blob1 := TBlobField(ADataSet.Fields[i]);
                    blob1.SaveToStream(stm1);

                    v1 := vaLString;
                    c1 := stm1.Size;
                    Writer.Write(v1, SizeOf(TValueType));
                    Writer.Write(c1, SizeOf(Integer));
                    Writer.Write(stm1.Memory^, stm1.Size);
                  finally
                    stm1.Free;
                  end;
                end;
              //end
            else
              Writer.WriteString(ADataSet.Fields[i].AsString);
            end;
            {$IFNDEF BINARY_FILE_1XX_COMPATIBILITY}
            {$IFNDEF BINARY_FILE_200_COMPATIBILITY}
            {$IFNDEF BINARY_FILE_230_COMPATIBILITY}
          end;
          {$ENDIF}
          {$ENDIF}
          {$ENDIF}
        end;
      end;
      {$IFNDEF BINARY_FILE_1XX_COMPATIBILITY}
      {$IFNDEF BINARY_FILE_200_COMPATIBILITY} // New for v. 2.24.

      // Only write newest version (current data).
      NewestVersion := false;
    end;
    Writer.WriteListEnd;
    {$ENDIF}
    {$ENDIF}

    // Increment save count.
    SaveCount := SaveCount + 1;
    ADataset.next;
  end;
  Writer.WriteListEnd;
end;

procedure TDicomDatasetBinaryStreamFormat.SaveDef(
  ADataset: TDataset);
var
  i: integer;
  nf: integer;
begin
  // Write fielddefinitions.
  nf := ADataSet.FieldCount;

  Writer.WriteListBegin;
  //if (sfSaveDef in sfDef) then
  begin
    for i := 0 to nf - 1 do
    begin
      //if SaveFields[i] >= 0 then
      begin
        Writer.WriteString(ADataSet.Fields[i].FieldName);
        Writer.WriteString(FieldTypeNames[ADataSet.Fields[i].DataType]);
        Writer.WriteInteger(ADataSet.Fields[i].Size);
        Writer.WriteString(ADataSet.Fields[i].DisplayName);
        {$IFDEF FPC}
        Writer.WriteString('');
        {$ELSE}

        {$IFDEF DOTNET}
        if ADataSet.Fields[i].EditMask = nil then
          Writer.WriteString('')
        else
          {$ENDIF}
          Writer.WriteString(ADataSet.Fields[i].EditMask);
        {$ENDIF}
        Writer.WriteInteger(ADataSet.Fields[i].DisplayWidth);
        Writer.WriteBoolean(ADataSet.Fields[i].Required);
        Writer.WriteBoolean(ADataSet.Fields[i].ReadOnly);

        // New for 2.50i BinaryFileVersion 250
        //if sfSaveFieldKind in sfFieldKind then
        //  Writer.WriteString(FieldKindNames[ord(ADataSet.Fields[i].FieldKind)])
        //else
        Writer.WriteString(FieldKindNames[0]); //fkData.

        // New for 2.50o2 BinaryFileVersion 251
        {$IFDEF LEVEL4}
        {$IFDEF DOTNET}
        if ADataSet.Fields[i].DefaultExpression = nil then
          Writer.WriteString('')
        else
          {$ENDIF}
          Writer.WriteString(ADataSet.Fields[i].DefaultExpression);
        {$ELSE}
        Writer.WriteString('');
        {$ENDIF}
      end;
    end;
  end;
  Writer.WriteListEnd;

  {$IFNDEF BINARY_FILE_1XX_COMPATIBILITY}
  // Save index definitions.
  Writer.WriteListBegin;

  Writer.WriteListEnd;
  {$ENDIF}
end;

procedure TDicomDatasetBinaryStreamFormat.SetWorkStream(
  const Value: TStream);
begin
  FWorkStream := Value;
end;

procedure TDicomDatasetBinaryStreamFormat.SetBuffSize(
  const Value: Integer);
begin
  FBuffSize := Value;
end;

procedure TDicomDatasetBinaryStreamFormat.SetsfSaveDataTypeHeader(
  const Value: Boolean);
begin
  FsfSaveDataTypeHeader := Value;
end;

procedure TDicomDatasetBinaryStreamFormat.SetSaveLimit(
  const Value: Integer);
begin
  FSaveLimit := Value;
end;

procedure TDicomDatasetBinaryStreamFormat.SetOnFilterRecord(
  const Value: TDicomFilterRecordEvent);
begin
  FOnFilterRecord := Value;
end;

procedure TDicomDatasetBinaryStreamFormat.SetMemoFilter(
  const Value: TDicomAttribute);
begin
  FMemoFilter := Value;
end;

procedure TDicomDatasetBinaryStreamFormat.SetWorkDataset(
  const Value: TDataset);
begin
  FWorkDataset := Value;
end;

initialization
  DicomImplementationClassUID := '1.2.826.0.1.3680043.2.60.0.1';
  DicomImplementationVersionName := 'DicomVCL.com';

  ECLTempFileIndex := 0;
  ECLTempPath := '';
  DicomTempPath := '';

  //  ImageOverlayDataset := nil;
  OverlayTextLevel := 0;
  //  TextOverlayMode := false;
  QuickWindowMode := true;
  DefaultWindowMouseMode := true;

  RuntimeTextInBitmapMode := false;

  //  WLLut := TDicomImageLookupTables.Create;
  CnsExpireTimer := nil;

  InitCursors;

finalization
  //  WLLut.Free;
  {$IFDEF FOR_TRIAL_VERSION}
  if assigned(CnsExpireTimer) then
  begin
    CnsExpireTimer := TTimerExt.Create(nil);
    CnsExpireTimer.Enabled := true;
  end;
  {$ENDIF}
end.

