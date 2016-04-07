{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit Dcmjpeg2000Ex;

interface

uses Windows, SysUtils, Classes, CnsCRtl;

const
  J2K_CFMT = 0;
  JP2_CFMT = 1;
  JPT_CFMT = 2;
  MJ2_CFMT = 3;

  PXM_DFMT = 0;
  PGX_DFMT = 1;
  BMP_DFMT = 2;
  YUV_DFMT = 3;

procedure encodeJPEG2000_openjpeg(  jpegData:Pointer;
                 data:Pointer ;
                quality,   //1 DCMLosslessQuality 2 High 3 low
                //int photometricInterpretation,
                 _columns,
                 _rows,
                 _samplesPerPixel,
                 _pixelDepth:Integer;
                 photometricInterpretation: Integer;
  _isSigned: Integer);

function convertJPEG2000ToHost_openjpeg(jpegData: Pointer; ALen: Integer; AMode: integer): Pointer;

implementation

{$WARNINGS OFF}

{$L ijg2000exlib.obj}

{$WARNINGS ON}

procedure _encodeJPEG2000(  jpegData:Pointer;
                 data:Pointer ;
                 quality,   //1 DCMLosslessQuality 2 High 3 low
                //int photometricInterpretation,
                 _columns,
                 _rows,
                 _samplesPerPixel,
                 _pixelDepth:Integer); cdecl; external;

function _convertJPEG2000ToHost(jpegData: Pointer; ALen: Integer; AMode: integer): Pointer; cdecl; external;

procedure encodeJPEG2000_openjpeg(  jpegData:Pointer;
                 data:Pointer ;
                 quality,   //1 DCMLosslessQuality 2 High 3 low
                //int photometricInterpretation,
                 _columns,
                 _rows,
                 _samplesPerPixel,
                 _pixelDepth:Integer;
                 photometricInterpretation: Integer;
  _isSigned: Integer);
begin
  _encodeJPEG2000(  jpegData,
                 data,
                 quality,   //1 DCMLosslessQuality 2 High 3 low
                //int photometricInterpretation,
                 _columns,
                 _rows,
                 _samplesPerPixel,
                 _pixelDepth)
end;

function convertJPEG2000ToHost_openjpeg(jpegData: Pointer; ALen: Integer; AMode: integer): Pointer;
begin
  Result := _convertJPEG2000ToHost(jpegData, ALen, AMode);
end;
end.














