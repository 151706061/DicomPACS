unit fDOC_AUTONUM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, OracleData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, JvComponentBase, JvFormPlacement,
  ActnList, ComCtrls, ToolWin, cxCheckBox, cxDBLookupComboBox,
  cxLookAndFeelPainters, cxContainer, cxGroupBox, cxCalendar, cxSpinEdit,
  cxMaskEdit, cxDropDownEdit, JvExControls, JvArrowButton, ExtCtrls, Menus,
  cxSplitter, fdmMain, fMainForm;

type
  TfmDOC_AUTONUM = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    tbuEdit: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    tbuRefresh: TToolButton;
    tbuClose: TToolButton;
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    FormStorage: TJvFormStorage;
    grAutonum: TcxGrid;
    grAutonumDBTableView1: TcxGridDBTableView;
    grAutonumLevel1: TcxGridLevel;
    odsTDOCS_AUTONUM: TOracleDataSet;
    dsTDOCS_AUTONUM: TDataSource;
    grAutonum_fk_id: TcxGridDBColumn;
    grAutonum_fk_tdocs_autonum_counter_id: TcxGridDBColumn;
    grAutonum_fp_vid: TcxGridDBColumn;
    grAutonum_fp_vidmove: TcxGridDBColumn;
    grAutonum_fk_mogroup_id: TcxGridDBColumn;
    grAutonum_fl_enabled: TcxGridDBColumn;
    grAutonum_fn_type_autonum: TcxGridDBColumn;
    odsDocsList: TOracleDataSet;
    dsDocsList: TDataSource;
    odsMO_GROUP: TOracleDataSet;
    dsMO_GROUP: TDataSource;
    odsType_Autonum: TOracleDataSet;
    dsType_Autonum: TDataSource;
    odsFP_VID: TOracleDataSet;
    dsFP_VID: TDataSource;
    odsTDOCS_AUTONUM_COUNTER1: TOracleDataSet;
    dsTDOCS_AUTONUM_COUNTER1: TDataSource;
    ToolButton2: TToolButton;
    tbuCounters: TToolButton;
    grbCounters: TcxGroupBox;
    grCounters: TcxGrid;
    grCountersDBTableView1: TcxGridDBTableView;
    grCounters_fk_id: TcxGridDBColumn;
    grCountersLevel1: TcxGridLevel;
    grAutonum_fd_start: TcxGridDBColumn;
    grCounters_fn_curnum: TcxGridDBColumn;
    pmFilterPeriod: TPopupMenu;
    N19: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    Panel2: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    Panel3: TPanel;
    dedDate1: TcxDateEdit;
    dedDate2: TcxDateEdit;
    chbDate1: TcxCheckBox;
    chbDate2: TcxCheckBox;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    cxSplitter1: TcxSplitter;
    N1: TMenuItem;
    N2: TMenuItem;
    grCounters_FN_STARTNUM: TcxGridDBColumn;
    dsTDOCS_AUTONUM_COUNTER2: TDataSource;
    odsTDOCS_AUTONUM_COUNTER2: TOracleDataSet;
    pmCounters: TPopupMenu;
    miDelCounter: TMenuItem;
    miChangeCounter: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dedDate1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dedDate2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chbDate2Click(Sender: TObject);
    procedure chbDate1Click(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure grAutonumDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure grCountersDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tbuCountersClick(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure grAutonum_fp_vidmovePropertiesChange(Sender: TObject);
    procedure tbuEditClick(Sender: TObject);
    procedure grCountersDBTableView1DataControllerDataChanged(Sender: TObject);
    procedure miDelCounterClick(Sender: TObject);
    procedure miChangeCounterClick(Sender: TObject);
    procedure grAutonum_fn_type_autonumPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FNotRefresh : boolean;
    procedure grAutonum_fk_tdocs_autonum_counter_idButtonClick(Sender: TObject; AButtonIndex: Integer);
  public
    { Public declarations }
  end;

  procedure DoShowDocs_AutoNum;

var
	fmDOC_AUTONUM: TfmDOC_AUTONUM;

implementation
uses DateUtils;

{$R *.dfm}


procedure DoShowDocs_AutoNum;
//var
//  fmDOC_AUTONUM: TfmDOC_AUTONUM;
begin
  if not frmMain.RestoreMDI_Window('fmDOC_AUTONUM') then
    begin
      fmDOC_AUTONUM := TfmDOC_AUTONUM.Create(Application);
      fmDOC_AUTONUM.FormStyle := fsMDIChild;
    end;
  //frmMain.CreateChild(TfmDOC_AUTONUM, fmDOC_AUTONUM);
  //fmDOC_AUTONUM.Show;
end;

procedure TfmDOC_AUTONUM.acAddExecute(Sender: TObject);
begin
  odsTDOCS_AUTONUM.Insert;
  odsTDOCS_AUTONUM.Post;
//  odsTDOCS_AUTONUM.RefreshRecord;

end;

procedure TfmDOC_AUTONUM.acCloseExecute(Sender: TObject);
begin
  if tbuCounters.Down then
  begin
    tbuCounters.Down := False;
    tbuCountersClick( nil );
  end;

  Close;
end;

procedure TfmDOC_AUTONUM.acDelExecute(Sender: TObject);
begin
  grAutonumDBTableView1.DataController.DeleteFocused;
end;

procedure TfmDOC_AUTONUM.acRefreshExecute(Sender: TObject);
var
  s : string;
  date_temp : TDate;
begin
  if FNotRefresh then Exit;
  odsTDOCS_AUTONUM.AfterScroll := nil;
//  ID := odsSelDocMove.FieldByName('DPID').AsInteger;
  if TRUNC(dedDate1.Date) > TRUNC(dedDate2.Date) then
  begin
    date_temp := dedDate1.Date;
    dedDate1.Date := dedDate2.Date;
    dedDate2.Date := date_temp;
  end;
  odsTDOCS_AUTONUM.Close;
  odsTDOCS_AUTONUM.SetVariable('DATE1', TRUNC(dedDate1.Date));
  odsTDOCS_AUTONUM.SetVariable('DATE2', TRUNC(dedDate2.Date));
  s := 'Настройка автонумерации документов :: Период:';
  case chbDate1.Checked of
    TRUE :
    begin
      odsTDOCS_AUTONUM.SetVariable('FILTERED_BY_DATE1', 1);
      s := s + ' c '+DateToStr(dedDate1.Date);
    end;

    FALSE: odsTDOCS_AUTONUM.SetVariable('FILTERED_BY_DATE1', 0);
  end;
  case chbDate2.Checked of
    TRUE :
    begin
      odsTDOCS_AUTONUM.SetVariable('FILTERED_BY_DATE2', 1);
      s := s + ' по '+DateToStr(dedDate2.Date);
    end;

    FALSE: odsTDOCS_AUTONUM.SetVariable('FILTERED_BY_DATE2', 0);
  end;

  if (chbDate1.Checked or chbDate2.Checked) = False then
    s := 'Настройка автонумерации документов :: Без периода';

  Self.Caption := s;

  odsTDOCS_AUTONUM.Open;
  grAutonumDBTableView1.Controller.GoToFirst;

//  odsTDOCS_AUTONUM.AfterScroll := odsSelDocMoveAfterScroll;
//  odsTDOCS_AUTONUMAfterScroll( odsSelDocMove );
end;

procedure TfmDOC_AUTONUM.chbDate1Click(Sender: TObject);
begin
  dedDate1.Enabled := chbDate1.Checked;
  acrefresh.Execute;
end;

procedure TfmDOC_AUTONUM.chbDate2Click(Sender: TObject);
begin
  dedDate2.Enabled := chbDate2.Checked;
  acrefresh.Execute;
end;

procedure TfmDOC_AUTONUM.dedDate1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then acrefresh.Execute;
end;

procedure TfmDOC_AUTONUM.dedDate2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then acrefresh.Execute;
end;

procedure TfmDOC_AUTONUM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // проверки на валидность дат
  dedDate1.PostEditValue;
  dedDate2.PostEditValue;

  FormStorage.AppStorage.Flush;
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Checked',  BoolToStr(chbDate1.Checked, True) );  // сохраняем  булеан в виде слов
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Checked',  BoolToStr(chbDate2.Checked, True) );
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Date',     DateToStr(TRUNC(dedDate1.Date))   );
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Date',     DateToStr(TRUNC(dedDate2.Date))   );

  Action := caFree;
end;

procedure TfmDOC_AUTONUM.FormCreate(Sender: TObject);
var
  CurDate : TDate;
  button: TcxEditButton;
begin
//  fmainform.FormStorageRestorePlacement(FormStorage, TForm(self));
//  fmainform.CheckOnMaximize(TForm(self));
  CurDate := Trunc(ServerDate(dmMain.os));
  FNotRefresh := True;
  chbDate1.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate1Checked',  'TRUE')) = 'TRUE';
  chbDate2.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate2Checked',  'TRUE')) = 'TRUE';
  dedDate1.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate1Date', DateToStr(CurDate )) );
  dedDate2.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate2Date', DateToStr(CurDate)) );
  // если дата из настроек не влючает сегодняшний день, то ставим периодом текущий день
  if (chbDate1.Checked)and(Trunc(dedDate1.Date) > CurDate)or(Trunc(dedDate2.Date) < CurDate)and(chbDate2.Checked) then
  begin
    dedDate1.EditValue := CurDate;
    dedDate2.EditValue := CurDate;
  end;
  FNotRefresh := False;

  // Кнопка выбрать
  button := grAutonum_fk_tdocs_autonum_counter_id.Properties.Buttons.Add;
  button.Kind := bkEllipsis; // Фигня с проозрачным цветом если сохранять через файл то все нормлаьно
  button.Glyph.Transparent := True;
  grAutonum_fk_tdocs_autonum_counter_id.Properties.OnButtonClick := grAutonum_fk_tdocs_autonum_counter_idButtonClick;

  odsFP_VID.Open;
  odsDocsList.Open;
  odsMO_GROUP.Open;
  odsType_Autonum.Open;
  odsTDOCS_AUTONUM_COUNTER1.Open;
  odsTDOCS_AUTONUM_COUNTER2.Open;  
  acRefresh.Execute;
end;

procedure TfmDOC_AUTONUM.grAutonumDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  grAutonumDBTableView1.DataController.PostEditingData;
  grAutonumDBTableView1.OptionsData.Editing := False;

  grCountersDBTableView1.DataController.PostEditingData;
  grCountersDBTableView1.OptionsData.Editing := False;

  if (Sender.Name = 'grAutonumDBTableView1') and odsTDOCS_AUTONUM.Active and (odsTDOCS_AUTONUM.RecordCount > 0) then // защита присвоения счетчика
    grAutonum_fk_tdocs_autonum_counter_id.Options.Editing := (AFocusedRecord.Values[ grAutonum_fn_type_autonum.Index ] > 1);

  tbuEdit.Down := False;
  grCountersDBTableView1.Invalidate();
end;

procedure TfmDOC_AUTONUM.grAutonum_fk_tdocs_autonum_counter_idButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 1 then
  begin
    if tbuCounters.Down = False then
    begin
      tbuCounters.Down := True;
      tbuCountersClick( nil );
    end;

    if VarIsNull(grAutonum_fk_tdocs_autonum_counter_id.EditValue) then
    begin //добавляем новый счетчик
      odsTDOCS_AUTONUM_COUNTER2.Insert;
      odsTDOCS_AUTONUM_COUNTER2.Post;
      grAutonum_fk_tdocs_autonum_counter_id.EditValue := grCounters_fk_id.EditValue;
      grAutonumDBTableView1.DataController.Post;

      odsTDOCS_AUTONUM_COUNTER1.Close;
      odsTDOCS_AUTONUM_COUNTER1.Open;
    end
    else
    begin
      grCounters.SetFocus;
      odsTDOCS_AUTONUM_COUNTER2.Locate('FK_ID', grAutonum_fk_tdocs_autonum_counter_id.EditValue, []);
    end;
  end;
end;

procedure TfmDOC_AUTONUM.grAutonum_fn_type_autonumPropertiesChange( Sender: TObject );
begin
  grAutonumDBTableView1.DataController.PostEditingData;
  // защита присвоения счетчика
  grAutonum_fk_tdocs_autonum_counter_id.Options.Editing := (grAutonum_fn_type_autonum.EditValue > 1);

  if grAutonum_fn_type_autonum.EditValue <=1 then
    grAutonum_fk_tdocs_autonum_counter_id.EditValue := null;
end;

procedure TfmDOC_AUTONUM.grAutonum_fp_vidmovePropertiesChange(Sender: TObject);
begin
  grAutonumDBTableView1.DataController.PostEditingData;

  if odsDocsList.Locate('FK_ID', grAutonum_fp_vidmove.EditValue, []) then
  begin
    grAutonum_fp_vid.EditValue := odsDocsList.FieldByName('FP_VID').AsVariant;
//    grAutonumDBTableView1.DataController.Post( True );
  end;
end;

procedure TfmDOC_AUTONUM.grCountersDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if grAutonum_fk_tdocs_autonum_counter_id.EditValue = AViewInfo.GridRecord.Values[ grCounters_fk_id.Index ] then
    ACanvas.Font.Style := [fsBold];
end;

procedure TfmDOC_AUTONUM.grCountersDBTableView1DataControllerDataChanged( Sender: TObject );
begin
  odsTDOCS_AUTONUM_COUNTER1.Close;
  odsTDOCS_AUTONUM_COUNTER1.Open;  
end;

procedure TfmDOC_AUTONUM.miChangeCounterClick(Sender: TObject);
begin
  grCountersDBTableView1.OptionsData.Editing := True;
  grCountersDBTableView1.DataController.Edit;
  grCounters_fn_curnum.Selected := True;
end;

procedure TfmDOC_AUTONUM.miDelCounterClick(Sender: TObject);
begin
  grCountersDBTableView1.DataController.PostEditingData;
  if odsTDOCS_AUTONUM.Locate('FK_TDOCS_AUTONUM_COUNTER_ID', grCounters_fk_id.EditValue, []) then
  begin
    if Application.MessageBox('Внимание текущий счётчик используется.'#13#10'Все равно удалить?',
                              'ВНИМАНИЕ',
                              MB_YESNO+MB_ICONQUESTION) = ID_YES then
    begin
      repeat
        grAutonum_fk_tdocs_autonum_counter_id.EditValue := null;
        grAutonumDBTableView1.DataController.PostEditingData;
      until odsTDOCS_AUTONUM.Locate('FK_TDOCS_AUTONUM_COUNTER_ID', grCounters_fk_id.EditValue, [])=False;
    end
    else
      Exit;  
  end;

  grCountersDBTableView1.DataController.DeleteFocused;
end;

procedure TfmDOC_AUTONUM.N19Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender) then Exit;
  FNotRefresh := True;
  CurDate := ServerDate(dmMain.os);
  case TMenuItem(Sender).Tag of
    1:  // прошлый год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(IncYear(CurDate, -1)));
      dedDate2.EditValue := Trunc(EndOfTheYear(IncYear(CurDate, -1)));
    end;

    2:  // Текущий год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheYear(CurDate));
    end;

    3:  // прошлый месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(IncMonth(CurDate,-1)));
      dedDate2.EditValue := Trunc(EndOfTheMonth(IncMonth(CurDate,-1)));
    end;

    4:  // текущий месяц
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheMonth(CurDate));
    end;

    5:  // текущий день
    begin
      dedDate1.EditValue := Trunc(CurDate);
      dedDate2.EditValue := Trunc(CurDate);
    end;

    6:  // следущий год
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(IncYear(CurDate, 1)));
      dedDate2.EditValue := Trunc(EndOfTheYear(IncYear(CurDate, 1)));
    end;
  end;

  chbDate1.Checked := (TMenuItem(Sender).Tag <> 0);
  chbDate2.Checked := (TMenuItem(Sender).Tag <> 0);
  FNotRefresh := False;
    
  acrefresh.Execute;
end;

procedure TfmDOC_AUTONUM.tbuCountersClick(Sender: TObject);
begin
  case tbuCounters.Down of
    False:
    begin
      if Self.WindowState <> wsMaximized then
        Self.Height := Self.Height - grbCounters.Height - cxSplitter1.Height;
      cxSplitter1.Hide;
      grbCounters.Hide;
    end;

    True :
    begin
      if Self.WindowState <> wsMaximized then
        Self.Height := Self.Height + grbCounters.Height + cxSplitter1.Height;
      grbCounters.Show;
      cxSplitter1.Show;
    end;
  end;
end;

procedure TfmDOC_AUTONUM.tbuEditClick(Sender: TObject);
begin
  if tbuEdit.Down then
  begin
    grAutonumDBTableView1.OptionsData.Editing := True;
    grAutonumDBTableView1.DataController.Edit;

//    grCountersDBTableView1.OptionsData.Editing := True;
//    grCountersDBTableView1.DataController.Edit;
  end
  else
  begin
    grAutonumDBTableView1.DataController.Post( True );
    grAutonumDBTableView1.OptionsData.Editing  := False;

//    grCountersDBTableView1.DataController.Post( True );
//    grCountersDBTableView1.OptionsData.Editing  := False;
  end;
end;

end.
