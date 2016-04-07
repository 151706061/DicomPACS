unit fEditSpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxGraphics, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, OracleData, cxCheckBox, dxSkinCaramel,
  dxSkinOffice2007Green;

type
  TfrmEditStr = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    teName: TcxTextEdit;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    bOk: TcxButton;
    cxButton1: TcxButton;
    cxLabel2: TcxLabel;
    teShortName: TcxTextEdit;
    lbPref: TcxLabel;
    lcbPref: TcxLookupComboBox;
    odsPref: TOracleDataSet;
    dsPref: TDataSource;
    cbShowInFromWhere: TcxCheckBox;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditStr: TfrmEditStr;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmEditStr.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditStr.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmEditStr.FormCreate(Sender: TObject);
begin
  ActivateKeyboardLayout(frmMain.russian, KLF_REORDER);
end;

end.
