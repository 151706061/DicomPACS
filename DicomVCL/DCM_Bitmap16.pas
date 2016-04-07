unit DCM_Bitmap16;

interface

uses
  Windows, Classes, SysUtils, Graphics, DCM32, DCM32_LowLevel, DCM_Dict;

type

  TDicomBitmap16 = class
  private
    fData: Wordp;
    FClipRect: TRect;
    FHeight: Integer;
    FWidth: Integer;
    FFont: TFont;
    FPenColor: TColor32;
    FDataBits: Integer;
    fMaxRange: Integer;

    procedure SetFont(const Value: TFont);
    function GetScanLine(index: Integer): Pointer;

    procedure SetPenColor(const Value: TColor32);
    function GetPixelS(X, Y: Integer): Word;
    procedure SetPixelS(X, Y: Integer; const Value: Word);
    function GetPixelPtr(X, Y: Integer): pWord;
    procedure SetDataBits(const Value: Integer);
    function GetmaxRange: Integer;
    procedure DrawLine(x1, y1, x2, y2: Integer; Value: Word);

  protected
    procedure VertLineS(X, Y1, Y2: Integer; Value: Word);
    procedure HorzLineS(X1, Y, X2: Integer; Value: Word);
  public
    constructor Create;
    destructor Destroy; override;

    function GetData: Pointer;
    procedure SetSize(AWidth, AHeight: Integer);

    procedure TextOut(X, Y: Integer; AStr: string);
    procedure LineS(X1, Y1, X2, Y2: Integer; Value1: TColor32; L: Boolean);
    procedure RenderText(X, Y: Integer; const Text: string; AALevel: Integer; Color: TColor32);
    function TextHeight(const Text: string): Integer;
    function TextWidth(const Text: Widestring): Integer;

    property Width: Integer read FWidth;
    property Height: Integer read FHeight;

    property Font: TFont read FFont write SetFont;

    property ScanLine[index: Integer]: Pointer read GetScanLine;
    property PenColor: TColor32 read FPenColor write SetPenColor;
    property PixelS[X, Y: Integer]: Word read GetPixelS write SetPixelS;
    property PixelPtr[X, Y: Integer]: pWord read GetPixelPtr;

    property DataBits: Integer read FDataBits write SetDataBits;
    property MaxRange: Integer read GetmaxRange;
  published

  end;

function ResizeBicubic(Src: TDicomBitmap16; hScale: double): TDicomBitmap16;
function CutImage(Src: TDicomBitmap16; OffX, OffY, DestWidth, DestHeight: Integer): TDicomBitmap16;

implementation

uses DCM_Attributes, math;

function CutImage(Src: TDicomBitmap16; OffX, OffY, DestWidth, DestHeight: Integer): TDicomBitmap16;
var
  i2, x1, x2, y1, y2, copy_len: Integer;
  p1, p2: pWord;
begin
  Result := TDicomBitmap16.Create;
  Result.SetSize(DestWidth, DestHeight);

  if OffY > 0 then
  begin
    y1 := 0;
    y2 := abs(OffY); //dst
  end
  else
  begin
    y1 := abs(OffY);
    y2 := 0; //dst
  end;

  if OffX > 0 then
  begin
    x1 := 0;
    x2 := abs(OffX); //dst
    if (src.Width + x2) < DestWidth then
      copy_len := src.Width
    else
      copy_len := DestWidth - X2;
  end
  else
  begin
    x1 := abs(OffX);
    x2 := 0; //dst
    if (DestWidth) > (src.Width - x1) then
      copy_len := src.Width - x1
    else
      copy_len := DestWidth;
  end;

  for i2 := y2 to DestHeight - 1 do
  begin
    p2 := Result.ScanLine[i2];
    p1 := src.ScanLine[y1];
    inc(y1);
    if y1 >= src.Height then
      break;

    if x2 > 0 then
      inc(p2, x2);

    if x1 > 0 then
      inc(p1, x1);

    Move(p1^, p2^, copy_len * 2);
  end;
end;
{
function CutImage(Src: TDicomBitmap16; OffX, OffY, DestWidth, DestHeight: Integer): TDicomBitmap16;
var
  i2, y1, copy_len: Integer;
  p1, p2: pWord;
  xa1, xa2, ya1, ya2, xb1, xb2, yb1, yb2, xc1, xc2, yc1, yc2: Integer;
begin
  Result := TDicomBitmap16.Create;
  Result.SetSize(DestWidth, DestHeight);
  Xa1 := 0;
  Ya1 := 0;
  Xa2 := Src.Width;
  Ya2 := Src.Height;

  Xb1 := OffX;
  Yb1 := OffY;
  Xb2 := OffX + DestWidth;
  Yb2 := OffY + DestHeight;

  Xc1 := max(Xa1, Xb1);
  Yc1 := max(Ya1, Yb1);
  Xc2 := min(Xa2, Xb2);
  Yc2 := min(Ya2, Yb2);

  copy_len := Xc2 - Xc1;

  if OffY > 0 then
    Y1 := OffY
  else
    y1 := 0;

  for i2 := Yc1 to Yc2 - 1 do
  begin
    p2 := Result.ScanLine[i2];
    p1 := src.ScanLine[y1];
    inc(y1);
    if y1 >= src.Height then
      break;

    if OffX > 0 then
      inc(p2, abs(OffX))
    else
      inc(p1, abs(OffX));

    Move(p1^, p2^, copy_len * 2);
  end;
end; }

function ResizeBicubic(Src: TDicomBitmap16; hScale: double): TDicomBitmap16;
var
//  f1, f2, f3, f4, fNew: Word;
//  temp1, temp2, temp3, temp4, tempDst: Wordp;
//  x, y, u, v: double;
  {x1, x2, x3, x4, y1, y2, y3, y4,} {i, j,} //tempRGB: integer;
  DestWidth, DestHeight, SrcWidth, SrcHeight: integer;
begin
  SrcWidth := Src.Width;
  SrcHeight := Src.Height;

  DestHeight := Trunc(hScale * SrcHeight);
  DestWidth := Trunc(hScale * SrcWidth);

  Result := TDicomBitmap16.Create;
  Result.SetSize(DestWidth, DestHeight);

  StretchResample(Src.fData, 0, 0, SrcWidth, SrcHeight, Result.fData, 0, 0, DestWidth, DestWidth, sfLinear);
end;

{ TDicomBitmap16 }

constructor TDicomBitmap16.Create;
begin
  FFont := TFont.Create;
  fData := nil;
  FHeight := 0;
  FWidth := 0;

  FDataBits := 12;
  fMaxRange := 1 shl FDataBits - 1;
end;

destructor TDicomBitmap16.Destroy;
begin
  if fData <> nil then
  begin
    FreeMem(fData);
  end;
  FFont.Free;
  inherited;
end;

function TDicomBitmap16.GetData: Pointer;
begin
  Result := fData;
end;

function TDicomBitmap16.GetScanLine(index: Integer): Pointer;
begin
  Result := @fData[index * FWidth];
end;

procedure TDicomBitmap16.SetFont(const Value: TFont);
begin
  FFont := Value;
end;

procedure TDicomBitmap16.SetPenColor(const Value: TColor32);
begin
  FPenColor := Value;
end;

procedure TDicomBitmap16.SetSize(AWidth, AHeight: Integer);
begin
  if (fHeight <> AHeight) or (fWidth <> AWidth) then
  begin
    if fData <> nil then
    begin
      FreeMem(fData);
    end;
    fHeight := AHeight;
    fWidth := AWidth;
    GetMem(fData, fHeight * fWidth * 2);
    FillChar(fData^, fHeight * fWidth * 2, 0);

    FClipRect := Rect(0, 0, fWidth - 1, fHeight - 1);
  end;
end;

procedure TDicomBitmap16.TextOut(X, Y: Integer; AStr: string);
begin
  RenderText(X, Y, AStr, 0, fPenColor);
end;

function TDicomBitmap16.TextHeight(const Text: string): Integer;
var
  b1: TBitmap;
begin
  b1 := TBitmap.Create;
  try
    b1.Canvas.Font.Assign(fFont);
    Result := b1.Canvas.TextHeight(Text);
  finally
    b1.Free;
  end;
end;

function TDicomBitmap16.TextWidth(const Text: Widestring): Integer;
var
  b1: TBitmap;
begin
  b1 := TBitmap.Create;
  try
    b1.Canvas.Font.Assign(fFont);
    Result := b1.Canvas.TextWidth(Text);
  finally
    b1.Free;
  end;
end;

procedure TDicomBitmap16.RenderText(X, Y: Integer; const Text: string;
  AALevel: Integer; Color: TColor32);
var
  b1: TBitmap;
  x1, y1: Integer;
  i1, i2: Integer;
  pixeldata: RGBp;
begin
  b1 := TBitmap.Create;
  try
    b1.Canvas.Font.Assign(fFont);
    //b1.Canvas.Font.Name := 'ËÎÌו';
    b1.Canvas.Font.Color := $FFFFFF;
    b1.PixelFormat := pf24bit;
    b1.Canvas.Brush.Style := bsClear;
    x1 := b1.Canvas.TextWidth(Text);
    y1 := b1.Canvas.TextHeight(Text);
    b1.Width := x1;
    b1.Height := y1;

    b1.Canvas.TextOut(0, 0, Text);

    //b1.SaveToFile('c:\textbitmap.bmp');
    for i1 := 0 to b1.Height - 1 do
    begin
      pixeldata := b1.ScanLine[i1];
      for i2 := 0 to b1.Width - 1 do
      begin
        if pixeldata[i2].b = 255 then
        begin
          if (y + i1) < Height then
            if fData[(Y + i1) * fWidth + X + i2] > (fMaxRange shr 1) then
              fData[(Y + i1) * fWidth + X + i2] := 0
            else
              fData[(Y + i1) * fWidth + X + i2] := fMaxRange;
        end;
      end;
    end;
    //Result := b1.Canvas.TextWidth(Text);
  finally
    b1.Free;
  end;
end;

procedure TDicomBitmap16.DrawLine(x1, y1, x2, y2: Integer; Value: Word);
var
  x, y, DeltaX, DeltaY, HalfCount, ErrorTerm, i, Flag: Integer;
begin
  DeltaX := x2 - x1;
  DeltaY := y2 - y1;

  if Abs(DeltaY) < Abs(DeltaX) then
  begin
    if DeltaX < 0 then
    begin
      i := x1;
      x1 := x2;
      x2 := i;
      i := y1;
      y1 := y2;
      y2 := i;
      DeltaX := x2 - x1;
      DeltaY := y2 - y1;
    end;
    if DeltaY < 0 then
      Flag := -1
    else
      Flag := 1;
    DeltaY := Abs(DeltaY);
    HalfCount := DeltaX shr 1;
    ErrorTerm := 0;
    x := x1;
    y := y1;
    for i := 0 to DeltaX do
    begin
      PixelS[X, Y] := Value;
      Inc(x);
      ErrorTerm := ErrorTerm + DeltaY;
      if ErrorTerm > HalfCount then
      begin
        ErrorTerm := ErrorTerm - DeltaX;
        y := y + Flag;
      end;
    end;
  end
  else
  begin
    if DeltaY < 0 then
    begin
      i := x1;
      x1 := x2;
      x2 := i;
      i := y1;
      y1 := y2;
      y2 := i;
      DeltaX := x2 - x1;
      DeltaY := y2 - y1;
    end;
    if DeltaX < 0 then
      Flag := -1
    else
      Flag := 1;
    DeltaX := Abs(DeltaX);
    HalfCount := DeltaY shr 1;
    ErrorTerm := 0;
    x := x1;
    y := y1;
    for i := 0 to DeltaY do
    begin
      PixelS[X, Y] := Value;
      Inc(y);
      ErrorTerm := ErrorTerm + DeltaX;
      if ErrorTerm > HalfCount then
      begin
        ErrorTerm := ErrorTerm - DeltaY;
        x := x + Flag;
      end;
    end;
  end;
end;

procedure TDicomBitmap16.LineS(X1, Y1, X2, Y2: Integer; Value1: TColor32; L: Boolean);
var
//  Cx1, Cx2, Cy1, Cy2, PI, Sx, Sy,
   Dx, Dy{, xd, yd, Dx2, Dy2, rem, term, tmp, e}: Integer;
 // Swapped, CheckAux: Boolean;
//  P: PColor32;
  ChangedRect: TRect;
  Value: Word;
begin
  Value := fMaxRange;
  ChangedRect := MakeRect(X1, Y1, X2, Y2);

  Dx := X2 - X1;
  Dy := Y2 - Y1;

  // check for trivial cases...
  if Dx = 0 then // vertical line?
  begin
    if Dy > 0 then
      VertLineS(X1, Y1, Y2 - 1, Value)
    else
      if Dy < 0 then
      VertLineS(X1, Y2 + 1, Y1, Value);
    if L then
      PixelS[X2, Y2] := Value;
  end
  else
    if Dy = 0 then // horizontal line?
  begin
    if Dx > 0 then
      HorzLineS(X1, Y1, X2 - 1, Value)
    else
      if Dx < 0 then
      HorzLineS(X2 + 1, Y1, X1, Value);
    if L then
      PixelS[X2, Y2] := Value;
  end
  else
  begin
    DrawLine(X1, Y1, X2, Y2, Value);
    (*   Cx1 := FClipRect.Left;
       Cx2 := FClipRect.Right - 1;
       Cy1 := FClipRect.Top;
       Cy2 := FClipRect.Bottom - 1;

       if Dx > 0 then
       begin
         if (X1 > Cx2) or (X2 < Cx1) then
           Exit; // segment not visible
         Sx := 1;
       end
       else
       begin
         if (X2 > Cx2) or (X1 < Cx1) then
           Exit; // segment not visible
         Sx := -1;
         X1 := -X1;
         X2 := -X2;
         Dx := -Dx;
         Cx1 := -Cx1;
         Cx2 := -Cx2;
         Swap(Cx1, Cx2);
       end;

       if Dy > 0 then
       begin
         if (Y1 > Cy2) or (Y2 < Cy1) then
           Exit; // segment not visible
         Sy := 1;
       end
       else
       begin
         if (Y2 > Cy2) or (Y1 < Cy1) then
           Exit; // segment not visible
         Sy := -1;
         Y1 := -Y1;
         Y2 := -Y2;
         Dy := -Dy;
         Cy1 := -Cy1;
         Cy2 := -Cy2;
         Swap(Cy1, Cy2);
       end;

       if Dx < Dy then
       begin
         Swapped := True;
         Swap(X1, Y1);
         Swap(X2, Y2);
         Swap(Dx, Dy);
         Swap(Cx1, Cy1);
         Swap(Cx2, Cy2);
         Swap(Sx, Sy);
       end
       else
         Swapped := False;

       // Bresenham's set up:
       Dx2 := Dx shl 1;
       Dy2 := Dy shl 1;
       xd := X1;
       yd := Y1;
       e := Dy2 - Dx;
       term := X2;
       CheckAux := True;

       // clipping rect horizontal entry
       if Y1 < Cy1 then
       begin
         tmp := Dx2 * (Cy1 - Y1) - Dx;
         Inc(xd, tmp div Dy2);
         rem := tmp mod Dy2;
         if xd > Cx2 then
           Exit;
         if xd >= Cx1 then
         begin
           yd := Cy1;
           Dec(e, rem + Dx);
           if rem > 0 then
           begin
             Inc(xd);
             Inc(e, Dy2);
           end;
           CheckAux := False; // to avoid ugly labels we set this to omit the next check
         end;
       end;

       // clipping rect vertical entry
       if CheckAux and (X1 < Cx1) then
       begin
         tmp := Dy2 * (Cx1 - X1);
         Inc(yd, tmp div Dx2);
         rem := tmp mod Dx2;
         if (yd > Cy2) or (yd = Cy2) and (rem >= Dx) then
           Exit;
         xd := Cx1;
         Inc(e, rem);
         if (rem >= Dx) then
         begin
           Inc(yd);
           Dec(e, Dx2);
         end;
       end;

       // set auxiliary var to indicate that temp is not clipped, since
       // temp still has the unclipped value assigned at setup.
       CheckAux := False;

       // is the segment exiting the clipping rect?
       if Y2 > Cy2 then
       begin
         tmp := Dx2 * (Cy2 - Y1) + Dx;
         term := X1 + tmp div Dy2;
         rem := tmp mod Dy2;
         if rem = 0 then
           Dec(term);
         CheckAux := True; // set auxiliary var to indicate that temp is clipped
       end;

       if term > Cx2 then
       begin
         term := Cx2;
         CheckAux := True; // set auxiliary var to indicate that temp is clipped
       end;

       Inc(term);

       if Sy = -1 then
         yd := -yd;

       if Sx = -1 then
       begin
         xd := -xd;
         term := -term;
       end;

       Dec(Dx2, Dy2);

       if Swapped then
       begin
         PI := Sx * Width;
         P := @fData[yd + xd * Width];
       end
       else
       begin
         PI := Sx;
         Sy := Sy * Width;
         P := @fData[xd + yd * Width];
       end;

       // do we need to skip the last pixel of the line and is temp not clipped?
       if not (L or CheckAux) then
       begin
         if xd < term then
           Dec(term)
         else
           Inc(term);
       end;

       while xd <> term do
       begin
         Inc(xd, Sx);

         P^ := Value;
         Inc(P, PI);
         if e >= 0 then
         begin
           Inc(P, Sy);
           Dec(e, Dx2);
         end
         else
           Inc(e, Dy2);
       end; *)
  end;

  //ChangedEx(ChangedRect, AREAINFO_LINE + 2);
end;

procedure TDicomBitmap16.VertLineS(X, Y1, Y2: Integer; Value: Word);
var
  I, NH, NL: Integer;
  P: PWord;
begin
  if Y2 < Y1 then
    Exit;
  P := PixelPtr[X, Y1];
  I := Y2 - Y1 + 1;
  NH := I shr 2;
  NL := I and $03;
  for I := 0 to NH - 1 do
  begin
    P^ := Value;
    Inc(P, Width);

    P^ := Value;
    Inc(P, Width);

    P^ := Value;
    Inc(P, Width);

    P^ := Value;
    Inc(P, Width);
  end;
  for I := 0 to NL - 1 do
  begin
    P^ := Value;
    Inc(P, Width);
  end;
end;

function TDicomBitmap16.GetPixelS(X, Y: Integer): Word;
begin
  Result := fData[X + Y * Width];
end;

procedure TDicomBitmap16.SetPixelS(X, Y: Integer; const Value: Word);
begin
  FData[X + Y * Width] := Value;
end;

procedure TDicomBitmap16.HorzLineS(X1, Y, X2: Integer; Value: Word);
var
  i: Integer;
begin
  //FillLongword(fData[X1 + Y * Width], X2 - X1 + 1, Value);
  if X2 < X1 then
    Exit;
  for I := 0 to X2 - X1 - 1 do
  begin
    fData[X1 + Y * Width + i] := Value;
  end;
end;

function TDicomBitmap16.GetPixelPtr(X, Y: Integer): pWord;
begin
  Result := @fData[X + Y * Width];
end;

procedure TDicomBitmap16.SetDataBits(const Value: Integer);
begin
  if (FDataBits > 8) and (FDataBits <= 16) then
  begin
    FDataBits := Value;
    fMaxRange := 1 shl FDataBits - 1;
  end;
end;

function TDicomBitmap16.GetmaxRange: Integer;
begin
  Result := fMaxRange;
end;

end.

