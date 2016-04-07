unit DCM_ImageData_Bitmap32;

interface
{$I DicomPack.inc}
uses
  {$IFDEF LINUX}Types, Libc, QControls, Qgraphics, {$ELSE}
  Windows, Messages, Forms, Controls, graphics, {$ENDIF}
  SysUtils, Classes, {$IFDEF DICOMDEBUX1}DbugIntf, {$ENDIF}
  CnsMsg, DCM_Dict, DCM_UID, DcmImageConvert, DCM_Attributes, DCM_Templates,
  DCM32, DCM32_Transforms, DCM32_LowLevel, DCM32_Resamplers, math,
  DCM32_Lines, dialogs;

//TDicomDrawObject
procedure Spiral(ADrawObject: TDicomDrawObject; Buffer: TCnsBitmap32; X, Y, R: Integer);
procedure DrawLineS32(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; x1, y1, x2, y2: Integer;
  APenColor32: TColor32);
procedure DrawLineS32Ref(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; x1, y1, x2, y2: Integer;
  APenColor32: TColor32);

procedure DrawLCA_RCA(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawQuantitativeCoronaryAnaliysis(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawVentricular(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer; ACanvas: TCnsBitmap32);
procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawSelectGrip(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawRotateGrip(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawCycleROI(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawVitexObject(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawSolidRect(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawCycle(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; AFontSize: Integer);
procedure DrawPerpendicularityLine(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);

procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; AFontSize: Integer);
procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; ARect: TRect);

//TDicomDrawObjects
procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TCnsBitmap32; ARect: TRect; ADisplayCalcText: Boolean;
  ACurrentFrameIndex, AFontSize: Integer);

//TDicomImage
function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TCnsBitmap32; WithLabel: Boolean = false): Boolean;
procedure DrawBitmapTo(ADicomImage: TDicomImage; ABitmap: TCnsBitmap32; ARect: TRect);
procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
procedure DrawImagePosition(ADicomImage: TDicomImage; Dest: TCnsBitmap32);
procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ARight, ABottom: Boolean);

procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
procedure DisplayCommonListForVR(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);

procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TCnsBitmap32);
procedure myTextOut(ADicomImage: TDicomImage; Dest: TCnsBitmap32; AMode: TDisplayArea; ARow: Integer; AText: AnsiString);
procedure DrawImagePositionEx(ADicomImage: TDicomImage; Dest: TCnsBitmap32);

procedure DrawMeasureReport(ADicomImage: TDicomImage; Dest: TCnsBitmap32; AOffX, AOffY: Double);
function AssignToBitmapDefault(ADicomImage: TDicomImage; ABitmapEx: TCnsBitmap32; WithLabel: Boolean = false): Boolean;

procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Buffer: TCnsBitmap32; Zoom: Single = 1; AXOff: Integer =
  0; AYOff: Integer = 0);

////////////////////////

procedure _MorphFilter(bitmap: TCnsBitmap32; WindowSize: integer; op: integer; fSelx1, fSely1,
  fSelx2, fSely2: integer); overload;
procedure _ApplyFilter(bitmap: TCnsBitmap32; filter: TGraphFilter; fSelx1, fSely1, fSelx2, fSely2:
  integer); overload;
procedure _GetHistogram(Bitmap: TCnsBitmap32; var Hist: THistogram; fSelx1, fSely1, fSelx2, fSely2:
  integer); overload;
procedure _GetHistogram(Bitmap: TCnsBitmap32; var Hist: THistogram); overload;
procedure ScaleRot(Src, Dst: TCnsBitmap32; Alpha: Single);

function NewImage(ABitmap: TCnsBitmap32; AIsMONOCHROME: Boolean): TDicomAttributes; overload;
function NewImageForPrint(ABitmap: TCnsBitmap32; AIsMONOCHROME: Boolean): TDicomAttributes;
function NewImage(ADataset: TDicomAttributes; ABitmap: TCnsBitmap32; AIsMONOCHROME: Boolean): TDicomAttributes; overload;

implementation

// FOMIN 17.12.2012
Uses DICOM_charset;

function NewImageForPrint(ABitmap: TCnsBitmap32; AIsMONOCHROME: Boolean): TDicomAttributes;
var
  dimage: TDicomImageData;
  p1: Pointer;
  pb1: PByte;
  ALen, y: Integer;
  DestScanline: PColor32Array;
  prgb1: pRGB;
  da1: TDicomAttribute;
begin
  Result := TDicomAttributes.Create;

  //  Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
    //SOP CLASS
    //1.2.840.10008.5.1.4.1.1.2  CT
    //1.2.840.10008.5.1.4.1.1.7  secondary capture

  //  Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
    //  Result.AddVariant(8, $60, AModility);

    //  Result.AddVariant($20, $13, AImageIndex);
  Result.AddVariant($28, $11, ABitmap.Width);
  Result.AddVariant($28, $10, ABitmap.Height);
  //Result.AddVariant(8, $70, 'DicomVCL');
  //  Result.AddVariant(dSOPInstanceUID, FormatDatetime('yyyymmdd.hhnnss.zzzz', now) +
  //    IntToStr(random(100000)));

    //    if not AIsMONOCHROME then
  if (not AIsMONOCHROME) then
  begin
    Result.AddVariant($28, $2, 3);
    Result.AddVariant($28, $4, 'RGB');
    ALen := ABitmap.Width * ABitmap.Height * 3;
  end
  else
  begin
    Result.AddVariant($28, $2, 1);
    Result.AddVariant($28, $4, 'MONOCHROME2');
    ALen := ABitmap.Width * ABitmap.Height;
  end;
  Result.AddVariant($28, $100, 8);

  da1 := Result.Add($28, $34);
  da1.AsInteger[0] := 1;
  da1.AsInteger[1] := 1;

  Result.AddVariant($28, $101, 8);
  Result.AddVariant($28, $102, 7);

  Result.AddVariant($28, $103, 0);

  //Result.AddVariant($28, $6, 0);

  Getmem(p1, Alen);
  if not AIsMONOCHROME then
  begin
    prgb1 := p1;
    DestScanline := ABitmap.Bits;
    for y := 0 to (ABitmap.Height - 1) * (ABitmap.Width - 1) do // Iterate
    begin
      prgb1^.b := (DestScanLine[y] shr 16) and $FF;
      prgb1^.g := (DestScanLine[y] shr 8) and $FF;
      prgb1^.r := (DestScanLine[y]) and $FF;

      inc(prgb1);
    end; // for
  end
  else
  begin
    pb1 := p1;
    DestScanline := ABitmap.Bits;
    for y := 0 to (ABitmap.Height - 1) * (ABitmap.Width - 1) do // Iterate
    begin
      //0.3 x Red + 0.59  x Green + 0.11 x Blue
      pb1^ := Trunc(((DestScanLine[y] shr 16) and $FF) * 0.3 + ((DestScanLine[y] shr 8) and $FF) *
        0.59
        + ((DestScanLine[y]) and $FF) * 0.11);
      //pb1^ := DestScanLine[y] and $FF;
      inc(pb1);
    end; // for
  end;
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  Result.Add(32736, 16).AddData(dimage);
end;

function NewImage(ADataset: TDicomAttributes; ABitmap: TCnsBitmap32; AIsMONOCHROME: Boolean):
  TDicomAttributes;
var
  dimage: TDicomImageData;
  p1: Pointer;
  pb1: PByte;
  ALen, y: Integer;
  DestScanline: PColor32Array;
  prgb1: pRGB;
begin
  Result := ADataset; // := TDicomAttributes.Create;
  Result.Clear;
  //  ADataset.AddVariant(dPatientName, Patientname);
  //  ADataset.AddVariant(dPatientID, PatientID);

  //  ADataset.AddVariant(dStudyInstanceUID, StudyUID);
  //  ADataset.AddVariant(dSeriesInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex));
  //  ADataset.AddVariant(dSOPInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex) + '.' + IntToStr(AImageIndex + 1));

  ADataset.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
  //SOP CLASS
  //1.2.840.10008.5.1.4.1.1.2  CT
  //1.2.840.10008.5.1.4.1.1.7  secondary capture

  ADataset.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
  //  ADataset.AddVariant(8, $60, AModility);
  ADataset.AddVariant(8, $70, 'DicomVCL');

  ADataset.Add(8, $20).AsDatetime[0] := now;
  ADataset.Add(8, $21).AsDatetime[0] := now;
  ADataset.Add(8, $23).AsDatetime[0] := now;
  ADataset.Add(8, $30).AsDatetime[0] := now;
  ADataset.Add(8, $33).AsDatetime[0] := now;
  //  ADataset.AddVariant($20, $13, AImageIndex);
  ADataset.AddVariant($28, $11, ABitmap.Width);
  ADataset.AddVariant($28, $10, ABitmap.Height);
  //    if not AIsMONOCHROME then
  if (not AIsMONOCHROME) then
  begin
    ADataset.AddVariant($28, $2, 3);
    ADataset.AddVariant($28, $4, 'RGB');
    ALen := ABitmap.Width * ABitmap.Height * 3;
  end
  else
  begin
    ADataset.AddVariant($28, $2, 1);
    ADataset.AddVariant($28, $4, 'MONOCHROME2');
    ALen := ABitmap.Width * ABitmap.Height;
  end;
  ADataset.AddVariant($28, $100, 8);
  ADataset.AddVariant($28, $101, 8);
  ADataset.AddVariant($28, $102, 7);
  ADataset.AddVariant($28, $103, 0);
  ADataset.AddVariant($28, $6, 0);
  Getmem(p1, Alen);
  if not AIsMONOCHROME then
  begin
    prgb1 := p1;
    DestScanline := ABitmap.Bits;
    for y := 0 to (ABitmap.Height - 1) * (ABitmap.Width - 1) do // Iterate
    begin
      prgb1^.r := DestScanLine[y] shr 16;
      prgb1^.g := DestScanLine[y] shr 8;
      prgb1^.b := DestScanLine[y];

      inc(prgb1);
    end; // for
  end
  else
  begin
    pb1 := p1;
    DestScanline := ABitmap.Bits;
    for y := 0 to (ABitmap.Height - 1) * (ABitmap.Width - 1) do // Iterate
    begin
      pb1^ := DestScanLine[y] and $FF;
      inc(pb1);
    end; // for
  end;
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  ADataset.Add(32736, 16).AddData(dimage);
end;

function NewImage(ABitmap: TCnsBitmap32; AIsMONOCHROME: Boolean): TDicomAttributes;
var
  dimage: TDicomImageData;
  p1: Pointer;
  pb1: PByte;
  ALen, y: Integer;
  DestScanline: PColor32Array;
  prgb1: pRGB;
begin
  Result := TDicomAttributes.Create;
  //  Result.AddVariant(dPatientName, Patientname);
  //  Result.AddVariant(dPatientID, PatientID);

  //  Result.AddVariant(dStudyInstanceUID, StudyUID);
  //  Result.AddVariant(dSeriesInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex));
  //  Result.AddVariant(dSOPInstanceUID, StudyUID + '.' + IntToStr(ASeriesIndex) + '.' + IntToStr(AImageIndex + 1));

  Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
  //SOP CLASS
  //1.2.840.10008.5.1.4.1.1.2  CT
  //1.2.840.10008.5.1.4.1.1.7  secondary capture

  Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
  //  Result.AddVariant(8, $60, AModility);
  Result.AddVariant(8, $70, 'DicomVCL');

  Result.Add(8, $20).AsDatetime[0] := now;
  Result.Add(8, $21).AsDatetime[0] := now;
  Result.Add(8, $23).AsDatetime[0] := now;
  Result.Add(8, $30).AsDatetime[0] := now;
  Result.Add(8, $33).AsDatetime[0] := now;
  //  Result.AddVariant($20, $13, AImageIndex);
  Result.AddVariant($28, $11, ABitmap.Width);
  Result.AddVariant($28, $10, ABitmap.Height);
  //    if not AIsMONOCHROME then
  if (not AIsMONOCHROME) then
  begin
    Result.AddVariant($28, $2, 3);
    Result.AddVariant($28, $4, 'RGB');
    ALen := ABitmap.Width * ABitmap.Height * 3;
  end
  else
  begin
    Result.AddVariant($28, $2, 1);
    Result.AddVariant($28, $4, 'MONOCHROME2');
    ALen := ABitmap.Width * ABitmap.Height;
  end;
  Result.AddVariant($28, $100, 8);
  Result.AddVariant($28, $101, 8);
  Result.AddVariant($28, $102, 7);
  Result.AddVariant($28, $103, 0);
  Result.AddVariant($28, $6, 0);
  Getmem(p1, Alen);
  if not AIsMONOCHROME then
  begin
    prgb1 := p1;
    DestScanline := ABitmap.Bits;
    for y := 0 to (ABitmap.Height - 1) * (ABitmap.Width - 1) do // Iterate
    begin
      prgb1^.b := DestScanLine[y] shr 16;
      prgb1^.g := DestScanLine[y] shr 8;
      prgb1^.r := DestScanLine[y];

      inc(prgb1);
    end; // for
  end
  else
  begin
    pb1 := p1;
    DestScanline := ABitmap.Bits;
    for y := 0 to (ABitmap.Height - 1) * (ABitmap.Width - 1) do // Iterate
    begin
      pb1^ := DestScanLine[y] and $FF;
      inc(pb1);
    end; // for
  end;
  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, ALen);
  Result.Add(32736, 16).AddData(dimage);
end;

procedure ScaleRot(Src, Dst: TCnsBitmap32; Alpha: Single);
var
  SrcR: Integer;
  SrcB: Integer;
  T: TAffineTransformation;
  Sx, Sy, sx1, sy1, Scale: Single;
begin
  SrcR := Src.Width - 1;
  SrcB := Src.Height - 1;
  T := TAffineTransformation.Create;
  T.SrcRect := FloatRect(0, 0, SrcR + 1, SrcB + 1);
  try
    // shift the origin
    T.Clear;

    // move the origin to a center for scaling and rotation
    T.Translate(-SrcR / 2, -SrcB / 2);
    T.Rotate(0, 0, Alpha);
    Alpha := Alpha * PI / 180;

    // get the width and height of rotated image (without scaling)
    Sx := Abs(SrcR * Cos(Alpha)) + Abs(SrcB * Sin(Alpha));
    Sy := Abs(SrcR * Sin(Alpha)) + Abs(SrcB * Cos(Alpha));
    Dst.SetSize(Round(sx), Round(sy));

    // calculate a new scale so that the image fits in original boundaries
    Sx1 := Src.Width / Sx;
    Sy1 := Src.Height / Sy;
    scale := Min(Sx1, Sy1);

    T.Scale(Scale, Scale);

    // move the origin back
    //T.Translate(SrcR / 2, SrcB / 2);
    T.Translate(sx / 2, sy / 2);

    // transform the bitmap
    Dst.BeginUpdate;
    Dst.Clear(clBlack32);
    Transform(Dst, Src, T);
    Dst.EndUpdate;
  finally
    T.Free;
  end;
end;

//////////////////////////////////////////////////////

procedure DrawBitmapTo(ADicomImage: TDicomImage; ABitmap: TCnsBitmap32; ARect: TRect);
var
  bm1: TCnsBitmap32;
  i1, i2: Integer;
  pb2: PByte;
  pw2: PWord;
  DestScanLine: PColor32Array;
  pixeldata: pRGB;
  d1: TDicomImageData;
begin
  d1 := ADicomImage.ImageData[ADicomImage.BaseFrameIndex + ADicomImage.CurrentFrame];
  bm1 := TCnsBitmap32.Create;
  try
    bm1.Width := ARect.Right - ARect.Left;
    bm1.Height := ARect.Bottom - ARect.Top;
    ABitmap.DrawTo(Bm1, Rect(0, 0, bm1.Width - 1, bm1.Height - 1));
    if (ADicomImage.PhotometricInterpretation = 'RGB') or (d1.ColorSpaceIsConverted) then
    begin
      pixeldata := d1.Data;
      //      DestScanline := bm1.Bits;

      inc(pixeldata, ARect.Top * ADicomImage.Width);
      for I1 := 0 to bm1.Height - 1 do // Iterate
      begin
        DestScanLine := bm1.ScanLine[i1];
        inc(pixeldata, ARect.Left);
        for I2 := 0 to bm1.Width - 1 do // Iterate
        begin
          pixeldata^.r := DestScanLine[i2] shr 16;
          pixeldata^.g := DestScanLine[i2] shr 8;
          pixeldata^.b := DestScanLine[i2];
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
            pw2^ := DestScanLine[i2];
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
            pb2^ := DestScanLine[i2];
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

function AssignToBitmapDefault(ADicomImage: TDicomImage; ABitmapEx: TCnsBitmap32; WithLabel: Boolean = false): Boolean;
var
  w1, c1: Integer;
  da1: TDicomAttribute;
  inv1: Boolean;
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

function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TCnsBitmap32; WithLabel: Boolean): Boolean;
var
  x1, y1: Integer;
  //  DestScanLine: PColor32Array;
  //  prgb1: pRGB;
  d1, d2: TDicomImageData;
  //   np3: PByte;
  ABitmap: TCnsBitmap32;
  AT: TAffineTransformation;
  {$IFDEF DICOMDEBUX1}
  iii: Integer;
  {$ENDIF}
  {$IFDEF FOR_TRIAL_VERSION}
  l0, l1, l2: Integer;
  {$ENDIF}
  lCen, lWid: integer;

  nn: Boolean;
  lRange, min16, max16: integer;

  //  lScaleShl10: Single;
  SrcR: Integer;
  SrcB: Integer;
  Alpha, Sx, Sy, sx1, sy1, Scale: Single;

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
{  if not IsIDERuning then
  begin
    ShowMessage('You are use trial dicomvcl. Please open http://www.dicomvcl.com.');
    //Application.Terminate;
  end; }
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
  if (ADicomImage.AspectRatio = 1) and (ADicomImage.ImageAngle = 0) then
  begin
    ABitmap := ABitmapEx;
  end
  else
  begin
    ABitmap := TCnsBitmap32.Create;
  end;

  if (ADicomImage.WindowWidth = 0) or (ADicomImage.WindowWidth = 128) then
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
    ABitmap.SetSize(ADicomImage.Width, ADicomImage.Height)
  end;

  if (Copy(ADicomImage.PhotometricInterpretation, 1, 4) = 'MONO') then //(Copy(PhotometricInterpretation, 1, 4) = 'MONO') then
//  if (ADicomImage.SamplePerPixel = 1) then //(Copy(PhotometricInterpretation, 1, 4) = 'MONO') then
//  if True then
  begin
    if (ADicomImage.Bits <= 8) then
    begin
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        vImageConvert_Planar8toPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        vImageConvert_Planar8toPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
      end
      else 
        vImageConvert_Planar8toPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
    end
    else
      if (ADicomImage.Bits <= 16) then
    begin
      {$IFDEF DICOMDEBUX1}
      iii := GetTickCount;
      {$ENDIF}
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
          else
            vImageConvert_Planar16StoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end;
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];

        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100)
          else
            vImageConvert_Planar16StoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
        end;
      end
      else
      begin
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
          else
            vImageConvert_Planar16StoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end;
      end;
    end
    else //32
    begin
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          vImageConvert_Planar32UtoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
        else
          vImageConvert_Planar32StoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          vImageConvert_Planar32UtoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100)
        else
          vImageConvert_Planar32StoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
      end
      else
      begin
        if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          vImageConvert_Planar32UtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
        else
          vImageConvert_Planar32StoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end;
    end;
  end
  else
  begin

  //  ABitmap.SaveToFile('d:\___test\ABitmap_main.bmp');

  //  ABitmap.SaveToFile('d:\___test\ABitmap_before.bmp');
//    d1.SaveData('d:\__\test_save\d1_before.bmp');

    case ADicomImage.PlanarConfiguration of
      0:
        vImageConvert_PlanarRGBtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, 255, 0, ADicomImage.CustomPalette, nn);
      1:
        vImageConvert_PlanarRGB_PlanarConfiguration1_toPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, 255, 0, ADicomImage.CustomPalette, nn); //max16, min16
      2:
        vImageConvert_PlanarRGB_PlanarConfiguration2_toPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.ScanLine[0], ADicomImage.width, ADicomImage.height, 255, 0, ADicomImage.CustomPalette, nn);
    end;

  //  ABitmap.SaveToFile('d:\___test\ABitmap_after_PlanarRGB_PlanarConfiguration2_toPlanarARGB.bmp');
   // d1.SaveData('d:\__\test_save\d1_after.bmp');

  end;

  if (ADicomImage.AspectRatio <> 1) or (ADicomImage.ImageAngle > 0) then
  begin
    AT := TAffineTransformation.Create;
    try
      AT.SrcRect := FloatRect(0, 0, ABitmap.Width - 1, ABitmap.Height - 1);
      if (ADicomImage.AspectRatio <> 1) then
      begin

        if not ADicomImage.MPRMode then
        begin
          ABitmapEx.SetSize(trunc(ADicomImage.Width / ADicomImage.AspectRatio), ADicomImage.height);
          AT.Scale(1 / ADicomImage.AspectRatio, 1);
        end
        else
        begin
          ABitmapEx.SetSize(ADicomImage.Width, trunc(ADicomImage.height * ADicomImage.AspectRatio));
          AT.Scale(1, ADicomImage.AspectRatio);
        end;

        {$IFDEF DEPRECATEDMODE}
        ABitmap.StretchFilter := sfLanczos;
        {$ELSE}
        //TKernelResampler.Create(ABitmap);
        //TKernelResampler(ABitmap.Resampler).Kernel := TCubicKernel.Create;
        //      TLinearResampler.Create(ABitmap);
        {$ENDIF}
      end;
      if ADicomImage.ImageAngle > 0 then
      begin
        SrcR := ABitmap.Width - 1;
        SrcB := ABitmap.Height - 1;

        // move the origin to a center for scaling and rotation
        AT.Translate(-SrcR / 2, -SrcB / 2);
        AT.Rotate(0, 0, ADicomImage.ImageAngle);
        Alpha := ADicomImage.ImageAngle * PI / 180;

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
  end;
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

    ABitmapEx.Canvas.Font.Color := clRed;
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
      ABitmapEx.Canvas.Font.Size := 36;

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
      ABitmapEx.FillRectS(x1 - 20, y1 - 20, x1 + 20, y1 + 20, clRed32);
    end;
  end;
  if ADicomImage.PostFilter > 0 then
  begin
    //  ConvolveBitmap(FPostFilter, ABitmapEx);
    ApplyConv3x3(ADicomImage.PostFilter, ABitmapEx);
  end;

  DrawOverlayTo(ADicomImage, ABitmapEx);
  if WithLabel or RuntimeTextInBitmapMode then
  begin
    OverlayLabels(ADicomImage, ABitmapEx, true);
    //    DrawUserLabels(ABitmap);
  end; // else
end;

procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
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

    //f1 := Min(Dest.Width / ADicomImage.Width, Dest.height / ADicomImage.Height);
    //MyTextOut(Dest, daRightBottom, 2, 'Z: ' + Floattostrf(ViewerZoom * 100, ffFixed, 15, 0) + '%');
  end;

  if Dest.Width > 200 then
  begin
    //DrawImageScale(Dest);

    //DrawImagePosition(Dest);
  end;
end;

{    procedure TDicomImage.DrawUserLabels(Dest: TCnsBitmap32);
    begin
      LoadUserDrawObjectToBitmap(Dest);
    end;

    procedure TDicomImage.DrawUserLabels(Dest: TBitmap);
    begin
      LoadUserDrawObjectToBitmap(Dest);
    end;}

procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Buffer: TCnsBitmap32; Zoom: Single = 1; AXOff:
  Integer = 0; AYOff: Integer = 0);
var
  //  da1, da2, da3: TDicomAttribute;
  //  das: TDicomAttributes;
  FTextIndex: integer;
  //  R: TRect;
  //  av, sd, ar: double;
  //  str2: AnsiString;
  //  strs: TStringList;
  procedure DrawArrow(R: TRect; AText: AnsiString);
  var
    pp: array[1..3] of TPoint;
    M, N, L, angleA, angleB: Double;
    strs: TStringList;
    i, sh: integer;
  begin
    M := 1 * 10;
    L := M * 2;
    N := sqrt(M * M / 4 + L * L);
    if r.Left <> r.Right then
      angleA := Arctan((r.Bottom - r.Top) / (r.Right - r.Left))
    else
      angleA := PI / 2;
    angleB := Arctan(M / L / 2);
    // 如果需要反转，加3.1415
    if r.Right > r.Left then
      angleA := angleA - PI;
    pp[1].x := r.Right;
    pp[1].y := r.Bottom;
    pp[2].x := r.Right + trunc(N * cos(angleA + angleB));
    pp[2].y := r.Bottom + trunc(N * sin(angleA + angleB));
    pp[3].x := r.Right + trunc(N * cos(angleA - angleB));
    pp[3].y := r.Bottom + trunc(N * sin(angleA - angleB));

    Buffer.LineS(pp[3].X, pp[3].Y, pp[1].X, pp[1].Y, clBlack32);
    Buffer.LineS(pp[2].X, pp[2].Y, pp[1].X, pp[1].Y, clBlack32);

    Buffer.LineS(R.Left, r.Top, r.Right, r.Bottom, clBlack32);

    Buffer.LineS(R.Left - 4, r.Top, R.Left + 4, r.Top, clBlack32);
    Buffer.LineS(R.Left, r.Top - 4, R.Left, r.Top + 4, clBlack32);

    Buffer.LineS(pp[3].X + 1, pp[3].Y + 1, pp[1].X + 1, pp[1].Y + 1, clWhite32);
    Buffer.LineS(pp[2].X + 1, pp[2].Y + 1, pp[1].X + 1, pp[1].Y + 1, clWhite32);

    Buffer.LineS(R.Left + 1, r.Top + 1, r.Right + 1, r.Bottom + 1, clWhite32);

    Buffer.LineS(R.Left - 4 + 1, r.Top + 1, R.Left + 4 + 1, r.Top + 1, clWhite32);
    Buffer.LineS(R.Left + 1, r.Top - 4 + 1, R.Left + 1, r.Top + 4 + 1, clWhite32);
    {  if fText <> '' then
      begin
        Buffer.RenderText(r.Left, r.Top, fText,0,clBlack32);
        Buffer.RenderText(r.Left, r.Top, fText,0,clWhite32);
      end;}
    if AText <> '' then
    begin
      strs := TStringList.Create;
      strs.Text := AText;
      sh := Buffer.TextHeight(strs[0]) + 3;
      for i := 0 to strs.Count - 1 do
      begin
        Buffer.RenderText(r.Left, r.Top + i * sh, strs[i], 0, clBlack32);
        Buffer.RenderText(r.Left + 1, r.Top + 1 + i * sh, strs[i], 0, clWhite32);
      end;
      strs.Free;
    end;
  end;
  procedure DrawRuler(R: TRect);
  var
    aa, bb, hw, rx, ry, cx: double;
    fl: boolean;
    xa, ya, xb, yb: integer;
    cosbb, sinbb: double;
    cosbbpi, sinbbpi: double;
    sh, x1, x2, y1, y2: Integer;
    str1, fText: AnsiString;
  begin
    x1 := r.Left;
    y1 := r.Top;
    x2 := r.Right;
    y2 := r.Bottom;
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
    Buffer.LineS(x1 + xa, y1 + ya, x1 + xb, y1 + yb, clBlack32);
    Buffer.LineS(x1 + xa + 1, y1 + ya + 1, x1 + xb + 1, y1 + yb + 1, clWhite32);

    Buffer.LineS(x2 + xa, y2 + ya, x2 + xb, y2 + yb, clBlack32);
    Buffer.LineS(x2 + xa + 1, y2 + ya + 1, x2 + xb + 1, y2 + yb + 1, clWhite32);

    Buffer.LineS(x1, y1, x2, y2, clBlack32);
    Buffer.LineS(x1 + 1, y1 + 1, x2 + 1, y2 + 1, clWhite32);

    rx := abs(x2 - x1) * ADicomImage.Attributes.ImageData.PixelSpacingX;
    ry := abs(y2 - y1) * ADicomImage.Attributes.ImageData.PixelSpacingY;
    cx := sqrt(rx * rx + ry * ry) / Zoom;
    fText := floattostrf(cx, ffFixed, 15, 2) + 'CM';

    //  fTextPosition.X := x1+
      //th:=TextHeight(ss);
  //  tw := Buffer.TextWidth(ss);
  //  ll := sqrt(sqr(x2 - x1) + sqr(y2 - y1));
    xa := x1 + (x2 - x1) div 2;
    ya := y1 + (y2 - y1) div 2;
    //  Buffer.RenderText(x1, y1, ss, 0, clBlue32);
    if FTextIndex > 0 then
    begin
      sh := Buffer.TextHeight('A') + 2;
      str1 := IntToStr(FTextIndex);
      Buffer.RenderText(r.Right, r.Bottom, str1, 0, clBlack32);
      Buffer.RenderText(r.Right + 1, r.Bottom + 1, str1, 0, clWhite32);

      Buffer.RenderText(Buffer.Width div 3, Buffer.Height - sh * FTextIndex, str1 + ':' + fText, 0,
        clBlack32);
      Buffer.RenderText(Buffer.Width div 3 + 1, Buffer.Height - sh * FTextIndex + 1, str1 + ':' +
        fText, 0, clWhite32);
    end
    else
      if FTextIndex < 0 then
    begin
      sh := Buffer.TextHeight('A') + 2;
      str1 := IntToStr(-FTextIndex);
      Buffer.RenderText(r.Right, r.Bottom, str1, 0, clBlack32);
      Buffer.RenderText(r.Right + 1, r.Bottom + 1, str1, 0, clWhite32);

      Buffer.RenderText(Buffer.Width div 3, -sh * FTextIndex, str1 + ':' + fText, 0,
        clBlack32);
      Buffer.RenderText(Buffer.Width div 3 + 1, -sh * FTextIndex + 1, str1 + ':' +
        fText, 0, clWhite32);
    end
    else
    begin
      Buffer.RenderText(xa, ya, fText, 0, clBlack32);
      Buffer.RenderText(xa + 1, ya + 1, fText, 0, clWhite32);
    end;
    //inc(FTextIndex);
  end;
  procedure DrawAngle(R: TRect; R1: TPoint; fText: AnsiString);
  var
    aa: Double;
    x1, y1, x2, y2, sh: Integer;
    str1: AnsiString;
  begin
    aa := CalAngle(r.Left, r.Top, r.Right, r.Bottom, r1.X, r1.Y);

    Buffer.LineS(r.Left, r.Top, r.Right, r.Bottom, clBlack32);
    Buffer.LineS(r.Right, r.Bottom, r1.X, r1.Y, clBlack32);
    Buffer.LineS(r.Left + 1, r.Top + 1, r.Right + 1, r.Bottom + 1, clWhite32);
    Buffer.LineS(r.Right + 1, r.Bottom + 1, r1.X + 1, r1.Y + 1, clWhite32);
    x1 := trunc(r.Right - (r.Right - r.Left) * 0.1);
    y1 := trunc(r.Bottom - (r.Bottom - r.Top) * 0.1);

    x2 := trunc(r.Right - (r.Right - r1.x) * 0.1);
    y2 := trunc(r.Bottom - (r.Bottom - r1.y) * 0.1);
    Buffer.LineS(x1, y1, x2, y2, clBlack32);
    Buffer.LineS(x1 + 1, y1 + 1, x2 + 1, y2 + 1, clWhite32);

    if FTextIndex > 0 then
    begin
      sh := Buffer.TextHeight('A') + 2;
      str1 := IntToStr(FTextIndex);
      Buffer.RenderText(r.Right, r.Bottom, str1, 0, clBlack32);
      Buffer.RenderText(r.Right + 1, r.Bottom + 1, str1, 0, clWhite32);

      Buffer.RenderText(Buffer.Width div 3, Buffer.Height - sh * FTextIndex, str1 +
        FormatFloat(':0.00°', aa), 0, clBlack32);
      Buffer.RenderText(Buffer.Width div 3 + 1, Buffer.Height - sh * FTextIndex + 1, str1 +
        FormatFloat(':0.00°', aa), 0, clWhite32);
    end
    else
    begin
      Buffer.RenderText(r.Right, r.Bottom, fText + FormatFloat('0.00°', aa), 0, clBlack32);
      Buffer.RenderText(r.Right + 1, r.Bottom + 1, fText + FormatFloat('0.00°', aa), 0,
        clWhite32);
    end;
    //inc(FTextIndex);
  end;
  procedure Spiral(Buffer: TCnsBitmap32; X, Y, R: Integer);
  var
    Theta: Single;
  begin
    //    Buffer.SetStipple([clWhite32, $00FFFFFF]);
    //    Buffer.StippleStep := 1;
    Buffer.PenColor := clWhite32;
    Theta := -3.1415926535;
    Buffer.MoveToF(X + Cos(Theta) * r, Y + Sin(Theta) * r);
    while Theta < 3.1415926535 + 0.2 do
    begin
      Buffer.LineToFS(X + Cos(Theta) * r, Y + Sin(Theta) * r);
      Theta := Theta + 0.2;
    end;
  end;
  //var
  //  kkk, sh, w, h: integer;
  //  str11: AnsiString;
begin
  if not assigned(ADicomImage.Attributes) then
    exit;
  ADicomImage.UpdateCood(0, 0, AXOff, AYOff, Zoom,
    ADicomImage.PixelSpacingX, ADicomImage.PixelSpacingY);
  DrawAll(ADicomImage.DrawObjects, buffer, Rect(0, 0, ADicomImage.width, ADicomImage.Height), false, -1, ADicomImage.CalFontSpacing(Buffer.Width, Buffer.Height));

  (*  FTextIndex := 1;
    da1 := FAttributes.Item[$2815, 1];
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
          R := Rect(trunc(da2.AsInteger[0] * Zoom) + AXOff, trunc(da3.AsInteger[0] * Zoom) + AYOff,
            trunc(da2.AsInteger[1] * Zoom) + AXOff, trunc(da3.AsInteger[1] * Zoom) + AYOff)
        end
        else
          continue;
        case das.getInteger($2815, $A) of
          8:
            begin
              //Obj1 := TVRBoxlayer.Create(Layers);
              Buffer.FillRectS(R, clRed32);
            end;
          2:
            begin
              //            Obj1 := TArrowlayer.Create(Layers);
              //            TArrowlayer(Obj1).Text := das.getString($2815, $9);
              DrawArrow(R, das.getString($2815, $9));
            end;
          10:
            begin
              str11 := das.getString($2815, $9);
              Buffer.RenderText(r.Left, r.Top, str11, 0, clBlack32);
              Buffer.RenderText(r.Left + 1, r.Top + 1, str11, 0, clWhite32);
            end;
          9:
            begin
              //            Obj1 := TRulerLayer.Create(Layers);
              DrawRuler(R);
            end;
          5:
            begin
              //            Obj1 := TBitmapLayer.Create(Layers);

            end;
          6:
            begin
              //            Obj1 := TAngleLayer.Create(Layers);
              da2 := das.Item[$2815, $3];
              //            TAngleLayer(obj1).AnglePoint := FloatPoint(da2.AsInteger[0], da2.AsInteger[1]);
              DrawAngle(R, Point(trunc(da2.AsInteger[2] * Zoom) + AXOff, trunc(da2.AsInteger[3] * Zoom) + AYOff), das.getString($2815, $9));
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
          3:
            begin
              //            Obj1 := TROILayer.Create(Layers);
              //            TROILayer(obj1).OnCalROI := DoROILayerCal;
              w := abs(r.Right - r.Left) div 2;
              h := abs(r.Bottom - r.Top) div 2;
              Buffer.LineS(r.Left, r.Top, r.Right, r.Top, clWhite32);
              Buffer.LineS(r.Left, r.Top, r.Left, r.Bottom, clWhite32);
              Buffer.LineS(r.Left, r.Bottom, r.Right, r.Bottom, clWhite32);
              Buffer.LineS(r.Right, r.Top, r.Right, r.Bottom, clWhite32);
              Buffer.LineS(r.Left + w, r.Top + h, r.Right + w, r.Bottom + h, clWhite32);
              Attributes.ImageData.CalAverage(r.Left, r.Top, r.Right, r.Bottom, av, sd, ar);
              str2 := Format('AV:%4.2f' + #13#10 + 'SD:%4.2f' + #13#10 + 'AR:%4.2f', [av, sd, ar]);
              if str2 <> '' then
              begin
                strs := TStringList.Create;
                strs.Text := str2;
                sh := Buffer.TextHeight(strs[0]) + 3;
                for kkk := 0 to strs.Count - 1 do
                begin
                  Buffer.RenderText(r.Right + w, r.Bottom + h + kkk * sh, strs[kkk], 0, clBlack32);
                  Buffer.RenderText(r.Right + w + 1, r.Bottom + h + 1 + kkk * sh, strs[kkk], 0, clWhite32);
                end;
                strs.Free;
              end;
            end;
          1:
            begin
              //            Obj1 := TBOXLayer.Create(Layers);
              w := abs(r.Right - r.Left) div 2;
              h := abs(r.Bottom - r.Top) div 2;
              Spiral(Buffer, (r.Right + r.Left) div 2, (r.Bottom + r.top) div 2, min(w, h));

              Buffer.LineS(r.Left + w, r.Top + h, r.Right + w, r.Bottom + h, clWhite32);
              Attributes.ImageData.CalAverage(r.Left, r.Top, r.Right, r.Bottom, av, sd, ar);
              str2 := Format('AV:%4.2f' + #13#10 + 'SD:%4.2f' + #13#10 + 'AR:%4.2f', [av, sd, ar]);
              if str2 <> '' then
              begin
                strs := TStringList.Create;
                strs.Text := str2;
                sh := Buffer.TextHeight(strs[0]) + 3;
                for kkk := 0 to strs.Count - 1 do
                begin
                  Buffer.RenderText(r.Right + w, r.Bottom + h + kkk * sh, strs[kkk], 0, clBlack32);
                  Buffer.RenderText(r.Right + w + 1, r.Bottom + h + 1 + kkk * sh, strs[kkk], 0, clWhite32);
                end;
                strs.Free;
              end;
            end;
        else
          continue;
        end;
      end;
    end;*)
end;

procedure myTextOut(ADicomImage: TDicomImage; Dest: TCnsBitmap32; AMode: TDisplayArea; ARow: Integer; AText:
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
        Dest.RenderText((xx), (yy), str1, 0, clBlack32);
        Dest.RenderText((xx + 1), (yy + 1), str1, 0, clWhite32);
      end
      else
      begin
        //Dest.Font.Name := '宋体';
        Dest.Font.Color := clBlack;
        Dest.Textout((xx), (yy), str1);
        Dest.Font.Color := clWhite;
        Dest.Textout((xx + 1), (yy + 1), str1);
      end;
    end
    else
    begin
      if ADicomImage.FontSpacing < 8 then
      begin
        Dest.RenderText((xx), (yy), str1, 0, Color32(ADicomImage.LabelFontColor));
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

procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
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
  //  MyTextOut(ADicomImage,Dest,daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
begin
  {$IFDEF SHOW_ALL_PATIENT_INFO}
  // FOMIN 17.12.2012
  MyTextOut(ADicomImage, Dest, daLeftTop, 1, Format('%s %s %s', [
                  gt_charset_value( ADicomImage.Attributes, ADicomImage.Attributes.GetString($10, $10), True ),
                  gt_charset_value( ADicomImage.Attributes, ADicomImage.Attributes.GetString($10, $40) ),
                  gt_charset_value( ADicomImage.Attributes, ADicomImage.Attributes.GetString($10, $1010) ) ]));
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daLeftTop, 1, gt_charset_value( ADicomImage.Attributes, ADicomImage.Attributes.GetString($10, $10), True ) );
  {$ENDIF}

  MyTextOut(ADicomImage, Dest, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20) );
  //  MyTextOut(ADicomImage,Dest, daLeftTop, 3, ADicomImage.Attributes.GetString($10, $30));
  MyTextOut(ADicomImage, Dest, daLeftTop, 3, ADicomImage.Attributes.GetString($20, $10) );

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

  //MyTextOut(ADicomImage,Dest, daLeftTop, 6, 'IM ' + ADicomImage.Attributes.GetString($20, $13));

  if ADicomImage.Attributes.ImageData.FrameCount > 1 then
    MyTextOut(ADicomImage, Dest, daLeftTop, 7, 'FRAME ' + IntToStr(ADicomImage.Attributes.ImageData.CurrentFrame));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, 'Unregistered dicomvcl of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, gt_charset_value( ADicomImage.Attributes, ADicomImage.Attributes.GetString(8, $80) ) );
  {$ENDIF}
  //  MyTextOut(ADicomImage,Dest, daRightTop, 1, Attributes.GetString(8, $80));
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    MyTextOut(ADicomImage, Dest, daRightTop, 3, ADicomImage.Attributes.GetString($18, $15));
    MyTextOut(ADicomImage, Dest, daRightTop, 4, ADicomImage.Attributes.GetString($8, $103E));
  end
  else
  begin
    // MyTextOut(ADicomImage,Dest, daRightTop, 3, ADicomImage.Attributes.GetString($8, $1090));
    // MyTextOut(ADicomImage,Dest, daRightTop, 4, ADicomImage.Attributes.GetString($18, $1020));
  end;

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
end;

procedure DisplayCommonListForVR(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
//var
//  str1: AnsiString;
//  x1, y1: Integer;
begin
  //if Attributes.getString($8, $60) = 'VR' then
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    ADicomImage.CalFontSpacing(Dest.Width, Dest.Height);

    {x1 := Attributes.getInteger($2811, $20E);
    y1 := Attributes.getInteger($2811, $20F);
    if (x1 <> 0) and (y1 <> 0) then
    begin
      Dest.FillRectS(x1 - 20, x1 + 20, y1 - 20, y1 + 20, clYellow32);
    end;  }

    MyTextOut(ADicomImage, Dest, daRightTop, 3, ADicomImage.Attributes.GetString($18, $15));
    MyTextOut(ADicomImage, Dest, daRightTop, 4, ADicomImage.Attributes.GetString($8, $103E));
  end;
end;

procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
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
    //    MyTextOut(ADicomImage,Dest, daLeftTop, 1, Attributes.GetString($10, $10));
    MyTextOut(ADicomImage, Dest, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $22));
  end
  else
  begin
    //    MyTextOut(ADicomImage,Dest, daLeftTop, 1, Format('%s %s %s', [Attributes.GetString($10, $10),
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
  //  MyTextOut(ADicomImage,Dest, daRightTop, 1, Attributes.GetString(8, $80));
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
  //    MyTextOut(ADicomImage,Dest,daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
  //    MyTextOut(daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
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
  //  MyTextOut(ADicomImage,Dest, daRightTop, 1, Attributes.GetString(8, $80));
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
  //MyTextOut(ADicomImage,Dest, daLeftBottom, 1, Attributes.GetString($18, $22));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, Format('W = %5d  L = %5d', [ADicomImage.WindowWidth, ADicomImage.WindowCenter]));
end;

procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
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
  //  MyTextOut(ADicomImage,Dest, daRightTop, 1, ADicomImage.Attributes.GetString(8, $80));
  MyTextOut(ADicomImage, Dest, daRightTop, 3, ADicomImage.Attributes.GetString($8, $1090));
  MyTextOut(ADicomImage, Dest, daRightTop, 4, ADicomImage.Attributes.GetString($18, $1020));
  //    MyTextOut(daRightTop, 4, ADicomImage.Attributes.GetString(8, $20));

  MyTextOut(ADicomImage, Dest, daLeftBottom, 8, ADicomImage.Attributes.GetString($18, $24));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 7, '  *');

  MyTextOut(ADicomImage, Dest, daLeftBottom, 6, ADicomImage.Attributes.GetString($18, $20));
  //  MyTextOut(ADicomImage,Dest, daLeftBottom, 5, 'TR ' + ADicomImage.Attributes.GetString($18, $60));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 5, Format('TR %8d', [ADicomImage.Attributes.GetInteger($18, $80)]));
  MyTextOut(ADicomImage, Dest, daLeftBottom, 4, Format('TE %6d/1', [ADicomImage.Attributes.GetInteger($18, $81)]));
  //MyTextOut(ADicomImage,Dest, daLeftBottom, 3, Format('TA    01:46', [ADicomImage.Attributes.GetInteger($18, $50)]));
  //MyTextOut(ADicomImage,Dest, daLeftBottom, 2, Format('AC          1', [ADicomImage.Attributes.GetInteger($18, $1120)]));

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
  //  MyTextOut(ADicomImage,Dest, daRightBottom, 4, '   ' + Attributes.GetString($18, $60));
  MyTextOut(ADicomImage, Dest, daRightBottom, 3, Format('Tra>Cor    -10', [ADicomImage.Attributes.GetString($18, $60)]));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
  //    MyTextOut(daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ARight, ABottom: Boolean);
var
  mh, mw, cw, ch, x, y, kk, n: Integer;
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
  n := round((z1 - x1) / kh);
  z1 := x1 + (n + 0.1) * kh;

  if ARight then
  begin
    Dest.LineS(cw, round(x1), cw, round(z1), clWhite32, false);
    while x1 <= z1 do
    begin
      x := round(x1);
      if (y mod 5) = 0 then
      begin
        Dest.LineS(cw - kk * 2, x, cw, x, clWhite32, false);
      end
      else
      begin
        Dest.LineS(cw - kk, x, cw, x, clWhite32, false);
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
  n := round((z1 - x1) / kw);
  z1 := x1 + (n + 0.1) * kw;

  if ABottom then
  begin
    Dest.LineS(round(x1), ch, round(z1), ch, clWhite32, false);
    while x1 <= z1 do
    begin
      x := round(x1);
      if (y mod 5) = 0 then
      begin
        Dest.LineS(x, ch - kk * 2, x, ch, clWhite32, false);
      end
      else
      begin
        Dest.LineS(x, ch - kk, x, ch, clWhite32, false);
      end;
      inc(y);
      x1 := (x1 + kw);
    end;
  end;
end;

(*
procedure DrawImagePositionEx(ADicomImage: TDicomImage;Dest: TCnsBitmap32);
var
  inv: Boolean;
  orientationX, orientationY, orientationZ: AnsiString;
  vector: array[0..2] of double;
  da1: TDicomAttribute;

  LeftCaption: AnsiString;
  TopCaption: AnsiString;
  RightCaption: AnsiString;
  BottomCaption: AnsiString;
  mw, mh: Integer;
begin
  mw := Dest.Width;
  mh := Dest.Height;

  da1 := Attributes.Item[$20, $37];
  if da1 = nil then
    exit;
  vector[0] := da1.AsFloat[0];
  vector[1] := da1.AsFloat[1];
  vector[2] := da1.AsFloat[2];
  inv := true;
  if (inv) then
  begin
    if vector[0] > 0 then
      orientationX := 'R'
    else
      orientationX := 'L';
    if vector[1] > 0 then
      orientationY := 'A'
    else
      orientationY := 'P';
    if vector[2] > 0 then
      orientationZ := 'I'
    else
      orientationZ := 'S';
  end
  else
  begin
    if vector[0] < 0 then
      orientationX := 'R'
    else
      orientationX := 'L';
    if vector[1] < 0 then
      orientationY := 'A'
    else
      orientationY := 'P';
    if vector[2] < 0 then
      orientationZ := 'I'
    else
      orientationZ := 'S';
  end;
  LeftCaption := orientationX;
  TopCaption := orientationY;

  if LeftCaption <> '' then
    Dest.RenderText(2, mh shr 1, LeftCaption, OverlayTextLevel, $FFFFFFFF);
  if TopCaption <> '' then
    Dest.RenderText(mw shr 1, 2, TopCaption, OverlayTextLevel, $FFFFFFFF);
  if RightCaption <> '' then
    Dest.RenderText(mw - 20, mh shr 1, RightCaption, OverlayTextLevel, $FFFFFFFF);
  if BottomCaption <> '' then
    Dest.RenderText(mw shr 1, mh - 20, BottomCaption, OverlayTextLevel, $FFFFFFFF);

end;*)

procedure DrawImagePosition(ADicomImage: TDicomImage; Dest: TCnsBitmap32);
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

  // k1: Integer;
begin
  o := ADicomImage.planeForImage;

  LeftCaption := ADicomImage.getOrientationText(o.XNormalVector, True);
  RightCaption := ADicomImage.getOrientationText(o.XNormalVector, False);

  TopCaption := ADicomImage.getOrientationText(o.YNormalVector, True);
  BottomCaption := ADicomImage.getOrientationText(o.YNormalVector, False);

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
    Dest.RenderText(mw shr 1, mh - 20, BottomCaption, OverlayTextLevel, $FFFFFFFF);
end;

procedure DrawImagePositionEx(ADicomImage: TDicomImage; Dest: TCnsBitmap32);
const
  OrientationTypeStrings: array[0..12] of AnsiString = (
    'Not Applicable',
    'Axial',
    'Coronal',
    'Sagital',
    'Heart Axial',
    'Heart Coronal',
    'Heart Sagital',
    'Axial invert',
    'Coronal invert',
    'Sagital invert',
    'Heart Axial invert',
    'Heart Coronal invert',
    'Heart Sagital invert');
  dicPlane: array[0..5, 0..1, 0..2] of Double =
  (((1, 0, 0), (0, 1, 0)), // Axial
    ((1, 0, 0), (0, 0, -1)), // Coronal
    ((0, 1, 0), (0, 0, -1)), // Sagittal
    ((0.8, 0.5, 0.0), (-0.1, 0.1, -0.95)), // Axial - HEART
    ((0.8, 0.5, 0.0), (-0.6674, 0.687, 0.1794)), // Coronal - HEART
    ((-0.1, 0.1, -0.95), (-0.6674, 0.687, 0.1794)) // Sagittal - HEART
    );
type
  vector3D = record
    x, y, z: Double;
  end;
  TRes = record
    first, second: Double;
  end;

  function square_dist(v1, v2: vector3D): double;
  var
    res: Double;
  begin
    res := (v1.x - v2.x) * (v1.x - v2.x) +
      (v1.y - v2.y) * (v1.y - v2.y) +
      (v1.z - v2.z) * (v1.z - v2.z);
    Result := res;
  end;

  //------------------------- Purpose : -----------------------------------
  //- Calculus of the poduct vectorial between two vectors 3D
  //------------------------- Parameters : --------------------------------
  //- <vec1>  : - type : vector 3D (double)
  //- <vec2>  : - type : vector 3D (double)
  //------------------------- Return : ------------------------------------
  // (vec) :    - Vector 3D
  //------------------------- Other : -------------------------------------

  function ProductVectorial(vec1, vec2: vector3D): vector3D;
  begin

    Result.x := vec1.y * vec2.z - vec1.z * vec2.y;
    Result.y := -(vec1.x * vec2.z - vec1.z * vec2.x);
    Result.z := vec1.x * vec2.y - vec1.y * vec2.x;
  end;

  //------------------------- Purpose : -----------------------------------
  //- This function determines the orientation similarity of two planes.
  //  Each plane is described by two vectors.
  //------------------------- Parameters : --------------------------------
  //- <refA>  : - type : vector 3D (double)
  //- <refB>  : - type : vector 3D (double)
  //            - Description of the first plane
  //- <ori1>  : - type : vector 3D (double)
  //- <ori2>  : - type : vector 3D (double)
  //            - Description of the second plane
  //------------------------- Return : ------------------------------------
  // double :   0 if the planes are perpendicular. While the difference of
  //            the orientation between the planes are big more enlarge is
  //            the criterion.
  //------------------------- Other : -------------------------------------
  // The calculus is based with vectors normalice

  function CalculLikelyhood2Vec(refA, refB, ori1, ori2: vector3D): double;
  var
    ori3, refC: vector3D;
    res: Double;
  begin

    ori3 := ProductVectorial(ori1, ori2);
    refC := ProductVectorial(refA, refB);
    res := square_dist(refC, ori3);

    result := sqrt(res);
  end;

  procedure VerfCriterion(typeCriterion: integer; criterionNew: double; var ain: TRes);
  var
    type1: Double;
    criterion: Double;
  begin

    type1 := ain.first;
    criterion := ain.second;
    /// * criterionNew < 0.1 && * /
    if (criterionNew < criterion) then
    begin
      type1 := typeCriterion;
      criterion := criterionNew;
    end;
    ain.first := type1;
    ain.second := criterion;
  end;

  /// \brief returns of the most similar basic orientation
  ///        (Axial, Coronal, Sagital, ...) of the image
  function GetOrientationType: Integer;
  var
    ori1: vector3D;
    ori2: vector3D;
    refA: vector3D;
    refB: vector3D;
    int_res, i, numDicPlane: integer;
    res: TRes;
    da1: TDicomAttribute;
  begin
    Result := 0;
    da1 := ADicomImage.Attributes.Item[$20, $37];
    if da1 = nil then
      exit;
    ori1.x := da1.AsFloat[0];
    ori1.y := da1.AsFloat[1];
    ori1.z := da1.AsFloat[2];
    ori2.x := da1.AsFloat[3];
    ori2.y := da1.AsFloat[4];
    ori2.z := da1.AsFloat[5];
    //   ori1.x = iop[0]; ori1.y = iop[1]; ori1.z = iop[2];  //37
    //   ori2.x = iop[3]; ori2.y = iop[4]; ori2.z = iop[5];

    res.first := 0;
    res.second := 99999;
    i := 0;
    for numDicPlane := 0 to 5 do
    begin
      inc(i);
      // refA=plane[0]
      refA.x := dicPlane[numDicPlane][0][0];
      refA.y := dicPlane[numDicPlane][0][1];
      refA.z := dicPlane[numDicPlane][0][2];
      // refB=plane[1]
      refB.x := dicPlane[numDicPlane][1][0];
      refB.y := dicPlane[numDicPlane][1][1];
      refB.z := dicPlane[numDicPlane][1][2];
      VerfCriterion(i, CalculLikelyhood2Vec(refA, refB, ori1, ori2), res);
      VerfCriterion(-i, CalculLikelyhood2Vec(refB, refA, ori1, ori2), res);
    end;
    int_res := trunc(res.first);
    // res thought looks like is a float value, but is indeed an int
    // try casting it to int first then enum value to please VS7:
    if ((int_res <= 6) and (int_res >= -6)) then
      Result := int_res
    else
      raise Exception.Create('Not OK');
  end;
type
  TPatientPosition = (ppHeadFirstProne,
    ppHeadFirstSupine,
    ppFeetFirstProne,
    ppFeetFirstSupine,
    ppHeadFirstDecubitusRight,
    ppHeadFirstDecubitusLeft,
    ppFeetFirstDecubitusRight,
    ppFeetFirstDecubitusLeft);
  TPatientPositionCaption = record
    SignString: AnsiString;
    LeftCaption: AnsiString;
    TopCaption: AnsiString;
    RightCaption: AnsiString;
    BottomCaption: AnsiString
  end;
const
  //A  ANTERIOR  (FEET)
  //P  POSTERIOR (HEAD)
  PatientPositionCaptions: array[ppHeadFirstProne..ppFeetFirstDecubitusLeft]
  of TPatientPositionCaption = (
    (SignString: 'HFP'; LeftCaption: 'L'; TopCaption: 'P'; RightCaption: 'R'; BottomCaption: 'A'),
    (SignString: 'HFS'; LeftCaption: 'R'; TopCaption: 'A'; RightCaption: 'L'; BottomCaption: 'P'),
    //OK
    (SignString: 'FFP'; LeftCaption: 'L'; TopCaption: 'P'; RightCaption: 'R'; BottomCaption: 'A'),
    (SignString: 'FFS'; LeftCaption: 'R'; TopCaption: 'A'; RightCaption: 'L'; BottomCaption: 'P'),
    //OK
    (SignString: 'HFDR'; LeftCaption: 'P'; TopCaption: 'R'; RightCaption: 'A'; BottomCaption: 'L'),
    (SignString: 'HFDL'; LeftCaption: 'A'; TopCaption: 'L'; RightCaption: 'P'; BottomCaption: 'R'),
    (SignString: 'FFDR'; LeftCaption: 'A'; TopCaption: 'L'; RightCaption: 'P'; BottomCaption: 'R'),
    (SignString: 'FFDL'; LeftCaption: 'P'; TopCaption: 'R'; RightCaption: 'A'; BottomCaption:
    'L'));
  LOCALIZERPatientPositionCaptions: array[ppHeadFirstProne..ppFeetFirstDecubitusLeft]
  of TPatientPositionCaption = (
    (SignString: 'HFP'; LeftCaption: 'P'; TopCaption: 'I'; RightCaption: 'A'; BottomCaption: 'S'),
    (SignString: 'HFS'; LeftCaption: 'A'; TopCaption: 'S'; RightCaption: 'P'; BottomCaption: 'I'),
    //OK
    (SignString: 'FFP'; LeftCaption: 'P'; TopCaption: 'I'; RightCaption: 'A'; BottomCaption: 'S'),
    (SignString: 'FFS'; LeftCaption: 'A'; TopCaption: 'S'; RightCaption: 'P'; BottomCaption: 'I'),
    //OK
    (SignString: 'HFDR'; LeftCaption: ''; TopCaption: ''; RightCaption: ''; BottomCaption: ''),
    (SignString: 'HFDL'; LeftCaption: ''; TopCaption: ''; RightCaption: ''; BottomCaption: ''),
    (SignString: 'FFDR'; LeftCaption: ''; TopCaption: ''; RightCaption: ''; BottomCaption: ''),
    (SignString: 'FFDL'; LeftCaption: ''; TopCaption: ''; RightCaption: ''; BottomCaption: ''));
var
  str2: AnsiString;
  //    k1: Integer;
//  da1: TDicomAttribute;
  mh, mw: integer;
  LeftCaption: AnsiString;
  TopCaption: AnsiString;
  RightCaption: AnsiString;
  BottomCaption: AnsiString;

  LeftCaption1: AnsiString;
  TopCaption1: AnsiString;
  RightCaption1: AnsiString;
  BottomCaption1: AnsiString;

  k1: TPatientPosition;
  kc1: TPatientPositionCaption;
  zz1: Integer;
begin
  str2 := ADicomImage.Attributes.GetString($18, $5100);
  if str2 <> '' then
  begin
    zz1 := GetOrientationType;
    //     ShowMessage( OrientationTypeStrings[zz1]);

        //      AddLabel(im, 0, h * 11, '位置:', str2);
    {HFP = Head First-Prone     向下
    HFS = Head First-Supine     仰卧
    FFP = Feet First-Prone
    FFS = Feet First-Supine
    HFDR = Head First-Decubitus Right
    HFDL = Head First-Decubitus Left
    FFDR = Feet First-Decubitus Right
    FFDL = Feet First-Decubitus Left}

    mw := Dest.Width;
    mh := Dest.Height;

    if str2 = 'FF-SUPINE' then //GE
      str2 := 'FFS';

    for k1 := ppHeadFirstProne to ppFeetFirstDecubitusLeft do
    begin
      if (zz1 mod 4) = 3 then
        kc1 := LOCALIZERPatientPositionCaptions[k1]
      else
        kc1 := PatientPositionCaptions[k1];
      if kc1.SignString = str2 then
      begin
        if ADicomImage.HozFlip then
        begin
          LeftCaption1 := kc1.RightCaption;
          RightCaption1 := kc1.LeftCaption;
        end
        else
        begin
          LeftCaption1 := kc1.LeftCaption;
          RightCaption1 := kc1.RightCaption;
        end;
        if ADicomImage.VerFlip then
        begin
          TopCaption1 := kc1.BottomCaption;
          BottomCaption1 := kc1.TopCaption;
        end
        else
        begin
          TopCaption1 := kc1.TopCaption;
          BottomCaption1 := kc1.BottomCaption;
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
      end;
    end;
    if LeftCaption <> '' then
      Dest.RenderText(2, mh shr 1, LeftCaption, OverlayTextLevel, $FFFFFFFF);
    if TopCaption <> '' then
      Dest.RenderText(mw shr 1, 2, TopCaption, OverlayTextLevel, $FFFFFFFF);
    if RightCaption <> '' then
      Dest.RenderText(mw - 20, mh shr 1, RightCaption, OverlayTextLevel, $FFFFFFFF);
    if BottomCaption <> '' then
      Dest.RenderText(mw shr 1, mh - 20, BottomCaption, OverlayTextLevel, $FFFFFFFF);
  end;
end;

procedure DrawMeasureReport(ADicomImage: TDicomImage; Dest: TCnsBitmap32; AOffX, AOffY: Double);
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
    w := Dest.TextWidth(str1 + ':');
    Dest.TextOut(trunc(AOffX - w), trunc(AOffY + h * i), str1 + ':');
    Dest.TextOut(trunc(AOffX + 1), trunc(AOffY + h * i), str2);
  end;
end;

procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TCnsBitmap32; ADisplayWLLabel: Boolean);
var
  i: Integer;
  v1: TDicomInformationLabel;
  str1: AnsiString;
  //  f1: Double;
begin
  for I := 0 to ADicomImage.InformationLabels.Count - 1 do // Iterate
  begin
    v1 := TDicomInformationLabel(ADicomImage.InformationLabels[i]);
    str1 := v1.GetText(ADicomImage.Attributes);
    case v1.Position of
      //daLeftTop, daLeftBottom, daRightTop, daRightBottom, daCenterTop, daCenterBottom
      1: MyTextOut(ADicomImage, Dest, daLeftTop, v1.OrderID, str1);
      2: MyTextOut(ADicomImage, Dest, daLeftBottom, v1.OrderID, str1);
      3: MyTextOut(ADicomImage, Dest, daRightTop, v1.OrderID, str1);
      4: MyTextOut(ADicomImage, Dest, daRightBottom, v1.OrderID, str1);
      5: MyTextOut(ADicomImage, Dest, daCenterTop, v1.OrderID, str1);
      6: MyTextOut(ADicomImage, Dest, daCenterBottom, v1.OrderID, str1);
    end;
  end;
  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, daRightBottom, 1, Format('W = %5d  L = %5d', [ADicomImage.WindowWidth, ADicomImage.WindowCenter]));
  //  MyTextOut(ADicomImage,Dest, daRightBottom, 2, 'Z: ' + Floattostrf(ViewerZoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TCnsBitmap32);
var
  //  da1, da2: TDicomAttribute;
    //w, h, i: Integer;
    //str1: AnsiString;
  //  o1: TOBStream;
  n1: Word;

  i1, i2, z1: integer;
  DestScanLine: PColor32Array;
  pw1: PWord;
begin
  if ADicomImage.fOverlayBuffer <> nil then
  begin
    pw1 := ADicomImage.fOverlayBuffer;

    for I1 := 0 to Dest.Height - 1 do // Iterate
    begin

      DestScanline := Dest.ScanLine[i1];

      for I2 := 0 to Dest.Width - 1 do
      begin
        n1 := pw1^;
        for z1 := 0 to ADicomImage.fOverlayBufferBits - 1 do
          if (n1 and (1 shl z1)) <> 0 then
          begin
            DestScanLine[i2] := clYellow32;
          end;

        inc(pw1);
      end;
    end; // for}
  end;
end;

//////////////////////////////////////////////////////////

procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TCnsBitmap32; ARect: TRect; ADisplayCalcText: Boolean;
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
  if assigned(ADrawObjects.NewDrawObject) then
    if (ADrawObjects.NewDrawObject.RelateFrameIndex = ACurrentFrameIndex) or (ACurrentFrameIndex = -1) then
      DrawSelectGrip(ADrawObjects.NewDrawObject, ACanvas);
end;

procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; AFontSize: Integer);
var
  strs: TStringList;
  i: integer;
  x1, y1, x2, y2, sh: Integer;
  str1: AnsiString;
  c1: TColor32;
begin
  Acanvas.Font.Assign(ADrawObject.Font);

  if AFontSize > 0 then
    Acanvas.Font.Size := AFontSize;

  if (ADrawObject.CalText <> '') or (ADrawObject.name <> '') then
  begin
    strs := TStringList.Create;
    try
      strs.Text := ADrawObject.name + ADrawObject.CalText;

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
            c1 := Color32(ADrawObject.PenColor); //Color32(Acanvas.Font.Color);
            ACanvas.PenColor := c1;
            ACanvas.SetStipple([c1, c1, 0, 0, c1, c1]);
            ACanvas.StippleStep := 1;

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
            ACanvas.LineFSP(x2, y2, x1, y1, true);

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
            Acanvas.RenderText(x1, y1 + i * sh, strs[i], 0, Color32(Acanvas.Font.Color));
            if ADrawObject.PenColor = clWhite then
              Acanvas.RenderText(x1 + 1, y1 + i * sh + 1, strs[i], 0, clBlack32)
            else
              if ADrawObject.PenColor = clBlack then
              Acanvas.RenderText(x1 + 1, y1 + i * sh + 1, strs[i], 0, clWhite32)
          end;
        end;
      end
      else
      begin
        str1 := IntToStr(abs(ADrawObject.Textindex));
        Acanvas.RenderText(x1, y1, str1, 0, Color32(Acanvas.Font.Color));
        if ADrawObject.PenColor = clWhite then
          Acanvas.RenderText(x1 + 1, y1 + 1, str1, 0, clBlack32)
        else
          if ADrawObject.PenColor = clBlack then
          Acanvas.RenderText(x1 + 1, y1 + 1, str1, 0, clWhite32);

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
        DrawQuantitativeCoronaryAnaliysis(ADrawObject, ACanvas);
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
          ACanvas.Line(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], clRed32);
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
        DrawSolidRect(ADrawObject, ACanvas);
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

procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
begin
  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
end;

procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
begin
  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  if ADrawObject.UserText <> '' then
  begin
    Acanvas.Font.Assign(ADrawObject.Font);
    ACanvas.TextOut(ADrawObject.SCRX[0], ADrawObject.SCRY[0] + Acanvas.TextHeight('A'), '=' + ADrawObject.UserText);
  end;
end;

procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
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

  DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x2, y2, X3, Y3, Color32(ADrawObject.PenColor));

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, clBlack32);

    DrawLineS32(ADrawObject, ACanvas, x2, y2, X3, Y3, clBlack32);
  end;

  xx1 := trunc(x2 - (x2 - x1) * 0.1);
  yy1 := trunc(y2 - (y2 - y1) * 0.1);

  xx2 := trunc(x2 - (x2 - x3) * 0.1);
  yy2 := trunc(y2 - (y2 - y3) * 0.1);
  DrawLineS32(ADrawObject, ACanvas, xx1, yy1, xx2, yy2, Color32(ADrawObject.PenColor));

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ADrawObject, ACanvas, xx1, yy1, xx2, yy2, clBlack32);
  end;
end;

procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
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

  DrawLineS32(ADrawObject, ACanvas, pp[3].X, pp[3].Y, pp[1].X, pp[1].Y, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, pp[2].X, pp[2].Y, pp[1].X, pp[1].Y, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x1 - 4, y1, x1 + 4, y1, Color32(ADrawObject.PenColor));
  DrawLineS32(ADrawObject, ACanvas, x1, y1 - 4, x1, y1 + 4, Color32(ADrawObject.PenColor));

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ADrawObject, ACanvas, pp[3].X, pp[3].Y, pp[1].X, pp[1].Y, clBlack32);

    DrawLineS32(ADrawObject, ACanvas, pp[2].X, pp[2].Y, pp[1].X, pp[1].Y, clBlack32);

    DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, clBlack32);

    DrawLineS32(ADrawObject, ACanvas, x1 - 4, y1, x1 + 4, y1, clBlack32);
    DrawLineS32(ADrawObject, ACanvas, x1, y1 - 4, x1, y1 + 4, clBlack32);
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

procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
begin
  Acanvas.Font.Assign(ADrawObject.Font);

  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  Acanvas.Textout(ADrawObject.SCRX[1], ADrawObject.SCRY[1], 'L1');
  if ADrawObject.GetCount > 3 then
  begin
    DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
    Acanvas.Textout(ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L2');
    if ADrawObject.GetCount > 5 then
    begin
      DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
      Acanvas.Textout(ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L3');
      if ADrawObject.GetCount > 7 then
      begin
        DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
        Acanvas.Textout(ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L4');
      end;
    end;
  end;
end;

procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
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

procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer; ACanvas: TCnsBitmap32);
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

  DrawLineS32(ADrawObject, ACanvas, x1 + xa, y1 + ya, x1 + xb, y1 + yb, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x2 + xa, y2 + ya, x2 + xb, y2 + yb, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, Color32(ADrawObject.PenColor));

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ADrawObject, ACanvas, x1 + xa, y1 + ya, x1 + xb, y1 + yb, clBlack32);

    DrawLineS32(ADrawObject, ACanvas, x2 + xa, y2 + ya, x2 + xb, y2 + yb, clBlack32);

    DrawLineS32(ADrawObject, ACanvas, x1, y1, x2, y2, clBlack32);
  end;
end;

procedure DrawLineS32(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; x1, y1, x2, y2: Integer; APenColor32: TColor32);
var
  line1: TLine32;
  PenWidth1: Integer;
begin
  PenWidth1 := ADrawObject.Parent.OwnImageData.CalFontSpacing(ACanvas.Width, ACanvas.Height) div 12;

  line1 := TLine32.Create;
  try
    Line1.SetPoints([FixedPoint(x1, y1), FixedPoint(x2, y2)]);
    line1.Draw(ACanvas, PenWidth1, APenColor32);
  finally
    line1.Free;
  end;
end;

procedure DrawLineS32Ref(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; x1, y1, x2, y2: Integer; APenColor32: TColor32);
var
  line1: TLine32;
  PenWidth1: Integer;
begin
  { if APenColor32 = clRed32 then
     PenWidth1 := fParent.fOwnImageData.CalFontSpacing(ACanvas.Width, ACanvas.Height) div 12
   else}
  PenWidth1 := ADrawObject.Parent.OwnImageData.CalFontSpacing(ACanvas.Width, ACanvas.Height) div 12;

  line1 := TLine32.Create;
  try
    Line1.SetPoints([FixedPoint(x1, y1), FixedPoint(x2, y2)]);

    line1.Draw(ACanvas, PenWidth1, [APenColor32, APenColor32, clBlack32, clBlack32, clBlack32, clBlack32]);
  finally
    line1.Free;
  end;
end;

procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  i, k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    //    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[1], scrY[1], Color32(ADrawObject.PenColor));
    for i := 1 to k - 1 do
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], Color32(ADrawObject.PenColor));
  end;
end;

procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
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
    //    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[1], scrY[1], Color32(ADrawObject.PenColor));

    for i := 1 to k - 1 do
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], Color32(ADrawObject.PenColor));
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[k - 1], ADrawObject.scrY[k - 1], ADrawObject.scrX[0], ADrawObject.scrY[0], Color32(ADrawObject.PenColor));

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

procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  X: integer;
  x1, x2, y1, y2: Integer;
begin
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];

  x := Max(x1, x2);
  DrawLineS32(ADrawObject, ACanvas, x + 10, y1, x + 20, y1, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x + 10, y2, x + 20, y2, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x + 15, y1, x + 15, y2, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x + 15 - 4, y1 - 4, x + 15 + 4, y1 + 4, Color32(ADrawObject.PenColor));
  DrawLineS32(ADrawObject, ACanvas, x + 15 - 4, y2 - 4, x + 15 + 4, y2 + 4, Color32(ADrawObject.PenColor));
end;

procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  y: integer;
  x1, x2, y1, y2: Integer;
begin
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];
  y := Max(y1, y2);
  DrawLineS32(ADrawObject, ACanvas, x1, y + 10, x1, y + 20, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x2, y + 10, x2, y + 20, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x1, y + 15, x2, y + 15, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x1 - 4, y + 15 - 4, x1 + 4, y + 15 + 4, Color32(ADrawObject.PenColor));

  DrawLineS32(ADrawObject, ACanvas, x2 - 4, y + 15 - 4, x2 + 4, y + 15 + 4, Color32(ADrawObject.PenColor));
end;

procedure Spiral(ADrawObject: TDicomDrawObject; Buffer: TCnsBitmap32; X, Y, R: Integer);
var
  Theta: Single;
begin
  //        Buffer.SetStipple([clWhite32, $00FFFFFF]);
      //    Buffer.StippleStep := 1;
  Buffer.PenColor := Color32(ADrawObject.PenColor);
  Theta := -3.1415926535;
  Buffer.MoveToF(X + Cos(Theta) * r, Y + Sin(Theta) * r);
  while Theta < 3.1415926535 + 0.2 do
  begin
    Buffer.LineToFS(X + Cos(Theta) * r, Y + Sin(Theta) * r);
    Theta := Theta + 0.2;
  end;
end;

procedure DrawRotateGrip(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  i, k: integer;
begin
  if ADrawObject.Kind in [ldmiROI_Cycle, ldmiSolidRect, ldmiROI_Rect, ldmiPerpendicularityLine] then
    exit;
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.FrameRectS(ADrawObject.scrX[0] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[0] + 4, Color32(ADrawObject.PenColor));
    ACanvas.FrameRectS(ADrawObject.scrX[k - 1] - 4, ADrawObject.scrY[k - 1] - 4, ADrawObject.scrX[k - 1] + 4, ADrawObject.scrY[k - 1] + 4,
      Color32(ADrawObject.PenColor));

    for i := 1 to k - 2 do
    begin
      ACanvas.FrameRectS(ADrawObject.scrX[i] - 4, ADrawObject.scrY[i] - 4, ADrawObject.scrX[i] + 4, ADrawObject.scrY[i] + 4, Color32(ADrawObject.PenColor));
    end;

    if ADrawObject.Kind in [ldmiCycle, ldmiRect, ldmiReferenceLine, ldmiSelectRect, ldmiText] then
    begin
      ACanvas.FrameRectS(ADrawObject.scrX[0] - 4, ADrawObject.scrY[1] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[1] + 4, Color32(ADrawObject.PenColor));
      ACanvas.FrameRectS(ADrawObject.scrX[1] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[1] + 4, ADrawObject.scrY[0] + 4, Color32(ADrawObject.PenColor));
    end;
    if ADrawObject.Kind in [ldmiText] then
    begin
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], Color32(ADrawObject.PenColor));
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
    end;
  end;
end;

procedure DrawSelectGrip(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  i, k: integer;
begin
  if ADrawObject.Kind in [ldmiROI_Cycle, ldmiSolidRect, ldmiROI_Rect, ldmiPerpendicularityLine] then
    exit;
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.FrameRectS(ADrawObject.scrX[0] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[0] + 4, Color32(ADrawObject.PenColor));
    ACanvas.FrameRectS(ADrawObject.scrX[k - 1] - 4, ADrawObject.scrY[k - 1] - 4, ADrawObject.scrX[k - 1] + 4, ADrawObject.scrY[k - 1] + 4,
      Color32(ADrawObject.PenColor));

    for i := 1 to k - 2 do
    begin
      ACanvas.FrameRectS(ADrawObject.scrX[i] - 4, ADrawObject.scrY[i] - 4, ADrawObject.scrX[i] + 4, ADrawObject.scrY[i] + 4, Color32(ADrawObject.PenColor));
    end;

    if ADrawObject.Kind in [ldmiCycle, ldmiRect, ldmiReferenceLine, ldmiSelectRect, ldmiText] then
    begin
      ACanvas.FrameRectS(ADrawObject.scrX[0] - 4, ADrawObject.scrY[1] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[1] + 4, Color32(ADrawObject.PenColor));
      ACanvas.FrameRectS(ADrawObject.scrX[1] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[1] + 4, ADrawObject.scrY[0] + 4, Color32(ADrawObject.PenColor));
    end;
    if ADrawObject.Kind in [ldmiText] then
    begin
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], Color32(ADrawObject.PenColor));
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
    end;
  end;
end;

procedure DrawCycleROI(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  k, w, h: integer;
  //  x1, y1, x2, y2: Integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    //    ACanvas.FrameRectS(scrX[0], scrY[0], scrX[1], scrY[1], Color32(ADrawObject.PenColor));
    w := abs(ADrawObject.scrX[1] - ADrawObject.scrX[0]) div 2;
    h := abs(ADrawObject.scrY[1] - ADrawObject.scrY[0]) div 2;
    Spiral(ADrawObject, ACanvas, (ADrawObject.scrX[1] + ADrawObject.scrX[0]) div 2, (ADrawObject.scrY[1] + ADrawObject.scrY[0]) div 2, Max(w, h));

    {  x1 := Min(scrX[0], scrX[1]);
      x2 := Max(scrX[0], scrX[1]);
      y1 := Min(scrY[0], scrY[1]);
      y2 := Max(scrY[0], scrY[1]);

      DrawLineS32(ACanvas,x1 + w, y1 + h, x2 + w, y2 + h, Color32(ADrawObject.PenColor)); }
  end;
end;

procedure DrawCycle(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
  procedure Spiral(Buffer: TCnsBitmap32; X, Y, R: Integer);
  var
    Theta: Single;
  begin
    //        Buffer.SetStipple([clWhite32, $00FFFFFF]);
        //    Buffer.StippleStep := 1;
    Buffer.PenColor := Color32(ADrawObject.PenColor);
    Theta := -3.1415926535;
    Buffer.MoveToF(X + Cos(Theta) * r, Y + Sin(Theta) * r);
    while Theta < 3.1415926535 + 0.2 do
    begin
      Buffer.LineToFS(X + Cos(Theta) * r, Y + Sin(Theta) * r);
      Theta := Theta + 0.2;
    end;
  end;
var
  k, w, h: integer;
  //  x1, y1, x2, y2: Integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    //    ACanvas.FrameRectS(scrX[0], scrY[0], scrX[1], scrY[1], Color32(ADrawObject.PenColor));
    w := abs(ADrawObject.scrX[1] - ADrawObject.scrX[0]) div 2;
    h := abs(ADrawObject.scrY[1] - ADrawObject.scrY[0]) div 2;
    Spiral(ACanvas, (ADrawObject.scrX[1] + ADrawObject.scrX[0]) div 2, (ADrawObject.scrY[1] + ADrawObject.scrY[0]) div 2, Max(w, h));

  end;
end;

procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  k, w, h: integer;
  //  x1, x2, y1, y2: Integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], Color32(ADrawObject.PenColor));
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));

    w := abs(ADrawObject.scrX[1] - ADrawObject.scrX[0]) div 2;
    h := abs(ADrawObject.scrY[1] - ADrawObject.scrY[0]) div 2;

    {  x1 := Min(scrX[0], scrX[1]);
      x2 := Max(scrX[0], scrX[1]);
      y1 := Min(scrY[0], scrY[1]);
      y2 := Max(scrY[0], scrY[1]);

      DrawLineS32(ADrawObject,ACanvas,x1 + w, y1 + h, x2 + w, y2 + h, Color32(ADrawObject.PenColor));}
      //    DrawLineS32(ACanvas,scrX[0] + w, scrY[0] + h, scrX[1] + w, scrY[1] + h, Color32(ADrawObject.PenColor));
  end;
end;

procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  k: integer;
  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], Color32(ADrawObject.PenColor));
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));

    Acanvas.Font.Assign(ADrawObject.Font);

    str1 := Format('W %f,H %f,W/H%4.2f', [abs(ADrawObject.X[0] - ADrawObject.X[1]) * ADrawObject.Parent.OwnImageData.PixelSpacingX,
      abs(ADrawObject.Y[0] - ADrawObject.Y[1]) * ADrawObject.Parent.OwnImageData.PixelSpacingY,
        abs(ADrawObject.X[0] - ADrawObject.X[1]) / abs(ADrawObject.Y[0] - ADrawObject.Y[1])]);
    ACanvas.Textout(Min(ADrawObject.scrX[0], ADrawObject.scrX[1]), Min(ADrawObject.scrY[0], ADrawObject.scrY[1]), str1);
  end;
end;

procedure DrawPerpendicularityLine(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  k: integer;
  //  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k = 1 then
  begin
    DrawLineS32(ADrawObject, ACanvas, 0, ADrawObject.scrY[0] - 1, Acanvas.Width, ADrawObject.scrY[0] - 1, clRed32);
    DrawLineS32(ADrawObject, ACanvas, 0, ADrawObject.scrY[0], Acanvas.Width, ADrawObject.scrY[0], clRed32);
    //    DrawLineS32(ADrawObject,ACanvas,0, scrY[0] + 1, Acanvas.Width, scrY[0] + 1, clRed32);

    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0], 0, ADrawObject.scrX[0], ACanvas.Height, clBlue);

    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0] - 20, ADrawObject.scrY[0] - 20, ADrawObject.scrX[0] + 20, ADrawObject.scrY[0] - 20, clRed32);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0] - 20, ADrawObject.scrY[0] - 20, ADrawObject.scrX[0] - 20, ADrawObject.scrY[0] + 20, clRed32);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0] - 20, ADrawObject.scrY[0] + 20, ADrawObject.scrX[0] + 20, ADrawObject.scrY[0] + 20, clRed32);
    DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[0] + 20, ADrawObject.scrY[0] - 20, ADrawObject.scrX[0] + 20, ADrawObject.scrY[0] + 20, clRed32);

  end;
end;

procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; AFontSize: Integer);
var
  k, x1, y1: integer;
  //  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    //if UserText <> '' then
    //else

    //ACanvas.SetStipple([PenColor32, PenColor32, 0, 0, PenColor32, PenColor32]);
    //ACanvas.StippleStep := 1;
    //ACanvas.LineFSP(scrX[0], scrY[0], scrX[1], scrY[1], false);

    DrawLineS32Ref(ADrawObject, ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], Color32(ADrawObject.PenColor));

    Acanvas.Font.Assign(ADrawObject.Font);
    //Acanvas.Font.Color := clRed;

    Acanvas.Font.Size := AFontSize;
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
      Acanvas.RenderText(x1, y1, ADrawObject.UserText, 0, clRed32);
    end
    else
    begin
      x1 := ADrawObject.scrX[0];
      y1 := ADrawObject.scrY[0];
      if (ADrawObject.scrX[1] - ADrawObject.scrX[0]) < (ADrawObject.scrY[1] - ADrawObject.scrY[0]) then
        x1 := x1 - 10
      else
        y1 := y1 - 10;

      Acanvas.RenderText(x1, y1, ADrawObject.UserText, 0, clRed32);
    end;
    //    DrawLineS32(ADrawObject,ACanvas,scrX[0], scrY[0], scrX[0], scrY[1], Color32(ADrawObject.PenColor));
    //    DrawLineS32(ADrawObject,ACanvas,scrX[0], scrY[1], scrX[1], scrY[1], Color32(ADrawObject.PenColor));
    //    DrawLineS32(ADrawObject,ACanvas,scrX[1], scrY[0], scrX[1], scrY[1], Color32(ADrawObject.PenColor));

  end;
end;

procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    {    DrawLineS32(ADrawObject,ACanvas,scrX[0], scrY[0], scrX[1], scrY[0], Color32(ADrawObject.PenColor));
        DrawLineS32(ADrawObject,ACanvas,scrX[0], scrY[0], scrX[0], scrY[1], Color32(ADrawObject.PenColor));
        DrawLineS32(ADrawObject,ACanvas,scrX[0], scrY[1], scrX[1], scrY[1], Color32(ADrawObject.PenColor));
        DrawLineS32(ADrawObject,ACanvas,scrX[1], scrY[0], scrX[1], scrY[1], Color32(ADrawObject.PenColor));
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

procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32; ARect: TRect);
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
        IntToStr(ADrawObject.TextIndex) + ':' + str1, 0, Color32(Acanvas.Font.Color));
      Acanvas.Font.Color := clWhite;
      Acanvas.TextOut(ARect.Right div 3 + 1, ARect.Bottom - (ADrawObject.TextIndex + 2) * (sh + 2) + 1,
        IntToStr(ADrawObject.TextIndex) + ':' + str1);
    end
    else
    begin
      Acanvas.Font.Color := clBlack;
      Acanvas.RenderText(ARect.Right div 3, (-ADrawObject.TextIndex) * (sh + 2),
        IntToStr(abs(ADrawObject.TextIndex)) + ':' + str1, 0, Color32(Acanvas.Font.Color));
      Acanvas.Font.Color := clWhite;
      Acanvas.TextOut(ARect.Right div 3 + 1, (-ADrawObject.TextIndex) * (sh + 2) + 1,
        IntToStr(abs(ADrawObject.TextIndex)) + ':' + str1);
    end;
  finally
    strs.Free;
  end;
end;

procedure DrawSolidRect(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
begin

end;

procedure DrawLCA_RCA(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
var
  i, k: integer;
  LineList1: TList;
  DrawLineList1: TList;
  procedure AddLine(AList: TList; X1, Y1, X2, Y2: Double; ALen: Double);
  var
    p: PStructLine2D;
  begin
    GetMem(p, SizeOf(TStructLine2D));
    p.P0.X := X1;
    p.P0.Y := Y1;
    p.P1.X := X2;
    p.P1.Y := Y2;
    p.Length := ALen;
    LineList1.Add(p);
  end;
  procedure AddDrawLine(X1, Y1, X2, Y2: Integer);
  var
    p: PStructLine2D;
  begin
    GetMem(p, SizeOf(TStructLine2D));
    p.P0.X := X1;
    p.P0.Y := Y1;
    p.P1.X := X2;
    p.P1.Y := Y2;
    p.Length := 0;
    DrawLineList1.Add(p);
  end;
  procedure ClearLineList;
  var
    i: Integer;
    p: PStructLine2D;
  begin
    for i := 0 to LineList1.Count - 1 do
    begin
      p := PStructLine2D(LineList1[i]);
      FreeMem(p);
    end;
    LineList1.Clear;
    LineList1.Free;

    for i := 0 to DrawLineList1.Count - 1 do
    begin
      p := PStructLine2D(DrawLineList1[i]);
      FreeMem(p);
    end;
    DrawLineList1.Clear;
    DrawLineList1.Free;
  end;
  procedure BuildLineList;
  var
    i, k, i1: Integer;
    ps, p1, p2: TStructMatrix2D;
    Line1: TStructLine2D;
    l1, l2, lmax: Double;
  begin
    k := ADrawObject.GetCount;
    for i := 0 to ADrawObject.PloyID do
    begin
      ps.x := ADrawObject.scrX[i];
      ps.y := ADrawObject.scrY[i];
      lmax := 99999;
      for i1 := ADrawObject.PloyID + 2 to k - 1 do
      begin
        line1.P0.x := ADrawObject.scrX[i1 - 1];
        line1.P0.y := ADrawObject.scrY[i1 - 1];
        line1.P1.x := ADrawObject.scrX[i1];
        line1.P1.y := ADrawObject.scrY[i1];

        l1 := dist_Point_to_Segment(ps, line1, p1, l2);
        if l1 < lmax then
        begin
          lmax := l1;
          p2 := p1;
        end;
      end;
      AddLine(LineList1, ps.x, ps.y, p2.x, p2.y, lmax);
    end;
    for i := ADrawObject.PloyID + 1 to k - 1 do
    begin
      ps.x := ADrawObject.scrX[i];
      ps.y := ADrawObject.scrY[i];
      lmax := 99999;
      for i1 := 1 to ADrawObject.PloyID do
      begin
        line1.P0.x := ADrawObject.scrX[i1 - 1];
        line1.P0.y := ADrawObject.scrY[i1 - 1];
        line1.P1.x := ADrawObject.scrX[i1];
        line1.P1.y := ADrawObject.scrY[i1];

        l1 := dist_Point_to_Segment(ps, line1, p1, l2);
        if l1 < lmax then
        begin
          lmax := l1;
          p2 := p1;
        end;
      end;
      AddLine(LineList1, ps.x, ps.y, p2.x, p2.y, l1);
    end;

  end;

  procedure DrawMaxMinLine;
  var
    i: Integer;
    Line1: PStructLine2D;
  begin
    for i := 0 to LineList1.Count - 1 do
    begin
      Line1 := PStructLine2D(LineList1[i]);
      DrawLineS32(ADrawObject, ACanvas, Trunc(line1.P0.x), Trunc(line1.P0.y),
        Trunc(line1.P1.x), Trunc(line1.P1.y), clRed32);
    end;
  end;
begin
  if ADrawObject.PloyID < 0 then
  begin
    k := ADrawObject.GetCount;
    if k > 1 then
    begin
      for i := 1 to k - 1 do
        DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], Color32(ADrawObject.PenColor));
    end;
  end
  else
  begin
    k := ADrawObject.GetCount;
    for i := 1 to ADrawObject.PloyID do
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], Color32(ADrawObject.PenColor));
    if k > ADrawObject.PloyID + 3 then
    begin
      for i := ADrawObject.PloyID + 2 to k - 1 do
        DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], Color32(ADrawObject.PenColor));
      //if DragState = cdsNone then
      begin
        LineList1 := TList.Create;
        DrawLineList1 := TList.Create;
        try
          BuildLineList;

          DrawMaxMinLine;
        finally
          ClearLineList;
        end;
      end;
    end;
  end;
end;

procedure DrawVentricular(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
begin

end;

procedure DrawVitexObject(ADrawObject: TDicomDrawObject; ACanvas: TCnsBitmap32);
begin
  if assigned(ADrawObject.VitexObject) then
  begin
    //    ADrawObject.VitexObject.DrawTo(Acanvas);
  end;
end;

procedure DrawQuantitativeCoronaryAnaliysis(ADrawObject: TDicomDrawObject;
  ACanvas: TCnsBitmap32);
  function GetTheLength(x1, y1, x2, y2: Double): Double;
  var
    lx, ly: Double;
  begin
    lx := abs(x1 - x2) * ADrawObject.fViewCood^.RescaleSlopeX;
    ly := abs(y1 - y2) * ADrawObject.fViewCood^.RescaleSlopeY;
    Result := sqrt(lx * lx + ly * ly);
  end;
var
  i, k: integer;
  Procimal,
    StenosisBegin,
    MinimumDiameter,
    StenosisEnd,
    Distal: Double;

  StenosisLength,
    StenosisDiameter,
    StenosisPercent,
    IdeaDiameter: Double;
  h1, w1, y1: Integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    for i := 1 to k - 1 do
      if (i mod 2) = 1 then
      begin
        ACanvas.LineS(ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], Color32(ADrawObject.PenColor));

        Acanvas.Font.Color := clRed;

        case i div 2 of
          0:
            begin
              Procimal := GetTheLength(ADrawObject.X[i - 1], ADrawObject.Y[i - 1], ADrawObject.X[i], ADrawObject.Y[i]);
              //ACanvas.Textout(scrX[i], scrY[i], Format('Procimal : %5.2f', [Procimal]));
            end;
          1:
            begin
              StenosisBegin := GetTheLength(ADrawObject.X[i - 1], ADrawObject.Y[i - 1], ADrawObject.X[i], ADrawObject.Y[i]);
              //ACanvas.Textout(scrX[i], scrY[i], Format('Stenosis Begin : %5.2f', [StenosisBegin]));
            end;
          2:
            begin
              MinimumDiameter := GetTheLength(ADrawObject.X[i - 1], ADrawObject.Y[i - 1], ADrawObject.X[i], ADrawObject.Y[i]);
              //ACanvas.Textout(scrX[i], scrY[i], Format('Minimum Diameter : %5.2f', [MinimumDiameter]));
              StenosisDiameter := MinimumDiameter;
            end;
          3:
            begin
              StenosisEnd := GetTheLength(ADrawObject.X[i - 1], ADrawObject.Y[i - 1], ADrawObject.X[i], ADrawObject.Y[i]);
              StenosisLength := GetTheLength(ADrawObject.X[2], ADrawObject.Y[2], ADrawObject.X[6], ADrawObject.Y[6]);

              //ACanvas.Textout(scrX[i], scrY[i], Format('Stenosis End : %5.2f', [StenosisEnd]));
            end;
          4:
            begin
              Distal := GetTheLength(ADrawObject.X[i - 1], ADrawObject.Y[i - 1], ADrawObject.X[i], ADrawObject.Y[i]);
              IdeaDiameter := (Procimal + Distal) / 2;
              StenosisPercent := (1 - MinimumDiameter / IdeaDiameter) * 100;

              h1 := Acanvas.TextHeight('A') + 1;
              w1 := ADrawObject.scrX[i];
              y1 := ADrawObject.scrY[i];

              w1 := ADrawObject.GetTextPointSCRX;
              y1 := ADrawObject.GetTextPointSCRY;

              ACanvas.Textout(w1, y1, Format('Distal : %5.2f', [Distal]));
              ACanvas.Textout(w1, y1 + h1, Format('Procimal : %5.2f', [Procimal]));
              ACanvas.Textout(w1, y1 + h1 * 2, Format('Stenosis Begin : %5.2f', [StenosisBegin]));
              ACanvas.Textout(w1, y1 + h1 * 3, Format('Minimum Diameter : %5.2f', [MinimumDiameter]));
              ACanvas.Textout(w1, y1 + h1 * 4, Format('Stenosis End : %5.2f', [StenosisEnd]));

              ACanvas.Textout(w1, y1 + h1 * 5, Format('Stenosis Percent: %5.2f %%',
                [StenosisPercent]));
              ACanvas.Textout(w1, y1 + h1 * 6, Format('Stenosis Diameter: %5.2f ',
                [StenosisDiameter]));
              ACanvas.Textout(w1, y1 + h1 * 7, Format('Idea Diameter: %5.2f',
                [IdeaDiameter]));
              ACanvas.Textout(w1, y1 + h1 * 8, Format('Steno sisLength: %5.2f ',
                [StenosisLength]));

              ACanvas.LineS(ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[2], ADrawObject.scrY[2], clYellow32);
              ACanvas.LineS(ADrawObject.scrX[2], ADrawObject.scrY[2], ADrawObject.scrX[4], ADrawObject.scrY[4], clYellow32);
              ACanvas.LineS(ADrawObject.scrX[4], ADrawObject.scrY[4], ADrawObject.scrX[6], ADrawObject.scrY[6], clYellow32);
              ACanvas.LineS(ADrawObject.scrX[6], ADrawObject.scrY[6], ADrawObject.scrX[8], ADrawObject.scrY[8], clYellow32);

              ACanvas.LineS(ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.scrX[3], ADrawObject.scrY[3], clYellow32);
              ACanvas.LineS(ADrawObject.scrX[3], ADrawObject.scrY[3], ADrawObject.scrX[5], ADrawObject.scrY[5], clYellow32);
              ACanvas.LineS(ADrawObject.scrX[5], ADrawObject.scrY[5], ADrawObject.scrX[7], ADrawObject.scrY[7], clYellow32);
              ACanvas.LineS(ADrawObject.scrX[7], ADrawObject.scrY[7], ADrawObject.scrX[9], ADrawObject.scrY[9], clYellow32);
            end;
        end;
      end;
  end;
end;

////////////////////////////////////////////////////////////

procedure _MorphFilter(bitmap: TCnsBitmap32; WindowSize: integer;
  op: integer; fSelx1, fSely1, fSelx2, fSely2: integer);
begin

end;

procedure _ApplyFilter(bitmap: TCnsBitmap32; filter: TGraphFilter;
  fSelx1, fSely1, fSelx2, fSely2: integer);
begin

end;

procedure _GetHistogram(Bitmap: TCnsBitmap32; var Hist: THistogram; fSelx1, fSely1, fSelx2, fSely2:
  integer);
var
  x, y: integer;
  e: PColor32Array;
  r1, g1, b1: Byte;
begin
  fSelX2 := imin(fSelX2, bitmap.Width);
  dec(fSelX2);
  fSelY2 := imin(fSelY2, bitmap.Height);
  dec(fSelY2);
  fillmemory(@Hist, sizeof(THistogram), 0); // zero fill
  for y := fSely1 to fSely2 do
  begin
    e := Bitmap.ScanLine[y];
    for x := fSelx1 to fSelx2 do
    begin
      r1 := (e[x] shr 16) and $FF;
      g1 := (e[x] shr 8) and $FF;
      b1 := (e[x]) and $FF;
      inc(Hist[r1].r);
      inc(Hist[g1].G);
      inc(Hist[b1].b);
      inc(Hist[(r1 * 21 + g1 * 71 + b1 * 7) div 100].Gray);
    end;
  end;
end;

procedure _GetHistogram(Bitmap: TCnsBitmap32; var Hist: THistogram);
var
  x, y: integer;
  e: PColor32Array;
  r1, g1, b1: Byte;
  fSelx1, fSely1, fSelx2, fSely2: integer;
begin
  fSelx1 := 0;
  fSely1 := 0;
  fSelX2 := bitmap.Width;
  dec(fSelX2);
  fSelY2 := bitmap.Height;
  dec(fSelY2);
  fillmemory(@Hist, sizeof(THistogram), 0); // zero fill
  for y := fSely1 to fSely2 do
  begin
    e := Bitmap.ScanLine[y];
    for x := fSelx1 to fSelx2 do
    begin
      r1 := (e[x] shr 16) and $FF;
      g1 := (e[x] shr 8) and $FF;
      b1 := (e[x]) and $FF;
      inc(Hist[r1].r);
      inc(Hist[g1].G);
      inc(Hist[b1].b);
      inc(Hist[(r1 * 21 + g1 * 71 + b1 * 7) div 100].Gray);
    end;
  end;
end;
end.

