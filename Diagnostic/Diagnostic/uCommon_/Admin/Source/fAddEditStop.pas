unit fAddEditStop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxMaskEdit, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls, cxCheckBox, cxMemo, cxCurrencyEdit, cxGraphics,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB,
  OracleData, dxSkinCaramel, dxSkinOffice2007Green;

type
  TfrmAddEditStop = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    bOk: TcxButton;
    cxButton1: TcxButton;
    teFName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cbPlat: TcxCheckBox;
    memComment: TcxMemo;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cePrice: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    lcbRaion: TcxLookupComboBox;
    dsRaion: TDataSource;
    odsRaion: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditStop: TfrmAddEditStop;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditStop.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditStop.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditStop.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.Russian, KLF_REORDER);
  if odsRaion.Active = False then
    odsRaion.Active := True;
end;

end.
