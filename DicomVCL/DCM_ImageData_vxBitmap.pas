unit DCM_ImageData_vxBitmap;

interface
{$I DicomPack.inc}

uses
  {$IFDEF LINUX}Types, Libc, QControls, Qgraphics, {$ELSE}
  Windows, Messages, Forms, Controls, graphics, Dialogs, {$ENDIF}
  SysUtils, Classes, {$IFDEF DICOMDEBUX1}DbugIntf, {$ENDIF}
  CnsMsg, DCM_Dict, DCM_UID, DcmImageConvert,
  DCM_Attributes, dcm_vgcore, DCM_Templates, math;

//TDicomDrawObject
procedure DrawLineS32(ACanvas: TvxCanvas; x1, y1, x2, y2: Single; APenColor: TColor);
procedure DrawLineS32Ref(ACanvas: TvxCanvas; x1, y1, x2, y2: Single; APenColor: TColor);

procedure DrawLCA_RCA(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawQuantitativeCoronaryAnaliysis(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawVentricular(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer; ACanvas: TvxCanvas);
procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawSelectGrip(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawRotateGrip(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawCycleROI(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawVitexObject(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawSolidRect(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawCycle(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas; AFontSize: Integer);
procedure DrawPerpendicularityLine(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);

procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas; AFontSize: Integer);
procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas; ARect: TvxRect);
procedure DrawMeasureReport(ADicomImage: TDicomImage; ACanvas: TvxCanvas; ARect: TvxRect; AOffX, AOffY: Double);

//TDicomDrawObjects
procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TvxCanvas; ARect: TvxRect; ADisplayCalcText: Boolean;
  ACurrentFrameIndex, AFontSize: Integer);

//TDicomImage
procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DrawImagePosition(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect);
procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ARight, ABottom: Boolean);

procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonListForVR(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);

procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);

procedure myTextOut(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; AMode: TDisplayArea; ARow: Integer; AText: AnsiString);

procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TvxBitmap);
function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TvxBitmap; WithLabel: Boolean = true): Boolean;
function AssignToBitmapDefault(ADicomImage: TDicomImage; ABitmapEx: TvxBitmap; WithLabel: Boolean = false): Boolean;

procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Buffer: TvxCanvas; ARect: TvxRect; Zoom: Single = 1; AXOff: Integer =
  0; AYOff: Integer = 0);

procedure vxCanvasRenderText(Canvas: TvxCanvas; X, Y: Single; AText: string; AFontSize: Integer; AColor: TColor);
procedure vxCanvasRenderTextR(Canvas: TvxCanvas; X, Y: Single; AText: string; AFontSize: Integer; AColor: TColor);

implementation

procedure vxCanvasFrameRectS(Canvas: TvxCanvas; X1, Y1, X2, Y2: Single; AColor: TColor);
begin

end;

procedure vxCanvasRenderText(Canvas: TvxCanvas; X, Y: Single; AText: string; AFontSize: Integer; AColor: TColor);
var
  R: TvxRect;
begin
  R.Left := X;
  R.Top := Y;
  Canvas.Fill.SolidColor := vgColorFromVCL(AColor);
  if AFontSize > 0 then
    Canvas.Font.Size := AFontSize;

  R.Right := X + canvas.TextWidth(AText) + 1000;
  R.Bottom := Y + canvas.TextHeight(AText);
  Canvas.Stroke.SolidColor := vgColorFromVCL(AColor);
  Canvas.FillText(R, R, AText, false, 1, vgTextAlignNear, vgTextAlignCenter);
end;

procedure vxCanvasRenderTextR(Canvas: TvxCanvas; X, Y: Single; AText: string; AFontSize: Integer; AColor: TColor);
var
  R: TvxRect;
begin
  R.Left := X;
  R.Top := Y;
  Canvas.Fill.SolidColor := vgColorFromVCL(AColor);
  if AFontSize > 0 then
    Canvas.Font.Size := AFontSize;

  R.Right := X + canvas.TextWidth(AText) + 8;
  R.Bottom := Y + canvas.TextHeight(AText);
  Canvas.Stroke.SolidColor := vgColorFromVCL(AColor);
  Canvas.FillText(R, R, AText, false, 1, vgTextAlignFar, vgTextAlignCenter);
end;

function AssignToBitmapDefault(ADicomImage: TDicomImage; ABitmapEx: TvxBitmap; WithLabel: Boolean = false): Boolean;
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
    ADicomImage.Modify := false;
  end;
end;

function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TvxBitmap; WithLabel: Boolean = true): Boolean;
var
  I1, I2, x1, y1: Integer;

  prgb1: pRGB;
  d1, d2: TDicomImageData;
  np1, np2, np3: PByte;
  ABitmap: TvxBitmap;
  //  AT: TAffineTransformation;
  {$IFDEF DICOMDEBUX1}
  iii: Integer;
  {$ENDIF}
  {$IFDEF FOR_TRIAL_VERSION}
  l0, l1, l2: Single;
  {$ENDIF}
  lCen, lWid: integer;

  nn: Boolean;
  lRange, lSz, min16, max16: integer;

  lScaleShl10: Single;
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
    vxCanvasRenderText(ABitmapEx.Canvas, 0, ABitmapEx.Height div 2, 'No Image Data', 40, clRed);
    exit;
  end;
  if d1.Data = nil then
  begin
    ABitmapEx.SetSize(512, 512);
    vxCanvasRenderText(ABitmapEx.Canvas, 0, ABitmapEx.Height div 2, 'No Image Data', 40, clRed);
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
    ABitmap := ABitmapEx; //todo TvxBitmap.Create(0, 0);
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

  if ADicomImage.SamplePerPixel = 1 then //(Copy(PhotometricInterpretation, 1, 4) = 'MONO') then
  begin
    if (ADicomImage.Bits <= 8) then
    begin
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        vImageConvert_Planar8toPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        vImageConvert_Planar8toPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
      end
      else
        vImageConvert_Planar8toPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
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
          vImageConvert_PlanarFtoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
          else
            vImageConvert_Planar16StoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end;
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];

        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100)
          else
            vImageConvert_Planar16StoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
        end;
      end
      else
      begin
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
          else
            vImageConvert_Planar16StoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end;
      end;
    end
    else //32
    begin
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          vImageConvert_Planar32UtoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
        else
          vImageConvert_Planar32StoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          vImageConvert_Planar32UtoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100)
        else
          vImageConvert_Planar32StoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
      end
      else
      begin
        if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          vImageConvert_Planar32UtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
        else
          vImageConvert_Planar32StoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end;
    end;
  end
  else
  begin
    case ADicomImage.PlanarConfiguration of
      0:
        vImageConvert_PlanarRGBtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      1:
        vImageConvert_PlanarRGB_PlanarConfiguration1_toPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      2:
        vImageConvert_PlanarRGB_PlanarConfiguration2_toPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.StartLine, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
    end;
  end;

  if (ADicomImage.AspectRatio <> 1) or (ADicomImage.ImageAngle > 0) then
  begin
    //todo jiawen

  end;
  {$IFDEF FOR_TRIAL_VERSION}
  if (PacsSoftwareName <> '') or (UserHospitalName <> '') then
  begin
    ABitmapEx.Font.Size := Round(ABitmapEx.Width * 3 / Length(PacsSoftwareName));

    l0 := ABitmapEx.Canvas.TextWidth(PacsSoftwareName);
    l1 := ABitmapEx.Canvas.TextWidth(UserHospitalName);
    l2 := ABitmapEx.Canvas.TextHeight(UserHospitalName);

    vxCanvasRenderText(ABitmapEx.Canvas, (ABitmapEx.Width - l0) / 2, (ABitmapEx.Height) / 2 - l2 - 10,
      PacsSoftwareName, -1, clGreen);
    vxCanvasRenderText(ABitmapEx.Canvas, (ABitmapEx.Width - l1) / 2, (ABitmapEx.Height) / 2,
      UserHospitalName, -1, clGreen);

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

    vxCanvasRenderText(ABitmapEx.Canvas, (ABitmapEx.Width - ABitmapEx.Canvas.TextWidth(UserHospitalName)) / 2, 2,
      UserHospitalName, -1, clRed);
  end;
  {$ENDIF}
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    x1 := ADicomImage.Attributes.getInteger($2811, $20E);
    y1 := ADicomImage.Attributes.getInteger($2811, $20F);
    if (x1 <> 0) and (y1 <> 0) then
    begin
      //todo
      //ABitmapEx.Canvas.FillRect(x1 - 20, y1 - 20, x1 + 20, y1 + 20, clRed);
    end;
  end;
  if ADicomImage.PostFilter > 0 then
  begin
    //todo

  end;

  DrawOverlayTo(ADicomImage, ABitmapEx);

  if WithLabel or RuntimeTextInBitmapMode then
  begin
    OverlayLabels(ADicomImage, ABitmapEx.Canvas, vgRect(0, 0, ABitmapEx.Width, ABitmapEx.Height), true);
    //    DrawUserLabels(ABitmap);
  end; // else
end;

procedure myTextOut(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; AMode: TDisplayArea; ARow: Integer; AText: AnsiString);
var
  hh, yy: Single;
  str1: AnsiString;
  R: TvxRect;
begin
  if AText <> '' then
  begin
    str1 := FilterISO1022(AText);

    Dest.Font.Assign(ADicomImage.Font);
    Dest.Font.Size := ADicomImage.FontSpacing;

    if ADicomImage.LabelFontColor = clBlack then
      Dest.Fill.SolidColor := vgColorFromVCL(clWhite)
    else
      Dest.Fill.SolidColor := vgColorFromVCL(ADicomImage.LabelFontColor);
    //Canvas.Fill.SolidColor := vgColorFromVCL(AColor);
    hh := Dest.TextHeight(str1);
    //ww := Dest.TextWidth(str1);
    case AMode of //
      daLeftTop,
        daRightTop:
        begin //left top
          yy := ARect.Top + hh * (ARow - 1);
        end;
      daLeftBottom,
        daRightBottom:
        begin //right t
          yy := ARect.Bottom - hh * (ARow + 1);
        end;
    end; // case
    if AMode in [daLeftTop, daLeftBottom] then
    begin

      R.Left := ARect.Left;
      R.Top := YY;
      R.Right := ARect.Right;
      R.Bottom := YY + hh;
      Dest.FillText(R, R, AText, false, 1, vgTextAlignNear, vgTextAlignCenter);
    end
    else
    begin
      R.Left := ARect.Left;
      R.Top := YY;
      R.Right := ARect.Right;
      R.Bottom := YY + hh;
      Dest.FillText(R, R, AText, false, 1, vgTextAlignFar, vgTextAlignCenter);
    end;
  end;
end;

procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
var
  str1, str2: AnsiString;
begin
  ADicomImage.CalFontSpacing(Trunc(ARect.Right - ARect.Left), Trunc(ARect.Bottom - ARect.Top));

  if ADicomImage.InformationLabels.Count > 0 then
    DrawInformationLabels(ADicomImage, Dest, ARect, ADisplayWLLabel)
  else
  begin
    if ADicomImage.FrameCount > 1 then
      DisplayCommonList(ADicomImage, Dest, ARect, ADisplayWLLabel)
    else
    begin
      str1 := ADicomImage.Attributes.GetString(8, $60);

      str2 := ADicomImage.Attributes.GetString(8, $70);

      if str1 = 'MR' then
      begin
        if Copy(Str2, 1, 2) = 'GE' then
          DisplayCommonListGEMR(ADicomImage, Dest, ARect, ADisplayWLLabel)
        else
          DisplayCommonListSIMR(ADicomImage, Dest, ARect, ADisplayWLLabel);
      end
      else
        if str1 = 'CT' then
        DisplayCommonListSI(ADicomImage, Dest, ARect, ADisplayWLLabel)
      else
        DisplayCommonList(ADicomImage, Dest, ARect, ADisplayWLLabel);
    end;

    //f1 := Min(Dest.Width / Width, Dest.height / Height);
    MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 2, 'Z: ' + Floattostrf(ADicomImage.ViewerZoom * 100, ffFixed, 15, 0) +
      '%');
  end;

  if Dest.Width > 200 then
  begin
    //DrawImageScale(Dest);

    //DrawImagePosition(Dest);
  end;
end;

procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Buffer: TvxCanvas; ARect: TvxRect; Zoom: Single = 1; AXOff: Integer =
  0; AYOff: Integer = 0);
begin
  if not assigned(ADicomImage.Attributes) then
    exit;
  ADicomImage.UpdateCood(ARect.Left, ARect.Top,
    trunc(AXOff + ((ARect.Right - ARect.Left) - Zoom * ADicomImage.Width) / 2),
    trunc(AYOff + ((ARect.Bottom - ARect.Top) - Zoom * ADicomImage.Height) / 2),
    Zoom, ADicomImage.PixelSpacingX, ADicomImage.PixelSpacingY);

  {    ADicomImage.UpdateCood(Rect(AXOff, AYOff, ADicomImage.width, ADicomImage.Height), Rect(0, 0, ADicomImage.width, ADicomImage.Height), Zoom,
        ADicomImage.PixelSpacingX, ADicomImage.PixelSpacingY);

      DrawAll(ADicomImage.DrawObjects, buffer, Rect(0, 0, ADicomImage.width, ADicomImage.Height), false, -1, ADicomImage.CalFontSpacing(Buffer.Width, Buffer.Height));
   }

  DrawAll(ADicomImage.DrawObjects, Buffer, ARect, false, ADicomImage.CurrentFrame, 0);
end;

procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TvxBitmap);
var
  //  da1, da2: TDicomAttribute;
    //w, h, i: Integer;
    //str1: AnsiString;
  //  o1: TOBStream;
  n1: Word;

  i1, i2, z1: integer;
  DestScanLine: PvgColorArray;
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
            DestScanLine[i2] := $FFFFFF00;
          end;

        inc(pw1);
      end;
    end; // for}
  end;
end;

procedure DisplayCommonListForVR(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
//var
//  str1: AnsiString;
//  x1, y1: Integer;
begin
  //if Attributes.getString($8, $60) = 'VR' then
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    ADicomImage.CalFontSpacing(Trunc(ARect.Right - ARect.Left), Trunc(ARect.Bottom - ARect.Top));
    //    ADicomImage.CalFontSpacing(Dest.Width, Dest.Height);

        {x1 := Attributes.getInteger($2811, $20E);
        y1 := Attributes.getInteger($2811, $20F);
        if (x1 <> 0) and (y1 <> 0) then
        begin
          Dest.FillRectS(x1 - 20, x1 + 20, y1 - 20, y1 + 20, clYellow32);
        end;  }

    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 3, ADicomImage.Attributes.GetString($18, $15));
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 4, ADicomImage.Attributes.GetString($8, $103E));
  end;
end;

procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
begin
  {$IFDEF SHOW_ALL_PATIENT_INFO}
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $10),
    ADicomImage.Attributes.GetString($10, $40), ADicomImage.Attributes.GetString($10, $1010)]));
  {$ELSE}
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
  {$ENDIF}

  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20));
  //  MyTextOut(Dest, daLeftTop, 3, ADicomImage.Attributes.GetString($10, $30));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 3, ADicomImage.Attributes.GetString($20, $10));

  if ADicomImage.Attributes.Item[8, $23] <> nil then
  begin
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 5, ADicomImage.Attributes.GetString(8, $23));
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 6, ADicomImage.Attributes.GetString(8, $33));
  end
  else
  begin
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 5, ADicomImage.Attributes.GetString(8, $20));
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 6, ADicomImage.Attributes.GetString(8, $30));
  end;

  //MyTextOut(Dest, daLeftTop, 6, 'IM ' + Attributes.GetString($20, $13));

  if ADicomImage.Attributes.ImageData.FrameCount > 1 then
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 7, 'FRAME ' + IntToStr(ADicomImage.Attributes.ImageData.CurrentFrame));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, 'Unregistered dicomvcl of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  MyTextOut(ADicomImage,Dest, daRightTop, 1, Attributes.GetString(8, $80));
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 3, ADicomImage.Attributes.GetString($18, $15));
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 4, ADicomImage.Attributes.GetString($8, $103E));
  end
  else
  begin
    // MyTextOut(ADicomImage,Dest, daRightTop, 3, Attributes.GetString($8, $1090));
    // MyTextOut(ADicomImage,Dest, daRightTop, 4, Attributes.GetString($18, $1020));
  end;

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
end;

procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
var
  da1, da2: TDicomAttribute;
  str1: AnsiString;
begin
  str1 := ADicomImage.Attributes.GetString($10, $1010);
  if str1 = '' then
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10))
  else
  begin
    {$IFDEF SHOW_ALL_PATIENT_INFO}
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $10),
      ADicomImage.Attributes.GetString($10, $40), str1]));
    {$ELSE}
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
    {$ENDIF}
  end;

  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 3, ADicomImage.Attributes.GetString($10, $30));
  if assigned(ADicomImage.Attributes.Item[8, $22]) then
  begin
    //    MyTextOut(ADicomImage,Dest, daLeftTop, 1, Attributes.GetString($10, $10));
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $22));
  end
  else
  begin
    //    MyTextOut(ADicomImage,Dest, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $10),
    //      ADicomImage.Attributes.GetString($10, $40), ADicomImage.Attributes.GetString($10, $1010)]));
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $23));
  end;

  if assigned(ADicomImage.Attributes.Item[8, $32]) then
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $32))
  else
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $33));

  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 6, 'TP ' + ADicomImage.Attributes.GetString($20, $1041));
  if assigned(ADicomImage.Attributes.Item[$20, $13]) then
  begin
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 7, 'IMA ' + ADicomImage.Attributes.GetString($20, $13));
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 8, 'SEQ ' + ADicomImage.Attributes.GetString($20, $11));
  end
  else
  begin
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 7, 'IMA ' + ADicomImage.Attributes.GetString($20, $12));
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 8, 'SEQ ' + ADicomImage.Attributes.GetString($20, $11));
  end;
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 9, ADicomImage.Attributes.GetString($8, $103E));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  MyTextOut(ADicomImage,Dest, daRightTop, 1, ADicomImage.Attributes.GetString(8, $80));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 3, ADicomImage.Attributes.GetString($8, $1090));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 4, ADicomImage.Attributes.GetString($18, $1020));
  //    MyTextOut(daRightTop, 4, Attributes.GetString(8, $20));

  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 8, Format('kV %s', [ADicomImage.Attributes.GetString($18, $60)]));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 7, Format('mA %s', [ADicomImage.Attributes.GetString($18, $1151)]));
  if ADicomImage.Attributes.GetString($18, $50) <> '' then
  try
    MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 6, Format('Ti %6.1f', [DicomStrToFloat(ADicomImage.Attributes.GetString($18,
        $50))]));
    MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 5, Format('GT %6.1f', [DicomStrToFloat(ADicomImage.Attributes.GetString($18,
        $1120))]));
    MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 4, Format('SL %6.1f', [DicomStrToFloat(ADicomImage.Attributes.GetString($18,
        $50))]));
  except
  end;
  da1 := ADicomImage.Attributes.Item[$21, $1011];
  da2 := ADicomImage.Attributes.Item[$21, $1120];
  if assigned(da1) and assigned(da2) then
  begin
    MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 3, Format('%d  %d/%d', [da2.AsInteger[0], da1.AsInteger[0],
      da1.AsInteger[1]]));
  end;
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 2, ADicomImage.Attributes.GetString($18, $1210));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 1, '001 940');
  //    MyTextOut(ADicomImage,Dest,daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
  //    MyTextOut(daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
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
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, ADicomImage.Attributes.GetString(8, $1090));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 2, 'Ex:' + ADicomImage.Attributes.GetString($20, $10));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 3, 'Se:' + ADicomImage.Attributes.GetString($20, $11));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 5, 'Im:' + ADicomImage.Attributes.GetString($20, $13));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 6, FormatFloat('DFOV:#.00cm', ADicomImage.PixelSpacingX * ADicomImage.Width));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 7, ADicomImage.Attributes.GetString($18, $1210));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 3, ADicomImage.Attributes.GetString($10, $10));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 4, ADicomImage.Attributes.GetString($10, $40) + ' ' +
    Delete0FromAge(ADicomImage.Attributes.GetString($10, $1010)) + ' ' +
    ADicomImage.Attributes.GetString($10, $20));
  if ADicomImage.Attributes.Item[8, $23] <> nil then
  begin
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 5, ADicomImage.Attributes.GetString(8, $23));
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 6, ADicomImage.Attributes.GetString(8, $33));
  end
  else
  begin
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 5, ADicomImage.Attributes.GetString(8, $20));
    MyTextOut(ADicomImage, Dest, ARect, daRightTop, 6, ADicomImage.Attributes.GetString(8, $30));
  end;

  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 6, 'kV:' + ADicomImage.Attributes.GetString($18, $60));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 5, 'mA:' + ADicomImage.Attributes.GetString($18, $1151));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 4, ADicomImage.Attributes.GetString($18, $50) + 'mm');
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 3, 'Tilt:' + ADicomImage.Attributes.GetString($18, $1120));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 2, ADicomImage.Attributes.GetString($8, $30));
  //    MyTextOut(daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
  //  MyTextOut(ADicomImage,Dest,daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
var
  str1: string;
begin
  {$IFDEF SHOW_ALL_PATIENT_INFO}
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $10),
    ADicomImage.Attributes.GetString($10, $40), ADicomImage.Attributes.GetString($10, $1010)]));
  {$ELSE}
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
  {$ENDIF}

  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 2, ADicomImage.Attributes.GetString($10, $20));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 3, ADicomImage.Attributes.GetString($10, $30));

  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 4, ADicomImage.Attributes.GetString($8, $23));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $33));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 6, 'IMAGE ' + ADicomImage.Attributes.GetString($20, $13));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 7, 'SPI ' + ADicomImage.Attributes.GetString($20, $11));
  if ADicomImage.Attributes.GetString($18, $1250) <> '' then
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 8, ADicomImage.Attributes.GetString($18, $1250))
  else
    MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 8, ADicomImage.Attributes.GetString($8, $103E));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  MyTextOut(ADicomImage,Dest, daRightTop, 1, ADicomImage.Attributes.GetString(8, $80));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 3, ADicomImage.Attributes.GetString($8, $1090));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 4, ADicomImage.Attributes.GetString($18, $1020));
  //    MyTextOut(daRightTop, 4, Attributes.GetString(8, $20));

  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 8, ADicomImage.Attributes.GetString($18, $24));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 7, '  *');

  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 6, ADicomImage.Attributes.GetString($18, $20));
  //  MyTextOut(ADicomImage,Dest, daLeftBottom, 5, 'TR ' + ADicomImage.Attributes.GetString($18, $60));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 5, Format('TR %8d', [ADicomImage.Attributes.GetInteger($18, $80)]));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 4, Format('TE %6d/1', [ADicomImage.Attributes.GetInteger($18, $81)]));
  //MyTextOut(ADicomImage,Dest, daLeftBottom, 3, Format('TA    01:46', [ADicomImage.Attributes.GetInteger($18, $50)]));
  //MyTextOut(ADicomImage,Dest, daLeftBottom, 2, Format('AC          1', [ADicomImage.Attributes.GetInteger($18, $1120)]));

  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 3, Format('FA: %s TI: %s', [ADicomImage.Attributes.GetString($18, $1314), ADicomImage.Attributes.GetString($18, $82)]));

  str1 := ADicomImage.Attributes.GetString($18, $1312);
  if str1 = 'ROW' then
    str1 := '←→'
  else
    if str1 = 'COL' then
    str1 := '↑↓';
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 2, Format('PE:%s', [str1]));
  //AddInformationLabel(2, 3, 'FA: [$18, $1314], TI: [$18, $82]');
  //AddInformationLabel(2, 2, 'PE: [$18, $1312]');

  //MyTextOut(daLeftBottom, 1, 'SL ' + Attributes.GetString($18, $1120));

  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 1, '                      ' + ADicomImage.Attributes.GetString($20, $4000));
  //    MyTextOut(daLeftBottom, 2, AImageData.Attributes.GetString($8, $33));

  if ADicomImage.Attributes.GetString($20, $1041) <> '' then
    MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 7, Format('SP%15.2f', [DicomStrToFloat(ADicomImage.Attributes.GetString($20,
        $1041))]));
  if ADicomImage.Attributes.GetString($18, $50) <> '' then
    MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 6, Format('SL%15.2f', [DicomStrToFloat(ADicomImage.Attributes.GetString($18,
        $50))]));
  MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 5, Format('FoV%5d*%5d', [
    trunc(ADicomImage.Width * ADicomImage.Attributes.ImageData.PixelSpacingX * 10), trunc(ADicomImage.height *
      ADicomImage.Attributes.ImageData.PixelSpacingY * 10)]));
  //  MyTextOut(ADicomImage,Dest, daRightBottom, 4, '   ' + Attributes.GetString($18, $60));
  MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 3, Format('Tra>Cor    -10', [ADicomImage.Attributes.GetString($18, $60)]));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 1, 'W:' + inttostr(ADicomImage.WindowWidth) + ' L:' + inttostr(ADicomImage.WindowCenter));
  //    MyTextOut(daRightBottom, 1, 'Z: ' + Floattostrf(Zoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
var
  da1: TDicomAttribute;
begin
  {$IFDEF SHOW_ALL_PATIENT_INFO}
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, Format('%s %sT %s', [ADicomImage.Attributes.GetString($8, $1090),
    ADicomImage.Attributes.GetString($18, $87), ADicomImage.Attributes.GetString($8, $1010)]));
  {$ELSE}
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 1, ADicomImage.Attributes.GetString($10, $10));
  {$ENDIF}

  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 2, 'Ex: ' + ADicomImage.Attributes.GetString($20, $10));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 3, 'Se: ' + ADicomImage.Attributes.GetString($20, $11));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 4, 'Im: ' + ADicomImage.Attributes.GetString($20, $13));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 5, ADicomImage.Attributes.GetString($8, $103E));
  MyTextOut(ADicomImage, Dest, ARect, daLeftTop, 10, 'ET: ' + ADicomImage.Attributes.GetString($18, $91));

  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}
  //  MyTextOut(ADicomImage,Dest, daRightTop, 1, Attributes.GetString(8, $80));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 3, ADicomImage.Attributes.GetString($10, $10));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 4, Format('%s %s %s', [ADicomImage.Attributes.GetString($10, $40),
    ADicomImage.Attributes.GetString($10, $1010), ADicomImage.Attributes.GetString($10, $20)]));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 6, ADicomImage.Attributes.GetString($8, $21));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 7, ADicomImage.Attributes.GetString($8, $31));
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 8, 'Mag=' + ADicomImage.Attributes.GetString($18, $21));

  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 11, ADicomImage.Attributes.GetString($19, $109C)); //$18, $20));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 10, Format('TR:%d', [ADicomImage.Attributes.GetInteger($18, $80)]));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 9, Format('TE:%s/Ef', [ADicomImage.Attributes.GetString($18, $81)]));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 8, Format('EC:%d/1 %dkHz', [ADicomImage.Attributes.GetInteger($18, $86), 11]));

  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 6, ADicomImage.Attributes.GetString($18, $1250));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 5, Format('FOV:%dx%d', [
    trunc(ADicomImage.Width * ADicomImage.Attributes.ImageData.PixelSpacingX), trunc(ADicomImage.height *
      ADicomImage.Attributes.ImageData.PixelSpacingY)]));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 4, Format('%d.0 thk/ %d.0sp', [ADicomImage.Attributes.GetInteger($18, $50),
    1]));
  MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 3, Format('15/4:%d', [ADicomImage.Attributes.GetInteger($18, $95)]));

  da1 := ADicomImage.Attributes.Item[$18, $1310];
  if assigned(da1) and (da1.GetCount > 0) then
  begin
    if da1.AsInteger[0] = 0 then
      MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 2, Format('%d*%d/4 NEX', [da1.AsInteger[1], da1.AsInteger[2]]))
    else
      MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, 2, Format('%d*%d/4 NEX', [da1.AsInteger[0], da1.AsInteger[3]]))
  end;
  //MyTextOut(ADicomImage,Dest, daLeftBottom, 1, Attributes.GetString($18, $22));

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 1, Format('W = %5d  L = %5d', [ADicomImage.WindowWidth, ADicomImage.WindowCenter]));
end;

procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
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
      1: MyTextOut(ADicomImage, Dest, ARect, daLeftTop, v1.OrderID, str1);
      2: MyTextOut(ADicomImage, Dest, ARect, daLeftBottom, v1.OrderID, str1);
      3: MyTextOut(ADicomImage, Dest, ARect, daRightTop, v1.OrderID, str1);
      4: MyTextOut(ADicomImage, Dest, ARect, daRightBottom, v1.OrderID, str1);
      5: MyTextOut(ADicomImage, Dest, ARect, daCenterTop, v1.OrderID, str1);
      6: MyTextOut(ADicomImage, Dest, ARect, daCenterBottom, v1.OrderID, str1);
    end;
  end;
  {$IFDEF FOR_TRIAL_VERSION}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, 'Unregistered copy of dicomvcl');
  {$ELSE}
  MyTextOut(ADicomImage, Dest, ARect, daRightTop, 2, ADicomImage.Attributes.GetString(8, $80));
  {$ENDIF}

  if ADisplayWLLabel then
    MyTextOut(ADicomImage, Dest, ARect, daRightBottom, 1, Format('W = %5d  L = %5d', [ADicomImage.WindowWidth, ADicomImage.WindowCenter]));
  // MyTextOut(ADicomImage,Dest, daRightBottom, 2, 'Z: ' + Floattostrf(ViewerZoom * 100, ffFixed, 15, 0) + '%');
end;

procedure DrawImagePosition(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect);
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
  mw, mh: Single;

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
  mw := ARect.Right - ARect.Left;
  mh := ARect.Bottom - ARect.Top;

  if LeftCaption <> '' then
    vxCanvasRenderText(Dest, ARect.Left + 2, ARect.Top + mh / 2, LeftCaption, ADicomImage.FontSpacing, clWhite);
  if TopCaption <> '' then
    vxCanvasRenderText(Dest, ARect.Left + mw / 2, ARect.Top + 2, TopCaption, ADicomImage.FontSpacing, clWhite); //ADicomImage.LabelFontColor);
  if RightCaption <> '' then
    vxCanvasRenderText(Dest, ARect.Left + mw - 20, ARect.Top + mh / 2, RightCaption, ADicomImage.FontSpacing, clWhite); //ADicomImage.LabelFontColor);
  if BottomCaption <> '' then
    vxCanvasRenderText(Dest, ARect.Left + mw / 2, ARect.Top + mh - 20, BottomCaption, ADicomImage.FontSpacing, clWhite); //ADicomImage.LabelFontColor);

end;

procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TvxCanvas; ARect: TvxRect; ARight, ABottom: Boolean);
var
  mh, mw, cw, ch, kk: Single;
  kw, kh, ny, nx, f1, x1, z1: Double;
  x, y, n: Integer;
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
  f1 := Min((ARect.Right - ARect.Left) / ADicomImage.Width, (ARect.Bottom - ARect.Top) / ADicomImage.Height);
  mh := (ARect.Bottom - ARect.Top);
  mw := (ARect.Right - ARect.Left);
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
  z1 := x1 + (n) * kh;

  if ARight then
  begin
    DrawLineS32(Dest, ARect.Left + cw, ARect.Top + (x1), ARect.Left + cw, ARect.Top + (z1), clWhite);
    while x1 <= z1 do
    begin
      x := round(x1);
      if (y mod 5) = 0 then
      begin
        DrawLineS32(Dest, ARect.Left + cw - kk * 2, ARect.Top + x, ARect.Left + cw, ARect.Top + x, clWhite);
      end
      else
      begin
        DrawLineS32(Dest, ARect.Left + cw - kk, ARect.Top + x, ARect.Left + cw, ARect.Top + x, clWhite);
      end;
      inc(y);
      x1 := (x1 + kh);
    end;
  end;
  // DrawLineS32(Dest, ARect.Left + cw - kk * 2, ARect.Top + x, ARect.Left + cw, ARect.Top + x, clWhite);

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
  z1 := x1 + (n) * kw;

  if ABottom then
  begin
    DrawLineS32(Dest, ARect.Left + (x1), ARect.Top + ch, ARect.Left + (z1), ARect.Top + ch, clWhite);
    while x1 <= z1 do
    begin
      x := round(x1);
      if (y mod 5) = 0 then
      begin
        DrawLineS32(Dest, ARect.Left + x, ARect.Top + ch - kk * 2, ARect.Left + x, ARect.Top + ch, clWhite);
      end
      else
      begin
        DrawLineS32(Dest, ARect.Left + x, ARect.Top + ch - kk, ARect.Left + x, ARect.Top + ch, clWhite);
      end;
      inc(y);
      x1 := (x1 + kw);
    end;
  end;
end;

procedure DrawLineS32(ACanvas: TvxCanvas; x1, y1, x2, y2: Single; APenColor: TColor);
begin
  ACanvas.Stroke.Style := vgBrushSolid;
  ACanvas.StrokeThickness := 1;
  ACanvas.StrokeDash := vgDashSolid;

  ACanvas.Stroke.SolidColor := vgColorFromVCL(APenColor);
  ACanvas.DrawLine(vgPoint(x1, y1), vgPoint(x2, y2), 100);
end;

procedure DrawLineS32Ref(ACanvas: TvxCanvas; x1, y1, x2, y2: Single; APenColor: TColor);
begin
  ACanvas.Stroke.Style := vgBrushSolid;
  ACanvas.StrokeThickness := 1;

  if APenColor = clWhite then
  begin
    ACanvas.StrokeDash := vgDashDot;
    ACanvas.Stroke.SolidColor := vgColorFromVCL(APenColor);
  end
  else
  begin
    ACanvas.Stroke.SolidColor := vgColorFromVCL(clWhite);
    ACanvas.StrokeDash := vgDashSolid;
  end;

  ACanvas.DrawLine(vgPoint(x1, y1), vgPoint(x2, y2), 1);
end;

procedure DrawMeasureReport(ADicomImage: TDicomImage; ACanvas: TvxCanvas; ARect: TvxRect; AOffX, AOffY: Double);
var
  w, h: Single;
  i: integer;
  str1, str2: AnsiString;
  //  f1: Double;
begin
  h := ACanvas.TextHeight('1');
  ACanvas.Fill.SolidColor := vgColorFromVCL(clBlue);
  for I := 0 to ADicomImage.MeasureReport.Count - 1 do // Iterate
  begin
    str1 := ADicomImage.MeasureReport.Names[i];
    str2 := ADicomImage.MeasureReport.Values[str1];
    {    if str2 <> '' then
        begin
          f1 := DicomStrToFloat(str2);
          str2 := FormatFloat('0.00', f1);
        end;}
    w := ACanvas.TextWidth(str1 + ':');
    // Dest.TextOut(trunc(AOffX - w), trunc(AOffY + h * i), str1 + ':');
    // Dest.TextOut(trunc(AOffX + 1), trunc(AOffY + h * i), str2);
  end;
end;

procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TvxCanvas; ARect: TvxRect; ADisplayCalcText: Boolean;
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

      if ADisplayCalcText then
        DrawText(o1, ACanvas, ARect);
    end;
  end;
  if assigned(ADrawObjects.NewDrawObject) then
    if (ADrawObjects.NewDrawObject.RelateFrameIndex = ACurrentFrameIndex) or (ACurrentFrameIndex = -1) then
      DrawSelectGrip(ADrawObjects.NewDrawObject, ACanvas);
end;

procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas; AFontSize: Integer);
var
  strs: TStringList;
  i: integer;
  x1, y1, x2, y2, sh: Single;
  str1: AnsiString;
  c1: TColor;
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
            c1 := vgColorFromVCL(ADrawObject.PenColor); //vgColorFromVCL(Acanvas.Font.Color);
            //ACanvas.PenColor := c1;
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
            DrawLineS32(ACanvas, x2, y2, x1, y1, ADrawObject.PenColor);

          end;
      else
        begin
          x1 := ADrawObject.SCRX[0] + 5;
          y1 := ADrawObject.SCRY[0] + 5;
        end;
      end;
      ACanvas.Font.size := ADrawObject.Parent.OwnImageData.FontSpacing; //CalFontSpacing(ACanvas.Width, ACanvas.Height);
      if ADrawObject.Textindex = 0 then
      begin
        sh := ACanvas.TextHeight(strs[0]) + 3;

        for i := 0 to strs.Count - 1 do
        begin
          if strs[i] <> '' then
          begin
            vxCanvasRenderText(Acanvas, x1, y1 + i * sh, strs[i], 0, ADrawObject.Font.Color);
            if ADrawObject.PenColor = clWhite then
              vxCanvasRenderText(Acanvas, x1 + 1, y1 + i * sh + 1, strs[i], 0, clBlack)
            else
              if ADrawObject.PenColor = clBlack then
              vxCanvasRenderText(Acanvas, x1 + 1, y1 + i * sh + 1, strs[i], 0, clWhite)
          end;
        end;
      end
      else
      begin
        str1 := IntToStr(abs(ADrawObject.Textindex));
        vxCanvasRenderText(Acanvas, x1, y1, str1, 0, ADrawObject.Font.Color);
        if ADrawObject.PenColor = clWhite then
          vxCanvasRenderText(Acanvas, x1 + 1, y1 + 1, str1, 0, clBlack)
        else
          if ADrawObject.PenColor = clBlack then
          vxCanvasRenderText(Acanvas, x1 + 1, y1 + 1, str1, 0, clWhite);

        DrawText(ADrawObject, ACanvas, vgRect(0, 0, ACanvas.Width, ACanvas.Height));
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
          DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], clRed);
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

procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
begin
  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
end;

procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
begin
  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  if ADrawObject.UserText <> '' then
  begin
    Acanvas.Font.Assign(ADrawObject.Font);
    vxCanvasRenderText(ACanvas, ADrawObject.SCRX[0], ADrawObject.SCRY[0] + Acanvas.TextHeight('A'),
      '=' + ADrawObject.UserText, ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
  end;
end;

procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
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

  DrawLineS32(ACanvas, x1, y1, x2, y2, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x2, y2, X3, Y3, ADrawObject.PenColor);

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ACanvas, x1, y1, x2, y2, clBlack);

    DrawLineS32(ACanvas, x2, y2, X3, Y3, clBlack);
  end;

  xx1 := trunc(x2 - (x2 - x1) * 0.1);
  yy1 := trunc(y2 - (y2 - y1) * 0.1);

  xx2 := trunc(x2 - (x2 - x3) * 0.1);
  yy2 := trunc(y2 - (y2 - y3) * 0.1);
  DrawLineS32(ACanvas, xx1, yy1, xx2, yy2, ADrawObject.PenColor);

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ACanvas, xx1, yy1, xx2, yy2, clBlack);
  end;
end;

procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
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

  DrawLineS32(ACanvas, pp[3].X, pp[3].Y, pp[1].X, pp[1].Y, ADrawObject.PenColor);

  DrawLineS32(ACanvas, pp[2].X, pp[2].Y, pp[1].X, pp[1].Y, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x1, y1, x2, y2, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x1 - 4, y1, x1 + 4, y1, ADrawObject.PenColor);
  DrawLineS32(ACanvas, x1, y1 - 4, x1, y1 + 4, ADrawObject.PenColor);

  if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ACanvas, pp[3].X, pp[3].Y, pp[1].X, pp[1].Y, clBlack);

    DrawLineS32(ACanvas, pp[2].X, pp[2].Y, pp[1].X, pp[1].Y, clBlack);

    DrawLineS32(ACanvas, x1, y1, x2, y2, clBlack);

    DrawLineS32(ACanvas, x1 - 4, y1, x1 + 4, y1, clBlack);
    DrawLineS32(ACanvas, x1, y1 - 4, x1, y1 + 4, clBlack);
  end;

  if ADrawObject.UserText <> '' then
  begin
    Acanvas.Font.Assign(ADrawObject.Font);
    ACanvas.Font.size := ADrawObject.Parent.OwnImageData.FontSpacing; //CalFontSpacing(ACanvas.Width, ACanvas.Height);

    vxCanvasRenderText(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.UserText, 0, clBlack);
    vxCanvasRenderText(ACanvas, ADrawObject.scrX[0] + 1, ADrawObject.scrY[0] + 1, ADrawObject.UserText, 0, clWhite);
  end;
end;

procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
begin
  Acanvas.Font.Assign(ADrawObject.Font);

  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  vxCanvasRenderText(ACanvas, ADrawObject.SCRX[1], ADrawObject.SCRY[1], 'L1', ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
  if ADrawObject.GetCount > 3 then
  begin
    DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
    vxCanvasRenderText(ACanvas, ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L2', ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
    if ADrawObject.GetCount > 5 then
    begin
      DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
      vxCanvasRenderText(ACanvas, ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L3', ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
      if ADrawObject.GetCount > 7 then
      begin
        DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
        vxCanvasRenderText(ACanvas, ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L4', ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
      end;
    end;
  end;
end;

procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
begin
  Acanvas.Font.Assign(ADrawObject.Font);

  DrawRulerLine(ADrawObject, ADrawObject.SCRX[0], ADrawObject.SCRY[0], ADrawObject.SCRX[1], ADrawObject.SCRY[1], ACanvas);
  vxCanvasRenderText(ACanvas, ADrawObject.SCRX[1], ADrawObject.SCRY[1], 'L1', ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
  if ADrawObject.GetCount > 3 then
  begin
    DrawRulerLine(ADrawObject, ADrawObject.SCRX[2], ADrawObject.SCRY[2], ADrawObject.SCRX[3], ADrawObject.SCRY[3], ACanvas);
    vxCanvasRenderText(ACanvas, ADrawObject.SCRX[2], ADrawObject.SCRY[2], 'L2', ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
  end;

end;

procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer; ACanvas: TVxCanvas);
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

  DrawLineS32(ACanvas, x1 + xa, y1 + ya, x1 + xb, y1 + yb, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x2 + xa, y2 + ya, x2 + xb, y2 + yb, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x1, y1, x2, y2, ADrawObject.PenColor);

  //if ADrawObject.PenColor = clWhite then
  begin
    DrawLineS32(ACanvas, x1 + xa, y1 + ya, x1 + xb, y1 + yb, ADrawObject.PenColor);

    DrawLineS32(ACanvas, x2 + xa, y2 + ya, x2 + xb, y2 + yb, ADrawObject.PenColor);

    DrawLineS32(ACanvas, x1, y1, x2, y2, ADrawObject.PenColor);
  end;
end;

procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  i, k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    //    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[1], scrY[1], vgColorFromVCL(ADrawObject.PenColor));
    for i := 1 to k - 1 do
      DrawLineS32(ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
  end;
end;

procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
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
    //    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[1], scrY[1], vgColorFromVCL(ADrawObject.PenColor));

    for i := 1 to k - 1 do
      DrawLineS32(ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
    DrawLineS32(ACanvas, ADrawObject.scrX[k - 1], ADrawObject.scrY[k - 1], ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.PenColor);

    ACanvas.Font.Assign(ADrawObject.Font);
    vxCanvasRenderText(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], 'A', ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
    vxCanvasRenderText(ACanvas, ADrawObject.scrX[k - 1], ADrawObject.scrY[k - 1], 'B', ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
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

procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  X: integer;
  x1, x2, y1, y2: Integer;
begin
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];

  x := Max(x1, x2);
  DrawLineS32(ACanvas, x + 10, y1, x + 20, y1, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x + 10, y2, x + 20, y2, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x + 15, y1, x + 15, y2, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x + 15 - 4, y1 - 4, x + 15 + 4, y1 + 4, ADrawObject.PenColor);
  DrawLineS32(ACanvas, x + 15 - 4, y2 - 4, x + 15 + 4, y2 + 4, ADrawObject.PenColor);
end;

procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  y: integer;
  x1, x2, y1, y2: Integer;
begin
  x1 := ADrawObject.SCRX[0];
  y1 := ADrawObject.SCRY[0];
  x2 := ADrawObject.SCRX[1];
  y2 := ADrawObject.SCRY[1];
  y := Max(y1, y2);
  DrawLineS32(ACanvas, x1, y + 10, x1, y + 20, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x2, y + 10, x2, y + 20, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x1, y + 15, x2, y + 15, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x1 - 4, y + 15 - 4, x1 + 4, y + 15 + 4, ADrawObject.PenColor);

  DrawLineS32(ACanvas, x2 - 4, y + 15 - 4, x2 + 4, y + 15 + 4, ADrawObject.PenColor);
end;

procedure DrawRotateGrip(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  i, k: integer;
begin
  if ADrawObject.Kind in [ldmiROI_Cycle, ldmiSolidRect, ldmiROI_Rect, ldmiPerpendicularityLine] then
    exit;
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[0] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[0] + 4, vgColorFromVCL(ADrawObject.PenColor));
    vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[k - 1] - 4, ADrawObject.scrY[k - 1] - 4, ADrawObject.scrX[k - 1] + 4, ADrawObject.scrY[k - 1] + 4,
      vgColorFromVCL(ADrawObject.PenColor));

    for i := 1 to k - 2 do
    begin
      vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[i] - 4, ADrawObject.scrY[i] - 4, ADrawObject.scrX[i] + 4, ADrawObject.scrY[i] + 4, vgColorFromVCL(ADrawObject.PenColor));
    end;

    if ADrawObject.Kind in [ldmiCycle, ldmiRect, ldmiReferenceLine, ldmiSelectRect, ldmiText] then
    begin
      vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[0] - 4, ADrawObject.scrY[1] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[1] + 4, vgColorFromVCL(ADrawObject.PenColor));
      vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[1] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[1] + 4, ADrawObject.scrY[0] + 4, vgColorFromVCL(ADrawObject.PenColor));
    end;
    if ADrawObject.Kind in [ldmiText] then
    begin
      DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.PenColor);
      DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.PenColor);
      DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
      DrawLineS32(ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
    end;
  end;
end;

procedure DrawSelectGrip(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  i, k: integer;
begin
  if ADrawObject.Kind in [ldmiROI_Cycle, ldmiSolidRect, ldmiROI_Rect, ldmiPerpendicularityLine] then
    exit;
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[0] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[0] + 4, vgColorFromVCL(ADrawObject.PenColor));
    vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[k - 1] - 4, ADrawObject.scrY[k - 1] - 4, ADrawObject.scrX[k - 1] + 4, ADrawObject.scrY[k - 1] + 4,
      vgColorFromVCL(ADrawObject.PenColor));

    for i := 1 to k - 2 do
    begin
      vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[i] - 4, ADrawObject.scrY[i] - 4, ADrawObject.scrX[i] + 4, ADrawObject.scrY[i] + 4, vgColorFromVCL(ADrawObject.PenColor));
    end;

    if ADrawObject.Kind in [ldmiCycle, ldmiRect, ldmiReferenceLine, ldmiSelectRect, ldmiText] then
    begin
      vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[0] - 4, ADrawObject.scrY[1] - 4, ADrawObject.scrX[0] + 4, ADrawObject.scrY[1] + 4, vgColorFromVCL(ADrawObject.PenColor));
      vxCanvasFrameRectS(ACanvas, ADrawObject.scrX[1] - 4, ADrawObject.scrY[0] - 4, ADrawObject.scrX[1] + 4, ADrawObject.scrY[0] + 4, vgColorFromVCL(ADrawObject.PenColor));
    end;
    if ADrawObject.Kind in [ldmiText] then
    begin
      DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.PenColor);
      DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.PenColor);
      DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
      DrawLineS32(ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
    end;
  end;
end;

procedure DrawCycleROI(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.DrawEllipse(vgRect(ADrawObject.scrX[0], ADrawObject.scrY[0],
      ADrawObject.scrX[1], ADrawObject.scrY[1]), 1);
  end;
end;

procedure DrawCycle(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    ACanvas.DrawEllipse(vgRect(ADrawObject.scrX[0], ADrawObject.scrY[0],
      ADrawObject.scrX[1], ADrawObject.scrY[1]), 1);
  end;
end;

procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  k: integer;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.PenColor);
    DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.PenColor);
    DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
    DrawLineS32(ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
  end;
end;

procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  k: integer;
  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.PenColor);
    DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.PenColor);
    DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[1], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);
    DrawLineS32(ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);

    //Acanvas.Font.Assign(ADrawObject.Font);

    str1 := Format('W %f,H %f,W/H%4.2f', [abs(ADrawObject.X[0] - ADrawObject.X[1]) * ADrawObject.Parent.OwnImageData.PixelSpacingX,
      abs(ADrawObject.Y[0] - ADrawObject.Y[1]) * ADrawObject.Parent.OwnImageData.PixelSpacingY,
        abs(ADrawObject.X[0] - ADrawObject.X[1]) / abs(ADrawObject.Y[0] - ADrawObject.Y[1])]);
    vxCanvasRenderText(ACanvas, Min(ADrawObject.scrX[0], ADrawObject.scrX[1]),
      Min(ADrawObject.scrY[0], ADrawObject.scrY[1]), str1,
      ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
  end;
end;

procedure DrawPerpendicularityLine(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  k: integer;
  //  str1: AnsiString;
begin
  k := ADrawObject.GetCount;
  if k = 1 then
  begin
    DrawLineS32(ACanvas, 0, ADrawObject.scrY[0] - 1, Acanvas.Width, ADrawObject.scrY[0] - 1, clRed);
    DrawLineS32(ACanvas, 0, ADrawObject.scrY[0], Acanvas.Width, ADrawObject.scrY[0], clRed);
    //    DrawLineS32(ACanvas,0, scrY[0] + 1, Acanvas.Width, scrY[0] + 1, clRed);

    DrawLineS32(ACanvas, ADrawObject.scrX[0], 0, ADrawObject.scrX[0], ACanvas.Height, clBlue);

    DrawLineS32(ACanvas, ADrawObject.scrX[0] - 20, ADrawObject.scrY[0] - 20, ADrawObject.scrX[0] + 20, ADrawObject.scrY[0] - 20, clRed);
    DrawLineS32(ACanvas, ADrawObject.scrX[0] - 20, ADrawObject.scrY[0] - 20, ADrawObject.scrX[0] - 20, ADrawObject.scrY[0] + 20, clRed);
    DrawLineS32(ACanvas, ADrawObject.scrX[0] - 20, ADrawObject.scrY[0] + 20, ADrawObject.scrX[0] + 20, ADrawObject.scrY[0] + 20, clRed);
    DrawLineS32(ACanvas, ADrawObject.scrX[0] + 20, ADrawObject.scrY[0] - 20, ADrawObject.scrX[0] + 20, ADrawObject.scrY[0] + 20, clRed);

  end;
end;

procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas; AFontSize: Integer);
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

    DrawLineS32Ref(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.PenColor);

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
      vxCanvasRenderText(Acanvas, x1, y1, ADrawObject.UserText, 0, clRed);
    end
    else
    begin
      x1 := ADrawObject.scrX[0];
      y1 := ADrawObject.scrY[0];
      if (ADrawObject.scrX[1] - ADrawObject.scrX[0]) < (ADrawObject.scrY[1] - ADrawObject.scrY[0]) then
        x1 := x1 - 10
      else
        y1 := y1 - 10;

      vxCanvasRenderText(Acanvas, x1, y1, ADrawObject.UserText, 0, clRed);
    end;
    //    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[0], scrY[1], ADrawObject.PenColor);
    //    DrawLineS32(ACanvas,scrX[0], scrY[1], scrX[1], scrY[1], ADrawObject.PenColor);
    //    DrawLineS32(ACanvas,scrX[1], scrY[0], scrX[1], scrY[1], ADrawObject.PenColor);

  end;
end;

procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
var
  k: integer;
  f1: Double;

  R: TvxRect;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    {    DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[1], scrY[0], ADrawObject.PenColor);
        DrawLineS32(ACanvas,scrX[0], scrY[0], scrX[0], scrY[1], ADrawObject.PenColor);
        DrawLineS32(ACanvas,scrX[0], scrY[1], scrX[1], scrY[1], ADrawObject.PenColor);
        DrawLineS32(ACanvas,scrX[1], scrY[0], scrX[1], scrY[1], ADrawObject.PenColor);
    }
    Acanvas.Font.Assign(ADrawObject.Font);

    vxCanvasRenderText(ACanvas, Min(ADrawObject.scrX[0], ADrawObject.scrX[1]),
      Min(ADrawObject.scrY[0], ADrawObject.scrY[1]), ADrawObject.UserText
      , abs(ADrawObject.scrY[0] - ADrawObject.scrY[1]), ADrawObject.Parent.OwnImageData.LabelFontColor);
  end;
end;

procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas; ARect: TvxRect);
var
  p1: TPoint;
  sh, sw: Single;
  i: Integer;
  strs: TStringList;
  str1: AnsiString;
begin
  //ACanvas.Font.Assign(Font);
  p1.X := ADrawObject.fViewCood.XBmp2Scr((ADrawObject.ObjectRect.Right + ADrawObject.ObjectRect.Left) div 2);
  p1.y := ADrawObject.fViewCood.YBmp2Scr((ADrawObject.ObjectRect.Bottom + ADrawObject.ObjectRect.Top) div 2);

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
      vxCanvasRenderText(Acanvas, ARect.Right / 3, ARect.Bottom - (ADrawObject.TextIndex + 2) * (sh + 2),
        IntToStr(ADrawObject.TextIndex) + ':' + str1, 0, ADrawObject.Font.Color);
    end
    else
    begin
      vxCanvasRenderText(Acanvas, ARect.Right / 3, (-ADrawObject.TextIndex) * (sh + 2),
        IntToStr(abs(ADrawObject.TextIndex)) + ':' + str1, 0, ADrawObject.Font.Color);
    end;
  finally
    strs.Free;
  end;
end;

procedure DrawLCA_RCA(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
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
      DrawLineS32(ACanvas, Trunc(line1.P0.x), Trunc(line1.P0.y),
        Trunc(line1.P1.x), Trunc(line1.P1.y), clRed);
    end;
  end;
begin
  if ADrawObject.PloyID < 0 then
  begin
    k := ADrawObject.GetCount;
    if k > 1 then
    begin
      for i := 1 to k - 1 do
        DrawLineS32(ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1],
          ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
    end;
  end
  else
  begin
    k := ADrawObject.GetCount;
    for i := 1 to ADrawObject.PloyID do
      DrawLineS32(ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1],
        ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
    if k > ADrawObject.PloyID + 3 then
    begin
      for i := ADrawObject.PloyID + 2 to k - 1 do
        DrawLineS32(ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1],
          ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
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

procedure DrawVentricular(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
begin

end;

procedure DrawVitexObject(ADrawObject: TDicomDrawObject; ACanvas: TVxCanvas);
begin
  if assigned(ADrawObject.VitexObject) then
  begin
    //ADrawObject.VitexObject.DrawTo(Acanvas);
  end;
end;

procedure DrawQuantitativeCoronaryAnaliysis(ADrawObject: TDicomDrawObject;
  ACanvas: TVxCanvas);
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
  h1, w1, y1: Single;
begin
  k := ADrawObject.GetCount;
  if k > 1 then
  begin
    for i := 1 to k - 1 do
      if (i mod 2) = 1 then
      begin
        DrawLineS32(ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1],
          ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);

        Acanvas.Fill.SolidColor := vgColorFromVCL(clRed);

        case i div 2 of
          0:
            begin
              Procimal := GetTheLength(ADrawObject.X[i - 1], ADrawObject.Y[i - 1], ADrawObject.X[i], ADrawObject.Y[i]);
            end;
          1:
            begin
              StenosisBegin := GetTheLength(ADrawObject.X[i - 1], ADrawObject.Y[i - 1], ADrawObject.X[i], ADrawObject.Y[i]);
            end;
          2:
            begin
              MinimumDiameter := GetTheLength(ADrawObject.X[i - 1], ADrawObject.Y[i - 1], ADrawObject.X[i], ADrawObject.Y[i]);
              StenosisDiameter := MinimumDiameter;
            end;
          3:
            begin
              StenosisEnd := GetTheLength(ADrawObject.X[i - 1], ADrawObject.Y[i - 1], ADrawObject.X[i], ADrawObject.Y[i]);
              StenosisLength := GetTheLength(ADrawObject.X[2], ADrawObject.Y[2], ADrawObject.X[6], ADrawObject.Y[6]);
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

              vxCanvasRenderText(ACanvas, w1, y1, Format('Distal : %5.2f', [Distal]), ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
              vxCanvasRenderText(ACanvas, w1, y1 + h1, Format('Procimal : %5.2f', [Procimal]), ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
              vxCanvasRenderText(ACanvas, w1, y1 + h1 * 2, Format('Stenosis Begin : %5.2f', [StenosisBegin]), ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
              vxCanvasRenderText(ACanvas, w1, y1 + h1 * 3, Format('Minimum Diameter : %5.2f', [MinimumDiameter]), ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
              vxCanvasRenderText(ACanvas, w1, y1 + h1 * 4, Format('Stenosis End : %5.2f', [StenosisEnd]), ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);

              vxCanvasRenderText(ACanvas, w1, y1 + h1 * 5, Format('Stenosis Percent: %5.2f %%',
                [StenosisPercent]), ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
              vxCanvasRenderText(ACanvas, w1, y1 + h1 * 6, Format('Stenosis Diameter: %5.2f ',
                [StenosisDiameter]), ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
              vxCanvasRenderText(ACanvas, w1, y1 + h1 * 7, Format('Idea Diameter: %5.2f',
                [IdeaDiameter]), ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);
              vxCanvasRenderText(ACanvas, w1, y1 + h1 * 8, Format('Steno sisLength: %5.2f ',
                [StenosisLength]), ADrawObject.Parent.OwnImageData.FontSpacing, ADrawObject.Parent.OwnImageData.LabelFontColor);

              DrawLineS32(ACanvas, ADrawObject.scrX[0], ADrawObject.scrY[0], ADrawObject.scrX[2], ADrawObject.scrY[2], clYellow);
              DrawLineS32(ACanvas, ADrawObject.scrX[2], ADrawObject.scrY[2], ADrawObject.scrX[4], ADrawObject.scrY[4], clYellow);
              DrawLineS32(ACanvas, ADrawObject.scrX[4], ADrawObject.scrY[4], ADrawObject.scrX[6], ADrawObject.scrY[6], clYellow);
              DrawLineS32(ACanvas, ADrawObject.scrX[6], ADrawObject.scrY[6], ADrawObject.scrX[8], ADrawObject.scrY[8], clYellow);

              DrawLineS32(ACanvas, ADrawObject.scrX[1], ADrawObject.scrY[1], ADrawObject.scrX[3], ADrawObject.scrY[3], clYellow);
              DrawLineS32(ACanvas, ADrawObject.scrX[3], ADrawObject.scrY[3], ADrawObject.scrX[5], ADrawObject.scrY[5], clYellow);
              DrawLineS32(ACanvas, ADrawObject.scrX[5], ADrawObject.scrY[5], ADrawObject.scrX[7], ADrawObject.scrY[7], clYellow);
              DrawLineS32(ACanvas, ADrawObject.scrX[7], ADrawObject.scrY[7], ADrawObject.scrX[9], ADrawObject.scrY[9], clYellow);
            end;
        end;
      end;
  end;
end;

procedure DrawSolidRect(ADrawObject: TDicomDrawObject; ACanvas: TvxCanvas);
begin

end;

end.

