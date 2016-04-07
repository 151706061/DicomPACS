{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit Dcmjpeg2000;

interface

uses Windows, SysUtils, Classes, CnsCRtl;

procedure encodeJPEG2000(jpegdata, data: Pointer; quality: Integer;
  _columns: Integer; _rows: Integer;
  _samplesPerPixel: Integer; _pixelDepth: Integer;
  photometricInterpretation: Integer;
  _isSigned: Integer);

//function convertJPEG2000ToHost(jpegData: Pointer; ALength: Integer): Pointer;

implementation


{$WARNINGS OFF}

{$L ijg2000lib.obj}

{$WARNINGS ON}

procedure _encodeJPEG2000(jpegdata, data: Pointer; quality: Integer;
  _columns: Integer; _rows: Integer;
  _samplesPerPixel: Integer; _pixelDepth: Integer;
  photometricInterpretation: Integer;
  _isSigned: Integer;AFileName:pchar); cdecl; external;

//function _convertJPEG2000ToHost(jpegData: Pointer; ALength: Integer): Pointer; cdecl; external;

procedure encodeJPEG2000(jpegdata, data: Pointer; quality: Integer;
  _columns: Integer; _rows: Integer;
  _samplesPerPixel: Integer; _pixelDepth: Integer;
  photometricInterpretation: Integer;
  _isSigned: Integer);
var
  i:Integer;
begin
  if quality=100 then
    i := 1
  else if quality>90 then
    i := 2
  else
    i := 3;
  _encodeJPEG2000(jpegdata, data,
    i, _columns, _rows,
    _samplesPerPixel, _pixelDepth,
    photometricInterpretation,
    _isSigned,'');
end;


end.






