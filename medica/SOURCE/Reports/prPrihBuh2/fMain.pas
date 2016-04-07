unit fMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ActnList, ImgList,
  ComCtrls, ToolWin, Db, OracleData, Oracle, FR_DSet, FR_Class, FR_DBSet,
  DBCtrls, frXMLExl, frOLEExl, JvComponentBase, JvFormPlacement,
  JvExMask, JvToolEdit, OracleMonitor, Menus, JvAppStorage, JvAppIniStorage,
  JvStringHolder, cxGridDBTableView, Contnrs, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxSpinEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxGroupBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  JvExControls, JvArrowButton, cxCheckBox, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxLookAndFeelPainters, cxCalendar, frxClass, frxDBSet;
   
const
  FR2 = 'FR2';
  FR4 = 'FR4';

type
  TReportItem = class 
    FR_Type : string;
    RusName : string;
    EngSynonim : string;
    ReportFileName : string;
    cxGridDBTableView : TcxGridDBTableView;
    DataSet : TOracleDataset;
    Visible : boolean;

    constructor Create(aFR_Type, aRusName, aEngSynonim, aReportFileName: string; aDataSet : TOracleDataset; acxGridDBTableView: TcxGridDBTableView; aVisible: boolean = True);
  end;
  
  TfrmMain = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ilImages: TImageList;
    alActions: TActionList;
    FormStorage1: TJvFormStorage;
    aCancel: TAction;
    os: TOracleSession;
    odsPrihDocPoDOC: TOracleDataSet;
    frPrihDocPoMedic: TfrReport;
    odsPrihDocPoMedic: TOracleDataSet;
    odsGroupMo: TOracleDataSet;
    frPrihDocITOG: TfrReport;
    frPrihDocPoDOC: TfrReport;
    frPrihDocPoMedicType: TfrReport;
    odsPrihDocPoMedicType: TOracleDataSet;
    Button1: TButton;
    acPrint: TAction;
    odsNacenkaUcenka: TOracleDataSet;
    frDBNacenkaUcenka: TfrDBDataSet;
    odsUchGr: TOracleDataSet;
    oqInitMO: TOracleQuery;
    pmUchGr: TPopupMenu;
    miAllUchGr: TMenuItem;
    N2: TMenuItem;
    JvAppIniFileStorage1: TJvAppIniFileStorage;
    cxGrid1: TcxGrid;
    grViewPrihDocPoMedic: TcxGridDBTableView;
    grViewPrihDocPoMedicFN_PRICE_MASTER: TcxGridDBColumn;
    grViewPrihDocPoMedicFP_VIDMOVE: TcxGridDBColumn;
    grViewPrihDocPoMedicPOSTAVID: TcxGridDBColumn;
    grViewPrihDocPoMedicMOTOID: TcxGridDBColumn;
    grViewPrihDocPoMedicMOFROMID: TcxGridDBColumn;
    grViewPrihDocPoMedicFC_COMMENT: TcxGridDBColumn;
    grViewPrihDocPoMedicFP_VID: TcxGridDBColumn;
    grViewPrihDocPoMedicMOOWNERID: TcxGridDBColumn;
    grViewPrihDocPoMedicDPID: TcxGridDBColumn;
    grViewPrihDocPoMedicFC_DOC: TcxGridDBColumn;
    grViewPrihDocPoMedicDATA: TcxGridDBColumn;
    grViewPrihDocPoMedicFD_DATA: TcxGridDBColumn;
    grViewPrihDocPoMedicNAMEPOSTAV: TcxGridDBColumn;
    grViewPrihDocPoMedicDPID_1: TcxGridDBColumn;
    grViewPrihDocPoMedicDPCID: TcxGridDBColumn;
    grViewPrihDocPoMedicMEDICID: TcxGridDBColumn;
    grViewPrihDocPoMedicNAMEKART: TcxGridDBColumn;
    grViewPrihDocPoMedicFC_SERIAL: TcxGridDBColumn;
    grViewPrihDocPoMedicFC_EDIZM: TcxGridDBColumn;
    grViewPrihDocPoMedicFN_KOL: TcxGridDBColumn;
    grViewPrihDocPoMedicFN_PRICE_DETAIL: TcxGridDBColumn;
    grViewPrihDocPoMedicFN_SUMM: TcxGridDBColumn;
    grViewPrihDocPoMedicKARTID: TcxGridDBColumn;
    grViewPrihDocPoMedicFC_RANG_ORDER: TcxGridDBColumn;
    grViewPrihPost: TcxGridDBTableView;
    grViewPrihPostNAMEPOSTAV: TcxGridDBColumn;
    grViewPrihPostFN_PRICE: TcxGridDBColumn;
    grViewPrihPostRANG: TcxGridDBColumn;
    grViewPrihPostPOSTAVID: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dsGrid: TDataSource;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    tbuPrint: TToolButton;
    cxGroupBox2: TcxGroupBox;
    cmbReport: TcxComboBox;
    pmDocsFilterPeriod: TPopupMenu;
    miPeriodCurMonth: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N15: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    odsPrihPost: TOracleDataSet;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    grViewPrihDocPoDOC: TcxGridDBTableView;
    grViewPrihDocPoDOCFN_PRICE: TcxGridDBColumn;
    grViewPrihDocPoDOCFC_COMMENT: TcxGridDBColumn;
    grViewPrihDocPoDOCMOOWNERID: TcxGridDBColumn;
    grViewPrihDocPoDOCFC_DOC: TcxGridDBColumn;
    grViewPrihDocPoDOCDATA: TcxGridDBColumn;
    grViewPrihDocPoDOCFD_INVOICE: TcxGridDBColumn;
    grViewPrihDocPoDOCFC_KONTRAKT: TcxGridDBColumn;
    grViewPrihDocPoDOCFC_SCHET_FAKTURA: TcxGridDBColumn;
    grViewPrihDocPoDOCFC_NAME: TcxGridDBColumn;
    grViewPrihDocPoDOCFC_MO_GR_TO: TcxGridDBColumn;
    grViewPrihDocPoDOCNAMEPOSTAV: TcxGridDBColumn;
    grViewPrihDocPoDOCVIDDOC: TcxGridDBColumn;
    grViewPrihDocPoDOC_DPID: TcxGridDBColumn;
    acGridToExcel: TAction;
    sd: TSaveDialog;

    grViewPrihDocPoMedicType: TcxGridDBTableView;
    grViewPrihDocPoMedicTypeFN_PRICE_MASTER: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFP_VIDMOVE: TcxGridDBColumn;
    grViewPrihDocPoMedicTypePOSTAVID: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeMOTOID: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeMOFROMID: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFC_COMMENT: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFP_VID: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeMOOWNERID: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeDPID: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFC_DOC: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeDATA: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFD_DATA: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeNAMEPOSTAV: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeDPID_1: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeDPCID: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeMEDICID: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeNAMEKART: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFC_SERIAL: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFC_EDIZM: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFN_KOL: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFN_PRICE_DETAIL: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFN_SUMM: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeKARTID: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFC_MEDICTYPE: TcxGridDBColumn;
    tbuUchGrSep: TToolButton;
    tbuUchGrSelect: TToolButton;
    grViewPrihPostFC_RANG: TcxGridDBColumn;
    tbuRPO: TToolButton;
    chbRPO: TcxCheckBox;
    tbuMedicSep: TToolButton;
    odsPrihDocPoOneMedic: TOracleDataSet;
    grVIewPrihDocPoOneMedic: TcxGridDBTableView;
    grVIewPrihDocPoOneMedicFC_DOC: TcxGridDBColumn;
    grVIewPrihDocPoOneMedicFC_FINSOURCE: TcxGridDBColumn;
    grVIewPrihDocPoOneMedicFC_EDIZM: TcxGridDBColumn;
    grVIewPrihDocPoOneMedicFC_SERIAL: TcxGridDBColumn;
    grVIewPrihDocPoOneMedicFN_KOL: TcxGridDBColumn;
    grbMedic: TcxGroupBox;
    odsTMedic: TOracleDataSet;
    dsTMedic: TDataSource;
    lcbMedic: TcxLookupComboBox;
    frPrihDocPoOneMedic: TfrReport;
    grVIewPrihDocPoOneMedicFN_PRICE_DETAIL: TcxGridDBColumn;
    grVIewPrihDocPoOneMedicFN_SUMM: TcxGridDBColumn;
    ToolButton3: TToolButton;
    MainMenu1: TMainMenu;
    miPeriod: TMenuItem;
    miMO_GROUP: TMenuItem;
    grViewPrihApteka: TcxGridDBTableView;
    frPrihApteka: TfrReport;
    grViewPrihApteka_fd_date: TcxGridDBColumn;
    grViewPrihAptekafc_Postav: TcxGridDBColumn;
    grViewPrihAptekafc_schet: TcxGridDBColumn;
    grViewPrihAptekafc_UslPlat: TcxGridDBColumn;
    grViewPrihAptekafc_istfinans: TcxGridDBColumn;
    grViewPrihAptekafn_allmedics: TcxGridDBColumn;
    grViewPrihAptekafn_AngroMedics: TcxGridDBColumn;
    grViewPrihAptekafn_perevyazka: TcxGridDBColumn;
    grViewPrihAptekafn_nacenka: TcxGridDBColumn;
    grViewPrihAptekafn_itogo: TcxGridDBColumn;
    odsPrihApteka: TOracleDataSet;
    grVIewPrihDocPoOneMedicFD_INVOICE: TcxGridDBColumn;
    frPrihDocPoOneMedic2: TfrReport;
    frPrihDocPoMedicEk1: TfrReport;
    odsPrihDocPoMedicEk: TOracleDataSet;
    grViewPrihDocPoMedicEk: TcxGridDBTableView;
    grViewPrihDocPoMedicEkPOSTAVID: TcxGridDBColumn;
    grViewPrihDocPoMedicEkDPID: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_DOC_PARAM: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_DATA: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFD_DATA: TcxGridDBColumn;
    grViewPrihDocPoMedicEkNAMEPOSTAV: TcxGridDBColumn;
    grViewPrihDocPoMedicEkDPCID: TcxGridDBColumn;
    grViewPrihDocPoMedicEkMEDICID: TcxGridDBColumn;
    grViewPrihDocPoMedicEkNAMEKART: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_SERIAL: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_EDIZM: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_KOL: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFN_PRICE_DETAIL: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFN_SUMM: TcxGridDBColumn;
    grViewPrihDocPoMedicEkKARTID: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_KONTRAKT: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_FINSOURCE: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_PAYCOND: TcxGridDBColumn;
    grViewPrihDocPoMedicEkfc_invoice: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_GODEN: TcxGridDBColumn;
    grViewPrihDocPoMedicEkFC_SERT: TcxGridDBColumn;
    frPrihDocPoMedicEk2: TfrReport;
    oqPKG_SMINI: TOracleQuery;
    grViewPrihAptekafn_rashodnik: TcxGridDBColumn;
    odsPrihDocPoFinsource: TOracleDataSet;
    grViewPrihDocPoFinSource: TcxGridDBTableView;
    grViewPrihDocPoFinSourceFN_PRICE_MASTER: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFP_VIDMOVE: TcxGridDBColumn;
    grViewPrihDocPoFinSourcePOSTAVID: TcxGridDBColumn;
    grViewPrihDocPoFinSourceMOTOID: TcxGridDBColumn;
    grViewPrihDocPoFinSourceMOFROMID: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFC_COMMENT: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFP_VID: TcxGridDBColumn;
    grViewPrihDocPoFinSourceMOOWNERID: TcxGridDBColumn;
    grViewPrihDocPoFinSourceDPID: TcxGridDBColumn;
    grViewPrihDocPoFinSourceDATA: TcxGridDBColumn;
    grViewPrihDocPoFinSourceDPID_1: TcxGridDBColumn;
    grViewPrihDocPoFinSourceDPCID: TcxGridDBColumn;
    grViewPrihDocPoFinSourceMEDICID: TcxGridDBColumn;
    grViewPrihDocPoFinSourceNAMEKART: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFC_EDIZM: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFC_SERIAL: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFC_DOC: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFC_FINSOURCE: TcxGridDBColumn;
    grViewPrihDocPoFinSourceNAMEPOSTAV: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFN_KOL: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFN_PRICE_DETAIL: TcxGridDBColumn;
    grViewPrihDocPoFinSourceFN_SUMM: TcxGridDBColumn;
    grViewPrihDocPoFinSourceKARTID: TcxGridDBColumn;
    frPrihDocPoFinsource: TfrReport;
    grViewPrihDocPoDOCFC_FINSOURCE: TcxGridDBColumn;
    grViewPrihDocPoMedicFC_FINSOURCE: TcxGridDBColumn;
    grViewPrihDocPoMedicTypeFC_FINSOURCE: TcxGridDBColumn;
    frxPrihDocITOG: TfrxReport;
    frxDBReport1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxdsNacenkaUcenka: TfrxDBDataset;
    frxPrihDocPoDOC: TfrxReport;
    frxPrihDocPoMedic: TfrxReport;
    frxPrihDocPoMedicType: TfrxReport;
    frxPrihDocPoFinsource: TfrxReport;
    frxPrihDocPoOneMedic: TfrxReport;
    frxPrihApteka: TfrxReport;
    frxPrihDocPoOneMedic2: TfrxReport;
    frxPrihDocPoMedicEk1: TfrxReport;
    frxPrihDocPoMedicEk2: TfrxReport;

    procedure FormCreate(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure lcbCloseUp(Sender: TObject);
    procedure frReport1UserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: Variant);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acPrintExecute(Sender: TObject);
    procedure odsUchGrAfterOpen(DataSet: TDataSet);
    procedure miAllUchGrClick(Sender: TObject);
    procedure cmbReportPropertiesChange(Sender: TObject);
    procedure pmDocsFilterPeriodChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure miPeriodCurMonthClick(Sender: TObject);
    procedure dDate1Change(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure acGridToExcelExecute(Sender: TObject);
    procedure tbuUchGrSelectClick(Sender: TObject);
    procedure chbRPOClick(Sender: TObject);
    procedure lcbMedicPropertiesCloseUp(Sender: TObject);
    procedure miPeriodClick(Sender: TObject);
    procedure miMO_GROUPClick(Sender: TObject);
    procedure frReport1ObjectClick(View: TfrView);
    procedure frReport1MouseOverObject(View: TfrView; var Cursor: TCursor);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
    FUchGrID : Integer;
    FLang: array[0..KL_NAMELENGTH] of char; //Раскладка клавиатуры
    FDate1, FDate2 : TDateTime;
    FCurMOGroup : integer;
    FCurMOGroupName : string;

    procedure UploadToExcelType(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime);   
    procedure UploadToExcelFinSource(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime);
    procedure UploadToExcelMed(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime);

    procedure OnBeforeSelectReporProc;
    procedure OnBeforeOpenReportProc;
    procedure OnAfterShowReportProc;
    procedure SetMOGroup( aMOGroup : integer);
    function READSTRING_TSMINI(aFC_SECTION, aFC_KEY,
      aFC_DEFAULT_VALUE: string): string;
    function WRITESTRING_TSMINI(aFC_SECTION, aFC_KEY,
      aFC_VALUE: string): string;
  public
    { Public declarations }
    ReportsList : TObjectList;
    Report : TReportItem;
    IS_RPO : Integer;
    iniFileName : string;
    property CurMOGroup : integer read FCurMOGroup write SetMOGroup;
//    IS_KONTRAKT_SHOW, FUNC_SHOW_KONTRAKT : Integer;


  end;

var
  frmMain: TfrmMain;

implementation
uses
  {$IFNDEF OLD_AUTH} smMainAPI, {$ENDIF} uGlobal, 
  IniFiles, fdmPrintSelect, ComObj, Excel2000, uReportParams,
  cxGridExportLink, DateUtils, ShellAPI, fGetPeriod, fGetMOGroup,
  fr_view, fr_const, fr_utils;

{$R *.DFM}
//==============================================================================
 procedure SaveResToFile(AResName, AType, AFileName: String);
 var
  ResHandle: THandle;
  MemHandle: THandle;
  ResPtr   : Pointer;
  ResSize  : Integer;
  Stream   : TMemoryStream;
 begin
  ResHandle:=FindResource(hInstance, PChar(AResName), PChar(AType));
  MemHandle:=LoadResource(hInstance, ResHandle);
  ResPtr:=LockResource(MemHandle);
  ResSize:=SizeOfResource(hInstance, ResHandle);
  Stream:=TMemoryStream.Create;
  Stream.SetSize(ResSize);
  Stream.Write(ResPtr^, ResSize);
  Stream.SaveToFile(AFileName);
  FreeResource(MemHandle);
  Stream.Free;
 end;
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
//==============================================================================
{ TReportItem }
//==============================================================================
constructor TReportItem.Create(aFR_Type, aRusName, aEngSynonim, aReportFileName: string; aDataSet : TOracleDataset; acxGridDBTableView: TcxGridDBTableView; aVisible: boolean);
begin           
  FR_Type           := aFR_Type;
  RusName           := aRusName;
  EngSynonim        := aEngSynonim;
  ReportFileName    := aReportFileName;
  DataSet           := aDataSet;
  cxGridDBTableView := acxGridDBTableView;
  Visible           := aVisible;
end;
//==============================================================================
{ TfrmGetPeriod }
//==============================================================================
procedure TfrmMain.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.lcbCloseUp(Sender: TObject);
begin
//  lcbMO_GROUP.Hint := lcbMO_GROUP.Text;
//  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.frReport1UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: Variant);
var
	d : string;
begin
	if name = 'MYSTRTOFLOAT' then
	begin
		d := frParser.Calc(p1);
		val:=StringReplace(d,',', '.',[rfReplaceAll]);
	end;
end;

procedure TfrmMain.frxReport1GetValue(const VarName: string; var Value: Variant);
var
  sTemp : string;
begin
  if VarName = 'VAR_RECEIVER' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := Os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''CLIENT_NAME''';
      try
        Execute;
        Value := Field(0);
      except
        Value := '';
      end;
    finally
      Free;
    end;
  end;

 if VarName = 'FC_MEDIC' then
    Value := lcbMedic.Text;
  
  if VarName = 'VAR_MO_GROUP' then
    Value := FCurMOGroupName;

  if VarName = 'VAR_DATE1' then
    Value := DateToStr(FDate1);

  if VarName = 'VAR_DATE2' then
    Value := DateToStr(FDate2);

  if VarName = 'VAR_UCHR_NAME' then Value :=  READSTRING_TSMINI('MANAGER_DOC', 'CLIENT_NAME', '');

  if VarName = 'VAR_GLAV_VRACH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_VRACH', '');
    if sTemp = '' then
      Value := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_VRACH', '')
    else
      Value := sTemp;
  end;

  if VarName = 'VAR_ZAV_OTD' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_OTD', '');
    if sTemp = '' then
    begin
      with TOracleDataSet.Create(self) do
      begin
        Session := os;
        SQL.Text := 'SELECT MAX (asu.get_sotrname(asu.get_zavotdid(:aSotrID))) AS zav_fio FROM dual';
        DeclareAndSet('aSotrID',   otInteger, oqInitMO.GetVariable('PFK_SOTR_ID'));
        Open;
        sTemp := FieldByName('zav_fio').AsString;
        Free;
      end;
    end;
    Value := sTemp;
  end;  

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
end;

procedure TfrmMain.frReport1GetValue(const ParName: String; var ParValue: Variant);
var
  sTemp : string;
begin
  if ParName = 'var_receiver' then
  begin
    with TOracleQuery.Create(nil) do
    try
      Session := Os;
      Sql.Text := 'SELECT FC_VALUE FROM ASU.TSMINI WHERE FC_SECTION = ''MANAGER_DOC'' AND FC_KEY = ''CLIENT_NAME''';
      try
        Execute;
        ParValue := Field(0);
      except
        ParValue := '';
      end;
    finally
      Free;
    end;
  end; // if ParName = 'var_receiver' then

  if ParName = 'var_mo_group' then
    ParValue := FCurMOGroupName;


  if ParName = 'var_date1' then
    ParValue := DateToStr(FDate1);

  if ParName = 'var_date2' then
    ParValue := DateToStr(FDate2);

 if ParName = 'FC_MEDIC' then
    ParValue := lcbMedic.Text;


  if ParName = 'VAR_GLAV_BUH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_BUH', '');
    if sTemp = '' then
      ParValue := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_BUH', '')
    else
      ParValue := sTemp;
  end;

  if ParName = 'VAR_BUHGALTER' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'BUHGALTER', '');
    if sTemp = '' then
      ParValue := READSTRING_TSMINI('MANAGER_DOC', 'BUHGALTER', '')
    else
      ParValue := sTemp;
  end;

  if ParName = 'VAR_GLAV_VRACH' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'GLAV_VRACH', '');
    if sTemp = '' then
      ParValue := READSTRING_TSMINI('MANAGER_DOC', 'GLAV_VRACH', '')
    else
      ParValue := sTemp;
  end;

  if ParName = 'VAR_ZAV_APTEKA' then
  begin
    sTemp := IniReadString(iniFileName, 'MANAGER_DOC', 'VAR_ZAV_APTEKA', '');
    if sTemp = '' then
      ParValue := READSTRING_TSMINI('MANAGER_DOC', 'ZAV_APTEKA', '')
    else
      ParValue := sTemp;
  end;

//  Бухгалтер ___ Чернышева И.И.
end;

function TfrmMain.READSTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_DEFAULT_VALUE: string): string;
begin
  try
    oqPKG_SMINI.ClearVariables;
    oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
    oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
    oqPKG_SMINI.SetVariable('PDEFAULT', aFC_DEFAULT_VALUE);

    oqPKG_SMINI.Execute;
    Result := nvl(oqPKG_SMINI.GetVariable('PVALUE'), '');
  except
    Result := aFC_DEFAULT_VALUE;
  end;
end;

function TfrmMain.WRITESTRING_TSMINI(aFC_SECTION, aFC_KEY, aFC_VALUE: string): string;
begin
  oqPKG_SMINI.ClearVariables;
  oqPKG_SMINI.SetVariable('PSECTION', aFC_SECTION);
  oqPKG_SMINI.SetVariable('PIDENT',   aFC_KEY);
  oqPKG_SMINI.SetVariable('PVALUE',   aFC_VALUE);

  oqPKG_SMINI.Execute;
end;

procedure TfrmMain.frReport1MouseOverObject(View: TfrView; var Cursor: TCursor);
begin
  if (Report.EngSynonim = 'RepPrihPost')or
     (Report.EngSynonim = 'RepPrihDocPoDOC')or
     (Report.EngSynonim = 'RepPrihDocPoMedic')or
     (Report.EngSynonim = 'RepPrihDocPoMedicType')or
     (Report.EngSynonim = 'RepPrihDocPoFinSource') then
  begin
    if (View.Name = 'meGLAV_VRACH')or
       (View.Name = 'meGLAV_BUH')or
       (View.Name = 'meBUHGALTER')or
       (View.Name = 'meZAV_APTEKA') then
    begin
      Cursor := crHandPoint;
    end;
  end;
end;

procedure TfrmMain.frReport1ObjectClick(View: TfrView);
var
  vPos : Integer;
  s : string;
begin
  if (Report.EngSynonim = 'RepPrihPost')or
     (Report.EngSynonim = 'RepPrihDocPoDOC')or
     (Report.EngSynonim = 'RepPrihDocPoMedic')or
     (Report.EngSynonim = 'RepPrihDocPoMedicType')or
     (Report.EngSynonim = 'RepPrihDocPoFinSource') then
  begin
    if (View.Name = 'meGLAV_VRACH')or
       (View.Name = 'meGLAV_BUH')or
       (View.Name = 'meBUHGALTER')or
       (View.Name = 'meZAV_APTEKA') then
    begin
      View.FrameTyp := 15;
      View.FrameColor := clRed;
      vPos := frReport1.Preview.Window.VScrollBar.Position;
      frReport1.Preview.Zoom := frReport1.Preview.Zoom; //дабы перерисовался отчет
      frReport1.Preview.Window.VScrollBar.Position := vPos;
      try
        s := StringReplace(View.Memo.Text, #13#10, '', [rfReplaceAll]);
        if InputQuery('', 'Введите ФИО', s) then
        begin
          View.Memo.Text := s;

          if (View.Name = 'meGLAV_VRACH') then
            WRITESTRING_TSMINI('MANAGER_DOC', 'GLAV_VRACH', s);

          if (View.Name = 'meGLAV_BUH') then
            WRITESTRING_TSMINI('MANAGER_DOC', 'GLAV_BUH', s);

          if (View.Name = 'meBUHGALTER') then
            WRITESTRING_TSMINI('MANAGER_DOC', 'BUHGALTER', s);

          if (View.Name = 'meZAV_APTEKA') then
            WRITESTRING_TSMINI('MANAGER_DOC', 'ZAV_APTEKA', s);
        end;

      finally
        View.FrameTyp := 0;
        View.FrameColor := clWhite;
        vPos := frReport1.Preview.Window.VScrollBar.Position;
        frReport1.Preview.Zoom := frReport1.Preview.Zoom; //дабы перерисовался отчет
        frReport1.Preview.Window.VScrollBar.Position := vPos;
      end;
    end;
  end;
end;

function TfrmMain.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
Result := False;
  try
    // TODo Подумать насчет праметра  Command
    if Data = -1 then
      HtmlHelp(0, PChar('StMedsestra.chm'), HH_DISPLAY_TOPIC, 0)
    else
      HtmlHelp(0, PChar('StMedsestra.chm'), HH_HELP_CONTEXT, Data);
    CallHelp := False;
    Result := True;
  except
    on EConvertError do
      ShowMessage('Справка не найдена');
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IniWriteString(iniFileName,'Params', 'LastMOGroupID', IntToStr(FCurMOGroup));
  LoadKeyboardLayout(FLang, KLF_ACTIVATE);  
  Action := caFree;
end;

procedure TfrmMain.acPrintExecute(Sender: TObject);
var
  FileName : string;
  Excel: Variant;
  p :TPoint;

begin
  if cmbReport.ItemIndex = -1 then Exit;

  if Report.FR_Type <> FR4 then
  begin
    if dmPrintSelect.PrintFlag = 0 then
    begin
      P.X := 0;
      P.Y := tbuPrint.Height;
      P := tbuPrint.ClientToScreen(P);
      dmPrintSelect.pmPrintSelect.Popup(P.X, P.Y);
      Application.ProcessMessages; // только после этого срабатывает событие TdmPrintReports.miPrintToExcelClick(Sender: TObject);
    end;                           // и проставляется флаг - далее проверки на номер флага должны быть внутри каждой функции печати                                           
  end
  else
    dmPrintSelect.PrintFlag := 2;

  frDBDataSet1.DataSet := Report.DataSet;

  // Учет фильтрации на гриде
  if cxGrid1.ActiveView.DataController.Filter.FilterText <> '' then
  begin
    frDBDataSet1.DataSet.Filter := cxGrid1.ActiveView.DataController.Filter.FilterText;
    frDBDataSet1.DataSet.Filtered := True;
  end
  else begin
    frDBDataSet1.DataSet.Filter := '';
    frDBDataSet1.DataSet.Filtered := False;
  end;

  OnBeforeOpenReportProc();
  
  if Report.FR_Type = FR2 then
  begin
    if FileExists(TReportItem(cmbReport.ItemObject).ReportFileName) and (frReport1.LoadFromFile( TReportItem(cmbReport.ItemObject).ReportFileName ) = False) then
      frReport1.Clear;
  end;

  if Report.FR_Type = FR4 then
  begin
    if FileExists(TReportItem(cmbReport.ItemObject).ReportFileName) and (frxReport1.LoadFromFile( TReportItem(cmbReport.ItemObject).ReportFileName ) = False) then
      frxReport1.Clear;

    frxDBReport1.DataSet := Report.DataSet;  
  end;

  Report.DataSet.DisableControls;  
  if (Report.EngSynonim = 'RepPrihApteka') and (Report.FR_Type = FR2) then
   tfrBandView(frReport1.FindObject('MasterHeader1')).Prop['REPEATHEADER']:=  (dmPrintSelect.PrintFlag = 2);

  case dmPrintSelect.PrintFlag of // флаг куда печатать
    1:
    begin    
      if Report.FR_Type = FR2 then
      begin
        if (Report.EngSynonim = 'RepPrihDocPoMedic') or
           (Report.EngSynonim = 'RepPrihDocPoMedicType') or
           (Report.EngSynonim = 'RepPrihDocPoFinSource') then
        begin
          if Report.EngSynonim = 'RepPrihDocPoMedic' then
            UploadToExcelMed(Report.DataSet, FDate1, FDate2);

          if Report.EngSynonim = 'RepPrihDocPoMedicType' then
            UploadToExcelType(Report.DataSet, FDate1, FDate2);

          if Report.EngSynonim = 'RepPrihDocPoFinSource' then
            UploadToExcelFinSource(Report.DataSet, FDate1, FDate2);
        end
        else
        begin
          frReport1.FindObject('PageFooter1').Visible := false;
          frReport1.PrepareReport;
          FileName := PrepareFilePath(cmbReport.Text+' (c '+DateToStr(FDate1)+ ' по '+DateToStr(FDate2)+').xls');
          frReport1.ExportTo( dmPrintSelect.frOLEExcelExport1, FileName );
          Excel:=CreateOleObject('Excel.Application');
          Excel.Workbooks.Open(FileName);
          Excel.Visible:=True;
        end;
      end;
    end;

    2:
    begin 
      if Report.FR_Type = FR2 then
        frReport1.ShowReport;

      if Report.FR_Type = FR4 then 
        frxReport1.ShowReport;
     {
//        frReport1.ShowReport;
      frReport1.PrepareReport;
      pr := TfrPreview.Create(frReport1);
      CurReport := frReport1;
      MasterReport := frReport1;
      DocMode := dmPrinting;
      CurBand := nil;
//      if frReport1.EMFPages.Count = 0 then Exit;
      s := frLoadStr(SPreview);
//      if frActSpis.Title <> '' then s := s + ' - ' + frActSpis.Title;
      pr.Window.Caption := s;
      frReport1.Preview := pr;
      frReport1.Preview.Window.Show_Modal(frReport1);
      Application.ProcessMessages;
      frReport1.Preview.Window := nil;
      frReport1.Preview := nil;
      pr.Free;}
    end;
  end;

  Report.DataSet.EnableControls;
  OnAfterShowReportProc();
end;

procedure TfrmMain.UploadToExcelType(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime);
 function GetGroupRow(AText: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td class=xl297869 style=''border-top:none''>&nbsp;</td>'+
  ' <td colspan=9 class=xl427869 style=''border-left:none''>'+AText+' </td>'+
  '</tr>';
 end;

 function GetRow(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td class=xl307869 style=''border-top:none''>'+A1+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A2+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none;text-align:center''>'+A3+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none;text-align:center''>'+A4+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A5+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A6+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A7+' </td>'+
  ' <td class=xl307869 style=''border-top:none;border-left:none;text-align:right''>'+A8+' </td>'+
  ' <td class=xl307869 style=''border-top:none;border-left:none;text-align:right''>'+A9+' </td>'+
  ' <td class=xl307869 style=''border-top:none;border-left:none;text-align:right''>'+A10+' </td>'+
  '</tr>';
 end;

 function GetSum(A1, A2: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td colspan=8 class=xl417869 style=''border-right:.5pt solid black''>Итого по'+
  ' учетной группе &quot;'+A1+'&quot;</td>'+
  ' <td colspan=2 class=xl437869 style=''border-top:none;border-left:none;text-align:right''>'+A2+' </td>'+
  '</tr>';
 end;

var
 S, sGroup: String;
 nMain, nCount: Integer;
 sFileName1, sFileName2: String;
 Excel: Variant;
 nS: Double;
 nI: Double;
begin
 Screen.Cursor:=crHourGlass;

 S:='';
 sGroup:='';
 nMain:=0;
 nS:=0;
 nI:=0;
 nCount:=0;

  ADataSet.First;
  while not ADataSet.Eof do begin
   if ADataSet.FieldByName('fc_medictype').AsString<>sGroup then begin
    if S<>'' then begin
     S:=S+#13#10+GetSum(sGroup, CurrToStrF(nS, ffNumber, 2));
     nS:=0;
     Inc(nCount);
    end;

    sGroup:=ADataSet.FieldByName('fc_medictype').AsString;
    S:=S+#13#10+GetGroupRow(sGroup);
    Inc(nCount);
   end;

   Inc(nMain);
   S:=S+#13#10+GetRow(IntToStr(nMain),
                      ADataSet.FieldByName('namekart').AsString,
                      ADataSet.FieldByName('fc_edizm').AsString,
                      ADataSet.FieldByName('data').AsString,
                      ADataSet.FieldByName('fc_doc').AsString,
                      ADataSet.FieldByName('namepostav').AsString,   
                      ADataSet.FieldByName('fc_finsource').AsString,
                      ADataSet.FieldByName('fc_kol').AsString,
                      CurrToStrF(ADataSet.FieldByName('fn_price_detail').AsFloat, ffNumber, 2),
                      CurrToStrF(ADataSet.FieldByName('fn_summ').AsFloat, ffNumber, 2));
   Inc(nCount);

   nS:=nS+ADataSet.FieldByName('fn_summ').AsFloat;
   nI:=nI+ADataSet.FieldByName('fn_summ').AsFloat;

   ADataSet.Next;
  end;
  //ADataSet.Close;
  S:=S+#13#10+GetSum(sGroup, CurrToStrF(nS, ffNumber, 2));
  Inc(nCount);
// end;

 sFileName1:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'shablon.htm';
 SaveResToFile('shablontype', 'HTML', sFileName1);
 sFileName2:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'done.htm';

 with TStringList.Create do begin
  LoadFromFile(sFileName1);
  Text:=StringReplace(Text, '::REPLACEHERE::', S, [rfIgnoreCase]);
  Text:=StringReplace(Text, ':PDATE1', DateToStr(ADate1), [rfIgnoreCase]);
  Text:=StringReplace(Text, ':PDATE2', DateToStr(ADate2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::ITOG::', CurrToStrF(nI, ffNumber, 2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
  Text:=StringReplace(Text, '::UCHREJDENIE::', GetTSMINIValue( os, 'MANAGER_DOC', 'CLIENT_NAME' ), [rfIgnoreCase]);
  try
    SaveToFile(sFileName2);
  except
  end;
  Free;
 end;

 Excel:=CreateOleObject('Excel.Application');
 Excel.Workbooks.Open(sFileName2);
 Excel.Rows['12:'+IntToStr(12+nCount)].EntireRow.AutoFit;
 Excel.ActiveSheet.PageSetup.PrintTitleRows:='$10:$11';
 Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;
 Excel.ActiveSheet.PageSetup.Zoom := 90;
 Excel.Visible:=True;

 Screen.Cursor:=crDefault;
end;


procedure TfrmMain.UploadToExcelFinSource(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime);
 function GetGroupRow(AText: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td class=xl297869 style=''border-top:none''>&nbsp;</td>'+
  ' <td colspan=8 class=xl427869 style=''border-left:none''>'+AText+' </td>'+
  '</tr>';
 end;

 function GetRow(A1, A2, A3, A4, A5, A6, A7, A8, A9: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td class=xl307869 style=''border-top:none''>'+A1+' </td>'+
  ' <td class=xl307869 style=''border-top:none;border-left:none''>'+A2+' </td>'+
  ' <td class=xl317869 width=59 style=''border-top:none;border-left:none;'+
  ' width:44pt''>'+A3+' </td>'+
  ' <td class=xl307869 style=''border-top:none;border-left:none''>'+A4+' </td>'+
  ' <td class=xl317869 width=204 style=''border-top:none;border-left:none;'+
  ' width:153pt''>'+A5+' </td>'+
  ' <td class=xl307869 style=''border-top:none;border-left:none''>'+A6+' </td>'+
  ' <td class=xl307869 style=''border-top:none;border-left:none;text-align:right''>'+A7+' </td>'+
  ' <td class=xl307869 style=''border-top:none;border-left:none;text-align:right''>'+A8+' </td>'+
  ' <td class=xl307869 style=''border-top:none;border-left:none;text-align:right''>'+A9+' </td>'+
  '</tr>';
 end;

 function GetSum(A1, A2: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td colspan=7 class=xl417869 style=''border-right:.5pt solid black''>Итого по'+
  ' источнику финансирования &quot;'+A1+'&quot;</td>'+
  ' <td colspan=2 class=xl437869 style=''border-top:none;border-left:none;text-align:right''>'+A2+' </td>'+
  '</tr>';
 end;

var
 S, sGroup: String;
 nMain, nCount: Integer;
 sFileName1, sFileName2: String;
 Excel: Variant;
 nS: Double;
 nI: Double;
begin
 Screen.Cursor:=crHourGlass;

 S:='';
 sGroup:='';
 nMain:=0;
 nS:=0;
 nI:=0;
 nCount:=0;

  ADataSet.First;
  while not ADataSet.Eof do begin
   if ADataSet.FieldByName('fc_finsource').AsString<>sGroup then begin
    if S<>'' then begin
     S:=S+#13#10+GetSum(sGroup, CurrToStrF(nS, ffNumber, 2));
     nS:=0;
     Inc(nCount);
    end;

    sGroup:=ADataSet.FieldByName('fc_finsource').AsString;
    S:=S+#13#10+GetGroupRow(sGroup);
    Inc(nCount);
   end;

   Inc(nMain);
   S:=S+#13#10+GetRow(IntToStr(nMain),
                      ADataSet.FieldByName('namekart').AsString,
                      ADataSet.FieldByName('fc_edizm').AsString,
                      ADataSet.FieldByName('data').AsString,
                      ADataSet.FieldByName('fc_doc').AsString,
                      ADataSet.FieldByName('namepostav').AsString,
                      ADataSet.FieldByName('fc_kol').AsString,
                      CurrToStrF(ADataSet.FieldByName('fn_price_detail').AsFloat, ffNumber, 2),
                      CurrToStrF(ADataSet.FieldByName('fn_summ').AsFloat, ffNumber, 2));
   Inc(nCount);

   nS:=nS+ADataSet.FieldByName('fn_summ').AsFloat;
   nI:=nI+ADataSet.FieldByName('fn_summ').AsFloat;

   ADataSet.Next;
  end;
  ADataSet.Close;
  S:=S+#13#10+GetSum(sGroup, CurrToStrF(nS, ffNumber, 2));
  Inc(nCount);
// end;

 sFileName1:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'shablon.htm';
 SaveResToFile('shablontype', 'HTML', sFileName1);
 sFileName2:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'done.htm';

 with TStringList.Create do begin
  LoadFromFile(sFileName1);
  Text:=StringReplace(Text, '::REPLACEHERE::', S, [rfIgnoreCase]);
  Text:=StringReplace(Text, ':PDATE1', DateToStr(ADate1), [rfIgnoreCase]);
  Text:=StringReplace(Text, ':PDATE2', DateToStr(ADate2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::ITOG::', CurrToStrF(nI, ffNumber, 2), [rfIgnoreCase]);
  Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
  Text:=StringReplace(Text, '::UCHREJDENIE::', GetTSMINIValue( os, 'MANAGER_DOC', 'CLIENT_NAME' ), [rfIgnoreCase]);
  try
    SaveToFile(sFileName2);
  except
  end;
  Free;
 end;

 Excel:=CreateOleObject('Excel.Application');
 Excel.Workbooks.Open(sFileName2);
 Excel.Rows['12:'+IntToStr(12+nCount)].EntireRow.AutoFit;
 Excel.ActiveSheet.PageSetup.PrintTitleRows:='$10:$11';
 Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;
 Excel.ActiveSheet.PageSetup.Zoom := 91;  
 Excel.Visible:=True;

 Screen.Cursor:=crDefault;
end;

procedure TfrmMain.UploadToExcelMed(ADataSet: TOracleDataSet; ADate1, ADate2: TDateTime);

 procedure SaveResToFile(AResName, AType, AFileName: String);
 var
  ResHandle: THandle;
  MemHandle: THandle;
  ResPtr   : Pointer;
  ResSize  : Integer;
  Stream   : TMemoryStream;
 begin
  ResHandle:=FindResource(hInstance, PChar(AResName), PChar(AType));
  MemHandle:=LoadResource(hInstance, ResHandle);
  ResPtr:=LockResource(MemHandle);
  ResSize:=SizeOfResource(hInstance, ResHandle);
  Stream:=TMemoryStream.Create;
  Stream.SetSize(ResSize);
  Stream.Write(ResPtr^, ResSize);
  Stream.SaveToFile(AFileName);
  FreeResource(MemHandle);
  Stream.Free;
 end;

 function GetGroupRow(AText: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td class=xl307869 style=''border-top:none''>&nbsp;</td>'+
  ' <td colspan=11 class=xl347869 style=''border-right:.5pt solid black; border-left:none''>'+AText+' </td>'+
  '</tr>';
 end;

 function GetRow(A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td class=xl317869 style=''border-top:none''>'+A1+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A2+' </td>'+
  ' <td class=xl337869 width=151 style=''border-top:none;border-left:none; width:113pt''>'+A3+' </td>'+
  ' <td class=xl317869 style=''border-top:none;border-left:none''>'+A4+' </td>'+
  ' <td class=xl337869 width=271 style=''border-top:none;border-left:none; width:203pt''>'+A5+' </td>'+
  ' <td class=xl317869 width=61 style=''border-top:none;border-left:none; width:46pt''>'+A6+' </td>'+
  ' <td class=xl317869 width=80 style=''border-top:none;border-left:none; width:60pt''>'+A7+' </td>'+ 
  ' <td class=xl317869 width=90 style=''border-top:none;border-left:none; width:68pt''>'+A8+' </td>'+
  ' <td class=xl317869 width=64 style=''border-top:none;border-left:none;text-align:right; width:48pt''>'+A9+' </td>'+
  ' <td class=xl317869 width=90 style=''border-top:none;border-left:none;text-align:right; width:68pt''>'+A10+' </td>'+
  ' <td class=xl317869 width=90 style=''border-top:none;border-left:none;text-align:right; width:68pt''>'+A11+' </td>'+
  ' <td class=xl327869 width=97 style=''border-top:none;border-left:none;text-align:right; width:73pt''>'+A12+' </td>'+
  '</tr>';
 end;

 function GetSum(A1, A2: String): String;
 begin
  Result:=
  '<tr height=17 style=''height:12.75pt''>'+
  ' <td height=17 class=xl157869 style=''height:12.75pt''></td>'+
  ' <td colspan=10 class=xl377869 style=''border-right:.5pt solid black''>Итого по'+
  ' &quot;'+A1+'&quot;</td>'+
  ' <td colspan=2 class=xl407869 style=''border-right:.5pt solid black;border-left:'+
  ' none''>'+A2+' </td>'+
  '</tr>';
 end;

var
 S, sGroup, sDoc: String;
 bNewDoc: Boolean;
 nMain, nSub, nCount: Integer;
 sFileName1, sFileName2: String;
 Excel: Variant;
 nS: Double;
 nI: Double;
begin
 Screen.Cursor:=crHourGlass;

 S:='';
 sGroup:=''; sDoc:='';
 nMain:=0; nSub:=0;
 nS:=0;
 nI:=0;
 with ADataSet do begin
//  if Active then Close;
//  Open;
  First;
  nCount := ADataSet.RecordCount;
  while not Eof do begin
   if FieldByName('namepostav').AsString<>sGroup then begin
    if S<>'' then begin
     S:=S+#13#10+GetSum(sGroup, CurrToStrF(nS, ffNumber, 2));
     nS:=0;
     Inc(nCount);
    end;

    sGroup:=FieldByName('namepostav').AsString;
    S:=S+#13#10+GetGroupRow(sGroup);
    Inc(nCount);
   end;

   bNewDoc:=FieldByName('fc_doc').AsString<>sDoc;
   if bNewDoc then begin
    sDoc:=FieldByName('fc_doc').AsString;
    Inc(nMain);
    nSub:=0;
   end;

   Inc(nSub);

   if bNewDoc then
    S:=S+#13#10+GetRow(IntToStr(nMain),
                       FieldByName('data').AsString,
                       FieldByName('fc_doc').AsString,
                       IntToStr(nSub),
                       FieldByName('namekart').AsString,
                       FieldByName('fc_edizm').AsString,
                       FieldByName('fc_serial').AsString,
                       FieldByName('fc_finsource').AsString,
                       FieldByName('fc_kol').AsString,
                       CurrToStrF(FieldByName('fn_price_detail').AsFloat, ffNumber, 2),
                       CurrToStrF(FieldByName('fn_summ').AsFloat, ffNumber, 2),
                       CurrToStrF(FieldByName('fn_price_master').AsFloat, ffNumber, 2))
   else
    S:=S+#13#10+GetRow('',
                       '',
                       '',
                       IntToStr(nSub),
                       FieldByName('namekart').AsString,
                       FieldByName('fc_edizm').AsString,
                       FieldByName('fc_serial').AsString, 
                       FieldByName('fc_finsource').AsString,
                       FieldByName('fc_kol').AsString,
                       CurrToStrF(FieldByName('fn_price_detail').AsFloat, ffNumber, 2),
                       CurrToStrF(FieldByName('fn_summ').AsFloat, ffNumber, 2),
                       '');
   nS:=nS+FieldByName('fn_summ').AsFloat;
   nI:=nI+FieldByName('fn_summ').AsFloat;

   Next;
  end;
  //Close;
  S:=S+#13#10+GetSum(sGroup, CurrToStrF(nS, ffNumber, 2));
  Inc(nCount);
 end;

 sFileName1:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'shablon.htm';
 SaveResToFile('shablon', 'HTML', sFileName1);
 sFileName2:=IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'done.htm';

 with TStringList.Create do begin
  LoadFromFile(sFileName1);
  Text:=StringReplace(Text, '::REPLACEHERE::', S, [rfIgnoreCase]);
  Text:=StringReplace(Text, ':PDATE1', DateToStr(ADate1), [rfIgnoreCase]);
  Text:=StringReplace(Text, ':PDATE2', DateToStr(ADate2), [rfIgnoreCase]);

  Text:=StringReplace(Text, '::Otdelenie::',   odsGroupMo.FieldByName('FC_GROUP').AsString,        [rfIgnoreCase]);
  Text:=StringReplace(Text, '::UCHREJDENIE::', GetTSMINIValue( os, 'MANAGER_DOC', 'CLIENT_NAME' ), [rfIgnoreCase]);

  Text:=StringReplace(Text, '::ITOG::', CurrToStrF(nI, ffNumber, 2), [rfIgnoreCase]);
  try
    SaveToFile(sFileName2);
  except
  end;
  Free;
 end;

 Excel:=CreateOleObject('Excel.Application');
 Excel.Workbooks.Open(sFileName2);

 // выставляем перенос слов для столбца серийный номер
 Excel.Columns['H:H'].Select;
 Excel.Selection.WrapText := True;

 Excel.Range['A1:A1'].select;
 Excel.Rows['12:'+IntToStr(12+nCount)].EntireRow.AutoFit;
 Excel.ActiveSheet.PageSetup.PrintTitleRows:='$10:$11';
 Excel.ActiveSheet.PageSetup.Orientation:=xlLandscape;

 Excel.ActiveSheet.PageSetup.LeftMargin := 50;
 Excel.ActiveSheet.PageSetup.RightMargin := 27;
 Excel.ActiveSheet.PageSetup.TopMargin := 27;
 Excel.ActiveSheet.PageSetup.BottomMargin := 27;
 Excel.ActiveSheet.PageSetup.Zoom := 80;

  // выставляем перенос слов для столбца серийный номер
 Excel.Columns['H:H'].Select;
 Excel.Selection.WrapText := True;

 Excel.Range['C9'].Select; // ширина столбца дата
 Excel.Selection.ColumnWidth := 9.7;

 Excel.Range['A1:A1'].Select;
 Excel.Visible:=True;
 Screen.Cursor:=crDefault;

 Excel.Visible:=True;

 Screen.Cursor:=crDefault;
end;


procedure TfrmMain.odsUchGrAfterOpen(DataSet: TDataSet);
var
  mi : TMenuItem;
begin
  odsUchGr.First;
  while not odsUchGr.Eof do
  begin
    mi := TMenuItem.Create(pmUchGr);
    mi.Caption   := odsUchGr.FieldByName('FC_UCHGR').AsString;
    mi.Tag       := odsUchGr.FieldByName('UCHGRID').AsInteger;
    mi.AutoCheck := True;
    mi.Checked   := False;
    mi.RadioItem := True;
    mi.OnClick   := miAllUchGrClick;
    pmUchGr.Items.Add(mi);
    odsUchGr.Next;
  end;
end;

procedure TfrmMain.miAllUchGrClick(Sender: TObject);
begin
  pmUchGr.Tag := TMenuItem(Sender).Tag;
  FUchGrID := TMenuItem(Sender).Tag;
  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.cmbReportPropertiesChange(Sender: TObject);
begin
  if Assigned(Report) then
    Report.DataSet.Close;
  Report := TReportItem(cmbReport.ItemObject);
  if Assigned(Report) then
  begin
    dsGrid.DataSet := Report.DataSet;
    OnBeforeSelectReporProc();
    Report.DataSet.Open;
    cxGrid1Level1.GridView := Report.cxGridDBTableView;
  end;  
end;

procedure TfrmMain.pmDocsFilterPeriodChange(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
begin
//
end;

procedure TfrmMain.miPeriodCurMonthClick(Sender: TObject);
var
  Year, Month, Day : word;
  CurDate : TDateTime;
begin
  CurDate := oqInitMO.GetVariable('pSYSDATE');

  DecodeDate(CurDate, Year, Month, Day);
  case TMenuItem(sender).Tag of
    0:
    begin
      FDate1 := StartOfTheMonth(CurDate);
      FDate2 := EndOfTheMonth(CurDate)
    end;

    1..12:
    begin
      FDate1 := EncodeDate(Year, TMenuItem(sender).Tag, 1);
      FDate2 := EndOfTheMonth(FDate1);
    end;
  end;
end;

procedure TfrmMain.dDate1Change(Sender: TObject);
begin
  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var FK_APPSOTR_ID: integer;
  i : integer;
  AppExeName : string;
  UchGrIdStr : string;
begin
  try
    {$IFDEF OLD_AUTH}
      os.LogonUsername := 'ASU';
      os.LogonPassword := 'ASU';
      os.LogOn;
      if os.Connected = False then RaiseException(0,0,0,nil);
    {$ELSE}
      GetSession(os, 'ASU');
      if Application.Terminated then Exit;
    {$ENDIF}    
//    os.LogOn;
  except
    Application.MessageBox('Нет соединения с базой данных!','Ошибка',mb_ok + mb_iconerror);
    Application.Terminate;
    Abort;
  end;

  iniFileName := Application.ExeName+'.ini';


  if TryStrToInt(ParamStr(1), FK_APPSOTR_ID) = False then
    FK_APPSOTR_ID := -1;
  oqInitMO.SetVariable('PAPPSOTRID', FK_APPSOTR_ID);
  oqInitMO.Execute;
//  FUNC_SHOW_KONTRAKT := oqInitMO.GetVariable('pFUNC_SHOW_KONTRAKT');

  FCurMOGroup := -1;
  FCurMOGroupName := '';
  odsGroupMo.Close;
  odsGroupMo.Open;

  CurMOGroup := oqInitMO.GetVariable('NMO_GROUP');
  miMO_GROUP.Enabled := (oqInitMO.GetVariable('PFL_PROVIZOR') = 1);

  //Запоминаем текущюю раскладку
  GetKeyboardLayoutName(FLang);
  //Загружаем русскую раскладку клавиатуры
  LoadKeyboardLayout(PChar('00000419'), KLF_ACTIVATE);
  Self.Caption := Application.Title;

  FUchGrID := -1;
  odsUchGr.Open;

  // динамические отчеты - общий список
  ReportsList := TObjectList.Create(True);
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по приходу по поставщикам', 'RepPrihPost','PrihPost.frf', odsPrihPost, grViewPrihPost) );
  //ReportsList.Add( TReportItem.Create(FR2, 'Сопроводительный реестр по приходным документам (контракт, счет-фактура)', 'RepPrihDocPoDOC_kont_sf', 'frPrihDocPoDOC_kont_sf.frf', odsPrihDocPoDOC, grViewPrihDocPoDOC) );
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по приходу (документы)', 'RepPrihDocPoDOC', 'frPrihDocPoDOC.frf', odsPrihDocPoDOC, grViewPrihDocPoDOC) );
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по приходу (по объектам учета)','RepPrihDocPoMedic', 'frPrihDocPoMedic.frf', odsPrihDocPoMedic, grViewPrihDocPoMedic) );
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по приходу (по объекту учета)','RepPrihDocPoOneMedic', 'frPrihDocPoOneMedic.frf', odsPrihDocPoOneMedic, grVIewPrihDocPoOneMedic) );
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по приходу (по учетным группам)','RepPrihDocPoMedicType', 'frPrihDocPoMedicType.frf', odsPrihDocPoMedicType, grViewPrihDocPoMedicType) );
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по приходу (по источникам финансирования)','RepPrihDocPoFinSource', 'frPrihDocPoFinSource.frf', odsPrihDocPoFinsource, grViewPrihDocPoFinsource) );  //Added by Neronov A.S. 03.02.2012
  //ReportsList.Add( TReportItem.Create(FR2, 'Отчет по приходу товара в аптеку','RepPrihApteka', 'frPrihApteka.frf', odsPrihApteka, grViewPrihApteka) );
  //ReportsList.Add( TReportItem.Create(FR2, 'Справка. Поступление в аптеку','RepPrihDocPoOneMedic2', 'frPrihDocPoOneMedic2.frf', odsPrihDocPoOneMedic, grVIewPrihDocPoOneMedic) );

  //ReportsList.Add( TReportItem.Create(FR2, 'Приход с разбивкой по поставщикам','RepPrihDocPoMedicEk1', 'frPrihDocPoMedicEk1.frf', odsPrihDocPoMedicEk, grViewPrihDocPoMedicEk) );
  //ReportsList.Add( TReportItem.Create(FR2, 'Приход с разбивкой по поставщикам с суммой и котировкой','RepPrihDocPoMedicEk2', 'frPrihDocPoMedicEk2.frf', odsPrihDocPoMedicEk, grViewPrihDocPoMedicEk) );

  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по приходу по поставщикам', 'RepPrihPost','PrihPost.fr3', odsPrihPost, grViewPrihPost) );
  ReportsList.Add( TReportItem.Create(FR4, 'Сопроводительный реестр по приходным документам (контракт, счет-фактура)', 'RepPrihDocPoDOC_kont_sf', 'frPrihDocPoDOC_kont_sf.fr3', odsPrihDocPoDOC, grViewPrihDocPoDOC) );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по приходу (документы)', 'RepPrihDocPoDOC', 'frPrihDocPoDOC.fr3', odsPrihDocPoDOC, grViewPrihDocPoDOC) );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по приходу (по объектам учета)','RepPrihDocPoMedic', 'frPrihDocPoMedic.fr3', odsPrihDocPoMedic, grViewPrihDocPoMedic) );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по приходу (по объекту учета)','RepPrihDocPoOneMedic', 'frPrihDocPoOneMedic.fr3', odsPrihDocPoOneMedic, grVIewPrihDocPoOneMedic) );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по приходу (по учетным группам)','RepPrihDocPoMedicType', 'frPrihDocPoMedicType.fr3', odsPrihDocPoMedicType, grViewPrihDocPoMedicType) );
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по приходу (по источникам финансирования)','RepPrihDocPoFinSource', 'frPrihDocPoFinSource.fr3', odsPrihDocPoFinsource, grViewPrihDocPoFinsource) );  //Added by Neronov A.S. 03.02.2012
  ReportsList.Add( TReportItem.Create(FR4, 'Отчет по приходу товара в аптеку','RepPrihApteka', 'frPrihApteka.fr3', odsPrihApteka, grViewPrihApteka) );
  ReportsList.Add( TReportItem.Create(FR4, 'Справка. Поступление в аптеку','RepPrihDocPoOneMedic2', 'frPrihDocPoOneMedic2.fr3', odsPrihDocPoOneMedic, grVIewPrihDocPoOneMedic) );

  ReportsList.Add( TReportItem.Create(FR4, 'Приход с разбивкой по поставщикам','RepPrihDocPoMedicEk1', 'frPrihDocPoMedicEk1.fr3', odsPrihDocPoMedicEk, grViewPrihDocPoMedicEk) );
  ReportsList.Add( TReportItem.Create(FR4, 'Приход с разбивкой по поставщикам с суммой и котировкой','RepPrihDocPoMedicEk2', 'frPrihDocPoMedicEk2.fr3', odsPrihDocPoMedicEk, grViewPrihDocPoMedicEk) );


  AppExeName :=  ExtractFileName(Application.ExeName);

  {$IFDEF OLD_AUTH}
    chbRPO.Tag :=  uGlobal.DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID, AppExeName+'_RPO');
  {$ELSE}
    chbRPO.Tag := DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID, AppExeName+'_RPO');
  {$ENDIF}

  chbRPO.Visible := (chbRPO.Tag > 0);
  chbRPO.Enabled := chbRPO.Visible;
  tbuRPO.Visible := chbRPO.Visible;

  cmbReport.Properties.Items.Clear;  // выбираем только те, что видимые
  for i := 0 to ReportsList.Count - 1 do
  begin
  {$IFDEF OLD_AUTH}
    TReportItem(ReportsList[i]).Visible := (uGlobal.DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID, AppExeName+'_' + TReportItem(ReportsList[i]).EngSynonim) > 0);
  {$ELSE}
    TReportItem(ReportsList[i]).Visible := (DO_CHECK_OBJECT_ACCESS(os, FK_APPSOTR_ID, AppExeName+'_' + TReportItem(ReportsList[i]).EngSynonim) > 0);
  {$ENDIF}
    if TReportItem(ReportsList[i]).Visible then
      cmbReport.Properties.Items.AddObject( TReportItem(ReportsList[i]).RusName, ReportsList[i] );
  end;

  FDate1 := StartOfTheMonth(oqInitMO.GetVariable('pSYSDATE'));
  FDate2 := EndOfTheMonth  (oqInitMO.GetVariable('pSYSDATE'));
  miPeriod.Caption := 'Период: c '+DateToStr(FDate1)+' по '+DateToStr(FDate2);

  // для учета изменения учетных групп FUNC_USE_MEDUCHGRP_CH    
  if READSTRING_TSMINI('MEDICA.EXE','FUNC_USE_MEDUCHGRP_CH','0')='1' then
    UchGrIdStr := 'nvl ( TKART.UCHGRID, TMEDIC.UCHGRID ) '
  else
    UchGrIdStr := 'TMEDIC.UCHGRID';                                                          

  odsPrihDocPoMedicType.SQL.Text := StringReplace(odsPrihDocPoMedicType.SQL.Text,'#uchgrid#',
      UchGrIdStr , [rfReplaceAll, rfIgnoreCase] );
  odsPrihDocPoFinsource.SQL.Text := StringReplace(odsPrihDocPoFinsource.SQL.Text,'#uchgrid#',
      UchGrIdStr , [rfReplaceAll, rfIgnoreCase] );
end;

procedure TfrmMain.OnBeforeOpenReportProc;
begin
  if Report.EngSynonim = 'RepPrihPost' then
  begin
    odsNacenkaUcenka.Close;
    odsNacenkaUcenka.SetVariable('IS_RPO', IS_RPO);
    if IS_RPO = 1 then
    begin
//      odsNacenkaUcenka.SetVariable('MOGROUPID', CurMOGroup);
      odsNacenkaUcenka.SetVariable('date1', FDate1);
      odsNacenkaUcenka.SetVariable('date2', FDate2);
      odsNacenkaUcenka.Close;
      odsNacenkaUcenka.Open;
    end;
  end;
end;

procedure TfrmMain.OnAfterShowReportProc;
begin
  dmPrintSelect.PrintFlag := 0;
end;

procedure TfrmMain.OnBeforeSelectReporProc;
begin
  FUchGrID := -1;

  if Report.EngSynonim = 'RepPrihPost' then
  begin
    odsPrihPost.SetVariable('MO_GROUP',  CurMOGroup);
    odsPrihPost.SetVariable('adata1',    FDate1);
    odsPrihPost.SetVariable('adata2',    FDate2);
    odsPrihPost.SetVariable('IS_RPO',    IS_RPO);
  end;

  if Report.EngSynonim = 'RepPrihDocPoDOC_kont_sf' then
  begin
    grViewPrihDocPoDOCFC_KONTRAKT.Visible := True;
    grViewPrihDocPoDOCFC_SCHET_FAKTURA.Visible := True;
    odsPrihDocPoDOC.SetVariable('MO_GROUP',  CurMOGroup);
    odsPrihDocPoDOC.SetVariable('adata1',    FDate1);
    odsPrihDocPoDOC.SetVariable('adata2',    FDate2);
    odsPrihDocPoDOC.SetVariable('IS_RPO',    IS_RPO);
  end;

  if Report.EngSynonim = 'RepPrihDocPoDOC' then
  begin
    grViewPrihDocPoDOCFC_KONTRAKT.Visible := False;
    grViewPrihDocPoDOCFC_SCHET_FAKTURA.Visible := False;
    odsPrihDocPoDOC.SetVariable('MO_GROUP',  CurMOGroup);
    odsPrihDocPoDOC.SetVariable('adata1',    FDate1);
    odsPrihDocPoDOC.SetVariable('adata2',    FDate2);
    odsPrihDocPoDOC.SetVariable('IS_RPO',    IS_RPO);
  end;

  if Report.EngSynonim = 'RepPrihDocPoMedic' then
  begin
    odsPrihDocPoMedic.SetVariable('MO_GROUP', CurMOGroup);
    odsPrihDocPoMedic.SetVariable('PADATA1',  FDate1);
    odsPrihDocPoMedic.SetVariable('PADATA2',  FDate2);
    odsPrihDocPoMedic.SetVariable('IS_RPO',   IS_RPO);
  end;

  odsTMedic.Close;
  grbMedic.Hide;
  tbuMedicSep.Hide;
  if (Report.EngSynonim = 'RepPrihDocPoOneMedic' ) or
     (Report.EngSynonim = 'RepPrihDocPoOneMedic2')then
  begin
    tbuMedicSep.Show;
    odsTMedic.Open;
    grbMedic.Show;

    odsPrihDocPoOneMedic.SetVariable('MO_GROUP', CurMOGroup);
    odsPrihDocPoOneMedic.SetVariable('PADATA1',  FDate1);
    odsPrihDocPoOneMedic.SetVariable('PADATA2',  FDate2);
    odsPrihDocPoOneMedic.SetVariable('IS_RPO',   IS_RPO);
    odsPrihDocPoOneMedic.SetVariable('pMEDICID', lcbMedic.EditValue);

    grVIewPrihDocPoOneMedicFD_INVOICE.Visible := Report.EngSynonim = 'RepPrihDocPoOneMedic2';
    grVIewPrihDocPoOneMedicFD_INVOICE.VisibleForCustomization := grVIewPrihDocPoOneMedicFD_INVOICE.Visible;    
  end;

  tbuUchGrSelect.Visible := (Report.EngSynonim = 'RepPrihDocPoMedicType');
  tbuUchGrSep.Visible := tbuUchGrSelect.Visible;
  tbuUchGrSelect.Enabled := tbuUchGrSelect.Visible;
  if Report.EngSynonim = 'RepPrihDocPoMedicType' then
  begin
    FUchGrID := pmUchGr.Tag;
    odsPrihDocPoMedicType.SetVariable('MO_GROUP', CurMOGroup);
    odsPrihDocPoMedicType.SetVariable('PADATA1',  FDate1);
    odsPrihDocPoMedicType.SetVariable('PADATA2',  FDate2);
    odsPrihDocPoMedicType.SetVariable('IS_RPO',   IS_RPO);
    odsPrihDocPoMedicType.SetVariable('PUCHGR',   FUchGrID);
  end;

  if Report.EngSynonim = 'RepPrihDocPoFinSource' then
  begin
    odsPrihDocPoFinsource.SetVariable('MO_GROUP', CurMOGroup);
    odsPrihDocPoFinsource.SetVariable('PADATA1',  FDate1);
    odsPrihDocPoFinsource.SetVariable('PADATA2',  FDate2);
    odsPrihDocPoFinsource.SetVariable('IS_RPO',   IS_RPO);
  end;

  if Report.EngSynonim = 'RepPrihApteka' then
  begin
    odsPrihApteka.SetVariable('MO_GROUP',  CurMOGroup);
    odsPrihApteka.SetVariable('adata1',    FDate1);
    odsPrihApteka.SetVariable('adata2',    FDate2);
    odsPrihApteka.SetVariable('IS_RPO',    IS_RPO);
  end;

  if (Report.EngSynonim = 'RepPrihDocPoMedicEk1') or (Report.EngSynonim = 'RepPrihDocPoMedicEk2') then
  begin
    odsPrihDocPoMedicEk.SetVariable('MO_GROUP',  CurMOGroup);
    odsPrihDocPoMedicEk.SetVariable('padata1',    FDate1);
    odsPrihDocPoMedicEk.SetVariable('padata2',    FDate2);

    grViewPrihDocPoMedicEkFN_PRICE_DETAIL.Visible                 := Report.EngSynonim = 'RepPrihDocPoMedicEk2';
    grViewPrihDocPoMedicEkFN_PRICE_DETAIL.VisibleForCustomization := grViewPrihDocPoMedicEkFN_PRICE_DETAIL.Visible;

    grViewPrihDocPoMedicEkFN_SUMM.Visible                 := Report.EngSynonim = 'RepPrihDocPoMedicEk2';
    grViewPrihDocPoMedicEkFN_SUMM.VisibleForCustomization := grViewPrihDocPoMedicEkFN_SUMM.Visible;
  end;
end;

procedure TfrmMain.acGridToExcelExecute(Sender: TObject);
begin
  sd.FileName := cmbReport.Text+' (c '+DateToStr(FDate1)+' по '+DateToStr(FDate2)+')';
  if sd.Execute then
  begin
    ExportGridToExcel(sd.FileName,cxGrid1);
    if Application.MessageBox('Открыть сохраненный документ?', 'Подтверждение', MB_YESNO+MB_ICONQUESTION) = IDYES	then
      ShellExecute( 0, PChar('open'), PChar(sd.FileName), nil, nil, SW_SHOWMAXIMIZED );
  end;
end;

procedure TfrmMain.tbuUchGrSelectClick(Sender: TObject);
var
  p : TPoint;
begin
  p.X := 0;
  p.Y := tbuUchGrSelect.Height;
  p := tbuUchGrSelect.ClientToScreen(p);
  TToolButton(Sender).DropdownMenu.Popup(p.x, p.Y);
end;

procedure TfrmMain.chbRPOClick(Sender: TObject);
begin
  if chbRPO.Checked then
    IS_RPO := 1
  else
    IS_RPO := 0;
  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.lcbMedicPropertiesCloseUp(Sender: TObject);
begin
  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.miPeriodClick(Sender: TObject);
begin
  ShowPeriod(Mouse.CursorPos.X, Mouse.CursorPos.Y, oqInitMO.GetVariable('pSYSDATE'),  FDate1, FDate2 );
  miPeriod.Caption := 'Период: c '+DateToStr(FDate1)+' по '+DateToStr(FDate2);
  cmbReportPropertiesChange(nil);
end;

procedure TfrmMain.miMO_GROUPClick(Sender: TObject);
begin
  if ShowMoGROUP(Mouse.CursorPos.X, Mouse.CursorPos.Y, odsGroupMo, FCurMOGroup, FCurMOGroupName ) = mrOK then
  begin
    miMO_GROUP.Caption := 'Группа мат. отв.: '+FCurMOGroupName;
    cmbReportPropertiesChange(nil);
  end;
end;

procedure TfrmMain.SetMOGroup( aMOGroup : integer);
begin
  if odsGroupMo.Locate('GROUPID', aMOGroup, []) then
  begin
    FCurMOGroup := aMOGroup;
    FCurMOGroupName := odsGroupMo.FieldByName('FC_GROUP').AsString;
    miMO_GROUP.Caption := 'Группа мат. отв.: '+FCurMOGroupName;
  end;
end;

end.

