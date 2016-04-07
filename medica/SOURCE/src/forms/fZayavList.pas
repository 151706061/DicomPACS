unit fZayavList;

interface

uses
  Windows,Messages,SysUtils,Classes,Graphics,Controls,Forms,Dialogs,ComCtrls,
  ToolWin,Db, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCalendar, cxTextEdit, cxCurrencyEdit,
  cxDBLookupComboBox, cxSpinEdit, Menus, JvComponentBase, JvFormPlacement,
  Oracle, FR_Class, FR_DSet, FR_DBSet, ActnList, OracleData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, HtmlHlp, ExtCtrls, Mask,
  JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit,
  JvExControls, JvArrowButton, cxCheckBox, cxContainer, cxMaskEdit,
  cxDropDownEdit, frxClass, frxDBSet;

type
  TfrmZayavList = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    dsZayavka: TDataSource;
    al: TActionList;
    acEsc: TAction;
    acIns: TAction;
    acDel: TAction;
    acEdit: TAction;
    odsZayavka: TOracleDataSet;
    ToolButton6: TToolButton;
    acRefresh: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton2: TToolButton;
    ToolButton13: TToolButton;
    sbSum: TStatusBar;
    tbuPrint: TToolButton;
    ToolButton4: TToolButton;
    FormStorage: TJvFormStorage;
    acPrint: TAction;
    grZayavka: TcxGrid;
    grZayavkaLevel1: TcxGridLevel;
    grZayavkaTableView: TcxGridDBTableView;
    acGodMode: TAction;
    odsZayavka_DPC: TOracleDataSet;
    dsZayavka_DPC: TDataSource;
    Splitter1: TSplitter;
    grZayavkaDPC: TcxGrid;
    grZayavkaDPCDBTableView1: TcxGridDBTableView;
    grZayavkaDPCLevel1: TcxGridLevel;
    Panel1: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    pmDocsFilterPeriod: TPopupMenu;
    N19: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    tbuDel: TToolButton;
    Panel2: TPanel;
    dedDate1: TcxDateEdit;
    dedDate2: TcxDateEdit;
    chbDate1: TcxCheckBox;
    chbDate2: TcxCheckBox;
    ToolButton3: TToolButton;
    grZayavkaTableViewFK_ZAYAVID: TcxGridDBColumn;
    grZayavkaTableViewFC_ZAYAV_NUM: TcxGridDBColumn;
    grZayavkaTableViewFD_CREATE: TcxGridDBColumn;
    grZayavkaTableViewFD_INVOICE: TcxGridDBColumn;
    grZayavkaTableViewFK_MO_CREATE: TcxGridDBColumn;
    grZayavkaTableViewFC_DOVER_NUM: TcxGridDBColumn;
    grZayavkaTableViewFK_MO_GET: TcxGridDBColumn;
    grZayavkaTableViewFK_MO_ZAYAV: TcxGridDBColumn;
    grZayavkaTableViewFK_POSTAVID: TcxGridDBColumn;
    grZayavkaTableViewFD_DOVER_DATE: TcxGridDBColumn;
    grZayavkaTableViewFC_COMMENT: TcxGridDBColumn;
    grZayavkaTableViewFC_MO_CREATED: TcxGridDBColumn;
    grZayavkaTableViewFC_MO_ZAYAV: TcxGridDBColumn;
    grZayavkaTableViewFC_MO_GET: TcxGridDBColumn;
    grZayavkaTableViewFC_POSTAV: TcxGridDBColumn;
    grZayavkaDPCDBTableView1ROWNUM: TcxGridDBColumn;
    grZayavkaDPCDBTableView1FK_ZAYAVKA_DPC_ID: TcxGridDBColumn;
    grZayavkaDPCDBTableView1FK_MEDIC: TcxGridDBColumn;
    grZayavkaDPCDBTableView1FK_ZAYAVKA: TcxGridDBColumn;
    grZayavkaDPCDBTableView1FN_KOL: TcxGridDBColumn;
    grZayavkaDPCDBTableView1FC_MEDIC_NAME: TcxGridDBColumn;
    grZayavkaDPCDBTableView1FC_EI_NAME: TcxGridDBColumn;
    oqDelZayavka: TOracleQuery;
    frxZayavka: TfrxReport;
    frxDBZayavka_DPC: TfrxDBDataset;
    frxDBZayavka: TfrxDBDataset;
    frxReport1: TfrxReport;
    pmZayavPrint: TPopupMenu;
    miPrint1: TMenuItem;
    miPrint2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acEscExecute(Sender: TObject);
    procedure acInsExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure acPrintExecute(Sender: TObject);
    procedure acGodModeExecute(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure chbDate1Click(Sender: TObject);
    procedure chbDate2Click(Sender: TObject);
    procedure dedDate1PropertiesEditValueChanged(Sender: TObject);
    procedure dedDate1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dedDate1PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure odsZayavkaAfterScroll(DataSet: TDataSet);
    procedure frxZayavkaGetValue(const VarName: String;
      var Value: Variant);
    procedure miPrint1Click(Sender: TObject);
    procedure tbuPrintClick(Sender: TObject);
  private
    { Private declarations }
    FGodMode : Boolean;
    FNotRefresh : Boolean; // ������ ���������� ��� ������ �� ������
  public
    { Public declarations }
    idZayav: Integer;   //  ��� �������� ���������
  end;
procedure DoShowZayavList;

var
  frmZayavList: TfrmZayavList;

implementation

{$R *.DFM}

uses fmainform,
     DateUtils, fdmPrintReports, fdmMain, fZayavEdit, fdmPrintSelect;


//****************************************************************************************
//                                 DoShowPrihDoc
//****************************************************************************************

procedure DoShowZayavList;
begin
  if not frmMain.RestoreMDI_Window('frmZayavList') then
  begin
    frmZayavList := TfrmZayavList.Create(Application);
//    frmPrihList.Show;
    frmZayavList.FormStyle := fsMDIChild;
  end;

//    Application.CreateForm(TfrmPrihList, frmPrihList);
//  frmMain.CreateChild(TfrmPrihList, frmPrihList);
end;

//******************************************************************************
//                                 FormClose
//******************************************************************************
procedure TfrmZayavList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // �������� �� ���������� ���
  if not IsValidDateEditValue( dedDate1.EditingValue ) then  dedDate1.EditValue := ServerDate(dmMain.os);
  if not IsValidDateEditValue( dedDate2.EditingValue ) then  dedDate2.EditValue := ServerDate(dmMain.os);  

  FormStorage.AppStorage.Flush;
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Checked',  BoolToStr(chbDate1.Checked, True) );  // ���������  ������ � ���� ����
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Checked',  BoolToStr(chbDate2.Checked, True) );
  IniWriteString( iniFileName, Self.Name, 'dpeDate1Date',     DateToStr(TRUNC(dedDate1.EditValue))   );
  IniWriteString( iniFileName, Self.Name, 'dpeDate2Date',     DateToStr(TRUNC(dedDate2.EditValue))   );
//  cxDBgPrihListDBTableView1.StoreToRegistry('\SoftWare\SoftMaster\Medica\'+Self.Name, False, [gsoUseFilter]);
  grZayavkaTableView.StoreToIniFile(iniFileName, False, [gsoUseFilter]);

  frmMain.tbuZayavka.ImageIndex := 51;
  Action := caFree;
end;

// �������
procedure TfrmZayavList.acEscExecute(Sender: TObject);
begin
  Close;
end;

// ��������
procedure TfrmZayavList.acInsExecute(Sender: TObject);
begin
  try
    dmmain.ncomment := '���������� ������';
    Screen.Cursor := crSQLWait;
    dmMain.os.Savepoint('ZayavAdd');
    idZayav := -1;
    if DoShowZayavkaEdit(idZayav, True) = mrOk then
    begin
      odsZayavka.DisableControls;
      odsZayavka.AfterScroll := nil;
      odsZayavka.Close;
      odsZayavka.Open;
      odsZayavka.EnableControls;
      odsZayavka.Locate('fk_zayavid', idZayav, []);
      odsZayavka.AfterScroll := odsZayavkaAfterScroll;
      odsZayavkaAfterScroll( odsZayavka );       

      dmMain.os.Commit;
    end
    else
      idZayav := -1;
      try
        dmMain.os.RollbackToSavepoint('ZayavAdd');
      except
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;
// ��������
procedure TfrmZayavList.acEditExecute(Sender: TObject);
begin
  try
    dmmain.ncomment := '��������� ������';
    Screen.Cursor := crSQLWait;
    dmMain.os.Savepoint('ZayavEdit');

    idZayav := odsZayavka.FieldByName('fk_zayavid').AsInteger;
    if DoShowZayavkaEdit(idZayav, True) = mrOk then
    begin
      odsZayavka.DisableControls;
      odsZayavka.AfterScroll := nil;
      odsZayavka.Close;
      odsZayavka.Open;
      odsZayavka.EnableControls;
      odsZayavka.Locate('fk_zayavid', idZayav, []);
      odsZayavka.AfterScroll := odsZayavkaAfterScroll;
      odsZayavkaAfterScroll( odsZayavka );

      dmMain.os.Commit;
    end
    else
      try
        dmMain.os.RollbackToSavepoint('ZayavEdit');
      except
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;
//------------------------------------------------------------------------------
// �������
procedure TfrmZayavList.acDelExecute(Sender: TObject);
begin
//  if int(odsSelDocPrihDATA.AsDateTime) <= int(dateclose) then exit;
  dmmain.ncomment := '��������';
  if Windows.MessageBox(Self.Handle,
    PChar('�� ������������� ������ ������� ������ ������ ?'), '��������������',
		MB_YESNO + MB_ICONQUESTION + mb_defbutton2) = mrYes then
  begin
    oqDelZayavka.SetVariable('FK_ZAYAVKA_ID', odsZayavka.fieldbyname('fk_zayavid').asinteger);
    oqDelZayavka.Execute;
//    dmMain.PkgPrihRash.dodel(odsZayavka.fieldbyname('dpid').asinteger);
    dmMain.os.Commit;
    acRefresh.Execute;
  end;
end;

//******************************************************************************
//                           FormActivate
//******************************************************************************
procedure TfrmZayavList.FormActivate(Sender: TObject);
begin
  odsZayavka.AfterScroll := nil;
  odsZayavka.First;
  odsZayavka.AfterScroll := odsZayavkaAfterScroll;
  odsZayavkaAfterScroll( nil );  
end;

// ��������
procedure TfrmZayavList.acRefreshExecute(Sender: TObject);
var
  s : string;
  date_temp : TDate;
begin
  if FNotRefresh then Exit;

  odsZayavka.AfterScroll := nil;
  odsZayavka.Close;
//  cxDBgPrihList.BeginUpdate;
  if TRUNC(dedDate1.Date) > TRUNC(dedDate2.Date) then
  begin
    date_temp := dedDate1.Date;
    dedDate1.Date := dedDate2.Date;
    dedDate2.Date := date_temp;
  end;
  odsZayavka.SetVariable('DATE1', TRUNC(dedDate1.Date));
  odsZayavka.SetVariable('DATE2', TRUNC(dedDate2.Date));
  s := '������ ������ :: ������:';
  case chbDate1.Checked of
    TRUE :
    begin
      odsZayavka.SetVariable('FILTERED_BY_DATE1', 1);
      s := s + ' c '+DateToStr(dedDate1.Date);
    end;

    FALSE: odsZayavka.SetVariable('FILTERED_BY_DATE1', 0);
  end;
  case chbDate2.Checked of
    TRUE :
    begin
      odsZayavka.SetVariable('FILTERED_BY_DATE2', 1);
      s := s + ' �� '+DateToStr(dedDate2.Date);
    end;

    FALSE: odsZayavka.SetVariable('FILTERED_BY_DATE2', 0);
  end;
  if (chbDate1.Checked or chbDate2.Checked) = False then
    s := '������ ������ :: ��� �������';

  Self.Caption := s;
  odsZayavka.Open;
  odsZayavka.AfterScroll := odsZayavkaAfterScroll;
  odsZayavkaAfterScroll( nil );   

  tbuPrint.Enabled := (odsZayavka.RecordCount > 0);
  acDel.Enabled    := (odsZayavka.RecordCount > 0);
  acEdit.Enabled   := (odsZayavka.RecordCount > 0);    
end;
// ������
procedure TfrmZayavList.FormCreate(Sender: TObject);
var
  CurDate : TDate;
begin
  CurDate := Trunc(ServerDate(dmMain.os));
  FNotRefresh := True;
  chbDate1.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate1Checked',  'TRUE')) = 'TRUE';
  chbDate2.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate2Checked',  'TRUE')) = 'TRUE';
  dedDate1.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate1Date', DateToStr(CurDate)));
  dedDate2.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate2Date', DateToStr(CurDate)));
  // ���� ���� �� �������� �� ������� ����������� ����, �� ������ �������� ������� ����
  if (chbDate1.Checked)and(Trunc(dedDate1.Date) > CurDate)or(Trunc(dedDate2.Date) < CurDate)and(chbDate2.Checked) then
  begin
    dedDate1.EditValue := CurDate;
    dedDate2.EditValue := CurDate;
  end;
  FNotRefresh := False;

  FGodMode := False; // ���������� ����� ���������� ������ ���� ��������
  try
    grZayavkaTableView.RestoreFromIniFile(iniFileName,True,False, [gsoUseFilter]);
  except
  end;

  if (dmMain.ConfigParams.GetParamValue('FUNC_SHOW_ZAYAV_PRINT2', 0) = 1) then
  begin
    tbuPrint.Style := tbsDropDown;
    tbuPrint.DropdownMenu := pmZayavPrint;
  end;

  acRefresh.Execute;
end;

function TfrmZayavList.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
	Result := False;
  try
    // TODo �������� ������ ��������  Command
    if Data = -1 then
      HtmlHelp(0, PChar('Medica.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('Medica.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('������� �� �������');
	end;
end;

procedure TfrmZayavList.acPrintExecute(Sender: TObject);
var
  P : TPoint;
begin
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbuPrint.Height;
    P := tbuPrint.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // ������ ����� ����� ����������� ������� TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // � ������������� ���� - ����� �������� �� ����� ����� ������ ���� ������ ������ ������� ������

  if dmPrintSelect.PrintFlag = 0 then Exit;
  
  try
    if (acPrint.Tag <= 1) then
    begin
      if FileExists('frxZayavka.fr3') then           // ���� ������ ����
        frxZayavka.LoadFromFile('frxZayavka.fr3'); // ��������� ���
    end
    else
    begin
      if FileExists('frxZayavka'+IntToStr(acPrint.Tag)+'.fr3') then           // ���� ������ ����
        frxZayavka.LoadFromFile('frxZayavka'+IntToStr(acPrint.Tag)+'.fr3'); // ��������� ���
    end;    

    if dmPrintSelect.PrintFlag = 1 then
    begin
      if frxZayavka.FindObject('PageFooter1') <> nil then
        frxZayavka.FindObject('PageFooter1').Visible := False;
    end;

    frxZayavka.PrepareReport();

    case dmPrintSelect.PrintFlag of // ���� ���� ��������
      1:
      begin
        dmPrintSelect.frxXLSExport1.FileName := '������ � '+ odsZayavka.FieldByName('fc_zayav_num').AsString + ' �� '+DateToStr(odsZayavka.FieldByName('fd_invoice').AsDateTime)+'.xls';
        dmPrintSelect.frxXLSExport1.DefaultPath := PrepareFilePath('');
        dmPrintSelect.frxXLSExport1.FastExport := True;
        ExportFRToFilter( frxZayavka, '������ � '+ odsZayavka.FieldByName('fc_zayav_num').AsString + ' �� '+DateToStr(odsZayavka.FieldByName('fd_invoice').AsDateTime),  dmPrintSelect.frxXLSExport1);
      end;

      2:
      begin
        frxZayavka.ShowPreparedReport;
      end;
    end;
  finally
    dmPrintSelect.PrintFlag := 0;
  end;
end;

procedure TfrmZayavList.acGodModeExecute(Sender: TObject);
begin
  FGodMode := not FGodMode;
  if FGodMode then
    Self.Caption :=  Self.Caption + ' (God mode)'
  else
    Self.Caption := StringReplace(Self.Caption, ' (God mode)', '',[]);
end;

procedure TfrmZayavList.N19Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender) then Exit;
  FNotRefresh := True;
  CurDate := ServerDate(dmMain.os);
  case TMenuItem(Sender).Tag of
    1:  // ������� ���
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(IncYear(CurDate, -1)));
      dedDate2.EditValue := Trunc(EndOfTheYear(IncYear(CurDate, -1)));
    end;

    2:  // ������� ���
    begin
      dedDate1.EditValue := Trunc(StartOfTheYear(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheYear(CurDate));
    end;

    3:  // ������� �����
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(IncMonth(CurDate,-1)));
      dedDate2.EditValue := Trunc(EndOfTheMonth(IncMonth(CurDate,-1)));
    end;

    4:  // ������� �����
    begin
      dedDate1.EditValue := Trunc(StartOfTheMonth(CurDate));
      dedDate2.EditValue := Trunc(EndOfTheMonth(CurDate));
    end;

    5:  // ������� ����
    begin
      dedDate1.EditValue := Trunc(CurDate);
      dedDate2.EditValue := Trunc(CurDate);
    end;
  end;

  chbDate1.Checked := (TMenuItem(Sender).Tag <> 0);
  chbDate2.Checked := (TMenuItem(Sender).Tag <> 0);
  FNotRefresh := False;
  acRefresh.Execute;  
end;

procedure TfrmZayavList.chbDate1Click(Sender: TObject);
begin
  dedDate1.Enabled := chbDate1.Checked;
  acRefresh.Execute;
end;

procedure TfrmZayavList.chbDate2Click(Sender: TObject);
begin
  dedDate2.Enabled := chbDate2.Checked;
  acRefresh.Execute;
end;

procedure TfrmZayavList.dedDate1PropertiesEditValueChanged(Sender: TObject);
begin
  acRefresh.Execute;
end;

procedure TfrmZayavList.dedDate1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then acRefresh.Execute;
end;

procedure TfrmZayavList.dedDate1PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxDateEdit_PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;

procedure TfrmZayavList.odsZayavkaAfterScroll(DataSet: TDataSet);
begin
  odsZayavka_DPC.Close;
  odsZayavka_DPC.SetVariable('fk_zayavka', odsZayavka.FieldByName('FK_ZAYAVID').AsInteger);
  odsZayavka_DPC.Open;
end;

procedure TfrmZayavList.tbuPrintClick(Sender: TObject);
begin
  acPrint.Execute;
end;

procedure TfrmZayavList.frxZayavkaGetValue(const VarName: String;
  var Value: Variant);
begin
  dmPrintReports.frReportOnGetValue(VarName, Value);
end;

procedure TfrmZayavList.miPrint1Click(Sender: TObject);
begin
  acPrint.Tag := TMenuItem(sender).Tag;
  TMenuItem(sender).Checked := True;
  acPrint.Execute;
end;

end.

