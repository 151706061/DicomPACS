unit fMinSpare;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, ActnList, Db, OracleData, JvFormPlacement, HtmlHlp,
  JvComponentBase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, Grids, DBGrids, cxSpinEdit,
  cxGridBandedTableView, cxGridDBBandedTableView, cxCurrencyEdit, cxCalc,
  FR_Class, frOLEExl, Oracle, FR_DSet, FR_DBSet, ComObj, Excel2000, Variants,
  cxContainer, cxDBLookupComboBox, cxCheckBox;

type
  TfrmMinSpare = class(TForm)
    al: TActionList;
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    acClose: TAction;
    ToolButton1: TToolButton;
    acFilter: TAction;
    sb: TStatusBar;
    ToolButton2: TToolButton;
    odsMinSpare: TOracleDataSet;
    dsMinSpare: TDataSource;
    acSaveToXls: TAction;
    sd: TSaveDialog;
    ToolButton3: TToolButton;
    tbuSaveToXls: TToolButton;
    acRefresh: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    FormStorage: TJvFormStorage;
    acSecret: TAction;
    tbuPrintZakup: TToolButton;
    grMinSpare: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumnNUM: TcxGridDBColumn;
    cxGridDBColumnFC_MEDICNAME: TcxGridDBColumn;
    cxGridDBColumnFC_EDIZM: TcxGridDBColumn;
    cxGridDBColumnFN_AVGRASHMONTH: TcxGridDBColumn;
    cxGridDBColumnFN_RASHPERIOD: TcxGridDBColumn;
    cxGridDBColumnFN_KOLOST: TcxGridDBColumn;
    cxGridDBColumnFN_MONTHLACK: TcxGridDBColumn;
    cxGridDBColumnFN_PERIODLACK: TcxGridDBColumn;
    cxGridDBColumnFN_MINZAPAS: TcxGridDBColumn;
    cxGridDBColumnFN_NEEDTOBUY: TcxGridDBColumn;
    cxGridDBColumnFN_LASTPRICE: TcxGridDBColumn;
    cxGridDBColumnCorrrect: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    frZakup: TfrReport;
    cxGridDBTableViewFN_SUMM: TcxGridDBColumn;
    oqFill_TMEDIC_ZAKUP: TOracleQuery;
    frdsZakup: TfrDBDataSet;
    acPrintZakup: TAction;
    tmrRefreshSumm: TTimer;
    cxGridDBColumnFC_FINSOURCE: TcxGridDBColumn;
    cxGridDBColumnFC_UCHGR: TcxGridDBColumn;
    cxGridDBColumnFC_international_name: TcxGridDBColumn;
    Panel2: TPanel;
    cbEmpMov: TcxCheckBox;
    cxGridDBColumnFC_ATC: TcxGridDBColumn;
    cxGridDBColumnFC_ATC_ROOT: TcxGridDBColumn;
    cxGridDBColumnFC_FARM: TcxGridDBColumn;
    procedure acCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acSaveToXlsExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acSecretExecute(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure frZakupGetValue(const ParName: String;
      var ParValue: Variant);
    procedure acPrintZakupExecute(Sender: TObject);
    procedure tmrRefreshSummTimer(Sender: TObject);
    procedure cxGridDBColumnFN_NEEDTOBUYPropertiesEditValueChanged(
      Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbEmpMovClick(Sender: TObject);
  private
    FMonthCount : Integer;
    ModRes : integer;
    FDate1, FDate2 : TDate;
  public
  end;

var
  frmMinSpare: TfrmMinSpare;

procedure  DoShowMinSpare;

implementation

uses fdmMain, fMainForm, fSelectPeriod, JvDBUtils, cxExport, cxGridExportLink, ShellAPI,
  fdmPrintReports, fdmPrintSelect;

{$R *.DFM}

procedure DoShowMinSpare;
begin
  if not frmMain.RestoreMDI_Window('frmMinSpare') then
  begin
    frmMinSpare := TfrmMinSpare.Create(Application);
    frmMinSpare.FormStyle := fsMDIChild;
  end;
end;


procedure TfrmMinSpare.acCloseExecute(Sender: TObject);
begin
  acRefresh.Execute; // обновляем все записи, постим
  dmMain.os.Commit;  // оставляем последние записи
  Close;
end;

procedure TfrmMinSpare.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.tbMinSpare.ImageIndex := 51;
  Action := caFree;
end;

procedure TfrmMinSpare.acFilterExecute(Sender: TObject);
var frmSelectPeriod: TfrmSelectPeriod;
begin
  frmSelectPeriod := TfrmSelectPeriod.Create(Self);
  try
    frmSelectPeriod.Date1 := FDate1;
    frmSelectPeriod.Date2 := FDate2;
    frmSelectPeriod.isCheckDate := True;     
    ModRes := frmSelectPeriod.ShowModal;
    if ModRes = mrOk then
    begin
//      odsMinSpare.SetVariable('MOID',dmMain.pkgMedSes.GetCurmo);
      FMonthCount := Round((frmSelectPeriod.Date2 - frmSelectPeriod.Date1)/30);
      FDate1 := frmSelectPeriod.Date1;
      FDate2 := frmSelectPeriod.Date2;
      oqFill_TMEDIC_ZAKUP.SetVariable('MO_GROUPID',dmMain.FK_CurMO_GROUP);
      oqFill_TMEDIC_ZAKUP.SetVariable('DATE1',FDate1);
      oqFill_TMEDIC_ZAKUP.SetVariable('DATE2',FDate2);
      oqFill_TMEDIC_ZAKUP.Execute;

      odsMinSpare.SetVariable('MO_GROUPID',dmMain.FK_CurMO_GROUP);
      odsMinSpare.SetVariable('DATE1',FDate1);
      odsMinSpare.SetVariable('DATE2',FDate2);
//      odsMinSpare.Close;
//      odsMinSpare.Open;
      acRefresh.Execute;
    end;
  finally
    frmSelectPeriod.Free;
  end;
end;

procedure TfrmMinSpare.FormShow(Sender: TObject);
//var frmSelectPeriod: TfrmSelectPeriod;
begin
  acFilter.Execute;
  if ModRes <> mrOk then Close;
  // КГ/АМ, нафик писать один и тот же код дважды? открою секрет - можно вызвать функцию. Воронов О.А. 18.12.2007
{  frmSelectPeriod := TfrmSelectPeriod.Create(Self);
  try
    if frmSelectPeriod.ShowModal = mrOk then
    begin
//      odsMinSpare.SetVariable('MOID',dmMain.pkgMedSes.GetCurmo);

      if frmSelectPeriod.rgMinSpare.ItemIndex = 0 then
        FMonthCount := 1
      else
        FMonthCount := (frmSelectPeriod.rgMinSpare.ItemIndex * 3);
        
      odsMinSpare.SetVariable('MO_GROUPID',dmMain.pkgMedSes.GET_CUR_MOGROUP_BY_CUR_MO);
      odsMinSpare.SetVariable('DATE1',frmSelectPeriod.deDate1.Date);
      odsMinSpare.SetVariable('DATE2',frmSelectPeriod.deDate2.Date);
      odsMinSpare.Open;
      sb.Panels[0].Text := Format('Выбранный период: с %s по %s',
        [DateToStr(frmSelectPeriod.deDate1.Date),DateToStr(frmSelectPeriod.deDate2.Date)]);
      sb.Panels[1].Text := Format('Всего записей: %s ',[IntToStr(odsMinSpare.RecordCount)]);
      sb.Panels[2].Text := Format('Сумма: %s ',[cxGridDBTableView1.DataController.Summary.FooterSummaryTexts[0]]);
    end
    else Self.Close;
  finally
    frmSelectPeriod.Free;
  end;}
end;

procedure TfrmMinSpare.acSaveToXlsExecute(Sender: TObject);
var
  Excel: Variant;
  I: Integer;
  pGridWidth,
  v_width, v_amm_vis : Integer;
  v_filename : string;
begin
  if True then   //  sd.Execute     True
  begin
    //Экспортируем грид в xls-файл предварительно отключив раскрасску
    cxGridDBTableView1.Styles.ContentEven := nil;
    cxGridDBTableView1.Styles.ContentOdd := nil;
    //
    sd.FileName := ExtractFilePath(Application.ExeName)+'F'+inttostr(GetTickCount)+'.xls';
    //
    ExportGridToExcel( sd.FileName, grMinSpare );  //  sd.FileName     v_filename
    cxGridDBTableView1.Styles.ContentEven := dmMain.cxStyleGridEvenRow;
    cxGridDBTableView1.Styles.ContentOdd := dmMain.cxStyleGridOddRow;

    if FileExists(sd.FileName) then
    begin
      Screen.Cursor := crHourGlass;
      try
        Excel := CreateOleObject('Excel.Application');
      except
        MessageDlg('MS Excel не установлен на компьютере !', mtWarning, [mbOK], 0);
        exit;
      end;
      Excel.Workbooks.Open(sd.FileName);

      //Настраиваем параметры страницы
      Excel.ActiveSheet.PageSetup.CenterHorizontally := True;
      Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;
      Excel.ActiveSheet.PageSetup.FitToPagesWide := 1;

      Excel.ActiveSheet.PageSetup.LeftMargin := 27;
      Excel.ActiveSheet.PageSetup.RightMargin := 27;
      Excel.ActiveSheet.PageSetup.TopMargin := 27;
      Excel.ActiveSheet.PageSetup.BottomMargin := 27;

      v_amm_vis:=cxGridDBTableView1.VisibleColumnCount;
      //Выставляем ширину колонок так, чтобы они поместились на листе с альбомной ориентацией
      pGridWidth := 0;
      for I := 0 to v_amm_vis - 1 do begin
        pGridWidth := pGridWidth + cxGridDBTableView1.VisibleColumns[I].Width;
      end;

      for I := 0 to v_amm_vis - 1 do
      begin
        v_width := Trunc(140 * (cxGridDBTableView1.VisibleColumns[I].Width / pGridWidth)*1.0 - 0.3 - 0.3 );
        if ((Chr(65+I)='N') or (Chr(65+I)='O')) then
        begin
          v_width := Trunc( v_width + 0.2*v_amm_vis );
        end;
        Excel.ActiveSheet.Columns[I+1].ColumnWidth := v_width;
      //    Excel.ActiveSheet.Columns[Chr(65+I)+':'+Chr(65+I)].ColumnWidth :=
      //         Trunc(140 * (cxGridDBTableView1.VisibleColumns[I].Width / pGridWidth)*1.0);
      end;

      //добавляем 5 строчки перед гридом
      Excel.ActiveSheet.Range['A1:'+Chr(65+I-1)+'1'].Insert;
      Excel.ActiveSheet.Range['A2:'+Chr(65+I-1)+'2'].Insert;
      Excel.ActiveSheet.Range['A3:'+Chr(65+I-1)+'3'].Insert;
      Excel.ActiveSheet.Range['A4:'+Chr(65+I-1)+'4'].Insert;  
      Excel.ActiveSheet.Range['A5:'+Chr(65+I-1)+'5'].Insert;
      if cxGridDBTableView1.DataController.Filter.IsFiltering then
        Excel.ActiveSheet.Range['A6:'+Chr(65+I-1)+'6'].Insert;

      //Выводим блок "Утверждаю"
      if I > 4 then
        Excel.Range[Chr(65+I-5)+'1:'+Chr(65+I-1)+'1'].Select
      else
        Excel.Range['A1:'+Chr(65+I-1)+'1'].Select;
      //Excel.Selection.HorizontalAlignment := xlCenter;
      Excel.Selection.VerticalAlignment := xlCenter;
      Excel.Selection.WrapText:= false;
      Excel.Selection.Orientation := 0;
      Excel.Selection.ShrinkToFit := False;
      Excel.Selection.MergeCells := False;
      Excel.Selection.Merge;
      Excel.Selection.Font.Bold := False;
      Excel.Selection.Font.Size := 12;
      Excel.Selection.RowHeight := 4 * 12.75 * 1.5;
      Excel.Selection.Borders.Item[xlEdgeBottom].LineStyle := xlLineStyleNone;     
      if I > 4 then
        Excel.ActiveSheet.Cells[1, I-4].Value := 'УТВЕРЖДАЮ'+sLineBreak+
                                                 'Главный врач '+dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'GLAV_VRACH')+
                                                 ' _____________________________'
      else
        Excel.ActiveSheet.Cells[1, 1].Value := 'УТВЕРЖДАЮ'+sLineBreak+
                                                 'Главный врач '+dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'GLAV_VRACH')+
                                                 ' _____________________________';

      //Выводим заголовок
      Excel.Range['A3:'+Chr(65+I-1)+'3'].Select;
      Excel.Selection.HorizontalAlignment := xlCenter;
      Excel.Selection.VerticalAlignment := xlCenter;
      Excel.Selection.WrapText:= false;
      Excel.Selection.Orientation := 0;
      Excel.Selection.ShrinkToFit := False;
      Excel.Selection.MergeCells := False;
      Excel.Selection.Merge;
      Excel.Selection.Font.Bold := True;
      Excel.Selection.Font.Size := 12;
      Excel.Selection.RowHeight := 6 * 12.75;
      Excel.Selection.Borders.Item[xlEdgeBottom].LineStyle := xlLineStyleNone;
      Excel.ActiveSheet.Cells[3, 1].Value := 'Перечень медикаментов, перевязочных средств,'+sLineBreak+
                                             'изделий медицинского назначения'+sLineBreak+
                                             'для закупа по аптеке '+dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'CLIENT_NAME')+sLineBreak+
                                             'на '+DateToStr(now);

      if cxGridDBTableView1.DataController.Filter.IsFiltering then
      begin
        //Выводим парметры наложенного фильтра
        Excel.Range['A5:'+Chr(65+I-1)+'5'].Select;
        Excel.Selection.HorizontalAlignment := xlCenter;
        Excel.Selection.VerticalAlignment := xlCenter;
        Excel.Selection.WrapText:= false;
        Excel.Selection.Orientation := 0;
        Excel.Selection.ShrinkToFit := False;
        Excel.Selection.MergeCells := False;
        Excel.Selection.Merge;
        Excel.Selection.Font.Size := 10;
        Excel.Selection.Borders.Item[xlEdgeBottom].LineStyle := xlLineStyleNone;
        Excel.ActiveSheet.Cells[5, 1].Value := 'Наложенный фильтр: ' + cxGridDBTableView1.DataController.Filter.FilterCaption;
      end;

      Excel.ActiveSheet.PageSetup.Zoom := 95;
      Excel.Visible := True;
      Excel := UnAssigned;
      Screen.Cursor := crDefault;


      //if Application.MessageBox('Открыть сохраненный документ?', 'Подтверждение', MB_YESNO+MB_ICONQUESTION) = IDYES	then
      //  ShellExecute( 0, PChar('open'), PChar(sd.FileName), nil, nil, SW_SHOWMAXIMIZED );
    end
    else
      Application.MessageBox('Сохранение не было выполнено. Возможно нет прав.', 'Ошибка', MB_OK+MB_ICONERROR);
  end;
end;

procedure TfrmMinSpare.acRefreshExecute(Sender: TObject);
var
  MEDICID : Integer;
begin
//  odsMinSpare.SetVariable('MOID',dmMain.pkgMedSes.GetCurmo);
  MEDICID := -1;
  if odsMinSpare.Active then
    MEDICID := odsMinSpare.FieldByName('MEDICID').AsInteger;
  try
  if odsMinSpare.State in[dsEdit, dsInsert] then
    odsMinSpare.Post;
  except
  end;
  odsMinSpare.DisableControls;
  odsMinSpare.Close;
  odsMinSpare.Open;
  odsMinSpare.Locate('MEDICID', MEDICID, []);
  odsMinSpare.EnableControls;

  Self.Caption := 'Расчет потребностей :: Период: '+' c '+DateToStr(odsMinSpare.GetVariable('DATE1'))+' по '+ DateToStr(odsMinSpare.GetVariable('DATE2'));
  sb.Panels[0].Text := Format('Выбранный период: с %s по %s',
    [DateToStr(odsMinSpare.GetVariable('DATE1')),DateToStr(odsMinSpare.GetVariable('DATE2'))]);
  sb.Panels[1].Text := Format('Всего записей: %s ',[IntToStr(odsMinSpare.RecordCount)]);
  sb.Panels[2].Text := Format('Сумма: %s ',[cxGridDBTableView1.DataController.Summary.FooterSummaryTexts[0]]);
end;

procedure TfrmMinSpare.acSecretExecute(Sender: TObject);
begin
//  grMinSpareDBTableView1KARTID.Visible := not grMinSpareDBTableView1KARTID.Visible;
end;

function TfrmMinSpare.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
		else
			HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;

end;

procedure TfrmMinSpare.frZakupGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if UpperCase(ParName) = 'OKB' then
  begin
    //if dmMain.ConfigParams.GetParamValue('Func_Set', 0) = FUNC_SET_HANTI then ParValue := 'ОКБ' else
    ParValue := dmPrintReports.GetValueFromTSMINI('CONFIG', 'SHORT_NAME');
  end;     
  if UpperCase(ParName) = 'FULL_NAME' then
  begin
    //if dmMain.ConfigParams.GetParamValue('Func_Set', 0) = FUNC_SET_HANTI then ParValue := 'ОКБ' else
    ParValue := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'CLIENT_NAME');
  end;
    
  if UpperCase(ParName) = 'MONTH_COUNT' then ParValue := FMonthCount;       

  if UpperCase(ParName) = 'VAR_GL_VRACH' then ParValue := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'GLAV_VRACH');

  if UpperCase(ParName) = 'VAR_ZAM_GL_VRACHA' then ParValue := dmPrintReports.GetValueFromTSMINI('MANAGER_DOC', 'ZAM_GL_VRA4');
end;

procedure TfrmMinSpare.acPrintZakupExecute(Sender: TObject);
var
  P : TPoint;
begin
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuPrintZakup.Height;
    P := tbuPrintZakup.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати
  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
    odsMinSpare.DisableControls;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1:
      begin
        frZakup.FindObject('PageFooter1').Visible := False;
        frZakup.PrepareReport;
        ExportFRToExcel( frZakup, 'Перечень для закупа по аптеке на '+DateToStr(Now)+'.xls' );
      end;

      2:
      begin
        if FileExists('frZakup.frf') then frZakup.LoadFromFile('frZakup.frf');
        
        frZakup.FindObject('PageFooter1').Visible := True;
        frZakup.ShowReport;
      end;
    end;

  finally
    dmPrintSelect.PrintFlag := 0;
    odsMinSpare.EnableControls;    
  end;
end;

procedure TfrmMinSpare.tmrRefreshSummTimer(Sender: TObject);
begin
  acRefresh.Execute;
  tmrRefreshSumm.Enabled := False;
end;

procedure TfrmMinSpare.cbEmpMovClick(Sender: TObject);
begin
  if cbEmpMov.Checked then //cbEmpMov.Checked:= not cbEmpMov.Checked;
  begin
    odsMinSpare.Filter:='';
    odsMinSpare.Filtered:=False;
  end else begin
    odsMinSpare.Filtered:=True;
    odsMinSpare.Filter:='FN_RASHPERIOD>0';
  end;
end;

procedure TfrmMinSpare.cxGridDBColumnFN_NEEDTOBUYPropertiesEditValueChanged(
  Sender: TObject);
begin
  tmrRefreshSumm.Enabled := False;
  tmrRefreshSumm.Enabled := True;
end;

procedure TfrmMinSpare.FormCreate(Sender: TObject);
begin
  FDate1 := IncMonth(ServerDate(dmMain.os),-1);
  FDate2 := FDate1;

  cbEmpMov.Checked :=True;

//  tbuSaveToXls.Visible := dmMain.sDB_NAME = 'SK'; 
  tbuPrintZakup.Visible := dmMain.sDB_NAME <> 'SK';

//  cxGridDBColumnCorrrect.Properties.MaxLength := dmMain.GetFieldLength('med', 'TMEDIC_ZAKUP', 'FC_CORRECT');
end;

end.
