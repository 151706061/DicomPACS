unit fAddEditModal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, cxClasses, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls, dxSkinsCore, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmAddEditModal = class(TForm)
    alOkCancel: TActionList;
    aSave: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teModal: TcxTextEdit;
    Panel2: TPanel;
    bCancel: TcxButton;
    bOk: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditModal: TfrmAddEditModal;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditModal.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditModal.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
