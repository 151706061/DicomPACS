unit fSetSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxSkinsdxBarPainter, OracleData, dxBar, cxClasses, ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid;

type
  TfrmSetSotr = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    cxGrZavOtdel: TcxGrid;
    TVACCESS: TcxGridDBTableView;
    VFIO: TcxGridDBColumn;
    cxGrZavOtdelLevel1: TcxGridLevel;
    actlst1: TActionList;
    actSet: TAction;
    actCancel: TAction;
    dxBM: TdxBarManager;
    dxBMBar1: TdxBar;
    bbOk: TdxBarButton;
    bbCancel: TdxBarButton;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    procedure odsSotrBeforeOpen(DataSet: TDataSet);
    procedure actSetExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure TVACCESSCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVACCESSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    pOTDELID : Integer;
    { Private declarations }
  public
    procedure DoShowForm(nOTDELID : Integer);
    { Public declarations }
  end;

var
  frmSetSotr: TfrmSetSotr;

implementation

{$R *.dfm}

{ TfrmSetSotr }

procedure TfrmSetSotr.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetSotr.actSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetSotr.DoShowForm(nOTDELID: Integer);
begin
  pOTDELID := nOTDELID;
  if odsSotr.Active = False then
    odsSotr.Open;
end;

procedure TfrmSetSotr.odsSotrBeforeOpen(DataSet: TDataSet);
begin
  odsSotr.SetVariable('PFK_OTDELID', pOTDELID);
end;

procedure TfrmSetSotr.TVACCESSCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetSotr.TVACCESSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ModalResult := mrOk;
end;

end.
