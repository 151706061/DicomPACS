unit fSetCompanyTransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ActnList,
  dxBar, cxClasses, ImgList, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, ExtCtrls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, OracleData, frxClass, frxDBSet, cxGridExportLink,
  dxSkinOffice2007Green;

type
  TfrmSetCompanyTransfer = class(TForm)
    BM: TdxBarManager;
    AL: TActionList;
    IL: TImageList;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbSet: TdxBarButton;
    bbClose: TdxBarButton;
    aClose: TAction;
    aSet: TAction;
    paSearch: TPanel;
    cxCompanyName: TcxTextEdit;
    cxLabel1: TcxLabel;
    bClear: TcxButton;
    aClear: TAction;
    TV: TcxGridDBTableView;
    cxGrLevel1: TcxGridLevel;
    cxGr: TcxGrid;
    ds: TDataSource;
    odsSearchCompany: TOracleDataSet;
    VNAME: TcxGridDBColumn;
    VOWNER: TcxGridDBColumn;
    bbPrint: TdxBarButton;
    aPrint: TAction;
    frxRep: TfrxReport;
    frxDB: TfrxDBDataset;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aExcel: TAction;
    sdPopUp: TSaveDialog;
    N4: TMenuItem;
    Web1: TMenuItem;
    XML1: TMenuItem;
    Excel1: TMenuItem;
    procedure aSetExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure cxCompanyNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TVCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TVKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure odsSearchCompanyAfterOpen(DataSet: TDataSet);
    procedure cxCompanyNameEnter(Sender: TObject);
    procedure cxCompanyNameClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    procedure N3Click(Sender: TObject);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    sSysDate_4Rep : string;
    Russian : HKL;
    procedure CheckEnabledButtons;
    { Private declarations }
  public
    procedure DoShowForm(nType : Integer);
    { Public declarations }
  end;

var
  frmSetCompanyTransfer: TfrmSetCompanyTransfer;

implementation
uses fMain;
{$R *.dfm}

{ TfrmSetCompanyTransfer }

procedure TfrmSetCompanyTransfer.aClearExecute(Sender: TObject);
begin
  odsSearchCompany.Filtered := False;
  cxCompanyName.Clear;
end;

procedure TfrmSetCompanyTransfer.aCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetCompanyTransfer.aExcelExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToExcel(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSetCompanyTransfer.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT TO_CHAR(SYSDATE, ''DD.MM.YYYY HH24:MI'') AS DATESYS FROM DUAL ';
    ods.Open;
    sSysDate_4Rep := ods.FieldByName('DATESYS').AsString;
  finally
    ods.Free;
  end;
  frxRep.ShowReport;
end;

procedure TfrmSetCompanyTransfer.aSetExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSetCompanyTransfer.aTextExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'txt';
  sdPopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToText(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSetCompanyTransfer.aWebExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'html';
  sdPopUp.Filter := 'Web-страницы (*.html)|*.html';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToHTML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSetCompanyTransfer.aXMLExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xml';
  sdPopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if sdPopUp.Execute then
    if TV.DataController.Controller.SelectedRecordCount > 1 then
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, FALSE)
    else
      ExportGridToXML(sdPopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmSetCompanyTransfer.CheckEnabledButtons;
begin
  aSet.Enabled := odsSearchCompany.RecordCount <> 0;
  aPrint.Enabled := odsSearchCompany.RecordCount <> 0;
end;

procedure TfrmSetCompanyTransfer.cxCompanyNameClick(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSetCompanyTransfer.cxCompanyNameEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
end;

procedure TfrmSetCompanyTransfer.cxCompanyNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  odsSearchCompany.Filter := 'fc_name = ''*' + AnsiUpperCase(cxCompanyName.Text) + '*'' ';
  odsSearchCompany.Filtered := True;
  aSet.Enabled := odsSearchCompany.RecordCount <> 0;
  aPrint.Enabled := odsSearchCompany.RecordCount <> 0;
end;

procedure TfrmSetCompanyTransfer.DoShowForm(nType: Integer);
begin
  if nType = 1 then
    frmSetCompanyTransfer.Caption := 'Выбор компании, из которой будете переносить пациентов'
  else
    frmSetCompanyTransfer.Caption := 'Выбор компании, в которую будете переносить пациентов';
  if odsSearchCompany.Active = False then
    odsSearchCompany.Open;

  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fSetCompanyTransfer\TV'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fSetCompanyTransfer\TV'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TV');
end;

procedure TfrmSetCompanyTransfer.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fSetCompanyTransfer\TV'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TV');
end;

procedure TfrmSetCompanyTransfer.FormCreate(Sender: TObject);
begin
  russian:=LoadKeyboardLayout('00000419', 0);
end;

procedure TfrmSetCompanyTransfer.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SOTR' then Value := frmMain.sVrachFIO;
  if VarName = 'DATESYS' then Value := sSysDate_4Rep;
end;

procedure TfrmSetCompanyTransfer.N3Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fSetCompanyTransfer\TV'+'Vrach'+ '_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmSetCompanyTransfer.odsSearchCompanyAfterOpen(DataSet: TDataSet);
begin
  CheckEnabledButtons;
end;

procedure TfrmSetCompanyTransfer.TVCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aSetExecute(nil);
end;

procedure TfrmSetCompanyTransfer.TVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    aSetExecute(nil);
end;

end.
