unit fSvodVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxSkinCaramel,
  dxSkinOffice2007Green, Oracle, dxBar, dxBarExtItems, cxClasses, ActnList,
  ImgList, cxGraphics, frxClass, frxDBSet, Menus, DB, dxmdaset, OracleData,
  cxStyles, cxEdit, cxCalendar, cxDBLookupComboBox, cxButtonEdit, cxMaskEdit,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxLabel,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxControls,
  cxGridCustomView, cxGrid, cxSplitter, cxContainer, JvExControls,
  JvAnimatedImage, JvGIFCtrl, cxVGrid, cxInplaceContainer, ExtCtrls,
  cxGridExportLink, cxDropDownEdit, cxTimeEdit, cxPC;

type
  TfrmSvodVed = class(TForm)
    dsTaxi: TDataSource;
    odsTaxi: TOracleDataSet;
    frxRep: TfrxReport;
    sdPopUp: TSaveDialog;
    dxMemData1: TdxMemData;
    pmVIEW: TPopupMenu;
    N1: TMenuItem;
    Excel1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    frxDB: TfrxDBDataset;
    ilSmall: TcxImageList;
    al: TActionList;
    aRefresh: TAction;
    aClose: TAction;
    aXLS: TAction;
    aPrint: TAction;
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbRefresh: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    oqThread: TOracleQuery;
    paLeft: TPanel;
    vGrParam: TcxVerticalGrid;
    catMain: TcxCategoryRow;
    rowDate1: TcxEditorRow;
    rowDate2: TcxEditorRow;
    rowTaxi: TcxEditorRow;
    catPer: TcxCategoryRow;
    rowAll: TcxEditorRow;
    rowFree: TcxEditorRow;
    rowMG: TcxEditorRow;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxSplitter2: TcxSplitter;
    cxSplitter1: TcxSplitter;
    paClient: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    dxMemData1Kod: TIntegerField;
    dxMemData1Name: TStringField;
    dxMemData1SumAll: TFloatField;
    dxMemData1SumAllPer: TFloatField;
    dxMemData1SumMG: TFloatField;
    dxMemData1SumMGPer: TFloatField;
    dxMemData1SumFree: TFloatField;
    dxMemData1SumFreePer: TFloatField;
    dxMemData1SumPer: TFloatField;
    odsCntZakaz: TOracleDataSet;
    odsCntCity: TOracleDataSet;
    odsCntFree: TOracleDataSet;
    odsCntMG: TOracleDataSet;
    rowStatus: TcxEditorRow;
    rowDop: TcxCategoryRow;
    rowTime1: TcxEditorRow;
    rowTime2: TcxEditorRow;
    bbDetail: TdxBarLargeButton;
    aDetail: TAction;
    dxMemData1DrvID: TIntegerField;
    dxMemData1SumPenalty: TFloatField;
    dxMemData1SumPenaltyPer: TFloatField;
    aPrintShort: TAction;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    frxRepSh: TfrxReport;
    pcMain: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    grList: TcxGrid;
    tvList: TcxGridTableView;
    tvListKod: TcxGridColumn;
    tvListSotr: TcxGridColumn;
    tvListSumAll: TcxGridColumn;
    tvListSumAllPer: TcxGridColumn;
    tvListSumMG: TcxGridColumn;
    tvListSumMGPer: TcxGridColumn;
    tvListSumFree: TcxGridColumn;
    tvListSumFreePer: TcxGridColumn;
    tvListSumPen: TcxGridColumn;
    tvListSumPenPer: TcxGridColumn;
    tvListSumPer: TcxGridColumn;
    tvListDrvID: TcxGridColumn;
    grListLevel1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridTableView1: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridColumn11: TcxGridColumn;
    cxGridColumn12: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridTableView1Column1: TcxGridColumn;
    cxGridTableView1Column2: TcxGridColumn;
    cxGridTableView1Column3: TcxGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure rowTaxiEditPropertiesChange(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    procedure aDetailExecute(Sender: TObject);
    procedure aPrintShortExecute(Sender: TObject);
  private
    dDateBegin, dDateEnd : TDateTime;
    bbr : Boolean;
    StartTime: TTime;
    sDateSys_4Rep, sCntZakaz_4Rep, sCntCity_4Rep, sCntFree_4Rep, sCntMG_4Rep : string;    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSvodVed: TfrmSvodVed;

implementation
uses fMain, fDetail;
{$R *.dfm}

procedure TfrmSvodVed.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmSvodVed.aDetailExecute(Sender: TObject);
var SosID : Variant;
begin
  Application.CreateForm(TfrmDetail, frmDetail);
  frmDetail.Caption := 'Детализация по заказам. Позывной № '+IntToStr(tvList.DataController.Values[tvList.DataController.FocusedRecordIndex, tvListKod.Index])+
                       ' ('+odsTaxi.FieldByName('fc_name').AsString+')';
  if rowStatus.Properties.Value = 'Все' then
    SosID := '1, 4';
  if rowStatus.Properties.Value = 'Закрытые' then
    SosID := 1;
  if rowStatus.Properties.Value = 'Неоплаченные' then
    SosID := 4;
  frmDetail.DoShowForm(tvList.DataController.Values[tvList.DataController.FocusedRecordIndex, tvListDrvID.Index], SosID, dDateBegin, dDateEnd);
  try
    frmDetail.ShowModal;
  finally
    frmDetail.Free;
  end;
end;

procedure TfrmSvodVed.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('datesys').AsString;
    frxRep.ShowReport;
  finally
    ods.Free;
  end;
end;

procedure TfrmSvodVed.aPrintShortExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('datesys').AsString;
    frxRepSh.ShowReport;
  finally
    ods.Free;
  end;
end;

procedure TfrmSvodVed.aRefreshExecute(Sender: TObject);
begin
  vGrParam.SetFocus;

  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  aDetail.Enabled := False;
  aXLS.Enabled := False;

  if tvList.DataController.LockCount = 0 then
    tvList.BeginUpdate;
  tvList.DataController.RecordCount := 0;
  while tvList.DataController.LockCount > 0 do
    tvList.EndUpdate;
  dxMemData1.Close;
  dxMemData1.Open;
// -- Даты
  if (rowTime1.Properties.Value = null) or (rowTime1.Properties.Value = '00:00') or (rowTime1.Properties.Value = '0') then
    dDateBegin := VarToDateTime(rowDate1.Properties.Value)
  else
    dDateBegin := VarToDateTime(rowDate1.Properties.Value+' '+rowTime1.Properties.Value);
  if (rowTime2.Properties.Value = null) or (rowTime2.Properties.Value = '00:00') or (rowTime2.Properties.Value = '0') then
    dDateEnd := VarToDateTime(rowDate2.Properties.Value+' 23:59:59')
  else
    dDateEnd := VarToDateTime(rowDate2.Properties.Value+' '+rowTime2.Properties.Value);
  oqThread.Scrollable := True;

  cxLabel1.Caption := '';
  cxLabel2.Caption := '';
  cxLabel3.Caption := 'Выполняется запрос к Базе Данных...';
  StartTime:= Now;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  bbr := False;
  paSubParam.Visible := True;
  cxSplitter2.Visible := True;
  Animator1.Animate := True;
  if rowStatus.Properties.Value = 'Все' then
    oqThread.SetVariable('psos', '1, 4');
  if rowStatus.Properties.Value = 'Закрытые' then
    oqThread.SetVariable('psos', 1);
  if rowStatus.Properties.Value = 'Неоплаченные' then
    oqThread.SetVariable('psos', 4);
  oqThread.SetVariable('pdate1', dDateBegin);
  oqThread.SetVariable('pdate2', dDateEnd);
  oqThread.SetVariable('pfk_taxiid', rowTaxi.Properties.Value);
  oqThread.SetVariable('pPerAll', rowAll.Properties.Value);
  oqThread.SetVariable('pPerMG', rowMG.Properties.Value);
  oqThread.SetVariable('pPerFree', rowFree.Properties.Value);
  oqThread.Execute;
end;

procedure TfrmSvodVed.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grList, True, True);
end;

procedure TfrmSvodVed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fSvodVedGr', True, [], 'tvList');
  oqThread.BreakThread;
  Action := caFree;
end;

procedure TfrmSvodVed.FormCreate(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
  Self.WindowState := wsMaximized;
  rowDate1.Properties.Value := Date;
  rowDate2.Properties.Value := Date;
  rowStatus.Properties.Value := 'Все';
  if odsTaxi.Active = False then
    odsTaxi.Active := True;
  rowStatus.Properties.Value := 'Все';

  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fSvodVedGr_Default', True, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSvodVedGr', False, False, [], 'tvList');
end;

procedure TfrmSvodVed.FormDestroy(Sender: TObject);
begin
  frmSvodVed := nil;
end;

procedure TfrmSvodVed.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'TAXI' then Value := odsTaxi.FieldByName('fc_name').AsString;
  if VarName = 'SUMALL' then Value := tvList.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'SUMMG' then Value := tvList.DataController.Summary.FooterSummaryValues[1];
  if VarName = 'SUMFREE' then Value := tvList.DataController.Summary.FooterSummaryValues[2];
  if VarName = 'SUMPER' then Value := tvList.DataController.Summary.FooterSummaryValues[3];
  if VarName = 'SUMPENALTY' then Value := tvList.DataController.Summary.FooterSummaryValues[4];
  if VarName = 'SUMALL_Z' then Value := sCntCity_4Rep;
  if VarName = 'SUMMG_Z' then Value := sCntMG_4Rep;
  if VarName = 'SUMFREE_Z' then Value := sCntFree_4Rep;
  if VarName = 'DATE1' then Value := FormatDateTime('dd.mm.yyyy hh:mm', dDateBegin);
  if VarName = 'DATE2' then Value := FormatDateTime('dd.mm.yyyy hh:mm', dDateEnd);
  if VarName = 'SUMALL_ZAKAZ' then Value := sCntZakaz_4Rep;
end;

procedure TfrmSvodVed.N3Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fSvodVedGr_Default', False, False, [], 'tvList');
end;

procedure TfrmSvodVed.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmSvodVed.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread.RowCount > 0;
  aDetail.Enabled := oqThread.RowCount > 0;
  aXLS.Enabled := oqThread.RowCount > 0;
  Animator1.Animate := False;
  if bbr then
    begin
      cxLabel3.Caption := 'При выполнении запроса произошла ошибка!';
    end else
    begin
      cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
    end;
// -- вычисляем количество заказов
// -- по городу
    odsCntCity.Close;
    odsCntCity.SetVariable('pdate1', dDateBegin);
    odsCntCity.SetVariable('pdate2', dDateEnd);
    odsCntCity.SetVariable('pfk_taxiid', rowTaxi.Properties.Value);
    odsCntCity.Open;
    sCntCity_4Rep := IntToStr(odsCntCity.FieldByName('cnt').AsInteger);
// -- по межгороду
    odsCntMG.Close;
    odsCntMG.SetVariable('pdate1', dDateBegin);
    odsCntMG.SetVariable('pdate2', dDateEnd);
    odsCntMG.SetVariable('pfk_taxiid', rowTaxi.Properties.Value);
    odsCntMG.Open;
    sCntMG_4Rep := IntToStr(odsCntMG.FieldByName('cnt').AsInteger);
// -- свободные
    odsCntFree.Close;
    odsCntFree.SetVariable('pdate1', dDateBegin);
    odsCntFree.SetVariable('pdate2', dDateEnd);
    odsCntFree.SetVariable('pfk_taxiid', rowTaxi.Properties.Value);
    odsCntFree.Open;
    sCntFree_4Rep := IntToStr(odsCntFree.FieldByName('cnt').AsInteger);
// -- общее
    odsCntZakaz.Close;
    odsCntZakaz.SetVariable('pdate1', dDateBegin);
    odsCntZakaz.SetVariable('pdate2', dDateEnd);
    odsCntZakaz.SetVariable('pfk_taxiid', rowTaxi.Properties.Value);
    odsCntZakaz.Open;
    sCntZakaz_4Rep := IntToStr(odsCntZakaz.FieldByName('cnt').AsInteger);
    cxLabel2.Caption := 'Выбрано ' + IntToStr(tvList.DataController.RecordCount) + ' записей. Количество заказов - '+sCntZakaz_4Rep;
    cxLabel2.Refresh;
end;

procedure TfrmSvodVed.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  Screen.Cursor := crHourGlass;
  try
    tvList.BeginUpdate;
    tvList.DataController.RecordCount := tvList.DataController.RecordCount + 1;
    with tvList.DataController do
      begin
        Values[tvList.DataController.RecordCount - 1, tvListKod.Index] := Sender.Field('fc_name');
        Values[tvList.DataController.RecordCount - 1, tvListSotr.Index] := Sender.Field('fc_fio');
        Values[tvList.DataController.RecordCount - 1, tvListSumAll.Index] := Sender.Field('sumall');
        Values[tvList.DataController.RecordCount - 1, tvListSumAllPer.Index] := Sender.Field('sumall_per');
        Values[tvList.DataController.RecordCount - 1, tvListSumMG.Index] := Sender.Field('summg');
        Values[tvList.DataController.RecordCount - 1, tvListSumMGPer.Index] := Sender.Field('summg_per');
        Values[tvList.DataController.RecordCount - 1, tvListSumFree.Index] := Sender.Field('sumfree');
        Values[tvList.DataController.RecordCount - 1, tvListSumFreePer.Index] := Sender.Field('sumfree_per');
        Values[tvList.DataController.RecordCount - 1, tvListSumPen.Index] := Sender.Field('sumPenalty');
        Values[tvList.DataController.RecordCount - 1, tvListSumPenPer.Index] := Sender.Field('sumPenalty_per');
        Values[tvList.DataController.RecordCount - 1, tvListSumPer.Index] := Sender.Field('sum_per');
        Values[tvList.DataController.RecordCount - 1, tvListDrvID.Index] := Sender.Field('fk_drvid');

        dxMemData1.Insert;
        dxMemData1.FieldByName('kod').AsInteger := Sender.Field('fc_name');
        dxMemData1.FieldByName('name').AsString := Sender.Field('fc_fio');
        dxMemData1.FieldByName('sumall').AsFloat := Sender.Field('sumall');
        dxMemData1.FieldByName('sumallper').AsFloat := Sender.Field('sumall_per');
        dxMemData1.FieldByName('summg').AsFloat := Sender.Field('summg');
        dxMemData1.FieldByName('summgper').AsFloat := Sender.Field('summg_per');
        dxMemData1.FieldByName('sumfree').AsFloat := Sender.Field('sumfree');
        dxMemData1.FieldByName('sumfreeper').AsFloat := Sender.Field('sumfree_per');
        dxMemData1.FieldByName('sumPenalty').AsFloat := Sender.Field('sumPenalty');
        dxMemData1.FieldByName('sumPenaltyPer').AsFloat := Sender.Field('sumPenalty_per');
        dxMemData1.FieldByName('sumper').AsFloat := Sender.Field('sum_per');
        dxMemData1.FieldByName('DrvID').AsInteger := Sender.Field('fk_drvid');
        dxMemData1.Post;
        dxMemData1.Next;
      end;
    tvList.EndUpdate;
    cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
    cxLabel1.Refresh;
    cxLabel2.Caption := 'Выбрано ' + IntToStr(tvList.DataController.RecordCount) + ' записей. ';
    cxLabel2.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSvodVed.rowTaxiEditPropertiesChange(Sender: TObject);
var ods : TOracleDataSet;
begin
  if rowTaxi.Properties.Value = -1 then
    begin
      aRefresh.Enabled := False;
      catPer.Visible := False;
      rowAll.Visible := False;
      rowFree.Visible := False;
      rowMG.Visible := False;
    end else
    begin
      aRefresh.Enabled := True;
      catPer.Visible := True;
      rowAll.Visible := True;
      rowFree.Visible := True;
      rowMG.Visible := True;
      ods := TOracleDataSet.Create(nil);
      try
        ods.Session := frmMain.os;
        ods.Cursor := crSQLWait;
        ods.SQL.Text := ' select fn_free, fn_mg, fn_all from taxi.ts_taxi where fk_id = :pfk_id ';
        ods.DeclareAndSet('pfk_id', otInteger, rowTaxi.Properties.Value);
        ods.Open;
        rowAll.Properties.Value := ods.FieldByName('fn_all').AsInteger;
        rowFree.Properties.Value := ods.FieldByName('fn_free').AsInteger;
        rowMG.Properties.Value := ods.FieldByName('fn_mg').AsInteger;
      finally
        ods.Free;
      end;
    end;
end;

end.
