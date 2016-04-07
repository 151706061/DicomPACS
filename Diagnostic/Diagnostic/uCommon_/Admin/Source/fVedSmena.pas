unit fVedSmena;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxCalendar, cxDBLookupComboBox,
  cxMaskEdit, cxDropDownEdit, dxSkinsCore, dxSkinCaramel, dxSkinOffice2007Green,
  cxSplitter, cxContainer, cxLabel, JvExControls, JvAnimatedImage, JvGIFCtrl,
  cxVGrid, cxControls, cxInplaceContainer, ExtCtrls, dxSkinsdxBarPainter,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, dxBar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, Menus, DB, dxmdaset, ImgList, Oracle, ActnList,
  dxBarExtItems, OracleData, cxGridExportLink, DateUtils, frxClass, frxDBSet;

type
  TfrmVedSmena = class(TForm)
    paLeft: TPanel;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxSplitter2: TcxSplitter;
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
    oqThread: TOracleQuery;
    ilSmall: TcxImageList;
    sdPopUp: TSaveDialog;
    dxMemData1: TdxMemData;
    pmVIEW: TPopupMenu;
    N1: TMenuItem;
    Excel1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    paClient: TPanel;
    grList: TcxGrid;
    tvList: TcxGridTableView;
    grListLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    cxSplitter1: TcxSplitter;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    vGrParam: TcxVerticalGrid;
    catMain: TcxCategoryRow;
    rowDate: TcxEditorRow;
    rowSotr: TcxEditorRow;
    rowSmena: TcxEditorRow;
    colName: TcxGridColumn;
    colKolvo: TcxGridColumn;
    colSum: TcxGridColumn;
    dxMemData1name: TStringField;
    dxMemData1kolvo: TIntegerField;
    dxMemData1sum: TFloatField;
    paGrid: TPanel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    lbKolvoAll: TcxLabel;
    lbKolvoFree: TcxLabel;
    cxLabel6: TcxLabel;
    lbSumAll: TcxLabel;
    cxLabel8: TcxLabel;
    lbSumFree: TcxLabel;
    odsCntAll: TOracleDataSet;
    odsCntFree: TOracleDataSet;
    frxRep: TfrxReport;
    frxDB: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure rowTaxiEditPropertiesChange(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure rowSotrEditPropertiesChange(Sender: TObject);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure N3Click(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure frxRepGetValue(const VarName: string; var Value: Variant);
  private
    pDate1, pDate2 : TDateTime;
    bbr : Boolean;
    StartTime: TTime;
    sDateSys_4Rep : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVedSmena: TfrmVedSmena;

implementation
uses fMain;
{$R *.dfm}

procedure TfrmVedSmena.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmVedSmena.aPrintExecute(Sender: TObject);
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

procedure TfrmVedSmena.aRefreshExecute(Sender: TObject);
begin
  vGrParam.SetFocus;

  if rowSmena.Properties.Value = 'День' then
    begin
      pDate1 := StrToDateTime(DateTimeToStr(rowDate.Properties.Value)+' 07:30'); // полчаса запаса
      pDate2 := StrToDateTime(DateTimeToStr(rowDate.Properties.Value)+' 20:30')
    end else
    begin
      pDate1 := StrToDateTime(DateTimeToStr(IncDay(rowDate.Properties.Value, -1))+' 19:30');
      pDate2 := StrToDateTime(DateTimeToStr(rowDate.Properties.Value)+' 08:30');
    end;

  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  aXLS.Enabled := False;

  if tvList.DataController.LockCount = 0 then
    tvList.BeginUpdate;
  tvList.DataController.RecordCount := 0;
  while tvList.DataController.LockCount > 0 do
    tvList.EndUpdate;
  dxMemData1.Close;
  dxMemData1.Open;

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
  oqThread.SetVariable('pdate1', pDate1);
  oqThread.SetVariable('pdate2', pDate2);
  oqThread.SetVariable('psotrid', rowSotr.Properties.Value);
  oqThread.Execute;
end;

procedure TfrmVedSmena.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grList, True, True);
end;

procedure TfrmVedSmena.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fVedSmenaGr', True, [], 'tvList');
  oqThread.BreakThread;
  Action := caFree;
end;

procedure TfrmVedSmena.FormCreate(Sender: TObject);
begin
  Self.WindowState := wsMaximized;
  rowDate.Properties.Value := Date;
  rowSmena.Properties.Value := 'День';
  if odsSotr.Active = False then
    odsSotr.Active := True;

  tvList.StoreToRegistry('\SoftWare\TaxiService\Admin\fVedSmenaGr_Default', True, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fVedSmenaGr', False, False, [], 'tvList');
end;

procedure TfrmVedSmena.FormDestroy(Sender: TObject);
begin
  frmVedSmena := nil;
end;

procedure TfrmVedSmena.frxRepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'SOTR' then Value := odsSotr.FieldByName('fio').AsString;
  if rowSmena.Properties.Value = 'День'  then
    begin
      if VarName = 'DATE1' then Value := DateTimeToStr(trunc(pDate1))+' 7:30';
      if VarName = 'DATE2' then Value := DateTimeToStr(trunc(pDate2))+' 20:30';
    end else
    begin
      if VarName = 'DATE1' then Value := DateTimeToStr(trunc(pDate1))+' 18:30';
      if VarName = 'DATE2' then Value := DateTimeToStr(trunc(pDate2))+' 8:30';
    end;
  if VarName = 'KOLVO_PLACE' then Value := tvList.DataController.Summary.FooterSummaryValues[0];;
  if VarName = 'KOLVO_ALL' then Value := lbKolvoAll.Caption;
  if VarName = 'KOLVO_FREE' then Value := lbKolvoFree.Caption;
  if VarName = 'SUM_PLACE' then Value := tvList.DataController.Summary.FooterSummaryValues[1];
  if VarName = 'SUM_ALL' then Value := lbSumAll.Caption;
  if VarName = 'SUM_FREE' then Value := lbSumFree.Caption;
end;

procedure TfrmVedSmena.N3Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\TaxiService\Admin\fVedSmenaGr_Default', False, False, [], 'tvList');
end;

procedure TfrmVedSmena.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer; const ErrorMessage: string);
begin
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmVedSmena.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  aRefresh.Enabled := True;
  aPrint.Enabled := True;
  aXLS.Enabled := oqThread.RowCount > 0;
  Animator1.Animate := False;
  if bbr then
    begin
      cxLabel3.Caption := 'При выполнении запроса произошла ошибка!';
    end else
    begin
      cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
    end;
  if dxMemData1.RecordCount = 0 then
    begin
      tvList.BeginUpdate;
      tvList.DataController.RecordCount := tvList.DataController.RecordCount + 1;
      with tvList.DataController do
        begin
          Values[tvList.DataController.RecordCount - 1, colName.Index] := 'Нет заказов';
          Values[tvList.DataController.RecordCount - 1, colKolvo.Index] := 0;
          Values[tvList.DataController.RecordCount - 1, colSum.Index] := 0;

          dxMemData1.Insert;
          dxMemData1.FieldByName('name').AsString := 'Нет заказов';
          dxMemData1.FieldByName('kolvo').AsInteger := 0;
          dxMemData1.FieldByName('sum').AsFloat := 0;
          dxMemData1.Post;
          dxMemData1.Next;
        end;
    tvList.EndUpdate;
    end;   
// -- вычисляем количество и сумму заказов
    odsCntAll.Close;
    odsCntAll.SetVariable('pdate1', pDate1);
    odsCntAll.SetVariable('pdate2', pDate2);
    odsCntAll.SetVariable('psotrid', rowSotr.Properties.Value);
    odsCntAll.Open;
    lbKolvoAll.Caption := IntToStr(odsCntAll.FieldByName('kolvo').AsInteger);
    lbSumAll.Caption := IntToStr(odsCntAll.FieldByName('sum_ras').AsInteger);
// -- свободные
    odsCntFree.Close;
    odsCntFree.SetVariable('pdate1', pDate1);
    odsCntFree.SetVariable('pdate2', pDate2);
    odsCntFree.SetVariable('psotrid', rowSotr.Properties.Value);
    odsCntFree.Open;
    lbKolvoFree.Caption := IntToStr(odsCntFree.FieldByName('kolvo').AsInteger);
    lbSumFree.Caption := IntToStr(odsCntFree.FieldByName('sum_ras').AsInteger);
end;

procedure TfrmVedSmena.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  Screen.Cursor := crHourGlass;
  try
    tvList.BeginUpdate;
    tvList.DataController.RecordCount := tvList.DataController.RecordCount + 1;
    with tvList.DataController do
      begin
        Values[tvList.DataController.RecordCount - 1, colName.Index] := Sender.Field('fc_name');
        Values[tvList.DataController.RecordCount - 1, colKolvo.Index] := Sender.Field('kolvo');
        Values[tvList.DataController.RecordCount - 1, colSum.Index] := Sender.Field('sum_ras');

        dxMemData1.Insert;
        dxMemData1.FieldByName('name').AsString := Sender.Field('fc_name');
        dxMemData1.FieldByName('kolvo').AsInteger := Sender.Field('kolvo');
        dxMemData1.FieldByName('sum').AsFloat := Sender.Field('sum_ras');
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

procedure TfrmVedSmena.rowSotrEditPropertiesChange(Sender: TObject);
begin
  if rowSotr.Properties.Value = -1 then
    begin
      aRefresh.Enabled := False;
    end else
    begin
      aRefresh.Enabled := True; 
    end;
end;

procedure TfrmVedSmena.rowTaxiEditPropertiesChange(Sender: TObject);
begin
  if rowSotr.Properties.Value = -1 then
    begin
      aRefresh.Enabled := False;
    end else
    begin
      aRefresh.Enabled := True;
    end;
end;

end.
