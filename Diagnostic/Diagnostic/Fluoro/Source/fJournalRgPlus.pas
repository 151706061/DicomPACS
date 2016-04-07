unit fJournalRgPlus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter, ImgList,
  ActnList, dxBar, cxClasses, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxControls, cxGridCustomView, cxGrid,
  DB, dxmdaset, Oracle, Menus, cxGridExportLink, frxClass, frxDBSet, OracleData, Clipbrd,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmJournalRgPlus = class(TForm)
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    il: TImageList;
    al: TActionList;
    aClose: TAction;
    aPrint: TAction;
    aText: TAction;
    aWeb: TAction;
    aXML: TAction;
    aXLS: TAction;
    aRefresh: TAction;
    BMBar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    cxGr: TcxGrid;
    TV: TcxGridTableView;
    VFIO: TcxGridColumn;
    VFK_ID: TcxGridColumn;
    VFD_ROJD: TcxGridColumn;
    cxGrLevel1: TcxGridLevel;
    oqThread: TOracleQuery;
    memData: TdxMemData;
    memDataFK_ID: TIntegerField;
    memDataFIO: TStringField;
    memDataFD_ROJD: TDateField;
    pmTV: TPopupMenu;
    N1: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N2: TMenuItem;
    dlgSavePopUp: TSaveDialog;
    frxList: TfrxReport;
    frxDBList: TfrxDBDataset;
    VPACID: TcxGridColumn;
    memDataPACID: TIntegerField;
    memDataPLANDATE: TStringField;
    VPLANDATE: TcxGridColumn;
    memDataPER: TStringField;
    VPER: TcxGridColumn;
    VWORK: TcxGridColumn;
    memDataWORK: TStringField;
    N3: TMenuItem;
    bbBase: TdxBarButton;
    aBase: TAction;
    aSearch: TAction;
    bbSearch: TdxBarButton;
    memDataUCH: TStringField;
    VUCH: TcxGridColumn;
    VLAST: TcxGridColumn;
    memDataLAST: TStringField;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure aTextExecute(Sender: TObject);
    procedure aWebExecute(Sender: TObject);
    procedure aXMLExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure frxListGetValue(const VarName: string; var Value: Variant);
    procedure aPrintExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure aBaseExecute(Sender: TObject);
    procedure aSearchExecute(Sender: TObject);
  private
      russian : HKL;
      GET_SYSDATE_4REP : String;
      procedure CheckEnabledButtons;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJournalRgPlus: TfrmJournalRgPlus;

implementation

uses fMain, fAllHistory, fSearch;
                                                                
{$R *.dfm}

procedure TfrmJournalRgPlus.aBaseExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmAllHistory, frmAllHistory);
  try
    frmAllHistory.DoShowForm(TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFK_ID.Index],
                             TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFIO.Index]);
    frmAllHistory.ShowModal;
  finally
    frmAllHistory.Free;
  end;
end;

procedure TfrmJournalRgPlus.aCloseExecute(Sender: TObject);
begin
  oqThread.BreakThread;
  ModalResult := mrCancel;
end;

procedure TfrmJournalRgPlus.aPrintExecute(Sender: TObject);
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

procedure TfrmJournalRgPlus.aRefreshExecute(Sender: TObject);
begin
  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  if tv.DataController.LockCount = 0 then
    tv.BeginUpdate;
  tv.DataController.RecordCount := 0;
  while tv.DataController.LockCount > 0 do
    tv.EndUpdate;
  cxGr.Refresh;
  memData.Close;
  memData.Open;
  oqThread.Scrollable := True;
  oqThread.Execute;
end;

procedure TfrmJournalRgPlus.aSearchExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSearch, frmSearch);
  try
    frmSearch.DoShowfrmSearch(1, -1); // здесь "1" по умолчанию только как для участков // !!! второй параметр лишний
    frmSearch.ShowModal;
  finally
    frmSearch.Free;
  end;
end;

procedure TfrmJournalRgPlus.aTextExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'txt';
  dlgSavePopUp.Filter := 'Текстовые файлы (*.txt)|*.txt';
  if dlgSavePopUp.Execute then
    ExportGridToText(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJournalRgPlus.aWebExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'html';
  dlgSavePopUp.Filter := 'Web-страницы (*.html)|*.html';
  if dlgSavePopUp.Execute then
    ExportGridToHTML(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJournalRgPlus.aXLSExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xls';
  dlgSavePopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if dlgSavePopUp.Execute then
    ExportGridToExcel(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJournalRgPlus.aXMLExecute(Sender: TObject);
begin
  dlgSavePopUp.DefaultExt := 'xml';
  dlgSavePopUp.Filter := 'XML-страницы (*.xml)|*.xml';
  if dlgSavePopUp.Execute then
    ExportGridToXML(dlgSavePopUp.FileName, cxGr, TRUE, TRUE);
end;

procedure TfrmJournalRgPlus.CheckEnabledButtons;
begin
  aPrint.Enabled := oqThread.RowCount <> 0;
  aBase.Enabled := oqThread.RowCount <> 0;
end;

procedure TfrmJournalRgPlus.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJournalRgPlus\TVVrach_' + IntToStr(frmMain.pSOTRID), TRUE, [], 'TV');
end;

procedure TfrmJournalRgPlus.FormCreate(Sender: TObject);
begin
  aPrint.Enabled := False;
  aBase.Enabled := False;
  russian:=LoadKeyboardLayout('00000419', 0);
  TV.StoreToRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJournalRgPlus\TVVrach_' + IntToStr(frmMain.pSOTRID)+'Default', TRUE, [], 'TV');
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJournalRgPlus\TVVrach_' + IntToStr(frmMain.pSOTRID), FALSE, FALSE, [], 'TV');
end;

procedure TfrmJournalRgPlus.frxListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'COMPANYNAME' then Value := frmMain.sCompanyName_4Rep;
  if VarName = 'OTDELNAME' then Value := frmMain.sOtdelName_4Rep;
  if VarName = 'SYSDATE' then Value := GET_SYSDATE_4REP;
  if VarName = 'MEDOTRADESIGN' then Value := frmMain.MedotradeSign;
end;

procedure TfrmJournalRgPlus.N2Click(Sender: TObject);
begin
  TV.RestoreFromRegistry('\SoftWare\SoftMaster\Fluoro_vyverka\fJournalRgPlus\TVVrach_' + IntToStr(frmMain.pSOTRID)+'Default', FALSE, FALSE, [], 'TV');
end;

procedure TfrmJournalRgPlus.N3Click(Sender: TObject);
begin
  ActivateKeyboardLayout(russian, KLF_REORDER);
  Clipboard.AsText := TV.DataController.Values[TV.DataController.FocusedRecordIndex, VFIO.Index];
end;

procedure TfrmJournalRgPlus.oqThreadThreadError(Sender: TOracleQuery;
  ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
end;

procedure TfrmJournalRgPlus.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  aRefresh.Enabled := True;
  CheckEnabledButtons;
end;

procedure TfrmJournalRgPlus.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  tv.BeginUpdate;
  tv.DataController.RecordCount := tv.DataController.RecordCount + 1;
  with tv.DataController do
  begin
    try
      Values[tv.DataController.RecordCount - 1, vFIO.Index] := Sender.Field('FIO');
      Values[tv.DataController.RecordCount - 1, vFD_ROJD.Index] := Sender.Field('FD_ROJD');
      Values[tv.DataController.RecordCount - 1, vFK_ID.Index] := Sender.Field('FK_ID');
      Values[tv.DataController.RecordCount - 1, vPLANDATE.Index] := Sender.Field('PLANDATE');
      Values[tv.DataController.RecordCount - 1, vPER.Index] := Sender.Field('PER');
      Values[tv.DataController.RecordCount - 1, vWORK.Index] := Sender.Field('fc_name');
      Values[tv.DataController.RecordCount - 1, vUCH.Index] := Sender.Field('uch');
      Values[tv.DataController.RecordCount - 1, vLAST.Index] := Sender.Field('last');
      memData.Insert;
      memData.FieldByName('FIO').AsString := Sender.Field('FIO');
      memData.FieldByName('FD_ROJD').AsDateTime := Sender.Field('FD_ROJD');
      memData.FieldByName('FK_ID').AsString := Sender.Field('FK_ID');
      memData.FieldByName('PLANDATE').AsString := Sender.Field('PLANDATE');
      memData.FieldByName('PER').AsString := Sender.Field('PER');
      memData.FieldByName('WORK').AsString := Sender.Field('fc_name');
      memData.FieldByName('UCH').AsString := Sender.Field('uch');
      memData.FieldByName('LAST').AsString := Sender.Field('last');
      memData.Post;
      memData.Next;
    finally
    end;
  end;
  tv.EndUpdate;
end;

end.
