unit fLaborant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, dxBar,
  ActnList, cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, OracleData, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, dxSkinOffice2007Green;

type
  TfrmLaborant = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    al: TActionList;
    aClose: TAction;
    TV: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsLab: TDataSource;
    odsLab: TOracleDataSet;
    VDATE: TcxGridDBColumn;
    VLABORANT: TcxGridDBColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure odsLabBeforeOpen(DataSet: TDataSet);
  private
    pNAZID : Integer;
    { Private declarations }
  public
    procedure DoShowForm(nNAZID : Integer);
    { Public declarations }
  end;

var
  frmLaborant: TfrmLaborant;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmLaborant.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmLaborant.DoShowForm(nNAZID : Integer);
begin
  pNAZID := nNAZID;
  if odsLab.Active = False then
    odsLab.Open;
end;

procedure TfrmLaborant.odsLabBeforeOpen(DataSet: TDataSet);
begin
  odsLab.SetVariable('PFK_NAZID', pNAZID);
end;

end.
