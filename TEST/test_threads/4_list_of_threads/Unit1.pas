unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    myList : TList;
  end;

{Определение класса TMyThread}
type
  TMyThread = class(TThread)
  private
    procedure MyTerminate(Sender: TObject);
  protected
   procedure DoWork;
   procedure DoStop;
   procedure Execute; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TMyThread.Execute;
var i:Integer;
begin
  Synchronize(DoWork);
end;

procedure TMyThread.DoWork;
begin
  while Form1.myList.Count>2 do Sleep(100);
  Sleep(1000);
  Form1.Memo1.Lines.Append( '+ Поток '+IntToStr(Form1.myList.Count)+' запущен ...' +#10+
                            'Всего потоков : '+ IntToStr(Form1.myList.Count)
                          );
  Application.ProcessMessages;
end;

procedure TMyThread.DoStop;
var i,vfnd:Integer;
begin
  vfnd:=-1;
  for I := 0 to Form1.myList.Count - 1 do
    if TMyThread(Form1.myList[i])=Self then
    begin
      vfnd:=i;
      Break;
    end;
  if vfnd>=0 then Form1.myList.Delete(vfnd);
  Form1.Memo1.Lines.Append( '- Потоков '+IntToStr(vfnd+1)+' остановлен ...' +#10+
                            'Всего потоков : '+ IntToStr(Form1.myList.Count)
                          );
  Application.ProcessMessages;
end;

procedure TMyThread.MyTerminate;
begin
  Synchronize(DoStop);
end;

procedure TForm1.Button1Click(Sender: TObject);
var  T1,T2,T3,T4 : TMyThread;
begin
  T1 := TMyThread.Create(False);
  myList.Add(T1);
  T1.OnTerminate := T1.MyTerminate;
  Application.ProcessMessages;

  T2 := TMyThread.Create(False);
  myList.Add(T2);
  T2.OnTerminate := T2.MyTerminate;
  Application.ProcessMessages;

  T3 := TMyThread.Create(False);
  myList.Add(T3);
  T3.OnTerminate := T3.MyTerminate;
  Application.ProcessMessages;

  T4 := TMyThread.Create(False);
  myList.Add(T4);
  T4.OnTerminate := T4.MyTerminate;
  Application.ProcessMessages;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  myList := TList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var i:Integer;
begin
  for I := 0 to myList.Count - 1 do
    TMyThread(myList[i]).Terminate;
  myList.Clear;
  myList.Free;
end;

end.
