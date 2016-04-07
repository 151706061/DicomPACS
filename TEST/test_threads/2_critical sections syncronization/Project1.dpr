program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;

type
  Stack = class
  m: array[0..100] of Integer;
  public
  constructor Create;
  procedure Put(x: Integer);
  function Get: Integer;
  function IsEmpty: Boolean;
  function IsFull: Boolean;
  end;
 
var
   h1,h2,h3:THandle;
   st:Stack;
   crit:RTL_CRITICAL_SECTION;
   th_id1,th_id2,th_id3:Cardinal;


procedure Stack.Put(x:Integer);
begin
  if (m[0]<100) then
  begin
    EnterCriticalSection(crit);
    m[0]:=m[0]+1;
    m[m[0]]:=x;
    LeaveCriticalSection(crit);
  end;
end;
 
function Stack.Get:Integer;
begin
  Result:=0;
  if (m[0]>0) then
  begin
    Result:=m[m[0]];
    EnterCriticalSection(crit);
    m[0]:=m[0]-1;
    LeaveCriticalSection(crit);
  end;
end;
 
function Stack.IsEmpty:Boolean;
begin
  Result:=(m[0]=0);
end;
 
function Stack.IsFull:Boolean;
begin
  Result:=(m[0]=100);
end;

constructor Stack.Create;
begin
  m[0]:=0;
end;
 
procedure Th1;
var
  i:Integer;
begin
  for i:=1 to 100 do
  begin
    st.Put(i);
   end;
end;

procedure Th2;
begin
  while not st.IsEmpty do
  begin
    writeln('Th1: '+InttoStr(st.Get));
  end;
end;

procedure Th3;
begin
  while not st.IsEmpty do
  begin
    writeln('Th2: '+InttoStr(st.Get));
  end;
end;

begin
  try
    InitializeCriticalSection(crit);
    st:=Stack.Create;
    h1:=CreateThread(nil,0,@Th1,nil,0,th_id1);
    h2:=CreateThread(nil,0,@Th2,nil,0,th_id2);
    h3:=CreateThread(nil,0,@Th3,nil,0,th_id3);
    readln;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.

