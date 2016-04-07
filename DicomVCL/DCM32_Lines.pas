{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}

unit DCM32_Lines;


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
   DCM32_Polygons, DCM32_Misc;

type

  TJoinStyle = (jsBevelled, jsRounded, jsMitered);
  TEndStyle = (esSquared, esRounded, esClosed, esButt);
  TBalloonPos = (bpNone, bpTopLeft, bpTopRight, bpBottomLeft, bpBottomRight);
  TQuadrant = (First, Second, Third, Forth);
  TArrowHeadStyle = (asNone, asThreePoint,
    asFourPoint, asSquare, asDiamond, asCircle, asCustom);
  THitTestResult = (htNone, htStartArrow, htEndArrow, htLine);

  TCustomArrowHeadProc = function(tipPt, tailPt: TFixedPoint;
    HeadSize, PenWidth: single;
    ArrowHeadStyle: TArrowHeadStyle): TArrayOfFixedPoint of Object;
  TColorProc = function(frac: single): TColor32;

  {$IFDEF Use_GR32_PolygonsEx}
  //TPolygon32Ex - is a wrapper class that redirects polygon rasterisation
  //to Mattias Andersson's GR32_PolygonsEx unit by emulating a small subset
  //of TPolygon32's methods and properties ...
  TPolygon32Ex = class
  private
    fPPts: TArrayOfArrayOfFixedPoint;
    fClosed: boolean;               //ignored (always true)
    fAntialiased: boolean;          //ignored (always true)
    fAntialiasMode: TAntialiasMode; //ignored
    fFillMode: TPolyFillMode;
  public
    constructor Create;
    procedure Clear;
    procedure Newline;
    procedure AddPoints(var First: TFixedPoint; Count: Integer);
    procedure Draw(Bitmap: TCnsBitmap32; OutlineColor, FillColor: TColor32); overload;
    procedure Draw(Bitmap: TCnsBitmap32; OutlineColor: TColor32; Filler: TCustomPolygonFiller); overload;
    procedure DrawFill(Bitmap: TCnsBitmap32; Color: TColor32); overload;
    procedure DrawFill(Bitmap: TCnsBitmap32; Filler: TCustomPolygonFiller); overload;
    procedure DrawEdge(Bitmap: TCnsBitmap32; Color: TColor32);
    property  Closed: Boolean read FClosed write FClosed;
    property  Antialiased: Boolean read fAntialiased write fAntialiased;
    property  AntialiasMode: TAntialiasMode read FAntialiasMode write FAntialiasMode;
    property  FillMode: TPolyFillMode read FFillMode write FFillMode;
  end;
  {$ENDIF}

  TLine32 = class;
  TArrowHead = class;

  TArrowPen = class
  private
    fOwnerArrowHead: TArrowHead;
    fColor: TColor32;
    fWidth: single;
    procedure SetWidth(value: single);
  public
    constructor Create(owner: TArrowHead);
    property Color: TColor32 read fColor write fColor;
    property Width: single read fWidth write SetWidth;
  end;

  TArrowHead = class
  private
    fOwnerLine32: TLine32;
    fIsStartArrow: boolean;
    fStyle: TArrowHeadStyle;
    fSize: single;
    fColor: TColor32;
    fCustomProc: TCustomArrowHeadProc;
    fPen: TArrowPen;
    fTipPoint: TFixedPoint;
    fBasePoint: TFixedPoint;
    fOldBase: TFixedPoint; //necessary for semi-transparent arrow heads
    fBaseIdx: integer;
    fPoints: TArrayOfFixedPoint;
    procedure GetPoints;
    procedure SetSize(value: single);
    procedure SetStyle(value: TArrowHeadStyle);
    procedure SetCustomProc(value: TCustomArrowHeadProc);
    procedure Draw(bitmap: TCnsBitmap32);
  protected
    function IsNeeded: boolean;
    function Points: TArrayOfFixedPoint;
    //OutlinePoints - outer perimeter for hittesting (includes pen width)
    function OutlinePoints: TArrayOfFixedPoint;
    property Base: TFixedPoint read fBasePoint;
  public
    constructor Create(owner: TLine32; IsStartArrow: boolean);
    destructor Destroy; override;

    property Color: TColor32 read fColor write fColor;
    property Style: TArrowHeadStyle read fStyle write SetStyle;
    property Size: single read fSize write SetSize;
    property Pen: TArrowPen read fPen;
    property CustomProc: TCustomArrowHeadProc
      read fCustomProc write SetCustomProc;
  end;

  TLine32 = class
  private
    fLinePoints     : TArrayOfFixedPoint;
    fLeftPoints     : TArrayOfFixedPoint;
    fRightPoints    : TArrayOfFixedPoint;
    fPolygon32      : {$IFDEF Use_GR32_PolygonsEx} TPolygon32Ex; {$ELSE} TPolygon32; {$ENDIF}
    fStartArrow     : TArrowHead;
    fEndArrow       : TArrowHead;
    fLineWidth      : single;
    fEndStyle       : TEndStyle;
    fFillMode       : TPolyFillMode;
    fMiterLimit     : single;
    fJoinStyle      : TJoinStyle;
    procedure Build;
    procedure SetWidth(value: single);
    procedure SetMiterLimit(value: single);
    procedure SetJoinStyle(value: TJoinStyle);
    procedure SetEndStyle(value: TEndStyle);
    procedure AdjustEndsForArrows;
    procedure DrawArrows(bitmap: TCnsBitmap32);
    procedure DrawGradientHorz(bitmap: TCnsBitmap32; penWidth: single;
      const colors: array of TColor32; edgeColor: TColor32 = $00000000);
    procedure DrawGradientVert(bitmap: TCnsBitmap32; penWidth: single;
      const colors: array of TColor32; edgeColor: TColor32 = $00000000);
    {$IFNDEF Use_GR32_PolygonsEx}
    function GetAntialiasMode: TAntialiasMode;
    procedure SetAntialiasMode(aaMode: TAntialiasMode);
    {$ENDIF}
  protected
    procedure ForceRebuild;
    property LineWidth: single read fLineWidth write SetWidth;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    procedure SetPoints(const pts: array of TFixedPoint);
    function AddPoints(const newPts: array of TFixedPoint;
      ToEnd: boolean = true): cardinal; overload;
    function AddPoints(var startPt: TFixedPoint; count: integer;
      ToEnd: boolean = true): cardinal; overload;
    procedure DeletePoints(count: integer; FromEnd: boolean = true);

    //draw a solid line (nb: edgeColor if used will be of width 1 px)
    //nb: if you want to draw lines with edges wider than 1 px then use GetOutline().
    procedure Draw(bitmap: TCnsBitmap32; penWidth: single; color: TColor32; edgeColor: TColor32 = $00000000); overload;
    //draw a line using a bitmap pattern ...
    procedure Draw(bitmap: TCnsBitmap32; penWidth: single; pattern: TCnsBitmap32; edgeColor: TColor32 = $00000000); overload;
    //draw a line using a TCustomPolygonFiller filler ...
    procedure Draw(bitmap: TCnsBitmap32; penWidth: single; filler: TCustomPolygonFiller; edgeColor: TColor32 = $00000000); overload;
    //draw a stippled line ...
    procedure Draw(bitmap: TCnsBitmap32; penWidth: single; colors: array of TColor32); overload;
    procedure Draw(bitmap: TCnsBitmap32; penWidth: single; colors: array of TColor32; StippleStep: single); overload;
    //draw a line using a color gradient at the specified angle ...
    procedure DrawGradient(bitmap: TCnsBitmap32; penWidth: single;
      const colors: array of TColor32; 
      angle_degrees: integer; edgeColor: TColor32 = $00000000);

    //GetOutline() gets an array of points that represent the outline of the
    //line at the specified line width.
    //When penWidth = 0 the existing width will be used to execute the method.
    function GetOutline(penWidth: single = 0): TArrayOfFixedPoint;
    //GetOuterEdge() gets an array of points that represents the outer edge
    //of the current 'closed' line points (polygon) at the specified line width.
    //When penWidth = 0 the existing width will be used to execute the method.
    //nb: GetOuterEdge assumes a convex polygon (otherwise may get inner edge)
    function GetOuterEdge(penWidth: single = 0): TArrayOfFixedPoint;
    //GetInnerEdge() gets an array of points that represents the inner edge
    //of the current 'closed' line points (polygon) at the specified line width.
    //When penWidth = 0 the existing width will be used to execute the method.
    //nb: GetInnerEdge assumes a convex polygon (otherwise may get outer edge)
    function GetInnerEdge(penWidth: single = 0): TArrayOfFixedPoint;

    function GetLeftPoints: TArrayOfFixedPoint;
    function GetRightPoints: TArrayOfFixedPoint;
    
    //IsClockwiseDirection (renamed from GetDirection) - assumes a convex shape
    //and is useful to differentiate between 'inner' from 'outer' edges
    function IsClockwiseDirection: boolean;

    //When width = 0 the previous line width will be used to execute the method.
    function GetBoundsFixedRect(penWidth: single = 0): TFixedRect;
    function GetBoundsRect(penWidth: single = 0): TRect;

    procedure Transform(matrix : TFloatMatrix);
    procedure Translate(dx,dy: TFloat);
    procedure Scale(dx,dy: TFloat);
    procedure Rotate(origin: TFloatPoint; radians: single);

    //DoHitTest() returns whether the point is inside the line (or arrows)
    //When width = 0 the previous line width will be used to execute the method.
    function DoHitTest(pt: TFixedPoint; penWidth: single = 0): THitTestResult;

    function Points: TArrayOfFixedPoint;

    {$IFNDEF Use_GR32_PolygonsEx}
    property  AntialiasMode: TAntialiasMode read
      GetAntialiasMode write SetAntialiasMode default am16times;
    {$ENDIF}
    property ArrowStart: TArrowHead read fStartArrow;
    property ArrowEnd: TArrowHead read fEndArrow;
    //MiterLimit: used when JoinStyle = jsMitered and indicates
    //the maximum allowed miter distance (default = 2; 0 = fully bevelled).
    property MiterLimit: single read fMiterLimit write SetMiterLimit;
    property EndStyle: TEndStyle read fEndStyle write SetEndStyle;
    property JoinStyle: TJoinStyle read fJoinStyle write SetJoinStyle;
    property FillMode: TPolyFillMode read fFillMode write fFillMode;
  end;

const
  MAXIMUM_SHADOW_FADE = 0;
  MEDIUM_SHADOW_FADE  = 5;
  MINIMUM_SHADOW_FADE = 10;
  NO_SHADOW_FADE      = 11; //anything > 10

////////////////////////////////////////////////////////////////////////////////
// Helper polyline functions ...
////////////////////////////////////////////////////////////////////////////////

//SmoothChart: returns an array of points representing a smoothing of ChartPts.
//It assumes that chartPts progress in a positive direction along the X-axis.
//The returned polyline will pass through all ChartPts' points.
//(xStep is the usual interval between points on the x-axis.)
function SmoothChart(const chartPts: array of TFixedPoint; xStep: integer): TArrayOfFixedPoint; 

////////////////////////////////////////////////////////////////////////////////
// Helper drawing functions (that don't require a TLine32 object) ...
////////////////////////////////////////////////////////////////////////////////

//quick and easy (anti-aliased) lines of 1px width ...
procedure SimpleLine(bitmap: TCnsBitmap32;
  const pts: array of TFixedPoint; color: TColor32; closed: boolean = false); overload;

procedure SimpleLine(bitmap: TCnsBitmap32; const pts: TArrayOfArrayOfFixedPoint;
  color: TColor32; closed: boolean); overload;

//fill a set of closed points with a color (with 1px width edge) ...
procedure SimpleFill(bitmap: TCnsBitmap32; pts: array of TFixedPoint;
  edgeColor, fillColor: TColor32; aFillMode: TPolyFillMode = pfWinding); overload;

procedure SimpleFill(bitmap: TCnsBitmap32; const pts: TArrayOfArrayOfFixedPoint;
  edgeColor, fillColor: TColor32; aFillMode: TPolyFillMode = pfWinding); overload;

//fill a set of closed points with a bitmap32 pattern (with 1px width edge) ...
procedure SimpleFill(bitmap: TCnsBitmap32; pts: array of TFixedPoint;
  edgeColor: TColor32; pattern: TCnsBitmap32; aFillMode: TPolyFillMode = pfWinding); overload;

procedure SimpleFill(bitmap: TCnsBitmap32; const pts: TArrayOfArrayOfFixedPoint;
  edgeColor: TColor32; pattern: TCnsBitmap32; aFillMode: TPolyFillMode = pfWinding); overload;

//fill a set of closed points with a color gradient at the specified angle ...
procedure SimpleGradientFill(
  bitmap: TCnsBitmap32; pts: array of TFixedPoint; edgeColor: TColor32;
  const colors: array Of TColor32; angle_degrees: integer); overload;
procedure SimpleGradientFill(
  bitmap: TCnsBitmap32; pts: TArrayOfArrayOfFixedPoint; edgeColor: TColor32;
  const colors: array Of TColor32; angle_degrees: integer); overload;

procedure SimpleStippleFill(bitmap: TCnsBitmap32; pts: array of TFixedPoint;
  const colors: array Of TColor32; step: single; angle_degrees: integer);

procedure SimpleRadialGradient(bitmap: TCnsBitmap32; const pt: TFixedPoint;
  radius: single; const colors: array of TColor32); overload;
procedure SimpleRadialGradient(bitmap: TCnsBitmap32; const rec: TFloatRect;
  const colors: array of TColor32); overload;

procedure SimpleRadialFill(bitmap: TCnsBitmap32;
  const pts: array of TFixedPoint; const colors: array of TColor32); overload;
procedure SimpleRadialFill(bitmap: TCnsBitmap32;
  const pts: TArrayOfArrayOfFixedPoint; const colors: array of TColor32); overload;

//SimpleShadow decayRate:
//  0 = maximum (exponential) shadow decay => palest shadows
//  1 .. 9 => mixture of exponential and linear shadow decay
//  10 = linear shadow decay               => darkest shadows (but still decays)
// >10 = no shadow decay                   => uniform shadow color
procedure SimpleShadow(bitmap: TCnsBitmap32; const pts: TArrayOfFixedPoint;
  dx,dy,decayRate: integer; shadowColor: TColor32; closed: boolean = false); overload;
procedure SimpleShadow(bitmap: TCnsBitmap32; const pts: TArrayOfArrayOfFixedPoint;
  dx,dy,decayRate: integer; shadowColor: TColor32; closed: boolean = false); overload;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

implementation

type

  TGrowBase = class
  private
  protected
    procedure AddLeft(idx: integer; const pt: TFixedPoint); virtual; abstract;
    procedure AddRight(idx: integer; const pt: TFixedPoint); virtual; abstract;
    procedure OnStart; virtual;
    procedure OnFinish; virtual;
  public
    procedure Grow(const pts: array of TFixedPoint; lineWidth: single;
      joinStyle: TJoinStyle; miterLimit: single; isClosed: boolean);
  end;

  TGrow = class(TGrowBase)
  private
    fLeftPts, fRightPts: PArrayOfFixedPoint;
    leftLen, leftBuffLen, rightLen, rightBuffLen: integer;
    buffSizeIncrement: integer;
  protected
    procedure AddLeft(idx: integer; const pt: TFixedPoint); override;
    procedure AddRight(idx: integer; const pt: TFixedPoint); override;
    procedure OnFinish; override;
  public
    constructor Create(LeftPts, RightPts: PArrayOfFixedPoint); virtual;
  end;

  PStippleItem = ^TStippleItem;
  TStippleItem = record
    left: TArrayOfFixedPoint;
    right: TArrayOfFixedPoint;
  end;

  TStippledGrow = class(TGrow)
  private
    fCurrentIndex: integer;
    fList: TList;
    function GetItem(index: integer): PStippleItem;
  protected
    procedure AddLeft(idx: integer; const pt: TFixedPoint); override;
    procedure AddRight(idx: integer; const pt: TFixedPoint); override;
    procedure OnStart; override;
  public
    constructor Create(LeftPts, RightPts: PArrayOfFixedPoint); override;
    destructor Destroy; override;
    procedure Clear;
    function Count: integer;
    property Item[index: integer]: PStippleItem read GetItem;
  end;

//------------------------------------------------------------------------------
// Miscellaneous helper functions
//------------------------------------------------------------------------------

procedure SimpleLine(bitmap: TCnsBitmap32;
  const pts: array of TFixedPoint; color: TColor32; closed: boolean = false);
var
  //i,
  len: integer;
begin
  len := length(pts);
  if len < 2 then exit;
  with TLine32.Create do
  try
    if closed then EndStyle := esClosed;
    SetPoints(pts);
    Draw(bitmap, 1, color);
  finally
    free;
  end;
//  with bitmap do
//  begin
//    bitmap.PenColor := color;
//    with pts[0] do bitmap.MoveToX(X, Y);
//    for i := 1 to len - 1 do with pts[i] do bitmap.LineToXS(X, Y);
//    if closed then with pts[0] do bitmap.LineToXS(X, Y);
//  end;
end;
//------------------------------------------------------------------------------

procedure SimpleLine(bitmap: TCnsBitmap32; const pts: TArrayOfArrayOfFixedPoint;
  color: TColor32; closed: boolean); overload;
var
  i: integer;
begin
  for i := 0 to length(pts) -1 do
    SimpleLine(bitmap,  pts[i], color, closed);
end;
//------------------------------------------------------------------------------

procedure SimpleFill(bitmap: TCnsBitmap32; pts: array of TFixedPoint;
  edgeColor, fillColor: TColor32; aFillMode: TPolyFillMode = pfWinding);
begin
  {$IFDEF Use_GR32_PolygonsEx}
  with TPolygon32Ex.Create do
  {$ELSE}
  with TPolygon32.Create do
  {$ENDIF}
  try
    Closed := true;
    Antialiased := true;
    AntialiasMode := am16times;
    FillMode := aFillMode;
    AddPoints(pts[0],length(pts));
    Draw(Bitmap, edgeColor, fillColor);
  finally
    free;
  end;
end;
//------------------------------------------------------------------------------

procedure SimpleFill(bitmap: TCnsBitmap32; const pts: TArrayOfArrayOfFixedPoint;
  edgeColor, fillColor: TColor32; aFillMode: TPolyFillMode = pfWinding); overload;
var
  i, len: integer;
begin
  len := length(pts);
  if len = 0 then exit;
  {$IFDEF Use_GR32_PolygonsEx}
  with TPolygon32Ex.Create do
  {$ELSE}
  with TPolygon32.Create do
  {$ENDIF}
  try
    Closed := true;
    Antialiased := true;
    AntialiasMode := am16times;
    FillMode := aFillMode;
    AddPoints(pts[0][0],length(pts[0]));
    for i := 1 to len -1 do
    begin
      newline;
      AddPoints(pts[i][0],length(pts[i]));
    end;
    Draw(bitmap, edgeColor, fillColor);
  finally
    free;
  end;
end;
//------------------------------------------------------------------------------

procedure SimpleFill(bitmap: TCnsBitmap32; pts: array of TFixedPoint;
  edgeColor: TColor32; pattern: TCnsBitmap32; aFillMode: TPolyFillMode = pfWinding);
var
  i,len: integer;
  polyPts: TArrayOfArrayOfFixedPoint;
begin
  len := length(pts);
  if len = 0 then exit;
  setLength(polyPts,1);
  setLength(polyPts[0],len);
  for i := 0 to len -1 do polyPts[0][i] := pts[i];
  SimpleFill(bitmap, polyPts, edgeColor, pattern, aFillMode);
end;
//------------------------------------------------------------------------------

procedure SimpleFill(bitmap: TCnsBitmap32; const pts: TArrayOfArrayOfFixedPoint;
  edgeColor: TColor32; pattern: TCnsBitmap32; aFillMode: TPolyFillMode = pfWinding);
var
  i, len: integer;
  filler: TBitmapPolygonFiller;
begin
  len := length(pts);
  if len = 0 then exit;
  {$IFDEF Use_GR32_PolygonsEx}
  with TPolygon32Ex.Create do
  {$ELSE}
  with TPolygon32.Create do
  {$ENDIF}
  try
    Closed := true;
    Antialiased := true;
    AntialiasMode := am16times;
    FillMode := aFillMode;
    filler := TBitmapPolygonFiller.Create;
    try
      filler.Pattern := pattern;
      AddPoints(pts[0][0], length(pts[0]));
      for i := 1 to len -1 do
      begin
        newline;
        AddPoints(pts[i][0],length(pts[i]));
      end;
      DrawFill(bitmap, filler);
    finally
      filler.Free;
    end;

    if AlphaComponent(edgeColor) <> $0 then
    begin
      SimpleLine(bitmap, pts, edgeColor, true);
      SimpleLine(bitmap, pts, edgeColor, true);
    end;
  finally
    free;
  end;
end;
//------------------------------------------------------------------------------

function NearlyMatch(const s1, s2, tolerance: single): boolean;
begin
  result := abs(s1 - s2) <= tolerance;
end;
//------------------------------------------------------------------------------

procedure SimpleGradientFillHorz(bitmap: TCnsBitmap32; pts: TArrayOfArrayOfFixedPoint;
  edgeColor: TColor32; const colors: array Of TColor32);
var
  i, j, len: integer;
  bmp: TCnsBitmap32;
  tmpRec, tmpRec2: TFixedRect;
  rec: TRect;
  dx: single;
  p: TArrayOfColor32;
  p2: PColor32Array;
begin
  i := 0;
  len := length(pts);
  while (i < len) and (length(pts[i]) = 0) do inc(i);
  if i = len then exit;
  for j := i to len-1 do
  begin
    if length(pts[j]) = 0 then continue;
    if j = i then
      tmpRec := GetBoundsFixedRect(pts[j])
    else
    begin
      tmpRec2 := GetBoundsFixedRect(pts[j]);
      tmpRec := GetRectUnion(tmpRec2,tmpRec);
    end;
  end;
  rec := MakeRect(tmpRec,rrOutside);
  with rec do if (right = left) or (top = bottom) then exit;
  bmp := TCnsBitmap32.Create;
  try
    bmp.Width := bitmap.Width;
    bmp.Height := bitmap.Height;
    bmp.DrawMode := dmBlend;
    bmp.CombineMode := cmMerge;

    //fill bmp with the gradient colors ...
    setlength(p, bmp.Width);
    {$R-}
    dx := 1/(rec.Right-rec.Left);
    for i := max(rec.Left,0) to min(rec.Right,bmp.Width) -1 do
      p[i] := GetColor(colors, (i-rec.Left)*dx);
    for j := max(rec.Top,0) to min(rec.Bottom,bmp.Height) -1 do
    begin
      p2 := bmp.ScanLine[j];
      for i := max(rec.Left,0) to min(rec.Right,bmp.Width) -1 do
        p2[i] := p[i];
    end;
    {$R+}

    SimpleFill(bitmap, pts, edgeColor, bmp);

  finally
    bmp.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure SimpleGradientFillVert(bitmap: TCnsBitmap32; pts: TArrayOfArrayOfFixedPoint;
  edgeColor: TColor32; const colors: array Of TColor32);
var
  i, j, len: integer;
  bmp: TCnsBitmap32;
  tmpRec, tmpRec2: TFixedRect;
  rec: TRect;
  dy: single;
  c: TColor32;
  p2: PColor32Array;
begin
  i := 0;
  len := length(pts);
  while (i < len) and (length(pts[i]) = 0) do inc(i);
  if i = len then exit;
  for j := i to len-1 do
  begin
    if length(pts[j]) = 0 then continue;
    if j = i then
      tmpRec := GetBoundsFixedRect(pts[j])
    else
    begin
      tmpRec2 := GetBoundsFixedRect(pts[j]);
      tmpRec := GetRectUnion(tmpRec2,tmpRec);
    end;
  end;
  rec := MakeRect(tmpRec,rrOutside);
  with rec do if (right = left) or (top = bottom) then exit;
  bmp := TCnsBitmap32.Create;
  try
    bmp.Width := bitmap.Width;
    bmp.Height := bitmap.Height;
    bmp.DrawMode := dmBlend;
    bmp.CombineMode := cmMerge;

    //fill bmp with the gradient colors ...
    {$R-}
    dy := 1/(rec.Bottom-rec.top);
    for j := max(rec.Top,0) to min(rec.Bottom, bmp.Height) -1 do
    begin
      p2 := bmp.ScanLine[j];
      c := GetColor(colors, (j-rec.Top)*dy);
      for i := max(rec.Left,0) to min(rec.Right, bmp.Width) -1 do p2[i] := c;
    end;
    {$R+}

    SimpleFill(bitmap, pts, edgeColor, bmp);

  finally
    bmp.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure SimpleGradientFill(bitmap: TCnsBitmap32; pts: array of TFixedPoint;
  edgeColor: TColor32; const colors: array Of TColor32; angle_degrees: integer);
var
  i,len: integer;
  polyPts: TArrayOfArrayOfFixedPoint;
begin
  len := length(pts);
  if len = 0 then exit;
  setLength(polyPts,1);
  setLength(polyPts[0],len);
  for i := 0 to len -1 do polyPts[0][i] := pts[i];
  SimpleGradientFill(bitmap, polyPts, edgeColor, colors, angle_degrees);
end;
//------------------------------------------------------------------------------

procedure SimpleGradientFill(
  bitmap: TCnsBitmap32; pts: TArrayOfArrayOfFixedPoint; edgeColor: TColor32;
  const colors: array of TColor32; angle_degrees: integer); overload;
var
  i, j, len: integer;
  bmp, bmp2: TCnsBitmap32;
  tmpRec, tmpRec2: TFixedRect;
  rec, rec2, rec3: TRect;
  rec3_offset, rec3_diff: TPoint;
  AT: TAffineTransformation;
  rotatedPts: TArrayOfArrayOfFixedPoint;
  rotPoint: TFloatPoint;
  angle_radians, dx: single;
  reverseColors: array of TColor32;
  src,dst: PColor32;
begin
  angle_radians := angle_degrees*DegToRad;
  len := length(colors);
  if len = 0 then exit;

  if NearlyMatch(angle_radians, 0, 5*OneDegree) then
  begin
    SimpleGradientFillHorz(bitmap, pts, edgeColor, colors);
    exit;
  end
  else if NearlyMatch(angle_radians, OneEighty, 5*OneDegree) then
  begin
    setLength(reverseColors, len);
    for i := 0 to len -1 do reverseColors[i] := colors[len-1-i];
    SimpleGradientFillHorz(bitmap, pts, edgeColor, reverseColors);
    exit;
  end
  else if NearlyMatch(angle_radians, Ninety, 5*OneDegree) then
  begin
    setLength(reverseColors, len);
    for i := 0 to len -1 do reverseColors[i] := colors[len-1-i];
    SimpleGradientFillVert(bitmap, pts, edgeColor, reverseColors);
    exit;
  end
  else if NearlyMatch(angle_radians, TwoSeventy, 5*OneDegree) then
  begin
    SimpleGradientFillVert(bitmap, pts, edgeColor, colors);
    exit;
  end;

  i := 0;
  len := length(pts);
  while (i < len) and (length(pts[i]) = 0) do inc(i);
  if i = len then exit;
  for j := i to len-1 do
  begin
    if length(pts[j]) = 0 then continue;
    if j = i then
      tmpRec := GetBoundsFixedRect(pts[j])
    else
    begin
      tmpRec2 := GetBoundsFixedRect(pts[j]);
      tmpRec := GetRectUnion(tmpRec2,tmpRec);
    end;
  end;
  rec := MakeRect(tmpRec,rrOutside);
  if (rec.Right = rec.Left) or (rec.Bottom = rec.Top) then exit;
  with rec do
    rotPoint := FloatPoint((left+right)/2,(top+bottom)/2);

  setLength(rotatedPts, length(pts));
  for i := 0 to high(pts) do
    rotatedPts[i] := rotatePoints(pts[i], FixedPoint(rotPoint), -angle_radians);

  for i := 0 to len-1 do
  begin
    if length(rotatedPts[i]) = 0 then continue;
    if i = 0 then
      tmpRec := GetBoundsFixedRect(rotatedPts[i])
    else
    begin
      tmpRec2 := GetBoundsFixedRect(rotatedPts[i]);
      tmpRec := GetRectUnion(tmpRec2,tmpRec);
    end;
  end;
  rec2 := MakeRect(tmpRec,rrOutside);
  inflateRect(rec2,1,1);
  rec3 := rec2;
  if rec3.Left > rec.Left then rec3.Left := rec.Left;
  if rec3.Top > rec.Top then rec3.Top := rec.Top;
  if rec3.Right < rec.Right then rec3.Right := rec.Right;
  if rec3.Bottom < rec.Bottom then rec3.Bottom := rec.Bottom;

  rec3_offset := Point(rec3.Left, rec3.Top);
  rec3_diff := Point(rec2.Left - rec3.Left, rec2.Top - rec3.Top);
  offsetRect(rec3, -rec3.Left, -rec3.Top);
  offsetPoint(rotPoint, -rec2.Left, -rec2.Top);
  offsetRect(rec2, -rec2.Left, -rec2.Top);

  bmp := TCnsBitmap32.Create;
  bmp2 := TCnsBitmap32.Create;
  try
    bmp.DrawMode := dmBlend;
    bmp.CombineMode := cmMerge;
    bmp.SetSize(rec2.right,rec2.bottom);

    bmp2.DrawMode := dmOpaque;
    bmp2.SetSize(rec3.right,rec3.bottom);

    {$R-}
    dx := 1/bmp.Width;
    src := @bmp.bits[0];
    for i := 0 to bmp.Width -1 do
    begin
      src^ := GetColor(colors, i*dx);
      //src^ := GradientColor(fillColor2, fillColor1, i*dx);
      inc(src);
    end;

    for i := 1 to bmp.Height -1 do
    begin
      src := @bmp.bits[0];
      dst := @bmp.bits[i*bmp.Width];
      for j := 0 to bmp.Width -1 do
      begin
        dst^ := src^;
        inc(src);
        inc(dst);
      end;
    end;
    {$R+}

    AT := TAffineTransformation.Create;
    try
      AT.SrcRect := FloatRect(rec2);
      AT.Rotate(rotPoint.X, rotPoint.Y, angle_degrees);
      AT.Translate(rec3_diff.X, rec3_diff.Y);
      DCM32_Transforms.Transform(bmp2, bmp, AT);
    finally
      AT.free;
    end;

    bmp.SetSize(bitmap.Width, bitmap.Height);
    bmp2.DrawTo(bmp,rec3_offset.X,rec3_offset.Y);
    SimpleFill(bitmap, pts, edgeColor, bmp);
  finally
    bmp.Free; bmp2.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure SimpleStippleFill(bitmap: TCnsBitmap32; pts: array of TFixedPoint;
  const colors: array Of TColor32; step: single; angle_degrees: integer);
var
  bmp, bmp2: TCnsBitmap32;
  rec, rec2, rec3: TRect;
  rec3_offset, rec3_diff: TPoint;
  AT: TAffineTransformation;
  rotatedPts: TArrayOfFixedPoint;
  rotPoint: TFloatPoint;
  i, j: integer;
  angle_radians: single;
  src,dst: PColor32;
begin
  angle_radians := angle_degrees*DegToRad;
  rec := GetBoundsRect(pts);
  if (rec.Right = rec.Left) or (rec.Bottom = rec.Top) then exit;

  if angle_degrees = 0 then
  begin
    //this avoids a lot of the complexity below ...
    bmp := TCnsBitmap32.Create;
    bmp2 := TCnsBitmap32.Create;
    try
      bmp.DrawMode := dmBlend;
      bmp.CombineMode := cmMerge;
      with rec do
        bmp.SetSize(right-left,bottom-top);
      bmp.SetStipple(colors);
      bmp.StippleStep := step;

      bmp2.DrawMode := dmBlend;
      bmp2.SetSize(rec.right,rec.bottom);

      bmp.LineFSP(0, 0, bmp.Width, 0);
      for i := 1 to bmp.Height -1 do
      begin
        {$R-}
        src := @bmp.bits[0];
        dst := @bmp.bits[i*bmp.Width];
        {$R+}
        for j := 0 to bmp.Width -1 do
        begin
          dst^ := src^;
          inc(src);
          inc(dst);
        end;
      end;

      bmp.DrawTo(bmp2,rec.Left,rec.Top);
      SimpleFill(bitmap, pts, $00000000, bmp2);
    finally
      bmp.Free;
      bmp2.Free;
    end;
    exit;
  end;

  with rec do
    rotPoint := FloatPoint((left+right)/2,(top+bottom)/2);
  rotatedPts := rotatePoints(pts, FixedPoint(rotPoint), -angle_radians);
  rec2 := GetBoundsRect(rotatedPts);
  rec3 := rec2;
  if rec3.Left > rec.Left then rec3.Left := rec.Left;
  if rec3.Top > rec.Top then rec3.Top := rec.Top;
  if rec3.Right < rec.Right then rec3.Right := rec.Right;
  if rec3.Bottom < rec.Bottom then rec3.Bottom := rec.Bottom;

  rec3_offset := Point(rec3.Left, rec3.Top);
  rec3_diff := Point(rec2.Left - rec3.Left, rec2.Top - rec3.Top);
  offsetRect(rec3, -rec3.Left, -rec3.Top);
  offsetPoint(rotPoint, -rec2.Left, -rec2.Top);
  offsetRect(rec2, -rec2.Left, -rec2.Top);

  bmp := TCnsBitmap32.Create;
  bmp2 := TCnsBitmap32.Create;
  try
    bmp.DrawMode := dmBlend;
    bmp.CombineMode := cmMerge;
    bmp.SetSize(rec2.right,rec2.bottom);
    bmp.SetStipple(colors);
    bmp.StippleStep := step;

    bmp2.DrawMode := dmOpaque;
    bmp2.SetSize(rec3.right,rec3.bottom);

    bmp.LineFSP(0, 0, bmp.Width, 0);
    for i := 1 to bmp.Height -1 do
    begin
      {$R-}
      src := @bmp.bits[0];
      dst := @bmp.bits[i*bmp.Width];
      {$R+}
      for j := 0 to bmp.Width -1 do
      begin
        dst^ := src^;
        inc(src);
        inc(dst);
      end;
    end;

    AT := TAffineTransformation.Create;
    try
      AT.SrcRect := FloatRect(rec2);
      AT.Rotate(rotPoint.X, rotPoint.Y, angle_degrees);
      AT.Translate(rec3_diff.X, rec3_diff.Y);
      DCM32_Transforms.Transform(bmp2, bmp, AT);
    finally
      AT.free;
    end;

    //bmp.SetSize(bitmap.Width, bitmap.Height);
    bmp.SetSize(rec3_offset.X+rec3.Right, rec3_offset.Y+rec3.Bottom);
    bmp2.DrawTo(bmp,rec3_offset.X,rec3_offset.Y);

    //finally fill the polygon ...
    SimpleFill(bitmap, pts, $00000000, bmp);
  finally
    bmp.Free;
    bmp2.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure SimpleRadialGradient(bitmap: TCnsBitmap32; const pt: TFixedPoint;
  radius: single; const colors: array of TColor32);
var
  i,j, colorLen: integer;
  dx,dy, dist, radiusPlus, radiusMinus: single;
  p: TFloatPoint;
  pts: TArrayOfFixedPoint;
  rec, unclippedRec: TRect;
  outerColor, c, M: TColor32;
  dst, dstQ1,dstQ2,dstQ3,dstQ4: PColor32;
begin
  colorLen := length(colors);
  if (radius < 1) or (colorLen = 0) then exit;
  if colorLen = 1 then
  begin
    //draw monochrome circle of specified radius then exit
    with FloatPoint(pt) do
      pts := GetEllipsePoints(FloatRect(X-radius,Y-radius,X+radius,Y+radius));
    SimpleFill(bitmap,pts,$0,colors[0]);
    exit;
  end;

  radiusPlus := radius + 0.5;
  radiusMinus := radius - 0.5;
  outerColor := colors[colorLen -1];

  p := FloatPoint(pt);
  with p do
  begin
    rec.Left := floor(X - radiusPlus);
    rec.Top := floor(Y - radiusPlus);
    rec.Right := ceil(X + radiusPlus);
    rec.Bottom := ceil(Y + radiusPlus);
  end;
  unclippedRec := rec;
  if rec.Left < 0 then rec.Left := 0;
  if rec.Right >= bitmap.Width then rec.Right := bitmap.Width -1;
  if rec.Top < 0 then rec.Top := 0;
  if rec.Bottom >= bitmap.Height then rec.Bottom := bitmap.Height -1;
  if (rec.Left >= rec.Right) or (rec.Top >= rec.Bottom) then exit;

  {$R-}
  if compareMem(@rec, @unclippedRec, sizeof(TRect)) then
  begin
    //If the bounding rectangle hasn't been clipped then we can speed things up
    //by calculating the color in only one quadrant ...
    for i := rec.Top to (rec.Top + rec.Bottom) div 2 do
    begin
      dstQ1 := @bitmap.bits[rec.Left + i*bitmap.width];
      dstQ2 := @bitmap.bits[rec.Right + i*bitmap.width];
      dstQ3 := @bitmap.bits[rec.Left + (rec.Bottom + rec.Top - i)*bitmap.width];
      dstQ4 := @bitmap.bits[rec.Right + (rec.Bottom + rec.Top - i)*bitmap.width];

      for j := rec.Left to (rec.Left + rec.Right) div 2 do
      begin
        dy := p.Y - i;
        dx := p.X - j;
        dist := hypot(dx, dy);
        if dist > radiusPlus then
          //do nothing
        else if dist > radiusMinus then
        begin
          M := round(255- (dist - radiusMinus)*255);
          BlendMemEx(outerColor, dstQ1^, M);
          if dstQ1 <> dstQ2 then BlendMemEx(outerColor, dstQ2^, M);
          if dstQ1 <> dstQ3 then BlendMemEx(outerColor, dstQ3^, M);
          if (dstQ3 <> dstQ4) and (dstQ2 <> dstQ4) then
            BlendMemEx(outerColor, dstQ4^, M);
          EMMS;
        end
        else
        begin
          c := GetColor(colors, dist/radius);
          BlendMem(c, dstQ1^);
          if dstQ1 <> dstQ2 then BlendMem(c, dstQ2^);
          if dstQ1 <> dstQ3 then BlendMem(c, dstQ3^);
          if (dstQ3 <> dstQ4) and (dstQ2 <> dstQ4) then BlendMem(c, dstQ4^);
          EMMS;
        end;
        inc(dstQ1); dec(dstQ2); inc(dstQ3); dec(dstQ4);
      end;
    end;
  end else
  begin
    for i := rec.Top to rec.Bottom do
    begin
      dst := @bitmap.bits[rec.Left + i*bitmap.width];
      for j := rec.Left to rec.Right do
      begin
        dy := p.Y - i;
        dx := p.X - j;
        dist := hypot(dx, dy);
        if dist > radiusPlus then
          //do nothing
        else if dist > radiusMinus then
        begin
          BlendMemEx(outerColor, dst^, round(255- (dist - radiusMinus)*255));
          EMMS;
        end
        else
        begin
          c := GetColor(colors, dist/radius);
          BlendMem(c, dst^);
          EMMS;
        end;
        inc(dst);
      end;
    end;
  end;
  {$R+}
end;
//------------------------------------------------------------------------------

procedure SimpleRadialGradient(bitmap: TCnsBitmap32; const rec: TFloatRect;
  const colors: array of TColor32);
var
  i,j,colorLen: integer;
  a, b, a2, r, rPlus, rMinus, theta: single;
  mp: TFloatPoint;
  pts: TArrayOfFixedPoint;
  rec2, unclippedRec: TRect;
  outerColor, c, M: TColor32;
  dst, dstQ1,dstQ2,dstQ3,dstQ4: PColor32;
begin
  colorLen := length(colors);
  if colorLen = 0 then exit;
  if colorLen = 1 then
  begin
    pts := GetEllipsePoints(rec);
    SimpleFill(bitmap, pts, $0, colors[0]);
    exit;
  end;

  with rec do
  begin
    if (right-left < 1) or (bottom-top < 1) then exit;
    mp := FloatPoint((right+left)/2, (top+bottom)/2);
    a := mp.X - left;
    b := mp.Y - top;
    if (a < 1) or (b < 1) then exit;
  end;
  rPlus := (a+1)/a;
  rMinus := (a-1)/a;

  rec2 := MakeRect(rec, rrOutside);
  unclippedRec := rec2;
  with rec2 do
  begin
    if (right-left = top-bottom) then
    begin
      //circular, so use the faster algorithm ...
      SimpleRadialGradient(bitmap, FixedPoint(mp), a, colors);
      exit;
    end;
    if Left < 0 then Left := 0;
    if Right >= bitmap.Width then Right := bitmap.Width -1;
    if Top < 0 then Top := 0;
    if Bottom >= bitmap.Height then Bottom := bitmap.Height -1;
    if (Left >= Right) or (Top >= Bottom) then exit;

    outerColor := colors[colorLen -1];
    {$R-}
    //If the bounding rectangle hasn't been clipped then we can speed things up
    //by calculating the color in only one quadrant ...
    if compareMem(@rec2, @unclippedRec, sizeof(TRect)) then
    begin
      for i := Top to (Top + Bottom) div 2 do
      begin
        dstQ1 := @bitmap.bits[Left + i*bitmap.width];
        dstQ2 := @bitmap.bits[Right + i*bitmap.width];
        dstQ3 := @bitmap.bits[Left + (Bottom + Top - i)*bitmap.width];
        dstQ4 := @bitmap.bits[Right + (Bottom + Top - i)*bitmap.width];
        for j := Left to (Left + Right) div 2 do
        begin
          if j = mp.X then
          begin
            r := (mp.Y -i)/b;
          end else
          begin
            //?= arctan2(a*y, b*x); a = x / cos?
            theta := arctan2(a*(mp.Y-i), b*(mp.X -j));
            a2 := (mp.X -j) / cos(theta);
            r := a2/a;
          end;

          if r > rPlus then
            //do nothing
          else if r > rMinus then //ie anti-alias the edge
          begin
            M := round(255- (r-RMinus)/(rPlus-rMinus)*255);
            BlendMemEx(outerColor, dstQ1^, M);
            if dstQ1 <> dstQ2 then BlendMemEx(outerColor, dstQ2^, M);
            if dstQ1 <> dstQ3 then BlendMemEx(outerColor, dstQ3^, M);
            if (dstQ3 <> dstQ4) and (dstQ2 <> dstQ4) then
              BlendMemEx(outerColor, dstQ4^, M);
            EMMS;
          end
          else
          begin
            c := GetColor(colors, r);
            BlendMem(c, dstQ1^);
            if dstQ1 <> dstQ2 then BlendMem(c, dstQ2^);
            if dstQ1 <> dstQ3 then BlendMem(c, dstQ3^);
            if (dstQ3 <> dstQ4) and (dstQ2 <> dstQ4) then BlendMem(c, dstQ4^);
            EMMS;
          end;
          inc(dstQ1); dec(dstQ2); inc(dstQ3); dec(dstQ4);
        end;
      end;
    end else
    begin
      for i := Top to Bottom do
      begin
        dst := @bitmap.bits[Left + i*bitmap.width];
        for j := Left to Right do
        begin
          if j = mp.X then continue;
          //?= arctan2(a*y, b*x); a = x / cos?
          theta := arctan2(a*(mp.Y-i), b*(mp.X -j));
          a2 := (mp.X -j) / cos(theta) /a;
          if a2 > rPlus then
            //do nothing
          else if a2 > rMinus then //ie anti-alias the edge
          begin
            M := round(255- (a2-RMinus)/(rPlus-rMinus)*255);
            BlendMemEx(outerColor, dst^, M);
            EMMS;
          end else
          begin
            c := GetColor(colors, a2);
            BlendMem(c, dst^);
            EMMS;
          end;
          inc(dst);
        end;
      end;
    end;
    {$R+}
  end;
end;
//------------------------------------------------------------------------------

procedure SimpleRadialFill(bitmap: TCnsBitmap32;
  const pts: array of TFixedPoint; const colors: array of TColor32);
var
  i,len: integer;
  polyPts: TArrayOfArrayOfFixedPoint;
begin
  len := length(pts);
  if len = 0 then exit;
  setLength(polyPts,1);
  setLength(polyPts[0],len);
  for i := 0 to len -1 do polyPts[0][i] := pts[i];
  SimpleRadialFill(bitmap, polyPts, colors);
end;
//------------------------------------------------------------------------------

procedure SimpleRadialFill(bitmap: TCnsBitmap32;
  const pts: TArrayOfArrayOfFixedPoint; const colors: array of TColor32); overload;
var
  i,j,len: integer;
  bmp: TCnsBitmap32;
  tmpRec, tmpRec2: TFixedRect;
  rec, clippedRec: TRect;
  mp: TFixedPoint;
  a, newA, tmpA, b, theta: single;
begin
  i := 0;
  len := length(pts);
  while (i < len) and (length(pts[i]) = 0) do inc(i);
  if i = len then exit;
  for j := i to len-1 do
  begin
    if length(pts[j]) = 0 then continue;
    if j = i then
      tmpRec := GetBoundsFixedRect(pts[j])
    else
    begin
      tmpRec2 := GetBoundsFixedRect(pts[j]);
      tmpRec := GetRectUnion(tmpRec2,tmpRec);
    end;
  end;
  rec := MakeRect(tmpRec,rrOutside);
  with rec do
  begin
    mp := FixedPoint((Left+Right)/2,(top+bottom)/2);
    a := (Right-Left)/2;
    b := (Bottom-Top)/2;
  end;

  //now see if rec needs enlarging ...
  newA := a;
  for i := 0 to len-1 do
    for j := 0 to high(pts[i]) do
    begin
      //?= arctan2(a*y, b*x); a = x / cos?
      if (mp.X = pts[i][j].X) or (mp.Y = pts[i][j].Y) then continue;
      theta := arctan2(a*(mp.Y-pts[i][j].Y) , b*(mp.X -pts[i][j].X));
      tmpA := abs((pts[i][j].X - mp.X)*FixedToFloat / cos(theta));
      if tmpA > newA then newA := tmpA;
    end;
  if round(newA) > a then
  begin
    b := b * newA/a; //scales 'b' relative to newA
    a := newA;
    with floatPoint(mp) do
    begin
      rec.Left := floor(X - a);
      rec.Top := floor(Y - b);
      rec.Right := ceil(X + a);
      rec.Bottom := ceil(Y + b);
    end;
  end;
  clippedRec := rec;
  if clippedRec.Left < 0 then clippedRec.Left := 0;
  if clippedRec.Top < 0 then clippedRec.Top := 0;
  if clippedRec.Right >= bitmap.Width then clippedRec.Right := bitmap.Width -1;
  if clippedRec.Bottom >= bitmap.Height then clippedRec.Bottom := bitmap.Height -1;

  bmp := TCnsBitmap32.Create;
  try
    bmp.Width := bitmap.Width;
    bmp.Height := bitmap.Height;
    bitmap.DrawTo(bmp, clippedRec, clippedRec);
    SimpleRadialGradient(bmp, FloatRect(rec), colors);
    SimpleFill(bitmap, pts, $0, bmp);
  finally
    bmp.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure SimpleShadow(bitmap: TCnsBitmap32; const pts: TArrayOfFixedPoint;
  dx, dy, decayRate: integer; shadowColor: TColor32; closed: boolean = false);
var
  i, len, maxD: integer;
  sx,sy, alpha, alphaLinear, alphaExp, dRate: single;
  p: TArrayOfFixedPoint;
begin
  len := length(pts);
  if ((dx = 0) and (dy = 0)) or (len = 0) then exit;
  p := copy(pts, 0, len);
  if abs(dy) > abs(dx) then
  begin
    maxD := abs(dy);
    sy := 1/maxD;
    sx := dx/(dy*maxD);
  end else
  begin
    maxD := abs(dx);
    sx := 1/maxD;
    sy := dy/(dx*maxD);
  end;
  if ((dx < 0) and (sx > 0)) or ((dx > 0) and (sx < 0)) then sx := - sx;
  if ((dy < 0) and (sy > 0)) or ((dy > 0) and (sy < 0)) then sy := - sy;

  if decayRate <= MAXIMUM_SHADOW_FADE then dRate := 0.05
  else if decayRate >= MINIMUM_SHADOW_FADE then dRate := 0.95
  else dRate := decayRate/10;
  alpha := AlphaComponent(shadowColor);
  alphaLinear := alpha*dRate/maxD;
  alphaExp := exp(ln(dRate)/maxD);
  for i := 1 to maxD do
  begin
    SimpleLine(bitmap,p,shadowColor,closed);
    alpha := alpha * alphaExp;
    if decayRate < NO_SHADOW_FADE then
      shadowColor := SetAlpha(shadowColor, round(alpha - i*alphaLinear));
    OffsetPoints(p, sx*maxD, sy*maxD);
  end;
end;
//------------------------------------------------------------------------------

procedure SimpleShadow(bitmap: TCnsBitmap32; const pts: TArrayOfArrayOfFixedPoint;
  dx, dy, decayRate: integer; shadowColor: TColor32; closed: boolean = false);
var
  i: integer;
begin
  for i := 0 to high(pts) do
    SimpleShadow(bitmap, pts[i], dx, dy, decayRate, shadowColor, closed);
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
  quadrant: TQuadrant;
  a,b: single;
begin
  //given ... x = a * cos? y = b * sin? y/x = tan? a / b = r
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

//BuildArc is for internal use for TLine32.Grow. (Otherwise use GetArcPoints.)
function BuildArc(const pt: TFloatPoint; a1, a2, r: TFloat): TArrayOfFixedPoint;
const
  MINSTEPS = 6;
var
  I, N: Integer;
  a, da, dx, dy: TFloat;
  Steps: Integer;
begin
  Steps := Max(MINSTEPS, Round(Sqrt(Abs(r)) * Abs(a2 - a1)));
  SetLength(Result, Steps);
  N := Steps - 1;
  da := (a2 - a1) / N;
  a := a1;
  for I := 0 to N do
  begin
    SinCos(a, r, dy, dx);
    Result[I].X := Fixed(pt.X + dx);
    Result[I].Y := Fixed(pt.Y + dy);
    a := a + da;
  end;
end;
//------------------------------------------------------------------------------

function MakeNormal(linePt1, linePt2: TFixedPoint): TFloatPoint;
var
  dx, dy, f: single;
begin
  dx := (linePt2.X - linePt1.X)*FixedToFloat;
  dy := (linePt2.Y - linePt1.Y)*FixedToFloat;

  if (dx = 0) and (dy = 0) then
  begin
    result := FloatPoint(0,0);
  end else
  begin
    f := 1 / Hypot(dx, dy);
    dx := dx * f;
    dy := dy * f;
  end;
  Result.X := dy;  //ie the perpendicular
  Result.Y := -dx; //   ...
end;
//------------------------------------------------------------------------------

//OutlineClosedPoints() is a simple routine used for drawing arrow heads that
//gets the outline of a 'closed' point array (and without bevelling etc)
function OutlineClosedPoints(const pts: array of TFixedPoint;
  lineWidth: single; PerimeterPointsOnly: boolean = false): TArrayOfFixedPoint;
var
  leftPoints, rightPoints: TArrayOfFixedPoint;
begin
  result := nil;
  //build leftPoints and rightPoints arrays ...
  with TGrow.Create(@leftPoints, @rightPoints) do
  try
    Grow(pts, lineWidth, jsMitered, 4, true);
  finally
    free;
  end;

  if PerimeterPointsOnly then
  begin
    if IsClockwiseDirection(leftPoints) then
      result := Copy(leftPoints, 0, length(leftPoints)) else
      result := Copy(rightPoints, 0, length(rightPoints));
  end else
  begin
    rightPoints := ReversePoints(rightPoints);
    setLength(result, length(leftPoints) + length(rightPoints));
    move(leftPoints[0], result[0], length(leftPoints)* sizeof(TFixedPoint));
    move(rightPoints[0], result[length(leftPoints)],
      length(rightPoints)* sizeof(TFixedPoint));
  end;
end;
//------------------------------------------------------------------------------

function SmoothChart(const chartPts: array of TFixedPoint; xStep: integer): TArrayOfFixedPoint;
var
  i, ptCnt, dx: integer;
  angle1, angle2: single;
begin
  result := nil;
  ptCnt := length(chartPts);
  if ptCnt < 2 then exit;

  dx := abs(xStep) div 2;

  setlength(result, ptCnt + (ptCnt - 1)*2);
  result[0] := chartPts[0];
  with FloatPoint(chartPts[0]) do result[1] := FixedPoint(X +dx, Y);
  for i := 1 to high(chartPts) -1 do
    if ((chartPts[i-1].Y <= chartPts[i].Y) and (chartPts[i+1].Y <= chartPts[i].Y)) or
      ((chartPts[i-1].Y >= chartPts[i].Y) and (chartPts[i+1].Y >= chartPts[i].Y)) then
    begin
      with FloatPoint(chartPts[i]) do result[i*3-1] := FixedPoint(X -dx, Y);
      result[i*3] := chartPts[i];
      with FloatPoint(chartPts[i]) do result[i*3+1] := FixedPoint(X +dx, Y);
    end else
    begin
      //not a peak or trough so get the average slope ...
      angle1 := GetAnglePt2FromPt1(chartPts[i-1],chartPts[i]);
      angle2 := GetAnglePt2FromPt1(chartPts[i],chartPts[i+1]);
      angle1 := (angle1 + angle2)/2;
      result[i*3-1] := GetPointAtAngleFromPoint(chartPts[i], dx, angle1 - pi);
      result[i*3] := chartPts[i];
      result[i*3+1] := GetPointAtAngleFromPoint(chartPts[i], dx, angle1);
    end;
  with FloatPoint(chartPts[ptCnt -1]) do result[high(result)-1] := FixedPoint(X -dx, Y);
  result[high(result)] := chartPts[ptCnt -1];
  result := GetCBezierPoints(result);
end;


//------------------------------------------------------------------------------
// TGrowBase methods ...
//------------------------------------------------------------------------------

procedure TGrowBase.Grow(const pts: array of TFixedPoint; lineWidth: single;
  joinStyle: TJoinStyle; miterLimit: single; isClosed: boolean);
var
  I, prevI, nextI, highI: cardinal;
  halfLW, RMin: single;
  P: TFloatPoint;
  normals: TArrayOfFloatPoint;
  normalA, normalB: TFloatPoint;
  firstLeftPt, firstRightPt: boolean;
  closedLeft, closedRight: TFixedPoint;

  //todo - better bevelling (ie bevelling up to miterlimit)

  procedure DoAddLeft(const pt: TFixedPoint);
  begin
    if firstLeftPt then
    begin
      firstLeftPt := false;
      closedLeft := pt;
    end;
    AddLeft(I, pt);
  end;

  procedure DoAddRight(const pt: TFixedPoint);
  begin
    if firstRightPt then
    begin
      firstRightPt := false;
      closedRight := pt;
    end;
    AddRight(I, pt);
  end;

  function GetPerpendicularPt(const pt: TFixedPoint;
     const normal: TFloatPoint; dist: single): TFixedPoint; overload;
  begin
    with FloatPoint(pt) do
      result := FixedPoint(X + normal.X * dist, Y + normal.Y * dist);
  end;

  function GetPerpendicularPt(const pt, normal:
    TFloatPoint; dist: single): TFixedPoint; overload;
  begin
    result := FixedPoint(pt.X + normal.X * dist, pt.Y + normal.Y * dist);
  end;

  function GetVectorPt(const pt: TFixedPoint;
     const normal: TFloatPoint; dist: single): TFixedPoint;
  begin
    //nb: undoes the 'normal' before applying dist to pt ...
    with FloatPoint(pt) do
      result := FixedPoint(X - normal.Y * dist, Y + normal.X * dist);
  end;

  procedure AddLeftMiter(const N1, N2: TFloatPoint; dist: single);
  var
    R, L1, L2: single;
    angleIsConcave: boolean;
    pt, NextP, PrevP: TFixedPoint;
  begin
    //(N1.X * N2.Y - N2.X * N1.Y) == unit normal "cross product" == sin(angle)
    //http://en.wikipedia.org/wiki/Cross_product
    //used here to find if an angle is greater than or less than 180?
    angleIsConcave := (N1.X * N2.Y - N2.X * N1.Y) * dist < 0;
    //(N1.X * N2.X + N1.Y * N2.Y) == unit normal "dot product" == cos(angle)
    //http://www.geocities.com/siliconvalley/2151/math2d.html
    //http://en.wikipedia.org/wiki/Dot_product
    //R = 1 + cos(angle). 0 <= R <= 2.
    //R --> 0 as angle --> -180?or as angle --> 180?
    R := 1 + (N1.X*N2.X + N1.Y*N2.Y);
    if angleIsConcave and (R <> 0) then
    begin
      //Sometimes an inner miter can 'pop out' between the lines constructing
      //the miter. This happens when the angle between those lines is narrow
      //and those lines are short relative to their widths. The code below tests
      //for and fixes proposed miter points that are further from the current
      //point than either of the adjacent points used to construct the miter ...
      NextP := GetPerpendicularPt(pts[NextI], normals[I], dist);
      PrevP := GetPerpendicularPt(pts[PrevI], normals[PrevI], dist);
      //it's a few less CPU cycles to get squared distances ...
      L1 := SquaredDistBetweenPoints(PrevP, pts[I]);
      L2 := SquaredDistBetweenPoints(NextP, pts[I]);
      R := dist / R;
      pt := FixedPoint(P.X + (N1.X+N2.X)*R, P.Y + (N1.Y+N2.Y)*R);
      R := SquaredDistBetweenPoints(pt, pts[I]);
      //This extra code better manages acutely angled miters so that an
      //outline of the line is more accurately drawn ...
      if (R > L1) and (L1 <= L2) then
      begin
        if (L1 = L2) then exit;
        //to get here the prior line is shorter than the following one so ...
        //using the length of the prior line (L1), find the point on the
        //following line that's L1 distant from the angle point, then from that
        //point find the point that's perpendicular ?linewidth (dist).
        L1 := DistBetweenPoints(pts[PrevI], pts[I]);
        pt := GetVectorPt(pts[I], N2, L1);
        DoAddLeft(GetPerpendicularPt(pt, N2, dist));
      end
      else if (R > L2) then
      begin
        L2 := DistBetweenPoints(pts[NextI], pts[I]);
        pt := GetVectorPt(pts[I], N1, -L2);
        DoAddLeft(GetPerpendicularPt(pt, N1, dist));
      end else
        DoAddLeft(pt);
    end
    else if (R < RMin) then
    begin
      DoAddLeft(GetPerpendicularPt(P, N1, dist));
      DoAddLeft(GetPerpendicularPt(P, N2, dist));
    end else
    begin
      R := dist / R;
      pt := FixedPoint(P.X + (N1.X+N2.X)*R, P.Y + (N1.Y+N2.Y)*R);
      DoAddLeft(pt);
    end;
  end;

  procedure AddRightMiter(const N1, N2: TFloatPoint; dist: single);
  var
    R, L1, L2: single;
    angleIsConcave: boolean;
    pt, NextP, PrevP: TFixedPoint;
  begin
    angleIsConcave := (N1.X * N2.Y - N2.X * N1.Y) * dist < 0;
    //R --> 0 as angle --> -180?and as angle --> 180?
    R := 1 + N1.X*N2.X + N1.Y*N2.Y;
    if angleIsConcave and (R <> 0) then
    begin
      NextP := GetPerpendicularPt(pts[NextI], normals[I], dist);
      PrevP := GetPerpendicularPt(pts[PrevI], normals[PrevI], dist);
      L1 := SquaredDistBetweenPoints(PrevP, pts[I]);
      L2 := SquaredDistBetweenPoints(NextP, pts[I]);
      R := dist / R;
      pt := FixedPoint(P.X + (N1.X+N2.X)*R, P.Y + (N1.Y+N2.Y)*R);
      R := SquaredDistBetweenPoints(pt, pts[I]);
      if (R > L1) and (L1 <= L2) then
      begin
        L1 := DistBetweenPoints(pts[PrevI], pts[I]);
        pt := GetVectorPt(pts[I], N2, L1);
        DoAddRight(GetPerpendicularPt(pt, N2, dist));
      end
      else if (R > L2) then
      begin
        L2 := DistBetweenPoints(pts[NextI], pts[I]);
        pt := GetVectorPt(pts[I], N1, -L2);
        DoAddRight(GetPerpendicularPt(pt, N1, dist));
      end else
        DoAddRight(pt);
    end
    else if (R < RMin) then
    begin
      DoAddRight(GetPerpendicularPt(P, N1, dist));
      DoAddRight(GetPerpendicularPt(P, N2, dist));
    end else
    begin
      R := dist / R;
      pt := FixedPoint(P.X + (N1.X+N2.X)*R, P.Y + (N1.Y+N2.Y)*R);
      DoAddRight(pt);
    end;
  end;

  procedure AddLeftBevel(const N1, N2: TFloatPoint; dist: single);
  var
    angleIsConcave: boolean;
  begin
    angleIsConcave := (N1.X * N2.Y - N2.X * N1.Y) * dist < 0;
    if not angleIsConcave then
    begin
      DoAddLeft(GetPerpendicularPt(P, N1, dist));
      DoAddLeft(GetPerpendicularPt(P, N2, dist));
    end
    else
      AddLeftMiter(N1, N2, dist);
  end;

  procedure AddRightBevel(const N1, N2: TFloatPoint; dist: single);
  var
    angleIsConcave: boolean;
  begin
    angleIsConcave := (N1.X * N2.Y - N2.X * N1.Y) * dist < 0;
    if not angleIsConcave then
    begin
      DoAddRight(GetPerpendicularPt(P, N1, dist));
      DoAddRight(GetPerpendicularPt(P, N2, dist));
    end
    else
      AddRightMiter(N1, N2, dist);
  end;

  procedure AddLeftRound(const N1, N2: TFloatPoint; dist: single);
  var
    angleIsConcave: boolean;
    a1, a2: TFloat;
    arc: TArrayOfFixedPoint;
    J: integer;
  begin
    angleIsConcave := (N1.X*N2.Y - N2.X*N1.Y) * dist < 0;
    if not angleIsConcave then
    begin
      a1 := ArcTan2(N1.Y, N1.X);
      a2 := ArcTan2(N2.Y, N2.X);
      if a2 = a1 then exit //ie parallel line
      else if a2 < a1 then a2 := a2 + ThreeSixty;
      arc := BuildArc(P, a1, a2, dist);
      for J := 0 to high(arc) do DoAddLeft(arc[J]);
    end else
      AddLeftMiter(N1, N2, dist);
  end;

  procedure AddRightRound(const N1, N2: TFloatPoint; dist: single);
  var
    angleIsConcave: boolean;
    a1, a2: TFloat;
    arc: TArrayOfFixedPoint;
    J: integer;
  begin
    angleIsConcave := (N1.X*N2.Y - N2.X*N1.Y) * dist < 0;
    if not angleIsConcave then
    begin
      a1 := ArcTan2(N1.Y, N1.X);
      a2 := ArcTan2(N2.Y, N2.X);
      if a2 = a1 then exit //ie parallel line
      else if a2 > a1 then a2 := a2 - ThreeSixty;
      arc := BuildArc(P, a1, a2, dist);
      for J := 0 to high(arc) do DoAddRight(arc[J]);
    end else
      AddRightMiter(N1, N2, dist);
  end;

begin
  if (length(pts) < 2) or (LineWidth < 1) then exit;

  OnStart;

  //for 'closed' lines we need to save the first points ...
  firstLeftPt := true;
  firstRightPt := true;

  halfLW := LineWidth/2;
  if miterLimit < 1 then
  begin
    miterLimit := 1;
    if joinStyle = jsMitered then joinStyle := jsBevelled;
  end;
  RMin := 2/sqr(miterLimit); //val == max relative distance of join pt from pt

  //make Normals ...
  highI := high(pts);
  if isClosed and DuplicatePoint(pts[0], pts[highI]) then dec(highI);
  setLength(normals, highI +1);
  for I := 0 to highI -1 do
    normals[I] := MakeNormal(pts[I],pts[I+1]);
  normals[highI] := MakeNormal(pts[highI],pts[0]);

  if isClosed then
    PrevI := HighI else
    PrevI := 0;

  for I := 0 to HighI do
  begin
    normalA := normals[PrevI];
    P := FloatPoint(pts[I]);

    if ((I = 0) or (I = highI)) and not isClosed then
    begin 
      DoAddLeft(GetPerpendicularPt(P, normalA, halfLW));
      DoAddRight(GetPerpendicularPt(P, normalA, -halfLW));
      continue;
    end;

    if i = highI then
      nextI := 0 else
      nextI := i+1;

    normalB := normals[I];
    case JoinStyle of
      jsBevelled:
        begin
          AddLeftBevel(normalA, normalB, halfLW);
          AddRightBevel(normalA, normalB, -halfLW);
        end;
      jsMitered:
        begin
          AddLeftMiter(normalA, normalB, halfLW);
          AddRightMiter(normalA, normalB, -halfLW);
        end;
      jsRounded:
        begin
          AddLeftRound(normalA, normalB, halfLW);
          AddRightRound(normalA, normalB, -halfLW);
        end;
    end;
    PrevI := I;
  end;

  if isClosed then
  begin
      DoAddLeft(closedLeft);
      DoAddRight(closedRight);
  end;

  OnFinish;
end;
//------------------------------------------------------------------------------

procedure TGrowBase.OnStart;
begin
end;
//------------------------------------------------------------------------------

procedure TGrowBase.OnFinish;
begin
end;


//------------------------------------------------------------------------------
// TGrow methods ...
//------------------------------------------------------------------------------

constructor TGrow.Create(LeftPts, RightPts: PArrayOfFixedPoint);
begin
  inherited Create;
  fLeftPts := LeftPts;
  fRightPts := RightPts;
  buffSizeIncrement := 128;
  //this allows TGrow to append to LeftPts & RightPts ...
  leftLen := length(fLeftPts^);
  leftBuffLen := leftLen;
  rightLen := Length(fRightPts^);
  rightBuffLen := rightLen;
end;
//------------------------------------------------------------------------------

procedure TGrow.AddLeft(idx: integer; const pt: TFixedPoint);
begin
  if leftLen >= leftBuffLen then
  begin
    inc(leftBuffLen, buffSizeIncrement);
    setLength(fLeftPts^, leftBuffLen);
  end;
  fLeftPts^[leftLen] := pt;
  inc(leftLen);
end;
//------------------------------------------------------------------------------

procedure TGrow.AddRight(idx: integer; const pt: TFixedPoint);
begin
  if rightLen >= rightBuffLen then
  begin
    inc(rightBuffLen, buffSizeIncrement);
    setLength(fRightPts^, rightBuffLen);
  end;
  fRightPts^[rightLen] := pt;
  inc(rightLen);
end;
//------------------------------------------------------------------------------

procedure TGrow.OnFinish;
begin
  //trim excess buffers ...
  setLength(fLeftPts^, leftLen);
  setLength(fRightPts^, rightLen);
end;

//------------------------------------------------------------------------------
// TStippledGrow methods ...
//------------------------------------------------------------------------------

constructor TStippledGrow.Create(LeftPts, RightPts: PArrayOfFixedPoint);
begin
  inherited;
  fList := TList.Create;
end;
//------------------------------------------------------------------------------

destructor TStippledGrow.Destroy;
begin
  inherited;
  Clear;
  fList.free;
end;
//------------------------------------------------------------------------------

procedure TStippledGrow.Clear;
var
  i: integer;
begin
  for i := 0 to fList.Count -1 do Dispose(PStippleItem(fList[i]));
  fList.clear;
end;
//------------------------------------------------------------------------------

function TStippledGrow.Count: integer;
begin
  result := fList.Count;
end;
//------------------------------------------------------------------------------

function TStippledGrow.GetItem(index: integer): PStippleItem;
begin
  if (index < 0) or (index >= fList.Count) then
    raise Exception.Create('TStippledGrow.GetItem range error');
  result := PStippleItem(fList[index]);
end;
//------------------------------------------------------------------------------

procedure TStippledGrow.AddLeft(idx: integer; const pt: TFixedPoint);
var
  len: integer;
  stippleItem: PStippleItem;
begin
  inherited;
  if idx <> fCurrentIndex then
  begin
    fCurrentIndex := idx;
    New(stippleItem);
    fList.Add(stippleItem);
  end else
    stippleItem := PStippleItem(fList[fList.count -1]);
  len := length(stippleItem.left);
  setLength(stippleItem.left, len+1);
  stippleItem.left[len] := pt;
end;
//------------------------------------------------------------------------------

procedure TStippledGrow.AddRight(idx: integer; const pt: TFixedPoint);
var
  len: integer;
  stippleItem: PStippleItem;
begin
  inherited;
  if idx <> fCurrentIndex then
  begin
    fCurrentIndex := idx;
    New(stippleItem);
    fList.Add(stippleItem);
  end else
    stippleItem := PStippleItem(fList[fList.count -1]);
  len := length(stippleItem.right);
  setLength(stippleItem.right, len+1);
  stippleItem.right[len] := pt;
end;
//------------------------------------------------------------------------------

procedure TStippledGrow.OnStart;
begin
  fCurrentIndex := -1;
  Clear;
end;

//------------------------------------------------------------------------------
// TPolygon32Ex methods ...
//------------------------------------------------------------------------------

{$IFDEF Use_GR32_PolygonsEx}

constructor TPolygon32Ex.Create;
begin
  inherited;
  fClosed := true;
  Newline;
end;
//------------------------------------------------------------------------------

procedure TPolygon32Ex.Clear;
begin
  fPPts := nil;
  NewLine;
end;
//------------------------------------------------------------------------------

procedure TPolygon32Ex.Newline;
begin
  SetLength(fPPts, Length(fPPts) + 1);
end;
//------------------------------------------------------------------------------

procedure TPolygon32Ex.AddPoints(var First: TFixedPoint; Count: Integer);
var
  H, L, I: Integer;
begin
  H := High(fPPts);
  if H < 0 then
  begin
    setLength(fPPts, 1);
    H := 0;
  end;
  L := Length(fPPts[H]);
  SetLength(fPPts[H], L + Count);
  {$R-}
  for I := 0 to Count - 1 do
    fPPts[H, L + I] := PFixedPointArray(@First)[I];
  {$R+}
end;
//------------------------------------------------------------------------------

procedure TPolygon32Ex.Draw(Bitmap: TCnsBitmap32; OutlineColor, FillColor: TColor32);
var
  tmp: TArrayOfArrayOfFloatPoint;
begin
  tmp := AAFixedToAAFloat(fPPts);
  PolyPolygonFS(Bitmap, tmp, FillColor, fFillMode);
  if (OutlineColor and $FF000000) <> 0 then
    PolyPolylineXS(Bitmap, fPPts, OutlineColor, true);
end;
//------------------------------------------------------------------------------

procedure TPolygon32Ex.Draw(Bitmap: TCnsBitmap32; OutlineColor: TColor32;
  Filler: TCustomPolygonFiller);
var
  tmp: TArrayOfArrayOfFloatPoint;
begin
  tmp := AAFixedToAAFloat(fPPts);
  PolyPolygonFS(Bitmap, tmp, Filler, fFillMode);
  if (OutlineColor and $FF000000) <> 0 then
    PolyPolylineXS(Bitmap, fPPts, OutlineColor, true);
end;
//------------------------------------------------------------------------------

procedure TPolygon32Ex.DrawFill(Bitmap: TCnsBitmap32; Color: TColor32);
var
  tmp: TArrayOfArrayOfFloatPoint;
begin
  tmp := AAFixedToAAFloat(fPPts);
  PolyPolygonFS(Bitmap, tmp, Color, fFillMode);
end;
//------------------------------------------------------------------------------

procedure TPolygon32Ex.DrawFill(Bitmap: TCnsBitmap32; Filler: TCustomPolygonFiller);
var
  tmp: TArrayOfArrayOfFloatPoint;
begin
  tmp := AAFixedToAAFloat(fPPts);
  PolyPolygonFS(Bitmap, tmp, Filler, fFillMode);
end;
//------------------------------------------------------------------------------

procedure TPolygon32Ex.DrawEdge(Bitmap: TCnsBitmap32; Color: TColor32);
begin
  Bitmap.BeginUpdate;
  PolyPolylineXS(Bitmap, fPPts, Color, true);
  Bitmap.EndUpdate;
  Bitmap.Changed;
end;
{$ENDIF}

//------------------------------------------------------------------------------
// TArrowPen methods ...
//------------------------------------------------------------------------------

constructor TArrowPen.Create(owner: TArrowHead);
begin
  fOwnerArrowHead := owner;
  fColor := clBlack32;
  fWidth  := 1;
end;
//------------------------------------------------------------------------------

procedure TArrowPen.SetWidth(value: single);
begin
  Constrain(value, 1, 10);
  if value = fWidth then exit;
  fWidth := value;
  fOwnerArrowHead.fOwnerLine32.ForceRebuild;
end;

//------------------------------------------------------------------------------
// TArrowHead methods ...
//------------------------------------------------------------------------------

constructor TArrowHead.Create(owner: TLine32; IsStartArrow: boolean);
begin
  fOwnerLine32 := owner;
  fIsStartArrow := IsStartArrow;
  fStyle := asNone;
  fSize := 12;
  fColor := clWhite32;
  fPen := TArrowPen.Create(self);
end;
//------------------------------------------------------------------------------

destructor TArrowHead.Destroy;
begin
  fPen.Free;
  inherited;
end;
//------------------------------------------------------------------------------

procedure TArrowHead.SetSize(value: single);
begin
  Constrain(value, 1, 50);
  if value = fSize then exit;
  fSize := value;
  fOwnerLine32.ForceRebuild;
end;
//------------------------------------------------------------------------------

procedure TArrowHead.SetStyle(value: TArrowHeadStyle);
begin
  if (value = fStyle) then exit;
  fStyle := value;
  fOwnerLine32.ForceRebuild;
end;
//------------------------------------------------------------------------------

procedure TArrowHead.SetCustomProc(value: TCustomArrowHeadProc);
begin
  fCustomProc := value;
  if not assigned(value) and (fStyle = asCustom) then fStyle := asNone;
  fOwnerLine32.ForceRebuild;
end;
//------------------------------------------------------------------------------

function TArrowHead.IsNeeded: boolean;
begin
  with fOwnerLine32 do
    result := ((length(fLinePoints) >= 2) and (fEndStyle <> esClosed)) and
    ((Style in [asThreePoint,asFourPoint,asSquare,asDiamond,asCircle]) or
    ((Style = asCustom) and assigned(fCustomProc)));
  if not result then SetLength(fPoints, 0);
end;
//------------------------------------------------------------------------------

//GetArrowHeadPoints: used by TArrowHead.GetPoints to draw specific arrow head styles
function GetArrowHeadPoints(tipPt, tailPt: TFixedPoint; HeadSize, PenWidth: single;
  ArrowHeadStyle: TArrowHeadStyle): TArrayOfFixedPoint;
var
  angle, d: single;
  floatPt: TFloatPoint;
  fr: TFloatRect;
const
  CosThirty    = 0.86602540;
  TanSixty     = 1.73205081;
begin
  result := nil;
  angle := GetAnglePt2FromPt1(tipPt,tailPt); //angle to tail
  case ArrowHeadStyle of
    asThreePoint:
      begin
        setLength(result,3);
        d := HeadSize/TanSixty;
        result[0] := GetPointAtAngleFromPoint(tailPt, d, angle + Ninety);
        result[1] := tipPt;
        result[2] := GetPointAtAngleFromPoint(tailPt, d, angle - Ninety);
      end;
    asFourPoint:
      begin
        setLength(result,4);
        d := HeadSize/TanSixty;
        result[0] := tailPt;
        result[1] := GetPointAtAngleFromPoint(tailPt, d, angle + Sixty);
        result[2] := tipPt;
        result[3] := GetPointAtAngleFromPoint(tailPt, d, angle - Sixty);
      end;
    asDiamond:
      begin
        setLength(result,5);
        d := (HeadSize/2)/CosThirty;
        result[0] := GetPointAtAngleFromPoint(tailPt, (PenWidth-1)/2, angle - Ninety);
        result[1] := GetPointAtAngleFromPoint(tailPt, d, angle - OneEighty + Thirty);
        result[2] := tipPt;
        result[3] := GetPointAtAngleFromPoint(tailPt, d, angle - OneEighty - Thirty);
        result[4] := GetPointAtAngleFromPoint(tailPt, (PenWidth-1)/2, angle + Ninety);
      end;
    asSquare:
      begin
        setLength(result,4);
        floatPt := FloatPoint(MidPoint(tipPt,tailPt));
        d := HeadSize/2;
        result[0] := FixedPoint(floatPt.X-d, floatPt.Y-d) ;
        result[1] := FixedPoint(floatPt.X+d, floatPt.Y-d) ;
        result[2] := FixedPoint(floatPt.X+d, floatPt.Y+d) ;
        result[3] := FixedPoint(floatPt.X-d, floatPt.Y+d) ;
      end;
    asCircle:
      begin
        d := HeadSize/2;
        with FloatPoint(MidPoint(tipPt,tailPt)) do
          fr := FloatRect(X-d,Y-d,X+d,Y+d);
        result := GetEllipsePoints(fr);
      end;
  end;
end;
//------------------------------------------------------------------------------

procedure TArrowHead.GetPoints;
begin
  if not IsNeeded then exit;
  case Style of
    asThreePoint, asFourPoint, asSquare, asDiamond, asCircle:
      fPoints := GetArrowHeadPoints(fTipPoint, fBasePoint,
        Size, fOwnerLine32.fLineWidth, Style);
    asCustom:
      if assigned(CustomProc) then
        fPoints := CustomProc(fTipPoint, fBasePoint,
          Size, fOwnerLine32.fLineWidth, Style);
  end;
end;
//------------------------------------------------------------------------------

function TArrowHead.Points: TArrayOfFixedPoint;
begin
  if not assigned(fOwnerLine32.fLeftPoints) then SetLength(fPoints, 0)
  else result := fPoints;
end;
//------------------------------------------------------------------------------

function TArrowHead.OutlinePoints: TArrayOfFixedPoint;
begin
  if length(fPoints) > 0 then
    result := OutlineClosedPoints(fPoints,pen.fWidth,true);
end;
//------------------------------------------------------------------------------

procedure TArrowHead.Draw(bitmap: TCnsBitmap32);
var
  pts: TArrayOfFixedPoint;
begin
  if (Style = asNone) or (Size < 4) or
    (length(fPoints) = 0) or not assigned(bitmap) then exit;

  with fOwnerLine32.fPolygon32 do
  begin
    Clear;
    AddPoints(fPoints[0],length(fPoints));
    FillMode := pfWinding;
    DrawFill(bitmap, Color);
    if Pen.fWidth < SingleLineLimit then
      DrawEdge(bitmap, Pen.Color)
    else
    begin
      pts := OutlineClosedPoints(fPoints, Pen.fWidth);
      Clear;
      if pts = nil then exit;
      AddPoints(pts[0],length(pts));
      DrawFill(bitmap, Pen.Color);
    end;
  end;
end;

//------------------------------------------------------------------------------
// TLine32 methods ...
//------------------------------------------------------------------------------

constructor TLine32.Create;
begin
  FillMode := pfWinding;

  fPolygon32 := {$IFDEF Use_GR32_PolygonsEx} TPolygon32Ex. {$ELSE} TPolygon32. {$ENDIF} Create;
  fPolygon32.Closed := true;
  fPolygon32.Antialiased := true;
  fPolygon32.AntialiasMode := am16times;

  fLineWidth := 1;
  fMiterLimit := 2;
  EndStyle := esButt;
  fJoinStyle := jsBevelled;

  fStartArrow := TArrowHead.Create(self, true);
  fEndArrow := TArrowHead.Create(self, false);
end;
//------------------------------------------------------------------------------

destructor TLine32.Destroy;
begin
  Clear;
  fStartArrow.Free;
  fEndArrow.Free;
  fPolygon32.Free;
end;
//------------------------------------------------------------------------------

{$IFNDEF Use_GR32_PolygonsEx}
function TLine32.GetAntialiasMode: TAntialiasMode;
begin
  result := fPolygon32.AntialiasMode;
end;
//------------------------------------------------------------------------------

procedure TLine32.SetAntialiasMode(aaMode: TAntialiasMode);
begin
  fPolygon32.AntialiasMode := aaMode;
end;
//------------------------------------------------------------------------------
{$ENDIF}

procedure TLine32.ForceRebuild;
begin
  fLeftPoints := nil;
  fRightPoints := nil;
end;
//------------------------------------------------------------------------------

procedure TLine32.Clear;
begin
  fLinePoints := nil;
  fLeftPoints := nil;
  fRightPoints := nil;
end;
//------------------------------------------------------------------------------

procedure TLine32.SetPoints(const pts: array of TFixedPoint);
var
  i, cnt: integer;
begin
  Clear;
  cnt := 0;
  setLength(fLinePoints, length(pts));
  for i := 0 to High(pts) do
  begin
    //ignore duplicate points which otherwise can create artefacts ...
    if (cnt > 0) and DuplicatePoint(pts[i], fLinePoints[cnt-1]) then continue;
    fLinePoints[cnt] := pts[i];
    inc(cnt);
  end;
  setLength(fLinePoints, cnt);
end;
//------------------------------------------------------------------------------

function TLine32.AddPoints(const newPts: array of TFixedPoint;
  ToEnd: boolean = true): cardinal;
var
  i, bottom, top, len, cnt, cnt2: integer;
  pt: TFixedPoint;
begin
  len := length(fLinePoints);
  if len = 0 then
  begin
    SetPoints(newPts);
    result := length(fLinePoints);
    exit;
  end;

  result := 0;
  bottom := 0;
  top := high(NewPts);
  ForceRebuild;

  //skip any adjacent duplicates ...
  if ToEnd then
  begin
    Pt := fLinePoints[len -1];
    while (bottom <= top) and DuplicatePoint(newPts[bottom], Pt) do inc(bottom);
    if bottom > top then exit;
    setLength(fLinePoints, len + top - bottom +1);
    cnt := len;
    for i := bottom to top do
      if DuplicatePoint(newPts[i], fLinePoints[cnt-1]) then
        continue
      else
      begin
        fLinePoints[cnt] := newPts[i];
        inc(cnt);
      end;
      setLength(fLinePoints, cnt);
  end else
  begin
    Pt := fLinePoints[0];
    while (top >= bottom) and DuplicatePoint(newPts[top], Pt) do dec(top);
    if bottom > top then exit;
    cnt := top - bottom +1;
    setLength(fLinePoints, len + cnt);
    //make room for the new points at the beginning of the array ...
    move(fLinePoints[0],fLinePoints[cnt], len * sizeof(TFixedPoint));
    //now add the new points ...
    cnt2 := 0;
    for i := bottom to top do
      if (cnt2 > 0) and DuplicatePoint(newPts[i], fLinePoints[cnt2 -1]) then
      begin
        continue;
      end else
      begin
        fLinePoints[cnt] := newPts[i];
        inc(cnt);
      end;
      if cnt2 < cnt then
      begin
        move(fLinePoints[cnt], fLinePoints[cnt2], len * sizeof(TFixedPoint));
        setLength(fLinePoints, length(fLinePoints) - (cnt - cnt2));
      end;
  end;
end;
//------------------------------------------------------------------------------

function TLine32.AddPoints(var startPt: TFixedPoint; count: integer;
  ToEnd: boolean = true): cardinal;
var
  i: integer;
  newPts: array of TFixedPoint;
begin
  result := 0;
  if count <= 0 then exit;
  setlength(newPts, count);
  {$R-}
  for i := 0 to count - 1 do
    newPts[i] := PFixedPointArray(@startPt)[i];
  result := AddPoints(newPts, ToEnd);
  {$R+}
  ForceRebuild;
end;
//------------------------------------------------------------------------------

procedure TLine32.DeletePoints(count: integer; FromEnd: boolean = true);
var
  len: integer;
begin
  len := length(fLinePoints);
  if count >= len then
  begin
    clear;
    exit;
  end;

  ForceRebuild;
  if not FromEnd then
    move(fLinePoints[count], fLinePoints[0], (len - count) * sizeof(TFixedPoint));
  setLength(fLinePoints, len - count);
end;
//------------------------------------------------------------------------------

function TLine32.GetBoundsRect(penWidth: single = 0): TRect;
begin
  result := FixedRectToRect(GetBoundsFixedRect(penWidth));
end;
//------------------------------------------------------------------------------

function TLine32.GetBoundsFixedRect(penWidth: single = 0): TFixedRect;
var
  fpa: TArrayOfFixedPoint;
begin
  fpa := GetOuterEdge(penWidth);
  result := dcm32_misc.GetBoundsFixedRect(fpa);
end;
//------------------------------------------------------------------------------

procedure TLine32.Translate(dx,dy: TFloat);
var
  i: integer;
  delta: TFixedPoint;
begin
  ForceRebuild;
  delta := FixedPoint(dx,dy);
  for i := 0 to high(fLinePoints) do
    with fLinePoints[i] do
    begin
      X := X + delta.X;
      Y := Y + delta.Y;
    end;
end;
//------------------------------------------------------------------------------

procedure TLine32.Scale(dx,dy: TFloat);
var
  i: integer;
begin
  ForceRebuild;
  for i := 0 to high(fLinePoints) do
    with fLinePoints[i] do
    begin
      X := round(X * dx);
      Y := round(Y * dy);
    end;
end;
//------------------------------------------------------------------------------

procedure TLine32.Rotate(origin: TFloatPoint; radians: single);
var
  i: integer;
  orig, tmp: TFixedPoint;
  cosAng, sinAng: single;
begin
  ForceRebuild;
  //rotates in an anticlockwise direction if radians > 0;
  DCM32.sincos(radians, sinAng, cosAng);
  orig := FixedPoint(origin);
  for i := 0 to high(fLinePoints) do
    with fLinePoints[i] do
    begin
      tmp.X := X - orig.X;
      tmp.Y := Y - orig.Y;
      X := round((tmp.X * cosAng) + (tmp.Y * sinAng) + orig.X);
      Y := round((tmp.Y * cosAng) - (tmp.X * sinAng) + orig.Y);
    end;
end;
//------------------------------------------------------------------------------

procedure TLine32.Transform(matrix : TFloatMatrix);
var
  i : integer;
  mx, my : single;
begin
  ForceRebuild;
  for i := 0 to high(fLinePoints) do
    with fLinePoints[i] do
    begin
      mx := X *FixedToFloat;
      my := Y *FixedToFloat;
      X := round((mx*matrix[0,0] + my*matrix[1,0] + matrix[2,0])*FixedOne);
      Y := round((mx*matrix[0,1] + my*matrix[1,1] + matrix[2,1])*FixedOne);
    end;
end;
//------------------------------------------------------------------------------

procedure TLine32.AdjustEndsForArrows;
var
  startIdx, endIdx: integer;
  totalDist, cumulativeDist: single;
begin
  startIdx := 0;
  endIdx := high(fLinePoints);
  if endIdx < 1 then exit;

  fStartArrow.fTipPoint := fLinePoints[0];
  fStartArrow.fBasePoint := fLinePoints[0];
  if fStartArrow.IsNeeded then
  begin
    //temporarily adjust the start Pt to avoid the line crossing
    //under a semi-transparent arrow ...
    cumulativeDist := 0;
    totalDist := fStartArrow.Size + fStartArrow.Pen.Width;
    while (startIdx < endIdx -1) do
    begin
      cumulativeDist := cumulativeDist +
        DistBetweenPoints(fLinePoints[startIdx], fLinePoints[startIdx+1]);
      if cumulativeDist > totalDist then break;
      inc(startIdx);
    end;
    fStartArrow.fBasePoint :=
      GetPointAtAngleFromPoint(
        fStartArrow.fTipPoint, totalDist,
        GetAnglePt2FromPt1(fStartArrow.fTipPoint, fLinePoints[startIdx+1]));
    fStartArrow.GetPoints;
  end;

  fStartArrow.fBaseIdx := startIdx;
  fStartArrow.fOldBase := fLinePoints[startIdx];
  fLinePoints[startIdx] := fStartArrow.fBasePoint;

  fEndArrow.fTipPoint := fLinePoints[endIdx];
  fEndArrow.fBasePoint := fLinePoints[endIdx];
  if fEndArrow.IsNeeded then
  begin
    //temporarily adjust the end Pt to avoid the line crossing
    //under a semi-transparent arrow ...
    cumulativeDist := 0;
    totalDist := fEndArrow.Size +fEndArrow.Pen.Width;
    while (endIdx > 1) do
    begin
      cumulativeDist := cumulativeDist +
        DistBetweenPoints(fLinePoints[endIdx], fLinePoints[endIdx-1]);
      if cumulativeDist > totalDist then break;
      dec(endIdx);
    end;
    fEndArrow.fBasePoint :=
      GetPointAtAngleFromPoint(
        fEndArrow.fTipPoint, totalDist,
        GetAnglePt2FromPt1(fEndArrow.fTipPoint, fLinePoints[endIdx-1]));
    fEndArrow.GetPoints;
  end;

  fEndArrow.fBaseIdx := endIdx;
  fEndArrow.fOldBase := fLinePoints[endIdx];
  fLinePoints[endIdx] := fEndArrow.fBasePoint;
end;
//------------------------------------------------------------------------------

procedure TLine32.DrawArrows(bitmap: TCnsBitmap32);
begin
  if (fStartArrow.Style <> asNone) then fStartArrow.Draw(bitmap);
  if (fEndArrow.Style <> asNone) then fEndArrow.Draw(bitmap);
end;
//------------------------------------------------------------------------------

procedure TLine32.Draw(bitmap: TCnsBitmap32; penWidth: single;
  color: TColor32; edgeColor: TColor32 = $00000000);
var
  pts: TArrayOfFixedPoint;
begin
  if not assigned(bitmap) or (length(fLinePoints) < 2) then exit;

  pts := GetOutline(penWidth);
  if length(pts) = 0 then exit;
  fPolygon32.Clear;
  fPolygon32.AddPoints(pts[0],length(pts));
  fPolygon32.FillMode := self.FillMode;
  fPolygon32.DrawFill(bitmap, color);

  if AlphaComponent(edgeColor) <> $0 then
  begin
    if EndStyle = esClosed then
    begin
      SimpleLine(bitmap, fRightPoints, edgeColor, true);
      SimpleLine(bitmap, fLeftPoints, edgeColor, true);
    end
    else
      fPolygon32.DrawEdge(bitmap,edgeColor);
  end;
  DrawArrows(bitmap);
end;
//------------------------------------------------------------------------------

procedure TLine32.Draw(bitmap: TCnsBitmap32; penWidth: single;
  pattern: TCnsBitmap32; edgeColor: TColor32 = $00000000);
var
  filler: TBitmapPolygonFiller;
  pts: TArrayOfFixedPoint;
begin
  if not assigned(bitmap) or not assigned(pattern) or (length(fLinePoints) < 2) then exit;

  filler := TBitmapPolygonFiller.Create;
  try
    filler.Pattern := pattern;
    fPolygon32.Clear;
    pts := GetOutline(penWidth);
    if length(pts) = 0 then exit;
    fPolygon32.AddPoints(pts[0],length(pts));
    fPolygon32.FillMode := self.FillMode;
    fPolygon32.DrawFill(bitmap,filler);
  finally
    filler.Free;
  end;

  if AlphaComponent(edgeColor) <> $0 then
  begin
    if EndStyle = esClosed then
    begin
      SimpleLine(bitmap, GetRightPoints, edgeColor, true);
      SimpleLine(bitmap, GetLeftPoints, edgeColor, true);
    end
    else
      fPolygon32.DrawEdge(bitmap,edgeColor);
  end;
  DrawArrows(bitmap);
end;
//------------------------------------------------------------------------------

procedure TLine32.Draw(bitmap: TCnsBitmap32; penWidth: single;
  filler: TCustomPolygonFiller; edgeColor: TColor32 = $00000000);
var
  pts: TArrayOfFixedPoint;
begin
  if not assigned(bitmap) or not assigned(filler) or (length(fLinePoints) < 2) then exit;
  fPolygon32.Clear;
  pts := GetOutline(penWidth);
  if length(pts) = 0 then exit;
  fPolygon32.AddPoints(pts[0],length(pts));
  fPolygon32.FillMode := self.FillMode;
  fPolygon32.DrawFill(bitmap, filler);

  if AlphaComponent(edgeColor) <> $0 then
  begin
    if EndStyle = esClosed then
    begin
      SimpleLine(bitmap, GetRightPoints, edgeColor, true);
      SimpleLine(bitmap, GetLeftPoints, edgeColor, true);
    end
    else
      fPolygon32.DrawEdge(bitmap, edgeColor);
  end;
  DrawArrows(bitmap);
end;
//------------------------------------------------------------------------------

procedure TLine32.Draw(bitmap: TCnsBitmap32; penWidth: single; colors: array of TColor32);
begin
  Draw(bitmap, penWidth, colors, -2); //nb: StippleStep < -1 ==> use current stipplestep
end;
//------------------------------------------------------------------------------

procedure TLine32.Draw(bitmap: TCnsBitmap32; penWidth: single;
  colors: array of TColor32; StippleStep: single);
var
  tmpPts: TArrayOfFixedPoint;
  pts: TArrayOfFixedPoint;
  I, J, linesCounter, linesSubCounter: integer;
  stippleColor: TColor32;
  stipCntr, stipOffX, stipOffY: single;
  tl, tr, bl, br, tmpBR: TFixedPoint;
  endPt: TFixedPoint;
  roundEndPts: TArrayOfFixedPoint;
  angle, SavedStippleStep: single;

  procedure StippleFill(topLeft, topRight, bottomLeft, bottomRight: TFixedPoint;
    count: integer; stipOffsetX, stipOffsetY: single);
  var
    j: integer;
    dx1,dy1,dx2,dy2: single;
    lineangle, sinAng, cosAng, stipOffset: single;
  begin
    if (count < 1) then exit;
    lineAngle := GetAnglePt2FromPt1(topLeft, topRight);
    DCM32.SinCos(lineAngle, sinAng, cosAng);
    stipCntr := stipCntr +
      (stipOffsetX*cosAng-stipOffsetY*sinAng)*FixedToFloat*bitmap.StippleStep;

    dx1 := (bottomLeft.X - topLeft.X)/count;
    dy1 := (bottomLeft.Y - topLeft.Y)/count;
    dx2 := (bottomRight.X - topRight.X)/count;
    dy2 := (bottomRight.Y - topRight.Y)/count;
    stipOffset := (dy1*sinAng - dx1*cosAng)*FixedToFloat*bitmap.StippleStep;

    //draw multiple parallel stippled lines to fill out a line segment ...
    for j := 0 to count-1 do
    begin
      bitmap.StippleCounter := stipCntr - (j* stipOffset);
      bitmap.MoveToX(Round(topLeft.X + (j*dx1)),
        Round(topLeft.Y + (j*dy1)));
      bitmap.LineToXSP(Round(topRight.X + (j*dx2)),
        Round(topRight.Y + (j*dy2)));
    end;
  end;

begin
  if not assigned(bitmap) or (length(fLinePoints) < 2) then exit;
  if penWidth > 0 then SetWidth(penWidth);

  bitmap.SetStipple(colors);
  SavedStippleStep := bitmap.StippleStep;
  //constrain: -1 <= StippleStep <= 1; for values < -1 use current StippleStep
  if StippleStep >= -1.0 then
  begin
    if StippleStep > 1 then StippleStep := 1;
    bitmap.StippleStep := StippleStep;
  end;
  linesCounter := round(fLineWidth);
  stippleColor := bitmap.GetStippleColor; //used for round end caps

  AdjustEndsForArrows;
  try
    if (fStartArrow.fBaseIdx > 0) or (fEndArrow.fBaseIdx < high(fLinePoints)) then
    begin
      tmpPts := Copy(fLinePoints, fStartArrow.fBaseIdx,
        fEndArrow.fBaseIdx - fStartArrow.fBaseIdx +1);
      pts := tmpPts;
    end else
      pts := fLinePoints;

    with TStippledGrow.create(@fLeftPoints, @fRightPoints) do
    try
      Grow(pts, fLineWidth, jsBevelled, MiterLimit, EndStyle = esClosed);
      for I := 1 to count -1 do
      begin
        stipCntr := bitmap.stipplecounter;
        linesSubCounter := linesCounter;

        with item[I]^ do
        begin
          tr := Left[0];
          br := Right[0];
        end;
        with item[I-1]^ do
        begin
          tl := Left[high(Left)];
          bl := Right[high(Right)];
          stipOffX := 0;
          stipOffY := 0;

          if length(Left) > 1 then
          begin
            J := round(DistOfPointFromLine(Left[0], tl, tr, false));
            tmpBR.X := round(tr.X + j/linesCounter* (br.X- tr.X));
            tmpBR.Y := round(tr.Y + j/linesCounter* (br.Y- tr.Y));
            StippleFill(tl, tr, Left[0], tmpBR, j, 0 ,0);
            stipOffX := (Left[0].X - tl.X);
            stipOffY := (Left[0].Y - tl.Y);
            tl := Left[0];
            tr := tmpBR;
            dec(linesSubCounter,j);
          end
          else if length(Right) > 1 then
          begin
            j := round(DistOfPointFromLine(Right[0], tl, tr, false));
            tmpBR.X := round(tr.X + j/linesCounter* (br.X- tr.X));
            tmpBR.Y := round(tr.Y + j/linesCounter* (br.Y- tr.Y));
            StippleFill(tl, tr, Right[0], tmpBR, j, 0 ,0);
            stipOffX := (Right[0].X - tl.X);
            stipOffY := (Right[0].Y - tl.Y);
            tr := tmpBR;
            tl := Right[0];
            dec(linesSubCounter,j);
          end;
        end;
        StippleFill(tl, tr, bl, br, linesSubCounter, stipOffX, stipOffY);
      end;

      //add rounded ends if needed ...
      if (EndStyle = esRounded) and (fLineWidth > 5) then
      begin
        if not fStartArrow.IsNeeded then
        begin
          endPt := pts[0];
          with item[0]^ do angle := - GetAnglePt2FromPt1(left[0], right[0]);
          roundEndPts := BuildArc(FloatPoint(endPt),angle,angle+OneEighty, penWidth/2 -0.5);
          fPolygon32.Clear;
          fPolygon32.AddPoints(roundEndPts[0],length(roundEndPts));
          fPolygon32.DrawFill(bitmap, stippleColor);
        end;
        if not fEndArrow.IsNeeded then
        begin
          endPt := pts[high(pts)];
          with item[count-1]^ do angle := - GetAnglePt2FromPt1(right[0], left[0]);
          roundEndPts := BuildArc(FloatPoint(endPt),angle,angle+OneEighty, penWidth/2 -0.5);
          fPolygon32.Clear;
          fPolygon32.AddPoints(roundEndPts[0],length(roundEndPts));
          fPolygon32.DrawFill(bitmap, stippleColor);
        end;
      end;

    finally
      free;
    end;
  finally
    with fStartArrow do fLinePoints[fBaseIdx] := fOldBase;
    with fEndArrow   do fLinePoints[fBaseIdx] := fOldBase;
  end;
  if StippleStep >= -1 then
    bitmap.StippleStep := SavedStippleStep;
  DrawArrows(bitmap);
end;
//------------------------------------------------------------------------------

procedure TLine32.DrawGradientHorz(bitmap: TCnsBitmap32; penWidth: single;
  const colors: array of TColor32; edgeColor: TColor32 = $00000000);
var
  i, j: integer;
  dx: single;
  p: TArrayOfColor32;
  p2: PColor32Array;
  rec: TRect;
  bmp: TCnsBitmap32;
begin
  rec := GetBoundsRect(penWidth);
  with rec do if (right = left) or (top = bottom) then exit;
  bmp := TCnsBitmap32.Create;
  try
    bmp.Width := bitmap.Width;
    bmp.Height := bitmap.Height;
    bmp.DrawMode := dmBlend;
    bmp.CombineMode := cmMerge;
    setlength(p, bmp.Width);
    {$R-}
    dx := 1/(rec.Right-rec.Left);
    for i := max(rec.Left,0) to min(rec.Right,bmp.Width) -1 do
      p[i] := GetColor(colors, (i-rec.Left)*dx);
    for j := max(rec.Top,0) to min(rec.Bottom,bmp.Height) -1 do
    begin
      p2 := bmp.ScanLine[j];
      for i := max(rec.Left,0) to min(rec.Right,bmp.Width) -1 do
        p2[i] := p[i];
    end;
    {$R+}
    Draw(bitmap, fLineWidth, bmp, edgeColor);
  finally
    bmp.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TLine32.DrawGradientVert(bitmap: TCnsBitmap32; penWidth: single;
  const colors: array of TColor32; edgeColor: TColor32 = $00000000);
var
  i, j: integer;
  dy: single;
  c: TColor32;
  p2: PColor32Array;
  rec: TRect;
  bmp: TCnsBitmap32;
begin
  rec := GetBoundsRect(penWidth);
  with rec do if (right = left) or (top = bottom) then exit;
  bmp := TCnsBitmap32.Create;
  try
    bmp.Width := bitmap.Width;
    bmp.Height := bitmap.Height;
    bmp.DrawMode := dmBlend;
    bmp.CombineMode := cmMerge;
    {$R-}
    dy := 1/(rec.Bottom-rec.top);
    for j := max(rec.Top,0) to min(rec.Bottom, bmp.Height) -1 do
    begin
      p2 := bmp.ScanLine[j];
      c := GetColor(colors, (j-rec.Top)*dy);
      for i := max(rec.Left,0) to min(rec.Right, bmp.Width) -1 do p2[i] := c;
    end;
    {$R+}
    Draw(bitmap, fLineWidth, bmp,edgeColor);
  finally
    bmp.Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TLine32.DrawGradient(bitmap: TCnsBitmap32; penWidth: single;
  const colors: array of TColor32; angle_degrees: integer; edgeColor: TColor32 = $00000000);
var
  bmp, bmp2: TCnsBitmap32;
  rec, rec2, rec3: TRect;
  rec3_offset, rec3_diff: TPoint;
  AT: TAffineTransformation;
  rotatedPts: TArrayOfFixedPoint;
  rotPoint: TFloatPoint;
  i, j, len: integer;
  angle_radians, dx: single;
  src,dst: PColor32;
  reverseColors: array of TColor32;
  pts: TArrayOfFixedPoint;
begin
  len := length(colors);
  if not assigned(bitmap) or (Length(fLinePoints) < 2) or (len = 0) then exit;
  angle_radians := angle_degrees*DegToRad;

  if NearlyMatch(angle_radians, 0, 5*OneDegree) then
  begin
    DrawGradientHorz(bitmap, penWidth, colors, edgeColor);
    exit;
  end
  else if NearlyMatch(angle_radians, OneEighty, 5*OneDegree) then
  begin
    setLength(reverseColors, len);
    for i := 0 to len -1 do reverseColors[i] := colors[len-1-i];
    DrawGradientHorz(bitmap, penWidth, reverseColors, edgeColor);
    exit;
  end
  else if NearlyMatch(angle_radians, Ninety, 5*OneDegree) then
  begin
    setLength(reverseColors, len);
    for i := 0 to len -1 do reverseColors[i] := colors[len-1-i];
    DrawGradientVert(bitmap, penWidth, reverseColors, edgeColor);
    exit;
  end
  else if NearlyMatch(angle_radians, TwoSeventy, 5*OneDegree) then
  begin
    DrawGradientVert(bitmap, penWidth, colors, edgeColor);
    exit;
  end;

  pts := GetOuterEdge(penWidth);
  rec := dcm32_misc.GetBoundsRect(pts);
  if (rec.Right = rec.Left) or (rec.Bottom = rec.Top) then exit;
  with rec do
    rotPoint := FloatPoint((left+right)/2,(top+bottom)/2);
  rotatedPts := rotatePoints(pts, FixedPoint(rotPoint), -angle_radians);
  rec2 := dcm32_misc.GetBoundsRect(rotatedPts);
  inflateRect(rec2,1,1);
  rec3 := rec2;
  if rec3.Left > rec.Left then rec3.Left := rec.Left;
  if rec3.Top > rec.Top then rec3.Top := rec.Top;
  if rec3.Right < rec.Right then rec3.Right := rec.Right;
  if rec3.Bottom < rec.Bottom then rec3.Bottom := rec.Bottom;

  rec3_offset := Point(rec3.Left, rec3.Top);
  rec3_diff := Point(rec2.Left - rec3.Left, rec2.Top - rec3.Top);
  offsetRect(rec3, -rec3.Left, -rec3.Top);
  offsetPoint(rotPoint, -rec2.Left, -rec2.Top);
  offsetRect(rec2, -rec2.Left, -rec2.Top);


  bmp := TCnsBitmap32.Create;
  bmp2 := TCnsBitmap32.Create;
  try
    bmp.DrawMode := dmBlend;
    bmp.CombineMode := cmMerge;
    bmp.SetSize(rec2.right,rec2.bottom);

    bmp2.SetSize(rec3.right,rec3.bottom);

    //create the gradient color pattern ...
    {$R-}
    dx := 1/bmp.Width;
    src := @bmp.bits[0];
    for i := 0 to bmp.Width -1 do
    begin
      src^ := GetColor(colors, i*dx);
      inc(src);
    end;
    for i := 1 to bmp.Height -1 do
    begin
      src := @bmp.bits[0];
      dst := @bmp.bits[i*bmp.Width];
      for j := 0 to bmp.Width -1 do
      begin
        dst^ := src^;
        inc(src);
        inc(dst);
      end;
    end;
    {$R+}

    //rotate the color pattern onto bmp2 ...
    AT := TAffineTransformation.Create;
    try
      AT.SrcRect := FloatRect(rec2);
      AT.Rotate(rotPoint.X, rotPoint.Y, angle_degrees);
      AT.Translate(rec3_diff.X, rec3_diff.Y);
      DCM32_Transforms.Transform(bmp2, bmp, AT);
    finally
      AT.free;
    end;

    //almost there ... now copy the rotated color pattern onto bmp
    //at the required location for the pattern ...
    bmp.SetSize(rec3_offset.X + rec3.Right, rec3_offset.Y + rec3.Bottom);
    bmp2.DrawTo(bmp,rec3_offset.X,rec3_offset.Y);

    Draw(bitmap, fLineWidth, bmp, edgeColor);
  finally
    bmp.Free; bmp2.Free;
  end;
end;
//------------------------------------------------------------------------------

function TLine32.GetLeftPoints: TArrayOfFixedPoint;
begin
  if fLeftPoints = nil then Build;
  result := fLeftPoints;
end;
//------------------------------------------------------------------------------

function TLine32.GetRightPoints: TArrayOfFixedPoint;
begin
  if fRightPoints = nil then Build;
  result := fRightPoints;
end;
//------------------------------------------------------------------------------

function TLine32.Points: TArrayOfFixedPoint;
begin
  result := fLinePoints;
end;
//------------------------------------------------------------------------------

function TLine32.GetOutline(penWidth: single = 0): TArrayOfFixedPoint;
var
  highPts : integer;
  N              : TFloatPoint;
  a1, a2, halfLW : single;
  startPts       : TArrayOfFixedPoint;
  endPts         : TArrayOfFixedPoint;
  reversedPts    : TArrayOfFixedPoint;
begin
  if penWidth > 0 then SetWidth(penWidth);
  Build;
  if (length(fLeftPoints) = 0) and (length(fRightPoints) = 0) then exit;
  startPts := nil;
  endPts := nil;
  if not fStartArrow.IsNeeded then
  begin
    N := MakeNormal(fLinePoints[1],fLinePoints[0]);
    halfLW := fLineWidth/2;
    if (fEndStyle = esRounded) then
    begin
      a1 := ArcTan2(N.Y, N.X);
      a2 := ArcTan2(-N.Y, -N.X);
      if a2 < a1 then a2 := a2 + ThreeSixty;
      startPts :=
        BuildArc(FloatPoint(fLinePoints[0]), a1, a2, halfLW);
    end else if (fEndStyle = esSquared) then
    begin
      SetLength(startPts, 2);
      startPts[0].X := fLinePoints[0].X + Fixed((N.X - N.Y) * halfLW);
      startPts[0].Y := fLinePoints[0].Y + Fixed((N.Y + N.X) * halfLW);
      startPts[1].X := fLinePoints[0].X - Fixed((N.X + N.Y) * halfLW);
      startPts[1].Y := fLinePoints[0].Y - Fixed((N.Y - N.X) * halfLW);
    end;
  end;
  if not fEndArrow.IsNeeded then
  begin
    highPts := high(fLinePoints);
    N := MakeNormal(fLinePoints[highPts-1], fLinePoints[highPts]);
    halfLW := fLineWidth/2;
    if (fEndStyle = esRounded) then
    begin
      a1 := ArcTan2(N.Y, N.X);
      a2 := ArcTan2(-N.Y, -N.X);
      if a2 < a1 then a2 := a2 + ThreeSixty;
      endPts :=
        BuildArc(FloatPoint(fLinePoints[highPts]), a1, a2, halfLW);
    end else if (fEndStyle = esSquared) then
    begin
      SetLength(endPts, 2);
      endPts[0].X := fLinePoints[highPts].X + Fixed((N.X - N.Y) * halfLW);
      endPts[0].Y := fLinePoints[highPts].Y + Fixed((N.Y + N.X) * halfLW);
      endPts[1].X := fLinePoints[highPts].X - Fixed((N.X + N.Y) * halfLW);
      endPts[1].Y := fLinePoints[highPts].Y - Fixed((N.Y - N.X) * halfLW);
    end;
  end;
  setLength(result, length(fLeftPoints) + length(fRightPoints) +
    length(startPts) + length(endPts));

  if startPts <> nil then
    move(startPts[0],result[0], length(startPts) * sizeof(TFixedPoint));
  move(fLeftPoints[0],result[length(startPts)],
    length(fLeftPoints) * sizeof(TFixedPoint));
  if endPts <> nil then
    move(endPts[0],result[length(startPts)+length(fLeftPoints)],
      length(endPts) * sizeof(TFixedPoint));
  reversedPts := ReversePoints(fRightPoints);
  move(reversedPts[0], result[length(startPts)+length(fLeftPoints)+length(endPts)],
    length(reversedPts) * sizeof(TFixedPoint));
end;
//------------------------------------------------------------------------------

function TLine32.IsClockwiseDirection: boolean;
var
  p1, p2, p3: TFloatPoint;
begin
  //nb: this algorithm assumes a convex shaped polygon
  result := true;
  if length(fLinePoints) < 3 then exit;
  p1 := FloatPoint(fLinePoints[0]);
  p2 := FloatPoint(fLinePoints[1]);
  p3 := FloatPoint(fLinePoints[2]);
  if (p3.X - p2.X) * (p2.y - p1.Y) - (p3.Y - p2.Y) * (p2.X - p1.X) > 0 then
    result := false;
end;
//------------------------------------------------------------------------------

function TLine32.GetOuterEdge(penWidth: single = 0): TArrayOfFixedPoint;
var
  len: integer;
begin
  if penWidth > 0 then SetWidth(penWidth);
  if (EndStyle = esClosed) and (length(fLinePoints) > 2) then
  begin
    if IsClockwiseDirection then
      result := GetLeftPoints else
      result := GetRightPoints;
    len := length(result);
    if (len < 3) or DuplicatePoint(result[0], result[len-1]) then exit;
    SetLength(result, len +1);
    result[len].X := result[0].X;
    result[len].Y := result[0].Y;
  end else
    result := GetOutline;
end;
//------------------------------------------------------------------------------

function TLine32.GetInnerEdge(penWidth: single = 0): TArrayOfFixedPoint;
var
  len: integer;
begin
  if penWidth > 0 then SetWidth(penWidth);
  if (EndStyle = esClosed) and (length(fLinePoints) > 2) then
  begin
    if IsClockwiseDirection then
      result := GetRightPoints else
      result := GetLeftPoints;
    len := length(result);
    if (len < 3) or DuplicatePoint(result[0], result[len-1]) then exit;
    SetLength(result, len +1);
    result[len].X := result[0].X;
    result[len].Y := result[0].Y;
  end else
    result := GetOutline;
end;
//------------------------------------------------------------------------------

procedure TLine32.SetWidth(value: single);
begin
  Constrain(value, 1, 50);
  if value = fLineWidth then exit;
  fLineWidth := value;
  ForceRebuild;
end;
//------------------------------------------------------------------------------

procedure TLine32.SetMiterLimit(value: single);
begin
  if value = fMiterLimit then exit;
  fMiterLimit := Constrain(value, 0, 40);
  ForceRebuild;
end;
//------------------------------------------------------------------------------

procedure TLine32.SetJoinStyle(value: TJoinStyle);
begin
  if value = fJoinStyle then exit;
  fJoinStyle := value;
  ForceRebuild;
end;
//------------------------------------------------------------------------------

procedure TLine32.SetEndStyle(value: TEndStyle);
begin
  if value = fEndStyle then exit;
  fEndStyle := value;
  if fEndStyle = esClosed then
  begin
    ArrowStart.fStyle := asNone;
    ArrowEnd.fStyle := asNone;
  end;
  ForceRebuild;
end;
//------------------------------------------------------------------------------

function TLine32.DoHitTest(pt: TFixedPoint; penWidth: single = 0): THitTestResult;
var
  lineOutline: TArrayOfFixedPoint;
  arrowOutline: TArrayOfFixedPoint;
begin
  result := htNone;
  if length(fLinePoints) < 2 then exit;
  lineOutline := GetOutline(penWidth);
  if length(lineOutline) = 0 then exit;
  arrowOutline := fEndArrow.OutlinePoints;
  if (Length(arrowOutline) > 0) and PtInPolygon(pt,arrowOutline) then
    result := htEndArrow
  else
  begin
    arrowOutline := fStartArrow.OutlinePoints;
    if (Length(arrowOutline) > 0) and PtInPolygon(pt,arrowOutline) then
      result := htStartArrow
    else if PtInPolygon(pt,lineOutline) then
      result := htLine;
  end;
end;
//------------------------------------------------------------------------------

procedure TLine32.Build;
var
  tmpPts: TArrayOfFixedPoint;
  pts: TArrayOfFixedPoint;
begin
  if (fLeftPoints <> nil) or (fRightPoints <> nil) or //ie do only once
    (length(fLinePoints) < 2) or (fLineWidth < 1) then exit;

  AdjustEndsForArrows;
  try

    if (fStartArrow.fBaseIdx > 0) or (fEndArrow.fBaseIdx < high(fLinePoints)) then
    begin
      tmpPts := Copy(fLinePoints, fStartArrow.fBaseIdx,
        fEndArrow.fBaseIdx - fStartArrow.fBaseIdx +1);
      pts := tmpPts;
    end else
      pts := fLinePoints;

    //now get the left and right 'grow' points (ie outline minus end caps) ...
    with TGrow.create(@fLeftPoints, @fRightPoints) do
    try
      Grow(pts, fLineWidth, JoinStyle, MiterLimit, EndStyle = esClosed);
    finally
      free;
    end;
  finally
    with fStartArrow do fLinePoints[fBaseIdx] := fOldBase;
    with fEndArrow   do fLinePoints[fBaseIdx] := fOldBase;
  end;
end;
//------------------------------------------------------------------------------

end.
