{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DcmImageConvert;

{$I DicomPack.inc}

interface

uses
  {$IFDEF LINUX}Types, Libc, QControls, Qgraphics, {$ELSE}
  Windows, Messages, Forms, Controls, graphics, {$ENDIF}
  SysUtils, Classes, {$IFDEF LEVEL6}Types, {$ENDIF}
  DCM_Bitmap16, DCM_Dict;

procedure vImageConvert_Fto16U(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AFactor: single; AOffset: single);
procedure vImageConvert_Fto16S(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AFactor: single; AOffset: single);

procedure vImageConvert_16UtoF(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AFactor: single; AOffset: single);
procedure vImageConvert_16StoF(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AFactor: single; AOffset: single);

procedure vImageConvert_Planar8toPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);

procedure vImageConvert_PlanarRGBtoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_PlanarRGB_PlanarConfiguration1_toPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_PlanarRGB_PlanarConfiguration2_toPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_PlanarFtoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_Planar16UtoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_Planar16StoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_Planar32UtoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_Planar32StoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);

procedure vImageConvert_PlanarRGBtoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_PlanarRGB_PlanarConfiguration1_toPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_PlanarRGB_PlanarConfiguration2_toPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_PlanarFtoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar16UtoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar16StoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar32UtoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
procedure vImageConvert_Planar32StoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);

procedure vImageConvert_Planar8toPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_PlanarFtoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_Planar16UtoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_Planar16StoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_Planar32UtoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
procedure vImageConvert_Planar32StoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);

procedure vImageConvert_Planar8Rotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
procedure vImageConvert_Planar8Rotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_Planar8Rotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_Planar8Rotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_Planar8FlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
procedure vImageConvert_Planar8FlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);

procedure vImageConvert_Planar16Rotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
procedure vImageConvert_Planar16Rotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_Planar16Rotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_Planar16Rotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_Planar16FlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
procedure vImageConvert_Planar16FlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);

procedure vImageConvert_Planar32Rotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
procedure vImageConvert_Planar32Rotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_Planar32Rotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_Planar32Rotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_Planar32FlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
procedure vImageConvert_Planar32FlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);

procedure vImageConvert_PlanarRGBRotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
procedure vImageConvert_PlanarRGBRotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_PlanarRGBRotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_PlanarRGBRotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_PlanarRGBFlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
procedure vImageConvert_PlanarRGBFlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);

procedure vImageConvert_PlanarARGBRotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
procedure vImageConvert_PlanarARGBRotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_PlanarARGBRotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_PlanarARGBRotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
procedure vImageConvert_PlanarARGBFlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
procedure vImageConvert_PlanarARGBFlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);

implementation

function GetPalette(x, y: Integer; ACustomPalette: TList): TDicomImagePalette;
  function IsInRect(ARect: TRect): Boolean;
  begin
    Result := (ARect.Right = ARect.Left) or (ARect.Top = ARect.Bottom) or
      (((x >= ARect.Left) and (x <= ARect.Right)) and ((y >= ARect.Top) and (y <= ARect.Bottom)));
  end;
var
  n1: TDicomImagePalette;
  i: Integer;
begin
  Result := nil;
  if ACustomPalette.Count > 0 then
  begin
    for i := ACustomPalette.Count - 1 downto 0 do
    begin
      n1 := TDicomImagePalette(ACustomPalette[i]);
      if IsInRect(n1.fRect) then
      begin
        Result := n1;
        exit;
      end;
    end;
  end;
end;

procedure MoveLongword(const Source; var Dest; Count: Integer);
asm
// EAX = Source
// EDX = Dest
// ECX = Count
        PUSH    ESI
        PUSH    EDI

        MOV     ESI,EAX
        MOV     EDI,EDX
        MOV     EAX,ECX
        CMP     EDI,ESI
        JE      @exit

        REP     MOVSD
@exit:
        POP     EDI
        POP     ESI
end;

procedure vImageConvert_Planar8toPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PByte;
  p2: PByte;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 255
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_PlanarFtoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PSingle;
  p2: PByte;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 255
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar16UtoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PWord;
  p2: PByte;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 255
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar16StoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PSmallInt;
  p2: PByte;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 255
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar32UtoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PLongWord;
  p2: PByte;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 255
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar32StoPlanar8(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PInteger;
  p2: PByte;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 255
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar8toPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PByte;
  np1: Byte;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;

  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_PlanarFtoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PSingle;
  np1: Single;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;

  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar16UtoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PWord;
  np1: Word;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;

  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar16StoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PSmallInt;
  np1: SmallInt;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;

  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar32UtoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PLongWord;
  np1: LongWord;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;

  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar32StoPlanar8DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PInteger;
  np1: Integer;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar8toPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PByte;
  np1: Single;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_PlanarFtoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PSingle;
  np1: Single;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar16UtoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PWord;
  np1: Single;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar16StoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PSmallInt;
  np1: Single;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar32UtoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PLongWord;
  np1: Single;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar32StoPlanar8Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PInteger;
  np1: Single;
  p2: PByte;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 255
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := $FF - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar8toPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PByte;
  p2: PWord;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 4095
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_PlanarFtoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PSingle;
  p2: PWord;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 4095
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar16UtoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PWord;
  p2: PWord;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 4095
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar16StoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PSmallInt;
  p2: PWord;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 4095
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar32UtoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PLongWord;
  p2: PWord;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 4095
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar32StoPlanar12(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1: PInteger;
  p2: PWord;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if p1^ < AMin then
      p2^ := 0
    else
      if p1^ > AMax then
      p2^ := 4095
    else
      p2^ := trunc(((p1^) - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar8toPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PByte;
  np1: Byte;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_PlanarFtoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PSingle;
  np1: Single;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar16UtoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PWord;
  np1: Word;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar16StoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PSmallInt;
  np1: SmallInt;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar32UtoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PLongWord;
  np1: LongWord;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar32StoPlanar12DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PInteger;
  np1: Integer;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ - p11^;
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar8toPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PByte;
  np1: Single;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_PlanarFtoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PSingle;
  np1: Single;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar16UtoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PWord;
  np1: Single;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;

end;

procedure vImageConvert_Planar16StoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PSmallInt;
  np1: Single;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar32UtoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PLongWord;
  np1: Single;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;
end;

procedure vImageConvert_Planar32StoPlanar12Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; MergeFactor: Double; dstBits: Integer; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i: Integer;
  p1, p11: PInteger;
  np1: Single;
  p2: PWord;
begin
  p1 := srcData1;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 4095 / lRange;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
    if np1 < AMin then
      p2^ := 0
    else
      if np1 > AMax then
      p2^ := 4095
    else
      p2^ := trunc((np1 - AMin) * lScaleShl10);
    if ANegative then
      p2^ := 4096 - p2^;
    inc(p1);
    inc(p11);
    inc(p2);
  end;
end;

procedure vImageConvert_PlanarRGBtoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
 { i,} ix, iy: Integer;
  p1: pRGB;
  p2: pRGB;
  r1, g1, b1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData;

  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^.r < AMin then
          r1 := 0
        else
          if p1^.r > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^.r) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        if p1^.g < AMin then
          g1 := 0
        else
          if p1^.g > AMax then
          g1 := 255
        else
          g1 := trunc(((p1^.g) - AMin) * lScaleShl10);
        if ANegative then
          g1 := 255 - g1;

        if p1^.b < AMin then
          b1 := 0
        else
          if p1^.b > AMax then
          b1 := 255
        else
          b1 := trunc(((p1^.b) - AMin) * lScaleShl10);
        if ANegative then
          b1 := 255 - b1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := g1;
          p2^.r := b1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[g1];
          p2^.r := n1.FRedTable[b1];
        end;

        inc(p1);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^.r < AMin then
          r1 := 0
        else
          if p1^.r > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^.r) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        if p1^.g < AMin then
          g1 := 0
        else
          if p1^.g > AMax then
          g1 := 255
        else
          g1 := trunc(((p1^.g) - AMin) * lScaleShl10);
        if ANegative then
          g1 := 255 - g1;

        if p1^.b < AMin then
          b1 := 0
        else
          if p1^.b > AMax then
          b1 := 255
        else
          b1 := trunc(((p1^.b) - AMin) * lScaleShl10);
        if ANegative then
          b1 := 255 - b1;

        p2^.b := r1;
        p2^.g := g1;
        p2^.r := b1;

        inc(p1);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_PlanarRGB_PlanarConfiguration1_toPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  np1, np2, np3: PByte;
  p2: pRGB;
  r1, g1, b1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  np1 := srcData;
  np2 := np1;
  inc(np2, srcWidth * srcHeight);
  np3 := np2;
  inc(np3, srcWidth * srcHeight);

  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if np1^ < AMin then
          r1 := 0
        else
          if np1^ > AMax then
          r1 := 255
        else
          r1 := trunc((np1^ - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        if np2^ < AMin then
          g1 := 0
        else
          if np2^ > AMax then
          g1 := 255
        else
          g1 := trunc((np2^ - AMin) * lScaleShl10);
        if ANegative then
          g1 := 255 - g1;

        if np3^ < AMin then
          b1 := 0
        else
          if np3^ > AMax then
          b1 := 255
        else
          b1 := trunc((np3^ - AMin) * lScaleShl10);
        if ANegative then
          b1 := 255 - b1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.r := r1;
          p2^.g := g1;
          p2^.b := b1;
        end
        else
        begin
          p2^.r := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[g1];
          p2^.b := n1.FRedTable[b1];
        end;

        inc(np1);
        inc(np2);
        inc(np3);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if np1^ < AMin then
          r1 := 0
        else
          if np1^ > AMax then
          r1 := 255
        else
          r1 := trunc((np1^ - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        if np2^ < AMin then
          g1 := 0
        else
          if np2^ > AMax then
          g1 := 255
        else
          g1 := trunc((np2^ - AMin) * lScaleShl10);
        if ANegative then
          g1 := 255 - g1;

        if np3^ < AMin then
          b1 := 0
        else
          if np3^ > AMax then
          b1 := 255
        else
          b1 := trunc((np3^ - AMin) * lScaleShl10);
        if ANegative then
          b1 := 255 - b1;

        p2^.r := r1;
        p2^.g := g1;
        p2^.b := b1;

        inc(np1);
        inc(np2);
        inc(np3);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_PlanarRGB_PlanarConfiguration2_toPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
 { i,} ix, iy: Integer;
  p1: pRGB;
  p2: pRGB;
  r1, g1, b1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^.r < AMin then
          r1 := 0
        else
          if p1^.r > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^.r) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        if p1^.g < AMin then
          g1 := 0
        else
          if p1^.g > AMax then
          g1 := 255
        else
          g1 := trunc(((p1^.g) - AMin) * lScaleShl10);
        if ANegative then
          g1 := 255 - g1;

        if p1^.b < AMin then
          b1 := 0
        else
          if p1^.b > AMax then
          b1 := 255
        else
          b1 := trunc(((p1^.b) - AMin) * lScaleShl10);
        if ANegative then
          b1 := 255 - b1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.r := r1;
          p2^.g := g1;
          p2^.b := b1;
        end
        else
        begin
          p2^.r := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[g1];
          p2^.b := n1.FRedTable[b1];
        end;

        inc(p1);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^.r < AMin then
          r1 := 0
        else
          if p1^.r > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^.r) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        if p1^.g < AMin then
          g1 := 0
        else
          if p1^.g > AMax then
          g1 := 255
        else
          g1 := trunc(((p1^.g) - AMin) * lScaleShl10);
        if ANegative then
          g1 := 255 - g1;

        if p1^.b < AMin then
          b1 := 0
        else
          if p1^.b > AMax then
          b1 := 255
        else
          b1 := trunc(((p1^.b) - AMin) * lScaleShl10);
        if ANegative then
          b1 := 255 - b1;

        p2^.r := r1;
        p2^.g := g1;
        p2^.b := b1;

        inc(p1);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar8toPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
 { i,} ix, iy: Integer;
  p1: PByte;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p2);
      end;
    end;
  end
  else
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
        //for i := 0 to srcWidth * srcHeight - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_PlanarFtoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1: PSingle;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p2);
      end;
    end;
  end
  else
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
        //for i := 0 to srcWidth * srcHeight - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar16UtoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
 { i,} ix, iy: Integer;
  p1: PWord;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p2);
      end;
    end;
  end
  else
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
        //for i := 0 to srcWidth * srcHeight - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar16StoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
 { i,} ix, iy: Integer;
  p1: PSmallInt;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar32UtoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1: PLongWord;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar32StoPlanarRGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1: PInteger;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar8toPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PByte;
  np1: Byte;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_PlanarFtoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PSingle;
  np1: Single;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar16UtoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PWord;
  np1: Word;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;

  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar16StoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PSmallInt;
  np1: SmallInt;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar32UtoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PLongWord;
  np1: LongWord;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar32StoPlanarRGB_DSA(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PInteger;
  np1: Integer;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar8toPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PByte;
  np1: Single;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;

  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_PlanarFtoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PSingle;
  np1: Single;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar16UtoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PWord;
  np1: Single;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar16StoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PSmallInt;
  np1: Single;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar32UtoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PLongWord;
  np1: Single;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

procedure vImageConvert_Planar32StoPlanarRGB_Merge(srcData1, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  {i,} ix, iy: Integer;
  p1, p11: PInteger;
  np1: Single;
  p2: pRGB;
  r1: Byte;
  n1: TDicomImagePalette;
  bmp: TBitmap;
begin
  p1 := srcData1;
  p11 := srcData2;
  //p2 := dstData;
  bmp := TBitmap(dstData);

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if not assigned(n1) then
        begin
          p2^.b := r1;
          p2^.g := r1;
          p2^.r := r1;
        end
        else
        begin
          p2^.b := n1.FBlueTable[r1];
          p2^.g := n1.FGreenTable[r1];
          p2^.r := n1.FRedTable[r1];
        end;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
  end
  else
    //for i := 0 to srcWidth * srcHeight - 1 do
    for iy := 0 to srcHeight - 1 do
    begin
      //p2 := dstData;
      //inc(p2, (srcHeight - 1 - iy) * srcWidth);
      p2 := bmp.ScanLine[iy];
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        p2^.r := r1;
        p2^.g := r1;
        p2^.b := r1;

        inc(p1);
        inc(p11);
        inc(p2);
      end;
    end;
end;

//////////PlanarARGB//////////////////////////////////////
procedure vImageConvert_PlanarRGBtoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1: pRGB;
  p2: pLongWord;
  r1, g1, b1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^.r < AMin then
          r1 := 0
        else
          if p1^.r > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^.r) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        if p1^.g < AMin then
          g1 := 0
        else
          if p1^.g > AMax then
          g1 := 255
        else
          g1 := trunc(((p1^.g) - AMin) * lScaleShl10);
        if ANegative then
          g1 := 255 - g1;

        if p1^.b < AMin then
          b1 := 0
        else
          if p1^.b > AMax then
          b1 := 255
        else
          b1 := trunc(((p1^.b) - AMin) * lScaleShl10);
        if ANegative then
          b1 := 255 - b1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ :=$FF000000 + b1 shl 16 + g1 shl 8 + r1
        else
          p2^ :=$FF000000 + n1.FRedTable[b1] shl 16 + n1.FGreenTable[g1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      if p1^.r < AMin then
        r1 := 0
      else
        if p1^.r > AMax then
        r1 := 255
      else
        r1 := trunc(((p1^.r) - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      if p1^.g < AMin then
        g1 := 0
      else
        if p1^.g > AMax then
        g1 := 255
      else
        g1 := trunc(((p1^.g) - AMin) * lScaleShl10);
      if ANegative then
        g1 := 255 - g1;

      if p1^.b < AMin then
        b1 := 0
      else
        if p1^.b > AMax then
        b1 := 255
      else
        b1 := trunc(((p1^.b) - AMin) * lScaleShl10);
      if ANegative then
        b1 := 255 - b1;

      p2^ :=$FF000000 + b1 shl 16 + g1 shl 8 + r1; //color32(b1, g1, r1);

      inc(p1);
      inc(p2);
    end;
end;

procedure vImageConvert_PlanarRGB_PlanarConfiguration1_toPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  np1, np2, np3: PByte;
  p2: pLongWord;
  r1, g1, b1: Byte;
  n1: TDicomImagePalette;
begin
  //p1 := srcData;
  np1 := srcData;
  np2 := np1;
  inc(np2, srcWidth * srcHeight);
  np3 := np2;
  inc(np3, srcWidth * srcHeight);

  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        if np1^ < AMin then
          r1 := 0
        else
          if np1^ > AMax then
          r1 := 255
        else
          r1 := trunc((np1^ - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        if np2^ < AMin then
          g1 := 0
        else
          if np2^ > AMax then
          g1 := 255
        else
          g1 := trunc((np2^ - AMin) * lScaleShl10);
        if ANegative then
          g1 := 255 - g1;

        if np3^ < AMin then
          b1 := 0
        else
          if np3^ > AMax then
          b1 := 255
        else
          b1 := trunc((np3^ - AMin) * lScaleShl10);
        if ANegative then
          b1 := 255 - b1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ :=$FF000000 + r1 shl 16 + g1 shl 8 + b1
        else
          p2^ :=$FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[g1] shl 8 + n1.FBlueTable[b1];

        inc(np1);
        inc(np2);
        inc(np3);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      if np1^ < AMin then
        r1 := 0
      else
        if np1^ > AMax then
        r1 := 255
      else
        r1 := trunc((np1^ - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      if np2^ < AMin then
        g1 := 0
      else
        if np2^ > AMax then
        g1 := 255
      else
        g1 := trunc((np2^ - AMin) * lScaleShl10);
      if ANegative then
        g1 := 255 - g1;

      if np3^ < AMin then
        b1 := 0
      else
        if np3^ > AMax then
        b1 := 255
      else
        b1 := trunc((np3^ - AMin) * lScaleShl10);
      if ANegative then
        b1 := 255 - b1;

      p2^ :=$FF000000 + r1 shl 16 + g1 shl 8 + b1; //color32(b1, g1, r1);

      inc(np1);
      inc(np2);
      inc(np3);
      inc(p2);
    end;
end;

procedure vImageConvert_PlanarRGB_PlanarConfiguration2_toPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1: pRGB;
  p2: pLongWord;
  r1, g1, b1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^.r < AMin then
          r1 := 0
        else
          if p1^.r > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^.r) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        if p1^.g < AMin then
          g1 := 0
        else
          if p1^.g > AMax then
          g1 := 255
        else
          g1 := trunc(((p1^.g) - AMin) * lScaleShl10);
        if ANegative then
          g1 := 255 - g1;

        if p1^.b < AMin then
          b1 := 0
        else
          if p1^.b > AMax then
          b1 := 255
        else
          b1 := trunc(((p1^.b) - AMin) * lScaleShl10);
        if ANegative then
          b1 := 255 - b1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ :=$FF000000 + r1 shl 16 + g1 shl 8 + b1
        else
          p2^ :=$FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[g1] shl 8 + n1.FBlueTable[b1];

        inc(p1);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      if p1^.r < AMin then
        r1 := 0
      else
        if p1^.r > AMax then
        r1 := 255
      else
        r1 := trunc(((p1^.r) - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      if p1^.g < AMin then
        g1 := 0
      else
        if p1^.g > AMax then
        g1 := 255
      else
        g1 := trunc(((p1^.g) - AMin) * lScaleShl10);
      if ANegative then
        g1 := 255 - g1;

      if p1^.b < AMin then
        b1 := 0
      else
        if p1^.b > AMax then
        b1 := 255
      else
        b1 := trunc(((p1^.b) - AMin) * lScaleShl10);
      if ANegative then
        b1 := 255 - b1;

      p2^ :=$FF000000 + r1 shl 16 + g1 shl 8 + b1; //color32(b1, g1, r1);

      inc(p1);
      inc(p2);
    end;
end;

procedure vImageConvert_Planar8toPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1: PByte;
  p2: pLongWord;
 // w1: LongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ :=$FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ :=$FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      if p1^ < AMin then
        r1 := 0
      else
        if p1^ > AMax then
        r1 := 255
      else
        r1 := trunc(((p1^) - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ :=$FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p2);
    end;
end;

procedure vImageConvert_PlanarFtoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1: PSingle;
  p2: pLongWord;
 // w1: LongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ :=$FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ :=$FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      if p1^ < AMin then
        r1 := 0
      else
        if p1^ > AMax then
        r1 := 255
      else
        r1 := trunc(((p1^) - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 +r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p2);
    end;
end;

procedure vImageConvert_Planar16UtoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1: PWord;
//  w1: LongWord;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ <= AMin then
          r1 := 0
        else
          if p1^ >= AMax then
          r1 := 255
        else
          r1 := round(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
        begin
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;
          //p2^ := color32(r1, r1, r1);
          {asm
            MOV  AH,r1
            SHL  EAX,8
            MOV  AH,r1
            MOV  AL,AH
            MOV  W1,EAX
          end;}
          //p2^ := W1;
        end
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin

      if p1^ <= AMin then
        r1 := 0
      else
        if p1^ >= AMax then
        r1 := 255
      else
        r1 := round((p1^ - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;
      //p2^ := color32(r1, r1, r1);
      {asm
        MOV  AH,r1
        SHL  EAX,8
        MOV  AH,r1
        MOV  AL,AH
        MOV  W1,EAX
      end;
      p2^ := W1;}

      inc(p1);
      inc(p2);
    end;
end;

procedure vImageConvert_Planar16StoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1: PSmallInt;
//  w1: LongWord;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ <= AMin then
          r1 := 0
        else
          if p1^ >= AMax then
          r1 := 255
        else
          r1 := round(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
        begin
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        end
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      if p1^ <= AMin then
        r1 := 0
      else
        if p1^ >= AMax then
        r1 := 255
      else
        r1 := round((p1^ - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;
      inc(p1);
      inc(p2);
    end;
end;

procedure vImageConvert_Planar32UtoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1: PLongWord;
  p2: pLongWord;
//  w1: LongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
        begin
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1 // color32(r1, r1, r1)
          {asm
            MOV  AH,r1
            SHL  EAX,8
            MOV  AH,r1
            MOV  AL,AH
            MOV  W1,EAX
          end;
          p2^ := W1;}
        end
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      if p1^ < AMin then
        r1 := 0
      else
        if p1^ > AMax then
        r1 := 255
      else
        r1 := trunc(((p1^) - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1; //color32(r1, r1, r1);
      {asm
        MOV  AH,r1
        SHL  EAX,8
        MOV  AH,r1
        MOV  AL,AH
        MOV  W1,EAX
      end;
      p2^ := W1;}
      inc(p1);
      inc(p2);
    end;
end;

procedure vImageConvert_Planar32StoPlanarARGB(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1: PInteger;
 // w1: LongWord;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        if p1^ < AMin then
          r1 := 0
        else
          if p1^ > AMax then
          r1 := 255
        else
          r1 := trunc(((p1^) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
        begin
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1 // color32(r1, r1, r1)
          {asm
            MOV  AH,r1
            SHL  EAX,8
            MOV  AH,r1
            MOV  AL,AH
            MOV  W1,EAX
          end;
          p2^ := W1;}
        end
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      if p1^ < AMin then
        r1 := 0
      else
        if p1^ > AMax then
        r1 := 255
      else
        r1 := trunc(((p1^) - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1; //color32(r1, r1, r1);
      {asm
        MOV  AH,r1
        SHL  EAX,8
        MOV  AH,r1
        MOV  AL,AH
        MOV  W1,EAX
      end;
      p2^ := W1; }
      inc(p1);
      inc(p2);
    end;
end;

procedure vImageConvert_Planar8toPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PByte;
  np1: Byte;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ - p11^;
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_PlanarFtoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PSingle;
  np1: Single;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ - p11^;
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_Planar16UtoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PWord;
  np1: Word;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ - p11^;
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_Planar16StoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PSmallInt;
  np1: SmallInt;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ - p11^;
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_Planar32UtoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PLongWord;
  np1: LongWord;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ - p11^;
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_Planar32StoPlanarARGB_DSA(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PInteger;
  np1: Integer;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ - p11^;
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ - p11^;
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;
end;

procedure vImageConvert_Planar8toPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PByte;
  np1: Single;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;
  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_PlanarFtoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PSingle;
  np1: Single;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p11);
      inc(p1);
      inc(p2);
    end;

end;

procedure vImageConvert_Planar16UtoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PWord;
  np1: Single;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc(((np1) - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_Planar16StoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PSmallInt;
  np1: Single;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_Planar32UtoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PLongWord;
  np1: Single;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_Planar32StoPlanarARGB_Merge(srcData, srcData2: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AMax: Integer; AMin: Integer; ACustomPalette: TList; ANegative: Boolean; MergeFactor: Double);
var
  lRange: Single;
  lScaleShl10: Single;
  i, ix, iy: Integer;
  p1, p11: PInteger;
  np1: Single;
  p2: pLongWord;
  r1: Byte;
  n1: TDicomImagePalette;
begin
  p1 := srcData;
  p11 := srcData2;
  p2 := dstData;

  lRange := (AMax - AMin);

  if lRange = 0 then
    exit;
  lScaleShl10 := 255 / lRange;

  if (ACustomPalette <> nil) and (ACustomPalette.Count > 0) then
  begin
    for iy := 0 to srcHeight - 1 do
      for ix := 0 to srcWidth - 1 do
      begin
        np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
        if np1 < AMin then
          r1 := 0
        else
          if np1 > AMax then
          r1 := 255
        else
          r1 := trunc((np1 - AMin) * lScaleShl10);
        if ANegative then
          r1 := 255 - r1;

        n1 := GetPalette(ix, iy, ACustomPalette);
        if n1 = nil then
          p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1
        else
          p2^ := $FF000000 + n1.FRedTable[r1] shl 16 + n1.FGreenTable[r1] shl 8 + n1.FBlueTable[r1];

        inc(p1);
        inc(p11);
        inc(p2);
      end;
  end
  else
    for i := 0 to srcWidth * srcHeight - 1 do
    begin
      np1 := p1^ * MergeFactor + p11^ * (1 - MergeFactor);
      if np1 < AMin then
        r1 := 0
      else
        if np1 > AMax then
        r1 := 255
      else
        r1 := trunc((np1 - AMin) * lScaleShl10);
      if ANegative then
        r1 := 255 - r1;

      p2^ := $FF000000 + r1 shl 16 + r1 shl 8 + r1;

      inc(p1);
      inc(p11);
      inc(p2);
    end;

end;

procedure vImageConvert_Planar8Rotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
begin

end;

procedure vImageConvert_Planar8Rotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: Bytep;
begin
  I := 0;
  Bits := srcData;
  DstBits := dstData;
  for Y := 0 to srcHeight - 1 do
  begin
    J := srcHeight - 1 - Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Inc(J, srcHeight);
    end;
  end;

end;

procedure vImageConvert_Planar8Rotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  I, I2: Integer;
  Bits, DstBits: Bytep;
begin
  //  I := 0;
  Bits := srcData;
  DstBits := dstData;
  I2 := srcWidth * srcHeight - 1;
  for I := 0 to srcWidth * srcHeight - 1 do
  begin
    DstBits[I2] := Bits[I];
    Dec(I2);
  end;

end;

procedure vImageConvert_Planar8Rotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: Bytep;
begin
  Bits := srcData;
  DstBits := dstData;
  I := 0;
  for Y := 0 to srcHeight - 1 do
  begin
    J := (srcWidth - 1) * srcHeight + Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Dec(J, srcHeight);
    end;
  end;

end;

procedure vImageConvert_Planar8FlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  J, J2: Integer;
  PixelPtr, DstPixelPtr: Bytep;
  //P1, P2: PColor32;
begin
  J2 := srcHeight - 1;
  PixelPtr := srcData;
  DstPixelPtr := dstData;
  for J := 0 to srcHeight - 1 do
  begin
    //MoveLongword(PixelPtr[0 + J * srcWidth], DstPixelPtr[0 + J2 * srcWidth], srcWidth);
    Move(PixelPtr[0 + J * srcWidth], DstPixelPtr[0 + J2 * srcWidth], srcWidth);
    Dec(J2);
  end;

end;

procedure vImageConvert_Planar8FlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  i, j: Integer;
  P1, P2: PByte;
  W: Integer;
begin
  W := srcWidth;

  { Flip to Dst }

  P1 := (srcData);
  P2 := (dstData);
  Inc(P2, W - 1);
  for J := 0 to srcHeight - 1 do
  begin
    for I := 0 to W - 1 do
    begin
      P2^ := P1^;
      Inc(P1);
      Dec(P2);
    end;
    Inc(P2, W shl 1);
  end;

end;

procedure vImageConvert_Planar16Rotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
begin

end;

procedure vImageConvert_Planar16Rotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: Wordp;
begin
  I := 0;
  Bits := srcData;
  DstBits := dstData;
  for Y := 0 to srcHeight - 1 do
  begin
    J := srcHeight - 1 - Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Inc(J, srcHeight);
    end;
  end;

end;

procedure vImageConvert_Planar16Rotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  I, I2: Integer;
  Bits, DstBits: Wordp;
begin
  //  I := 0;
  Bits := srcData;
  DstBits := dstData;
  I2 := srcWidth * srcHeight - 1;
  for I := 0 to srcWidth * srcHeight - 1 do
  begin
    DstBits[I2] := Bits[I];
    Dec(I2);
  end;

end;

procedure vImageConvert_Planar16Rotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: Wordp;
begin
  Bits := srcData;
  DstBits := dstData;
  I := 0;
  for Y := 0 to srcHeight - 1 do
  begin
    J := (srcWidth - 1) * srcHeight + Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Dec(J, srcHeight);
    end;
  end;

end;

procedure vImageConvert_Planar16FlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  J, J2: Integer;
  PixelPtr, DstPixelPtr: Wordp;
  //P1, P2: PColor32;
begin
  J2 := srcHeight - 1;
  PixelPtr := srcData;
  DstPixelPtr := dstData;
  for J := 0 to srcHeight - 1 do
  begin
    Move(PixelPtr[0 + J * srcWidth], DstPixelPtr[0 + J2 * srcWidth], srcWidth * 2);
    Dec(J2);
  end;
end;

procedure vImageConvert_Planar16FlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  i, j: Integer;
  P1, P2: PWord;
  W: Integer;
begin
  W := srcWidth;

  { Flip to Dst }

  P1 := (srcData);
  P2 := (dstData);
  Inc(P2, W - 1);
  for J := 0 to srcHeight - 1 do
  begin
    for I := 0 to W - 1 do
    begin
      P2^ := P1^;
      Inc(P1);
      Dec(P2);
    end;
    Inc(P2, W shl 1);
  end;
end;

procedure vImageConvert_Planar32Rotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
begin

end;

procedure vImageConvert_Planar32Rotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: LongWordp;
begin
  I := 0;
  Bits := srcData;
  DstBits := dstData;
  for Y := 0 to srcHeight - 1 do
  begin
    J := srcHeight - 1 - Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Inc(J, srcHeight);
    end;
  end;

end;

procedure vImageConvert_Planar32Rotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  I, I2: Integer;
  Bits, DstBits: LongWordp;
begin
  //  I := 0;
  Bits := srcData;
  DstBits := dstData;
  I2 := srcWidth * srcHeight - 1;
  for I := 0 to srcWidth * srcHeight - 1 do
  begin
    DstBits[I2] := Bits[I];
    Dec(I2);
  end;

end;

procedure vImageConvert_Planar32Rotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: LongWordp;
begin
  Bits := srcData;
  DstBits := dstData;
  I := 0;
  for Y := 0 to srcHeight - 1 do
  begin
    J := (srcWidth - 1) * srcHeight + Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Dec(J, srcHeight);
    end;
  end;

end;

procedure vImageConvert_Planar32FlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  J, J2: Integer;
  PixelPtr, DstPixelPtr: LongWordp;
  //P1, P2: PColor32;
begin
  J2 := srcHeight - 1;
  PixelPtr := srcData;
  DstPixelPtr := dstData;
  for J := 0 to srcHeight - 1 do
  begin
    MoveLongword(PixelPtr[0 + J * srcWidth], DstPixelPtr[0 + J2 * srcWidth], srcWidth);
    Dec(J2);
  end;
end;

procedure vImageConvert_Planar32FlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  i, j: Integer;
  P1, P2: PLongWord;
  W: Integer;
begin
  W := srcWidth;

  { Flip to Dst }

  P1 := (srcData);
  P2 := (dstData);
  Inc(P2, W - 1);
  for J := 0 to srcHeight - 1 do
  begin
    for I := 0 to W - 1 do
    begin
      P2^ := P1^;
      Inc(P1);
      Dec(P2);
    end;
    Inc(P2, W shl 1);
  end;
end;

procedure vImageConvert_PlanarRGBRotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
begin

end;

procedure vImageConvert_PlanarRGBRotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: RGBp;
begin
  I := 0;
  Bits := srcData;
  DstBits := dstData;
  for Y := 0 to srcHeight - 1 do
  begin
    J := srcHeight - 1 - Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Inc(J, srcHeight);
    end;
  end;

end;

procedure vImageConvert_PlanarRGBRotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  I, I2: Integer;
  Bits, DstBits: RGBp;
begin
  //  I := 0;
  Bits := srcData;
  DstBits := dstData;
  I2 := srcWidth * srcHeight - 1;
  for I := 0 to srcWidth * srcHeight - 1 do
  begin
    DstBits[I2] := Bits[I];
    Dec(I2);
  end;

end;

procedure vImageConvert_PlanarRGBRotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: RGBp;
begin
  Bits := srcData;
  DstBits := dstData;
  I := 0;
  for Y := 0 to srcHeight - 1 do
  begin
    J := (srcWidth - 1) * srcHeight + Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Dec(J, srcHeight);
    end;
  end;

end;

procedure vImageConvert_PlanarRGBFlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  J, J2: Integer;
  PixelPtr, DstPixelPtr: RGBp;
  //P1, P2: PColor32;
begin
  J2 := srcHeight - 1;
  PixelPtr := srcData;
  DstPixelPtr := dstData;
  for J := 0 to srcHeight - 1 do
  begin
    Move(PixelPtr[0 + J * srcWidth], DstPixelPtr[0 + J2 * srcWidth], srcWidth * 3);
    Dec(J2);
  end;
end;

procedure vImageConvert_PlanarRGBFlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  i, j: Integer;
  P1, P2: PRGB;
  W: Integer;
begin
  W := srcWidth;

  { Flip to Dst }

  P1 := (srcData);
  P2 := (dstData);
  Inc(P2, W - 1);
  for J := 0 to srcHeight - 1 do
  begin
    for I := 0 to W - 1 do
    begin
      P2^ := P1^;
      Inc(P1);
      Dec(P2);
    end;
    Inc(P2, W shl 1);
  end;
end;

procedure vImageConvert_PlanarARGBRotate(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer; Angle: Integer);
begin

end;

procedure vImageConvert_PlanarARGBRotate90(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: LongWordp; //PColor32Array;
begin
  I := 0;
  Bits := srcData;
  DstBits := dstData;
  for Y := 0 to srcHeight - 1 do
  begin
    J := srcHeight - 1 - Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Inc(J, srcHeight);
    end;
  end;
end;

procedure vImageConvert_PlanarARGBRotate180(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  I, I2: Integer;
  Bits, DstBits: LongWordp;
begin
  //  I := 0;
  Bits := srcData;
  DstBits := dstData;
  I2 := srcWidth * srcHeight - 1;
  for I := 0 to srcWidth * srcHeight - 1 do
  begin
    DstBits[I2] := Bits[I];
    Dec(I2);
  end;
end;

procedure vImageConvert_PlanarARGBRotate270(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer);
var
  X, Y, I, J: Integer;
  Bits, DstBits: LongWordp; //PColor32Array;
begin
  Bits := srcData;
  DstBits := dstData;
  I := 0;
  for Y := 0 to srcHeight - 1 do
  begin
    J := (srcWidth - 1) * srcHeight + Y;
    for X := 0 to srcWidth - 1 do
    begin
      DstBits[J] := Bits[I];
      Inc(I);
      Dec(J, srcHeight);
    end;
  end;
end;

procedure vImageConvert_PlanarARGBFlipVer(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  J, J2: Integer;
  PixelPtr, DstPixelPtr: LongWordp; //PColor32Array;
begin
  J2 := srcHeight - 1;
  PixelPtr := srcData;
  DstPixelPtr := dstData;
  for J := 0 to srcHeight - 1 do
  begin
    MoveLongword(PixelPtr[0 + J * srcWidth], DstPixelPtr[0 + J2 * srcWidth], srcWidth);
    Dec(J2);
  end;
end;

procedure vImageConvert_PlanarARGBFlipHiz(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer);
var
  i, j: Integer;
  P1, P2: PInteger;
  W: Integer;
begin
  W := srcWidth;

  { Flip to Dst }

  P1 := PInteger(srcData);
  P2 := PInteger(dstData);
  Inc(P2, W - 1);
  for J := 0 to srcHeight - 1 do
  begin
    for I := 0 to W - 1 do
    begin
      P2^ := P1^;
      Inc(P1);
      Dec(P2);
    end;
    Inc(P2, W shl 1);
  end;
end;

procedure vImageConvert_Fto16U(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AFactor: single; AOffset: single);
var
  i: Integer;
  p1: PSingle;
  p2: PWord;
begin
  p1 := srcData;
  p2 := dstData;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    p2^ := trunc(p1^ * AFactor + AOffset);
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_Fto16S(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AFactor: single; AOffset: single);
var
  i: Integer;
  p1: PSingle;
  p2: PWord;
begin
  p1 := srcData;
  p2 := dstData;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    p2^ := trunc(p1^ * AFactor + AOffset);
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_16UtoF(srcData: Pointer; srcWidth, srcHeight: Integer;
  dstData: Pointer; dstWidth, dstHeight: Integer;
  AFactor: single; AOffset: single);
var
  i: Integer;
  p1: PSingle;
  p2: PWord;
begin
  p1 := dstData;
  p2 := srcData;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    p1^ := p2^ * AFactor + AOffset;
    inc(p1);
    inc(p2);
  end;
end;

procedure vImageConvert_16StoF(srcData: Pointer; srcWidth, srcHeight: Integer; dstData: Pointer; dstWidth, dstHeight: Integer;
  AFactor: single; AOffset: single);
var
  i: Integer;
  p1: PSingle;
  p2: PSmallint;
begin
  p1 := dstData;
  p2 := srcData;
  for i := 0 to srcWidth * srcHeight - 1 do
  begin
    p1^ := p2^ * AFactor + AOffset;
    inc(p1);
    inc(p2);
  end;
end;

end.

