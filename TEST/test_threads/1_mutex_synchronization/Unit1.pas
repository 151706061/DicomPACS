unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

THread1 = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure print1;
  end;
 
  THread2 = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure print2;
  end;
 
  PNode = ^TNode;
  TNode = record
    i:Integer;
    next:PNode;
    prev:PNode;
  end;
 
  TList = class
    head: PNode;
    tail: PNode;
    procedure ADDNode(i: integer);
    constructor Create;
  end;
 
var
  Form1: TForm1;
  th1, th2, m: THandle;
  t1,t2: TTHread;
  Memory: Integer;
  list: TList;
    
implementation

{$R *.dfm}

procedure TList.AddNode(i: integer);
var
  node: PNode;
begin
  New(node);
  node.i := i;
  if head = nil then
  begin
     node.prev := nil;
     node.next := nil;
     head := node;
     tail := node;
  end
  else
  begin
     node.prev := tail;
     node.next := nil;
     tail.next := node;
     tail := node;
  end;
end;
 
constructor TList.Create;
begin
  head := nil;
  tail := nil;
  inherited Create;
end;
 
procedure THread1.print1;
begin
  list.AddNode(Memory);
end;
 
procedure THread2.print2;
begin
  list.AddNode(Memory);
end;
 
procedure THread1.Execute;
var
 i:Integer;
begin
  for i:=1 to 30 do
   begin
     WaitForSingleObject(m,INFINITE);
     Memory:=-i;
     Synchronize(print1);
     ReleaseMutex(m);
   end;
end;
 
procedure THread2.Execute;
var
 i:Integer;
begin
  for i:=1 to 30 do
   begin
     WaitForSingleObject(m,INFINITE);
     Memory:=i;
     Synchronize(print2);
     ReleaseMutex(m);
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  node: PNode;
begin
  Memo1.Clear;
  node:=list.tail;
  while node<>list.head.prev do
  begin
    Form1.Memo1.Lines.Add(IntToStr(node.i));
    node:=node.prev;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin //
   Randomize;
   m:=CreateMutex(nil,false,'Mutex');
   t1:=THread1.Create(false);
   t2:=THread2.Create(false);
   list:=TList.Create;
end;

end.
