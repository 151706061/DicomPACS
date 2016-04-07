unit fCompare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, OleCtrls, SHDocVw, cxClasses, dxSkinsCore,
  dxSkinsdxBarPainter;

type
  TfrmCompare = class(TForm)
    wbCompare: TWebBrowser;
    al: TActionList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    aClose: TAction;
    procedure aCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompare: TfrmCompare;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmCompare.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
