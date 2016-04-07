unit fDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxSkinCaramel,
  dxSkinOffice2007Green, dxBar, dxBarExtItems, cxClasses, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ActnList,
  OracleData, Menus, jvDBUtils, cxGridExportLink, frxClass, frxDBSet;

type
  TfrmDetail = class(TForm)
    dxBarDockControl1: TdxBarDockControl;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbRef: TdxBarLargeButton;
    bbInfo: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    tvList: TcxGridDBTableView;
    grListLevel1: TcxGridLevel;
    grList: TcxGrid;
    al: TActionList;
    aRef: TAction;
    aInfo: TAction;
    aPrint: TAction;
    aClose: TAction;
    odsList: TOracleDataSet;
    dsList: TDataSource;
    tvListDate: TcxGridDBColumn;
    tvListAdr1: TcxGridDBColumn;
    tvListAdr2: TcxGridDBColumn;
    tvListFics: TcxGridDBColumn;
    tvListSum: TcxGridDBColumn;
    pmList: TPopupMenu;
    N1: TMenuItem;
    Excel1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aExportXLS: TAction;
    sdPopUp: TSaveDialog;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    procedure aCloseExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aRefExecute(Sender: TObject);
    procedure aExportXLSExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
  private
    dDateBeg, dDateEnd : TDateTime;
    sDateSys_4Rep : string;
    { Private declarations }
  public
    procedure DoShowForm(pDrvID : Integer; pSosID : Variant; pDateBegin, pDateEnd : TDateTime);
    { Public declarations }
  end;

var
  frmDetail: TfrmDetail;

implementation
uses fMain, fSvodVed, fInfo;
{$R *.dfm}

procedure TfrmDetail.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDetail.aExportXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grList, True, True);
end;

procedure TfrmDetail.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmInfo, frmInfo);
  try
    frmInfo.DoShowForm(odsList.FieldByName('fk_id').AsInteger);
    frmInfo.ShowModal;
  finally
    frmInfo.Free;
  end;
end;

procedure TfrmDetail.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('datesys').AsString;
    frxList.ShowReport;
  finally
    ods.Free;
  end;
end;

procedure TfrmDetail.aRefExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmDetail.DoShowForm(pDrvID : Integer; pSosID :Variant; pDateBegin, pDateEnd : TDateTime);
begin
  odsList.Close;
  odsList.SetVariable('psos', pSosID);
  odsList.SetVariable('pdate1', pDateBegin);
  odsList.SetVariable('pdate2', pDateEnd);
  odsList.SetVariable('pfk_drvid', pDrvID);
  odsList.Open;
  dDateBeg := pDateBegin;
  dDateEnd := pDateEnd;
end;

procedure TfrmDetail.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fDetailGr', True, [], 'tvList');
end;

procedure TfrmDetail.FormCreate(Sender: TObject);
begin
  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fDetailGr_Default', True, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fDetailGr', False, False, [], 'tvList');
end;

procedure TfrmDetail.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'CAPTIONREP' then Value := frmDetail.Caption;
  if VarName = 'DATE1' then Value := FormatDateTime('dd.mm.yyyy hh:mm', dDateBeg);
  if VarName = 'DATE2' then Value := FormatDateTime('dd.mm.yyyy hh:mm', dDateEnd);
  if VarName = 'KOLVO' then Value := tvList.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'SUMZAK' then Value := tvList.DataController.Summary.FooterSummaryValues[1];
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;  
end;

procedure TfrmDetail.N3Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fDetailGr_Default', False, False, [], 'tvList');
end;

end.
