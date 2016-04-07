{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit Dcmjpeg16;

interface

uses Windows, SysUtils, Classes,CnsCRtl;

function convertJPEG16ToHost(jpegData: PStream; _samplesPerPixel: Integer;
  _rows: Integer; _columns: Integer): Pointer;

implementation


{$WARNINGS OFF}

{$L ijg16lib.obj}

{$WARNINGS ON}

function _convertJPEG16ToHost(jpegData: Pointer; _samplesPerPixel: Integer;
  _rows: Integer; _columns: Integer): PChar; cdecl; external;

function convertJPEG16ToHost(jpegData: PStream; _samplesPerPixel: Integer;
  _rows: Integer; _columns: Integer): Pointer;
begin
  result := _convertJPEG16ToHost(jpegData, _samplesPerPixel, _rows, _columns);
end;

end.


