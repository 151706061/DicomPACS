unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OleCtrls, SHDocVw, StdCtrls, Registry, ShellApi;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CheckPDF;
    procedure checkRunPDF;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//  CheckPDF;
  checkRunPDF;
  WebBrowser1.Navigate(Edit1.Text);
  WebBrowser1.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := 'd:\GammamedMIS.7z';//d:\1.txt pdf';
end;

procedure TForm1.checkRunPDF;
begin
  if ShellExecute( Handle, 'open', PChar( Edit1.Text ), nil, nil, SW_HIDE)=SE_ERR_NOASSOC then // SW_SHOWNORMAL
    ShowMessage( 'Sorry, but there is no Adobe Acrobat or Adobe Acrobat Reader is installed on your system.');
end;

procedure TForm1.CheckPDF;
const BaseKey = '.pdf' ;
      BaseKey2 = '.PDF' ;
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CLASSES_ROOT ;
      if ( OpenKey(BaseKey, False) or OpenKey(BaseKey2, False) ) then
        ShowMessage('Find ...');
    finally
      Free ;
    end ;
end;

end.
