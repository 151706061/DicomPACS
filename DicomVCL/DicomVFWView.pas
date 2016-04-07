{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DicomVFWView;
{$I DicomPack.inc}
interface

uses
  Windows, Messages, Graphics, Controls, Forms, Classes, StdCtrls, SysUtils, math,
  {$IFDEF DICOMDEBUG}DbugIntf, {$ENDIF}
  dialogs, ExtCtrls, DCM_Attributes, DCM_ImageData_Bitmap;

const
  // DRAWDIB FLAGS
  DDF_UPDATE = $0002; // re-draw the last DIB
  DDF_SAME_HDC = $0004; // HDC same as last call (all setup)
  DDF_SAME_DRAW = $0008; // draw params are the same
  DDF_DONTDRAW = $0010; // dont draw frame, just decompress
  DDF_ANIMATE = $0020; // allow palette animation
  DDF_BUFFER = $0040; // always buffer image
  DDF_JUSTDRAWIT = $0080; // just draw it with GDI
  DDF_FULLSCREEN = $0100; // use DisplayDib
  DDF_BACKGROUNDPAL = $0200; // Realize palette in background
  DDF_NOTKEYFRAME = $0400; // this is a partial frame update, hint
  DDF_HURRYUP = $0800; // hurry up please!
  DDF_HALFTONE = $1000; // always halftone
  DDF_PREROLL = DDF_DONTDRAW; // Builing up a non-keyframe
  DDF_SAME_DIB = DDF_SAME_DRAW;
  DDF_SAME_SIZE = DDF_SAME_DRAW;

type
  // DRAWDIB TYPES
  hDrawDib = THandle;
  TDrawDibTime = record
    timeCount: LongInt; // see below
    timeDraw: LongInt; // time to draw bitmaps
    timeDecompress: LongInt; // time to decompress bitmaps
    timeDither: LongInt; // time to dither bitmaps
    timeStretch: LongInt; // time to stretch bitmaps
    timeBlt: LongInt; // time to transfer bitmaps (BitBlt)
    timeSetDIBits: LongInt; // time to transfer bitmaps (SetDIBits)
  end;

  PBitmapInfoHeader256 = ^TBitmapInfoHeader256;

  TPointArray = array[0..Maxint div 16] of TPoint;
  PPointArray = ^TPointArray;
  TArrayOfPByte = array[0..Maxint div 16] of pbyte;
  PArrayOfPByte = ^TArrayOfPByte;

  // TBitmapInfoHeader + palette 256 colori
  TBitmapInfoHeader256 = packed record
    biSize: DWORD;
    biWidth: Longint;
    biHeight: Longint;
    biPlanes: Word;
    biBitCount: Word;
    biCompression: DWORD;
    biSizeImage: DWORD;
    biXPelsPerMeter: Longint;
    biYPelsPerMeter: Longint;
    biClrUsed: DWORD;
    biClrImportant: DWORD;
    Palette: array[0..1] of TRGBQUAD;
  end;

  TCoodZoomDx = class
  public
    fOffX, fOffY: Integer; //VIEW的开始
    frx, fry: integer; //VIEW的大小

    fo1x, fo1y: integer; //BMP的开始
    fo2x, fo2y: Integer; //BMP的大小

    fZoom: Double;
    fDZoom: Double;
    RescaleSlopeX: Double;
    RescaleSlopeY: Double;

    //fHozFlip: Boolean;
    //fVerFlip: Boolean;
    //fRotate: Integer;
    //fBitmapWidth: Integer;
    //fBitmapHeight: Integer;
    //  public
    constructor Create;
    //function YScr2Bmp(x, y: integer): Double;
    //function XScr2Bmp(x, y: integer): Double;
    //function YBmp2Scr(y: Double): integer;
    //function XBmp2Scr(x: Double): integer;
  end;

  TVideoView = class(TCustomControl)
  private
    fCood: TCoodZoomDx;
    fHDrawDib: HDRAWDIB;
    fBitmap: TBitmap;
    fCustomBitmap: TBitmap;
    fBitmapInfoHeader256: TBitmapInfoHeader256;
    FAttributes: TDicomAttributes;
    fCenter: Boolean;
    fFitWindow: Boolean;

    fVideoWidth: Integer;
    fVideoHeight: Integer;
    fVideoDib: pbyte;
  protected
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMMove(var Msg: Tmessage); message WM_MOVE;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
    procedure CMMouseEnter(var Msg: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MOUSELEAVE;
    procedure SetCenter(Value: Boolean);
    procedure SetFitWindow(Value: Boolean);
  public
    // P U B L I C
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
    procedure Update; override;
    property Bitmap: TBitmap read fBitmap; // write fBitmap;
    property CustomBitmap: TBitmap read fCustomBitmap write fCustomBitmap;
    {$IFDEF CANUSEH263COMPRESS}
    function Decoding(dest: PBYTE; rsize, VIDEO_WIDTH, VIDEO_HEIGHT: integer): bool;
    {$ENDIF}
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

    property Attributes: TDicomAttributes read FAttributes write FAttributes;
    property Center: Boolean read fCenter write SetCenter;
    property FitWindow: Boolean read fFitWindow write SetFitWindow;
  end;

  TDicomImageCineToEvent = procedure(Sender: TObject; AIndex: Integer) of object;

  TCineView = class(TVideoView)
  private
    FAttributes: TDicomAttributes;
    FTimer: TTimer;
    FCineLoop2: Boolean;
    FCineSpeed: Integer;
    FDisplayText: Boolean;
    //    fLeaderWidth: Integer;

    MovingMousePos: TPoint;
    fMouseDragging: Boolean;
    fDraggingMouseButton: TMouseButton;

    FOnImageCineTo: TDicomImageCineToEvent;
    FAfterDraging: TNotifyEvent;

  protected
    procedure SetAttributes(AValue: TDicomAttributes);
    procedure OnPlayCine(Sender: TObject);
    {    procedure DoFinishNewDrawObject(Sender: TObject);
        procedure DoDrawObjectSize(Sender: TObject);
        procedure DoDrawObjectMove(Sender: TObject);}

    procedure SetCineSpeed(AValue: Integer);
    procedure SetCineDirection(AValue: Boolean);
    procedure SetCurrentFrame(AValue: Integer);
    function GetFrameCount: Integer;
    function getCurrentFrame: Integer;
    procedure SetActive(Value: Boolean);
    function GetActive: Boolean;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure CMWantSpecialKey(var Msg: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
    procedure SetLeaderMouserInspect(Value: TLeaderMouserInspect);
    function GetLeaderMouserInspect: TLeaderMouserInspect;
    procedure SetDisplayText(Value: Boolean);

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    // P U B L I C
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
    procedure Update; override;

    property Active: Boolean read GetActive write SetActive;
    property FrameCount: Integer read GetFrameCount;
    property CurrentFrame: Integer read getCurrentFrame write SetCurrentFrame;
    property CineDirection: Boolean read FCineLoop2 write SetCineDirection;
    property CineSpeed: integer read FCineSpeed write SetCineSpeed;
    property Attributes: TDicomAttributes read FAttributes write SetAttributes;
    //    property LeaderWidth: Integer read fLeaderWidth write fLeaderWidth;
    property LeaderMouserInspect: TLeaderMouserInspect read GetLeaderMouserInspect write
      SetLeaderMouserInspect;
    //    property DrawObjects: TCineDrawObjects read FDrawObjects;
  published
    property OnImageCineTo: TDicomImageCineToEvent read FOnImageCineTo write FOnImageCineTo;
    property OnAfterDraging: TNotifyEvent read FAfterDraging write FAfterDraging;
    property DisplayText: Boolean read FDisplayText write SetDisplayText;
  end;

  TDicomDirectDraw = class
  private
    fCood: TCoodZoomDx;
    fHDrawDib: HDRAWDIB;
    fBitmap: TBitmap;
    fBitmapInfoHeader256: TBitmapInfoHeader256;
    fCenter: Boolean;
    fFitWindow: Boolean;
    fLastWidth: Integer;
    fLastHeight: integer;
    fLastBitmapWidth: Integer;
    fLastBitmapHeight: integer;

    procedure UpdateCood(Width, Height: Integer); overload;

  public
    procedure UpdateCood(iWidth, iHeight: Integer; Width, Height: Integer); overload;

    constructor Create; virtual;
    destructor Destroy; override;
    procedure PaintTo(Canvas: TCanvas; Width, Height: Integer);

    property Bitmap: TBitmap read fBitmap;
    property Center: Boolean read fCenter write fCenter;
    property FitWindow: Boolean read fFitWindow write fFitWindow;

    property Cood: TCoodZoomDx read fCood;
    property HDrawDib: HDRAWDIB read fHDrawDib;
  end;

  TDicomDirectDrawCine = class(TDicomDirectDraw)
  private
    FAttributes: TDicomAttributes;
    FDisplayText: Boolean;
    FOnImageCineTo: TDicomImageCineToEvent;
  protected
    procedure SetAttributes(AValue: TDicomAttributes);

    procedure SetCurrentFrame(AValue: Integer);
    function GetFrameCount: Integer;
    function getCurrentFrame: Integer;
  public
    // P U B L I C
    constructor Create; override;
    destructor Destroy; override;

    procedure Refresh;
    property FrameCount: Integer read GetFrameCount;
    property CurrentFrame: Integer read getCurrentFrame write SetCurrentFrame;
    property Attributes: TDicomAttributes read FAttributes write SetAttributes;
  published
    property OnImageCineTo: TDicomImageCineToEvent read FOnImageCineTo write FOnImageCineTo;
    property DisplayText: Boolean read FDisplayText write FDisplayText;
  end;

  // DRAWDIB
function DrawDibBegin(hdd: hDrawDib; hDC: THandle; dxDest, dyDest: Integer;
  var lpbi: TBitmapInfoHeader; dxSrc, dySrc: Integer; wFlags: UInt): Boolean; stdcall;
function DrawDibChangePalette(hdd: hDrawDib; iStart, iLen: Integer;
  var lppe: TPaletteEntry): Boolean; stdcall;
function DrawDibClose(hdd: hDrawDib): Boolean; stdcall;
function DrawDibDraw(hdd: hDrawDib; hDC: THandle; xDst, yDst, dxDst, dyDst: Integer;
  var lpbi: TBitmapInfoHeader; Bits: Pointer; xSrc, ySrc, dxSrc, dySrc: Integer;
  wFlags: UInt): Boolean; stdcall;
function DrawDibEnd(hdd: hDrawDib): Boolean; stdcall;
function DrawDibGetBuffer(hdd: hDrawDib; var lpbi: TBitmapInfoHeader;
  dwSize, dwFlags: DWord): Pointer; stdcall;
function DrawDibGetPalette(hdd: hDrawDib): THandle; stdcall;
function DrawDibOpen: hDrawDib; stdcall;
function DrawDibProfileDisplay(var lpbi: TBitmapInfoHeader): Boolean; stdcall;
function DrawDibRealize(hdd: hDrawDib; hDC: THandle; fBackground: Bool): UInt; stdcall;
function DrawDibSetPalette(hdd: hDrawDib; hpal: THandle): Boolean; stdcall;
function DrawDibStart(hdd: hDrawDib; rate: LongInt): Boolean; stdcall;
function DrawDibStop(hdd: hDrawDib): Boolean; stdcall;
function DrawDibTime(hdd: hDrawDib; var lpddtime: TDrawDibTime): Boolean; stdcall;
const
  DLL = 'MsVfW32.dll'; // DRAWDIB LIBRARY
  STABLECOUNT = 2;
  IEGRIPSIZE = 3; // selection resize grip late/2
  A90 = PI / 2;
implementation

{$IFDEF CANUSEH263COMPRESS}
uses H263Unit;
{$ENDIF}
// DRAWDIB
function DrawDibBegin; external DLL name 'DrawDibBegin';
function DrawDibChangePalette; external DLL name 'DrawDibChangePalette';
function DrawDibClose; external DLL name 'DrawDibClose';
function DrawDibDraw; external DLL name 'DrawDibDraw';
function DrawDibEnd; external DLL name 'DrawDibEnd';
function DrawDibGetBuffer; external DLL name 'DrawDibGetBuffer';
function DrawDibGetPalette; external DLL name 'DrawDibGetPalette';
function DrawDibOpen; external DLL name 'DrawDibOpen';
function DrawDibProfileDisplay; external DLL name 'DrawDibProfileDisplay';
function DrawDibRealize; external DLL name 'DrawDibRealize';
function DrawDibSetPalette; external DLL name 'DrawDibSetPalette';
function DrawDibStart; external DLL name 'DrawDibStart';
function DrawDibStop; external DLL name 'DrawDibStop';
function DrawDibTime; external DLL name 'DrawDibTime';

function Get263_BitmapFrame(Frame: PBYTE; DIB: PBYTE; Len: integer): integer;
begin
  {$IFDEF CANUSEH263COMPRESS}
  Result := Decode(Frame, DIB, Len);
  {$ENDIF}
end;

constructor TVideoView.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  fVideoWidth := 0;
  fVideoHeight := 0;
  fVideoDib := nil;

  fCustomBitmap := nil;

  fBitmap := TBitmap.create;
  fBitmap.pixelformat := pf24bit;
  fBitmap.Width := 0;
  fBitmap.Height := 0;

  ZeroMemory(@fBitmapInfoHeader256, sizeof(TBitmapInfoHeader256));

  fHDrawDib := DrawDibOpen;
  Height := 105;
  Width := 105;
  FAttributes := nil;

  fFitWindow := false;
  fCenter := false;

  FCood := TCoodZoomDx.Create;
end;

destructor TVideoView.Destroy;
begin
  if fVideoDib <> nil then
  begin
    FreeMem(fVideoDib);
  end;
  fBitmap.free;
  FCood.Free;
  DrawDibClose(fHDrawDib);
  inherited;
end;

{$IFDEF CANUSEH263COMPRESS}

function TVideoView.Decoding(dest: PBYTE; rsize, VIDEO_WIDTH, VIDEO_HEIGHT: integer): bool;
var
  biHdr: TBITMAPINFOHEADER;
  b1, b2: Double;
begin
  if (fVideoWidth <> VIDEO_WIDTH) or (fVideoHeight <> VIDEO_HEIGHT) then
  begin
    fVideoWidth := VIDEO_WIDTH;
    fVideoHeight := VIDEO_HEIGHT;
    if fVideoDib <> nil then
    begin
      getMem(fVideoDib, VIDEO_WIDTH * VIDEO_HEIGHT * 3);
    end
    else
      ReallocMem(fVideoDib, VIDEO_WIDTH * VIDEO_HEIGHT * 3);
    EndDecoder;
    if StartDecoder(5, VIDEO_WIDTH, VIDEO_HEIGHT) = 0 then
    begin
      Exception.Create('Init Decder Error!');
    end;
  end;
  fbitmap.PixelFormat := pf24bit;
  fbitmap.Width := VIDEO_WIDTH;
  fbitmap.Height := VIDEO_HEIGHT;

  //if (VIDEO_WIDTH <> fBitmap.Width) or (VIDEO_HEIGHT <> fBitmap.Height)
          //or (fLastWidth <> Width) or (fLastHeight <> Height)
          //then
  b1 := VIDEO_HEIGHT / VIDEO_WIDTH;

  b2 := self.Height / self.Width;

  if (b1 < b2) then
  begin
    FCood.frx := self.Width;
    FCood.fry := Round(self.Width * b1);
  end
  else
    if (b1 > b2) then
  begin
    FCood.frx := Round(self.Height / b1);
    FCood.fry := self.Height;
  end
  else
  begin
    FCood.fry := self.Height;
    FCood.frx := self.Width;
  end;

  FCood.fZoom := FCood.frx / fBitmap.Width;
  FCood.fDZoom := fBitmap.Width / FCood.frx;

  FCood.fOffX := (self.Width - FCood.frx) div 2;
  FCood.fOffY := (self.Height - FCood.fry) div 2;

  FCood.fo1x := 0;
  FCood.fo2x := fBitmap.Width;
  FCood.fo1y := 0;
  FCood.fo2y := fBitmap.Height;

  Canvas.Brush.Color := clBlack;
  if FCood.fOffX > 0 then
  begin
    Canvas.FillRect(Rect(0, 0, FCood.fOffX, Height));
    Canvas.FillRect(Rect(FCood.fOffX + FCood.frx, 0, Width, Height));
  end;
  if FCood.fOffY > 0 then
  begin
    Canvas.FillRect(Rect(0, 0, Width, FCood.fOffY));
    Canvas.FillRect(Rect(0, FCood.fOffY + FCood.fry, Width, Height));
  end;
  //SetLength(dib,VIDEO_SIZE);
  try
    //cs.Enter;

    Get263_BitmapFrame(dest, fVideoDib, rsize);

    with biHdr do
    begin
      biWidth := VIDEO_WIDTH;
      biHeight := VIDEO_HEIGHT;
      biBitCount := 24;
      biSize := SizeOf(TBITMAPINFOHEADER);
      biCompression := 0;
      biPlanes := 1;
      biSizeImage := biWidth * biHeight * biPlanes * biBitCount div 8;
      biXPelsPerMeter := 0;
      biYPelsPerMeter := 0;
      biClrUsed := 0;
      biClrImportant := 0;
    end;
    DrawDibDraw(fHDrawDib, Canvas.handle, FCood.fOffX, FCood.fOffY, FCood.frx, FCood.fry,
      PBitmapInfoHeader(@biHdr)^, // address of bitmap data
      fVideoDib, // address of bitmap bits
      //        PBitmapInfoHeader(@fBitmapInfoHeader256)^, fbitmap.ScanLine[fbitmap.height - 1],
      FCood.fo1x, FCood.fo1y, FCood.fo2x, FCood.fo2y, 0);

    //StretchDIBits(fbitmap.Canvas.Handle // handle of device context
    { DrawDibDraw(fHDrawDib, Canvas.handle
      , 0
      // x-coordinate of upper-left corner of dest. rect.
      , 0
      // y-coordinate of upper-left corner of dest. rect.
      , VIDEO_WIDTH // width of Destination rectangle
      , VIDEO_HEIGHT // height of Destination rectangle
      , PBitmapInfoHeader(@biHdr)^ // address of bitmap data
      , fVideoDib // address of bitmap bits
      , 0
      // x-coordinate of upper-left corner of source rect.
      , 0
      // y-coordinate of upper-left corner of source rect.
      , VIDEO_WIDTH // width of source rectangle
      , VIDEO_HEIGHT // height of source rectangle
      ,0
      ); }
    Result := True;
  except
    Result := False;
  end;
end;
{$ENDIF}

procedure TVideoView.Paint;
begin
  if (csDesigning in ComponentState) or (fBitmap.Height = 0) or (fBitmap.Width = 0) then
  begin
    if assigned(fCustomBitmap) then
    begin
      Canvas.Brush.Color := clBlack;
      if FCood.fOffX > 0 then
      begin
        Canvas.FillRect(Rect(0, 0, FCood.fOffX, self.Height));
        Canvas.FillRect(Rect(FCood.fOffX + FCood.frx, 0, self.Width, self.Height));
      end;
      if FCood.fOffY > 0 then
      begin
        Canvas.FillRect(Rect(0, 0, self.Width, FCood.fOffY));
        Canvas.FillRect(Rect(0, FCood.fOffY + FCood.fry, self.Width, self.Height));
      end;
      if fCustomBitmap.height > 0 then
      begin
        with fBitmapInfoHeader256 do
        begin
          biSize := sizeof(TBitmapInfoHeader);
          biWidth := fCustomBitmap.width;
          biHeight := fCustomBitmap.height;
          biPlanes := 1;
          biBitCount := 24;
          biCompression := BI_RGB;
        end;
        DrawDibDraw(fHDrawDib, Canvas.handle, FCood.fOffX, FCood.fOffY, FCood.frx, FCood.fry,
          PBitmapInfoHeader(@fBitmapInfoHeader256)^, fCustomBitmap.ScanLine[fCustomBitmap.height -
          1],
            FCood.fo1x, FCood.fo1y, FCood.fo2x, FCood.fo2y, 0);
      end;
    end
    else
    begin
      Canvas.Brush.Color := clBlack;
      Canvas.Brush.Style := bsSolid;
      Canvas.FillRect(rect(1, 1, Width, Height));
    end
  end
  else
  begin
    Canvas.Brush.Color := clBlack;
    if FCood.fOffX > 0 then
    begin
      Canvas.FillRect(Rect(0, 0, FCood.fOffX, self.Height));
      Canvas.FillRect(Rect(FCood.fOffX + FCood.frx, 0, self.Width, self.Height));
    end;
    if FCood.fOffY > 0 then
    begin
      Canvas.FillRect(Rect(0, 0, self.Width, FCood.fOffY));
      Canvas.FillRect(Rect(0, FCood.fOffY + FCood.fry, self.Width, self.Height));
    end;
    if fbitmap.height > 0 then
    begin
      with fBitmapInfoHeader256 do
      begin
        biSize := sizeof(TBitmapInfoHeader);
        biWidth := fbitmap.width;
        biHeight := fbitmap.height;
        biPlanes := 1;
        biBitCount := 24;
        biCompression := BI_RGB;
      end;
      DrawDibDraw(fHDrawDib, Canvas.handle, FCood.fOffX, FCood.fOffY, FCood.frx, FCood.fry,
        PBitmapInfoHeader(@fBitmapInfoHeader256)^, fbitmap.ScanLine[fbitmap.height - 1],
        FCood.fo1x, FCood.fo1y, FCood.fo2x, FCood.fo2y, 0);
    end;
  end;
end;

procedure TVideoView.CMMouseEnter(var Msg: TMessage);
begin
  if (not assigned(FAttributes)) or (FAttributes.ImageData.FrameCount <= 0) then
    exit;

end;

procedure TVideoView.CMMouseLeave(var Msg: TMessage);
begin
  if (not assigned(FAttributes)) or (FAttributes.ImageData.FrameCount <= 0) then
    exit;

  Invalidate;
end;

procedure TVideoView.WMSize(var Message: TWMSize);
begin
  inherited;
  Canvas.Brush.Color := clBlack;
  Canvas.FillRect(Rect(0, 0, self.Width, self.Height));
  Update;
end;

procedure TVideoView.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
end;

procedure TVideoView.WMMove(var Msg: Tmessage);
begin
  inherited;

end;

procedure TVideoView.SetCenter(Value: Boolean);
begin
  if fCenter <> Value then
  begin
    fCenter := Value;
    Update;
    invalidate;
  end;
end;

procedure TVideoView.Update;
var
  b1, b2: Double;
begin
  if fBitmap.Height > 0 then
  begin
    if fFitWindow then
    begin
      b1 := fBitmap.Height / fBitmap.Width;

      b2 := self.Height / self.Width;

      if (b1 < b2) then
      begin
        FCood.frx := self.Width;
        FCood.fry := Round(self.Width * b1);
      end
      else
        if (b1 > b2) then
      begin
        FCood.frx := Round(self.Height / b1);
        FCood.fry := self.Height;
      end
      else
      begin
        FCood.fry := self.Height;
        FCood.frx := self.Width;
      end;
    end
    else
    begin
      FCood.frx := fBitmap.Width;
      FCood.fry := fBitmap.Height;
    end;

    FCood.fZoom := FCood.frx / fBitmap.Width;
    FCood.fDZoom := fBitmap.Width / FCood.frx;

    if fCenter then
    begin
      FCood.fOffX := (self.Width - FCood.frx) div 2;
      FCood.fOffY := (self.Height - FCood.fry) div 2;
    end
    else
    begin
      FCood.fOffX := 0;
      FCood.fOffY := 0;
    end;

    FCood.fo1x := 0;
    FCood.fo2x := fBitmap.Width;
    FCood.fo1y := 0;
    FCood.fo2y := fBitmap.Height;
  end
  else
    if assigned(fCustomBitmap) and (fCustomBitmap.Height > 0) then
  begin
    if fFitWindow then
    begin
      b1 := fCustomBitmap.Height / fCustomBitmap.Width;

      b2 := self.Height / self.Width;

      if (b1 < b2) then
      begin
        FCood.frx := self.Width;
        FCood.fry := Round(self.Width * b1);
      end
      else
        if (b1 > b2) then
      begin
        FCood.frx := Round(self.Height / b1);
        FCood.fry := self.Height;
      end
      else
      begin
        FCood.fry := self.Height;
        FCood.frx := self.Width;
      end;
    end
    else
    begin
      FCood.frx := fCustomBitmap.Width;
      FCood.fry := fCustomBitmap.Height;
    end;

    FCood.fZoom := FCood.frx / fCustomBitmap.Width;
    FCood.fDZoom := fCustomBitmap.Width / FCood.frx;

    if fCenter then
    begin
      FCood.fOffX := (self.Width - FCood.frx) div 2;
      FCood.fOffY := (self.Height - FCood.fry) div 2;
    end
    else
    begin
      FCood.fOffX := 0;
      FCood.fOffY := 0;
    end;

    FCood.fo1x := 0;
    FCood.fo2x := fCustomBitmap.Width;
    FCood.fo1y := 0;
    FCood.fo2y := fCustomBitmap.Height;
  end;
end;

procedure TVideoView.SetFitWindow(Value: Boolean);
begin
  if fFitWindow <> Value then
  begin
    fFitWindow := Value;
    Update;
    invalidate;
  end;
end;

procedure TCineView.SetAttributes(AValue: TDicomAttributes);
var
  d1: TDicomAttribute;
begin
  FAttributes := AValue;
  if assigned(FAttributes) then
  begin
    d1 := FAttributes.Item[$28, $30];
    if assigned(d1) then
    begin
      FCood.RescaleSlopeX := d1.AsFloat[0];
      FCood.RescaleSlopeY := d1.AsFloat[1];
    end;
    if assigned(FOnImageCineTo) then
      FOnImageCineTo(self, 0);
    FAttributes.ImageData.CurrentFrame := 0;
    if assigned(FAttributes.ImageData) and AssignToBitmap(FAttributes.ImageData, fbitmap, false)
      then
    begin
      Update;
      Paint;
    end;
  end;
end;

constructor TCineView.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  fDisplayText := false;

  FAttributes := nil;
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := false;
  FTimer.Interval := 40;
  FTimer.OnTimer := OnPlayCine;
  FCineLoop2 := false;
  FCineSpeed := 0;
  //  fLeaderWidth := 3;
  fMouseDragging := false;

  {  FDrawObjects := TCineDrawObjects.Create(@self.fCood);
    FDrawObjects.OnAfterNewDrawObject := DoFinishNewDrawObject;
    FDrawObjects.OnAfterObjectSize := DoDrawObjectSize;
    FDrawObjects.OnAfterObjectMove := DoDrawObjectMove;}
end;

destructor TCineView.Destroy;
begin
  FTimer.Free;
  //  FDrawObjects.Free;
  inherited;
end;

procedure TCineView.Update;
begin
  inherited;
  if assigned(FAttributes) and assigned(FAttributes.ImageData) then
    FAttributes.ImageData.UpdateCood(0,0, fCood.fOffX, fCood.foffY, 
       fCood.fZoom, fCood.RescaleSlopeX / 10, fCood.RescaleSlopeY / 10);
end;

procedure TCineView.Paint;
begin
  inherited;
  if assigned(self.FAttributes) then
  begin
    DrawAll(FAttributes.ImageData.DrawObjects, Canvas, Rect(0, 0, self.Width, self.Height), false,
      FAttributes.ImageData.CurrentFrame, 9);
    if self.FDisplayText then
    begin
      OverlayLabels(FAttributes.ImageData, Canvas, self.Width, self.Height, true);
    end;
  end;
end;

procedure TCineView.SetActive(Value: Boolean);
begin
  if not assigned(FAttributes.ImageData) then
    exit;
  if GetFrameCount <= 1 then
    exit;
  FTimer.Enabled := Value;
end;

function TCineView.GetActive: Boolean;
begin
  Result := FTimer.Enabled;
end;

function TCineView.GetFrameCount: Integer;
begin
  if assigned(FAttributes) then
    Result := FAttributes.ImageData.FrameCount
  else
    Result := 0;
end;

{procedure TCineView.DoFinishNewDrawObject(Sender: TObject);
var
  o1: TCineDrawObject;
  sd, av, ar: Double;
begin
  o1 := TCineDrawObject(Sender);
  if o1.Kind = ldmiAverage then
  begin
    FAttributes.ImageData.CalAverage(Round(o1.x[0]), Round(o1.y[0]), Round(o1.x[1]), Round(o1.y[1]), av, sd, ar);
    o1.Text := Format('均值=%8.2f,SD=%8.2f,面积=%8.2f', [av, sd, ar]);
  end;
  if assigned(FAfterDraging) then
    FAfterDraging(Sender);
end;

procedure TCineView.DoDrawObjectSize(Sender: TObject);
var
  o1: TCineDrawObject;
  sd, av, ar: Double;
begin
  o1 := TCineDrawObject(Sender);
  if o1.Kind = ldmiAverage then
  begin
    FAttributes.ImageData.CalAverage(Round(o1.x[0]), Round(o1.y[0]), Round(o1.x[1]), Round(o1.y[1]), av, sd, ar);
    o1.Text := Format('均值=%8.2f,SD=%8.2f,面积=%8.2f', [av, sd, ar]);
  end;
  if assigned(FAfterDraging) then
    FAfterDraging(Sender);
end;

procedure TCineView.DoDrawObjectMove(Sender: TObject);
var
  o1: TCineDrawObject;
  sd, av, ar: Double;
begin
  o1 := TCineDrawObject(Sender);
  if o1.Kind = ldmiAverage then
  begin
    FAttributes.ImageData.CalAverage(Round(o1.x[0]), Round(o1.y[0]), Round(o1.x[1]), Round(o1.y[1]), av, sd, ar);
    o1.Text := Format('均值=%8.2f,SD=%8.2f,面积=%8.2f', [av, sd, ar]);
  end;
  if assigned(FAfterDraging) then
    FAfterDraging(Sender);
end;    }

procedure TCineView.OnPlayCine(Sender: TObject);
begin
  if not assigned(FAttributes) then
    exit;
  if GetFrameCount <= 1 then
    exit;
  if not FCineLoop2 then
  begin
    FAttributes.ImageData.FrameIndex := FAttributes.ImageData.FrameIndex + 1;
    if FAttributes.ImageData.FrameIndex >= GetFrameCount - 1 then
    begin
      FAttributes.ImageData.FrameIndex := 0;
    end;
  end
  else
  begin
    FAttributes.ImageData.FrameIndex := FAttributes.ImageData.FrameIndex - 1;
    if FAttributes.ImageData.FrameIndex <= 0 then
    begin
      FAttributes.ImageData.FrameIndex := GetFrameCount - 1;
    end;
  end;
  SetCurrentFrame(FAttributes.ImageData.FrameIndex);
end;

procedure TCineView.SetCineDirection(AValue: Boolean);
begin
  FCineLoop2 := not AValue;
end;

procedure TCineView.SetCineSpeed(AValue: Integer);
const
  CineInterval: array[0..7] of integer = (
    33, 40, 50, 66, 100, 200, 500, 1000);
begin
  FCineSpeed := AValue;
  FTimer.Interval := CineInterval[AValue];
end;

procedure TCineView.SetCurrentFrame(AValue: Integer);
begin
  if assigned(FAttributes) and (AValue >= 0) and (AValue < FAttributes.ImageData.FrameCount)
    //    and (AValue <> FAttributes.ImageData.CurrentFrame)
  then
  begin
    if assigned(FOnImageCineTo) then
      FOnImageCineTo(self, AValue);
    FAttributes.ImageData.CurrentFrame := AValue;
    if assigned(FAttributes.ImageData) and AssignToBitmap(FAttributes.ImageData, fbitmap, false)
      then
      //    if FAttributes.ImageData.getDSAImage(fBitmap) then
      Paint;
  end;
end;

function TCineView.getCurrentFrame: Integer;
begin
  if FAttributes <> nil then
    Result := FAttributes.ImageData.CurrentFrame
  else
    Result := 0;
end;

procedure TCineView.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  SetFocus;
  if (not Active) then
    if assigned(FAttributes) and
      FAttributes.ImageData.DrawObjects.MouseDown(Button, Shift, X, Y, 0) then
    begin
      if (Button = mbRight) then
      begin
        fDraggingMouseButton := Button;
        fMouseDragging := true;
        MovingMousePos := Point(x, y);
      end;
    end
    else
    begin
      Invalidate;
    end;
end;

procedure TCineView.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Dx, Dy: Integer;
begin
  inherited;
  if not assigned(FAttributes) then
    exit;
  if fMouseDragging then
  begin
    Dx := X - MovingMousePos.X;
    Dy := Y - MovingMousePos.Y;
    if fDraggingMouseButton = mbRight then
    begin
      if (ssCtrl in Shift) then
      begin
        FAttributes.ImageData.WindowWidth := FAttributes.ImageData.WindowWidth + Dx * 10;
        FAttributes.ImageData.WindowCenter := FAttributes.ImageData.WindowCenter - Dy * 10;
      end
      else
      begin
        FAttributes.ImageData.WindowWidth := FAttributes.ImageData.WindowWidth + Dx;
        FAttributes.ImageData.WindowCenter := FAttributes.ImageData.WindowCenter - Dy;
      end;
      if (not Active) and assigned(FAttributes.ImageData) and
        AssignToBitmap(FAttributes.ImageData, fbitmap, false) then
        Paint;
      MovingMousePos := Point(x, y);
    end
  end
  else
    if not FAttributes.ImageData.DrawObjects.MouseMove(Shift, X, Y) then
    self.Invalidate;
end;

procedure TCineView.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if not assigned(FAttributes) then
    exit;
  if not fMouseDragging then
    if not FAttributes.ImageData.DrawObjects.MouseUp(Button, Shift, X, Y) then
      self.Invalidate;
  fMouseDragging := false;
end;

procedure TCineView.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then
  begin
    CurrentFrame := CurrentFrame + 1;
  end
  else
    if Key = VK_DOWN then
  begin
    CurrentFrame := CurrentFrame - 1;
  end
  else
    if Key = VK_DELETE then
  begin
    if assigned(FAttributes) then
    begin
      FAttributes.ImageData.DrawObjects.RemoveSelectedDrawObject;
      self.Invalidate;
    end;
  end;
  inherited;
end;

procedure TCineView.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;

end;

procedure TCineView.CMWantSpecialKey(var Msg: TCMWantSpecialKey);
begin
  inherited;
  case msg.CharCode of
    VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN,
      VK_PRIOR, VK_NEXT, VK_HOME, VK_END, VK_RETURN, VK_DELETE, VK_PRINT, VK_NUMPAD0..VK_NUMPAD9,
      VK_F1..VK_F24: msg.Result := 1
  end;
end;

procedure TCineView.SetLeaderMouserInspect(Value: TLeaderMouserInspect);
begin
  if FAttributes.ImageData.DrawObjects.LeaderMouserInspect <> Value then
  begin
    FAttributes.ImageData.DrawObjects.LeaderMouserInspect := Value;
    //    fMouseInserting := true;
  end;
end;

function TCineView.GetLeaderMouserInspect: TLeaderMouserInspect;
begin
  Result := FAttributes.ImageData.DrawObjects.LeaderMouserInspect;
end;

procedure TCineView.SetDisplayText(Value: Boolean);
begin
  fDisplayText := Value;
  //  CurrentFrame := CurrentFrame;
  Invalidate;
end;

constructor TDicomDirectDraw.Create;
begin
  //  fokblk := nil;

  fLastWidth := 0;
  fLastHeight := 0;
  fLastBitmapWidth := 0;
  fLastBitmapHeight := 0;

  fBitmap := TBitmap.create;
  fBitmap.pixelformat := pf24bit;
  fBitmap.Width := 0;
  fBitmap.Height := 0;

  ZeroMemory(@fBitmapInfoHeader256, sizeof(TBitmapInfoHeader256));

  fHDrawDib := DrawDibOpen;

  fFitWindow := true;
  fCenter := true;

  FCood := TCoodZoomDx.Create;
end;

destructor TDicomDirectDraw.Destroy;
begin
  fBitmap.free;
  FCood.Free;
  DrawDibClose(fHDrawDib);
  inherited;
end;

procedure TDicomDirectDraw.PaintTo(Canvas: TCanvas; Width, Height: Integer);
begin
  if (fBitmap.Width <> 0) and (fBitmap.Height <> 0) then
  begin
    Canvas.Lock;
    try
      if (fLastBitmapWidth <> fBitmap.Width) or (fLastBitmapHeight <> fBitmap.Height)
        or (fLastWidth <> Width) or (fLastHeight <> Height) then
        UpdateCood(Width, Height);

      Canvas.Brush.Color := clBlack;
      if FCood.fOffX > 0 then
      begin
        Canvas.FillRect(Rect(0, 0, FCood.fOffX, Height));
        Canvas.FillRect(Rect(FCood.fOffX + FCood.frx, 0, Width, Height));
      end;
      if FCood.fOffY > 0 then
      begin
        Canvas.FillRect(Rect(0, 0, Width, FCood.fOffY));
        Canvas.FillRect(Rect(0, FCood.fOffY + FCood.fry, Width, Height));
      end;
      if fbitmap.height > 0 then
      begin
        with fBitmapInfoHeader256 do
        begin
          biSize := sizeof(TBitmapInfoHeader);
          biWidth := fbitmap.width;
          biHeight := fbitmap.height;
          biPlanes := 1;
          biBitCount := 24;
          biCompression := BI_RGB;
        end;
        DrawDibDraw(fHDrawDib, Canvas.handle, FCood.fOffX + 1, FCood.fOffY + 1, FCood.frx - 1,
          FCood.fry - 1,
          PBitmapInfoHeader(@fBitmapInfoHeader256)^, fbitmap.ScanLine[fbitmap.height - 1],
          FCood.fo1x, FCood.fo1y, FCood.fo2x, FCood.fo2y, 0);
      end;
    finally
      Canvas.Unlock;
    end;
  end;
end;

procedure TDicomDirectDraw.UpdateCood(Width, Height: Integer);
var
  b1, b2: Double;
begin
  if fBitmap.Height > 0 then
  begin
    fLastBitmapWidth := fBitmap.Width;
    fLastBitmapHeight := fBitmap.Height;
    fLastWidth := Width;
    fLastHeight := Height;

    if fFitWindow then
    begin
      b1 := fBitmap.Height / fBitmap.Width;

      b2 := Height / Width;

      if (b1 < b2) then
      begin
        FCood.frx := Width;
        FCood.fry := Round(Width * b1);
      end
      else
        if (b1 > b2) then
      begin
        FCood.frx := Round(Height / b1);
        FCood.fry := Height;
      end
      else
      begin
        FCood.fry := Height;
        FCood.frx := Width;
      end;
    end
    else
    begin
      FCood.frx := fBitmap.Width;
      FCood.fry := fBitmap.Height;
    end;

    FCood.fZoom := FCood.frx / fBitmap.Width;
    FCood.fDZoom := fBitmap.Width / FCood.frx;

    if fCenter then
    begin
      FCood.fOffX := (Width - FCood.frx) div 2;
      FCood.fOffY := (Height - FCood.fry) div 2;
    end
    else
    begin
      FCood.fOffX := 0;
      FCood.fOffY := 0;
    end;

    FCood.fo1x := 0;
    FCood.fo2x := fBitmap.Width;
    FCood.fo1y := 0;
    FCood.fo2y := fBitmap.Height;
  end
  else
  begin

  end;
end;

procedure TDicomDirectDraw.UpdateCood(iWidth, iHeight: Integer; Width, Height: Integer);
var
  b1, b2: Double;
begin
  if (fLastBitmapWidth <> iWidth) or (fLastBitmapHeight <> iHeight)
    or (fLastWidth <> Width) or (fLastHeight <> Height) then
  begin
    fLastBitmapWidth := iWidth;
    fLastBitmapHeight := iHeight;
    fLastWidth := Width;
    fLastHeight := Height;

    if fFitWindow then
    begin
      b1 := iHeight / iWidth;

      b2 := Height / Width;

      if (b1 < b2) then
      begin
        FCood.frx := Width;
        FCood.fry := Round(Width * b1);
      end
      else
        if (b1 > b2) then
      begin
        FCood.frx := Round(Height / b1);
        FCood.fry := Height;
      end
      else
      begin
        FCood.fry := Height;
        FCood.frx := Width;
      end;
    end
    else
    begin
      FCood.frx := iWidth;
      FCood.fry := iHeight;
    end;

    FCood.fZoom := FCood.frx / iWidth;
    FCood.fDZoom := iWidth / FCood.frx;

    if fCenter then
    begin
      FCood.fOffX := (Width - FCood.frx) div 2;
      FCood.fOffY := (Height - FCood.fry) div 2;
    end
    else
    begin
      FCood.fOffX := 0;
      FCood.fOffY := 0;
    end;

    FCood.fo1x := 0;
    FCood.fo2x := iWidth;
    FCood.fo1y := 0;
    FCood.fo2y := iHeight;
  end;
end;

constructor TDicomDirectDrawCine.Create;
begin
  inherited Create;
  fDisplayText := false;

  FAttributes := nil;
end;

destructor TDicomDirectDrawCine.Destroy;
begin
  inherited;
end;

procedure TDicomDirectDrawCine.Refresh;
begin
  if assigned(FOnImageCineTo) then
    FOnImageCineTo(self, 0);
end;

procedure TDicomDirectDrawCine.SetAttributes(AValue: TDicomAttributes);
begin
  FAttributes := AValue;
end;

procedure TDicomDirectDrawCine.SetCurrentFrame(AValue: Integer);
begin
  if assigned(FAttributes) and assigned(FAttributes.ImageData) and
    (AValue >= 0) then
  begin
    if (AValue < FAttributes.ImageData.ImageArrayCount) then
    begin
      FAttributes.ImageData.CurrentFrame := AValue;
      AssignToBitmap(FAttributes.ImageData, fbitmap, false);
    end
    else
    begin
      FAttributes.ImageData.GetBitmapFromCine(AValue, fBitmap);
    end;
    fBitmap.Canvas.Brush.Style := bsClear;
    fBitmap.Canvas.Font.Color := clBlue;
    fBitmap.Canvas.Font.Size := 16;
    fBitmap.Canvas.TextOut(0, 0, FAttributes.GetString($20, $13));
    fBitmap.Canvas.Font.Size := 24;
    fBitmap.Canvas.TextOut(0, 20, IntToStr(AValue + 1));
    if assigned(FOnImageCineTo) then
      FOnImageCineTo(self, AValue);
  end;
end;

function TDicomDirectDrawCine.getCurrentFrame: Integer;
begin
  if FAttributes <> nil then
    Result := FAttributes.ImageData.CurrentFrame
  else
    Result := 0;
end;

function TDicomDirectDrawCine.GetFrameCount: Integer;
begin
  if assigned(FAttributes) and assigned(FAttributes.ImageData) then
    Result := FAttributes.ImageData.FrameCount
  else
    Result := 0;
end;

procedure TCineView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then
  begin
    {    if (AComponent = FAttributes) then
        begin
          FAttributes := nil;
          Invalidate;
        end; }
  end;
end;

{ TCoodZoomDx }

constructor TCoodZoomDx.Create;
begin
  fOffX := 0;
  fOffY := 0;
  frx := 0;
  fry := 0;
  fo1x := 0;
  fo1y := 0;
  fo2x := 0;
  fo2y := 0;
  fZoom := 1;
  fDZoom := 1;
  RescaleSlopeX := 1;
  RescaleSlopeY := 1;
end;

end.

