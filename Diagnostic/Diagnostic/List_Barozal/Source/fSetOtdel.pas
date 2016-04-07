unit fSetOtdel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, cxGraphics, Menus, cxLookAndFeelPainters, ActnList,
  StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxControls, cxContainer, cxEdit, cxLabel,
  ExtCtrls, DB, OracleData, dxSkinOffice2007Green;

type
  TfrmSetOtdel = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    lcbOtdel: TcxLookupComboBox;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    odsOtdel: TOracleDataSet;
    dsOtdel: TDataSource;
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
  frmSetOtdel: TfrmSetOtdel;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetOtdel.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetOtdel.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetOtdel.FormCreate(Sender: TObject);
begin
  if odsOtdel.Active = False then
    odsOtdel.Active := True;
end;

end.
