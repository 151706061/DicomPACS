unit DCM_ImageData_Bitmap16;

interface
{$I DicomPack.inc}
uses
  {$IFDEF LINUX}Types, Libc, QControls, Qgraphics, {$ELSE}
  Windows, Messages, Forms, Controls, graphics, {$ENDIF}
  SysUtils, Classes, {$IFDEF DICOMDEBUX1}DbugIntf, {$ENDIF}
  CnsMsg, DCM_Dict, DCM_UID, DcmImageConvert, DCM_MemTable,
  DCM_Attributes, DCM_Bitmap16, math, dialogs;

function NewImageForPrint(ABitmap: TDicomBitmap16; AIsMONOCHROME: Boolean): TDicomAttributes;

procedure DrawLineS32(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; x1, y1, x2, y2: Integer; APenColor: TColor);
procedure DrawLineS32Ref(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; x1, y1, x2, y2: Integer; APenColor: TColor);

procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer; ACanvas: TDicomBitmap16);
procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
//procedure DrawSelectGrip(ACanvas: TDicomBitmap16);
//procedure DrawRotateGrip(ACanvas: TDicomBitmap16);
//procedure DrawCycleROI(ACanvas: TDicomBitmap16);
procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
//procedure DrawVitexObject(ACanvas: TDicomBitmap16);
//procedure DrawSolidRect(ACanvas: TDicomBitmap16);
//procedure DrawCycle(ACanvas: TDicomBitmap16);
procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; AFontSize: Integer);
//procedure DrawPerpendicularityLine(ACanvas: TDicomBitmap16);
procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);

procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; AFontSize: Integer);
procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; ARect: TRect);

procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TDicomBitmap16; ARect: TRect; ADisplayCalcText: Boolean;
  ACurrentFrameIndex, AFontSize: Integer);

procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);

procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TDicomBitmap16);

procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);

procedure DrawImagePosition(ADicomImage: TDicomImage; Dest: TDicomBitmap16);
procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ARight, ABottom: Boolean);
procedure myTextOut(ADicomImage: TDicomImage; Dest: TDicomBitmap16; AMode: TDisplayArea; ARow: Integer; AText: AnsiString);

function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TDicomBitmap16; WithLabel: Boolean = false): Boolean;
procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Buffer: TDicomBitmap16; Zoom: Single = 1; AXOff: Integer =
  0; AYOff: Integer = 0);

implementation

function NewImageForPrint(ABitmap: TDicomBitmap16; AIsMONOCHROME: Boolean): TDicomAttributes;
var
  dimage: TDicomImageData;
  p1: Pointer;
  pb1: PByte;
  ALen: Integer;
  DestScanline: Wordp;
  //  prgb1: pRGB;
  da1: TDicomAttribute;
begin
  Result := TDicomAttributes.Create;

  Result.AddVariant($28, $11, ABitmap.Width);
  Result.AddVariant($28, $10, ABitmap.Height);
  //Result.AddVariant(8, $70, 'DicomVCL_16bit_grayscale');
  //  Result.AddVariant(dSOPInstanceUID, FormatDatetime('yyyymmdd.hhnnss.zzzz', now) +
  //    IntToStr(random(100000)));

  Result.AddVariant($28, $2, 1);
  Result.AddVariant($28, $4, 'MONOCHROME2');
  ALen := ABitmap.Width * ABitmap.Height * 2;

  Result.AddVariant($28, $100, 16);

  da1 := Result.Add($28, $34);
  da1.AsInteger[0] := 1;
  da1.AsInteger[1] := 1;

  Result.AddVariant($28, $101, ABitmap.DataBits);
  Result.AddVariant($28, $102, ABitmap.DataBits - 1);

  Result.AddVariant($28, $103, 0);

  //Result.AddVariant($28, $6, 0);

  Getmem(p1, Alen);

  pb1 := p1;
  DestScanline := ABitmap.GetData;
  Move(DestScanline^, pb1^, Alen);

  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  Result.Add(32736, 16).AddData(dimage);
end;

procedure DrawLineS32(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; x1, y1, x2, y2: Integer; APenColor: TColor);
var
  //  line1: TLine32;
  PenWidth1: Integer;
begin
  PenWidth1 := ADrawObject.Parent.OwnImageData.CalFontSpacing(ACanvas.Width, ACanvas.Height) div 12;

  ACanvas.LineS(x1, y1, x2, y2, APenColor, true);
  {todo
   line1 := TLine32.Create;
   try
     Line1.SetPoints([FixedPoint(x1, y1), FixedPoint(x2, y2)]);
     line1.Draw(ACanvas, PenWidth1, APenColor);
   finally
     line1.Free;
   end; }
end;

procedure DrawLineS32Ref(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; x1, y1, x2, y2: Integer; APenColor: TColor);
var
  //  line1: TLine32;
  PenWidth1: Integer;
begin
  if APenColor = clRed then
    PenWidth1 := ADrawObject.Parent.OwnImageData.CalFontSpacing(ACanvas.Width, ACanvas.Height) div 12
  else
    PenWidth1 := 1; //fOwnImageData.CalFontSpacing(ACanvas.Width, ACanvas.Height) div 20;

  ACanvas.LineS(x1, y1, x2, y2, APenColor, true);
  {todo
  line1 := TLine32.Create;
  try
    Line1.SetPoints([FixedPoint(x1, y1), FixedPoint(x2, y2)]);

    line1.Draw(ACanvas, PenWidth1, [APenColor, APenColor, clBlack32, clBlack32, clBlack32, clBlack32]);
  finally
    line1.Free;
  end; }
end;

procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
var
  i, k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    //    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[1], scrY[1], fPenColor);
    for i := 1 to k - 1 do
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
  end;
end;

procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
{  function TwoLineAngle(px0, py0, px1, py1, px2, py2, px3, py3: Double): Boolean;
  var
    x1, x2, y1, y2, xx, yy: Double;
  begin
    x1 := px1 - px0;
    y1 := py1 - py0;
    x2 := px3 - px2;
    y2 := py3 - py2;
    xx := x1 * x2 + y1 * y2;
    yy := x1 * y2 - x2 * y1;
    Result := xx > 0;
    //if( x>0 )   //角度<90
    //else   //角度>=90
//    Result := arccos(xx / sqrt(xx * xx + yy * yy));
  end;}
var
  i, k: integer;
  //  x1, x2, y1, y2, d1, d2: Double;
  //  rx1, rx2, ry1, ry2, rx3, ry3: Double;
  //b1, b2: Boolean;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    //    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[1], scrY[1], fPenColor);

    for i := 1 to k - 1 do
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[k - 1], ADrawObject.scrY[k - 1], ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.PenColor);

    ACanvas.Font.Assign(ADrawObject.Font);
    Acanvas.Textout(ADrawObject.scrX[0], ADrawObject.scrY[0], 'A');
    Acanvas.Textout(ADrawObject.scrX[k - 1], ADrawObject.scrY[k - 1], 'B');
  end;
  (*
    x1 := (x[0] + x[k - 1]) / 2;
    y1 := (y[0] + y[k - 1]) / 2;
    d2 := 0;
    for i := 1 to k - 2 do
    begin
      x2 := x[i];
      y2 := y[i];
      d1 := sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
      if d1 > d2 then
      begin
        s1 := i;
        d2 := d1;
      end;
    end;

    DrawLineS32(ACanvas,fViewCood.XBmp2Scr(x1), fViewCood.YBmp2Scr(y1), scrX[s1], scrY[s1], clBlue32);

    x2 := x[s1];
    y2 := y[s1];

    for i := 1 to k - 2 do
    begin
      rx1 := x[i];
      ry1 := y[i];
      for i1 := 2 to k - 2 do
      begin
        rx2 := x[(i1 + i) mod k];
        ry2 := y[(i1 + i) mod k];
        b1 := TwoLineAngle(x1, y1, x2, y2, rx1, ry1, rx2, ry2);
        rx3 := x[(i1 + i + 1) mod k];
        ry3 := y[(i1 + i + 1) mod k];
        b2 := TwoLineAngle(x1, y1, x2, y2, rx1, ry1, rx3, ry3);
        if (b1 <> b2) then
        begin
          DrawLineS32(ACanvas,fViewCood.XBmp2Scr(rx1), fViewCood.YBmp2Scr(ry1),
            fViewCood.XBmp2Scr((rx2 + rx3) / 2), fViewCood.YBmp2Scr((ry2 + ry3) / 2), clYellow32);
          break;
        end;
      end;
    end;*)
end;

procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
var
  X: integer;
  x1, x2, y1, y2: Integer;
begin
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];

  x := Max(x1, x2);
  DrawLineS32(ADrawObject, ACanvas, x + 10, y1, x + 20, y1, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x + 10, y2, x + 20, y2, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x + 15, y1, x + 15, y2, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x + 15 - 4, y1 - 4, x + 15 + 4, y1 + 4, ADrawObject.PenColor);
  DrawLineS32(ADrawObject, ACanvas, x + 15 - 4, y2 - 4, x + 15 + 4, y2 + 4, ADrawObject.PenColor);
end;

procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
var
  y: integer;
  x1, x2, y1, y2: Integer;
begin
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];
  y := Max(y1, y2);
  DrawLineS32(ADrawObject, ACanvas, x1, y + 10, x1, y + 20, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x2, y + 10, x2, y + 20, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x1, y + 15, x2, y + 15, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x1 - 4, y + 15 - 4, x1 + 4, y + 15 + 4, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x2 - 4, y + 15 - 4, x2 + 4, y + 15 + 4, ADrawObject.PenColor);
end;

procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
begin
  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
end;

procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
begin
  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  if ADrawObject.UserText <> '' then
  begin
    Acanvas.Font.Assign(ADrawObject.Font);
    ACanvas.TextOut(ADrawObject.SCRX[0], ADrawObject.SCRY[0] + Acanvas.TextHeight('A'), '=' + ADrawObject.UserText);
  end;
end;

procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
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

  DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x2, y2, X3, Y3, ADrawObject.PenColor);

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, clBlack);

    DrawLineS32(ADrawObject, ACanvas, x2, y2, X3, Y3, clBlack);
  end;

  xx1 := trunc(x2 - (x2 - x1) * 0.1);
  yy1 := trunc(y2 - (y2 - y1) * 0.1);

  xx2 := trunc(x2 - (x2 - x3) * 0.1);
  yy2 := trunc(y2 - (y2 - y3) * 0.1);
  DrawLineS32(ADrawObject, ACanvas, xx1, yy1, xx2, yy2, ADrawObject.PenColor);

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ADrawObject, ACanvas, xx1, yy1, xx2, yy2, clBlack);
  end;
end;

procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
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
  fArrowThicknessRate := 11;
  fArrowHeadLengthRate := 3;

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

  DrawLineS32(ADrawObject, ACanvas, pp[3].X, pp[3].Y, pp[1].X, pp[1].Y, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, pp[2].X, pp[2].Y, pp[1].X, pp[1].Y, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x1 - 4, y1, x1 + 4, y1, ADrawObject.PenColor);
  DrawLineS32(ADrawObject, ACanvas, x1, y1 - 4, x1, y1 + 4, ADrawObject.PenColor);

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ADrawObject, ACanvas, pp[3].X, pp[3].Y, pp[1].X, pp[1].Y, clBlack);

    DrawLineS32(ADrawObject, ACanvas, pp[2].X, pp[2].Y, pp[1].X, pp[1].Y, clBlack);

    DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, clBlack);

    DrawLineS32(ADrawObject, ACanvas, x1 - 4, y1, x1 + 4, y1, clBlack);
    DrawLineS32(ADrawObject, ACanvas, x1, y1 - 4, x1, y1 + 4, clBlack);
  end;

  if ADrawObject.UserText <> '' then
  begin
    Acanvas.Font.Assign(ADrawObject.Font);
    ACanvas.Font.size := ADrawObject.Parent.OwnImageData.CalFontSpacing(ACanvas.Width, ACanvas.Height);

    Acanvas.Font.Color := clBlack;
    Acanvas.TextOut(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.UserText);
    Acanvas.Font.Color := clWhite;
    Acanvas.TextOut(ADrawObject.scrX[0] + 1, ADrawObject.scrY[0] + 1, ADrawObject.UserText);
  end;
end;

procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
begin
  Acanvas.Font.Assign(ADrawObject.Font);

  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  Acanvas.Textout(ADrawObject.SCRX[1], ADrawObject.SCRY[1], 'L1');
  if ADrawObject.GetCount > 3 then
  begin
    DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
    Acanvas.Textout(ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L2');
  end;

end;

procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
begin
  Acanvas.Font.Assign(ADrawObject.Font);

  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  Acanvas.Textout(ADrawObject.SCRX[1], ADrawObject.SCRY[1], 'L1');
  if ADrawObject.GetCount > 3 then
  begin
    DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
    Acanvas.Textout(ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L2');
  end;

end;

procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer; ACanvas: TDicomBitmap16);
var
  aa, bb, hw: double;
  fl: boolean;
  xa, ya, xb, yb: integer;
  cosbb, sinbb: double;
  cosbbpi, sinbbpi: double;
begin
  //  Acanvas.Pen.Color := clRed;
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

  DrawLineS32(ADrawObject, ACanvas, x1 + xa, y1 + ya, x1 + xb, y1 + yb, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x2 + xa, y2 + ya, x2 + xb, y2 + yb, ADrawObject.PenColor);

  DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, ADrawObject.PenColor);

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ADrawObject, ACanvas, x1 + xa, y1 + ya, x1 + xb, y1 + yb, clBlack);

    DrawLineS32(ADrawObject, ACanvas, x2 + xa, y2 + ya, x2 + xb, y2 + yb, clBlack);

    DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, clBlack);
  end;
end;

procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
var
  str1, str2: AnsiString;
  //  k: integer;
//  f1: Double;
begin
  ADicomImage.CalFontSpacing(Dest.Width, Dest.Height);

  if ADicomImage.InformationLabels.Count > 0 then
    DrawInformationLabels(ADicomImage, Dest, ADisplayWLLabel)
  else
  begin
    if ADicomImage.FrameCount > 1 then
      DisplayCommonList(ADicomImage, Dest, ADisplayWLLabel)
    else
    begin
      str1 := ADicomImage.Attributes.GetString(8, $60);

      str2 := ADicomImage.Attributes.GetString(8, $70);

      if str1 = 'MR' then
      begin
        if Copy(Str2, 1, 2) = 'GE' then
          DisplayCommonListGEMR(ADicomImage, Dest, ADisplayWLLabel)
        else
          DisplayCommonListSIMR(ADicomImage, Dest, ADisplayWLLabel);
      end
      else
        if str1 = 'CT' then
        DisplayCommonListSI(ADicomImage, Dest, ADisplayWLLabel)
      else
        DisplayCommonList(ADicomImage, Dest, ADisplayWLLabel);
    end;

    //f1 := Min(Dest.Width / Width, Dest.height / Height);
    //MyTextOut(Dest, daRightBottom, 2, 'Z: ' + Floattostrf(ViewerZoom * 100, ffFixed, 15, 0) + '%');
  end;

  if Dest.Width > 200 then
  begin
    //DrawImageScale(Dest);

    //DrawImagePosition(Dest);
  end;
end;

procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Buffer: TDicomBitmap16; Zoom: Single = 1; AXOff:
  Integer = 0; AYOff: Integer = 0);
begin
  if not assigned(ADicomImage.Attributes) then
    exit;
  ADicomImage.UpdateCood(0, 0, AXOff, AYOff, Zoom,
    ADicomImage.PixelSpacingX, ADicomImage.PixelSpacingY);

  DrawAll(ADicomImage.DrawObjects, buffer, Rect(0, 0, ADicomImage.width, ADicomImage.Height),
    false, -1, ADicomImage.CalFontSpacing(Buffer.Width, Buffer.Height));
end;

procedure myTextOut(ADicomImage: TDicomImage; Dest: TDicomBitmap16; AMode: TDisplayArea; ARow: Integer; AText:
  AnsiString);
var
  hh, ww, xx, yy: Integer;
  str1: AnsiString;
begin
  if AText <> '' then
  begin
    str1 := FilterISO1022(AText);

    Dest.Font.Assign(ADicomImage.Font);
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
          yy := Dest.height - hh * (ARow + 1);
        end;
      daRightTop:
        begin //right top
          xx := Dest.Width - ww - 6;
          yy := hh * (ARow - 1);
        end;
      daRightBottom:
        begin //right t
          xx := Dest.Width - ww - 6;
          yy := Dest.height - hh * (ARow + 1);
        end;
    end; // case
    if ADicomImage.LabelFontColor = clBlack then
    begin
      if ADicomImage.FontSpacing < 8 then
      begin
        Dest.RenderText((xx), (yy), str1, 0, clBlack);
        //Dest.RenderText((xx + 1), (yy + 1), str1, 0, clWhite32);
      end
      else
      begin
        //Dest.Font.Name := '宋体';
        Dest.Font.Color := clBlack;
        Dest.Textout((xx), (yy), str1);
        //Dest.Font.Color := clWhite;
        //Dest.Textout((xx + 1), (yy + 1), str1);
      end;
    end
    else
    begin
      if ADicomImage.FontSpacing < 8 then
      begin
        Dest.RenderText((xx), (yy), str1, 0, ADicomImage.LabelFontColor);
        //Dest.RenderText((xx + 1), (yy + 1), str1, 0, clWhite32);
      end
      else
      begin
        Dest.Font.Color := ADicomImage.LabelFontColor;
        Dest.Textout((xx), (yy), str1);
      end;
    end
  end;
end;

function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TDicomBitmap16; WithLabel: Boolean): Boolean;
var
  x1, y1: Integer;

  d1, d2: TDicomImageData;

  ABitmap: TDicomBitmap16;

  {$IFDEF DICOMDEBUX1}
  iii: Integer;
  {$ENDIF}
  {$IFDEF FOR_TRIAL_VERSION}
  l0, l1, l2: Integer;
  {$ENDIF}
  lCen, lWid: integer;

  nn: Boolean;
  lRange, min16, max16: integer;

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
  Result := false;

  d1 := ADicomImage.ImageData[ADicomImage.BaseFrameIndex + ADicomImage.CurrentFrame];
  if not assigned(d1) then
  begin
    ABitmapEx.SetSize(512, 512);
    ABitmapEx.Font.Size := 40;
    ABitmapEx.Font.Color := clRed;
    ABitmapEx.Textout(0, ABitmapEx.Height div 2, 'No Image Data');
    exit;
  end;
  if d1.Data = nil then
  begin
    ABitmapEx.SetSize(512, 512);
    ABitmapEx.Font.Size := 40;
    ABitmapEx.Font.Color := clRed;
    ABitmapEx.Textout(0, ABitmapEx.Height div 2, 'No Image Data or decompress fail');
    exit;
  end;
  Result := ADicomImage.DecompressData(ADicomImage.BaseFrameIndex + ADicomImage.CurrentFrame);
  if not Result then
    exit;

  lCen := Trunc((ADicomImage.WindowCenter - ADicomImage.RescaleIntercept) / ADicomImage.RescaleSlope);
  lWid := abs(trunc((ADicomImage.WindowWidth / ADicomImage.RescaleSlope) / 2));

  min16 := lCen - lWid;
  max16 := lCen + lWid;
  lRange := (max16 - min16);

  if lRange = 0 then
    exit;
  //  lScaleShl10 := 255 / lRange;
  nn := ADicomImage.Negative xor (ADicomImage.PhotometricInterpretation = 'MONOCHROME1');

  if (ADicomImage.AspectRatio = 1) and (ADicomImage.ImageAngle = 0) then
  begin
    ABitmap := ABitmapEx;
  end
  else
  begin
    //ABitmap := TDicomBitmap16.Create;
  end;

  if (ABitmap.Width <> ADicomImage.Width) or (ABitmap.Height <> ADicomImage.Height) then
  begin
    ABitmap.SetSize(ADicomImage.Width, ADicomImage.Height)
  end;

  if ADicomImage.SamplePerPixel = 1 then
  begin
    if (ADicomImage.Bits > 8) then
    begin
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanar12DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ABitmap.DataBits, nn)
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanar12DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ABitmap.DataBits, nn)
          else
            vImageConvert_Planar16StoPlanar12DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ABitmap.DataBits, nn)
        end;
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanar12Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.MergeFactor / 100.0, ABitmap.DataBits, nn)
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanar12Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.MergeFactor / 100, ABitmap.DataBits, nn)
          else
            vImageConvert_Planar16StoPlanar12Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.MergeFactor / 100, ABitmap.DataBits, nn)
        end;
      end
      else
      begin
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanar12(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ABitmap.DataBits, nn)
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanar12(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ABitmap.DataBits, nn)
          else
            vImageConvert_Planar16StoPlanar12(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ABitmap.DataBits, nn);
        end;
      end;
    end
    else
    begin
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        vImageConvert_Planar8toPlanar12DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ABitmap.DataBits, nn);
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        vImageConvert_Planar8toPlanar12Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.MergeFactor / 100, ABitmap.DataBits, nn);
      end
      else
        vImageConvert_Planar8toPlanar12(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ABitmap.DataBits, nn);
    end;
  end
  else
  begin
    //vImageConvert_PlanarRGBtoPlanar12(d1.Data, width, height, ABitmap.ScanLine[0], width, height, max16, min16, ABitmap.DataBits,nn);
  end;

  (* if (fAspectRatio <> 1) or (ImageAngle > 0) then
   begin
     AT := TAffineTransformation.Create;
     try
       AT.SrcRect := FloatRect(0, 0, ABitmap.Width - 1, ABitmap.Height - 1);
       if (fAspectRatio <> 1) then
       begin

         begin
           if not fMPRMode then
           begin
             ABitmapEx.SetSize(trunc(Width / fAspectRatio), height);
             AT.Scale(1 / fAspectRatio, 1);
           end
           else
           begin
             ABitmapEx.SetSize(Width, trunc(height * fAspectRatio));
             AT.Scale(1, fAspectRatio);
           end;
         end;
         {$IFDEF DEPRECATEDMODE}
         ABitmap.StretchFilter := sfLanczos;
         {$ELSE}
         TKernelResampler.Create(ABitmap);
         TKernelResampler(ABitmap.Resampler).Kernel := TCubicKernel.Create;
         //      TLinearResampler.Create(ABitmap);
         {$ENDIF}
       end;
       if ImageAngle > 0 then
       begin
         SrcR := ABitmap.Width - 1;
         SrcB := ABitmap.Height - 1;

         // move the origin to a center for scaling and rotation
         AT.Translate(-SrcR / 2, -SrcB / 2);
         AT.Rotate(0, 0, ImageAngle);
         Alpha := ImageAngle * PI / 180;

         // get the width and height of rotated image (without scaling)
         Sx := Abs(SrcR * Cos(Alpha)) + Abs(SrcB * Sin(Alpha));
         Sy := Abs(SrcR * Sin(Alpha)) + Abs(SrcB * Cos(Alpha));
         ABitmapEx.SetSize(Round(sx), Round(sy));

         // calculate a new scale so that the image fits in original boundaries
         Sx1 := ABitmap.Width / Sx;
         Sy1 := ABitmap.Height / Sy;
         scale := Min(Sx1, Sy1);

         AT.Scale(Scale, Scale);

         // move the origin back
         //T.Translate(SrcR / 2, SrcB / 2);
         AT.Translate(sx / 2, sy / 2);
       end;

       // transform the bitmap
       ABitmapEx.BeginUpdate;
       //ABitmapEx.Clear(clBlack32);
       Transform(ABitmapEx, ABitmap, AT);
       ABitmapEx.EndUpdate;

       //Transform(ABitmapEx, ABitmap, AT);
     finally
       AT.Free;
     end;

     //ABitmapEx.Draw(Rect(0, 0, ABitmapEx.Width, ABitmapEx.height), Rect(0, 0, ABitmap.Width, ABitmap.Height), ABitmap);
     ABitmap.Free;
   end; *)
  {$IFDEF FOR_TRIAL_VERSION}
  if (PacsSoftwareName <> '') or (UserHospitalName <> '') then
  begin
    ABitmapEx.Font.Color := clGreen;
    l0 := Length(PacsSoftwareName);
    l2 := Length(UserHospitalName);
    if l2 > l0 then
      l0 := l2;
    if l0 < 20 then
      l0 := 20;
    ABitmapEx.Font.Size := Round(ABitmapEx.Width * 0.7 / l0);
    l0 := ABitmapEx.TextWidth(PacsSoftwareName);
    l1 := ABitmapEx.TextWidth(UserHospitalName);
    l2 := ABitmapEx.TextHeight(UserHospitalName);
    ABitmapEx.TextOut((ABitmapEx.Width - l0) div 2, (ABitmapEx.Height) div 2 - l2,
      PacsSoftwareName);
    ABitmapEx.TextOut((ABitmapEx.Width - l1) div 2, (ABitmapEx.Height) div 2, UserHospitalName);

    {ABitmapEx.Canvas.Font.Color := clRed;
    //ABitmap.Font.Size := 18;

    if Min(ABitmapEx.Width, ABitmapEx.Height) <= 512 then
      ABitmapEx.Canvas.Font.Size := 9
    else
      if Min(ABitmapEx.Width, ABitmapEx.Height) <= 1024 then
      ABitmapEx.Canvas.Font.Size := 12
    else
      if Min(ABitmapEx.Width, ABitmapEx.Height) <= 1600 then
      ABitmapEx.Canvas.Font.Size := 18
    else
      ABitmapEx.Canvas.Font.Size := 36;  }

    ABitmapEx.TextOut((ABitmapEx.Width - ABitmapEx.TextWidth(UserHospitalName)) shr 1, 2,
      UserHospitalName);
  end;
  {$ENDIF}
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    x1 := ADicomImage.Attributes.getInteger($2811, $20E);
    y1 := ADicomImage.Attributes.getInteger($2811, $20F);
    if (x1 <> 0) and (y1 <> 0) then
    begin
      //ABitmapEx.
      //ABitmapEx.FillRectS(x1 - 20, y1 - 20, x1 + 20, y1 + 20, clRed32);
    end;
  end;
  if ADicomImage.PostFilter > 0 then
  begin
    //  ConvolveBitmap(FPostFilter, ABitmapEx);
    //ApplyConv3x3(FPostFilter, ABitmapEx);
  end;

  //DrawOverlayTo(ABitmapEx);
  if WithLabel or RuntimeTextInBitmapMode then
  begin
    OverlayLabels(ADicomImage, ABitmapEx, true);
    //    DrawUserLabels(ABitmap);
  end; // else }
  //  DisplayCommonListForVR(ABitmapEx);

 { if assigned(FTopoIconBitmap32) and (FTopoIconBitmap32.Width > 0) then
    ABitmap.Draw(Rect(ABitmap.Width * 3 div 4, ABitmap.Height * 3 div 4, ABitmap.Width,
      ABitmap.Height),
      Rect(0, 0, FTopoIconBitmap32.Width, FTopoIconBitmap32.Height), FTopoIconBitmap32);
  }
end;

procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
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
  MyTextOut(ADicomImage, Dest, daLeftTop, 1, ADicomImage.Attributes.GetString(8, $1090));
  MyTextOut(ADicomImage, Dest, daLeftTop, 2, 'Ex:' + ADicomImage.Attributes.GetString($20, $10));
  MyTextOut(ADicomImage, Dest, daLeftTop, 3, 'Se:' + ADicomImage.Attributes.GetString($20, $11));
  MyTextOut(ADicomImage, Dest, daLeftTop, 5, 'Im:' + ADicomImage.Attributes.GetString($20, $13));
  MyTextOut(ADicomImage, Dest, daLeftTop, 6, FormatFloat('DFOV:#.00cm', ADicomImage.PixelSpacingX * ADicomImage.Width));
  MyTextOut(ADicomImage, Dest, daLeftTop, 7, ADicomImage.Attributes.GetString($18, $1210));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  MyTextOut(ADicomImage, Dest, daRightTop, 3, ADicomImage.Attributes.GetString($10, $10));
  MyTextOut(ADicomImage, Dest, daRightTop, 4, ADicomImage.Attributes.GetString($10, $40) + ' ' +
    Delete0FromAge(ADicomImage.Attributes.GetString($10, $1010)) + ' ' +
    ADicomImage.Attributes.GetString($10, $20));
  if ADicomImage.Attributes.Item[8, $23] <> nil then
  begin
    MyTextOut(ADicomImage, Dest, daRightTop, 5, ADicomImage.Attributes.GetString(8, $23));
    MyTextOut(ADicomImage, Dest, daRightTop, 6, ADicomImage.Attributes.GetString(8, $33));
  end
  else
  begin
    MyTextOut(ADicomImage, Dest, daRightTop, 5, ADicomImage.Attributes.GetString(8, $20));
    MyTextOut(ADicomImage, Dest, daRightTop, 6, ADicomImage.Attributes.GetString(8, $30));
  end;

  MyTextOut(ADicomImage, Dest, daLeftBottom, 6, 'kV:' + ADicomImage.Attributes.GetString($18, $60));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 5, 'mA:' + ADicomImage.Attributes.GetString($18, $1151));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 4, ADicomImage.Attributes.GetString($18, $50) + 'mm');
  MyTextOut(ADicomImage, Dest, daLeftBottom, 3, 'Tilt:' + ADicomImage.Attributes.GetString($18, $1120));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 2, ADicomImage.Attributes.GetString($8, $30));
  //    MyTextOut(daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daLeftBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
  //  MyTextOut(Dest,daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
begin
  {$IFDEF SHOW_ALL_PATIENT_INFO}
  MyTextOut(ADicomImage, Dest, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $10),
    ADicomImage.Attributes.GetString($10, $40), ADicomImage.Attributes.GetString($10, $1010)]));
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
  {$ENDIF}

  MyTextOut(ADicomImage, Dest, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20));
  //  MyTextOut(Dest, daLeftTop, 3, Attributes.GetString($10, $30));
  MyTextOut(ADicomImage, Dest, daLeftTop, 3, ADicomImage.Attributes.GetString($20, $10));

  if ADicomImage.Attributes.Item[8, $23] <> nil then
  begin
    MyTextOut(ADicomImage, Dest, daRightTop, 5, ADicomImage.Attributes.GetString(8, $23));
    MyTextOut(ADicomImage, Dest, daRightTop, 6, ADicomImage.Attributes.GetString(8, $33));
  end
  else
  begin
    MyTextOut(ADicomImage, Dest, daRightTop, 5, ADicomImage.Attributes.GetString(8, $20));
    MyTextOut(ADicomImage, Dest, daRightTop, 6, ADicomImage.Attributes.GetString(8, $30));
  end;

  //MyTextOut(Dest, daLeftTop, 6, 'IM ' + Attributes.GetString($20, $13));

  if ADicomImage.Attributes.ImageData.FrameCount > 1 then
    MyTextOut(ADicomImage, Dest, daLeftTop, 7, 'FRAME ' + IntToStr(ADicomImage.Attributes.ImageData.CurrentFrame));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, 'Unregistered dicomvcl of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  MyTextOut(Dest, daRightTop, 1, Attributes.GetString(8, $80));
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    MyTextOut(ADicomImage, Dest, daRightTop, 3, ADicomImage.Attributes.GetString($18, $15));
    MyTextOut(ADicomImage, Dest, daRightTop, 4, ADicomImage.Attributes.GetString($8, $103E));
  end
  else
  begin
    // MyTextOut(Dest, daRightTop, 3, Attributes.GetString($8, $1090));
    // MyTextOut(Dest, daRightTop, 4, Attributes.GetString($18, $1020));
  end;

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
end;

procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
var
  da1, da2: TDicomAttribute;
  str1: AnsiString;
begin
  str1 := ADicomImage.Attributes.GetString($10, $1010);
  if str1 = '' then
    MyTextOut(ADicomImage, Dest, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10))
  else
  begin
    {$IFDEF SHOW_ALL_PATIENT_INFO}
    MyTextOut(ADicomImage, Dest, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $10),
      ADicomImage.Attributes.GetString($10, $40), str1]));
    {$ELSE}
    MyTextOut(ADicomImage, Dest, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
    {$ENDIF}
  end;

  MyTextOut(ADicomImage, Dest, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20));
  MyTextOut(ADicomImage, Dest, daLeftTop, 3, ADicomImage.Attributes.GetString($10, $30));
  if assigned(ADicomImage.Attributes.Item[8, $22]) then
  begin
    //    MyTextOut(Dest, daLeftTop, 1, Attributes.GetString($10, $10));
    MyTextOut(ADicomImage, Dest, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $22));
  end
  else
  begin
    //    MyTextOut(Dest, daLeftTop, 1, Format('%s %s %s', [Attributes.GetString($10, $10),
    //      Attributes.GetString($10, $40), Attributes.GetString($10, $1010)]));
    MyTextOut(ADicomImage, Dest, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $23));
  end;

  if assigned(ADicomImage.Attributes.Item[8, $32]) then
    MyTextOut(ADicomImage, Dest, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $32))
  else
    MyTextOut(ADicomImage, Dest, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $33));

  MyTextOut(ADicomImage, Dest, daLeftTop, 6, 'TP ' + ADicomImage.Attributes.GetString($20, $1041));
  if assigned(ADicomImage.Attributes.Item[$20, $13]) then
  begin
    MyTextOut(ADicomImage, Dest, daLeftTop, 7, 'IMA ' + ADicomImage.Attributes.GetString($20, $13));
    MyTextOut(ADicomImage, Dest, daLeftTop, 8, 'SEQ ' + ADicomImage.Attributes.GetString($20, $11));
  end
  else
  begin
    MyTextOut(ADicomImage, Dest, daLeftTop, 7, 'IMA ' + ADicomImage.Attributes.GetString($20, $12));
    MyTextOut(ADicomImage, Dest, daLeftTop, 8, 'SEQ ' + ADicomImage.Attributes.GetString($20, $11));
  end;
  MyTextOut(ADicomImage, Dest, daLeftTop, 9, ADicomImage.Attributes.GetString($8, $103E));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  MyTextOut(Dest, daRightTop, 1, Attributes.GetString(8, $80));
  MyTextOut(ADicomImage, Dest, daRightTop, 3, ADicomImage.Attributes.GetString($8, $1090));
  MyTextOut(ADicomImage, Dest, daRightTop, 4, ADicomImage.Attributes.GetString($18, $1020));
  //    MyTextOut(daRightTop, 4, Attributes.GetString(8, $20));

  MyTextOut(ADicomImage, Dest, daLeftBottom, 8, Format('kV %s', [ADicomImage.Attributes.GetString($18, $60)]));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 7, Format('mA %s', [ADicomImage.Attributes.GetString($18, $1151)]));
  if ADicomImage.Attributes.GetString($18, $50) <> '' then
  try
    MyTextOut(ADicomImage, Dest, daLeftBottom, 6, Format('Ti %6.1f', [DicomStrToFloat(ADicomImage.Attributes.GetString($18,
        $50))]));
    MyTextOut(ADicomImage, Dest, daLeftBottom, 5, Format('GT %6.1f', [DicomStrToFloat(ADicomImage.Attributes.GetString($18,
        $1120))]));
    MyTextOut(ADicomImage, Dest, daLeftBottom, 4, Format('SL %6.1f', [DicomStrToFloat(ADicomImage.Attributes.GetString($18,
        $50))]));
  except
  end;
  da1 := ADicomImage.Attributes.Item[$21, $1011];
  da2 := ADicomImage.Attributes.Item[$21, $1120];
  if assigned(da1) and assigned(da2) then
  begin
    MyTextOut(ADicomImage, Dest, daLeftBottom, 3, Format('%d  %d/%d', [da2.AsInteger[0], da1.AsInteger[0],
      da1.AsInteger[1]]));
  end;
  MyTextOut(ADicomImage, Dest, daLeftBottom, 2, ADicomImage.Attributes.GetString($18, $1210));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 1, '001 940');
  //    MyTextOut(Dest,daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
  //    MyTextOut(daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
var
  da1: TDicomAttribute;
begin
  {$IFDEF SHOW_ALL_PATIENT_INFO}
  MyTextOut(ADicomImage, Dest, daLeftTop, 1, Format('%s %sT %s', [ADicomImage.Attributes.GetString($8, $1090),
    ADicomImage.Attributes.GetString($18, $87), ADicomImage.Attributes.GetString($8, $1010)]));
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
  {$ENDIF}

  MyTextOut(ADicomImage, Dest, daLeftTop, 2, 'Ex: ' + ADicomImage.Attributes.GetString($20, $10));
  MyTextOut(ADicomImage, Dest, daLeftTop, 3, 'Se: ' + ADicomImage.Attributes.GetString($20, $11));
  MyTextOut(ADicomImage, Dest, daLeftTop, 4, 'Im: ' + ADicomImage.Attributes.GetString($20, $13));
  MyTextOut(ADicomImage, Dest, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $103E));
  MyTextOut(ADicomImage, Dest, daLeftTop, 10, 'ET: ' + ADicomImage.Attributes.GetString($18, $91));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  MyTextOut(Dest, daRightTop, 1, Attributes.GetString(8, $80));
  MyTextOut(ADicomImage, Dest, daRightTop, 3, ADicomImage.Attributes.GetString($10, $10));
  MyTextOut(ADicomImage, Dest, daRightTop, 4, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $40),
    ADicomImage.Attributes.GetString($10, $1010), ADicomImage.Attributes.GetString($10, $20)]));
  MyTextOut(ADicomImage, Dest, daRightTop, 6, ADicomImage.Attributes.GetString($8, $21));
  MyTextOut(ADicomImage, Dest, daRightTop, 7, ADicomImage.Attributes.GetString($8, $31));
  MyTextOut(ADicomImage, Dest, daRightTop, 8, 'Mag=' + ADicomImage.Attributes.GetString($18, $21));

  MyTextOut(ADicomImage, Dest, daLeftBottom, 11, ADicomImage.Attributes.GetString($19, $109C)); //$18, $20));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 10, Format('TR:%d', [ADicomImage.Attributes.GetInteger($18, $80)]));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 9, Format('TE:%s/Ef', [ADicomImage.Attributes.GetString($18, $81)]));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 8, Format('EC:%d/1 %dkHz', [ADicomImage.Attributes.GetInteger($18, $86), 11]));

  MyTextOut(ADicomImage, Dest, daLeftBottom, 6, ADicomImage.Attributes.GetString($18, $1250));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 5, Format('FOV:%dx%d', [
    trunc(ADicomImage.Width * ADicomImage.Attributes.ImageData.PixelSpacingX), trunc(ADicomImage.height *
      ADicomImage.Attributes.ImageData.PixelSpacingY)]));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 4, Format('%d.0 thk/ %d.0sp', [ADicomImage.Attributes.GetInteger($18, $50),
    1]));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 3, Format('15/4:%d', [ADicomImage.Attributes.GetInteger($18, $95)]));

  da1 := ADicomImage.Attributes.Item[$18, $1310];
  if assigned(da1) and (da1.GetCount > 0) then
  begin
    if da1.AsInteger[0] = 0 then
      MyTextOut(ADicomImage, Dest, daLeftBottom, 2, Format('%d*%d/4 NEX', [da1.AsInteger[1], da1.AsInteger[2]]))
    else
      MyTextOut(ADicomImage, Dest, daLeftBottom, 2, Format('%d*%d/4 NEX', [da1.AsInteger[0], da1.AsInteger[3]]))
  end;
  //MyTextOut(Dest, daLeftBottom, 1, Attributes.GetString($18, $22));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, Format('W = %5d  L = %5d', [ADicomImage.WindowWidth, ADicomImage.WindowCenter]));
end;

procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
var
  str1: string;
begin
  {$IFDEF SHOW_ALL_PATIENT_INFO}
  MyTextOut(ADicomImage, Dest, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $10),
    ADicomImage.Attributes.GetString($10, $40), ADicomImage.Attributes.GetString($10, $1010)]));
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
  {$ENDIF}

  MyTextOut(ADicomImage, Dest, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20));
  MyTextOut(ADicomImage, Dest, daLeftTop, 3, ADicomImage.Attributes.GetString($10, $30));

  MyTextOut(ADicomImage, Dest, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $23));
  MyTextOut(ADicomImage, Dest, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $33));
  MyTextOut(ADicomImage, Dest, daLeftTop, 6, 'IMAGE ' + ADicomImage.Attributes.GetString($20, $13));
  MyTextOut(ADicomImage, Dest, daLeftTop, 7, 'SPI ' + ADicomImage.Attributes.GetString($20, $11));
  if ADicomImage.Attributes.GetString($18, $1250) <> '' then
    MyTextOut(ADicomImage, Dest, daLeftTop, 8, ADicomImage.Attributes.GetString($18, $1250))
  else
    MyTextOut(ADicomImage, Dest, daLeftTop, 8, ADicomImage.Attributes.GetString($8, $103E));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  MyTextOut(Dest, daRightTop, 1, Attributes.GetString(8, $80));
  MyTextOut(ADicomImage, Dest, daRightTop, 3, ADicomImage.Attributes.GetString($8, $1090));
  MyTextOut(ADicomImage, Dest, daRightTop, 4, ADicomImage.Attributes.GetString($18, $1020));
  //    MyTextOut(daRightTop, 4, Attributes.GetString(8, $20));

  MyTextOut(ADicomImage, Dest, daLeftBottom, 8, ADicomImage.Attributes.GetString($18, $24));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 7, '  *');

  MyTextOut(ADicomImage, Dest, daLeftBottom, 6, ADicomImage.Attributes.GetString($18, $20));
  //  MyTextOut(Dest, daLeftBottom, 5, 'TR ' + Attributes.GetString($18, $60));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 5, Format('TR %8d', [ADicomImage.Attributes.GetInteger($18, $80)]));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 4, Format('TE %6d/1', [ADicomImage.Attributes.GetInteger($18, $81)]));
  //MyTextOut(Dest, daLeftBottom, 3, Format('TA    01:46', [Attributes.GetInteger($18, $50)]));
  //MyTextOut(Dest, daLeftBottom, 2, Format('AC          1', [Attributes.GetInteger($18, $1120)]));

  MyTextOut(ADicomImage, Dest, daLeftBottom, 3, Format('FA: %s TI: %s', [ADicomImage.Attributes.GetString($18, $1314), ADicomImage.Attributes.GetString($18, $82)]));

  str1 := ADicomImage.Attributes.GetString($18, $1312);
  if str1 = 'ROW' then
    str1 := '←→'
  else
    if str1 = 'COL' then
    str1 := '↑↓';
  MyTextOut(ADicomImage, Dest, daLeftBottom, 2, Format('PE:%s', [str1]));
  //AddInformationLabel(2, 3, 'FA: [$18, $1314], TI: [$18, $82]');
  //AddInformationLabel(2, 2, 'PE: [$18, $1312]');

  //MyTextOut(daLeftBottom, 1, 'SL ' + Attributes.GetString($18, $1120));

  MyTextOut(ADicomImage, Dest, daLeftBottom, 1, '                      ' + ADicomImage.Attributes.GetString($20, $4000));
  //    MyTextOut(daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  if ADicomImage.Attributes.GetString($20, $1041) <> '' then
    MyTextOut(ADicomImage, Dest, daRightBottom, 7, Format('SP%15.2f', [DicomStrToFloat(ADicomImage.Attributes.GetString($20,
        $1041))]));
  if ADicomImage.Attributes.GetString($18, $50) <> '' then
    MyTextOut(ADicomImage, Dest, daRightBottom, 6, Format('SL%15.2f', [DicomStrToFloat(ADicomImage.Attributes.GetString($18,
        $50))]));
  MyTextOut(ADicomImage, Dest, daRightBottom, 5, Format('FoV%5d*%5d', [
    trunc(ADicomImage.Width * ADicomImage.Attributes.ImageData.PixelSpacingX * 10), trunc(ADicomImage.height *
      ADicomImage.Attributes.ImageData.PixelSpacingY * 10)]));
  //  MyTextOut(Dest, daRightBottom, 4, '   ' + Attributes.GetString($18, $60));
  MyTextOut(ADicomImage, Dest, daRightBottom, 3, Format('Tra>Cor    -10', [ADicomImage.Attributes.GetString($18, $60)]));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
  //    MyTextOut(daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ARight, ABottom: Boolean);
var
  mh, mw, cw, ch, x, y, kk: Integer;
  kw, kh, ny, nx, f1, x1, z1: Double;
  //  str1: AnsiString;
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
  f1 := Min(Dest.Width / ADicomImage.Width, Dest.height / ADicomImage.Height);
  mh := Dest.Height;
  mw := Dest.Width;
  if ADicomImage.RulerUnit = ruCentimeter then
    kh := ((ADicomImage.ViewerZoom * f1) / ny)
  else
    kh := ((ADicomImage.ViewerZoom * f1) / (ny * 10));
  //add 2010-4-10
  if kh <= 0.001 then
    exit;

  if false {AInfoFontSize > 20} then
  begin
    //        Canvas.Pen.Width := 5;
    cw := mw - 50;
    ch := mh - 50;
    kk := 20
  end
  else
  begin
    //        Dest.Pen.Width := 1;
    cw := trunc(mw * 0.95);
    ch := trunc(mh * 0.95);
    kk := 5;
  end;
  {
    begin
      Dest.Font.Color := clRed;
      Dest.TextOut((mw - Dest.TextWidth(UserHospitalName)) shr 1, 2, UserHospitalName);
    end;
  }

  x1 := (((mh * 0.3) / kh) * kh);
  y := 0;
  z1 := (((mh * 0.7) / kh) * kh);
  //  z1 := ((z1 - x) div 5) * 5;

  if ARight then
  begin
    Dest.LineS(cw, round(x1), cw, round(z1), clWhite, false);
    while x1 <= z1 do
    begin
      x := round(x1);
      if (y mod 5) = 0 then
      begin
        Dest.LineS(cw - kk * 2, x, cw, x, clWhite, false);
      end
      else
      begin
        Dest.LineS(cw - kk, x, cw, x, clWhite, false);
      end;
      inc(y);
      x1 := (x1 + kh);
    end;
  end;

  if ADicomImage.RulerUnit = ruCentimeter then
    kw := ((ADicomImage.ViewerZoom * f1) / nx)
  else
    kw := ((ADicomImage.ViewerZoom * f1) / (nx * 10));

  //add 2010-4-10
  if kw <= 0.001 then
    exit;

  x1 := (((mw * 0.3) / kw) * kw);
  y := 0;
  z1 := (((mw * 0.7) / kw) * kw);
  //  z1 := ((z1 - x) div 5) * 5;

  if ABottom then
  begin
    Dest.LineS(round(x1), ch, round(z1), ch, clWhite, false);
    while x1 <= z1 do
    begin
      x := round(x1);
      if (y mod 5) = 0 then
      begin
        Dest.LineS(x, ch - kk * 2, x, ch, clWhite, false);
      end
      else
      begin
        Dest.LineS(x, ch - kk, x, ch, clWhite, false);
      end;
      inc(y);
      x1 := (x1 + kw);
    end;
  end;
end;

procedure DrawImagePosition(ADicomImage: TDicomImage; Dest: TDicomBitmap16);
var
  LeftCaption: AnsiString;
  TopCaption: AnsiString;
  RightCaption: AnsiString;
  BottomCaption: AnsiString;

  LeftCaption1: AnsiString;
  TopCaption1: AnsiString;
  RightCaption1: AnsiString;
  BottomCaption1: AnsiString;

  o: TStructPlane3D;
  mw, mh: Integer;

  //  k1: Integer;
begin
  o := ADicomImage.planeForImage;
  {$IFNDEF FOR_TENFENG_MR}
  LeftCaption := ADicomImage.getOrientationText(o.XNormalVector, True);
  RightCaption := ADicomImage.getOrientationText(o.XNormalVector, False);

  TopCaption := ADicomImage.getOrientationText(o.YNormalVector, True);
  BottomCaption := ADicomImage.getOrientationText(o.YNormalVector, False);
  {$ELSE}
  k1 := ADicomImage.Attributes.GetInteger($20, $37);
  if k1 = 10001 then
  begin
    LeftCaption := 'A';
    RightCaption := 'P';
  end
  else
  begin
    LeftCaption := 'R';
    RightCaption := 'L';
  end;
  {$ENDIF}
  {  case fSliceAxel of
      0:
        begin
          LeftCaption := getOrientationText(o.XNormalVector, True);
          RightCaption := getOrientationText(o.XNormalVector, False);

          TopCaption := getOrientationText(o.YNormalVector, True);
          BottomCaption := getOrientationText(o.YNormalVector, False);
        end;
      1:
        begin
          LeftCaption := getOrientationText(o.XNormalVector, True);
          RightCaption := getOrientationText(o.XNormalVector, False);

          TopCaption := getOrientationText(o.YNormalVector, True);
          BottomCaption := getOrientationText(o.YNormalVector, False);
        end;
      2:
        begin
          LeftCaption := getOrientationText(o.XNormalVector, True);
          RightCaption := getOrientationText(o.XNormalVector, False);

          TopCaption := getOrientationText(o.YNormalVector, True);
          BottomCaption := getOrientationText(o.YNormalVector, False);
        end;
    end;  }
  if ADicomImage.HozFlip then
  begin
    LeftCaption1 := RightCaption;
    RightCaption1 := LeftCaption;
  end
  else
  begin
    LeftCaption1 := LeftCaption;
    RightCaption1 := RightCaption;
  end;
  if ADicomImage.VerFlip then
  begin
    TopCaption1 := BottomCaption;
    BottomCaption1 := TopCaption;
  end
  else
  begin
    TopCaption1 := TopCaption;
    BottomCaption1 := BottomCaption;
  end;

  case ADicomImage.Rotate of
    0:
      begin
        LeftCaption := LeftCaption1;
        RightCaption := RightCaption1;
        TopCaption := TopCaption1;
        BottomCaption := BottomCaption1;
      end;
    1:
      begin
        TopCaption := RightCaption1;
        LeftCaption := TopCaption1;
        BottomCaption := LeftCaption1;
        RightCaption := BottomCaption1;
      end;
    2:
      begin
        TopCaption := BottomCaption1;
        LeftCaption := RightCaption1;
        BottomCaption := TopCaption1;
        RightCaption := LeftCaption1;
      end;
    3:
      begin
        TopCaption := LeftCaption1;
        LeftCaption := BottomCaption1;
        BottomCaption := RightCaption1;
        RightCaption := TopCaption1;
      end;
  end;
  mw := Dest.Width;
  mh := Dest.Height;

  if LeftCaption <> '' then
    Dest.RenderText(2, mh shr 1, LeftCaption, OverlayTextLevel, $FFFFFFFF);
  if TopCaption <> '' then
    Dest.RenderText(mw shr 1, 2, TopCaption, OverlayTextLevel, $FFFFFFFF);
  if RightCaption <> '' then
    Dest.RenderText(mw - 20, mh shr 1, RightCaption, OverlayTextLevel, $FFFFFFFF);
  if BottomCaption <> '' then
    Dest.RenderText(mw shr 1, mh - Dest.TextHeight('A') * 2, BottomCaption, OverlayTextLevel, $FFFFFFFF);
end;

procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TDicomBitmap16; ARect: TRect; ADisplayCalcText: Boolean;
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

      DrawTo(o1, ACanvas, AFontSize);
      //if ADisplayCalcText then
      //  o1.DrawText(ACanvas, ARect);
    end;
  end;
  //if assigned(FNewDrawObject) then
  //  if (FNewDrawObject.RelateFrameIndex = ACurrentFrameIndex) or (ACurrentFrameIndex = -1) then
  //    FNewDrawObject.DrawSelectGrip(ACanvas);
end;

procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; AFontSize: Integer);
var
  strs: TStringList;
  i: integer;
  x1, y1, x2, y2, sh: Integer;
  str1: AnsiString;
  c1: TColor;
begin
  Acanvas.Font.Assign(ADrawObject.Font);

  if AFontSize > 0 then
    Acanvas.Font.Size := AFontSize;

  if (ADrawObject.CalText <> '') or (ADrawObject.Name <> '') then
  begin
    strs := TStringList.Create;
    try
      strs.Text := ADrawObject.Name + ADrawObject.CalText;

      case ADrawObject.LabelPosition of
        dlmStartPoint:
          begin
            x1 := ADrawObject.SCRX[0] + 5;
            y1 := ADrawObject.SCRY[0] + 5;
          end;
        dlmEndPoint:
          begin // dlmEndPoint
            x1 := ADrawObject.SCRX[ADrawObject.GetCount - 1] + 5;
            y1 := ADrawObject.SCRY[ADrawObject.GetCount - 1] + 5;
          end;
        dlmFreeMove:
          begin
            x1 := ADrawObject.GetTextPointSCRX;
            y1 := ADrawObject.GetTextPointSCRY;
            //DrawLineS32();
            c1 := ADrawObject.PenColor; //Color32(Acanvas.Font.Color);
            ACanvas.PenColor := ADrawObject.PenColor;
            //ACanvas.SetStipple([c1, c1, 0, 0, c1, c1]);
            //ACanvas.StippleStep := 1;

            if ADrawObject.Kind in [ldmiROI_Cycle, ldmiSolidRect, ldmiROI_Rect] then
            begin
              x2 := (ADrawObject.SCRX[1] + ADrawObject.SCRX[0]) div 2;
              y2 := (ADrawObject.SCRY[1] + ADrawObject.SCRY[0]) div 2;
            end
            else
              if ADrawObject.Kind in [ldmiAngle] then
            begin
              x2 := ADrawObject.SCRX[1];
              y2 := ADrawObject.SCRY[1];
            end
            else
            begin
              x2 := ADrawObject.SCRX[0];
              y2 := ADrawObject.SCRY[0];
            end;
            ACanvas.LineS(x2, y2, x1, y1, ADrawObject.PenColor, true);

          end;
      else
        begin
          x1 := ADrawObject.SCRX[0] + 5;
          y1 := ADrawObject.SCRY[0] + 5;
        end;
      end;
      ACanvas.Font.size := ADrawObject.Parent.OwnImageData.CalFontSpacing(ACanvas.Width, ACanvas.Height);
      if ADrawObject.Textindex = 0 then
      begin
        sh := ACanvas.TextHeight(strs[0]) + 3;

        for i := 0 to strs.Count - 1 do
        begin
          if strs[i] <> '' then
          begin
            Acanvas.RenderText(x1, y1 + i * sh, strs[i], 0, (Acanvas.Font.Color));
            if ADrawObject.PenColor = clWhite then
              Acanvas.RenderText(x1 + 1, y1 + i * sh + 1, strs[i], 0, clBlack)
            else
              if ADrawObject.PenColor = clBlack then
              Acanvas.RenderText(x1 + 1, y1 + i * sh + 1, strs[i], 0, clWhite)
          end;
        end;
      end
      else
      begin
        str1 := IntToStr(abs(ADrawObject.Textindex));
        Acanvas.RenderText(x1, y1, str1, 0, (Acanvas.Font.Color));
        if ADrawObject.PenColor = clWhite then
          Acanvas.RenderText(x1 + 1, y1 + 1, str1, 0, clBlack)
        else
          if ADrawObject.PenColor = clBlack then
          Acanvas.RenderText(x1 + 1, y1 + 1, str1, 0, clWhite);

        DrawText(ADrawObject, ACanvas, Rect(0, 0, ACanvas.Width, ACanvas.Height));
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
        //DrawQuantitativeCoronaryAnaliysis(ADrawObject,ACanvas);
      end;
    ldmiCAPoly:
      begin
        //DrawLCA_RCA(ADrawObject,ACanvas);
      end;
    ldmiVentricularPolyon:
      begin
        //DrawVentricular(ADrawObject,ACanvas);
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
          ACanvas.LineS(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], clRed, true);
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
        //DrawSolidRect(ADrawObject,ACanvas);
      end;
    ldmiROI_Cycle:
      begin
        //DrawCycleROI(ADrawObject,ACanvas);
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
        //DrawVitexObject(ACanvas);
      end;
    ldmiPerpendicularityLine:
      begin
        //DrawPerpendicularityLine(ACanvas);
      end;
    ldmiArrow:
      begin
        if ADrawObject.GetCount = 2 then
          DrawArrow(ADrawObject, ACanvas);
      end;
  end;
end;

procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
var
  k, w, h: integer;
  //  x1, x2, y1, y2: Integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.PenColor);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.PenColor);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);

    w := abs(ADrawObject.scrX[1] - ADrawObject.scrX[0]) div 2;
    h := abs(ADrawObject.scrY[1] - ADrawObject.scrY[0]) div 2;

    {  x1 := Min(scrX[0], scrX[1]);
      x2 := Max(scrX[0], scrX[1]);
      y1 := Min(scrY[0], scrY[1]);
      y2 := Max(scrY[0], scrY[1]);

      DrawLineS32(ACanvas,x1 + w, y1 + h, x2 + w, y2 + h, fPenColor);}
      //    DrawLineS32(ACanvas,scrX[0] + w, scrY[0] + h, scrX[1] + w, scrY[1] + h, fPenColor);
  end;
end;

procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
var
  k: integer;
  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.PenColor);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.PenColor);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);

    Acanvas.Font.Assign(ADrawObject.Font);

    str1 := Format('W %f,H %f,W/H%4.2f', [abs(ADrawObject.X[0] - ADrawObject.X[1]) * ADrawObject.Parent.OwnImageData.PixelSpacingX,
      abs(ADrawObject.Y[0] - ADrawObject.Y[1]) * ADrawObject.Parent.OwnImageData.PixelSpacingY,
        abs(ADrawObject.X[0] - ADrawObject.X[1]) / abs(ADrawObject.Y[0] - ADrawObject.Y[1])]);
    ACanvas.Textout(Min(ADrawObject.scrX[0], ADrawObject.scrX[1]), Min(ADrawObject.scrY[0], ADrawObject.scrY[1]), str1);
  end;
end;

procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; AFontSize: Integer);
var
  k, x1, y1: integer;
  //  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    //if UserText <> '' then
    //else

    //ACanvas.SetStipple([PenColor, PenColor, 0, 0, PenColor, PenColor]);
    //ACanvas.StippleStep := 1;
    //ACanvas.LineFSP(scrX[0], scrY[0], scrX[1], scrY[1], false);

    DrawLineS32Ref(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
    if ADrawObject.PenColor = clWhite then
      DrawLineS32Ref(ADrawObject, ACanvas, ADrawObject.scrX[0] + 1, ADrawObject.scrY[0] + 1, ADrawObject.scrX[1] + 1, ADrawObject.scrY[1] + 1, clBlack)
    else
      if ADrawObject.PenColor = clBlack then
      DrawLineS32Ref(ADrawObject, ACanvas, ADrawObject.scrX[0] + 1, ADrawObject.scrY[0] + 1, ADrawObject.scrX[1] + 1, ADrawObject.scrY[1] + 1, clWhite);

    Acanvas.Font.Assign(ADrawObject.Font);
    //Acanvas.Font.Color := clRed;
    //Acanvas.Font.Size := 12;
    //k := StrToInt(UserText);
    if ADrawObject.UserText <> '' then
    begin
      try
        k := StrToInt(Trim(ADrawObject.UserText))
      except
        k := 0;
      end
    end
    else
      k := 0;
    if (k mod 2) = 0 then
    begin
      x1 := ADrawObject.scrX[1];
      y1 := ADrawObject.scrY[1];
      if (ADrawObject.scrX[1] - ADrawObject.scrX[0]) < (ADrawObject.scrY[1] - ADrawObject.scrY[0]) then
        x1 := x1 - 10
      else
        y1 := y1 - 10;
      Acanvas.RenderText(x1, y1, ADrawObject.UserText, 0, clRed);
    end
    else
    begin
      x1 := ADrawObject.scrX[0];
      y1 := ADrawObject.scrY[0];
      if (ADrawObject.scrX[1] - ADrawObject.scrX[0]) < (ADrawObject.scrY[1] - ADrawObject.scrY[0]) then
        x1 := x1 - 10
      else
        y1 := y1 - 10;

      Acanvas.RenderText(x1, y1, ADrawObject.UserText, 0, clRed);
    end;
    //    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[0], scrY[1], fPenColor);
    //    DrawLineS32(ACanvas,scrX[0], scrY[1], scrX[1], scrY[1], fPenColor);
    //    DrawLineS32(ACanvas,scrX[1], scrY[0], scrX[1], scrY[1], fPenColor);

  end;
end;

procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16);
var
  k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    {    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[1], scrY[0], fPenColor);
        DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[0], scrY[1], fPenColor);
        DrawLineS32(ACanvas,scrX[0], scrY[1], scrX[1], scrY[1], fPenColor);
        DrawLineS32(ACanvas,scrX[1], scrY[0], scrX[1], scrY[1], fPenColor);
    }
    Acanvas.Font.Assign(ADrawObject.Font);
    k := ACanvas.Font.Height;
    ACanvas.Font.Height := abs(ADrawObject.scrY[0] - ADrawObject.scrY[1]) - 4;

    //ACanvas.Font.Color := clBlack;
    ACanvas.Textout(Min(ADrawObject.scrX[0], ADrawObject.scrX[1]), Min(ADrawObject.scrY[0], ADrawObject.scrY[1]), ADrawObject.UserText);
    ACanvas.Font.Color := clWhite;
    ACanvas.Textout(Min(ADrawObject.scrX[0] + 1, ADrawObject.scrX[1] + 1), Min(ADrawObject.scrY[0] + 1, ADrawObject.scrY[1] + 1), ADrawObject.UserText);

    ACanvas.Font.Height := k;
  end;
end;

procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TDicomBitmap16; ARect: TRect);
var
  p1: TPoint;
  sh, sw, i: Integer;
  strs: TStringList;
  str1: AnsiString;
begin
  //ACanvas.Font.Assign(Font);
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
      Acanvas.RenderText(ARect.Right div 3, ARect.Bottom - (ADrawObject.TextIndex + 2) * (sh + 2),
        IntToStr(ADrawObject.TextIndex) + ':' + str1, 0, (Acanvas.Font.Color));
      Acanvas.Font.Color := clWhite;
      Acanvas.TextOut(ARect.Right div 3 + 1, ARect.Bottom - (ADrawObject.TextIndex + 2) * (sh + 2) + 1,
        IntToStr(ADrawObject.TextIndex) + ':' + str1);
    end
    else
    begin
      Acanvas.Font.Color := clBlack;
      Acanvas.RenderText(ARect.Right div 3, (-ADrawObject.TextIndex) * (sh + 2),
        IntToStr(abs(ADrawObject.TextIndex)) + ':' + str1, 0, (Acanvas.Font.Color));
      Acanvas.Font.Color := clWhite;
      Acanvas.TextOut(ARect.Right div 3 + 1, (-ADrawObject.TextIndex) * (sh + 2) + 1,
        IntToStr(abs(ADrawObject.TextIndex)) + ':' + str1);
    end;
  finally
    strs.Free;
  end;
end;

procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TDicomBitmap16; ADisplayWLLabel: Boolean);
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
      1: myTextOut(ADicomImage, Dest, daLeftTop, v1.OrderID, str1);
      2: myTextOut(ADicomImage, Dest, daLeftBottom, v1.OrderID, str1);
      3: myTextOut(ADicomImage, Dest, daRightTop, v1.OrderID, str1);
      4: myTextOut(ADicomImage, Dest, daRightBottom, v1.OrderID, str1);
      5: myTextOut(ADicomImage, Dest, daCenterTop, v1.OrderID, str1);
      6: myTextOut(ADicomImage, Dest, daCenterBottom, v1.OrderID, str1);
    end;
  end;
  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, Format('W = %5d  L = %5d', [ADicomImage.WindowWidth, ADicomImage.WindowCenter]));
end;

procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TDicomBitmap16);
begin

end;

end.

