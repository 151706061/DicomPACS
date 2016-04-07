unit UnAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Medotrade, dxSkinOffice2007Black, dxSkinOffice2007Green,
  cxControls, cxContainer, cxEdit, cxImage, StdCtrls, ExtCtrls, Menus,
  cxLookAndFeelPainters, cxButtons, ComCtrls, dxSkinBlack, frxpngimage;

type
  TFrmAbout = class(TForm)
    Memo2: TMemo;
    cxImage1: TcxImage;
    Panel1: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    StaticText1: TStaticText;
    lbInfo: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    cxButton1: TcxButton;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure StaticText1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    vInfo : AnsiString;
  end;

var
  FrmAbout: TFrmAbout;

implementation

Uses DateUtils, ShellApi;

{$R *.dfm}

function GetMyVersion:string;
type
  TVerInfo=packed record
    Nevazhno: array[0..47] of byte; // ненужные нам 48 байт
    Minor,Major,Build,Release: word; // а тут версия
  end;
var
  s:TResourceStream;
  v:TVerInfo;
begin
  result:='';
  try
    s:=TResourceStream.Create(HInstance,'#1',RT_VERSION); // достаём ресурс
    if s.Size>0 then begin
      s.Read(v,SizeOf(v)); // читаем нужные нам байты
      result:=IntToStr(v.Major)+'.'+IntToStr(v.Minor)+'.'+ // вот и версия...
              IntToStr(v.Release)+'.'+IntToStr(v.Build);
    end;
  s.Free;
  except; end;
end;

procedure TFrmAbout.FormCreate(Sender: TObject);
begin
  lbInfo.Caption := '' ;
end;

procedure TFrmAbout.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then ModalResult:=mrOk;  
end;

procedure TFrmAbout.FormShow(Sender: TObject);
begin
  lbInfo.Caption := vInfo ;
  StatusBar1.Panels.Items[0].Text:='Copyright '+#169+' 2003 - '+inttostr(Yearof(Date))+' Medotrade';   // &copy; 	&#169; 	© 	знак copyright
  StatusBar1.Panels.Items[1].Text:='Версия '+GetMyVersion;
end;

procedure TFrmAbout.StaticText1Click(Sender: TObject);
begin
  try
    //ShellExecute(Self.Handle, 'open', 'http:\\softmaster.timurlan.ru', nil, nil, SW_MAXIMIZE);
    //ShellExecute(Self.Handle, 'open', 'mailto:solov_alex@mail.ru', nil, nil, SW_MAXIMIZE);
    ShellExecute(Self.Handle, 'open', 'http:\\www.medotrade.ru', nil, nil, SW_MAXIMIZE);
  except
  end;
end;

end.
