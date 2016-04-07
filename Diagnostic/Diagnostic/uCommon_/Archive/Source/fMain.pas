unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, dxSkinsCore, dxSkinCaramel,
  dxSkinsdxBarPainter, dxBar, cxSplitter, cxControls, cxInplaceContainer,
  cxVGrid, ExtCtrls, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxBarExtItems, ActnList, cxContainer, cxLabel, JvExControls, JvAnimatedImage,
  JvGIFCtrl, Oracle, JclFileUtils, cxCalendar, cxDBLookupComboBox, cxButtonEdit,
  ImgList, OracleData, dxmdaset, cxTextEdit, Menus, cxGridExportLink,
  cxDropDownEdit, dxSkinOffice2007Green, cxCheckBox, frxClass, frxDBSet,
  cxTimeEdit, cxSpinEdit;

type
  TfrmMain = class(TForm)
    cxSplitter1: TcxSplitter;
    BM: TdxBarManager;
    paLeft: TPanel;
    vGrParam: TcxVerticalGrid;
    paClient: TPanel;
    grList: TcxGrid;
    grListLevel1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbRefresh: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    al: TActionList;
    aRefresh: TAction;
    aClose: TAction;
    paSubParam: TPanel;
    Animator1: TJvGIFAnimator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxSplitter2: TcxSplitter;
    os: TOracleSession;
    oqThread: TOracleQuery;
    catMain: TcxCategoryRow;
    rowDate1: TcxEditorRow;
    rowDate2: TcxEditorRow;
    rowTaxi: TcxEditorRow;
    rowDisp: TcxEditorRow;
    ilSmall: TcxImageList;
    dsTaxi: TDataSource;
    odsTaxi: TOracleDataSet;
    dxMemData1: TdxMemData;
    dxMemData1fk_id: TIntegerField;
    dxMemData1fc_phone: TStringField;
    dxMemData1fc_adr1: TStringField;
    dxMemData1fc_adr2: TStringField;
    tvList: TcxGridTableView;
    tvListDatein: TcxGridColumn;
    tvListPhone: TcxGridColumn;
    tvListAdr1: TcxGridColumn;
    tvListAdr2: TcxGridColumn;
    tvListNumDrv: TcxGridColumn;
    tvListCar: TcxGridColumn;
    tvListFics: TcxGridColumn;
    tvListSum: TcxGridColumn;
    dxMemData1numdrv: TStringField;
    dxMemData1car: TStringField;
    dxMemData1fics: TStringField;
    pmVIEW: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    aXLS: TAction;
    aPrint: TAction;
    Excel1: TMenuItem;
    N2: TMenuItem;
    bbPrint: TdxBarLargeButton;
    sdPopUp: TSaveDialog;
    rowStatus: TcxEditorRow;
    vGrParamCategoryRow1: TcxCategoryRow;
    rowNumDrv: TcxEditorRow;
    rowAuto: TcxEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    stNormal: TcxStyle;
    stBold: TcxStyle;
    cxStyle1: TcxStyle;
    rowFree: TcxEditorRow;
    dxMemData1fc_sos: TStringField;
    tvListSos: TcxGridColumn;
    rowPeregon: TcxEditorRow;
    rowBaggage: TcxEditorRow;
    rowStop: TcxEditorRow;
    rowPlaces: TcxEditorRow;
    rList: TfrxReport;
    rDBList: TfrxDBDataset;
    dxMemData1sum: TFloatField;
    rowMG: TcxEditorRow;
    rowTime1: TcxEditorRow;
    rowTime2: TcxEditorRow;
    dxMemData1fd_datein: TDateTimeField;
    bbInfo: TdxBarLargeButton;
    aInfo: TAction;
    tvListID: TcxGridColumn;
    rowTimeSetDrv: TcxEditorRow;
    rowTimeDrv: TcxEditorRow;
    tvListSotr: TcxGridColumn;
    dxMemData1fiosotr: TStringField;
    dxMemData1fn_summg: TFloatField;
    tvListSumMG: TcxGridColumn;
    procedure aCloseExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure oqThreadThreadRecord(Sender: TOracleQuery);
    procedure oqThreadThreadFinished(Sender: TOracleQuery);
    procedure oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer;
      const ErrorMessage: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rowDispEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N3Click(Sender: TObject);
    procedure aXLSExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure rowNumDrvEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure vGrParamClick(Sender: TObject);
    procedure vGrParamEnter(Sender: TObject);
    procedure rowStatusEditPropertiesChange(Sender: TObject);
    procedure rListGetValue(const VarName: string; var Value: Variant);
    procedure aInfoExecute(Sender: TObject);
  private
    bbr : Boolean;
    pMG : Integer; // Идентификатор "Межгород"
    StartTime: TTime;
    FileVersion : string;
    dDateBegin, dDateEnd : TDateTime;
    sDateSys_4Rep, sParams_4Rep : string;
    nRec : Integer;
    procedure DoParams;
    { Private declarations }
  public
    Russian : HKL;
    procedure DoShowForm;
    { Public declarations }
  end;

const
  sqlList = ' select t1.fk_id, '+#13+
            '        t1.fd_datein, '+#13+
            '        t5.fc_fam||'' ''||substr(t5.fc_name, 1, 1)||''.''||substr(t5.fc_otch, 1, 1)||''.'' as fiosotr, '+#13+
            '        taxi.get_phone_without_kodtown(decode(substr(t1.fc_phone, 1, 1), ''-'', '''', decode(t1.fc_phone, null, '''', t1.fc_phone))) as fc_phone, '+#13+
            '        fc_adr1, '+#13+
            '        t1.fc_adr2||'' ''|| '+#13+
            '        decode(decode(to_char(t1.fn_km1), 0, '''', to_char(t1.fn_km1))||decode(to_char(t1.fn_km2), 0, '''', ''/''||to_char(t1.fn_km2)), '+#13+
            '        '''', '+#13+
            '        decode(to_char(t1.fn_km1), 0, '''', to_char(t1.fn_km1))||decode(to_char(t1.fn_km2), 0, '''', ''/''||to_char(t1.fn_km2)), '+#13+
            '        decode(to_char(t1.fn_km1), 0, '''', to_char(t1.fn_km1))||decode(to_char(t1.fn_km2), 0, '''', ''/''||to_char(t1.fn_km2))||'' км'') as fc_adr2, '+#13+
            '        to_char(decode(fn_sos2, 0, (select fd_date from taxi.tpred where fk_jurid = t1.fk_id), t1.fd_datef), ''hh24:mi'') as fd_datef_str, '+#13+
            '        round(decode(t1.fn_sumf, null, t1.fn_sumr+t1.fn_sumfmg, 0, t1.fn_sumr+t1.fn_sumfmg, t1.fn_sumf+t1.fn_sumfmg)) as sum_ras, '+#13+
            '        decode(t1.fn_sumfmg, 0, t1.fn_summg, t1.fn_sumfmg) as fn_summg, '+#13+
            '        nvl(decode(t1.fl_bagage_real, '+#13+
            '                   0, t4.fc_name||decode(fk_drvid2, 0, null, '', ''||(select fc_name from taxi.ts_drivers where fk_id = fk_drvid2)), '+#13+
            '                   1, t4.fc_name||decode(fk_drvid2, 0, null, '', ''||(select fc_name from taxi.ts_drivers where fk_id = fk_drvid2))||'' (Б)''), '' '') as numdrv, '+#13+
            '        decode(t4.fc_name, null, '''', t4.fc_auto|| '+#13+
            '        decode(fk_drvid2, 0, null, '', ''||(select fc_auto from taxi.ts_drivers where fk_id = fk_drvid2))) as namedrv, '+#13+
            '        decode(fn_sos, 1, ''Закрыт'', 2, ''Пропущен'', 3, ''Отменен'', 4, ''Неоплата'', 5, ''Невыход'', 6, ''За подачу'', '+#13+
            '                       7, ''Предварительный'', 8, ''Обрабатывается'', 9, ''Новый'') as fc_sos '+#13+
            '   from taxi.tjournal t1, taxi.ts_drivers t4, taxi.ts_sotr t5 '+#13+
            '  where fd_datein >= :pdate1 '+#13+
            '    and fd_datein <= :pdate2 '+#13+
            '    and t1.fk_drvid = t4.fk_id(+) '+#13+
            '    and t1.fk_sotrid = t5.fk_id ';

var
  frmMain: TfrmMain;

implementation

uses fSetDisp, fSetNumDrv, fInfo;

{$R *.dfm}

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmInfo, frmInfo);
  try
    frmInfo.DoShowForm(tvList.DataController.Values[tvList.DataController.FocusedRecordIndex, tvListID.Index]);
    frmInfo.ShowModal;
  finally
    frmInfo.Free;
  end;
end;

procedure TfrmMain.aPrintExecute(Sender: TObject);
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' select to_char(sysdate, ''dd.mm.yyyy hh24:mi'') as datesys from dual ';
    ods.Open;
    sDateSys_4Rep := ods.FieldByName('datesys').AsString;
  finally
    ods.Free;
  end;
  sParams_4Rep := '';
  sParams_4Rep := 'Статус: '+rowStatus.Properties.Value+'; ';
  if (rowFree.Properties.Value <> 0) and (rowFree.Properties.Value <> null) then
    begin
      sParams_4Rep := sParams_4Rep + 'Свободные; ';
    end;
  if rowTaxi.Properties.Value <> -1 then
    begin
      sParams_4Rep := sParams_4Rep + 'Такси: ' + odsTaxi.FieldByName('fc_name').AsString + '; ';
    end;
  if rowDisp.Tag <> -1 then
    begin
      sParams_4Rep := sParams_4Rep + 'Диспетчер: ' + rowDisp.Properties.Value+'; ';
    end;
  if rowNumDrv.Tag <> -1 then
    begin
      sParams_4Rep := sParams_4Rep + 'Позывной: ' + rowNumDrv.Properties.Value+'; ';
    end;
  if rowNumDrv.Tag <> -1 then
    begin
      sParams_4Rep := sParams_4Rep + 'Позывной: ' + rowNumDrv.Properties.Value+'; ';
    end;
  if rowAuto.Properties.Value <> null then
    begin
      sParams_4Rep := sParams_4Rep + 'Машина(произвольно): ' + rowAuto.Properties.Value+'; ';
    end;
  if (rowPeregon.Properties.Value <> 0) and (rowPeregon.Properties.Value <> null) then
    begin
      sParams_4Rep := sParams_4Rep + 'Перегон; ';
    end;
  if (rowBaggage.Properties.Value <> 0) and (rowBaggage.Properties.Value <> null) then
    begin
      sParams_4Rep := sParams_4Rep + 'Багаж; ';
    end;
  if (rowStop.Properties.Value <> 0) and (rowStop.Properties.Value <> null) then
    begin
      sParams_4Rep := sParams_4Rep + 'Остановки; ';
    end;
  if (rowPlaces.Properties.Value <> 0) and (rowPlaces.Properties.Value <> null) then
    begin
      sParams_4Rep := sParams_4Rep + 'Платные стоянки; ';
    end;
  if (rowMG.Properties.Value <> 0) and (rowMG.Properties.Value <> null) then
    begin
      sParams_4Rep := sParams_4Rep + 'Межгород; ';
    end;
  rList.ShowReport;
end;

procedure TfrmMain.aRefreshExecute(Sender: TObject);
begin
  grList.SetFocus;

  aRefresh.Enabled := False;
  aPrint.Enabled := False;
  aInfo.Enabled := False;
  aXLS.Enabled := False;

  if tvList.DataController.LockCount = 0 then
    tvList.BeginUpdate;
  tvList.DataController.RecordCount := 0;
  while tvList.DataController.LockCount > 0 do
    tvList.EndUpdate;
  dxMemData1.Close;
  dxMemData1.Open;
  oqThread.Scrollable := True;
  oqThread.DeleteVariables;
  oqThread.SQL.Text := sqlList;
  
// -- Даты
  if (rowTime1.Properties.Value = null) or (rowTime1.Properties.Value = '00:00') or (rowTime1.Properties.Value = '0') then
    dDateBegin := VarToDateTime(rowDate1.Properties.Value)
  else
    dDateBegin := VarToDateTime(rowDate1.Properties.Value+' '+rowTime1.Properties.Value);
  if (rowTime2.Properties.Value = null) or (rowTime2.Properties.Value = '00:00') or (rowTime2.Properties.Value = '0') then
    dDateEnd := VarToDateTime(rowDate2.Properties.Value+' 23:59:59')
  else
    dDateEnd := VarToDateTime(rowDate2.Properties.Value+' '+rowTime2.Properties.Value);

//-- 1. Такси
  if rowTaxi.Properties.Value <> -1 then
    begin
      oqThread.SQL.Add(' and t1.fk_taxiid = :pfk_taxiid ');
      oqThread.DeclareAndSet('pfk_taxiid', otInteger, rowTaxi.Properties.Value);
    end;
//-- 2. Диспетчер
  if rowDisp.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and t1.fk_sotrid = :pfk_sotrid ');
      oqThread.DeclareAndSet('pfk_sotrid', otInteger, rowDisp.Tag);
    end;
//-- 3. Статус
  if rowStatus.Properties.Value <> 'Все' then
    begin
      if rowStatus.Properties.Value = 'Закрытые' then
        oqThread.SQL.Add(' and t1.fn_sos = 1 ');
      if rowStatus.Properties.Value = 'Закрытые+Оплата за подачу' then
        oqThread.SQL.Add(' and t1.fn_sos in (1, 6) ');
      if rowStatus.Properties.Value = 'Отмененные' then
        oqThread.SQL.Add(' and t1.fn_sos = 3 ');
      if rowStatus.Properties.Value = 'Неоплаченные' then
        oqThread.SQL.Add(' and t1.fn_sos = 4 ');
      if rowStatus.Properties.Value = 'Невыход' then
        oqThread.SQL.Add(' and t1.fn_sos = 5 ');
      if rowStatus.Properties.Value = 'Оплата за подачу' then
        oqThread.SQL.Add(' and t1.fn_sos = 6 ');
    end;
//-- 4. Позывной
  if rowNumDrv.Tag <> -1 then
    begin
      oqThread.SQL.Add(' and ((t1.fk_drvid = :pdrvid) or (t1.fk_drvid2 = :pdrvid)) ');
      oqThread.DeclareAndSet('pdrvid', otInteger, rowNumDrv.Tag);
    end;
//-- 5. Машина (произвольно)
  if rowAuto.Properties.Value <> null then
    begin
      oqThread.SQL.Add(' and lower(t4.fc_auto) like :pfc_auto '); // !!! при lower отключается индекс ???
      oqThread.DeclareAndSet('pfc_auto', otSubst, ''''+'%'+rowAuto.Properties.Value+'%'+'''');
    end;
//-- 6. Свободные
  if rowFree.Properties.Value = 1 then
    begin
      oqThread.SQL.Add(' and t1.fl_free = :pfl_free ');
      oqThread.DeclareAndSet('pfl_free', otInteger, rowFree.Properties.Value);
    end;
//-- 7. Перегон
  if rowPeregon.Properties.Value = 1 then
    begin
      oqThread.SQL.Add(' and t1.fl_peregon = :pfl_peregon ');
      oqThread.DeclareAndSet('pfl_peregon', otInteger, rowPeregon.Properties.Value);
    end;
//-- 8. Багаж
  if rowBaggage.Properties.Value = 1 then
    begin
      oqThread.SQL.Add(' and t1.fl_bagage_real = :pfl_bagage_real ');
      oqThread.DeclareAndSet('pfl_bagage_real', otInteger, rowBaggage.Properties.Value);
    end;
//-- 9. Остановки
  if rowStop.Properties.Value = 1 then
    begin
      oqThread.SQL.Add(' and t1.fl_stop_real = :pfl_stop_real ');
      oqThread.DeclareAndSet('pfl_stop_real', otInteger, rowStop.Properties.Value);
    end;
//-- 10. Стоянки
  if rowPlaces.Properties.Value = 1 then
    begin
      oqThread.SQL.Add(' and t1.fn_stop <> 0 ');
    end;
//-- 11. Межгород
  if rowMG.Properties.Value = 1 then
    begin
      oqThread.SQL.Add(' and t1.fk_adr2id = :pMG ');
      oqThread.DeclareAndSet('pMG', otInteger, pMG);
    end;
//-- 12. Время выбора таксиста больше (мин.)
  if (rowTimeSetDrv.Properties.Value <> null) and (rowTimeSetDrv.Properties.Value <> 0) then
    begin
      oqThread.SQL.Add(' and round((fd_setdrv-fd_datein)*60*24) > :pTimeSetDrv ');
      oqThread.DeclareAndSet('pTimeSetDrv', otInteger, rowTimeSetDrv.Properties.Value);
    end;
//-- 13. Время подачи машины больше (мин.)
  if (rowTimeDrv.Properties.Value <> null) and (rowTimeDrv.Properties.Value <> 0) then
    begin
      oqThread.SQL.Add(' and round((fd_datef-fd_setdrv)*60*24) > :pTimeDrv ');
      oqThread.DeclareAndSet('pTimeDrv', otInteger, rowTimeDrv.Properties.Value);
    end;

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
  oqThread.DeclareAndSet('pdate1', otDate, dDateBegin);
  oqThread.DeclareAndSet('pdate2', otDate, dDateEnd);
  tvList.BeginUpdate;
  nRec := 0;
  oqThread.Execute;
end;

procedure TfrmMain.aXLSExecute(Sender: TObject);
begin
  sdPopUp.DefaultExt := 'xls';
  sdPopUp.Filter := 'Таблицы Excel (*.xls)|*.xls';
  if sdPopUp.Execute then
    ExportGridToExcel(sdPopUp.FileName, grList, TRUE, TRUE);
end;

procedure TfrmMain.DoParams;
var ods : TOracleDataSet;
begin
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := frmMain.os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := 'select * from taxi.tparams ';
    ods.Open;
    ods.First;
    while not ods.Eof do
      begin
//-- Идентификатор межгород
        if ods.FieldByName('fc_key').AsString = 'IDENT_MG' then
          begin
            pMG := StrToInt(copy(ods.FieldByName('fc_value').AsString, 1, Pos(';', ods.FieldByName('fc_value').AsString)-1));
          end;
        ods.Next;
    end;
  finally
    ods.Free;
  end;
end;

procedure TfrmMain.DoShowForm;
begin
  frmMain.Caption := 'Архив-статистика ('+FileVersion+')';
  aXLS.Enabled := False;
  rowStatus.Properties.Value := 'Все';
//-- "заряжаем" датасеты
  if odsTaxi.Active = False then
    odsTaxi.Active := True;
  DoParams;
  rowDisp.Tag := -1;
  rowNumDrv.Tag := -1;
  tvList.StoreToRegistry('\SoftWare\Taxi\Taxi_Archive\fMain\ViewGridDefault', True, [], 'tvList');
  tvList.RestoreFromRegistry('\SoftWare\Taxi\Taxi_Archive\fMain\ViewGrid', False, False, [], 'tvList');
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите закрыть программу ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    begin
      oqThread.BreakThread;
      action := caFree;
    end else
    begin
      action := caNone;
    end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  tvList.StoreToRegistry('\SoftWare\Taxi\Taxi_Archive\fMain\ViewGrid', True, [], 'tvList');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  rowDate1.Properties.Value := Date;
  rowDate2.Properties.Value := Date;
  frmMain.WindowState := wsMaximized;
  russian:=LoadKeyboardLayout('00000419', 0);  
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  tvList.RestoreFromRegistry('\SoftWare\Taxi\Taxi_Archive\fMain\ViewGridDefault', False, False, [], 'tvList');
end;

procedure TfrmMain.oqThreadThreadError(Sender: TOracleQuery; ErrorCode: Integer; const ErrorMessage: string);
begin
  tvList.EndUpdate;
  MessageDlg('Во время выполнения запроса произошла ошибка! Обратитесь к администратору системы!'+
             #13#10+'Код ошибки: '+IntToStr(ErrorCode)+
             #13#10+'Текст ошибки: '+ErrorMessage,
             mtError, [mbOK], 0);
  bbr := True;
end;

procedure TfrmMain.oqThreadThreadFinished(Sender: TOracleQuery);
begin
  tvList.EndUpdate;
  aRefresh.Enabled := True;
  aPrint.Enabled := oqThread.RowCount > 0;
  aInfo.Enabled := oqThread.RowCount > 0; 
  aXLS.Enabled := oqThread.RowCount > 0;
  Animator1.Animate := False;
  if bbr then
    cxLabel3.Caption := 'При выполнении запроса произошла ошибка!'
  else
    cxLabel3.Caption := 'Запрос к Базе Данных выполнился успешно!';
end;

procedure TfrmMain.oqThreadThreadRecord(Sender: TOracleQuery);
begin
  tvList.DataController.RecordCount := tvList.DataController.RecordCount + 1;
  with tvList.DataController do
  begin
    try
      Values[tvList.DataController.RecordCount - 1, tvListDateIn.Index] := Sender.Field('fd_datein');
      Values[tvList.DataController.RecordCount - 1, tvListPhone.Index] := Sender.Field('fc_phone');
      Values[tvList.DataController.RecordCount - 1, tvListAdr1.Index] := Sender.Field('fc_adr1');
      Values[tvList.DataController.RecordCount - 1, tvListAdr2.Index] := Sender.Field('fc_adr2');
      Values[tvList.DataController.RecordCount - 1, tvListNumDrv.Index] := Sender.Field('numdrv');
      Values[tvList.DataController.RecordCount - 1, tvListCar.Index] := Sender.Field('namedrv');
      Values[tvList.DataController.RecordCount - 1, tvListFics.Index] := Sender.Field('fd_datef_str');
      Values[tvList.DataController.RecordCount - 1, tvListSum.Index] := Sender.Field('sum_ras');
      Values[tvList.DataController.RecordCount - 1, tvListSos.Index] := Sender.Field('fc_sos');
      Values[tvList.DataController.RecordCount - 1, tvListID.Index] := Sender.Field('fk_id');
      Values[tvList.DataController.RecordCount - 1, tvListSotr.Index] := Sender.Field('fiosotr');
      Values[tvList.DataController.RecordCount - 1, tvListSumMG.Index] := Sender.Field('fn_summg');

      dxMemData1.Insert;
      dxMemData1.FieldByName('fd_datein').AsDateTime := Sender.Field('fd_datein');
      dxMemData1.FieldByName('fc_phone').AsString := Sender.Field('fc_phone');
      dxMemData1.FieldByName('fc_adr1').AsString := Sender.Field('fc_adr1');
      dxMemData1.FieldByName('fc_adr2').AsString := Sender.Field('fc_adr2');
      dxMemData1.FieldByName('numdrv').AsString := Sender.Field('numdrv');
      dxMemData1.FieldByName('car').AsString := Sender.Field('namedrv');
      dxMemData1.FieldByName('fics').AsString := Sender.Field('fd_datef_str');
      dxMemData1.FieldByName('sum').AsFloat := Sender.Field('sum_ras');
      dxMemData1.FieldByName('fc_sos').AsString := Sender.Field('fc_sos');
      dxMemData1.FieldByName('fiosotr').AsString := Sender.Field('fiosotr');
      dxMemData1.FieldByName('fn_summg').AsFloat := Sender.Field('fn_summg');
      dxMemData1.Post;
      dxMemData1.Next;
    finally
    end;
  end;
  cxLabel1.Caption := FormatDateTime('hh:mm:ss', Now() - StartTime);
  cxLabel1.Refresh;
  cxLabel2.Caption := 'Выбрано ' + IntToStr(tvList.DataController.RecordCount) + ' записей.';
  cxLabel2.Refresh;
  nRec := nRec + 1;
  if nRec > 100 then
    begin
      nRec := 0;
      tvList.EndUpdate;
      tvList.BeginUpdate;
    end;
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  try
    Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
    FileVersion := Ver.FileVersion;
  finally
    Ver.Free;
  end;
end;

procedure TfrmMain.rListGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'DATE1' then Value := FormatDateTime('dd.mm.yyyy hh:mm', dDateBegin);
  if VarName = 'DATE2' then Value := FormatDateTime('dd.mm.yyyy hh:mm', dDateEnd);
  if VarName = 'DATESYS' then Value := sDateSys_4Rep;
  if VarName = 'KOLVO' then Value := tvList.DataController.Summary.FooterSummaryValues[0];
  if VarName = 'PARAMS' then Value := sParams_4Rep;
end;

procedure TfrmMain.rowDispEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetDisp, frmSetDisp);
      try
        frmSetDisp.ShowModal;
        if frmSetDisp.ModalResult = mrOk then
          begin
            rowDisp.Tag := frmSetDisp.odsList.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrParam.InplaceEditor).EditingText := frmSetDisp.odsList.FieldByName('FIO').AsString;
            TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsHideCursor;
          end;
      finally
        frmSetDisp.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      rowDisp.Tag := -1;
      TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGrParam.InplaceEditor).EditingText := ' ';
      TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsHideCursor;
    end;
end;

procedure TfrmMain.rowNumDrvEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetNumDrv, frmSetNumDrv);
      try
        frmSetNumDrv.ShowModal;
        if frmSetNumDrv.ModalResult = mrOk then
          begin
            rowNumDrv.Tag := frmSetNumDrv.odsDrv.FieldByName('fk_id').AsInteger;
            TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrParam.InplaceEditor).EditingText := frmSetNumDrv.odsDrv.FieldByName('fc_name').AsString;
            TcxButtonEdit(vGrParam.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            if rowNumDrv.Tag = -1 then
              begin
                rowNumDrv.Properties.ImageIndex := -1;
                rowNumDrv.Styles.Content := stNormal;
                rowNumDrv.Styles.Header := stNormal;
              end else
              begin
                rowNumDrv.Properties.ImageIndex := 3;
                rowNumDrv.Styles.Content := stBold;
                rowNumDrv.Styles.Header := stBold;
              end;
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
      rowNumDrv.Properties.ImageIndex := -1;
      rowNumDrv.Styles.Content := stNormal;
      rowNumDrv.Styles.Header := stNormal;
    end;
end;

procedure TfrmMain.rowStatusEditPropertiesChange(Sender: TObject);
begin
  if rowStatus.Properties.Value = 'Все' then
    begin
      rowStatus.Properties.ImageIndex := -1;
      rowStatus.Styles.Content := stNormal;
      rowStatus.Styles.Header := stNormal;
    end else
    begin
      rowStatus.Properties.ImageIndex := 3;
      rowStatus.Styles.Content := stBold;
      rowStatus.Styles.Header := stBold;
    end;
end;

procedure TfrmMain.vGrParamClick(Sender: TObject);
begin
    ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

procedure TfrmMain.vGrParamEnter(Sender: TObject);
begin
  ActivateKeyboardLayout(Russian, KLF_REORDER);
end;

end.
