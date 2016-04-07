unit dcm_utils;

{$I dcm_define.inc}

interface

uses
  {$IFDEF FPC}
  LCLProc, LCLType, LMessages, LResources,
  {$ENDIF}
  Classes, SysUtils, dcm_scene;

function GetToken(var S: AnsiString; Separators: AnsiString; Stop: AnsiString = ''): AnsiString;
function dxGetToken(var Pos: integer; const S: AnsiString; Separators: AnsiString;
  Stop: AnsiString = ''): AnsiString;

function dxFloatToStr(Value: single): AnsiString;
function dxStrToFloat(Value: AnsiString): single;

function dxPoint(X, Y, Z: single): TdxPoint; overload;
function dxPoint(const P: TdxVector): TdxPoint; overload;

function dxPointToString(R: TdxPoint): AnsiString;
function dxStringToPoint(S: AnsiString): TdxPoint;

function dxOpacity(const C: TdxColor; const AOpacity: single): TdxColor;
function dxColor(R, G, B: Byte; A: Byte = $FF): TdxColor;
function dxColorToStr(Value: TdxColor): AnsiString;
function dxStrToColor(Value: AnsiString): TdxColor;

function VertexSize(const AFormat: TdxVertexFormat): integer;

function Vertex(x, y, z: single): TdxVertex;
function VertexNormal(x, y, z, nx, ny, nz: single): TdxVertexNormal;
function TexVertexNormal(x, y, z, nx, ny, nz, tu, tv: single): TdxTexVertexNormal;
function ColorVertex(x, y, z: single; color: TdxColor): TdxColorVertex;
function ColorVertexNormal(x, y, z: single; nx, ny, nz: single; color: TdxColor): TdxColorVertexNormal;
function TexVertex(x, y, z: single; tu, tv: Single): TdxTexVertex;
function ColorTexVertex(x, y, z: single; color: TdxColor; tu, tv: Single): TdxColorTexVertex;
function ColorTexVertexNormal(x, y, z: single; nx, ny, nz: single; color: TdxColor; tu, tv: Single): TdxColorTexVertexNormal;

function VertexTodxVector(V: TdxVertex): TdxVector;
function dxVectortoVertex(V: TdxVector): TdxVertex;

{ Math functions }

function MinInt(A1, A2: integer): integer;
function MinFloat(A1, A2: single): single;
function MaxInt(A1, A2: integer): integer;
function MaxFloat(A1, A2: single): single;

function dxInterpolateSingle(const start, stop, t: single): single;
function dxInterpolateRotation(start, stop, t: Single): Single;
function dxInterpolateColor(start, stop: TdxColor; t: single): TdxColor;

function dxAppendColor(start, stop: TdxColor): TdxColor;
function dxSubtractColor(start, stop: TdxColor): TdxColor;

function dxTexVector(const u, v: Single): TdxTexVector;
function dxVector(const x, y, z: Single; const w: Single = 1.0): TdxVector; overload;
function dxVector(const Point: TdxPoint; const w: Single = 1.0): TdxVector; overload;

function MidPoint(const p1, p2: TdxVector): TdxVector;

function BSphere(center: TdxVector; radius: single): TdxBSphere;

function AABB(min, max: TdxVector): TdxAABB;
procedure AABBInclude(var bb: TdxAABB; const p: TdxVector);
procedure AABBTransform(var bb: TdxAABB; const m: TdxMatrix);
function IntersecTdxAABBsAbsolute(const aabb1, aabb2: TdxAABB): Boolean;

procedure SetdxVector(var V: TdxVector; const x, y, z: Single; const w: Single = 1.0);
function dxVectorNorm(const v: TdxVector): single;
procedure NormalizedxVector(var v: TdxVector);
function dxVectorNormalize(const v: TdxVector): TdxVector;
function dxVectorAdd(const v1: TdxVector; const v2: TdxVector): TdxVector;
procedure AdddxVector(var v1: TdxVector; const v2: TdxVector);
procedure CombinedxVector(var v1: TdxVector; const v2: TdxVector; f: single);
function dxVectorReflect(const V, N: TdxVector): TdxVector;
function dxVectorAddScale(const v1: TdxVector; const v2: single): TdxVector;
function dxVectorSubtract(const v1: TdxVector; const v2: TdxVector): TdxVector;
function dxVectorScale(const v: TdxVector; factor: Single): TdxVector;
function PointProject(const p, origin, direction: TdxVector): single;

function VectorDistance2(const v1, v2: TdxVector): single;
function dxVectorLength(const v: TdxVector): single;
function dxMatrixMultiply(const M1, M2: TdxMatrix): TdxMatrix;
function dxMatrixDeterminant(const M: TdxMatrix): single;
procedure AdjointdxMatrix(var M: TdxMatrix);
procedure ScaledxMatrix(var M: TdxMatrix; const factor: single);
procedure InvertMatrix(var M: TdxMatrix);
procedure TransposedxMatrix(var M: TdxMatrix);
function dxVectorCrossProduct(const V1, V2: TdxVector): TdxVector;
function dxVectorDotProduct(const V1, V2: TdxVector): single;
function dxVectorAngleCosine(const V1, V2: TdxVector): Single;
function dxVectorTransform(const V: TdxVector; const M: TdxMatrix): TdxVector;
function dxCalcPlaneNormal(const p1, p2, p3: TdxVector): TdxVector;
procedure RotateVector(var vector: TdxVector; const axis: TdxVector; angle: single);
function dxCreateRotationMatrix(const anAxis: TdxVector; angle: single): TdxMatrix;
function dxCreateYawPitchRollMatrix(const y, p, r: single): TdxMatrix;

{ Matrix }

function MatrixOrthoLH(w, h, zn, zf: Single): TdxMatrix;
function MatrixOrthoOffCenterLH(l, r, b, t, zn, zf: Single): TdxMatrix;
function MatrixOrthoOffCenterRH(l, r, b, t, zn, zf: Single): TdxMatrix;
function MatrixPerspectiveFovRH(flovy, aspect, zn, zf: Single): TdxMatrix;
function MatrixPerspectiveFovLH(flovy, aspect, zn, zf: Single): TdxMatrix;
function MatrixPerspectiveOffCenterLH(l, r, b, t, zn, zf: Single): TdxMatrix;
function MatrixLookAtRH(const Eye, At, Up: TdxVector): TdxMatrix;
function MatrixLookAtDirRH(const Pos, Dir, Up: TdxVector): TdxMatrix;

function MakeShadowMatrix(const planePoint, planeNormal, lightPos: TdxVector): TdxMatrix;
function MakeReflectionMatrix(const planePoint, planeNormal: TdxVector): TdxMatrix;

{ Quaternion }

procedure NormalizeQuaternion(var q: TdxQuaternion);
function QuaternionToMatrix(quat: TdxQuaternion): TdxMatrix;
function QuaternionMultiply(const qL, qR: TdxQuaternion): TdxQuaternion;
function QuaternionFromAngleAxis(const angle: Single; const axis: TdxVector): TdxQuaternion;
function dxQuaternionFromMatrix(const mat: TdxMatrix): TdxQuaternion;

function RSqrt(v: Single): Single;
function ISqrt(i: Integer): Integer;

{ Angles }

function DegToRad(const Degrees: single): single;
function RadToDeg(const Degrees: single): single;

procedure SinCos(const Theta: single; var Sin, Cos: single);

function ArcCos(const x: Single): Single;
function ArcSin(const x: Single): Single;
function ArcTan2(const a, b: Single): Single;

function NormalizeDegAngle(angle: Single): Single;

function RoundInt(v: Single): Single;

function IsPowerOf2(value: Integer): Boolean;
function RoundDownToPowerOf2(value: Integer): Integer;
function RoundUpToPowerOf2(value: Integer): Integer;

function Power(const Base, Exponent: Single): Single; overload;
function Power(Base: Single; Exponent: Integer): Single; overload;

{ Intersection }

function RayCastPlaneIntersect(const rayStart, rayVector: TdxVector;
  const planePoint, planeNormal: TdxVector;
  var intersectPoint: TdxVector): Boolean;

function RayCastIntersectsSphere(const rayStart, rayVector: TdxVector;
  const sphereCenter: TdxVector;
  const sphereRadius: Single): Boolean;

function RayCastSphereIntersect(const rayStart, rayVector: TdxVector;
  const sphereCenter: TdxVector;
  const sphereRadius: Single;
  var i1, i2: TdxVector): Integer;

function RayCastTriangleIntersect(const rayStart, rayVector: TdxVector;
  const p1, p2, p3: TdxVector;
  intersectPoint: PdxVector = nil;
  intersectNormal: PdxVector = nil): Boolean;

const
  cEps = 0.0000000001;
  EPSILON2: Single = 1E-30;

implementation

uses Math;

const

  // to be used as descriptive indices
  X = 0;
  Y = 1;
  Z = 2;
  W = 3;

  cZero: Single = 0.0;
  cOne: Single = 1.0;
  cOneDotFive: Single = 0.5;

  {$IFNDEF KS_COMPILER6_UP}
type
  PInteger = ^Integer;
  {$ENDIF}

function GetToken(var S: AnsiString; Separators: AnsiString; Stop: AnsiString = ''): AnsiString;
var
  i, Len: integer;
  CopyS: AnsiString;
begin
  Result := '';
  CopyS := S;
  Len := Length(CopyS);
  for i := 1 to Len do
  begin
    if Pos(CopyS[i], Stop) > 0 then
      Break;
    Delete(S, 1, 1);
    if Pos(CopyS[i], Separators) > 0 then
    begin
      Result := Result;
      Break;
    end;
    Result := Result + CopyS[i];
  end;
  Result := Trim(Result);
  S := Trim(S);
end;

function dxGetToken(var Pos: integer; const S: AnsiString; Separators: AnsiString; Stop: AnsiString = ''): AnsiString;
var
  i, Len: integer;
begin
  Result := '';
  Len := Length(S);
  for i := Pos to Len do
  begin
    if System.Pos(S[i], Stop) > 0 then
      Break;
    if System.Pos(S[i], Separators) > 0 then
      Break;
    Result := Result + S[i];
  end;
  { skip separators }
  Pos := i;
  for i := Pos to Len do
    if System.Pos(S[i], Separators) <= 0 then
      Break;
  Pos := i;
end;

function dxFloatToStr(Value: single): AnsiString;
var
  S: char;
  Buffer: array[0..63] of Char;
begin
  S := DecimalSeparator;
  try
    DecimalSeparator := '.';
    if Frac(Value) <> 0 then
    begin
      Result := FloatToStrF(Value, ffGeneral, 6, 0);
    end
    else
      Result := IntToStr(Trunc(Value))
  finally
    DecimalSeparator := S;
  end;
end;

function dxStrToFloat(Value: AnsiString): single;
var
  S: char;
begin
  S := DecimalSeparator;
  try
    DecimalSeparator := '.';
    Result := StrToFloat(Value);
  finally
    DecimalSeparator := S;
  end;
end;

function dxPoint(X, Y, Z: single): TdxPoint;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

function dxPoint(const P: TdxVector): TdxPoint;
begin
  Result.X := P.X;
  Result.Y := P.Y;
  Result.Z := P.Z;
end;

function dxPointToString(R: TdxPoint): AnsiString;
begin
  Result := '(' + dxFloatToStr(R.X) + ',' + dxFloatToStr(R.Y) + ',' + dxFloatToStr(R.Z) + ')';
end;

function dxStringToPoint(S: AnsiString): TdxPoint;
begin
  try
    GetToken(S, ',()');
    Result.X := dxStrToFloat(GetToken(S, ',()'));
    Result.Y := dxStrToFloat(GetToken(S, ',()'));
    Result.Z := dxStrToFloat(GetToken(S, ',()'));
  except
    Result := dxPoint(0, 0, 0);
  end;
end;

{ Colros }

function dxOpacity(const C: TdxColor; const AOpacity: single): TdxColor;
begin
  Result := C;
  if AOpacity < 1 then
    TdxColorRec(Result).A := Trunc(TdxColorRec(C).A * AOpacity);
end;

function dxColor(R, G, B: Byte; A: Byte = $FF): TdxColor;
begin
  TdxColorRec(Result).R := R;
  TdxColorRec(Result).G := G;
  TdxColorRec(Result).B := B;
  TdxColorRec(Result).A := A;
end;

function dxColorToStr(Value: TdxColor): AnsiString;
begin
  Result := '#' + IntToHex(Value, 8);
end;

function dxStrToColor(Value: AnsiString): TdxColor;
begin
  if Value = #0 then
    Value := '$0'
  else
    if (Value <> '') and (Value[1] = '#') then
    Value[1] := '$';
  try
    Result := StrToInt(Value);
  except
  end;
end;

{ Vertexs }

function VertexSize(const AFormat: TdxVertexFormat): integer;
begin
  case AFormat of
    vfVertex: Result := SizeOf(TdxVertex);
    vfVertexNormal: Result := SizeOf(TdxVertexNormal);
    vfTexVertexNormal: Result := SizeOf(TdxTexVertexNormal);
    vfTexVertex: Result := SizeOf(TdxTexVertex);
    vfColorVertex: Result := SizeOf(TdxColorVertex);
    vfColorVertexNormal: Result := SizeOf(TdxColorVertexNormal);
    vfColorTexVertex: Result := SizeOf(TdxColorTexVertex);
    vfColorTexVertexNormal: Result := SizeOf(TdxColorTexVertexNormal);
  else
    Result := 0;
  end;
end;

function Vertex(x, y, z: single): TdxVertex;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
end;

function VertexNormal(x, y, z, nx, ny, nz: single): TdxVertexNormal;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
  Result.nx := nx;
  Result.ny := ny;
  Result.nz := nz;
end;

function TexVertexNormal(x, y, z, nx, ny, nz, tu, tv: single): TdxTexVertexNormal;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
  Result.nx := nx;
  Result.ny := ny;
  Result.nz := nz;
  Result.tu := tu;
  Result.tv := tv;
end;

function ColorVertex(x, y, z: single; color: TdxColor): TdxColorVertex;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
  Result.color := color;
end;

function ColorVertexNormal(x, y, z: single; nx, ny, nz: single; color: TdxColor): TdxColorVertexNormal;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
  Result.nx := nx;
  Result.ny := ny;
  Result.nz := nz;
  Result.color := color;
end;

function TexVertex(x, y, z: single; tu, tv: Single): TdxTexVertex;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
  Result.tu := tu;
  Result.tv := tv;
end;

function ColorTexVertex(x, y, z: single; color: TdxColor; tu, tv: Single): TdxColorTexVertex;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
  Result.color := color;
  Result.tu := tu;
  Result.tv := tv;
end;

function ColorTexVertexNormal(x, y, z: single; nx, ny, nz: single; color: TdxColor; tu, tv: Single): TdxColorTexVertexNormal;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
  Result.nx := nx;
  Result.ny := ny;
  Result.nz := nz;
  Result.color := color;
  Result.tu := tu;
  Result.tv := tv;
end;

function VertexTodxVector(V: TdxVertex): TdxVector;
begin
  Result.X := V.X;
  Result.Y := V.Y;
  Result.Z := V.Z;
  Result.W := 1.0;
end;

function dxVectorToVertex(V: TdxVector): TdxVertex;
begin
  Result.X := V.X;
  Result.Y := V.Y;
  Result.Z := V.Z;
end;

function MinInt(A1, A2: integer): integer;
begin
  if A1 < A2 then
    Result := A1
  else
    Result := A2;
end;

function MinFloat(A1, A2: single): single;
begin
  if A1 < A2 then
    Result := A1
  else
    Result := A2;
end;

function MaxInt(A1, A2: integer): integer;
begin
  if A1 > A2 then
    Result := A1
  else
    Result := A2;
end;

function MaxFloat(A1, A2: single): single;
begin
  if A1 > A2 then
    Result := A1
  else
    Result := A2;
end;

function Lerp(const start, stop, t: Single): Single;
begin
  Result := start + (stop - start) * t;
end;

function ColorLerp(start, stop: TdxColor; t: single): TdxColor;
begin
  TdxColorRec(Result).A := TdxColorRec(start).A + Trunc((TdxColorRec(stop).A - TdxColorRec(start).A) * t);
  TdxColorRec(Result).R := TdxColorRec(start).R + Trunc((TdxColorRec(stop).R - TdxColorRec(start).R) * t);
  TdxColorRec(Result).G := TdxColorRec(start).G + Trunc((TdxColorRec(stop).G - TdxColorRec(start).G) * t);
  TdxColorRec(Result).B := TdxColorRec(start).B + Trunc((TdxColorRec(stop).B - TdxColorRec(start).B) * t);
end;

function dxInterpolateSingle(const start, stop, t: single): single;
begin
  Result := start + (stop - start) * t;
end;

function dxInterpolateRotation(start, stop, t: Single): Single;
begin
  Result := dxInterpolateSingle(start, stop, t);
end;

function dxInterpolateColor(start, stop: TdxColor; t: single): TdxColor;
begin
  TdxColorRec(Result).A := TdxColorRec(start).A + Trunc((TdxColorRec(stop).A - TdxColorRec(start).A) * t);
  TdxColorRec(Result).R := TdxColorRec(start).R + Trunc((TdxColorRec(stop).R - TdxColorRec(start).R) * t);
  TdxColorRec(Result).G := TdxColorRec(start).G + Trunc((TdxColorRec(stop).G - TdxColorRec(start).G) * t);
  TdxColorRec(Result).B := TdxColorRec(start).B + Trunc((TdxColorRec(stop).B - TdxColorRec(start).B) * t);
end;

function dxAppendColor(start, stop: TdxColor): TdxColor;
begin
  if TdxColorRec(start).A + TdxColorRec(stop).A < $FF then
    TdxColorRec(Result).A := TdxColorRec(start).A + TdxColorRec(stop).A
  else
    TdxColorRec(Result).A := $FF;
  if TdxColorRec(start).R + TdxColorRec(stop).R < $FF then
    TdxColorRec(Result).R := TdxColorRec(start).R + TdxColorRec(stop).R
  else
    TdxColorRec(Result).R := $FF;
  if TdxColorRec(start).G + TdxColorRec(stop).G < $FF then
    TdxColorRec(Result).G := TdxColorRec(start).G + TdxColorRec(stop).G
  else
    TdxColorRec(Result).G := $FF;
  if TdxColorRec(start).B + TdxColorRec(stop).B < $FF then
    TdxColorRec(Result).B := TdxColorRec(start).B + TdxColorRec(stop).B
  else
    TdxColorRec(Result).B := $FF;
end;

function dxSubtractColor(start, stop: TdxColor): TdxColor;
begin
  if TdxColorRec(start).A - TdxColorRec(stop).A < $FF then
    TdxColorRec(Result).A := TdxColorRec(start).A - TdxColorRec(stop).A
  else
    TdxColorRec(Result).A := $FF;
  if TdxColorRec(start).R - TdxColorRec(stop).R < $FF then
    TdxColorRec(Result).R := TdxColorRec(start).R - TdxColorRec(stop).R
  else
    TdxColorRec(Result).R := $FF;
  if TdxColorRec(start).G - TdxColorRec(stop).G < $FF then
    TdxColorRec(Result).G := TdxColorRec(start).G - TdxColorRec(stop).G
  else
    TdxColorRec(Result).G := $FF;
  if TdxColorRec(start).B - TdxColorRec(stop).B < $FF then
    TdxColorRec(Result).B := TdxColorRec(start).B - TdxColorRec(stop).B
  else
    TdxColorRec(Result).B := $FF;
end;

{ vectors }

function dxTexVector(const u, v: Single): TdxTexVector;
begin
  Result.S := u;
  Result.T := v;
end;

function dxVector(const x, y, z: Single; const w: Single = 1.0): TdxVector;
begin
  Result.X := x;
  Result.Y := y;
  Result.Z := z;
  Result.W := w;
end;

function dxVector(const Point: TdxPoint; const w: Single = 1.0): TdxVector;
begin
  Result.X := Point.X;
  Result.Y := Point.Y;
  Result.Z := Point.Z;
  Result.W := w;
end;

function MidPoint(const p1, p2: TdxVector): TdxVector;
begin
  Result.x := (p1.x + p2.x) / 2;
  Result.y := (p1.y + p2.y) / 2;
  Result.z := (p1.z + p2.z) / 2;
  Result.w := 1;
end;

function BSphere(center: TdxVector; radius: single): TdxBSphere;
begin
  Result.center := center;
  Result.Radius := radius;
end;

function AABB(min, max: TdxVector): TdxAABB;
begin
  Result.min := min;
  Result.max := max;
end;

procedure AABBInclude(var bb: TdxAABB; const p: TdxVector);
begin
  if p.V[0] < bb.min.V[0] then
    bb.min.V[0] := p.V[0];
  if p.V[0] > bb.max.V[0] then
    bb.max.V[0] := p.V[0];
  if p.V[1] < bb.min.V[1] then
    bb.min.V[1] := p.V[1];
  if p.V[1] > bb.max.V[1] then
    bb.max.V[1] := p.V[1];
  if p.V[2] < bb.min.V[2] then
    bb.min.V[2] := p.V[2];
  if p.V[2] > bb.max.V[2] then
    bb.max.V[2] := p.V[2];
end;

procedure AABBTransform(var bb: TdxAABB; const m: TdxMatrix);
var
  oldMin, oldMax: TdxVector;
begin
  oldMin := bb.min;
  oldMax := bb.max;
  bb.min := dxVectorTransform(oldMin, m);
  bb.max := bb.min;
  AABBInclude(bb, dxVectorTransform(dxVector(oldMin.V[0], oldMin.V[1], oldMax.V[2]), m));
  AABBInclude(bb, dxVectorTransform(dxVector(oldMin.V[0], oldMax.V[1], oldMin.V[2]), m));
  AABBInclude(bb, dxVectorTransform(dxVector(oldMin.V[0], oldMax.V[1], oldMax.V[2]), m));
  AABBInclude(bb, dxVectorTransform(dxVector(oldMax.V[0], oldMin.V[1], oldMin.V[2]), m));
  AABBInclude(bb, dxVectorTransform(dxVector(oldMax.V[0], oldMin.V[1], oldMax.V[2]), m));
  AABBInclude(bb, dxVectorTransform(dxVector(oldMax.V[0], oldMax.V[1], oldMin.V[2]), m));
  AABBInclude(bb, dxVectorTransform(oldMax, m));
end;

function IntersecTdxAABBsAbsolute(const aabb1, aabb2: TdxAABB): Boolean;
begin
  result := not
    ((AABB1.min.V[0] > AABB2.max.V[0]) or
    (AABB1.min.V[1] > AABB2.max.V[1]) or
    (AABB1.min.V[2] > AABB2.max.V[2]) or

    (AABB2.min.V[0] > AABB1.max.V[0]) or
    (AABB2.min.V[1] > AABB1.max.V[1]) or
    (AABB2.min.V[2] > AABB1.max.V[2]));
end;

procedure NormalizePlane(var plane: TdxVector);
var
  n: Single;
begin
  n := RSqrt(abs(plane.V[0] * plane.V[0] + plane.V[1] * plane.V[1] + plane.V[2] * plane.V[2]));
  plane.v[0] := plane.v[0] * n;
  plane.v[1] := plane.v[1] * n;
  plane.v[2] := plane.v[2] * n;
  plane.v[3] := 1;
end;

function PlaneEvaluatePoint(const plane: TdxVector; const point: TdxVector): Single;
begin
  Result := plane.V[0] * point.V[0] + plane.V[1] * point.V[1] + plane.V[2] * point.V[2] + plane.V[3];
end;

procedure ExtracTdxAABBCorners(const AABB: TdxAABB; var AABBCorners: TdxAABBCorners);
begin
  AABBCorners[0] := dxVector(AABB.min.v[0], AABB.min.v[1], AABB.min.v[2]);
  AABBCorners[1] := dxVector(AABB.min.v[0], AABB.min.v[1], AABB.max.v[2]);
  AABBCorners[2] := dxVector(AABB.min.v[0], AABB.max.v[1], AABB.min.v[2]);
  AABBCorners[3] := dxVector(AABB.min.v[0], AABB.max.v[1], AABB.max.v[2]);

  AABBCorners[4] := dxVector(AABB.max.v[0], AABB.min.v[1], AABB.min.v[2]);
  AABBCorners[5] := dxVector(AABB.max.v[0], AABB.min.v[1], AABB.max.v[2]);
  AABBCorners[6] := dxVector(AABB.max.v[0], AABB.max.v[1], AABB.min.v[2]);
  AABBCorners[7] := dxVector(AABB.max.v[0], AABB.max.v[1], AABB.max.v[2]);
end;

procedure SetdxVector(var V: TdxVector; const x, y, z: Single; const w: Single = 1.0);
begin
  V := dxVector(x, y, z, w);
end;

function dxVectorNorm(const v: TdxVector): single;
begin
  Result := v.v[0] * v.v[0] + v.v[1] * v.v[1] + v.v[2] * v.v[2];
end;

procedure NormalizedxVector(var v: TdxVector);
var
  invLen: Single;
begin
  invLen := RSqrt(Abs(dxVectorNorm(v)));
  v.v[0] := v.v[0] * invLen;
  v.v[1] := v.v[1] * invLen;
  v.v[2] := v.v[2] * invLen;
  v.v[3] := 0.0;
end;

function dxVectorNormalize(const v: TdxVector): TdxVector;
var
  invLen: Single;
begin
  invLen := RSqrt(Abs(dxVectorNorm(v)));
  Result.v[0] := v.v[0] * invLen;
  Result.v[1] := v.v[1] * invLen;
  Result.v[2] := v.v[2] * invLen;
  Result.v[3] := 0.0;
end;

function dxVectorAdd(const v1: TdxVector; const v2: TdxVector): TdxVector;
begin
  Result.v[0] := v1.v[0] + v2.v[0];
  Result.v[1] := v1.v[1] + v2.v[1];
  Result.v[2] := v1.v[2] + v2.v[2];
  Result.W := 1.0;
end;

procedure dxVectorCombine(const V1, V2: TdxVector; const F2: single; var vr: TdxVector);
begin
  vr.V[0] := V1.V[0] + (F2 * V2.V[0]);
  vr.V[1] := V1.V[1] + (F2 * V2.V[1]);
  vr.V[2] := V1.V[2] + (F2 * V2.V[2]);
  vr.W := 1;
end;

function dxVectorCombine2(const V1, V2: TdxVector; const F1, F2: Single): TdxVector;
begin
  Result.V[X] := (F1 * V1.V[X]) + (F2 * V2.V[X]);
  Result.V[Y] := (F1 * V1.V[Y]) + (F2 * V2.V[Y]);
  Result.V[Z] := (F1 * V1.V[Z]) + (F2 * V2.V[Z]);
  Result.W := 1.0;
end;

function dxVectorReflect(const V, N: TdxVector): TdxVector;
begin
  Result := dxVectorCombine2(V, N, 1, -2 * dxVectorDotProduct(V, N));
end;

function dxVectorAddScale(const v1: TdxVector; const v2: single): TdxVector;
begin
  Result.v[0] := v1.v[0] + v2;
  Result.v[1] := v1.v[1] + v2;
  Result.v[2] := v1.v[2] + v2;
  Result.v[3] := 1.0;
end;

procedure AdddxVector(var v1: TdxVector; const v2: TdxVector);
begin
  v1 := dxVectorAdd(v1, v2);
end;

procedure CombinedxVector(var v1: TdxVector; const v2: TdxVector; f: single);
begin
  v1.V[0] := v1.V[0] + v2.V[0] * f;
  v1.V[1] := v1.V[1] + v2.V[1] * f;
  v1.V[2] := v1.V[2] + v2.V[2] * f;
  v1.V[3] := 1.0;
end;

function dxVectorSubtract(const v1: TdxVector; const v2: TdxVector): TdxVector;
begin
  Result.v[0] := v1.v[0] - v2.v[0];
  Result.v[1] := v1.v[1] - v2.v[1];
  Result.v[2] := v1.v[2] - v2.v[2];
  Result.W := 1.0;
end;

function dxVectorLength(const v: TdxVector): single;
var
  R: double;
begin
  R := (v.x * v.x) + (v.y * v.y) + (v.z * v.z);
  Result := Sqrt(R);
end;

function dxVectorScale(const v: TdxVector; factor: Single): TdxVector;
begin
  Result.v[0] := v.v[0] * factor;
  Result.v[1] := v.v[1] * factor;
  Result.v[2] := v.v[2] * factor;
  Result.v[3] := 1;
end;

function PointProject(const p, origin, direction: TdxVector): single;
begin
  Result := direction.V[0] * (p.V[0] - origin.V[0])
    + direction.V[1] * (p.V[1] - origin.V[1])
    + direction.V[2] * (p.V[2] - origin.V[2]);
end;

function VectorDistance2(const v1, v2: TdxVector): single;
begin
  Result := Sqr(v2.V[0] - v1.V[0]) + Sqr(v2.V[1] - v1.V[1]) + Sqr(v2.V[2] - v1.V[2]);
end;

function dxMatrixMultiply(const M1, M2: TdxMatrix): TdxMatrix;
begin
  Result.M[X].V[X] := M1.M[X].V[X] * M2.M[X].V[X] + M1.M[X].V[Y] * M2.M[Y].V[X] + M1.M[X].V[Z] * M2.M[Z].V[X] + M1.M[X].V[W] * M2.M[W].V[X];
  Result.M[X].V[Y] := M1.M[X].V[X] * M2.M[X].V[Y] + M1.M[X].V[Y] * M2.M[Y].V[Y] + M1.M[X].V[Z] * M2.M[Z].V[Y] + M1.M[X].V[W] * M2.M[W].V[Y];
  Result.M[X].V[Z] := M1.M[X].V[X] * M2.M[X].V[Z] + M1.M[X].V[Y] * M2.M[Y].V[Z] + M1.M[X].V[Z] * M2.M[Z].V[Z] + M1.M[X].V[W] * M2.M[W].V[Z];
  Result.M[X].V[W] := M1.M[X].V[X] * M2.M[X].V[W] + M1.M[X].V[Y] * M2.M[Y].V[W] + M1.M[X].V[Z] * M2.M[Z].V[W] + M1.M[X].V[W] * M2.M[W].V[W];
  Result.M[Y].V[X] := M1.M[Y].V[X] * M2.M[X].V[X] + M1.M[Y].V[Y] * M2.M[Y].V[X] + M1.M[Y].V[Z] * M2.M[Z].V[X] + M1.M[Y].V[W] * M2.M[W].V[X];
  Result.M[Y].V[Y] := M1.M[Y].V[X] * M2.M[X].V[Y] + M1.M[Y].V[Y] * M2.M[Y].V[Y] + M1.M[Y].V[Z] * M2.M[Z].V[Y] + M1.M[Y].V[W] * M2.M[W].V[Y];
  Result.M[Y].V[Z] := M1.M[Y].V[X] * M2.M[X].V[Z] + M1.M[Y].V[Y] * M2.M[Y].V[Z] + M1.M[Y].V[Z] * M2.M[Z].V[Z] + M1.M[Y].V[W] * M2.M[W].V[Z];
  Result.M[Y].V[W] := M1.M[Y].V[X] * M2.M[X].V[W] + M1.M[Y].V[Y] * M2.M[Y].V[W] + M1.M[Y].V[Z] * M2.M[Z].V[W] + M1.M[Y].V[W] * M2.M[W].V[W];
  Result.M[Z].V[X] := M1.M[Z].V[X] * M2.M[X].V[X] + M1.M[Z].V[Y] * M2.M[Y].V[X] + M1.M[Z].V[Z] * M2.M[Z].V[X] + M1.M[Z].V[W] * M2.M[W].V[X];
  Result.M[Z].V[Y] := M1.M[Z].V[X] * M2.M[X].V[Y] + M1.M[Z].V[Y] * M2.M[Y].V[Y] + M1.M[Z].V[Z] * M2.M[Z].V[Y] + M1.M[Z].V[W] * M2.M[W].V[Y];
  Result.M[Z].V[Z] := M1.M[Z].V[X] * M2.M[X].V[Z] + M1.M[Z].V[Y] * M2.M[Y].V[Z] + M1.M[Z].V[Z] * M2.M[Z].V[Z] + M1.M[Z].V[W] * M2.M[W].V[Z];
  Result.M[Z].V[W] := M1.M[Z].V[X] * M2.M[X].V[W] + M1.M[Z].V[Y] * M2.M[Y].V[W] + M1.M[Z].V[Z] * M2.M[Z].V[W] + M1.M[Z].V[W] * M2.M[W].V[W];
  Result.M[W].V[X] := M1.M[W].V[X] * M2.M[X].V[X] + M1.M[W].V[Y] * M2.M[Y].V[X] + M1.M[W].V[Z] * M2.M[Z].V[X] + M1.M[W].V[W] * M2.M[W].V[X];
  Result.M[W].V[Y] := M1.M[W].V[X] * M2.M[X].V[Y] + M1.M[W].V[Y] * M2.M[Y].V[Y] + M1.M[W].V[Z] * M2.M[Z].V[Y] + M1.M[W].V[W] * M2.M[W].V[Y];
  Result.M[W].V[Z] := M1.M[W].V[X] * M2.M[X].V[Z] + M1.M[W].V[Y] * M2.M[Y].V[Z] + M1.M[W].V[Z] * M2.M[Z].V[Z] + M1.M[W].V[W] * M2.M[W].V[Z];
  Result.M[W].V[W] := M1.M[W].V[X] * M2.M[X].V[W] + M1.M[W].V[Y] * M2.M[Y].V[W] + M1.M[W].V[Z] * M2.M[Z].V[W] + M1.M[W].V[W] * M2.M[W].V[W];
end;

function dxVectorCrossProduct(const V1, V2: TdxVector): TdxVector;
begin
  Result.X := v1.Y * v2.Z - v1.Z * v2.Y;
  Result.Y := v1.Z * v2.X - v1.X * v2.Z;
  Result.Z := v1.X * v2.Y - v1.Y * v2.X;
  Result.W := 1.0;
end;

function dxVectorDotProduct(const V1, V2: TdxVector): single;
begin
  Result := V1.V[0] * V2.V[0] + V1.V[1] * V2.V[1] + V1.V[2] * V2.V[2];
end;

function dxCalcPlaneNormal(const p1, p2, p3: TdxVector): TdxVector;
var
  v1, v2: TdxVector;
begin
  v1 := dxVectorSubtract(p2, p1);
  v2 := dxVectorSubtract(p3, p1);
  Result := dxVectorCrossProduct(v1, v2);
  Result := dxVectorNormalize(Result);
end;

function dxVectorAngleCosine(const V1, V2: TdxVector): Single;
begin
  Result := dxVectorLength(V1) * dxVectorLength(V2);
  if Abs(Result) > Epsilon then
    Result := dxVectorDotProduct(V1, V2) / Result
  else
    Result := dxVectorDotProduct(V1, V2) / Epsilon;
end;

function dxVectorTransform(const V: TdxVector; const M: TdxMatrix): TdxVector;
begin
  Result.V[X] := V.V[X] * M.M[X].V[X] + V.V[Y] * M.M[Y].V[X] + V.V[Z] * M.M[Z].V[X] + V.V[W] * M.M[W].V[X];
  Result.V[Y] := V.V[X] * M.M[X].V[Y] + V.V[Y] * M.M[Y].V[Y] + V.V[Z] * M.M[Z].V[Y] + V.V[W] * M.M[W].V[Y];
  Result.V[Z] := V.V[X] * M.M[X].V[Z] + V.V[Y] * M.M[Y].V[Z] + V.V[Z] * M.M[Z].V[Z] + V.V[W] * M.M[W].V[Z];
  Result.V[W] := 1;
end;

procedure RotateVector(var vector: TdxVector; const axis: TdxVector; angle: single);
var
  rotMatrix: TdxMatrix;
begin
  rotMatrix := dxCreateRotationMatrix(axis, Angle);
  vector := dxVectorTransform(vector, rotMatrix);
end;

function MatrixDetInternal(const a1, a2, a3, b1, b2, b3, c1, c2, c3: Single): Single;
begin
  Result := a1 * (b2 * c3 - b3 * c2)
    - b1 * (a2 * c3 - a3 * c2)
    + c1 * (a2 * b3 - a3 * b2);
end;

function dxMatrixDeterminant(const M: TdxMatrix): single;
begin
  Result := M.M[X].V[X] * MatrixDetInternal(M.M[Y].V[Y], M.M[Z].V[Y], M.M[W].V[Y], M.M[Y].V[Z], M.M[Z].V[Z], M.M[W].V[Z], M.M[Y].V[W], M.M[Z].V[W], M.M[W].V[W])
    - M.M[X].V[Y] * MatrixDetInternal(M.M[Y].V[X], M.M[Z].V[X], M.M[W].V[X], M.M[Y].V[Z], M.M[Z].V[Z], M.M[W].V[Z], M.M[Y].V[W], M.M[Z].V[W], M.M[W].V[W])
    + M.M[X].V[Z] * MatrixDetInternal(M.M[Y].V[X], M.M[Z].V[X], M.M[W].V[X], M.M[Y].V[Y], M.M[Z].V[Y], M.M[W].V[Y], M.M[Y].V[W], M.M[Z].V[W], M.M[W].V[W])
    - M.M[X].V[W] * MatrixDetInternal(M.M[Y].V[X], M.M[Z].V[X], M.M[W].V[X], M.M[Y].V[Y], M.M[Z].V[Y], M.M[W].V[Y], M.M[Y].V[Z], M.M[Z].V[Z], M.M[W].V[Z]);
end;

procedure AdjointdxMatrix(var M: TdxMatrix);
var
  a1, a2, a3, a4,
    b1, b2, b3, b4,
    c1, c2, c3, c4,
    d1, d2, d3, d4: Single;
begin
  a1 := M.M[X].V[X];
  b1 := M.M[X].V[Y];
  c1 := M.M[X].V[Z];
  d1 := M.M[X].V[W];
  a2 := M.M[Y].V[X];
  b2 := M.M[Y].V[Y];
  c2 := M.M[Y].V[Z];
  d2 := M.M[Y].V[W];
  a3 := M.M[Z].V[X];
  b3 := M.M[Z].V[Y];
  c3 := M.M[Z].V[Z];
  d3 := M.M[Z].V[W];
  a4 := M.M[W].V[X];
  b4 := M.M[W].V[Y];
  c4 := M.M[W].V[Z];
  d4 := M.M[W].V[W];

  // row column labeling reversed since we transpose rows & columns
  M.M[X].V[X] := MatrixDetInternal(b2, b3, b4, c2, c3, c4, d2, d3, d4);
  M.M[Y].V[X] := -MatrixDetInternal(a2, a3, a4, c2, c3, c4, d2, d3, d4);
  M.M[Z].V[X] := MatrixDetInternal(a2, a3, a4, b2, b3, b4, d2, d3, d4);
  M.M[W].V[X] := -MatrixDetInternal(a2, a3, a4, b2, b3, b4, c2, c3, c4);

  M.M[X].V[Y] := -MatrixDetInternal(b1, b3, b4, c1, c3, c4, d1, d3, d4);
  M.M[Y].V[Y] := MatrixDetInternal(a1, a3, a4, c1, c3, c4, d1, d3, d4);
  M.M[Z].V[Y] := -MatrixDetInternal(a1, a3, a4, b1, b3, b4, d1, d3, d4);
  M.M[W].V[Y] := MatrixDetInternal(a1, a3, a4, b1, b3, b4, c1, c3, c4);

  M.M[X].V[Z] := MatrixDetInternal(b1, b2, b4, c1, c2, c4, d1, d2, d4);
  M.M[Y].V[Z] := -MatrixDetInternal(a1, a2, a4, c1, c2, c4, d1, d2, d4);
  M.M[Z].V[Z] := MatrixDetInternal(a1, a2, a4, b1, b2, b4, d1, d2, d4);
  M.M[W].V[Z] := -MatrixDetInternal(a1, a2, a4, b1, b2, b4, c1, c2, c4);

  M.M[X].V[W] := -MatrixDetInternal(b1, b2, b3, c1, c2, c3, d1, d2, d3);
  M.M[Y].V[W] := MatrixDetInternal(a1, a2, a3, c1, c2, c3, d1, d2, d3);
  M.M[Z].V[W] := -MatrixDetInternal(a1, a2, a3, b1, b2, b3, d1, d2, d3);
  M.M[W].V[W] := MatrixDetInternal(a1, a2, a3, b1, b2, b3, c1, c2, c3);
end;

procedure ScaledxMatrix(var M: TdxMatrix; const factor: single);
var
  i: Integer;
begin
  for i := 0 to 3 do
  begin
    M.M[I].V[0] := M.M[I].V[0] * Factor;
    M.M[I].V[1] := M.M[I].V[1] * Factor;
    M.M[I].V[2] := M.M[I].V[2] * Factor;
    M.M[I].V[3] := M.M[I].V[3] * Factor;
  end;
end;

procedure TransposedxMatrix(var M: TdxMatrix);
var
  f: Single;
begin
  f := M.M[0].V[1];
  M.M[0].V[1] := M.M[1].V[0];
  M.M[1].V[0] := f;
  f := M.M[0].V[2];
  M.M[0].V[2] := M.M[2].V[0];
  M.M[2].V[0] := f;
  f := M.M[0].V[3];
  M.M[0].V[3] := M.M[3].V[0];
  M.M[3].V[0] := f;
  f := M.M[1].V[2];
  M.M[1].V[2] := M.M[2].V[1];
  M.M[2].V[1] := f;
  f := M.M[1].V[3];
  M.M[1].V[3] := M.M[3].V[1];
  M.M[3].V[1] := f;
  f := M.M[2].V[3];
  M.M[2].V[3] := M.M[3].V[2];
  M.M[3].V[2] := f;
end;

procedure InvertMatrix(var M: TdxMatrix);
var
  det: Single;
begin
  det := dxMatrixDeterminant(M);
  if Abs(Det) < EPSILON then
    M := IdentityMatrix
  else
  begin
    AdjointdxMatrix(M);
    ScaledxMatrix(M, 1 / det);
  end;
end;

function dxCreateRotationMatrix(const anAxis: TdxVector; angle: single): TdxMatrix;
var
  axis: TdxVector;
  cosine, sine, one_minus_cosine: Single;
begin
  SinCos(NormalizeDegAngle(angle), sine, cosine);
  one_minus_cosine := 1 - cosine;
  axis := dxVectorNormalize(anAxis);

  Result.M[X].V[X] := (one_minus_cosine * axis.V[0] * axis.V[0]) + cosine;
  Result.M[X].V[Y] := (one_minus_cosine * axis.V[0] * axis.V[1]) - (axis.V[2] * sine);
  Result.M[X].V[Z] := (one_minus_cosine * axis.V[2] * axis.V[0]) + (axis.V[1] * sine);
  Result.M[X].V[W] := 0;

  Result.M[Y].V[X] := (one_minus_cosine * axis.V[0] * axis.V[1]) + (axis.V[2] * sine);
  Result.M[Y].V[Y] := (one_minus_cosine * axis.V[1] * axis.V[1]) + cosine;
  Result.M[Y].V[Z] := (one_minus_cosine * axis.V[1] * axis.V[2]) - (axis.V[0] * sine);
  Result.M[Y].V[W] := 0;

  Result.M[Z].V[X] := (one_minus_cosine * axis.V[2] * axis.V[0]) - (axis.V[1] * sine);
  Result.M[Z].V[Y] := (one_minus_cosine * axis.V[1] * axis.V[2]) + (axis.V[0] * sine);
  Result.M[Z].V[Z] := (one_minus_cosine * axis.V[2] * axis.V[2]) + cosine;
  Result.M[Z].V[W] := 0;

  Result.M[W].V[X] := 0;
  Result.M[W].V[Y] := 0;
  Result.M[W].V[Z] := 0;
  Result.M[W].V[W] := 1;
end;

function MatrixOrthoLH(w, h, zn, zf: Single): TdxMatrix;
begin
  Result := IdentityMatrix;
  Result.m11 := 2 / w;
  Result.m22 := 2 / h;
  Result.m33 := 1 / (zf - zn);
  Result.m42 := zn / (zn - zf);
end;

function MatrixOrthoOffCenterLH(l, r, b, t, zn, zf: Single): TdxMatrix;
begin
  Result := IdentityMatrix;
  Result.m11 := 2 / (r - l);
  Result.m22 := 2 / (t - b);
  Result.m33 := 1 / (zf - zn);
  Result.m41 := (l + r) / (l - r);
  Result.m42 := (t + b) / (b - t);
  Result.m43 := zn / (zn - zf);
end;

function MatrixOrthoOffCenterRH(l, r, b, t, zn, zf: Single): TdxMatrix;
begin
  Result := IdentityMatrix;
  Result.m11 := 2 / (r - l);
  Result.m22 := 2 / (t - b);
  Result.m33 := 1 / (zn - zf);
  Result.m41 := (l + r) / (l - r);
  Result.m42 := (t + b) / (b - t);
  Result.m43 := zn / (zn - zf);
end;

function MatrixPerspectiveOffCenterLH(l, r, b, t, zn, zf: Single): TdxMatrix;
begin
  Result := IdentityMatrix;
  Result.m11 := (2 * zn) / (r - l);
  Result.m22 := (2 * zn) / (t - b);
  {  Result.m31 := (l + r) / (r - l);
    Result.m32 := (t + b) / (t - b);}
  Result.m34 := -1;
  Result.m33 := 1;
  Result.m43 := 0; //(zn * zf) / (zn - zf);
end;

function MatrixPerspectiveFovRH(flovy, aspect, zn, zf: Single): TdxMatrix;
var
  yScale, xScale, h, w: single;
begin
  {$IFDEF KS_COMPILER6_UP}
  yScale := cot(flovy / 2);
  {$ELSE}
  yScale := cotan(flovy / 2);
  {$ENDIF}
  xScale := yScale / aspect;
  h := cos(flovy / 2) / sin(flovy / 2);
  w := h / aspect;
  Result := IdentityMatrix;
  Result.m11 := xScale;
  Result.m22 := yScale;
  Result.m33 := (zf / (zn - zf));
  Result.m34 := -1;
  Result.m43 := zn * zf / (zn - zf);
  Result.m44 := 0;
end;

function MatrixPerspectiveFovLH(flovy, aspect, zn, zf: Single): TdxMatrix;
var
  yScale, xScale, h, w: single;
begin
  {$IFDEF KS_COMPILER6_UP}
  yScale := cot(flovy / 2);
  {$ELSE}
  yScale := cotan(flovy / 2);
  {$ENDIF}
  xScale := yScale / aspect;
  h := cos(flovy / 2) / sin(flovy / 2);
  w := h / aspect;
  Result := IdentityMatrix;
  Result.m11 := xScale;
  Result.m22 := yScale;
  Result.m33 := (zf / (zf - zn));
  Result.m34 := 1;
  Result.m43 := -zn * zf / (zf - zn);
  Result.m44 := 0;
end;

function MatrixLookAtRH(const Eye, At, Up: TdxVector): TdxMatrix;
var
  zaxis, xaxis, yaxis: TdxVector;
begin
  zaxis := dxVectorNormalize(dxVectorSubtract(Eye, At));
  zaxis.V[3] := 0;
  xaxis := dxVectorNormalize(dxVectorCrossProduct(Up, zaxis));
  xaxis.V[3] := 0;
  yaxis := dxVectorCrossProduct(zaxis, xaxis);
  yaxis.V[3] := 0;

  Result := IdentityMatrix;
  Result.m11 := xaxis.x;
  Result.m12 := yaxis.x;
  Result.m13 := zaxis.x;
  Result.m21 := xaxis.y;
  Result.m22 := yaxis.y;
  Result.m23 := zaxis.y;
  Result.m31 := xaxis.z;
  Result.m32 := yaxis.z;
  Result.m33 := zaxis.z;
  Result.m41 := -dxVectorDotProduct(xaxis, eye);
  Result.m42 := -dxVectorDotProduct(yaxis, eye);
  Result.m43 := -dxVectorDotProduct(zaxis, eye);
end;

function MatrixLookAtDirRH(const Pos, Dir, Up: TdxVector): TdxMatrix;
var
  zaxis, xaxis, yaxis: TdxVector;
begin
  zaxis := dxVectorNormalize(dxVectorScale(Dir, -1));
  zaxis.V[3] := 0;
  xaxis := dxVectorNormalize(dxVectorCrossProduct(Up, zaxis));
  xaxis.V[3] := 0;
  yaxis := dxVectorCrossProduct(zaxis, xaxis);
  yaxis.V[3] := 0;

  Result := IdentityMatrix;
  Result.m11 := xaxis.x;
  Result.m12 := yaxis.x;
  Result.m13 := zaxis.x;
  Result.m21 := xaxis.y;
  Result.m22 := yaxis.y;
  Result.m23 := zaxis.y;
  Result.m31 := xaxis.z;
  Result.m32 := yaxis.z;
  Result.m33 := zaxis.z;
  Result.m41 := -dxVectorDotProduct(xaxis, Pos);
  Result.m42 := -dxVectorDotProduct(yaxis, Pos);
  Result.m43 := -dxVectorDotProduct(zaxis, Pos);
end;

function MakeShadowMatrix(const planePoint, planeNormal, lightPos: TdxVector): TdxMatrix;
var
  planeNormal3, dot: Single;
begin
  planeNormal3 := -(planeNormal.V[0] * planePoint.V[0]
    + planeNormal.V[1] * planePoint.V[1]
    + planeNormal.V[2] * planePoint.V[2]);
  dot := planeNormal.V[0] * lightPos.V[0]
    + planeNormal.V[1] * lightPos.V[1]
    + planeNormal.V[2] * lightPos.V[2]
    + planeNormal3 * lightPos.V[3];
  Result.M[0].V[0] := dot - lightPos.V[0] * planeNormal.V[0];
  Result.M[1].V[0] := -lightPos.V[0] * planeNormal.V[1];
  Result.M[2].V[0] := -lightPos.V[0] * planeNormal.V[2];
  Result.M[3].V[0] := -lightPos.V[0] * planeNormal3;

  Result.M[0].V[1] := -lightPos.V[1] * planeNormal.V[0];
  Result.M[1].V[1] := dot - lightPos.V[1] * planeNormal.V[1];
  Result.M[2].V[1] := -lightPos.V[1] * planeNormal.V[2];
  Result.M[3].V[1] := -lightPos.V[1] * planeNormal3;

  Result.M[0].V[2] := -lightPos.V[2] * planeNormal.V[0];
  Result.M[1].V[2] := -lightPos.V[2] * planeNormal.V[1];
  Result.M[2].V[2] := dot - lightPos.V[2] * planeNormal.V[2];
  Result.M[3].V[2] := -lightPos.V[2] * planeNormal3;

  Result.M[0].V[3] := -lightPos.V[3] * planeNormal.V[0];
  Result.M[1].V[3] := -lightPos.V[3] * planeNormal.V[1];
  Result.M[2].V[3] := -lightPos.V[3] * planeNormal.V[2];
  Result.M[3].V[3] := dot - lightPos.V[3] * planeNormal3;
end;

function MakeReflectionMatrix(const planePoint, planeNormal: TdxVector): TdxMatrix;
var
  pv2: Single;
begin
  pv2 := 2 * dxVectorDotProduct(planePoint, planeNormal);
  Result.M[0].V[0] := 1 - 2 * Sqr(planeNormal.V[0]);
  Result.M[0].V[1] := -2 * planeNormal.V[0] * planeNormal.V[1];
  Result.M[0].V[2] := -2 * planeNormal.V[0] * planeNormal.V[2];
  Result.M[0].V[3] := 0;
  Result.M[1].V[0] := -2 * planeNormal.V[1] * planeNormal.V[0];
  Result.M[1].V[1] := 1 - 2 * Sqr(planeNormal.V[1]);
  Result.M[1].V[2] := -2 * planeNormal.V[1] * planeNormal.V[2];
  Result.M[1].V[3] := 0;
  Result.M[2].V[0] := -2 * planeNormal.V[2] * planeNormal.V[0];
  Result.M[2].V[1] := -2 * planeNormal.V[2] * planeNormal.V[1];
  Result.M[2].V[2] := 1 - 2 * Sqr(planeNormal.V[2]);
  Result.M[2].V[3] := 0;
  Result.M[3].V[0] := pv2 * planeNormal.V[0];
  Result.M[3].V[1] := pv2 * planeNormal.V[1];
  Result.M[3].V[2] := pv2 * planeNormal.V[2];
  Result.M[3].V[3] := 1;
end;

function RSqrt(v: Single): Single;
var
  R: double;
begin
  R := Abs(V);
  if (R > 0) then
    Result := 1 / Sqrt(R)
  else
    Result := 1;
end;

function ISqrt(i: Integer): Integer;
begin
  {$HINTS OFF}
  i := Abs(i);
  if i > 0 then
    Result := Round(Sqrt(i))
  else
    Result := 1;
  {$HINTS ON}
end;

function DegToRad(const Degrees: single): single;
begin
  Result := Degrees * cPIdiv180;
end;

function RadToDeg(const Degrees: single): single;
begin
  Result := Degrees * c180divPI;
end;

procedure SinCos(const Theta: single; var Sin, Cos: single);
var
  s, c: extended;
begin
  Math.SinCos(NormalizeDegAngle(Theta), s, c);
  {$HINTS OFF}
  Sin := s;
  Cos := c;
  {$HINTS ON}
end;

function ArcCos(const x: Single): Single;
begin
  {$HINTS OFF}
  if (x > 1) then
    Result := Math.arccos(1)
  else
    if (x < -1) then
    Result := Math.arccos(-1)
  else
    Result := Math.ArcCos(x);
  {$HINTS ON}
end;

function ArcSin(const x: Single): Single;
begin
  {$HINTS OFF}
  if (x > 1) then
    Result := Math.ArcSin(1)
  else
    if (x < -1) then
    Result := Math.ArcSin(-1)
  else
    Result := Math.ArcSin(x);
  {$HINTS ON}
end;

function ArcTan2(const a, b: Single): Single;
begin
  Result := Math.ArcTan2(a, b);
end;

function NormalizeDegAngle(angle: Single): Single;
begin
  Result := angle - Int(angle * cInv360) * c360;
  if Result < -c180 then
    Result := Result + c360;
end;

function RoundUpToPowerOf2(value: Integer): Integer;
begin
  Result := 1;
  while (Result < value) do
    Result := Result shl 1;
end;

function RoundDownToPowerOf2(value: Integer): Integer;
begin
  if value > 0 then
  begin
    Result := 1 shl 30;
    while Result > value do
      Result := Result shr 1;
  end
  else
    Result := 1;
end;

function IsPowerOf2(value: Integer): Boolean;
begin
  Result := (RoundUpToPowerOf2(value) = value);
end;

function RoundInt(v: Single): Single;
begin
  Result := Int(v + cOneDotFive);
end;

function Power(const base, exponent: Single): Single;
begin
  {$HINTS OFF}
  if exponent = cZero then
    Result := cOne
  else
    if (base = cZero) and (exponent > cZero) then
    Result := cZero
  else
    if RoundInt(exponent) = exponent then
    Result := Power(base, Integer(Round(exponent)))
  else
    Result := Exp(exponent * Ln(base));
  {$HINTS ON}
end;

//

function Power(Base: Single; Exponent: Integer): Single;
begin
  {$HINTS OFF}
  Result := Math.Power(Base, Exponent);
  {$HINTS ON}
end;

function VectorCombine(const V1, V2: TdxVector; const F1, F2: Single): TdxVector;
begin
  Result.V[X] := (F1 * V1.V[X]) + (F2 * V2.V[X]);
  Result.V[Y] := (F1 * V1.V[Y]) + (F2 * V2.V[Y]);
  Result.V[Z] := (F1 * V1.V[Z]) + (F2 * V2.V[Z]);
  Result.V[W] := (F1 * V1.V[W]) + (F2 * V2.V[W]);
end;

function RayCastIntersectsSphere(const rayStart, rayVector: TdxVector;
  const sphereCenter: TdxVector;
  const sphereRadius: Single): Boolean;
var
  proj: Single;
begin
  proj := PointProject(sphereCenter, rayStart, rayVector);
  if proj <= 0 then
    proj := 0;
  Result := (VectorDistance2(sphereCenter, VectorCombine(rayStart, rayVector, 1, proj)) <= Sqr(sphereRadius));
end;

function RayCastSphereIntersect(const rayStart, rayVector: TdxVector;
  const sphereCenter: TdxVector;
  const sphereRadius: Single;
  var i1, i2: TdxVector): Integer;
var
  proj, d2: Single;
  dd2: double;
  id2: Integer;
  projPoint: TdxVector;
begin
  proj := PointProject(sphereCenter, rayStart, rayVector);
  projPoint := VectorCombine(rayStart, rayVector, 1, proj);
  d2 := sphereRadius * sphereRadius - VectorDistance2(sphereCenter, projPoint);
  id2 := PInteger(@d2)^;
  if id2 >= 0 then
  begin
    if id2 = 0 then
    begin
      if PInteger(@proj)^ > 0 then
      begin
        i1 := VectorCombine(rayStart, rayVector, 1, proj);
        Result := 1;
        Exit;
      end;
    end
    else
      if id2 > 0 then
    begin
      dd2 := Abs(d2);
      d2 := Sqrt(dd2);
      if proj >= d2 then
      begin
        i1 := VectorCombine(rayStart, rayVector, 1, proj - d2);
        i2 := VectorCombine(rayStart, rayVector, 1, proj + d2);
        Result := 2;
        Exit;
      end
      else
        if proj + d2 >= 0 then
      begin
        i1 := VectorCombine(rayStart, rayVector, 1, proj + d2);
        Result := 1;
        Exit;
      end;
    end;
  end;
  Result := 0;
end;

function RayCastPlaneIntersect(const rayStart, rayVector: TdxVector;
  const planePoint, planeNormal: TdxVector;
  var intersectPoint: TdxVector): Boolean;
var
  sp: TdxVector;
  t, d: Single;
begin
  d := dxVectorDotProduct(rayVector, planeNormal);
  Result := ((d > EPSILON2) or (d < -EPSILON2));
  if Result then
  begin
    sp := dxVectorSubtract(planePoint, rayStart);
    d := 1 / d; // will keep one FPU unit busy during dot product calculation
    t := dxVectorDotProduct(sp, planeNormal) * d;
    if t > 0 then
      intersectPoint := VectorCombine(rayStart, rayVector, 1, t)
    else
      Result := False;
  end;
end;

function RayCastTriangleIntersect(const rayStart, rayVector: TdxVector;
  const p1, p2, p3: TdxVector;
  intersectPoint: PdxVector = nil;
  intersectNormal: PdxVector = nil): Boolean;
var
  pvec: TdxVector;
  v1, v2, qvec, tvec: TdxVector;
  t, u, v, det, invDet: Single;
begin
  v1 := dxVectorSubtract(p2, p1);
  v2 := dxVectorSubtract(p3, p1);
  pvec := dxVectorCrossProduct(rayVector, v2);
  det := dxVectorDotProduct(v1, pvec);
  if ((det < EPSILON2) and (det > -EPSILON2)) then
  begin
    Result := False;
    Exit;
  end;
  invDet := cOne / det;
  tvec := dxVectorSubtract(rayStart, p1);
  u := dxVectorDotProduct(tvec, pvec) * invDet;
  if (u < 0) or (u > 1) then
    Result := False
  else
  begin
    qvec := dxVectorCrossProduct(tvec, v1);
    v := dxVectorDotProduct(rayVector, qvec) * invDet;
    Result := (v >= 0) and (u + v <= 1);
    if Result then
    begin
      t := dxVectorDotProduct(v2, qvec) * invDet;
      if t > 0 then
      begin
        if intersectPoint <> nil then
          dxVectorCombine(rayStart, rayVector, t, intersectPoint^);
        if intersectNormal <> nil then
          intersectNormal^ := dxVectorCrossProduct(v1, v2);
      end
      else
        Result := False;
    end;
  end;
end;

procedure NegateVector(var v: TdxVector);
begin
  v.V[0] := -v.V[0];
  v.V[1] := -v.V[1];
  v.V[2] := -v.V[2];
end;

function QuaternionFromAngleAxis(const angle: Single; const axis: TdxVector): TdxQuaternion;
var
  f, s, c: Single;
begin
  SinCos(DegToRad(angle * cOneDotFive), s, c);
  Result.RealPart := c;
  f := s / dxVectorLength(axis);
  Result.ImagPart.V[0] := axis.V[0] * f;
  Result.ImagPart.V[1] := axis.V[1] * f;
  Result.ImagPart.V[2] := axis.V[2] * f;
end;

function QuaternionMultiply(const qL, qR: TdxQuaternion): TdxQuaternion;
var
  Temp: TdxQuaternion;
begin
  Temp.RealPart := qL.RealPart * qR.RealPart - qL.ImagPart.V[X] * qR.ImagPart.V[X]
    - qL.ImagPart.V[Y] * qR.ImagPart.V[Y] - qL.ImagPart.V[Z] * qR.ImagPart.V[Z];
  Temp.ImagPart.V[X] := qL.RealPart * qR.ImagPart.V[X] + qL.ImagPart.V[X] * qR.RealPart
    + qL.ImagPart.V[Y] * qR.ImagPart.V[Z] - qL.ImagPart.V[Z] * qR.ImagPart.V[Y];
  Temp.ImagPart.V[Y] := qL.RealPart * qR.ImagPart.V[Y] + qL.ImagPart.V[Y] * qR.RealPart
    + qL.ImagPart.V[Z] * qR.ImagPart.V[X] - qL.ImagPart.V[X] * qR.ImagPart.V[Z];
  Temp.ImagPart.V[Z] := qL.RealPart * qR.ImagPart.V[Z] + qL.ImagPart.V[Z] * qR.RealPart
    + qL.ImagPart.V[X] * qR.ImagPart.V[Y] - qL.ImagPart.V[Y] * qR.ImagPart.V[X];
  Result := Temp;
end;

function QuaternionFromRollPitchYaw(const r, p, y: Single): TdxQuaternion;
var
  qp, qy, qr: TdxQuaternion;
begin
  qr := QuaternionFromAngleAxis(r, dxVector(0, 0, 1));
  qp := QuaternionFromAngleAxis(p, dxVector(1, 0, 0));
  qy := QuaternionFromAngleAxis(y, dxVector(0, 1, 0));

  Result := qy;
  Result := QuaternionMultiply(qp, Result);
  Result := QuaternionMultiply(qr, Result);
end;

function QuaternionMagnitude(const q: TdxQuaternion): Single;
begin
  Result := Sqrt(dxVectorNorm(q.ImagPart) + Sqr(q.RealPart));
end;

procedure NormalizeQuaternion(var q: TdxQuaternion);
var
  m, f: single;
begin
  m := QuaternionMagnitude(q);
  if m > EPSILON2 then
  begin
    f := 1 / m;
    q.ImagPart := dxVectorScale(q.ImagPart, f);
    q.RealPart := q.RealPart * f;
  end
  else
    q := IdentityQuaternion;
end;

function QuaternionToMatrix(quat: TdxQuaternion): TdxMatrix;
var
  w, x, y, z, xx, xy, xz, xw, yy, yz, yw, zz, zw: Single;
begin
  NormalizeQuaternion(quat);
  w := quat.RealPart;
  x := quat.ImagPart.V[0];
  y := quat.ImagPart.V[1];
  z := quat.ImagPart.V[2];
  xx := x * x;
  xy := x * y;
  xz := x * z;
  xw := x * w;
  yy := y * y;
  yz := y * z;
  yw := y * w;
  zz := z * z;
  zw := z * w;
  Result.M[0].V[0] := 1 - 2 * (yy + zz);
  Result.M[1].V[0] := 2 * (xy - zw);
  Result.M[2].V[0] := 2 * (xz + yw);
  Result.M[3].V[0] := 0;
  Result.M[0].V[1] := 2 * (xy + zw);
  Result.M[1].V[1] := 1 - 2 * (xx + zz);
  Result.M[2].V[1] := 2 * (yz - xw);
  Result.M[3].V[1] := 0;
  Result.M[0].V[2] := 2 * (xz - yw);
  Result.M[1].V[2] := 2 * (yz + xw);
  Result.M[2].V[2] := 1 - 2 * (xx + yy);
  Result.M[3].V[2] := 0;
  Result.M[0].V[3] := 0;
  Result.M[1].V[3] := 0;
  Result.M[2].V[3] := 0;
  Result.M[3].V[3] := 1;
end;

function dxQuaternionFromMatrix(const mat: TdxMatrix): TdxQuaternion;
var
  traceMat, s, invS: Double;
begin
  tracemat := 1 + mat.M[0].V[0] + mat.M[1].V[1] + mat.M[2].V[2];
  if tracemat > EPSILON2 then
  begin
    s := Sqrt(tracemat) * 2;
    invS := 1 / s;
    Result.ImagPart.V[0] := (mat.M[1].V[2] - mat.M[2].V[1]) * invS;
    Result.ImagPart.V[1] := (mat.M[2].V[0] - mat.M[0].V[2]) * invS;
    Result.ImagPart.V[2] := (mat.M[0].V[1] - mat.M[1].V[0]) * invS;
    Result.RealPart := 0.25 * s;
  end
  else
    if (mat.M[0].V[0] > mat.M[1].V[1]) and (mat.M[0].V[0] > mat.M[2].V[2]) then
  begin // Row 0:
    s := Sqrt(MaxFloat(EPSILON2, cOne + mat.M[0].V[0] - mat.M[1].V[1] - mat.M[2].V[2])) * 2;
    invS := 1 / s;
    Result.ImagPart.V[0] := 0.25 * s;
    Result.ImagPart.V[1] := (mat.M[0].V[1] + mat.M[1].V[0]) * invS;
    Result.ImagPart.V[2] := (mat.M[2].V[0] + mat.M[0].V[2]) * invS;
    Result.RealPart := (mat.M[1].V[2] - mat.M[2].V[1]) * invS;
  end
  else
    if (mat.M[1].V[1] > mat.M[2].V[2]) then
  begin
    s := Sqrt(MaxFloat(EPSILON2, cOne + mat.M[1].V[1] - mat.M[0].V[0] - mat.M[2].V[2])) * 2;
    invS := 1 / s;
    Result.ImagPart.V[0] := (mat.M[0].V[1] + mat.M[1].V[0]) * invS;
    Result.ImagPart.V[1] := 0.25 * s;
    Result.ImagPart.V[2] := (mat.M[1].V[2] + mat.M[2].V[1]) * invS;
    Result.RealPart := (mat.M[2].V[0] - mat.M[0].V[2]) * invS;
  end
  else
  begin
    s := Sqrt(MaxFloat(EPSILON2, cOne + mat.M[2].V[2] - mat.M[0].V[0] - mat.M[1].V[1])) * 2;
    invS := 1 / s;
    Result.ImagPart.V[0] := (mat.M[2].V[0] + mat.M[0].V[2]) * invS;
    Result.ImagPart.V[1] := (mat.M[1].V[2] + mat.M[2].V[1]) * invS;
    Result.ImagPart.V[2] := 0.25 * s;
    Result.RealPart := (mat.M[0].V[1] - mat.M[1].V[0]) * invS;
  end;
  NormalizeQuaternion(Result);
end;

function dxCreateYawPitchRollMatrix(const y, p, r: single): TdxMatrix;
var
  Q: TdxQuaternion;
begin
  Q := QuaternionFromRollPitchYaw(r, p, y);
  Result := QuaternionToMatrix(Q);
end;

end.

