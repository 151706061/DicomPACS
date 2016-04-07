{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit Dcmjpeg8;

interface

uses Windows, SysUtils, Classes, CnsCRtl, Messages;

function convertJPEG8ToHost(jpegData: PStream;
  _samplesPerPixel: integer;
  _rows: Integer;
  _columns: Integer;
  photometricInterpretation: Integer): Pointer;

procedure compressJPEG8(jpegData: PStream; data: Pointer;
  photometricInterpretation: Integer;
  compressionSyntax: Integer;
  quality: Integer;
  _columns: Integer;
  _rows: Integer;
  _samplesPerPixel: Integer);

function DecompressJPEG8(jpegData: PStream;
  _samplesPerPixel: integer;
  _rows: Integer;
  _columns: Integer;
  photometricInterpretation: Integer): Pointer;

implementation

uses forms, dialogs, CnsJpgGr;

function DecompressJPEG8(jpegData: PStream;
  _samplesPerPixel: integer;
  _rows: Integer;
  _columns: Integer;
  photometricInterpretation: Integer): Pointer;
var
  J: integer;
  Jpg: TJpegGraphic;
  lRow: PByteArray;
  lOutputBuff: PByte;
begin
  GetMem(lOutputBuff, _samplesPerPixel * _rows * _columns);
  Result := lOutputBuff;

  Jpg := TJpegGraphic.Create;
  try
    Jpg.SingleLoadFromStream(jpegData^, 0);
    for j := 0 to JPG.Height - 1 do
    begin
      lRow := JPG.Scanline[j];
      Move(lRow[0], lOutputBuff^, _samplesPerPixel * Jpg.Width);
      inc(lOutputBuff, _samplesPerPixel * Jpg.Width);
    end; //for j...each row
  finally
    Jpg.Free;
  end; //JPG try..finally}
end;

procedure _LogijgException(AStr: PChar); cdecl;
begin
  SHowMessage(AStr);
end;
{$WARNINGS OFF}

{$L ijg8lib.obj}

{$WARNINGS ON}

procedure _compressJPEG8(jpegData: Pointer; data: PChar;
  photometricInterpretation: Integer;
  compressionSyntax: Integer;
  quality: Integer;
  _columns: Integer;
  _rows: Integer;
  _samplesPerPixel: Integer); cdecl; external;

function _convertJPEG8LosslessToHost(jpegData: Pointer;
  _samplesPerPixel: integer;
  _rows: Integer; _columns: Integer; photometricInterpretation: Integer): PChar; cdecl; external;

procedure compressJPEG8(jpegData: PStream; data: Pointer;
  photometricInterpretation: Integer;
  compressionSyntax: Integer;
  quality: Integer;
  _columns: Integer;
  _rows: Integer;
  _samplesPerPixel: Integer);
begin
  _compressJPEG8(jpegdata, data,
    photometricInterpretation,
    compressionSyntax,
    quality,
    _columns,
    _rows,
    _samplesPerPixel);
end;

{
function GetHandleInfo(AHandle: hWnd): Boolean;
var lng: integer;
  //  theClassName: string;
    theWinText: string;
begin
  try

    SetLength(theClassName, 256);
    lng := GetClassName(AHandle, PChar(theClassName), 255);
    SetLength(theClassName, lng);

    SetLength(theWinText, 256);
    lng := GetWindowText(AHandle, PChar(theWinText), 255);
    SetLength(theWinText, lng);

    Result := (theWinText='JPEG Library Error');

   // Result := theClassName;

  //  if theWinText <> '' then
  //    Result := Result + ' "' + theWinText + '"'
  //  else
  //  Result := Result + '""';
  except
//    Result := '';
    Result := False;
  end;
end; }

function convertJPEG8ToHost(jpegData: PStream;
  _samplesPerPixel: integer;
  _rows: Integer; _columns: Integer; photometricInterpretation: Integer): Pointer;
// var Wd : HWnd; i:Integer;
begin

 // jpegData.SaveToFile('d:\__to_delete\'+inttostr(GetTickCount)+'.jpg');

  result := _convertJPEG8LosslessToHost(jpegData, _samplesPerPixel,
    _rows, _columns, photometricInterpretation);
  // подавить все созданные модальные окна
  // Ќайдем первое окно верхнего уровн€ любого класса
{  While (Wd<>0) do              // ≈сли такое окно существует
  Begin
    If GetHandleInfo(Wd) then
    begin
      SendMessage( Wd, WM_CLOSE, 0,0);
      Break;
    end;
    Application.ProcessMessages;         // ƒадим возможность поработать другим
    Wd:=GetNextWindow(Wd,GW_HWNDNEXT);   // Ќайдем следующее окно в системе.
  End; }
end;

end.

