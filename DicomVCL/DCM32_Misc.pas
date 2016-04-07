{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM32_Misc;

interface

{$I DicomPack.inc}

{.$DEFINE Use_GR32_PolygonsEx}

uses
{$IFDEF CLX}
  Qt, Types,
  {$IFDEF LINUX}Libc, {$ENDIF}
  {$IFDEF MSWINDOWS}Windows, {$ENDIF}
{$ELSE}
  Windows,
{$ENDIF}
  Classes, SysUtils, Math, DCM32, DCM32_LowLevel, DCM32_Blend, DCM32_Transforms,
{$IFDEF Use_GR32_PolygonsEx}
  GR32_PolygonsEx, GR32_VPR,
{$ENDIF}
  DCM32_Polygons;

type
  TBalloonPos = (bpNone, bpTopLeft, bpTopRight, bpBottomLeft, bpBottomRight);

procedure OffsetPoint(var pt: TFloatPoint; dx, dy: single); overload;
procedure OffsetPoint(var pt: TFixedPoint; dx, dy: single); overload;
procedure OffsetPoints(var pts: TArrayOfFixedPoint; dx, dy: single);
procedure OffsetPolyPoints(var polyPts: TArrayOfArrayOfFixedPoint; dx, dy: single);

function CopyPolyPoints(const polyPts: TArrayOfArrayOfFixedPoint): TArrayOfArrayOfFixedPoint;
function ReversePoints(const pts: TArrayOfFixedPoint): TArrayOfFixedPoint;
procedure ConcatenatePolyPoints(var polyPts: TArrayOfArrayOfFixedPoint;
  extras: TArrayOfArrayOfFixedPoint);

function AFixedToAFloat(pts: TArrayOfFixedPoint): TArrayOfFloatPoint;
function AAFixedToAAFloat(ppts: TArrayOfArrayOfFixedPoint): TArrayOfArrayOfFloatPoint;
function AFloatToAFixed(pts: TArrayOfFloatPoint): TArrayOfFixedPoint;
function AAFloatToAAFixed(ppts: TArrayOfArrayOfFloatPoint):
  TArrayOfArrayOfFixedPoint;

function MakeArrayOfFixedPoints(const a: array of single): TArrayOfFixedPoint;
function MakeArrayOfFloatPoints(const a: array of single): TArrayOfFloatPoint;

function DuplicatePoint(const p1,p2: TFixedPoint): boolean;

function GetPointAtAngleFromPoint(const pt: TFixedPoint;
  const dist, radians: single): TFixedPoint;

function SquaredDistBetweenPoints(const pt1, pt2: TFixedPoint): single;
function DistBetweenPoints(const pt1, pt2: TFixedPoint): single; overload;
function DistBetweenPoints(const pt1, pt2: TFloatPoint): single; overload;

function ClosestPointOnLine(const pt, lnA, lnB: TFloatPoint;
  ForceResultBetweenLinePts: boolean): TFloatPoint;
function DistOfPointFromLine(const pt, lnA, lnB: TFloatPoint;
  ForceResultBetweenLinePts: boolean): TFloat; overload;
function DistOfPointFromLine(const pt, lnA, lnB: TFixedPoint;
  ForceResultBetweenLinePts: boolean): TFloat; overload;
function IntersectionPoint(const ln1A, ln1B, ln2A, ln2B: TFixedPoint;
  out IntersectPoint: TFixedPoint): boolean;

function RotatePoint(pt, origin: TFixedPoint; const radians: single): TFixedPoint;
function RotatePoints(const pts: array of TFixedPoint;
  origin: TFixedPoint; radians: single): TArrayOfFixedPoint; overload;
function RotatePoints(const pts: array of TFixedPoint;
  radians: single): TArrayOfFixedPoint; overload;
procedure RotatePolyPoints(var pts: TArrayOfArrayOfFixedPoint;
  origin: TFixedPoint; radians: single);

function MidPoint(pt1, pt2: TFixedPoint): TFixedPoint;

function GetAnglePt2FromPt1(pt1, pt2: TFixedPoint): single; overload;
function GetAnglePt2FromPt1(pt1, pt2: TFloatPoint): single; overload;

function PtInPolygon(const Pt: TFixedPoint; const Pts: array of TFixedPoint): Boolean;

function FixedRectToRect(rec: TFixedRect): TRect;
function GetBoundsRect(pts: array of TFixedPoint): TRect;
function GetBoundsFixedRect(pts: array of TFixedPoint): TFixedRect; overload;
function GetBoundsFixedRect(polyPts: TArrayOfArrayOfFixedPoint): TFixedRect; overload;

function GetRectUnion(const rec1, rec2: TFixedRect): TFixedRect;

//Cubic Beziers (CBezier, CSpline):
//GetCBezierPoints: the last (D) control_point of a precenting segment
//becomes the first (A) control_point of a following segment.
function GetCBezierPoints(control_points: array of TFixedPoint): TArrayOfFixedPoint;
//GetCSplinePoints: 'Smooth' CBeziers where the first and last control_points
//(A & D) are derived from the midpoints of adjacent 'B' & 'C' control_points.
function GetCSplinePoints(control_points: array of TFixedPoint): TArrayOfFixedPoint;

//Quadratic Beziers (QBezier, QSpline):
//GetQBezierPoints: the last (C) control_point of a precenting segment
//becomes the first (A) control_point of a following segment.
function GetQBezierPoints(control_points: array of TFixedPoint): TArrayOfFixedPoint;
//GetQSplinePoints: 'Smooth' QBeziers where the first and last control_points
//(A & C) are derived from the midpoints of adjacent 'B' control_points.
function GetQSplinePoints(control_points: array of TFixedPoint): TArrayOfFixedPoint;

function GetEllipsePoints(const ellipseRect: TFloatRect): TArrayOfFixedPoint;

function GetArcPoints(const ellipseRect: TFloatRect;
  startPt, endPt: TFloatPoint): TArrayOfFixedPoint; overload;

function GetArcPoints(const ellipseRect: TFloatRect;
  start_degrees, end_degrees: single): TArrayOfFixedPoint; overload;

function GetArcPointsEccentric(const ellipseRect: TFloatRect;
  start_eccentric, end_eccentric: single): TArrayOfFixedPoint;

function GetPiePoints(const ellipseRect: TFloatRect;
  startPt, endPt: TFloatPoint): TArrayOfFixedPoint; overload;

function GetPiePoints(const ellipseRect: TFloatRect;
  start_degrees, end_degrees: single): TArrayOfFixedPoint; overload;

function GetPiePointsEccentric(const ellipseRect: TFloatRect;
  start_eccentric, end_eccentric: single): TArrayOfFixedPoint;

function GetRoundedRectanglePoints(const rect: TFloatRect;
  roundingPercent: cardinal): TArrayOfFixedPoint;

function GetBalloonedEllipsePoints(const ellipseRect: TFloatRect;
  balloonPos: TBalloonPos): TArrayOfFixedPoint;

function GradientColor(color1, color2: TColor32; frac: single): TColor32;
function GetColor(const colors: array of TColor32; fraction: single): TColor32;

function IsClockwiseDirection(const pts: array of TFixedPoint): boolean;

function BuildDashedLine(const Points: TArrayOfFixedPoint;
  const DashArray: array of TFloat; DashOffset: TFloat = 0): TArrayOfArrayOfFixedPoint;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

const
  Thirty = pi / 6;
  FortyFive = pi / 4;
  Sixty = pi / 3;
  Ninety = pi / 2;
  OneEighty = pi;
  TwoSeventy = Ninety * 3;
  ThreeSixty = OneEighty * 2;
  OneDegree = pi/180;
  DegToRad = OneDegree;
  RadToDeg = 180/pi;
  SingleLineLimit = 1.5;
  SqrtTwo = 1.41421356;
  half = 0.5;
  cbezier_tolerance = 1;
  qbezier_tolerance = 1;

implementation

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

procedure OffsetPoint(var pt: TFloatPoint; dx, dy: single);
begin
  pt.X := pt.X + dx;
  pt.Y := pt.Y + dy;
end;
//------------------------------------------------------------------------------


procedure OffsetPoint(var pt: TFixedPoint; dx, dy: single);
begin
  with pt do
  begin
    X := X + Fixed(dx);
    Y := Y + Fixed(dy);
  end;
end;
//------------------------------------------------------------------------------

procedure OffsetPoints(var pts: TArrayOfFixedPoint; dx, dy: single);
var
  i: integer;
  dxFixed, dyFixed: TFixed;
begin
  dxFixed := Fixed(dx);
  dyFixed := Fixed(dy);
  for i := 0 to high(pts) do
    with pts[i] do
    begin
      X := X + dxFixed;
      Y := Y + dyFixed;
    end;
end;
//------------------------------------------------------------------------------

procedure OffsetPolyPoints(var polyPts: TArrayOfArrayOfFixedPoint; dx, dy: single);
var
  i,j: integer;
  dxFixed, dyFixed: TFixed;
begin
  dxFixed := Fixed(dx);
  dyFixed := Fixed(dy);
  for i := 0 to high(polyPts) do
    for j := 0 to high(polyPts[i]) do
      with polyPts[i][j] do
      begin
        X := X + dxFixed;
        Y := Y + dyFixed;
      end;
end;
//------------------------------------------------------------------------------

function CopyPolyPoints(const polyPts: TArrayOfArrayOfFixedPoint): TArrayOfArrayOfFixedPoint;
var
  i: integer;
begin
  setlength(Result, length(polyPts));
  for i := 0 to length(polyPts) -1 do
    result[i] := Copy(polyPts[i], 0, length(polyPts[i]));
end;
//------------------------------------------------------------------------------

function ReversePoints(const pts: TArrayOfFixedPoint): TArrayOfFixedPoint;
var
  i, highPts: integer;
begin
  highPts := high(pts);
  SetLength(result, highPts +1);
  for i := 0 to highPts do result[i] := pts[highPts - i];
end;
//------------------------------------------------------------------------------

procedure ConcatenatePolyPoints(var polyPts: TArrayOfArrayOfFixedPoint;
  extras: TArrayOfArrayOfFixedPoint);
var
  i, polyPtsCnt, ExtrasCnt: integer;
begin
  polyPtsCnt := length(polyPts);
  ExtrasCnt := length(extras);
  if ExtrasCnt = 0 then exit;
  SetLength(polyPts, polyPtsCnt + ExtrasCnt);
  for i := 0 to ExtrasCnt -1 do
    polyPts[polyPtsCnt + i] := copy(extras[i], 0, length(extras[i]));
end;
//------------------------------------------------------------------------------

function AFixedToAFloat(pts: TArrayOfFixedPoint): TArrayOfFloatPoint;
var
  i, len: integer;
begin
  len := length(pts);
  setlength(Result, len);
  for i := 0 to len -1 do result[i] := FloatPoint(pts[i]);
end;
//------------------------------------------------------------------------------

function AAFixedToAAFloat(ppts: TArrayOfArrayOfFixedPoint):
  TArrayOfArrayOfFloatPoint;
var
  i,j, len, len2: integer;
begin
  len := length(ppts);
  setlength(Result, len);
  for i := 0 to len -1 do
  begin
    len2 := length(ppts[i]);
    setlength(result[i], len2);
    for j := 0 to len2 -1 do
      result[i][j] := FloatPoint(ppts[i][j]);
  end;
end;
//------------------------------------------------------------------------------

function AFloatToAFixed(pts: TArrayOfFloatPoint): TArrayOfFixedPoint;
var
  i, len: integer;
begin
  len := length(pts);
  setlength(Result, len);
  for i := 0 to len -1 do result[i] := FixedPoint(pts[i]);
end;
//------------------------------------------------------------------------------

function AAFloatToAAFixed(ppts: TArrayOfArrayOfFloatPoint):
  TArrayOfArrayOfFixedPoint;
var
  i,j, len, len2: integer;
begin
  len := length(ppts);
  setlength(Result, len);
  for i := 0 to len -1 do
  begin
    len2 := length(ppts[i]);
    setlength(result[i], len2);
    for j := 0 to len2 -1 do
      result[i][j] := FixedPoint(ppts[i][j]);
  end;
end;
//------------------------------------------------------------------------------

function MakeArrayOfFixedPoints(const a: array of single): TArrayOfFixedPoint;
var
  i, len: integer;
begin
  len := length(a) div 2;
  setlength(result, len);
  if len = 0 then exit;
  for i := 0 to len -1 do
  begin
    result[i].X := round(a[i*2] * FixedOne);
    result[i].Y := round(a[i*2 +1] * FixedOne);
  end;
end;
//------------------------------------------------------------------------------

function MakeArrayOfFloatPoints(const a: array of single): TArrayOfFloatPoint;
var
  i, len: integer;
begin
  len := length(a) div 2;
  setlength(result, len);
  if len = 0 then exit;
  for i := 0 to len -1 do
  begin
    result[i].X := a[i*2];
    result[i].Y := a[i*2 +1];
  end;
end;
//------------------------------------------------------------------------------

function DuplicatePoint(const p1,p2: TFixedPoint): boolean;
begin
  result := (p1.X = p2.X) and (p1.Y = p2.Y);
end;
//------------------------------------------------------------------------------

function GetPointAtAngleFromPoint(const pt: TFixedPoint;
  const dist, radians: single): TFixedPoint;
var
  sinAng, cosAng: single;
begin
  DCM32.SinCos(radians, sinAng, cosAng);
  result.X := round(dist * cosAng*FixedOne) + pt.X;
  result.Y := -round(dist * sinAng *FixedOne) + pt.Y; //nb: Y axis is +ve down
end;
//------------------------------------------------------------------------------

function SquaredDistBetweenPoints(const pt1, pt2: TFixedPoint): single;
var
  X, Y: single;
begin
  X := (pt2.X-pt1.X)*FixedToFloat;
  Y := (pt2.Y-pt1.Y)*FixedToFloat;
  result := X*X + Y*Y;
end;
//------------------------------------------------------------------------------

function DistBetweenPoints(const pt1, pt2: TFixedPoint): single;
begin
  Result := hypot((pt2.X - pt1.X)*FixedToFloat,(pt2.Y - pt1.Y)*FixedToFloat);
end;
//------------------------------------------------------------------------------

function DistBetweenPoints(const pt1, pt2: TFloatPoint): single;
begin
  Result := hypot((pt2.X - pt1.X),(pt2.Y - pt1.Y));
end;
//------------------------------------------------------------------------------

function ClosestPointOnLine(const pt, lnA, lnB: TFloatPoint;
  ForceResultBetweenLinePts: boolean): TFloatPoint;
var
  q: single;
begin
  if (lnA.X = lnB.X) and (lnA.Y = lnB.Y) then
    Result := lnA
  else
  begin
    q := ((pt.X-lnA.X)*(lnB.X-lnA.X) + (pt.Y-lnA.Y)*(lnB.Y-lnA.Y)) /
      (sqr(lnB.X-lnA.X) + sqr(lnB.Y-lnA.Y));
    if ForceResultBetweenLinePts then constrain(q,0,1);
    Result.X := (1-q)*lnA.X + q*lnB.X;
    Result.Y := (1-q)*lnA.Y + q*lnB.Y;
  end;
end;
//------------------------------------------------------------------------------

function DistOfPointFromLine(const pt, lnA, lnB: TFloatPoint;
  ForceResultBetweenLinePts: boolean): TFloat;
var
  cpol: TFloatPoint;
begin
  cpol := ClosestPointOnLine(pt, lnA, lnB, ForceResultBetweenLinePts);
  result := hypot(pt.X - cpol.X, pt.Y- cpol.Y);
end;
//------------------------------------------------------------------------------

function DistOfPointFromLine(const pt, lnA, lnB: TFixedPoint;
  ForceResultBetweenLinePts: boolean): TFloat;
begin
  result := DistOfPointFromLine(FloatPoint(pt),
    FloatPoint(lnA), FloatPoint(lnB), ForceResultBetweenLinePts);
end;
//------------------------------------------------------------------------------

//IntersectionPoint: returns false whenever the lines are parallel
function IntersectionPoint(const ln1A, ln1B, ln2A, ln2B: TFixedPoint;
  out IntersectPoint: TFixedPoint): boolean;
var
  m1,b1,m2,b2: single;
begin
  result := false;
  if (ln1B.X = ln1A.X) then
  begin
    if (ln2B.X = ln2A.X) then exit; //parallel lines
    m2 := (ln2B.Y - ln2A.Y)/(ln2B.X - ln2A.X);
    b2 := ln2A.Y - m2 * ln2A.X;
    IntersectPoint.X := ln1A.X;
    IntersectPoint.Y := round(m2*ln1A.X + b2);
  end
  else if (ln2B.X = ln2A.X) then
  begin
    m1 := (ln1B.Y - ln1A.Y)/(ln1B.X - ln1A.X);
    b1 := ln1A.Y - m1 * ln1A.X;
    IntersectPoint.X := ln2A.X;
    IntersectPoint.Y := round(m1*ln2A.X + b1);
  end else
  begin
    m1 := (ln1B.Y - ln1A.Y)/(ln1B.X - ln1A.X);
    b1 := ln1A.Y - m1 * ln1A.X;
    m2 := (ln2B.Y - ln2A.Y)/(ln2B.X - ln2A.X);
    b2 := ln2A.Y - m2 * ln2A.X;
    if m1 = m2 then exit; //parallel lines
    IntersectPoint.X := round((b2 - b1)/(m1 - m2));
    IntersectPoint.Y := round(m1 * IntersectPoint.X + b1);
  end;
  result := true;
end;
//------------------------------------------------------------------------------

function RotatePoint(pt, origin: TFixedPoint; const radians: single): TFixedPoint;
var
  cosAng, sinAng: single;
begin
  //rotates in an anticlockwise direction if radians > 0;
  DCM32.sincos(radians, sinAng, cosAng);
  pt.X := pt.X - origin.X;
  pt.Y := pt.Y - origin.Y;
  result.X := round((pt.X * cosAng) + (pt.Y * sinAng) + origin.X);
  result.Y := round((pt.Y * cosAng) - (pt.X * sinAng) + origin.Y);
end;
//------------------------------------------------------------------------------

function RotatePoints(const pts: array of TFixedPoint;
  origin: TFixedPoint; radians: single): TArrayOfFixedPoint;
var
  i: integer;
  tmp: TFixedPoint;
  cosAng, sinAng: single;
begin
  DCM32.sincos(radians, sinAng, cosAng);
  setlength(result,length(pts));
  for i := 0 to length(pts) -1 do
  begin
    tmp.X := pts[i].X - origin.X;
    tmp.Y := pts[i].Y - origin.Y;
    result[i].X := round((tmp.X * cosAng) + (tmp.Y * sinAng) + origin.X);
    result[i].Y := round((tmp.Y * cosAng) - (tmp.X * sinAng) + origin.Y);
  end;
end;
//------------------------------------------------------------------------------

function RotatePoints(const pts: array of TFixedPoint;
  radians: single): TArrayOfFixedPoint;
var
  i: integer;
  cosAng, sinAng: single;
begin
  DCM32.sincos(radians, sinAng, cosAng);
  setlength(result,length(pts));
  for i := 0 to length(pts) -1 do
  begin
    result[i].X := round((pts[i].X * cosAng) + (pts[i].Y * sinAng));
    result[i].Y := round((pts[i].Y * cosAng) - (pts[i].X * sinAng));
  end;
end;
//------------------------------------------------------------------------------

procedure RotatePolyPoints(var pts: TArrayOfArrayOfFixedPoint;
  origin: TFixedPoint; radians: single);
var
  i,j: integer;
  tmp: TFixedPoint;
  cosAng, sinAng: single;
begin
  DCM32.sincos(radians, sinAng, cosAng);
  for i := 0 to length(pts) -1 do
    for j := 0 to length(pts[i]) -1 do
      with pts[i][j] do
      begin
        tmp.X := X - origin.X;
        tmp.Y := Y - origin.Y;
        X := round((tmp.X * cosAng) + (tmp.Y * sinAng) + origin.X);
        Y := round((tmp.Y * cosAng) - (tmp.X * sinAng) + origin.Y);
      end;
end;
//------------------------------------------------------------------------------

function MidPoint(pt1, pt2: TFixedPoint): TFixedPoint;
begin
  result.X := (pt1.X + pt2.X) div 2;
  result.Y := (pt1.Y + pt2.Y) div 2;
end;
//------------------------------------------------------------------------------

function GetAnglePt2FromPt1(pt1, pt2: TFixedPoint): single;
begin
  with pt2 do
  begin
    X := X - pt1.X; Y := Y - pt1.Y;
    if X = 0 then
    begin
     if Y > 0 then result := TwoSeventy else result := Ninety;
    end else
    begin
      result := arctan2(-Y,X);
      if result < 0 then result := result + ThreeSixty;
    end;
  end;
end;
//------------------------------------------------------------------------------

function GetAnglePt2FromPt1(pt1, pt2: TFloatPoint): single;
begin
  with pt2 do
  begin
    X := X - pt1.X; Y := Y - pt1.Y;
    if X = 0 then
    begin
      if Y > 0 then result := TwoSeventy else result := Ninety;
    end else
    begin
      result := arctan2(-Y,X);
      if result < 0 then result := result + ThreeSixty;
    end;
  end;
end;
//------------------------------------------------------------------------------

function PtInPolygon(const Pt: TFixedPoint; const Pts: array of TFixedPoint): Boolean;
var
  I: Integer;
  iPt, jPt: PFixedPoint;
begin
  Result := False;
  iPt := @Pts[0];
  jPt := @Pts[High(Pts)];
  for I := 0 to High(Pts) do
  begin
    Result := Result xor (((Pt.Y >= iPt.Y) xor (Pt.Y >= jPt.Y)) and
      (Pt.X - iPt.X < MulDiv(jPt.X - iPt.X, Pt.Y - iPt.Y, jPt.Y - iPt.Y)));
    jPt := iPt;
    Inc(iPt);
  end;
end;
//------------------------------------------------------------------------------

function FixedRectToRect(rec: TFixedRect): TRect;
begin
  result.Left := FixedFloor(rec.Left);
  result.Top := FixedFloor(rec.Top);
  result.Right := FixedCeil(rec.Right);
  result.Bottom := FixedCeil(rec.Bottom);
end;
//------------------------------------------------------------------------------

function GetBoundsRect(pts: array of TFixedPoint): TRect;
begin
  result := FixedRectToRect(GetBoundsFixedRect(pts));
end;
//------------------------------------------------------------------------------

function GetBoundsFixedRect(pts: array of TFixedPoint): TFixedRect;
var
  i: integer;
begin
  if length(pts) = 0 then
  begin
    result := FixedRect(0,0,0,0);
    exit;
  end;
  with pts[0], result do
  begin
    left := X ; top := Y; right := X; bottom := Y;
  end;
  for i := 1 to length(pts) -1 do
    with pts[i], result do
    begin
      if X < left then left := X else if X > right then right := X;
      if Y < top then top := Y else if Y > bottom then bottom := Y;
    end;
end;
//------------------------------------------------------------------------------

function GetBoundsFixedRect(polyPts: TArrayOfArrayOfFixedPoint): TFixedRect;
var
  i,j,len: integer;
  firstPointPending: boolean;
begin
  firstPointPending := true;
  for i := 0 to high(polyPts) do
  begin
    len := length(polyPts[i]);
    if len = 0 then continue;
    if firstPointPending then
      with polyPts[i][0], result do
      begin
        left := X ; top := Y; right := X; bottom := Y;
        firstPointPending := false;
      end;
    for j := 0 to len -1 do
      with polyPts[i][j], result do
      begin
        if X < left then left := X else if X > right then right := X;
        if Y < top then top := Y else if Y > bottom then bottom := Y;
      end;
  end;
  if firstPointPending then result := FixedRect(0,0,0,0);
end;
//------------------------------------------------------------------------------

function GetRectUnion(const rec1, rec2: TFixedRect): TFixedRect;
begin
  result := rec1;
  if rec2.Left < result.Left then result.Left := rec2.Left;
  if rec2.Right > result.Right then result.Right := rec2.Right;
  if rec2.Top < result.Top then result.Top := rec2.Top;
  if rec2.Bottom > result.Bottom then result.Bottom := rec2.Bottom;
end;
//------------------------------------------------------------------------------

function GetCBezierPoints(control_points: array of TFixedPoint): TArrayOfFixedPoint;
var
  i, j, arrayLen, resultCnt: integer;
  ctrlPts: array [ 0..3] of TFloatPoint;

  procedure RecursiveCBezier(const p1, p2, p3, p4: TFloatPoint);
  var
    p12, p23, p34, p123, p234, p1234: TFloatPoint;
  begin
    //assess flatness of curve ...
    //http://groups.google.com/group/comp.graphics.algorithms/tree/browse_frm/thread/d85ca902fdbd746e
    if abs(p1.x + p3.x - 2*p2.x) + abs(p2.x + p4.x - 2*p3.x) +
      abs(p1.y + p3.y - 2*p2.y) + abs(p2.y + p4.y - 2*p3.y) < cbezier_tolerance then
    begin
      if resultCnt = length(result) then
        setLength(result, length(result) +128);
      result[resultCnt] := FixedPoint(p4);
      inc(resultCnt);
    end else
    begin
      p12.X := (p1.X + p2.X) *half;
      p12.Y := (p1.Y + p2.Y) *half;
      p23.X := (p2.X + p3.X) *half;
      p23.Y := (p2.Y + p3.Y) *half;
      p34.X := (p3.X + p4.X) *half;
      p34.Y := (p3.Y + p4.Y) *half;
      p123.X := (p12.X + p23.X) *half;
      p123.Y := (p12.Y + p23.Y) *half;
      p234.X := (p23.X + p34.X) *half;
      p234.Y := (p23.Y + p34.Y) *half;
      p1234.X := (p123.X + p234.X) *half;
      p1234.Y := (p123.Y + p234.Y) *half;
      RecursiveCBezier(p1, p12, p123, p1234);
      RecursiveCBezier(p1234, p234, p34, p4);
    end;
  end;

begin
  //first check that the 'control_points' count is valid ...
  arrayLen := length(control_points);
  if (arrayLen < 4) or ((arrayLen -1) mod 3 <> 0) then exit;

  setLength(result, 128);
  result[0] := control_points[0];
  resultCnt := 1;
  for i := 0 to (arrayLen div 3)-1 do
  begin
    for j := 0 to 3 do
      ctrlPts[j] := FloatPoint(control_points[i*3 +j]);
    RecursiveCBezier(ctrlPts[0], ctrlPts[1], ctrlPts[2], ctrlPts[3]);
  end;
  SetLength(result,resultCnt);
end;
//------------------------------------------------------------------------------

function GetCSplinePoints(control_points: array of TFixedPoint): TArrayOfFixedPoint;
var
  i, arrayLen, resultCnt, resultSize, arrayDiv2Min2: integer;
  pts1, pts2, pts3, pts4: TFloatPoint;

  procedure RecursiveCBezier(const p1, p2, p3, p4: TFloatPoint);
  var
    p12, p23, p34, p123, p234, p1234: TFloatPoint;
  begin
    //assess flatness of curve ...
    //http://groups.google.com/group/comp.graphics.algorithms/tree/browse_frm/thread/d85ca902fdbd746e
    if abs(p1.x + p3.x - 2*p2.x) + abs(p2.x + p4.x - 2*p3.x) +
      abs(p1.y + p3.y - 2*p2.y) + abs(p2.y + p4.y - 2*p3.y) < cbezier_tolerance then
    begin
      if resultCnt = length(result) then
        setLength(result, length(result) +128);
      result[resultCnt] := FixedPoint(p4);
      inc(resultCnt);
    end else
    begin
      p12.X := (p1.X + p2.X) *half;
      p12.Y := (p1.Y + p2.Y) *half;
      p23.X := (p2.X + p3.X) *half;
      p23.Y := (p2.Y + p3.Y) *half;
      p34.X := (p3.X + p4.X) *half;
      p34.Y := (p3.Y + p4.Y) *half;
      p123.X := (p12.X + p23.X) *half;
      p123.Y := (p12.Y + p23.Y) *half;
      p234.X := (p23.X + p34.X) *half;
      p234.Y := (p23.Y + p34.Y) *half;
      p1234.X := (p123.X + p234.X) *half;
      p1234.Y := (p123.Y + p234.Y) *half;
      RecursiveCBezier(p1, p12, p123, p1234);
      RecursiveCBezier(p1234, p234, p34, p4);
    end;
  end;

begin
  //CSplines are series of 'smooth' CBeziers where the shared point of each
  //adjacent bezier is calculated from the midpoint of adjoining control points.
  //(c.f. SVG's 'S' command - http://www.w3.org/TR/SVG11/paths.html ).

  //first check that the 'control_points' count is valid ...
  arrayLen := length(control_points);
  if (arrayLen < 4) or odd(arrayLen) then exit;
  arrayDiv2Min2 := arrayLen div 2 -2;
  resultSize := 128;
  setLength(result, resultSize);
  result[0] := control_points[0];
  resultCnt := 1;

  pts1 := FloatPoint(control_points[0]);
  for i := 0 to arrayDiv2Min2 do
  begin
    pts2 := FloatPoint(control_points[i*2+1]);
    pts3 := FloatPoint(control_points[i*2+2]);
    if i < arrayDiv2Min2 then //if not last bezier then ...
      pts4 := FloatPoint(MidPoint(control_points[i*2+2], control_points[i*2+3]))
    else
      pts4 := FloatPoint(control_points[i*2+3]);
    RecursiveCBezier(pts1, pts2, pts3, pts4);

    //prepare for the next segment ...
    pts1 := pts4;
  end;
  SetLength(result, resultCnt);
end;
//------------------------------------------------------------------------------

function GetQBezierPoints(control_points: array of TFixedPoint): TArrayOfFixedPoint;
var
  i, j, arrayLen, resultCnt, resultSize: integer;
  pts: array [0..2] of TFloatPoint;

  procedure RecursiveQBezier(const p1, p2, p3: TFloatPoint);
  var
    p12, p23, p123: TFloatPoint;
  begin
    //assess flatness of curve ...
    if abs(p1.x + p3.x - 2*p2.x) + abs(p1.y + p3.y - 2*p2.y) < qbezier_tolerance then
    begin
      if resultCnt = length(result) then setLength(result, length(result) +128);
      result[resultCnt] := FixedPoint(p3);
      inc(resultCnt);
    end else
    begin
      p12.X := (p1.X + p2.X) *half;
      p12.Y := (p1.Y + p2.Y) *half;
      p23.X := (p2.X + p3.X) *half;
      p23.Y := (p2.Y + p3.Y) *half;
      p123.X := (p12.X + p23.X) *half;
      p123.Y := (p12.Y + p23.Y) *half;
      RecursiveQBezier(p1, p12, p123);
      RecursiveQBezier(p123, p23, p3);
    end;
  end;

begin
  //first check that the 'control_points' count is valid ...
  arrayLen := length(control_points);
  if (arrayLen < 3) or ((arrayLen -1) mod 2 <> 0) then exit;

  resultSize := 128;
  setLength(result, resultSize);
  result[0] := control_points[0];
  resultCnt := 1;
  for j := 0 to (arrayLen div 2)-1 do
  begin
    for i := 0 to 2 do
    begin
      pts[i].X := control_points[i+ j*2].X*FixedToFloat;
      pts[i].Y := control_points[i+ j*2].Y*FixedToFloat;
    end;
    RecursiveQBezier(pts[0], pts[1], pts[2]);
  end;
  SetLength(result,resultCnt);
end;
//------------------------------------------------------------------------------

function GetQSplinePoints(control_points: array of TFixedPoint): TArrayOfFixedPoint;
var
  i, arrayLen, resultCnt, resultSize, arrayLenMin3: integer;
  pts1, pts2, pts3: TFloatPoint;

  procedure RecursiveQSpline(const p1, p2, p3: TFloatPoint);
  var
    p12, p23, p123: TFloatPoint;
  begin
    //assess flatness of curve ...
    if abs(p1.x + p3.x - 2*p2.x) + abs(p1.y + p3.y - 2*p2.y) < qbezier_tolerance then
    begin
      if resultCnt = length(result) then setLength(result, length(result) +128);
      result[resultCnt] := FixedPoint(p3);
      inc(resultCnt);
    end else
    begin
      p12.X := (p1.X + p2.X) *half;
      p12.Y := (p1.Y + p2.Y) *half;
      p23.X := (p2.X + p3.X) *half;
      p23.Y := (p2.Y + p3.Y) *half;
      p123.X := (p12.X + p23.X) *half;
      p123.Y := (p12.Y + p23.Y) *half;
      RecursiveQSpline(p1, p12, p123);
      RecursiveQSpline(p123, p23, p3);
    end;
  end;

begin
  //QSplines are series of 'smooth' QBeziers where each shared point is also
  //the midpoint of the control points of the adjoining QBeziers. This function
  //is typically used together with the Windows' GetGlyphOutline() API function.
  //(c.f. SVG's 'T' command - http://www.w3.org/TR/SVG11/paths.html )

  //first check that the 'control_points' count is valid ...
  arrayLen := length(control_points);
  if (arrayLen < 3) then exit;
  arrayLenMin3 := arrayLen -3;
  resultSize := 128;
  setLength(result, resultSize);
  result[0] := control_points[0];
  resultCnt := 1;

  pts1 := FloatPoint(control_points[0]);
  for i := 0 to arrayLenMin3 do
  begin
    pts2 := FloatPoint(control_points[i+1]);
    if i < arrayLenMin3 then //if not last bezier then ...
      pts3 := FloatPoint(MidPoint(control_points[i+1], control_points[i+2]))
    else
      pts3 := FloatPoint(control_points[i+2]);
    RecursiveQSpline(pts1, pts2, pts3);

    //prepare for the next segment ...
    pts1 := pts3;
  end;
  SetLength(result, resultCnt);
end;
//------------------------------------------------------------------------------

function GetEllipsePoints(const ellipseRect: TFloatRect): TArrayOfFixedPoint;
const
  //Magic constant = 2/3*(1-cos(90?2))/sin(90?2) = 2/3*(sqrt(2)-1) = 0.27614
  offset: single = 0.276142375;
var
  midx, midy, offx, offy: single;
  pts: array [0..12] of TFixedPoint;
begin
  with ellipseRect do
  begin
    midx := (right + left)/2;
    midy := (bottom + top)/2;
    offx := (right - left) * offset;
    offy := (bottom - top) * offset;
    //draws an ellipse starting at angle 0 and moving anti-clockwise ...
    pts[0]  := FixedPoint(right, midy);
    pts[1]  := FixedPoint(right, midy - offy);
    pts[2]  := FixedPoint(midx + offx, top);
    pts[3]  := FixedPoint(midx, top);
    pts[4]  := FixedPoint(midx - offx, top);
    pts[5]  := FixedPoint(left, midy - offy);
    pts[6]  := FixedPoint(left, midy);
    pts[7]  := FixedPoint(left, midy + offy);
    pts[8]  := FixedPoint(midx - offx, bottom);
    pts[9]  := FixedPoint(midx, bottom);
    pts[10] := FixedPoint(midx + offx, bottom);
    pts[11] := FixedPoint(right, midy + offy);
    pts[12] := pts[0];
  end;
  result := GetCBezierPoints(pts);
end;
//------------------------------------------------------------------------------

function GetPtOnEllipseFromAngleEccentric(const ellipseRect: TFloatRect;
  eccentric_angle_radians: single): TFloatPoint;
var
  SinAng, CosAng: single;
  center: TFloatPoint;
begin
  with ellipseRect do
  begin
    center.X := (right+left)/2;
    center.Y := (bottom+top)/2;
    DCM32.SinCos(eccentric_angle_radians, SinAng, CosAng);
    result.X := center.X + (right-left)/2*CosAng;
    //negative offset since Y is positive downwards ...
    result.Y := center.Y - (bottom-top)/2*SinAng;
  end;
end;
//------------------------------------------------------------------------------

function AngleToEccentricAngle(const ellipseRect: TFloatRect;
  radians: single): single;
var
  quadrant: (First, Second, Third, Forth);
  a,b: single;
begin
  //given a point (x,y) on an ellipse with x diameter = 2*a & y diameter = 2b
  //x = a * cos? y = b * sin? y/x = tan? a / b = r
  //a = x / cos? b = y / sin?
  //a = r * b
  //x / cos?= r * y / sin?
  //x * sin?/ cos?= r * y
  //x * tan?= r * y
  //tan?= (a/b) * y/x
  //tan?= (a/b) * tan?
  //?= arctan(tan?* a/b);
  with ellipseRect do
  begin
    a := (right-left)/2;
    b := (bottom-top)/2;
  end;
  result := 0;
  if (a = 0) or (b = 0) then exit;
  while radians > ThreeSixty do radians := radians - ThreeSixty;
  while radians < 0 do radians := radians + ThreeSixty;
  if radians > TwoSeventy then quadrant := Forth
  else if radians > OneEighty then quadrant := Third
  else if radians > Ninety then quadrant := Second
  else quadrant := First;
  result := arctan(tan(radians)* a/b);
  case quadrant of
    First: result := abs(result);
    Second: result := OneEighty - abs(result);
    Third : result := OneEighty + abs(result);
    Forth : result := ThreeSixty - abs(result);
  end;
end;
//------------------------------------------------------------------------------

function GetArcPoints(const ellipseRect: TFloatRect;
  startPt, endPt: TFloatPoint): TArrayOfFixedPoint;
var
  c: TFloatPoint;
  start_rad, end_rad: single;
begin
  with ellipseRect do
  begin
    c.X := (right+left)/2;
    c.Y := (bottom+top)/2;
  end;
  start_rad := AngleToEccentricAngle(ellipseRect,GetAnglePt2FromPt1(c,startPt));
  end_rad := AngleToEccentricAngle(ellipseRect,GetAnglePt2FromPt1(c,endPt));
  result := GetArcPointsEccentric(ellipseRect,start_rad,end_rad);
end;
//------------------------------------------------------------------------------

function GetArcPoints(const ellipseRect: TFloatRect;
  start_degrees, end_degrees: single): TArrayOfFixedPoint;
var
  start_radians, end_radians: single;
begin
  start_radians := AngleToEccentricAngle(ellipseRect,start_degrees*DegToRad);
  end_radians := AngleToEccentricAngle(ellipseRect,end_degrees*DegToRad);
  result := GetArcPointsEccentric(ellipseRect,start_radians, end_radians);
end;
//------------------------------------------------------------------------------

function GetArcPointsEccentric(const ellipseRect: TFloatRect;
  start_eccentric, end_eccentric: single): TArrayOfFixedPoint;
var
  w, h, offset, angleDiff: single;
  tmpLen, resultLen: integer;
  pts: array [0..3] of TFixedPoint;
  tmp: TArrayOfFixedPoint;
const
  //offset90 = 2/3*(1-cos(90?2))/sin(90?2) = 2/3*(sqrt(2)-1) = 0.276142375
  offset90 = 0.276142375;
begin
  if start_eccentric = end_eccentric then
    start_eccentric := start_eccentric - ThreeSixty;
  angleDiff := end_eccentric - start_eccentric;
  if angleDiff < 0 then angleDiff := angleDiff + ThreeSixty;
  with ellipseRect do
  begin
    w := (right - left);
    h := (bottom - top);
  end;

  resultLen := 0;
  while angleDiff > Ninety do
  begin
    pts[0]  := FixedPoint(GetPtOnEllipseFromAngleEccentric(ellipseRect,start_eccentric));
    pts[3]  := FixedPoint(GetPtOnEllipseFromAngleEccentric(ellipseRect,start_eccentric+Ninety));
    pts[1].X  := Fixed((pts[0].X*fixedToFloat) - (sin(start_eccentric)*offset90*w));
    pts[1].Y  := Fixed((pts[0].Y*fixedToFloat) - (cos(start_eccentric)*offset90*h));
    pts[2].X  := Fixed((pts[3].X*fixedToFloat) + (sin(start_eccentric+Ninety)*offset90*w));
    pts[2].Y  := Fixed((pts[3].Y*fixedToFloat) + (cos(start_eccentric+Ninety)*offset90*h));
    tmp := GetCBezierPoints(pts);
    tmpLen := length(tmp);
    SetLength(result, resultLen+tmpLen);
    move(tmp[0], result[resultLen], tmpLen * sizeof(TFixedPoint));
    inc(resultLen, tmpLen);
    start_eccentric := start_eccentric + Ninety;
    angleDiff := angleDiff - Ninety;
  end;
  offset := 2/3*(1-cos(angleDiff/2))/sin(angleDiff/2);
  pts[0]  := FixedPoint(GetPtOnEllipseFromAngleEccentric(ellipseRect,start_eccentric));
  pts[3]  := FixedPoint(GetPtOnEllipseFromAngleEccentric(ellipseRect,end_eccentric));
  pts[1].X  := Fixed((pts[0].X*fixedToFloat) - (sin(start_eccentric)*offset*w));
  pts[1].Y  := Fixed((pts[0].Y*fixedToFloat) - (cos(start_eccentric)*offset*h));
  pts[2].X  := Fixed((pts[3].X*fixedToFloat) + (sin(end_eccentric)*offset*w));
  pts[2].Y  := Fixed((pts[3].Y*fixedToFloat) + (cos(end_eccentric)*offset*h));
  tmp := GetCBezierPoints(pts);
  tmpLen := length(tmp);
  SetLength(result, resultLen+tmpLen);
  move(tmp[0], result[resultLen], tmpLen * sizeof(TFixedPoint));
end;
//------------------------------------------------------------------------------

function GetPiePoints(const ellipseRect: TFloatRect;
  startPt, endPt: TFloatPoint): TArrayOfFixedPoint;
var
  len: integer;
begin
  result := GetArcPoints(ellipseRect,startPt,endPt);
  len := length(result);
  setlength(result, len+2);
  with ellipseRect do
    result[len] := FixedPoint((left+right)/2,(top+bottom)/2);
  result[len+1] := result[0];
end;
//------------------------------------------------------------------------------

function GetPiePoints(const ellipseRect: TFloatRect;
  start_degrees, end_degrees: single): TArrayOfFixedPoint;
var
  start_radians, end_radians: single;
begin
  start_radians := AngleToEccentricAngle(ellipseRect,start_degrees*DegToRad);
  end_radians := AngleToEccentricAngle(ellipseRect,end_degrees*DegToRad);
  result := GetPiePointsEccentric(ellipseRect,start_radians, end_radians);
end;
//------------------------------------------------------------------------------

function GetPiePointsEccentric(const ellipseRect: TFloatRect;
  start_eccentric, end_eccentric: single): TArrayOfFixedPoint;
var
  len: integer;
begin
  result := GetArcPointsEccentric(ellipseRect, start_eccentric, end_eccentric);
  len := length(result);
  setlength(result, len+2);
  with ellipseRect do
    result[len] := FixedPoint((left+right)/2,(top+bottom)/2);
  result[len+1] := result[0];
end;
//------------------------------------------------------------------------------

function GetRoundedRectanglePoints(const rect: TFloatRect;
  roundingPercent: cardinal): TArrayOfFixedPoint;
var
  roundingFrac: single;
  i,j,k,arcLen: integer;
  dx,dy: single;
  arcs: array [0 .. 3] of TArrayOfFixedPoint;
begin
  //nb: it's simpler to construct the rounded rect in an anti-clockwise
  //direction because that's the direction in which the arc points are returned.

  if roundingPercent < 5 then roundingPercent := 5
  else if roundingPercent > 90 then roundingPercent := 90;
  roundingFrac := roundingPercent/200; //ie rounds up 90?of half the line
  with rect do
  begin
    dx := (Right-Left)*roundingFrac;
    dy := (Bottom-Top)*roundingFrac;
    if (dx < dy) then
    begin
      if dy < (Right-Left)*0.45 then dx := dy
      else dx := (Right-Left)*0.45;
    end;
    if (dy < dx) then
    begin
      if dx < (Bottom-Top)*0.45 then dy := dx
      else dy := (Bottom-Top)*0.45;
    end;
    arcs[0] := GetArcPointsEccentric(
      FloatRect(Left, Bottom -dy*2, Left+dx*2, Bottom), OneEighty, TwoSeventy);
    arcs[1] := GetArcPointsEccentric(
      FloatRect(Right-dx*2, Bottom -dy*2, Right, Bottom), TwoSeventy, 0);
    arcs[2] := GetArcPointsEccentric(
      FloatRect(Right - dx*2, Top, Right, Top + dy*2), 0, Ninety);
    arcs[3] := GetArcPointsEccentric(
      FloatRect(Left, top, Left+dx*2, Top+dy*2), Ninety, OneEighty);
  end;

  //calculate the final number of points to return
  j := 0;
  for i := 0 to 3 do inc(j, length(arcs[i]));
  setLength(result, j);

  j := 0;
  for i := 0 to 3 do
  begin
    arcLen := length(arcs[i]);
    for k := 0 to arcLen -1 do result[j+k] := arcs[i][k];
    inc(j,arcLen);
  end;
end;
//------------------------------------------------------------------------------

function GetBalloonedEllipsePoints(const ellipseRect: TFloatRect;
  balloonPos: TBalloonPos): TArrayOfFixedPoint;
const
  diamondSize = 15;
var
  len: integer;
begin
  case balloonPos of
    bpNone:
      result := GetEllipsePoints(ellipseRect);
    bpTopLeft:
      with ellipseRect do
      begin
        result := GetArcPointsEccentric(
          FloatRect(left,top,right,bottom),
          (135+diamondSize)*DegToRad, (135-diamondSize)*DegToRad);
        len := length(result);
        setlength(result, len+1);
        result[len] := FixedPoint(left,top);
      end;
    bpTopRight:
      with ellipseRect do
      begin
        result := GetArcPointsEccentric(
          FloatRect(left,top,right,bottom),
          (45+diamondSize)*DegToRad, (45-diamondSize)*DegToRad);
        len := length(result);
        setlength(result, len+1);
        result[len] := FixedPoint(right,top);
      end;
    bpBottomRight:
      with ellipseRect do
      begin
        result := GetArcPointsEccentric(
          FloatRect(left,top,right,bottom),
          (315+diamondSize)*DegToRad, (315-diamondSize)*DegToRad);
        len := length(result);
        setlength(result, len+1);
        result[len] := FixedPoint(right,bottom);
      end;
    bpBottomLeft:
      with ellipseRect do
      begin
        result := GetArcPointsEccentric(
          FloatRect(left,top,right,bottom),
          (225+diamondSize)*DegToRad, (225-diamondSize)*DegToRad);
        len := length(result);
        setlength(result, len+1);
        result[len] := FixedPoint(left,bottom);
      end;

  end;
end;
//------------------------------------------------------------------------------

function GradientColor(color1, color2: TColor32; frac: single): TColor32;
var
  a1,a2,b1,g1,r1,b2,g2,r2: byte;
begin
  if frac >= 1 then result := color2
  else if frac <= 0 then result := color1
  else
  begin
    Color32ToRGBA(color1,r1,g1,b1,a1);
    Color32ToRGBA(color2,r2,g2,b2,a2);

    r1 := trunc(r1*(1-frac) + r2*frac);
    g1 := trunc(g1*(1-frac) + g2*frac);
    b1 := trunc(b1*(1-frac) + b2*frac);
    a1 := trunc(a1*(1-frac) + a2*frac);
    result := (a1 shl 24) or (r1 shl 16) or (g1 shl 8) or b1;
  end;
end;
//------------------------------------------------------------------------------

function GetColor(const colors: array of TColor32; fraction: single): TColor32;
var
  i,colorLen: integer;
  c1,c2: TColor32;
begin
  colorLen := length(colors);
  if (fraction >= 1) then
    result := colors[colorLen -1]
  else if (fraction <= 0) then
    result := colors[0]
  else
  begin
    fraction := fraction * (colorLen-1);
    i := trunc(fraction);
    c1 := colors[i];
    c2 := colors[i+1];
    result := GradientColor(c1, c2, frac(fraction));
  end;
end;
//------------------------------------------------------------------------------

function IsClockwiseDirection(const pts: array of TFixedPoint): boolean;
var
  p1, p2, p3: TFloatPoint;
begin
  //nb: this algorithm assumes a convex shaped polygon
  result := true;
  if length(pts) < 3 then exit;
  p1 := FloatPoint(pts[0]);
  p2 := FloatPoint(pts[1]);
  p3 := FloatPoint(pts[2]);
  result := (p3.X - p2.X) * (p2.y - p1.Y) - (p3.Y - p2.Y) * (p2.X - p1.X) < 0;
end;
//------------------------------------------------------------------------------

function BuildDashedLine(const Points: TArrayOfFixedPoint;
  const DashArray: array of TFloat; DashOffset: TFloat = 0): TArrayOfArrayOfFixedPoint;
var
  I, J, DashIndex: Integer;
  Offset, d, v: TFloat;
  dx, dy: TFixed;

  procedure AddPoint(X, Y: TFixed);
  var
    K: Integer;
  begin
    K := Length(Result[J]);
    SetLength(Result[J], K + 1);
    Result[J][K].X := X;
    Result[J][K].Y := Y;
  end;

begin
  DashIndex := 0;
  Offset := 0;
  DashOffset := DashArray[0] - DashOffset;

  v := 0;
  for I := 0 to High(DashArray) do v := v + DashArray[I];
  while DashOffset < 0 do DashOffset := DashOffset + v;
  while DashOffset >= v do DashOffset := DashOffset - v;

  while DashOffset - DashArray[DashIndex] > 0 do
  begin
    DashOffset := DashOffset - DashArray[DashIndex];
    Inc(DashIndex);
  end;

  J := 0;
  SetLength(Result, 1);
  if not Odd(DashIndex) then
    AddPoint(Points[0].X, Points[0].Y);
  for I := 1 to High(Points) do
  begin
    dx := Points[I].X - Points[I - 1].X;
    dy := Points[I].Y - Points[I - 1].Y;
    d := Hypot(dx*FixedToFloat, dy*FixedToFloat);
    if d = 0 then  Continue;
    dx := round(dx / d);
    dy := round(dy / d);
    Offset := Offset + d;
    while Offset > DashOffset do
    begin
      v := Offset - DashOffset;
      AddPoint(Points[I].X - round(v * dx), Points[I].Y - round(v * dy));
      DashIndex := (DashIndex + 1) mod Length(DashArray);
      DashOffset := DashOffset + DashArray[DashIndex];
      if Odd(DashIndex) then
      begin
        Inc(J);
        SetLength(Result, J + 1);
      end;
    end;
    if not Odd(DashIndex) then
      AddPoint(Points[I].X, Points[I].Y);
  end;
  if Length(Result[J]) = 0 then SetLength(Result, Length(Result) - 1);
end;
//------------------------------------------------------------------------------

end.
