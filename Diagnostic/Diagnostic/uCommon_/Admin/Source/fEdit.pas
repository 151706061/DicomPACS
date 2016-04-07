unit fEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  dxSkinsCore, dxSkinCaramel, dxSkinOffice2007Green, cxControls, cxContainer,
  cxEdit, cxLabel, cxTextEdit, cxMaskEdit, cxButtonEdit;

type
  TfrmEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxLabel1: TcxLabel;
    mePhone: TcxMaskEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    beAdr1: TcxButtonEdit;
    beAdr2: TcxButtonEdit;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdit: TfrmEdit;

implementation

{$R *.dfm}

procedure TfrmEdit.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEdit.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
