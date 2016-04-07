unit DCM_ImageData_vgBitmap;

interface
{$I DicomPack.inc}

uses
  {$IFDEF LINUX}Types, Libc, QControls, Qgraphics, {$ELSE}
  Windows, Messages, Forms, Controls, graphics, {$ENDIF}
  SysUtils, Classes, {$IFDEF DICOMDEBUX1}DbugIntf, {$ENDIF}
  CnsMsg, DCM_Dict, DCM_UID, DcmImageConvert, Dialogs,
  DCM_Attributes, dcm_scene, dcm_vgcore, DCM_Templates, math;

//TDicomDrawObject
procedure DrawLineS32(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap; x1, y1, x2, y2: Integer;
  APenColor: TColor);
procedure DrawLineS32Ref(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap; x1, y1, x2, y2: Integer;
  APenColor: TColor);

procedure DrawLCA_RCA(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawQuantitativeCoronaryAnaliysis(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawVentricular(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer; ACanvas: TdxBitmap);
procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawSelectGrip(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawRotateGrip(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawCycleROI(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawVitexObject(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawSolidRect(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawCycle(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap; AFontSize: Integer);
procedure DrawPerpendicularityLine(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);

procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap; AFontSize: Integer);
procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap; ARect: TRect);

//TDicomDrawObjects
procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TdxBitmap; ARect: TRect; ADisplayCalcText: Boolean;
  ACurrentFrameIndex, AFontSize: Integer);

//TDicomImage
procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);

procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);

procedure DrawImagePosition(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect);
procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ARight, ABottom: Boolean);
procedure myTextOut(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; AMode: TDisplayArea; ARow: Integer; AText: AnsiString);

procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TdxBitmap);
function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TdxBitmap; WithLabel: Boolean = true): Boolean;

procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Buffer: TdxCanvas; ARect: TvxRect; Zoom: Single = 1; AXOff: Integer =
  0; AYOff: Integer = 0);

implementation

procedure vxCanvasTextOut(Canvas: TdxCanvas; X, Y: Single; AText: string);
begin
  Canvas.DrawText(X, Y, AText,1);
end;

function AssignToBitmap(ADicomImage: TDicomImage; ABitmapEx: TdxBitmap; WithLabel: Boolean = true): Boolean;
var
  I1, I2, x1, y1: Integer;
  //  DestScanLine: PColor32Array;
  prgb1: pRGB;
  d1, d2: TDicomImageData;
  np1, np2, np3: PByte;
  ABitmap: TdxBitmap;
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

    //ABitmapEx.Canvas.Font..SolidColor := vgColorFromVCL(clRed);
    ABitmapEx.Canvas.Font.Size := 40;
    vxCanvasTextOut(ABitmapEx.Canvas, 0, ABitmapEx.Height div 2, 'No Image Data');

    exit;
  end;
  if d1.Data = nil then
  begin
    ABitmapEx.SetSize(512, 512);
    //ABitmapEx.Canvas.Fill.SolidColor := vgColorFromVCL(clRed);
    ABitmapEx.Canvas.Font.Size := 40;
    vxCanvasTextOut(ABitmapEx.Canvas, 0, ABitmapEx.Height div 2, 'No Image Data');
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
    ABitmap := ABitmapEx; //todo TdxBitmap.Create(0, 0);
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
        vImageConvert_Planar8toPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        vImageConvert_Planar8toPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
      end
      else
        vImageConvert_Planar8toPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
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
          vImageConvert_PlanarFtoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
          else
            vImageConvert_Planar16StoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end;
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];

        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100)
          else
            vImageConvert_Planar16StoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
        end;
      end
      else
      begin
        if ADicomImage.BufferLength = diblFloat then
        begin
          vImageConvert_PlanarFtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end
        else
        begin
          if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
            vImageConvert_Planar16UtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
          else
            vImageConvert_Planar16StoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
        end;
      end;
    end
    else //32
    begin
      if ADicomImage.DSAMode then
      begin
        d2 := ADicomImage.ImageData[ADicomImage.DSADefaultFrame];
        if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          vImageConvert_Planar32UtoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
        else
          vImageConvert_Planar32StoPlanarARGB_DSA(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end
      else
        if ADicomImage.MergeMode then
      begin
        d2 := ADicomImage.MergeDataset.ImageData.ImageData[0];
        if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          vImageConvert_Planar32UtoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100)
        else
          vImageConvert_Planar32StoPlanarARGB_Merge(d1.Data, d2.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn, ADicomImage.MergeFactor / 100);
      end
      else
      begin
        if ADicomImage.PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          vImageConvert_Planar32UtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn)
        else
          vImageConvert_Planar32StoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      end;
    end;
  end
  else
  begin
    case ADicomImage.PlanarConfiguration of
      0:
        vImageConvert_PlanarRGBtoPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      1:
        vImageConvert_PlanarRGB_PlanarConfiguration1_toPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
      2:
        vImageConvert_PlanarRGB_PlanarConfiguration2_toPlanarARGB(d1.Data, ADicomImage.width, ADicomImage.height, ABitmap.Bits, ADicomImage.width, ADicomImage.height, max16, min16, ADicomImage.CustomPalette, nn);
    end;
  end;

  if (ADicomImage.AspectRatio <> 1) or (ADicomImage.ImageAngle > 0) then
  begin
    //todo jiawen

  end;
  {$IFDEF FOR_TRIAL_VERSION}
  if (PacsSoftwareName <> '') or (UserHospitalName <> '') then
  begin
    ABitmapEx.Canvas.Fill.SolidColor := vgColorFromVCL(clGreen);

    ABitmapEx.Font.Size := Round(ABitmapEx.Width * 3 / Length(PacsSoftwareName));
    l0 := ABitmapEx.Canvas.TextWidth(PacsSoftwareName);
    l1 := ABitmapEx.Canvas.TextWidth(UserHospitalName);
    l2 := ABitmapEx.Canvas.TextHeight(UserHospitalName);

    vxCanvasTextOut(ABitmapEx.Canvas, (ABitmapEx.Width - l0) / 2, (ABitmapEx.Height) / 2 - l2 - 10,
      PacsSoftwareName);
    vxCanvasTextOut(ABitmapEx.Canvas, (ABitmapEx.Width - l1) / 2, (ABitmapEx.Height) / 2, UserHospitalName);

    ABitmapEx.Canvas.Fill.SolidColor := vgColorFromVCL(clRed);
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

    vxCanvasTextOut(ABitmapEx.Canvas, (ABitmapEx.Width - ABitmapEx.Canvas.TextWidth(UserHospitalName)) / 2, 2,
      UserHospitalName);
  end;
  {$ENDIF}
  if ADicomImage.Attributes.getInteger($2811, $20D) = 1 then
  begin
    x1 := ADicomImage.Attributes.getInteger($2811, $20E);
    y1 := ADicomImage.Attributes.getInteger($2811, $20F);
    if (x1 <> 0) and (y1 <> 0) then
    begin
      //todo
      //ABitmapEx.Canvas.FillRect(x1 - 20, y1 - 20, x1 + 20, y1 + 20, clRed32);
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

procedure myTextOut(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; AMode: TDisplayArea; ARow: Integer; AText: AnsiString);
var
  hh, ww, xx, yy: Single;
  str1: AnsiString;
begin
  if AText <> '' then
  begin
    str1 := FilterISO1022(AText);

    Dest.Font.Assign(ADicomImage.Font);
    Dest.Font.Size := ADicomImage.FontSpacing;
    //hh := Dest.TextHeight(str1);
    //ww := Dest.TextWidth(str1);
    case AMode of //
      daLeftTop:
        begin //left top
          xx := ARect.Left + 6;
          yy := ARect.Top + hh * (ARow - 1);
        end;
      daLeftBottom:
        begin //left bottom
          xx := ARect.Left + 6;
          yy := ARect.Bottom - hh * (ARow + 1);
        end;
      daRightTop:
        begin //right top
          xx := ARect.Right - ww - 6;
          yy := ARect.Top + hh * (ARow - 1);
        end;
      daRightBottom:
        begin //right t
          xx := ARect.Right - ww - 6;
          yy := ARect.Bottom - hh * (ARow + 1);
        end;
    end; // case
    if ADicomImage.LabelFontColor = clBlack then
    begin
      if ADicomImage.FontSpacing < 8 then
      begin
       // Dest.Fill.SolidColor := vgColorFromVCL(clWhite);
        vxCanvasTextOut(Dest, xx, yy, str1);
      end
      else
      begin
        //Dest.Font.Name := 'ËÎÌå';
        //Dest.Fill.SolidColor := clBlack;
        //vxCanvasTextOut(Dest, (xx), (yy), str1);
        //Dest.Fill.SolidColor := vgColorFromVCL(clWhite);
        vxCanvasTextOut(Dest, xx + 1, yy + 1, str1);
      end;
    end
    else
    begin
      if ADicomImage.FontSpacing < 8 then
      begin
        //Dest.Fill.SolidColor := vgColorFromVCL(ADicomImage.LabelFontColor);
        vxCanvasTextOut(Dest, xx, yy, str1);
        //vxCanvasTextOut(Dest, (xx + 1), (yy + 1), str1, 0, clWhite32);
      end
      else
      begin
        //Dest.Fill.SolidColor := vgColorFromVCL(ADicomImage.LabelFontColor);
        vxCanvasTextOut(Dest, xx, yy, str1);
      end;
    end
  end;
end;

procedure OverlayLabels(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
var
  str1, str2: AnsiString;
  //  k: integer;
  f1: Double;
begin
  ADicomImage.CalFontSpacing(Dest.Width, Dest.Height);

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

procedure LoadUserDrawObjectToBitmap(ADicomImage: TDicomImage; Buffer: TdxCanvas; ARect: TvxRect; Zoom: Single = 1; AXOff: Integer =
  0; AYOff: Integer = 0);
begin
  if not assigned(ADicomImage.Attributes) then
    exit;
  {  ADicomImage.UpdateCood(Rect(AXOff, AYOff, ADicomImage.width, ADicomImage.Height), Rect(0, 0, ADicomImage.width, ADicomImage.Height), Zoom,
      ADicomImage.PixelSpacingX, ADicomImage.PixelSpacingY);
    DrawAll(ADicomImage.DrawObjects, buffer, Rect(0, 0, ADicomImage.width, ADicomImage.Height), false, -1, ADicomImage.CalFontSpacing(Buffer.Width, Buffer.Height));
  }
end;

procedure DrawOverlayTo(ADicomImage: TDicomImage; Dest: TdxBitmap);
begin

end;

procedure DisplayCommonList(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
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

procedure DisplayCommonListSI(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
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

procedure DisplayCommonListGE(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
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

procedure DisplayCommonListSIMR(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
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
    str1 := '¡û¡ú'
  else
    if str1 = 'COL' then
    str1 := '¡ü¡ý';
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

procedure DisplayCommonListGEMR(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
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

procedure DrawInformationLabels(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ADisplayWLLabel: Boolean);
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

procedure DrawImagePosition(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect);
begin

end;

procedure DrawImageScale(ADicomImage: TDicomImage; Dest: TdxCanvas; ARect: TvxRect; ARight, ABottom: Boolean);
begin

end;

procedure DrawAngle(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawArrow(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawCross(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawCross1(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawCycle(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawCycleROI(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawLCA_RCA(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
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
        DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
    end;
  end
  else
  begin
    k := ADrawObject.GetCount;
    for i := 1 to ADrawObject.PloyID do
      DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
    if k > ADrawObject.PloyID + 3 then
    begin
      for i := ADrawObject.PloyID + 2 to k - 1 do
        DrawLineS32(ADrawObject, ACanvas, ADrawObject.scrX[i - 1], ADrawObject.scrY[i - 1], ADrawObject.scrX[i], ADrawObject.scrY[i], ADrawObject.PenColor);
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

procedure DrawLineS32(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap; x1, y1, x2,
  y2: Integer; APenColor: TColor);
begin

end;

procedure DrawLineS32Ref(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap; x1, y1, x2,
  y2: Integer; APenColor: TColor);
begin

end;

procedure DrawPerpendicularityLine(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawPolygon(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawPolyLine(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawQuantitativeCoronaryAnaliysis(ADrawObject: TDicomDrawObject;
  ACanvas: TdxBitmap);
begin

end;

procedure DrawRect(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawRectROI(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
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

      DrawLineS32(ACanvas,x1 + w, y1 + h, x2 + w, y2 + h, fPenColor32);}
      //    DrawLineS32(ACanvas,scrX[0] + w, scrY[0] + h, scrX[1] + w, scrY[1] + h, fPenColor32);
  end;
end;

procedure DrawRectText(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawReferenceLine(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap;
  AFontSize: Integer);
begin

end;

procedure DrawRotateGrip(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawRuler(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawRulerCalc(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawRulerHiz(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawRulerLine(ADrawObject: TDicomDrawObject; x1, y1, x2, y2: Integer;
  ACanvas: TdxBitmap);
begin

end;

procedure DrawRulerVer(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawSelectGrip(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawSolidRect(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawText(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap; ARect: TRect);
begin

end;

procedure DrawTo(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap; AFontSize: Integer);
begin

end;

procedure DrawVentricular(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawVitexObject(ADrawObject: TDicomDrawObject; ACanvas: TdxBitmap);
begin

end;

procedure DrawAll(ADrawObjects: TDicomDrawObjects; ACanvas: TdxBitmap; ARect: TRect; ADisplayCalcText: Boolean;
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
  {  if assigned(ADrawObjects.NewDrawObject) then
      if (ADrawObjects.NewDrawObject.RelateFrameIndex = ACurrentFrameIndex) or (ACurrentFrameIndex = -1) then
        ADrawObjects.NewDrawObject.DrawSelectGrip(ACanvas);}
end;

end.

