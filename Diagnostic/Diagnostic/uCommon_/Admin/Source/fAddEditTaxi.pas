unit fAddEditTaxi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxMaskEdit, cxSpinEdit, cxGroupBox, dxSkinCaramel, dxSkinOffice2007Green,
  cxCurrencyEdit;

type
  TfrmAddEditTaxi = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxLabel2: TcxLabel;
    teShort: TcxTextEdit;
    sePriceKM: TcxSpinEdit;
    cxLabel4: TcxLabel;
    gbPercent: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    meFree: TcxMaskEdit;
    meMG: TcxMaskEdit;
    cxLabel7: TcxLabel;
    meAll: TcxMaskEdit;
    cxLabel3: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    gbTalon: TcxGroupBox;
    cxLabel10: TcxLabel;
    ceCar: TcxCurrencyEdit;
    cxLabel11: TcxLabel;
    ceMin: TcxCurrencyEdit;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    Panel2: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditTaxi: TfrmAddEditTaxi;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditTaxi.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditTaxi.aOkExecute(Sender: TObject);
begin
  if teShort.Text = '' then
    begin
      MessageDlg('Внимание!'+#13+#10+'Поле "Сокращенно" не заполнено!', mtWarning, [mbOK], 0);
      teShort.SetFocus;
      exit;
    end;
  ModalResult := mrOk;
end;

procedure TfrmAddEditTaxi.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
