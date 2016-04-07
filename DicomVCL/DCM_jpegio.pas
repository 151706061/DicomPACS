{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_jpegio;

interface
uses
  SysUtils, Classes,
  CnsJpgGr, CnsMisc;

const
  PixelCountMax = 32768;

type
  ByteRA = array[1..1] of byte;
  Bytep = ^ByteRA;
  WordRA = array[1..1] of Word;
  Wordp = ^WordRA;

{$IFNDEF LEVEL6}
  PSmallInt = ^SmallInt;
  PByte = ^Byte;
{$ENDIF}
  ShortRA = array[1..1] of ShortInt;
  Shortp = ^ShortRA;

  ShortRA0 = array[0..0] of ShortInt;
  Shortp0 = ^ShortRA;
  SingleRA0 = array[0..0] of Single;
  Singlep0 = ^SingleRA0;
  ByteRA0 = array[0..0] of byte;
  Bytep0 = ^ByteRA0;
  WordRA0 = array[0..0] of Word;
  Wordp0 = ^WordRA0;
  SmallIntRA0 = array[0..0] of SmallInt;
  SmallIntp0 = ^SmallIntRA0;
  LongIntRA0 = array[0..0] of LongInt;
  LongIntp0 = ^LongIntRA0;

  HufRA = record
    HufSz, HufCode, HufVal: Integer;
  end;
  TDicomMemoryStream = class(TMemoryStream)
  public
    constructor Create(AData: Pointer; Alen: Integer);
  end;

  EJPEGException = class(Exception);
  TDicomJpegIO = class
  private
    fstream: TStream;
    FData: Pointer;

    FWidth: Integer;
    FHeight: Integer;
    FBits: Integer;
    FSamplePerPixel: Integer;
  protected
  public
    constructor Create(AData: Pointer; Alen, AWidth, AHeight, ABits, ASamplePerPixel: Integer);
    destructor Destroy; override;

    procedure DecompressJPEG8(buffer: Pointer);
    procedure DecompressJPEG24(buffer: Pointer);
    procedure CompressJPEG8(AStm: TStream);
    procedure CompressJPEG24(AStm: TStream);

    procedure DecompressJPEGLS(buffer: Pointer);
    procedure CompressJPEGLS(AStm: TStream);
  end;

implementation
const
  lBitMask: array[1..17] of integer = (1, 3, 7, 15, 31, 63, 127, 255, 511
    , 1023, 2047, 4095, 8191, 16383, 32767, 65535, 131071);

destructor TDicomJpegIO.Destroy;
begin
  fstream.Free;
  inherited Destroy;
end;

constructor TDicomJpegIO.Create(AData: Pointer; Alen, AWidth, AHeight, ABits, ASamplePerPixel: Integer);
begin
  fstream := TDicomMemoryStream.Create(AData, Alen);
  FData := AData;
  FWidth := AWidth;
  FHeight := Aheight;
  FSamplePerPixel := ASamplePerPixel;
  FBits := ABits;
end;

constructor TDicomMemoryStream.Create(AData: Pointer; Alen: Integer);
begin
  SetPointer(AData, Alen);
  inherited Create;
end;


procedure TDicomJpegIO.DecompressJPEG8(buffer: Pointer);
var
  J: integer;
  Jpg: TJpegGraphic;
  lRow: PByteArray;
  lOutputBuff: PByte;
begin
  lOutputBuff := buffer;
  Jpg := TJpegGraphic.Create;
  try
    Jpg.SingleLoadFromStream(FStream, 0);
    for j := 0 to JPG.Height - 1 do
    begin
      lRow := JPG.Scanline[j];
      Move(lRow[0], lOutputBuff^, Jpg.Width);
      inc(lOutputBuff, Jpg.Width);
    end; //for j...each row
  finally
    Jpg.Free;
  end; //JPG try..finally}
end;

procedure TDicomJpegIO.DecompressJPEG24(buffer: Pointer);
var
  J: integer;
  Jpg: TJpegGraphic;
  lOutputBuff: PByte;
  p1: PByteArray;
begin
  lOutputBuff := buffer;
  Jpg := TJpegGraphic.Create;
  try
    Jpg.SingleLoadFromStream(FStream, 0);
    for j := 0 to Jpg.Height - 1 do
    begin
      p1 := Jpg.ScanLine[j];
      Move(p1[0], lOutputBuff^, Jpg.Width * 3);
      inc(lOutputBuff, Jpg.Width * 3);
    end;
  finally
    JPG.Free;
  end; //JPEG try..finally}
end;

procedure TDicomJpegIO.CompressJPEG24(AStm: TStream);
var
  J: integer;
  Jpg: TJpegGraphic;
  lOutputBuff: PByte;
  p1: PByteArray;
begin
  lOutputBuff := FData;
  Jpg := TJpegGraphic.Create;
  Jpg.NewImage(FWidth, FHeight, ifTrueColor, nil, 0, 0);
  try
    for j := 0 to Jpg.Height - 1 do
    begin
      p1 := Jpg.ScanLine[j];
      Move(lOutputBuff^, p1[0], Jpg.Width * 3);
      inc(lOutputBuff, Jpg.Width * 3);
    end;
    Jpg.SaveToStream(AStm);
  finally
    JPG.Free;
  end; //JPEG try..finally}
end;

procedure TDicomJpegIO.DecompressJPEGLS(buffer: Pointer);
const
  kmaxFrames = 4;
label
  666 {EOF};
var
  lRawRA: Bytep;

  lImgRA: WordP;
  lImgRAz: ByteP;

  lHufVal, lAbba, lOffset, lLineStart, lPredicted, lPredictedG, lPredictedB, lRestartSegmentSz,
    lSz, k, Code, Si, lIncX, lIncY, lInc, lPredA, lPredB, lPredC, lCurrentBitPos, btS1, btS2, btMarkerType,
    DHTnLi, DHTtcth, SOFprecision, SOSpttrans, SOFnf, SOFarrayPos, SOSns, SOSarrayPos, SOSss, SOSse, SOSahal: integer; //byte;
  lHufTable, lnHufTables, {lDecode,} lImgStart, lRawSz, lRawPos, lItems, SOFydim, SOFxdim: integer;
  lMaxHufSi, lMaxHufVal: array[1..kmaxFrames] of integer;
  DHTLiRA, DHTstartRA: array[1..kmaxFrames, 0..31] of integer; //byte;
  lSSSSszRA: array[1..kMaxFrames, 0..17] of byte;
  lLookUpRA: array[1..kMaxFrames, 0..255] of byte; //lists all possible SSSS with <= 8bits
  lHufRA: array[1..kMaxFrames, 0..31] of HufRA;
  lFrameCount, lSegmentLength, lSegmentEnd, lI: integer;
  lImgTypeC3, lHdrOK: boolean;
  function ReadBit: integer; //Read the next single bit
  begin
    result := (lRawRA[lRawPos] shr (7 - lCurrentBitPos)) and 1;
    lCurrentBitPos := lCurrentBitPos + 1;
    if (lCurrentBitPos = 8) then
    begin
      lRawPos := 1 + lRawPos;
      lCurrentBitPos := 0;
    end;
  end;

  function ReadBits(lNum: integer): integer; //lNum: bits to read, not to exceed 16
  begin
    result := lRawRA[lRawPos];
    result := result shl 8 + lRawRA[lRawPos + 1];
    result := result shl 8 + lRawRA[lRawPos + 2];
    result := (result shr (24 - lCurrentBitPos - lNum)) and lBitMask[lNum]; //lCurrentBitPos is incremented from 1, so -1
    lCurrentBitPos := lCurrentBitPos + lNum;
    if (lCurrentBitPos > 7) then
    begin
      lRawPos := lRawPos + (lCurrentBitPos shr 3 {div 8});
      lCurrentBitPos := (lCurrentBitPos and 7 {mod 8});
    end;
  end;

  function DecodePixelDifference(lFrame: integer): integer; //Red/Green/Blue each a separate 'Frame': can have unique huffman tables
  var
    lByte, lHufValSSSS, lInput, lInputbits, lDiff, lI: integer;
  begin
    // read one byte from the stream, without modifying the pointer
    lByte := (lRawRA[lRawPos] shl lCurrentBitPos) + (lRawRA[lRawPos + 1] shr (8 - lCurrentBitPos));
    lByte := lByte and 255;
    lHufValSSSS := lLookUpRA[lFrame, lByte];
    //lLookUpRA: array [1..kMaxFrames,0..255] of byte; //lists all possible SSSS with <= 8bits
    if lHufValSSSS < 255 then
    begin
      lCurrentBitPos := lSSSSszRA[lFrame, lHufValSSSS] + lCurrentBitPos;
      lRawPos := lRawPos + (lCurrentBitpos shr 3);
      lCurrentBitpos := lCurrentBitpos and 7;
      //AdvanceBitPos(lSSSSszRA[lFrame,lSSSS]), but inlined;
    end
    else
    begin //full SSSS is not in the first 8-bits
      if (lByte < 0) or (lByte > 255) then
        raise Exception.Create('yikes');
      lInput := lByte;
      lInputBits := 8;
      inc(lRawPos); // forward 8 bits = precisely 1 byte
      repeat
        Inc(lInputBits);
        lInput := lInput shl 1 + ReadBit;
        if DHTLiRA[lFrame, lInputBits] <> 0 then
        begin //if any entires with this length
          for lI := DHTstartRA[lFrame, lInputBits] to (DHTstartRA[lFrame, lInputBits] + DHTLiRA[lFrame, lInputBits] - 1) do
          begin
            if (lInput = lHufRA[lFrame, lI].HufCode) then
              lHufValSSSS := lHufRA[lFrame, lI].HufVal;
          end; //check each code
        end; //if any entires with this length
        if (lInputBits >= lMaxHufSi[lFrame]) and (lHufValSSSS > 254) then
        begin //exhausted options CR: added rev13
          lHufValSSSS := lMaxHufVal[lFrame];
        end;
      until (lHufValSSSS < 255) {found};
    end; //answer in first 8 bits
    //The HufVal is referred to as the SSSS in the Codec, so it is called 'lHufValSSSS'
    case lHufValSSSS of
      0: result := 0;
      1:
        if ReadBit = 0 then
          result := -1
        else
          result := 1;
      (*BELOW only a tiny bit faster to separate 2..15 into 2..9 and 10..15, requires extra procedure and more
      2..9: begin //see 10..15 for explanation
                 lDiff := ReadBits2_9(lHufValSSSS);
                 if (lDiff > (lBitMask[lHufValSSSS-1])) then  //add
                    result := lDiff
                 else //negation
                      result := lDiff - lBitMask[lHufValSSSS];
            end; //2..9 *)
      2..15:
        begin
          //Osiris includes extra bits after SSSS=16...a violation of the standard See "TABLE H.2 - Difference categories for lossless Huffman coding" of the codec ITU-T81
          //According to the Codec H.1.2.2 "No extra bits are appended after SSSS = 16 is encoded."
          //To patch for Osiris Change case from 2..15 to 2..16
          //  This will work for Osiris images, but will break non-Osiris images
          lDiff := ReadBits(lHufValSSSS);
          if (lDiff > (lBitMask[lHufValSSSS - 1])) then //add
            result := lDiff
              // this is slightly unintuitive: the positive bit is identical to the offset shown in TABLE H.2, a slower but more intuitive way to do this is:
      //result := (lDiff and lBitMask[lHufVal-1]) + (1 shl (lHufval-1));
      //where you clip off the sign bit and then SHL appropriately
          else //negation
            result := lDiff - lBitMask[lHufValSSSS];
          //NEXT to lines are a bit more intuitive:
          {lDiff := lBitMask[lHufVal-1]- lDiff;
          result := -(lDiff + (1 shl (lHufval-1)));}//negation
        end; //10..15
    else {16, not osiris}
      result := 32768;
    end; //case HuffVal
  end; //func DecodePixelDifference

  procedure ReadByte(var lByte: integer);
  begin
    inc(lRawPos);
    lByte := lRawRA[lRawPos];
  end;

  function ReadWord: word;
  var
    lbtL1, lbtL2: byte;
  begin
    inc(lRawPos);
    lbtL1 := lRawRA[lRawPos];
    inc(lRawPos);
    lbtL2 := lRawRA[lRawPos];
    result := (lbtL1 shl 8 + lbtL2)
  end;
  //NEXT: main procedure
begin
  lAbba := 4;
  lnHufTables := 0;

  lImgRAz := buffer;

  lRawSz := FStream.Size;
  lRawPos := 0;
  lRawRA := FData;

  lRestartSegmentSz := 0;
  lImgTypeC3 := false;
  SOFxdim := 1;
  if lRawSz < 32 then
    goto 666;
  for lFrameCount := 1 to kMaxFrames do
    for lInc := 1 to 16 do
      DHTstartRA[lFrameCount, lInc] := 0;
  SOFydim := 1;
  SOSpttrans := 0;
  lHdrOK := false;
  SOFnf := 0;
  SOSns := 0;

  ReadByte(btS1);
  ReadByte(btS1);
  repeat
    repeat
      if lRawPos <= lRawSz then
        ReadByte(btS1);
      if btS1 <> $FF then
      begin
        goto 666;
      end;
      if lRawPos <= lRawSz then
        ReadByte(btMarkerType);
      case btMarkerType of //only process segments with length fields
        $0, $1, $D0..$D7, $FF: btMarkerType := 0; //0&FF = fillers, $1=TEM,$D0..D7=resync
      end;
    until (lRawPos >= lRawSz) or (btMarkerType <> 0);
    lSegmentLength := ReadWord;
    lSegmentEnd := lRawPos + (lSegmentLength - 2);
    if lSegmentEnd > lRawSz then
      goto 666;
    if (btMarkerType = $C3) then
      lImgTypeC3 := true;
    //    if lverbose then showmessage({result+} inttohex(btMarkerType, 2) {':'+inttostr( lSegmentLength )+'@'+inttostr(positon)+' '});
    case btMarkerType of
      $0: ; //filler - ignore
      $C0..$C3, $C5..$CB, $CD..$CF:
        begin //read SOF FrameHeader
          ReadByte(SOFprecision);
          SOFydim := ReadWord;
          SOFxdim := ReadWord;
          ReadByte(SOFnf);
          //          if lverbose then Showmessage('[precision:' + inttostr(SOFprecision) + ' X*Y:' + inttostr(SOFxdim) + '*' + inttostr(SOFydim) + 'nFrames:' + inttostr(SOFnf) + '] ');
          if (not lImgTypeC3) or ((SOFnf <> 1) and (SOFnf <> 3)) then
          begin
            raise Exception.Create('Unable to extract this file format.');
          end;
          SOFarrayPos := lRawPos;
          lRawPos := (lSegmentEnd);
        end; //SOF FrameHeader
      $C4:
        begin //DHT Huffman
          //          if lverbose then showmessage('HuffmanLength' + inttostr(lSegmentLength) + ':');
                      //if SOFnf <1 then SOFnf := 1; //we may not know SOFnf yet!
          lFrameCount := 1;
          repeat
            ReadByte(DHTtcth);
            //showmessage(inttostr(lFrameCount)+'@'+inttostr(DHTtcth and 15)+'x'+inttostr(DHTtcth ));
            DHTnLi := 0;
            for lInc := 1 to 16 do
            begin
              ReadByte(DHTliRA[lFrameCount, lInc]);
              DHTnLi := DHTnLi + DHTliRA[lFrameCount, lInc];
              if DHTliRA[lFrameCount, lInc] <> 0 then
                lMaxHufSi[lFrameCount] := lInc;
              //showmessage(inttostr(DHTliRA[lFrameCount,lInc])+'@'+inttostr(lMaxHufSi));
            end;
            if DHTnLi > 17 then
            begin
              raise Exception.Create('Huffman table corrupted.');
              goto 666;
            end;
            lIncY := 0; //frequency

            for lInc := 0 to 31 do
            begin
              lHufRA[lFrameCount, lInc].HufVal := -1;
              lHufRA[lFrameCount, lInc].HufSz := -1;
              lHufRA[lFrameCount, lInc].HufCode := -1;
            end;

            for lInc := 1 to 16 do
            begin //set the huffman size values
              if DHTliRA[lFrameCount, lInc] > 0 then
              begin
                DHTstartRA[lFrameCount, lInc] := lIncY + 1;
                for lIncX := 1 to DHTliRA[lFrameCount, lInc] do
                begin
                  inc(lIncY);
                  ReadByte(btS1);
                  lHufRA[lFrameCount, lIncY].HufVal := btS1;
                  lMaxHufVal[lFrameCount] := btS1;
                  if (btS1 >= 0) and (btS1 <= 16) then
                    lHufRA[lFrameCount, lIncY].HufSz := lInc
                  else
                  begin
                    raise Exception.Create('Huffman size array corrupted.');
                    goto 666;
                  end; {}
                end;
              end; //Length of size lInc > 0
            end;
            //showmessage('Max bits:'+inttostr(lMaxHufSi)+' SSSS:'+inttostr(lMaxHufVal));
            K := 1;
            Code := 0;
            Si := lHufRA[lFrameCount, K].HufSz; //HuffSizeRA[1];
            repeat
              while (Si = lHufRA[lFrameCount, K].HufSz) do
              begin
                lHufRA[lFrameCount, K].HufCode := Code;
                //showmessage('bits: '+inttostr(Si)+' NthEntry:'+inttostr(K)+' Code:'+inttostr(Code));
                Code := Code + 1;
                Inc(K);
              end;
              if K <= DHTnLi then
              begin
                while lHufRA[lFrameCount, K].HufSz > Si do
                begin
                  Code := Code shl 1;
                  Si := Si + 1;
                end; //while Si
              end; //K <= 17
            until K > DHTnLi; // JGS added rev13
            inc(lFrameCount);
          until (lSegmentEnd - lRawPos) < 18;
          lnHufTables := lFrameCount - 1;
          lRawPos := (lSegmentEnd);
        end; //$C4: DHT Huffman
      $DD:
        begin //Define Restart
          lRestartSegmentSz := Readword;
          lRawPos := (lSegmentEnd);
        end;
      $DA:
        begin //read SOS Scan Header
          if SOSns > 0 then
            goto 666; //multiple SOS!
          ReadByte(SOSns);
          //if Ns = 1 then NOT interleaved, else interleaved: see B.2.3
          SOSarrayPos := lRawPos;
          if SOSns > 0 then
          begin
            for lInc := 1 to SOSns do
            begin
              ReadByte(btS1); //component identifier 1=Y,2=Cb,3=Cr,4=I,5=Q
              ReadByte(btS2); //horizontal and vertical sampling factors
            end;
          end;
          ReadByte(SOSss); //predictor selection B.3
          ReadByte(SOSse);
          ReadByte(SOSahal); //lower 4bits= pointtransform
          SOSpttrans := SOSahal and 16;
          //          if lverbose then
          //            Showmessage('[Predictor: ' + inttostr(SOSss) + ' PointTransform:' + inttostr(SOSahal) + '] ');
          lRawPos := (lSegmentEnd);
        end; //$DA SOS - Scan Header
    else
      begin //skip marker segment;
        lRawPos := (lSegmentEnd);
      end;
    end; //case markertype
  until (lRawPos >= lRawSz) or (btMarkerType = $DA); {hexDA=Start of scan}
  lHdrOK := true; //errors goto label 666, so are NOT OK
  lImgStart := lRawPos;
  666:
  if not lHdrOK then
  begin
    raise Exception.Create('Unable to read this file - is this really a JPEG Lostless image?');
  end;
  if (not lImgTypeC3) then
    exit; //lossless compressed huffman tables
  //NEXT: unpad data - delete byte that follows $FF
  lINc := lRawPos;
  lIncX := lRawPos;
  repeat
    lRawRA[lIncX] := lRawRA[lInc];
    if lRawRA[lInc] = 255 then
    begin
      if (lRawRA[lInc + 1] = $00) then
        lInc := lInc + 1
      else
      begin
        //showmessage(inttostr(lRawRA[lInc+1]));
        if (lRawRA[lInc + 1] = $D9) then //end of image
          lIncX := -666; //end of padding
      end;
    end;
    inc(lInc);
    inc(lIncX);
  until lIncX < 0;
  //End: Data unpadding
  //NEXT: Create Huffman LookupTable.
    //We will compute all possible outcomes for an 8-bit value, while less intuitive than
    //reading Huffman 1 bit at a time, it doubles the decompression speed

  //ONLY required for Osiris corrupted images, see DecodePixelDifference for details
  //NEXT: some RGB images use only a single Huffman table for all 3 colour planes. In this case, replicate the correct values
  if (lnHufTables < SOFnf) then
  begin //use single Hufman table for each frame
    if lnHufTables < 1 then
    begin
      raise Exception.Create('Lossless JPEG decoding error: no Huffman tables.');
    end;
    for lFrameCount := 2 to SOFnf do
    begin
      for lInc := 0 to 31 do
      begin
        lHufRA[lFrameCount, lInc].HufCode := lHufRA[1, lInc].HufCode;
        lHufRA[lFrameCount, lInc].HufVal := lHufRA[1, lInc].HufVal;
        lHufRA[lFrameCount, lInc].HufSz := lHufRA[1, lInc].HufSz;
        DHTliRA[lFrameCount, lInc] := DHTliRA[1, lInc];
      end; //for each table entry
    end; //for each frame                                           xx
  end; // if lnHufTables < SOFnf
  for lFrameCount := 1 to kMaxFrames do
    for lInc := 0 to 17 do
      lSSSSszRA[lFrameCount, lInc] := 123; //Impossible value for SSSS, suggests 8-bits can not describe answer
  for lFrameCount := 1 to kMaxFrames do
    for lInc := 0 to 255 do
      lLookUpRA[lFrameCount, lInc] := 255; //Impossible value for SSSS, suggests 8-bits can not describe answer
  //NEXT fill lookuptable
  for lFrameCount := 1 to SOFnf do
  begin
    lIncY := 0;
    for lSz := 1 to 8 do
    begin //set the huffman lookup table for keys with lengths <=8
      if DHTliRA[lFrameCount, lSz] > 0 then
      begin
        for lIncX := 1 to DHTliRA[lFrameCount, lSz] do
        begin
          inc(lIncY);
          lHufVal := lHufRA[lFrameCount, lIncY].HufVal; //SSSS
          {if (lHufVal < 0) or (lHufVal > 17) then begin
              showmessage('Unknown SSSS =' +inttostr(lHufVal));
              lHufVal := 16;
          end; }
          lSSSSszRA[lFrameCount, lHufVal] := lSz;
          k := (lHufRA[lFrameCount, lIncY].HufCode shl (8 - lSz)) and 255; //K= most sig bits for hufman table
          if lSz < 8 then
          begin //fill in all possible bits that exceed the huffman table
            lInc := lBitMask[8 - lSz];
            for lCurrentBitPos := 0 to lInc do
            begin
              lLookUpRA[lFrameCount, k + lCurrentBitPos] := lHufVal;
            end;
          end
          else
            lLookUpRA[lFrameCount, k] := lHufVal; //SSSS

          {Showmessage('Frame ' + inttostr(lFrameCount) + ' SSSS= '+inttostr(lHufRA[lFrameCount,lIncY].HufVal)+
             '  Size= '+inttostr(lHufRA[1,lIncY].HufSz)+
             '  Code= '+inttostr(lHufRA[1,lIncY].HufCode)+
             '  SHL Code= '+inttostr(k)+
             '  EmptyBits= '+inttostr(lInc)); {}
        end; //Set SSSS
      end; //Length of size lInc > 0
    end; //for lInc := 1 to 8
  end; //For each frame, e.g. once each for Red/Green/Blue
  //Next: uncompress data: different loops for different predictors
  SOFxdim := SOFnf * SOFxdim;
  lItems := SOFxdim * SOFydim;
  //if lVerbose then showmessage('precision'+inttostr(SOFprecision));
  //for timing, multiple decoding loops lRawAbba := lRawPos;for lLoopsAbba := 1 to 100 do begin lRawPos := lRawAbba;
  if (lRestartSegmentSz > 0) and ((SOFPrecision <> 8) or (SOSss = 7)) then //add restart support if we ever find any samples to test
    raise Exception.Create('This image may uses restart markers. Please contact the author.');
  inc(lRawPos); //abbax
  lCurrentBitPos := 0; //read in a new byte
  //lCurrentBitPos := 1; //read in a new byte
  lItems := SOFxdim * SOFydim;
  lPredicted := 1 shl (SOFPrecision - 1 - SOSpttrans);
  lInc := 0;
  if (SOFPrecision <> 8) then
  begin //start - 16 bit data
    lImgRA := buffer; {set to 1 for MRIcro, else 0}
    FillChar(lImgRA^, lItems * sizeof(word), 0); //zero array
    lPredB := 0;
    lPredC := 0;
    case SOSss of //predictors 1,2,3 examine single previous pixel, here we set the relative location
      2: lPredA := SOFxDim - 1; //Rb directly above
      3: lPredA := SOFxDim; //Rc UpperLeft:above and to the left
      4, 5:
        begin
          lPredA := 0;
          lPredB := SOFxDim - 1; //Rb directly above
          lPredC := SOFxDim; //Rc UpperLeft:above and to the left
        end;
      6:
        begin
          lPredB := 0;
          lPredA := SOFxDim - 1; //Rb directly above
          lPredC := SOFxDim; //Rc UpperLeft:above and to the left
        end;
    else
      lPredA := 0; //Ra: directly to left
    end; //case SOSss: predictor offset
    for lIncX := 1 to SOFxdim do
    begin
      inc(lInc); //writenext voxel
      if lInc > 1 then
        lPredicted := lImgRA[lInc - 1];
      lImgRA[lInc] := lPredicted + DecodePixelDifference(1);
    end; //first line: use prev voxel prediction;
    if SOFyDim > 1 then
      for lIncY := 2 to SOFyDim do
      begin
        inc(lInc); //write next voxel
        lPredicted := lImgRA[lInc - SOFxdim];
        lImgRA[lInc] := lPredicted + DecodePixelDifference(1);
        if SOSss = 4 then
        begin
          for lIncX := 2 to SOFxdim do
          begin
            lPredicted := lImgRA[lInc - lPredA] + lImgRA[lInc - lPredB] - lImgRA[lInc - lPredC];
            inc(lInc); //writenext voxel
            lImgRA[lInc] := lPredicted + DecodePixelDifference(1);
          end; //for lIncX
        end
        else
          if (SOSss = 5) or (SOSss = 6) then
        begin
          for lIncX := 2 to SOFxdim do
          begin
            lPredicted := lImgRA[lInc - lPredA] + ((lImgRA[lInc - lPredB] - lImgRA[lInc - lPredC]) shr 1);
            inc(lInc); //writenext voxel
            lImgRA[lInc] := lPredicted + DecodePixelDifference(1);
          end; //for lIncX
        end
        else
          if SOSss = 7 then
        begin
          for lIncX := 2 to SOFxdim do
          begin
            inc(lInc); //writenext voxel
            lPredicted := (lImgRA[lInc - 1] + lImgRA[lInc - SOFxdim]) shr 1;
            lImgRA[lInc] := lPredicted + DecodePixelDifference(1);
          end; //for lIncX
        end
        else
        begin //SOSss 1,2,3 read single values
          for lIncX := 2 to SOFxdim do
          begin
            lPredicted := lImgRA[lInc - lPredA];
            inc(lInc); //writenext voxel
            lImgRA[lInc] := lPredicted + DecodePixelDifference(1);
          end; //for lIncX
        end; //SOSss predictor
      end; //for lIncY
  end
  else
    if SOFnf = 3 then
  begin //>8bit data; 8 bit follows
    //LOSSLESS JPEG: 7 possible predictors - we will handle all of them
    lPredB := 0;
    lPredC := 0;
    case SOSss of //predictors 1,2,3 examine single previous pixel, here we set the relative location
      2: lPredA := SOFxDim - 3; //Rb directly above
      3: lPredA := SOFxDim; //Rc UpperLeft:above and to the left
      5:
        begin
          lPredA := 0;
          lPredB := SOFxDim - 3; //Rb directly above
          lPredC := SOFxDim; //Rc UpperLeft:above and to the left
        end;
      6:
        begin
          lPredB := 0;
          lPredA := SOFxDim - 3; //Rb directly above
          lPredC := SOFxDim; //Rc UpperLeft:above and to the left
        end;
    else
      lPredA := 0; //Ra: directly to left
    end; //case SOSss: predictor offset
    lPredictedG := lPredicted;
    lPredictedB := lPredicted;
    lOffset := 0;
    lInc := lOffset;
    for lIncX := 1 to (SOFxdim div 3) do
    begin //write first line
      //DecodePixelDifference=RED
      lImgRAz[lInc] := lPredicted + DecodePixelDifference(1);
      lPredicted := lImgRAz[lInc];
      inc(lInc); //writenext voxel
      //DecodePixelDifference=GREEN
      lImgRAz[lInc] := lPredictedG + DecodePixelDifference(2);
      lPredictedG := lImgRAz[lInc];
      inc(lInc); //writenext voxel
      //DecodePixelDifference=BLUE
      lImgRAz[lInc] := lPredictedB + DecodePixelDifference(3);
      lPredictedB := lImgRAz[lInc];
      inc(lInc); //writenext voxel
    end; //first line: use prev voxel prediction;
    if lRestartSegmentSz = 0 then
      lSegmentEnd := lItems
    else
      lSegmentEnd := lRestartSegmentSz;
    repeat
      if lSegmentEnd > lItems then
        lSegmentEnd := lItems;
      lLineStart := (((lInc div SOFxDim) + 1) * SOFxDim) + lOffset {-1};
      if lInc > (SOFxDim + 1) then
      begin
        lPredicted := 1 shl (SOFPrecision - 1 - SOSpttrans);
        lPredictedG := lPredicted;
        lPredictedB := lPredicted;
      end
      else
      begin //jiawen
        lPredicted := lImgRAz[lInc - SOFxdim + lOffset];
        lPredictedG := lImgRAz[1 + lInc - SOFxdim + lOffset];
        lPredictedB := lImgRAz[2 + lInc - SOFxdim + lOffset];
      end;
      if SOSss = 4 then
      begin //predictor = 4
        //this is a 24-bit image, so for 512-pixel wid image, SOFxdim will be (3*512=) 1536
        while lInc < (lSegmentEnd - 1) do
        begin
          lImgRAz[lInc] := lPredicted + DecodePixelDifference(1); //RED
          inc(lInc);
          lImgRAz[lInc] := lPredictedG + DecodePixelDifference(2); //GREEN
          inc(lInc);
          lImgRAz[lInc] := lPredictedB + DecodePixelDifference(3); //BLUE
          inc(lInc);
          if lInc = lLineStart then
          begin //newline
            lPredicted := lImgRAz[lInc - SOFxdim];
            lPredictedG := lImgRAz[lInc - SOFxdim + 1];
            lPredictedB := lImgRAz[lInc - SOFxdim + 2];
            lLineStart := lLineStart + (SOFxDim);
          end
          else
          begin
            lPredicted := lImgRAz[lInc - 3] + lImgRAz[lInc - 3 - (SOFxDim - 3)] - lImgRAz[lInc - 3 - SOFxDim];
            lPredictedG := lImgRAz[lInc - 2] + lImgRAz[lInc - 2 - (SOFxDim - 3)] - lImgRAz[lInc - 2 - SOFxDim];
            lPredictedB := lImgRAz[lInc - 1] + lImgRAz[lInc - 1 - (SOFxDim - 3)] - lImgRAz[lInc - 1 - SOFxDim];
          end;
        end;
        //xxx
      end
      else
        if (SOSss = 5) or (SOSss = 6) then
      begin //predictor = 5 or 6
        //this is a 24-bit image, so for 512-pixel wid image, SOFxdim will be (3*512=) 1536
        while lInc < (lSegmentEnd - 1) do
        begin
          lImgRAz[lInc] := lPredicted + DecodePixelDifference(1); //RED
          inc(lInc);
          lImgRAz[lInc] := lPredictedG + DecodePixelDifference(2); //GREEN
          inc(lInc);
          lImgRAz[lInc] := lPredictedB + DecodePixelDifference(3); //BLUE
          inc(lInc);
          if lInc = lLineStart then
          begin //newline
            lPredicted := lImgRAz[lInc - SOFxdim];
            lPredictedG := lImgRAz[lInc - SOFxdim + 1];
            lPredictedB := lImgRAz[lInc - SOFxdim + 2];
            lLineStart := lLineStart + (SOFxDim);
          end
          else
          begin
            lPredicted := lImgRAz[lInc - 3 - lPredA] + ((lImgRAz[lInc - 3 - lPredB] - lImgRAz[lInc - 3 - lPredC]) shr 1);
            lPredictedG := lImgRAz[lInc - 2 - lPredA] + ((lImgRAz[lInc - 2 - lPredB] - lImgRAz[lInc - 2 - lPredC]) shr 1);
            lPredictedB := lImgRAz[lInc - 1 - lPredA] + ((lImgRAz[lInc - 1 - lPredB] - lImgRAz[lInc - 1 - lPredC]) shr 1);
          end;
        end;
      end
      else
        if SOSss = 7 then
      begin //predictor = 7
        while lInc < (lSegmentEnd - 1) do
        begin
          lImgRAz[lInc] := lPredicted + DecodePixelDifference(1); //RED
          inc(lInc);
          lImgRAz[lInc] := lPredictedG + DecodePixelDifference(2); //GREEN
          inc(lInc);
          lImgRAz[lInc] := lPredictedB + DecodePixelDifference(3); //BLUE
          inc(lInc);
          if lInc = lLineStart then
          begin //newline
            lPredicted := lImgRAz[lInc - SOFxdim];
            lPredictedG := lImgRAz[lInc - SOFxdim + 1];
            lPredictedB := lImgRAz[lInc - SOFxdim + 2];
            lLineStart := lLineStart + (SOFxDim);
          end
          else
          begin
            lPredicted := (lImgRAz[lInc - 3] + lImgRAz[lInc - 3 - (SOFxDim - 3)]) shr 1;
            lPredictedG := (lImgRAz[lInc - 2] + lImgRAz[lInc - 2 - (SOFxDim - 3)]) shr 1;
            lPredictedB := (lImgRAz[lInc - 1] + lImgRAz[lInc - 1 - (SOFxDim - 3)]) shr 1;
          end;
        end;
      end
      else
      begin //predictor in range 1,2,3
        //this is a 24-bit image, so for 512-pixel wid image, SOFxdim will be (3*512=) 1536
        while lInc < (lSegmentEnd - 1) do
        begin //jiawen
          lImgRAz[lInc] := lPredicted + DecodePixelDifference(1); //RED
          inc(lInc);
          lImgRAz[lInc] := lPredictedG + DecodePixelDifference(2); //GREEN
          inc(lInc);
          lImgRAz[lInc] := lPredictedB + DecodePixelDifference(3); //BLUE
          inc(lInc);
          if lInc = lLineStart then
          begin //newline
            lPredicted := lImgRAz[lInc - SOFxdim];
            lPredictedG := lImgRAz[lInc - SOFxdim + 1];
            lPredictedB := lImgRAz[lInc - SOFxdim + 2];
            lLineStart := lLineStart + (SOFxDim);
          end
          else
          begin
            lPredicted := lImgRAz[lInc - 3 - lPredA];
            lPredictedG := lImgRAz[lInc - 2 - lPredA];
            lPredictedB := lImgRAz[lInc - 1 - lPredA];
          end;
        end;
      end; //predictor <> 7
    until (lRestartSegmentSz < 1) or ((lSegmentEnd - 2) > lItems);
    // end; //8<>15data type
  end
  else
  begin //previously 12/16/24bit data, 8 bit follows
    lInc := 0;
    {$IFDEF MRICRO}
    lOffset := 1;
    {$ELSE}
    lOffset := 0;
    {$ENDIF}
    //LOSSLESS JPEG: 7 possible predictors - we will handle all of them
    lPredB := 0;
    lPredC := 0;
    case SOSss of //predictors 1,2,3 examine single previous pixel, here we set the relative location
      2: lPredA := SOFxDim - 1; //Rb directly above
      3: lPredA := SOFxDim; //Rc UpperLeft:above and to the left
      5:
        begin
          lPredA := 0;
          lPredB := SOFxDim - 1; //Rb directly above
          lPredC := SOFxDim; //Rc UpperLeft:above and to the left
        end;
      6:
        begin
          lPredB := 0;
          lPredA := SOFxDim - 1; //Rb directly above
          lPredC := SOFxDim; //Rc UpperLeft:above and to the left
        end;
    else
      lPredA := 0; //Ra: directly to left
    end; //case SOSss: predictor offset
    //lOffset := -1;
    for lIncX := 1 to SOFxdim do
    begin //write first line
      lImgRAz[lInc + lOffset] := lPredicted + DecodePixelDifference(1);
      inc(lInc); //writenext voxel
      lPredicted := lImgRAz[lInc - 1 + lOffset];
    end; //first line: use prev voxel prediction;
    if lRestartSegmentSz = 0 then
      lSegmentEnd := lItems
    else
      lSegmentEnd := lRestartSegmentSz;
    repeat
      if lSegmentEnd > lItems then
        lSegmentEnd := lItems;
      lLineStart := (((lInc div SOFxDim) + 1) * SOFxDim) {-1};
      if lInc > (SOFxDim + 1) then
        lPredicted := 1 shl (SOFPrecision - 1 - SOSpttrans)
      else
        lPredicted := lImgRAz[lInc - SOFxdim + lOffset];
      if SOSss = 4 then
      begin //predictor 4 : ABOVE+LEFT-(UPPERLEFT)
        for lInc := lInc to (lSegmentEnd - 1) do
        begin
          lImgRAz[lInc] := lPredicted + DecodePixelDifference(1);
          if lInc + 1 = lLineStart then
          begin //newline
            lPredicted := lImgRAz[lInc + 1 - SOFxdim];
            lLineStart := lLineStart + SOFxDim;
          end
          else
            lPredicted := lImgRAz[lInc] + lImgRAz[lInc - (SOFxDim - 1)] - lImgRAz[lInc - SOFxDim];
        end;
      end
      else
        if (SOSss = 5) or (SOSss = 6) then
      begin //predictor 5,6 : comparisons
        for lInc := lInc to (lSegmentEnd - 1) do
        begin
          lImgRAz[lInc] := lPredicted + DecodePixelDifference(1);
          if lInc + 1 = lLineStart then
          begin //newline
            lPredicted := lImgRAz[lInc + 1 - SOFxdim];
            lLineStart := lLineStart + SOFxDim;
          end
          else
            lPredicted := lImgRAz[lInc - lPredA] + ((lImgRAz[lInc - lPredB] - lImgRAz[lInc - lPredC]) shr 1);
        end;
      end
      else
        if SOSss = 7 then
      begin //predictor 7: average above and left
        for lInc := lInc to (lSegmentEnd - 1) do
        begin
          lImgRAz[lInc] := lPredicted + DecodePixelDifference(1);
          if lInc + 1 = lLineStart then
          begin //newline
            lPredicted := lImgRAz[lInc + 1 - SOFxdim];
            lLineStart := lLineStart + SOFxDim;
          end
          else
            lPredA := lImgRAz[lInc];
          lPredB := lImgRAz[lInc - SOFxDim + 1]; //correct
          lPredicted := (lPredA + lPredB) shr 1;
        end;
      end
      else
      begin //predictor <> 7 : assume SOSss=1: previous
        for lInc := lInc to (lSegmentEnd - 1) do
        begin
          lImgRAz[lInc] := lPredicted + DecodePixelDifference(1);
          if lInc + 1 = lLineStart then
          begin //newline
            lPredicted := lImgRAz[lInc + 1 - SOFxdim];
            lLineStart := lLineStart + SOFxDim;
          end
          else
            lPredicted := lImgRAz[lInc - lPredA];
        end;
      end; //predictor <> 7
      if (lSegmentEnd + 1) < lItems then
      begin
        dec(lRawPos);
        {showmessage('x'+inttostr(lRawPos)+' '+inttostr(lRawRA[lRawPos])+':'+
        inttostr(lRawRA[lRawPos+1])+':'+inttostr(lRawRA[lRawPos+2])+':'+
        inttostr(lRawRA[lRawPos+3])+':');}
        repeat
          while (lRawRA[lRawPos] <> 255) do
            inc(lRawPos);
          inc(lRawPos);
          //showmessage(inttostr(lRawRA[lRawPos]));
        until (lRawRA[lRawPos] >= $D0) and (lRawRA[lRawPos] <= $D7);
        //lCurrentByteVal := 0; //not FF
        lCurrentBitPos := 0; //read in a new byte
        //showmessage('x');
        inc(lRawPos); //abbax
        //lCurrentBitPos := 9; //read in a new byte
      end;
      lSegmentEnd := lSegmentEnd + lRestartSegmentSz;
    until (lRestartSegmentSz < 1) or ((lSegmentEnd - 2) > lItems);
  end; //8<>15data type
end;

procedure TDicomJpegIO.CompressJPEG8(AStm: TStream);
var
  J: integer;
  Jpg: TJpegGraphic;
  lRow: PByteArray;
  lOutputBuff: PByte;
begin
  lOutputBuff := FData;
  Jpg := TJpegGraphic.Create;
  Jpg.NewImage(FWidth, FHeight, ifGray256, nil, 0, 0);
  try
    for j := 0 to JPG.Height - 1 do
    begin
      lRow := JPG.Scanline[j];
      Move(lOutputBuff^, lRow[0], Jpg.Width);
      inc(lOutputBuff, Jpg.Width);
    end; //for j...each row
    Jpg.SaveToStream(Astm);
  finally
    Jpg.Free;
  end; //JPG try..finally}
end;

procedure TDicomJpegIO.CompressJPEGLS(AStm: TStream);
begin

end;

end.

