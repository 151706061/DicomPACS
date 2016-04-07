unit fNaznList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Oracle,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin, OracleData, cxCheckBox,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, JvExControls, JvArrowButton, ExtCtrls, ActnList, Menus, JvComponentBase,
  JvFormPlacement;

type
  TNazMedLechRec = packed record
    FK_NAZMEDLECHID : integer;
    FK_NAZMEDID : Integer;
    FK_MEDICID : integer; // код объекта учета
    FC_NAZMEDLECH : string;
    FN_DAY_DOZE : Double;  // суточная доза
  end;

  TNazMedLechArr = array of TNazMedLechRec;

  TfrmNaznList = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    grNaznList: TcxGrid;
    grNaznListDBTableView1: TcxGridDBTableView;
    grNaznListDBTableView1FK_NAZMEDID: TcxGridDBColumn;
    grNaznListDBTableView1FK_NAZMEDLECHID: TcxGridDBColumn;
    grNaznListDBTableView1FK_PACID: TcxGridDBColumn;
    grNaznListDBTableView1FC_NAZNSOTR: TcxGridDBColumn;
    grNaznListDBTableView1FC_PACFIO: TcxGridDBColumn;
    grNaznListDBTableView1FC_ROOM: TcxGridDBColumn;
    grNaznListDBTableView1FC_OTDELENIE: TcxGridDBColumn;
    grNaznListDBTableView1FD_BEGIN: TcxGridDBColumn;
    grNaznListDBTableView1FK_NAZN_MEDICID: TcxGridDBColumn;
    grNaznListDBTableView1FC_NAZ_MEDIC: TcxGridDBColumn;
    grNaznListDBTableView1FN_COURSEKOL: TcxGridDBColumn;
    grNaznListDBTableView1FC_ED_IZM: TcxGridDBColumn;
    grNaznListDBTableView1FK_NAZNSOTRID: TcxGridDBColumn;
    grNaznListDBTableView1FK_STATE: TcxGridDBColumn;
    grNaznListDBTableView1FC_STATUS: TcxGridDBColumn;
    grNaznListLevel1: TcxGridLevel;
    dsNaznList: TDataSource;
    odsNaznList: TOracleDataSet;
    al: TActionList;
    acSelect: TAction;
    acRefresh: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    pnChoosePeriod: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    Panel3: TPanel;
    dedDate1: TcxDateEdit;
    dedDate2: TcxDateEdit;
    chbDate1: TcxCheckBox;
    chbDate2: TcxCheckBox;
    ToolButton4: TToolButton;
    pmDocsFilterPeriod: TPopupMenu;
    N19: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    FormStorage: TJvFormStorage;
    grNaznListDBTableView1FK_MEDICID: TcxGridDBColumn;
    grNaznListDBTableView1FN_ZATR_KOL: TcxGridDBColumn;
    grNaznListDBTableView1FC_ZATR_EI: TcxGridDBColumn;
    grNaznListDBTableView1FC_NAZMEDLECH: TcxGridDBColumn;
    grNaznListDBTableView1FN_DAY_DOZE: TcxGridDBColumn;
    grNaznListDBTableView1FN_OTP_KOL: TcxGridDBColumn;
    grNaznListDBTableView1FC_OTP_EI: TcxGridDBColumn;
    grNaznListDBTableView1FN_OTP_FAS_KOL: TcxGridDBColumn;
    grNaznListDBTableView1FC_OTP_FAS_EI: TcxGridDBColumn;
    procedure chbDate1Click(Sender: TObject);
    procedure chbDate2Click(Sender: TObject);
    procedure dedDate1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dedDate1PropertiesEditValueChanged(Sender: TObject);
    procedure dedDate1PropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure N19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure alUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grNaznListDBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
      AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    fMoGroupId : Integer;
    fPacId : Integer;
    fIsRefreshed : Boolean;
    fSelectedNaznArr : TNazMedLechArr;
  public
    { Public declarations }
    property MoGroupId : Integer read fMoGroupId write fMoGroupId;
    property PacId : Integer read  fPacId write fPacId;
    property SelectedNazn : TNazMedLechArr read fSelectedNaznArr; // массив выбранных назначений

  end;

  function DoSelectNazn ( AMoGroupIdFrom : Integer; APacId : integer; ADetailCaption : string; AMultiSelect : boolean ) : TNazMedLechArr;

implementation

uses fdmMain, DateUtils;

{$R *.dfm}
{-------------------------------------------------------------------------------
  Функция:    DoSelectNazn
  Назначение: Выбор назначений из списка
  Автор:      Яковенко Д.П.
  Дата:       03.07.2014
  Входные параметры: AMoGroupIdFrom : Integer; APacId : integer; ADetailCaption : string; AMultiSelect : boolean
  Результат:  TNazMedLechArr
-------------------------------------------------------------------------------}
function DoSelectNazn ( AMoGroupIdFrom : Integer; APacId : integer; ADetailCaption : string; AMultiSelect : boolean ) : TNazMedLechArr;
var
  frmNaznList: TfrmNaznList;
  fNazMedLechArr : TNazMedLechArr;
begin
  frmNaznList := nil;

  try
    try
      frmNaznList := TfrmNaznList.Create( Application );

      with frmNaznList do
      begin
        grNaznListDBTableView1.OptionsSelection.MultiSelect := AMultiSelect;
        MoGroupId := AMoGroupIdFrom;
        PacId := APacId;

        if AMoGroupIdFrom > 0 then
          Caption := 'Назначения группы МО "' + ADetailCaption + '"'
        else
        if APacId > 0 then
          Caption := 'Назначения пациента ' + ADetailCaption;

        if (ShowModal = mrOk) then
        begin
          fNazMedLechArr := SelectedNazn;
        end;
      end;

      SetLength( fNazMedLechArr, Length(fNazMedLechArr ) );
    except
      SetLength( fNazMedLechArr, 0 );
    end;
  finally
    FreeAndNil(frmNaznList);
  end;

  Result := fNazMedLechArr;
end;

procedure TfrmNaznList.acRefreshExecute(Sender: TObject);
begin
  with odsNaznList do
  try
    Close;
    SetVariable ( 'PFILTERED_BY_DATEFROM', Integer ( chbDate1.Checked ) );
    SetVariable ( 'PDATEFROM', dedDate1.Date );
    SetVariable ( 'PFILTERED_BY_DATETO', Integer ( chbDate2.Checked ) );
    SetVariable ( 'PDATETO', dedDate2.Date );
    SetVariable ( 'PMOID', MoGroupId );
    SetVariable ( 'PPACID', PacId );

    odsNaznList.Open;
    odsNaznList.First;
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( 'Ошибка при открытии списка назначений!' + #13#10 + e.Message ), 'Ошибка', MB_OK + MB_ICONERROR );
      Close;
      ModalResult := mrCancel;
    end;
  end;

  if (grNaznList.ActiveView.DataController.RecordCount > 0) then // делаем "выбранной" строку
    grNaznList.ActiveView.DataController.SelectRows( grNaznList.ActiveView.DataController.FocusedRowIndex,  grNaznList.ActiveView.DataController.FocusedRowIndex);

end;

procedure TfrmNaznList.acSelectExecute(Sender: TObject);
var
  SelectedCount, SelectedNaznCnt, i, j : Integer;
begin
  SelectedCount := grNaznListDBTableView1.Controller.SelectedRowCount; // выбранные строки
  SelectedNaznCnt := 0;  // кол-во выбранных назначений

  for i := 0 to SelectedCount - 1 do
  begin
    if grNaznListDBTableView1.Controller.SelectedRows[i].IsData then
      Inc( SelectedNaznCnt );
  end;

  if ( SelectedNaznCnt = 0 ) then
  begin
    Application.MessageBox( 'Не выбрано ни одного назначения!', 'Внимание', MB_OK + MB_ICONSTOP );
    Exit;
  end;

  SetLength( fSelectedNaznArr, SelectedNaznCnt );

  j := 0;
  for I := 0 to SelectedCount-1 do
  begin
    if grNaznListDBTableView1.Controller.SelectedRows[i].IsData then
    begin
      with fSelectedNaznArr[j] do
      begin
        FK_NAZMEDLECHID := grNaznListDBTableView1.Controller.SelectedRows[i].Values [grNaznListDBTableView1FK_NAZMEDLECHID.Index];
        FK_NAZMEDID := grNaznListDBTableView1.Controller.SelectedRows[i].Values [grNaznListDBTableView1FK_NAZMEDID.Index];
        FK_MEDICID := nvl ( grNaznListDBTableView1.Controller.SelectedRows[i].Values [grNaznListDBTableView1FK_MEDICID.Index], -1 );
        FC_NAZMEDLECH := VarToStr( grNaznListDBTableView1.Controller.SelectedRows[i].Values [grNaznListDBTableView1FC_NAZMEDLECH.Index] );
        FN_DAY_DOZE := nvl ( grNaznListDBTableView1.Controller.SelectedRows[i].Values [grNaznListDBTableView1FN_DAY_DOZE.Index] , 0 );
      end;
      Inc( j );
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmNaznList.alUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  acSelect.Enabled := ( grNaznListDBTableView1.Controller.SelectedRecordCount > 0 );
end;

procedure TfrmNaznList.chbDate1Click(Sender: TObject);
begin
  dedDate1.Enabled := chbDate1.Checked;
  if fIsRefreshed then
    acRefresh.Execute;
end;

procedure TfrmNaznList.chbDate2Click(Sender: TObject);
begin
  dedDate2.Enabled := chbDate2.Checked;
  if fIsRefreshed then
    acRefresh.Execute;
end;

procedure TfrmNaznList.dedDate1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    acRefresh.Execute;
end;

procedure TfrmNaznList.dedDate1PropertiesEditValueChanged(Sender: TObject);
begin
  if fIsRefreshed then
    acRefresh.Execute;
end;

procedure TfrmNaznList.dedDate1PropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  cxDateEdit_PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;

procedure TfrmNaznList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmNaznList.FormCreate(Sender: TObject);
begin
  fIsRefreshed := False;
  fMoGroupId := -1;
  fPacId := -1;
end;

procedure TfrmNaznList.FormShow(Sender: TObject);
begin
  if VarIsNullDate ( dedDate1.EditValue ) or ( dedDate1.Date = 0 ) then
    dedDate1.Date := Date;

  if VarIsNullDate ( dedDate2.EditValue ) or ( dedDate2.Date = 0 ) then
    dedDate2.Date := Date;

  fIsRefreshed := True;

  acRefresh.Execute;
end;

procedure TfrmNaznList.grNaznListDBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  acSelect.Execute;
end;

procedure TfrmNaznList.N19Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender)
    then Exit;

  CurDate := ServerDate(dmMain.os);
  try
    fIsRefreshed := False;

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
  finally
    fIsRefreshed := True;
  end;

  acRefresh.Execute;
end;
end.
