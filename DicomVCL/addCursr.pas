unit addCursr;

interface

const
  crGlassCursor = 1;
  crHandGrab = 2;
  crHandGrab2 = 3;
  crSelect = 4;
  crEmpires = 5;

implementation

uses Forms, Windows;

{$R COMMCURS.RES} // COMMCURS.RC

initialization

  Screen.Cursors[crGlassCursor] := LoadCursor(HInstance, 'GLASSCURSOR');
  Screen.Cursors[crHandGrab] := LoadCursor(HInstance, 'HANDGRABCURSOR');
  Screen.Cursors[crHandGrab2] := LoadCursor(HInstance, 'HANDGRABCURSOR2');
  Screen.Cursors[crSelect] := LoadCursor(HInstance, 'SELECTCURSOR');
  Screen.Cursors[crEmpires] := LoadCursor(HInstance, 'EMPCURSOR');

finalization

end.

 