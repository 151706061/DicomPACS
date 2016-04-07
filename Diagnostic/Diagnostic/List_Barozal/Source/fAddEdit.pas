unit fAddEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, ActnList, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, dxSkinOffice2007Green;

type
  TfrmAddEdit = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    teValue: TcxTextEdit;
    Panel2: TPanel;
    bOk: TcxButton;
    bCancel: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEdit: TfrmAddEdit;

implementation

{$R *.dfm}

procedure TfrmAddEdit.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEdit.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
