{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_Def;

interface

uses
  Graphics, classes, sysutils,windows;

const
  bitmask: array[0..7] of byte = ($80, $40, $20, $10, $08, $04, $02, $01);
  ALLOCBLOCK = 512;
  A90 = PI / 2;
  GRIPDIM = 4;
  
{type
  TCMYK = packed record
    c: byte;
    m: byte;
    y: byte;
    k: byte;
  end;
  PCMYK = ^TCMYK;

  TRGB = packed record
    b: byte;
    g: byte;
    r: byte;
  end;
  pRGB = ^TRGB;
  PRGBArray = array[0..Maxint div 16] of pRGB;
  pPRGBArray = ^PRGBArray;
  TRGBArray = array of TRGB;
  RGBROW = array[0..Maxint div 16] of TRGB;
  pRGBROW = ^RGBROW;
  TRGBROWS = array[0..Maxint div 16] of PRGBROW;
  PRGBROWS = ^TRGBROWS; }

function dmin(v1, v2: double): double;
function dmax(v1, v2: double): double;
function IMax(v1, v2: Integer): Integer;
function IMin(v1, v2: Integer): Integer;
function ilimit(vv, min, max: integer): integer;
function blimit(vv: integer): integer;
procedure iswap(var B1, B2: LongInt); assembler;
procedure bswap(var B1, B2: Byte); assembler;
function _DistPoint2Point(x1, y1, x2, y2: integer): double;
function _RectXRect(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2: integer): boolean;
function _DistPoint2Seg(xp, yp, x1, y1, x2, y2: integer): double;
function _InRect(xx, yy, x1, y1, x2, y2: integer): boolean;

function _DistPoint2Ellipse(x, y, x1, y1, x2, y2: integer): double;
function _ArcCos(X: Extended): Extended; forward;

procedure _DrawGrip(canvas: TCanvas; x, y: integer; ty: integer);
function _Angle(x1, y1, x2, y2, x3, y3: integer): double;
function _InGrip(xg, yg, xp, yp: integer): boolean;
procedure OrdCor(var x1, y1, x2, y2: integer);

procedure _CastPolySelCC(const x1, y1: integer; var x2, y2: integer);
function _InRectO(xx, yy, x1, y1, x2, y2: integer): boolean;
function _Angle2(x1, y1, x2, y2: integer): double;

implementation

function IMax(v1, v2: Integer): Integer;
asm
	cmp	edx,eax
	jng	@1
	mov	eax,edx
@1:
end;

function IMin(v1, v2: Integer): Integer;
asm
	cmp	eax,edx
	jng	@1
	mov	eax,edx
@1:
end;

function dmin(v1, v2: double): double;
begin
  if v1 < v2 then
    dmin := v1
  else
    dmin := v2;
end;

function dmax(v1, v2: double): double;
begin
  if v1 > v2 then
    dmax := v1
  else
    dmax := v2;
end;
/////////////////////////////////////////////////////////////////////////////////////

procedure iswap(var B1, B2: LongInt); assembler;
asm
  push EBX
  mov  ecx, [EAX];
  mov  ebx, [EDX];
  mov  [EDX], ecx
  mov  [EAX], ebx
  pop EBX
end;

procedure bswap(var B1, B2: Byte); assembler;
asm
  mov  cl, Byte Ptr [EAX];
  mov  ch, Byte Ptr [EDX];
  mov  Byte Ptr [EDX], cl
  mov  Byte Ptr [EAX], ch
end;
function ilimit(vv, min, max: integer): integer;
begin
  result := IMin(IMax(vv, min), max);
end;
// limita da 0 a 255

function blimit(vv: integer): integer;
begin
  if vv < 0 then
    blimit := 0
  else
    if vv > 255 then
    blimit := 255
  else
    blimit := vv;
end;

function _DistPoint2Point(x1, y1, x2, y2: integer): double;
begin
  result := sqrt(sqr(x2 - x1) + sqr(y2 - y1));
end;

function _RectXRect(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2: integer): boolean;
begin
  result := not ((IMAX(ax1, ax2) < bx1) or (IMIN(ax1, ax2) > bx2) or
    (IMAX(ay1, ay2) < by1) or (IMIN(ay1, ay2) > by2));
end;

procedure addPt(var a, b, c: TPoint);
begin
  c.x := a.x + b.x;
  c.y := a.y + b.y;
end;

procedure subPt(var a, b, c: TPoint);
begin
  c.x := a.x - b.x;
  c.y := a.y - b.y;
end;

function _InRect(xx, yy, x1, y1, x2, y2: integer): boolean;
begin
  result := (xx >= x1) and (xx <= x2) and (yy >= y1) and (yy <= y2);
end;

// restituisce true se il punto xx,yy è compreso nel rettangolo x1,y1,x2,y2
// x1,y1,x2,y2 possono anche non essere ordinate
procedure OrdCor(var x1, y1, x2, y2: integer);
begin
  if x1 > x2 then iswap(x1, x2);
  if y1 > y2 then iswap(y1, y2);
end;

function _InRectO(xx, yy, x1, y1, x2, y2: integer): boolean;
begin
  OrdCor(x1, y1, x2, y2);
  result := (xx >= x1) and (xx <= x2) and (yy >= y1) and (yy <= y2);
end;

// Distanza di un punto da una retta

function _DistPoint2Line(xp, yp, x1, y1, x2, y2: integer): double;
var
  a, b, c: integer;
begin
  a := y1 - y2;
  b := x2 - x1;
  c := x1 * y2 - x2 * y1;
  result := abs(a * xp + b * yp + c) / sqrt(a * a + b * b);
end;

function _DistPoint2Seg(xp, yp, x1, y1, x2, y2: integer): double;
var
  r: double;
begin
  if (x1 = x2) and (y1 = y2) then
    result := sqrt(sqr(xp - x1) + sqr(yp - y1))
  else
  begin
    r := ((y1 - yp) * (y1 - y2) - (x1 - xp) * (x2 - x1)) / sqr(sqrt(sqr(x2 - x1) + sqr(y2 - y1)));
    if r > 1 then
         // distanza da xp,yp a x2,y2
      result := sqrt(sqr(xp - x2) + sqr(yp - y2))
    else
      if r < 0 then
         // distanza da xp,yp a x1,y1
      result := sqrt(sqr(x1 - xp) + sqr(y1 - yp))
    else
         // distanza dalla retta
      result := _DistPoint2Line(xp, yp, x1, y1, x2, y2);
  end;
end;

procedure _CastPolySelCC(const x1, y1: integer; var x2, y2: integer);
var
  dx, dy: integer;
  adx, ady: integer;
begin
  dx := x1 - x2;
  adx := abs(dx);
  dy := y1 - y2;
  ady := abs(dy);
  if adx + 30 < ady then
    x2 := x1
  else
    if adx - 30 > ady then
    y2 := y1
  else
  begin
    if (dx < 0) and (dy < 0) then
    begin
      if (adx < ady) then
        inc(x2, abs(adx - ady))
      else
        inc(y2, abs(adx - ady));
    end
    else
      if (dx > 0) and (dy > 0) then
    begin
      if (adx < ady) then
        inc(y2, abs(adx - ady))
      else
        inc(x2, abs(adx - ady));
    end
    else
      if (dx > 0) then
    begin
      if (adx < ady) then
        dec(x2, abs(adx - ady))
      else
        inc(y2, abs(adx - ady));
    end
    else
      if (dy > 0) then
    begin
      if (adx < ady) then
        inc(x2, abs(adx - ady))
      else
        dec(y2, abs(adx - ady));
    end;
  end;
end;

function _DistPoint2Ellipse(x, y, x1, y1, x2, y2: integer): double;
var
  g, xr1, yr1, xr2, yr2, dx, dy, p: integer;
  d: double;
begin
  result := 2147483647;
  dx := (x2 - x1) shr 1; // raggio x
  dy := (y2 - y1) shr 1; // raggio y
  dec(x, x1 + dx);
  dec(y, y1 + dy);
  p := trunc(2 * pi * imin(dx, dy)) shr 3;
  xr1 := dx;
  yr1 := 0;
  for g := 1 to p - 1 do
  begin
    xr2 := trunc(cos((2 * pi / p) * g) * dx);
    yr2 := trunc(sin((2 * pi / p) * g) * dy);
    d := _DistPoint2Seg(x, y, xr1, yr1, xr2, yr2);
    if d < result then
      result := d;
    xr1 := xr2;
    yr1 := yr2;
  end;
end;

procedure _DrawGrip(canvas: TCanvas; x, y: integer; ty: integer);
begin
  with canvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    if ty = 0 then
    begin
         // grip quadrato
      MoveTo(x - GRIPDIM, y - GRIPDIM);
      LineTo(x + GRIPDIM, y - GRIPDIM);
      LineTo(x + GRIPDIM, y + GRIPDIM);
      LineTo(x - GRIPDIM, y + GRIPDIM);
      LineTo(x - GRIPDIM, y - GRIPDIM);
    end
    else
      if ty = 1 then
    begin
         // grip triangolare
      MoveTo(x, y - GRIPDIM);
      LineTo(x + GRIPDIM, y);
      LineTo(x, y + GRIPDIM);
      LineTo(x - GRIPDIM, y);
      LineTo(x, y - GRIPDIM);
    end;
  end;
end;

function _InGrip(xg, yg, xp, yp: integer): boolean;
var
  rc: trect;
begin
  rc := rect(xg - GRIPDIM, yg - GRIPDIM, xg + GRIPDIM, yg + GRIPDIM);
  result := PtInRect(rc, point(xp, yp));
end;

function _ArcTan2(Y, X: Extended): Extended;
asm
  FLD     Y
  FLD     X
  FPATAN
  FWAIT
end;

function _ArcCos(X: Extended): Extended;
begin
  Result := _ArcTan2(Sqrt(1 - X * X), X);
end;

function _Angle(x1, y1, x2, y2, x3, y3: integer): double;
var
  vx1, vy1, vx2, vy2: integer;
  d1, d2: double;
begin
  vx1 := x2 - x1;
  vy1 := y2 - y1;
  vx2 := x3 - x2;
  vy2 := y3 - y2;
  d1 := sqrt(vx1 * vx1 + vy1 * vy1);
  d2 := sqrt(vx2 * vx2 + vy2 * vy2);
  if (d1 = 0) or (d2 = 0) then
    result := 0
  else
  begin
    d1 := (vx1 * vx2 + vy1 * vy2) / (d1 * d2);
    if abs(d1) <= 1 then
      result := _ArcCos(d1)
    else
      result := 0;
  end;
end;

function _Angle2(x1, y1, x2, y2: integer): double;
begin
  if (x1 < x2) and (y2 < y1) then // 1
    result := pi - _angle(x2, y2, x1, y1, x2, y1)
  else
    if (x1 < x2) and (y1 < y2) then // 4
    result := pi + _angle(x2, y1, x1, y1, x2, y2)
  else
    if (x2 < x1) and (y1 < y2) then // 3
    result := 2 * pi - _angle(x2, y1, x1, y1, x2, y2)
  else
    if (x2 < x1) and (y2 < y1) then // 2
    result := _angle(x2, y1, x1, y1, x2, y2)
  else
    if (x2 = x1) and (y1 > y2) then
    result := pi / 2
  else
    if (x2 = x1) and (y1 < y2) then
    result := 1.5 * pi
  else
    if (y1 = y2) and (x1 > x2) then
    result := pi
  else
    result := 0;
end;

function _StrDup(s: pchar): pchar;
begin
  getmem(result, strlen(s) + 1);
  StrCopy(result, s);
end;

end.
