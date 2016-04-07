unit fAddEditMG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, cxGraphics, Menus, cxLookAndFeelPainters, ActnList,
  StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, cxSpinEdit, cxMemo, DB, OracleData, dxSkinCaramel,
  dxSkinOffice2007Green;

type
  TfrmAddEditMG = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    memComment: TcxMemo;
    seKm: TcxSpinEdit;
    cxLabel4: TcxLabel;
    lcbRaion: TcxLookupComboBox;
    odsRaion: TOracleDataSet;
    dsRaion: TDataSource;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditMG: TfrmAddEditMG;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditMG.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditMG.aOkExecute(Sender: TObject);
begin
  if lcbRaion.EditValue = null then
    begin
      MessageDlg('Обязательно укажите близлежайший район!', mtWarning, [mbYes], 0);
      exit;
    end;
  ModalResult := mrOk;
end;

procedure TfrmAddEditMG.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
  if odsRaion.Active = False then
    odsRaion.Active := True;
end;

end.
