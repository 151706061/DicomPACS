unit DCM_ImageData_Texture;

interface
{$I DicomPack.inc}
uses
  {$IFDEF LINUX}Types, Libc, QControls, Qgraphics, {$ELSE}
  Windows, Messages, Forms, Controls, graphics, {$ENDIF}
  SysUtils, Classes, {$IFDEF DICOMDEBUX1}DbugIntf, {$ENDIF}
  CnsMsg, DCM_Dict, DCM_UID, DcmImageConvert, gl, glu, DCM_MemTable;

type

  TTextureData = class

  public
    Width: Integer;
    Height: Integer;
    SamplePerPixel: Integer;

    Texture: GluInt;
    aType: Cardinal;

    constructor Create;
    destructor Destroy; override;

  end;

  TTexturePointerData = class

  public
    Width: Integer;
    Height: Integer;
    SamplePerPixel: Integer;

    Texture: Pointer;
    aType: Cardinal;

    constructor Create;
    destructor Destroy; override;

  end;

implementation

constructor TTexturePointerData.Create;
begin
  Width := 0;
  Height := 0;
  SamplePerPixel := 0;

  Texture := nil;
  aType := 0;
end;

destructor TTexturePointerData.Destroy;
begin
  if Texture <> nil then
    Freemem(Texture);
end;

constructor TTextureData.Create;
begin
  Width := 0;
  Height := 0;
  SamplePerPixel := 0;

  Texture := 0;
  aType := 0;
end;

destructor TTextureData.Destroy;
begin
  if Texture <> 0 then
    glDeleteTextures(1, Texture);
end;

(*
function TDicomImage.CreateTexture(Format: Word; TextureData: TTextureData): Integer;
var
  w1, h1: Integer;
  Texture: GLuint;

  I1, I2, x1, y1, iii: Integer;
  pData: Pointer;
  DestScanLine: PColor32Array;
  prgb1: pRGB;
  d1: TDicomImageData;
  np1, np2, np3, pb1: PByte;
  {$IFDEF FOR_TRIAL_VERSION}
  l0, l1, l2: Integer;
  {$ENDIF}
  lCen, lWid: integer;
  nn: Boolean;
  lRange, lSz, min16, max16: integer;
  lScaleShl10: Single;

  function MyColor32(r1, g1, b1: Byte): TColor32;
  var
    r2, g2, b2: Integer;
    n1: TDicomImagePalette;
  begin
    if r1 < min16 then
      r2 := 0
    else
      if r1 > max16 then
      r2 := 255
    else
      r2 := trunc(((r1) - min16) * lScaleShl10);

    if b1 < min16 then
      b2 := 0
    else
      if b1 > max16 then
      b2 := 255
    else
      b2 := trunc(((b1) - min16) * lScaleShl10);

    if g1 < min16 then
      g2 := 0
    else
      if g1 > max16 then
      g2 := 255
    else
      g2 := trunc(((g1) - min16) * lScaleShl10);
    //r2 := flookupTableForWL[r1 + fLookupTableLength_1];
    //g2 := flookupTableForWL[g1 + fLookupTableLength_1];
    //b2 := flookupTableForWL[b1 + fLookupTableLength_1];
    if nn then
    begin
      r2 := $FF - r2;
      g2 := $FF - g2;
      b2 := $FF - b2;
    end;
    if IsCustomPalette then
    begin
      n1 := GetPalette(i2, i1);
      if n1 = nil then
        Result := color32(r2, g2, b2)
      else
        Result := color32(n1.FRedTable[r2], n1.FGreenTable[g2], n1.FBlueTable[b2]);
    end
    else
    begin
      Result := Color32(r2, g2, b2);
    end;
    //Result := Color32(r2, g2, b2);
  end;
  {$IFDEF FOR_TRIAL_VERSION}
  function IsIDERuning: Boolean;
  begin
    Result := (FindWindow('TAppBuilder', nil) <> 0) or
      (FindWindow('TPropertyInspector', nil) <> 0) or
      (FindWindow('TAlignPalette', nil) <> 0);
  end;
  {$ENDIF}

begin
  Result := -1;
  //textureTarget := GL_TEXTURE_2D;
  //imageType := GL_UNSIGNED_BYTE;

  //  imageFormat := (samplesPerPixel = = 1)? GL_LUMINANCE: GL_RGB;
  //  internalFormat := (samplesPerPixel = = 1)? GL_LUMINANCE: GL_RGB;

  {$IFDEF FOR_TRIAL_VERSION}
  if not IsIDERuning then
  begin
    ShowMessage('You are use trial dicomvcl. Please open http://www.dicomvcl.com.');
    //Application.Terminate;
  end;
  //ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
  {$ENDIF}

  d1 := ImageData[FBaseFrameIndex + CurrentFrame];
  if not assigned(d1) then
  begin
    //ABitmapEx.SetSize(512, 512);
    //ABitmapEx.Font.Size := 40;
    //ABitmapEx.Font.Color := clRed;
    //ABitmapEx.Textout(0, ABitmapEx.Height div 2, 'No Image Data');
    exit;
  end;
  if d1.Data = nil then
  begin
    //ABitmapEx.SetSize(512, 512);
    //ABitmapEx.Font.Size := 40;
    //ABitmapEx.Font.Color := clRed;
    //ABitmapEx.Textout(0, ABitmapEx.Height div 2, 'No Image Data or decompress fail');
    exit;
  end;
  if not DecompressData(FBaseFrameIndex + CurrentFrame) then
    exit;
  if fRotate1 in [1, 3] then
  begin
    w1 := Height;
    h1 := Width;
  end
  else
  begin
    w1 := Width;
    h1 := Height;
  end;

  w1 := 1 shl ceil(log2(w1));
  h1 := 1 shl ceil(log2(h1));

  if (Copy(PhotometricInterpretation, 1, 4) = 'MONO') then
  begin
    if (Bits > 8) then
    begin
      if fDSAMode then
      begin
        if PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          Result := Scale16to8bitDSAWordTexture(w1, h1, TextureData)
        else
          Result := Scale16to8bitDSATexture(w1, h1, TextureData);
      end
      else
        if fMergeMode then
      begin
        if PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          Result := Merge16to8bitWordTexture(w1, h1, TextureData)
        else
          Result := Merge16to8bitTexture(w1, h1, TextureData);
      end
      else
      begin
        if PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          Result := Scale16to8bitWordTexture(w1, h1, TextureData)
        else
          Result := Scale16to8bitTexture(w1, h1, TextureData)
      end;
    end
    else
    begin
      if fDSAMode then
        Result := Scale8to8bitDSATexture(w1, h1, TextureData)
      else
        Result := Scale8to8bitTexture(w1, h1, TextureData);
    end;
  end
  else
  begin
    GetMem(pData, w1 * h1 * 4);

    if FWindowWidth = 0 then
    begin
      FWindowWidth := (d1.MaxValue - d1.MinValue);
      FWindowCenter := d1.MinValue + FWindowWidth div 2;
    end;

    lCen := FWindowCenter;
    lWid := FWindowWidth div 2;

    min16 := lCen - lWid;
    max16 := lCen + lWid;
    lRange := (max16 - min16);

    if lRange = 0 then
      exit;
    lScaleShl10 := 255 / lRange;
    nn := fNegative xor (PhotometricInterpretation = 'MONOCHROME1');

    if FPlanarConfiguration = 1 then
    begin
      if fRotate1 = 0 then
      begin
        np1 := d1.Data;
        np2 := np1;
        inc(np2, Width * Height);
        np3 := np2;
        inc(np3, Width * Height);
      end
      else
        if fRotate1 = 2 then
      begin
        np3 := d1.Data;
        inc(np3, Width * Height);
        np2 := np3;
        inc(np2, Width * Height);
        np1 := np2;
        inc(np1, Width * Height);
      end;
    end
    else
    begin
      if fRotate1 = 0 then
        prgb1 := d1.Data
      else
        if fRotate1 = 2 then
      begin
        prgb1 := d1.Data;
        inc(prgb1, Width * Height - 1);
      end;
    end;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      if FPlanarConfiguration = 1 then
      begin
        if fRotate1 = 1 then
        begin
          np1 := d1.Data;
          np2 := np1;
          inc(np2, Width * Height);
          np3 := np2;
          inc(np3, Width * Height);

          inc(np1, Width - i1 - 1);
          inc(np2, Width - i1 - 1);
          inc(np3, Width - i1 - 1);
        end
        else
          if fRotate1 = 3 then
        begin
          np1 := d1.Data;
          np2 := np1;
          inc(np2, Width * Height);
          np3 := np2;
          inc(np3, Width * Height);

          inc(np1, (Height - 1) * Width + i1);
          inc(np2, (Height - 1) * Width + i1);
          inc(np3, (Height - 1) * Width + i1);
        end;
      end
      else
      begin
        if fRotate1 = 1 then
        begin
          prgb1 := d1.Data;
          inc(prgb1, Width - i1 - 1);
        end
        else
          if fRotate1 = 3 then
        begin
          prgb1 := d1.Data;
          inc(prgb1, (Height - 1) * Width + i1);
        end;
      end;

      pb1 := pData;
      if fVerFlip1 then
      begin
        //DestScanline := ABitmap.ScanLine[ABitmap.Height - i1 - 1]
        inc(pb1, (h1 - i1 - 1) * w1 * 4);
      end
      else
      begin
        //DestScanline := ABitmap.ScanLine[i1];
        inc(pb1, (i1) * w1 * 4);
      end;
      DestScanline := Pointer(pb1);

      if fHozFlip1 then
      begin
        for I2 := width - 1 downto 0 do
        begin
          if FPlanarConfiguration = 1 then
          begin
            DestScanLine[i2] := MyColor32(np1^, np2^, np3^);
            //DestScanLine[i2].r := np1^;
            //DestScanLine[i2].g := np2^;
            //DestScanLine[i2].b := np3^;
            case fRotate1 of
              0:
                begin
                  inc(np1);
                  inc(np2);
                  inc(np3);
                end;
              1:
                begin
                  inc(np1, width);
                  inc(np2, width);
                  inc(np3, width);
                end;
              2:
                begin
                  dec(np1);
                  dec(np2);
                  dec(np3);
                end;
              3:
                begin
                  dec(np1, width);
                  dec(np2, width);
                  dec(np3, width);
                end;
            end;
          end
          else
          begin

            if FPlanarConfiguration = 2 then
            begin
              //DestScanLine[i2].r := prgb1^.r;
              //DestScanLine[i2].g := prgb1^.g;
              //DestScanLine[i2].b := prgb1^.b;
              DestScanLine[i2] := MyColor32(prgb1^.r, prgb1^.g, prgb1^.b)
            end
            else
            begin
              //DestScanLine[i2].r := prgb1^.b;
              //DestScanLine[i2].g := prgb1^.g;
              //DestScanLine[i2].b := prgb1^.r;
              DestScanLine[i2] := MyColor32(prgb1^.b, prgb1^.g, prgb1^.r);
            end;
            case fRotate1 of
              0: inc(prgb1);
              1: inc(prgb1, width);
              2: dec(prgb1);
              3: dec(prgb1, width);
            end;
          end;
        end;
      end
      else
      begin
        for I2 := 0 to width - 1 do
        begin
          if FPlanarConfiguration = 1 then
          begin
            //DestScanLine[i2].r := np1^;
            //DestScanLine[i2].g := np2^;
            //DestScanLine[i2].b := np3^;
            DestScanLine[i2] := MyColor32(np1^, np2^, np3^);
            case fRotate1 of
              0:
                begin
                  inc(np1);
                  inc(np2);
                  inc(np3);
                end;
              1:
                begin
                  inc(np1, width);
                  inc(np2, width);
                  inc(np3, width);
                end;
              2:
                begin
                  dec(np1);
                  dec(np2);
                  dec(np3);
                end;
              3:
                begin
                  dec(np1, width);
                  dec(np2, width);
                  dec(np3, width);
                end;
            end;
            //                DestScanLine[i2] := prgb1^.b shl 16 + prgb1^.g shl 8 + prgb1^.r
          end
          else
          begin
            if FPlanarConfiguration = 2 then
            begin
              //DestScanLine[i2].r := prgb1^.r;
              //DestScanLine[i2].g := prgb1^.g;
              //DestScanLine[i2].b := prgb1^.b;
              DestScanLine[i2] := MyColor32(prgb1^.r, prgb1^.g, prgb1^.b)
            end
            else
            begin
              //DestScanLine[i2].r := prgb1^.b;
              //DestScanLine[i2].g := prgb1^.g;
              //DestScanLine[i2].b := prgb1^.r;
              DestScanLine[i2] := MyColor32(prgb1^.b, prgb1^.g, prgb1^.r);
            end;

            case fRotate1 of
              0: inc(prgb1);
              1: inc(prgb1, width);
              2: dec(prgb1);
              3: dec(prgb1, width);
            end;
          end;
        end;
      end;
    end; // for

    //build  Texture
    glGenTextures(1, Texture);
    glBindTexture(GL_TEXTURE_2D, Texture);
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    {Texture blends with object background}

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR); { only first two can be used }
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    { all of the above can be used }
    gluBuild2DMipmaps(GL_TEXTURE_2D, 4, W1, H1, GL_RGBA, GL_UNSIGNED_BYTE, pData);
    //gluBuild2DMipmaps(GL_TEXTURE_2D, 3, w1, h1, GL_RGB, GL_UNSIGNED_BYTE, pData);
    FreeMem(pData);

    TextureData.Width := w1;
    TextureData.Height := h1;
    TextureData.SamplePerPixel := 4;
    TextureData.aType := GL_RGBA;
    TextureData.Texture := Texture;

    Result := Texture;
  end;
end;

function TDicomImage.CreateTextureData(Format: Word; TextureData: TTexturePointerData): Integer;
var
  w1, h1: Integer;
  //  Texture: GLuint;

  I1, I2, x1, y1, iii: Integer;
  pData: Pointer;
  DestScanLine: PColor32Array;
  prgb1: pRGB;
  d1: TDicomImageData;
  np1, np2, np3, pb1: PByte;
  {$IFDEF FOR_TRIAL_VERSION}
  l0, l1, l2: Integer;
  {$ENDIF}
  lCen, lWid: integer;
  nn: Boolean;
  lRange, lSz, min16, max16: integer;
  lScaleShl10: Single;

  function MyColor32(r1, g1, b1: Byte): TColor32;
  var
    r2, g2, b2: Integer;
    n1: TDicomImagePalette;
  begin
    if r1 < min16 then
      r2 := 0
    else
      if r1 > max16 then
      r2 := 255
    else
      r2 := trunc(((r1) - min16) * lScaleShl10);

    if b1 < min16 then
      b2 := 0
    else
      if b1 > max16 then
      b2 := 255
    else
      b2 := trunc(((b1) - min16) * lScaleShl10);

    if g1 < min16 then
      g2 := 0
    else
      if g1 > max16 then
      g2 := 255
    else
      g2 := trunc(((g1) - min16) * lScaleShl10);
    //r2 := flookupTableForWL[r1 + fLookupTableLength_1];
    //g2 := flookupTableForWL[g1 + fLookupTableLength_1];
    //b2 := flookupTableForWL[b1 + fLookupTableLength_1];
    if nn then
    begin
      r2 := $FF - r2;
      g2 := $FF - g2;
      b2 := $FF - b2;
    end;
    if IsCustomPalette then
    begin
      n1 := GetPalette(i2, i1);
      if n1 = nil then
        Result := color32(r2, g2, b2)
      else
        Result := color32(n1.FRedTable[r2], n1.FGreenTable[g2], n1.FBlueTable[b2]);
    end
    else
    begin
      Result := Color32(r2, g2, b2);
    end;
    //Result := Color32(r2, g2, b2);
  end;
  {$IFDEF FOR_TRIAL_VERSION}
  function IsIDERuning: Boolean;
  begin
    Result := (FindWindow('TAppBuilder', nil) <> 0) or
      (FindWindow('TPropertyInspector', nil) <> 0) or
      (FindWindow('TAlignPalette', nil) <> 0);
  end;
  {$ENDIF}

begin
  Result := -1;
  //textureTarget := GL_TEXTURE_2D;
  //imageType := GL_UNSIGNED_BYTE;

  //  imageFormat := (samplesPerPixel = = 1)? GL_LUMINANCE: GL_RGB;
  //  internalFormat := (samplesPerPixel = = 1)? GL_LUMINANCE: GL_RGB;

  {$IFDEF FOR_TRIAL_VERSION}
  if not IsIDERuning then
  begin
    ShowMessage('You are use trial dicomvcl. Please open http://www.dicomvcl.com.');
    //Application.Terminate;
  end;
  //ShellExecute(0, 'open', 'http://www.dicomvcl.com', nil, nil, 0);
  {$ENDIF}

  d1 := ImageData[FBaseFrameIndex + CurrentFrame];
  if not assigned(d1) then
  begin
    //ABitmapEx.SetSize(512, 512);
    //ABitmapEx.Font.Size := 40;
    //ABitmapEx.Font.Color := clRed;
    //ABitmapEx.Textout(0, ABitmapEx.Height div 2, 'No Image Data');
    exit;
  end;
  if d1.Data = nil then
  begin
    //ABitmapEx.SetSize(512, 512);
    //ABitmapEx.Font.Size := 40;
    //ABitmapEx.Font.Color := clRed;
    //ABitmapEx.Textout(0, ABitmapEx.Height div 2, 'No Image Data or decompress fail');
    exit;
  end;
  if not DecompressData(FBaseFrameIndex + CurrentFrame) then
    exit;
  if fRotate1 in [1, 3] then
  begin
    w1 := Height;
    h1 := Width;
  end
  else
  begin
    w1 := Width;
    h1 := Height;
  end;

  w1 := 1 shl ceil(log2(w1));
  h1 := 1 shl ceil(log2(h1));

  if (Copy(PhotometricInterpretation, 1, 4) = 'MONO') then
  begin
    if (Bits > 8) then
    begin
      if fDSAMode then
      begin
        if PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          Result := Scale16to8bitDSAWordTextureData(w1, h1, TextureData)
        else
          Result := Scale16to8bitDSATextureData(w1, h1, TextureData);
      end
      else
        if fMergeMode then
      begin
        if PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          Result := Merge16to8bitWordTextureData(w1, h1, TextureData)
        else
          Result := Merge16to8bitTextureData(w1, h1, TextureData);
      end
      else
      begin
        if PixelRepresentation then //Attributes.getInteger($28, $103) = 0 then
          Result := Scale16to8bitWordTextureData(w1, h1, TextureData)
        else
          Result := Scale16to8bitTextureData(w1, h1, TextureData)
      end;
    end
    else
    begin
      if fDSAMode then
        Result := Scale8to8bitDSATextureData(w1, h1, TextureData)
      else
        Result := Scale8to8bitTextureData(w1, h1, TextureData);
    end;
  end
  else
  begin
    GetMem(pData, w1 * h1 * 4);

    if FWindowWidth = 0 then
    begin
      FWindowWidth := (d1.MaxValue - d1.MinValue);
      FWindowCenter := d1.MinValue + FWindowWidth div 2;
    end;

    lCen := FWindowCenter;
    lWid := FWindowWidth div 2;

    min16 := lCen - lWid;
    max16 := lCen + lWid;
    lRange := (max16 - min16);

    if lRange = 0 then
      exit;
    lScaleShl10 := 255 / lRange;
    nn := fNegative xor (PhotometricInterpretation = 'MONOCHROME1');

    if FPlanarConfiguration = 1 then
    begin
      if fRotate1 = 0 then
      begin
        np1 := d1.Data;
        np2 := np1;
        inc(np2, Width * Height);
        np3 := np2;
        inc(np3, Width * Height);
      end
      else
        if fRotate1 = 2 then
      begin
        np3 := d1.Data;
        inc(np3, Width * Height);
        np2 := np3;
        inc(np2, Width * Height);
        np1 := np2;
        inc(np1, Width * Height);
      end;
    end
    else
    begin
      if fRotate1 = 0 then
        prgb1 := d1.Data
      else
        if fRotate1 = 2 then
      begin
        prgb1 := d1.Data;
        inc(prgb1, Width * Height - 1);
      end;
    end;
    for I1 := 0 to Height - 1 do // Iterate
    begin
      if FPlanarConfiguration = 1 then
      begin
        if fRotate1 = 1 then
        begin
          np1 := d1.Data;
          np2 := np1;
          inc(np2, Width * Height);
          np3 := np2;
          inc(np3, Width * Height);

          inc(np1, Width - i1 - 1);
          inc(np2, Width - i1 - 1);
          inc(np3, Width - i1 - 1);
        end
        else
          if fRotate1 = 3 then
        begin
          np1 := d1.Data;
          np2 := np1;
          inc(np2, Width * Height);
          np3 := np2;
          inc(np3, Width * Height);

          inc(np1, (Height - 1) * Width + i1);
          inc(np2, (Height - 1) * Width + i1);
          inc(np3, (Height - 1) * Width + i1);
        end;
      end
      else
      begin
        if fRotate1 = 1 then
        begin
          prgb1 := d1.Data;
          inc(prgb1, Width - i1 - 1);
        end
        else
          if fRotate1 = 3 then
        begin
          prgb1 := d1.Data;
          inc(prgb1, (Height - 1) * Width + i1);
        end;
      end;

      pb1 := pData;
      if fVerFlip1 then
      begin
        //DestScanline := ABitmap.ScanLine[ABitmap.Height - i1 - 1]
        inc(pb1, (h1 - i1 - 1) * w1 * 4);
      end
      else
      begin
        //DestScanline := ABitmap.ScanLine[i1];
        inc(pb1, (i1) * w1 * 4);
      end;
      DestScanline := Pointer(pb1);

      if fHozFlip1 then
      begin
        for I2 := width - 1 downto 0 do
        begin
          if FPlanarConfiguration = 1 then
          begin
            DestScanLine[i2] := MyColor32(np1^, np2^, np3^);
            //DestScanLine[i2].r := np1^;
            //DestScanLine[i2].g := np2^;
            //DestScanLine[i2].b := np3^;
            case fRotate1 of
              0:
                begin
                  inc(np1);
                  inc(np2);
                  inc(np3);
                end;
              1:
                begin
                  inc(np1, width);
                  inc(np2, width);
                  inc(np3, width);
                end;
              2:
                begin
                  dec(np1);
                  dec(np2);
                  dec(np3);
                end;
              3:
                begin
                  dec(np1, width);
                  dec(np2, width);
                  dec(np3, width);
                end;
            end;
          end
          else
          begin

            if FPlanarConfiguration = 2 then
            begin
              //DestScanLine[i2].r := prgb1^.r;
              //DestScanLine[i2].g := prgb1^.g;
              //DestScanLine[i2].b := prgb1^.b;
              DestScanLine[i2] := MyColor32(prgb1^.r, prgb1^.g, prgb1^.b)
            end
            else
            begin
              //DestScanLine[i2].r := prgb1^.b;
              //DestScanLine[i2].g := prgb1^.g;
              //DestScanLine[i2].b := prgb1^.r;
              DestScanLine[i2] := MyColor32(prgb1^.b, prgb1^.g, prgb1^.r);
            end;
            case fRotate1 of
              0: inc(prgb1);
              1: inc(prgb1, width);
              2: dec(prgb1);
              3: dec(prgb1, width);
            end;
          end;
        end;
      end
      else
      begin
        for I2 := 0 to width - 1 do
        begin
          if FPlanarConfiguration = 1 then
          begin
            //DestScanLine[i2].r := np1^;
            //DestScanLine[i2].g := np2^;
            //DestScanLine[i2].b := np3^;
            DestScanLine[i2] := MyColor32(np1^, np2^, np3^);
            case fRotate1 of
              0:
                begin
                  inc(np1);
                  inc(np2);
                  inc(np3);
                end;
              1:
                begin
                  inc(np1, width);
                  inc(np2, width);
                  inc(np3, width);
                end;
              2:
                begin
                  dec(np1);
                  dec(np2);
                  dec(np3);
                end;
              3:
                begin
                  dec(np1, width);
                  dec(np2, width);
                  dec(np3, width);
                end;
            end;
            //                DestScanLine[i2] := prgb1^.b shl 16 + prgb1^.g shl 8 + prgb1^.r
          end
          else
          begin
            if FPlanarConfiguration = 2 then
            begin
              //DestScanLine[i2].r := prgb1^.r;
              //DestScanLine[i2].g := prgb1^.g;
              //DestScanLine[i2].b := prgb1^.b;
              DestScanLine[i2] := MyColor32(prgb1^.r, prgb1^.g, prgb1^.b)
            end
            else
            begin
              //DestScanLine[i2].r := prgb1^.b;
              //DestScanLine[i2].g := prgb1^.g;
              //DestScanLine[i2].b := prgb1^.r;
              DestScanLine[i2] := MyColor32(prgb1^.b, prgb1^.g, prgb1^.r);
            end;

            case fRotate1 of
              0: inc(prgb1);
              1: inc(prgb1, width);
              2: dec(prgb1);
              3: dec(prgb1, width);
            end;
          end;
        end;
      end;
    end; // for

    TextureData.Width := w1;
    TextureData.Height := h1;
    TextureData.SamplePerPixel := 4;
    TextureData.aType := GL_RGBA;
    TextureData.Texture := pData;

    Result := 0;
  end;
end; *)

end.

