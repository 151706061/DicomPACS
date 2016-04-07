{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_MPR;
{$I DicomPack.inc}
interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, math,
  DCM_Attributes, gl, DCM32, DCM32_Transforms, DCM32_Resamplers, DCM_UID, dialogs,
  DCM_Bitmap16, DCM_Dict, DCM_ImageData_Bitmap, DCM_ImageData_Bitmap32;

const
  DoubleDegreesToRadians = 0.017453292519943295;
  DoublePi = 3.1415926535897932384626;
  DoubleRadiansToDegrees = 57.29577951308232;

type
  TDicomMPRImage = class
  private
    FIgnoreSliceCheck: Boolean;
    fsliceThickness: Double;
    FSortInvert: Boolean;
    FIndexEnd: Integer;
    FIndexStart: Integer;
    FSelectRect: TRect;
    procedure SetIgnoreSliceCheck(const Value: Boolean);
    procedure SetSortInvert(const Value: Boolean);
    function GetIsCine: Boolean;
    procedure SetIndexEnd(const Value: Integer);
    procedure SetIndexStart(const Value: Integer);
    procedure SetSelectRect(const Value: TRect);
  protected
    fList: TList; //save a series of dicomdataset
    b1, b2: Integer;
    XSpace, YSpace, ZSpace, new_z_pz: Double;
    new_width, new_height: Integer;
    FUseBits: integer;

    imageSize: Integer;
    fPixelPrecention: Integer;
    ImageWidth, ImageHeight: Integer;
    fPhotometricInterpretation: string;

    FRescaleIntercept: Double;
    FRescaleSlope: Double;
    FPixelPaddingValue: integer;
    FPlanarConfiguration: Integer;

    procedure InitData; virtual;
    function GetImageData(Index: integer): TDicomImage;
    function GetDataset(Index: Integer): TDicomDataset;
    procedure GenErrorMessage(str: string; v: real); overload;
    procedure GenErrorMessage(str: string); overload;
    function GetSliceCount: integer;
  protected
    fIsWord: Boolean;
    procedure ComputeReffrenceLineData(ADas: TDicomAttributes; x1, y1, x2, y2: Double); overload;
    procedure ComputeReffrenceLineData(ADas: TDicomAttributes; AObject: TDicomDrawObject); overload;
  public
    constructor Create(ADatasets: TDicomDatasets; ASeriesUID: string); overload; virtual;
    constructor Create(ADataset: TDicomDataset); overload; virtual;
    destructor Destroy; override;

    procedure AssignALineToBitmap(x1, y1, x2, y2: Double; ABitmap: TCnsBitmap32); overload;
    procedure AssignALineToBitmap(AObject: TDicomDrawObject; ABitmap: TCnsBitmap32); overload;

    procedure AssignALineToBitmap(x1, y1, x2, y2: Double; ABitmap: TBitmap); overload;
    procedure AssignALineToBitmap(AObject: TDicomDrawObject; ABitmap: TBitmap); overload;

    function GetMprDataset1(x1, y1, x2, y2: Double): TDicomAttributes; overload;
    function GetMprDataset(x1, y1, x2, y2: Double): TDicomAttributes; overload;

    function GetMprDataset1(AObject: TDicomDrawObject): TDicomAttributes; overload;
    function GetMprDataset(AObject: TDicomDrawObject): TDicomAttributes; overload;
    function getX: integer;
    function getY: integer;
    function getZ: integer;

    procedure SaveAsRawDataFile(AFileNamePerfix: string);
    procedure InvertSort(AValue: Boolean);

    function getXRange: glFloat;
    function getYRange: glFloat;
    function getZRange: glFloat;
    function GetRange: glFloat;

    property PixelSpaceX: Double read XSpace write XSpace;
    property PixelSpaceY: Double read YSpace write YSpace;
    property PixelSpaceZ: Double read ZSpace write ZSpace;

    property IndexStart: Integer read FIndexStart write SetIndexStart;
    property IndexEnd: Integer read FIndexEnd write SetIndexEnd;
    property SelectRect: TRect read FSelectRect write SetSelectRect;

    property SortInvert: Boolean read FSortInvert write SetSortInvert;
    property sliceNumber: Integer read getSliceCount;
    property sliceThickness: Double read fsliceThickness;
    function GetSliceNo(ADataset: TDicomDataset): Integer;
    function GetImageDatas(AList: TList): integer;
    property ImageData[index: Integer]: TDicomImage read getImageData;
    property Datasets[index: Integer]: TDicomDataset read GetDataset;

    property IsCine: Boolean read GetIsCine;
    property IgnoreSliceCheck: Boolean read FIgnoreSliceCheck write SetIgnoreSliceCheck;
  end;

  TDicomMaximumIntensityProjection = class(TDicomMPRImage)
  private
    FMipFactor: Double;
    procedure SetMipFactor(const Value: Double);

  protected
    procedure InitData; override;
    function RotateWordVolume(pVol: PSmallint; dAngle: Double; nCols, nRows, nSlices: integer):
      PSmallint;
    function RotateWord2D(srcFrame: PSmallint; destFrame: PSmallint; dAngle: Double; nCols, nRows:
      integer): PSmallInt;
  public
    constructor Create(ADatasets: TDicomDatasets; ASeriesUID: string); override;
    destructor Destroy; override;

    function Execute(pVol: PSmallint; nCols, nRows, nSlices, nAngles: Integer): PSmallint;

    function GetMipDataset(nAngles: integer; aFactor: Double): TDicomAttributes; overload;
    function GetMaxIpDataset(nAngles: integer;
      aFactor: Double): TDicomAttributes;

    property MipFactor: Double read FMipFactor write SetMipFactor;
  published

  end;
implementation


function TDicomMPRImage.GetMprDataset1(AObject: TDicomDrawObject): TDicomAttributes;
var
  i, k, l, len1, w1, l1: Integer;
  v1: TDCMIntegerArray;
  das1: TDicomDataset;
  p1: Pointer;

  pb1: PByte;
  pw1: PWord;
  prgb1: PRGB;

  dimage: TDicomImageData;
  da1: TDicomAttribute;
  x1, y1, x2, y2, lc: Integer;
begin
  Result := nil;
  if (AObject.Kind <> ldmiPolyonA) then
  begin
    ShowMessage('The Draw Object must be a Polygon');
    exit;
  end;
  if fList.Count <= 2 then
    exit;

  p1 := nil;
  k := 0;
  for i := 0 to fList.Count - 1 do
  begin
    das1 := TDicomDataset(fList[i]);

    if i = 0 then
    begin
      for lc := 0 to AObject.GetCount - 2 do
      begin
        x1 := Round(AObject.X[lc]);
        y1 := Round(AObject.Y[lc]);
        x2 := Round(AObject.X[lc + 1]);
        y2 := Round(AObject.Y[lc + 1]);
        das1.Attributes.ImageData.getLine1(x1, y1, x2, y2, v1);
        k := k + Length(v1);
      end;
      w1 := das1.Attributes.ImageData.WindowCenter;
      l1 := das1.Attributes.ImageData.WindowWidth;
      new_width := k;
      len1 := k * fList.Count * b2 * ((b1 + 7) div 8);
      GetMem(p1, len1);
      if b1 <= 8 then
      begin
        if b1 = 1 then
        begin
          pb1 := p1;
        end
        else
        begin
          prgb1 := p1;
        end;
      end
      else
      begin
        pw1 := p1;
      end;
    end;

    for lc := 0 to AObject.GetCount - 2 do
    begin
      x1 := Round(AObject.X[lc]);
      y1 := Round(AObject.Y[lc]);
      x2 := Round(AObject.X[lc + 1]);
      y2 := Round(AObject.Y[lc + 1]);
      das1.Attributes.ImageData.getLine1(x1, y1, x2, y2, v1);

      if b1 <= 8 then
      begin
        if b1 = 1 then
        begin
          for l := Low(v1) to High(v1) do
          begin
            pb1^ := v1[l];
            inc(pb1);
          end;
        end
        else
        begin
          for l := Low(v1) to High(v1) do
          begin
            prgb1^.r := v1[l] and $FF;
            prgb1^.g := (v1[l] shr 8) and $FF;
            prgb1^.b := (v1[l] shr 16) and $FF;
            inc(prgb1);
          end;
        end;
      end
      else
      begin
        for l := Low(v1) to High(v1) do
        begin
          pw1^ := v1[l];
          inc(pw1);
        end;
      end;
    end;
  end;
  if k > 0 then
  begin
    //build a new tdicomimage
    das1 := TDicomDataset(fList[0]);

    Result := TDicomAttributes.Create;
    Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
    Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
    Result.AddVariant(8, $60, 'SC');
    Result.AddVariant(8, $70, 'CNSoft');

    Result.Add(8, $20).AsDatetime[0] := now;
    Result.Add(8, $21).AsDatetime[0] := now;
    Result.Add(8, $23).AsDatetime[0] := now;
    Result.Add(8, $30).AsDatetime[0] := now;
    Result.Add(8, $31).AsDatetime[0] := now;
    Result.Add(8, $33).AsDatetime[0] := now;
    //  Result.AddVariant($20, $13, AImageIndex);

    da1 := Result.Add($28, $30);
    da1.AsFloat[0] := XSpace;
    da1.AsFloat[1] := XSpace;

    da1 := Result.Add($28, $34);
    da1.AsInteger[0] := Trunc(new_z_pz * 100);
    da1.AsInteger[1] := 100;
    da1.AsInteger[2] := 1;

    Result.AddVariant($28, $11, k);
    Result.AddVariant($28, $10, fList.Count);

    Result.AddVariant($28, $2, b2);
    Result.AddVariant($28, $4, fPhotometricInterpretation); //'MONOCHROME2');

    {.$IFNDEF USE_16_TO_FLOAT_BUFFER}
    if das1.BufferLength <> diblFloat then
    begin
      Result.Add($28, $1052).AsFloat[0] := FRescaleIntercept;
      Result.Add($28, $1053).AsFloat[0] := FRescaleSlope;
    end; //{$ENDIF}

    Result.AddVariant($28, $120, FPixelPaddingValue);

    Result.AddVariant($28, $6, FPlanarConfiguration);

    Result.AddVariant($28, $100, b1);
    Result.AddVariant($28, $101, b1);
    Result.AddVariant($28, $102, b1 - 1);
    Result.AddVariant($28, $103, 0);

    Result.AddVariant($28, $1050, w1);
    Result.AddVariant($28, $1051, l1);

    ComputeReffrenceLineData(Result, AObject);

    dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, len1);
    Result.Add(32736, 16).AddData(dimage);

  end;
end;

function TDicomMaximumIntensityProjection.GetMaxIpDataset(
  nAngles: integer; aFactor: Double): TDicomAttributes;

var
  i, k, x, y, len1, w1, l1: Integer;
//  v1: TDCMIntegerArray;
  das1: TDicomDataset;
  p1: Pointer;
  pb1, pb2: PByte;
  pw1: PWord;
  {.$IFDEF USE_16_TO_FLOAT_BUFFER}
  pwf2: PSingle;
  {.$ELSE}
  pwi2: PWord;
  {.$ENDIF}
  prgb1, prgb2: PRGB;
  dimage: TDicomImageData;
//  da1: TDicomAttribute;
  f1, f2: Double;
begin
  p1 := nil;
  k := 0;
  if fList.Count <= 2 then
    exit;

  for i := 0 to fList.Count - 1 do
  begin
    das1 := TDicomDataset(fList[i]);
    das1.Attributes.ImageData.DecompressData(0);
    if i = 0 then
    begin
      len1 := ImageWidth * ImageHeight * b2 * ((b1 + 7) div 8);
      GetMem(p1, len1);
      Fillchar(p1^, len1, 0);
      w1 := das1.Attributes.ImageData.WindowCenter;
      l1 := das1.Attributes.ImageData.WindowWidth;
    end;
    if b1 <= 8 then
    begin
      if b1 = 1 then
      begin
        pb1 := p1;
        pb2 := das1.Attributes.ImageData.ImageData[0].Data;
      end
      else
      begin
        prgb1 := p1;
        prgb2 := das1.Attributes.ImageData.ImageData[0].Data;
      end;
    end
    else
    begin
      pw1 := p1;
      pwf2 := das1.Attributes.ImageData.ImageData[0].Data;
      pwi2 := das1.Attributes.ImageData.ImageData[0].Data;
    end;

    if b1 <= 8 then
    begin
      if b2 = 1 then
      begin
        for y := 0 to ImageHeight - 1 do
        begin
          f2 := Exp(-aFactor * y);
          for x := 0 to ImageWidth - 1 do
          begin
            f1 := pb2^; //  f2 *

            if pb1^ > pb2^ then
              //pb1^ := pb2^;
              pb1^ := Round(f1);

            inc(pb2);
            inc(pb1);
          end;
        end;
      end
      else
      begin

      end;
    end
    else
    begin
      for y := 0 to ImageHeight - 1 do
      begin
        f2 := Exp(-aFactor * y);
        for x := 0 to ImageWidth - 1 do
        begin
          if das1.BufferLength = diblFloat then
          begin
            f1 := pwf2^; //  f2 *

            if pw1^ > pwf2^ then
              //pw1^ := pw2^;
              pw1^ := Round(f1);

            inc(pwf2);

          end
          else
          begin
            f1 := pwi2^; //  f2 *

            if pw1^ > pwi2^ then
              //pw1^ := pw2^;
              pw1^ := Round(f1);

            inc(pwi2);
          end;
          inc(pw1);
        end;
      end;
    end;
  end;
  //build a new tdicomimage

  Result := TDicomAttributes.Create;
  Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
  Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
  Result.AddVariant(8, $60, 'SC');
  Result.AddVariant(8, $70, 'CNSoft');

  Result.Add(8, $20).AsDatetime[0] := now;
  Result.Add(8, $21).AsDatetime[0] := now;
  Result.Add(8, $23).AsDatetime[0] := now;
  Result.Add(8, $30).AsDatetime[0] := now;
  Result.Add(8, $31).AsDatetime[0] := now;
  Result.Add(8, $33).AsDatetime[0] := now;
  //  Result.AddVariant($20, $13, AImageIndex);

  Result.AddVariant($28, $11, ImageWidth);
  Result.AddVariant($28, $10, ImageHeight);

  Result.AddVariant($28, $2, b2);
  Result.AddVariant($28, $4, fPhotometricInterpretation); //'MONOCHROME2');

  Result.Add($28, $1052).AsFloat[0] := FRescaleIntercept;
  Result.Add($28, $1053).AsFloat[0] := FRescaleSlope;
  //Result.AddVariant($28, $1052, FRescaleIntercept);
  //Result.AddVariant($28, $1053, FRescaleSlope);

  Result.AddVariant($28, $120, FPixelPaddingValue);

  Result.AddVariant($28, $6, FPlanarConfiguration);

  Result.AddVariant($28, $100, b1);
  Result.AddVariant($28, $101, b1);
  Result.AddVariant($28, $102, b1 - 1);

  //  Result.AddVariant($28, $1050, w1);
  //  Result.AddVariant($28, $1051, l1);

  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, len1);
  Result.Add(32736, 16).AddData(dimage);
end;

function TDicomMaximumIntensityProjection.GetMipDataset(
  nAngles: integer; aFactor: Double): TDicomAttributes;
var
  i, k, x, y, len1, w1, l1: Integer;
  v1: TDCMIntegerArray;
  das1: TDicomDataset;
  p1: Pointer;
  pb1, pb2: PByte;
  pw1: PWord;
  {.$IFDEF USE_16_TO_FLOAT_BUFFER}
  pwf2: PSingle;
  {.$ELSE}
  pwi2: PWord;
  {.$ENDIF}
  prgb1, prgb2: PRGB;
  dimage: TDicomImageData;
  da1: TDicomAttribute;
  f1, f2: Double;
begin
  p1 := nil;
  k := 0;
  if fList.Count <= 2 then
    exit;

  for i := 0 to fList.Count - 1 do
  begin
    das1 := TDicomDataset(fList[i]);
    das1.Attributes.ImageData.DecompressData(0);
    if i = 0 then
    begin
      len1 := ImageWidth * ImageHeight * b2 * ((b1 + 7) div 8);
      GetMem(p1, len1);
      Fillchar(p1^, len1, 0);
      w1 := das1.Attributes.ImageData.WindowCenter;
      l1 := das1.Attributes.ImageData.WindowWidth;
    end;
    if b1 <= 8 then
    begin
      if b1 = 1 then
      begin
        pb1 := p1;
        pb2 := das1.Attributes.ImageData.ImageData[0].Data;
      end
      else
      begin
        prgb1 := p1;
        prgb2 := das1.Attributes.ImageData.ImageData[0].Data;
      end;
    end
    else
    begin
      pw1 := p1;
      pwf2 := das1.Attributes.ImageData.ImageData[0].Data;
      pwi2 := das1.Attributes.ImageData.ImageData[0].Data;
    end;

    if b1 <= 8 then
    begin
      if b2 = 1 then
      begin
        for y := 0 to ImageHeight - 1 do
        begin
          f2 := Exp(-aFactor * y);
          for x := 0 to ImageWidth - 1 do
          begin
            if aFactor = 0 then
              f1 := pb2^
            else
              f1 := pb2^ * f2;

            if pb1^ < pb2^ then
              //pb1^ := pb2^;
              pb1^ := Round(f1);

            inc(pb2);
            inc(pb1);
          end;
        end;
      end
      else
      begin

      end;
    end
    else
    begin
      for y := 0 to ImageHeight - 1 do
      begin
        f2 := Exp(-aFactor * y);
        for x := 0 to ImageWidth - 1 do
        begin
          if das1.BufferLength = diblFloat then
          begin
            if aFactor = 0 then
              f1 := pwf2^
            else
              f1 := pwf2^ * f2;

            if pw1^ < pwf2^ then
              //pw1^ := pw2^;
              pw1^ := Round(f1);

            inc(pwf2);
          end
          else
          begin
            if aFactor = 0 then
              f1 := pwi2^
            else
              f1 := pwi2^ * f2;

            if pw1^ < pwi2^ then
              //pw1^ := pw2^;
              pw1^ := Round(f1);

            inc(pwi2);
          end;
          inc(pw1);
        end;
      end;
    end;
  end;
  //build a new tdicomimage

  Result := TDicomAttributes.Create;
  Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
  Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
  Result.AddVariant(8, $60, 'SC');
  Result.AddVariant(8, $70, 'CNSoft');

  Result.Add(8, $20).AsDatetime[0] := now;
  Result.Add(8, $21).AsDatetime[0] := now;
  Result.Add(8, $23).AsDatetime[0] := now;
  Result.Add(8, $30).AsDatetime[0] := now;
  Result.Add(8, $31).AsDatetime[0] := now;
  Result.Add(8, $33).AsDatetime[0] := now;
  //  Result.AddVariant($20, $13, AImageIndex);

  Result.AddVariant($28, $11, ImageWidth);
  Result.AddVariant($28, $10, ImageHeight);

  Result.AddVariant($28, $2, b2);
  Result.AddVariant($28, $4, fPhotometricInterpretation); //'MONOCHROME2');

  Result.Add($28, $1052).AsFloat[0] := FRescaleIntercept;
  Result.Add($28, $1053).AsFloat[0] := FRescaleSlope;
  //Result.AddVariant($28, $1052, FRescaleIntercept);
  //Result.AddVariant($28, $1053, FRescaleSlope);

  Result.AddVariant($28, $120, FPixelPaddingValue);

  Result.AddVariant($28, $6, FPlanarConfiguration);

  Result.AddVariant($28, $100, b1);
  Result.AddVariant($28, $101, b1);
  Result.AddVariant($28, $102, b1 - 1);

  //  Result.AddVariant($28, $1050, w1);
  //  Result.AddVariant($28, $1051, l1);

  dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, len1);
  Result.Add(32736, 16).AddData(dimage);
end;

procedure TDicomMPRImage.AssignALineToBitmap(AObject: TDicomDrawObject;
  ABitmap: TCnsBitmap32);
begin

end;

procedure TDicomMPRImage.AssignALineToBitmap(AObject: TDicomDrawObject;
  ABitmap: TBitmap);
begin

end;

procedure TDicomMPRImage.AssignALineToBitmap(x1, y1, x2, y2: Double; ABitmap: TBitmap);
var
  das: TDicomAttributes;
begin
  das := GetMprDataset(x1, y1, x2, y2);
  if assigned(das) then
  try
    DCM_ImageData_Bitmap.AssignToBitmap(das.ImageData, ABitmap);
  finally
    das.Free;
  end;
end;

procedure TDicomMPRImage.AssignALineToBitmap(x1, y1, x2, y2: Double; ABitmap: TCnsBitmap32);
var
  das: TDicomAttributes;
begin
  das := GetMprDataset(x1, y1, x2, y2);
  if assigned(das) then
  try
    DCM_ImageData_Bitmap32.AssignToBitmap(das.ImageData, ABitmap);
  finally
    das.Free;
  end;
  (*var
    i, l: Integer;
    v1: Integer;
    das1: TDicomDataset;
    p1: PColor32Array;
    bb1: Byte;
    kk1: Integer;
    flookupTableForWL: PByteArray;
    fLookupTableLength_1: integer;
    lCen, lwid: Integer;
    bm1: TCnsBitmap32;
    AT: TAffineTransformation;

    dx, dy, xinc, yinc, rx, ry: double;
    n, i1, nx, ny: Integer;
    did1: TDicomImageData;
    di1: TDicomImage;

    ps1: WordP;
    px1: ByteP;
    psb1: SmallP;
    v2: Smallint;
  begin
    p1 := nil;
    //  k := 0;
    if fList.Count <= 2 then
      exit;
    bm1 := TCnsBitmap32.Create;
    try
      dx := x2 - x1;
      dy := y2 - y1;
      n := trunc(sqrt(dx * dx + dy * dy));
      if n <= 0 then
        exit;
      // Result := adata;
      xinc := dx / n;
      yinc := dy / n;
      inc(n);
      //    k := n + 1;
          //    len1 := k * fList.Count * b2 * ((b1 + 7) div 8);

      new_width := n;

      bm1.SetSize(new_width, fList.Count);
      p1 := bm1.Bits;

      kk1 := 0;
      das1 := TDicomDataset(fList[0]);
      //    l1 := das1.Attributes.ImageData.WindowCenter;
      //    w1 := das1.Attributes.ImageData.WindowWidth;
      with das1.Attributes.ImageData do
      begin
        lCen := (WindowCenter - RescaleIntercept) * RescaleSlope;
        lWid := abs(trunc((WindowWidth / RescaleSlope) / 2));
      end;
      //  lCen := (das1.Attributes.ImageData.WindowCenter - das1.Attributes.ImageData.RescaleIntercept) * das1.Attributes.ImageData.RescaleSlope;
      //  lWid := abs(trunc((das1.Attributes.ImageData.WindowWidth / das1.Attributes.ImageData.RescaleSlope) / 2));

      //    lCen := (l1);
      //    lWid := abs(trunc(w1 / 2));

      flookupTableForWL := WLLut.GetData(FUseBits, lWid, lCen, das1.Attributes.ImageData.Negative xor (das1.Attributes.ImageData.PhotometricInterpretation = 'MONOCHROME1'));
      //    flookupTableForWL := WLLut.GetData(FUseBits, lWid, lCen, false);
      fLookupTableLength_1 := 2 shl (FUseBits - 1);

      for i := 0 to fList.Count - 1 do
      begin
        das1 := TDicomDataset(fList[i]);
        did1 := das1.Attributes.ImageData.ImageData[0]; //.getLine(x1, y1, x2, y2, v1);
        di1 := das1.Attributes.ImageData;
        rx := x1;
        ry := y1;

        if b1 <= 8 then
        begin
          if b2 = 1 then
          begin
            //for l := Low(v1) to High(v1) do
            px1 := did1.Data;
            for l := 0 to n do
            begin
              //bb1 := v1[l] and $FF;
              //v1 := di1.getPixelValue(did1, trunc(rx + 0.5), trunc(ry + 0.5));
              v1 := px1[trunc((ry + 0.5) * di1.Width + rx + 0.5)];
              bb1 := flookupTableForWL[v1 + fLookupTableLength_1];
              p1[kk1] := Color32(bb1, bb1, bb1);
              inc(kk1);
              rx := rx + xinc;
              ry := ry + yinc;
            end;
          end

          else
          begin
            px1 := did1.Data;
            for l := 0 to n do
            begin
              //v1 := di1.getPixelValue(did1, trunc(rx + 0.5), trunc(ry + 0.5));
              nx := trunc(rx + 0.5);
              ny := trunc((ry + 0.5) * di1.Width * 3);
              //v1 := px1[ny * FWidth * 3 + nx] shl 16 +
              //  px1[ny * FWidth * 3 + nx + 1] shl 8 + px1[ny * FWidth * 3 + nx + 2];
              p1[kk1] := Color32(px1[ny + nx + 2], px1[ny + nx + 1], px1[ny + nx]);
              inc(kk1);
              rx := rx + xinc;
              ry := ry + yinc;
            end;
          end;
        end
        else
          if FUseBits = b1 then
        begin
          psb1 := did1.Data;
          for l := 0 to n - 1 do
          begin
            v2 := psb1[trunc(ry + 0.5) * di1.Width + trunc(rx + 0.5)];

            bb1 := flookupTableForWL[v2 + fLookupTableLength_1];
            p1[kk1] := Color32(bb1, bb1, bb1);
            inc(kk1);
            rx := rx + xinc;
            ry := ry + yinc;
          end;
        end
        else
        begin
          ps1 := did1.Data;
          for l := 0 to n - 1 do
          begin
            v1 := ps1[trunc(ry + 0.5) * di1.Width + trunc(rx + 0.5)];

            bb1 := flookupTableForWL[v1 + fLookupTableLength_1];
            p1[kk1] := Color32(bb1, bb1, bb1);
            inc(kk1);
            rx := rx + xinc;
            ry := ry + yinc;
          end;
        end;
      end;

      ABitmap.SetSize(new_width, new_height);
      {$IFDEF DEPRECATEDMODE}
      bm1.StretchFilter := sfLanczos;
      {$ELSE}
      TLinearResampler.Create(bm1);
      //TKernelResampler.Create(bm1);
      //TKernelResampler(bm1.Resampler).Kernel := TCubicKernel.Create; //
      {$ENDIF}
      AT := TAffineTransformation.Create;
      try
        AT.SrcRect := FloatRect(0, 0, bm1.Width - 1, bm1.Height - 1);

        AT.Scale(1, new_z_pz);
        Transform(ABitmap, bm1, AT);
      finally
        AT.Free;
      end;
    finally
      bm1.Free;
    end; *)
end;

function TDicomMPRImage.GetMprDataset1(x1, y1, x2, y2: Double): TDicomAttributes;
var
  i, k, l, len1, w1, l1: Integer;
  v1: TDCMIntegerArray;
  das1: TDicomDataset;
  p1: Pointer;
  pb1: PByte;
  pw1: PWord;
  prgb1: PRGB;
  dimage: TDicomImageData;
  da1: TDicomAttribute;
begin
  p1 := nil;
  k := 0;
  if fList.Count <= 2 then
    exit;

  for i := 0 to fList.Count - 1 do
  begin
    das1 := TDicomDataset(fList[i]);
    das1.Attributes.ImageData.getLine1(x1, y1, x2, y2, v1);
    if i = 0 then
    begin
      k := High(v1) - Low(v1) + 1;
      b1 := das1.Attributes.ImageData.Bits;
      b2 := das1.Attributes.ImageData.SamplePerPixel;
      len1 := k * fList.Count * b2 * ((b1 + 7) div 8);
      GetMem(p1, len1);
      w1 := das1.Attributes.ImageData.WindowCenter;
      l1 := das1.Attributes.ImageData.WindowWidth;
      new_width := k;

      if b1 <= 8 then
      begin
        if b1 = 1 then
        begin
          pb1 := p1;
        end
        else
        begin
          prgb1 := p1;
        end;
      end
      else
      begin
        pw1 := p1;
      end;
    end;
    if b1 <= 8 then
    begin
      if b1 = 1 then
      begin
        for l := Low(v1) to High(v1) do
        begin
          pb1^ := v1[l];
          inc(pb1);
        end;
      end
      else
      begin
        for l := Low(v1) to High(v1) do
        begin
          prgb1^.r := v1[l] and $FF;
          prgb1^.g := (v1[l] shr 8) and $FF;
          prgb1^.b := (v1[l] shr 16) and $FF;
          inc(prgb1);
        end;
      end;
    end
    else
    begin
      for l := Low(v1) to High(v1) do
      begin
        pw1^ := v1[l];
        inc(pw1);
      end;
    end;
  end;
  if k > 0 then
  begin
    //build a new tdicomimage

    Result := TDicomAttributes.Create;
    Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
    Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
    Result.AddVariant(8, $60, 'SC');
    Result.AddVariant(8, $70, 'CNSoft');

    Result.Add(8, $20).AsDatetime[0] := now;
    Result.Add(8, $21).AsDatetime[0] := now;
    Result.Add(8, $23).AsDatetime[0] := now;
    Result.Add(8, $30).AsDatetime[0] := now;
    Result.Add(8, $31).AsDatetime[0] := now;
    Result.Add(8, $33).AsDatetime[0] := now;
    //  Result.AddVariant($20, $13, AImageIndex);

    da1 := Result.Add($28, $30);
    da1.AsFloat[0] := XSpace;
    da1.AsFloat[1] := YSpace;

    da1 := Result.Add($28, $34);
    da1.AsInteger[0] := Trunc(new_z_pz * 100);
    da1.AsInteger[1] := 100;
    da1.AsInteger[2] := 1;

    Result.AddVariant($28, $11, k);
    Result.AddVariant($28, $10, fList.Count);

    Result.AddVariant($28, $2, b2);
    Result.AddVariant($28, $4, fPhotometricInterpretation); //'MONOCHROME2');

    Result.Add($28, $1052).AsFloat[0] := FRescaleIntercept;
    Result.Add($28, $1053).AsFloat[0] := FRescaleSlope;
    //Result.AddVariant($28, $1052, FRescaleIntercept);
    //Result.AddVariant($28, $1053, FRescaleSlope);

    Result.AddVariant($28, $103, fPixelPrecention);

    Result.AddVariant($28, $120, FPixelPaddingValue);

    Result.AddVariant($28, $6, FPlanarConfiguration);

    Result.AddVariant($28, $100, b1);
    Result.AddVariant($28, $101, b1);
    Result.AddVariant($28, $102, b1 - 1);

    Result.AddVariant($28, $1050, w1);
    Result.AddVariant($28, $1051, l1);

    ComputeReffrenceLineData(Result, x1, y1, x2, y2);

    dimage := TDicomImageData.Create(ImplicitVRLittleEndian, p1, len1);
    Result.Add(32736, 16).AddData(dimage);

  end;
end;

function TDicomMPRImage.GetMprDataset(x1, y1, x2, y2: Double): TDicomAttributes;
var
  i3, i2, i1, i, k, l, len1, w1, l1, width1: Integer;
  //  v1: TDCMIntegerArray;
  das1: TDicomDataset;
  p1: Pointer;

  pb1: PByte;

  prgb1: PRGB;
  dimage: TDicomImageData;
  da1: TDicomAttribute;

  imagearray: array of Pointer;

  pw1: PWord;
  pwa1: Wordp;

  ps1: PSmallInt;
  psa1: SmallP;

  pf1: PSingle;
  pfa1: Singlep;

  pba1: Bytep;
  prgba1: RGBp;

  dx, dy, xinc, yinc, rx, ry: double;
  n: Integer;

  pw2: PWord;
begin
  p1 := nil;
  k := 0;
  if fList.Count <= 2 then
    exit;
  das1 := TDicomDataset(fList[0]);
  b1 := das1.Attributes.ImageData.Bits;
  b2 := das1.Attributes.ImageData.SamplePerPixel;
  w1 := das1.Attributes.ImageData.WindowCenter;
  l1 := das1.Attributes.ImageData.WindowWidth;
  width1 := das1.Attributes.ImageData.Width;
  //new_height := trunc(fList.Count * new_z_pz);
  setlength(imagearray, fList.Count);
  for i := 0 to fList.Count - 1 do
  begin
    das1 := TDicomDataset(fList[i]);
    if das1.Attributes.ImageData.DecompressData(0) then
      imagearray[i] := das1.Attributes.ImageData.ImageData[0].Data;
  end;

  dx := x2 - x1;
  dy := y2 - y1;
  n := trunc(sqrt(dx * dx + dy * dy));
  if n > 0 then
  begin
    k := n + 1;
    new_width := k;

    len1 := k * new_height * b2 * ((b1 + 7) div 8);
    GetMem(p1, k * fList.Count * b2 * ((b1 + 7) div 8));
    //GetMem(p0, k * fList.Count * b2 * ((b1 + 7) div 8));

    GetMem(pw2, len1);

    xinc := dx / n;
    yinc := dy / n;

    if b1 <= 8 then
    begin
      if b1 = 1 then
      begin
        //setlength(imagearraybyte, fList.Count);
        //pb1 := p1;
      end
      else
      begin
        //setlength(imagearrayrgb, fList.Count);
        //prgb1 := p1;
      end;
    end
    else
    begin
      {.$IFDEF USE_16_TO_FLOAT_BUFFER}
      if TDicomDataset(fList[0]).BufferLength = diblFloat then
      begin
        ps1 := p1;
        //pw0 := p0;
        rx := x1;
        ry := y1;
        for i := 0 to n - 1 do
        begin
          i2 := trunc(ry) * width1 + trunc(rx);
          ps1 := p1;
          inc(ps1, i);
          for i1 := 0 to fList.Count - 1 do
          begin
            {i3 := trunc((i1) / new_z_pz);
            if i3 < 0 then
              i3 := 0;
            if i3 >= fList.Count then
              i3 := fList.Count - 1;}
            pfa1 := imagearray[i1];
            {if i1 < (fList.Count - 1) then
              pwa0 := imagearray[i1 + 1]
            else
              pwa0 := imagearray[i1];
            }
            //pw0^ := pwa0[i2];
            ps1^ := round(pfa1[i2]);
            inc(ps1, k);
          end;
          rx := rx + xinc;
          ry := ry + yinc;
        end;
        StretchResample(p1, 0, 0, k, fList.Count, pw2, 0, 0, k, new_Height, sfLinear); //sfCatmullRom);
      end
      else
      begin {.$ELSE}
        if das1.Attributes.ImageData.PixelRepresentation then
        begin
          pw1 := p1;
          //pw0 := p0;
          rx := x1;
          ry := y1;
          for i := 0 to n - 1 do
          begin
            i2 := trunc(ry) * width1 + trunc(rx);
            pw1 := p1;
            inc(pw1, i);
            for i1 := 0 to fList.Count - 1 do
            begin
              {i3 := trunc((i1) / new_z_pz);
              if i3 < 0 then
                i3 := 0;
              if i3 >= fList.Count then
                i3 := fList.Count - 1;}
              pwa1 := imagearray[i1];
              {if i1 < (fList.Count - 1) then
                pwa0 := imagearray[i1 + 1]
              else
                pwa0 := imagearray[i1];
              }
              //pw0^ := pwa0[i2];
              pw1^ := pwa1[i2];
              inc(pw1, k);
            end;
            rx := rx + xinc;
            ry := ry + yinc;
          end;
          StretchResampleWord(p1, 0, 0, k, fList.Count, pw2, 0, 0, k, new_Height, sfLinear); //sfCatmullRom);
        end
        else
          //if das1.Attributes.ImageData.PixelRepresentation then
        begin
          ps1 := p1;
          //pw0 := p0;
          rx := x1;
          ry := y1;
          for i := 0 to n - 1 do
          begin
            i2 := trunc(ry) * width1 + trunc(rx);
            ps1 := p1;
            inc(ps1, i);
            for i1 := 0 to fList.Count - 1 do
            begin
              {i3 := trunc((i1) / new_z_pz);
              if i3 < 0 then
                i3 := 0;
              if i3 >= fList.Count then
                i3 := fList.Count - 1;}
              psa1 := imagearray[i1];
              {if i1 < (fList.Count - 1) then
                pwa0 := imagearray[i1 + 1]
              else
                pwa0 := imagearray[i1];
              }
              //pw0^ := pwa0[i2];
              ps1^ := psa1[i2];
              inc(ps1, k);
            end;
            rx := rx + xinc;
            ry := ry + yinc;
          end;
          StretchResample(p1, 0, 0, k, fList.Count, pw2, 0, 0, k, new_Height, sfLinear); //sfCatmullRom);
        end;
      end; //{$ENDIF}
    end;
    //    Stretch3DResample(p1, p0, 0, 0, k, fList.Count, pw2, 0, 0, k, new_Height);

    FreeMem(p1);
    //FreeMem(p0);
  end;

  if k > 0 then
  begin
    //build a new tdicomimage

    Result := TDicomAttributes.Create;
    Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
    Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
    Result.AddVariant(8, $60, 'SC');
    Result.AddVariant(8, $70, 'CNSoft');

    Result.Add(8, $20).AsDatetime[0] := now;
    Result.Add(8, $21).AsDatetime[0] := now;
    Result.Add(8, $23).AsDatetime[0] := now;
    Result.Add(8, $30).AsDatetime[0] := now;
    Result.Add(8, $31).AsDatetime[0] := now;
    Result.Add(8, $33).AsDatetime[0] := now;
    //  Result.AddVariant($20, $13, AImageIndex);

    {da1 := Result.Add($28, $34);
    da1.AsInteger[0] := Trunc(new_z_pz * 100);
    da1.AsInteger[1] := 100;
    da1.AsInteger[2] := 1;}
    da1 := Result.Add($28, $30);
    da1.AsFloat[0] := XSpace;
    da1.AsFloat[1] := XSpace;

    Result.AddVariant($28, $11, k);
    Result.AddVariant($28, $10, new_height);

    Result.AddVariant($28, $2, b2);
    Result.AddVariant($28, $4, fPhotometricInterpretation); //'MONOCHROME2');

    {.$IFNDEF USE_16_TO_FLOAT_BUFFER}
    if TDicomDataset(fList[0]).BufferLength <> diblFloat then
    begin
      Result.Add($28, $1052).AsFloat[0] := FRescaleIntercept;
      Result.Add($28, $1053).AsFloat[0] := FRescaleSlope;
      //Result.AddVariant($28, $1052, FRescaleIntercept);
      //Result.AddVariant($28, $1053, FRescaleSlope);
      Result.AddVariant($28, $103, fPixelPrecention);
      Result.AddVariant($28, $120, FPixelPaddingValue);
    end
    else
    begin {.$ELSE}
      Result.AddVariant($28, $103, 1);
    end; //{$ENDIF}

    Result.AddVariant($28, $6, FPlanarConfiguration);

    Result.AddVariant($28, $100, b1);
    Result.AddVariant($28, $101, b1);
    Result.AddVariant($28, $102, b1 - 1);

    Result.AddVariant($28, $1050, w1);
    Result.AddVariant($28, $1051, l1);

    ComputeReffrenceLineData(Result, x1, y1, x2, y2);

    dimage := TDicomImageData.Create(ImplicitVRLittleEndian, pw2, len1);
    Result.Add(32736, 16).AddData(dimage);

    Result.ImageData.Modify := true;
  end;
end;

function TDicomMPRImage.GetMprDataset(AObject: TDicomDrawObject): TDicomAttributes;
var
  i3, i2, i1, i, k, l, len1, w1, l1, width1: Integer;
  //  v1: TDCMIntegerArray;
  das1: TDicomDataset;
  p1: Pointer;

  pb1: PByte;

  prgb1: PRGB;
  dimage: TDicomImageData;
  da1: TDicomAttribute;

  imagearray: array of Pointer;

  pw1: PWord;
  pwa1: Wordp;

  ps1: PSmallInt;
  psa1: SmallP;

  pf1: PSingle;
  pfa1: Singlep;

  pba1: Bytep;
  prgba1: RGBp;

  dx, dy, xinc, yinc, rx, ry: double;
  lc, n, lck: Integer;

  pw2: PWord;
  x1, y1, x2, y2: Double;
begin
  p1 := nil;
  k := 0;
  if fList.Count <= 2 then
    exit;
  das1 := TDicomDataset(fList[0]);
  b1 := das1.Attributes.ImageData.Bits;
  b2 := das1.Attributes.ImageData.SamplePerPixel;
  w1 := das1.Attributes.ImageData.WindowCenter;
  l1 := das1.Attributes.ImageData.WindowWidth;
  width1 := das1.Attributes.ImageData.Width;
  //new_height := trunc(fList.Count * new_z_pz);
  setlength(imagearray, fList.Count);
  for i := 0 to fList.Count - 1 do
  begin
    das1 := TDicomDataset(fList[i]);
    if das1.Attributes.ImageData.DecompressData(0) then
      imagearray[i] := das1.Attributes.ImageData.ImageData[0].Data;
  end;
  k := 0;

  for lc := 0 to AObject.GetCount - 2 do
  begin
    x1 := (AObject.X[lc]);
    y1 := (AObject.Y[lc]);
    x2 := (AObject.X[lc + 1]);
    y2 := (AObject.Y[lc + 1]);
    dx := x2 - x1;
    dy := y2 - y1;
    n := trunc(sqrt(dx * dx + dy * dy));
    k := k + n + 1;
  end;

  new_width := k;

  len1 := k * new_height * b2 * ((b1 + 7) div 8);
  GetMem(p1, k * fList.Count * b2 * ((b1 + 7) div 8));
  GetMem(pw2, len1);

  if b1 <= 8 then
  begin
    if b1 = 1 then
    begin
      //setlength(imagearraybyte, fList.Count);
      //pb1 := p1;
    end
    else
    begin
      //setlength(imagearrayrgb, fList.Count);
      //prgb1 := p1;
    end;
  end
  else
  begin
    {.$IFDEF USE_16_TO_FLOAT_BUFFER}
    if TDicomDataset(fList[0]).BufferLength = diblFloat then
    begin
      lck := 0;
      for lc := 0 to AObject.GetCount - 2 do
      begin
        x1 := (AObject.X[lc]);
        y1 := (AObject.Y[lc]);
        x2 := (AObject.X[lc + 1]);
        y2 := (AObject.Y[lc + 1]);

        dx := x2 - x1;
        dy := y2 - y1;
        n := trunc(sqrt(dx * dx + dy * dy));
        if n > 0 then
        begin
          //GetMem(p0, k * fList.Count * b2 * ((b1 + 7) div 8));

          xinc := dx / n;
          yinc := dy / n;

          ps1 := p1;
          //pw0 := p0;
          rx := x1;
          ry := y1;
          for i := 0 to n - 1 do
          begin
            i2 := trunc(ry) * width1 + trunc(rx);
            ps1 := p1;
            inc(ps1, lck + i);
            for i1 := 0 to fList.Count - 1 do
            begin
              {i3 := trunc((i1) / new_z_pz);
              if i3 < 0 then
                i3 := 0;
              if i3 >= fList.Count then
                i3 := fList.Count - 1;}
              pfa1 := imagearray[i1];
              {if i1 < (fList.Count - 1) then
                pwa0 := imagearray[i1 + 1]
              else
                pwa0 := imagearray[i1];
              }
              //pw0^ := pwa0[i2];
              ps1^ := round(pfa1[i2]);
              inc(ps1, k);
            end;
            rx := rx + xinc;
            ry := ry + yinc;
          end;
        end;
        lck := lck + n;
      end;
      StretchResample(p1, 0, 0, k, fList.Count, pw2, 0, 0, k, new_Height, sfLinear); //sfCatmullRom);
    end
    else
    begin {.$ELSE}
      lck := 0;
      for lc := 0 to AObject.GetCount - 2 do
      begin
        x1 := (AObject.X[lc]);
        y1 := (AObject.Y[lc]);
        x2 := (AObject.X[lc + 1]);
        y2 := (AObject.Y[lc + 1]);

        dx := x2 - x1;
        dy := y2 - y1;
        n := trunc(sqrt(dx * dx + dy * dy));
        if n > 0 then
        begin
          //GetMem(p0, k * fList.Count * b2 * ((b1 + 7) div 8));

          xinc := dx / n;
          yinc := dy / n;

          rx := x1;
          ry := y1;

          if das1.Attributes.ImageData.PixelRepresentation then
          begin
            pw1 := p1;
            for i := 0 to n - 1 do
            begin
              i2 := trunc(ry) * width1 + trunc(rx);
              pw1 := p1;
              //inc(pw1, i);
              inc(pw1, lck + i);
              for i1 := 0 to fList.Count - 1 do
              begin
                pwa1 := imagearray[i1];
                pw1^ := pwa1[i2];
                inc(pw1, k);
              end;
              rx := rx + xinc;
              ry := ry + yinc;
            end;
          end
          else
            if das1.Attributes.ImageData.PixelRepresentation then
          begin
            ps1 := p1;
            for i := 0 to n - 1 do
            begin
              i2 := trunc(ry) * width1 + trunc(rx);
              ps1 := p1;
              //inc(ps1, i);
              inc(ps1, lck + i);
              for i1 := 0 to fList.Count - 1 do
              begin
                psa1 := imagearray[i1];
                ps1^ := psa1[i2];
                inc(ps1, k);
              end;
              rx := rx + xinc;
              ry := ry + yinc;
            end;
          end;
          lck := lck + n;
        end;
        if das1.Attributes.ImageData.PixelRepresentation then
          StretchResampleWord(p1, 0, 0, k, fList.Count, pw2, 0, 0, k, new_Height, sfLinear) //sfCatmullRom);
        else
          StretchResample(p1, 0, 0, k, fList.Count, pw2, 0, 0, k, new_Height, sfLinear); //sfCatmullRom);
      end;
    end; //{$ENDIF}
  end;

  FreeMem(p1);

  if k > 0 then
  begin
    //build a new tdicomimage

    Result := TDicomAttributes.Create;
    Result.AddVariant(8, $16, '1.2.840.10008.5.1.4.1.1.7'); //sc
    Result.AddVariant(8, 8, 'ORIGINAL/PRIMARY//0001');
    Result.AddVariant(8, $60, 'SC');
    Result.AddVariant(8, $70, 'CNSoft');

    Result.Add(8, $20).AsDatetime[0] := now;
    Result.Add(8, $21).AsDatetime[0] := now;
    Result.Add(8, $23).AsDatetime[0] := now;
    Result.Add(8, $30).AsDatetime[0] := now;
    Result.Add(8, $31).AsDatetime[0] := now;
    Result.Add(8, $33).AsDatetime[0] := now;
    //  Result.AddVariant($20, $13, AImageIndex);

    {da1 := Result.Add($28, $34);
    da1.AsInteger[0] := Trunc(new_z_pz * 100);
    da1.AsInteger[1] := 100;
    da1.AsInteger[2] := 1;}
    da1 := Result.Add($28, $30);
    da1.AsFloat[0] := XSpace;
    da1.AsFloat[1] := XSpace;

    Result.AddVariant($28, $11, k);
    Result.AddVariant($28, $10, new_height);

    Result.AddVariant($28, $2, b2);
    Result.AddVariant($28, $4, fPhotometricInterpretation); //'MONOCHROME2');

    {.$IFNDEF USE_16_TO_FLOAT_BUFFER}
    if TDicomDataset(fList[0]).BufferLength <> diblFloat then
    begin
      Result.Add($28, $1052).AsFloat[0] := FRescaleIntercept;
      Result.Add($28, $1053).AsFloat[0] := FRescaleSlope;
      //Result.AddVariant($28, $1052, FRescaleIntercept);
      //Result.AddVariant($28, $1053, FRescaleSlope);
      Result.AddVariant($28, $103, fPixelPrecention);
      Result.AddVariant($28, $120, FPixelPaddingValue);
    end
    else
    begin {.$ELSE}
      Result.AddVariant($28, $103, 1);
    end; //{$ENDIF}

    Result.AddVariant($28, $6, FPlanarConfiguration);

    Result.AddVariant($28, $100, b1);
    Result.AddVariant($28, $101, b1);
    Result.AddVariant($28, $102, b1 - 1);

    Result.AddVariant($28, $1050, w1);
    Result.AddVariant($28, $1051, l1);

    ComputeReffrenceLineData(Result, x1, y1, x2, y2);

    dimage := TDicomImageData.Create(ImplicitVRLittleEndian, pw2, len1);
    Result.Add(32736, 16).AddData(dimage);

  end;
end;

constructor TDicomMPRImage.Create(ADatasets: TDicomDatasets; ASeriesUID: string);
  function FindTP(ADataset: TDicomDataset): Boolean;
  var
    f1, f2: Double;
    d1, d2: TDicomAttribute;
    i: Integer;
  begin
    Result := false;
    d1 := ADataset.Attributes.Item[$20, $50];
    if d1 <> nil then
    begin
      f1 := d1.AsFloat[0];
      for i := 0 to fList.Count - 1 do
      begin
        d2 := TDicomDataset(fList[i]).Attributes.Item[$20, $50];
        if d2 <> nil then
        begin
          f2 := d2.AsFloat[0];
          if f2 = f1 then
          begin
            Result := true;
            exit;
          end;
        end;
      end;
    end;
  end;
var
  i: integer;
begin
  FIndexEnd := 0;
  FIndexStart := 0;
  //FSelectRect: TRect;

  FIgnoreSliceCheck := false;
  FSortInvert := true;

  fList := TList.Create;
  if ADatasets <> nil then
  begin
    for i := 0 to ADatasets.Count - 1 do
    begin
      //ADatasets[i].Attributes.ImageData.DecompressData(0);

      if ADatasets[i].Attributes.GetString($20, $E) = ASeriesUID then
      begin
        if not FindTP(ADatasets[i]) then
          fList.Add(ADatasets[i]);
        if fList.Count = 1 then
        begin
          fIsWord := ADatasets[i].Attributes.getInteger($28, $103) = 0;
        end;
      end;
    end;

    InitData;
  end;
end;

constructor TDicomMPRImage.Create(ADataset: TDicomDataset);
//var
//  i: integer;
begin
  FIndexEnd := 0;
  FIndexStart := 0;
  //FSelectRect: TRect;

  FIgnoreSliceCheck := false;
  FSortInvert := true;

  fList := TList.Create;
  if (ADataset <> nil) and (ADataset.Attributes.ImageData.FrameCount > 3) then
  begin
    fList.Add(ADataset);
    fIsWord := ADataset.Attributes.getInteger($28, $103) = 0;

    InitData;
  end;
end;

function TDicomMPRImage.getX: integer;
begin
  Result := ImageWidth;
end;

function TDicomMPRImage.getY: integer;
begin
  Result := ImageHeight;

end;

function TDicomMPRImage.getZ: integer;
begin
  Result := new_height;

end;

function TDicomMPRImage.GetSliceNo(ADataset: TDicomDataset): Integer;
begin
  Result := fList.IndexOf(ADataset);
end;

function TDicomMPRImage.GetSliceCount: integer;
begin
  Result := fList.Count;
  if Result = 1 then
  begin
    Result := TDicomDataset(fList[0]).Attributes.ImageData.FrameCount;
  end;
end;

function TDicomMPRImage.GetImageData(Index: integer): TDicomImage;
var
  das1: TDicomDataset;
begin
  if (Index >= 0) and (Index < fList.Count) then
  begin
    das1 := TDicomDataset(fList[Index]);
    Result := das1.Attributes.ImageData;
  end
  else
    Result := nil;
end;

function TDicomMPRImage.GetDataset(Index: Integer): TDicomDataset;
begin
  if (Index >= 0) and (Index < fList.Count) then
  begin
    Result := TDicomDataset(fList[Index]);
  end
  else
    Result := nil;
end;

function TDicomMPRImage.GetImageDatas(AList: TList): Integer;
var
  i: integer;
  das1: TDicomDataset;
begin
  for i := 0 to fList.Count - 1 do
  begin
    das1 := TDicomDataset(fList[i]);
    AList.Add(das1.Attributes.ImageData);
  end;
  Result := fList.Count;
end;

{$IFNDEF LEVEL6}

function CompareValue(k1, k2: Integer): Integer; overload;
begin
  if k1 > k2 then
    Result := 1
  else
    if k1 < k2 then
    Result := -1
  else
    Result := 0;
end;

function CompareValue(k1, k2: TDatetime): Integer; overload;
begin
  if k1 > k2 then
    Result := 1
  else
    if k1 < k2 then
    Result := -1
  else
    Result := 0;
end;
{$ENDIF}

function CompareDicomDataset1X(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  k1, k2: Integer;
  f1, f2: Double;
  da1, da2: TDicomAttribute;
begin
  //dsbSliceLocation
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  k1 := das1.Attributes.GetInteger($20, $11);
  k2 := das2.Attributes.GetInteger($20, $11);
  Result := CompareValue(k1, k2);
  if (Result = 0) then
  begin
    da1 := das1.Attributes.Item[$0020, $1041];
    da2 := das2.Attributes.Item[$0020, $1041];
    if assigned(da1) and assigned(da2) then
    begin
      f1 := (da1.AsFloat[0]);
      f2 := (da2.AsFloat[0]);
      Result := CompareValue(f1, f2);
    end;
  end;
end;

function CompareDicomDataset2X(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  k1, k2: Integer;
  f1, f2: Double;
  da1, da2: TDicomAttribute;
begin
  //dsbReverseSliceLocation
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  k1 := das1.Attributes.GetInteger($20, $11);
  k2 := das2.Attributes.GetInteger($20, $11);
  Result := CompareValue(k1, k2);
  if (Result = 0) then
  begin
    da1 := das1.Attributes.Item[$0020, $1041];
    da2 := das2.Attributes.Item[$0020, $1041];
    if assigned(da1) and assigned(da2) then
    begin
      f1 := (da1.AsFloat[0]);
      f2 := (da2.AsFloat[0]);
      Result := CompareValue(f2, f1);
    end;
  end;
end;

function CompareDicomDataset1(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  k1, k2: Integer;
  f1, f2: Double;
  da1, da2: TDicomAttribute;
begin
  //dsbSliceLocation
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  k1 := das1.Attributes.GetInteger($20, $11);
  k2 := das2.Attributes.GetInteger($20, $11);
  Result := CompareValue(k1, k2);
  if (Result = 0) then
  begin
    da1 := das1.Attributes.Item[$0020, $1041];
    da2 := das2.Attributes.Item[$0020, $1041];
    if assigned(da1) and assigned(da2) then
    begin
      f1 := abs(da1.AsFloat[0]);
      f2 := abs(da2.AsFloat[0]);
      Result := CompareValue(f1, f2);
    end;
  end;
end;

function CompareDicomDataset2(Item1, Item2: Pointer): Integer;
var
  das1, das2: TDicomDataset;
  k1, k2: Integer;
  f1, f2: Double;
  da1, da2: TDicomAttribute;
begin
  //dsbReverseSliceLocation
  das1 := TDicomDataset(Item1);
  das2 := TDicomDataset(Item2);
  k1 := das1.Attributes.GetInteger($20, $11);
  k2 := das2.Attributes.GetInteger($20, $11);
  Result := CompareValue(k1, k2);
  if (Result = 0) then
  begin
    da1 := das1.Attributes.Item[$0020, $1041];
    da2 := das2.Attributes.Item[$0020, $1041];
    if assigned(da1) and assigned(da2) then
    begin
      f1 := abs(da1.AsFloat[0]);
      f2 := abs(da2.AsFloat[0]);
      Result := CompareValue(f2, f1);
    end;
  end;
end;

procedure TDicomMPRImage.InitData;
var
  das1: TDicomDataset;
  d1, D2, da1: TDicomAttribute;
  f1, f2: Double;
  i, {k,} m, kk, w1, h1: integer;
  l1: TList;
begin
  if fList.Count > 3 then
  begin
    //SortInvert := true;

    das1 := TDicomDataset(fList[1]);

    {if das1.Attributes.GetString(8, $60) = 'CT' then
    begin
      //dsbSliceLocation
      fList.Sort(CompareDicomDataset1);
    end
    else
    begin
      //dsbSliceLocation
      fList.Sort(CompareDicomDataset1X);
    end; }

    //dsbReverseSliceLocation
    //fList.Sort(CompareDicomDataset2);

    das1 := TDicomDataset(fList[1]);

    b1 := das1.Attributes.ImageData.Bits;
    b2 := das1.Attributes.ImageData.SamplePerPixel;
    //GetMem(p1, len1);
    //l1 := das1.Attributes.ImageData.WindowCenter;
    //w1 := das1.Attributes.ImageData.WindowWidth;
    XSpace := das1.Attributes.ImageData.PixelSpacingX * 10;
    YSpace := das1.Attributes.ImageData.PixelSpacingY * 10;

    w1 := das1.Attributes.ImageData.Width;
    h1 := das1.Attributes.ImageData.Height;
    if (XSpace = 0) or (YSpace = 0) then
      raise Exception.Create('PixelSpace = 0. Error!');
    fPixelPrecention := das1.Attributes.getInteger($28, $103);

    d1 := TDicomDataset(fList[1]).Attributes.Item[$20, $1041];
    d2 := TDicomDataset(fList[2]).Attributes.Item[$20, $1041];
    if (d2 <> nil) and (d1 <> nil) then
    begin
      f1 := d1.AsFloat[0];
      f2 := d2.AsFloat[0];
      kk := 2;
      ZSpace := abs(f1 - f2);
      FIgnoreSliceCheck := false;
    end
    else
    begin

      d1 := TDicomDataset(fList[1]).Attributes.Item[$20, $32];
      d2 := TDicomDataset(fList[2]).Attributes.Item[$20, $32];
      if (d2 <> nil) and (d1 <> nil) then
      begin
        f1 := d1.AsFloat[2];
        f2 := d2.AsFloat[2];
        kk := 2;
        ZSpace := abs(f1 - f2);
        if ZSpace < 0.001 then
        begin
          f1 := d1.AsFloat[1];
          f2 := d2.AsFloat[1];
          ZSpace := abs(f1 - f2);
          kk := 1;
        end;

        if ZSpace < 0.001 then
        begin
          f1 := d1.AsFloat[0];
          f2 := d2.AsFloat[0];
          ZSpace := abs(f1 - f2);
          kk := 0;
        end;
      end
      else
        raise Exception.Create('PixelSpace Z = 0. Error!');
    end;
    if ZSpace < 0.001 then
      fList.Clear;
    fsliceThickness := ZSpace;
    l1 := TList.Create;
    try
      for i := 0 to fList.Count - 1 do
      begin
        das1 := TDicomDataset(fList[i]); //.Attributes.ImageData.DecompressData(0);
        if (w1 = das1.Attributes.ImageData.Width) and
          (h1 = das1.Attributes.ImageData.Height) then
          l1.Add(fList[i]);
      end;
      fList.Clear;
      if FIgnoreSliceCheck then
      begin
        i := 0;
        while i < (l1.Count - 1) do
        begin
          d1 := TDicomDataset(l1[i]).Attributes.Item[$20, $32];
          if (d1 = nil) or (d1.GetCount <= 0) then
            raise Exception.Create('PixelSpace = 0. Error!');
          f1 := d1.AsFloat[kk];
          d1 := TDicomDataset(l1[i + 1]).Attributes.Item[$20, $32];
          if (d1 = nil) or (d1.GetCount <= 0) then
            raise Exception.Create('PixelSpace = 0. Error!');
          f2 := d1.AsFloat[kk];
          if abs(ZSpace - abs(f1 - f2)) > 0.1 then
          begin
            {ShowMessage(format('The images is not Contour  from %d, The image after %d will be delete for mpr', [i + 1,
              TDicomDataset(fList[i + 1]).Attributes.ImageData.InstanceNumber]));
            for k := fList.Count - 1 downto i + 1 do
              fList.Delete(k);
            break; }
            m := 2;
            while (i + m) < (l1.Count - 1) do
            begin
              d1 := TDicomDataset(l1[i + m]).Attributes.Item[$20, $32];
              if (d1 = nil) or (d1.GetCount <= 0) then
                raise Exception.Create('PixelSpace = 0. Error!');
              f2 := d1.AsFloat[kk];
              if abs(ZSpace - abs(f1 - f2)) < 0.1 then
              begin
                fList.Add(l1[i]);
                break;
              end
              else
                inc(m);
            end;
            inc(i, m);

          end
          else
          begin
            fList.Add(l1[i]);
            inc(i);
          end;
        end;
        if i < (l1.Count) then
          fList.Add(l1[l1.Count - 1]);
      end
      else
      begin
        for i := 0 to l1.Count - 1 do
        begin
          fList.Add(l1[i]);
        end;
      end;
    finally
      l1.free;
    end;
    if fList.Count <= 3 then
      raise Exception.Create('Исследование должно содержать больше 3-х изображений');

    //2010-6-11
    //ZSpace := ZSpace / 2;

    FUseBits := das1.Attributes.ImageData.UseBits;
    new_z_pz := (ZSpace / XSpace);
    new_height := round(fList.Count * new_z_pz);
    ImageWidth := das1.Attributes.ImageData.Width;
    ImageHeight := das1.Attributes.ImageData.Height;

    imageSize := ImageWidth * ImageHeight;

    fPhotometricInterpretation := das1.Attributes.ImageData.PhotometricInterpretation;

    FRescaleIntercept := das1.Attributes.ImageData.RescaleIntercept;
    FRescaleSlope := das1.Attributes.ImageData.RescaleSlope;
    FPixelPaddingValue := das1.Attributes.ImageData.PixelPaddingValue;
    FPlanarConfiguration := das1.Attributes.ImageData.PlanarConfiguration;

    FIndexEnd := fList.Count - 1;
    FIndexStart := 0;
    FSelectRect := Rect(0, 0, ImageWidth, ImageHeight);
  end
  else
    if fList.Count = 1 then
  begin
    das1 := TDicomDataset(fList[0]);
    if das1.Attributes.ImageData.FrameCount > 3 then
    begin
      b1 := das1.Attributes.ImageData.Bits;
      b2 := das1.Attributes.ImageData.SamplePerPixel;
      //GetMem(p1, len1);
      //l1 := das1.Attributes.ImageData.WindowCenter;
      //w1 := das1.Attributes.ImageData.WindowWidth;
      XSpace := das1.Attributes.ImageData.PixelSpacingX * 10;
      YSpace := das1.Attributes.ImageData.PixelSpacingY * 10;

      w1 := das1.Attributes.ImageData.Width;
      h1 := das1.Attributes.ImageData.Height;
      if (XSpace = 0) or (YSpace = 0) then
        raise Exception.Create('PixelSpace = 0. Error!');
      fPixelPrecention := das1.Attributes.getInteger($28, $103);

      da1 := das1.Attributes.Item[$0018, $0050];
      if da1 <> nil then
        ZSpace := da1.AsFloat[0]
      else
        ZSpace := 1;

      fsliceThickness := ZSpace;

      FUseBits := das1.Attributes.ImageData.UseBits;
      new_z_pz := (ZSpace / XSpace);
      new_height := round(das1.Attributes.ImageData.FrameCount * new_z_pz);
      ImageWidth := das1.Attributes.ImageData.Width;
      ImageHeight := das1.Attributes.ImageData.Height;

      imageSize := ImageWidth * ImageHeight;

      fPhotometricInterpretation := das1.Attributes.ImageData.PhotometricInterpretation;

      FRescaleIntercept := das1.Attributes.ImageData.RescaleIntercept;
      FRescaleSlope := das1.Attributes.ImageData.RescaleSlope;
      FPixelPaddingValue := das1.Attributes.ImageData.PixelPaddingValue;
      FPlanarConfiguration := das1.Attributes.ImageData.PlanarConfiguration;

      FIndexEnd := das1.Attributes.ImageData.FrameCount - 1;
      FIndexStart := 0;
      FSelectRect := Rect(0, 0, ImageWidth, ImageHeight);

    end
    else
      raise Exception.Create('Исследование должно содержать больше 3-х изображений');
  end;
end;

destructor TDicomMPRImage.Destroy;
begin

  fList.Free;
  inherited;
end;

procedure TDicomMPRImage.GenErrorMessage(str: string; v: real);
var
  st: string;
begin
  st := str + format('%f', [v]);
  raise Exception.Create(st);
end;

procedure TDicomMPRImage.GenErrorMessage(str: string);
begin
  raise Exception.Create(str);
end;

constructor TDicomMaximumIntensityProjection.Create(
  ADatasets: TDicomDatasets; ASeriesUID: string);
begin
  inherited;
  FMipFactor := 0;
end;

destructor TDicomMaximumIntensityProjection.Destroy;
begin

  inherited;
end;

procedure TDicomMaximumIntensityProjection.InitData;
begin
  inherited;

end;

function TDicomMaximumIntensityProjection.Execute(pVol: PSmallint; nCols, nRows, nSlices, nAngles:
  Integer): PSmallint;
var
  p3DProjections: PSmallint;
  p3DPtr: PSmallint;
  pVolPtr: PSmallint;
  pRotatedVol: PSmallint;
  i, j, k, l: Integer;
  nFrameSize: Integer;
  dAngularStep: Double;
begin
  dAngularStep := 360 / nAngles;

  nFrameSize := nCols * nSlices;
  GetMem(p3DProjections, nFrameSize * nAngles * Sizeof(Smallint));

  for k := 0 to nAngles - 1 do // Angle loop
  begin
    pRotatedVol := RotateWordVolume(pVol, i * dAngularStep, nCols, nRows, nSlices);

    // Point to the new projection frame
    p3DPtr := p3DProjections;
    inc(p3DPtr, k * nFrameSize);

    for i := 0 to nSlices - 1 do // 3D project row loop
    begin
      for j := 0 to nCols - 1 do // 3D projection col loop
      begin
        pVolPtr := pRotatedVol;
        inc(pVolPtr, i * nCols * nRows + j);
        p3DPtr^ := pVolPtr^;

        for l := 0 to nRows - 1 do // Depth loop along y-axis
        begin
          if (pVolPtr^ > p3DPtr^) then
            p3DPtr^ := pVolPtr^;
          inc(pVolPtr, nCols);
        end;
        inc(p3DPtr);
      end; // End col loop

    end; // End row loop

    if (pRotatedVol <> pVol) then
      FreeMem(pRotatedVol);

  end; // End angle loop

  Result := p3DProjections;
end;

function TDicomMaximumIntensityProjection.RotateWordVolume(pVol: PSmallint; dAngle: Double; nCols,
  nRows, nSlices: integer): PSmallint;
var
  pRotatedVol, p1, p2: PSmallint;
  i: Integer;
  nFrameSize: Integer;
begin
  nFrameSize := nCols * nRows;

  GetMem(pRotatedVol, nFrameSize * nSlices * SizeOf(Smallint));
  p1 := pVol;
  p2 := pRotatedVol;
  for i := 0 to nSlices - 1 do
  begin
    inc(p1, i * nFrameSize);
    inc(p2, i * nFrameSize);
    RotateWord2D(p1, p2, dAngle, nCols, nRows);
  end;

  Result := pRotatedVol;
end;

function TDicomMaximumIntensityProjection.RotateWord2D(srcFrame: PSmallint; destFrame: PSmallint;
  dAngle: Double;
  nCols, nRows: integer): PSmallint;
begin

  Result := destFrame;
end;

function TDicomMPRImage.GetRange: glFloat;
var
  fx, fy, fz: Double;
begin
  fx := GetX * XSpace;
  fy := GetY * YSpace;
  fz := GetZ * ZSpace;
  Result := Max(fx, Max(fy, fz));
end;

function TDicomMPRImage.getXRange: glFloat;
begin
  Result := GetX * XSpace;
end;

function TDicomMPRImage.getYRange: glFloat;
begin
  Result := GetY * YSpace;
end;

function TDicomMPRImage.getZRange: glFloat;
begin
  Result := GetZ * ZSpace;
end;

procedure TDicomMPRImage.SetIgnoreSliceCheck(const Value: Boolean);
begin
  FIgnoreSliceCheck := Value;
end;

procedure TDicomMPRImage.InvertSort(AValue: Boolean);
begin
  if AValue then
  begin
    //dsbSliceLocation
    fList.Sort(CompareDicomDataset1);
  end
  else
  begin
    //dsbReverseSliceLocation
    fList.Sort(CompareDicomDataset2);
  end;
end;

procedure TDicomMPRImage.SaveAsRawDataFile(AFileNamePerfix: string);
var
  i: Integer;
  das1: TDicomDataset;
begin
  for i := 0 to fList.Count - 1 do
  begin
    das1 := TDicomDataset(fList[i]);

    das1.SaveAsRawFile(AFileNamePerfix + '.' + IntToStr(i + 1));
  end;
end;

procedure TDicomMPRImage.ComputeReffrenceLineData(ADas: TDicomAttributes; x1, y1, x2, y2: Double);
var
  vectors, originArray: TDicomAttribute;
  vectorA, vectorB, Origin, r1: TStructMatrix3D;
  o: TStructPlane3D;
  das1: TDicomDataset;
  dx, dy, n1, a1: Double;
begin
  //compute the vector data
  if fList.Count = 0 then
    exit;

  das1 := TDicomDataset(fList[0]);
  o := das1.Attributes.ImageData.planeForImage;
  Origin := convertPixX(das1.attributes, x1, y1, false);

  dx := x2 - x1 + 1;
  dy := y2 - y1 + 1;

  n1 := trunc(sqrt(dx * dx + dy * dy));
  if n1 = 0 then
    exit;

  r1.x := 0;
  r1.y := 1;
  r1.z := 0;
  vectorB := ArbitraryRotate(o.XNormalVector, DoublePi / 2, r1);

  //if dy<dx then
  begin
    a1 := arcsin(dy / n1);
    if y2 < y1 then
      a1 := -a1;

    r1.x := 0;
    r1.y := 0;
    r1.z := 1;
    vectorA := ArbitraryRotate(o.XNormalVector, a1, r1);
    { end
     else
     begin
       a1 := arcsin(dx / n1);
       if x2 < x1 then
         a1 := -a1;

       r1.x := 0;
       r1.y := 0;
       r1.z := 1;
       vectorA := ArbitraryRotate(o.YNormalVector, a1, r1); }
  end;
  vectors := ADas.Add($20, $37); // ImageOrientationPatient"
  originArray := ADas.Add($20, $32); //ImagePositionPatient

  vectors.AsFloat[0] := vectorA.x; //x
  vectors.AsFloat[1] := vectorA.y;
  vectors.AsFloat[2] := vectorA.z;

  vectors.AsFloat[3] := vectorB.x; //y
  vectors.AsFloat[4] := vectorB.y;
  vectors.AsFloat[5] := vectorB.z;

  originArray.AsFloat[0] := Origin.x;
  originArray.AsFloat[1] := Origin.y;
  originArray.AsFloat[2] := Origin.z;
end;

procedure TDicomMPRImage.ComputeReffrenceLineData(ADas: TDicomAttributes;
  AObject: TDicomDrawObject);
var
  vectors, originArray: TDicomAttribute;
  vectorA, vectorB, Origin: TStructMatrix3D;
begin
  //compute the vector data

  vectors := ADas.Add($20, $37); // ImageOrientationPatient"
  originArray := ADas.Add($20, $32); //ImagePositionPatient

  vectors.AsFloat[0] := vectorA.x;
  vectors.AsFloat[1] := vectorA.y;
  vectors.AsFloat[2] := vectorA.z;

  vectors.AsFloat[3] := vectorB.x;
  vectors.AsFloat[4] := vectorB.y;
  vectors.AsFloat[5] := vectorB.z;

  originArray.AsFloat[0] := Origin.x;
  originArray.AsFloat[1] := Origin.y;
  originArray.AsFloat[2] := Origin.z;
end;

procedure TDicomMPRImage.SetSortInvert(const Value: Boolean);
begin
  FSortInvert := Value;
  InvertSort(Value);
end;

procedure TDicomMaximumIntensityProjection.SetMipFactor(
  const Value: Double);
begin
  FMipFactor := Value;
end;

function TDicomMPRImage.GetIsCine: Boolean;
begin
  Result := False;
  if fList.Count = 1 then
  begin
    Result := TDicomDataset(fList[0]).Attributes.ImageData.FrameCount > 1;
  end;

end;

procedure TDicomMPRImage.SetIndexEnd(const Value: Integer);
begin
  FIndexEnd := Value;
end;

procedure TDicomMPRImage.SetIndexStart(const Value: Integer);
begin
  FIndexStart := Value;
end;

procedure TDicomMPRImage.SetSelectRect(const Value: TRect);
begin
  FSelectRect := Value;
end;

end.

