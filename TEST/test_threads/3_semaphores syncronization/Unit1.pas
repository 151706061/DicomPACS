unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls;

type
    TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure AddClient;
    procedure DeleteClient;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
 
  Thread1 = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;
 
  Thread2 = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;
 
  Thread3 = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;
 
var
  Form1:TForm1;
  sem1,sem2:THandle;
  t1:Thread1;
  t2:Thread2;
  t3:Thread3;
  m1:array[1..5] of BOOL;
  m2:array[1..2] of BOOL;
  Panels:array[1..5] of TPanel;
  Barber:array[1..2] of TPanel;
 
implementation
 
{$R *.dfm}
procedure TForm1.DeleteClient;
var
  i:Integer;
  res:BOOL;
begin
  res:=false;
  for i:=5 downto 1 do
  begin
    if m1[i]=true then
    begin
      m1[i]:=false;
      res:=true;
      break;
    end;
  end;
  if res then
  begin
    Panels[i].Color:=$00ffffff;
  end;
end;
 
procedure TForm1.AddClient;
var
  i: integer;
  res: bool;
begin
  res:=false;
  for i:=1 to 5 do
  begin
    if m1[i]=false then
    begin
      m1[i]:=true;
      res:=true;
      break;
    end;
  end;
  if res then
  begin
    Panels[i].Color:=$000000ff;
  end;
end;
 
procedure Thread1.Execute;
begin
  while true do
  begin
    WaitForSingleObject(sem1,INFINITE);
    Sleep(random(10)*100+500);
    Form1.AddClient;
    ReleaseSemaphore(sem2,1,nil);
  end;
end;
 
procedure Thread2.Execute;
begin
  while true do
  begin
    WaitForSingleObject(sem2,INFINITE);
    Form1.DeleteClient;
    ReleaseSemaphore(sem1,1,nil);
    Barber[1].Color:=$00ff0000;
    Sleep(random(10)*200+500);
    Barber[1].Color:=$00ffffff;
    Sleep(300);
  end;
end;
 
procedure Thread3.Execute;
begin
  while true do
  begin
    WaitForSingleObject(sem2,INFINITE);
    Form1.DeleteClient;
    ReleaseSemaphore(sem1,1,nil);
    Barber[2].Color:=$00ff0000;
    Sleep(random(10)*200+500);
    Barber[2].Color:=$00ffffff;
    Sleep(300);
  end;
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  for i:=1 to 5 do
  begin
    Panels[i]:=TPanel.Create(self);
    Panels[i].Color:=$00FFFFFF;
    Panels[i].Width:=40;
    Panels[i].Height:=40;
    Panels[i].Top:=10;
    Panels[i].Left:=10+42*(i-1);
    Panels[i].Parent := Self;
    Panels[i].Caption:=IntToStr(i);
    Panels[i].Show;
  end;
  for i:=1 to 2 do
  begin
    Barber[i]:=TPanel.Create(self);
    Barber[i].Color:=$00FFFFFF;
    Barber[i].Width:=40;
    Barber[i].Height:=40;
    Barber[i].Top:=120;
    Barber[i].Left:=10+42*(i-1);
    Barber[i].Parent := Self;
    Barber[i].Caption:=IntToStr(i);
    Barber[i].Show;
  end;
  sem1:=CreateSemaphore(nil,5,5,nil);
  sem2:=CreateSemaphore(nil,0,5,nil);
  t1:=THread1.Create(false);
  t2:=THread2.Create(false);
  t3:=THread3.Create(false);
end;

end.
