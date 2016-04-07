unit DCM_MemString;

// =========================================================================
// kbmString - Stub for kbmMemTable Standard Edition.
//
// Copyright 1999-2008 Kim Bo Madsen/Components4Developers DK
// All rights reserved.
//

{$I DCM_MemTable.inc}

interface

{$IFDEF DOTNET}
function kbmPCompStr(P1,P2:string):integer;
function kbmPCompStrIC(P1,P2:string):integer;
{$ELSE}
function kbmPCompStr(P1,P2:PAnsiChar):integer;
function kbmPCompStrIC(P1,P2:PAnsiChar):integer;
{$ENDIF}

implementation

uses SysUtils;

{$IFDEF DOTNET}
function kbmPCompStr(P1,P2:string):integer;
begin
     Result:=CompareStr(P1,P2);
end;

function kbmPCompStrIC(P1,P2:string):integer;
begin
     Result:=CompareText(P1,P2);
end;
{$ELSE}
function kbmPCompStr(P1,P2:PAnsiChar):integer;
begin
     Result:=CompareStr(String(P1),String(P2));
end;

function kbmPCompStrIC(P1,P2:PAnsiChar):integer;
begin
     Result:=CompareText(string(P1),string(P2));
end;
{$ENDIF}

end.
