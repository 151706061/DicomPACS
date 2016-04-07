{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DcmJpeg2000Ex2;

interface

uses Windows, SysUtils, Classes, CnsCRtl;

type
  { Type Jpeg 2000 file (needed for OpenJPEG codec settings).}
  TChar4 = array[0..3] of Char;
  TChar8 = array[0..7] of Char;
  TJpeg2000FileType = (jtInvalid, jtJP2, jtJ2K, jtJPT);

  TColor24Rec = packed record
    case LongInt of
      0: (B, G, R: Byte);
      1: (Channels: array[0..2] of Byte);
  end;
  PColor24Rec = ^TColor24Rec;
  TColor24RecArray = array[0..MaxInt div SizeOf(TColor24Rec) - 1] of TColor24Rec;
  PColor24RecArray = ^TColor24RecArray;

  TColor48Rec = packed record
    case LongInt of
      0: (B, G, R: Word);
      1: (Channels: array[0..2] of Word);
  end;
  PColor48Rec = ^TColor48Rec;
  TColor48RecArray = array[0..MaxInt div SizeOf(TColor48Rec) - 1] of TColor48Rec;
  PColor48RecArray = ^TColor48RecArray;

procedure encodeJPEG2000_openjpeg(jpegData: TStream;
  data: Pointer;
  quality, 
  Width, Height,
  _samplesPerPixel,
  _pixelDepth: Integer;
  photometricInterpretation: Integer;
  _isSigned: Integer);

function convertJPEG2000ToHost_openjpeg(jpegData: Pointer; ALen: Integer; AMode: integer): Pointer;

implementation

uses OpenJpeg2000;

const
  SJpeg2000FormatName = 'JPEG 2000 Image';
  SJpeg2000Masks = '*.jp2,*.j2k,*.j2c,*.jpx,*.jpc';
  Jpeg2000DefaultQuality = 80;
  Jpeg2000DefaultCodeStreamOnly = False;
  Jpeg2000DefaultLosslessCompression = False;

const
  JP2Signature: TChar8 = #0#0#0#$0C#$6A#$50#$20#$20;
  J2KSignature: TChar4 = #$FF#$4F#$FF#$51;

function GetFileType(jpegData: Pointer): TJpeg2000FileType;
begin
  Result := jtInvalid;
  // Check if we have full JP2 file format or just J2K code stream
  if CompareMem(jpegData, @JP2Signature, SizeOf(JP2Signature)) then
    Result := jtJP2
  else
    if CompareMem(jpegData, @J2KSignature, SizeOf(J2KSignature)) then
    Result := jtJ2K;
end;

function Iff(Condition: Boolean; TruePart, FalsePart: LongInt): LongInt;
begin
  if Condition then
    Result := TruePart
  else
    Result := FalsePart;
end;

function IffUnsigned(Condition: Boolean; TruePart, FalsePart: LongWord): LongWord;
begin
  if Condition then
    Result := TruePart
  else
    Result := FalsePart;
end;

procedure encodeJPEG2000_openjpeg(jpegData: TStream;
  data: Pointer;
  quality, //1---100
  //int photometricInterpretation,
 Width, Height,
  _samplesPerPixel,
  _pixelDepth: Integer;
  photometricInterpretation: Integer;
  _isSigned: Integer);
var
  TargetSize, Rate: Single;
  I, Z, InvZ, Channel, ChannelSize, NumPixels: LongInt;
  Pix: PByte;
  image: popj_image_t;
  cio: popj_cio_t;
  cinfo: popj_cinfo_t;
  parameters: opj_cparameters_t;
  compparams: popj_image_cmptparm_array;

  BytesPerPixel, ChannelCount: Integer;
  FCodeStreamOnly, FLosslessCompression, HasAlphaChannel: Boolean;
begin
  FCodeStreamOnly := true;
  HasAlphaChannel := false;
  if quality = 100 then
    FLosslessCompression := true
  else
    FLosslessCompression := false;
    
  image := nil;
  compparams := nil;
  cinfo := nil;
  cio := nil;
  // Makes image to save compatible with Jpeg 2000 saving capabilities
  try
    ChannelCount := _samplesPerPixel;

    ChannelSize := (_pixelDepth + 7) div 8;
    BytesPerPixel := ChannelSize * ChannelCount;

    // Fill component info structures and then create OpenJPEG image
    GetMem(compparams, ChannelCount * SizeOf(opj_image_comptparm));
    for I := 0 to ChannelCount - 1 do
      with compparams[I] do
      begin
        dx := 1;
        dy := 1;
        w := Width;
        h := Height;
        bpp := _pixelDepth;
        prec := bpp;
        sgnd := 0;
        x0 := 0;
        y0 := 0;
      end;
      
    if _samplesPerPixel = 3 then
      image := opj_image_create(ChannelCount, @compparams[0], CLRSPC_SRGB)
    else
      image := opj_image_create(ChannelCount, @compparams[0], CLRSPC_GRAY);

    if image = nil then
      Exit;
    image.x1 := Width;
    image.y1 := Height;

    if FCodeStreamOnly then
      cinfo := opj_create_compress(CODEC_J2K)
    else
      cinfo := opj_create_compress(CODEC_JP2);

    // Set event manager to nil to avoid getting messages
    cinfo.event_mgr := nil;
    // Set compression parameters based current file format properties
    opj_set_default_encoder_parameters(@parameters);
    parameters.cod_format := Iff(FCodeStreamOnly, 0, 1);

    parameters.numresolution := 6;
    parameters.tcp_numlayers := 1;
    parameters.cp_disto_alloc := 1;

    if FLosslessCompression then
    begin
      // Set rate to 0 -> lossless
      parameters.tcp_rates[0] := 0;
    end
    else
    begin
      // Quality -> Rate computation taken from ImageMagick
      Rate := 100.0 / Sqr(115 - Quality);
      NumPixels := Width * Height * BytesPerPixel;
      TargetSize := (NumPixels * Rate) + 550 + (ChannelCount - 1) * 142;
//      parameters.tcp_rates[0] := 1.0 / (TargetSize / NumPixels);
//      parameters.tc
      parameters.tcp_rates[0] := 50;

      {$IF Defined(FPC)}
      // Only lossless compression for images with alpha in FPC.
      // OpenJPEG sets whole chanel to 128 somehow when compiled with GCC.
      if Info.HasAlphaChannel then
        parameters.tcp_rates[0] := 0;
      {$IFEND}
    end;
    // Setup encoder
    opj_setup_encoder(cinfo, @parameters, image);

    // Fill component samples in data with values taken from
    // image pixels
    for Channel := 0 to ChannelCount - 1 do
    begin
      Z := Channel;
      InvZ := ChannelCount - 1 - Z;
      if HasAlphaChannel then
      begin
        if Channel = ChannelCount - 1 then
          InvZ := Z
        else
          InvZ := ChannelCount - 2 - Z;
      end;
      Pix := @PByteArray(Data)[InvZ * ChannelSize];
      for I := 0 to Width * Height - 1 do
      begin
        case ChannelSize of
          1: image.comps[Z].data[I] := Pix^;
          2: image.comps[Z].data[I] := PWord(Pix)^;
          4: LongWord(image.comps[Z].data[I]) := PLongWord(Pix)^;
        end;
        Inc(Pix, BytesPerPixel);
      end;
    end;

    // Open OpenJPEG output
    cio := opj_cio_open(opj_common_ptr(cinfo), nil, 0);
    // Try to encode the image
    if not opj_encode(cinfo, cio, image, nil) then
      Exit;
    // Finally write buffer with encoded image to output

    //todo Write(Handle, cio.buffer, cio_tell(cio));
    jpegdata.Write(cio.buffer^, cio_tell(cio));
  finally
    opj_destroy_compress(cinfo);
    opj_image_destroy(image);
    opj_cio_close(cio);
    FreeMem(compparams);
  end;
end;

function convertJPEG2000ToHost_openjpeg(jpegData: Pointer; ALen: Integer; AMode: integer): Pointer;
var
  FileType: TJpeg2000FileType;
  newPixelData, Buffer, Pix, PixUp: PByte;
  X, Y, Z, InvZ, SX, SY, WidthBytes, BufferSize, ChannelSize, Channel,
    CY, CB, CR: LongInt;

  Signed: Boolean;
  Col24: PColor24Rec;
  Col48: PColor48Rec;
  dinfo: popj_dinfo_t;
  parameters: opj_dparameters_t;
  cio: popj_cio_t;
  image: popj_image_t;
  bitDepth: Integer;

  BytesPerPixel, ChannelCount, Width, Height: Integer;
  HasAlphaChannel: Boolean;
begin
  HasAlphaChannel := false;

  image := nil;

  cio := nil;
  opj_set_default_decoder_parameters(@parameters);
  // Determine which codec to use
  FileType := GetFileType(jpegData);
  case FileType of
    jtJP2: dinfo := opj_create_decompress(CODEC_JP2);
    jtJ2K: dinfo := opj_create_decompress(CODEC_J2K);
    jtJPT: dinfo := opj_create_decompress(CODEC_JPT);
  else
    Exit;
  end;
  // Set event manager to nil to avoid getting messages
  dinfo.event_mgr := nil;
  // Currently OpenJPEG can load images only from memory so we have to
  // preload whole input to mem buffer. Not good but no other way now.
  // At least we set stream pos to end of JP2 data after loading (we will now
  // the exact size by then).
  BufferSize := ALen;
  Buffer := jpegData;

  try
    cio := opj_cio_open(opj_common_ptr(dinfo), Buffer, BufferSize);
    opj_setup_decoder(dinfo, @parameters);
    // Decode image
    image := opj_decode(dinfo, cio);
    if image = nil then
      Exit;

    // Determine which Imaging data format to use accorsing to
    // decoded image components

    // image.numcomps
    // image.comps[0].prec
    bitDepth := (image.comps[0].prec + 7) div 8;
    Width := image.x1;
    Height := image.y1;

    GetMem(newPixelData, image.x1 * image.y1 * bitDepth * image.numcomps);
     Result := newPixelData;
    //NewImage(image.x1, image.y1, Format, Images[0]);

    //Info := GetFormatInfo(Format);
    ChannelCount := image.numcomps;
    BytesPerPixel := bitDepth;

    ChannelSize := BytesPerPixel div ChannelCount;

    // Images components are stored separately in JP2, each can have
    // different dimensions, bitdepth, ...
    for Channel := 0 to ChannelCount - 1 do
    begin
      // Z and InvZ are used as component indices to output image channels and
      // decoded image components. Following settings prevent later need for
      // Red/Blue switch. Alpha channel is special case, channel orders
      // are ARGB <-> ABGR (Channel at the lowest address of output image is Blue
      // where as decoded image component at the lowest index is Red).
      Z := Channel;
      InvZ := ChannelCount - 1 - Z;
      if HasAlphaChannel then
      begin
        if Channel = ChannelCount - 1 then
          InvZ := Z
        else
          InvZ := ChannelCount - 2 - Z;
      end;
      // Signed componets must be scaled to [0, 1] (later)
      Signed := image.comps[Z].sgnd = 1;
      if (image.comps[Z].dx = 1) and (image.comps[Z].dy = 1) then
      begin
        // X and Y sample separation is 1 so just need to assign component values
        // to image pixels one by one
        Pix := @PByteArray(newPixelData)[InvZ * ChannelSize];
        for Y := 0 to Height - 1 do
          for X := 0 to Width - 1 do
          begin
            case ChannelSize of
              1: Pix^ := image.comps[Z].data[Y * Width + X] + Iff(Signed, $80, 0);
              2: PWord(Pix)^ := image.comps[Z].data[Y * Width + X] + Iff(Signed, $8000, 0);
              4: PLongWord(Pix)^ := image.comps[Z].data[Y * Width + X] + IffUnsigned(Signed,
                  $80000000, 0);
            end;
            Inc(Pix, BytesPerPixel);
          end;
      end
      else
      begin
        // Sample separation is active - component is sub-sampled. Real component
        // dimensions are [image.comps[Z].w * image.comps[Z].dx,
        // image.comps[Z].h * image.comps[Z].dy
        WidthBytes := Width * BytesPerPixel;
        for Y := 0 to image.comps[Z].h - 1 do
        begin
          Pix := @PByteArray(newPixelData)[Y * image.comps[Z].dy * WidthBytes + InvZ *
            ChannelSize];
          for X := 0 to image.comps[Z].w - 1 do
            for SX := 0 to image.comps[Z].dx - 1 do
            begin
              // Replicate pixels on line
              case ChannelSize of
                1: Pix^ := image.comps[Z].data[Y * image.comps[Z].w + X] + Iff(Signed, $80, 0);
                2: PWord(Pix)^ := image.comps[Z].data[Y * image.comps[Z].w + X] + Iff(Signed,
                    $8000, 0);
                4: PLongWord(Pix)^ := image.comps[Z].data[Y * image.comps[Z].w + X] +
                  IffUnsigned(Signed, $80000000, 0);
              end;
              Inc(Pix, BytesPerPixel);
            end;

          for SY := 1 to image.comps[Z].dy - 1 do
          begin
            // Replicate lines
            PixUp := @PByteArray(newPixelData)[Y * image.comps[Z].dy * WidthBytes + InvZ *
              ChannelSize];
            Pix := @PByteArray(newPixelData)[(Y * image.comps[Z].dy + SY) * WidthBytes + InvZ *
              ChannelSize];
            for X := 0 to Width - 1 do
            begin
              case ChannelSize of
                1: Pix^ := PixUp^;
                2: PWord(Pix)^ := PWord(PixUp)^;
                4: PLongWord(Pix)^ := PLongWord(PixUp)^;
              end;
              Inc(Pix, BytesPerPixel);
              Inc(PixUp, BytesPerPixel);
            end;
          end;
        end;
      end;
    end;

    {if (Info.ChannelCount = 3) and (image.color_space = CLRSPC_SYCC) then
    begin
      // Convert image from YCbCr colorspace to RGB if needed.
      // Not exactly sure which channel is Y (OpenJpeg's fault - no "cdef" detection).
      Pix := Bits;
      if Info.BytesPerPixel = 3 then
      begin
        for X := 0 to Width * Height - 1 do
          with PColor24Rec(Pix)^ do
          begin
            CY := R;
            CB := G;
            CR := B;
            YCbCrToRGB(CY, CB, CR, R, G, B);
            Inc(Pix, Info.BytesPerPixel);
          end;
      end
      else
      begin
        for X := 0 to Width * Height - 1 do
          with PColor48Rec(Pix)^ do
          begin
            CY := R;
            CB := G;
            CR := B;
            YCbCrToRGB16(CY, CB, CR, R, G, B);
            Inc(Pix, Info.BytesPerPixel);
          end;
      end;
    end; }
  finally
    opj_image_destroy(image);
    opj_destroy_decompress(dinfo);
    opj_cio_close(cio);
  end;
end;

end.

