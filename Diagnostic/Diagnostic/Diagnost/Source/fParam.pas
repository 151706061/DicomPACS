unit fParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, dxBar, ExtCtrls, ImgList, cxControls, cxContainer,
  cxEdit, cxCheckBox;

type
  TfrmParam = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    Panel1: TPanel;
    bbSave: TdxBarButton;
    bbCancel: TdxBarButton;
    alOKCancel: TActionList;
    il: TImageList;
    aSave: TAction;
    aCancel: TAction;
    cbSHOWPAC: TcxCheckBox;
    cbPODT: TcxCheckBox;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParam: TfrmParam;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmParam.aSaveExecute(Sender: TObject);
begin
  ModalResult := MrOK;
end;

procedure TfrmParam.aCancelExecute(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

end.
