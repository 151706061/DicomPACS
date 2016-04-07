unit DCM_ImageData_Bitmap;

interface
{$I DicomPack.inc}
uses
  {$IFDEF LINUX}Types, Libc, QControls, Qgraphics, {$ELSE}
  Windows, Messages, Forms, Controls, graphics, {$ENDIF}
  SysUtils, Classes, {$IFDEF DICOMDEBUX1}DbugIntf, {$ENDIF}
  CnsMsg, DCM_Dict, DCM_UID, DcmImageConvert, DCM_MemTable,
  DCM_Attributes, math, dialogs;

procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);

procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);

procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);

procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);

procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);
procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TBitmap);
procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TBitmap; ADisplayWLLabel: Boolean);

procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ARight, ABottom: Boolean);

procedure myTextOut(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; AMode: TDisplayArea; ARow:
  Integer; AText: AnsiString);

function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TBitmap; WithLabel: Boolean = true): Boolean;
function AssignToBitmapDefault(ADicomImage: TDicomImage; ABitmapEx: TBitmap; WithLabel: Boolean = true): Boolean;

procedure DrawBitmapTo(ADicomImage: TDicomImage; ABitmap: TBitmap; ARect: TRect);

procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);

procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Dest: TBitmap; Zoom: Single = 1; AXOff: Integer = 0;
  AYOff: Integer = 0);

procedure DrawMeasureReport(ADicomImage: TDicomImage; Dest: TCanvas; AOffX, AOffY: Double);

/////////////TDicomDrawObject

procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer; ACanvas: TCanvas);
procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawSelectGrip(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawCycleROI(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawVitexObject(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawCycle(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TCanvas; AFontSize: Integer);
procedure DrawPerpendicularityLine(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawSolidRect(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawLCA_RCA(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
//procedure DrawQuantitativeCoronaryAnaliysis(ADrawObject:TDicomDrawObject;ACanvas: TCanvas);
procedure DrawVentricular(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TCanvas; ARect: TRect; AFontSize: Integer);
procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TCanvas; ARect: TRect);

/////////////////TDicomDrawObjects
procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TCanvas; ARect: TRect; ADisplayCalcText: Boolean;
  ACurrentFrameIndex, AFontSize: Integer);

procedure _MorphFilter(bitmap: TBitmap; WindowSize: integer; op: integer; fSelx1, fSely1, fSelx2,
  fSely2: integer);
procedure _ApplyFilter(bitmap: TBitmap; filter: TGraphFilter; fSelx1, fSely1, fSelx2, fSely2:
  integer);

procedure DrawLineInserting(ACanvas: TCanvas; X1, Y1, X2, Y2: integer); overload;
procedure DrawBoxInserting(ACanvas: TCanvas; X1, Y1, X2, Y2: integer); overload;
procedure DrawArrowInserting(ACanvas: TCanvas; X1, Y1, X2, Y2: integer);
procedure DrawCycleInserting(ACanvas: TCanvas; X1, Y1, X2, Y2: integer); overload;

implementation

procedure DrawLineInserting(ACanvas: TCanvas; X1, Y1, X2, Y2: integer);
begin
  with ACanvas do
  begin
    //    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    moveto(X1, Y1);
    lineto(X2, Y2);
  end;
end;

procedure DrawCycleInserting(ACanvas: TCanvas; X1, Y1, X2, Y2: integer);
begin
  with ACanvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    moveto(X1, Y1);
    lineto(X2, Y2);
    Ellipse(X1, Y1, X2, Y2);
  end;
end;

procedure DrawArrowInserting(ACanvas: TCanvas; X1, Y1, X2, Y2: integer);
var
  pp: array[1..3] of TPoint;
  M, N, L, angleA, angleB: Double;
  //  strs: TStringList;
  sh: integer;
  fArrowThicknessRate: Word; // 1 to ...   一般为奇数倍
  fArrowHeadLengthRate: Word; // 1 to ...
  fLineWidth: Word; // 1 to ...
begin
  with ACanvas do
  begin
    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
  end;
  ACanvas.MoveTo(x1, y1);
  ACanvas.LineTo(x2, y2);

  if (abs(x1 - x2) > 10) and (abs(y1 - y2) > 10) then
  begin
    fLineWidth := 1;

    sh := trunc(sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)));
    fArrowThicknessRate := sh div 4;
    if fArrowThicknessRate > 8 then
      fArrowThicknessRate := 8;
    fArrowHeadLengthRate := 2;

    M := fLineWidth * fArrowThicknessRate;
    L := M * fArrowHeadLengthRate;
    N := sqrt(M * M / 4 + L * L);
    if x1 <> x2 then
      angleA := Arctan((y2 - y1) / (x2 - x1))
    else
      angleA := PI / 2;
    angleB := Arctan(M / L / 2);
    // 如果需要反转，加3.1415
    if x2 > x1 then
      angleA := angleA - PI;
    pp[1].x := x2;
    pp[1].y := y2;
    pp[2].x := x2 + trunc(N * cos(angleA + angleB));
    pp[2].y := y2 + trunc(N * sin(angleA + angleB));
    pp[3].x := x2 + trunc(N * cos(angleA - angleB));
    pp[3].y := y2 + trunc(N * sin(angleA - angleB));

    ACanvas.MoveTo(pp[3].X, pp[3].Y);
    ACanvas.LineTo(pp[1].X, pp[1].Y);

    ACanvas.MoveTo(pp[2].X, pp[2].Y);
    ACanvas.LineTo(pp[1].X, pp[1].Y);

    ACanvas.MoveTo(x1 - 4, y1);
    ACanvas.LineTo(x1 + 4, y1);
    ACanvas.MoveTo(x1, y1 - 4);
    ACanvas.LineTo(x1, y1 + 4);
  end;
end;

procedure DrawBoxInserting(ACanvas: TCanvas; X1, Y1, X2, Y2: integer);
begin
  with ACanvas do
  begin
    //    pen.Mode := pmNot;
    pen.width := 1;
    pen.style := psSolid;
    moveto(X1, Y1);
    lineto(X1, Y2);
    lineto(X2, Y2);
    lineto(X2, Y1);
    lineto(X1, Y1);
  end;
end;

procedure _ApplyFilter(bitmap: TBitmap; filter: TGraphFilter;
  fSelx1, fSely1, fSelx2, fSely2: integer);
var
  x, y: integer;
  newbitmap: tbitmap;
  mxh: integer;
  l1, l2, l3: pRGBROW;
  px: pRGB;
  xl, xr, q, w: integer;
  multix: array[0..8, 0..255] of integer;
  inca, incb: integer;
  basea, baseb: pRGBROW;
  bitmapwidth1: integer;
begin
  if Bitmap.Pixelformat <> pf24bit then
    exit;
  fSelX2 := imin(fSelX2, bitmap.Width);
  dec(fSelX2);
  fSelY2 := imin(fSelY2, bitmap.Height);
  dec(fSelY2);
  if filter.divisor = 0 then
    filter.divisor := 1;
  // calcola multix
  with filter do
    for q := 0 to 255 do
    begin
      w := 0;
      for x := 0 to 2 do
        for y := 0 to 2 do
        begin
          multix[w][q] := Values[x][y] * q;
          inc(w);
        end;
    end;
  //
  newbitmap := tbitmap.create;
  newbitmap.PixelFormat := pf24bit;
  newbitmap.width := bitmap.Width;
  newbitmap.height := bitmap.height;
  mxh := bitmap.Height - 1;
  //  Progress.per1 := 100 / (fSelY2 - fSelY1 + 0.5);
  inca := integer(bitmap.scanline[1]) - integer(bitmap.scanline[0]);
  incb := integer(newbitmap.scanline[1]) - integer(newbitmap.scanline[0]);
  basea := bitmap.scanline[0];
  baseb := newbitmap.scanline[0];
  bitmapwidth1 := bitmap.width - 1;
  for y := fSely1 to fSely2 do
  begin
    l1 := PRGBROW(integer(basea) + inca * ilimit(y - 1, 0, mxh));
    l2 := PRGBROW(integer(basea) + inca * y);
    l3 := PRGBROW(integer(basea) + inca * ilimit(y + 1, 0, mxh));
    px := PRGB(integer(baseb) + incb * y + fSelX1 * 3);
    for x := fSelx1 to fSelx2 do
      with filter do
      begin
        xl := imax(x - 1, 0);
        xr := imin(x + 1, bitmapwidth1);
        px^.r := blimit((multix[0, l1[xl].r] + multix[1, l1[x].r] + multix[2, l1[xr].r] +
          multix[3, l2[xl].r] + multix[4, l2[x].r] + multix[5, l2[xr].r] +
          multix[6, l3[xl].r] + multix[7, l3[x].r] + multix[8, l3[xr].r]) div Divisor);
        px^.g := blimit((multix[0, l1[xl].g] + multix[1, l1[x].g] + multix[2, l1[xr].g] +
          multix[3, l2[xl].g] + multix[4, l2[x].g] + multix[5, l2[xr].g] +
          multix[6, l3[xl].g] + multix[7, l3[x].g] + multix[8, l3[xr].g]) div Divisor);
        px^.b := blimit((multix[0, l1[xl].b] + multix[1, l1[x].b] + multix[2, l1[xr].b] +
          multix[3, l2[xl].b] + multix[4, l2[x].b] + multix[5, l2[xr].b] +
          multix[6, l3[xl].b] + multix[7, l3[x].b] + multix[8, l3[xr].b]) div Divisor);
        inc(px);
      end;
  end;
  bitmap.canvas.copyrect(rect(fSelx1, fSely1, fSelx2 + 1, fSely2 + 1), newbitmap.canvas,
    rect(fSelx1, fSely1, fSelx2, fSely2));
  newbitmap.Free;
end;

/////////////////////////////////////////////////////////////////////////////////////
// op:
//   0=maximum (dilation)
//   1=minimum (erosion)
//   2=open (erosion+dilation)
//   3=close (dilation+erosion)

procedure _MorphFilter(bitmap: TBitmap; WindowSize: integer;
  op: integer; fSelx1, fSely1, fSelx2, fSely2: integer);
var
  col, row, x, y, w, e, xx, yy, q1, q2, xxx, yyy: integer;
  e1: integer;
  ppx: pRGB;
  //  per1: double;
  graypix: pbyte;
  rgbpix: PRGB;
  ww, hh: integer;
  mm: byte;
  subop: integer; // 0=dilate 1=erode
  it: integer;
  canexit: boolean;
begin
  if Bitmap.Pixelformat <> pf24bit then
    exit;
  fSelX2 := imin(fSelX2, bitmap.Width);
  dec(fSelX2);
  fSelY2 := imin(fSelY2, bitmap.Height);
  dec(fSelY2);
  // alloc graypix and rgbpix
  ww := (fSelX2 - fSelX1 + 1);
  hh := (fSelY2 - fSelY1 + 1);
  getmem(graypix, (ww + 2) * hh);
  getmem(rgbpix, (ww + 2) * hh * 3);
  //
  q1 := -WindowSize;
  q2 := WindowSize;
  it := 0;
  canexit := false;
  subop := 0;
  //  per1 := 0;
  repeat
    if op < 2 then
    begin
      subop := op;
      canexit := true;
      //      per1 := 100 / (fSelY2 - fSelY1 + 0.5);
    end
    else
    begin
      if op = 2 then
      begin
        // open (erosion(1) + dilation(0))
//        per1 := 100 / (fSelY2 - fSelY1 + 0.5) / 2;
        if it = 0 then
          subop := 1
        else
        begin
          subop := 0;
          canexit := true;
        end;
      end
      else
        if op = 3 then
      begin
        // close (dilation(0) + erosion(1))
//          per1 := 100 / (fSelY2 - fSelY1 + 0.5) / 2;
        if it = 0 then
          subop := 0
        else
        begin
          subop := 1;
          canexit := true;
        end;
      end
      else
        break;
    end;
    // fill graypix and rgbpix
    y := 0;
    for row := fSelY1 to fSelY2 do
    begin
      ppx := bitmap.ScanLine[row];
      inc(ppx, fSelX1);
      x := 0;
      for col := fSelX1 to fSelX2 do
      begin
        with ppx^ do
          pbyte(integer(graypix) + y + x)^ := (r * 21 + g * 71 + b * 7) div 100;
        prgb(integer(rgbpix) + (y + x) * 3)^ := ppx^;
        inc(ppx);
        inc(x);
      end;
      inc(y, ww);
    end;
    //
    y := 0;
    for row := fsely1 to fsely2 do
    begin
      ppx := bitmap.ScanLine[row];
      inc(ppx, fSelX1);
      x := 0;
      case subop of
        0: // maximum
          for col := fselx1 to fselx2 do
          begin
            mm := 0;
            xxx := 0;
            yyy := 0;
            for yy := q1 to q2 do
            begin
              e := integer(graypix) + ilimit(y + yy, 0, hh - 1) * ww;
              for xx := q1 to q2 do
              begin
                w := pbyte(e + ilimit(x + xx, 0, ww - 1))^;
                if w > mm then
                begin
                  xxx := xx;
                  yyy := yy;
                  mm := w;
                end;
              end;
            end;
            ppx^ := prgb(integer(rgbpix) + (ilimit(y + yyy, 0, hh - 1) * ww + ilimit(x + xxx, 0, ww
              - 1)) * 3)^;
            inc(x);
            inc(ppx);
          end;
        1: // minimum
          for col := fselx1 to fselx2 do
          begin
            mm := 255;
            xxx := 0;
            yyy := 0;
            for yy := q1 to q2 do
            begin
              e := integer(graypix) + ilimit(y + yy, 0, hh - 1) * ww;
              for xx := q1 to q2 do
              begin
                w := pbyte(e + ilimit(xx + x, 0, ww - 1))^;
                if w < mm then
                begin
                  xxx := xx;
                  yyy := yy;
                  mm := w;
                end;
              end;
            end;
            ppx^ := prgb(integer(rgbpix) + (ilimit(y + yyy, 0, hh - 1) * ww + ilimit(x + xxx, 0, ww
              - 1)) * 3)^;
            inc(x);
            inc(ppx);
          end;
      end;
      inc(y);
    end;
    inc(it);
  until canexit;
  //
  freemem(graypix);
  freemem(rgbpix);
end;

///TDicomImage/////////////////////////////////////////////////////////////////

procedure DrawBitmapTo(ADicomImage: TDicomImage; ABitmap: TBitmap; ARect: TRect);
var
  bm1: TBitmap;
  i1, i2: Integer;
  pb2: PByte;
  pw2: PWord;
  DestScanLine, pixeldata: pRGB;
  d1: TDicomImageData;
begin
  d1 := ADicomImage.ImageData[ADicomImage.BaseFrameIndex + ADicomImage.CurrentFrame];
  bm1 := TBitmap.Create;
  try
    bm1.Width := ARect.Right - ARect.Left;
    bm1.Height := ARect.Bottom - ARect.Top;
    bm1.PixelFormat := pf24bit;
    bm1.Canvas.StretchDraw(Rect(0, 0, bm1.Width - 1, bm1.Height - 1), ABitmap);
    if (ADicomImage.PhotometricInterpretation = 'RGB') or (d1.ColorSpaceIsConverted) then
    begin
      pixeldata := d1.Data;

      inc(pixeldata, ARect.Top * ADicomImage.Width);
      for I1 := 0 to bm1.Height - 1 do // Iterate
      begin
        DestScanLine := bm1.ScanLine[i1];
        inc(pixeldata, ARect.Left);
        for I2 := 0 to bm1.Width - 1 do // Iterate
        begin
          pixeldata^.b := DestScanline^.b;
          pixeldata^.g := DestScanline^.g;
          pixeldata^.r := DestScanline^.r;
          inc(DestScanline);
          inc(pixeldata);
        end;
        if ADicomImage.Width - ARect.Right > 0 then
          inc(pixeldata, ADicomImage.Width - ARect.Right);
      end;
    end
    else
      if (Copy(ADicomImage.PhotometricInterpretation, 1, 4) = 'MONO') then
    begin
      if (ADicomImage.Bits > 8) then
      begin
        pw2 := d1.Data;

        if ARect.Top <> 0 then
          inc(pw2, ARect.Top * ADicomImage.Width);
        for I1 := 0 to bm1.Height - 1 do // Iterate
        begin
          DestScanLine := bm1.ScanLine[i1];
          inc(pw2, ARect.Left);
          for I2 := 0 to bm1.Width - 1 do // Iterate
          begin
            pw2^ := DestScanLine^.g;
            inc(DestScanLine);
            inc(pw2);
          end;
          if ADicomImage.Width - ARect.Right > 0 then
            inc(pw2, ADicomImage.Width - ARect.Right);
        end;

      end
      else
      begin
        pb2 := d1.Data;

        inc(pb2, ARect.Top * ADicomImage.Width);
        for I1 := 0 to bm1.Height - 1 do // Iterate
        begin
          DestScanLine := bm1.ScanLine[i1];
          inc(pb2, ARect.Left);
          for I2 := 0 to bm1.Width - 1 do // Iterate
          begin
            pb2^ := DestScanLine^.g;
            inc(DestScanLine);
            inc(pb2);
          end;
          if ADicomImage.Width - ARect.Right > 0 then
            inc(pb2, ADicomImage.Width - ARect.Right);
        end;

      end;
    end;
  finally
    bm1.Free;
  end;
end;

function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TBitmap; WithLabel: Boolean): Boolean;
var
  x1, y1: Integer;
  d1, d2: TDicomImageData;
  ABitmap: TBitmap;
  lCen, lWid: integer;
  lRange, min16, max16: integer;
  //  lScaleShl10: Single;
  nn: Boolean;
  {$IFDEF FOR_TRIAL_VERSION}
  function IsIDERuning: Boolean;
  begin
    Result := (FindWindow('TAppBuilder', nil) <> 0) or
      (FindWindow('TPropertyInspector', nil) <> 0) or
      (FindWindow('TAlignPalette', nil) <> 0);
  end;
  {$ENDIF}

begin
  {$IFDEF FOR_TRIAL_VERSION}
  if not IsIDERuning then
  begin
    ShowMessage('You are use trial dicomvcl. Please open http://www.dicomvcl.com.');
    //Application.Terminate;
  end;
  //ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
  {$ENDIF}
  if ADicomImage=nil then
  begin
    Result:=False;
    Exit;
  end;
  
  d1 := ADicomImage.ImageData[ADicomImage.BaseFrameIndex + ADicomImage.CurrentFrame];
  Result := ADicomImage.DecompressData(ADicomImage.BaseFrameIndex + ADicomImage.CurrentFrame);
  if not Result then
    exit;
  if ADicomImage.AspectRatio = 1 then
  begin
    ABitmap := ABitmapEx;
  end
  else
  begin
    ABitmap := TBitmap.Create;
  end;

  if ADicomImage.WindowWidth = 0 then
  begin
    ADicomImage.WindowWidth := (d1.MaxValue - d1.MinValue);
    ADicomImage.WindowCenter := d1.MinValue + ADicomImage.WindowWidth div 2;
  end;

  lCen := Trunc((ADicomImage.WindowCenter - ADicomImage.RescaleIntercept) / ADicomImage.RescaleSlope);
  lWid := abs(trunc((ADicomImage.WindowWidth / ADicomImage.RescaleSlope) / 2));

  min16 := lCen - lWid;
  max16 := lCen + lWid;
  lRange := (max16 - min16);

  if lRange = 0 then
    exit;
  //  lScaleShl10 := 255 / lRange;
  nn := ADicomImage.Negative xor (ADicomImage.PhotometricInterpretation = 'MONOCHROME1');

  if (ABitmap.Width <> ADicomImage.Width) or (ABitmap.Height <> ADicomImage.Height) then
  begin
    //      ABitmap.Width := 1;
    //      ABitmap.Height := 1;
    ABitmap.PixelFormat := pf24bit;
    ABitmap.Width := ADicomImage.Width;
    ABitmap.Height := ADicomImage.Height;
  end;

  if ADicomImage.SamplePerPixel = 1 then //(Copy(PhotometricInterpretation, 1, 4) = 'MONO') then
  begin
    if (ADicomImage.Bits > 8) then
    begin
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarRGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarRGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
          else
            vImageConvert_Planar16StoPlanarRGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end;
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarRGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarRGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100)
          else
            vImageConvert_Planar16StoPlanarRGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
        end;
      end
      else
      begin
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarRGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarRGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
          else
            vImageConvert_Planar16StoPlanarRGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end;
      end;
    end
    else
    begin
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        vImageConvert_Planar8toPlanarRGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        vImageConvert_Planar8toPlanarRGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
      end
      else
        vImageConvert_Planar8toPlanarRGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
    end;
  end
  else
    //  if (PhotometricInterpretation = 'RGB') or (d1.fColorSpaceIsConverted) then
  begin
    //vImageConvert_PlanarRGBtoPlanarRGB(d1.Data, width, height, ABitmap.ScanLine[Height - 1], width, height, max16, min16, fCustomPalette, nn);
    case ADicomImage.PlanarConfiguration of
      0:
        vImageConvert_PlanarRGBtoPlanarRGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      1:
        vImageConvert_PlanarRGB_PlanarConfiguration1_toPlanarRGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      2:
        vImageConvert_PlanarRGB_PlanarConfiguration2_toPlanarRGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
    end;
  end;

  //  DrawTopoLine(ABitmap,1);

  {$IFDEF FOR_TENFENG_MR}
  //  DrawTopoLineTF(ABitmap);
  {$ENDIF}

  if WithLabel then
  begin
    if ADicomImage.InformationLabels.Count > 0 then
      DrawInformationLabels(ADicomImage, ABitmap, true)
    else
    begin
      OverlayLabels(ADicomImage, ABitmap.Canvas, ABitmap.Width, ABitmap.Height, true);
      //OverlayLabels(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, ADisplayWLLabel);
    end;
    //  DrawUserLabels(ABitmap);
  end
    //else
    //   DisplayCommonListForVR(ABitmap)
    ;
  {$IFDEF FOR_TRIAL_VERSION}
  begin
    ABitmap.Canvas.Font.Color := clRed;
    //    ABitmap.Canvas.Font.Size := 18;

    if Min(ABitmap.Width, ABitmap.Height) <= 512 then
      ABitmap.Canvas.Font.Size := 9
    else
      if Min(ABitmap.Width, ABitmap.Height) <= 1024 then
      ABitmap.Canvas.Font.Size := 12
    else
      if Min(ABitmap.Width, ABitmap.Height) <= 1600 then
      ABitmap.Canvas.Font.Size := 18
    else
      ABitmap.Canvas.Font.Size := 36;

    ABitmap.Canvas.TextOut((ABitmap.Width - ABitmap.Canvas.TextWidth(UserHospitalName)) shr 1, 2,
      UserHospitalName);
  end;
  {$ENDIF}
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    x1 := ADicomImage.Attributes.getInteger($2811, $20E);
    y1 := ADicomImage.Attributes.getInteger($2811, $20F);
    if (x1 <> 0) and (y1 <> 0) then
    begin
      ABitmap.Canvas.Brush.Color := clRed;
      ABitmap.Canvas.Ellipse(Rect(x1 - 20, y1 - 20, x1 + 20, y1 + 20));
      //ABitmap.Canvas.FillRect(Rect(x1 - 20, y1 - 20, x1 + 20, y1 + 20));
    end;
  end;

  if ADicomImage.AspectRatio <> 1 then
  begin

    if not ADicomImage.MPRMode then
    begin
      ABitmapEx.Width := trunc(ADicomImage.Width / ADicomImage.AspectRatio);
      ABitmapEx.Height := ADicomImage.height;
    end
    else
    begin
      ABitmapEx.Width := ADicomImage.Width;
      ABitmapEx.Height := trunc(ADicomImage.height * ADicomImage.AspectRatio);
    end;

    ABitmapEx.Canvas.Lock;
    ABitmap.Canvas.Lock;
    try
      ABitmapEx.Canvas.StretchDraw(Rect(0, 0, ABitmapEx.Width, ABitmapEx.Height), ABitmap);
    finally
      ABitmap.Canvas.UnLock;
      ABitmapEx.Canvas.UnLock;
    end;
    ABitmap.Free;
  end;
end;

function AssignToBitmapDefault(ADicomImage: TDicomImage; ABitmapEx: TBitmap; WithLabel: Boolean = true): Boolean;
var
  w1, c1: Integer;
  da1: TDicomAttribute;
  {v1,} {h1,} inv1: Boolean;
//  r1: Integer;
begin
  w1 := ADicomImage.WindowWidth;
  c1 := ADicomImage.WindowCenter;
  inv1 := ADicomImage.Negative;

  da1 := ADicomImage.Attributes.Item[$2809, $2000];
  if assigned(da1) then
    ADicomImage.WindowCenter := (da1.AsInteger[0]);
  if ADicomImage.WindowCenter = 0 then
  begin
    da1 := ADicomImage.Attributes.Item[$28, $1050];
    if assigned(da1) then
    begin
      ADicomImage.WindowCenter := (da1.AsInteger[0]);
    end;
  end;

  da1 := ADicomImage.Attributes.Item[$2809, $2001];
  if assigned(da1) then
    ADicomImage.WindowWidth := (da1.AsInteger[0]);
  if ADicomImage.WindowWidth = 0 then
  begin
    da1 := ADicomImage.Attributes.Item[$28, $1051];
    if assigned(da1) then
      ADicomImage.WindowWidth := (da1.AsInteger[0]);
  end;

  ADicomImage.Negative := false;

  try
    AssignToBitmap(ADicomImage, ABitmapEx, WithLabel);
  finally
    ADicomImage.WindowWidth := w1;
    ADicomImage.WindowCenter := c1;
    ADicomImage.Negative := inv1;
  end;
end;

procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Dest: TBitmap; Zoom: Single = 1; AXOff: Integer =
  0; AYOff: Integer = 0);
var
  da1, da2, da3: TDicomAttribute;
  das: TDicomAttributes;
  i: integer;
  R: TRect;
begin
  if not assigned(ADicomImage.Attributes) then
    exit;
  ADicomImage.UpdateCood(0, 0, 0, 0, 1, ADicomImage.PixelSpacingX, ADicomImage.PixelSpacingY);
  DrawAll(ADicomImage.DrawObjects, Dest.Canvas, Rect(0, 0, ADicomImage.width, ADicomImage.Height), false, -1, ADicomImage.CalFontSpacing(Dest.Width, Dest.Height));

  da1 := ADicomImage.Attributes.Item[$2815, 1];
  if assigned(da1) then
  begin
    for i := 0 to da1.GetCount - 1 do
    begin
      das := da1.Attributes[i];
      if not assigned(das) then
        continue;
      da2 := das.Item[$2815, $2];
      da3 := das.Item[$2815, $3];
      if assigned(da2) and assigned(da3) then
      begin
        R := Rect(da2.AsInteger[0], da3.AsInteger[0], da2.AsInteger[1], da3.AsInteger[1])
      end
      else
        continue;
      case das.getInteger($2815, $A) of
        8:
          begin
            //Obj1 := TVRBoxlayer.Create(Layers);
            Dest.Canvas.Brush.Color := clRed;
            Dest.Canvas.FillRect(R);
          end;
        2:
          begin
            //            Obj1 := TArrowlayer.Create(Layers);
            //            TArrowlayer(Obj1).Text := das.getString($2815, $9);

          end;
        3:
          begin
            //            Obj1 := TROILayer.Create(Layers);
            //            TROILayer(obj1).OnCalROI := DoROILayerCal;
            Dest.Canvas.Brush.Color := clRed;
            Dest.Canvas.FillRect(R);
          end;
        9:
          begin
            //            Obj1 := TRulerLayer.Create(Layers);

          end;
        5:
          begin
            //            Obj1 := TBitmapLayer.Create(Layers);

          end;
        6:
          begin
            //            Obj1 := TAngleLayer.Create(Layers);
            //            da2 := das.Item[$2815, $3];
            //            TAngleLayer(obj1).AnglePoint := FloatPoint(da2.AsInteger[0], da2.AsInteger[1]);
          end;
        7:
          begin
            //            Obj1 := TPolyLayer.Create(Layers);
            {            da2 := das.Item[$2815, $3];
                        TPolyLayer(obj1).SetPolygonLength(da2.GetCount div 2);
                        for k := 0 to da2.GetCount div 2 - 1 do
                        begin
                          TPolyLayer(obj1).Polygon[k].X := da2.AsInteger[k * 2 + 0];
                          TPolyLayer(obj1).Polygon[k].Y := da2.AsInteger[k * 2 + 1];
                        end;}
          end;
        1:
          begin
            //            Obj1 := TBOXLayer.Create(Layers);
            Dest.Canvas.Brush.Color := clRed;
            Dest.Canvas.FillRect(R);
          end;
      else
        continue;
      end;
    end;
  end;
end;

procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);
var
  str1, str2: AnsiString;
  //  k: integer;
begin
  ADicomImage.CalFontSpacing(AWidth, AHeight);

  Dest.Font.Name := cns_FormDefaultFontName;
  Dest.Brush.Style := bsClear;
  Dest.Font.Size := ADicomImage.FontSpacing;
  if ADicomImage.Negative then
    Dest.Font.Color := clBlack
  else
    Dest.Font.Color := clWhite;

  //if FInformationLabels.Count > 0 then
  //  DrawInformationLabels(Dest, AWidth, AHeight)
  //else
  begin
    if ADicomImage.FrameCount > 1 then
      DisplayCommonList(ADicomImage, Dest, AWidth, AHeight, ADisplayWLLabel)
    else
    begin
      str1 := ADicomImage.Attributes.GetString(8, $60);
      str2 := ADicomImage.Attributes.GetString(8, $70);

      if str1 = 'MR' then
      begin

        if Copy(Str2, 1, 2) = 'GE' then
          DisplayCommonListGEMR(ADicomImage, Dest, AWidth, AHeight, ADisplayWLLabel)
        else
          DisplayCommonListSIMR(ADicomImage, Dest, AWidth, AHeight, ADisplayWLLabel);
      end
      else
        if str1 = 'CT' then
        DisplayCommonListSI(ADicomImage, Dest, AWidth, AHeight, ADisplayWLLabel)
      else
        DisplayCommonList(ADicomImage, Dest, AWidth, AHeight, ADisplayWLLabel);

    end;
  end;
  //DrawImageScale(Dest, AWidth, AHeight);
  //DrawImagePosition
end;

procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TBitmap);
begin

end;

procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TBitmap; ADisplayWLLabel: Boolean);
var
  i: Integer;
  v1: TDicomInformationLabel;
  str1: AnsiString;
begin
  for I := 0 to ADicomImage.InformationLabels.Count - 1 do // Iterate
  begin
    v1 := TDicomInformationLabel(ADicomImage.InformationLabels[i]);
    str1 := v1.GetText(ADicomImage.Attributes);
    case v1.Position of
      //daLeftTop, daLeftBottom, daRightTop, daRightBottom, daCenterTop, daCenterBottom
      1: myTextOut(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, daLeftTop, v1.OrderID, str1);
      2: myTextOut(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, daLeftBottom, v1.OrderID, str1);
      3: myTextOut(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, daRightTop, v1.OrderID, str1);
      4: myTextOut(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, daRightBottom, v1.OrderID, str1);
      5: myTextOut(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, daCenterTop, v1.OrderID, str1);
      6: myTextOut(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, daCenterBottom, v1.OrderID, str1);
    end;
  end;
  {$IFDEF FOR_TRIAL_VERSION}
  myTextOut(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  myTextOut(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}

  if ADisplayWLLabel then
    myTextOut(ADicomImage, Dest.Canvas, Dest.Width, Dest.Height, daRightBottom, 1, Format('W = %5d  L = %5d', [ADicomImage.WindowWidth, ADicomImage.WindowCenter]));
  //  myTextOut(ADicomImage,Dest, daRightBottom, 2, 'Z: ' + Floattostrf(ViewerZoom * 100, ffFixed, 15, 0) + '%');
end;

procedure myTextOut(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; AMode: TDisplayArea; ARow:
  Integer; AText: AnsiString);
var
  xx, yy, hh, ww: Integer;
  str1: AnsiString;
begin

  if AText <> '' then
  begin
    str1 := FilterISO1022(AText);

    Dest.Font.Size := ADicomImage.FontSpacing;
    hh := Dest.TextHeight(str1);
    ww := Dest.TextWidth(str1);
    case AMode of //
      daLeftTop:
        begin //left top
          xx := 6;
          yy := hh * (ARow - 1);
        end;
      daLeftBottom:
        begin //left bottom
          xx := 6;
          yy := Aheight - hh * (ARow + 1);
        end;
      daRightTop:
        begin //right top
          xx := AWidth - ww - 6;
          yy := hh * (ARow - 1);
        end;
      daRightBottom:
        begin //right t
          xx := AWidth - ww - 6;
          yy := Aheight - hh * (ARow + 1);
        end;
    end; // case

    Dest.Brush.Style := bsClear;
    Dest.Font.Color := clWhite;
    Dest.TextOut((xx), (yy), str1);
    Dest.Font.Color := clBlack;
    Dest.TextOut((xx) + 1, (yy) + 1, str1);
  end;
end;

procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);
begin
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 1, Format('%s %s %s', [
    ADicomImage.Attributes.GetString($10, $10),
      ADicomImage.Attributes.GetString($10, $40), ADicomImage.Attributes.GetString($10, $1010)]));
  //  myTextOut(ADicomImage,Dest, daLeftTop, 1, Attributes.GetString($10, $10));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 3, ADicomImage.Attributes.GetString($20, $10));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $20));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $30));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 6, 'IMA ' + ADicomImage.Attributes.GetString($20, $13));
  if ADicomImage.Attributes.ImageData.FrameCount > 1 then
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 7, 'FRAME ' +
      IntToStr(ADicomImage.Attributes.ImageData.CurrentFrame));

  {$IFDEF FOR_TRIAL_VERSION}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  myTextOut(ADicomImage,Dest, AWidth, AHeight, daRightTop, 1, Attributes.GetString(8, $80));
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 3, ADicomImage.Attributes.GetString($18, $15));
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 4, ADicomImage.Attributes.GetString($8, $103E));
  end
  else
  begin
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 3, ADicomImage.Attributes.GetString($8, $1090));
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 4, ADicomImage.Attributes.GetString($18, $1020));
  end;

  if ADisplayWLLabel then
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' +
      inttostr(ADicomImage.WindowCenter));
end;

procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);
  function Delete0FromAge(AStr: AnsiString): AnsiString;
  var
    i: Integer;
  begin
    Result := AStr;
    for i := 1 to Length(Result) do
    begin
      if Result[1] = '0' then
        Delete(Result, 1, 1)
      else
        exit;
    end;
  end;
begin
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 1, ADicomImage.Attributes.GetString(8, $1090));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 2, 'Ex:' + ADicomImage.Attributes.GetString($20, $10));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 3, 'Se:' + ADicomImage.Attributes.GetString($20, $11));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 5, 'Im:' + ADicomImage.Attributes.GetString($20, $13));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 6, FormatFloat('DFOV:#.00cm', ADicomImage.PixelSpacingX *
    ADicomImage.Width));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 7, ADicomImage.Attributes.GetString($18, $1210));

  {$IFDEF FOR_TRIAL_VERSION}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  myTextOut(ADicomImage,Dest, AWidth, AHeight, daRightTop, 1, Attributes.GetString(8, $80));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 3, ADicomImage.Attributes.GetString($10, $10));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 4, ADicomImage.Attributes.GetString($10, $40) + ' ' +
    Delete0FromAge(ADicomImage.Attributes.GetString($10, $1010)) + ' ' +
    ADicomImage.Attributes.GetString($10, $20));
  //    MyTextOut(daRightTop, 4, AImageData.Attributes.GetString(8, $23));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 5, ADicomImage.Attributes.GetString(8, $20));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 6, 'kV:' + ADicomImage.Attributes.GetString($18, $60));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 5, 'mA:' + ADicomImage.Attributes.GetString($18, $1151));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 4, ADicomImage.Attributes.GetString($18, $50) + 'mm');
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 3, 'Tilt:' + ADicomImage.Attributes.GetString($18, $1120));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 2, ADicomImage.Attributes.GetString($8, $30));
  //    MyTextOut(daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  if ADisplayWLLabel then
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' +
      inttostr(ADicomImage.WindowCenter));
  //  myTextOut(ADicomImage,Dest,daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);
var
  da1, da2: TDicomAttribute;
  str1: AnsiString;
begin
  str1 := ADicomImage.Attributes.GetString($10, $1010);
  if str1 = '' then
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10))
  else
  begin
    {$IFDEF SHOW_ALL_PATIENT_INFO}
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10,
        $10), ADicomImage.Attributes.GetString($10, $40), str1]));
    {$ELSE}
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
    {$ENDIF}
  end;

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 3, ADicomImage.Attributes.GetString($10, $30));
  if assigned(ADicomImage.Attributes.Item[8, $22]) then
  begin
    //    myTextOut(ADicomImage,Dest, AWidth, AHeight, daLeftTop, 1, Attributes.GetString($10, $10));
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $22));
  end
  else
  begin
    //    myTextOut(ADicomImage,Dest, AWidth, AHeight, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $10),
    //      Attributes.GetString($10, $40), Attributes.GetString($10, $1010)]));
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $23));
  end;

  //  myTextOut(ADicomImage,Dest, daLeftTop, 4, Attributes.GetString($8, $22));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $32));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 6, 'TP ' + ADicomImage.Attributes.GetString($20, $1041));
  if assigned(ADicomImage.Attributes.Item[$20, $13]) then
  begin
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 7, 'IMA ' + ADicomImage.Attributes.GetString($20, $13));
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 8, 'SEQ ' + ADicomImage.Attributes.GetString($20, $11));
  end
  else
  begin
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 7, 'IMA ' + ADicomImage.Attributes.GetString($20, $12));
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 8, 'SEQ ' + ADicomImage.Attributes.GetString($20, $11));
  end;
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 9, ADicomImage.Attributes.GetString($8, $103E));

  {$IFDEF FOR_TRIAL_VERSION}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  myTextOut(ADicomImage,Dest, AWidth, AHeight, daRightTop, 1, ADicomImage.Attributes.GetString(8, $80));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 3, ADicomImage.Attributes.GetString($8, $1090));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 4, ADicomImage.Attributes.GetString($18, $1020));
  //    MyTextOut(daRightTop, 4, Attributes.GetString(8, $20));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 8, Format('kV %s', [ADicomImage.Attributes.GetString($18,
      $60)]));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 7, Format('mA %s', [ADicomImage.Attributes.GetString($18,
      $1151)]));
  if ADicomImage.Attributes.GetString($18, $50) <> '' then
  begin
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 6, Format('Ti %6.1f',
      [DicomStrToFloat(ADicomImage.Attributes.GetString($18, $50))]));
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 5, Format('GT %6.1f',
      [DicomStrToFloat(ADicomImage.Attributes.GetString($18, $1120))]));
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 4, Format('SL %6.1f',
      [DicomStrToFloat(ADicomImage.Attributes.GetString($18, $50))]));
  end;
  da1 := ADicomImage.Attributes.Item[$21, $1011];
  da2 := ADicomImage.Attributes.Item[$21, $1120];
  if assigned(da1) and assigned(da2) then
  begin
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 3, Format('%4.0f  %4.0f/%4.0f', [da2.AsFloat[0],
      da1.AsFloat[0], da1.AsFloat[1]]));
  end;
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 2, ADicomImage.Attributes.GetString($18, $1210));
  //  myTextOut(ADicomImage,Dest, daLeftBottom, 2, 'AH40UL0');
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 1, '001 940');
  //    myTextOut(ADicomImage,Dest,daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  if ADisplayWLLabel then
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' +
      inttostr(ADicomImage.WindowCenter));
  //    MyTextOut(daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);
var
  da1: TDicomAttribute;
begin
  {$IFDEF SHOW_ALL_PATIENT_INFO}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 1, Format('%s %sT %s', [ADicomImage.Attributes.GetString($8,
      $1090), ADicomImage.Attributes.GetString($18, $87), ADicomImage.Attributes.GetString($8, $1010)]));
  {$ELSE}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
  {$ENDIF}

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 2, 'Ex: ' + ADicomImage.Attributes.GetString($20, $10));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 3, 'Se: ' + ADicomImage.Attributes.GetString($20, $11));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 4, 'Im: ' + ADicomImage.Attributes.GetString($20, $13));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $103E));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 10, 'ET: ' + ADicomImage.Attributes.GetString($18, $91));

  {$IFDEF FOR_TRIAL_VERSION}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  myTextOut(ADicomImage,Dest, AWidth, AHeight, daRightTop, 1, Attributes.GetString(8, $80));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 3, ADicomImage.Attributes.GetString($10, $10));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 4, Format('%s %s %s', [
    ADicomImage.Attributes.GetString($10, $40),
      ADicomImage.Attributes.GetString($10, $1010), ADicomImage.Attributes.GetString($10, $20)]));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 6, ADicomImage.Attributes.GetString($8, $21));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 7, ADicomImage.Attributes.GetString($8, $31));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 8, 'Mag=' + ADicomImage.Attributes.GetString($18, $21));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 11, ADicomImage.Attributes.GetString($18, $20));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 10, Format('TR:%d', [ADicomImage.Attributes.GetInteger($18,
      $80)]));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 9, Format('TE:%s/Ef', [ADicomImage.Attributes.GetString($18,
      $81)]));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 8, Format('EC:%d/1 %dkHz',
    [ADicomImage.Attributes.GetInteger($18, $86), 11]));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 6, ADicomImage.Attributes.GetString($18, $1250));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 5, Format('FOV:%dx%d', [
    trunc(ADicomImage.Width * ADicomImage.Attributes.ImageData.PixelSpacingX), trunc(ADicomImage.height *
      ADicomImage.Attributes.ImageData.PixelSpacingY)]));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 4, '5.0thk/1.0sp');
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 3, Format('15/4:%d', [ADicomImage.Attributes.GetInteger($18,
      $95)]));
  //  myTextOut(ADicomImage,Dest, AWidth, AHeight, daLeftBottom, 3, '15/4:47');
  da1 := ADicomImage.Attributes.Item[$18, $1310];
  if assigned(da1) and (da1.GetCount > 0) then
  begin
    if da1.AsInteger[0] = 0 then
      myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 2, Format('%d*%d/4 NEX', [da1.AsInteger[1],
        da1.AsInteger[2]]))
    else
      myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 2, Format('%d*%d/4 NEX', [da1.AsInteger[0],
        da1.AsInteger[3]]));
  end;
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 1, ADicomImage.Attributes.GetString($18, $22));

  if ADisplayWLLabel then
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightBottom, 1, Format('W = %5d  L = %5d', [ADicomImage.WindowWidth,
      ADicomImage.WindowCenter]));
end;

procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ADisplayWLLabel: Boolean);
var
  str1: string;
begin
  {$IFDEF SHOW_ALL_PATIENT_INFO}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10,
      $10), ADicomImage.Attributes.GetString($10, $40), ADicomImage.Attributes.GetString($10, $1010)]));
  {$ELSE}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
  {$ENDIF}

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 3, ADicomImage.Attributes.GetString($10, $30));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $23));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $33));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 6, 'IMAGE ' + ADicomImage.Attributes.GetString($20, $13));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 7, 'SPI ' + ADicomImage.Attributes.GetString($20, $11));
  if ADicomImage.Attributes.GetString($18, $1250) <> '' then
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 8, ADicomImage.Attributes.GetString($18, $1250))
  else
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftTop, 8, ADicomImage.Attributes.GetString($8, $103E));

  {$IFDEF FOR_TRIAL_VERSION}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  myTextOut(ADicomImage,Dest, AWidth, AHeight, daRightTop, 1, Attributes.GetString(8, $80));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 3, ADicomImage.Attributes.GetString($8, $1090));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightTop, 4, ADicomImage.Attributes.GetString($18, $1020));
  //    MyTextOut(daRightTop, 4, Attributes.GetString(8, $20));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 8, ADicomImage.Attributes.GetString($18, $24));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 7, '  *');

  //  myTextOut(ADicomImage,Dest, daLeftBottom, 5, 'TR ' + Attributes.GetString($18, $60));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 5, Format('TR %8d', [ADicomImage.Attributes.GetInteger($18,
      $80)]));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 4, Format('TE %6d/1', [ADicomImage.Attributes.GetInteger($18,
      $81)]));
  //myTextOut(ADicomImage,Dest, AWidth, AHeight, daLeftBottom, 3, Format('TA    01:46',
  //  [Attributes.GetInteger($18, $50)]));
  //myTextOut(ADicomImage,Dest, AWidth, AHeight, daLeftBottom, 2, Format('AC          1',
  //  [Attributes.GetInteger($18, $1120)]));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 3, Format('FA: %s TI: %s', [ADicomImage.Attributes.GetString($18, $1314), ADicomImage.Attributes.GetString($18, $82)]));

  str1 := ADicomImage.Attributes.GetString($18, $1312);
  if str1 = 'ROW' then
    str1 := '←→'
  else
    if str1 = 'COL' then
    str1 := '↑↓';
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 2, Format('PE: %s', [str1]));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daLeftBottom, 1, '                      ' +
    ADicomImage.Attributes.GetString($20, $4000));
  //    MyTextOut(daLeftBottom, 1, 'SL ' + Attributes.GetString($18, $1120));
      //    MyTextOut(daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightBottom, 7, Format('SP%15.1f',
    [DicomStrToFloat(ADicomImage.Attributes.GetString($20, $1041))]));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightBottom, 6, Format('SL%15.1f',
    [DicomStrToFloat(ADicomImage.Attributes.GetString($18, $50))]));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightBottom, 5, Format('FoV%5d*%5d', [
    trunc(ADicomImage.Width * ADicomImage.Attributes.ImageData.PixelSpacingX * 10), trunc(ADicomImage.height *
      ADicomImage.Attributes.ImageData.PixelSpacingY * 10)]));
  //  myTextOut(ADicomImage,Dest, daRightBottom, 5, Format('FoV%5d*%5d', [FWidth, Fheight]));
    //  myTextOut(ADicomImage,Dest, daRightBottom, 4, '   ' + Attributes.GetString($18, $60));
  myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightBottom, 3, Format('Tra>Cor    -10',
    [ADicomImage.Attributes.GetString($18, $60)]));

  if ADisplayWLLabel then
    myTextOut(ADicomImage, Dest, AWidth, AHeight, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' +
      inttostr(ADicomImage.WindowCenter));
  //    MyTextOut(daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TCanvas; AWidth, AHeight: Integer; ARight, ABottom: Boolean);
var
  x, y, mh, mw, cw, ch, kk: Integer;
  kh, kw, ny, nx, z1, x1: Double;
  str1, str2: AnsiString;
  //    k1: Integer;
  da1: TDicomAttribute;
  f1: Double;
begin
  if (ADicomImage.PixelSpacingY <> 0) then
  begin
    ny := ADicomImage.PixelSpacingY;
    nx := ADicomImage.PixelSpacingX;
  end
  else
  begin
    ny := 0.05;
    nx := 0.05;
  end;
  f1 := Min(AWidth / ADicomImage.Width, Aheight / ADicomImage.Height);
  Dest.Pen.Color := clWhite;
  mh := ADicomImage.Height;
  mw := ADicomImage.Width;
  kh := ((1 / ny) * ((ADicomImage.ViewerZoom * f1) / 100));
  if kh = 0 then
    exit;

  if ADicomImage.FontSpacing > 20 then
  begin
    Dest.Pen.Width := 5;
    cw := mw - 50;
    ch := mh - 50;
    kk := 20
  end
  else
  begin
    Dest.Pen.Width := 1;
    cw := trunc(mw * 0.95);
    ch := trunc(mh * 0.95);
    kk := 5;
  end;

  x1 := ((mh * 0.3) / kh) * kh;
  z1 := ((mh * 0.7) / kh) * kh;

  y := 0;

  if ARight then
  begin
    Dest.MoveTo(cw, round(x1));
    Dest.LineTo(cw, round(z1));
    while x1 <= z1 do
    begin
      x := round(x1);
      if (y mod 5) = 0 then
      begin
        Dest.MoveTo(cw - kk * 2, x);
        Dest.LineTo(cw, x);
      end
      else
      begin
        Dest.MoveTo(cw - kk, x);
        Dest.LineTo(cw, x);
      end;
      inc(y);
      x1 := x1 + kh;
    end;
  end;

  kw := trunc((1 / nx) * (ADicomImage.ViewerZoom * f1 / 100));
  if kw = 0 then
    exit;
  x1 := ((mw * 0.3) / kw) * kw;
  z1 := ((mw * 0.7) / kw) * kw;
  y := 0;

  if ABottom then
  begin
    Dest.MoveTo(trunc(mw * 0.3), ch);
    Dest.LineTo(trunc(mw * 0.7), ch);

    while x1 <= z1 do
    begin
      x := round(x1);
      if (y mod 5) = 0 then
      begin
        Dest.MoveTo(x, ch - kk * 2);
        Dest.LineTo(x, ch);
      end
      else
      begin
        Dest.MoveTo(x, ch - kk);
        Dest.LineTo(x, ch);
      end;
      inc(y);
      x1 := x1 + kw;
    end;
  end;
  Dest.Pen.Width := 1;

  str2 := ADicomImage.Attributes.GetString($18, $5100);
  if str2 <> '' then
  begin
    //      AddLabel(im, 0, h * 11, '位置:', str2);
    mw := ADicomImage.Width;
    mh := ADicomImage.Height;
    da1 := ADicomImage.Attributes.Item[$8, $8];
    if da1 = nil then
      exit;
    str1 := da1.AsString[2];

    {HFP = Head First-Prone
    HFS = Head First-Supine
    FFP = Feet First-Prone
    FFS = Feet First-Supine
    HFDR = Head First-Decubitus Right
    HFDL = Head First-Decubitus Left
    FFDR = Feet First-Decubitus Right
    FFDL = Feet First-Decubitus Left}

    if (str2 = 'HFS') or (str2 = 'FFS') then
    begin
      if ADicomImage.HozFlip then
        Dest.TextOut(2, mh shr 1, cns_Left_Caption)
      else
        Dest.TextOut(2, mh shr 1, cns_Right_Caption);
      if ADicomImage.VerFlip then
      begin
        if (str1 = 'LOCALIZER') then
          Dest.TextOut(mw shr 1, 2, cns_Foot_Caption)
        else
          Dest.TextOut(mw shr 1, 2, cns_After_Caption);
      end
      else
      begin
        if (str1 = 'LOCALIZER') then
          Dest.TextOut(mw shr 1, 2, cns_Head_Caption)
        else
          Dest.TextOut(mw shr 1, 2, cns_Front_Caption);
      end;
    end
    else
    begin
      if ADicomImage.HozFlip then
        Dest.TextOut(2, mh shr 1, cns_Right_Caption)
      else
        Dest.TextOut(2, mh shr 1, cns_Left_Caption);
      if ADicomImage.VerFlip then
      begin
        if (str1 = 'LOCALIZER') then
          Dest.TextOut(mw shr 1, 2, cns_Head_Caption)
        else
          Dest.TextOut(mw shr 1, 2, cns_Front_Caption);
      end
      else
      begin
        if (str1 = 'LOCALIZER') then
          Dest.TextOut(mw shr 1, 2, cns_Foot_Caption)
        else
          Dest.TextOut(mw shr 1, 2, cns_After_Caption);
      end;
    end;
  end;
end;

procedure DrawMeasureReport(ADicomImage: TDicomImage; Dest: TCanvas; AOffX, AOffY: Double);
var
  w, h, i: integer;
  str1, str2: AnsiString;
  //  f1: Double;
begin
  h := Dest.TextHeight('1');
  Dest.Font.Color := clBlue;
  for I := 0 to ADicomImage.MeasureReport.Count - 1 do // Iterate
  begin
    str1 := ADicomImage.MeasureReport.Names[i];
    str2 := ADicomImage.MeasureReport.Values[str1];
    {    if str2 <> '' then
        begin
          f1 := DicomStrToFloat(str2);
          str2 := FormatFloat('0.00', f1);
        end;}
    Dest.Font.Color := clRed;
    w := Dest.TextWidth(str1 + ':');
    Dest.TextOut(trunc(AOffX - w), trunc(AOffY + h * i), str1 + ':');
    Dest.TextOut(trunc(AOffX + 1), trunc(AOffY + h * i), str2);
  end;

end;

procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TCanvas; ARect: TRect; ADisplayCalcText: Boolean;
  ACurrentFrameIndex, AFontSize: Integer);
var
  i: Integer;
  o1: TDicomDrawObject;
begin
  for i := 0 to ADrawObjects.List.Count - 1 do
  begin
    o1 := TDicomDrawObject(ADrawObjects.List[i]);
    if (o1.RelateFrameIndex = ACurrentFrameIndex) or (ACurrentFrameIndex = -1) then
    begin
      if ADrawObjects.LabelPosition = dlmBottomOfImage then
        o1.TextIndex := i + 1
      else
        if ADrawObjects.LabelPosition = dlmTopOfImage then
        o1.TextIndex := -i - 1
      else
        o1.TextIndex := 0;
      //o1.LabelPosition := LabelPosition;

      DrawTo(o1, ACanvas, ARect, AFontSize);
      //if ADisplayCalcText then
      //  o1.DrawText(ACanvas, ARect);
    end;
  end;
  if assigned(ADrawObjects.NewDrawObject) then
    if (ADrawObjects.NewDrawObject.RelateFrameIndex = ACurrentFrameIndex) or (ACurrentFrameIndex = -1) then
      DrawSelectGrip(ADrawObjects.NewDrawObject, ACanvas);
end;

procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  xx1, yy1, xx2, yy2: Integer;
  x1, x2, y1, y2, x3, y3: Integer;
begin
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];
  x3 := ADrawObject.SCRX[2];
  y3 := ADrawObject.SCRY[2];

  ACanvas.MoveTo(x1, y1);
  ACanvas.LineTo(x2, y2);

  ACanvas.MoveTo(x2, y2);
  ACanvas.LineTo(X3, Y3);

  xx1 := trunc(x2 - (x2 - x1) * 0.1);
  yy1 := trunc(y2 - (y2 - y1) * 0.1);

  xx2 := trunc(x2 - (x2 - x3) * 0.1);
  yy2 := trunc(y2 - (y2 - y3) * 0.1);
  ACanvas.MoveTo(xx1, yy1);
  ACanvas.LineTo(xx2, yy2);
end;

procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  X: integer;
  x1, x2, y1, y2: Integer;
begin
  Acanvas.Pen.Color := clBlue;
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];

  x := Max(x1, x2);
  ACanvas.MoveTo(x + 10, y1);
  ACanvas.LineTo(x + 20, y1);

  ACanvas.MoveTo(x + 10, y2);
  ACanvas.LineTo(x + 20, y2);

  ACanvas.MoveTo(x + 15, y1);
  ACanvas.LineTo(x + 15, y2);

  ACanvas.MoveTo(x + 15 - 4, y1 - 4);
  ACanvas.LineTo(x + 15 + 4, y1 + 4);
  ACanvas.MoveTo(x + 15 - 4, y2 - 4);
  ACanvas.LineTo(x + 15 + 4, y2 + 4);

end;

procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  y: integer;
  x1, x2, y1, y2: Integer;
begin
  Acanvas.Pen.Color := clBlue;
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];
  y := Max(y1, y2);
  ACanvas.MoveTo(x1, y + 10);
  ACanvas.LineTo(x1, y + 20);

  ACanvas.MoveTo(x2, y + 10);
  ACanvas.LineTo(x2, y + 20);

  ACanvas.MoveTo(x1, y + 15);
  ACanvas.LineTo(x2, y + 15);

  ACanvas.MoveTo(x1 - 4, y + 15 - 4);
  ACanvas.LineTo(x1 + 4, y + 15 + 4);
  ACanvas.MoveTo(x2 - 4, y + 15 - 4);
  ACanvas.LineTo(x2 + 4, y + 15 + 4);

end;

procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
begin
  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
end;

procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
begin
  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  if ADrawObject.UserText <> '' then
  begin
    Acanvas.Font.Assign(ADrawObject.Font);
    ACanvas.TextOut(ADrawObject.SCRX[0], ADrawObject.SCRY[0] + Acanvas.TextHeight('A'), '=' + ADrawObject.UserText);
  end;
end;

procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer; ACanvas: TCanvas);
var
  aa, bb, hw: double;
  fl: boolean;
  xa, ya, xb, yb: integer;
  cosbb, sinbb: double;
  cosbbpi, sinbbpi: double;
begin
  Acanvas.Pen.Color := clRed;
  aa := _angle(x1, y1, x2, y2, x1, y2);
  if x1 = x2 then
    if y1 < y2 then
      aa := -A90
    else
      aa := A90;
  fl := ((x1 > x2) and (y2 < y1)) or ((x1 < x2) and (y1 < y2));
  if fl then
    bb := 2 * pi - aa + A90
  else
    bb := aa + A90;
  cosbb := cos(bb);
  sinbb := sin(bb);
  cosbbpi := cos(bb + pi);
  sinbbpi := sin(bb + pi);
  hw := 9;
  xa := trunc(cosbb * hw);
  ya := trunc(sinbb * hw);
  xb := trunc(cosbbpi * hw);
  yb := trunc(sinbbpi * hw);
  ACanvas.MoveTo(x1 + xa, y1 + ya);
  ACanvas.LineTo(x1 + xb, y1 + yb);

  ACanvas.MoveTo(x2 + xa, y2 + ya);
  ACanvas.LineTo(x2 + xb, y2 + yb);

  ACanvas.MoveTo(x1, y1);
  ACanvas.LineTo(x2, y2);
end;

procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
begin
  Acanvas.Font.Assign(ADrawObject.Font);

  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  ACanvas.TextOut(ADrawObject.SCRX[0], ADrawObject.SCRY[0], 'L1');
  if ADrawObject.GetCount > 3 then
  begin
    DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
    ACanvas.TextOut(ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L2');
  end;
end;

procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
begin
  Acanvas.Font.Assign(ADrawObject.Font);

  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  ACanvas.TextOut(ADrawObject.SCRX[0], ADrawObject.SCRY[0], 'L1');
  if ADrawObject.GetCount > 3 then
  begin
    DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
    ACanvas.TextOut(ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L2');
  end;
end;

procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  i, k: integer;
begin
  Acanvas.Pen.Color := clRed;
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.MoveTo(ADrawObject.scrX[0], ADrawObject.scrY[0]);
    for i := 1 to ADrawObject.GetCount - 1 do
      ACanvas.LineTo(ADrawObject.scrX[i], ADrawObject.scrY[i]);
  end;
end;

procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  i, k: integer;
begin
  Acanvas.Pen.Color := clRed;
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.MoveTo(ADrawObject.scrX[0], ADrawObject.scrY[0]);
    for i := 1 to ADrawObject.GetCount - 1 do
      ACanvas.LineTo(ADrawObject.scrX[i], ADrawObject.scrY[i]);
    ACanvas.LineTo(ADrawObject.scrX[0], ADrawObject.scrY[0]);

    //ACanvas.Font.Color := clBlue;
    Acanvas.Font.Assign(ADrawObject.Font);
    Acanvas.Textout(ADrawObject.scrX[0], ADrawObject.scrY[0], 'A');
    Acanvas.Textout(ADrawObject.scrX[k - 1], ADrawObject.scrY[k - 1], 'B');
  end;
end;

procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  pp: array[1..3] of TPoint;
  M, N, L, angleA, angleB: Double;
  //  strs: TStringList;
  //  i, sh: integer;
  fArrowThicknessRate: Word; // 1 to ...   一般为奇数倍
  fArrowHeadLengthRate: Word; // 1 to ...
  fLineWidth: Word; // 1 to ...
  x1, x2, y1, y2: Integer;
begin
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];

  fLineWidth := 1;
  fArrowThicknessRate := 10;
  fArrowHeadLengthRate := 2;

  M := fLineWidth * fArrowThicknessRate;
  L := M * fArrowHeadLengthRate;
  N := sqrt(M * M / 4 + L * L);
  if x1 <> x2 then
    angleA := Arctan((y2 - y1) / (x2 - x1))
  else
    angleA := PI / 2;
  angleB := Arctan(M / L / 2);
  // 如果需要反转，加3.1415
  if x2 > x1 then
    angleA := angleA - PI;
  pp[1].x := x2;
  pp[1].y := y2;
  pp[2].x := x2 + trunc(N * cos(angleA + angleB));
  pp[2].y := y2 + trunc(N * sin(angleA + angleB));
  pp[3].x := x2 + trunc(N * cos(angleA - angleB));
  pp[3].y := y2 + trunc(N * sin(angleA - angleB));

  ACanvas.MoveTo(pp[3].X, pp[3].Y);
  ACanvas.LineTo(pp[1].X, pp[1].Y);

  ACanvas.MoveTo(pp[2].X, pp[2].Y);
  ACanvas.LineTo(pp[1].X, pp[1].Y);

  ACanvas.MoveTo(x1, y1);
  ACanvas.LineTo(x2, y2);

  ACanvas.MoveTo(x1 - 4, y1);
  ACanvas.LineTo(x1 + 4, y1);
  ACanvas.MoveTo(x1, y1 - 4);
  ACanvas.LineTo(x1, y1 + 4);

  if ADrawObject.UserText <> '' then
  begin
    Acanvas.Font.Assign(ADrawObject.Font);
    //ACanvas.Font.size := fParent.fOwnImageData.CalFontSpacing(ACanvas.Width, ACanvas.Height);

    Acanvas.Font.Color := clBlack;
    Acanvas.TextOut(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.UserText);
    Acanvas.Font.Color := clWhite;
    Acanvas.TextOut(ADrawObject.scrX[0] + 1, ADrawObject.scrY[0] + 1, ADrawObject.UserText);
  end;
end;

procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TCanvas; ARect: TRect);
var
  p1: TPoint;
  sh, sw, i: Integer;
  strs: TStringList;
  str1: AnsiString;
begin
  ACanvas.Font.Assign(ADrawObject.Font);
  p1.X := ADrawObject.fViewCood.XBmp2Scr((ADrawObject.ObjectRect.Right + ADrawObject.ObjectRect.Left) div 2);
  p1.y := ADrawObject.fViewCood.YBmp2Scr((ADrawObject.ObjectRect.Bottom + ADrawObject.ObjectRect.Top) div 2);

  //ACanvas.TextOut(p1.X, p1.Y, IntToStr(FTextIndex));
  sh := ACanvas.TextHeight('A');
  strs := TStringList.Create;
  try
    strs.Text := ADrawObject.name + ADrawObject.CalText;

    str1 := '';
    for i := 0 to strs.Count - 1 do
    begin
      if strs[i] <> '' then
      begin
        str1 := str1 + ' ' + strs[i];
      end;
    end;

    sw := ACanvas.TextWidth(str1);
    if ADrawObject.TextIndex > 0 then
    begin
      Acanvas.Font.Color := clBlack;
      Acanvas.TextOut(ARect.Right div 3, ARect.Bottom - (ADrawObject.TextIndex + 2) * (sh + 2),
        IntToStr(ADrawObject.TextIndex) + ':' + str1);
      Acanvas.Font.Color := clWhite;
      Acanvas.TextOut(ARect.Right div 3 + 1, ARect.Bottom - (ADrawObject.TextIndex + 2) * (sh + 2) + 1,
        IntToStr(ADrawObject.TextIndex) + ':' + str1);
    end
    else
    begin
      Acanvas.Font.Color := clBlack;
      Acanvas.TextOut(ARect.Right div 3, (1 - ADrawObject.TextIndex) * (sh + 2),
        IntToStr(abs(ADrawObject.TextIndex)) + ':' + str1);
      Acanvas.Font.Color := clWhite;
      Acanvas.TextOut(ARect.Right div 3 + 1, (1 - ADrawObject.TextIndex) * (sh + 2) + 1,
        IntToStr(abs(ADrawObject.TextIndex)) + ':' + str1);
    end;
  finally
    strs.Free;
  end;
end;

procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TCanvas; ARect: TRect; AFontSize: Integer);
var
  strs: TStringList;
  i: integer;
  x1, y1, sh: Integer;
  str1: AnsiString;
begin
  ACanvas.Brush.Style := bsClear;
  ACanvas.Pen.Mode := pmCopy;
  Acanvas.Pen.Color := clRed;
  if ADrawObject.CalText <> '' then
  begin
    strs := TStringList.Create;
    try
      strs.Text := ADrawObject.Name + ADrawObject.CalText;
      ACanvas.Font.size := ADrawObject.Parent.OwnImageData.CalFontSpacing(ARect.Right, ARect.Bottom);
      if ADrawObject.Textindex = 0 then
      begin
        Acanvas.Font.Color := clRed;
        //    Acanvas.Font.Color := clRed;
        if ADrawObject.Kind in [ldmiROI_Cycle, ldmiSolidRect, ldmiROI_Rect] then
        begin
          x1 := Min(ADrawObject.SCRX[1], ADrawObject.SCRX[0]);
          y1 := Max(ADrawObject.SCRY[1], ADrawObject.SCRY[0]);
        end
        else
          if ADrawObject.Kind in [ldmiAngle] then
        begin
          x1 := ADrawObject.SCRX[1];
          y1 := ADrawObject.SCRY[1];
        end
        else
        begin
          x1 := ADrawObject.SCRX[0];
          y1 := ADrawObject.SCRY[0];
        end;
        sh := ACanvas.TextHeight(strs[0]) + 3;

        for i := 0 to strs.Count - 1 do
        begin
          if (i = 0) and (ADrawObject.Name <> '') then
          begin
            ACanvas.Font.Color := clBlack;
            Acanvas.TextOut(x1, y1 + i * sh, ADrawObject.name + '=' + strs[i]);
            ACanvas.Font.Color := clWhite;
            Acanvas.TextOut(x1 + 1, y1 + i * sh + 1, ADrawObject.name + '=' + strs[i]);
          end
          else
            if strs[i] <> '' then
          begin
            ACanvas.Font.Color := clBlack;
            Acanvas.TextOut(x1, y1 + i * sh, strs[i]);
            ACanvas.Font.Color := clWhite;
            Acanvas.TextOut(x1 + 1, y1 + i * sh + 1, strs[i]);
          end;
        end;
      end
      else
      begin
        str1 := IntToStr(abs(ADrawObject.Textindex));
        ACanvas.Font.Color := clBlack;
        Acanvas.TextOut(x1, y1, str1);
        ACanvas.Font.Color := clWhite;
        Acanvas.TextOut(x1 + 1, y1 + 1, str1);

        DrawText(ADrawObject, ACanvas, ARect);
      end;
    finally
      strs.Free;
    end;
  end;
  case ADrawObject.Kind of
    ldmiRulerCalc:
      if ADrawObject.GetCount = 2 then
      begin
        DrawRulerCalc(ADrawObject, ACanvas);
      end;
    ldmiRulerVer:
      if ADrawObject.GetCount = 2 then
      begin
        DrawRuler(ADrawObject, ACanvas);
        DrawRulerVer(ADrawObject, ACanvas);
      end;
    ldmiRulerHiz:
      if ADrawObject.GetCount = 2 then
      begin
        DrawRuler(ADrawObject, ACanvas);
        DrawRulerHiz(ADrawObject, ACanvas);
      end;
    ldmiRulerVerHiz:
      if ADrawObject.GetCount = 2 then
      begin
        DrawRuler(ADrawObject, ACanvas);
        DrawRulerVer(ADrawObject, ACanvas);
        DrawRulerHiz(ADrawObject, ACanvas);
      end;
    ldmiRuler:
      if ADrawObject.GetCount = 2 then
      begin
        DrawRuler(ADrawObject, ACanvas);

      end;
    ldmiQuantitativeCoronaryAnaliysis:
      begin
        //        DrawQuantitativeCoronaryAnaliysis(ACanvas);
      end;
    ldmiCAPoly:
      begin
        DrawLCA_RCA(ADrawObject, ACanvas);
      end;
    ldmiVentricularPolyon:
      begin
        DrawVentricular(ADrawObject, ACanvas);
      end;
    ldmiPoly:
      begin
        DrawPolyLine(ADrawObject, ACanvas);
      end;
    ldmiPolyonA, ldmiPolyonV:
      begin
        DrawPolygon(ADrawObject, ACanvas);
      end;
    ldmiAngle:
      begin
        if ADrawObject.GetCount = 3 then
        begin
          DrawAngle(ADrawObject, ACanvas);
        end
        else
          if ADrawObject.GetCount = 2 then
        begin
          ACanvas.MoveTo(ADrawObject.scrX[0], ADrawObject.scrY[0]);
          ACanvas.LineTo(ADrawObject.scrX[1], ADrawObject.scrY[1]);
        end;
      end;
    ldmiCross:
      begin
        if ADrawObject.GetCount >= 2 then
          DrawCross(ADrawObject, ACanvas);
      end;
    ldmiCross1:
      begin
        if ADrawObject.GetCount >= 2 then
          DrawCross1(ADrawObject, ACanvas);
      end;
    ldmiSolidRect:
      begin
        DrawSolidRect(ADrawObject, Acanvas);
      end;
    ldmiROI_Cycle:
      begin
        DrawCycleROI(ADrawObject, ACanvas);
      end;
    ldmiSelectRect:
      begin
        DrawRect(ADrawObject, ACanvas);
      end;
    ldmiReferenceLine:
      begin
        DrawReferenceLine(ADrawObject, ACanvas, AFontSize);
      end;
    ldmiRect:
      begin
        DrawRect(ADrawObject, ACanvas);
      end;
    ldmiCycle:
      begin

      end;
    ldmiText:
      begin
        DrawRectText(ADrawObject, ACanvas);
      end;
    ldmiROI_Rect:
      begin
        DrawRectROI(ADrawObject, ACanvas);
      end;
    ldmiVitexObject:
      begin
        DrawVitexObject(ADrawObject, ACanvas);
      end;
    ldmiPerpendicularityLine:
      begin
        DrawPerpendicularityLine(ADrawObject, ACanvas);
      end;
    ldmiArrow:
      begin
        if ADrawObject.GetCount = 2 then
          DrawArrow(ADrawObject, ACanvas);
      end;
  end;
end;

procedure DrawSelectGrip(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  i, k: integer;
begin
  if ADrawObject.Kind in [ldmiROI_Cycle, ldmiSolidRect, ldmiROI_Rect, ldmiPerpendicularityLine] then
    exit;
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.Pen.Color := clBlue;
    ACanvas.Rectangle(ADrawObject.scrX[0] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[0] + 4);
    ACanvas.Rectangle(ADrawObject.scrX[k - 1] - 4, ADrawObject.scrY[k - 1] - 4, ADrawObject.scrX[k - 1] + 4, ADrawObject.scrY[k - 1] + 4);

    ACanvas.Pen.Color := clRed;
    for i := 1 to k - 2 do
    begin
      ACanvas.Rectangle(ADrawObject.scrX[i] - 4, ADrawObject.scrY[i] - 4, ADrawObject.scrX[i] + 4, ADrawObject.scrY[i] + 4);
    end;
    if ADrawObject.Kind in [ldmiCycle, ldmiRect, ldmiReferenceLine, ldmiSelectRect, ldmiText] then
    begin
      ACanvas.Rectangle(ADrawObject.scrX[0] - 4, ADrawObject.scrY[1] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[1] + 4);
      ACanvas.Rectangle(ADrawObject.scrX[1] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[1] + 4, ADrawObject.scrY[0] + 4);
    end;
    if ADrawObject.Kind in [ldmiText] then
      ACanvas.Rectangle(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1]);
  end;
end;

procedure DrawCycleROI(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
  procedure circle(canvas: tcanvas; pt: tpoint; r: integer);
  begin
    canvas.ellipse(pt.x - r, pt.y - r, pt.x + r, pt.y + r);
  end;

var
  k, w, h: integer;
  //  x1, x2, y1, y2: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.Pen.Color := clRed;

    w := abs(ADrawObject.scrX[1] - ADrawObject.scrX[0]) div 2;
    h := abs(ADrawObject.scrY[1] - ADrawObject.scrY[0]) div 2;
    circle(ACanvas, Point((ADrawObject.scrX[1] + ADrawObject.scrX[0]) div 2, (ADrawObject.scrY[1] + ADrawObject.scrY[0]) div 2), Max(w, h));

    //ACanvas.Ellipse(scrX[0], scrY[0], scrX[1], scrY[1]);

   { x1 := Min(scrX[0], scrX[1]);
    x2 := Max(scrX[0], scrX[1]);
    y1 := Min(scrY[0], scrY[1]);
    y2 := Max(scrY[0], scrY[1]);

    w := abs(scrX[1] - scrX[0]) div 2;
    h := abs(scrY[1] - scrY[0]) div 2;

    ACanvas.MoveTo(x1 + w, y1 + h);
    ACanvas.LineTo(x2 + w, y2 + h); }
  end;
end;

procedure DrawCycle(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.Pen.Color := clRed;
    ACanvas.Ellipse(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1]);

  end;
end;

procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  k, w, h: integer;
  x1, x2, y1, y2: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.Pen.Color := clRed;
    ACanvas.Rectangle(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1]);

    w := abs(ADrawObject.scrX[1] - ADrawObject.scrX[0]) div 2;
    h := abs(ADrawObject.scrY[1] - ADrawObject.scrY[0]) div 2;

    x1 := Min(ADrawObject.scrX[0], ADrawObject.scrX[1]);
    x2 := Max(ADrawObject.scrX[0], ADrawObject.scrX[1]);
    y1 := Min(ADrawObject.scrY[0], ADrawObject.scrY[1]);
    y2 := Max(ADrawObject.scrY[0], ADrawObject.scrY[1]);

    ACanvas.MoveTo(x1 + w, y1 + h);
    ACanvas.LineTo(x2 + w, y2 + h);
  end;
end;

procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  k: integer;
  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.Pen.Color := clRed;
    ACanvas.Rectangle(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1]);

    str1 := Format('W%d,H%d,W/H%4.2f', [abs(ADrawObject.X[0] - ADrawObject.X[1]), abs(ADrawObject.Y[0] - ADrawObject.Y[1]),
      abs(ADrawObject.X[0] - ADrawObject.X[1]) / abs(ADrawObject.Y[0] - ADrawObject.Y[1])]);
    ACanvas.Font.Assign(ADrawObject.Font);
    ACanvas.Textout(Min(ADrawObject.scrX[0], ADrawObject.scrX[1]), Min(ADrawObject.scrY[0], ADrawObject.scrY[1]), str1);
  end;
end;

procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TCanvas; AFontSize: Integer);
var
  k: integer;
  //  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.Pen.Color := clRed;
    ACanvas.Rectangle(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1]);

  end;
end;

procedure DrawPerpendicularityLine(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  k: integer;
  //  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.Pen.Color := clRed;
    ACanvas.Rectangle(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1]);

  end;
end;

procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
var
  k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.Font.Assign(ADrawObject.Font);

    ACanvas.Pen.Color := clBlack;
    //    ACanvas.Rectangle(scrX[0], scrY[0], scrX[1], scrY[1]);
    Acanvas.TextOut(Min(ADrawObject.scrX[0], ADrawObject.scrX[1]), Min(ADrawObject.scrY[0], ADrawObject.scrY[1]), ADrawObject.UserText);
    ACanvas.Pen.Color := clWhite;
    Acanvas.TextOut(Min(ADrawObject.scrX[0] + 1, ADrawObject.scrX[1] + 1), Min(ADrawObject.scrY[0] + 1, ADrawObject.scrY[1] + 1), ADrawObject.UserText);
  end;
end;

procedure DrawSolidRect(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
begin

end;

procedure DrawLCA_RCA(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
begin

end;

procedure DrawVentricular(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
begin

end;

procedure DrawVitexObject(ADrawObject: TDicomDrawObject; ACanvas: TCanvas);
begin
  if assigned(ADrawObject.VitexObject) then
  begin
    //    ADrawObject.VitexObject.DrawTo(Acanvas);
  end;
end;
end.

