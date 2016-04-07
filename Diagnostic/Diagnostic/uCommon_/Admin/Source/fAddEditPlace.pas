unit fAddEditPlace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxGraphics, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, OracleData, dxSkinCaramel, dxSkinOffice2007Green,
  cxCurrencyEdit, cxGroupBox;

type
  TfrmAddEditPlace = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    cxLabel2: TcxLabel;
    lcbRaion: TcxLookupComboBox;
    odsRaion: TOracleDataSet;
    dsRaion: TDataSource;
    cxLabel3: TcxLabel;
    teAdr: TcxTextEdit;
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
  frmAddEditPlace: TfrmAddEditPlace;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmAddEditPlace.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmAddEditPlace.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAddEditPlace.FormCreate(Sender: TObject);
begin
  if odsRaion.Active = False then
    odsRaion.Active := True;
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
