{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit CnsJpgGr;

interface

uses
  Classes, { for TStream }
  SysUtils, { for Exception }
  CnsDiGrph; { for TDibGraphic }

type

  TJpegGraphic = class(TDibGraphic)
  protected
    FSaveQuality: TJPEGQuality;
    FSaveProgressive: Boolean;
    FOptimizedHuffmanCodes: Boolean;

    class function CanRead(const Stream: TStream): Boolean; override;

  public
    constructor Create; override;

    procedure SingleLoadFromStream(const Stream: TStream;
      const ImageToLoad: LongInt
      ); override;

    procedure SaveToStream(Stream: TStream); override;

    property SaveQuality: TJPEGQuality read FSaveQuality
      write FSaveQuality;

    property SaveProgressive: Boolean read FSaveProgressive
      write FSaveProgressive;

    property OptimizedHuffmanCodes: Boolean read FOptimizedHuffmanCodes
      write FOptimizedHuffmanCodes;
  end;

  EJpegError = class(Exception);

  {--------------------------------------------------------------------------}

implementation

uses
  CnsCLib, { for jpeg_XXXX }
  CnsMisc, { for CentimetersPerInch }
  CnsMsg, { for XXXXStr }
  Graphics, { for TPicture }
  Windows; { for TRect }

{--------------------------------------------------------------------------}

constructor TJpegGraphic.Create;
begin
  inherited Create;

  FSaveQuality := 80;
  FSaveProgressive := False;
  FOptimizedHuffmanCodes := False;
end;

{--------------------------------------------------------------------------}
{$WARNINGS OFF}

procedure TJpegGraphic.SingleLoadFromStream(
  const Stream: TStream;
  const ImageToLoad: LongInt
  );

var
  err: j_error_mgr_ptr;
  cinfo: j_decompress_ptr;
  Width: Cardinal;
  Height: Cardinal;
  Components: Integer;
  ResUnit: Byte;
  XRes: SmallInt;
  YRes: SmallInt;

  ImageFormat: TImageFormat;
  Y: LongInt;
  pScanLine: PByteArray;
  FileColorSpace: Integer;

  LastPercent: ShortInt;

begin
  LastPercent := -1;
  LastPercent := DoProgress(Self, FOnReadWriteProgress, 0, 0, 100, LastPercent);

  jpeg_init_decompress(@err, @cinfo);
  try
    jpeg_stdio_src(cinfo, Pointer(Stream));

    jpeg_read_header(cinfo, 1);

    { get info header before jpeg_start_decompress to get the
      color space. }
    jpeg_get_info(cinfo,
      @Width, @Height, @Components,
      @ResUnit, @XRes, @YRes, @FileColorSpace);

    if FileColorSpace = JCS_GRAYSCALE then
      jpeg_set_out_colorspace(cinfo, JCS_GRAYSCALE)
    else
    begin
      { transform all other color spaces to RGB }
      jpeg_set_out_colorspace(cinfo, JCS_RGB);

    end;

    jpeg_start_decompress(cinfo);

    jpeg_get_info(cinfo,
      @Width, @Height, @Components,
      @ResUnit, @XRes, @YRes, @FileColorSpace);

    if Components = 1 then
      ImageFormat := ifGray256
    else
      if Components = 3 then
      ImageFormat := ifTrueColor
    else
      raise EJpegError.Create(msgInvalidSampleCount +
        ', ' + IntToStr(Components));

    case ResUnit of
      JPEG_DOTSPERINCH:
        begin
          { dots per inch. Conversion not necessary }
        end;

      JPEG_DOTSPERCM:
        begin
          { dots per centimeter }
          XRes := Round(XRes * CCentimetersPerInch);
          YRes := Round(YRes * CCentimetersPerInch);
        end;
    else
      begin
        { not specified }
        XRes := 0;
        YRes := 0;
      end;
    end; { case }

    Self.NewImage(Width, Height, ImageFormat, nil, XRes, YRes);

    for Y := 0 to (Height - 1) do
    begin
      LastPercent := DoProgress(Self, OnReadWriteProgress, Y, 0, Height - 1, LastPercent);

      pScanLine := Self.ScanLine[Y];
      jpeg_read_scanlines(cinfo, @pScanLine, 1);
      if ImageFormat = ifTrueColor then
        SwapRBOnScanLine(pScanLine, Width * 3);
    end;

    jpeg_finish_decompress(cinfo);

  finally
    jpeg_decompress_done(err, cinfo);
  end;

  DoProgress(Self, OnReadWriteProgress, 100, 0, 100, -1);

end;

{--------------------------------------------------------------------------}

procedure TJpegGraphic.SaveToStream(Stream: TStream);
var
  err: j_error_mgr_ptr;
  cinfo: j_compress_ptr;

  Components: Integer;
  Colorspace: Integer;

  Progressive: Integer;
  OptimizedHuffman: Integer;

  ScanLineSize: LongInt;
  pScanLine: PByteArray;

  Y: Integer;

  LastPercent: ShortInt;
begin
  LastPercent := -1;
  LastPercent := DoProgress(Self, FOnReadWriteProgress, 0, 0, 100, LastPercent);

  if Self.ImageFormat = ifGray256 then
  begin
    Components := 1;
    Colorspace := JCS_GRAYSCALE;
  end
  else
    if Self.ImageFormat = ifTrueColor then
  begin
    Components := 3;
    Colorspace := JCS_RGB;
  end
  else
    raise EJpegError.Create(msgJpegMustBeTrueColorOrGrayscale);

  if FSaveProgressive then
    Progressive := 1
  else
    Progressive := 0;

  if FOptimizedHuffmanCodes then
    OptimizedHuffman := 1
  else
    OptimizedHuffman := 0;

  ScanLineSize := Self.Width * Components;

  GetMem(pScanLine, ScanLineSize);
  jpeg_init_compress(@err, @cinfo);
  try
    jpeg_stdio_dest(cinfo, Pointer(Stream));

    jpeg_set_info(cinfo, Self.Width, Self.Height, Components,
      JPEG_DOTSPERINCH, Self.XDotsPerInch, Self.YDotsPerInch,
      ColorSpace, FSaveQuality,
      Progressive, OptimizedHuffman);

    jpeg_start_compress(cinfo, 1);

    for Y := 0 to (Height - 1) do
    begin
      LastPercent := DoProgress(Self, OnReadWriteProgress, Y, 0, Height - 1, LastPercent);

      Move(Self.ScanLine[Y]^, pScanLine^, ScanLineSize);
      if ImageFormat = ifTrueColor then
        SwapRBOnScanLine(pScanLine, ScanLineSize);

      jpeg_write_scanlines(cinfo, @pScanLine, 1);
    end;

    jpeg_finish_compress(cinfo);

  finally
    jpeg_compress_done(err, cinfo);
    FreeMem(pScanLine, ScanLineSize);
  end;

  DoProgress(Self, OnReadWriteProgress, 100, 0, 100, -1);

end;
{$WARNINGS ON}
{--------------------------------------------------------------------------}

type

  TJpegHeader = packed record
    SOI: array[1..2] of Byte;
    APP0: array[1..2] of Byte;
    Length: array[1..2] of Byte;
    Identifier: array[1..5] of Byte;
    Version: array[1..2] of Byte;
    Units: Byte;
    Xdensity: array[1..2] of Byte;
    Ydensity: array[1..2] of Byte;
    XThumbnail: Byte;
    YThumbnail: Byte;
  end;

class function TJpegGraphic.CanRead(const Stream: TStream): Boolean;
var
  Header: TJpegHeader;
begin
  Stream.Read(Header, SizeOf(Header));
  Stream.Seek(-(SizeOf(Header)), soFromCurrent);

  Result := (Header.SOI[1] = $FF) and
    (Header.SOI[2] = $D8) and
    (Header.APP0[1] = $FF) and
    (Header.APP0[2] = $E0) and
    (Header.Identifier[1] = $4A) and
    (Header.Identifier[2] = $46) and
    (Header.Identifier[3] = $49) and
    (Header.Identifier[4] = $46) and
    (Header.Identifier[5] = 0);
end;

{--------------------------------------------------------------------------}

initialization

  RegisterDibGraphic('JPG', 'JPEG', TJpegGraphic);
  RegisterDibGraphic('JPEG', 'JPEG', TJpegGraphic);

finalization

end.

