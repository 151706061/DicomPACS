{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DicomHistogramBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DCM_Attributes, DCM32, DCM_View, DCM_ImageData_Bitmap32;

type

  THistogramKind = set of (hkRed, hkGreen, hkBlue, hkGray);

  THistogramLabels = set of (hlVertical, hlHorizontal);

  THistogramStyle = (hsBars, hsLines);

  TDicomHistogramBox = class(TCustomControl)
  private
    { Private declarations }
    Bitmap: TBitMap;
    fBackground: TColor;
    fAIEP: TCustomDicomImage;
    fHistKind: THistogramKind;
    fLabels: THistogramLabels;
    fCompBar: boolean;
    fHistogramStyle: THistogramStyle;
    fHistogramXPos: integer;
    procedure SetBackground(bk: TColor);
    procedure SetLabels(v: THistogramLabels);
    procedure SetCompBar(v: boolean);
    procedure SetHistogramStyle(v: THistogramStyle);
    procedure SetHistogramKind(v: THistogramKind);
    procedure SetAIEP(v: TCustomDicomImage);
    function GetHistogramKind: THistogramKind;
    function GetLabels: THistogramLabels;
  protected
    { Protected declarations }
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    { Public declarations }
    procedure Paint; override;
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure Update; override;
    property HistogramXPos: integer read fHistogramXPos;
  published
    { Published declarations }
    property AttachedViewer: TCustomDicomImage read fAIEP write SetAIEP;
    property Background: TColor read fBackground write SetBackground default clWhite;
    property HistogramKind: THistogramKind read GetHistogramKind write SetHistogramKind default [hkGray];
    property Labels: THistogramLabels read GetLabels write SetLabels default [hlVertical, hlHorizontal];
    property CompBar: boolean read fCompBar write SetCompBar default true;
    property HistogramStyle: THistogramStyle read fHistogramStyle write SetHistogramStyle default hsBars;
    property Align;
    property DragCursor;
    property DragMode;
    property Enabled;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property Font;
    property Width default 256;
    property Height default 105;
  end;

implementation

/////////////////////////////////////////////////////////////////////////////////////

constructor TDicomHistogramBox.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  controlstyle := controlstyle + [csOpaque];
  fBackground := clWhite;
  fHistKind := [hkGray];
  fLabels := [hlVertical, hlHorizontal];
  fCompBar := true;
  fHistogramStyle := hsBars;
  Height := 105;
  Width := 256;
  bitmap := TBitmap.create;
  bitmap.PixelFormat := pf24bit;
  bitmap.Width := width;
  bitmap.Height := height;
  fAIEP := nil;
  Update;
end;

/////////////////////////////////////////////////////////////////////////////////////

destructor TDicomHistogramBox.Destroy;
begin
  bitmap.free;
  inherited;
end;

/////////////////////////////////////////////////////////////////////////////////////

procedure TDicomHistogramBox.Paint;
begin
  if Height > 10 then
    canvas.Draw(0, 0, bitmap);
end;

/////////////////////////////////////////////////////////////////////////////////////

procedure TDicomHistogramBox.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 0;
end;

/////////////////////////////////////////////////////////////////////////////////////

procedure TDicomHistogramBox.WMSize(var Message: TWMSize);
begin
  inherited;
  bitmap.Width := message.Width;
  bitmap.Height := message.Height;
  Update;
end;

/////////////////////////////////////////////////////////////////////////////////////

procedure TDicomHistogramBox.SetBackground(bk: TColor);
begin
  fBackground := bk;
  update;
end;

/////////////////////////////////////////////////////////////////////////////////////
// movimento mouse

procedure TDicomHistogramBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  //
end;

/////////////////////////////////////////////////////////////////////////////////////
// pressione di un bottone del mouse

procedure TDicomHistogramBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbLeft) then
  begin
  end;
end;

/////////////////////////////////////////////////////////////////////////////////////
// rilascio mouse
// fMouseSel 0=niente  1=capture su sat/val  2=capture su hue

procedure TDicomHistogramBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  //
end;

/////////////////////////////////////////////////////////////////////////////////////

procedure TDicomHistogramBox.SetLabels(v: THistogramLabels);
begin
  if v <> fLabels then
  begin
    fLabels := v;
    Update;
  end;
end;

/////////////////////////////////////////////////////////////////////////////////////

procedure TDicomHistogramBox.SetCompBar(v: boolean);
begin
  if v <> fCompBar then
  begin
    fCompBar := v;
    Update;
  end;
end;

/////////////////////////////////////////////////////////////////////////////////////

procedure TDicomHistogramBox.SetHistogramStyle(v: THistogramStyle);
begin
  if v <> fHistogramStyle then
  begin
    fHistogramStyle := v;
    Update;
  end;
end;

procedure TDicomHistogramBox.SetHistogramKind(v: THistogramKind);
begin
  if v <> fHistKind then
  begin
    fHistKind := v;
    Update;
  end;
end;

/////////////////////////////////////////////////////////////////////////////////////
// ricostruisce l'istogramma in base alla selezione corrente

procedure TDicomHistogramBox.Update;
var
  MaxV: dword; // massimo valore tra r,g,b,gray (max valore verticale)
  q, w, e: integer;
  PHist: PHistogram;
  dx, dy, x1: integer;
  xx: integer;
  sz: TSize;
  compdy: integer;
  px: pRGBROW;
begin
  if Height < 40 then
    exit;
  bitmap.Canvas.Brush.Color := fBackground;
  bitmap.canvas.fillrect(rect(0, 0, bitmap.width, bitmap.height));
  if (assigned(fAIEP) and (not fAIEP.Bitmap.Empty)) or (csDesigning in ComponentState) then
  begin
    new(pHist);
    if csDesigning in ComponentState then
      for q := 0 to 255 do
      begin
        pHist^[q].r := random(256);
        pHist^[q].g := random(256);
        pHist^[q].b := random(256);
        pHist^[q].Gray := random(256);
      end
    else
    begin
      _GetHistogram(fAIEP.Bitmap, pHist^, 0, 0, bitmap.Width, bitmap.Height);
    end;
    // trova massimo valore nell'istogramma
    MaxV := 0;
    for q := 2 to 255 do
    begin
      if (hkRed in fHistKind) and (PHist^[q].r > MaxV) then
        MaxV := PHist^[q].r;
      if (hkGreen in fHistKind) and (PHist^[q].g > MaxV) then
        MaxV := PHist^[q].g;
      if (hkBlue in fHistKind) and (PHist^[q].b > MaxV) then
        MaxV := PHist^[q].b;
      if (hkGray in fHistKind) and (PHist^[q].Gray > MaxV) then
        MaxV := PHist^[q].Gray;
    end;
    if MaxV > 0 then
    begin
      dx := width;
      dy := height;
      x1 := 0;
      compdy := trunc(abs(Font.Height) * 1.2);
      if fCompBar then
        dec(dy, compdy + 2);
      // LABELS
      if (hlVertical in fLabels) then
      begin
        // disegna asse verticale con numerazioni
        bitmap.canvas.font := Font;
        sz := bitmap.canvas.textextent(inttostr(MaxV));
        bitmap.canvas.TextOut(0, dy div 2, inttostr(MaxV div 2));
        bitmap.canvas.TextOut(0, 0, inttostr(MaxV));
        bitmap.canvas.pen.Color := Font.Color;
        dec(dx, sz.cx + 2);
        inc(x1, sz.cx + 2);
      end;
      if (hlHorizontal in fLabels) then
      begin
        // disegna asse orizzontale con numerazioni
        bitmap.canvas.font := Font;
        sz := bitmap.canvas.textextent(inttostr(MaxV));
        for q := 0 to 3 do
          bitmap.canvas.TextOut(x1 + round(((q * 64) / 256) * dx), dy - abs(Font.Height) - 1, inttostr(q * 64));
        q := bitmap.canvas.TextWidth('255');
        bitmap.canvas.TextOut(x1 + dx - q, dy - abs(Font.Height) - 1, '255');
        dec(dy, sz.cy + 2);
        // assi
        bitmap.Canvas.MoveTo(x1 - 1, 0);
        bitmap.Canvas.LineTo(x1 - 1, dy);
        bitmap.Canvas.LineTo(x1 + dx, dy);
      end;
      //
      fHistogramXPos := Left + x1;
      // COMPBAR
      if fCompBar then
      begin
        for w := 0 to compdy - 1 do
        begin // row
          px := bitmap.ScanLine[bitmap.height - w - 1];
          for q := 0 to dx - 1 do
          begin
            px^[x1 + q].r := 0;
            px^[x1 + q].g := 0;
            px^[x1 + q].b := 0;
            e := round(q / dx * 256);
            if (hkRed in fHistKind) or (hkGray in fHistKind) then
              px^[x1 + q].r := e;
            if (hkGreen in fHistKind) or (hkGray in fHistKind) then
              px^[x1 + q].g := e;
            if (hkBlue in fHistKind) or (hkGray in fHistKind) then
              px^[x1 + q].b := e;
          end;
        end;
      end;
      // disegna istogramma su Bitmap
      // hsBars
      if fHistogramStyle = hsBars then
        for xx := 0 to dx - 1 do
        begin
          q := trunc(xx / dx * 256);
          if hkRed in fHistKind then
          begin
            bitmap.canvas.pen.color := clRed;
            bitmap.canvas.MoveTo(xx + x1, dy - 1);
            bitmap.canvas.LineTo(xx + x1, dy - 1 - round((PHist^[q].r / MaxV) * dy) - 1);
          end;
          if hkGreen in fHistKind then
          begin
            bitmap.canvas.pen.color := clGreen;
            bitmap.canvas.MoveTo(xx + x1, dy - 1);
            bitmap.canvas.LineTo(xx + x1, dy - 1 - round((PHist^[q].g / MaxV) * dy) - 1);
          end;
          if hkBlue in fHistKind then
          begin
            bitmap.canvas.pen.color := clBlue;
            bitmap.canvas.MoveTo(xx + x1, dy - 1);
            bitmap.canvas.LineTo(xx + x1, dy - 1 - round((PHist^[q].b / MaxV) * dy) - 1);
          end;
          if hkGray in fHistKind then
          begin
            bitmap.canvas.pen.color := clBlack;
            bitmap.canvas.MoveTo(xx + x1, dy - 1);
            bitmap.canvas.LineTo(xx + x1, dy - 1 - round((PHist^[q].Gray / MaxV) * dy) - 1);
          end;
        end;
      // hsLines
      if fHistogramStyle = hsLines then
      begin
        if hkRed in fHistKind then
        begin
          bitmap.canvas.pen.color := clRed;
          bitmap.canvas.moveto(x1, dy - 1);
          for xx := 0 to dx - 1 do
          begin
            q := trunc(xx / dx * 256);
            bitmap.canvas.LineTo(xx + x1, dy - 1 - round((PHist^[q].r / MaxV) * dy));
          end;
        end;
        if hkGreen in fHistKind then
        begin
          bitmap.canvas.pen.color := clGreen;
          bitmap.canvas.moveto(x1, dy - 1);
          for xx := 0 to dx - 1 do
          begin
            q := trunc(xx / dx * 256);
            bitmap.canvas.LineTo(xx + x1, dy - 1 - round((PHist^[q].g / MaxV) * dy));
          end;
        end;
        if hkBlue in fHistKind then
        begin
          bitmap.canvas.pen.color := clBlue;
          bitmap.canvas.moveto(x1, dy - 1);
          for xx := 0 to dx - 1 do
          begin
            q := trunc(xx / dx * 256);
            bitmap.canvas.LineTo(xx + x1, dy - 1 - round((PHist^[q].b / MaxV) * dy));
          end;
        end;
        if hkGray in fHistKind then
        begin
          bitmap.canvas.pen.color := clBlack;
          bitmap.canvas.moveto(x1, dy - 1);
          for xx := 0 to dx - 1 do
          begin
            q := trunc(xx / dx * 256);
            bitmap.canvas.LineTo(xx + x1, dy - 1 - round((PHist^[q].Gray / MaxV) * dy));
          end;
        end;
      end;
    end;
    //
    dispose(pHist);
  end;
  invalidate;
end;

/////////////////////////////////////////////////////////////////////////////////////

procedure TDicomHistogramBox.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = fAIEP) and (Operation = opRemove) then
    fAIEP := nil;
end;

/////////////////////////////////////////////////////////////////////////////////////

procedure TDicomHistogramBox.SetAIEP(v: TCustomDicomImage);
begin
  fAIEP := v;
end;

/////////////////////////////////////////////////////////////////////////////////////

function TDicomHistogramBox.GetHistogramKind: THistogramKind;
begin
  result := fHistKind;
end;

/////////////////////////////////////////////////////////////////////////////////////

function TDicomHistogramBox.GetLabels: THistogramLabels;
begin
  result := fLabels;
end;

end.

