unit fMain;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, FR_DSet, FR_Class, FR_DBSet,
  DBCtrls, FR_Desgn, frOLEExl, frXMLExl, JvExMask, JvToolEdit, OracleMonitor,
  JvStringHolder, cxGraphics, Menus, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckComboBox, cxCheckBox, Excel2000, cxGroupBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxSpinEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGrid, cxDBData, cxDBLookupComboBox, cxGridDBTableView, cxSplitter,
  cxMemo, cxCalendar, cxLookupEdit, cxDBLookupEdit, JvFormPlacement,
  JvComponentBase, JvAppStorage, JvAppIniStorage, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, frxClass, frxDBSet, frxExportXLS,
  frxExportRTF, fCryptUtils, JvExControls, JvArrowButton, cxImageComboBox;

type
  TfrmGetPeriod = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    acExit: TAction;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    oqInitMO: TOracleQuery;
    cxGroupBox2: TcxGroupBox;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    cxSplitter1: TcxSplitter;
    cxGroupBox4: TcxGroupBox;
    os: TOracleSession;
    ToolButton6: TToolButton;
    lcbMO_GROUP: TcxLookupComboBox;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;
    acRefresh: TAction;
    ToolButton7: TToolButton;
    odsTreb: TOracleDataSet;
    odsMedic: TOracleDataSet;
    dsMedic: TDataSource;
    cxSplitter2: TcxSplitter;
    tbuEDS: TToolButton;
    cxGridTrebDpc: TcxGrid;
    cxGridTrebDpcDBTableView1: TcxGridDBTableView;
    cxGridTrebDpcDBTableView1ROWNUM: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FC_MEDIC: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FC_NAME_LAT: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FC_EDIZM: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FN_KOL: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FK_ID: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FD_CREATE: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FK_CREATE_MO_ID: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FD_EDIT: TcxGridDBColumn;
    cxGridTrebDpcDBTableView1FK_EDIT_MO_ID: TcxGridDBColumn;
    cxGridTrebDpcLevel1: TcxGridLevel;
    tbuRefresh: TToolButton;
    Panel1: TPanel;
    grTrebLst: TcxGrid;
    grTrebLstLevel1: TcxGridLevel;
    grTrebLstTableView1: TcxGridTableView;
    grTrebLstTableView1_FD_DATE: TcxGridColumn;
    grTrebLstTableView1_FC_TREB: TcxGridColumn;
    grTrebLstTableView1_FC_GROUPFROM_WITH_NAME: TcxGridColumn;
    grTrebLstTableView1_FC_GROUPTO_WITH_NAME: TcxGridColumn;
    grTrebLstTableView1_FC_COMMENT: TcxGridColumn;
    grTrebLstTableView1_FC_PROCESSED: TcxGridColumn;
    grTrebLstTableView1_FL_CITO: TcxGridColumn;
    grTrebLstTableView1_FK_ID: TcxGridColumn;
    Panel2: TPanel;
    abuSetDocPeriod: TJvArrowButton;
    Panel3: TPanel;
    dedDate1: TcxDateEdit;
    dedDate2: TcxDateEdit;
    chbDate1: TcxCheckBox;
    chbDate2: TcxCheckBox;
    pmDocsFilterPeriod: TPopupMenu;
    N19: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    N1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    grTrebLstTableView1_FL_ECP1: TcxGridColumn;
    grTrebLstTableView1_FL_ECP2: TcxGridColumn;
    grTrebLstTableView1_FL_ECP3: TcxGridColumn;
    imlECP1: TImageList;
    imlECP2: TImageList;
    imlECP3: TImageList;
    grTrebLstTableView1_ECP1_FK_ID: TcxGridColumn;
    grTrebLstTableView1_ECP2_FK_ID: TcxGridColumn;
    grTrebLstTableView1_ECP3_FK_ID: TcxGridColumn;
    acSign: TAction;
    acUnsign: TAction;
    oqDelSign: TOracleQuery;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    grTrebLstTableView1_ECP1_NOTE: TcxGridColumn;
    grTrebLstTableView1_ECP2_NOTE: TcxGridColumn;
    grTrebLstTableView1_ECP3_NOTE: TcxGridColumn;
    odsTreb_by_ID: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acRefreshExecute(Sender: TObject);
    procedure lcbMO_GROUPPropertiesEditValueChanged(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure dedDate1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dedDate1PropertiesEditValueChanged(Sender: TObject);
    procedure chbDate1Click(Sender: TObject);
    procedure chbDate2Click(Sender: TObject);
    procedure grTrebLstTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure acSignExecute(Sender: TObject);
    procedure acUnsignExecute(Sender: TObject);
    procedure grTrebLstTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);

  PRIVATE
    { Private declarations }
    FCryptoProUtils : TCryptoProUils;
    FK_APPSOTR_ID, FK_SOTR_ID, CUR_ECP_NUM : integer;
    FNotRefresh : boolean;
    ECP1_RULE_ID, ECP2_RULE_ID, ECP3_RULE_ID
    ,FK_CUR_SIGN_SQL_RULES_ID : variant;
    isUpdateSignNotes : boolean;

    procedure UpdateCurTrebECP( aRow : integer );
    procedure ChangeFocusedRow;
  PUBLIC
    { Public declarations }
  end;


var
  frmGetPeriod      : TfrmGetPeriod;

implementation

uses
  Variants, IniFiles, Math, ComObj, DateUtils, cxGridExportLink, ShellAPI,
  SMMainAPI;
{$R *.DFM}

//==============================================================================
function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	Result := ini.ReadString(Section, Ident, Default);
	ini.free;
end;

procedure IniWriteString(sIniFile: string; Section, Ident: string; val: string = '');
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	ini.WriteString(Section, Ident, val);
	ini.free;
end;

procedure TfrmGetPeriod.FormCreate(Sender: TObject);
var
  fltMain: TcxFilterCriteriaItemList;
//  FK_APPSOTR_ID : Integer;
begin
  try
    {$IFDEF OLD_AUTH}
    os.LogonDatabase := 'ASU';
    os.LogonUsername := 'ASU';
    os.LogonPassword := 'ASU';
    os.LogOn;
    {$ELSE}
    os.LogonDatabase := 'ASU';
    GetSession(os, 'ASU');
    {$ENDIF}
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  isUpdateSignNotes := true;
  FCryptoProUtils := TCryptoProUils.Create(os);

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;
  FK_SOTR_ID := oqInitMO.GetVariable('PSOTRID');
  FK_CUR_SIGN_SQL_RULES_ID := oqInitMO.GetVariable('FK_SIGN_SQL_RULES_ID');

  Self.Caption := Application.Title;

  // достаем используемые правила подписи (med.ttreb1 и т.д.)
  ECP1_RULE_ID := oqInitMO.GetVariable('ECP1_RULE_ID');
  ECP2_RULE_ID := oqInitMO.GetVariable('ECP2_RULE_ID');
  ECP3_RULE_ID := oqInitMO.GetVariable('ECP3_RULE_ID');

  CUR_ECP_NUM := 0; // номер подписи для текущего пользователя
  if FK_CUR_SIGN_SQL_RULES_ID <> null then
  begin
    if FK_CUR_SIGN_SQL_RULES_ID = ECP1_RULE_ID then
      CUR_ECP_NUM := 1
    else
      if FK_CUR_SIGN_SQL_RULES_ID = ECP2_RULE_ID then
        CUR_ECP_NUM := 2
      else
        if FK_CUR_SIGN_SQL_RULES_ID = ECP3_RULE_ID then
          CUR_ECP_NUM := 3;
  end;

  odsTreb.SetVariable('ECP1_RULE_ID', ECP1_RULE_ID);
  odsTreb.SetVariable('ECP2_RULE_ID', ECP2_RULE_ID);
  odsTreb.SetVariable('ECP3_RULE_ID', ECP3_RULE_ID);

  odsTreb_by_ID.SetVariable('ECP1_RULE_ID', ECP1_RULE_ID);
  odsTreb_by_ID.SetVariable('ECP2_RULE_ID', ECP2_RULE_ID);
  odsTreb_by_ID.SetVariable('ECP3_RULE_ID', ECP3_RULE_ID);

  odsGroupMo.Open;
  FNotRefresh := True;
  lcbMO_GROUP.EditValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', IntToStr(odsGroupMo.FieldByName('groupid').AsInteger)));
  FNotRefresh := False;

  N19Click( N20 ); // ставим период - сегодня, рефреш делается сам

  // делаем фильтр по неотпущенным требованиям (чтоб меньше лишнего отображать)
  fltMain := grTrebLstTableView1.DataController.Filter.Root;
  fltMain.Clear;
  fltMain.BoolOperatorKind := fboAnd;

  fltMain.AddItem( grTrebLstTableView1.Columns[ Self.grTrebLstTableView1_FC_PROCESSED.index ], foEqual, 'Не отпущено', 'Не отпущено' );
  grTrebLstTableView1.DataController.Filter.Active := True;
end;

procedure TfrmGetPeriod.lcbMO_GROUPPropertiesEditValueChanged(Sender: TObject);
begin
  acRefresh.Execute;
end;

procedure TfrmGetPeriod.N19Click(Sender: TObject);
var
  CurDate : TDate;
begin
  if not Assigned(Sender) then Exit;
  FNotRefresh := True;
  CurDate := oqInitMO.GetVariable('PSYSDATE');
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

    6:  // вчера
    begin
      dedDate1.EditValue := Trunc(CurDate-1);
      dedDate2.EditValue := Trunc(CurDate-1);
    end;
  end;

  chbDate1.Checked := (TMenuItem(Sender).Tag <> 0);
  chbDate2.Checked := (TMenuItem(Sender).Tag <> 0);
  FNotRefresh := False;
    
  acrefresh.Execute;
end;

procedure TfrmGetPeriod.ChangeFocusedRow;
begin
  tbuEDS.Enabled := (CUR_ECP_NUM > 0)and(grTrebLstTableView1.DataController.RecordCount > 0);

  odsMedic.Close;
  if grTrebLstTableView1.DataController.RecordCount > 0 then
  begin
    grTrebLstTableView1.DataController.Post( True );
    odsMedic.SetVariable('FK_TREBID', grTrebLstTableView1_FK_ID.EditValue);
    odsMedic.Open;
  // выставление статуса ЭЦП - наличие и валидность
    UpdateCurTrebECP( grTrebLstTableView1.DataController.FocusedRecordIndex );

    case CUR_ECP_NUM of
      1:
      begin
        if grTrebLstTableView1_FL_ECP1.EditValue = 1 then
          tbuEDS.Action := acUnsign
        else
          tbuEDS.Action := acsign;
      end;

      2:
      begin
        if grTrebLstTableView1_FL_ECP2.EditValue = 1 then
          tbuEDS.Action := acUnsign
        else
          tbuEDS.Action := acsign;
      end;

      3:
      begin
        if grTrebLstTableView1_FL_ECP3.EditValue = 1 then
          tbuEDS.Action := acUnsign
        else
          tbuEDS.Action := acsign;
      end;
    end;
  end;
end;

procedure TfrmGetPeriod.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.UpdateCurTrebECP( aRow : integer );
begin
  // выставление статуса ЭЦП - наличие и валидность
  if grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_ECP1_FK_ID.Index] = null then
    grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FL_ECP1.Index] := 0
  else
    case FCryptoProUtils.CheckSign( grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_ECP1_FK_ID.Index] ) of
      True : grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FL_ECP1.Index] := 1;
      False: grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FL_ECP1.Index] := -1;
    end;

  if grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_ECP2_FK_ID.Index] = Null then
    grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FL_ECP2.Index] := 0
  else
    case FCryptoProUtils.CheckSign( grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_ECP2_FK_ID.Index] ) of
      True : grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FL_ECP2.Index] := 1;
      False: grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FL_ECP2.Index] := -1;
    end;

  if grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_ECP3_FK_ID.Index] = Null then
    grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FL_ECP3.Index] := 0
  else
    case FCryptoProUtils.CheckSign( grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_ECP3_FK_ID.Index] ) of
      True : grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FL_ECP3.Index] := 1;
      False: grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FL_ECP3.Index] := -1;
    end;

  if isUpdateSignNotes then
  begin
    // проставляем информацию о подписавших
    odsTreb_by_ID.Close;
    odsTreb_by_ID.SetVariable('fk_id', grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_FK_ID.Index]);
    odsTreb_by_ID.Open;

    grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_ECP1_NOTE.Index] := odsTreb_by_ID.FieldByName('ECP1_NOTE').AsVariant;
    grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_ECP2_NOTE.Index] := odsTreb_by_ID.FieldByName('ECP2_NOTE').AsVariant;
    grTrebLstTableView1.DataController.Values[aRow, grTrebLstTableView1_ECP3_NOTE.Index] := odsTreb_by_ID.FieldByName('ECP3_NOTE').AsVariant;

    odsTreb_by_ID.Close;
  end;
end;

procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.EditValue));

  Action := caFree;
end;


procedure TfrmGetPeriod.acRefreshExecute(Sender: TObject);
var
  date_temp : TDateTime;
  s : string;
  Row : integer;
begin
  if FNotRefresh then Exit;

  odsTreb.Close;
  odsTreb.AfterScroll := nil;

  if TRUNC(dedDate1.Date) > TRUNC(dedDate2.Date) then
  begin
    date_temp := dedDate1.Date;
    dedDate1.Date := dedDate2.Date;
    dedDate2.Date := date_temp;
  end;
  odsTreb.SetVariable('DATE1', TRUNC(dedDate1.Date));
  odsTreb.SetVariable('DATE2', TRUNC(dedDate2.Date));
  s := 'Список требований :: Период:';
  case chbDate1.Checked of
    TRUE :
    begin
      odsTreb.SetVariable('FILTERED_BY_DATE1', 1);
      s := s + ' c '+DateToStr(dedDate1.Date);
    end;

    FALSE: odsTreb.SetVariable('FILTERED_BY_DATE1', 0);
  end;
  case chbDate2.Checked of
    TRUE :
    begin
      odsTreb.SetVariable('FILTERED_BY_DATE2', 1);
      s := s + ' по '+DateToStr(dedDate2.Date);
    end;

    FALSE: odsTreb.SetVariable('FILTERED_BY_DATE2', 0);
  end;

  if (chbDate1.Checked or chbDate2.Checked) = False then
    s := 'Список требований :: Без периода';

  Self.Caption := s;

  odsTreb.SetVariable('CUR_MOGROUP', lcbMO_GROUP.EditValue);
  odsTreb.Open;

  grTrebLstTableView1.DataController.RecordCount := 0;
  grTrebLstTableView1.DataController.RecordCount := odsTreb.RecordCount;
  Row := 0;

  isUpdateSignNotes := False;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  grTrebLstTableView1.BeginUpdate;
  // заполняем таблицу с требованиями
  while odsTreb.Eof = False do
  begin
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_FD_DATE.Index]                := odsTreb.FieldByName('FD_DATE').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_FC_TREB.Index]                := odsTreb.FieldByName('FC_TREB').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_FC_GROUPFROM_WITH_NAME.Index] := odsTreb.FieldByName('FC_GROUPFROM_WITH_NAME').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_FC_GROUPTO_WITH_NAME.Index]   := odsTreb.FieldByName('FC_GROUPTO_WITH_NAME').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_FC_COMMENT.Index]             := odsTreb.FieldByName('FC_COMMENT').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_FC_PROCESSED.Index]           := odsTreb.FieldByName('FC_PROCESSED').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_FL_CITO.Index]                := odsTreb.FieldByName('FL_CITO').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_FK_ID.Index]                  := odsTreb.FieldByName('FK_ID').AsVariant;

    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_ECP1_FK_ID.Index]             := odsTreb.FieldByName('ECP1_FK_ID').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_ECP2_FK_ID.Index]             := odsTreb.FieldByName('ECP2_FK_ID').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_ECP3_FK_ID.Index]             := odsTreb.FieldByName('ECP3_FK_ID').AsVariant;

    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_ECP1_NOTE.Index]              := odsTreb.FieldByName('ECP1_NOTE').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_ECP2_NOTE.Index]              := odsTreb.FieldByName('ECP2_NOTE').AsVariant;
    grTrebLstTableView1.DataController.Values[Row, grTrebLstTableView1_ECP3_NOTE.Index]              := odsTreb.FieldByName('ECP3_NOTE').AsVariant;

    // выставление статуса ЭЦП - наличие и валидность

    UpdateCurTrebECP( Row );

//    grTrebLstTableView1.DataController.Post(True);

    odsTreb.Next;
    inc( Row )
  end;
  grTrebLstTableView1.EndUpdate;
  Screen.Cursor := crDefault;

  odsTreb.Close;
  tbuEDS.Enabled := (grTrebLstTableView1.DataController.RecordCount > 0)and
                    (VarIsNull(FK_CUR_SIGN_SQL_RULES_ID) = False);
  isUpdateSignNotes := True;                    
end;

procedure TfrmGetPeriod.acSignExecute(Sender: TObject);
var
  ECP_ID : integer;
begin
  if VarIsNull(FK_CUR_SIGN_SQL_RULES_ID) = False then // смотрим какую подпись чел может юзать
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    try
      case   CUR_ECP_NUM of
        1: oqDelSign.SetVariable('FK_ID', grTrebLstTableView1_ECP1_FK_ID.EditValue);
        2: oqDelSign.SetVariable('FK_ID', grTrebLstTableView1_ECP2_FK_ID.EditValue);
        3: oqDelSign.SetVariable('FK_ID', grTrebLstTableView1_ECP3_FK_ID.EditValue);
      end;
      
      ECP_ID := FCryptoProUtils.SignBySotr(FK_CUR_SIGN_SQL_RULES_ID, grTrebLstTableView1_FK_ID.EditValue, FK_SOTR_ID);

      if ECP_ID > 0 then
      begin
        // в зависимости от текущего пользователя ставин нужную подпись
        case   CUR_ECP_NUM of
          1: grTrebLstTableView1_ECP1_FK_ID.EditValue := ECP_ID;
          2: grTrebLstTableView1_ECP2_FK_ID.EditValue := ECP_ID;
          3: grTrebLstTableView1_ECP3_FK_ID.EditValue := ECP_ID;
        end;
        oqDelSign.Execute;
      end;
    finally
      ChangeFocusedRow;      
      Screen.Cursor := crDefault;
    end;
  end
  else
    Application.MessageBox('У Вас нет права ставить электронно-цифровую подпись на требование', 'ВНИМАНИЕ', MB_OK);
end;

procedure TfrmGetPeriod.acUnsignExecute(Sender: TObject);
begin
  case CUR_ECP_NUM of
    1: oqDelSign.SetVariable('FK_ID', grTrebLstTableView1_ECP1_FK_ID.EditValue);
    2: oqDelSign.SetVariable('FK_ID', grTrebLstTableView1_ECP2_FK_ID.EditValue);
    3: oqDelSign.SetVariable('FK_ID', grTrebLstTableView1_ECP3_FK_ID.EditValue);
  end;
  oqDelSign.Execute;

  // сразу же отмечаем в таблице удаление подписи
  case CUR_ECP_NUM of
    1:
    begin
      grTrebLstTableView1_ECP1_FK_ID.EditValue := null;
      grTrebLstTableView1_FL_ECP1.EditValue    := 0;
    end;
    2:
    begin
      grTrebLstTableView1_ECP2_FK_ID.EditValue := null;
      grTrebLstTableView1_FL_ECP2.EditValue    := 0;
    end;
    3:
    begin
      grTrebLstTableView1_ECP3_FK_ID.EditValue := null;
      grTrebLstTableView1_FL_ECP3.EditValue    := 0;
    end;
  end;

  ChangeFocusedRow;
end;

procedure TfrmGetPeriod.chbDate1Click(Sender: TObject);
begin
  dedDate1.Enabled := chbDate1.Checked;
  acrefresh.Execute;
end;

procedure TfrmGetPeriod.chbDate2Click(Sender: TObject);
begin
  dedDate2.Enabled := chbDate2.Checked;
  acRefresh.Execute;
end;

procedure TfrmGetPeriod.grTrebLstTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[ grTrebLstTableView1_FL_ECP1.Index ] = -1)and(AViewInfo.Item.Index = grTrebLstTableView1_ECP1_NOTE.Index) then
  begin
    ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeOut];
    ACanvas.Font.Color := clRed;
  end;
  if (AViewInfo.GridRecord.Values[ grTrebLstTableView1_FL_ECP2.Index ] = -1)and(AViewInfo.Item.Index = grTrebLstTableView1_ECP2_NOTE.Index) then
  begin
    ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeOut];
    ACanvas.Font.Color := clRed;
  end;
  if (AViewInfo.GridRecord.Values[ grTrebLstTableView1_FL_ECP3.Index ] = -1)and(AViewInfo.Item.Index = grTrebLstTableView1_ECP3_NOTE.Index) then
  begin
    ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeOut];
    ACanvas.Font.Color := clRed;
  end;

  if (AViewInfo.GridRecord.Values[ grTrebLstTableView1_FL_ECP1.Index ] = 1)and(AViewInfo.Item.Index = grTrebLstTableView1_ECP1_NOTE.Index) then
  begin
    ACanvas.Font.Color := clGreen;
  end;
  if (AViewInfo.GridRecord.Values[ grTrebLstTableView1_FL_ECP2.Index ] = 1)and(AViewInfo.Item.Index = grTrebLstTableView1_ECP2_NOTE.Index) then
  begin
    ACanvas.Font.Color := clGreen;
  end;
  if (AViewInfo.GridRecord.Values[ grTrebLstTableView1_FL_ECP3.Index ] = 1)and(AViewInfo.Item.Index = grTrebLstTableView1_ECP3_NOTE.Index) then
  begin
    ACanvas.Font.Color := clGreen;
  end;
end;

procedure TfrmGetPeriod.grTrebLstTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  ChangeFocusedRow;
end;

procedure TfrmGetPeriod.dedDate1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then acRefresh.Execute;
end;

procedure TfrmGetPeriod.dedDate1PropertiesEditValueChanged(Sender: TObject);
begin
  acRefresh.Execute;
end;

end.

