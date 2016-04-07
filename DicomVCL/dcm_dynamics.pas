unit dcm_dynamics;

{$I dcm_define.inc}

interface

uses
  {$IFDEF FPC}
  LCLProc, LCLType, LMessages, LResources,
  {$ENDIF}
  Classes, SysUtils, Forms, Controls, Dialogs, Graphics,
  ExtCtrls, Menus, dcm_scene, dcm_utils, dcm_vgcore;

const

  KeyTime = 1 / 30;

type

  TdxParticleList = class;
  TdxParticleEmitter = class;

{ TdxParticle }

  TdxParticle = class(TPersistent)
  private
    { Private Declarations }
    FTag : integer;
    FPosition : TdxVector;
    FVelocity : TdxVector;
    FTangentVel: single;
    FCentrifugalVel: single;
    FCreationTime : single;
    FCurrentTime : single;
    FRotationCenter: TdxVector;
    FOwner: TdxParticleList;  // NOT persistent
    FEmitter: TdxParticleEmitter;
  protected
    { Protected Declarations }
  public
    { Public Declarations }
    constructor Create; virtual;
    destructor Destroy; override;
    property Emitter: TdxParticleEmitter read FEmitter write FEmitter;
    property Owner: TdxParticleList read FOwner write FOwner;
    property Position : TdxVector read FPosition write FPosition;
    property Velocity : TdxVector read FVelocity write FVelocity;
    property Tag: integer read FTag write FTag;
  end;

  TdxParticleArray = array [0..$FFFFFF shr 4] of TdxParticle;
  PdxParticleArray = ^TdxParticleArray;

{ TdxParticleList }

  TdxParticleList = class(TPersistent)
  private
    { Private Declarations }
    FOwner: TdxParticleEmitter;  // NOT persistent
    FItemList: TList;
    FDirectList: PdxParticleArray; // NOT persistent
  protected
    { Protected Declarations }
    function GetItems(index: integer): TdxParticle;
    procedure SetItems(index: integer; Value: TdxParticle);
    procedure AfterItemCreated(Sender : TObject);
  public
    { Public Declarations }
    constructor Create; virtual;
    destructor Destroy; override;
    property Owner: TdxParticleEmitter read FOwner write FOwner;
    property Items[index : integer]: TdxParticle read GetItems write SetItems; default;
    function ItemCount: integer;
    function AddItem(AItem: TdxParticle) : integer;
    procedure RemoveAndFreeItem(AItem : TdxParticle);
    function IndexOfItem(AItem : TdxParticle) : integer;
    procedure Pack;
    property List: PdxParticleArray read FDirectList;
  end;

  TdxParticleReference = packed record
    particle: TdxParticle;
    distance: integer;  // stores an IEEE single!
  end;
  PParticleReference = ^TdxParticleReference;
  TdxParticleReferenceArray = packed array [0..$FFFFFF shr 4] of TdxParticleReference;
  PParticleReferenceArray = ^TdxParticleReferenceArray;
  TRegion = packed record
     count, capacity: integer;
     particleRef: PParticleReferenceArray;
     particleOrder: PPointerList;
  end;
  PRegion = ^TRegion;

{ TdxEmitter }

  TdxBlendingMode = (
    dxBlendAdditive,
    dxBlendBlend
  );

  TdxParticleVelocityMode = (svmAbsolute, svmRelative);
  TdxParticleDispersionMode = (sdmFast, sdmIsotropic);

  TdxCreateParticleEvent = procedure (Sender: TObject; AParticle: TdxParticle) of object;

  TdxParticleKey = class(TCollectionItem)
  private
    FSpin: single;
    FScale: single;
    FColor: Longword;
    FKey: longword;
    function GetColor: AnsiString;
    procedure SetColor(const Value: AnsiString);
    procedure SetKey(const Value: longword);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function time: single;
  published
    property Key: longword read FKey write SetKey;
    property Color: AnsiString read GetColor write SetColor;
    property Scale: single read FScale write FScale;
    property Spin: single read FSpin write FSpin;
  end;

  TdxParticleKeys = class(TCollection)
  private
    FEmitter: TdxParticleEmitter;
    function GetKey(Index: integer): TdxParticleKey;
  public
    constructor Create; virtual;
    property Keys[Index: integer]: TdxParticleKey read GetKey; default;
  published
  end;

  TdxParticleEmitter = class(TdxDummy)
  private
    { Private Declarations }
    FTimer: TdxAnimation;
    FCurrentTime: single;
    FKeys: TdxParticleKeys;
    FGravity: TdxPosition;
    FPositionDispersion: TdxPosition;
    FParticleInterval: single;
    FVelocityMode : TdxParticleVelocityMode;
    FDispersionMode : TdxParticleDispersionMode;
    FFollowToOwner: boolean;
    FLifeTime: single;
    FFriction: single;
    FDirectionAngle: single;
    FSpreadAngle: single;
    FVelocityMin: single;
    FCentrifugalVelMin: single;
    FTangentVelMin: single;
    FVelocityMax: single;
    FCentrifugalVelMax: single;
    FTangentVelMax: single;
    FParticles: TdxParticleList;
    FOnCreateParticle: TdxCreateParticleEvent;
    FOldPosition: TdxVector;
    FTimeRemainder: single;
    FRect: TvxBounds;
    FblendingMode: TdxBlendingMode;
    FZTest: Boolean;
    FBitmap: AnsiString;
    FEditor: integer;
    MeshVertices: array of TdxColorTexVertexNormal;
    MeshIndices: array of word;
    procedure SetParticleInterval(const Value: single);
    procedure SetParticles(const Value: TdxParticleList);
    procedure SetGravity(const Value: TdxPosition);
    procedure SetPositionDispersion(const Value: TdxPosition);
    procedure SetRect(const Value: TvxBounds);
    procedure SetBlendingMode(const Value: TdxBlendingMode);
    procedure SetZTest(const Value: Boolean);
    procedure SetCentrifugalVelMax(const Value: single);
    procedure SetCentrifugalVelMin(const Value: single);
    procedure SetTangentVelMax(const Value: single);
    procedure SetTangentVelMin(const Value: single);
    procedure SetVelocityMax(const Value: single);
    procedure SetVelocityMin(const Value: single);
    procedure SetBitmap(const Value: AnsiString);
    function GetColorMax: AnsiString;
    function GetColorMin: AnsiString;
    function GetScaleMax: single;
    function GetScaleMin: single;
    function GetSpinMax: single;
    function GetSpinMin: single;
    procedure SetColorMax(const Value: AnsiString);
    procedure SetColorMin(const Value: AnsiString);
    procedure SetScaleMax(const Value: single);
    procedure SetScaleMin(const Value: single);
    procedure SetSpinMax(const Value: single);
    procedure SetSpinMin(const Value: single);
    function GetParticleInterval: single;
  protected
    { Protected Declarations }
    function FindKeys(const ATime: single; var Key1, Key2: TdxParticleKey): boolean;
    procedure ProcessEffect(DeltaTime, Time: single);
    procedure SetLifeTime(const Value: single);
    procedure RenderParticle(const APart: TdxParticle; const Idx: integer; var Vertices: array of TdxColorTexVertexNormal;
      var Indices: array of word);
    procedure Paint; override;
  public
    { Public Declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure KillAll;
    procedure Burst(Time: single; ParticlesCount: integer);
    procedure ComputeCurColor(lifeTime: single; var curColor: TdxColor);
    function ComputeSizeScale(lifeTime: single; var sizeScale: single) : Boolean;
    function ComputeSpinAngle(lifeTime: single; var spinAngle: single): Boolean;
    function CreateParticle: TdxParticle; virtual;
    property Particles: TdxParticleList read FParticles write SetParticles;
    property Keys: TdxParticleKeys read FKeys write FKeys;
  published
    { Published Declarations }
    property Editor: integer read FEditor write FEditor stored false;
    property Bitmap: AnsiString read FBitmap write SetBitmap;
    property BlendingMode: TdxBlendingMode read FblendingMode write SetBlendingMode default dxBlendAdditive;
    property Gravity: TdxPosition read FGravity write SetGravity;
    property PositionDispersion: TdxPosition read FPositionDispersion write SetPositionDispersion;
    property ParticlePerSecond: single read GetParticleInterval write SetParticleInterval;
    property VelocityMode: TdxParticleVelocityMode read FVelocityMode write FVelocityMode default svmAbsolute;
    property FollowToOwner: boolean read FFollowToOwner write FFollowToOwner;
    property DispersionMode : TdxParticleDispersionMode read FDispersionMode write FDispersionMode default sdmFast;
    property DirectionAngle: single  read FDirectionAngle write FDirectionAngle;
    property SpreadAngle: single  read FSpreadAngle write FSpreadAngle;
    property Friction: single read FFriction write FFriction;
    property Rect: TvxBounds read FRect write SetRect;
    property LifeTime: single read FLifeTime write SetLifeTime;
    property CentrifugalVelMin: single read FCentrifugalVelMin write SetCentrifugalVelMin;
    property CentrifugalVelMax: single read FCentrifugalVelMax write SetCentrifugalVelMax;
    property TangentVelMin: single read FTangentVelMin write SetTangentVelMin;
    property TangentVelMax : single read FTangentVelMax write SetTangentVelMax;
    property VelocityMin: single read FVelocityMin write SetVelocityMin;
    property VelocityMax : single read FVelocityMax write SetVelocityMax;
    { link to keys[1] }
    property ColorBegin: AnsiString read GetColorMin write SetColorMin;
    property ScaleBegin: single read GetScaleMin write SetScaleMin;
    property SpinBegin: single read GetSpinMin write SetSpinMin;
    { link to keys[2] }
    property ColorEnd: AnsiString read GetColorMax write SetColorMax;
    property ScaleEnd: single read GetScaleMax write SetScaleMax;
    property SpinEnd: single read GetSpinMax write SetSpinMax;
    property OnCreateParticle: TdxCreateParticleEvent read FOnCreateParticle write FOnCreateParticle;
    property TwoSide default true;
    property ZWrite default false;
  end;

implementation {===============================================================}

procedure RndVector(var v: TdxVector; var f : single;
  dispersionRange: TdxPosition);
var
  fsq, f2: single;
  p: TdxVector;
begin
  f2 := 2 * f;
  if Assigned(dispersionRange) then
    p := dxVectorScale(dispersionRange.Vector, f2)
  else
    p := dxVectorScale(XYZWHmgVector, f2);
  if true {fast} then
  begin
    v.V[0]:=(Random-0.5) * p.V[0];
    v.V[1]:=(Random-0.5) * p.V[1];
    v.V[2]:=(Random-0.5) * p.V[2];
    v.W := 1;
  end
  else
  begin
    fsq := Sqr(0.5);
    repeat
       v.V[0]:=(Random-0.5);
       v.V[1]:=(Random-0.5);
       v.V[2]:=(Random-0.5);
    until dxVectorNorm(v) <= fsq;
    v.V[0] := v.V[0] * p.V[0];
    v.V[1] := v.V[1] * p.V[1];
    v.V[2] := v.V[2] * p.V[2];
    v.W := 1;
  end;
end;

{ TdxParticle ===================================================================}

constructor TdxParticle.Create;
begin
  inherited;
end;

destructor TdxParticle.Destroy;
begin
  inherited;
end;

{ TdxParticleList ===============================================================}

constructor TdxParticleList.Create;
begin
  inherited;
  FItemList := TList.Create;
  FitemList.Capacity := 64;
  FDirectList := nil;
end;

destructor TdxParticleList.Destroy;
var
  i: integer;
begin
  for i := 0 to FItemList.Count - 1 do
    TObject(FItemList[i]).Free;
  FItemList.Free;
  inherited;
end;

function TdxParticleList.GetItems(index: integer): TdxParticle;
begin
  Result := TdxParticle(FItemList[index]);
end;

procedure TdxParticleList.SetItems(index: integer; Value: TdxParticle);
begin
  FItemList[index] := Value;
end;

function TdxParticleList.ItemCount: integer;
begin
  Result := FItemList.Count;
end;

procedure TdxParticleList.RemoveAndFreeItem(AItem: TdxParticle);
var
  i: integer;
begin
  i := FItemList.IndexOf(AItem);
  if i >= 0 then
  begin
    if AItem.Owner=Self then
      AItem.Owner:=nil;
    AItem.Free;
    FItemList.List[i]:=nil;
  end;
end;

procedure TdxParticleList.Pack;
begin
  FItemList.Pack;
  FDirectList := PdxParticleArray(FItemList.List);
end;

function TdxParticleList.IndexOfItem(AItem: TdxParticle): integer;
begin
   Result := FItemList.IndexOf(AItem);
end;

function TdxParticleList.AddItem(AItem: TdxParticle): integer;
begin
  AItem.Owner := Self;
  Result := FItemList.Add(AItem);
  FDirectList := PdxParticleArray(FItemList.List);
end;

procedure TdxParticleList.AfterItemCreated(Sender: TObject);
begin
  TdxParticle(Sender).Owner := Self;
end;

{ TdxParticleKey }

constructor TdxParticleKey.Create(Collection: TCollection);
begin
  inherited;
end;

destructor TdxParticleKey.Destroy;
begin
  inherited;
end;

function TdxParticleKey.GetColor: AnsiString;
begin
  Result := dxColorToStr(FColor);
end;

procedure TdxParticleKey.SetColor(const Value: AnsiString);
begin
  FColor := dxStrToColor(Value);
end;

procedure TdxParticleKey.SetKey(const Value: longword);
begin
  FKey := Value;
end;

function TdxParticleKey.Time: single;
begin
  Result := (Key * KeyTime);
end;

{ TdxParticleKeys }

constructor TdxParticleKeys.Create;
begin
  inherited Create(TdxParticleKey);
end;

function TdxParticleKeys.GetKey(Index: integer): TdxParticleKey;
begin
  Result := TdxParticleKey(Items[Index]);
end;

{ TdxParticleAnimation ========================================================}

type

  TdxParticleAnimation = class(TdxAnimation)
  private
    FEmitter: TdxParticleEmitter;
  protected
    procedure ProcessTick(time, deltaTime: single); override;
  public
  end;

procedure TdxParticleAnimation.ProcessTick(time, deltaTime: single);
begin
  inherited ;
  if not FRunning then Exit;

  if FEmitter <> nil then
  begin
    FEmitter.ProcessEffect(deltaTime, Time);
  end;
end;

{ TTdxParticleEmitter =========================================================}

constructor TdxParticleEmitter.Create(AOwner: TComponent);
var
  k: TdxParticleKey;
begin
  inherited Create(AOwner);
  FCanResize := false;
  FCanRotate := false;
  zWrite := false;
  TwoSide := true;
  Width := 0.3;
  Height := 0.3;
  Depth := 0.3;

  FKeys := TdxParticleKeys.Create;
  FKeys.FEmitter := Self;
  { create minnimal 2 keys }
  k := TdxParticleKey.Create(FKeys);
  k.spin := 0;
  k.scale := 1;
  k.color := '#FFFFFFFF';
  k := TdxParticleKey.Create(FKeys);
  k.spin := 0;
  k.scale := 0.1;
  k.color := '#00000000';
  k.key := 10;
  {}
  FRect := TvxBounds.Create(vgRect(0, 0, 1, 1));
  FGravity := TdxPosition.Create(dxPoint(WHmgVector));
  FPositionDispersion := TdxPosition.Create(dxPoint(WHmgVector));
  FParticles := TdxParticleList.Create;
  FParticles.Owner := Self;
  FParticleInterval := 0.05;
  FVelocityMode := svmAbsolute;
  FDispersionMode := sdmFast;
  FFriction := 1;
  FZTest := false;
  FSpreadAngle := 360;
  FVelocityMin := 0.5;
  FVelocityMax := 0.8;
  FLifeTime := 2;

  FTimer := TdxParticleAnimation.Create(Self);
  TdxParticleAnimation(FTimer).FEmitter := Self;
  FTimer.Parent := Self;
  FTimer.Stored := false;
  FTimer.Duration := Maxsingle;
  FTimer.Enabled := true;
end;

destructor TdxParticleEmitter.Destroy;
begin
  FTimer.Free;
  FKeys.Free;
  FRect.Free;
  FPositionDispersion.Free;
  FGravity.Free;
  FParticles.Free;
  inherited;
end;

procedure TdxParticleEmitter.Assign(Source: TPersistent);
begin
  if Source is TdxParticleEmitter then
  begin
    FBitmap := TdxParticleEmitter(Source).FBitmap;
    FBlendingMode := TdxParticleEmitter(Source).BlendingMode;
    FGravity.Assign(TdxParticleEmitter(Source).Gravity);
    FPositionDispersion.Assign(TdxParticleEmitter(Source).PositionDispersion);
    FParticleInterval := TdxParticleEmitter(Source).FParticleInterval;
    FVelocityMode := TdxParticleEmitter(Source).VelocityMode;
    FFollowToOwner := TdxParticleEmitter(Source).FollowToOwner;
    FDispersionMode := TdxParticleEmitter(Source).DispersionMode;
    FDirectionAngle := TdxParticleEmitter(Source).DirectionAngle;
    FSpreadAngle := TdxParticleEmitter(Source).SpreadAngle;
    FFriction := TdxParticleEmitter(Source).Friction;
    FRect.Assign(TdxParticleEmitter(Source).Rect);
    FCentrifugalVelMin := TdxParticleEmitter(Source).CentrifugalVelMin;
    FCentrifugalVelMax := TdxParticleEmitter(Source).CentrifugalVelMax;
    FTangentVelMin := TdxParticleEmitter(Source).TangentVelMin;
    FTangentVelMax := TdxParticleEmitter(Source).TangentVelMax;
    FVelocityMin := TdxParticleEmitter(Source).VelocityMin;
    FVelocityMax := TdxParticleEmitter(Source).VelocityMax;
    
    LifeTime := TdxParticleEmitter(Source).LifeTime;
    { link to keys[1] }
    ColorBegin := TdxParticleEmitter(Source).ColorBegin;
    ScaleBegin := TdxParticleEmitter(Source).ScaleBegin;
    SpinBegin := TdxParticleEmitter(Source).SpinBegin;
    { link to keys[2] }
    ColorEnd := TdxParticleEmitter(Source).ColorEnd;
    ScaleEnd := TdxParticleEmitter(Source).ScaleEnd;
    SpinEnd := TdxParticleEmitter(Source).SpinEnd;
  end
  else
    inherited
end;

procedure TdxParticleEmitter.ProcessEffect(DeltaTime, Time: single);
var
  n : integer;
  i : integer;
  curParticle : TdxParticle;
  dt: single;
  list: PdxParticleArray;
  doFriction, doPack : Boolean;
  frictionScale : single;
  p1, p2, axis: TdxVector;
  OwnerPositionDelta: TdxVector;
  NeedRepaint: boolean;
  NeedFinish: boolean;
begin
  FCurrentTime := FCurrentTime + deltaTime;
  if (FParticleInterval > 0) then
  begin
    if FTimeRemainder >= FParticleInterval then
    begin
      n := Trunc(FTimeRemainder / FParticleInterval);
      Burst(FCurrentTime, n);
      FTimeRemainder := 0;
      NeedFinish := true;
    end
    else
    begin
      FTimeRemainder := FTimeRemainder + deltaTime;
      NeedFinish := true;
    end;
  end;

  { manager }
  dt := deltaTime;

  { Calc object shift }
  OwnerPositionDelta := dxVectorSubtract(AbsolutePosition, FOldPosition);
  FOldPosition := AbsolutePosition;

  { Particle life }
  NeedRepaint := false;
  doPack := false;
  list := Particles.List;
  for i := 0 to Particles.ItemCount-1 do
  begin
    curParticle := list[i];

    doFriction := false;
    if curParticle.Emitter <> nil then
    begin
      NeedRepaint := true;
      doFriction := (curParticle.FEmitter.FFriction<>1);
      if doFriction then
      begin
        frictionScale := Power(curParticle.FEmitter.FFriction, dt)
      end
      else
        frictionScale := 1;

      if curParticle.Emitter.FFollowToOwner then
      begin
        with curParticle do
        begin
          FPosition := dxVectorAdd(FPosition, OwnerPositionDelta);
          if (not Visible) then
          begin
            curParticle.Free;
            list[i] := nil;
            doPack := True;
            Continue;
          end;
        end;
      end;
    end
    else
      frictionScale := 1;

    if curParticle.FCurrentTime < (LifeTime - dt) then
    begin
      // particle alive, just update velocity and position
      with curParticle do
      begin
        { Random Dir }
        FVelocity.V[0] := FVelocity.V[0] - 0.001 + random * 0.002;
        FVelocity.V[1] := FVelocity.V[1] - 0.001 + random * 0.002;
        FVelocity.V[2] := FVelocity.V[2] - 0.001 + random * 0.002;

        { Gravity }
        if (FEmitter <> nil) then
        begin
          CombinedxVector(FVelocity, Gravity.Vector, dt);
        end;

        { Centrifugal Acc }
        if (FCentrifugalVel <> 0) and
           ((FPosition.X <> FRotationCenter.X) or (FPosition.Y <> FRotationCenter.Y) or (FPosition.Z <> FRotationCenter.Z)) then
        begin
          CombinedxVector(FVelocity, dxVectorScale(dxVectorNormalize(dxVectorSubtract(FPosition, FRotationCenter)), FCentrifugalVel), dt);
        end;

        { Acc }
        CombinedxVector(FPosition, FVelocity, dt);

        { Tangent Acc }
        if (FTangentVel <> 0) and
           ((FPosition.X <> FRotationCenter.X) or (FPosition.Y <> FRotationCenter.Y) or (FPosition.Z <> FRotationCenter.Z)) then
        begin
          if (Projection = dxProjectionCamera) and (Canvas <> nil) and (Canvas.CurrentCamera <> nil) then
            axis := AbsoluteToLocalVector(Canvas.CurrentCamera.AbsoluteDirection);
          if (Projection = dxProjectionScreen) then
            axis := dxVector(0, 0, 1);
          p1 := AbsoluteToLocalVector(FVelocity);
          RotateVector(p1, axis, DegToRad(FTangentVel));
          FVelocity := LocalToAbsoluteVector(p1);
          p1 := AbsoluteToLocalVector(FPosition);
          RotateVector(p1, axis, DegToRad(FTangentVel));
          FPosition := LocalToAbsoluteVector(p1);
        end;

        if doFriction then
          dxVectorScale(FVelocity, frictionScale);
      end;

      curParticle.FCurrentTime := curParticle.FCurrentTime + dt;
    end
    else
    begin
      // kill particle
      curParticle.Free;
      list[i] := nil;
      doPack := true;
      NeedRepaint := true;
    end;
  end;
  if doPack then
  begin
    Particles.Pack;
    if Particles.ItemCount = 0 then
      NeedFinish := false;
    NeedRepaint := true;
  end;

  if NeedRepaint then
    Repaint;
end;

procedure TdxParticleEmitter.Paint;
var
  i: integer;
begin
  inherited;
  if Assigned(Scene) and (not Scene.DesignTime) and (FParticles.ItemCount > 0) then
  begin
    Canvas.Material.Lighting := false;
    Canvas.Material.Diffuse := '#FFFFFFFF';
    Canvas.Material.BitmapMode := dxTexModulate;
    Canvas.Material.Bitmap := FBitmap;
    SetLength(MeshVertices, FParticles.ItemCount * 4);
    SetLength(MeshIndices, FParticles.ItemCount * 6);
    case BlendingMode of
      dxBlendAdditive: Canvas.SetRenderState(rsBlendAdditive);
      dxBlendBlend: Canvas.SetRenderState(rsBlendNormal);
    end;
    for i := 0 to FParticles.ItemCount - 1 do
      RenderParticle(FParticles.Items[i], i, MeshVertices, MeshIndices);

//    Canvas.SetRenderState(rsZTestOff);
    Canvas.FillColorTexVertexNormal(MeshVertices, MeshIndices, AbsoluteOpacity);
//    Canvas.SetRenderState(rsZTestOn);
    Canvas.SetRenderState(rsBlendNormal);
  end;
end;

procedure TdxParticleEmitter.RenderParticle(const APart: TdxParticle; const Idx: integer; var Vertices: array of TdxColorTexVertexNormal;
  var Indices: array of word);
var
  i: integer;
  x, y, z: single;
  SizeScale: single;
  RotateAngle: single;
  Color: TdxColor;
  V: TdxVector;
  Right, Up: TdxVector;
  rotMatrix: TdxMatrix;
  lifeTime: single;
  partPos, partDir: TdxVector;
  curIndex, curVertex: integer;
  M: TdxMatrix;
begin
  if Canvas.CurrentCamera = nil then Exit;

  lifeTime := APart.FCurrentTime;

  curVertex := Idx * 4;
  curIndex := Idx * 6;

  { Scale }
  ComputeSizeScale(lifeTime, sizeScale);
  { Color }
  ComputeCurColor(lifeTime, Color);
  { Pos }
  partPos := dxVector(APart.FPosition.X, APart.FPosition.Y, APart.FPosition.Z);
  partPos := AbsoluteToLocalVector(partPos);
  x := partPos.x;
  y := partPos.y;
  z := partPos.z;
  { Text Coord }
  partDir := AbsoluteToLocalVector(Canvas.CurrentCamera.AbsoluteDirection);
  NormalizedxVector(partDir);
  Up := AbsoluteToLocalVector(Canvas.CurrentCamera.AbsoluteUp);
  NormalizedxVector(Up);
  Right := AbsoluteToLocalVector(Canvas.CurrentCamera.AbsoluteRight);
  NormalizedxVector(Right);
  { Scale }
  Right := dxVectorScale(Right, sizeScale / 2);
  Up := dxVectorScale(Up, sizeScale / 2);
  { Angle }
  if ComputeSpinAngle(lifeTime, RotateAngle) then
  begin
    { Text Coord }
    Vertices[curVertex + 0] := ColorTexVertexNormal(x + (-Right.x - Up.x), y + (-Right.y - Up.y), z + (-Right.z - Up.z), 0, 0, 0, Color, FRect.Left, FRect.Top);
    Vertices[curVertex + 1] := ColorTexVertexNormal(x + ( Right.x - Up.x), y + ( Right.y - Up.y), z + ( Right.z - Up.z), 0, 0, 0, Color, FRect.Right, FRect.Top);
    Vertices[curVertex + 2] := ColorTexVertexNormal(x + ( Right.x + Up.x), y + ( Right.y + Up.y), z + ( Right.z + Up.z), 0, 0, 0, Color, FRect.Right, FRect.Bottom);
    Vertices[curVertex + 3] := ColorTexVertexNormal(x + (-Right.x + Up.x), y + (-Right.y + Up.y), z + (-Right.z + Up.z), 0, 0, 0, Color, FRect.Left, FRect.Bottom);
    { Rotate }
    RotateAngle := DegToRad(RotateAngle);
    rotMatrix := dxCreateRotationMatrix(partDir, RotateAngle);
    for i := 0 to 3 do
    begin
      V := dxVector(Vertices[curVertex + i].X - x, Vertices[curVertex + i].Y - y, Vertices[curVertex + i].Z - z);
      V := dxVectorTransform(V, rotMatrix);
      Vertices[curVertex + i].X := V.X + x;
      Vertices[curVertex + i].Y := V.Y + y;
      Vertices[curVertex + i].Z := V.Z + z;
    end;
  end
  else
  begin
    { Save to real }
    Vertices[curVertex + 0] := ColorTexVertexNormal(x + (-Right.x - Up.x), y + (-Right.y - Up.y), z + (-Right.z - Up.z), 0, 0, 0, Color, FRect.Left, FRect.Top);
    Vertices[curVertex + 1] := ColorTexVertexNormal(x + ( Right.x - Up.x), y + ( Right.y - Up.y), z + ( Right.z - Up.z), 0, 0, 0, Color, FRect.Right, FRect.Top);
    Vertices[curVertex + 2] := ColorTexVertexNormal(x + ( Right.x + Up.x), y + ( Right.y + Up.y), z + ( Right.z + Up.z), 0, 0, 0, Color, FRect.Right, FRect.Bottom);
    Vertices[curVertex + 3] := ColorTexVertexNormal(x + (-Right.x + Up.x), y + (-Right.y + Up.y), z + (-Right.z + Up.z), 0, 0, 0, Color, FRect.Left, FRect.Bottom);
  end;
  { Indexs }
  Indices[curIndex + 0] := curVertex + 0;
  Indices[curIndex + 1] := curVertex + 1;
  Indices[curIndex + 2] := curVertex + 2;
  Indices[curIndex + 3] := curVertex + 0;
  Indices[curIndex + 4] := curVertex + 2;
  Indices[curIndex + 5] := curVertex + 3;
end;

function TdxParticleEmitter.CreateParticle: TdxParticle;
begin
  Result := TdxParticle.Create;
  Result.FCreationTime := FCurrentTime;
  Result.FCurrentTime := 0;
  FParticles.AddItem(Result);
  if Assigned(FOnCreateParticle) then
    FOnCreateParticle(Self, Result);
end;

function TdxParticleEmitter.FindKeys(const ATime: single; var Key1,
  Key2: TdxParticleKey): boolean;
var
  i: integer;
begin
  Result := false;
  if Keys.Count < 2 then Exit;

  if ATime > Keys[Keys.Count - 1].Time then
  begin
    Result := true;
    Key1 := Keys[Keys.Count - 2];
    Key2 := Keys[Keys.Count - 1];
    Exit;
  end;

  for i := 0 to Keys.Count - 2 do
    if ((ATime >= Keys[i].Time) and (ATime <= Keys[i + 1].Time)) then
    begin
      Result := true;
      Key1 := Keys[i];
      Key2 := Keys[i + 1];
      Exit;
    end;
end;

function TdxParticleEmitter.ComputeSpinAngle(lifeTime: single; var spinAngle: single): Boolean;
var
  k1, k2: TdxParticleKey;
  f: single;
begin
  if FindKeys(lifeTime, k1, k2) then
  begin
    f := (lifeTime - k1.Time) / (k2.Time - k1.Time);
    spinAngle := dxInterpolatesingle(k1.spin, k2.spin, f);
  end
  else
    spinAngle := 0;
  Result := spinAngle <> 0.0;
end;

procedure TdxParticleEmitter.ComputeCurColor(lifeTime: single; var curColor: TdxColor);
var
  k1, k2: TdxParticleKey;
  f: single;
begin
  if FindKeys(lifeTime, k1, k2) then
  begin
    f := (lifeTime - k1.Time) / (k2.Time - k1.Time);
    curColor := dxInterpolateColor(k1.FColor, k2.FColor, f);
  end
  else
    curColor := 0;
end;

function TdxParticleEmitter.ComputeSizeScale(lifeTime: single; var sizeScale: single): Boolean;
var
  k1, k2: TdxParticleKey;
  f: single;
begin
  if FindKeys(lifeTime, k1, k2) then
  begin
    f := (lifeTime - k1.Time) / (k2.Time - k1.Time);
    sizeScale := dxInterpolatesingle(k1.scale, k2.scale, f);
  end
  else
    sizeScale := 0;
  Result := sizeScale <> 1.0;
end;

procedure TdxParticleEmitter.KillAll;
var
  i : integer;
  curParticle : TdxParticle;
  list : PdxParticleArray;
begin
  list := Particles.List;
  for i := 0 to Particles.ItemCount-1 do
  begin
    curParticle := list[i];
    curParticle.Free;
    list[i]:=nil;
  end;
  Particles.Pack;
end;

procedure TdxParticleEmitter.SetPositionDispersion(const Value: TdxPosition);
begin
  FPositionDispersion.Assign(Value);
end;

procedure TdxParticleEmitter.SetRect(const Value: TvxBounds);
begin
  FRect.Assign(Value);
end;

procedure TdxParticleEmitter.SetZTest(const Value: Boolean);
begin
  if FZTest <> Value then
  begin
    FZTest := Value;
  end;
end;

procedure TdxParticleEmitter.SetBlendingMode(const Value: TdxBlendingMode);
begin
  if FblendingMode <> Value then
  begin
    FblendingMode := Value;
  end;
end;

procedure TdxParticleEmitter.Burst(Time: single; ParticlesCount: integer);
var
   particle : TdxParticle;
   av, pos: TdxVector;
   axis: TdxVector;
   f: single;
begin
  while ParticlesCount > 0 do
  begin
    particle := CreateParticle;
    particle.Emitter := Self;

    pos := AbsolutePosition;
    { Pos }
    f := 1;
    RndVector(av, f, FPositionDispersion);
    pos := dxVectorAdd(pos, av);

    particle.FRotationCenter := pos;
    particle.Position := pos;

    { Direction }
    if (Canvas <> nil) and (Canvas.CurrentCamera <> nil) then
    begin
      axis := Canvas.CurrentCamera.AbsoluteDirection;
      av := Canvas.CurrentCamera.AbsoluteRight;
      NormalizedxVector(av);
    end
    else
    begin
      axis := dxVector(0, 1, 0);
      av := dxVector(1, 0, 0);
    end;
    RotateVector(av, axis, DegToRad(FDirectionAngle - (FSpreadAngle / 2) + (FSpreadAngle * random)));

    { Velocity }
    av := dxVectorScale(av, FVelocityMin + Random * (FVelocityMax - FVelocityMin));
    particle.FVelocity := av;

    if VelocityMode = svmRelative then
    begin
      particle.FVelocity.W := 0;
      particle.FVelocity := LocalToAbsoluteVector(particle.FVelocity);
      particle.FVelocity.W := 1;
    end;

    particle.FCentrifugalVel := FCentrifugalVelMin + Random * (FCentrifugalVelMax - FCentrifugalVelMin);
    particle.FTangentVel := FTangentVelMin + Random * (FTangentVelMax - FTangentVelMin);

    particle.FCreationTime := FCurrentTime;
    particle.FCurrentTime := 0;
    System.Dec(ParticlesCount);
  end;
end;


procedure TdxParticleEmitter.SetLifeTime(const Value: single);
begin
  FLifeTime := Value;
  if FKeys.Count = 2 then
  begin
    FKeys[1].key := round(value / keyTime);
    FLifeTime := FKeys[1].key * keyTime;
  end;
end;

procedure TdxParticleEmitter.SetGravity(const Value: TdxPosition);
begin
  FGravity.Assign(Value);
end;

procedure TdxParticleEmitter.SetParticles(const Value: TdxParticleList);
begin
  FParticles := Value;
end;

function TdxParticleEmitter.GetParticleInterval: single;
begin
  if FParticleInterval <> 0 then
    Result := 1 / FParticleInterval
  else
    Result := 1;
end;

procedure TdxParticleEmitter.SetParticleInterval(const Value: single);
begin
  if Value <> 0 then
  begin
    FParticleInterval := 1 / Value;
    if FParticleInterval < 0 then FParticleInterval:=0;
    if FTimeRemainder > FParticleInterval then
      FTimeRemainder := FParticleInterval;
  end;
end;

procedure TdxParticleEmitter.SetCentrifugalVelMax(const Value: single);
begin
  FCentrifugalVelMax := Value;
end;

procedure TdxParticleEmitter.SetCentrifugalVelMin(const Value: single);
begin
  FCentrifugalVelMin := Value;
end;

procedure TdxParticleEmitter.SetTangentVelMax(const Value: single);
begin
  FTangentVelMax := Value;
end;

procedure TdxParticleEmitter.SetTangentVelMin(const Value: single);
begin
  FTangentVelMin := Value;
end;

procedure TdxParticleEmitter.SetVelocityMax(const Value: single);
begin
  FVelocityMax := Value;
end;

procedure TdxParticleEmitter.SetVelocityMin(const Value: single);
begin
  FVelocityMin := Value;
end;

procedure TdxParticleEmitter.SetBitmap(const Value: AnsiString);
begin
  if FBitmap <> Value then
  begin
    FBitmap := Value;
    Repaint;
  end;
end;

function TdxParticleEmitter.GetColorMax: AnsiString;
begin
  Result := FKeys[1].color;
end;

function TdxParticleEmitter.GetColorMin: AnsiString;
begin
  Result := FKeys[0].color;
end;

function TdxParticleEmitter.GetScaleMax: single;
begin
  Result := FKeys[1].scale;
end;

function TdxParticleEmitter.GetScaleMin: single;
begin
  Result := FKeys[0].scale;
end;

function TdxParticleEmitter.GetSpinMax: single;
begin
  Result := FKeys[1].spin;
end;

function TdxParticleEmitter.GetSpinMin: single;
begin
  Result := FKeys[0].spin;
end;

procedure TdxParticleEmitter.SetColorMax(const Value: AnsiString);
begin
  FKeys[1].color := Value;
end;

procedure TdxParticleEmitter.SetColorMin(const Value: AnsiString);
begin
  FKeys[0].color := Value;
end;

procedure TdxParticleEmitter.SetScaleMax(const Value: single);
begin
  FKeys[1].scale := Value;
end;

procedure TdxParticleEmitter.SetScaleMin(const Value: single);
begin
  FKeys[0].scale := Value;
end;

procedure TdxParticleEmitter.SetSpinMax(const Value: single);
begin
  FKeys[1].spin := Value;
end;

procedure TdxParticleEmitter.SetSpinMin(const Value: single);
begin
  FKeys[0].spin := Value;
end;

initialization
  RegisterDXObjects('Dynamics', [TdxParticleEmitter]);
end.
