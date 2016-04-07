unit dcm_viewport;

{$I dcm_define.inc}

interface

uses
  {$IFDEF FPC}
  LCLProc, LCLType, LMessages, LResources,
  {$ENDIF}
  {$IFDEF WIN32}
  Windows,
  {$endif}
  Classes, SysUtils, Forms, Controls, Dialogs, Graphics,
  ExtCtrls, Menus, dcm_scene, dcm_vgcore, dcm_utils;

type

  TCanvasPaintEvent = procedure (Sender: TObject; const Canvas: TCanvas; const ARect: TRect; var Update: boolean) of object;

  TdxCustomCanvasLayer = class(TdxCustomBufferLayer)
  private
    FBitmap: TBitmap;
    FOnPaint: TCanvasPaintEvent;
    FOnMouseMove: TMouseMoveEvent;
    function GetLayerCanvas: TCanvas;
  protected
    procedure BeforePaint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateCanvas;
    property LayerCanvas: TCanvas read GetLayerCanvas;
  published
    property OnLayerPaint: TCanvasPaintEvent read FOnPaint write FOnPaint;
    property Resolution;
  end;

  TdxCanvasLayer = class(TdxCustomCanvasLayer)
  private
  protected
  public
  published
    property Align;
    property Body;
    property Collider;
    property ColliseTrack;
    property Dynamic;
    property Velocity;
    property Margins;
    property Padding;
  end;

{ GUI }

  TdxGUICanvasLayer = class(TdxCustomCanvasLayer)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
    property LayerAlign;
  end;

{ Deprecated }

  TdxScreenCanvasLayer = class(TdxGUICanvasLayer)
  private
  protected
  public
  published
    property LayerAlign;
  end;

implementation {===============================================================}

{ TdxCustomCanvasLayer }

constructor TdxCustomCanvasLayer.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TdxCustomCanvasLayer.Destroy;
begin
  if FBitmap <> nil then FreeAndNil(FBitmap);
  inherited;
end;

function TdxCustomCanvasLayer.GetLayerCanvas: TCanvas;
begin
  if FBitmap = nil then
  begin
    FBitmap := TBitmap.Create;
    FBitmap.HandleType := bmDIB;
    FBitmap.PixelFormat := pf32bit;
  end;
  if (FBitmap.Width <> FLayerWidth) then
    FBitmap.Width := FLayerWidth;
  if (FBitmap.Height <> FLayerHeight) then
    FBitmap.Height := -FLayerHeight;
  Result := FBitmap.Canvas;
end;

procedure TdxCustomCanvasLayer.BeforePaint;
var
  Bits: PdxColorArray;
  Update: boolean;
begin
  {$ifndef FPC}
  if Assigned(FOnPaint) then
  begin
    Update := false;
    FOnPaint(Self, LayerCanvas, Rect(0, 0, FLayerWidth, FLayerHeight), Update);
    { copy }
    if Update and FBuffer.LockBitmapBits(Bits, true) then
    begin
      vgMoveLongword(FBitmap.Scanline[FBitmap.Height - 1], Bits, FBuffer.Width * FBuffer.Height);
      { alpha }
      vgFillAlpha(Bits, FBuffer.Width * FBuffer.Height, $FF);

      vgFillLongword(Bits, FBuffer.Width, $707070);
      vgFillLongword(@Bits[FBuffer.Width * (1)], FBuffer.Width, $707070);
      vgFillLongword(@Bits[FBuffer.Width * (FBuffer.Height - 1)], FBuffer.Width, $707070);
      vgFillLongword(@Bits[FBuffer.Width * (FBuffer.Height - 2)], FBuffer.Width, $707070);
      { unlock }
      FBuffer.UnlockBitmapBits;
    end;
  end
  else
    FBuffer.Clear($FFFFFFFF);
  {$endif}
  inherited;
end;

procedure TdxCustomCanvasLayer.UpdateCanvas;
var
  Bits: PdxColorArray;
begin
  { copy }
  {$ifndef FPC}
  if FBuffer.LockBitmapBits(Bits, true) then
  begin
    vgMoveLongword(FBitmap.Scanline[FBitmap.Height - 1], Bits, FBuffer.Width * FBuffer.Height);
    { alpha }
    vgFillAlpha(Bits, FBuffer.Width * FBuffer.Height, $FF);

    vgFillLongword(Bits, FBuffer.Width, $707070);
    vgFillLongword(@Bits[FBuffer.Width * (1)], FBuffer.Width, $707070);
    vgFillLongword(@Bits[FBuffer.Width * (FBuffer.Height - 1)], FBuffer.Width, $707070);
    vgFillLongword(@Bits[FBuffer.Width * (FBuffer.Height - 2)], FBuffer.Width, $707070);
    { unlock }
    FBuffer.UnlockBitmapBits;
  end;
  {$endif}
end;

{ TdxGUICanvasLayer }

constructor TdxGUICanvasLayer.Create(AOwner: TComponent);
begin
  inherited;
  Projection := dxProjectionScreen;
  Width := 256;
  Height := 256;
end;

initialization
  RegisterDXObjects('Shapes', [TdxCanvasLayer]);
  RegisterDXObjects('GUI', [TdxGUICanvasLayer]);
end.
