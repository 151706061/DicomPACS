{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit DicomVideoUtils;

interface
uses Windows, DicomDirectShow;
function BytesToStr(source: string): string;
function StrToBytes(source: string): string;

function GUIDToStr(source: TGUID): string;
function StrToGUID(source: string): TGUID;

function FilterName(filter: IBaseFilter): string;
function PinName(pin: IPin): string;

function DumpGraph(Graph: IGraphBuilder): string;

implementation

//uses StrUtils;

const
  Separator = #$0D#$0A;
  Separator1 = #$0d#$0A'--------------------------------------'#$0d#$0A +
    ' Filter : ';

function FilterName(filter: IBaseFilter): string;
var
  fi: TFilterInfo;
begin
  if (filter <> nil) and Succeeded(filter.QueryFilterInfo(fi)) then
  begin
    fi.pGraph := nil;
    Result := fi.achName;
  end;
end;

function PinName(pin: IPin): string;
var
  pi: TPin_Info;
begin
  if (pin = nil) then
    Exit;
  if Succeeded(pin.QueryPinInfo(pi)) then
  begin
    Result := FilterName(pi.pFilter) + '.' + pi.achName;
    pi.pFilter := nil;
  end;
end;

function DumpGraph(Graph: IGraphBuilder): string;
var
  filters: IEnumFilters;
  pin, pin1: IPin;
  pins: IEnumPins;
  filter: IBaseFilter;
  pd: TPin_Direction;
begin
  if (Graph = nil) or Failed(Graph.EnumFilters(filters)) then
    Exit;
  if Succeeded(filters.Reset) then
    while true do
    begin
      if Failed(filters.Next(1, filter, nil)) or (filter = nil) then
        break;
      // filter info
      Result := Result + Separator + Separator1;
      Result := Result + FilterName(filter) + Separator;

      if Failed(filter.EnumPins(pins)) or Failed(pins.Reset) then
        continue;
      while true do
      begin
        if Failed(pins.Next(1, pin, nil)) or (pin = nil) then
          break;

        // pin info
        Result := Result + Separator;
        //Result := Result + Insert(' ', PinName(pin), 25);
        Result := Result + PinName(pin);
        Insert(' ', Result, 25);
        
        pin.QueryDirection(pd);
        if pd = PINDIR_INPUT then
          Result := Result + '<--'#9
        else
          Result := Result + '-->'#9;
        if Succeeded(pin.ConnectedTo(pin1)) then
        begin
          Result := Result + PinName(pin1);
          pin1 := nil;
        end;

      end;
    end;
end;

function BytesToStr(source: string): string;
var
  i: integer;
  p: PChar;
  ps: PChar;
const
  hexdigits: array[0..$F] of char = '0123456789ABCDEF';
begin
  SetLength(Result, Length(source) * 2);
  p := PChar(Result);
  ps := PChar(source);
  for i := 0 to Length(source) - 1 do
  begin
    p^ := hexdigits[(byte(ps^) and $F0) shr 4];
    inc(p);
    p^ := hexdigits[byte(ps^) and $0F];
    inc(p);
    inc(ps);
  end;
end;

function CharHex(const C: char): Byte;
const
  DecDigits = ['0'..'9'];
  HexDigits = ['0'..'9', 'A'..'F', 'a'..'f'];
begin
  Result := $FF;
  if C in DecDigits then
    Result := Ord(UpCase(C)) - Ord('0')
  else
  begin
    if C in HexDigits then
      Result := Ord(UpCase(C)) - Ord('A') + 10;
  end;
end;

function StrToBytes(source: string): string;
var
  C: cardinal;
  P: PChar;
  PD: PChar;
  BL, BH: Byte;
  S: string;
  size: cardinal;
begin
  size := (Length(source) + 1) div 2;
  SetLength(Result, size);
  PD := PChar(Result);
  FillChar(PD^, size, 0);
  S := source;

  if Odd(Length(S)) then
    S := '0' + S;
  P := PChar(S);
  C := 0;
  while C < size do
  begin
    BH := CharHex(P^);
    Inc(P);
    BL := CharHex(P^);
    Inc(P);
    Inc(C);
    if (BH = $FF) or (BL = $FF) then
      Exit;
    PD^ := char((BH shl 4) + BL);
    inc(PD);
  end;
end;

function GUIDToStr(source: TGUID): string;
var
  s: string;
begin
  SetLength(s, sizeof(TGUID));
  Move(source, PChar(s)^, sizeof(TGUID));
  Result := BytesToStr(s);
end;

function StrToGUID(source: string): TGUID;
var
  s: string;
begin
  s := StrToBytes(source);
  Move(PChar(s)^, Result, sizeof(Result));
end;

end.

