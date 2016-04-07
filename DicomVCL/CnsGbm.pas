{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit CnsGbm;

interface

uses
  Windows, { for TMaxLogPalette }
  Classes, { for TStream }
  SysUtils, { for Exception }
  CnsMisc, { for TImageFormat }
  CnsDiGrph; { for TDibGraphic }

{ load a TDibGraphic from a stream using the GBM library. SampleFileName
  must include the extension to indicate the file type. Only pcx and
  tga files can be loaded with GBM. }
{$WARNINGS OFF}
procedure LoadGraphicWithGbm(const Stream: TStream;
  const Graphic: TDibGraphic;
  const SampleFileName: string;
  const Options: PChar;
  const ProgressEvent: TDicomEasyProgressEvent);
{$WARNINGS ON}

procedure SaveGraphicWithGbm(const Stream: TStream;
  const Graphic: TDibGraphic;
  const SampleFileName: string;
  const ProgressEvent: TDicomEasyProgressEvent);

type

  EGbmError = class(Exception);

  {--------------------------------------------------------------------------}

implementation

uses
  CnsCLib, { for gbm_read_reader ... }
  CnsMsg; { for XXXXStr }

{--------------------------------------------------------------------------}

procedure GbmToLogPalette(const GbmPalette: TGbmPalette;
  const ColorCount: Integer;
  var Palette: TMaxLogPalette);
var
  Index: Integer;

begin
  FillChar(Palette, SizeOf(Palette), 0);

  Palette.palNumEntries := ColorCount;
  Palette.palVersion := $0300;

  for Index := 0 to (ColorCount - 1) do
  begin
    { blue and red values are reversed }
    Palette.palPalEntry[Index].peRed :=
      GbmPalette[Index].R;
    Palette.palPalEntry[Index].peGreen :=
      GbmPalette[Index].G;
    Palette.palPalEntry[Index].peBlue :=
      GbmPalette[Index].B;

  end;
end;

{--------------------------------------------------------------------------}

procedure LogToGbmPalette(const Palette: TMaxLogPalette;
  var GbmPalette: TGbmPalette
  );
var
  Index: Integer;

begin
  FillChar(GbmPalette, SizeOf(GbmPalette), 0);

  for Index := 0 to (Palette.palNumEntries - 1) do
  begin
    { blue and red values are reversed }
    GbmPalette[Index].B := Palette.palPalEntry[Index].peBlue;
    GbmPalette[Index].G := Palette.palPalEntry[Index].peGreen;
    GbmPalette[Index].R := Palette.palPalEntry[Index].peRed;
  end;
end;

{--------------------------------------------------------------------------}

procedure GbmProgress(Progress: ShortInt;
  CallBackData: LongInt); cdecl;
var
  Graphic: TDibGraphic;
begin
  {$WARNINGS OFF}
  Graphic := TDibGraphic(CallBackData);
  {$WARNINGS ON}

  DoProgress(Graphic, Graphic.OnReadWriteProgress, Progress, 0, 100, -1);
end;

{--------------------------------------------------------------------------}
{$WARNINGS OFF}

procedure LoadGraphicWithGbm(const Stream: TStream;
  const Graphic: TDibGraphic;
  const SampleFileName: string;
  const Options: PChar;
  const ProgressEvent: TDicomEasyProgressEvent);
var
  Gbm: TGbm;
  FileType: Integer;
  Palette: TMaxLogPalette;
  pPalette: PMaxLogPalette;
  ImageFormat: TImageFormat;
  GbmPalette: TGbmPalette;
  LastPercent: ShortInt;

begin
  LastPercent := -1;
  DoProgress(Graphic, ProgressEvent, 0, 0, 100, LastPercent);

  if gbm_guess_filetype(PChar(SampleFileName), @FileType) <> GBM_ERR_OK then
    raise EGbmError.Create('gbm_guess_filetype failed.');

  FillChar(Gbm, SizeOf(Gbm), 0);
  if gbm_read_header(PChar(SampleFileName), Integer(Stream), FileType,
    @Gbm, Options) <> GBM_ERR_OK then
    raise EGbmError.Create('gbm_read_header failed.');

  case Gbm.Bpp of
    1: ImageFormat := ifBlackWhite;
    4: ImageFormat := ifColor16;
    8: ImageFormat := ifColor256;
    24: ImageFormat := ifTrueColor;
  else
    raise EGbmError.Create(msgInvalidImageFormat);
  end;

  if ImageFormat <> ifTrueColor then
  begin
    FillChar(GbmPalette, SizeOf(GbmPalette), 0);
    if gbm_read_palette(Integer(Stream), FileType,
      @Gbm, @GbmPalette[0]) <> GBM_ERR_OK then
      raise EGbmError.Create('gbm_read_header failed.');

    GbmToLogPalette(GbmPalette, 1 shl (Gbm.Bpp), Palette);

    pPalette := @Palette;
  end
  else
    pPalette := nil;

  Graphic.NewImage(Gbm.W, Gbm.H, ImageFormat, pPalette, 0, 0);

  if gbm_read_data(Integer(Stream), FileType,
    @Gbm, Graphic.Bits, GbmProgress, LongInt(Graphic)) <> GBM_ERR_OK then
    raise EGbmError.Create('gbm_read_data failed.');

  DoProgress(Graphic, ProgressEvent, 100, 0, 100, LastPercent);

end;

{--------------------------------------------------------------------------}

procedure SaveGraphicWithGbm(const Stream: TStream;
  const Graphic: TDibGraphic;
  const SampleFileName: string;
  const ProgressEvent: TDicomEasyProgressEvent);
var
  Gbm: TGbm;
  FileType: Integer;
  GbmPalette: TGbmPalette;

begin
  if gbm_guess_filetype(PChar(SampleFileName), @FileType) <> GBM_ERR_OK then
    raise EGbmError.Create('gbm_guess_filetype failed.');

  FillChar(Gbm, SizeOf(Gbm), 0);
  Gbm.W := Graphic.Width;
  Gbm.H := Graphic.Height;

  case Graphic.ImageFormat of
    ifBlackWhite: Gbm.Bpp := 1;
    ifColor16, ifGray16: Gbm.Bpp := 4;
    ifColor256, ifGray256: Gbm.Bpp := 8;
    ifTrueColor: Gbm.Bpp := 24;
  else
    raise EGbmError.Create(msgInvalidImageFormat);
  end;

  if Graphic.ImageFormat <> ifTrueColor then
    LogToGbmPalette(Graphic.Palette, GbmPalette)
  else
    FillChar(GbmPalette, SizeOf(GbmPalette), 0);

  if gbm_write(PChar(SampleFileName), Integer(Stream), FileType,
    @Gbm, @GbmPalette, Graphic.Bits, PChar(''), GbmProgress, LongInt(Graphic)) <> GBM_ERR_OK then
    raise EGbmError.Create('gbm_write failed.');

end;
{$WARNINGS ON}

{--------------------------------------------------------------------------}

initialization

  gbm_init;

finalization

  gbm_deinit;

end.

