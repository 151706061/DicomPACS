{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit Dcmjpeg12;

interface

uses Windows, SysUtils, Classes,CnsCRtl;

function convertJPEG12ToHost(jpegData: PStream; _samplesPerPixel: Integer;
  _rows: Integer; _columns: Integer): Pointer;

procedure compressJPEG12(jpegData: PStream; data: Pointer;
  photometricInterpretation: integer;
  compressionSyntax: Integer;
  quality: integer;
  _columns: Integer;
  _rows: Integer;
  _samplesPerPixel: Integer);

implementation


{$WARNINGS OFF}

{$L ijg12lib.obj}

{$WARNINGS ON}


function _convertJPEG12ToHost(jpegData: Pointer; _samplesPerPixel: Integer;
  _rows: Integer; _columns: Integer): PChar; cdecl; external;

function convertJPEG12ToHost(jpegData: PStream; _samplesPerPixel: Integer;
  _rows: Integer; _columns: Integer): Pointer;
begin
  result := _convertJPEG12ToHost(jpegData, _samplesPerPixel,
    _rows, _columns);
end;

procedure _compressJPEG12(jpegData: Pointer; data: Pointer;
  photometricInterpretation: integer;
  compressionSyntax: Integer;
  quality: integer;
  _columns: Integer;
  _rows: Integer;
  _samplesPerPixel: Integer); cdecl; external;

procedure compressJPEG12(jpegData: PStream; data: Pointer;
  photometricInterpretation: integer;
  compressionSyntax: Integer;
  quality: integer;
  _columns: Integer;
  _rows: Integer;
  _samplesPerPixel: Integer);
begin
  _compressJPEG12(jpegData, data,
    photometricInterpretation,
    compressionSyntax,
    quality,
    _columns,
    _rows,
    _samplesPerPixel);
end;

end.


