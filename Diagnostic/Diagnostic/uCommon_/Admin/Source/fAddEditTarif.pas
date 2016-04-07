unit fAddEditTarif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxSpinEdit, cxMaskEdit, cxTimeEdit, cxCurrencyEdit, dxSkinCaramel,
  dxSkinOffice2007Green;

type
  TfrmAddEditTarif = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    bOk: TcxButton;
    cxButton1: TcxButton;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    teBegin: TcxTimeEdit;
    teEnd: TcxTimeEdit;
    ceCar: TcxCurrencyEdit;
    ceMin: TcxCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditTarif: TfrmAddEditTarif;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditTarif.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditTarif.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditTarif.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
