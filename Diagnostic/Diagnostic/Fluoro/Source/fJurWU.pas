unit fJurWU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxSkinBlack, dxBar, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ActnList,
  jvDBUtils, OracleData, Menus, cxGridExportLink, frxClass, frxDBSet,
  dxSkinOffice2007Green;

type
  TfrmJurWU = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbRef: TdxBarButton;
    bbClose: TdxBarButton;
    tvList: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    al: TActionList;
    aRef: TAction;
    aClose: TAction;
    dsList: TDataSource;
    odsList: TOracleDataSet;
    tvListFam: TcxGridDBColumn;
    tvListIm: TcxGridDBColumn;
    tvListOtch: TcxGridDBColumn;
    tvListRojd: TcxGridDBColumn;
    tvListSex: TcxGridDBColumn;
    bbPrint: TdxBarButton;
    aXLS: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    pmGrid: TPopupMenu;
    aPrint: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    dlgSavePopUp: TSaveDialog;
    frxList: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N4Click(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure odsListAfterOpen(DataSet: TDataSet);
  private
    GET_SYSDATE_4REP : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJurWU: TfrmJurWU;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmJurWU.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmJurWU.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    GET_SYSDATE_4REP := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  frxList.ShowReport;
end;

procedure TfrmJurWU.aRefExecute(Sender: TObject);
begin
  RefreshQuery(odsList);
end;

procedure TfrmJurWU.aTextExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'txt';
  dlgSavePopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if dlgSavePopUp.Execute then
    ExportGridToText(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJurWU.aWebExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'html';
  dlgSavePopUp.Filter := 'Web-страницы (*.html)|*.html';
  if dlgSavePopUp.Execute then
    ExportGridToHTML(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJurWU.aXLSExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xls';
  dlgSavePopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if dlgSavePopUp.Execute then
    ExportGridToExcel(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJurWU.aXMLExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xml';
  dlgSavePopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if dlgSavePopUp.Execute then
    ExportGridToXML(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJurWU.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvList.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJurWU\tvListSotr_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'tvList');
end;

procedure TfrmJurWU.FormCreate(Sender: TObject);
begin
  tvList.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJurWU\tvListSotr_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJurWU\tvListSotr_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'tvList');
  aPrint.Enabled := False;
end;

procedure TfrmJurWU.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'DATESYS' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmJurWU.N4Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJurWU\tvListSotr_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'tList');
end;

procedure TfrmJurWU.odsListAfterOpen(DataSet: TDataSet);
begin
  aPrint.Enabled := odsList.RecordCount > 0;
end;

end.
