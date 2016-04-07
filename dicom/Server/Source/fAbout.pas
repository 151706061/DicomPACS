unit fAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, cxImage, cxTextEdit,
  cxMemo, JclFileUtils;

type
  TfrmAbout = class(TForm)
    JvPanel1: TJvPanel;
    JvPanel2: TJvPanel;
    cxLabel1: TcxLabel;
    JvPanel3: TJvPanel;
    cxButton1: TcxButton;
    al: TActionList;
    aClose: TAction;
    cxImage1: TcxImage;
    lName: TcxLabel;
    cxLabel2: TcxLabel;
    cxMemo1: TcxMemo;
    lVer: TcxLabel;
    procedure aCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAbout.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
var Ver : TJclFileVersionInfo;
begin
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    lVer.Caption := 'версия '+Ver.FileVersion;
  finally
    Ver.Free;
  end;
end;

end.
