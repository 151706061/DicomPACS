unit fEditType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, dxSkinsCore, dxSkinsDefaultPainters, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ActnList, ExtCtrls, DB, OracleData;

type
  TfrmEditType = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    lcbType: TcxLookupComboBox;
    al: TActionList;
    aSave: TAction;
    aCancel: TAction;
    dsType: TDataSource;
    odsType: TOracleDataSet;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditType: TfrmEditType;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmEditType.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEditType.aSaveExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmEditType.FormCreate(Sender: TObject);
begin
  if odsType.Active = False then
    odsType.Active := True;
end;

end.
