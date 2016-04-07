unit fSetKabinet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, OracleData, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar, dxSkinsCore,
  dxSkinscxPCPainter, dxSkinsdxBarPainter;

type
  TfrmSetKabinet = class(TForm)
    grKab: TcxGrid;
    tvKab: TcxGridDBTableView;
    tvKabColumn1: TcxGridDBColumn;
    grKabLevel1: TcxGridLevel;
    al: TActionList;
    aOk: TAction;
    aEsc: TAction;
    odsKab: TOracleDataSet;
    dsKab: TDataSource;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbEsc: TdxBarButton;
    procedure aOkExecute(Sender: TObject);
    procedure aEscExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetKabinet: TfrmSetKabinet;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmSetKabinet.aEscExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetKabinet.aOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetKabinet.FormCreate(Sender: TObject);
begin
  if odsKab.Active = False then
    odsKab.Active := True;
end;

end.
