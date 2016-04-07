unit fGetPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, OracleMonitor, Oracle, ActnList, ImgList, ComCtrls, ToolWin, dxLayoutControl, cxControls,
  DBCtrls, StdCtrls, Spin, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid,
  ExtCtrls, cxGridExportLink, ShellAPI, cxTextEdit, JvComponentBase, JvFormPlacement, cxConstantsRus, dxBarCustomize_Rus, JvAppStorage,
  JvAppIniStorage;

type
  TfrmGetPeriod = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    os: TOracleSession;
    ilImages: TImageList;
    alActions: TActionList;
    aSave: TAction;
    aCancel: TAction;
    acExcelExport: TAction;
    oqInitMO: TOracleQuery;
    odsRep: TOracleDataSet;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cbMonth: TComboBox;
    lci_cbMonth: TdxLayoutItem;
    edtYear: TSpinEdit;
    lci_edtYear: TdxLayoutItem;
    lcbRashType: TDBLookupComboBox;
    dxLayoutControl1Group1: TdxLayoutGroup;
    lcbMO_GROUP: TDBLookupComboBox;
    lci_lcbMO_GROUP: TdxLayoutItem;
    odsRashType: TOracleDataSet;
    dsRashType: TDataSource;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    Panel1: TPanel;
    grdRep: TcxGrid;
    grdRepLevel1: TcxGridLevel;
    grdRepDBBandedTableView1: TcxGridDBBandedTableView;
    dsRep: TDataSource;
    grdRepDBBandedTableView1_FC_DOC_TYPE: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FD_PERIOD_LAST_DATE: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_fc_mogroupid_from: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_fc_mogroupid_to: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_zametki: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FN_DOC_SUMM: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_fc_pod: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_fc_contrakt: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_fc_invoice: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_inn_post: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FC_MEDIC_NAME: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FC_UP_EDIZM: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FN_KOL: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FN_PRICE: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FN_SUMM: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FC_SERIAL: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FC_UCHGR: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FK_MEDICID: TcxGridDBBandedColumn;
    grdRepDBBandedTableView1_FC_FIN_SOURCE: TcxGridDBBandedColumn;
    btnExpot: TToolButton;
    sd: TSaveDialog;
    grdRepDBBandedTableView1_FC_DOC: TcxGridDBBandedColumn;
    JvFormStorage1: TJvFormStorage;
    lci_lcbRashType: TdxLayoutItem;
    dxLayoutControl1Group2: TdxLayoutGroup;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    lcbSpisanieVid: TDBLookupComboBox;
    lci_lcbSpisanieVid: TdxLayoutItem;
    dxLayoutControl1Group3: TdxLayoutGroup;
    odsSpisanieVid: TOracleDataSet;
    dsSpisanieVid: TDataSource;
    grdRepDBBandedTableView1_DPID: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure acExcelExportExecute(Sender: TObject);
    procedure dsRashTypeDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры
  public
    { Public declarations }
  end;

var
  frmGetPeriod: TfrmGetPeriod;

const
  CAPTION_ERROR = 'Ошибка';  

implementation

uses SMMainAPI, DateUtils;

{$R *.dfm}

procedure TfrmGetPeriod.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.acExcelExportExecute(Sender: TObject);
begin
  sd.FileName := 'Расход по типу ' + lcbRashType.Text + ' за ' + cbMonth.Text + ' ' + IntToStr( edtYear.Value ) + ' по группе МО ' + lcbMO_GROUP.Text + '.xls';
  if sd.Execute then
  try
    ExportGridToExcel(sd.FileName,grdRep);
    if Application.MessageBox('Открыть сохраненный документ?', 'Подтверждение', MB_YESNO+MB_ICONQUESTION) = IDYES	then
      ShellExecute( 0, PChar('open'), PChar(sd.FileName), nil, nil, SW_SHOWMAXIMIZED );
  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsichar( 'Ошибка при экспорте данных в Excel!'+#13#10 +e.Message),PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
      Exit;
    end;
  end;
end;

procedure TfrmGetPeriod.aSaveExecute(Sender: TObject);
var
  DateFrom, DateTo : TDateTime;
begin
  if VarIsNull ( lcbRashType.KeyValue ) or not ( lcbRashType.KeyValue > 0 ) then
  begin
    Application.MessageBox('Не выбран тип расхода!',PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
    Exit;
  end;

  if VarIsNull ( lcbMO_GROUP.KeyValue ) or not ( lcbMO_GROUP.KeyValue > 0 ) then
  begin
    Application.MessageBox('Не указана группа МО!',PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
    Exit;
  end;

  try
    DateFrom := EncodeDate( edtYear.Value, cbMonth.ItemIndex+1, 1 );
    DateTo := EndOfTheMonth ( DateFrom );

    odsRep.Close;
    odsRep.SetVariable( 'pCUR_MOGROUP', lcbMO_GROUP.KeyValue );
    odsRep.SetVariable( 'pFP_VIDMOVE', lcbRashType.KeyValue );
    odsRep.SetVariable( 'pDATE_FROM', DateFrom );
    odsRep.SetVariable( 'pDATE_TO', DateTo );
    if lcbRashType.KeyValue = 8 then
    begin
      odsRep.SetVariable( 'pSpisanieCond', 'and d.Fn_Spisanievid = ' + VarToStrDef( lcbSpisanieVid.KeyValue, '0' ) );
    end;
    odsRep.Open;

  except
    on e : Exception do
    begin
      Application.MessageBox( PAnsiChar( 'Ошибка при формировании отчета!' + #13#10+ e.Message),PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
      Exit;
    end;
  end;
end;

procedure TfrmGetPeriod.dsRashTypeDataChange(Sender: TObject; Field: TField);
begin
  lci_lcbSpisanieVid.Enabled := (lcbRashType.KeyValue = 8); // акт списания ТМЦ 
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);
  Action := caFree;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  FK_APPSOTR_ID, FK_MOGROUP, FL_PROVIZOR : Integer;
  LongMonthNames : array[1..12] of string;
  i : Integer;
  CurDate : TDate;

begin
  CurDate := Date;
  FK_MOGROUP := -1;
  FL_PROVIZOR := 0;
  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);

  try
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!',PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  try
    if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
      FK_APPSOTR_ID := -1;
    oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
    oqInitMO.Execute;

    CurDate := VarToDateTime( oqInitMO.GetVariable( 'pCurDate') );
    FK_MOGROUP := oqInitMO.GetVariable( 'NMO_GROUP');
    FL_PROVIZOR := oqInitMO.GetVariable( 'PFL_Provizor');
  except
    Application.MessageBox('Ошибка при инициализации сотрудника!',PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
    Application.Terminate;
  end;

  LongMonthNames[1] := 'Январь';
  LongMonthNames[2] := 'Февраль';
  LongMonthNames[3] := 'Март';
  LongMonthNames[4] := 'Апрель';
  LongMonthNames[5] := 'Май';
  LongMonthNames[6] := 'Июнь';
  LongMonthNames[7] := 'Июль';
  LongMonthNames[8] := 'Август';
  LongMonthNames[9] := 'Сентябрь';
  LongMonthNames[10] := 'Октябрь';
  LongMonthNames[11] := 'Ноябрь';
  LongMonthNames[12] := 'Декабрь';

  for i := 1 to Length (LongMonthNames)  do
  begin
    cbMonth.Items.Add( LongMonthNames[i] );
  end;
  cbMonth.ItemIndex := MonthOfTheYear( CurDate )-1;
  edtYear.Value := YearOf( CurDate );

  with odsRashType do
  try
    Close;
    Open;
    First;

    if not IsEmpty then
      lcbRashType.KeyValue := FieldByName( 'FP_VIDMOVE').AsInteger
    else
      lcbRashType.KeyValue := -1;
  except
    Application.MessageBox('Ошибка при получении списка типов расходов!',PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
  end;

  with odsGroupMo do
  try
    Close;
    SetVariable( 'pAppSotrID', FK_APPSOTR_ID );
    SetVariable( 'PFL_PROVIZOR', FL_PROVIZOR );
    Open;

    if (not IsEmpty) then
      if Locate ( 'GROUPID', FK_MOGROUP, [] )  then
        lcbMO_GROUP.KeyValue := FK_MOGROUP
      else
      begin
        First;
        lcbMO_GROUP.KeyValue := FieldByName( 'GROUPID' ).AsInteger;
      end
    else
      lcbMO_GROUP.KeyValue := -1;

    lcbMO_GROUP.Enabled := RecordCount > 1;
  except
    Application.MessageBox('Ошибка при получении групп МО пользователя!',PAnsiChar (CAPTION_ERROR),mb_ok + mb_iconerror);
  end;

  with odsSpisanieVid do
  try
    Close;
    Open;
    First;
    lcbSpisanieVid.KeyValue := odsSpisanieVid.FieldByName( 'FK_SPISANIEVID' ).AsInteger;
  except
  end;

end;

end.
