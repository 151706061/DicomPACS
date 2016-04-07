unit fSetKab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ExtCtrls, OracleData,
  cxCheckBox;

type
  TfrmSetKab = class(TForm)
    tvKab: TcxGridDBTableView;
    grKabLevel1: TcxGridLevel;
    grKab: TcxGrid;
    Panel1: TPanel;
    bOk: TcxButton;
    cxButton1: TcxButton;
    al: TActionList;
    aSet: TAction;
    aCancel: TAction;
    dsKab: TDataSource;
    odsKab: TOracleDataSet;
    tvKabCheck: TcxGridDBColumn;
    tvKabName: TcxGridDBColumn;
    odsKabFL_CHECK: TFloatField;
    odsKabFK_ID: TFloatField;
    odsKabFC_NAME: TStringField;
    odsKabFC_PHONE: TStringField;
    odsKabIS_FLU: TFloatField;
    procedure aSetExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetKab: TfrmSetKab;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetKab.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetKab.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetKab.FormCreate(Sender: TObject);
begin
  if odsKab.Active = False then
    odsKab.Active := True;
end;

procedure TfrmSetKab.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', frmMain.pSOTRID);
end;

end.
