unit fAddEditElement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, ActnList, ExtCtrls, ImgList, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, cxClasses, dxSkinOffice2007Green;

type
  TfrmAddEditElement = class(TForm)
    Panel1: TPanel;
    al: TActionList;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    aSave: TAction;
    aCancel: TAction;
    cxLabel1: TcxLabel;
    cxName: TcxTextEdit;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditElement: TfrmAddEditElement;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditElement.aSaveExecute(Sender: TObject);
begin
  ModalResult := MrOk;
end;

procedure TfrmAddEditElement.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

end.
