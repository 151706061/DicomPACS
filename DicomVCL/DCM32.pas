{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM32;

interface
{/$DEFINE DICOMDEBUG}

{$I DicomPack.inc}

uses
  {$IFDEF CLX}
  Qt, Types,
  {$IFDEF LINUX}Libc, {$ENDIF}
  {$IFDEF MSWINDOWS}Windows, {$ENDIF}
  QControls, QGraphics, QConsts,
  {$ELSE}
  Windows, Messages, Controls, Graphics,
  {$ENDIF}
  {$IFDEF DICOMDEBUG}DbugIntf, {$ENDIF}
  Classes, SysUtils, TypInfo, forms, ExtCtrls, dialogs,DCM_Dict;

const
  SItemNotFound = 'Item not found ($0%x)';
  { 32-bit Color }
type
  PColor32 = ^TColor32;
  TColor32 = type Cardinal;

  PColor32Array = ^TColor32Array;
  TColor32Array = array[0..0] of TColor32;
  TArrayOfColor32 = array of TColor32;

  PColor32Entry = ^TColor32Entry;
  TColor32Entry = packed record
    case Integer of
      0: (B, G, R, A: Byte);
      1: (ARGB: TColor32);
      2: (Planes: array[0..3] of Byte);
  end;

  PColor32EntryArray = ^TColor32EntryArray;
  TColor32EntryArray = array[0..0] of TColor32Entry;
  TArrayOfColor32Entry = array of TColor32Entry;

  PPalette32 = ^TPalette32;
  TPalette32 = array[Byte] of TColor32;

const
  // Some predefined color constants
  clBlack32 = TColor32($FF000000);
  clDimGray32 = TColor32($FF3F3F3F);
  clGray32 = TColor32($FF7F7F7F);
  clLightGray32 = TColor32($FFBFBFBF);
  clWhite32 = TColor32($FFFFFFFF);
  clMaroon32 = TColor32($FF7F0000);
  clGreen32 = TColor32($FF007F00);
  clOlive32 = TColor32($FF7F7F00);
  clNavy32 = TColor32($FF00007F);
  clPurple32 = TColor32($FF7F007F);
  clTeal32 = TColor32($FF007F7F);
  clRed32 = TColor32($FFFF0000);
  clLime32 = TColor32($FF00FF00);
  clYellow32 = TColor32($FFFFFF00);
  clBlue32 = TColor32($FF0000FF);
  clFuchsia32 = TColor32($FFFF00FF);
  clAqua32 = TColor32($FF00FFFF);

  // Some semi-transparent color constants
  clTrWhite32 = TColor32($7FFFFFFF);
  clTrBlack32 = TColor32($7F000000);
  clTrRed32 = TColor32($7FFF0000);
  clTrGreen32 = TColor32($7F00FF00);
  clTrBlue32 = TColor32($7F0000FF);

  // Color construction and conversion functions
function Color32(WinColor: TColor): TColor32; overload;
function Color32(R, G, B: Byte; A: Byte = $FF): TColor32; overload;
function Color32(Index: Byte; var Palette: TPalette32): TColor32; overload;
function Gray32(Intensity: Byte; Alpha: Byte = $FF): TColor32;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function WinColor(Color32: TColor32): TColor;
function ArrayOfColor32(Colors: array of TColor32): TArrayOfColor32;

// Color component access
procedure Color32ToRGB(Color32: TColor32; var R, G, B: Byte);
procedure Color32ToRGBA(Color32: TColor32; var R, G, B, A: Byte);
function RedComponent(Color32: TColor32): Integer;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function GreenComponent(Color32: TColor32): Integer;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function BlueComponent(Color32: TColor32): Integer;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function AlphaComponent(Color32: TColor32): Integer;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function Intensity(Color32: TColor32): Integer;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function SetAlpha(Color32: TColor32; NewAlpha: Integer): TColor32;
{$IFDEF USEINLINING}inline;
{$ENDIF}

// Color space conversion
function HSLtoRGB(H, S, L: Single): TColor32; overload;
procedure RGBtoHSL(RGB: TColor32; out H, S, L: Single); overload;
function HSLtoRGB(H, S, L: Integer): TColor32; overload;
procedure RGBtoHSL(RGB: TColor32; out H, S, L: Byte); overload;

{$IFNDEF CLX}
// Palette conversion functions
function WinPalette(const P: TPalette32): HPALETTE;
{$ENDIF}

type
  { Function Prototypes }
  TCombineReg = function(X, Y, W: TColor32): TColor32;
  TCombineMem = procedure(F: TColor32; var B: TColor32; W: TColor32);
  TBlendReg = function(F, B: TColor32): TColor32;
  TBlendMem = procedure(F: TColor32; var B: TColor32);
  TBlendRegEx = function(F, B, M: TColor32): TColor32;
  TBlendMemEx = procedure(F: TColor32; var B: TColor32; M: TColor32);
  TBlendLine = procedure(Src, Dst: PColor32; Count: Integer);
  TBlendLineEx = procedure(Src, Dst: PColor32; Count: Integer; M: TColor32);
  TCombineLine = procedure(Src, Dst: PColor32; Count: Integer; W: TColor32);

  { A fixed-point type }

type
  // This type has data bits arrangement compatible with Windows.TFixed
  PFixed = ^TFixed;
  TFixed = type Integer;

  PFixedRec = ^TFixedRec;
  TFixedRec = packed record
    case Integer of
      0: (Fixed: TFixed);
      1: (Frac: Word; Int: SmallInt);
  end;

  PFixedArray = ^TFixedArray;
  TFixedArray = array[0..0] of TFixed;
  PArrayOfFixed = ^TArrayOfFixed;
  TArrayOfFixed = array of TFixed;
  PArrayOfArrayOfFixed = ^TArrayOfArrayOfFixed;
  TArrayOfArrayOfFixed = array of TArrayOfFixed;

  // TFloat determines the precision level for certain floating-point operations
  PFloat = ^TFloat;
  TFloat = Single;

  { Other dynamic arrays }
type
  PByteArray = ^TByteArray;
  TByteArray = array[0..0] of Byte;
  PArrayOfByte = ^TArrayOfByte;
  TArrayOfByte = array of Byte;

  PWordArray = ^TWordArray;
  TWordArray = array[0..0] of Word;
  PArrayOfWord = ^TArrayOfWord;
  TArrayOfWord = array of Word;

  PIntegerArray = ^TIntegerArray;
  TIntegerArray = array[0..0] of Integer;
  PArrayOfInteger = ^TArrayOfInteger;
  TArrayOfInteger = array of Integer;
  PArrayOfArrayOfInteger = ^TArrayOfArrayOfInteger;
  TArrayOfArrayOfInteger = array of TArrayOfInteger;

  PSingleArray = ^TSingleArray;
  TSingleArray = array[0..0] of Single;
  PArrayOfSingle = ^TArrayOfSingle;
  TArrayOfSingle = array of Single;

const
  // Fixed point math constants
  FixedOne = $10000;
  FixedPI = Round(PI * FixedOne);
  FixedToFloat = 1 / FixedOne;

function Fixed(S: Single): TFixed; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function Fixed(I: Integer): TFixed; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}

{ Points }

type
  PPoint = ^TPoint;
  {$IFNDEF BCB}
  TPoint = {$IFDEF CLX}Types{$ELSE}Windows{$ENDIF}.TPoint;
  {$ENDIF}

  PPointArray = ^TPointArray;
  TPointArray = array[0..0] of TPoint;
  PArrayOfPoint = ^TArrayOfPoint;
  TArrayOfPoint = array of TPoint;
  PArrayOfArrayOfPoint = ^TArrayOfArrayOfPoint;
  TArrayOfArrayOfPoint = array of TArrayOfPoint;

  PFloatPoint = ^TFloatPoint;
  TFloatPoint = record
    X, Y: TFloat;
  end;

  PFloatPointArray = ^TFloatPointArray;
  TFloatPointArray = array[0..0] of TFloatPoint;
  PArrayOfFloatPoint = ^TArrayOfFloatPoint;
  TArrayOfFloatPoint = array of TFloatPoint;
  PArrayOfArrayOfFloatPoint = ^TArrayOfArrayOfFloatPoint;
  TArrayOfArrayOfFloatPoint = array of TArrayOfFloatPoint;

  PFixedPoint = ^TFixedPoint;
  TFixedPoint = record
    X, Y: TFixed;
  end;

  PFixedPointArray = ^TFixedPointArray;
  TFixedPointArray = array[0..0] of TFixedPoint;
  PArrayOfFixedPoint = ^TArrayOfFixedPoint;
  TArrayOfFixedPoint = array of TFixedPoint;
  PArrayOfArrayOfFixedPoint = ^TArrayOfArrayOfFixedPoint;
  TArrayOfArrayOfFixedPoint = array of TArrayOfFixedPoint;

  // construction and conversion of point types
function Point(X, Y: Integer): TPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function Point(const FP: TFloatPoint): TPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function Point(const FXP: TFixedPoint): TPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FloatPoint(X, Y: Single): TFloatPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FloatPoint(const P: TPoint): TFloatPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FloatPoint(const FXP: TFixedPoint): TFloatPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FixedPoint(X, Y: Integer): TFixedPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FixedPoint(X, Y: Single): TFixedPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FixedPoint(const P: TPoint): TFixedPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FixedPoint(const FP: TFloatPoint): TFixedPoint; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}

{ Rectangles }

type
  {$IFDEF CLX}
  PRect = Types.PRect;
  TRect = Types.TRect;
  {$ELSE}
  PRect = Windows.PRect;
  TRect = Windows.TRect;
  {$ENDIF}

  PFloatRect = ^TFloatRect;
  TFloatRect = packed record
    case Integer of
      0: (Left, Top, Right, Bottom: TFloat);
      1: (TopLeft, BottomRight: TFloatPoint);
  end;

  PFixedRect = ^TFixedRect;
  TFixedRect = packed record
    case Integer of
      0: (Left, Top, Right, Bottom: TFixed);
      1: (TopLeft, BottomRight: TFixedPoint);
  end;

  TRectRounding = (rrClosest, rrOutside, rrInside);

  // Rectangle construction/conversion functions
function MakeRect(const L, T, R, B: Integer): TRect; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function MakeRect(const FR: TFloatRect; Rounding: TRectRounding = rrClosest): TRect; overload;
function MakeRect(const FXR: TFixedRect; Rounding: TRectRounding = rrClosest): TRect; overload;
function FixedRect(const L, T, R, B: TFixed): TFixedRect; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FixedRect(const ARect: TRect): TFixedRect; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FixedRect(const FR: TFloatRect): TFixedRect; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FloatRect(const L, T, R, B: TFloat): TFloatRect; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FloatRect(const ARect: TRect): TFloatRect; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function FloatRect(const FXR: TFixedRect): TFloatRect; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}

// Some basic operations over rectangles
function IntersectRect(out Dst: TRect; const R1, R2: TRect): Boolean; overload;
function IntersectRect(out Dst: TFloatRect; const FR1, FR2: TFloatRect): Boolean; overload;
function UnionRect(out Rect: TRect; const R1, R2: TRect): Boolean; overload;
function UnionRect(out Rect: TFloatRect; const R1, R2: TFloatRect): Boolean; overload;
function EqualRect(const R1, R2: TRect): Boolean;
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure InflateRect(var R: TRect; Dx, Dy: Integer); overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure InflateRect(var FR: TFloatRect; Dx, Dy: TFloat); overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure OffsetRect(var R: TRect; Dx, Dy: Integer); overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure OffsetRect(var FR: TFloatRect; Dx, Dy: TFloat); overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function IsRectEmpty(const R: TRect): Boolean; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function IsRectEmpty(const FR: TFloatRect): Boolean; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function PtInRect(const R: TRect; const P: TPoint): Boolean;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function EqualRectSize(const R1, R2: TRect): Boolean; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function EqualRectSize(const R1, R2: TFloatRect): Boolean; overload;
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure InflateRect(const P: TPoint; var R: TRect); overload;

type
  {$IFDEF CLX}
  HBITMAP = QImageH;
  HDC = QPainterH;
  HFont = QFontH;
  {$ENDIF}

  { TCnsBitmap32 draw mode }
  TDrawMode = (dmOpaque, dmBlend, dmCustom, dmTransparent);
  TCombineMode = (cmBlend, cmMerge);
  TWrapMode = (wmClamp, wmRepeat, wmMirror);

  { Gamma bias for line/pixel antialiasing }

var
  GAMMA_TABLE: array[Byte] of Byte;
  Interpolator: function(WX_256, WY_256: Cardinal; C11, C21: PColor32): TColor32;

procedure SetGamma(Gamma: Single = 0.7);

{$IFDEF CLX}
{ TextOut Flags for WinAPI compatibility }
const
  DT_LEFT = Integer(AlignmentFlags_AlignLeft);
  DT_RIGHT = Integer(AlignmentFlags_AlignRight);
  DT_TOP = Integer(AlignmentFlags_AlignTop);
  DT_BOTTOM = Integer(AlignmentFlags_AlignBottom);
  DT_CENTER = Integer(AlignmentFlags_AlignHCenter);
  DT_VCENTER = Integer(AlignmentFlags_AlignVCenter);
  DT_EXPANDTABS = Integer(AlignmentFlags_ExpandTabs);
  DT_NOCLIP = Integer(AlignmentFlags_DontClip);
  DT_WORDBREAK = Integer(AlignmentFlags_WordBreak);
  DT_SINGLELINE = Integer(AlignmentFlags_SingleLine);
  { missing since there is no QT equivalent:
    DT_CALCRECT (makes no sense with TCnsBitmap32.TextOut[2])
    DT_EDITCONTOL
    DT_END_ELLIPSIS and DT_PATH_ELLIPSIS
    DT_EXTERNALLEADING
    DT_MODIFYSTRING
    DT_NOPREFIX
    DT_RTLREADING
    DT_TABSTOP
  }
  {$ENDIF}

type
  { TNotifiablePersistent }
  { TNotifiablePersistent provides a change notification mechanism }
  TNotifiablePersistent = class(TPersistent)
  private
    FUpdateCount: Integer;
    FOnChange: TNotifyEvent;
  protected
    property UpdateCount: Integer read FUpdateCount;
  public
    procedure Changed; virtual;
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  { TThreadPersistent }
  { TThreadPersistent is an ancestor for TCnsBitmap32 object. In addition to
    TPersistent methods, it provides thread-safe locking and change notification }
  TThreadPersistent = class(TNotifiablePersistent)
  private
    FLock: TRTLCriticalSection;
    FLockCount: Integer;
  protected
    property LockCount: Integer read FLockCount;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Lock;
    procedure Unlock;
  end;

  { TCustomMap }
  { An ancestor for bitmaps and similar 2D distributions wich have width and
    height properties }
  TCustomMap = class(TThreadPersistent)
  private
    FHeight: Integer;
    FWidth: Integer;
    FOnResize: TNotifyEvent;
    procedure SetHeight(NewHeight: Integer);
    procedure SetWidth(NewWidth: Integer);
  protected
    procedure ChangeSize(var Width, Height: Integer; NewWidth, NewHeight: Integer); virtual;
  public
    procedure Delete; virtual;
    function Empty: Boolean; virtual;
    procedure Resized; virtual;
    function SetSizeFrom(Source: TPersistent): Boolean;
    function SetSize(NewWidth, NewHeight: Integer): Boolean; virtual;
    property Height: Integer read FHeight write SetHeight;
    property Width: Integer read FWidth write SetWidth;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;

  { TCnsBitmap32 }
  { This is the core of Graphics32 unit. The TCnsBitmap32 class is responsible
    for storage of a bitmap, as well as for drawing in it.
    The OnCombine event is fired only when DrawMode is set to dmCustom and two
    bitmaps are blended together. Unlike most normal events, it does not contain
    "Sender" parameter and is not called through some virtual method. This
    (a little bit non-standard) approach allows for faster operation. }

const
  // common cases
  AREAINFO_RECT = $80000000;
  AREAINFO_LINE = $40000000; // 24 bits for line width in pixels...
  AREAINFO_ELLIPSE = $20000000;
  AREAINFO_ABSOLUTE = $10000000;

  AREAINFO_MASK = $FF000000;

type
  TPixelCombineEvent = procedure(F: TColor32; var B: TColor32; M: TColor32) of object;
  TAreaChangedEvent = procedure(Sender: TObject; const Area: TRect;
    const Info: Cardinal) of object;

  TCustomResampler = class;

  TCnsBitmap32 = class(TCustomMap)
  private
    FBits: PColor32Array;
    FCanvas: TCanvas;
    FClipRect: TRect;
    FFixedClipRect: TFixedRect;
    F256ClipRect: TRect;
    FClipping: Boolean;
    FDrawMode: TDrawMode;
    FCombineMode: TCombineMode;
    FWrapMode: TWrapMode;
    FFont: TFont;
    FHandle: HBITMAP;
    FHDC: HDC;
    {$IFDEF CLX}
    FPixmap: QPixmapH;
    FPainterCount: Integer;
    FPixmapActive: Boolean;
    FPixmapChanged: Boolean;
    {$ELSE}
    FBitmapInfo: TBitmapInfo;
    {$ENDIF}
    FMasterAlpha: Cardinal;
    FOuterColor: TColor32;
    FPenColor: TColor32;
    FStippleCounter: Single;
    FStipplePattern: TArrayOfColor32;
    FStippleStep: Single;
    FOnHandleChanged: TNotifyEvent;
    FOnPixelCombine: TPixelCombineEvent;
    FOnAreaChanged: TAreaChangedEvent;
    FOldOnAreaChanged: TAreaChangedEvent;
    FMeasuringMode: Boolean;
    FResampler: TCustomResampler;
    FNearResampler: TCustomResampler;
    procedure FontChanged(Sender: TObject);
    procedure CanvasChanged(Sender: TObject);
    function GetCanvas: TCanvas;

    function GetPixelR(X, Y: Single): TColor32;
    function GetPixelPtr(X, Y: Integer): PColor32;
    function GetScanLine(Y: Integer): PColor32Array;
    {$IFDEF CLX}
    function GetBits: PColor32Array;
    function GetPixmap: QPixmapH;
    function GetPainter: QPainterH;
    function GetImage: QImageH;
    {$ENDIF}
    procedure SetCombineMode(const Value: TCombineMode);
    procedure SetDrawMode(Value: TDrawMode);
    procedure SetWrapMode(Value: TWrapMode);
    procedure SetFont(Value: TFont);
    procedure SetMasterAlpha(Value: Cardinal);
    procedure TextScaleDown(const B, B2: TCnsBitmap32; const N: Integer;
      const Color: TColor32);
    {$IFDEF USEINLINING}inline;
    {$ENDIF}
    procedure TextBlueToAlpha(const B: TCnsBitmap32; const Color: TColor32);
    {$IFDEF USEINLINING}inline;
    {$ENDIF}
    procedure SetClipRect(const Value: TRect);
    procedure SetResampler(Resampler: TCustomResampler);
    function GetResamplerClassName: string;
    procedure SetResamplerClassName(Value: string);
  protected
    FontHandle: HFont;
    RasterX, RasterY: Integer;
    RasterXF, RasterYF: TFixed;
    procedure ChangeSize(var Width, Height: Integer; NewWidth, NewHeight: Integer); override;
    procedure CopyMapTo(Dst: TCnsBitmap32); virtual;
    procedure CopyPropertiesTo(Dst: TCnsBitmap32); virtual;
    procedure HandleChanged; virtual;
    function Equal(B: TCnsBitmap32): Boolean;
    procedure SET_T256(X, Y: Integer; C: TColor32);
    procedure SET_TS256(X, Y: Integer; C: TColor32);
    function GET_T256(X, Y: Integer): TColor32;
    function GET_TS256(X, Y: Integer): TColor32;
    procedure ReadData(Stream: TStream); virtual;
    procedure WriteData(Stream: TStream); virtual;
    procedure DefineProperties(Filer: TFiler); override;

    function GetPixel(X, Y: Integer): TColor32;
    function GetPixelS(X, Y: Integer): TColor32;
    function GetPixelW(X, Y: Integer): TColor32;

    function GetPixelF(X, Y: Single): TColor32;
    function GetPixelFS(X, Y: Single): TColor32;
    function GetPixelFW(X, Y: Single): TColor32;

    function GetPixelX(X, Y: TFixed): TColor32;
    function GetPixelXS(X, Y: TFixed): TColor32;
    function GetPixelXW(X, Y: TFixed): TColor32;

    function GetPixelB(X, Y: Integer): TColor32;

    procedure SetPixel(X, Y: Integer; Value: TColor32);
    procedure SetPixelS(X, Y: Integer; Value: TColor32);
    procedure SetPixelW(X, Y: Integer; Value: TColor32);

    procedure SetPixelF(X, Y: Single; Value: TColor32);
    procedure SetPixelFS(X, Y: Single; Value: TColor32);
    procedure SetPixelFW(X, Y: Single; Value: TColor32);

    procedure SetPixelX(X, Y: TFixed; Value: TColor32);
    procedure SetPixelXS(X, Y: TFixed; Value: TColor32);
    procedure SetPixelXW(X, Y: TFixed; Value: TColor32);
    {$IFDEF CLX}
    procedure PixmapNeeded;
    procedure ImageNeeded;
    procedure CheckPixmap;
    procedure StartPainter;
    procedure StopPainter;
    {$ENDIF}
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure AssignTo(Dst: TPersistent); override;
    procedure Assign(Source: TPersistent); override;
    function BoundsRect: TRect;
    function Empty: Boolean; override;
    procedure Clear; overload;
    procedure Clear(FillColor: TColor32); overload;
    procedure Delete; override;

    procedure BeginMeasuring(const Callback: TAreaChangedEvent);
    procedure EndMeasuring;

    procedure PropertyChanged;
    procedure Changed; overload; override;
    procedure ChangedEx(const Area: TRect; const Info: Cardinal = AREAINFO_RECT); virtual;

    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);
    procedure LoadFromResourceID(Instance: THandle; ResID: Integer);
    procedure LoadFromResourceName(Instance: THandle; const ResName: string);

    procedure ResetAlpha; overload;
    procedure ResetAlpha(const AlphaValue: Byte); overload;

    procedure Draw(DstX, DstY: Integer; Src: TCnsBitmap32); overload;
    procedure Draw(DstX, DstY: Integer; const SrcRect: TRect; Src: TCnsBitmap32); overload;
    procedure Draw(const DstRect, SrcRect: TRect; Src: TCnsBitmap32); overload;
    {$IFDEF CLX}
    procedure Draw(const DstRect, SrcRect: TRect; SrcPixmap: QPixmapH); overload;
    {$ELSE}
    {$IFDEF BCB}
    procedure Draw(const DstRect, SrcRect: TRect; hSrc: Cardinal); overload;
    {$ELSE}
    procedure Draw(const DstRect, SrcRect: TRect; hSrc: HDC); overload;
    {$ENDIF}
    {$ENDIF}
    procedure SetPixelT(X, Y: Integer; Value: TColor32); overload;
    procedure SetPixelT(var Ptr: PColor32; Value: TColor32); overload;
    procedure SetPixelTS(X, Y: Integer; Value: TColor32);

    procedure DrawToNear(Dst: TCnsBitmap32; const DstRect: TRect);

    procedure DrawTo(Dst: TCnsBitmap32); overload;
    procedure DrawTo(Dst: TCnsBitmap32; DstX, DstY: Integer; const SrcRect: TRect); overload;
    procedure DrawTo(Dst: TCnsBitmap32; DstX, DstY: Integer); overload;
    procedure DrawTo(Dst: TCnsBitmap32; const DstRect: TRect); overload;
    procedure DrawTo(Dst: TCnsBitmap32; const DstRect, SrcRect: TRect); overload;
    {$IFDEF BCB}
    procedure DrawTo(hDst: Cardinal; DstX, DstY: Integer); overload;
    procedure DrawTo(hDst: Cardinal; const DstRect, SrcRect: TRect); overload;
    procedure TileTo(hDst: Cardinal; const DstRect, SrcRect: TRect);
    {$ELSE}
    procedure DrawTo(hDst: HDC; DstX, DstY: Integer); overload;
    procedure DrawTo(hDst: HDC; const DstRect, SrcRect: TRect); overload;
    procedure TileTo(hDst: HDC; const DstRect, SrcRect: TRect);
    {$ENDIF}

    procedure SetStipple(NewStipple: TArrayOfColor32); overload;
    procedure SetStipple(NewStipple: array of TColor32); overload;
    procedure AdvanceStippleCounter(LengthPixels: Single);
    function GetStippleColor: TColor32;

    procedure HorzLine(X1, Y, X2: Integer; Value: TColor32);
    procedure HorzLineS(X1, Y, X2: Integer; Value: TColor32);
    procedure HorzLineT(X1, Y, X2: Integer; Value: TColor32);
    procedure HorzLineTS(X1, Y, X2: Integer; Value: TColor32);
    procedure HorzLineTSP(X1, Y, X2: Integer);

    procedure VertLine(X, Y1, Y2: Integer; Value: TColor32);
    procedure VertLineS(X, Y1, Y2: Integer; Value: TColor32);
    procedure VertLineT(X, Y1, Y2: Integer; Value: TColor32);
    procedure VertLineTS(X, Y1, Y2: Integer; Value: TColor32);
    procedure VertLineTSP(X, Y1, Y2: Integer);

    procedure Line(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean = False);
    procedure LineS(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean = False);
    procedure LineT(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean = False);
    procedure LineTS(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean = False);
    procedure LineA(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean = False);
    procedure LineAS(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean = False);
    procedure LineX(X1, Y1, X2, Y2: TFixed; Value: TColor32; L: Boolean = False); overload;
    procedure LineF(X1, Y1, X2, Y2: Single; Value: TColor32; L: Boolean = False); overload;
    procedure LineXS(X1, Y1, X2, Y2: TFixed; Value: TColor32; L: Boolean = False); overload;
    procedure LineFS(X1, Y1, X2, Y2: Single; Value: TColor32; L: Boolean = False); overload;
    procedure LineXP(X1, Y1, X2, Y2: TFixed; L: Boolean = False); overload;
    procedure LineFP(X1, Y1, X2, Y2: Single; L: Boolean = False); overload;
    procedure LineXSP(X1, Y1, X2, Y2: TFixed; L: Boolean = False); overload;
    procedure LineFSP(X1, Y1, X2, Y2: Single; L: Boolean = False); overload;

    property PenColor: TColor32 read FPenColor write FPenColor;
    procedure MoveTo(X, Y: Integer);
    procedure LineToS(X, Y: Integer);
    procedure LineToTS(X, Y: Integer);
    procedure LineToAS(X, Y: Integer);
    procedure MoveToX(X, Y: TFixed);
    procedure MoveToF(X, Y: Single);
    procedure LineToXS(X, Y: TFixed);
    procedure LineToFS(X, Y: Single);
    procedure LineToXSP(X, Y: TFixed);
    procedure LineToFSP(X, Y: Single);

    procedure FillRect(X1, Y1, X2, Y2: Integer; Value: TColor32);
    procedure FillRectS(X1, Y1, X2, Y2: Integer; Value: TColor32); overload;
    procedure FillRectT(X1, Y1, X2, Y2: Integer; Value: TColor32);
    procedure FillRectTS(X1, Y1, X2, Y2: Integer; Value: TColor32); overload;
    procedure FillRectS(const ARect: TRect; Value: TColor32); overload;
    procedure FillRectTS(const ARect: TRect; Value: TColor32); overload;

    procedure FrameRectS(X1, Y1, X2, Y2: Integer; Value: TColor32); overload;
    procedure FrameRectTS(X1, Y1, X2, Y2: Integer; Value: TColor32); overload;
    procedure FrameRectTSP(X1, Y1, X2, Y2: Integer);
    procedure FrameRectS(const ARect: TRect; Value: TColor32); overload;
    procedure FrameRectTS(const ARect: TRect; Value: TColor32); overload;

    procedure RaiseRectTS(X1, Y1, X2, Y2: Integer; Contrast: Integer); overload;
    procedure RaiseRectTS(const ARect: TRect; Contrast: Integer); overload;

    procedure UpdateFont;
    {$IFDEF CLX}
    procedure Textout(X, Y: Integer; const Text: Widestring); overload;
    procedure Textout(X, Y: Integer; const ClipRect: TRect; const Text: Widestring); overload;
    procedure Textout(DstRect: TRect; const Flags: Cardinal; const Text: Widestring); overload;
    function TextExtent(const Text: Widestring): TSize;
    function TextHeight(const Text: Widestring): Integer;
    function TextWidth(const Text: Widestring): Integer;
    procedure RenderText(X, Y: Integer; const Text: Widestring; AALevel: Integer; Color: TColor32);
    {$ELSE}
    procedure Textout(X, Y: Integer; const Text: string); overload;
    procedure Textout(X, Y: Integer; const ClipRect: TRect; const Text: string); overload;
    procedure Textout(DstRect: TRect; const Flags: Cardinal; const Text: string); overload;
    function TextExtent(const Text: string): TSize;
    function TextHeight(const Text: string): Integer;
    function TextWidth(const Text: string): Integer;
    procedure RenderText(X, Y: Integer; const Text: string; AALevel: Integer; Color: TColor32);
    {$ENDIF}
    procedure TextoutW(X, Y: Integer; const Text: Widestring); overload;
    procedure TextoutW(X, Y: Integer; const ClipRect: TRect; const Text: Widestring); overload;
    procedure TextoutW(DstRect: TRect; const Flags: Cardinal; const Text: Widestring); overload;
    function TextExtentW(const Text: Widestring): TSize;
    function TextHeightW(const Text: Widestring): Integer;
    function TextWidthW(const Text: Widestring): Integer;
    procedure RenderTextW(X, Y: Integer; const Text: Widestring; AALevel: Integer; Color:
      TColor32);

    procedure Roll(Dx, Dy: Integer; FillBack: Boolean; FillColor: TColor32);
    procedure FlipHorz(Dst: TCnsBitmap32 = nil);
    procedure FlipVert(Dst: TCnsBitmap32 = nil);
    procedure Rotate90(Dst: TCnsBitmap32 = nil);
    procedure Rotate180(Dst: TCnsBitmap32 = nil);
    procedure Rotate270(Dst: TCnsBitmap32 = nil);

    procedure ResetClipRect;

    property Canvas: TCanvas read GetCanvas;
    function CanvasAllocated: Boolean;
    procedure DeleteCanvas;

    property Pixel[X, Y: Integer]: TColor32 read GetPixel write SetPixel; default;
    property PixelS[X, Y: Integer]: TColor32 read GetPixelS write SetPixelS;
    property PixelW[X, Y: Integer]: TColor32 read GetPixelW write SetPixelW;
    property PixelX[X, Y: TFixed]: TColor32 read GetPixelX write SetPixelX;
    property PixelXS[X, Y: TFixed]: TColor32 read GetPixelXS write SetPixelXS;
    property PixelXW[X, Y: TFixed]: TColor32 read GetPixelXW write SetPixelXW;
    property PixelF[X, Y: Single]: TColor32 read GetPixelF write SetPixelF;
    property PixelFS[X, Y: Single]: TColor32 read GetPixelFS write SetPixelFS;
    property PixelFW[X, Y: Single]: TColor32 read GetPixelFW write SetPixelFW;
    property PixelR[X, Y: Single]: TColor32 read GetPixelR;
    {$IFDEF CLX}
    property Pixmap: QPixmapH read GetPixmap;
    property Image: QImageH read GetImage;
    property Bits: PColor32Array read GetBits;
    property Handle: QPainterH read GetPainter;
    property PixmapChanged: Boolean read FPixmapChanged write FPixmapChanged;
    {$ELSE}
    property BitmapHandle: HBITMAP read FHandle;
    property BitmapInfo: TBitmapInfo read FBitmapInfo;
    property Bits: PColor32Array read FBits;
    property Handle: HDC read FHDC;
    {$ENDIF}
    property ClipRect: TRect read FClipRect write SetClipRect;
    property Clipping: Boolean read FClipping;

    property Font: TFont read FFont write SetFont;
    property PixelPtr[X, Y: Integer]: PColor32 read GetPixelPtr;
    property ScanLine[Y: Integer]: PColor32Array read GetScanLine;
    property StippleCounter: Single read FStippleCounter write FStippleCounter;
    property StippleStep: Single read FStippleStep write FStippleStep;

    property MeasuringMode: Boolean read FMeasuringMode;
  published
    property DrawMode: TDrawMode read FDrawMode write SetDrawMode default dmOpaque;
    property CombineMode: TCombineMode read FCombineMode write SetCombineMode default cmBlend;
    property WrapMode: TWrapMode read FWrapMode write SetWrapMode default wmClamp;
    property MasterAlpha: Cardinal read FMasterAlpha write SetMasterAlpha default $FF;
    property OuterColor: TColor32 read FOuterColor write FOuterColor default 0;
    property ResamplerClassName: string read GetResamplerClassName write SetResamplerClassName;
    property Resampler: TCustomResampler read FResampler write SetResampler;
    property OnChange;
    property OnHandleChanged: TNotifyEvent read FOnHandleChanged write FOnHandleChanged;
    property OnPixelCombine: TPixelCombineEvent read FOnPixelCombine write FOnPixelCombine;
    property OnAreaChanged: TAreaChangedEvent read FOnAreaChanged write FOnAreaChanged;
    property OnResize;
  end;

  {$IFDEF CLX}
  TCnsBitmap32Canvas = class(TCanvas)
  private
    FBitmap: TCnsBitmap32;
  protected
    procedure BeginPainting; override;
    procedure CreateHandle; override;
  public
    constructor Create(Bitmap: TCnsBitmap32);
  end;
  {$ENDIF}

  { TCustomSampler }
  TCustomSampler = class(TNotifiablePersistent)
  public
    function GetSampleInt(X, Y: Integer): TColor32; virtual;
    function GetSampleFixed(X, Y: TFixed): TColor32; virtual;
    function GetSampleFloat(X, Y: TFloat): TColor32; virtual;
    procedure PrepareSampling; virtual;
    procedure FinalizeSampling; virtual;
    function HasBounds: Boolean; virtual;
    function GetSampleBounds: TRect; virtual;
  end;

  { TCustomResampler }
  TCustomResampler = class(TCustomSampler)
  protected
    function GetWidth: TFloat; virtual; abstract;
    procedure Resample(
      Dst: TCnsBitmap32; DstRect: TRect; DstClip: TRect;
      Src: TCnsBitmap32; SrcRect: TRect;
      CombineOp: TDrawMode; CombineCallBack: TPixelCombineEvent); virtual; abstract;
  public
    property Width: TFloat read GetWidth;
  end;
  TCustomResamplerClass = class of TCustomResampler;

function FixedFloor(A: TFixed): Integer;
function FixedCeil(A: TFixed): Integer;
function FixedMul(A, B: TFixed): TFixed;
function FixedDiv(A, B: TFixed): TFixed;
function FixedRound(A: TFixed): Integer;
function FixedSqr(Value: TFixed): TFixed;
function FixedSqrtLP(Value: TFixed): TFixed; // 8-bit precision
function FixedSqrtHP(Value: TFixed): TFixed; // 16-bit precision

{ Trigonometric routines }
procedure SinCos(const Theta: Single; var Sin, Cos: Single); overload;
procedure SinCos(const Theta, Radius: Single; var Sin, Cos: Single); overload;

{ MulDiv a faster implementation of Windows.MulDiv funtion }
function MulDiv(Multiplicand, Multiplier, Divisor: Integer): Integer;

type
  TConversionType = (ctRed, ctGreen, ctBlue, ctAlpha, ctUniformRGB, ctWeightedRGB);

  TBooleanMap = class(TCustomMap)
  private
    FBits: TArrayOfByte;
    function GetValue(X, Y: Integer): Boolean;
    procedure SetValue(X, Y: Integer; const Value: Boolean);
    function GetBits: PByteArray;
  protected
    procedure ChangeSize(var Width, Height: Integer; NewWidth, NewHeight: Integer); override;
  public
    destructor Destroy; override;
    function Empty: Boolean; override;
    procedure Clear(FillValue: Byte);
    procedure ToggleBit(X, Y: Integer);
    property Value[X, Y: Integer]: Boolean read GetValue write SetValue; default;
    property Bits: PByteArray read GetBits;
  end;

  TByteMap = class(TCustomMap)
  private
    FBits: TArrayOfByte;
    function GetValue(X, Y: Integer): Byte;
    function GetValPtr(X, Y: Integer): PByte;
    procedure SetValue(X, Y: Integer; Value: Byte);
    function GetBits: PByteArray;
  protected
    procedure AssignTo(Dst: TPersistent); override;
    procedure ChangeSize(var Width, Height: Integer; NewWidth, NewHeight: Integer); override;
  public
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function Empty: Boolean; override;
    procedure Clear(FillValue: Byte);
    procedure ReadFrom(Source: TCnsBitmap32; Conversion: TConversionType);
    procedure WriteTo(Dest: TCnsBitmap32; Conversion: TConversionType); overload;
    procedure WriteTo(Dest: TCnsBitmap32; const Palette: TPalette32); overload;
    property Bits: PByteArray read GetBits;
    property ValPtr[X, Y: Integer]: PByte read GetValPtr;
    property Value[X, Y: Integer]: Byte read GetValue write SetValue; default;
  end;

  TWordMap = class(TCustomMap)
  private
    FBits: TArrayOfWord;
    function GetValPtr(X, Y: Integer): PWord;
    function GetValue(X, Y: Integer): Word;
    procedure SetValue(X, Y: Integer; const Value: Word);
    function GetBits: PWordArray;
  protected
    procedure ChangeSize(var Width, Height: Integer; NewWidth, NewHeight: Integer); override;
  public
    destructor Destroy; override;
    function Empty: Boolean; override;
    procedure Clear(FillValue: Word);
    property ValPtr[X, Y: Integer]: PWord read GetValPtr;
    property Value[X, Y: Integer]: Word read GetValue write SetValue; default;
    property Bits: PWordArray read GetBits;
  end;

  TIntegerMap = class(TCustomMap)
  private
    FBits: TArrayOfInteger;
    function GetValPtr(X, Y: Integer): PInteger;
    function GetValue(X, Y: Integer): Integer;
    procedure SetValue(X, Y: Integer; const Value: Integer);
    function GetBits: PIntegerArray;
  protected
    procedure ChangeSize(var Width, Height: Integer; NewWidth, NewHeight: Integer); override;
  public
    destructor Destroy; override;
    function Empty: Boolean; override;
    procedure Clear(FillValue: Integer);
    property ValPtr[X, Y: Integer]: PInteger read GetValPtr;
    property Value[X, Y: Integer]: Integer read GetValue write SetValue; default;
    property Bits: PIntegerArray read GetBits;
  end;

type
  TFixedVector = TFixedPoint;
  PFixedVector = ^TFixedVector;
  TFloatVector = TFloatPoint;
  PFloatVector = ^TFloatVector;
  TArrayOfFixedVector = array of TFixedVector;
  PArrayOfFixedVector = ^TArrayOfFixedVector;
  TArrayOfFloatVector = array of TFloatVector;
  PArrayOfFloatVector = ^TArrayOfFixedVector;

type
  TVectorCombineMode = (vcmAdd, vcmReplace, vcmCustom);
  TVectorCombineEvent = procedure(F, P: TFixedVector; var B: TFixedVector) of object;

  TVectorMap = class(TCustomMap)
  private
    FVectors: TArrayOfFixedVector;
    FOnVectorCombine: TVectorCombineEvent;
    FVectorCombineMode: TVectorCombineMode;
    function GetVectors: PFixedPointArray;
    function GetFixedVector(X, Y: Integer): TFixedVector;
    function GetFixedVectorS(X, Y: Integer): TFixedVector;
    function GetFixedVectorX(X, Y: TFixed): TFixedVector;
    function GetFixedVectorXS(X, Y: TFixed): TFixedVector;
    function GetFloatVector(X, Y: Integer): TFloatVector;
    function GetFloatVectorS(X, Y: Integer): TFloatVector;
    function GetFloatVectorF(X, Y: Single): TFloatVector;
    function GetFloatVectorFS(X, Y: Single): TFloatVector;
    procedure SetFixedVector(X, Y: Integer; const Point: TFixedVector);
    procedure SetFixedVectorS(X, Y: Integer; const Point: TFixedVector);
    procedure SetFixedVectorX(X, Y: TFixed; const Point: TFixedVector);
    procedure SetFixedVectorXS(X, Y: TFixed; const Point: TFixedVector);
    procedure SetFloatVector(X, Y: Integer; const Point: TFloatVector);
    procedure SetFloatVectorS(X, Y: Integer; const Point: TFloatVector);
    procedure SetFloatVectorF(X, Y: Single; const Point: TFloatVector);
    procedure SetFloatVectorFS(X, Y: Single; const Point: TFloatVector);
    procedure SetVectorCombineMode(const Value: TVectorCombineMode);
  protected
    procedure ChangeSize(var Width, Height: Integer; NewWidth,
      NewHeight: Integer); override;
  public
    destructor Destroy; override;

    procedure Clear;
    procedure Merge(DstLeft, DstTop: Integer; Src: TVectorMap; SrcRect: TRect);

    property Vectors: PFixedPointArray read GetVectors;
    function BoundsRect: TRect;
    function GetTrimmedBounds: TRect;
    function Empty: Boolean; override;
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);

    property FixedVector[X, Y: Integer]: TFixedVector read GetFixedVector write SetFixedVector;
    default;
    property FixedVectorS[X, Y: Integer]: TFixedVector read GetFixedVectorS write SetFixedVectorS;
    property FixedVectorX[X, Y: TFixed]: TFixedVector read GetFixedVectorX write SetFixedVectorX;
    property FixedVectorXS[X, Y: TFixed]: TFixedVector read GetFixedVectorXS write
    SetFixedVectorXS;

    property FloatVector[X, Y: Integer]: TFloatVector read GetFloatVector write SetFloatVector;
    property FloatVectorS[X, Y: Integer]: TFloatVector read GetFloatVectorS write SetFloatVectorS;
    property FloatVectorF[X, Y: Single]: TFloatVector read GetFloatVectorF write SetFloatVectorF;
    property FloatVectorFS[X, Y: Single]: TFloatVector read GetFloatVectorFS write
    SetFloatVectorFS;
  published
    property VectorCombineMode: TVectorCombineMode read FVectorCombineMode write
      SetVectorCombineMode;
    property OnVectorCombine: TVectorCombineEvent read FOnVectorCombine write FOnVectorCombine;
  end;

const
  BUCKET_MASK = $FF;
  BUCKET_COUNT = BUCKET_MASK + 1; // 256 buckets by default

type
  PPItem = ^PItem;
  PItem = Pointer;

  PPData = ^PData;
  PData = Pointer;

  PPointerBucketItem = ^TPointerBucketItem;
  TPointerBucketItem = record
    Item: PItem;
    Data: PData;
  end;
  TPointerBucketItemArray = array of TPointerBucketItem;

  TPointerBucket = record
    Count: Integer;
    Items: TPointerBucketItemArray;
  end;
  TPointerBucketArray = array[0..BUCKET_MASK] of TPointerBucket;

  { TPointerMap }
  { Associative pointer map
    Inspired by TBucketList, which is not available on D5/CB5, it is
    reimplemented from scratch, simple, optimized and light-weight.
    Not thread-safe. Does use exceptions only for Data property. }
  TPointerMap = class
  private
    FBuckets: TPointerBucketArray;
    FCount: Integer;
  protected
    function GetData(Item: PItem): PData;
    procedure SetData(Item: PItem; const Data: PData);
    function Exists(Item: Pointer; out BucketIndex, ItemIndex: Integer): Boolean;
    function Delete(BucketIndex, ItemIndex: Integer): PData; virtual;
  public
    destructor Destroy; override;
    function Add(NewItem: PItem): PPData; overload;
    function Add(NewItem: PItem; out IsNew: Boolean): PPData; overload;
    function Add(NewItem: PItem; NewData: PData): PPData; overload;
    function Add(NewItem: PItem; NewData: PData; out IsNew: Boolean): PPData; overload;
    function Remove(Item: PItem): PData;
    procedure Clear;
    function Contains(Item: PItem): Boolean;
    function Find(Item: PItem; out Data: PPData): Boolean;
    property Data[Item: PItem]: PData read GetData write SetData; default;
    property Count: Integer read FCount;
  end;

  { TPointerMapIterator }
  { Iterator object for the associative pointer map
    See below for usage example... }
  TPointerMapIterator = class
  private
    FSrcPointerMap: TPointerMap;
    FItem: PItem;
    FData: PData;
    FCurBucketIndex: Integer;
    FCurItemIndex: Integer;
  public
    constructor Create(SrcPointerMap: TPointerMap);
    function Next: Boolean;
    property Item: PItem read FItem;
    property Data: PData read FData;
  end;
  {
    USAGE EXAMPLE:
    --------------
    with TPointerMapIterator.Create(MyPointerMap) do
    try
      while Next do
      begin
        // do something with Item and Data here...
      end;
    finally
      Free;
    end;
  }

  PPolyRects = ^TPolyRects;
  TPolyRects = array[0..Maxint div 32 - 1] of TRect;

  { TRectList }
  { List that holds Rects
    Do not reuse TList due to pointer structure.
    A direct structure is more memory efficient.
    stripped version of TList blatantly stolen from Classes.pas }
  TRectList = class
  private
    FList: PPolyRects;
    FCount: Integer;
    FCapacity: Integer;
  protected
    function Get(Index: Integer): PRect;
    procedure Grow; virtual;
    procedure SetCapacity(NewCapacity: Integer);
    procedure SetCount(NewCount: Integer);
  public
    destructor Destroy; override;
    function Add(const Rect: TRect): Integer;
    procedure Clear; virtual;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function IndexOf(const Rect: TRect): Integer;
    procedure Insert(Index: Integer; const Rect: TRect);
    procedure Move(CurIndex, NewIndex: Integer);
    function Remove(const Rect: TRect): Integer;
    procedure Pack;
    property Capacity: Integer read FCapacity write SetCapacity;
    property Count: Integer read FCount write SetCount;
    property Items[Index: Integer]: PRect read Get; default;
    property List: PPolyRects read FList;
  end;

  { TClassList }
  { This is a class that maintains a list of classes. }
  TClassList = class(TList)
  protected
    function GetItems(Index: Integer): TClass;
    procedure SetItems(Index: Integer; AClass: TClass);
  public
    function Add(AClass: TClass): Integer;
    function Extract(Item: TClass): TClass;
    function Remove(AClass: TClass): Integer;
    function IndexOf(AClass: TClass): Integer;
    function First: TClass;
    function Last: TClass;
    function Find(AClassName: string): TClass;
    procedure GetClassNames(Strings: TStrings);
    procedure Insert(Index: Integer; AClass: TClass);
    property Items[Index: Integer]: TClass read GetItems write SetItems; default;
  end;

procedure SmartAssign(Src, Dst: TPersistent; TypeKinds: TTypeKinds = tkProperties);

const
  { Layer Options Bits }
  LOB_VISIBLE = $80000000; // 31-st bit
  LOB_GDI_OVERLAY = $40000000; // 30-th bit
  LOB_MOUSE_EVENTS = $20000000; // 29-th bit
  LOB_NO_UPDATE = $10000000; // 28-th bit
  LOB_NO_CAPTURE = $08000000; // 27-th bit
  LOB_INVALID = $04000000; // 26-th bit
  LOB_FORCE_UPDATE = $02000000; // 25-th bit
  LOB_RESERVED_24 = $01000000; // 24-th bit
  LOB_RESERVED_MASK = $FF000000;

type
  //  TCnsCustomLayer = class;
  //  TLayerClass = class of TCnsCustomLayer;

    { TCoordXForm - transformations from bitmap image to buffer origin }
  TCoordXForm = record
    ScaleX: TFixed; // bitmap image to buf
    ScaleY: TFixed;
    ShiftX: Integer;
    ShiftY: Integer;
    RevScaleX: TFixed;
    RevScaleY: TFixed;
  end;
  PCoordXForm = ^TCoordXForm;

type
  TAssignColor = procedure(var Dst: TColor32; Src: TColor32) of object;

  PCombineInfo = ^TCombineInfo;
  TCombineInfo = record
    SrcAlpha: Integer;
    DrawMode: TDrawMode;
    CombineMode: TCombineMode;
    CombineCallBack: TPixelCombineEvent;
    TransparentColor: TColor32;
  end;

type
  { TRasterizer }
  { A base class for TCnsBitmap32-specific rasterizers. }
  TRasterizer = class(TThreadPersistent)
  private
    FSampler: TCustomSampler;
    FSrcAlpha: Integer;
    FBlendMemEx: TBlendMemEx;
    FCombineCallBack: TPixelCombineEvent;
    FAssignColor: TAssignColor;
    FTransparentColor: TColor32;
    procedure SetSampler(const Value: TCustomSampler);
    procedure AssignColorOpaque(var Dst: TColor32; Src: TColor32);
    procedure AssignColorBlend(var Dst: TColor32; Src: TColor32);
    procedure AssignColorCustom(var Dst: TColor32; Src: TColor32);
    procedure AssignColorTransparent(var Dst: TColor32; Src: TColor32);
  protected
    procedure AssignTo(Dst: TPersistent); override;
    procedure DoRasterize(Dst: TCnsBitmap32; DstRect: TRect); virtual; abstract;
    procedure Rasterize(Dst: TCnsBitmap32; const DstRect: TRect; SrcAlpha: TColor32;
      DrawMode: TDrawMode; CombineMode: TCombineMode;
      CombineCallBack: TPixelCombineEvent); overload;
    property AssignColor: TAssignColor read FAssignColor write FAssignColor;
  public
    procedure Rasterize(Dst: TCnsBitmap32); overload;
    procedure Rasterize(Dst: TCnsBitmap32; const DstRect: TRect); overload;
    procedure Rasterize(Dst: TCnsBitmap32; const DstRect: TRect; const CombineInfo: TCombineInfo);
      overload;
    procedure Rasterize(Dst: TCnsBitmap32; const DstRect: TRect; Src: TCnsBitmap32); overload;
  published
    property Sampler: TCustomSampler read FSampler write SetSampler;
  end;

  TRasterizerClass = class of TRasterizer;

  { TRegularSamplingRasterizer }
  { This rasterizer simply picks one sample for each pixel in the output bitmap. }
  TRegularRasterizer = class(TRasterizer)
  private
    FUpdateRowCount: Integer;
  protected
    procedure DoRasterize(Dst: TCnsBitmap32; DstRect: TRect); override;
  public
    constructor Create; override;
  published
    property UpdateRowCount: Integer read FUpdateRowCount write FUpdateRowCount;
  end;

  { TSwizzlingRasterizer }
  { An interesting rasterization method where sample locations are choosen
    according to a fractal pattern called 'swizzling'. With a slight
    modification to the algorithm this routine will actually yield the
    well-known sierpinski triangle fractal. An advantage with this pattern
    is that it may benefit from local coherency in the sampling method used. }
  TSwizzlingRasterizer = class(TRasterizer)
  private
    FBlockSize: Integer;
    procedure SetBlockSize(const Value: Integer);
  protected
    procedure DoRasterize(Dst: TCnsBitmap32; DstRect: TRect); override;
  public
    constructor Create; override;
  published
    property BlockSize: Integer read FBlockSize write SetBlockSize default 3;
  end;

  { TProgressiveRasterizer }
  { This class will perform rasterization in a progressive manner. It performs
    subsampling with a block size of 2^n and will successively decrease n in
    each iteration until n equals zero.  }
  TProgressiveRasterizer = class(TRasterizer)
  private
    FSteps: Integer;
    FUpdateRows: Boolean;
    procedure SetSteps(const Value: Integer);
    procedure SetUpdateRows(const Value: Boolean);
  protected
    procedure DoRasterize(Dst: TCnsBitmap32; DstRect: TRect); override;
  public
    constructor Create; override;
  published
    property Steps: Integer read FSteps write SetSteps default 4;
    property UpdateRows: Boolean read FUpdateRows write SetUpdateRows default True;
  end;

  { TTesseralRasterizer }
  { This is a recursive rasterization method. It uses a divide-and-conquer
    scheme to subdivide blocks vertically and horizontally into smaller blocks. }
  TTesseralRasterizer = class(TRasterizer)
  protected
    procedure DoRasterize(Dst: TCnsBitmap32; DstRect: TRect); override;
  end;

  { TContourRasterizer }
  TContourRasterizer = class(TRasterizer)
  protected
    procedure DoRasterize(Dst: TCnsBitmap32; DstRect: TRect); override;
  end;

  { Auxiliary routines }
function CombineInfo(Bitmap: TCnsBitmap32): TCombineInfo;

var
  DefaultRasterizerClass: TRasterizerClass = TRegularRasterizer;

  { Basic processing }
type
  TLUT8 = array[Byte] of Byte;

procedure AlphaToGrayscale(Dst, Src: TCnsBitmap32);
procedure IntensityToAlpha(Dst, Src: TCnsBitmap32);
procedure Invert(Dst, Src: TCnsBitmap32);
procedure InvertRGB(Dst, Src: TCnsBitmap32);
procedure ColorToGrayscale(Dst, Src: TCnsBitmap32; PreserveAlpha: Boolean = False);
procedure ApplyLUT(Dst, Src: TCnsBitmap32; const LUT: TLUT8; PreserveAlpha: Boolean = False);
procedure CromaKey(ABitmap: TCnsBitmap32; TrColor: TColor32);

procedure CheckParams(Dst, Src: TCnsBitmap32);

{ ClipLine }
{ Clips the (X1, Y1)-(X2,Y2) line to the rectangle using Sutherland-Cohen Line
  Clipping Algorithm }
function ClipLine(var X1, Y1, X2, Y2: Integer; MinX, MinY, MaxX, MaxY: Integer): Boolean;

const
  MICROTILE_SHIFT = 5;
  MICROTILE_SIZE = 1 shl MICROTILE_SHIFT;

  MICROTILE_EMPTY = 0;
  // MICROTILE_EMPTY -> Left: 0, Top: 0, Right:  0, Bottom:  0

  MICROTILE_FULL = MICROTILE_SIZE shl 8 or MICROTILE_SIZE;
  // MICROTILE_FULL -> Left: 0, Top: 0, Right: MICROTILE_SIZE, Bottom: MICROTILE_SIZE

  {$IFDEF MICROTILES_DEBUGDRAW}
  clDebugDrawFill = TColor32($30FF0000);
  clDebugDrawFrame = TColor32($90FF0000);
  {$ENDIF}

type
  PMicroTile = ^TMicroTile;
  TMicroTile = type Integer;

  PMicroTileArray = ^TMicroTileArray;
  TMicroTileArray = array[0..MaxListSize - 1] of TMicroTile;

  PPMicroTiles = ^PMicroTiles;
  PMicroTiles = ^TMicroTiles;
  TMicroTiles = record
    BoundsRect: TRect;
    Columns, Rows: Integer;
    BoundsUsedTiles: TRect;
    Count: Integer;
    Tiles: PMicroTileArray;
  end;

  // MicroTile auxiliary routines
function MakeMicroTile(const Left, Top, Right, Bottom: Integer): TMicroTile;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function MicroTileHeight(const Tile: TMicroTile): Integer;
{$IFDEF USEINLINING}inline;
{$ENDIF}
function MicroTileWidth(const Tile: TMicroTile): Integer;
{$IFDEF USEINLINING}inline;
{$ENDIF}

var
  MicroTileUnion: procedure(var DstTile: TMicroTile; const SrcTile: TMicroTile);

  // MicroTiles auxiliary routines
function MakeEmptyMicroTiles: TMicroTiles;
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure MicroTilesCreate(var MicroTiles: TMicroTiles);
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure MicroTilesDestroy(var MicroTiles: TMicroTiles);
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure MicroTilesSetSize(var MicroTiles: TMicroTiles; const DstRect: TRect);
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure MicroTilesClear(var MicroTiles: TMicroTiles; const Value: TMicroTile = MICROTILE_EMPTY);
{$IFDEF USEINLINING}inline;
{$ENDIF}
procedure MicroTilesClearUsed(var MicroTiles: TMicroTiles; const Value: TMicroTile =
  MICROTILE_EMPTY);
procedure MicroTilesCopy(var DstTiles: TMicroTiles; SrcTiles: TMicroTiles);
procedure MicroTilesAddLine(var MicroTiles: TMicroTiles; X1, Y1, X2, Y2: Integer; LineWidth:
  Integer; RoundToWholeTiles: Boolean = False);
procedure MicroTilesAddRect(var MicroTiles: TMicroTiles; Rect: TRect; RoundToWholeTiles: Boolean =
  False);
procedure MicroTilesUnion(var DstTiles: TMicroTiles; const SrcTiles: TMicroTiles;
  RoundToWholeTiles: Boolean = False);
function MicroTilesCalcRects(const MicroTiles: TMicroTiles; DstRects: TRectList; CountOnly: Boolean
  = False; RoundToWholeTiles: Boolean = False): Integer; overload;
function MicroTilesCalcRects(const MicroTiles: TMicroTiles; DstRects: TRectList; const Clip: TRect;
  CountOnly: Boolean = False; RoundToWholeTiles: Boolean = False): Integer; overload;
function MicroTilesCountEmptyTiles(const MicroTiles: TMicroTiles): Integer;

type
  { TMicroTilesMap }
  { associative array that is used to map Layers to their MicroTiles }
  TMicroTilesMap = class(TPointerMap)
  private
    function GetData(Item: Pointer): PMicroTiles;
    procedure SetData(Item: Pointer; const Data: PMicroTiles);
  protected
    function Delete(BucketIndex: Integer; ItemIndex: Integer): Pointer; override;
  public
    function Add(Item: Pointer): PPMicroTiles;
    property Data[Item: Pointer]: PMicroTiles read GetData write SetData; default;
  end;

procedure _MicroTileUnion(var DstTile: TMicroTile; const SrcTile: TMicroTile);
procedure M_MicroTileUnion(var DstTile: TMicroTile; const SrcTile: TMicroTile);
procedure _MicroTilesUnion(var DstTiles: TMicroTiles; const SrcTiles: TMicroTiles);
procedure M_MicroTilesUnion(var DstTiles: TMicroTiles; const SrcTiles: TMicroTiles);

// differs from InflateRect in the way that it does also handle negative rects
procedure InflateArea(var Area: TRect; Dx, Dy: Integer);

type
  TBlendLineProc = procedure(Src, Dst: PColor32; Count: Integer);

const
  { Paint Stage Constants }
  PST_CUSTOM = 1; // Calls OnPaint with # of current stage in parameter
  PST_CLEAR_BUFFER = 2; // Clears the buffer
  PST_CLEAR_BACKGND = 3; // Clears a visible buffer area
  PST_DRAW_BITMAP = 4; // Draws a bitmap
  PST_DRAW_LAYERS = 5; // Draw layers (Parameter = Layer Mask)
  PST_CONTROL_FRAME = 6; // Draws a dotted frame around the control
  PST_BITMAP_FRAME = 7; // Draws a dotted frame around the scaled bitmap
const
  UnitXForm: TCoordXForm = (
    ScaleX: $10000;
    ScaleY: $10000;
    ShiftX: 0;
    ShiftY: 0;
    RevScaleX: 65536;
    RevScaleY: 65536);

type
  TPaintStageEvent = procedure(Sender: TObject; Buffer: TCnsBitmap32; StageNum: Cardinal) of
    object;

  { TPaintStage }
  PPaintStage = ^TPaintStage;
  TPaintStage = record
    DsgnTime: Boolean;
    RunTime: Boolean;
    Stage: Cardinal; // a PST_* constant
    Parameter: Cardinal; // an optional parameter
  end;

  { TCnsPaintStages }
  TCnsPaintStages = class
  private
    FItems: array of TPaintStage;
    function GetItem(Index: Integer): PPaintStage;
  public
    destructor Destroy; override;
    function Add: PPaintStage;
    procedure Clear;
    function Count: Integer;
    procedure Delete(Index: Integer);
    function Insert(Index: Integer): PPaintStage;
    property Items[Index: Integer]: PPaintStage read GetItem; default;
  end;

  { Alignment of the bitmap in TCnsCustomImage32 }
  TBitmapAlign = (baTopLeft, baCenter, baTile, baCustom);
  TScaleMode = (smNormal, smStretch, smScale, smResize, smOptimal, smOptimalScaled);
  TPaintBoxOptions = set of (pboWantArrowKeys, pboAutoFocus);

  TRepaintMode = (rmFull, rmDirect, rmOptimizer);

  { TCnsCustomPaintBox32 }
  TCnsCustomPaintBox32 = class(TCustomControl)
  private
    FBuffer: TCnsBitmap32;
    FBufferOversize: Integer;
    FBufferValid: Boolean;

    FOptions: TPaintBoxOptions;
    FOnGDIOverlay: TNotifyEvent;
    FMouseInControl: Boolean;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    procedure SetBufferOversize(Value: Integer);
    {$IFNDEF CLX}
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
    procedure WMGetDlgCode(var Msg: TWmGetDlgCode); message WM_GETDLGCODE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMInvalidate(var Message: TMessage); message CM_INVALIDATE;
    procedure WMPaint(var Message: TMessage); message WM_PAINT;
    {$ENDIF}
    procedure DirectAreaUpdateHandler(Sender: TObject; const Area: TRect; const Info: Cardinal);
  protected
    function InvalidRectsAvailable: Boolean; virtual;
    procedure DoPaintBuffer; virtual;
    procedure DoPaintGDIOverlay; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    {$IFDEF CLX}
    procedure MouseEnter(AControl: TControl); override;
    procedure MouseLeave(AControl: TControl); override;
    {$ELSE}
    procedure MouseEnter; virtual;
    procedure MouseLeave; virtual;
    {$ENDIF}
    procedure Paint; override;
    procedure ResizeBuffer;
    property BufferValid: Boolean read FBufferValid write FBufferValid;
    //    property InvalidRects: TRectList read FInvalidRects;
    {$IFDEF CLX}
    function WidgetFlags: Integer; override;
    {$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetViewportRect: TRect; virtual;
    procedure Flush; overload;
    procedure Flush(const SrcRect: TRect); overload;
    procedure Invalidate; override;
    procedure Loaded; override;
    procedure Resize; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    property Buffer: TCnsBitmap32 read FBuffer;
    property BufferOversize: Integer read FBufferOversize write SetBufferOversize;
    property Options: TPaintBoxOptions read FOptions write FOptions default [];
    property MouseInControl: Boolean read FMouseInControl write fMouseInControl;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnGDIOverlay: TNotifyEvent read FOnGDIOverlay write FOnGDIOverlay;
  end;

  { TCnsCustomImage32 }
{  TImgMouseEvent = procedure(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer; Layer: TCnsCustomLayer) of object;
  TImgMouseMoveEvent = procedure(Sender: TObject; Shift: TShiftState;
    X, Y: Integer; Layer: TCnsCustomLayer) of object;}
  TPaintStageHandler = procedure(Dest: TCnsBitmap32; StageNum: Integer) of object;

  TCnsCustomImage32 = class(TCnsCustomPaintBox32)
  private
    FSelected: Boolean;

    FScaleChanged: Boolean;

    fInUndating: Boolean;

    FBitmap: TCnsBitmap32;
    FBitmapAlign: TBitmapAlign;
    //    FLayers: TLayerCollection;
    FOffsetHorz: Single;
    FOffsetVert: Single;
    FPaintStages: TCnsPaintStages;
    FPaintStageHandlers: array of TPaintStageHandler;
    FPaintStageNum: array of Integer;
    FScaleX: Single;
    FScaleY: Single;
    FScaleMode: TScaleMode;
    FUpdateCount: Integer;
    FOnBitmapResize: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FOnInitStages: TNotifyEvent;
    //    FOnMouseDown: TImgMouseEvent;
    //    FOnMouseMove: TImgMouseMoveEvent;
    //    FOnMouseUp: TImgMouseEvent;
    FOnPaintStage: TPaintStageEvent;
    FOnScaleChange: TNotifyEvent;
    FWhiteGrid: Boolean;
    FBitmapModify: Boolean;
    procedure BitmapResizeHandler(Sender: TObject);
    function GetOnPixelCombine: TPixelCombineEvent;
    procedure SetBitmap(Value: TCnsBitmap32);
    {$IFDEF CLX} reintroduce;
    {$ENDIF}
    procedure SetBitmapAlign(Value: TBitmapAlign);
    procedure SetOnPixelCombine(Value: TPixelCombineEvent);
    procedure SetWhiteGrid(const Value: Boolean);
    procedure SetBitmapModify(const Value: Boolean);
  protected
    CachedXForm: TCoordXForm;
    CacheValid: Boolean;
    OldSzX, OldSzY: Integer;
    PaintToMode: Boolean;
    procedure SetOffsetHorz(Value: Single); virtual;
    procedure SetOffsetVert(Value: Single); virtual;
    procedure SetScale(Value: Single); virtual;
    procedure SetScaleX(Value: Single); virtual;
    procedure SetScaleY(Value: Single); virtual;
    procedure BitmapResized; virtual;
    procedure BitmapChanged(const Area: TRect); virtual;
    {$IFNDEF CLX}
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    {$ENDIF}
    procedure DoInitStages; virtual;
    procedure DoPaintBuffer; override;
    procedure DoPaintGDIOverlay; override;
    procedure DoScaleChange; virtual;
    procedure InitDefaultStages; virtual;
    procedure InvalidateCache;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    {$IFDEF CLX}
    procedure MouseLeave(AControl: TControl); override;
    {$ELSE}
    procedure MouseLeave; override;
    {$ENDIF}
    procedure SetScaleMode(Value: TScaleMode); virtual;
    procedure UpdateCache;
    procedure SetSelected(Value: Boolean);
    property UpdateCount: Integer read FUpdateCount;
  public
    CachedBitmapRect: TRect;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property InUndating: Boolean read fInUndating;
    procedure SetView(AOffsetVert, AOffsetHorz: Single); virtual;
    procedure BeginUpdate; virtual;
    function BitmapToControl(const APoint: TPoint): TPoint;
    procedure Changed; virtual;
    function ControlToBitmap(const APoint: TPoint): TPoint;
    procedure EndUpdate; virtual;
    procedure ExecBitmapFrame(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_BITMAP_FRAME
    procedure ExecClearBuffer(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_CLEAR_BUFFER
    procedure ExecClearBackgnd(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_CLEAR_BACKGND
    procedure ExecControlFrame(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_CONTROL_FRAME
    procedure ExecCustom(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_CUSTOM
    procedure ExecDrawBitmap(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_DRAW_BITMAP
    procedure ExecDrawLayers(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_DRAW_LAYERS
    function GetBitmapRect: TRect; virtual;
    function GetBitmapSize: TSize; virtual;
    procedure Invalidate; override;
    procedure Loaded; override;
    procedure PaintTo(Dest: TCnsBitmap32; DestRect: TRect); virtual;
    procedure Resize; override;
    procedure SetupBitmap(DoClear: Boolean = False; ClearColor: TColor32 = $FF000000); virtual;
    property Bitmap: TCnsBitmap32 read FBitmap write SetBitmap;
    property BitmapAlign: TBitmapAlign read FBitmapAlign write SetBitmapAlign;
    property Canvas;
    property Selected: Boolean read FSelected write SetSelected;
    property WhiteGrid: Boolean read FWhiteGrid write SetWhiteGrid;
    //    property Layers: TLayerCollection read FLayers write SetLayers;
    property OffsetHorz: Single read FOffsetHorz write SetOffsetHorz;
    property OffsetVert: Single read FOffsetVert write SetOffsetVert;
    property PaintStages: TCnsPaintStages read FPaintStages;
    property Scale: Single read FScaleX write SetScale;
    property ScaleX: Single read FScaleX write SetScaleX;
    property ScaleY: Single read FScaleY write SetScaleY;
    property ScaleMode: TScaleMode read FScaleMode write SetScaleMode;
    property BitmapModify: Boolean read FBitmapModify write SetBitmapModify;
    property OnBitmapResize: TNotifyEvent read FOnBitmapResize write FOnBitmapResize;
    property OnBitmapPixelCombine: TPixelCombineEvent read GetOnPixelCombine write
      SetOnPixelCombine;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnInitStages: TNotifyEvent read FOnInitStages write FOnInitStages;
    //    property OnMouseDown: TImgMouseEvent read FOnMouseDown write FOnMouseDown;
    //    property OnMouseMove: TImgMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    //    property OnMouseUp: TImgMouseEvent read FOnMouseUp write FOnMouseUp;
    property OnPaintStage: TPaintStageEvent read FOnPaintStage write FOnPaintStage;
    property OnScaleChange: TNotifyEvent read FOnScaleChange write FOnScaleChange;
  end;

  { TCnsBitmap32Item }
  { A bitmap container designed to be inserted into TCnsBitmap32Collection }
  TCnsBitmap32Item = class(TCollectionItem)
  private
    FBitmap: TCnsBitmap32;
    FInstanceUID: string;
    procedure SetBitmap(ABitmap: TCnsBitmap32);
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property InstanceUID: string read FInstanceUID write FInstanceUID;
  published
    property Bitmap: TCnsBitmap32 read FBitmap write SetBitmap;
  end;

  TBitmap32ItemClass = class of TCnsBitmap32Item;

  TCnsBitmap32ExItem = class(TCnsBitmap32Item)
  private
    FScale: Single;
    FOffsetHorz: Integer;
    FOffsetVert: Integer;
    FDestRect: TRect;
    FDescription: string;
    FOrderID: Integer;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure DrawTo(Dst: TCnsBitmap32; const DstRect: TRect);
    property OrderID: Integer read FOrderID write FOrderID;
    property Description: string read FDescription write FDescription;
    property Scale: Single read FScale write FScale;
    property OffsetHorz: Integer read FOffsetHorz write FOffsetHorz;
    property OffsetVert: Integer read FOffsetVert write FOffsetVert;
    property DestRect: TRect read FDestRect write FDestRect;
  end;

  { TCnsBitmap32Collection }
  { A collection of TCnsBitmap32Item objects }
  TCnsBitmap32Collection = class(TCollection)
  private
    FOwner: TPersistent;
    function GetItem(Index: Integer): TCnsBitmap32Item;
    procedure SetItem(Index: Integer; Value: TCnsBitmap32Item);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TPersistent; ItemClass: TBitmap32ItemClass);
    function Add: TCnsBitmap32Item;
    property Items[Index: Integer]: TCnsBitmap32Item read GetItem write SetItem; default;
  end;

  { TBitmap32List }
  { A component that stores TCnsBitmap32Collection }
  TCnsBitmap32List = class(TComponent)
  private
    FBitmap32Collection: TCnsBitmap32Collection;
    procedure SetBitmap(Index: Integer; Value: TCnsBitmap32);
    function GetBitmap(Index: Integer): TCnsBitmap32;
    procedure SetBitmap32Collection(Value: TCnsBitmap32Collection);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Bitmap[Index: Integer]: TCnsBitmap32 read GetBitmap write SetBitmap; default;
  published
    property Bitmaps: TCnsBitmap32Collection read FBitmap32Collection write SetBitmap32Collection;
  end;

  {$IFDEF CLX}
const
  DFCS_INACTIVE = $100;
  DFCS_PUSHED = $200;
  DFCS_FLAT = $4000;
  DFCS_SCROLLUP = 0;
  DFCS_SCROLLDOWN = 1;
  DFCS_SCROLLLEFT = 2;
  DFCS_SCROLLRIGHT = 3;
  {$ENDIF}

type
  TRBDirection = (drLeft, drUp, drRight, drDown);
  TRBDirections = set of TRBDirection;
  TRBZone = (zNone, zBtnPrev, zTrackPrev, zHandle, zTrackNext, zBtnNext);
  TRBStyle = (rbsDefault, rbsMac);
  TRBBackgnd = (bgPattern, bgSolid);
  TRBGetSizeEvent = procedure(Sender: TObject; var Size: Integer) of object;

  TArrowBar = class(TCustomControl)
  private
    FBackgnd: TRBBackgnd;
    FBorderStyle: TBorderStyle;
    FButtonSize: Integer;
    FHandleColor: TColor;
    FButtoncolor: TColor;
    FHighLightColor: TColor;
    FShadowColor: TColor;
    FBorderColor: TColor;
    FKind: TScrollBarKind;
    FShowArrows: Boolean;
    FShowHandleGrip: Boolean;
    FStyle: TRBStyle;
    FOnChange: TNotifyEvent;
    FOnUserChange: TNotifyEvent;
    procedure SetButtonSize(Value: Integer);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetHandleColor(Value: TColor);
    procedure SetHighLightColor(Value: TColor);
    procedure SetShadowColor(Value: TColor);
    procedure SetButtonColor(Value: TColor);
    procedure SetBorderColor(Value: TColor);
    procedure SetKind(Value: TScrollBarKind);
    procedure SetShowArrows(Value: Boolean);
    procedure SetShowHandleGrip(Value: Boolean);
    procedure SetStyle(Value: TRBStyle);
    procedure SetBackgnd(Value: TRBBackgnd);
    {$IFNDEF CLX}
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
    {$ENDIF}
  protected
    GenChange: Boolean;
    DragZone: TRBZone;
    HotZone: TRBZone;
    Timer: TTimer;
    TimerMode: Integer;
    StoredX, StoredY: Integer;
    PosBeforeDrag: Single;
    procedure DoChange; virtual;
    procedure DoDrawButton(R: TRect; Direction: TRBDirection; Pushed, Enabled, Hot: Boolean);
      virtual;
    procedure DoDrawHandle(R: TRect; Horz: Boolean; Pushed, Hot: Boolean); virtual;
    procedure DoDrawTrack(R: TRect; Direction: TRBDirection; Pushed, Enabled, Hot: Boolean);
      virtual;
    {$IFNDEF CLX}
    procedure DrawNCArea(ADC: HDC; const Clip: HRGN); dynamic;
    {$ENDIF}
    function DrawEnabled: Boolean; virtual;
    function GetBorderSize: Integer;
    function GetHandleRect: TRect; virtual;
    function GetButtonSize: Integer;
    function GetTrackBoundary: TRect;
    function GetZone(X, Y: Integer): TRBZone;
    function GetZoneRect(Zone: TRBZone): TRect;
    {$IFDEF CLX}
    procedure MouseLeave(AControl: TControl); override;
    procedure EnabledChanged; override;
    function WidgetFlags: Integer; override;
    {$ENDIF}
    procedure MouseLeft; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure StartDragTracking;
    procedure StartHotTracking;
    procedure StopDragTracking;
    procedure StopHotTracking;
    procedure TimerHandler(Sender: TObject); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    property Color default clScrollBar;
    property Backgnd: TRBBackgnd read FBackgnd write SetBackgnd;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property ButtonSize: Integer read FButtonSize write SetButtonSize default 0;
    property HandleColor: TColor read FHandleColor write SetHandleColor default clBtnShadow;
    property ButtonColor: TColor read FButtonColor write SetButtonColor default clBtnFace;
    property HighLightColor: TColor read FHighLightColor write SetHighLightColor default
      clBtnHighlight;
    property ShadowColor: TColor read FShadowColor write SetShadowColor default clBtnShadow;
    property BorderColor: TColor read FBorderColor write SetBorderColor default clWindowFrame;
    property Kind: TScrollBarKind read FKind write SetKind default sbHorizontal;
    property ShowArrows: Boolean read FShowArrows write SetShowArrows default True;
    property ShowHandleGrip: Boolean read FShowHandleGrip write SetShowHandleGrip;
    property Style: TRBStyle read FStyle write SetStyle default rbsDefault;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnUserChange: TNotifyEvent read FOnUserChange write FOnUserChange;
  end;

  TRBIncrement = 1..32768;

  TCnsCustomRangeBar = class(TArrowBar)
  private
    FCentered: Boolean;
    FEffectiveWindow: Integer;
    FIncrement: TRBIncrement;
    FPosition: Single;
    FRange: Integer;
    FWindow: Integer;
    function IsPositionStored: Boolean;
    procedure SetPosition(Value: Single);
    procedure SetRange(Value: Integer);
    procedure SetWindow(Value: Integer);
  protected
    procedure AdjustPosition;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      {$IFDEF CLX}const{$ENDIF}MousePos: TPoint): Boolean; override;
    function DrawEnabled: Boolean; override;
    function GetHandleRect: TRect; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure TimerHandler(Sender: TObject); override;
    procedure UpdateEffectiveWindow;
    property EffectiveWindow: Integer read FEffectiveWindow;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Resize; override;
    procedure SetParams(NewRange, NewWindow: Integer);
    property Centered: Boolean read FCentered write FCentered;
    property Increment: TRBIncrement read FIncrement write FIncrement default 8;
    property Position: Single read FPosition write SetPosition stored IsPositionStored;
    property Range: Integer read FRange write SetRange default 0;
    property Window: Integer read FWindow write SetWindow default 0;
  end;

  TRangeBar = class(TCnsCustomRangeBar)
  published
    property Align;
    property Anchors;
    property Constraints;
    property Color;
    property Backgnd;
    property BorderStyle;
    property ButtonSize;
    property Enabled;
    property HandleColor;
    property ButtonColor;
    property HighLightColor;
    property ShadowColor;
    property BorderColor;
    property Increment;
    property Kind;
    property Range;
    property Style;
    property Visible;
    property Window;
    property ShowArrows;
    property ShowHandleGrip;
    property Position; // this should be located after the Range property
    property OnChange;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheelUp;
    property OnMouseWheelDown;
    property OnStartDrag;
    property OnUserChange;
  end;

  TCustomGaugeBar = class(TArrowBar)
  private
    FHandleSize: Integer;
    FLargeChange: Integer;
    FMax: Integer;
    FMin: Integer;
    FPosition: Integer;
    FSmallChange: Integer;
    procedure SetHandleSize(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetMin(Value: Integer);
    procedure SetPosition(Value: Integer);
    procedure SetLargeChange(Value: Integer);
    procedure SetSmallChange(Value: Integer);
  protected
    procedure AdjustPosition;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      {$IFDEF CLX}const{$ENDIF}MousePos: TPoint): Boolean; override;
    function GetHandleRect: TRect; override;
    function GetHandleSize: Integer;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure TimerHandler(Sender: TObject); override;
  public
    constructor Create(AOwner: TComponent); override;
    property HandleSize: Integer read FHandleSize write SetHandleSize default 0;
    property LargeChange: Integer read FLargeChange write SetLargeChange default 1;
    property Max: Integer read FMax write SetMax default 100;
    property Min: Integer read FMin write SetMin default 0;
    property Position: Integer read FPosition write SetPosition;
    property SmallChange: Integer read FSmallChange write SetSmallChange default 1;
    property OnChange;
    property OnUserChange;
  end;

  TGaugeBar = class(TCustomGaugeBar)
  published
    property Align;
    property Anchors;
    property Constraints;
    property Color;
    property Backgnd;
    property BorderStyle;
    property ButtonSize;
    property Enabled;
    property HandleColor;
    property ButtonColor;
    property HighLightColor;
    property ShadowColor;
    property BorderColor;
    property HandleSize;
    property Kind;
    property LargeChange;
    property Max;
    property Min;
    property ShowArrows;
    property ShowHandleGrip;
    property Style;
    property SmallChange;
    property Visible;
    property Position;
    property OnChange;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property OnUserChange;
  end;

  { TArrowBarAccess }
  { This class is designed to facilitate access to
    properties of TArrowBar class when creating custom controls, which
    incorporate TArrowBar. It allows controlling up to two arrow bars.
    Master is used to read and write properties, slave - only to write.

    Well, maybe it is not so useful itself, but it is a common ancestor
    for TRangeBarAccess and TGaugeBarAccess classes, which work much the
    same way.

    When writing a new control, which uses TArrowBar, declare the bar as
    protected member, TArrowBarAccess as published property, and assign
    its Master to the arrow bar }
  TArrowBarAccess = class(TPersistent)
  private
    FMaster: TArrowBar;
    FSlave: TArrowBar;
    function GetBackgnd: TRBBackgnd;
    function GetButtonSize: Integer;
    function GetColor: TColor;
    function GetHandleColor: TColor;
    function GetHighLightColor: TColor;
    function GetButtonColor: TColor;
    function GetBorderColor: TColor;
    function GetShadowColor: TColor;
    function GetShowArrows: Boolean;
    function GetShowHandleGrip: Boolean;
    function GetStyle: TRBStyle;
    procedure SetBackgnd(Value: TRBBackgnd);
    procedure SetButtonSize(Value: Integer);
    procedure SetColor(Value: TColor);
    procedure SetHandleColor(Value: TColor);
    procedure SetShowArrows(Value: Boolean);
    procedure SetShowHandleGrip(Value: Boolean);
    procedure SetStyle(Value: TRBStyle);
    procedure SetHighLightColor(Value: TColor);
    procedure SetShadowColor(Value: TColor);
    procedure SetButtonColor(Value: TColor);
    procedure SetBorderColor(Value: TColor);
  public
    property Master: TArrowBar read FMaster write FMaster;
    property Slave: TArrowBar read FSlave write FSlave;
  published
    property Color: TColor read GetColor write SetColor default clScrollBar;
    property Backgnd: TRBBackgnd read GetBackgnd write SetBackgnd default bgPattern;
    property ButtonSize: Integer read GetButtonSize write SetButtonSize default 0;
    property HandleColor: TColor read GetHandleColor write SetHandleColor default clBtnShadow;
    property ButtonColor: TColor read GetButtonColor write SetButtonColor default clBtnFace;
    property HighLightColor: TColor read GetHighLightColor write SetHighLightColor default
      clBtnHighlight;
    property ShadowColor: TColor read GetShadowColor write SetShadowColor default clBtnShadow;
    property BorderColor: TColor read GetBorderColor write SetBorderColor default clWindowFrame;
    property ShowArrows: Boolean read GetShowArrows write SetShowArrows default True;
    property ShowHandleGrip: Boolean read GetShowHandleGrip write SetShowHandleGrip;
    property Style: TRBStyle read GetStyle write SetStyle;
  end;
  TCnsCustomImgView32 = class;
  TScrollBarVisibility = (svAlways, svHidden, svAuto);
  { TIVScrollProperties }
  TIVScrollProperties = class(TArrowBarAccess)
  private
    function GetIncrement: Integer;
    function GetSize: Integer;
    function GetVisibility: TScrollbarVisibility;
    procedure SetIncrement(Value: Integer);
    procedure SetSize(Value: Integer);
    procedure SetVisibility(const Value: TScrollbarVisibility);
  protected
    ImgView: TCnsCustomImgView32;
  published
    property Increment: Integer read GetIncrement write SetIncrement default 8;
    property Size: Integer read GetSize write SetSize default 0;
    property Visibility: TScrollBarVisibility read GetVisibility write SetVisibility default
      svAlways;
  end;

  TSizeGripStyle = (sgAuto, sgNone, sgAlways);
  TCnsCustomImgView32 = class(TCnsCustomImage32)
  private
    FCentered: Boolean;
    FScrollBarSize: Integer;
    FScrollBarVisibility: TScrollBarVisibility;
    FScrollBars: TIVScrollProperties;
    FSizeGrip: TSizeGripStyle;
    FOnScroll: TNotifyEvent;
    FOverSize: Integer;
    procedure SetCentered(Value: Boolean);
    procedure SetScrollBars(Value: TIVScrollProperties);
    procedure SetSizeGrip(Value: TSizeGripStyle);
    procedure SetOverSize(const Value: Integer);
  protected
    DisableScrollUpdate: Boolean;
    HScroll: TCnsCustomRangeBar;
    VScroll: TCnsCustomRangeBar;
    procedure AlignAll;
    procedure BitmapResized; override;
    procedure DoDrawSizeGrip(R: TRect);
    procedure DoScaleChange; override;
    procedure DoScroll; virtual;
    function GetScrollBarsVisible: Boolean;
    function GetScrollBarSize: Integer;
    function GetSizeGripRect: TRect;
    function IsSizeGripVisible: Boolean;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure Recenter;
    procedure SetScaleMode(Value: TScaleMode); override;
    procedure ScrollHandler(Sender: TObject); virtual;
    procedure UpdateImage; virtual;
    procedure UpdateScrollBars; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetViewportRect: TRect; override;
    procedure Loaded; override;
    procedure Resize; override;
    procedure ScrollToCenter(X, Y: Integer);
    procedure Scroll(Dx, Dy: Integer);
    property Centered: Boolean read FCentered write SetCentered default True;
    property ScrollBars: TIVScrollProperties read FScrollBars write SetScrollBars;
    property SizeGrip: TSizeGripStyle read FSizeGrip write SetSizeGrip default sgAuto;
    property OverSize: Integer read FOverSize write SetOverSize;
    property OnScroll: TNotifyEvent read FOnScroll write FOnScroll;
  end;

  TCnsImgView32 = class(TCnsCustomImgView32)
    property Align;
    property Anchors;
    {$IFNDEF CLX}
    property AutoSize;
    {$ENDIF}
    property Bitmap;
    property Centered;
    property Color;
    property Constraints;
    property Cursor;
    {$IFNDEF CLX}
    property DragCursor;
    {$ENDIF}
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property Scale;
    property ScrollBars;
    property ShowHint;
    property SizeGrip;
    property OverSize;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnBitmapResize;
    {$IFNDEF CLX}
    property OnCanResize;
    {$ENDIF}
    property OnClick;
    property OnChange;
    {$IFDEF DELPHI5}
    property OnContextPopup;
    {$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnGDIOverlay;
    property OnInitStages;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnPaintStage;
    property OnResize;
    property OnScroll;
    property OnStartDrag;
  end;

procedure ConvolveI(ray: array of integer; z: word; aBmp: TCnsBitmap32);
procedure ConvolveI5x5(ray: array of integer; z: word; aBmp: TCnsBitmap32);
procedure ConvolveBitmap(zz: Integer; aBmp: TCnsBitmap32);
procedure ApplyConv3x3(zz: Integer; Dst: TCnsBitmap32);



implementation

uses
  DCM32_Blend, DCM32_Transforms, DCM32_LowLevel, Math,
  DCM32_System,
  {$IFDEF CLX}
  QClipbrd,
  {$ELSE}
  Clipbrd,
  {$ENDIF}
  DCM32_Resamplers;

var
  {$IFDEF CLX}
  StockFont: TFont;
  {$ELSE}
  StockFont: HFONT;
  {$ENDIF}
  StockBitmap: TBitmap;

type
  TGraphicAccess = class(TGraphic);
  TRangeBarAccess = class(TRangeBar);

const
  ZERO_RECT: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);

  {$IFDEF CLX}

function StretchPixmap(DestPainter: QPainterH; DestX, DestY, DestWidth, DestHeight,
  SrcX, SrcY, SrcWidth, SrcHeight: Integer; SrcPixmap: QPixmapH): Integer;
var
  NewMatrix: QWMatrixH;
begin
  QPainter_saveWorldMatrix(DestPainter);
  try
    NewMatrix := QWMatrix_create(DestWidth / SrcWidth, 0, 0, DestHeight / SrcHeight, DestX, DestY);
    try
      QPainter_setWorldMatrix(DestPainter, NewMatrix, True);
      QPainter_drawPixmap(DestPainter, 0, 0, SrcPixmap, SrcX, SrcY, SrcWidth, SrcHeight);
    finally
      QWMatrix_destroy(NewMatrix);
    end;
  finally
    QPainter_restoreWorldMatrix(DestPainter);
  end;
  Result := 0;
end;
{$ENDIF}

{ Color construction and conversion functions }

function Color32(WinColor: TColor): TColor32; overload;
{$IFDEF WIN_COLOR_FIX}
var
  I: Longword;
  {$ENDIF}
begin
  {$IFDEF CLX}
  WinColor := ColorToRGB(WinColor);
  {$ELSE}
  if WinColor < 0 then
    WinColor := GetSysColor(WinColor and $000000FF);
  {$ENDIF}

  {$IFDEF WIN_COLOR_FIX}
  Result := $FF000000;
  I := (WinColor and $00FF0000) shr 16;
  if I <> 0 then
    Result := Result or TColor32(Integer(I) - 1);
  I := WinColor and $0000FF00;
  if I <> 0 then
    Result := Result or TColor32(Integer(I) - $00000100);
  I := WinColor and $000000FF;
  if I <> 0 then
    Result := Result or TColor32(Integer(I) - 1) shl 16;
  {$ELSE}
  asm
        MOV    EAX,WinColor
        BSWAP  EAX
        MOV    AL,$FF
        ROR    EAX,8
        MOV    Result,EAX
  end;
  {$ENDIF}
end;

function Color32(R, G, B: Byte; A: Byte = $FF): TColor32; overload;
asm
        MOV  AH,A
        SHL  EAX,16
        MOV  AH,DL
        MOV  AL,CL
end;

function Color32(Index: Byte; var Palette: TPalette32): TColor32; overload;
begin
  Result := Palette[Index];
end;

function Gray32(Intensity: Byte; Alpha: Byte = $FF): TColor32;
begin
  Result := TColor32(Alpha) shl 24 + TColor32(Intensity) shl 16 +
    TColor32(Intensity) shl 8 + TColor32(Intensity);
end;

function WinColor(Color32: TColor32): TColor;
asm
  // the alpha channel byte is set to zero!
        ROL    EAX,8  // ABGR  ->  BGRA
        XOR    AL,AL  // BGRA  ->  BGR0
        BSWAP  EAX    // BGR0  ->  0RGB
end;

function ArrayOfColor32(Colors: array of TColor32): TArrayOfColor32;
var
  L: Integer;
begin
  // build a dynamic color array from specified colors
  L := High(Colors) + 1;
  SetLength(Result, L);
  MoveLongword(Colors[0], Result[0], L);
end;

procedure Color32ToRGB(Color32: TColor32; var R, G, B: Byte);
begin
  R := (Color32 and $00FF0000) shr 16;
  G := (Color32 and $0000FF00) shr 8;
  B := Color32 and $000000FF;
end;

procedure Color32ToRGBA(Color32: TColor32; var R, G, B, A: Byte);
begin
  A := Color32 shr 24;
  R := (Color32 and $00FF0000) shr 16;
  G := (Color32 and $0000FF00) shr 8;
  B := Color32 and $000000FF;
end;

function RedComponent(Color32: TColor32): Integer;
begin
  Result := (Color32 and $00FF0000) shr 16;
end;

function GreenComponent(Color32: TColor32): Integer;
begin
  Result := (Color32 and $0000FF00) shr 8;
end;

function BlueComponent(Color32: TColor32): Integer;
begin
  Result := Color32 and $000000FF;
end;

function AlphaComponent(Color32: TColor32): Integer;
begin
  Result := Color32 shr 24;
end;

function Intensity(Color32: TColor32): Integer;
begin
  // (R * 61 + G * 174 + B * 21) / 256
  Result := (
    (Color32 and $00FF0000) shr 16 * 61 +
    (Color32 and $0000FF00) shr 8 * 174 +
    (Color32 and $000000FF) * 21
    ) shr 8;
end;

function SetAlpha(Color32: TColor32; NewAlpha: Integer): TColor32;
begin
  if NewAlpha < 0 then
    NewAlpha := 0
  else
    if NewAlpha > 255 then
    NewAlpha := 255;
  Result := (Color32 and $00FFFFFF) or (TColor32(NewAlpha) shl 24);
end;

{ Color space conversions }

function HSLtoRGB(H, S, L: Single): TColor32;
const
  OneOverThree = 1 / 3;
var
  M1, M2: Single;
  R, G, B: Byte;

  function HueToColor(Hue: Single): Byte;
  var
    V: Double;
  begin
    Hue := Hue - Floor(Hue);
    if 6 * Hue < 1 then
      V := M1 + (M2 - M1) * Hue * 6
    else
      if 2 * Hue < 1 then
      V := M2
    else
      if 3 * Hue < 2 then
      V := M1 + (M2 - M1) * (2 / 3 - Hue) * 6
    else
      V := M1;
    Result := Round(255 * V);
  end;

begin
  if S = 0 then
  begin
    R := Round(255 * L);
    G := R;
    B := R;
  end
  else
  begin
    if L <= 0.5 then
      M2 := L * (1 + S)
    else
      M2 := L + S - L * S;
    M1 := 2 * L - M2;
    R := HueToColor(H + OneOverThree);
    G := HueToColor(H);
    B := HueToColor(H - OneOverThree)
  end;
  Result := Color32(R, G, B, 255);
end;

procedure RGBtoHSL(RGB: TColor32; out H, S, L: Single);
var
  R, G, B, D, Cmax, Cmin: Single;
begin
  R := RedComponent(RGB) / 255;
  G := GreenComponent(RGB) / 255;
  B := BlueComponent(RGB) / 255;
  Cmax := Max(R, Max(G, B));
  Cmin := Min(R, Min(G, B));
  L := (Cmax + Cmin) / 2;

  if Cmax = Cmin then
  begin
    H := 0;
    S := 0
  end
  else
  begin
    D := Cmax - Cmin;
    if L < 0.5 then
      S := D / (Cmax + Cmin)
    else
      S := D / (2 - Cmax - Cmin);
    if R = Cmax then
      H := (G - B) / D
    else
      if G = Cmax then
      H := 2 + (B - R) / D
    else
      H := 4 + (R - G) / D;
    H := H / 6;
    if H < 0 then
      H := H + 1
  end;
end;

function HSLtoRGB(H, S, L: Integer): TColor32;
var
  V, M, M1, M2, VSF: Integer;
begin
  if L <= $7F then
    V := L * (256 + S) shr 8
  else
    V := L + S - L * S div 255;
  if V <= 0 then
    Result := Color32(0, 0, 0, 0)
  else
  begin
    M := L * 2 - V;
    H := H * 6;
    VSF := (V - M) * (H and $FF) shr 8;
    M1 := M + VSF;
    M2 := V - VSF;
    case H shr 8 of
      0: Result := Color32(V, M1, M, 0);
      1: Result := Color32(M2, V, M, 0);
      2: Result := Color32(M, V, M1, 0);
      3: Result := Color32(M, M2, V, 0);
      4: Result := Color32(M1, M, V, 0);
      5: Result := Color32(V, M, M2, 0);
    else
      Result := 0;
    end;
  end;
end;

function Max(const A, B, C: Integer): Integer; overload;
asm
      CMP       EDX,EAX
      db $0F,$4F,$C2           /// CMOVG     EAX,EDX
      CMP       ECX,EAX
      db $0F,$4F,$C1           /// CMOVG     EAX,ECX
end;

function Min(const A, B, C: Integer): Integer; overload;
asm
      CMP       EDX,EAX
      db $0F,$4C,$C2           /// CMOVL     EAX,EDX
      CMP       ECX,EAX
      db $0F,$4C,$C1           /// CMOVL     EAX,ECX
end;

procedure RGBtoHSL(RGB: TColor32; out H, S, L: Byte);
var
  R, G, B, D, Cmax, Cmin, HL: Integer;
begin
  R := (RGB shr 16) and $FF;
  G := (RGB shr 8) and $FF;
  B := RGB and $FF;

  Cmax := Max(R, G, B);
  Cmin := Min(R, G, B);
  L := (Cmax + Cmin) div 2;

  if Cmax = Cmin then
  begin
    H := 0;
    S := 0
  end
  else
  begin
    D := (Cmax - Cmin) * 255;
    if L <= $7F then
      S := D div (Cmax + Cmin)
    else
      S := D div (255 * 2 - Cmax - Cmin);

    D := D * 6;
    if R = Cmax then
      HL := (G - B) * 255 * 255 div D
    else
      if G = Cmax then
      HL := 255 * 2 div 6 + (B - R) * 255 * 255 div D
    else
      HL := 255 * 4 div 6 + (R - G) * 255 * 255 div D;

    if HL < 0 then
      HL := HL + 255 * 2;
    H := HL;
  end;
end;

{ Palette conversion }

{$IFNDEF CLX}

function WinPalette(const P: TPalette32): HPALETTE;
var
  L: TMaxLogPalette;
  L0: LOGPALETTE absolute L;
  I: Cardinal;
  Cl: TColor32;
begin
  L.palVersion := $300;
  L.palNumEntries := 256;
  for I := 0 to 255 do
  begin
    Cl := P[I];
    with L.palPalEntry[I] do
    begin
      peFlags := 0;
      peRed := RedComponent(Cl);
      peGreen := GreenComponent(Cl);
      peBlue := BlueComponent(Cl);
    end;
  end;
  Result := CreatePalette(l0);
end;
{$ENDIF}

{ Fixed-point conversion routines }

function Fixed(S: Single): TFixed;
begin
  Result := Round(S * 65536);
end;

function Fixed(I: Integer): TFixed;
begin
  Result := I shl 16;
end;

{ Points }

function Point(X, Y: Integer): TPoint;
begin
  Result.X := X;
  Result.Y := Y;
end;

function Point(const FP: TFloatPoint): TPoint;
begin
  Result.X := Round(FP.X);
  Result.Y := Round(FP.Y);
end;

function Point(const FXP: TFixedPoint): TPoint;
begin
  Result.X := FixedRound(FXP.X);
  Result.Y := FixedRound(FXP.Y);
end;

function FloatPoint(X, Y: Single): TFloatPoint;
begin
  Result.X := X;
  Result.Y := Y;
end;

function FloatPoint(const P: TPoint): TFloatPoint;
begin
  Result.X := P.X;
  Result.Y := P.Y;
end;

function FloatPoint(const FXP: TFixedPoint): TFloatPoint;
const
  F = 1 / 65536;
begin
  with FXP do
  begin
    Result.X := X * F;
    Result.Y := Y * F;
  end;
end;

function FixedPoint(X, Y: Integer): TFixedPoint; overload;
begin
  Result.X := X shl 16;
  Result.Y := Y shl 16;
end;

function FixedPoint(X, Y: Single): TFixedPoint; overload;
begin
  Result.X := Round(X * 65536);
  Result.Y := Round(Y * 65536);
end;

function FixedPoint(const P: TPoint): TFixedPoint; overload;
begin
  Result.X := P.X shl 16;
  Result.Y := P.Y shl 16;
end;

function FixedPoint(const FP: TFloatPoint): TFixedPoint; overload;
begin
  Result.X := Round(FP.X * 65536);
  Result.Y := Round(FP.Y * 65536);
end;

{ Rectangles }

function MakeRect(const L, T, R, B: Integer): TRect;
begin
  with Result do
  begin
    Left := L;
    Top := T;
    Right := R;
    Bottom := B;
  end;
end;

function MakeRect(const FR: TFloatRect; Rounding: TRectRounding): TRect;
begin
  with FR do
    case Rounding of
      rrClosest:
        begin
          Result.Left := Round(Left);
          Result.Top := Round(Top);
          Result.Right := Round(Right);
          Result.Bottom := Round(Bottom);
        end;

      rrInside:
        begin
          Result.Left := Ceil(Left);
          Result.Top := Ceil(Top);
          Result.Right := Ceil(Right);
          Result.Bottom := Ceil(Bottom);
          if Result.Right < Result.Left then
            Result.Right := Result.Left;
          if Result.Bottom < Result.Top then
            Result.Bottom := Result.Top;
        end;

      rrOutside:
        begin
          Result.Left := Floor(Left);
          Result.Top := Floor(Top);
          Result.Right := Ceil(Right);
          Result.Bottom := Ceil(Bottom);
        end;
    end;
end;

function MakeRect(const FXR: TFixedRect; Rounding: TRectRounding): TRect;
begin
  with FXR do
    case Rounding of
      rrClosest:
        begin
          Result.Left := FixedRound(Left);
          Result.Top := FixedRound(Top);
          Result.Right := FixedRound(Right);
          Result.Bottom := FixedRound(Bottom);
        end;

      rrInside:
        begin
          Result.Left := FixedCeil(Left);
          Result.Top := FixedCeil(Top);
          Result.Right := FixedFloor(Right);
          Result.Bottom := FixedFloor(Bottom);
          if Result.Right < Result.Left then
            Result.Right := Result.Left;
          if Result.Bottom < Result.Top then
            Result.Bottom := Result.Top;
        end;

      rrOutside:
        begin
          Result.Left := FixedFloor(Left);
          Result.Top := FixedFloor(Top);
          Result.Right := FixedCeil(Right);
          Result.Bottom := FixedCeil(Bottom);
        end;
    end;
end;

function FixedRect(const L, T, R, B: TFixed): TFixedRect;
begin
  with Result do
  begin
    Left := L;
    Top := T;
    Right := R;
    Bottom := B;
  end;
end;

function FixedRect(const ARect: TRect): TFixedRect;
begin
  with Result do
  begin
    Left := ARect.Left shl 16;
    Top := ARect.Top shl 16;
    Right := ARect.Right shl 16;
    Bottom := ARect.Bottom shl 16;
  end;
end;

function FixedRect(const FR: TFloatRect): TFixedRect;
begin
  with Result do
  begin
    Left := Round(FR.Left * 65536);
    Top := Round(FR.Top * 65536);
    Right := Round(FR.Right * 65536);
    Bottom := Round(FR.Bottom * 65536);
  end;
end;

function FloatRect(const L, T, R, B: TFloat): TFloatRect;
begin
  with Result do
  begin
    Left := L;
    Top := T;
    Right := R;
    Bottom := B;
  end;
end;

function FloatRect(const ARect: TRect): TFloatRect;
begin
  with Result do
  begin
    Left := ARect.Left;
    Top := ARect.Top;
    Right := ARect.Right;
    Bottom := ARect.Bottom;
  end;
end;

function FloatRect(const FXR: TFixedRect): TFloatRect;
begin
  with Result do
  begin
    Left := FXR.Left * FixedToFloat;
    Top := FXR.Top * FixedToFloat;
    Right := FXR.Right * FixedToFloat;
    Bottom := FXR.Bottom * FixedToFloat;
  end;
end;

function IntersectRect(out Dst: TRect; const R1, R2: TRect): Boolean;
begin
  if R1.Left >= R2.Left then
    Dst.Left := R1.Left
  else
    Dst.Left := R2.Left;
  if R1.Right <= R2.Right then
    Dst.Right := R1.Right
  else
    Dst.Right := R2.Right;
  if R1.Top >= R2.Top then
    Dst.Top := R1.Top
  else
    Dst.Top := R2.Top;
  if R1.Bottom <= R2.Bottom then
    Dst.Bottom := R1.Bottom
  else
    Dst.Bottom := R2.Bottom;
  Result := (Dst.Right >= Dst.Left) and (Dst.Bottom >= Dst.Top);
  if not Result then
    Dst := ZERO_RECT;
end;

function IntersectRect(out Dst: TFloatRect; const FR1, FR2: TFloatRect): Boolean;
begin
  Dst.Left := Max(FR1.Left, FR2.Left);
  Dst.Right := Min(FR1.Right, FR2.Right);
  Dst.Top := Max(FR1.Top, FR2.Top);
  Dst.Bottom := Min(FR1.Bottom, FR2.Bottom);
  Result := (Dst.Right >= Dst.Left) and (Dst.Bottom >= Dst.Top);
  if not Result then
    FillLongword(Dst, 4, 0);
end;

function UnionRect(out Rect: TRect; const R1, R2: TRect): Boolean;
begin
  Rect := R1;
  if not IsRectEmpty(R2) then
  begin
    if R2.Left < R1.Left then
      Rect.Left := R2.Left;
    if R2.Top < R1.Top then
      Rect.Top := R2.Top;
    if R2.Right > R1.Right then
      Rect.Right := R2.Right;
    if R2.Bottom > R1.Bottom then
      Rect.Bottom := R2.Bottom;
  end;
  Result := not IsRectEmpty(Rect);
  if not Result then
    Rect := ZERO_RECT;
end;

function UnionRect(out Rect: TFloatRect; const R1, R2: TFloatRect): Boolean;
begin
  Rect := R1;
  if not IsRectEmpty(R2) then
  begin
    if R2.Left < R1.Left then
      Rect.Left := R2.Left;
    if R2.Top < R1.Top then
      Rect.Top := R2.Top;
    if R2.Right > R1.Right then
      Rect.Right := R2.Right;
    if R2.Bottom > R1.Bottom then
      Rect.Bottom := R2.Bottom;
  end;
  Result := not IsRectEmpty(Rect);
  if not Result then
    FillLongword(Rect, 4, 0);
  ;
end;

function EqualRect(const R1, R2: TRect): Boolean;
begin
  Result := CompareMem(@R1, @R2, SizeOf(TRect));
end;

function EqualRectSize(const R1, R2: TRect): Boolean;
begin
  Result := ((R1.Right - R1.Left) = (R2.Right - R2.Left)) and
    ((R1.Bottom - R1.Top) = (R2.Bottom - R2.Top));
end;

function EqualRectSize(const R1, R2: TFloatRect): Boolean;
var
  _R1: TFixedRect;
  _R2: TFixedRect;
begin
  _R1 := FixedRect(R1);
  _R2 := FixedRect(R2);
  Result := ((_R1.Right - _R1.Left) = (_R2.Right - _R2.Left)) and
    ((_R1.Bottom - _R1.Top) = (_R2.Bottom - _R2.Top));
end;

procedure InflateRect(var R: TRect; Dx, Dy: Integer);
begin
  Dec(R.Left, Dx);
  Dec(R.Top, Dy);
  Inc(R.Right, Dx);
  Inc(R.Bottom, Dy);
end;

procedure InflateRect(var FR: TFloatRect; Dx, Dy: TFloat);
begin
  with FR do
  begin
    Left := Left - Dx;
    Top := Top - Dy;
    Right := Right + Dx;
    Bottom := Bottom + Dy;
  end;
end;

procedure OffsetRect(var R: TRect; Dx, Dy: Integer);
begin
  Inc(R.Left, Dx);
  Inc(R.Top, Dy);
  Inc(R.Right, Dx);
  Inc(R.Bottom, Dy);
end;

procedure OffsetRect(var FR: TFloatRect; Dx, Dy: TFloat);
begin
  with FR do
  begin
    Left := Left + Dx;
    Top := Top + Dy;
    Right := Right + Dx;
    Bottom := Bottom + Dy;
  end;
end;

function IsRectEmpty(const R: TRect): Boolean;
begin
  Result := (R.Right <= R.Left) or (R.Bottom <= R.Top);
end;

function IsRectEmpty(const FR: TFloatRect): Boolean;
begin
  Result := (FR.Right <= FR.Left) or (FR.Bottom <= FR.Top);
end;

function PtInRect(const R: TRect; const P: TPoint): Boolean;
begin
  Result := (P.X >= R.Left) and (P.X < R.Right) and
    (P.Y >= R.Top) and (P.Y < R.Bottom);
end;

{ Gamma / Pixel Shape Correction table }

procedure SetGamma(Gamma: Single);
var
  i: Integer;
begin
  for i := 0 to 255 do
    GAMMA_TABLE[i] := Round(255 * Power(i / 255, Gamma));
end;

{ TNotifiablePersistent }

procedure TNotifiablePersistent.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TNotifiablePersistent.Changed;
begin
  if (FUpdateCount = 0) and Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TNotifiablePersistent.EndUpdate;
begin
  Assert(FUpdateCount > 0, 'Unpaired TThreadPersistent.EndUpdate');
  Dec(FUpdateCount);
end;

{ TThreadPersistent }

constructor TThreadPersistent.Create;
begin
  InitializeCriticalSection(FLock);
end;

destructor TThreadPersistent.Destroy;
begin
  DeleteCriticalSection(FLock);
  inherited;
end;

procedure TThreadPersistent.Lock;
begin
  InterlockedIncrement(FLockCount);
  EnterCriticalSection(FLock);
end;

procedure TThreadPersistent.Unlock;
begin
  LeaveCriticalSection(FLock);
  InterlockedDecrement(FLockCount);
end;

{ TCustomMap }

procedure TCustomMap.ChangeSize(var Width, Height: Integer; NewWidth, NewHeight: Integer);
begin
  Width := NewWidth;
  Height := NewHeight;
end;

procedure TCustomMap.Delete;
begin
  SetSize(0, 0);
end;

function TCustomMap.Empty: Boolean;
begin
  Result := (Width = 0) or (Height = 0);
end;

procedure TCustomMap.Resized;
begin
  if Assigned(FOnResize) then
    FOnResize(Self);
end;

procedure TCustomMap.SetHeight(NewHeight: Integer);
begin
  SetSize(Width, NewHeight);
end;

function TCustomMap.SetSize(NewWidth, NewHeight: Integer): Boolean;
begin
  if NewWidth < 0 then
    NewWidth := 0;
  if NewHeight < 0 then
    NewHeight := 0;
  Result := (NewWidth <> FWidth) or (NewHeight <> FHeight);
  if Result then
  begin
    ChangeSize(FWidth, FHeight, NewWidth, NewHeight);
    Changed;
    Resized;
  end;
end;

function TCustomMap.SetSizeFrom(Source: TPersistent): Boolean;
begin
  if Source is TCustomMap then
    Result := SetSize(TCustomMap(Source).Width, TCustomMap(Source).Height)
  else
    if Source is TGraphic then
    Result := SetSize(TGraphic(Source).Width, TGraphic(Source).Height)
  else
    if Source is TControl then
    Result := SetSize(TControl(Source).Width, TControl(Source).Height)
  else
    if Source = nil then
    Result := SetSize(0, 0)
  else
    raise Exception.Create('Can''t set size from ''' + Source.ClassName + '''');
end;

procedure TCustomMap.SetWidth(NewWidth: Integer);
begin
  SetSize(NewWidth, Height);
end;

{ TCnsBitmap32 }

constructor TCnsBitmap32.Create;
begin
  inherited;
  {$IFNDEF CLX}
  FillChar(FBitmapInfo, SizeOf(TBitmapInfo), 0);
  with FBitmapInfo.bmiHeader do
  begin
    biSize := SizeOf(TBitmapInfoHeader);
    biPlanes := 1;
    biBitCount := 32;
    biCompression := BI_RGB;
  end;
  {$ENDIF}
  FOuterColor := $00000000; // by default as full transparency black
  FFont := TFont.Create;
  FFont.OnChange := FontChanged;
  {$IFNDEF CLX}
  FFont.OwnerCriticalSection := @FLock;
  {$ENDIF}
  FMasterAlpha := $FF;
  FPenColor := clWhite32;
  FStippleStep := 1;
  FCombineMode := cmBlend;
  FResampler := TNearestResampler.Create(Self);

  FNearResampler := TNearestResampler.Create(self);

  FHDC := 0;
  FHandle := 0;
end;

destructor TCnsBitmap32.Destroy;
begin
  if FHDC <> 0 then
    DeleteDC(FHDC);
  FHDC := 0;
  if FHandle <> 0 then
    DeleteObject(FHandle);
  FHandle := 0;

  BeginUpdate;
  Lock;
  try
    DeleteCanvas;
    SetSize(0, 0);
    FFont.Free;
    FResampler.Free;
    FNearResampler.Free;
  finally
    Unlock;
  end;
  inherited;
end;

procedure TCnsBitmap32.HandleChanged;
begin
  if FCanvas <> nil then
    FCanvas.Handle := Self.Handle;
  if Assigned(FOnHandleChanged) then
    FOnHandleChanged(Self);
end;

procedure TCnsBitmap32.ChangeSize(var Width, Height: Integer; NewWidth, NewHeight: Integer);
begin
  try
    FontChanged(Self);
    DeleteCanvas; // Patch by Thomas Bauer.....

    {$IFDEF CLX}
    if Assigned(FHDC) then
      QPainter_destroy(FHDC);
    FHDC := nil;
    if Assigned(FHandle) then
      QImage_destroy(FHandle);
    FHandle := nil;
    if Assigned(FPixmap) then
      QPixmap_destroy(FPixmap);
    FPixmap := nil;
    FPixmapChanged := False;
    FPixmapActive := False;
    {$ELSE}
    if FHDC <> 0 then
      DeleteDC(FHDC);
    FHDC := 0;
    if FHandle <> 0 then
      DeleteObject(FHandle);
    FHandle := 0;
    {$ENDIF}

    FBits := nil;
    Width := 0;
    Height := 0;
    if (NewWidth > 0) and (NewHeight > 0) then
    begin
      {$IFDEF CLX}
      FHandle := QImage_create(NewWidth, NewHeight, 32, 1, QImageEndian_IgnoreEndian);
      if FHandle <> nil then
      begin
        FBits := Pointer(QImage_bits(FHandle));
        // clear it since QT doesn't initialize the image data:
        FillLongword(FBits[0], NewWidth * NewHeight, clBlack32);
      end;
      {$ELSE}
      with FBitmapInfo.bmiHeader do
      begin
        biWidth := NewWidth;
        biHeight := -NewHeight;
      end;
      FHandle := CreateDIBSection(0, FBitmapInfo, DIB_RGB_COLORS, Pointer(FBits), 0, 0);
      {$ENDIF}

      if FBits = nil then
        raise Exception.Create('Can''t allocate the DIB handle');

      {$IFDEF CLX}
      FHDC := QPainter_create;
      if FHDC = nil then
      begin
        QImage_destroy(FHandle);
        FBits := nil;
        raise Exception.Create('Can''t create compatible DC');
      end;

      FPixmap := QPixmap_create;
      {$ELSE}
      FHDC := CreateCompatibleDC(0);
      if FHDC = 0 then
      begin
        DeleteObject(FHandle);
        FHandle := 0;
        FBits := nil;
        raise Exception.Create('Can''t create compatible DC');
      end;

      if SelectObject(FHDC, FHandle) = 0 then
      begin
        DeleteDC(FHDC);
        DeleteObject(FHandle);
        FHDC := 0;
        FHandle := 0;
        FBits := nil;
        raise Exception.Create('Can''t select an object into DC');
      end;
      {$ENDIF}
    end;

    Width := NewWidth;
    Height := NewHeight;

    ResetClipRect;
  finally
    HandleChanged;
  end;
end;

function TCnsBitmap32.Empty: Boolean;
begin
  {$IFDEF CLX}
  Result := not (Assigned(FHandle) or Assigned(FPixmap)) or inherited Empty;
  {$ELSE}
  Result := (FHandle = 0) or inherited Empty;
  {$ENDIF}
end;

procedure TCnsBitmap32.Clear;
begin
  Clear(clBlack32);
end;

procedure TCnsBitmap32.Clear(FillColor: TColor32);
begin
  if Empty then
    Exit;
  if not MeasuringMode then
    if Clipping then
      FillRect(FClipRect.Left, FClipRect.Top, FClipRect.Right, FClipRect.Bottom, FillColor)
    else
      FillLongword(Bits[0], Width * Height, FillColor);
  Changed;
end;

procedure TCnsBitmap32.Delete;
begin
  SetSize(0, 0);
end;

procedure TCnsBitmap32.Assign(Source: TPersistent);
var
  Canvas: TCanvas;
  Picture: TPicture;
  TempBitmap: TCnsBitmap32;
  I: integer;
  DstP, SrcP: PColor32;
  DstColor: TColor32;

  procedure AssignFromBitmap(SrcBmp: TBitmap);
  var
    TransparentColor: TColor32;
    I: integer;
  begin
    SetSize(SrcBmp.Width, SrcBmp.Height);
    if Empty then
      Exit;
    {$IFDEF CLX}
    if not QPainter_isActive(Handle) then
      if not QPainter_begin(Handle, Pixmap) then
        raise EInvalidGraphicOperation.CreateRes(@SInvalidCanvasState);
    QPainter_drawPixmap(Handle, 0, 0, SrcBmp.Handle, 0, 0, Width, Height);
    QPainter_end(Handle);
    PixmapChanged := True;
    {$ELSE}
    SrcBmp.Canvas.Lock; // lock to avoid GDI memory leaks, eg. when calling from threads
    try
      BitBlt(Handle, 0, 0, Width, Height, SrcBmp.Canvas.Handle, 0, 0, SRCCOPY);
    finally
      SrcBmp.Canvas.UnLock;
    end;
    {$ENDIF}
    if SrcBmp.PixelFormat <> pf32bit then
      ResetAlpha;
    if SrcBmp.Transparent then
    begin
      TransparentColor := Color32(SrcBmp.TransparentColor) and $00FFFFFF;
      DstP := @Bits[0];
      for I := 0 to Width * Height - 1 do
      begin
        DstColor := DstP^ and $00FFFFFF;
        if DstColor = TransparentColor then
          DstP^ := DstColor;
        inc(DstP);
      end;
    end;
    Font.Assign(SrcBmp.Canvas.Font);
  end;

begin
  BeginUpdate;
  try
    if Source = nil then
    begin
      SetSize(0, 0);
      Exit;
    end
    else
      if Source is TCnsBitmap32 then
      with Source as TCnsBitmap32 do
      begin
        CopyMapTo(Self);
        CopyPropertiesTo(Self);
        Exit;
      end
    else
      if Source is TBitmap then
    begin
      AssignFromBitmap(TBitmap(Source));
      Exit;
    end
    else
      if Source is TGraphic then
    begin
      SetSize(TGraphic(Source).Width, TGraphic(Source).Height);
      if Empty then
        Exit;
      Canvas := TCanvas.Create;
      try
        Canvas.Handle := Self.Handle;
        TGraphicAccess(Source).Draw(Canvas, MakeRect(0, 0, Width, Height));
        ResetAlpha;
      finally
        Canvas.Free;
      end;
    end
    else
      if Source is TPicture then
    begin
      with TPicture(Source) do
      begin
        if TPicture(Source).Graphic is TBitmap then
          AssignFromBitmap(TBitmap(TPicture(Source).Graphic))
        else
          if (TPicture(Source).Graphic is TIcon){$IFNDEF CLX} or
        (TPicture(Source).Graphic is TMetaFile){$ENDIF} then
        begin
          // icons, metafiles etc...
          SetSize(TPicture(Source).Graphic.Width, TPicture(Source).Graphic.Height);
          if Empty then
            Exit;

          TempBitmap := TCnsBitmap32.Create;
          Canvas := TCanvas.Create;
          try
            Self.Clear(clWhite32); // mask on white;
            Canvas.Handle := Self.Handle;
            TGraphicAccess(Graphic).Draw(Canvas, MakeRect(0, 0, Width, Height));

            TempBitmap.SetSize(TPicture(Source).Graphic.Width, TPicture(Source).Graphic.Height);
            TempBitmap.Clear(clRed32); // mask on red;
            Canvas.Handle := TempBitmap.Handle;
            TGraphicAccess(Graphic).Draw(Canvas, MakeRect(0, 0, Width, Height));

            DstP := @Bits[0];
            SrcP := @TempBitmap.Bits[0];
            for I := 0 to Width * Height - 1 do
            begin
              DstColor := DstP^ and $00FFFFFF;
              // this checks for transparency by comparing the pixel-color of the
              // temporary bitmap (red masked) with the pixel of our
              // bitmap (white masked). If they match, make that pixel opaque
              if DstColor = (SrcP^ and $00FFFFFF) then
                DstP^ := DstColor or $FF000000
              else
                // if the colors don't match (that is the case if there is a
                // match "is clRed32 = clBlue32 ?"), just make that pixel
                // transparent:
                DstP^ := DstColor;

              inc(SrcP);
              inc(DstP);
            end;
          finally
            TempBitmap.Free;
            Canvas.Free;
          end;
        end
        else
        begin
          // anything else...
          SetSize(TPicture(Source).Graphic.Width, TPicture(Source).Graphic.Height);
          if Empty then
            Exit;
          Canvas := TCanvas.Create;
          try
            Canvas.Handle := Self.Handle;
            TGraphicAccess(Graphic).Draw(Canvas, MakeRect(0, 0, Width, Height));
            ResetAlpha;
          finally
            Canvas.Free;
          end;
        end;
      end;
      Exit;
    end
    else
      if Source is TClipboard then
    begin
      Picture := TPicture.Create;
      try
        Picture.Assign(TClipboard(Source));
        SetSize(Picture.Width, Picture.Height);
        if Empty then
          Exit;
        Canvas := TCanvas.Create;
        try
          Canvas.Handle := Self.Handle;
          TGraphicAccess(Picture.Graphic).Draw(Canvas, MakeRect(0, 0, Width, Height));
          ResetAlpha;
        finally
          Canvas.Free;
        end;
      finally
        Picture.Free;
      end;
      Exit;
    end
    else
      inherited; // default handler
  finally;
    EndUpdate;
    Changed;
  end;
end;

procedure TCnsBitmap32.CopyMapTo(Dst: TCnsBitmap32);
begin
  Dst.SetSize(Width, Height);
  if not Empty then
    MoveLongword(Bits[0], Dst.Bits[0], Width * Height);
end;

procedure TCnsBitmap32.CopyPropertiesTo(Dst: TCnsBitmap32);
begin
  with Dst do
  begin
    DrawMode := Self.DrawMode;
    CombineMode := Self.CombineMode;
    WrapMode := Self.WrapMode;
    MasterAlpha := Self.MasterAlpha;
    OuterColor := Self.OuterColor;

    //ResamplerClassName := Self.ResamplerClassName;
    //if Assigned(Resampler) and Assigned(Self.Resampler) then
    //  Resampler.Assign(Self.Resampler);

    Font.Assign(Self.Font);
  end;
end;

procedure TCnsBitmap32.AssignTo(Dst: TPersistent);
var
  Bmp: TBitmap;

  procedure CopyToBitmap(Bmp: TBitmap);
  begin
    {$IFNDEF CLX}
    Bmp.HandleType := bmDIB;
    {$ENDIF}
    Bmp.PixelFormat := pf32Bit;
    Bmp.Canvas.Font.Assign(Font);
    Bmp.Width := Width;
    Bmp.Height := Height;
    DrawTo(Bmp.Canvas.Handle, 0, 0);
  end;

begin
  if Dst is TPicture then
    CopyToBitmap(TPicture(Dst).Bitmap)
  else
    if Dst is TBitmap then
    CopyToBitmap(TBitmap(Dst))
  else
    if Dst is TClipboard then
  begin
    Bmp := TBitmap.Create;
    try
      CopyToBitmap(Bmp);
      TClipboard(Dst).Assign(Bmp);
    finally
      Bmp.Free;
    end;
  end
  else
    inherited;
end;

function TCnsBitmap32.GetCanvas: TCanvas;
begin
  if FCanvas = nil then
  begin
    {$IFDEF CLX}
    FCanvas := TBitmap32Canvas.Create(Self);
    {$ELSE}
    FCanvas := TCanvas.Create;
    {$ENDIF}
    FCanvas.Handle := Handle;
    FCanvas.OnChange := CanvasChanged;
  end;
  Result := FCanvas;
end;

procedure TCnsBitmap32.CanvasChanged(Sender: TObject);
begin
  Changed;
end;

function TCnsBitmap32.CanvasAllocated: Boolean;
begin
  Result := FCanvas <> nil;
end;

procedure TCnsBitmap32.DeleteCanvas;
begin
  if FCanvas <> nil then
  begin
    {$IFDEF CLX}
    FCanvas.Handle := nil;
    {$ELSE}
    FCanvas.Handle := 0;
    {$ENDIF}
    FCanvas.Free;
    FCanvas := nil;
  end;
end;

procedure TCnsBitmap32.SetPixel(X, Y: Integer; Value: TColor32);
begin
  Bits[X + Y * Width] := Value;
end;

procedure TCnsBitmap32.SetPixelS(X, Y: Integer; Value: TColor32);
begin
  if {$IFDEF CHANGED_IN_PIXELS} not FMeasuringMode and {$ENDIF}
  (X >= FClipRect.Left) and (X < FClipRect.Right) and
    (Y >= FClipRect.Top) and (Y < FClipRect.Bottom) then
    Bits[X + Y * Width] := Value;

  {$IFDEF CHANGED_IN_PIXELS}
  Changed(MakeRect(X, Y, X + 1, Y + 1));
  {$ENDIF}
end;

function TCnsBitmap32.GetScanLine(Y: Integer): PColor32Array;
begin
  Result := @Bits[Y * FWidth];
end;

function TCnsBitmap32.GetPixel(X, Y: Integer): TColor32;
begin
  Result := Bits[X + Y * Width];
end;

function TCnsBitmap32.GetPixelS(X, Y: Integer): TColor32;
begin
  if (X >= FClipRect.Left) and (X < FClipRect.Right) and
    (Y >= FClipRect.Top) and (Y < FClipRect.Bottom) then
    Result := Bits[X + Y * Width]
  else
    Result := OuterColor;
end;

function TCnsBitmap32.GetPixelPtr(X, Y: Integer): PColor32;
begin
  Result := @Bits[X + Y * Width];
end;

procedure TCnsBitmap32.Draw(DstX, DstY: Integer; Src: TCnsBitmap32);
begin
  if Assigned(Src) then
    Src.DrawTo(Self, DstX, DstY);
end;

procedure TCnsBitmap32.Draw(DstX, DstY: Integer; const SrcRect: TRect; Src: TCnsBitmap32);
begin
  if Assigned(Src) then
    Src.DrawTo(Self, DstX, DstY, SrcRect);
end;

procedure TCnsBitmap32.Draw(const DstRect, SrcRect: TRect; Src: TCnsBitmap32);
begin
  if Assigned(Src) then
    Src.DrawTo(Self, DstRect, SrcRect);
end;

{$IFDEF CLX}

procedure TCnsBitmap32.Draw(const DstRect, SrcRect: TRect; SrcPixmap: QPixmapH);
var
  NewMatrix: QWMatrixH;
  SrcHeight, SrcWidth: Integer;
begin
  if Empty then
    Exit;
  if not FMeasuringMode then
  begin
    StartPainter;
    QPainter_saveWorldMatrix(Handle);
    try
      SrcWidth := SrcRect.Right - SrcRect.Left;
      SrcHeight := SrcRect.Bottom - SrcRect.Top;
      // use world transformation to translate and scale.
      NewMatrix := QWMatrix_create((DstRect.Right - DstRect.Left) / SrcWidth,
        0, 0, (DstRect.Bottom - DstRect.Top) / SrcHeight, DstRect.Left, DstRect.Top);
      try
        QPainter_setWorldMatrix(Handle, NewMatrix, True);
        QPainter_drawPixmap(Handle, 0, 0, SrcPixmap,
          SrcRect.Left, SrcRect.Top, SrcWidth, SrcHeight);
      finally
        QWMatrix_destroy(NewMatrix);
      end;
    finally
      QPainter_restoreWorldMatrix(Handle);
      StopPainter;
    end;
  end;
  Changed(DstRect);
end;

{$ELSE}

{$IFDEF BCB}

procedure TCnsBitmap32.Draw(const DstRect, SrcRect: TRect; hSrc: Cardinal);
{$ELSE}

procedure TCnsBitmap32.Draw(const DstRect, SrcRect: TRect; hSrc: HDC);
{$ENDIF}
begin
  if Empty then
    Exit;
  if not FMeasuringMode then
    StretchBlt(Handle, DstRect.Left, DstRect.Top, DstRect.Right - DstRect.Left,
      DstRect.Bottom - DstRect.Top, hSrc, SrcRect.Left, SrcRect.Top,
      SrcRect.Right - SrcRect.Left, SrcRect.Bottom - SrcRect.Top, SRCCOPY);
  ChangedEx(DstRect);
end;
{$ENDIF}

procedure TCnsBitmap32.DrawTo(Dst: TCnsBitmap32);
begin
  BlockTransfer(Dst, 0, 0, Dst.ClipRect, Self, BoundsRect, DrawMode, FOnPixelCombine);
end;

procedure TCnsBitmap32.DrawTo(Dst: TCnsBitmap32; DstX, DstY: Integer);
begin
  BlockTransfer(Dst, DstX, DstY, Dst.ClipRect, Self, BoundsRect, DrawMode, FOnPixelCombine);
end;

procedure TCnsBitmap32.DrawTo(Dst: TCnsBitmap32; DstX, DstY: Integer; const SrcRect: TRect);
begin
  BlockTransfer(Dst, DstX, DstY, Dst.ClipRect, Self, SrcRect, DrawMode, FOnPixelCombine);
end;

procedure TCnsBitmap32.DrawTo(Dst: TCnsBitmap32; const DstRect: TRect);
begin
  StretchTransfer(Dst, DstRect, Dst.ClipRect, Self, BoundsRect, Resampler, DrawMode,
    FOnPixelCombine);
end;

procedure TCnsBitmap32.DrawToNear(Dst: TCnsBitmap32; const DstRect: TRect);
begin
  StretchTransfer(Dst, DstRect, Dst.ClipRect, Self, BoundsRect, fNearResampler, DrawMode,
    FOnPixelCombine);
end;

procedure TCnsBitmap32.DrawTo(Dst: TCnsBitmap32; const DstRect, SrcRect: TRect);
begin
  StretchTransfer(Dst, DstRect, Dst.ClipRect, Self, SrcRect, Resampler, DrawMode, FOnPixelCombine);
end;

procedure TCnsBitmap32.DrawTo(hDst: {$IFDEF BCB}Cardinal{$ELSE}HDC{$ENDIF}; DstX, DstY: Integer);
begin
  if Empty then
    Exit;
  {$IFDEF CLX}
  StretchPixmap(
    hDst, DstX, DstY, Width, Height,
    0, 0, Width, Height, GetPixmap);
  {$ELSE}
  StretchDIBits(
    hDst, DstX, DstY, Width, Height,
    0, 0, Width, Height, Bits, FBitmapInfo, DIB_RGB_COLORS, SRCCOPY);
  {$ENDIF}
end;

procedure TCnsBitmap32.DrawTo(hDst: {$IFDEF BCB}Cardinal{$ELSE}HDC{$ENDIF}; const DstRect, SrcRect:
  TRect);
begin
  if Empty then
    Exit;
  {$IFDEF CLX}
  StretchPixmap(
    hDst,
    DstRect.Left, DstRect.Top, DstRect.Right - DstRect.Left, DstRect.Bottom - DstRect.Top,
    SrcRect.Left, SrcRect.Top, SrcRect.Right - SrcRect.Left, SrcRect.Bottom - SrcRect.Top,
    GetPixmap);
  {$ELSE}
  StretchBlt(
    hDst,
    DstRect.Left, DstRect.Top, DstRect.Right - DstRect.Left, DstRect.Bottom - DstRect.Top, Handle,
    SrcRect.Left, SrcRect.Top, SrcRect.Right - SrcRect.Left, SrcRect.Bottom - SrcRect.Top,
    SRCCOPY);
  {$ENDIF}
end;

procedure TCnsBitmap32.TileTo(hDst: {$IFDEF BCB}Cardinal{$ELSE}HDC{$ENDIF}; const DstRect, SrcRect:
  TRect);
const
  MaxTileSize = 1024;
var
  DstW, DstH: Integer;
  TilesX, TilesY: Integer;
  Buffer: TCnsBitmap32;
  I, J: Integer;
  ClipRect, R: TRect;
  X, Y: Integer;
begin
  DstW := DstRect.Right - DstRect.Left;
  DstH := DstRect.Bottom - DstRect.Top;
  TilesX := (DstW + MaxTileSize - 1) div MaxTileSize;
  TilesY := (DstH + MaxTileSize - 1) div MaxTileSize;
  Buffer := TCnsBitmap32.Create;
  try
    for J := 0 to TilesY - 1 do
    begin
      for I := 0 to TilesX - 1 do
      begin
        ClipRect.Left := I * MaxTileSize;
        ClipRect.Top := J * MaxTileSize;
        ClipRect.Right := (I + 1) * MaxTileSize;
        ClipRect.Bottom := (J + 1) * MaxTileSize;
        if ClipRect.Right > DstW then
          ClipRect.Right := DstW;
        if ClipRect.Bottom > DstH then
          ClipRect.Bottom := DstH;
        X := ClipRect.Left;
        Y := ClipRect.Top;
        OffsetRect(ClipRect, -X, -Y);
        R := DstRect;
        OffsetRect(R, -X - DstRect.Left, -Y - DstRect.Top);
        Buffer.SetSize(ClipRect.Right, ClipRect.Bottom);
        StretchTransfer(Buffer, R, ClipRect, Self, SrcRect, Resampler, DrawMode, FOnPixelCombine);
        {$IFDEF CLX}
        StretchPixmap(
          hDst, X + DstRect.Left, Y + DstRect.Top, ClipRect.Right, ClipRect.Bottom,
          0, 0, Buffer.Width, Buffer.Height, GetPixmap);
        {$ELSE}
        StretchDIBits(
          hDst, X + DstRect.Left, Y + DstRect.Top, ClipRect.Right, ClipRect.Bottom,
          0, 0, Buffer.Width, Buffer.Height,
          Buffer.Bits, Buffer.FBitmapInfo, DIB_RGB_COLORS, SRCCOPY);
        {$ENDIF}
      end;
    end;
  finally
    Buffer.Free;
  end;
end;

procedure TCnsBitmap32.ResetAlpha;
begin
  ResetAlpha($FF);
end;

procedure TCnsBitmap32.ResetAlpha(const AlphaValue: Byte);
var
  I: Integer;
  P: PByte;
  NH, NL: Integer;
begin
  if not FMeasuringMode then
  begin
    P := Pointer(FBits);
    Inc(P, 3); // shift the pointer to 'alpha' component of the first pixel

    { Enroll the loop 4 times }
    I := Width * Height;
    NH := I shr 2;
    NL := I and $3;
    for I := 0 to NH - 1 do
    begin
      P^ := AlphaValue;
      Inc(P, 4);
      P^ := AlphaValue;
      Inc(P, 4);
      P^ := AlphaValue;
      Inc(P, 4);
      P^ := AlphaValue;
      Inc(P, 4);
    end;
    for I := 0 to NL - 1 do
    begin
      P^ := AlphaValue;
      Inc(P, 4);
    end;
  end;
  Changed;
end;

function TCnsBitmap32.GetPixelB(X, Y: Integer): TColor32;
begin
  // WARNING: this function should never be used on empty bitmaps !!!
  if X < 0 then
    X := 0
  else
    if X >= Width then
    X := Width - 1;
  if Y < 0 then
    Y := 0
  else
    if Y >= Height then
    Y := Height - 1;
  Result := Bits[X + Y * Width];
end;

procedure TCnsBitmap32.SetPixelT(X, Y: Integer; Value: TColor32);
begin
  BLEND_MEM[FCombineMode](Value, Bits[X + Y * Width]);
  if MMX_ACTIVE then
    asm
    db $0F,$77               /// EMMS
    end;
end;

procedure TCnsBitmap32.SetPixelT(var Ptr: PColor32; Value: TColor32);
begin
  BLEND_MEM[FCombineMode](Value, Ptr^);
  Inc(Ptr);
  if MMX_ACTIVE then
    asm
    db $0F,$77               /// EMMS
    end;
end;

procedure TCnsBitmap32.SetPixelTS(X, Y: Integer; Value: TColor32);
begin
  if {$IFDEF CHANGED_IN_PIXELS} not FMeasuringMode and {$ENDIF}
  (X >= FClipRect.Left) and (X < FClipRect.Right) and
    (Y >= FClipRect.Top) and (Y < FClipRect.Bottom) then
  begin
    BLEND_MEM[FCombineMode](Value, Bits[X + Y * Width]);
    if MMX_ACTIVE then
      asm
      db $0F,$77               /// EMMS
      end;
  end;
  {$IFDEF CHANGED_IN_PIXELS}
  Changed(MakeRect(X, Y, X + 1, Y + 1));
  {$ENDIF}
end;

procedure TCnsBitmap32.SET_T256(X, Y: Integer; C: TColor32);
var
  flrx, flry, celx, cely: Longword;
  P: PColor32;
  A: TColor32;
begin
  { Warning: EMMS should be called after using this method }

  flrx := X and $FF;
  flry := Y and $FF;

  asm
    SAR X, 8
    SAR Y, 8
  end;

  P := @FBits[X + Y * FWidth];
  if FCombineMode = cmBlend then
  begin
    A := C shr 24; // opacity
    celx := A * GAMMA_TABLE[flrx xor 255];
    cely := GAMMA_TABLE[flry xor 255];
    flrx := A * GAMMA_TABLE[flrx];
    flry := GAMMA_TABLE[flry];

    CombineMem(C, P^, celx * cely shr 16);
    Inc(P);
    CombineMem(C, P^, flrx * cely shr 16);
    Inc(P, FWidth);
    CombineMem(C, P^, flrx * flry shr 16);
    Dec(P);
    CombineMem(C, P^, celx * flry shr 16);
  end
  else
  begin
    celx := GAMMA_TABLE[flrx xor 255];
    cely := GAMMA_TABLE[flry xor 255];
    flrx := GAMMA_TABLE[flrx];
    flry := GAMMA_TABLE[flry];

    CombineMem(MergeReg(C, P^), P^, celx * cely shr 8);
    Inc(P);
    CombineMem(MergeReg(C, P^), P^, flrx * cely shr 8);
    Inc(P, FWidth);
    CombineMem(MergeReg(C, P^), P^, flrx * flry shr 8);
    Dec(P);
    CombineMem(MergeReg(C, P^), P^, celx * flry shr 8);
  end;
end;

procedure TCnsBitmap32.SET_TS256(X, Y: Integer; C: TColor32);
var
  flrx, flry, celx, cely: Longword;
  P: PColor32;
  A: TColor32;
begin
  { Warning: EMMS should be called after using this method }

  // we're checking against Left - 1 and Top - 1 due to antialiased values...
  if (X < F256ClipRect.Left - 256) or (X >= F256ClipRect.Right) or
    (Y < F256ClipRect.Top - 256) or (Y >= F256ClipRect.Bottom) then
    Exit;

  flrx := X and $FF;
  flry := Y and $FF;

  asm
    SAR X, 8
    SAR Y, 8
  end;

  P := @FBits[X + Y * FWidth];
  if FCombineMode = cmBlend then
  begin
    A := C shr 24; // opacity
    celx := A * GAMMA_TABLE[flrx xor 255];
    cely := GAMMA_TABLE[flry xor 255];
    flrx := A * GAMMA_TABLE[flrx];
    flry := GAMMA_TABLE[flry];

    if (X >= FClipRect.Left) and (Y >= FClipRect.Top) and
      (X < FClipRect.Right - 1) and (Y < FClipRect.Bottom - 1) then
    begin
      CombineMem(C, P^, celx * cely shr 16);
      Inc(P);
      CombineMem(C, P^, flrx * cely shr 16);
      Inc(P, FWidth);
      CombineMem(C, P^, flrx * flry shr 16);
      Dec(P);
      CombineMem(C, P^, celx * flry shr 16);
    end
    else // "pixel" lies on the edge of the bitmap
      with FClipRect do
      begin
        if (X >= Left) and (Y >= Top) then
          CombineMem(C, P^, celx * cely shr 16);
        Inc(P);
        if (X < Right - 1) and (Y >= Top) then
          CombineMem(C, P^, flrx * cely shr 16);
        Inc(P, FWidth);
        if (X < Right - 1) and (Y < Bottom - 1) then
          CombineMem(C, P^, flrx * flry shr 16);
        Dec(P);
        if (X >= Left) and (Y < Bottom - 1) then
          CombineMem(C, P^, celx * flry shr 16);
      end;
  end
  else
  begin
    celx := GAMMA_TABLE[flrx xor 255];
    cely := GAMMA_TABLE[flry xor 255];
    flrx := GAMMA_TABLE[flrx];
    flry := GAMMA_TABLE[flry];

    if (X >= FClipRect.Left) and (Y >= FClipRect.Top) and
      (X < FClipRect.Right - 1) and (Y < FClipRect.Bottom - 1) then
    begin
      CombineMem(MergeReg(C, P^), P^, celx * cely shr 8);
      Inc(P);
      CombineMem(MergeReg(C, P^), P^, flrx * cely shr 8);
      Inc(P, FWidth);
      CombineMem(MergeReg(C, P^), P^, flrx * flry shr 8);
      Dec(P);
      CombineMem(MergeReg(C, P^), P^, celx * flry shr 8);
    end
    else // "pixel" lies on the edge of the bitmap
      with FClipRect do
      begin
        if (X >= Left) and (Y >= Top) then
          CombineMem(MergeReg(C, P^), P^, celx * cely shr 8);
        Inc(P);
        if (X < Right - 1) and (Y >= Top) then
          CombineMem(MergeReg(C, P^), P^, flrx * cely shr 8);
        Inc(P, FWidth);
        if (X < Right - 1) and (Y < Bottom - 1) then
          CombineMem(MergeReg(C, P^), P^, flrx * flry shr 8);
        Dec(P);
        if (X >= Left) and (Y < Bottom - 1) then
          CombineMem(MergeReg(C, P^), P^, celx * flry shr 8);
      end;
  end;
end;

procedure TCnsBitmap32.SetPixelF(X, Y: Single; Value: TColor32);
begin
  SET_T256(Round(X * 256), Round(Y * 256), Value);
  EMMS;
end;

procedure TCnsBitmap32.SetPixelX(X, Y: TFixed; Value: TColor32);
begin
  asm
        ADD X, $7F
        ADD Y, $7F
        SAR X, 8
        SAR Y, 8
  end;
  SET_T256(X, Y, Value);
  EMMS;
end;

procedure TCnsBitmap32.SetPixelFS(X, Y: Single; Value: TColor32);
begin
  {$IFDEF CHANGED_IN_PIXELS}
  if not FMeasuringMode then
  begin
    {$ENDIF}
    SET_TS256(Round(X * 256), Round(Y * 256), Value);
    EMMS;
    {$IFDEF CHANGED_IN_PIXELS}
  end;
  Changed(MakeRect(FloatRect(X, Y, X + 1, Y + 1)));
  {$ENDIF}
end;

procedure TCnsBitmap32.SetPixelFW(X, Y: Single; Value: TColor32);
begin
  {$IFDEF CHANGED_IN_PIXELS}
  if not FMeasuringMode then
  begin
    {$ENDIF}
    SetPixelXW(Round(X * FixedOne), Round(Y * FixedOne), Value);
    EMMS;
    {$IFDEF CHANGED_IN_PIXELS}
  end;
  Changed(MakeRect(FloatRect(X, Y, X + 1, Y + 1)));
  {$ENDIF}
end;

procedure TCnsBitmap32.SetPixelXS(X, Y: TFixed; Value: TColor32);
begin
  {$IFDEF CHANGED_IN_PIXELS}
  if not FMeasuringMode then
  begin
    {$ENDIF}
    asm
          ADD X, $7F
          ADD Y, $7F
          SAR X, 8
          SAR Y, 8
    end;
    SET_TS256(X, Y, Value);
    EMMS;
    {$IFDEF CHANGED_IN_PIXELS}
  end;
  Changed(MakeRect(X, Y, X + 1, Y + 1));
  {$ENDIF}
end;

function TCnsBitmap32.GET_T256(X, Y: Integer): TColor32;
// When using this, remember that it interpolates towards next x and y!
var
  Pos: Integer;
begin
  Pos := (X shr 8) + (Y shr 8) * FWidth;
  Result := Interpolator(GAMMA_TABLE[X and $FF xor 255],
    GAMMA_TABLE[Y and $FF xor 255],
    @FBits[Pos], @FBits[Pos + FWidth]);
end;

function TCnsBitmap32.GET_TS256(X, Y: Integer): TColor32;
var
  Width256, Height256: Integer;
begin
  if (X >= 0) and (Y >= 0) then
  begin
    Width256 := (FWidth - 1) shl 8;
    Height256 := (FHeight - 1) shl 8;

    if (X < Width256) and (Y < Height256) then
      Result := GET_T256(X, Y)
    else
      if (X = Width256) and (Y <= Height256) then
      // We're exactly on the right border: no need to interpolate.
      Result := Pixel[FWidth - 1, Y shr 8]
    else
      if (X <= Width256) and (Y = Height256) then
      // We're exactly on the bottom border: no need to interpolate.
      Result := Pixel[X shr 8, FHeight - 1]
    else
      Result := FOuterColor;
  end
  else
    Result := FOuterColor;
end;

function TCnsBitmap32.GetPixelF(X, Y: Single): TColor32;
begin
  Result := GET_T256(Round(X * 256), Round(Y * 256));
  EMMS;
end;

function TCnsBitmap32.GetPixelFS(X, Y: Single): TColor32;
begin
  Result := GET_TS256(Round(X * 256), Round(Y * 256));
  EMMS;
end;

function TCnsBitmap32.GetPixelFW(X, Y: Single): TColor32;
begin
  Result := GetPixelXW(Round(X * FixedOne), Round(Y * FixedOne));
  EMMS;
end;

function TCnsBitmap32.GetPixelX(X, Y: TFixed): TColor32;
begin
  asm
        ADD X, $7F
        ADD Y, $7F
        SAR X, 8
        SAR Y, 8
  end;
  Result := GET_T256(X, Y);
  EMMS;
end;

function TCnsBitmap32.GetPixelXS(X, Y: TFixed): TColor32;
begin
  asm
        ADD X, $7F
        ADD Y, $7F
        SAR X, 8
        SAR Y, 8
  end;
  Result := GET_TS256(X, Y);
  EMMS;
end;

function TCnsBitmap32.GetPixelR(X, Y: Single): TColor32;
begin
  Result := FResampler.GetSampleFloat(X, Y);
end;

function TCnsBitmap32.GetPixelW(X, Y: Integer): TColor32;
var
  WrapProc: TWrapProcEx;
begin
  WrapProc := WRAP_PROCS_EX[FWrapMode];
  with FClipRect do
    Result := FBits[FWidth * WrapProc(Y, Top, Bottom - 1) + WrapProc(X, Left, Right - 1)];
end;

procedure TCnsBitmap32.SetPixelW(X, Y: Integer; Value: TColor32);
var
  WrapProc: TWrapProcEx;
begin
  WrapProc := WRAP_PROCS_EX[FWrapMode];
  with FClipRect do
    FBits[FWidth * WrapProc(Y, Top, Bottom - 1) + WrapProc(X, Left, Right - 1)] := Value;
end;

function TCnsBitmap32.GetPixelXW(X, Y: TFixed): TColor32;
var
  WrapProc: TWrapProcEx;
  X1, X2, Y1, Y2: Integer;
  W: Integer;
begin
  WrapProc := WRAP_PROCS_EX[FWrapMode];

  X2 := TFixedRec(X).Int;
  Y2 := TFixedRec(Y).Int;

  with FClipRect do
  begin
    W := Right - 1;
    X1 := WrapProc(X2, Left, W);
    X2 := WrapProc(X2 + 1, Left, W);
    W := Bottom - 1;
    Y1 := WrapProc(Y2, Top, W) * Width;
    Y2 := WrapProc(Y2 + 1, Top, W) * Width;
  end;

  W := WordRec(TFixedRec(X).Frac).Hi;

  Result := CombineReg(CombineReg(Bits[X2 + Y2], Bits[X1 + Y2], W),
    CombineReg(Bits[X2 + Y1], Bits[X1 + Y1], W),
    WordRec(TFixedRec(Y).Frac).Hi);
  EMMS;
end;

procedure TCnsBitmap32.SetPixelXW(X, Y: TFixed; Value: TColor32);
var
  WrapProc: TWrapProcEx;
begin
  asm
        ADD X, $7F
        ADD Y, $7F
        SAR X, 8
        SAR Y, 8
  end;
  WrapProc := WRAP_PROCS_EX[FWrapMode];
  with F256ClipRect do
    SET_T256(WrapProc(X, Left, Right - 128), WrapProc(Y, Top, Bottom - 128), Value);
  EMMS;
end;

procedure TCnsBitmap32.SetStipple(NewStipple: TArrayOfColor32);
begin
  FStippleCounter := 0;
  FStipplePattern := Copy(NewStipple, 0, Length(NewStipple));
end;

procedure TCnsBitmap32.SetStipple(NewStipple: array of TColor32);
var
  L: Integer;
begin
  FStippleCounter := 0;
  L := High(NewStipple) + 1;
  SetLength(FStipplePattern, L);
  MoveLongword(NewStipple[0], FStipplePattern[0], L);
end;

procedure TCnsBitmap32.AdvanceStippleCounter(LengthPixels: Single);
var
  L: Integer;
  Delta: Single;
begin
  L := Length(FStipplePattern);
  Delta := LengthPixels * FStippleStep;
  if (L = 0) or (Delta = 0) then
    Exit;
  FStippleCounter := FStippleCounter + Delta;
  FStippleCounter := FStippleCounter - Floor(FStippleCounter / L) * L;
end;

function TCnsBitmap32.GetStippleColor: TColor32;
var
  L: Integer;
  NextIndex, PrevIndex: Integer;
  PrevWeight: Integer;
begin
  L := Length(FStipplePattern);
  if L = 0 then
  begin
    // no pattern defined, just return something and exit
    Result := clBlack32;
    Exit;
  end;
  while FStippleCounter >= L do
    FStippleCounter := FStippleCounter - L;
  while FStippleCounter < 0 do
    FStippleCounter := FStippleCounter + L;
  PrevIndex := Round(FStippleCounter - 0.5);
  PrevWeight := 255 - Round(255 * (FStippleCounter - PrevIndex));
  if PrevIndex < 0 then
    FStippleCounter := L - 1;
  NextIndex := PrevIndex + 1;
  if NextIndex >= L then
    NextIndex := 0;
  if PrevWeight = 255 then
    Result := FStipplePattern[PrevIndex]
  else
  begin
    Result := CombineReg(
      FStipplePattern[PrevIndex],
      FStipplePattern[NextIndex],
      PrevWeight);
    EMMS;
  end;
  FStippleCounter := FStippleCounter + FStippleStep;
end;

procedure TCnsBitmap32.HorzLine(X1, Y, X2: Integer; Value: TColor32);
begin
  FillLongword(Bits[X1 + Y * Width], X2 - X1 + 1, Value);
end;

procedure TCnsBitmap32.HorzLineS(X1, Y, X2: Integer; Value: TColor32);
begin
  if FMeasuringMode then
    ChangedEx(MakeRect(X1, Y, X2, Y + 1))
  else
    if (Y >= FClipRect.Top) and (Y < FClipRect.Bottom) and
    TestClip(X1, X2, FClipRect.Left, FClipRect.Right) then
  begin
    HorzLine(X1, Y, X2, Value);
    ChangedEx(MakeRect(X1, Y, X2, Y + 1));
  end;
end;

procedure TCnsBitmap32.HorzLineT(X1, Y, X2: Integer; Value: TColor32);
var
  i: Integer;
  P: PColor32;
  BlendMem: TBlendMem;
begin
  if X2 < X1 then
    Exit;
  P := PixelPtr[X1, Y];
  BlendMem := BLEND_MEM[FCombineMode];
  for i := X1 to X2 do
  begin
    BlendMem(Value, P^);
    Inc(P);
  end;
  EMMS;
end;

procedure TCnsBitmap32.HorzLineTS(X1, Y, X2: Integer; Value: TColor32);
begin
  if FMeasuringMode then
    ChangedEx(MakeRect(X1, Y, X2, Y + 1))
  else
    if (Y >= FClipRect.Top) and (Y < FClipRect.Bottom) and
    TestClip(X1, X2, FClipRect.Left, FClipRect.Right) then
  begin
    HorzLineT(X1, Y, X2, Value);
    ChangedEx(MakeRect(X1, Y, X2, Y + 1));
  end;
end;

procedure TCnsBitmap32.HorzLineTSP(X1, Y, X2: Integer);
var
  I, N: Integer;
begin
  if FMeasuringMode then
    ChangedEx(MakeRect(X1, Y, X2, Y + 1))
  else
  begin
    if Empty then
      Exit;
    if (Y >= FClipRect.Top) and (Y < FClipRect.Bottom) then
    begin
      if ((X1 < FClipRect.Left) and (X2 < FClipRect.Left)) or
        ((X1 >= FClipRect.Right) and (X2 >= FClipRect.Right)) then
      begin
        AdvanceStippleCounter(Abs(X2 - X1) + 1);
        Exit;
      end;
      if X1 < FClipRect.Left then
      begin
        AdvanceStippleCounter(FClipRect.Left - X1);
        X1 := FClipRect.Left;
      end
      else
        if X1 >= FClipRect.Right then
      begin
        AdvanceStippleCounter(X1 - (FClipRect.Right - 1));
        X1 := FClipRect.Right - 1;
      end;
      N := 0;
      if X2 < FClipRect.Left then
      begin
        N := FClipRect.Left - X2;
        X2 := FClipRect.Left;
      end
      else
        if X2 >= FClipRect.Right then
      begin
        N := X2 - (FClipRect.Right - 1);
        X2 := FClipRect.Right - 1;
      end;

      if X2 >= X1 then
        for I := X1 to X2 do
          SetPixelT(I, Y, GetStippleColor)
      else
        for I := X1 downto X2 do
          SetPixelT(I, Y, GetStippleColor);

      ChangedEx(MakeRect(X1, Y, X2, Y + 1));

      if N > 0 then
        AdvanceStippleCounter(N);
    end
    else
      AdvanceStippleCounter(Abs(X2 - X1) + 1);
  end;
end;

procedure TCnsBitmap32.VertLine(X, Y1, Y2: Integer; Value: TColor32);
var
  I, NH, NL: Integer;
  P: PColor32;
begin
  if Y2 < Y1 then
    Exit;
  P := PixelPtr[X, Y1];
  I := Y2 - Y1 + 1;
  NH := I shr 2;
  NL := I and $03;
  for I := 0 to NH - 1 do
  begin
    P^ := Value;
    Inc(P, Width);
    P^ := Value;
    Inc(P, Width);
    P^ := Value;
    Inc(P, Width);
    P^ := Value;
    Inc(P, Width);
  end;
  for I := 0 to NL - 1 do
  begin
    P^ := Value;
    Inc(P, Width);
  end;
end;

procedure TCnsBitmap32.VertLineS(X, Y1, Y2: Integer; Value: TColor32);
begin
  if FMeasuringMode then
    ChangedEx(MakeRect(X, Y1, X + 1, Y2))
  else
    if (X >= FClipRect.Left) and (X < FClipRect.Right) and
    TestClip(Y1, Y2, FClipRect.Top, FClipRect.Bottom) then
  begin
    VertLine(X, Y1, Y2, Value);
    ChangedEx(MakeRect(X, Y1, X + 1, Y2));
  end;
end;

procedure TCnsBitmap32.VertLineT(X, Y1, Y2: Integer; Value: TColor32);
var
  i: Integer;
  P: PColor32;
  BlendMem: TBlendMem;
begin
  P := PixelPtr[X, Y1];
  BlendMem := BLEND_MEM[FCombineMode];
  for i := Y1 to Y2 do
  begin
    BlendMem(Value, P^);
    Inc(P, Width);
  end;
  EMMS;
end;

procedure TCnsBitmap32.VertLineTS(X, Y1, Y2: Integer; Value: TColor32);
begin
  if FMeasuringMode then
    ChangedEx(MakeRect(X, Y1, X + 1, Y2))
  else
    if (X >= FClipRect.Left) and (X < FClipRect.Right) and
    TestClip(Y1, Y2, FClipRect.Top, FClipRect.Bottom) then
  begin
    VertLineT(X, Y1, Y2, Value);
    ChangedEx(MakeRect(X, Y1, X + 1, Y2));
  end;
end;

procedure TCnsBitmap32.VertLineTSP(X, Y1, Y2: Integer);
var
  I, N: Integer;
begin
  if FMeasuringMode then
    ChangedEx(MakeRect(X, Y1, X + 1, Y2))
  else
  begin
    if Empty then
      Exit;
    if (X >= FClipRect.Left) and (X < FClipRect.Right) then
    begin
      if ((Y1 < FClipRect.Top) and (Y2 < FClipRect.Top)) or
        ((Y1 >= FClipRect.Bottom) and (Y2 >= FClipRect.Bottom)) then
      begin
        AdvanceStippleCounter(Abs(Y2 - Y1) + 1);
        Exit;
      end;
      if Y1 < FClipRect.Top then
      begin
        AdvanceStippleCounter(FClipRect.Top - Y1);
        Y1 := FClipRect.Top;
      end
      else
        if Y1 >= FClipRect.Bottom then
      begin
        AdvanceStippleCounter(Y1 - (FClipRect.Bottom - 1));
        Y1 := FClipRect.Bottom - 1;
      end;
      N := 0;
      if Y2 < FClipRect.Top then
      begin
        N := FClipRect.Top - Y2;
        Y2 := FClipRect.Top;
      end
      else
        if Y2 >= FClipRect.Bottom then
      begin
        N := Y2 - (FClipRect.Bottom - 1);
        Y2 := FClipRect.Bottom - 1;
      end;

      if Y2 >= Y1 then
        for I := Y1 to Y2 do
          SetPixelT(X, I, GetStippleColor)
      else
        for I := Y1 downto Y2 do
          SetPixelT(X, I, GetStippleColor);

      ChangedEx(MakeRect(X, Y1, X + 1, Y2));

      if N > 0 then
        AdvanceStippleCounter(N);
    end
    else
      AdvanceStippleCounter(Abs(Y2 - Y1) + 1);
  end;
end;

procedure TCnsBitmap32.Line(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean);
var
  Dy, Dx, Sy, Sx, I, Delta: Integer;
  P: PColor32;
  ChangedRect: TRect;
begin
  ChangedRect := MakeRect(X1, Y1, X2, Y2);
  try
    Dx := X2 - X1;
    Dy := Y2 - Y1;

    if Dx > 0 then
      Sx := 1
    else
      if Dx < 0 then
    begin
      Dx := -Dx;
      Sx := -1;
    end
    else // Dx = 0
    begin
      if Dy > 0 then
        VertLine(X1, Y1, Y2 - 1, Value)
      else
        if Dy < 0 then
        VertLine(X1, Y2 + 1, Y1, Value);
      if L then
        Pixel[X2, Y2] := Value;
      Exit;
    end;

    if Dy > 0 then
      Sy := 1
    else
      if Dy < 0 then
    begin
      Dy := -Dy;
      Sy := -1;
    end
    else // Dy = 0
    begin
      if X2 > X1 then
        HorzLine(X1, Y1, X2 - 1, Value)
      else
        HorzLine(X2 + 1, Y1, X1, Value);
      if L then
        Pixel[X2, Y2] := Value;
      Exit;
    end;

    P := PixelPtr[X1, Y1];
    Sy := Sy * Width;

    if Dx > Dy then
    begin
      Delta := Dx shr 1;
      for I := 0 to Dx - 1 do
      begin
        P^ := Value;
        Inc(P, Sx);
        Inc(Delta, Dy);
        if Delta >= Dx then
        begin
          Inc(P, Sy);
          Dec(Delta, Dx);
        end;
      end;
    end
    else // Dx < Dy
    begin
      Delta := Dy shr 1;
      for I := 0 to Dy - 1 do
      begin
        P^ := Value;
        Inc(P, Sy);
        Inc(Delta, Dx);
        if Delta >= Dy then
        begin
          Inc(P, Sx);
          Dec(Delta, Dy);
        end;
      end;
    end;
    if L then
      P^ := Value;
  finally
    ChangedEx(ChangedRect, AREAINFO_LINE + 2);
  end;
end;

procedure TCnsBitmap32.LineS(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean);
var
  Cx1, Cx2, Cy1, Cy2, PI, Sx, Sy, Dx, Dy, xd, yd, Dx2, Dy2, rem, term, tmp, e: Integer;
  Swapped, CheckAux: Boolean;
  P: PColor32;
  ChangedRect: TRect;
begin
  ChangedRect := MakeRect(X1, Y1, X2, Y2);

  if not FMeasuringMode then
  begin
    Dx := X2 - X1;
    Dy := Y2 - Y1;

    // check for trivial cases...
    if Dx = 0 then // vertical line?
    begin
      if Dy > 0 then
        VertLineS(X1, Y1, Y2 - 1, Value)
      else
        if Dy < 0 then
        VertLineS(X1, Y2 + 1, Y1, Value);
      if L then
        PixelS[X2, Y2] := Value;
      Changed;
      Exit;
    end
    else
      if Dy = 0 then // horizontal line?
    begin
      if Dx > 0 then
        HorzLineS(X1, Y1, X2 - 1, Value)
      else
        if Dx < 0 then
        HorzLineS(X2 + 1, Y1, X1, Value);
      if L then
        PixelS[X2, Y2] := Value;
      Changed;
      Exit;
    end;

    Cx1 := FClipRect.Left;
    Cx2 := FClipRect.Right - 1;
    Cy1 := FClipRect.Top;
    Cy2 := FClipRect.Bottom - 1;

    if Dx > 0 then
    begin
      if (X1 > Cx2) or (X2 < Cx1) then
        Exit; // segment not visible
      Sx := 1;
    end
    else
    begin
      if (X2 > Cx2) or (X1 < Cx1) then
        Exit; // segment not visible
      Sx := -1;
      X1 := -X1;
      X2 := -X2;
      Dx := -Dx;
      Cx1 := -Cx1;
      Cx2 := -Cx2;
      Swap(Cx1, Cx2);
    end;

    if Dy > 0 then
    begin
      if (Y1 > Cy2) or (Y2 < Cy1) then
        Exit; // segment not visible
      Sy := 1;
    end
    else
    begin
      if (Y2 > Cy2) or (Y1 < Cy1) then
        Exit; // segment not visible
      Sy := -1;
      Y1 := -Y1;
      Y2 := -Y2;
      Dy := -Dy;
      Cy1 := -Cy1;
      Cy2 := -Cy2;
      Swap(Cy1, Cy2);
    end;

    if Dx < Dy then
    begin
      Swapped := True;
      Swap(X1, Y1);
      Swap(X2, Y2);
      Swap(Dx, Dy);
      Swap(Cx1, Cy1);
      Swap(Cx2, Cy2);
      Swap(Sx, Sy);
    end
    else
      Swapped := False;

    // Bresenham's set up:
    Dx2 := Dx shl 1;
    Dy2 := Dy shl 1;
    xd := X1;
    yd := Y1;
    e := Dy2 - Dx;
    term := X2;
    CheckAux := True;

    // clipping rect horizontal entry
    if Y1 < Cy1 then
    begin
      tmp := Dx2 * (Cy1 - Y1) - Dx;
      Inc(xd, tmp div Dy2);
      rem := tmp mod Dy2;
      if xd > Cx2 then
        Exit;
      if xd >= Cx1 then
      begin
        yd := Cy1;
        Dec(e, rem + Dx);
        if rem > 0 then
        begin
          Inc(xd);
          Inc(e, Dy2);
        end;
        CheckAux := False; // to avoid ugly labels we set this to omit the next check
      end;
    end;

    // clipping rect vertical entry
    if CheckAux and (X1 < Cx1) then
    begin
      tmp := Dy2 * (Cx1 - X1);
      Inc(yd, tmp div Dx2);
      rem := tmp mod Dx2;
      if (yd > Cy2) or (yd = Cy2) and (rem >= Dx) then
        Exit;
      xd := Cx1;
      Inc(e, rem);
      if (rem >= Dx) then
      begin
        Inc(yd);
        Dec(e, Dx2);
      end;
    end;

    // set auxiliary var to indicate that temp is not clipped, since
    // temp still has the unclipped value assigned at setup.
    CheckAux := False;

    // is the segment exiting the clipping rect?
    if Y2 > Cy2 then
    begin
      tmp := Dx2 * (Cy2 - Y1) + Dx;
      term := X1 + tmp div Dy2;
      rem := tmp mod Dy2;
      if rem = 0 then
        Dec(term);
      CheckAux := True; // set auxiliary var to indicate that temp is clipped
    end;

    if term > Cx2 then
    begin
      term := Cx2;
      CheckAux := True; // set auxiliary var to indicate that temp is clipped
    end;

    Inc(term);

    if Sy = -1 then
      yd := -yd;

    if Sx = -1 then
    begin
      xd := -xd;
      term := -term;
    end;

    Dec(Dx2, Dy2);

    if Swapped then
    begin
      PI := Sx * Width;
      P := @Bits[yd + xd * Width];
    end
    else
    begin
      PI := Sx;
      Sy := Sy * Width;
      P := @Bits[xd + yd * Width];
    end;

    // do we need to skip the last pixel of the line and is temp not clipped?
    if not (L or CheckAux) then
    begin
      if xd < term then
        Dec(term)
      else
        Inc(term);
    end;

    while xd <> term do
    begin
      Inc(xd, Sx);

      P^ := Value;
      Inc(P, PI);
      if e >= 0 then
      begin
        Inc(P, Sy);
        Dec(e, Dx2);
      end
      else
        Inc(e, Dy2);
    end;
  end;

  ChangedEx(ChangedRect, AREAINFO_LINE + 2);
end;

procedure TCnsBitmap32.LineT(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean);
var
  Dy, Dx, Sy, Sx, I, Delta: Integer;
  P: PColor32;
  BlendMem: TBlendMem;
  ChangedRect: TRect;
begin
  ChangedRect := MakeRect(X1, Y1, X2, Y2);
  try
    Dx := X2 - X1;
    Dy := Y2 - Y1;

    if Dx > 0 then
      Sx := 1
    else
      if Dx < 0 then
    begin
      Dx := -Dx;
      Sx := -1;
    end
    else // Dx = 0
    begin
      if Dy > 0 then
        VertLineT(X1, Y1, Y2 - 1, Value)
      else
        if Dy < 0 then
        VertLineT(X1, Y2 + 1, Y1, Value);
      if L then
        SetPixelT(X2, Y2, Value);
      Exit;
    end;

    if Dy > 0 then
      Sy := 1
    else
      if Dy < 0 then
    begin
      Dy := -Dy;
      Sy := -1;
    end
    else // Dy = 0
    begin
      if X2 > X1 then
        HorzLineT(X1, Y1, X2 - 1, Value)
      else
        HorzLineT(X2 + 1, Y1, X1, Value);
      if L then
        SetPixelT(X2, Y2, Value);
      Exit;
    end;

    P := PixelPtr[X1, Y1];
    Sy := Sy * Width;

    try
      BlendMem := BLEND_MEM[FCombineMode];
      if Dx > Dy then
      begin
        Delta := Dx shr 1;
        for I := 0 to Dx - 1 do
        begin
          BlendMem(Value, P^);
          Inc(P, Sx);
          Inc(Delta, Dy);
          if Delta >= Dx then
          begin
            Inc(P, Sy);
            Dec(Delta, Dx);
          end;
        end;
      end
      else // Dx < Dy
      begin
        Delta := Dy shr 1;
        for I := 0 to Dy - 1 do
        begin
          BlendMem(Value, P^);
          Inc(P, Sy);
          Inc(Delta, Dx);
          if Delta >= Dy then
          begin
            Inc(P, Sx);
            Dec(Delta, Dy);
          end;
        end;
      end;
      if L then
        BlendMem(Value, P^);
    finally
      EMMS;
    end;
  finally
    ChangedEx(ChangedRect, AREAINFO_LINE + 2);
  end;
end;

procedure TCnsBitmap32.LineTS(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean);
var
  Cx1, Cx2, Cy1, Cy2, PI, Sx, Sy, Dx, Dy, xd, yd, Dx2, Dy2, rem, term, tmp, e: Integer;
  Swapped, CheckAux: Boolean;
  P: PColor32;
  BlendMem: TBlendMem;
  ChangedRect: TRect;
begin
  ChangedRect := MakeRect(X1, Y1, X2, Y2);

  if not FMeasuringMode then
  begin
    Dx := X2 - X1;
    Dy := Y2 - Y1;

    // check for trivial cases...
    if Dx = 0 then // vertical line?
    begin
      if Dy > 0 then
        VertLineTS(X1, Y1, Y2 - 1, Value)
      else
        if Dy < 0 then
        VertLineTS(X1, Y2 + 1, Y1, Value);
      if L then
        SetPixelTS(X2, Y2, Value);
      Exit;
    end
    else
      if Dy = 0 then // horizontal line?
    begin
      if Dx > 0 then
        HorzLineTS(X1, Y1, X2 - 1, Value)
      else
        if Dx < 0 then
        HorzLineTS(X2 + 1, Y1, X1, Value);
      if L then
        SetPixelTS(X2, Y2, Value);
      Exit;
    end;

    Cx1 := FClipRect.Left;
    Cx2 := FClipRect.Right - 1;
    Cy1 := FClipRect.Top;
    Cy2 := FClipRect.Bottom - 1;

    if Dx > 0 then
    begin
      if (X1 > Cx2) or (X2 < Cx1) then
        Exit; // segment not visible
      Sx := 1;
    end
    else
    begin
      if (X2 > Cx2) or (X1 < Cx1) then
        Exit; // segment not visible
      Sx := -1;
      X1 := -X1;
      X2 := -X2;
      Dx := -Dx;
      Cx1 := -Cx1;
      Cx2 := -Cx2;
      Swap(Cx1, Cx2);
    end;

    if Dy > 0 then
    begin
      if (Y1 > Cy2) or (Y2 < Cy1) then
        Exit; // segment not visible
      Sy := 1;
    end
    else
    begin
      if (Y2 > Cy2) or (Y1 < Cy1) then
        Exit; // segment not visible
      Sy := -1;
      Y1 := -Y1;
      Y2 := -Y2;
      Dy := -Dy;
      Cy1 := -Cy1;
      Cy2 := -Cy2;
      Swap(Cy1, Cy2);
    end;

    if Dx < Dy then
    begin
      Swapped := True;
      Swap(X1, Y1);
      Swap(X2, Y2);
      Swap(Dx, Dy);
      Swap(Cx1, Cy1);
      Swap(Cx2, Cy2);
      Swap(Sx, Sy);
    end
    else
      Swapped := False;

    // Bresenham's set up:
    Dx2 := Dx shl 1;
    Dy2 := Dy shl 1;
    xd := X1;
    yd := Y1;
    e := Dy2 - Dx;
    term := X2;
    CheckAux := True;

    // clipping rect horizontal entry
    if Y1 < Cy1 then
    begin
      tmp := Dx2 * (Cy1 - Y1) - Dx;
      Inc(xd, tmp div Dy2);
      rem := tmp mod Dy2;
      if xd > Cx2 then
        Exit;
      if xd >= Cx1 then
      begin
        yd := Cy1;
        Dec(e, rem + Dx);
        if rem > 0 then
        begin
          Inc(xd);
          Inc(e, Dy2);
        end;
        CheckAux := False; // to avoid ugly labels we set this to omit the next check
      end;
    end;

    // clipping rect vertical entry
    if CheckAux and (X1 < Cx1) then
    begin
      tmp := Dy2 * (Cx1 - X1);
      Inc(yd, tmp div Dx2);
      rem := tmp mod Dx2;
      if (yd > Cy2) or (yd = Cy2) and (rem >= Dx) then
        Exit;
      xd := Cx1;
      Inc(e, rem);
      if (rem >= Dx) then
      begin
        Inc(yd);
        Dec(e, Dx2);
      end;
    end;

    // set auxiliary var to indicate that temp is not clipped, since
    // temp still has the unclipped value assigned at setup.
    CheckAux := False;

    // is the segment exiting the clipping rect?
    if Y2 > Cy2 then
    begin
      tmp := Dx2 * (Cy2 - Y1) + Dx;
      term := X1 + tmp div Dy2;
      rem := tmp mod Dy2;
      if rem = 0 then
        Dec(term);
      CheckAux := True; // set auxiliary var to indicate that temp is clipped
    end;

    if term > Cx2 then
    begin
      term := Cx2;
      CheckAux := True; // set auxiliary var to indicate that temp is clipped
    end;

    Inc(term);

    if Sy = -1 then
      yd := -yd;

    if Sx = -1 then
    begin
      xd := -xd;
      term := -term;
    end;

    Dec(Dx2, Dy2);

    if Swapped then
    begin
      PI := Sx * Width;
      P := @Bits[yd + xd * Width];
    end
    else
    begin
      PI := Sx;
      Sy := Sy * Width;
      P := @Bits[xd + yd * Width];
    end;

    // do we need to skip the last pixel of the line and is temp not clipped?
    if not (L or CheckAux) then
    begin
      if xd < term then
        Dec(term)
      else
        Inc(term);
    end;

    try
      BlendMem := BLEND_MEM[FCombineMode];
      while xd <> term do
      begin
        Inc(xd, Sx);

        BlendMem(Value, P^);
        Inc(P, PI);
        if e >= 0 then
        begin
          Inc(P, Sy);
          Dec(e, Dx2);
        end
        else
          Inc(e, Dy2);
      end;
    finally
      EMMS;
    end;
  end;

  ChangedEx(ChangedRect, AREAINFO_LINE + 2);
end;

procedure TCnsBitmap32.LineX(X1, Y1, X2, Y2: TFixed; Value: TColor32; L: Boolean);
var
  n, i: Integer;
  nx, ny, hyp: Integer;
  A: TColor32;
  h: Single;
  ChangedRect: TFixedRect;
begin
  ChangedRect := FixedRect(X1, Y1, X2, Y2);
  try
    nx := X2 - X1;
    ny := Y2 - Y1;
    Inc(X1, 127);
    Inc(Y1, 127);
    Inc(X2, 127);
    Inc(Y2, 127);
    hyp := Round(Hypot(nx, ny));
    if L then
      Inc(hyp, 65536);
    if hyp < 256 then
      Exit;
    n := hyp shr 16;
    if n > 0 then
    begin
      h := 65536 / hyp;
      nx := Round(nx * h);
      ny := Round(ny * h);
      for i := 0 to n - 1 do
      begin
        SET_T256(X1 shr 8, Y1 shr 8, Value);
        Inc(X1, nx);
        Inc(Y1, ny);
      end;
    end;
    A := Value shr 24;
    hyp := hyp - n shl 16;
    A := A * Cardinal(hyp) shl 8 and $FF000000;
    SET_T256((X1 + X2 - nx) shr 9, (Y1 + Y2 - ny) shr 9, Value and $00FFFFFF + A);
  finally
    EMMS;
    ChangedEx(MakeRect(ChangedRect), AREAINFO_LINE + 2);
  end;
end;

procedure TCnsBitmap32.LineF(X1, Y1, X2, Y2: Single; Value: TColor32; L: Boolean);
begin
  LineX(Fixed(X1), Fixed(Y1), Fixed(X2), Fixed(Y2), Value, L);
end;

procedure TCnsBitmap32.LineXS(X1, Y1, X2, Y2: TFixed; Value: TColor32; L: Boolean);
var
  n, i: Integer;
  ex, ey, nx, ny, hyp: Integer;
  A: TColor32;
  h: Single;
  ChangedRect: TFixedRect;
begin
  ChangedRect := FixedRect(X1, Y1, X2, Y2);

  if not FMeasuringMode then
  begin
    ex := X2;
    ey := Y2;

    // Check for visibility and clip the coordinates
    if not ClipLine(Integer(X1), Integer(Y1), Integer(X2), Integer(Y2),
      FFixedClipRect.Left - $10000, FFixedClipRect.Top - $10000,
      FFixedClipRect.Right, FFixedClipRect.Bottom) then
      Exit;

    { TODO : Handle L on clipping here... }

    if (ex <> X2) or (ey <> Y2) then
      L := True;

    // Check if it lies entirely in the bitmap area. Even after clipping
    // some pixels may lie outside the bitmap due to antialiasing
    if (X1 > FFixedClipRect.Left) and (X1 < FFixedClipRect.Right - $20000) and
      (Y1 > FFixedClipRect.Top) and (Y1 < FFixedClipRect.Bottom - $20000) and
      (X2 > FFixedClipRect.Left) and (X2 < FFixedClipRect.Right - $20000) and
      (Y2 > FFixedClipRect.Top) and (Y2 < FFixedClipRect.Bottom - $20000) then
    begin
      LineX(X1, Y1, X2, Y2, Value, L);
      Exit;
    end;

    // If we are still here, it means that the line touches one or several bitmap
    // boundaries. Use the safe version of antialiased pixel routine
    try
      nx := X2 - X1;
      ny := Y2 - Y1;
      Inc(X1, 127);
      Inc(Y1, 127);
      Inc(X2, 127);
      Inc(Y2, 127);
      hyp := Round(Hypot(nx, ny));
      if L then
        Inc(Hyp, 65536);
      if hyp < 256 then
        Exit;
      n := hyp shr 16;
      if n > 0 then
      begin
        h := 65536 / hyp;
        nx := Round(nx * h);
        ny := Round(ny * h);
        for i := 0 to n - 1 do
        begin
          SET_TS256(SAR_8(X1), SAR_8(Y1), Value);
          X1 := X1 + nx;
          Y1 := Y1 + ny;
        end;
      end;
      A := Value shr 24;
      hyp := hyp - n shl 16;
      A := A * Longword(hyp) shl 8 and $FF000000;
      SET_TS256(SAR_9(X1 + X2 - nx), SAR_9(Y1 + Y2 - ny), Value and $00FFFFFF + A);
    finally
      EMMS;
    end;
  end;
  ChangedEx(MakeRect(ChangedRect), AREAINFO_LINE + 2);
end;

procedure TCnsBitmap32.LineFS(X1, Y1, X2, Y2: Single; Value: TColor32; L: Boolean);
begin
  LineXS(Fixed(X1), Fixed(Y1), Fixed(X2), Fixed(Y2), Value, L);
end;

procedure TCnsBitmap32.LineXP(X1, Y1, X2, Y2: TFixed; L: Boolean);
var
  n, i: Integer;
  nx, ny, hyp: Integer;
  A, C: TColor32;
  ChangedRect: TRect;
begin
  ChangedRect := MakeRect(FixedRect(X1, Y1, X2, Y2));
  try
    nx := X2 - X1;
    ny := Y2 - Y1;
    Inc(X1, 127);
    Inc(Y1, 127);
    Inc(X2, 127);
    Inc(Y2, 127);
    hyp := Round(Hypot(nx, ny));
    if L then
      Inc(hyp, 65536);
    if hyp < 256 then
      Exit;
    n := hyp shr 16;
    if n > 0 then
    begin
      nx := Round(nx / hyp * 65536);
      ny := Round(ny / hyp * 65536);
      for i := 0 to n - 1 do
      begin
        C := GetStippleColor;
        SET_T256(X1 shr 8, Y1 shr 8, C);
        EMMS;
        X1 := X1 + nx;
        Y1 := Y1 + ny;
      end;
    end;
    C := GetStippleColor;
    A := C shr 24;
    hyp := hyp - n shl 16;
    A := A * Longword(hyp) shl 8 and $FF000000;
    SET_T256((X1 + X2 - nx) shr 9, (Y1 + Y2 - ny) shr 9, C and $00FFFFFF + A);
    EMMS;
  finally
    ChangedEx(ChangedRect, AREAINFO_LINE + 2);
  end;
end;

procedure TCnsBitmap32.LineFP(X1, Y1, X2, Y2: Single; L: Boolean);
begin
  LineXP(Fixed(X1), Fixed(Y1), Fixed(X2), Fixed(Y2), L);
end;

procedure TCnsBitmap32.LineXSP(X1, Y1, X2, Y2: TFixed; L: Boolean);
const
  StippleInc: array[Boolean] of Single = (0, 1);
var
  n, i: Integer;
  sx, sy, ex, ey, nx, ny, hyp: Integer;
  A, C: TColor32;
  ChangedRect: TRect;
begin
  ChangedRect := MakeRect(FixedRect(X1, Y1, X2, Y2));

  if not FMeasuringMode then
  begin
    sx := X1;
    sy := Y1;
    ex := X2;
    ey := Y2;

    // Check for visibility and clip the coordinates
    if not ClipLine(Integer(X1), Integer(Y1), Integer(X2), Integer(Y2),
      FFixedClipRect.Left - $10000, FFixedClipRect.Top - $10000,
      FFixedClipRect.Right, FFixedClipRect.Bottom) then
    begin
      AdvanceStippleCounter(Hypot((X2 - X1) / 65536, (Y2 - Y1) / 65536) - StippleInc[L]);
      Exit;
    end;

    if (ex <> X2) or (ey <> Y2) then
      L := True;

    // Check if it lies entirely in the bitmap area. Even after clipping
    // some pixels may lie outside the bitmap due to antialiasing
    if (X1 > FFixedClipRect.Left) and (X1 < FFixedClipRect.Right - $20000) and
      (Y1 > FFixedClipRect.Top) and (Y1 < FFixedClipRect.Bottom - $20000) and
      (X2 > FFixedClipRect.Left) and (X2 < FFixedClipRect.Right - $20000) and
      (Y2 > FFixedClipRect.Top) and (Y2 < FFixedClipRect.Bottom - $20000) then
    begin
      LineXP(X1, Y1, X2, Y2, L);
      Exit;
    end;

    if (sx <> X1) or (sy <> Y1) then
      AdvanceStippleCounter(Hypot((X1 - sx) / 65536, (Y1 - sy) / 65536));

    // If we are still here, it means that the line touches one or several bitmap
    // boundaries. Use the safe version of antialiased pixel routine
    nx := X2 - X1;
    ny := Y2 - Y1;
    Inc(X1, 127);
    Inc(Y1, 127);
    Inc(X2, 127);
    Inc(Y2, 127);
    hyp := Round(Hypot(nx, ny));
    if L then
      Inc(hyp, 65536);
    if hyp < 256 then
      Exit;
    n := hyp shr 16;
    if n > 0 then
    begin
      nx := Round(nx / hyp * 65536);
      ny := Round(ny / hyp * 65536);
      for i := 0 to n - 1 do
      begin
        C := GetStippleColor;
        SET_TS256(SAR_8(X1), SAR_8(Y1), C);
        EMMS;
        X1 := X1 + nx;
        Y1 := Y1 + ny;
      end;
    end;
    C := GetStippleColor;
    A := C shr 24;
    hyp := hyp - n shl 16;
    A := A * Longword(hyp) shl 8 and $FF000000;
    SET_TS256(SAR_9(X1 + X2 - nx), SAR_9(Y1 + Y2 - ny), C and $00FFFFFF + A);
    EMMS;

    if (ex <> X2) or (ey <> Y2) then
      AdvanceStippleCounter(Hypot((X2 - ex) / 65536, (Y2 - ey) / 65536) - StippleInc[L]);
  end;

  ChangedEx(ChangedRect, AREAINFO_LINE + 4);
end;

procedure TCnsBitmap32.LineFSP(X1, Y1, X2, Y2: Single; L: Boolean);
begin
  LineXSP(Fixed(X1), Fixed(Y1), Fixed(X2), Fixed(Y2), L);
end;

procedure TCnsBitmap32.LineA(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean);
var
  Dx, Dy, Sx, Sy, D: Integer;
  EC, EA: Word;
  CI: Byte;
  P: PColor32;
  BlendMemEx: TBlendMemEx;
begin
  if (X1 = X2) or (Y1 = Y2) then
  begin
    LineT(X1, Y1, X2, Y2, Value, L);
    Exit;
  end;

  Dx := X2 - X1;
  Dy := Y2 - Y1;

  if Dx > 0 then
    Sx := 1
  else
  begin
    Sx := -1;
    Dx := -Dx;
  end;

  if Dy > 0 then
    Sy := 1
  else
  begin
    Sy := -1;
    Dy := -Dy;
  end;

  try
    EC := 0;
    BLEND_MEM[FCombineMode](Value, Bits[X1 + Y1 * Width]);
    BlendMemEx := BLEND_MEM_EX[FCombineMode];

    if Dy > Dx then
    begin
      EA := Dx shl 16 div Dy;
      if not L then
        Dec(Dy);
      while Dy > 0 do
      begin
        Dec(Dy);
        D := EC;
        Inc(EC, EA);
        if EC <= D then
          Inc(X1, Sx);
        Inc(Y1, Sy);
        CI := EC shr 8;
        P := @Bits[X1 + Y1 * Width];
        BlendMemEx(Value, P^, GAMMA_TABLE[CI xor 255]);
        Inc(P, Sx);
        BlendMemEx(Value, P^, GAMMA_TABLE[CI]);
      end;
    end
    else // DY <= DX
    begin
      EA := Dy shl 16 div Dx;
      if not L then
        Dec(Dx);
      while Dx > 0 do
      begin
        Dec(Dx);
        D := EC;
        Inc(EC, EA);
        if EC <= D then
          Inc(Y1, Sy);
        Inc(X1, Sx);
        CI := EC shr 8;
        P := @Bits[X1 + Y1 * Width];
        BlendMemEx(Value, P^, GAMMA_TABLE[CI xor 255]);
        if Sy = 1 then
          Inc(P, Width)
        else
          Dec(P, Width);
        BlendMemEx(Value, P^, GAMMA_TABLE[CI]);
      end;
    end;
  finally
    EMMS;
    ChangedEx(MakeRect(X1, Y1, X2, Y2), AREAINFO_LINE + 2);
  end;
end;

procedure TCnsBitmap32.LineAS(X1, Y1, X2, Y2: Integer; Value: TColor32; L: Boolean);
var
  Cx1, Cx2, Cy1, Cy2, PI, Sx, Sy, Dx, Dy, xd, yd, rem, term, tmp: Integer;
  CheckVert, CornerAA, TempClipped: Boolean;
  D1, D2: PInteger;
  EC, EA, ED, D: Word;
  CI: Byte;
  P: PColor32;
  BlendMemEx: TBlendMemEx;
  ChangedRect: TRect;
begin
  ChangedRect := MakeRect(X1, Y1, X2, Y2);

  if not FMeasuringMode then
  begin
    if (FClipRect.Right - FClipRect.Left = 0) or
      (FClipRect.Bottom - FClipRect.Top = 0) then
      Exit;

    Dx := X2 - X1;
    Dy := Y2 - Y1;

    // check for trivial cases...
    if Abs(Dx) = Abs(Dy) then // diagonal line?
    begin
      LineTS(X1, Y1, X2, Y2, Value, L);
      Exit;
    end
    else
      if Dx = 0 then // vertical line?
    begin
      if Dy > 0 then
        VertLineTS(X1, Y1, Y2 - 1, Value)
      else
        if Dy < 0 then
        VertLineTS(X1, Y2 + 1, Y1, Value);
      if L then
        SetPixelTS(X2, Y2, Value);
      Exit;
    end
    else
      if Dy = 0 then // horizontal line?
    begin
      if Dx > 0 then
        HorzLineTS(X1, Y1, X2 - 1, Value)
      else
        if Dx < 0 then
        HorzLineTS(X2 + 1, Y1, X1, Value);
      if L then
        SetPixelTS(X2, Y2, Value);
      Exit;
    end;

    Cx1 := FClipRect.Left;
    Cx2 := FClipRect.Right - 1;
    Cy1 := FClipRect.Top;
    Cy2 := FClipRect.Bottom - 1;

    if Dx > 0 then
    begin
      if (X1 > Cx2) or (X2 < Cx1) then
        Exit; // segment not visible
      Sx := 1;
    end
    else
    begin
      if (X2 > Cx2) or (X1 < Cx1) then
        Exit; // segment not visible
      Sx := -1;
      X1 := -X1;
      X2 := -X2;
      Dx := -Dx;
      Cx1 := -Cx1;
      Cx2 := -Cx2;
      Swap(Cx1, Cx2);
    end;

    if Dy > 0 then
    begin
      if (Y1 > Cy2) or (Y2 < Cy1) then
        Exit; // segment not visible
      Sy := 1;
    end
    else
    begin
      if (Y2 > Cy2) or (Y1 < Cy1) then
        Exit; // segment not visible
      Sy := -1;
      Y1 := -Y1;
      Y2 := -Y2;
      Dy := -Dy;
      Cy1 := -Cy1;
      Cy2 := -Cy2;
      Swap(Cy1, Cy2);
    end;

    if Dx < Dy then
    begin
      Swap(X1, Y1);
      Swap(X2, Y2);
      Swap(Dx, Dy);
      Swap(Cx1, Cy1);
      Swap(Cx2, Cy2);
      Swap(Sx, Sy);
      D1 := @yd;
      D2 := @xd;
      PI := Sy;
    end
    else
    begin
      D1 := @xd;
      D2 := @yd;
      PI := Sy * Width;
    end;

    rem := 0;
    EA := Dy shl 16 div Dx;
    EC := 0;
    xd := X1;
    yd := Y1;
    CheckVert := True;
    CornerAA := False;
    BlendMemEx := BLEND_MEM_EX[FCombineMode];

    // clipping rect horizontal entry
    if Y1 < Cy1 then
    begin
      tmp := (Cy1 - Y1) * 65536;
      rem := tmp - 65536; // rem := (Cy1 - Y1 - 1) * 65536;
      if tmp mod EA > 0 then
        tmp := tmp div EA + 1
      else
        tmp := tmp div EA;

      xd := Min(xd + tmp, X2 + 1);
      EC := tmp * EA;

      if rem mod EA > 0 then
        rem := rem div EA + 1
      else
        rem := rem div EA;

      tmp := tmp - rem;

      // check whether the line is partly visible
      if xd > Cx2 then
        // do we need to draw an antialiased part on the corner of the clip rect?
        if xd <= Cx2 + tmp then
          CornerAA := True
        else
          Exit;

      if (xd {+ 1} >= Cx1) or CornerAA then
      begin
        yd := Cy1;
        rem := xd; // save old xd

        ED := EC - EA;
        term := SwapConstrain(xd - tmp, Cx1, Cx2);

        if CornerAA then
        begin
          Dec(ED, (xd - Cx2 - 1) * EA);
          xd := Cx2 + 1;
        end;

        // do we need to negate the vars?
        if Sy = -1 then
          yd := -yd;
        if Sx = -1 then
        begin
          xd := -xd;
          term := -term;
        end;

        // draw special case horizontal line entry (draw only last half of entering segment)
        try
          while xd <> term do
          begin
            Inc(xd, -Sx);
            BlendMemEx(Value, Bits[D1^ + D2^ * Width], GAMMA_TABLE[ED shr 8]);
            Dec(ED, EA);
          end;
        finally
          EMMS;
        end;

        if CornerAA then
        begin
          // we only needed to draw the visible antialiased part of the line,
          // everything else is outside of our cliprect, so exit now since
          // there is nothing more to paint...
          { TODO : Handle Changed here... }
          Changed;
          Exit;
        end;

        if Sy = -1 then
          yd := -yd; // negate back
        xd := rem; // restore old xd
        CheckVert := False; // to avoid ugly labels we set this to omit the next check
      end;
    end;

    // clipping rect vertical entry
    if CheckVert and (X1 < Cx1) then
    begin
      tmp := (Cx1 - X1) * EA;
      Inc(yd, tmp div 65536);
      EC := tmp;
      xd := Cx1;
      if (yd > Cy2) then
        Exit
      else
        if (yd = Cy2) then
        CornerAA := True;
    end;

    term := X2;
    TempClipped := False;
    CheckVert := False;

    // horizontal exit?
    if Y2 > Cy2 then
    begin
      tmp := (Cy2 - Y1) * 65536;
      term := X1 + tmp div EA;
      if not (tmp mod EA > 0) then
        Dec(Term);

      if term < Cx2 then
      begin
        rem := tmp + 65536; // was: rem := (Cy2 - Y1 + 1) * 65536;
        if rem mod EA > 0 then
          rem := X1 + rem div EA + 1
        else
          rem := X1 + rem div EA;

        if rem > Cx2 then
          rem := Cx2;
        CheckVert := True;
      end;

      TempClipped := True;
    end;

    if term > Cx2 then
    begin
      term := Cx2;
      TempClipped := True;
    end;

    Inc(term);

    if Sy = -1 then
      yd := -yd;
    if Sx = -1 then
    begin
      xd := -xd;
      term := -term;
      rem := -rem;
    end;

    // draw line
    if not CornerAA then
    try
      // do we need to skip the last pixel of the line and is temp not clipped?
      if not (L or TempClipped) and not CheckVert then
      begin
        if xd < term then
          Dec(term)
        else
          if xd > term then
          Inc(term);
      end;

      while xd <> term do
      begin
        CI := EC shr 8;
        P := @Bits[D1^ + D2^ * Width];
        BlendMemEx(Value, P^, GAMMA_TABLE[CI xor 255]);
        Inc(P, PI);
        BlendMemEx(Value, P^, GAMMA_TABLE[CI]);
        // check for overflow and jump to next line...
        D := EC;
        Inc(EC, EA);
        if EC <= D then
          Inc(yd, Sy);

        Inc(xd, Sx);
      end;
    finally
      EMMS;
    end;

    // draw special case horizontal line exit (draw only first half of exiting segment)
    if CheckVert then
    try
      while xd <> rem do
      begin
        BlendMemEx(Value, Bits[D1^ + D2^ * Width], GAMMA_TABLE[EC shr 8 xor 255]);
        Inc(EC, EA);
        Inc(xd, Sx);
      end;
    finally
      EMMS;
    end;
  end;

  ChangedEx(ChangedRect, AREAINFO_LINE + 2);
end;

procedure TCnsBitmap32.MoveTo(X, Y: Integer);
begin
  RasterX := X;
  RasterY := Y;
end;

procedure TCnsBitmap32.LineToS(X, Y: Integer);
begin
  LineS(RasterX, RasterY, X, Y, PenColor);
  RasterX := X;
  RasterY := Y;
end;

procedure TCnsBitmap32.LineToTS(X, Y: Integer);
begin
  LineTS(RasterX, RasterY, X, Y, PenColor);
  RasterX := X;
  RasterY := Y;
end;

procedure TCnsBitmap32.LineToAS(X, Y: Integer);
begin
  LineAS(RasterX, RasterY, X, Y, PenColor);
  RasterX := X;
  RasterY := Y;
end;

procedure TCnsBitmap32.MoveToX(X, Y: TFixed);
begin
  RasterXF := X;
  RasterYF := Y;
end;

procedure TCnsBitmap32.MoveToF(X, Y: Single);
begin
  RasterXF := Fixed(X);
  RasterYF := Fixed(Y);
end;

procedure TCnsBitmap32.LineToXS(X, Y: TFixed);
begin
  LineXS(RasterXF, RasterYF, X, Y, PenColor);
  RasterXF := X;
  RasterYF := Y;
end;

procedure TCnsBitmap32.LineToFS(X, Y: Single);
begin
  LineToXS(Fixed(X), Fixed(Y));
end;

procedure TCnsBitmap32.LineToXSP(X, Y: TFixed);
begin
  LineXSP(RasterXF, RasterYF, X, Y);
  RasterXF := X;
  RasterYF := Y;
end;

procedure TCnsBitmap32.LineToFSP(X, Y: Single);
begin
  LineToXSP(Fixed(X), Fixed(Y));
end;

procedure TCnsBitmap32.FillRect(X1, Y1, X2, Y2: Integer; Value: TColor32);
var
  j: Integer;
  P: PColor32Array;
begin
  for j := Y1 to Y2 - 1 do
  begin
    P := Pointer(@Bits[j * FWidth]);
    FillLongword(P[X1], X2 - X1, Value);
  end;
  ChangedEx(MakeRect(X1, Y1, X2, Y2));
end;

procedure TCnsBitmap32.FillRectS(X1, Y1, X2, Y2: Integer; Value: TColor32);
begin
  if not FMeasuringMode and
    (X2 > X1) and (Y2 > Y1) and
    (X1 < FClipRect.Right) and (Y1 < FClipRect.Bottom) and
    (X2 > FClipRect.Left) and (Y2 > FClipRect.Top) then
  begin
    if X1 < FClipRect.Left then
      X1 := FClipRect.Left;
    if Y1 < FClipRect.Top then
      Y1 := FClipRect.Top;
    if X2 > FClipRect.Right then
      X2 := FClipRect.Right;
    if Y2 > FClipRect.Bottom then
      Y2 := FClipRect.Bottom;
    FillRect(X1, Y1, X2, Y2, Value);
  end;
  ChangedEx(MakeRect(X1, Y1, X2, Y2));
end;

procedure TCnsBitmap32.FillRectT(X1, Y1, X2, Y2: Integer; Value: TColor32);
var
  i, j: Integer;
  P: PColor32;
  A: Integer;
begin
  A := Value shr 24;
  if A = $FF then
    FillRect(X1, Y1, X2, Y2, Value) // calls Changed...
  else
    if A <> 0 then
  try
    Dec(Y2);
    Dec(X2);
    for j := Y1 to Y2 do
    begin
      P := GetPixelPtr(X1, j);
      if CombineMode = cmBlend then
      begin
        for i := X1 to X2 do
        begin
          CombineMem(Value, P^, A);
          Inc(P);
        end;
      end
      else
      begin
        for i := X1 to X2 do
        begin
          MergeMem(Value, P^);
          Inc(P);
        end;
      end;
    end;
  finally
    EMMS;
    ChangedEx(MakeRect(X1, Y1, X2 + 1, Y2 + 1));
  end;
end;

procedure TCnsBitmap32.FillRectTS(X1, Y1, X2, Y2: Integer; Value: TColor32);
begin
  if not FMeasuringMode and
    (X2 > X1) and (Y2 > Y1) and
    (X1 < FClipRect.Right) and (Y1 < FClipRect.Bottom) and
    (X2 > FClipRect.Left) and (Y2 > FClipRect.Top) then
  begin
    if X1 < FClipRect.Left then
      X1 := FClipRect.Left;
    if Y1 < FClipRect.Top then
      Y1 := FClipRect.Top;
    if X2 > FClipRect.Right then
      X2 := FClipRect.Right;
    if Y2 > FClipRect.Bottom then
      Y2 := FClipRect.Bottom;
    FillRectT(X1, Y1, X2, Y2, Value);
  end;
  ChangedEx(MakeRect(X1, Y1, X2, Y2));
end;

procedure TCnsBitmap32.FillRectS(const ARect: TRect; Value: TColor32);
begin
  if FMeasuringMode then // shortcut...
    ChangedEx(ARect)
  else
    with ARect do
      FillRectS(Left, Top, Right, Bottom, Value);
end;

procedure TCnsBitmap32.FillRectTS(const ARect: TRect; Value: TColor32);
begin
  if FMeasuringMode then // shortcut...
    ChangedEx(ARect)
  else
    with ARect do
      FillRectTS(Left, Top, Right, Bottom, Value);
end;

procedure TCnsBitmap32.FrameRectS(X1, Y1, X2, Y2: Integer; Value: TColor32);
begin
  // measuring is handled in inner drawing operations...
  if (X2 > X1) and (Y2 > Y1) and
    (X1 < FClipRect.Right) and (Y1 < FClipRect.Bottom) and
    (X2 > FClipRect.Left) and (Y2 > FClipRect.Top) then
  begin
    Dec(Y2);
    Dec(X2);
    HorzLineS(X1, Y1, X2, Value);
    if Y2 > Y1 then
      HorzLineS(X1, Y2, X2, Value);
    if Y2 > Y1 + 1 then
    begin
      VertLineS(X1, Y1 + 1, Y2 - 1, Value);
      if X2 > X1 then
        VertLineS(X2, Y1 + 1, Y2 - 1, Value);
    end;
  end;
end;

procedure TCnsBitmap32.FrameRectTS(X1, Y1, X2, Y2: Integer; Value: TColor32);
begin
  // measuring is handled in inner drawing operations...
  if (X2 > X1) and (Y2 > Y1) and
    (X1 < FClipRect.Right) and (Y1 < FClipRect.Bottom) and
    (X2 > FClipRect.Left) and (Y2 > FClipRect.Top) then
  begin
    Dec(Y2);
    Dec(X2);
    HorzLineTS(X1, Y1, X2, Value);
    if Y2 > Y1 then
      HorzLineTS(X1, Y2, X2, Value);
    if Y2 > Y1 + 1 then
    begin
      VertLineTS(X1, Y1 + 1, Y2 - 1, Value);
      if X2 > X1 then
        VertLineTS(X2, Y1 + 1, Y2 - 1, Value);
    end;
  end;
end;

procedure TCnsBitmap32.FrameRectTSP(X1, Y1, X2, Y2: Integer);
begin
  // measuring is handled in inner drawing operations...
  if (X2 > X1) and (Y2 > Y1) and
    (X1 < Width) and (Y1 < Height) and // don't check against ClipRect here
  (X2 > 0) and (Y2 > 0) then // due to StippleCounter
  begin
    Dec(X2);
    Dec(Y2);
    if X1 = X2 then
      if Y1 = Y2 then
      begin
        SetPixelT(X1, Y1, GetStippleColor);
        ChangedEx(MakeRect(X1, Y1, X1 + 1, Y1 + 1));
      end
      else
        VertLineTSP(X1, Y1, Y2)
    else
      if Y1 = Y2 then
      HorzLineTSP(X1, Y1, X2)
    else
    begin
      HorzLineTSP(X1, Y1, X2 - 1);
      VertLineTSP(X2, Y1, Y2 - 1);
      HorzLineTSP(X2, Y2, X1 + 1);
      VertLineTSP(X1, Y2, Y1 + 1);
    end;
  end;
end;

procedure TCnsBitmap32.FrameRectS(const ARect: TRect; Value: TColor32);
begin
  with ARect do
    FrameRectS(Left, Top, Right, Bottom, Value);
end;

procedure TCnsBitmap32.FrameRectTS(const ARect: TRect; Value: TColor32);
begin
  with ARect do
    FrameRectTS(Left, Top, Right, Bottom, Value);
end;

procedure TCnsBitmap32.RaiseRectTS(X1, Y1, X2, Y2: Integer; Contrast: Integer);
var
  C1, C2: TColor32;
begin
  // measuring is handled in inner drawing operations...
  if (X2 > X1) and (Y2 > Y1) and
    (X1 < FClipRect.Right) and (Y1 < FClipRect.Bottom) and
    (X2 > FClipRect.Left) and (Y2 > FClipRect.Top) then
  begin
    if (Contrast > 0) then
    begin
      C1 := SetAlpha(clWhite32, Clamp(Contrast * 512 div 100));
      C2 := SetAlpha(clBlack32, Clamp(Contrast * 255 div 100));
    end
    else
      if Contrast < 0 then
    begin
      Contrast := -Contrast;
      C1 := SetAlpha(clBlack32, Clamp(Contrast * 255 div 100));
      C2 := SetAlpha(clWhite32, Clamp(Contrast * 512 div 100));
    end
    else
      Exit;

    Dec(X2);
    Dec(Y2);
    HorzLineTS(X1, Y1, X2, C1);
    HorzLineTS(X1, Y2, X2, C2);
    Inc(Y1);
    Dec(Y2);
    VertLineTS(X1, Y1, Y2, C1);
    VertLineTS(X2, Y1, Y2, C2);
  end;
end;

procedure TCnsBitmap32.RaiseRectTS(const ARect: TRect; Contrast: Integer);
begin
  with ARect do
    RaiseRectTS(Left, Top, Right, Bottom, Contrast);
end;

procedure TCnsBitmap32.LoadFromStream(Stream: TStream);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    B.LoadFromStream(Stream);
    Assign(B);
  finally
    B.Free;
    Changed;
  end;
end;

procedure TCnsBitmap32.SaveToStream(Stream: TStream);
begin
  with TBitmap.Create do
  try
    Assign(Self);
    SaveToStream(Stream);
  finally
    Free;
  end;
end;

function TCnsBitmap32.Equal(B: TCnsBitmap32): Boolean;
var
  S1, S2: TMemoryStream;
begin
  Result := (B <> nil) and (ClassType = B.ClassType);

  if Empty or B.Empty then
  begin
    Result := Empty and B.Empty;
    Exit;
  end;

  if Result then
  begin
    S1 := TMemoryStream.Create;
    try
      SaveToStream(S1);
      S2 := TMemoryStream.Create;
      try
        B.SaveToStream(S2);
        Result := (S1.Size = S2.Size) and CompareMem(S1.Memory, S2.Memory, S1.Size);
      finally
        S2.Free;
      end;
    finally
      S1.Free;
    end;
  end;
end;

procedure TCnsBitmap32.DefineProperties(Filer: TFiler);

  function DoWrite: Boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not (Filer.Ancestor is TCnsBitmap32) or
        not Equal(TCnsBitmap32(Filer.Ancestor))
    else
      Result := not Empty;
  end;

begin
  Filer.DefineBinaryProperty('Data', ReadData, WriteData, DoWrite);
end;

procedure TCnsBitmap32.ReadData(Stream: TStream);
var
  w, h: Integer;
begin
  try
    Stream.ReadBuffer(w, 4);
    Stream.ReadBuffer(h, 4);
    SetSize(w, h);
    Stream.ReadBuffer(FBits[0], FWidth * FHeight * 4);
  finally
    Changed;
  end;
end;

procedure TCnsBitmap32.WriteData(Stream: TStream);
begin
  Stream.WriteBuffer(FWidth, 4);
  Stream.WriteBuffer(FHeight, 4);
  Stream.WriteBuffer(FBits[0], FWidth * FHeight * 4);
end;

procedure TCnsBitmap32.LoadFromFile(const FileName: string);
var
  P: TPicture;
begin
  P := TPicture.Create;
  try
    P.LoadFromFile(FileName);
    Assign(P);
  finally
    P.Free;
  end;
end;

procedure TCnsBitmap32.SaveToFile(const FileName: string);
begin
  with TBitmap.Create do
  try
    Assign(Self);
    SaveToFile(FileName);
  finally
    Free;
  end;
end;

procedure TCnsBitmap32.LoadFromResourceID(Instance: THandle; ResID: Integer);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    B.LoadFromResourceID(Instance, ResID);
    Assign(B);
  finally
    B.Free;
    Changed;
  end;
end;

procedure TCnsBitmap32.LoadFromResourceName(Instance: THandle; const ResName: string);
var
  B: TBitmap;
begin
  B := TBitmap.Create;
  try
    B.LoadFromResourceName(Instance, ResName);
    Assign(B);
  finally
    B.Free;
    Changed;
  end;
end;

procedure TCnsBitmap32.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
  FontChanged(Self);
end;

procedure TCnsBitmap32.FontChanged(Sender: TObject);
begin
  {$IFDEF CLX}
  if Assigned(FontHandle) then
    FontHandle := nil;
  {$ELSE}
  if FontHandle <> 0 then
  begin
    if Handle <> 0 then
      SelectObject(Handle, StockFont);
    FontHandle := 0;
  end;
  {$ENDIF}
end;

procedure TCnsBitmap32.UpdateFont;
begin
  {$IFDEF CLX}
  FontHandle := Font.Handle;
  {$ELSE}
  if (FontHandle = 0) and (Handle <> 0) then
  begin
    SelectObject(Handle, Font.Handle);
    SetTextColor(Handle, ColorToRGB(Font.Color));
    SetBkMode(Handle, Windows.TRANSPARENT);
    FontHandle := Font.Handle;
  end
  else
  begin
    SelectObject(Handle, FontHandle);
    SetTextColor(Handle, ColorToRGB(Font.Color));
    SetBkMode(Handle, Windows.TRANSPARENT);
  end;
  {$ENDIF}
end;

procedure TCnsBitmap32.SetCombineMode(const Value: TCombineMode);
begin
  if FCombineMode <> Value then
  begin
    FCombineMode := Value;
    Changed;
  end;
end;

procedure TCnsBitmap32.SetDrawMode(Value: TDrawMode);
begin
  if FDrawMode <> Value then
  begin
    FDrawMode := Value;
    Changed;
  end;
end;

procedure TCnsBitmap32.SetWrapMode(Value: TWrapMode);
begin
  if FWrapMode <> Value then
  begin
    FWrapMode := Value;
    Changed;
  end;
end;

procedure TCnsBitmap32.SetMasterAlpha(Value: Cardinal);
begin
  if FMasterAlpha <> Value then
  begin
    FMasterAlpha := Value;
    Changed;
  end;
end;

// Text and Fonts //

{$IFDEF CLX}

function TCnsBitmap32.TextExtent(const Text: Widestring): TSize;
begin
  Result := TextExtentW(Text); // QT uses Unicode.
end;
{$ELSE}

function TCnsBitmap32.TextExtent(const Text: string): TSize;
var
  DC: HDC;
  OldFont: HGDIOBJ;
begin
  UpdateFont;
  Result.cX := 0;
  Result.cY := 0;
  if Handle <> 0 then
    Windows.GetTextExtentPoint32(Handle, PChar(Text), Length(Text), Result)
  else
  begin
    StockBitmap.Canvas.Lock;
    try
      DC := StockBitmap.Canvas.Handle;
      OldFont := SelectObject(DC, Font.Handle);
      Windows.GetTextExtentPoint32(DC, PChar(Text), Length(Text), Result);
      SelectObject(DC, OldFont);
    finally
      StockBitmap.Canvas.Unlock;
    end;
  end;
end;
{$ENDIF}

// -------------------------------------------------------------------

function TCnsBitmap32.TextExtentW(const Text: Widestring): TSize;
var
  {$IFDEF CLX}
  OldFont: TFont;
  {$ELSE}
  DC: HDC;
  OldFont: HGDIOBJ;
  {$ENDIF}
begin
  UpdateFont;
  Result.cX := 0;
  Result.cY := 0;
  {$IFDEF CLX}
  if Assigned(Handle) then
  begin // doing it the ugly way to avoid QImage <-> QPixMap conversion.
    with TBitmap.Create do
    try
      Width := 5;
      Height := 5;
      Canvas.Font.Assign(Font);
      Result := Canvas.TextExtent(Text);
    finally
      Free;
    end;
  end
  else
  begin
    StockBitmap.Canvas.Lock;
    try
      OldFont := TFont.Create;
      OldFont.Assign(StockBitmap.Canvas.Font);
      StockBitmap.Canvas.Font.Assign(Font);
      Result := StockBitmap.Canvas.TextExtent(Text);
      StockBitmap.Canvas.Font.Assign(OldFont);
      OldFont.Free;
    finally
      StockBitmap.Canvas.Unlock;
    end;
  end;
  {$ELSE}
  if Handle <> 0 then
    Windows.GetTextExtentPoint32W(Handle, PWideChar(Text), Length(Text), Result)
  else
  begin
    StockBitmap.Canvas.Lock;
    try
      DC := StockBitmap.Canvas.Handle;
      OldFont := SelectObject(DC, Font.Handle);
      Windows.GetTextExtentPoint32W(DC, PWideChar(Text), Length(Text), Result);
      SelectObject(DC, OldFont);
    finally
      StockBitmap.Canvas.Unlock;
    end;
  end;
  {$ENDIF};
end;

// -------------------------------------------------------------------

{$IFDEF CLX}

procedure TCnsBitmap32.Textout(X, Y: Integer; const Text: Widestring);
begin
  TextoutW(X, Y, Text); // QT uses Unicode
end;
{$ELSE}

procedure TCnsBitmap32.Textout(X, Y: Integer; const Text: string);
var
  Extent: TSize;
begin
  UpdateFont;

  if not FMeasuringMode then
  begin
    if FClipping then
      ExtTextout(Handle, X, Y, ETO_CLIPPED, @FClipRect, PChar(Text), Length(Text), nil)
    else
      ExtTextout(Handle, X, Y, 0, nil, PChar(Text), Length(Text), nil);
  end;

  Extent := TextExtent(Text);
  ChangedEx(MakeRect(X, Y, X + Extent.cx + 1, Y + Extent.cy + 1));
end;
{$ENDIF}

procedure TCnsBitmap32.TextoutW(X, Y: Integer; const Text: Widestring);
var
  Extent: TSize;
  {$IFDEF CLX}
  R: TRect;
  {$ENDIF}
begin
  UpdateFont;
  if not FMeasuringMode then
  begin
    {$IFDEF CLX}
    StartPainter;
    R := MakeRect(X, Y, High(Word), High(Word));
    QPainter_setFont(Handle, Font.Handle);
    QPainter_setPen(Handle, Font.FontPen);

    if FClipping then
    begin
      QPainter_setClipRect(Handle, @FClipRect);
      QPainter_setClipping(Handle, True);
    end;
    QPainter_drawText(Handle, @R, 0, @Text, -1, nil, nil);
    if FClipping then
      QPainter_setClipping(Handle, False);
    StopPainter;
    {$ELSE}
    if FClipping then
      ExtTextoutW(Handle, X, Y, ETO_CLIPPED, @FClipRect, PWideChar(Text), Length(Text), nil)
    else
      ExtTextoutW(Handle, X, Y, 0, nil, PWideChar(Text), Length(Text), nil);
    {$ENDIF}
  end;
  Extent := TextExtentW(Text);
  ChangedEx(MakeRect(X, Y, X + Extent.cx + 1, Y + Extent.cy + 1));
end;

// -------------------------------------------------------------------

{$IFDEF CLX}

procedure TCnsBitmap32.Textout(X, Y: Integer; const ClipRect: TRect; const Text: Widestring);
begin
  TextoutW(X, Y, ClipRect, Text);
end;
{$ELSE}

procedure TCnsBitmap32.Textout(X, Y: Integer; const ClipRect: TRect; const Text: string);
var
  Extent: TSize;
begin
  UpdateFont;
  if not FMeasuringMode then
    ExtTextout(Handle, X, Y, ETO_CLIPPED, @ClipRect, PChar(Text), Length(Text), nil);
  Extent := TextExtent(Text);
  ChangedEx(MakeRect(X, Y, X + Extent.cx + 1, Y + Extent.cy + 1));
end;
{$ENDIF}

procedure TCnsBitmap32.TextoutW(X, Y: Integer; const ClipRect: TRect; const Text: Widestring);
var
  Extent: TSize;
  {$IFDEF CLX}
  TextW: WideString;
  R: TRect;
  {$ENDIF}
begin
  UpdateFont;
  if not FMeasuringMode then
  begin
    {$IFDEF CLX}
    StartPainter;
    TextW := WideString(Text);
    R := MakeRect(X, Y, High(Word), High(Word));
    QPainter_setFont(Handle, Font.Handle);
    QPainter_setPen(Handle, Font.FontPen);
    QPainter_setClipRect(Handle, @ClipRect);
    QPainter_setClipping(Handle, True);
    QPainter_drawText(Handle, @R, 0, @TextW, -1, nil, nil);
    QPainter_setClipping(Handle, False);
    StopPainter;
    {$ELSE}
    ExtTextoutW(Handle, X, Y, ETO_CLIPPED, @ClipRect, PWideChar(Text), Length(Text), nil);
    {$ENDIF}
  end;
  Extent := TextExtentW(Text);
  ChangedEx(MakeRect(X, Y, X + Extent.cx + 1, Y + Extent.cy + 1));
end;

// -------------------------------------------------------------------

{$IFDEF CLX}

procedure TCnsBitmap32.Textout(DstRect: TRect; const Flags: Cardinal; const Text: Widestring);
begin
  TextoutW(DstRect, Flags, Text);
end;
{$ELSE}

procedure TCnsBitmap32.Textout(DstRect: TRect; const Flags: Cardinal; const Text: string);
begin
  UpdateFont;
  if not FMeasuringMode then
    DrawText(Handle, PChar(Text), Length(Text), DstRect, Flags);
  ChangedEx(DstRect);
end;
{$ENDIF}

procedure TCnsBitmap32.TextoutW(DstRect: TRect; const Flags: Cardinal;
  const Text: Widestring);
begin
  UpdateFont;
  if not FMeasuringMode then
  begin
    {$IFDEF CLX}
    StartPainter;
    QPainter_setFont(Handle, Font.Handle);
    QPainter_setPen(Handle, Font.FontPen);
    QPainter_drawText(Handle, @DstRect, Flags, @Text, -1, nil, nil);
    StopPainter;
    {$ELSE}
    DrawTextW(Handle, PWideChar(Text), Length(Text), DstRect, Flags);
    {$ENDIF}
  end;
  ChangedEx(DstRect);
end;

// -------------------------------------------------------------------

{$IFDEF CLX}

function TCnsBitmap32.TextHeight(const Text: Widestring): Integer;
begin
  Result := TextExtentW(Text).cY;
end;
{$ELSE}

function TCnsBitmap32.TextHeight(const Text: string): Integer;
begin
  Result := TextExtent(Text).cY;
end;
{$ENDIF}

function TCnsBitmap32.TextHeightW(const Text: Widestring): Integer;
begin
  Result := TextExtentW(Text).cY;
end;

// -------------------------------------------------------------------

{$IFDEF CLX}

function TCnsBitmap32.TextWidth(const Text: Widestring): Integer;
begin
  Result := TextExtentW(Text).cX;
end;
{$ELSE}

function TCnsBitmap32.TextWidth(const Text: string): Integer;
begin
  Result := TextExtent(Text).cX;
end;
{$ENDIF}

function TCnsBitmap32.TextWidthW(const Text: Widestring): Integer;
begin
  Result := TextExtentW(Text).cX;
end;

// -------------------------------------------------------------------

procedure TCnsBitmap32.TextScaleDown(const B, B2: TCnsBitmap32; const N: Integer;
  const Color: TColor32); // use only the blue channel
var
  I, J, X, Y, P, Q, Sz, S: Integer;
  Src: PColor32;
  Dst: PColor32;
begin
  Sz := 1 shl N - 1;
  Dst := B.PixelPtr[0, 0];
  for J := 0 to B.Height - 1 do
  begin
    Y := J shl N;
    for I := 0 to B.Width - 1 do
    begin
      X := I shl N;
      S := 0;
      for Q := Y to Y + Sz do
      begin
        Src := B2.PixelPtr[X, Q];
        for P := X to X + Sz do
        begin
          S := S + Integer(Src^ and $000000FF);
          Inc(Src);
        end;
      end;
      S := S shr N shr N;
      Dst^ := TColor32(S shl 24) + Color;
      Inc(Dst);
    end;
  end;
end;

procedure TCnsBitmap32.TextBlueToAlpha(const B: TCnsBitmap32; const Color: TColor32);
var
  I: Integer;
  P: PColor32;
  C: TColor32;
begin
  // convert blue channel to alpha and fill the color
  P := @B.Bits[0];
  for I := 0 to B.Width * B.Height - 1 do
  begin
    C := P^;
    if C <> 0 then
    begin
      C := P^ shl 24; // transfer blue channel to alpha
      C := C + Color;
      P^ := C;
    end;
    Inc(P);
  end;
end;

{$IFDEF CLX}

procedure TCnsBitmap32.RenderText(X, Y: Integer; const Text: Widestring; AALevel: Integer; Color:
  TColor32);
begin
  RenderTextW(X, Y, Text, AALevel, Color); // QT does Unicode
end;
{$ELSE}

procedure SetFontAntialiasing(const Font: TFont; Quality: Cardinal);
var
  LogFont: TLogFont;
begin
  with LogFont do
  begin
    lfHeight := Font.Height;
    lfWidth := 0; { have font mapper choose }

    {$IFDEF COMPILER2005}
    lfEscapement := Font.Orientation;
    lfOrientation := Font.Orientation;
    {$ELSE}
    lfEscapement := 0;
    lfOrientation := 0;
    {$ENDIF}

    if fsBold in Font.Style then
      lfWeight := FW_BOLD
    else
      lfWeight := FW_NORMAL;

    lfItalic := Byte(fsItalic in Font.Style);
    lfUnderline := Byte(fsUnderline in Font.Style);
    lfStrikeOut := Byte(fsStrikeOut in Font.Style);
    lfCharSet := Byte(Font.Charset);

    if AnsiCompareText(Font.Name, 'Default') = 0 then // do not localize
      StrPCopy(lfFaceName, DefFontData.Name)
    else
      StrPCopy(lfFaceName, Font.Name);

    lfQuality := Quality;

    { Only True Type fonts support the angles }
    if lfOrientation <> 0 then
      lfOutPrecision := OUT_TT_ONLY_PRECIS
    else
      lfOutPrecision := OUT_DEFAULT_PRECIS;

    lfClipPrecision := CLIP_DEFAULT_PRECIS;

    case Font.Pitch of
      fpVariable: lfPitchAndFamily := VARIABLE_PITCH;
      fpFixed: lfPitchAndFamily := FIXED_PITCH;
    else
      lfPitchAndFamily := DEFAULT_PITCH;
    end;
  end;
  Font.Handle := CreateFontIndirect(LogFont);
end;

procedure TCnsBitmap32.RenderText(X, Y: Integer; const Text: string; AALevel: Integer; Color:
  TColor32);
var
  B, B2: TCnsBitmap32;
  Sz: TSize;
  Alpha: TColor32;
  StockCanvas: TCanvas;
  PaddedText: string;
begin
  if Empty then
    Exit;

  Alpha := Color shr 24;
  Color := Color and $00FFFFFF;
  AALevel := Constrain(AALevel, -1, 4);
  PaddedText := Text + ' ';

  if AALevel > -1 then
    SetFontAntialiasing(Font, NONANTIALIASED_QUALITY)
  else
    SetFontAntialiasing(Font, ANTIALIASED_QUALITY);

  { TODO : Optimize Clipping here }
  B := TCnsBitmap32.Create;
  try
    if AALevel = 0 then
    begin
      TextBlueToAlpha(B, Color);
      Sz := TextExtent(PaddedText);
      B.SetSize(Sz.cX, Sz.cY);
      B.Font := Font;
      B.Clear(0);
      B.Font.Color := clWhite;
      B.Textout(0, 0, Text);
      TextBlueToAlpha(B, Color);
    end
    else
    begin
      StockCanvas := StockBitmap.Canvas;
      StockCanvas.Lock;
      try
        StockCanvas.Font := Font;
        StockCanvas.Font.Size := Font.Size shl AALevel;
        Sz := StockCanvas.TextExtent(PaddedText);
        Sz.Cx := (Sz.cx shr AALevel + 1) shl AALevel;
        Sz.Cy := (Sz.cy shr AALevel + 1) shl AALevel;
        B2 := TCnsBitmap32.Create;
        try
          B2.SetSize(Sz.Cx, Sz.Cy);
          B2.Clear(0);
          B2.Font := StockCanvas.Font;
          B2.Font.Color := clWhite;
          B2.Textout(0, 0, Text);
          B.SetSize(Sz.cx shr AALevel, Sz.cy shr AALevel);
          TextScaleDown(B, B2, AALevel, Color);
        finally
          B2.Free;
        end;
      finally
        StockCanvas.Unlock;
      end;
    end;

    B.DrawMode := dmBlend;
    B.MasterAlpha := Alpha;
    B.CombineMode := CombineMode;
    if Font.Size >= 7 then
      B.DrawTo(Self, X, Y)
    else
      B.DrawTo(self, Rect(X, Y, X + Round(b.Width * Font.Size / 8), Y + Round(b.Height * Font.Size
        / 8)));
  finally
    B.Free;
  end;

  SetFontAntialiasing(Font, DEFAULT_QUALITY);
end;
{$ENDIF}

procedure TCnsBitmap32.RenderTextW(X, Y: Integer; const Text: Widestring; AALevel: Integer; Color:
  TColor32);
var
  B, B2: TCnsBitmap32;
  Sz: TSize;
  Alpha: TColor32;
  StockCanvas: TCanvas;
  PaddedText: Widestring;
begin
  if Empty then
    Exit;

  Alpha := Color shr 24;
  Color := Color and $00FFFFFF;
  AALevel := Constrain(AALevel, -1, 4);
  PaddedText := Text + ' ';

  {$IFNDEF CLX}
  if AALevel > -1 then
    SetFontAntialiasing(Font, NONANTIALIASED_QUALITY)
  else
    SetFontAntialiasing(Font, ANTIALIASED_QUALITY);
  {$ENDIF}

  { TODO : Optimize Clipping here }
  B := TCnsBitmap32.Create;
  try
    if AALevel = 0 then
    begin
      {$IFDEF CLX}
      B.Font := Font;
      Sz := B.TextExtentW(PaddedText);
      B.SetSize(Sz.cX, Sz.cY);
      {$ELSE}
      Sz := TextExtentW(PaddedText);
      B.SetSize(Sz.cX, Sz.cY);
      B.Font := Font;
      {$ENDIF}
      B.Clear(0);
      B.Font.Color := clWhite;
      B.TextoutW(0, 0, Text);
      TextBlueToAlpha(B, Color);
    end
    else
    begin
      StockCanvas := StockBitmap.Canvas;
      StockCanvas.Lock;
      try
        StockCanvas.Font := Font;
        StockCanvas.Font.Size := Font.Size shl AALevel;
        {$IFDEF CLX}
        Sz := StockCanvas.TextExtent(PaddedText);
        {$ELSE}
        Windows.GetTextExtentPoint32W(StockCanvas.Handle, PWideChar(PaddedText),
          Length(PaddedText), Sz);
        {$ENDIF}
        Sz.Cx := (Sz.cx shr AALevel + 1) shl AALevel;
        Sz.Cy := (Sz.cy shr AALevel + 1) shl AALevel;
        B2 := TCnsBitmap32.Create;
        try
          B2.SetSize(Sz.Cx, Sz.Cy);
          B2.Clear(0);
          B2.Font := StockCanvas.Font;
          B2.Font.Color := clWhite;
          B2.TextoutW(0, 0, Text);
          B.SetSize(Sz.cx shr AALevel, Sz.cy shr AALevel);
          TextScaleDown(B, B2, AALevel, Color);
        finally
          B2.Free;
        end;
      finally
        StockCanvas.Unlock;
      end;
    end;

    B.DrawMode := dmBlend;
    B.MasterAlpha := Alpha;
    B.CombineMode := CombineMode;

    B.DrawTo(Self, X, Y);
  finally
    B.Free;
  end;
  {$IFNDEF CLX}
  SetFontAntialiasing(Font, DEFAULT_QUALITY);
  {$ENDIF}
end;

// -------------------------------------------------------------------

procedure TCnsBitmap32.Roll(Dx, Dy: Integer; FillBack: Boolean; FillColor: TColor32);
var
  Shift, L: Integer;
  R: TRect;
begin
  if Empty or ((Dx = 0) and (Dy = 0)) then
    Exit;
  if (Abs(Dx) >= Width) or (Abs(Dy) >= Height) then
  begin
    if FillBack then
      Clear(FillColor);
    Exit;
  end;

  Shift := Dx + Dy * Width;
  L := (Width * Height - Abs(Shift));

  if Shift > 0 then
    Move(Bits[0], Bits[Shift], L shl 2)
  else
    MoveLongword(Bits[-Shift], Bits[0], L);

  if FillBack then
  begin
    R := MakeRect(0, 0, Width, Height);
    OffsetRect(R, Dx, Dy);
    IntersectRect(R, R, MakeRect(0, 0, Width, Height));
    if R.Top > 0 then
      FillRect(0, 0, Width, R.Top, FillColor)
    else
      if R.Top = 0 then
      FillRect(0, R.Bottom, Width, Height, FillColor);
    if R.Left > 0 then
      FillRect(0, R.Top, R.Left, R.Bottom, FillColor)
    else
      if R.Left = 0 then
      FillRect(R.Right, R.Top, Width, R.Bottom, FillColor);
  end;

  Changed;
end;

procedure TCnsBitmap32.FlipHorz(Dst: TCnsBitmap32);
var
  i, j: Integer;
  P1, P2: PColor32;
  tmp: TColor32;
  W, W2: Integer;
begin
  W := Width;
  if (Dst = nil) or (Dst = Self) then
  begin
    { In-place flipping }
    P1 := PColor32(Bits);
    P2 := P1;
    Inc(P2, Width - 1);
    W2 := Width shr 1;
    for J := 0 to Height - 1 do
    begin
      for I := 0 to W2 - 1 do
      begin
        tmp := P1^;
        P1^ := P2^;
        P2^ := tmp;
        Inc(P1);
        Dec(P2);
      end;
      Inc(P1, W - W2);
      Inc(P2, W + W2);
    end;
    Changed;
  end
  else
  begin
    { Flip to Dst }
    Dst.BeginUpdate;
    Dst.SetSize(W, Height);
    P1 := PColor32(Bits);
    P2 := PColor32(Dst.Bits);
    Inc(P2, W - 1);
    for J := 0 to Height - 1 do
    begin
      for I := 0 to W - 1 do
      begin
        P2^ := P1^;
        Inc(P1);
        Dec(P2);
      end;
      Inc(P2, W shl 1);
    end;
    Dst.EndUpdate;
    Dst.Changed;
  end;
end;

procedure TCnsBitmap32.FlipVert(Dst: TCnsBitmap32);
var
  J, J2: Integer;
  Buffer: PColor32Array;
  P1, P2: PColor32;
begin
  if (Dst = nil) or (Dst = Self) then
  begin
    { in-place }
    J2 := Height - 1;
    GetMem(Buffer, Width shl 2);
    for J := 0 to Height div 2 - 1 do
    begin
      P1 := PixelPtr[0, J];
      P2 := PixelPtr[0, J2];
      MoveLongword(P1^, Buffer^, Width);
      MoveLongword(P2^, P1^, Width);
      MoveLongword(Buffer^, P2^, Width);
      Dec(J2);
    end;
    FreeMem(Buffer);
    Changed;
  end
  else
  begin
    Dst.SetSize(Width, Height);
    J2 := Height - 1;
    for J := 0 to Height - 1 do
    begin
      MoveLongword(PixelPtr[0, J]^, Dst.PixelPtr[0, J2]^, Width);
      Dec(J2);
    end;
    Dst.Changed;
  end;
end;

procedure TCnsBitmap32.Rotate90(Dst: TCnsBitmap32);
var
  Tmp: TCnsBitmap32;
  X, Y, I, J: Integer;
begin
  if Dst = nil then
  begin
    Tmp := TCnsBitmap32.Create;
    Dst := Tmp;
  end
  else
  begin
    Tmp := nil;
    Dst.BeginUpdate;
  end;

  Dst.SetSize(Height, Width);
  I := 0;
  for Y := 0 to Height - 1 do
  begin
    J := Height - 1 - Y;
    for X := 0 to Width - 1 do
    begin
      Dst.Bits[J] := Bits[I];
      Inc(I);
      Inc(J, Height);
    end;
  end;

  if Tmp <> nil then
  begin
    Tmp.CopyMapTo(Self);
    Tmp.Free;
  end
  else
  begin
    Dst.EndUpdate;
    Dst.Changed;
  end;
end;

procedure TCnsBitmap32.Rotate180(Dst: TCnsBitmap32);
var
  I, I2: Integer;
  Tmp: TColor32;
begin
  if Dst <> nil then
  begin
    Dst.SetSize(Width, Height);
    I2 := Width * Height - 1;
    for I := 0 to Width * Height - 1 do
    begin
      Dst.Bits[I2] := Bits[I];
      Dec(I2);
    end;
    Dst.Changed;
  end
  else
  begin
    I2 := Width * Height - 1;
    for I := 0 to Width * Height div 2 - 1 do
    begin
      Tmp := Bits[I2];
      Bits[I2] := Bits[I];
      Bits[I] := Tmp;
      Dec(I2);
    end;
    Changed;
  end;
end;

procedure TCnsBitmap32.Rotate270(Dst: TCnsBitmap32);
var
  Tmp: TCnsBitmap32;
  X, Y, I, J: Integer;
begin
  if Dst = nil then
  begin
    Tmp := TCnsBitmap32.Create;
    Dst := Tmp;
  end
  else
  begin
    Tmp := nil;
    Dst.BeginUpdate;
  end;

  Dst.SetSize(Height, Width);
  I := 0;
  for Y := 0 to Height - 1 do
  begin
    J := (Width - 1) * Height + Y;
    for X := 0 to Width - 1 do
    begin
      Dst.Bits[J] := Bits[I];
      Inc(I);
      Dec(J, Height);
    end;
  end;

  if Tmp <> nil then
  begin
    Tmp.CopyMapTo(Self);
    Tmp.Free;
  end
  else
    Dst.Changed;
end;

function TCnsBitmap32.BoundsRect: TRect;
begin
  Result.Left := 0;
  Result.Top := 0;
  Result.Right := Width;
  Result.Bottom := Height;
end;

procedure TCnsBitmap32.SetClipRect(const Value: TRect);
begin
  IntersectRect(FClipRect, Value, BoundsRect);
  FFixedClipRect := FixedRect(FClipRect);
  with FClipRect do
    F256ClipRect := Rect(Left shl 8, Top shl 8, Right shl 8, Bottom shl 8);
  FClipping := not EqualRect(FClipRect, BoundsRect);
end;

procedure TCnsBitmap32.ResetClipRect;
begin
  ClipRect := BoundsRect;
end;

procedure TCnsBitmap32.BeginMeasuring(const Callback: TAreaChangedEvent);
begin
  FMeasuringMode := True;
  FOldOnAreaChanged := FOnAreaChanged;
  FOnAreaChanged := Callback;
end;

procedure TCnsBitmap32.EndMeasuring;
begin
  FMeasuringMode := False;
  FOnAreaChanged := FOldOnAreaChanged;
end;

procedure TCnsBitmap32.PropertyChanged;
begin
  // don't force invalidation of whole bitmap area as this is unnecessary
  inherited Changed;
end;

procedure TCnsBitmap32.Changed;
begin
  if ((FUpdateCount = 0) or FMeasuringMode) and Assigned(FOnAreaChanged) then
    FOnAreaChanged(Self, BoundsRect, AREAINFO_RECT);

  if not FMeasuringMode then
    inherited;
end;

procedure TCnsBitmap32.ChangedEx(const Area: TRect; const Info: Cardinal);
begin
  if ((FUpdateCount = 0) or FMeasuringMode) and Assigned(FOnAreaChanged) then
    FOnAreaChanged(Self, Area, Info);

  if not FMeasuringMode then
    inherited Changed;
end;

{$IFDEF CLX}

procedure TCnsBitmap32.PixmapNeeded;
begin
  if Assigned(FPixmap) and Assigned(FHandle) and not FPixmapActive then
  begin
    QPixmap_convertFromImage(FPixmap, FHandle, QPixmapColorMode(QPixmapColorMode_Auto));
    FPixmapActive := True;
    FPixmapChanged := False;
  end;
end;

procedure TCnsBitmap32.ImageNeeded;
begin
  if Assigned(FPixmap) and Assigned(FHandle) and FPixmapActive and FPixmapChanged then
  begin
    QPixmap_convertToImage(FPixmap, FHandle);
    FPixmapActive := False;
    FPixmapChanged := False;
    FBits := Pointer(QImage_bits(FHandle));
  end;
end;

procedure TCnsBitmap32.CheckPixmap;
begin
  if not FPixmapChanged then
    // try to avoid QPixmap -> QImage conversion, since we don't need that.
    FPixmapActive := False;
  // else the conversion takes place as soon as the Bits property is accessed.
end;

function TCnsBitmap32.GetBits: PColor32Array;
begin
  ImageNeeded;
  Result := FBits;
end;

function TCnsBitmap32.GetImage: QImageH;
begin
  ImageNeeded;
  Result := FHandle;
end;

function TCnsBitmap32.GetPixmap: QPixmapH;
begin
  PixmapNeeded;
  Result := FPixmap;
end;

function TCnsBitmap32.GetPainter: QPainterH;
begin
  PixmapNeeded;
  Result := FHDC;
end;

procedure TCnsBitmap32.StartPainter;
begin
  if (FPainterCount = 0) and not QPainter_isActive(Handle) then
    if not QPainter_begin(Handle, Pixmap) then
      raise EInvalidGraphicOperation.CreateRes(@SInvalidCanvasState);

  Inc(FPainterCount);
end;

procedure TCnsBitmap32.StopPainter;
begin
  Dec(FPainterCount);
  if (FPainterCount = 0) then
  begin
    QPainter_end(Handle);
    FPixmapChanged := True;
  end;
end;

{ TBitmap32Canvas }

procedure TBitmap32Canvas.BeginPainting;
begin
  if not QPainter_isActive(FBitmap.Handle) then
    if not QPainter_begin(FBitmap.Handle, FBitmap.Pixmap) then
      raise EInvalidGraphicOperation.CreateRes(@SInvalidCanvasState);

  FBitmap.PixmapChanged := True; // whatever happens, we've potentially changed
  // the Pixmap, so propagate that status...
end;

constructor TCnsBitmap32Canvas.Create(Bitmap: TCnsBitmap32);
begin
  inherited Create;
  FBitmap := Bitmap;
end;

procedure TCnsBitmap32Canvas.CreateHandle;
begin
  Handle := QPainter_create;
end;

{$ENDIF}

{ Interpolators }

function _Interpolator(WX_256, WY_256: Cardinal; C11, C21: PColor32): TColor32;
var
  C1, C3: TColor32;
begin
  if WX_256 > $FF then
    WX_256 := $FF;
  if WY_256 > $FF then
    WY_256 := $FF;
  C1 := C11^;
  Inc(C11);
  C3 := C21^;
  Inc(C21);
  Result := CombineReg(CombineReg(C1, C11^, WX_256),
    CombineReg(C3, C21^, WX_256), WY_256);
end;

function M_Interpolator(WX_256, WY_256: Cardinal; C11, C21: PColor32): TColor32;
asm
        db $0F,$6F,$09           /// MOVQ      MM1,[ECX]
        MOV       ECX,C21
        db $0F,$6F,$19           /// MOVQ      MM3,[ECX]
        db $0F,$6F,$D1           /// MOVQ      MM2,MM1
        db $0F,$6F,$E3           /// MOVQ      MM4,MM3
        db $0F,$73,$D1,$20       /// PSRLQ     MM1,32
        db $0F,$73,$D3,$20       /// PSRLQ     MM3,32

        db $0F,$6E,$E8           /// MOVD      MM5,EAX
        db $0F,$61,$ED           /// PUNPCKLWD MM5,MM5
        db $0F,$62,$ED           /// PUNPCKLDQ MM5,MM5

        db $0F,$EF,$C0           /// PXOR MM0, MM0

        db $0F,$60,$C8           /// PUNPCKLBW MM1,MM0
        db $0F,$60,$D0           /// PUNPCKLBW MM2,MM0
        db $0F,$F9,$D1           /// PSUBW     MM2,MM1
        db $0F,$D5,$D5           /// PMULLW    MM2,MM5
        db $0F,$71,$F1,$08       /// PSLLW     MM1,8
        db $0F,$FD,$D1           /// PADDW     MM2,MM1
        db $0F,$71,$D2,$08       /// PSRLW     MM2,8

        db $0F,$60,$D8           /// PUNPCKLBW MM3,MM0
        db $0F,$60,$E0           /// PUNPCKLBW MM4,MM0
        db $0F,$F9,$E3           /// PSUBW     MM4,MM3
        db $0F,$D5,$E5           /// PMULLW    MM4,MM5
        db $0F,$71,$F3,$08       /// PSLLW     MM3,8
        db $0F,$FD,$E3           /// PADDW     MM4,MM3
        db $0F,$71,$D4,$08       /// PSRLW     MM4,8

        db $0F,$6E,$EA           /// MOVD      MM5,EDX
        db $0F,$61,$ED           /// PUNPCKLWD MM5,MM5
        db $0F,$62,$ED           /// PUNPCKLDQ MM5,MM5

        db $0F,$F9,$D4           /// PSUBW     MM2,MM4
        db $0F,$D5,$D5           /// PMULLW    MM2,MM5
        db $0F,$71,$F4,$08       /// PSLLW     MM4,8
        db $0F,$FD,$D4           /// PADDW     MM2,MM4
        db $0F,$71,$D2,$08       /// PSRLW     MM2,8

        db $0F,$67,$D0           /// PACKUSWB  MM2,MM0
        db $0F,$7E,$D0           /// MOVD      EAX,MM2
end;

procedure SetupFunctions;
var
  MMX_ACTIVE: Boolean;
  ACTIVE_3DNow: Boolean;
begin
  MMX_ACTIVE := HasMMX;
  ACTIVE_3DNow := Has3DNow;
  if ACTIVE_3DNow then
  begin
    // link 3DNow functions
    Interpolator := M_Interpolator;
  end
  else
    if MMX_ACTIVE then
  begin
    // link MMX functions
    Interpolator := M_Interpolator;
  end
  else
  begin
    // link IA32 functions
    Interpolator := _Interpolator;
  end
end;

procedure TCnsBitmap32.SetResampler(Resampler: TCustomResampler);
begin
  if Assigned(Resampler) and (FResampler <> Resampler) then
  begin
    if Assigned(FResampler) then
      FResampler.Free;
    FResampler := Resampler;
    Changed;
  end;
end;

function TCnsBitmap32.GetResamplerClassName: string;
begin
  Result := FResampler.ClassName;
end;

procedure TCnsBitmap32.SetResamplerClassName(Value: string);
var
  ResamplerClass: TBitmap32ResamplerClass;
begin
  if (Value <> '') and (FResampler.ClassName <> Value) and Assigned(ResamplerList) then
  begin
    ResamplerClass := TBitmap32ResamplerClass(ResamplerList.Find(Value));
    if Assigned(ResamplerClass) then
      ResamplerClass.Create(Self);
  end;
end;

{ TCustomSampler }

function TCustomSampler.GetSampleInt(X, Y: Integer): TColor32;
begin
  Result := GetSampleFixed(X * FixedOne, Y * FixedOne);
end;

function TCustomSampler.GetSampleFixed(X, Y: TFixed): TColor32;
begin
  Result := GetSampleFloat(X * FixedToFloat, Y * FixedToFloat);
end;

function TCustomSampler.GetSampleFloat(X, Y: TFloat): TColor32;
begin
  Result := GetSampleFixed(Fixed(X), Fixed(Y));
end;

procedure TCustomSampler.PrepareSampling;
begin
end;

procedure TCustomSampler.FinalizeSampling;
begin
end;

function TCustomSampler.HasBounds: Boolean;
begin
  Result := False;
end;

function TCustomSampler.GetSampleBounds: TRect;
begin
  Result := Rect(Low(Integer), Low(Integer), High(Integer), High(Integer));
end;

{ Fixed-point math }

function FixedFloor(A: TFixed): Integer;
asm
        SAR     EAX, 16;
end;

function FixedCeil(A: TFixed): Integer;
asm
        ADD     EAX, $0000FFFF
        SAR     EAX, 16;
end;

function FixedRound(A: TFixed): Integer;
asm
        ADD     EAX, $00007FFF
        SAR     EAX, 16
end;

function FixedMul(A, B: TFixed): TFixed;
asm
        IMUL    EDX
        SHRD    EAX, EDX, 16
end;

function FixedDiv(A, B: TFixed): TFixed;
asm
        MOV     ECX, B
        CDQ
        SHLD    EDX, EAX, 16
        SHL     EAX, 16
        IDIV    ECX
end;

function FixedSqr(Value: TFixed): TFixed;
asm
          IMUL    EAX
          SHRD    EAX, EDX, 16
end;

function FixedSqrtLP(Value: TFixed): TFixed;
asm
          push    ebx
          mov     ecx, eax
          xor     eax, eax
          mov     ebx, $40000000
@sqrtLP1: mov     edx, ecx
          sub     edx, ebx
          jl      @sqrtLP2
          sub     edx, eax
          jl      @sqrtLP2
          mov     ecx,edx
          shr     eax, 1
          or      eax, ebx
          shr     ebx, 2
          jnz     @sqrtLP1
          shl     eax, 8
          jmp     @sqrtLP3
@sqrtLP2: shr     eax, 1
          shr     ebx, 2
          jnz     @sqrtLP1
          shl     eax, 8
@sqrtLP3: pop     ebx
end;

function FixedSqrtHP(Value: TFixed): TFixed;
asm
          push ebx
          mov ecx, eax
          xor eax, eax
          mov ebx, $40000000
@sqrtHP1: mov edx, ecx
          sub edx, ebx
          jb  @sqrtHP2
          sub edx, eax
          jb  @sqrtHP2
          mov ecx,edx
          shr eax, 1
          or  eax, ebx
          shr ebx, 2
          jnz @sqrtHP1
          jz  @sqrtHP5
@sqrtHP2: shr eax, 1
          shr ebx, 2
          jnz @sqrtHP1
@sqrtHP5: mov ebx, $00004000
          shl eax, 16
          shl ecx, 16
@sqrtHP3: mov edx, ecx
          sub edx, ebx
          jb  @sqrtHP4
          sub edx, eax
          jb  @sqrtHP4
          mov ecx, edx
          shr eax, 1
          or  eax, ebx
          shr ebx, 2
          jnz @sqrtHP3
          jmp @sqrtHP6
@sqrtHP4: shr eax, 1
          shr ebx, 2
          jnz @sqrtHP3
@sqrtHP6: pop ebx
end;

{ Trigonometry }

procedure SinCos(const Theta: Single; var Sin, Cos: Single);
asm
   FLD  Theta
   FSINCOS
   FSTP DWORD PTR [EDX]    // cosine
   FSTP DWORD PTR [EAX]    // sine
end;

procedure SinCos(const theta, radius: Single; var Sin, Cos: Single);
asm
   FLD  theta
   FSINCOS
   FMUL radius
   FSTP DWORD PTR [EDX]    // cosine
   FMUL radius
   FSTP DWORD PTR [EAX]    // sine
end;

function MulDiv(Multiplicand, Multiplier, Divisor: Integer): Integer;
asm
        PUSH    EBX             // Imperative save
        PUSH    ESI             // of EBX and ESI

        MOV     EBX,EAX         // Result will be negative or positive so set rounding direction
        XOR     EBX,EDX         //  Negative: substract 1 in case of rounding
        XOR     EBX,ECX         //  Positive: add 1

        OR      EAX,EAX         // Make all operands positive, ready for unsigned operations
        JNS     @m1Ok           // minimizing branching
        NEG     EAX
@m1Ok:
        OR      EDX,EDX
        JNS     @m2Ok
        NEG     EDX
@m2Ok:
        OR      ECX,ECX
        JNS     @DivOk
        NEG     ECX
@DivOK:
        MUL     EDX             // Unsigned multiply (Multiplicand*Multiplier)

        MOV     ESI,EDX         // Check for overflow, by comparing
        SHL     ESI,1           // 2 times the high-order 32 bits of the product (edx)
        CMP     ESI,ECX         // with the Divisor.
        JAE     @Overfl         // If equal or greater than overflow with division anticipated

        DIV     ECX             // Unsigned divide of product by Divisor

        SUB     ECX,EDX         // Check if the result must be adjusted by adding or substracting
        CMP     ECX,EDX         // 1 (*.5 -> nearest integer), by comparing the difference of
        JA      @NoAdd          // Divisor and remainder with the remainder. If it is greater then
        INC     EAX             // no rounding needed; add 1 to result otherwise
@NoAdd:
        OR      EBX,EDX         // From unsigned operations back the to original sign of the result
        JNS     @exit           // must be positive
        NEG     EAX             // must be negative
        JMP     @exit
@Overfl:
        OR      EAX,-1          //  3 bytes alternative for mov eax,-1. Windows.MulDiv "overflow"
                                //  and "zero-divide" return value
@exit:
        POP     ESI             // Restore
        POP     EBX             // esi and ebx
end;

{ TBooleanMap }

function Bytes(Bits: Integer): Integer;
begin
  Result := (Bits - 1) shr 3 + 1;
end;

procedure TBooleanMap.ChangeSize(var Width, Height: Integer; NewWidth,
  NewHeight: Integer);
begin
  SetLength(FBits, Bytes(NewWidth * NewHeight));
  Width := NewWidth;
  Height := NewHeight;
end;

procedure TBooleanMap.Clear(FillValue: Byte);
begin
  FillChar(FBits[0], Bytes(Width * Height), FillValue);
end;

destructor TBooleanMap.Destroy;
begin
  FBits := nil;
  inherited;
end;

function TBooleanMap.Empty: Boolean;
begin
  Result := not Assigned(FBits);
end;

function TBooleanMap.GetBits: PByteArray;
begin
  Result := @FBits[0];
end;

function TBooleanMap.GetValue(X, Y: Integer): Boolean;
begin
  X := X + Y * Width;
  Result := FBits[X shr 3] and (1 shl (X and 7)) <> 0;
  //Boolean(FBits[X shr 3] and (1 shl (X and 7)));
end;

procedure TBooleanMap.SetValue(X, Y: Integer; const Value: Boolean);
begin
  X := Y * Width + X;
  if Value then
    FBits[X shr 3] := FBits[X shr 3] or (1 shl (X and 7))
  else
    FBits[X shr 3] := FBits[X shr 3] and ((1 shl (X and 7)) xor $FF);
end;

procedure TBooleanMap.ToggleBit(X, Y: Integer);
begin
  X := Y * Width + X;
  FBits[X shr 3] := FBits[X shr 3] xor (1 shl (X and 7));
end;

{ TByteMap }

procedure TByteMap.Assign(Source: TPersistent);
begin
  BeginUpdate;
  try
    if Source is TByteMap then
    begin
      inherited SetSize(TByteMap(Source).Width, TByteMap(Source).Height);
      Move(TByteMap(Source).Bits[0], Bits[0], Width * Height);
    end
    else
      if Source is TCnsBitmap32 then
      ReadFrom(TCnsBitmap32(Source), ctWeightedRGB)
    else
      inherited;
  finally
    EndUpdate;
    Changed;
  end;
end;

procedure TByteMap.AssignTo(Dst: TPersistent);
begin
  if Dst is TCnsBitmap32 then
    WriteTo(TCnsBitmap32(Dst), ctUniformRGB)
  else
    inherited;
end;

procedure TByteMap.ChangeSize(var Width, Height: Integer; NewWidth, NewHeight: Integer);
begin
  SetLength(FBits, NewWidth * NewHeight);
  Width := NewWidth;
  Height := NewHeight;
end;

procedure TByteMap.Clear(FillValue: Byte);
begin
  FillChar(Bits[0], Width * Height, FillValue);
  Changed;
end;

destructor TByteMap.Destroy;
begin
  FBits := nil;
  inherited;
end;

function TByteMap.Empty: Boolean;
begin
  Result := false;
  if (Width = 0) or (Height = 0) or (FBits = nil) then
    Result := True;
end;

function TByteMap.GetBits: PByteArray;
begin
  Result := @FBits[0];
end;

function TByteMap.GetValPtr(X, Y: Integer): PByte;
begin
  Result := @FBits[X + Y * Width];
end;

function TByteMap.GetValue(X, Y: Integer): Byte;
begin
  Result := FBits[X + Y * Width];
end;

procedure TByteMap.ReadFrom(Source: TCnsBitmap32; Conversion: TConversionType);
var
  W, H, I, N: Integer;
  SrcC: PColor32;
  SrcB, DstB: PByte;
  Value: TColor32;
begin
  BeginUpdate;
  try
    SetSize(Source.Width, Source.Height);
    if Empty then
      Exit;

    W := Source.Width;
    H := Source.Height;
    N := W * H - 1;
    SrcC := Source.PixelPtr[0, 0];
    SrcB := Pointer(SrcC);
    DstB := @FBits[0];
    case Conversion of

      ctRed:
        begin
          Inc(SrcB, 2);
          for I := 0 to N do
          begin
            DstB^ := SrcB^;
            Inc(DstB);
            Inc(SrcB, 4);
          end;
        end;

      ctGreen:
        begin
          Inc(SrcB, 1);
          for I := 0 to N do
          begin
            DstB^ := SrcB^;
            Inc(DstB);
            Inc(SrcB, 4);
          end;
        end;

      ctBlue:
        begin
          for I := 0 to N do
          begin
            DstB^ := SrcB^;
            Inc(DstB);
            Inc(SrcB, 4);
          end;
        end;

      ctAlpha:
        begin
          Inc(SrcB, 3);
          for I := 0 to N do
          begin
            DstB^ := SrcB^;
            Inc(DstB);
            Inc(SrcB, 4);
          end;
        end;

      ctUniformRGB:
        begin
          for I := 0 to N do
          begin
            Value := SrcC^;
            Value := (Value and $00FF0000) shr 16 + (Value and $0000FF00) shr 8 +
              (Value and $000000FF);
            Value := Value div 3;
            DstB^ := Value;
            Inc(DstB);
            Inc(SrcC);
          end;
        end;

      ctWeightedRGB:
        begin
          for I := 0 to N do
          begin
            DstB^ := Intensity(SrcC^);
            Inc(DstB);
            Inc(SrcC);
          end;
        end;
    end;
  finally
    EndUpdate;
    Changed;
  end;
end;

procedure TByteMap.SetValue(X, Y: Integer; Value: Byte);
begin
  FBits[X + Y * Width] := Value;
end;

procedure TByteMap.WriteTo(Dest: TCnsBitmap32; Conversion: TConversionType);
var
  W, H, I, N: Integer;
  DstC: PColor32;
  DstB, SrcB: PByte;
  Resized: Boolean;
begin
  Dest.BeginUpdate;
  Resized := False;
  try
    Resized := Dest.SetSize(Width, Height);
    if Empty then
      Exit;

    W := Width;
    H := Height;
    N := W * H - 1;
    DstC := Dest.PixelPtr[0, 0];
    DstB := Pointer(DstC);
    SrcB := @FBits[0];
    case Conversion of

      ctRed:
        begin
          Inc(DstB, 2);
          for I := 0 to N do
          begin
            DstB^ := SrcB^;
            Inc(DstB, 4);
            Inc(SrcB);
          end;
        end;

      ctGreen:
        begin
          Inc(DstB, 1);
          for I := 0 to N do
          begin
            DstB^ := SrcB^;
            Inc(DstB, 4);
            Inc(SrcB);
          end;
        end;

      ctBlue:
        begin
          for I := 0 to N do
          begin
            DstB^ := SrcB^;
            Inc(DstB, 4);
            Inc(SrcB);
          end;
        end;

      ctAlpha:
        begin
          Inc(DstB, 3);
          for I := 0 to N do
          begin
            DstB^ := SrcB^;
            Inc(DstB, 4);
            Inc(SrcB);
          end;
        end;

      ctUniformRGB, ctWeightedRGB:
        begin
          for I := 0 to N do
          begin
            DstC^ := Gray32(SrcB^);
            Inc(DstC);
            Inc(SrcB);
          end;
        end;
    end;
  finally
    Dest.EndUpdate;
    Dest.Changed;
    if Resized then
      Dest.Resized;
  end;
end;

procedure TByteMap.WriteTo(Dest: TCnsBitmap32; const Palette: TPalette32);
var
  W, H, I, N: Integer;
  DstC: PColor32;
  SrcB: PByte;
begin
  Dest.BeginUpdate;
  try
    Dest.SetSize(Width, Height);
    if Empty then
      Exit;

    W := Width;
    H := Height;
    N := W * H - 1;
    DstC := Dest.PixelPtr[0, 0];
    SrcB := @FBits[0];

    for I := 0 to N do
    begin
      DstC^ := Palette[SrcB^];
      Inc(DstC);
      Inc(SrcB);
    end;
  finally
    Dest.EndUpdate;
    Dest.Changed;
  end;
end;

{ TWordMap }

procedure TWordMap.ChangeSize(var Width, Height: Integer; NewWidth,
  NewHeight: Integer);
begin
  SetLength(FBits, NewWidth * NewHeight);
  Width := NewWidth;
  Height := NewHeight;
end;

procedure TWordMap.Clear(FillValue: Word);
begin
  FillWord(FBits[0], Width * Height, FillValue);
  Changed;
end;

destructor TWordMap.Destroy;
begin
  FBits := nil;
  inherited;
end;

function TWordMap.Empty: Boolean;
begin
  Result := not Assigned(FBits);
end;

function TWordMap.GetBits: PWordArray;
begin
  Result := @FBits[0];
end;

function TWordMap.GetValPtr(X, Y: Integer): PWord;
begin
  Result := @FBits[X + Y * Width];
end;

function TWordMap.GetValue(X, Y: Integer): Word;
begin
  Result := FBits[X + Y * Width];
end;

procedure TWordMap.SetValue(X, Y: Integer; const Value: Word);
begin
  FBits[X + Y * Width] := Value;
end;

{ TIntegerMap }

procedure TIntegerMap.ChangeSize(var Width, Height: Integer; NewWidth,
  NewHeight: Integer);
begin
  SetLength(FBits, NewWidth * NewHeight);
  Width := NewWidth;
  Height := NewHeight;
end;

procedure TIntegerMap.Clear(FillValue: Integer);
begin
  FillLongword(FBits[0], Width * Height, FillValue);
  Changed;
end;

destructor TIntegerMap.Destroy;
begin
  FBits := nil;
  inherited;
end;

function TIntegerMap.Empty: Boolean;
begin
  Result := not Assigned(FBits);
end;

function TIntegerMap.GetBits: PIntegerArray;
begin
  Result := @FBits[0];
end;

function TIntegerMap.GetValPtr(X, Y: Integer): PInteger;
begin
  Result := @FBits[X + Y * Width];
end;

function TIntegerMap.GetValue(X, Y: Integer): Integer;
begin
  Result := FBits[X + Y * Width];
end;

procedure TIntegerMap.SetValue(X, Y: Integer; const Value: Integer);
begin
  FBits[X + Y * Width] := Value;
end;

type
  TTransformationAccess = class(TTransformation);

  { TVectorMap }

function CombineVectorsReg(const A, B: TFixedVector; Weight: TFixed): TFixedVector;
begin
  Result.X := A.X + FixedMul(B.X - A.X, Weight);
  Result.Y := A.Y + FixedMul(B.Y - A.Y, Weight);
end;

procedure CombineVectorsMem(const A: TFixedVector; var B: TFixedVector; Weight: TFixed);
begin
  B.X := A.X + FixedMul(B.X - A.X, Weight);
  B.Y := A.Y + FixedMul(B.Y - A.Y, Weight);
end;

function TVectorMap.BoundsRect: TRect;
begin
  Result := Rect(0, 0, Width, Height);
end;

procedure TVectorMap.ChangeSize(var Width, Height: Integer;
  NewWidth, NewHeight: Integer);
begin
  inherited;
  FVectors := nil;
  Width := 0;
  Height := 0;
  SetLength(FVectors, NewWidth * NewHeight);
  if (NewWidth > 0) and (NewHeight > 0) then
  begin
    if FVectors = nil then
      raise Exception.Create('Can''t allocate VectorMap!');
    FillLongword(FVectors[0], NewWidth * NewHeight * 2, 0);
  end;
  Width := NewWidth;
  Height := NewHeight;
end;

procedure TVectorMap.Clear;
begin
  FillLongword(FVectors[0], Width * Height * 2, 0);
end;

destructor TVectorMap.Destroy;
begin
  Lock;
  try
    SetSize(0, 0);
  finally
    Unlock;
  end;
  inherited;
end;

function TVectorMap.GetVectors: PFixedPointArray;
begin
  Result := @FVectors[0];
end;

function TVectorMap.GetFloatVector(X, Y: Integer): TFloatVector;
begin
  Result := FloatPoint(FVectors[X + Y * Width]);
end;

function TVectorMap.GetFloatVectorF(X, Y: Single): TFloatVector;
begin
  Result := FloatPoint(GetFixedVectorX(Fixed(X), Fixed(Y)));
end;

function TVectorMap.GetFloatVectorFS(X, Y: Single): TFloatVector;
begin
  Result := FloatPoint(GetFixedVectorXS(Fixed(X), Fixed(Y)));
end;

function TVectorMap.GetFloatVectorS(X, Y: Integer): TFloatVector;
begin
  if (X >= 0) and (Y >= 0) and
    (X < Width) and (Y < Height) then
    Result := GetFloatVector(X, Y)
  else
  begin
    Result.X := 0;
    Result.Y := 0;
  end;
end;

function TVectorMap.GetFixedVector(X, Y: Integer): TFixedVector;
begin
  Result := FVectors[X + Y * Width];
end;

function TVectorMap.GetFixedVectorS(X, Y: Integer): TFixedVector;
begin
  if (X >= 0) and (Y >= 0) and
    (X < Width) and (Y < Height) then
    Result := GetFixedVector(X, Y)
  else
  begin
    Result.X := 0;
    Result.Y := 0;
  end;
end;

function TVectorMap.GetFixedVectorX(X, Y: TFixed): TFixedVector;
const
  Next = SizeOf(TFixedVector);
var
  WX, WY: TFixed;
  P, W, H: Integer;
begin
  WX := TFixedRec(X).Int;
  WY := TFixedRec(Y).Int;
  W := Width;
  H := Height;
  if (WX >= 0) and (WX <= W - 1) and (WY >= 0) and (WY <= H - 1) then
  begin
    P := Integer(@FVectors[WX + WY * W]);
    if (WY = H - 1) then
      W := 0
    else
      W := W * Next;
    if (WX = W - 1) then
      H := 0
    else
      H := Next;
    WX := TFixedRec(X).Frac;
    WY := TFixedRec(Y).Frac;
    Result := CombineVectorsReg(CombineVectorsReg(PFixedPoint(P)^, PFixedPoint(P + H)^, WX),
      CombineVectorsReg(PFixedPoint(P + W)^, PFixedPoint(P + W + H)^, WX), WY);
  end
  else
  begin
    Result.X := 0;
    Result.Y := 0;
  end;
end;

function TVectorMap.GetFixedVectorXS(X, Y: TFixed): TFixedVector;
var
  WX, WY: TFixed;
begin
  WX := TFixedRec(X).Frac;
  X := TFixedRec(X).Int;

  WY := TFixedRec(Y).Frac;
  Y := TFixedRec(Y).Int;

  Result := CombineVectorsReg(CombineVectorsReg(FixedVectorS[X, Y], FixedVectorS[X + 1, Y], WX),
    CombineVectorsReg(FixedVectorS[X, Y + 1], FixedVectorS[X + 1, Y + 1], WX), WY);
end;

function TVectorMap.Empty: Boolean;
begin
  Result := false;
  if (Width = 0) or (Height = 0) or (FVectors = nil) then
    Result := True;
end;

const
  MeshIdent = 'yfqLhseM';

type
  {TVectorMap supports the photoshop liquify mesh fileformat .msh}
  TPSLiquifyMeshHeader = record
    Pad0: dword;
    Ident: array[0..7] of Char;
    Pad1: dword;
    Width: dword;
    Height: dword;
  end;

procedure TVectorMap.LoadFromFile(const FileName: string);

  procedure ConvertVertices;
  var
    I: Integer;
  begin
    for I := 0 to Length(FVectors) - 1 do
      FVectors[I] := FixedPoint(TFloatVector(FVectors[I])); //Not a mistake!
  end;

var
  Header: TPSLiquifyMeshHeader;
  MeshFile: file;
begin
  if FileExists(Filename) then
  try
    AssignFile(MeshFile, FileName);
    Reset(MeshFile, 1);
    BlockRead(MeshFile, Header, SizeOf(TPSLiquifyMeshHeader));
    if Lowercase(string(Header.Ident)) <> Lowercase(MeshIdent) then
      Exception.Create('Bad format - Photoshop .msh expected!');
    with Header do
    begin
      SetSize(Width, Height);
      BlockRead(MeshFile, FVectors[0], Width * Height * SizeOf(TFixedVector));
      ConvertVertices;
    end;
  finally
    CloseFile(MeshFile);
  end
  else
    Exception.Create('File not found!');
end;

procedure TVectorMap.Merge(DstLeft, DstTop: Integer; Src: TVectorMap; SrcRect: TRect);
var
  I, J, P: Integer;
  DstRect: TRect;
  Progression: TFixedVector;
  ProgressionX, ProgressionY: TFixed;
  CombineCallback: TVectorCombineEvent;
  DstPtr: PFixedPointArray;
  SrcPtr: PFixedPoint;
begin
  if Src.Empty then
    Exception.Create('Src is empty!');
  if Empty then
    Exception.Create('Base is empty!');
  IntersectRect(SrcRect, Src.BoundsRect, SrcRect);

  DstRect.Left := DstLeft;
  DstRect.Top := DstTop;
  DstRect.Right := DstLeft + (SrcRect.Right - SrcRect.Left);
  DstRect.Bottom := DstTop + (SrcRect.Bottom - SrcRect.Top);

  IntersectRect(DstRect, BoundsRect, DstRect);
  if IsRectEmpty(DstRect) then
    Exit;

  P := SrcRect.Top * Src.Width;
  Progression.Y := -FixedOne;
  case Src.FVectorCombineMode of
    vcmAdd:
      begin
        for I := DstRect.Top to DstRect.Bottom do
        begin
          DstPtr := @GetVectors[I * Width];
          SrcPtr := @Src.GetVectors[SrcRect.Left + P];
          for J := DstRect.Left to DstRect.Right do
          begin
            Inc(SrcPtr^.X, DstPtr[J].X);
            Inc(SrcPtr^.Y, DstPtr[J].Y);
            Inc(SrcPtr);
          end;
          Inc(P, Src.Width);
        end;
      end;
    vcmReplace:
      begin
        for I := DstRect.Top to DstRect.Bottom do
        begin
          DstPtr := @GetVectors[I * Width];
          SrcPtr := @Src.GetVectors[SrcRect.Left + P];
          for J := DstRect.Left to DstRect.Right do
          begin
            SrcPtr^.X := DstPtr[J].X;
            SrcPtr^.Y := DstPtr[J].Y;
            Inc(SrcPtr);
          end;
          Inc(P, Src.Width);
        end;
      end;
  else
    CombineCallback := Src.FOnVectorCombine;
    ProgressionX := Fixed(2 / (DstRect.Right - DstRect.Left - 1));
    ProgressionY := Fixed(2 / (DstRect.Bottom - DstRect.Top - 1));
    for I := DstRect.Top to DstRect.Bottom do
    begin
      Progression.X := -FixedOne;
      DstPtr := @GetVectors[I * Width];
      SrcPtr := @Src.GetVectors[SrcRect.Left + P];
      for J := DstRect.Left to DstRect.Right do
      begin
        CombineCallback(SrcPtr^, Progression, DstPtr[J]);
        Inc(SrcPtr);
        Inc(Progression.X, ProgressionX);
      end;
      Inc(P, Src.Width);
      Inc(Progression.Y, ProgressionY);
    end;
  end;
end;

procedure TVectorMap.SaveToFile(const FileName: string);

  procedure ConvertVerticesX;
  var
    I: Integer;
  begin
    for I := 0 to Length(FVectors) - 1 do
      FVectors[I] := FixedPoint(TFloatVector(FVectors[I])); //Not a mistake!
  end;

  procedure ConvertVerticesF;
  var
    I: Integer;
  begin
    for I := 0 to Length(FVectors) - 1 do
      TFloatVector(FVectors[I]) := FloatPoint(FVectors[I]); //Not a mistake!
  end;

var
  Header: TPSLiquifyMeshHeader;
  MeshFile: file;
  Pad: Cardinal;
begin
  try
    AssignFile(MeshFile, FileName);
    Rewrite(MeshFile, 1);
    with Header do
    begin
      Pad0 := $02000000;
      Ident := MeshIdent;
      Pad1 := $00000002;
      Width := Self.Width;
      Height := Self.Height;
    end;
    BlockWrite(MeshFile, Header, SizeOf(TPSLiquifyMeshHeader));
    with Header do
    begin
      ConvertVerticesF;
      BlockWrite(MeshFile, FVectors[0], Length(FVectors) * SizeOf(TFixedVector));
      ConvertVerticesX;
    end;
    if Odd(Length(FVectors) * SizeOf(TFixedVector) - 1) then
    begin
      Pad := $00000000;
      BlockWrite(MeshFile, Pad, 4);
      BlockWrite(MeshFile, Pad, 4);
    end;
  finally
    CloseFile(MeshFile);
  end;
end;

procedure TVectorMap.SetFloatVector(X, Y: Integer; const Point: TFloatVector);
begin
  FVectors[X + Y * Width] := FixedPoint(Point);
end;

procedure TVectorMap.SetFloatVectorF(X, Y: Single; const Point: TFloatVector);
begin
  SetFixedVectorX(Fixed(X), Fixed(Y), FixedPoint(Point));
end;

procedure TVectorMap.SetFloatVectorFS(X, Y: Single; const Point: TFloatVector);
begin
  SetFixedVectorXS(Fixed(X), Fixed(Y), FixedPoint(Point));
end;

procedure TVectorMap.SetFloatVectorS(X, Y: Integer; const Point: TFloatVector);
begin
  if (X >= 0) and (X < Width) and
    (Y >= 0) and (Y < Height) then
    FVectors[X + Y * Width] := FixedPoint(Point);
end;

procedure TVectorMap.SetFixedVector(X, Y: Integer; const Point: TFixedVector);
begin
  FVectors[X + Y * Width] := Point;
end;

procedure TVectorMap.SetFixedVectorS(X, Y: Integer; const Point: TFixedVector);
begin
  if (X >= 0) and (X < Width) and
    (Y >= 0) and (Y < Height) then
    FVectors[X + Y * Width] := Point;
end;

procedure TVectorMap.SetFixedVectorX(X, Y: TFixed; const Point: TFixedVector);
var
  flrx, flry, celx, cely: Integer;
  P: PFixedPoint;
begin
  flrx := TFixedRec(X).Frac;
  celx := flrx xor $FFFF;
  flry := TFixedRec(Y).Frac;
  cely := flry xor $FFFF;

  P := @FVectors[TFixedRec(X).Int + TFixedRec(Y).Int * Width];

  CombineVectorsMem(Point, P^, FixedMul(celx, cely));
  Inc(P);
  CombineVectorsMem(Point, P^, FixedMul(flrx, cely));
  Inc(P, Width);
  CombineVectorsMem(Point, P^, FixedMul(flrx, flry));
  Dec(P);
  CombineVectorsMem(Point, P^, FixedMul(celx, flry));
end;

procedure TVectorMap.SetFixedVectorXS(X, Y: TFixed; const Point: TFixedVector);
var
  flrx, flry, celx, cely: Integer;
  P: PFixedPoint;
begin
  if (X < -$10000) or (Y < -$10000) then
    Exit;

  flrx := TFixedRec(X).Frac;
  X := TFixedRec(X).Int;
  flry := TFixedRec(Y).Frac;
  Y := TFixedRec(Y).Int;

  if (X >= Width) or (Y >= Height) then
    Exit;

  celx := flrx xor $FFFF;
  cely := flry xor $FFFF;
  P := @FVectors[X + Y * Width];

  if (X >= 0) and (Y >= 0) then
  begin
    CombineVectorsMem(Point, P^, FixedMul(celx, cely));
    Inc(P);
    CombineVectorsMem(Point, P^, FixedMul(flrx, cely));
    Inc(P, Width);
    CombineVectorsMem(Point, P^, FixedMul(flrx, flry));
    Dec(P);
    CombineVectorsMem(Point, P^, FixedMul(celx, flry));
  end
  else
  begin
    if (X >= 0) and (Y >= 0) then
      CombineVectorsMem(Point, P^, FixedMul(celx, cely));
    Inc(P);
    if (X < Width - 1) and (Y >= 0) then
      CombineVectorsMem(Point, P^, FixedMul(flrx, cely));
    Inc(P, Width);
    if (X < Width - 1) and (Y < Height - 1) then
      CombineVectorsMem(Point, P^, FixedMul(flrx, flry));
    Dec(P);
    if (X >= 0) and (Y < Height - 1) then
      CombineVectorsMem(Point, P^, FixedMul(celx, flry));
  end;
end;

procedure TVectorMap.SetVectorCombineMode(const Value: TVectorCombineMode);
begin
  if FVectorCombineMode <> Value then
  begin
    FVectorCombineMode := Value;
    Changed;
  end;
end;

function TVectorMap.GetTrimmedBounds: TRect;
var
  J: Integer;
  VectorPtr: PFixedVector;
label
  TopDone, BottomDone, LeftDone, RightDone;

begin
  with Result do
  begin
    //Find Top
    Top := 0;
    VectorPtr := @Vectors[Top];
    repeat
      if Int64(VectorPtr^) <> 0 then
        goto TopDone;
      Inc(VectorPtr);
      Inc(Top);
    until Top = Width * Height;

    TopDone: Top := Top div Width;

    //Find Bottom
    Bottom := Width * Height - 1;
    VectorPtr := @Vectors[Bottom];
    repeat
      if Int64(VectorPtr^) <> 0 then
        goto BottomDone;
      Dec(VectorPtr);
      Dec(Bottom);
    until Bottom < 0;

    BottomDone: Bottom := Bottom div Width - 1;

    //Find Left
    Left := 0;
    repeat
      J := Top;
      repeat
        if Int64(FixedVector[Left, J]) <> 0 then
          goto LeftDone;
        Inc(J);
      until J >= Bottom;
      Inc(Left)
    until Left >= Width;

    LeftDone:

    //Find Right
    Right := Width - 1;
    repeat
      J := Bottom;
      repeat
        if Int64(FixedVector[Right, J]) <> 0 then
          goto RightDone;
        Dec(J);
      until J <= Top;
      Dec(Right)
    until Right <= Left;

  end;
  RightDone:
  if IsRectEmpty(Result) then
    Result := Rect(0, 0, 0, 0);
end;

procedure SmartAssign(Src, Dst: TPersistent; TypeKinds: TTypeKinds = tkProperties);
var
  Count, I: Integer;
  Props: PPropList;
  SubSrc, SubDst: TPersistent;
begin
  Count := GetTypeData(Src.ClassInfo).PropCount;
  if Count = 0 then
    Exit;

  GetMem(Props, Count * SizeOf(PPropInfo));
  try
    // Get the property list in an unsorted fashion.
    // This is important so the order in which the properties are defined is obeyed,
    // ie. mimic how the Delphi form loader would set the properties.
    Count := GetPropList(Src.ClassInfo, TypeKinds, Props{$IFDEF COMPILER6}, False{$ENDIF});

    for I := 0 to Count - 1 do
      with Props^[I]^ do
      begin
        if PropType^.Kind = tkClass then
        begin
          SubDst := TPersistent(GetObjectProp(Dst, Name));
          if not Assigned(SubDst) then
            Continue;

          SubSrc := TPersistent(GetObjectProp(Src, Name));
          if Assigned(SubSrc) then
            SubDst.Assign(SubSrc);
        end
        else
          SetPropValue(Dst, Name, GetPropValue(Src, Name, False));
      end;
  finally
    FreeMem(Props, Count * SizeOf(PPropInfo));
  end;
end;

{ TPointerMap }

function TPointerMap.Add(NewItem: PItem; NewData: PData): PPData;
var
  Dummy: Boolean;
begin
  Result := Add(NewItem, NewData, Dummy);
end;

function TPointerMap.Add(NewItem: PItem): PPData;
var
  Dummy: Boolean;
begin
  Result := Add(NewItem, nil, Dummy);
end;

function TPointerMap.Add(NewItem: PItem; out IsNew: Boolean): PPData;
begin
  Result := Add(NewItem, nil, IsNew);
end;

function TPointerMap.Add(NewItem: PItem; NewData: PData; out IsNew: Boolean): PPData;
var
  BucketIndex, ItemIndex, Capacity: Integer;
begin
  if Exists(NewItem, BucketIndex, ItemIndex) then
  begin
    IsNew := False;
    Result := @FBuckets[BucketIndex].Items[ItemIndex].Data
  end
  else
  begin
    with FBuckets[BucketIndex] do
    begin
      Capacity := Length(Items);

      // enlarge capacity if completely used
      if Count = Capacity then
      begin
        if Capacity > 64 then
          Inc(Capacity, Capacity div 4)
        else
          if Capacity > 8 then
          Inc(Capacity, 16)
        else
          Inc(Capacity, 4);

        SetLength(Items, Capacity);
      end;

      with Items[Count] do
      begin
        Item := NewItem;
        Data := NewData;
        Result := @Data;
      end;

      Inc(Count);
      IsNew := True;
    end;
    Inc(FCount);
  end;
end;

procedure TPointerMap.Clear;
var
  BucketIndex, ItemIndex: Integer;
begin
  FCount := 0;

  for BucketIndex := 0 to BUCKET_MASK do
    with FBuckets[BucketIndex] do
    begin
      for ItemIndex := Count - 1 downto 0 do
        Delete(BucketIndex, ItemIndex);

      Count := 0;
      SetLength(Items, 0);
    end;
end;

destructor TPointerMap.Destroy;
begin
  Clear;
  inherited Destroy;
end;

function TPointerMap.Delete(BucketIndex, ItemIndex: Integer): PData;
begin
  with FBuckets[BucketIndex] do
  begin
    Result := Items[ItemIndex].Data;

    if FCount = 0 then
      Exit;

    if Count = 1 then
      SetLength(Items, 0)
    else
      Move(Items[ItemIndex + 1], Items[ItemIndex], (Count - ItemIndex) *
        SizeOf(TPointerBucketItem));

    Dec(Count);
  end;
  Dec(FCount);
end;

function TPointerMap.Remove(Item: PItem): PData;
var
  BucketIndex, ItemIndex: Integer;
begin
  if Exists(Item, BucketIndex, ItemIndex) then
    Result := Delete(BucketIndex, ItemIndex)
  else
    Result := nil;
end;

function TPointerMap.Contains(Item: PItem): Boolean;
var
  Dummy: Integer;
begin
  Result := Exists(Item, Dummy, Dummy);
end;

function TPointerMap.Find(Item: PItem; out Data: PPData): Boolean;
var
  BucketIndex, ItemIndex: Integer;
begin
  Result := Exists(Item, BucketIndex, ItemIndex);
  if Result then
    Data := @FBuckets[BucketIndex].Items[ItemIndex].Data;
end;

function TPointerMap.Exists(Item: PItem; out BucketIndex, ItemIndex: Integer): Boolean;
var
  I: Integer;
begin
  BucketIndex := Integer(Item) shr 8 and BUCKET_MASK; // KISS pointer hash(TM)
  // due to their randomness, pointers most commonly differ at byte 1, we use
  // this characteristic for our hash and just apply the mask to it.
  // Worst case scenario happens when most changes are at byte 0, which causes
  // one bucket to be saturated whereas the other buckets are almost empty...

  Result := False;
  with FBuckets[BucketIndex] do
    for I := 0 to Count - 1 do
      if Items[I].Item = Item then
      begin
        ItemIndex := I;
        Result := True;
        Exit;
      end;
end;

function TPointerMap.GetData(Item: PItem): PData;
var
  BucketIndex, ItemIndex: Integer;
begin
  if not Exists(Item, BucketIndex, ItemIndex) then
    raise EListError.CreateFmt(SItemNotFound, [Integer(Item)])
  else
    Result := FBuckets[BucketIndex].Items[ItemIndex].Data;
end;

procedure TPointerMap.SetData(Item: PItem; const Data: PData);
var
  BucketIndex, ItemIndex: Integer;
begin
  if not Exists(Item, BucketIndex, ItemIndex) then
    raise EListError.CreateFmt(SItemNotFound, [Integer(Item)])
  else
    FBuckets[BucketIndex].Items[ItemIndex].Data := Data;
end;

{ TPointerMapIterator }

constructor TPointerMapIterator.Create(SrcPointerMap: TPointerMap);
begin
  inherited Create;
  FSrcPointerMap := SrcPointerMap;

  FCurBucketIndex := -1;
  FCurItemIndex := -1;
end;

function TPointerMapIterator.Next: Boolean;
begin
  if FCurItemIndex > 0 then
    Dec(FCurItemIndex)
  else
  begin
    FCurItemIndex := -1;
    while (FCurBucketIndex < BUCKET_MASK) and (FCurItemIndex = -1) do
    begin
      Inc(FCurBucketIndex);
      FCurItemIndex := FSrcPointerMap.FBuckets[FCurBucketIndex].Count - 1;
    end;

    if FCurBucketIndex = BUCKET_MASK then
    begin
      Result := False;
      Exit;
    end
  end;

  Result := True;
  with FSrcPointerMap.FBuckets[FCurBucketIndex].Items[FCurItemIndex] do
  begin
    FItem := Item;
    FData := Data;
  end;
end;

{ TRectList }

destructor TRectList.Destroy;
begin
  SetCount(0);
  SetCapacity(0);
end;

function TRectList.Add(const Rect: TRect): Integer;
begin
  Result := FCount;
  if Result = FCapacity then
    Grow;
  FList^[Result] := Rect;
  Inc(FCount);
end;

procedure TRectList.Clear;
begin
  SetCount(0);
  SetCapacity(10);
end;

procedure TRectList.Delete(Index: Integer);
begin
  Dec(FCount);
  if Index < FCount then
    System.Move(FList^[Index + 1], FList^[Index],
      (FCount - Index) * SizeOf(TRect));
end;

procedure TRectList.Exchange(Index1, Index2: Integer);
var
  Item: TRect;
begin
  Item := FList^[Index1];
  FList^[Index1] := FList^[Index2];
  FList^[Index2] := Item;
end;

function TRectList.Get(Index: Integer): PRect;
begin
  if (Index < 0) or (Index >= FCount) then
    Result := nil
  else
    Result := @FList^[Index];
end;

procedure TRectList.Grow;
var
  Delta: Integer;
begin
  if FCapacity > 128 then
    Delta := FCapacity div 4
  else
    if FCapacity > 8 then
    Delta := 32
  else
    Delta := 8;
  SetCapacity(FCapacity + Delta);
end;

function TRectList.IndexOf(const Rect: TRect): Integer;
begin
  Result := 0;
  while (Result < FCount) and not EqualRect(FList^[Result], Rect) do
    Inc(Result);
  if Result = FCount then
    Result := -1;
end;

procedure TRectList.Insert(Index: Integer; const Rect: TRect);
begin
  if FCount = FCapacity then
    Grow;
  if Index < FCount then
    System.Move(FList^[Index], FList^[Index + 1],
      (FCount - Index) * SizeOf(TRect));
  FList^[Index] := Rect;
  Inc(FCount);
end;

procedure TRectList.Move(CurIndex, NewIndex: Integer);
var
  Item: TRect;
begin
  if CurIndex <> NewIndex then
  begin
    Item := Get(CurIndex)^;
    Delete(CurIndex);
    Insert(NewIndex, Item);
  end;
end;

function TRectList.Remove(const Rect: TRect): Integer;
begin
  Result := IndexOf(Rect);
  if Result >= 0 then
    Delete(Result);
end;

procedure TRectList.Pack;
var
  I: Integer;
begin
  for I := FCount - 1 downto 0 do
    if Items[I] = nil then
      Delete(I);
end;

procedure TRectList.SetCapacity(NewCapacity: Integer);
begin
  if NewCapacity <> FCapacity then
  begin
    ReallocMem(FList, NewCapacity * SizeOf(TRect));
    FCapacity := NewCapacity;
  end;
end;

procedure TRectList.SetCount(NewCount: Integer);
var
  I: Integer;
begin
  if NewCount > FCapacity then
    SetCapacity(NewCount);
  if NewCount > FCount then
    FillChar(FList^[FCount], (NewCount - FCount) * SizeOf(TRect), 0)
  else
    for I := FCount - 1 downto NewCount do
      Delete(I);
  FCount := NewCount;
end;

{ TClassList }

function TClassList.Add(AClass: TClass): Integer;
begin
  Result := inherited Add(AClass);
end;

function TClassList.Extract(Item: TClass): TClass;
begin
  Result := TClass(inherited Extract(Item));
end;

function TClassList.Find(AClassName: string): TClass;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if TClass(List[I]).ClassName = AClassName then
    begin
      Result := TClass(List[I]);
      Break;
    end;
end;

function TClassList.First: TClass;
begin
  Result := TClass(inherited First);
end;

procedure TClassList.GetClassNames(Strings: TStrings);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    Strings.Add(TClass(List[I]).ClassName);
end;

function TClassList.GetItems(Index: Integer): TClass;
begin
  Result := TClass(inherited Items[Index]);
end;

function TClassList.IndexOf(AClass: TClass): Integer;
begin
  Result := inherited IndexOf(AClass);
end;

procedure TClassList.Insert(Index: Integer; AClass: TClass);
begin
  inherited Insert(Index, AClass);
end;

function TClassList.Last: TClass;
begin
  Result := TClass(inherited Last);
end;

function TClassList.Remove(AClass: TClass): Integer;
begin
  Result := inherited Remove(AClass);
end;

procedure TClassList.SetItems(Index: Integer; AClass: TClass);
begin
  inherited Items[Index] := AClass;
end;

type
  TThreadPersistentAccess = class(TThreadPersistent);

function CombineInfo(Bitmap: TCnsBitmap32): TCombineInfo;
begin
  with Result do
  begin
    SrcAlpha := Bitmap.MasterAlpha;
    DrawMode := Bitmap.DrawMode;
    CombineMode := Bitmap.CombineMode;
    CombineCallBack := Bitmap.OnPixelCombine;
    if (DrawMode = dmCustom) and not Assigned(CombineCallBack) then
      DrawMode := dmOpaque;
    TransparentColor := Bitmap.OuterColor;
  end;
end;

{ TRasterizer }

procedure TRasterizer.AssignColorBlend(var Dst: TColor32; Src: TColor32);
begin
  FBlendMemEx(Src, Dst, FSrcAlpha);
  EMMS;
end;

procedure TRasterizer.AssignColorOpaque(var Dst: TColor32; Src: TColor32);
begin
  Dst := Src;
end;

procedure TRasterizer.AssignColorCustom(var Dst: TColor32; Src: TColor32);
begin
  FCombineCallBack(Src, Dst, FSrcAlpha);
end;

procedure TRasterizer.AssignColorTransparent(var Dst: TColor32;
  Src: TColor32);
begin
  if Src <> FTransparentColor then
    Dst := Src;
end;

procedure TRasterizer.AssignTo(Dst: TPersistent);
begin
  if Dst is TRasterizer then
    SmartAssign(Self, Dst)
  else
    inherited;
end;

procedure TRasterizer.Rasterize(Dst: TCnsBitmap32; const DstRect: TRect;
  Src: TCnsBitmap32);
begin
  Rasterize(Dst, DstRect, CombineInfo(Src));
end;

procedure TRasterizer.Rasterize(Dst: TCnsBitmap32; const DstRect: TRect);
const
  DEFAULT_COMBINE_INFO: TCombineInfo = (
    SrcAlpha: $FF;
    DrawMode: dmOpaque;
    CombineMode: cmBlend;
    CombineCallBack: nil;
    TransparentColor: clBlack32;
    );
begin
  Rasterize(Dst, DstRect, DEFAULT_COMBINE_INFO);
end;

procedure TRasterizer.Rasterize(Dst: TCnsBitmap32; const DstRect: TRect;
  const CombineInfo: TCombineInfo);
begin
  FTransparentColor := CombineInfo.TransparentColor;
  with CombineInfo do
    Rasterize(Dst, DstRect, SrcAlpha, DrawMode, CombineMode, CombineCallBack);
end;

procedure TRasterizer.Rasterize(Dst: TCnsBitmap32; const DstRect: TRect;
  SrcAlpha: TColor32; DrawMode: TDrawMode; CombineMode: TCombineMode;
  CombineCallBack: TPixelCombineEvent);
var
  UpdateCount: Integer;
  R: TRect;
begin
  FSrcAlpha := SrcAlpha;
  FBlendMemEx := BLEND_MEM_EX[CombineMode];
  FCombineCallBack := CombineCallBack;

  case DrawMode of
    dmOpaque: FAssignColor := AssignColorOpaque;
    dmBlend: FAssignColor := AssignColorBlend;
    dmTransparent: FAssignColor := AssignColorTransparent;
  else
    if Assigned(FCombineCallback) then
      FAssignColor := AssignColorCustom
    else
      FAssignColor := AssignColorBlend;
  end;

  UpdateCount := TThreadPersistentAccess(Dst).UpdateCount;
  if Assigned(FSampler) then
  begin
    FSampler.PrepareSampling;
    IntersectRect(R, DstRect, Dst.BoundsRect);
    if FSampler.HasBounds then
      IntersectRect(R, DstRect, FSampler.GetSampleBounds);
    try
      DoRasterize(Dst, R);
    finally
      while TThreadPersistentAccess(Dst).UpdateCount > UpdateCount do
        TThreadPersistentAccess(Dst).EndUpdate;
      FSampler.FinalizeSampling;
    end;
  end;
end;

procedure TRasterizer.SetSampler(const Value: TCustomSampler);
begin
  if FSampler <> Value then
  begin
    FSampler := Value;
    Changed;
  end;
end;

procedure TRasterizer.Rasterize(Dst: TCnsBitmap32);
begin
  Rasterize(Dst, Dst.BoundsRect);
end;

{ TRegularRasterizer }

constructor TRegularRasterizer.Create;
begin
  inherited;
  FUpdateRowCount := 0;
end;

procedure TRegularRasterizer.DoRasterize(Dst: TCnsBitmap32; DstRect: TRect);
var
  I, J, UpdateCount: Integer;
  P: PColor32;
  GetSample: TGetSampleInt;
begin
  GetSample := FSampler.GetSampleInt;
  UpdateCount := 0;
  for J := DstRect.Top to DstRect.Bottom - 1 do
  begin
    P := @Dst.Bits[DstRect.Left + J * Dst.Width];
    for I := DstRect.Left to DstRect.Right - 1 do
    begin
      AssignColor(P^, GetSample(I, J));
      Inc(P);
    end;
    Inc(UpdateCount);
    if UpdateCount = FUpdateRowCount then
    begin
      Dst.ChangedEx(Rect(DstRect.Left, J - UpdateCount, DstRect.Right, J));
      UpdateCount := 0;
    end;
  end;
  with DstRect do
    Dst.ChangedEx(Rect(Left, Bottom - UpdateCount - 1, Right, Bottom));
end;

{ TSwizzlingRasterizer }

constructor TSwizzlingRasterizer.Create;
begin
  inherited;
  FBlockSize := 3;
end;

procedure TSwizzlingRasterizer.DoRasterize(Dst: TCnsBitmap32; DstRect: TRect);
var
  I, L, T, W, H, Size, RowSize, D: Integer;
  P1, P2, PBlock: TPoint;
  GetSample: TGetSampleInt;
  ForwardBuffer: array of Integer;

  function ScanReverse(Value: Integer): Integer;
  asm
    BSR EAX,EAX
  end;

  function GetDstCoord(P: TPoint): TPoint;
  var
    XI, YI: Integer;
  begin
    Result := P;
    Inc(Result.X);
    Inc(Result.Y);

    XI := ForwardBuffer[Result.X];
    YI := ForwardBuffer[Result.Y];

    if XI <= YI then
      Dec(Result.Y, 1 shl XI)
    else
      Dec(Result.X, 1 shl (YI + 1));

    if Result.Y >= H then
    begin
      Result.Y := P.Y + 1 shl YI;
      Result.X := P.X;
      Result := GetDstCoord(Result);
    end;

    if Result.X >= W then
    begin
      Result.X := P.X + 1 shl XI;
      Result.Y := P.Y;
      Result := GetDstCoord(Result);
    end;
  end;

begin
  W := DstRect.Right - DstRect.Left;
  H := DstRect.Bottom - DstRect.Top;
  L := DstRect.Left;
  T := DstRect.Top;
  Size := 1 shl (ScanReverse(Max(W, H)) + 1) + 1;

  SetLength(ForwardBuffer, Size);

  I := 2;
  while I < Size do
  begin
    ForwardBuffer[I] := ForwardBuffer[I shr 1] + 1;
    Inc(I, 2);
  end;

  Size := W * H - 1;
  GetSample := FSampler.GetSampleInt;

  D := 1 shl FBlockSize;
  PBlock := Point(L + D, T + D);
  P1 := Point(-1, 0);

  RowSize := Dst.Width;
  for I := 0 to Size do
  begin
    P1 := GetDstCoord(P1);
    P2.X := L + P1.X;
    P2.Y := T + P1.Y;
    AssignColor(Dst.Bits[P2.X + P2.Y * RowSize], GetSample(P2.X, P2.Y));

    // Invalidate the current block
    if (P2.X >= PBlock.X) or (P2.Y >= PBlock.Y) then
    begin
      Dst.ChangedEx(Rect(PBlock.X - D, PBlock.Y - D, PBlock.X, PBlock.Y));
      PBlock.X := P2.X + D;
      PBlock.Y := P2.Y + D;
    end;
  end;
  Dst.ChangedEx(Rect(PBlock.X - D, PBlock.Y - D, PBlock.X, PBlock.Y));
end;

procedure TSwizzlingRasterizer.SetBlockSize(const Value: Integer);
begin
  if FBlockSize <> Value then
  begin
    FBlockSize := Value;
    Changed;
  end;
end;

{ TProgressiveRasterizer }

constructor TProgressiveRasterizer.Create;
begin
  inherited;
  FSteps := 4;
  FUpdateRows := True;
end;

procedure TProgressiveRasterizer.DoRasterize(Dst: TCnsBitmap32;
  DstRect: TRect);
var
  I, J, Shift, W, H, B, Wk, Hk, X, Y: Integer;
  DoUpdate: Boolean;
  OnChanged: TAreaChangedEvent;
  Step: Integer;
  GetSample: TGetSampleInt;
begin
  GetSample := FSampler.GetSampleInt;
  OnChanged := Dst.OnAreaChanged;
  DoUpdate := (TThreadPersistentAccess(Dst).UpdateCount = 0) and Assigned(OnChanged);
  Dst.BeginUpdate;
  W := DstRect.Right - DstRect.Left;
  H := DstRect.Bottom - DstRect.Top;
  J := DstRect.Top;
  Step := 1 shl FSteps;
  while J < DstRect.Bottom do
  begin
    I := DstRect.Left;
    B := Min(J + Step, DstRect.Bottom);
    while I < DstRect.Right - Step do
    begin
      Dst.FillRect(I, J, I + Step, B, GetSample(I, J));
      Inc(I, Step);
    end;
    Dst.FillRect(I, J, DstRect.Right, B, GetSample(I, J));
    if DoUpdate and FUpdateRows then
      OnChanged(Dst, Rect(DstRect.Left, J, DstRect.Right, B), AREAINFO_RECT);
    Inc(J, Step);
  end;
  if DoUpdate and (not FUpdateRows) then
    OnChanged(Dst, DstRect, AREAINFO_RECT);

  Shift := FSteps;
  while Step > 1 do
  begin
    Dec(Shift);
    Step := Step div 2;
    Wk := W div Step - 1;
    Hk := H div Step;
    for J := 0 to Hk do
    begin
      Y := DstRect.Top + J shl Shift;
      B := Min(Y + Step, DstRect.Bottom);
      if Odd(J) then
        for I := 0 to Wk do
        begin
          X := DstRect.Left + I shl Shift;
          Dst.FillRect(X, Y, X + Step, B, GetSample(X, Y));
        end
      else
        for I := 0 to Wk do
          if Odd(I) then
          begin
            X := DstRect.Left + I shl Shift;
            Dst.FillRect(X, Y, X + Step, B, GetSample(X, Y));
          end;
      X := DstRect.Left + Wk shl Shift;
      Dst.FillRect(X, Y, DstRect.Right, B, GetSample(X, Y));
      if FUpdateRows and DoUpdate then
        OnChanged(Dst, Rect(DstRect.Left, Y, DstRect.Right, B), AREAINFO_RECT);
    end;
    if DoUpdate and (not FUpdateRows) then
      OnChanged(Dst, DstRect, AREAINFO_RECT);
  end;
  Dst.EndUpdate;
end;

procedure TProgressiveRasterizer.SetSteps(const Value: Integer);
begin
  if FSteps <> Value then
  begin
    FSteps := Value;
    Changed;
  end;
end;

procedure TProgressiveRasterizer.SetUpdateRows(const Value: Boolean);
begin
  if FUpdateRows <> Value then
  begin
    FUpdateRows := Value;
    Changed;
  end;
end;

{ TTesseralRasterizer }

procedure TTesseralRasterizer.DoRasterize(Dst: TCnsBitmap32; DstRect: TRect);
var
  W, H, I: Integer;
  GetSample: TGetSampleInt;

  procedure SplitHorizontal(X, Y, Width, Height: Integer); forward;

  procedure SplitVertical(X, Y, Width, Height: Integer);
  var
    HalfWidth, X2, I: Integer;
  begin
    HalfWidth := Width div 2;
    if HalfWidth > 0 then
    begin
      X2 := X + HalfWidth;
      for I := Y + 1 to Y + Height - 1 do
        AssignColor(Dst.PixelPtr[X2, I]^, GetSample(X2, I));
      Dst.ChangedEx(Rect(X2, Y, X2 + 1, Y + Height));
      SplitHorizontal(X, Y, HalfWidth, Height);
      SplitHorizontal(X2, Y, Width - HalfWidth, Height);
    end;
  end;

  procedure SplitHorizontal(X, Y, Width, Height: Integer);
  var
    HalfHeight, Y2, I: Integer;
  begin
    HalfHeight := Height div 2;
    if HalfHeight > 0 then
    begin
      Y2 := Y + HalfHeight;
      for I := X + 1 to X + Width - 1 do
        AssignColor(Dst.PixelPtr[I, Y2]^, GetSample(I, Y2));
      Dst.ChangedEx(Rect(X, Y2, X + Width, Y2 + 1));
      SplitVertical(X, Y, Width, HalfHeight);
      SplitVertical(X, Y2, Width, Height - HalfHeight);
    end;
  end;

begin
  GetSample := FSampler.GetSampleInt;
  with DstRect do
  begin
    W := Right - Left;
    H := Bottom - Top;
    for I := Left to Right - 1 do
      AssignColor(Dst.PixelPtr[I, Top]^, GetSample(I, Top));
    Dst.ChangedEx(Rect(Left, Top, Right, Top + 1));
    for I := Top to Bottom - 1 do
      AssignColor(Dst.PixelPtr[Left, I]^, GetSample(Left, I));
    Dst.ChangedEx(Rect(Left, Top, Left + 1, Bottom));
    if W > H then
      SplitVertical(Left, Top, W, H)
    else
      SplitHorizontal(Left, Top, W, H);
  end;
end;

{ TContourRasterizer }

procedure InflateRect(const P: TPoint; var R: TRect);
begin
  if P.X < R.Left then
    R.Left := P.X;
  if P.Y < R.Top then
    R.Top := P.Y;
  if P.X >= R.Right then
    R.Right := P.X + 1;
  if P.Y >= R.Bottom then
    R.Bottom := P.Y + 1;
end;

procedure TContourRasterizer.DoRasterize(Dst: TCnsBitmap32; DstRect: TRect);
type
  TDirection = (North, East, South, West);
var
  I, J, D, Diff: Integer;
  C, CLast: TColor32;
  P, PLast: TPoint;
  GetSample: TGetSampleInt;
  NewDir, Dir: TDirection;
  Visited: TBooleanMap;
  UpdateRect: TRect;
const
  LEFT: array[TDirection] of TDirection = (West, North, East, South);
  RIGHT: array[TDirection] of TDirection = (East, South, West, North);
  COORDS: array[TDirection] of TPoint = ((X: 0; Y: - 1), (X: 1; Y: 0), (X: 0; Y: 1), (X: - 1; Y:
    0));
  UpdateSteps = 100;
label
  MainLoop;
begin
  GetSample := FSampler.GetSampleInt;
  Visited := TBooleanMap.Create;
  try
    with DstRect do
      Visited.SetSize(Right - Left, Bottom - Top);

    I := 0;
    J := 0;
    Dir := East;
    NewDir := East;

    PLast := Point(DstRect.Left, DstRect.Top);
    CLast := GetSample(PLast.X, PLast.Y);
    AssignColor(Dst.PixelPtr[PLast.X, PLast.Y]^, CLast);

    UpdateRect := Rect(PLast.X, PLast.Y, PLast.X + 1, PLast.Y + 1);
    while True do
    begin
      MainLoop:

      Diff := MaxInt;

      // forward
      with COORDS[Dir] do
        P := Point(PLast.X + X, PLast.Y + Y);
      if PtInRect(DstRect, P) and (not Visited[P.X, P.Y]) then
      begin
        C := GetSample(P.X, P.Y);
        Diff := Intensity(ColorSub(C, CLast));
        EMMS;
        NewDir := Dir;
        AssignColor(Dst.PixelPtr[P.X, P.Y]^, C);
        Visited[P.X - DstRect.Left, P.Y - DstRect.Top] := True;
        InflateRect(P, UpdateRect);
      end;

      // left
      with COORDS[LEFT[Dir]] do
        P := Point(PLast.X + X, PLast.Y + Y);
      if PtInRect(DstRect, P) and (not Visited[P.X, P.Y]) then
      begin
        C := GetSample(P.X, P.Y);
        D := Intensity(ColorSub(C, CLast));
        EMMS;
        if D < Diff then
        begin
          NewDir := LEFT[Dir];
          Diff := D;
        end;
        AssignColor(Dst.PixelPtr[P.X, P.Y]^, C);
        Visited[P.X - DstRect.Left, P.Y - DstRect.Top] := True;
        InflateRect(P, UpdateRect);
      end;

      // right
      with COORDS[RIGHT[Dir]] do
        P := Point(PLast.X + X, PLast.Y + Y);
      if PtInRect(DstRect, P) and (not Visited[P.X, P.Y]) then
      begin
        C := GetSample(P.X, P.Y);
        D := Intensity(ColorSub(C, CLast));
        EMMS;
        if D < Diff then
        begin
          NewDir := RIGHT[Dir];
          Diff := D;
        end;
        AssignColor(Dst.PixelPtr[P.X, P.Y]^, C);
        Visited[P.X - DstRect.Left, P.Y - DstRect.Top] := True;
        InflateRect(P, UpdateRect);
      end;

      if Diff = MaxInt then
      begin
        Dst.ChangedEx(UpdateRect);
        while J < Visited.Height do
        begin
          while I < Visited.Width do
          begin
            if not Visited[I, J] then
            begin
              Visited[I, J] := True;
              PLast := Point(DstRect.Left + I, DstRect.Top + J);
              CLast := GetSample(PLast.X, PLast.Y);
              AssignColor(Dst.PixelPtr[PLast.X, PLast.Y]^, CLast);
              UpdateRect := Rect(PLast.X, PLast.Y, PLast.X + 1, PLast.Y + 1);
              goto MainLoop;
            end;
            Inc(I);
          end;
          I := 0;
          Inc(J);
        end;
        Break;
      end;

      Dir := NewDir;
      with COORDS[Dir] do
        PLast := Point(PLast.X + X, PLast.Y + Y);
      CLast := Dst[PLast.X, PLast.Y];
    end;

  finally
    Visited.Free;
  end;
end;

const
  SEmptySource = 'The source is nil';
  SEmptyDestination = 'Destination is nil';
  SNoInPlace = 'In-place operation is unsupported';

procedure CheckParams(Dst, Src: TCnsBitmap32);
begin
  if Src = nil then
    raise Exception.Create(SEmptySource);
  if Dst = nil then
    raise Exception.Create(SEmptyDestination);
  Dst.SetSize(Src.Width, Src.Height);
end;

{rocedure CheckParamsNoInPlace(Dst, Src: TCnsBitmap32);
begin
  if (Src = nil) then
    raise Exception.Create(SEmptySource);
  if Dst = nil then
    raise Exception.Create(SEmptyDestination);
  if Dst = Src then
    raise Exception.Create(SNoInPlace);
  Dst.SetSize(Src);
end;       }

procedure AlphaToGrayscale(Dst, Src: TCnsBitmap32);
var
  I: Integer;
  D, S: PColor32;
begin
  CheckParams(Dst, Src);
  Dst.SetSize(Src.Width, Src.Height);
  D := @Dst.Bits[0];
  S := @Src.Bits[0];
  for I := 0 to Src.Width * Src.Height - 1 do
  begin
    D^ := Gray32(AlphaComponent(S^));
    Inc(S);
    Inc(D);
  end;
  Dst.Changed;
end;

procedure IntensityToAlpha(Dst, Src: TCnsBitmap32);
var
  I: Integer;
  D, S: PColor32;
begin
  CheckParams(Dst, Src);
  Dst.SetSize(Src.Width, Src.Height);
  D := @Dst.Bits[0];
  S := @Src.Bits[0];
  for I := 0 to Src.Width * Src.Height - 1 do
  begin
    D^ := SetAlpha(D^, Intensity(S^));
    Inc(S);
    Inc(D);
  end;
  Dst.Changed;
end;

procedure Invert(Dst, Src: TCnsBitmap32);
var
  I: Integer;
  D, S: PColor32;
begin
  CheckParams(Dst, Src);
  Dst.SetSize(Src.Width, Src.Height);
  D := @Dst.Bits[0];
  S := @Src.Bits[0];
  for I := 0 to Src.Width * Src.Height - 1 do
  begin
    D^ := S^ xor $FFFFFFFF;
    Inc(S);
    Inc(D);
  end;
  Dst.Changed;
end;

procedure InvertRGB(Dst, Src: TCnsBitmap32);
var
  I: Integer;
  D, S: PColor32;
begin
  CheckParams(Dst, Src);
  Dst.SetSize(Src.Width, Src.Height);
  D := @Dst.Bits[0];
  S := @Src.Bits[0];
  for I := 0 to Src.Width * Src.Height - 1 do
  begin
    D^ := S^ xor $00FFFFFF;
    Inc(S);
    Inc(D);
  end;
  Dst.Changed;
end;

procedure ColorToGrayscale(Dst, Src: TCnsBitmap32; PreserveAlpha: Boolean = False);
var
  I: Integer;
  D, S: PColor32;
begin
  CheckParams(Dst, Src);
  Dst.SetSize(Src.Width, Src.Height);
  D := @Dst.Bits[0];
  S := @Src.Bits[0];

  if PreserveAlpha then
    for I := 0 to Src.Width * Src.Height - 1 do
    begin
      D^ := Gray32(Intensity(S^), AlphaComponent(S^));
      Inc(S);
      Inc(D);
    end
  else
    for I := 0 to Src.Width * Src.Height - 1 do
    begin
      D^ := Gray32(Intensity(S^));
      Inc(S);
      Inc(D);
    end;

  Dst.Changed;
end;

procedure ApplyLUT(Dst, Src: TCnsBitmap32; const LUT: TLUT8; PreserveAlpha: Boolean = False);
var
  I: Integer;
  D, S: PColor32;
  a, r, g, b: TColor32;
  C: TColor32;
begin
  CheckParams(Dst, Src);
  Dst.SetSize(Src.Width, Src.Height);
  D := @Dst.Bits[0];
  S := @Src.Bits[0];

  if PreserveAlpha then
    for I := 0 to Src.Width * Src.Height - 1 do
    begin
      C := S^;
      a := C and $FF000000;
      r := C and $00FF0000;
      g := C and $0000FF00;
      a := a shr 24;
      r := r shr 16;
      b := C and $000000FF;
      g := g shr 8;
      r := LUT[r];
      g := LUT[g];
      b := LUT[b];
      D^ := a shl 24 or r shl 16 or g shl 8 or b;
      Inc(S);
      Inc(D);
    end
  else
    for I := 0 to Src.Width * Src.Height - 1 do
    begin
      C := S^;
      r := C and $00FF0000;
      g := C and $0000FF00;
      r := r shr 16;
      b := C and $000000FF;
      g := g shr 8;
      r := LUT[r];
      g := LUT[g];
      b := LUT[b];
      D^ := $FF000000 or r shl 16 or g shl 8 or b;
      Inc(S);
      Inc(D);
    end;

  Dst.Changed;
end;

procedure CromaKey(ABitmap: TCnsBitmap32; TrColor: TColor32);
var
  P: PColor32;
  C: TColor32;
  I: Integer;
begin
  TrColor := TrColor and $00FFFFFF;
  with ABitmap do
  begin
    P := PixelPtr[0, 0];
    for I := 0 to Width * Height - 1 do
    begin
      C := P^ and $00FFFFFF;
      if C = TrColor then
        P^ := C;
      Inc(P)
    end;
  end;
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
      Inc(X1, MulDiv(V - Y1, X2 - X1, Y2 - Y1));
      Y1 := V;
      C1 := Ord(X1 < MinX) + Ord(X1 > MaxX) shl 1;
    end;

    if (C2 and 12) <> 0 then
    begin
      if C2 < 8 then
        V := MinY
      else
        V := MaxY;
      Inc(X2, MulDiv(V - Y2, X2 - X1, Y2 - Y1));
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
        Inc(Y1, MulDiv(V - X1, Y2 - Y1, X2 - X1));
        X1 := V;
        C1 := 0;
      end;

      if C2 <> 0 then
      begin
        if C2 = 1 then
          V := MinX
        else
          V := MaxX;
        Inc(Y2, MulDiv(V - X2, Y2 - Y1, X2 - X1));
        X2 := V;
        C2 := 0;
      end;
    end;
  end;

  Result := (C1 or C2) = 0;
end;

type
  TBitmap32Access = class(TCnsBitmap32);

  { TCnsPaintStages }

function TCnsPaintStages.Add: PPaintStage;
var
  L: Integer;
begin
  L := Length(FItems);
  SetLength(FItems, L + 1);
  Result := @FItems[L];
  with Result^ do
  begin
    DsgnTime := False;
    RunTime := True;
    Stage := 0;
    Parameter := 0;
  end;
end;

procedure TCnsPaintStages.Clear;
begin
  FItems := nil;
end;

function TCnsPaintStages.Count: Integer;
begin
  Result := Length(FItems);
end;

procedure TCnsPaintStages.Delete(Index: Integer);
var
  Count: Integer;
begin
  if (Index < 0) or (Index > High(FItems)) then
    raise EListError.Create('Invalid stage index');
  Count := Length(FItems) - Index - 1;
  if Count > 0 then
    Move(FItems[Index + 1], FItems[Index], Count * SizeOf(TPaintStage));
  SetLength(FItems, High(FItems));
end;

destructor TCnsPaintStages.Destroy;
begin
  Clear;
  inherited;
end;

function TCnsPaintStages.GetItem(Index: Integer): PPaintStage;
begin
  Result := @FItems[Index];
end;

function TCnsPaintStages.Insert(Index: Integer): PPaintStage;
var
  Count: Integer;
begin
  if Index < 0 then
    Index := 0
  else
    if Index > Length(FItems) then
    Index := Length(FItems);
  Count := Length(FItems) - Index;
  SetLength(FItems, Length(FItems) + 1);
  if Count > 0 then
    Move(FItems[Index], FItems[Index + 1], Count * SizeOf(TPaintStage));
  Result := @FItems[Index];
  with Result^ do
  begin
    DsgnTime := False;
    RunTime := True;
    Stage := 0;
    Parameter := 0;
  end;
end;

{ TCnsCustomPaintBox32 }

{$IFNDEF CLX}

procedure TCnsCustomPaintBox32.CMInvalidate(var Message: TMessage);
begin
  inherited;
end;

procedure TCnsCustomPaintBox32.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  MouseEnter;
end;

procedure TCnsCustomPaintBox32.CMMouseLeave(var Message: TMessage);
begin
  MouseLeave;
  inherited;
end;
{$ENDIF}

constructor TCnsCustomPaintBox32.Create(AOwner: TComponent);
begin
  inherited;
  FBuffer := TCnsBitmap32.Create;
  FBufferOversize := 0;
  //  FForceFullRepaint := True;
  //  FInvalidRects := TRectList.Create;
  //  FRepaintOptimizer := DefaultRepaintOptimizerClass.Create(Buffer, InvalidRects);
  //  FRepaintOptimizer.Enabled := false;
  Height := 192;
  Width := 192;
end;

destructor TCnsCustomPaintBox32.Destroy;
begin
  //  FRepaintOptimizer.Free;
  //  FInvalidRects.Free;
  FBuffer.Free;
  inherited;
end;

function TCnsCustomPaintBox32.InvalidRectsAvailable: Boolean;
begin
  Result := True;
end;

procedure TCnsCustomPaintBox32.DoPaintBuffer;
begin
  // descendants should override this method for painting operations,
  // not the Paint method!!!
  FBufferValid := True;
end;

procedure TCnsCustomPaintBox32.DoPaintGDIOverlay;
begin
  if Assigned(FOnGDIOverlay) then
    FOnGDIOverlay(Self);
end;

procedure TCnsCustomPaintBox32.Flush;
begin
  {$IFDEF CLX}
  if Assigned(Canvas.Handle) and Assigned(FBuffer.Handle) then
    {$ELSE}
  if (Canvas.Handle <> 0) and (FBuffer.Handle <> 0) then
    {$ENDIF}
  begin
    Canvas.Lock;
    try
      FBuffer.Lock;
      try
        with GetViewportRect do
          {$IFDEF CLX}
        begin
          if not QPainter_isActive(FBuffer.Handle) then
            if not QPainter_begin(FBuffer.Handle, FBuffer.Pixmap) then
              raise EInvalidGraphicOperation.CreateRes(@SInvalidCanvasState);
          QPainter_drawPixmap(Canvas.Handle, Top, Left, FBuffer.Pixmap, 0, 0, Right - Left, Bottom
            - Top);
          QPainter_end(FBuffer.Handle);

          TBitmap32Access(FBuffer).CheckPixmap;
          // try to avoid QPixmap -> QImage conversion, since we don't need that.
        end;
        {$ELSE}
          BitBlt(Canvas.Handle, Left, Top, Right - Left, Bottom - Top,
            FBuffer.Handle, 0, 0, SRCCOPY);
        {$ENDIF}
      finally
        FBuffer.Unlock;
      end;
    finally
      Canvas.Unlock;
    end;
  end;
end;

procedure TCnsCustomPaintBox32.Flush(const SrcRect: TRect);
var
  R: TRect;
begin
  {$IFDEF CLX}
  if Assigned(Canvas.Handle) and Assigned(FBuffer.Handle) then
    {$ELSE}
  if (Canvas.Handle <> 0) and (FBuffer.Handle <> 0) then
    {$ENDIF}
  begin
    Canvas.Lock;
    try
      FBuffer.Lock;
      try
        R := GetViewPortRect;
        with SrcRect do
          {$IFDEF CLX}
        begin
          if not QPainter_isActive(FBuffer.Handle) then
            if not QPainter_begin(FBuffer.Handle, FBuffer.Pixmap) then
              raise EInvalidGraphicOperation.CreateRes(@SInvalidCanvasState);
          QPainter_drawPixmap(Canvas.Handle, Top + R.Top, Left + R.Left,
            FBuffer.Pixmap, 0, 0, Right - Left, Bottom - Top);
          QPainter_end(FBuffer.Handle);

          TBitmap32Access(FBuffer).CheckPixmap;
          // try to avoid QPixmap -> QImage conversion, since we don't need that.
        end;
        {$ELSE}
          BitBlt(Canvas.Handle, Left + R.Left, Top + R.Top, Right - Left, Bottom - Top,
            FBuffer.Handle, Left, Top, SRCCOPY);
        {$ENDIF}
      finally
        FBuffer.Unlock;
      end;
    finally
      Canvas.Unlock;
    end;
  end;
end;

function TCnsCustomPaintBox32.GetViewportRect: TRect;
begin
  // returns position of the buffered area within the control bounds
  with Result do
  begin
    // by default, the whole control is buffered
    Left := 0;
    Top := 0;
    Right := Width;
    Bottom := Height;
  end;
end;

procedure TCnsCustomPaintBox32.Invalidate;
begin
  FBufferValid := False;
  inherited;
end;

procedure TCnsCustomPaintBox32.Loaded;
begin
  FBufferValid := False;
  inherited;
end;

procedure TCnsCustomPaintBox32.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (pboAutoFocus in Options) and CanFocus then
    SetFocus;
  inherited;
end;

{$IFDEF CLX}

procedure TCnsCustomPaintBox32.MouseEnter(AControl: TControl);
begin
  FMouseInControl := True;
  inherited;
end;

procedure TCnsCustomPaintBox32.MouseLeave(AControl: TControl);
begin
  FMouseInControl := False;
  inherited;
end;

{$ELSE}

procedure TCnsCustomPaintBox32.MouseEnter;
begin
  FMouseInControl := True;
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TCnsCustomPaintBox32.MouseLeave;
begin
  FMouseInControl := False;
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;
{$ENDIF}

procedure TCnsCustomPaintBox32.Paint;
begin
  if not FBufferValid then
  begin
    {$IFDEF CLX}
    TBitmap32Access(FBuffer).ImageNeeded;
    {$ENDIF}
    DoPaintBuffer;
    {$IFDEF CLX}
    TBitmap32Access(FBuffer).CheckPixmap;
    {$ENDIF}
  end;

  FBuffer.Lock;
  with Canvas do
  try
    {$IFDEF CLX}
    if FInvalidRects.Count > 0 then
      for i := 0 to FInvalidRects.Count - 1 do
        with FInvalidRects[i]^ do
          QPainter_drawImage(Canvas.Handle, Left, Top, FBuffer.Image, Left, Top, Right - Left,
            Bottom - Top)
    else
    begin
      if not QPainter_isActive(FBuffer.Handle) then
        if not QPainter_begin(FBuffer.Handle, FBuffer.Pixmap) then
          raise EInvalidGraphicOperation.CreateRes(@SInvalidCanvasState);

      with GetViewportRect do
        QPainter_drawPixmap(Canvas.Handle, Left, Top, FBuffer.Pixmap, Left, Top, Right - Left,
          Bottom - Top);

      QPainter_end(FBuffer.Handle);
    end;
    {$ELSE}
    {$IFDEF DICOMDEBUG}SendDebug('BitBlt');
    {$ENDIF}
    with GetViewportRect do
      BitBlt(Canvas.Handle, Left, Top, Right - Left, Bottom - Top, FBuffer.Handle, Left, Top,
        SRCCOPY);
    {$ENDIF}
  finally
    FBuffer.Unlock;
  end;

  DoPaintGDIOverlay;

end;

procedure TCnsCustomPaintBox32.Resize;
begin
  ResizeBuffer;
  BufferValid := False;
  inherited;
end;

procedure TCnsCustomPaintBox32.ResizeBuffer;
var
  NewWidth, NewHeight, W, H: Integer;
begin
  // get the viewport parameters
  with GetViewportRect do
  begin
    NewWidth := Right - Left;
    NewHeight := Bottom - Top;
  end;
  if NewWidth < 0 then
    NewWidth := 0;
  if NewHeight < 0 then
    NewHeight := 0;

  W := FBuffer.Width;
  if NewWidth > W then
    W := NewWidth + FBufferOversize
  else
    if NewWidth < W - FBufferOversize then
    W := NewWidth;
  if W < 1 then
    W := 1;

  H := FBuffer.Height;
  if NewHeight > H then
    H := NewHeight + FBufferOversize
  else
    if NewHeight < H - FBufferOversize then
    H := NewHeight;
  if H < 1 then
    H := 1;

  if (W <> FBuffer.Width) or (H <> FBuffer.Height) then
  begin
    FBuffer.Lock;
    FBuffer.SetSize(NewWidth, NewHeight);
    FBuffer.Unlock;
    FBufferValid := False;
  end;
end;

procedure TCnsCustomPaintBox32.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  if csDesigning in ComponentState then
    ResizeBuffer;
  FBufferValid := False;
end;

procedure TCnsCustomPaintBox32.SetBufferOversize(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  FBufferOversize := Value;
end;

{$IFDEF CLX}

function TCnsCustomPaintBox32.WidgetFlags: Integer;
begin
  Result := inherited WidgetFlags or Integer(WidgetFlags_WRepaintNoErase) or
    Integer(WidgetFlags_WResizeNoErase);
end;
{$ELSE}

procedure TCnsCustomPaintBox32.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TCnsCustomPaintBox32.WMGetDlgCode(var Msg: TWmGetDlgCode);
begin
  with Msg do
    if pboWantArrowKeys in Options then
      Result := Result or DLGC_WANTARROWS
    else
      Result := Result and not DLGC_WANTARROWS;
end;

procedure TCnsCustomPaintBox32.WMPaint(var Message: TMessage);
begin
  inherited;
end;
{$ENDIF}

procedure TCnsCustomPaintBox32.DirectAreaUpdateHandler(Sender: TObject;
  const Area: TRect; const Info: Cardinal);
begin
  if not (csCustomPaint in ControlState) then
    Repaint;
end;

{ TCnsCustomImage32 }

procedure TCnsCustomImage32.BeginUpdate;
begin
  // disable OnChange & OnChanging generation
  Inc(FUpdateCount);
end;

procedure TCnsCustomImage32.BitmapResized;
{$IFNDEF CLX}
var
  W, H: Integer;
  {$ENDIF}
begin
  {$IFNDEF CLX}
  if AutoSize then
  begin
    W := Bitmap.Width;
    H := Bitmap.Height;
    if ScaleMode = smScale then
    begin
      W := Round(W * Scale);
      H := Round(H * Scale);
    end;
    if AutoSize and (W > 0) and (H > 0) then
      SetBounds(Left, Top, W, H);
  end;
  {$ENDIF}
  if (FUpdateCount <> 0) and Assigned(FOnBitmapResize) then
    FOnBitmapResize(Self);
  InvalidateCache;
  Invalidate;
end;

procedure TCnsCustomImage32.BitmapChanged(const Area: TRect);
begin
  Changed;
end;

function TCnsCustomImage32.BitmapToControl(const APoint: TPoint): TPoint;
begin
  // convert coordinates from bitmap's ref. frame to control's ref. frame
  UpdateCache;
  with CachedXForm, APoint do
  begin
    Result.X := X * ScaleX div $10000 + ShiftX;
    Result.Y := Y * ScaleY div $10000 + ShiftY;
  end;
end;

{$IFNDEF CLX}

function TCnsCustomImage32.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
var
  W, H: Integer;
begin
  InvalidateCache;
  Result := True;
  W := Bitmap.Width;
  H := Bitmap.Height;
  if ScaleMode = smScale then
  begin
    W := Round(W * Scale);
    H := Round(H * Scale);
  end;
  if not (csDesigning in ComponentState) or (W > 0) and (H > 0) then
  begin
    if Align in [alNone, alLeft, alRight] then
      NewWidth := W;
    if Align in [alNone, alTop, alBottom] then
      NewHeight := H;
  end;
end;
{$ENDIF}

procedure TCnsCustomImage32.Changed;
begin
  if FUpdateCount = 0 then
  begin
    Invalidate;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TCnsCustomImage32.BitmapResizeHandler(Sender: TObject);
begin
  {$IFDEF CLX}
  // workaround to stop CLX from calling BitmapResized and to prevent
  // AV when accessing Layers. Layers is already freed at that time
  if not (csDestroying in ComponentState) then
    {$ENDIF}
    BitmapResized;
end;

function TCnsCustomImage32.ControlToBitmap(const APoint: TPoint): TPoint;
begin
  // convert point coords from control's ref. frame to bitmap's ref. frame
  // the coordinates are not clipped to bitmap image boundary
  UpdateCache;
  with CachedXForm, APoint do
  begin
    Result.X := (X - ShiftX) * RevScaleX div $10000;
    Result.Y := (Y - ShiftY) * RevScaleY div $10000;
  end;
end;

constructor TCnsCustomImage32.Create(AOwner: TComponent);
begin
  inherited;
  FBitmapModify := true;

  fInUndating := false;
  FSelected := False;
  FWhiteGrid := true;
  FScaleChanged := False;

  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csDoubleClicks, csReplicatable, csOpaque];
  FBitmap := TCnsBitmap32.Create;
  FBitmap.OnResize := BitmapResizeHandler;

  FPaintStages := TCnsPaintStages.Create;
  FScaleX := 1.0;
  FScaleY := 1.0;
  InitDefaultStages;
end;

destructor TCnsCustomImage32.Destroy;
begin
  BeginUpdate;
  FPaintStages.Free;
  FBitmap.Free;
  inherited;
end;

procedure TCnsCustomImage32.SetView(AOffsetVert, AOffsetHorz: Single);
begin
  //if (abs(AOffsetVert / Scale) < (Bitmap.Height / 2)) and (abs(AOffsetHorz / Scale) < (Bitmap.Width / 2)) then
  begin
    InvalidateCache;
    FOffsetVert := AOffsetVert;
    FOffsetHorz := AOffsetHorz;
    Changed;
  end;
end;

procedure TCnsCustomImage32.DoInitStages;
begin
  if Assigned(FOnInitStages) then
    FOnInitStages(Self);
end;

procedure TCnsCustomImage32.DoPaintBuffer;
var
  PaintStageHandlerCount: Integer;
  I: Integer;
  DT, RT: Boolean;
begin
  //  if FRepaintOptimizer.Enabled then
  //    FRepaintOptimizer.BeginPaintBuffer;

  UpdateCache;

  SetLength(FPaintStageHandlers, FPaintStages.Count);
  SetLength(FPaintStageNum, FPaintStages.Count);
  PaintStageHandlerCount := 0;

  DT := csDesigning in ComponentState;
  RT := not DT;

  // compile list of paintstage handler methods
  for I := 0 to FPaintStages.Count - 1 do
  begin
    with FPaintStages[I]^ do
      if (DsgnTime and DT) or (RunTime and RT) then
      begin
        FPaintStageNum[PaintStageHandlerCount] := I;
        case Stage of
          PST_CUSTOM: FPaintStageHandlers[PaintStageHandlerCount] := ExecCustom;
          PST_CLEAR_BUFFER: FPaintStageHandlers[PaintStageHandlerCount] := ExecClearBuffer;
          PST_CLEAR_BACKGND: FPaintStageHandlers[PaintStageHandlerCount] := ExecClearBackgnd;
          PST_DRAW_BITMAP: FPaintStageHandlers[PaintStageHandlerCount] := ExecDrawBitmap;
          PST_DRAW_LAYERS: FPaintStageHandlers[PaintStageHandlerCount] := ExecDrawLayers;
          PST_CONTROL_FRAME: FPaintStageHandlers[PaintStageHandlerCount] := ExecControlFrame;
          PST_BITMAP_FRAME: FPaintStageHandlers[PaintStageHandlerCount] := ExecBitmapFrame;
        else
          Dec(PaintStageHandlerCount); // this should not happen .
        end;
        Inc(PaintStageHandlerCount);
      end;
  end;

  Buffer.BeginUpdate;
  Buffer.ClipRect := GetViewportRect;
  for I := 0 to PaintStageHandlerCount - 1 do
    FPaintStageHandlers[I](Buffer, FPaintStageNum[I]);

  Buffer.EndUpdate;

  //  if FRepaintOptimizer.Enabled then
  //    FRepaintOptimizer.EndPaintBuffer;

    // avoid calling inherited, we have a totally different behaviour here...
  FBufferValid := True;
end;

procedure TCnsCustomImage32.DoPaintGDIOverlay;
begin
  inherited;
end;

procedure TCnsCustomImage32.DoScaleChange;
begin
  if Assigned(FOnScaleChange) then
    FOnScaleChange(Self);
end;

procedure TCnsCustomImage32.EndUpdate;
begin
  // re-enable OnChange & OnChanging generation
  Dec(FUpdateCount);
  Assert(FUpdateCount >= 0, 'Unpaired EndUpdate call');
end;

procedure TCnsCustomImage32.ExecBitmapFrame(Dest: TCnsBitmap32; StageNum: Integer);
begin
  Dest.Canvas.DrawFocusRect(CachedBitmapRect);
end;

procedure TCnsCustomImage32.ExecClearBackgnd(Dest: TCnsBitmap32; StageNum: Integer);
var
  C: TColor32;
begin
  C := Color32(Color);

  begin
    if (Bitmap.Empty) or (Bitmap.DrawMode <> dmOpaque) then
      Dest.Clear(C)
    else
      with CachedBitmapRect do
      begin
        if (Left > 0) or (Right < Width) or (Top > 0) or (Bottom < Height) and
          not (BitmapAlign = baTile) then
        begin
          // clean only the part of the buffer lying around image edges
          Dest.FillRectS(0, 0, Width, Top, C); // top
          Dest.FillRectS(0, Bottom, Width, Height, C); // bottom
          Dest.FillRectS(0, Top, Left, Bottom, C); // left
          Dest.FillRectS(Right, Top, Width, Bottom, C); // right
        end;
      end;
  end;
end;

procedure TCnsCustomImage32.ExecClearBuffer(Dest: TCnsBitmap32; StageNum: Integer);
begin
  Dest.Clear(Color32(Color));
end;

procedure TCnsCustomImage32.ExecControlFrame(Dest: TCnsBitmap32; StageNum: Integer);
begin
  {$IFDEF CLX}
  Dest.Canvas.DrawFocusRect(Rect(0, 0, Width, Height));
  {$ELSE}
  DrawFocusRect(Dest.Handle, Rect(0, 0, Width, Height));
  {$ENDIF}
end;

procedure TCnsCustomImage32.ExecCustom(Dest: TCnsBitmap32; StageNum: Integer);
begin
  if FMouseInControl then
  begin
    Dest.LineS(0, 0, Dest.Width, 0, clRed32);
    Dest.LineS(0, 0, 0, Dest.Height, clRed32);
    Dest.LineS(Dest.Width - 1, Dest.Height - 1, Dest.Width - 1, 0, clRed32);
    Dest.LineS(Dest.Width - 1, Dest.Height - 1, 0, Dest.Height - 1, clRed32);
  end
  else
    if FSelected then
  begin
    Dest.LineS(0, 0, Dest.Width, 0, clYellow32);
    Dest.LineS(0, 0, 0, Dest.Height, clYellow32);
    Dest.LineS(Dest.Width - 1, Dest.Height - 1, Dest.Width - 1, 0, clYellow32);
    Dest.LineS(Dest.Width - 1, Dest.Height - 1, 0, Dest.Height - 1, clYellow32);
  end
  else
    if FWhiteGrid then
  begin
    Dest.LineS(0, 0, Dest.Width, 0, clWhite32);
    Dest.LineS(0, 0, 0, Dest.Height, clWhite32);
    Dest.LineS(Dest.Width - 1, Dest.Height - 1, Dest.Width - 1, 0, clWhite32);
    Dest.LineS(Dest.Width - 1, Dest.Height - 1, 0, Dest.Height - 1, clWhite32);
  end;
  if Assigned(FOnPaintStage) then
    FOnPaintStage(Self, Dest, StageNum);
end;

procedure TCnsCustomImage32.ExecDrawBitmap(Dest: TCnsBitmap32; StageNum: Integer);
var
  I, J, Tx, Ty: Integer;
  R: TRect;
  l1, l2, l0: Integer;
  k: Integer;
begin
  {$IFDEF DICOMDEBUG}
  SendDebug('ExecDrawBitmap');
  {$ENDIF}
  if {(width > 200) and}(Bitmap.Empty or IsRectEmpty(CachedBitmapRect)) then
  begin
    k := Min(Dest.Width, Dest.Height);

    Dest.Font.Color := clGreen;
    Dest.Font.Name := 'ËÎÌו';
    l0 := Length(PacsSoftwareName);
    l2 := Length(UserHospitalName);
    if l2 > l0 then
      l0 := l2;
    if l0 < 20 then
      l0 := 20;
    Dest.Font.Size := -Trunc(k * 1.3 / l0);
    l0 := Dest.TextWidth(UserHospitalName);
    l2 := Dest.TextHeight(UserHospitalName);

    Dest.TextOut((Dest.Width - l0) div 2, (Dest.Height) div 2 - l2, UserHospitalName);

    Dest.Font.Size := Trunc(Dest.Font.Size * 0.6); //-Round(k * 2.5 / l0);
    l1 := Dest.TextWidth(PacsSoftwareName);
    Dest.TextOut((Dest.Width - l1) div 2, (Dest.Height) div 2, PacsSoftwareName);
    Exit;
  end;

  Bitmap.Lock;
  try
    if BitmapAlign <> baTile then
    begin
      {if (Min(Bitmap.Width / (CachedBitmapRect.Right - CachedBitmapRect.Left), Bitmap.Height / (CachedBitmapRect.Bottom - CachedBitmapRect.Top)) > 1) then
      begin
        Bitmap.DrawToNear(Dest, CachedBitmapRect)
      end
      else}
      Bitmap.DrawTo(Dest, CachedBitmapRect)
    end
    else
      with CachedBitmapRect do
      begin
        Tx := Dest.Width div Right;
        Ty := Dest.Height div Bottom;
        for J := 0 to Ty do
          for I := 0 to Tx do
          begin
            R := CachedBitmapRect;
            OffsetRect(R, Right * I, Bottom * J);
            Bitmap.DrawTo(Dest, R);
          end;
      end;
  finally
    Bitmap.Unlock;
  end;
  fInUndating := false;
end;

procedure TCnsCustomImage32.ExecDrawLayers(Dest: TCnsBitmap32; StageNum: Integer);
begin

end;

function TCnsCustomImage32.GetBitmapRect: TRect;
var
  Size: TSize;
begin
  if Bitmap.Empty then
    with Result do
    begin
      Left := 0;
      Right := 0;
      Top := 0;
      Bottom := 0;
    end
  else
  begin
    Size := GetBitmapSize;
    with Size do
    begin
      Result := Rect(0, 0, Cx, Cy);
      if BitmapAlign = baCenter then
        OffsetRect(Result, (Width - Cx) div 2, (Height - Cy) div 2)
      else
        if BitmapAlign = baCustom then
        OffsetRect(Result, Round(OffsetHorz), Round(OffsetVert));
    end;
  end;
end;

function TCnsCustomImage32.GetBitmapSize: TSize;
var
  Mode: TScaleMode;
  ViewportWidth, ViewportHeight: Integer;
  RScaleX, RScaleY: Single;
begin
  with Result do
  begin
    if Bitmap.Empty or (Width = 0) or (Height = 0) then
    begin
      Cx := 0;
      Cy := 0;
      Exit;
    end;

    with GetViewportRect do
    begin
      ViewportWidth := Right - Left;
      ViewportHeight := Bottom - Top;
    end;

    // check for optimal modes as these are compounds of the other modes.
    case ScaleMode of
      smOptimal:
        if (Bitmap.Width > ViewportWidth) or (Bitmap.Height > ViewportHeight) then
          Mode := smResize
        else
          Mode := smNormal;
      smOptimalScaled:
        if (Round(Bitmap.Width * ScaleX) > ViewportWidth) or
          (Round(Bitmap.Height * ScaleY) > ViewportHeight) then
          Mode := smResize
        else
          Mode := smScale;
    else
      Mode := ScaleMode;
    end;

    case Mode of
      smNormal:
        begin
          Cx := Bitmap.Width;
          Cy := Bitmap.Height;
        end;
      smStretch:
        begin
          Cx := ViewportWidth;
          Cy := ViewportHeight;
        end;
      smResize:
        begin
          Cx := Bitmap.Width;
          Cy := Bitmap.Height;
          RScaleX := ViewportWidth / Cx;
          RScaleY := ViewportHeight / Cy;
          if RScaleX >= RScaleY then
          begin
            Cx := Round(Cx * RScaleY);
            Cy := ViewportHeight;
          end
          else
          begin
            Cx := ViewportWidth;
            Cy := Round(Cy * RScaleX);
          end;
        end;
    else // smScale
      begin
        Cx := Round(Bitmap.Width * ScaleX);
        Cy := Round(Bitmap.Height * ScaleY);
      end;
    end;
    if Cx <= 0 then
      Cx := 0;
    if Cy <= 0 then
      Cy := 0;
  end;
end;

function TCnsCustomImage32.GetOnPixelCombine: TPixelCombineEvent;
begin
  Result := FBitmap.OnPixelCombine;
end;

procedure TCnsCustomImage32.InitDefaultStages;
begin
  // background
  with PaintStages.Add^ do
  begin
    DsgnTime := True;
    RunTime := True;
    Stage := PST_CLEAR_BACKGND;
  end;

  // bitmap
  with PaintStages.Add^ do
  begin
    DsgnTime := True;
    RunTime := True;
    Stage := PST_DRAW_BITMAP;
  end;
end;

procedure TCnsCustomImage32.Invalidate;
begin
  fInUndating := true;
  BufferValid := False;
  CacheValid := False;
  inherited;
end;

procedure TCnsCustomImage32.InvalidateCache;
begin
  CacheValid := False;
end;

procedure TCnsCustomImage32.Loaded;
begin
  inherited;
  DoInitStages;
end;

procedure TCnsCustomImage32.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if TabStop and CanFocus then
    SetFocus;

  // lock the capture only if mbLeft was pushed or any mouse listener was activated
  if (Button = mbLeft) then
    MouseCapture := True;
end;

procedure TCnsCustomImage32.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
end;

procedure TCnsCustomImage32.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // unlock the capture only if mbLeft was raised and there is no active mouse listeners
  if (Button = mbLeft) then
    MouseCapture := False;
end;

{$IFDEF CLX}

procedure TCnsCustomImage32.MouseLeave(AControl: TControl);
begin
  inherited;
end;

{$ELSE}

procedure TCnsCustomImage32.MouseLeave;
begin
  inherited;
end;
{$ENDIF}

procedure TCnsCustomImage32.PaintTo(Dest: TCnsBitmap32; DestRect: TRect);
var
  //  OldRepaintMode: TRepaintMode;
  I: Integer;
begin
  //  OldRepaintMode := RepaintMode;
  //  RepaintMode := rmFull;

  CachedBitmapRect := DestRect;

  with CachedBitmapRect, CachedXForm do
  begin
    if (Right - Left <= 0) or (Bottom - Top <= 0) or Bitmap.Empty then
      CachedXForm := UnitXForm
    else
    begin
      ShiftX := Left;
      ShiftY := Top;
      ScaleX := MulDiv(Right - Left, $10000, Bitmap.Width);
      ScaleY := MulDiv(Bottom - Top, $10000, Bitmap.Height);
      RevScaleX := MulDiv(Bitmap.Width, $10000, Right - Left);
      RevScaleY := MulDiv(Bitmap.Height, $10000, Bottom - Top);
    end;
  end;
  CacheValid := True;

  PaintToMode := True;
  try
    for I := 0 to FPaintStages.Count - 1 do
      with FPaintStages[I]^ do
        if RunTime then
          case Stage of
            PST_CUSTOM: ExecCustom(Dest, I);
            PST_CLEAR_BUFFER: ExecClearBuffer(Dest, I);
            PST_CLEAR_BACKGND: ExecClearBackgnd(Dest, I);
            PST_DRAW_BITMAP: ExecDrawBitmap(Dest, I);
            PST_DRAW_LAYERS: ExecDrawLayers(Dest, I);
            PST_CONTROL_FRAME: ExecControlFrame(Dest, I);
            PST_BITMAP_FRAME: ExecBitmapFrame(Dest, I);
          end;

  finally
    PaintToMode := False;
  end;
  CacheValid := False;

  //  RepaintMode := OldRepaintMode;
end;

procedure TCnsCustomImage32.Resize;
begin
  InvalidateCache;
  inherited;
end;

procedure TCnsCustomImage32.SetBitmap(Value: TCnsBitmap32);
begin
  InvalidateCache;
  FBitmap.Assign(Value);
end;

procedure TCnsCustomImage32.SetBitmapAlign(Value: TBitmapAlign);
begin
  InvalidateCache;
  FBitmapAlign := Value;
  Changed;
end;

procedure TCnsCustomImage32.SetOffsetHorz(Value: Single);
begin
  if Value <> FOffsetHorz then
  begin
    InvalidateCache;
    FOffsetHorz := Value;
    Changed;
  end;
end;

procedure TCnsCustomImage32.SetOffsetVert(Value: Single);
begin
  if Value <> FOffsetVert then
  begin
    FOffsetVert := Value;
    InvalidateCache;
    Changed;
  end;
end;

procedure TCnsCustomImage32.SetOnPixelCombine(Value: TPixelCombineEvent);
begin
  FBitmap.OnPixelCombine := Value;
  Changed;
end;

procedure TCnsCustomImage32.SetScale(Value: Single);
begin
  if Value < 0.001 then
    Value := 0.001;
  if Value <> FScaleX then
  begin
    if BitmapAlign = baCustom then
    begin
      FOffsetVert := FOffsetVert + (Bitmap.Height * (FScaleY - Value)) / 2;
      FOffsetHorz := FOffsetHorz + (Bitmap.Width * (FScaleX - Value)) / 2;
    end;
    InvalidateCache;
    FScaleX := Value;
    FScaleY := Value;
    DoScaleChange;
    Changed;
  end;
end;

procedure TCnsCustomImage32.SetScaleX(Value: Single);
begin
  if Value < 0.001 then
    Value := 0.001;
  if Value <> FScaleX then
  begin
    InvalidateCache;
    FScaleX := Value;
    DoScaleChange;
    Changed;
  end;
end;

procedure TCnsCustomImage32.SetScaleY(Value: Single);
begin
  if Value < 0.001 then
    Value := 0.001;
  if Value <> FScaleY then
  begin
    InvalidateCache;
    FScaleY := Value;
    DoScaleChange;
    Changed;
  end;
end;

procedure TCnsCustomImage32.SetScaleMode(Value: TScaleMode);
begin
  if Value <> FScaleMode then
  begin
    InvalidateCache;
    FScaleMode := Value;
    Changed;
  end;
end;

procedure TCnsCustomImage32.SetupBitmap(DoClear: Boolean = False; ClearColor: TColor32 =
  $FF000000);
begin
  FBitmap.BeginUpdate;
  with GetViewPortRect do
    FBitmap.SetSize(Right - Left, Bottom - Top);
  if DoClear then
    FBitmap.Clear(ClearColor);
  FBitmap.EndUpdate;
  InvalidateCache;
  Changed;
end;

procedure TCnsCustomImage32.UpdateCache;
begin
  if CacheValid then
    Exit;
  CachedBitmapRect := GetBitmapRect;
  with CachedBitmapRect, CachedXForm do
  begin
    if Bitmap.Empty then
      CachedXForm := UnitXForm
    else
    begin
      ShiftX := Left;
      ShiftY := Top;
      ScaleX := MulDiv(Right - Left, $10000, Bitmap.Width);
      ScaleY := MulDiv(Bottom - Top, $10000, Bitmap.Height);
      RevScaleX := MulDiv(Bitmap.Width, $10000, Right - Left);
      RevScaleY := MulDiv(Bitmap.Height, $10000, Bottom - Top);
    end;
  end;
  CacheValid := True;
end;

procedure TCnsCustomImage32.SetSelected(Value: Boolean);
begin
  if FSelected <> Value then
  begin
    FSelected := Value;
    Invalidate;
  end;
end;

procedure TCnsCustomImage32.SetWhiteGrid(const Value: Boolean);
begin
  FWhiteGrid := Value;
end;

procedure TCnsCustomImage32.SetBitmapModify(const Value: Boolean);
begin
  FBitmapModify := Value;
end;

{ TCnsBitmap32Item }

procedure TCnsBitmap32Item.AssignTo(Dest: TPersistent);
begin
  if Dest is TCnsBitmap32Item then
    TCnsBitmap32Item(Dest).Bitmap.Assign(Bitmap)
  else
    inherited;
end;

constructor TCnsBitmap32Item.Create(Collection: TCollection);
begin
  inherited;
  FBitmap := TCnsBitmap32.Create;
  FInstanceUID := '';
end;

destructor TCnsBitmap32Item.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

procedure TCnsBitmap32Item.SetBitmap(ABitmap: TCnsBitmap32);
begin
  FBitmap.Assign(ABitmap)
end;

{ TCnsBitmap32Collection }

function TCnsBitmap32Collection.Add: TCnsBitmap32Item;
begin
  Result := TCnsBitmap32Item(inherited Add);
end;

constructor TCnsBitmap32Collection.Create(AOwner: TPersistent; ItemClass: TBitmap32ItemClass);
begin
  inherited Create(ItemClass);
  FOwner := AOwner;
end;

function TCnsBitmap32Collection.GetItem(Index: Integer): TCnsBitmap32Item;
begin
  Result := TCnsBitmap32Item(inherited GetItem(Index));
end;

function TCnsBitmap32Collection.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TCnsBitmap32Collection.SetItem(Index: Integer; Value: TCnsBitmap32Item);
begin
  inherited SetItem(Index, Value);
end;

{ TBitmap32List }

constructor TCnsBitmap32List.Create(AOwner: TComponent);
begin
  inherited;
  FBitmap32Collection := TCnsBitmap32Collection.Create(Self, TCnsBitmap32Item);
end;

destructor TCnsBitmap32List.Destroy;
begin
  FBitmap32Collection.Free;
  inherited;
end;

function TCnsBitmap32List.GetBitmap(Index: Integer): TCnsBitmap32;
begin
  Result := FBitmap32Collection.Items[Index].Bitmap;
end;

procedure TCnsBitmap32List.SetBitmap(Index: Integer; Value: TCnsBitmap32);
begin
  FBitmap32Collection.Items[Index].Bitmap := Value;
end;

procedure TCnsBitmap32List.SetBitmap32Collection(Value: TCnsBitmap32Collection);
begin
  FBitmap32Collection := Value;
end;

procedure InflateArea(var Area: TRect; Dx, Dy: Integer);
begin
  if Area.Left > Area.Right then
    Dx := -Dx;

  if Area.Top > Area.Bottom then
    Dy := -Dy;

  Dec(Area.Left, Dx);
  Dec(Area.Top, Dy);
  Inc(Area.Right, Dx);
  Inc(Area.Bottom, Dy);
end;

{ mouse state mapping }

type
  TImage32Access = class(TCnsCustomImage32);

var
  MicroTilesU: procedure(var DstTiles: TMicroTiles; const SrcTiles: TMicroTiles);

  { MicroTile auxiliary routines }

function MakeMicroTile(const Left, Top, Right, Bottom: Integer): TMicroTile;
begin
  Result := Left shl 24 or Top shl 16 or Right shl 8 or Bottom;
end;

function MicroTileHeight(const Tile: TMicroTile): Integer;
begin
  Result := (Tile and $FF) - (Tile shr 16 and $FF);
end;

function MicroTileWidth(const Tile: TMicroTile): Integer;
begin
  Result := (Tile shr 8 and $FF) - (Tile shr 24);
end;

procedure _MicroTileUnion(var DstTile: TMicroTile; const SrcTile: TMicroTile);
var
  SrcLeft, SrcTop, SrcRight, SrcBottom: Integer;
begin
  SrcLeft := SrcTile shr 24;
  SrcTop := (SrcTile and $FF0000) shr 16;
  SrcRight := (SrcTile and $FF00) shr 8;
  SrcBottom := SrcTile and $FF;

  if (DstTile <> MICROTILE_FULL) and (SrcTile <> MICROTILE_EMPTY) and
    (SrcRight - SrcLeft <> 0) and (SrcBottom - SrcTop <> 0) then
  begin
    if (DstTile = MICROTILE_EMPTY) or (SrcTile = MICROTILE_FULL) then
      DstTile := SrcTile
    else
    begin
      DstTile := Min(DstTile shr 24, SrcLeft) shl 24 or
        Min(DstTile shr 16 and $FF, SrcTop) shl 16 or
        Max(DstTile shr 8 and $FF, SrcRight) shl 8 or
        Max(DstTile and $FF, SrcBottom);
    end;
  end;
end;

procedure M_MicroTileUnion(var DstTile: TMicroTile; const SrcTile: TMicroTile);
var
  SrcLeft, SrcTop, SrcRight, SrcBottom: Integer;
begin
  SrcLeft := SrcTile shr 24;
  SrcTop := (SrcTile and $FF0000) shr 16;
  SrcRight := (SrcTile and $FF00) shr 8;
  SrcBottom := SrcTile and $FF;

  if (DstTile <> MICROTILE_FULL) and (SrcTile <> MICROTILE_EMPTY) and
    (SrcRight - SrcLeft <> 0) and (SrcBottom - SrcTop <> 0) then
  begin
    if (DstTile = MICROTILE_EMPTY) or (SrcTile = MICROTILE_FULL) then
      DstTile := SrcTile
    else
      asm
      {$IFDEF COMPILER6}
      MOVD   MM1,[SrcTile]
      {$ELSE}
      MOV    EAX,[SrcTile]
      db $0F,$6E,$C8           /// MOVD   MM1,EAX
      {$ENDIF}

      MOV    EAX,[DstTile]
      db $0F,$6E,$10           /// MOVD   MM2, [EAX]

      db $0F,$6F,$D9           /// MOVQ   MM3, MM1

      MOV    ECX,$FFFF0000   // Mask
      db $0F,$6E,$C1           /// MOVD   MM0, ECX
      db $0F,$DA,$CA           /// PMINUB MM1, MM2
      db $0F,$DB,$C8           /// PAND   MM1, MM0

      db $0F,$72,$D0,$10       /// PSRLD  MM0, 16         // shift mask right by 16 bits
      db $0F,$DE,$D3           /// PMAXUB MM2, MM3
      db $0F,$DB,$D0           /// PAND   MM2, MM0

      db $0F,$EB,$CA           /// POR    MM1, MM2

      db $0F,$7E,$08           /// MOVD   [EAX], MM1

      db $0F,$77               /// EMMS
      end;
  end;
end;

{ MicroTiles auxiliary routines }

function MakeEmptyMicroTiles: TMicroTiles;
begin
  FillChar(Result, SizeOf(TMicroTiles), 0);
  ReallocMem(Result.Tiles, 0);
end;

procedure MicroTilesCreate(var MicroTiles: TMicroTiles);
begin
  FillChar(MicroTiles, SizeOf(TMicroTiles), 0);
  ReallocMem(MicroTiles.Tiles, 0);
end;

procedure MicroTilesDestroy(var MicroTiles: TMicroTiles);
begin
  ReallocMem(MicroTiles.Tiles, 0);
end;

procedure MicroTilesSetSize(var MicroTiles: TMicroTiles; const DstRect: TRect);
begin
  MicroTiles.BoundsRect := DstRect;
  MicroTiles.Columns := ((DstRect.Right - DstRect.Left) shr MICROTILE_SHIFT) + 1;
  MicroTiles.Rows := ((DstRect.Bottom - DstRect.Top) shr MICROTILE_SHIFT) + 1;

  MicroTiles.Count := (MicroTiles.Columns + 1) * (MicroTiles.Rows + 1);
  ReallocMem(MicroTiles.Tiles, MicroTiles.Count * SizeOf(TMicroTile));

  MicroTilesClear(MicroTiles)
end;

procedure MicroTilesClear(var MicroTiles: TMicroTiles; const Value: TMicroTile);
begin
  MicroTiles.BoundsUsedTiles := MakeRect(MicroTiles.Columns, MicroTiles.Rows, 0, 0);
  FillLongword(MicroTiles.Tiles^[0], MicroTiles.Count, Value);
end;

procedure MicroTilesClearUsed(var MicroTiles: TMicroTiles; const Value: TMicroTile);
var
  I: Integer;
begin
  for I := MicroTiles.BoundsUsedTiles.Top to MicroTiles.BoundsUsedTiles.Bottom do
    FillLongword(MicroTiles.Tiles^[I * MicroTiles.Columns + MicroTiles.BoundsUsedTiles.Left],
      MicroTiles.BoundsUsedTiles.Right - MicroTiles.BoundsUsedTiles.Left + 1, Value);

  MicroTiles.BoundsUsedTiles := MakeRect(MicroTiles.Columns, MicroTiles.Rows, 0, 0);
end;

procedure MicroTilesCopy(var DstTiles: TMicroTiles; SrcTiles: TMicroTiles);
var
  CurRow, Width: Integer;
  SrcTilePtr, DstTilePtr: PMicroTile;
begin
  if Assigned(DstTiles.Tiles) and (DstTiles.Count > 0) then
    MicroTilesClearUsed(DstTiles);

  DstTiles.BoundsRect := SrcTiles.BoundsRect;
  DstTiles.Columns := SrcTiles.Columns;
  DstTiles.Rows := SrcTiles.Rows;
  DstTiles.BoundsUsedTiles := SrcTiles.BoundsUsedTiles;

  ReallocMem(DstTiles.Tiles, SrcTiles.Count * SizeOf(TMicroTile));

  if DstTiles.Count < SrcTiles.Count then
    FillLongword(DstTiles.Tiles^[DstTiles.Count], SrcTiles.Count - DstTiles.Count,
      MICROTILE_EMPTY);

  DstTiles.Count := SrcTiles.Count;

  SrcTilePtr := @SrcTiles.Tiles^[SrcTiles.BoundsUsedTiles.Top * SrcTiles.Columns +
    SrcTiles.BoundsUsedTiles.Left];
  DstTilePtr := @DstTiles.Tiles^[SrcTiles.BoundsUsedTiles.Top * DstTiles.Columns +
    SrcTiles.BoundsUsedTiles.Left];
  Width := SrcTiles.BoundsUsedTiles.Right - SrcTiles.BoundsUsedTiles.Left + 1;

  for CurRow := SrcTiles.BoundsUsedTiles.Top to SrcTiles.BoundsUsedTiles.Bottom do
  begin
    MoveLongword(SrcTilePtr^, DstTilePtr^, Width);
    Inc(DstTilePtr, DstTiles.Columns);
    Inc(SrcTilePtr, SrcTiles.Columns);
  end
end;

procedure MicroTilesAddLine(var MicroTiles: TMicroTiles; X1, Y1, X2, Y2: Integer; LineWidth:
  Integer; RoundToWholeTiles: Boolean = False);
var
  I: Integer;
  Dx, Dy: Integer;
  Sx, Sy: Integer;
  DeltaX, DeltaY: Integer;
  Rects: Integer;
  NewX, NewY: Integer;
  TempRect: TRect;
  Swapped: Boolean;
begin
  Dx := X2 - X1;
  Dy := Y2 - Y1;

  LineWidth := LineWidth shl 1;

  if Dx > 0 then
    Sx := 1
  else
    if Dx < 0 then
  begin
    Dx := -Dx;
    Sx := -1;
  end
  else // Dx = 0
  begin
    TempRect := MakeRect(X1, Y1, X2, Y2);
    InflateArea(TempRect, LineWidth, LineWidth);
    MicroTilesAddRect(MicroTiles, TempRect, RoundToWholeTiles);
    Exit;
  end;

  if Dy > 0 then
    Sy := 1
  else
    if Dy < 0 then
  begin
    Dy := -Dy;
    Sy := -1;
  end
  else // Dy = 0
  begin
    TempRect := MakeRect(X1, Y1, X2, Y2);
    InflateArea(TempRect, LineWidth, LineWidth);
    MicroTilesAddRect(MicroTiles, TempRect, RoundToWholeTiles);
    Exit;
  end;

  X1 := X1 * FixedOne;
  Y1 := Y1 * FixedOne;

  Dx := Dx * FixedOne;
  Dy := Dy * FixedOne;

  if Dx < Dy then
  begin
    Swapped := True;
    Swap(Dx, Dy);
  end
  else
    Swapped := False;

  Rects := Dx div MICROTILE_SIZE;

  DeltaX := MICROTILE_SIZE * FixedOne;
  DeltaY := FixedDiv(Dy, Rects);

  if Swapped then
    Swap(DeltaX, DeltaY);

  DeltaX := Sx * DeltaX;
  DeltaY := Sy * DeltaY;

  for I := 1 to FixedCeil(Rects) do
  begin
    NewX := X1 + DeltaX;
    NewY := Y1 + DeltaY;

    TempRect := MakeRect(FixedRect(X1, Y1, NewX, NewY));
    InflateArea(TempRect, LineWidth, LineWidth);
    MicroTilesAddRect(MicroTiles, TempRect, RoundToWholeTiles);

    X1 := NewX;
    Y1 := NewY;
  end;
end;

procedure MicroTilesAddRect(var MicroTiles: TMicroTiles; Rect: TRect; RoundToWholeTiles: Boolean);
var
  ModLeft, ModRight, ModTop, ModBottom, Temp: Integer;
  LeftTile, TopTile, RightTile, BottomTile, ColSpread, RowSpread: Integer;
  CurRow, CurCol: Integer;
  TilePtr, TilePtr2: PMicroTile;
begin
  if MicroTiles.Count = 0 then
    Exit;

  with Rect do
  begin
    TestSwap(Left, Right);
    TestSwap(Top, Bottom);

    if Left < 0 then
      Left := 0;
    if Top < 0 then
      Top := 0;
    Temp := MicroTiles.Columns shl MICROTILE_SHIFT;
    if Right > Temp then
      Right := Temp;
    Temp := MicroTiles.Rows shl MICROTILE_SHIFT;
    if Bottom > Temp then
      Bottom := Temp;

    if (Left > Right) or (Top > Bottom) then
      Exit;
  end;

  LeftTile := Rect.Left shr MICROTILE_SHIFT;
  TopTile := Rect.Top shr MICROTILE_SHIFT;
  RightTile := Rect.Right shr MICROTILE_SHIFT;
  BottomTile := Rect.Bottom shr MICROTILE_SHIFT;

  TilePtr := @MicroTiles.Tiles^[TopTile * MicroTiles.Columns + LeftTile];

  if RoundToWholeTiles then
  begin
    for CurRow := TopTile to BottomTile do
    begin
      FillLongword(TilePtr^, RightTile - LeftTile + 1, MICROTILE_FULL);
      Inc(TilePtr, MicroTiles.Columns);
    end;
  end
  else
  begin
    // calculate number of tiles needed in columns and rows
    ColSpread := ((Rect.Right + MICROTILE_SIZE) shr MICROTILE_SHIFT) -
      (Rect.Left shr MICROTILE_SHIFT);
    RowSpread := ((Rect.Bottom + MICROTILE_SIZE) shr MICROTILE_SHIFT) -
      (Rect.Top shr MICROTILE_SHIFT);

    ModLeft := Rect.Left mod MICROTILE_SIZE;
    ModTop := Rect.Top mod MICROTILE_SIZE;
    ModRight := Rect.Right mod MICROTILE_SIZE;
    ModBottom := Rect.Bottom mod MICROTILE_SIZE;

    if (ColSpread = 1) and (RowSpread = 1) then
      MicroTileUnion(TilePtr^, MakeMicroTile(ModLeft, ModTop, ModRight, ModBottom))
    else
      if ColSpread = 1 then
    begin
      MicroTileUnion(TilePtr^, MakeMicroTile(ModLeft, ModTop, ModRight, MICROTILE_SIZE));
      Inc(TilePtr, MicroTiles.Columns);

      if RowSpread > 2 then
        for CurCol := TopTile + 1 to BottomTile - 1 do
        begin
          MicroTileUnion(TilePtr^, MakeMicroTile(ModLeft, 0, ModRight, MICROTILE_SIZE));
          Inc(TilePtr, MicroTiles.Columns);
        end;

      MicroTileUnion(TilePtr^, MakeMicroTile(ModLeft, 0, ModRight, ModBottom));
    end
    else
      if RowSpread = 1 then
    begin
      MicroTileUnion(TilePtr^, MakeMicroTile(ModLeft, ModTop, MICROTILE_SIZE, ModBottom));
      Inc(TilePtr);

      if ColSpread > 2 then
        for CurRow := LeftTile + 1 to RightTile - 1 do
        begin
          MicroTileUnion(TilePtr^, MakeMicroTile(0, ModTop, MICROTILE_SIZE, ModBottom));
          Inc(TilePtr);
        end;

      MicroTileUnion(TilePtr^, MakeMicroTile(0, ModTop, ModRight, ModBottom));
    end
    else
    begin
      TilePtr2 := TilePtr;

      // TOP:
      // render top-left corner
      MicroTileUnion(TilePtr2^, MakeMicroTile(ModLeft, ModTop, MICROTILE_SIZE, MICROTILE_SIZE));
      Inc(TilePtr2);

      // render top edge
      if ColSpread > 2 then
        for CurRow := LeftTile + 1 to RightTile - 1 do
        begin
          MicroTileUnion(TilePtr2^, MakeMicroTile(0, ModTop, MICROTILE_SIZE, MICROTILE_SIZE));
          Inc(TilePtr2);
        end;

      // render top-right corner
      MicroTileUnion(TilePtr2^, MakeMicroTile(0, ModTop, ModRight, MICROTILE_SIZE));

      Inc(TilePtr, MicroTiles.Columns);

      // INTERMEDIATE AREA:
      if RowSpread > 2 then
        for CurCol := TopTile + 1 to BottomTile - 1 do
        begin
          TilePtr2 := TilePtr;

          // render left edge
          MicroTileUnion(TilePtr2^, MakeMicroTile(ModLeft, 0, MICROTILE_SIZE, MICROTILE_SIZE));
          Inc(TilePtr2);

          // render content
          if ColSpread > 2 then
          begin
            FillLongword(TilePtr2^, RightTile - LeftTile - 1, MICROTILE_FULL);
            Inc(TilePtr2, RightTile - LeftTile - 1);
          end;

          // render right edge
          MicroTileUnion(TilePtr2^, MakeMicroTile(0, 0, ModRight, MICROTILE_SIZE));

          Inc(TilePtr, MicroTiles.Columns);
        end;

      TilePtr2 := TilePtr;

      // BOTTOM:
      // render bottom-left corner
      MicroTileUnion(TilePtr2^, MakeMicroTile(ModLeft, 0, MICROTILE_SIZE, ModBottom));
      Inc(TilePtr2);

      // render bottom edge
      if ColSpread > 2 then
        for CurRow := LeftTile + 1 to RightTile - 1 do
        begin
          MicroTileUnion(TilePtr2^, MakeMicroTile(0, 0, MICROTILE_SIZE, ModBottom));
          Inc(TilePtr2);
        end;

      // render bottom-right corner
      MicroTileUnion(TilePtr2^, MakeMicroTile(0, 0, ModRight, ModBottom));
    end;
  end;

  with MicroTiles.BoundsUsedTiles do
  begin
    if LeftTile < Left then
      Left := LeftTile;
    if TopTile < Top then
      Top := TopTile;
    if RightTile > Right then
      Right := RightTile;
    if BottomTile > Bottom then
      Bottom := BottomTile;
  end;
end;

procedure _MicroTilesUnion(var DstTiles: TMicroTiles; const SrcTiles: TMicroTiles);
var
  SrcTilePtr, DstTilePtr: PMicroTile;
  SrcTilePtr2, DstTilePtr2: PMicroTile;
  X, Y: Integer;
  SrcLeft, SrcTop, SrcRight, SrcBottom: Integer;
  SrcTile: TMicroTile;
begin
  SrcTilePtr := @SrcTiles.Tiles^[SrcTiles.BoundsUsedTiles.Top * SrcTiles.Columns +
    SrcTiles.BoundsUsedTiles.Left];
  DstTilePtr := @DstTiles.Tiles^[SrcTiles.BoundsUsedTiles.Top * DstTiles.Columns +
    SrcTiles.BoundsUsedTiles.Left];

  for Y := SrcTiles.BoundsUsedTiles.Top to SrcTiles.BoundsUsedTiles.Bottom do
  begin
    SrcTilePtr2 := SrcTilePtr;
    DstTilePtr2 := DstTilePtr;
    for X := SrcTiles.BoundsUsedTiles.Left to SrcTiles.BoundsUsedTiles.Right do
    begin
      SrcTile := SrcTilePtr2^;
      SrcLeft := SrcTile shr 24;
      SrcTop := (SrcTile and $FF0000) shr 16;
      SrcRight := (SrcTile and $FF00) shr 8;
      SrcBottom := SrcTile and $FF;

      if (DstTilePtr2^ <> MICROTILE_FULL) and (SrcTilePtr2^ <> MICROTILE_EMPTY) and
        (SrcRight - SrcLeft <> 0) and (SrcBottom - SrcTop <> 0) then
      begin
        if (DstTilePtr2^ = MICROTILE_EMPTY) or (SrcTilePtr2^ = MICROTILE_FULL) then
          DstTilePtr2^ := SrcTilePtr2^
        else
          DstTilePtr2^ := Min(DstTilePtr2^ shr 24, SrcLeft) shl 24 or
            Min(DstTilePtr2^ shr 16 and $FF, SrcTop) shl 16 or
            Max(DstTilePtr2^ shr 8 and $FF, SrcRight) shl 8 or
            Max(DstTilePtr2^ and $FF, SrcBottom);
      end;

      Inc(DstTilePtr2);
      Inc(SrcTilePtr2);
    end;
    Inc(DstTilePtr, DstTiles.Columns);
    Inc(SrcTilePtr, SrcTiles.Columns);
  end;
end;

procedure M_MicroTilesUnion(var DstTiles: TMicroTiles; const SrcTiles: TMicroTiles);
var
  SrcTilePtr, DstTilePtr: PMicroTile;
  SrcTilePtr2, DstTilePtr2: PMicroTile;
  X, Y: Integer;
  SrcLeft, SrcTop, SrcRight, SrcBottom: Integer;
begin
  SrcTilePtr := @SrcTiles.Tiles^[SrcTiles.BoundsUsedTiles.Top * SrcTiles.Columns +
    SrcTiles.BoundsUsedTiles.Left];
  DstTilePtr := @DstTiles.Tiles^[SrcTiles.BoundsUsedTiles.Top * DstTiles.Columns +
    SrcTiles.BoundsUsedTiles.Left];

  asm
    MOV    ECX, $FFFF  // Mask
    db $0F,$6E,$C1           /// MOVD   MM0, ECX
    db $0F,$6F,$E0           /// MOVQ   MM4, MM0
    db $0F,$72,$F4,$10       /// PSLLD  MM4, 16     // shift mask left by 16 bits
  end;

  for Y := SrcTiles.BoundsUsedTiles.Top to SrcTiles.BoundsUsedTiles.Bottom do
  begin
    SrcTilePtr2 := SrcTilePtr;
    DstTilePtr2 := DstTilePtr;
    for X := SrcTiles.BoundsUsedTiles.Left to SrcTiles.BoundsUsedTiles.Right do
    begin
      SrcLeft := SrcTilePtr2^ shr 24;
      SrcTop := (SrcTilePtr2^ and $FF0000) shr 16;
      SrcRight := (SrcTilePtr2^ and $FF00) shr 8;
      SrcBottom := SrcTilePtr2^ and $FF;

      if (DstTilePtr2^ <> MICROTILE_FULL) and (SrcTilePtr2^ <> MICROTILE_EMPTY) and
        (SrcRight - SrcLeft <> 0) and (SrcBottom - SrcTop <> 0) then
      begin
        if (DstTilePtr2^ = MICROTILE_EMPTY) or (SrcTilePtr2^ = MICROTILE_FULL) then
          DstTilePtr2^ := SrcTilePtr2^
        else
          asm
          MOV    EAX, [DstTilePtr2]
          db $0F,$6E,$10           /// MOVD   MM2, [EAX]

          MOV    ECX, [SrcTilePtr2]
          db $0F,$6E,$09           /// MOVD   MM1, [ECX]
          db $0F,$6F,$D9           /// MOVQ   MM3, MM1

          db $0F,$DA,$CA           /// PMINUB MM1, MM2
          db $0F,$DB,$CC           /// PAND   MM1, MM4

          db $0F,$DE,$D3           /// PMAXUB MM2, MM3
          db $0F,$DB,$D0           /// PAND   MM2, MM0

          db $0F,$EB,$CA           /// POR    MM1, MM2

          db $0F,$7E,$08           /// MOVD   [EAX], MM1
          end;
      end;

      Inc(DstTilePtr2);
      Inc(SrcTilePtr2);
    end;
    Inc(DstTilePtr, DstTiles.Columns);
    Inc(SrcTilePtr, SrcTiles.Columns);
  end;

  asm
    db $0F,$77               /// EMMS
  end;
end;

procedure MicroTilesUnion(var DstTiles: TMicroTiles; const SrcTiles: TMicroTiles;
  RoundToWholeTiles: Boolean);
var
  SrcTilePtr, DstTilePtr: PMicroTile;
  SrcTilePtr2, DstTilePtr2: PMicroTile;
  X, Y: Integer;
  SrcLeft, SrcTop, SrcRight, SrcBottom: Integer;
begin
  if SrcTiles.Count = 0 then
    Exit;

  if RoundToWholeTiles then
  begin
    SrcTilePtr := @SrcTiles.Tiles^[SrcTiles.BoundsUsedTiles.Top * SrcTiles.Columns +
      SrcTiles.BoundsUsedTiles.Left];
    DstTilePtr := @DstTiles.Tiles^[SrcTiles.BoundsUsedTiles.Top * DstTiles.Columns +
      SrcTiles.BoundsUsedTiles.Left];

    for Y := SrcTiles.BoundsUsedTiles.Top to SrcTiles.BoundsUsedTiles.Bottom do
    begin
      SrcTilePtr2 := SrcTilePtr;
      DstTilePtr2 := DstTilePtr;
      for X := SrcTiles.BoundsUsedTiles.Left to SrcTiles.BoundsUsedTiles.Right do
      begin
        SrcLeft := SrcTilePtr2^ shr 24;
        SrcTop := (SrcTilePtr2^ and $FF0000) shr 16;
        SrcRight := (SrcTilePtr2^ and $FF00) shr 8;
        SrcBottom := SrcTilePtr2^ and $FF;

        if (DstTilePtr2^ <> MICROTILE_FULL) and (SrcTilePtr2^ <> MICROTILE_EMPTY) and
          (SrcRight - SrcLeft <> 0) and (SrcBottom - SrcTop <> 0) then
          DstTilePtr2^ := MICROTILE_FULL;

        Inc(DstTilePtr2);
        Inc(SrcTilePtr2);
      end;
      Inc(DstTilePtr, DstTiles.Columns);
      Inc(SrcTilePtr, SrcTiles.Columns);
    end
  end
  else
    MicroTilesU(DstTiles, SrcTiles);

  with DstTiles.BoundsUsedTiles do
  begin
    if SrcTiles.BoundsUsedTiles.Left < Left then
      Left := SrcTiles.BoundsUsedTiles.Left;
    if SrcTiles.BoundsUsedTiles.Top < Top then
      Top := SrcTiles.BoundsUsedTiles.Top;
    if SrcTiles.BoundsUsedTiles.Right > Right then
      Right := SrcTiles.BoundsUsedTiles.Right;
    if SrcTiles.BoundsUsedTiles.Bottom > Bottom then
      Bottom := SrcTiles.BoundsUsedTiles.Bottom;
  end;
end;

function MicroTilesCalcRects(const MicroTiles: TMicroTiles; DstRects: TRectList;
  CountOnly, RoundToWholeTiles: Boolean): Integer;
begin
  Result := MicroTilesCalcRects(MicroTiles, DstRects, MicroTiles.BoundsRect, CountOnly);
end;

function MicroTilesCalcRects(const MicroTiles: TMicroTiles; DstRects: TRectList;
  const Clip: TRect; CountOnly, RoundToWholeTiles: Boolean): Integer;
var
  Rects: array of TRect;
  Rect: PRect;
  CombLUT: array of Integer;
  StartIndex: Integer;
  CurTile, TempTile: TMicroTile;
  Temp: Integer;
  NewLeft, NewTop, NewRight, NewBottom: Integer;
  CurCol, CurRow, I, RectsCount: Integer;
begin
  Result := 0;

  if (MicroTiles.Count = 0) or
    (MicroTiles.BoundsUsedTiles.Right - MicroTiles.BoundsUsedTiles.Left < 0) or
    (MicroTiles.BoundsUsedTiles.Bottom - MicroTiles.BoundsUsedTiles.Top < 0) then
    Exit;

  SetLength(Rects, MicroTiles.Columns * MicroTiles.Rows);
  SetLength(CombLUT, MicroTiles.Columns * MicroTiles.Rows);
  FillLongword(CombLUT[0], Length(CombLUT), Cardinal(-1));

  I := 0;
  RectsCount := 0;

  if not RoundToWholeTiles then
    for CurRow := 0 to MicroTiles.Rows - 1 do
    begin
      CurCol := 0;
      while CurCol < MicroTiles.Columns do
      begin
        CurTile := MicroTiles.Tiles[I];

        if CurTile <> MICROTILE_EMPTY then
        begin
          Temp := CurRow shl MICROTILE_SHIFT;
          NewTop := Constrain(Temp + CurTile shr 16 and $FF, Clip.Top, Clip.Bottom);
          NewBottom := Constrain(Temp + CurTile and $FF, Clip.Top, Clip.Bottom);
          NewLeft := Constrain(CurCol shl MICROTILE_SHIFT + CurTile shr 24, Clip.Left, Clip.Right);

          StartIndex := I;

          if (CurTile shr 8 and $FF = MICROTILE_SIZE) and (CurCol <> MicroTiles.Columns - 1) then
          begin
            while True do
            begin
              Inc(CurCol);
              Inc(I);

              TempTile := MicroTiles.Tiles[I];
              if (CurCol = MicroTiles.Columns) or
                (TempTile shr 16 and $FF <> CurTile shr 16 and $FF) or
                (TempTile and $FF <> CurTile and $FF) or
                (TempTile shr 24 <> 0) then
              begin
                Dec(CurCol);
                Dec(I);
                Break;
              end;
            end;
          end;

          NewRight := Constrain(CurCol shl MICROTILE_SHIFT + MicroTiles.Tiles[I] shr 8 and $FF,
            Clip.Left, Clip.Right);

          Temp := CombLUT[StartIndex];

          Rect := nil;
          if Temp <> -1 then
            Rect := @Rects[Temp];

          if Assigned(Rect) and
            (Rect.Left = NewLeft) and
            (Rect.Right = NewRight) and
            (Rect.Bottom = NewTop) then
          begin
            Rect.Bottom := NewBottom;

            if CurRow <> MicroTiles.Rows - 1 then
              CombLUT[StartIndex + MicroTiles.Columns] := Temp;
          end
          else
            with Rects[RectsCount] do
            begin
              Left := NewLeft;
              Top := NewTop;
              Right := NewRight;
              Bottom := NewBottom;

              if CurRow <> MicroTiles.Rows - 1 then
                CombLUT[StartIndex + MicroTiles.Columns] := RectsCount;

              Inc(RectsCount);
            end;
        end;

        Inc(I);
        Inc(CurCol);
      end;
    end
  else
    for CurRow := 0 to MicroTiles.Rows - 1 do
    begin
      CurCol := 0;
      while CurCol < MicroTiles.Columns do
      begin
        CurTile := MicroTiles.Tiles[I];

        if CurTile <> MICROTILE_EMPTY then
        begin
          Temp := CurRow shl MICROTILE_SHIFT;
          NewTop := Constrain(Temp, Clip.Top, Clip.Bottom);
          NewBottom := Constrain(Temp + MICROTILE_SIZE, Clip.Top, Clip.Bottom);
          NewLeft := Constrain(CurCol shl MICROTILE_SHIFT, Clip.Left, Clip.Right);

          StartIndex := I;

          if CurCol <> MicroTiles.Columns - 1 then
          begin
            while True do
            begin
              Inc(CurCol);
              Inc(I);

              TempTile := MicroTiles.Tiles[I];
              if (CurCol = MicroTiles.Columns) or (TempTile = MICROTILE_EMPTY) then
              begin
                Dec(CurCol);
                Dec(I);
                Break;
              end;
            end;
          end;

          NewRight := Constrain(CurCol shl MICROTILE_SHIFT + MICROTILE_SIZE, Clip.Left,
            Clip.Right);

          Temp := CombLUT[StartIndex];

          Rect := nil;
          if Temp <> -1 then
            Rect := @Rects[Temp];

          if Assigned(Rect) and
            (Rect.Left = NewLeft) and
            (Rect.Right = NewRight) and
            (Rect.Bottom = NewTop) then
          begin
            Rect.Bottom := NewBottom;

            if CurRow <> MicroTiles.Rows - 1 then
              CombLUT[StartIndex + MicroTiles.Columns] := Temp;
          end
          else
            with Rects[RectsCount] do
            begin
              Left := NewLeft;
              Top := NewTop;
              Right := NewRight;
              Bottom := NewBottom;

              if CurRow <> MicroTiles.Rows - 1 then
                CombLUT[StartIndex + MicroTiles.Columns] := RectsCount;

              Inc(RectsCount);
            end;
        end;

        Inc(I);
        Inc(CurCol);
      end;
    end;

  Result := RectsCount;

  if not CountOnly then
    for I := 0 to RectsCount - 1 do
      DstRects.Add(Rects[I]);
end;

function MicroTilesCountEmptyTiles(const MicroTiles: TMicroTiles): Integer;
var
  CurRow, CurCol: Integer;
  TilePtr: PMicroTile;
begin
  Result := 0;
  if MicroTiles.Count > 0 then
  begin
    TilePtr := @MicroTiles.Tiles^[0];
    for CurRow := 0 to MicroTiles.Rows - 1 do
      for CurCol := 0 to MicroTiles.Columns - 1 do
      begin
        if TilePtr^ = MICROTILE_EMPTY then
          Inc(Result);
        Inc(TilePtr);
      end;
  end;
end;

{$IFDEF MICROTILES_DEBUGDRAW}

procedure MicroTilesDebugDraw(const MicroTiles: TMicroTiles; DstBitmap: TCnsBitmap32;
  DrawOptimized, RoundToWholeTiles: Boolean);
var
  I: Integer;
  TempRect: TRect;
  Rects: TRectList;

  C1, C2: TColor32;
begin
  {$IFDEF MICROTILES_DEBUGDRAW_RANDOM_COLORS}
  C1 := Random(MaxInt) and $00FFFFFF;
  C2 := C1 or $90000000;
  C1 := C1 or $30000000;
  {$ELSE}
  C1 := clDebugDrawFill;
  C2 := clDebugDrawFrame;
  {$ENDIF}

  if DrawOptimized then
  begin
    Rects := TRectList.Create;
    MicroTilesCalcRects(MicroTiles, Rects, False, RoundToWholeTiles);
    try
      if Rects.Count > 0 then
      begin
        for I := 0 to Rects.Count - 1 do
        begin
          DstBitmap.FillRectTS(Rects[I]^, C1);
          DstBitmap.FrameRectTS(Rects[I]^, C2);
        end;
      end
    finally
      Rects.Free;
    end;
  end
  else
    for I := 0 to MicroTiles.Count - 1 do
    begin
      if MicroTiles.Tiles^[i] <> MICROTILE_EMPTY then
      begin
        TempRect.Left := ((I mod MicroTiles.Columns) shl MICROTILE_SHIFT) + (MicroTiles.Tiles[i]
          shr
          24);
        TempRect.Top := ((I div MicroTiles.Columns) shl MICROTILE_SHIFT) + (MicroTiles.Tiles[i] shr
          16 and $FF);
        TempRect.Right := ((I mod MicroTiles.Columns) shl MICROTILE_SHIFT) + (MicroTiles.Tiles[i]
          shr 8 and $FF);
        TempRect.Bottom := ((I div MicroTiles.Columns) shl MICROTILE_SHIFT) + (MicroTiles.Tiles[i]
          and $FF);

        DstBitmap.FillRectTS(TempRect, C1);
        DstBitmap.FrameRectTS(TempRect, C2);
      end;
    end;
end;
{$ENDIF}

{ TMicroTilesMap }

function TMicroTilesMap.Add(Item: Pointer): PPMicroTiles;
var
  TilesPtr: PMicroTiles;
  IsNew: Boolean;
begin
  Result := PPMicroTiles(inherited Add(Item, IsNew));
  if IsNew then
  begin
    New(TilesPtr);
    MicroTilesCreate(TilesPtr^);
    Result^ := TilesPtr;
  end;
end;

function TMicroTilesMap.Delete(BucketIndex, ItemIndex: Integer): Pointer;
var
  TilesPtr: PMicroTiles;
begin
  TilesPtr := inherited Delete(BucketIndex, ItemIndex);
  MicroTilesDestroy(TilesPtr^);
  Dispose(TilesPtr);
  Result := nil;
end;

procedure TMicroTilesMap.SetData(Item: Pointer; const Data: PMicroTiles);
begin
  inherited SetData(Item, Data);
end;

function TMicroTilesMap.GetData(Item: Pointer): PMicroTiles;
begin
  Result := inherited GetData(Item);
end;

{ TMicroTilesRepaintManager }

procedure SetupFunctions1;
begin
  if HasEMMX then
  begin
    MicroTileUnion := M_MicroTileUnion;
    MicroTilesU := M_MicroTilesUnion; // internal
  end
  else
  begin
    MicroTileUnion := _MicroTileUnion;
    MicroTilesU := _MicroTilesUnion; // internal
  end;
end;

{$IFDEF LINUX}

function GetTickCount: Cardinal;
var
  val: timespec;
begin
  clock_gettime(CLOCK_REALTIME, val);
  Result := val.tv_sec * 1000 + val.tv_nsec div 1000000;
end;

{$ELSE}

function GetTickCount: Cardinal;
begin
  Result := Windows.GetTickCount;
end;

{$ENDIF}

constructor TCnsBitmap32ExItem.Create(Collection: TCollection);
begin
  inherited;
  FScale := 1;
  FOffsetHorz := 0;
  FOffsetVert := 0;
  //    FDestRect:TRect;
  FDescription := '';
  FOrderID := 0;
end;

destructor TCnsBitmap32ExItem.Destroy;
begin

  inherited;
end;

procedure TCnsBitmap32ExItem.DrawTo(Dst: TCnsBitmap32; const DstRect: TRect);
var
  Cx, Cy: integer;
  height, Width: integer;
  ScaleX, ScaleY: Single;
begin
  if Bitmap.Empty then
    exit;
  Width := DstRect.Right - DstRect.Left;
  if (FDescription <> '') then
  begin
    height := DstRect.Bottom - DstRect.Top - 20;
    //    Dst.Font.Color := clBlue32;
    //    Dst.Textout(10, DstRect.Top + height + 3, FDescription);
  end
  else
    height := DstRect.Bottom - DstRect.Top;
  //  height := DstRect.Bottom - DstRect.Top;
  FScale := Min(Width / Bitmap.Width, height / Bitmap.Height);
  Cx := Bitmap.Width;
  Cy := Bitmap.Height;
  ScaleX := Width / Cx;
  ScaleY := Height / Cy;
  if ScaleX >= ScaleY then
  begin
    Cx := trunc(Cx * ScaleY);
    Cy := Height;
  end
  else
  begin
    Cx := Width;
    Cy := trunc(Cy * ScaleX);
  end;
  FOffsetHorz := (Width - cx) div 2 + DstRect.Left;
  FOffsetVert := (height - cy) div 2 + DstRect.Top;
  FDestRect := Rect(0, 0, Cx, Cy);
  OffsetRect(FDestRect, trunc(OffsetHorz), trunc(OffsetVert));
  Bitmap.DrawTo(Dst, FDestRect);
  if (FDescription <> '') then
  begin
    Dst.Font.Color := clWhite;
    Dst.Font.Size := 12;
    Dst.Textout(DstRect.Left + 3, DstRect.Bottom - 22, FDescription);
  end;
  if FOrderID > 0 then
  begin
    Dst.Font.Color := clRed;
    Dst.Font.Size := 20;
    Dst.Textout(DstRect.Left, DstRect.Top, IntToStr(FOrderID));
  end;
  if (InstanceUID <> '') then
  begin
    { if d1.Attributes.getInteger($2811, $020D) = 1 then
    begin
    Dst.Font.Size := 9;
    hh := Dest.TextHeight('A');

    str1 := da1.GetString($18, $15);
    ww := Dest.TextWidth(str1);
    Dst.RenderText(r.right - ww, r.Top, str1, 0, clBlue32);

    str1 := da1.GetString($8, $103E);
    ww := Dest.TextWidth(str1);
    Dst.RenderText(r.right - ww, r.Top + hh, str1, 0, clBlue32);
    end}
  end;
end;

const
  OppositeDirection: array[TRBDirection] of TRBDirection = (drRight, drDown, drLeft, drUp);
  tmScrollFirst = 1;
  tmScroll = 2;
  tmHotTrack = 3;

function ClrLighten(C: TColor; Amount: Integer): TColor;
var
  R, G, B: Integer;
begin
  {$IFDEF CLX}
  C := ColorToRGB(C);
  {$ELSE}
  if C < 0 then
    C := GetSysColor(C and $000000FF);
  {$ENDIF}
  R := C and $FF + Amount;
  G := C shr 8 and $FF + Amount;
  B := C shr 16 and $FF + Amount;
  if R < 0 then
    R := 0
  else
    if R > 255 then
    R := 255;
  if G < 0 then
    G := 0
  else
    if G > 255 then
    G := 255;
  if B < 0 then
    B := 0
  else
    if B > 255 then
    B := 255;
  Result := R or (G shl 8) or (B shl 16);
end;

function MixColors(C1, C2: TColor; W1: Integer): TColor;
var
  W2: Cardinal;
begin
  Assert(W1 in [0..255]);
  W2 := W1 xor 255;
  {$IFDEF CLX}
  C1 := ColorToRGB(C1);
  C2 := ColorToRGB(C2);
  {$ELSE}
  if Integer(C1) < 0 then
    C1 := GetSysColor(C1 and $000000FF);
  if Integer(C2) < 0 then
    C2 := GetSysColor(C2 and $000000FF);
  {$ENDIF}
  Result := Integer(
    ((Cardinal(C1) and $FF00FF) * Cardinal(W1) +
    (Cardinal(C2) and $FF00FF) * W2) and $FF00FF00 +
    ((Cardinal(C1) and $00FF00) * Cardinal(W1) +
    (Cardinal(C2) and $00FF00) * W2) and $00FF0000) shr 8;
end;

procedure DitherRect(Canvas: TCanvas; const R: TRect; C1, C2: TColor);
var
  B: TBitmap;
  {$IFNDEF CLX}
  Brush: HBRUSH;
  {$ELSE}
  Brush: TBrush;
  OldBrush: TBrush;
  {$ENDIF}
begin
  if IsRectEmpty(R) then
    Exit;
  {$IFDEF CLX}
  Brush := TBrush.Create;
  if C1 = C2 then
  begin
    Brush.Color := ColorToRGB(C1);
  end
  else
  begin
    B := AllocPatternBitmap(C1, C2);
    Brush.Bitmap := B;
  end;
  OldBrush := TBrush.Create;
  OldBrush.Assign(Canvas.Brush);
  Canvas.Brush.Assign(Brush);
  Canvas.FillRect(R);
  Canvas.Brush.Assign(OldBrush);
  Brush.Free;
  OldBrush.Free;
  {$ELSE}
  if C1 = C2 then
    Brush := CreateSolidBrush(ColorToRGB(C1))
  else
  begin
    B := AllocPatternBitmap(C1, C2);
    B.HandleType := bmDDB;
    Brush := CreatePatternBrush(B.Handle);
  end;
  FillRect(Canvas.Handle, R, Brush);
  DeleteObject(Brush);
  {$ENDIF}
end;

procedure DrawRectEx(Canvas: TCanvas; var R: TRect; Sides: TRBDirections; C: TColor);
begin
  if Sides <> [] then
    with Canvas, R do
    begin
      Pen.Color := C;
      if drUp in Sides then
      begin
        MoveTo(Left, Top);
        LineTo(Right, Top);
        Inc(Top);
      end;
      if drDown in Sides then
      begin
        Dec(Bottom);
        MoveTo(Left, Bottom);
        LineTo(Right, Bottom);
      end;
      if drLeft in Sides then
      begin
        MoveTo(Left, Top);
        LineTo(Left, Bottom);
        Inc(Left);
      end;
      if drRight in Sides then
      begin
        Dec(Right);
        MoveTo(Right, Top);
        LineTo(Right, Bottom);
      end;
    end;
end;

{$IFDEF CLX}

procedure FrameRect(Canvas: TCanvas; const R: TRect);
begin
  with Canvas, R do
    Rectangle(Left, Top, Right, Bottom);
end;
{$ENDIF}

procedure Frame3D(Canvas: TCanvas; var ARect: TRect; TopColor, BottomColor: TColor; AdjustRect:
  Boolean = True);
var
  TopRight, BottomLeft: TPoint;
begin
  with Canvas, ARect do
  begin
    Pen.Width := 1;
    Dec(Bottom);
    Dec(Right);
    TopRight.X := Right;
    TopRight.Y := Top;
    BottomLeft.X := Left;
    BottomLeft.Y := Bottom;
    Pen.Color := TopColor;
    PolyLine([BottomLeft, TopLeft, TopRight]);
    Pen.Color := BottomColor;
    Dec(Left);
    PolyLine([TopRight, BottomRight, BottomLeft]);
    if AdjustRect then
    begin
      Inc(Top);
      Inc(Left, 2);
    end
    else
    begin
      Inc(Left);
      Inc(Bottom);
      Inc(Right);
    end;
  end;
end;

procedure DrawHandle(Canvas: TCanvas; R: TRect; Color: TColor;
  Pushed, ShowGrip, IsHorz: Boolean; ColorBorder: TColor);
var
  CHi, CLo: TColor;
  I, S: Integer;
begin
  CHi := ClrLighten(Color, 24);
  CLo := ClrLighten(Color, -24);

  {$IFDEF CLX}
  Canvas.Pen.Color := ColorBorder; // CLX FrameRect function is using Pen instead of Brush
  FrameRect(Canvas, R);
  {$ELSE}
  Canvas.Brush.Color := ColorBorder;
  FrameRect(Canvas.Handle, R, Canvas.Brush.Handle);
  {$ENDIF}

  InflateRect(R, -1, -1);
  if Pushed then
    Frame3D(Canvas, R, CLo, Color)
  else
    Frame3D(Canvas, R, CHi, MixColors(ColorBorder, Color, 96));
  Canvas.Brush.Color := Color;
  Canvas.FillRect(R);

  if ShowGrip then
  begin
    if Pushed then
      OffsetRect(R, 1, 1);
    if IsHorz then
    begin
      S := R.Right - R.Left;
      R.Left := (R.Left + R.Right) div 2 - 5;
      R.Right := R.Left + 2;
      Inc(R.Top);
      Dec(R.Bottom);

      if S > 10 then
        Frame3D(Canvas, R, CHi, CLo, False);
      Inc(R.Left, 3);
      Inc(R.Right, 3);
      Frame3D(Canvas, R, CHi, CLo, False);
      Inc(R.Left, 3);
      Inc(R.Right, 3);
      Frame3D(Canvas, R, CHi, CLo, False);
      Inc(R.Left, 3);
      Inc(R.Right, 3);
      if S > 10 then
        Frame3D(Canvas, R, CHi, CLo, False);
    end
    else
    begin
      I := (R.Top + R.Bottom) div 2;
      S := R.Bottom - R.Top;
      R.Top := I - 1;
      R.Bottom := I + 1;
      Dec(R.Right);
      Inc(R.Left);

      OffsetRect(R, 0, -4);
      if S > 10 then
      begin
        Frame3D(Canvas, R, CHi, CLo, False);
      end;

      OffsetRect(R, 0, 3);
      Frame3D(Canvas, R, CHi, CLo, False);

      OffsetRect(R, 0, 3);
      Frame3D(Canvas, R, CHi, CLo, False);

      if S > 10 then
      begin
        OffsetRect(R, 0, 3);
        Frame3D(Canvas, R, CHi, CLo, False);
      end;
    end;
  end;
end;

procedure DrawArrow(Canvas: TCanvas; R: TRect; Direction: TRBDirection; Color: TColor);
var
  X, Y, Sz, Shift: Integer;
begin
  X := (R.Left + R.Right - 1) div 2;
  Y := (R.Top + R.Bottom - 1) div 2;
  Sz := (Min(X - R.Left, Y - R.Top)) * 3 div 4 - 1;
  if Sz = 0 then
    Sz := 1;
  if Direction in [drUp, drLeft] then
    Shift := (Sz + 1) * 1 div 3
  else
    Shift := Sz * 1 div 3;
  Canvas.Pen.Color := Color;
  Canvas.Brush.Color := Color;
  case Direction of
    drUp:
      begin
        Inc(Y, Shift);
        Canvas.Polygon([Point(X + Sz, Y), Point(X, Y - Sz), Point(X - Sz, Y)]);
      end;
    drDown:
      begin
        Dec(Y, Shift);
        Canvas.Polygon([Point(X + Sz, Y), Point(X, Y + Sz), Point(X - Sz, Y)]);
      end;
    drLeft:
      begin
        Inc(X, Shift);
        Canvas.Polygon([Point(X, Y + Sz), Point(X - Sz, Y), Point(X, Y - Sz)]);
      end;
    drRight:
      begin
        Dec(X, Shift);
        Canvas.Polygon([Point(X, Y + Sz), Point(X + Sz, Y), Point(X, Y - Sz)]);
      end;
  end;
end;

const
  FIRST_DELAY = 600;
  SCROLL_INTERVAL = 100;
  HOTTRACK_INTERVAL = 150;
  MIN_SIZE = 17;

  { TArrowBar }

  {$IFDEF CLX}

procedure TArrowBar.EnabledChanged;
{$ELSE}

procedure TArrowBar.CMEnabledChanged(var Message: TMessage);
{$ENDIF}
begin
  inherited;
  Invalidate;
end;

{$IFDEF CLX}

procedure TArrowBar.MouseLeave(AControl: TControl);
{$ELSE}

procedure TArrowBar.CMMouseLeave(var Message: TMessage);
{$ENDIF}
begin
  MouseLeft;
end;

constructor TArrowBar.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle - [csAcceptsControls, csDoubleClicks] + [csOpaque];
  Width := 100;
  Height := 16;
  ParentColor := False;
  Color := clScrollBar;
  Timer := TTimer.Create(Self);
  Timer.OnTimer := TimerHandler;
  FShowArrows := True;
  FBorderStyle := bsSingle;
  FHandleColor := clBtnShadow;
  FButtonColor := clBtnFace;
  FHighLightColor := clBtnHighlight;
  FShadowColor := clBtnShadow;
  FBorderColor := clWindowFrame;
  FShowHandleGrip := True;
end;

procedure TArrowBar.DoChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
  if GenChange and Assigned(FOnUserChange) then
    FOnUserChange(Self);
end;

procedure TArrowBar.DoDrawButton(R: TRect; Direction: TRBDirection; Pushed, Enabled, Hot: Boolean);
const
  EnabledFlags: array[Boolean] of Integer = (DFCS_INACTIVE, 0);
  PushedFlags: array[Boolean] of Integer = (0, DFCS_PUSHED or DFCS_FLAT);
  DirectionFlags: array[TRBDirection] of Integer = (DFCS_SCROLLLEFT, DFCS_SCROLLUP,
    DFCS_SCROLLRIGHT, DFCS_SCROLLDOWN);
  {$IFNDEF CLX}
  DirectionXPFlags: array[TRBDirection] of Cardinal = (ABS_LEFTNORMAL, ABS_UPNORMAL,
    ABS_RIGHTNORMAL, ABS_DOWNNORMAL);
  {$ENDIF}
var
  Edges: TRBDirections;
  {$IFNDEF CLX}
  Flags: Integer;
  {$ENDIF}
begin
  if Style = rbsDefault then
  begin
    {$IFDEF CLX}
    Canvas.Brush.Color := clButton;
    Canvas.FillRect(R);
    DrawWinButton(Canvas, R, Pushed);
    InflateRect(R, -2, -2);

    if not DrawEnabled then
    begin
      InflateRect(R, -1, -1);
      OffsetRect(R, 1, 1);
      DrawArrow(Canvas, R, Direction, clWhite);
      OffsetRect(R, -1, -1);
      DrawArrow(Canvas, R, Direction, clDisabledButtonText);
    end
    else
    begin
      if Pushed then
        OffsetRect(R, 1, 1);
      DrawArrow(Canvas, R, Direction, clButtonText);
    end;
    {$ELSE}
    if USE_THEMES then
    begin
      Flags := DirectionXPFlags[Direction];
      if not Enabled then
        Inc(Flags, 3)
      else
        if Pushed then
        Inc(Flags, 2)
      else
        if Hot then
        Inc(Flags);
      DrawThemeBackground(SCROLLBAR_THEME, Canvas.Handle, SBP_ARROWBTN, Flags, R, nil);
    end
    else
      DrawFrameControl(Canvas.Handle, R, DFC_SCROLL,
        DirectionFlags[Direction] or EnabledFlags[DrawEnabled] or PushedFlags[Pushed])
        {$ENDIF}
  end
  else
  begin
    Edges := [drLeft, drUp, drRight, drDown];
    Exclude(Edges, OppositeDirection[Direction]);

    if not DrawEnabled then
    begin
      DrawRectEx(Canvas, R, Edges, fShadowColor);
      Canvas.Brush.Color := fButtonColor;
      {$IFDEF CLX}
      Canvas.FillRect(R);
      {$ELSE}
      FillRect(Canvas.Handle, R, Canvas.Brush.Handle);
      {$ENDIF}
      InflateRect(R, -1, -1);
      OffsetRect(R, 1, 1);
      DrawArrow(Canvas, R, Direction, fHighLightColor);
      OffsetRect(R, -1, -1);
      DrawArrow(Canvas, R, Direction, fShadowColor);
    end
    else
    begin
      DrawRectEx(Canvas, R, Edges, fBorderColor);
      if Pushed then
      begin
        Canvas.Brush.Color := fButtonColor;
        {$IFDEF CLX}
        Canvas.FillRect(R);
        {$ELSE}
        FillRect(Canvas.Handle, R, Canvas.Brush.Handle);
        {$ENDIF}
        OffsetRect(R, 1, 1);
        InflateRect(R, -1, -1);
      end
      else
      begin
        Frame3D(Canvas, R, fHighLightColor, fShadowColor, True);
        Canvas.Brush.Color := fButtonColor;
        {$IFDEF CLX}
        Canvas.FillRect(R);
        {$ELSE}
        FillRect(Canvas.Handle, R, Canvas.Brush.Handle);
        {$ENDIF}
      end;
      DrawArrow(Canvas, R, Direction, fBorderColor);
    end;
  end;
end;

procedure TArrowBar.DoDrawHandle(R: TRect; Horz, Pushed, Hot: Boolean);
{$IFNDEF CLX}
const
  PartXPFlags: array[Boolean] of Cardinal = (SBP_THUMBBTNVERT, SBP_THUMBBTNHORZ);
  GripperFlags: array[Boolean] of Cardinal = (SBP_GRIPPERVERT, SBP_GRIPPERHORZ);
var
  Flags: Cardinal;
  {$ENDIF}
begin
  if IsRectEmpty(R) then
    Exit;
  case Style of
    rbsDefault:
      {$IFNDEF CLX}
      if USE_THEMES then
      begin
        Flags := SCRBS_NORMAL;
        if not Enabled then
          Inc(Flags, 3)
        else
          if Pushed then
          Inc(Flags, 2)
        else
          if Hot then
          Inc(Flags);
        DrawThemeBackground(SCROLLBAR_THEME, Canvas.Handle, PartXPFlags[Horz], Flags, R, nil);
        if ShowHandleGrip then
          DrawThemeBackground(SCROLLBAR_THEME, Canvas.Handle, GripperFlags[Horz], 0, R, nil);
      end
      else
        DrawEdge(Canvas.Handle, R, EDGE_RAISED, BF_RECT or BF_MIDDLE);
    {$ELSE}
      begin
        Canvas.Brush.Color := clButton;
        Canvas.FillRect(R);
        DrawWinButton(Canvas, R, False);
      end;
    {$ENDIF}
    rbsMac:
      DrawHandle(Canvas, R, HandleColor, Pushed, ShowHandleGrip, Horz, fBorderColor);
  end;
end;

procedure TArrowBar.DoDrawTrack(R: TRect; Direction: TRBDirection; Pushed, Enabled, Hot: Boolean);
{$IFNDEF CLX}
const
  PartXPFlags: array[TRBDirection] of Cardinal =
  (SBP_LOWERTRACKHORZ, SBP_LOWERTRACKVERT, SBP_UPPERTRACKHORZ, SBP_UPPERTRACKVERT);
  {$ENDIF}
var
  {$IFNDEF CLX}
  Flags: Cardinal;
  {$ENDIF}
  C: TColor;
  Edges: set of TRBDirection;
begin
  if (R.Right <= R.Left) or (R.Bottom <= R.Top) then
    Exit;
  if Style = rbsDefault then
  begin
    {$IFNDEF CLX}
    if USE_THEMES then
    begin
      Flags := SCRBS_NORMAL;
      if Pushed then
        Inc(Flags, 2);
      DrawThemeBackground(SCROLLBAR_THEME, Canvas.Handle, PartXPFlags[Direction], Flags, R, nil);
    end
    else
      {$ENDIF}
    begin
      if Pushed then
        DitherRect(Canvas, R, clWindowFrame, clWindowFrame)
      else
        DitherRect(Canvas, R, clBtnHighlight, Color);
    end;
  end
  else
    with Canvas, R do
    begin
      if DrawEnabled then
        C := FBorderColor
      else
        C := FShadowColor;
      Edges := [drLeft, drUp, drRight, drDown];
      Exclude(Edges, OppositeDirection[Direction]);
      DrawRectEx(Canvas, R, Edges, C);
      if Pushed then
        DitherRect(Canvas, R, fBorderColor, fBorderColor)
      else
        if not IsRectEmpty(R) then
        with R do
        begin
          if DrawEnabled then
          begin
            Pen.Color := MixColors(fBorderColor, MixColors(fHighLightColor, Color, 127), 32);
            case Direction of
              drLeft, drUp:
                begin
                  MoveTo(Left, Bottom - 1);
                  LineTo(Left, Top);
                  LineTo(Right, Top);
                  Inc(Top);
                  Inc(Left);
                end;
              drRight:
                begin
                  MoveTo(Left, Top);
                  LineTo(Right, Top);
                  Inc(Top);
                end;
              drDown:
                begin
                  MoveTo(Left, Top);
                  LineTo(Left, Bottom);
                  Inc(Left);
                end;
            end;
            if Backgnd = bgPattern then
              DitherRect(Canvas, R, fHighLightColor, Color)
            else
              DitherRect(Canvas, R, Color, Color);
          end
          else
          begin
            Brush.Color := fButtonColor;
            FillRect(R);
          end;
        end;
    end;
end;

function TArrowBar.DrawEnabled: Boolean;
begin
  Result := Enabled;
end;

{$IFNDEF CLX}

procedure TArrowBar.DrawNCArea(ADC: HDC; const Clip: HRGN);
var
  DC: HDC;
  R: TRect;
begin
  if BorderStyle = bsNone then
    Exit;
  if ADC = 0 then
    DC := GetWindowDC(Handle)
  else
    DC := ADC;
  try
    GetWindowRect(Handle, R);
    OffsetRect(R, -R.Left, -R.Top);
    DrawEdge(DC, R, BDR_SUNKENOUTER, BF_RECT);
  finally
    if ADC = 0 then
      ReleaseDC(Handle, DC);
  end;
end;
{$ENDIF}

function TArrowBar.GetBorderSize: Integer;
const
  CSize: array[Boolean] of Integer = (0, 1);
begin
  Result := CSize[BorderStyle = bsSingle];
end;

function TArrowBar.GetButtonSize: Integer;
var
  W, H: Integer;
begin
  if not ShowArrows then
    Result := 0
  else
  begin
    Result := ButtonSize;
    if Kind = sbHorizontal then
    begin
      W := ClientWidth;
      H := ClientHeight;
    end
    else
    begin
      W := ClientHeight;
      H := ClientWidth;
    end;
    if Result = 0 then
      Result := Min(H, 32);
    if Result * 2 >= W then
      Result := W div 2;
    if Style = rbsMac then
      Dec(Result);
    if Result < 2 then
      Result := 0;
  end;
end;

function TArrowBar.GetHandleRect: TRect;
begin
  Result := Rect(0, 0, 0, 0);
end;

function TArrowBar.GetTrackBoundary: TRect;
begin
  Result := ClientRect;
  if Kind = sbHorizontal then
    InflateRect(Result, -GetButtonSize, 0)
  else
    InflateRect(Result, 0, -GetButtonSize);
end;

function TArrowBar.GetZone(X, Y: Integer): TRBZone;
var
  P: TPoint;
  R, R1: TRect;
  Sz: Integer;
begin
  Result := zNone;

  P := Point(X, Y);
  R := ClientRect;
  if not PtInrect(R, P) then
    Exit;

  Sz := GetButtonSize;
  R1 := R;
  if Kind = sbHorizontal then
  begin
    R1.Right := R1.Left + Sz;
    if PtInRect(R1, P) then
      Result := zBtnPrev
    else
    begin
      R1.Right := R.Right;
      R1.Left := R.Right - Sz;
      if PtInRect(R1, P) then
        Result := zBtnNext;
    end;
  end
  else
  begin
    R1.Bottom := R1.Top + Sz;
    if PtInRect(R1, P) then
      Result := zBtnPrev
    else
    begin
      R1.Bottom := R.Bottom;
      R1.Top := R.Bottom - Sz;
      if PtInRect(R1, P) then
        Result := zBtnNext;
    end;
  end;

  if Result = zNone then
  begin
    R := GetHandleRect;
    P := Point(X, Y);
    if PtInRect(R, P) then
      Result := zHandle
    else
    begin
      if Kind = sbHorizontal then
      begin
        if (X > 0) and (X < R.Left) then
          Result := zTrackPrev
        else
          if (X >= R.Right) and (X < ClientWidth - 1) then
          Result := zTrackNext;
      end
      else
      begin
        if (Y > 0) and (Y < R.Top) then
          Result := zTrackPrev
        else
          if (Y >= R.Bottom) and (Y < ClientHeight - 1) then
          Result := zTrackNext;
      end;
    end;
  end;
end;

function TArrowBar.GetZoneRect(Zone: TRBZone): TRect;
const
  CEmptyRect: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);
var
  BtnSize: Integer;
  Horz: Boolean;
  R: TRect;
begin
  Horz := Kind = sbHorizontal;
  BtnSize := GetButtonSize;
  case Zone of
    zNone: Result := CEmptyRect;
    zBtnPrev:
      begin
        Result := ClientRect;
        if Horz then
          Result.Right := Result.Left + BtnSize
        else
          Result.Bottom := Result.Top + BtnSize;
      end;
    zTrackPrev..zTrackNext:
      begin
        Result := GetTrackBoundary;
        R := GetHandleRect;
        if not DrawEnabled or IsRectEmpty(R) then
        begin
          R.Left := (Result.Left + Result.Right) div 2;
          R.Top := (Result.Top + Result.Bottom) div 2;
          R.Right := R.Left;
          R.Bottom := R.Top;
        end;
        case Zone of
          zTrackPrev:
            if Horz then
              Result.Right := R.Left
            else
              Result.Bottom := R.Top;
          zHandle:
            Result := R;
          zTrackNext:
            if Horz then
              Result.Left := R.Right
            else
              Result.Top := R.Bottom;
        end;
      end;
    zBtnNext:
      begin
        Result := ClientRect;
        if Horz then
          Result.Left := Result.Right - BtnSize
        else
          Result.Top := Result.Bottom - BtnSize;
      end;
  end;
end;

procedure TArrowBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button <> mbLeft then
    Exit;
  DragZone := GetZone(X, Y);
  Invalidate;
  StoredX := X;
  StoredY := Y;
  StartDragTracking;
end;

procedure TArrowBar.MouseLeft;
begin
  StopHotTracking;
end;

procedure TArrowBar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  NewHotZone: TRBZone;
begin
  inherited;
  if (DragZone = zNone) and DrawEnabled then
  begin
    NewHotZone := GetZone(X, Y);
    if NewHotZone <> HotZone then
    begin
      HotZone := NewHotZone;
      if HotZone <> zNone then
        StartHotTracking;
      Invalidate;
    end;
  end;
end;

procedure TArrowBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DragZone := zNone;
  Invalidate;
  StopDragTracking;
end;

procedure TArrowBar.Paint;
const
  CPrevDirs: array[Boolean] of TRBDirection = (drUp, drLeft);
  CNextDirs: array[Boolean] of TRBDirection = (drDown, drRight);
var
  BSize: Integer;
  ShowEnabled: Boolean;
  R, BtnRect, HandleRect: TRect;
  Horz, ShowHandle: Boolean;
begin
  R := ClientRect;
  Horz := Kind = sbHorizontal;
  ShowEnabled := DrawEnabled;
  BSize := GetButtonSize;

  if ShowArrows then
  begin
    { left / top button }
    BtnRect := R;
    with BtnRect do
      if Horz then
        Right := Left + BSize
      else
        Bottom := Top + BSize;
    DoDrawButton(BtnRect, CPrevDirs[Horz], DragZone = zBtnPrev, ShowEnabled, HotZone = zBtnPrev);

    { right / bottom button }
    BtnRect := R;
    with BtnRect do
      if Horz then
        Left := Right - BSize
      else
        Top := Bottom - BSize;
    DoDrawButton(BtnRect, CNextDirs[Horz], DragZone = zBtnNext, ShowEnabled, HotZone = zBtnNext);
  end;

  if Horz then
    InflateRect(R, -BSize, 0)
  else
    InflateRect(R, 0, -BSize);
  if ShowEnabled then
    HandleRect := GetHandleRect
  else
    HandleRect := Rect(0, 0, 0, 0);
  ShowHandle := not IsRectEmpty(HandleRect);

  DoDrawTrack(GetZoneRect(zTrackPrev), CPrevDirs[Horz], DragZone = zTrackPrev, ShowEnabled, HotZone
    = zTrackPrev);
  DoDrawTrack(GetZoneRect(zTrackNext), CNextDirs[Horz], DragZone = zTrackNext, ShowEnabled, HotZone
    = zTrackNext);
  if ShowHandle then
    DoDrawHandle(HandleRect, Horz, DragZone = zHandle, HotZone = zHandle);
end;

procedure TArrowBar.SetBackgnd(Value: TRBBackgnd);
begin
  if Value <> FBackgnd then
  begin
    FBackgnd := Value;
    Invalidate;
  end;
end;

procedure TArrowBar.SetBorderStyle(Value: TBorderStyle);
begin
  if Value <> FBorderStyle then
  begin
    FBorderStyle := Value;
    {$IFDEF CLX}
    Invalidate;
    {$ELSE}
    RecreateWnd;
    {$ENDIF}
  end;
end;

procedure TArrowBar.SetButtonSize(Value: Integer);
begin
  if Value <> FButtonSize then
  begin
    FButtonSize := Value;
    Invalidate;
  end;
end;

procedure TArrowBar.SetHandleColor(Value: TColor);
begin
  if Value <> FHandleColor then
  begin
    FHandleColor := Value;
    Invalidate;
  end;
end;

procedure TArrowBar.SetHighLightColor(Value: TColor);
begin
  if Value <> FHighLightColor then
  begin
    FHighLightColor := Value;
    Invalidate;
  end;
end;

procedure TArrowBar.SetButtonColor(Value: TColor);
begin
  if Value <> FButtonColor then
  begin
    FButtonColor := Value;
    Invalidate;
  end;
end;

procedure TArrowBar.SetBorderColor(Value: TColor);
begin
  if Value <> FBorderColor then
  begin
    FBorderColor := Value;
    Invalidate;
  end;
end;

procedure TArrowBar.SetShadowColor(Value: TColor);
begin
  if Value <> FShadowColor then
  begin
    FShadowColor := Value;
    Invalidate;
  end;
end;

procedure TArrowBar.SetKind(Value: TScrollBarKind);
var
  Tmp: Integer;
begin
  if Value <> FKind then
  begin
    FKind := Value;
    if (csDesigning in ComponentState) and not (csLoading in ComponentState) then
    begin
      Tmp := Width;
      Width := Height;
      Height := Tmp;
    end;
    Invalidate;
  end;
end;

procedure TArrowBar.SetShowArrows(Value: Boolean);
begin
  if Value <> FShowArrows then
  begin
    FShowArrows := Value;
    Invalidate;
  end;
end;

procedure TArrowBar.SetShowHandleGrip(Value: Boolean);
begin
  if Value <> FShowHandleGrip then
  begin
    FShowHandleGrip := Value;
    Invalidate;
  end;
end;

procedure TArrowBar.SetStyle(Value: TRBStyle);
begin
  FStyle := Value;
  {$IFDEF CLX}
  Invalidate;
  {$ELSE}
  RecreateWnd;
  {$ENDIF}
end;

procedure TArrowBar.StartDragTracking;
begin
  Timer.Interval := FIRST_DELAY;
  TimerMode := tmScroll;
  TimerHandler(Self);
  TimerMode := tmScrollFirst;
  Timer.Enabled := True;
end;

procedure TArrowBar.StartHotTracking;
begin
  Timer.Interval := HOTTRACK_INTERVAL;
  TimerMode := tmHotTrack;
  Timer.Enabled := True;
end;

procedure TArrowBar.StopDragTracking;
begin
  StartHotTracking;
end;

procedure TArrowBar.StopHotTracking;
begin
  Timer.Enabled := False;
  HotZone := zNone;
  Invalidate;
end;

procedure TArrowBar.TimerHandler(Sender: TObject);
var
  Pt: TPoint;
begin
  case TimerMode of
    tmScrollFirst:
      begin
        Timer.Interval := SCROLL_INTERVAL;
        TimerMode := tmScroll;
      end;
    tmHotTrack:
      begin
        Pt := ScreenToClient(Mouse.CursorPos);
        if not PtInRect(ClientRect, Pt) then
        begin
          StopHotTracking;
          Invalidate;
        end;
      end;
  end;
end;

{$IFNDEF CLX}

procedure TArrowBar.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := -1;
end;

procedure TArrowBar.WMNCCalcSize(var Message: TWMNCCalcSize);
var
  Sz: Integer;
begin
  Sz := GetBorderSize;
  InflateRect(Message.CalcSize_Params.rgrc[0], -Sz, -Sz);
end;

procedure TArrowBar.WMNCPaint(var Message: TMessage);
begin
  DrawNCArea(0, HRGN(Message.WParam));
end;
{$ELSE}

function TArrowBar.WidgetFlags: Integer;
begin
  Result := inherited WidgetFlags or Integer(WidgetFlags_WRepaintNoErase) or
    Integer(WidgetFlags_WResizeNoErase);
end;
{$ENDIF}

{ TCnsCustomRangeBar }

procedure TCnsCustomRangeBar.AdjustPosition;
begin
  if FPosition > Range - EffectiveWindow then
    FPosition := Range - EffectiveWindow;
  if FPosition < 0 then
    FPosition := 0;
end;

constructor TCnsCustomRangeBar.Create(AOwner: TComponent);
begin
  inherited;
  FIncrement := 8;
end;

function TCnsCustomRangeBar.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  {$IFDEF CLX}const{$ENDIF}MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if not Result then
    Position := Position + Increment * WheelDelta / 120;
  Result := True;
end;

function TCnsCustomRangeBar.DrawEnabled: Boolean;
begin
  Result := Enabled and (Range > EffectiveWindow);
end;

function TCnsCustomRangeBar.GetHandleRect: TRect;
var
  BtnSz, ClientSz: Integer;
  HandleSz, HandlePos: Integer;
  R: TRect;
  Horz: Boolean;
begin
  R := Rect(0, 0, ClientWidth, ClientHeight);
  Horz := Kind = sbHorizontal;
  BtnSz := GetButtonSize;
  if Horz then
  begin
    InflateRect(R, -BtnSz, 0);
    ClientSz := R.Right - R.Left;
  end
  else
  begin
    InflateRect(R, 0, -BtnSz);
    ClientSz := R.Bottom - R.Top;
  end;
  if ClientSz < 18 then
  begin
    Result := Rect(0, 0, 0, 0);
    Exit;
  end;

  if Range > EffectiveWindow then
  begin
    HandleSz := Round(ClientSz * EffectiveWindow / Range);
    if HandleSz >= MIN_SIZE then
      HandlePos := Round(ClientSz * Position / Range)
    else
    begin
      HandleSz := MIN_SIZE;
      HandlePos := Round((ClientSz - MIN_SIZE) * Position / (Range - EffectiveWindow));
    end;
    Result := R;
    if Horz then
    begin
      Result.Left := R.Left + HandlePos;
      Result.Right := R.Left + HandlePos + HandleSz;
    end
    else
    begin
      Result.Top := R.Top + HandlePos;
      Result.Bottom := R.Top + HandlePos + HandleSz;
    end;
  end
  else
    Result := R;
end;

function TCnsCustomRangeBar.IsPositionStored: Boolean;
begin
  Result := FPosition > 0;
end;

procedure TCnsCustomRangeBar.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Range <= EffectiveWindow then
    DragZone := zNone
  else
  begin
    inherited;
    if DragZone = zHandle then
    begin
      StopDragTracking;
      PosBeforeDrag := Position;
    end;
  end;
end;

procedure TCnsCustomRangeBar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Delta: Single;
  WinSz: Single;
  ClientSz, HandleSz: Integer;
begin
  inherited;
  if DragZone = zHandle then
  begin
    WinSz := EffectiveWindow;

    if Range <= WinSz then
      Exit;
    if Kind = sbHorizontal then
      Delta := X - StoredX
    else
      Delta := Y - StoredY;

    if Kind = sbHorizontal then
      ClientSz := ClientWidth
    else
      ClientSz := ClientHeight;
    Dec(ClientSz, GetButtonSize * 2);
    if BorderStyle = bsSingle then
      Dec(ClientSz, 2);
    HandleSz := Round(ClientSz * WinSz / Range);

    if HandleSz < MIN_SIZE then
      Delta := Round(Delta * (Range - WinSz) / (ClientSz - MIN_SIZE))
    else
      Delta := Delta * Range / ClientSz;

    GenChange := True;
    Position := PosBeforeDrag + Delta;
    GenChange := False;
  end;
end;

procedure TCnsCustomRangeBar.Resize;
var
  OldWindow: Integer;
  Center: Single;
begin
  if Centered then
  begin
    OldWindow := EffectiveWindow;
    UpdateEffectiveWindow;
    if Range > EffectiveWindow then
    begin
      if Range > OldWindow then
        Center := (FPosition + OldWindow * 0.5) / Range
      else
        Center := 0.5;
      FPosition := Center * Range - EffectiveWindow * 0.5;
    end;
  end;
  AdjustPosition;
  inherited;
end;

procedure TCnsCustomRangeBar.SetParams(NewRange, NewWindow: Integer);
var
  OldWindow, OldRange: Integer;
  Center: Single;
begin
  if NewRange < 0 then
    NewRange := 0;
  if NewWindow < 0 then
    NewWindow := 0;
  if (NewRange <> FRange) or (NewWindow <> EffectiveWindow) then
  begin
    OldWindow := EffectiveWindow;
    OldRange := Range;
    FRange := NewRange;
    FWindow := NewWindow;
    UpdateEffectiveWindow;
    if Centered and (Range > EffectiveWindow) then
    begin
      if (OldRange > OldWindow) and (OldRange <> 0) then
        Center := (FPosition + OldWindow * 0.5) / OldRange
      else
        Center := 0.5;
      FPosition := Center * Range - EffectiveWindow * 0.5;
    end;
    AdjustPosition;
    Invalidate;
  end;
end;

procedure TCnsCustomRangeBar.SetPosition(Value: Single);
var
  OldPosition: Single;
begin
  if Value <> FPosition then
  begin
    OldPosition := FPosition;
    FPosition := Value;
    AdjustPosition;
    if OldPosition <> FPosition then
    begin
      Invalidate;
      DoChange;
    end;
  end;
end;

procedure TCnsCustomRangeBar.SetRange(Value: Integer);
begin
  SetParams(Value, Window);
end;

procedure TCnsCustomRangeBar.SetWindow(Value: Integer);
begin
  SetParams(Range, Value);
end;

procedure TCnsCustomRangeBar.TimerHandler(Sender: TObject);
var
  OldPosition: Single;
  Pt: TPoint;

  function MousePos: TPoint;
  begin
    Result := ScreenToClient(Mouse.CursorPos);
    if Result.X < 0 then
      Result.X := 0;
    if Result.Y < 0 then
      Result.Y := 0;
    if Result.X >= ClientWidth then
      Result.X := ClientWidth - 1;
    if Result.Y >= ClientHeight then
      Result.Y := ClientHeight - 1
  end;

begin
  inherited;
  GenChange := True;
  OldPosition := Position;

  case DragZone of
    zBtnPrev:
      begin
        Position := Position - Increment;
        if Position = OldPosition then
          StopDragTracking;
      end;

    zBtnNext:
      begin
        Position := Position + Increment;
        if Position = OldPosition then
          StopDragTracking;
      end;

    zTrackNext:
      begin
        Pt := MousePos;
        if GetZone(Pt.X, Pt.Y) in [zTrackNext, zBtnNext] then
          Position := Position + EffectiveWindow;
      end;

    zTrackPrev:
      begin
        Pt := MousePos;
        if GetZone(Pt.X, Pt.Y) in [zTrackPrev, zBtnPrev] then
          Position := Position - EffectiveWindow;
      end;
  end;
  GenChange := False;
end;

procedure TCnsCustomRangeBar.UpdateEffectiveWindow;
begin
  if FWindow > 0 then
    FEffectiveWindow := FWindow
  else
  begin
    if Kind = sbHorizontal then
      FEffectiveWindow := Width
    else
      FEffectiveWindow := Height;
  end;
end;

//----------------------------------------------------------------------------//

{ TCustomGaugeBar }

procedure TCustomGaugeBar.AdjustPosition;
begin
  if Position < Min then
    Position := Min
  else
    if Position > Max then
    Position := Max;
end;

constructor TCustomGaugeBar.Create(AOwner: TComponent);
begin
  inherited;
  FLargeChange := 1;
  FMax := 100;
  FSmallChange := 1;
end;

function TCustomGaugeBar.DoMouseWheel(Shift: TShiftState;
  WheelDelta: Integer; {$IFDEF CLX}const{$ENDIF}MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if not Result then
    Position := Position + FSmallChange * WheelDelta div 120;
  Result := True;
end;

function TCustomGaugeBar.GetHandleRect: TRect;
var
  Sz, HandleSz: Integer;
  Horz: Boolean;
  Pos: Integer;
begin
  Result := GetTrackBoundary;
  Horz := Kind = sbHorizontal;
  HandleSz := GetHandleSize;

  if Horz then
    Sz := Result.Right - Result.Left
  else
    Sz := Result.Bottom - Result.Top;

  Pos := Round((Position - Min) * (Sz - GetHandleSize) / (Max - Min));

  if Horz then
  begin
    Inc(Result.Left, Pos);
    Result.Right := Result.Left + HandleSz;
  end
  else
  begin
    Inc(Result.Top, Pos);
    Result.Bottom := Result.Top + HandleSz;
  end;
end;

function TCustomGaugeBar.GetHandleSize: Integer;
var
  R: TRect;
  Sz: Integer;
begin
  Result := HandleSize;
  if Result = 0 then
  begin
    if Kind = sbHorizontal then
      Result := ClientHeight
    else
      Result := ClientWidth;
  end;
  R := GetTrackBoundary;
  if Kind = sbHorizontal then
    Sz := R.Right - R.Left
  else
    Sz := R.Bottom - R.Top;
  if Sz - Result < 1 then
    Result := Sz - 1;
  if Result < 0 then
    Result := 0;
end;

procedure TCustomGaugeBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if DragZone = zHandle then
  begin
    StopDragTracking;
    PosBeforeDrag := Position;
  end;
end;

procedure TCustomGaugeBar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Delta: Single;
  R: TRect;
  ClientSz: Integer;
begin
  inherited;
  if DragZone = zHandle then
  begin
    if Kind = sbHorizontal then
      Delta := X - StoredX
    else
      Delta := Y - StoredY;
    R := GetTrackBoundary;

    if Kind = sbHorizontal then
      ClientSz := R.Right - R.Left
    else
      ClientSz := R.Bottom - R.Top;

    Delta := Delta * (Max - Min) / (ClientSz - GetHandleSize);

    GenChange := True;
    Position := Round(PosBeforeDrag + Delta);
    GenChange := False;
  end;
end;

procedure TCustomGaugeBar.SetHandleSize(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  if Value <> FHandleSize then
  begin
    FHandleSize := Value;
    Invalidate;
  end;
end;

procedure TCustomGaugeBar.SetLargeChange(Value: Integer);
begin
  if Value < 1 then
    Value := 1;
  FLargeChange := Value;
end;

procedure TCustomGaugeBar.SetMax(Value: Integer);
begin
  if (Value <= FMin) and not (csLoading in ComponentState) then
    Value := FMin + 1;
  if Value <> FMax then
  begin
    FMax := Value;
    AdjustPosition;
    Invalidate;
  end;
end;

procedure TCustomGaugeBar.SetMin(Value: Integer);
begin
  if (Value >= FMax) and not (csLoading in ComponentState) then
    Value := FMax - 1;
  if Value <> FMin then
  begin
    FMin := Value;
    AdjustPosition;
    Invalidate;
  end;
end;

procedure TCustomGaugeBar.SetPosition(Value: Integer);
begin
  if Value < Min then
    Value := Min
  else
    if Value > Max then
    Value := Max;
  if Round(FPosition) <> Value then
  begin
    FPosition := Value;
    Invalidate;
    DoChange;
  end;
end;

procedure TCustomGaugeBar.SetSmallChange(Value: Integer);
begin
  if Value < 1 then
    Value := 1;
  FSmallChange := Value;
end;

procedure TCustomGaugeBar.TimerHandler(Sender: TObject);
var
  OldPosition: Single;
  Pt: TPoint;

  function MousePos: TPoint;
  begin
    Result := ScreenToClient(Mouse.CursorPos);
    if Result.X < 0 then
      Result.X := 0;
    if Result.Y < 0 then
      Result.Y := 0;
    if Result.X >= ClientWidth then
      Result.X := ClientWidth - 1;
    if Result.Y >= ClientHeight then
      Result.Y := ClientHeight - 1
  end;

begin
  inherited;
  GenChange := True;
  OldPosition := Position;

  case DragZone of
    zBtnPrev:
      begin
        Position := Position - SmallChange;
        if Position = OldPosition then
          StopDragTracking;
      end;

    zBtnNext:
      begin
        Position := Position + SmallChange;
        if Position = OldPosition then
          StopDragTracking;
      end;

    zTrackNext:
      begin
        Pt := MousePos;
        if GetZone(Pt.X, Pt.Y) in [zTrackNext, zBtnNext] then
          Position := Position + LargeChange;
      end;

    zTrackPrev:
      begin
        Pt := MousePos;
        if GetZone(Pt.X, Pt.Y) in [zTrackPrev, zBtnPrev] then
          Position := Position - LargeChange;
      end;
  end;
  GenChange := False;
end;

{ TArrowBarAccess }

function TArrowBarAccess.GetBackgnd: TRBBackgnd;
begin
  Result := FMaster.Backgnd;
end;

function TArrowBarAccess.GetButtonSize: Integer;
begin
  Result := FMaster.ButtonSize;
end;

function TArrowBarAccess.GetColor: TColor;
begin
  Result := FMaster.Color;
end;

function TArrowBarAccess.GetHandleColor: TColor;
begin
  Result := FMaster.HandleColor;
end;

function TArrowBarAccess.GetHighLightColor: TColor;
begin
  Result := FMaster.HighLightColor;
end;

function TArrowBarAccess.GetShadowColor: TColor;
begin
  Result := FMaster.ShadowColor;
end;

function TArrowBarAccess.GetButtonColor: TColor;
begin
  Result := FMaster.ButtonColor;
end;

function TArrowBarAccess.GetBorderColor: TColor;
begin
  Result := FMaster.BorderColor;
end;

function TArrowBarAccess.GetShowArrows: Boolean;
begin
  Result := FMaster.ShowArrows;
end;

function TArrowBarAccess.GetShowHandleGrip: Boolean;
begin
  Result := FMaster.ShowHandleGrip;
end;

function TArrowBarAccess.GetStyle: TRBStyle;
begin
  Result := FMaster.Style;
end;

procedure TArrowBarAccess.SetBackgnd(Value: TRBBackgnd);
begin
  FMaster.Backgnd := Value;
  if FSlave <> nil then
    FSlave.Backgnd := Value;
end;

procedure TArrowBarAccess.SetButtonSize(Value: Integer);
begin
  FMaster.ButtonSize := Value;
  if FSlave <> nil then
    FSlave.ButtonSize := Value;
end;

procedure TArrowBarAccess.SetColor(Value: TColor);
begin
  FMaster.Color := Value;
  if FSlave <> nil then
    FSlave.Color := Value;
end;

procedure TArrowBarAccess.SetHandleColor(Value: TColor);
begin
  FMaster.HandleColor := Value;
  if FSlave <> nil then
    FSlave.HandleColor := Value;
end;

procedure TArrowBarAccess.SetHighLightColor(Value: TColor);
begin
  FMaster.HighLightColor := Value;
  if FSlave <> nil then
    FSlave.HighLightColor := Value;
end;

procedure TArrowBarAccess.SetShadowColor(Value: TColor);
begin
  FMaster.ShadowColor := Value;
  if FSlave <> nil then
    FSlave.ShadowColor := Value;
end;

procedure TArrowBarAccess.SetButtonColor(Value: TColor);
begin
  FMaster.ButtonColor := Value;
  if FSlave <> nil then
    FSlave.ButtonColor := Value;
end;

procedure TArrowBarAccess.SetBorderColor(Value: TColor);
begin
  FMaster.BorderColor := Value;
  if FSlave <> nil then
    FSlave.BorderColor := Value;
end;

procedure TArrowBarAccess.SetShowArrows(Value: Boolean);
begin
  FMaster.ShowArrows := Value;
  if FSlave <> nil then
    FSlave.ShowArrows := Value;
end;

procedure TArrowBarAccess.SetShowHandleGrip(Value: Boolean);
begin
  FMaster.ShowHandleGrip := Value;
  if FSlave <> nil then
    FSlave.ShowHandleGrip := Value;
end;

procedure TArrowBarAccess.SetStyle(Value: TRBStyle);
begin
  FMaster.Style := Value;
  if FSlave <> nil then
    FSlave.Style := Value;
end;

{ TCnsCustomImgView32 }

procedure TCnsCustomImgView32.AlignAll;
var
  ScrollbarVisible: Boolean;
begin
  with GetViewportRect do
  begin
    ScrollbarVisible := GetScrollBarsVisible;

    if Assigned(HScroll) then
    begin
      HScroll.BoundsRect := Rect(Left, Bottom, Right, Height);
      HScroll.Visible := ScrollbarVisible;
      HScroll.Repaint;
    end;

    if Assigned(VScroll) then
    begin
      VScroll.BoundsRect := Rect(Right, Top, Width, Bottom);
      VScroll.Visible := ScrollbarVisible;
      VScroll.Repaint;
    end;
  end;
end;

procedure TCnsCustomImgView32.BitmapResized;
begin
  inherited;
  UpdateScrollBars;
  if Centered then
    ScrollToCenter(Bitmap.Width div 2, Bitmap.Height div 2)
  else
  begin
    HScroll.Position := 0;
    VScroll.Position := 0;
    UpdateImage;
  end;
end;

constructor TCnsCustomImgView32.Create(AOwner: TComponent);
begin
  inherited;

  HScroll := TCnsCustomRangeBar.Create(Self);
  VScroll := TCnsCustomRangeBar.Create(Self);

  with HScroll do
  begin
    HScroll.Parent := Self;
    BorderStyle := bsNone;
    Centered := True;
    OnUserChange := ScrollHandler;
  end;

  with VScroll do
  begin
    Parent := Self;
    BorderStyle := bsNone;
    Centered := True;
    Kind := sbVertical;
    OnUserChange := ScrollHandler;
  end;

  FCentered := True;
  ScaleMode := smScale;
  BitmapAlign := baCustom;
  with GetViewportRect do
  begin
    OldSzX := Right - Left;
    OldSzY := Bottom - Top;
  end;

  FScrollBars := TIVScrollProperties.Create;
  FScrollBars.ImgView := Self;
  FScrollBars.Master := HScroll;
  FScrollBars.Slave := VScroll;

  AlignAll;
end;

destructor TCnsCustomImgView32.Destroy;
begin
  FreeAndNil(FScrollBars);
  inherited;
end;

procedure TCnsCustomImgView32.DoDrawSizeGrip(R: TRect);
begin
  {$IFNDEF CLX}
  if USE_THEMES then
  begin
    Canvas.Brush.Color := clBtnFace;
    Canvas.FillRect(R);
    DrawThemeBackground(SCROLLBAR_THEME, Canvas.Handle, SBP_SIZEBOX, SZB_RIGHTALIGN, R, nil);
  end
  else
    DrawFrameControl(Canvas.Handle, R, DFC_SCROLL, DFCS_SCROLLSIZEGRIP)
      {$ENDIF}
end;

procedure TCnsCustomImgView32.DoScaleChange;
begin
  inherited;
  InvalidateCache;
  UpdateScrollBars;
  UpdateImage;
  Invalidate;
end;

procedure TCnsCustomImgView32.DoScroll;
begin
  if Assigned(FOnScroll) then
    FOnScroll(Self);
end;

function TCnsCustomImgView32.GetScrollBarSize: Integer;
{$IFDEF CLX}
var
  Size: TSize;
  {$ENDIF}
begin
  if GetScrollBarsVisible then
  begin
    Result := FScrollBarSize;
    {$IFDEF CLX}
    QStyle_scrollBarExtent(Application.Style.Handle, @Size);
    if Result = 0 then
      Result := Size.cy;
    {$ELSE}
    if Result = 0 then
      Result := GetSystemMetrics(SM_CYHSCROLL);
    {$ENDIF}
  end
  else
    Result := 0;
end;

function TCnsCustomImgView32.GetScrollBarsVisible: Boolean;
begin
  Result := True;
  if Assigned(FScrollBars) and Assigned(HScroll) and Assigned(VScroll) then
    case FScrollBars.Visibility of
      svAlways:
        Result := True;
      svHidden:
        Result := False;
      svAuto:
        Result := (HScroll.Range > TRangeBarAccess(HScroll).EffectiveWindow) or
          (VScroll.Range > TRangeBarAccess(VScroll).EffectiveWindow);
    end;
end;

function TCnsCustomImgView32.GetSizeGripRect: TRect;
var
  Sz: Integer;
begin
  Sz := GetScrollBarSize;
  Result := GetClientRect;
  with Result do
  begin
    Left := Right - Sz;
    Top := Bottom - Sz;
  end;
end;

function TCnsCustomImgView32.GetViewportRect: TRect;
var
  Sz: Integer;
begin
  Result := Rect(0, 0, Width, Height);
  Sz := GetScrollBarSize;
  Dec(Result.Right, Sz);
  Dec(Result.Bottom, Sz);
end;

function TCnsCustomImgView32.IsSizeGripVisible: Boolean;
var
  P: TWinControl;
begin
  case SizeGrip of
    sgAuto:
      begin
        Result := False;
        if Align <> alClient then
          Exit;
        P := Parent;
        while True do
        begin
          if P is TCustomForm then
          begin
            Result := True;
            Break;
          end
          else
            if not Assigned(P) or (P.Align <> alClient) then
            Exit;
          P := P.Parent;
        end;
      end;

    sgNone: Result := False

  else { sgAlways }
    Result := True;
  end;
end;

procedure TCnsCustomImgView32.Loaded;
begin
  AlignAll;
  Invalidate;
  UpdateScrollBars;
  if Centered then
    with Bitmap do
      ScrollToCenter(Width div 2, Height div 2);
  inherited;
end;

procedure TCnsCustomImgView32.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
{$IFNDEF CLX}
var
  Action: Cardinal;
  Msg: TMessage;
  P: TPoint;
  {$ENDIF}
begin
  {$IFNDEF CLX}
  if IsSizeGripVisible and (Owner is TCustomForm) then
  begin
    P.X := X;
    P.Y := Y;
    if PtInRect(GetSizeGripRect, P) then
    begin
      Action := HTBOTTOMRIGHT;
      Application.ProcessMessages;
      Msg.Msg := WM_NCLBUTTONDOWN;
      Msg.WParam := Action;
      SetCaptureControl(nil);
      with Msg do
        SendMessage(TCustomForm(Owner).Handle, Msg, wParam, lParam);
      Exit;
    end;
  end;
  {$ENDIF}
  inherited;
end;

procedure TCnsCustomImgView32.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  inherited;
  if IsSizeGripVisible then
  begin
    P.X := X;
    P.Y := Y;
    if PtInRect(GetSizeGripRect, P) then
      Screen.Cursor := crSizeNWSE;
  end;
end;

procedure TCnsCustomImgView32.Paint;
begin
  if IsSizeGripVisible then
    DoDrawSizeGrip(GetSizeGripRect)
  else
  begin
    Canvas.Brush.Color := clBtnFace;
    Canvas.FillRect(GetSizeGripRect);
  end;
  inherited;
end;

procedure TCnsCustomImgView32.Resize;
begin
  AlignAll;
  if IsSizeGripVisible then
    DoDrawSizeGrip(GetSizeGripRect)
  else
  begin
    Canvas.Brush.Color := clBtnFace;
    Canvas.FillRect(GetSizeGripRect);
  end;
  InvalidateCache;
  UpdateScrollBars;
  UpdateImage;
  Invalidate;
  inherited;
end;

procedure TCnsCustomImgView32.Scroll(Dx, Dy: Integer);
begin
  DisableScrollUpdate := True;
  HScroll.Position := HScroll.Position + Dx;
  VScroll.Position := VScroll.Position + Dy;
  DisableScrollUpdate := False;
  UpdateImage;
end;

procedure TCnsCustomImgView32.ScrollHandler(Sender: TObject);
begin
  if DisableScrollUpdate then
    Exit;
  if Sender = HScroll then
    HScroll.Repaint;
  if Sender = VScroll then
    VScroll.Repaint;
  UpdateImage;
  DoScroll;
  Repaint;
end;

procedure TCnsCustomImgView32.ScrollToCenter(X, Y: Integer);
var
  ScaledDOversize: Integer;
begin
  DisableScrollUpdate := True;
  AlignAll;

  ScaledDOversize := Round(FOversize * Scale);
  with GetViewportRect do
  begin
    HScroll.Position := X * Scale - (Right - Left) / 2 + ScaledDOversize;
    VScroll.Position := Y * Scale - (Bottom - Top) / 2 + ScaledDOversize;
  end;
  DisableScrollUpdate := False;
  UpdateImage;
end;

procedure TCnsCustomImgView32.Recenter;
begin
  InvalidateCache;
  HScroll.Centered := FCentered;
  VScroll.Centered := FCentered;
  UpdateScrollBars;
  UpdateImage;
  if FCentered then
    with Bitmap do
      ScrollToCenter(Width div 2, Height div 2)
  else
    ScrollToCenter(0, 0);
end;

procedure TCnsCustomImgView32.SetCentered(Value: Boolean);
begin
  FCentered := Value;
  Recenter;
end;

procedure TCnsCustomImgView32.SetOverSize(const Value: Integer);
begin
  if Value <> FOverSize then
  begin
    FOverSize := Value;
    Invalidate;
  end;
end;

procedure TCnsCustomImgView32.SetScrollBars(Value: TIVScrollProperties);
begin
  FScrollBars.Assign(Value);
end;

procedure TCnsCustomImgView32.SetSizeGrip(Value: TSizeGripStyle);
begin
  if Value <> FSizeGrip then
  begin
    FSizeGrip := Value;
    Invalidate;
  end;
end;

procedure TCnsCustomImgView32.UpdateImage;
var
  Sz: TSize;
  W, H: Integer;
  ScaledOversize: Integer;
begin
  Sz := GetBitmapSize;
  ScaledOversize := Round(FOversize * Scale);

  with GetViewportRect do
  begin
    W := Right - Left;
    H := Bottom - Top;
  end;
  BeginUpdate;
  if not Centered then
  begin
    OffsetHorz := -HScroll.Position + ScaledOversize;
    OffsetVert := -VScroll.Position + ScaledOversize;
  end
  else
  begin
    if W > Sz.Cx + 2 * ScaledOversize then // Viewport is bigger than scaled Bitmap
      OffsetHorz := (W - Sz.Cx) / 2
    else
      OffsetHorz := -HScroll.Position + ScaledOversize;

    if H > Sz.Cy + 2 * ScaledOversize then // Viewport is bigger than scaled Bitmap
      OffsetVert := (H - Sz.Cy) / 2
    else
      OffsetVert := -VScroll.Position + ScaledOversize;
  end;
  InvalidateCache;
  EndUpdate;
  Changed;
end;

procedure TCnsCustomImgView32.UpdateScrollBars;
var
  Sz: TSize;
  ScaledDOversize: Integer;
begin
  if Assigned(HScroll) and Assigned(VScroll) then
  begin
    Sz := GetBitmapSize;
    ScaledDOversize := Round(2 * FOversize * Scale);

    HScroll.Range := Sz.Cx + ScaledDOversize;
    VScroll.Range := Sz.Cy + ScaledDOversize;

    // call AlignAll for Visibility svAuto, because the ranges of the scrollbars
    // may have just changed, thus we need to update the visibility of the scrollbars:
    if FScrollBarVisibility = svAuto then
      AlignAll;
  end;
end;

procedure TCnsCustomImgView32.SetScaleMode(Value: TScaleMode);
begin
  inherited;
  Recenter;
end;

{ TIVScrollProperties }

function TIVScrollProperties.GetIncrement: Integer;
begin
  Result := Round(TCnsCustomRangeBar(Master).Increment);
end;

function TIVScrollProperties.GetSize: Integer;
begin
  Result := ImgView.FScrollBarSize;
end;

function TIVScrollProperties.GetVisibility: TScrollbarVisibility;
begin
  Result := ImgView.FScrollBarVisibility;
end;

procedure TIVScrollProperties.SetIncrement(Value: Integer);
begin
  TCnsCustomRangeBar(Master).Increment := Value;
  TCnsCustomRangeBar(Slave).Increment := Value;
end;

procedure TIVScrollProperties.SetSize(Value: Integer);
begin
  ImgView.FScrollBarSize := Value;
  ImgView.AlignAll;
end;

procedure TIVScrollProperties.SetVisibility(const Value: TScrollbarVisibility);
begin
  if Value <> ImgView.FScrollBarVisibility then
  begin
    ImgView.FScrollBarVisibility := Value;
    ImgView.Resize;
  end;
end;

function Set255(Clr: integer): integer;
asm
  MOV  EAX,Clr  // store value in EAX register (32-bit register)
  CMP  EAX,254  // compare it to 254
  JG   @SETHI   // if greater than 254 then go set to 255 (max value)
  CMP  EAX,1    // if less than 255, compare to 1
  JL   @SETLO   // if less than 1 go set to 0 (min value)
  RET           // otherwise it doesn't change, just exit
@SETHI:         // Set value to 255
  MOV  EAX,255  // Move 255 into the EAX register
  RET           // Exit (result value is the EAX register value)
@SETLO:         // Set value to 0
  MOV  EAX,0    // Move 0 into EAX register
end; // Result is in EAX

procedure ConvolveBitmap(zz: Integer; aBmp: TCnsBitmap32);
var
  z: integer;
  ray: array[0..8] of integer;
begin
  case zz of

    0:
      begin // Laplace
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := -1;
        ray[4] := 8;
        ray[5] := -1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
        z := 1;
      end;

    1:
      begin // Hipass
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := -1;
        ray[4] := 9;
        ray[5] := -1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
        z := 1;
      end;
    2:
      begin // Find Edges (top down)
        ray[0] := 1;
        ray[1] := 1;
        ray[2] := 1;
        ray[3] := 1;
        ray[4] := -2;
        ray[5] := 1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
        z := 1;
      end;
    3:
      begin // Sharpen
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := -1;
        ray[4] := 16;
        ray[5] := -1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
        z := 8;
      end;
    4:
      begin // Edge Enhance
        ray[0] := 0;
        ray[1] := -1;
        ray[2] := 0;
        ray[3] := -1;
        ray[4] := 5;
        ray[5] := -1;
        ray[6] := 0;
        ray[7] := -1;
        ray[8] := 0;
        z := 1;
      end;
    5:
      begin // Color Emboss (Sorta)
        ray[0] := 1;
        ray[1] := 0;
        ray[2] := 1;
        ray[3] := 0;
        ray[4] := 0;
        ray[5] := 0;
        ray[6] := 1;
        ray[7] := 0;
        ray[8] := -2;
        z := 1;
      end;
    6:
      begin // Soften
        ray[0] := 2;
        ray[1] := 2;
        ray[2] := 2;
        ray[3] := 2;
        ray[4] := 0;
        ray[5] := 2;
        ray[6] := 2;
        ray[7] := 2;
        ray[8] := 2;
        z := 16;
      end;
    7:
      begin // Blur
        ray[0] := 3;
        ray[1] := 3;
        ray[2] := 3;
        ray[3] := 3;
        ray[4] := 8;
        ray[5] := 3;
        ray[6] := 3;
        ray[7] := 3;
        ray[8] := 3;
        z := 32;
      end;

    8:
      begin // LAP1
        ray[0] := 0;
        ray[1] := 1;
        ray[2] := 0;
        ray[3] := 1;
        ray[4] := -4;
        ray[5] := 1;
        ray[6] := 0;
        ray[7] := 1;
        ray[8] := 0;
        z := 1;
      end;

    9:
      begin // LAP4
        ray[0] := 1;
        ray[1] := -2;
        ray[2] := 1;
        ray[3] := -2;
        ray[4] := 4;
        ray[5] := -2;
        ray[6] := 1;
        ray[7] := -2;
        ray[8] := 1;
        z := 1;
      end;

    10:
      begin // HP3
        ray[0] := 1;
        ray[1] := -2;
        ray[2] := 1;
        ray[3] := -2;
        ray[4] := 5;
        ray[5] := -2;
        ray[6] := 1;
        ray[7] := -2;
        ray[8] := 1;
        z := 1;
      end;

    11:
      begin // Find Edges (Bottom top )
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := 1;
        ray[4] := -2;
        ray[5] := 1;
        ray[6] := 1;
        ray[7] := 1;
        ray[8] := 1;
        z := 1;
      end;

    12:
      begin // Sobel hor
        ray[0] := 1;
        ray[1] := 2;
        ray[2] := 1;
        ray[3] := 0;
        ray[4] := 0;
        ray[5] := 0;
        ray[6] := -1;
        ray[7] := -2;
        ray[8] := -1;
        z := 1;
      end;

    13:
      begin // Sobel vert
        ray[0] := 1;
        ray[1] := 0;
        ray[2] := -1;
        ray[3] := 2;
        ray[4] := 0;
        ray[5] := -2;
        ray[6] := 1;
        ray[7] := 0;
        ray[8] := -1;
        z := 1;
      end;

    14:
      begin // Previt hor
        ray[0] := 1;
        ray[1] := 1;
        ray[2] := 1;
        ray[3] := 0;
        ray[4] := 0;
        ray[5] := 0;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
        z := 1;
      end;

    15:
      begin // Previt vert
        ray[0] := 1;
        ray[1] := 0;
        ray[2] := -1;
        ray[3] := 1;
        ray[4] := 0;
        ray[5] := -1;
        ray[6] := 1;
        ray[7] := 0;
        ray[8] := -1;
        z := 1;
      end;

    16:
      begin // Laplace - Origin
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := -1;
        ray[4] := 7;
        ray[5] := -1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
        z := 1;
      end;

    17:
      begin //Gaussian Blure
        ray[0] := 1;
        ray[1] := 2;
        ray[2] := 1;
        ray[3] := 2;
        ray[4] := 4;
        ray[5] := 2;
        ray[6] := 1;
        ray[7] := 2;
        ray[8] := 1;
        z := 16;
      end;
  else
    exit;
  end;

  ConvolveI(ray, z, aBmp);

end;

procedure ConvolveI(ray: array of integer; z: word; aBmp: TCnsBitmap32);
var
  O, T, C, B: PColor32Array; // Scanlines
  x, y: integer;
  tBufr: TCnsBitmap32; // temp bitmap

  Red, Green, Blue: Integer;
begin
  tBufr := TCnsBitmap32.Create;
  CheckParams(tBufr, aBmp);
  tBufr.Assign(aBmp);

  for x := 1 to aBmp.Height - 2 do
  begin // Walk scanlines
    O := aBmp.ScanLine[x]; // New Target (Original)
    T := tBufr.ScanLine[x - 1]; //old x-1  (Top)
    C := tBufr.ScanLine[x]; //old x    (Center)
    B := tBufr.ScanLine[x + 1]; //old x+1  (Bottom)
    // Now do the main piece

    for y := 1 to (tBufr.Width - 2) do
    begin // Walk pixels

      Red := Set255(
        (
        (RedComponent(T[y - 1]) * ray[0]) + (RedComponent(T[y]) * ray[1]) + (RedComponent(T[y + 1])
        * ray[2]) +
        (RedComponent(C[y - 1]) * ray[3]) + (RedComponent(C[y]) * ray[4]) + (RedComponent(C[y + 1])
        * ray[5]) +
        (RedComponent(B[y - 1]) * ray[6]) + (RedComponent(B[y]) * ray[7]) + (RedComponent(B[y + 1])
        * ray[8])
        ) div z);

      Green := Set255(
        (
        (GreenComponent(T[y - 1]) * ray[0]) + (GreenComponent(T[y]) * ray[1]) + (GreenComponent(T[y
        + 1]) * ray[2]) +
          (GreenComponent(C[y - 1]) * ray[3]) + (GreenComponent(C[y]) * ray[4]) +
        (GreenComponent(C[y
        + 1]) * ray[5]) +
          (GreenComponent(B[y - 1]) * ray[6]) + (GreenComponent(B[y]) * ray[7]) +
        (GreenComponent(B[y
        + 1]) * ray[8])
          ) div z);

      Blue := Set255(
        (
        (BlueComponent(T[y - 1]) * ray[0]) + (BlueComponent(T[y]) * ray[1]) + (BlueComponent(T[y +
        1]) * ray[2]) +
          (BlueComponent(C[y - 1]) * ray[3]) + (BlueComponent(C[y]) * ray[4]) + (BlueComponent(C[y
        +
          1]) * ray[5]) +
          (BlueComponent(B[y - 1]) * ray[6]) + (BlueComponent(B[y]) * ray[7]) + (BlueComponent(B[y
        +
          1]) * ray[8])
          ) div z);

      O[y] := Color32(Red, Green, Blue);
    end;
  end;
  tBufr.Free;
end;

procedure ConvolveI5x5(ray: array of integer; z: word; aBmp: TCnsBitmap32);
var
  O, T, T2, C, B, B2: PColor32Array; // Scanlines
  //  NS, i: integer;
  x, y: integer;
  tBufr: TCnsBitmap32; // temp bitmap
  Red, Green, Blue: Integer;

begin
  tBufr := TCnsBitmap32.Create;
  CheckParams(tBufr, aBmp);
  tBufr.Assign(aBmp);

  for x := 2 to aBmp.Height - 3 do
  begin // Walk scanlines
    O := aBmp.ScanLine[x]; // New Target (Original)
    T2 := tBufr.ScanLine[x - 2]; //old x-2  (Top)
    T := tBufr.ScanLine[x - 1]; //old x-1  (Top)
    C := tBufr.ScanLine[x]; //old x    (Center)
    B := tBufr.ScanLine[x + 1]; //old x+1  (Bottom)
    B2 := tBufr.ScanLine[x + 2]; //old x+2  (Bottom)

    // Now do the main piece
    for y := 2 to (tBufr.Width - 3) do
    begin // Walk pixels

      //NS:=0;
      //for i:=0 to 4 do

      Red := Set255(
        (
        RedComponent(T2[y - 2]) * ray[0] + RedComponent(T2[y - 1]) * ray[1] + RedComponent(T2[y]) *
        ray[2] + RedComponent(T2[y + 1]) * ray[3] + RedComponent(T2[y + 2]) * ray[4] +
        RedComponent(T[y - 2]) * ray[5] + RedComponent(T[y - 1]) * ray[6] + RedComponent(T[y]) *
        ray[7] + RedComponent(T[y + 1]) * ray[8] + RedComponent(T[y + 2]) * ray[9] +
        RedComponent(C[y - 2]) * ray[10] + RedComponent(C[y - 1]) * ray[11] + RedComponent(C[y]) *
        ray[12] + RedComponent(C[y + 1]) * ray[13] + RedComponent(C[y + 2]) * ray[14] +
        RedComponent(B[y - 2]) * ray[15] + RedComponent(B[y - 1]) * ray[16] + RedComponent(B[y]) *
        ray[17] + RedComponent(B[y + 1]) * ray[18] + RedComponent(B[y + 2]) * ray[19] +
        RedComponent(B2[y - 2]) * ray[20] + RedComponent(B2[y - 1]) * ray[21] + RedComponent(B2[y])
        * ray[22] + RedComponent(B2[y + 1]) * ray[23] + RedComponent(B2[y + 2]) * ray[24]
        ) div z);

      Blue := Set255(
        (
        BlueComponent(T2[y - 2]) * ray[0] + BlueComponent(T2[y - 1]) * ray[1] + BlueComponent(T2[y])
        * ray[2] + BlueComponent(T2[y + 1]) * ray[3] + BlueComponent(T2[y + 2]) * ray[4] +
        BlueComponent(T[y - 2]) * ray[5] + BlueComponent(T[y - 1]) * ray[6] + BlueComponent(T[y]) *
        ray[7] + BlueComponent(T[y + 1]) * ray[8] + BlueComponent(T[y + 2]) * ray[9] +
        BlueComponent(C[y - 2]) * ray[10] + BlueComponent(C[y - 1]) * ray[11] + BlueComponent(C[y])
        * ray[12] + BlueComponent(C[y + 1]) * ray[13] + BlueComponent(C[y + 2]) * ray[14] +
        BlueComponent(B[y - 2]) * ray[15] + BlueComponent(B[y - 1]) * ray[16] + BlueComponent(B[y])
        * ray[17] + BlueComponent(B[y + 1]) * ray[18] + BlueComponent(B[y + 2]) * ray[19] +
        BlueComponent(B2[y - 2]) * ray[20] + BlueComponent(B2[y - 1]) * ray[21] +
        BlueComponent(B2[y]) * ray[22] + BlueComponent(B2[y + 1]) * ray[23] + BlueComponent(B2[y +
        2]) * ray[24]
          ) div z);

      Green := Set255(
        (
        GreenComponent(T2[y - 2]) * ray[0] + GreenComponent(T2[y - 1]) * ray[1] +
        GreenComponent(T2[y]) * ray[2] + GreenComponent(T2[y + 1]) * ray[3] + GreenComponent(T2[y +
        2]) * ray[4] +
          GreenComponent(T[y - 2]) * ray[5] + GreenComponent(T[y - 1]) * ray[6] +
        GreenComponent(T[y])
        * ray[7] + GreenComponent(T[y + 1]) * ray[8] + GreenComponent(T[y + 2]) * ray[9] +
        GreenComponent(C[y - 2]) * ray[10] + GreenComponent(C[y - 1]) * ray[11] +
        GreenComponent(C[y]) * ray[12] + GreenComponent(C[y + 1]) * ray[13] + GreenComponent(C[y +
        2]) * ray[14] +
          GreenComponent(B[y - 2]) * ray[15] + GreenComponent(B[y - 1]) * ray[16] +
        GreenComponent(B[y]) * ray[17] + GreenComponent(B[y + 1]) * ray[18] + GreenComponent(B[y +
        2]) * ray[19] +
          GreenComponent(B2[y - 2]) * ray[20] + GreenComponent(B2[y - 1]) * ray[21] +
        GreenComponent(B2[y]) * ray[22] + GreenComponent(B2[y + 1]) * ray[23] + GreenComponent(B2[y
        + 2]) * ray[24]
          ) div z);

      O[y] := Color32(Red, Green, Blue);

    end;
  end;
  tBufr.Free;

end;

type
  TMMXRegister = packed record
    case Integer of
      0: (B0, B1, B2, B3, B4, B5, B6, B7: Byte);
      1: (W0, W1, W2, W3: Word);
  end;

//var
//  mmxRes: TMMXRegister;

procedure SetMMX_W(var R: TMMXRegister; Value: integer);
begin
  R.W0 := word(Value);
  R.W1 := word(Value);
  R.W2 := word(Value);
  R.W3 := word(Value);
end;
{    0:
Laplace
    1:
Hipass
    2:
Find Edges (top down)
    3:
Sharpen
    4:
Edge Enhance
    5:
Color Emboss (Sorta)
    6:
Soften
    7:
Blur
    8:
LAP1
    9:
LAP4
    10:
HP3
    11:
Find Edges (Bottom top )
    12:
Sobel hor
    13:
Sobel vert
    14:
Previt hor
    15:
Previt vert
    16:
Laplace - Origin
    17:
Gaussian Blure}

procedure ApplyConv3x3(zz: Integer; Dst: TCnsBitmap32);
{$IFDEF LEVEL6}
var
  I, J: Integer;
  A1, A2, A3, B1, B2, B3, C1, C2, C3: TColor32;
  D{, S}: TColor32;
  // Prepared An,Bn,Cn
  mvA1, mvA2, mvA3,
    mvB1, mvB2, mvB3,
    mvC1, mvC2, mvC3: TMMXRegister;
 // z: integer;
  ray: array[0..8] of integer;
  Src: TCnsBitmap32;
begin
  case zz of
    0:
      begin // Laplace
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := -1;
        ray[4] := 8;
        ray[5] := -1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
      //  z := 1;
      end;

    1:
      begin // Hipass
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := -1;
        ray[4] := 9;
        ray[5] := -1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
      //  z := 1;
      end;
    2:
      begin // Find Edges (top down)
        ray[0] := 1;
        ray[1] := 1;
        ray[2] := 1;
        ray[3] := 1;
        ray[4] := -2;
        ray[5] := 1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
      //  z := 1;
      end;
    3:
      begin // Sharpen
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := -1;
        ray[4] := 16;
        ray[5] := -1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
      //  z := 8;
      end;
    4:
      begin // Edge Enhance
        ray[0] := 0;
        ray[1] := -1;
        ray[2] := 0;
        ray[3] := -1;
        ray[4] := 5;
        ray[5] := -1;
        ray[6] := 0;
        ray[7] := -1;
        ray[8] := 0;
      //  z := 1;
      end;
    5:
      begin // Color Emboss (Sorta)
        ray[0] := 1;
        ray[1] := 0;
        ray[2] := 1;
        ray[3] := 0;
        ray[4] := 0;
        ray[5] := 0;
        ray[6] := 1;
        ray[7] := 0;
        ray[8] := -2;
      //  z := 1;
      end;
    6:
      begin // Soften
        ray[0] := 2;
        ray[1] := 2;
        ray[2] := 2;
        ray[3] := 2;
        ray[4] := 0;
        ray[5] := 2;
        ray[6] := 2;
        ray[7] := 2;
        ray[8] := 2;
      //  z := 16;
      end;
    7:
      begin // Blur
        ray[0] := 3;
        ray[1] := 3;
        ray[2] := 3;
        ray[3] := 3;
        ray[4] := 8;
        ray[5] := 3;
        ray[6] := 3;
        ray[7] := 3;
        ray[8] := 3;
      //  z := 32;
      end;

    8:
      begin // LAP1
        ray[0] := 0;
        ray[1] := 1;
        ray[2] := 0;
        ray[3] := 1;
        ray[4] := -4;
        ray[5] := 1;
        ray[6] := 0;
        ray[7] := 1;
        ray[8] := 0;
      //  z := 1;
      end;

    9:
      begin // LAP4
        ray[0] := 1;
        ray[1] := -2;
        ray[2] := 1;
        ray[3] := -2;
        ray[4] := 4;
        ray[5] := -2;
        ray[6] := 1;
        ray[7] := -2;
        ray[8] := 1;
      //  z := 1;
      end;

    10:
      begin // HP3
        ray[0] := 1;
        ray[1] := -2;
        ray[2] := 1;
        ray[3] := -2;
        ray[4] := 5;
        ray[5] := -2;
        ray[6] := 1;
        ray[7] := -2;
        ray[8] := 1;
      //  z := 1;
      end;

    11:
      begin // Find Edges (Bottom top )
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := 1;
        ray[4] := -2;
        ray[5] := 1;
        ray[6] := 1;
        ray[7] := 1;
        ray[8] := 1;
      //  z := 1;
      end;

    12:
      begin // Sobel hor
        ray[0] := 1;
        ray[1] := 2;
        ray[2] := 1;
        ray[3] := 0;
        ray[4] := 0;
        ray[5] := 0;
        ray[6] := -1;
        ray[7] := -2;
        ray[8] := -1;
      //  z := 1;
      end;

    13:
      begin // Sobel vert
        ray[0] := 1;
        ray[1] := 0;
        ray[2] := -1;
        ray[3] := 2;
        ray[4] := 0;
        ray[5] := -2;
        ray[6] := 1;
        ray[7] := 0;
        ray[8] := -1;
      //  z := 1;
      end;

    14:
      begin // Previt hor
        ray[0] := 1;
        ray[1] := 1;
        ray[2] := 1;
        ray[3] := 0;
        ray[4] := 0;
        ray[5] := 0;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
      //  z := 1;
      end;

    15:
      begin // Previt vert
        ray[0] := 1;
        ray[1] := 0;
        ray[2] := -1;
        ray[3] := 1;
        ray[4] := 0;
        ray[5] := -1;
        ray[6] := 1;
        ray[7] := 0;
        ray[8] := -1;
      //  z := 1;
      end;

    16:
      begin // Laplace - Origin
        ray[0] := -1;
        ray[1] := -1;
        ray[2] := -1;
        ray[3] := -1;
        ray[4] := 7;
        ray[5] := -1;
        ray[6] := -1;
        ray[7] := -1;
        ray[8] := -1;
      //  z := 1;
      end;

    17:
      begin //Gaussian Blure
        ray[0] := 1;
        ray[1] := 2;
        ray[2] := 1;
        ray[3] := 2;
        ray[4] := 4;
        ray[5] := 2;
        ray[6] := 1;
        ray[7] := 2;
        ray[8] := 1;
      //  z := 16;
      end;
  else
    exit;
  end;
  // w0..w3
  // B           G            R             A

  // Edge Finder
  SetMMX_W(mvA1, ray[0]);
  SetMMX_W(mvA2, ray[1]);
  SetMMX_W(mvA3, ray[2]);
  SetMMX_W(mvB1, ray[3]);
  SetMMX_W(mvB2, ray[4]);
  SetMMX_W(mvB3, ray[5]);
  SetMMX_W(mvC1, ray[6]);
  SetMMX_W(mvC2, ray[7]);
  SetMMX_W(mvC3, ray[8]);

  Src := TCnsBitmap32.Create;
  CheckParams(Src, Dst);
  Src.Assign(Dst);
  //  CheckParams(Dst, Src);
  //Dst.SetSize(Src.Width, Src.Height);

  for J := 1 to Src.Height - 2 do
    for I := 1 to Src.Width - 2 do
    begin
      A1 := Src.Pixel[I - 1, J - 1];
      A2 := Src.Pixel[I, J - 1];
      A3 := Src.Pixel[I + 1, J - 1];
      B1 := Src.Pixel[I - 1, J];
      B2 := Src.Pixel[I, J];
      B3 := Src.Pixel[I + 1, J];
      C1 := Src.Pixel[I - 1, J + 1];
      C2 := Src.Pixel[I, J + 1];
      C3 := Src.Pixel[I + 1, J + 1];

      asm
      // Const 0
      pxor mm0, mm0;
      // Clear Accumulator
      pxor mm7, mm7;

      // Process A Row
      movd mm1, [A1];      // Load Source mm1
      punpcklbw mm1, mm0   // B-W low byte == $00
      movq mm2, [mvA1];    // Load Filter mm2
      pmullw mm1, mm2;     // Mult
      paddsw mm7, mm1      // Add

      movd mm1, [A2];      // Load Source mm1
      punpcklbw mm1, mm0   // B-W low byte == $00
      movq mm2, [mvA2];    // Load Filter mm2
      pmullw mm1, mm2;     // Mult
      paddsw mm7, mm1      // Add

      movd mm1, [A3];      // Load Source mm1
      punpcklbw mm1, mm0   // B-W low byte == $00
      movq mm2, [mvA3];    // Load Filter mm2
      pmullw mm1, mm2;     // Mult
      paddsw mm7, mm1;     // Add

      // Process B Row
      movd mm1, [B1];      // Load Source mm1
      punpcklbw mm1, mm0   // B-W low byte == $00
      movq mm2, [mvB1];    // Load Filter mm2
      pmullw mm1, mm2;     // Mult
      paddsw mm7, mm1      // Add

      movd mm1, [B2];      // Load Source mm1
      punpcklbw mm1, mm0   // B-W low byte == $00
      movq mm2, [mvB2];    // Load Filter mm2
      pmullw mm1, mm2;     // Mult
      paddsw mm7, mm1      // Add

      movd mm1, [B3];      // Load Source mm1
      punpcklbw mm1, mm0   // B-W low byte == $00
      movq mm2, [mvB3];    // Load Filter mm2
      pmullw mm1, mm2;     // Mult
      paddsw mm7, mm1;     // Add

      // Process C Row
      movd mm1, [C1];      // Load Source mm1
      punpcklbw mm1, mm0   // B-W low byte == $00
      movq mm2, [mvC1];    // Load Filter mm2
      pmullw mm1, mm2;     // Mult
      paddsw mm7, mm1      // Add

      movd mm1, [C2];      // Load Source mm1
      punpcklbw mm1, mm0   // B-W low byte == $00
      movq mm2, [mvC2];    // Load Filter mm2
      pmullw mm1, mm2;     // Mult
      paddsw mm7, mm1      // Add

      movd mm1, [C3];      // Load Source mm1
      punpcklbw mm1, mm0   // B-W low byte == $00
      movq mm2, [mvC3];    // Load Filter mm2
      pmullw mm1, mm2;     // Mult
      paddsw mm7, mm1;     // Add


//      psrlw mm7, 2;        // Div 4

      // Pack back
 //     packssdw mm7,mm7
      packuswb mm7,mm7

      movd eax, mm7;
      or eax, $FF000000;       // Keep Alpha
      mov [D], eax;            // Store Result
      end;

      // Write Back
      Dst.Pixel[I, J] := D;
    end;
  asm
    EMMS;
  end;

  //Dst.Changed;
end;
{$ELSE}
begin

end;
{$ENDIF}

initialization
  SetupFunctions;
  SetGamma;
  {$IFDEF CLX}
  StockFont := TFont.Create;
  {$ELSE}
  StockFont := GetStockObject(SYSTEM_FONT);
  {$ENDIF}
  StockBitmap := TBitmap.Create;
  StockBitmap.Width := 8;
  StockBitmap.Height := 8;
  SetupFunctions1;

finalization
  {$IFDEF CLX}
  StockFont.Free;
  {$ENDIF}
  StockBitmap.Free;

end.

