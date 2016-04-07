{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DCM_Templates;

interface
uses
  {$IFDEF LINUX}Types, Libc, QControls, Qgraphics, {$ELSE}
  Windows, Messages, Forms, Controls, graphics, {$ENDIF}
  SysUtils, Classes, DCM32;

type

  TStructMatrix2D = record
    x: Double;
    y: Double;
  end;
  PStructMatrix2D = ^TStructMatrix2D;

  TStructLine2D = record
    P0: TStructMatrix2D;
    P1: TStructMatrix2D;
    Length: Double;
  end;
  PStructLine2D = ^TStructLine2D;


  TVitexObject = class
  private
    fLines: TList;
    FViewScale: Double;
    FViewSize: Double;
    FVersion: string;
    FManufacturer: string;
    FName: string;
    FLocation: string;
    FVersionDate: TDatetime;
    function GetLineCount: Integer;
    function GetLines(index: Integer): PStructLine2D;
    procedure SetLines(index: Integer; const Value: PStructLine2D);
    procedure SetLocation(const Value: string);
    procedure SetManufacturer(const Value: string);
    procedure SetName(const Value: string);
    procedure SetVersion(const Value: string);
    procedure SetVersionDate(const Value: TDatetime);
    procedure SetViewScale(const Value: Double);
    procedure SetViewSize(const Value: Double);
  protected

  public
    constructor Create;
    destructor Destroy; override;

    procedure AddLine(X1, Y1, X2, Y2: Double);

    function LoadFromFile(AFileName: string): Boolean;
    function LoadFromStream(AStm: TStream): Boolean; virtual;
    function LoadFromString(ASource: string): Boolean; virtual;

    procedure SaveToFile(AFileName: string);
    procedure SaveToStream(AStm: TStream); virtual;
    function SaveToString: string;

    function MouseDown(Parent: TCustomControl; Button: TMouseButton; Shift: TShiftState; X, Y:
      Integer): Boolean;
    function MouseMove(Parent: TCustomControl; ACanvas: TCanvas; Shift: TShiftState; X, Y:
      Integer): Boolean; overload;
    function MouseUp(Parent: TCustomControl; Button: TMouseButton; Shift: TShiftState; X, Y:
      Integer): Boolean;

    property Name: string read FName write SetName;
    property Manufacturer: string read FManufacturer write SetManufacturer;
    property Location: string read FLocation write SetLocation;
    property ViewSize: Double read FViewSize write SetViewSize;
    property ViewScale: Double read FViewScale write SetViewScale;
    property Version: string read FVersion write SetVersion;
    property VersionDate: TDatetime read FVersionDate write SetVersionDate;

    property LineCount: Integer read GetLineCount;
    property Lines[index: Integer]: PStructLine2D read GetLines write SetLines;
  end;
implementation


{ TVitexObject }

procedure TVitexObject.AddLine(X1, Y1, X2, Y2: Double);
var
  p1: PStructLine2D;
begin
  GetMem(p1, SizeOf(TStructLine2D));
  p1.P0.x := x1;
  p1.P0.y := y1;

  p1.P1.x := x2;
  p1.P1.y := y2;
  fLines.Add(p1);
end;

constructor TVitexObject.Create;
begin
  fLines := TList.Create;
  FViewScale := 1;
  FViewSize := 0;
  FVersion := '';
  FManufacturer := '';
  FName := '';
  FLocation := '';
  FVersionDate := now;
end;

destructor TVitexObject.Destroy;
var
  i: Integer;
  p1: PStructLine2D;
begin
  for i := 0 to fLines.Count - 1 do
  begin
    p1 := PStructLine2D(fLines[i]);
    FreeMem(p1);
  end;
  fLines.Free;
  inherited;
end;

function TVitexObject.GetLineCount: Integer;
begin
  Result := fLines.Count;
end;

function TVitexObject.GetLines(index: Integer): PStructLine2D;
begin
  Result := PStructLine2D(fLines[index]);
end;

function TVitexObject.LoadFromFile(AFileName: string): Boolean;
var
  stm1: TFileStream;
begin
  stm1 := TFileStream.Create(AFileName, fmOpenRead);
  try
    LoadFromStream(stm1);
  finally
    stm1.Free;
  end;
end;

function TVitexObject.LoadFromStream(AStm: TStream): Boolean;
begin

end;

function TVitexObject.LoadFromString(ASource: string): Boolean;
begin

end;

function TVitexObject.MouseDown(Parent: TCustomControl;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
begin

end;

function TVitexObject.MouseMove(Parent: TCustomControl; ACanvas: TCanvas;
  Shift: TShiftState; X, Y: Integer): Boolean;
begin

end;

function TVitexObject.MouseUp(Parent: TCustomControl; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer): Boolean;
begin

end;

procedure TVitexObject.SaveToFile(AFileName: string);
var
  stm1: TFileStream;
begin
  stm1 := TFileStream.Create(AFileName, fmCreate);
  try
    SaveToStream(stm1);
  finally
    stm1.Free;
  end;
end;

procedure TVitexObject.SaveToStream(AStm: TStream);
begin

end;

function TVitexObject.SaveToString: string;
begin

end;

procedure TVitexObject.SetLines(index: Integer;
  const Value: PStructLine2D);
var
  p1: PStructLine2D;
begin
  p1 := PStructLine2D(fLines[index]);
  FreeMem(p1);
  fLines[index] := Value;
end;

procedure TVitexObject.SetLocation(const Value: string);
begin
  FLocation := Value;
end;

procedure TVitexObject.SetManufacturer(const Value: string);
begin
  FManufacturer := Value;
end;

procedure TVitexObject.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TVitexObject.SetVersion(const Value: string);
begin
  FVersion := Value;
end;

procedure TVitexObject.SetVersionDate(const Value: TDatetime);
begin
  FVersionDate := Value;
end;

procedure TVitexObject.SetViewScale(const Value: Double);
begin
  FViewScale := Value;
end;

procedure TVitexObject.SetViewSize(const Value: Double);
begin
  FViewSize := Value;
end;
end.
