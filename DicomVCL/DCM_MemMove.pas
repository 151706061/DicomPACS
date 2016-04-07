unit DCM_MemMove;

// =========================================================================
// kbmMove - Stub for kbmMemTable Standard Edition.
//
// Copyright 1999-2008 Kim Bo Madsen/Components4Developers DK
// All rights reserved.
//

{$I DCM_MemTable.inc}

interface

{$IFNDEF DOTNET}
procedure kbmMemMove(const Source; var Dest; Count : Integer);
{$ENDIF}

implementation

{$IFNDEF DOTNET}
procedure kbmMemMove(const Source; var Dest; Count : Integer);
begin
     Move(Source,Dest,Count);
end;
{$ENDIF}

end.

