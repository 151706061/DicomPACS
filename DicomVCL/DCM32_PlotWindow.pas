unit DCM32_PlotWindow;

{
Several components based on Grafics32 library (1.8.1):
 TPlotWindow32 - plot with antialiasing of wave. And many another properties
 TPlotPanel - container for PlotWindow32 component
 TFFTPlot32	- for spectrum or bars presentation
Developer:
 Andrew Atamanuk
Version:
 0.8.6.1 beta
Date:
 2007-01-30
e-mail:
 atamanuk@pochta.ru
web:
 http:\\atamanuk.vdmk.com

Comments in russian. If you want to translate it ->  http://www.online-translator.com/text.asp?lang=en

* Component TPLotWindow32 is using GLOBAL hotkey "Ctrl + +" and  "Ctrl + -" at present.
If you make changes that will use local hotkey, please inform me about this. (with source code :)

* Components structure may changed in future versions

Good luck!
}

{
History
0.8.6 beta 	2007-01-30
- first beta realese
0.8.6.1 beta 	2007-06-01
- fixed bug "incorrect loading property" Plot.YMax..Plot.XMin"
- added Text and Position properties to the record TMarker
}

interface

uses
  DCM32, Windows, SysUtils, Classes, Controls, Graphics, Forms,
  Math, Messages, ExtCtrls, Buttons, DCM32_Blend, Menus;

{$DEFINE OTLADKA}

const
  PLOT_MAX_VALUE = 1E+20;
  PLOT_ERR_VALUE = 1E+21;
  PLOT_MAX_COORD = 30000;
  PLOT_ERR_COORD = -2147483647;
  //  PLOT_ERR_CRD_X = -1;
  PLOT_ERR_CRD_Y = -2147483647;

  PLOT_ERR_LOG = -1000;

  PLOTLeftAxis = 60;
  PLOTBottomAxis = 40;
  PLOTMargin = 25;

  PLOTXMinAxis = 32; //
  PLOTYMinAxis = 16; //

  PLOTXNormAxis = 50;
  PLOTYNormAxis = 20;

  PLOTCountDigits = 4;

  // Plot step Accuracy
  PLOTStepAccuracy = 0.00005; // ~ (99.99 - 99.98)/(99.99 + 99.98)

  clPLOTData32 = clRed32;
  clPLOTData = clRed;
  clPLOTAxis32 = clGreen32;
  clPLOTAxis = clGreen;
  clPLOTGrid32 = $FF808080;
  clPLOTGrid = $00808080;
  clPLOTText32 = $FF0000FF;
  clPLOTText = $00FF0000;

  ScaleArr: array[0..3] of single = (1, 2.5, 5, 10);
  //ScaleArr : array[0..7]of single = (1, 1.25, 2, 2.5, 4, 5, 7.5, 10);

  MAX_DATA_SIZE = 256 * 1024 * 1024;

  WM_SETSTYLE = WM_USER + 222;

type
  TDataType = (dtWave, dtFFT); //, dtWaterFall

  TPlotStyle = (pstLine, pstSolid); // Defaults is sfLine
  TPlotTypeLine = (ptlNone, ptlAA); // Whith AntiAliasing or not
  TPlotInterpolationStyle = (pisNone, pisStraightLine, pisCubicSpline, pisPolynomial, pisRational, pisDifferential);
  TPlotWindowMode = (pwmScale, pwmCursor);
  TRMouseMode = (rmHand, rmMenu);

  TPlotAxisMode = (pamLine, pamPlus, pamRuler); // pamDent
  TLogMode = (plmNone, plmLOG, plmDB);

  {

  TAxisPoint = record
    Position : integer;
    Value : single;
    //ValueStr : String;
   end;
  }

  TBoundPopupMenu = class(TPopupMenu)
  private

  protected

  public
    constructor Create(AOwner: TComponent); override;
  published

  end;

  TCustomPlot32 = class(TCnsCustomPaintBox32)
  private
    { Private declarations }
    FBackColor: TColor;
    FContrast: Integer;
    FFramed: Boolean;
    FCaptionY: string;
    FCaptionX: string;
    FRect, FPlotRect: TRect;
    FCaption: string;
    FFrameColor: TColor;
    FFrameColor32: TColor32;

    procedure SetContrast(Value: Integer);
    procedure SetFramed(Value: Boolean);
    procedure SetCaptionX(const Value: string);
    procedure SetCaptionY(const Value: string);
    procedure SetCaption(const Value: string);

    procedure SetFontColor(const Value: TColor);
    procedure SetBackColor(const Value: TColor);
    procedure SetFrameColor(const Value: TColor);
  protected
    { Protected declarations }

    function GetPlotRect: TRect;
    function GetRect: TRect;
    procedure DoPaintBuffer; override;
    procedure PaintPlotGradient(Buffer: TCnsBitmap32; ARect: TRect);

    property Rect: TRect read FRect;
    property PlotRect: TRect read FPlotRect;
  public
    { Public declarations }
    procedure SetCaptions(const Cap, CapX, CapY: string);

    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }

    property Caption: string read FCaption write SetCaption;
    property CaptionX: string read FCaptionX write SetCaptionX;
    property CaptionY: string read FCaptionY write SetCaptionY;
    property FontColor: TColor write SetFontColor;
    property Contrast: Integer read FContrast write SetContrast default 64;
    property Framed: Boolean read FFramed write SetFramed default True;
    property FrameColor: TColor read FFrameColor write SetFrameColor;
    property BackColor: TColor read FBackColor write SetBackColor;

    property Align;
    property Anchors;
    // property BackColor;
    property Color;
    property Constraints;
    property Cursor;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Font;
    property Height default 200;
    property HelpContext;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;

    property ShowHint;
    property Visible;
    property Width default 400;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

  TdB_Mode = (dbmNormal, dbmLog);

  TData = class(TObject)
  private
    FSize: integer;
    FScale: single;
    FMin: single;
    FMax: single;

    FSamplingRate: single;
    FPeriod: single;
    FDataType: TDataType;
    FdB_Zero: single;
    FdB_Mode: TdB_Mode;

    function GetPoint(i: integer): single;
    procedure SetPoint(i: integer; const Value: single);
    procedure SetScale(const Value: single);
    procedure SetdB_Mode(const Value: TdB_Mode);
  protected
    // procedure Invalidate;
  public

    FPoint: array of single;

    procedure SetAllParams(Size: integer; Min, SamplingRate: single; DataType: TDataType; const db_Zero: single = 1.0);

    procedure SetMinMax(const Min, Max: single);

    property Size: integer read FSize;

    property Point[i: integer]: single read GetPoint write SetPoint;

    property Scale: single read FScale write SetScale;

    property Min: single read FMin;

    property Max: single read FMax;

    property SamplingRate: single read FSamplingRate;

    property DataType: TDataType read FDataType;

    property Period: single read FPeriod;

    property dB_Zero: single read FdB_Zero;

    property dB_Mode: TdB_Mode read FdB_Mode write SetdB_Mode;

    constructor Create;
  end;

  { Forward declaration }
  TPlotWindow32 = class;

  TMarkerTextPosition = (mtpLeftTop, mtpCenterTop, mtpRightTop,
    mtpLeftMiddle, mtpCenterMiddle, mtpRightMiddle,
    mtpLeftBottom, mtpCenterBottom, mtpRightBottom);

  TMarker = packed record
    freq: double;
    dev: double;
    width: word;
    color: TColor;
    text: string[127]; //  array [0 .. 127] of char
    position: TMarkerTextPosition;
  end;

  TPlot = class(TPersistent)
  private
    Owner: TPlotWindow32;

    Data: TData;

    logData: TData;
    CaptionOldY: string;
    oldcaption: boolean;

    Bitmap: TCnsBitmap32;

    FRect: TRect;
    FPlotRect: TRect;
    WidthPlotRect: integer;
    HeightPlotRect: integer;

    aPoints: TArrayOfPoint;
    aMin, aMax {, aPos}: array of single;
    aPointsCount: integer;

    FValid: boolean;
    FYTextEnabled: boolean; // Y (Vertical)
    FXTextEnabled: boolean; // X (Horizontal)

    FXMin: Double; //
    FYMax: Double; //
    FXMax: Double; //
    FYMin: Double; //

    load_XMin: Double; //
    load_YMax: Double; //
    load_XMax: Double; //
    load_YMin: Double; //

    FStyle: TPlotStyle;
    FTypeLine: TPlotTypeLine;
    FLogMode: TLogMode;

    FXAxisPointPosition: array of integer;
    FXAxisPoint: array of single;
    FXAxisPointEnable: array of boolean;
    FXAxisPointCount: integer;
    FXAccuracy: integer;
    FXGridEnabled: boolean;

    FYAxisPoint: array of single;
    FYAxisPointPosition: array of integer;
    FYAxisPointEnable: array of boolean;
    FYAxisPointCount: integer;
    FYAccuracy: integer;
    FYGridEnabled: boolean;
    FAxisMode: TPlotAxisMode;
    FMarkerCount: Word;
    FInterpolationStyle: TPlotInterpolationStyle;

    procedure SetXMax(const Value: Double);
    procedure SetXMin(const Value: Double);

    procedure SetYMax(const Value: Double);
    procedure SetYMin(const Value: Double);

    procedure SetXAxisPointCount(const Value: integer);
    procedure SetYAxisPointCount(const Value: integer);

    procedure SetXGridEnabled(const Value: boolean);
    procedure SetYGridEnabled(const Value: boolean);

    procedure SetStyle(const Value: TPlotStyle);
    procedure SetTypeLine(const Value: TPlotTypeLine);
    procedure SetAxisMode(const Value: TPlotAxisMode);

    property XAxisPointCount: integer read FXAxisPointCount write SetXAxisPointCount;
    property YAxisPointCount: integer read FYAxisPointCount write SetYAxisPointCount;
    procedure SetMarkerCount(const Value: Word);
    procedure SetInterpolationStyle(const Value: TPlotInterpolationStyle);
    procedure SetLogMode(const Value: TLogMode);

    procedure SetXTextEnabled(const Value: boolean);
    procedure SetYTextEnabled(const Value: boolean);
  protected
    procedure XCalcAxisPoints;
    procedure YCalcAxisPoints;
    procedure CalcPixelArray;
    procedure PaintPLOT;
    procedure PaintAXIS;

    procedure PaintMarker(ind: integer);
    procedure PaintMarkers;

    function GetY(x: double): single;

    function GetXIndex(X: Double): integer;

    function GetXCoord(X: Double): integer;

    function GetYCoord(Y: Double): integer;

    procedure GetPoint(const pixel: TPoint; var X, Y: double);
    // GetYZeroCoord()
    function GetYZeroCoord(): integer;

    function isZeroCheck(Mx, Mn: single): boolean;

    procedure DataRefresh(const Mode: TLogMode);

  public
    Markers: array of TMarker;

    procedure ZoomIn; overload;
    procedure ZoomOut; overload;
    procedure ZoomIn(xE, yE: boolean); overload;
    procedure ZoomOut(xE, yE: boolean); overload;
    procedure Zoom(const Scale: Single);
    procedure ZoomXY(const XScale, YScale: Single);
    function ZoomTo(const XMin, XMax, YMin, YMax: Double): boolean;
    function ZoomOnePointToPixel(): boolean;
    function Zoom100percent(): boolean;

    procedure Invalidate(Render: Boolean = True);
    procedure Paint(const ARect, APlotRect: TRect);
    procedure RefreshData;
    constructor Create(AOwner: TPlotWindow32);
    destructor Destroy; override;
  published
    property AxisMode: TPlotAxisMode read FAxisMode write SetAxisMode;

    property InterpolationStyle: TPlotInterpolationStyle read FInterpolationStyle write SetInterpolationStyle;
    property MarkerCount: Word read FMarkerCount write SetMarkerCount;
    property Style: TPlotStyle read FStyle write SetStyle default pstLine;
    property TypeLine: TPlotTypeLine read FTypeLine write SetTypeLine default ptlAA;
    property LogMode: TLogMode read FLogMode write SetLogMode;

    property XMin: Double read FXMin write SetXMin;
    property XMax: Double read FXMax write SetXMax;
    property XGridEnabled: boolean read FXGridEnabled write SetXGridEnabled default True;
    property XTextEnabled: boolean read FXTextEnabled write SetXTextEnabled;

    property YMin: Double read FYMin write SetYMin;
    property YMax: Double read FYMax write SetYMax;
    property YGridEnabled: boolean read FYGridEnabled write SetYGridEnabled default True;
    property YTextEnabled: boolean read FYTextEnabled write SetYTextEnabled;
  end;

  TPlotWindow32 = class(TCustomPlot32)
  private
    { Private declarations }
    FMode: TPlotWindowMode;

    BeginZooming: boolean;
    BeginMoving: boolean;
    XStart, XMove, YStart, YMove: integer;
    FCursorColor: TColor;

    FPopupMenu: TBoundPopupMenu;
    FRMouseMode: TRMouseMode;

    FPlot: TPlot;
    //FAutoFill: Boolean;

    procedure DoMouseDown(var Message: TWMMouse; Button: TMouseButton;
      Shift: TShiftState);
    procedure DoMouseUp(var Message: TWMMouse; Button: TMouseButton);
    procedure WMRButtonUp(var Message: TWMRButtonUp); message WM_RBUTTONUP;
    procedure WMRButtonDown(var Message: TWMRButtonDown); message WM_RBUTTONDOWN;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;

    function GetCursorColor: TColor;
    procedure SetCursorColor(const Value: TColor);
    //procedure SetAutoFill(const Value: Boolean);
    procedure SetRMouseMode(const Value: TRMouseMode);
  protected
    { Protected declarations }

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

    procedure PopupClick(Sender: TObject);
  public
    { Public declarations }
    Data: TData;

    procedure DoPaintBuffer; override;
    procedure Loaded; override;

    // property internalPopupMenu : TBoundPopupMenu read FPopupMenu;
    procedure RefreshData;
    procedure Invalidate; override;
    procedure Resize; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Align;
    property Anchors;
    property BackColor default clWhite;
    // property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle;
    property Caption;
    property Color;
    property Constraints;
    property Contrast default 64;
    property Cursor;
    property CursorColor: TColor read GetCursorColor write SetCursorColor default clYellow;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Font;
    property Framed default True;
    property Height default 200;
    property HelpContext;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    // property PopupMenu;

    // property AutoFill : Boolean read FAutoFill write SetAutoFill;
    property RMouseMode: TRMouseMode read FRMouseMode write SetRMouseMode;
    property Plot: TPlot read FPlot write FPlot;

    property ShowHint;
    property Visible;
    property Width default 400;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

type
  TLevel = packed record
    max: single;
    position: single;
    fmin: single;
    fmax: single;
  end;

  // mean square value Fast Fourier Transform PLOT Plot
  TFFTPlot32 = class(TCustomPlot32)
  private
    { Private declarations }
    FLogScale: boolean;
    FLevelCount: word;
    FFreqMin: single;
    FMaxAmp: single;
    FFreqMax: single;
    FColorMin: TColor;
    FColorMid1: TColor;
    FColorMax: TColor;
    FColorMid2: TColor;
    FMinAmp: single;

    procedure SetFreqMax(const Value: single);
    procedure SetFreqMin(const Value: single);
    procedure SetLevelCount(const Value: word);
    procedure SetLogScale(const Value: boolean);
    procedure SetMaxAmp(const Value: single);
    procedure SetMinAmp(const Value: single);
    procedure SetColorMax(const Value: TColor);
    procedure SetColorMid1(const Value: TColor);
    procedure SetColorMid2(const Value: TColor);
    procedure SetColorMin(const Value: TColor);
  protected
    { Protected declarations }
    procedure PaintLevel(ind: integer; var OldTextCoord: integer);
    procedure PaintLevels;
    procedure DoPaintBuffer; override;
  public
    { Public declarations }
    Levels: array of TLevel;

    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property ColorMax: TColor read FColorMax write SetColorMax default clRed;
    property ColorMid1: TColor read FColorMid1 write SetColorMid1 default TColor($00EEEE);
    property ColorMid2: TColor read FColorMid2 write SetColorMid2 default TColor($0080FF);
    property ColorMin: TColor read FColorMin write SetColorMin default clGreen;

    property LevelCount: word read FLevelCount write SetLevelCount;
    property MaxAmp: single read FMaxAmp write SetMaxAmp;
    property MinAmp: single read FMinAmp write SetMinAmp;
    property FreqMin: single read FFreqMin write SetFreqMin;
    property FreqMax: single read FFreqMax write SetFreqMax;
    property LogScale: boolean read FLogScale write SetLogScale;

    property Align;
    property Anchors;
    property BackColor default clWhite;
    property Caption;
    property Color;
    property Constraints;
    property Contrast default 64;
    property Cursor;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Font;
    property Framed default True;
    property Height default 200;
    property HelpContext;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property Width default 400;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

const
  btnCount = 19;
  btnHandMode = 0;
  btnMenuMode = 1;
  //------------------
  btnSettin = 3;
  //------------------
  btnZoomX = 5;
  btnZoomY = 6;
  btnZoomIn = 7;
  btnZoomOut = 8;
  //------------------
  btnGridRuler = 10;
  btnGridPlus = 11;
  btnGridX = 12;
  btnGridY = 13;
  //------------------
  btnGrLogdB = 15;
  //------------------
  btnLineMode = 17;

type
  TBottomLine = (blNone, blLine, blDblLine, blDot, blDblDot);

  TPlotPanel = class(TCustomPanel)
  private
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    HotKey_id1, HotKey_id2: integer;
    HotkeySet: Boolean;

    FButtonsHeight: Integer;
    FPlotWindow: TPlotWindow32;
    Buttons: array[0..btnCount - 1] of TSpeedButton;
    FHold: boolean;
    FBottomLine: TBottomLine;

    // procedure WmMenuChar(var Message: TWMKey); message WM_MENUCHAR;
    // procedure CMShortCut(var Message: TWMKey); message CM_APPKEYDOWN;
    procedure WMHotkey(var Mes: TWMHotkey); message WM_HOTKEY;
    procedure WMSetStyle(var Mes: TMessage); message WM_SETSTYLE;
    procedure WMDestroy(var Mes: TWMDestroy); message WM_DESTROY;

    procedure SetPlotWindow(Value: TPlotWindow32);
    procedure SetHold(const Value: boolean);
    procedure SetBottomLine(const Value: TBottomLine);

  protected
    procedure SetParent(AParent: TWinControl); override;
    procedure ButtonClick(Sender: TObject);
    procedure Paint; override;
    procedure ResizeButtons;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetName(const Value: TComponentName); override;

    // procedure PlotDestroy(Sender : TObject);
  public
    // function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure Resize; override;
    function ClickButton(Button: word): boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property Align;
    property Alignment;
    property Anchors;
    // property AutoSize;
    property BevelInner;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
    property BorderStyle;
    property Color;
    property Constraints;
    property Ctl3D;
    property UseDockManager default True;
    property DockSite;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;

    property Height default 200;
    property Width default 400;
    property PlotWindow: TPlotWindow32 read fPlotWindow write SetPlotWindow;
    property Hold: boolean read FHold write SetHold default False;
    property BottomLine: TBottomLine read FBottomLine write SetBottomLine default blLine;

    property FullRepaint;
    property Font;
    property Locked;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;
function FloatToStrG(f: Single; Precision, Digits: Integer): string;
procedure Frexp10(const X: Single; var Mantissa10: Single; var Exponent10: Integer);

implementation

{$R DCM_BUTTONS.RES}

uses Types, addCursr;

{ TCustomPlot32 }

function FloatToStrG(f: Single; Precision, Digits: Integer): string;
var
  sgn: TValueSign;
  s: string[3];
begin
  // if IsZero(f, 1.000001e-18)then
  sgn := Sign(f);
  if sgn = -1 then
    f := -f;
  s := '';
  if f < 9.99999E-19 then
  begin
  end
  else
    if f < 9.99999E-13 then // exp:=-15;
  begin f := f * 1E+15;
    s := 'f'
  end
  else
    if f < 9.99999E-10 then // exp:=-12;
  begin f := f * 1E+12;
    s := 'p';
  end
  else
    if f < 9.99999E-7 then // exp:=-9;
  begin f := f * 1E+9;
    s := 'n';
  end
  else
    if f < 9.99999E-4 then // exp:=-6;
  begin f := f * 1E+6;
    s := 'u';
  end
  else
    if f < 0.999999 then // exp:=-3;
  begin f := f * 1E+3;
    s := 'm';
  end
  else
    if f < 1000 then // exp:=0;
  begin
  end
  else
    if f < 9.99999E+5 then // exp:=+3;
  begin f := f * 1E-3;
    s := 'K'
  end
  else
    if f < 9.99999E+8 then // exp:=+6;
  begin f := f * 1E-6;
    s := 'MEG'
  end
  else
    if f < 9.99999E+11 then // exp:=+9;
  begin f := f * 1E-9;
    s := 'G'
  end
  else
    if f < 9.99999E+14 then // exp:=+12; 
  begin f := f * 1E-12;
    s := 'T'
  end
  else
    if f < 9.99999E+17 then // exp:=+15;
  begin f := f * 1E-15;
    s := 'E15'
  end;

  if sgn = -1 then
    f := -f;
  if sgn = 0 then
    result := '0'
  else
    result := FloatToStrF(f, ffGeneral, Precision, Digits) + s;
end;

procedure Frexp10(const X: Single; var Mantissa10: Single; var Exponent10: Integer);
begin
  if (x <> 0) then
    Exponent10 := Floor(Log10(abs(X)))
  else
    Exponent10 := 0;
  Mantissa10 := X / IntPower(10.0, Exponent10);
  if Abs(Mantissa10) >= 10.0 then
  begin
    Mantissa10 := Mantissa10 / 10.0;
    Inc(Exponent10);
  end;
end;

constructor TCustomPlot32.Create(AOwner: TComponent);
begin
  inherited;

  Width := 400;
  Height := 200;
  FBackColor := clWhite;
  FContrast := 64;
  Color := $C0C0C0;
  Buffer.Font.Color := clPLOTText;
  FFramed := True;

  Caption := 'Atamanuk`s Plot';
  CaptionX := 'Hz';
  CaptionY := 'V';

  FrameColor := clWindowFrame;
end;

function TCustomPlot32.GetRect: TRect;
begin
  Result := ClientRect;
  if Framed then
    InflateRect(Result, -1, -1);
end;

function TCustomPlot32.GetPlotRect: TRect;
begin
  Result := GetRect;
  Result.Left := Result.Left + PLOTLeftAxis;
  Result.Bottom := Result.Bottom - PLOTBottomAxis;
  Result.Right := Result.Right - PLOTMargin;
  Result.Top := Result.Top + PLOTMargin;
end;

procedure TCustomPlot32.PaintPlotGradient(Buffer: TCnsBitmap32; ARect: TRect);
var
  Clr, LineColor: TColor32;
  I, CY, H: Integer;
begin
  if IsRectEmpty(ARect) then
    Exit;

  Clr := Color32(Color);

  if Contrast <> 0 then
  begin
    with ARect do
    try
      H := Bottom - Top;
      CY := (Top + Bottom) div 2;
      for I := Top to Bottom - 1 do
      begin
        LineColor := Lighten(Clr, (CY - I) * Contrast div H);
        Buffer.HorzLineS(Left, I, Right - 1, LineColor);
      end;
    finally
      //      EMMS; // the low-level blending function was used EMMS is required
    end;
  end
  else
    Buffer.FillRectS(ARect, Clr);
end;

procedure TCustomPlot32.SetBackColor(const Value: TColor);
begin
  FBackColor := Value;
  invalidate;
end;

procedure TCustomPlot32.SetCaptionX(const Value: string);
begin
  FCaptionX := Value;
  Invalidate;
end;

procedure TCustomPlot32.SetCaptionY(const Value: string);
begin
  FCaptionY := Value;
  Invalidate;
end;

procedure TCustomPlot32.SetCaption(const Value: string);
begin
  FCaption := Value;
  invalidate;
end;

procedure TCustomPlot32.SetContrast(Value: Integer);
begin
  FContrast := Value;
  Invalidate;
end;

procedure TCustomPlot32.SetFontColor(const Value: TColor);
begin
  Buffer.Font.Color := Value;
  Invalidate;
end;

procedure TCustomPlot32.SetFramed(Value: Boolean);
begin
  FFramed := Value;
  Invalidate;
end;

procedure TCustomPlot32.DoPaintBuffer;
begin
  inherited;
  FRect := ClientRect;
  if IsRectEmpty(FRect) then
    Exit;
  //**********************************************************/
  if Framed then
  begin
    Buffer.FrameRectS(FRect, FFrameColor32);
    InflateRect(FRect, -1, -1);
  end;
  if IsRectEmpty(FRect) then
    Exit
  else
    Buffer.ClipRect := FRect;

  Buffer.FillRectS(FRect, Color32(BackColor));
  FPlotRect := GetPlotRect;

  //**********************************************************/
  PaintPlotGradient(Buffer, FPlotRect);
  Buffer.FrameRectS(FPlotRect, clPLOTGrid32);

  //**********************************************************/
  with Buffer do
  begin
    Textout(FRect.Right div 2 - TextWidth(Caption) div 2, FRect.Top + 3, Caption);
    Textout(FPlotRect.Right + 2, FPlotRect.Bottom - PLOTMargin div 2, CaptionX);
    Textout(FPlotRect.Left + 3 - TextWidth(CaptionY), FPlotRect.Top - 20, CaptionY);
  end;
end;

procedure TCustomPlot32.SetCaptions(const Cap, CapX, CapY: string);
begin
  FCaption := Cap;
  FCaptionX := CapX;
  FCaptionY := CapY;
  Invalidate;
end;

procedure TCustomPlot32.SetFrameColor(const Value: TColor);
begin
  FFrameColor := Value;
  FFrameColor32 := Color32(FFrameColor);
  invalidate;
end;

{ TPlotWindow32 }

var
  tempXWidth, tempYWidth: integer;
  tempXMin, tempXMax, tempYMin, tempYMax: single;
  tempXLength, tempYLength: single;
  save_cursor: tCursor;
  // XPos, YPos : integer;
  XPos, YPos: integer;
  CurPainted, ButPress: boolean;
  h_text, w_text: integer;

constructor TPlotWindow32.Create(AOwner: TComponent);
begin
  inherited;
  Data := TData.Create;
  FPlot := TPlot.Create(Self);

  BeginMoving := false;
  BeginZooming := false;
  XStart := 0;
  XMove := 0;
  YStart := 0;
  YMove := 0;
  CurPainted := False;
  CursorColor := clBlue; //clYellow  clBlack
  ButPress := False;
  FMode := pwmScale;
  FRMouseMode := rmHand;
  h_text := 0;
  w_text := 0;
  FPopupMenu := TBoundPopupMenu.Create(Self);
  with FPopupMenu.Items do
  begin //(scAlt+VK_SUBTRACT)
    Add(NewItem('Zoom In', (scCtrl + VK_ADD), False, True, PopupClick, 0, 'pmZoomIn'));
    Add(NewItem('Zoom Out', (scCtrl + VK_SUBTRACT), False, True, PopupClick, 0, 'pmZoomOut'));
    Add(NewLine);
    Add(NewItem('Fix', 0, False, True, PopupClick, 0, 'pmZoom1to1'));
    Add(NewItem('100%', 0, False, True, PopupClick, 0, 'pmZoom100percent'));
  end;
  FPopupMenu.AutoPopup := False;
  FPopupMenu.AutoHotkeys := maManual; // maAutomatic

  PopupMenu := FPopupMenu;
end;

procedure TPlotWindow32.DoPaintBuffer;
begin
  inherited;
  FPlot.Paint(Rect, PlotRect);
end;

//****************************************************************************//

procedure TPlotWindow32.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  XStart := X;
  YStart := Y;
  XMove := 0;
  YMove := 0;

  ButPress := True;
  if (CurPainted) then
  begin
    Canvas.Pen.Color := FCursorColor;
    Canvas.Pen.Style := psDot;
    Canvas.Pen.Mode := pmXor;
    Canvas.Brush.Style := bsClear;
    Canvas.MoveTo(XPos, Plot.FPlotRect.Top);
    Canvas.LineTo(XPos, Plot.FPlotRect.Bottom - 2);
    Canvas.MoveTo(Plot.FPlotRect.Left, YPos);
    Canvas.LineTo(Plot.FPlotRect.Right - 2, YPos);
    CurPainted := False;
  end;

  tempXWidth := Plot.FPlotRect.Right - 1 - Plot.FPlotRect.Left;
  tempYWidth := Plot.FPlotRect.Bottom - 1 - Plot.FPlotRect.Top;
  tempXMax := Plot.FXMax;
  tempXMin := Plot.FXMin;
  tempXLength := tempXMax - tempXMin;
  tempYMax := Plot.FYMax;
  tempYMin := Plot.FYMin;
  tempYLength := tempYMax - tempYMin;

  if (Button = mbLeft) and (PtInRect(Plot.FPlotRect, Point(X, Y))) then
  begin
    BeginZooming := True;

    save_cursor := Screen.cursor;
    Screen.cursor := crSelect;
    Application.ProcessMessages;
    // invalidate;
  end;

  if (FRMouseMode = rmHand) and (Button = mbRight) and (PtInRect(Plot.FPlotRect, Point(X, Y))) then
  begin
    BeginMoving := true;
    Self.Cursor := crHandGrab2;
  end;
  inherited;
end;

procedure TPlotWindow32.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  tempX, tempY: double;
  str: string;
begin
  inherited;
  if BeginZooming then
  begin
    with Canvas do
    begin
      Pen.Color := FCursorColor;
      Pen.Style := psDot;
      Pen.Mode := pmXor;
      Brush.Style := bsClear;

      MoveTo(XStart, YStart);
      LineTo(XStart + XMove, YStart);
      MoveTo(XStart + XMove, YStart);
      LineTo(XStart + XMove, YStart + YMove);
      MoveTo(XStart, YStart);
      LineTo(XStart, YStart + YMove);
      MoveTo(XStart, YStart + YMove);
      LineTo(XStart + XMove, YStart + YMove);

      if (X > Plot.FPlotRect.Right - 1) then
        X := Plot.FPlotRect.Right - 1
      else
        if (X < Plot.FPlotRect.Left) then
        X := Plot.FPlotRect.Left;
      XMove := X - XStart;
      if (Y > Plot.FPlotRect.Bottom - 1) then
        Y := Plot.FPlotRect.Bottom - 1
      else
        if (Y < Plot.FPlotRect.Top) then
        Y := Plot.FPlotRect.Top;
      YMove := Y - YStart;

      MoveTo(XStart, YStart);
      LineTo(XStart + XMove, YStart);
      MoveTo(XStart + XMove, YStart);
      LineTo(XStart + XMove, YStart + YMove);
      MoveTo(XStart, YStart);
      LineTo(XStart, YStart + YMove);
      MoveTo(XStart, YStart + YMove);
      LineTo(XStart + XMove, YStart + YMove);
    end;
  end
  else
    if BeginMoving then
  begin
    XMove := XStart - X;
    YMove := YStart - Y;
    tempX := tempXLength * XMove / tempXWidth;
    tempY := tempYLength * YMove / tempYWidth;

    if not Plot.ZoomTo(tempXMin + tempX,
      tempXMax + tempX,
      tempYMin - tempY,
      tempYMax - tempY
      )
      then
    begin
      Self.Cursor := crDefault;
      //Screen.Cursor := crDefault;
      BeginMoving := False;
      Plot.Zoom100percent;
    end;
  end
  else
  begin

    if CurPainted then
    begin
      Canvas.Pen.Color := FCursorColor;
      Canvas.Pen.Style := psDot;
      Canvas.Pen.Mode := pmXor;
      Canvas.Brush.Style := bsClear;
      Canvas.MoveTo(XPos, Plot.FPlotRect.Top);
      Canvas.LineTo(XPos, Plot.FPlotRect.Bottom - 1);
      Canvas.MoveTo(Plot.FPlotRect.Left, YPos);
      Canvas.LineTo(Plot.FPlotRect.Right - 1, YPos);
    end;

    if (X > Plot.FPlotRect.Right - 1) then
      X := -1
    else
      if (X < Plot.FPlotRect.Left) then
      X := -1;
    XPos := X;

    if (Y > Plot.FPlotRect.Bottom - 1) then
      Y := -1
    else
      if (Y < Plot.FPlotRect.Top) then
      Y := -1;
    YPos := Y;

    if not ButPress then
    begin
      if (XPos > 0) and (YPos > 0) then
        with Canvas do
        begin
          Pen.Color := FCursorColor;
          Pen.Style := psDot;
          Pen.Mode := pmXor;
          Brush.Style := bsClear;
          MoveTo(XPos, Plot.FPlotRect.Top);
          LineTo(XPos, Plot.FPlotRect.Bottom - 1);
          MoveTo(Plot.FPlotRect.Left, YPos);
          LineTo(Plot.FPlotRect.Right - 1, YPos);
          CurPainted := True;
        end
      else
        CurPainted := False;
    end
    else
      ButPress := False;
  end;
  if not BeginMoving then
    with Canvas do
    begin
      Pen.Color := BackColor;
      Pen.Style := psSolid;
      Pen.Mode := pmCopy;
      Brush.Color := BackColor;
      Brush.Style := bsSolid;
      Rectangle((Rect.right - w_text) div 2 - 22,
        Rect.Bottom - 1 - h_text, (Rect.right + w_text) div 2,
        Rect.Bottom - 1);

      Plot.GetPoint(Point(X, Y), tempX, tempY);
      str := 'X = ' + FloatToStrG(tempX, 6, 3) + CaptionX +
        ' ; Y = ' + FloatToStrG(tempY, 6, 3) + CaptionY;
      h_text := Canvas.TextHeight(str);
      w_text := Canvas.TextWidth(str);
      Font.Color := clPLOTText;
      TextOut((Rect.right - w_text) div 2 - 22, Rect.Bottom - 1 - h_text, str);
    end;

end;

procedure TPlotWindow32.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var //bool : boolean;
  XMin, XMax, YMin, YMax: double;
begin
  inherited;

  if BeginZooming then
  begin
    Screen.Cursor := save_cursor;
    //  Self.cursor := crDefault;//crSelect;
    BeginZooming := false;

    if (XMove = 0) and (YMove = 0) then
      Exit;

    if (XMove < 0) or (YMove < 0) then
      Plot.Zoom100percent
    else
    begin
      //if YMove=0 then YMove := 1
      //if XMove=0 then XMove := 1
      Plot.GetPoint(Point(XStart, YStart), XMin, YMax);
      Plot.GetPoint(Point(XStart + XMove, YStart + YMove), XMax, YMin);
      Plot.ZoomTo(XMin, XMax, YMin, YMax);
    end;
  end
  else
    if BeginMoving then
  begin
    Self.Cursor := crDefault;
    //Screen.Cursor := crDefault;
    BeginMoving := False;
  end
  else
  begin

  end;
end;

//****************************************************************************//
//****************************************************************************//
//****************************************************************************//

procedure TPlotWindow32.WMRButtonDown(var Message: TWMRButtonDown);
var
  temp: TControlState;
begin
  SendCancelMode(Self);
  inherited;
  if csCaptureMouse in ControlStyle then
    MouseCapture := True;
  if csClickEvents in ControlStyle then
  begin
    temp := ControlState;
    Include(temp, csClicked);
    ControlState := temp;
  end;
  DoMouseDown(Message, mbRight, []);
end;

procedure TPlotWindow32.DoMouseDown(var Message: TWMMouse; Button: TMouseButton;
  Shift: TShiftState);
begin
  if not (csNoStdEvents in ControlStyle) then
    with Message do
      if (Width > 32768) or (Height > 32768) then
        with CalcCursorPos do
          MouseDown(Button, KeysToShiftState(Keys) + Shift, X, Y)
      else
        MouseDown(Button, KeysToShiftState(Keys) + Shift, Message.XPos, Message.YPos);
end;

procedure TPlotWindow32.DoMouseUp(var Message: TWMMouse; Button: TMouseButton);
begin
  if not (csNoStdEvents in ControlStyle) then
    with Message do
      MouseUp(Button, KeysToShiftState(Keys), XPos, YPos);
end;

procedure TPlotWindow32.WMRButtonUp(var Message: TWMRButtonUp);
  function SmallPointToPoint(point: TSmallPoint): TPoint;
  begin
    Result.X := Point.X;
    Result.X := Point.Y;
  end;
var
  temp: TControlState;
begin
  inherited;
  if csCaptureMouse in ControlStyle then
    MouseCapture := False;
  if csClicked in ControlState then
  begin
    temp := ControlState;
    Exclude(temp, csClicked);
    ControlState := temp;
    if DCM32.PtInRect(ClientRect, SmallPointToPoint(Message.Pos)) then
      Click;

  end;
  DoMouseUp(Message, mbRight);
end;

procedure TPlotWindow32.Resize;
begin
  inherited;
  Plot.FValid := False;
end;

destructor TPlotWindow32.Destroy;
begin
  Plot.Free;
  Data.Free;
  FPopupMenu.Free;
  inherited;
end;

procedure TPlotWindow32.SetRMouseMode(const Value: TRMouseMode);
begin
  FRMouseMode := Value;
  if PopupMenu <> nil then
    if FRMouseMode = rmHand then
      PopupMenu.AutoPopup := False
    else
      if FRMouseMode = rmMenu then
      PopupMenu.AutoPopup := True;
end;

procedure TPlotWindow32.Invalidate;
begin
  inherited;
  // RefreshData;
  CurPainted := False;
end;

function TPlotWindow32.GetCursorColor: TColor;
begin
  Result := $00FFFFFF xor FCursorColor;
end;

procedure TPlotWindow32.SetCursorColor(const Value: TColor);
begin
  FCursorColor := $00FFFFFF xor Value;
end;

procedure TPlotWindow32.CMMouseLeave(var Message: TMessage);
begin
  //
end;

procedure TPlotWindow32.RefreshData;
begin
  Plot.RefreshData;
end;

procedure TPlotWindow32.PopupClick(Sender: TObject);
begin
  if not (csDesigning in ComponentState) then
  begin
    if (Sender = FPopupMenu.Items[0]) then
      Plot.ZoomIn
    else
      if (Sender = FPopupMenu.Items[1]) then
      Plot.ZoomOut
    else
      if (Sender = FPopupMenu.Items[3]) then
      Plot.ZoomOnePointToPixel
    else
      if (Sender = FPopupMenu.Items[4]) then
      Plot.Zoom100percent;
  end; //
end;

procedure TPlotWindow32.Loaded;
var
  i: integer;
begin
  inherited;
  if (csDesigning in Owner.ComponentState) then
  begin
    Randomize;
    Data.SetAllParams(1001, Data.Min, Data.SamplingRate * 1000, Data.DataType);
    Data.Point[0] := 0;
    for i := 1 to 1000 do
      Data.Point[i] := Data.Point[i - 1] + (Random - 0.5) / 10;

    if Data.DataType = dtFFT then
      Plot.Style := pstSolid
    else
      Plot.Style := pstLine;
    RefreshData;
  end;

  with Plot do
    ZoomTo(load_XMin, load_XMax, load_YMin, load_YMax);
end;

{ TPlot }

constructor TPlot.Create(AOwner: TPlotWindow32);
begin
  inherited Create();
  if AOwner is TPlotWindow32 then
  begin
    Owner := AOwner;
    Bitmap := AOwner.Buffer;
    Data := AOwner.Data;
  end
  else
  begin
    Owner := nil;
    Bitmap := nil;
    Data := nil;
  end;

  // Data.Scale := 1;
  // Data.SamplingRate := 8000;

  aPointsCount := 0;

  FXMin := 0.0;
  FXMax := 1.0;

  FYMin := -1.0;
  FYMax := 1.0;

  load_XMin := 0;
  load_YMax := 0;
  load_XMax := 0;
  load_YMin := 0;

  FRect := Rect(0, 0, 0, 0);
  FPlotRect := Rect(0, 0, 0, 0);

  FXGridEnabled := True;
  FYGridEnabled := True;

  XAxisPointCount := 2;
  YAxisPointCount := 2;

  FValid := False;

  FStyle := pstLine;
  FTypeLine := ptlAA;
  FInterpolationStyle := pisNone;

  MarkerCount := 3;

  LogMode := plmNone;

  YTextEnabled := True;
  XTextEnabled := True;

  CaptionOldY := '';
  oldcaption := false;
end;

procedure TPlot.Invalidate(Render: Boolean);
begin
  if Render then
    FValid := False;
  if Owner <> nil then
  begin
    Owner.Invalidate;
  end;
end;

procedure TPlot.Paint(const ARect, APlotRect: TRect);
begin
  if Owner = nil then
    Exit;

  FRect := ARect;
  FPlotRect := APlotRect;
  InflateRect(FPlotRect, -1, -1);
  WidthPlotRect := FPlotRect.Right - 1 - FPlotRect.Left;
  HeightPlotRect := FPlotRect.Bottom - 1 - FPlotRect.Top;

  if not FValid then
  begin
    XCalcAxisPoints;
    YCalcAxisPoints;
    CalcPixelArray;
    FValid := True;
  end;

  if Bitmap <> nil then
  begin
    PaintPLOT;
    PaintMarkers;
    PaintAxis;
  end;
end;

procedure TPlot.PaintMarker(ind: integer);
var
  xPos, xMax, xMin, yMin, yMax: integer;
  xMinD, xMaxD: integer;
  width, height: integer;
  dMin, dMax: double;
  Clr32: TColor32;
  str: string;
  TempColor: TColor;
begin
  if ind > High(Markers) then
    Exit;
  yMin := FPlotRect.Bottom - 1;
  yMax := FPlotRect.top;
  if Markers[ind].width = 0 then
    Exit;

  width := Markers[ind].width;
  dMin := Markers[ind].freq - Markers[ind].dev / 2;
  dMax := Markers[ind].freq + Markers[ind].dev / 2;
  if dMin < FXMin then
    dMin := FXMin;
  if dMax > FXMax then
    dMax := FXMax;
  if dMin > dMax then
    Exit;
  xMinD := GetXCoord(dMin);
  xMaxD := GetXCoord(dMax);
  xPos := (xMaxD + xMinD) div 2;
  xMin := xPos - (width + 1) div 2 + 1;
  xMin := Min(xMin, xMinD);
  if xMin < FPlotRect.Left then
    xMin := FPlotRect.Left;
  xMax := xPos + width div 2;
  xMax := Max(xMax, xMaxD);
  if xMax > FPlotRect.Right - 1 then
    xMax := FPlotRect.Right - 1;

  Clr32 := Color32(Markers[ind].Color) - $7F000000;

  with Bitmap do
  begin

    SetStipple([Clr32]);
    StippleStep := 1; // Number of colors in a pattern - 1
    for xPos := xMin to xMax do
    begin
      StippleCounter := 0;
      VertLineTSP(xPos, yMin, yMax);
      //VertLineS(xPos, yMin, yMax, Clr32);
    end;
  end;

  with Bitmap do
  begin
    ClipRect := FPlotRect;

    TempColor := Font.Color;
    Font.Color := Markers[ind].color;

    if Markers[ind].text <> '' then
    begin
      str := Markers[ind].text;
      case Markers[ind].Position of
        mtpLeftTop:
          begin Textout(xMin - TextWidth(str), yMax, str);
          end;
        mtpCenterTop:
          begin Textout(xMin + (xMax - xMin - TextWidth(str)) div 2, yMax, str);
          end;
        mtpRightTop:
          begin Textout(xMax, yMax, str);
          end;
        mtpLeftMiddle:
          begin Textout(xMin - TextWidth(str), yMin - (yMin - yMax + TextHeight(str)) div 2, str);
          end;
        mtpCenterMiddle:
          begin Textout(xMin + (xMax - xMin - TextWidth(str)) div 2, yMin - (yMin - yMax + TextHeight(str)) div 2, str);
          end;
        mtpRightMiddle:
          begin Textout(xMax, yMin - (yMin - yMax + TextHeight(str)) div 2, str);
          end;
        mtpLeftBottom:
          begin Textout(xMin - TextWidth(str), yMin - TextHeight(str), str);
          end;
        mtpCenterBottom:
          begin Textout(xMin + (xMax - xMin - TextWidth(str)) div 2, yMin - TextHeight(str), str);
          end;
        mtpRightBottom:
          begin Textout(xMax, yMin - TextHeight(str), str);
          end;
      end; // case
    end; // if

    ClipRect := FRect;
    Font.Color := TempColor;
  end; // with
end;

procedure TPlot.PaintMarkers;
var
  i: integer;
begin
  for i := 0 to MarkerCount do
  begin
    PaintMarker(i);
  end;
end;

procedure TPlot.SetXGridEnabled(const Value: boolean);
begin
  FXGridEnabled := Value;
  Invalidate(False);
  if Owner <> nil then
    if Owner.Parent is TPlotPanel then // Solid = True -> WParam = 1
      if Value then
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGridX, 1)
      else
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGridX, 0);
end;

procedure TPlot.SetYGridEnabled(const Value: boolean);
begin
  FYGridEnabled := Value;
  Invalidate(False);
  if Owner <> nil then
    if Owner.Parent is TPlotPanel then // Solid = True -> WParam = 1
      if Value then
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGridY, 1)
      else
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGridY, 0);

end;

procedure TPlot.SetXAxisPointCount(const Value: integer);
begin
  if Value < 2 then
  begin
    FXAxisPointCount := 2;
    SetLength(FXAxisPointPosition, 2);
    SetLength(FXAxisPoint, 2);
    SetLength(FXAxisPointEnable, 2);
  end
  else
  begin
    FXAxisPointCount := Value;
    SetLength(FXAxisPointPosition, Value);
    SetLength(FXAxisPoint, Value);
    SetLength(FXAxisPointEnable, Value);
  end;
end;

procedure TPlot.SetYAxisPointCount(const Value: integer);
begin
  if Value < 2 then
  begin
    FYAxisPointCount := 2;
    SetLength(FYAxisPointPosition, 2);
    SetLength(FYAxisPoint, 2);
    SetLength(FYAxisPointEnable, 2);
  end
  else
  begin
    FYAxisPointCount := Value;
    SetLength(FYAxisPointPosition, Value);
    SetLength(FYAxisPoint, Value);
    SetLength(FYAxisPointEnable, Value);
  end;
end;

procedure TPlot.XCalcAxisPoints;
var
  MaxIndex: integer;
  i, tempi: integer;
  temp: Single;
  ZeroEpcilon, Step, delta, Mantissa10: Single;
  Exponent10: Integer;
begin
  with FPlotRect do
  begin

    XAxisPointCount := ((WidthPlotRect) div PLOTXNormAxis) + 2;
    MaxIndex := XAxisPointCount - 1;

    ZeroEpcilon := max(abs(FXMin), abs(FXMax)) / 500;
    // IfThen(abs(FXAxisPoint[0]) > abs(FXAxisPoint[MaxIndex]), abs(FXAxisPoint[0]));

    FXAxisPointPosition[0] := Left;
    if IsZero(FXMin, ZeroEpcilon) then
      FXAxisPoint[0] := 0.0
    else
      FXAxisPoint[0] := FXMin;
    FXAxisPointPosition[MaxIndex] := Right - 1;
    if IsZero(FXMax, ZeroEpcilon) then
      FXAxisPoint[MaxIndex] := 0.0
    else
      FXAxisPoint[MaxIndex] := FXMax;

    ZeroEpcilon := ZeroEpcilon / 2000;

    if not IsZero(Max(FXMax, FXMin)) then
      temp := (FXMax - FXMin) / (Max(FXMax, FXMin))
    else
      temp := (FXMax - FXMin) * 1E9;
    temp := abs(temp);

    FXAccuracy := Trunc(log10(0.5 / temp)) + 3;
    if FXAccuracy < 3 then
      FXAccuracy := 3;

    if ((temp >= PLOTStepAccuracy) and (XAxisPointCount > 4)) then
    begin
      delta := (FXMax - FXMin) / (MaxIndex);

      Frexp10(delta, Mantissa10, Exponent10);
      Step := 1;
      for i := 0 to length(ScaleArr) - 1 do
        if (Mantissa10 * (1 - 1E-6)) <= ScaleArr[i] then
        begin
          Step := ScaleArr[i] * Power(10.0, Exponent10);
          Break;
        end;

      temp := ceil(FXMin / Step) * Step;
      if temp = FXMin then
        temp := FXMin + Step;
      for i := 1 to MaxIndex - 1 do
      begin
        FXAxisPoint[i] := temp + Step * (i - 1);
        if isZero(FXAxisPoint[i], ZeroEpcilon) then
          FXAxisPoint[i] := 0;
        tempi := GetXCoord(FXAxisPoint[i]);
        FXAxisPointPosition[i] := tempi;
        if tempi <= left + PLOTXMinAxis then
        begin
          FXAxisPointEnable[i] := False;
        end
        else
          if (tempi) >= (Right - 1) then
        begin
          FXAxisPointEnable[i] := False;
          FXAxisPointPosition[i] := -1;
          // FXAxisPoint
        end
        else
          if (tempi) >= (Right - PLOTXMinAxis) then
        begin
          FXAxisPointEnable[i] := False;
        end
        else
          FXAxisPointEnable[i] := True;
      end; // for
    end // if
    else
      for i := 1 to MaxIndex - 1 do
      begin
        FXAxisPointPosition[i] := Left + Round((Right - Left - 1) / (MaxIndex) * i);
        FXAxisPoint[i] := FXMin + (FXMax - FXMin) / MaxIndex * i;
        FXAxisPointEnable[i] := True;
      end;
  end;
end;

procedure TPlot.YCalcAxisPoints;
var
  MaxIndex: integer;
  i, tempi: integer;
  temp: Single;
  delta, Mantissa10: Single;
  Step: Single;
  Exponent10: Integer;
  ZeroEpcilon: single;
begin
  with FPlotRect do
  begin
    YAxisPointCount := ((HeightPlotRect) div PLOTYNormAxis) + 2;
    MaxIndex := YAxisPointCount - 1;

    ZeroEpcilon := max(abs(FYMin), abs(FYMax)) / 500;

    FYAxisPointPosition[0] := Bottom - 1;
    if IsZero(FYMin, ZeroEpcilon) then
      FYAxisPoint[0] := 0.0
    else
      FYAxisPoint[0] := FYMin;
    FYAxisPointPosition[MaxIndex] := Top;
    if IsZero(FYMax, ZeroEpcilon) then
      FYAxisPoint[MaxIndex] := 0.0
    else
      FYAxisPoint[MaxIndex] := FYMax;

    ZeroEpcilon := ZeroEpcilon / 2000;

    if not IsZero(Max(FYMax, FYMin)) then
      temp := (FYMax - FYMin) / Max(FYMax, FYMin)
    else
      temp := (FYMax - FYMin) * 1E9;
    temp := abs(temp);

    FYAccuracy := Trunc(log10(0.5 / temp)) + 3;
    if FYAccuracy < 3 then
      FYAccuracy := 3;

    if ((temp >= PLOTStepAccuracy) and (YAxisPointCount > 4)) then
    begin
      delta := (FYMax - FYMin) / (MaxIndex);

      Frexp10(delta, Mantissa10, Exponent10);
      Step := 1;
      for i := 0 to length(ScaleArr) - 1 do
        if (Mantissa10 * (1 - 1E-6)) <= ScaleArr[i] then
        begin
          Step := ScaleArr[i] * Power(10.0, Exponent10);
          Break;
        end;

      temp := ceil(FYMin / Step) * Step;
      if temp = FYMin then
        temp := FYMin + Step;
      for i := 1 to MaxIndex - 1 do
      begin
        FYAxisPoint[i] := temp + Step * (i - 1);

        if isZero(FYAxisPoint[i], ZeroEpcilon) then
          FYAxisPoint[i] := 0;

        tempi := GetYCoord(FYAxisPoint[i]);
        FYAxisPointPosition[i] := tempi;
        if tempi > (Bottom - 1 - PLOTYMinAxis) then
        begin
          FYAxisPointEnable[i] := False;
        end
        else
          if (tempi) <= (Top) then
        begin
          FYAxisPointEnable[i] := False;
          FYAxisPointPosition[i] := -1;
          // FXAxisPoint
        end
        else
          if (tempi) <= (Top + PLOTYMinAxis) then
        begin
          FYAxisPointEnable[i] := False;
        end
        else
          FYAxisPointEnable[i] := True;
      end;
    end
    else
      for i := 1 to MaxIndex - 1 do
      begin
        FYAxisPointPosition[i] := Bottom - 1 - Round((Bottom - Top - 1) / (MaxIndex) * i);
        FYAxisPoint[i] := FYMin + (FYMax - FYMin) / MaxIndex * i;
        FYAxisPointEnable[i] := True;
      end;
  end;
end;

procedure TPlot.PaintPLOT;
var
  i, column, column2: integer;
  ZeroCoord: integer;
  Count: integer;
  cx0max, cx0min, cy0min, cy0max, cx1max, cx1min, cy1min, cy1max: integer;
begin
  if IsRectEmpty(FPlotRect) then
    Exit;
  if aPointsCount < 2 then
    Exit;

  Count := aPointsCount * 2;
  //******** Grafics 32 is used ****************************//
  with Bitmap do
  begin
    ClipRect := FPlotRect;
    if Data.DataType = dtFFT then
    begin
      i := 2;
      while (i < Count) do
      begin
        if (aPoints[i].X < 0) or (aPoints[(i - 2)].X < 0) then
        begin Inc(i, 2);
          Continue;
        end;
        if FTypeLine = ptlAA then
          LineAS(aPoints[i - 2].X, aPoints[i - 2].Y, aPoints[i].X, aPoints[i].Y, clPLOTData32)
        else {if FTypeLine = ptlNone then}
          LineS(aPoints[i - 2].X, aPoints[i - 2].Y, aPoints[i].X, aPoints[i].Y, clPLOTData32);
        Inc(i, 2);
      end; // while
    end;
    if Data.DataType = dtWave then
    begin
      i := 2;
      while i < Count do
      begin
        cx0max := aPoints[i - 2].X;
        cx0min := cx0max;
        //cx0min := aPoints[i-1].X;
        cx1max := aPoints[i + 0].X;
        cx1min := cx1max;
        //cx1min := aPoints[i+1].X;

        if (cx0max < 0) or (cx1max < 0) then
        begin Inc(i, 2);
          Continue;
        end;
        //                # max
        //  max #       *   i+1
        //   i    *   *
        //          *
        //  min   *   *
        //   i  #       *   min
        //                # i+1
        //
        cy0max := aPoints[i - 2].Y;
        cy0min := aPoints[i - 1].Y;
        cy1max := aPoints[i + 0].Y;
        cy1min := aPoints[i + 1].Y;

        if FTypeLine = ptlAA then
        begin
          LineAS(cx0max, cy0max, cx1min, cy1min, clPLOTData32);
          if (cy0max <> cy0min) or (cy1max <> cy1min) then
          begin
            VertLineS(cx0max, cy0max, cy0min, clPLOTData32);
            LineAS(cx0min, cy0min, cx1max, cy1max, clPLOTData32);
          end;
        end
        else {if FTypeLine = ptlNone then}
        begin
          LineS(cx0max, cy0max, cx1min, cy1min, clPLOTData32);
          if (cy0max <> cy0min) or (cy1max <> cy1min) then
          begin
            VertLineS(cx0max, cy0max, cy0min, clPLOTData32);
            LineS(cx0min, cy0min, cx1max, cy1max, clPLOTData32);
          end;
        end;
        Inc(i, 2);
      end; //while
    end; //else;

    if FStyle = pstSolid then
    begin
      if Data.DataType = dtFFT then
      begin
        i := 0;
        while i < Count do
        begin
          if (aPoints[i].X > 0) then
          begin

            SetStipple([clYellow32, clRed32]); //  clGreen32,

            ZeroCoord := GetYZeroCoord;

            column := GetYZeroCoord - aPoints[i].Y;
            if column > 0 then
            begin // (Number of colors in a pattern - 1)/column
              StippleStep := 1 / column;
              StippleCounter := 0;
              VertLineTSP(aPoints[i].X, ZeroCoord, aPoints[i].Y);
            end //if
            else
              if column < 0 then
            begin
              StippleStep := 1 / (-column);
              StippleCounter := 0;
              VertLineTSP(aPoints[i].X, ZeroCoord, aPoints[i].Y);
            end; //if
          end; //if
          Inc(i, 2);
        end; //while
      end //if datatype = FFT
      else
      begin
        i := 0;
        while i < Count do
        begin
          if (aPoints[i].X > 0) then
          begin
            SetStipple([clYellow32, clRed32]); //  clGreen32,
            ZeroCoord := GetYZeroCoord;
            column := GetYZeroCoord - aPoints[i].Y;
            column2 := GetYZeroCoord - aPoints[i + 1].Y;
            if (column > 0) and (column2 > 0) then
              column2 := 0
            else
              if (column < 0) and (column2 < 0) then
              column := 0;

            if column > 0 then
            begin // (Number of colors in a pattern - 1)/column
              StippleStep := 1 / column;
              StippleCounter := 0;
              VertLineTSP(aPoints[i].X, ZeroCoord, aPoints[i].Y);
            end //if
            else
              if column < 0 then
            begin
              StippleStep := 1 / (-column);
              StippleCounter := 0;
              VertLineTSP(aPoints[i].X, ZeroCoord, aPoints[i].Y);
            end; //if
            if column2 > 0 then
            begin // (Number of colors in a pattern - 1)/column
              StippleStep := 1 / column2;
              StippleCounter := 0;
              VertLineTSP(aPoints[i + 1].X, ZeroCoord, aPoints[i + 1].Y);
            end //if
            else
              if column2 < 0 then
            begin
              StippleStep := 1 / (-column2);
              StippleCounter := 0;
              VertLineTSP(aPoints[i + 1].X, ZeroCoord, aPoints[i + 1].Y);
            end; //if
          end; //if
          Inc(i, 2);
        end; //while
      end;
    end; //if Solid

    { Тест }
    {
     LineAS(80,80,  120, 82, clPLOTData32);//2
     LineAS(80,85,  120, 88, clPLOTData32);//4
     LineAS(80,90,  120, 96, clPLOTData32);//8
     LineAS(80,95,  120,110, clPLOTData32);//20
     LineAS(80,100, 120,130, clPLOTData32);//36
     LineAS(80,105, 120,140, clPLOTData32);//45
    }
    ClipRect := FRect;
    // Bitmap.FrameRectS(FPlotRect, clPLOTGrid32);
  end;
end;

procedure TPlot.PaintAXIS;
var
  i, y: integer;
  tmpstr: string;
  tempRect: TRect;
  left, right, bottom, top: integer;
  PixelPerPoints: single;
begin
  PixelPerPoints := 1;
  with Bitmap do
  begin
    //**********************************************************/
    SetStipple([clPLOTGrid32, clPLOTGrid32, clPLOTGrid32, clPLOTGrid32, 0, 0, 0, 0]);
    StippleStep := 1;

    left := FPlotRect.Left - 1;
    right := FPlotRect.Right + 1;
    top := FPlotRect.Top - 1;
    bottom := FPlotRect.Bottom + 1;

    if XTextEnabled then
    begin
      tmpstr := FloatToStrG(FXAxisPoint[0], FXAccuracy, FXAccuracy - 1);
      Textout(FXAxisPointPosition[0] - TextWidth(tmpstr) div 2, Bottom - 1 + 10, tmpstr);
    end;
    for i := 1 to FXAxisPointCount - 2 do
      if FXAxisPointPosition[i] > 0 then
      begin
        VertLineS(FXAxisPointPosition[i], Bottom, Bottom + 3, clPLOTAxis32);

        if FXGridEnabled then
        begin
          if AxisMode = pamLine then
          begin
            StippleCounter := 0;
            VertLineTSP(FXAxisPointPosition[i], Top, Bottom - 2);
          end
          else
            if AxisMode = pamRuler then
          begin
            VertLineS(FXAxisPointPosition[i], Bottom - 9, Bottom - 2, clPLOTGrid32);
            VertLineS(FXAxisPointPosition[i], Top + 8, Top + 1, clPLOTGrid32);
          end
          else
          begin
            tempRect := Bitmap.ClipRect;
            VertLineS(FXAxisPointPosition[i], Bottom - 5, Bottom - 2, clPLOTGrid32);
            VertLineS(FXAxisPointPosition[i], Top + 4, Top + 1, clPLOTGrid32);
            Bitmap.ClipRect := FPlotRect;
            for y := 1 to FYAxisPointCount - 2 do
              if FYAxisPointPosition[Y] > 0 then
                VertLineS(FXAxisPointPosition[i], FYAxisPointPosition[y] + 4, FYAxisPointPosition[y] - 4, clPLOTGrid32);
            Bitmap.ClipRect := tempRect;
          end;
        end;

        if XTextEnabled then
          if FXAxisPointEnable[i] then
          begin
            tmpstr := FloatToStrG(FXAxisPoint[i], FXAccuracy, FXAccuracy - 1);
            Textout(FXAxisPointPosition[i] - TextWidth(tmpstr) div 2, Bottom + 10, tmpstr);
          end;
      end;
    if XTextEnabled then
    begin
      tmpstr := FloatToStrG(FXAxisPoint[FXAxisPointCount - 1], FXAccuracy, FXAccuracy - 1);
      Textout(FXAxisPointPosition[FXAxisPointCount - 1] - TextWidth(tmpstr) div 2, Bottom + 10, tmpstr);
    end;
    //**********************************************************/
    if YTextEnabled then
    begin
      tmpstr := FloatToStrG(FYAxisPoint[0], FYAccuracy, FYAccuracy - 1);
      Textout(Left - TextWidth(tmpstr) - 3, FYAxisPointPosition[0] - TextHeight(tmpstr) div 2, tmpstr);
    end;
    for i := 1 to FYAxisPointCount - 1 - 1 do
      if FYAxisPointPosition[i] > 0 then
      begin
        HorzLineS(Left, FYAxisPointPosition[i], Left - 3, clPLOTAxis32);

        if FYGridEnabled then
        begin
          if AxisMode = pamLine then
          begin
            StippleCounter := 0;
            HorzLineTSP(Left, FYAxisPointPosition[i], Right - 2);
          end
          else
            if AxisMode = pamRuler then
          begin
            HorzLineS(Left + 1, FYAxisPointPosition[i], Left + 8, clPLOTGrid32);
            HorzLineS(Right - 2, FYAxisPointPosition[i], Right - 9, clPLOTGrid32);
          end
          else
          begin
            tempRect := Bitmap.ClipRect;
            HorzLineS(Left + 1, FYAxisPointPosition[i], Left + 4, clPLOTGrid32);
            HorzLineS(Right - 2, FYAxisPointPosition[i], Right - 5, clPLOTGrid32);
            Bitmap.ClipRect := FPlotRect;
            for y := 1 to FXAxisPointCount - 2 do
              if FXAxisPointPosition[Y] > 0 then
                HorzLineS(FXAxisPointPosition[y] + 4, FYAxisPointPosition[i], FXAxisPointPosition[y] - 4, clPLOTGrid32);
            Bitmap.ClipRect := tempRect;
          end;
        end;
        if YTextEnabled then
          if FYAxisPointEnable[i] then
          begin
            tmpstr := FloatToStrG(FYAxisPoint[i], FYAccuracy, FYAccuracy - 1);
            Textout(Left - TextWidth(tmpstr) - 3, FYAxisPointPosition[i] - TextHeight(tmpstr) div 2, tmpstr);
          end;
      end;
    if YTextEnabled then
    begin
      tmpstr := FloatToStrG(FYAxisPoint[FYAxisPointCount - 1], FYAccuracy, FYAccuracy - 1);
      Textout(Left - TextWidth(tmpstr) - 3, FYAxisPointPosition[FYAxisPointCount - 1] - TextHeight(tmpstr) div 2, tmpstr);
    end;

    {__$ifdef OTLADKA}
    tmpstr := '';
    if (FXMax - FXMin) * Data.SamplingRate > 0 then
      PixelPerPoints := WidthPlotRect / ((FXMax - FXMin) * Data.SamplingRate);
    if PixelPerPoints > 1 then
      tmpstr := 'Pixel 1:' + FloatToStrG(PixelPerPoints, 3, 2)
    else
      if PixelPerPoints > 0 then
    begin
      PixelPerPoints := 1 / PixelPerPoints;
      tmpstr := 'Pixel:' + FloatToStrG(PixelPerPoints, 3, 2) + ':1';
    end;
    Bitmap.Textout(FRect.Right - TextWidth(tmpstr) - 3, FRect.Bottom - TextHeight(tmpstr) - 3, tmpstr)
      {__$endif}

  end;
end;

procedure TPlot.SetYMax(const Value: Double);
begin
  if csLoading in Owner.ComponentState then
  begin
    load_YMax := Value;
  end
  else
    if (Value > FYMin) and (abs(Value) < PLOT_MAX_VALUE) then
  begin
    FYMax := Value;
    Invalidate;
  end;
  //    else FYMax := FYMin;
end;

procedure TPlot.SetYMin(const Value: Double);
begin
  if csLoading in Owner.ComponentState then
  begin
    load_YMin := Value;
  end
  else
    if (Value < FYMax) and (abs(Value) < PLOT_MAX_VALUE) then
  begin
    FYMin := Value;
    Invalidate;
  end;
  //   else FYMin := FYMax;
end;

procedure TPlot.SetStyle(const Value: TPlotStyle);
begin
  FStyle := Value;
  Invalidate(False);
  //pstLine, pstSolid

 // MessageBox(Owner.Handle, PChar(Owner.Parent.Name), '',  0);
  if Owner <> nil then
    if Owner.Parent is TPlotPanel then // Solid = True -> WParam = 1
      if Value = pstSolid then
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnLineMode, 1)
      else
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnLineMode, 0);
end;

procedure TPlot.SetTypeLine(const Value: TPlotTypeLine);
begin
  FTypeLine := Value;
  Invalidate(False);
end;

procedure TPlot.SetXMax(const Value: Double);
begin
  if csLoading in Owner.ComponentState then
  begin
    load_XMax := Value;
  end
  else
    if (Value > FXMin) and (abs(Value) < PLOT_MAX_VALUE) then
  begin
    FXMax := Value;
    Invalidate;
  end
    //  else FXMax := FXMin + 1;
end;

procedure TPlot.SetXMin(const Value: Double);
begin
  if csLoading in Owner.ComponentState then
  begin
    load_XMin := Value;
  end
  else
    if (Value < FXMax) and (abs(Value) < PLOT_MAX_VALUE) then
  begin
    FXMin := Value;
    Invalidate;
  end;
  //  else FXMin := FXMax - 1;
end;

procedure TPlot.CalcPixelArray;
var
  i, j, jmin, jmax: integer; // indexes
  ind, X: double;
  temp, YMin, YMax, Y: single;

  function mMax(const aPred, a, aNext: single): boolean; //if
  begin
    result := false;
    if (a > aPred) and (a > aNext) then
      result := true;
  end;

  function mMin(const aPred, a, aNext: single): boolean;
  begin
    result := false;
    if (a < aPred) and (a < aNext) then
      result := true;
  end;
begin
  if WidthPlotRect < 2 then
  begin
    aPointsCount := 0;
    SetLength(aPoints, aPointsCount);
    Exit;
  end
  else
    if aPointsCount <> WidthPlotRect + 1 then
  begin
    aPointsCount := WidthPlotRect + 1;
    SetLength(aPoints, aPointsCount * 2);
    SetLength(aMin, aPointsCount);
    SetLength(aMax, aPointsCount);
    //SetLength(aPos, aPointsCount);
  end;

  i := aPointsCount - 1;
  while i >= 0 do
  begin
    X := (i - 0.5) / WidthPlotRect * (FXMax - FXMin) + FXMin;
    ind := (X - Data.Min) * Data.SamplingRate;
    if abs(ind) < (2147483647 - 1) then
    begin
      jmin := ceil(ind);
      if (jmin < 0) then
        jmin := 0;
    end
    else
      jmin := -1;
    X := (i + 0.5) / WidthPlotRect * (FXMax - FXMin) + FXMin;

    ind := (X - Data.Min) * Data.SamplingRate;
    if abs(ind) < (2147483647 - 1) then
    begin
      jmax := floor(ind);
      //if jmax = 0 then
      if jmax > Data.Size - 1 then
        jmax := Data.Size - 1;
    end
    else
      jmax := -1;

    if (jmin >= 0) and (jmax >= 0) then
    begin
      if (jmax - jmin) >= 0 then
      begin
        YMin := PLOT_ERR_VALUE; // !!!!!
        YMax := -PLOT_ERR_VALUE;
        //YPos := 0;
        for j := jmin to jmax do
        begin
          temp := Data.FPoint[j];
          //YPos := YPos + temp;
          if YMin > temp then
            YMin := temp;
          if YMax < temp then
            YMax := temp;
        end; //for
        aMin[i] := YMin;
        aMax[i] := YMax;
        //aPos[i] := YPos / (jmax - jmin + 1);;
      end
      else
      begin
        X := i / WidthPlotRect * (FXMax - FXMin) + FXMin;
        Y := GetY(X);
        aMin[i] := Y;
        aMax[i] := Y;
      end;
    end //if(jmin > 0)and(jmax > 0)
    else
    begin
      aMin[i] := -PLOT_ERR_VALUE;
      aMax[i] := PLOT_ERR_VALUE;
    end;
    Dec(i);
  end; //while
  i := aPointsCount - 1;
  while i >= 0 do
  begin
    if (aMax[i] > PLOT_MAX_VALUE) or (aMin[i] < (-PLOT_MAX_VALUE)) then
    begin
      j := i * 2;
      aPoints[j].X := -1;
      aPoints[j].Y := -1;
      j := j + 1;
      aPoints[j].X := -1;
      aPoints[j].Y := -1;
    end
    else
    begin
      j := i * 2;
      aPoints[j].X := FPlotRect.Left + i;
      aPoints[j].Y := GetYCoord(aMax[i]);
      j := j + 1;
      if Data.DataType = dtFFT then
      begin
        aPoints[j].X := -1;
        aPoints[j].Y := -1;
      end
      else {If Owner.Data.DataType = dtWave then}
      begin
        aPoints[j].X := FPlotRect.Left + i;
        aPoints[j].Y := GetYCoord(aMin[i]);
      end;
    end;
    Dec(i);
  end; //while

end;

procedure TPlot.ZoomIn;
begin
  Zoom(2);
end;

procedure TPlot.ZoomOut;
begin
  Zoom(0.5);
end;

procedure TPlot.ZoomIn(xE, yE: boolean);
var
  x, y: single;
begin
  if xE then
    x := 2
  else
    x := 1;
  if yE then
    y := 2
  else
    y := 1;
  ZoomXY(x, y);
end;

procedure TPlot.ZoomOut(xE, yE: boolean);
var
  x, y: single;
begin
  if xE then
    x := 0.5
  else
    x := 1;
  if yE then
    y := 0.5
  else
    y := 1;
  ZoomXY(x, y);
end;

procedure TPlot.Zoom(const Scale: Single);
var
  yscl, xscl: Double;
begin
  if (Scale > 0) and (Scale <> 1) then
  begin
    yscl := (Ymax - YMin) / 2 * (1 - 1 / Scale);
    xscl := (Xmax - XMin) / 2 * (1 - 1 / Scale);
    ZoomTo(XMin + xscl, XMax - xscl, YMin + yscl, YMax - yscl);
  end;
end;

procedure TPlot.ZoomXY(const XScale, YScale: Single);
var
  yscl, xscl: Double;
begin
  if (XScale > 0) and (YScale > 0) then
  begin
    yscl := (Ymax - YMin) / 2 * (1 - 1 / YScale);
    xscl := (Xmax - XMin) / 2 * (1 - 1 / XScale);
    ZoomTo(XMin + xscl, XMax - xscl, YMin + yscl, YMax - yscl);
  end;
end;

function TPlot.ZoomTo(const XMin, XMax, YMin, YMax: Double): boolean;
var
  Center: Double;
begin
  Result := False;
  if (XMax > XMin) and (YMax > YMin) then
    if (PLOT_MAX_VALUE > Abs(XMin)) and (PLOT_MAX_VALUE > Abs(XMax)) and
      (PLOT_MAX_VALUE > Abs(YMin)) and (PLOT_MAX_VALUE > Abs(YMax))
      then
    begin
      if (XMax - XMin) < (Data.Period / 55) then
      begin
        Center := (XMax + XMin) / 2;
        FXMin := Center - Data.Period / 50; // 1/50 + 1/50 = 1/25
        FXMax := Center + Data.Period / 50;
        MessageBox(Owner.Handle, 'too small windows X',
          'Warning', 0);
      end
      else
      begin
        FXMin := XMin;
        FXMax := XMax;

        FYMin := YMin;
        FYMax := YMax;
        Result := True;
      end;

      Invalidate;
    end;
end;

function TPlot.ZoomOnePointToPixel: boolean;
var
  i: integer;
  start: integer;
  XMin, XMax, YMin, YMax: double;
begin
  Xmin := FXMin;
  Xmax := FXMin + Data.Period * WidthPlotRect;
  YMin := PLOT_ERR_VALUE;
  YMax := -PLOT_ERR_VALUE;

  start := GetXIndex(Xmin);
  i := start;
  while (i <= WidthPlotRect + start) and (i < Data.Size) do
  begin
    if YMin > Data.FPoint[i] then
      YMin := Data.FPoint[i];
    if YMax < Data.FPoint[i] then
      YMax := Data.FPoint[i];
    Inc(i);
  end;

  if Data.DataType = dtFFT then
    YMin := 0;
  if Data.Size = 0 then
    result := ZoomTo(0, 1, -1, 1)
  else
    result := ZoomTo(XMin, XMax, YMin, YMax);
end;

function TPlot.Zoom100percent(): boolean;
var
  i: integer;
  temp, YMin, YMax: single;
begin
  YMin := PLOT_ERR_VALUE;
  YMax := -PLOT_ERR_VALUE;
  i := Data.Size - 1;
  while (i >= 0) do
  begin
    temp := Data.FPoint[i];
    if YMin > temp then
      YMin := temp;
    if YMax < temp then
      YMax := temp;
    Dec(i);
  end;

  if YMax = YMin then
    if abs(YMax) < 1000 then
    begin YMax := YMax + 0.5;
      YMin := YMin - 0.5;
    end
    else
    begin YMax := YMax * 1.005;
      YMin := YMin * 0.995;
    end;

  if (Data.DataType = dtFFT) and (YMax > 0.0) then
    YMin := 0.0;
  if Data.Size = 0 then
    result := ZoomTo(0, 1, -1, 1)
  else
    result := ZoomTo(Data.Min, Data.Max, YMin, YMax);
end;

function TPlot.GetY(X: double): single;
var
  ind: double;
  imin, imax: integer;
  YMin, YMax: single;
  Y: double;
begin
  ind := (X - Data.Min) * Data.SamplingRate;
  if abs(ind) > MAX_DATA_SIZE then
  begin
    Result := PLOT_ERR_VALUE;
    Exit;
  end;
  imin := floor(ind);
  imax := ceil(ind);

  // if (imin<0)and(imax = 0)then imin := 0
  // else if (imax > Data.Size-1)and(imin = Data.Size-1) then imax := Data.Size - 1
  // else
  if (imin < 0) or (imax > Data.Size - 1) then
  begin
    Result := PLOT_ERR_VALUE;
    Exit;
  end;

  if iMin = iMax then
    Result := Data.FPoint[iMin]
  else
  begin
    YMin := Data.FPoint[imin];
    YMax := Data.FPoint[imax];
    Y := YMin + (YMax - YMin) * frac(ind);
    Result := Y;
  end;
  { case InterpolationStyle of
    pisNone :
       begin
        if YPos:=
       end;
    pisStraightLine :
       begin

       end;
    pisCubicSpline:
       begin

       end;
   else
     YPos := 0;
   end;
  }
end;

procedure TPlot.GetPoint(const pixel: TPoint; var X, Y: double);
begin
  X := 0;
  y := 0;
  if IsRectEmpty(FPlotRect) then
    Exit;
  if PtInRect(FPlotRect, pixel) then
  begin
    X := (pixel.X - FPlotRect.Left) / (WidthPlotRect) *
      (FXMax - FXMin) + FXMin;
    y := ((FPlotRect.Bottom - 1) - pixel.Y) / (HeightPlotRect) *
      (FYMax - FYMin) + FYMin;
  end;
end;

function TPlot.GetYCoord(Y: Double): integer;
var
  Yc: Double;
begin
  //if HeightPlotRect <= 0 then Exit;
  if Y = 0 then
    Yc := -YMin / (YMax - YMin) * HeightPlotRect
  else
    Yc := (Y - YMin) / (YMax - YMin) * HeightPlotRect;
  if abs(Yc) < PLOT_MAX_COORD then
    Result := (FPlotRect.Bottom - 1) - Trunc(Yc + 0.5)
  else
    if Yc > 0 then
    Result := 0 - PLOT_MAX_COORD
  else
    Result := 0 + PLOT_MAX_COORD;
end;

function TPlot.GetXIndex(X: Double): integer;
var
  Mass: Double;
begin
  Mass := X * Data.SamplingRate;

  if Mass > -0.49999 then
    if Mass < MAX_DATA_SIZE then
    begin
      Result := Trunc(Mass + 0.5)
    end
    else
      Result := MAX_DATA_SIZE - 1
  else
    Result := 0;

  if Result < 0 then
    Result := 0;
  if Result > Data.Size - 1 then
    Result := Data.Size - 1;
end;

function TPlot.GetXCoord(x: Double): integer;
var
  Mass: Double;
begin
  Mass := (WidthPlotRect) / (FXMax - FXMin);
  Mass := (X - FXMin) * Mass;
  if abs(Mass) < PLOT_MAX_COORD then
    Result := Trunc(Mass + 0.5) + FPlotRect.Left
  else
    result := PLOT_ERR_COORD;
end;

function TPlot.GetYZeroCoord: integer;
begin
  Result := GetYCoord(0);
end;

function TPlot.isZeroCheck(Mx, Mn: single): boolean;
begin
  Result := isZero(Mx - Mn, Max(abs(Mx), abs(Mn)) * 10 - 8);
end;

procedure TPlot.SetAxisMode(const Value: TPlotAxisMode);
begin
  FAxisMode := Value;
  Invalidate;

  if Owner <> nil then
    if Owner.Parent is TPlotPanel then // Solid = True -> WParam = 1
      if Value = pamPlus then
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGridPlus, 1)
      else
        if Value = pamRuler then
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGridRuler, 1)
      else
      begin
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGridPlus, 0);
        SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGridRuler, 0);
      end;
end;

procedure TPlot.SetMarkerCount(const Value: Word);
var
  i: integer;
begin
  FMarkerCount := Value;
  SetLength(Markers, Value);

  if csDesigning in Owner.ComponentState then
  begin
    Randomize;
    for i := 0 to Value - 1 do
    begin
      Markers[i].freq := Data.Max * Random;
      Markers[i].dev := Data.Max * 0.01 * Random;
      Markers[i].width := Random(6);
      Markers[i].color := Random($FF) shl 16 + Random($FF) shl 8 + Random($FF);
      Markers[i].text := '#' + inttostr(i);
      Markers[i].position := TMarkerTextPosition(random(Integer(High(TMarkerTextPosition)) + 1));
    end;
  end;
  Invalidate(False);
end;

procedure TPlot.SetInterpolationStyle(
  const Value: TPlotInterpolationStyle);
begin
  FInterpolationStyle := Value;
  invalidate;
end;

procedure TPlot.SetLogMode(const Value: TLogMode);
begin
  if FLogMode <> Value then
  begin
    FLogMode := Value;
    DataRefresh(Value);
    Zoom100percent;
    {  plmNone, plmLOG}
    if Owner <> nil then
      if Owner.Parent is TPlotPanel then // Solid = True -> WParam = 1
        if Value = plmNone then
          SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGrLogdB, 0)
        else
        begin
          SendMessage(Owner.Parent.Handle, WM_SETSTYLE, btnGrLogdB, 1);
        end;
  end;
end;

procedure TPlot.RefreshData;
begin
  if Owner = nil then
    Exit;

  DataRefresh(LogMode);
  invalidate;
end;

procedure TPlot.DataRefresh(const Mode: TLogMode);
var
  i: integer;
begin
  if Owner = nil then
    Exit;

  if (Mode <> plmNone) and (Owner.Data.DataType = dtFFT) then
  begin
    if logData = nil then
      logData := TData.Create;

    logData.SetAllParams(Owner.Data.Size, Owner.Data.Min,
      Owner.Data.SamplingRate, Owner.Data.DataType,
      Owner.Data.dB_Zero);
    for i := 0 to Owner.Data.Size - 1 do
      if Owner.Data.FPoint[i] > 0 then
        logData.FPoint[i] := 20 * log10(Owner.Data.FPoint[i] / Owner.Data.dB_Zero)
      else
        logData.FPoint[i] := PLOT_ERR_LOG;
    Data := logData;

    CaptionOldY := Owner.CaptionY;
    oldcaption := true;
    Owner.CaptionY := 'FFT';
  end
  else
  begin
    if oldcaption then
      Owner.CaptionY := CaptionOldY;
    Data := Owner.Data;
    oldcaption := false;
  end;
end;

destructor TPlot.Destroy;
begin
  if logData <> nil then
    logData.Destroy;
  inherited Destroy;
end;

procedure TPlot.SetXTextEnabled(const Value: boolean);
begin
  FXTextEnabled := Value;
  Invalidate(False);
end;

procedure TPlot.SetYTextEnabled(const Value: boolean);
begin
  FYTextEnabled := Value;
  Invalidate(False);
end;

{ TData }

constructor TData.Create;
begin
  inherited Create;

  SetAllParams(0, 0, 1, dtWave);
end;

procedure TData.SetScale(const Value: single);
begin
  if FScale <> Value then
    if Value > 0 then
    begin
      FScale := Value;
    end;
end;

function TData.GetPoint(i: integer): single;
begin
  result := 0;
  if (i < Size) and (i >= 0) then
    result := FPoint[i];
end;

procedure TData.SetPoint(i: integer; const Value: single);
begin
  if (i < Size) and (i >= 0) then
    FPoint[i] := Value;
end;

procedure TData.SetMinMax(const Min, Max: single);
begin
  if (Max > Min) and (abs(Max) < PLOT_MAX_VALUE) and (abs(Min) < PLOT_MAX_VALUE) then
  begin
    Fmax := Max;
    Fmin := Min;
    if Size > 1 then
      FSamplingRate := (max - min) / (size - 1);
  end;
end;

procedure TData.SetAllParams(Size: integer; Min, SamplingRate: single;
  DataType: TDataType; const db_Zero: single = 1.0);
begin

  if (FSize <> Size) then
    if (Size > 1) and (Size <= MAX_DATA_SIZE) then
    begin
      FSize := Size;
      SetLength(FPoint, Size);
    end
    else
    begin
      FSize := 0;
      SetLength(FPoint, 0);
    end;

  if (abs(Min) < PLOT_MAX_VALUE) then
  begin
    FMin := Min;
  end;

  if (SamplingRate <= 0) then
    SamplingRate := 1;
  if ((SamplingRate * Size) >= PLOT_MAX_VALUE) then
    SamplingRate := 1;
  FSamplingRate := SamplingRate;
  FPeriod := 1 / SamplingRate;
  if Size > 1 then
    FMax := FPeriod * (FSize - 1) + Min
  else
    FMax := 1;

  FDataType := DataType;

  if (dB_Zero > 0) and (dB_Zero < PLOT_MAX_VALUE) then
    FdB_Zero := dB_Zero
  else
    FdB_Zero := 1;
end;

procedure TData.SetdB_Mode(const Value: TdB_Mode);
begin
  FdB_Mode := Value;
end;

{ TPlotPanel }

procedure TPlotPanel.ButtonClick(Sender: TObject);
//var i : integer;
begin
  if not (csDesigning in ComponentState) then
  begin
    //MessageBox(Handle, PChar(TWinControl(Sender).Name), '',  0);
    if FPlotWindow <> nil then
    begin
      if Sender = Buttons[btnHandMode] then
      begin
        PlotWindow.RMouseMode := rmHand;
      end
      else
        if Sender = Buttons[btnMenuMode] then
      begin
        PlotWindow.RMouseMode := rmMenu;

      end
      else
        if Sender = Buttons[btnSettin] then
      begin
        MessageBox(Handle, 'Setting', 'Setting', 0);
      end
      else
        if (Sender = Buttons[btnZoomIn]) then
      begin
        FPlotWindow.Plot.ZoomIn(Buttons[btnZoomX].Down, Buttons[btnZoomY].Down)
      end
      else
        if (Sender = Buttons[btnZoomOut]) then
      begin
        FPlotWindow.Plot.ZoomOut(Buttons[btnZoomX].Down, Buttons[btnZoomY].Down);
      end
      else
        if Sender = Buttons[btnGridX] then
      begin
        FPlotWindow.Plot.XGridEnabled := Buttons[btnGridX].Down;
      end
      else
        if Sender = Buttons[btnGridY] then
      begin
        FPlotWindow.Plot.YGridEnabled := Buttons[btnGridY].Down;
      end
      else
        if Sender = Buttons[btnGridRuler] then
      begin
        if Buttons[btnGridRuler].Down then
          FPlotWindow.Plot.AxisMode := pamRuler
        else
          FPlotWindow.Plot.AxisMode := pamLine
      end
      else
        if Sender = Buttons[btnGridPlus] then
      begin
        if Buttons[btnGridPlus].Down then
          FPlotWindow.Plot.AxisMode := pamPlus
        else
          FPlotWindow.Plot.AxisMode := pamLine
      end
      else
        if Sender = Buttons[btnLineMode] then
      begin
        if Buttons[btnLineMode].Down then
          FPlotWindow.Plot.Style := pstSolid
        else
          FPlotWindow.Plot.Style := pstLine;
      end
      else
        if Sender = Buttons[btnGrLogdB] then
      begin
        if Buttons[btnGrLogdB].Down then
          FPlotWindow.Plot.LogMode := plmDB
        else
          FPlotWindow.Plot.LogMode := plmNone;
      end;

    end;
  end; //
end;

constructor TPlotPanel.Create(AOwner: TComponent);
var
  i: integer;
begin
  inherited;

  FButtonsHeight := 0;
  FBottomLine := blLine;
  FPlotWindow := nil;
  FHold := False;
  Width := 400;
  Height := 200;

  BevelInner := bvNone;
  BevelOuter := bvNone;

  HotkeySet := False;

  for i := 0 to btnCount - 1 do
  begin
    Buttons[i] := TSpeedButton.Create(Self);
    Buttons[i].Parent := Self;
    Buttons[i].Flat := True;
    //Buttons[i].Caption := '';
    // Buttons[i].Visible := True;
    // Buttons[i].Enabled := True;
    // Buttons[i].Glyph.LoadFromResourceName;
    Buttons[i].ShowHint := True;
    Buttons[i].GroupIndex := 0;

    Buttons[i].OnClick := ButtonClick;
    Buttons[i].Enabled := False;
  end;

  Buttons[btnHandMode].Glyph.LoadFromResourceName(HInstance, 'HAND'); // SCALE_MODE
  Buttons[btnHandMode].Hint := 'Scale';
  Buttons[btnHandMode].GroupIndex := btnMenuMode;
  Buttons[btnHandMode].Down := True;

  Buttons[btnMenuMode].Glyph.LoadFromResourceName(HInstance, 'MENU');
  Buttons[btnMenuMode].Hint := 'Menu';
  Buttons[btnMenuMode].GroupIndex := btnMenuMode;

  Buttons[btnMenuMode + 1].Caption := '|';
  Buttons[btnMenuMode + 1].Enabled := False;
  Buttons[btnMenuMode + 1].ShowHint := false;
  Buttons[btnMenuMode + 1].Hint := '';

  Buttons[btnSettin].Glyph.LoadFromResourceName(HInstance, 'SETTINGS');
  Buttons[btnSettin].Hint := 'Settings';

  Buttons[btnSettin + 1].Caption := '|';
  Buttons[btnSettin + 1].Enabled := False;
  Buttons[btnSettin + 1].ShowHint := false;
  Buttons[btnSettin + 1].Hint := '';

  Buttons[btnZoomX].Glyph.LoadFromResourceName(HInstance, 'ZOOM_X');
  Buttons[btnZoomX].Hint := 'Zoom X';
  Buttons[btnZoomX].GroupIndex := btnZoomX;
  Buttons[btnZoomX].Down := True;
  Buttons[btnZoomX].AllowAllUp := True;
  //xE := True;

  Buttons[btnZoomY].Glyph.LoadFromResourceName(HInstance, 'ZOOM_Y');
  Buttons[btnZoomY].Hint := 'Zoom Y';
  Buttons[btnZoomY].GroupIndex := btnZoomY;
  Buttons[btnZoomY].Down := True;
  Buttons[btnZoomY].AllowAllUp := True;
  // yE := True;

  Buttons[btnZoomIn].Glyph.LoadFromResourceName(HInstance, 'ZOOM_IN');
  Buttons[btnZoomIn].Hint := 'Zoom In CTRL+"+"';

  Buttons[btnZoomOut].Glyph.LoadFromResourceName(HInstance, 'ZOOM_OUT');
  Buttons[btnZoomOut].Hint := 'Zoom Out CTRL+"-"';

  Buttons[btnZoomOut + 1].Caption := '|';
  Buttons[btnZoomOut + 1].Enabled := False;
  Buttons[btnZoomOut + 1].ShowHint := false;
  Buttons[btnZoomOut + 1].Hint := '';

  Buttons[btnGridRuler].Glyph.LoadFromResourceName(HInstance, 'GRIDE_MODE_1');
  Buttons[btnGridRuler].Hint := 'Gride Mode 1';
  Buttons[btnGridRuler].GroupIndex := btnGridRuler;
  Buttons[btnGridRuler].Down := False;
  Buttons[btnGridRuler].AllowAllUp := True;

  Buttons[btnGridPlus].Glyph.LoadFromResourceName(HInstance, 'GRIDE_MODE_2');
  Buttons[btnGridPlus].Hint := 'Gride Mode 2';
  Buttons[btnGridPlus].GroupIndex := btnGridRuler;
  Buttons[btnGridPlus].Down := False;
  Buttons[btnGridPlus].AllowAllUp := True;

  Buttons[btnGridX].Glyph.LoadFromResourceName(HInstance, 'GRID_X');
  Buttons[btnGridX].Hint := 'Grid X';
  Buttons[btnGridX].GroupIndex := btnGridX;
  Buttons[btnGridX].Down := True;
  Buttons[btnGridX].AllowAllUp := True;

  Buttons[btnGridY].Glyph.LoadFromResourceName(HInstance, 'GRID_Y');
  Buttons[btnGridY].Hint := 'Grid Y';
  Buttons[btnGridY].GroupIndex := btnGridY;
  Buttons[btnGridY].Down := True;
  Buttons[btnGridY].AllowAllUp := True;

  Buttons[btnGrLogdB - 1].Caption := '|';
  Buttons[btnGrLogdB - 1].Enabled := False;
  Buttons[btnGrLogdB - 1].ShowHint := false;
  Buttons[btnGrLogdB - 1].Hint := '';

  Buttons[btnGrLogdB].Glyph.LoadFromResourceName(HInstance, 'DB_MODE');
  Buttons[btnGrLogdB].Hint := 'db Mode(dB)';
  Buttons[btnGrLogdB].GroupIndex := btnGrLogdB;
  Buttons[btnGrLogdB].Down := False;
  Buttons[btnGrLogdB].AllowAllUp := True;

  Buttons[btnLineMode - 1].Caption := '|';
  Buttons[btnLineMode - 1].Enabled := False;
  Buttons[btnLineMode - 1].ShowHint := false;
  Buttons[btnLineMode - 1].Hint := '';

  Buttons[btnLineMode].Glyph.LoadFromResourceName(HInstance, 'LINE_MODE');
  Buttons[btnLineMode].Hint := 'Line Mode';
  Buttons[btnLineMode].GroupIndex := btnLineMode;
  Buttons[btnLineMode].Down := False;
  Buttons[btnLineMode].AllowAllUp := True;
  {
   BOTTOM         GRIDE_MODE_1      POINTS           TXT_MODE
   CALC           GRIDE_MODE_2      SCALE_MODE       VALLEY
   CURSOR_MODE    HI                SELECT_MODE      X_TAG_MODE
   DATA_TOKENS    INFLECTION        SETTINGS         Y_TAG_MODE
   GLOBAL_HI      LOG_X             START            ZOOM_IN
   GLOBAL_LOW     LOG_Y             TAG_MODE         ZOOM_OUT
   GRAFFICS       LOG25             TEXT_S           ZOOM_X
   GRID_X         LOW               TOP              ZOOM_Y
   GRID_Y         PEAK   DB_MODE  LINE_MODE  MENU  HAND
  }

  ResizeButtons;
end;

procedure TPlotPanel.ResizeButtons;
const
  btnSize = 23;
  lftMargin = 3;
  topMargin = 3;
  btmMargin = 5;
var
  i: integer;
  maxcolumn: integer;
  column: integer;
  rows: integer;

begin

  maxcolumn := (Self.Width - lftMargin) div btnSize;
  if maxcolumn = 0 then
    maxcolumn := 1;

  for i := 0 to (btnCount - 1) do
  begin
    column := i mod maxcolumn;
    rows := i div maxcolumn;
    Buttons[i].Left := lftMargin + column * btnSize;
    Buttons[i].Top := topMargin + rows * btnSize;
  end;

  FButtonsHeight := btmMargin + topMargin + (rows + 1) * btnSize;
  case BottomLine of
    blNone:
      begin
      end;
    blLine, blDot:
      begin
        FButtonsHeight := FButtonsHeight + 1;
      end;
    blDblLine, blDblDot:
      begin
        FButtonsHeight := FButtonsHeight + 3;
      end;
  end;

  if Hold then
  begin
    if FPlotWindow <> nil then
    begin
      fPlotWindow.top := FButtonsHeight;
      fPlotWindow.Height := Self.Height - FButtonsHeight;
    end;
  end;
end;

procedure TPlotPanel.Resize;
begin
  inherited;
  if not (csLoading in ComponentState) then
    ResizeButtons;
end;

procedure TPlotPanel.SetParent(AParent: TWinControl);
var
  b, a: boolean;
begin
  inherited;
  if AParent <> nil then
    if Handle > 0 then
    begin
      if not (csDesigning in ComponentState) then
        if (csReading in ComponentState) then
        begin
          if HotkeySet then
          begin
            a := UnRegisterHotkey(Handle, HotKey_id1);
            b := UnRegisterHotkey(Handle, HotKey_id2);
            if a and b then
              HotKeySet := False;
          end;
          if not HotkeySet then
          begin
            HotKey_id1 := GlobalAddAtom('@CTRL+ADD');
            a := RegisterHotkey(Handle, HotKey_id1, MOD_CONTROL, VK_ADD);
            HotKey_id2 := GlobalAddAtom('@CTRL+SUB');
            b := RegisterHotkey(Handle, HotKey_id2, MOD_CONTROL, VK_SUBTRACT);
            if a and b then
              HotKeySet := True;
          end;
        end;
    end;
end;

procedure TPlotPanel.WMHotkey(var Mes: TWMHotkey);
begin
  inherited;
  {if not (csDesigning in ComponentState) then
   begin   }
  if Mes.hotkey = HotKey_id1 then
    Buttons[btnZoomIn].Click
  else
    if Mes.hotkey = HotKey_id2 then
    Buttons[btnZoomOut].Click;
  { end; }
end;

procedure TPlotPanel.WMSetStyle(var Mes: TMessage);
var
  b: boolean;
begin
  if Mes.LParam = 0 then
    b := False
  else
    b := True;
  if (Mes.WParam >= 0) and (Mes.WParam < btnCount)
    then
    Buttons[Mes.WParam].Down := b;
end;

procedure TPlotPanel.WMDestroy(var Mes: TWMDestroy);
var
  lpMsgBuf: array of char;
begin
  if not (csDesigning in ComponentState) then
    if Handle > 0 then
    begin

      UnRegisterHotkey(Handle, HotKey_id1);
      UnRegisterHotkey(Handle, HotKey_id2);

      HotKey_id2 := GlobalDeleteAtom(HotKey_id2);

      if GlobalDeleteAtom(HotKey_id1) <> 0 then
      begin
        // SetLastError(327) ;
        FormatMessage(
          FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM,
          nil,
          GetLastError(),
          // #define MAKELANGID(p, s) ((((WORD) (s)) << 10) | (WORD) (p))
          // MAKELANGID( LANG_NEUTRAL, SUBLANG_DEFAULT) Default language
          (Word(SUBLANG_DEFAULT) shl 10) or Word(LANG_NEUTRAL),
          @lpMsgBuf,
          0,
          nil
          );
        // Display the string.
        MessageBox(0, @lpMsgBuf, 'Error GlobalDeleteAtom', MB_OK or MB_ICONINFORMATION);
        // Free the buffer.
        // LocalFree(lpMsgBuf);
      end;
    end;
end;

destructor TPlotPanel.Destroy;
var
  i: integer;
begin
  for i := 0 to btnCount - 1 do
    Buttons[i].Free;
  inherited;
end;

procedure TPlotPanel.SetPlotWindow(Value: TPlotWindow32);
var
  i: integer;
begin
  FPlotWindow := Value;
  if Value <> nil then
  begin
    for i := 0 to btnCount - 1 do
      if Buttons[i].Caption <> '|' then
        Buttons[i].Enabled := True;
    //Buttons[btnMenuMode].Enabled := False;
    //Buttons[btnSettin].Enabled := False;
    // Buttons[btnGrLogY].Enabled := False;
    //*************************************//
    Hold := FHold;
  end
  else
  begin
    if Buttons[0] <> nil then
      for i := 0 to btnCount - 1 do
        Buttons[i].Enabled := False;
    Hold := False;
  end;
end;

procedure TPlotPanel.SetHold(const Value: boolean);
begin
  FHold := Value;
  if Value then
    if FPlotWindow <> nil then
    begin
      FPlotWindow.Parent := Self;
      FPlotWindow.Align := alBottom;
      ResizeButtons;
    end
end;

procedure TPlotPanel.SetBottomLine(const Value: TBottomLine);
begin
  FBottomLine := Value;
  Repaint;
end;

procedure TPlotPanel.Paint;
const
  lnMargin = 3;
var
  TopColor, BottomColor: TColor;
  //  i : integer;
begin
  inherited;

  with Canvas do
  begin
    TopColor := clBtnShadow;
    BottomColor := clBtnHighlight;

    case BottomLine of
      blNone:
        begin
        end;
      blLine:
        begin
          Pen.Style := psSolid;
          Pen.Color := TopColor;
          Canvas.MoveTo(lnMargin, FButtonsHeight - 4);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 4);
          Pen.Color := BottomColor;
          Canvas.MoveTo(lnMargin, FButtonsHeight - 3);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 3);
        end;
      blDblLine:
        begin
          Pen.Style := psSolid;
          Pen.Color := TopColor;
          Canvas.MoveTo(lnMargin, FButtonsHeight - 6);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 6);
          Canvas.MoveTo(lnMargin, FButtonsHeight - 4);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 4);
          Pen.Color := BottomColor;
          Canvas.MoveTo(lnMargin, FButtonsHeight - 5);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 5);
          Canvas.MoveTo(lnMargin, FButtonsHeight - 3);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 3);
        end;
      blDot:
        begin
          Pen.Style := psDot;
          Pen.Color := TopColor;
          Canvas.MoveTo(lnMargin, FButtonsHeight - 4);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 4);
          Pen.Color := BottomColor;
          Canvas.MoveTo(lnMargin, FButtonsHeight - 3);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 3);
        end;
      blDblDot:
        begin
          Pen.Style := psDot;
          Pen.Color := TopColor;
          Canvas.MoveTo(lnMargin, FButtonsHeight - 6);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 6);
          Canvas.MoveTo(lnMargin, FButtonsHeight - 4);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 4);
          Pen.Color := BottomColor;
          Canvas.MoveTo(lnMargin, FButtonsHeight - 5);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 5);
          Canvas.MoveTo(lnMargin, FButtonsHeight - 3);
          Canvas.LineTo(Width - lnMargin, FButtonsHeight - 3);
        end;
    end;
  end;
end;

procedure TPlotPanel.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if AComponent = PlotWindow then
    begin
      if (csDestroying in ComponentState) then
      begin
        FPlotWindow := nil;
        FHold := False;
      end
      else
      begin
        PlotWindow := nil;
        Hold := False;
      end;
    end;
end;

function TPlotPanel.ClickButton(Button: word): boolean;
begin
  Result := False;
  if Button < btnCount then
  begin
    ButtonClick(Buttons[Button]);
    Result := True;
  end;
end;

procedure TPlotPanel.SetName(const Value: TComponentName);
begin
  inherited SetName(Value);
  if csDesigning in ComponentState then
    Caption := '';
end;

{ TFFTPlot32 }

constructor TFFTPlot32.Create(AOwner: TComponent);
begin
  inherited;

  ColorMax := clRed;
  ColorMid1 := clYellow;
  ColorMid2 := TColor($0080FF);
  ColorMin := clGreen;

  FLogScale := false;
  FMaxAmp := 100;
  FMinAmp := 0;
  FFreqMin := 50;
  FFreqMax := 10000;
  FColorMin := clGreen;
  FColorMax := clRed;
  LevelCount := 3;
end;

procedure TFFTPlot32.DoPaintBuffer;
begin
  inherited;
  if IsRectEmpty(fRect) then
    Exit;

  PaintLevels;
end;

procedure TFFTPlot32.PaintLevel(ind: integer; var OldTextCoord: integer);
begin
  //
end;

procedure TFFTPlot32.PaintLevels;
var
  ind, OldTextCoord: integer;
  x: integer;
  xMin, xMax, yMax, yPos, yZero: integer;
  FPlotRect: TRect;
  width, height: integer;
  MinMax: single;
  str: string;
  ColorMin32, ColorMid1_32, ColorMid2_32, ColorMax32: TColor32;
begin

  FPlotRect := GetPlotRect;
  DCM32.InflateRect(FPlotRect, -1, -1);
  if isRectEmpty(FPlotRect) then
    Exit;

  OldTextCoord := FPlotRect.left - PLOTXMinAxis;

  if MaxAmp = 0 then
    Exit;

  yZero := FPlotRect.Bottom - 1;
  xMax := 0;
  xMin := 0;

  ColorMin32 := Color32(ColorMin);
  ColorMid1_32 := Color32(ColorMid1);
  ColorMid2_32 := Color32(ColorMid2);
  ColorMax32 := Color32(ColorMax);

  for ind := 0 to High(Levels) do
  begin
    //*********** PaintLevel(ind: integer; var OldTextCoord : integer);***//
    //********************************************************************//
    if ind > high(Levels) then
      Continue;
    if Levels[ind].fMin > Levels[ind].fMax then
      Continue;
    if (FreqMax < 0) or (FreqMin < 0) then
      Continue;

    MinMax := FreqMax - FreqMin;
    width := FPlotRect.Right - FPlotRect.Left; // -1
    height := FPlotRect.Bottom - FPlotRect.Top - 1;

    if FLogScale then
    begin
      if (MinMax <= 0) or (FreqMin <= 0) or (Levels[ind].fMin <= 0) or (Levels[ind].fMax <= 0) then
        Continue;
      MinMax := Log10(FreqMax / FreqMin);
      xMin := Round(Log10(Levels[ind].fMin / FreqMin) / MinMax * width);
      if xMin > 0 then
        xMin := xMin + FPlotRect.Left
      else
        xMin := FPlotRect.Left;
      xMax := Round(Log10(Levels[ind].fMax / FreqMin) / MinMax * width);
      if xMax > 0 then
        xMax := xMax + FPlotRect.Left
      else
        Continue;
    end
    else
    begin
      xMin := Round((Levels[ind].fMin - FreqMin) / MinMax * width);
      if xMin > 0 then
        xMin := xMin + FPlotRect.Left
      else
        xMin := FPlotRect.Left;
      xMax := Round((Levels[ind].fMax - FreqMin) / MinMax * width);
      if xMax > 0 then
        xMax := xMax + FPlotRect.Left
      else
        Continue;
    end;

    yMax := (FPlotRect.Bottom - 1) - Round(Levels[ind].Max / MaxAmp * height);
    yPos := (FPlotRect.Bottom - 1) - Round(Levels[ind].Position / MaxAmp * height);

    if yPos < FPlotRect.Top then
    begin yPos := FPlotRect.Top;
      Buffer.SetStipple([ColorMid2_32, ColorMax32]);
      Buffer.StippleStep := 1 / height;
    end
    else
      if yPos > yMax then
    begin
      Buffer.SetStipple([ColorMin32, ColorMid1_32, ColorMid2_32]);
      if (yZero - yMax) > 0 then //       (
        Buffer.StippleStep := 2 / (yZero - yMax) //1 = Number of colors in a pattern - 1
      else
        Buffer.StippleStep := 1;
    end
    else
    begin
      Buffer.SetStipple([ColorMin32, ColorMid1_32, ColorMax32]);
      if (yZero - yPos) > 0 then
        Buffer.StippleStep := 2 / (yZero - yPos) //2 = Number of colors in a pattern - 1
      else
        Buffer.StippleStep := 1;
    end;

    if (xMax - xMin) > 1 then
      xMax := xMax - 1;

    with Buffer do
    begin
      for x := xMin to xMax do
      begin
        StippleCounter := 0;
        VertLineTSP(x, yZero, yPos);
      end;

      if (xMin - OldTextCoord > PLOTXNormAxis) and (xMin < FPlotRect.Right - PLOTXNormAxis) then
      begin
        VertLineS(xMin, yzero, yzero + 3, clGreen32);
        str := FloatToStrG(Levels[ind].fMin, 4, 3);
        Textout(xMin - TextWidth(str) div 2, yzero + 10, str);
        OldTextCoord := xMin;
      end;
      RaiseRectTS(xMin, yPos, xMax + 1, yZero + 1, 24);
      RaiseRectTS(xMin + 1, yPos + 1, xMax, yZero, 16);
      RaiseRectTS(xMin + 2, yPos + 2, xMax - 1, yZero - 1, 12);

      if (yMax < (FPlotRect.Bottom - 1)) and (yMax > FPlotRect.top) then
        HorzLine(xMin, yMax, xMax, clRed32);
    end;
  end;
  with buffer do
  begin
    VertLineS(FPlotRect.Right, yZero, yzero + 3, clGreen32);
    str := FloatToStrG(FreqMax, 3, 2);
    Textout(FPlotRect.Right, yZero + 10, str);
    VertLineS(FPlotRect.Left, yZero, yzero + 3, clGreen32);
    str := FloatToStrG(FreqMin, 3, 2);
    Textout(FPlotRect.left - TextWidth(str), yZero + 10, str);
    Textout(FPlotRect.left - 15, yZero - 5, '0');

    str := FloatToStrG(MaxAmp, 3, 2);
    Textout(FPlotRect.left - TextWidth(str) - 10, FPlotRect.Top - 5, str);
  end;
end;

procedure TFFTPlot32.SetColorMax(const Value: TColor);
begin
  FColorMax := Value;
  invalidate;
end;

procedure TFFTPlot32.SetColorMid1(const Value: TColor);
begin
  FColorMid1 := Value;
  invalidate;
end;

procedure TFFTPlot32.SetColorMid2(const Value: TColor);
begin
  FColorMid2 := Value;
  invalidate;
end;

procedure TFFTPlot32.SetColorMin(const Value: TColor);
begin
  FColorMin := Value;
  invalidate;
end;

procedure TFFTPlot32.SetFreqMax(const Value: single);
begin
  if Value > FreqMin then
  begin
    FFreqMax := Value;
    Invalidate;
  end;
end;

procedure TFFTPlot32.SetFreqMin(const Value: single);
begin
  if Value < FreqMax then
  begin
    FFreqMin := Value;
    Invalidate;
  end;
end;

procedure TFFTPlot32.SetLevelCount(const Value: word);
var
  i: word;
begin
  if Value > 0 then
  begin
    FLevelCount := Value;
    SetLength(Levels, Value);
    if csDesigning in ComponentState then
    begin
      Randomize;
      for i := 0 to Value - 1 do
      begin
        Levels[i].Max := MaxAmp * (0.5 + 0.5 * Random(11) / 10);
        Levels[i].Position := MaxAmp * Random(11) / 10;
        Levels[i].FMin := FreqMin + (FreqMax - FreqMin) / Value * i;
        Levels[i].FMax := FreqMin + (FreqMax - FreqMin) / Value * (i + 1);
      end;
    end;
  end
  else
  begin
    FLevelCount := 0;
    SetLength(Levels, FLevelCount);
  end;
  Invalidate;
end;

procedure TFFTPlot32.SetLogScale(const Value: boolean);
begin
  FLogScale := Value;
  invalidate;
end;

procedure TFFTPlot32.SetMaxAmp(const Value: single);
begin
  if (Value > 0) and (FMinAmp < Value) then
  begin
    FMaxAmp := Value;
    invalidate;
  end;
end;

procedure TFFTPlot32.SetMinAmp(const Value: single);
begin
  if (Value >= 0) and (FMaxAmp > Value) then
  begin
    FMinAmp := Value;
    invalidate;
  end;
end;

{ TBoundPopupMenu }

constructor TBoundPopupMenu.Create;
begin
  inherited Create(AOwner);
  Name := 'internalPopupMenu';
  SetSubComponent(True);
end;

end.

