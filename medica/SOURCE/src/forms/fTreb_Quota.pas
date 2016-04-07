unit fTreb_Quota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, Db, OracleData, Grids,
  JvFormPlacement, Oracle, JvDBUtils,  JvComponentBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxDBLookupComboBox,
  cxCalendar, Menus, cxCheckBox, cxContainer, cxMaskEdit, cxDropDownEdit,
  JvExControls, JvArrowButton, ExtCtrls, cxSpinEdit;

type
  TfmTreb_Quota = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    tbuEdit: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    al: TActionList;
    acClose: TAction;
    acDel: TAction;
    acEdit: TAction;
    acAdd: TAction;
    acRefresh: TAction;
    ToolButton5: TToolButton;
    FormStorage: TJvFormStorage;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1_FK_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_FK_MEDIC_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_fc_medic: TcxGridDBColumn;
    cxGrid1DBTableView1_FN_KOL: TcxGridDBColumn;
    odsTTreb_Quota: TOracleDataSet;
    dsTTreb_Quota: TDataSource;
    cxGrid1DBTableView1_FD_DATE1: TcxGridDBColumn;
    cxGrid1DBTableView1_FD_DATE2: TcxGridDBColumn;
    Panel1: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    Panel2: TPanel;
    dedDate1: TcxDateEdit;
    dedDate2: TcxDateEdit;
    chbDate1: TcxCheckBox;
    chbDate2: TcxCheckBox;
    pmFilterPeriod: TPopupMenu;
    N19: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    ToolButton2: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acDelExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerDataChanged(
      Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure chbDate1Click(Sender: TObject);
    procedure chbDate2Click(Sender: TObject);
    procedure dedDate1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FNotRefresh : Boolean;
  public
    { Public declarations }
  end;

var
  fmTreb_Quota: TfmTreb_Quota;

procedure DoShowTrebQuota;

implementation

uses fmainform, fdmMain, DateUtils, fTreb_Quota_Edit;

{$R *.DFM}

procedure DoShowTrebQuota;
begin
	fmTreb_Quota := TfmTreb_Quota.Create(Application);
  if not frmMain.RestoreMDI_Window('fmTreb_Quota') then
      fmTreb_Quota.FormStyle := fsMDIChild;
end;

procedure TfmTreb_Quota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfmTreb_Quota.FormCreate(Sender: TObject);
begin
//  FNotRefresh := True;
//  chbDate1.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate1Checked',  'TRUE')) = 'TRUE';
//  chbDate2.Checked := UpperCase(IniReadString( iniFileName, Self.Name, 'dpeDate2Checked',  'TRUE')) = 'TRUE';
//  dedDate1.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate1Date', DateToStr(CurDate)));
//  dedDate2.EditValue := StrToDate(IniReadString( iniFileName, Self.Name, 'dpeDate2Date', DateToStr(CurDate)));
//  // если дата из настроек не влючает сегодняшний день, то ставим периодом текущий день
//  if (chbDate1.Checked)and(Trunc(dedDate1.Date) > CurDate)or(Trunc(dedDate2.Date) < CurDate)and(chbDate2.Checked) then
//  begin
//    dedDate1.EditValue := CurDate;
//    dedDate2.EditValue := CurDate;
//  end;
//  FNotRefresh := False;

//  acRefresh.Execute;
  odsTTreb_Quota.Open;
end;

procedure TfmTreb_Quota.N19Click(Sender: TObject);
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
  end;

  chbDate1.Checked := (TMenuItem(Sender).Tag <> 0);
  chbDate2.Checked := (TMenuItem(Sender).Tag <> 0);
  FNotRefresh := False;
  acRefresh.Execute;  
end;

procedure TfmTreb_Quota.acDelExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы действительно хотите удалить этот источник финансирования?',
                             'Подвердите действие', MB_YESNO + MB_ICONQUESTION) = IDYES) then
  begin
    cxGrid1DBTableView1.DataController.DeleteFocused;
    dmMain.os.Commit;
  end;
end;

procedure TfmTreb_Quota.acEditExecute(Sender: TObject);
var
  pID : integer;
begin
  pID := odsTTreb_Quota.FieldByName('FK_ID').AsInteger;
  if DoShowQuotaEdit( pID ) = mrOk then
    odsTTreb_Quota.RefreshRecord; 
end;

procedure TfmTreb_Quota.acAddExecute(Sender: TObject);
var
  pID : integer;
begin
  pID := -1;
  if DoShowQuotaEdit( pID ) = mrOk then
  begin
    odsTTreb_Quota.Close;
    odsTTreb_Quota.Open;
    odsTTreb_Quota.Locate('FK_ID', pID, []);
  end;
end;

procedure TfmTreb_Quota.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmTreb_Quota.acRefreshExecute(Sender: TObject);
var
  date_temp : TDate;
  s : string;
begin
  if FNotRefresh then Exit;

  odsTTreb_Quota.Close;

  if TRUNC(dedDate1.Date) > TRUNC(dedDate2.Date) then
  begin
    date_temp := dedDate1.Date;
    dedDate1.Date := dedDate2.Date;
    dedDate2.Date := date_temp;
  end;
  odsTTreb_Quota.SetVariable('DATE1', TRUNC(dedDate1.Date));
  odsTTreb_Quota.SetVariable('DATE2', TRUNC(dedDate2.Date));
  s := 'Квоты :: Период:';
  case chbDate1.Checked of
    TRUE :
    begin
      odsTTreb_Quota.SetVariable('FILTERED_BY_DATE1', 1);
      s := s + ' c '+DateToStr(dedDate1.Date);
    end;

    FALSE: odsTTreb_Quota.SetVariable('FILTERED_BY_DATE1', 0);
  end;
  case chbDate2.Checked of
    TRUE :
    begin
      odsTTreb_Quota.SetVariable('FILTERED_BY_DATE2', 1);
      s := s + ' по '+DateToStr(dedDate2.Date);
    end;

    FALSE: odsTTreb_Quota.SetVariable('FILTERED_BY_DATE2', 0);
  end;

  if (chbDate1.Checked or chbDate2.Checked) = False then
    s := 'Квоты :: Без периода';

  Self.Caption := s;
  odsTTreb_Quota.Open;
end;

procedure TfmTreb_Quota.chbDate1Click(Sender: TObject);
begin
  dedDate1.Enabled := chbDate1.Checked;
  acRefresh.Execute;
end;

procedure TfmTreb_Quota.chbDate2Click(Sender: TObject);
begin
  dedDate2.Enabled := chbDate2.Checked;
  acRefresh.Execute;
end;

procedure TfmTreb_Quota.cxGrid1DBTableView1DataControllerDataChanged(Sender: TObject);
begin
  acDel.Enabled := (cxGrid1DBTableView1.DataController.RecordCount > 0);
end;

procedure TfmTreb_Quota.dedDate1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then acRefresh.Execute;
end;

end.
