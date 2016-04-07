unit fVedSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinsdxBarPainter, dxSkinCaramel,
  dxSkinOffice2007Green, cxStyles, cxGraphics, cxEdit, cxCalendar,
  cxDBLookupComboBox, cxButtonEdit, cxDropDownEdit, cxTextEdit,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxLabel,
  dxBar, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxSplitter, cxContainer, JvExControls,
  JvAnimatedImage, JvGIFCtrl, cxVGrid, cxInplaceContainer, ExtCtrls, Menus, DB,
  dxmdaset, ImgList, ActnList, dxBarExtItems, Oracle, OracleData, cxMaskEdit,
  frxClass, frxDBSet, cxGridExportLink, cxTimeEdit;

type
  TfrmVedSotr = class(TForm)
    BM: TdxBarManager;
    BMBar1: TdxBar;
    bbRefresh: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    bbPrint: TdxBarLargeButton;
    al: TActionList;
    aRefresh: TAction;
    aClose: TAction;
    aXLS: TAction;
    aPrint: TAction;
    ilSmall: TcxImageList;
    sdPopUp: TSaveDialog;
    dxMemData1: TdxMemData;
    pmVIEW: TPopupMenu;
    N1: TMenuItem;
    Excel1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    paLeft: TPanel;
    vGrParam: TcxVerticalGrid;
    catMain: TcxCategoryRow;
    rowDate1: TcxEditorRow;
    rowDate2: TcxEditorRow;
    rowTaxi: TcxEditorRow;
    rowNumDrv: TcxEditorRow;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxSplitter2: TcxSplitter;
    cxSplitter1: TcxSplitter;
    paClient: TPanel;
    grList: TcxGrid;
    tvList: TcxGridTableView;
    tvListDate: TcxGridColumn;
    tvListSumAll: TcxGridColumn;
    tvListSumMG: TcxGridColumn;
    tvListSumFree: TcxGridColumn;
    grListLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    dsTaxi: TDataSource;
    odsTaxi: TOracleDataSet;
    catDop: TcxCategoryRow;
    rowAll: TcxEditorRow;
    rowFree: TcxEditorRow;
    rowMG: TcxEditorRow;
    oqThread: TOracleQuery;
    dxMemData1fd_date: TDateField;
    dxMemData1SumAll: TFloatField;
    dxMemData1SumMG: TFloatField;
    dxMemData1SumFree: TFloatField;
    frxRep: TfrxReport;
    frxDB: TfrxDBDataset;
    bbInfo: TdxBarLargeButton;
    aInfo: TAction;
    dxMemData1id: TIntegerField;
    tvListID: TcxGridColumn;
    rowStatus: TcxEditorRow;
    dxMemData1fn_sos: TIntegerField;
    tvListSos: TcxGridColumn;
    rowTime1: TcxEditorRow;
    rowTime2: TcxEditorRow;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure rowTaxiEditPropertiesChange(Sender: TObject);
    procedure rowNumDrvEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure aRefreshExecute(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure aCloseExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
    procedure aXLSExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    dDateBegin, dDateEnd : TDateTime;
    bbr : Boolean;
    StartTime: TTime;
    sDateSys_4Rep : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVedSotr: TfrmVedSotr;

implementation
uses fMain, fSetNumDrv, fInfo;
{$R *.dfm}

procedure TfrmVedSotr.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmVedSotr.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmInfo, frmInfo);
  try
    frmInfo.DoShowForm(tvList.DataController.Values[tvList.DataController.FocusedRecordIndex, tvListID.Index]);
    frmInfo.ShowModal;
  finally
    frmInfo.Free;
  end;
end;

procedure TfrmVedSotr.aPrintExecute(Sender: TObject);
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

procedure TfrmVedSotr.aRefreshExecute(Sender: TObject);
begin
  vGrParam.SetFocus;

  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  aXLS.Enabled := False;
  aInfo.Enabled := False;

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
  oqThread.SetVariable('pfk_drvid', rowNumDrv.Tag);
  oqThread.Execute;
end;

procedure TfrmVedSotr.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grList, True, True);
end;

procedure TfrmVedSotr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fVedSotrGr', True, [], 'tvList');
  oqThread.BreakThread;
  Action := caFree;
end;

procedure TfrmVedSotr.FormCreate(Sender: TObject);
begin
  Self.WindowState := wsMaximized;
  rowDate1.Properties.Value := Date;
  rowDate2.Properties.Value := Date;
  if odsTaxi.Active = False then
    odsTaxi.Active := True;
  rowStatus.Properties.Value := 'Все';

  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fVedSotrGr_Default', True, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fVedSotrGr', False, False, [], 'tvList');
end;

procedure TfrmVedSotr.FormDestroy(Sender: TObject);
begin
  frmVedSotr := nil;
end;

procedure TfrmVedSotr.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'SOTR' then Value := rowNumDrv.Properties.Value;
  if VarName = 'SUMALL' then Value := tvList.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'SUMMG' then Value := tvList.DataController.Summary.FooterSummaryValues[1];
  if VarName = 'SUMFREE' then Value := tvList.DataController.Summary.FooterSummaryValues[2];
  if VarName = 'DATE1' then Value := FormatDateTime('dd.mm.yyyy hh:mm', dDateBegin);
  if VarName = 'DATE2' then Value := FormatDateTime('dd.mm.yyyy hh:mm', dDateEnd);
  if VarName = 'CNT_Z' then Value := oqThread.RowCount;
end;

procedure TfrmVedSotr.N3Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fVedSotrGr_Default', False, False, [], 'tvList');
end;

procedure TfrmVedSotr.oqThreadThreadError(Sender: TOracleQuery;
  ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmVedSotr.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread.RowCount > 0;
  aXLS.Enabled := oqThread.RowCount > 0;
  aInfo.Enabled := oqThread.RowCount > 0;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
  tvList.DataController.GotoFirst;  
end;

procedure TfrmVedSotr.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  tvList.BeginUpdate;
  tvList.DataController.RecordCount := tvList.DataController.RecordCount + 1;
  with tvList.DataController do
  begin
    try
      Values[tvList.DataController.RecordCount - 1, tvListDate.Index] := Sender.Field('fd_datein');
      Values[tvList.DataController.RecordCount - 1, tvListSumAll.Index] := Sender.Field('sumall');
      Values[tvList.DataController.RecordCount - 1, tvListSumMG.Index] := Sender.Field('summg');
      Values[tvList.DataController.RecordCount - 1, tvListSumFree.Index] := Sender.Field('sumfree');
      Values[tvList.DataController.RecordCount - 1, tvListID.Index] := Sender.Field('fk_id');
      Values[tvList.DataController.RecordCount - 1, tvListSos.Index] := Sender.Field('fn_sos');

      dxMemData1.Insert;
      dxMemData1.FieldByName('fd_date').AsDateTime := Sender.Field('fd_datein');
      dxMemData1.FieldByName('sumall').AsFloat := Sender.Field('sumall');
      dxMemData1.FieldByName('summg').AsFloat := Sender.Field('summg');
      dxMemData1.FieldByName('sumfree').AsFloat := Sender.Field('sumfree');
      dxMemData1.FieldByName('id').AsInteger := Sender.Field('fk_id');
      dxMemData1.FieldByName('fn_sos').AsInteger := Sender.Field('fn_sos');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  tvList.EndUpdate;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(tvList.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
end;

procedure TfrmVedSotr.rowNumDrvEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetNumDrv, frmSetNumDrv);
      try
        frmSetNumDrv.odsDrv.Close;
        frmSetNumDrv.odsDrv.SetVariable('pfk_taxiid', rowTaxi.Properties.Value);
        frmSetNumDrv.odsDrv.Open;
        frmSetNumDrv.ShowModal;
        if frmSetNumDrv.ModalResult = mrOk then
          begin
            rowNumDrv.Tag := frmSetNumDrv.odsDrv.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrParam.InplaceEditor).EditingText := frmSetNumDrv.odsDrv.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            aRefresh.Enabled := True;
          end;
      finally
        frmSetNumDrv.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowNumDrv.Tag := -1;
      TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGrParam.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      aRefresh.Enabled := False;
    end;
end;

procedure TfrmVedSotr.rowTaxiEditPropertiesChange(Sender: TObject);
//var ods : TOracleDataSet;
begin
  if rowTaxi.Properties.Value = -1 then
    begin
//      catPer.Visible := False;
//      rowAll.Visible := False;
//      rowFree.Visible := False;
//      rowMG.Visible := False;
      rowNumDrv.Visible := False;
    end else
    begin
//      catPer.Visible := True;
//      rowAll.Visible := True;
//      rowFree.Visible := True;
//      rowMG.Visible := True;
      rowNumDrv.Visible := True;
//      ods := TOracleDataSet.Create(nil);
//      try
//        ods.Session := frmMain.os;
//        ods.Cursor := crSQLWait;
//        ods.SQL.Text := ' select fn_free, fn_mg, fn_all from taxi.ts_taxi where fk_id = :pfk_id ';
//        ods.DeclareAndSet('pfk_id', otInteger, rowTaxi.Properties.Value);
//        ods.Open;
//        rowAll.Properties.Value := ods.FieldByName('fn_all').AsInteger;
//        rowFree.Properties.Value := ods.FieldByName('fn_free').AsInteger;
//        rowMG.Properties.Value := ods.FieldByName('fn_mg').AsInteger;
//      finally
//        ods.Free;
//      end;
    end;
end;

procedure TfrmVedSotr.tvListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  aInfoExecute(nil);
end;

procedure TfrmVedSotr.tvListCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Values[tvListSos.Index] = 4 then // неоплата - красный
    ACanvas.Brush.Color := RGB(255, 174, 174);
end;

end.
