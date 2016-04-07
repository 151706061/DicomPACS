{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_MpegWrite;

interface

uses
  SysUtils, Classes, Windows, Graphics;

const

  NDCTMAX = 81;
  BUFSIZE = 4096;
  HAC_RUN = 0;
  HAC_LEVEL = 1;
  HAC_CODE = 2;
  HAC_LCODE = 3;
  QUANTCODE: array[0..7] of integer = (1, 2, 3, 4, 6, 8, 12, 16);
  dmcode: array[0..32] of integer = (
    25, 27, 29, 31, 33, 35, 19, 21, 23, 7, 9, 11, 7, 3, 3, 3,
    1, 2, 2, 2, 6, 10, 8, 6, 22, 20, 18, 34, 32, 30, 28, 26, 24
    );
  dmlen: array[0..32] of integer = (
    11, 11, 11, 11, 11, 11, 10, 10, 10, 8, 8, 8, 7, 5, 4, 3,
    1, 3, 4, 5, 7, 8, 8, 8, 10, 10, 10, 11, 11, 11, 11, 11, 11
    );

type
  TMpegStream = class
  private
    buffer: array[0..BUFSIZE - 1] of byte;
    pos, bitmask, counter: integer;
    st: TStream;
    lastydc, lastcrdc, lastcbdc: integer;
    procedure WriteVector(x, y: integer);
  public
    lastx, lasty: integer;
    procedure AssignStream(stout: TStream);
    procedure WriteBit(b: integer);
    procedure WriteNumber(n, bits: integer);
    procedure WriteSequenceHeader(width, height, freq: integer);
    procedure WriteGopHeader(nframe, freq: integer);
    procedure WritePictureHeader(pframe: boolean);
    procedure ReplicatePicture(blocks, n: integer);
    procedure WriteSliceHeader(quantization: integer);
    procedure WriteEnd;
    procedure WritePMacroBlock(x, y: integer);
    procedure Flush;
    procedure WriteBlock(block: array of integer; quantization, kind: integer);
  end;
  TImageBW = class
  private
    procedure diballoc(x, y: integer);
    function CompareBlockFull(x, y, x1, y1: integer; cimage: TimageBW): integer;
  protected
  public
    ndots: integer;
    pixpointer: pbytearray;
    height, width, truewidth, trueheight: integer;
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure SetSize(x, y: integer);
    procedure SetPixel(x, y, v: integer);
    procedure Addpixel(x, y, v: integer);
    function GetPixel(x, y: integer): byte;
    procedure OpenTGA(filename: string);
    procedure FindMotion(cimage: TimageBW; x, y: integer; var dx, dy, err: integer);
    procedure Get8x8Block(x, y: integer; var block: array of integer);
    function BlockSDV(x, y: integer): integer;
  end;

  TMpegImage = class
  private
    function RGBtoY(r, g, b: integer): integer;
    function RGBtoCR(r, g, b: integer): integer;
    function RGBtoCB(r, g, b: integer): integer;
    procedure EncodeIMacroBlock(st: TMpegStream; x, y, quantization: integer;
      color: boolean);
  public
    iy, icr, icb: timagebw;
    constructor Create;
    destructor Destroy; override;
    procedure OpenTGABW(filename: string);
    procedure OpenTGA(filename: string);
    procedure AssignBMP(bmp: TBitmap; pf: TPixelFormat);
    procedure EncodeIMPEG(quantization: integer; color: boolean; st: TMpegStream);
    procedure EncodePMPEG(quantization, tolerance: integer; pimage: TMpegImage; st: tmpegstream);
    function Blocks: integer;
    function Width: integer;
    function Height: integer;
    procedure SetSize(x, y: integer);
  end;
  
  TBaseFrequency =
    (bf2397hz, bf24hz, bf25hz, bf2997hz, bf30hz, bf50hz, bf5994hz, bf60hz);

  TMpeg = class
  private
    im1, im2: TMpegImage;
    mps: TMpegStream;
    initialized: boolean;
    pquantization, ptolerance: integer;
    frameCnt, frameSec: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Open(Width, Height, Quantization, Tolerance: integer;
      BaseFreq: TBaseFrequency; OutStream: TStream);
    procedure Close;
    procedure AddIImage(bm: TBitmap);
    procedure AddPImage(bm: TBitmap);
    procedure Keep(nframes: integer);
  end;
implementation

type

  TIntArray = array[0..9999] of integer;
  PIntArray = ^TIntArray;

const

  ycode: array[0..8] of integer = (4, 0, 1, 5, 6, 14, 30, 62, 126);
  ylen: array[0..8] of integer = (3, 2, 2, 3, 3, 4, 5, 6, 7);

  ccode: array[0..8] of integer = (0, 1, 2, 6, 14, 30, 62, 126, 254);
  clen: array[0..8] of integer = (2, 2, 2, 3, 4, 5, 6, 7, 8);

  dcaddlen: array[0..255] of integer = (
    0, 1, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4,
    5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
    7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
    7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
    7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
    7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
    );

  zigzag: array[0..63] of integer = (
    0, 1, 8, 16, 9, 2, 3, 10,
    17, 24, 32, 25, 18, 11, 4, 5,
    12, 19, 26, 33, 40, 48, 41, 34,
    27, 20, 13, 6, 7, 14, 21, 28,
    35, 42, 49, 56, 57, 50, 43, 36,
    29, 22, 15, 23, 30, 37, 44, 51,
    58, 59, 52, 45, 38, 31, 39, 46,
    53, 60, 61, 54, 47, 55, 62, 63
    );

  quantmatrix: array[0..63] of integer = (
    8, 16, 19, 22, 26, 27, 29, 34,
    16, 16, 22, 24, 27, 29, 34, 37,
    19, 22, 26, 27, 29, 34, 34, 38,
    22, 22, 26, 27, 29, 34, 37, 40,
    22, 26, 27, 29, 32, 35, 40, 48,
    26, 27, 29, 32, 35, 40, 48, 58,
    26, 27, 29, 34, 38, 46, 56, 69,
    27, 29, 35, 38, 46, 56, 69, 83
    );

  huffac: array[0..NDCTMAX - 1, 0..3] of integer = (
    (255, 0, 2, 2),
    (254, 1, 1, 1),
    (0, 1, 3, 2),
    (1, 1, 3, 3),
    (0, 2, 4, 4),
    (2, 1, 5, 4),
    (0, 3, 5, 5),
    (3, 1, 7, 5),
    (4, 1, 6, 5),
    (1, 2, 6, 6),
    (5, 1, 7, 6),
    (6, 1, 5, 6),
    (7, 1, 4, 6),
    (0, 4, 6, 7),
    (2, 2, 4, 7),
    (8, 1, 7, 7),
    (9, 1, 5, 7),
    (0, 5, $26, 8),
    (0, 6, $21, 8),
    (1, 3, $25, 8),
    (3, 2, $24, 8),
    (10, 1, $27, 8),
    (11, 1, $23, 8),
    (12, 1, $22, 8),
    (13, 1, $20, 8),
    (0, 7, 10, 10),
    (1, 4, 12, 10),
    (2, 3, 11, 10),
    (4, 2, 15, 10),
    (5, 2, 9, 10),
    (14, 1, 14, 10),
    (15, 1, 13, 10),
    (16, 1, 8, 10),
    (0, 8, $1D, 12),
    (0, 9, $18, 12),
    (0, 10, $13, 12),
    (0, 11, $10, 12),
    (1, 5, $1B, 12),
    (2, 4, $14, 12),
    (3, 3, $1C, 12),
    (4, 3, $12, 12),
    (6, 2, $1E, 12),
    (7, 2, $15, 12),
    (8, 2, $11, 12),
    (17, 1, $1F, 12),
    (18, 1, $1A, 12),
    (19, 1, $19, 12),
    (20, 1, $17, 12),
    (21, 1, $16, 12),
    (0, 12, $1A, 13),
    (0, 13, $19, 13),
    (0, 14, $18, 13),
    (0, 15, $17, 13),
    (1, 6, $16, 13),
    (1, 7, $15, 13),
    (2, 5, $14, 13),
    (3, 4, $13, 13),
    (5, 3, $12, 13),
    (9, 2, $11, 13),
    (10, 2, $10, 13),
    (22, 1, $1F, 13),
    (23, 1, $1E, 13),
    (24, 1, $1D, 13),
    (25, 1, $1C, 13),
    (26, 1, $1B, 13),
    (0, 16, $1F, 14),
    (0, 17, $1E, 14),
    (0, 18, $1D, 14),
    (0, 19, $1C, 14),
    (0, 20, $1B, 14),
    (0, 21, $1A, 14),
    (0, 22, $19, 14),
    (0, 23, $18, 14),
    (0, 24, $17, 14),
    (0, 25, $16, 14),
    (0, 26, $15, 14),
    (0, 27, $14, 14),
    (0, 28, $13, 14),
    (0, 29, $12, 14),
    (0, 30, $11, 14),
    (0, 31, $10, 14)
    );

procedure FastDct(a: pintarray);
const
  SIN_1_16: integer = 799; // sin(pi*1/16) * 4096
  SIN_2_16: integer = 1567;
  SIN_3_16: integer = 2276;
  SIN_4_16: integer = 2896;
  SIN_5_16: integer = 3406;
  SIN_6_16: integer = 3784;
  SIN_7_16: integer = 4017;
  COS_1_16: integer = 4017;
  COS_2_16: integer = 3784;
  COS_3_16: integer = 3406;
  COS_4_16: integer = 2896;
  COS_5_16: integer = 2276;
  COS_6_16: integer = 1567;
  COS_7_16: integer = 799;
var
  inptr, outptr: pintarray;
  ctr, i, x, u, no, ni: integer;
  s: double;
  temp: array[0..63] of integer;
  tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7: integer;
  tmp10, tmp11, tmp12, tmp13, tmp14, tmp15, tmp16, tmp17, tmp26, tmp25: integer;
begin
  inptr := a;
  outptr := @temp;
  for i := 1 to 2 do
  begin
    no := 0;
    ni := 0;
    for ctr := 0 to 7 do
    begin
      tmp0 := inptr[0 + ni] + inptr[7 + ni];
      tmp1 := inptr[1 + ni] + inptr[6 + ni];
      tmp2 := inptr[2 + ni] + inptr[5 + ni];
      tmp3 := inptr[3 + ni] + inptr[4 + ni];
      tmp4 := inptr[3 + ni] - inptr[4 + ni];
      tmp5 := inptr[2 + ni] - inptr[5 + ni];
      tmp6 := inptr[1 + ni] - inptr[6 + ni];
      tmp7 := inptr[0 + ni] - inptr[7 + ni];
      tmp10 := tmp0 + tmp3;
      tmp11 := tmp1 + tmp2;
      tmp12 := tmp1 - tmp2;
      tmp13 := tmp0 - tmp3;
      outptr[8 * 0 + no] := SIN_4_16 * (tmp10 + tmp11) div 8192;
      outptr[8 * 4 + no] := COS_4_16 * (tmp10 - tmp11) div 8192;
      outptr[8 * 2 + no] := (COS_2_16 * tmp13 + SIN_2_16 * tmp12) div 8192;
      outptr[8 * 6 + no] := (SIN_2_16 * tmp13 - COS_2_16 * tmp12) div 8192;
      tmp16 := SIN_4_16 * (tmp6 + tmp5) div 4096;
      tmp15 := COS_4_16 * (tmp6 - tmp5) div 4096;
      tmp14 := tmp4 + tmp15;
      tmp25 := tmp4 - tmp15;
      tmp26 := tmp7 - tmp16;
      tmp17 := tmp7 + tmp16;
      outptr[8 * 1 + no] := (COS_1_16 * tmp17 + SIN_1_16 * tmp14) div 8192;
      outptr[8 * 7 + no] := (COS_7_16 * tmp17 - SIN_7_16 * tmp14) div 8192;
      outptr[8 * 5 + no] := (COS_5_16 * tmp26 + SIN_5_16 * tmp25) div 8192;
      outptr[8 * 3 + no] := (COS_3_16 * tmp26 - SIN_3_16 * tmp25) div 8192;
      inc(no, 1);
      inc(ni, 8);
    end;
    inptr := @temp;
    outptr := a;
  end;
end;

procedure SlowDct(a: pintarray);
var
  x, y, u, v: integer;
  s: double;
  aout: array[0..63] of integer;
begin
  for v := 0 to 7 do
    for u := 0 to 7 do
    begin
      s := 0;
      for y := 0 to 7 do
        for x := 0 to 7 do
          s := s + a[x + y * 8] * cos(pi * (2 * x + 1) * u / 16) *
            cos(pi * (2 * y + 1) * v / 16);
      s := s / 4;
      if u = 0 then
        s := s / sqrt(2);
      if v = 0 then
        s := s / sqrt(2);
      aout[u + v * 8] := round(s);
    end;
  for x := 0 to 63 do
    a[x] := aout[x];
end;

procedure LevelEscape(level: integer; var l, c: integer);
var
  al: integer;
begin
  al := abs(level);
  if (al = 0) or (al > 255) then
    raise exception.create('Escape level');
  if al < 128 then
  begin
    l := 8;
    c := level and $FF;
    exit;
  end;
  l := 16;
  if level > 0 then
    c := level
  else
    c := (256 - al) or $8000;
end;

procedure EncodeYDC(i: integer; var l, c: integer);
var
  a, l1, mask: integer;
begin
  a := abs(i);
  if a > 255 then
    raise exception.create('Invalid DC difference');
  l1 := dcaddlen[a];
  l := ylen[l1];
  c := ycode[l1];
  if i = 0 then
    exit;
  mask := not ($7FFFFFFF shl l1);
  c := c shl l1;
  l := l + l1;
  if i > 0 then
    c := c or (a and mask)
  else
    c := c or ((not a) and mask);
end;

procedure EncodeCDC(i: integer; var l, c: integer);
var
  a, l1, mask: integer;
begin
  a := abs(i);
  if a > 255 then
    raise exception.create('Invalid DC difference');
  l1 := dcaddlen[a];
  l := clen[l1];
  c := ccode[l1];
  if i = 0 then
    exit;
  mask := not ($7FFFFFFF shl l1);
  c := c shl l1;
  l := l + l1;
  if i > 0 then
    c := c or (a and mask)
  else
    c := c or ((not a) and mask);
end;

procedure EncodeAC(run, level: integer; var l, c: integer);
var
  i, al: integer;
begin
  al := abs(level);
  for i := 0 to NDCTMAX - 1 do
  begin
    if (huffac[i, HAC_RUN] <> run) or (huffac[i, HAC_LEVEL] <> al) then
      continue;
    l := huffac[i, HAC_LCODE];
    c := huffac[i, HAC_CODE];
    if i = 0 then
      exit;
    inc(l);
    c := c shl 1;
    if level < 0 then
      c := c + 1;
    exit;
  end;
  LevelEscape(level, l, c);
  c := c + (run + 64) shl l;
  l := l + 6 + 6;
end;

procedure RunLevel(const vin: array of integer; var rout, lout: array of integer);
var
  i, run, pos, k: integer;
begin
  run := 0;
  pos := 1;
  for i := 1 to 63 do
  begin
    k := zigzag[i];
    if vin[k] <> 0 then
    begin
      rout[pos] := run;
      lout[pos] := vin[k];
      run := 0;
      inc(pos);
      continue;
    end;
    inc(run);
  end;
  if pos > 63 then
    exit;
  rout[pos] := 255;
  lout[pos] := 0;
end;

function EncodeBlock(quant, lastdc: integer; var datain, datac, datal:
  array of integer; color: boolean): integer;
var
  i, v, l, c, qu, currdc: integer;
begin
  FastDct(@datain);
  for i := 0 to 63 do
  begin
    if i = 0 then
      qu := 8 * quantmatrix[i]
    else
      qu := quant * quantmatrix[i];
    v := datain[i] * 8; // prepare rounding
    if v > 0 then
      v := v + qu div 2;
    if v < 0 then
      v := v - qu div 2;
    v := v div qu;
    if v > 255 then
      v := 255;
    if v < -255 then
      v := -255;
    datain[i] := v;
  end;
  RunLevel(datain, datac, datal);
  i := 1;
  repeat
    EncodeAC(datac[i], datal[i], l, c);
    datal[i] := l;
    datac[i] := c;
    inc(i);
  until (datac[i - 1] = 2) and (datal[i - 1] = 2) or (i > 63);
  currdc := datain[0];
  if not color then
    EncodeYDC(currdc - lastdc, datal[0], datac[0])
  else
    EncodeCDC(currdc - lastdc, datal[0], datac[0]);
  result := currdc;
end;

{ TMpegStream}

procedure TMpegStream.AssignStream(stout: TStream);
var
  i: integer;
begin
  st := stout;
  pos := 0;
  bitmask := 128;
  for i := 0 to bufsize - 1 do
    buffer[i] := 0;
end;

procedure TMpegStream.Flush;
var
  i: integer;
begin
  if (pos = 0) and (bitmask = 128) then
    exit;
  st.WriteBuffer(buffer, pos + 1);
  for i := 0 to bufsize - 1 do
    buffer[i] := 0;
  pos := 0;
  bitmask := 128;
end;

procedure TMpegStream.WriteBit(b: integer);
begin
  if bitmask = 0 then
  begin
    bitmask := 128;
    if pos = bufsize - 1 then
      flush
    else
      inc(pos);
  end;
  if b <> 0 then
    buffer[pos] := buffer[pos] or bitmask;
  bitmask := bitmask shr 1;
end;

procedure TMpegStream.WriteEnd;
begin
  WriteNumber($00000000, 32);
  while bitmask <> 0 do
    WriteBit(0);
  WriteNumber($000001B7, 32);
end;

procedure TMpegStream.WriteGopHeader(nframe, freq: integer);
var
  h, m, s: integer;
begin
  h := nframe div (freq * 3600);
  dec(nframe, h * freq * 3600);
  m := nframe div (freq * 60);
  dec(nframe, m * freq * 60);
  s := nframe div freq;
  dec(nframe, s * freq);
  while bitmask <> 0 do
    WriteBit(0);
  WriteNumber($000001B8, 32);
  WriteBit(0); // drop
  WriteNumber(h, 5); // hours
  WriteNumber(m, 6); // min
  WriteBit(1); // marker
  WriteNumber(s, 6); // sec
  WriteNumber(nframe, 6); // picture
  WriteBit(1); // closed_gop
  WriteBit(0); // broken
  WriteNumber($0, 5); // zero_padding
  counter := 0;
end;

procedure TMpegStream.WriteNumber(n, bits: integer);
var
  i, mask: integer;
begin
  if bits <= 0 then
    exit;
  mask := 1;
  if bits > 1 then
    mask := mask shl (bits - 1);
  for i := 0 to bits - 1 do
  begin
    WriteBit(n and mask);
    n := n shl 1;
  end;
end;

procedure TMpegStream.WritePictureHeader(pframe: boolean);
begin
  lastx := 0;
  lasty := 0;
  lastydc := 128;
  lastcrdc := 128;
  lastcbdc := 128;
  while bitmask <> 0 do
    WriteBit(0);
  WriteNumber($00000100, 32);
  WriteNumber(counter, 10); // temporal index in gop
  inc(counter);
  if not pframe then
  begin
    WriteNumber($1, 3); // picture type I
    WriteNumber($FFFF, 16); // vbv
    WriteNumber($0, 3); // stuffing
    exit;
  end;
  WriteNumber($2, 3); // picture type P
  WriteNumber($FFFF, 16); // vbv
  WriteBit(1); // full pel
  WriteNumber($1, 3); // forward f-code
  WriteNumber($0, 7); // stuffing
end;

procedure TMpegStream.ReplicatePicture(blocks, n: integer);
var
  i, b: integer;
begin
  for i := 0 to n - 1 do
  begin
    b := blocks;
    while bitmask <> 0 do
      WriteBit(0);
    WriteNumber($00000100, 32);
    lastx := 0;
    lasty := 0;
    WriteNumber(counter, 10); // temporal index in gop
    inc(counter);
    WriteNumber($2, 3); // picture type P
    WriteNumber($FFFF, 16); // vbv
    WriteBit(1); // full pel
    WriteNumber($1, 3); // forward f-code
    WriteNumber($0, 7); // stuffing
    WriteNumber($00000101, 32);
    WriteNumber($1, 5); // quantization
    WriteBit(0); // extra info
    repeat
      WritePMacroBlock(0, 0);
      dec(b);
      if b > 34 then
      begin
        dec(b, 33);
        WriteNumber($8, 11);
      end;
    until b = 0;
  end;
end;

procedure TMpegStream.WriteSequenceHeader(width, height, freq: integer);
begin
  WriteNumber($000001B3, 32);
  WriteNumber(width, 12);
  WriteNumber(height, 12);
  WriteNumber($1, 4); // aspect ratio
  WriteNumber(freq, 4); // frequency
  WriteNumber($FFFFFF, 18); // bit rate
  WriteBit(1); // marker
  WriteNumber($20, 10); // buffer size
  WriteBit(0); // constrained
  WriteBit(0); // no lum matrix
  WriteBit(0); // no chro matrix
end;

procedure TMpegStream.WriteSliceHeader(quantization: integer);
begin
  WriteNumber($00000101, 32);
  WriteNumber(quantization, 5);
  WriteBit(0); // extra info
end;

procedure TMpegStream.WriteVector(x, y: integer);
var
  dx, dy: integer;
begin
  dx := x - lastx;
  dy := y - lasty;
  lastx := x;
  lasty := y;
  if dx < -16 then
    inc(dx, 32);
  if dx > 16 then
    dec(dx, 32);
  if dy < -16 then
    inc(dy, 32);
  if dy > 16 then
    dec(dy, 32);
  WriteNumber(dmcode[dx + 16], dmlen[dx + 16]); // motion_h_f_code
  WriteNumber(dmcode[dy + 16], dmlen[dy + 16]); // motion_v_f_code
end;

procedure TMpegStream.WriteBlock(block: array of integer;
  quantization, kind: integer);
var
  i, lastdc: integer;
  datac, datal: array[0..63] of integer;
begin
  lastx := 0;
  lasty := 0;
  case kind of
    0: lastdc := lastydc;
    1: lastdc := lastcbdc;
    2: lastdc := lastcrdc;
  else
    raise exception.Create('Wrong block kind');
  end;
  lastdc := EncodeBlock(quantization, lastdc, block, datac, datal, kind <> 0);
  for i := 0 to 63 do
  begin
    if (datac[i] = 2) and (datal[i] = 2) then
      break;
    WriteNumber(datac[i], datal[i]);
  end;
  WriteNumber(2, 2);
  case kind of
    0: lastydc := lastdc;
    1: lastcbdc := lastdc;
    2: lastcrdc := lastdc;
  end;
end;

procedure TMpegStream.WritePMacroBlock(x, y: integer);
begin
  lastydc := 128;
  lastcrdc := 128;
  lastcbdc := 128;
  WriteBit(1); // 1_increment
  WriteNumber($1, 3); // type
  WriteVector(x, y);
end;

const
  BIGERROR = 999888777;

  { TBwImage }

procedure TImageBW.DibAlloc(x, y: integer);
begin
  freemem(pixpointer);
  getmem(pixpointer, x * (y + 1));
end;

constructor TImageBW.Create;
begin
  inherited Create;
  getmem(pixpointer, 4096);
  height := 64;
  width := 64;
  truewidth := 64;
  trueheight := 64;
end;

destructor TImageBW.Destroy;
begin
  freemem(pixpointer);
  inherited Destroy;
end;

procedure TImageBW.SetSize(x, y: integer);
begin
  if (x = width) and (y = height) then
    exit;
  width := x;
  height := y;
  truewidth := (x + 15) and $FFF0;
  trueheight := (y + 15) and $FFF0;
  diballoc(truewidth, trueheight);
end;

procedure TImageBW.Clear;
begin
  ZeroMemory(pixpointer, truewidth * trueheight);
end;

procedure TImageBW.Setpixel(x, y, v: integer);
begin
  if x < 0 then
    x := 0;
  if y < 0 then
    y := 0;
  if x >= width then
    x := width - 1;
  if y >= height then
    y := height - 1;
  pixpointer[x + y * truewidth] := v;
end;

procedure TImageBW.Addpixel(x, y, v: integer);
begin
  if x < 0 then
    x := 0;
  if y < 0 then
    y := 0;
  if x >= width then
    x := width - 1;
  if y >= height then
    y := height - 1;
  pixpointer[x + y * truewidth] := (pixpointer[x + y * truewidth] + v) shr 1;
end;

function TImageBW.Getpixel(x, y: integer): byte;
begin
  if x < 0 then
    x := 0;
  if y < 0 then
    y := 0;
  if x >= width then
    x := width - 1;
  if y >= height then
    y := height - 1;
  result := pixpointer[x + y * truewidth];
end;

procedure TImageBW.OpenTGA(filename: string);
var
  f: file;
  x, y: word;
begin
  assignfile(f, filename);
  filemode := 0;
  reset(f, 1);
  seek(f, 12);
  blockread(f, x, 2);
  blockread(f, y, 2);
  seek(f, 18);
  setsize(x, y);
  blockread(f, pixpointer^, x * y);
  closefile(f);
end;

procedure TImageBW.Get8x8block(x, y: integer; var block: array of integer);
var
  offs, n, i, j: integer;
begin
  n := 0;
  offs := x + y * truewidth;
  for j := 0 to 7 do
  begin
    for i := 0 to 7 do
    begin
      block[n] := pixpointer[offs + i];
      inc(n);
    end;
    inc(offs, truewidth);
  end;
end;

function TImageBW.CompareBlockFull(x, y, x1, y1: integer; cimage: TimageBW): integer;
var
  s, i, j, v: integer;
begin
  if (x1 < 0) or (y1 < 0) or (x1 + 15 >= width) or (y1 + 15 >= height) then
  begin
    result := BIGERROR;
    exit;
  end;
  s := 0;
  for j := 0 to 15 do
    for i := 0 to 15 do
    begin
      v := getpixel(x + i, y + j) - cimage.getpixel(x1 + i, y1 + j);
      s := s + v * v;
    end;
  result := s;
end;

function TImageBW.BlockSDV(x, y: integer): integer;
var
  s, i, j, v, m: integer;
begin
  if (x < 0) or (y < 0) or (x + 15 >= width) or (y + 15 >= height) then
  begin
    result := 0;
    exit;
  end;
  m := 0;
  for j := 0 to 15 do
    for i := 0 to 15 do
      m := m + getpixel(x + i, y + j);
  m := m div 256;
  s := 0;
  for j := 0 to 15 do
    for i := 0 to 15 do
    begin
      v := getpixel(x + i, y + j) - m;
      s := s + v * v;
    end;
  result := s div 256;
end;

procedure TImageBW.FindMotion(cimage: TimageBW; x, y: integer; var dx, dy,
  err: integer);
var
  dx1, dy1, e: integer;
const
  offs: integer = 4;
begin
  dx := 0;
  dy := 0;
  err := BIGERROR;
  for dy1 := -offs to offs do
    for dx1 := -offs to offs do
    begin
      e := CompareBlockFull(x, y, x + dx1, y + dy1, cimage);
      inc(e, (abs(dx1) + abs(dy1)) shl 4);
      if e >= err then
        continue;
      dx := dx1;
      dy := dy1;
      err := e;
    end;
end;

{ TMpegImage }

function TMpegImage.Blocks: integer;
begin
  result := iy.truewidth * iy.trueheight div 256;
end;

constructor TMpegImage.Create;
begin
  inherited;
  iy := timagebw.Create;
  icr := timagebw.Create;
  icb := timagebw.Create;
end;

destructor TMpegImage.Destroy;
begin
  iy.free;
  icr.free;
  icb.free;
  inherited;
end;

procedure TMpegImage.EncodeIMacroBlock(st: tmpegstream; x, y, quantization: integer;
  color: boolean);
var
  block: array[0..63] of integer;
begin
  iy.get8x8block(x, y, block);
  st.writeblock(block, quantization, 0);
  iy.get8x8block(x + 8, y, block);
  st.writeblock(block, quantization, 0);
  iy.get8x8block(x, y + 8, block);
  st.writeblock(block, quantization, 0);
  iy.get8x8block(x + 8, y + 8, block);
  st.writeblock(block, quantization, 0);
  if color then
  begin
    icb.get8x8block(x div 2, y div 2, block);
    st.writeblock(block, quantization, 1);
    icr.get8x8block(x div 2, y div 2, block);
    st.writeblock(block, quantization, 2);
  end
  else
  begin
    st.WriteNumber($0, 2);
    st.WriteNumber($2, 2);
    st.WriteNumber($0, 2);
    st.WriteNumber($2, 2);
  end;
end;

procedure TMpegImage.EncodeIMPEG(quantization: integer; color: boolean;
  st: tmpegstream);
var
  x, y, bx, by: integer;
begin
  st.WritePictureHeader(false);
  st.WriteSliceHeader(quantization);
  bx := iy.width div 16;
  by := iy.height div 16;
  for y := 0 to by - 1 do
    for x := 0 to bx - 1 do
    begin
      st.WriteBit(1); // 1_increment
      st.WriteBit(1); // intra-d
      EncodeIMacroblock(st, x * 16, y * 16, quantization, color);
    end;
end;

procedure TMpegImage.EncodePMPEG(quantization, tolerance: integer; pimage: TMpegImage;
  st: tmpegstream);
var
  x, y, dx, dy, err: integer;
begin
  st.WritePictureHeader(true);
  st.WriteSliceHeader(quantization);
  for y := 0 to iy.trueheight div 16 - 1 do
    for x := 0 to iy.truewidth div 16 - 1 do
    begin
      iy.FindMotion(pimage.iy, x * 16, y * 16, dx, dy, err);
      if (err <= tolerance) or
        ((err <= tolerance * 4) and (iy.BlockSDV(x * 16, y * 16) > 64))
        then
        st.WritePMacroBlock(dx, dy)
      else
      begin
        st.WriteBit(1);
        st.WriteNumber($3, 5);
        EncodeIMacroBlock(st, x * 16, y * 16, quantization, true);
      end;
    end;
end;

function TMpegImage.Height: integer;
begin
  result := iy.height;
end;

procedure TMpegImage.OpenTGA(filename: string);
var
  dimx, dimy: word;
  f: file;
  x, y, r, g, b, r1, g1, b1: integer;
  temp: array[0..999] of byte;
begin
  assignfile(f, filename);
  filemode := 0;
  reset(f, 1);
  seek(f, 12);
  blockread(f, dimx, 2);
  blockread(f, dimy, 2);
  seek(f, 18);
  SetSize(dimx, dimy);
  r1 := 0;
  g1 := 0;
  b1 := 0;
  for y := dimy - 1 downto 0 do
  begin
    blockread(f, temp, dimx * 3);
    for x := 0 to dimx - 1 do
    begin
      r := temp[x * 3 + 2];
      g := temp[x * 3 + 1];
      b := temp[x * 3];
      iy.setpixel(x, y, RGBtoY(r, g, b));
      if not odd(x) then
      begin
        r1 := r;
        g1 := g;
        b1 := b;
      end
      else
      begin
        r := (r + r1) shr 1;
        g := (g + g1) shr 1;
        b := (b + b1) shr 1;
        icb.setpixel(x div 2, y div 2, RGBtoCB(r, g, b));
        icr.setpixel(x div 2, y div 2, RGBtoCR(r, g, b));
      end;
    end;
  end;
  closefile(f);
end;

procedure TMpegImage.AssignBMP(bmp: TBitmap; pf: TPixelFormat);
var
  dimx, dimy, x, y, r, g, b, r1, g1, b1, offs, k: integer;
  line: pbytearray;
begin
  if pf = pf32bit then
    k := 4
  else
    k := 3;
  dimx := bmp.Width;
  dimy := bmp.Height;
  SetSize(dimx, dimy);
  r1 := 0;
  g1 := 0;
  b1 := 0;
  for y := dimy - 1 downto 0 do
  begin
    line := bmp.ScanLine[y];
    for x := 0 to dimx - 1 do
    begin
      offs := x * k;
      r := line[offs + 2];
      g := line[offs + 1];
      b := line[offs];
      iy.setpixel(x, y, RGBtoY(r, g, b));
      if not odd(x) then
      begin
        r1 := r;
        g1 := g;
        b1 := b;
      end
      else
      begin
        r := (r + r1) shr 1;
        g := (g + g1) shr 1;
        b := (b + b1) shr 1;
        icb.setpixel(x div 2, y div 2, RGBtoCB(r, g, b));
        icr.setpixel(x div 2, y div 2, RGBtoCR(r, g, b));
      end;
    end;
  end;
end;

procedure TMpegImage.OpenTGABW(filename: string);
begin
  iy.OpenTGA(filename);
  icb.SetSize(iy.width div 2, iy.height div 2);
  icr.SetSize(iy.width div 2, iy.height div 2);
end;

function TMpegImage.RGBtoCB(r, g, b: integer): integer;
begin
  result := 128 + (-21 * r - 42 * g + 63 * b) div 128;
end;

function TMpegImage.RGBtoCR(r, g, b: integer): integer;
begin
  result := 128 + (63 * r - 53 * g - 10 * b) div 128;
end;

function TMpegImage.RGBtoY(r, g, b: integer): integer;
const
  c = 220 / 256;
begin
  result := 16 + round((0.30 * c) * r + (0.59 * c) * g + (0.11 * c) * b);
end;

procedure TMpegImage.SetSize(x, y: integer);
begin
  iy.SetSize(x, y);
  icb.SetSize(x div 2, y div 2);
  icr.SetSize(x div 2, y div 2);
end;

function TMpegImage.Width: integer;
begin
  result := iy.width;
end;

const
  FramesPerSec: array[TBaseFrequency] of integer =
  (24, 24, 25, 30, 30, 50, 60, 60);

  { TMpeg }

constructor TMpeg.Create;
begin
  im1 := TMpegImage.Create;
  im2 := TMpegImage.Create;
  mps := TMpegStream.Create;
  initialized := false;
end;

destructor TMpeg.Destroy;
begin
  mps.Free;
  im2.Free;
  im1.Free;
  inherited;
end;

procedure TMpeg.Open(Width, Height, Quantization, Tolerance: integer;
  BaseFreq: TBaseFrequency; OutStream: TStream);
begin
  if (Width < 1) or (Width > 4095) or (Height < 1) or (Height > 4095)
    or (Quantization < 0) or (Quantization > 31) or initialized
    then
    raise exception.Create('MPEGPas initialization failed.'#13 +
      'Check the input parameters.');
  im1.SetSize(Width, Height);
  im2.SetSize(Width, Height);
  mps.AssignStream(OutStream);
  mps.WriteSequenceHeader(Width, Height, ord(BaseFreq) + 1);
  mps.WriteGopHeader(0, 1);
  pquantization := Quantization;
  ptolerance := Tolerance;
  frameSec := FramesPerSec[BaseFreq];
  frameCnt := 0;
  initialized := true;
end;

procedure TMpeg.AddIImage(bm: TBitmap);
begin
  if not initialized then
    raise exception.Create('MPEGPas not initialized');
  if (bm.Height <> im1.Height) or (bm.Width <> im1.Width) then
    raise exception.Create('MPEGPas: Bitmap has different size');
  if not (bm.PixelFormat in [pf24bit, pf32bit]) then
    raise exception.Create('MPEGPas: Bitmap must be 24 or 32 bit');
  im1.AssignBMP(bm, bm.pixelformat);
  if frameCnt > frameSec then
  begin
    //frameCnt := -1;
    mps.WriteGopHeader(frameCnt, frameSec);
  end;
  im1.EncodeIMPEG(pquantization, true, mps);
  inc(frameCnt);
end;

procedure TMpeg.AddPImage(bm: TBitmap);
var
  t: TMpegImage;
begin
  if not initialized then
    raise exception.Create('MPEGPas not initialized');
  if (bm.Height <> im1.Height) or (bm.Width <> im1.Width) then
    raise exception.Create('MPEGPas: Bitmap has different size');
  if not (bm.PixelFormat in [pf24bit, pf32bit]) then
    raise exception.Create('MPEGPas: Bitmap must be 24 or 32 bit');
  t := im2;
  im2 := im1;
  im1 := t;
  im1.AssignBMP(bm, bm.pixelformat);
  im1.EncodePMPEG(pquantization, ptolerance, im2, mps);
  inc(frameCnt);
end;

procedure TMpeg.Keep(nframes: integer);
begin
  mps.ReplicatePicture(im1.blocks, nframes);
  inc(frameCnt, nframes);
end;

procedure TMpeg.Close;
begin
  if not initialized then
    exit;
  initialized := false;
  mps.WriteEnd;
  mps.Flush;
end;
end.

