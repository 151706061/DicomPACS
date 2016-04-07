{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}

{  lines 5516, 5428 - LargePict       9490 - MiniPict
}

unit Dcm_View;
{$I DicomPack.inc}

{.$DEFINE DICOMDEBUG}

{.$DEFINE NEED3DPLOT}

{.$DEFINE ZOOM_SYNC_AFTER_CHANGE}

interface

uses
  {$IFDEF LINUX}Types, Libc, {$ELSE}Windows, {$ENDIF}Classes, Messages, Controls,
  {$IFDEF DICOMDEBUG}DbugIntf, {$ENDIF}CnsJpgGr, shellapi, DCM_Bitmap16, Buttons,
  SysUtils, StdCtrls, Forms, ExtCtrls, Menus, clipbrd, DCM32_Transforms, DCM_Client,
  Graphics, DCM32, Dcm_Attributes, DCM_Dict, DB, DCM_Def, cnsMsg, DicomVFWView, comctrls,
  DCM_ImageData_Bitmap32, jpeg;

type
  TCnsImageUI = (iuiForm2005, iuiForm2006, iuiFormCustom);
  TCnsImageToolbarMode = (itmXRayMode, itmUltrasoundMode);

  TDicomHint = class(TCustomControl)
  private
    fText: string;
    fFont: TFont;
    procedure SetText(s: string);
    procedure SetFont(f: TFont);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
    property Text: string read fText write SetText;
    //property Color:TColor read fColor write SetColor;
    property Font: TFont read fFont write SetFont;
  end;
  TMagnifierView = class(TCnsCustomPaintBox32)
  private
    FViewSize: integer;
    FScallSize: Integer;
    procedure SetScallSize(const Value: Integer);
    procedure SetViewSize(const Value: integer);

  protected
    procedure DoPaintBuffer; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
  public
    property ViewSize: integer read FViewSize write SetViewSize;
    property ScallSize: Integer read FScallSize write SetScallSize;
  end;
  PShort = ^Short;

  TQCValueItem = class
  public
    xl: Double;
    xm: Double;
    xh: Double;
    fDate: TDatetime;
    constructor Create;
    procedure Reset;
  end;
  TQCCal = class
  public
    x: Double;
    sd: Double;
    cv: Double;
    constructor Create;
    destructor Destroy; override;
    procedure Reset;
    //    procedure CalFrom(AArray: TValArray);
  end;
  TQCView = class(TCustomControl)
  private
    { Private fields of TQCView }
    FBaseDate: TDatetime;

    FSD1: Double;
    FX1: Double;
    FSD2: Double;
    FX2: Double;
    FSD3: Double;
    FX3: Double;
    FTitle: string;
    FHOSNAME: string;
    FTitleFont: TFont;

    MonthStr: string;
    { Private methods of TQCView }
    procedure SetTitle(Value: string);
    procedure SetTitleFont(Value: TFont);
    procedure CheckBoxClick(Sender: TObject);
  protected
    { Protected fields of TQCView }
    fValueList: TList;

    fHCal: TQCCal;
    fMCal: TQCCal;
    fLCal: TQCCal;

    FHighLevelCheck: TCheckBox;
    FMidLevelCheck: TCheckBox;
    FLowLevelCheck1: TCheckBox;
    { Protected methods of TQCView }
    procedure Click; override;

    function FindDateValue(ADate: TDatetime): TQCValueItem;
    function GetAValL(AIndex: Integer): Double;
    function GetAValM(AIndex: Integer): Double;
    function GetAValH(AIndex: Integer): Double;
    procedure AddDate(ADate: TDatetime);
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
  public
    ComboBox2: TComboBox;
    { Public fields and properties of TQCView }
    { Public methods of TQCView }
    procedure ComboBox2Change(Sender: TObject);
    function GetDateRange(ADate: TDatetime; FormatStr: string): string;
    procedure AddL(val: Real; adate: TDatetime);
    procedure AddM(val: Real; adate: TDatetime);
    procedure AddH(val: Real; adate: TDatetime);

    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
    procedure PaintTo(ACanvas: TCanvas); virtual;
    destructor Destroy; override;

    procedure DrawLine(ACanvas: TCanvas; ALeft, ATop, AWidth, AHeight: Integer);
    procedure Refresh;

    procedure Clear;
    procedure Print(Sender: TObject; APrintDC: HDC; AParamStr: string; ARect:
      TRect);
    procedure PrintByCanvas(ACanvas: TCanvas; AParamStr: string; ARect: TRect);

    property HCal: TQCCal read fHCal;
    property MCal: TQCCal read fMCal;
    property LCal: TQCCal read fLCal;

    property AValL[Index: integer]: Double read getAValL;
    property AValM[Index: integer]: Double read getAValM;
    property AValH[Index: integer]: Double read getAValH;
  published
    { Published properties of TQCView }
    property Align;
    property Anchors;
    property Hint;
    property ShowHint;

    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property Title: string read FTitle write SetTitle;
    property HospitalName: string read FHOSNAME write FHOSNAME;
    property TitleFont: TFont read FTitleFont write SetTitleFont;
    //    property BaseDate: TDatetime read FBaseDate write fBaseDate;

    property SD1: Double read FSD1 write FSD1;
    property X1: Double read FX1 write FX1;
    property SD2: Double read FSD2 write FSD2;
    property X2: Double read FX2 write FX2;
    property SD3: Double read FSD3 write FSD3;
    property X3: Double read FX3 write FX3;
  end;
  TDicomMultiViewer = class;

  {$IFDEF USE_BITMAP32_VIEWER}
  TCustomDicomImage = class(TCnsCustomImage32)
    {$ELSE}
  TCustomDicomImage = class(TCnsCustomGDIPPaintBox)
    {$ENDIF}
  private
    //fParentViewer: TDicomMultiViewer;
    fWHint: TDicomHint;
    fMagnifierView: TMagnifierView;
    fMagnificationType: TMagnificationType;

    fTextEdit: TMemo;
    fCanMultiSelect: Boolean;

    //fOldWidth: Integer;
    //fOldHeight: Integer;
    fIgnoreMouseClick: Integer;

    FDrawGridAxiel: Boolean;

    FPrintSelectedIcon: TCnsBitmap32;
    FPrintNoSelectedIcon: TBitmap;
    FSelectedLockIcon: TCnsBitmap32;
    FDrawPrintNoSelectIcon: Boolean;

    //    FCanLockImage:Boolean;
    FPerpendicularityLine: Boolean;
    FPerpendicularityLinePos: TPoint;

    FMyPopupMenu: TPopupMenu;

    FDrawObjectPopupMenu: TPopupMenu;

    FCustomPopupMenu: TPopupMenu;

    FTimer: TTimer;
    FCineLoop2: Boolean;
    FCineSpeed: Integer;
    fDSAMode: Boolean;

    // fomin 08.11.2012
//    fCineSeriesUID: string;

    fDisplayLabel: Boolean;
    fTextOverlayMode: Boolean;
    fDisplayReport: Boolean;

    //    PolygonMousePos: TPoint;
    AngleFirstPoint: TPoint;
    Angle2ndPoint: TPoint;
    LastMousePos: TPoint;
    LastChangeMousePos: TPoint;
    DownMousePos: TPoint;
    MovingMousePos: TPoint;
    MouseDownScale: Double;

    fLeftMouseInteract: TMouseInteract;
    fRightMouseInteract: TMouseInteract;
    fMouseWheelInteract: TMouseWheelInteract;
    fMouseDragging: Boolean;
    fDraggingMouseButton: TMouseButton;

    //    fPolygon: TCnsPolygon32;

    fOnCanLock: TDicomImageCanLockEvent;
    //    fOnPopupClick: TOnPopupMenuClickEvent;
    //    fOnDicomPrintClick: TOnDicomPrintClickEvent;
    FOnImageCineTo: TDicomImageCineToEvent;
    FOnImageWinLevelChange: TWinLevelChangeEvent;
    FOnImageScrollChange: TImageScrollChangeEvent;
    FOnImageZoomChange: TImageZoomChangeEvent;
    fOnReturnObjectSelect: TNotifyEvent;
    fOnDicomImageLock: TDicomImageLockEvent;
    fOnTopoLineClick: TDicomImageTopoLineClickEvent;
    fOnOverlayLabel: TOnOverlayLabelEvent;
    FOnViewFlagChange: TNotifyEvent;

    fOnDatasetChanged: TNotifyEvent;

    fOnCustomPopupMenuPopup: TNotifyEvent;
    //    fOnCustomPopupMenuClick: TNotifyEvent;

    // fomin 08.11.2012
//    fDrawCine: TDicomDirectDrawCine;

    fMagnificationFactor: Integer;

    FAfterNewDrawObject: TDrawObjectNotifyEvent;
    FAfterObjectSize: TDrawObjectNotifyEvent;
    FAfterObjectMove: TDrawObjectNotifyEvent;

    fJustDBLCLick: Boolean;
    fInMovingMouseProcess: Boolean;
    FOn3DCursorMove: TOn3DCursorEvent;
    FPositionCursorPosition: TPoint;
    FOn3DCursorEnd: TNotifyEvent;
    FPositionCursorColor: TColor32;
    FLeaderFrom: Integer;
    FLeaderPerPage: Integer;
    FLeaderCount: Integer;
    FLeaderScale: Integer;
    FMMFactor: Integer;
    FLeaderZoomFactor: Integer;
    FLineColor: TColor;
    FPlotColor: TColor;
    FDragFrom: TDragFromSource;
    FCustomFormat: string;
    //FOnCustomDrawObjectPopupMenuClick: TNotifyEvent;
    FOnCustomDrawObjectPopupMenuPopup: TNotifyEvent;
    FImageAngle: Double;
    FModify: Boolean;
    FDisplayRuler: Boolean;
    FDragDropMode: TDragDropMode;
    FOnDragDropToPrint: TOnDragDropToPrintEvent;
    FOnCustomOverlayLabel: TOnOverlayLabelEvent;
    FDisplayBottomRuler: Boolean;
    FDisplayRightRuler: Boolean;
    FDisplayWLLabel: Boolean;

    procedure DoFinishNewDrawObject(Sender: TObject);
    procedure DoDrawObjectSize(Sender: TObject);
    procedure DoDrawObjectMove(Sender: TObject);

    procedure DoDirectDrawCine(Sender: TObject; AIndex: Integer);

    //    procedure SetAttributes(Value: TDicomAttributes);
    function GetAttributes: TDicomAttributes;

    procedure SetDicomDatasets(Value: TDicomDatasets); virtual;
    procedure SetAttributesIndex(Index: integer);

    procedure MyPopupMenuClick(Sender: TObject);
    procedure MyPopupMenu1Popup(Sender: TObject);
    procedure MyDrawObjectPopupMenu1Popup(Sender: TObject);
    //    procedure BuildPopupMenu;

    // 08.11.2012 FOMIN
//    procedure SetCurrentFrame(AValue: Integer);

    procedure SetDSAMode(AValue: Boolean);
    function getDSAMode: Boolean;
    function getCurrentFrame: Integer;
    // fomin 08.11.2012
//    function GetFrameCount: Integer;

    procedure SetDisplayReport(AValue: Boolean);
    procedure SetDisplayLabel(AValue: Boolean);
    procedure DoPlayCine(Sender: TObject);

    procedure SelectionZoom;
    procedure SelectionROI;
    function GetSelectRect: TRect;

    procedure DrawLineInserting(x1, y1, x2, y2: Integer); overload;
    procedure DrawLineInserting; overload;

    procedure DrawArrowInserting(x1, y1, x2, y2: Integer);
    procedure DrawBoxInserting;
    procedure DrawEllipseInserting;
    //    procedure DrawAngleInserting;
    procedure DrawRulerInserting(x1, y1, x2, y2: Integer);
    procedure DrawPLineInserting;
    procedure DrawPGridInserting;

    procedure SetLeftMouseInteract(Value: TMouseInteract);
    procedure SetRightMouseInteract(Value: TMouseInteract);
    function GetCanLockImage: Boolean;
    procedure SetLeaderMouserInspect(Value: TLeaderMouserInspect);
    function GetLeaderMouserInspect: TLeaderMouserInspect;
    procedure SetOn3DCursorMove(const Value: TOn3DCursorEvent);
    procedure SetPositionCursorPosition(const Value: TPoint);
    procedure SetOn3DCursorEnd(const Value: TNotifyEvent);
    procedure SetPositionCursorColor(const Value: TColor32);
    procedure DrawBackgroupLines(ACanvas: TCnsBitmap32; MMFactor,
      FLeaderPerPage, FLeaderFrom, ALeft, ATop, AHeight, AWidth: Integer);
    procedure DrawECGLines(ACanvas: TCnsBitmap32; ALeft, ATop, AHeight,
      AWidth: Integer);
    procedure SetLeaderCount(const Value: Integer);
    procedure SetLeaderFrom(const Value: Integer);
    procedure SetLeaderPerPage(const Value: Integer);
    procedure SetLeaderScale(const Value: Integer);
    procedure SetLeaderZoomFactor(const Value: Integer);
    procedure SetMMFactor(const Value: Integer);
    procedure SetDragFrom(const Value: TDragFromSource);
    procedure SetCustomFormat(const Value: string);
    procedure SetOnCustomDrawObjectPopupMenuPopup(
      const Value: TNotifyEvent);
    procedure SetImageAngle(const Value: Double);
    procedure SetModify(const Value: Boolean);
    procedure SetLockImage(const Value: Boolean);
    procedure SetDisplayRuler(const Value: Boolean);
    procedure SetDragDropMode(const Value: TDragDropMode);
    procedure SetOnDragDropToPrint(const Value: TOnDragDropToPrintEvent);
    procedure SetOnCustomOverlayLabel(const Value: TOnOverlayLabelEvent);
    procedure SetDisplayBottomRuler(const Value: Boolean);
    procedure SetDisplayRightRuler(const Value: Boolean);
    procedure SetDisplayWLLabel(const Value: Boolean);
  private
    FCanCheckSize: Boolean;
    FShowPixelValueHint: Boolean;
    FOn3DCursorStart: TOn3DCursorEvent;
    fParentViewer: TDicomMultiViewer;
    procedure SetCanCheckSize(const Value: Boolean);
    procedure SetShowPixelValueHint(const Value: Boolean);
    procedure SetOn3DCursorStart(const Value: TOn3DCursorEvent);
  protected
    //    FAttributes_: TDicomAttributes;
    FLockImage: Boolean;
    FNoLockByUpper: Boolean;
    FDicomDatasets: TDicomDatasets;
    FAttributesIndex: integer;
    //WheelDeltaCount:Integer;

    fBeforeMouseDownLeftMouseInteract: TMouseInteract;
    fBeforeMouseDownRightMouseInteract: TMouseInteract;

    CineToolbar: TPanel;

    // fomin 08.11.2012
//    fCineScrollBar: TScrollBar;

    procedure btnPlayClick(Sender: TObject);
    procedure btnDSAClick(Sender: TObject);
    procedure btnDirectionClick(Sender: TObject);
    procedure cineScrollBarScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetScale(Value: Single); override;
    procedure SetOffsetHorz(Value: Single); override;
    procedure SetOffsetVert(Value: Single); override;
    procedure CMWantSpecialKey(var Msg: TCMWantSpecialKey); message CM_WANTSPECIALKEY;

    procedure DoPaintGDIOverlay; override;

    //    procedure MouseLeave; override;
    //    procedure MouseEnter; override;
    procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean;
      override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure DblClick; override;

    procedure CancelInteracts;
    procedure TextEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActiveTextEdit;
    procedure UpdateTextEdit;
    procedure RemoveTextEdit;
    procedure TextEditExit(Sender: TObject);

    procedure InitDefaultStages; override;

    procedure SetCine(Value: Boolean);
    function GetCine: Boolean;
    procedure SetCineSpeed(AValue: Integer);
    function GetCineSpeed: Integer;
    procedure SetCineDirection(AValue: Boolean);
    function GetCineDirection: Boolean;

    procedure DragOver(Source: TObject; X, Y: Integer; State: Controls.TDragState; var Accept:
      Boolean); override;
    procedure DragDrop(Source: TObject; X, Y: Integer); override;

    procedure UpdateHint(x, y: integer);
    procedure UpdateMagnifier(x, y: integer);
    procedure UpdateHintEx(x, y: integer; AText: string);
    procedure SetMagnificationType(Value: TMagnificationType);

    function GetBasicScale: Double;
    function GetBasicOffsetVert: Double;
    function GetBasicOffsetHorz: Double;

  public
 //   FOnImageCineTo: TDicomImageCineToEvent;
    // fomin 08.11.2012
    fCineSeriesUID: string;
    // fomin 08.11.2012
    fCineScrollBar: TScrollBar;
    // fomin 08.11.2012
    fDrawCine: TDicomDirectDrawCine;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    // fomin 08.11.2012
    function GetFrameCount: Integer;
    // 08.11.2012 FOMIN
    procedure SetCurrentFrame(AValue: Integer);

    function YScr2Bmp(y: integer): integer;
    function XScr2Bmp(x: integer): integer;
    function YBmp2Scr(y: integer): integer; overload;
    function XBmp2Scr(x: integer): integer; overload;

    function YBmp2Scr(y: Double): integer; overload;
    function XBmp2Scr(x: Double): integer; overload;

    procedure SetView(AOffsetVert, AOffsetHorz: Single); override;
    procedure Resize; override;
    //    procedure SaveLayerToAttributes;
    //    procedure LoadLayerFromAttributes;
    procedure SetPresentationSate(ADataset: TDicomDataset);
    function CreatePresentationState: TDicomDataset;

    procedure BuildCineToolbar;
    procedure ClearCineToolbar;

    procedure Next; virtual;
    procedure Prior; virtual;
    procedure UpdateX;
    function CheckSize: Boolean;
    procedure UpdateEX;
    procedure Changed; override;
    procedure AttributesChanged;
    procedure Clear;

    procedure smooth;
    procedure sharpen;
    procedure findEdges;
    procedure DoProcess(op: TImageProcessOp; value: Integer);

    {$IFDEF USE_BITMAP32_VIEWER}
    procedure ExecCustom(Dest: TCnsBitmap32; StageNum: Integer); override; // PST_CUSTOM
    {$ELSE}
    procedure ExecCustom(Dest: TGPGraphics; StageNum: Integer); override; // PST_CUSTOM
    {$ENDIF}

    procedure ResetImage;
    procedure Negative;
    procedure SetWinLevel(AWin, ALevel: Integer);
    procedure SetLut(AStream: TStream);

    property PositionCursorPosition: TPoint read FPositionCursorPosition write SetPositionCursorPosition;
    property PositionCursorColor: TColor32 read FPositionCursorColor write SetPositionCursorColor;

    property DSAMode: Boolean read GetDSAMode write SetDSAMode;

    property CurrentFrame: Integer read getCurrentFrame write SetCurrentFrame;

    property DisplayLabel: Boolean read fDisplayLabel write SetDisplayLabel;
    property DisplayWLLabel: Boolean read FDisplayWLLabel write SetDisplayWLLabel;
    property DisplayRuler: Boolean read FDisplayRuler write SetDisplayRuler;
    property DisplayRightRuler: Boolean read FDisplayRightRuler write SetDisplayRightRuler;
    property DisplayBottomRuler: Boolean read FDisplayBottomRuler write SetDisplayBottomRuler;

    property ShowPixelValueHint: Boolean read FShowPixelValueHint write SetShowPixelValueHint;

    property TextOverlayMode: Boolean read fTextOverlayMode write fTextOverlayMode;
    property DisplayReport: Boolean read fDisplayReport write SetDisplayReport;
    property CanCheckSize: Boolean read FCanCheckSize write SetCanCheckSize;

    property FrameCount: Integer read GetFrameCount;
    property ParentViewer: TDicomMultiViewer read fParentViewer;
    property Attributes: TDicomAttributes read GetAttributes; // write SetAttributes;
    property LeaderMouserInspect: TLeaderMouserInspect read GetLeaderMouserInspect write
      SetLeaderMouserInspect;

    property DicomDatasets: TDicomDatasets read FDicomDatasets write SetDicomDatasets;
    property AttributesIndex: integer read FAttributesIndex write SetAttributesIndex;
    property LockImage: Boolean read FLockImage write SetLockImage;
    property PerpendicularityLine: Boolean read FPerpendicularityLine write FPerpendicularityLine;
    property CanMultiSelect: Boolean read fCanMultiSelect write fCanMultiSelect;
    //    property CanLockImage:Boolean read GetCanLockImage;

    property DrawCine: TDicomDirectDrawCine read fDrawCine;

    property LeftMouseInteract: TMouseInteract read fLeftMouseInteract write SetLeftMouseInteract;
    property RightMouseInteract: TMouseInteract read fRightMouseInteract write
      SetRightMouseInteract;
    property MouseWheelInteract: TMouseWheelInteract read fMouseWheelInteract write
      fMouseWheelInteract;

    property CineActive: Boolean read GetCine write SetCine;
    property CineDirection: Boolean read getCineDirection write SetCineDirection;
    property CineSpeed: integer read GetCineSpeed write SetCineSpeed;
    property CustomPopupMenu: TPopupMenu read FCustomPopupMenu write FCustomPopupMenu;
    //    property OnPopupClick: TOnPopupMenuClickEvent read fOnPopupClick write fOnPopupClick;
    //    property OnDicomPrintClick: TOnDicomPrintClickEvent read fOnDicomPrintClick write fOnDicomPrintClick;
    property MagnificationType: TMagnificationType read fMagnificationType write
      SetMagnificationType;

    property MMFactor: Integer read FMMFactor write SetMMFactor;
    property LeaderZoomFactor: Integer read FLeaderZoomFactor write SetLeaderZoomFactor;
    property LeaderCount: Integer read FLeaderCount write SetLeaderCount;
    property LeaderPerPage: Integer read FLeaderPerPage write SetLeaderPerPage;
    property LeaderFrom: Integer read FLeaderFrom write SetLeaderFrom;
    property LeaderScale: Integer read FLeaderScale write SetLeaderScale;
    property LineColor: TColor read FLineColor write FLineColor;
    property PlotColor: TColor read FPlotColor write FPlotColor;

    property ImageAngle: Double read FImageAngle write SetImageAngle;
    property Modify: Boolean read FModify write SetModify;

    property DragFrom: TDragFromSource read FDragFrom write SetDragFrom;
    property DragDropMode: TDragDropMode read FDragDropMode write SetDragDropMode;

    property CustomFormat: string read FCustomFormat write SetCustomFormat;

    property OnImageCineTo: TDicomImageCineToEvent read FOnImageCineTo write FOnImageCineTo;
    property OnImageWinLevelChange: TWinLevelChangeEvent read FOnImageWinLevelChange write
      FOnImageWinLevelChange;
    property OnImageScrollChange: TImageScrollChangeEvent read FOnImageScrollChange write
      FOnImageScrollChange;
    property OnImageZoomChange: TImageZoomChangeEvent read FOnImageZoomChange write
      FOnImageZoomChange;
    property OnReturnObjectSelect: TNotifyEvent read fOnReturnObjectSelect write
      fOnReturnObjectSelect;
    property OnDicomImageLock: TDicomImageLockEvent read fOnDicomImageLock write fOnDicomImageLock;
    property OnCanLock: TDicomImageCanLockEvent read fOnCanLock write fOnCanLock;

    property OnAfterNewDrawObject: TDrawObjectNotifyEvent read FAfterNewDrawObject write
      FAfterNewDrawObject;
    property OnAfterObjectSize: TDrawObjectNotifyEvent read FAfterObjectSize write
      FAfterObjectSize;
    property OnAfterObjectMove: TDrawObjectNotifyEvent read FAfterObjectMove write
      FAfterObjectMove;
    property OnTopoLineClick: TDicomImageTopoLineClickEvent read fOnTopoLineClick write
      fOnTopoLineClick;
    property OnOverlayLabel: TOnOverlayLabelEvent read fOnOverlayLabel write fOnOverlayLabel;
    property OnCustomOverlayLabel: TOnOverlayLabelEvent read FOnCustomOverlayLabel write SetOnCustomOverlayLabel;

    property OnDatasetChanged: TNotifyEvent read fOnDatasetChanged write fOnDatasetChanged;
    property OnCustomPopupMenuPopup: TNotifyEvent read fOnCustomPopupMenuPopup write
      fOnCustomPopupMenuPopup;
    //    property OnCustomPopupMenuClick: TNotifyEvent read fOnCustomPopupMenuClick write
    //      fOnCustomPopupMenuClick;
    property OnCustomDrawObjectPopupMenuPopup: TNotifyEvent read FOnCustomDrawObjectPopupMenuPopup write SetOnCustomDrawObjectPopupMenuPopup;
    //    property OnCustomDrawObjectPopupMenuClick: TNotifyEvent read FOnCustomDrawObjectPopupMenuClick write SetOnCustomDrawObjectPopupMenuClick;

    property OnDragDropToPrint: TOnDragDropToPrintEvent read FOnDragDropToPrint write SetOnDragDropToPrint;

    property OnViewFlagChange: TNotifyEvent read FOnViewFlagChange write FOnViewFlagChange;

    property On3DCursorMove: TOn3DCursorEvent read FOn3DCursorMove write SetOn3DCursorMove;
    property On3DCursorEnd: TNotifyEvent read FOn3DCursorEnd write SetOn3DCursorEnd;
    property On3DCursorStart: TOn3DCursorEvent read FOn3DCursorStart write SetOn3DCursorStart;
  end;

  TCustomDicomImageClass = class of TCustomDicomImage;

  TDicomView = class(TCustomDicomImage)
  published
    property Align;
    property Anchors;
    property AutoSize;
    property Color;
    property Constraints;
    property Cursor;
    property DragCursor;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;

    property Scale;
    property ScaleMode;

    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property MagnificationType;

    {$IFDEF USE_BITMAP32_VIEWER}
    property OnBitmapResize;
    property OnChange;
    property OnGDIOverlay;
    property OnInitStages;
    property OnPaintStage;
    {$ENDIF}
    property OnCanResize;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;

    property OnImageCineTo;
    property OnImageWinLevelChange;
    property OnImageScrollChange;
    property OnImageZoomChange;
    property OnReturnObjectSelect;
    property OnDicomImageLock;
    property OnCanLock;

    property OnAfterNewDrawObject;
    property OnAfterObjectSize;
    property OnAfterObjectMove;
    property OnTopoLineClick;
    property OnOverlayLabel;

    property OnDatasetChanged;
  end;

  TOnMPRLineChangedEvent = procedure(Sender: TObject; AIndex, ALineX1, ALineY1, ALineX2, ALineY2:
    integer) of object;

  TMPRDicomImage = class(TCustomDicomImage)
  private
    fInUpdate: Boolean;
    fVerLine: Double;
    fHozLine: Double;
    fAngle: Integer; //0..359
    fVerChanged: Boolean;
    fHozChanged: Boolean;

    //    fX1,
    //    fCycleLine1: TPoint;
    //    fCycleLine2: TPoint;
    fSeriesUID: string;
    fMouseDragging: Boolean;
    fMouseDragline: integer;
    fLastMousePos: TPoint;
    fDownMousePos: TPoint;
    fLastLinePos: TPoint;
    fCanBeRotate: Boolean;

    fOnMPRLineChanged: TOnMPRLineChangedEvent;
    fOnMPRLineChanging: TOnMPRLineChangedEvent;
    FOnAfterBuildMPRChange: TNotifyEvent;
    FOnBeforeBuildMPRChange: TNotifyEvent;
    procedure SetHozLine(const Value: Double);
    procedure SetVerLine(const Value: Double);
    procedure SetOnAfterBuildMPRChange(const Value: TNotifyEvent);
    procedure SetOnBeforeBuildMPRChange(const Value: TNotifyEvent);
  protected
    function IsInExtRect(x, y: Integer; var AIndex: Integer): Boolean;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean;
      override;
    //function IsNearLine(x1, y1: Integer): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Resize; override;
    {$IFDEF USE_BITMAP32_VIEWER}
    procedure ExecCustom(Dest: TCnsBitmap32; StageNum: Integer); override; // PST_CUSTOM
    {$ELSE}
    procedure ExecCustom(Dest: TGPGraphics; StageNum: Integer); override; // PST_CUSTOM
    {$ENDIF}
    //procedure ExecCustom(Dest: TCnsBitmap32; StageNum: Integer); override; // PST_CUSTOM

    procedure ComputePoint(xx, yy, ww, hh: Integer; var x1, x2, x3, x4, p1, p2, p3, p4: TPoint);
    procedure Next; override;
    procedure Prior; override;

    procedure Clear;

    procedure UpdateLineV;
    procedure UpdateLineH;
    property VerLine: Double read fVerLine write SetVerLine;
    property HozLine: Double read fHozLine write SetHozLine;
    property Angle: Integer read fAngle;
  published
    property SeriesUID: string read fSeriesUID write fSeriesUID;

    property CanBeRotate: Boolean read fCanBeRotate write fCanBeRotate;
    property OnMPRLineChanged: TOnMPRLineChangedEvent read fOnMPRLineChanged write
      fOnMPRLineChanged;
    property OnMPRLineChanging: TOnMPRLineChangedEvent read fOnMPRLineChanging write
      fOnMPRLineChanging;
    property OnBeforeBuildMPRChange: TNotifyEvent read FOnBeforeBuildMPRChange write SetOnBeforeBuildMPRChange;
    property OnAfterBuildMPRChange: TNotifyEvent read FOnAfterBuildMPRChange write SetOnAfterBuildMPRChange;

    property Align;
    property Anchors;
    property AutoSize;
    property Color;
    property Constraints;
    property Cursor;
    property DragCursor;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property MagnificationType;

    property Scale;
    property ScaleMode;
    {$IFDEF USE_BITMAP32_VIEWER}
    property OnBitmapResize;
    property OnChange;
    property OnInitStages;
    property OnGDIOverlay;
    property OnPaintStage;
    {$ENDIF}
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;

    property OnImageCineTo;
    property OnImageWinLevelChange;
    property OnImageScrollChange;
    property OnImageZoomChange;
    property OnReturnObjectSelect;
    property OnDicomImageLock;
    property OnCanLock;

    property OnAfterNewDrawObject;
    property OnAfterObjectSize;
    property OnAfterObjectMove;
    property OnTopoLineClick;
    property OnOverlayLabel;
    property OnDatasetChanged;
  end;

  TOnCreateDicomViewItemEvent = procedure(Sender: TObject; const ARow, AColumn: Integer; var AItem: TCustomDicomImage) of object;

  TDicomMultiViewer = class(TCustomControl)
  private
    fCustomDicomImageClass: TCustomDicomImageClass;

    fUpdateAllImageProperty: Boolean;
    fCanMultiSelect: Boolean;
    fLimitOneSeries: Boolean;
    fOnlyViewMultiSelected1: Boolean;
    fOnlyViewMultiSelected2: Boolean;
    fOnlyViewMultiSelected3: Boolean;
    fOnlyViewMultiSelected4: Boolean;

    fScrollBar: TScrollBar;

    fLeftMouseInteract: TMouseInteract;
    fRightMouseInteract: TMouseInteract;
    fMouseWheelInteract: TMouseWheelInteract;

    fOnCanLock: TDicomImageCanLockEvent;
    FOnShowToolbarOrView: TDicomImageToolbarShowEvent;
    FOnViewSelected: TNotifyEvent;
    FOnMultiViewSelected: TNotifyEvent;
    FOnViewFlagChange: TNotifyEvent;
    fOnReturnObjectSelect: TNotifyEvent;
    FOnCurrentImageTo: TDicomImageStackToEvent;
    FOnImageCineTo: TDicomImageCineToEvent;
    FOnDicomSave: TDicomAttributesNeedSaveEvent;
    fOnViewDblClickSelect: TNotifyEvent;
    //    FOnAddNewObj: TOnAddNewObjEvent;
    //fOnPopupClick: TOnPopupMenuClickEvent;
    //fOnDicomPrintClick: TOnDicomPrintClickEvent;
    //    FOnGetZoomFilter: TOnGetZoomFilterEvent;
    FOnViewKeyDown: TKeyEvent;

    FOnImageWinLevelChange: TWinLevelChangeEvent;
    FOnImageScrollChange: TImageScrollChangeEvent;
    FOnImageZoomChange: TImageZoomChangeEvent;

    FOnDicomLockChange: TDicomLockChangeEvent;

    fFullSeriesView: TCustomDicomImage;
    fOldRows: Integer;
    fOldColumn: Integer;
    fOldCurrentImage: Integer;
    fOldPosition: TRect;
    fOldSeriesUID: string;
    FDblClickToFullSeries: Boolean;

    FViews: TList;
    FDicomDatasets: TDicomDatasets;
    FCurrentImage: Integer;
    FColumns: Integer;
    FRows: Integer;

    FActiveView: TCustomDicomImage;
    FMoveActiveView: TCustomDicomImage;

    //FFullScreenView: TCustomDicomImage;
    FLockCount: integer;
    //backupRect: TRect;

    fAutoGrid: Boolean;

    fLeftLeaderMouserInspect: TLeaderMouserInspect;

    FAfterNewDrawObject: TDrawObjectNotifyEvent;
    FAfterObjectSize: TDrawObjectNotifyEvent;
    FAfterObjectMove: TDrawObjectNotifyEvent;

    fOnDatasetChanged: TNotifyEvent;
    fOnCustomPopupMenuPopup: TNotifyEvent;
    //    fOnCustomPopupMenuClick: TNotifyEvent;

    fSeriesUID: string;
    fInUpdating: Boolean;

    fDisplayLabel: Boolean;
    fTextOverlayMode: Boolean;

    FBackupDicomDatasets: TDicomDatasets;
    FBackupCurrentImage: Integer;
    fBackupSeriesUID: string;
    fWhiteGrid: Boolean;
    FOnTopoLineClick: TDicomImageTopoLineClickEvent;
    FOn3DCursorMove: TOn3DCursorEvent;
    FOn3DCursorEnd: TNotifyEvent;
    FOnCreateDicomViewItem: TOnCreateDicomViewItemEvent;
    FDragFrom: TDragFromSource;
    FOnCustomDrawObjectPopupMenuPopup: TNotifyEvent;
    FImageAngle: Double;
    FScrollBarVisible: boolean;
    FDisplayRuler: Boolean;
    FMultiViewMode: TMultiViewMode;
    FCustomViewSetting: string;
    FOnViewDragDropEvent: TDragDropEvent;
    FOnViewDragOverEvent: TDragOverEvent;

    FOnSetPresetWidthLevel: TDicomImagePresetWidthLevelEvent;
    FDragDropMode: TDragDropMode;
    FOnDragDropToPrint: TOnDragDropToPrintEvent;
    FOnViewStartDrag: TStartDragEvent;
    fOnOverlayLabel: TOnOverlayLabelEvent;
    FOnCustomOverlayLabel: TOnOverlayLabelEvent;
    FDisplayBottomRuler: Boolean;
    FDisplayRightRuler: Boolean;
    FDisplayWLLabel: Boolean;
    FCanCheckSize: Boolean;
    FShowPixelValueHint: Boolean;
    FOnViewMouseUp: TMouseEvent;
    FOnViewMouseDown: TMouseEvent;
    FOnViewMouseMove: TMouseMoveEvent;
    FOn3DCursorStart: TOn3DCursorEvent;

    procedure DoFinishNewDrawObject(Sender: TObject; AObject: TDicomDrawObject);
    procedure DoDrawObjectSize(Sender: TObject; AObject: TDicomDrawObject);
    procedure DoDrawObjectMove(Sender: TObject; AObject: TDicomDrawObject);

    //    FNeedSaveImage: boolean;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
    procedure SetLeaderMouserInspect(Value: TLeaderMouserInspect);
    function GetLeaderMouserInspect: TLeaderMouserInspect;
    procedure DoTopoLineClick(Sender: TObject; AImageIndex: Integer);
    procedure SetCanMultiSelect(const Value: Boolean);
    procedure SetWhiteGrid(const Value: Boolean);
    procedure SetOnTopoLineClick(
      const Value: TDicomImageTopoLineClickEvent);
    procedure SetOn3DCursorMove(const Value: TOn3DCursorEvent);
    procedure SetOn3DCursorEnd(const Value: TNotifyEvent);
    procedure SetOnCreateDicomViewItem(
      const Value: TOnCreateDicomViewItemEvent);
    procedure SetDragFrom(const Value: TDragFromSource);
    procedure SetOnCustomDrawObjectPopupMenuPopup(
      const Value: TNotifyEvent);
    procedure SetImageAngle(const Value: Double);
    procedure SetScrollBarVisible(const Value: boolean);
    procedure SetDisplayRuler(const Value: Boolean);
    procedure SetMultiViewMode(const Value: TMultiViewMode);
    procedure SetCustomViewSetting(const Value: string);
    procedure SetCustomDicomImageClass(
      const Value: TCustomDicomImageClass);
    procedure SetOnViewDragDropEvent(const Value: TDragDropEvent);
    procedure SetOnViewDragOverEvent(const Value: TDragOverEvent);
    procedure SetOnSetPresetWidthLevel(
      const Value: TDicomImagePresetWidthLevelEvent);
    procedure SetDragDropMode(const Value: TDragDropMode);
    procedure SetOnDragDropToPrint(const Value: TOnDragDropToPrintEvent);
    procedure SetOnViewStartDrag(const Value: TStartDragEvent);
    procedure SetOnCustomOverlayLabel(const Value: TOnOverlayLabelEvent);
    procedure SetDisplayBottomRuler(const Value: Boolean);
    procedure SetDisplayRightRuler(const Value: Boolean);
    procedure SetDisplayWLLabel(const Value: Boolean);
    procedure SetCanCheckSize(const Value: Boolean);
    procedure SetShowPixelValueHint(const Value: Boolean);
    procedure SetDblClickToFullSeries(const Value: Boolean);
    procedure SetOn3DCursorStart(const Value: TOn3DCursorEvent);
  protected
    fLastShiftDownView: TCustomDicomImage;
    fLastShift: TShiftState;
    fLastButton: TMouseButton;

    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    function GetItem(AIndex: Integer): TCustomDicomImage;
    function getCount: Integer;

    function CanUpdateColumnRow: Boolean;
    procedure SetColumns(AValue: Integer);
    procedure SetRows(AValue: Integer);

    procedure TriggerDicomViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TriggerDicomViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TriggerDicomViewMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure TriggerDicomViewReturnObjectSelect(Sender: TObject);
    procedure TriggerDicomViewImageLock(Sender: TObject; ALock: Boolean);
    procedure TriggerDicomViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TriggerDicomViewCineTo(Sender: TObject; AIndex: Integer);
    procedure TriggerDicomViewDblClick(Sender: TObject);
    //    procedure TriggerDicomViewPopupClick(Sender: TObject; ATag: Integer);
    procedure TriggerDicomViewWLChange(Sender: TObject; W, L: integer); virtual;
    procedure TriggerDicomViewScrollChange(Sender: TObject; X, Y: Double); virtual;
    procedure TriggerDicomViewZoomChange(Sender: TObject; Z: Double); virtual;
    procedure TriggerDicomViewCanLockImage(Sender: TObject; var ACanLock: Boolean);
    procedure TriggerOnCustomPopupMenuPopup(Sender: TObject);
    procedure TriggerOnCustomDrawObjectPopupMenuPopup(Sender: TObject);
    procedure TriggerOnDragDropToPrint(Sender, Source: TObject; ADatasets: TDicomDatasets; AIndex: Integer);
    //    procedure TriggerOnCustomPopupMenuClick(Sender: TObject);
    procedure TriggerOnViewFlagChange(Sender: TObject);

    procedure TriggerOnDragOverEvent(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TriggerOnDragDropEvent(Sender, Source: TObject; X, Y: Integer);
    procedure TriggerOnViewStartDrag(Sender: TObject; var DragObject: TDragObject);

    procedure TriggerDicomViewDataChange(Sender: TObject);

    procedure TriggerDicomViewOverlaylabel(AView: TObject; Dest: TObject; var AUserWrite: Boolean);
    procedure TriggerDicomViewCustomlabel(AView: TObject; Dest: TObject; var AUserWrite: Boolean);

    function GetActiveView: TCustomDicomImage;
    //    procedure RemoveAllViewControl;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetDicomDatasets(Value: TDicomDatasets);
    function GetDicomDatasets: TDicomDatasets;
    procedure TriggerDicomViewMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure SetDisplayLabel(AValue: Boolean);
    procedure SetRightMouseInteract(v: TMouseInteract);
    procedure SetLeftMouseInteract(v: TMouseInteract);
    procedure SetMouseWheelInteract(v: TMouseWheelInteract);
    procedure SetOnlyViewMultiSelected1(Value: Boolean);
    // FOMIN 18.12.2012
//    procedure SetOnlyViewMultiSelected2(Value: Boolean);
    procedure SetOnlyViewMultiSelected3(Value: Boolean);
    procedure SetOnlyViewMultiSelected4(Value: Boolean);

    procedure DoStart3DCursor(Sender: TObject; X, Y: Single);
    procedure Do3DCursor(Sender: TObject; X, Y: Single);
    procedure DoEnd3DCursor(Sender: TObject);
  public

    ImageFullForm: TForm;

    // 08.11.2012 FOMIN
    not_show_video : boolean;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    procedure Update; override;
    procedure Resize; override;
    procedure UpdateView;
    // FOMIN 18.12.2012
    procedure SetOnlyViewMultiSelected2(Value: Boolean);

    procedure SetCurrentImage(AIndex: Integer);

    procedure ResetView;

    procedure RefreshView;
    procedure ClearViewLock;
    procedure SetViewLock;

    procedure BackupCurrentDataset;
    procedure RestoreDataset;

    procedure Clear;
    procedure SaveImages;
    procedure SaveImageFlags;
    procedure ClearX;
    procedure ClearSelect;

    procedure NextSeries(AID: Integer = 1);
    procedure PriorSeries(AID: Integer = 1);

    procedure Last;
    procedure UpdateScrollBars;

    procedure RotalImage(r: Integer);
    //    procedure LRotalImage;
    procedure FitHeight;
    procedure FitWidth;
    procedure SetCurrentFrame(AValue: Integer);
    procedure SetHozFlip(AValue: Boolean);
    procedure SetVerFlip(AValue: Boolean);
    procedure Negative(Value: Boolean);
    procedure SetWinLevel(AWin, ALevel: Integer);
    procedure DeleteLabel;
    procedure ResetImage;
    procedure SetLut(AStream: TStream);
    procedure SetRowColumns(x, y: integer);

    function GetCountFromSetting: Integer;
    function GetRowOrColmn(AIndex: Integer): Integer;
    function GetRowOrColmnCount: Integer;

    procedure SetActiveViewFullScreen(Value: Boolean);
    //    procedure SaveAllLayer;
//    procedure LoadAllLayer;
    procedure SetDatasets(ADicomDatasets: TDicomDatasets; AIndex: Integer; ASeriesUID: string);

    function GetViewIndex(AView: TCustomDicomImage): Integer;
    property Items[Index: Integer]: TCustomDicomImage read GetItem;
    property Count: Integer read GetCount;
    property ActiveView: TCustomDicomImage read GetActiveView;

    property Views: TList read FViews;
    //    property NeedSaveImage: Boolean read FNeedSaveImage write FNeedSaveImage;
    property LeftMouseInteract: TMouseInteract read fLeftMouseInteract write SetLeftMouseInteract;
    property RightMouseInteract: TMouseInteract read fRightMouseInteract write
      SetRightMouseInteract;
    property MouseWheelInteract: TMouseWheelInteract read fMouseWheelInteract write
      SetMouseWheelInteract;
    property ShowPixelValueHint: Boolean read FShowPixelValueHint write SetShowPixelValueHint;

    property LeaderMouserInspect: TLeaderMouserInspect read GetLeaderMouserInspect write
      SetLeaderMouserInspect;
    property ImageAngle: Double read FImageAngle write SetImageAngle;

    property SeriesUID: string read fSeriesUID write fSeriesUID;

    //property FullScreenView: TCustomDicomImage read FFullScreenView;
    property LimitOneSeries: Boolean read fLimitOneSeries write fLimitOneSeries;
    property DragFrom: TDragFromSource read FDragFrom write SetDragFrom;
    property DragDropMode: TDragDropMode read FDragDropMode write SetDragDropMode;

    property DblClickToFullSeries: Boolean read FDblClickToFullSeries write SetDblClickToFullSeries;

    property OnlyViewMultiSelected1: Boolean read fOnlyViewMultiSelected1 write
      SetOnlyViewMultiSelected1;
    property OnlyViewMultiSelected2: Boolean read fOnlyViewMultiSelected2 write
      SetOnlyViewMultiSelected2;
    property OnlyViewMultiSelected3: Boolean read fOnlyViewMultiSelected3 write
      SetOnlyViewMultiSelected3;
    property OnlyViewMultiSelected4: Boolean read fOnlyViewMultiSelected4 write
      SetOnlyViewMultiSelected4;

    property LockCount: integer read fLockCount;

  published
    property CustomDicomImageClass: TCustomDicomImageClass read FCustomDicomImageClass write SetCustomDicomImageClass;

    property DisplayLabel: Boolean read fDisplayLabel write SetDisplayLabel;
    property DisplayWLLabel: Boolean read FDisplayWLLabel write SetDisplayWLLabel;

    property DisplayRuler: Boolean read FDisplayRuler write SetDisplayRuler;
    property DisplayRightRuler: Boolean read FDisplayRightRuler write SetDisplayRightRuler;
    property DisplayBottomRuler: Boolean read FDisplayBottomRuler write SetDisplayBottomRuler;

    property TextOverlayMode: Boolean read fTextOverlayMode write fTextOverlayMode;
    property UpdateAllImageProperty: Boolean read fUpdateAllImageProperty write
      fUpdateAllImageProperty;
    property CanMultiSelect: Boolean read fCanMultiSelect write SetCanMultiSelect;
    property WhiteGrid: Boolean read fWhiteGrid write SetWhiteGrid;

    property MultiViewMode: TMultiViewMode read FMultiViewMode write SetMultiViewMode;
    property CustomViewSetting: string read FCustomViewSetting write SetCustomViewSetting;

    property AutoGrid: Boolean read fAutoGrid write fAutoGrid;
    property ScrollBarVisible: boolean read FScrollBarVisible write SetScrollBarVisible;
    property CanCheckSize: Boolean read FCanCheckSize write SetCanCheckSize;

    property Align;
    property Color;
    property Hint;
    property TabOrder;
    property TabStop;
    property Visible;
    property CurrentImage: Integer read FCurrentImage write SetCurrentImage;
    property Columns: Integer read FColumns write SetColumns;
    property Rows: Integer read FRows write SetRows;
    property DicomDatasets: TDicomDatasets read GetDicomDatasets write SetDicomDatasets;
    property OnViewSelected: TNotifyEvent read FOnViewSelected write FOnViewSelected;
    property OnViewFlagChange: TNotifyEvent read FOnViewFlagChange write FOnViewFlagChange;
    property OnReturnObjectSelect: TNotifyEvent read fOnReturnObjectSelect write
      fOnReturnObjectSelect;
    property OnCurrentImageTo: TDicomImageStackToEvent read FOnCurrentImageTo write
      FOnCurrentImageTo;
    property OnImageCineTo: TDicomImageCineToEvent read FOnImageCineTo write FOnImageCineTo;
    property OnDicomSave: TDicomAttributesNeedSaveEvent read FOnDicomSave write FOnDicomSave;
    property OnViewDblClickSelect: TNotifyEvent read fOnViewDblClickSelect write
      fOnViewDblClickSelect;
    property OnTopoLineClick: TDicomImageTopoLineClickEvent read FOnTopoLineClick write
      SetOnTopoLineClick;
    //    property OnPopupClick: TOnPopupMenuClickEvent read fOnPopupClick write fOnPopupClick;
    //    property OnDicomPrintClick: TOnDicomPrintClickEvent read fOnDicomPrintClick write fOnDicomPrintClick;

    property OnImageWinLevelChange: TWinLevelChangeEvent read FOnImageWinLevelChange write
      FOnImageWinLevelChange;
    property OnImageScrollChange: TImageScrollChangeEvent read FOnImageScrollChange write
      FOnImageScrollChange;
    property OnImageZoomChange: TImageZoomChangeEvent read FOnImageZoomChange write
      FOnImageZoomChange;

    property OnDicomLockChange: TDicomLockChangeEvent read FOnDicomLockChange write
      FOnDicomLockChange;
    property OnViewKeyDown: TKeyEvent read FOnViewKeyDown write FOnViewKeyDown;

    property OnViewMouseDown: TMouseEvent read FOnViewMouseDown write FOnViewMouseDown;
    property OnViewMouseMove: TMouseMoveEvent read FOnViewMouseMove write FOnViewMouseMove;
    property OnViewMouseUp: TMouseEvent read FOnViewMouseUp write FOnViewMouseUp;

    property OnCanLock: TDicomImageCanLockEvent read fOnCanLock write fOnCanLock;

    property OnAfterNewDrawObject: TDrawObjectNotifyEvent read FAfterNewDrawObject write
      FAfterNewDrawObject;
    property OnAfterObjectSize: TDrawObjectNotifyEvent read FAfterObjectSize write
      FAfterObjectSize;
    property OnAfterObjectMove: TDrawObjectNotifyEvent read FAfterObjectMove write
      FAfterObjectMove;

    property OnShowToolbarOrView: TDicomImageToolbarShowEvent read FOnShowToolbarOrView write
      FOnShowToolbarOrView;
    property On3DCursorStart: TOn3DCursorEvent read FOn3DCursorStart write SetOn3DCursorStart;
    property On3DCursorMove: TOn3DCursorEvent read FOn3DCursorMove write SetOn3DCursorMove;
    property On3DCursorEnd: TNotifyEvent read FOn3DCursorEnd write SetOn3DCursorEnd;

    property OnSetPresetWidthLevel: TDicomImagePresetWidthLevelEvent read FOnSetPresetWidthLevel write SetOnSetPresetWidthLevel;

    property OnDatasetChanged: TNotifyEvent read fOnDatasetChanged write fOnDatasetChanged;
    property OnCustomPopupMenuPopup: TNotifyEvent read fOnCustomPopupMenuPopup write
      fOnCustomPopupMenuPopup;
    //    property OnCustomPopupMenuClick: TNotifyEvent read fOnCustomPopupMenuClick write
    //      fOnCustomPopupMenuClick;
    property OnCustomDrawObjectPopupMenuPopup: TNotifyEvent read FOnCustomDrawObjectPopupMenuPopup write SetOnCustomDrawObjectPopupMenuPopup;
    property OnDragDropToPrint: TOnDragDropToPrintEvent read FOnDragDropToPrint write SetOnDragDropToPrint;

    property OnCreateDicomViewItem: TOnCreateDicomViewItemEvent read FOnCreateDicomViewItem write SetOnCreateDicomViewItem;

    property OnViewDragOver: TDragOverEvent read FOnViewDragOverEvent write SetOnViewDragOverEvent;
    property OnViewDragDrop: TDragDropEvent read FOnViewDragDropEvent write SetOnViewDragDropEvent;
    property OnViewStartDrag: TStartDragEvent read FOnViewStartDrag write SetOnViewStartDrag;

    property OnOverlayLabel: TOnOverlayLabelEvent read fOnOverlayLabel write fOnOverlayLabel;
    property OnCustomOverlayLabel: TOnOverlayLabelEvent read FOnCustomOverlayLabel write SetOnCustomOverlayLabel;
    // property OnDragDrop;
    // property OnDragOver;
    //property OnEndDrag;
  end;
  TMultiImageScrollToEvent = procedure(Sender: TObject; AIndex: integer) of object;
  TCnsCustomMultiImage32 = class(TCnsCustomPaintBox32)
  private
    FColumn: Integer;
    FRow: Integer;
    FAutoPage: Boolean;
    FPageRange: Integer;
    FMoveOverIndex: Integer;
    FBitmap32Collection: TCnsBitmap32Collection;
    FCurrentIndex: Integer;
    FCurrentSelectedIndex: Integer;
    FCanStartDrag: Boolean;

    FUpdateCount: Integer;
    FPaintStages: TCnsPaintStages;

    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FOnInitStages: TNotifyEvent;
    FOnPaintStage: TPaintStageEvent;
    FOnChange: TNotifyEvent;
    FOnMultiImageScrollTo: TMultiImageScrollToEvent;

    FScrollBarSize: Integer;
    FOnScroll: TNotifyEvent;
    FBufferMode: Boolean;

    procedure SetBitmap(Index: Integer; Value: TCnsBitmap32);
    function GetBitmap(Index: Integer): TCnsBitmap32;
    procedure SeTCnsBitmap32Collection(Value: TCnsBitmap32Collection);
    procedure SetColumn(Value: Integer);
    procedure SetRow(Value: Integer);
    procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    function GetScrollBarSize: Integer;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
  protected
    CachedBitmapRect: TRect;
    CachedXForm: TCoordXForm;
    CacheValid: Boolean;
    OldPoint: TPoint;

    DisableScrollUpdate: Boolean;
    VScroll: TCnsCustomRangeBar;
    WheelDeltaCount: Integer;

    procedure ChangedHandler(Sender: TObject);
    procedure GDIUpdateHandler(Sender: TObject);
    function SpritRect(l: Integer): TRect;

    procedure SetBufferMode(const Value: Boolean); virtual;
    procedure DoInitStages; virtual;
    procedure DoPaintBuffer; override;
    procedure DoPaintGDIOverlay; override;
    procedure InitDefaultStages; virtual;
    procedure InvalidateCache;
    procedure UpdateCache;
    property UpdateCount: Integer read FUpdateCount;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean;
      override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure SetCurrentIndex(Value: integer); virtual;
    procedure ScrollHandler(Sender: TObject); virtual;
    procedure AlignAll;
    function GetImageCount: Integer; virtual;
    procedure DoScroll; virtual;
    procedure SetAutoPage(Value: Boolean);
    procedure SetPageRange(Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Last;
    procedure UpdateScrollBars; virtual;
    procedure BeginUpdate; virtual;
    procedure Changed; virtual;
    procedure EndUpdate; virtual;
    function GetViewportRect: TRect; override;
    procedure ExecBitmapFrame(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_BITMAP_FRAME
    procedure ExecClearBuffer(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_CLEAR_BUFFER
    procedure ExecClearBackgnd(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_CLEAR_BACKGND
    procedure ExecControlFrame(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_CONTROL_FRAME
    procedure ExecCustom(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_CUSTOM
    procedure ExecDrawBitmap(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_DRAW_BITMAP
    procedure ExecDrawLayers(Dest: TCnsBitmap32; StageNum: Integer); virtual; // PST_DRAW_LAYERS
    procedure Invalidate; override;
    procedure Loaded; override;
    procedure PaintTo(Dest: TCnsBitmap32; DestRect: TRect);
    procedure Resize; override;
    procedure SetRowColumns(x, y: integer); virtual;

    property BufferMode: Boolean read FBufferMode write SetBufferMode;
    property Bitmap[Index: Integer]: TCnsBitmap32 read GetBitmap write SetBitmap; default;
    property Bitmaps: TCnsBitmap32Collection read FBitmap32Collection write
      SeTCnsBitmap32Collection;

    property PaintStages: TCnsPaintStages read FPaintStages;
    property Row: Integer read FRow write SetRow;
    property Column: integer read FColumn write SetColumn;
    property CurrentImage: Integer read FCurrentIndex write SetCurrentIndex;
    property CurrentSelectedIndex: Integer read FCurrentSelectedIndex write FCurrentSelectedIndex;
    property CanStartDrag: Boolean read FCanStartDrag write FCanStartDrag;
    property AutoPage: Boolean read FAutoPage write SetAutoPage;
    property PageRange: Integer read FPageRange write SetPageRange;

    property OnScroll: TNotifyEvent read FOnScroll write FOnScroll;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnInitStages: TNotifyEvent read FOnInitStages write FOnInitStages;
    property OnPaintStage: TPaintStageEvent read FOnPaintStage write FOnPaintStage;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnMultiImageScrollTo: TMultiImageScrollToEvent read FOnMultiImageScrollTo write
      FOnMultiImageScrollTo;
  end;

  TCnsMultiImage32 = class(TCnsCustomMultiImage32)
  published
    property Align;
    property Anchors;
    property AutoSize;
    property Color;
    property Constraints;
    property Cursor;
    property DragCursor;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Bitmaps;
    property Row;
    property Column;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnChange;
    property OnContextPopup;
    property OnDblClick;
    property OnGDIOverlay;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnInitStages;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnPaintStage;
    property OnResize;
    property OnStartDrag;
    property OnScroll;
    property OnMultiImageScrollTo;
  end;

  TDCMMultiImage = class(TCnsCustomMultiImage32)
  private
    FDicomDatasets: TDicomDatasets;
    fIconData: TDicomAttribute;

    FAutoGrid: Boolean;
    FCanDelete: Boolean;
    FGridVisible: Boolean;
    FViewGridMode: TViewGridMode;
    FViewGridSetting: string;

    fLeftMouseInteract: TMouseInteract;
    LastMousePos: TPoint;
    fMouseDragging: Boolean;
    fCurrentAttributes: TDicomAttributes;
    fCurrentBitmapItem: TCnsBitmap32ExItem;
    fShowSeriesDescription: Boolean;
    FFont: TFont;
    FOnViewFlagChange: TNotifyEvent;
    FAutoChangeSeriesMode: Boolean;
    FDefaultRows: Integer;
    function FindDataset(AItem: string): TDicomAttributes;
    procedure SetFont(const Value: TFont);
    procedure SetAutoChangeSeriesMode(const Value: Boolean);
    procedure SetDefaultRows(const Value: Integer);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetDicomDatasets(Value: TDicomDatasets);
    procedure DblClick; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
    procedure SetViewGridMode(Value: TViewGridMode);
    procedure SetCurrentIndex(Value: integer); override;
    function GetImageCount: Integer; override;
    procedure SetBufferMode(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExecDrawBitmap(Dest: TCnsBitmap32; StageNum: Integer); override; // PST_DRAW_BITMAP
    procedure Resize; override;
    procedure UpdateDatasetToIcons;
    procedure UpdateBitmapitem(AItem: TCnsBitmap32ExItem);
    procedure RefreshNews;
    function GetDatasetIndex: Integer;

    property IconData: TDicomAttribute read fIconData write fIconData;
    property DefaultRows: Integer read FDefaultRows write SetDefaultRows;
  published
    property AutoChangeSeriesMode: Boolean read FAutoChangeSeriesMode write SetAutoChangeSeriesMode;
    property AutoGrid: Boolean read FAutoGrid write FAutoGrid;
    property CanDelete: Boolean read FCanDelete write FCanDelete;
    property GridVisible: Boolean read FGridVisible write FGridVisible;
    property ViewGridSetting: string read FViewGridSetting write FViewGridSetting;
    property LeftMouseInteract: TMouseInteract read fLeftMouseInteract write fLeftMouseInteract;
    property ShowSeriesDescription: Boolean read fShowSeriesDescription write
      fShowSeriesDescription;

    property Font: TFont read FFont write SetFont;
    property OnViewFlagChange: TNotifyEvent read FOnViewFlagChange write FOnViewFlagChange;

    property Align;
    property Anchors;
    property AutoSize;
    property Color;
    property Constraints;
    property Cursor;
    property DragCursor;
    property DragMode;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Bitmaps;
    property Row;
    property Column;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnChange;
    property OnContextPopup;
    property OnDblClick;
    property OnGDIOverlay;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnInitStages;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnPaintStage;
    property OnResize;
    property OnStartDrag;
    property OnScroll;
    property OnMultiImageScrollTo;
    property DicomDatasets: TDicomDatasets read FDicomDatasets write SetDicomDatasets;
    property ViewGridMode: TViewGridMode read FViewGridMode write SetViewGridMode;
  end;

  TArrowPlace = (apCenter, apLeftOrTop, apRightOrBottom);

  TDicomSplites = class(TSplitter)
  private
    FPattern: TBitmap;
    FArrows: TBitmap;
    FArrowPlace: TArrowPlace;
    FArrowBackGr: Boolean;
    {dont want to overwrite setAlign, we check current Align with
     the last Align to paint the Arrows and the Pattern }
    FLastAlign: TAlign;
  protected
    procedure Paint; override;
    procedure CreatePatterns;
    procedure setArrowPlace(value: TArrowPlace);
    function getArrowPlace: TArrowPlace;
    procedure setArrowBackGr(value: Boolean);
    function getArrowBackGr: Boolean;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ArrowPlace: TArrowPlace read getArrowPlace write setArrowPlace default apCenter;
    property ArrowBackgr: Boolean read getArrowBackgr write setArrowBackGr default true;
  end;

  TDicomMultiLayoutViewer = class;
  TDicomMultiLayoutViewer = class(TPanel)
  private
    fLeftMouseInteract: TMouseInteract;
    fRightMouseInteract: TMouseInteract;
    fMouseWheelInteract: TMouseWheelInteract;
    fLeftLeaderMouserInspect: TLeaderMouserInspect;

    fOnCanLock: TDicomImageCanLockEvent;
    FOnShowToolbarOrView: TDicomImageToolbarShowEvent;
    FOnViewSelected: TNotifyEvent;
    FOnMultiViewSelected: TNotifyEvent;
    FOnViewFlagChange: TNotifyEvent;
    fOnReturnObjectSelect: TNotifyEvent;
    FOnCurrentImageTo: TDicomImageStackToEvent;
    FOnImageCineTo: TDicomImageCineToEvent;
    FOnDicomSave: TDicomAttributesNeedSaveEvent;
    fOnViewDblClickSelect: TNotifyEvent;
    //    FOnAddNewObj: TOnAddNewObjEvent;
    //fOnPopupClick: TOnPopupMenuClickEvent;
    //fOnDicomPrintClick: TOnDicomPrintClickEvent;
    FOnViewKeyDown: TKeyEvent;

    FOnImageWinLevelChange: TWinLevelChangeEvent;
    FOnImageScrollChange: TImageScrollChangeEvent;
    FOnImageZoomChange: TImageZoomChangeEvent;

    FOnDicomLockChange: TDicomLockChangeEvent;

    FAfterNewDrawObject: TDrawObjectNotifyEvent;
    FAfterObjectSize: TDrawObjectNotifyEvent;
    FAfterObjectMove: TDrawObjectNotifyEvent;

    fOnDatasetChanged: TNotifyEvent;
    fOnCustomPopupMenuPopup: TNotifyEvent;
    //    fOnCustomPopupMenuClick: TNotifyEvent;

    fSplitter: TDicomSplites;
    fPane1: TDicomMultiLayoutViewer;
    fPane2: TDicomMultiLayoutViewer;
    fViewer: TDicomMultiViewer;
    fViewerID: integer;
    OldW: integer;
    OldH: Integer;
    fRows: Integer;
    fColumns: Integer;

    fDisplayLabel: Boolean;
    fTextOverlayMode: Boolean;
    fUpdateAllImageProperty: Boolean;
    fCanMultiSelect: Boolean;

    fLimitOneSeries: Boolean;
    fOnlyViewMultiSelected1: Boolean;
    fOnlyViewMultiSelected2: Boolean;
    fOnlyViewMultiSelected3: Boolean;
    fOnlyViewMultiSelected4: Boolean;

    backupPopupMenu: TPopupMenu;
    fCurrentViewer: TDicomMultiViewer;
    fLastCurrentViewer: TDicomMultiViewer;

    //    FFullScreenView: TDicomMultiViewer;
    //    BackupRect: TRect;
    fWhiteGrid: Boolean;
    FOnTopoLineClick: TDicomImageTopoLineClickEvent;
    FOn3DCursorMove: TOn3DCursorEvent;
    FOn3DCursorEnd: TNotifyEvent;
    FOnCreateDicomViewItem: TOnCreateDicomViewItemEvent;
    FDragFrom: TDragFromSource;
    FOnCustomDrawObjectPopupMenuPopup: TNotifyEvent;
    FImageAngle: Double;
    FDisplayRuler: Boolean;
    FCustomDicomImageClass: TCustomDicomImageClass;
    FUpdateAllSeriesProperty: Boolean;
    FOnViewDragDropEvent: TDragDropEvent;
    FOnViewDragOverEvent: TDragOverEvent;
    FOnSetPresetWidthLevel: TDicomImagePresetWidthLevelEvent;
    FDragDropMode: TDragDropMode;
    FOnDragDropToPrint: TOnDragDropToPrintEvent;
    FOnViewStartDrag: TStartDragEvent;
    fOnOverlayLabel: TOnOverlayLabelEvent;
    FOnCustomOverlayLabel: TOnOverlayLabelEvent;
    FDisplayBottomRuler: Boolean;
    FDisplayRightRuler: Boolean;
    FDisplayWLLabel: Boolean;
    FCanCheckSize: Boolean;
    FScrollBarVisible: boolean;
    FShowPixelValueHint: Boolean;
    FSeriesResizable: Boolean;
    FDblClickToFullSeries: Boolean;
    FOn3DCursorStart: TOn3DCursorEvent;

    procedure AddMenuClick(Sender: TObject);
    procedure SetupDialog;
    procedure SetColumns(const Value: Integer);
    procedure SetRows(const Value: Integer);
    procedure SetCanMultiSelect(const Value: Boolean);
    procedure SetWhiteGrid(const Value: Boolean);
    procedure DoTopoLineClick(Sender: TObject; AImageIndex: Integer);
    procedure SetOnTopoLineClick(
      const Value: TDicomImageTopoLineClickEvent);
    function GetLastActiveView: TDicomMultiViewer;
    procedure SetOn3DCursorMove(const Value: TOn3DCursorEvent);
    procedure SetOn3DCursorEnd(const Value: TNotifyEvent);
    procedure SetOnCreateDicomViewItem(
      const Value: TOnCreateDicomViewItemEvent);
    procedure SetDragFrom(const Value: TDragFromSource);
    procedure SetOnCustomDrawObjectPopupMenuPopup(
      const Value: TNotifyEvent);
    procedure SetImageAngle(const Value: Double);
    procedure SetDisplayRuler(const Value: Boolean);
    procedure SetCustomDicomImageClass(
      const Value: TCustomDicomImageClass);
    procedure SetUpdateAllSeriesProperty(const Value: Boolean);
    procedure SetOnViewDragDropEvent(const Value: TDragDropEvent);
    procedure SetOnViewDragOverEvent(const Value: TDragOverEvent);
    procedure SetOnSetPresetWidthLevel(
      const Value: TDicomImagePresetWidthLevelEvent);
    procedure SetDragDropMode(const Value: TDragDropMode);
    procedure SetOnDragDropToPrint(const Value: TOnDragDropToPrintEvent);
    procedure SetOnViewStartDrag(const Value: TStartDragEvent);
    procedure SetOnCustomOverlayLabel(const Value: TOnOverlayLabelEvent);
    procedure SetDisplayBottomRuler(const Value: Boolean);
    procedure SetDisplayRightRuler(const Value: Boolean);
    procedure SetDisplayWLLabel(const Value: Boolean);
    procedure SetCanCheckSize(const Value: Boolean);
    procedure SetScrollBarVisible(const Value: boolean);
    procedure SetShowPixelValueHint(const Value: Boolean);
    procedure SetSeriesResizable(const Value: Boolean);
    procedure SetDblClickToFullSeries(const Value: Boolean);
    procedure SetOn3DCursorStart(const Value: TOn3DCursorEvent);
  protected
    FMoveActiveSeriesView: TDicomMultiViewer;

    function IsSplitter: Boolean;
    function IsVerticalSplitter: Boolean;
    function CreatePane(aAlign: TAlign): TDicomMultiLayoutViewer;
    function GetRootPanel: TDicomMultiLayoutViewer;
    procedure AdjustPanesViewerID;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;

    function GetViewer(AIndex: Integer): TDicomMultiViewer;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
    procedure DblClick; override;

    procedure TriggerOnCanLock(Sender: TObject; var ACanLock: Boolean);
    procedure TriggerOnShowToolbarOrView(Sender: TObject; AConerIndex: Integer);
    procedure TriggerOnViewSelected(Sender: TObject);
    procedure TriggerOnMultiViewSelected(Sender: TObject);
    procedure TriggerOnViewFlagChange(Sender: TObject);
    procedure TriggerOnReturnObjectSelect(Sender: TObject);
    procedure TriggerOnCurrentImageCineTo(Sender: TObject; AIndex: Integer);
    procedure TriggerOnCurrentImageStackTo(Sender: TObject; AOldIndex, ANewIndex: Integer);
    procedure TriggerOnDicomSave(Sender: TObject; ADatasets: TDicomDatasets; IsSaveImage: Boolean);
    procedure TriggerOnViewDblClickSelect(Sender: TObject);
    procedure TriggerPresetWidthLevel(Sender: TObject; AKey: Integer; Shift: TShiftState; var AWindowWidth, AWindowLevel);

    procedure TriggerOnCreateDicomViewItem(Sender: TObject; const ARow, AColumn: Integer; var AItem: TCustomDicomImage);
    //    procedure TriggerOnPopupClick(Sender: TObject; ATag: Integer);
    //    procedure TriggerOnDicomPrintClick(Sender: TObject; Attribute: TDicomAttributes);
    procedure TriggerOnViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure TriggerOnViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TriggerOnViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TriggerOnViewMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);

    procedure TriggerOnImageWinLevelChange(Sender: TObject; W, L: integer);
    procedure TriggerOnImageScrollChange(Sender: TObject; X, Y: Double);
    procedure TriggerOnImageZoomChange(Sender: TObject; Z: Double);
    procedure TriggerOnImageDataChange(Sender: TObject);
    procedure TriggerOnDicomLockChange(Sender: TObject; ALockCount: Integer);
    procedure TriggerOnCustomPopupMenuPopup(Sender: TObject);
    procedure TriggerOnCustomDrawObjectPopupMenuPopup(Sender: TObject);
    procedure TriggerOnDragDropToPrint(Sender, Source: TObject; ADatasets: TDicomDatasets; AIndex: Integer);

    procedure TriggerOnDragOverEvent(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TriggerOnDragDropEvent(Sender, Source: TObject; X, Y: Integer);
    procedure TriggerOnViewStartDrag(Sender: TObject; var DragObject: TDragObject);

    //    procedure TriggerOnCustomPopupMenuClick(Sender: TObject);
    procedure Do3DCursor(Sender: TObject; X, Y: Single);
    procedure DoStart3DCursor(Sender: TObject; X, Y: Single);
    procedure DoEnd3DCursor(Sender: TObject);

    procedure TriggerAfterNewDrawObject(Sender: TObject; AObject: TDicomDrawObject);
    procedure TriggerAfterObjectSize(Sender: TObject; AObject: TDicomDrawObject);
    procedure TriggerAfterObjectMove(Sender: TObject; AObject: TDicomDrawObject);
    function GetActiveView: TDicomMultiViewer;
    procedure PopupMenu1Popup(Sender: TObject);

    procedure CreateVerPanels;
    procedure CreateHozPanels;
    procedure DeletePanels;

    procedure CalViewerCount(var ACount: Integer);
    procedure LayoutDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LayoutDragOver(Sender, Source: TObject; X, Y: Integer;
      State: Controls.TDragState; var Accept: Boolean);
    procedure SetUpdateAllImageProperty(Value: Boolean);
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure SetOnlyViewMultiSelected1(Value: Boolean);
    procedure SetOnlyViewMultiSelected2(Value: Boolean);
    procedure SetOnlyViewMultiSelected3(Value: Boolean);
    procedure SetOnlyViewMultiSelected4(Value: Boolean);

    procedure SetLeftMouseInteract(Value: TMouseInteract);
    procedure SetRightMouseInteract(Value: TMouseInteract);
    procedure SetMouseWheelInteract(Value: TMouseWheelInteract);
    procedure SetLeftLeaderMouserInspect(Value: TLeaderMouserInspect);
    procedure SetDisplayLabel(Value: Boolean);

    procedure TriggerDicomViewOverlaylabel(AView: TObject; Dest: TObject; var AUserWrite: Boolean);
    procedure TriggerDicomViewCustomlabel(AView: TObject; Dest: TObject; var AUserWrite: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Paint; override;

    procedure CreateViewer;
    procedure RemoveViewer;

    procedure UpdateViews;
    procedure RefreshViews;

    procedure BackupCurrentDataset;
    procedure RestoreDataset;

    procedure ResetImage;
    procedure Clear;
    function GetViewerCount: Integer;
    procedure SpritInto(X, Y: Integer);

    //    procedure SetActiveViewFullScreen(AValue: Boolean);

    procedure LoadFrom(das1: TDicomAttributes);
    procedure SaveTo(das1: TDicomAttributes);

    //  property FullScreenView: TDicomMultiViewer read FFullScreenView;

    property Rows: Integer read fRows write SetRows;
    property Columns: Integer read fColumns write SetColumns;
    property Panel1: TDicomMultiLayoutViewer read fPane1;
    property Panel2: TDicomMultiLayoutViewer read fPane2;
    property Viewer: TDicomMultiViewer read fViewer;
    property CanCheckSize: Boolean read FCanCheckSize write SetCanCheckSize;
    property SeriesResizable: Boolean read FSeriesResizable write SetSeriesResizable;

    property ActiveView: TDicomMultiViewer read GetActiveView;
    property LastActiveView: TDicomMultiViewer read GetLastActiveView;
    property Viewers[Index: Integer]: TDicomMultiViewer read GetViewer;

    property OnlyViewMultiSelected1: Boolean read fOnlyViewMultiSelected1 write
      SetOnlyViewMultiSelected1;
    property OnlyViewMultiSelected2: Boolean read fOnlyViewMultiSelected2 write
      SetOnlyViewMultiSelected2;
    property OnlyViewMultiSelected3: Boolean read fOnlyViewMultiSelected3 write
      SetOnlyViewMultiSelected3;
    property OnlyViewMultiSelected4: Boolean read fOnlyViewMultiSelected4 write
      SetOnlyViewMultiSelected4;

    property LeftMouseInteract: TMouseInteract read fLeftMouseInteract write SetLeftMouseInteract;
    property RightMouseInteract: TMouseInteract read fRightMouseInteract write
      SetRightMouseInteract;
    property MouseWheelInteract: TMouseWheelInteract read fMouseWheelInteract write
      SetMouseWheelInteract;
    property ShowPixelValueHint: Boolean read FShowPixelValueHint write SetShowPixelValueHint;

    property LeaderMouserInspect: TLeaderMouserInspect read fLeftLeaderMouserInspect write
      SetLeftLeaderMouserInspect;
    property ImageAngle: Double read FImageAngle write SetImageAngle;

    property DragFrom: TDragFromSource read FDragFrom write SetDragFrom;
    property DragDropMode: TDragDropMode read FDragDropMode write SetDragDropMode;

    property DblClickToFullSeries: Boolean read FDblClickToFullSeries write SetDblClickToFullSeries;

  published
    property CustomDicomImageClass: TCustomDicomImageClass read FCustomDicomImageClass write SetCustomDicomImageClass;

    property ScrollBarVisible: boolean read FScrollBarVisible write SetScrollBarVisible;

    property DisplayLabel: Boolean read fDisplayLabel write SetDisplayLabel;
    property DisplayWLLabel: Boolean read FDisplayWLLabel write SetDisplayWLLabel;

    property DisplayRuler: Boolean read FDisplayRuler write SetDisplayRuler;
    property DisplayRightRuler: Boolean read FDisplayRightRuler write SetDisplayRightRuler;
    property DisplayBottomRuler: Boolean read FDisplayBottomRuler write SetDisplayBottomRuler;

    property TextOverlayMode: Boolean read fTextOverlayMode write fTextOverlayMode;
    property UpdateAllImageProperty: Boolean read fUpdateAllImageProperty write
      SetUpdateAllImageProperty;
    property UpdateAllSeriesProperty: Boolean read FUpdateAllSeriesProperty write SetUpdateAllSeriesProperty;
    property CanMultiSelect: Boolean read fCanMultiSelect write SetCanMultiSelect;
    property WhiteGrid: Boolean read fWhiteGrid write SetWhiteGrid;

    property OnMultiViewSelected: TNotifyEvent read FOnMultiViewSelected write
      FOnMultiViewSelected;

    property OnViewSelected: TNotifyEvent read FOnViewSelected write FOnViewSelected;
    property OnViewFlagChange: TNotifyEvent read FOnViewFlagChange write FOnViewFlagChange;
    property OnReturnObjectSelect: TNotifyEvent read fOnReturnObjectSelect write
      fOnReturnObjectSelect;
    property OnCurrentImageTo: TDicomImageStackToEvent read FOnCurrentImageTo write
      FOnCurrentImageTo;
    property OnImageCineTo: TDicomImageCineToEvent read FOnImageCineTo write FOnImageCineTo;
    property OnDicomSave: TDicomAttributesNeedSaveEvent read FOnDicomSave write FOnDicomSave;
    property OnViewDblClickSelect: TNotifyEvent read fOnViewDblClickSelect write
      fOnViewDblClickSelect;
    //    property OnPopupClick: TOnPopupMenuClickEvent read fOnPopupClick write fOnPopupClick;
    //    property OnDicomPrintClick: TOnDicomPrintClickEvent read fOnDicomPrintClick write fOnDicomPrintClick;
    property OnTopoLineClick: TDicomImageTopoLineClickEvent read FOnTopoLineClick write
      SetOnTopoLineClick;
    property On3DCursorMove: TOn3DCursorEvent read FOn3DCursorMove write SetOn3DCursorMove;
    property On3DCursorEnd: TNotifyEvent read FOn3DCursorEnd write SetOn3DCursorEnd;
    property On3DCursorStart: TOn3DCursorEvent read FOn3DCursorStart write SetOn3DCursorStart;

    property OnSetPresetWidthLevel: TDicomImagePresetWidthLevelEvent read FOnSetPresetWidthLevel write SetOnSetPresetWidthLevel;

    property OnImageWinLevelChange: TWinLevelChangeEvent read FOnImageWinLevelChange write
      FOnImageWinLevelChange;
    property OnImageScrollChange: TImageScrollChangeEvent read FOnImageScrollChange write
      FOnImageScrollChange;
    property OnImageZoomChange: TImageZoomChangeEvent read FOnImageZoomChange write
      FOnImageZoomChange;

    property OnDicomLockChange: TDicomLockChangeEvent read FOnDicomLockChange write
      FOnDicomLockChange;
    property OnViewKeyDown: TKeyEvent read FOnViewKeyDown write FOnViewKeyDown;
    property OnCanLock: TDicomImageCanLockEvent read fOnCanLock write fOnCanLock;

    property OnAfterNewDrawObject: TDrawObjectNotifyEvent read FAfterNewDrawObject write
      FAfterNewDrawObject;
    property OnAfterObjectSize: TDrawObjectNotifyEvent read FAfterObjectSize write
      FAfterObjectSize;
    property OnAfterObjectMove: TDrawObjectNotifyEvent read FAfterObjectMove write
      FAfterObjectMove;

    property OnShowToolbarOrView: TDicomImageToolbarShowEvent read FOnShowToolbarOrView write
      FOnShowToolbarOrView;

    property OnDatasetChanged: TNotifyEvent read fOnDatasetChanged write fOnDatasetChanged;
    property OnCustomPopupMenuPopup: TNotifyEvent read fOnCustomPopupMenuPopup write
      fOnCustomPopupMenuPopup;
    //    property OnCustomPopupMenuClick: TNotifyEvent read fOnCustomPopupMenuClick write
    //      fOnCustomPopupMenuClick;
    property OnCustomDrawObjectPopupMenuPopup: TNotifyEvent read FOnCustomDrawObjectPopupMenuPopup write SetOnCustomDrawObjectPopupMenuPopup;
    property OnDragDropToPrint: TOnDragDropToPrintEvent read FOnDragDropToPrint write SetOnDragDropToPrint;

    property OnCreateDicomViewItem: TOnCreateDicomViewItemEvent read FOnCreateDicomViewItem write SetOnCreateDicomViewItem;

    property OnViewDragOver: TDragOverEvent read FOnViewDragOverEvent write SetOnViewDragOverEvent;
    property OnViewDragDrop: TDragDropEvent read FOnViewDragDropEvent write SetOnViewDragDropEvent;
    property OnViewStartDrag: TStartDragEvent read FOnViewStartDrag write SetOnViewStartDrag;

    property OnOverlayLabel: TOnOverlayLabelEvent read fOnOverlayLabel write fOnOverlayLabel;
    property OnCustomOverlayLabel: TOnOverlayLabelEvent read FOnCustomOverlayLabel write SetOnCustomOverlayLabel;
    //property OnDragDrop;
    //property OnDragOver;
    //property OnEndDrag;
  end;

implementation

uses math, Dialogs, {$IFDEF NEED3DPLOT}KxLineProfile, Glay3DPlot, {$ENDIF}
  SetupLayout, DefineCal, DCM32_Resamplers, DicomInputQuery;

{ TCustomDicomImage }

constructor TCustomDicomImage.Create(AOwner: TComponent);
var
  //  N1: TMenuItem;
  bm: TBitmap;
  {$IFDEF FOR_TRIAL_VERSION}
  function IsIDERuning: Boolean;
  begin
    Result := (FindWindow('TAppBuilder', nil) <> 0) or
      (FindWindow('TPropertyInspector', nil) <> 0) or
      (FindWindow('TAlignPalette', nil) <> 0);
  end;
  {$ENDIF}

begin
  inherited Create(AOwner);
  {$IFDEF FOR_TRIAL_VERSION}
  if not IsIDERuning then
  begin
    ShowMessage('You are use trial dicomvcl. Please open http://www.dicomvcl.com.');
    Application.Terminate;
  end;
  //else
  //  ShowMessage('You are use trial dicomvcl. Please open http://www.dicomvcl.com.');
  //ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
  {$ENDIF}

  //WheelDeltaCount := 0;
  FCanCheckSize := true;

  CineToolbar := nil;
  fCineScrollBar := nil;

  FNoLockByUpper := True;
  FModify := false;

  fIgnoreMouseClick := 0;

  FDragFrom := dfsFromImageList;
  FDragDropMode := ddmFreeView;

  FCustomFormat := '';
  FImageAngle := 0;

  //fOldWidth := 0;
  //fOldHeight := 0;

  MMFactor := 4;
  //  BufferSize := 0;
  //  GraphWidth := 0;
  //  Pos := 0;
  FLeaderCount := 12;
  FLeaderPerPage := 12;
  FLeaderFrom := 0;

  FPositionCursorPosition := Point(0, 0);
  FPositionCursorColor := clRed32;

  fJustDBLCLick := false;
  fInMovingMouseProcess := false;
  FPerpendicularityLinePos := Point(0, 0);

  fCanMultiSelect := true;

  fDisplayLabel := true;
  fDisplayWLLabel := true;
  FDisplayRuler := true;

  FDisplayRightRuler := true;
  FDisplayBottomRuler := true;

  fTextOverlayMode := false;
  fDisplayReport := true;

  fWHint := TDicomHint.Create(self);
  fWHint.Parent := self;
  fWHint.Font.Size := 12;

  if not (csDesigning in ComponentState) then
  begin
    fMagnifierView := TMagnifierView.Create(self);
    fMagnifierView.Visible := false;
    fMagnifierView.Parent := self;
    fMagnifierView.FViewSize := 2;
    fMagnifierView.FScallSize := 4;
  end
  else
    fMagnifierView := nil;

  fTextEdit := nil;

  FDrawGridAxiel := false;

  FDicomDatasets := nil;
  FAttributesIndex := -1;

  FPrintSelectedIcon := TCnsBitmap32.Create;

  FPrintNoSelectedIcon := TBitmap.Create;
  FPrintNoSelectedIcon.LoadFromResourceName(HInstance, 'IMAGEPRRINTED');
  FPrintSelectedIcon.Assign(FPrintNoSelectedIcon);
  //bm.free;

  FSelectedLockIcon := TCnsBitmap32.Create;
  bm := TBitmap.Create;
  bm.LoadFromResourceName(HInstance, 'IMAGELOCKED');
  FSelectedLockIcon.Assign(bm);
  bm.free;

  //  FPrintNoSelectedIcon := TBitmap.Create;
  //  FPrintNoSelectedIcon.LoadFromResourceName(HInstance, 'IMAGEPRRINTED');

  FDrawPrintNoSelectIcon := false;

  fMagnificationFactor := 10;

  FLockImage := false;
  FPerpendicularityLine := true; //false;

  TabStop := true;
  {$IFDEF USE_BITMAP32_VIEWER}
  BitmapAlign := baCustom;
  ScaleMode := smScale;
  {$ENDIF}
  fLeftMouseInteract := miNone;
  fRightMouseInteract := miWindow;
  fMouseWheelInteract := mwiScrollWheel;

  FMyPopupMenu := TPopupMenu.Create(Self);
  FMyPopupMenu.OnPopup := MyPopupMenu1Popup;

  FDrawObjectPopupMenu := TPopupMenu.Create(Self);
  FDrawObjectPopupMenu.OnPopup := MyDrawObjectPopupMenu1Popup;

  FCustomPopupMenu := nil;

  Color := clBlack;

  fDrawCine := TDicomDirectDrawCine.Create;
  fDrawCine.OnImageCineTo := DoDirectDrawCine;
  fDrawCine.Center := true;
  fDrawCine.FitWindow := true;

  FTimer := TTimer.Create(Self);
  FTimer.Enabled := false;
  FTimer.Interval := 40;
  FTimer.OnTimer := DoPlayCine;
  FCineLoop2 := false;
  fDSAMode := false;
  FCineSpeed := 1;

  //  TBitmap32Resampler(Bitmap.Resampler).PixelAccessMode := pamWrap;
  //  Bitmap.WrapMode := wmMirror;

  MagnificationType := mftNONE;
end;

procedure TCustomDicomImage.SetMagnificationType(Value: TMagnificationType);
//var
//  k1: TKernelResampler;

begin
  if Value <> fMagnificationType then
  begin
    fMagnificationType := Value;
    {$IFDEF USE_BITMAP32_VIEWER}
    case fMagnificationType of
      mftNone:
        begin
          Bitmap.Resampler := TNearestResampler.Create(Bitmap);
        end;
      mftBILINEAR:
        begin
          Bitmap.Resampler := TLinearResampler.Create(Bitmap);
        end;
      mftREPLICATE:
        begin
          Bitmap.Resampler := TKernelResampler.Create(Bitmap);
          TKernelResampler(Bitmap.Resampler).Kernel := TMitchellKernel.Create; //

        end;
    else
      begin
        Bitmap.Resampler := TKernelResampler.Create(Bitmap);
        TKernelResampler(Bitmap.Resampler).Kernel :=
          //TLanczosKernel.Create;
//THammingKernel.Create;
//THermiteKernel.Create;
//TSplineKernel.Create;
        TCubicKernel.Create;
        TKernelResampler(Bitmap.Resampler).KernelMode := kmTableLinear; //kmTableNearest;
        TKernelResampler(Bitmap.Resampler).TableSize := 2048;
        TKernelResampler(Bitmap.Resampler).PixelAccessMode := pamWrap;

      end;
    end;
    {$ENDIF}
  end;
end;

destructor TCustomDicomImage.Destroy;
begin
  FPrintSelectedIcon.Free;
  FPrintNoSelectedIcon.Free;
  FSelectedLockIcon.Free;

  FMyPopupMenu.Free;
  FDrawObjectPopupMenu.Free;

  fWHint.free;
  if fMagnifierView <> nil then
    fMagnifierView.free;
  FTimer.Enabled := false;
  FTimer.Free;

  fDrawCine.Free;
  inherited;
end;

function TCustomDicomImage.GetAttributes: TDicomAttributes;
begin
  if (FAttributesIndex >= 0) and assigned(FDicomDatasets) and (FAttributesIndex <
    FDicomDatasets.Count) then
  begin
    Result := FDicomDatasets[FAttributesIndex].Attributes;
  end
  else
    Result := nil;
end;

procedure TCustomDicomImage.Clear;
begin
  //  FAttributes_ := nil;
  {$IFDEF USE_BITMAP32_VIEWER}
  Bitmap.SetSize(0, 0);
  {$ELSE}
  //Bitmap.Clear;
  {$ENDIF}
end;

procedure TCustomDicomImage.AttributesChanged;
var
  str1: string;
  //Size: TSize;
  //f1: Double;
begin
  //      if (Bitmap.Width > 0) and (Bitmap.Height > 0) then
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    str1 := Attributes.GetString($8, $60);

    beginUpdate;

    DCM_ImageData_Bitmap32.AssignToBitmap(Attributes.ImageData, bitmap, false);

    if (Bitmap.Width > 0) and (Bitmap.Height > 0) then
    begin
      //f1 := Min(Width / Bitmap.Width, Height / Bitmap.Height);
      if (abs(Attributes.ImageData.ViewerZoom - 1) < 0.1) and (Attributes.ImageData.OffsetY = 0)
        and (Attributes.ImageData.OffsetX = 0) then
      begin
        Scale := GetBasicScale;
        //Size := GetBitmapSize;
        OffsetVert := GetBasicOffsetVert; //(Height - Size.Cy) div 2;
        OffsetHorz := GetBasicOffsetHorz; //(Width - Size.Cx) div 2;
      end
      else
      begin
        //        ShowMessage(FloatToStr(Attributes.ImageData.ViewerZoom));
        Scale := Attributes.ImageData.ViewerZoom * GetBasicScale;
        OffsetVert := Attributes.ImageData.OffsetY + GetBasicOffsetVert + GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2);
        OffsetHorz := Attributes.ImageData.OffsetX + GetBasicOffsetHorz + GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2);
      end;
      MagnificationType := Attributes.ImageData.MagnificationType;
    end;
    EndUpdate;
    Invalidate;

    fDrawCine.Attributes := Attributes;
  end
  else
    {$IFDEF USE_BITMAP32_VIEWER}
    Bitmap.SetSize(0, 0);
  {$ELSE}
    //Bitmap.Clear;
    {$ENDIF}
end;

(*
procedure TCustomDicomImage.SetAttributes(Value: TDicomAttributes);
var
  Size: TSize;
  str1: string;
begin
  FTimer.Enabled := false;

//  FAttributes_ := Value;
  if Value <> nil then
  begin
    if not assigned(Value.ImageData) then
    begin
//      FAttributes_ := nil;
      Bitmap.SetSize(256, 256);
      Bitmap.Canvas.TextOut(1, 1, 'І»КЗНјПсёсКЅ');
      Layers.Clear;
      Layers.TextLayerCount := 0;

      exit;
    end;
    Refresh;
    {    //    if assigned(Attributes.ImageData) then
        begin
          str1 := Value.GetString($8, $60);
          if (str1 = 'DX') or (str1 = 'DR') or (str1 = 'CR') then
            Bitmap.StretchFilter := sfNearest
          else
          begin
            if Attributes.ImageData.FrameCount > 1 then
              Bitmap.StretchFilter := sfNearest
            else
              Bitmap.StretchFilter := sfLanczos;
          end;
          beginUpdate;
          UpdateX;
          Scale := Min(Width / Bitmap.Width, Height / Bitmap.Height);
          Size := GetBitmapSize;
          OffsetVert := (Height - Size.Cy) div 2;
          OffsetHorz := (Width - Size.Cx) div 2;
          EndUpdate;
          Invalidate;
        end;

        fDrawCine.Attributes := Value;  }
  end
  else
  begin
    //    Bitmap.Clear;
    Bitmap.SetSize(0, 0);
    Layers.Clear;
    Layers.TextLayerCount := 0;

    //    FLockImage := false;
  end;
end;
*)

procedure TCustomDicomImage.SetDicomDatasets(Value: TDicomDatasets);
begin
  if FDicomDatasets <> Value then
  begin
    FDicomDatasets := Value;
    if (FDicomDatasets = nil) or (AttributesIndex >= FDicomDatasets.Count) then
      AttributesIndex := -1; //AttributesIndex;
    {$IFDEF USE_BITMAP32_VIEWER}
    Bitmap.SetSize(0, 0);
    invalidate;
    {$ELSE}
    //Bitmap.Clear;
    {$ENDIF}
  end;
end;

procedure TCustomDicomImage.CMWantSpecialKey(var Msg: TCMWantSpecialKey);
begin
  inherited;
  {  case msg.CharCode of
      VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN, VK_SPACE, VK_SUBTRACT, VK_ADD,
        VK_PRIOR, VK_NEXT, VK_HOME, VK_END, VK_RETURN, VK_DELETE, VK_PRINT, VK_NUMPAD0..VK_NUMPAD9,
        VK_F1..VK_F24: msg.Result := 1
    end;}
end;

procedure TCustomDicomImage.SetScale(Value: Single);
var
  str1: string;
begin
  if (assigned(Attributes)) and assigned(Attributes.ImageData) and (Attributes.ImageData.FrameCount = 1) and
    (Attributes.ImageData.Height > 1024) then
  begin
    str1 := Attributes.GetString($8, $60);

  end;

  inherited SetScale(Value);

  if (UpdateCount = 0) and (assigned(Attributes) and assigned(Attributes.ImageData)) then
  begin
    //    Attributes.ImageData.Zoom := Scale;
//    if Attributes.ImageData.ViewerZoom <> 1 then
    Attributes.ImageData.ViewerZoom := Scale / GetBasicScale;
    Attributes.ImageData.UpdateCood(0, 0,
      trunc(OffsetHorz), trunc(OffsetVert),
      Scale, Attributes.ImageData.PixelSpacingX, Attributes.ImageData.PixelSpacingY);

  end;
end;

procedure TCustomDicomImage.SetOffsetHorz(Value: Single);
begin
  inherited SetOffsetHorz(Value);

  if (UpdateCount = 0) and (assigned(Attributes) and assigned(Attributes.ImageData)) then
  begin
    if Attributes.ImageData.OffsetX <> 0 then
      Attributes.ImageData.OffsetX := OffsetHorz - GetBasicOffsetHorz -
        GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2); // Scale;
    //Attributes.ImageData.OffsetX := ((OffsetHorz - GetBasicOffsetHorz) / GetBasicScale);
    Attributes.ImageData.UpdateCood(0, 0,
      trunc(OffsetHorz), trunc(OffsetVert),
      Scale, Attributes.ImageData.PixelSpacingX, Attributes.ImageData.PixelSpacingY);
  end;
end;

procedure TCustomDicomImage.SetOffsetVert(Value: Single);
begin
  inherited SetOffsetVert(Value);
  if (UpdateCount = 0) and (assigned(Attributes) and assigned(Attributes.ImageData)) then
  begin
    if Attributes.ImageData.OffsetY <> 0 then
      Attributes.ImageData.OffsetY := OffsetVert - GetBasicOffsetVert - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2); // Scale;
    //Attributes.ImageData.OffsetY := ((OffsetVert - GetBasicOffsetVert) / GetBasicScale); /// Scale;
    Attributes.ImageData.UpdateCood(0, 0,
      trunc(OffsetHorz), trunc(OffsetVert),
      Scale, Attributes.ImageData.PixelSpacingX, Attributes.ImageData.PixelSpacingY);
  end;
end;

procedure TCustomDicomImage.SetView(AOffsetVert, AOffsetHorz: Single);
begin
  if (UpdateCount = 0) and (assigned(Attributes) and assigned(Attributes.ImageData)) then
  begin
    //if (abs(AOffsetVert / Scale) < (Attributes.ImageData.Height / 2)) and (abs(AOffsetHorz / Scale) < (Attributes.ImageData.Width / 2)) then
    begin

      inherited SetView(AOffsetVert, AOffsetHorz);

      Attributes.ImageData.OffsetY := OffsetVert - GetBasicOffsetVert - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2); // Scale;
      Attributes.ImageData.OffsetX := OffsetHorz - GetBasicOffsetHorz - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2); // Scale;
      //Attributes.ImageData.OffsetY := ((OffsetVert - GetBasicOffsetVert) / GetBasicScale); // Scale;
      //Attributes.ImageData.OffsetX := ((OffsetHorz - GetBasicOffsetHorz) / GetBasicScale); // Scale;
      Attributes.ImageData.UpdateCood(0, 0,
        trunc(OffsetHorz), trunc(OffsetVert),
        Scale, Attributes.ImageData.PixelSpacingX, Attributes.ImageData.PixelSpacingY);

    end;
  end;
end;

procedure TCustomDicomImage.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, operation);
  if Operation = opRemove then
  begin
    if (AComponent = FDicomDatasets) then
    begin
      fMouseDragging := false;
      FDicomDatasets := nil;
      FAttributesIndex := -1;
      Clear;
      LockImage := false;
      invalidate;
    end {
      else
        if AComponent = FSelection then
      begin
        FSelection := nil;
      end;}
  end;
end;

function TCustomDicomImage.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint):
  Boolean;
begin
  if fDraggingMouseButton = mbMiddle then
    exit;

  if CineActive then
    exit;

  //inc(WheelDeltaCount);
  //if WheelDeltaCount > 4 then
  begin

    Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);

    case fMouseWheelInteract of
      mwiScaleWheel:
        begin
          result := true;
          if WheelDelta > 0 then
            Scale := Scale * (1 + 0.05)
          else
            Scale := Scale * (1 - 0.05);
          if (assigned(Attributes) and assigned(Attributes.ImageData)) then
          begin
            Attributes.ImageData.OffsetY := OffsetVert - GetBasicOffsetVert - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2); // Scale;
            Attributes.ImageData.OffsetX := OffsetHorz - GetBasicOffsetHorz - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2); // Scale;
            //Attributes.ImageData.OffsetY := ((OffsetVert - GetBasicOffsetVert) / GetBasicScale); // Scale;
            //Attributes.ImageData.OffsetX := ((OffsetHorz - GetBasicOffsetHorz) / GetBasicScale); // Scale;
          end;
          if assigned(FOnImageZoomChange) then
            FOnImageZoomChange(self, Scale);
        end;
      {mwiScroll:
        begin
          {if LockImage then
          begin
            if WheelDelta < 0 then
              Next
            else
              Prior;
          end;
        end;}
    end;
    //WheelDeltaCount := 0;
  end;
end;

//procedure TCustomDicomImage.MouseEnter;

procedure TCustomDicomImage.CMMouseEnter(var Msg: TMessage);
begin
  //  ShowMessage('?');
  if assigned(FDicomDatasets) and (not CineActive) then
  begin
    inherited;
    invalidate;
  end;
end;

procedure TCustomDicomImage.DrawBackgroupLines(ACanvas: TCnsBitmap32; MMFactor, FLeaderPerPage, FLeaderFrom,
  ALeft, ATop,
  AHeight, AWidth: Integer);
var
  I: Integer;
  h, CMFactor: Integer;
begin
  i := MMFactor;
  CMFactor := i * 5;
  repeat
    if (i mod CMFactor) = 0 then
      ACanvas.LineS(ALeft, ATop + i, ALeft + AWidth, ATop + i, $FFFF6060)
        //      ACanvas.pen.Color := $006060FF
    else
      ACanvas.LineS(ALeft, ATop + i, ALeft + AWidth, ATop + i, $FFFFC8C8);

    inc(i, MMFactor);
  until (i >= AHeight);
  i := MMFactor;
  repeat
    if (i mod CMFactor) = 0 then
      ACanvas.LineS(ALeft + i, ATop, ALeft + i, ATop + AHeight, $FFFF6060)
    else
      ACanvas.LineS(ALeft + i, ATop, ALeft + i, ATop + AHeight, $FFFFC8C8);
    inc(i, MMFactor);
  until (i >= AWidth);

  h := AHeight div FLeaderPerPage;
  //  k := AHeight + h div 2;
  ACanvas.Font.Color := clBlack;
  //for i := 0 to FLeaderPerPage - 1 do
  begin
    with ACanvas do
    begin
      //      if i < FleaderName.Count then
      //        TextOut(ALeft + 5, ATop + i * h + 8, FLeaderName[FLeaderFrom + i]);
    end;
  end;
end;

procedure TCustomDicomImage.DrawECGLines(ACanvas: TCnsBitmap32; ALeft, ATop,
  AHeight, AWidth: Integer);
//var
//  k, h, d, i, t1: Short;
//  p1, p2: PShort;
begin
  //  if XButton = 0 then
  DrawBackgroupLines(ACanvas, MMFactor, FLeaderPerPage, FLeaderFrom, ALeft, ATop, AHeight,
    AWidth);

  {  if Buffer <> nil then
    begin
      //    ACanvas.TextOut(0, 0, FPatName);
      h := AHeight div FLeaderPerPage;
      k := ATop + h div 2;
      d := 10; //FLeaderZoomFactor;

      if (BufferSize - Pos) < AWidth * FLeaderCount * FLeaderScale * sizeof(Short) then
        GraphWidth := (BufferSize - Pos) div (FLeaderCount * FLeaderScale * sizeof(Short))
      else
        GraphWidth := AWidth;

      ACanvas.pen.Color := PlotColor;
      //  if GraphWidth>0 then
      begin
        p1 := BufferPos;
        p2 := BufferPos;
        inc(p2, LeaderScale * LeaderCount);

        for i := 0 to (GraphWidth) - 2 do
        begin
          with ACanvas do
            for t1 := 0 to FLeaderPerPage - 1 do
            begin
              MoveTo(ALeft + i, k + h * t1 - (p1^) div d);
              LineTo(ALeft + i + 1, k + h * t1 - (p2^) div d);
              inc(p1);
              inc(p2);
            end;
          if FLeaderPerPage < LeaderCount then
          begin
            inc(p1, FLeaderCount - FLeaderPerPage);
            inc(p2, FLeaderCount - FLeaderPerPage);
          end;
          inc(p1, (LeaderScale - 1) * LeaderCount);
          inc(p2, (LeaderScale - 1) * LeaderCount);
        end;
      end;
    end;}
end;

procedure TCustomDicomImage.DoPaintGDIOverlay;
begin
  inherited;
  //  if assigned(Attributes) and assigned(Attributes.ImageData) then
  //    Attributes.ImageData.DrawTopoLine(Canvas, Scale, OffsetHorz, OffsetVert, width, height);
end;

//procedure TCustomDicomImage.MouseLeave;

procedure TCustomDicomImage.CMMouseLeave(var Msg: TMessage);
begin
  if assigned(FDicomDatasets) and (not CineActive) then
  begin
    fMouseDragging := false;
    self.Cursor := crDefault;
    fWHint.Hide;
    if fMagnifierView <> nil then
    begin
      //Cursor := crDefault;
      fMagnifierView.Hide;
    end;
    inherited;

    invalidate;
  end;
end;

procedure TCustomDicomImage.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  function IsInExtRect: Boolean;
  var
    ux, uy: Integer;
  begin
    ux := Width div 5;
    uy := Height div 5;
    Result := ((x < ux) or (x > (Width - ux))) and ((y < uy) or (y > (Height - uy)));
  end;
  function IsInSelectRect: Boolean;
  var
    ux, uy: Integer;
  begin
    ux := 32;
    uy := 32;
    Result := (x < ux) and (y < uy);
  end;
  function IsInPrintSelectRect: Boolean;
  var
    ux, uy: Integer;
  begin
    ux := self.width - 32;
    uy := 32;
    Result := (x > ux) and (y < uy);
  end;
  function IsInLockSelectRect: Boolean;
  var
    ux, uy: Integer;
  begin
    ux := self.width - 32;
    uy := self.Height - 32;
    Result := (x > ux) and (y > uy);
  end;
var
  //  L: TCnsPositionedLayer;
  o1: TDicomDrawObject;
  k: integer;
begin
  {$IFDEF DICOMDEBUG}
  SendDebug(Format('Mouse Down: Width=%d,Height=%d,X=%d,Y=%d', [Width, Height, X, Y]));
  {$ENDIF}

  //fOldWidth := Width;
  //fOldHeight := Height;

  if fJustDBLCLick then
  begin
    fJustDBLCLick := false;
    exit;
  end;

  if fCanMultiSelect and assigned(Attributes) then
    if IsInSelectRect then
    begin
      if not (ssCtrl in shift) then
      begin
        with Attributes do
        begin
          if ImageData.FrameCount <= 1 then
            MultiSelected1 := not MultiSelected1
          else
            ImageData.ImageData[ImageData.CurrentFrame].Selected := not
              ImageData.ImageData[ImageData.CurrentFrame].Selected;
          invalidate;
        end;
        //if assigned(FOnViewFlagChange) then
         // FOnViewFlagChange(Attributes);
      end;
      exit;
    end
    else
      if IsInPrintSelectRect then
    begin
      with Attributes do
      begin
        if ImageData.FrameCount <= 1 then
          MultiSelected2 := not MultiSelected2
        else
          ImageData.ImageData[ImageData.CurrentFrame].Selected := not
            ImageData.ImageData[ImageData.CurrentFrame].Selected;
        invalidate;
        if DicomDatasets is TCnsDMtable then
        begin
          if MultiSelected2 then
            TCnsDMTable(DicomDatasets).AddSelectedImage(self.AttributesIndex)
          else
            TCnsDMTable(DicomDatasets).RemoveSelectedImage(self.AttributesIndex);
        end;
      end;
      if assigned(FOnViewFlagChange) then
        FOnViewFlagChange(Attributes);

      exit;
    end
    else
      if IsInLockSelectRect and GetCanLockImage then
    begin
      with Attributes do
      begin
        LockImage := not LockImage;
        MultiSelected4 := LockImage;
        DicomDatasets.LockCount := 1;
        if assigned(fOnDicomImageLock) then
          fOnDicomImageLock(self, FLockImage);
        invalidate;
      end;
      exit;
    end;

  inherited MouseDown(Button, Shift, X, Y);

  if FNoLockByUpper and assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    BeginUpdate;
    if CineActive and ((Button = mbLeft) and (fLeftMouseInteract <> miWindow)) then
    begin
      exit;
    end;
    o1 := Attributes.ImageData.DrawObjects.NewDrawObject;
    if Attributes.ImageData.DrawObjects.MouseDown(Button, Shift, X, Y,
      Attributes.ImageData.CurrentFrame) then
    begin
      if (o1 <> nil) and (Attributes.ImageData.DrawObjects.NewDrawObject = nil) then
        invalidate;
      k := Attributes.ImageData.GettopoLine(
        Trunc(Attributes.ImageData.ImageCood.XScr2Bmp(x)),
        Trunc(Attributes.ImageData.ImageCood.Yscr2bmp(y)));
      if k >= 0 then
      begin

      //  ShowMessage(IntToStr(K));

        if assigned(OnTopoLineClick) then
          OnTopoLineClick(self, k);
      end;
      LastMousePos := Point(X, Y);
      LastChangeMousePos := Point(X, Y);
      DownMousePos := Point(X, Y);

      fMouseDragging := true;
      fDraggingMouseButton := Button;
      MouseDownScale := Scale;

      fBeforeMouseDownLeftMouseInteract := fLeftMouseInteract;
      fBeforeMouseDownRightMouseInteract := fRightMouseInteract;

      if Button = mbLeft then
      begin
        {if ssShift in Shift then
        begin

        end
        else
          if ssAlt in Shift then
        begin

        end
        else
          if ssCtrl in Shift then
        begin

        end
        else}
        if ssAlt in Shift then
        begin
          fLeftMouseInteract := miZoom;
          //MouseDownScale := Scale;
          self.Cursor := dcmcr_ZOOMMENO;
        end
        else
        begin
          case fLeftMouseInteract of
            miWindow:
              begin
                //fRightMouseInteract := miWindow;
                Cursor := dcmcr_WINDOW;
              end;
            miStack:
              Cursor := crMultiDrag;
            miSelectROI:
              begin
                MovingMousePos := Point(X, Y);
              end;
            miSelectPlot:
              begin
                MovingMousePos := Point(X, Y);
              end;
            miSelectZoom, miZoom:
              begin
                //MouseDownScale := Scale;
                MovingMousePos := Point(X, Y);
                Cursor := dcmcr_ZOOMMENO;
              end;
            miSelect:
              begin
                MovingMousePos := Point(X, Y);
              end;
            miMagnifier:
              UpdateMagnifier(x, y);
            miLineProfile:
              begin
                //                PolygonMousePos := Point(X, Y);
                                //DrawLineInserting;
                MovingMousePos := Point(X, Y);
                Changed;
              end;
            miScroll:
              begin
                self.Cursor := crSizeAll;
              end;
            mi3DCursor:
              begin
                Cursor := crCross;
                //PositionCursorPosition := Point(X, Y);

                if assigned(FOn3DCursorStart) then
                  FOn3DCursorStart(self, X, Y);
                //if assigned(fOn3DCursorMove) then
                //  fOn3DCursorMove(self, X, Y);
              end;
          end;
        end;
      end
      else
        if Button = mbRight then
      begin
        if ssShift in Shift then
        begin
          fRightMouseInteract := miScroll;
          self.Cursor := crSizeAll;
          //        BitmapAlign := baCustom;
        {end
        else
          if ssAlt in Shift then
        begin
          fRightMouseInteract := miZoom;
          self.Cursor := dcmcr_ZOOMMENO;  }
        end
        else
          if ssCtrl in Shift then
        begin
          fRightMouseInteract := miSelectROI;
          //        self.Cursor := dcmcr_ZOOMMENO;
          MovingMousePos := Point(X, Y);
        end
        else
        begin
          case fRightMouseInteract of
            miSelectZoom, miZoom:
              begin
                //MouseDownScale := Scale;
                MovingMousePos := Point(X, Y);
                Cursor := dcmcr_ZOOMMENO;
              end;
            miSelectROI:
              begin
                MovingMousePos := Point(X, Y);
                self.Cursor := crCross;
              end;
            miNone, miWindow:
              {if IsInExtRect then
              begin
                fRightMouseInteract := miZoom;
                self.Cursor := dcmcr_ZOOMMENO;
                //MouseDownScale := Scale;
              end
              else }
              begin
                fRightMouseInteract := miWindow;
                self.Cursor := dcmcr_WINDOW;
              end;
            mi3DCursor:
              begin
                Cursor := crCross;
                //PositionCursorPosition := Point(X, Y);

                if assigned(FOn3DCursorStart) then
                  FOn3DCursorStart(self, X, Y);
                //if assigned(fOn3DCursorMove) then
                //  fOn3DCursorMove(self, X, Y);
              end;
          end;
        end;
      end
      else
        if Button = mbMiddle then
      begin
        self.Cursor := dcmcr_WINDOW;
      end;
    end
    else
      invalidate;

    EndUpdate;
    Changed;
  end;
end;

procedure TCustomDicomImage.MouseMove(Shift: TShiftState; X, Y: Integer);
  function IsInPrintIconRect: Boolean;
  begin
    Result := (x < (Width - 2)) and (x >= (Width - 32)) and (y <= 32) and (y >= 2);
  end;
var
  Dx, Dy: Integer;
  //  str1: string;
begin
  if CineActive and ((fDraggingMouseButton = mbLeft) and (fLeftMouseInteract <> miWindow)) then
  begin
    exit;
  end;
  if not FNoLockByUpper then
    exit;

  {$IFDEF DICOMDEBUG}
  //  SendDebug(Format('Mouse Move: Width=%d,Height=%d,X=%d,Y=%d', [Width, Height, X, Y]));
  {$ENDIF}

  //if (fOldWidth <> Width) or (fOldHeight <> Height) then
  //  exit;

  if (Attributes <> nil) and (Attributes.ImageData <> nil) then
  begin
    if fMouseDragging then
    begin

      if (not (ssCtrl in Shift)) and (not (ssShift in Shift)) and (not (ssAlt in Shift)) and (fDraggingMouseButton = mbLeft) and ((FDragFrom = dfsFromSameSeries) or (fLeftMouseInteract = miNone) {and (fDragDropMode = ddmForPrint)}) then
      begin
        if (abs(x - DownMousePos.X) >= 5) or (abs(y - DownMousePos.y) >= 5) then
        begin
          self.BeginDrag(true);
          exit;
        end;
      end;
      Dx := X - LastMousePos.X;
      Dy := Y - LastMousePos.Y;
      //if (abs(x - DownMousePos.X) >= 5) or (abs(y - DownMousePos.y) >= 5) then
      if fDraggingMouseButton = mbRight then
      begin
        case fRightMouseInteract of
          miPixelValue:
            begin
              UpdateHint(x, y);
            end;
          miWindow:
            begin
              if not fInMovingMouseProcess then
              begin
                fInMovingMouseProcess := true;
                Cursor := dcmcr_WINDOW;
                {$IFDEF DICOMDEBUG}
                SendDebug('WindowWidth');
                {$ENDIF}

                if QuickWindowMode or (ssAlt in Shift) then
                begin
                  Attributes.ImageData.WindowWidth := Round(Attributes.ImageData.WindowWidth + Dx * Attributes.ImageData.MouseCtrlWwWlFactor);
                  if DefaultWindowMouseMode then
                    Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter + Dy * Attributes.ImageData.MouseCtrlWwWlFactor)
                  else
                    Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter - Dy * Attributes.ImageData.MouseCtrlWwWlFactor);
                end
                  {else
                    if Attributes.ImageData.Bits <= 8 then
                  begin
                    Attributes.ImageData.WindowWidth := Attributes.ImageData.WindowWidth + Dx div 3;
                    if DefaultWindowMouseMode then
                    Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter - Dy div 3;
                  end}
                else
                begin
                  {str1 := Attributes.GetString(8, $60);
                  if (str1 = 'CR') or (str1 = 'DX') or (str1 = 'DR') then
                  begin
                    Attributes.ImageData.WindowWidth := Attributes.ImageData.WindowWidth + Dx *
                      FMouseCtrlWwWlFactor;
                    Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter - Dy *
                      FMouseCtrlWwWlFactor;
                  end
                  else}
                  begin
                    Attributes.ImageData.WindowWidth := Round(Attributes.ImageData.WindowWidth + Dx * Attributes.ImageData.MouseWwWlFactor);
                    if DefaultWindowMouseMode then
                      Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter + Dy * Attributes.ImageData.MouseWwWlFactor)
                    else
                      Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter - Dy * Attributes.ImageData.MouseWwWlFactor);
                  end;
                end;

                UpdateX;
                //invalidate;
              end;
            end;
          miZoom:
            begin
              {$IFDEF DICOMDEBUG}
              SendDebug('Scale');
              {$ENDIF}

              {if (dy > 0) then
                Scale := Scale - dy / 100//sqrt(dx * dx + dy * dy)
              else}
              Scale := Scale - dy / 100;

              Cursor := dcmcr_ZOOMMENO;
              {$IFDEF DICOMDEBUG}
              SendDebug('Offset');
              {$ENDIF}
              if (assigned(Attributes) and assigned(Attributes.ImageData)) then
                //if (abs(OffsetVert / Scale) < (Attributes.ImageData.Height / 2)) and (abs(OffsetHorz / Scale) > (Attributes.ImageData.Width / 2)) then
              begin
                Attributes.ImageData.OffsetY := OffsetVert - GetBasicOffsetVert - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2); // Scale;
                Attributes.ImageData.OffsetX := OffsetHorz - GetBasicOffsetHorz - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2); // Scale;
                //Attributes.ImageData.OffsetY := ((OffsetVert - GetBasicOffsetVert) / GetBasicScale); // Scale;
                //Attributes.ImageData.OffsetX := ((OffsetHorz - GetBasicOffsetHorz) / GetBasicScale); // Scale;
              end;
              invalidate;
              {$IFDEF ZOOM_SYNC_AFTER_CHANGE}
              if max(abs(X - DownMousePos.X), abs(Y - DownMousePos.Y)) > 3 then
                if assigned(FOnImageZoomChange) then
                  FOnImageZoomChange(self, Scale);
              {$ENDIF}
            end;
          miScroll:
            begin
              SetView(OffsetVert + DY, OffsetHorz + DX);
              self.Cursor := crSizeAll;
            end;
          miSelectROI, miSelect, miSelectPlot, miSelectZoom:
            begin
              DrawBoxInserting;
              MovingMousePos := Point(X, Y);
              DrawBoxInserting;
            end;
          miMagnifier:
            UpdateMagnifier(x, y);
          mi3DCursor:
            begin
              Cursor := crCross;
              //PositionCursorPosition := Point(X, Y);

              if assigned(fOn3DCursorMove) then
                fOn3DCursorMove(self, X, Y);

            end;
        end;
      end
      else
        if fDraggingMouseButton = mbLeft then
      begin
        if ssShift in Shift then
        begin
          UpdateMagnifier(x, y);
        end
        else
          if ssCtrl in Shift then
        begin
          UpdateHint(x, y);
        end
        else
        begin
          case fLeftMouseInteract of
            miPixelValue:
              begin
                UpdateHint(x, y);
              end;
            miLineProfile:
              begin
                DrawLineInserting;
                MovingMousePos := Point(X, Y);
                DrawLineInserting;
              end;
            miProbe:
              UpdateHint(x, y);
            miMagnifier:
              UpdateMagnifier(x, y);
            miPerpendicularityLine:
              begin
                DrawPLineInserting;
                MovingMousePos := Point(X, Y);
                DrawPLineInserting;
              end;
            miPerpendicularityGrid:
              begin
                DrawPGridInserting;
                MovingMousePos := Point(X, Y);
                DrawPGridInserting;
              end;
            {miDragdown:
              begin
                if (abs(DownMousePos.X - X) > 20) or (abs(DownMousePos.Y - Y) > 20) then
                begin
                  self.BeginDrag(true);
                end;
              end; }
            miScroll:
              begin
                SetView(OffsetVert + DY, OffsetHorz + DX);
              end;
            miSelectROI, miSelect,
              miSelectZoom, miSelectPlot: // Zoom in rectangle
              begin
                DrawBoxInserting;
                MovingMousePos := Point(X, Y);
                DrawBoxInserting;
              end;
            miZoom:
              begin
                if (abs(dy) > 1) then
                begin //Scale := Scale - sqrt(dx * dx + dy * dy) / 100
                  //else}
                  Scale := Scale - dy / 100;
                  //                Scale := Scale - sqrt(dx * dx + dy * dy) / 100;
                  if (assigned(Attributes) and assigned(Attributes.ImageData)) then
                    //if (abs(OffsetVert / Scale) < (Attributes.ImageData.Height / 2)) and (abs(OffsetHorz / Scale) > (Attributes.ImageData.Width / 2)) then
                  begin
                    Attributes.ImageData.OffsetY := OffsetVert - GetBasicOffsetVert - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2); // Scale;
                    Attributes.ImageData.OffsetX := OffsetHorz - GetBasicOffsetHorz - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2); // Scale;
                  end;
                  {$IFDEF ZOOM_SYNC_AFTER_CHANGE}
                  if abs(Y - DownMousePos.Y) > 3 then
                    if assigned(FOnImageZoomChange) then
                      FOnImageZoomChange(self, Scale);
                  {$ENDIF}
                end;
              end;
            miStack:
              begin
                if ((X - LastChangeMousePos.X) > 20) or ((Y - LastChangeMousePos.Y) > 20) then
                begin
                  LastChangeMousePos := Point(X, Y);
                  if assigned(fParentViewer) then
                    fParentViewer.CurrentImage := fParentViewer.CurrentImage + 1
                  else
                    Next;
                end
                else
                  if ((X - LastChangeMousePos.X) < -20) or ((Y - LastChangeMousePos.Y) < -20)
                  then
                begin
                  LastChangeMousePos := Point(X, Y);
                  if assigned(fParentViewer) then
                    fParentViewer.CurrentImage := fParentViewer.CurrentImage - 1
                  else
                    Prior;
                end;
              end;
            mi3DCursor:
              begin
                Cursor := crCross;
                //PositionCursorPosition := Point(X,Y);

                if assigned(fOn3DCursorMove) then
                  fOn3DCursorMove(self, X, Y);

              end;
            miWindow:
              if not fInMovingMouseProcess then
              begin
                fInMovingMouseProcess := true;
                if QuickWindowMode or (ssAlt in Shift) then
                begin
                  Attributes.ImageData.WindowWidth := Round(Attributes.ImageData.WindowWidth + Dx * Attributes.ImageData.MouseCtrlWwWlFactor);
                  if DefaultWindowMouseMode then
                    Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter + Dy * Attributes.ImageData.MouseCtrlWwWlFactor)
                  else
                    Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter - Dy * Attributes.ImageData.MouseCtrlWwWlFactor);
                end
                  {else
                    if Attributes.ImageData.Bits <= 8 then
                  begin
                    Attributes.ImageData.WindowWidth := Attributes.ImageData.WindowWidth + Dx div                      3;
                    if DefaultWindowMouseMode then
                    Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter - Dy div                      3;
                  end }
                else
                begin
                  {str1 := Attributes.GetString(8, $60);
                  if (str1 = 'CR') or (str1 = 'DX') or (str1 = 'DR') then
                  begin
                    Attributes.ImageData.WindowWidth := Attributes.ImageData.WindowWidth + Dx *
                      3;
                    Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter - Dy *
                      3;
                  end
                  else}
                  begin
                    Attributes.ImageData.WindowWidth := Round(Attributes.ImageData.WindowWidth + Dx * Attributes.ImageData.MouseWwWlFactor);
                    if DefaultWindowMouseMode then
                      Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter + Dy * Attributes.ImageData.MouseWwWlFactor)
                    else
                      Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter - Dy * Attributes.ImageData.MouseWwWlFactor);
                  end;
                end;
                UpdateX;
              end;
          end;
        end;
      end
      else
        if fDraggingMouseButton = mbMiddle then
      begin
        if not fInMovingMouseProcess then
        begin
          fInMovingMouseProcess := true;
          if QuickWindowMode or (ssCtrl in Shift) then
          begin
            Attributes.ImageData.WindowWidth := Round(Attributes.ImageData.WindowWidth + Dx * Attributes.ImageData.MouseWwWlFactor);
            if DefaultWindowMouseMode then
              Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter + Dy * Attributes.ImageData.MouseWwWlFactor)
            else
              Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter - Dy * Attributes.ImageData.MouseWwWlFactor);
          end
            {else
              if Attributes.ImageData.Bits <= 8 then
            begin
              Attributes.ImageData.WindowWidth := Attributes.ImageData.WindowWidth + Dx div                3;
              Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter - Dy div                3;
            end }
          else
          begin
            {str1 := Attributes.GetString(8, $60);
            if (str1 = 'CR') or (str1 = 'DX') or (str1 = 'DR') then
            begin
              Attributes.ImageData.WindowWidth := Attributes.ImageData.WindowWidth + Dx *                3;
              Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter - Dy *                3;
            end
            else}
            begin
              Attributes.ImageData.WindowWidth := Round(Attributes.ImageData.WindowWidth + Dx * Attributes.ImageData.MouseCtrlWwWlFactor);
              if DefaultWindowMouseMode then
                Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter + Dy * Attributes.ImageData.MouseCtrlWwWlFactor)
              else
                Attributes.ImageData.WindowCenter := Round(Attributes.ImageData.WindowCenter - Dy * Attributes.ImageData.MouseCtrlWwWlFactor);
            end;
          end;
          UpdateX;
        end;
      end
      else
      begin

      end;
      LastMousePos := Point(X, Y);
    end
    else
    begin
      //if assigned(Attributes) and assigned(Attributes.ImageData) then
      if (not Attributes.ImageData.DrawObjects.MouseMove(Shift, X, Y)) then
      begin
        if Attributes.ImageData.DrawObjects.NewDrawObject <> nil then
          Invalidate
      end;
      //else
      begin
        //if (fRightMouseInteract = miPixelValue) or (fLeftMouseInteract = miPixelValue) then

        if ShowPixelValueHint then
        begin
          if (x > 5) and (x < (width - 5)) and (y > 5) and (y < (height - 5)) then
            UpdateHint(x, y)
          else
            self.fWHint.Hide;
        end;
      end;
    end;
  end;
  if fCanMultiSelect and (not MouseCapture) and assigned(Attributes) and (not
    Attributes.MultiSelected2) then
  begin
    if IsInPrintIconRect then
    begin
      //Canvas.Draw(Width - 33, 1, FPrintNoSelectedIcon);
      FDrawPrintNoSelectIcon := true;
    end
    else
    begin
      if FDrawPrintNoSelectIcon then
      begin
        FDrawPrintNoSelectIcon := false;
        //Update;
      end;
    end;
  end
  else
    FDrawPrintNoSelectIcon := false;
  {  if FPerpendicularityLine then
    begin
      if FPerpendicularityLinePos.X <> X then
      begin
        bbx := true;
        self.DrawLineInserting(FPerpendicularityLinePos.X, 0, FPerpendicularityLinePos.X, height - 1);
      end
      else
        bbx := false;
      if FPerpendicularityLinePos.Y <> Y then
      begin
        bby := true;
        self.DrawLineInserting(0, FPerpendicularityLinePos.y, width - 1, FPerpendicularityLinePos.y);
      end
      else
        bby := false;
      FPerpendicularityLinePos := Point(X, Y);
      if bbx then
        self.DrawLineInserting(X, 0, X, height - 1);
      if bby then
        self.DrawLineInserting(0, y, width - 1, y);
    end; }

  inherited MouseMove(Shift, X, Y);
end;

procedure TCustomDicomImage.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  function IsInSelectRect: Boolean;
  var
    ux, uy: Integer;
  begin
    ux := 32;
    uy := 32;
    Result := (x < ux) and (y < uy);
  end;
  function IsInPrintSelectRect: Boolean;
  var
    ux, uy: Integer;
  begin
    ux := self.width - 32;
    uy := 32;
    Result := (x > ux) and (y < uy);
  end;
  function IsInLockSelectRect: Boolean;
  var
    ux, uy: Integer;
  begin
    ux := self.width - 32;
    uy := self.Height - 32;
    Result := (x > ux) and (y > uy);
  end;
var
  pt1, pt2: TPoint;
begin
  inherited MouseUp(Button, Shift, X, Y);

  {$IFDEF DICOMDEBUG}
  SendDebug(Format('Mouse Up: Width=%d,Height=%d,X=%d,Y=%d', [Width, Height, X, Y]));
  {$ENDIF}

  //if (fOldWidth <> Width) or (fOldHeight <> Height) then
  //  exit;

  if CineActive and ((fDraggingMouseButton = mbLeft) and (fLeftMouseInteract <> miWindow)) then
  begin
    exit;
  end;
  if not FNoLockByUpper then
    exit;

  if (not assigned(Attributes)) {and(Button=mbright)} then
  begin
    pt1.X := x;
    pt1.Y := y;
    pt1 := ClientToScreen(pt1);
    if assigned(FCustomPopupMenu) then
      FCustomPopupMenu.Popup(pt1.X, pt1.Y)
    else
      FMyPopupMenu.Popup(pt1.X, pt1.Y);
  end;
  if fMouseDragging then
  begin
    if fDraggingMouseButton = mbLeft then
    begin
      case fLeftMouseInteract of
        miScroll:
          begin
            if (trunc(X - DownMousePos.X) <> 0) or (trunc(Y - DownMousePos.Y) <> 0) then
              if assigned(FOnImageScrollChange) then
                FOnImageScrollChange(self, trunc(X - DownMousePos.X), trunc(Y - DownMousePos.Y));
          end;
        miZoom:
          begin
            {$IFNDEF ZOOM_SYNC_AFTER_CHANGE}
            if abs(Y - DownMousePos.Y) <> 3 then
              if assigned(FOnImageZoomChange) then
                FOnImageZoomChange(self, Scale);
            {$ENDIF}
          end;
        miLineProfile:
          begin
            DrawLineInserting;
            pt1 := DownMousePos;
            pt2 := Point(X, Y);
            if (pt1.X <> pt2.X) and (pt1.Y <> pt2.Y) then
            begin
              {$IFDEF NEED3DPLOT}
              with TLineProfileForm.Create(self) do
              try
                fROIAttributes := self.Attributes;
                with CachedXForm do
                begin
                  fROIRect.Left := trunc((pt1.x - ShiftX) / (ScaleX / 65536));
                  fROIRect.Top := trunc((pt1.y - ShiftY) / (ScaleY / 65536));
                  fROIRect.Right := trunc((pt2.x - ShiftX) / (ScaleX / 65536));
                  fROIRect.Bottom := trunc((pt2.y - ShiftY) / (ScaleY / 65536));
                end;
                //RefreshCurve;
                ShowModal;
                Invalidate;
                //fLeftMouseInteract := miNone;
              finally
                Free;
              end;
              {$ENDIF}
            end;
          end;
        miSelectPlot:
          begin
            DrawBoxInserting;
            MovingMousePos := Point(X, Y);
            {$IFDEF NEED3DPLOT}
            with TPlot3DForm.Create(self) do
            try
              fROIAttributes := self.Attributes;
              fROIRect := GetSelectRect;

              ShowModal;

              fLeftMouseInteract := miNone;
            finally
              Free;
            end;
            {$ENDIF}
          end;
        miSelectROI:
          begin
            DrawBoxInserting;
            MovingMousePos := Point(X, Y);
            SelectionROI;
            if assigned(FOnImageWinLevelChange) then
              FOnImageWinLevelChange(self, Attributes.ImageData.WindowWidth,
                Attributes.ImageData.WindowCenter);
          end;
        miSelect:
          begin
            DrawBoxInserting;
            MovingMousePos := Point(X, Y);

          end;
        miSelectZoom: // Zoom in rectangle
          begin
            DrawBoxInserting;
            MovingMousePos := Point(X, Y);
            SelectionZoom;
            if assigned(FOnImageZoomChange) then
              FOnImageZoomChange(self, Scale);
          end;
        mi3DCursor:
          begin
            if assigned(FOn3DCursorEnd) then
              FOn3DCursorEnd(self);
          end;
        miWindow:
          begin
            if assigned(FOnImageWinLevelChange) then
              FOnImageWinLevelChange(self, Attributes.ImageData.WindowWidth,
                Attributes.ImageData.WindowCenter);
          end;
      end;
    end
    else
      if (fDraggingMouseButton = mbRight) then
    begin
      case fRightMouseInteract of
        miWindow:
          begin
            if assigned(FOnImageWinLevelChange) then
              FOnImageWinLevelChange(self, Attributes.ImageData.WindowWidth,
                Attributes.ImageData.WindowCenter);
          end;
        miZoom:
          begin
            {$IFNDEF ZOOM_SYNC_AFTER_CHANGE}
            if abs(Y - DownMousePos.Y) <> 3 then
              if assigned(FOnImageZoomChange) then
                FOnImageZoomChange(self, Scale);
            {$ENDIF}
          end;
        miScroll:
          begin
            if assigned(FOnImageScrollChange) then
              FOnImageScrollChange(self, trunc(X - DownMousePos.X), trunc(Y - DownMousePos.Y));
          end;
        miSelectROI:
          begin
            DrawBoxInserting;
            MovingMousePos := Point(X, Y);
            SelectionROI;
            if assigned(FOnImageWinLevelChange) then
              FOnImageWinLevelChange(self, Attributes.ImageData.WindowWidth,
                Attributes.ImageData.WindowCenter);
          end;
        miSelectZoom: // Zoom in rectangle
          begin
            DrawBoxInserting;
            MovingMousePos := Point(X, Y);
            SelectionZoom;
            if assigned(FOnImageZoomChange) then
              FOnImageZoomChange(self, Scale);
          end;
        mi3DCursor:
          begin
            if assigned(FOn3DCursorEnd) then
              FOn3DCursorEnd(self);
          end;
      end;

      if (abs(x - DownMousePos.X) < 3) and (abs(y - DownMousePos.y) < 3) then
      begin
        pt1.X := x;
        pt1.Y := y;
        pt1 := ClientToScreen(pt1);
        if assigned(FCustomPopupMenu) then
          FCustomPopupMenu.Popup(pt1.X, pt1.Y)
        else
          FMyPopupMenu.Popup(pt1.X, pt1.Y);
      end;
    end
    else
      if (fDraggingMouseButton = mbMiddle) then
    begin
      if assigned(FOnImageWinLevelChange) then
        FOnImageWinLevelChange(self, Attributes.ImageData.WindowWidth,
          Attributes.ImageData.WindowCenter);
    end;
  end
  else
  begin
    if assigned(Attributes) and assigned(Attributes.ImageData) then
    begin
      if not Attributes.ImageData.DrawObjects.MouseUp(Button, Shift, X, Y) then
        if Attributes.ImageData.DrawObjects.NewDrawObject <> nil then
        begin
          Invalidate;
        end;
      if (Attributes.ImageData.DrawObjects.NewDrawObject <> nil) then
        if (Button = mbRight) and (not Attributes.ImageData.DrawObjects.ObjectInserting) then
          //        if (abs(x - DownMousePos.X) < 5) and (abs(y - DownMousePos.y) < 5) then
        begin
          pt1.X := x;
          pt1.Y := y;
          pt1 := ClientToScreen(pt1);
          FDrawObjectPopupMenu.Popup(pt1.X, pt1.Y);
        end;
    end;
  end;
  //Bitmap.Rotate90();
  fWHint.Hide;
  if fMagnifierView <> nil then
  begin
    //Cursor := crDefault;
    fMagnifierView.hide;
  end;
  fMouseDragging := false;
  self.Cursor := crDefault;

  fLeftMouseInteract := fBeforeMouseDownLeftMouseInteract;
  fRightMouseInteract := fBeforeMouseDownRightMouseInteract;

  {  if fCanMultiSelect and assigned(Attributes) then
      if IsInSelectRect then
      begin
        if not (ssCtrl in shift) then
        begin
          with Attributes do
          begin
            if ImageData.FrameCount <= 1 then
              MultiSelected1 := not MultiSelected1
            else
              ImageData.ImageData[ImageData.CurrentFrame].Selected := not
                ImageData.ImageData[ImageData.CurrentFrame].Selected;
            invalidate;
          end;
          //if assigned(FOnViewFlagChange) then
           // FOnViewFlagChange(Attributes);
        end
      end
      else
        if IsInPrintSelectRect then
      begin
        with Attributes do
        begin
          if ImageData.FrameCount <= 1 then
            MultiSelected2 := not MultiSelected2
          else
            ImageData.ImageData[ImageData.CurrentFrame].Selected := not
              ImageData.ImageData[ImageData.CurrentFrame].Selected;
          invalidate;
          if DicomDatasets is TCnsDMtable then
          begin
            if MultiSelected2 then
              TCnsDMTable(DicomDatasets).AddSelectedImage(self.AttributesIndex)
            else
              TCnsDMTable(DicomDatasets).RemoveSelectedImage(self.AttributesIndex);
          end;
        end;
        if assigned(FOnViewFlagChange) then
          FOnViewFlagChange(Attributes);

      end
      else
        if IsInLockSelectRect and GetCanLockImage then
      begin
        with Attributes do
        begin
          LockImage := not LockImage;
          MultiSelected4 := LockImage;
          DicomDatasets.LockCount := 1;
          if assigned(fOnDicomImageLock) then
            fOnDicomImageLock(self, FLockImage);
          invalidate;
        end;
      end;  }
end;

procedure TCustomDicomImage.SetLeaderMouserInspect(Value: TLeaderMouserInspect);
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
    if (Attributes.ImageData.DrawObjects.LeaderMouserInspect <> Value) then
    begin
      Attributes.ImageData.DrawObjects.LeaderMouserInspect := Value;
      Attributes.ImageData.OnAfterNewDrawObject := DoFinishNewDrawObject;
      Attributes.ImageData.OnAfterObjectSize := DoDrawObjectSize;
      Attributes.ImageData.OnAfterObjectMove := DoDrawObjectMove;
      //    fMouseInserting := true;
    end;
  if Value <> ldmiNone then
    self.LeftMouseInteract := miNone;
end;

function TCustomDicomImage.GetLeaderMouserInspect: TLeaderMouserInspect;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
    Result := Attributes.ImageData.DrawObjects.LeaderMouserInspect
  else
    Result := ldmiNone;
end;

procedure TCustomDicomImage.KeyDown(var Key: Word; Shift: TShiftState);
var
  dx, dy: integer;
begin
  case Key of
    VK_DELETE:
      begin
        if assigned(Attributes) then
        begin
          Attributes.ImageData.DrawObjects.RemoveSelectedDrawObject;
          self.Invalidate;
        end;
      end;
    190:
      begin
        Scale := Scale + 0.10;
        if (assigned(Attributes) and assigned(Attributes.ImageData)) then
        begin
          Attributes.ImageData.OffsetY := OffsetVert - GetBasicOffsetVert - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2); // Scale;
          Attributes.ImageData.OffsetX := OffsetHorz - GetBasicOffsetHorz - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2); // Scale;
          //Attributes.ImageData.OffsetY := ((OffsetVert - GetBasicOffsetVert) / GetBasicScale); // Scale;
          //Attributes.ImageData.OffsetX := ((OffsetHorz - GetBasicOffsetHorz) / GetBasicScale); // Scale;
        end;
      end;
    188:
      begin
        Scale := Scale - 0.10;
        if (assigned(Attributes) and assigned(Attributes.ImageData)) then
        begin
          Attributes.ImageData.OffsetY := OffsetVert - GetBasicOffsetVert - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2); // Scale;
          Attributes.ImageData.OffsetX := OffsetHorz - GetBasicOffsetHorz - GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2); // Scale;
          //Attributes.ImageData.OffsetY := ((OffsetVert - GetBasicOffsetVert) / GetBasicScale); // Scale;
          //Attributes.ImageData.OffsetX := ((OffsetHorz - GetBasicOffsetHorz) / GetBasicScale); // Scale;
        end;
      end;
    VK_RETURN:
      begin
        if assigned(Attributes) then
        begin
          if Attributes.ImageData.FrameCount > 1 then
          begin
            CineActive := not CineActive;
          end;
        end;
      end;
    VK_SPACE:
      if assigned(Attributes) then
      begin
        {        if Attributes.ImageData.FrameCount > 1 then
                begin
                  CineActive := not CineActive;
                end
                else}
        begin
          if fCanMultiSelect and GetCanLockImage then
          begin
            with Attributes do
            begin
              LockImage := not LockImage;
              MultiSelected4 := LockImage;
              DicomDatasets.LockCount := 1;
              if assigned(fOnDicomImageLock) then
                fOnDicomImageLock(self, FLockImage);
              invalidate;
            end;
          end;
        end;
      end;
    VK_LEFT:
      begin
        dx := 1;
        dy := 0;
      end;
    VK_RIGHT:
      begin
        dx := -1;
        dy := 0;
      end;
    VK_UP:
      begin
        dx := 0;
        dy := 1;
      end;
    VK_DOWN:
      begin
        dx := 0;
        dy := -1;
      end;
  end;
  case Key of
    VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN:
      begin
        if assigned(Attributes) then
        begin
          if (ssCtrl in Shift) then
          begin
            Attributes.ImageData.WindowWidth := Attributes.ImageData.WindowWidth + Dx * 3;
            if DefaultWindowMouseMode then
              Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter + Dy * 3
            else
              Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter - Dy * 3;
          end
          else
            if (ssAlt in Shift) then
          begin
            Attributes.ImageData.WindowWidth := Attributes.ImageData.WindowWidth + Dx;
            if DefaultWindowMouseMode then
              Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter + Dy
            else
              Attributes.ImageData.WindowCenter := Attributes.ImageData.WindowCenter - Dy;
          end
          else
            if (ssShift in Shift) then
          begin

          end;
          UpdateX;
        end;
      end;
  end;
  inherited;
end;

procedure TCustomDicomImage.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
end;

procedure TCustomDicomImage.KeyPress(var Key: Char);
begin
  inherited;
end;

procedure TCustomDicomImage.DblClick;
var
  n1: TDicomDrawObject;
  av, f1, lx, ly, cx: Double;
  da1: TDicomAttribute;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    n1 := Attributes.ImageData.DrawObjects.NewDrawObject;
    if n1 <> nil then
    begin
      fJustDBLCLick := true;
      case n1.Kind of
        ldmiText, ldmiArrow:
          begin

            n1.UserText := InputBox1('Ввод', 'Текст:', n1.UserText);
            //ActiveTextEdit;
          end;
        ldmiRulerCalc:
          begin
            lx := abs(n1.x[0] - n1.x[1]);
            ly := abs(n1.y[0] - n1.y[1]);
            cx := sqrt(lx * lx + ly * ly);
            if cx > 0 then
              with TCalibrateForm.Create(nil) do
              try
                case Attributes.ImageData.RulerUnit of
                  ruCentimeter: DefineRulerUnit.Caption := 'cm';
                  ruMillimeter: DefineRulerUnit.Caption := 'mm';
                end;

                CalObject := n1;
                Edit2.Text := FormatFloat('###,###.00', cx);

                if ShowModal = mrok then
                begin
                  case RadioGroup1.ItemIndex of
                    0:
                      begin
                        case Attributes.ImageData.RulerUnit of
                          ruMillimeter: n1.CalLength := 1;
                          ruCentimeter: n1.CalLength := 0.1;
                        end;
                      end;
                    1:
                      begin
                        case Attributes.ImageData.RulerUnit of
                          ruMillimeter: n1.CalLength := 10;
                          ruCentimeter: n1.CalLength := 1;
                        end;
                      end;
                    2:
                      begin
                        case Attributes.ImageData.RulerUnit of
                          ruMillimeter: n1.CalLength := 20;
                          ruCentimeter: n1.CalLength := 2;
                        end;
                      end;
                    3:
                      begin
                        case Attributes.ImageData.RulerUnit of
                          ruMillimeter: n1.CalLength := 50;
                          ruCentimeter: n1.CalLength := 5;
                        end;
                      end;
                    4:
                      begin
                        case Attributes.ImageData.RulerUnit of
                          ruMillimeter: n1.CalLength := 100;
                          ruCentimeter: n1.CalLength := 10;
                        end;
                      end;
                  else
                    begin
                      f1 := StrToFloat(Edit1.Text);
                      if f1 <> 0 then
                      begin
                        //n1.CalLength := f1;
                        case Attributes.ImageData.RulerUnit of
                          ruMillimeter: n1.CalLength := f1;
                          ruCentimeter: n1.CalLength := f1 / 10;
                        end;
                      end;
                    end;
                  end;
                end;

                av := n1.CalLength / cx;
                DoDrawObjectSize(n1);
                //n1.UserText := Format('%f10.2MM', [n1.CalLength]);
                if av > 0 then
                begin
                  Attributes.ImageData.PixelSpacingX := av;
                  Attributes.ImageData.PixelSpacingY := av;
                  da1 := Attributes.Add($0028, $0030);
                  da1.AsFloat[0] := av;
                  da1.AsFloat[1] := av;
                  Attributes.ImageData.UpdateCood(av, av);
                  Invalidate;
                end;
              finally
                Free;
              end;
          end;
      end;
    end;
  end;
  inherited;
end;

procedure TCustomDicomImage.CancelInteracts;
begin
  RemoveTextEdit;
  //  Update;
end;

procedure TCustomDicomImage.TextEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_ESCAPE:
      begin
        // we must set this to 0 to skip parent handlers that cause GPF when fTextEdit gets freed.
        Key := 0;
        SendMessage((Sender as TMemo).Handle, WM_UNDO, 0, 0);
        CancelInteracts;
      end;
    VK_RETURN:
      begin
        if not (ssCtrl in Shift) then
        begin
          Key := 0;
          CancelInteracts;
        end;
      end;
  end;
end;

procedure TCustomDicomImage.ActiveTextEdit;
var
  N1: TDicomDrawObject;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    n1 := Attributes.ImageData.DrawObjects.NewDrawObject;
    if n1 <> nil then
    begin
      if n1.Kind = ldmiText then
      begin
        if fTextEdit <> nil then
          fTextEdit.free; // ..!!!
        fTextEdit := TMemo.Create(self);
        with fTextEdit do
        begin
          Parent := self;
          AutoSize := false;
          fTextEdit.BorderStyle := bsNone;
          Ctl3D := false;
        end;
        UpdateTextEdit;
        windows.SetFocus(fTextEdit.handle);
        fTextEdit.OnKeyDown := TextEditKeyDown;
        fTextEdit.OnExit := TextEditExit;
        exit;
      end;
    end;
  end;
end;

procedure TCustomDicomImage.RemoveTextEdit;
var
  N1: TDicomDrawObject;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    n1 := Attributes.ImageData.DrawObjects.NewDrawObject;
    if n1 <> nil then
    begin
      if n1.Kind = ldmiText then
      begin
        fTextEdit.OnKeyDown := nil;
        n1.UserText := fTextEdit.Text;
        RemoveControl(fTextEdit); //.free;
        fTextEdit := nil;
        if not (csDestroying in ComponentState) then
          SetFocus;
        //    DoVectorialChanged;
        Invalidate;
        exit;
      end;
    end;
  end;
  if assigned(fTextEdit) then
    RemoveControl(fTextEdit);
end;

procedure TCustomDicomImage.UpdateTextEdit;
var
  //  xx1, yy1, xx2, yy2: integer;
//  R: TRect;
  N1: TDicomDrawObject;
begin
  if (fTextEdit = nil) then
    exit;
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    n1 := Attributes.ImageData.DrawObjects.NewDrawObject;
    if n1 <> nil then
    begin
      if n1.Kind = ldmiText then
      begin
        with fTextEdit do
        begin
          Left := trunc(Min(n1.ScrX[0], n1.ScrX[1]));
          Top := trunc(Min(N1.ScrY[0], n1.ScrY[1]));
          Height := abs(n1.ScrY[0] - n1.ScrY[1]);
          Width := abs(n1.ScrX[0] - n1.ScrX[1]);
          Color := clWhite;
          Lines.Text := N1.UserText;
        end;
        exit;
      end;
    end;
  end;
end;

procedure TCustomDicomImage.TextEditExit(Sender: TObject);
begin
  if assigned(fTextEdit) then
  begin
    //RemoveTextEdit;
  end;
end;

function TCustomDicomImage.XBmp2Scr(x: integer): integer;
begin
  result := trunc(OffsetHorz + (x * Scale));
end;

procedure TCustomDicomImage.Resize;
{var
  Size: TSize;
  x1, y1, x2, y2: Integer;
  f1, f2, f2old, nx, ny: Double;  }
begin
  //  x1 := Buffer.Width;
  //  y1 := Buffer.Height;
  inherited;
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    Attributes.ImageData.ViewModify := true;
    UpdateX;
  end;
  {  x2 := Buffer.Width;
    y2 := Buffer.Height;
    if assigned(Attributes) and assigned(Attributes.ImageData) then
    begin
      if (Attributes.ImageData.OffsetX <> 0) or (Attributes.ImageData.OffsetY <> 0) then
      begin
        //f1 := Min(x2 / Bitmap.Width, y2 / Bitmap.Height);
        //f2old := Min(x1 / Bitmap.Width, y1 / Bitmap.Height);

        //ny := OffsetVert + trunc(Buffer.Height * (f1 - f2old)) div 2;
        //nx := OffsetHorz + trunc(Buffer.Width * (f1 - f2old)) div 2;

        //f2 := Min(x2 / x1, y2 / y1);

       // SetView(OffsetVert + (y2-y1)/2, OffsetHorz + (x2-x1)/2);

     // Attributes.ImageData.OffsetY := OffsetVert / Scale;
     // Attributes.ImageData.OffsetX := OffsetHorz / Scale;
     // Attributes.ImageData.UpdateCood(
     //   Rect(trunc(OffsetHorz), trunc(OffsetVert), 0, 0), Rect(0, 0, 0, 0),
     //   Scale, Attributes.ImageData.PixelSpacingX);

        //Attributes.ImageData.OffsetY := Attributes.ImageData.OffsetY * f2+((y2-x1)/2)/f1;
        //Attributes.ImageData.OffsetX := Attributes.ImageData.OffsetX * f2+((x2-x1)/2)/f1;
      end;
    end
    else }
{  beginUpdate;
  if assigned(Attributes) and assigned(Attributes.ImageData) then
    if (Attributes.ImageData.OffsetX = 0) and (Attributes.ImageData.OffsetY = 0) then
      //      if (Bitmap.Width > 0) and (Bitmap.Height > 0) then
    begin
      Scale := Min(Width / Bitmap.Width, Height / Bitmap.Height);
      Size := GetBitmapSize;
      OffsetVert := (Height - Size.Cy) div 2;
      OffsetHorz := (Width - Size.Cx) div 2;

      Attributes.ImageData.UpdateCood(
        Rect(trunc(OffsetHorz), trunc(OffsetVert), 0, 0), Rect(0, 0, 0, 0),
        Scale, Attributes.ImageData.PixelSpacingX);

    end;
  EndUpdate; }
end;

function TCustomDicomImage.GetBasicScale: Double;
begin
  result := Min(Width / Bitmap.Width, Height / Bitmap.Height);
end;

function TCustomDicomImage.GetBasicOffsetVert: Double;
var
  f1: Double;
begin
  f1 := GetBasicScale; //Min(Width / Bitmap.Width, Height / Bitmap.Height);
  result := (Height - Bitmap.Height * f1) / 2;
end;

function TCustomDicomImage.GetBasicOffsetHorz: Double;
var
  f1: Double;
begin
  f1 := GetBasicScale; //Min(Width / Bitmap.Width, Height / Bitmap.Height);
  result := (Width - Bitmap.Width * f1) / 2;
end;

function TCustomDicomImage.YBmp2Scr(y: integer): integer;
begin
  result := trunc(OffsetVert + (y * Scale));
end;

function TCustomDicomImage.XScr2Bmp(x: integer): integer;
begin
  result := trunc((X - OffsetHorz) / Scale);

end;

function TCustomDicomImage.YScr2Bmp(y: integer): integer;
begin
  result := trunc((Y - OffsetVert) / Scale);

end;

procedure TCustomDicomImage.SetLeftMouseInteract(Value: TMouseInteract);
begin
  fLeftMouseInteract := Value;
end;

procedure TCustomDicomImage.SetRightMouseInteract(Value: TMouseInteract);
begin
  fRightMouseInteract := Value;
end;

procedure TCustomDicomImage.SetAttributesIndex(Index: integer);
begin
  if FAttributesIndex = Index then
    exit;

  if not assigned(FDicomDatasets) then
  begin
    Clear;
    FAttributesIndex := -1;
    fDrawCine.Attributes := nil;
    fMouseDragging := false;
  end
  else
    if (Index >= 0) and (Index < FDicomDatasets.Count) then
  begin
    //    FTimer.Enabled := false;
//    if FDicomDatasets[Index].Attributes.ImageData <> nil then
    begin
      FAttributesIndex := Index;

      if assigned(Attributes.ImageData) then
      begin
        Attributes.ImageData.Modify := true;
        Attributes.ImageData.ViewModify := true;

        LeaderMouserInspect := ldmiNone;

        UpdateX;
        fDrawCine.Attributes := Attributes;
      end
      else //show other date(SR or Wave)
      begin

      end;
      //if assigned(fOnDatasetChanged) then
      //  fOnDatasetChanged(self);
      //                SetAttributes(FDicomDatasets[FAttributesIndex].Attributes)
    end;
    //else
    //      Raise Exception.Create('The file is not a Dicom Image');
    if Attributes.ImageData=nil then
    begin
      ClearCineToolbar;
    end else if Attributes.ImageData.FrameCount > 1 then
    begin
      BuildCineToolbar;
    end
    else
    begin
      ClearCineToolbar;
    end;
  end
  else
  begin
    FTimer.Enabled := false;
    fMouseDragging := false;
    FAttributesIndex := -1;
    Clear;
    FModify := true;
    fDrawCine.Attributes := nil;
    ClearCineToolbar;
  end;

end;

function TCustomDicomImage.GetCanLockImage: Boolean;
begin
  Result := true;
  if assigned(FOnCanLock) then
    FOnCanLock(self, Result);
end;

//fMagnifierView

procedure TCustomDicomImage.UpdateMagnifier(x, y: integer);
var
  xx, yy: Integer;
  //  Magnification, Rotation: Single;
  SrcRect: TRect;
  //  R: TRect;
//  T: TAffineTransformation;
  B: TCnsBitmap32;
  W2, H2: Integer;
  W4, H4: Integer;
  //  I: Integer;
begin
  if fMagnifierView = nil then
    exit;

  xx := trunc((X - OffsetHorz) / Scale); //XScr2Bmp(x);
  yy := trunc((Y - OffsetVert) / Scale); //YScr2Bmp(y);
  fMagnifierView.Width := Min(Width, Height) div fMagnifierView.FViewSize;
  fMagnifierView.Height := Min(Width, Height) div fMagnifierView.FViewSize;

  if (xx > 0) and (yy > 0) and (xx < bitmap.Width) and (yy < bitmap.Height) then
  begin
    Screen.Cursor := crNone;
    B := fMagnifierView.Buffer;
    //B.SetSize(fMagnifierView.Width, fMagnifierView.Height);
    W2 := Trunc(fMagnifierView.Width / (fMagnifierView.FScallSize * Scale));
    H2 := Trunc(fMagnifierView.Height / (fMagnifierView.FScallSize * Scale));

    W4 := W2 div 2;
    H4 := H2 div 2;
    SrcRect.Left := xx - W4;
    SrcRect.Right := xx + W4;
    if SrcRect.Left <= 0 then
    begin
      SrcRect.Left := 0;
      SrcRect.Right := (W2) - 1;
    end;
    if SrcRect.Right >= bitmap.Width then
    begin
      SrcRect.Left := bitmap.Width - trunc(W2) - 1;
      SrcRect.Right := bitmap.Width - 1;
    end;
    SrcRect.Top := yy - H4;
    SrcRect.Bottom := yy + H4;
    if SrcRect.Top <= 0 then
    begin
      SrcRect.Top := 0;
      SrcRect.Bottom := (H2) - 1;
    end;
    if SrcRect.Bottom >= bitmap.Height then
    begin
      SrcRect.Top := bitmap.Height - (H2) - 1;
      SrcRect.Bottom := bitmap.Height - 1;
    end;

    {$IFDEF USE_BITMAP32_VIEWER}
    B.Draw(Rect(0, 0, fMagnifierView.Width, fMagnifierView.Height), SrcRect, Bitmap);
    {$ELSE}
    //Bitmap.Clear;
    {$ENDIF}

    //    if (X + W2) < Width then
    fMagnifierView.left := ClientOrigin.X + X - (fMagnifierView.Width div 2);
    //    else
    //      fMagnifierView.left := ClientOrigin.X + width - fMagnifierView.Width;

    //    if (Y + H2) < Height then
    fMagnifierView.top := ClientOrigin.Y + Y - (fMagnifierView.Height div 2);
    //    else
    //      fMagnifierView.top := ClientOrigin.Y + height - fMagnifierView.Height;
    B.Font.Color := clRed32;
    B.Textout(0, 0, Format('%f%%', [(2 * Scale * 100)]));
    fMagnifierView.Show;
    fMagnifierView.Paint;
  end
  else
  begin
    //Cursor := crDefault;
    fMagnifierView.Hide;
  end;
end;

procedure TCustomDicomImage.UpdateHint(x, y: integer);
var
  xx, yy: Integer;
begin
  xx := XScr2Bmp(x);
  yy := YScr2Bmp(y);
  if (xx > 0) and (yy > 0) and (xx < bitmap.Width) and (yy < bitmap.Height) then
  begin
    if assigned(Attributes) then
      fWHint.text := '(' + IntToStr(xx) + ',' + IntToStr(yy) + ') = ' +
        Attributes.ImageData.GetPointValue(xx - 1, yy - 1) + ' H'
    else
      fWHint.text := 'NOT SUPORT';
    if (X + fWHint.Width) < Width then
      fWHint.left := ClientOrigin.X + X + 8
    else
      fWHint.left := ClientOrigin.X + X - fWHint.Width;
    if (Y + fWHint.Height) < Width then
      fWHint.top := ClientOrigin.Y + Y + 16
    else
      fWHint.top := ClientOrigin.Y + Y - fWHint.Height;
    fWHint.Show;
    fWHint.Paint;
  end;
end;

procedure TCustomDicomImage.UpdateHintEx(x, y: integer; AText: string);
var
  xx, yy: Integer;
begin
  xx := XScr2Bmp(x);
  yy := YScr2Bmp(y);
  if (xx > 0) and (yy > 0) and (xx < bitmap.Width) and (yy < bitmap.Height) then
  begin
    fWHint.text := AText;
    if (X + fWHint.Width) < Width then
      fWHint.left := ClientOrigin.X + X
    else
      fWHint.left := ClientOrigin.X + X - fWHint.Width;
    if (Y + fWHint.Height) < Width then
      fWHint.top := ClientOrigin.Y + Y
    else
      fWHint.top := ClientOrigin.Y + Y - fWHint.Height;
    fWHint.Show;
    fWHint.Paint;
  end;
end;
{
procedure TCustomDicomImage.BuildPopupMenu;
var
  N1: TMenuItem;
begin
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Invert';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 3;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Hos Flip';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 4;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Ver Flip';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 5;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Rotate CCW';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 6;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Rotate CC';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 7;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Reset';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 8;
  FMyPopupMenu.Items.Add(N1);

  N1 := TMenuItem.Create(Self);
  N1.Caption := '-';
  FMyPopupMenu.Items.Add(N1);

  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Pan';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 9;
  FMyPopupMenu.Items.Add(N1);

  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Zoom';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 18;
  FMyPopupMenu.Items.Add(N1);

  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Select Zoom';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 10;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Auto ROI';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 11;
  FMyPopupMenu.Items.Add(N1);

  N1 := TMenuItem.Create(Self);
  N1.Caption := '-';
  FMyPopupMenu.Items.Add(N1);

  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Length Tool';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 12;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Angle Tool';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 13;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Area Tool';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 14;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Mark text';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 15;
  FMyPopupMenu.Items.Add(N1);
  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Grid';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 16;
  FMyPopupMenu.Items.Add(N1);

  N1 := TMenuItem.Create(Self);
  N1.Caption := '-';
  FMyPopupMenu.Items.Add(N1);

  N1 := TMenuItem.Create(Self);
  N1.Caption := 'Select Rect';
  N1.OnClick := MyPopupMenuClick;
  N1.Tag := 17;
  FMyPopupMenu.Items.Add(N1);

end;  }

procedure TCustomDicomImage.MyPopupMenu1Popup(Sender: TObject);
begin
  if assigned(fOnCustomPopupMenuPopup) then
    fOnCustomPopupMenuPopup(FMyPopupMenu);
end;

procedure TCustomDicomImage.MyDrawObjectPopupMenu1Popup(Sender: TObject);
begin
  if assigned(fOnCustomDrawObjectPopupMenuPopup) then
    fOnCustomDrawObjectPopupMenuPopup(FDrawObjectPopupMenu);
end;

procedure TCustomDicomImage.MyPopupMenuClick(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    3:
      begin //ёєЖ¬
        Negative;
      end;
    4:
      begin //Л®ЖЅѕµПу
        Attributes.ImageData.HozFlip := not Attributes.ImageData.HozFlip;
        UpdateX;
      end;
    5:
      begin //ґ№Ц±ѕµПу
        Attributes.ImageData.VerFlip := not Attributes.ImageData.VerFlip;
        UpdateX;

      end;
    6:
      begin //ЛіК±ХлРэЧЄ
        Attributes.ImageData.Rotate := (Attributes.ImageData.Rotate + 1) mod 4;
        UpdateX;
      end;
    7:
      begin //ДжК±ХлРэЧЄ
        Attributes.ImageData.Rotate := (Attributes.ImageData.Rotate - 1 + 4) mod 4;
        UpdateX;
      end;
    8:
      begin //ёґФ­
        ResetImage;
      end;
    9:
      begin //№ц¶Ї
        fLeftMouseInteract := miScroll;
      end;
    10:
      begin //СЎФс·Еґу
        fLeftMouseInteract := miSelectZoom;
      end;
    11:
      begin //ЧФ¶ЇROIµчЅЪ
        fLeftMouseInteract := miSelectROI;
      end;
    16:
      begin
        FDrawGridAxiel := not FDrawGridAxiel;
        invalidate;
      end;

    18:
      begin //·Еґуѕµ
        fLeftMouseInteract := miMagnifier;
      end;
  else
    //    if assigned(fOnCustomPopupMenuClick) then
    //      fOnCustomPopupMenuClick(Sender);
  end;
end;

procedure TCustomDicomImage.SetPresentationSate(ADataset: TDicomDataset);
begin
  if not assigned(Attributes) then
    raise Exception.Create('No Image display now');
  Attributes.ImageData.SetPresentationSate(ADataset);

  UpdateX;

  if CineToolbar = nil then
  begin
    fCineScrollBar.Width := CineToolbar.Width;
  end;
end;

function TCustomDicomImage.CreatePresentationState: TDicomDataset;
begin
  if not assigned(Attributes) then
    raise Exception.Create('No Image display now');
  Result := Attributes.ImageData.CreatePresentationState;
end;

procedure TCustomDicomImage.ResetImage;
var
  Size: TSize;
  da1: TDicomAttribute;
  das1: TDicomAttributes;
begin
  if assigned(Attributes) then
  begin
    fImageAngle := 0;
    Attributes.ImageData.ImageAngle := 0;
    Attributes.ImageData.UseImageBuffer := false;
    Attributes.ImageData.Negative := false;
    Attributes.ImageData.Rotate := 0;
    Attributes.ImageData.VerFlip := false;
    Attributes.ImageData.HozFlip := False;
    SetLut(nil);
    Attributes.ImageData.WindowCenter := Attributes.ImageData.Attributes.getInteger($28, $1050);
    Attributes.ImageData.WindowWidth := Attributes.ImageData.Attributes.getInteger($28, $1051);

    da1 := Attributes.Item[$0028, $0030]; //ByContant[dPixelSpacing];
    if assigned(da1) then
    begin
      Attributes.ImageData.PixelSpacingX := da1.AsFloat[0] / 10;
      Attributes.ImageData.PixelSpacingY := da1.AsFloat[1] / 10;
    end
    else
    begin
      da1 := Attributes.Item[$18, $1164];
      if assigned(da1) then
      begin
        Attributes.ImageData.PixelSpacingX := da1.AsFloat[0] / 10;
        Attributes.ImageData.PixelSpacingY := da1.AsFloat[1] / 10;
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
            if assigned(da1) and (da1.GetCount > 0) then
            begin
              Attributes.ImageData.PixelSpacingX := da1.AsFloat[0] / 10;
              Attributes.ImageData.PixelSpacingY := da1.AsFloat[1] / 10;
            end;
          end
        end
        else
        begin
          Attributes.ImageData.PixelSpacingX := 0;
          Attributes.ImageData.PixelSpacingY := 0;
        end;
      end;
    end;

    beginUpdate;
    Scale := Min(Width / Bitmap.Width, Height / Bitmap.Height);
    Size := GetBitmapSize;
    OffsetVert := (Height - Size.Cy) div 2;
    OffsetHorz := (Width - Size.Cx) div 2;
    UpdateX;
    EndUpdate;
  end;
  //  Invalidate;
end;

procedure TCustomDicomImage.SetCurrentFrame(AValue: Integer);
begin
  if assigned(Attributes) and (AValue < Attributes.ImageData.FrameCount)
    and (AValue <> Attributes.ImageData.CurrentFrame) then
  begin
    Attributes.ImageData.CurrentFrame := AValue;
    UpdateX;
  end;
end;

procedure TCustomDicomImage.SetDSAMode(AValue: Boolean);
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) and (Attributes.ImageData.FrameCount > 1) and (AValue <> Attributes.ImageData.DSAMode) then
  begin
    Attributes.ImageData.DSAMode := AValue;
    UpdateX;
  end;
end;

function TCustomDicomImage.getDSAMode: Boolean;
begin
  if assigned(Attributes) then
    Result := Attributes.ImageData.DSAMode
  else
    Result := false;
end;

function TCustomDicomImage.getCurrentFrame: Integer;
begin
  if assigned(Attributes) then
    Result := Attributes.ImageData.CurrentFrame
  else
    Result := 0;
end;

function TCustomDicomImage.GetFrameCount: Integer;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
    Result := Attributes.ImageData.FrameCount
  else
    Result := 0;
end;

procedure TCustomDicomImage.SetWinLevel(AWin, ALevel: Integer);
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    Attributes.ImageData.WindowWidth := AWin;
    Attributes.ImageData.WindowCenter := ALevel;
    UpdateX;
  end;
end;

procedure TCustomDicomImage.Negative;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    Attributes.ImageData.Negative := not Attributes.ImageData.Negative;
    UpdateX;
  end;
end;

procedure TCustomDicomImage.SetDisplayLabel(AValue: Boolean);
begin
  fDisplayLabel := AValue;

  if assigned(Attributes) then
  begin
    Changed;
    //    Update;
  end;
end;

procedure TCustomDicomImage.SetDisplayReport(AValue: Boolean);
begin
  fDisplayReport := AValue;
  if assigned(Attributes) then
  begin
    Changed;
  end;
end;

procedure TCustomDicomImage.SetLut(AStream: TStream);
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    Attributes.ImageData.LoadLutFromStream(AStream);
    UpdateX;
  end;
end;

procedure TCustomDicomImage.DoPlayCine(Sender: TObject);
begin
  if not assigned(Attributes) then
    exit;
  if not FCineLoop2 then
  begin
    if Attributes.ImageData.FrameCount > 1 then
    begin
      Attributes.ImageData.FrameIndex := Attributes.ImageData.FrameIndex + 1;
      if Attributes.ImageData.FrameIndex >= GetFrameCount - 1 then
      begin
        Attributes.ImageData.FrameIndex := 0;
      end;
      //UpdateX;
    end
    else
    begin
      if AttributesIndex >= (DicomDatasets.Count - 1) then
      begin
        AttributesIndex := DicomDatasets.GetSeriesStart(fCineSeriesUID);
      end
      else
      begin
        if fCineSeriesUID <> DicomDatasets[AttributesIndex + 1].Attributes.GetString($20, $E) then
        begin
          AttributesIndex := DicomDatasets.GetSeriesStart(fCineSeriesUID);
        end
        else
          AttributesIndex := AttributesIndex + 1;
      end;
      if assigned(fOnDatasetChanged) then
        fOnDatasetChanged(self);
    end;
  end
  else
  begin
    if Attributes.ImageData.FrameCount > 1 then
    begin
      Attributes.ImageData.FrameIndex := Attributes.ImageData.FrameIndex - 1;
      if Attributes.ImageData.FrameIndex < 0 then
      begin
        Attributes.ImageData.FrameIndex := GetFrameCount - 1;
      end;
      //UpdateX;
    end
    else
    begin
      if AttributesIndex <= 0 then
      begin
        AttributesIndex := DicomDatasets.GetSeriesEnd(fCineSeriesUID);
      end
      else
      begin
        if fCineSeriesUID <> DicomDatasets[AttributesIndex - 1].Attributes.GetString($20, $E) then
        begin
          AttributesIndex := DicomDatasets.GetSeriesEnd(fCineSeriesUID);
        end
        else
          AttributesIndex := AttributesIndex - 1;
      end;
    end;
  end;
  if GetFrameCount <= 1 then
    exit;
  if assigned(FOnImageCineTo) then
    FOnImageCineTo(self, Attributes.ImageData.FrameIndex);
  // SetCurrentFrame(Attributes.ImageData.FrameIndex);

  if fCineScrollBar <> nil then
    fCineScrollBar.Position := Attributes.ImageData.CurrentFrame;

  fDrawCine.CurrentFrame := Attributes.ImageData.FrameIndex;
end;

procedure TCustomDicomImage.SetCineDirection(AValue: Boolean);
begin
  FCineLoop2 := AValue;
end;

function TCustomDicomImage.GetCineSpeed: Integer;
begin
  Result := FCineSpeed;
end;

function TCustomDicomImage.GetCineDirection: Boolean;
begin
  Result := FCineLoop2;
end;

procedure TCustomDicomImage.SetCineSpeed(AValue: Integer);
const
  CineInterval: array[0..9] of integer = (
    //    100, 100, 100, 100, 100, 200, 500, 1000);
    33, 40, 44, 50, 66, 100, 200, 500, 1000, 2000);
begin
  FCineSpeed := AValue;
  FTimer.Interval := CineInterval[AValue];
end;

procedure TCustomDicomImage.DoDirectDrawCine(Sender: TObject; AIndex: Integer);
begin    
  fDrawCine.PaintTo(Canvas, Width, Height);
end;

procedure TCustomDicomImage.DoFinishNewDrawObject(Sender: TObject);
begin
  if assigned(fAfterNewDrawObject) then
    fAfterNewDrawObject(self, TDicomDrawObject(Sender));
end;

procedure TCustomDicomImage.DoDrawObjectSize(Sender: TObject);
begin
  if assigned(fAfterObjectSize) then
    fAfterObjectSize(self, TDicomDrawObject(Sender));
end;

procedure TCustomDicomImage.DoDrawObjectMove(Sender: TObject);
begin
  if assigned(fAfterObjectMove) then
    fAfterObjectMove(self, TDicomDrawObject(Sender));
end;

function TCustomDicomImage.GetCine: Boolean;
begin
  Result := FTimer.Enabled;
end;

procedure TCustomDicomImage.DragOver(Source: TObject; X, Y: Integer; State: Controls.TDragState;
  var Accept: Boolean);
var
  n1: TCustomDicomImage;
begin
  if (fDragFrom = dfsFromImageList) then
  begin
    Accept := Source is TDCMMultiImage;

  end
  else
    if (fDragDropMode = ddmForPrint) then
  begin
    Accept := (Source is TDCMMultiImage) or
      (Source is TCustomDicomImage); //and (TCustomDicomImage(Source).Parent <> self.Parent));

  end
  else
    if fLeftMouseInteract <> miDragdown then
  begin

    if (Source is TCustomDicomImage) and (self.Attributes <> nil) then
    begin
      n1 := TCustomDicomImage(Source);
      if (n1.Attributes <> nil) then
      begin
        if (fDragFrom = dfsFromSameSeries) then
          Accept := n1.Parent = self.Parent
        else
          if fDragFrom <> dfsNone then
          Accept := true;
      end
      else
        Accept := false;
    end
    else
      Accept := false;
  end
  else
    inherited;
end;

{procedure TCustomDicomImage.SaveLayerToAttributes;
var
  da1, da2, da3: TDicomAttribute;
  das: TDicomAttributes;
  i, k: integer;
  Obj1: TCnsPositionedLayer;
begin
  if not assigned(Attributes) then
    exit;
  da1 := Attributes.Item[$2815, 1];
  if assigned(da1) then
  begin
    Attributes.Remove($2815, 1);
  end;
  da1 := Attributes.Add($2815, 1);
  //  if da1.GetCount <> Layers.Count then
  begin
    da1.ClearDataArray;
    for i := 0 to Layers.Count - 1 do
    begin
      Obj1 := TCnsPositionedLayer(Layers.items[i]);
      das := TDicomAttributes.Create;
      da1.AddData(das);
      //        das.Add($2815, $4).AsInteger[0] := Obj1.PolyCount;
      da2 := das.Add($2815, $2);
      da2.AsInteger[0] := trunc(obj1.Location.Left);
      da2.AsInteger[1] := trunc(obj1.Location.Right);

      da2 := das.Add($2815, $3);
      da2.AsInteger[0] := trunc(obj1.Location.Top);
      da2.AsInteger[1] := trunc(obj1.Location.Bottom);
      //        da3 := das.Add($2815, $3);
      //          da3.AsInteger[1] := Obj1.y[k + 1];
      if obj1 is TVRBoxlayer then
      begin
        das.AddVariant($2815, $A, 8);
      end
      else
        if obj1 is TTextlayer then
      begin
        das.AddVariant($2815, $A, 2);
        das.AddVariant($2815, $9, TTextlayer(Obj1).Text);
      end
      else
        if obj1 is TArrowlayer then
      begin
        das.AddVariant($2815, $A, 10);
        das.AddVariant($2815, $9, TArrowlayer(Obj1).Text);
      end
      else
        if obj1 is TROILayer then
        das.AddVariant($2815, $A, 3)
      else
        if obj1 is TRulerLayer then
        das.AddVariant($2815, $A, 9)
      else
        if obj1 is TCnsBitmapLayer then
        das.AddVariant($2815, $A, 5)
      else
        if obj1 is TAngleLayer then
      begin
        das.AddVariant($2815, $A, 6);
        da3 := das.Add($2815, $3);
        da3.AsInteger[2] := trunc(TAngleLayer(Obj1).AnglePoint.X);
        da3.AsInteger[3] := trunc(TAngleLayer(Obj1).AnglePoint.Y);
      end
      else
        if obj1 is TPolyLayer then
      begin
        das.AddVariant($2815, $A, 7);
        for k := 0 to High(TPolyLayer(obj1).Polygon) do
        begin
          da3 := das.Add($2815, $3);
          da3.AsInteger[k * 2 + 0] := trunc(TPolyLayer(Obj1).Polygon[k].X);
          da3.AsInteger[K * 2 + 1] := trunc(TPolyLayer(Obj1).Polygon[k].Y);
        end;
        das.AddVariant($2815, $9, TPolyLayer(obj1).Text);
      end
      else
        if obj1 is TBOXLayer then
        das.AddVariant($2815, $A, 1)
    end;
  end;
  //  Layers.Clear;
end; }

procedure TCustomDicomImage.Next;
{var
  f1, f2, t1: Single;
  w1, l1: Integer;
  b1, b2, xb: Boolean;
  h1, r, ww1: Integer;
  ld1: TLeaderMouserInspect;}
begin
  if assigned(FDicomDatasets) and (AttributesIndex < FDicomDatasets.Count - 1) then
  begin
    AttributesIndex := AttributesIndex + 1;
    {    xb := Attributes.IsImageChange;

        t1 := Scale;
        w1 := Attributes.ImageData.WindowWidth;
        l1 := Attributes.ImageData.WindowCenter;
        f1 := OffsetHorz;
        f2 := OffsetVert;
        b1 := Attributes.ImageData.VerFlip;
        b2 := Attributes.ImageData.HozFlip;
        r := Attributes.ImageData.Rotate;
        h1 := Attributes.ImageData.Height;
        ww1 := Attributes.ImageData.Width;
        ld1 := Attributes.ImageData.DrawObjects.LeaderMouserInspect;
        Attributes.MultiSelected4 := false;

        inc(FAttributesIndex);
        refresh;
        //    SetAttributes(FDicomDatasets[FAttributesIndex].Attributes);

        Scale := t1 * max(h1 / Attributes.ImageData.Height, ww1 / Attributes.ImageData.Width);

        if not xb then
        begin
          Attributes.ImageData.WindowWidth := w1;
          Attributes.ImageData.WindowCenter := l1;
        end;
        if (h1 = Attributes.ImageData.Height) and (ww1 = Attributes.ImageData.Width) then
        begin
          OffsetHorz := f1;
          OffsetVert := f2;
        end;
        Attributes.ImageData.VerFlip := b1;
        Attributes.ImageData.HozFlip := b2;
        Attributes.ImageData.Rotate := r;
        Attributes.MultiSelected4 := fLockImage;
        LeaderMouserInspect := ld1;
        UpdateX; }
    if assigned(fOnDatasetChanged) then
      fOnDatasetChanged(self);

  end;
end;

procedure TCustomDicomImage.Prior;
{var
  f1, f2, t1: Single;
  w1, l1: Integer;
  b1, b2, xb: Boolean;
  r, h1, ww1: Integer;
  ld1: TLeaderMouserInspect;}
begin
  if assigned(FDicomDatasets) and (AttributesIndex > 0) then
  begin
    AttributesIndex := AttributesIndex - 1;
    {    xb := Attributes.IsImageChange;

        t1 := Scale;
        h1 := Attributes.ImageData.Height;
        ww1 := Attributes.ImageData.Width;
        w1 := Attributes.ImageData.WindowWidth;
        l1 := Attributes.ImageData.WindowCenter;
        f1 := OffsetHorz;
        f2 := OffsetVert;
        b1 := Attributes.ImageData.VerFlip;
        b2 := Attributes.ImageData.HozFlip;
        r := Attributes.ImageData.Rotate;
        ld1 := Attributes.ImageData.DrawObjects.LeaderMouserInspect;
        Attributes.MultiSelected4 := false;

        dec(FAttributesIndex);
        refresh;

        //    SetAttributes(FDicomDatasets[FAttributesIndex].Attributes);

            //    Scale := t1 * (h1 / Attributes.ImageData.Height);
        Scale := t1 * max(h1 / Attributes.ImageData.Height, ww1 / Attributes.ImageData.Width);
        //    Scale := t1;
        if not xb then
        begin
          Attributes.ImageData.WindowWidth := w1;
          Attributes.ImageData.WindowCenter := l1;
        end;
        if (h1 = Attributes.ImageData.Height) and (ww1 = Attributes.ImageData.Width) then
        begin
          OffsetHorz := f1;
          OffsetVert := f2;
        end;
        Attributes.ImageData.VerFlip := b1;
        Attributes.ImageData.HozFlip := b2;
        Attributes.ImageData.Rotate := r;
        Attributes.MultiSelected4 := fLockImage;
        LeaderMouserInspect := ld1;
        UpdateX;

        if assigned(OnDatasetChanged) then
          OnDatasetChanged(self); }
    if assigned(fOnDatasetChanged) then
      fOnDatasetChanged(self);
  end;
end;
{
procedure TCustomDicomImage.LoadLayerFromAttributes;
var
  da1, da2, da3: TDicomAttribute;
  das: TDicomAttributes;
  i, k: integer;
  Obj1: TCnsPositionedLayer;
begin

  Layers.Clear;
  FSelection := nil;
  Layers.TextLayerCount := 0;

  if not assigned(Attributes) then
    exit;
  da1 := Attributes.Item[$2815, 1];
  if assigned(da1) then
  begin
    for i := 0 to da1.GetCount - 1 do
    begin
      das := da1.Attributes[i];
      if not assigned(das) then
        continue;
      case das.getInteger($2815, $A) of
        10:
          begin
            Obj1 := TTextlayer.Create(Layers);
            obj1.Tag := ORD(liPutText);
            TTextlayer(Obj1).Text := das.getString($2815, $9);
          end;
        8:
          begin
            Obj1 := TVRBoxlayer.Create(Layers);
            obj1.Tag := ORD(liVRPutBox);
          end;
        2:
          begin
            Obj1 := TArrowlayer.Create(Layers);
            obj1.Tag := ORD(liPutArrow);
            TArrowlayer(Obj1).Text := das.getString($2815, $9);
          end;
        3:
          begin
            Obj1 := TROILayer.Create(Layers);
            obj1.Tag := ORD(liPutEllipse);
            TROILayer(obj1).OnCalROI := DoROILayerCal;
          end;
        9:
          begin
            Obj1 := TRulerLayer.Create(Layers);
            obj1.Tag := ORD(liPutRuler);
            TRulerLayer(obj1).RescaleSlopeX := Attributes.ImageData.PixelSpacingX;
            TRulerLayer(obj1).RescaleSlopeY := Attributes.ImageData.PixelSpacingY;
          end;
        5:
          begin
            Obj1 := TCnsBitmapLayer.Create(Layers);
            obj1.Tag := ORD(liPutBitmap);
          end;
        6:
          begin
            Obj1 := TAngleLayer.Create(Layers);
            obj1.Tag := ORD(liPutAngle);
            da2 := das.Item[$2815, $3];
            TAngleLayer(obj1).AnglePoint := FloatPoint(da2.AsInteger[0], da2.AsInteger[1]);
            //            TAngleLayer(obj1).RescaleSlopeX := Attributes.ImageData.PixelSpacingX;
            //            TAngleLayer(obj1).RescaleSlopeY := Attributes.ImageData.PixelSpacingY;
          end;
        7:
          begin
            Obj1 := TPolyLayer.Create(Layers);
            obj1.Tag := ORD(liPutPolygon);
            da2 := das.Item[$2815, $3];
            TPolyLayer(obj1).SetPolygonLength(da2.GetCount div 2);
            for k := 0 to da2.GetCount div 2 - 1 do
            begin
              TPolyLayer(obj1).Polygon[k].X := da2.AsInteger[k * 2 + 0];
              TPolyLayer(obj1).Polygon[k].Y := da2.AsInteger[k * 2 + 1];
            end;
          end;
        1:
          begin
            Obj1 := TBOXLayer.Create(Layers);
            obj1.Tag := ORD(liPutEllipse);
            TBOXLayer(obj1).OnCalROI := DoROILayerCal;
          end;
      else
        continue;
      end;
      Obj1.Scaled := True;
      Obj1.MouseEvents := True;
      Obj1.OnMouseDown := LayerMouseDown;
      Obj1.OnMouseUp := LayerMouseUp;
      Obj1.TextIndex := i + 1;

      //  Obj1.Tag := Ord(ATag);
            //              Obj1.PolyCount := das.getInteger($2815, $4);
      da2 := das.Item[$2815, $2];
      da3 := das.Item[$2815, $3];
      if assigned(da2) and assigned(da3) then
        obj1.Location := FloatRect(da2.AsInteger[0], da3.AsInteger[0], da2.AsInteger[1], da3.AsInteger[1])
          //              da3 := das.Item[$2815, $3];

//              Obj1.Text := das.GetString($2815, $9);
    end;
  end;
end;
}

procedure TCustomDicomImage.DragDrop(Source: TObject; X, Y: Integer);
var
  i, k, k1: integer;
  src1: TDCMMultiImage;
  v1: TDicomMultiViewer;
  das1: TDicomDataset;
  n1: TCustomDicomImage;
  f1: Single;

  da2: TDicomAttribute;
  k2: Integer;
begin
  if Source is TDCMMultiImage then
  begin
    if self.FDragDropMode = ddmFreeView then
    begin
      if Parent is TDicomMultiViewer then
      begin
        if assigned(Attributes) then
        begin
          f1 := Attributes.ImageData.ViewerZoom;
          //f2 := Attributes.ImageData.OffsetX;
          //f3 := Attributes.ImageData.OffsetY;
        end;

        src1 := TDCMMultiImage(Source);
        v1 := TDicomMultiViewer(Parent);
        v1.DicomDatasets := src1.DicomDatasets;
        if src1.ViewGridMode = vgmStandardgrid then
          i := src1.CurrentSelectedIndex + src1.CurrentImage
        else
          if src1.ViewGridMode = vgmSeriesGrid then
        begin

          das1 := src1.DicomDatasets.SeriesDataset[src1.CurrentSelectedIndex + src1.CurrentImage];
          if assigned(das1) then
          begin
            i := src1.DicomDatasets.IndexOf(das1);
            v1.SeriesUID := das1.Attributes.GetString($20, $E);

          end
          else
            exit;
        end
        else
          exit;
        if i < src1.DicomDatasets.Count then
        begin
          das1 := src1.DicomDatasets[i];
          v1.SeriesUID := das1.Attributes.GetString($20, $E);

          if assigned(Attributes) then
          begin
            for k1 := 0 to v1.DicomDatasets.Count - 1 do
            begin
              if v1.DicomDatasets.Item[k1].Attributes.GetString($20, $E) = v1.SeriesUID then
              begin
                with v1.DicomDatasets.Item[k1].Attributes.ImageData do
                begin
                  ViewerZoom := f1;
                  //OffsetX := f2;
                  //OffsetY := f3;
                end;
              end;
            end;

            da2 := v1.Items[0].Attributes.Item[$0020, $1041];
            if assigned(da2) and (da2.GetCount > 0) then
            begin
              f1 := da2.AsFloat[0];
              k2 := DicomDatasets.FindSliceLocationOnSeries(v1.SeriesUID, v1.Items[0].DicomDatasets[v1.Items[0].AttributesIndex]);
              if k2 > 0 then
              begin
                v1.CurrentImage := k2;
              end
              else
                v1.CurrentImage := i;
            end
            else
              v1.CurrentImage := i; //todo
          end
          else
            v1.CurrentImage := i;
        end;

        v1.LeaderMouserInspect := ldmiNone;
        //v1.RightMouseInteract := (miWindow);
        if v1.fFullSeriesView = nil then
          v1.Update
        else
          v1.fFullSeriesView.UpdateX;
      end
      else
      begin
        src1 := TDCMMultiImage(Source);
        i := src1.CurrentSelectedIndex + src1.CurrentImage;
        if i < src1.DicomDatasets.Count then
        begin
          self.DicomDatasets := src1.DicomDatasets;
          self.AttributesIndex := i;
          if assigned(fOnDatasetChanged) then
            fOnDatasetChanged(self);
          //    Changed;
        end;
        //  inherited;
      end;
    end
    else
      if self.FDragDropMode = ddmForPrint then
    begin
      if Parent is TDicomMultiViewer then
      begin
        src1 := TDCMMultiImage(Source);
        if src1.ViewGridMode = vgmStandardgrid then
          i := src1.CurrentSelectedIndex + src1.CurrentImage
        else
          if src1.ViewGridMode = vgmSeriesGrid then
        begin
          das1 := src1.FDicomDatasets.SeriesDataset[src1.CurrentSelectedIndex + src1.CurrentImage];
          if assigned(das1) then
          begin
            i := src1.FDicomDatasets.IndexOf(das1);
            //v1.SeriesUID := das1.Attributes.GetString($20, $E);
          end
          else
            exit;
        end
        else
          exit;
        if i < src1.DicomDatasets.Count then
        begin
          //das1 := src1.FDicomDatasets[i];
          //v1.SeriesUID := das1.Attributes.GetString($20, $E);
          //v1.CurrentImage := i;

          if assigned(OnDragDropToPrint) then
            OnDragDropToPrint(self, Source, src1.FDicomDatasets, i);
        end;
      end
      else
      begin
        src1 := TDCMMultiImage(Source);
        i := src1.CurrentSelectedIndex + src1.CurrentImage;
        if i < src1.DicomDatasets.Count then
        begin
          //self.DicomDatasets := src1.DicomDatasets;
          //self.AttributesIndex := i;
          //if assigned(fOnDatasetChanged) then
          //  fOnDatasetChanged(self);

          if assigned(OnDragDropToPrint) then
            OnDragDropToPrint(self, Source, src1.FDicomDatasets, i);
          //    Changed;
        end;
        //  inherited;
      end;
    end;
  end
  else
    if Source is TCustomDicomImage then
  begin
    if self.FDragDropMode = ddmForPrint then
    begin
      n1 := TCustomDicomImage(Source);
      if (n1.Attributes <> nil) then
      begin
        if assigned(OnDragDropToPrint) then
          OnDragDropToPrint(self, Source, n1.DicomDatasets, n1.AttributesIndex);
      end;
    end
    else
    begin
      n1 := TCustomDicomImage(Source);
      if (n1.Attributes <> nil) and (self.Attributes <> nil) and (n1.Parent = self.Parent) and (Parent is TDicomMultiViewer) then
      begin
        v1 := TDicomMultiViewer(Parent);
        das1 := v1.DicomDatasets.Item[n1.AttributesIndex];
        v1.DicomDatasets.Remove(das1);

        v1.DicomDatasets.InsertDicomDataset(self.AttributesIndex, das1);

        for i := 0 to v1.getCount - 1 do
        begin
          k := v1.Items[i].AttributesIndex;
          v1.Items[i].AttributesIndex := -1;
          v1.Items[i].AttributesIndex := k;
        end;
        //v1.UpdateView;
      end;
    end;
  end;
  inherited;
end;

procedure TCustomDicomImage.SetCine(Value: Boolean);
begin
  if FTimer.Enabled <> Value then
  begin
    if Value then
    begin
      if not assigned(Attributes.ImageData) then
        exit;
      //      if GetFrameCount <= 1 then
      //        exit;
      Attributes.ImageData.CanNotCacheData := true;
      fCineSeriesUID := Attributes.GetString($20, $E);
      FTimer.Enabled := true;
    end
    else
    begin
      FTimer.Enabled := false;
      fCineSeriesUID := '';
      Attributes.ImageData.CanNotCacheData := false;
      self.UpdateX;
    end;
  end;
end;
{$IFDEF USE_BITMAP32_VIEWER}

procedure TCustomDicomImage.ExecCustom(Dest: TCnsBitmap32; StageNum: Integer);
  function IsInPrintIconRect: Boolean;
  begin
    Result := FDrawPrintNoSelectIcon;
    //(x < (Width - 2)) and (x >= (Width - 32)) and (y <= 32) and (y >= 2);

  end;
  procedure DrawAxiel;
  var
    w, h, i: integer;
  begin
    w := Dest.Width div 8;
    h := Dest.Height div 8;
    for i := 1 to 7 do
    begin
      Dest.LineS(0, h * i, Dest.Width, h * i, clBlue32);
      Dest.LineS(w * i, 0, w * i, Dest.Height, clBlue32);
    end;
  end;
var
  AUserWrite: Boolean;
  k, w1, h1: Integer;
  str1 : string;
  // waveform
  i,v_width, x2,y2,i4, v_height, i1, i2,
  v_x_top, v_y_top, v_n_chnl, p5,
  v_xx, v_yy, v_y_c, v_n_bg, ik, v_i,
  v_y1,v_y2, v_tmp1, v_tmp2, v_amm : Integer;
  v_dt : array of Integer;
  v_dt_max, v_dt_min : array of Integer;
  v_dt_sr : array of Extended;
begin
  inherited;

  if CineActive then
  begin
    fInMovingMouseProcess := false;
    exit;
  end;
  {$IFDEF DICOMDEBUG}
  //SendDebug('label-');
  {$ENDIF}
  AUserWrite := false;
  if assigned(OnCustomOverlayLabel) then
    OnCustomOverlayLabel(self, Dest, AUserWrite);

  if (not AUserWrite) then
  begin
    if (fDragDropMode = ddmForPrint) and assigned(Attributes) then
    begin
      Dest.Font.Color := clBlack;
      Dest.Font.Size := -12;
      Dest.TextOut(3, 3, Attributes.GetString($10, $10));
      Dest.Font.Color := clWhite;
      Dest.Font.Size := -12;
      Dest.TextOut(4, 4, Attributes.GetString($10, $10));

    end;
  end;

  if (FPositionCursorPosition.X <> 0) or (FPositionCursorPosition.Y <> 0) then
  begin
    k := 40;
    Dest.LineS(FPositionCursorPosition.X, FPositionCursorPosition.Y - k,
      FPositionCursorPosition.X, FPositionCursorPosition.Y + k, FPositionCursorColor);
    Dest.LineS(FPositionCursorPosition.X - k, FPositionCursorPosition.Y,
      FPositionCursorPosition.X + k, FPositionCursorPosition.Y, FPositionCursorColor);
  end;

  if assigned(Attributes) then
  begin
    if assigned(Attributes.ImageData) then
    begin
      if Attributes.MultiSelected1 then
      begin
        Dest.FillRectS(0, 0, 20, 20, clYellow32);
      end;
      if Attributes.ImageData.FrameCount <= 1 then
      begin
        if Attributes.MultiSelected2 {or (FDrawPrintNoSelectIcon)} then
        begin
          Dest.Draw(Width - 33, 1, FPrintSelectedIcon);
        end;
      end
      else
      begin
        if Attributes.ImageData.ImageData[Attributes.ImageData.CurrentFrame].Selected then
        begin
          Dest.Draw(Width - 33, 1, FPrintSelectedIcon);
        end;
      end;
      if LockImage then
      begin
        Dest.Draw(Width - 33, height - 33, FSelectedLockIcon);
        //      Dest.FillRectS(Width - 20, Height-20, Width, Height, clYellow32);
      end
      else
      begin
        //      Dest.LineS(Width - 20, Height - 20, Width, Height - 20, clWhite32);
        //      Dest.LineS(Width - 20, Height - 20, Width - 20, Height, clWhite32);
      end;
      if fDisplayLabel then
      begin
        AUserWrite := false;
        if assigned(OnOverlayLabel) then
          OnOverlayLabel(self, Dest, AUserWrite);

        if not AUserWrite then
        begin
          //if Attributes.ImageData.CalFontSpacing(Dest.Width, Dest.Height) >= 8 then
          begin
            if not TextOverlayMode then
              DCM_ImageData_Bitmap32.OverlayLabels(Attributes.ImageData, Dest, fDisplayWLLabel)
            else
              DCM_ImageData_Bitmap32.DisplayCommonListForVR(Attributes.ImageData, Dest, fDisplayWLLabel);
            {end
            else
            begin}

          end
        end;
      end
      else
      begin
        DCM_ImageData_Bitmap32.DisplayCommonListForVR(Attributes.ImageData, Dest, fDisplayWLLabel);
        //Attributes.ImageData.DrawImagePosition(dest);
      end;

      if FDisplayRuler then
      begin

        DCM_ImageData_Bitmap32.DrawImageScale(Attributes.ImageData, dest, DisplayRightRuler, DisplayBottomRuler);

      end;

      DCM_ImageData_Bitmap32.DrawImagePosition(Attributes.ImageData, Dest);
      //if not Attributes.MultiSelected1 then
  //    Attributes.ImageData.DrawTopoLine(Dest, Scale, OffsetHorz, OffsetVert);

      if fDisplayReport then
        DCM_ImageData_Bitmap32.DrawMeasureReport(Attributes.ImageData, Dest, self.Width / 2, 0);

      if FDrawGridAxiel then
      begin
        DrawAxiel;
      end;

      Attributes.ImageData.UpdateCood(0, 0,
        trunc(OffsetHorz), trunc(OffsetVert),
        Scale, Attributes.ImageData.PixelSpacingX, Attributes.ImageData.PixelSpacingY);

      DCM_ImageData_Bitmap32.DrawAll(Attributes.ImageData.DrawObjects, Dest, Rect(0, 0, self.Width, self.Height), false,
        Attributes.ImageData.CurrentFrame, Attributes.ImageData.CalFontSpacing(Dest.Width, Dest.Height));
    end
    else
    if assigned(Attributes.WaveFormData) then
    begin
      //Dest.Brush.Color := clWhite;
    // FOMIN 28.02.2013  
    //  Dest.FillRect(1, 1, ClientWidth, ClientHeight, clWhite32);

    //  DrawECGLines(Dest, 0, 0, Height, Width);
      // -----------------------------------------------------------------------
      Attributes.WaveFormData.v_max_pnt_in_group:=0;
      for I := 0 to Length(Attributes.WaveFormData.v_data) - 1 do // по записям
        if Attributes.WaveFormData.v_max_pnt_in_group<High(Attributes.WaveFormData.v_data[i].r_data) then
          Attributes.WaveFormData.v_max_pnt_in_group:=High(Attributes.WaveFormData.v_data[i].r_data);
      self.Height := Trunc( Attributes.WaveFormData.v_cmn_amm*v_height_channel_ECG + c_partition*2 ) ;
      // c_kletka = 15;   // шаг клетки в пикселях  1сек - 5 клеток
      Attributes.WaveFormData.v_kx := 0.125 ;
      v_width:=Trunc(Attributes.WaveFormData.v_max_pnt_in_group*Attributes.WaveFormData.v_kx)+30;
      if v_width<self.Width then v_width:=self.Width;
      self.Width  := v_width ;
      // -----------------------------------------------------------------------
      Dest.Height := self.Height;
      Dest.Width := self.Width;
      Dest.Canvas.Brush.Color := RGB( 255, 237, 196 ); // цвет фона белый  clWhite
      Dest.Canvas.FillRect(Rect(0,0,Dest.Width,Dest.Height)); // заливка всей рабочей области
      v_n_chnl:=0;
      for I := 0 to Length(Attributes.WaveFormData.v_data) - 1 do // по записям
      begin
        Dest.Canvas.Brush.Color := clBlack;
        Dest.Canvas.Brush.Style := bsClear;
        v_height := v_height_channel_ECG ;
        v_width  := Attributes.WaveFormData.v_data[i].r_amm;
        v_n_bg:=v_n_chnl;
        for I4 := 0 to Attributes.WaveFormData.v_data[i].r_amm-1 do     // High(v_data[i].r_channel)-1 do
        begin
          inc(v_n_chnl);
          v_x_top  := 3;
          v_y_top  := (v_height+c_partition)*(v_n_chnl-1);
          Dest.Canvas.Pen.Color := RGB( 182, 182, 182 );
          Dest.Canvas.Pen.Width := 1;
          Dest.Canvas.Rectangle( v_x_top, v_y_top, v_x_top+High(Attributes.WaveFormData.v_data[i].r_data), v_y_top+v_height );  // нарисуем границу
          //
          x2:=v_x_top;
          p5:=0;
          while x2<Dest.Width do // по оси абцисс
          begin
          {  if rb25.Checked then Inc(x2,c_kletka)
            else if rb50.Checked  then Inc( x2, Trunc(c_kletka*2) )
            else if rb100.Checked then Inc( x2, Trunc(c_kletka*4) ); }
            Inc(x2,c_kletka);
            Inc(p5);
            if ( p5 mod 5 )=0 then
              Dest.Canvas.Pen.Color := RGB( 182, 182, 182 )
            else
              Dest.Canvas.Pen.Color := RGB( 220, 220, 220 );
            Dest.Canvas.MoveTo( x2 , v_y_top );
            Dest.Canvas.LineTo( x2 , v_y_top+v_height );
          end;
          v_y_c := Trunc( v_y_top+v_height/2 );
          x2:=v_x_top;
          Dest.Canvas.MoveTo( x2 , v_y_c );
          Dest.Canvas.Pen.Color := RGB( 182, 182, 182 );
          Dest.Canvas.LineTo( Dest.Width , v_y_c );
          y2:=v_y_c; p5:=0;
          while y2<(v_y_top+v_height) do // рисуем разметку гориз линии вниз от центральной линии
          begin
            Inc(y2,c_kletka);
          {  if rv5.Checked then        Inc(y2,Trunc(c_kletka/(10/5)))
            else if rv10.Checked then  Inc(y2,c_kletka)
            else if rv15.Checked then  Inc(y2,Trunc(c_kletka/(10/15)))
            else if rv20.Checked then  Inc(y2,Trunc(c_kletka/(10/20)))
            else if rv25.Checked then  Inc(y2,Trunc(c_kletka/(10/25)))
            else if rv40.Checked then  Inc(y2,Trunc(c_kletka/(10/40)))
            else if rv75.Checked then  Inc(y2,Trunc(c_kletka/(10/75)));  }
            Inc(p5);
            if ( p5 mod 2 )=0 then
              Dest.Canvas.Pen.Color := RGB( 182, 182, 182 )
            else
              Dest.Canvas.Pen.Color := RGB( 220, 220, 220 );
            Dest.Canvas.MoveTo( v_x_top , y2 );
            Dest.Canvas.LineTo( Dest.Width , y2 );
          end;
          y2:=v_y_c; p5:=0;
          while y2>v_y_top do            // рисуем разметку гориз линии вверх от центральной линии
          begin
            Inc(y2,(-1)*c_kletka);
          {  if rv5.Checked then        Inc(y2,(-1)*Trunc(c_kletka/(10/5)))
            else if rv10.Checked then  Inc(y2,(-1)*c_kletka)
            else if rv15.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/15)))
            else if rv20.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/20)))
            else if rv25.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/25)))
            else if rv40.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/40)))
            else if rv75.Checked then  Inc(y2,(-1)*Trunc(c_kletka/(10/75))); }
            Inc(p5);
            if ( p5 mod 2 )=0 then
              Dest.Canvas.Pen.Color := RGB( 182, 182, 182 )
            else
              Dest.Canvas.Pen.Color := RGB( 220, 220, 220 );
            Dest.Canvas.MoveTo( v_x_top , y2 );
            Dest.Canvas.LineTo( Dest.Width , y2 );
          end;
          Dest.Canvas.Pen.Color := clBlack;
          Dest.Canvas.Font.Color := clBlack;
          Dest.Canvas.Font.Size := 10;
          Dest.Canvas.TextOut( Trunc(v_x_top+c_partition*4), Trunc(v_y_top+c_partition*4), Attributes.WaveFormData.v_data[i].r_channel[i4].r_name );
        end;
        //
        SetLength(v_dt,Attributes.WaveFormData.v_data[0].r_amm);
        Dest.Canvas.Pen.Color := clRed;
        for ik := 0 to High(v_dt) - 1 do v_dt[ik]:=0;
        { v_ky := c_height/v_max_val; // old
          1 мв = 2 клетки
          значения записаны - надо / на 1000
          1 px = 1 значение
        }
        Attributes.WaveFormData.v_ky := 0.001 * 2 * c_kletka ;
      {  if rv5.Checked then        v_ky := v_ky / (10/5)
        else if rv15.Checked then  v_ky := v_ky / (10/15)
        else if rv20.Checked then  v_ky := v_ky / (10/20)
        else if rv25.Checked then  v_ky := v_ky / (10/25)
        else if rv40.Checked then  v_ky := v_ky / (10/40)
        else if rv75.Checked then  v_ky := v_ky / (10/75) ;   }
        //
        SetLength(v_dt_max,Attributes.WaveFormData.v_data[0].r_amm);
        for ik := 0 to High(v_dt_max) - 1 do v_dt_max[ik]:=0;
        SetLength(v_dt_min,Attributes.WaveFormData.v_data[0].r_amm);
        for ik := 0 to High(v_dt_min) - 1 do v_dt_min[ik]:=0;
        SetLength(v_dt_sr,Attributes.WaveFormData.v_data[0].r_amm);
        for ik := 0 to High(v_dt_sr) - 1 do v_dt_sr[ik]:=0;
        v_amm := High(Attributes.WaveFormData.v_data[i].r_data);
        //
        for i1 := 0 to High(Attributes.WaveFormData.v_data[i].r_data)-1 do
          for i2 := 0 to Attributes.WaveFormData.v_data[i].r_amm-1 do
          begin
            if v_dt_max[i2]<Attributes.WaveFormData.v_data[i].r_data[i1,i2] then v_dt_max[i2]:=Attributes.WaveFormData.v_data[i].r_data[i1,i2];
            if v_dt_min[i2]>Attributes.WaveFormData.v_data[i].r_data[i1,i2] then v_dt_min[i2]:=Attributes.WaveFormData.v_data[i].r_data[i1,i2];
            v_dt_sr[i2] := v_dt_sr[i2] + Attributes.WaveFormData.v_data[i].r_data[i1,i2]/v_amm;
          end;
        //
        for i1 := 0 to High(Attributes.WaveFormData.v_data[i].r_data)-1 do
        begin
          for i2 := 0 to Attributes.WaveFormData.v_data[i].r_amm-1 do
          begin
            Attributes.WaveFormData.v_kx := (5*c_kletka) / Attributes.WaveFormData.v_data[I].r_channel[i2].r_SamplingFrequency ;//   1 сек = 5 клеток
         {   if rb50.Checked then v_kx := v_kx*2
            else if rb100.Checked then v_kx := v_kx*4 ; }
            {  1 клетка = 1/5 сек
               5 клеток = r_SamplingFrequency точек
               5*c_kletka = r_SamplingFrequency точек
               r_SamplingFrequency/5*c_kletka          }
            v_y_top  := trunc( v_height*( v_n_bg + i2 ) );
            v_y_c := Trunc( v_y_top+v_height/2 );   // v_n_bg+i2 - номер канала
            if True then
            begin
              if (i1>0) then
              begin
                v_x_top  := 3;
                v_y_top  := (v_height+c_partition)*(v_n_bg+i2);
                v_tmp1    := Trunc( v_dt[i2]                - v_dt_sr[i2] ) ;
                v_tmp2    := Trunc( Attributes.WaveFormData.v_data[i].r_data[i1,i2] - v_dt_sr[i2] ) ;
                if v_tmp1>0 then
                begin
                  v_y1  := Trunc( v_y_top  - v_height/2+(v_height-abs(v_tmp1) * Attributes.WaveFormData.v_ky) ) ;
                  v_y2  := Trunc( v_y_top  - v_height/2+(v_height-abs(v_tmp2) * Attributes.WaveFormData.v_ky) ) ;
                end else
                begin
                  v_y1  := Trunc( v_y_top  + (v_height/2+abs(v_tmp1) * Attributes.WaveFormData.v_ky) ) ;
                  v_y2  := Trunc( v_y_top  + (v_height/2+abs(v_tmp2) * Attributes.WaveFormData.v_ky) ) ;
                end;
                Dest.Canvas.Pen.Color := clRed; // RGB( 151, 194, 240);  // clRed;
                Dest.Canvas.MoveTo( Trunc( (i1-1)*Attributes.WaveFormData.v_kx ) , v_y1 );
                Dest.Canvas.LineTo( Trunc( i1*Attributes.WaveFormData.v_kx )     , v_y2 );
              end;
              v_dt[i2] := Attributes.WaveFormData.v_data[i].r_data[i1,i2] ;
            end else
            begin
              Dest.Canvas.Font.Color := clBlue;
              Dest.Canvas.TextOut( c_partition*4, v_y_c, 'Данных нет' );
            end;  
          end;
          Application.ProcessMessages; // Обработка всей очереди сообщений
        end;
      end;
      // -----------------------------------------------------------------------
    end
    else
    begin
      str1 := 'This is not a dicom image';
      Dest.Font.Size := 12;
      Dest.Font.Color := clWhite;
      {$IFDEF USE_BITMAP32_VIEWER}
      w1 := bitmap.TextWidth(str1);
      h1 := bitmap.TextHeight(str1);
      {$ELSE}
      //w1 := bitmap.Canvas.TextWidth(str1);
      //h1 := bitmap.Canvas.TextHeight(str1);
      {$ENDIF}
      Dest.TextOut((Dest.width - w1) div 2, (Dest.height - h1) div 2, str1);
    end;
  end;
  fInMovingMouseProcess := false;
end;
{$ELSE}

procedure TCustomDicomImage.ExecCustom(Dest: TGPGraphics; StageNum: Integer);
begin

end;
{$ENDIF}

procedure TCustomDicomImage.smooth;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    Attributes.ImageData.smooth;
    UpdateX;
  end;
end;

procedure TCustomDicomImage.sharpen;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    Attributes.ImageData.sharpen;
    UpdateX;
  end;
end;

procedure TCustomDicomImage.findEdges;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    Attributes.ImageData.findEdges;
    UpdateX;
  end;
end;

procedure TCustomDicomImage.DoProcess(op: TImageProcessOp; value: Integer);
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    Attributes.ImageData.DoProcess(op, Value);
    UpdateX;
  end;
end;

procedure TCustomDicomImage.DrawBoxInserting;
begin
  with canvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    moveto(DownMousePos.X, DownMousePos.Y);
    lineto(MovingMousePos.X, DownMousePos.Y);
    lineto(MovingMousePos.X, MovingMousePos.Y);
    lineto(DownMousePos.X, MovingMousePos.Y);
    lineto(DownMousePos.X, DownMousePos.Y);
  end;
end;

procedure TCustomDicomImage.DrawPLineInserting;
begin
  with canvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    moveto(0, MovingMousePos.Y);
    lineto(Width, MovingMousePos.Y);

    moveto(MovingMousePos.X, 0);
    lineto(MovingMousePos.X, self.Height);
  end;
end;

procedure TCustomDicomImage.DrawPGridInserting;
begin
  with canvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    moveto(0, MovingMousePos.Y);
    lineto(Width, MovingMousePos.Y);

    moveto(MovingMousePos.X, 0);
    lineto(MovingMousePos.X, self.Height);
  end;
end;

procedure OrdCor(var x1, y1, x2, y2: integer);
begin
  if x1 > x2 then
    iswap(x1, x2);
  if y1 > y2 then
    iswap(y1, y2);
end;

procedure TCustomDicomImage.DrawEllipseInserting;
var
  x1, y1, x2, y2: integer;
begin
  with canvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    brush.style := bsClear;
    x1 := DownMousePos.x;
    y1 := DownMousePos.y;
    x2 := MovingMousePos.X;
    y2 := MovingMousePos.Y;
    OrdCor(x1, y1, x2, y2);
    Ellipse(x1, y1, x2 + 1, y2 + 1);
  end;
end;

procedure TCustomDicomImage.DrawLineInserting;
//var
//  x1, y1, x2, y2: integer;
begin
  with canvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    brush.style := bsClear;
    moveto(DownMousePos.X, DownMousePos.Y);
    lineto(MovingMousePos.X, MovingMousePos.Y);
  end;
end;

const
  kRadCon = pi / 180;
  //  strunits: array[0..7] of string = ('pixels', 'inches', 'km', 'mt', '¦Мm', 'mm', 'microns',
  strunits: array[0..7] of string = ('pixels', 'inches', 'km', 'mt', 'cm', 'mm', 'microns',
    'nanometers');
type
  TIEVRulerType = (iertRULER, iertQUOTEBEGIN, iertQUOTECENTER, iertQUOTEEND);

  TIEUnits = (ieuPIXELS, ieuINCHES, ieuKM, ieuMETERS, ieuCENTIMETERS, ieuMILLIMETERS, ieuMICRONS,
    ieuNANOMETERS);

procedure TCustomDicomImage.DrawRulerInserting(x1, y1, x2, y2: Integer);
var
  aa, bb, hw {, mhw1, mhw2, hh}: double;
  //  ll: double;
  //  mfreq1, h: integer;
  fl: boolean;
  xa, ya, xb, yb: integer;
  //  th, tw: integer;
  ss {, str1}: string;
  cosbb, sinbb: double;
  cosbbpi, sinbbpi: double;
  //  cosbbpi2: double;
  //  cosbbmpi: double;
  rx, ry: double;
  //  {px,} py, rh: double;
  //  dst: integer;
  cx, cy: double;
  um: TIEUnits;
  //  RulerType: TIEVRulerType;
begin
  if (x1 = x2) and (y1 = y2) then
    exit;
  with canvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    aa := _angle(x1, y1, x2, y2, x1, y2);
    if x1 = x2 then
      if y1 < y2 then
        aa := -A90
      else
        aa := A90;
    fl := ((x1 > x2) and (y2 < y1)) or ((x1 < x2) and (y1 < y2));
    if fl then
      bb := 2 * pi - aa + A90
    else
      bb := aa + A90;
    cosbb := cos(bb);
    sinbb := sin(bb);
    cosbbpi := cos(bb + pi);
    sinbbpi := sin(bb + pi);
    //    cosbbpi2 := cos(bb + pi * 2);
    //    cosbbmpi := cos(bb - pi);
    brush.Style := bsClear;
    //    ll := _DistPoint2Point(x1, y1, x2, y2);
    MoveTo(x1, y1);
    lineto(x2, y2);
    hw := 9;
    xa := trunc(cosbb * hw);
    ya := trunc(sinbb * hw);
    xb := trunc(cosbbpi * hw);
    yb := trunc(sinbbpi * hw);
    moveto(x1 + xa, y1 + ya);
    lineto(x1 + xb, y1 + yb);
    moveto(x2 + xa, y2 + ya);
    lineto(x2 + xb, y2 + yb);
    //
//    aa := 2 * pi - _angle2(x1, y1, x2, y2);
    um := ieuCENTIMETERS;
    cx := Attributes.ImageData.PixelSpacingX;
    if cx = 0 then
    begin
      cx := 1;
      um := ieuPIXELS;
    end;
    cy := Attributes.ImageData.PixelSpacingY;
    if cy = 0 then
      cy := 1;

    rx := abs(x2 - x1) * cx / Scale;
    ry := abs(y2 - y1) * cy / Scale;
    cx := sqrt(rx * rx + ry * ry);
    ss := floattostrf(cx, ffFixed, 15, 2) + ' ' + strunits[ord(um)];

    {    tw := TextWidth(ss);
        RulerType := iertQUOTEBEGIN;
        case RulerType of
          iertQUOTEBEGIN:
            begin
              xa := x1;
              ya := y1;
            end;
          iertQUOTECENTER:
            begin
              xa := x1 + trunc((ll - tw) / 2 * cos(aa));
              ya := y1 + trunc((ll - tw) / 2 * sin(aa));
            end;
          iertQUOTEEND:
            begin
              xa := x1 + trunc((ll - tw) * cos(aa));
              ya := y1 + trunc((ll - tw) * sin(aa));
            end;
        end;
        UpdateHintEx(xa, ya, ss);}
    UpdateHintEx(x2 + 10, y2 + 20, ss);
  end;
end;

type
  TIEShape = (iesNONE, iesINARROW, iesOUTARROW);

procedure DrawLineShape(Canvas: TCanvas; x1, y1, x2, y2: integer; Shape: TIEShape; w, h: integer);
var
  aa, bb, hw: double;
  pp: array[0..2] of TPoint;
  p1x, p1y: integer;
begin
  case Shape of
    iesINARROW, iesOUTARROW:
      with Canvas do
      begin
        hw := w / 2;
        aa := _angle(x1, y1, x2, y2, x1, y2);
        if x1 = x2 then
          if y1 < y2 then
            aa := -A90
          else
            aa := A90;
        if ((x1 > x2) and (y2 < y1)) or ((x1 < x2) and (y1 < y2)) then
          bb := 2 * pi - aa + A90
        else
          bb := aa + A90;
        if ((x2 < x1) and (y2 >= y1)) or ((x2 < x1) and (y2 <= y1)) then
        begin
          p1x := x1 + trunc(cos(bb - A90) * h);
          p1y := y1 + trunc(sin(bb - A90) * h);
        end
        else
        begin
          p1x := x1 + trunc(cos(bb + A90) * h);
          p1y := y1 + trunc(sin(bb + A90) * h);
        end;
        if Shape = iesINARROW then
        begin
          pp[0].x := x1 + trunc(cos(bb) * hw);
          pp[0].y := y1 + trunc(sin(bb) * hw);
          pp[1].x := x1 + trunc(cos(bb + pi) * hw);
          pp[1].y := y1 + trunc(sin(bb + pi) * hw);
          pp[2].x := p1x;
          pp[2].y := p1y;
        end
        else
        begin
          pp[0].x := p1x + trunc(cos(bb) * hw);
          pp[0].y := p1y + trunc(sin(bb) * hw);
          pp[1].x := p1x + trunc(cos(bb + pi) * hw);
          pp[1].y := p1y + trunc(sin(bb + pi) * hw);
          pp[2].x := x1;
          pp[2].y := y1;
        end;
        Polygon(pp);
      end;
  end;
end;

procedure TCustomDicomImage.DrawLineInserting(x1, y1, x2, y2: Integer);
begin
  with canvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    moveto(X1, Y1);
    lineto(X2, Y2);
  end;
end;

procedure TCustomDicomImage.DrawArrowInserting(x1, y1, x2, y2: Integer);
var
  sw, sh: Integer;
begin
  with canvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    moveto(X1, Y1);
    lineto(X2, Y2);
  end;
  sw := 20;
  sh := 20;
  DrawLineShape(Canvas, x2, y2, x1, y1, iesOUTARROW, sw, sh);
end;

procedure TCustomDicomImage.SelectionZoom;
var
  dx, dy: integer;
  cx, cy: integer;
  x1, y1: Integer;
  z: double;
  r1: TRect;
begin
  r1 := GetSelectRect;

  dx := abs(r1.Right - r1.Left + 1);
  dy := abs(r1.Bottom - r1.Top + 1);
  if (dx < 32) or (dy < 32) then
    exit;
  //BeginUpdate;
  Scale := dmin(Width / (dx), Height / (dy));
  z := Scale;
  x1 := trunc(r1.Top * z);
  dx := trunc(dx * z);
  y1 := trunc(r1.Left * z);
  dy := trunc(dy * z);
  cy := (Height - dy) div 2;
  cx := (Width - dx) div 2;
  //  setview(x1 - cx, y1 - cy);
  SetView(-r1.Top * z, -r1.Left * z);
  //EndUpdate;
  Changed;
end;

function TCustomDicomImage.GetSelectRect: TRect;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
    with Attributes.ImageData.ImageCood do
    begin
      Result.Left := Trunc(min(XScr2Bmp(DownMousePos.X), XScr2Bmp(MovingMousePos.X)));
      Result.Top := Trunc(min(YScr2Bmp(DownMousePos.Y), YScr2Bmp(MovingMousePos.Y)));

      Result.Right := Trunc(max(XScr2Bmp(DownMousePos.X), XScr2Bmp(MovingMousePos.X)));
      Result.Bottom := Trunc(max(YScr2Bmp(DownMousePos.Y), YScr2Bmp(MovingMousePos.Y)));
    end;
end;

procedure TCustomDicomImage.SelectionROI;
var
  r1: TRect;
begin
  r1 := GetSelectRect;
  if ((r1.Left <> r1.Right) and ((r1.Left >= 0) and (r1.Right > 0))) and
    ((r1.Top <> r1.Bottom) and ((r1.Top >= 0) and (r1.Bottom > 0))) then
  begin
    Attributes.ImageData.ReCalMaxMin(r1.Left, r1.Top, r1.Right, r1.Bottom);

    UpdateX;
  end;
end;

procedure TCustomDicomImage.InitDefaultStages;
begin
  inherited;
  {.$IFDEF USE_BITMAP32_VIEWER}
  with PaintStages.Add^ do
  begin
    DsgnTime := false;
    RunTime := True;
    Stage := PST_CUSTOM;
  end;
  {.$ENDIF}
end;

procedure TCustomDicomImage.Changed;
begin
  inherited;
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    if CheckSize then
      UpdateX
    else
      Attributes.ImageData.UpdateCood(0, 0,
        trunc(OffsetHorz), trunc(OffsetVert),
        Scale, Attributes.ImageData.PixelSpacingX, Attributes.ImageData.PixelSpacingY);
  end;
end;

function TCustomDicomImage.CheckSize: Boolean;
begin
  (*if FCanCheckSize then
  begin
    Result := (Attributes.ImageData.CurrentViewSize.cX <> Width) or (Attributes.ImageData.CurrentViewSize.cY <> Height);
    if Result then
    begin
      Attributes.ImageData.CurrentViewSize.cx := Width;
      Attributes.ImageData.CurrentViewSize.cY := Height;
      Attributes.ImageData.ViewerZoom := 1;
      Attributes.ImageData.OffsetX := 0;
      Attributes.ImageData.OffsetY := 0;
      {$IFDEF DICOMDEBUG}
      SendDebug('Not Same View');
      {$ENDIF}
    end
  end
  else *)
  Result := false;
end;

procedure TCustomDicomImage.UpdateX;
var
  n1: Boolean;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    if Attributes.ImageData.Modify then
    begin
      {$IFDEF DICOMDEBUG}
      //SendDebug('AssignToBitmap');
      {$ENDIF}
      DCM_ImageData_Bitmap32.AssignToBitmap(Attributes.ImageData, bitmap, false);
      BitmapModify := true;
    end;
    n1 := CheckSize;
    if n1 or Attributes.ImageData.Modify or Attributes.ImageData.ViewModify then
    begin
      BeginUpdate;
      //f1 := Min(Width / Bitmap.Width, Height / Bitmap.Height);
      if n1 or ((abs(Attributes.ImageData.ViewerZoom - 1) < 0.01) and (Attributes.ImageData.OffsetY = 0)
        and (Attributes.ImageData.OffsetX = 0)) then
      begin
        Scale := GetBasicScale;
        //Size := GetBitmapSize;
        OffsetVert := GetBasicOffsetVert; //(Height - Size.Cy) div 2;
        OffsetHorz := GetBasicOffsetHorz; //(Width - Size.Cx) div 2;
      end
      else
      begin
        //        ShowMessage(FloatToStr(Attributes.ImageData.ViewerZoom));
        Scale := Attributes.ImageData.ViewerZoom * GetBasicScale;
        OffsetVert := Attributes.ImageData.OffsetY + GetBasicOffsetVert + GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2);
        OffsetHorz := Attributes.ImageData.OffsetX + GetBasicOffsetHorz + GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2);
        //OffsetVert := Attributes.ImageData.ViewerZoom * Attributes.ImageData.OffsetY * GetBasicScale + GetBasicOffsetVert; //* Scale;
        //OffsetHorz := Attributes.ImageData.ViewerZoom * Attributes.ImageData.OffsetX * GetBasicScale + GetBasicOffsetHorz; //* Scale;
      end;
      MagnificationType := Attributes.ImageData.MagnificationType;

      Attributes.ImageData.UpdateCood(0, 0,
        trunc(OffsetHorz), trunc(OffsetVert),
        Scale, Attributes.ImageData.PixelSpacingX, Attributes.ImageData.PixelSpacingY);

      BitmapModify := true;
      EndUpdate;
      {$IFDEF USE_BITMAP32_VIEWER}
      InvalidateCache;
      {$ENDIF}
      Invalidate;
    end
    else
      if Attributes.ImageData.DrawObjects.Modify then
    begin

      Invalidate;
    end;
    Attributes.ImageData.Modify := false;
    Attributes.ImageData.ViewModify := false;
    Attributes.ImageData.DrawObjects.Modify := false;
    //Changed;
  end;
end;

procedure TCustomDicomImage.UpdateEX;
begin
  if assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    //if Attributes.ImageData.Modify then
    begin
      {$IFDEF DICOMDEBUG}
      //SendDebug('AssignToBitmap');
      {$ENDIF}
      DCM_ImageData_Bitmap32.AssignToBitmap(Attributes.ImageData, bitmap, false);
      BitmapModify := true;
    end;
    CheckSize;
    //if Attributes.ImageData.Modify or Attributes.ImageData.ViewModify then
    begin
      BeginUpdate;
      //f1 := Min(Width / Bitmap.Width, Height / Bitmap.Height);
      if CheckSize or ((abs(Attributes.ImageData.ViewerZoom - 1) < 0.01) and (Attributes.ImageData.OffsetY = 0)
        and (Attributes.ImageData.OffsetX = 0)) then
      begin
        Scale := GetBasicScale;
        //Size := GetBitmapSize;
        OffsetVert := GetBasicOffsetVert; //(Height - Size.Cy) div 2;
        OffsetHorz := GetBasicOffsetHorz; //(Width - Size.Cx) div 2;
      end
      else
      begin
        //        ShowMessage(FloatToStr(Attributes.ImageData.ViewerZoom));
        Scale := Attributes.ImageData.ViewerZoom * GetBasicScale;
        OffsetVert := Attributes.ImageData.OffsetY + GetBasicOffsetVert + GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Height / 2);
        OffsetHorz := Attributes.ImageData.OffsetX + GetBasicOffsetHorz + GetBasicScale * (1 - Attributes.ImageData.ViewerZoom) * (Attributes.ImageData.Width / 2);

        //OffsetVert := Attributes.ImageData.ViewerZoom * Attributes.ImageData.OffsetY * GetBasicScale + GetBasicOffsetVert; //* Scale;
        //OffsetHorz := Attributes.ImageData.ViewerZoom * Attributes.ImageData.OffsetX * GetBasicScale + GetBasicOffsetHorz; //* Scale;
      end;
      MagnificationType := Attributes.ImageData.MagnificationType;

      Attributes.ImageData.UpdateCood(0, 0,
        trunc(OffsetHorz), trunc(OffsetVert),
        Scale, Attributes.ImageData.PixelSpacingX, Attributes.ImageData.PixelSpacingY);

      BitmapModify := true;
      EndUpdate;
      {$IFDEF USE_BITMAP32_VIEWER}
      InvalidateCache;
      {$ENDIF}
      Invalidate;

    end;
    // Attributes.ImageData.Modify := false;
    // Attributes.ImageData.ViewModify := false;
    // Attributes.ImageData.DrawObjects.Modify := false;
     //Changed;
  end;
end;
////////////////////////////////////////////////////////////////////////////

function TDicomMultiViewer.GetItem(AIndex: Integer): TCustomDicomImage;
begin
  if FViews.Count > AIndex then
    result := TCustomDicomImage(FViews[AIndex])
end;

procedure TDicomMultiViewer.SetLeaderMouserInspect(Value: TLeaderMouserInspect);
var
  i: Integer;
begin
  fLeftLeaderMouserInspect := Value;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).LeaderMouserInspect := Value;
end;

function TDicomMultiViewer.GetLeaderMouserInspect: TLeaderMouserInspect;
begin
  Result := fLeftLeaderMouserInspect;
  //  Result := Attributes.ImageData.DrawObjects.LeaderMouserInspect;
end;

procedure TDicomMultiViewer.TriggerDicomViewCineTo(Sender: TObject; AIndex: Integer);
begin
  if assigned(OnImageCineTo) then
    OnImageCineTo(Sender, AIndex);
end;

function DicomDatasetIsTopo(FDicomDataset: TDicomDataset): Boolean;
var
  da: TDicomAttribute;
  //  str1: string;
//  i: integer;
begin
  Result := false;
  da := FDicomDataset.Attributes.Item[$8, $8];
  //    showmessage(FDicomDataset.Attributes.GetString($8, $8));
  if assigned(da) then
  begin
    Result := Trim(da.AsString[2]) = 'LOCALIZER';
  end;
  {  if not Result then
    begin
      str1 := FDicomDataset.Attributes.GetString($8, $70);//NDM CT-C3000
      i := FDicomDataset.Attributes.getinteger($18,$0050);
      Result := (str1 = 'NDM CT-C3000') and (i=2);
    end; }
end;

constructor TDicomMultiViewer.Create(AOwner: TComponent);
begin
  inherited;
  fFullSeriesView := nil;
  FDblClickToFullSeries := false;

  FCanCheckSize := true;

  FCustomDicomImageClass := TDicomView;
  ImageFullForm := nil;

  fLastShiftDownView := nil;
  FScrollBarVisible := true;

  FMultiViewMode := mvmStandardView;
  FCustomViewSetting := '';

  FDragFrom := dfsFromImageList;
  FDragDropMode := ddmFreeView;

  fInUpdating := false;
  FBackupDicomDatasets := nil;
  FBackupCurrentImage := -1;
  fBackupSeriesUID := '';

  fAutoGrid := false;
  FViews := TList.Create;
  fUpdateAllImageProperty := true;
  fDisplayLabel := true;
  fDisplayWLLabel := true;

  fDisplayRuler := true;

  FDisplayRightRuler := true;
  FDisplayBottomRuler := true;

  fTextOverlayMode := false;
  fCanMultiSelect := true;
  fWhiteGrid := false;
  fLimitOneSeries := true;
  fOnlyViewMultiSelected1 := false;
  fOnlyViewMultiSelected2 := false;
  fOnlyViewMultiSelected3 := false;
  fOnlyViewMultiSelected4 := false;

  fLeftMouseInteract := miNone;
  fRightMouseInteract := miNone; //miWindow;
  fMouseWheelInteract := mwiScrollWheel;

  FColumns := 1;
  FRows := 1;
  //  FDicomDatasets := nil;
  FActiveView := nil;
  FMoveActiveView := nil;
  fFullSeriesView := nil;
  //FFullScreenView := nil;
  //  FNeedSaveImage := false;
  FLockCount := 0;
  fSeriesUID := '';
  fCurrentImage := -1;
  fDicomDatasets := nil;

  fScrollBar := nil;

  {fScrollBar := TScrollBar.Create(Self);
  with fScrollBar do
  begin
    Kind := sbVertical;
    PageSize := 0;
    Visible := false;
    OnScroll := ScrollBar1Scroll;
    Parent := Self;
  end;  }
end;

destructor TDicomMultiViewer.Destroy;
begin
  FViews.Clear;
  FViews.Free;
  inherited;
end;

function TDicomMultiViewer.getCount: Integer;
begin
  Result := FViews.Count;
end;

procedure TDicomMultiViewer.TriggerDicomViewScrollChange(Sender: TObject; X, Y: Double);
var
  i, k: Integer;
  str1: string;
begin
  if not assigned(FDicomDatasets) then
    exit;
  if TCustomDicomImage(Sender).LockImage then
    exit;
  {$IFDEF DICOMDEBUG}
  //SendDebug('TriggerDicomViewScrollChange');
  {$ENDIF}
  k := FDicomDatasets.GetSelectedCount;
  if (k > 1) and ((TCustomDicomImage(Sender).Attributes.MultiSelected1)) then
  begin
    for i := 0 to k - 1 do
    begin
      if FDicomDatasets.Selected[i] <> TCustomDicomImage(Sender).Attributes then
      begin
        FDicomDatasets.Selected[i].ImageData.OffsetX := ActiveView.Attributes.ImageData.OffsetX;
        FDicomDatasets.Selected[i].ImageData.OffsetY := ActiveView.Attributes.ImageData.OffsetY;
      end
    end;
  end
  else
  begin
    for i := 0 to DicomDatasets.Count - 1 do
    begin
      str1 := ActiveView.Attributes.GetString($20, $E);
      if DicomDatasets[i].Attributes.MultiSelected1 <>
        TCustomDicomImage(Sender).Attributes.MultiSelected1 then
        continue;
      if DicomDatasets[i].Attributes.MultiSelected4 <>
        TCustomDicomImage(Sender).Attributes.MultiSelected4 then
        continue;
      if assigned(DicomDatasets[i].Attributes.ImageData) then
      begin
        if UpdateAllImageProperty then
          {begin
            DicomDatasets[i].Attributes.ImageData.OffsetX := ActiveView.Attributes.ImageData.OffsetX;
            DicomDatasets[i].Attributes.ImageData.OffsetY := ActiveView.Attributes.ImageData.OffsetY;
          end
          else}
          if (CanMultiSelect) and (DicomDatasets[i].Attributes.GetString($20, $E) = str1) then
          begin
            DicomDatasets[i].Attributes.ImageData.OffsetX := ActiveView.Attributes.ImageData.OffsetX;
            DicomDatasets[i].Attributes.ImageData.OffsetY := ActiveView.Attributes.ImageData.OffsetY;
          end;
      end;
    end;
  end;
  for i := 0 to FViews.Count - 1 do
  begin
    if FViews[i] <> Sender then
      TCustomDicomImage(FViews[i]).UpdateX;
  end;
  if assigned(FOnImageScrollChange) then
    FOnImageScrollChange(Sender, x, y);
end;

procedure TDicomMultiViewer.TriggerDicomViewZoomChange(Sender: TObject; Z: Double);
var
  i, k: Integer;
  //  f1: Double;
  str1: string;
begin
  if not assigned(FDicomDatasets) then
    exit;
  if TCustomDicomImage(Sender).LockImage then
    exit;
  k := FDicomDatasets.GetSelectedCount;
  if (k > 1) and ((TCustomDicomImage(Sender).Attributes.MultiSelected1)) then
  begin
    for i := 0 to k - 1 do
    begin
      if FDicomDatasets.Selected[i] <> TCustomDicomImage(Sender).Attributes then
      begin
        FDicomDatasets.Selected[i].ImageData.ViewerZoom := ActiveView.Attributes.ImageData.ViewerZoom;
        FDicomDatasets.Selected[i].ImageData.OffsetX := ActiveView.Attributes.ImageData.OffsetX;
        FDicomDatasets.Selected[i].ImageData.OffsetY := ActiveView.Attributes.ImageData.OffsetY;
      end
    end;
  end
  else
    if ActiveView.Attributes <> nil then
  begin
    str1 := ActiveView.Attributes.GetString($20, $E);
    for i := 0 to DicomDatasets.Count - 1 do
    begin
      if DicomDatasets[i].Attributes.MultiSelected1 <>
        TCustomDicomImage(Sender).Attributes.MultiSelected1 then
        continue;
      if DicomDatasets[i].Attributes.MultiSelected4 <>
        TCustomDicomImage(Sender).Attributes.MultiSelected4 then
        continue;
      if assigned(DicomDatasets[i].Attributes.ImageData) then
      begin
        if UpdateAllImageProperty then
          {begin
            DicomDatasets[i].Attributes.ImageData.ViewerZoom := ActiveView.Attributes.ImageData.ViewerZoom;
            DicomDatasets[i].Attributes.ImageData.OffsetX := ActiveView.Attributes.ImageData.OffsetX;
            DicomDatasets[i].Attributes.ImageData.OffsetY := ActiveView.Attributes.ImageData.OffsetY;

          end
          else }
          if (CanMultiSelect) and (DicomDatasets[i].Attributes.GetString($20, $E) = str1) then
          begin
            //        with ActiveView do
            //          f1 := Z / Min(Width / Bitmap.Width, Height / Bitmap.Height);
            DicomDatasets[i].Attributes.ImageData.ViewerZoom := ActiveView.Attributes.ImageData.ViewerZoom;
            DicomDatasets[i].Attributes.ImageData.OffsetX := ActiveView.Attributes.ImageData.OffsetX;
            DicomDatasets[i].Attributes.ImageData.OffsetY := ActiveView.Attributes.ImageData.OffsetY;
          end;
      end;
    end;
  end;
  for i := 0 to FViews.Count - 1 do
  begin
    if FViews[i] <> Sender then
      TCustomDicomImage(FViews[i]).UpdateX;
  end;
  if assigned(FOnImageZoomChange) then
    FOnImageZoomChange(Sender, Z);
end;

procedure TDicomMultiViewer.TriggerDicomViewCanLockImage(Sender: TObject; var ACanLock: Boolean);
begin
  if assigned(FOnCanLock) then
    FOnCanLock(sender, ACanLock);
end;

procedure TDicomMultiViewer.TriggerDicomViewDataChange(Sender: TObject);
begin
  if assigned(OnDatasetChanged) then
    OnDatasetChanged(Sender);
end;

procedure TDicomMultiViewer.TriggerOnCustomPopupMenuPopup(Sender: TObject);
begin
  if assigned(OnCustomPopupMenuPopup) then
    OnCustomPopupMenuPopup(sender);
end;

{procedure TDicomMultiViewer.TriggerOnCustomPopupMenuClick(Sender: TObject);
begin
  if assigned(OnCustomPopupMenuClick) then
    OnCustomPopupMenuClick(sender);
end;
}

procedure TDicomMultiViewer.TriggerDicomViewWLChange(Sender: TObject; W, L: integer);
var
  k, i: Integer;
  str1: string;
begin
  if not assigned(FDicomDatasets) then
    exit;
  if TCustomDicomImage(Sender).LockImage then
    exit;
  k := FDicomDatasets.GetSelectedCount;
  if (k > 1) and ((TCustomDicomImage(Sender).Attributes.MultiSelected1)) then
  begin
    for i := 0 to k - 1 do
    begin
      if FDicomDatasets.Selected[i] <> TCustomDicomImage(Sender).Attributes then
      begin
        FDicomDatasets.Selected[i].ImageData.WindowCenter := L;
        FDicomDatasets.Selected[i].ImageData.WindowWidth := W;
      end
    end;
  end
  else
  begin
    str1 := ActiveView.Attributes.GetString($20, $E);
    //    k := TCustomDicomImage(Sender).AttributesIndex + 1;
    for i := 0 to DicomDatasets.Count - 1 do
    begin
      if DicomDatasets[i].Attributes.MultiSelected1 <>
        TCustomDicomImage(Sender).Attributes.MultiSelected1 then
        continue;
      if DicomDatasets[i].Attributes.MultiSelected4 <>
        TCustomDicomImage(Sender).Attributes.MultiSelected4 then
        continue;
      if assigned(DicomDatasets[i].Attributes.ImageData) then
      begin
        if UpdateAllImageProperty then
          {begin
            DicomDatasets[i].Attributes.ImageData.WindowCenter := L;
            DicomDatasets[i].Attributes.ImageData.WindowWidth := W;
          end
          else}
          if (CanMultiSelect) and (DicomDatasets[i].Attributes.GetString($20, $E) = str1) then
          begin
            DicomDatasets[i].Attributes.ImageData.WindowCenter := L;
            DicomDatasets[i].Attributes.ImageData.WindowWidth := W;
          end;
      end;
    end;
  end;
  for i := 0 to FViews.Count - 1 do
  begin
    if FViews[i] <> Sender then
      TCustomDicomImage(FViews[i]).UpdateX;
  end;
  if assigned(OnImageWinLevelChange) then
    OnImageWinLevelChange(Sender, w, l);
end;

procedure TDicomMultiViewer.SetRowColumns(x, y: integer);
begin
  if CanUpdateColumnRow then
  begin
    SetActiveViewFullScreen(false);
    FRows := x;
    FColumns := y;
    Update;
  end;
end;

function TDicomMultiViewer.GetCountFromSetting: Integer;
var
  str1: string;
  i: Integer;
  strs1: TStringList;
begin
  Result := 0;
  if CustomViewSetting <> '' then
  begin
    strs1 := TStringList.Create;
    try
      strs1.Text := StringReplace(CustomViewSetting, ',', #13#10, [rfReplaceAll]);
      for i := 0 to strs1.count - 1 do
      begin
        str1 := strs1[i];
        if str1 <> '' then
          Result := Result + StrToInt(str1);
      end;
    finally
      strs1.Free;
    end;
  end
  else
    Result := (Rows * Columns);
end;

function TDicomMultiViewer.GetRowOrColmn(AIndex: Integer): Integer;
var
  str1: string;
//  i: Integer;
  strs1: TStringList;
begin
  Result := 0;
  if CustomViewSetting <> '' then
  begin
    strs1 := TStringList.Create;
    try
      strs1.Text := StringReplace(CustomViewSetting, ',', #13#10, [rfReplaceAll]);
      if AIndex < strs1.count then
      begin
        str1 := strs1[AIndex];
        if str1 <> '' then
          Result := StrToInt(str1);
      end;
    finally
      strs1.Free;
    end;
  end
  else
    Result := Columns;
end;

function TDicomMultiViewer.GetRowOrColmnCount: Integer;
var
  strs1: TStringList;
begin
  Result := 0;
  if CustomViewSetting <> '' then
  begin
    strs1 := TStringList.Create;
    try
      strs1.Text := StringReplace(CustomViewSetting, ',', #13#10, [rfReplaceAll]);
      Result := strs1.count;
    finally
      strs1.Free;
    end;
  end
  else
    Result := Rows;
end;

{procedure TDicomMultiViewer.SaveAllLayer;
var
  i: integer;
begin
  if (not assigned(FDicomDatasets)) or (FDicomDatasets.Count <= 0) then
    exit;
  for i := 0 to getCount - 1 do
  begin
    if Items[i].Attributes <> nil then
      Items[i].SaveLayerToAttributes;
  end;
end; }

{procedure TDicomMultiViewer.LoadAllLayer;
var
  i: integer;
begin
  if not assigned(FDicomDatasets) or (FDicomDatasets.Count <= 0) then
    exit;
  for i := 0 to getCount - 1 do
  begin
    if Items[i].Attributes <> nil then
      Items[i].LoadLayerFromAttributes;
  end;
end;}

procedure TDicomMultiViewer.SetActiveViewFullScreen(Value: Boolean);
var
  i: integer;
//  Size: TSize;
  //  v1: TCustomDicomImage;
begin
  // if assigned(fDicomDatasets) then
  if self.Rows * self.Columns <= 1 then
    exit;
  if Value then
    //if fFullSeriesView = nil then
  begin
    fOldRows := Rows;
    fOldColumn := Columns;
    fOldCurrentImage := CurrentImage;
    fFullSeriesView := fActiveView;

    for i := 0 to Views.Count - 1 do
    begin
      if Items[i] <> fFullSeriesView then
      begin
        Items[i].Visible := false;
      end;
    end;
    fOldPosition := Rect(fFullSeriesView.Left, fFullSeriesView.Top, fFullSeriesView.Width, fFullSeriesView.Height);

    fFullSeriesView.Left := 0;
    fFullSeriesView.Top := 0;
    fFullSeriesView.Width := width;
    fFullSeriesView.Height := height;

    fFullSeriesView.fJustDBLCLick := true;
    //CurrentImage := TCustomDicomImage(Sender).AttributesIndex;
  end
  else
  begin
    if fFullSeriesView <> nil then
    begin
      for i := 0 to Views.Count - 1 do
      begin
        if Items[i] <> fFullSeriesView then
        begin
          Items[i].Visible := true;
        end;
      end;
      fFullSeriesView.Left := fOldPosition.Left;
      fFullSeriesView.Top := fOldPosition.Top;
      fFullSeriesView.Width := fOldPosition.Right;
      fFullSeriesView.Height := fOldPosition.Bottom;
      fFullSeriesView.fJustDBLCLick := true;
      //fFullSeriesView.fMouseDragging := false;
      fFullSeriesView := nil;
      CurrentImage := fOldCurrentImage;
    end;
  end;
end;

procedure TDicomMultiViewer.SetLut(AStream: TStream);
var
  i, k: Integer;
begin
  if assigned(FDicomDatasets) then
  begin
    k := FDicomDatasets.GetSelectedCount;
    if k > 0 then
    begin
      for i := 0 to k - 1 do
      begin
        (FDicomDatasets.Selected[i]).ImageData.LoadLutFromStream(AStream);
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if (ActiveView.Attributes.MultiSelected4) then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if (CanMultiSelect) and (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E))
          then
          (FDicomDatasets[i]).Attributes.ImageData.LoadLutFromStream(AStream);
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if UpdateAllImageProperty then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E)) then
          (FDicomDatasets[i]).Attributes.ImageData.LoadLutFromStream(AStream);
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if assigned(ActiveView) then
    begin
      ActiveView.Attributes.ImageData.LoadLutFromStream(AStream);
      ActiveView.UpdateX;
    end;
  end;
end;

procedure TDicomMultiViewer.SaveImages;
var
  d1: TDicomDatasets;
begin
  d1 := FDicomDatasets;
  if not assigned(d1) then
    if GetCount > 0 then
      d1 := Items[0].FDicomDatasets;
  if assigned(d1) and (d1.Count > 0) then
  begin
    //    SaveAllLayer;
    if assigned(FOnDicomSave) then
      FOnDicomSave(self, d1, true);
    //    FNeedSaveImage := false;
  end;
end;

procedure TDicomMultiViewer.SaveImageFlags;
begin
  if assigned(FDicomDatasets) and (FDicomDatasets.Count > 0) then
  begin
    if assigned(FOnDicomSave) then
      FOnDicomSave(self, FDicomDatasets, false);
    //    FNeedSaveImage := false;
  end;
end;

procedure TDicomMultiViewer.Clear;
var
  I: Integer;
begin
  if not assigned(FDicomDatasets) then
    exit;
  if fFullSeriesView <> nil then
  begin
    SetActiveViewFullScreen(false);
  end;

  FActiveView := nil;
  FMoveActiveView := nil;
  //  ClearSelect;
  FCurrentImage := -1;
  if (FDicomDatasets.Count > 0)
    {and ((FNeedSaveImage) {or ((FViewItemClass = TLabView) and (TLabView(Items[0]).IsModify))}then
  begin
    if assigned(FOnDicomSave) then
      FOnDicomSave(self, FDicomDatasets, true);
    //    FNeedSaveImage := false;
  end;
  try
    FDicomDatasets.Clear;
  except
  end;
  if fViews.Count > 0 then
  begin
    //Test FDidomDatasets if need save.
    for i := 0 to fViews.Count - 1 do
    begin
      TCustomDicomImage(Items[i]).FTimer.Enabled := false;
      Items[i].DicomDatasets := nil;
    end;
  end;
  //  Rows := 1;
  //  Columns := 1;
end;

procedure TDicomMultiViewer.ClearSelect;
var
  I: Integer;
begin
  if not assigned(FDicomDatasets) then
    exit;
  for i := 0 to FDicomDatasets.Count - 1 do
  begin
    FDicomDatasets[i].Attributes.MultiSelected1 := false;
  end;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).Invalidate;
end;

procedure TDicomMultiViewer.ClearX;
var
  I: Integer;
begin
  if not assigned(FDicomDatasets) then
    exit;
  if fFullSeriesView <> nil then
  begin
    SetActiveViewFullScreen(false);
  end;

  FActiveView := nil;
  FMoveActiveView := nil;
  FDicomDatasets.ClearList;
  FCurrentImage := -1;
  for i := 0 to fViews.Count - 1 do
  begin
    TCustomDicomImage(Items[i]).FTimer.Enabled := false;
    TCustomDicomImage(fViews[i]).DicomDatasets := nil;
    TCustomDicomImage(fViews[i]).Invalidate;
  end;
end;

procedure TDicomMultiViewer.UpdateView;
var
  i: integer;
begin
  for i := FViews.Count - 1 downto 0 do
  begin
    //if Items[i].Attributes <> nil then
    Items[i].UpdateX;
  end;
end;

procedure TDicomMultiViewer.ResetView;
var
  i: integer;
begin
  for i := fDicomDatasets.Count - 1 downto 0 do
  begin
    fDicomDatasets[i].Attributes.ImageData.ResetZoom;
  end;
end;

procedure TDicomMultiViewer.RefreshView;
var
  i: integer;
begin
  for i := FViews.Count - 1 downto 0 do
  begin
    //if Items[i].Attributes <> nil then
    Items[i].UpdateEX;
    //  Items[i].Refresh; //.Invalidate;
  end;
end;

procedure TDicomMultiViewer.ClearViewLock;
var
  i: integer;
begin
  for i := FViews.Count - 1 downto 0 do
  begin
    Items[i].LockImage := false;
    if assigned(Items[i].Attributes) then
      Items[i].Attributes.MultiSelected4 := Items[i].LockImage;
    Items[i].Invalidate;
  end;
  FLockCount := 0;
  if assigned(FOnDicomLockChange) then
    FOnDicomLockChange(self, FLockCount);
end;

procedure TDicomMultiViewer.SetViewLock;
var
  i: integer;
begin
  for i := FViews.Count - 1 downto 0 do
  begin
    Items[i].LockImage := true;
    if assigned(Items[i].Attributes) then
      Items[i].Attributes.MultiSelected4 := Items[i].LockImage;
    Items[i].Invalidate;
  end;
  FLockCount := 0;
  if assigned(FOnDicomLockChange) then
    FOnDicomLockChange(self, FLockCount);
end;

procedure TDicomMultiViewer.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
var
  k: Integer;
begin
  k := ScrollPos;
  {  if self.OnlyViewMultiSelected1 then
      while not FDicomDatasets[k].Attributes.MultiSelected1 do
      begin
        inc(k);
        if k >= DicomDatasets.Count then
          break;
      end;
    if self.OnlyViewMultiSelected2 then
      while not FDicomDatasets[k].Attributes.MultiSelected2 do
      begin
        inc(k);
        if k >= DicomDatasets.Count then
          break;
      end; }
  if ActiveView.LockImage then
  begin
    ActiveView.AttributesIndex := k;
    if assigned(fOnDatasetChanged) then
      fOnDatasetChanged(ActiveView);
    ScrollPos := ActiveView.AttributesIndex;
  end
  else
  begin
    CurrentImage := k;
    ScrollPos := CurrentImage;
    if assigned(FOnViewSelected) then
      FOnViewSelected(ActiveView);
  end;
end;

procedure TDicomMultiViewer.Update;
  function GetCountFromSetting: Integer;
  var
    str1: string;
    i: Integer;
    strs1: TStringList;
  begin
    Result := 0;
    strs1 := TStringList.Create;
    try
      strs1.Text := StringReplace(FCustomViewSetting, ',', #13#10, [rfReplaceAll]);
      for i := 0 to strs1.count - 1 do
      begin
        str1 := strs1[i];
        if str1 <> '' then
          Result := Result + StrToInt(str1);
      end;
    finally
      strs1.Free;
    end;
  end;

  function GetRowOrColmn(AIndex: Integer): Integer;
  var
    str1: string;
//    i: Integer;
    strs1: TStringList;
  begin
    Result := 0;
    strs1 := TStringList.Create;
    try
      strs1.Text := StringReplace(FCustomViewSetting, ',', #13#10, [rfReplaceAll]);
      if AIndex < strs1.count then
      begin
        str1 := strs1[AIndex];
        if str1 <> '' then
          Result := StrToInt(str1);
      end;
    finally
      strs1.Free;
    end;
  end;

  function GetRowOrColmnCount: Integer;
  var
    strs1: TStringList;
  begin
    Result := 0;
    strs1 := TStringList.Create;
    try
      strs1.Text := StringReplace(FCustomViewSetting, ',', #13#10, [rfReplaceAll]);
      Result := strs1.count;
    finally
      strs1.Free;
    end;
  end;

  function NewView(ARow, AColumn: Integer): TCustomDicomImage;
  begin
    Result := nil;
    if assigned(FOnCreateDicomViewItem) then
    begin
      FOnCreateDicomViewItem(self, ARow, AColumn, Result);
    end;
    if Result = nil then
      Result := fCustomDicomImageClass.Create(self);

    Result.OnReturnObjectSelect := TriggerDicomViewReturnObjectSelect;
    Result.OnMouseDown := TriggerDicomViewMouseDown;
    Result.OnMouseMove := TriggerDicomViewMouseMove;
    Result.OnMouseUp := TriggerDicomViewMouseUp;
    Result.fOnDicomImageLock := TriggerDicomViewImageLock;
    Result.OnKeyDown := TriggerDicomViewKeyDown;
    Result.OnImageCineTo := TriggerDicomViewCineTo;
    Result.OnImageWinLevelChange := TriggerDicomViewWLChange;
    Result.OnImageScrollChange := TriggerDicomViewScrollChange;
    Result.OnImageZoomChange := TriggerDicomViewZoomChange;
    Result.OnDatasetChanged := TriggerDicomViewDataChange;
    Result.OnOverlayLabel := TriggerDicomViewOverlaylabel;
    Result.OnCustomOverlayLabel := TriggerDicomViewCustomlabel;

    Result.OnCustomPopupMenuPopup := TriggerOnCustomPopupMenuPopup;
    Result.OnCustomDrawObjectPopupMenuPopup := TriggerOnCustomDrawObjectPopupMenuPopup;
    Result.OnDragDropToPrint := TriggerOnDragDropToPrint;
    Result.OnDragDrop := TriggerOnDragDropEvent;
    Result.OnDragOver := TriggerOnDragOverEvent;
    Result.OnStartDrag := TriggerOnViewStartDrag;
    //    Result.OnCustomPopupMenuClick := TriggerOnCustomPopupMenuClick;

    Result.OnCanLock := TriggerDicomViewCanLockImage;
    Result.OnDblClick := TriggerDicomViewDblClick;
    //    Result.OnPopupClick := TriggerDicomViewPopupClick;
    //    Result.OnDicomPrintClick := self.OnDicomPrintClick;
    Result.OnMouseWheel := TriggerDicomViewMouseWheel;
    Result.OnTopoLineClick := DoTopoLineClick;
    Result.FOnViewFlagChange := TriggerOnViewFlagChange;
    Result.FOn3DCursorMove := Do3DCursor;
    Result.FOn3DCursorEnd := DoEnd3DCursor;
    Result.FOn3DCursorStart := DoStart3DCursor;

    Result.LeftMouseInteract := fLeftMouseInteract;
    Result.RightMouseInteract := fRightMouseInteract;

    Result.OnAfterNewDrawObject := DoFinishNewDrawObject;
    Result.OnAfterObjectSize := DoDrawObjectSize;
    Result.OnAfterObjectMove := DoDrawObjectMove;
    Result.CanCheckSize := CanCheckSize;

    Result.DragFrom := DragFrom;
    Result.DragDropMode := DragDropMode;

    Result.Color := Color;
    Result.FImageAngle := fImageAngle;

    Result.Tag := FViews.Add(Result);

    Result.fCanMultiSelect := fCanMultiSelect;
    Result.WhiteGrid := fWhiteGrid;
    Result.DisplayLabel := DisplayLabel;
    Result.DisplayWLLabel := DisplayWLLabel;

    Result.DisplayRuler := DisplayRuler;
    Result.DisplayRightRuler := DisplayRightRuler;
    Result.DisplayBottomRuler := DisplayBottomRuler;
    Result.TextOverlayMode := TextOverlayMode;
    Result.fParentViewer := self;
  end;
var
  kw1, zz1, k, i, yy, x, y, cw, ch, kw, kh, limitcount, limitstart: Integer;
  v1: TCustomDicomImage;
  SIze: TSize;
  nb1: Boolean;
begin
  fInUpdating := true;
  try
    if (Height <= 0) or (Width <= 0) then
      exit;

    if fFullSeriesView <> nil then
    begin
      SetActiveViewFullScreen(false);
    end;

    if assigned(fActiveView) then
      fActiveView.Selected := false;

    //fActiveView := nil;
    //FMoveActiveView := nil;

    //    if not assigned(FDicomDatasets) then
    //      exit;
  //  SaveAllLayer;

  //FCustomViewSetting
  //FMultiViewMode   mvmSTANDARDView, mvmROWView, mvmCOLUMNView, mvmSLIDEView, mvmSUPERSLIDEView
    if (FMultiViewMode = mvmSTANDARDView) or (FCustomViewSetting = '') then
    begin
      k := FColumns * FRows;
      cw := FColumns;
      ch := FRows;
    end
    else
    begin
      k := GetCountFromSetting;

    end;

    if k <= 0 then
      exit;

    if FScrollBarVisible then
    begin
      if fScrollBar = nil then
      begin
        fScrollBar := TScrollBar.Create(Self);
        with fScrollBar do
        begin
          Kind := sbVertical;
          PageSize := 0;
          Visible := false;
          OnScroll := ScrollBar1Scroll;
          Parent := Self;
        end;
      end;
    end;
    if assigned(FDicomDatasets) and (FCurrentImage >= 0) and (FDicomDatasets.Count > 0) and (CurrentImage < FDicomDatasets.Count) then
    begin
      if (fLimitOneSeries) and (fseriesuid <> '') then
      begin
        limitcount := FDicomDatasets.GetSeriesImageCount(CurrentImage);
        limitstart := FDicomDatasets.GetCurrentSeriesStart(FDicomDatasets[CurrentImage]);
      end
      else
      begin
        limitcount := FDicomDatasets.Count;
        limitstart := 0;
      end;
      if FScrollBarVisible then
      begin

        if (limitcount > k) then
        begin
          kw1 := (Width - 16);
          fScrollBar.Enabled := false;
          fScrollBar.Left := Width - 16;
          fScrollBar.Top := 0;
          fScrollBar.Width := 16;
          fScrollBar.Height := Height;
          fScrollBar.Visible := true;
          fScrollBar.Min := 0;
          fScrollBar.Position := fScrollBar.Min;
          fScrollBar.Max := limitstart + limitcount - 1; //
          fScrollBar.Min := limitstart;
          fScrollBar.Position := CurrentImage;
          fScrollBar.LargeChange := k;
        end
        else
        begin
          fScrollBar.Enabled := false;
          kw1 := Width;
        end;
      end
      else
        kw1 := Width;

    end
    else
    begin
      kw1 := Width;
      if FScrollBarVisible then
        fScrollBar.Visible := false;
    end;

    if (FMultiViewMode = mvmSTANDARDView) or (FCustomViewSetting = '') then
    begin
      kh := Height div ch;
      kw := kw1 div cw;
      i := 0;
      for y := 0 to ch - 1 do
      begin
        yy := kh * y;
        for x := 0 to cw - 1 do // Iterate
        begin
          if (y * cw + x + 1) > Count then
            v1 := NewView(y, x)
          else
            v1 := Items[y * cw + x];
          v1.Color := Color;
          v1.BeginUpdate;
          v1.Visible := true;
          v1.SetBounds(x * kw, yy, kw, kh);
          //v1.Width := kw;
          //v1.Height := kh;
          if v1.Parent <> self then
            v1.Parent := self;

          if (not v1.LockImage) and assigned(FDicomDatasets) and (FDicomDatasets.Count >
            (FCurrentImage + i)) then
          begin
            {if self.OnlyViewMultiSelected1 then
              while not FDicomDatasets[FCurrentImage + i].Attributes.MultiSelected1 do
              begin
                inc(i);
                if (FCurrentImage + i) >= DicomDatasets.Count then
                  break;
              end;
            if self.OnlyViewMultiSelected2 then
              while not FDicomDatasets[FCurrentImage + i].Attributes.MultiSelected2 do
              begin
                if FDicomDatasets[FCurrentImage + i].Attributes.ImageData.FrameCount>1 then
                    break;
                inc(i);
                if (FCurrentImage + i) >= DicomDatasets.Count then
                  break;
              end;
            if self.OnlyViewMultiSelected3 then
              while not FDicomDatasets[FCurrentImage + i].Attributes.MultiSelected3 do
              begin
                inc(i);
                if (FCurrentImage + i) >= DicomDatasets.Count then
                  break;
              end;
            if self.OnlyViewMultiSelected4 then
              while not FDicomDatasets[FCurrentImage + i].Attributes.MultiSelected4 do
              begin
                inc(i);
                if (FCurrentImage + i) >= DicomDatasets.Count then
                  break;
              end; }
            if (FDicomDatasets.Count > (FCurrentImage + i)) then
            begin
              nb1 := true;
              if (fLimitOneSeries) and (fseriesuid <> '') then
              begin
                nb1 := FDicomDatasets[FCurrentImage + i].Attributes.GetString($20, $E) = fseriesuid;
              end;
              if nb1 then
              begin
                //        v1.Attributes := nil;
        //        v1.Attributes := FDicomDatasets.Item[FCurrentImage + i].Attributes;
                v1.DicomDatasets := FDicomDatasets;
                v1.AttributesIndex := -1;
                v1.AttributesIndex := FCurrentImage + i;
                v1.LeftMouseInteract := fLeftMouseInteract;
                v1.MouseWheelInteract := MouseWheelInteract;
              end
              else
                v1.DicomDatasets := nil;
            end
            else
              v1.DicomDatasets := nil;
            inc(i);
          end
          else
          begin
            if not v1.LockImage then
            begin
              v1.DicomDatasets := FDicomDatasets;
              if assigned(FDicomDatasets) then
                if (v1.DicomDatasets = FDicomDatasets) then
                  if (FDicomDatasets.Count <= (FCurrentImage + i)) then
                    v1.DicomDatasets := nil;
            end
            else
            begin
              if assigned(v1.Attributes) then
                with v1 do
                begin
                  UpdateX;
                  Scale := Min(Width / Bitmap.Width, Height / Bitmap.Height);
                  Size := GetBitmapSize;
                  OffsetVert := (Height - Size.Cy) div 2;
                  OffsetHorz := (Width - Size.Cx) div 2;
                end;
            end;
          end;
          v1.DisplayLabel := fDisplayLabel;
          v1.DisplayWLLabel := fDisplayWLLabel;
          v1.DisplayRuler := fDisplayRuler;
          v1.DisplayRightRuler := FDisplayRightRuler;
          v1.DisplayBottomRuler := FDisplayBottomRuler;

          v1.TextOverlayMode := fTextOverlayMode;

          v1.fCanMultiSelect := fCanMultiSelect;
          v1.WhiteGrid := WhiteGrid;
          v1.EndUpdate;
          v1.Changed;
        end; // for
      end;

    end
    else
      //FMultiViewMode   mvmSTANDARDView, mvmROWView, mvmCOLUMNView, mvmSLIDEView, mvmSUPERSLIDEView
      if (FCustomViewSetting <> '') then
    begin
      zz1 := 0;
      case FMultiViewMode of
        mvmROWView:
          begin
            ch := GetRowOrColmnCount;
            kh := Height div ch;
            i := 0;
            for y := 0 to ch - 1 do
            begin
              yy := kh * y;

              cw := GetRowOrColmn(y);
              kw := kw1 div cw;

              for x := 0 to cw - 1 do // Iterate
              begin
                if (zz1 + 1) > Count then
                  v1 := NewView(y, x)
                else
                  v1 := Items[zz1];
                inc(zz1);

                v1.Color := Color;
                v1.BeginUpdate;
                v1.SetBounds(x * kw, yy, kw, kh);
                //v1.Width := kw;
                //v1.Height := kh;
                if v1.Parent <> self then
                  v1.Parent := self;

                if (not v1.LockImage) and assigned(FDicomDatasets) and (FDicomDatasets.Count >
                  (FCurrentImage + i)) then
                begin
                  if (FDicomDatasets.Count > (FCurrentImage + i)) then
                  begin
                    nb1 := true;
                    if (fLimitOneSeries) and (fseriesuid <> '') then
                    begin
                      nb1 := FDicomDatasets[FCurrentImage + i].Attributes.GetString($20, $E) = fseriesuid;
                    end;
                    if nb1 then
                    begin
                      //        v1.Attributes := nil;
              //        v1.Attributes := FDicomDatasets.Item[FCurrentImage + i].Attributes;
                      v1.DicomDatasets := FDicomDatasets;
                      v1.AttributesIndex := -1;
                      v1.AttributesIndex := FCurrentImage + i;
                      v1.LeftMouseInteract := fLeftMouseInteract;
                      v1.MouseWheelInteract := MouseWheelInteract;
                    end
                    else
                      v1.DicomDatasets := nil;
                  end
                  else
                    v1.DicomDatasets := nil;
                  inc(i);
                end
                else
                begin
                  if not v1.LockImage then
                  begin
                    v1.DicomDatasets := FDicomDatasets;
                    if assigned(FDicomDatasets) and (v1.DicomDatasets = FDicomDatasets) and
                      (FDicomDatasets.Count <= (FCurrentImage + i)) then
                      v1.DicomDatasets := nil;
                  end
                  else
                  begin
                    if assigned(v1.Attributes) then
                      with v1 do
                      begin
                        UpdateX;
                        Scale := Min(Width / Bitmap.Width, Height / Bitmap.Height);
                        Size := GetBitmapSize;
                        OffsetVert := (Height - Size.Cy) div 2;
                        OffsetHorz := (Width - Size.Cx) div 2;
                      end;
                  end;
                end;
                v1.DisplayLabel := fDisplayLabel;
                v1.DisplayWLLabel := fDisplayWLLabel;
                v1.DisplayRuler := fDisplayRuler;
                v1.TextOverlayMode := fTextOverlayMode;
                v1.DisplayRightRuler := FDisplayRightRuler;
                v1.DisplayBottomRuler := FDisplayBottomRuler;

                v1.fCanMultiSelect := fCanMultiSelect;
                v1.WhiteGrid := WhiteGrid;
                v1.EndUpdate;
                v1.Changed;
              end; // for
            end;
          end;
        mvmCOLUMNView:
          begin
            ch := GetRowOrColmnCount;
            kh := kw1 div ch;
            i := 0;
            for y := 0 to ch - 1 do
            begin
              yy := kh * y;

              cw := GetRowOrColmn(y);
              kw := Height div cw;

              for x := 0 to cw - 1 do // Iterate
              begin

                if (zz1 + 1) > Count then
                  v1 := NewView(y, x)
                else
                  v1 := Items[zz1];

                inc(zz1);

                v1.Color := Color;
                v1.BeginUpdate;
                v1.SetBounds(yy, x * kw, kh, kw);
                //v1.Width := kw;
                //v1.Height := kh;
                if v1.Parent <> self then
                  v1.Parent := self;

                if (not v1.LockImage) and assigned(FDicomDatasets) and (FDicomDatasets.Count >
                  (FCurrentImage + i)) then
                begin
                  if (FDicomDatasets.Count > (FCurrentImage + i)) then
                  begin
                    nb1 := true;
                    if (fLimitOneSeries) and (fseriesuid <> '') then
                    begin
                      nb1 := FDicomDatasets[FCurrentImage + i].Attributes.GetString($20, $E) = fseriesuid;
                    end;
                    if nb1 then
                    begin
                      //        v1.Attributes := nil;
              //        v1.Attributes := FDicomDatasets.Item[FCurrentImage + i].Attributes;
                      v1.DicomDatasets := FDicomDatasets;
                      v1.AttributesIndex := -1;
                      v1.AttributesIndex := FCurrentImage + i;
                      v1.LeftMouseInteract := fLeftMouseInteract;
                      v1.MouseWheelInteract := MouseWheelInteract;
                    end
                    else
                      v1.DicomDatasets := nil;
                  end
                  else
                    v1.DicomDatasets := nil;
                  inc(i);
                end
                else
                begin
                  if not v1.LockImage then
                  begin
                    v1.DicomDatasets := FDicomDatasets;
                    if assigned(FDicomDatasets) and (v1.DicomDatasets = FDicomDatasets) and
                      (FDicomDatasets.Count <= (FCurrentImage + i)) then
                      v1.DicomDatasets := nil;
                  end
                  else
                  begin
                    if assigned(v1.Attributes) then
                      with v1 do
                      begin
                        UpdateX;
                        Scale := Min(Width / Bitmap.Width, Height / Bitmap.Height);
                        Size := GetBitmapSize;
                        OffsetVert := (Height - Size.Cy) div 2;
                        OffsetHorz := (Width - Size.Cx) div 2;
                      end;
                  end;
                end;
                v1.DisplayLabel := fDisplayLabel;
                v1.DisplayWLLabel := fDisplayWLLabel;
                v1.DisplayRuler := fDisplayRuler;
                v1.DisplayRightRuler := FDisplayRightRuler;
                v1.DisplayBottomRuler := FDisplayBottomRuler;

                v1.TextOverlayMode := fTextOverlayMode;

                v1.fCanMultiSelect := fCanMultiSelect;
                v1.WhiteGrid := WhiteGrid;
                v1.EndUpdate;
                v1.Changed;
              end; // for
            end;
          end;
        mvmSLIDEView:
          begin

          end;
        mvmSUPERSLIDEView:
          begin

          end;
      end;

    end;

    for i := FViews.Count - 1 downto k do
    begin
      TCustomDicomImage(Items[i]).FTimer.Enabled := false;
      v1 := Items[i];
      self.RemoveControl(Items[i]);
      FViews.Delete(i);
      v1.Free;
    end;
    //  LoadAllLayer;
  finally
    fInUpdating := false;
  end;
end;
{
procedure TDicomMultiViewer.RemoveAllViewControl;
var
  i: Integer;
begin
  for i := FViews.Count - 1 downto 0 do
  begin
    self.RemoveControl(TWinControl(FViews[i]));
    FViews.Delete(i);
  end;
end;
}

procedure TDicomMultiViewer.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, operation);
  if Operation = opRemove then
  begin
    if (AComponent = FDicomDatasets) then
    begin
      {$IFDEF DICOMDEBUG}
      SendDebug('FDicomDatasets free');
      {$ENDIF}

      if fFullSeriesView <> nil then
      begin
        {$IFDEF DICOMDEBUG}
        SendDebug('FFullScreenView false');
        {$ENDIF}

        SetActiveViewFullScreen(false);
      end;
      FDicomDatasets := nil;
      CurrentImage := -1;
      Update;
    end;

    if (AComponent = FActiveView) then
    begin
      FActiveView := nil;
    end;

    if (AComponent = fFullSeriesView) then
    begin
      {$IFDEF DICOMDEBUG}
      SendDebug('FFullScreenView false 1');
      {$ENDIF}

      SetActiveViewFullScreen(false);
      fFullSeriesView := nil;
    end;

    if (AComponent = FMoveActiveView) then
    begin
      FMoveActiveView := nil;
    end;

    //FFullScreenView
  end;
end;

procedure TDicomMultiViewer.TriggerDicomViewMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  k1{, k2}: Integer;
begin
  if (ActiveView.MouseWheelInteract = mwiScrollWheel) then
  begin
    Handled := true;
    if assigned(DicomDatasets) and (not ActiveView.LockImage) then
    begin
      if WheelDelta < 0 then
      begin
        if fLimitOneSeries then
          k1 := DicomDatasets.GetSeriesEnd(SeriesUID)
        else
          k1 := DicomDatasets.Count;
        if CurrentImage < k1 then
          if fFullSeriesView = nil then
          begin
            if (CurrentImage + Rows * Columns) <= k1 then
              CurrentImage := CurrentImage + Rows * Columns;
          end
          else
            if (CurrentImage + 1) <= k1 then
            CurrentImage := CurrentImage + 1;
      end
      else
      begin
        if fLimitOneSeries then
          k1 := DicomDatasets.GetSeriesStart(SeriesUID)
        else
          k1 := 0;
        if CurrentImage > k1 then
          if fFullSeriesView = nil then
          begin
            if (CurrentImage - Rows * Columns) > k1 then
              CurrentImage := CurrentImage - Rows * Columns
            else
              CurrentImage := k1;
          end
          else
          begin
            if (CurrentImage - 1) > k1 then
              CurrentImage := CurrentImage - 1
            else
              CurrentImage := k1;
          end;
      end;
      if ScrollBarVisible then
        fScrollBar.Position := CurrentImage;

      if assigned(FOnViewSelected) then
        FOnViewSelected(Sender);
    end
    else
      if assigned(ActiveView.DicomDatasets) then
    begin
      if WheelDelta < 0 then
      begin
        if (fLimitOneSeries) and (fSeriesUID <> '') then
        begin
          if ((ActiveView.AttributesIndex + 1) < DicomDatasets.Count) then
          begin
            if DicomDatasets.Item[ActiveView.AttributesIndex +
              1].Attributes.GetString(dSeriesInstanceUID)
              <> fSeriesUID then
            begin
              exit;
            end
            else
              ActiveView.Next;
          end;
        end;

      end
      else
        if (fLimitOneSeries) and (fSeriesUID <> '') then
      begin
        if (ActiveView.AttributesIndex > 0) then
        begin
          if DicomDatasets.Item[ActiveView.AttributesIndex -
            1].Attributes.GetString(dSeriesInstanceUID)
            <> fSeriesUID then
          begin
            exit;
          end
          else
            ActiveView.Prior;
        end;
      end;
      if ScrollBarVisible then
        fScrollBar.Position := ActiveView.AttributesIndex;
      if assigned(FOnViewSelected) then
        FOnViewSelected(Sender);
    end;
  end;
end;

procedure TDicomMultiViewer.SetDicomDatasets(Value: TDicomDatasets);
var
  i: integer;
begin
  if FDicomDatasets <> Value then
  begin
    FDicomDatasets := Value;

    if Value = nil then
      for i := FViews.Count - 1 downto 0 do
      begin
        Items[i].DicomDatasets := nil;
      end;

    if Value = nil then
      fCurrentImage := -1
    else
      fCurrentImage := 0;
    Update;
  end;
end;

function TDicomMultiViewer.GetDicomDatasets: TDicomDatasets;
begin
  Result := FDicomDatasets;
  if not assigned(Result) and (GetCount > 0) then
    Result := Items[0].FDicomDatasets;
end;

procedure TDicomMultiViewer.NextSeries(AID: Integer);
var
  i: Integer;
  das1: TDicomDataset;
begin
  if FDicomDatasets <> nil then
  begin
    i := FDicomDatasets.GetCurrentSeriesIndex(FDicomDatasets[FCurrentImage]);
    if (i + AID) < FDicomDatasets.GetSeriesCount then
    begin
      das1 := FDicomDatasets.SeriesDataset[i + AID];
      if assigned(das1) then
      begin
        i := FDicomDatasets.IndexOf(das1);
        if i >= 0 then
        begin
          fSeriesUID := das1.Attributes.GetString(dSeriesInstanceUID);

          CurrentImage := i;
        end;
      end;
    end;
  end;
end;

procedure TDicomMultiViewer.Last;
var
  i: Integer;
begin
  if assigned(FDicomDatasets) then
  begin
    i := GetCountFromSetting; //Rows * Columns;
    CurrentImage := (FDicomDatasets.Count div i) * i;
  end;
end;

procedure TDicomMultiViewer.UpdateScrollBars;
var
  k, cw, ch, kw, limitcount, limitstart: integer;
begin
  k := GetCountFromSetting; //FColumns * FRows;
  if k <= 0 then
    exit;
  cw := FColumns;
  ch := FRows;
  if assigned(FDicomDatasets) and (FCurrentImage >= 0) then
  begin
    if (fLimitOneSeries) and (fseriesuid <> '') then
    begin
      limitcount := FDicomDatasets.GetSeriesImageCount(CurrentImage);
      limitstart := FDicomDatasets.GetCurrentSeriesStart(FDicomDatasets[CurrentImage]);
    end
    else
    begin
      limitcount := FDicomDatasets.Count;
      limitstart := 0;
    end;
    if (fScrollBar <> nil) then
      if (limitcount > k) then
      begin
        if not fScrollBar.Visible then
          Update
        else
        begin
          kw := (Width - 16) div cw;
          fScrollBar.Enabled := false;
          fScrollBar.Left := Width - 16;
          fScrollBar.Top := 0;
          fScrollBar.Width := 16;
          fScrollBar.Height := Height;
          fScrollBar.Visible := true;
          fScrollBar.Min := 0;
          fScrollBar.Position := fScrollBar.Min;
          fScrollBar.Max := limitstart + limitcount - 1; //
          fScrollBar.Min := limitstart;
          fScrollBar.Position := CurrentImage;

          fScrollBar.LargeChange := GetCountFromSetting;
        end;
      end
      else
      begin
        kw := Width div cw;
        fScrollBar.Visible := false;
      end;
  end
end;

procedure TDicomMultiViewer.PriorSeries(AID: Integer);
var
  i: Integer;
  das1: TDicomDataset;
begin
  if FDicomDatasets <> nil then
  begin
    i := FDicomDatasets.GetCurrentSeriesIndex(FDicomDatasets[FCurrentImage]);
    if i >= AID then
    begin
      das1 := FDicomDatasets.SeriesDataset[i - AID];
      if assigned(das1) then
      begin
        i := FDicomDatasets.IndexOf(das1);
        if i >= 0 then
        begin
          fSeriesUID := das1.Attributes.GetString(dSeriesInstanceUID);

          CurrentImage := i;
        end;
      end;
    end;
  end;
end;

procedure TDicomMultiViewer.SetCurrentImage(AIndex: Integer);
  function GetFirstSameStudyUIDImage: integer;
  var
    i: Integer;
  begin
    for i := 0 to FViews.Count - 1 do //FRows * FColumns - 1 do
    begin
      if (not Items[i].LockImage) and (Items[i].DicomDatasets = FDicomDatasets) then
      begin
        Result := i;
        exit;
      end
    end;
  end;
var
  i, k: Integer;
  { zzz, h1, ww1: Integer;
  f1, f2, t1: Single;
  w1, l1: Integer;
  b1, b2, xb: Boolean;}
  r: Integer;
  nb1: Boolean;
begin
  //  if FCurrentImage <> AIndex then
  begin
    r := FCurrentImage;
    if not assigned(FDicomDatasets) then
    begin
      FCurrentImage := AIndex;
      exit;
    end;

    //  SaveAllLayer;
    if (AIndex >= 0) and (AIndex < DicomDatasets.Count) then
    begin

      if (fLimitOneSeries) and (fSeriesUID <> '') then
      begin
        if DicomDatasets.Item[AIndex].Attributes.GetString(dSeriesInstanceUID)
          <> fSeriesUID then
        begin
          exit;
        end;
      end;
      {zzz := GetFirstSameStudyUIDImage;
      if zzz >= Count then
        exit;
      if UpdateAllImageProperty and (AIndex > 0) then
      begin
        xb := Items[zzz].Attributes.IsImageChange;
        t1 := Items[zzz].Scale;
        w1 := Items[zzz].Attributes.ImageData.WindowWidth;
        l1 := Items[zzz].Attributes.ImageData.WindowCenter;
        f1 := Items[zzz].OffsetHorz;
        f2 := Items[zzz].OffsetVert;
        b1 := Items[zzz].Attributes.ImageData.VerFlip;
        b2 := Items[zzz].Attributes.ImageData.HozFlip;
        r := Items[zzz].Attributes.ImageData.Rotate;
        h1 := Items[zzz].Attributes.ImageData.Height;
        ww1 := Items[zzz].Attributes.ImageData.Width;
      end;}

      FCurrentImage := AIndex;
      k := FCurrentImage;
      //if fFullSeriesView = nil then
      //begin
      for i := 0 to FViews.Count - 1 do //FRows * FColumns - 1 do
      begin
        if (not Items[i].LockImage) and (k < DicomDatasets.Count) then
        begin
          if (k < DicomDatasets.Count) then
          begin
            nb1 := true;
            if (fLimitOneSeries) and (fseriesuid <> '') then
            begin
              //if assigned(FDicomDatasets[k].Attributes) then
              nb1 := FDicomDatasets[k].Attributes.GetString($20, $E) = fseriesuid
                //else
//  nb1 := false;
            end;
            if nb1 then
            begin
              //        Items[i].Attributes := FDicomDatasets.Item[k].Attributes;
              Items[i].DicomDatasets := FDicomDatasets;
              items[i].AttributesIndex := k;

            end
            else
              Items[i].DicomDatasets := nil;
          end
          else
            Items[i].DicomDatasets := nil;

          inc(k);
        end
        else
          if (not Items[i].LockImage) then
        begin
          items[i].DicomDatasets := nil;
          items[i].UpdateX;
        end;
      end; //for FViews.Count
      {end
      else
      begin
        if (not fFullSeriesView.LockImage) and (k < DicomDatasets.Count) then
        begin
          if (k < DicomDatasets.Count) then
          begin
            nb1 := true;
            if (fLimitOneSeries) and (fseriesuid <> '') then
            begin
              //if assigned(FDicomDatasets[k].Attributes) then
              nb1 := FDicomDatasets[k].Attributes.GetString($20, $E) = fseriesuid
                //else
//  nb1 := false;
            end;
            if nb1 then
            begin
              //        Items[i].Attributes := FDicomDatasets.Item[k].Attributes;
              fFullSeriesView.DicomDatasets := FDicomDatasets;
              fFullSeriesView.AttributesIndex := k;

            end
            else
              fFullSeriesView.DicomDatasets := nil;
          end
          else
            fFullSeriesView.DicomDatasets := nil;

          inc(k);
        end
        else
          if (not fFullSeriesView.LockImage) then
        begin
          fFullSeriesView.DicomDatasets := nil;
          fFullSeriesView.UpdateX;
        end;
        //fFullSeriesView.DicomDatasets := FDicomDatasets;

        //fFullSeriesView.AttributesIndex := k;
      end;}
      if ScrollBarVisible and (fScrollBar <> nil) then
      begin
        fScrollBar.OnScroll := nil;
        fScrollBar.Position := AIndex;
        fScrollBar.OnScroll := ScrollBar1Scroll;
      end;

      if assigned(FOnCurrentImageTo) then
        FOnCurrentImageTo(self, r, FCurrentImage);

      //if assigned(fOnDatasetChanged) then
      //  fOnDatasetChanged(items[0]);
    end
    else
      if DicomDatasets.Count <= 0 then
    begin
      for i := 0 to FViews.Count - 1 do
        if (not Items[i].LockImage) then
        begin
          //      Items[i].Attributes := nil;
          items[i].DicomDatasets := nil;
          items[i].AttributesIndex := -1;
        end;
    end;
    LeaderMouserInspect := fLeftLeaderMouserInspect;
    //  LoadAllLayer;
  end;
end;

function TDicomMultiViewer.CanUpdateColumnRow: Boolean;
var
  i: integer;
begin
  Result := true;
  for i := FViews.Count - 1 downto 0 do
  begin
    if Items[i].LockImage then
    begin
      Result := false;
      exit;
    end;
  end;
end;

procedure TDicomMultiViewer.SetColumns(AValue: Integer);
begin
  if CanUpdateColumnRow then
    if AValue <> FColumns then
    begin
      SetActiveViewFullScreen(false);
      FColumns := AValue;
      Update;
    end;
end;

procedure TDicomMultiViewer.SetRows(AValue: Integer);
begin
  if CanUpdateColumnRow then
    if AValue <> FRows then
    begin
      SetActiveViewFullScreen(false);
      FRows := AValue;
      Update;
    end;
end;

procedure TDicomMultiViewer.TriggerDicomViewReturnObjectSelect(Sender: TObject);
begin
  if assigned(fOnReturnObjectSelect) then
    fOnReturnObjectSelect(Sender);
end;

procedure TDicomMultiViewer.DoTopoLineClick(Sender: TObject; AImageIndex: Integer);
//var
//  k: integer;
begin
  {  if (SeriesUID = '') and (not LimitOneSeries) then
    begin
      k := TCustomDicomImage(Sender).Tag + 1;
      if k < FViews.Count then
        with TCustomDicomImage(FViews[k]) do
          AttributesIndex := AImageIndex;
    end
    else}
  begin
    if assigned(FOnTopoLineClick) then
      FOnTopoLineClick(self, AImageIndex);
  end;
end;

procedure TDicomMultiViewer.TriggerDicomViewImageLock(Sender: TObject; ALock: Boolean);
begin
  if ALock then
    inc(FLockCount)
  else
    Dec(FLockCount);
  if assigned(FOnDicomLockChange) then
    FOnDicomLockChange(self, FLockCount);
end;

procedure TDicomMultiViewer.TriggerDicomViewDblClick(Sender: TObject);
var
  i: Integer;
  v1: TCustomDicomImage;
begin
  TCustomDicomImage(Sender).fMouseDragging := false;

  if FDblClickToFullSeries then
  begin
    {$IFDEF DICOMDEBUG}
    SendDebug('TriggerDicomViewDblClick');
    {$ENDIF}

    if (Rows * Columns = 1) and (fFullSeriesView = nil) then
      exit;
    if fFullSeriesView = nil then
    begin
      fOldRows := Rows;
      fOldColumn := Columns;
      fOldCurrentImage := CurrentImage;
      fFullSeriesView := TCustomDicomImage(Sender);
      fOldSeriesUID := SeriesUID;
      for i := Views.Count - 1 downto 0 do
      begin
        if Items[i] <> fFullSeriesView then
        begin
          v1 := Items[i];
          self.RemoveControl(Items[i]);
          //FViews.Delete(i);
          v1.Free;
          //Items[i].Free;
        end;
      end;

      FViews.Clear;
      FViews.Add(fFullSeriesView);
      fRows := 1;
      fColumns := 1;
      FCurrentImage := fFullSeriesView.AttributesIndex;

      fOldPosition := Rect(fFullSeriesView.Left, fFullSeriesView.Top, fFullSeriesView.Width, fFullSeriesView.Height);

      fFullSeriesView.Left := 0;
      fFullSeriesView.Top := 0;
      fFullSeriesView.Width := width;
      fFullSeriesView.Height := height;

      fFullSeriesView.fJustDBLCLick := true;
      //CurrentImage := TCustomDicomImage(Sender).AttributesIndex;
    end
    else
    begin
      {for i := 0 to Views.Count - 1 do
      begin
        if Items[i] <> fFullSeriesView then
        begin
          Items[i].Visible := true;
        end;
      end;}
      fRows := fOldRows;
      fColumns := fOldColumn;

      fFullSeriesView.Left := fOldPosition.Left;
      fFullSeriesView.Top := fOldPosition.Top;
      fFullSeriesView.Width := fOldPosition.Right;
      fFullSeriesView.Height := fOldPosition.Bottom;
      fFullSeriesView.fJustDBLCLick := true;
      //fFullSeriesView.fMouseDragging := false;
      fFullSeriesView := nil;
      if fOldSeriesUID = SeriesUID then
        fCurrentImage := fOldCurrentImage;
      Update;
    end;
  end
  else
    if assigned(TCustomDicomImage(sender).Attributes) then
  begin
    //SetActiveViewFullScreen(FFullScreenView = nil);
    if assigned(fOnViewDblClickSelect) then
      fOnViewDblClickSelect(sender);
  end;
end;

{procedure TDicomMultiViewer.TriggerDicomViewPopupClick(Sender: TObject; ATag: Integer);
begin
  if assigned(OnPopupClick) then
    OnPopupClick(sender, ATag);
end;}

procedure TDicomMultiViewer.TriggerDicomViewKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
var
  i: integer;
  v2, v1, V3: TCustomDicomImage;
  //  f1, f2, t1: Single;
  w1, l1: Integer;
  str1: string;
begin
  {$IFDEF DICOMDEBUG}
  SendDebug(Format('Key Down: %d', [Key]));
  {$ENDIF}
  //if (ssCtrl in Shift) or (ssAlt in Shift) or (ssShift in Shift) then
  //  exit;
  if assigned(FOnViewKeyDown) then
    FOnViewKeyDown(sender, key, shift);
  v1 := TCustomDicomImage(Sender);
  if (not assigned(FDicomDatasets)) or v1.LockImage then
  begin
    case Key of
      83:
        begin
          str1 := v1.Attributes.GetString($20, $11);
          repeat
            v1.Next;
            if v1.AttributesIndex >= (v1.DicomDatasets.Count - 1) then
            begin
              v1.AttributesIndex := -1;
              break;
            end;
          until str1 <> v1.Attributes.GetString($20, $11);
        end;
      78:
        begin
          for i := 0 to getCount - 1 do
          begin
            v3 := GetItem(i);
            if v3.LockImage then
              v3.next;
          end;
        end;
      66:
        begin
          for i := 0 to getCount - 1 do
          begin
            v3 := GetItem(i);
            if v3.LockImage then
              v3.prior;
          end;
        end;

      VK_DOWN:

        if (fLimitOneSeries) and (fSeriesUID <> '') then
        begin
          if ((v1.AttributesIndex + 1) < DicomDatasets.GetSeriesEnd(fSeriesUID)) then
          begin
            if DicomDatasets.Item[v1.AttributesIndex +
              1].Attributes.GetString(dSeriesInstanceUID)
              <> fSeriesUID then
            begin
              exit;
            end
            else
              v1.Next;
            if assigned(FOnViewSelected) then
              FOnViewSelected(Sender);
          end;
        end;
      {VK_PAGEUP:
        begin

        end;
      VK_PAGEDOWN:
        begin

        end; }
      VK_UP:
        if (fLimitOneSeries) and (fSeriesUID <> '') then
        begin
          if (v1.AttributesIndex > (DicomDatasets.GetSeriesStart(SeriesUID) + 1)) then
          begin
            if DicomDatasets.Item[v1.AttributesIndex -
              1].Attributes.GetString(dSeriesInstanceUID)
              <> fSeriesUID then
            begin
              exit;
            end
            else
              v1.Prior;

            if assigned(FOnViewSelected) then
              FOnViewSelected(Sender);
          end;
        end;
      VK_RIGHT:
        begin
          if v1.AttributesIndex < v1.DicomDatasets.Count - 1 then
          begin
            v1.MouseInControl := false;
            v1.Invalidate;
            i := FViews.IndexOf(v1);
            if i < FColumns * FRows - 1 then
              inc(i)
            else
              i := 0;
            v2 := Items[i];
            v2.DicomDatasets := v1.DicomDatasets;
            v2.AttributesIndex := v1.AttributesIndex + 1;
            if assigned(fOnDatasetChanged) then
              fOnDatasetChanged(v2);

            //            v2.Attributes := v2.DicomDatasets[v2.AttributesIndex].Attributes;
            if not v1.Attributes.IsImageChange then
              v2.SetWinLevel(v1.Attributes.ImageData.WindowWidth,
                v1.Attributes.ImageData.WindowCenter);
            v2.BeginUpdate;
            v2.Scale := v1.Scale * (v2.Height / v1.Height);
            v2.OffsetHorz := v1.OffsetHorz;
            v2.OffsetVert := v1.OffsetVert;
            v2.MouseInControl := true;

            v2.Attributes.ImageData.VerFlip := v1.Attributes.ImageData.VerFlip;
            v2.Attributes.ImageData.HozFlip := v1.Attributes.ImageData.HozFlip;
            v2.Attributes.ImageData.Rotate := v1.Attributes.ImageData.Rotate;
            v2.EndUpdate;
            v2.UpdateX;
            v2.SetFocus;
            v2.LeftMouseInteract := v1.LeftMouseInteract;
            FActiveView := v2;
            v2.Selected := true;
            v1.Selected := false;

          end;
        end;
      VK_LEFT:
        begin
          if v1.AttributesIndex > 0 then
          begin
            v1.MouseInControl := false;
            v1.Invalidate;
            i := FViews.IndexOf(v1);
            if i > 0 then
              dec(i)
            else
              i := FColumns * FRows - 1;
            v2 := Items[i];
            v2.DicomDatasets := v1.DicomDatasets;
            v2.AttributesIndex := v1.AttributesIndex - 1;
            if assigned(fOnDatasetChanged) then
              fOnDatasetChanged(v2);
            //            v2.Attributes := v2.DicomDatasets[v2.AttributesIndex].Attributes;
            v2.BeginUpdate;
            //            v2.Scale := v1.Scale;
            v2.Scale := v1.Scale * (v2.Height / v1.Height);
            if not v1.Attributes.IsImageChange then
              v2.SetWinLevel(v1.Attributes.ImageData.WindowWidth,
                v1.Attributes.ImageData.WindowCenter);
            v2.OffsetHorz := v1.OffsetHorz;
            v2.OffsetVert := v1.OffsetVert;
            v2.MouseInControl := true;
            v2.Attributes.ImageData.VerFlip := v1.Attributes.ImageData.VerFlip;
            v2.Attributes.ImageData.HozFlip := v1.Attributes.ImageData.HozFlip;
            v2.Attributes.ImageData.Rotate := v1.Attributes.ImageData.Rotate;
            v2.EndUpdate;
            v2.UpdateX;
            v2.SetFocus;
            v2.LeftMouseInteract := v1.LeftMouseInteract;
            FActiveView := v2;
            v2.Selected := true;
            v1.Selected := false;
          end;
        end;
      VK_RETURN, VK_NUMPAD0..VK_F24:
        begin
          //CurrentImage := key - 96;
          if assigned(FOnSetPresetWidthLevel) then
          begin
            w1 := 0;
            l1 := 0;
            FOnSetPresetWidthLevel(Sender, key, Shift, w1, l1);
            if (w1 <> 0) and (l1 <> 0) then
              self.SetWinLevel(w1, l1);
          end;
        end;
    end;
  end
  else
  begin
    case Key of
      VK_LEFT:
        begin
          with TCustomDicomImage(Sender) do
            if assigned(Attributes) and (Attributes.ImageData.FrameCount > 1) then
            begin
              Attributes.ImageData.FrameIndex := Attributes.ImageData.FrameIndex - 1;
              if Attributes.ImageData.FrameIndex < 0 then
              begin
                Attributes.ImageData.FrameIndex := GetFrameCount - 1;
              end;
              SetCurrentFrame(Attributes.ImageData.FrameIndex);
              if assigned(FOnImageCineTo) then
                FOnImageCineTo(self, Attributes.ImageData.FrameIndex);
            end;
        end;
      VK_RIGHT:
        begin
          with TCustomDicomImage(Sender) do
            if assigned(Attributes) and (Attributes.ImageData.FrameCount > 1) then
            begin
              Attributes.ImageData.FrameIndex := Attributes.ImageData.FrameIndex + 1;
              if Attributes.ImageData.FrameIndex > GetFrameCount - 1 then
              begin
                Attributes.ImageData.FrameIndex := 0;
              end;
              SetCurrentFrame(Attributes.ImageData.FrameIndex);
              if assigned(FOnImageCineTo) then
                FOnImageCineTo(self, Attributes.ImageData.FrameIndex);
            end;
        end;
      VK_HOME:
        begin
          if ScrollBarVisible then
          begin
            CurrentImage := fScrollBar.Min;
            fScrollBar.Position := CurrentImage;
          end;

          if assigned(FOnViewSelected) then
            FOnViewSelected(Sender);
        end;
      VK_END:
        begin
          if ScrollBarVisible then
          begin
            CurrentImage := fScrollBar.Max;
            fScrollBar.Position := CurrentImage;
          end;

          if assigned(FOnViewSelected) then
            FOnViewSelected(Sender);
        end;
      VK_DOWN:
        begin
          {if CurrentImage < DicomDatasets.Count - 1 then
          begin
            CurrentImage := CurrentImage + 1;
            if assigned(FOnViewSelected) then
              FOnViewSelected(Sender);
          end;}

          if CurrentImage < DicomDatasets.Count - 1 then
            CurrentImage := CurrentImage + 1;

          if ScrollBarVisible then
            fScrollBar.Position := CurrentImage;
          if assigned(FOnViewSelected) then
            FOnViewSelected(Sender);

        end;
      VK_UP:
        begin
          {if CurrentImage > 0 then
          begin
            CurrentImage := CurrentImage - 1;
            if assigned(FOnViewSelected) then
              FOnViewSelected(Sender);
          end;}

          if CurrentImage > 0 then
            CurrentImage := CurrentImage - 1;

          if ScrollBarVisible then
            fScrollBar.Position := CurrentImage;

          if assigned(FOnViewSelected) then
            FOnViewSelected(Sender);
        end;
      VK_NEXT:
        begin
          if CurrentImage < DicomDatasets.Count - Rows * Columns - FLockCount - 1 then
          begin
            CurrentImage := CurrentImage + Rows * Columns - FLockCount;

            if ScrollBarVisible then
              fScrollBar.Position := CurrentImage;

            if assigned(FOnViewSelected) then
              FOnViewSelected(Sender);
          end;
        end;
      VK_PRIOR:
        if CurrentImage >= Rows * Columns then
        begin
          CurrentImage := CurrentImage - Rows * Columns - FLockCount;

          if ScrollBarVisible then
            fScrollBar.Position := CurrentImage;

          if assigned(FOnViewSelected) then
            FOnViewSelected(Sender);
        end;
      //VK_RETURN: ;
      //VK_DELETE: ;
      VK_PRINT:
        begin
          {$IFDEF USE_BITMAP32_VIEWER}
          if assigned(ActiveView) then
            ActiveView.Bitmap.AssignTo(Clipboard);
          {$ENDIF}
        end;
      VK_RETURN, VK_NUMPAD0..VK_F24:
        begin
          //CurrentImage := key - 96;
          if assigned(FOnSetPresetWidthLevel) then
          begin
            w1 := 0;
            l1 := 0;
            FOnSetPresetWidthLevel(Sender, key, Shift, w1, l1);
            if (w1 <> 0) and (l1 <> 0) then
              self.SetWinLevel(w1, l1);
          end;
        end;
    end;
  end;
end;

procedure TDicomMultiViewer.TriggerDicomViewMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if assigned(FMoveActiveView) and (Sender <> FMoveActiveView) then
  begin
    FMoveActiveView.MouseInControl := false;
    FMoveActiveView.FDrawPrintNoSelectIcon := false;

    FMoveActiveView.fWHint.Hide;

    FMoveActiveView.Invalidate;

  end;
  //  else
  if (Sender <> FMoveActiveView) then
  begin
    FMoveActiveView := TCustomDicomImage(Sender);
    FMoveActiveView.MouseInControl := true;
    FMoveActiveView.Invalidate;
  end;

  if assigned(FOnShowToolbarOrView) then
  begin
    if ((Y + TCustomDicomImage(Sender).Top) > 2) and ((Y + TCustomDicomImage(Sender).Top) < 8) then
      FOnShowToolbarOrView(Sender, 0)
    else
      if ((height - Y - TCustomDicomImage(Sender).Top) > 2) and ((height - Y -
      TCustomDicomImage(Sender).Top) < 8) then
      FOnShowToolbarOrView(Sender, 1)
    else
      if ((X + TCustomDicomImage(Sender).Left) > 2) and ((X + TCustomDicomImage(Sender).Left) < 8)
      then
      FOnShowToolbarOrView(Sender, 2)
    else
      if ((width - X - TCustomDicomImage(Sender).Left) > 2) and ((width - X -
      TCustomDicomImage(Sender).Left) < 8) then
      FOnShowToolbarOrView(Sender, 3)
    else
      FOnShowToolbarOrView(Sender, 4)
  end;
  if assigned(OnViewMouseMove) then
    OnViewMouseMove(Sender, Shift, X, Y);
end;

procedure TDicomMultiViewer.TriggerDicomViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  function GetLockView: Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 0 to FViews.Count - 1 do
      if TCustomDicomImage(FViews[i]).LockImage then
        Result := Result + 1;
  end;
  function IsInSelectRect: Boolean;
  var
    ux, uy: Integer;
  begin
    ux := 32;
    uy := 32;
    Result := (x < ux) and (y < uy);
  end;
  function IsInPrintSelectRect: Boolean;
  var
    ux, uy: Integer;
  begin
    ux := FActiveView.width - 32;
    uy := 32;
    Result := (x > ux) and (y < uy) and (y > 0);
  end;
var
  I{, K, k1, k2}: Integer;
  //  b1: Boolean;
begin
  (*if {(fLastShift = Shift) and}(fLastShiftDownView <> nil) then
  begin
    {if (ssShift in Shift) and (Button = mbLeft) then
    begin
      if (fLastShiftDownView <> Sender) then
      begin
        k := 0;
        k1 := FViews.IndexOf(fLastShiftDownView);
        k2 := FViews.IndexOf(Sender);
        for i := 0 to FDicomDatasets.Count - 1 do
          with FDicomDatasets.Item[i].Attributes do
          begin
            MultiSelected1 := false;

          end;

        for i := 0 to fViews.Count - 1 do
          Items[i].Invalidate;

        for i := Min(k1, k2) to Max(k1, k2) do
        begin
          if assigned(TCustomDicomImage(FViews[i]).Attributes) then
          begin
            TCustomDicomImage(FViews[i]).Attributes.MultiSelected1 := true;
            Items[i].Invalidate;
          end;
        end;
      end
      else
      begin
        if assigned(TCustomDicomImage(Sender).Attributes) then
        begin
          TCustomDicomImage(Sender).Attributes.MultiSelected1 := not TCustomDicomImage(Sender).Attributes.MultiSelected1;
          TCustomDicomImage(Sender).Invalidate;
        end;
      end;
    {end
    else
      if (ssCtrl in Shift) and (Button = mbLeft) then
    begin
      if (fLastShiftDownView <> Sender) then
      begin
        k := 0;
        k1 := FViews.IndexOf(fLastShiftDownView);
        k2 := FViews.IndexOf(Sender);
        for i := 0 to FDicomDatasets.Count - 1 do
          with FDicomDatasets.Item[i].Attributes do
          begin
            MultiSelected2 := false;
          end;

        for i := 0 to fViews.Count - 1 do
          Items[i].Invalidate;

        for i := Min(k1, k2) to Max(k1, k2) do
        begin
          if assigned(TCustomDicomImage(FViews[i]).Attributes) then
          begin
            TCustomDicomImage(FViews[i]).Attributes.MultiSelected2 := true;
            Items[i].Invalidate;
          end;
        end;
      end
      else
      begin
        if assigned(TCustomDicomImage(Sender).Attributes) then
        begin
          TCustomDicomImage(Sender).Attributes.MultiSelected2 := not TCustomDicomImage(Sender).Attributes.MultiSelected2;
          TCustomDicomImage(Sender).Invalidate;
        end;
      end;
  end;
  end;*)
  fLastShiftDownView := TCustomDicomImage(Sender);
  fLastShift := Shift;
  fLastButton := Button;

  if assigned(FOnMultiViewSelected) then
    FOnMultiViewSelected(self);

  if assigned(TCustomDicomImage(Sender).Attributes) then
  begin
    if assigned(FActiveView) and (Sender <> FActiveView) then
    begin
      FActiveView.selected := false;

      FActiveView.Invalidate;

    end;
    //  else
    if (Sender <> FActiveView) then
    begin
      FActiveView := TCustomDicomImage(Sender);
      FActiveView.selected := true;
      FActiveView.Invalidate;
      //showmessage('??');
    end;
    //  if FActiveView.CineActive then
    //    exit;
    if assigned(FDicomDatasets) then
    begin
      if IsInSelectRect then
      begin
        //        if assigned(FOnViewFlagChange) then
        //          FOnViewFlagChange(TCustomDicomImage(FActiveView).Attributes);
        if (ssCtrl in shift) then
        begin
          //      b1 := FDicomDatasets.Item[0].Attributes.ImageData.MultiSelected1;
          for i := 0 to FDicomDatasets.Count - 1 do
            with FDicomDatasets.Item[i].Attributes do
            begin
              MultiSelected1 := not MultiSelected1;
            end;
          CurrentImage := CurrentImage;
        end;
        {  end
          else
            if IsInPrintSelectRect then
          begin
            with (FActiveView).Attributes do
            begin
              ImageData.MultiSelected2 := not ImageData.MultiSelected2;
              if assigned(FOnViewFlagChange) then
                FOnViewFlagChange(TCustomDicomImage(FActiveView).Attributes);
            end;}
      end;
    end;
    {  if assigned(FActiveView) and assigned((FActiveView).Attributes) then
      begin
        (FActiveView).Attributes.ImageData.selected := true;
        (FActiveView).Invalidate;
      end;}
    //  if assigned(FActiveView.ImageData) then
    if assigned(FOnViewSelected) then
      FOnViewSelected(Sender);
  end;
  if ScrollBarVisible then
    if ActiveView.LockImage then
    begin
      fScrollBar.Position := ActiveView.AttributesIndex;
      fScrollBar.LargeChange := 1;
    end
    else
    begin
      fScrollBar.LargeChange := self.Rows * self.Columns - GetLockView;
      fScrollBar.Position := CurrentImage;
    end;
end;

procedure TDicomMultiViewer.RotalImage(r: Integer);
var
  i, k: Integer;
begin
  if assigned(FDicomDatasets) then
  begin
    //r := (ActiveView.Attributes.ImageData.Rotate + 1 ) mod 4;
    k := FDicomDatasets.GetSelectedCount;
    if k > 0 then
    begin
      for i := 0 to k - 1 do
      begin
        with (FDicomDatasets.Selected[i]).ImageData do
          Rotate := r;
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if (ActiveView.Attributes.MultiSelected4) then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if UpdateAllImageProperty then
          FDicomDatasets[i].Attributes.ImageData.Rotate := r
        else
        begin
          if (CanMultiSelect) and (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E))
            then
            FDicomDatasets[i].Attributes.ImageData.Rotate := r;
        end
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if UpdateAllImageProperty then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E)) then
          FDicomDatasets[i].Attributes.ImageData.Rotate := r;
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      with ActiveView do
      begin
        Attributes.ImageData.Rotate := r;
        UpdateX;
      end;
  end;
end;

{procedure TDicomMultiViewer.RRotalImage;
var
  i, k,r: Integer;
begin
  if assigned(FDicomDatasets) then
  begin
    r := (ActiveView.Attributes.ImageData.Rotate - 1 + 4) mod 4;
    k := FDicomDatasets.GetSelectedCount;
    if k > 0 then
    begin
      for i := 0 to k - 1 do
      begin
        with (FDicomDatasets.Selected[i]).ImageData do
          Rotate := r;
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if (not ActiveView.Attributes.MultiSelected4) then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if UpdateAllImageProperty then
          FDicomDatasets[i].Attributes.ImageData.Rotate := r
        else
        begin
          if self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E) then
            FDicomDatasets[i].Attributes.ImageData.Rotate := r
        end
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      with ActiveView do
      begin
        Attributes.ImageData.Rotate := r;
        UpdateX;
      end;
  end;
end; }

procedure TDicomMultiViewer.FitHeight;
var
  i: Integer;
begin
  for i := 0 to FViews.Count - 1 do
    with TCustomDicomImage(FViews[i]) do
      if assigned(Attributes) then
        Scale := (Height) / (bitmap.height);
end;

procedure TDicomMultiViewer.FitWidth;
var
  i: Integer;
begin
  for i := 0 to FViews.Count - 1 do
    with TCustomDicomImage(FViews[i]) do
      if assigned(Attributes) then
        Scale := (Width) / (bitmap.width);
end;

procedure TDicomMultiViewer.ResetImage;
var
  i: Integer;
  das1: TDicomAttributes;
begin
  //  if UpdateAllImageProperty then
//  begin
//    for i := 0 to FViews.Count - 1 do
//      TCustomDicomImage(FViews[i]).ResetImage;
//  end;
  if assigned(FDicomDatasets) then
  begin
    for i := 0 to FDicomDatasets.Count - 1 do
    begin
      das1 := FDicomDatasets.Item[i].Attributes;
      if das1.ImageData <> nil then
        das1.ImageData.Reset; {UseImageBuffer := false;
      das1.ImageData.Negative := false;
      das1.ImageData.Rotate := 0;
      das1.ImageData.VerFlip := false;
      das1.ImageData.HozFlip := False;
      das1.ImageData.WindowCenter := das1.ImageData.Attributes.getInteger($28, $1050);
      das1.ImageData.WindowWidth := das1.ImageData.Attributes.getInteger($28, $1051);
      das1.ImageData.LoadLutFromStream(nil);
      //      das1.imagedata.Zoom := 1;
      das1.ImageData.ViewerZoom := 1;
      das1.ImageData.OffsetX := 0;
      das1.ImageData.OffsetY := 0; }
    end;
    FDicomDatasets.ResetDataToStream;
  end;
  //  else
  //    ActiveView.ResetImage;
end;

procedure TDicomMultiViewer.DeleteLabel;
begin
  if assigned(ActiveView.Attributes) then
  begin
    //ActiveView.RemoveTextEdit;

    ActiveView.Attributes.ImageData.DrawObjects.RemoveAll;

    ActiveView.UpdateX;
    //    ActiveView.SaveLayerToAttributes;
        //    ActiveView.FTextIndex

  end;
end;

procedure TDicomMultiViewer.SetCurrentFrame(AValue: Integer);
var
  i, k: Integer;
begin
  if not assigned(FDicomDatasets) then
  begin
    ActiveView.SetCurrentFrame(AValue);
    exit;
  end;
  k := FDicomDatasets.GetSelectedCount;
  if k > 0 then
  begin
    for i := 0 to k - 1 do
    begin
      with (FDicomDatasets.Selected[i]) do
        SetCurrentFrame(AValue);
    end;
    for i := 0 to FViews.Count - 1 do
      TCustomDicomImage(FViews[i]).UpdateX;
  end
  else
    ActiveView.SetCurrentFrame(AValue);
end;

procedure TDicomMultiViewer.SetHozFlip(AValue: Boolean);
var
  i, k: Integer;
begin
  if assigned(FDicomDatasets) and assigned(ActiveView.Attributes) then
  begin

    k := FDicomDatasets.GetSelectedCount;
    if k > 0 then
    begin
      for i := 0 to k - 1 do
      begin
        (FDicomDatasets.Selected[i]).ImageData.HozFlip := AValue;
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if (ActiveView.Attributes.MultiSelected4) then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if UpdateAllImageProperty then
          FDicomDatasets[i].Attributes.ImageData.HozFlip := AValue
        else
        begin
          if (CanMultiSelect) and (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E))
            then
            FDicomDatasets[i].Attributes.ImageData.HozFlip := AValue
        end
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if (UpdateAllImageProperty) then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E)) then
          FDicomDatasets[i].Attributes.ImageData.HozFlip := AValue
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if assigned(ActiveView) then
    begin
      ActiveView.Attributes.ImageData.HozFlip := AValue;
      ActiveView.UpdateX;
    end;
  end;
end;

procedure TDicomMultiViewer.SetVerFlip(AValue: Boolean);
var
  i, k: Integer;
begin
  if assigned(FDicomDatasets) then
  begin

    k := FDicomDatasets.GetSelectedCount;
    if k > 0 then
    begin
      for i := 0 to k - 1 do
      begin
        (FDicomDatasets.Selected[i]).ImageData.VerFlip := AValue;
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if (ActiveView.Attributes.MultiSelected4) then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if UpdateAllImageProperty then
          FDicomDatasets[i].Attributes.ImageData.VerFlip := AValue
        else
        begin
          if (CanMultiSelect) and (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E))
            then
            FDicomDatasets[i].Attributes.ImageData.VerFlip := AValue
        end;
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;

    end
    else
      if UpdateAllImageProperty then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E)) then
          FDicomDatasets[i].Attributes.ImageData.VerFlip := AValue
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if assigned(ActiveView) then
    begin
      ActiveView.Attributes.ImageData.VerFlip := AValue;
      ActiveView.UpdateX;
    end;
  end;
end;

procedure TDicomMultiViewer.Negative(Value: Boolean);
var
  i, k: Integer;
begin
  if assigned(FDicomDatasets) then
  begin
    k := FDicomDatasets.GetSelectedCount;
    if k > 0 then
    begin

      for i := 0 to k - 1 do
      begin
        with FDicomDatasets.Selected[i].ImageData do
          Negative := Value;
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if (ActiveView.Attributes.MultiSelected4) then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if UpdateAllImageProperty then
        begin
          with FDicomDatasets[i].Attributes.ImageData do
            Negative := Value;
        end
        else
        begin
          if (CanMultiSelect) and (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E))
            then
            with FDicomDatasets[i].Attributes.ImageData do
              Negative := Value;
        end
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if UpdateAllImageProperty then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E)) then
          with FDicomDatasets[i].Attributes.ImageData do
            Negative := Value;
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if assigned(ActiveView) then
    begin
      ActiveView.Attributes.ImageData.Negative := Value;
      ActiveView.UpdateX;
    end;
  end;
end;

procedure TDicomMultiViewer.SetWinLevel(AWin, ALevel: Integer);
var
  i, k: Integer;
  //  b1: Boolean;
begin
  if assigned(FDicomDatasets) and (FDicomDatasets.Count > 0) then
  begin
    k := FDicomDatasets.GetSelectedCount;
    if k > 0 then
    begin
      for i := 0 to k - 1 do
      begin
        FDicomDatasets.Selected[i].ImageData.WindowWidth := AWin;
        FDicomDatasets.Selected[i].ImageData.WindowCenter := ALevel;
      end;
      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if ActiveView.Attributes.MultiSelected4 then
    begin
      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if UpdateAllImageProperty then
        begin
          FDicomDatasets[i].Attributes.ImageData.WindowWidth := AWin;
          FDicomDatasets[i].Attributes.ImageData.WindowCenter := ALevel;
        end
        else
        begin
          if (CanMultiSelect) and (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E))
            then
          begin
            FDicomDatasets[i].Attributes.ImageData.WindowWidth := AWin;
            FDicomDatasets[i].Attributes.ImageData.WindowCenter := ALevel;
          end
        end;
      end;

      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;

    end
    else
      if UpdateAllImageProperty then
    begin

      for i := 0 to FDicomDatasets.Count - 1 do
      begin
        if (self.SeriesUID = FDicomDatasets[i].Attributes.GetString($20, $E)) then
        begin
          FDicomDatasets[i].Attributes.ImageData.WindowWidth := AWin;
          FDicomDatasets[i].Attributes.ImageData.WindowCenter := ALevel;
        end
      end;

      for i := 0 to FViews.Count - 1 do
        TCustomDicomImage(FViews[i]).UpdateX;
    end
    else
      if assigned(ActiveView) then
      ActiveView.SetWinLevel(AWin, ALevel);
  end;
end;

procedure TDicomMultiViewer.SetDisplayLabel(AValue: Boolean);
var
  i: Integer;
begin
  if fDisplayLabel <> AValue then
  begin
    fDisplayLabel := AValue;
    for i := 0 to FViews.Count - 1 do
    begin
      TCustomDicomImage(FViews[i]).DisplayLabel := AValue;
    end;
  end;
end;

procedure TDicomMultiViewer.SetLeftMouseInteract(v: TMouseInteract);
var
  i: Integer;
begin
  fLeftMouseInteract := v;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).LeftMouseInteract := v;
  if v <> miNone then
    self.LeaderMouserInspect := ldmiNone;
end;

procedure TDicomMultiViewer.SetRightMouseInteract(v: TMouseInteract);
var
  i: Integer;
begin
  fRightMouseInteract := v;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).RightMouseInteract := v;
  if v <> miNone then
    self.LeaderMouserInspect := ldmiNone;
end;

procedure TDicomMultiViewer.SetMouseWheelInteract(v: TMouseWheelInteract);
var
  i: Integer;
begin
  fMouseWheelInteract := v;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).MouseWheelInteract := v;
end;

procedure TDicomMultiViewer.SetOnlyViewMultiSelected1(Value: Boolean);
begin
  if fOnlyViewMultiSelected1 <> Value then
  begin
    fOnlyViewMultiSelected1 := Value;
    if fDicomDatasets <> nil then
      fDicomDatasets.OnlyViewMultiSelected1 := fOnlyViewMultiSelected1;
    Update;
  end;
end;

procedure TDicomMultiViewer.SetOnlyViewMultiSelected2(Value: Boolean);
begin
  if fOnlyViewMultiSelected2 <> Value then
  begin
    fOnlyViewMultiSelected2 := Value;
    if fDicomDatasets <> nil then
      fDicomDatasets.OnlyViewMultiSelected2 := fOnlyViewMultiSelected2;
    //    Update;
  end;
end;

procedure TDicomMultiViewer.SetOnlyViewMultiSelected3(Value: Boolean);
begin
  if fOnlyViewMultiSelected3 <> Value then
  begin
    fOnlyViewMultiSelected3 := Value;
    if fDicomDatasets <> nil then
      fDicomDatasets.OnlyViewMultiSelected3 := fOnlyViewMultiSelected3;
    Update;
  end;
end;

procedure TDicomMultiViewer.SetOnlyViewMultiSelected4(Value: Boolean);
begin
  if fOnlyViewMultiSelected4 <> Value then
  begin
    fOnlyViewMultiSelected4 := Value;
    if fDicomDatasets <> nil then
      fDicomDatasets.OnlyViewMultiSelected4 := fOnlyViewMultiSelected4;
    Update;
  end;
end;

function TDicomMultiViewer.GetActiveView: TCustomDicomImage;
begin
  if assigned(FActiveView) then
    Result := FActiveView
  else
    if FViews.Count > 0 then
  begin
    Result := Items[0];
    //showmessage('?');
  end
  else
    raise Exception.Create('The Series have not active view');
end;

procedure TDicomMultiViewer.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TDicomMultiViewer.DoFinishNewDrawObject(Sender: TObject; AObject: TDicomDrawObject);
begin
  if assigned(fAfterNewDrawObject) then
    fAfterNewDrawObject(Sender, AObject);
end;

procedure TDicomMultiViewer.DoDrawObjectSize(Sender: TObject; AObject: TDicomDrawObject);
begin
  if assigned(fAfterObjectSize) then
    fAfterObjectSize(Sender, AObject);
end;

procedure TDicomMultiViewer.DoDrawObjectMove(Sender: TObject; AObject: TDicomDrawObject);
begin
  if assigned(fAfterObjectMove) then
    fAfterObjectMove(Sender, AObject);
end;

procedure TDicomMultiViewer.WMSize(var Message: TWMSize);
begin
  inherited;

  //  Update;
end;

procedure TDicomMultiViewer.Loaded;
begin
  Update;
  inherited;
end;

constructor TDCMMultiImage.Create(AOwner: TComponent);
begin
  inherited;
  FDefaultRows := 1;
  fIconData := nil;
  FAutoChangeSeriesMode := true;
  FAutoGrid := true;
  FCanDelete := false;
  FGridVisible := false;
  FViewGridMode := vgmStandardGrid;
  FViewGridSetting := '1,1';

  fLeftMouseInteract := miNone;
  fCurrentAttributes := nil;

  fShowSeriesDescription := false;
  FFont := TFont.Create;
end;

destructor TDCMMultiImage.Destroy;
begin
  FFont.Free;
  inherited;
end;

procedure TDCMMultiImage.Resize;
//var
//  w, h: Integer;
//  r: TRect;
begin
  if FAutoGrid and (Height <> 0) and (Width <> 0) then
  begin
    if Width > Height then
    begin
      Row := Width div (Height div FDefaultRows);
      Column := FDefaultRows;
    end
    else
    begin
      Column := Height div (Width div FDefaultRows);
      Row := FDefaultRows;
    end;
  end;
  inherited;
end;

function TDCMMultiImage.GetDatasetIndex: Integer;
begin
  Result := -1;
  if (CurrentSelectedIndex >= 0) and (CurrentSelectedIndex < GetImageCount) then
  begin
    if (FViewGridMode = vgmStandardgrid) or (FViewGridMode = vgmPrintGrid) then
      Result := CurrentSelectedIndex
    else
      if FViewGridMode = vgmSeriesGrid then
    begin
      Result := FDicomDatasets.IndexOf(FDicomDatasets.SeriesDataset[CurrentSelectedIndex]);
    end;
  end;
end;

procedure TDCMMultiImage.ExecDrawBitmap(Dest: TCnsBitmap32; StageNum: Integer);
  procedure BitmapDrawTo(Bitmap, Dst: TCnsBitmap32; const DstRect: TRect);
  var
    Cx, Cy: integer;
    height, Width: integer;
    ScaleX, ScaleY: Single;
    FDestRect: TRect;
    FOffsetHorz, FOffsetVert: Double;
  begin
    if Bitmap.Empty then
      exit;
    Width := DstRect.Right - DstRect.Left;
    height := DstRect.Bottom - DstRect.Top;
    Cx := Bitmap.Width;
    Cy := Bitmap.Height;
    ScaleX := Width / Cx;
    ScaleY := Height / Cy;
    if ScaleX >= ScaleY then
    begin
      Cx := Round(Cx * ScaleY);
      Cy := Height;
    end
    else
    begin
      Cx := Width;
      Cy := Round(Cy * ScaleX);
    end;
    FOffsetHorz := (Width - cx) div 2 + DstRect.Left;
    FOffsetVert := (height - cy) div 2 + DstRect.Top;
    FDestRect := Rect(0, 0, Cx, Cy);
    OffsetRect(FDestRect, Round(FOffsetHorz), Round(FOffsetVert));
    Bitmap.DrawTo(Dst, FDestRect);
  end;
var
  i, n, h, ww, w, hh: Integer;
  r: TRect;
  Bm1: TCnsBitmap32;
  d1: TDicomImage;
  da1: TDicomDataset;
  b1: Boolean;
  str1, v_modality : string;
  MyJPG : TJPEGImage;
  v_bmp : TBitmap;
  ResStream : TResourceStream;
  procedure pLoadMiniPict ( pi : integer );
  begin
    MyJPG := TJPEGImage.Create;
    try
      ResStream := TResourceStream.CreateFromID(HInstance, pi, RT_RCDATA);
      try
        MyJPG.LoadFromStream(ResStream);
        v_bmp := TBitmap.Create;
        try
          v_bmp.Assign(MyJPG);
          Dest.Canvas.Draw(0,0,v_bmp);
        finally
          v_bmp.Free;
        end;
      finally
        ResStream.Free;
      end;
    finally
      MyJPG.Free;
    end;
  end;
//label l1;
//var j : integer;
begin
  if (not FBufferMode) then
  begin
    if assigned(FDicomDatasets) and (FDicomDatasets.Count > 0) then
    begin
      n := GetImageCount;
      case FViewGridMode of
        vgmStandardgrid, vgmSeriesGrid:
          begin
            for i := 0 to min(n, Column * Row) - 1 do
            begin
           //   i:=j;
           //   l1: //if i>min(n, Column * Row) - 1 then Break;
              r := SpritRect(i);
              if (CurrentImage + i) < n then
              begin
                
                if FViewGridMode = vgmSeriesGrid then
                  da1 := FDicomDatasets.SeriesDataset[CurrentImage + i]
                else
                  da1 := FDicomDatasets[CurrentImage + i];

                //da1 := FDicomDatasets[CurrentImage + i].Attributes;

                d1 := da1.Attributes.ImageData;

                v_modality := da1.Attributes.GetString( $8, $60 ) ;

                if ((da1.Attributes.GetString( $42, $12 )='application/pdf') and
                    Assigned(da1.Attributes.Item[ $42,$11 ]) )
                then begin
                  pLoadMiniPict(3);
                  Break;
                end else if ( (v_modality='ECG') and (FDicomDatasets[0].Attributes.WaveformData<>nil) ) then
                begin
                  pLoadMiniPict(1);
                  Break;
                end else if ((v_modality='SR') or
                    Assigned( da1.Attributes.Item[ $8, $1199 ] ) or
                    Assigned( da1.Attributes.Item[ $40, $A073 ] ) or
                    Assigned( da1.Attributes.Item[ $40,$A043 ]) or
                    Assigned( da1.Attributes.Item[ $40,$A730 ]) )
                then begin
                  pLoadMiniPict(2);
                  Break;
                end else if not assigned(d1) then
                begin
                  pLoadMiniPict(4);
                  Break;
                end;

               { if not assigned(d1) then
                  exit; }
                //          b1 := TextOverlayMode;
                //          TextOverlayMode := true;
                bm1 := TCnsBitmap32.Create;
                try
                  DCM_ImageData_Bitmap32.AssignToBitmapDefault(d1, BM1);
                  //BM1 := da1.Icon;

                  {$IFDEF FOR_TENFENG_MR}
                  d1.DrawTopoLineTF(bm, 1, 0, 0);
                  {$ENDIF}
                  //          b1 := d1.Attributes.GetString(8, $60) = 'VR';
                  b1 := d1.Attributes.getInteger($2811, $020D) = 1;
                  if b1 then
                  begin
                    DCM_ImageData_Bitmap32.LoadUserDrawObjectToBitmap(d1, BM1);
                  end;
                  //          TextOverlayMode := b1;

                  if i = CurrentSelectedIndex then
                  begin
                    {Dest.LineS(r.Left, r.Top, r.Right, r.Top, clRed32);
                    Dest.LineS(r.Left, r.Top, r.Left, r.Bottom, clRed32);
                    Dest.LineS(r.Right - 1, r.Bottom - 1, r.Right - 1, r.Top, clRed32);
                    Dest.LineS(r.Right - 1, r.Bottom - 1, r.Left, r.Bottom - 1, clRed32);}
                    Dest.FillRect(r.Left, r.Top, r.Right, r.Bottom, clRed32);
                  end;
                  BitmapDrawTo(BM1, Dest, r);
                finally
                  bm1.Free;
                end;
                //Dest.Font.Color := clRed;
                //Dest.Font.Size := 12;
                if FViewGridMode = vgmSeriesGrid then
                begin
                  Dest.Font.Assign(fFont);
                  fFont.Color := clYellow;
                  Dest.Textout(r.Left, r.Top, IntToStr(1 + FDicomDatasets.GetCurrentSeriesIndex(FDicomDatasets.SeriesDataset[CurrentImage + i])) + ':' +
                    IntToStr(FDicomDatasets.GetSeriesImageCount(FDicomDatasets.SeriesDataset[CurrentImage + i])) + ' Images');
                  Dest.Textout(r.Left, r.Top + Dest.TextHeight('A') + 2,
                    da1.Attributes.GetString($8, $103E));
                end
                else
                begin
                  Dest.Font.Assign(fFont);
                  fFont.Color := clYellow;
                  Dest.Textout(r.Left, r.Top, IntToStr(1 + FDicomDatasets.IndexOf(FDicomDatasets[CurrentImage + i])) + ':' +
                    'No.' + IntToStr(d1.InstanceNumber));
                  if b1 then
                  begin
                    //Dest.Font.Size := 9;
                    hh := Dest.TextHeight('A');

                    str1 := da1.Attributes.GetString($18, $15);
                    ww := Dest.TextWidth(str1);
                    Dest.RenderText(r.right - ww, r.Top, str1, 0, clBlue32);

                    str1 := da1.Attributes.GetString($8, $103E);
                    ww := Dest.TextWidth(str1);
                    Dest.RenderText(r.right - ww, r.Top + hh, str1, 0, clBlue32);
                  end;
                  if da1.Attributes.MultiSelected2 then
                    Dest.FillRectS(r.Left, r.Top, r.Left + 20, r.Top + 20, clYellow32);
                end;

              end
              else
                break;
            end;
          end;
      end;
    end
    else
    begin
      inherited ExecDrawBitmap(Dest, Stagenum);

    end;
    if FGridVisible then
    begin
      case FViewGridMode of
        vgmStandardgrid:
          begin
            R := GetViewportRect;

            h := (R.Right - R.Left) div Row;
            for i := 0 to Row - 1 do
            begin
              Dest.LineS(h * i, 0, h * i, Height, clWhite32);
            end;
            h := (R.Bottom - R.Top) div Column;
            for i := 0 to Column - 1 do
            begin
              Dest.LineS(0, h * i, Width, h * i, clWhite32);
            end;
          end;
      end;
    end;
  end
  else
  begin
    inherited ExecDrawBitmap(Dest, Stagenum);
    if FGridVisible then
    begin
      case FViewGridMode of
        vgmStandardgrid, vgmSeriesGrid, vgmPrintGrid:
          begin
            R := GetViewportRect;

            w := (R.Right - R.Left) div Row;
            for i := 0 to Row - 1 do
            begin
              Dest.LineS(w * i, 0, w * i, Height, clWhite32);
            end;
            h := (R.Bottom - R.Top) div Column;
            for i := 0 to Column - 1 do
            begin
              Dest.LineS(0, h * i, Width, h * i, clWhite32);
            end;
          end;
        vgmMixColGrid:
          begin

          end;
      end;
    end;
  end;
end;

procedure TDCMMultiImage.SetDicomDatasets(Value: TDicomDatasets);
begin
  try
    FDicomDatasets := Value;
    UpdateDatasetToIcons; //
    //UpdateScrollBars;
    Changed;
  except
    Value:=Value;
  end;
end;

procedure TDCMMultiImage.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if not BufferMode then
    UpdateScrollBars;

  LastMousePos := Point(X, Y);
  fCurrentAttributes := nil;
  fCurrentBitmapItem := nil;
  if (CurrentSelectedIndex < 0) or ((CurrentImage + CurrentSelectedIndex) >= GetImageCount) then
    exit;
  if (FViewGridMode = vgmStandardgrid) or (FViewGridMode = vgmPrintGrid) then
  begin
    fCurrentAttributes := FDicomDatasets[CurrentImage + CurrentSelectedIndex].Attributes;
    if fCurrentAttributes <> nil then
    begin
      if Bitmaps.Count > 0 then
        fCurrentBitmapItem := TCnsBitmap32ExItem(Bitmaps.Items[CurrentImage + CurrentSelectedIndex]);
      if ssShift in Shift then
      begin
        fCurrentAttributes.MultiSelected2 := not fCurrentAttributes.MultiSelected2;
        if assigned(FOnViewFlagChange) then
          FOnViewFlagChange(fCurrentAttributes);
      end;
      if ssCtrl in Shift then
      begin
        fCurrentAttributes.MultiSelected1 := not fCurrentAttributes.MultiSelected1;
        if assigned(FOnViewFlagChange) then
          FOnViewFlagChange(fCurrentAttributes);
      end;
    end;
  end
  else
    if (FViewGridMode = vgmSeriesGrid) then
  begin
    fCurrentAttributes := FDicomDatasets.SeriesDataset[CurrentImage +
      CurrentSelectedIndex].Attributes;
    if Bitmaps.Count > 0 then
      fCurrentBitmapItem := TCnsBitmap32ExItem(Bitmaps.Items[CurrentImage + CurrentSelectedIndex]);
  end;
  if FViewGridMode = vgmPrintGrid then
  begin
    fMouseDragging := true;
    if Button = mbLeft then
    begin
      case fLeftMouseInteract of
        miWindow:
          begin
            Cursor := dcmcr_WINDOW;
          end;
        miZoom:
          begin
            Cursor := dcmcr_ZOOMMENO;
          end;
        miScroll:
          begin
            Cursor := crSizeAll;
          end;
      end;
    end
    else
      if Button = mbRight then
    begin
      Cursor := dcmcr_WINDOW;
    end;
  end;
end;

procedure TDCMMultiImage.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Dx, Dy: Integer;
begin
  inherited;
  if fMouseDragging and assigned(fCurrentAttributes) then
  begin
    Dx := X - LastMousePos.X;
    Dy := Y - LastMousePos.Y;
    case Cursor of
      crSizeAll:
        begin
          fCurrentAttributes.ImageData.OffsetX := fCurrentAttributes.ImageData.OffsetX + DX;
          fCurrentAttributes.ImageData.OffsetY := fCurrentAttributes.ImageData.OffsetY + DY;
          if fCurrentBitmapItem <> nil then
            UpdateBitmapitem(fCurrentBitmapItem);
          Invalidate;
        end;
      dcmcr_ZOOMMENO:
        begin
          fCurrentAttributes.ImageData.ViewerZoom := fCurrentAttributes.ImageData.ViewerZoom - (dx
            + dy) / 500;
          if fCurrentBitmapItem <> nil then
            UpdateBitmapitem(fCurrentBitmapItem);
          Invalidate;
        end;
      dcmcr_WINDOW:
        begin
          fCurrentAttributes.ImageData.WindowWidth := fCurrentAttributes.ImageData.WindowWidth + Dx;
          if DefaultWindowMouseMode then
            fCurrentAttributes.ImageData.WindowCenter := fCurrentAttributes.ImageData.WindowCenter + Dy
          else
            fCurrentAttributes.ImageData.WindowCenter := fCurrentAttributes.ImageData.WindowCenter - Dy;
          if fCurrentBitmapItem <> nil then
            UpdateBitmapitem(fCurrentBitmapItem);
          Invalidate;
        end;
    end;
  end;
  LastMousePos := Point(X, Y);
end;

procedure TDCMMultiImage.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  fMouseDragging := false;
  Cursor := crDefault;
end;

function TDCMMultiImage.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  {if WheelDelta > 0 then
          Scale := Scale * (1 + 0.05)
        else
          Scale := Scale * (1 - 0.05); }
end;

procedure TDCMMultiImage.SetViewGridMode(Value: TViewGridMode);
begin
  if fViewGridMode <> Value then
  begin
    fViewGridMode := Value;
    CurrentImage := 0;
    CurrentSelectedIndex := -1;
    UpdateDatasetToIcons;
    invalidate;
  end;
end;

procedure TDCMMultiImage.SetCurrentIndex(Value: integer);
begin
  inherited

end;

procedure TDCMMultiImage.DblClick;
var
  k: integer;
  ADataset: TDicomDataset;
  InstanceUID: string;
begin
  inherited;
  if assigned(DicomDatasets) then
    if FAutoChangeSeriesMode then
    begin
      k := GetImageCount;
      if {(FViewGridMode = vgmStandardGrid) and} fCanDelete and ((CurrentImage + CurrentSelectedIndex) < k) then
      begin
        if MessageDlg(cns_Confirm_Delete_Image, mtWarning, [mbYes, mbNo], 0) = mrYes then
        begin
          ADataset := DicomDatasets[CurrentImage + CurrentSelectedIndex];
          ADataset.DeleteImageFile := true;
          //      if assigned(ADataset.ImageStream) then
          //        ADataset.SetStreamAndFileName(ADataset.ImageStream, '');
          if assigned(FLocalImagesTable) then
          begin
            InstanceUID := ADataset.Attributes.GetString($8, $18);
            if FLocalImagesTable.Locate('INSTANCEUID', InstanceUID, []) then
            begin
              FLocalImagesTable.Delete;
              //          FLocalImagesTable.ApplyUpdates;
            end;
          end;
          DicomDatasets.Delete(CurrentImage + CurrentSelectedIndex);

          if CurrentImage >= (k - 1) then
            CurrentImage := 0;
          UpdateDatasetToIcons;
          Changed;
          //      self.SetFocus;
          CurrentSelectedIndex := -1;
        end;
      end
      else
      begin
        if (not FBufferMode) then
        begin
          if FViewGridMode = vgmStandardGrid then
          begin
            FViewGridMode := vgmSeriesGrid;
            CurrentImage := 0; //FDicomDatasets.GetCurrentSeriesIndex(FDicomDatasets[CurrentImage
            // + CurrentSelectedIndex]);
            invalidate;
          end
          else
            if FViewGridMode = vgmSeriesGrid then
          begin
            FViewGridMode := vgmStandardGrid;
            CurrentImage :=
              FDicomDatasets.GetCurrentSeriesStart(FDicomDatasets.SeriesDataset[CurrentImage
              + CurrentSelectedIndex]);
          end;
        end;
        UpdateScrollBars;
      end;
    end;
end;

procedure TDCMMultiImage.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, operation);
  if Operation = opRemove then
  begin
    if (AComponent = FDicomDatasets) then
    begin
      FDicomDatasets := nil;
      Invalidate;
    end;
  end;
end;

constructor TDicomHint.Create(Owner: TComponent);
begin
  inherited;
  fFont := TFont.Create;
  visible := false;
  Color := $E0FFFF;
  Font.Color := clBlack;
  Canvas.Brush.Style := bsClear;
end;

destructor TDicomHint.Destroy;
begin
  fFont.free;
  inherited;
end;

procedure TDicomHint.WMNCHitTest(var Message: TWMNCHitTest);
begin
  Message.Result := HTTRANSPARENT;
end;

procedure TDicomHint.WMNCPaint(var Message: TMessage);
var
  R: TRect;
begin
  Canvas.Handle := GetWindowDC(Handle);
  with Canvas do
  try
    R := Rect(0, 0, Width, Height);
    DrawEdge(Handle, R, BDR_RAISEDOUTER, BF_RECT);
  finally
    ReleaseDC(Handle, Canvas.Handle);
    Canvas.Handle := 0;
  end;
end;

procedure TDicomHint.Paint;
begin
  canvas.Font.Assign(Font);
  Canvas.TextOut(1, 1, fText);
end;

procedure TDicomHint.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP or WS_BORDER;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
    if NewStyleControls then
      ExStyle := WS_EX_TOOLWINDOW;
  end;
end;

procedure TDicomHint.SetFont(f: TFont);
begin
  fFont.assign(f);
  Canvas.Font := fFont;
  invalidate;
end;

procedure TDicomHint.SetText(s: string);
var
  M: TMessage;
begin
  fText := s;
  Width := Canvas.TextWidth(fText) + 4;
  Height := Canvas.TextHeight(fText) + 4;
  WMNCPaint(M);
  invalidate;
end;

procedure TQCView.CheckBoxClick(Sender: TObject);
begin
  Invalidate;
end;

procedure TQCView.PrintByCanvas(ACanvas: TCanvas; AParamStr: string; ARect: TRect);
var
  I: Integer;
  h, w, k: Integer;
begin
  if AParamStr = '' then
    k := 1
  else
    k := StrToInt(Trim(AParamStr));
  w := ARect.Right - ARect.Left;
  h := ARect.Bottom - ARect.Top;
  if k = 1 then
    DrawLine(ACanvas, ARect.Left, ARect.Top, w, h)
  else
  begin
    for I := 0 to k - 1 do
    begin
      //        DrawLine(ACanvas, ARect.Left, ARect.Top + (h div k) * i, w, h div k);
    end; // for
  end;
end;

procedure TQCView.Print(Sender: TObject; APrintDC: HDC; AParamStr: string;
  ARect: TRect);
var
  //  I: Integer;
  Canvas1: TCanvas;
  h, w, k: Integer;
begin
  Canvas1 := TCanvas.Create;
  if AParamStr = '' then
    k := 1
  else
    k := StrToInt(Trim(AParamStr));
  try
    Canvas1.Handle := APrintDC;
    w := ARect.Right - ARect.Left;
    h := ARect.Bottom - ARect.Top;
    if k = 1 then
      DrawLine(Canvas1, ARect.Left, ARect.Top, w, h)
    else
    begin
      //          DrawLine(Canvas1, ARect.Left, ARect.Top + (h div k) * i, w, h div k);
    end;
  finally
    Canvas1.Free;
  end;
end;

procedure TQCView.SetTitle(Value: string);
begin
  FTitle := Value;
end;

procedure TQCView.SetTitleFont(Value: TFont);
begin
  { Use Assign method because TFont is an object type }
  FTitleFont.Assign(Value);
end;

procedure TQCView.Click;
begin
  { Call method of parent class }
  inherited Click;
end;

function TQCView.FindDateValue(ADate: TDatetime): TQCValueItem;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to fValueList.Count - 1 do
  begin
    if (TQCValueItem(fValueList[i]).fDate = ADate) then
    begin
      Result := TQCValueItem(fValueList[i]);
      break;
    end;
  end;
end;

function TQCView.GetAValL(AIndex: Integer): Double;
var
  n1: TQCValueItem;
begin
  n1 := FindDateValue(FBaseDate + AIndex - 1);
  if n1 <> nil then
    Result := n1.xl
  else
    Result := 0;
end;

function TQCView.GetAValM(AIndex: Integer): Double;
var
  n1: TQCValueItem;
begin
  n1 := FindDateValue(FBaseDate + AIndex - 1);
  if n1 <> nil then
    Result := n1.xm
  else
    Result := 0;
end;

function TQCView.GetAValH(AIndex: Integer): Double;
var
  n1: TQCValueItem;
begin
  n1 := FindDateValue(FBaseDate + AIndex - 1);
  if n1 <> nil then
    Result := n1.xh
  else
    Result := 0;
end;

procedure TQCView.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
end;

procedure TQCView.AddL(val: Real; adate: TDatetime);
var
  n1: TQCValueItem;
begin
  n1 := FindDateValue(ADate);
  if not assigned(n1) then
  begin
    n1 := TQCValueitem.Create;
    n1.fDate := ADate;
    fValueList.Add(n1);
    AddDate(ADate);
  end;
  n1.xl := val;
end;

procedure TQCView.AddM(val: Real; adate: TDatetime);
var
  n1: TQCValueItem;
begin
  n1 := FindDateValue(ADate);
  if not assigned(n1) then
  begin
    n1 := TQCValueitem.Create;
    n1.fDate := ADate;
    fValueList.Add(n1);
    AddDate(ADate);
  end;
  n1.xm := val;
end;

procedure TQCView.AddH(val: Real; adate: TDatetime);
var
  n1: TQCValueItem;
begin
  n1 := FindDateValue(ADate);
  if not assigned(n1) then
  begin
    n1 := TQCValueitem.Create;
    n1.fDate := ADate;
    fValueList.Add(n1);
    AddDate(ADate);
  end;
  n1.xh := val;
end;

procedure TQCView.Clear;
var
  i: Integer;
begin
  fBaseDate := StrToDate('3000-1-1');
  for i := 0 to fValueList.Count - 1 do
  begin
    TQCValueItem(fValueList[i]).Free;
  end;
  fValueList.Clear;
  ComboBox2.Items.Clear;
end;

procedure TQCView.ComboBox2Change(Sender: TObject);
{var
  str1: string;
  i: Integer;
  n1: TQCValueItem;}
begin
  FBaseDate := StrToDate(ComboBox2.Items[ComboBox2.itemindex]);

  {  str1 := '';
    for i := 0 to 31 do
    begin
      n1 := FindDateValue(FBaseDate + i);
      if n1 <> nil then
      begin
        str1:= str1+Format('%s=%f,%f,%f'#13#10,[DateToStr(n1.fDate),n1.xl,n1.xm,n1.xh]);
      end;
    end;
    ShowMessage(str1);}
  invalidate;
end;

procedure TQCView.AddDate(ADate: TDatetime);
var
  y, m, d: Word;
  str1: string;
begin
  if ADate < FBaseDate then
    FBaseDate := ADate;
  DecodeDate(ADate, y, m, d);
  str1 := Format('%d-%d-1', [y, m]);
  if ComboBox2.Items.IndexOf(str1) < 0 then
    ComboBox2.Items.Add(str1);
end;

constructor TQCView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fValueList := TList.Create;
  fHCal := TQCCal.Create;
  fLCal := TQCCal.Create;
  fMCal := TQCCal.Create;
  FTitle := 'Title';
  FTitleFont := TFont.Create;

  ComboBox2 := TComboBox.Create(Self);
  with ComboBox2 do
  begin
    Parent := self;
    Left := 2;
    Top := 3;
    Width := 100;
    Height := 20;
    Style := csDropDownList;
    ItemHeight := 12;
  end;
  ComboBox2.OnChange := ComboBox2Change;

  FMidLevelCheck := TCheckBox.Create(Self);
  with FMidLevelCheck do
  begin
    Parent := Self;
    Left := 150;
    Top := 3;
    Width := 40;
    Height := 17;
    Checked := true;
    OnClick := CheckBoxClick;
    Color := clGreen;
    Caption := 'Mid';
  end;
  FHighLevelCheck := TCheckBox.Create(Self);
  with FHighLevelCheck do
  begin
    Parent := Self;
    Left := 200;
    Top := 3;
    Width := 40;
    Height := 17;
    Checked := true;
    OnClick := CheckBoxClick;
    Color := clRed;
    Caption := 'High';
  end;
  FLowLevelCheck1 := TCheckBox.Create(Self);
  with FLowLevelCheck1 do
  begin
    Parent := Self;
    Left := 100;
    Top := 3;
    Width := 40;
    Height := 17;
    Checked := true;
    OnClick := CheckBoxClick;
    Caption := 'Low';
    Color := clBlue;
  end;

  ParentFont := False;
end;

destructor TQCView.Destroy;
var
  i: Integer;
begin
  for i := 0 to fValueList.Count - 1 do
  begin
    TQCValueItem(fValueList[i]).Free;
  end;
  fValueList.Free;
  FTitleFont.Free;
  HCal.Free;
  MCal.Free;
  LCal.Free;
  inherited Destroy;
end;

procedure TQCView.DrawLine(ACanvas: TCanvas; ALeft, ATop, AWidth, AHeight:
  Integer);
var
  zz, x1, x2: integer;
  y1, y2: integer;
  xx, i, gw, gh, sh, sw: integer;
  astr: string;
  //  TmpFont: TFont;
begin
  { Make this component look like its parent component by calling
    its parent's Paint method. }
//  TmpFont := TFont.Create;

  x1 := 40 + ALeft;
  //  xx := 0;
  x2 := ALeft + AWidth - 32;
  y1 := 48 + ATop;
  y2 := ATop + AHeight - 48;
  gw := x2 - x1;
  gh := y2 - y1;
  sw := gw div 31;
  zz := gw div 9;
  sh := gh div 8;
  { To change the appearance of the component, use the methods
    supplied by the component's Canvas property (which is of
    type TCanvas).  For example, }
  ACanvas.pen.Color := clBlack;
  ACanvas.MoveTo(x1, y1);
  ACanvas.LineTo(x1, y2);

  ACanvas.Font.Size := 12;
  //ACanvas.MoveTo(x1, y2);
  //ACanvas.LineTo(x2, y2);
  for i := 0 to 8 do
  begin
    if i in [2, 6] then
      ACanvas.pen.Width := 2
    else
      ACanvas.pen.Width := 1;
    if i in [3, 5] then
      ACanvas.Pen.Style := psDash
    else
      ACanvas.Pen.Style := psSolid;
    ACanvas.MoveTo(x1, y1 + sh * i);
    ACanvas.LineTo(x2, y1 + sh * i);
  end;
  ACanvas.Pen.Style := psDot;
  for i := 0 to 31 do
  begin
    ACanvas.MoveTo(x1 + i * sw, y1);
    ACanvas.LineTo(x1 + i * sw, y2 + 4);
    if (i mod 2) = 1 then
      ACanvas.TextOut(x1 + i * sw, y2 + 4, Inttostr(i));

  end;

  ACanvas.TextOut(x1 - 40, y2 + 20, 'Cal Values:');
  if not assigned(FLowLevelCheck1) then
    exit;
  if FLowLevelCheck1.Checked and (LCal.X <> 0) then
  begin
    ACanvas.Font.Color := clBlue;
    ACanvas.TextOut(x1 + 10, y2 + 20, Format('X=%0.2f', [LCal.x]));
    ACanvas.TextOut(x1 + 10 + zz, y2 + 20, Format('SD=%0.2f', [LCal.sd]));
    ACanvas.TextOut(x1 + 10 + zz * 2, y2 + 20, Format('CV=%0.2f', [LCal.cv]));
  end;
  if FMidLevelCheck.Checked and (MCal.X <> 0) then
  begin
    ACanvas.Font.Color := clGreen;
    ACanvas.TextOut(x1 + 10 + zz * 3, y2 + 20, Format('X=%0.2f', [MCal.x]));
    ACanvas.TextOut(x1 + 10 + zz * 4, y2 + 20, Format('SD=%0.2f', [MCal.sd]));
    ACanvas.TextOut(x1 + 10 + zz * 5, y2 + 20, Format('CV=%0.2f', [MCal.cv]));
  end;
  if FHighLevelCheck.Checked and (HCal.X <> 0) then
  begin
    ACanvas.Font.Color := clRed;
    ACanvas.TextOut(x1 + 10 + zz * 6, y2 + 20, Format('X=%0.2f', [HCal.x]));
    ACanvas.TextOut(x1 + 10 + zz * 7, y2 + 20, Format('SD=%0.2f', [HCal.sd]));
    ACanvas.TextOut(x1 + 10 + zz * 8, y2 + 20, Format('CV=%0.2f', [HCal.cv]));
  end;

  ACanvas.Pen.Style := psSolid;
  for i := 1 to 7 do
  begin
    if FLowLevelCheck1.Checked and (fx1 <> 0) and (fsd1 <> 0) then
    begin
      astr := FloatToStrF(fx1 + (4 - i) * fsd1, ffGeneral, 5, 2);
      ACanvas.Font.Color := clBlue;
      ACanvas.TextOut(x1 - ACanvas.TextWidth(astr), y1 + i * sh, astr);
    end;
    if FMidLevelCheck.Checked and (fx2 <> 0) and (fsd2 <> 0) then
    begin
      astr := FloatToStrF(fx2 + (4 - i) * fsd2, ffGeneral, 5, 2);
      ACanvas.Font.Color := clGreen;
      ACanvas.TextOut(x1 - ACanvas.TextWidth(astr) + 40, y1 + i * sh - 6, astr);
    end;
    if FHighLevelCheck.Checked and (fx3 <> 0) and (fsd3 <> 0) then
    begin
      astr := FloatToStrF(fx3 + (4 - i) * fsd3, ffGeneral, 5, 2);
      ACanvas.Font.Color := clRed;
      ACanvas.TextOut(x1 - ACanvas.TextWidth(astr), y1 + i * sh - 16, astr);
    end;
    ACanvas.Font.Color := clBlack;
  end;
  ACanvas.TextOut(x2, y1 + sh - 12, '+3S');
  ACanvas.TextOut(x2, y1 + 2 * sh - 12, '+2S');
  ACanvas.TextOut(x2, y1 + 3 * sh - 12, '+S');
  ACanvas.TextOut(x2, y1 + 4 * sh - 12, 'X');
  ACanvas.TextOut(x2, y1 + 5 * sh - 12, '-S');
  ACanvas.TextOut(x2, y1 + 6 * sh - 12, '-2S');
  ACanvas.TextOut(x2, y1 + 7 * sh - 12, '-3S');
  //ACanvas.Font.Name := 'ЛОМе';
  ACanvas.Font.Size := 14;
  ACanvas.TextOut(ALeft + (Awidth - ACanvas.TextWidth('QC Graphics')) div 2, ATop,
    'QC Graphics');
  ACanvas.Font.Size := 12;
  ACanvas.TextOut(ALeft, ATop + 24, FHOSNAME + ' LAB');
  ACanvas.TextOut(Awidth - ACanvas.TextWidth(FTITLE + '  ' + DateToStr(FBaseDate)), ATop + 24,
    FTITLE + '  ' + DateToStr(FBaseDate));
  //  ACanvas.Font.Size := 12;
  ACanvas.pen.Width := 2;
  if FLowLevelCheck1.Checked then
  begin

    ACanvas.pen.Color := clBlue;
    if (fx1 <> 0) and (fsd1 <> 0) then
    begin
      xx := 0;
      if (avalL[1] <> 0) then
      begin
        ACanvas.MoveTo(x1 + sw, y1 + 4 * sh - trunc(((avalL[1] - fx1) / fsd1) * sh));
        xx := 1;
      end;
      for i := 2 to 31 do
      begin
        if xx = 1 then
        begin
          if (avalL[i] <> 0) then
            ACanvas.LineTo(x1 + i * sw, y1 + 4 * sh - trunc(((avalL[i] - fx1) / fsd1) * sh));
        end
        else
        begin
          if (avalL[i] <> 0) then
          begin
            ACanvas.MoveTo(x1 + i * sw, y1 + 4 * sh - trunc(((avalL[i] - fx1) / fsd1) * sh));
            xx := 1;
          end;
        end
      end;
    end;
  end;
  if FMidLevelCheck.Checked then
  begin
    if (fx2 <> 0) and (fsd2 <> 0) then
    begin
      xx := 0;
      if (avalM[1] <> 0) then
      begin
        ACanvas.MoveTo(x1 + sw, y1 + 4 * sh - trunc(((avalM[1] - fx2) / fsd2) * sh));
        xx := 1;
      end;
      ACanvas.pen.Color := clGreen;
      for i := 2 to 31 do
      begin
        if xx = 1 then
        begin
          if (avalM[i] <> 0) then
            ACanvas.LineTo(x1 + i * sw, y1 + 4 * sh - trunc(((avalM[i] - fx2) / fsd2) * sh));
        end
        else
        begin
          if (avalM[i] <> 0) then
          begin
            ACanvas.MoveTo(x1 + i * sw, y1 + 4 * sh - trunc(((avalM[i] - fx2) / fsd2) * sh));
            xx := 1;
          end;
        end
      end;
    end;
  end;
  if FHighLevelCheck.Checked then
  begin
    if (fx3 <> 0) and (fsd3 <> 0) then
    begin
      xx := 0;
      if (avalH[1] <> 0) then
      begin
        ACanvas.MoveTo(x1 + sw, y1 + 4 * sh - trunc(((avalH[1] - fx3) / fsd3) * sh));
        xx := 1;
      end;
      ACanvas.pen.Color := clRed;
      for i := 2 to 31 do
      begin
        if xx = 1 then
        begin
          if (avalH[i] <> 0) then
            ACanvas.LineTo(x1 + i * sw, y1 + 4 * sh - trunc(((avalH[i] - fx3) / fsd3) * sh));
        end
        else
        begin
          if (avalH[i] <> 0) then
          begin
            ACanvas.MoveTo(x1 + i * sw, y1 + 4 * sh - trunc(((avalH[i] - fx3) / fsd3) * sh));
            xx := 1;
          end;
        end
      end;
    end;
  end;
  ACanvas.pen.Color := clBlack;
  ACanvas.pen.Width := 1;

  //  TmpFont.free;
    { ACanvas.Rectangle(0, 0, Width, Height); }
end;

procedure TQCView.Paint;
begin
  inherited Paint;

  PaintTo(Canvas);
end;

procedure TQCView.PaintTo(ACanvas: TCanvas);
begin
  Acanvas.Brush.Color := clWhite;
  Acanvas.FillRect(rect(1, 1, ClientWidth, ClientHeight));

  DrawLine(ACanvas, 0, 0, Width, Height);
end;

function TQCView.GetDateRange(ADate: TDatetime; FormatStr: string): string;
var
  d1, d2: TDatetime;
  y, m, d: Word;
begin
  DecodeDate(ADate, y, m, d);
  d1 := EncodeDate(y, m, 1);
  if m <> 12 then
    d2 := EncodeDate(y, m + 1, 1) - 1
  else
    d2 := EncodeDate(y, m, 31);
  //  Result := DateField + ' >= ''' + FormatDatetime(FormatStr, d1)
  //    + ''' and ' + DateField + ' <= ''' + FormatDatetime(FormatStr, d2) + ''' ';
end;

procedure TQCView.Refresh;
begin
  invalidate;
end;

{procedure TQCCal.CalFrom(AArray: TValArray);
var
  I, N: Integer;
  Z1, Z2: Double;
begin
  Reset;
  N := 0;
  Z1 := 0;
  for I := 1 to 31 do // Iterate
  begin
    if AArray[i] <> 0 then
    begin
      inc(n);
      Z1 := Z1 + AArray[i];
    end;
  end; // for
  if n <> 0 then
  begin
    x := z1 / n;
    z2 := 0;
    for I := 1 to 31 do // Iterate
    begin
      if AArray[i] <> 0 then
      begin
        Z2 := Z2 + (AArray[i] - x) * (AArray[i] - x);
      end;
    end; // for
    sd := sqrt(z2 / n);
    cv := sd / n * 100;
  end;
end;}

procedure TQCCal.Reset;
begin
  x := 0;
  sd := 0;
  cv := 0;
end;

destructor TQCCal.Destroy;
begin
  inherited Destroy;
end;

constructor TQCValueItem.Create;
begin
  xl := 0;
  xm := 0;
  xh := 0;
end;

procedure TQCValueItem.Reset;
begin
  xl := 0;
  xm := 0;
  xh := 0;
end;

constructor TQCCal.Create;
begin
  x := 0;
  sd := 0;
  cv := 0;
end;

constructor TMPRDicomImage.Create(AOwner: TComponent);
begin
  inherited;
  fVerLine := 0;
  fHozLine := 0;
  fVerChanged := false;
  fHozChanged := false;

  //  fCycleLine1 := Point(0, 0);
  //  fCycleLine2 := Point(0, 0);
  fSeriesUID := '';

  fMouseDragging := false;
  fMouseDragline := 0;
  fCanBeRotate := false;

  fMouseWheelInteract := mwiScrollWheel;

  fInUpdate := false;

  FDragFrom := dfsNone;
  fLeftMouseInteract := miDragdown;
end;

destructor TMPRDicomImage.Destroy;
begin
  inherited;
end;

{$IFDEF USE_BITMAP32_VIEWER}

procedure TMPRDicomImage.ExecCustom(Dest: TCnsBitmap32; StageNum: Integer);
var
  x1, y1, x2, y2, k: Integer;
  das: TDicomAttributes;
  p1, p2, p3, p4: TPoint;
  xp1, xp2, xp3, xp4: TPoint;
begin
  inherited;
  if fMouseDragging then
    exit;

  if (fVerLine = 0) and (fHozLine = 0) then
  begin
    if assigned(DicomDatasets) and (DicomDatasets.Count > 0) then
    begin
      das := DicomDatasets[AttributesIndex].Attributes;
      fAngle := 0;
      fVerLine := das.ImageData.Height div 2;
      fHozLine := das.ImageData.Width div 2;
      if assigned(FOnBeforeBuildMPRChange) then
        FOnBeforeBuildMPRChange(self);

      if assigned(fOnMPRLineChanged) then
        fOnMPRLineChanged(self, 0, 0, Round(fVerLine), das.ImageData.Width - 1, Round(fVerLine));
      if assigned(fOnMPRLineChanged) then
        fOnMPRLineChanged(self, 1, Round(fHozLine), 0, Round(fHozLine), das.ImageData.Height - 1);

      if assigned(FOnAfterBuildMPRChange) then
        FOnAfterBuildMPRChange(self);
    end;
  end;
  x1 := XBmp2Scr(fVerLine);
  y1 := YBmp2Scr(fHozLine);

  k := width div 15;
  if (fVerLine > 0) and (fHozLine > 0) then
  begin
    Dest.LineS(x1 - k, y1 - k, x1 + k, y1 - k, clRed32);
    Dest.LineS(x1 - k, y1 - k, x1 - k, y1 + k, clRed32);
    Dest.LineS(x1 - k, y1 + k, x1 + k, y1 + k, clRed32);
    Dest.LineS(x1 + k, y1 - k, x1 + k, y1 + k, clRed32);
    if fAngle > 0 then
    begin
      ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
      Dest.LineS(p1.X, p1.Y, p3.X, p3.Y, clRed32);
      Dest.LineS(p2.X, p2.Y, p4.X, p4.Y, clRed32);
      if fCanBeRotate then
      begin
        k := 5;
        x2 := xp1.X;
        y2 := xp1.Y;
        Dest.LineS(x2 - k, y2 - k, x2 + k, y2 - k, clRed32);
        Dest.LineS(x2 - k, y2 - k, x2 - k, y2 + k, clRed32);
        Dest.LineS(x2 - k, y2 + k, x2 + k, y2 + k, clRed32);
        Dest.LineS(x2 + k, y2 - k, x2 + k, y2 + k, clRed32);
        x2 := xp2.X;
        y2 := xp2.Y;
        Dest.LineS(x2 - k, y2 - k, x2 + k, y2 - k, clRed32);
        Dest.LineS(x2 - k, y2 - k, x2 - k, y2 + k, clRed32);
        Dest.LineS(x2 - k, y2 + k, x2 + k, y2 + k, clRed32);
        Dest.LineS(x2 + k, y2 - k, x2 + k, y2 + k, clRed32);
        x2 := xp3.X;
        y2 := xp3.Y;
        Dest.LineS(x2 - k, y2 - k, x2 + k, y2 - k, clRed32);
        Dest.LineS(x2 - k, y2 - k, x2 - k, y2 + k, clRed32);
        Dest.LineS(x2 - k, y2 + k, x2 + k, y2 + k, clRed32);
        Dest.LineS(x2 + k, y2 - k, x2 + k, y2 + k, clRed32);
        x2 := xp4.X;
        y2 := xp4.Y;
        Dest.LineS(x2 - k, y2 - k, x2 + k, y2 - k, clRed32);
        Dest.LineS(x2 - k, y2 - k, x2 - k, y2 + k, clRed32);
        Dest.LineS(x2 - k, y2 + k, x2 + k, y2 + k, clRed32);
        Dest.LineS(x2 + k, y2 - k, x2 + k, y2 + k, clRed32);
      end;
    end
    else
    begin
      if fVerLine > 0 then
        Dest.VertLineS(x1, 0, self.Height, clBlue32);
      if fHozLine > 0 then
        Dest.HorzLineS(0, y1, self.width, clBlue32);
      if fCanBeRotate then
      begin
        x2 := x1 div 2;
        y2 := y1;
        k := 5;
        Dest.LineS(x2 - k, y2 - k, x2 + k, y2 - k, clRed32);
        Dest.LineS(x2 - k, y2 - k, x2 - k, y2 + k, clRed32);
        Dest.LineS(x2 - k, y2 + k, x2 + k, y2 + k, clRed32);
        Dest.LineS(x2 + k, y2 - k, x2 + k, y2 + k, clRed32);

        x2 := (width - x1) div 2 + x1;
        y2 := y1;
        k := 5;
        Dest.LineS(x2 - k, y2 - k, x2 + k, y2 - k, clRed32);
        Dest.LineS(x2 - k, y2 - k, x2 - k, y2 + k, clRed32);
        Dest.LineS(x2 - k, y2 + k, x2 + k, y2 + k, clRed32);
        Dest.LineS(x2 + k, y2 - k, x2 + k, y2 + k, clRed32);

        x2 := x1;
        y2 := y1 div 2;
        k := 5;
        Dest.LineS(x2 - k, y2 - k, x2 + k, y2 - k, clRed32);
        Dest.LineS(x2 - k, y2 - k, x2 - k, y2 + k, clRed32);
        Dest.LineS(x2 - k, y2 + k, x2 + k, y2 + k, clRed32);
        Dest.LineS(x2 + k, y2 - k, x2 + k, y2 + k, clRed32);

        x2 := x1;
        y2 := (height - y1) div 2 + y1;
        k := 5;
        Dest.LineS(x2 - k, y2 - k, x2 + k, y2 - k, clRed32);
        Dest.LineS(x2 - k, y2 - k, x2 - k, y2 + k, clRed32);
        Dest.LineS(x2 - k, y2 + k, x2 + k, y2 + k, clRed32);
        Dest.LineS(x2 + k, y2 - k, x2 + k, y2 + k, clRed32);
      end;
    end;
  end;
end;
{$ELSE}

procedure TMPRDicomImage.ExecCustom(Dest: TGPGraphics; StageNum: Integer); // PST_CUSTOM
begin

end;
{$ENDIF}

procedure TMPRDicomImage.Clear;
begin
  fVerLine := Height div 2;
  fHozLine := width div 2;
  fSeriesUID := '';
end;

procedure TMPRDicomImage.ComputePoint(xx, yy, ww, hh: Integer;
  var x1, x2, x3, x4, p1, p2, p3, p4: TPoint);
var
  a1: Integer;
  l1: Double;
begin
  a1 := fAngle mod 90;
  if a1 = 0 then
  begin
    x1.X := xx;
    x1.Y := 0;
    p1.X := xx;
    p1.Y := yy div 2;

    x3.X := xx;
    x3.Y := hh - 1;
    p3.X := xx;
    p3.Y := yy + (hh - yy) div 2;

    x2.X := 0;
    x2.Y := yy;
    p2.X := xx div 2;
    p2.Y := yy;

    x4.X := ww - 1;
    x4.Y := yy;
    p4.X := xx + (ww - xx) div 2;
    p4.Y := yy;
  end
  else
  begin

    l1 := xx * math.Tan(a1 * PI / 180);
    if (yy - l1) < 0 then
    begin
      l1 := yy * math.Tan((90 - a1) * PI / 180);
      x1.X := Round(xx - l1);
      x1.Y := 0;
      p1.X := Round(xx - l1 / 2);
      p1.Y := yy div 2;
    end
    else
    begin
      x1.X := 0;
      x1.Y := Round(yy - l1);
      p1.X := xx div 2;
      p1.Y := Round(yy - l1 / 2);
    end;

    l1 := yy * math.Tan(a1 * PI / 180);
    if (xx + l1) > ww then
    begin
      l1 := (ww - xx) * math.Tan((90 - a1) * PI / 180);
      x2.X := ww - 1;
      x2.Y := Round(yy - l1);
      p2.X := xx + (ww - xx) div 2;
      p2.Y := Round(yy - l1 / 2);
    end
    else
    begin
      x2.X := Round(xx + l1);
      x2.Y := 0;
      p2.X := Round(xx + l1 / 2);
      p2.Y := yy div 2;
    end;

    l1 := (ww - xx) * math.Tan(a1 * PI / 180);
    if (yy + l1) > hh then
    begin
      l1 := (hh - yy) * math.Tan((90 - a1) * PI / 180);
      x3.X := Round(xx + l1);
      x3.Y := hh - 1;
      p3.X := Round(xx + l1 / 2);
      p3.Y := yy + (hh - yy) div 2;
    end
    else
    begin
      x3.X := ww - 1;
      x3.Y := Round(yy + l1);
      p3.X := xx + (ww - xx) div 2;
      p3.Y := Round(yy + l1 / 2);
    end;

    l1 := (hh - yy) * math.Tan(a1 * PI / 180);
    if (xx - l1) < 0 then
    begin
      l1 := xx * math.Tan((90 - a1) * PI / 180);
      x4.X := 0;
      x4.Y := Round(yy + l1);
      p4.X := xx div 2;
      p4.Y := Round(yy + l1 / 2);
    end
    else
    begin
      x4.X := Round(xx - l1);
      x4.Y := hh - 1;
      p4.X := Round(xx - l1 / 2);
      p4.Y := yy + (hh - yy) div 2;
    end;
  end;
end;

function TMPRDicomImage.IsInExtRect(x, y: Integer; var AIndex: Integer): Boolean;
  function IsNearLine(x1, y1: Integer; lp1, lp2: TPoint): Boolean;
  var
    d, sq: Double;
    xx1, yy1, xx2, yy2: Single;
  begin
    xx1 := lp1.X;
    yy1 := lp1.Y;
    xx2 := lp2.X;
    yy2 := lp2.Y;

    //јЖЛгѕаАл
    sq := sqrt((yy2 - yy1) * (yy2 - yy1) + (xx2 - xx1) * (xx2 - xx1));
    if (sq = 0) then
    begin
      d := sqrt(x1 * x1 + y1 * y1);
    end
    else
      d := abs((yy1 - yy2) * x1 + (xx2 - xx1) * y1 + xx1 * yy2 - xx2 * yy1) / sq;

    if (d < 10) then
      Result := TRUE
    else
      Result := FALSE;
  end;
var
  x1, y1, x2, y2, k: Integer;
  p1, p2, p3, p4, xp1, xp2, xp3, xp4: TPoint;
begin
  Result := false;
  x1 := XBmp2Scr(fVerLine);
  y1 := YBmp2Scr(fHozLine);

  ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);

  x2 := xp1.X;
  y2 := xp1.Y;
  k := 5;

  Result := (((x < (x2 + k)) and (x > (x2 - k))) and ((y < (y2 + k)) and (y > (y2 - k))));
  if Result then
  begin
    AIndex := 0;
    exit;
  end;

  x2 := xp2.X;
  y2 := xp2.Y;
  k := 5;

  Result := (((x < (x2 + k)) and (x > (x2 - k))) and ((y < (y2 + k)) and (y > (y2 - k))));
  if Result then
  begin
    AIndex := 2;
    exit;
  end;

  x2 := xp3.X;
  y2 := xp3.Y;
  k := 5;

  Result := (((x < (x2 + k)) and (x > (x2 - k))) and ((y < (y2 + k)) and (y > (y2 - k))));
  if Result then
  begin
    AIndex := 1;
    exit;
  end;

  x2 := xp4.X;
  y2 := xp4.Y;
  k := 5;

  Result := (((x < (x2 + k)) and (x > (x2 - k))) and ((y < (y2 + k)) and (y > (y2 - k))));
  if Result then
  begin
    AIndex := 3;
    exit;
  end;

  if IsNearLine(x, y, p1, p3) then
  begin
    AIndex := 5;
    Result := true;
    exit;
  end;

  if IsNearLine(x, y, p2, p4) then
  begin
    AIndex := 4;
    Result := true;
    exit;
  end;

end;

procedure TMPRDicomImage.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  xx, yy, k: Integer;
  x1, y1, r1: Integer;
  p1, p2, p3, p4, xp1, xp2, xp3, xp4: TPoint;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button <> mbLeft then
    exit;
  if fSeriesUID <> '' then
  begin
    xx := XScr2Bmp(x);
    yy := YScr2Bmp(y);
    k := Trunc((width div 15) / Scale);

    if (abs(Yy - fHozLine) <= k) and (abs(Xx - fVerLine) <= k) then
    begin
      Screen.Cursor := crSizeALL;
      fMouseDragline := 4;
    end
    else
      if IsInExtRect(x, y, r1) then
    begin
      case r1 of
        4:
          begin
            fMouseDragline := 2;
            Screen.Cursor := crSizeNS;
          end;
        5:
          begin
            Screen.Cursor := crSizeWE;
            fMouseDragline := 3;
          end;
      else
        begin
          Cursor := crHandPoint; //0,1,2,3
          fMouseDragline := 5;
        end;
      end;
    end;
    fMouseDragging := fMouseDragline > 0;
    fLastMousePos := Point(X, Y);
    fDownMousePos := Point(X, Y);
    fLastLinePos := Point(Round(fVerLine), Round(fHozLine));

    x1 := XBmp2Scr(fVerLine);
    y1 := YBmp2Scr(fHozLine);
    ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
    DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
    DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);
    //DrawLineInserting(XBmp2Scr(fVerLine), 0, XBmp2Scr(fVerLine), Height - 1);
    //DrawLineInserting(0, YBmp2Scr(fHozLine), Width - 1, YBmp2Scr(fHozLine));
    //    if fMouseDragging then
   //      Screen.Cursor := CURSOR_ID[dsSizeTL];
   //  DownMousePos := Point(X, Y);
  end;
end;

procedure TMPRDicomImage.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  dx, dy, dx1, dy1, xx, yy, k, r1: Integer;
  x1, y1: Integer;
  p1, p2, p3, p4, xp1, xp2, xp3, xp4: TPoint;
begin
  inherited MouseMove(Shift, X, Y);
  if fInUpdate then
    exit;
  fInUpdate := true;
  try

    xx := XScr2Bmp(x);
    yy := YScr2Bmp(y);
    if fMouseDragging then
    begin
      Dx := X - fDownMousePos.X;
      Dy := Y - fDownMousePos.Y;

      Dx1 := X - fLastMousePos.X;
      Dy1 := Y - fLastMousePos.Y;

      fLastMousePos := Point(X, Y);

      case fMouseDragline of
        4, 2, 3:
          begin
            Screen.Cursor := crSizeALL;
            if ((fLastLinePos.Y + (dy / Scale)) > 0) and ((fLastLinePos.Y + (dy / Scale))
              < bitmap.Height) then
            begin
              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);
              //DrawLineInserting(0, YBmp2Scr(fHozLine), Width - 1, YBmp2Scr(fHozLine));
              fHozLine := fLastLinePos.Y + trunc(dy / Scale);
              //DrawLineInserting(0, YBmp2Scr(fHozLine), Width - 1, YBmp2Scr(fHozLine));
              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);
            end;
            if ((fLastLinePos.X + (dx / Scale)) > 0) and ((fLastLinePos.X + (dx / Scale))
              < bitmap.Width) then
            begin
              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);
              //DrawLineInserting(XBmp2Scr(fVerLine), 0, XBmp2Scr(fVerLine), Height - 1);
              fVerLine := fLastLinePos.X + trunc(dx / Scale);
              //DrawLineInserting(XBmp2Scr(fVerLine), 0, XBmp2Scr(fVerLine), Height - 1);
              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);
            end;
            if assigned(fOnMPRLineChanging) then
            begin
              fVerChanged := true;
              fHozChanged := true;
              if not fCanBeRotate then
              begin
                fOnMPRLineChanging(self, 1, Round(fVerLine), 0, Round(fVerLine),
                  Attributes.ImageData.Height -
                  1);
                fOnMPRLineChanging(self, 0, 0, Round(fHozLine), Attributes.ImageData.Width - 1,
                  Round(fHozLine));
              end
              else
              begin
                ComputePoint(Round(fVerLine), Round(fHozLine), Attributes.ImageData.Width,
                  Attributes.ImageData.height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
                fOnMPRLineChanging(self, 1, p1.X, p1.Y, p3.X, p3.Y);
                fOnMPRLineChanging(self, 0, p2.X, p2.Y, p4.X, p4.Y);
              end;
            end;
          end;
        {2:
          begin

            Cursor := crSizeNS;
            if ((fLastLinePos.Y + trunc(dy / Scale)) > 0) and ((fLastLinePos.Y + trunc(dy / Scale))
              < bitmap.Height) then
            begin
              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);
              //DrawLineInserting(0, YBmp2Scr(fHozLine), Width - 1, YBmp2Scr(fHozLine));
              fHozLine := fLastLinePos.Y + trunc(dy / Scale);
              fVerLine := fLastLinePos.X + trunc(dy * Math.Tan((90 - fAngle mod 90) * PI / 180) /
                Scale);

              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);
              //DrawLineInserting(0, YBmp2Scr(fHozLine), Width - 1, YBmp2Scr(fHozLine));
            end;
            if assigned(fOnMPRLineChanging) then
            begin
              fHozChanged := true;
              if not fCanBeRotate then
              begin
                //fOnMPRLineChanging(self, 1, fVerLine, 0, fVerLine, Attributes.ImageData.Height -
                //  1);
                fOnMPRLineChanging(self, 0, 0, fHozLine, Attributes.ImageData.Width - 1, fHozLine);
              end
              else
              begin
                ComputePoint(fVerLine, fHozLine, Attributes.ImageData.Width,
                  Attributes.ImageData.height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
                //fOnMPRLineChanging(self, 1, p1.X, p1.Y, p3.X, p3.Y);
                fOnMPRLineChanging(self, 0, p2.X, p2.Y, p4.X, p4.Y);
              end;
            end;
          end;
        3:
          begin
            Cursor := crSizeWE;
            if ((fLastLinePos.X + trunc(dx / Scale)) > 0) and ((fLastLinePos.X + trunc(dx / Scale))
              < bitmap.Width) then
            begin
              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);
              //DrawLineInserting(XBmp2Scr(fVerLine), 0, XBmp2Scr(fVerLine), Height - 1);
              fVerLine := fLastLinePos.X + trunc(dx / Scale);
              fHozLine := fLastLinePos.Y - trunc(dx * Math.Tan((90 - fAngle mod 90) * PI / 180) /
                Scale);

              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);
              //DrawLineInserting(XBmp2Scr(fVerLine), 0, XBmp2Scr(fVerLine), Height - 1);
            end;
            if assigned(fOnMPRLineChanging) then
            begin
              fVerChanged := true;
              if not fCanBeRotate then
              begin
                fOnMPRLineChanging(self, 1, fVerLine, 0, fVerLine, Attributes.ImageData.Height -
                  1);
                //fOnMPRLineChanging(self, 0, 0, fHozLine, Attributes.ImageData.Width - 1, fHozLine);
              end
              else
              begin
                ComputePoint(fVerLine, fHozLine, Attributes.ImageData.Width,
                  Attributes.ImageData.height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
                fOnMPRLineChanging(self, 1, p1.X, p1.Y, p3.X, p3.Y);
                //fOnMPRLineChanging(self, 0, p2.X, p2.Y, p4.X, p4.Y);
              end;
            end;

          end;  }
        5:
          if fCanBeRotate then
          begin
            if ((fLastLinePos.X + (dx / Scale)) > 0) and ((fLastLinePos.X + (dx / Scale))
              < bitmap.Width) then
            begin
              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);

              fAngle := Trunc(CalAngle(0, fHozLine, fVerLine, fHozLine, xx, yy));
              if yy > fHozLine then
                fAngle := 360 - fAngle;
              {if abs(dx1) > abs(dy1) then
                k := dx1
              else
                k := dy1;

              if k < 0 then
                fAngle := (fAngle + 1) mod 90
              else
                fAngle := (fAngle - 1) mod 90;
              if fAngle < 0 then
                fAngle := 89; }

              x1 := XBmp2Scr(fVerLine);
              y1 := YBmp2Scr(fHozLine);
              ComputePoint(x1, y1, width, height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
              DrawLineInserting(p1.X, p1.Y, p3.X, p3.Y);
              DrawLineInserting(p2.X, p2.Y, p4.X, p4.Y);

              if assigned(fOnMPRLineChanging) then
              begin
                fVerChanged := true;

                ComputePoint(Round(fVerLine), Round(fHozLine), Attributes.ImageData.Width,
                  Attributes.ImageData.height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);
                fOnMPRLineChanging(self, 1, p1.X, p1.Y, p3.X, p3.Y);
                fOnMPRLineChanging(self, 0, p2.X, p2.Y, p4.X, p4.Y);
              end;
            end;
          end;
      else
        exit;
      end;
      //invalidate;
    end
    else
      if not MouseCapture then
    begin
      k := trunc((width div 15) / Scale);

      if (abs(yy - fHozLine) <= k) and (abs(xx - fVerLine) <= k) then
      begin
        Cursor := crSizeALL;
      end
      else
        if IsInExtRect(x, y, r1) then
      begin
        case r1 of
          4: Cursor := crSizeNS;
          5: Cursor := crSizeWE;
        else
          if fCanBeRotate then
            Cursor := crHandPoint; //0,1,2,3
        end;
      end
      else
        Cursor := crDefault;
    end;
  finally
    fInUpdate := false;
  end;
end;

procedure TMPRDicomImage.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p1, p2, p3, p4, xp1, xp2, xp3, xp4: TPoint;
begin
  inherited MouseUp(Button, Shift, X, Y);
  fMouseDragging := false;
  fMouseDragline := 0;
  Screen.Cursor := crDefault;
  invalidate;
  if not fCanBeRotate then
  begin
    if assigned(FOnBeforeBuildMPRChange) then
      FOnBeforeBuildMPRChange(self);

    if fHozChanged and assigned(fOnMPRLineChanged) then
      fOnMPRLineChanged(self, 0, 0, Round(fHozLine), Attributes.ImageData.Width - 1,
        Round(fHozLine));
    if fVerChanged and assigned(fOnMPRLineChanged) then
      fOnMPRLineChanged(self, 1, Round(fVerLine), 0, Round(fVerLine), Attributes.ImageData.Height -
        1);

    if assigned(FOnAfterBuildMPRChange) then
      FOnAfterBuildMPRChange(self);
  end

  else
  begin
    ComputePoint(Round(fVerLine), Round(fHozLine), Attributes.ImageData.Width,
      Attributes.ImageData.height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);

    if assigned(FOnBeforeBuildMPRChange) then
      FOnBeforeBuildMPRChange(self);

    if fHozChanged and assigned(fOnMPRLineChanged) then
      fOnMPRLineChanged(self, 0, p2.X, p2.Y, p4.X, p4.Y);
    if fVerChanged and assigned(fOnMPRLineChanged) then
      fOnMPRLineChanged(self, 1, p1.X, p1.Y, p3.X, p3.Y);

    if assigned(FOnAfterBuildMPRChange) then
      FOnAfterBuildMPRChange(self);
  end;

  fVerChanged := false;
  fHozChanged := false;
end;

procedure TMPRDicomImage.UpdateLineV;
begin
  invalidate;
  if assigned(FOnBeforeBuildMPRChange) then
    FOnBeforeBuildMPRChange(self);

  if assigned(fOnMPRLineChanged) then
    fOnMPRLineChanged(self, 1, Round(fVerLine), 0, Round(fVerLine), Attributes.ImageData.Height -
      1);
  //  if assigned(fOnMPRLineChanged) then
  //    fOnMPRLineChanged(self, 0, 0, fHozLine, Attributes.ImageData.Width - 1, fHozLine);
  if assigned(FOnAfterBuildMPRChange) then
    FOnAfterBuildMPRChange(self);
end;

procedure TMPRDicomImage.UpdateLineH;
begin
  invalidate;
  if assigned(FOnBeforeBuildMPRChange) then
    FOnBeforeBuildMPRChange(self);

  //  if assigned(fOnMPRLineChanged) then
  //    fOnMPRLineChanged(self, 1, fVerLine, 0, fVerLine, Attributes.ImageData.Height - 1);
  if assigned(fOnMPRLineChanged) then
    fOnMPRLineChanged(self, 0, 0, Round(fHozLine), Attributes.ImageData.Width - 1,
      Round(fHozLine));
  if assigned(FOnAfterBuildMPRChange) then
    FOnAfterBuildMPRChange(self);
end;

function TMPRDicomImage.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint):
  Boolean;
var
  p1, p2, p3, p4, xp1, xp2, xp3, xp4: TPoint;
begin
  result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if not CineActive then
    case fMouseWheelInteract of
      mwiScrollWheel:
        begin
          result := true;
          if WheelDelta < 0 then
            Next
          else
            Prior;
        end;
      mwiMPRLineHoz:
        begin
          if WheelDelta < 0 then
            fVerLine := fVerLine + 1
          else
            fVerLine := fVerLine - 1;
          if fVerLine < 0 then
            fVerLine := 0
          else
            if fVerLine > Attributes.ImageData.Width - 1 then
            fVerLine := Attributes.ImageData.Width - 1;
          ComputePoint(Round(fVerLine), Round(fHozLine), Attributes.ImageData.Width,
            Attributes.ImageData.height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);

          if assigned(FOnBeforeBuildMPRChange) then
            FOnBeforeBuildMPRChange(self);

          if fHozChanged and assigned(fOnMPRLineChanged) then
            fOnMPRLineChanged(self, 0, p2.X, p2.Y, p4.X, p4.Y);
          if fVerChanged and assigned(fOnMPRLineChanged) then
            fOnMPRLineChanged(self, 1, p1.X, p1.Y, p3.X, p3.Y);

          if assigned(FOnAfterBuildMPRChange) then
            FOnAfterBuildMPRChange(self);
        end;
      mwiMPRLineVert:
        begin
          if WheelDelta < 0 then
            fHozLine := fHozLine + 1
          else
            fHozLine := fHozLine - 1;
          if fHozLine < 0 then
            fHozLine := 0
          else
            if fHozLine > Attributes.ImageData.Height - 1 then
            fHozLine := Attributes.ImageData.Height - 1;

          ComputePoint(Round(fVerLine), Round(fHozLine), Attributes.ImageData.Width,
            Attributes.ImageData.height, p1, p2, p3, p4, xp1, xp2, xp3, xp4);

          if assigned(FOnBeforeBuildMPRChange) then
            FOnBeforeBuildMPRChange(self);

          if fHozChanged and assigned(fOnMPRLineChanged) then
            fOnMPRLineChanged(self, 0, p2.X, p2.Y, p4.X, p4.Y);
          if fVerChanged and assigned(fOnMPRLineChanged) then
            fOnMPRLineChanged(self, 1, p1.X, p1.Y, p3.X, p3.Y);

          if assigned(FOnAfterBuildMPRChange) then
            FOnAfterBuildMPRChange(self);
        end;
    end;
end;

procedure TMPRDicomImage.Next;
begin
  if ((AttributesIndex + 1) < DicomDatasets.Count) and
    (DicomDatasets[AttributesIndex + 1].Attributes.GetString($20, $E) = fSeriesUID) then
  begin
    inherited;
  end;
end;

procedure TMPRDicomImage.Prior;
begin
  if ((AttributesIndex - 1) >= 0) and
    (DicomDatasets[AttributesIndex - 1].Attributes.GetString($20, $E) = fSeriesUID) then
  begin
    inherited;
  end;
end;

function TDicomMultiLayoutViewer.IsSplitter: Boolean;
begin
  Result := (fPane1 <> nil) and (fPane2 <> nil);
end;

constructor TDicomMultiLayoutViewer.Create(aOwner: TComponent);
var
  AddVer1: TMenuItem;
begin
  inherited;
  FMoveActiveSeriesView := nil;
  FDblClickToFullSeries := false;

  FCanCheckSize := true;
  FSeriesResizable := true;

  FDragFrom := dfsFromImageList;
  FDragDropMode := ddmFreeView;

  FCustomDicomImageClass := TDicomView;

  //  FFullScreenView := nil;

  fLeftMouseInteract := miNone;
  fRightMouseInteract := miNone; //miWindow;
  fMouseWheelInteract := mwiScrollWheel;
  fLeftLeaderMouserInspect := ldmiNone;
  { prepare default values }
  fPane1 := nil;
  fPane2 := nil;
  fSplitter := nil;
  fViewer := nil;
  fCurrentViewer := nil;
  fLastCurrentViewer := nil;

  backupPopupMenu := nil;

  fRows := 1;
  fColumns := 1;
  fViewerID := 0;

  fDisplayLabel := true;
  fDisplayWLLabel := true;
  fDisplayRuler := true;

  FDisplayRightRuler := true;
  FDisplayBottomRuler := true;

  fTextOverlayMode := false;
  fUpdateAllImageProperty := true;
  FUpdateAllSeriesProperty := true;
  fCanMultiSelect := true;
  fWhiteGrid := false;
  fLimitOneSeries := true;

  fOnlyViewMultiSelected1 := false;
  fOnlyViewMultiSelected2 := false;
  fOnlyViewMultiSelected3 := false;
  fOnlyViewMultiSelected4 := false;

  Caption := IntToStr(fViewerID);

  PopupMenu := TPopupMenu.Create(self);
  PopupMenu.OnPopup := PopupMenu1Popup;

  AddVer1 := TMenuItem.Create(Self);
  with AddVer1 do
  begin
    Caption := 'Split Vertically';
    tag := 0;
    OnClick := AddMenuClick;
  end;
  PopupMenu.Items.Add(AddVer1);

  AddVer1 := TMenuItem.Create(Self);
  with AddVer1 do
  begin
    Caption := 'Split Horizontally';
    tag := 1;
    OnClick := AddMenuClick;
  end;
  PopupMenu.Items.Add(AddVer1);

  AddVer1 := TMenuItem.Create(Self);
  with AddVer1 do
  begin
    Caption := 'Remove Split';
    tag := 2;
    OnClick := AddMenuClick;
  end;
  PopupMenu.Items.Add(AddVer1);

  AddVer1 := TMenuItem.Create(Self);
  with AddVer1 do
  begin
    Caption := 'Setup Study/Series Viewer';
    tag := 3;
    OnClick := AddMenuClick;
  end;
  PopupMenu.Items.Add(AddVer1);

end;

destructor TDicomMultiLayoutViewer.Destroy;
begin
  if Parent is TDicomMultiLayoutViewer then
    with TDicomMultiLayoutViewer(Parent) do
      if fPane1 = Self then
      begin
        fPane1 := nil;
        fPane2.Free;
        fPane2 := nil;
      end
      else
        if fPane2 = Self then
      begin
        fPane2 := nil;
        fPane1.Free;
        fPane1 := nil;
      end;

  if fPane1 <> nil then
    fPane1.Free;
  if fPane2 <> nil then
    fPane2.Free;
  if fSplitter <> nil then
    fSplitter.Free;
  if fViewer <> nil then
    fViewer.Free;

  inherited;
end;

function TDicomMultiLayoutViewer.IsVerticalSplitter: Boolean;
begin
  if IsSplitter then
    Result := (fPane1.Align = alLeft) or (fPane1.Align = alRight) or
      (fPane2.Align = alLeft) or (fPane2.Align = alRight)
  else
    Result := false;
end;

function TDicomMultiLayoutViewer.CreatePane(aAlign: TAlign): TDicomMultiLayoutViewer;
begin
  Result := TDicomMultiLayoutViewer.Create(self);
  with Result do
  begin
    BevelInner := self.BevelInner;
    BevelOuter := self.BevelOuter;
    BevelWidth := self.BevelWidth;
    BorderStyle := self.BorderStyle;
    BorderWidth := self.BorderWidth;
    Cursor := self.Cursor;
    Color := self.Color;

    Parent := self;
    Align := aAlign;
  end;
end;

function TDicomMultiLayoutViewer.GetRootPanel: TDicomMultiLayoutViewer;
var
  d1: TDicomMultiLayoutViewer;
begin
  Result := nil;
  if Parent is TDicomMultiLayoutViewer then
  begin
    d1 := TDicomMultiLayoutViewer(Parent);
    Result := d1.GetRootPanel;
  end
  else
    Result := self;
end;

procedure TDicomMultiLayoutViewer.AdjustPanesViewerID;
  procedure SetViewerID(lv1: TDicomMultiLayoutViewer; var Index: integer);
  begin
    if lv1.IsSplitter then
    begin
      SetViewerID(lv1.Panel1, Index);
      SetViewerID(lv1.Panel2, Index);
    end
    else
    begin
      lv1.fViewerID := Index;
      //lv1.Caption := IntToStr(Index);
      lv1.Invalidate;
      inc(Index);
    end;
  end;
var
  v1: TDicomMultiLayoutViewer;
  i: integer;
begin
  v1 := GetRootPanel;

  i := 0;
  SetViewerID(v1, i);
end;

function TDicomMultiLayoutViewer.GetViewer(AIndex: Integer): TDicomMultiViewer;
begin
  Result := nil;
  if IsSplitter then
  begin
    Result := fPane1.GetViewer(AIndex);
    if Result = nil then
      Result := fPane2.GetViewer(AIndex);
  end
  else
  begin
    if fViewerID = AIndex then
    begin
      Result := self.Viewer;
    end;
  end;
end;

procedure TDicomMultiLayoutViewer.CalViewerCount(var ACount: Integer);
begin
  if IsSplitter then
  begin
    if fPane1 <> nil then
      fPane1.CalViewerCount(ACount);

    if fPane2 <> nil then
      fPane2.CalViewerCount(ACount);
  end
  else
    if fViewer <> nil then
    ACount := ACount + 1;
end;

procedure TDicomMultiLayoutViewer.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, operation);
  if Operation = opRemove then
  begin
    if (AComponent = fCurrentViewer) then
    begin
      fCurrentViewer := nil;
    end
    else
      if (AComponent = fLastCurrentViewer) then
    begin
      fLastCurrentViewer := nil;
    end
    else
      if (AComponent = FMoveActiveSeriesView) then
    begin
      FMoveActiveSeriesView := nil;
    end
  end;
end;

procedure TDicomMultiLayoutViewer.SetOnlyViewMultiSelected1(Value: Boolean);
var
  i: Integer;
begin
  if fOnlyViewMultiSelected1 <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].OnlyViewMultiSelected1 := Value;
    fOnlyViewMultiSelected1 := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetOnlyViewMultiSelected2(Value: Boolean);
var
  i: Integer;
begin
  if fOnlyViewMultiSelected2 <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].OnlyViewMultiSelected2 := Value;
    fOnlyViewMultiSelected2 := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetOnlyViewMultiSelected3(Value: Boolean);
var
  i: Integer;
begin
  if fOnlyViewMultiSelected3 <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].OnlyViewMultiSelected3 := Value;
    fOnlyViewMultiSelected3 := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetOnlyViewMultiSelected4(Value: Boolean);
var
  i: Integer;
begin
  if fOnlyViewMultiSelected4 <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].OnlyViewMultiSelected4 := Value;
    fOnlyViewMultiSelected4 := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetLeftMouseInteract(Value: TMouseInteract);
var
  i: Integer;
begin
  //if fLeftMouseInteract <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].LeftMouseInteract := Value;
    fLeftMouseInteract := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetRightMouseInteract(Value: TMouseInteract);
var
  i: Integer;
begin
  //if fRightMouseInteract <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].RightMouseInteract := Value;
    fRightMouseInteract := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetMouseWheelInteract(Value: TMouseWheelInteract);
var
  i: Integer;
begin
  //if fMouseWheelInteract <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].MouseWheelInteract := Value;
    fMouseWheelInteract := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetLeftLeaderMouserInspect(Value: TLeaderMouserInspect);
var
  i: Integer;
begin
  //if fLeftLeaderMouserInspect <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].LeaderMouserInspect := Value;
    fLeftLeaderMouserInspect := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetDisplayLabel(Value: Boolean);
var
  i: Integer;
begin
  if fDisplayLabel <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].DisplayLabel := Value;
    fDisplayLabel := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetUpdateAllImageProperty(Value: Boolean);
var
  //  v1: TDicomMultiViewer;
  i: integer;
begin
  if fUpdateAllImageProperty <> Value then
  begin
    fUpdateAllImageProperty := Value;
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].UpdateAllImageProperty := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.LayoutDragDrop(Sender, Source: TObject; X, Y: Integer);
begin

end;

procedure TDicomMultiLayoutViewer.LayoutDragOver(Sender, Source: TObject; X, Y: Integer;
  State: Controls.TDragState; var Accept: Boolean);
begin
  if Source is TDCMMultiImage then
  begin
    Accept := true;
  end
  else
    Accept := false;
end;

function TDicomMultiLayoutViewer.GetViewerCount: Integer;
begin

  Result := 0;
  CalViewerCount(Result);
end;

procedure TDicomMultiLayoutViewer.CreateVerPanels;
var
  i: Integer;
begin
  OldW := Width;
  OldH := Height;
  DeletePanels;

  fPane1 := CreatePane(alTop);
  fPane1.Height := self.Height div 2;

  if FSeriesResizable then
  begin
    fSplitter := TDicomSplites.Create(Self);
    fSplitter.Top := fPane1.Height + 1;
    fSplitter.Align := alTop;
    fSplitter.Parent := self;
    fSplitter.Height := 2;
    fSplitter.Width := 2;
  end;

  fPane2 := CreatePane(alClient);

  i := fViewerID;
  fViewerID := -1;

  AdjustPanesViewerID;
  //  fPane1.Caption := IntToStr(fPane1.fViewerID);
  //  fPane2.Caption := IntToStr(fPane2.fViewerID);

end;

procedure TDicomMultiLayoutViewer.DeletePanels;
begin
  if self.IsSplitter then
  begin
    if fPane1.IsSplitter then
    begin
      fPane1.DeletePanels;
    end;
    //  raise Exception.Create('Child is not null, Can not be delete. Please delete its childs. Thank you!');
    if fPane2.IsSplitter then
    begin
      fPane2.DeletePanels;
    end;
    //  raise Exception.Create('Child is not null, Can not be delete. Please delete its childs. Thank you!');
    fPane1.Free;
    fPane1 := nil;

    fPane2.Free;
    fPane2 := nil;

    if fSplitter <> nil then
    begin
      fSplitter.Free;
      fSplitter := nil;
    end;
    AdjustPanesViewerID;
  end;
end;

procedure TDicomMultiLayoutViewer.Paint;
var
  k, i, h, w: Integer;
begin
  canvas.Brush.Color := Color;
  canvas.FillRect(rect(0, 0, ClientWidth, ClientHeight));

  if not IsSplitter then
  begin
    w := Width div Columns;
    h := Height div Rows;
    for k := 1 to Rows - 1 do
    begin
      Canvas.MoveTo(0, h * k);
      Canvas.LineTo(Width, h * k);
    end;
    for i := 1 to Columns - 1 do
    begin
      Canvas.MoveTo(i * w, 0);
      Canvas.LineTo(i * w, Height);
    end;
    Canvas.Font.Size := Min(width, height) div 8;
    Canvas.Brush.Style := bsClear;
    Canvas.TextOut((Width - Canvas.TextWidth(IntToStr(fViewerID))) div 2,
      (Height - Canvas.TextHeight('A')) div 2, IntToStr(fViewerID));
  end;
end;

procedure TDicomMultiLayoutViewer.CreateHozPanels;
begin
  OldW := Width;
  OldH := Height;
  DeletePanels;

  fPane1 := CreatePane(alLeft);
  fPane1.Width := self.Width div 2;

  if FSeriesResizable then
  begin
    fSplitter := TDicomSplites.Create(Self);
    fSplitter.Left := fPane1.Width + 1;
    fSplitter.Align := alLeft;
    fSplitter.Parent := self;
    fSplitter.Width := 2;
    fSplitter.Height := 2;
  end;

  fPane2 := CreatePane(alClient);

  AdjustPanesViewerID;
  //  fPane1.Caption := IntToStr(fPane1.fViewerID);
  //  fPane2.Caption := IntToStr(fPane2.fViewerID);
end;

procedure TDicomMultiLayoutViewer.ResetImage;
begin
  if not IsSplitter then
  begin
    if fViewer <> nil then
    begin
      fViewer.ResetImage;
    end;
  end
  else
  begin
    fPane1.ResetImage;
    fPane2.ResetImage;
  end;
end;

procedure TDicomMultiLayoutViewer.Clear;
begin
  FMoveActiveSeriesView := nil;

  fCurrentViewer := nil;
  fLastCurrentViewer := nil;
  if fPane1 <> nil then
  begin
    fpane1.Clear;
    fpane1.Free;
    fpane1 := nil;
  end;

  if fPane2 <> nil then
  begin
    fpane2.Clear;
    fpane2.Free;
    fpane2 := nil;
  end;

  if fSplitter <> nil then
  begin
    fSplitter.Free;
    fSplitter := nil;
  end;

  fVIewerID := 0;
  fRows := 1;
  fColumns := 1;
  fLimitOneSeries := true;
  fDisplayLabel := true;
  fDisplayWLLabel := true;
end;

procedure TDicomMultiLayoutViewer.RemoveViewer;
begin
  FMoveActiveSeriesView := nil;
  fCurrentViewer := nil;
  fLastCurrentViewer := nil;
  if not IsSplitter then
  begin
    if fViewer <> nil then
    begin
      fViewer.Free;
      fViewer := nil;
      PopupMenu := backupPopupMenu;
    end;
  end
  else
  begin
    fPane1.RemoveViewer;
    fPane2.RemoveViewer;
  end;
end;

procedure TDicomMultiLayoutViewer.UpdateViews;
begin
  if not IsSplitter then
  begin
    if fViewer <> nil then
    begin
      fViewer.UpdateView;
    end;
  end
  else
  begin
    fPane1.UpdateViews;
    fPane2.UpdateViews;
  end;
end;

procedure TDicomMultiLayoutViewer.RefreshViews;
begin
  if not IsSplitter then
  begin
    if fViewer <> nil then
    begin
      fViewer.RefreshView;
    end;
  end
  else
  begin
    fPane1.RefreshViews;
    fPane2.RefreshViews;
  end;
end;

procedure TDicomMultiLayoutViewer.CreateViewer;
var
  p1: TDicomMultiLayoutViewer;
begin
  fCurrentViewer := nil;
  fLastCurrentViewer := nil;
  if not IsSplitter then
  begin
    backupPopupMenu := PopupMenu;
    PopupMenu := nil;
    p1 := self.GetRootPanel;
    if fViewer = nil then
    begin
      fViewer := TDicomMultiViewer.Create(self);
      fViewer.fOnCanLock := p1.TriggerOnCanLock;
      fViewer.fOnShowToolbarOrView := p1.TriggerOnShowToolbarOrView;
      fViewer.fOnViewSelected := p1.TriggerOnViewSelected;
      fVIewer.FOnMultiViewSelected := p1.TriggerOnMultiViewSelected;
      fViewer.fOnViewFlagChange := p1.TriggerOnViewFlagChange;
      fViewer.FOn3DCursorMove := p1.Do3DCursor;
      fViewer.FOn3DCursorEnd := p1.DoEnd3DCursor;
      fViewer.FOn3DCursorStart := p1.DoStart3DCursor;

      fViewer.fOnReturnObjectSelect := p1.TriggerOnReturnObjectSelect;
      fViewer.fOnCurrentImageTo := p1.TriggerOnCurrentImageStackTo;
      fViewer.FOnImageCineTo := p1.TriggerOnCurrentImageCineTo;
      fViewer.fOnDicomSave := p1.TriggerOnDicomSave;
      fViewer.fOnViewDblClickSelect := p1.TriggerOnViewDblClickSelect;
      fViewer.FOnSetPresetWidthLevel := p1.TriggerPresetWidthLevel;

      fViewer.OnOverlayLabel := p1.TriggerDicomViewOverlaylabel;
      fViewer.OnCustomOverlayLabel := p1.TriggerDicomViewCustomlabel;

      //      fViewer.fOnPopupClick := p1.TriggerOnPopupClick;
      //      fViewer.fOnDicomPrintClick := p1.TriggerOnDicomPrintClick;
      fViewer.fOnViewKeyDown := p1.TriggerOnViewKeyDown;
      fViewer.fOnViewMouseDown := p1.TriggerOnViewMouseDown;
      fViewer.fOnViewMouseMove := p1.TriggerOnViewMouseMove;
      fViewer.fOnViewMouseUp := p1.TriggerOnViewMouseUp;

      fViewer.DragFrom := p1.DragFrom;
      fViewer.DragDropMode := p1.DragDropMode;

      fViewer.OnTopoLineClick := p1.DoTopoLineClick;
      fViewer.FOnCreateDicomViewItem := p1.TriggerOnCreateDicomViewItem;
      fViewer.CustomDicomImageClass := p1.CustomDicomImageClass;

      fViewer.fOnImageWinLevelChange := p1.TriggerOnImageWinLevelChange;
      fViewer.fOnImageScrollChange := p1.TriggerOnImageScrollChange;
      fViewer.fOnImageZoomChange := p1.TriggerOnImageZoomChange;

      fViewer.fOnDicomLockChange := p1.TriggerOnDicomLockChange;
      fViewer.OnDatasetChanged := p1.TriggerOnImageDataChange;

      fViewer.OnCustomPopupMenuPopup := p1.TriggerOnCustomPopupMenuPopup;
      fViewer.OnCustomDrawObjectPopupMenuPopup := p1.TriggerOnCustomDrawObjectPopupMenuPopup;
      fViewer.OnDragDropToPrint := p1.TriggerOnDragDropToPrint;
      //      fViewer.OnCustomPopupMenuClick := p1.TriggerOnCustomPopupMenuClick;

      fViewer.OnViewDragDrop := p1.TriggerOnDragDropEvent;
      fViewer.OnViewDragOver := p1.TriggerOnDragOverEvent;
      fViewer.OnViewStartDrag := p1.TriggerOnViewStartDrag;

      fViewer.fAfterNewDrawObject := p1.TriggerAfterNewDrawObject;
      fViewer.fAfterObjectSize := p1.TriggerAfterObjectSize;
      fViewer.fAfterObjectMove := p1.TriggerAfterObjectMove;

      fViewer.OnDragDrop := p1.LayoutDragDrop;
      fViewer.OnDragOver := p1.LayoutDragOver;

      fViewer.Align := alClient;
      fViewer.FImageAngle := p1.fImageAngle;

      fViewer.Parent := self;
    end;

    fViewer.CanCheckSize := p1.CanCheckSize;
    fViewer.ScrollBarVisible := p1.ScrollBarVisible;
    fViewer.DblClickToFullSeries := p1.DblClickToFullSeries;

    fViewer.Rows := Rows;
    fViewer.Columns := Columns;
    fViewer.Color := clBlack;
    fViewer.fDisplayLabel := p1.fDisplayLabel;
    fViewer.fDisplayWLLabel := p1.fDisplayWLLabel;
    fViewer.fDisplayRuler := p1.fDisplayRuler;
    fViewer.DisplayRightRuler := p1.FDisplayRightRuler;
    fViewer.DisplayBottomRuler := p1.FDisplayBottomRuler;

    fViewer.fTextOverlayMode := p1.fTextOverlayMode;
    fViewer.fUpdateAllImageProperty := p1.fUpdateAllImageProperty;
    fViewer.fCanMultiSelect := p1.fCanMultiSelect;

    fViewer.fWhiteGrid := p1.fWhiteGrid;

    fViewer.fLimitOneSeries := p1.fLimitOneSeries;
    fViewer.fOnlyViewMultiSelected1 := p1.fOnlyViewMultiSelected1;
    fViewer.fOnlyViewMultiSelected2 := p1.fOnlyViewMultiSelected2;
    fViewer.fOnlyViewMultiSelected3 := p1.fOnlyViewMultiSelected3;
    fViewer.fOnlyViewMultiSelected4 := p1.fOnlyViewMultiSelected4;

    fViewer.fLeftMouseInteract := p1.fLeftMouseInteract;
    fViewer.fRightMouseInteract := p1.fRightMouseInteract;
    fViewer.fMouseWheelInteract := p1.fMouseWheelInteract;
    fViewer.fLeftLeaderMouserInspect := p1.fLeftLeaderMouserInspect;
    fViewer.Update;
  end
  else
  begin
    if fViewer <> nil then
    begin
      fViewer.Free;
      fViewer := nil;
    end;
    fPane1.CreateViewer;
    fPane2.CreateViewer;
  end;
end;

procedure TDicomMultiLayoutViewer.SpritInto(X, Y: Integer);
var
  i, k: integer;
  c1, c2: TDicomMultiLayoutViewer;
begin
  Clear;

  i := 1;

  c1 := self;
  while i < X do
  begin
    c1.CreateVerPanels;
    c1.fPane1.Height := Height div X;
    //c1.fPane1.Width := Width div Y;

    c2 := c1.fPane1;
    k := 1;
    while k < Y do
    begin
      c2.CreateHozPanels;
      //c2.fPane1.Height := Height div X;
      c2.fPane1.Width := Width div Y;
      c2 := c2.fPane2;
      inc(k);
    end;

    c1 := c1.fPane2;
    inc(i);
  end;
  if Y > 1 then
  begin
    k := 1;
    while k < Y do
    begin
      c1.CreateHozPanels;
      //c1.fPane1.Height := Height div X;
      c1.fPane1.Width := Width div Y;
      c1 := c1.fPane2;
      inc(k);
    end;
  end;
end;

procedure TDicomMultiLayoutViewer.LoadFrom(das1: TDicomAttributes);
var
  das2: TDicomAttributes;
  da: TDicomAttribute;
  str1: string;
  f1: Double;
begin
  str1 := das1.GetString($2813, $1007);
  if str1 = 'LEFT' then
  begin
    CreateHozPanels;
    f1 := das1.getInteger($2813, $1008) / 100;
    fPane1.Width := trunc(Width * f1);

    da := das1.Item[$2813, $1002];
    if (da <> nil) and (da.GetCount > 0) then
    begin
      das2 := da.Attributes[0];
      fPane1.LoadFrom(das2);
    end;

    da := das1.Item[$2813, $1003];
    if (da <> nil) and (da.GetCount > 0) then
    begin
      das2 := da.Attributes[0];
      fPane2.LoadFrom(das2);
    end;
  end
  else
    if str1 = 'TOP' then
  begin
    CreateVerPanels;
    f1 := das1.getInteger($2813, $1008) / 100;
    fPane1.Height := trunc(Height * f1);

    da := das1.Item[$2813, $1002];
    if (da <> nil) and (da.GetCount > 0) then
    begin
      das2 := da.Attributes[0];
      fPane1.LoadFrom(das2);
    end;

    da := das1.Item[$2813, $1003];
    if (da <> nil) and (da.GetCount > 0) then
    begin
      das2 := da.Attributes[0];
      fPane2.LoadFrom(das2);
    end;
  end
  else
    if str1 = 'NONE' then
  begin
    fRows := das1.getInteger($2813, $1004);
    fColumns := das1.getInteger($2813, $1005);
    fViewerID := das1.getInteger($2813, $1006);
    fLimitOneSeries := das1.getString($2813, $1010) = 'T';
    fDisplayLabel := das1.getString($2813, $1009) = 'T';
    invalidate;
  end;
end;

procedure TDicomMultiLayoutViewer.SaveTo(das1: TDicomAttributes);
var
  das2: TDicomAttributes;
  da: TDicomAttribute;
begin
  das1.AddVariant($2813, $1001, Name);
  if IsSplitter then
  begin
    if self.IsVerticalSplitter then
    begin
      das1.AddVariant($2813, $1007, 'LEFT');
      das1.AddVariant($2813, $1008, trunc(fPane1.Width * 100 / Width));
    end
    else
    begin
      das1.AddVariant($2813, $1007, 'TOP');
      das1.AddVariant($2813, $1008, trunc(fPane1.Height * 100 / Height));
    end;

    da := das1.Add($2813, $1002);
    das2 := TDicomAttributes.Create;
    da.AddData(das2);
    fPane1.SaveTo(das2);

    da := das1.Add($2813, $1003);
    das2 := TDicomAttributes.Create;
    da.AddData(das2);
    fPane2.SaveTo(das2);
  end
  else
  begin
    das1.AddVariant($2813, $1004, Rows);
    das1.AddVariant($2813, $1005, Columns);
    das1.AddVariant($2813, $1006, fViewerID);
    if self.fDisplayLabel then
      das1.AddVariant($2813, $1009, 'T')
    else
      das1.AddVariant($2813, $1009, 'F');

    if self.fLimitOneSeries then
      das1.AddVariant($2813, $1010, 'T')
    else
      das1.AddVariant($2813, $1010, 'F');

    das1.AddVariant($2813, $1007, 'NONE')
  end;
end;

procedure TDicomMultiLayoutViewer.SetupDialog;
var
  i: Integer;
begin
  with TLayoutSetupForm.Create(self) do
  try
    SpinEdit1.Text := IntToStr(Rows);
    SpinEdit2.Text := IntToStr(Columns);
    CheckBox1.Checked := fDisplayLabel;
    CheckBox2.Checked := fLimitOneSeries;

    if ShowModal = mrok then
    begin
      if SpinEdit1.Text <> '' then
      begin
        i := StrToInt(SpinEdit1.Text);
        if i > 0 then
          Rows := i
        else
          ShowMessage(SpinEdit1.Text + ' is wrong number');
      end;
      if SpinEdit2.Text <> '' then
      begin
        i := StrToInt(SpinEdit2.Text);
        if i > 0 then
          Columns := i
        else
          ShowMessage(SpinEdit2.Text + ' is wrong number');
      end;
      fDisplayLabel := CheckBox1.Checked;
      fLimitOneSeries := CheckBox2.Checked;
      //fCanMultiSelect
      //fTextOverlayMode
      //fUpdateAllImageProperty
    end;
  finally
    Free;
  end;
  invalidate;
end;

procedure TDicomMultiLayoutViewer.AddMenuClick(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    0: CreateVerPanels;
    1: CreateHozPanels;
    2:
      begin
        if Parent is TDicomMultiLayoutViewer then
        begin
          TDicomMultiLayoutViewer(Parent).DeletePanels;
        end;
      end;
    3:
      begin
        SetupDialog;
      end;
  end;
end;

procedure TDicomMultiLayoutViewer.WMSize(var Message: TWMSize);
begin
  inherited;
  if not (csLoading in ComponentState) then
    if IsSplitter then
    begin
      if IsVerticalSplitter then
        fPane1.Width := trunc((fPane1.Width * width / OldW))
      else
        fPane1.Height := trunc((fPane1.Height * Height / OldH));

      //ShowMessage(Format('%d-%d,%d-%d',[w,width,h,height]));
      OldW := Width;
      OldH := Height;
    end;
end;

procedure TDicomMultiLayoutViewer.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
end;

procedure TDicomMultiLayoutViewer.DblClick;
begin
  SetupDialog;
  inherited;
end;

procedure TDicomMultiLayoutViewer.TriggerOnCanLock(Sender: TObject; var ACanLock: Boolean);
begin
  if assigned(fOnCanLock) then
    fOnCanLock(Sender, ACanLock);
end;

procedure TDicomMultiLayoutViewer.TriggerOnShowToolbarOrView(Sender: TObject; AConerIndex:
  Integer);
begin
  if assigned(fOnShowToolbarOrView) then
    fOnShowToolbarOrView(Sender, AConerIndex);
end;

procedure TDicomMultiLayoutViewer.TriggerOnViewSelected(Sender: TObject);
begin
  if assigned(fOnViewSelected) then
    fOnViewSelected(Sender);
end;

procedure TDicomMultiLayoutViewer.TriggerOnMultiViewSelected(Sender: TObject);
begin
  if fCurrentViewer <> Sender then
  begin
    fLastCurrentViewer := fCurrentViewer;
    fCurrentViewer := TDicomMultiViewer(Sender);
  end;
  if assigned(FOnMultiViewSelected) then
    FOnMultiViewSelected(sender);
end;

procedure TDicomMultiLayoutViewer.TriggerOnViewFlagChange(Sender: TObject);
begin
  if assigned(fOnViewFlagChange) then
    fOnViewFlagChange(Sender);
end;

procedure TDicomMultiLayoutViewer.TriggerOnReturnObjectSelect(Sender: TObject);
begin
  if assigned(fOnReturnObjectSelect) then
    fOnReturnObjectSelect(Sender);
end;

procedure TDicomMultiLayoutViewer.TriggerOnCurrentImageStackTo(Sender: TObject; AOldIndex,
  ANewIndex: Integer);
begin
  if assigned(fOnCurrentImageTo) then
    fOnCurrentImageTo(Sender, AOldIndex, ANewIndex);
end;

procedure TDicomMultiLayoutViewer.TriggerOnCurrentImageCineTo(Sender: TObject; AIndex: Integer);
begin
  if assigned(FOnImageCineTo) then
    FOnImageCineTo(Sender, AIndex);
end;

procedure TDicomMultiLayoutViewer.TriggerOnDicomSave(Sender: TObject; ADatasets: TDicomDatasets;
  IsSaveImage: Boolean);
begin
  if assigned(fOnDicomSave) then
    fOnDicomSave(Sender, ADatasets, IsSaveImage);
end;

procedure TDicomMultiLayoutViewer.TriggerOnViewDblClickSelect(Sender: TObject);
begin
  if assigned(fOnViewDblClickSelect) then
    fOnViewDblClickSelect(Sender);
end;

{procedure TDicomMultiLayoutViewer.TriggerOnPopupClick(Sender: TObject; ATag: Integer);
begin
  if assigned(fOnPopupClick) then
    fOnPopupClick(Sender, ATag);
end;

procedure TDicomMultiLayoutViewer.TriggerOnDicomPrintClick(Sender: TObject; Attribute: TDicomAttributes);
begin
  if assigned(fOnDicomPrintClick) then
    fOnDicomPrintClick(Sender, Attribute);
end; }

procedure TDicomMultiLayoutViewer.TriggerOnViewKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  if assigned(fOnViewKeyDown) then
    fOnViewKeyDown(Sender, Key, Shift);
end;

procedure TDicomMultiLayoutViewer.TriggerOnImageWinLevelChange(Sender: TObject; W, L: integer);
begin
  if assigned(fOnImageWinLevelChange) then
    fOnImageWinLevelChange(Sender, w, l);
end;

procedure TDicomMultiLayoutViewer.TriggerOnImageScrollChange(Sender: TObject; X, Y: Double);
begin
  if assigned(fOnImageScrollChange) then
    fOnImageScrollChange(Sender, x, y);
end;

procedure TDicomMultiLayoutViewer.TriggerOnImageZoomChange(Sender: TObject; Z: Double);
begin
  if assigned(fOnImageZoomChange) then
    fOnImageZoomChange(Sender, z);
end;

procedure TDicomMultiLayoutViewer.TriggerOnDicomLockChange(Sender: TObject; ALockCount: Integer);
begin
  if assigned(fOnDicomLockChange) then
    fOnDicomLockChange(Sender, ALockCount);
end;

procedure TDicomMultiLayoutViewer.TriggerOnImageDataChange(Sender: TObject);
begin
  if assigned(fOnDatasetChanged) then
    fOnDatasetChanged(sender);
end;

procedure TDicomMultiLayoutViewer.TriggerOnCustomPopupMenuPopup(Sender: TObject);
begin
  if assigned(OnCustomPopupMenuPopup) then
    OnCustomPopupMenuPopup(sender);
end;
{
procedure TDicomMultiLayoutViewer.TriggerOnCustomPopupMenuClick(Sender: TObject);
begin
  if assigned(OnCustomPopupMenuClick) then
    OnCustomPopupMenuClick(sender);
end;
}

procedure TDicomMultiLayoutViewer.TriggerAfterNewDrawObject(Sender: TObject; AObject:
  TDicomDrawObject);
begin
  if assigned(fAfterNewDrawObject) then
    fAfterNewDrawObject(Sender, AObject);
end;

procedure TDicomMultiLayoutViewer.TriggerAfterObjectSize(Sender: TObject; AObject:
  TDicomDrawObject);
begin
  if assigned(fAfterObjectSize) then
    fAfterObjectSize(Sender, AObject);
end;

procedure TDicomMultiLayoutViewer.TriggerAfterObjectMove(Sender: TObject; AObject:
  TDicomDrawObject);
begin
  if assigned(fAfterObjectMove) then
    fAfterObjectMove(Sender, AObject);
end;

function TDicomMultiLayoutViewer.GetActiveView: TDicomMultiViewer;
begin
  if fCurrentViewer <> nil then
  begin
    Result := fCurrentViewer;
  end
  else
  begin
    Result := GetViewer(0);
  end;
end;

function TDicomMultiLayoutViewer.GetLastActiveView: TDicomMultiViewer;
begin
  if fLastCurrentViewer <> nil then
  begin
    Result := fLastCurrentViewer;
  end
  else
    if self.GetViewerCount > 1 then
  begin
    if GetViewer(0) = fCurrentViewer then
      Result := GetViewer(1)
    else
      if GetViewer(1) = fCurrentViewer then
      Result := GetViewer(0)
  end
  else
  begin
    Result := nil;
  end;
end;

procedure TDicomMultiLayoutViewer.PopupMenu1Popup(Sender: TObject);
var
  b1: Boolean;
  i: Integer;
begin
  b1 := not self.IsSplitter;
  for i := 0 to PopupMenu.Items.Count - 1 do
    PopupMenu.Items[i].Visible := b1;
end;

const
  DEFAULT_WIDTH = 6; {Width or Height of Splitter}
  ARROW_WIDTH = 24; // DONT CHANGE
  ARROW_HEIGHT = 4; // DONT CHANGE

constructor TDicomSplites.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPattern := TBitmap.Create;

  FArrows := TBitmap.Create;
  FArrowPlace := apCenter;
  FArrowBackgr := true;
  case Align of
    alLeft, alRight: Width := DEFAULT_WIDTH;
    alTop, AlBottom: Height := DEFAULT_WIDTH;
  end;
  FLastAlign := alClient; // we do this to force Pattern createing
end;

destructor TDicomSplites.Destroy;
begin
  FPattern.Free;
  FArrows.Free;
  inherited Destroy;
end;

procedure TDicomSplites.CreatePatterns;
const
  PointColor = clWhite;
  ShadowColor = clGray;
var
  points: array[0..4] of TPoint;
  bw, bh: Integer;

  procedure PaintPattern;
  begin
    {Height and Width = 8, see Help, dont change,
     another values doesnt work under win95/98}
    FPattern.width := 8;
    FPattern.height := 8;
    with FPattern.Canvas do
    begin
      Brush.Color := Color;
      FillRect(Rect(0, 0, 4, 4));
      Pixels[0, 0] := PointColor;
      Pixels[1, 1] := ShadowColor;
      Pixels[2, 2] := PointColor;
      Pixels[3, 3] := ShadowColor;
      {Copying painted part to the hole Bitmap, wee need this cause
       height and width of 4 doent works under win95/98}
       {   _________
          |  1 | 2  |   First copy 1 to 2
          |----|----|
          |  3 | 4  |   then copy 1&2 to 3&4
          -----------
       }
      CopyMode := cmSrcCopy;
      // Copying 1 to 2
      CopyRect(Bounds(4, 0, 4, 4), FPattern.Canvas, Bounds(0, 0, 4, 4));
      // Copying 1&2 to 3&4
      CopyRect(Bounds(0, 4, 8, 4), FPattern.Canvas, Bounds(0, 0, 8, 4));
    end;
  end;

  procedure PaintArrows;
  begin
    { Pfeile }
    case align of
      alLeft,
        alRight:
        begin
          bw := ARROW_HEIGHT;
          bh := ARROW_WIDTH;
          FArrows.width := bw;
          FArrows.height := bh;
          with FArrows.Canvas do
          begin
            Brush.Color := Color;
            FillRect(Rect(0, 0, bw, bh));
          end;
          points[0] := Point(1, 3);
          points[1] := Point(3, 5);
          points[2] := Point(3, 7);
          points[3] := Point(1, 9);
          points[4] := Point(1, 3);
          with FArrows.Canvas do
          begin
            Brush.Color := ShadowColor;
            Pen.Color := ShadowColor;
            Polygon(points);
            Pen.Color := clBlack;
            MoveTo(0, 3);
            LineTo(0, 11);
            Pen.Color := PointColor;
            MoveTo(1, 10);
            LineTo(6, 5); //5,6); //LineTo(3,6);
          end;

          points[0] := Point(3, 15);
          points[1] := Point(1, 17);
          points[2] := Point(1, 18);
          points[3] := Point(3, 20);
          points[4] := Point(3, 15);
          with FArrows.Canvas do
          begin
            Brush.Color := ShadowColor;
            Pen.Color := ShadowColor;
            Polygon(points);
            Pen.Color := PointColor;
            MoveTo(4, 14);
            LineTo(4, 22);
            Pen.Color := clBlack;
            MoveTo(0, 17);
            LineTo(4, 13);
          end;

        end;
      alBottom,
        alTop:
        begin
          bw := ARROW_WIDTH;
          bh := ARROW_HEIGHT;
          FArrows.width := bw;
          FArrows.height := bh;
          with FArrows.Canvas do
          begin
            Brush.Color := Color;
            FillRect(Rect(0, 0, bw, bh));
          end;
          points[0] := Point(4, 3);
          points[1] := Point(5, 1);
          points[2] := Point(7, 1);
          points[3] := Point(9, 3);
          points[4] := Point(3, 3);
          with FArrows.Canvas do
          begin
            Brush.Color := ShadowColor;
            Pen.Color := ShadowColor;
            Polygon(points);
            Pen.Color := PointColor;
            MoveTo(3, 4);
            LineTo(11, 4);
            Pen.Color := clBlack;
            MoveTo(2, 3);
            LineTo(5, 0);
            LineTo(7, 0);
          end;

          points[0] := Point(15, 1);
          points[1] := Point(20, 1);
          points[2] := Point(18, 3);
          points[3] := Point(17, 3);
          points[4] := Point(15, 1);
          with FArrows.Canvas do
          begin
            Brush.Color := ShadowColor;
            Pen.Color := ShadowColor;
            Polygon(points);
            Pen.Color := clBlack;
            MoveTo(14, 0);
            LineTo(22, 0);
            Pen.Color := PointColor;
            MoveTo(21, 1);
            LineTo(17, 5);
          end;
        end;
    end; {case}
  end;

begin
  PaintPattern;
  PaintArrows;
  FLastAlign := Align;
end;

procedure TDicomSplites.Paint;
const
  XorColor = $00FFD8CE;
var
  FrameBrush: HBRUSH;
  R: TRect;
  bw, bh: Integer;

  procedure PaintPattern;
  begin
    FrameBrush := CreatePatternBrush(FPattern.Handle);
    FillRect(Canvas.Handle, R, FrameBrush);
    DeleteObject(FrameBrush);
  end;

  procedure PaintArrows;
  var
    tr, ar: TRect; {Arrow Rect}
    rh, rw: Integer;
  begin
    rw := R.Right - R.Left;
    rh := R.Bottom - R.Top;
    case Align of
      alLeft, alRight:
        begin
          bw := ARROW_HEIGHT;
          bh := ARROW_WIDTH;
          case FArrowPlace of
            apCenter: ar := Bounds(R.Left + ((rw - bw) shr 1),
                R.Top + ((rh - bh) shr 1), bw, bh);
            apLeftOrTop: ar := Bounds(R.Left + ((rw - bw) shr 1),
                R.Top, bw, bh);

            apRightOrBottom: ar := Bounds(R.Left + ((rw - bw) shr 1),
                R.Top + rh - bh, bw, bh);
          end;
        end;
      alBottom, alTop:
        begin
          bw := ARROW_WIDTH;
          bh := ARROW_HEIGHT;
          case FArrowPlace of
            apCenter: ar := Bounds(R.Left + ((rw - bw) shr 1),
                R.Top + ((rh - bh) shr 1), bw, bh);
            apLeftOrTop: ar := Bounds(R.Left,
                R.Top + ((rh - bh) shr 1), bw, bh);
            apRightOrBottom: ar := Bounds(R.Left + rw - bw,
                R.Top + ((rh - bh) shr 1), bw, bh);
          end;
        end;
    end;

    if FArrowBackGr then
    begin
      {Drawing Arrow Background, to overpaint the Point-Pattern}
      Canvas.Brush.Color := Color;
      tr := ar;
      case Align of
        alLeft, alRight:
          begin
            tr.Left := R.Left;
            tr.Right := R.Right;
          end;
        alBottom, alTop:
          begin
            tr.Top := R.Top;
            tr.Bottom := R.Bottom;
          end;
      end;
      Canvas.FillRect(tr); {Arrow Background}
    end;
    Canvas.CopyRect(ar, FArrows.Canvas, Bounds(0, 0, bw, bh));

    { Pfeile }
{    case align of
      alLeft,   alRight : InflateRect(R, -1, 0);
      alBottom, alTop   : InflateRect(R, 0, -1);
    end; }{case}
  end;

  procedure PaintBevel;
  begin
    if Align in [alLeft, alRight] then
      InflateRect(R, -1, 2)
    else
      InflateRect(R, 2, -1);
    OffsetRect(R, 1, 1);
    FrameBrush := CreateSolidBrush(ColorToRGB(clBtnHighlight));
    FrameRect(Canvas.Handle, R, FrameBrush);
    DeleteObject(FrameBrush);
    OffsetRect(R, -2, -2);
    FrameBrush := CreateSolidBrush(ColorToRGB(clBtnShadow));
    FrameRect(Canvas.Handle, R, FrameBrush);
    DeleteObject(FrameBrush);

    { Point-Pattern - Rect}
    R := ClientRect;
    case Align of
      alLeft, alRight: InflateRect(R, -4, -2);
      alBottom, alTop: InflateRect(R, -2, -4);
      alClient: InflateRect(R, -4, -4);
    end;
  end;

begin
  R := ClientRect;
  if Beveled then
    PaintBevel;
  if FLastAlign <> Align then
    CreatePatterns;
  { Painting Pattern}
  PaintPattern;
  { Pfeile Zeichnen , in dieser reihenfolge weil R wird verschoben}
  PaintArrows;

  { Umrahmung wдhrend des IDE-Designers }
  if csDesigning in ComponentState then
    { Draw outline }
    with Canvas do
    begin
      Pen.Style := psDot;
      Pen.Mode := pmXor;
      Pen.Color := XorColor;
      Brush.Style := bsClear;
      Rectangle(0, 0, ClientWidth, ClientHeight);
    end;
  if Assigned(OnPaint) then
    OnPaint(Self);
end;

procedure TDicomSplites.setArrowPlace(value: TArrowPlace);
begin
  if FArrowPlace <> value then
  begin
    FArrowPlace := value;
    invalidate;
  end;
end;

function TDicomSplites.getArrowPlace: TArrowPlace;
begin
  Result := FArrowPlace;
end;

procedure TDicomSplites.setArrowBackGr(value: Boolean);
begin
  if FArrowBackGr <> value then
  begin
    FArrowBackGr := value;
    invalidate;
  end;
end;

function TDicomSplites.getArrowBackGr: Boolean;
begin
  Result := FArrowBackGr;
end;

procedure TMagnifierView.DoPaintBuffer;
begin

end;

procedure TMagnifierView.WMNCHitTest(var Message: TWMNCHitTest);
begin
  Message.Result := HTTRANSPARENT;
end;

procedure TMagnifierView.WMNCPaint(var Message: TMessage);
var
  R: TRect;
begin
  Canvas.Handle := GetWindowDC(Handle);
  with Canvas do
  try
    R := Rect(0, 0, Width, Height);
    DrawEdge(Handle, R, BDR_RAISEDOUTER, BF_RECT);
  finally
    ReleaseDC(Handle, Canvas.Handle);
    Canvas.Handle := 0;
  end;
end;

procedure TMagnifierView.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP or WS_BORDER;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
    if NewStyleControls then
      ExStyle := WS_EX_TOOLWINDOW;
  end;
end;

procedure TDCMMultiImage.UpdateDatasetToIcons;
var MyJPG: TJPEGImage; // Объект - JPEG
    ResStream: TResourceStream; // Объект - поток ресурсов
  function GetSeriesCount(ASeriesUID: string): Integer;
  var
    i: Integer;
    da1: TDicomAttributes;
  begin
    Result := 0;
    for i := 0 to fIconData.GetCount - 1 do
    begin
      da1 := fIconData.Attributes[i];
      if da1.GetString($20, $E) = ASeriesUID then
        Result := Result + 1;
    end;
  end;
var
  i, n: Integer;
  d1: TDicomImage;
  da1, da2: TDicomAttributes;
  dd1: TDicomAttribute;
  item1: TCnsBitmap32ExItem;
  das1: TDicomDataset;
  jpeg1: TJpegGraphic;
  //  strs1:TStrings;
  bm1: TBitmap;
  v_is_WaveformData : Boolean;
  v_filename : string;
begin
  if FBufferMode or
    ( (FDicomDatasets<>nil) and
       ( FDicomDatasets.Count>0 ) and
      (FDicomDatasets[0].Attributes.WaveformData<>nil) )
  then
  begin
    try
      v_is_WaveformData := ( (FDicomDatasets<>nil) and (FDicomDatasets.Count>0) and
                           Assigned(FDicomDatasets[0].Attributes.WaveformData) and
                           (FDicomDatasets[0].Attributes.WaveformData<>nil) );
    except
      v_is_WaveformData:=False;
    end;
    Bitmaps.Clear;
    if assigned(FDicomDatasets) and (FDicomDatasets.Count > 0) then
    begin
      if ViewGridMode = vgmSeriesGrid then
        n := FDicomDatasets.GetSeriesCount
      else
        n := FDicomDatasets.Count;

      for i := 0 to n - 1 do
      begin

        if FViewGridMode = vgmSeriesGrid then
          das1 := FDicomDatasets.SeriesDataset[i]
        else
          das1 := FDicomDatasets[i];
        da1 := das1.Attributes;
        d1 := da1.ImageData;

        if ((not assigned(d1)) {and (not v_is_WaveformData)}) then
          exit;

        item1 := TCnsBitmap32ExItem(Bitmaps.Add);
        item1.InstanceUID := da1.GetString(8, $18);
        if FViewGridMode = vgmSeriesGrid then
          item1.OrderID := FDicomDatasets.GetSeriesImageCount(das1);
      {  if not v_is_WaveformData then
        begin  }
          UpdateBitmapitem(Item1);
      {  end else
        begin    // иконка ЭКГ
          item1 := TCnsBitmap32ExItem(Bitmaps.Add);
          item1.InstanceUID := da1.GetString(8, $18);
          item1.OrderID := da1.GetInteger($20, $13);
          MyJPG := TJPEGImage.Create;
          try
            ResStream := TResourceStream.CreateFromID(HInstance, 1, RT_RCDATA);
            try
              MyJPG.LoadFromStream(ResStream);
              Item1.Bitmap.Assign(MyJPG);
            finally
              ResStream.Free;
            end;
          finally
            MyJPG.Free;
          end;
        end; }
      end
    end
    else
    if fIconData <> nil then
    begin
      FViewGridMode := vgmStandardGrid;
      for i := 0 to fIconData.GetCount - 1 do
      begin
        da1 := fIconData.Attributes[i];

        item1 := TCnsBitmap32ExItem(Bitmaps.Add);
        item1.InstanceUID := da1.GetString(8, $18);

        item1.OrderID := da1.GetInteger($20, $13);

        dd1 := da1.Item[$2809, $2002];
        if assigned(dd1) and (dd1.GetCount > 0) then
        begin
          bm1 := TBitmap.Create;
          jpeg1 := TJpegGraphic.Create;
          try
            jpeg1.LoadFromStream(dd1.AsOBData[0]);

            jpeg1.assignto(bm1);
          finally
            jpeg1.Free;
          end;
          Item1.Bitmap.Assign(bm1);
          bm1.Free;
        end;
      end;
    end;
    UpdateScrollBars;
  end;
end;

procedure TDCMMultiImage.RefreshNews;
var
  i, n : Integer;
  d1: TDicomImage;
  da1: TDicomAttributes;
  item1: TCnsBitmap32ExItem;
begin
  if FBufferMode then
  begin
    if ViewGridMode = vgmSeriesGrid then
    begin
      UpdateDatasetToIcons;
    end
    else
      if assigned(FDicomDatasets) and (FDicomDatasets.Count > 0) then
    begin
      n := FDicomDatasets.Count;

      for i := Bitmaps.Count to n - 1 do
      begin

        da1 := FDicomDatasets[i].Attributes;

        d1 := da1.ImageData;
        if not assigned(d1) then
          exit;

        item1 := TCnsBitmap32ExItem(Bitmaps.Add);
        item1.InstanceUID := da1.GetString(8, $18);

        UpdateBitmapitem(Item1);
      end
    end;
    UpdateScrollBars;
  end;
  invalidate;
end;

function TDCMMultiImage.FindDataset(AItem: string): TDicomAttributes;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to fDicomDatasets.Count - 1 do
  begin
    if AItem = fDicomDatasets[i].Attributes.GetString(8, $18) then
    begin
      Result := fDicomDatasets[i].Attributes;
      break;
    end;
  end;
end;

procedure TDCMMultiImage.UpdateBitmapitem(AItem: TCnsBitmap32ExItem);
var
  w1, l1, w, h: Integer;
  Bm: TCnsBitmap32;
  d1: TDicomImage;
  das1: TDicomAttributes;
  str2: string;
  f1, AVerOff, AHizOff: Double;
  r: TRect;
  AT: TAffineTransformation;
begin
  das1 := FindDataset(Aitem.InstanceUID);
  if das1 = nil then
    exit;
  d1 := das1.ImageData;
  //d1 := LoadJPEGfromEXE (1); // загрузим jpeg из res-файла
  BM := TCnsBitmap32.Create;
  try

    if ViewGridMode in [vgmStandardgrid, vgmSeriesGrid] then
    begin
      w1 := d1.WindowWidth;
      l1 := d1.WindowCenter;
      d1.WindowCenter := das1.getInteger($0028, $1050);
      d1.WindowWidth := das1.getInteger($0028, $1051);
    end;
    DCM_ImageData_Bitmap32.AssignToBitmap(d1, BM, false);
//    LoadJPEGfromEXE( 1, BM.Canvas );

    if ViewGridMode in [vgmStandardgrid, vgmSeriesGrid] then
    begin
      d1.WindowCenter := l1;
      d1.WindowWidth := w1;
    end;
    //          b1 := d1.Attributes.GetString(8, $60) = 'VR';
    DCM_ImageData_Bitmap32.OverlayLabels(d1, BM, true);
    DCM_ImageData_Bitmap32.LoadUserDrawObjectToBitmap(d1, BM);
    if ViewGridMode <> vgmSeriesGrid then
      AItem.OrderID := d1.InstanceNumber;
    if FViewGridMode = vgmSeriesGrid then
    begin
      str2 := das1.GetString($0018, $15);
      if str2 = '' then
        str2 := das1.GetString($8, $103E);
      if str2 = '' then
        str2 := 'unknown';
      AItem.Description := str2;
    end;

    R := GetViewportRect;

    w := (R.Right - R.Left) div Row;
    h := (R.Bottom - R.Top) div Column;

    aitem.Bitmap.SetSize(w, h);

    {    s1 := Min(w / bm.Width, h / bm.Height);
        cx := s1 * bm.Width;
        cy := s1 * bm.Height;
        ox := (w - cx) / 2;
        oy := (h - cy) / 2;}

    AT := TAffineTransformation.Create;
    AT.SrcRect := FloatRect(0, 0, bm.Width - 1, bm.Height - 1);
    f1 := Min(w / bm.Width, h / bm.Height);

    if (abs(d1.ViewerZoom - 1) > 0.01) or (d1.OffsetY <> 0) or (d1.OffsetX <> 0) then
    begin
      f1 := d1.ViewerZoom * f1;

      AVerOff := Trunc(d1.OffsetY * f1);

      AHizOff := Trunc(d1.OffsetX * f1);

    end
    else
    begin
      AVerOff := Trunc((h - bm.Height * f1) / 2);
      AHizOff := Trunc((w - bm.Width * f1) / 2);
    end;

    AT.Scale(f1, f1);

    if (AVerOff <> 0) or (AHizOff <> 0) then
      AT.Translate(AHizOff, AVerOff);

    Transform(aitem.Bitmap, bm, AT);
    AT.Free;

    //BM.DrawTo(aitem.Bitmap, Rect(Trunc(ox), Trunc(oy), Trunc(ox + cx), Trunc(oy + cy)));
  finally
    BM.Free;
  end;
end;

procedure TCnsCustomMultiImage32.DoInitStages;
begin
  if Assigned(FOnInitStages) then
    FOnInitStages(Self);
end;

procedure TCnsCustomMultiImage32.DoPaintBuffer;
var
  I: Integer;
  DT, RT: Boolean;
begin
  UpdateCache;
  DT := csDesigning in ComponentState;
  RT := not DT;

  for I := 0 to FPaintStages.Count - 1 do
    with FPaintStages[I]^ do
      if (DsgnTime and DT) or (RunTime and RT) then
        case Stage of
          PST_CUSTOM: ExecCustom(Buffer, I);
          PST_CLEAR_BUFFER: ExecClearBuffer(Buffer, I);
          PST_CLEAR_BACKGND: ExecClearBackgnd(Buffer, I);
          PST_DRAW_BITMAP: ExecDrawBitmap(Buffer, I);
          PST_DRAW_LAYERS: ExecDrawLayers(Buffer, I);
          PST_CONTROL_FRAME: ExecControlFrame(Buffer, I);
          PST_BITMAP_FRAME: ExecBitmapFrame(Buffer, I);
        end;
  inherited;
end;

procedure TCnsCustomMultiImage32.DoPaintGDIOverlay;
begin
  inherited;
end;

procedure TCnsCustomMultiImage32.InitDefaultStages;
begin
  // background
  with PaintStages.Add^ do
  begin
    DsgnTime := True;
    RunTime := True;
    Stage := PST_CLEAR_BACKGND;
  end;

  // control frame
  with PaintStages.Add^ do
  begin
    DsgnTime := True;
    RunTime := False;
    Stage := PST_CONTROL_FRAME;
  end;

  // bitmap
  with PaintStages.Add^ do
  begin
    DsgnTime := True;
    RunTime := True;
    Stage := PST_DRAW_BITMAP;
  end;

  // bitmap frame
  with PaintStages.Add^ do
  begin
    DsgnTime := True;
    RunTime := False;
    Stage := PST_BITMAP_FRAME;
  end;

  // layers
  with PaintStages.Add^ do
  begin
    DsgnTime := True;
    RunTime := True;
    Stage := PST_DRAW_LAYERS;
    Parameter := $80000000;
  end;

end;

constructor TCnsCustomMultiImage32.Create(AOwner: TComponent);
begin
  inherited;
  FBufferMode := false;
  WheelDeltaCount := 0;
  FRow := 1;
  FColumn := 1;
  FCurrentIndex := 0;
  FCurrentSelectedIndex := 0;
  FMoveOverIndex := 0;

  FCanStartDrag := false;

  FAutoPage := true;
  FPageRange := 0;

  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csDoubleClicks, csReplicatable, csOpaque];
  FPaintStages := TCnsPaintStages.Create;
  InitDefaultStages;
  FBitmap32Collection := TCnsBitmap32Collection.Create(Self, TCnsBitmap32ExItem);

  DisableScrollUpdate := false;
  VScroll := TCnsCustomRangeBar.Create(Self);
  with VScroll do
  begin
    Parent := Self;
    BorderStyle := bsNone;
    //    Centered := True;
    Kind := sbVertical;
    OnUserChange := ScrollHandler;
    Enabled := true;
    Increment := 1;
    Window := 1;
    Range := 100;
  end;
  AlignAll;
end;

destructor TCnsCustomMultiImage32.Destroy;
begin
  BeginUpdate;
  FPaintStages.Free;
  FBitmap32Collection.Free;
  inherited;
end;

procedure TCnsCustomMultiImage32.BeginUpdate;
begin
  // disable OnChange & OnChanging generation
  Inc(FUpdateCount);
end;

procedure TCnsCustomMultiImage32.Changed;
begin
  if FUpdateCount = 0 then
  begin
    Invalidate;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TCnsCustomMultiImage32.ScrollHandler(Sender: TObject);
begin
  if DisableScrollUpdate then
    Exit;
  if Sender = VScroll then
    VScroll.Repaint;
  if (FAutoPage) or (FPageRange = 0) then
    FCurrentIndex := trunc(VScroll.Position * FRow * FColumn)
  else
    FCurrentIndex := trunc(VScroll.Position * FPageRange);
  if ((CurrentImage + FCurrentSelectedIndex) > GetImageCount) then
    FCurrentSelectedIndex := 0;
  if assigned(OnMultiImageScrollTo) then
  begin
    OnMultiImageScrollTo(self, CurrentImage + FCurrentSelectedIndex);
  end;
  DoScroll;
  Repaint;
end;

procedure TCnsCustomMultiImage32.UpdateScrollBars;
var
  i: integer;
begin
  i := GetImageCount;
  if (FAutoPage) or (FPageRange = 0) then
    VScroll.Range := (i + FRow * FColumn - 1) div (FRow * FColumn)
  else
    VScroll.Range := (i + FPageRange - 1) div (FPageRange);
  if VScroll.Range <> 0 then
    VScroll.Position := CurrentImage div VScroll.Range;
  VScroll.Repaint;
end;

procedure TCnsCustomMultiImage32.Last;
begin
  VScroll.Position := VScroll.Range - 1;
  ScrollHandler(VScroll);
end;

function TCnsCustomMultiImage32.GetImageCount: Integer;
begin
  Result := FBitmap32Collection.Count;
end;

procedure TCnsCustomMultiImage32.AlignAll;
begin
  with GetViewportRect do
  begin
    VScroll.BoundsRect := Rect(Right, Top, Width, Bottom);
    VScroll.Repaint;
  end;
end;

procedure TCnsCustomMultiImage32.EndUpdate;
begin
  // re-enable OnChange & OnChanging generation
  Dec(FUpdateCount);
  Assert(FUpdateCount >= 0, 'Unpaired EndUpdate call');
end;

procedure TCnsCustomMultiImage32.ExecBitmapFrame(Dest: TCnsBitmap32; StageNum: Integer);
// PST_BITMAP_FRAME
begin
  DrawFocusRect(Dest.Handle, CachedBitmapRect);

end;

procedure TCnsCustomMultiImage32.ExecClearBuffer(Dest: TCnsBitmap32; StageNum: Integer);
// PST_CLEAR_BUFFER
begin
  Dest.Clear(Color32(Color));
end;

procedure TCnsCustomMultiImage32.ExecClearBackgnd(Dest: TCnsBitmap32; StageNum: Integer);
// PST_CLEAR_BACKGND
var
  C: TColor32;
begin
  C := Color32(Color);
  //  if FBitmap32Collection.Count = 0 then
  Dest.Clear(C)
    {  else
with CachedBitmapRect do
begin
if (Left > 0) or (Right < Width) or (Top > 0) or (Bottom < Height) then
begin
// clean only the part of the buffer lying around image edges
Dest.FillRectS(0, 0, Width, Top, C); // top
Dest.FillRectS(0, Bottom, Width, Height, C); // bottom
Dest.FillRectS(0, Top, Left, Bottom, C); // left
Dest.FillRectS(Right, Top, Width, Bottom, C); // right
end;
end;}
end;

procedure TCnsCustomMultiImage32.ExecControlFrame(Dest: TCnsBitmap32; StageNum: Integer);
// PST_CONTROL_FRAME
begin
  DrawFocusRect(Dest.Handle, Rect(0, 0, Width, Height));
end;

procedure TCnsCustomMultiImage32.ExecCustom(Dest: TCnsBitmap32; StageNum: Integer); // PST_CUSTOM
begin
  if Assigned(FOnPaintStage) then
    FOnPaintStage(Self, Dest, StageNum);
end;

procedure TCnsCustomMultiImage32.ExecDrawBitmap(Dest: TCnsBitmap32; StageNum: Integer);
// PST_DRAW_BITMAP
var
  i, n: Integer;
  r: TRect;
begin
  if FBufferMode and (Bitmaps.Count > 0) then
  begin
    n := GetImageCount;
    for i := 0 to min(n, FColumn * FRow) - 1 do
    begin
      r := SpritRect(i);
      if (FCurrentIndex + i) < n then
      begin
        TCnsBitmap32ExItem(Bitmaps.Items[FCurrentIndex + i]).DrawTo(Dest, r);
        if i = CurrentSelectedIndex then
        begin
          Dest.LineS(r.Left + 1, r.Top + 1, r.Right + 1, r.Top + 1, clRed32);
          Dest.LineS(r.Left + 1, r.Top + 1, r.Left + 1, r.Bottom + 1, clRed32);
          Dest.LineS(r.Right - 1, r.Bottom - 1, r.Right - 1, r.Top - 1, clRed32);
          Dest.LineS(r.Right - 1, r.Bottom - 1, r.Left - 1, r.Bottom - 1, clRed32);
        end
        else
        begin
          if i = FMoveOverIndex then
          begin
            Dest.LineS(r.Left + 1, r.Top + 1, r.Right + 1, r.Top + 1, clYellow32);
            Dest.LineS(r.Left + 1, r.Top + 1, r.Left + 1, r.Bottom + 1, clYellow32);
            Dest.LineS(r.Right - 1, r.Bottom - 1, r.Right - 1, r.Top - 1, clYellow32);
            Dest.LineS(r.Right - 1, r.Bottom - 1, r.Left - 1, r.Bottom - 1, clYellow32);
          end
        end
      end
      else
        break;
    end;
  end;
end;

procedure TCnsCustomMultiImage32.ExecDrawLayers(Dest: TCnsBitmap32; StageNum: Integer);
// PST_DRAW_LAYERS
var
  //  I: Integer;
  Mask: Cardinal;
begin
  Mask := PaintStages[StageNum]^.Parameter;
end;

procedure TCnsCustomMultiImage32.Invalidate;
begin
  BufferValid := False;
  CacheValid := False;
  inherited;
end;

procedure TCnsCustomMultiImage32.Resize;
begin
  AlignAll;
  UpdateScrollBars;
  Invalidate;
  inherited;
end;

procedure TCnsCustomMultiImage32.Loaded;
begin
  AlignAll;
  UpdateScrollBars;
  Invalidate;
  inherited;
end;

procedure TCnsCustomMultiImage32.PaintTo(Dest: TCnsBitmap32; DestRect: TRect);
begin

end;

procedure TCnsCustomMultiImage32.SetRowColumns(x, y: integer);
begin
  FColumn := y;
  FRow := x;
  //  i := GetImageCount;
  FCurrentIndex := 0;
  VScroll.Position := 0;
  UpdateScrollBars;
  Changed;
end;

procedure TCnsCustomMultiImage32.ChangedHandler(Sender: TObject);
begin
  Changed;
end;

procedure TCnsCustomMultiImage32.GDIUpdateHandler(Sender: TObject);
begin
  Paint;
end;

procedure TCnsCustomMultiImage32.InvalidateCache;
begin
  CacheValid := False;
end;

function TCnsCustomMultiImage32.GetScrollBarSize: Integer;
begin
  Result := FScrollBarSize;
  if Result = 0 then
    Result := GetSystemMetrics(SM_CYHSCROLL);
end;

function TCnsCustomMultiImage32.GetViewportRect: TRect;
var
  Sz: Integer;
begin
  Result := Rect(0, 0, Width, Height);
  Sz := GetScrollBarSize;
  Dec(Result.Right, Sz);
end;

procedure TCnsCustomMultiImage32.UpdateCache;
begin
  if CacheValid then
    Exit;
  CachedBitmapRect := Rect(0, 0, self.Width, self.Height);
  with CachedBitmapRect, CachedXForm do
  begin
    if GetImageCount = 0 then
      CachedXForm := UnitXForm
    else
    begin
      Assert((Right > Left) and (Bottom > Top));
      ShiftX := Left;
      ShiftY := Top;
      ScaleX := MulDiv(Right - Left, $10000, self.Width);
      ScaleY := MulDiv(Bottom - Top, $10000, self.Height);
      RevScaleX := MulDiv(self.Width, $10000, Right - Left);
      RevScaleY := MulDiv(self.Height, $10000, Bottom - Top);
    end;
  end;
  CacheValid := True;
end;

function TCnsCustomMultiImage32.GetBitmap(Index: Integer): TCnsBitmap32;
begin
  Result := FBitmap32Collection.Items[Index].Bitmap;
end;

procedure TCnsCustomMultiImage32.SetBitmap(Index: Integer; Value: TCnsBitmap32);
begin
  FBitmap32Collection.Items[Index].Bitmap := Value;
  Changed;
end;

procedure TCnsCustomMultiImage32.SeTCnsBitmap32Collection(Value: TCnsBitmap32Collection);
begin
  FBitmap32Collection := Value;
end;

procedure TCnsCustomMultiImage32.SetColumn(Value: Integer);
begin
  FColumn := Value;
  FCurrentIndex := 0;
  VScroll.Position := 0;
  UpdateScrollBars;
  Changed;
end;

procedure TCnsCustomMultiImage32.SetRow(Value: Integer);
begin
  FRow := Value;
  FCurrentIndex := 0;
  VScroll.Position := 0;
  UpdateScrollBars;
  Changed;
end;

function TCnsCustomMultiImage32.SpritRect(l: Integer): TRect;
var
  w, h: Integer;
  R: TRect;
begin
  R := GetViewportRect;
  w := R.Right - R.Left;
  h := R.Bottom - R.Top;
  Result.Left := R.Left + (l mod FRow) * (w div FRow);
  Result.Right := R.Left + ((l mod FRow) + 1) * (w div FRow);
  Result.Top := R.Top + (l div FRow) * (h div FColumn);
  Result.Bottom := R.Top + ((l div FRow) + 1) * (h div FColumn);
end;

procedure TCnsCustomMultiImage32.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y:
  Integer);
var
  w, h: integer;
  R: TRect;
begin
  inherited;
  SetFocus;
  OldPoint := Point(X, Y);

  // lock the capture only if mbLeft was pushed or any mouse listener was activated
  if (Button = mbLeft) then
    MouseCapture := True;

  R := GetViewportRect;
  w := (R.Right - r.Left) div FRow;
  h := (R.Bottom - r.Top) div FColumn;
  FCurrentSelectedIndex := (y div h) * FRow + (x div w);

  if (FCurrentSelectedIndex >= 0) and ((CurrentImage + FCurrentSelectedIndex) >= 0) and ((CurrentImage + FCurrentSelectedIndex) < GetImageCount) then
  begin
    if assigned(OnMultiImageScrollTo) then
    begin
      OnMultiImageScrollTo(self, CurrentImage + FCurrentSelectedIndex);
    end;
    invalidate;
  end;
end;

procedure TCnsCustomMultiImage32.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
  w, h, m: Integer;
begin
  inherited;

  if MouseCapture and FCanStartDrag then
  begin
    if (abs(OldPoint.Y - Y) > 20) or (abs(OldPoint.X - X) > 20) then
    begin
      BeginDrag(true);
    end;
  end
  else
  begin
    R := GetViewportRect;
    w := (R.Right - r.Left) div FRow;
    h := (R.Bottom - r.Top) div FColumn;
    m := (y div h) * FRow + (x div w);
    if FMoveOverIndex <> m then
    begin
      FMoveOverIndex := m;
      invalidate;
    end;
  end
end;

procedure TCnsCustomMultiImage32.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  // unlock the capture only if mbLeft was raised and there is no active mouse listeners
  if (Button = mbLeft) then
    MouseCapture := False;
end;

function TCnsCustomMultiImage32.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos:
  TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);

  inc(WheelDeltaCount);
  if WheelDeltaCount > 4 then
  begin
    if WheelDelta < 0 then
      CurrentImage := CurrentImage + 1
        //VScroll.Position := VScroll.Position + 1
    else
      CurrentImage := CurrentImage - 1;
    //VScroll.Position := VScroll.Position - 1;
    {$IFDEF DICOMDEBUG}
    SendDebug('WheelDelta:' + IntToStr(WheelDelta));
    {$ENDIF}
    //ScrollHandler(VScroll);
    WheelDeltaCount := 0;
  end;
end;

procedure TCnsCustomMultiImage32.SetCurrentIndex(Value: integer);
begin
  if (Value <> FCurrentIndex) and (Value >= 0) and (Value <= GetImageCount - 1) then
  begin
    FCurrentIndex := Value;
  end
  else
    FCurrentIndex := 0;
  if assigned(OnMultiImageScrollTo) and ((CurrentImage + FCurrentSelectedIndex) < GetImageCount)
    then
  begin
    OnMultiImageScrollTo(self, CurrentImage + FCurrentSelectedIndex);
  end;
  invalidate;
end;

procedure TCnsCustomMultiImage32.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = 190 then //188 <
  begin

  end
  else
    if Key = 188 then //190 >
  begin

  end;
  inherited;
end;

procedure TCnsCustomMultiImage32.CMMouseEnter(var Msg: TMessage);
begin
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TCnsCustomMultiImage32.CMMouseLeave(var Msg: TMessage);
begin
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  inherited;
end;

procedure TCnsCustomMultiImage32.DoScroll;
begin
  if Assigned(FOnScroll) then
    FOnScroll(Self);
end;

procedure TCnsCustomMultiImage32.SetAutoPage(Value: Boolean);
begin
  if FAutoPage <> Value then
  begin
    FAutoPage := Value;
    UpdateScrollBars;
  end;
end;

procedure TCnsCustomMultiImage32.SetPageRange(Value: Integer);
begin
  if Fpagerange <> Value then
  begin
    Fpagerange := Value;
    UpdateScrollBars;
  end;
end;

procedure TDicomMultiViewer.Resize;
begin
  inherited;
  if not fInUpdating then
  begin
    SetActiveViewFullScreen(false);
    Update;
  end;
end;

procedure TDicomMultiLayoutViewer.SetColumns(const Value: Integer);
begin
  if Value > 0 then
  begin
    //    SetActiveViewFullScreen(false);
    fColumns := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetRows(const Value: Integer);
begin
  if Value > 0 then
  begin
    //    SetActiveViewFullScreen(false);
    fRows := Value;
  end;
end;

procedure TMPRDicomImage.SetHozLine(const Value: Double);
begin
  fHozLine := Value;
end;

procedure TMPRDicomImage.SetVerLine(const Value: Double);
begin
  fVerLine := Value;
end;

procedure TDicomMultiViewer.TriggerOnViewFlagChange(Sender: TObject);
begin
  if assigned(FOnViewFlagChange) then
    FOnViewFlagChange(Sender);
end;

procedure TDicomMultiViewer.BackupCurrentDataset;
begin
  FBackupDicomDatasets := fDicomDatasets;
  FBackupCurrentImage := fCurrentImage;
  fBackupSeriesUID := fSeriesUID;
end;

procedure TDicomMultiViewer.RestoreDataset;
begin
  SeriesUID := '';
  DicomDatasets := FBackupDicomDatasets;
  CurrentImage := FBackupCurrentImage;
  SeriesUID := fBackupSeriesUID;
  Update;
end;

procedure TDicomMultiLayoutViewer.BackupCurrentDataset;
var
  i: Integer;
begin
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].BackupCurrentDataset;
end;

procedure TDicomMultiLayoutViewer.RestoreDataset;
var
  i: Integer;
begin
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].RestoreDataset;
end;

function TDicomMultiViewer.GetViewIndex(AView: TCustomDicomImage): Integer;
begin
  Result := FViews.IndexOf(AView);
end;

procedure TDicomMultiViewer.SetDatasets(ADicomDatasets: TDicomDatasets;
  AIndex: Integer; ASeriesUID: string);
begin
  if FDicomDatasets <> ADicomDatasets then
  begin
    FDicomDatasets := ADicomDatasets;
    fCurrentImage := AIndex;
    fSeriesUID := ASeriesUID;
    Update;
  end;
end;

function TDCMMultiImage.GetImageCount: Integer;
begin
  if FDicomDatasets <> nil then
  begin
    if FViewGridMode = vgmSeriesGrid then
      Result := FDicomDatasets.GetSeriesCount
    else
      Result := FDicomDatasets.Count
  end
  else
    Result := 0;
end;

procedure TCnsCustomMultiImage32.SetBufferMode(const Value: Boolean);
begin
  FBufferMode := Value;
end;

procedure TDCMMultiImage.SetBufferMode(const Value: Boolean);
begin
  inherited;
  if FBufferMode then
    UpdateDatasetToIcons;
end;

(*procedure TDicomMultiLayoutViewer.SetActiveViewFullScreen(AValue: Boolean);
var
  i: integer;
  Size: TSize;
  p1: TDicomMultiLayoutViewer;
begin
  p1 := GetRootPanel;
  //if p1.Rows * p1.Columns = 1 then
  //  exit;
  if not assigned(p1.FFullScreenView) then
  begin
    p1.FFullScreenView := p1.ActiveView;

    for i := 0 to p1.GetViewerCount - 1 do
    begin
      if p1.Viewers[i] <> p1.FFullScreenView then
        p1.Viewers[i].Visible := false;
    end;
    p1.backupRect := Rect(p1.FFullScreenView.Left, p1.FFullScreenView.Top,
      p1.FFullScreenView.Width,
      p1.FFullScreenView.Height);
    p1.FFullScreenView.SetBounds(0, 0, Width, Height);

  end
  else
  begin
    begin
      for i := 0 to p1.GetViewerCount - 1 do
      begin
        if p1.Viewers[i] <> p1.FFullScreenView then
          p1.Viewers[i].Visible := true;
      end;
      p1.FFullScreenView.Align := alNone;
      //Update;
      p1.FFullScreenView.SetBounds(p1.backupRect.Left, p1.backupRect.Top,
        p1.backupRect.Right, p1.backupRect.Bottom);
    end;
    p1.FFullScreenView := nil;
  end;
end; *)

procedure TDicomMultiLayoutViewer.SetCanMultiSelect(const Value: Boolean);
var
  i: Integer;
begin
  fCanMultiSelect := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].fCanMultiSelect := Value;
end;

procedure TDicomMultiViewer.SetCanMultiSelect(const Value: Boolean);
var
  i: Integer;
begin
  fCanMultiSelect := Value;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).fCanMultiSelect := Value;
end;

procedure TDicomMultiViewer.SetWhiteGrid(const Value: Boolean);
var
  i: Integer;
begin
  fWhiteGrid := Value;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).WhiteGrid := Value;
end;

procedure TDicomMultiLayoutViewer.SetWhiteGrid(const Value: Boolean);
var
  i: Integer;
begin
  fWhiteGrid := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].fWhiteGrid := Value;
end;

function TCustomDicomImage.XBmp2Scr(x: Double): integer;
begin
  result := trunc(OffsetHorz + (x * Scale));
end;

function TCustomDicomImage.YBmp2Scr(y: Double): integer;
begin
  result := trunc(OffsetVert + (y * Scale));
end;

procedure TDicomMultiViewer.SetOnTopoLineClick(
  const Value: TDicomImageTopoLineClickEvent);
begin
  FOnTopoLineClick := Value;
end;

procedure TDicomMultiLayoutViewer.DoTopoLineClick(Sender: TObject;
  AImageIndex: Integer);
//var
//  k, i: integer;
//  v1: TDicomMultiViewer;
begin
  if assigned(FOnTopoLineClick) then
    FOnTopoLineClick(Sender, AImageIndex)
      {  else
begin
k := -1;
for i := 0 to GetRootPanel.GetViewerCount - 1 do
begin
if GetRootPanel.Viewers[i] = Sender then
begin
k := i;
break;
end;
end;
if GetRootPanel.GetViewerCount >= 2 then
begin
if (k + 1) >= GetRootPanel.GetViewerCount then
k := GetRootPanel.GetViewerCount - 2
else
k := k + 1;
end
else
k := 0;
v1 := GetRootPanel.Viewers[k];
if v1.UpdateAllImageProperty then
begin
v1.ActiveView.LockImage := false;
v1.ActiveView.DicomDatasets := TDicomMultiViewer(Sender).DicomDatasets;
v1.ActiveView.LockImage := true;
v1.ActiveView.AttributesIndex := AImageIndex;
end
else
begin
v1.DicomDatasets := TDicomMultiViewer(Sender).DicomDatasets;
v1.SeriesUID :=
TDicomMultiViewer(Sender).DicomDatasets.Item[AImageIndex].Attributes.GetString($20, $E);
v1.CurrentImage := AImageIndex;
v1.UpdateScrollBars;
end;
end; }
end;

procedure TDicomMultiLayoutViewer.SetOnTopoLineClick(
  const Value: TDicomImageTopoLineClickEvent);
begin
  FOnTopoLineClick := Value;
end;

procedure TCustomDicomImage.SetOn3DCursorMove(
  const Value: TOn3DCursorEvent);
begin
  FOn3DCursorMove := Value;
end;

procedure TCustomDicomImage.SetPositionCursorPosition(const Value: TPoint);
begin
  FPositionCursorPosition := Value;
end;

procedure TCustomDicomImage.SetOn3DCursorEnd(const Value: TNotifyEvent);
begin
  FOn3DCursorEnd := Value;
end;

procedure TCustomDicomImage.SetPositionCursorColor(const Value: TColor32);
begin
  FPositionCursorColor := Value;
end;

procedure TCustomDicomImage.SetLeaderCount(const Value: Integer);
begin
  FLeaderCount := Value;
end;

procedure TCustomDicomImage.SetLeaderFrom(const Value: Integer);
begin
  FLeaderFrom := Value;
end;

procedure TCustomDicomImage.SetLeaderPerPage(const Value: Integer);
begin
  FLeaderPerPage := Value;
end;

procedure TCustomDicomImage.SetLeaderScale(const Value: Integer);
begin
  FLeaderScale := Value;
end;

procedure TCustomDicomImage.SetLeaderZoomFactor(const Value: Integer);
begin
  FLeaderZoomFactor := Value;
end;

procedure TCustomDicomImage.SetMMFactor(const Value: Integer);
begin
  FMMFactor := Value;
end;

procedure TDCMMultiImage.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TDicomMultiViewer.Do3DCursor(Sender: TObject; X, Y: Single);
begin
  if assigned(FOn3DCursorMove) then
    FOn3DCursorMove(sender, X, Y);
end;

procedure TDicomMultiViewer.DoStart3DCursor(Sender: TObject; X, Y: Single);
begin
  if assigned(FOn3DCursorStart) then
    FOn3DCursorStart(sender, X, Y);
end;

procedure TDicomMultiLayoutViewer.DoStart3DCursor(Sender: TObject; X,
  Y: Single);
begin
  if assigned(FOn3DCursorStart) then
    FOn3DCursorStart(sender, X, Y);
end;

procedure TDicomMultiLayoutViewer.Do3DCursor(Sender: TObject; X,
  Y: Single);
begin
  if assigned(FOn3DCursorMove) then
    FOn3DCursorMove(sender, X, Y);
end;

procedure TDicomMultiViewer.SetOn3DCursorMove(
  const Value: TOn3DCursorEvent);
var
  i: Integer;
begin
  FOn3DCursorMove := Value;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).On3DCursorMove := Value;
end;

procedure TDicomMultiLayoutViewer.SetOn3DCursorMove(
  const Value: TOn3DCursorEvent);
var
  i: Integer;
begin
  FOn3DCursorMove := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].On3DCursorMove := Value;
end;

procedure TDicomMultiViewer.SetOn3DCursorEnd(const Value: TNotifyEvent);
var
  i: Integer;
begin
  FOn3DCursorEnd := Value;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).On3DCursorEnd := Value;
end;

procedure TDicomMultiLayoutViewer.SetOn3DCursorEnd(
  const Value: TNotifyEvent);
var
  i: Integer;
begin
  FOn3DCursorEnd := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].On3DCursorEnd := Value;
end;

procedure TDicomMultiViewer.DoEnd3DCursor(Sender: TObject);
begin
  if assigned(FOn3DCursorEnd) then
    FOn3DCursorEnd(sender);
end;

procedure TDicomMultiLayoutViewer.DoEnd3DCursor(Sender: TObject);
begin
  if assigned(FOn3DCursorEnd) then
    FOn3DCursorEnd(sender);
end;

procedure TDicomMultiViewer.SetOnCreateDicomViewItem(
  const Value: TOnCreateDicomViewItemEvent);
begin
  FOnCreateDicomViewItem := Value;
end;

procedure TDicomMultiLayoutViewer.SetOnCreateDicomViewItem(
  const Value: TOnCreateDicomViewItemEvent);
var
  i: Integer;
begin
  FOnCreateDicomViewItem := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].FOnCreateDicomViewItem := Value;
end;

procedure TDicomMultiLayoutViewer.TriggerOnCreateDicomViewItem(
  Sender: TObject; const ARow, AColumn: Integer; var AItem: TCustomDicomImage);
begin
  if assigned(FOnCreateDicomViewItem) then
    FOnCreateDicomViewItem(Sender, ARow, AColumn, AItem);
end;

procedure TCustomDicomImage.SetDragFrom(const Value: TDragFromSource);
begin
  FDragFrom := Value;
  {if FDragFrom = dfsFromSameSeries then
  begin
    self.DragMode := dmAutomatic;
  end
  else
    self.DragMode := dmManual;  }
end;

procedure TDicomMultiViewer.SetDragFrom(const Value: TDragFromSource);
var
  i: Integer;
begin
  FDragFrom := Value;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).FDragFrom := Value;
end;

procedure TDicomMultiLayoutViewer.SetDragFrom(
  const Value: TDragFromSource);
var
  i: Integer;
begin
  FDragFrom := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].DragFrom := Value;
end;

procedure TCustomDicomImage.SetCustomFormat(const Value: string);
begin
  FCustomFormat := Value;
end;

procedure TCustomDicomImage.SetOnCustomDrawObjectPopupMenuPopup(
  const Value: TNotifyEvent);
begin
  FOnCustomDrawObjectPopupMenuPopup := Value;
end;

procedure TDicomMultiViewer.TriggerOnDragOverEvent(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if assigned(OnViewDragOver) then
    OnViewDragOver(Sender, Source, X, Y, State, Accept);
end;

procedure TDicomMultiViewer.TriggerOnDragDropEvent(Sender, Source: TObject; X, Y: Integer);
begin
  if assigned(OnViewDragDrop) then
    OnViewDragDrop(Sender, Source, X, Y);
end;

procedure TDicomMultiLayoutViewer.TriggerOnDragOverEvent(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if assigned(OnViewDragOver) then
    OnViewDragOver(Sender, Source, X, Y, State, Accept);
end;

procedure TDicomMultiLayoutViewer.TriggerOnDragDropEvent(Sender, Source: TObject; X, Y: Integer);
begin
  if assigned(OnViewDragDrop) then
    OnViewDragDrop(Sender, Source, X, Y);
end;

procedure TDicomMultiViewer.TriggerOnCustomDrawObjectPopupMenuPopup(
  Sender: TObject);
begin
  if assigned(OnCustomDrawObjectPopupMenuPopup) then
    OnCustomDrawObjectPopupMenuPopup(sender);
end;

procedure TDicomMultiLayoutViewer.TriggerOnCustomDrawObjectPopupMenuPopup(
  Sender: TObject);
begin
  if assigned(OnCustomDrawObjectPopupMenuPopup) then
    OnCustomDrawObjectPopupMenuPopup(sender);
end;

procedure TDicomMultiViewer.SetOnCustomDrawObjectPopupMenuPopup(
  const Value: TNotifyEvent);
begin
  FOnCustomDrawObjectPopupMenuPopup := Value;
end;

procedure TDicomMultiLayoutViewer.SetOnCustomDrawObjectPopupMenuPopup(
  const Value: TNotifyEvent);
begin
  FOnCustomDrawObjectPopupMenuPopup := Value;
end;

procedure TCustomDicomImage.SetImageAngle(const Value: Double);
begin
  FImageAngle := Value;
  if (Attributes <> nil) and (Attributes.ImageData <> nil) then
    Attributes.ImageData.ImageAngle := Value;
  invalidate;
end;

procedure TMPRDicomImage.SetOnAfterBuildMPRChange(
  const Value: TNotifyEvent);
begin
  FOnAfterBuildMPRChange := Value;
end;

procedure TMPRDicomImage.SetOnBeforeBuildMPRChange(
  const Value: TNotifyEvent);
begin
  FOnBeforeBuildMPRChange := Value;
end;

procedure TDicomMultiViewer.SetImageAngle(const Value: Double);
var
  i: Integer;
begin
  FImageAngle := Value;
  if fDicomDatasets <> nil then
  begin
    for i := 0 to fDicomDatasets.Count - 1 do
    begin
      if (self.fSeriesUID = '') then
        fDicomDatasets[i].Attributes.ImageData.ImageAngle := Value
      else
        if (self.fSeriesUID = fDicomDatasets[i].Attributes.GetString($20, $E)) then
        fDicomDatasets[i].Attributes.ImageData.ImageAngle := Value
          //TCustomDicomImage(FViews[i]).ImageAngle := Value;
    end;
    //Update;
  end;
end;

procedure TDicomMultiLayoutViewer.SetImageAngle(const Value: Double);
var
  i: Integer;
begin
  FImageAngle := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].ImageAngle := Value;
end;

procedure TDicomMultiViewer.SetScrollBarVisible(const Value: boolean);
begin
  FScrollBarVisible := Value;
end;

procedure TMPRDicomImage.Resize;
//var
//  Size: TSize;
begin
  inherited;
  {  if assigned(Attributes) and assigned(Attributes.ImageData) then
      if (Attributes.ImageData.OffsetX = 0) and (Attributes.ImageData.OffsetY = 0) then
        //      if (Bitmap.Width > 0) and (Bitmap.Height > 0) then
      begin
        Scale := Min(Width / Bitmap.Width, Height / Bitmap.Height);
        Size := GetBitmapSize;
        OffsetVert := (Height - Size.Cy) div 2;
        OffsetHorz := (Width - Size.Cx) div 2;

        Attributes.ImageData.UpdateCood(
         trunc(OffsetHorz), trunc(OffsetVert),
          Scale, Attributes.ImageData.PixelSpacingX);

      end; }
end;

procedure TDCMMultiImage.SetAutoChangeSeriesMode(const Value: Boolean);
begin
  FAutoChangeSeriesMode := Value;
end;

procedure TCustomDicomImage.SetModify(const Value: Boolean);
begin
  FModify := Value;
end;

procedure TCustomDicomImage.SetLockImage(const Value: Boolean);
begin
  FLockImage := Value;
  if Assigned(Attributes) and assigned(Attributes.ImageData) then
  begin
    Attributes.MultiSelected4 := Value;
  end;
end;

procedure TCustomDicomImage.SetDisplayRuler(const Value: Boolean);
begin
  FDisplayRuler := Value;
  if assigned(Attributes) then
  begin
    Changed;
    //    Update;
  end;
end;

procedure TDicomMultiViewer.SetDisplayRuler(const Value: Boolean);
var
  i: Integer;
begin
  if FDisplayRuler <> Value then
  begin
    FDisplayRuler := Value;
    for i := 0 to FViews.Count - 1 do
    begin
      TCustomDicomImage(FViews[i]).DisplayRuler := Value;
    end;
  end;
end;

procedure TDicomMultiLayoutViewer.SetDisplayRuler(const Value: Boolean);
var
  i: Integer;
begin
  if FDisplayRuler <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].DisplayRuler := Value;
    FDisplayRuler := Value;
  end;
end;

procedure TDicomMultiViewer.SetMultiViewMode(const Value: TMultiViewMode);
begin
  FMultiViewMode := Value;
end;

procedure TDicomMultiViewer.SetCustomViewSetting(const Value: string);
begin
  FCustomViewSetting := Value;
end;

procedure TDicomMultiViewer.SetCustomDicomImageClass(
  const Value: TCustomDicomImageClass);
begin
  FCustomDicomImageClass := Value;
end;

procedure TDicomMultiLayoutViewer.SetCustomDicomImageClass(
  const Value: TCustomDicomImageClass);
var
  i: Integer;
begin
  //FCustomDicomImageClass := Value;
  if FCustomDicomImageClass <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].CustomDicomImageClass := Value;
    FCustomDicomImageClass := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetUpdateAllSeriesProperty(
  const Value: Boolean);
begin
  FUpdateAllSeriesProperty := Value;
end;

procedure TDicomMultiViewer.SetOnViewDragDropEvent(
  const Value: TDragDropEvent);
begin
  FOnViewDragDropEvent := Value;
end;

procedure TDicomMultiViewer.SetOnViewDragOverEvent(
  const Value: TDragOverEvent);
begin
  FOnViewDragOverEvent := Value;
end;

procedure TDicomMultiLayoutViewer.SetOnViewDragDropEvent(
  const Value: TDragDropEvent);
begin
  FOnViewDragDropEvent := Value;
end;

procedure TDicomMultiLayoutViewer.SetOnViewDragOverEvent(
  const Value: TDragOverEvent);
begin
  FOnViewDragOverEvent := Value;
end;

procedure TDicomMultiViewer.SetOnSetPresetWidthLevel(
  const Value: TDicomImagePresetWidthLevelEvent);
begin
  FOnSetPresetWidthLevel := Value;
end;

procedure TDicomMultiLayoutViewer.SetOnSetPresetWidthLevel(
  const Value: TDicomImagePresetWidthLevelEvent);
begin
  FOnSetPresetWidthLevel := Value;
end;

procedure TDicomMultiLayoutViewer.TriggerPresetWidthLevel(Sender: TObject;
  AKey: Integer; Shift: TShiftState; var AWindowWidth, AWindowLevel);
begin
  if assigned(FOnSetPresetWidthLevel) then
    FOnSetPresetWidthLevel(Sender, AKey, Shift, AWindowWidth, AWindowLevel);
end;

procedure TDicomMultiViewer.SetDragDropMode(const Value: TDragDropMode);
var
  i: Integer;
begin
  FDragDropMode := Value;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).DragDropMode := Value;
end;

procedure TCustomDicomImage.SetDragDropMode(const Value: TDragDropMode);
begin
  FDragDropMode := Value;
end;

procedure TDicomMultiLayoutViewer.SetDragDropMode(
  const Value: TDragDropMode);
var
  i: Integer;
begin
  FDragDropMode := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].DragDropMode := Value;
end;

procedure TCustomDicomImage.SetOnDragDropToPrint(
  const Value: TOnDragDropToPrintEvent);
begin
  FOnDragDropToPrint := Value;
end;

procedure TDicomMultiViewer.SetOnDragDropToPrint(
  const Value: TOnDragDropToPrintEvent);
begin
  FOnDragDropToPrint := Value;
end;

procedure TDicomMultiLayoutViewer.SetOnDragDropToPrint(
  const Value: TOnDragDropToPrintEvent);
begin
  FOnDragDropToPrint := Value;
end;

procedure TDicomMultiViewer.TriggerOnDragDropToPrint(Sender, Source: TObject;
  ADatasets: TDicomDatasets; AIndex: Integer);
begin
  if assigned(OnDragDropToPrint) then
    OnDragDropToPrint(Sender, Source, ADatasets, AIndex);
end;

procedure TDicomMultiLayoutViewer.TriggerOnDragDropToPrint(Sender, Source: TObject;
  ADatasets: TDicomDatasets; AIndex: Integer);
begin
  if assigned(OnDragDropToPrint) then
    OnDragDropToPrint(Sender, Source, ADatasets, AIndex);
end;

procedure TDicomMultiViewer.SetOnViewStartDrag(
  const Value: TStartDragEvent);
begin
  FOnViewStartDrag := Value;
end;

procedure TDicomMultiLayoutViewer.SetOnViewStartDrag(
  const Value: TStartDragEvent);
begin
  FOnViewStartDrag := Value;
end;

procedure TDicomMultiLayoutViewer.TriggerOnViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  if assigned(OnViewStartDrag) then
    OnViewStartDrag(Sender, DragObject);
end;

procedure TDicomMultiViewer.TriggerOnViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  if assigned(OnViewStartDrag) then
    OnViewStartDrag(Sender, DragObject);
end;

procedure TCustomDicomImage.SetOnCustomOverlayLabel(
  const Value: TOnOverlayLabelEvent);
begin
  FOnCustomOverlayLabel := Value;
end;

procedure TDicomMultiViewer.SetOnCustomOverlayLabel(
  const Value: TOnOverlayLabelEvent);
begin
  FOnCustomOverlayLabel := Value;
end;

procedure TDicomMultiLayoutViewer.SetOnCustomOverlayLabel(
  const Value: TOnOverlayLabelEvent);
begin
  FOnCustomOverlayLabel := Value;
end;

procedure TDicomMultiViewer.TriggerDicomViewCustomlabel(AView: TObject;
  Dest: TObject; var AUserWrite: Boolean);
begin
  if assigned(OnCustomOverlayLabel) then
    OnCustomOverlayLabel(AView, Dest, AUserWrite);
end;

procedure TDicomMultiViewer.TriggerDicomViewOverlaylabel(AView: TObject;
  Dest: TObject; var AUserWrite: Boolean);
begin
  if assigned(OnOverlayLabel) then
    OnOverlayLabel(AView, Dest, AUserWrite);
end;

procedure TDicomMultiLayoutViewer.TriggerDicomViewCustomlabel(
  AView: TObject; Dest: TObject; var AUserWrite: Boolean);
begin
  if assigned(OnCustomOverlayLabel) then
    OnCustomOverlayLabel(AView, Dest, AUserWrite);
end;

procedure TDicomMultiLayoutViewer.TriggerDicomViewOverlaylabel(
  AView: TObject; Dest: TObject; var AUserWrite: Boolean);
begin
  if assigned(OnOverlayLabel) then
    OnOverlayLabel(AView, Dest, AUserWrite);
end;

procedure TDicomMultiViewer.TriggerDicomViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  fLastShift := Shift;
end;

procedure TDicomMultiViewer.SetDisplayBottomRuler(const Value: Boolean);
var
  i: Integer;
begin
  if FDisplayBottomRuler <> Value then
  begin
    FDisplayBottomRuler := Value;
    for i := 0 to FViews.Count - 1 do
    begin
      TCustomDicomImage(FViews[i]).DisplayBottomRuler := Value;
    end;
  end;
end;

procedure TDicomMultiViewer.SetDisplayRightRuler(const Value: Boolean);
var
  i: Integer;
begin
  if FDisplayRightRuler <> Value then
  begin
    FDisplayRightRuler := Value;
    for i := 0 to FViews.Count - 1 do
    begin
      TCustomDicomImage(FViews[i]).DisplayRightRuler := Value;
    end;
  end;
end;

procedure TCustomDicomImage.SetDisplayBottomRuler(const Value: Boolean);
begin
  FDisplayBottomRuler := Value;
  if assigned(Attributes) then
  begin
    Changed;
    //    Update;
  end;
end;

procedure TCustomDicomImage.SetDisplayRightRuler(const Value: Boolean);
begin
  FDisplayRightRuler := Value;
  if assigned(Attributes) then
  begin
    Changed;
    //    Update;
  end;
end;

procedure TDicomMultiLayoutViewer.SetDisplayBottomRuler(
  const Value: Boolean);
var
  i: Integer;
begin
  if FDisplayBottomRuler <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].DisplayBottomRuler := Value;
    FDisplayBottomRuler := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetDisplayRightRuler(
  const Value: Boolean);
var
  i: Integer;
begin
  if FDisplayRightRuler <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].DisplayRightRuler := Value;
    FDisplayRightRuler := Value;
  end;
end;

procedure TCustomDicomImage.SetDisplayWLLabel(const Value: Boolean);
begin
  FDisplayWLLabel := Value;
  if assigned(Attributes) then
  begin
    Changed;
    //    Update;
  end;
end;

procedure TDicomMultiViewer.SetDisplayWLLabel(const Value: Boolean);
var
  i: Integer;
begin
  //FDisplayWLLabel := Value;
  if FDisplayWLLabel <> Value then
  begin
    FDisplayWLLabel := Value;
    for i := 0 to FViews.Count - 1 do
    begin
      TCustomDicomImage(FViews[i]).DisplayWLLabel := Value;
    end;
  end;
end;

procedure TDicomMultiLayoutViewer.SetDisplayWLLabel(const Value: Boolean);
var
  i: Integer;
begin
  //FDisplayWLLabel := Value;
  if FDisplayWLLabel <> Value then
  begin
    for i := 0 to GetViewerCount - 1 do
      Viewers[i].DisplayWLLabel := Value;
    FDisplayWLLabel := Value;
  end;
end;

procedure TCustomDicomImage.SetCanCheckSize(const Value: Boolean);
begin
  FCanCheckSize := Value;
end;

procedure TDicomMultiViewer.SetCanCheckSize(const Value: Boolean);
var
  i: Integer;
begin
  FCanCheckSize := Value;
  for i := 0 to FViews.Count - 1 do
  begin
    TCustomDicomImage(FViews[i]).CanCheckSize := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetCanCheckSize(const Value: Boolean);
var
  i: Integer;
begin
  FCanCheckSize := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].CanCheckSize := Value;
end;

procedure TDicomMultiLayoutViewer.SetScrollBarVisible(
  const Value: boolean);
var
  i: Integer;
begin
  FScrollBarVisible := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].ScrollBarVisible := Value;
end;

procedure TCustomDicomImage.SetShowPixelValueHint(const Value: Boolean);
begin
  FShowPixelValueHint := Value;
end;

procedure TDicomMultiViewer.SetShowPixelValueHint(const Value: Boolean);
var
  i: Integer;
begin
  FShowPixelValueHint := Value;
  for i := 0 to FViews.Count - 1 do
  begin
    TCustomDicomImage(FViews[i]).ShowPixelValueHint := Value;
  end;
end;

procedure TDicomMultiLayoutViewer.SetShowPixelValueHint(
  const Value: Boolean);
var
  i: Integer;
begin
  FShowPixelValueHint := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].ShowPixelValueHint := Value;
end;

procedure TDicomMultiLayoutViewer.SetSeriesResizable(const Value: Boolean);
begin
  FSeriesResizable := Value;
end;

procedure TDicomMultiLayoutViewer.TriggerOnViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TDicomMultiLayoutViewer.TriggerOnViewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if assigned(FMoveActiveSeriesView) then
  begin
    if (TCustomDicomImage(Sender).fParentViewer <> FMoveActiveSeriesView) then
    begin

      if FMoveActiveSeriesView.FMoveActiveView <> nil then
      begin
        FMoveActiveSeriesView.FMoveActiveView.MouseInControl := false;
        FMoveActiveSeriesView.FMoveActiveView.FDrawPrintNoSelectIcon := false;

        FMoveActiveSeriesView.FMoveActiveView.fWHint.Hide;

        FMoveActiveSeriesView.FMoveActiveView.Invalidate;

        FMoveActiveSeriesView.FMoveActiveView := nil;
      end;
      {$IFDEF DICOMDEBUG}
      //SendDebug('FMoveActiveView disable');
      {$ENDIF}

      FMoveActiveSeriesView := TCustomDicomImage(Sender).fParentViewer;
    end;
    //  else
  end
  else
    FMoveActiveSeriesView := TCustomDicomImage(Sender).fParentViewer;
end;

procedure TDicomMultiLayoutViewer.TriggerOnViewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TDicomMultiViewer.SetDblClickToFullSeries(const Value: Boolean);
begin
  FDblClickToFullSeries := Value;
end;

procedure TDicomMultiLayoutViewer.SetDblClickToFullSeries(
  const Value: Boolean);
var
  i: integer;
begin
  FDblClickToFullSeries := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].DblClickToFullSeries := Value;
end;

procedure TDCMMultiImage.SetDefaultRows(const Value: Integer);
begin
  if Value > 0 then
    FDefaultRows := Value;
end;

procedure TCustomDicomImage.SetOn3DCursorStart(const Value: TOn3DCursorEvent);
begin
  FOn3DCursorStart := Value;
end;

procedure TDicomMultiLayoutViewer.SetOn3DCursorStart(
  const Value: TOn3DCursorEvent);
var
  i: Integer;
begin
  FOn3DCursorStart := Value;
  for i := 0 to GetViewerCount - 1 do
    Viewers[i].On3DCursorStart := Value;
end;

procedure TDicomMultiViewer.SetOn3DCursorStart(
  const Value: TOn3DCursorEvent);
var
  i: Integer;
begin
  FOn3DCursorStart := Value;
  for i := 0 to FViews.Count - 1 do
    TCustomDicomImage(FViews[i]).On3DCursorStart := Value;
end;

procedure TCustomDicomImage.BuildCineToolbar;
var
  BitBtn1: TSpeedButton;
begin
  // 08.11.2012 FOMIN
  if not (Parent as TDicomMultiViewer).not_show_video then
  begin
    if CineToolbar = nil then
    begin

      CineToolbar := TPanel.Create(self);
      CineToolbar.Parent := self;
      CineToolbar.Height := 16;
      CineToolbar.Align := alBottom;

      BitBtn1 := TSpeedButton.Create(CineToolbar);
      with BitBtn1 do
      begin
        Parent := CineToolbar;
        Left := 0;
        Top := 0;
        Width := 38;
        Height := 16;
        Caption := 'Play';
        TabOrder := 0;
        OnClick := btnPlayClick;
      end;

      BitBtn1 := TSpeedButton.Create(CineToolbar);
      with BitBtn1 do
      begin
        Parent := CineToolbar;
        Left := 40;
        Top := 0;
        Width := 38;
        Height := 16;
        Caption := '>>';
        TabOrder := 0;
        OnClick := btnDirectionClick;
      end;
    {BitBtn1 := TSpeedButton.Create(CineToolbar);
    with BitBtn1 do
    begin
      Parent := CineToolbar;
      Left := 160;
      Top := 0;
      Width := 75;
      Height := 16;
      Caption := 'DSA';
      TabOrder := 0;
      OnClick := btnDSAClick;
    end;  }

      fCineScrollBar := TScrollBar.Create(CineToolbar);
      with fCineScrollBar do
      begin
        Kind := sbHorizontal;
        PageSize := 1;
        //Visible := false;
        OnScroll := cineScrollBarScroll;
        Parent := CineToolbar;
      end;
      fCineScrollBar.Left := 80;
      fCineScrollBar.Top := 0;
      fCineScrollBar.Height := 16;
      fCineScrollBar.Width := CineToolbar.Width;
      CineToolbar.Visible:=True;
    end;
    if fCineScrollBar.Max <> Attributes.ImageData.FrameCount then
    begin
      fCineScrollBar.OnScroll := nil;

      fCineScrollBar.Position := 0;
      fCineScrollBar.Max := Attributes.ImageData.FrameCount;
      fCineScrollBar.Position := Attributes.ImageData.CurrentFrame;

      fCineScrollBar.OnScroll := cineScrollBarScroll;

      {$IFDEF DICOMDEBUG}
      SendDebug(Format('fCineScrollBar.Max=%d', [fCineScrollBar.Max]));
      {$ENDIF}

    end;
  end;
end;

procedure TCustomDicomImage.btnDirectionClick(Sender: TObject);
begin
  //TSpeedButton(Sender).Down := not  TSpeedButton(Sender).Down;
  if TSpeedButton(Sender).Caption = '>>' then
  begin
    TSpeedButton(Sender).Caption := '<<';
    CineDirection := false;
  end
  else
  begin
    TSpeedButton(Sender).Caption := '>>';
    CineDirection := true;
  end;
end;

procedure TCustomDicomImage.btnDSAClick(Sender: TObject);
begin
  //  TSpeedButton(Sender).Down := not TSpeedButton(Sender).Down;

  self.DSAMode := TSpeedButton(Sender).Down;
end;

procedure TCustomDicomImage.btnPlayClick(Sender: TObject);
begin
  if TSpeedButton(Sender).Caption = 'Play' then
  begin
    TSpeedButton(Sender).Caption := 'Stop';
    CineActive := true;
  end
  else
  begin
    TSpeedButton(Sender).Caption := 'Play';
    CineActive := false;
  end;
end;

procedure TCustomDicomImage.cineScrollBarScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  Attributes.ImageData.FrameIndex := ScrollPos;

  if assigned(FOnImageCineTo) then
    FOnImageCineTo(self, Attributes.ImageData.FrameIndex);

  fDrawCine.CurrentFrame := Attributes.ImageData.FrameIndex;
end;

procedure TCustomDicomImage.ClearCineToolbar;
begin
  if CineToolbar <> nil then
  begin
    CineToolbar.Free;
    CineToolbar := nil;
  end;
end;

procedure TMagnifierView.SetScallSize(const Value: Integer);
begin
  FScallSize := Value;
end;

procedure TMagnifierView.SetViewSize(const Value: integer);
begin
  FViewSize := Value;
end;

initialization

  {$IFDEF FOR_TRIAL_VERSION}
  if not ((FindWindow('TAppBuilder', nil) <> 0) or
    (FindWindow('TPropertyInspector', nil) <> 0) or
    (FindWindow('TAlignPalette', nil) <> 0)) then
  begin
    ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
  end;
  {$ENDIF}
  //  SeriesMode := true;
  //  UpdateAllImageProperty := true;
end.

