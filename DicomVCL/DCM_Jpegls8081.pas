{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_Jpegls8081;

interface
uses classes, sysutils, dialogs, math,windows;
const
  Uint8_MAX = 255;
  Uint16_MAX = 65535;
  Uint32_MAX = 4294967295;

  Int8_MIN = -128;
  Int8_MAX = 127;
  Int16_MIN = -32768;
  Int16_MAX = 32767;
  Int32_MIN_1 = -2147483647;

  Int32_MAX = 2147483647;
const
  J_rm2: array[0..31] of Word = (0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3,
    4, 4, 5, 5, 6, 6, 7, 7, 8, 9, 10, 11, 12, 13, 14, 15);
  J_rm: array[0..31] of Word = (1, 1, 1, 1, 2, 2, 2, 2, 4, 4, 4, 4, 8, 8, 8,
    8, 16, 16, 32, 32, 64, 64, 128, 128, 256, 512, 1024, 2048, 4096, 8192, 16384,
    32768);
  JPEG_MARKER_DNL: Word = 65500;
  JPEG_MARKER_EOI: Word = 65497;
  JPEG_MARKER_SOI: Word = 65496;
  JPEG_MARKER_SOS: Word = 65498;

  // New for JPEG-LS (14495-1:1997)

  JPEG_MARKER_SOF55: Word = 65527;
  JPEG_MARKER_LSE: Word = 65528;

  JPEG_LSE_ID_L1: byte = 1;
  JPEG_LSE_ID_L2: byte = 2;
  JPEG_LSE_ID_L3: byte = 3;
  JPEG_LSE_ID_L4: byte = 4;
  u1ul = 1;
  nContexts = 365; // plus two more run mode interruption contexts

  MIN_C = -128; // Limits on values in bias correction array C
  MAX_C = 127;

  BASIC_T1 = 3;
  BASIC_T2 = 7;
  BASIC_T3 = 21;

type
  uintA = array of longword;
  inta = array of Integer;
  uint16A = array of Word;

  Endian = (NoEndian, LittleEndian, BigEndian, ByteEndian);
  HostEndian = class
  private
    endia: endian;
  public
    constructor create();
    function Endian(): endian;
    function isLittleEndian(): boolean;
    function isBigEndian(): boolean;
  end;

  TBinaryStream = class(TMemoryStream)
  private
    endiann: Endian;
    buffer: array[0..3] of Byte;
    swapped32big: boolean;
  public
    constructor create(buf: integer; e: endian = noendian); overload;
    constructor create(istr: tstream; e: endian = noendian); overload;
    function isBigEndian(): boolean;
    function isLittleEndian(): boolean;
    function isSwapped32Big(): boolean;
    function getEndian(): endian;
    procedure setEndian(e: Endian = LittleEndian);
    procedure setSwapped32Big();
    function read8(): byte;
    function read16(): Word;
    function read32(): longword;

    procedure write8(u: byte);
    procedure write16(u: Word);
    procedure write32(u: longword);

  end;

  TJpegLS8081 = class
  private
    readBitByteOffset: longword;
    readBitCount: Word;
    readBitByte: byte;
    readForwardByte: byte;
    readHaveForwardByte: boolean;

    writeBitByteOffset: longword;
    writeBitCount: Word;
    writeBitByte: byte;
  protected
    function readRow(inn: TBinaryStream; buffer: pword; n: longword; bpp:
      Word): longword;
    procedure writeRow(outt: TBinaryStream; buffer: pword; n: longword; bpp:
      Word);

    procedure writeBit(outt: TBinaryStream; bit: longword);
    procedure writeBitFlush(outt: TBinaryStream);
    procedure write16BE(outt: TBinaryStream; WORDd: Word);
    procedure write8(outt: TBinaryStream; BYT: BYTE);

    function readBit(inn: TBinaryStream; var bit: longword): Boolean;
    function read16BE(inn: TBinaryStream; var VALUE: Word): Boolean;
    function Read8(INN: TBinaryStream; var BYT: BYTE): Boolean;

    procedure writeSOF55(outt: TBinaryStream; p: Word; rows, columns: Word);
    procedure writeSOI(outt: TBinaryStream);

    procedure writeSOS(outt: TBinaryStream; nearr: Word);
    procedure writeLSE1(outt: TBinaryStream; MAXVAL: Word; t1, t2, t3, RESET: Word);

    procedure writeEOI(outt: TBinaryStream);
    function readJPEGMarker(inn: TBinaryStream; MARKER: Word): Boolean;
    function readSOI(inn: TBinaryStream; MARKER: Word): Boolean;

    function readSOF55(inn: TBinaryStream; var marker, p: Word; var rowss, columnss: longword):
      Boolean;
    function readSOs(inn: TBinaryStream; var marker, nearr: Word): boolean;
    function readLSE1(inn: TBinaryStream; var marker: Word; var MAXVAL: longword; var
      T1, T2, T3, RESET: Word): boolean;

    function determineGolombParameter(N, A: longword): Word;
    function decodeMappedErrvalWithGolomb(k, glimit, qbpp: Word; var value:
      longword; inn: TBinaryStream): Boolean;

    procedure encodeMappedErrvalWithGolomb(k, glimit, qbpp: Word; value:
      longword; outt: TBinaryStream);
    procedure quantizeErrval(nearr: Word; errval: integer);
    procedure dequantizeErrval(nearr: Word; errval: integer);
    procedure clampPredictedValue(x, maxval: integer);
    procedure codecRunEndSample(ix: Word; ra, rb, range: integer; nearr: Word;
      maxval: longword; reset, limit, qbpp, rk: Word; a, n, nn: pinteger; inn:
      TBinaryStream; outt: TBinaryStream; decompressing: boolean);

  public
    constructor Create;
    destructor Destroy; override;

    function Execute: integer;
  end;
implementation

constructor TBinaryStream.create(buf: integer; e: endian);
begin
  endiann := e;
  swapped32big := false;
end;

constructor TBinaryStream.create(istr: tstream; e: endian);
begin
  endiann := e;
  swapped32big := false;
end;

function TBinaryStream.getEndian: endian;
begin
  result := endiann;
end;

function TBinaryStream.isBigEndian: boolean;
begin
  Result := endiann = bigendian;
end;

function TBinaryStream.isLittleEndian: boolean;
begin
  Result := endiann = Littleendian;
end;

function TBinaryStream.isSwapped32Big: boolean;
begin

  result := swapped32big;
end;

function TBinaryStream.read8: byte;
var
  u: byte;
begin
  Assert(endiann <> NoEndian);

  read(u, 1);
  result := u;
end;

function TBinaryStream.read16: Word;
var
  u: Word;
begin
  Assert(endiann <> NoEndian);

  read(buffer, 2);
  if (isbigendian) then
  begin
    u := buffer[0];
    u := u shl 8;
    u := u or buffer[1];
  end
  else
  begin
    u := buffer[1];
    u := u shl 8;
    u := u or buffer[0];
  end;
  result := u;

end;

procedure TBinaryStream.setEndian(e: Endian);
begin
  endiann := e;
end;

procedure TBinaryStream.setSwapped32Big;
begin
  swapped32big := true;
end;

function TBinaryStream.read32: longword;
var
  u: longword;
  //  g: longint;
begin
  Assert(endiann <> NoEndian);

  read(buffer, 4);
  if (isbigendian) then
  begin
    if swapped32big then
    begin
      u := buffer[2];
      u := u shl 8;
      u := u or buffer[3];
      u := u shl 8;
      u := u or buffer[0];
      u := u shl 8;
      u := u or buffer[1];
    end
    else
    begin
      u := buffer[0];
      u := u shl 8;
      u := u or buffer[1];
      u := u shl 8;
      u := u or buffer[2];
      u := u shl 8;
      u := u or buffer[3];
    end;

  end
  else
  begin
    u := buffer[3];
    u := u shl 8;
    u := u or buffer[2];
    u := u shl 8;
    u := u or buffer[1];
    u := u shl 8;
    u := u or buffer[0];
  end;
  result := u;
end;

procedure TBinaryStream.write8(u: byte);
begin
  Assert(endiann <> NoEndian);
  write(u, 1);
end;

procedure TBinaryStream.write16(u: Word);
begin
  Assert(endiann <> NoEndian);
  if isbigEndian then
  begin
    buffer[0] := u shr 8;
    buffer[1] := u;
  end
  else
  begin
    buffer[1] := u shr 8;
    buffer[0] := u;
  end;
  write(buffer, 2);
end;

procedure TBinaryStream.write32(u: longword);
begin
  Assert(endiann <> NoEndian);
  if isbigEndian then
  begin
    buffer[0] := u shr 24;
    buffer[1] := u shr 16;
    buffer[2] := u shr 8;
    buffer[3] := u;
  end
  else
  begin
    buffer[3] := u shr 24;
    buffer[2] := u shr 16;
    buffer[1] := u shr 8;
    buffer[0] := u;
  end;
  write(buffer, 4);
end;

constructor HostEndian.create;
var
  itemp: pbyte;
  i: Word;
begin
  i := 0;
  itemp := @i;
  itemp^ := 1;
  if i = 1 then
    endia := LittleEndian
  else
    endia := BigEndian;
end;

function HostEndian.Endian: endian;
begin
  result := endia;
end;

function HostEndian.isBigEndian: boolean;
begin
  if endia = Bigendian then
    result := true
  else
    result := false;

end;

function HostEndian.isLittleEndian: boolean;
begin
  if endia = littleendian then
    result := true
  else
    result := false;
end;

function TJpegLS8081.readBit(inn: TBinaryStream; var bit: longword): Boolean;
begin
  assert((readBitCount >= 0));
  if readBitCount < 1 then
  begin
    readBitByteOffset := readBitByteOffset + 1;
    if readHaveForwardByte then
    begin
      readHaveForwardByte := false;
      readBitByte := readForwardByte;
      readBitCount := 7;
    end
    else
    begin
      inn.Read(readBitByte, 1);
      if readBitByte = $FF then
      begin
        Assert(readHaveForwardByte = false);
        inn.Read(readForwardByte, 1);
        if inn.Position < inn.Size then
        begin
          if ((readForwardByte and $80) = 0) then
          begin
            // stuffed zero bit after valid 0xff
            readHaveForwardByte := true;
            // the valid 0xff is already in readBitByte
            readBitCount := 8;
          end
          else
          begin
            // marker segment
            // marker identifier is 0xff00+readForwardByte
            raise Exception.Create('readBitByte=' + inttostr(readbitbyte) + #13#10 +
              'readForwardByte=' + inttostr(readForwardByte));
            //assert(false);
          end;
        end
        else
        begin
          readBitCount := 0; // just in case ... will trigger assertion next time
          result := inn.Position < inn.Size;
          exit;
        end;
      end
      else
      begin
        readBitCount := 8;
      end;
    end;
  end;
  dec(readbitcount);
  bit := (readBitByte shr readbitcount) and 1;
  result := inn.Position < inn.Size;
end;

function TJpegLS8081.readRow(inn: TBinaryStream; buffer: pword;
  n: longword; bpp: Word): longword;
var
  count: longword;
begin
  count := 0;
  if bpp <= 8 then
  begin
    while ((n <> 0) and (inn.Position < inn.Size)) do
    begin
      dec(n);
      buffer^ := inn.read8;
      inc(buffer);
      if (inn.Position >= inn.Size) then
        inc(count);
    end;
  end
  else
  begin
    while ((n <> 0) and (inn.Position < inn.Size)) do
    begin
      dec(n);
      buffer^ := inn.read16;
      inc(buffer);
      if (inn.Position >= inn.Size) then
        inc(count);
    end;
  end;
  if ((inn.position >= inn.Size)) then
    result := count
  else
    result := 0;
end;

procedure TJpegLS8081.write16BE(outt: TBinaryStream;
  WORDd: Word);
var
  byt: byte;
begin
  byt := wordd shr 8;
  outt.write(byt, 1);
  byt := wordd and $FF;
  outt.write(byt, 1);
end;

procedure TJpegLS8081.writeBit(outt: TBinaryStream;
  bit: longword);
begin
  Assert(writeBitCount < 8);
  writeBitByte := writeBitByte shl 1;
  if (bit <> 0) then
    writeBitByte := writeBitByte or 1;
  inc(writeBitByte);

  if writeBitByte >= 8 then
  begin
    inc(writeBitByteOffset);
    outt.write(writeBitByte, 1);
    if writeBitByte = $FF then
      writeBitCount := 1
    else
      writeBitCount := 0;
    writeBitByte := 0;
  end;
end;

procedure TJpegLS8081.writeRow(outt: TBinaryStream; buffer: pword;
  n: longword; bpp: Word);
var
  b1: PByte;
begin
  b1 := PByte(buffer);
  if bpp <= 8 then
  begin
    while ((n <> 0)) do
    begin
      dec(n);
      outt.write8(b1^);
      inc(b1);
    end;
  end
  else
  begin
    while ((n <> 0)) do
    begin
      dec(n);
      outt.write16(buffer^);
      inc(buffer);
    end;
  end;
end;

procedure TJpegLS8081.writeBitFlush(
  outt: TBinaryStream);
begin
  Assert(writeBitCount < 8);
  writeBitByte := writeBitByte shl (8 - writeBitCount);
  outT.write(writeBitByte, 1);
  writeBitByte := 0;
  writeBitCount := 0;
end;

function TJpegLS8081.read16BE(inn: TBinaryStream;
  var VALUE: Word): Boolean;
var
  byt: byte;
begin
  byt := inn.read8;
  value := byt shl 8;
  byt := inn.read8;
  value := value or byt;
  result := inn.Position < inn.Size;
end;

function TJpegLS8081.Read8(INN: TBinaryStream; var BYT: BYTE): Boolean;
begin
  byt := inn.read8;
  result := inn.Position < inn.Size;
end;

procedure TJpegLS8081.write8(outt: TBinaryStream;
  BYT: BYTE);
begin
  outt.write(byt, 1);
end;

procedure TJpegLS8081.writeSOI(
  outt: TBinaryStream);
begin
  write16BE(outt, JPEG_MARKER_SOI);
end;

procedure TJpegLS8081.writeSOF55(outt: TBinaryStream; p, rows,
  columns: Word);
begin
  write16BE(outt, JPEG_MARKER_SOF55);
  write16BE(outt, 11); // length (inclusive of self)

  Assert(P < 256);
  write8(outt, byte(P)); // sample precision
  write16BE(outt, ROWS); // Y - number of lines
  write16BE(outt, COLUMNS); // X - number of samples per line

  write8(outt, 1); // one component per frame only

  write8(outt, 1); // component identifier is 1
  write8(outt, $11); // no horizontal or vertical sampling factor
  write8(outt, 0); // no quantization table used in JPEG-LS

end;

procedure TJpegLS8081.writeSOS(outt: TBinaryStream;
  nearr: Word);
begin
  write16BE(outT, JPEG_MARKER_SOS);
  write16BE(outT, 8); // length (inclusive of self)

  write8(outT, 1); // one component per scan only

  write8(outT, 1); // select component 1
  write8(outT, 0); // no mapping table

  Assert(NEARR < 256);
  write8(outT, BYTE(NEARR)); // in place of start of spectral selection
  write8(outT, 0); // ILV - interleave mode is 0 (none)

  write8(outT, 0); // not used in JPEG-LS

end;

procedure TJpegLS8081.writeLSE1(outt: TBinaryStream; MAXVAL, t1, t2,
  t3, RESET: Word);
begin
  write16BE(outT, JPEG_MARKER_LSE);
  write16BE(outT, 13);
  write8(outT, JPEG_LSE_ID_L1);
  write16BE(outT, MAXVAL);
  write16BE(outT, T1);
  write16BE(outT, T2);
  write16BE(outT, T3);
  write16BE(outT, RESET);
end;

procedure TJpegLS8081.writeEOI(
  outt: TBinaryStream);
begin
  write16BE(outt, JPEG_MARKER_EOI);
end;

function TJpegLS8081.readJPEGMarker(inn: TBinaryStream;
  MARKER: Word): Boolean;
begin
  if ((read16BE(inn, marker)) and
    ((marker and $FF80) <> 0)) then
    result := true
  else
    result := false;
end;

function TJpegLS8081.readSOI(inn: TBinaryStream;
  MARKER: Word): Boolean;
begin
  Result := marker = JPEG_MARKER_SOI;
end;

function TJpegLS8081.readSOF55(inn: TBinaryStream; var marker, p: Word; var rowss, columnss:
  longword): Boolean;
var
  length, rows, columns: Word;
  precision, ncomponents, componentid, hvsampling, quanttable: byte;
begin
  ncomponents := 0;
  componentid := 0;
  hvsampling := 0;
  quanttable := 0;
  precision := 0;
  rows := 0;
  columns := 0;
  result := false;
  if ((marker = JPEG_MARKER_SOF55) and (read16BE(inn, length)) and (length
    = 11) and (read8(inn, precision)) and (read16BE(inn, rows))
    and (read16BE(inn, columns)) and (read8(inn, ncomponents)) and
    (read8(inn, componentid)) and (read8(inn, hvsampling)) and
    (read8(inn, quanttable))) then
  begin
    if (ncomponents = 1) then
    begin
      P := precision;
      ROWSs := rows;
      columnss := columns;
      result := true;
    end;
  end
  else
  begin
    P := precision;
    ROWSs := rows;
    columnss := columns;
    result := false;
  end;
end;

function TJpegLS8081.readSOs(inn: TBinaryStream; var marker, nearr: Word): boolean;
var
  length: Word;
  mappingtable, ncomponents, componentid, nearrr, ilv, dummy: byte;
begin
  ncomponents := 0;
  componentid := 0;
  mappingtable := 0;
  nearrr := 0;
  ilv := 0;
  dummy := 0;
  result := false;
  if ((marker = JPEG_MARKER_SOS) and (read16be(inn, length)) and
    (read8(inn, ncomponents)) and (read8(inn, componentid)) and
    (read8(inn, mappingtable)) and (read8(inn, componentid)) and
    (read8(inn, nearrr)) and (read8(inn, ilv)) and (read8(inn, dummy)
    )) then
  begin
    if ((ncomponents = 1) and (length = 8)) then
    begin
      nearr := nearrr;
      result := true;
    end;
  end
  else
  begin
    nearr := nearrr;
    result := false;
  end;
end;

function TJpegLS8081.readLSE1(inn: TBinaryStream; var marker: Word;
  var MAXVAL: longword; var T1, T2, T3, RESET: Word): boolean;
var
  length, maxva: Word;
  id: byte;
begin
  length := 0;
  maxva := 0;
  id := 0;
  result := false;
  if ((marker = JPEG_MARKER_LSE) and (read16BE(inn, length)) and
    (read8(inn, id)) and (read16be(inn, maxva)) and (read16be(inn,
    t1)) and (read16be(inn, t2)) and (read16be(inn, t3)) and
    (read16be(inn, reset))) then
  begin
    if ((length > 2) and (id = JPEG_LSE_ID_L1) and (length = 13)) then
    begin
      maxval := maxva;
      result := true;
    end;
  end
  else
  begin
    maxval := maxva;
    result := false;
  end;
end;

function TJpegLS8081.determineGolombParameter(N, A: longword): Word;
var
  k: Word;
begin
  assert(n <> 0);
  k := 0;
  //n := n shl k;
  while (n < a) do
  begin
    assert(k < 31);
    n := n shl k;
    inc(k);
  end;
  result := k;
end;

function TJpegLS8081.decodeMappedErrvalWithGolomb(k, glimit,
  qbpp: Word; var value: longword; inn: TBinaryStream): Boolean;
var
  bit, unarycode, offset: longword;
  bitstoread: Word;
  limit: Word;
begin
  bit := 0;
  unarycode := 0;
  bitstoread := 0;
  limit := 0;
  while ((readBit(inn, bit)) and (bit = 0)) do
  begin
    inc(unarycode);
  end;
  Assert(glimit > qbpp + 1);
  limit := glimit - qbpp - 1;
  if (unarycode < limit) then
  begin
    value := unarycode; // will later get shifted into ms bits
    bitstoread := k;
    offset := 0;
  end
  else
  begin
    value := 0; // no contribution from unary code ... whole value is next
    bitstoread := qbpp;
    offset := 1;
  end;
  while ((bitstoread <> 0) and (readbit(inn, bit))) do
  begin
    value := (value shl 1) or bit;

    dec(bitstoread);
  end;
  value := value + offset;
  result := inn.Position < inn.Size;
end;

procedure TJpegLS8081.encodeMappedErrvalWithGolomb(k, glimit,
  qbpp: Word; value: longword;
  outt: TBinaryStream);
var
  unarycode: longword;
  limit: Word;
  bits: Word;
begin
  limit := 0;
  unarycode := value shr k;
  Assert(glimit > qbpp + 1);
  limit := glimit - qbpp - 1;
  if (unarycode < limit) then
  begin
    while (unarycode <> 0) do
    begin
      dec(unarycode);
      writeBit(outt, 0);
    end;
    writeBit(outt, 1);
    bits := k;
    while (bits <> 0) do
    begin
      dec(bits);
      writeBit(outt, (value shr bits) and 1);
    end;
  end
  else
  begin
    while (limit <> 0) do
    begin
      dec(limit);
      writeBit(outt, 0);
    end;
    writeBit(outt, 1);
    value := value - 1;
    while (qbpp <> 0) do
    begin
      dec(qbpp);
      writeBit(outt, (value shr qbpp) and 1);
    end;

  end;
end;

procedure TJpegLS8081.quantizeErrval(nearr: Word; errval: integer);
begin
  if (nearr <> 0) then
  begin
    if (Errval > 0) then
    begin
      Errval := (Errval + NEARr) div (2 * NEARr + 1);
    end
    else
      Errval := ((Errval - NEARr) div (2 * NEARr + 1));
  end;
end;

procedure TJpegLS8081.clampPredictedValue(x, maxval: integer);
begin
  if x > maxval then
    x := maxval
  else
    if x < 0 then
    x := 0;
end;

procedure TJpegLS8081.codecRunEndSample(ix: Word; ra, rb,
  range: integer; nearr: Word; maxval: longword; reset, limit, qbpp,
  rk: Word; a, n, nn: pinteger; inn: TBinaryStream;
  outt: TBinaryStream; decompressing: boolean);
var
  ritype: boolean;
  sign: Smallint;
  px: integer;
  temp: longword;
  q, k: Word;
  errval, updateErrval: integer;
  emerrval: longword;
  tEMErrval: longword;
  Rx: integer;
begin
  rx := 0;
  ritype := ((ra = rb) or (abs(ra - rb) <= nearr));

  if ((ritype = false) and (ra > rb)) then
    sign := -1
  else
    sign := 1;
  if ritype then
  begin
    px := ra;
    temp := uinta(a^)[366] + (uinta(n^)[366] shr 1);
    q := 365 + 1;
  end
  else
  begin
    px := rb;
    temp := uinta(a^)[365];
    q := 365;
  end;
  k := determineGolombParameter(uinta(n^)[Q], TEMP);
  updateErrval := 0;
  emerrval := 0;
  errval := 0;
  tEMErrval := 0;
  if decompressing then
  begin
    decodeMappedErrvalWithGolomb(k, LIMIT - rk - 1, qbpp, EMErrval, inn);
    if ritype then
      tEMErrval := emerrval + 1
    else
      tEMErrval := emerrval + 0;
    if temerrval = 0 then
      errval := 0
    else
      if k = 0 then
    begin
      if (2 * uinta(nn^)[Q - 365] < uinta(n^)[Q]) then
      begin
        if temerrval mod 2 = 0 then
          errval := -(temerrval shr 1)
        else
          errval := (temerrval + 1) shr 1;
      end
      else
      begin
        if temerrval mod 2 = 0 then
          errval := temerrval shr 1
        else
          errval := -((temerrval + 1) shr 1);
      end;
    end
    else
    begin
      if temerrval mod 2 = 0 then
        Errval := tEMErrval shr 1
      else
        Errval := -((tEMErrval + 1) shr 1);
    end;
    updateErrval := errval;
    if nearr > 0 then
      deQuantizeErrval(NEARr, Errval);
    if sign < 0 then
      errval := -errval;
    rx := px + errval;
    if (Rx < -NEARr) then
      Rx := Rx + RANGE * (2 * NEARr + 1)
    else
      if (Rx > MAXVAL + NEARr) then
      Rx := rx - RANGE * (2 * NEARr + 1);

    clampPredictedValue(Rx, MAXVAL);
    Ix := Rx;
  end
  else
  begin
    Errval := Ix - Px;
    if (SIGN < 0) then
      Errval := -Errval;
    if (NEARr > 0) then
    begin
      quantizeErrval(NEARr, Errval);
      Rx := Px + SIGN * Errval * (2 * NEARr + 1);
      clampPredictedValue(Rx, MAXVAL);
      Ix := Rx;
    end;
    if (Errval < 0) then
      Errval := Errval + RANGE;
    if (Errval >= ((RANGE + 1) div 2)) then
      Errval := Errval - RANGE;
    updateErrval := Errval;
    if (k = 0) then
    begin
      if (Errval > 0) then
      begin
        if (2 * uinta(Nn^)[Q - 365] < uinta(N^)[Q]) then
        begin
          EMErrval := 2 * Errval - 1;
          // "map = 1"	1 becomes 1, 2 becomes 3, 3 becomes 5
        end
        else
        begin
          EMErrval := 2 * Errval;
        end;
      end
      else
        if (Errval < 0) then
      begin
        if (2 * uinta(Nn^)[Q - 365] < uinta(N^)[Q]) then
        begin
          EMErrval := -2 * Errval;
          // "map = 1"	1 becomes 1, 2 becomes 3, 3 becomes 5
        end
        else
        begin
          EMErrval := -2 * Errval - 1;
        end;
      end
      else
      begin
        EMErrval := 0;
      end;

    end
    else
    begin
      if (Errval > 0) then
      begin
        EMErrval := 2 * Errval;
        // "map = 0"	1 becomes 2, 2 becomes 4, 3 becomes 6
      end
      else
        if (Errval < 0) then
      begin
        EMErrval := -2 * Errval - 1;
        // "map = 1"	-1 becomes 1, -2 becomes 3, -3 becomes 5
      end
      else
      begin
        EMErrval := 0; // "map = 0"	0 stays 0
      end;
    end;
    if ritype then
      emerrval := emerrval - 1
    else
      emerrval := emerrval - 0;
    encodeMappedErrvalWithGolomb(k, LIMIT - rk - 1, qbpp, EMErrval, outt);
  end;
  if (updateErrval < 0) then
    inc(uinta(Nn^)[Q - 365]);
  if ritype then
    uinta(A^)[Q] := uinta(A^)[Q] + (EMErrval shr 1)
  else
    uinta(A^)[Q] := uinta(A^)[Q] + ((EMErrval + 1) shr 1);
  if (uinta(N^)[Q] = RESET) then
  begin
    uinta(A^)[Q] := uinta(A^)[Q] shr 1;
    uinta(N^)[Q] := uinta(N^)[Q] shr 1;
    uinta(Nn^)[Q - 365] := uinta(Nn^)[Q - 365] shr 1;
  end;
  inc(uinta(N^)[Q]);
end;

procedure TJpegLS8081.dequantizeErrval(nearr: Word; errval: integer);
begin
  if nearr <> 0 then
    errval := errval * (2 * nearr + 1);
end;

constructor TJpegLS8081.Create;
begin
  readBitByteOffset := 0;
  readBitCount := 0;
  readBitByte := 0;
  readHaveForwardByte := false;

  writeBitByteOffset := 0;
  writeBitCount := 0;
  writeBitByte := 0;
end;

destructor TJpegLS8081.Destroy;
begin

  inherited;
end;

function CeilingDivision(n, d: longword): longword;
begin
  result := longword(ceil(n / d));
end;

function FloorDivision(n, d: longword): longword;
begin
  result := longword(floor(n / d));
end;

function TJpegLS8081.Execute: integer;
var
  bad: boolean;
  decompressing, useJPEGmarkers, useRunMode: BOOLean;
  rows: longword;
  bits: longword;
  cols: longword;
  nearr, t1, t2, t3, reset: Word;
  nearrr, t11, t22, t33, resett: longword;
  //  temptstrstream: tstringstream; //
  inn: TBinaryStream;
  outt: TBinaryStream;
  success: boolean;
  rowss, columnss, maxval: longword;
  p: Word;
  havelse1: boolean;
  readrequiredmarkers: boolean;
  marker: Word;
  factor: longword;
  range: integer;
  bpp, qbpp, limit: Word;
  n, b, c, nn: inta;
  a: uinta;
  A_Init_Value: longword;
  i, RUNIndex: longword;
  rowa, rowb: uint16a;
  row: longword;
  thisrow, prevrow: pword;
  nnn: longword;
  col: longword;
  prevRa0: Word;
  rx: integer;
  ra, rb, rc, rd: Word;
  d1, d2, d3: integer;
  r: longword;
  rm: integer;
  bitss: Word;
  nfill, bit: longword;
  RUNval, RUNcnt: integer;
  rmm: Word;
  bitsss: Word;
  value: longword;
  bitssss: longword;
  Q1, Q2, Q3: Smallint;
  sign: Smallint;
  Q: Word;
  px: integer;
  k: Word;
  MErrval: longword;
  Errval, updateErrval: integer;
  ix: integer;
  tmpRow: pword;
begin
  bad := false;
  rowss := 0;
  columnss := 0;
  maxval := 0;
  bits := 0;
  p := 0;
  marker := 0;
  n := nil;
  a := nil;
  b := nil;
  c := nil;
  nn := nil;
  rowa := nil;
  rowb := nil;
  thisrow := nil;
  prevrow := nil;
  rx := 0;
  //  ra := 0;
  //  rb := 0;
  //  rc := 0;
  rd := 0;
  r := 0;
  bit := 0;
  //  rmm := 0;
  ///  Q1 := 0;
  //  Q2 := 0;
  //  Q3 := 0;
  sign := 0;
  //  Q := 0;
  //  Px := 0;
  MErrval := 0;
  //  Errval := 0;
  updateErrval := 0;

  decompressing := true; //OPTIONS.get('d') or OPTIONS.get('decompress');
  useJPEGmarkers := true; //not OPTIONS.get('nomarkers');
  useRunMode := true; //not OPTIONS.get('noruns');

  //for decompress. it must set value
  rows := 0;
  cols := 0;
  bits := 0;
  Assert(bits <= 16);

  NEARr := 0; // Lossless if zero
  T1 := 0;
  T2 := 0;
  T3 := 0;
  RESET := 0;
  NEARrr := 0;
  T11 := 0;
  T22 := 0;
  T33 := 0;
  RESETt := 0;
  if ((not decompressing) or (not useJPEGmarkers)) then
  begin
    //if (options.get('near', nearrr)) then
    nearr := nearrr;
    //if (options.get('T1', T11)) then
    T1 := T11;
    //if (options.get('T2', T22)) then
    T2 := T22;
    //if (options.get('T3', T33)) then
    T3 := T33;
    //if (options.get('reset', RESETt)) then
    RESET := RESETt;
  end;

  //  inn := TBinaryStream.create(input_opener.str, input_options.byteorder);
  //  outt := TBinaryStream.create(output_opener.str, output_options.byteorder);
  success := true;
  havelse1 := false;
  if (decompressing and useJPEGmarkers) then
  begin
    readrequiredmarkers := false;
    if (readJPEGMarker(inn, marker) and readSOI(inn, marker)) then
    begin
      readJPEGMarker(inn, marker);
      readSOF55(inn, marker, P, ROWSs, COLUMNSs);
      haveLSE1 := readLSE1(inn, marker, MAXVAL, T1, T2, T3, RESET);
      readJPEGMarker(inn, marker);
      readSOF55(inn, marker, P, ROWSs, COLUMNSs);
      begin
        readJPEGMarker(inn, marker);
        readSOS(inn, marker, NEARr);
        //         or (not  havelse1)
        haveLSE1 := readLSE1(inn, marker, MAXVAL, T1, T2, T3, RESET);
        readJPEGMarker(inn, marker);
        readSOS(inn, marker, NEARr);
        begin
          readrequiredmarkers := true;
        end;
      end;
    end
    else
    begin
      raise Exception.Create('Corrupt JPEG stream ... expected SOI Marker');
    end;
    if (not readrequiredmarkers) then
      exit;
  end
  else
  begin
    P := bits;
    ROWSs := rows;
    COLUMNSs := cols;
  end;
  if ((not decompressing) or (not useJPEGmarkers) or (not haveLSE1)) then
  begin
    MAXVAL := (u1ul shl P) - 1;
    if (RESET = 0) then
      RESET := 64;
  end;
  if (MAXVAL >= 128) then
  begin
    FACTOR := FloorDivision(Min(MAXVAL, 4095) + 128, 256);

    if (t1 = 0) then
    begin
      if ((FACTOR * (BASIC_T1 - 2) + 2 + 3 * NEARr > maxval) or (FACTOR *
        (BASIC_T1 - 2) + 2 + 3 * NEARr < nearr + 1)) then
        t1 := nearr + 1
      else
        T1 := FACTOR * (BASIC_T1 - 2) + 2 + 3 * NEARr;
    end;
    if (t2 = 0) then
    begin
      if ((FACTOR * (BASIC_T2 - 3) + 3 + 5 * NEARr > maxval) or (FACTOR *
        (BASIC_T2 - 3) + 3 + 5 * NEARr < t1)) then
        t2 := t1
      else
        T2 := FACTOR * (BASIC_T2 - 3) + 3 + 5 * NEARr;
    end;
    if (t3 = 0) then
    begin
      if ((FACTOR * (BASIC_T3 - 4) + 4 + 7 * NEARr > maxval) or (FACTOR *
        (BASIC_T3 - 4) + 4 + 7 * NEARr < t2)) then
        t3 := t2
      else
        T3 := FACTOR * (BASIC_T3 - 4) + 4 + 7 * NEARr;
    end;
  end
  else
  begin
    FACTOR := FloorDivision(256, MAXVAL + 1);
    if (t1 = 0) then
    begin
      if ((Max(2, BASIC_T1 div FACTOR + 3 * NEARr) > maxval) or (Max(2, BASIC_T1
        div FACTOR + 3 * NEARr) < nearr + 1)) then
        t1 := nearr + 1
      else
        T1 := Max(2, BASIC_T1 div FACTOR + 3 * NEARr);
    end;
    if (t2 = 0) then
    begin
      if ((Max(3, BASIC_T2 div FACTOR + 5 * NEARr) > maxval) or (Max(3, BASIC_T2
        div FACTOR + 5 * NEARr) < t1)) then
        t2 := t1
      else
        T2 := Max(3, BASIC_T2 div FACTOR + 5 * NEARr);
    end;
    if (t3 = 0) then
    begin
      if ((Max(4, BASIC_T3 div FACTOR + 7 * NEARr) > maxval) or (Max(4, BASIC_T3
        div FACTOR + 7 * NEARr) < t2)) then
        t3 := t2
      else
        T3 := Max(4, BASIC_T3 div FACTOR + 7 * NEARr);
    end;
  end;
  Assert(ROWSs <> 0);
  Assert(COLUMNSs <> 0);
  Assert(P <> 0);
  Assert((T1 = 0) or ((NEARr + 1 <= T1) and (T1 <= MAXVAL)));
  Assert((T2 = 0) or ((T1 <= T2) and (T2 <= MAXVAL)));
  Assert((T3 = 0) or ((T2 <= T3) and (T3 <= MAXVAL)));

  RANGE := integer(FloorDivision(MAXVAL + 2 * NEARr, 2 * NEARr + 1) + 1);
  Assert((MAXVAL = 0) or ((1 <= MAXVAL) and (MAXVAL < (u1ul shl P))));
  if (NEARr = 0) then
    Assert(RANGE = MAXVAL + 1);
  bpp := Max(2, Ceil(Log2(MAXVAL + 1)));
  // Number of bits needed to represent MAXVAL with a minumum of 2
  qbpp := Ceil(Log2(RANGE));
  // Number of bits needed to represent a mapped error value
  LIMIT := 2 * (bpp + Max(8, bpp));
  Assert(bpp >= 2);
  Assert(LIMIT > qbpp); // Else LIMIT-qbpp-1 will fail (see A.5.3)

  if ((not decompressing) and useJPEGmarkers) then
  begin
    writeSOI(outt);
    writeSOF55(outt, P, ROWSs, COLUMNSs);
    writeLSE1(outt, MAXVAL, T1, T2, T3, RESET);
    writeSOS(outt, NEARr);
  end;
  setlength(n, ncontexts + 2);
  setlength(a, nContexts + 2);
  for i := 0 to ncontexts + 1 do
  begin
    n[i] := 0;
    a[i] := 0;
  end;
  setlength(b, nContexts);
  setlength(c, nContexts);
  for i := 0 to ncontexts - 1 do
  begin
    b[i] := 0;
    c[i] := 0;
  end;
  setlength(nn, 2);
  nn[0] := 0;
  nn[1] := 0;
  Assert(N <> nil);
  Assert(A <> nil);
  Assert(B <> nil);
  Assert(C <> nil);
  Assert(Nn <> nil);
  A_Init_Value := Max(2, FloorDivision(RANGE + (u1ul shl 5), (u1ul shl 6)));

  for i := 0 to ncontexts - 1 do
  begin
    N[i] := 1;
    A[i] := A_Init_Value;
    B[i] := 0;
    C[i] := 0;
  end;
  N[nContexts] := 1;
  N[nContexts + 1] := 1;
  A[nContexts] := A_Init_Value;
  A[nContexts + 1] := A_Init_Value;
  Nn[0] := 0;
  Nn[1] := 0;
  RUNIndex := 0;
  setlength(rowA, COLUMNSs);
  setlength(rowb, COLUMNSs);
  for i := 0 to COLUMNSs - 1 do
  begin
    rowA[i] := 0;
    rowb[i] := 0;
  end;
  Assert(rowA <> nil);
  Assert(rowB <> nil);

  row := 0;
  thisRow := @rowA;
  prevRow := @rowB;
  for row := 0 to rowss - 1 do
  begin
    if (not decompressing) then
    begin
      nnn := readRow(inn, thisRow, COLUMNSs, bpp);
      Assert(nnn = COLUMNSs);
    end;
    col := 0;
    // for col:=0 to columnss-1 do
    while col < columnss do
    begin
      if (row > 0) then
      begin
        Rb := uint16a(prevRow^)[col];
        if (col > 0) then
          Rc := uint16a(prevRow^)[col - 1]
        else
          Rc := prevRa0;
        if (col > 0) then
          Ra := uint16a(thisRow^)[col - 1]
        else
        begin
          prevRa0 := Rb;
          Ra := prevRa0;
        end;
        if (col + 1 < COLUMNSs) then
          Rd := uint16a(prevRow^)[col + 1]
        else
          Rc := rb;
      end
      else
      begin
        rb := 0;
        rc := 0;
        rd := 0;
        if (col > 0) then
          Ra := uint16a(thisRow^)[col - 1]
        else
        begin
          prevRa0 := 0;
          Ra := prevRa0;
        end;
      end;
      D1 := integer(Rd) - Rb;
      D2 := integer(Rb) - Rc;
      D3 := integer(Rc) - Ra;
      if ((Abs(D1) <= NEARr) and (Abs(D2) <= NEARr) and (Abs(D3) <= NEARr) and
        useRunMode) then
      begin
        if (decompressing) then
        begin
          while (readBit(inn, R)) do
          begin
            if (R = 1) then
            begin
              rm := J_rm[RUNIndex];
              while ((rm <> 0) and (col < COLUMNSs)) do
              begin
                dec(rm);
                uint16a(thisRow^)[col] := ra;
                inc(col);
              end;
              if ((rm = -1) and (RUNIndex < 31)) then
                inc(runindex);
              if (col >= COLUMNSs) then
                break;
            end
            else
            begin
              bitss := J_rm2[RUNIndex];
              nfill := 0;
              while ((bitss <> 0) and (readBit(inn, bit))) do
              begin
                dec(bitss);
                nfill := (nfill shl 1) or bit;
              end;
              while (nfill <> 0) do
              begin
                dec(nfill);
                Assert(col < (COLUMNSs - 1));
                uint16a(thisRow^)[col] := Ra;
                inc(col);
              end;
              if (row > 0) then
              begin
                Rb := uint16a(prevRow^)[col];
                if (col > 0) then
                  Ra := uint16a(thisRow^)[col - 1]
                else
                  ra := Rb;
              end
              else
              begin
                Rb := 0;
                if (col > 0) then
                  Ra := uint16a(thisRow^)[col - 1]
                else
                  ra := 0;
              end;
              codecRunEndSample(uint16a(thisRow^)[col], Ra, Rb, RANGE, NEARr,
                MAXVAL, RESET, LIMIT, qbpp, J_rm2[RUNIndex], @A, @N, @Nn, inn, outt,
                decompressing);
              if (RUNIndex > 0) then
              begin
                dec(RUNIndex);
              end;
              break;
            end;
          end;
        end
        else
        begin
          RUNval := Ra;
          RUNcnt := 0;
          while ((col < COLUMNSs) and ((uint16a(thisRow^)[col] = RUNval) or
            ((NEARr > 0) and (Abs(integer(uint16a(thisRow^)[col]) - RUNval) <=
            NEARr)))) do
          begin
            inc(runcnt);
            if (NEARr > 0) then
              uint16a(thisRow^)[col] := RUNval;
            inc(col);
          end;
          rmm := J_rm[RUNIndex];
          while (RUNcnt >= rmm) do
          begin
            writeBit(outt, 1);
            RUNcnt := RUNcnt - rmm;
            rmm := J_rm[RUNIndex];
            Assert(RUNcnt >= 0);
            if (RUNIndex < 31) then
            begin
              inc(runindex);
            end;
          end;
          if (col < COLUMNSs) then
          begin
            writeBit(outt, 0);
            bitsss := J_rm2[RUNIndex];
            value := runcnt;
            Assert(value < J_rm[RUNIndex]);
            while (bitsss <> 0) do
            begin
              bitssss := value shr bitsss and 1;
              writeBit(outt, bitssss);
              dec(bitsss);
            end;
            Assert(col < COLUMNSs);
            if (row > 0) then
            begin
              Rb := uint16a(prevRow^)[col];
              if (col > 0) then
                Ra := uint16a(thisRow^)[col - 1]
              else
                ra := Rb;
            end
            else
            begin
              Rb := 0;
              if (col > 0) then
                Ra := uint16a(thisRow^)[col - 1]
              else
                ra := 0;
            end;
            codecRunEndSample(uint16a(thisRow^)[col], Ra, Rb, RANGE, NEARr,
              MAXVAL, RESET, LIMIT, qbpp, J_rm2[RUNIndex], @A, @N, @Nn, inn, outt,
              decompressing);
            if (RUNIndex > 0) then
              dec(RUNIndex);

          end
          else
          begin
            if (RUNcnt > 0) then
              writeBit(outt, 1);
          end;
        end;
      end
      else
      begin
        if (D1 <= -T3) then
          Q1 := -4
        else
          if (D1 <= -T2) then
          Q1 := -3
        else
          if (D1 <= -T1) then
          Q1 := -2
        else
          if (D1 < -NEARr) then
          Q1 := -1
        else
          if (D1 <= NEARr) then
          Q1 := 0
        else
          if (D1 < T1) then
          Q1 := 1
        else
          if (D1 < T2) then
          Q1 := 2
        else
          if (D1 < T3) then
          Q1 := 3
        else
          Q1 := 4;

        if (D2 <= -T3) then
          Q2 := -4
        else
          if (D2 <= -T2) then
          Q2 := -3
        else
          if (D2 <= -T1) then
          Q2 := -2
        else
          if (D2 < -NEARr) then
          Q2 := -1
        else
          if (D2 <= NEARr) then
          Q2 := 0
        else
          if (D2 < T1) then
          Q2 := 1
        else
          if (D2 < T2) then
          Q2 := 2
        else
          if (D2 < T3) then
          Q2 := 3
        else
          Q2 := 4;

        if (D3 <= -T3) then
          Q3 := -4
        else
          if (D3 <= -T2) then
          Q3 := -3
        else
          if (D3 <= -T1) then
          Q3 := -2
        else
          if (D3 < -NEARr) then
          Q3 := -1
        else
          if (D3 <= NEARr) then
          Q3 := 0
        else
          if (D3 < T1) then
          Q3 := 1
        else
          if (D3 < T2) then
          Q3 := 2
        else
          if (D3 < T3) then
          Q3 := 3
        else
          Q3 := 4;
        if ((Q1 < 0) or ((Q1 = 0) and (Q2 < 0)) or ((Q1 = 0) and (Q2 = 0) and (Q3
          < 0))) then
        begin
          Q1 := -Q1;
          Q2 := -Q2;
          Q3 := -Q3;
          SIGN := -1;
        end
        else
        begin
          SIGN := 1;
        end;

        if (Q1 = 0) then
        begin
          if (Q2 = 0) then
          begin
            Q := 360 + Q3;
          end
          else
          begin
            Q := 324 + (Q2 - 1) * 9 + (Q3 + 4);
          end;
        end
        else
        begin
          Q := (Q1 - 1) * 81 + (Q2 + 4) * 9 + (Q3 + 4);
        end;
        Assert(Q < nContexts);
        if (Rc >= Max(Ra, Rb)) then
          Px := Min(Ra, Rb)
        else
          if (Rc <= Min(Ra, Rb)) then
          Px := Max(Ra, Rb)
        else
          Px := integer(Ra) + Rb - Rc;
        if (SIGN > 0) then
          px := px + c[q]
        else
          px := px + -c[q];
        clampPredictedValue(Px, MAXVAL);
        k := determineGolombParameter(N[Q], A[Q]);
        if (decompressing) then
        begin
          decodeMappedErrvalWithGolomb(k, LIMIT, qbpp, MErrval, inn);

          if ((NEARr = 0) and (k = 0) and (2 * B[Q] <= -N[Q])) then
          begin
            if (MErrval mod 2 <> 0) then
              Errval := (integer(MErrval) - 1) div 2
                //  1 becomes  0,  3 becomes  1,  5 becomes  2
            else
              Errval := -integer(MErrval) div 2 - 1;
          end
          else
          begin
            if (MErrval mod 2 = 0) then
              Errval := integer(MErrval) div 2
                //  1 becomes  0,  3 becomes  1,  5 becomes  2
            else
              Errval := -(integer(MErrval) + 1) div 2;
          end;
          updateErrval := Errval;
          // NB. Before dequantization and sign correction

          deQuantizeErrval(NEARr, Errval);
          if (SIGN < 0) then
            Errval := -Errval;
          Rx := Px + Errval;
          if (Rx < -NEARr) then
            Rx := Rx + RANGE * (2 * NEARr + 1)
          else
            if (Rx > MAXVAL + NEARr) then
            Rx := Rx - RANGE * (2 * NEARr + 1);

          clampPredictedValue(Rx, MAXVAL);
          uint16a(thisRow^)[col] := Word(Rx);
        end
        else
        begin
          Ix := uint16a(thisRow^)[col];
          Errval := Ix - Px;
          if (SIGN < 0) then
            Errval := -Errval;
          if (NEARr > 0) then
          begin
            quantizeErrval(NEARr, Errval);
            Rx := Px + SIGN * Errval * (2 * NEARr + 1);
            clampPredictedValue(Rx, MAXVAL);

            uint16a(thisRow^)[col] := Word(Rx);
          end;
          if (Errval < 0) then
            Errval := Errval + RANGE;
          if (Errval >= (RANGE + 1) div 2) then
            Errval := Errval - RANGE;
          updateErrval := Errval;
          if ((NEARr = 0) and (k = 0) and (2 * B[Q] <= -N[Q])) then
          begin
            if (Errval >= 0) then
              MErrval := 2 * Errval + 1
            else
              MErrval := -2 * (Errval + 1);

          end
          else
          begin
            if (Errval >= 0) then
              MErrval := 2 * Errval
            else
              MErrval := -2 * Errval - 1;
          end;
          encodeMappedErrvalWithGolomb(k, LIMIT, qbpp, MErrval, outt);
        end;
        B[Q] := B[Q] + updateErrval * (2 * NEARr + 1);
        A[Q] := A[Q] + Abs(updateErrval);
        if (N[Q] = RESET) then
        begin
          A[Q] := A[Q] shr 1;
          B[Q] := B[Q] shr 1;
          N[Q] := N[Q] shr 1;
        end;
        inc(N[Q]);
        if (B[Q] <= -N[Q]) then
        begin
          B[Q] := B[Q] + N[Q];
          if (C[Q] > MIN_C) then
            dec(C[Q]);
          if (B[Q] <= -N[Q]) then
            B[Q] := -N[Q] + 1;
        end
        else
          if (B[Q] > 0) then
        begin
          B[Q] := B[Q] - N[Q];
          if (C[Q] < MAX_C) then
            inc(C[Q]);
          if (B[Q] > 0) then
            B[Q] := 0;
        end;

      end;
      inc(col);
    end;
    if (decompressing) then
    begin
      writeRow(outt, thisRow, COLUMNSs, bpp);
    end;
    tmpRow := thisrow;
    thisRow := prevRow;
    prevRow := tmpRow;

  end;
  if (not decompressing) then
  begin
    writeBitFlush(outt);
  end;
  if ((not decompressing) and useJPEGmarkers) then
    writeEOI(outt);
  if success then
    result := 0
  else
    result := 1;
end;
end.

