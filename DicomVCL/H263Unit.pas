{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit H263Unit;

interface

uses Windows, SysUtils, Classes, CnsCRtl;

type
  PPointer = ^Pointer;

function EncodeOneIntra: integer;

function DecodeOneFrame: integer;

function InitializeEncoder(CodeSrc, CodeDest: PPointer; VideoW, VideoH: Integer): integer;

function InitializeDecoder(CodeSrc, CodeDest: PPointer; VideoW, VideoH: Integer): integer;

function SetCompressRatio(ARatio: Integer): integer;

procedure FreeEncoder;

procedure FreeDecoder;

function StartEncoder(Ratio, Width, Height: integer): integer;
function EndEncoder: integer;
function Encode(eType: integer; Src, Dest: PBYTE; Len: integer): integer;
function Decode(Src, Dest: PBYTE; Len: integer): integer;
function StartDecoder(Ratio, Width, Height: integer): integer;
function EndDecoder: integer;

implementation

{$WARNINGS OFF}

{$L h263lib.obj}

{$WARNINGS ON}

function _EncodeOneIntra: integer; cdecl; external;

function _DecodeOneFrame: integer; cdecl; external;

function _StartEncoder(Ratio, Width, Height: integer): integer; cdecl; external;

function _EndEncoder: integer; cdecl; external;

function _StartDecoder(Ratio, Width, Height: integer): integer; cdecl; external;

function _EndDecoder: integer; cdecl; external;

function _Encode(eType: integer; Src, Dest: PBYTE; Len: integer): integer; cdecl; external;

function _Decode(Src, Dest: PBYTE; Len: integer): integer; cdecl; external;

function _InitializeEncoder(CodeSrc, CodeDest: PPointer; VideoW, VideoH: Integer): integer; cdecl;
  external;

function _InitializeDecoder(CodeSrc, CodeDest: PPointer; VideoW, VideoH: Integer): integer; cdecl;
  external;

function _SetCompressRatio(ARatio: Integer): integer; cdecl; external;

procedure _FreeEncoder; cdecl; external;

procedure _FreeDecoder; cdecl; external;

function EncodeOneIntra: integer;
begin
  Result := _EncodeOneIntra;
end;

function DecodeOneFrame: integer;
begin
  Result := _DecodeOneFrame;
end;

function InitializeEncoder(CodeSrc, CodeDest: PPointer; VideoW, VideoH: Integer): integer;
begin
  Result := _InitializeEncoder(CodeSrc, CodeDest, VideoW, VideoH);
end;

function InitializeDecoder(CodeSrc, CodeDest: PPointer; VideoW, VideoH: Integer): integer;
begin
  Result := _InitializeDecoder(CodeSrc, CodeDest, VideoW, VideoH);
end;

function SetCompressRatio(ARatio: Integer): integer;
begin
  Result := _SetCompressRatio(ARatio);
end;

procedure FreeEncoder;
begin
  _FreeEncoder
end;

procedure FreeDecoder;
begin
  _FreeDecoder
end;

function StartEncoder(Ratio, Width, Height: integer): integer;
begin
  Result := _StartEncoder(Ratio, Width, Height);
end;

function EndEncoder: integer;
begin
  Result := _EndEncoder
end;

function Encode(eType: integer; Src, Dest: PBYTE; Len: integer): integer;
begin
  Result := _Encode(eType, Src, Dest, Len);
end;

function Decode(Src, Dest: PBYTE; Len: integer): integer;
begin
  Result := _Decode(Src, Dest, Len);
end;

function StartDecoder(Ratio, Width, Height: integer): integer;
begin
  Result := _StartDecoder(Ratio, Width, Height);
end;

function EndDecoder: integer;
begin
  Result := _EndDecoder
end;

end.

