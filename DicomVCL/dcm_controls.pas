unit dcm_controls;

{$I dcm_define.inc}

interface

uses
  {$IFDEF FPC}
  LCLProc, LCLType, LMessages, LResources,
  {$ENDIF}
  Classes, SysUtils, Forms, Controls, Dialogs, Graphics,
  ExtCtrls, Menus, dcm_scene, dcm_objects, dcm_utils, dcm_viewport,
  dcm_vgcore, dcm_vglayer;

type

{ GUI Objects =================================================================}

  TdxGUILayout = class(TdxCustomLayer)
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property LayerAlign;
    property ZWrite default false;
  end;

  TdxGUIPlane = class(TdxCustomLayer)
  private
    FPlaneScreen: TdxMeshData;
    FMaterial: TdxMaterial;
    procedure SetMaterial(const Value: TdxMaterial);
    procedure MaterialChanged(Sender: TObject);
  protected
    procedure Paint; override;
    procedure AfterPaint; override;
    procedure BeforePaint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Material: TdxMaterial read FMaterial write SetMaterial;
    property LayerAlign;
    property ZWrite default false;
  end;

  TdxGUIImage = class(TdxCustomLayer)
  private
    FBitmap: TdxBitmap;
    FPlaneScreen: TdxMeshData;
    FWrapMode: TvxImageWrap;
    procedure SetBitmap(const Value: TdxBitmap);
    procedure SetWrapMode(const Value: TvxImageWrap);
  protected
    procedure DoBitmapChanged(Sender: TObject);
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property LayerAlign;
    property Bitmap: TdxBitmap read FBitmap write SetBitmap;
    property WrapMode: TvxImageWrap read FWrapMode write SetWrapMode default vgImageStretch;
    property HitTest default false;
    property ZWrite default false;
  end;

  TdxGUIText = class(TdxCustomObjectLayer)
  private
    FText: TvxText;
    function GetText: WideString;
    procedure SetText(const Value: WideString);
    function GetFont: TvxFont;
    procedure SetFont(const Value: TvxFont);
    function GetBrush: TvxBrush;
    procedure SetBrush(const Value: TvxBrush);
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
    property LayerAlign;
    property Font: TvxFont read GetFont write SetFont;
    property Fill: TvxBrush read GetBrush write SetBrush;
    property Text: WideString read GetText write SetText;
    property HitTest default false;
    property ZWrite default false;
  end;

  TdxGUISelection = class(TdxCustomLayer)
  private
    FMoving: boolean;
    FDownPos: TvxPoint; 
    FTopLeft, FTopRight, FBottomLeft, FBottomRight: boolean;
    FTopLeftHot, FTopRightHot, FBottomLeftHot, FBottomRightHot: boolean;
    FGripSize: single;
    FMinSize: integer;
    procedure SetGripSize(const Value: single);
    procedure SetMinSize(const Value: integer);
  protected
    procedure Paint; override;
    procedure LayerMouseMove(Shift: TShiftState; X, Y: single); override;
    procedure LayerMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single); override;
    procedure LayerMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single); override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector;
      var Intersection: TdxVector): boolean; override;
    procedure MouseLeave; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property GripSize: single read FGripSize write SetGripSize;
    property MinSize: integer read FMinSize write SetMinSize default 15;
  end;

{ Deprecated }

  TdxScreenImage = class(TdxGUIImage)
  private
  protected
  public
  published
  end;

  TdxScreenDummy = class(TdxGUILayout)
  public
  end;

implementation {===============================================================}

uses dcm_ani;

{ GUI objects =================================================================}

{ TdxGUILayout }

constructor TdxGUILayout.Create(AOwner: TComponent);
begin
  inherited;
  Projection := dxProjectionScreen;
  ZWrite := false;
  Width := 256;
  Height := 256;
end;

procedure TdxGUILayout.Paint;
begin
//  Canvas.Material.Diffuse := vgColortoStr($AF000000 or random($FFFFFF));
//  Canvas.FillRect(vgRect(-Width / 2, -Height / 2, Width / 2, Height / 2), Depth, AbsoluteOpacity);
end;

{ TdxGUIPlane }

constructor TdxGUIPlane.Create(AOwner: TComponent);
const
  Res = 2;
var
  x, y: integer;
  s, xx, yy: single;
begin
  inherited;
  FPlaneScreen := TdxMeshData.Create;
  SetLength(FPlaneScreen.MeshVertices, Res * Res);
  for y := 0 to Res - 1 do
    for x := 0 to Res - 1 do
    begin
      s := 0; //sin((y / (Res - 1)) * (Pi * 4));
      FPlaneScreen .MeshVertices[x + (y * Res)] := TexVertexNormal(-0.5 + (x / (Res - 1)), -0.5 + (y / (Res - 1)), s, 0, 0, 1, (x / (Res - 1)), (y / (Res - 1)));
    end;

  SetLength(FPlaneScreen.MeshIndices, Res * Res * 6);
  for y := 0 to Res - 2 do
    for x := 0 to Res - 2 do
    begin
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 0] := x + (y * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 1] := x + 1 + (y * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 2] := x + ((y + 1) * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 3] := x + ((y + 1) * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 4] := x + 1 + (y * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 5] := x + 1 + ((y + 1) * Res);
    end;
  FMaterial := TdxMaterial.Create;
  FMaterial.NativeDiffuse := $FF000000 or random($FFFFFF);
  FMaterial.OnChanged := MaterialChanged;
  Projection := dxProjectionScreen;
  ZWrite := false;
  Width := 256;
  Height := 256;
end;

destructor TdxGUIPlane.Destroy;
begin
  FMaterial.Free;
  inherited ;
end;

procedure TdxGUIPlane.BeforePaint;
begin
  inherited;
  Canvas.Material.Assign(FMaterial);
end;

procedure TdxGUIPlane.AfterPaint;
begin
  inherited;
  { restore default }
  Canvas.SetRenderState(rsSolid);
  Canvas.SetRenderState(rsGouraud);
end;

procedure TdxGUIPlane.Paint;
begin
  Canvas.FillMesh(dxVector(0, 0, 0), dxVector(Width, Height, Depth), FPlaneScreen, AbsoluteOpacity);
end;

procedure TdxGUIPlane.MaterialChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TdxGUIPlane.SetMaterial(const Value: TdxMaterial);
begin
  FMaterial.Assign(Value);
end;

{ TdxGUIImage }

constructor TdxGUIImage.Create(AOwner: TComponent);
const
  Res = 2;
var
  x, y: integer;
  s, xx, yy: single;
begin
  inherited;
  Projection := dxProjectionScreen;
  Width := 256;
  Height := 256;
  ZWrite := false;
  HitTest := false;
  WrapMode := vgImageStretch;
  FBitmap := TdxBitmap.Create(1, 1);
  FBitmap.OnChange := DoBitmapChanged;
  FPlaneScreen := TdxMeshData.Create;
  SetLength(FPlaneScreen.MeshVertices, Res * Res);
  for y := 0 to Res - 1 do
    for x := 0 to Res - 1 do
    begin
      s := 0; //sin((y / (Res - 1)) * (Pi * 4));
      FPlaneScreen .MeshVertices[x + (y * Res)] := TexVertexNormal(-0.5 + (x / (Res - 1)), -0.5 + (y / (Res - 1)), s, 0, 0, 1, (x / (Res - 1)), (y / (Res - 1)));
    end;

  SetLength(FPlaneScreen.MeshIndices, Res * Res * 6);
  for y := 0 to Res - 2 do
    for x := 0 to Res - 2 do
    begin
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 0] := x + (y * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 1] := x + 1 + (y * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 2] := x + ((y + 1) * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 3] := x + ((y + 1) * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 4] := x + 1 + (y * Res);
      FPlaneScreen.MeshIndices[(x + (y * Res)) * 6 + 5] := x + 1 + ((y + 1) * Res);
    end;
end;

destructor TdxGUIImage.Destroy;
begin
  FPlaneScreen.Free;
  FBitmap.Free;
  inherited;
end;

procedure TdxGUIImage.DoBitmapChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TdxGUIImage.Paint;
var
  R: TvxRect;
  i, j: integer;
begin
  if FBitmap.Width * FBitmap.Height > 0 then
  begin
    Canvas.Material.TempBitmap := FBitmap;
    Canvas.Material.NativeDiffuse := dxOpacity($FFFFFFFF, AbsoluteOpacity);
    Canvas.Material.Lighting := false;
    Canvas.Material.BitmapMode := dxTexReplace;
    Canvas.Material.BitmapTileX := 1;
    Canvas.Material.BitmapTileY := 1;
    case WrapMode of
      vgImageOriginal: begin
        Canvas.SetRenderState(rsTexNearest);
        Canvas.FillMesh(dxVector(Round(-(Width / 2) + (Bitmap.Width / 2)),
          Round(-(Height / 2) + (Bitmap.Height / 2)), 0),
          dxVector(Bitmap.Width, Bitmap.Height, 0), FPlaneScreen, AbsoluteOpacity);
      end;
      vgImageFit: begin
        Canvas.SetRenderState(rsTexLinear);
        R := vgRect(0, 0, Bitmap.Width, Bitmap.Height);
        vgFitRect(R, vgRect(0, 0, Width, Height));
        Canvas.FillMesh(dxVector(0, 0, 0), dxVector(vgRectWidth(R), vgRectHeight(R), 0), FPlaneScreen, AbsoluteOpacity);
      end;
      vgImageStretch: begin
        Canvas.SetRenderState(rsTexLinear);
        Canvas.FillMesh(dxVector(0, 0, 0), dxVector(Width, Height, 0), FPlaneScreen, AbsoluteOpacity);
      end;
      vgImageTile: begin
        Canvas.SetRenderState(rsTexNearest);
        if (FBitmap.Width > 1) and (FBitmap.Height > 1) then
          for i := 0 to trunc(Width / FBitmap.Width) do
            for j := 0 to trunc(Height / FBitmap.Height) do
            begin
              R := vgRect(0, 0, FBitmap.Width, FBitmap.Height);
              vgOffsetRect(R, -Width / 2, -Height / 2);
              vgOffsetRect(R, i * FBitmap.Width, j * Bitmap.Height);
              Canvas.FillMesh(dxVector(round((R.Left + R.Right) / 2), round((R.Top + R.Bottom) / 2), 0),
                dxVector(vgRectWidth(R), vgRectHeight(R), 0), FPlaneScreen, AbsoluteOpacity);
            end;
      end;
    end;
    Canvas.Material.TempBitmap := nil;
  end;
end;

procedure TdxGUIImage.SetBitmap(const Value: TdxBitmap);
begin
  FBitmap.Assign(Value);
end;

procedure TdxGUIImage.SetWrapMode(const Value: TvxImageWrap);
begin
  if FWrapMode <> Value then
  begin
    FWrapMode := Value;
    Repaint;
  end;
end;

{ TdxGUIText }

constructor TdxGUIText.Create(AOwner: TComponent);
begin
  inherited;
  Projection := dxProjectionScreen;
  Width := 256;
  Height := 256;
  ZWrite := false;
  HitTest := false;

  FDesignInteract := false;

  FText := TvxText.Create(Self);
  FText.Locked := true;
  FText.Stored := false;
  AddObject(FText);
end;

function TdxGUIText.GetBrush: TvxBrush;
begin
  Result := FText.Fill;
end;

function TdxGUIText.GetFont: TvxFont;
begin
  Result := FText.Font;
end;

function TdxGUIText.GetText: WideString;
begin
  Result := FText.Text;
end;

procedure TdxGUIText.SetBrush(const Value: TvxBrush);
begin
  FText.Fill.Assign(Value);
end;

procedure TdxGUIText.SetFont(const Value: TvxFont);
begin
  FText.Font.Assign(Value);
end;

procedure TdxGUIText.SetText(const Value: WideString);
begin
  FText.Text := Value;
end;

{ TdxGUISelection }

constructor TdxGUISelection.Create(AOwner: TComponent);
begin
  inherited;
  FGripSize := 3;
  FMinSize := 15;
  Projection := dxProjectionScreen;
  AutoCapture := true;
  Width := 100;
  Height := 100;
  Depth := 1;
end;

function TdxGUISelection.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
begin
  FWidth := FWidth + (FGripSize * 2);
  FHeight := FHeight + (FGripSize * 2);
  Result := inherited RayCastIntersect(RayPos, RayDir, Intersection);
  FWidth := FWidth - (FGripSize * 2);
  FHeight := FHeight - (FGripSize * 2);
end;

procedure TdxGUISelection.LayerMouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: single);
begin
  inherited;
  if Button = mbLeft then
  begin
    if vgPtInRect(vgPoint(X, Y), vgRect(-FGripSize, -FGripSize, FGripSize, FGripSize)) then
      FTopLeft := true;
    if vgPtInRect(vgPoint(X, Y), vgRect(Width - FGripSize, -FGripSize, Width + FGripSize, FGripSize)) then
      FTopRight := true;
    if vgPtInRect(vgPoint(X, Y), vgRect(-FGripSize, Height - FGripSize, FGripSize, Height + FGripSize)) then
      FBottomLeft := true;
    if vgPtInRect(vgPoint(X, Y), vgRect(Width - FGripSize, Height - FGripSize, Width + FGripSize, Height + FGripSize)) then
      FBottomRight := true;

    FMoving := true;
    FDownPos := vgPoint(X, Y);
  end;
end;

procedure TdxGUISelection.LayerMouseMove(Shift: TShiftState; X, Y: single);
begin
  inherited;
  if FTopLeftHot <> vgPtInRect(vgPoint(X, Y), vgRect(-FGripSize, -FGripSize, FGripSize, FGripSize)) then
  begin
    FTopLeftHot := vgPtInRect(vgPoint(X, Y), vgRect(-FGripSize, -FGripSize, FGripSize, FGripSize));
    Repaint;
  end;
  if FTopRightHot <> vgPtInRect(vgPoint(X, Y), vgRect(Width - FGripSize, -FGripSize, Width + FGripSize, FGripSize)) then
  begin
    FTopRightHot := vgPtInRect(vgPoint(X, Y), vgRect(Width - FGripSize, -FGripSize, Width + FGripSize, FGripSize));
    Repaint;
  end;
  if FBottomLeftHot <> vgPtInRect(vgPoint(X, Y), vgRect(-FGripSize, Height - FGripSize, FGripSize, Height + FGripSize)) then
  begin
    FBottomLeftHot := vgPtInRect(vgPoint(X, Y), vgRect(-FGripSize, Height - FGripSize, FGripSize, Height + FGripSize));
    Repaint;
  end;
  if FBottomRightHot <> vgPtInRect(vgPoint(X, Y), vgRect(Width - FGripSize, Height - FGripSize, Width + FGripSize, Height + FGripSize)) then
  begin
    FBottomRightHot := vgPtInRect(vgPoint(X, Y), vgRect(Width - FGripSize, Height - FGripSize, Width + FGripSize, Height + FGripSize));
    Repaint;
  end;
  if FMoving then
  begin
    if FTopLeft then
    begin
      if Width - (X - FDownPos.X) >= FMinSize then
      begin
        Width := Width - (X - FDownPos.X);
        Position.X := Position.X + (X - FDownPos.X) / 2;
      end;
      if Height - (Y - FDownPos.Y) >= FMinSize then
      begin
        Height := Height - (Y - FDownPos.Y);
        Position.Y := Position.Y + (Y - FDownPos.Y) / 2;
      end;
    end
    else
    if FTopRight then
    begin
      if Width + (X - FDownPos.X) >= FMinSize then
      begin
        Position.X := Position.X + (X - FDownPos.X) / 2;
        Width := Width + (X - FDownPos.X);
        FDownPos.X := X;
      end;
      if Height - (Y - FDownPos.Y) >= FMinSize then
      begin
        Position.Y := Position.Y + (Y - FDownPos.Y) / 2;
        Height := Height - (Y - FDownPos.Y);
      end;
    end
    else
    if FBottomLeft then
    begin
      if Width - (X - FDownPos.X) >= FMinSize then
      begin
        Position.X := Position.X + (X - FDownPos.X) / 2;
        Width := Width - (X - FDownPos.X);
      end;
      if Height + (Y - FDownPos.Y) >= FMinSize then
      begin
        Position.Y := Position.Y + (Y - FDownPos.Y) / 2;
        Height := Height + (Y - FDownPos.Y);
        FDownPos.Y := Y;
      end;
    end
    else
    if FBottomRight then
    begin
      if Width + (X - FDownPos.X) >= FMinSize then
      begin
        Position.X := Position.X + (X - FDownPos.X) / 2;
        Width := Width + (X - FDownPos.X);
        FDownPos.X := X;
      end;
      if Height + (Y - FDownPos.Y) >= FMinSize then
      begin
        Position.Y := Position.Y + (Y - FDownPos.Y) / 2;
        Height := Height + (Y - FDownPos.Y);
        FDownPos.Y := Y;
      end;
    end
    else
    begin
      Position.X := Position.X + (X - FDownPos.X);
      Position.Y := Position.Y + (Y - FDownPos.Y);
    end;
  end;
end;

procedure TdxGUISelection.LayerMouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: single);
begin
  inherited;
  if FTopLeft or FTopRight or FBottomLeft or FBottomRight or FMoving then
  begin
    FTopLeft := false;
    FTopRight := false;
    FBottomLeft := false;
    FBottomRight := false;
    FMoving := false;
    Repaint;
  end;
end;

procedure TdxGUISelection.MouseLeave;
begin
  inherited;
  FTopLeftHot := false;
  FTopRightHot := false;
  FBottomLeftHot := false;
  FBottomRightHot := false;
  Repaint;
end;

procedure TdxGUISelection.Paint;
begin
  Canvas.Material.Lighting := false;
  Canvas.Material.Bitmap := '';
  if FTopLeftHot or FTopLeft then
    Canvas.Material.Diffuse := '#FFFF0000'
  else
    Canvas.Material.Diffuse := '#FFFFFFFF';
  Canvas.FillCube(dxVector(-Width / 2, -Height / 2, 0), dxVector(FGripSize * 2, FGripSize * 2, 1), AbsoluteOpacity);
  Canvas.Material.Diffuse := '#FFFFFFFF';
  Canvas.DrawCube(dxVector(-Width / 2, -Height / 2, 0), dxVector(FGripSize * 2, FGripSize * 2, 1), AbsoluteOpacity);

  if FTopRightHot or FTopRight then
    Canvas.Material.Diffuse := '#FFFF0000'
  else
    Canvas.Material.Diffuse := '#FFFFFFFF';
  Canvas.FillCube(dxVector(Width / 2, -Height / 2, 0), dxVector(FGripSize * 2, FGripSize * 2, 1), AbsoluteOpacity);
  Canvas.Material.Diffuse := '#FFFFFFFF';
  Canvas.DrawCube(dxVector(Width / 2, -Height / 2, 0), dxVector(FGripSize * 2, FGripSize * 2, 1), AbsoluteOpacity);

  if FBottomLeftHot or FBottomLeft then
    Canvas.Material.Diffuse := '#FFFF0000'
  else
    Canvas.Material.Diffuse := '#FFFFFFFF';
  Canvas.FillCube(dxVector(-Width / 2, Height / 2, 0), dxVector(FGripSize * 2, FGripSize * 2, 1), AbsoluteOpacity);
  Canvas.Material.Diffuse := '#FFFFFFFF';
  Canvas.DrawCube(dxVector(-Width / 2, Height / 2, 0), dxVector(FGripSize * 2, FGripSize * 2, 1), AbsoluteOpacity);

  if FBottomRightHot or FBottomRight then
    Canvas.Material.Diffuse := '#FFFF0000'
  else
    Canvas.Material.Diffuse := '#FFFFFFFF';
  Canvas.FillCube(dxVector(Width / 2, Height / 2, 0), dxVector(FGripSize * 2, FGripSize * 2, 1), AbsoluteOpacity);
  Canvas.Material.Diffuse := '#FFFFFFFF';
  Canvas.DrawCube(dxVector(Width / 2, Height / 2, 0), dxVector(FGripSize * 2, FGripSize * 2, 1), AbsoluteOpacity);

  Canvas.DrawLine(dxVector(-Width / 2, -Height / 2, 0), dxVector(Width / 2, -Height / 2, 0), AbsoluteOpacity);
  Canvas.DrawLine(dxVector(-Width / 2, Height / 2, 0), dxVector(Width / 2, Height / 2, 0), AbsoluteOpacity);
  Canvas.DrawLine(dxVector(-Width / 2, -Height / 2, 0), dxVector(-Width / 2, Height / 2, 0), AbsoluteOpacity);
  Canvas.DrawLine(dxVector(Width / 2, -Height / 2, 0), dxVector(Width / 2, Height / 2, 0), AbsoluteOpacity);
end;

procedure TdxGUISelection.SetGripSize(const Value: single);
begin
  if FGripSize <> Value then
  begin
    FGripSize := Value;
    Repaint;
  end;
end;

procedure TdxGUISelection.SetMinSize(const Value: integer);
begin
  if FMinSize <> Value then
  begin
    FMinSize := Value;
    if Width < FMinSize then
      Width := FMinSize;
    if Height < FMinSize then
      Height := FMinSize;
  end;
end;

initialization
  RegisterDXObjects('GUI', [TdxGUILayout, TdxGUIImage, TdxGUIPlane, TdxGUIText, TdxGUISelection]);
  RegisterClasses([TdxScreenImage, TdxScreenDummy]);
end.
