unit uUchBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, Oracle, ImgList, ComCtrls, ToolWin, OracleData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, frxClass,
  frxDBSet, cxCalendar, cxEditConsts, StdCtrls, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  ExtCtrls, ActnList;

type
  TfrmUchBook = class(TForm)
    cxGrid: TcxGrid;
    tvUchBook: TcxGridDBTableView;
    lvUchBook: TcxGridLevel;
    odsUchBook: TOracleDataSet;
    dsUchBook: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    tbtPrint: TToolButton;
    ToolButton5: TToolButton;
    tbtClose: TToolButton;
    IL: TImageList;
    oqUchBookCreate: TOracleQuery;
    tbtRefresh: TToolButton;
    os: TOracleSession;
    oqInitMO: TOracleQuery;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    oqUchBookClear: TOracleQuery;
    tbtClear: TToolButton;
    odsOstNach: TOracleDataSet;
    odsOstNachFN_KOLOST: TFloatField;
    odsOstNachFN_SUM_ALL: TFloatField;
    frxReport: TfrxReport;
    dsfrxUchBook: TfrxDBDataset;
    oqPKG_SMINI: TOracleQuery;
    oqInitMOGroup: TOracleQuery;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    odsUchBookRN: TFloatField;
    odsUchBookFD_DATE: TDateTimeField;
    odsUchBookFD_INVOICE: TDateTimeField;
    odsUchBookFC_DOC: TStringField;
    odsUchBookFC_PRIH_RASH_MO: TStringField;
    odsUchBookFN_PRIH: TFloatField;
    odsUchBookFN_RASH: TFloatField;
    odsUchBookFC_FINSOURCE: TStringField;
    odsUchBookFC_MEDICNAME: TStringField;
    odsUchBookFN_OSTATOK: TFloatField;
    tvUchBookRN: TcxGridDBColumn;
    tvUchBookFD_DATE: TcxGridDBColumn;
    tvUchBookFD_INVOICE: TcxGridDBColumn;
    tvUchBookFC_DOC: TcxGridDBColumn;
    tvUchBookFC_PRIH_RASH_MO: TcxGridDBColumn;
    tvUchBookFN_PRIH: TcxGridDBColumn;
    tvUchBookFN_RASH: TcxGridDBColumn;
    tvUchBookFC_FINSOURCE: TcxGridDBColumn;
    tvUchBookFC_MEDICNAME: TcxGridDBColumn;
    tvUchBookFN_OSTATOK: TcxGridDBColumn;
    odsUchBookFK_DPCID: TFloatField;
    tvUchBookFK_DPCID: TcxGridDBColumn;
    pFilter: TPanel;
    lcbMedic: TcxLookupComboBox;
    Label1: TLabel;
    odsMedic: TOracleDataSet;
    dsMedic: TDataSource;
    odsUchBookFD_DATE_T: TDateTimeField;
    odsUchBookFD_INVOICE_T: TDateTimeField;
    tvUchBookFD_DATE_T: TcxGridDBColumn;
    tvUchBookFD_INVOICE_T: TcxGridDBColumn;
    al: TActionList;
    acClearTable: TAction;
    oqUchBookHideClear: TOracleQuery;
    procedure tbtRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbtCloseClick(Sender: TObject);
    procedure odsUchBookAfterRefresh(DataSet: TDataSet);
    procedure tbtClearClick(Sender: TObject);
    procedure tbtPrintClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);

    function IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
    procedure IniWriteString(sIniFile: string; Section, Ident: string; val: string = '');
    procedure tvUchBookEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure lcbMedicPropertiesEditValueChanged(Sender: TObject);
    procedure acClearTableExecute(Sender: TObject);
  private
    { Private declarations }
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
    function WRITESTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_VALUE: string): string;
  public
    { Public declarations }
    iniFileName : string;
    dDate1, dDate2 : TDate;
  end;

var
  frmUchBook: TfrmUchBook;
  nGlobalOst: double;
  sMO_GROUP: string;

implementation

uses SMMainAPI, IniFiles, fgetperiod, fdmPrintSelect, uGlobalConst, uGetDate,
  uTimer;

{$R *.dfm}

//==============================================================================
function TfrmUchBook.IniReadString(sIniFile: string; Section, Ident: string; Default: string = ''): string;
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	Result := ini.ReadString(Section, Ident, Default);
	ini.free;
end;

procedure TfrmUchBook.IniWriteString(sIniFile: string; Section, Ident: string; val: string = '');
var
	ini: TIniFile;
begin
	ini := TIniFile.Create(sIniFile);
	ini.WriteString(Section, Ident, val);
	ini.free;
end;

procedure TfrmUchBook.lcbMedicPropertiesEditValueChanged(Sender: TObject);
begin
  //Находим остаток по медикаменту на начало периода
  odsOstNach.Close;
  odsOstNach.SetVariable('pMedic',lcbMedic.EditValue);
  odsOstNach.Open;
  nGlobalOst := odsOstNach.FieldByName('fn_kolost').AsFloat;

  //Получаем новый список
  odsUchBook.Close;
  odsUchBook.SetVariable('pOstatok',nGlobalOst);
  odsUchBook.SetVariable('pMedic',lcbMedic.EditValue);
  odsUchBook.Open;
  odsUchBook.Refresh;

  IniWriteString(iniFileName,'Params','lcbMedic',IntToStr(lcbMedic.EditValue));
end;

function TfrmUchBook.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  oqPKG_SMINI.ClearVariables;
  oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  oqPKG_SMINI.SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

  oqPKG_SMINI.Execute;
  Result := oqPKG_SMINI.GetVariable('PVALUE');
end;
          
function TfrmUchBook.WRITESTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_VALUE: string): string;
begin
  oqPKG_SMINI.ClearVariables;
  oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  oqPKG_SMINI.SetVariable('PVALUE',   aFC_VALUE);

  oqPKG_SMINI.Execute;
end;

procedure TfrmUchBook.acClearTableExecute(Sender: TObject);
begin
  Application.CreateForm(TfGetDate, fGetDate);
  with fGetDate do begin
    de.Date := StrToDate(FormatDateTime('01.01.yyyy', now));
    if ShowModal <> mrOk then exit;

    oqUchBookHideClear.SetVariable('pDate',de.Date);
    try
      oqUchBookHideClear.Execute;
      odsUchBook.Refresh;
    except
      MessageBox(Self.Handle,'При очистки книги произошла ошибка.', 'Ошибка',
               MB_ICONERROR + MB_OK);
    end;                             

  end;
end;

procedure TfrmUchBook.FormCreate(Sender: TObject);
var
  odsTmp: TOracleDataSet;
begin
  //Руссифицируем
  cxSetResourceString(@cxSDatePopupToday , 'Сегодня');
  cxSetResourceString(@cxSDatePopupNow , 'Сейчас');
  //Получаем сессию
  try
    GetSession(os, 'ASU');
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
  end;
  //Получаем сотрудника
  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;

  iniFileName := Application.ExeName+'.ini';
  //Получаем период
  odsTmp := TOracleDataSet.Create(Self);
  odsTmp.Session := os;
  odsTmp.SQL.Text := 'select LAST_DAY(ADD_MONTHS(trunc(sysdate),-1))+1 as FDate, LAST_DAY(trunc(sysdate)) as LDate from dual';
  odsTmp.Open;
  dDate1 := odsTmp.FieldByName('FDate').AsDateTime;
  dDate2 := odsTmp.FieldByName('LDate').AsDateTime;
  odsTmp.Close;
  odsTmp.Free;

  //Инициализируем МО
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.SetVariable('pDate2', dDate1);
  oqInitMO.Execute;
  sMO_GROUP := oqInitMO.GetVariable('PFC_GROUP');

  Self.Caption := 'Книга учета материальных ценностей | Группа мат. отв.: ' + sMO_GROUP
                      + ' | Период: с ' + DateToStr(dDate1) + ' по ' + DateToStr(dDate2);

  Application.CreateForm(TfTimer, fTimer);
  fTimer.ShowModal;
  fTimer.Free;
  
end;

procedure TfrmUchBook.frxReportGetValue(const VarName: string; var Value: Variant);
var
  sTemp : string;
begin
  if VarName = 'MEDOTRADE_SIGN' then Value := ReadMedotradeSign;

 if VarName = 'VAR_GLAV_BUH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_BUH', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_BUH', '')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_BUHGALTER' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'BUHGALTER', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'BUHGALTER', '')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_GLAV_VRACH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_VRACH', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_VRACH', '')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_ZAV_APTEKA' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'ZAV_APTEKA', '')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_MO' then Value := frmUchBook.oqInitMO.GetVariable('PFC_NAME');

  if VarName = 'VAR_MOGROUP' then Value := sMO_GROUP;

end;

procedure TfrmUchBook.odsUchBookAfterRefresh(DataSet: TDataSet);
begin
  tbtClear.Enabled := odsUchBook.RecordCount > 0;
  tbtPrint.Enabled := odsUchBook.RecordCount > 0;
end;

procedure TfrmUchBook.tbtClearClick(Sender: TObject);
begin
  if MessageBox(Self.Handle,'Вы действительно хотите очистить список?', 'Подтверждение',
                MB_ICONQUESTION + MB_YESNOCANCEL) <> IDYES then exit;
  try
    oqUchBookClear.Execute;
    odsUchBook.Refresh;
    Self.Caption := 'Книга учета материальных ценностей';
  except;
    MessageBox(Self.Handle,'При очистки списка произошла ошибка.', 'Ошибка',
               MB_ICONERROR + MB_OK);
  end;
end;

procedure TfrmUchBook.tbtCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUchBook.tbtPrintClick(Sender: TObject);
var
  P : TPoint;
begin
  if dmPrintSelect.PrintFlag = 0 then
  begin
    P.X := 0;
    P.Y := tbtPrint.Height;
    P := tbtPrint.ClientToScreen(P);
    dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
    Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
  end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати

  if dmPrintSelect.PrintFlag = 0 then Exit;
  try
    if FileExists('UchBook.fr3') then            // если найден файл
      frxReport.LoadFromFile('UchBook.fr3');  // загружаем его

    frxReport.PrepareReport;
    case dmPrintSelect.PrintFlag of // флаг куда печатать
      1: ExportFRToExcel(frxReport, 'Книга учета ТМЦ.xls' );
      2: frxReport.ShowReport;
    end;

  finally
    dmPrintSelect.PrintFlag := 0;
  end;
end;

procedure TfrmUchBook.tbtRefreshClick(Sender: TObject);
begin
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  with frmGetPeriod do begin
    if ShowModal = mrOK then begin
      Self.dDate1 := trunc(frmGetPeriod.dDate1.Date);
      Self.dDate2 := trunc(frmGetPeriod.dDate2.Date);
      // Подставить новые параметры в OQ
      oqUchBookCreate.SetVariable('pDate1',Self.dDate1);
      oqUchBookCreate.SetVariable('pDate2',Self.dDate2);
      // Обновить список
      try
        // Инициализируем МО и период
        oqInitMOGroup.SetVariable('pDate2',Self.dDate1);
        oqInitMOGroup.SetVariable('NMO_GROUP',IntToStr(frmGetPeriod.lcbMO_GROUP.KeyValue));
        oqInitMOGroup.Execute;
        sMO_GROUP := oqInitMOGroup.GetVariable('PFC_GROUP');
                                                           
        Self.Caption := 'Книга учета материальных ценностей | Группа мат. отв.: ' + sMO_GROUP
                      + ' | Период: с ' + DateToStr(Self.dDate1) + ' по ' + DateToStr(Self.dDate2);
        // Заполняем TUCHBOOK
        Screen.Cursor := crSQLWait; 
        oqUchBookCreate.SetVariable('pDate1',Self.dDate1);
        oqUchBookCreate.SetVariable('pDate2',Self.dDate2);
        oqUchBookCreate.Execute;    
        Screen.Cursor := crDefault;
        os.Commit;

        //Находим остаток по медикаменту на начало периода
        odsOstNach.Close;
        odsOstNach.SetVariable('pMedic',lcbMedic.EditValue);
        odsOstNach.Open;
        nGlobalOst := odsOstNach.FieldByName('fn_kolost').AsFloat;

        //Получаем новый список
        odsUchBook.SetVariable('pOstatok',nGlobalOst);    
        odsUchBook.SetVariable('pMedic',lcbMedic.EditValue); 
        odsUchBook.SetVariable('pDate1',Self.dDate1);
        odsUchBook.SetVariable('pDate2',Self.dDate2);
        odsUchBook.Refresh;

      except
        MessageBox(Self.Handle,'При создании книги учета ТМЦ произошла ошибка','Ошибка',
                   MB_ICONERROR+MB_OK);
      end;
    end;
    Free;
  end;
end;

procedure TfrmUchBook.tvUchBookEditValueChanged(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem);
var
  tmpID: integer;
begin
  try
    tmpID := odsUchBook.FieldByName('FK_DPCID').AsInteger;
    //Пересортировка FN_NUM
    odsUchBook.Refresh;
    odsUchBook.Locate('FK_DPCID',tmpID,[]);
  except

  end;
end;

end.
