unit dcm_objects;

{$I dcm_define.inc}

interface

uses
  {$IFDEF FPC}
  LCLProc, LCLType, LMessages, LResources,
  {$ENDIF}
  Classes, SysUtils, Forms, Controls, Dialogs, Graphics,
  ExtCtrls, Menus, dcm_scene, dcm_utils, dcm_vgcore;

type

  TdxGrid = class(TdxVisualObject)
  private
    FLineColor: TdxColor;
    FFrequency: single;
    FMarks: single;
    procedure SetLineColor(const Value: string);
    function GetLineColor: string;
    procedure SetFrequency(const Value: single);
    procedure SetMarks(const Value: single);
  protected
    procedure SetDepth(const Value: single); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
    property Align;
    property Body;
    property Collider;
    property ColliseTrack;
    property Dynamic;
    property Velocity;
    property Margins;
    property Padding;
    property Marks: single read FMarks write SetMarks;
    property Frequency: single read FFrequency write SetFrequency;
    property LineColor: string read GetLineColor write SetLineColor;
  end;

  TdxShape = class(TdxVisualObject)
  private
    FMaterial: TdxMaterial;
    procedure SetMaterial(const Value: TdxMaterial);
  protected
    procedure MaterialChanged(Sender: TObject);
    procedure BeforePaint; override;
    procedure AfterPaint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property Body;
    property Collider;
    property ColliseTrack;
    property Dynamic;
    property Velocity;
    property Margins;
    property Padding;
    property Material: TdxMaterial read FMaterial write SetMaterial;
  end;

  TdxStrokeCube = class(TdxShape)
  private
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
  end;

  TdxCustomMesh = class(TdxShape)
  private
    FData: TdxMeshData;
    procedure SetData(const Value: TdxMeshData);
  protected
    procedure DoMeshChanged(Sender: TObject);
    procedure Paint; override;
    property Data: TdxMeshData read FData write SetData;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
  end;

  TdxCube = class(TdxCustomMesh)
  private
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
  end;

  TdxPlane = class(TdxCustomMesh)
  private
  protected
    procedure Paint; override;
    procedure SetDepth(const Value: single); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
  end;

  TdxMesh = class(TdxCustomMesh)
  private
  published
    property Data;
  end;

  TdxSphere = class(TdxCustomMesh)
  private
  protected
    procedure Paint; override;
    procedure CreateBody; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
  end;

  TdxCylinder = class(TdxCustomMesh)
  private
    procedure CreateBody; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
  published
  end;

  TdxRoundCube = class(TdxCustomMesh)
  private
  public
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
  published
  end;

  TdxCone = class(TdxCustomMesh)
  private
    procedure CreateBody; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
  published
  end;

  TdxText = class(TdxShape)
  private
    FFont: TdxFont;
    FText: WideString;
    procedure SetFont(const Value: TdxFont);
    procedure SetText(const Value: WideString);
  protected
    procedure FontChanged(Sender: TObject);
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
    property Font: TdxFont read FFont write SetFont;
    property Text: WideString read FText write SetText;
  end;

  TdxImage = class(TdxCustomMesh)
  private
    FPlane: TdxMeshData;
    FBitmap: TdxBitmap;
    procedure SetHeight(const Value: single);
  protected
    procedure DoBitmapChanged(Sender: TObject);
    procedure Paint; override;
    procedure SetDepth(const Value: single); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
    property Bitmap: TdxBitmap read FBitmap write FBitmap;
  end;

{ Pseudo 3D Objects ===========================================================}

  TdxShape3DSide = (
    dxShape3DFront,
    dxShape3DBack,
    dxShape3DLeft
  );

  TdxShape3DSides = set of TdxShape3DSide;

  TdxShape3D = class(TdxShape)
  private
    FFlatness: single;
    FSides: TdxShape3DSides;
    FMaterialLeft: TdxMaterial;
    FMaterialBack: TdxMaterial;
    FLeftSide2D: boolean;
    procedure SetFlatness(const Value: single);
    procedure SetSides(const Value: TdxShape3DSides);
    procedure SetMaterialBack(const Value: TdxMaterial);
    procedure SetMaterialLeft(const Value: TdxMaterial);
  protected
    procedure BeforePaint; override;
    procedure Paint; override;
    procedure ShapeMouseMove(Shift: TShiftState; X, Y: single); virtual;
    procedure ShapeMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single); virtual;
    procedure ShapeMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single); virtual;
    procedure MouseMove(Shift: TShiftState; X, Y, Dx, Dy: single; rayPos, rayDir: TdxVector); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single; rayPos, rayDir: TdxVector); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single; rayPos, rayDir: TdxVector); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean; override;
  published
    property Flatness: single read FFlatness write SetFlatness;
    property Sides: TdxShape3DSides read FSides write SetSides;
    property MaterialBack: TdxMaterial read FMaterialBack write SetMaterialBack;
    property MaterialLeft: TdxMaterial read FMaterialLeft write SetMaterialLeft;
  end;

  TdxRectangle3D = class(TdxShape3D)
  private
    FyRadius: single;
    FxRadius: single;
    FCorners: TvxCorners;
    FCornerType: TvxCornerType;
    procedure SetxRadius(const Value: single);
    procedure SetyRadius(const Value: single);
    function IsCornersStored: Boolean;
    procedure SetCorners(const Value: TvxCorners);
    procedure SetCornerType(const Value: TvxCornerType);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property xRadius: single read FxRadius write SetxRadius;
    property yRadius: single read FyRadius write SetyRadius;
    property Corners: TvxCorners read FCorners write SetCorners stored IsCornersStored;
    property CornerType: TvxCornerType read FCornerType write SetCornerType;
  end;

  TdxEllipse3D = class(TdxShape3D)
  private
  protected
    procedure Paint; override;
  public
  published
  end;

  TdxText3D = class(TdxShape3D)
  private
    FFont: TdxFont;
    FText: WideString;
    FWordWrap: boolean;
    FStretch: boolean;
    FVertTextAlign: TvxTextAlign;
    FHorzTextAlign: TvxTextAlign;
    procedure SetFont(const Value: TdxFont);
    procedure SetText(const Value: WideString);
    procedure SetHorzTextAlign(const Value: TvxTextAlign);
    procedure SetStretch(const Value: boolean);
    procedure SetVertTextAlign(const Value: TvxTextAlign);
    procedure SetWordWrap(const Value: boolean);
  protected
    procedure FontChanged(Sender: TObject);
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetTextBounds: TvxRect;
    function GetPathBounds: TvxRect;
    function GetPathLength: single;
  published
    property Font: TdxFont read FFont write SetFont;
    property HorzTextAlign: TvxTextAlign read FHorzTextAlign write SetHorzTextAlign default vgTextAlignCenter;
    property VertTextAlign: TvxTextAlign read FVertTextAlign write SetVertTextAlign default vgTextAlignCenter;
    property Text: WideString read FText write SetText;
    property Stretch: boolean read FStretch write SetStretch default false;
    property WordWrap: boolean read FWordWrap write SetWordWrap default true;
  end;

  TdxPath3D = class(TdxShape3D)
  private
    FPath: TvxPathData;
    FWrapMode: TvxPathWrap;
    procedure SetPath(const Value: TvxPathData);
    procedure SetWrapMode(const Value: TvxPathWrap);
  protected
    procedure PathChanged(Sender: TObject);
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Path: TvxPathData read FPath write SetPath;
    property WrapMode: TvxPathWrap read FWrapMode write SetWrapMode default vgPathStretch;
  end;

implementation {===============================================================}

type

  TdxHackMaterial = class(TdxMaterial);

{ TdxGrid }

constructor TdxGrid.Create(AOwner: TComponent);
begin
  inherited;
  FFrequency := 1;
  FMarks := 4;
  FLineColor := $50505050;
  Depth := 0.01;
end;

procedure TdxGrid.Paint;
var
  x, y: single;
begin
  inherited;
  Canvas.Material.Lighting := false;
  Canvas.Material.Bitmap := '';
  x := 0;
  y := 0;
  while x < Width / 2 do
  begin
    if (frac(x) = 0) and (frac(x / marks) = 0) then
      Canvas.Material.NativeDiffuse := dxOpacity(FLineColor and $FFFFFF or $A0000000, AbsoluteOpacity)
    else
      Canvas.Material.NativeDiffuse := dxOpacity(FLineColor, Opacity);
    Canvas.DrawLine(dxVector(x, -Height / 2, 0), dxVector(x, Height / 2, 0), AbsoluteOpacity);
    Canvas.DrawLine(dxVector(-x, -Height / 2, 0), dxVector(-x, Height / 2, 0), AbsoluteOpacity);
    x := x + FFrequency;
  end;
  while y < Height / 2 do
  begin
    if (frac(y) = 0) and (frac(y / marks) = 0) then
      Canvas.Material.NativeDiffuse := dxOpacity(FLineColor and $FFFFFF or $A0000000, AbsoluteOpacity)
    else
      Canvas.Material.NativeDiffuse := dxOpacity(FLineColor, AbsoluteOpacity);
    Canvas.DrawLine(dxVector(-Width / 2, y, 0), dxVector(Width / 2, y, 0), AbsoluteOpacity);
    Canvas.DrawLine(dxVector(-Width / 2, -y, 0), dxVector(Width / 2, -y, 0), AbsoluteOpacity);
    y := y + FFrequency;
  end;
end;

destructor TdxGrid.Destroy;
begin
  inherited;
end;

function TdxGrid.GetLineColor: string;
begin
  Result := dxColorToStr(FLineColor)
end;

procedure TdxGrid.SetLineColor(const Value: string);
begin
  if dxStrToColor(Value) <> FLineColor then
  begin
    FLineColor := dxStrToColor(Value);
  end;
end;

procedure TdxGrid.SetFrequency(const Value: single);
begin
  if FFrequency <> Value then
  begin
    FFrequency := Value;
    if FFrequency <= 0 then
      FFrequency := 0.01;
    Repaint;
  end;
end;

function TdxGrid.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  IP: TdxVector;
begin
  Result := RayCastPlaneIntersect(RayPos, RayDir, dxVector(0, 0, 0), dxVector(0, 0, 1), IP);
  if Result then
  begin
    Result := (Abs(IP.X) < Width / 2) and (Abs(IP.Y) < Height / 2);
    Intersection := dxVector(LocalToAbsolute(dxPoint(ip)));
  end;
end;

procedure TdxGrid.SetDepth(const Value: single);
begin
  inherited SetDepth(0.01);
end;

procedure TdxGrid.SetMarks(const Value: single);
begin
  if FMarks <> Value then
  begin
    FMarks := Value;
    Repaint;
  end;
end;

{ TdxShape }

constructor TdxShape.Create(AOwner: TComponent);
begin
  inherited;
  FMaterial := TdxMaterial.Create;
  FMaterial.NativeDiffuse := $FF000000 or random($FFFFFF);
  FMaterial.OnChanged := MaterialChanged;
end;

destructor TdxShape.Destroy;
begin
  FMaterial.Free;
  inherited ;
end;

procedure TdxShape.BeforePaint;
begin
  inherited;
  Canvas.SetMaterialWithOpacity(FMaterial, AbsoluteOpacity);
end;

procedure TdxShape.AfterPaint;
begin
  inherited;
  { restore default }
  Canvas.SetRenderState(rsSolid);
  Canvas.SetRenderState(rsGouraud);
end;

procedure TdxShape.MaterialChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TdxShape.SetMaterial(const Value: TdxMaterial);
begin
  FMaterial.Assign(Value);
end;

{ TdxStrokeCube ===============================================================}

constructor TdxStrokeCube.Create(AOwner: TComponent);
begin
  inherited;
  Material.Lighting := false;
end;

destructor TdxStrokeCube.Destroy;
begin
  inherited;
end;

procedure TdxStrokeCube.Paint;
begin
  inherited;
  Canvas.DrawCube(dxVector(0, 0, 0), dxVector(Width, Height, Depth), AbsoluteOpacity);
end;

function TdxStrokeCube.RayCastIntersect(const RayPos, RayDir: TdxVector;
  var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array [0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1,  0,  0);
  p[4] := dxVector(0, -1,  0);
  p[5] := dxVector(0,  0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := - (p[i].V[0]*RayPos.V[0] + p[i].V[1]*RayPos.V[1] + p[i].V[2]*RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
           / (p[i].V[0]*RayDir.V[0] + p[i].V[1]*RayDir.V[1] + p[i].V[2]*RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t*RayDir.V[0], RayPos.V[1] + t*RayDir.V[1], RayPos.V[2] + t*RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
         (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Exit;
      end;
    end;
  end;
  Result := false;
end;

{ TdxPlane }

const

PlaneVertices: array [0..120] of TdxTexVertexNormal = (
(x:-0.5; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.02; tu:0; tv:1; ),
(x:-0.4; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.1; tv:1; ),
(x:-0.3; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.2; tv:1; ),
(x:-0.2; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.3; tv:1; ),
(x:-0.1; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.4; tv:1; ),
(x:0; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.5; tv:1; ),
(x:0.1; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.6; tv:1; ),
(x:0.2; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.7; tv:1; ),
(x:0.3; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.8; tv:1; ),
(x:0.4; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.9; tv:1; ),
(x:0.5; y:-0.5; z:-0.5; nx:0; ny:0; nz:0.01; tu:1; tv:1; ),
(x:-0.5; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.03; tu:0; tv:0.9; ),
(x:-0.4; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.1; tv:0.9; ),
(x:-0.3; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.2; tv:0.9; ),
(x:-0.2; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.3; tv:0.9; ),
(x:-0.1; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.4; tv:0.9; ),
(x:0; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.5; tv:0.9; ),
(x:0.1; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.6; tv:0.9; ),
(x:0.2; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.7; tv:0.9; ),
(x:0.3; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.8; tv:0.9; ),
(x:0.4; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.9; tv:0.9; ),
(x:0.5; y:-0.4; z:-0.5; nx:0; ny:0; nz:0.03; tu:1; tv:0.9; ),
(x:-0.5; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.03; tu:0; tv:0.8; ),
(x:-0.4; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.1; tv:0.8; ),
(x:-0.3; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.2; tv:0.8; ),
(x:-0.2; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.3; tv:0.8; ),
(x:-0.1; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.4; tv:0.8; ),
(x:0; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.5; tv:0.8; ),
(x:0.1; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.6; tv:0.8; ),
(x:0.2; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.7; tv:0.8; ),
(x:0.3; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.8; tv:0.8; ),
(x:0.4; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.9; tv:0.8; ),
(x:0.5; y:-0.3; z:-0.5; nx:0; ny:0; nz:0.03; tu:1; tv:0.8; ),
(x:-0.5; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.03; tu:0; tv:0.7; ),
(x:-0.4; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.1; tv:0.7; ),
(x:-0.3; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.2; tv:0.7; ),
(x:-0.2; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.3; tv:0.7; ),
(x:-0.1; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.4; tv:0.7; ),
(x:0; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.5; tv:0.7; ),
(x:0.1; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.6; tv:0.7; ),
(x:0.2; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.7; tv:0.7; ),
(x:0.3; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.8; tv:0.7; ),
(x:0.4; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.9; tv:0.7; ),
(x:0.5; y:-0.2; z:-0.5; nx:0; ny:0; nz:0.03; tu:1; tv:0.7; ),
(x:-0.5; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.03; tu:0; tv:0.6; ),
(x:-0.4; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.1; tv:0.6; ),
(x:-0.3; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.2; tv:0.6; ),
(x:-0.2; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.3; tv:0.6; ),
(x:-0.1; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.4; tv:0.6; ),
(x:0; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.5; tv:0.6; ),
(x:0.1; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.6; tv:0.6; ),
(x:0.2; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.7; tv:0.6; ),
(x:0.3; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.8; tv:0.6; ),
(x:0.4; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.9; tv:0.6; ),
(x:0.5; y:-0.1; z:-0.5; nx:0; ny:0; nz:0.03; tu:1; tv:0.6; ),
(x:-0.5; y:0; z:-0.5; nx:0; ny:0; nz:0.03; tu:0; tv:0.5; ),
(x:-0.4; y:0; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.1; tv:0.5; ),
(x:-0.3; y:0; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.2; tv:0.5; ),
(x:-0.2; y:0; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.3; tv:0.5; ),
(x:-0.1; y:0; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.4; tv:0.5; ),
(x:0; y:0; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.5; tv:0.5; ),
(x:0.1; y:0; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.6; tv:0.5; ),
(x:0.2; y:0; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.7; tv:0.5; ),
(x:0.3; y:0; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.8; tv:0.5; ),
(x:0.4; y:0; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.9; tv:0.5; ),
(x:0.5; y:0; z:-0.5; nx:0; ny:0; nz:0.03; tu:1; tv:0.5; ),
(x:-0.5; y:0.1; z:-0.5; nx:0; ny:0; nz:0.03; tu:0; tv:0.4; ),
(x:-0.4; y:0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.1; tv:0.4; ),
(x:-0.3; y:0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.2; tv:0.4; ),
(x:-0.2; y:0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.3; tv:0.4; ),
(x:-0.1; y:0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.4; tv:0.4; ),
(x:0; y:0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.5; tv:0.4; ),
(x:0.1; y:0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.6; tv:0.4; ),
(x:0.2; y:0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.7; tv:0.4; ),
(x:0.3; y:0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.8; tv:0.4; ),
(x:0.4; y:0.1; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.9; tv:0.4; ),
(x:0.5; y:0.1; z:-0.5; nx:0; ny:0; nz:0.03; tu:1; tv:0.4; ),
(x:-0.5; y:0.2; z:-0.5; nx:0; ny:0; nz:0.03; tu:0; tv:0.3; ),
(x:-0.4; y:0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.1; tv:0.3; ),
(x:-0.3; y:0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.2; tv:0.3; ),
(x:-0.2; y:0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.3; tv:0.3; ),
(x:-0.1; y:0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.4; tv:0.3; ),
(x:0; y:0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.5; tv:0.3; ),
(x:0.1; y:0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.6; tv:0.3; ),
(x:0.2; y:0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.7; tv:0.3; ),
(x:0.3; y:0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.8; tv:0.3; ),
(x:0.4; y:0.2; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.9; tv:0.3; ),
(x:0.5; y:0.2; z:-0.5; nx:0; ny:0; nz:0.03; tu:1; tv:0.3; ),
(x:-0.5; y:0.3; z:-0.5; nx:0; ny:0; nz:0.03; tu:0; tv:0.2; ),
(x:-0.4; y:0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.1; tv:0.2; ),
(x:-0.3; y:0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.2; tv:0.2; ),
(x:-0.2; y:0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.3; tv:0.2; ),
(x:-0.1; y:0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.4; tv:0.2; ),
(x:0; y:0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.5; tv:0.2; ),
(x:0.1; y:0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.6; tv:0.2; ),
(x:0.2; y:0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.7; tv:0.2; ),
(x:0.3; y:0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.8; tv:0.2; ),
(x:0.4; y:0.3; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.9; tv:0.2; ),
(x:0.5; y:0.3; z:-0.5; nx:0; ny:0; nz:0.03; tu:1; tv:0.2; ),
(x:-0.5; y:0.4; z:-0.5; nx:0; ny:0; nz:0.03; tu:0; tv:0.1; ),
(x:-0.4; y:0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.1; tv:0.1; ),
(x:-0.3; y:0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.2; tv:0.1; ),
(x:-0.2; y:0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.3; tv:0.1; ),
(x:-0.1; y:0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.4; tv:0.1; ),
(x:0; y:0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.5; tv:0.1; ),
(x:0.1; y:0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.6; tv:0.1; ),
(x:0.2; y:0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.7; tv:0.1; ),
(x:0.3; y:0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.8; tv:0.1; ),
(x:0.4; y:0.4; z:-0.5; nx:0; ny:0; nz:0.06; tu:0.9; tv:0.1; ),
(x:0.5; y:0.4; z:-0.5; nx:0; ny:0; nz:0.03; tu:1; tv:0.1; ),
(x:-0.5; y:0.5; z:-0.5; nx:0; ny:0; nz:0.01; tu:0; tv:0; ),
(x:-0.4; y:0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.1; tv:0; ),
(x:-0.3; y:0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.2; tv:0; ),
(x:-0.2; y:0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.3; tv:0; ),
(x:-0.1; y:0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.4; tv:0; ),
(x:0; y:0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.5; tv:0; ),
(x:0.1; y:0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.6; tv:0; ),
(x:0.2; y:0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.7; tv:0; ),
(x:0.3; y:0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.8; tv:0; ),
(x:0.4; y:0.5; z:-0.5; nx:0; ny:0; nz:0.03; tu:0.9; tv:0; ),
(x:0.5; y:0.5; z:-0.5; nx:0; ny:0; nz:0.02; tu:1; tv:0; )
);

  PlaneIndices: array [0..599] of Word = (
11,12,0,1,0,12,12,13,1,2,1,13,13,14,2,3,2,14,14,15,3,4,3,15,15,16,4,5,4,16,16,17,5,6,5,17,17,18,6,7,6,
18,18,19,7,8,7,19,19,20,8,9,8,20,20,21,9,10,9,21,22,23,11,12,11,23,23,24,12,13,12,24,24,25,13,14,13,25,
25,26,14,15,14,26,26,27,15,16,15,27,27,28,16,17,16,28,28,29,17,18,17,29,29,30,18,19,18,30,30,31,19,20,
19,31,31,32,20,21,20,32,33,34,22,23,22,34,34,35,23,24,23,35,35,36,24,25,24,36,36,37,25,26,25,37,37,38,
26,27,26,38,38,39,27,28,27,39,39,40,28,29,28,40,40,41,29,30,29,41,41,42,30,31,30,42,42,43,31,32,31,43,
44,45,33,34,33,45,45,46,34,35,34,46,46,47,35,36,35,47,47,48,36,37,36,48,48,49,37,38,37,49,49,50,38,39,
38,50,50,51,39,40,39,51,51,52,40,41,40,52,52,53,41,42,41,53,53,54,42,43,42,54,55,56,44,45,44,56,56,57,
45,46,45,57,57,58,46,47,46,58,58,59,47,48,47,59,59,60,48,49,48,60,60,61,49,50,49,61,61,62,50,51,50,62,
62,63,51,52,51,63,63,64,52,53,52,64,64,65,53,54,53,65,66,67,55,56,55,67,67,68,56,57,56,68,68,69,57,58,
57,69,69,70,58,59,58,70,70,71,59,60,59,71,71,72,60,61,60,72,72,73,61,62,61,73,73,74,62,63,62,74,74,75,
63,64,63,75,75,76,64,65,64,76,77,78,66,67,66,78,78,79,67,68,67,79,79,80,68,69,68,80,80,81,69,70,69,81,
81,82,70,71,70,82,82,83,71,72,71,83,83,84,72,73,72,84,84,85,73,74,73,85,85,86,74,75,74,86,86,87,75,76,
75,87,88,89,77,78,77,89,89,90,78,79,78,90,90,91,79,80,79,91,91,92,80,81,80,92,92,93,81,82,81,93,93,94,
82,83,82,94,94,95,83,84,83,95,95,96,84,85,84,96,96,97,85,86,85,97,97,98,86,87,86,98,99,100,88,89,88,100,
100,101,89,90,89,101,101,102,90,91,90,102,102,103,91,92,91,103,103,104,92,93,92,104,104,105,93,94,93,
105,105,106,94,95,94,106,106,107,95,96,95,107,107,108,96,97,96,108,108,109,97,98,97,109,110,111,99,100,
99,111,111,112,100,101,100,112,112,113,101,102,101,113,113,114,102,103,102,114,114,115,103,104,103,115,
115,116,104,105,104,116,116,117,105,106,105,117,117,118,106,107,106,118,118,119,107,108,107,119,119,120,
108,109,108,120
  );

constructor TdxPlane.Create(AOwner: TComponent);
begin
  inherited;
  SetLength(Data.MeshVertices, Length(PlaneVertices));
  Move(PlaneVertices[0], Data.MeshVertices[0], SizeOf(PlaneVertices));
  SetLength(Data.MeshIndices, Length(PlaneIndices));
  Move(PlaneIndices[0], Data.MeshIndices[0], SizeOf(PlaneIndices));
end;

destructor TdxPlane.Destroy;
begin
  inherited;
end;

procedure TdxPlane.Paint;
begin
  inherited ;
end;

function TdxPlane.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array [0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1,  0,  0);
  p[4] := dxVector(0, -1,  0);
  p[5] := dxVector(0,  0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := - (p[i].V[0]*RayPos.V[0] + p[i].V[1]*RayPos.V[1] + p[i].V[2]*RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
           / (p[i].V[0]*RayDir.V[0] + p[i].V[1]*RayDir.V[1] + p[i].V[2]*RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t*RayDir.V[0], RayPos.V[1] + t*RayDir.V[1], RayPos.V[2] + t*RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
         (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Exit;
      end;
    end;
  end;
  // calc for captured - bacause mouse can be inside layer
  if not Result and (Scene <> nil) and (Scene.Captured = Self) then
  begin
    e := 0.5 + 0.001; //Small value for floating point imprecisions
    CubeSize.V[0] := Width * 10;
    CubeSize.V[1] := Height * 10;
    CubeSize.V[2] := Depth;
    eSize.V[0] := Width * 10 * e;
    eSize.V[1] := Height * 10 * e;
    eSize.V[2] := Depth * e;
    p[0] := XHmgVector;
    p[1] := YHmgVector;
    p[2] := ZHmgVector;
    p[3] := dxVector(-1,  0,  0);
    p[4] := dxVector(0, -1,  0);
    p[5] := dxVector(0,  0, -1);
    for i := 0 to 5 do
    begin
      if dxVectorDotProduct(p[i], RayDir) > 0 then
      begin
        t := - (p[i].V[0]*RayPos.V[0] + p[i].V[1]*RayPos.V[1] + p[i].V[2]*RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
             / (p[i].V[0]*RayDir.V[0] + p[i].V[1]*RayDir.V[1] + p[i].V[2]*RayDir.V[2]);
        r := dxVector(RayPos.V[0] + t*RayDir.V[0], RayPos.V[1] + t*RayDir.V[1], RayPos.V[2] + t*RayDir.V[2]);
        if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
           (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
        begin
          Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
          Result := true;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TdxPlane.SetDepth(const Value: single);
begin
  inherited SetDepth(0.01);
end;

{ TdxCube }

const 
CubeVertices: array [0..451] of TdxTexVertexNormal = (
(x:-0.5; y:-0.5; z:-0.5; nx:0; ny:0; nz:-0.0555555; tu:1; tv:1; ),
(x:-0.333333; y:-0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.833333; tv:1; ),
(x:-0.166667; y:-0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.666667; tv:1; ),
(x:-1.11759E-8; y:-0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.5; tv:1; ),
(x:0.166667; y:-0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.333333; tv:1; ),
(x:0.333333; y:-0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.166667; tv:1; ),
(x:0.5; y:-0.5; z:-0.5; nx:0; ny:0; nz:-0.0277778; tu:0; tv:1; ),
(x:-0.5; y:-0.333333; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:1; tv:0.833333; ),
(x:-0.333333; y:-0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.833333; tv:0.833333; ),
(x:-0.166667; y:-0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.666667; tv:0.833333; ),
(x:-1.11759E-8; y:-0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.5; tv:0.833333; ),
(x:0.166667; y:-0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.333333; tv:0.833333; ),
(x:0.333333; y:-0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.166667; tv:0.833333; ),
(x:0.5; y:-0.333333; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0; tv:0.833333; ),
(x:-0.5; y:-0.166667; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:1; tv:0.666667; ),
(x:-0.333333; y:-0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.833333; tv:0.666667; ),
(x:-0.166667; y:-0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.666667; tv:0.666667; ),
(x:-1.11759E-8; y:-0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.5; tv:0.666667; ),
(x:0.166667; y:-0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.333333; tv:0.666667; ),
(x:0.333333; y:-0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.166667; tv:0.666667; ),
(x:0.5; y:-0.166667; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0; tv:0.666667; ),
(x:-0.5; y:-7.45058E-9; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:1; tv:0.5; ),
(x:-0.333333; y:-7.45058E-9; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.833333; tv:0.5; ),
(x:-0.166667; y:-7.45058E-9; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.666667; tv:0.5; ),
(x:-1.11759E-8; y:-7.45058E-9; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.5; tv:0.5; ),
(x:0.166667; y:-7.45058E-9; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.333333; tv:0.5; ),
(x:0.333333; y:-7.45058E-9; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.166667; tv:0.5; ),
(x:0.5; y:-7.45058E-9; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0; tv:0.5; ),
(x:-0.5; y:0.166667; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:1; tv:0.333333; ),
(x:-0.333333; y:0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.833333; tv:0.333333; ),
(x:-0.166667; y:0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.666667; tv:0.333333; ),
(x:-1.11759E-8; y:0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.5; tv:0.333333; ),
(x:0.166667; y:0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.333333; tv:0.333333; ),
(x:0.333333; y:0.166667; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.166667; tv:0.333333; ),
(x:0.5; y:0.166667; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0; tv:0.333333; ),
(x:-0.5; y:0.333333; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:1; tv:0.166667; ),
(x:-0.333333; y:0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.833333; tv:0.166667; ),
(x:-0.166667; y:0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.666667; tv:0.166667; ),
(x:-1.11759E-8; y:0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.5; tv:0.166667; ),
(x:0.166667; y:0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.333333; tv:0.166667; ),
(x:0.333333; y:0.333333; z:-0.5; nx:0; ny:0; nz:-0.166667; tu:0.166667; tv:0.166667; ),
(x:0.5; y:0.333333; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0; tv:0.166667; ),
(x:-0.5; y:0.5; z:-0.5; nx:0; ny:0; nz:-0.0277778; tu:1; tv:0; ),
(x:-0.333333; y:0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.833333; tv:0; ),
(x:-0.166667; y:0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.666667; tv:0; ),
(x:-1.11759E-8; y:0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.5; tv:0; ),
(x:0.166667; y:0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.333333; tv:0; ),
(x:0.333333; y:0.5; z:-0.5; nx:0; ny:0; nz:-0.0833333; tu:0.166667; tv:0; ),
(x:0.5; y:0.5; z:-0.5; nx:0; ny:0; nz:-0.0555556; tu:0; tv:0; ),
(x:-0.5; y:-0.5; z:0.5; nx:0; ny:0; nz:0.0555555; tu:0; tv:1; ),
(x:-0.333333; y:-0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.166667; tv:1; ),
(x:-0.166667; y:-0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.333333; tv:1; ),
(x:-1.11759E-8; y:-0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.5; tv:1; ),
(x:0.166667; y:-0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.666667; tv:1; ),
(x:0.333333; y:-0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.833333; tv:1; ),
(x:0.5; y:-0.5; z:0.5; nx:0; ny:0; nz:0.0277778; tu:1; tv:1; ),
(x:-0.5; y:-0.333333; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0; tv:0.833333; ),
(x:-0.333333; y:-0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.166667; tv:0.833333; ),
(x:-0.166667; y:-0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.333333; tv:0.833333; ),
(x:-1.11759E-8; y:-0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.5; tv:0.833333; ),
(x:0.166667; y:-0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.666667; tv:0.833333; ),
(x:0.333333; y:-0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.833333; tv:0.833333; ),
(x:0.5; y:-0.333333; z:0.5; nx:0; ny:0; nz:0.0833333; tu:1; tv:0.833333; ),
(x:-0.5; y:-0.166667; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0; tv:0.666667; ),
(x:-0.333333; y:-0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.166667; tv:0.666667; ),
(x:-0.166667; y:-0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.333333; tv:0.666667; ),
(x:-1.11759E-8; y:-0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.5; tv:0.666667; ),
(x:0.166667; y:-0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.666667; tv:0.666667; ),
(x:0.333333; y:-0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.833333; tv:0.666667; ),
(x:0.5; y:-0.166667; z:0.5; nx:0; ny:0; nz:0.0833333; tu:1; tv:0.666667; ),
(x:-0.5; y:-7.45058E-9; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0; tv:0.5; ),
(x:-0.333333; y:-7.45058E-9; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.166667; tv:0.5; ),
(x:-0.166667; y:-7.45058E-9; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.333333; tv:0.5; ),
(x:-1.11759E-8; y:-7.45058E-9; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.5; tv:0.5; ),
(x:0.166667; y:-7.45058E-9; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.666667; tv:0.5; ),
(x:0.333333; y:-7.45058E-9; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.833333; tv:0.5; ),
(x:0.5; y:-7.45058E-9; z:0.5; nx:0; ny:0; nz:0.0833333; tu:1; tv:0.5; ),
(x:-0.5; y:0.166667; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0; tv:0.333333; ),
(x:-0.333333; y:0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.166667; tv:0.333333; ),
(x:-0.166667; y:0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.333333; tv:0.333333; ),
(x:-1.11759E-8; y:0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.5; tv:0.333333; ),
(x:0.166667; y:0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.666667; tv:0.333333; ),
(x:0.333333; y:0.166667; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.833333; tv:0.333333; ),
(x:0.5; y:0.166667; z:0.5; nx:0; ny:0; nz:0.0833333; tu:1; tv:0.333333; ),
(x:-0.5; y:0.333333; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0; tv:0.166667; ),
(x:-0.333333; y:0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.166667; tv:0.166667; ),
(x:-0.166667; y:0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.333333; tv:0.166667; ),
(x:-1.11759E-8; y:0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.5; tv:0.166667; ),
(x:0.166667; y:0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.666667; tv:0.166667; ),
(x:0.333333; y:0.333333; z:0.5; nx:0; ny:0; nz:0.166667; tu:0.833333; tv:0.166667; ),
(x:0.5; y:0.333333; z:0.5; nx:0; ny:0; nz:0.0833333; tu:1; tv:0.166667; ),
(x:-0.5; y:0.5; z:0.5; nx:0; ny:0; nz:0.0277778; tu:0; tv:0; ),
(x:-0.333333; y:0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.166667; tv:0; ),
(x:-0.166667; y:0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.333333; tv:0; ),
(x:-1.11759E-8; y:0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.5; tv:0; ),
(x:0.166667; y:0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.666667; tv:0; ),
(x:0.333333; y:0.5; z:0.5; nx:0; ny:0; nz:0.0833333; tu:0.833333; tv:0; ),
(x:0.5; y:0.5; z:0.5; nx:0; ny:0; nz:0.0555556; tu:1; tv:0; ),
(x:-0.5; y:-0.5; z:-0.357143; nx:0; ny:-0.0714286; nz:0; tu:0; tv:0.857143; ),
(x:-0.333333; y:-0.5; z:-0.357143; nx:0; ny:-0.142857; nz:0; tu:0.166667; tv:0.857143; ),
(x:-0.166667; y:-0.5; z:-0.357143; nx:0; ny:-0.142857; nz:0; tu:0.333333; tv:0.857143; ),
(x:-1.11759E-8; y:-0.5; z:-0.357143; nx:0; ny:-0.142857; nz:0; tu:0.5; tv:0.857143; ),
(x:0.166667; y:-0.5; z:-0.357143; nx:0; ny:-0.142857; nz:0; tu:0.666667; tv:0.857143; ),
(x:0.333333; y:-0.5; z:-0.357143; nx:0; ny:-0.142857; nz:0; tu:0.833333; tv:0.857143; ),
(x:0.5; y:-0.5; z:-0.357143; nx:0; ny:-0.0714286; nz:0; tu:1; tv:0.857143; ),
(x:0.5; y:-0.333333; z:-0.357143; nx:0.142857; ny:0; nz:2.98023E-8; tu:0.166667; tv:0.857143; ),
(x:0.5; y:-0.166667; z:-0.357143; nx:0.142857; ny:0; nz:2.98023E-8; tu:0.333333; tv:0.857143; ),
(x:0.5; y:-7.45058E-9; z:-0.357143; nx:0.142857; ny:0; nz:2.98023E-8; tu:0.5; tv:0.857143; ),
(x:0.5; y:0.166667; z:-0.357143; nx:0.142857; ny:0; nz:2.98023E-8; tu:0.666667; tv:0.857143; ),
(x:0.5; y:0.333333; z:-0.357143; nx:0.142857; ny:0; nz:2.98023E-8; tu:0.833333; tv:0.857143; ),
(x:0.5; y:0.5; z:-0.357143; nx:0.0714286; ny:0; nz:1.98682E-8; tu:1; tv:0.857143; ),
(x:0.333333; y:0.5; z:-0.357143; nx:0; ny:0.142857; nz:2.98023E-8; tu:0.166667; tv:0.857143; ),
(x:0.166667; y:0.5; z:-0.357143; nx:0; ny:0.142857; nz:2.98023E-8; tu:0.333333; tv:0.857143; ),
(x:-7.07805E-8; y:0.5; z:-0.357143; nx:0; ny:0.142857; nz:2.98023E-8; tu:0.5; tv:0.857143; ),
(x:-0.166667; y:0.5; z:-0.357143; nx:0; ny:0.142857; nz:2.98023E-8; tu:0.666667; tv:0.857143; ),
(x:-0.333333; y:0.5; z:-0.357143; nx:0; ny:0.142857; nz:2.98023E-8; tu:0.833333; tv:0.857143; ),
(x:-0.5; y:0.5; z:-0.357143; nx:0; ny:0.0714285; nz:1.98682E-8; tu:1; tv:0.857143; ),
(x:-0.5; y:0.333333; z:-0.357143; nx:-0.142857; ny:0; nz:0; tu:0.166667; tv:0.857143; ),
(x:-0.5; y:0.166667; z:-0.357143; nx:-0.142857; ny:0; nz:0; tu:0.333333; tv:0.857143; ),
(x:-0.5; y:-6.70552E-8; z:-0.357143; nx:-0.142857; ny:0; nz:0; tu:0.5; tv:0.857143; ),
(x:-0.5; y:-0.166667; z:-0.357143; nx:-0.142857; ny:0; nz:0; tu:0.666667; tv:0.857143; ),
(x:-0.5; y:-0.333333; z:-0.357143; nx:-0.142857; ny:0; nz:0; tu:0.833333; tv:0.857143; ),
(x:-0.5; y:-0.5; z:-0.214286; nx:0; ny:-0.0714286; nz:0; tu:0; tv:0.714286; ),
(x:-0.333333; y:-0.5; z:-0.214286; nx:0; ny:-0.142857; nz:0; tu:0.166667; tv:0.714286; ),
(x:-0.166667; y:-0.5; z:-0.214286; nx:0; ny:-0.142857; nz:0; tu:0.333333; tv:0.714286; ),
(x:-1.11759E-8; y:-0.5; z:-0.214286; nx:0; ny:-0.142857; nz:0; tu:0.5; tv:0.714286; ),
(x:0.166667; y:-0.5; z:-0.214286; nx:0; ny:-0.142857; nz:0; tu:0.666667; tv:0.714286; ),
(x:0.333333; y:-0.5; z:-0.214286; nx:0; ny:-0.142857; nz:0; tu:0.833333; tv:0.714286; ),
(x:0.5; y:-0.5; z:-0.214286; nx:0; ny:-0.0714286; nz:0; tu:1; tv:0.714286; ),
(x:0.5; y:-0.333333; z:-0.214286; nx:0.142857; ny:0; nz:0; tu:0.166667; tv:0.714286; ),
(x:0.5; y:-0.166667; z:-0.214286; nx:0.142857; ny:0; nz:0; tu:0.333333; tv:0.714286; ),
(x:0.5; y:-7.45058E-9; z:-0.214286; nx:0.142857; ny:0; nz:0; tu:0.5; tv:0.714286; ),
(x:0.5; y:0.166667; z:-0.214286; nx:0.142857; ny:0; nz:0; tu:0.666667; tv:0.714286; ),
(x:0.5; y:0.333333; z:-0.214286; nx:0.142857; ny:0; nz:0; tu:0.833333; tv:0.714286; ),
(x:0.5; y:0.5; z:-0.214286; nx:0.0714286; ny:0; nz:0; tu:1; tv:0.714286; ),
(x:0.333333; y:0.5; z:-0.214286; nx:0; ny:0.142857; nz:0; tu:0.166667; tv:0.714286; ),
(x:0.166667; y:0.5; z:-0.214286; nx:0; ny:0.142857; nz:0; tu:0.333333; tv:0.714286; ),
(x:-7.07805E-8; y:0.5; z:-0.214286; nx:0; ny:0.142857; nz:0; tu:0.5; tv:0.714286; ),
(x:-0.166667; y:0.5; z:-0.214286; nx:0; ny:0.142857; nz:0; tu:0.666667; tv:0.714286; ),
(x:-0.333333; y:0.5; z:-0.214286; nx:0; ny:0.142857; nz:0; tu:0.833333; tv:0.714286; ),
(x:-0.5; y:0.5; z:-0.214286; nx:0; ny:0.0714285; nz:0; tu:1; tv:0.714286; ),
(x:-0.5; y:0.333333; z:-0.214286; nx:-0.142857; ny:0; nz:0; tu:0.166667; tv:0.714286; ),
(x:-0.5; y:0.166667; z:-0.214286; nx:-0.142857; ny:0; nz:0; tu:0.333333; tv:0.714286; ),
(x:-0.5; y:-6.70552E-8; z:-0.214286; nx:-0.142857; ny:0; nz:0; tu:0.5; tv:0.714286; ),
(x:-0.5; y:-0.166667; z:-0.214286; nx:-0.142857; ny:0; nz:0; tu:0.666667; tv:0.714286; ),
(x:-0.5; y:-0.333333; z:-0.214286; nx:-0.142857; ny:0; nz:0; tu:0.833333; tv:0.714286; ),
(x:-0.5; y:-0.5; z:-0.0714285; nx:0; ny:-0.0714286; nz:0; tu:0; tv:0.571429; ),
(x:-0.333333; y:-0.5; z:-0.0714285; nx:0; ny:-0.142857; nz:0; tu:0.166667; tv:0.571429; ),
(x:-0.166667; y:-0.5; z:-0.0714285; nx:0; ny:-0.142857; nz:0; tu:0.333333; tv:0.571429; ),
(x:-1.11759E-8; y:-0.5; z:-0.0714285; nx:0; ny:-0.142857; nz:0; tu:0.5; tv:0.571429; ),
(x:0.166667; y:-0.5; z:-0.0714285; nx:0; ny:-0.142857; nz:0; tu:0.666667; tv:0.571429; ),
(x:0.333333; y:-0.5; z:-0.0714285; nx:0; ny:-0.142857; nz:0; tu:0.833333; tv:0.571429; ),
(x:0.5; y:-0.5; z:-0.0714285; nx:0; ny:-0.0714286; nz:0; tu:1; tv:0.571429; ),
(x:0.5; y:-0.333333; z:-0.0714285; nx:0.142857; ny:0; nz:0; tu:0.166667; tv:0.571429; ),
(x:0.5; y:-0.166667; z:-0.0714285; nx:0.142857; ny:0; nz:0; tu:0.333333; tv:0.571429; ),
(x:0.5; y:-7.45058E-9; z:-0.0714285; nx:0.142857; ny:0; nz:0; tu:0.5; tv:0.571429; ),
(x:0.5; y:0.166667; z:-0.0714285; nx:0.142857; ny:0; nz:0; tu:0.666667; tv:0.571429; ),
(x:0.5; y:0.333333; z:-0.0714285; nx:0.142857; ny:0; nz:0; tu:0.833333; tv:0.571429; ),
(x:0.5; y:0.5; z:-0.0714285; nx:0.0714286; ny:0; nz:0; tu:1; tv:0.571429; ),
(x:0.333333; y:0.5; z:-0.0714285; nx:0; ny:0.142857; nz:0; tu:0.166667; tv:0.571429; ),
(x:0.166667; y:0.5; z:-0.0714285; nx:0; ny:0.142857; nz:0; tu:0.333333; tv:0.571429; ),
(x:-7.07805E-8; y:0.5; z:-0.0714285; nx:0; ny:0.142857; nz:0; tu:0.5; tv:0.571429; ),
(x:-0.166667; y:0.5; z:-0.0714285; nx:0; ny:0.142857; nz:0; tu:0.666667; tv:0.571429; ),
(x:-0.333333; y:0.5; z:-0.0714285; nx:0; ny:0.142857; nz:0; tu:0.833333; tv:0.571429; ),
(x:-0.5; y:0.5; z:-0.0714285; nx:0; ny:0.0714285; nz:0; tu:1; tv:0.571429; ),
(x:-0.5; y:0.333333; z:-0.0714285; nx:-0.142857; ny:0; nz:0; tu:0.166667; tv:0.571429; ),
(x:-0.5; y:0.166667; z:-0.0714285; nx:-0.142857; ny:0; nz:0; tu:0.333333; tv:0.571429; ),
(x:-0.5; y:-6.70552E-8; z:-0.0714285; nx:-0.142857; ny:0; nz:0; tu:0.5; tv:0.571429; ),
(x:-0.5; y:-0.166667; z:-0.0714285; nx:-0.142857; ny:0; nz:0; tu:0.666667; tv:0.571429; ),
(x:-0.5; y:-0.333333; z:-0.0714285; nx:-0.142857; ny:0; nz:0; tu:0.833333; tv:0.571429; ),
(x:-0.5; y:-0.5; z:0.0714286; nx:0; ny:-0.0714286; nz:0; tu:0; tv:0.428571; ),
(x:-0.333333; y:-0.5; z:0.0714286; nx:0; ny:-0.142857; nz:0; tu:0.166667; tv:0.428571; ),
(x:-0.166667; y:-0.5; z:0.0714286; nx:0; ny:-0.142857; nz:0; tu:0.333333; tv:0.428571; ),
(x:-1.11759E-8; y:-0.5; z:0.0714286; nx:0; ny:-0.142857; nz:0; tu:0.5; tv:0.428571; ),
(x:0.166667; y:-0.5; z:0.0714286; nx:0; ny:-0.142857; nz:0; tu:0.666667; tv:0.428571; ),
(x:0.333333; y:-0.5; z:0.0714286; nx:0; ny:-0.142857; nz:0; tu:0.833333; tv:0.428571; ),
(x:0.5; y:-0.5; z:0.0714286; nx:0; ny:-0.0714285; nz:0; tu:1; tv:0.428571; ),
(x:0.5; y:-0.333333; z:0.0714286; nx:0.142857; ny:0; nz:0; tu:0.166667; tv:0.428571; ),
(x:0.5; y:-0.166667; z:0.0714286; nx:0.142857; ny:0; nz:0; tu:0.333333; tv:0.428571; ),
(x:0.5; y:-7.45058E-9; z:0.0714286; nx:0.142857; ny:0; nz:0; tu:0.5; tv:0.428571; ),
(x:0.5; y:0.166667; z:0.0714286; nx:0.142857; ny:0; nz:0; tu:0.666667; tv:0.428571; ),
(x:0.5; y:0.333333; z:0.0714286; nx:0.142857; ny:0; nz:0; tu:0.833333; tv:0.428571; ),
(x:0.5; y:0.5; z:0.0714286; nx:0.0714285; ny:0; nz:0; tu:1; tv:0.428571; ),
(x:0.333333; y:0.5; z:0.0714286; nx:0; ny:0.142857; nz:0; tu:0.166667; tv:0.428571; ),
(x:0.166667; y:0.5; z:0.0714286; nx:0; ny:0.142857; nz:0; tu:0.333333; tv:0.428571; ),
(x:-7.07805E-8; y:0.5; z:0.0714286; nx:0; ny:0.142857; nz:0; tu:0.5; tv:0.428571; ),
(x:-0.166667; y:0.5; z:0.0714286; nx:0; ny:0.142857; nz:0; tu:0.666667; tv:0.428571; ),
(x:-0.333333; y:0.5; z:0.0714286; nx:0; ny:0.142857; nz:0; tu:0.833333; tv:0.428571; ),
(x:-0.5; y:0.5; z:0.0714286; nx:0; ny:0.0714285; nz:0; tu:1; tv:0.428571; ),
(x:-0.5; y:0.333333; z:0.0714286; nx:-0.142857; ny:0; nz:0; tu:0.166667; tv:0.428571; ),
(x:-0.5; y:0.166667; z:0.0714286; nx:-0.142857; ny:0; nz:0; tu:0.333333; tv:0.428571; ),
(x:-0.5; y:-6.70552E-8; z:0.0714286; nx:-0.142857; ny:0; nz:0; tu:0.5; tv:0.428571; ),
(x:-0.5; y:-0.166667; z:0.0714286; nx:-0.142857; ny:0; nz:0; tu:0.666667; tv:0.428571; ),
(x:-0.5; y:-0.333333; z:0.0714286; nx:-0.142857; ny:0; nz:0; tu:0.833333; tv:0.428571; ),
(x:-0.5; y:-0.5; z:0.214286; nx:0; ny:-0.0714286; nz:0; tu:0; tv:0.285714; ),
(x:-0.333333; y:-0.5; z:0.214286; nx:0; ny:-0.142857; nz:0; tu:0.166667; tv:0.285714; ),
(x:-0.166667; y:-0.5; z:0.214286; nx:0; ny:-0.142857; nz:0; tu:0.333333; tv:0.285714; ),
(x:-1.11759E-8; y:-0.5; z:0.214286; nx:0; ny:-0.142857; nz:0; tu:0.5; tv:0.285714; ),
(x:0.166667; y:-0.5; z:0.214286; nx:0; ny:-0.142857; nz:0; tu:0.666667; tv:0.285714; ),
(x:0.333333; y:-0.5; z:0.214286; nx:0; ny:-0.142857; nz:0; tu:0.833333; tv:0.285714; ),
(x:0.5; y:-0.5; z:0.214286; nx:0; ny:-0.0714286; nz:0; tu:1; tv:0.285714; ),
(x:0.5; y:-0.333333; z:0.214286; nx:0.142857; ny:0; nz:0; tu:0.166667; tv:0.285714; ),
(x:0.5; y:-0.166667; z:0.214286; nx:0.142857; ny:0; nz:0; tu:0.333333; tv:0.285714; ),
(x:0.5; y:-7.45058E-9; z:0.214286; nx:0.142857; ny:0; nz:0; tu:0.5; tv:0.285714; ),
(x:0.5; y:0.166667; z:0.214286; nx:0.142857; ny:0; nz:0; tu:0.666667; tv:0.285714; ),
(x:0.5; y:0.333333; z:0.214286; nx:0.142857; ny:0; nz:0; tu:0.833333; tv:0.285714; ),
(x:0.5; y:0.5; z:0.214286; nx:0.0714286; ny:0; nz:0; tu:1; tv:0.285714; ),
(x:0.333333; y:0.5; z:0.214286; nx:0; ny:0.142857; nz:0; tu:0.166667; tv:0.285714; ),
(x:0.166667; y:0.5; z:0.214286; nx:0; ny:0.142857; nz:0; tu:0.333333; tv:0.285714; ),
(x:-7.07805E-8; y:0.5; z:0.214286; nx:0; ny:0.142857; nz:0; tu:0.5; tv:0.285714; ),
(x:-0.166667; y:0.5; z:0.214286; nx:0; ny:0.142857; nz:0; tu:0.666667; tv:0.285714; ),
(x:-0.333333; y:0.5; z:0.214286; nx:0; ny:0.142857; nz:0; tu:0.833333; tv:0.285714; ),
(x:-0.5; y:0.5; z:0.214286; nx:0; ny:0.0714285; nz:0; tu:1; tv:0.285714; ),
(x:-0.5; y:0.333333; z:0.214286; nx:-0.142857; ny:0; nz:0; tu:0.166667; tv:0.285714; ),
(x:-0.5; y:0.166667; z:0.214286; nx:-0.142857; ny:0; nz:0; tu:0.333333; tv:0.285714; ),
(x:-0.5; y:-6.70552E-8; z:0.214286; nx:-0.142857; ny:0; nz:0; tu:0.5; tv:0.285714; ),
(x:-0.5; y:-0.166667; z:0.214286; nx:-0.142857; ny:0; nz:0; tu:0.666667; tv:0.285714; ),
(x:-0.5; y:-0.333333; z:0.214286; nx:-0.142857; ny:0; nz:0; tu:0.833333; tv:0.285714; ),
(x:-0.5; y:-0.5; z:0.357143; nx:0; ny:-0.0714285; nz:0; tu:0; tv:0.142857; ),
(x:-0.333333; y:-0.5; z:0.357143; nx:0; ny:-0.142857; nz:0; tu:0.166667; tv:0.142857; ),
(x:-0.166667; y:-0.5; z:0.357143; nx:0; ny:-0.142857; nz:0; tu:0.333333; tv:0.142857; ),
(x:-1.11759E-8; y:-0.5; z:0.357143; nx:0; ny:-0.142857; nz:0; tu:0.5; tv:0.142857; ),
(x:0.166667; y:-0.5; z:0.357143; nx:0; ny:-0.142857; nz:0; tu:0.666667; tv:0.142857; ),
(x:0.333333; y:-0.5; z:0.357143; nx:0; ny:-0.142857; nz:0; tu:0.833333; tv:0.142857; ),
(x:0.5; y:-0.5; z:0.357143; nx:0; ny:-0.0714286; nz:0; tu:1; tv:0.142857; ),
(x:0.5; y:-0.333333; z:0.357143; nx:0.142857; ny:0; nz:-2.98023E-8; tu:0.166667; tv:0.142857; ),
(x:0.5; y:-0.166667; z:0.357143; nx:0.142857; ny:0; nz:-2.98023E-8; tu:0.333333; tv:0.142857; ),
(x:0.5; y:-7.45058E-9; z:0.357143; nx:0.142857; ny:0; nz:-2.98023E-8; tu:0.5; tv:0.142857; ),
(x:0.5; y:0.166667; z:0.357143; nx:0.142857; ny:0; nz:-2.98023E-8; tu:0.666667; tv:0.142857; ),
(x:0.5; y:0.333333; z:0.357143; nx:0.142857; ny:0; nz:-2.98023E-8; tu:0.833333; tv:0.142857; ),
(x:0.5; y:0.5; z:0.357143; nx:0.0714286; ny:0; nz:-9.93411E-9; tu:1; tv:0.142857; ),
(x:0.333333; y:0.5; z:0.357143; nx:0; ny:0.142857; nz:-2.98023E-8; tu:0.166667; tv:0.142857; ),
(x:0.166667; y:0.5; z:0.357143; nx:0; ny:0.142857; nz:-2.98023E-8; tu:0.333333; tv:0.142857; ),
(x:-7.07805E-8; y:0.5; z:0.357143; nx:0; ny:0.142857; nz:-2.98023E-8; tu:0.5; tv:0.142857; ),
(x:-0.166667; y:0.5; z:0.357143; nx:0; ny:0.142857; nz:-2.98023E-8; tu:0.666667; tv:0.142857; ),
(x:-0.333333; y:0.5; z:0.357143; nx:0; ny:0.142857; nz:-2.98023E-8; tu:0.833333; tv:0.142857; ),
(x:-0.5; y:0.5; z:0.357143; nx:0; ny:0.0714285; nz:-9.9341E-9; tu:1; tv:0.142857; ),
(x:-0.5; y:0.333333; z:0.357143; nx:-0.142857; ny:0; nz:0; tu:0.166667; tv:0.142857; ),
(x:-0.5; y:0.166667; z:0.357143; nx:-0.142857; ny:0; nz:0; tu:0.333333; tv:0.142857; ),
(x:-0.5; y:-6.70552E-8; z:0.357143; nx:-0.142857; ny:0; nz:0; tu:0.5; tv:0.142857; ),
(x:-0.5; y:-0.166667; z:0.357143; nx:-0.142857; ny:0; nz:0; tu:0.666667; tv:0.142857; ),
(x:-0.5; y:-0.333333; z:0.357143; nx:-0.142857; ny:0; nz:0; tu:0.833333; tv:0.142857; ),
(x:-0.5; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0; tv:1; ),
(x:-0.333333; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.166667; tv:1; ),
(x:-0.5; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0; tv:1; ),
(x:-0.333333; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.166667; tv:1; ),
(x:-0.166667; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.333333; tv:1; ),
(x:-0.333333; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.166667; tv:1; ),
(x:-0.166667; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.333333; tv:1; ),
(x:-0.166667; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.333333; tv:1; ),
(x:0.166667; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.666667; tv:1; ),
(x:0.166667; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.666667; tv:1; ),
(x:0.333333; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.833333; tv:1; ),
(x:0.166667; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.666667; tv:1; ),
(x:0.333333; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.833333; tv:1; ),
(x:0.5; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:1; tv:1; ),
(x:0.333333; y:-0.5; z:-0.5; nx:0; ny:-0.0238095; nz:0; tu:0.833333; tv:1; ),
(x:-0.333333; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.166667; tv:0; ),
(x:-0.333333; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.166667; tv:0; ),
(x:-0.5; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0; tv:0; ),
(x:-0.166667; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.333333; tv:0; ),
(x:-0.166667; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.333333; tv:0; ),
(x:-0.333333; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.166667; tv:0; ),
(x:-1.11759E-8; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.5; tv:0; ),
(x:-1.11759E-8; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.5; tv:0; ),
(x:-0.166667; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.333333; tv:0; ),
(x:0.166667; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.666667; tv:0; ),
(x:0.166667; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.666667; tv:0; ),
(x:-1.11759E-8; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.5; tv:0; ),
(x:0.333333; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.833333; tv:0; ),
(x:0.333333; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.833333; tv:0; ),
(x:0.166667; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.666667; tv:0; ),
(x:0.5; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:1; tv:0; ),
(x:0.5; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:1; tv:0; ),
(x:0.333333; y:-0.5; z:0.5; nx:0; ny:-0.0238095; nz:0; tu:0.833333; tv:0; ),
(x:0.5; y:-0.333333; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.166667; tv:1; ),
(x:0.5; y:-0.5; z:-0.357143; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0; tv:0.857143; ),
(x:0.5; y:-0.333333; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.166667; tv:1; ),
(x:0.5; y:-0.166667; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.333333; tv:1; ),
(x:0.5; y:-0.333333; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.166667; tv:1; ),
(x:0.5; y:-0.166667; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.333333; tv:1; ),
(x:0.5; y:-7.45058E-9; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.5; tv:1; ),
(x:0.5; y:-0.166667; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.333333; tv:1; ),
(x:0.5; y:-7.45058E-9; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.5; tv:1; ),
(x:0.5; y:0.166667; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.666667; tv:1; ),
(x:0.5; y:-7.45058E-9; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.5; tv:1; ),
(x:0.5; y:0.166667; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.666667; tv:1; ),
(x:0.5; y:0.333333; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.833333; tv:1; ),
(x:0.5; y:0.166667; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.666667; tv:1; ),
(x:0.5; y:0.333333; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.833333; tv:1; ),
(x:0.5; y:0.5; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:1; tv:1; ),
(x:0.5; y:0.333333; z:-0.5; nx:0.0238095; ny:0; nz:9.93411E-9; tu:0.833333; tv:1; ),
(x:0.5; y:-0.5; z:-0.357143; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.857143; ),
(x:0.5; y:-0.5; z:-0.214286; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.714286; ),
(x:0.5; y:-0.5; z:-0.357143; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.857143; ),
(x:0.5; y:-0.5; z:-0.214286; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.714286; ),
(x:0.5; y:-0.5; z:-0.0714285; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.571429; ),
(x:0.5; y:-0.5; z:-0.214286; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.714286; ),
(x:0.5; y:-0.5; z:-0.0714285; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.571429; ),
(x:0.5; y:-0.5; z:0.0714286; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.428571; ),
(x:0.5; y:-0.5; z:-0.0714285; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.571429; ),
(x:0.5; y:-0.5; z:0.0714286; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.428571; ),
(x:0.5; y:-0.5; z:0.214286; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.285714; ),
(x:0.5; y:-0.5; z:0.0714286; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.428571; ),
(x:0.5; y:-0.5; z:0.214286; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.285714; ),
(x:0.5; y:-0.5; z:0.357143; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.142857; ),
(x:0.5; y:-0.5; z:0.214286; nx:0.0238095; ny:0; nz:0; tu:0; tv:0.285714; ),
(x:0.5; y:-0.5; z:0.357143; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0; tv:0.142857; ),
(x:0.5; y:-0.333333; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.166667; tv:0; ),
(x:0.5; y:-0.333333; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.166667; tv:0; ),
(x:0.5; y:-0.5; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0; tv:0; ),
(x:0.5; y:-0.5; z:0.357143; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0; tv:0.142857; ),
(x:0.5; y:-0.166667; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.333333; tv:0; ),
(x:0.5; y:-0.166667; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.333333; tv:0; ),
(x:0.5; y:-0.333333; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.166667; tv:0; ),
(x:0.5; y:-7.45058E-9; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.5; tv:0; ),
(x:0.5; y:-7.45058E-9; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.5; tv:0; ),
(x:0.5; y:-0.166667; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.333333; tv:0; ),
(x:0.5; y:0.166667; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.666667; tv:0; ),
(x:0.5; y:0.166667; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.666667; tv:0; ),
(x:0.5; y:-7.45058E-9; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.5; tv:0; ),
(x:0.5; y:0.333333; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.833333; tv:0; ),
(x:0.5; y:0.333333; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.833333; tv:0; ),
(x:0.5; y:0.166667; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.666667; tv:0; ),
(x:0.5; y:0.333333; z:0.5; nx:0.0238095; ny:0; nz:-9.93411E-9; tu:0.833333; tv:0; ),
(x:0.5; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0; tv:1; ),
(x:0.333333; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.166667; tv:1; ),
(x:0.5; y:0.5; z:-0.357143; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0; tv:0.857143; ),
(x:0.5; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0; tv:1; ),
(x:0.333333; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.166667; tv:1; ),
(x:0.166667; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.333333; tv:1; ),
(x:0.333333; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.166667; tv:1; ),
(x:0.166667; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.333333; tv:1; ),
(x:-1.11759E-8; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.5; tv:1; ),
(x:0.166667; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.333333; tv:1; ),
(x:-1.11759E-8; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.5; tv:1; ),
(x:-0.166667; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.666667; tv:1; ),
(x:-1.11759E-8; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.5; tv:1; ),
(x:-0.166667; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.666667; tv:1; ),
(x:-0.333333; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.833333; tv:1; ),
(x:-0.166667; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.666667; tv:1; ),
(x:-0.333333; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:0.833333; tv:1; ),
(x:-0.5; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.93411E-9; tu:1; tv:1; ),
(x:-0.333333; y:0.5; z:-0.5; nx:0; ny:0.0238095; nz:9.9341E-9; tu:0.833333; tv:1; ),
(x:0.5; y:0.5; z:-0.357143; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.857143; ),
(x:0.5; y:0.5; z:-0.214286; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.714286; ),
(x:0.5; y:0.5; z:-0.357143; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.857143; ),
(x:0.5; y:0.5; z:-0.214286; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.714286; ),
(x:0.5; y:0.5; z:-0.0714285; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.571429; ),
(x:0.5; y:0.5; z:-0.214286; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.714286; ),
(x:0.5; y:0.5; z:-0.0714285; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.571429; ),
(x:0.5; y:0.5; z:0.0714286; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.428571; ),
(x:0.5; y:0.5; z:-0.0714285; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.571429; ),
(x:0.5; y:0.5; z:0.0714286; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.428571; ),
(x:0.5; y:0.5; z:0.214286; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.285714; ),
(x:0.5; y:0.5; z:0.0714286; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.428571; ),
(x:0.5; y:0.5; z:0.214286; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.285714; ),
(x:0.5; y:0.5; z:0.357143; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.142857; ),
(x:0.5; y:0.5; z:0.214286; nx:0; ny:0.0238095; nz:0; tu:0; tv:0.285714; ),
(x:0.5; y:0.5; z:0.357143; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0; tv:0.142857; ),
(x:0.333333; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.166667; tv:0; ),
(x:0.333333; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.166667; tv:0; ),
(x:0.5; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0; tv:0; ),
(x:0.5; y:0.5; z:0.357143; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0; tv:0.142857; ),
(x:0.166667; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.333333; tv:0; ),
(x:0.166667; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.333333; tv:0; ),
(x:0.333333; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.166667; tv:0; ),
(x:0.166667; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.333333; tv:0; ),
(x:-0.166667; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.666667; tv:0; ),
(x:-0.166667; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.666667; tv:0; ),
(x:-0.333333; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.833333; tv:0; ),
(x:-0.333333; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.833333; tv:0; ),
(x:-0.166667; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.666667; tv:0; ),
(x:-0.5; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.9341E-9; tu:1; tv:0; ),
(x:-0.5; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:1; tv:0; ),
(x:-0.333333; y:0.5; z:0.5; nx:0; ny:0.0238095; nz:-9.93411E-9; tu:0.833333; tv:0; ),
(x:-0.5; y:0.5; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0; tv:1; ),
(x:-0.5; y:0.333333; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.166667; tv:1; ),
(x:-0.5; y:0.5; z:-0.357143; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.857143; ),
(x:-0.5; y:0.5; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0; tv:1; ),
(x:-0.5; y:0.333333; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.166667; tv:1; ),
(x:-0.5; y:0.166667; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.333333; tv:1; ),
(x:-0.5; y:0.333333; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.166667; tv:1; ),
(x:-0.5; y:0.166667; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.333333; tv:1; ),
(x:-0.5; y:-7.45058E-9; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.5; tv:1; ),
(x:-0.5; y:0.166667; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.333333; tv:1; ),
(x:-0.5; y:-7.45058E-9; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.5; tv:1; ),
(x:-0.5; y:-0.166667; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.666667; tv:1; ),
(x:-0.5; y:-7.45058E-9; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.5; tv:1; ),
(x:-0.5; y:-0.166667; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.666667; tv:1; ),
(x:-0.5; y:-0.333333; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.833333; tv:1; ),
(x:-0.5; y:-0.166667; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.666667; tv:1; ),
(x:-0.5; y:-0.333333; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.833333; tv:1; ),
(x:-0.5; y:-0.5; z:-0.357143; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.857143; ),
(x:-0.5; y:-0.5; z:-0.357143; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.857143; ),
(x:-0.5; y:-0.333333; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:0.833333; tv:1; ),
(x:-0.5; y:0.5; z:-0.357143; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.857143; ),
(x:-0.5; y:0.5; z:-0.214286; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.714286; ),
(x:-0.5; y:0.5; z:-0.357143; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.857143; ),
(x:-0.5; y:-0.5; z:-0.357143; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.857143; ),
(x:-0.5; y:-0.5; z:-0.214286; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.714286; ),
(x:-0.5; y:-0.5; z:-0.214286; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.714286; ),
(x:-0.5; y:0.5; z:-0.214286; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.714286; ),
(x:-0.5; y:0.5; z:-0.0714285; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.571429; ),
(x:-0.5; y:0.5; z:-0.214286; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.714286; ),
(x:-0.5; y:-0.5; z:-0.214286; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.714286; ),
(x:-0.5; y:-0.5; z:-0.0714285; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.571429; ),
(x:-0.5; y:-0.5; z:-0.0714285; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.571429; ),
(x:-0.5; y:0.5; z:-0.0714285; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.571429; ),
(x:-0.5; y:0.5; z:0.0714286; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.428571; ),
(x:-0.5; y:0.5; z:-0.0714285; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.571429; ),
(x:-0.5; y:-0.5; z:-0.0714285; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.571429; ),
(x:-0.5; y:-0.5; z:0.0714286; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.428571; ),
(x:-0.5; y:-0.5; z:0.0714286; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.428571; ),
(x:-0.5; y:0.5; z:0.0714286; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.428571; ),
(x:-0.5; y:0.5; z:0.214286; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.285714; ),
(x:-0.5; y:0.5; z:0.0714286; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.428571; ),
(x:-0.5; y:-0.5; z:0.0714286; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.428571; ),
(x:-0.5; y:-0.5; z:0.214286; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.285714; ),
(x:-0.5; y:-0.5; z:0.214286; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.285714; ),
(x:-0.5; y:0.5; z:0.214286; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.285714; ),
(x:-0.5; y:0.5; z:0.357143; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.142857; ),
(x:-0.5; y:0.5; z:0.214286; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.285714; ),
(x:-0.5; y:-0.5; z:0.214286; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.285714; ),
(x:-0.5; y:-0.5; z:0.357143; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.142857; ),
(x:-0.5; y:-0.5; z:0.357143; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.142857; ),
(x:-0.5; y:0.5; z:0.357143; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.142857; ),
(x:-0.5; y:0.333333; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.166667; tv:0; ),
(x:-0.5; y:0.333333; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.166667; tv:0; ),
(x:-0.5; y:0.5; z:0.357143; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0.142857; ),
(x:-0.5; y:0.166667; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.333333; tv:0; ),
(x:-0.5; y:0.166667; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.333333; tv:0; ),
(x:-0.5; y:0.333333; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.166667; tv:0; ),
(x:-0.5; y:-7.45058E-9; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.5; tv:0; ),
(x:-0.5; y:-7.45058E-9; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.5; tv:0; ),
(x:-0.5; y:0.166667; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.333333; tv:0; ),
(x:-0.5; y:-0.166667; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.666667; tv:0; ),
(x:-0.5; y:-0.166667; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.666667; tv:0; ),
(x:-0.5; y:-7.45058E-9; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.5; tv:0; ),
(x:-0.5; y:-0.333333; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.833333; tv:0; ),
(x:-0.5; y:-0.333333; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.833333; tv:0; ),
(x:-0.5; y:-0.166667; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.666667; tv:0; ),
(x:-0.5; y:-0.5; z:0.357143; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0.142857; ),
(x:-0.5; y:-0.5; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0; ),
(x:-0.5; y:-0.5; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:1; tv:0; ),
(x:-0.5; y:-0.333333; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0.833333; tv:0; ),
(x:-1.11759E-8; y:-0.5; z:-0.5; nx:0; ny:-0.0714286; nz:0; tu:0.5; tv:1; ),
(x:0.5; y:-0.5; z:-0.5; nx:0.047619; ny:0; nz:1.98682E-8; tu:0; tv:1; ),
(x:0.5; y:0.5; z:0.5; nx:0.047619; ny:0; nz:-1.98682E-8; tu:1; tv:0; ),
(x:-1.11759E-8; y:0.5; z:0.5; nx:0; ny:0.0714285; nz:-2.98023E-8; tu:0.5; tv:0; ),
(x:-0.5; y:-0.5; z:-0.5; nx:-0.0238095; ny:0; nz:0; tu:1; tv:1; ),
(x:-0.5; y:0.5; z:0.5; nx:-0.0238095; ny:0; nz:0; tu:0; tv:0; )
);

  CubeIndices: array [0..1439] of Word = (
0,8,7,8,0,1,1,9,8,9,1,2,2,10,9,10,2,3,3,11,10,11,3,4,4,12,11,12,4,5,5,13,12,13,5,6,7,15,14,15,7,8,8,16,
15,16,8,9,9,17,16,17,9,10,10,18,17,18,10,11,11,19,18,19,11,12,12,20,19,20,12,13,14,22,21,22,14,15,15,
23,22,23,15,16,16,24,23,24,16,17,17,25,24,25,17,18,18,26,25,26,18,19,19,27,26,27,19,20,21,29,28,29,21,
22,22,30,29,30,22,23,23,31,30,31,23,24,24,32,31,32,24,25,25,33,32,33,25,26,26,34,33,34,26,27,28,36,35,
36,28,29,29,37,36,37,29,30,30,38,37,38,30,31,31,39,38,39,31,32,32,40,39,40,32,33,33,41,40,41,33,34,35,
43,42,43,35,36,36,44,43,44,36,37,37,45,44,45,37,38,38,46,45,46,38,39,39,47,46,47,39,40,40,48,47,48,40,
41,49,57,50,57,49,56,50,58,51,58,50,57,51,59,52,59,51,58,52,60,53,60,52,59,53,61,54,61,53,60,54,62,55,
62,54,61,56,64,57,64,56,63,57,65,58,65,57,64,58,66,59,66,58,65,59,67,60,67,59,66,60,68,61,68,60,67,61,
69,62,69,61,68,63,71,64,71,63,70,64,72,65,72,64,71,65,73,66,73,65,72,66,74,67,74,66,73,67,75,68,75,67,
74,68,76,69,76,68,75,70,78,71,78,70,77,71,79,72,79,71,78,72,80,73,80,72,79,73,81,74,81,73,80,74,82,75,
82,74,81,75,83,76,83,75,82,77,85,78,85,77,84,78,86,79,86,78,85,79,87,80,87,79,86,80,88,81,88,80,87,81,
89,82,89,81,88,82,90,83,90,82,89,84,92,85,92,84,91,85,93,86,93,85,92,86,94,87,94,86,93,87,95,88,95,87,
94,88,96,89,96,88,95,89,97,90,97,89,96,242,99,243,99,244,98,245,100,246,100,247,99,248,101,446,101,249,
100,446,102,250,102,446,101,251,103,252,103,253,102,254,104,255,104,256,103,98,123,99,123,98,122,99,124,
100,124,99,123,100,125,101,125,100,124,101,126,102,126,101,125,102,127,103,127,102,126,103,128,104,128,
103,127,122,147,123,147,122,146,123,148,124,148,123,147,124,149,125,149,124,148,125,150,126,150,125,149,
126,151,127,151,126,150,127,152,128,152,127,151,146,171,147,171,146,170,147,172,148,172,147,171,148,173,
149,173,148,172,149,174,150,174,149,173,150,175,151,175,150,174,151,176,152,176,151,175,170,195,171,195,
170,194,171,196,172,196,171,195,172,197,173,197,172,196,173,198,174,198,173,197,174,199,175,199,174,198,
175,200,176,200,175,199,194,219,195,219,194,218,195,220,196,220,195,219,196,221,197,221,196,220,197,222,
198,222,197,221,198,223,199,223,198,222,199,224,200,224,199,223,218,257,219,258,218,259,219,260,220,261,
219,262,220,263,221,264,220,265,221,266,222,267,221,268,222,269,223,270,222,271,223,272,224,273,223,274,
447,105,275,105,447,276,277,106,278,106,279,105,280,107,281,107,282,106,283,108,284,108,285,107,286,109,
287,109,288,108,289,110,290,110,291,109,292,129,105,129,294,293,105,130,106,130,105,129,106,131,107,131,
106,130,107,132,108,132,107,131,108,133,109,133,108,132,109,134,110,134,109,133,295,153,129,153,297,296,
129,154,130,154,129,153,130,155,131,155,130,154,131,156,132,156,131,155,132,157,133,157,132,156,133,158,
134,158,133,157,298,177,153,177,300,299,153,178,154,178,153,177,154,179,155,179,154,178,155,180,156,180,
155,179,156,181,157,181,156,180,157,182,158,182,157,181,301,201,177,201,303,302,177,202,178,202,177,201,
178,203,179,203,178,202,179,204,180,204,179,203,180,205,181,205,180,204,181,206,182,206,181,205,304,225,
201,225,306,305,201,226,202,226,201,225,202,227,203,227,202,226,203,228,204,228,203,227,204,229,205,229,
204,228,205,230,206,230,205,229,307,308,225,309,311,310,225,312,226,313,225,314,226,315,227,316,226,317,
227,318,228,319,227,320,228,321,229,322,228,323,229,448,230,448,229,324,325,111,326,111,328,327,329,112,
330,112,331,111,332,113,333,113,334,112,335,114,336,114,337,113,338,115,339,115,340,114,341,116,342,116,
343,115,344,135,111,135,346,345,111,136,112,136,111,135,112,137,113,137,112,136,113,138,114,138,113,137,
114,139,115,139,114,138,115,140,116,140,115,139,347,159,135,159,349,348,135,160,136,160,135,159,136,161,
137,161,136,160,137,162,138,162,137,161,138,163,139,163,138,162,139,164,140,164,139,163,350,183,159,183,
352,351,159,184,160,184,159,183,160,185,161,185,160,184,161,186,162,186,161,185,162,187,163,187,162,186,
163,188,164,188,163,187,353,207,183,207,355,354,183,208,184,208,183,207,184,209,185,209,184,208,185,210,
186,210,185,209,186,211,187,211,186,210,187,212,188,212,187,211,356,231,207,231,358,357,207,232,208,232,
207,231,208,233,209,233,208,232,209,234,210,234,209,233,210,235,211,235,210,234,211,236,212,236,211,235,
359,360,231,361,363,362,231,364,232,365,231,366,232,449,233,449,232,367,233,368,234,369,233,449,234,370,
235,371,234,372,235,373,236,374,235,375,376,117,377,117,379,378,380,118,381,118,382,117,383,119,384,119,
385,118,386,120,387,120,388,119,389,121,390,121,391,120,392,393,450,394,395,121,396,141,117,141,398,397,
117,142,118,142,117,141,118,143,119,143,118,142,119,144,120,144,119,143,120,145,121,145,120,144,121,400,
399,401,121,145,402,165,141,165,404,403,141,166,142,166,141,165,142,167,143,167,142,166,143,168,144,168,
143,167,144,169,145,169,144,168,145,406,405,407,145,169,408,189,165,189,410,409,165,190,166,190,165,189,
166,191,167,191,166,190,167,192,168,192,167,191,168,193,169,193,168,192,169,412,411,413,169,193,414,213,
189,213,416,415,189,214,190,214,189,213,190,215,191,215,190,214,191,216,192,216,191,215,192,217,193,217,
192,216,193,418,417,419,193,217,420,237,213,237,422,421,213,238,214,238,213,237,214,239,215,239,214,238,
215,240,216,240,215,239,216,241,217,241,216,240,217,424,423,425,217,241,426,427,237,428,429,451,237,430,
238,431,237,432,238,433,239,434,238,435,239,436,240,437,239,438,240,439,241,440,240,441,241,443,442,444,
241,445
  );

constructor TdxCube.Create(AOwner: TComponent);
begin
  inherited;
  SetLength(Data.MeshVertices, Length(CubeVertices));
  Move(CubeVertices[0], Data.MeshVertices[0], SizeOf(CubeVertices));
  SetLength(Data.MeshIndices, Length(CubeIndices));
  Move(CubeIndices[0], Data.MeshIndices[0], SizeOf(CubeIndices));
end;

destructor TdxCube.Destroy;
begin
  inherited;
end;

procedure TdxCube.Paint;
begin
//  Canvas.FillCube(dxVector(0, 0, 0), dxVector(Width, Height, Depth), AbsoluteOpacity);
  inherited ;
end;

function TdxCube.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array [0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1,  0,  0);
  p[4] := dxVector(0, -1,  0);
  p[5] := dxVector(0,  0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := - (p[i].V[0]*RayPos.V[0] + p[i].V[1]*RayPos.V[1] + p[i].V[2]*RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
           / (p[i].V[0]*RayDir.V[0] + p[i].V[1]*RayDir.V[1] + p[i].V[2]*RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t*RayDir.V[0], RayPos.V[1] + t*RayDir.V[1], RayPos.V[2] + t*RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
         (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Exit;
      end;
    end;
  end;
  Result := false;
end;

{ TdxCustomMesh }

constructor TdxCustomMesh.Create(AOwner: TComponent);
begin
  inherited;
  FData := TdxMeshData.Create;
  FData.OnChanged := DoMeshChanged;
end;

destructor TdxCustomMesh.Destroy;
begin
  FData.Free;
  inherited;
end;

function TdxCustomMesh.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array [0..5] of TdxVector;
  p1, p2, p3: TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i, j: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1,  0,  0);
  p[4] := dxVector(0, -1,  0);
  p[5] := dxVector(0,  0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := - (p[i].V[0]*RayPos.V[0] + p[i].V[1]*RayPos.V[1] + p[i].V[2]*RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
           / (p[i].V[0]*RayDir.V[0] + p[i].V[1]*RayDir.V[1] + p[i].V[2]*RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t*RayDir.V[0], RayPos.V[1] + t*RayDir.V[1], RayPos.V[2] + t*RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
         (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        { check geomerty }
        if (Length(FData.MeshVertices) > 0) and (Length(FData.MeshIndices) > 0) then
        begin
          for j := 0 to High(FData.MeshIndices) div 3 do
          begin
            if (FData.MeshIndices[(j * 3) + 0] <= High(FData.MeshVertices)) and
               (FData.MeshIndices[(j * 3) + 1] <= High(FData.MeshVertices)) and
               (FData.MeshIndices[(j * 3) + 2] <= High(FData.MeshVertices)) then
            begin
              with FData.MeshVertices[FData.MeshIndices[(j * 3) + 0]] do
                p1 := dxVector(x * Width, y * Height, z * Depth);
              with FData.MeshVertices[FData.MeshIndices[(j * 3) + 1]] do
                p2 := dxVector(x * Width, y * Height, z * Depth);
              with FData.MeshVertices[FData.MeshIndices[(j * 3) + 2]] do
                p3 := dxVector(x * Width, y * Height, z * Depth);
              if RayCastTriangleIntersect(RayPos, RayDir, p1, p2, p3, @ip, nil) then
              begin
                Intersection := dxVector(LocalToAbsolute(dxPoint(ip)));
                Result := true;
                Exit;
              end;
            end;
          end;
        end
        else
          if (csDesigning in ComponentState) {or (FScene.DesignTime) }then
          begin
            Result := true;
          end;
        Exit;
      end;
    end;
  end;
  Result := false;
end;

procedure TdxCustomMesh.Paint;
begin
  Canvas.FillMesh(dxVector(0, 0, 0), dxVector(Width, Height, Depth), FData, AbsoluteOpacity);
end;

procedure TdxCustomMesh.SetData(const Value: TdxMeshData);
begin
  FData.Assign(Value);
end;

procedure TdxCustomMesh.DoMeshChanged(Sender: TObject);
begin
  Repaint;
end;

{ TdxSphere }

const

  SphereVertices: array [0..417] of TdxTexVertexNormal = (
    (x:-1.85254E-8; y:-1.96995E-8; z:0.5; nx:0.00166725; ny:0.00127064; nz:0.018329; tu:0.6; tv:0; ),
    (x:0.448597; y:0.0102398; z:0.223607; nx:0.0819483; ny:0.00187639; nz:0.0409849; tu:0.5; tv:0.352416; ),
    (x:0.128855; y:0.42849; z:0.223607; nx:0.0235389; ny:0.0785173; nz:0.0409849; tu:0.7; tv:0.352416; ),
    (x:-0.36896; y:0.254581; z:0.223607; nx:-0.0674005; ny:0.04665; nz:0.0409849; tu:0.9; tv:0.352416; ),
    (x:-0.356885; y:-0.27115; z:0.223607; nx:-0.0651947; ny:-0.049686; nz:0.0409849; tu:0.1; tv:0.352416; ),
    (x:0.148393; y:-0.422161; z:0.223607; nx:0.0271079; ny:-0.0773577; nz:0.0409849; tu:0.3; tv:0.352416; ),
    (x:0.356885; y:0.27115; z:-0.223607; nx:0.0651947; ny:0.049686; nz:-0.0409849; tu:0.6; tv:0.647584; ),
    (x:-0.148393; y:0.422161; z:-0.223607; nx:-0.0271079; ny:0.0773576; nz:-0.0409849; tu:0.8; tv:0.647584; ),
    (x:-0.448597; y:-0.0102399; z:-0.223607; nx:-0.0819483; ny:-0.00187635; nz:-0.0409849; tu:2.78275E-8; tv:0.647584; ),
    (x:-0.128855; y:-0.42849; z:-0.223607; nx:-0.0235389; ny:-0.0785173; nz:-0.0409849; tu:0.2; tv:0.647584; ),
    (x:0.36896; y:-0.254581; z:-0.223607; nx:0.0674005; ny:-0.04665; nz:-0.0409849; tu:0.4; tv:0.647584; ),
    (x:-1.85254E-8; y:-1.96995E-8; z:-0.5; nx:0.000601969; ny:0.00200795; nz:-0.018329; tu:0.7; tv:1; ),
    (x:0.0920236; y:0.00210054; z:0.491512; nx:0.019231; ny:0.000440332; nz:0.10937; tu:0.5; tv:0.0587361; ),
    (x:0.180923; y:0.00412978; z:0.466335; nx:0.0397825; ny:0.000910898; nz:0.105324; tu:0.5; tv:0.117472; ),
    (x:0.263679; y:0.0060188; z:0.425325; nx:0.0596111; ny:0.00136492; nz:0.0973235; tu:0.5; tv:0.176208; ),
    (x:0.337482; y:0.00770349; z:0.369874; nx:0.0775735; ny:0.0017762; nz:0.0850792; tu:0.5; tv:0.234944; ),
    (x:0.399828; y:0.0091266; z:0.301865; nx:0.092052; ny:0.00210772; nz:0.0686278; tu:0.5; tv:0.29368; ),
    (x:0.0264329; y:0.0878987; z:0.491512; nx:0.00552393; ny:0.0184259; nz:0.10937; tu:0.7; tv:0.0587361; ),
    (x:0.0519683; y:0.172813; z:0.466335; nx:0.0114271; ny:0.0381168; nz:0.105324; tu:0.7; tv:0.117472; ),
    (x:0.0757393; y:0.25186; z:0.425325; nx:0.0171227; ny:0.0571153; nz:0.0973235; tu:0.7; tv:0.176208; ),
    (x:0.0969387; y:0.322355; z:0.369874; nx:0.0222823; ny:0.0743256; nz:0.0850792; tu:0.7; tv:0.234944; ),
    (x:0.114847; y:0.381906; z:0.301865; nx:0.0264411; ny:0.088198; nz:0.0686278; tu:0.7; tv:0.29368; ),
    (x:-0.0756872; y:0.0522238; z:0.491512; nx:-0.00532243; ny:0.00921016; nz:0.0546852; tu:0.9; tv:0.0587361; ),
    (x:-0.148804; y:0.102675; z:0.466335; nx:-0.0212404; ny:0.0188639; nz:0.0693684; tu:0.9; tv:0.117472; ),
    (x:-0.216869; y:0.149639; z:0.425325; nx:-0.0490287; ny:0.0339343; nz:0.0973235; tu:0.9; tv:0.176208; ),
    (x:-0.277571; y:0.191523; z:0.369874; nx:-0.0638023; ny:0.0441596; nz:0.0850791; tu:0.9; tv:0.234944; ),
    (x:-0.328848; y:0.226904; z:0.301865; nx:-0.0757105; ny:0.0524016; nz:0.0686278; tu:0.9; tv:0.29368; ),
    (x:-0.0732102; y:-0.0556227; z:0.491512; nx:-0.0152994; ny:-0.0116599; nz:0.10937; tu:0.1; tv:0.0587361; ),
    (x:-0.143935; y:-0.109357; z:0.466335; nx:-0.0316493; ny:-0.0241205; nz:0.105324; tu:0.1; tv:0.117472; ),
    (x:-0.209772; y:-0.159378; z:0.425325; nx:-0.0474241; ny:-0.0361428; nz:0.0973235; tu:0.1; tv:0.176208; ),
    (x:-0.268487; y:-0.203988; z:0.369874; nx:-0.0617142; ny:-0.0470335; nz:0.0850792; tu:0.1; tv:0.234944; ),
    (x:-0.318086; y:-0.241671; z:0.301865; nx:-0.0732327; ny:-0.055812; nz:0.0686278; tu:0.1; tv:0.29368; ),
    (x:0.0304408; y:-0.0866006; z:0.491512; nx:0.00636149; ny:-0.0181537; nz:0.10937; tu:0.3; tv:0.0587361; ),
    (x:0.059848; y:-0.170261; z:0.466335; nx:0.0131598; ny:-0.0375539; nz:0.105324; tu:0.3; tv:0.117472; ),
    (x:0.0872232; y:-0.24814; z:0.425325; nx:0.019719; ny:-0.0562717; nz:0.0973235; tu:0.3; tv:0.176208; ),
    (x:0.111637; y:-0.317594; z:0.369874; nx:0.0256608; ny:-0.0732279; nz:0.0850792; tu:0.3; tv:0.234944; ),
    (x:0.13226; y:-0.376265; z:0.301865; nx:0.0304502; ny:-0.0868953; nz:0.0686278; tu:0.3; tv:0.29368; ),
    (x:0.42626; y:0.0970253; z:0.245167; nx:0.0998557; ny:0.0221447; nz:0.0573802; tu:0.532083; tv:0.336875; ),
    (x:0.389451; y:0.180517; z:0.258403; nx:0.0965213; ny:0.0444945; nz:0.0641139; tu:0.565623; tv:0.327121; ),
    (x:0.339418; y:0.257879; z:0.262866; nx:0.0855409; ny:0.0651922; nz:0.0664703; tu:0.6; tv:0.323792; ),
    (x:0.277861; y:0.326485; z:0.258403; nx:0.0684956; ny:0.0812679; nz:0.0641139; tu:0.634377; tv:0.327121; ),
    (x:0.20687; y:0.384006; z:0.245167; nx:0.0478301; ny:0.0904092; nz:0.0573802; tu:0.667917; tv:0.336875; ),
    (x:0.0391596; y:0.43413; z:0.245167; nx:0.00979625; ny:0.101811; nz:0.0573803; tu:0.732083; tv:0.336875; ),
    (x:-0.0518658; y:0.42503; z:0.258403; nx:-0.01249; ny:0.105547; nz:0.0641139; tu:0.765623; tv:0.327121; ),
    (x:-0.14113; y:0.401499; z:0.262866; nx:-0.0355679; ny:0.1015; nz:0.0664703; tu:0.8; tv:0.323792; ),
    (x:-0.225603; y:0.364336; z:0.258403; nx:-0.0561241; ny:0.0902564; nz:0.0641139; tu:0.834377; tv:0.327121; ),
    (x:-0.302416; y:0.314803; z:0.245167; nx:-0.071204; ny:0.0734271; nz:0.0573802; tu:0.867917; tv:0.336875; ),
    (x:-0.402059; y:0.171282; z:0.245167; nx:-0.0938013; ny:0.0407782; nz:0.0573803; tu:0.932083; tv:0.336875; ),
    (x:-0.421506; y:0.0821663; z:0.258403; nx:-0.069032; ny:0.0177211; nz:0.0424022; tu:0.965623; tv:0.327121; ),
    (x:-0.426642; y:-0.00973874; z:0.262866; nx:-0.107523; ny:-0.00246197; nz:0.0664703; tu:2.97064E-8; tv:0.323792; ),
    (x:-0.417292; y:-0.101313; z:0.258403; nx:-0.103182; ny:-0.0254865; nz:0.0641139; tu:0.0343767; tv:0.327121; ),
    (x:-0.393773; y:-0.189448; z:0.245167; nx:-0.0918365; ny:-0.0450288; nz:0.0573803; tu:0.0679171; tv:0.336875; ),
    (x:-0.287645; y:-0.328272; z:0.245167; nx:-0.0677686; ny:-0.0766091; nz:0.0573803; tu:0.132083; tv:0.336875; ),
    (x:-0.208639; y:-0.374248; z:0.258403; nx:-0.0519342; ny:-0.0927305; nz:0.0641139; tu:0.165623; tv:0.327121; ),
    (x:-0.122549; y:-0.407518; z:0.262866; nx:-0.030885; ny:-0.103021; nz:0.0664703; tu:0.2; tv:0.323792; ),
    (x:-0.0322976; y:-0.426951; z:0.258403; nx:-0.00764598; ny:-0.106008; nz:0.0641139; tu:0.234377; tv:0.327121; ),
    (x:0.0590502; y:-0.431888; z:0.245167; nx:0.0144459; ny:-0.101256; nz:0.0573802; tu:0.267917; tv:0.336875; ),
    (x:0.224284; y:-0.374165; z:0.245167; nx:0.0519179; ny:-0.0881253; nz:0.0573803; tu:0.332083; tv:0.336875; ),
    (x:0.29256; y:-0.313465; z:0.258403; nx:0.0721434; ny:-0.0780477; nz:0.0641139; tu:0.365623; tv:0.327121; ),
    (x:0.350902; y:-0.242121; z:0.262866; nx:0.0884351; ny:-0.0612087; nz:0.0664703; tu:0.4; tv:0.323792; ),
    (x:0.397331; y:-0.162557; z:0.258403; nx:0.0984567; ny:-0.04003; nz:0.064114; tu:0.434377; tv:0.327121; ),
    (x:0.430268; y:-0.0774739; z:0.245167; nx:0.100765; ny:-0.0175511; nz:0.0573803; tu:0.467917; tv:0.336875; ),
    (x:0.473038; y:0.0647492; z:0.153427; nx:0.106221; ny:0.0142803; nz:0.0356289; tu:0.518073; tv:0.400724; ),
    (x:0.481417; y:0.11706; z:0.0780385; nx:0.109211; ny:0.0265307; nz:0.0183094; tu:0.534432; tv:0.450115; ),
    (x:0.473451; y:0.165397; z:0; nx:0.107714; ny:0.0377456; nz:-4.88944E-9; tu:0.55; tv:0.5; ),
    (x:0.44941; y:0.208117; z:-0.0780385; nx:0.101884; ny:0.047442; nz:-0.0183094; tu:0.565567; tv:0.549885; ),
    (x:0.41011; y:0.243772; z:-0.153427; nx:0.0919009; ny:0.0551464; nz:-0.0356289; tu:0.581927; tv:0.599277; ),
    (x:0.0844059; y:0.468506; z:0.153427; nx:0.0192428; ny:0.105435; nz:0.0356289; tu:0.718073; tv:0.400724; ),
    (x:0.0370907; y:0.492616; z:0.0780385; nx:0.00851603; ny:0.112065; nz:0.0183094; tu:0.734432; tv:0.450115; ),
    (x:-0.011484; y:0.5; z:0; nx:-0.00261266; ny:0.114106; nz:-3.81842E-8; tu:0.75; tv:0.5; ),
    (x:-0.0596686; y:0.490407; z:-0.0780385; nx:-0.0136363; ny:0.111557; nz:-0.0183094; tu:0.765567; tv:0.549885; ),
    (x:-0.105827; y:0.464164; z:-0.153427; nx:-0.0240484; ny:0.104444; nz:-0.0356289; tu:0.781927; tv:0.599277; ),
    (x:-0.420872; y:0.224804; z:0.153427; nx:-0.0943286; ny:0.0508823; nz:0.0356289; tu:0.918073; tv:0.400724; ),
    (x:-0.458494; y:0.187393; z:0.0780385; nx:-0.103948; ny:0.0427291; nz:0.0183094; tu:0.934433; tv:0.450115; ),
    (x:-0.480548; y:0.14362; z:0; nx:-0.109329; ny:0.0327759; nz:-3.35276E-8; tu:0.95; tv:0.5; ),
    (x:-0.486287; y:0.094971; z:-0.0780385; nx:-0.0729746; ny:0.0183136; nz:-0.0124169; tu:0.965567; tv:0.549885; ),
    (x:-0.475515; y:0.0430972; z:-0.153427; nx:-0.0364213; ny:0.00704243; nz:-0.012904; tu:0.981927; tv:0.599277; ),
    (x:-0.344519; y:-0.32957; z:0.153427; nx:-0.0775411; ny:-0.0739884; nz:0.035629; tu:0.118073; tv:0.400724; ),
    (x:-0.320455; y:-0.376801; z:0.0780385; nx:-0.0727595; ny:-0.0856567; nz:0.0183094; tu:0.134433; tv:0.450115; ),
    (x:-0.285511; y:-0.411238; z:0; nx:-0.0649561; ny:-0.0938494; nz:-1.18744E-8; tu:0.15; tv:0.5; ),
    (x:-0.240873; y:-0.431712; z:-0.0780385; nx:-0.0545398; ny:-0.0982671; nz:-0.0183094; tu:0.165568; tv:0.549885; ),
    (x:-0.188057; y:-0.437529; z:-0.153427; nx:-0.0419351; ny:-0.0986324; nz:-0.0356289; tu:0.181927; tv:0.599277; ),
    (x:0.207948; y:-0.428489; z:0.153427; nx:0.0464056; ny:-0.0966097; nz:0.035629; tu:0.318073; tv:0.400724; ),
    (x:0.260442; y:-0.420269; z:0.0780385; nx:0.0589804; ny:-0.0956678; nz:0.0183094; tu:0.334433; tv:0.450115; ),
    (x:0.304093; y:-0.397779; z:0; nx:0.0691836; ny:-0.0907781; nz:-1.7928E-8; tu:0.35; tv:0.5; ),
    (x:0.337419; y:-0.361784; z:-0.0780385; nx:0.0766038; ny:-0.0822367; nz:-0.0183094; tu:0.365568; tv:0.549885; ),
    (x:0.359289; y:-0.313505; z:-0.153427; nx:0.0808463; ny:-0.0703618; nz:-0.035629; tu:0.381927; tv:0.599277; ),
    (x:0.475515; y:-0.0430972; z:0.153427; nx:0.106764; ny:-0.00940356; nz:0.035629; tu:0.481927; tv:0.400724; ),
    (x:0.486287; y:-0.094971; z:0.0780385; nx:0.110311; ny:-0.0215043; nz:0.0183094; tu:0.465568; tv:0.450115; ),
    (x:0.480548; y:-0.14362; z:0; nx:0.109329; ny:-0.0327759; nz:1.16415E-9; tu:0.45; tv:0.5; ),
    (x:0.458494; y:-0.187393; z:-0.0780385; nx:0.103948; ny:-0.042729; nz:-0.0183094; tu:0.434433; tv:0.549885; ),
    (x:0.420872; y:-0.224804; z:-0.153427; nx:0.0943286; ny:-0.0508823; nz:-0.035629; tu:0.418073; tv:0.599277; ),
    (x:0.188057; y:0.437528; z:0.153427; nx:0.0419351; ny:0.0986324; nz:0.0356289; tu:0.681927; tv:0.400724; ),
    (x:0.240873; y:0.431712; z:0.0780385; nx:0.0545398; ny:0.0982671; nz:0.0183094; tu:0.665568; tv:0.450115; ),
    (x:0.285511; y:0.411238; z:0; nx:0.0649562; ny:0.0938494; nz:-3.60888E-8; tu:0.65; tv:0.5; ),
    (x:0.320455; y:0.376801; z:-0.0780385; nx:0.0727595; ny:0.0856566; nz:-0.0183094; tu:0.634433; tv:0.549885; ),
    (x:0.344519; y:0.32957; z:-0.153427; nx:0.0775411; ny:0.0739883; nz:-0.0356289; tu:0.618073; tv:0.599277; ),
    (x:-0.359289; y:0.313505; z:0.153427; nx:-0.0808463; ny:0.0703618; nz:0.0356289; tu:0.881927; tv:0.400724; ),
    (x:-0.337419; y:0.361784; z:0.0780385; nx:-0.0766038; ny:0.0822367; nz:0.0183094; tu:0.865568; tv:0.450115; ),
    (x:-0.304093; y:0.397779; z:0; nx:-0.0691836; ny:0.0907781; nz:4.19095E-9; tu:0.85; tv:0.5; ),
    (x:-0.260441; y:0.420269; z:-0.0780385; nx:-0.0589804; ny:0.0956678; nz:-0.0183094; tu:0.834432; tv:0.549885; ),
    (x:-0.207947; y:0.428489; z:-0.153427; nx:-0.0464056; ny:0.0966096; nz:-0.0356289; tu:0.818073; tv:0.599277; ),
    (x:-0.41011; y:-0.243772; z:0.153427; nx:-0.0919009; ny:-0.0551464; nz:0.035629; tu:0.0819269; tv:0.400724; ),
    (x:-0.44941; y:-0.208117; z:0.0780385; nx:-0.101884; ny:-0.047442; nz:0.0183094; tu:0.0655675; tv:0.450115; ),
    (x:-0.473451; y:-0.165397; z:0; nx:-0.107714; ny:-0.0377455; nz:-1.28057E-8; tu:0.05; tv:0.5; ),
    (x:-0.481417; y:-0.11706; z:-0.0780385; nx:-0.109211; ny:-0.0265307; nz:-0.0183094; tu:0.0344325; tv:0.549885; ),
    (x:-0.473038; y:-0.0647493; z:-0.153427; nx:-0.106221; ny:-0.0142803; nz:-0.0356289; tu:0.0180732; tv:0.599277; ),
    (x:0.105827; y:-0.464164; z:0.153427; nx:0.0240484; ny:-0.104444; nz:0.035629; tu:0.281927; tv:0.400724; ),
    (x:0.0596686; y:-0.490407; z:0.0780385; nx:0.0136363; ny:-0.111557; nz:0.0183094; tu:0.265568; tv:0.450115; ),
    (x:0.0114839; y:-0.5; z:0; nx:0.00261268; ny:-0.114106; nz:3.95812E-9; tu:0.25; tv:0.5; ),
    (x:-0.0370907; y:-0.492616; z:-0.0780385; nx:-0.008516; ny:-0.112065; nz:-0.0183094; tu:0.234432; tv:0.549885; ),
    (x:-0.084406; y:-0.468506; z:-0.153427; nx:-0.0192428; ny:-0.105435; nz:-0.0356289; tu:0.218073; tv:0.599277; ),
    (x:0.287645; y:0.328272; z:-0.245167; nx:0.0677686; ny:0.0766091; nz:-0.0573803; tu:0.632083; tv:0.663125; ),
    (x:0.208639; y:0.374248; z:-0.258403; nx:0.0519342; ny:0.0927305; nz:-0.0641139; tu:0.665623; tv:0.672879; ),
    (x:0.122549; y:0.407518; z:-0.262866; nx:0.030885; ny:0.103021; nz:-0.0664703; tu:0.7; tv:0.676208; ),
    (x:0.0322976; y:0.426951; z:-0.258403; nx:0.007646; ny:0.106008; nz:-0.0641139; tu:0.734377; tv:0.672879; ),
    (x:-0.0590502; y:0.431888; z:-0.245167; nx:-0.0144459; ny:0.101256; nz:-0.0573802; tu:0.767917; tv:0.663125; ),
    (x:-0.224284; y:0.374165; z:-0.245167; nx:-0.0519179; ny:0.0881253; nz:-0.0573802; tu:0.832083; tv:0.663125; ),
    (x:-0.29256; y:0.313464; z:-0.258403; nx:-0.0721435; ny:0.0780477; nz:-0.0641139; tu:0.865623; tv:0.672879; ),
    (x:-0.350902; y:0.242121; z:-0.262866; nx:-0.0884351; ny:0.0612087; nz:-0.0664703; tu:0.9; tv:0.676208; ),
    (x:-0.397331; y:0.162557; z:-0.258403; nx:-0.0984567; ny:0.04003; nz:-0.064114; tu:0.934377; tv:0.672879; ),
    (x:-0.430268; y:0.0774739; z:-0.245167; nx:-0.0517494; ny:0.013056; nz:-0.0280808; tu:0.967917; tv:0.663125; ),
    (x:-0.426261; y:-0.0970254; z:-0.245167; nx:-0.0998557; ny:-0.0221446; nz:-0.0573802; tu:0.032083; tv:0.663125; ),
    (x:-0.389451; y:-0.180517; z:-0.258403; nx:-0.0965213; ny:-0.0444945; nz:-0.0641139; tu:0.0656233; tv:0.672879; ),
    (x:-0.339418; y:-0.257879; z:-0.262866; nx:-0.0855409; ny:-0.0651922; nz:-0.0664703; tu:0.1; tv:0.676208; ),
    (x:-0.277861; y:-0.326485; z:-0.258403; nx:-0.0684956; ny:-0.0812679; nz:-0.064114; tu:0.134377; tv:0.672879; ),
    (x:-0.20687; y:-0.384007; z:-0.245167; nx:-0.04783; ny:-0.0904092; nz:-0.0573803; tu:0.167917; tv:0.663125; ),
    (x:-0.0391596; y:-0.43413; z:-0.245167; nx:-0.00979626; ny:-0.101812; nz:-0.0573802; tu:0.232083; tv:0.663125; ),
    (x:0.0518658; y:-0.42503; z:-0.258403; nx:0.01249; ny:-0.105547; nz:-0.064114; tu:0.265623; tv:0.672879; ),
    (x:0.14113; y:-0.401499; z:-0.262866; nx:0.0355679; ny:-0.1015; nz:-0.0664704; tu:0.3; tv:0.676208; ),
    (x:0.225603; y:-0.364336; z:-0.258403; nx:0.0561241; ny:-0.0902564; nz:-0.064114; tu:0.334377; tv:0.672879; ),
    (x:0.302416; y:-0.314803; z:-0.245167; nx:0.0712041; ny:-0.0734271; nz:-0.0573803; tu:0.367917; tv:0.663125; ),
    (x:0.402059; y:-0.171281; z:-0.245167; nx:0.0938012; ny:-0.0407782; nz:-0.0573803; tu:0.432083; tv:0.663125; ),
    (x:0.421506; y:-0.0821663; z:-0.258403; nx:0.104241; ny:-0.020737; nz:-0.0641139; tu:0.465623; tv:0.672879; ),
    (x:0.426641; y:0.00973874; z:-0.262866; nx:0.107523; ny:0.00246199; nz:-0.0664703; tu:0.5; tv:0.676208; ),
    (x:0.417292; y:0.101313; z:-0.258403; nx:0.103182; ny:0.0254864; nz:-0.064114; tu:0.534377; tv:0.672879; ),
    (x:0.393773; y:0.189448; z:-0.245167; nx:0.0918365; ny:0.0450288; nz:-0.0573803; tu:0.567917; tv:0.663125; ),
    (x:0.0732101; y:0.0556226; z:-0.491512; nx:0.0152994; ny:0.0116599; nz:-0.10937; tu:0.6; tv:0.941264; ),
    (x:0.143935; y:0.109357; z:-0.466335; nx:0.0316493; ny:0.0241205; nz:-0.105324; tu:0.6; tv:0.882528; ),
    (x:0.209772; y:0.159378; z:-0.425325; nx:0.0474241; ny:0.0361428; nz:-0.0973235; tu:0.6; tv:0.823792; ),
    (x:0.268487; y:0.203988; z:-0.369874; nx:0.0617142; ny:0.0470335; nz:-0.0850791; tu:0.6; tv:0.765056; ),
    (x:0.318086; y:0.241671; z:-0.301865; nx:0.0732327; ny:0.055812; nz:-0.0686278; tu:0.6; tv:0.70632; ),
    (x:-0.0304408; y:0.0866005; z:-0.491512; nx:-0.0017286; ny:0.0149471; nz:-0.0724962; tu:0.8; tv:0.941264; ),
    (x:-0.059848; y:0.170261; z:-0.466335; nx:-0.0131598; ny:0.0375539; nz:-0.105324; tu:0.8; tv:0.882528; ),
    (x:-0.0872233; y:0.24814; z:-0.425325; nx:-0.019719; ny:0.0562717; nz:-0.0973235; tu:0.8; tv:0.823792; ),
    (x:-0.111637; y:0.317594; z:-0.369874; nx:-0.0256608; ny:0.0732279; nz:-0.0850792; tu:0.8; tv:0.765056; ),
    (x:-0.13226; y:0.376265; z:-0.301865; nx:-0.0304502; ny:0.0868953; nz:-0.0686277; tu:0.8; tv:0.70632; ),
    (x:-0.0920236; y:-0.0021006; z:-0.491512; nx:-0.019231; ny:-0.000440332; nz:-0.10937; tu:2.78275E-8; tv:0.941264; ),
    (x:-0.180923; y:-0.00412984; z:-0.466335; nx:-0.0397825; ny:-0.000910896; nz:-0.105324; tu:2.78275E-8; tv:0.882528; ),
    (x:-0.263679; y:-0.00601886; z:-0.425325; nx:-0.0596111; ny:-0.00136492; nz:-0.0973235; tu:2.78275E-8; tv:0.823792; ),
    (x:-0.337483; y:-0.00770354; z:-0.369874; nx:-0.0775735; ny:-0.00177621; nz:-0.0850792; tu:2.78275E-8; tv:0.765056; ),
    (x:-0.399828; y:-0.00912666; z:-0.301865; nx:-0.092052; ny:-0.00210769; nz:-0.0686278; tu:2.78275E-8; tv:0.70632; ),
    (x:-0.0264329; y:-0.0878988; z:-0.491512; nx:-0.00552394; ny:-0.0184258; nz:-0.10937; tu:0.2; tv:0.941264; ),
    (x:-0.0519684; y:-0.172813; z:-0.466335; nx:-0.0114272; ny:-0.0381168; nz:-0.105324; tu:0.2; tv:0.882528; ),
    (x:-0.0757394; y:-0.25186; z:-0.425325; nx:-0.0171228; ny:-0.0571153; nz:-0.0973235; tu:0.2; tv:0.823792; ),
    (x:-0.0969387; y:-0.322355; z:-0.369874; nx:-0.0222823; ny:-0.0743256; nz:-0.0850792; tu:0.2; tv:0.765056; ),
    (x:-0.114847; y:-0.381906; z:-0.301865; nx:-0.0264411; ny:-0.088198; nz:-0.0686278; tu:0.2; tv:0.70632; ),
    (x:0.0756871; y:-0.0522239; z:-0.491512; nx:0.015817; ny:-0.0109475; nz:-0.10937; tu:0.4; tv:0.941264; ),
    (x:0.148804; y:-0.102675; z:-0.466335; nx:0.0327201; ny:-0.0226466; nz:-0.105324; tu:0.4; tv:0.882528; ),
    (x:0.21687; y:-0.149639; z:-0.425325; nx:0.0490287; ny:-0.0339343; nz:-0.0973235; tu:0.4; tv:0.823792; ),
    (x:0.277571; y:-0.191523; z:-0.369874; nx:0.0638023; ny:-0.0441595; nz:-0.0850792; tu:0.4; tv:0.765056; ),
    (x:0.328848; y:-0.226904; z:-0.301865; nx:0.0757105; ny:-0.0524016; nz:-0.0686278; tu:0.4; tv:0.70632; ),
    (x:0.119155; y:0.0905298; z:0.477185; nx:0.0271044; ny:0.0206568; nz:0.107947; tu:0.6; tv:0.0965283; ),
    (x:0.209252; y:0.0932529; z:0.444764; nx:0.048824; ny:0.0220149; nz:0.103389; tu:0.563262; tv:0.151034; ),
    (x:0.145679; y:0.176411; z:0.444764; nx:0.0341732; ny:0.0412387; nz:0.103389; tu:0.636738; tv:0.151034; ),
    (x:0.293024; y:0.0956622; z:0.394416; nx:0.0698896; ny:0.0232108; nz:0.0937349; tu:0.546724; tv:0.210686; ),
    (x:0.236494; y:0.17968; z:0.402711; nx:0.057721; ny:0.0439902; nz:0.0976817; tu:0.6; tv:0.201939; ),
    (x:0.170222; y:0.256297; z:0.394416; nx:0.0409121; ny:0.0612331; nz:0.0937349; tu:0.653276; tv:0.210686; ),
    (x:0.366629; y:0.0971706; z:0.327176; nx:0.0883797; ny:0.023892; nz:0.0785523; tu:0.537712; tv:0.272942; ),
    (x:0.319524; y:0.181529; z:0.340075; nx:0.0801126; ny:0.0458088; nz:0.084823; tu:0.578795; tv:0.261914; ),
    (x:0.260298; y:0.259001; z:0.340075; nx:0.0654119; ny:0.065098; nz:0.084823; tu:0.621205; tv:0.261914; ),
    (x:0.191199; y:0.326649; z:0.327176; nx:0.0464718; ny:0.0788808; nz:0.0785523; tu:0.662288; tv:0.272942; ),
    (x:-0.0495446; y:0.140949; z:0.477185; nx:-0.01127; ny:0.0321611; nz:0.107947; tu:0.8; tv:0.0965283; ),
    (x:-0.024301; y:0.227213; z:0.444764; nx:-0.00584995; ny:0.0532374; nz:0.103389; tu:0.763262; tv:0.151034; ),
    (x:-0.123279; y:0.192636; z:0.444764; nx:-0.0286603; ny:0.0452441; nz:0.103389; tu:0.836738; tv:0.151034; ),
    (x:-0.000712475; y:0.307384; z:0.394416; nx:-0.000477729; ny:0.0736415; nz:0.0937349; tu:0.746724; tv:0.210686; ),
    (x:-0.0983343; y:0.27975; z:0.402711; nx:-0.0240004; ny:0.0684896; nz:0.0976818; tu:0.8; tv:0.201939; ),
    (x:-0.191905; y:0.240592; z:0.394416; nx:-0.0455936; ny:0.0578318; nz:0.0937349; tu:0.853276; tv:0.210686; ),
    (x:0.020594; y:0.377637; z:0.327176; nx:0.00458822; ny:0.0914371; nz:0.0785523; tu:0.737712; tv:0.272942; ),
    (x:-0.0744399; y:0.359043; z:0.340075; nx:-0.0188106; ny:0.0903473; nz:0.084823; tu:0.778795; tv:0.261914; ),
    (x:-0.16665; y:0.32683; z:0.340075; nx:-0.0416985; ny:0.0823269; nz:0.084823; tu:0.821205; tv:0.261914; ),
    (x:-0.252539; y:0.28222; z:0.327176; nx:-0.0606595; ny:0.0685728; nz:0.0785523; tu:0.862288; tv:0.272942; ),
    (x:-0.149775; y:-0.00341887; z:0.477185; nx:-0.0340697; ny:-0.000780096; nz:0.107947; tu:3.6059E-8; tv:0.0965283; ),
    (x:-0.22427; y:0.0471723; z:0.444764; nx:-0.0172428; ny:0.00763228; nz:0.0336792; tu:0.963262; tv:0.151034; ),
    (x:-0.22187; y:-0.0573561; z:0.444764; nx:-0.0518862; ny:-0.0132764; nz:0.103389; tu:0.0367379; tv:0.151034; ),
    (x:-0.293464; y:0.0943112; z:0.394416; nx:-0.0458265; ny:0.0187192; nz:0.0612099; tu:0.946724; tv:0.210686; ),
    (x:-0.297268; y:-0.00678559; z:0.402711; nx:-0.072554; ny:-0.00166128; nz:0.0976818; tu:2.51152E-8; tv:0.201939; ),
    (x:-0.288826; y:-0.107603; z:0.394416; nx:-0.0690905; ny:-0.0254911; nz:0.0937349; tu:0.0532758; tv:0.210686; ),
    (x:-0.353901; y:0.136222; z:0.327176; nx:-0.0855441; ny:0.0326193; nz:0.0785523; tu:0.937712; tv:0.272942; ),
    (x:-0.36553; y:0.0403722; z:0.340075; nx:-0.030204; ny:0.00737937; nz:0.0276798; tu:0.978795; tv:0.261914; ),
    (x:-0.363294; y:-0.0570088; z:0.340075; nx:-0.091183; ny:-0.0142173; nz:0.084823; tu:0.0212048; tv:0.261914; ),
    (x:-0.347276; y:-0.152227; z:0.327176; nx:-0.0839614; ny:-0.0365005; nz:0.0785523; tu:0.0622876; tv:0.272942; ),
    (x:-0.0430215; y:-0.143062; z:0.477185; nx:-0.00978619; ny:-0.0326433; nz:0.107947; tu:0.2; tv:0.0965284; ),
    (x:-0.114306; y:-0.198059; z:0.444764; nx:-0.0265594; ny:-0.0465084; nz:0.103389; tu:0.163262; tv:0.151034; ),
    (x:-0.0138438; y:-0.228084; z:0.444764; nx:-0.00340713; ny:-0.0534493; nz:0.103389; tu:0.236738; tv:0.151034; ),
    (x:-0.180658; y:-0.249096; z:0.394416; nx:-0.0428989; ny:-0.059858; nz:0.0937349; tu:0.146724; tv:0.210686; ),
    (x:-0.0853874; y:-0.283943; z:0.402711; nx:-0.0208404; ny:-0.0695163; nz:0.0976818; tu:0.2; tv:0.201939; ),
    (x:0.0134008; y:-0.307094; z:0.394416; nx:0.00289336; ny:-0.0735861; nz:0.0937349; tu:0.253276; tv:0.210686; ),
    (x:-0.239317; y:-0.293447; z:0.327176; nx:-0.0574574; ny:-0.0712773; nz:0.0785523; tu:0.137712; tv:0.272942; ),
    (x:-0.15147; y:-0.334092; z:0.340075; nx:-0.0378867; ny:-0.0841491; nz:0.084823; tu:0.178795; tv:0.261914; ),
    (x:-0.0578776; y:-0.362064; z:0.340075; nx:-0.0146557; ny:-0.0911136; nz:0.084823; tu:0.221205; tv:0.261914; ),
    (x:0.0379104; y:-0.376301; z:0.327176; nx:0.00876852; ny:-0.0911313; nz:0.0785523; tu:0.262288; tv:0.272942; ),
    (x:0.123186; y:-0.0849981; z:0.477185; nx:0.0280215; ny:-0.0193945; nz:0.107947; tu:0.4; tv:0.0965283; ),
    (x:0.153625; y:-0.169579; z:0.444764; nx:0.0360248; ny:-0.0396314; nz:0.103389; tu:0.363262; tv:0.151034; ),
    (x:0.213314; y:-0.0836073; z:0.444764; nx:0.0497805; ny:-0.0197571; nz:0.103389; tu:0.436738; tv:0.151034; ),
    (x:0.181811; y:-0.248261; z:0.394416; nx:0.0436718; ny:-0.0592964; nz:0.0937349; tu:0.346724; tv:0.210686; ),
    (x:0.244496; y:-0.168701; z:0.402711; nx:0.0596739; ny:-0.0413022; nz:0.0976817; tu:0.4; tv:0.201939; ),
    (x:0.297109; y:-0.0821917; z:0.394416; nx:0.0708787; ny:-0.0199876; nz:0.0937349; tu:0.453276; tv:0.210686; ),
    (x:0.205995; y:-0.317582; z:0.327176; nx:0.0500334; ny:-0.0766711; nz:0.0785523; tu:0.337712; tv:0.272942; ),
    (x:0.271916; y:-0.246852; z:0.340075; nx:0.0683229; ny:-0.0620359; nz:0.084823; tu:0.378795; tv:0.261914; ),
    (x:0.327523; y:-0.166759; z:0.340075; nx:0.0821253; ny:-0.042094; nz:0.084823; tu:0.421205; tv:0.261914; ),
    (x:0.370706; y:-0.0803399; z:0.327176; nx:0.0893806; ny:-0.0198218; nz:0.0785523; tu:0.462288; tv:0.272942; ),
    (x:0.495109; y:0.0113016; z:0.0798541; nx:0.111762; ny:0.00255904; nz:0.0177945; tu:0.5; tv:0.448945; ),
    (x:0.5; y:-0.0408784; z:0; nx:0.116054; ny:-0.00943103; nz:-0.000431142; tu:0.483333; tv:0.5; ),
    (x:0.497599; y:0.06365; z:0; nx:0.115501; ny:0.014733; nz:-0.000431136; tu:0.516667; tv:0.5; ),
    (x:0.486391; y:-0.0899074; z:-0.0832165; nx:0.115507; ny:-0.0212643; nz:-0.0203826; tu:0.467178; tv:0.553225; ),
    (x:0.494252; y:0.011282; z:-0.0849665; nx:0.119793; ny:0.00274294; nz:-0.0212267; tu:0.5; tv:0.554355; ),
    (x:0.481754; y:0.112007; z:-0.0832165; nx:0.114413; ny:0.0265289; nz:-0.0203826; tu:0.532822; tv:0.553225; ),
    (x:0.453641; y:-0.133945; z:-0.166292; nx:0.108935; ny:-0.0320837; nz:-0.0406954; tu:0.450528; tv:0.60792; ),
    (x:0.469202; y:-0.0380058; z:-0.172848; nx:0.117028; ny:-0.00944979; nz:-0.0438923; tu:0.483453; tv:0.612357; ),
    (x:0.466965; y:0.0593752; z:-0.172848; nx:0.116473; ny:0.0147963; nz:-0.0438923; tu:0.516547; tv:0.612357; ),
    (x:0.447016; y:0.154504; z:-0.166292; nx:0.107352; ny:0.037036; nz:-0.0406953; tu:0.549472; tv:0.60792; ),
    (x:0.142215; y:0.472917; z:0.0798541; nx:0.0321025; ny:0.107083; nz:0.0177945; tu:0.7; tv:0.448945; ),
    (x:0.193506; y:0.461429; z:0; nx:0.0448322; ny:0.10746; nz:-0.000431128; tu:0.683333; tv:0.5; ),
    (x:0.0930445; y:0.491454; z:0; nx:0.0216799; ny:0.114401; nz:-0.00043113; tu:0.716667; tv:0.5; ),
    (x:0.236075; y:0.433376; z:-0.0832165; nx:0.0559173; ny:0.103283; nz:-0.0203826; tu:0.667178; tv:0.553225; ),
    (x:0.141969; y:0.472098; z:-0.0849665; nx:0.0344095; ny:0.114778; nz:-0.0212267; tu:0.7; tv:0.554355; ),
    (x:0.0420157; y:0.491373; z:-0.0832165; nx:0.0101251; ny:0.117011; nz:-0.0203826; tu:0.732822; tv:0.553225; ),
    (x:0.267966; y:0.388716; z:-0.166292; nx:0.0641761; ny:0.0936887; nz:-0.0406953; tu:0.650528; tv:0.60792; ),
    (x:0.181249; y:0.433117; z:-0.172848; nx:0.045151; ny:0.10838; nz:-0.0438923; tu:0.683453; tv:0.612357; ),
    (x:0.0876564; y:0.461088; z:-0.172848; nx:0.02192; ny:0.115345; nz:-0.0438923; tu:0.716547; tv:0.612357; ),
    (x:-0.00926116; y:0.47157; z:-0.166292; nx:-0.00204974; ny:0.113543; nz:-0.0406954; tu:0.749472; tv:0.60792; ),
    (x:-0.407215; y:0.280977; z:0.0798541; nx:-0.0919213; ny:0.0636217; nz:0.0177945; tu:0.9; tv:0.448945; ),
    (x:-0.380406; y:0.326057; z:0; nx:-0.0883465; ny:0.0758449; nz:-0.00043113; tu:0.883333; tv:0.5; ),
    (x:-0.440095; y:0.240085; z:0; nx:-0.102102; ny:0.0559706; nz:-0.000431154; tu:0.916667; tv:0.5; ),
    (x:-0.340489; y:0.357748; z:-0.0832165; nx:-0.0809484; ny:0.0850966; nz:-0.0203827; tu:0.867178; tv:0.553225; ),
    (x:-0.406511; y:0.280491; z:-0.0849665; nx:-0.0985271; ny:0.0681937; nz:-0.0212268; tu:0.9; tv:0.554355; ),
    (x:-0.455786; y:0.191679; z:-0.0832165; nx:-0.108155; ny:0.0457879; nz:-0.0203826; tu:0.932822; tv:0.553225; ),
    (x:-0.288029; y:0.374185; z:-0.166292; nx:-0.0692718; ny:0.0899865; nz:-0.0406954; tu:0.850528; tv:0.60792; ),
    (x:-0.357184; y:0.305687; z:-0.172848; nx:-0.0891233; ny:0.0764325; nz:-0.0438923; tu:0.883453; tv:0.612357; ),
    (x:-0.412791; y:0.225593; z:-0.172848; nx:-0.102926; ny:0.0564906; nz:-0.0438923; tu:0.916547; tv:0.612357; ),
    (x:-0.45274; y:0.136942; z:-0.166292; nx:-0.108619; ny:0.0331372; nz:-0.0406953; tu:0.949472; tv:0.60792; ),
    (x:-0.393888; y:-0.299263; z:0.0798541; nx:-0.088913; ny:-0.0677622; nz:0.0177945; tu:0.1; tv:0.448945; ),
    (x:-0.428611; y:-0.259915; z:0; nx:-0.0994333; ny:-0.0605851; nz:-0.000431158; tu:0.0833334; tv:0.5; ),
    (x:-0.365038; y:-0.343073; z:0; nx:-0.0847824; ny:-0.079809; nz:-0.000431159; tu:0.116667; tv:0.5; ),
    (x:-0.446509; y:-0.212275; z:-0.0832165; nx:-0.105946; ny:-0.0506902; nz:-0.0203826; tu:0.0671777; tv:0.553225; ),
    (x:-0.393207; y:-0.298745; z:-0.0849665; nx:-0.0953027; ny:-0.0726318; nz:-0.0212267; tu:0.1; tv:0.554355; ),
    (x:-0.323707; y:-0.37291; z:-0.0832165; nx:-0.0769687; ny:-0.0887125; nz:-0.0203826; tu:0.132822; tv:0.553225; ),
    (x:-0.445978; y:-0.157457; z:-0.166292; nx:-0.106988; ny:-0.038074; nz:-0.0406953; tu:0.050528; tv:0.60792; ),
    (x:-0.402001; y:-0.244192; z:-0.172848; nx:-0.100232; ny:-0.0611423; nz:-0.0438923; tu:0.0834532; tv:0.612357; ),
    (x:-0.342775; y:-0.321664; z:-0.172848; nx:-0.0855316; ny:-0.0804315; nz:-0.0438923; tu:0.116547; tv:0.612357; ),
    (x:-0.270547; y:-0.386935; z:-0.166292; nx:-0.0650805; ny:-0.0930628; nz:-0.0406953; tu:0.149472; tv:0.60792; ),
    (x:0.163779; y:-0.465932; z:0.0798541; nx:0.03697; ny:-0.105501; nz:0.0177945; tu:0.3; tv:0.448945; ),
    (x:0.115511; y:-0.486694; z:0; nx:0.0268933; ny:-0.113289; nz:-0.00043114; tu:0.283333; tv:0.5; ),
    (x:0.214489; y:-0.452116; z:0; nx:0.0497037; ny:-0.105295; nz:-0.000431154; tu:0.316667; tv:0.5; ),
    (x:0.0645315; y:-0.488941; z:-0.0832165; nx:0.0154701; ny:-0.116425; nz:-0.0203826; tu:0.267178; tv:0.553225; ),
    (x:0.163495; y:-0.465126; z:-0.0849665; nx:0.0396269; ny:-0.113083; nz:-0.0212267; tu:0.3; tv:0.554355; ),
    (x:0.255724; y:-0.42215; z:-0.0832165; nx:0.060586; ny:-0.100615; nz:-0.0203827; tu:0.332822; tv:0.553225; ),
    (x:0.0123991; y:-0.471499; z:-0.166292; nx:0.00314926; ny:-0.113518; nz:-0.0406954; tu:0.250528; tv:0.60792; ),
    (x:0.108734; y:-0.456606; z:-0.172848; nx:0.0271764; ny:-0.114221; nz:-0.0438923; tu:0.283453; tv:0.612357; ),
    (x:0.200944; y:-0.424393; z:-0.172848; nx:0.0500643; ny:-0.1062; nz:-0.0438923; tu:0.316547; tv:0.612357; ),
    (x:0.285532; y:-0.376081; z:-0.166292; nx:0.0683971; ny:-0.0906532; nz:-0.0406954; tu:0.349472; tv:0.60792; ),
    (x:0.393888; y:0.299263; z:-0.0798541; nx:0.088913; ny:0.0677622; nz:-0.0177945; tu:0.6; tv:0.551055; ),
    (x:0.365038; y:0.343073; z:0; nx:0.0847825; ny:0.079809; nz:0.000431112; tu:0.616667; tv:0.5; ),
    (x:0.428611; y:0.259915; z:0; nx:0.0994333; ny:0.0605852; nz:0.000431114; tu:0.583333; tv:0.5; ),
    (x:0.323707; y:0.372909; z:0.0832165; nx:0.0769687; ny:0.0887124; nz:0.0203826; tu:0.632822; tv:0.446775; ),
    (x:0.393207; y:0.298745; z:0.0849665; nx:0.0953027; ny:0.0726319; nz:0.0212267; tu:0.6; tv:0.445645; ),
    (x:0.446509; y:0.212275; z:0.0832165; nx:0.105946; ny:0.0506902; nz:0.0203827; tu:0.567178; tv:0.446775; ),
    (x:0.270547; y:0.386935; z:0.166292; nx:0.0650805; ny:0.0930628; nz:0.0406954; tu:0.649472; tv:0.39208; ),
    (x:0.342775; y:0.321664; z:0.172848; nx:0.0855315; ny:0.0804315; nz:0.0438923; tu:0.616547; tv:0.387643; ),
    (x:0.402001; y:0.244192; z:0.172848; nx:0.100232; ny:0.0611424; nz:0.0438923; tu:0.583453; tv:0.387643; ),
    (x:0.445978; y:0.157457; z:0.166292; nx:0.106988; ny:0.038074; nz:0.0406954; tu:0.550528; tv:0.39208; ),
    (x:-0.163779; y:0.465932; z:-0.0798541; nx:-0.0369701; ny:0.105501; nz:-0.0177945; tu:0.8; tv:0.551055; ),
    (x:-0.214489; y:0.452116; z:0; nx:-0.0497037; ny:0.105295; nz:0.000431136; tu:0.816667; tv:0.5; ),
    (x:-0.115511; y:0.486694; z:0; nx:-0.0268933; ny:0.113289; nz:0.000431118; tu:0.783333; tv:0.5; ),
    (x:-0.255724; y:0.42215; z:0.0832165; nx:-0.0605859; ny:0.100615; nz:0.0203827; tu:0.832822; tv:0.446775; ),
    (x:-0.163495; y:0.465126; z:0.0849665; nx:-0.0396269; ny:0.113083; nz:0.0212268; tu:0.8; tv:0.445645; ),
    (x:-0.0645315; y:0.488941; z:0.0832165; nx:-0.0154701; ny:0.116425; nz:0.0203827; tu:0.767178; tv:0.446775; ),
    (x:-0.285532; y:0.376081; z:0.166292; nx:-0.068397; ny:0.0906532; nz:0.0406953; tu:0.849472; tv:0.39208; ),
    (x:-0.200944; y:0.424393; z:0.172848; nx:-0.0500642; ny:0.1062; nz:0.0438923; tu:0.816547; tv:0.387643; ),
    (x:-0.108734; y:0.456606; z:0.172848; nx:-0.0271764; ny:0.114221; nz:0.0438923; tu:0.783453; tv:0.387643; ),
    (x:-0.0123991; y:0.471498; z:0.166292; nx:-0.00314928; ny:0.113518; nz:0.0406954; tu:0.750528; tv:0.39208; ),
    (x:-0.495109; y:-0.0113016; z:-0.0798541; nx:-0.111762; ny:-0.002559; nz:-0.0177945; tu:2.84546E-8; tv:0.551055; ),
    (x:-0.497599; y:-0.0636501; z:0; nx:-0.115501; ny:-0.014733; nz:0.000431123; tu:0.0166667; tv:0.5; ),
    (x:-0.5; y:0.0408784; z:0; nx:-0.0781259; ny:0.0022724; nz:0.000230822; tu:-0.0166667; tv:0.5; ),
    (x:-0.481754; y:-0.112007; z:0.0832165; nx:-0.114413; ny:-0.0265289; nz:0.0203826; tu:0.0328224; tv:0.446775; ),
    (x:-0.494252; y:-0.0112821; z:0.0849665; nx:-0.119793; ny:-0.00274291; nz:0.0212267; tu:2.80797E-8; tv:0.445645; ),
    (x:-0.486391; y:0.0899074; z:0.0832165; nx:-0.0400294; ny:0.00322411; nz:0.00716211; tu:-0.0328224; tv:0.446775; ),
    (x:-0.447016; y:-0.154504; z:0.166292; nx:-0.107352; ny:-0.037036; nz:0.0406954; tu:0.0494721; tv:0.39208; ),
    (x:-0.466965; y:-0.0593752; z:0.172848; nx:-0.116473; ny:-0.0147963; nz:0.0438923; tu:0.0165468; tv:0.387643; ),
    (x:-0.469202; y:0.0380058; z:0.172848; nx:-0.0786673; ny:0.00225723; nz:0.029414; tu:-0.0165468; tv:0.387643; ),
    (x:-0.453641; y:0.133945; z:0.166292; nx:-0.108935; ny:0.0320837; nz:0.0406954; tu:0.950528; tv:0.39208; ),
    (x:-0.142216; y:-0.472917; z:-0.0798541; nx:-0.0321025; ny:-0.107083; nz:-0.0177945; tu:0.2; tv:0.551055; ),
    (x:-0.0930446; y:-0.491454; z:0; nx:-0.0216799; ny:-0.114401; nz:0.00043112; tu:0.216667; tv:0.5; ),
    (x:-0.193507; y:-0.461429; z:0; nx:-0.0448322; ny:-0.10746; nz:0.000431111; tu:0.183333; tv:0.5; ),
    (x:-0.0420158; y:-0.491374; z:0.0832165; nx:-0.010125; ny:-0.117011; nz:0.0203826; tu:0.232822; tv:0.446775; ),
    (x:-0.141969; y:-0.472098; z:0.0849665; nx:-0.0344095; ny:-0.114778; nz:0.0212267; tu:0.2; tv:0.445645; ),
    (x:-0.236075; y:-0.433376; z:0.0832165; nx:-0.0559173; ny:-0.103283; nz:0.0203826; tu:0.167178; tv:0.446775; ),
    (x:0.00926115; y:-0.47157; z:0.166292; nx:0.00204974; ny:-0.113543; nz:0.0406954; tu:0.249472; tv:0.39208; ),
    (x:-0.0876564; y:-0.461089; z:0.172848; nx:-0.02192; ny:-0.115345; nz:0.0438923; tu:0.216547; tv:0.387643; ),
    (x:-0.181249; y:-0.433117; z:0.172848; nx:-0.045151; ny:-0.10838; nz:0.0438923; tu:0.183453; tv:0.387643; ),
    (x:-0.267966; y:-0.388716; z:0.166292; nx:-0.0641761; ny:-0.0936887; nz:0.0406954; tu:0.150528; tv:0.39208; ),
    (x:0.407215; y:-0.280977; z:-0.0798541; nx:0.0919213; ny:-0.0636216; nz:-0.0177945; tu:0.4; tv:0.551055; ),
    (x:0.440095; y:-0.240085; z:0; nx:0.102102; ny:-0.0559706; nz:0.000431152; tu:0.416667; tv:0.5; ),
    (x:0.380406; y:-0.326057; z:0; nx:0.0883465; ny:-0.0758449; nz:0.000431149; tu:0.383333; tv:0.5; ),
    (x:0.455787; y:-0.191679; z:0.0832165; nx:0.108155; ny:-0.0457879; nz:0.0203827; tu:0.432822; tv:0.446775; ),
    (x:0.406511; y:-0.280491; z:0.0849665; nx:0.0985272; ny:-0.0681937; nz:0.0212267; tu:0.4; tv:0.445645; ),
    (x:0.340489; y:-0.357748; z:0.0832165; nx:0.0809484; ny:-0.0850966; nz:0.0203826; tu:0.367178; tv:0.446775; ),
    (x:0.45274; y:-0.136942; z:0.166292; nx:0.108619; ny:-0.0331372; nz:0.0406954; tu:0.449472; tv:0.39208; ),
    (x:0.412791; y:-0.225593; z:0.172848; nx:0.102926; ny:-0.0564906; nz:0.0438923; tu:0.416547; tv:0.387643; ),
    (x:0.357184; y:-0.305687; z:0.172848; nx:0.0891233; ny:-0.0764324; nz:0.0438923; tu:0.383453; tv:0.387643; ),
    (x:0.288029; y:-0.374185; z:0.166292; nx:0.0692717; ny:-0.0899865; nz:0.0406954; tu:0.350528; tv:0.39208; ),
    (x:0.0430214; y:0.143062; z:-0.477185; nx:0.0097862; ny:0.0326433; nz:-0.107947; tu:0.7; tv:0.903472; ),
    (x:0.0138438; y:0.228084; z:-0.444764; nx:0.00340714; ny:0.0534493; nz:-0.103389; tu:0.736738; tv:0.848966; ),
    (x:0.114306; y:0.198059; z:-0.444764; nx:0.0265594; ny:0.0465084; nz:-0.103389; tu:0.663262; tv:0.848966; ),
    (x:-0.0134008; y:0.307094; z:-0.394416; nx:-0.00289334; ny:0.0735861; nz:-0.0937349; tu:0.753276; tv:0.789314; ),
    (x:0.0853874; y:0.283943; z:-0.402711; nx:0.0208405; ny:0.0695163; nz:-0.0976817; tu:0.7; tv:0.798061; ),
    (x:0.180658; y:0.249096; z:-0.394416; nx:0.0428989; ny:0.059858; nz:-0.0937349; tu:0.646724; tv:0.789314; ),
    (x:-0.0379104; y:0.376301; z:-0.327176; nx:-0.00876849; ny:0.0911313; nz:-0.0785523; tu:0.762288; tv:0.727058; ),
    (x:0.0578776; y:0.362064; z:-0.340075; nx:0.0146557; ny:0.0911136; nz:-0.084823; tu:0.721205; tv:0.738086; ),
    (x:0.15147; y:0.334092; z:-0.340075; nx:0.0378867; ny:0.0841491; nz:-0.084823; tu:0.678795; tv:0.738086; ),
    (x:0.239317; y:0.293447; z:-0.327176; nx:0.0574574; ny:0.0712773; nz:-0.0785523; tu:0.637712; tv:0.727058; ),
    (x:-0.123186; y:0.084998; z:-0.477185; nx:-0.0145766; ny:0.00517013; nz:-0.0545011; tu:-0.1; tv:0.903472; ),
    (x:-0.213314; y:0.0836073; z:-0.444764; nx:-0.0251785; ny:0.00515283; nz:-0.0518241; tu:-0.0632621; tv:0.848966; ),
    (x:-0.153626; y:0.169579; z:-0.444764; nx:-0.0360249; ny:0.0396314; nz:-0.103389; tu:0.863262; tv:0.848966; ),
    (x:-0.297109; y:0.0821916; z:-0.394416; nx:-0.0353183; ny:0.00511899; nz:-0.0468805; tu:-0.0467242; tv:0.789314; ),
    (x:-0.244496; y:0.168701; z:-0.402711; nx:-0.0596739; ny:0.0413022; nz:-0.0976817; tu:0.9; tv:0.798061; ),
    (x:-0.181811; y:0.248261; z:-0.394416; nx:-0.0436719; ny:0.0592964; nz:-0.0937349; tu:0.846724; tv:0.789314; ),
    (x:-0.370706; y:0.0803398; z:-0.327176; nx:-0.0442115; ny:0.00500214; nz:-0.039525; tu:-0.0377124; tv:0.727058; ),
    (x:-0.327523; y:0.166759; z:-0.340075; nx:-0.0821253; ny:0.0420941; nz:-0.084823; tu:0.921205; tv:0.738086; ),
    (x:-0.271916; y:0.246852; z:-0.340075; nx:-0.068323; ny:0.0620359; nz:-0.084823; tu:0.878795; tv:0.738086; ),
    (x:-0.205995; y:0.317582; z:-0.327176; nx:-0.0500335; ny:0.0766711; nz:-0.0785523; tu:0.837712; tv:0.727058; ),
    (x:-0.119155; y:-0.0905298; z:-0.477185; nx:-0.0271044; ny:-0.0206568; nz:-0.107947; tu:0.1; tv:0.903472; ),
    (x:-0.145679; y:-0.176411; z:-0.444764; nx:-0.0341732; ny:-0.0412388; nz:-0.103389; tu:0.136738; tv:0.848966; ),
    (x:-0.209252; y:-0.0932529; z:-0.444764; nx:-0.048824; ny:-0.0220149; nz:-0.103389; tu:0.0632621; tv:0.848966; ),
    (x:-0.170222; y:-0.256297; z:-0.394416; nx:-0.0409121; ny:-0.0612331; nz:-0.0937349; tu:0.153276; tv:0.789314; ),
    (x:-0.236494; y:-0.17968; z:-0.402711; nx:-0.0577209; ny:-0.0439902; nz:-0.0976817; tu:0.1; tv:0.798061; ),
    (x:-0.293024; y:-0.0956623; z:-0.394416; nx:-0.0698896; ny:-0.0232108; nz:-0.0937349; tu:0.0467242; tv:0.789314; ),
    (x:-0.191199; y:-0.326649; z:-0.327176; nx:-0.0464718; ny:-0.0788807; nz:-0.0785523; tu:0.162288; tv:0.727058; ),
    (x:-0.260298; y:-0.259001; z:-0.340075; nx:-0.0654119; ny:-0.065098; nz:-0.084823; tu:0.121205; tv:0.738086; ),
    (x:-0.319524; y:-0.181529; z:-0.340075; nx:-0.0801126; ny:-0.0458088; nz:-0.084823; tu:0.0787953; tv:0.738086; ),
    (x:-0.366629; y:-0.0971706; z:-0.327176; nx:-0.0883797; ny:-0.0238919; nz:-0.0785523; tu:0.0377124; tv:0.727058; ),
    (x:0.0495446; y:-0.140949; z:-0.477185; nx:0.01127; ny:-0.0321611; nz:-0.107947; tu:0.3; tv:0.903472; ),
    (x:0.123279; y:-0.192636; z:-0.444764; nx:0.0286603; ny:-0.0452441; nz:-0.103389; tu:0.336738; tv:0.848966; ),
    (x:0.024301; y:-0.227213; z:-0.444764; nx:0.00584993; ny:-0.0532374; nz:-0.103389; tu:0.263262; tv:0.848966; ),
    (x:0.191905; y:-0.240592; z:-0.394416; nx:0.0455936; ny:-0.0578318; nz:-0.0937349; tu:0.353276; tv:0.789314; ),
    (x:0.0983342; y:-0.27975; z:-0.402711; nx:0.0240004; ny:-0.0684896; nz:-0.0976818; tu:0.3; tv:0.798061; ),
    (x:0.000712426; y:-0.307384; z:-0.394416; nx:0.00047771; ny:-0.0736415; nz:-0.093735; tu:0.246724; tv:0.789314; ),
    (x:0.252539; y:-0.28222; z:-0.327176; nx:0.0606595; ny:-0.0685728; nz:-0.0785523; tu:0.362288; tv:0.727058; ),
    (x:0.16665; y:-0.32683; z:-0.340075; nx:0.0416985; ny:-0.0823268; nz:-0.084823; tu:0.321205; tv:0.738086; ),
    (x:0.0744399; y:-0.359043; z:-0.340075; nx:0.0188106; ny:-0.0903473; nz:-0.084823; tu:0.278795; tv:0.738086; ),
    (x:-0.020594; y:-0.377637; z:-0.327176; nx:-0.00458824; ny:-0.0914372; nz:-0.0785523; tu:0.237712; tv:0.727058; ),
    (x:0.149775; y:0.00341883; z:-0.477185; nx:0.0340697; ny:0.000780102; nz:-0.107947; tu:0.5; tv:0.903472; ),
    (x:0.22187; y:0.0573561; z:-0.444764; nx:0.0518862; ny:0.0132764; nz:-0.103389; tu:0.536738; tv:0.848966; ),
    (x:0.22427; y:-0.0471723; z:-0.444764; nx:0.0524395; ny:-0.0108876; nz:-0.103389; tu:0.463262; tv:0.848966; ),
    (x:0.288826; y:0.107603; z:-0.394416; nx:0.0690905; ny:0.0254911; nz:-0.0937349; tu:0.553276; tv:0.789314; ),
    (x:0.297268; y:0.00678557; z:-0.402711; nx:0.072554; ny:0.00166129; nz:-0.0976817; tu:0.5; tv:0.798061; ),
    (x:0.293464; y:-0.0943112; z:-0.394416; nx:0.0701848; ny:-0.0223021; nz:-0.0937349; tu:0.446724; tv:0.789314; ),
    (x:0.347276; y:0.152227; z:-0.327176; nx:0.0839614; ny:0.0365005; nz:-0.0785523; tu:0.562288; tv:0.727058; ),
    (x:0.363294; y:0.0570087; z:-0.340075; nx:0.091183; ny:0.0142173; nz:-0.084823; tu:0.521205; tv:0.738086; ),
    (x:0.36553; y:-0.0403722; z:-0.340075; nx:0.0917382; ny:-0.0100289; nz:-0.084823; tu:0.478795; tv:0.738086; ),
    (x:0.353901; y:-0.136222; z:-0.327176; nx:0.085544; ny:-0.0326193; nz:-0.0785523; tu:0.437712; tv:0.727058; ),
    (x:-1.85254E-8; y:-1.96995E-8; z:0.5; nx:-0.000693243; ny:0.0019783; nz:0.018329; tu:0.8; tv:0; ),
    (x:-1.85254E-8; y:-1.96995E-8; z:0.5; nx:-0.0020957; ny:-4.79852E-5; nz:0.018329; tu:3.72529E-9; tv:0; ),
    (x:-0.0756872; y:0.0522238; z:0.491512; nx:-0.0020957; ny:-4.79852E-5; nz:0.018329; tu:-0.1; tv:0.0587361; ),
    (x:-0.0756872; y:0.0522238; z:0.491512; nx:-0.00486175; ny:0.00186629; nz:0.0178111; tu:-0.1; tv:0.0587361; ),
    (x:-0.148804; y:0.102675; z:0.466335; nx:-0.00486175; ny:0.00186629; nz:0.0178111; tu:-0.1; tv:0.117472; ),
    (x:-0.0756872; y:0.0522238; z:0.491512; nx:-0.00353717; ny:-8.09904E-5; nz:0.0185451; tu:-0.1; tv:0.0587361; ),
    (x:-0.148804; y:0.102675; z:0.466335; nx:-0.00661791; ny:0.00191646; nz:0.018145; tu:-0.1; tv:0.117472; ),
    (x:-0.22427; y:0.0471723; z:0.444764; nx:-0.00661791; ny:0.00191646; nz:0.018145; tu:-0.0367379; tv:0.151034; ),
    (x:-0.22427; y:0.0471723; z:0.444764; nx:-0.00775837; ny:-0.00177643; nz:0.0174898; tu:-0.0367379; tv:0.151034; ),
    (x:-0.22427; y:0.0471723; z:0.444764; nx:-0.0107573; ny:0.00174694; nz:0.0163698; tu:-0.0367379; tv:0.151034; ),
    (x:-0.293464; y:0.0943112; z:0.394416; nx:-0.0107573; ny:0.00174694; nz:0.0163698; tu:-0.0532758; tv:0.210686; ),
    (x:-0.22427; y:0.0471723; z:0.444764; nx:-0.0100631; ny:-0.000230415; nz:0.0177053; tu:-0.0367379; tv:0.151034; ),
    (x:-0.293464; y:0.0943112; z:0.394416; nx:-0.013601; ny:0.001836; nz:0.0161552; tu:-0.0532758; tv:0.210686; ),
    (x:-0.36553; y:0.0403722; z:0.340075; nx:-0.013601; ny:0.001836; nz:0.0161552; tu:-0.0212048; tv:0.261914; ),
    (x:-0.36553; y:0.0403722; z:0.340075; nx:-0.0139637; ny:-0.000319728; nz:0.0149265; tu:-0.0212048; tv:0.261914; ),
    (x:-0.36553; y:0.0403722; z:0.340075; nx:-0.0167568; ny:0.00152739; nz:0.0122275; tu:-0.0212048; tv:0.261914; ),
    (x:-0.421506; y:0.0821663; z:0.258403; nx:-0.0167568; ny:0.00152739; nz:0.0122275; tu:-0.0343767; tv:0.327121; ),
    (x:-0.36553; y:0.0403722; z:0.340075; nx:-0.0172128; ny:-0.000394123; nz:0.013834; tu:-0.0212048; tv:0.261914; ),
    (x:-1.85254E-8; y:-1.96995E-8; z:0.5; nx:-0.000601969; ny:-0.00200795; nz:0.018329; tu:0.2; tv:0; ),
    (x:-1.85254E-8; y:-1.96995E-8; z:0.5; nx:0.00172366; ny:-0.001193; nz:0.018329; tu:0.4; tv:0; ),
    (x:-0.475515; y:0.0430972; z:-0.153427; nx:-0.0167249; ny:0.00161122; nz:-0.00761759; tu:-0.0180732; tv:0.599277; ),
    (x:-0.430268; y:0.0774739; z:-0.245167; nx:-0.0167249; ny:0.00161122; nz:-0.00761759; tu:-0.032083; tv:0.663125; ),
    (x:-0.475515; y:0.0430972; z:-0.153427; nx:-0.0173269; ny:-0.000396735; nz:-0.00632204; tu:-0.0180732; tv:0.599277; ),
    (x:-0.475515; y:0.0430972; z:-0.153427; nx:-0.0181648; ny:-0.00041592; nz:-0.00512905; tu:-0.0180732; tv:0.599277; ),
    (x:-0.475515; y:0.0430972; z:-0.153427; nx:-0.0181258; ny:0.00156258; nz:-0.00365622; tu:-0.0180732; tv:0.599277; ),
    (x:-0.486287; y:0.094971; z:-0.0780385; nx:-0.0181258; ny:0.00156258; nz:-0.00365622; tu:-0.0344325; tv:0.549885; ),
    (x:-0.486287; y:0.094971; z:-0.0780385; nx:-0.0192109; ny:0.00162812; nz:-0.00223623; tu:-0.0344325; tv:0.549885; ),
    (x:-0.5; y:0.0408784; z:0; nx:-0.0183552; ny:0.00346438; nz:-0.000813901; tu:0.983333; tv:0.5; ),
    (x:-0.5; y:0.0408784; z:0; nx:-0.0195732; ny:0.00369425; nz:0.00101419; tu:0.983333; tv:0.5; ),
    (x:-0.486391; y:0.0899074; z:0.0832165; nx:-0.0195732; ny:0.00369425; nz:0.00101419; tu:0.967178; tv:0.446775; ),
    (x:-0.486391; y:0.0899074; z:0.0832165; nx:-0.0179351; ny:0.00522924; nz:0.00211933; tu:0.967178; tv:0.446775; ),
    (x:-0.486391; y:0.0899074; z:0.0832165; nx:-0.0189072; ny:0.00344044; nz:0.00560548; tu:0.967178; tv:0.446775; ),
    (x:-0.469202; y:0.0380058; z:0.172848; nx:-0.0189072; ny:0.00344044; nz:0.00560548; tu:0.983453; tv:0.387643; ),
    (x:-0.486391; y:0.0899074; z:0.0832165; nx:-0.0190623; ny:0.00567631; nz:0.00448153; tu:0.967178; tv:0.446775; ),
    (x:-0.421506; y:0.0821663; z:0.258403; nx:-0.0184518; ny:0.00148858; nz:0.00948422; tu:-0.0343767; tv:0.327121; ),
    (x:-0.469202; y:0.0380058; z:0.172848; nx:-0.0194537; ny:0.00375216; nz:0.0088728; tu:0.983453; tv:0.387643; ),
    (x:-1.85254E-8; y:-1.96995E-8; z:-0.5; nx:-0.00172366; ny:0.001193; nz:-0.018329; tu:-0.1; tv:1; ),
    (x:-0.0304408; y:0.0866005; z:-0.491512; nx:-0.00172366; ny:0.001193; nz:-0.018329; tu:-0.2; tv:0.941264; ),
    (x:-0.0304408; y:0.0866005; z:-0.491512; nx:-0.00290923; ny:0.00201357; nz:-0.0185451; tu:-0.2; tv:0.941264; ),
    (x:-0.123186; y:0.084998; z:-0.477185; nx:-0.00283626; ny:0.00436752; nz:-0.0178111; tu:0.9; tv:0.903472; ),
    (x:-0.123186; y:0.084998; z:-0.477185; nx:-0.00638107; ny:0.00441654; nz:-0.0174898; tu:0.9; tv:0.903472; ),
    (x:-0.213314; y:0.0836073; z:-0.444764; nx:-0.00638107; ny:0.00441654; nz:-0.0174898; tu:0.936738; tv:0.848966; ),
    (x:-0.123186; y:0.084998; z:-0.477185; nx:-0.00422754; ny:0.00544036; nz:-0.018145; tu:0.9; tv:0.903472; ),
    (x:-0.213314; y:0.0836073; z:-0.444764; nx:-0.00994422; ny:0.00445923; nz:-0.0163698; tu:0.936738; tv:0.848966; ),
    (x:-0.297109; y:0.0821916; z:-0.394416; nx:-0.00994422; ny:0.00445923; nz:-0.0163698; tu:0.953276; tv:0.789314; ),
    (x:-0.213314; y:0.0836073; z:-0.444764; nx:-0.00827667; ny:0.00572854; nz:-0.0177053; tu:0.936738; tv:0.848966; ),
    (x:-0.297109; y:0.0821916; z:-0.394416; nx:-0.0132482; ny:0.00446013; nz:-0.0143294; tu:0.953276; tv:0.789314; ),
    (x:-0.370706; y:0.0803398; z:-0.327176; nx:-0.0132482; ny:0.00446013; nz:-0.0143294; tu:0.962288; tv:0.727058; ),
    (x:-0.297109; y:0.0821916; z:-0.394416; nx:-0.0123679; ny:0.00594929; nz:-0.0161552; tu:0.953276; tv:0.789314; ),
    (x:-0.430268; y:0.0774739; z:-0.245167; nx:-0.0156596; ny:0.000873906; nz:-0.00971383; tu:-0.032083; tv:0.663125; ),
    (x:-0.430268; y:0.0774739; z:-0.245167; nx:-0.0166306; ny:0.0020099; nz:-0.011968; tu:-0.032083; tv:0.663125; ),
    (x:-0.370706; y:0.0803398; z:-0.327176; nx:-0.0158869; ny:0.00436552; nz:-0.0113474; tu:0.962288; tv:0.727058; ),
    (x:-0.370706; y:0.0803398; z:-0.327176; nx:-0.0160339; ny:0.005994; nz:-0.0133505; tu:0.962288; tv:0.727058; ),
    (x:-1.85254E-8; y:-1.96995E-8; z:-0.5; nx:-0.00166725; ny:-0.00127064; nz:-0.018329; tu:0.1; tv:1; ),
    (x:-1.85254E-8; y:-1.96995E-8; z:-0.5; nx:0.000693243; ny:-0.0019783; nz:-0.018329; tu:0.3; tv:1; ),
    (x:-1.85254E-8; y:-1.96995E-8; z:-0.5; nx:0.0020957; ny:4.79856E-5; nz:-0.018329; tu:0.5; tv:1; )
    );

  SphereIndices: array [0..2159] of Word = (
    0,17,12,12,162,13,12,17,162,17,18,162,13,163,14,13,162,163,162,164,163,162,18,164,18,19,164,14,165,15,
    14,163,165,163,166,165,163,164,166,164,167,166,164,19,167,19,20,167,15,168,16,15,165,168,165,169,168,
    165,166,169,166,170,169,166,167,170,167,171,170,167,20,171,20,21,171,16,37,1,16,168,37,168,38,37,168,
    169,38,169,39,38,169,170,39,170,40,39,170,171,40,171,41,40,171,21,41,21,2,41,362,22,17,17,172,18,17,22,
    172,22,23,172,18,173,19,18,172,173,172,174,173,172,23,174,23,24,174,19,175,20,19,173,175,173,176,175,
    173,174,176,174,177,176,174,24,177,24,25,177,20,178,21,20,175,178,175,179,178,175,176,179,176,180,179,
    176,177,180,177,181,180,177,25,181,25,26,181,21,42,2,21,178,42,178,43,42,178,179,43,179,44,43,179,180,
    44,180,45,44,180,181,45,181,46,45,181,26,46,26,3,46,363,27,364,365,182,366,367,27,182,27,28,182,23,183,
    24,368,182,369,182,184,370,182,28,184,28,29,184,24,185,25,24,183,185,371,186,372,373,184,186,184,187,
    186,184,29,187,29,30,187,25,188,26,25,185,188,185,189,188,374,186,375,186,190,376,186,187,190,187,191,
    190,187,30,191,30,31,191,26,47,3,26,188,47,188,48,47,188,189,48,377,49,378,379,190,49,190,50,49,190,191,
    50,191,51,50,191,31,51,31,4,51,380,32,27,27,192,28,27,32,192,32,33,192,28,193,29,28,192,193,192,194,193,
    192,33,194,33,34,194,29,195,30,29,193,195,193,196,195,193,194,196,194,197,196,194,34,197,34,35,197,30,
    198,31,30,195,198,195,199,198,195,196,199,196,200,199,196,197,200,197,201,200,197,35,201,35,36,201,31,
    52,4,31,198,52,198,53,52,198,199,53,199,54,53,199,200,54,200,55,54,200,201,55,201,56,55,201,36,56,36,
    5,56,381,12,32,32,202,33,32,12,202,12,13,202,33,203,34,33,202,203,202,204,203,202,13,204,13,14,204,34,
    205,35,34,203,205,203,206,205,203,204,206,204,207,206,204,14,207,14,15,207,35,208,36,35,205,208,205,209,
    208,205,206,209,206,210,209,206,207,210,207,211,210,207,15,211,15,16,211,36,57,5,36,208,57,208,58,57,
    208,209,58,209,59,58,209,210,59,210,60,59,210,211,60,211,61,60,211,16,61,16,1,61,1,62,87,87,212,88,87,
    62,212,62,63,212,88,213,89,88,212,213,212,214,213,212,63,214,63,64,214,89,215,90,89,213,215,213,216,215,
    213,214,216,214,217,216,214,64,217,64,65,217,90,218,91,90,215,218,215,219,218,215,216,219,216,220,219,
    216,217,220,217,221,220,217,65,221,65,66,221,91,132,10,91,218,132,218,133,132,218,219,133,219,134,133,
    219,220,134,220,135,134,220,221,135,221,136,135,221,66,136,66,6,136,2,67,92,92,222,93,92,67,222,67,68,
    222,93,223,94,93,222,223,222,224,223,222,68,224,68,69,224,94,225,95,94,223,225,223,226,225,223,224,226,
    224,227,226,224,69,227,69,70,227,95,228,96,95,225,228,225,229,228,225,226,229,226,230,229,226,227,230,
    227,231,230,227,70,231,70,71,231,96,112,6,96,228,112,228,113,112,228,229,113,229,114,113,229,230,114,
    230,115,114,230,231,115,231,116,115,231,71,116,71,7,116,3,72,97,97,232,98,97,72,232,72,73,232,98,233,
    99,98,232,233,232,234,233,232,73,234,73,74,234,99,235,100,99,233,235,233,236,235,233,234,236,234,237,
    236,234,74,237,74,75,237,100,238,101,100,235,238,235,239,238,235,236,239,236,240,239,236,237,240,237,
    241,240,237,75,241,75,76,241,101,117,7,101,238,117,238,118,117,238,239,118,239,119,118,239,240,119,240,
    120,119,240,241,120,241,121,120,241,76,121,382,8,383,4,77,102,102,242,103,102,77,242,77,78,242,103,243,
    104,103,242,243,242,244,243,242,78,244,78,79,244,104,245,105,104,243,245,243,246,245,243,244,246,244,
    247,246,244,79,247,79,80,247,105,248,106,105,245,248,245,249,248,245,246,249,246,250,249,246,247,250,
    247,251,250,247,80,251,80,81,251,106,122,8,106,248,122,248,123,122,248,249,123,249,124,123,249,250,124,
    250,125,124,250,251,125,251,126,125,251,81,126,81,9,126,5,82,107,107,252,108,107,82,252,82,83,252,108,
    253,109,108,252,253,252,254,253,252,83,254,83,84,254,109,255,110,109,253,255,253,256,255,253,254,256,
    254,257,256,254,84,257,84,85,257,110,258,111,110,255,258,255,259,258,255,256,259,256,260,259,256,257,
    260,257,261,260,257,85,261,85,86,261,111,127,9,111,258,127,258,128,127,258,259,128,259,129,128,259,260,
    129,260,130,129,260,261,130,261,131,130,261,86,131,86,10,131,6,66,96,96,262,95,96,66,262,66,65,262,95,
    263,94,95,262,263,262,264,263,262,65,264,65,64,264,94,265,93,94,263,265,263,266,265,263,264,266,264,267,
    266,264,64,267,64,63,267,93,268,92,93,265,268,265,269,268,265,266,269,266,270,269,266,267,270,267,271,
    270,267,63,271,63,62,271,92,41,2,92,268,41,268,40,41,268,269,40,269,39,40,269,270,39,270,38,39,270,271,
    38,271,37,38,271,62,37,62,1,37,7,71,101,101,272,100,101,71,272,71,70,272,100,273,99,100,272,273,272,274,
    273,272,70,274,70,69,274,99,275,98,99,273,275,273,276,275,273,274,276,274,277,276,274,69,277,69,68,277,
    98,278,97,98,275,278,275,279,278,275,276,279,276,280,279,276,277,280,277,281,280,277,68,281,68,67,281,
    97,46,3,97,278,46,278,45,46,278,279,45,279,44,45,279,280,44,280,43,44,280,281,43,281,42,43,281,67,42,
    67,2,42,8,384,106,106,282,105,106,385,282,386,387,282,105,283,104,105,282,283,282,284,283,282,388,284,
    75,74,389,104,285,103,104,283,285,283,286,285,283,284,286,284,287,286,390,74,391,74,73,392,103,288,102,
    103,285,288,285,289,288,285,286,289,286,290,289,286,287,290,393,291,394,395,73,291,73,72,291,102,51,4,
    102,288,51,288,50,51,288,289,50,289,49,50,289,290,49,290,396,49,397,291,48,291,47,48,291,72,47,72,3,47,
    9,81,111,111,292,110,111,81,292,81,80,292,110,293,109,110,292,293,292,294,293,292,80,294,80,79,294,109,
    295,108,109,293,295,293,296,295,293,294,296,294,297,296,294,79,297,79,78,297,108,298,107,108,295,298,
    295,299,298,295,296,299,296,300,299,296,297,300,297,301,300,297,78,301,78,77,301,107,56,5,107,298,56,
    298,55,56,298,299,55,299,54,55,299,300,54,300,53,54,300,301,53,301,52,53,301,77,52,77,4,52,10,86,91,91,
    302,90,91,86,302,86,85,302,90,303,89,90,302,303,302,304,303,302,85,304,85,84,304,89,305,88,89,303,305,
    303,306,305,303,304,306,304,307,306,304,84,307,84,83,307,88,308,87,88,305,308,305,309,308,305,306,309,
    306,310,309,306,307,310,307,311,310,307,83,311,83,82,311,87,61,1,87,308,61,308,60,61,308,309,60,309,59,
    60,309,310,59,310,58,59,310,311,58,311,57,58,311,82,57,82,5,57,11,137,142,142,312,143,142,137,312,137,
    138,312,143,313,144,143,312,313,312,314,313,312,138,314,138,139,314,144,315,145,144,313,315,313,316,315,
    313,314,316,314,317,316,314,139,317,139,140,317,145,318,146,145,315,318,315,319,318,315,316,319,316,320,
    319,316,317,320,317,321,320,317,140,321,140,141,321,146,116,7,146,318,116,318,115,116,318,319,115,319,
    114,115,319,320,114,320,113,114,320,321,113,321,112,113,321,141,112,141,6,112,398,399,147,147,322,148,
    147,400,322,142,143,401,148,323,149,148,322,323,402,324,403,404,143,324,143,144,324,149,325,150,149,323,
    325,405,326,406,407,324,326,324,327,326,324,144,327,144,145,327,150,328,151,150,325,328,408,329,409,410,
    326,329,326,330,329,326,327,330,327,331,330,327,145,331,145,146,331,151,411,8,151,328,412,413,120,121,
    414,329,120,329,119,120,329,330,119,330,118,119,330,331,118,331,117,118,331,146,117,146,7,117,415,147,
    152,152,332,153,152,147,332,147,148,332,153,333,154,153,332,333,332,334,333,332,148,334,148,149,334,154,
    335,155,154,333,335,333,336,335,333,334,336,334,337,336,334,149,337,149,150,337,155,338,156,155,335,338,
    335,339,338,335,336,339,336,340,339,336,337,340,337,341,340,337,150,341,150,151,341,156,126,9,156,338,
    126,338,125,126,338,339,125,339,124,125,339,340,124,340,123,124,340,341,123,341,122,123,341,151,122,151,
    8,122,416,152,157,157,342,158,157,152,342,152,153,342,158,343,159,158,342,343,342,344,343,342,153,344,
    153,154,344,159,345,160,159,343,345,343,346,345,343,344,346,344,347,346,344,154,347,154,155,347,160,348,
    161,160,345,348,345,349,348,345,346,349,346,350,349,346,347,350,347,351,350,347,155,351,155,156,351,161,
    131,10,161,348,131,348,130,131,348,349,130,349,129,130,349,350,129,350,128,129,350,351,128,351,127,128,
    351,156,127,156,9,127,417,157,137,137,352,138,137,157,352,157,158,352,138,353,139,138,352,353,352,354,
    353,352,158,354,158,159,354,139,355,140,139,353,355,353,356,355,353,354,356,354,357,356,354,159,357,159,
    160,357,140,358,141,140,355,358,355,359,358,355,356,359,356,360,359,356,357,360,357,361,360,357,160,361,
    160,161,361,141,136,6,141,358,136,358,135,136,358,359,135,359,134,135,359,360,134,360,133,134,360,361,
    133,361,132,133,361,161,132,161,10,132
  );

constructor TdxSphere.Create(AOwner: TComponent);
begin
  inherited;
  SetLength(Data.MeshVertices, Length(SphereVertices));
  Move(SphereVertices[0], Data.MeshVertices[0], SizeOf(SphereVertices));
  SetLength(Data.MeshIndices, Length(SphereIndices));
  Move(SphereIndices[0], Data.MeshIndices[0], SizeOf(SphereIndices));
  Data.CalcNormals;
end;

procedure TdxSphere.CreateBody;
begin
  if (Scene <> nil) and (Scene.Physics = nil) then
    Scene.CreatePhysics;
  if (Collider or Dynamic) and (Scene.Physics <> nil) then
  begin
    FBody := Scene.Physics.CreateSphere(Self, dxVector(Width, Height, Depth));
  end;
end;

destructor TdxSphere.Destroy;
begin
  inherited;
end;

procedure TdxSphere.Paint;
begin
  inherited;
end;

function TdxSphere.RayCastIntersect(const RayPos,
  RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  i1, i2, NewPos, NewDir: TdxVector;
begin
  if (Width <> 0) and (Height <> 0) and (Depth <> 0) then
  begin
    NewPos := dxVector(RayPos.x * (1 / (Width / 2)), RayPos.y * (1 / (Height / 2)), RayPos.z * (1 / (Depth/2)));
    NewDir := dxVectorNormalize(dxVector(RayDir.x * (1 / Width / 2), RayDir.y * (1 / Height / 2), RayDir.z * (1 / Depth / 2)));
    Result := RayCastSphereIntersect(NewPos, NewDir, dxVector(0, 0, 0), 1, i1, i2) > 0;
    if Result then
     Intersection := dxVector(LocalToAbsolute(dxPoint(i1))); 
  end
  else
    Result := false;
end;

{ TdxText }

constructor TdxText.Create(AOwner: TComponent);
begin
  inherited;
  FFont := TdxFont.Create;
  FFont.OnChanged := FontChanged;
  Height := 0.1;
  Material.Lighting := false;
  ZWrite := false;
end;

destructor TdxText.Destroy;
begin
  FFont.Free;
  inherited;
end;

procedure TdxText.Paint;
var
  S: TdxPoint;
begin
  inherited;
  Canvas.Font.Assign(FFont);
  S := Canvas.MeasureText(FText);
  Canvas.DrawText(-S.X / 2, -S.Y / 2, FText, AbsoluteOpacity);
end;

function TdxText.RayCastIntersect(const RayPos,
  RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array [0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1,  0,  0);
  p[4] := dxVector(0, -1,  0);
  p[5] := dxVector(0,  0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := - (p[i].V[0]*RayPos.V[0] + p[i].V[1]*RayPos.V[1] + p[i].V[2]*RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
           / (p[i].V[0]*RayDir.V[0] + p[i].V[1]*RayDir.V[1] + p[i].V[2]*RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t*RayDir.V[0], RayPos.V[1] + t*RayDir.V[1], RayPos.V[2] + t*RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
         (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Exit;
      end;
    end;
  end;
  Result := false;
end;

procedure TdxText.FontChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TdxText.SetFont(const Value: TdxFont);
begin
  FFont.Assign(Value);
end;

procedure TdxText.SetText(const Value: WideString);
begin
  if FText <> Value then
  begin
    FText := Value;
    Repaint;
  end;
end;

{ TdxCylinder =================================================================}

const
CylinderVertices: array [0..162] of TdxTexVertexNormal = (
(x:0.5; y:1.31214E-8; z:1.29221E-8; nx:1.53909; ny:0; nz:0; tu:0.5; tv:1; ),
(x:0.5; y:1.31214E-8; z:0.5; nx:0.17101; ny:0; nz:0; tu:0.75; tv:1; ),
(x:0.5; y:0.173648; z:0.469846; nx:0.17101; ny:0; nz:0; tu:0.805556; tv:1; ),
(x:0.5; y:0.326352; z:0.383022; nx:0.17101; ny:0; nz:0; tu:0.861111; tv:1; ),
(x:0.5; y:0.439693; z:0.25; nx:0.17101; ny:0; nz:0; tu:0.916667; tv:1; ),
(x:0.5; y:0.5; z:0.0868241; nx:0.085505; ny:0; nz:0; tu:0.972222; tv:1; ),
(x:0.5; y:0.5; z:-0.0868241; nx:0.17101; ny:0; nz:0; tu:0.0277778; tv:1; ),
(x:0.5; y:0.439693; z:-0.25; nx:0.17101; ny:0; nz:0; tu:0.0833334; tv:1; ),
(x:0.5; y:0.326352; z:-0.383022; nx:0.17101; ny:0; nz:0; tu:0.138889; tv:1; ),
(x:0.5; y:0.173648; z:-0.469846; nx:0.17101; ny:0; nz:0; tu:0.194444; tv:1; ),
(x:0.5; y:-7.66009E-8; z:-0.5; nx:0.17101; ny:0; nz:0; tu:0.25; tv:1; ),
(x:0.5; y:-0.173648; z:-0.469846; nx:0.17101; ny:0; nz:0; tu:0.305556; tv:1; ),
(x:0.5; y:-0.326352; z:-0.383022; nx:0.17101; ny:0; nz:0; tu:0.361111; tv:1; ),
(x:0.5; y:-0.439693; z:-0.25; nx:0.17101; ny:0; nz:0; tu:0.416667; tv:1; ),
(x:0.5; y:-0.5; z:-0.0868239; nx:0.17101; ny:0; nz:0; tu:0.472222; tv:1; ),
(x:0.5; y:-0.5; z:0.0868242; nx:0.17101; ny:0; nz:0; tu:0.527778; tv:1; ),
(x:0.5; y:-0.439693; z:0.25; nx:0.17101; ny:0; nz:0; tu:0.583333; tv:1; ),
(x:0.5; y:-0.326352; z:0.383022; nx:0.17101; ny:0; nz:0; tu:0.638889; tv:1; ),
(x:0.5; y:-0.173648; z:0.469846; nx:0.17101; ny:0; nz:0; tu:0.694444; tv:1; ),
(x:0.3; y:1.31214E-8; z:0.5; nx:0; ny:3.53903E-8; nz:0.205212; tu:0.75; tv:0.8; ),
(x:0.3; y:0.173648; z:0.469846; nx:0; ny:0.0701867; nz:0.192836; tu:0.805556; tv:0.8; ),
(x:0.3; y:0.326352; z:0.383022; nx:0; ny:0.131908; nz:0.157202; tu:0.861111; tv:0.8; ),
(x:0.3; y:0.439693; z:0.25; nx:0; ny:0.177719; nz:0.102606; tu:0.916667; tv:0.8; ),
(x:0.3; y:0.5; z:0.0868241; nx:0; ny:0.0979055; nz:0.0356347; tu:0.972222; tv:0.8; ),
(x:0.3; y:0.5; z:-0.0868241; nx:0; ny:0.202094; nz:-0.0356347; tu:0.0277778; tv:0.8; ),
(x:0.3; y:0.439693; z:-0.25; nx:0; ny:0.177719; nz:-0.102606; tu:0.0833334; tv:0.8; ),
(x:0.3; y:0.326352; z:-0.383022; nx:0; ny:0.131908; nz:-0.157202; tu:0.138889; tv:0.8; ),
(x:0.3; y:0.173648; z:-0.469846; nx:0; ny:0.0701866; nz:-0.192836; tu:0.194444; tv:0.8; ),
(x:0.3; y:-7.66009E-8; z:-0.5; nx:0; ny:-3.72529E-8; nz:-0.205212; tu:0.25; tv:0.8; ),
(x:0.3; y:-0.173648; z:-0.469846; nx:0; ny:-0.0701867; nz:-0.192836; tu:0.305556; tv:0.8; ),
(x:0.3; y:-0.326352; z:-0.383022; nx:0; ny:-0.131908; nz:-0.157202; tu:0.361111; tv:0.8; ),
(x:0.3; y:-0.439693; z:-0.25; nx:0; ny:-0.177719; nz:-0.102606; tu:0.416667; tv:0.8; ),
(x:0.3; y:-0.5; z:-0.0868239; nx:0; ny:-0.202094; nz:-0.0356347; tu:0.472222; tv:0.8; ),
(x:0.3; y:-0.5; z:0.0868242; nx:0; ny:-0.202094; nz:0.0356348; tu:0.527778; tv:0.8; ),
(x:0.3; y:-0.439693; z:0.25; nx:0; ny:-0.177719; nz:0.102606; tu:0.583333; tv:0.8; ),
(x:0.3; y:-0.326352; z:0.383022; nx:0; ny:-0.131908; nz:0.157202; tu:0.638889; tv:0.8; ),
(x:0.3; y:-0.173648; z:0.469846; nx:0; ny:-0.0701866; nz:0.192836; tu:0.694444; tv:0.8; ),
(x:0.1; y:1.31214E-8; z:0.5; nx:0; ny:3.49246E-8; nz:0.205212; tu:0.75; tv:0.6; ),
(x:0.1; y:0.173648; z:0.469846; nx:0; ny:0.0701867; nz:0.192836; tu:0.805556; tv:0.6; ),
(x:0.1; y:0.326352; z:0.383022; nx:0; ny:0.131908; nz:0.157202; tu:0.861111; tv:0.6; ),
(x:0.1; y:0.439693; z:0.25; nx:0; ny:0.177719; nz:0.102606; tu:0.916667; tv:0.6; ),
(x:0.1; y:0.5; z:0.0868241; nx:0; ny:0.0979056; nz:0.0356347; tu:0.972222; tv:0.6; ),
(x:0.1; y:0.5; z:-0.0868241; nx:0; ny:0.202094; nz:-0.0356347; tu:0.0277778; tv:0.6; ),
(x:0.1; y:0.439693; z:-0.25; nx:0; ny:0.177719; nz:-0.102606; tu:0.0833334; tv:0.6; ),
(x:0.1; y:0.326352; z:-0.383022; nx:0; ny:0.131908; nz:-0.157202; tu:0.138889; tv:0.6; ),
(x:0.1; y:0.173648; z:-0.469846; nx:0; ny:0.0701866; nz:-0.192836; tu:0.194444; tv:0.6; ),
(x:0.1; y:-7.66009E-8; z:-0.5; nx:0; ny:-3.63216E-8; nz:-0.205212; tu:0.25; tv:0.6; ),
(x:0.1; y:-0.173648; z:-0.469846; nx:0; ny:-0.0701867; nz:-0.192836; tu:0.305556; tv:0.6; ),
(x:0.1; y:-0.326352; z:-0.383022; nx:0; ny:-0.131908; nz:-0.157202; tu:0.361111; tv:0.6; ),
(x:0.1; y:-0.439693; z:-0.25; nx:0; ny:-0.177719; nz:-0.102606; tu:0.416667; tv:0.6; ),
(x:0.1; y:-0.5; z:-0.0868239; nx:0; ny:-0.202094; nz:-0.0356347; tu:0.472222; tv:0.6; ),
(x:0.1; y:-0.5; z:0.0868242; nx:0; ny:-0.202094; nz:0.0356348; tu:0.527778; tv:0.6; ),
(x:0.1; y:-0.439693; z:0.25; nx:0; ny:-0.177719; nz:0.102606; tu:0.583333; tv:0.6; ),
(x:0.1; y:-0.326352; z:0.383022; nx:0; ny:-0.131908; nz:0.157202; tu:0.638889; tv:0.6; ),
(x:0.1; y:-0.173648; z:0.469846; nx:0; ny:-0.0701866; nz:0.192836; tu:0.694444; tv:0.6; ),
(x:-0.1; y:1.31214E-8; z:0.5; nx:0; ny:3.39933E-8; nz:0.205212; tu:0.75; tv:0.4; ),
(x:-0.1; y:0.173648; z:0.469846; nx:0; ny:0.0701867; nz:0.192836; tu:0.805556; tv:0.4; ),
(x:-0.1; y:0.326352; z:0.383022; nx:0; ny:0.131908; nz:0.157202; tu:0.861111; tv:0.4; ),
(x:-0.1; y:0.439693; z:0.25; nx:0; ny:0.177719; nz:0.102606; tu:0.916667; tv:0.4; ),
(x:-0.1; y:0.5; z:0.0868241; nx:0; ny:0.0979055; nz:0.0356347; tu:0.972222; tv:0.4; ),
(x:-0.1; y:0.5; z:-0.0868241; nx:0; ny:0.202094; nz:-0.0356347; tu:0.0277778; tv:0.4; ),
(x:-0.1; y:0.439693; z:-0.25; nx:0; ny:0.177719; nz:-0.102606; tu:0.0833334; tv:0.4; ),
(x:-0.1; y:0.326352; z:-0.383022; nx:0; ny:0.131908; nz:-0.157202; tu:0.138889; tv:0.4; ),
(x:-0.1; y:0.173648; z:-0.469846; nx:0; ny:0.0701866; nz:-0.192836; tu:0.194444; tv:0.4; ),
(x:-0.1; y:-7.66009E-8; z:-0.5; nx:0; ny:-3.53903E-8; nz:-0.205212; tu:0.25; tv:0.4; ),
(x:-0.1; y:-0.173648; z:-0.469846; nx:0; ny:-0.0701867; nz:-0.192836; tu:0.305556; tv:0.4; ),
(x:-0.1; y:-0.326352; z:-0.383022; nx:0; ny:-0.131908; nz:-0.157202; tu:0.361111; tv:0.4; ),
(x:-0.1; y:-0.439693; z:-0.25; nx:0; ny:-0.177719; nz:-0.102606; tu:0.416667; tv:0.4; ),
(x:-0.1; y:-0.5; z:-0.0868239; nx:0; ny:-0.202094; nz:-0.0356347; tu:0.472222; tv:0.4; ),
(x:-0.1; y:-0.5; z:0.0868242; nx:0; ny:-0.202094; nz:0.0356348; tu:0.527778; tv:0.4; ),
(x:-0.1; y:-0.439693; z:0.25; nx:0; ny:-0.177719; nz:0.102606; tu:0.583333; tv:0.4; ),
(x:-0.1; y:-0.326352; z:0.383022; nx:0; ny:-0.131908; nz:0.157202; tu:0.638889; tv:0.4; ),
(x:-0.1; y:-0.173648; z:0.469846; nx:0; ny:-0.0701866; nz:0.192836; tu:0.694444; tv:0.4; ),
(x:-0.3; y:1.31214E-8; z:0.5; nx:0; ny:3.49246E-8; nz:0.205212; tu:0.75; tv:0.2; ),
(x:-0.3; y:0.173648; z:0.469846; nx:0; ny:0.0701867; nz:0.192836; tu:0.805556; tv:0.2; ),
(x:-0.3; y:0.326352; z:0.383022; nx:0; ny:0.131908; nz:0.157202; tu:0.861111; tv:0.2; ),
(x:-0.3; y:0.439693; z:0.25; nx:0; ny:0.177719; nz:0.102606; tu:0.916667; tv:0.2; ),
(x:-0.3; y:0.5; z:0.0868241; nx:0; ny:0.0979055; nz:0.0356347; tu:0.972222; tv:0.2; ),
(x:-0.3; y:0.5; z:-0.0868241; nx:0; ny:0.202094; nz:-0.0356347; tu:0.0277778; tv:0.2; ),
(x:-0.3; y:0.439693; z:-0.25; nx:0; ny:0.177719; nz:-0.102606; tu:0.0833334; tv:0.2; ),
(x:-0.3; y:0.326352; z:-0.383022; nx:0; ny:0.131908; nz:-0.157202; tu:0.138889; tv:0.2; ),
(x:-0.3; y:0.173648; z:-0.469846; nx:0; ny:0.0701866; nz:-0.192836; tu:0.194444; tv:0.2; ),
(x:-0.3; y:-7.66009E-8; z:-0.5; nx:0; ny:-3.63216E-8; nz:-0.205212; tu:0.25; tv:0.2; ),
(x:-0.3; y:-0.173648; z:-0.469846; nx:0; ny:-0.0701867; nz:-0.192836; tu:0.305556; tv:0.2; ),
(x:-0.3; y:-0.326352; z:-0.383022; nx:0; ny:-0.131908; nz:-0.157202; tu:0.361111; tv:0.2; ),
(x:-0.3; y:-0.439693; z:-0.25; nx:0; ny:-0.177719; nz:-0.102606; tu:0.416667; tv:0.2; ),
(x:-0.3; y:-0.5; z:-0.0868239; nx:0; ny:-0.202094; nz:-0.0356347; tu:0.472222; tv:0.2; ),
(x:-0.3; y:-0.5; z:0.0868242; nx:0; ny:-0.202094; nz:0.0356348; tu:0.527778; tv:0.2; ),
(x:-0.3; y:-0.439693; z:0.25; nx:0; ny:-0.177719; nz:0.102606; tu:0.583333; tv:0.2; ),
(x:-0.3; y:-0.326352; z:0.383022; nx:0; ny:-0.131908; nz:0.157202; tu:0.638889; tv:0.2; ),
(x:-0.3; y:-0.173648; z:0.469846; nx:0; ny:-0.0701866; nz:0.192836; tu:0.694444; tv:0.2; ),
(x:-0.5; y:1.31214E-8; z:0.5; nx:0; ny:-0.00603071; nz:0.102606; tu:0.75; tv:0; ),
(x:-0.5; y:0.173648; z:0.469846; nx:0; ny:0.0294263; nz:0.0984808; tu:0.805556; tv:0; ),
(x:-0.5; y:0.326352; z:0.383022; nx:0; ny:0.0613341; nz:0.0824773; tu:0.861111; tv:0; ),
(x:-0.5; y:0.439693; z:0.25; nx:0; ny:0.0858441; nz:0.0565258; tu:0.916667; tv:0; ),
(x:-0.5; y:0.5; z:0.0868241; nx:0; ny:0.0652704; nz:0.0237565; tu:0.972222; tv:0; ),
(x:-0.5; y:0.5; z:-0.0868241; nx:0; ny:0.102094; nz:-0.0118783; tu:0.0277778; tv:0; ),
(x:-0.5; y:0.439693; z:-0.25; nx:0; ny:0.0918748; nz:-0.0460803; tu:0.0833334; tv:0; ),
(x:-0.5; y:0.326352; z:-0.383022; nx:0; ny:0.0705737; nz:-0.0747243; tu:0.138889; tv:0; ),
(x:-0.5; y:0.173648; z:-0.469846; nx:0; ny:0.0407604; nz:-0.0943555; tu:0.194444; tv:0; ),
(x:-0.5; y:-7.66009E-8; z:-0.5; nx:0; ny:0.00603072; nz:-0.102606; tu:0.25; tv:0; ),
(x:-0.5; y:-0.173648; z:-0.469846; nx:0; ny:-0.0294263; nz:-0.0984808; tu:0.305556; tv:0; ),
(x:-0.5; y:-0.326352; z:-0.383022; nx:0; ny:-0.0613341; nz:-0.0824773; tu:0.361111; tv:0; ),
(x:-0.5; y:-0.439693; z:-0.25; nx:0; ny:-0.0858441; nz:-0.0565258; tu:0.416667; tv:0; ),
(x:-0.5; y:-0.5; z:-0.0868239; nx:0; ny:-0.1; nz:-0.0237565; tu:0.472222; tv:0; ),
(x:-0.5; y:-0.5; z:0.0868242; nx:0; ny:-0.102094; nz:0.0118783; tu:0.527778; tv:0; ),
(x:-0.5; y:-0.439693; z:0.25; nx:0; ny:-0.0918748; nz:0.0460803; tu:0.583333; tv:0; ),
(x:-0.5; y:-0.326352; z:0.383022; nx:0; ny:-0.0705737; nz:0.0747243; tu:0.638889; tv:0; ),
(x:-0.5; y:-0.173648; z:0.469846; nx:0; ny:-0.0407603; nz:0.0943555; tu:0.694444; tv:0; ),
(x:-0.5; y:1.31214E-8; z:1.29221E-8; nx:-1.53909; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:0.5; z:0.0868241; nx:0.085505; ny:0; nz:0; tu:-0.0277778; tv:1; ),
(x:0.5; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:1; ),
(x:0.3; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.8; ),
(x:0.5; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:1; ),
(x:0.3; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.8; ),
(x:0.1; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.6; ),
(x:0.3; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.8; ),
(x:0.1; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.6; ),
(x:-0.1; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.4; ),
(x:0.1; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.6; ),
(x:-0.1; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.4; ),
(x:-0.3; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.2; ),
(x:-0.1; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.4; ),
(x:-0.3; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.2; ),
(x:-0.5; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0; ),
(x:-0.3; y:0.5; z:0.0868241; nx:0; ny:0.0347296; nz:-5.96046E-9; tu:-0.0277778; tv:0.2; ),
(x:-0.5; y:0.5; z:0.0868241; nx:-0.085505; ny:0; nz:0; tu:-0.0277778; tv:0; ),
(x:0.5; y:1.31214E-8; z:0.5; nx:0; ny:0.00603075; nz:0.102606; tu:0.75; tv:1; ),
(x:0.5; y:0.173648; z:0.469846; nx:0; ny:0.0407604; nz:0.0943555; tu:0.805556; tv:1; ),
(x:0.5; y:0.326352; z:0.383022; nx:0; ny:0.0705737; nz:0.0747243; tu:0.861111; tv:1; ),
(x:0.5; y:0.439693; z:0.25; nx:0; ny:0.0918748; nz:0.0460803; tu:0.916667; tv:1; ),
(x:0.5; y:0.5; z:0.0868241; nx:0; ny:0.0326352; nz:0.0118782; tu:0.972222; tv:1; ),
(x:0.5; y:0.5; z:-0.0868241; nx:0; ny:0.1; nz:-0.0237565; tu:0.0277778; tv:1; ),
(x:0.5; y:0.439693; z:-0.25; nx:0; ny:0.0858441; nz:-0.0565258; tu:0.0833334; tv:1; ),
(x:0.5; y:0.326352; z:-0.383022; nx:0; ny:0.0613341; nz:-0.0824773; tu:0.138889; tv:1; ),
(x:0.5; y:0.173648; z:-0.469846; nx:0; ny:0.0294263; nz:-0.0984808; tu:0.194444; tv:1; ),
(x:0.5; y:-7.66009E-8; z:-0.5; nx:0; ny:-0.00603076; nz:-0.102606; tu:0.25; tv:1; ),
(x:0.5; y:-0.173648; z:-0.469846; nx:0; ny:-0.0407604; nz:-0.0943555; tu:0.305556; tv:1; ),
(x:0.5; y:-0.326352; z:-0.383022; nx:0; ny:-0.0705737; nz:-0.0747243; tu:0.361111; tv:1; ),
(x:0.5; y:-0.439693; z:-0.25; nx:0; ny:-0.0918748; nz:-0.0460802; tu:0.416667; tv:1; ),
(x:0.5; y:-0.5; z:-0.0868239; nx:0; ny:-0.102094; nz:-0.0118782; tu:0.472222; tv:1; ),
(x:0.5; y:-0.5; z:0.0868242; nx:0; ny:-0.1; nz:0.0237565; tu:0.527778; tv:1; ),
(x:0.5; y:-0.439693; z:0.25; nx:0; ny:-0.0858441; nz:0.0565258; tu:0.583333; tv:1; ),
(x:0.5; y:-0.326352; z:0.383022; nx:0; ny:-0.0613341; nz:0.0824773; tu:0.638889; tv:1; ),
(x:0.5; y:-0.173648; z:0.469846; nx:0; ny:-0.0294263; nz:0.0984807; tu:0.694444; tv:1; ),
(x:-0.5; y:1.31214E-8; z:0.5; nx:-0.17101; ny:0; nz:0; tu:0.75; tv:0; ),
(x:-0.5; y:0.173648; z:0.469846; nx:-0.17101; ny:0; nz:0; tu:0.805556; tv:0; ),
(x:-0.5; y:0.326352; z:0.383022; nx:-0.17101; ny:0; nz:0; tu:0.861111; tv:0; ),
(x:-0.5; y:0.439693; z:0.25; nx:-0.17101; ny:0; nz:0; tu:0.916667; tv:0; ),
(x:-0.5; y:0.5; z:0.0868241; nx:-0.085505; ny:0; nz:0; tu:0.972222; tv:0; ),
(x:-0.5; y:0.5; z:-0.0868241; nx:-0.17101; ny:0; nz:0; tu:0.0277778; tv:0; ),
(x:-0.5; y:0.439693; z:-0.25; nx:-0.17101; ny:0; nz:0; tu:0.0833334; tv:0; ),
(x:-0.5; y:0.326352; z:-0.383022; nx:-0.17101; ny:0; nz:0; tu:0.138889; tv:0; ),
(x:-0.5; y:0.173648; z:-0.469846; nx:-0.17101; ny:0; nz:0; tu:0.194444; tv:0; ),
(x:-0.5; y:-7.66009E-8; z:-0.5; nx:-0.17101; ny:0; nz:0; tu:0.25; tv:0; ),
(x:-0.5; y:-0.173648; z:-0.469846; nx:-0.17101; ny:0; nz:0; tu:0.305556; tv:0; ),
(x:-0.5; y:-0.326352; z:-0.383022; nx:-0.17101; ny:0; nz:0; tu:0.361111; tv:0; ),
(x:-0.5; y:-0.439693; z:-0.25; nx:-0.17101; ny:0; nz:0; tu:0.416667; tv:0; ),
(x:-0.5; y:-0.5; z:-0.0868239; nx:-0.17101; ny:0; nz:0; tu:0.472222; tv:0; ),
(x:-0.5; y:-0.5; z:0.0868242; nx:-0.17101; ny:0; nz:0; tu:0.527778; tv:0; ),
(x:-0.5; y:-0.439693; z:0.25; nx:-0.17101; ny:0; nz:0; tu:0.583333; tv:0; ),
(x:-0.5; y:-0.326352; z:0.383022; nx:-0.17101; ny:0; nz:0; tu:0.638889; tv:0; ),
(x:-0.5; y:-0.173648; z:0.469846; nx:-0.17101; ny:0; nz:0; tu:0.694444; tv:0; )
);

  CylinderIndices: array [0..647] of Word = (
0,1,2,0,2,3,0,3,4,0,4,5,0,110,6,0,6,7,0,7,8,0,8,9,0,9,10,0,10,11,0,11,12,0,12,13,0,13,14,0,14,15,0,15,
16,0,16,17,0,17,18,0,18,1,127,19,20,127,20,128,128,20,21,128,21,129,129,21,22,129,22,130,130,22,23,130,
23,131,111,112,24,113,24,132,132,24,25,132,25,133,133,25,26,133,26,134,134,26,27,134,27,135,135,27,28,
135,28,136,136,28,29,136,29,137,137,29,30,137,30,138,138,30,31,138,31,139,139,31,32,139,32,140,140,32,
33,140,33,141,141,33,34,141,34,142,142,34,35,142,35,143,143,35,36,143,36,144,144,36,19,144,19,127,19,
37,38,19,38,20,20,38,39,20,39,21,21,39,40,21,40,22,22,40,41,22,41,23,114,115,42,116,42,24,24,42,43,24,
43,25,25,43,44,25,44,26,26,44,45,26,45,27,27,45,46,27,46,28,28,46,47,28,47,29,29,47,48,29,48,30,30,48,
49,30,49,31,31,49,50,31,50,32,32,50,51,32,51,33,33,51,52,33,52,34,34,52,53,34,53,35,35,53,54,35,54,36,
36,54,37,36,37,19,37,55,56,37,56,38,38,56,57,38,57,39,39,57,58,39,58,40,40,58,59,40,59,41,117,118,60,
119,60,42,42,60,61,42,61,43,43,61,62,43,62,44,44,62,63,44,63,45,45,63,64,45,64,46,46,64,65,46,65,47,47,
65,66,47,66,48,48,66,67,48,67,49,49,67,68,49,68,50,50,68,69,50,69,51,51,69,70,51,70,52,52,70,71,52,71,
53,53,71,72,53,72,54,54,72,55,54,55,37,55,73,74,55,74,56,56,74,75,56,75,57,57,75,76,57,76,58,58,76,77,
58,77,59,120,121,78,122,78,60,60,78,79,60,79,61,61,79,80,61,80,62,62,80,81,62,81,63,63,81,82,63,82,64,
64,82,83,64,83,65,65,83,84,65,84,66,66,84,85,66,85,67,67,85,86,67,86,68,68,86,87,68,87,69,69,87,88,69,
88,70,70,88,89,70,89,71,71,89,90,71,90,72,72,90,73,72,73,55,73,91,92,73,92,74,74,92,93,74,93,75,75,93,
94,75,94,76,76,94,95,76,95,77,123,124,96,125,96,78,78,96,97,78,97,79,79,97,98,79,98,80,80,98,99,80,99,
81,81,99,100,81,100,82,82,100,101,82,101,83,83,101,102,83,102,84,84,102,103,84,103,85,85,103,104,85,104,
86,86,104,105,86,105,87,87,105,106,87,106,88,88,106,107,88,107,89,89,107,108,89,108,90,90,108,91,90,91,
73,109,146,145,109,147,146,109,148,147,109,149,148,109,150,126,109,151,150,109,152,151,109,153,152,109,
154,153,109,155,154,109,156,155,109,157,156,109,158,157,109,159,158,109,160,159,109,161,160,109,162,161,
109,145,162
  );

constructor TdxCylinder.Create(AOwner: TComponent);
begin
  inherited;
  SetLength(Data.MeshVertices, Length(CylinderVertices));
  Move(CylinderVertices[0], Data.MeshVertices[0], SizeOf(CylinderVertices));
  SetLength(Data.MeshIndices, Length(CylinderIndices));
  Move(CylinderIndices[0], Data.MeshIndices[0], SizeOf(CylinderIndices));
end;

procedure TdxCylinder.CreateBody;
begin
  if (Scene <> nil) and (Scene.Physics = nil) then
    Scene.CreatePhysics;
  if (Collider or Dynamic) and (Scene.Physics <> nil) then
  begin
    FBody := Scene.Physics.CreateCylinder(Self, dxVector(Width, Height, Depth));
  end;
end;

procedure TdxCylinder.Paint;
begin
  inherited;
end;

{ TdxRoundCube }

const

  RoundCubeVertices: array [0..201] of TdxTexVertexNormal = (
    (x:-0.42; y:0.42; z:0.5; nx:-0.0184349; ny:0.00943183; nz:1.5144; tu:0.08; tv:0.08; ),
    (x:0.42; y:0.42; z:0.5; nx:0.00943183; ny:0.0184349; nz:0.8088; tu:0.92; tv:0.08; ),
    (x:-0.42; y:-0.42; z:0.5; nx:-0.00943183; ny:-0.0184349; nz:0.8088; tu:0.08; tv:0.92; ),
    (x:0.42; y:-0.42; z:0.5; nx:0.0184349; ny:-0.00943183; nz:1.5144; tu:0.92; tv:0.92; ),
    (x:-0.42; y:0.46; z:0.489282; nx:-0.000486155; ny:0.0444174; nz:0.0941968; tu:0.08; tv:0.04; ),
    (x:-0.44; y:0.454641; z:0.489282; nx:-0.00154256; ny:0.0021282; nz:0.00378564; tu:0.06; tv:0.045359; ),
    (x:-0.454641; y:0.44; z:0.489282; nx:-0.00239999; ny:0.00107179; nz:0.00378564; tu:0.045359; tv:0.0599999; ),
    (x:-0.46; y:0.42; z:0.489282; nx:-0.0589968; ny:0.000214357; nz:0.0841794; tu:0.04; tv:0.08; ),
    (x:-0.46; y:-0.42; z:0.489282; nx:-0.0444174; ny:-0.000486152; nz:0.0941968; tu:0.04; tv:0.92; ),
    (x:-0.454641; y:-0.44; z:0.489282; nx:-0.0021282; ny:-0.00154256; nz:0.00378564; tu:0.045359; tv:0.94; ),
    (x:-0.44; y:-0.454641; z:0.489282; nx:-0.0010718; ny:-0.0024; nz:0.00378564; tu:0.06; tv:0.954641; ),
    (x:-0.42; y:-0.46; z:0.489282; nx:-0.00021436; ny:-0.0589968; nz:0.0841795; tu:0.08; tv:0.96; ),
    (x:0.42; y:-0.46; z:0.489282; nx:0.000486156; ny:-0.0444174; nz:0.0941969; tu:0.92; tv:0.96; ),
    (x:0.44; y:-0.454641; z:0.489282; nx:0.00154256; ny:-0.0021282; nz:0.00378564; tu:0.94; tv:0.954641; ),
    (x:0.454641; y:-0.44; z:0.489282; nx:0.0024; ny:-0.0010718; nz:0.00378564; tu:0.954641; tv:0.94; ),
    (x:0.46; y:-0.42; z:0.489282; nx:0.0589968; ny:-0.000214359; nz:0.0841795; tu:0.96; tv:0.92; ),
    (x:0.46; y:0.42; z:0.489282; nx:0.0444174; ny:0.000486156; nz:0.0941969; tu:0.96; tv:0.08; ),
    (x:0.454641; y:0.44; z:0.489282; nx:0.0021282; ny:0.00154256; nz:0.00378564; tu:0.954641; tv:0.06; ),
    (x:0.44; y:0.454641; z:0.489282; nx:0.00107179; ny:0.0024; nz:0.00378564; tu:0.94; tv:0.045359; ),
    (x:0.42; y:0.46; z:0.489282; nx:0.000214357; ny:0.0589968; nz:0.0841794; tu:0.92; tv:0.04; ),
    (x:-0.42; y:0.489282; z:0.46; nx:-0.00107179; ny:0.0867937; nz:0.0600113; tu:0.08; tv:0.010718; ),
    (x:-0.454641; y:0.48; z:0.46; nx:-0.0037282; ny:0.00591384; nz:0.00378564; tu:0.045359; tv:0.02; ),
    (x:-0.48; y:0.454641; z:0.46; nx:-0.00618564; ny:0.00325743; nz:0.00378564; tu:0.02; tv:0.045359; ),
    (x:-0.489282; y:0.42; z:0.46; nx:-0.0947825; ny:0.000799995; nz:0.0445744; tu:0.010718; tv:0.08; ),
    (x:-0.489282; y:-0.42; z:0.46; nx:-0.0867937; ny:-0.00107179; nz:0.0600113; tu:0.010718; tv:0.92; ),
    (x:-0.48; y:-0.454641; z:0.46; nx:-0.00591384; ny:-0.0037282; nz:0.00378564; tu:0.02; tv:0.954641; ),
    (x:-0.454641; y:-0.48; z:0.46; nx:-0.00325744; ny:-0.00618564; nz:0.00378564; tu:0.045359; tv:0.98; ),
    (x:-0.42; y:-0.489282; z:0.46; nx:-0.000800001; ny:-0.0947825; nz:0.0445743; tu:0.08; tv:0.989282; ),
    (x:0.42; y:-0.489282; z:0.46; nx:0.0010718; ny:-0.0867937; nz:0.0600112; tu:0.92; tv:0.989282; ),
    (x:0.454641; y:-0.48; z:0.46; nx:0.0037282; ny:-0.00591384; nz:0.00378564; tu:0.954641; tv:0.98; ),
    (x:0.48; y:-0.454641; z:0.46; nx:0.00618564; ny:-0.00325743; nz:0.00378564; tu:0.98; tv:0.954641; ),
    (x:0.489282; y:-0.42; z:0.46; nx:0.0947825; ny:-0.000800001; nz:0.0445743; tu:0.989282; tv:0.92; ),
    (x:0.489282; y:0.42; z:0.46; nx:0.0867937; ny:0.0010718; nz:0.0600112; tu:0.989282; tv:0.08; ),
    (x:0.48; y:0.454641; z:0.46; nx:0.00591384; ny:0.0037282; nz:0.00378564; tu:0.98; tv:0.045359; ),
    (x:0.454641; y:0.48; z:0.46; nx:0.00325743; ny:0.00618564; nz:0.00378564; tu:0.954641; tv:0.02; ),
    (x:0.42; y:0.489282; z:0.46; nx:0.000799995; ny:0.0947825; nz:0.0445744; tu:0.92; tv:0.010718; ),
    (x:-0.42; y:0.5; z:0.42; nx:-0.00042872; ny:0.0688001; nz:0.0184349; tu:0.08; tv:0; ),
    (x:-0.46; y:0.489282; z:0.42; nx:-0.00197128; ny:0.00415692; nz:0.00122871; tu:0.04; tv:0.010718; ),
    (x:-0.489282; y:0.46; z:0.42; nx:-0.00378564; ny:0.00261436; nz:0.00122871; tu:0.010718; tv:0.04; ),
    (x:-0.5; y:0.42; z:0.42; nx:-0.0365857; ny:0.0008; nz:0.00980311; tu:0; tv:0.08; ),
    (x:-0.5; y:-0.42; z:0.42; nx:-0.0688001; ny:-0.00042872; nz:0.0184349; tu:0; tv:0.92; ),
    (x:-0.489282; y:-0.46; z:0.42; nx:-0.00415693; ny:-0.00197128; nz:0.00122872; tu:0.010718; tv:0.96; ),
    (x:-0.46; y:-0.489282; z:0.42; nx:-0.00261436; ny:-0.00378564; nz:0.00122872; tu:0.04; tv:0.989282; ),
    (x:-0.42; y:-0.5; z:0.42; nx:-0.0008; ny:-0.0365857; nz:0.00980306; tu:0.08; tv:1; ),
    (x:0.42; y:-0.5; z:0.42; nx:0.000428717; ny:-0.0688001; nz:0.0184348; tu:0.92; tv:1; ),
    (x:0.46; y:-0.489282; z:0.42; nx:0.00197128; ny:-0.00415692; nz:0.00122872; tu:0.96; tv:0.989282; ),
    (x:0.489282; y:-0.46; z:0.42; nx:0.00378564; ny:-0.00261436; nz:0.00122872; tu:0.989282; tv:0.96; ),
    (x:0.5; y:-0.42; z:0.42; nx:0.0365857; ny:-0.0008; nz:0.00980306; tu:1; tv:0.92; ),
    (x:0.5; y:0.42; z:0.42; nx:0.0688; ny:0.000428717; nz:0.0184348; tu:1; tv:0.08; ),
    (x:0.489282; y:0.46; z:0.42; nx:0.00415692; ny:0.00197128; nz:0.00122872; tu:0.989282; tv:0.04; ),
    (x:0.46; y:0.489282; z:0.42; nx:0.00261436; ny:0.00378564; nz:0.00122872; tu:0.96; tv:0.010718; ),
    (x:0.42; y:0.5; z:0.42; nx:0.0008; ny:0.0365857; nz:0.00980311; tu:0.92; tv:0; ),
    (x:-0.42; y:0.5; z:-0.42; nx:-0.00900311; ny:0.0336; nz:0; tu:0; tv:1; ),
    (x:-0.46; y:0.489282; z:-0.42; nx:-0.0426031; ny:0.0917968; nz:0; tu:0.00991422; tv:1; ),
    (x:-0.489282; y:0.46; z:-0.42; nx:-0.0827938; ny:0.0581969; nz:0; tu:0.0198284; tv:1; ),
    (x:-0.5; y:0.42; z:-0.42; nx:-0.7728; ny:0.0180062; nz:0; tu:0.0297427; tv:1; ),
    (x:-0.5; y:-0.42; z:-0.42; nx:-1.4448; ny:-0.00900311; nz:0; tu:0.230847; tv:1; ),
    (x:-0.489282; y:-0.46; z:-0.42; nx:-0.0917969; ny:-0.0426031; nz:0; tu:0.240761; tv:1; ),
    (x:-0.46; y:-0.489282; z:-0.42; nx:-0.0581969; ny:-0.0827938; nz:0; tu:0.250676; tv:1; ),
    (x:-0.42; y:-0.5; z:-0.42; nx:-0.0180061; ny:-0.7728; nz:0; tu:0.26059; tv:1; ),
    (x:0.42; y:-0.5; z:-0.42; nx:0.00900306; ny:-1.4448; nz:0; tu:0.461694; tv:1; ),
    (x:0.46; y:-0.489282; z:-0.42; nx:0.042603; ny:-0.0917969; nz:0; tu:0.471609; tv:1; ),
    (x:0.489282; y:-0.46; z:-0.42; nx:0.0827938; ny:-0.0581969; nz:0; tu:0.481523; tv:1; ),
    (x:0.5; y:-0.42; z:-0.42; nx:0.7728; ny:-0.0180061; nz:0; tu:0.491437; tv:1; ),
    (x:0.5; y:0.42; z:-0.42; nx:1.4448; ny:0.00900306; nz:0; tu:0.692542; tv:1; ),
    (x:0.489282; y:0.46; z:-0.42; nx:0.0917968; ny:0.042603; nz:0; tu:0.702456; tv:1; ),
    (x:0.46; y:0.489282; z:-0.42; nx:0.0581969; ny:0.0827938; nz:0; tu:0.71237; tv:1; ),
    (x:0.42; y:0.5; z:-0.42; nx:0.0180062; ny:0.7728; nz:0; tu:0.722284; tv:1; ),
    (x:-0.42; y:0.489282; z:-0.46; nx:-0.000799998; ny:0.0947825; nz:-0.0445744; tu:0.08; tv:0.989282; ),
    (x:-0.454641; y:0.48; z:-0.46; nx:-0.00325744; ny:0.00618564; nz:-0.00378564; tu:0.045359; tv:0.98; ),
    (x:-0.48; y:0.454641; z:-0.46; nx:-0.00591384; ny:0.0037282; nz:-0.00378563; tu:0.02; tv:0.954641; ),
    (x:-0.489282; y:0.42; z:-0.46; nx:-0.0867938; ny:0.00107179; nz:-0.0600113; tu:0.010718; tv:0.92; ),
    (x:-0.489282; y:-0.42; z:-0.46; nx:-0.0947825; ny:-0.000799996; nz:-0.0445744; tu:0.010718; tv:0.08; ),
    (x:-0.48; y:-0.454641; z:-0.46; nx:-0.00618564; ny:-0.00325744; nz:-0.00378564; tu:0.02; tv:0.045359; ),
    (x:-0.454641; y:-0.48; z:-0.46; nx:-0.0037282; ny:-0.00591384; nz:-0.00378564; tu:0.045359; tv:0.02; ),
    (x:-0.42; y:-0.489282; z:-0.46; nx:-0.0010718; ny:-0.0867938; nz:-0.0600112; tu:0.08; tv:0.010718; ),
    (x:0.42; y:-0.489282; z:-0.46; nx:0.000800002; ny:-0.0947825; nz:-0.0445743; tu:0.92; tv:0.010718; ),
    (x:0.454641; y:-0.48; z:-0.46; nx:0.00325744; ny:-0.00618564; nz:-0.00378564; tu:0.954641; tv:0.02; ),
    (x:0.48; y:-0.454641; z:-0.46; nx:0.00591384; ny:-0.0037282; nz:-0.00378564; tu:0.98; tv:0.045359; ),
    (x:0.489282; y:-0.42; z:-0.46; nx:0.0867938; ny:-0.0010718; nz:-0.0600112; tu:0.989282; tv:0.08; ),
    (x:0.489282; y:0.42; z:-0.46; nx:0.0947825; ny:0.000800001; nz:-0.0445743; tu:0.989282; tv:0.92; ),
    (x:0.48; y:0.454641; z:-0.46; nx:0.00618564; ny:0.00325744; nz:-0.00378564; tu:0.98; tv:0.954641; ),
    (x:0.454641; y:0.48; z:-0.46; nx:0.0037282; ny:0.00591384; nz:-0.00378564; tu:0.954641; tv:0.98; ),
    (x:0.42; y:0.489282; z:-0.46; nx:0.00107179; ny:0.0867938; nz:-0.0600113; tu:0.92; tv:0.989282; ),
    (x:-0.42; y:0.46; z:-0.489282; nx:-0.00021436; ny:0.0589969; nz:-0.0841794; tu:0.08; tv:0.96; ),
    (x:-0.44; y:0.454641; z:-0.489282; nx:-0.00107179; ny:0.0024; nz:-0.00378564; tu:0.06; tv:0.954641; ),
    (x:-0.454641; y:0.44; z:-0.489282; nx:-0.0021282; ny:0.00154256; nz:-0.00378564; tu:0.045359; tv:0.94; ),
    (x:-0.46; y:0.42; z:-0.489282; nx:-0.0444174; ny:0.000486153; nz:-0.0941968; tu:0.04; tv:0.92; ),
    (x:-0.46; y:-0.42; z:-0.489282; nx:-0.0589969; ny:-0.000214357; nz:-0.0841794; tu:0.04; tv:0.08; ),
    (x:-0.454641; y:-0.44; z:-0.489282; nx:-0.0024; ny:-0.00107179; nz:-0.00378564; tu:0.045359; tv:0.06; ),
    (x:-0.44; y:-0.454641; z:-0.489282; nx:-0.00154256; ny:-0.0021282; nz:-0.00378564; tu:0.06; tv:0.045359; ),
    (x:-0.42; y:-0.46; z:-0.489282; nx:-0.000486157; ny:-0.0444174; nz:-0.0941969; tu:0.08; tv:0.04; ),
    (x:0.42; y:-0.46; z:-0.489282; nx:0.00021436; ny:-0.0589969; nz:-0.0841795; tu:0.92; tv:0.04; ),
    (x:0.44; y:-0.454641; z:-0.489282; nx:0.0010718; ny:-0.0024; nz:-0.00378564; tu:0.94; tv:0.045359; ),
    (x:0.454641; y:-0.44; z:-0.489282; nx:0.0021282; ny:-0.00154256; nz:-0.00378564; tu:0.954641; tv:0.06; ),
    (x:0.46; y:-0.42; z:-0.489282; nx:0.0444174; ny:-0.000486157; nz:-0.0941969; tu:0.96; tv:0.08; ),
    (x:0.46; y:0.42; z:-0.489282; nx:0.0589969; ny:0.000214359; nz:-0.0841795; tu:0.96; tv:0.92; ),
    (x:0.454641; y:0.44; z:-0.489282; nx:0.0024; ny:0.0010718; nz:-0.00378564; tu:0.954641; tv:0.94; ),
    (x:0.44; y:0.454641; z:-0.489282; nx:0.00154256; ny:0.0021282; nz:-0.00378564; tu:0.94; tv:0.954641; ),
    (x:0.42; y:0.46; z:-0.489282; nx:0.000486153; ny:0.0444174; nz:-0.0941968; tu:0.92; tv:0.96; ),
    (x:0.42; y:-0.42; z:-0.5; nx:0.0094318; ny:-0.0184349; nz:-0.8088; tu:0.92; tv:0.08; ),
    (x:-0.42; y:-0.42; z:-0.5; nx:-0.0184349; ny:-0.0094318; nz:-1.5144; tu:0.08; tv:0.08; ),
    (x:0.42; y:0.42; z:-0.5; nx:0.0184349; ny:0.0094318; nz:-1.5144; tu:0.92; tv:0.92; ),
    (x:-0.42; y:0.42; z:-0.5; nx:-0.0094318; ny:0.0184349; nz:-0.8088; tu:0.08; tv:0.92; ),
    (x:-0.42; y:0.5; z:0.42; nx:-0.00900311; ny:0.0336; nz:0; tu:0; tv:0; ),
    (x:-0.42; y:0.5; z:0.42; nx:-0.00900311; ny:0.0336; nz:0; tu:0; tv:0; ),
    (x:-0.46; y:0.489282; z:0.42; nx:-0.00900311; ny:0.0336; nz:0; tu:0.00991422; tv:0; ),
    (x:-0.46; y:0.489282; z:0.42; nx:-0.0245969; ny:0.0245969; nz:0; tu:0.00991422; tv:0; ),
    (x:-0.46; y:0.489282; z:0.42; nx:-0.0245969; ny:0.0245969; nz:0; tu:0.00991422; tv:0; ),
    (x:-0.489282; y:0.46; z:0.42; nx:-0.0245969; ny:0.0245969; nz:0; tu:0.0198284; tv:0; ),
    (x:-0.489282; y:0.46; z:0.42; nx:-0.0336; ny:0.00900311; nz:0; tu:0.0198284; tv:0; ),
    (x:-0.489282; y:0.46; z:0.42; nx:-0.0336; ny:0.00900311; nz:0; tu:0.0198284; tv:0; ),
    (x:-0.5; y:0.42; z:0.42; nx:-0.0336; ny:0.00900311; nz:0; tu:0.0297427; tv:0; ),
    (x:-0.5; y:0.42; z:0.42; nx:-0.7056; ny:0; nz:0; tu:0.0297427; tv:0; ),
    (x:-0.5; y:0.42; z:0.42; nx:-0.7056; ny:0; nz:0; tu:0.0297427; tv:0; ),
    (x:-0.5; y:-0.42; z:0.42; nx:-0.7056; ny:0; nz:0; tu:0.230847; tv:0; ),
    (x:-0.5; y:-0.42; z:0.42; nx:-0.0336; ny:-0.00900311; nz:0; tu:0.230847; tv:0; ),
    (x:-0.5; y:-0.42; z:0.42; nx:-0.0336; ny:-0.00900311; nz:0; tu:0.230847; tv:0; ),
    (x:-0.489282; y:-0.46; z:0.42; nx:-0.0336; ny:-0.00900311; nz:0; tu:0.240761; tv:0; ),
    (x:-0.489282; y:-0.46; z:0.42; nx:-0.0245969; ny:-0.0245969; nz:0; tu:0.240761; tv:0; ),
    (x:-0.489282; y:-0.46; z:0.42; nx:-0.0245969; ny:-0.0245969; nz:0; tu:0.240761; tv:0; ),
    (x:-0.46; y:-0.489282; z:0.42; nx:-0.0245969; ny:-0.0245969; nz:0; tu:0.250676; tv:0; ),
    (x:-0.46; y:-0.489282; z:0.42; nx:-0.00900306; ny:-0.0336; nz:0; tu:0.250676; tv:0; ),
    (x:-0.46; y:-0.489282; z:0.42; nx:-0.00900306; ny:-0.0336; nz:0; tu:0.250676; tv:0; ),
    (x:-0.42; y:-0.5; z:0.42; nx:-0.00900306; ny:-0.0336; nz:0; tu:0.26059; tv:0; ),
    (x:-0.42; y:-0.5; z:0.42; nx:0; ny:-0.7056; nz:0; tu:0.26059; tv:0; ),
    (x:-0.42; y:-0.5; z:0.42; nx:0; ny:-0.7056; nz:0; tu:0.26059; tv:0; ),
    (x:0.42; y:-0.5; z:0.42; nx:0; ny:-0.7056; nz:0; tu:0.461694; tv:0; ),
    (x:0.42; y:-0.5; z:0.42; nx:0.00900306; ny:-0.0336; nz:0; tu:0.461694; tv:0; ),
    (x:0.42; y:-0.5; z:0.42; nx:0.00900306; ny:-0.0336; nz:0; tu:0.461694; tv:0; ),
    (x:0.46; y:-0.489282; z:0.42; nx:0.00900306; ny:-0.0336; nz:0; tu:0.471609; tv:0; ),
    (x:0.46; y:-0.489282; z:0.42; nx:0.0245969; ny:-0.0245969; nz:0; tu:0.471609; tv:0; ),
    (x:0.46; y:-0.489282; z:0.42; nx:0.0245969; ny:-0.0245969; nz:0; tu:0.471609; tv:0; ),
    (x:0.489282; y:-0.46; z:0.42; nx:0.0245969; ny:-0.0245969; nz:0; tu:0.481523; tv:0; ),
    (x:0.489282; y:-0.46; z:0.42; nx:0.0336; ny:-0.00900306; nz:0; tu:0.481523; tv:0; ),
    (x:0.489282; y:-0.46; z:0.42; nx:0.0336; ny:-0.00900306; nz:0; tu:0.481523; tv:0; ),
    (x:0.5; y:-0.42; z:0.42; nx:0.0336; ny:-0.00900306; nz:0; tu:0.491437; tv:0; ),
    (x:0.5; y:-0.42; z:0.42; nx:0.7056; ny:0; nz:0; tu:0.491437; tv:0; ),
    (x:0.5; y:-0.42; z:0.42; nx:0.7056; ny:0; nz:0; tu:0.491437; tv:0; ),
    (x:0.5; y:0.42; z:0.42; nx:0.7056; ny:0; nz:0; tu:0.692542; tv:0; ),
    (x:0.5; y:0.42; z:0.42; nx:0.0336; ny:0.00900306; nz:0; tu:0.692542; tv:0; ),
    (x:0.5; y:0.42; z:0.42; nx:0.0336; ny:0.00900306; nz:0; tu:0.692542; tv:0; ),
    (x:0.489282; y:0.46; z:0.42; nx:0.0336; ny:0.00900306; nz:0; tu:0.702456; tv:0; ),
    (x:0.489282; y:0.46; z:0.42; nx:0.0245969; ny:0.0245969; nz:0; tu:0.702456; tv:0; ),
    (x:0.489282; y:0.46; z:0.42; nx:0.0245969; ny:0.0245969; nz:0; tu:0.702456; tv:0; ),
    (x:0.46; y:0.489282; z:0.42; nx:0.0245969; ny:0.0245969; nz:0; tu:0.71237; tv:0; ),
    (x:0.46; y:0.489282; z:0.42; nx:0.00900311; ny:0.0336; nz:0; tu:0.71237; tv:0; ),
    (x:0.46; y:0.489282; z:0.42; nx:0.00900311; ny:0.0336; nz:0; tu:0.71237; tv:0; ),
    (x:0.42; y:0.5; z:0.42; nx:0.00900311; ny:0.0336; nz:0; tu:0.722284; tv:0; ),
    (x:0.42; y:0.5; z:0.42; nx:0; ny:0.7056; nz:0; tu:0.722284; tv:0; ),
    (x:-0.42; y:0.5; z:-0.42; nx:0; ny:0.7056; nz:0; tu:1; tv:1; ),
    (x:0.42; y:0.5; z:0.42; nx:0; ny:0.7056; nz:0; tu:0.722284; tv:0; ),
    (x:-0.42; y:0.5; z:-0.42; nx:0; ny:0.7056; nz:0; tu:1; tv:1; ),
    (x:-0.42; y:0.5; z:0.42; nx:0; ny:0.7056; nz:0; tu:1; tv:0; ),
    (x:-0.42; y:0.5; z:-0.42; nx:-0.00037128; ny:0.00138564; nz:-0.000371282; tu:0.08; tv:1; ),
    (x:-0.42; y:0.5; z:-0.42; nx:-0.00042872; ny:0.0016; nz:-0.000428716; tu:0.08; tv:1; ),
    (x:-0.46; y:0.489282; z:-0.42; nx:-0.00042872; ny:0.0016; nz:-0.000428716; tu:0.04; tv:0.989282; ),
    (x:-0.46; y:0.489282; z:-0.42; nx:-0.00101436; ny:0.00101436; nz:-0.000371279; tu:0.04; tv:0.989282; ),
    (x:-0.46; y:0.489282; z:-0.42; nx:-0.00117128; ny:0.00117128; nz:-0.000428718; tu:0.04; tv:0.989282; ),
    (x:-0.489282; y:0.46; z:-0.42; nx:-0.00117128; ny:0.00117128; nz:-0.000428718; tu:0.010718; tv:0.96; ),
    (x:-0.489282; y:0.46; z:-0.42; nx:-0.00138564; ny:0.00037128; nz:-0.000371279; tu:0.010718; tv:0.96; ),
    (x:-0.489282; y:0.46; z:-0.42; nx:-0.0016; ny:0.000428719; nz:-0.000428719; tu:0.010718; tv:0.96; ),
    (x:-0.5; y:0.42; z:-0.42; nx:-0.0016; ny:0.000428719; nz:-0.000428719; tu:0; tv:0.92; ),
    (x:-0.5; y:0.42; z:-0.42; nx:-0.0336; ny:0; nz:-0.00900311; tu:0; tv:0.92; ),
    (x:-0.5; y:0.42; z:-0.42; nx:-0.0336; ny:0; nz:-0.00900311; tu:0; tv:0.92; ),
    (x:-0.5; y:-0.42; z:-0.42; nx:-0.0336; ny:0; nz:-0.00900311; tu:0; tv:0.08; ),
    (x:-0.5; y:-0.42; z:-0.42; nx:-0.00138564; ny:-0.00037128; nz:-0.000371282; tu:0; tv:0.08; ),
    (x:-0.5; y:-0.42; z:-0.42; nx:-0.0016; ny:-0.00042872; nz:-0.000428718; tu:0; tv:0.08; ),
    (x:-0.489282; y:-0.46; z:-0.42; nx:-0.0016; ny:-0.00042872; nz:-0.000428718; tu:0.010718; tv:0.04; ),
    (x:-0.489282; y:-0.46; z:-0.42; nx:-0.00101436; ny:-0.00101436; nz:-0.00037128; tu:0.010718; tv:0.04; ),
    (x:-0.489282; y:-0.46; z:-0.42; nx:-0.00117128; ny:-0.00117128; nz:-0.000428718; tu:0.010718; tv:0.04; ),
    (x:-0.46; y:-0.489282; z:-0.42; nx:-0.00117128; ny:-0.00117128; nz:-0.000428718; tu:0.04; tv:0.010718; ),
    (x:-0.46; y:-0.489282; z:-0.42; nx:-0.000371282; ny:-0.00138564; nz:-0.000371282; tu:0.04; tv:0.010718; ),
    (x:-0.46; y:-0.489282; z:-0.42; nx:-0.000428717; ny:-0.0016; nz:-0.000428717; tu:0.04; tv:0.010718; ),
    (x:-0.42; y:-0.5; z:-0.42; nx:-0.000428717; ny:-0.0016; nz:-0.000428717; tu:0.08; tv:0; ),
    (x:-0.42; y:-0.5; z:-0.42; nx:0; ny:-0.0336; nz:-0.00900306; tu:0.08; tv:0; ),
    (x:-0.42; y:-0.5; z:-0.42; nx:0; ny:-0.0336; nz:-0.00900306; tu:0.08; tv:0; ),
    (x:0.42; y:-0.5; z:-0.42; nx:0; ny:-0.0336; nz:-0.00900306; tu:0.92; tv:0; ),
    (x:0.42; y:-0.5; z:-0.42; nx:0.000371282; ny:-0.00138564; nz:-0.00037128; tu:0.92; tv:0; ),
    (x:0.42; y:-0.5; z:-0.42; nx:0.000428717; ny:-0.0016; nz:-0.000428719; tu:0.92; tv:0; ),
    (x:0.46; y:-0.489282; z:-0.42; nx:0.000428717; ny:-0.0016; nz:-0.000428719; tu:0.96; tv:0.010718; ),
    (x:0.46; y:-0.489282; z:-0.42; nx:0.00101436; ny:-0.00101436; nz:-0.000371281; tu:0.96; tv:0.010718; ),
    (x:0.46; y:-0.489282; z:-0.42; nx:0.00117128; ny:-0.00117128; nz:-0.00042872; tu:0.96; tv:0.010718; ),
    (x:0.489282; y:-0.46; z:-0.42; nx:0.00117128; ny:-0.00117128; nz:-0.00042872; tu:0.989282; tv:0.04; ),
    (x:0.489282; y:-0.46; z:-0.42; nx:0.00138564; ny:-0.000371282; nz:-0.000371282; tu:0.989282; tv:0.04; ),
    (x:0.489282; y:-0.46; z:-0.42; nx:0.0016; ny:-0.000428717; nz:-0.000428717; tu:0.989282; tv:0.04; ),
    (x:0.5; y:-0.42; z:-0.42; nx:0.0016; ny:-0.000428717; nz:-0.000428717; tu:1; tv:0.08; ),
    (x:0.5; y:-0.42; z:-0.42; nx:0.0336; ny:0; nz:-0.00900306; tu:1; tv:0.08; ),
    (x:0.5; y:-0.42; z:-0.42; nx:0.0336; ny:0; nz:-0.00900306; tu:1; tv:0.08; ),
    (x:0.5; y:0.42; z:-0.42; nx:0.0336; ny:0; nz:-0.00900306; tu:1; tv:0.92; ),
    (x:0.5; y:0.42; z:-0.42; nx:0.00138564; ny:0.000371282; nz:-0.00037128; tu:1; tv:0.92; ),
    (x:0.5; y:0.42; z:-0.42; nx:0.0016; ny:0.000428717; nz:-0.000428718; tu:1; tv:0.92; ),
    (x:0.489282; y:0.46; z:-0.42; nx:0.0016; ny:0.000428717; nz:-0.000428718; tu:0.989282; tv:0.96; ),
    (x:0.489282; y:0.46; z:-0.42; nx:0.00101436; ny:0.00101436; nz:-0.00037128; tu:0.989282; tv:0.96; ),
    (x:0.489282; y:0.46; z:-0.42; nx:0.00117128; ny:0.00117128; nz:-0.000428717; tu:0.989282; tv:0.96; ),
    (x:0.46; y:0.489282; z:-0.42; nx:0.00117128; ny:0.00117128; nz:-0.000428717; tu:0.96; tv:0.989282; ),
    (x:0.46; y:0.489282; z:-0.42; nx:0.00037128; ny:0.00138564; nz:-0.00037128; tu:0.96; tv:0.989282; ),
    (x:0.46; y:0.489282; z:-0.42; nx:0.000428719; ny:0.0016; nz:-0.00042872; tu:0.96; tv:0.989282; ),
    (x:0.42; y:0.5; z:-0.42; nx:0.000428719; ny:0.0016; nz:-0.00042872; tu:0.92; tv:1; ),
    (x:0.42; y:0.5; z:-0.42; nx:0; ny:0.0336; nz:-0.00900311; tu:0.92; tv:1; ),
    (x:0.42; y:0.5; z:-0.42; nx:0; ny:0.0336; nz:-0.00900311; tu:0.92; tv:1; ),
    (x:-0.42; y:0.5; z:-0.42; nx:0; ny:0.0336; nz:-0.00900311; tu:0.08; tv:1; )
    );

  RoundCubeIndices: array [0..611] of Word = (
    0,3,2,0,1,3,0,5,4,0,6,5,0,7,6,0,8,7,0,2,8,2,9,8,2,10,9,2,11,10,2,12,11,2,3,12,3,13,12,3,14,13,3,15,14,
    3,16,15,3,1,16,1,17,16,1,18,17,1,19,18,1,4,19,1,0,4,4,21,20,4,5,21,5,22,21,5,6,22,6,23,22,6,7,23,7,24,
    23,7,8,24,8,25,24,8,9,25,9,26,25,9,10,26,10,27,26,10,11,27,11,28,27,11,12,28,12,29,28,12,13,29,13,30,
    29,13,14,30,14,31,30,14,15,31,15,32,31,15,16,32,16,33,32,16,17,33,17,34,33,17,18,34,18,35,34,18,19,35,
    19,20,35,19,4,20,20,37,36,20,21,37,21,38,37,21,22,38,22,39,38,22,23,39,23,40,39,23,24,40,24,41,40,24,
    25,41,25,42,41,25,26,42,26,43,42,26,27,43,27,44,43,27,28,44,28,45,44,28,29,45,29,46,45,29,30,46,30,47,
    46,30,31,47,31,48,47,31,32,48,32,49,48,32,33,49,33,50,49,33,34,50,34,51,50,34,35,51,35,36,51,35,20,36,
    104,53,52,105,106,53,107,54,53,108,109,54,110,55,54,111,112,55,113,56,55,114,115,56,116,57,56,117,118,
    57,119,58,57,120,121,58,122,59,58,123,124,59,125,60,59,126,127,60,128,61,60,129,130,61,131,62,61,132,
    133,62,134,63,62,135,136,63,137,64,63,138,139,64,140,65,64,141,142,65,143,66,65,144,145,66,146,67,66,
    147,148,67,149,150,67,151,153,152,154,69,68,155,156,69,157,70,69,158,159,70,160,71,70,161,162,71,163,
    72,71,164,165,72,166,73,72,167,168,73,169,74,73,170,171,74,172,75,74,173,174,75,175,76,75,176,177,76,
    178,77,76,179,180,77,181,78,77,182,183,78,184,79,78,185,186,79,187,80,79,188,189,80,190,81,80,191,192,
    81,193,82,81,194,195,82,196,83,82,197,198,83,199,68,83,200,201,68,68,85,84,68,69,85,69,86,85,69,70,86,
    70,87,86,70,71,87,71,88,87,71,72,88,72,89,88,72,73,89,73,90,89,73,74,90,74,91,90,74,75,91,75,92,91,75,
    76,92,76,93,92,76,77,93,77,94,93,77,78,94,78,95,94,78,79,95,79,96,95,79,80,96,80,97,96,80,81,97,81,98,
    97,81,82,98,82,99,98,82,83,99,83,84,99,83,68,84,84,85,103,85,86,103,86,87,103,87,101,103,87,88,101,88,
    89,101,89,90,101,90,91,101,91,100,101,91,92,100,92,93,100,93,94,100,94,95,100,95,102,100,95,96,102,96,
    97,102,97,98,102,98,99,102,99,103,102,99,84,103,102,101,100,102,103,101
  );

constructor TdxRoundCube.Create(AOwner: TComponent);
begin
  inherited;
  SetLength(Data.MeshVertices, Length(RoundCubeVertices));
  Move(RoundCubeVertices[0], Data.MeshVertices[0], SizeOf(RoundCubeVertices));
  SetLength(Data.MeshIndices, Length(RoundCubeIndices));
  Move(RoundCubeIndices[0], Data.MeshIndices[0], SizeOf(RoundCubeIndices));
end;

procedure TdxRoundCube.Paint;
begin
  inherited;
end;

{ TdxCone }

const

ConeVertices: array [0..152] of TdxTexVertexNormal = (
(x:-0.5; y:-2.98023E-8; z:0; nx:-1.54509; ny:1.88183E-14; nz:-2.61376E-7; tu:0.5; tv:1; ),
(x:-0.5; y:-2.98023E-8; z:-0.5; nx:-0.154508; ny:-1.11022E-16; nz:-2.59015E-8; tu:0.75; tv:1; ),
(x:-0.5; y:0.154508; z:-0.475528; nx:-0.154509; ny:5.62348E-10; nz:-2.58413E-8; tu:0.8; tv:1; ),
(x:-0.5; y:0.293893; z:-0.404509; nx:-0.154509; ny:4.62649E-10; nz:-2.59881E-8; tu:0.85; tv:1; ),
(x:-0.5; y:0.404508; z:-0.293893; nx:-0.154508; ny:-1.77516E-11; nz:-2.64642E-8; tu:0.9; tv:1; ),
(x:-0.5; y:0.475528; z:-0.154508; nx:-0.0772542; ny:-1.06605E-10; nz:-1.33666E-8; tu:0.95; tv:1; ),
(x:-0.5; y:0.5; z:2.23517E-8; nx:-0.154508; ny:1.47105E-15; nz:-2.6077E-8; tu:2.78275E-8; tv:1; ),
(x:-0.5; y:0.475528; z:0.154508; nx:-0.154508; ny:1.06605E-10; nz:-2.64051E-8; tu:0.05; tv:1; ),
(x:-0.5; y:0.404508; z:0.293893; nx:-0.154509; ny:1.77516E-11; nz:-2.64642E-8; tu:0.1; tv:1; ),
(x:-0.5; y:0.293893; z:0.404509; nx:-0.154509; ny:-4.62646E-10; nz:-2.59882E-8; tu:0.15; tv:1; ),
(x:-0.5; y:0.154508; z:0.475528; nx:-0.154508; ny:-5.62345E-10; nz:-2.58413E-8; tu:0.2; tv:1; ),
(x:-0.5; y:-5.96046E-8; z:0.5; nx:-0.154508; ny:2.44249E-15; nz:-2.59015E-8; tu:0.25; tv:1; ),
(x:-0.5; y:-0.154509; z:0.475528; nx:-0.154509; ny:5.62351E-10; nz:-2.58413E-8; tu:0.3; tv:1; ),
(x:-0.5; y:-0.293893; z:0.404508; nx:-0.154508; ny:4.6265E-10; nz:-2.59881E-8; tu:0.35; tv:1; ),
(x:-0.5; y:-0.404509; z:0.293893; nx:-0.154508; ny:-1.77489E-11; nz:-2.64642E-8; tu:0.4; tv:1; ),
(x:-0.5; y:-0.475528; z:0.154508; nx:-0.154508; ny:-1.06601E-10; nz:-2.64051E-8; tu:0.45; tv:1; ),
(x:-0.5; y:-0.5; z:-6.51926E-8; nx:-0.154508; ny:3.0323E-15; nz:-2.6077E-8; tu:0.5; tv:1; ),
(x:-0.5; y:-0.475528; z:-0.154509; nx:-0.154508; ny:1.06607E-10; nz:-2.64051E-8; tu:0.55; tv:1; ),
(x:-0.5; y:-0.404508; z:-0.293893; nx:-0.154508; ny:1.7756E-11; nz:-2.64642E-8; tu:0.6; tv:1; ),
(x:-0.5; y:-0.293893; z:-0.404509; nx:-0.154508; ny:-4.62644E-10; nz:-2.59881E-8; tu:0.65; tv:1; ),
(x:-0.5; y:-0.154508; z:-0.475528; nx:-0.154508; ny:-5.62345E-10; nz:-2.58413E-8; tu:0.7; tv:1; ),
(x:-0.25; y:-2.98023E-8; z:-0.375; nx:0.086911; ny:-0.00305894; nz:-0.173822; tu:0.75; tv:0.75; ),
(x:-0.25; y:0.115881; z:-0.356646; nx:0.0869111; ny:0.0508047; nz:-0.16626; tu:0.8; tv:0.75; ),
(x:-0.25; y:0.220419; z:-0.303381; nx:0.0869111; ny:0.0996953; nz:-0.142423; tu:0.85; tv:0.75; ),
(x:-0.25; y:0.303381; z:-0.220419; nx:0.086911; ny:0.138827; nz:-0.104645; tu:0.9; tv:0.75; ),
(x:-0.25; y:0.356646; z:-0.115881; nx:0.0482839; ny:0.0871151; nz:-0.0443874; tu:0.95; tv:0.75; ),
(x:-0.25; y:0.375; z:6.14673E-8; nx:0.086911; ny:0.173822; nz:-0.00305895; tu:2.78275E-8; tv:0.75; ),
(x:-0.25; y:0.356646; z:0.115881; nx:0.086911; ny:0.16626; nz:0.0508048; tu:0.05; tv:0.75; ),
(x:-0.25; y:0.303381; z:0.22042; nx:0.086911; ny:0.142423; nz:0.0996953; tu:0.1; tv:0.75; ),
(x:-0.25; y:0.220419; z:0.303381; nx:0.086911; ny:0.104645; nz:0.138827; tu:0.15; tv:0.75; ),
(x:-0.25; y:0.115881; z:0.356646; nx:0.086911; ny:0.0566232; nz:0.164369; tu:0.2; tv:0.75; ),
(x:-0.25; y:-5.96046E-8; z:0.375; nx:0.086911; ny:0.00305896; nz:0.173822; tu:0.25; tv:0.75; ),
(x:-0.25; y:-0.115881; z:0.356646; nx:0.086911; ny:-0.0508047; nz:0.16626; tu:0.3; tv:0.75; ),
(x:-0.25; y:-0.22042; z:0.303381; nx:0.086911; ny:-0.0996953; nz:0.142423; tu:0.35; tv:0.75; ),
(x:-0.25; y:-0.303381; z:0.220419; nx:0.086911; ny:-0.138827; nz:0.104645; tu:0.4; tv:0.75; ),
(x:-0.25; y:-0.356646; z:0.115881; nx:0.086911; ny:-0.164369; nz:0.0566232; tu:0.45; tv:0.75; ),
(x:-0.25; y:-0.375; z:-3.72529E-9; nx:0.086911; ny:-0.173822; nz:0.00305896; tu:0.5; tv:0.75; ),
(x:-0.25; y:-0.356646; z:-0.115881; nx:0.0869111; ny:-0.16626; nz:-0.0508047; tu:0.55; tv:0.75; ),
(x:-0.25; y:-0.303381; z:-0.220419; nx:0.0869111; ny:-0.142423; nz:-0.0996953; tu:0.6; tv:0.75; ),
(x:-0.25; y:-0.220419; z:-0.303381; nx:0.0869111; ny:-0.104645; nz:-0.138827; tu:0.65; tv:0.75; ),
(x:-0.25; y:-0.115881; z:-0.356646; nx:0.086911; ny:-0.0566232; nz:-0.164369; tu:0.7; tv:0.75; ),
(x:5.96046E-8; y:-2.98023E-8; z:-0.25; nx:0.0579407; ny:-0.00305896; nz:-0.115881; tu:0.75; tv:0.5; ),
(x:5.96046E-8; y:0.0772542; z:-0.237764; nx:0.0579407; ny:0.0329001; nz:-0.111155; tu:0.8; tv:0.5; ),
(x:5.96046E-8; y:0.146946; z:-0.202254; nx:0.0579407; ny:0.0656386; nz:-0.095548; tu:0.85; tv:0.5; ),
(x:5.96046E-8; y:0.202254; z:-0.146946; nx:0.0579407; ny:0.091952; nz:-0.0705881; tu:0.9; tv:0.5; ),
(x:5.96046E-8; y:0.237764; z:-0.0772542; nx:0.0337987; ny:0.0609806; nz:-0.0310712; tu:0.95; tv:0.5; ),
(x:5.96046E-8; y:0.25; z:1.00583E-7; nx:0.0579407; ny:0.115881; nz:-0.00305895; tu:2.78275E-8; tv:0.5; ),
(x:0; y:0.237764; z:0.0772543; nx:0.0579407; ny:0.111155; nz:0.0329001; tu:0.05; tv:0.5; ),
(x:0; y:0.202254; z:0.146946; nx:0.0579407; ny:0.095548; nz:0.0656386; tu:0.1; tv:0.5; ),
(x:0; y:0.146946; z:0.202254; nx:0.0579407; ny:0.0705881; nz:0.091952; tu:0.15; tv:0.5; ),
(x:0; y:0.0772542; z:0.237764; nx:0.0579407; ny:0.0387186; nz:0.109264; tu:0.2; tv:0.5; ),
(x:0; y:-5.96046E-8; z:0.25; nx:0.0579407; ny:0.00305897; nz:0.115881; tu:0.25; tv:0.5; ),
(x:0; y:-0.0772543; z:0.237764; nx:0.0579407; ny:-0.0329001; nz:0.111155; tu:0.3; tv:0.5; ),
(x:0; y:-0.146946; z:0.202254; nx:0.0579407; ny:-0.0656386; nz:0.095548; tu:0.35; tv:0.5; ),
(x:0; y:-0.202254; z:0.146946; nx:0.0579407; ny:-0.091952; nz:0.0705881; tu:0.4; tv:0.5; ),
(x:0; y:-0.237764; z:0.0772543; nx:0.0579407; ny:-0.109264; nz:0.0387186; tu:0.45; tv:0.5; ),
(x:5.96046E-8; y:-0.25; z:5.58794E-8; nx:0.0579407; ny:-0.115881; nz:0.00305897; tu:0.5; tv:0.5; ),
(x:5.96046E-8; y:-0.237764; z:-0.0772542; nx:0.0579407; ny:-0.111155; nz:-0.0329001; tu:0.55; tv:0.5; ),
(x:5.96046E-8; y:-0.202254; z:-0.146946; nx:0.0579407; ny:-0.095548; nz:-0.0656386; tu:0.6; tv:0.5; ),
(x:5.96046E-8; y:-0.146946; z:-0.202254; nx:0.0579407; ny:-0.0705881; nz:-0.091952; tu:0.65; tv:0.5; ),
(x:5.96046E-8; y:-0.0772542; z:-0.237764; nx:0.0579407; ny:-0.0387185; nz:-0.109264; tu:0.7; tv:0.5; ),
(x:0.25; y:-2.98023E-8; z:-0.125; nx:0.0289703; ny:-0.00305896; nz:-0.0579407; tu:0.75; tv:0.25; ),
(x:0.25; y:0.0386271; z:-0.118882; nx:0.0289704; ny:0.0149954; nz:-0.0560501; tu:0.8; tv:0.25; ),
(x:0.25; y:0.0734731; z:-0.101127; nx:0.0289704; ny:0.0315819; nz:-0.048673; tu:0.85; tv:0.25; ),
(x:0.25; y:0.101127; z:-0.073473; nx:0.0289704; ny:0.045077; nz:-0.0365314; tu:0.9; tv:0.25; ),
(x:0.25; y:0.118882; z:-0.038627; nx:0.0193136; ny:0.034846; nz:-0.017755; tu:0.95; tv:0.25; ),
(x:0.25; y:0.125; z:1.39698E-7; nx:0.0289703; ny:0.0579407; nz:-0.00305897; tu:2.78275E-8; tv:0.25; ),
(x:0.25; y:0.118882; z:0.0386273; nx:0.0289703; ny:0.0560501; nz:0.0149954; tu:0.05; tv:0.25; ),
(x:0.25; y:0.101127; z:0.0734733; nx:0.0289703; ny:0.048673; nz:0.031582; tu:0.1; tv:0.25; ),
(x:0.25; y:0.0734731; z:0.101127; nx:0.0289703; ny:0.0365314; nz:0.045077; tu:0.15; tv:0.25; ),
(x:0.25; y:0.0386271; z:0.118882; nx:0.0289703; ny:0.0208139; nz:0.0541596; tu:0.2; tv:0.25; ),
(x:0.25; y:-2.98023E-8; z:0.125; nx:0.0289703; ny:0.00305897; nz:0.0579407; tu:0.25; tv:0.25; ),
(x:0.25; y:-0.0386272; z:0.118882; nx:0.0289703; ny:-0.0149954; nz:0.0560502; tu:0.3; tv:0.25; ),
(x:0.25; y:-0.0734732; z:0.101127; nx:0.0289703; ny:-0.0315819; nz:0.048673; tu:0.35; tv:0.25; ),
(x:0.25; y:-0.101127; z:0.0734733; nx:0.0289703; ny:-0.045077; nz:0.0365314; tu:0.4; tv:0.25; ),
(x:0.25; y:-0.118882; z:0.0386272; nx:0.0289703; ny:-0.0541596; nz:0.0208139; tu:0.45; tv:0.25; ),
(x:0.25; y:-0.125; z:1.17347E-7; nx:0.0289703; ny:-0.0579407; nz:0.00305897; tu:0.5; tv:0.25; ),
(x:0.25; y:-0.118882; z:-0.038627; nx:0.0289703; ny:-0.0560501; nz:-0.0149954; tu:0.55; tv:0.25; ),
(x:0.25; y:-0.101127; z:-0.073473; nx:0.0289704; ny:-0.048673; nz:-0.0315819; tu:0.6; tv:0.25; ),
(x:0.25; y:-0.0734732; z:-0.101127; nx:0.0289703; ny:-0.0365314; nz:-0.045077; tu:0.65; tv:0.25; ),
(x:0.25; y:-0.0386271; z:-0.118882; nx:0.0289703; ny:-0.0208139; nz:-0.0541596; tu:0.7; tv:0.25; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00152948; nz:-0.00965678; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.00152948; nz:-0.00965678; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.00443873; nz:-0.00871151; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.00691349; nz:-0.00691349; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.00871151; nz:-0.00443874; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.00965678; nz:-0.00152948; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.00965678; nz:0.00152948; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.0087115; nz:0.00443875; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.00691349; nz:0.00691349; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.00443873; nz:0.00871151; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:0.00152948; nz:0.00965678; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00152948; nz:0.00965679; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00443874; nz:0.00871151; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00691349; nz:0.00691348; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00871151; nz:0.00443874; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00965678; nz:0.00152948; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00965678; nz:-0.00152948; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00871151; nz:-0.00443873; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00691349; nz:-0.0069135; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0.00482839; ny:-0.00443873; nz:-0.0087115; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:-0.5; y:0.475528; z:-0.154508; nx:-0.0772543; ny:5.82867E-16; nz:-1.30385E-8; tu:-0.05; tv:1; ),
(x:-0.5; y:0.475528; z:-0.154508; nx:0.0144852; ny:0.0289703; nz:-0.00458845; tu:-0.05; tv:1; ),
(x:-0.25; y:0.356646; z:-0.115881; nx:0.0144852; ny:0.0289703; nz:-0.00458845; tu:-0.05; tv:0.75; ),
(x:-0.5; y:0.475528; z:-0.154508; nx:0.0193136; ny:0.0386271; nz:-0.00611794; tu:-0.05; tv:1; ),
(x:-0.25; y:0.356646; z:-0.115881; nx:0.00965678; ny:0.0193136; nz:-0.00305897; tu:-0.05; tv:0.75; ),
(x:5.96046E-8; y:0.237764; z:-0.0772542; nx:0.00965678; ny:0.0193136; nz:-0.00305897; tu:-0.05; tv:0.5; ),
(x:-0.25; y:0.356646; z:-0.115881; nx:0.0144852; ny:0.0289703; nz:-0.00458845; tu:-0.05; tv:0.75; ),
(x:5.96046E-8; y:0.237764; z:-0.0772542; nx:0.00482839; ny:0.00965678; nz:-0.00152948; tu:-0.05; tv:0.5; ),
(x:0.25; y:0.118882; z:-0.038627; nx:0.00482839; ny:0.00965678; nz:-0.00152948; tu:-0.05; tv:0.25; ),
(x:5.96046E-8; y:0.237764; z:-0.0772542; nx:0.00965678; ny:0.0193136; nz:-0.00305897; tu:-0.05; tv:0.5; ),
(x:0.25; y:0.118882; z:-0.038627; nx:0.00482839; ny:0.00965678; nz:-0.00152948; tu:-0.05; tv:0.25; ),
(x:-0.5; y:-2.98023E-8; z:-0.5; nx:0.0531123; ny:0.00458845; nz:-0.106225; tu:0.75; tv:1; ),
(x:-0.5; y:0.154508; z:-0.475528; nx:0.0531123; ny:0.0371891; nz:-0.0996077; tu:0.8; tv:1; ),
(x:-0.5; y:0.293893; z:-0.404509; nx:0.0531123; ny:0.0661494; nz:-0.0832405; tu:0.85; tv:1; ),
(x:-0.5; y:0.404508; z:-0.293893; nx:0.0531123; ny:0.0886345; nz:-0.0587251; tu:0.9; tv:1; ),
(x:-0.5; y:0.475528; z:-0.154508; nx:0.0193136; ny:0.034846; nz:-0.0177549; tu:0.95; tv:1; ),
(x:-0.5; y:0.5; z:2.23517E-8; nx:0.0531123; ny:0.106225; nz:0.00458846; tu:2.78275E-8; tv:1; ),
(x:-0.5; y:0.475528; z:0.154508; nx:0.0531123; ny:0.0996077; nz:0.0371891; tu:0.05; tv:1; ),
(x:-0.5; y:0.404508; z:0.293893; nx:0.0531123; ny:0.0832405; nz:0.0661494; tu:0.1; tv:1; ),
(x:-0.5; y:0.293893; z:0.404509; nx:0.0531123; ny:0.0587251; nz:0.0886346; tu:0.15; tv:1; ),
(x:-0.5; y:0.154508; z:0.475528; nx:0.0531123; ny:0.0284613; nz:0.102443; tu:0.2; tv:1; ),
(x:-0.5; y:-5.96046E-8; z:0.5; nx:0.0531123; ny:-0.00458846; nz:0.106225; tu:0.25; tv:1; ),
(x:-0.5; y:-0.154509; z:0.475528; nx:0.0531123; ny:-0.0371891; nz:0.0996077; tu:0.3; tv:1; ),
(x:-0.5; y:-0.293893; z:0.404508; nx:0.0531123; ny:-0.0661494; nz:0.0832405; tu:0.35; tv:1; ),
(x:-0.5; y:-0.404509; z:0.293893; nx:0.0531123; ny:-0.0886345; nz:0.0587251; tu:0.4; tv:1; ),
(x:-0.5; y:-0.475528; z:0.154508; nx:0.0531123; ny:-0.102444; nz:0.0284613; tu:0.45; tv:1; ),
(x:-0.5; y:-0.5; z:-6.51926E-8; nx:0.0531123; ny:-0.106225; nz:-0.00458845; tu:0.5; tv:1; ),
(x:-0.5; y:-0.475528; z:-0.154509; nx:0.0531123; ny:-0.0996077; nz:-0.0371891; tu:0.55; tv:1; ),
(x:-0.5; y:-0.404508; z:-0.293893; nx:0.0531123; ny:-0.0832405; nz:-0.0661494; tu:0.6; tv:1; ),
(x:-0.5; y:-0.293893; z:-0.404509; nx:0.0531123; ny:-0.0587251; nz:-0.0886345; tu:0.65; tv:1; ),
(x:-0.5; y:-0.154508; z:-0.475528; nx:0.0531123; ny:-0.0284613; nz:-0.102443; tu:0.7; tv:1; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; ),
(x:0.5; y:-2.98023E-8; z:1.78814E-7; nx:0; ny:0; nz:0; tu:0.5; tv:0; )
);

  ConeIndices: array [0..599] of Word = (
0,1,2,0,2,3,0,3,4,0,4,5,0,102,6,0,6,7,0,7,8,0,8,9,0,9,10,0,10,11,0,11,12,0,12,13,0,13,14,0,14,15,0,15,
16,0,16,17,0,17,18,0,18,19,0,19,20,0,20,1,113,21,22,113,22,114,114,22,23,114,23,115,115,23,24,115,24,
116,116,24,25,116,25,117,103,104,26,105,26,118,118,26,27,118,27,119,119,27,28,119,28,120,120,28,29,120,
29,121,121,29,30,121,30,122,122,30,31,122,31,123,123,31,32,123,32,124,124,32,33,124,33,125,125,33,34,
125,34,126,126,34,35,126,35,127,127,35,36,127,36,128,128,36,37,128,37,129,129,37,38,129,38,130,130,38,
39,130,39,131,131,39,40,131,40,132,132,40,21,132,21,113,21,41,42,21,42,22,22,42,43,22,43,23,23,43,44,
23,44,24,24,44,45,24,45,25,106,107,46,108,46,26,26,46,47,26,47,27,27,47,48,27,48,28,28,48,49,28,49,29,
29,49,50,29,50,30,30,50,51,30,51,31,31,51,52,31,52,32,32,52,53,32,53,33,33,53,54,33,54,34,34,54,55,34,
55,35,35,55,56,35,56,36,36,56,57,36,57,37,37,57,58,37,58,38,38,58,59,38,59,39,39,59,60,39,60,40,40,60,
41,40,41,21,41,61,62,41,62,42,42,62,63,42,63,43,43,63,64,43,64,44,44,64,65,44,65,45,109,110,66,111,66,
46,46,66,67,46,67,47,47,67,68,47,68,48,48,68,69,48,69,49,49,69,70,49,70,50,50,70,71,50,71,51,51,71,72,
51,72,52,52,72,73,52,73,53,53,73,74,53,74,54,54,74,75,54,75,55,55,75,76,55,76,56,56,76,77,56,77,57,57,
77,78,57,78,58,58,78,79,58,79,59,59,79,80,59,80,60,60,80,61,60,61,41,61,81,82,61,82,62,62,82,83,62,83,
63,63,83,84,63,84,64,64,84,85,64,85,65,65,85,86,112,86,66,66,86,87,66,87,67,67,87,88,67,88,68,68,88,89,
68,89,69,69,89,90,69,90,70,70,90,91,70,91,71,71,91,92,71,92,72,72,92,93,72,93,73,73,93,94,73,94,74,74,
94,95,74,95,75,75,95,96,75,96,76,76,96,97,76,97,77,77,97,98,77,98,78,78,98,99,78,99,79,79,99,100,79,100,
80,80,100,81,80,81,61,101,134,133,101,135,134,101,136,135,101,137,136,101,138,137,101,139,138,101,140,
139,101,141,140,101,142,141,101,143,142,101,144,143,101,145,144,101,146,145,101,147,146,101,148,147,101,
149,148,101,150,149,101,151,150,101,152,151,101,133,152
  );

constructor TdxCone.Create(AOwner: TComponent);
begin
  inherited;
  SetLength(Data.MeshVertices, Length(ConeVertices));
  Move(ConeVertices[0], Data.MeshVertices[0], SizeOf(ConeVertices));
  SetLength(Data.MeshIndices, Length(ConeIndices));
  Move(ConeIndices[0], Data.MeshIndices[0], SizeOf(ConeIndices));
end;

procedure TdxCone.CreateBody;
begin
  if (Scene <> nil) and (Scene.Physics = nil) then
    Scene.CreatePhysics;
  if (Collider or Dynamic) and (Scene.Physics <> nil) then
  begin
    FBody := Scene.Physics.CreateCone(Self, dxVector(Width, Height, Depth));
  end;
end;

procedure TdxCone.Paint;
begin
  inherited;
end;

{ TdxImage }

constructor TdxImage.Create(AOwner: TComponent);
begin
  inherited;
  FPlane := TdxMeshData.Create;
  FBitmap := TdxBitmap.Create(0, 0);
  FBitmap.OnChange := DoBitmapChanged;
  SetLength(FPlane.MeshVertices, 4);
  FPlane.MeshVertices[0] := TexVertexNormal(-0.5, 0, -0.5, 0, -1, 0, 0, 1);
  FPlane.MeshVertices[1] := TexVertexNormal(0.5, 0, -0.5, 0, -1, 0, 1, 1);
  FPlane.MeshVertices[2] := TexVertexNormal(0.5, 0, 0.5, 0, -1, 0, 1, 0);
  FPlane.MeshVertices[3] := TexVertexNormal(-0.5, 0, 0.5, 0, -1, 0, 0, 0);
  SetLength(FPlane.MeshIndices, 6);
  FPlane.MeshIndices[0] := 0;
  FPlane.MeshIndices[1] := 3;
  FPlane.MeshIndices[2] := 1;
  FPlane.MeshIndices[3] := 3;
  FPlane.MeshIndices[4] := 2;
  FPlane.MeshIndices[5] := 1;
  Width := 4;
  Height := 0.1;
  Depth := 3;
end;

destructor TdxImage.Destroy;
begin
  FreeAndNil(FPlane);
  FreeAndNil(FBitmap);
  inherited;
end;

procedure TdxImage.DoBitmapChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TdxImage.Paint;
begin
  if FBitmap.Width * FBitmap.Height > 0 then
  begin
    Canvas.Material.TempBitmap := FBitmap;
    Canvas.Material.NativeDiffuse := dxOpacity($FFFFFFFF, AbsoluteOpacity);
    Canvas.Material.Lighting := false;
    Canvas.Material.BitmapMode := dxTexReplace;
    Canvas.SetRenderState(rsTexLinear);
    Canvas.FillMesh(dxVector(0, 0, 0), dxVector(Width, 0, Depth), FPlane, AbsoluteOpacity);
    Canvas.Material.TempBitmap := nil;
  end;
end;

function TdxImage.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array [0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1,  0,  0);
  p[4] := dxVector(0, -1,  0);
  p[5] := dxVector(0,  0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := - (p[i].V[0]*RayPos.V[0] + p[i].V[1]*RayPos.V[1] + p[i].V[2]*RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
           / (p[i].V[0]*RayDir.V[0] + p[i].V[1]*RayDir.V[1] + p[i].V[2]*RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t*RayDir.V[0], RayPos.V[1] + t*RayDir.V[1], RayPos.V[2] + t*RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
         (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Exit;
      end;
    end;
  end;
  Result := false;
end;

procedure TdxImage.SetDepth(const Value: single);
begin
  if Projection = dxProjectionCamera then
  begin
    inherited SetDepth(Value);
  end
  else
    inherited SetDepth(0.1);
end;

procedure TdxImage.SetHeight(const Value: single);
begin
  if Projection = dxProjectionScreen then
  begin
    inherited SetDepth(Value);
  end
  else
    inherited SetHeight(0.1);
end;

{ TdxShape3D ==================================================================}

constructor TdxShape3D.Create(AOwner: TComponent);
begin
  inherited;
  FMaterialBack := TdxMaterial.Create;
  FMaterialBack.NativeDiffuse := FMaterial.NativeDiffuse;
  FMaterialBack.OnChanged := MaterialChanged;
  FMaterialLeft := TdxMaterial.Create;
  FMaterialLeft.NativeDiffuse := FMaterial.NativeDiffuse;
  FMaterialLeft.OnChanged := MaterialChanged;
  FFlatness := 1;
  FSides := [dxShape3DFront, dxShape3DBack, dxShape3DLeft];
  TwoSide := true;
  Width := 4;
  Height := 4;
  Depth := 1;
end;

destructor TdxShape3D.Destroy;
begin
  FMaterialBack.Free;
  FMaterialLeft.Free;
  inherited;
end;

procedure TdxShape3D.BeforePaint;
var
  M: TdxMatrix;
begin
  inherited;
  M := dcm_Scene.IdentityMatrix;
  M.m41 := -Width / 2;
  M.m42 := -Height / 2;
  Canvas.SetMatrix(dxMatrixMultiply(M, AbsoluteMatrix));
end;

procedure TdxShape3D.Paint;
begin
end;

function TdxShape3D.RayCastIntersect(const RayPos, RayDir: TdxVector; var Intersection: TdxVector): boolean;
var
  ip: TdxVector;
  p: array [0..5] of TdxVector;
  CubeSize: TdxVector;
  r: TdxVector;
  i: Integer;
  t, e: Single;
  eSize: TdxVector;
begin
  Result := false;
  e := 0.5 + 0.001; //Small value for floating point imprecisions
  CubeSize.V[0] := Width;
  CubeSize.V[1] := Height;
  CubeSize.V[2] := Depth;
  eSize.V[0] := Width * e;
  eSize.V[1] := Height * e;
  eSize.V[2] := Depth * e;
  p[0] := XHmgVector;
  p[1] := YHmgVector;
  p[2] := ZHmgVector;
  p[3] := dxVector(-1,  0,  0);
  p[4] := dxVector(0, -1,  0);
  p[5] := dxVector(0,  0, -1);
  for i := 0 to 5 do
  begin
    if dxVectorDotProduct(p[i], RayDir) > 0 then
    begin
      t := - (p[i].V[0]*RayPos.V[0] + p[i].V[1]*RayPos.V[1] + p[i].V[2]*RayPos.V[2] + 0.5 * CubeSize.V[i mod 3])
           / (p[i].V[0]*RayDir.V[0] + p[i].V[1]*RayDir.V[1] + p[i].V[2]*RayDir.V[2]);
      r := dxVector(RayPos.V[0] + t*RayDir.V[0], RayPos.V[1] + t*RayDir.V[1], RayPos.V[2] + t*RayDir.V[2]);
      if (Abs(r.V[0]) <= eSize.V[0]) and (Abs(r.V[1]) <= eSize.V[1]) and (Abs(r.V[2]) <= eSize.V[2]) and
         (dxVectorDotProduct(dxVectorSubtract(r, RayPos), RayDir) > 0) then
      begin
        Intersection := dxVector(LocalToAbsolute(dxPoint(r)));
        Result := true;
        Exit;
      end;
    end;
  end;
  Result := false;
end;

procedure TdxShape3D.MouseMove(Shift: TShiftState; X, Y, Dx,
  Dy: single; rayPos, rayDir: TdxVector);
var
  P3, rPos, rDir: TdxVector;
begin
  inherited;
  if RayCastIntersect(rayPos, rayDir, P3) then
  begin
    P3 := AbsoluteToLocalVector(P3);
    X := (((P3.x + (Width / 2)) / Width) * Width);
    Y := (((-P3.z + (Depth / 2)) / Depth) * Depth);
  end
  else
    Exit;
  ShapeMouseMove(Shift, X, Y);
end;

procedure TdxShape3D.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: single; rayPos, rayDir: TdxVector);
var
  P3, rPos, rDir: TdxVector;
begin
  inherited;
  if RayCastIntersect(rayPos, rayDir, P3) then
  begin
    P3 := AbsoluteToLocalVector(P3);
    X := (((P3.x + (Width / 2)) / Width) * Width);
    Y := (((-P3.z + (Depth / 2)) / Depth) * Depth);
  end
  else
    Exit;
  ShapeMouseDown(Button, Shift, X, Y);
end;

procedure TdxShape3D.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: single; rayPos, rayDir: TdxVector);
var
  P3, rPos, rDir: TdxVector;
begin
  inherited;
  if RayCastIntersect(rayPos, rayDir, P3) then
  begin
    P3 := AbsoluteToLocalVector(P3);
    X := (((P3.x + (Width / 2)) / Width) * Width);
    Y := (((-P3.z + (Depth / 2)) / Depth) * Depth);
  end;
  ShapeMouseUp(Button, Shift, X, Y);
end;

procedure TdxShape3D.ShapeMouseMove(Shift: TShiftState; X, Y: single);
begin
end;

procedure TdxShape3D.ShapeMouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: single);
begin
end;

procedure TdxShape3D.ShapeMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: single);
begin
end;

procedure TdxShape3D.SetFlatness(const Value: single);
begin
  if FFlatness <> Value then
  begin
    FFlatness := Value;
    if FFlatness < 0.05 then FFlatness := 0.05;
    Repaint;
  end;
end;

procedure TdxShape3D.SetSides(const Value: TdxShape3DSides);
begin
  if FSides <> Value then
  begin
    FSides := Value;
    Repaint;
  end;
end;

procedure TdxShape3D.SetMaterialBack(const Value: TdxMaterial);
begin
  FMaterialBack.Assign(Value);
end;

procedure TdxShape3D.SetMaterialLeft(const Value: TdxMaterial);
begin
  FMaterialLeft.Assign(Value);
end;

{ TdxRectangle3D }

constructor TdxRectangle3D.Create(AOwner: TComponent);
begin
  inherited;
  FCorners := AllCorners;
end;

destructor TdxRectangle3D.Destroy;
begin
  inherited;
end;

function TdxRectangle3D.IsCornersStored: Boolean;
begin
  Result := FCorners <> AllCorners;
end;

procedure TdxRectangle3D.Paint;
var
  S: TvxPoint;
  VP: TvxPolygon;
  R: TvxRect;
  Path: TvxPathData;
begin
  inherited;
  Path := TvxPathData.Create;
  Path.AddRectangle(vgRect(0, 0, Width, Height), xRadius, yRadius, FCorners, FCornerType);
  S := Path.FlattenToPolygon(VP, FFlatness);
  if (S.X > 0) and (S.Y > 0) then
  begin
    R := vgRect(0, 0, S.X, S.Y);
    { front }
    if dxShape3DFront in FSides then
    begin
      Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
        AbsoluteOpacity, true, false, false);
    end;
    { back }
    if dxShape3DBack in FSides then
    begin
      Canvas.SetMaterialWithOpacity(FMaterialBack, AbsoluteOpacity);
      Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
        AbsoluteOpacity, false, true, false);
    end;
    { left }
    if dxShape3DLeft in FSides then
    begin
      Canvas.SetMaterialWithOpacity(FMaterialLeft, AbsoluteOpacity);
      Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
        AbsoluteOpacity, false, false, true);
    end;
  end;
  Path.Free;
end;

procedure TdxRectangle3D.SetCorners(const Value: TvxCorners);
begin
  if FCorners <> Value then
  begin
    FCorners := Value;
    Repaint;
  end;
end;

procedure TdxRectangle3D.SetCornerType(const Value: TvxCornerType);
begin
  if FCornerType <> Value then
  begin
    FCornerType := Value;
    Repaint;
  end;
end;

procedure TdxRectangle3D.SetxRadius(const Value: single);
begin
  if FxRadius <> Value then
  begin
    FxRadius := Value;
    Repaint;
  end;
end;

procedure TdxRectangle3D.SetyRadius(const Value: single);
begin
  if FyRadius <> Value then
  begin
    FyRadius := Value;
    Repaint;
  end;
end;

{ TdxEllipse3D }

procedure TdxEllipse3D.Paint;
var
  S: TvxPoint;
  VP: TvxPolygon;
  R: TvxRect;
  Path: TvxPathData;
begin
  inherited;
  Path := TvxPathData.Create;

  R := vgRect(0, 0, Width, Height);
  Path.AddEllipse(R);

  S := Path.FlattenToPolygon(VP, FFlatness);
  if (S.X > 0) and (S.Y > 0) then
  begin
    R := vgRect(0, 0, S.X, S.Y);
    { front }
    if dxShape3DFront in FSides then
    begin
      Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
        AbsoluteOpacity, true, false, false);
    end;
    { back }
    if dxShape3DBack in FSides then
    begin
      Canvas.SetMaterialWithOpacity(FMaterialBack, AbsoluteOpacity);
      Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
        AbsoluteOpacity, false, true, false);
    end;
    { left }
    if dxShape3DLeft in FSides then
    begin
      Canvas.SetMaterialWithOpacity(FMaterialLeft, AbsoluteOpacity);
      Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
        AbsoluteOpacity, false, false, true);
    end;
  end;
  Path.Free;
end;

{ TdxText3D }

constructor TdxText3D.Create(AOwner: TComponent);
begin
  inherited;
  FFont := TdxFont.Create;
  FFont.OnChanged := FontChanged;
  FFlatness := 1;
  Depth := 0.3;
  Width := 3;
  Height := 1;
  ZWrite := true;
  WordWrap := true;
end;

destructor TdxText3D.Destroy;
begin
  FFont.Free;
  inherited;
end;

procedure TdxText3D.Paint;
var
  R: TvxRect;
  W, H: single;
  C: TvxCanvas;
  Path: TvxPathData;
  vP: TvxPolygon;
  B: TvxPoint;
  i: integer;
begin
  inherited;
  if Text <> '' then
  begin
    C := dcm_vgcore.DefaultCanvasClass.Create(1, 1);
    if C <> nil then
    begin
      C.Font.Family := Font.Family;
      C.Font.Style := TvxFontStyle(Font.Style);
      C.Font.Size := Font.Size;
      Path := TvxPathData.Create;
      if Stretch then
      begin
        R := vgRect(0, 0, Width * 10, Height * 10);
        if C.TextToPath(Path, R, Text, WordWrap, HorzTextAlign, VertTextAlign) then
        begin
          B := Path.FlattenToPolygon(vP, FFlatness);
          if (B.X > 0) and (B.Y > 0) then
          begin
            { front }
            if dxShape3DFront in FSides then
            begin
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R) / 10, vgRectHeight(R) / 10, Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, true, false, false);
            end;
            { back }
            if dxShape3DBack in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialBack, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R) / 10, vgRectHeight(R) / 10, Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, false, true, false);
            end;
            { left }
            if dxShape3DLeft in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialLeft, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R) / 10, vgRectHeight(R) / 10, Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, false, false, true);
            end;
          end;
        end;
      end
      else
      begin
        R := vgRect(0, 0, Width * 10, Height * 10);
        if C.TextToPath(Path, R, Text, WordWrap, HorzTextAlign, VertTextAlign) then
        begin
          if not WordWrap then
          begin
            R := vgRect(0, 0, Width * 10, Height * 10);
            C.MeasureText(R, R, Text, WordWrap, HorzTextAlign, VertTextAlign);
            case HorzTextAlign of
              vgTextAlignCenter: R := vgRect(0, 0, Width * 10, vgRectHeight(R));
              vgTextAlignNear: R := vgRect(0, 0, Width * 10, vgRectHeight(R));
              vgTextAlignFar: R := vgRect(Width * 10 - vgRectWidth(R), 0, Width * 10, vgRectHeight(R));
            end;
            R := vgUnionRect(R, vgRect(0, 0, Width * 10, Height * 10));
          end
          else
          begin
            C.MeasureText(R, R, Text, WordWrap, HorzTextAlign, VertTextAlign);
            R := vgUnionRect(R, vgRect(0, 0, Width * 10, Height * 10));
          end;
          B := Path.FlattenToPolygon(vP, FFlatness);
          if (B.X > 0) and (B.Y > 0) then
          begin
            { front }
            if dxShape3DFront in FSides then
            begin
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R) / 10, vgRectHeight(R) / 10, Depth), R, VP,
                AbsoluteOpacity, true, false, false);
            end;
            { back }
            if dxShape3DBack in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialBack, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R) / 10, vgRectHeight(R) / 10, Depth), R, VP,
                AbsoluteOpacity, false, true, false);
            end;
            { left }
            if dxShape3DLeft in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialLeft, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R) / 10, vgRectHeight(R) / 10, Depth), R, VP,
                AbsoluteOpacity, false, false, true);
            end;
          end;
        end;
      end;
      Path.Free;
      C.Free;
    end;
  end;
  if Assigned(Scene) and Scene.DesignTime and not Locked then
  begin
    Canvas.Material.NativeDiffuse := $8060a799;
    Canvas.DrawCube(dxVector(Width / 2, Height / 2, 0), dxVector(Width, Height, Depth), AbsoluteOpacity);
  end;
end;

function TdxText3D.GetPathBounds: TvxRect;
var
  R: TvxRect;
  W, H: single;
  C: TvxCanvas;
  Path: TvxPathData;
  vP: TvxPolygon;
  B: TvxPoint;
  i: integer;
begin
  Result := vgRect(0, 0, Width, Height);
  if Text <> '' then
  begin
    C := dcm_vgcore.DefaultCanvasClass.Create(1, 1);
    if C <> nil then
    begin
      C.Font.Family := Font.Family;
      C.Font.Style := TvxFontStyle(Font.Style);
      C.Font.Size := Font.Size;
      Path := TvxPathData.Create;
      if Stretch then
      begin
        R := vgRect(0, 0, Width * 10, Height * 10);
      end
      else
      begin
        R := vgRect(0, 0, Width * 10, Height * 10);
        if C.TextToPath(Path, R, Text, WordWrap, HorzTextAlign, VertTextAlign) then
        begin
          Result := Path.GetBounds;
        end;
      end;
      Path.Free;
      C.Free;
    end;
    Result := vgRect(Result.Left / 10, Result.Top / 10, Result.Right / 10, Result.Bottom / 10);
  end;
end;

function TdxText3D.GetTextBounds: TvxRect;
var
  R: TvxRect;
  W, H: single;
  C: TvxCanvas;
  i: integer;
begin
  Result := vgRect(0, 0, 0, 0);
  if Text <> '' then
  begin
    C := dcm_vgcore.DefaultCanvasClass.Create(1, 1);
    if C <> nil then
    begin
      C.Font.Family := Font.Family;
      C.Font.Style := TvxFontStyle(Font.Style);
      C.Font.Size := Font.Size;
      if Stretch then
      begin
        R := vgRect(0, 0, Width, Height);
      end
      else
      begin
        R := vgRect(0, 0, Width * 10, Height * 10);
        C.MeasureText(R, R, Text, WordWrap, vgTextAlignNear, vgTextAlignNear);
        Result := vgRect(0, 0, R.Right / 10, R.Bottom / 10);
      end;
      C.Free;
    end;
  end;
end;

function TdxText3D.GetPathLength: single;
var
  R: TvxRect;
  W, H: single;
  C: TvxCanvas;
  Path: TvxPathData;
  Points: TvxPolygon;
  i: integer;
  len: single;
begin
  Result := 0;
  if Text <> '' then
  begin
    C := dcm_vgcore.DefaultCanvasClass.Create(1, 1);
    if C <> nil then
    begin
      C.Font.Family := Font.Family;
      C.Font.Style := TvxFontStyle(Font.Style);
      C.Font.Size := Font.Size;
      Path := TvxPathData.Create;
      if Stretch then
      begin
        R := vgRect(0, 0, Width * 10, Height * 10);
         C.TextToPath(Path, R, Text, WordWrap, HorzTextAlign, VertTextAlign);
      end
      else
      begin
        R := vgRect(0, 0, Width * 10, Height * 10);
        C.MeasureText(R, R, Text, WordWrap, vgTextAlignNear, VertTextAlign);
        C.TextToPath(Path, R, Text, WordWrap, HorzTextAlign, VertTextAlign);
      end;
      Path.FlattenToPolygon(Points, FFlatness);
      Path.Free;
      C.Free;
    end;
    for i := 0 to High(Points) do
    begin
      if (Points[i].X >= $FFFF) and (Points[i].Y >= $FFFF) then continue;
      with Points[i] do
      begin
        if (i > 0) then
        begin
          if Points[i - 1].X >= $FFFF then
          begin
            Result := Result + vgVectorLength(vgVector(x - Points[i - 2].x, y - Points[i - 2].y));
          end
          else
          begin
            Result := Result + vgVectorLength(vgVector(x - Points[i - 1].x, y - Points[i - 1].y));
          end;
        end;
      end;
    end;
    Result := Result / 10;
  end;
end;

procedure TdxText3D.FontChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TdxText3D.SetFont(const Value: TdxFont);
begin
  FFont.Assign(Value);
end;

procedure TdxText3D.SetText(const Value: WideString);
begin
  if FText <> Value then
  begin
    FText := Value;
    Repaint;
  end;
end;

procedure TdxText3D.SetHorzTextAlign(const Value: TvxTextAlign);
begin
  if FHorzTextAlign <> Value then
  begin
    FHorzTextAlign := Value;
    Repaint;
  end;
end;

procedure TdxText3D.SetStretch(const Value: boolean);
begin
  if FStretch <> Value then
  begin
    FStretch := Value;
    Repaint;
  end;
end;

procedure TdxText3D.SetVertTextAlign(const Value: TvxTextAlign);
begin
  if FVertTextAlign <> Value then
  begin
    FVertTextAlign := Value;
    Repaint;
  end;
end;

procedure TdxText3D.SetWordWrap(const Value: boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
  end;
end;

{ TdxPath3D }

constructor TdxPath3D.Create(AOwner: TComponent);
begin
  inherited;
  FPath := TvxPathData.Create;
  FPath.Onchanged := PathChanged;
  FFlatness := 2;
  FWrapMode := vgPathStretch;
end;

destructor TdxPath3D.Destroy;
begin
  FPath.Free;
  inherited;
end;

procedure TdxPath3D.Paint;
var
  S: TvxPoint;
  VP: TvxPolygon;
  R: TvxRect;
  i, j: integer;
begin
  inherited;
  if not FPath.IsEmpty then
  begin
    case FWrapMode of
      vgPathOriginal:
        begin
          S := FPath.FlattenToPolygon(VP, FFlatness);
          if (S.X > 0) and (S.Y > 0) then
          begin
            { front }
            if dxShape3DFront in FSides then
            begin
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, true, false, false);
            end;
            { back }
            if dxShape3DBack in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialBack, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, false, true, false);
            end;
            { left }
            if dxShape3DLeft in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialLeft, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, false, false, true);
            end;
          end;
        end;
      vgPathFit:
        begin
          S := FPath.FlattenToPolygon(VP, FFlatness);
          if (S.X > 0) and (S.Y > 0) then
          begin
            R := vgRect(0, 0, S.X, S.Y);
            vgFitRect(R, vgRect(0, 0, Width, Height));
            { front }
            if dxShape3DFront in FSides then
            begin
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, true, false, false);
            end;
            { back }
            if dxShape3DBack in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialBack, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, false, true, false);
            end;
            { left }
            if dxShape3DLeft in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialLeft, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, false, false, true);
            end;
          end;
        end;
      vgPathStretch:
        begin
          S := FPath.FlattenToPolygon(VP, FFlatness);
          if (S.X > 0) and (S.Y > 0) then
          begin
            R := vgRect(0, 0, Width, Height);
            { front }
            if dxShape3DFront in FSides then
            begin
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, true, false, false);
            end;
            { back }
            if dxShape3DBack in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialBack, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, false, true, false);
            end;
            { left }
            if dxShape3DLeft in FSides then
            begin
              Canvas.SetMaterialWithOpacity(FMaterialLeft, AbsoluteOpacity);
              Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                AbsoluteOpacity, false, false, true);
            end;
          end;
        end;
      vgPathTile:
        begin
          S := FPath.FlattenToPolygon(VP, FFlatness);
          if (S.X > 0) and (S.Y > 0) then
          begin
            R := vgRect(0, 0, S.X, S.Y);
            for i := 0 to round(Width / vgRectWidth(R)) do
              for j := 0 to round(Height / vgRectHeight(R)) do
              begin
                R := vgRect(0, 0, S.X, S.Y);
                vgOffsetRect(R, i * (vgRectWidth(R)), j * (vgRectHeight(R)));
                { front }
                if dxShape3DFront in FSides then
                begin
                  Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                    AbsoluteOpacity, true, false, false);
                end;
                { back }
                if dxShape3DBack in FSides then
                begin
                  Canvas.SetMaterialWithOpacity(FMaterialBack, AbsoluteOpacity);
                  Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                    AbsoluteOpacity, false, true, false);
                end;
                { left }
                if dxShape3DLeft in FSides then
                begin
                  Canvas.SetMaterialWithOpacity(FMaterialLeft, AbsoluteOpacity);
                  Canvas.FillPolygon(dxVector(Width / 2, Height / 2, 0), dxVector(vgRectWidth(R), vgRectHeight(R), Depth), vgRect(0, 0, 0, 0), VP,
                    AbsoluteOpacity, false, false, true);
                end;
              end;
          end;
        end;
    end;
  end;
  if Assigned(Scene) and Scene.DesignTime and not Locked then
  begin
    Canvas.Material.NativeDiffuse := $8060a799;
    Canvas.DrawCube(dxVector(Width / 2, Height / 2, 0), dxVector(Width, Height, Depth), AbsoluteOpacity);
  end;
end;

procedure TdxPath3D.PathChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TdxPath3D.SetPath(const Value: TvxPathData);
begin
  FPath.Assign(Value);
end;

procedure TdxPath3D.SetWrapMode(const Value: TvxPathWrap);
begin
  if FWrapMode <> Value then
  begin
    FWrapMode := Value;
    Repaint;
  end;
end;

initialization
  RegisterClasses([TdxShape, TdxShape3D]);
  RegisterDXObjects('Shapes', [TdxPlane, TdxCube, TdxMesh, TdxSphere, TdxCylinder, TdxRoundCube, TdxCone, TdxText, TdxImage, TdxGrid, TdxStrokeCube]);
  RegisterDXObjects('3D', [TdxText3D, TdxPath3D, TdxRectangle3D, TdxEllipse3D]);
end.
