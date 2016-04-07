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
  frxExportRTF, cxLabel, cxConstantsRus, dxBarCustomize_Rus;
const
  CSV_Load_S2_Low   = 1;
  CSV_Load_S2_High  = 28;     // В новом формате 28 колонок вместо 20
//DrugID	PackNx	RegNr	RegDate	InnR	TradeNmR	DosageR	ClNm	MnfNm	PckNm	DrugFmNmRS	TotDrugQn	Pack	RangeR	Ean	ExpiTermR	MaxMnfPrice	CurrencyNm	MnfID	PckID

  //CSV_Load_S2 : array[CSV_Load_S2_Low..CSV_Load_S2_High] of string = ('DrugId', 'PackNx', 'RegNr','RegDate','InnR','TradeNmR','DosageR','ClNm','MnfNm','PckNm','DrugFmNmRS','TotDrugQn','Pack','RangeR','Ean','ExpiTermR','MaxMnfPrice','CurrencyNm', 'MnfID','PckID');

    //Новый формат 20.06.2012
    //DrugID	TradeNmR	InnR	PackNx	DosageR	Pack	DrugFmNmRS	Segment	Year	Month	Series	TotDrugQn	MnfPrice	PrcPrice	RtlPrice	Funds	VendorID	Remark	SrcOrg	EAN	MaxMnfPrice	ExpiTermR	ClNm	MnfNm	PckNm	RegNr	RegDate
    CSV_Load_S2 : array[CSV_Load_S2_Low..CSV_Load_S2_High] of string = ('DrugID','TradeNmR','InnR','PackNx','DosageR','PackQn','Pack','DrugFmNmRS','Segment','Year','Month','Series','TotDrugQn','MnfPrice','PrcPrice','RtlPrice','Funds','VendorID','Remark','SrcOrg','EAN','MaxMnfPrice','ExpiTermR','ClNm','MnfNm','PckNm','RegNr','RegDate');

type
  TfrmGetPeriod = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbuExportToExcel: TToolButton;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    acExportToExcel: TAction;
    acExit: TAction;
    oqGetPrih: TOracleQuery;
    odsGroupMo: TOracleDataSet;
    dsGroupMo: TDataSource;
    oqInitMO: TOracleQuery;
    gbPrihMonthYear: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    odsPriceMonitorBASE: TOracleDataSet;
    cxGroupBox3: TcxGroupBox;
    grBase: TcxGrid;
    grBaseDBTableView: TcxGridDBTableView;
    grBaseLevel1: TcxGridLevel;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    tbtExec: TToolButton;
    cxSplitter1: TcxSplitter;
    cxGroupBox4: TcxGroupBox;
    grOST: TcxGrid;
    grOSTDBTableView1: TcxGridDBTableView;
    grOSTLevel1: TcxGridLevel;
    os: TOracleSession;
    odsPriceMonitorOST: TOracleDataSet;
    dsPriceMonitorBASE: TDataSource;
    dsPriceMonitorOST: TDataSource;
    grBaseDBTableView_PACKNX: TcxGridDBColumn;
    grBaseDBTableView_tradenmr: TcxGridDBColumn;
    grBaseDBTableView_innr: TcxGridDBColumn;
    grBaseDBTableView_mnfnm: TcxGridDBColumn;
    grBaseDBTableView_DrugFmNmRS: TcxGridDBColumn;
    grBaseDBTableView_Pack: TcxGridDBColumn;
    grBaseDBTableView_SEGMENT: TcxGridDBColumn;
    
    grOSTDBTableView1PACKNX: TcxGridDBColumn;
    grOSTDBTableView1YEAR: TcxGridDBColumn;
    grOSTDBTableView1MONTH: TcxGridDBColumn;
    grOSTDBTableView1IRECID: TcxGridDBColumn;
    grOSTDBTableView1SERIES: TcxGridDBColumn;
    grOSTDBTableView1QUANTITY: TcxGridDBColumn;
    grOSTDBTableView1FUNDS: TcxGridDBColumn;
    grOSTDBTableView1VENDOR: TcxGridDBColumn;
    grOSTDBTableView1PRCPRICE: TcxGridDBColumn;
    grOSTDBTableView1RTLPRICE: TcxGridDBColumn;
    grOSTDBTableView1RTLPREMIUM: TcxGridDBColumn;
    grOSTDBTableView1REMARK: TcxGridDBColumn;
    grOSTDBTableView1SRCORG: TcxGridDBColumn;
    grOSTDBTableView1IPV: TcxGridDBColumn;
    grOSTDBTableView1FK_MEDICID: TcxGridDBColumn;
    grOSTDBTableView1FK_KARTID: TcxGridDBColumn;
    grOSTDBTableView1FD_DATE: TcxGridDBColumn;
    grOSTDBTableView1FK_MOGROUP: TcxGridDBColumn;
    grOSTDBTableView1FC_MEDIC: TcxGridDBColumn;

    grBaseDBTableViewOstPACKNX: TcxGridDBColumn;
    grBaseDBTableViewOstYEAR: TcxGridDBColumn;
    grBaseDBTableViewOstMONTH: TcxGridDBColumn;
    grBaseDBTableViewOstIRECID: TcxGridDBColumn;
    grBaseDBTableViewOstSERIES: TcxGridDBColumn;
    grBaseDBTableViewOstQUANTITY: TcxGridDBColumn;
    grBaseDBTableViewOstFUNDS: TcxGridDBColumn;
    grBaseDBTableViewOstVENDOR: TcxGridDBColumn;
    grBaseDBTableViewOstPRCPRICE: TcxGridDBColumn;
    grBaseDBTableViewOstRTLPRICE: TcxGridDBColumn;
    grBaseDBTableViewOstRTLPREMIUM: TcxGridDBColumn;
    grBaseDBTableViewOstREMARK: TcxGridDBColumn;
    grBaseDBTableViewOstSRCORG: TcxGridDBColumn;
    grBaseDBTableViewOstIPV: TcxGridDBColumn;
    grBaseDBTableViewOstFK_MEDICID: TcxGridDBColumn;
    grBaseDBTableViewOstFK_KARTID: TcxGridDBColumn;
    grBaseDBTableViewOstFD_DATE: TcxGridDBColumn;
    grBaseDBTableViewOstFK_MOGROUP: TcxGridDBColumn;
    grBaseDBTableViewOstFC_MEDIC: TcxGridDBColumn;

    acGetOstByDate: TAction;
    grBaseDBTableViewOst: TcxGridDBTableView;
    grBaseLevel2: TcxGridLevel;
    ToolButton6: TToolButton;
    lcbMO_GROUP: TcxLookupComboBox;
    Panel1: TPanel;
    buCheckOst: TcxButton;
    grOSTDBTableView1PROIZVODITEL: TcxGridDBColumn;
    grBaseDBTableViewOstPROIZVODITEL: TcxGridDBColumn;
    buBackOst: TcxButton;
    acCheckOst: TAction;
    acBackOst: TAction;
    grOSTDBTableView1FK_ID: TcxGridDBColumn;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;
    oqBackOst: TOracleQuery;
    acRefreshAll: TAction;
    grBaseDBTableViewOstFK_ID: TcxGridDBColumn;
    grBaseDBTableView_OST_COUNT: TcxGridDBColumn;
    pmExportCSV: TPopupMenu;
    N1: TMenuItem;
    grBaseExportDBTableView1: TcxGridDBTableView;
    odsExport: TOracleDataSet;
    dsExport: TDataSource;
    acExportToCSV: TAction;
    sdCSV: TSaveDialog;
    pmExportTableBase: TPopupMenu;
    mniTableBaseToExcel: TMenuItem;
    sdExportOstTable: TSaveDialog;
    frxAbsentMedics: TfrxReport;
    frxdsAbsentMedics: TfrxDBDataset;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    acAbsentMedicsToWord: TAction;
    odsAbsentMedics: TOracleDataSet;
    grBaseDBTableView_DosageR: TcxGridDBColumn;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    grOSTDBTableView1_FC_UP_EI: TcxGridDBColumn;
    grOSTDBTableView1_FN_FAS: TcxGridDBColumn;
    grOSTDBTableView1_FC_FAS_EI: TcxGridDBColumn;
    miLoadSprav: TMenuItem;
    miSep1: TMenuItem;
    pmExportTableOst: TPopupMenu;
    miOstToExcel: TMenuItem;
    odCSV: TOpenDialog;
    grBaseDBTableView_MaxMnfPrice: TcxGridDBColumn;
    grBaseDBTableView_CurrencyNm: TcxGridDBColumn;
    grBaseDBTableView_MnfID: TcxGridDBColumn;
    grBaseDBTableView_PckID: TcxGridDBColumn;
    grBaseDBTableView_Ean: TcxGridDBColumn;
    grBaseDBTableView_TotDrugQn: TcxGridDBColumn;
    oqIns_TPrice_monitor_base: TOracleQuery;
    oqClear_TPrice_monitor_base: TOracleQuery;
    grOSTDBTableView1FK_TPRICE_MONITOR_BASE_ID: TcxGridDBColumn;
    grBaseDBTableViewFK_ID: TcxGridDBColumn;
    grBaseDBTableView_PCKNM: TcxGridDBColumn;
    grBaseDBTableViewOstFK_TPRICE_MONITOR_BASE_ID: TcxGridDBColumn;
    grBaseDBTableView_DrugId: TcxGridDBColumn;
    grOSTDBTableView1FD_GODEN: TcxGridDBColumn;
    miUpdateAndAddSprav: TMenuItem;
    N2: TMenuItem;
    oqUpdateVendorID: TOracleQuery;
    grOSTDBTableView1VendorID: TcxGridDBColumn;
    N3: TMenuItem;
    miVendorID: TMenuItem;
    cbMonth: TcxComboBox;
    sedYear: TcxSpinEdit;
    gbPrihDay: TcxGroupBox;
    sedDay: TcxSpinEdit;
    oqPKG_SMINI: TOracleQuery;
    N4: TMenuItem;
    acExportToExcelWithDecode: TAction;
    odsExportWithDecode: TOracleDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    FloatField3: TFloatField;
    StringField2: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    odsExportWithDecodePCKNM: TStringField;
    gbOstByDate: TcxGroupBox;
    deOstDate: TcxDateEdit;
    acGetPrihByDate: TAction;
    oqGetOst: TOracleQuery;
    odsExportDRUGID: TFloatField;
    odsExportPACKNX: TFloatField;
    odsExportMNFID: TFloatField;
    odsExportPCKID: TFloatField;
    odsExportSEGMENT: TFloatField;
    odsExportYEAR: TIntegerField;
    odsExportMONTH: TIntegerField;
    odsExportSERIES: TStringField;
    odsExportTOTDRUGQN: TStringField;
    odsExportFUNDS: TStringField;
    odsExportVENDORID: TStringField;
    odsExportMNFPRICE: TStringField;
    odsExportPRCPRICE: TStringField;
    odsExportRTLPRICE: TStringField;
    odsExportREMARK: TStringField;
    odsExportSRCORG: TStringField;
    grOSTDBTableView1fl_jnvls: TcxGridDBColumn;
    grOSTDBTableView1MNF_PRICE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure odsGroupMoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure acGetOstByDateExecute(Sender: TObject);
    procedure acCheckOstExecute(Sender: TObject);
    procedure acBackOstExecute(Sender: TObject);
    procedure odsPriceMonitorBASEBeforeClose(DataSet: TDataSet);
    procedure odsPriceMonitorBASEAfterOpen(DataSet: TDataSet);
    procedure odsPriceMonitorOSTAfterOpen(DataSet: TDataSet);
    procedure odsPriceMonitorOSTBeforeClose(DataSet: TDataSet);
    procedure acRefreshAllExecute(Sender: TObject);
    procedure grBaseDBTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure grBaseDBTableViewOstFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure acExportToExcelExecute(Sender: TObject);
    procedure lcbMO_GROUPPropertiesChange(Sender: TObject);
    procedure acExportToCSVExecute(Sender: TObject);
    procedure mniTableBaseToExcelClick(Sender: TObject);
    procedure grBaseDBTableViewOstCanFocusRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure grBaseDBTableViewOstCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure grBaseDBTableViewCanSelectRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure grBaseDBTableViewCanFocusRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure acAbsentMedicsToWordExecute(Sender: TObject);
    procedure miLoadSpravClick(Sender: TObject);
    procedure miOstToExcelClick(Sender: TObject);
    procedure miVendorIDClick(Sender: TObject);
    procedure acExportToExcelWithDecodeExecute(Sender: TObject);
    procedure acGetPrihByDateExecute(Sender: TObject);
    procedure cbMonthPropertiesChange(Sender: TObject);
    procedure grOSTDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    function GetValueFromTSMini ( ASection, AIdent, ADefault : string ) : string;

  PRIVATE
    { Private declarations }
    FLast_BASE_ID, FLast_OST_FK_ID : variant;
    XlApp : Variant;
    FL_ShowExcelAfterExport : boolean;

    bUsePrih: boolean;

    procedure ReplaceQuotesInCSV(aFileName:string);
  PUBLIC
    { Public declarations }
  end;

//procedure CloseExcelFile(XlApp : Variant);
//function OpenExcelFile(aFileName: string; XlApp : Variant): Boolean;


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
  FK_APPSOTR_ID : Integer;
  OstDate : TDate;
  fltMain: TcxFilterCriteriaItemList;
  dTmp: TDateTime;
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

  bUsePrih := ( GetValueFromTSMini ( 'PRICE_MONITORING', 'USE_PRIH', '1' ) = '1' ); //Используем мониторинг приходов

  //Настраиваем внешний вид
  if bUsePrih then    //Приходы
  begin
    gbOstByDate.Visible := false;
    tbtExec.Action := acGetPrihByDate;

    gbPrihDay.Visible := true;
    gbPrihMonthYear.Visible := true;
  end
  else
  begin               //Остатки
    gbOstByDate.Visible := true;
    tbtExec.Action := acGetOstByDate;

    gbPrihDay.Visible := false;
    gbPrihMonthYear.Visible := false;
  end;

  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;

  odsGroupMo.Open;

  lcbMO_GROUP.EditValue := oqInitMO.GetVariable('nMO_GROUP');
  lcbMO_GROUP.Enabled  := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);

  Self.Caption := Application.Title;
  OstDate := Trunc(oqInitMO.GetVariable('psysdate'));
  if  ( bUsePrih ) then
  begin
    // выставляем дату - если сегодня 25-ое или больше, ставим сегодняшний месяц, если нет - предыдущий
    // до 25го числа каждого месяца сдавать отчеты на 15-е число каждого месяца
    if DayOf(OstDate) < 25 then
      dTmp:=  StartOfTheMonth(IncMonth(OstDate,-1))+14
    else
      dTmp :=  StartOfTheMonth(OstDate)+14;
  end
  else
  begin
    if DayOf(OstDate) < 25 then
      dTmp:=  StartOfTheMonth(OstDate)+14
    else
      dTmp := StartOfTheMonth(IncMonth(OstDate, 1))+14
  end;           

  deOstDate.EditValue := dTmp;

  if ( bUsePrih ) then
  begin
    sedDay.EditValue := StrToIntDef ( GetValueFromTSMini( 'PRICE_MONITORING', 'START_DAY', '1'), 1 );
    cbMonth.ItemIndex := MonthOf(dTmp)-1;
    sedYear.Value := YearOf(dTmp);
  end;

  grBaseDBTableView.DataController.GotoFirst;

  // Если не привязывают медикамент к мониторингу при формировании приходов
  if ( GetValueFromTSMini( 'MEDICA.EXE', 'FUNC_SHOW_DRUGID', '0' ) = '0' ) then

  begin
    fltMain := grOSTDBTableView1.DataController.Filter.Root;
    fltMain.Clear;
    fltMain.BoolOperatorKind := fboAnd;

    fltMain.AddItem( grOSTDBTableView1.Columns[ Self.grOSTDBTableView1FK_TPRICE_MONITOR_BASE_ID.index ], foEqual, null, '' );
    grOSTDBTableView1.DataController.Filter.Active := True;
  end;

  FL_ShowExcelAfterExport := True;

  acRefreshAll.Execute;
  if ( GetValueFromTSMini( 'PRICE_MONITORING', 'MINUS_BY_MNN', '0' ) = '1' ) then
  begin
    odsAbsentMedics.SetVariable('pMINUS_BY_MNN','AND NOT EXISTS (SELECT 1 --исключает повторение по МНН, для уже включенных в мониторинг, т.е. если "Азитромицин" был включен в мониторинг, то все препараты с МНН="Азитромицин" нужно исключить'
                                     +#13#10+'                     FROM MED.TPRICE_MONITOR_BASE B, MED.TPRICE_MONITOR_OST O'
                                     +#13#10+'                    WHERE O.FK_TPRICE_MONITOR_BASE_ID = B.FK_ID'
                                     +#13#10+'                      AND O.FD_DATE = :PDATE'
                                     +#13#10+'                      --AND O.FK_MOGROUP = :PFK_MOGROUP'
                                     +#13#10+'                      AND B.INNR = A.INNR)');
  end;
  odsAbsentMedics.SetVariable('pFIELDNAME', GetValueFromTSMini( 'PRICE_MONITORING', 'ABSENT_FIELDNAME', 'T.FK_ID' ) );

end;

procedure TfrmGetPeriod.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetPeriod.odsGroupMoAfterOpen(DataSet: TDataSet);
begin
  lcbMO_GROUP.EditValue := StrToInt(IniReadString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', '-1'));
end;


procedure TfrmGetPeriod.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IniWriteString(ChangeFileExt(Application.ExeName,'.ini'),'Params', 'LastMOGroupID', IntToStr(lcbMO_GROUP.EditValue));

//  oqPKG_SMINI.SetVariable('PSECTION', 'PRICE_MONITORING');
//  oqPKG_SMINI.SetVariable('PIDENT', 'START_DAY');
//  oqPKG_SMINI.SetVariable('PVALUE', sedDay.EditValue);
//  oqPKG_SMINI.SetVariable('PDEFAULT', '1');
//  oqPKG_SMINI.Execute;

  Action := caFree;
end;


procedure TfrmGetPeriod.cbMonthPropertiesChange(Sender: TObject);
begin
  deOstDate.EditValue := EncodeDate(sedYear.Value, cbMonth.ItemIndex + 1, sedDay.Value);
end;

procedure TfrmGetPeriod.cxDateEdit1PropertiesChange(Sender: TObject);
begin
  acRefreshAll.Execute;
end;

procedure TfrmGetPeriod.acGetOstByDateExecute(Sender: TObject);
begin

  if (odsPriceMonitorOST.RecordCount > 0) then
  begin
    if Application.MessageBox('Перерасчет остатков приведет к потере привязки'#13#10'остатков с медикаментами проекта "Мониторинг цен".'#13#10'Все остатки на указанное число будут удалены и расчитаны заново.'#13#10'Продолжить?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONWARNING) = IDNO	then
      Exit;
  end;
  oqGetOst.SetVariable('NMO_GROUP', lcbMO_GROUP.EditValue);
  oqGetOst.SetVariable('PDATE', Trunc(deOstDate.EditValue));
  oqGetOst.Execute;

  acRefreshAll.Execute;
  grOSTDBTableView1.DataController.GotoFirst;
end;

procedure TfrmGetPeriod.acGetPrihByDateExecute(Sender: TObject);
begin
  if (odsPriceMonitorOST.RecordCount > 0) then
  begin
    if Application.MessageBox('Перерасчет приходов приведет к потере привязки'#13#10'приходов с медикаментами проекта "Мониторинг цен".'#13#10'Все приходы на указанное число будут удалены и расчитаны заново.'#13#10'Продолжить?', 'ВНИМАНИЕ', MB_YESNO+MB_ICONWARNING) = IDNO	then
      Exit;
  end;
  oqGetPrih.SetVariable('NMO_GROUP', lcbMO_GROUP.EditValue);
  oqGetPrih.SetVariable('PDATE1', Trunc(deOstDate.EditValue));
  oqGetPrih.SetVariable('PDATE2', IncMonth(EncodeDate(sedYear.Value, cbMonth.ItemIndex + 1, sedDay.Value))-1);
  oqGetPrih.Execute;

  acRefreshAll.Execute;
  grOSTDBTableView1.DataController.GotoFirst;
end;

procedure TfrmGetPeriod.acCheckOstExecute(Sender: TObject);
var
  i, Last, n : integer;
begin
  n := grOSTDBTableView1.Controller.FocusedRecordIndex;
  Last := grOSTDBTableView1.Controller.SelectedRecordCount-1;

  grOST.Enabled := False;
  odsPriceMonitorOST.DisableControls; // с этим работает гораздо быстрее !!
  for i := 0 to Last do
  begin
    odsPriceMonitorOST.Locate('FK_ID', grOSTDBTableView1.Controller.SelectedRows[i].Values[ grOSTDBTableView1FK_ID.Index ], []);
    odsPriceMonitorOST.Edit;
    odsPriceMonitorOST.FieldByName('PACKNX').AsVariant                    := grBaseDBTableView_PACKNX.EditValue;
    odsPriceMonitorOST.FieldByName('FK_TPRICE_MONITOR_BASE_ID').AsVariant := grBaseDBTableViewFK_ID.EditValue;
    odsPriceMonitorOST.FieldByName('FN_MNF_PRICE').AsVariant := grBaseDBTableView_MaxMnfPrice.EditValue;
    odsPriceMonitorOST.Post;
  end;
  odsPriceMonitorOST.EnableControls;
  grOST.Enabled := True;

  with  odsPriceMonitorBASE do
  try
    DisableControls;
    //Refresh;
    odsPriceMonitorBASE.RefreshRecord;        
  finally
    EnableControls;
  end;

  odsPriceMonitorOst.Close;
  odsPriceMonitorOst.Open;

  grOSTDBTableView1.Controller.FocusRecord(n, True);

  grBaseDBTableView.Controller.FocusedRow.Expand(False);
end;

procedure TfrmGetPeriod.acAbsentMedicsToWordExecute(Sender: TObject);
begin
  odsAbsentMedics.SetVariable('PFK_MOGROUP', lcbMO_GROUP.EditValue);
  odsAbsentMedics.SetVariable('PDATE', Trunc(deOstDate.EditValue));
  odsAbsentMedics.Open;
  frxAbsentMedics.ShowReport();
  odsAbsentMedics.Close;
end;

procedure TfrmGetPeriod.acBackOstExecute(Sender: TObject);
var
  base_id : integer;
//  aCurView : TcxGridDBTableView;
begin
  base_id := odsPriceMonitorBASE.FieldByName('FK_ID').AsInteger;
  odsPriceMonitorOST.DisableControls;
  odsPriceMonitorOST.Edit;
  odsPriceMonitorOST.FieldByName('PACKNX').AsVariant                    := null;
  odsPriceMonitorOST.FieldByName('FK_TPRICE_MONITOR_BASE_ID').AsVariant := null;
  odsPriceMonitorOST.FieldByName('FN_MNF_PRICE').AsVariant := 0;
  odsPriceMonitorOST.Post;
  odsPriceMonitorOST.EnableControls;

  grBase.Enabled := True;

  with  odsPriceMonitorBASE do
  try
    DisableControls;
    //Refresh;
    odsPriceMonitorBASE.RefreshRecord;
  finally
    EnableControls;
  end;

  // обновление нужно для правильного отображения кол-ва строк 2-ого уровня
  odsPriceMonitorOst.Close;
  odsPriceMonitorOst.Open;

  odsPriceMonitorBASE.Locate( 'FK_ID', base_id, [] )
end;

procedure TfrmGetPeriod.odsPriceMonitorBASEBeforeClose(DataSet: TDataSet);
begin
  FLast_BASE_ID := odsPriceMonitorBASE.FieldByName('FK_ID').AsVariant;
end;

procedure TfrmGetPeriod.odsPriceMonitorBASEAfterOpen(DataSet: TDataSet);
begin
  odsPriceMonitorBASE.Locate('FK_ID', FLast_BASE_ID, []);
end;

procedure TfrmGetPeriod.odsPriceMonitorOSTAfterOpen(DataSet: TDataSet);
begin
  odsPriceMonitorOST.Locate('FK_ID', FLast_OST_FK_ID, []);
end;

procedure TfrmGetPeriod.odsPriceMonitorOSTBeforeClose(DataSet: TDataSet);
begin
  FLast_OST_FK_ID := odsPriceMonitorOST.FieldByName('FK_ID').AsVariant;
end;

procedure TfrmGetPeriod.miVendorIDClick(Sender: TObject);
begin
  oqUpdateVendorID.SetVariable('NMO_GROUP', lcbMO_GROUP.EditValue);
  oqUpdateVendorID.SetVariable('PDATE', Trunc(deOstDate.EditValue));
  oqUpdateVendorID.Execute;

  odsPriceMonitorOST.Close;
  odsPriceMonitorOST.Open;
end;

procedure TfrmGetPeriod.acRefreshAllExecute(Sender: TObject);
begin
  odsExport.Close;
  odsExportWithDecode.Close;
  odsPriceMonitorBASE.Close;
  odsPriceMonitorOST.Close;
//  odsPriceMonitorOST_Used.Close;

  odsPriceMonitorBASE.SetVariable    ('PFK_MOGROUP', lcbMO_GROUP.EditValue);
//  odsPriceMonitorOST_Used.SetVariable('PFK_MOGROUP', lcbMO_GROUP.EditValue);
  odsPriceMonitorOST.SetVariable     ('PFK_MOGROUP', lcbMO_GROUP.EditValue);
  odsExport.SetVariable              ('PFK_MOGROUP', lcbMO_GROUP.EditValue); 
  odsExportWithDecode.SetVariable    ('PFK_MOGROUP', lcbMO_GROUP.EditValue);

  odsPriceMonitorBASE.SetVariable    ('PDate', Trunc(deOstDate.EditValue));
//  odsPriceMonitorOST_Used.SetVariable('PDate', Trunc(deOstDate.EditValue));
  odsPriceMonitorOST.SetVariable     ('PDate', Trunc(deOstDate.EditValue));
  odsExport.SetVariable              ('PDate', Trunc(deOstDate.EditValue));
  odsExportWithDecode.SetVariable    ('PDate', Trunc(deOstDate.EditValue));

  if ( bUsePrih )then
    odsPriceMonitorOST.SetVariable( 'PFILTER_JNVLS', '' )
  else
    odsPriceMonitorOST.SetVariable( 'PFILTER_JNVLS', 'and nvl(k.fl_jnvls, m.fl_jnvls ) = 1' );

  odsPriceMonitorBASE.Open;
  odsPriceMonitorOst.Open;
//  odsPriceMonitorOST_Used.Open;
end;

procedure TfrmGetPeriod.grBaseDBTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  acBackOst.Enabled := False;
end;

procedure TfrmGetPeriod.grBaseDBTableViewOstFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  acBackOst.Enabled := True;
end;

procedure TfrmGetPeriod.grOSTDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if not VarIsNull( AViewInfo.GridRecord.Values[ grOSTDBTableView1.GetColumnByFieldName ('PACKNX').Index] ) then
  begin
    ACanvas.Font.Style := [fsItalic];
    ACanvas.Font.Color := clGray;
  end;

end;

procedure TfrmGetPeriod.acExportToExcelExecute(Sender: TObject);
var
  Col, Row, ColExl  : integer;
begin
  odsExport.Close;
  odsExport.Open;

  XlApp  := CreateOleObject('Excel.Application'); // создаем объект эксель

  if VarType(XlApp) <> VarDispatch then
  begin  // If we are not connected with MsExcel
    ShowMessage('MS Excel not this installed');
    Exit;
  end;

  XlApp.WorkBooks.Add;

  // заполняем заголок и расставляем ширину столбцов
  // важно чтобы все поля были добавлены в датасет в список полей (даблклик на датасете)
  ColExl := 0;
  for Col := 0 to odsExport.FieldCount-1 do
  begin
    if odsExport.Fields[Col].Visible then
    begin
      XlApp.Range[CHR(65+ColExl)+'1'] := odsExport.Fields[Col].DisplayLabel;
      XlApp.Columns[CHR(65+ColExl)+':'+CHR(65+ColExl)].Select;
      XlApp.Selection.ColumnWidth := odsExport.Fields[Col].DisplayWidth;
      XlApp.Selection.NumberFormat := '@'; // строковый формат

      case odsExport.Fields[Col].DataType of
        ftFloat, ftInteger :
          XlApp.Selection.HorizontalAlignment := xlRight;
      else
          XlApp.Selection.HorizontalAlignment := xlLeft;
      end;
      Inc(ColExl);
    end;
  end;

  // выделяем заголовок цветом
  XlApp.Rows['1:1'].Select;
  XlApp.Selection.Interior.ColorIndex := 15;
  XlApp.Selection.Interior.Pattern := xlSolid;

  odsExport.First; //экспортим только привязанные остатки
  for Row := 1 to odsExport.RecordCount do
  begin
    ColExl := 0;
    for Col := 0 to odsExport.FieldCount-1 do
    begin
//      XlApp.Range[CHR(65+Col)+IntToStr(Row+1)] := odsExport.Fields[Col].Value;
// чуть не забыл про преобразования - кавычкни не принимаются, запятые в числах не допускаются
      if odsExport.Fields[Col].Visible then
      begin
        if VarIsNull(odsExport.Fields[Col].Value) then
          XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := ''
        else
        case odsExport.Fields[Col].DataType of
          ftString:
            if odsExport.Fields[Col].FieldName <> 'SERIES' then
              XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := StringReplace(odsExport.Fields[Col].Value, '"', ' ', [rfReplaceAll])
            else
              XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := odsExport.Fields[Col].Value;

          ftFloat : XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := StringReplace(FloatToStr(RoundTo(odsExport.Fields[Col].Value,-2)), ',', '.', [rfReplaceAll]);
        else
          XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := odsExport.Fields[Col].Value;
        end;

        //if (odsExport.Fields[Col].FieldName = 'MNFPRICE')and(odsExport.Fields[Col].Value=0) then  XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := '0.00';
        //if (odsExport.Fields[Col].FieldName = 'PRCPRICE')and(odsExport.Fields[Col].Value=0) then  XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := '0.00';
        //if (odsExport.Fields[Col].FieldName = 'RTLPRICE')and(odsExport.Fields[Col].Value=0) then  XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := '0.00';
        //if (odsExport.Fields[Col].FieldName = 'TOTDRUGQN')and(odsExport.Fields[Col].Value=0) then  XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := '0.00';        

        Inc(ColExl);        
      end;
    end;
    odsExport.Next;
  end;
  odsExport.Close;

  if FL_ShowExcelAfterExport then
    XlApp.Visible := True;
end;

procedure TfrmGetPeriod.acExportToExcelWithDecodeExecute(Sender: TObject);
var
  Col, Row, ColExl  : integer;
begin
  odsExportWithDecode.Close;
  odsExportWithDecode.Open;

  XlApp  := CreateOleObject('Excel.Application'); // создаем объект эксель

  if VarType(XlApp) <> VarDispatch then
  begin  // If we are not connected with MsExcel
    ShowMessage('MS Excel not this installed');
    Exit;
  end;

  XlApp.WorkBooks.Add;

  // заполняем заголок и расставляем ширину столбцов
  // важно чтобы все поля были добавлены в датасет в список полей (даблклик на датасете)
  ColExl := 0;
  for Col := 0 to odsExportWithDecode.FieldCount-1 do
  begin
    if odsExportWithDecode.Fields[Col].Visible then
    begin
      XlApp.Range[CHR(65+ColExl)+'1'] := odsExportWithDecode.Fields[Col].DisplayLabel;
      XlApp.Columns[CHR(65+ColExl)+':'+CHR(65+ColExl)].Select;
      XlApp.Selection.ColumnWidth := odsExportWithDecode.Fields[Col].DisplayWidth;
      XlApp.Selection.NumberFormat := '@'; // строковый формат

      case odsExportWithDecode.Fields[Col].DataType of
        ftFloat, ftInteger :
          XlApp.Selection.HorizontalAlignment := xlRight;
      else
          XlApp.Selection.HorizontalAlignment := xlLeft;
      end;
      Inc(ColExl);
    end;
  end;

  // выделяем заголовок цветом
  XlApp.Rows['1:1'].Select;
  XlApp.Selection.Interior.ColorIndex := 15;
  XlApp.Selection.Interior.Pattern := xlSolid;

  odsExportWithDecode.First; //экспортим только привязанные остатки
  for Row := 1 to odsExportWithDecode.RecordCount do
  begin
    ColExl := 0;
    for Col := 0 to odsExportWithDecode.FieldCount-1 do
    begin
//      XlApp.Range[CHR(65+Col)+IntToStr(Row+1)] := odsExportWithDecode.Fields[Col].Value;
// чуть не забыл про преобразования - кавычкни не принимаются, запятые в числах не допускаются
      if odsExportWithDecode.Fields[Col].Visible then
      begin
        if VarIsNull(odsExportWithDecode.Fields[Col].Value) then
          XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := ''
        else
        case odsExportWithDecode.Fields[Col].DataType of
          ftString:
            if odsExportWithDecode.Fields[Col].FieldName <> 'SERIES' then
              XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := StringReplace(odsExportWithDecode.Fields[Col].Value, '"', ' ', [rfReplaceAll])
            else
              XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := odsExportWithDecode.Fields[Col].Value;

          ftFloat : XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := StringReplace(FloatToStr(RoundTo(odsExportWithDecode.Fields[Col].Value,-2)), ',', '.', [rfReplaceAll]);
        else
          XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := odsExportWithDecode.Fields[Col].Value;
        end;

        if (odsExportWithDecode.Fields[Col].FieldName = 'MNFPRICE')and(odsExportWithDecode.Fields[Col].Value=0) then  XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := '0.00';
        if (odsExportWithDecode.Fields[Col].FieldName = 'PRCPRICE')and(odsExportWithDecode.Fields[Col].Value=0) then  XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := '0.00';
        if (odsExportWithDecode.Fields[Col].FieldName = 'RTLPRICE')and(odsExportWithDecode.Fields[Col].Value=0) then  XlApp.Range[CHR(65+ColExl)+IntToStr(Row+1)] := '0.00';

        Inc(ColExl);        
      end;
    end;
    odsExportWithDecode.Next;
  end;
  odsExportWithDecode.Close;

  if FL_ShowExcelAfterExport then
    XlApp.Visible := True;
end;

procedure TfrmGetPeriod.lcbMO_GROUPPropertiesChange(Sender: TObject);
begin
  acRefreshAll.Execute;
end;

procedure TfrmGetPeriod.miOstToExcelClick(Sender: TObject);
begin
  if sdExportOstTable.Execute then
  begin
    ExportGridToExcel(sdExportOstTable.FileName, grOST);
    ShellExecute( 0, PChar('open'), PChar(sdExportOstTable.FileName), nil, nil, SW_SHOWMAXIMIZED );
  end;
end;

procedure TfrmGetPeriod.ReplaceQuotesInCSV(aFileName:string);
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  SL.LoadFromFile(aFileName);
  SL.Text := StringReplace(SL.Text,'"""','"',[rfReplaceAll]);
  SL.SaveToFile(aFileName);
  SL.Free;
end;

procedure TfrmGetPeriod.acExportToCSVExecute(Sender: TObject);
begin
  if sdCSV.Execute then
  begin
    FL_ShowExcelAfterExport := False;
    acExportToExcel.Execute;
    FL_ShowExcelAfterExport := True;    
    XlApp.ActiveWorkbook.SaveAs(sdCSV.FileName, xlCSV);

    if not VarIsEmpty(XlApp) then begin   // We are connected with MsExcel
      XlApp.DisplayAlerts := False; // Discard unsaved changes
      XlApp.Quit; // Close MsExcel
      VarClear(XlApp);
    end;

    //Тут заменяем """ на "
    ReplaceQuotesInCSV(sdCSV.FileName);
  end;
end;

procedure TfrmGetPeriod.miLoadSpravClick(Sender: TObject);
var
  i, Col,Row : integer;
  sootv : array[CSV_Load_S2_Low..CSV_Load_S2_High] of integer;
  s : string;
  f : double;
begin
  XlApp  := CreateOleObject('Excel.Application'); // создаем объект эксель

  if VarType(XlApp) <> VarDispatch then
  begin  // If we are not connected with MsExcel
    ShowMessage('MS Excel is not installed');
    Exit;
  end;

//    XlApp.ActiveWorkbook.SaveAs(sdCSV.FileName, xlCSV);
  try
    if odCSV.Execute() then
    begin
      XlApp.Workbooks.Open(odCSV.FileName);
      i := Low(CSV_Load_S2);
      while (i <= High(CSV_Load_S2)) and (LowerCase(CSV_Load_S2[i]) = LowerCase(XlApp.ActiveSheet.Cells[ 1, i ].Value)) do
        inc( i );
      if (i > High(CSV_Load_S2))  then
      begin
         // отмечаем используемые поля
         for i := CSV_Load_S2_Low to CSV_Load_S2_High do
         begin
           if Pos(LowerCase('a.'+CSV_Load_S2[i]+', '), 'a.drugid, a.packnx, a.tradenmr, a.innr, a.mnfnm, a.drugfmnmrs, a.pack, a.segment, a.dosager, a.maxmnfprice, a.currencynm, a.mnfid, a.pckid, a.pcknm, a.ean, a.totdrugqn, ') > 0 then
             sootv[i] := 1
           else
             sootv[i] := 0;
         end;

         s := Self.Caption;
         if TMenuItem(Sender).Tag = 0 then
           oqClear_TPrice_monitor_base.Execute;
         self.Enabled := False;

         Row := 2;
         while (Trim(XlApp.ActiveSheet.Cells[ Row, 1 ].Value) <> '') do // бежим по экселю
         begin
           self.Caption := 'Обработано строк: '+IntToStr(Row);

           Application.ProcessMessages;
           oqIns_TPrice_monitor_base.ClearVariables;
           oqIns_TPrice_monitor_base.SetVariable( 'FL_ADD_AND_UPDATE', TMenuItem(Sender).Tag);

           for col := CSV_Load_S2_Low to CSV_Load_S2_High do
           begin
             if sootv[col] = 1 then  // инициализируем переменные
             begin
               case oqIns_TPrice_monitor_base.VariableType( oqIns_TPrice_monitor_base.VariableIndex(CSV_Load_S2[col]) ) of
                 otFloat :
                   if TryStrToFloat(StringReplace(XlApp.ActiveSheet.Cells[ Row, Col ].Value, '.', ',', [rfReplaceAll]), f)=True then
                     oqIns_TPrice_monitor_base.SetVariable( CSV_Load_S2[col], f)
                   else
                     oqIns_TPrice_monitor_base.SetVariable( CSV_Load_S2[col], null);
               else
                 oqIns_TPrice_monitor_base.SetVariable( CSV_Load_S2[col], XlApp.ActiveSheet.Cells[ Row, Col ].Value);
               end;
             end;
           end;

           oqIns_TPrice_monitor_base.SetVariable( 'segment', 2);   //Только госпитальный сегмент 


           try
             oqIns_TPrice_monitor_base.Execute; // вставляем
           except
             on E: EOracleError do
             begin
               os.Commit;
               if Application.MessageBox(PChar(E.Message+#13#10+'Row = '+IntToStr(Row)+#13#10+
                                               'DrugId = '+IntToStr(oqIns_TPrice_monitor_base.GetVariable('DrugId'))+#13#10+
                                               'packnx = '+IntToStr(oqIns_TPrice_monitor_base.GetVariable('packnx'))+#13#10+
                                               'tradenmr = '+String(oqIns_TPrice_monitor_base.GetVariable('tradenmr'))+#13#10+
                                               'Прервать загрузку?'),'ОШИБКА', MB_YESNO + MB_ICONERROR) = IDYES then
                 RaiseException(0, 0, 0, nil);
             end;
           end;
           
           if Row mod 1000 = 0 then
             os.Commit; // раз в тыщу строк делаем комит

           inc( Row );
         end;
         os.Commit;
         acRefreshAll.Execute;     
      end
      else
        Application.MessageBox('Неверный формат файла. Загрузка справочника не может быть выполнена','ОШИБКА', MB_OK+MB_ICONERROR);
    end;

  finally
    self.Enabled := True;
    self.Caption := S;
    if not VarIsEmpty(XlApp) then begin   // We are connected with MsExcel
      XlApp.DisplayAlerts := False; // Discard unsaved changes
      XlApp.Quit; // Close MsExcel
      VarClear(XlApp);
    end;
  end;
end;

procedure TfrmGetPeriod.mniTableBaseToExcelClick(Sender: TObject);
begin
  if sdExportOstTable.Execute then
  begin
    ExportGridToExcel(sdExportOstTable.FileName, grBase, False);
    ShellExecute( 0, PChar('open'), PChar(sdExportOstTable.FileName), nil, nil, SW_SHOWMAXIMIZED );
  end;
end;

procedure TfrmGetPeriod.grBaseDBTableViewOstCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
//  acBackOst.Enabled := False;
//  acCheckOst.Enabled := False;
end;

procedure TfrmGetPeriod.grBaseDBTableViewOstCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
//  acBackOst.Enabled := False;
//  acCheckOst.Enabled := False;
end;

procedure TfrmGetPeriod.grBaseDBTableViewCanSelectRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
//  acBackOst.Enabled := True;
//  acCheckOst.Enabled := True;
end;

procedure TfrmGetPeriod.grBaseDBTableViewCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
//  acBackOst.Enabled := True;
//  acCheckOst.Enabled := True;
end;

function TfrmGetPeriod.GetValueFromTSMini(ASection, AIdent, ADefault: string): string;
begin
  with oqPKG_SMINI do
  try
    ClearVariables;
    SetVariable('PSECTION', ASection );
    SetVariable('PIDENT', AIdent );
    SetVariable('PVALUE', null);
    SetVariable('PDEFAULT', ADefault );
    Execute;
    Result := GetVariable('PVALUE');
  except
    Result := ADefault;
  end;
end;

end.

